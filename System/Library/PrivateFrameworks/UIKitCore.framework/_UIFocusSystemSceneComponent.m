@interface _UIFocusSystemSceneComponent
+ (BOOL)__applicationIsSpringBoard;
+ (BOOL)_supportsInvalidatingFocusCache;
+ (BOOL)needsFocusSystem;
+ (id)_screenForScene:(id)a3;
+ (id)sceneComponentForEnvironment:(id)a3;
+ (id)sceneComponentForFocusSystem:(id)a3;
- (BOOL)_focusSystem:(id)a3 handleFailedMovementRequest:(id)a4;
- (BOOL)_focusSystem:(id)a3 isScrollingScrollableContainer:(id)a4 targetContentOffset:(CGPoint *)a5;
- (BOOL)_focusSystem:(id)a3 shouldRestoreFocusInContext:(id)a4;
- (BOOL)_focusSystem:(id)a3 shouldReverseLayoutDirectionForEnvironment:(id)a4;
- (BOOL)_focusSystem:(id)a3 shouldReverseLinearWrappingForEnvironment:(id)a4;
- (BOOL)_focusSystemExplicitlyDisabledForBehavior:(id)a3;
- (BOOL)_isSceneActive;
- (BOOL)_shouldForwardFocusMovementRequest:(id)a3;
- (BOOL)_shouldWaitForFocusMovementActionToEnableFocusSystem:(id)a3;
- (BOOL)_uiktest_allowsForwardingFocusMovementActions;
- (BOOL)isOverrideFocusSystemEnabled;
- (CGRect)_clippingRectForFocusSystem:(id)a3 inCoordinateSpace:(id)a4;
- (NSPointerArray)preferredFocusEnvironmentOverride;
- (NSString)description;
- (UICoordinateSpace)coordinateSpace;
- (UIFocusSystem)focusSystem;
- (UIScene)_scene;
- (UITraitCollection)_traitOverrides;
- (UIWindowScene)_windowScene;
- (_UIFocusActiveSceneObserver)activeSceneObserver;
- (_UIFocusAnimationCoordinatorManager)focusAnimationCoordinatorManager;
- (_UIFocusDebugWindow)debugWindow;
- (_UIFocusEffectManager)_focusEffectManager;
- (_UIFocusEventDelivery)_eventDelivery;
- (_UIFocusGameControllerObserver)gameControllerObserver;
- (_UIFocusHapticFeedbackGenerator)hapticFeedbackGenerator;
- (_UIFocusHardwareKeyboardObserver)hardwareKeyboardObserver;
- (_UIFocusItemFrameReporter)_focusItemFrameReporter;
- (_UIFocusScrollManager)scrollManager;
- (_UIFocusSoundGenerator)soundGenerator;
- (_UIFocusSystemSceneComponent)initWithScene:(id)a3;
- (id)_focusBehaviorRespectingApplicationOverride:(BOOL)a3;
- (id)_overridingPreferredFocusEnvironment;
- (id)_preferredFocusEnvironmentsForFocusSystem:(id)a3;
- (id)_syncResponderWithFocusUpdateContext:(id)a3;
- (id)_topEnvironmentForFocusSystem:(id)a3;
- (id)_windowsForFocusSearch;
- (void)_adjustFocusSystemAvailability;
- (void)_adjustFocusSystemAvailabilityUpdatingTraits:(BOOL)a3;
- (void)_delayedSetupFocusDebugWindow;
- (void)_firstResponderDidUpdateFromResponder:(id)a3;
- (void)_focusBehaviorDidChange:(id)a3;
- (void)_focusSystem:(id)a3 didFinishUpdatingFocusInContext:(id)a4;
- (void)_focusSystem:(id)a3 didUpdateFocusInContext:(id)a4;
- (void)_focusSystem:(id)a3 environment:(id)a4 didUpdateFocusInContext:(id)a5;
- (void)_focusSystem:(id)a3 willMessageNewFocusNodes:(id)a4;
- (void)_focusSystem:(id)a3 willMessageOldFocusNodes:(id)a4;
- (void)_focusSystem:(id)a3 willUpdateFocusInContext:(id)a4;
- (void)_notifyDidPerformFocusSystemInitialSetup;
- (void)_requestFocusEffectUpdateToEnvironment:(id)a3;
- (void)_resetFocusEventRecognizers;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)_setupFocusSystem;
- (void)_tearDownFocusSystem;
- (void)_updateDeviceCapabilityObserver;
- (void)_updateFocusEffectForItem:(id)a3;
- (void)_updateFocusSystemCapabilities;
- (void)_updateFocusSystemState;
- (void)_updateWantsModernRing;
- (void)_validateFocusedItemForFirstResponder:(id)a3;
- (void)pushPreferredFocusEnvironmentOverride:(id)a3;
- (void)removePreferredFocusEnvironmentOverride:(id)a3;
- (void)setFocusSystem:(id)a3;
- (void)setHapticFeedbackGenerator:(id)a3;
- (void)setOverrideFocusSystemEnabled:(BOOL)a3 withIdentifier:(id)a4;
- (void)setSoundGenerator:(id)a3;
- (void)set_focusItemFrameReporter:(id)a3;
@end

@implementation _UIFocusSystemSceneComponent

- (_UIFocusScrollManager)scrollManager
{
  return self->_scrollManager;
}

+ (id)sceneComponentForEnvironment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 sceneComponentForFocusSystem:v4];
LABEL_5:
    v6 = v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    goto LABEL_5;
  }
  v7 = _UIFocusEnvironmentContainingView(v4);
  v8 = [v7 _window];
  v9 = [v8 windowScene];
  v6 = [v9 _focusSystemSceneComponent];
  if (!v6) {
    os_variant_has_internal_diagnostics();
  }

LABEL_9:
  return v6;
}

- (UIFocusSystem)focusSystem
{
  return self->_focusSystem;
}

- (void)_firstResponderDidUpdateFromResponder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[UIResponder _currentChangeIntent] != 1)
  {
    id v5 = [(_UIFocusSystemSceneComponent *)self focusSystem];
    v6 = [v5 behavior];

    if ([v6 syncsFocusAndResponder])
    {
      v28 = v6;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = +[UIFocusSystem _allFocusSystems];
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v31 != v9) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(id *)(*((void *)&v30 + 1) + 8 * i);
            v12 = [v11 _hostFocusSystem];

            if (v12)
            {
              do
              {
                v13 = [v11 _hostFocusSystem];

                v14 = [v13 _hostFocusSystem];

                id v11 = v13;
              }
              while (v14);
            }
            else
            {
              v13 = v11;
            }
            v15 = [(_UIFocusSystemSceneComponent *)self focusSystem];

            if (v13 == v15)
            {
              v16 = +[UIWindow _applicationKeyWindow];
              v17 = [v16 firstResponder];

              v18 = _UIFocusEnvironmentSafeCast(v17);
              if (v4)
              {
                v19 = _UIFocusEnvironmentSafeCast(v4);
                if (v19) {
                  int v20 = [v13 _focusedItemIsContainedInEnvironment:v4 includeSelf:1] ^ 1;
                }
                else {
                  int v20 = 1;
                }
              }
              else
              {
                int v20 = 0;
              }
              if (!v18)
              {
                if (v17) {
                  char v26 = 0;
                }
                else {
                  char v26 = v20;
                }
                if (v26)
                {
                  v18 = 0;
                }
                else
                {
                  v27 = [(_UIFocusSystemSceneComponent *)self focusSystem];
                  [v27 _updateFocusImmediatelyToEnvironment:0];

LABEL_35:
                }

                goto LABEL_37;
              }
              int v21 = [v13 _focusedItemIsContainedInEnvironment:v18 includeSelf:1];
              if (v17) {
                int v22 = v21;
              }
              else {
                int v22 = 1;
              }
              if (v20 & v22) {
                goto LABEL_35;
              }
              v23 = [(_UIFocusSystemSceneComponent *)self focusSystem];
              v24 = [v23 focusedItem];

              if (v24 == v18) {
                goto LABEL_35;
              }
              v25 = [(_UIFocusSystemSceneComponent *)self focusSystem];
              [v25 _updateFocusImmediatelyToEnvironment:v18];
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_37:

      v6 = v28;
    }
  }
}

- (void)_requestFocusEffectUpdateToEnvironment:(id)a3
{
  id v4 = a3;
  id v7 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  int v5 = [v7 _focusedItemIsContainedInEnvironment:v4 includeSelf:1];

  if (v5)
  {
    v6 = [v7 focusedItem];
    [(_UIFocusSystemSceneComponent *)self _updateFocusEffectForItem:v6];
  }
}

- (void)_adjustFocusSystemAvailabilityUpdatingTraits:(BOOL)a3
{
  BOOL v3 = a3;
  id v16 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  int v5 = [(_UIFocusSystemSceneComponent *)self _focusBehaviorRespectingApplicationOverride:1];
  hardwareKeyboardObserver = self->_hardwareKeyboardObserver;
  if (hardwareKeyboardObserver)
  {
    BOOL v7 = [(_UIFocusHardwareKeyboardObserver *)hardwareKeyboardObserver isActive];
    gameControllerObserver = self->_gameControllerObserver;
    if (gameControllerObserver)
    {
LABEL_3:
      BOOL v9 = [(_UIFocusGameControllerObserver *)gameControllerObserver isActive];
      goto LABEL_6;
    }
  }
  else
  {
    gameControllerObserver = self->_gameControllerObserver;
    BOOL v7 = gameControllerObserver == 0;
    if (gameControllerObserver) {
      goto LABEL_3;
    }
  }
  BOOL v9 = 0;
LABEL_6:
  if (v16) {
    int v10 = objc_msgSend(v5, "wantsFocusSystemForScene:");
  }
  else {
    int v10 = 0;
  }
  int v11 = v7 || v9;
  focusSystem = self->_focusSystem;
  int v13 = v10 & v11;
  if (!focusSystem || (v13 & 1) != 0)
  {
    if (focusSystem) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    if (v14 == 1)
    {
      [(_UIFocusSystemSceneComponent *)self _setupFocusSystem];
      if (v3)
      {
LABEL_24:
        [v16 _componentDidUpdateTraitOverrides:self];
        if (focusSystem) {
          goto LABEL_28;
        }
        goto LABEL_25;
      }
    }
    else if (v13)
    {
      [(_UIFocusSystemSceneComponent *)self _updateFocusSystemCapabilities];
      if (v3) {
        goto LABEL_24;
      }
    }
    else if (v3)
    {
      goto LABEL_24;
    }
  }
  else
  {
    [(_UIFocusSystemSceneComponent *)self _tearDownFocusSystem];
    if (v3) {
      goto LABEL_24;
    }
  }
  if (focusSystem) {
    goto LABEL_28;
  }
LABEL_25:
  if ([(UIFocusSystem *)self->_focusSystem _isEnabled])
  {
    v15 = [(UIFocusSystem *)self->_focusSystem focusedItem];

    if (!v15)
    {
      [(UIFocusSystem *)self->_focusSystem requestFocusUpdateToEnvironment:self->_focusSystem];
      [(UIFocusSystem *)self->_focusSystem updateFocusIfNeeded];
    }
  }
LABEL_28:
}

- (id)_focusBehaviorRespectingApplicationOverride:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  v6 = [v5 traitCollection];

  BOOL v7 = _UIFocusBaseBehaviorForTraitCollection(v6);
  if (v3
    && [(_UIFocusSystemSceneComponent *)self _focusSystemExplicitlyDisabledForBehavior:v7])
  {

    BOOL v7 = 0;
  }

  return v7;
}

- (UITraitCollection)_traitOverrides
{
  BOOL v3 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  id v4 = v3;
  if (v3)
  {
    if ([v3 _isEnabled]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    BOOL v6 = [(_UIFocusSystemSceneComponent *)self _focusSystemExplicitlyDisabledForBehavior:0];
    uint64_t v5 = 0;
    if (v6) {
      uint64_t v5 = [(_UIFocusHardwareKeyboardObserver *)self->_hardwareKeyboardObserver isActive];
    }
  }
  BOOL v7 = +[UITraitCollection _traitCollectionWithFocusSystemState:v5];

  return (UITraitCollection *)v7;
}

- (BOOL)_focusSystemExplicitlyDisabledForBehavior:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [(_UIFocusSystemSceneComponent *)self _windowScene];
    BOOL v6 = [v5 traitCollection];
    _UIFocusBaseBehaviorForTraitCollection(v6);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4) {
      goto LABEL_5;
    }
  }
  if ([v4 honorsFocusSystemEnabledInfoPlistKey]
    && ![(_UIFocusSystemSceneComponent *)self isOverrideFocusSystemEnabled])
  {
    uint64_t v8 = +[_UIApplicationInfoParser mainBundleInfoParser];
    int v7 = [v8 focusSystemEnabled] ^ 1;
  }
  else
  {
LABEL_5:
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (UIWindowScene)_windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v3 = objc_opt_class();
  id v4 = WeakRetained;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return (UIWindowScene *)v6;
}

- (_UIFocusSystemSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusSystemSceneComponent;
  uint64_t v5 = [(_UIFocusSystemSceneComponent *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    *(unsigned char *)&v6->_flags |= 1u;
    int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__focusBehaviorDidChange_ name:@"_UIFocusBehaviorDidChangeNotification" object:0];

    [(_UIFocusSystemSceneComponent *)v6 _updateDeviceCapabilityObserver];
    [(_UIFocusSystemSceneComponent *)v6 _adjustFocusSystemAvailabilityUpdatingTraits:0];
    [(_UIFocusSystemSceneComponent *)v6 _notifyDidPerformFocusSystemInitialSetup];
  }

  return v6;
}

- (void)_updateDeviceCapabilityObserver
{
  uint64_t v3 = [(_UIFocusSystemSceneComponent *)self _focusBehaviorRespectingApplicationOverride:0];
  char v4 = [v3 requiredInputDevices];
  objc_initWeak(&location, self);
  hardwareKeyboardObserver = self->_hardwareKeyboardObserver;
  if (v4)
  {
    if (!hardwareKeyboardObserver)
    {
      id v6 = (_UIFocusHardwareKeyboardObserver *)objc_opt_new();
      int v7 = self->_hardwareKeyboardObserver;
      self->_hardwareKeyboardObserver = v6;

      uint64_t v8 = self->_hardwareKeyboardObserver;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke;
      v17[3] = &unk_1E52DC888;
      objc_copyWeak(&v18, &location);
      id v9 = [(_UIFocusStateObserver *)v8 addObserver:v17];
      objc_destroyWeak(&v18);
    }
  }
  else if (hardwareKeyboardObserver)
  {
    self->_hardwareKeyboardObserver = 0;
  }
  gameControllerObserver = self->_gameControllerObserver;
  if ((v4 & 2) != 0)
  {
    if (!gameControllerObserver)
    {
      int v11 = (_UIFocusGameControllerObserver *)objc_opt_new();
      v12 = self->_gameControllerObserver;
      self->_gameControllerObserver = v11;

      int v13 = self->_gameControllerObserver;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke_2;
      v15[3] = &unk_1E52DC888;
      objc_copyWeak(&v16, &location);
      id v14 = [(_UIFocusStateObserver *)v13 addObserver:v15];
      objc_destroyWeak(&v16);
    }
  }
  else if (gameControllerObserver)
  {
    self->_gameControllerObserver = 0;
  }
  objc_destroyWeak(&location);
}

- (void)_setScene:(id)a3
{
}

- (void)_notifyDidPerformFocusSystemInitialSetup
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  char v4 = [WeakRetained _FBSScene];
  uint64_t v5 = [v4 identityToken];
  id v6 = [v5 stringRepresentation];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    focusSystem = self->_focusSystem;
    uint64_t v10 = 0x1ED0EAF20;
    v11[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 postNotificationName:@"_UIFocusSystemSceneComponentDidFinishInitialization" object:focusSystem userInfo:v9];
  }
}

- (_UIFocusActiveSceneObserver)activeSceneObserver
{
  return self->_activeSceneObserver;
}

+ (BOOL)needsFocusSystem
{
  return 1;
}

+ (id)sceneComponentForFocusSystem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"_UIFocusSystemSceneComponent.m", 130, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];
  }
  id v6 = [v5 _hostFocusSystem];

  if (v6)
  {
    do
    {
      int v7 = [v5 _hostFocusSystem];

      uint64_t v8 = [v7 _hostFocusSystem];

      id v5 = v7;
    }
    while (v8);
  }
  else
  {
    int v7 = v5;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = +[UIScene _scenesIncludingInternal:1];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) _focusSystemSceneComponent];
        if ([(id)objc_opt_class() needsFocusSystem])
        {
          v15 = [v14 focusSystem];

          if (v15 == v7)
          {

            goto LABEL_18;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  os_variant_has_internal_diagnostics();
  id v14 = 0;
LABEL_18:

  return v14;
}

+ (id)_screenForScene:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [v3 screen];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_sceneWillInvalidate:(id)a3
{
  *(unsigned char *)&self->_flags &= ~1u;
  [(_UIFocusSystemSceneComponent *)self _tearDownFocusSystem];
}

- (void)_setupFocusSystem
{
  if (*(unsigned char *)&self->_flags)
  {
    id v3 = _forceUnwrappedScene((uint64_t)self);
    char v4 = [(id)objc_opt_class() _screenForScene:v3];
    objc_initWeak(&location, self);
    id v5 = [[_UIFocusActiveSceneObserver alloc] initWithScene:v3];
    activeSceneObserver = self->_activeSceneObserver;
    self->_activeSceneObserver = v5;

    int v7 = self->_activeSceneObserver;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke;
    v27[3] = &unk_1E52DC888;
    objc_copyWeak(&v28, &location);
    id v8 = [(_UIFocusStateObserver *)v7 addObserver:v27];
    if ([(id)objc_opt_class() needsFocusSystem])
    {
      id v9 = [(_UIFocusSystemSceneComponent *)self _focusBehaviorRespectingApplicationOverride:1];
      uint64_t v10 = [[UIFocusSystem alloc] initWithFocusBehavior:v9 enabled:[(_UIFocusSystemSceneComponent *)self _isSceneActive]];
      [(UIFocusSystem *)v10 setDelegate:self];
      objc_storeStrong((id *)&self->_focusSystem, v10);
      uint64_t v11 = [[_UIFocusEventDelivery alloc] initWithFocusSystem:v10];
      eventDelivery = self->_eventDelivery;
      self->_eventDelivery = v11;

      [(_UIFocusSystemSceneComponent *)self _updateFocusSystemCapabilities];
      [(_UIFocusSystemSceneComponent *)self _updateWantsModernRing];
      int v13 = [[_UIFocusScrollManager alloc] initWithScreen:v4];
      objc_storeStrong((id *)&self->_scrollManager, v13);
      if ([v9 supportsSounds])
      {
        id v14 = +[_UIFocusSoundGenerator defaultGenerator];
        soundGenerator = self->_soundGenerator;
        self->_soundGenerator = v14;
      }
      if ([v9 supportsHaptics])
      {
        id v16 = [[_UIFocusHapticFeedbackGenerator alloc] initWithScreen:v4];
        hapticFeedbackGenerator = self->_hapticFeedbackGenerator;
        self->_hapticFeedbackGenerator = v16;
      }
      if ([v9 supportsFrameReporter])
      {
        long long v18 = [[_UIFocusItemFrameReporter alloc] initWithFocusSystem:v10];
        focusItemFrameReporter = self->_focusItemFrameReporter;
        self->_focusItemFrameReporter = v18;
      }
      long long v20 = objc_alloc_init(_UIFocusAnimationCoordinatorManager);
      focusAnimationCoordinatorManager = self->_focusAnimationCoordinatorManager;
      self->_focusAnimationCoordinatorManager = v20;

      int v22 = [(_UIFocusSystemSceneComponent *)self _windowScene];
      uint64_t v23 = [v22 _allWindows];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_2;
      v26[3] = &unk_1E52F05D8;
      v26[4] = self;
      [v23 enumerateObjectsUsingBlock:v26];

      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 addObserver:self selector:sel__focusSystemEnabledStateDidChange_ name:@"_UIFocusSystemEnabledStateDidChangeNotification" object:self->_focusSystem];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_3;
      v25[3] = &unk_1E52D9F70;
      v25[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v25);
    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)_delayedSetupFocusDebugWindow
{
  if (self->_focusSystem && +[_UIFocusDebugWindow hasAnyModules])
  {
    id v3 = [_UIFocusDebugWindow alloc];
    char v4 = [(_UIFocusSystemSceneComponent *)self _windowScene];
    id v5 = [(_UIFocusDebugWindow *)v3 initWithWindowScene:v4];
    debugWindow = self->_debugWindow;
    self->_debugWindow = v5;

    int v7 = self->_debugWindow;
    [(_UIFocusDebugWindow *)v7 setHidden:0];
  }
}

- (void)_tearDownFocusSystem
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIFocusSystemEnabledStateDidChangeNotification" object:self->_focusSystem];

  char v4 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  id v5 = [v4 _allWindows];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52___UIFocusSystemSceneComponent__tearDownFocusSystem__block_invoke;
  v17[3] = &unk_1E52F05D8;
  void v17[4] = self;
  [v5 enumerateObjectsUsingBlock:v17];

  id v6 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  [v6 _updateFocusImmediatelyToEnvironment:0];

  int v7 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  [v7 _prepareForTeardown];

  focusSystem = self->_focusSystem;
  self->_focusSystem = 0;

  eventDelivery = self->_eventDelivery;
  self->_eventDelivery = 0;

  focusAnimationCoordinatorManager = self->_focusAnimationCoordinatorManager;
  self->_focusAnimationCoordinatorManager = 0;

  scrollManager = self->_scrollManager;
  self->_scrollManager = 0;

  soundGenerator = self->_soundGenerator;
  self->_soundGenerator = 0;

  hapticFeedbackGenerator = self->_hapticFeedbackGenerator;
  self->_hapticFeedbackGenerator = 0;

  focusItemFrameReporter = self->_focusItemFrameReporter;
  self->_focusItemFrameReporter = 0;

  activeSceneObserver = self->_activeSceneObserver;
  self->_activeSceneObserver = 0;

  [(_UIFocusDebugWindow *)self->_debugWindow setHidden:1];
  debugWindow = self->_debugWindow;
  self->_debugWindow = 0;
}

- (void)_updateFocusSystemState
{
  BOOL v3 = [(_UIFocusSystemSceneComponent *)self _isSceneActive];
  char v4 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  id v5 = [v4 behavior];
  uint64_t v6 = [v5 focusSystemDeactivationMode];

  if (v6 == 1)
  {
    int v7 = &unk_1ED3F41B8;
    if (v3) {
      int v7 = 0;
    }
    id v8 = v7;
    BOOL v3 = 1;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  [(UIFocusSystem *)self->_focusSystem _setOverrideFocusDeferralBehavior:v8];
  [(UIFocusSystem *)self->_focusSystem _setEnabled:v3];
}

- (id)_windowsForFocusSearch
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = _forceUnwrappedScene((uint64_t)self);
  char v4 = +[_UIFocusSystemSceneComponent _screenForScene:v3];
  id v5 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  uint64_t v6 = [v5 behavior];
  char v7 = [v6 supportsMultipleWindows];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_11;
    }
    id v8 = [v3 _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
    id v9 = [v8 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_249];
  }
  else
  {
    id v8 = [v4 _preferredFocusedWindow];
    uint64_t v10 = [(_UIFocusSystemSceneComponent *)self _windowScene];
    uint64_t v11 = [v10 keyWindow];

    if (v8
      && ([v8 windowScene],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12 == v3))
    {
      v14[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
LABEL_11:

  return v9;
}

- (_UIFocusEffectManager)_focusEffectManager
{
  focusEffectManager = self->_focusEffectManager;
  if (!focusEffectManager)
  {
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      char v4 = (_UIFocusEffectManager *)objc_opt_new();
      id v5 = self->_focusEffectManager;
      self->_focusEffectManager = v4;

      focusEffectManager = self->_focusEffectManager;
    }
    else
    {
      focusEffectManager = 0;
    }
  }
  return focusEffectManager;
}

- (void)_updateWantsModernRing
{
  BOOL v3 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  char v4 = [v3 behavior];
  uint64_t v5 = [v4 focusRingVisibility];

  if (((v5 & 0xFFFFFFFFFFFFFFFELL) == 2) == ((*(unsigned char *)&self->_flags & 2) == 0))
  {
    +[UIFocusRingManager moveRingToFocusItem:0];
    uint64_t v6 = [(_UIFocusSystemSceneComponent *)self _focusEffectManager];
    [v6 moveFocusToItem:0];

    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | (2 * ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2));
  }
}

- (void)_updateFocusEffectForItem:(id)a3
{
  id v12 = a3;
  char v4 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  if (![v4 _isEnabled])
  {

    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_6;
    }
LABEL_10:
    id v9 = [(_UIFocusSystemSceneComponent *)self _focusEffectManager];
    uint64_t v10 = v9;
    id v11 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  uint64_t v6 = [v5 behavior];
  int v7 = [v6 showsFocusRingForItem:v12];

  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if (v7)
    {
      id v8 = v12;
LABEL_7:
      +[UIFocusRingManager moveRingToFocusItem:v8];
      goto LABEL_12;
    }
LABEL_6:
    id v8 = 0;
    goto LABEL_7;
  }
  if (!v7) {
    goto LABEL_10;
  }
  id v9 = [(_UIFocusSystemSceneComponent *)self _focusEffectManager];
  uint64_t v10 = v9;
  id v11 = v12;
LABEL_11:
  [v9 moveFocusToItem:v11];

LABEL_12:
}

- (void)setOverrideFocusSystemEnabled:(BOOL)a3 withIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v7 = (NSMutableSet *)a4;
  if (!v7)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_UIFocusSystemSceneComponent.m", 613, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier" object file lineNumber description];
  }
  id v8 = NSString;
  id v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  id v11 = [v8 stringWithFormat:@"<%@ %p>", v10, v7];

  int v12 = [(_UIFocusSystemSceneComponent *)self isOverrideFocusSystemEnabled];
  overrideFocusSystemEnablementIdentifiers = self->_overrideFocusSystemEnablementIdentifiers;
  if (v4)
  {
    if (!overrideFocusSystemEnablementIdentifiers)
    {
      id v14 = [MEMORY[0x1E4F1CA80] set];
      v15 = self->_overrideFocusSystemEnablementIdentifiers;
      self->_overrideFocusSystemEnablementIdentifiers = v14;

      overrideFocusSystemEnablementIdentifiers = self->_overrideFocusSystemEnablementIdentifiers;
    }
    if (([(NSMutableSet *)overrideFocusSystemEnablementIdentifiers containsObject:v11] & 1) == 0) {
      [(NSMutableSet *)self->_overrideFocusSystemEnablementIdentifiers addObject:v11];
    }
  }
  else
  {
    [(NSMutableSet *)overrideFocusSystemEnablementIdentifiers removeObject:v11];
  }
  int v16 = [(_UIFocusSystemSceneComponent *)self isOverrideFocusSystemEnabled];
  if (v12 != v16)
  {
    int v17 = v16;
    long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocusSystemSceneComponent", &setOverrideFocusSystemEnabled_withIdentifier____s_category)+ 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = @"ENABLED";
      if (!v17) {
        long long v19 = @"DISABLED";
      }
      long long v20 = v7;
      if (v17) {
        long long v20 = self->_overrideFocusSystemEnablementIdentifiers;
      }
      *(_DWORD *)buf = 138412546;
      v24 = v19;
      __int16 v25 = 2112;
      char v26 = v20;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "Override focusSystemState: (%@) for reason(s): %@", buf, 0x16u);
    }
    long long v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 postNotificationName:@"_UIFocusBehaviorDidChangeNotification" object:0];
  }
}

- (BOOL)isOverrideFocusSystemEnabled
{
  return [(NSMutableSet *)self->_overrideFocusSystemEnablementIdentifiers count] != 0;
}

- (void)_focusBehaviorDidChange:(id)a3
{
  if (*(unsigned char *)&self->_flags)
  {
    BOOL v4 = [(_UIFocusSystemSceneComponent *)self _focusBehaviorRespectingApplicationOverride:1];
    uint64_t v5 = [(_UIFocusSystemSceneComponent *)self focusSystem];
    [v5 setBehavior:v4];

    [(_UIFocusSystemSceneComponent *)self _updateWantsModernRing];
    [(_UIFocusSystemSceneComponent *)self _updateDeviceCapabilityObserver];
    [(_UIFocusSystemSceneComponent *)self _adjustFocusSystemAvailability];
  }
}

- (void)_adjustFocusSystemAvailability
{
}

- (void)_updateFocusSystemCapabilities
{
  id v12 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  v2 = [v12 behavior];
  uint64_t v3 = [v2 focusCastingMode];

  if (v3)
  {
    BOOL v4 = objc_alloc_init(_UIFocusCastingController);
    [v12 _setFocusCastingController:v4];

    if (v3 == 2)
    {
      uint64_t v5 = [v12 _focusCastingController];
      [v5 setEntryPointMemorizationTimeout:0.0];
    }
  }
  else
  {
    [v12 _setFocusCastingController:0];
  }
  uint64_t v6 = [v12 behavior];
  [v6 stabilizedLinearFocusMovementTimeout];
  double v8 = v7;

  if (v8 >= 0.0)
  {
    id v9 = [_UIFocusLinearMovementCache alloc];
    uint64_t v10 = [v12 behavior];
    id v11 = [(_UIFocusLinearMovementCache *)v9 initWithFocusBehavior:v10];
    [v12 _setFocusMovementCache:v11];
  }
  else
  {
    [v12 _setFocusMovementCache:0];
  }
}

- (BOOL)_isSceneActive
{
  activeSceneObserver = self->_activeSceneObserver;
  if (activeSceneObserver) {
    LOBYTE(activeSceneObserver) = [(_UIFocusStateObserver *)activeSceneObserver isActive];
  }
  return (char)activeSceneObserver;
}

- (void)_resetFocusEventRecognizers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(_UIFocusSystemSceneComponent *)self _windowsForFocusSearch];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _resetFocusEventRecognizer];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_overridingPreferredFocusEnvironment
{
  v2 = [(_UIFocusSystemSceneComponent *)self preferredFocusEnvironmentOverride];
  uint64_t v3 = v2;
  if (v2 && ([v2 compact], objc_msgSend(v3, "count")))
  {
    uint64_t v4 = objc_msgSend(v3, "pointerAtIndex:", objc_msgSend(v3, "count") - 1);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)pushPreferredFocusEnvironmentOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIFocusSystemSceneComponent *)self preferredFocusEnvironmentOverride];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    preferredFocusEnvironmentOverride = self->_preferredFocusEnvironmentOverride;
    self->_preferredFocusEnvironmentOverride = v6;
  }
  id v8 = [(_UIFocusSystemSceneComponent *)self preferredFocusEnvironmentOverride];
  [v8 addPointer:v4];
}

- (void)removePreferredFocusEnvironmentOverride:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UIFocusSystemSceneComponent *)self preferredFocusEnvironmentOverride];
  [v5 compact];
  if ([v5 count])
  {
    unsigned int v6 = [v5 count] - 1;
    while ((v6 & 0x80000000) == 0)
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v5 pointerAtIndex:v6--];
      if ((id)v8 == v4)
      {
        [v5 removePointerAtIndex:v7];
        goto LABEL_18;
      }
    }
    long long v9 = objc_retain(*(id *)(__UILogGetCategoryCachedImpl("UIFocusSystemSceneComponent", &qword_1EB2609B8)
                                       + 8));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v4;
      if (v15)
      {
        int v16 = NSString;
        int v17 = (objc_class *)objc_opt_class();
        long long v18 = NSStringFromClass(v17);
        id v14 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
      }
      else
      {
        id v14 = @"(nil)";
      }

      *(_DWORD *)buf = 138412290;
      long long v21 = v14;
      long long v19 = "Removing environment %@ from override is unsuccessful: environment not in list of overrides.";
LABEL_16:
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
    }
  }
  else
  {
    long long v9 = objc_retain(*(id *)(__UILogGetCategoryCachedImpl("UIFocusSystemSceneComponent", &qword_1EB2609C0)
                                       + 8));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v4;
      if (v10)
      {
        id v11 = NSString;
        uint64_t v12 = (objc_class *)objc_opt_class();
        int v13 = NSStringFromClass(v12);
        id v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
      }
      else
      {
        id v14 = @"(nil)";
      }

      *(_DWORD *)buf = 138412290;
      long long v21 = v14;
      long long v19 = "Removing environment %@ from override is unsuccessful: no override environments.";
      goto LABEL_16;
    }
  }

LABEL_18:
}

- (id)_syncResponderWithFocusUpdateContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  unsigned int v6 = [v5 behavior];

  if ([v6 syncsFocusAndResponder])
  {
    uint64_t v7 = [v4 nextFocusedItem];
    uint64_t v8 = v7;
    if (v7)
    {
      long long v9 = _UIFirstResponderCandidateForEnvironment(v7);
      id v10 = [v9 _nextResponderThatCanBecomeFirstResponder];
      id v11 = v10;
      if (!v10
        || ([v10 isFirstResponder] & 1) == 0
        && [v11 _allowsChangingFirstResponderForFocusUpdateWithContext:v4])
      {
        uint64_t v12 = _UIFocusEnvironmentContainingView(v8);
        int v13 = [v12 _window];
        id v14 = [v13 firstResponder];
        id v15 = v14;
        if ((!v14 || [v14 _allowsChangingFirstResponderForFocusUpdateWithContext:v4])
          && (!v11
           || !+[UIResponder _callBecomeFirstResponder:v11 withIntent:1]))
        {
          +[UIResponder _callResignFirstResponder:v15 withIntent:1];
        }
      }
      if ([v11 isFirstResponder]) {
        int v16 = v11;
      }
      else {
        int v16 = 0;
      }
      id v17 = v16;
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_validateFocusedItemForFirstResponder:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UIFocusSystemSceneComponent *)self focusSystem];
  unsigned int v6 = [v5 behavior];

  if ([v6 syncsFocusAndResponder])
  {
    uint64_t v7 = [(_UIFocusSystemSceneComponent *)self focusSystem];
    uint64_t v8 = [v7 focusedItem];

    if (v4 && v8 && ([v4 isFirstResponder] & 1) == 0)
    {
      long long v9 = +[UIWindow _applicationKeyWindow];
      id v10 = [v9 firstResponder];

      if (v10)
      {
        id v11 = _UIFocusEnvironmentSafeCast(v10);

        uint64_t v12 = @"N";
        if (v11 && _UIFocusEnvironmentIsAncestorOfEnvironment(v10, v8)) {
          uint64_t v12 = @"Y";
        }
      }
      else
      {
        uint64_t v12 = @"N";
      }
      int v13 = _UIFocusEnvironmentSafeCast(v4);

      id v14 = @"N";
      if (v13 && _UIFocusEnvironmentIsAncestorOfEnvironment(v4, v8)) {
        id v14 = @"Y";
      }
      id v15 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2609C8) + 8);
      v76 = v12;
      v77 = v10;
      v75 = v14;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = NSString;
        id v17 = v8;
        long long v18 = (objc_class *)objc_opt_class();
        long long v19 = NSStringFromClass(v18);
        long long v20 = [v16 stringWithFormat:@"<%@: %p>", v19, v17];

        long long v21 = v20;
        id v10 = v77;
        os_log_t log = v21;
        uint64_t v22 = NSString;
        id v23 = v4;
        v24 = (objc_class *)objc_opt_class();
        __int16 v25 = NSStringFromClass(v24);
        char v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];

        uint64_t v27 = v26;
        id v28 = v77;
        if (v77)
        {
          v29 = NSString;
          long long v30 = (objc_class *)objc_opt_class();
          long long v31 = NSStringFromClass(v30);
          long long v32 = [v29 stringWithFormat:@"<%@: %p>", v31, v28];

          id v10 = v77;
        }
        else
        {
          long long v32 = @"(nil)";
        }

        *(_DWORD *)buf = 138413314;
        os_log_t v79 = log;
        __int16 v80 = 2112;
        os_log_t v81 = v27;
        __int16 v82 = 2112;
        uint64_t v12 = v76;
        v83 = v75;
        __int16 v84 = 2112;
        v85 = v32;
        __int16 v86 = 2112;
        v87 = v76;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Received a call to becomeFirstResponder while processing a focus update. Focused item: %@, expected responder: %@ (%@), actual responder: %@ (%@)", buf, 0x34u);

        id v14 = v75;
      }

      if (os_variant_has_internal_diagnostics())
      {
        v53 = v14;
        v54 = v12;
        long long v33 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        {
          os_log_t logc = (os_log_t)NSString;
          v74 = v8;
          id v55 = v8;
          v56 = (objc_class *)objc_opt_class();
          v57 = NSStringFromClass(v56);
          os_log_t logd = [logc stringWithFormat:@"<%@: %p>", v57, v55];

          v67 = logd;
          os_log_t loge = (os_log_t)NSString;
          id v58 = v4;
          v59 = (objc_class *)objc_opt_class();
          v60 = NSStringFromClass(v59);
          v61 = [loge stringWithFormat:@"<%@: %p>", v60, v58];

          os_log_t logb = v61;
          id v62 = v10;
          if (v10)
          {
            v64 = NSString;
            v65 = (objc_class *)objc_opt_class();
            v66 = NSStringFromClass(v65);
            v63 = [v64 stringWithFormat:@"<%@: %p>", v66, v62];
          }
          else
          {
            v63 = @"(nil)";
          }

          *(_DWORD *)buf = 138413314;
          os_log_t v79 = v67;
          __int16 v80 = 2112;
          os_log_t v81 = logb;
          __int16 v82 = 2112;
          v83 = v53;
          __int16 v84 = 2112;
          v85 = v63;
          __int16 v86 = 2112;
          v87 = v54;
          _os_log_fault_impl(&dword_1853B0000, v33, OS_LOG_TYPE_FAULT, "Received a call to becomeFirstResponder while processing a focus update. Focused item: %@, expected responder: %@ (%@), actual responder: %@ (%@)", buf, 0x34u);

          uint64_t v8 = v74;
        }
      }
      else
      {
        long long v33 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2609D0) + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          loga = v33;
          v34 = NSString;
          uint64_t v35 = v10;
          id v36 = v8;
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          v39 = [v34 stringWithFormat:@"<%@: %p>", v38, v36];

          v40 = v39;
          v41 = NSString;
          id v42 = v4;
          v43 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v43);
          v45 = [v41 stringWithFormat:@"<%@: %p>", v44, v42];

          v46 = v45;
          id v47 = v35;
          if (v35)
          {
            v48 = NSString;
            v49 = (objc_class *)objc_opt_class();
            v50 = NSStringFromClass(v49);
            v51 = [v48 stringWithFormat:@"<%@: %p>", v50, v47];
          }
          else
          {
            v51 = @"(nil)";
          }

          *(_DWORD *)buf = 138413314;
          os_log_t v79 = v40;
          __int16 v80 = 2112;
          os_log_t v81 = v46;
          __int16 v82 = 2112;
          v83 = v75;
          __int16 v84 = 2112;
          v85 = v51;
          __int16 v86 = 2112;
          v87 = v76;
          long long v33 = loga;
          _os_log_impl(&dword_1853B0000, loga, OS_LOG_TYPE_ERROR, "Received a call to becomeFirstResponder while processing a focus update. Focused item: %@, expected responder: %@ (%@), actual responder: %@ (%@)", buf, 0x34u);

          id v10 = v77;
        }
      }

      v52 = [(_UIFocusSystemSceneComponent *)self focusSystem];
      [v52 _updateFocusImmediatelyToEnvironment:0];
    }
  }
}

+ (BOOL)__applicationIsSpringBoard
{
  if (qword_1EB2609D8 != -1) {
    dispatch_once(&qword_1EB2609D8, &__block_literal_global_75);
  }
  return _MergedGlobals_1069;
}

- (UICoordinateSpace)coordinateSpace
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _forceUnwrappedScene((uint64_t)self);
  if (objc_opt_respondsToSelector())
  {
    if (!+[_UIFocusSystemSceneComponent __applicationIsSpringBoard](_UIFocusSystemSceneComponent, "__applicationIsSpringBoard")|| (-[_UIFocusSystemSceneComponent _windowScene](self, "_windowScene"), id v4 = objc_claimAutoreleasedReturnValue(), [v4 traitCollection], v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "userInterfaceIdiom"), v5, v4, v6 == 3))
    {
      uint64_t v7 = [v3 _coordinateSpace];
      goto LABEL_10;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___UIFocusSystemSceneComponent_coordinateSpace__block_invoke;
  block[3] = &unk_1E52D9F70;
  id v33 = v3;
  if (qword_1EB2609E0 != -1) {
    dispatch_once(&qword_1EB2609E0, block);
  }

  uint64_t v8 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  long long v9 = [v8 screen];

  if (!v9)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v11 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      if (self)
      {
        __int16 v25 = NSString;
        char v26 = self;
        uint64_t v27 = (objc_class *)objc_opt_class();
        id v28 = NSStringFromClass(v27);
        v24 = [v25 stringWithFormat:@"<%@: %p>", v28, v26];
      }
      else
      {
        v24 = @"(nil)";
      }
      id v17 = v24;
      long long v18 = [(_UIFocusSystemSceneComponent *)self _windowScene];
      if (v18)
      {
        v29 = NSString;
        long long v30 = (objc_class *)objc_opt_class();
        long long v31 = NSStringFromClass(v30);
        uint64_t v22 = [v29 stringWithFormat:@"<%@: %p>", v31, v18];
      }
      else
      {
        uint64_t v22 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v17;
      __int16 v36 = 2112;
      v37 = v22;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Unable to locate a screen for scene component %@. Scene: %@", buf, 0x16u);
    }
    else
    {
      id v11 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2609E8) + 8);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

        id v23 = +[UIScreen mainScreen];
        uint64_t v7 = [v23 coordinateSpace];

        goto LABEL_9;
      }
      if (self)
      {
        uint64_t v12 = NSString;
        int v13 = self;
        id v14 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v14);
        int v16 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];
      }
      else
      {
        int v16 = @"(nil)";
      }
      id v17 = v16;
      long long v18 = [(_UIFocusSystemSceneComponent *)self _windowScene];
      if (v18)
      {
        long long v19 = NSString;
        long long v20 = (objc_class *)objc_opt_class();
        long long v21 = NSStringFromClass(v20);
        uint64_t v22 = [v19 stringWithFormat:@"<%@: %p>", v21, v18];
      }
      else
      {
        uint64_t v22 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v17;
      __int16 v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Unable to locate a screen for scene component %@. Scene: %@", buf, 0x16u);
    }

    goto LABEL_23;
  }
  uint64_t v7 = [v9 coordinateSpace];
LABEL_9:

LABEL_10:
  return (UICoordinateSpace *)v7;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (BOOL)_uiktest_allowsForwardingFocusMovementActions
{
  return 1;
}

- (id)_topEnvironmentForFocusSystem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 behavior];
  if (([v5 syncsFocusAndResponder] & 1) == 0)
  {

LABEL_6:
    id v11 = v4;
    goto LABEL_7;
  }
  uint64_t v6 = [v4 _hostFocusSystem];

  if (v6) {
    goto LABEL_6;
  }
  uint64_t v7 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  uint64_t v8 = -[UIWindowScene _keyWindow](v7);

  long long v9 = [v8 firstResponder];
  uint64_t v10 = _UIFocusEnvironmentSafeCast(v9);
  if (v10)
  {
    id v11 = (id)v10;

    goto LABEL_7;
  }

  if (!v9) {
    goto LABEL_6;
  }
  id v11 = 0;
LABEL_7:

  return v11;
}

- (id)_preferredFocusEnvironmentsForFocusSystem:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 behavior];
  int v5 = [v4 requiresLegacyScreenBasedWindowLookup];

  if (v5)
  {
    uint64_t v6 = _forceUnwrappedScene((uint64_t)self);
    uint64_t v7 = +[_UIFocusSystemSceneComponent _screenForScene:v6];
    uint64_t v8 = [v7 _preferredFocusedWindow];
    long long v9 = v8;
    if (v8
      && ([v8 windowScene],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10 == v6))
    {
      v15[0] = v9;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v6 = [(_UIFocusSystemSceneComponent *)self _windowScene];
    uint64_t v12 = [v6 keyWindow];
    uint64_t v7 = (void *)v12;
    if (v12)
    {
      uint64_t v14 = v12;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v11;
}

- (BOOL)_focusSystem:(id)a3 shouldRestoreFocusInContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 _destinationItemInfo];
  long long v9 = [v8 containingView];
  uint64_t v10 = [v9 window];
  unsigned int v11 = objc_msgSend(v10, sel_allowsWeakReference);

  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = [v7 _destinationItemInfo];
  int v13 = [v12 containingView];
  uint64_t v14 = [v13 window];

  if (!v14) {
    goto LABEL_7;
  }
  id v15 = [v6 behavior];
  int v16 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  id v17 = [v16 screen];
  int v18 = [v15 allowsRestoringFocusForScreen:v17];

  if (!v18) {
    goto LABEL_7;
  }
  long long v19 = [v7 nextFocusedItem];

  if (v19)
  {
    long long v20 = [v6 behavior];
    char v21 = [v20 ignoresKeyWindowStatusWhenRestoringFocus];

    if (v21)
    {
      BOOL v22 = 1;
    }
    else
    {
      v24 = [v7 _destinationItemInfo];
      __int16 v25 = [v24 containingView];
      char v26 = [v25 window];

      uint64_t v27 = (void *)UIApp;
      id v28 = [(_UIFocusSystemSceneComponent *)self _windowScene];
      v29 = [v28 screen];
      long long v30 = [v27 _keyWindowForScreen:v29];

      BOOL v22 = 0;
      if (v30 && v26 == v30)
      {
        long long v31 = [v26 windowScene];
        long long v32 = [(_UIFocusSystemSceneComponent *)self _windowScene];
        BOOL v22 = v31 == v32;
      }
    }
  }
  else
  {
LABEL_7:
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_focusSystem:(id)a3 willUpdateFocusInContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_UIFocusSystemSceneComponent *)self focusAnimationCoordinatorManager];
  long long v9 = [v8 willUpdateFocusInContext:v7];

  uint64_t v10 = [v7 _sourceItemInfo];
  int v11 = [v10 itemIsKindOfView];

  uint64_t v12 = [v7 _destinationItemInfo];
  int v13 = [v12 itemIsKindOfView];

  if ((v11 & 1) != 0 || v13)
  {
    id v30 = v6;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    uint64_t v41 = 0;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    id v33 = __70___UIFocusSystemSceneComponent__focusSystem_willUpdateFocusInContext___block_invoke;
    v34 = &unk_1E52F0620;
    id v14 = v7;
    id v35 = v14;
    id v15 = v9;
    id v36 = v15;
    v37 = &v38;
    int v16 = (void (**)(void *, void *))_Block_copy(&aBlock);
    v39[3] = (uint64_t)v16;
    id v17 = [v14 previouslyFocusedItem];
    int v18 = [v14 nextFocusedItem];
    uint64_t v19 = [v14 _commonAncestorEnvironment];
    long long v20 = (void *)v19;
    if (v19
      && (v17 == (void *)v19 ? (char v21 = v11) : (char v21 = 0),
          v18 == (void *)v19 ? (int v22 = v13) : (int v22 = 0),
          (v21 & 1) != 0 || v22))
    {
      objc_msgSend(v15, "_prepareForFocusAnimation:", 1, v30, aBlock, v32, v33, v34, v35);
      v16[2](v16, v20);
    }
    else
    {
      if (v11)
      {
        [v15 _prepareForFocusAnimation:1];
        v16[2](v16, v17);
      }
      if (v13)
      {
        [v15 _prepareForFocusAnimation:0];
        v16[2](v16, v18);
      }
    }

    _Block_object_dispose(&v38, 8);
    id v6 = v30;
  }
  -[_UIFocusSystemSceneComponent _syncResponderWithFocusUpdateContext:](self, "_syncResponderWithFocusUpdateContext:", v7, v30);
  id v23 = (UIResponder *)objc_claimAutoreleasedReturnValue();
  expectedFirstResponder = self->_expectedFirstResponder;
  self->_expectedFirstResponder = v23;

  __int16 v25 = [v7 nextFocusedView];
  char v26 = [v25 _responderWindow];

  uint64_t v27 = [v7 previouslyFocusedView];
  id v28 = [v27 _responderWindow];
  if (v28 == v26
    || ![v26 canBecomeKeyWindow]
    || ([v26 isKeyWindow] & 1) != 0)
  {
  }
  else
  {
    char v29 = [v26 _isTextEffectsWindow];

    if ((v29 & 1) == 0) {
      [v26 makeKeyWindow];
    }
  }
}

- (void)_focusSystem:(id)a3 didUpdateFocusInContext:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = (UIFocusSystem *)a3;
  id v7 = a4;
  uint64_t v8 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v7];
  long long v9 = (void *)v8;
  if (self->_focusSystem == v6)
  {
    v22[0] = @"UIFocusUpdateContextKey";
    v22[1] = @"UIFocusUpdateAnimationCoordinatorKey";
    v23[0] = v7;
    v23[1] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"UIFocusDidUpdateNotification" object:v6 userInfo:v10];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69___UIFocusSystemSceneComponent__focusSystem_didUpdateFocusInContext___block_invoke;
  v20[3] = &unk_1E52D9F98;
  v20[4] = self;
  id v12 = v7;
  id v21 = v12;
  [v9 addCoordinatedAnimations:v20 completion:0];
  int v13 = [(_UIFocusSystemSceneComponent *)self focusAnimationCoordinatorManager];
  id v14 = [v12 previouslyFocusedItem];
  [v13 didUpdateFocusInContext:v12 fromItem:v14];

  id v15 = [v12 _request];
  LODWORD(v14) = [v15 shouldPerformHapticFeedback];

  if (v14)
  {
    int v16 = [(_UIFocusSystemSceneComponent *)self hapticFeedbackGenerator];
    [v16 performHapticFeedbackForFocusUpdateInContext:v12];
  }
  id v17 = [v12 _request];
  int v18 = [v17 shouldPlayFocusSound];

  if (v18)
  {
    uint64_t v19 = [(_UIFocusSystemSceneComponent *)self soundGenerator];
    [v19 playSoundForFocusUpdateInContext:v12];
  }
}

- (void)_focusSystem:(id)a3 didFinishUpdatingFocusInContext:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  expectedFirstResponder = self->_expectedFirstResponder;
  if (expectedFirstResponder)
  {
    self->_expectedFirstResponder = 0;
    uint64_t v8 = expectedFirstResponder;

    [(_UIFocusSystemSceneComponent *)self _validateFocusedItemForFirstResponder:v8];
  }
  long long v9 = [(_UIFocusSystemSceneComponent *)self scrollManager];
  [v9 performScrollingIfNeededForFocusUpdateInContext:v6];

  uint64_t v10 = [v6 _focusMovement];
  char v11 = [v10 _isVelocityBased];

  if ((v11 & 1) == 0)
  {
    id v12 = (void *)UIApp;
    int v13 = [(_UIFocusSystemSceneComponent *)self _windowScene];
    id v14 = [v13 screen];
    id v15 = [v12 _keyWindowForScreen:v14];

    int v16 = [v15 _focusEventRecognizer];
    [v16 _resetProgressAccumulator];
  }
}

- (void)_focusSystem:(id)a3 willMessageOldFocusNodes:(id)a4
{
  id v4 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:a4];
  [v4 _prepareForFocusAnimation:1];
}

- (void)_focusSystem:(id)a3 willMessageNewFocusNodes:(id)a4
{
  id v4 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:a4];
  [v4 _prepareForFocusAnimation:0];
}

- (void)_focusSystem:(id)a3 environment:(id)a4 didUpdateFocusInContext:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v6];
  [v7 didUpdateFocusInContext:v6 withAnimationCoordinator:v8];
}

- (CGRect)_clippingRectForFocusSystem:(id)a3 inCoordinateSpace:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  id v7 = [v6 coordinateSpace];
  id v8 = [v6 coordinateSpace];
  [v8 bounds];
  objc_msgSend(v7, "convertRect:toCoordinateSpace:", v5);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_shouldWaitForFocusMovementActionToEnableFocusSystem:(id)a3
{
  uint64_t v3 = [a3 behavior];
  char v4 = [v3 waitForFocusMovementActionToEnableFocusSystem];

  return v4;
}

- (BOOL)_focusSystem:(id)a3 handleFailedMovementRequest:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 movementInfo];
  BOOL v7 = [(_UIFocusSystemSceneComponent *)self _shouldForwardFocusMovementRequest:v5];
  if (v7)
  {
    id v8 = [v5 focusSystem];
    double v9 = [v8 focusedItem];

    double v10 = [(_UIFocusSystemSceneComponent *)self coordinateSpace];
    double v11 = _UIFocusItemFrameInCoordinateSpace(v9, v10);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    double v18 = [UIFocusMovementAction alloc];
    double v19 = [v5 inputDeviceInfo];
    double v20 = -[UIFocusMovementAction initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:](v18, "initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:", v6, v19, [v5 shouldPerformHapticFeedback], v11, v13, v15, v17);

    id v21 = [(_UIFocusSystemSceneComponent *)self _windowScene];
    int v22 = [v21 screen];
    id v23 = [v22 _preferredFocusedWindow];
    [v23 _forwardFocusMovementAction:v20];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v24 = [(_UIFocusSystemSceneComponent *)self _windowScene];
    __int16 v25 = [v24 _allWindows];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v33;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = [*(id *)(*((void *)&v32 + 1) + 8 * v29) _focusEventRecognizer];
          [v30 reset];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v27);
    }
  }
  return v7;
}

- (BOOL)_focusSystem:(id)a3 isScrollingScrollableContainer:(id)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a4;
  id v8 = [(_UIFocusSystemSceneComponent *)self scrollManager];
  int v9 = [v8 isScrollingScrollableContainer:v7];

  if (a5 && v9)
  {
    double v10 = [(_UIFocusSystemSceneComponent *)self scrollManager];
    [v10 targetContentOffsetForScrollableContainer:v7];
    a5->x = v11;
    a5->y = v12;
  }
  return v9;
}

- (BOOL)_shouldForwardFocusMovementRequest:(id)a3
{
  char v4 = [a3 movementInfo];
  id v5 = [(_UIFocusSystemSceneComponent *)self _windowScene];
  id v6 = [v5 traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ([(_UIFocusSystemSceneComponent *)self _uiktest_allowsForwardingFocusMovementActions])
  {
    BOOL v8 = 0;
    if ([v4 _isInitialMovement] && v7 != 2)
    {
      int v9 = [v5 traitCollection];
      uint64_t v10 = [v9 userInterfaceIdiom];

      BOOL v8 = v10 == 3 || ([v4 heading] & 0x300) == 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_focusSystem:(id)a3 shouldReverseLayoutDirectionForEnvironment:(id)a4
{
  char v4 = __viewOrWindowFallbackForRTLProbing(self, a4);
  char v5 = [v4 _shouldReverseLayoutDirection];

  return v5;
}

- (BOOL)_focusSystem:(id)a3 shouldReverseLinearWrappingForEnvironment:(id)a4
{
  char v4 = __viewOrWindowFallbackForRTLProbing(self, a4);
  char v5 = [v4 _window];
  char v6 = [v5 _reversesLinearFocusWrapping];

  return v6;
}

- (NSString)description
{
  uint64_t v3 = [[UIDescriptionBuilder alloc] initWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v5 = [(UIDescriptionBuilder *)v3 appendName:@"scene" object:WeakRetained];

  id v6 = [(UIDescriptionBuilder *)v3 appendName:@"focusSystem" object:self->_focusSystem];
  uint64_t v7 = [(UIDescriptionBuilder *)v3 string];

  return (NSString *)v7;
}

- (_UIFocusItemFrameReporter)_focusItemFrameReporter
{
  return self->_focusItemFrameReporter;
}

- (void)set_focusItemFrameReporter:(id)a3
{
}

- (_UIFocusEventDelivery)_eventDelivery
{
  return self->_eventDelivery;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)setFocusSystem:(id)a3
{
}

- (_UIFocusHardwareKeyboardObserver)hardwareKeyboardObserver
{
  return self->_hardwareKeyboardObserver;
}

- (_UIFocusGameControllerObserver)gameControllerObserver
{
  return self->_gameControllerObserver;
}

- (_UIFocusDebugWindow)debugWindow
{
  return self->_debugWindow;
}

- (NSPointerArray)preferredFocusEnvironmentOverride
{
  return self->_preferredFocusEnvironmentOverride;
}

- (_UIFocusSoundGenerator)soundGenerator
{
  return self->_soundGenerator;
}

- (void)setSoundGenerator:(id)a3
{
}

- (_UIFocusHapticFeedbackGenerator)hapticFeedbackGenerator
{
  return self->_hapticFeedbackGenerator;
}

- (void)setHapticFeedbackGenerator:(id)a3
{
}

- (_UIFocusAnimationCoordinatorManager)focusAnimationCoordinatorManager
{
  return self->_focusAnimationCoordinatorManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusAnimationCoordinatorManager, 0);
  objc_storeStrong((id *)&self->_scrollManager, 0);
  objc_storeStrong((id *)&self->_hapticFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_soundGenerator, 0);
  objc_storeStrong((id *)&self->_activeSceneObserver, 0);
  objc_storeStrong((id *)&self->_preferredFocusEnvironmentOverride, 0);
  objc_storeStrong((id *)&self->_debugWindow, 0);
  objc_storeStrong((id *)&self->_gameControllerObserver, 0);
  objc_storeStrong((id *)&self->_hardwareKeyboardObserver, 0);
  objc_storeStrong((id *)&self->_focusSystem, 0);
  objc_storeStrong((id *)&self->_focusEffectManager, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_eventDelivery, 0);
  objc_storeStrong((id *)&self->_focusItemFrameReporter, 0);
  objc_storeStrong((id *)&self->_overrideFocusSystemEnablementIdentifiers, 0);
  objc_storeStrong((id *)&self->_expectedFirstResponder, 0);
}

@end