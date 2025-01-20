@interface SBSystemGestureManager
+ (BOOL)_isDeviceHardwareButtonGestureType:(unint64_t)a3;
+ (id)deviceHardwareButtonGestureTypes;
+ (id)mainDisplayManager;
- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3;
- (BOOL)_isTouchGestureWithType:(unint64_t)a3;
- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3;
- (BOOL)areSystemGesturesDisabledForAccessibility;
- (BOOL)isAnyTouchGestureRunning;
- (BOOL)isSystemGestureRecognizer:(id)a3;
- (BOOL)isValid;
- (BOOL)shouldEnableSystemGestureWithType:(unint64_t)a3;
- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3;
- (NSString)debugDescription;
- (SBIndirectTouchLifecycleMonitor)indirectTouchLifecycleMonitor;
- (SBSystemGestureManager)init;
- (SBSystemUIPointerInteractionDelegate)systemPointerInteractionDelegate;
- (_UISystemGestureManager)systemGestureManager;
- (id)_initWithDisplayIdentity:(id)a3;
- (id)acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason:(id)a3;
- (id)acquireSystemGestureDisableAssertionForReason:(id)a3 exceptSystemGestureTypes:(id)a4;
- (id)acquireSystemGestureDisableAssertionForReason:(id)a3 forSystemGestureTypes:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)windowForSystemGestures;
- (int64_t)_recognitionEventForTouchGestureType:(unint64_t)a3;
- (unint64_t)typeOfSystemGesture:(id)a3;
- (void)_configureForNewSystemGestureWindowIfNecessary;
- (void)_disableSystemGesture:(id)a3 withType:(unint64_t)a4;
- (void)_enableSystemGesture:(id)a3 withType:(unint64_t)a4;
- (void)_evaluateEnablement;
- (void)_invalidateIgnoreHidEdgeFlagsAssertionForRemovedRecognizer:(id)a3;
- (void)_pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4;
- (void)_systemGestureChanged:(id)a3;
- (void)_updateIgnoreHIDEdgeFlagsAssertions;
- (void)addGestureRecognizer:(id)a3 withType:(unint64_t)a4;
- (void)cancelGestureRecognizerOfType:(unint64_t)a3 reason:(id)a4;
- (void)gestureRecognizerOfType:(unint64_t)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (void)gestureRecognizerOfType:(unint64_t)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (void)ignoreScreenEdgeTouchWithIdentifier:(unsigned int)a3;
- (void)invalidate;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)removeGestureRecognizer:(id)a3;
- (void)setIndirectTouchLifecycleMonitor:(id)a3;
- (void)setSystemGestureManager:(id)a3;
- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3;
- (void)setSystemPointerInteractionDelegate:(id)a3;
@end

@implementation SBSystemGestureManager

- (void)gestureRecognizerOfType:(unint64_t)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v9 = a4;
  typeToGesture = self->_typeToGesture;
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(NSMutableDictionary *)typeToGesture objectForKey:v7];

  if (v8) {
    [v9 requireGestureRecognizerToFail:v8];
  }
}

- (void)addGestureRecognizer:(id)a3 withType:(unint64_t)a4
{
  id object = a3;
  typeToGesture = self->_typeToGesture;
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  id v9 = [(NSMutableDictionary *)typeToGesture objectForKey:v8];

  if (v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSNumber numberWithUnsignedInteger:a4];
    v15 = self->_typeToGesture;
    v16 = [NSNumber numberWithUnsignedInteger:a4];
    v17 = [(NSMutableDictionary *)v15 objectForKey:v16];
    [v13 handleFailureInMethod:a2, self, @"SBSystemGestureManager.m", 148, @"Trying to add a system gesture with type %@, but we already have one: %@", v14, v17 object file lineNumber description];
  }
  if (self->_isInvalidated)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSNumber numberWithUnsignedInteger:a4];
    [v18 handleFailureInMethod:a2, self, @"SBSystemGestureManager.m", 149, @"Trying to add gesture recognizer type %@ to an invalidated SBSystemGestureManager", v19 object file lineNumber description];
  }
  if (object)
  {
    v10 = [NSNumber numberWithUnsignedInteger:a4];
    objc_setAssociatedObject(object, "_SBSystemGestureType", v10, (void *)1);

    v11 = self->_typeToGesture;
    v12 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v11 setObject:object forKey:v12];

    if ([(SBSystemGestureManager *)self _isTouchGestureWithType:a4]) {
      [(NSMutableSet *)self->_touchGestures addObject:object];
    }
    if ([(SBSystemGestureManager *)self shouldEnableSystemGestureWithType:a4]) {
      [(SBSystemGestureManager *)self _enableSystemGesture:object withType:a4];
    }
  }
  [(SBSystemGestureManager *)self _configureForNewSystemGestureWindowIfNecessary];
  [(SBSystemGestureManager *)self _updateIgnoreHIDEdgeFlagsAssertions];
}

- (BOOL)shouldEnableSystemGestureWithType:(unint64_t)a3
{
  BOOL v5 = -[SBSystemGestureManager _shouldEnableSystemGestureWithType:](self, "_shouldEnableSystemGestureWithType:");
  if (v5)
  {
    if ([(NSMutableSet *)self->_gesturesDisabledAssertions count])
    {
      gestureTypesAllowedWhileDisableAssertionsExist = self->_gestureTypesAllowedWhileDisableAssertionsExist;
      v7 = [NSNumber numberWithUnsignedInteger:a3];
      LOBYTE(gestureTypesAllowedWhileDisableAssertionsExist) = [(NSSet *)gestureTypesAllowedWhileDisableAssertionsExist containsObject:v7];

      LOBYTE(v5) = (_BYTE)gestureTypesAllowedWhileDisableAssertionsExist;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)_updateIgnoreHIDEdgeFlagsAssertions
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(BSCompoundAssertion *)self->_ignoreHIDEdgeFlagsAssertion isActive])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v3 = [(NSMutableDictionary *)self->_typeToGesture allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v9 = objc_opt_class();
          id v10 = v8;
          if (v9)
          {
            if (objc_opt_isKindOfClass()) {
              v11 = v10;
            }
            else {
              v11 = 0;
            }
          }
          else
          {
            v11 = 0;
          }
          id v12 = v11;

          if (objc_opt_respondsToSelector())
          {
            v13 = [(NSMapTable *)self->_ignoreHIDEdgeFlagsAssertions objectForKey:v12];

            if (!v13)
            {
              v14 = [v12 _beginRequiringIgnoresHIDEdgeFlagsForReason:@"SBSystemGestureManager"];
              ignoreHIDEdgeFlagsAssertions = self->_ignoreHIDEdgeFlagsAssertions;
              if (!ignoreHIDEdgeFlagsAssertions)
              {
                v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                v17 = self->_ignoreHIDEdgeFlagsAssertions;
                self->_ignoreHIDEdgeFlagsAssertions = v16;

                ignoreHIDEdgeFlagsAssertions = self->_ignoreHIDEdgeFlagsAssertions;
              }
              [(NSMapTable *)ignoreHIDEdgeFlagsAssertions setObject:v14 forKey:v12];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v3 = (void *)[(NSMapTable *)self->_ignoreHIDEdgeFlagsAssertions copy];
    v18 = self->_ignoreHIDEdgeFlagsAssertions;
    self->_ignoreHIDEdgeFlagsAssertions = 0;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v19 = objc_msgSend(v3, "objectEnumerator", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * j) _invalidate];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v21);
    }
  }
}

- (BOOL)_isTouchGestureWithType:(unint64_t)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x15uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x45uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5AuLL:
    case 0x5BuLL:
    case 0x5EuLL:
    case 0x5FuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x86uLL:
    case 0x88uLL:
      BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_configureForNewSystemGestureWindowIfNecessary
{
  id v50 = [(SBSystemGestureManager *)self windowForSystemGestures];
  uint64_t v4 = [v50 _contextId];
  uint64_t v5 = v50;
  if (v50 && v4 != self->_lastSystemGestureWindowContextId)
  {
    [(BSInvalidatable *)self->_systemGestureEventDeferringRule invalidate];
    [(BSInvalidatable *)self->_systemGestureSymbolicRule invalidate];
    [(BSInvalidatable *)self->_pointerEventRoutingAssertion invalidate];
    [(UIPointerInteraction *)self->_systemPointerInteraction invalidate];
    [(BSInvalidatable *)self->_systemPointerContextIDAssertion invalidate];
    uint64_t v6 = [MEMORY[0x1E4F62420] sharedInstance];
    v7 = [v6 configurationForIdentity:self->_displayIdentity];

    if (!v7)
    {
      v8 = [MEMORY[0x1E4F62420] sharedInstance];
      uint64_t v9 = [(FBSDisplayIdentity *)self->_displayIdentity rootIdentity];
      v7 = [v8 configurationForIdentity:v9];

      if (!v7)
      {
        v49 = [MEMORY[0x1E4F28B00] currentHandler];
        [v49 handleFailureInMethod:a2, self, @"SBSystemGestureManager.m", 796, @"We can't find a display configuration for identity: %@", self->_displayIdentity object file lineNumber description];

        v7 = 0;
      }
    }
    id v10 = (void *)[MEMORY[0x1E4F4F358] new];
    v11 = [MEMORY[0x1E4F4F280] systemEnvironment];
    [v10 setEnvironment:v11];

    id v12 = [v7 hardwareIdentifier];

    v13 = (void *)MEMORY[0x1E4F4F2D0];
    if (v12)
    {
      v14 = [v7 hardwareIdentifier];
      v15 = [v13 displayWithHardwareIdentifier:v14];
      [v10 setDisplay:v15];
    }
    else
    {
      v14 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
      [v10 setDisplay:v14];
    }

    v16 = (void *)[MEMORY[0x1E4F4F368] new];
    v17 = [MEMORY[0x1E4F4F290] tokenForIdentifierOfCAContext:v4];
    [v16 setToken:v17];

    v18 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    v19 = NSString;
    uint64_t v20 = [v7 hardwareIdentifier];
    uint64_t v21 = (void *)v20;
    uint64_t v22 = @"Main";
    if (v20) {
      uint64_t v22 = (__CFString *)v20;
    }
    v23 = [v19 stringWithFormat:@"systemGestures-%@", v22];
    long long v24 = [v18 deferEventsMatchingPredicate:v10 toTarget:v16 withReason:v23];
    systemGestureEventDeferringRule = self->_systemGestureEventDeferringRule;
    self->_systemGestureEventDeferringRule = v24;

    long long v26 = (void *)[v10 mutableCopy];
    long long v27 = +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:v7];
    [v26 setToken:v27];

    long long v28 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    long long v29 = NSString;
    uint64_t v30 = [v7 hardwareIdentifier];
    long long v31 = (void *)v30;
    v32 = @"Main";
    if (v30) {
      v32 = (__CFString *)v30;
    }
    v33 = [v29 stringWithFormat:@"systemGestureSymbol-%@", v32];
    uint64_t v34 = [v28 deferEventsMatchingPredicate:v26 toTarget:v16 withReason:v33];
    systemGestureSymbolicRule = self->_systemGestureSymbolicRule;
    self->_systemGestureSymbolicRule = v34;

    v36 = [MEMORY[0x1E4F4F350] sharedInstance];
    v37 = [v7 hardwareIdentifier];
    v38 = [MEMORY[0x1E4F4F348] build:&__block_literal_global_100_0];
    v39 = [v36 requestGlobalMouseEventsForDisplay:v37 targetContextID:v4 options:v38];
    pointerEventRoutingAssertion = self->_pointerEventRoutingAssertion;
    self->_pointerEventRoutingAssertion = v39;

    self->_lastSystemGestureWindowContextId = v4;
    v41 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
    systemPointerInteraction = self->_systemPointerInteraction;
    self->_systemPointerInteraction = v41;

    [v50 addInteraction:self->_systemPointerInteraction];
    v43 = [(id)SBApp mousePointerManager];
    v44 = [v7 hardwareIdentifier];
    v45 = [v43 setSystemPointerInteractionContextID:v4 displayWithHardwareIdentifier:v44];
    systemPointerContextIDAssertion = self->_systemPointerContextIDAssertion;
    self->_systemPointerContextIDAssertion = v45;

    v47 = (UIPencilInteraction *)objc_alloc_init(MEMORY[0x1E4F42C58]);
    systemPencilInteraction = self->_systemPencilInteraction;
    self->_systemPencilInteraction = v47;

    [(UIPencilInteraction *)self->_systemPencilInteraction setDelegate:self];
    [v50 addInteraction:self->_systemPencilInteraction];

    uint64_t v5 = v50;
  }
}

- (void)_enableSystemGesture:(id)a3 withType:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  typeToState = self->_typeToState;
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v9 = [(NSMutableDictionary *)typeToState objectForKey:v8];
  char v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    v11 = SBLogSystemGestureDetail();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      displayIdentity = self->_displayIdentity;
      v19 = SBSystemGestureTypeDebugName(a4);
      int v20 = 138412802;
      uint64_t v21 = displayIdentity;
      __int16 v22 = 2114;
      v23 = v19;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "(Display - %@) Enabling System Gesture Type: %{public}@ - %@", (uint8_t *)&v20, 0x20u);
    }
    id v12 = self->_typeToState;
    v13 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v12 setObject:MEMORY[0x1E4F1CC38] forKey:v13];

    [v6 addTarget:self action:sel__systemGestureChanged_];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SBIndirectTouchLifecycleMonitor *)self->_indirectTouchLifecycleMonitor addObserver:v6];
    }
    v14 = [v6 allowedTouchTypes];
    uint64_t v15 = [v14 count];

    if (v15) {
      int64_t v16 = [(SBSystemGestureManager *)self _recognitionEventForTouchGestureType:a4];
    }
    else {
      int64_t v16 = 2;
    }
    v17 = [(SBSystemGestureManager *)self systemGestureManager];
    [v17 addGestureRecognizer:v6 recognitionEvent:v16 toDisplayWithIdentity:self->_displayIdentity];
  }
}

- (id)windowForSystemGestures
{
  if (self->_displayIdentity)
  {
    v3 = [(SBSystemGestureManager *)self systemGestureManager];
    uint64_t v4 = [v3 windowForSystemGesturesForDisplayWithIdentity:self->_displayIdentity];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (_UISystemGestureManager)systemGestureManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  return (_UISystemGestureManager *)WeakRetained;
}

- (int64_t)_recognitionEventForTouchGestureType:(unint64_t)a3
{
  int64_t v3 = 2;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 6uLL:
      uint64_t v4 = [MEMORY[0x1E4F4F7D0] sharedInstance];
      if ([v4 homeButtonType] == 2) {
        goto LABEL_5;
      }
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() == 2) {
LABEL_5:
        }
          int64_t v3 = 3;
        else {
          int64_t v3 = 1;
        }
      }
      else
      {
        id v6 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v6 userInterfaceIdiom] == 1) {
          int64_t v3 = 3;
        }
        else {
          int64_t v3 = 1;
        }
      }
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 0xCuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x2FuLL:
    case 0x32uLL:
    case 0x34uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3DuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x42uLL:
    case 0x43uLL:
      goto LABEL_10;
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xDuLL:
    case 0xFuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x31uLL:
    case 0x33uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x44uLL:
      return v3;
    case 0x19uLL:
    case 0x1AuLL:
    case 0x20uLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x30uLL:
    case 0x39uLL:
      goto LABEL_9;
    default:
      char v5 = a3 - 94;
      if (a3 - 94 > 0x1A) {
        goto LABEL_10;
      }
      if (((1 << v5) & 0x4A0FD) == 0)
      {
        if (((1 << v5) & 0x6210000) != 0) {
LABEL_9:
        }
          int64_t v3 = 3;
        else {
LABEL_10:
        }
          int64_t v3 = 1;
      }
      break;
  }
  return v3;
}

- (BOOL)isSystemGestureRecognizer:(id)a3
{
  if (!a3) {
    return 0;
  }
  typeToGesture = self->_typeToGesture;
  id v4 = a3;
  char v5 = [(NSMutableDictionary *)typeToGesture allValues];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)mainDisplayManager
{
  return +[SBMainDisplaySystemGestureManager sharedInstance];
}

- (SBSystemGestureManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSystemGestureManager.m" lineNumber:98 description:@"use initWithDisplay:"];

  return 0;
}

- (id)_initWithDisplayIdentity:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBSystemGestureManager.m", 103, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)SBSystemGestureManager;
  v7 = [(SBSystemGestureManager *)&v26 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_displayIdentity, a3);
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    typeToGesture = v8->_typeToGesture;
    v8->_typeToGesture = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    typeToState = v8->_typeToState;
    v8->_typeToState = v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    recognizingTouchGestures = v8->_recognizingTouchGestures;
    v8->_recognizingTouchGestures = (NSMapTable *)v13;

    uint64_t v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    touchGestures = v8->_touchGestures;
    v8->_touchGestures = v15;

    if ([MEMORY[0x1E4FA6010] isRunningXCTest])
    {
      v17 = 0;
    }
    else
    {
      v17 = [MEMORY[0x1E4F43350] sharedInstance];
    }
    objc_storeWeak((id *)&v8->_systemGestureManager, v17);
    uint64_t v18 = [v17 allowGestureRecognizersOnDisplayWithIdentity:v6];
    systemGesturesAllowedToken = v8->_systemGesturesAllowedToken;
    v8->_systemGesturesAllowedToken = (BSInvalidatable *)v18;

    int v20 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v21 = [v20 userInterfaceIdiom];

    if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      __int16 v22 = [[SBIndirectTouchLifecycleMonitor alloc] initWithSystemGestureManager:v8];
      indirectTouchLifecycleMonitor = v8->_indirectTouchLifecycleMonitor;
      v8->_indirectTouchLifecycleMonitor = v22;
    }
    [(SBSystemGestureManager *)v8 _evaluateEnablement];
  }
  return v8;
}

- (void)removeGestureRecognizer:(id)a3
{
  id v4 = a3;
  char v5 = objc_getAssociatedObject(v4, "_SBSystemGestureType");
  if (v5)
  {
    objc_setAssociatedObject(v4, "_SBSystemGestureType", 0, (void *)1);
    uint64_t v6 = [v5 unsignedIntegerValue];
    if ([(SBSystemGestureManager *)self _isTouchGestureWithType:v6]) {
      [(NSMutableSet *)self->_touchGestures removeObject:v4];
    }
    [(NSMutableDictionary *)self->_typeToGesture removeObjectForKey:v5];
    [(SBSystemGestureManager *)self _disableSystemGesture:v4 withType:v6];
  }
  else
  {
    v7 = SBLogSystemGesture();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSystemGestureManager removeGestureRecognizer:]((uint64_t)v4, v7);
    }
  }
  [(SBSystemGestureManager *)self _invalidateIgnoreHidEdgeFlagsAssertionForRemovedRecognizer:v4];
}

- (void)gestureRecognizerOfType:(unint64_t)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  typeToGesture = self->_typeToGesture;
  uint64_t v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)typeToGesture objectForKey:v8];

  [v9 requireGestureRecognizerToFail:v7];
}

- (void)cancelGestureRecognizerOfType:(unint64_t)a3 reason:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  typeToGesture = self->_typeToGesture;
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)typeToGesture objectForKey:v8];

  if (v9 && [v9 isEnabled])
  {
    char v10 = SBLogSystemGesture();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sb_briefDescription");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v12 = [v9 state];
      if (v12 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"<unknown: 0x%X>", v12);
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v13 = off_1E6B08210[v12];
      }
      v14 = SBSystemGestureTypeDebugName(a3);
      *(_DWORD *)buf = 138544130;
      id v16 = v6;
      __int16 v17 = 2114;
      id v18 = v11;
      __int16 v19 = 2114;
      int v20 = v13;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "canceling (reason: %{public}@) <%{public}@ state:%{public}@ sgtype:'%{public}@' >", buf, 0x2Au);
    }
    [v9 setEnabled:0];
    [v9 setEnabled:1];
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(SBSystemGestureManager *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isAnyTouchGestureRunning
{
  return [(NSMapTable *)self->_recognizingTouchGestures count] != 0;
}

- (unint64_t)typeOfSystemGesture:(id)a3
{
  int64_t v3 = objc_getAssociatedObject(a3, "_SBSystemGestureType");
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v5 = [(SBSystemGestureManager *)self windowForSystemGestures];
  id v6 = [v5 windowScene];
  id v7 = [v6 screen];
  v8 = [v7 displayIdentity];

  id v9 = [(id)SBApp windowSceneManager];
  char v10 = [v9 windowSceneForDisplayIdentity:v8];

  id v11 = [v10 pictureInPictureManager];
  unint64_t v12 = [v10 screen];
  uint64_t v13 = [v12 fixedCoordinateSpace];
  v14 = [v10 coordinateSpace];
  objc_msgSend(v13, "convertPoint:toCoordinateSpace:", v14, x, y);
  double v16 = v15;
  double v18 = v17;

  int v19 = objc_msgSend(v11, "isPointWithinAnyPictureInPictureContent:", v16, v18) ^ 1;
  int v20 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v28.double x = x;
    v28.double y = y;
    __int16 v21 = NSStringFromPoint(v28);
    int v23 = 138478083;
    __int16 v24 = v21;
    __int16 v25 = 1024;
    int v26 = v19;
    _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Should system gesture receive touch with location:%{private}@ <%{BOOL}u>", (uint8_t *)&v23, 0x12u);
  }
  return v19;
}

- (BOOL)isValid
{
  return !self->_isInvalidated;
}

- (id)succinctDescription
{
  v2 = [(SBSystemGestureManager *)self succinctDescriptionBuilder];
  int64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  int64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_displayIdentity withName:@"_display"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(SBSystemGestureManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSystemGestureManager *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_recognizingTouchGestures withName:@"_recognizingTouchGestures"];
  id v6 = (id)[v4 appendObject:self->_typeToGesture withName:@"_typeToGesture"];
  id v7 = (id)[v4 appendObject:self->_typeToState withName:@"_typeToState"];
  return v4;
}

- (void)invalidate
{
  typeToGesture = self->_typeToGesture;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__SBSystemGestureManager_invalidate__block_invoke;
  v11[3] = &unk_1E6B081D0;
  v11[4] = self;
  [(NSMutableDictionary *)typeToGesture enumerateKeysAndObjectsUsingBlock:v11];
  [(BSInvalidatable *)self->_systemGestureSymbolicRule invalidate];
  systemGestureSymbolicRule = self->_systemGestureSymbolicRule;
  self->_systemGestureSymbolicRule = 0;

  [(BSInvalidatable *)self->_systemGestureEventDeferringRule invalidate];
  systemGestureEventDeferringRule = self->_systemGestureEventDeferringRule;
  self->_systemGestureEventDeferringRule = 0;

  [(BSInvalidatable *)self->_pointerEventRoutingAssertion invalidate];
  pointerEventRoutingAssertion = self->_pointerEventRoutingAssertion;
  self->_pointerEventRoutingAssertion = 0;

  [(BSInvalidatable *)self->_systemGesturesAllowedToken invalidate];
  systemGesturesAllowedToken = self->_systemGesturesAllowedToken;
  self->_systemGesturesAllowedToken = 0;

  [(UIPointerInteraction *)self->_systemPointerInteraction invalidate];
  systemPointerInteraction = self->_systemPointerInteraction;
  self->_systemPointerInteraction = 0;

  [(BSInvalidatable *)self->_systemPointerContextIDAssertion invalidate];
  systemPointerContextIDAssertion = self->_systemPointerContextIDAssertion;
  self->_systemPointerContextIDAssertion = 0;

  systemPencilInteraction = self->_systemPencilInteraction;
  self->_systemPencilInteraction = 0;

  self->_isInvalidated = 1;
}

void __36__SBSystemGestureManager_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "_disableSystemGesture:withType:", v5, objc_msgSend(a2, "unsignedIntegerValue"));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  unint64_t v12 = [v10 view];
  uint64_t v13 = SBSafeCast(v11, v12);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  double v15 = [WeakRetained pointerInteraction:v10 window:v13 regionForRequest:v9 defaultRegion:v8];

  return v15;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = [v7 view];
  id v10 = SBSafeCast(v8, v9);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  unint64_t v12 = [WeakRetained pointerInteraction:v7 window:v10 styleForRegion:v6];

  return v12;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  unint64_t v12 = [v10 view];
  SBSafeCast(v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  [WeakRetained pointerInteraction:v10 window:v14 willEnterRegion:v9 animator:v8];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  unint64_t v12 = [v10 view];
  SBSafeCast(v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  [WeakRetained pointerInteraction:v10 window:v14 willExitRegion:v9 animator:v8];
}

- (void)_pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4
{
  id v4 = a4;
  if ([MEMORY[0x1E4F42C58] _preferredSqueezeAction] == 6 && objc_msgSend(v4, "_phase") == 2)
  {
    id v5 = SBLogSystemGesturePencilSqueeze();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemGestureManager did receive pencil squeeze", v14, 2u);
    }

    [v4 _timestamp];
    double v7 = v6;
    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    double v9 = CACurrentMediaTime();
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    [v10 timeIntervalSinceReferenceDate];
    unint64_t v12 = [v8 dateWithTimeIntervalSinceReferenceDate:v7 - (v9 - v11)];

    uint64_t v13 = [(id)SBApp pencilSqueezeActionControl];
    -[SBPencilSqueezeActionControl performSqueezeActionWithTimestamp:]((uint64_t)v13, v12);
  }
}

- (void)_evaluateEnablement
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_gesturesDisabledAssertions count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int64_t v3 = self->_gesturesDisabledAssertions;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      double v6 = 0;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v3);
          }
          double v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) exceptions];
          id v10 = v9;
          if (v6) {
            [v6 intersectSet:v9];
          }
          else {
            double v6 = [v9 mutableCopy];
          }
        }
        uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v5);
    }
    else
    {
      double v6 = 0;
    }

    objc_storeStrong((id *)&self->_gestureTypesAllowedWhileDisableAssertionsExist, v6);
    unint64_t v12 = SBLogSystemGestureDetail();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      displayIdentitdouble y = self->_displayIdentity;
      id v14 = [(NSSet *)self->_gestureTypesAllowedWhileDisableAssertionsExist bs_map:&__block_literal_global_266];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = displayIdentity;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "(Display - %{public}@) System gestures globally disabled (exceptions:%{public}@)", buf, 0x16u);
    }
  }
  else
  {
    double v6 = SBLogSystemGestureDetail();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = self->_displayIdentity;
      *(_DWORD *)buf = 138543362;
      __int16 v22 = v11;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(Display - %{public}@) System gestures globally enabled (may be individually disabled)", buf, 0xCu);
    }
  }

  typeToGesture = self->_typeToGesture;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__SBSystemGestureManager__evaluateEnablement__block_invoke_51;
  v16[3] = &unk_1E6B081D0;
  v16[4] = self;
  [(NSMutableDictionary *)typeToGesture enumerateKeysAndObjectsUsingBlock:v16];
}

__CFString *__45__SBSystemGestureManager__evaluateEnablement__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  return SBSystemGestureTypeDebugName(v2);
}

void __45__SBSystemGestureManager__evaluateEnablement__block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v9 = a3;
  id v6 = a2;
  LODWORD(v5) = objc_msgSend(v5, "shouldEnableSystemGestureWithType:", objc_msgSend(v6, "unsignedIntegerValue"));
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 unsignedIntegerValue];

  if (v5) {
    [v7 _enableSystemGesture:v9 withType:v8];
  }
  else {
    [v7 _disableSystemGesture:v9 withType:v8];
  }
}

- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(SBSystemGestureManager *)self areSystemGesturesDisabledForAccessibility])
  {
    uint64_t v5 = SBLogSystemGestureDetail();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      displayIdentitdouble y = self->_displayIdentity;
      int v15 = 138543362;
      double v16 = displayIdentity;
      uint64_t v7 = "(Display - %{public}@) Not allowing system gestures because accessibility has disabled them";
      uint64_t v8 = v5;
      uint32_t v9 = 12;
LABEL_9:
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v15, v9);
    }
  }
  else
  {
    if (![(NSMutableSet *)self->_gesturesDisabledAssertions count]) {
      return 1;
    }
    gestureTypesAllowedWhileDisableAssertionsExist = self->_gestureTypesAllowedWhileDisableAssertionsExist;
    double v11 = [NSNumber numberWithUnsignedInteger:a3];
    LOBYTE(gestureTypesAllowedWhileDisableAssertionsExist) = [(NSSet *)gestureTypesAllowedWhileDisableAssertionsExist containsObject:v11];

    if (gestureTypesAllowedWhileDisableAssertionsExist) {
      return 1;
    }
    uint64_t v5 = SBLogSystemGestureDetail();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_displayIdentity;
      gesturesDisabledAssertions = self->_gesturesDisabledAssertions;
      int v15 = 138543618;
      double v16 = v13;
      __int16 v17 = 2114;
      long long v18 = gesturesDisabledAssertions;
      uint64_t v7 = "(Display - %{public}@) Not allowing system gestures due to assertions:%{public}@";
      uint64_t v8 = v5;
      uint32_t v9 = 22;
      goto LABEL_9;
    }
  }

  return 0;
}

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  return 0;
}

- (void)_disableSystemGesture:(id)a3 withType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  typeToState = self->_typeToState;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
  uint32_t v9 = [(NSMutableDictionary *)typeToState objectForKey:v8];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    double v11 = SBLogSystemGestureDetail();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      displayIdentitdouble y = self->_displayIdentity;
      double v16 = SBSystemGestureTypeDebugName(a4);
      int v17 = 138412802;
      long long v18 = displayIdentity;
      __int16 v19 = 2114;
      long long v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "(Display - %@) Disabling System Gesture Type: %{public}@ - %@", (uint8_t *)&v17, 0x20u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SBIndirectTouchLifecycleMonitor *)self->_indirectTouchLifecycleMonitor removeObserver:v6];
    }
    unint64_t v12 = self->_typeToState;
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v12 removeObjectForKey:v13];

    [v6 removeTarget:self action:0];
    id v14 = [(SBSystemGestureManager *)self systemGestureManager];
    [v14 removeGestureRecognizer:v6 fromDisplayWithIdentity:self->_displayIdentity];
    [(NSMapTable *)self->_recognizingTouchGestures removeObjectForKey:v6];
  }
}

- (void)_systemGestureChanged:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_touchGestures containsObject:v4])
  {
    uint64_t v5 = [v4 state];
    id v6 = objc_getAssociatedObject(v4, "_SBSystemGestureType");
    uint64_t v7 = *MEMORY[0x1E4FA76A0];
    v21[0] = *MEMORY[0x1E4FA76A8];
    v21[1] = v7;
    v22[0] = v6;
    uint64_t v8 = [NSNumber numberWithInteger:v5];
    v22[1] = v8;
    uint32_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    int v10 = (void *)MEMORY[0x1E4FA5E78];
    id v11 = v9;
    unint64_t v12 = [v10 sharedInstance];
    [v12 emitEvent:12 withPayload:v11];

    if ((unint64_t)(v5 - 3) >= 3)
    {
      if (v5 != 1)
      {
LABEL_14:

        goto LABEL_15;
      }
      double v16 = SBLogSystemGestureDetail();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[SBSystemGestureManager _systemGestureChanged:]();
      }

      int v17 = SBSystemGestureTypeDebugName([v6 unsignedIntegerValue]);
      long long v18 = [v17 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F3084718];

      id v14 = [v18 stringByAppendingString:@"-Dragging"];

      __int16 v19 = [MEMORY[0x1E4F28F80] processInfo];
      long long v20 = [v19 beginActivityWithOptions:0x200000000000 reason:v14];

      [(NSMapTable *)self->_recognizingTouchGestures setObject:v20 forKey:v4];
    }
    else
    {
      uint64_t v13 = SBLogSystemGestureDetail();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[SBSystemGestureManager _systemGestureChanged:]();
      }

      id v14 = [(NSMapTable *)self->_recognizingTouchGestures objectForKey:v4];
      if (v14 && v5 == 3)
      {
        int v15 = [MEMORY[0x1E4F28F80] processInfo];
        [v15 endActivity:v14];
      }
      [(NSMapTable *)self->_recognizingTouchGestures removeObjectForKey:v4];
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (void)ignoreScreenEdgeTouchWithIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(NSMutableDictionary *)self->_typeToGesture objectForKey:&unk_1F334A9A0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 _ignoreTouchForTouchIdentifier:v3];
  }
}

- (id)acquireSystemGestureDisableAssertionForReason:(id)a3 exceptSystemGestureTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_gesturesDisabledAssertions)
  {
    uint64_t v8 = (NSMutableSet *)objc_opt_new();
    gesturesDisabledAssertions = self->_gesturesDisabledAssertions;
    self->_gesturesDisabledAssertions = v8;
  }
  int v10 = [SBDisableSystemGestureAssertion alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__SBSystemGestureManager_acquireSystemGestureDisableAssertionForReason_exceptSystemGestureTypes___block_invoke;
  v14[3] = &unk_1E6AF4940;
  v14[4] = self;
  id v11 = [(BSSimpleAssertion *)v10 initWithIdentifier:@"SystemGesturesDisabled" forReason:v6 queue:MEMORY[0x1E4F14428] invalidationBlock:v14];
  unint64_t v12 = v11;
  if (v7) {
    [(SBDisableSystemGestureAssertion *)v11 setExceptions:v7];
  }
  [(NSMutableSet *)self->_gesturesDisabledAssertions addObject:v12];
  [(SBSystemGestureManager *)self _evaluateEnablement];

  return v12;
}

uint64_t __97__SBSystemGestureManager_acquireSystemGestureDisableAssertionForReason_exceptSystemGestureTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:a2];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _evaluateEnablement];
}

- (id)acquireSystemGestureDisableAssertionForReason:(id)a3 forSystemGestureTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:139];
  for (uint64_t i = 1; i != 139; ++i)
  {
    int v10 = [NSNumber numberWithInteger:i];
    if (([v7 containsObject:v10] & 1) == 0) {
      [v8 addObject:v10];
    }
  }
  id v11 = [(SBSystemGestureManager *)self acquireSystemGestureDisableAssertionForReason:v6 exceptSystemGestureTypes:v8];

  return v11;
}

void __72__SBSystemGestureManager__configureForNewSystemGestureWindowIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPinOnButtonDown:SBFIsChamoisExternalDisplayControllerAvailable()];
}

+ (id)deviceHardwareButtonGestureTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBSystemGestureManager_deviceHardwareButtonGestureTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceHardwareButtonGestureTypes_onceToken != -1) {
    dispatch_once(&deviceHardwareButtonGestureTypes_onceToken, block);
  }
  id v2 = (void *)deviceHardwareButtonGestureTypes_deviceHardwareButtonGestureTypes;
  return v2;
}

void __58__SBSystemGestureManager_deviceHardwareButtonGestureTypes__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F1CA80] set];
  for (uint64_t i = 1; i != 139; ++i)
  {
    if ([*(id *)(a1 + 32) _isDeviceHardwareButtonGestureType:i])
    {
      uint64_t v3 = [NSNumber numberWithUnsignedInteger:i];
      [v6 addObject:v3];
    }
  }
  uint64_t v4 = [v6 copy];
  uint64_t v5 = (void *)deviceHardwareButtonGestureTypes_deviceHardwareButtonGestureTypes;
  deviceHardwareButtonGestureTypes_deviceHardwareButtonGestureTypes = v4;
}

+ (BOOL)_isDeviceHardwareButtonGestureType:(unint64_t)a3
{
  if (a3 - 69 < 0x11) {
    return 1;
  }
  BOOL result = 0;
  if (a3 - 88 <= 0x30 && ((1 << (a3 - 88)) & 0x1000000000007) != 0) {
    return 1;
  }
  return result;
}

- (id)acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason:(id)a3
{
  id v4 = a3;
  ignoreHIDEdgeFlagsAssertion = self->_ignoreHIDEdgeFlagsAssertion;
  if (!ignoreHIDEdgeFlagsAssertion)
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F4F6E8];
    id v7 = [NSString stringWithFormat:@"ignoreHIDEdgeFlags(%@)", self];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__SBSystemGestureManager_acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason___block_invoke;
    v14[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v15, &location);
    uint64_t v8 = [v6 assertionWithIdentifier:v7 stateDidChangeHandler:v14];
    uint32_t v9 = self->_ignoreHIDEdgeFlagsAssertion;
    self->_ignoreHIDEdgeFlagsAssertion = v8;

    int v10 = self->_ignoreHIDEdgeFlagsAssertion;
    id v11 = SBLogSystemGesture();
    [(BSCompoundAssertion *)v10 setLog:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    ignoreHIDEdgeFlagsAssertion = self->_ignoreHIDEdgeFlagsAssertion;
  }
  unint64_t v12 = [(BSCompoundAssertion *)ignoreHIDEdgeFlagsAssertion acquireForReason:v4];

  return v12;
}

void __79__SBSystemGestureManager_acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIgnoreHIDEdgeFlagsAssertions];
}

- (void)_invalidateIgnoreHidEdgeFlagsAssertionForRemovedRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [(NSMapTable *)self->_ignoreHIDEdgeFlagsAssertions objectForKey:v7];
    if (v8)
    {
      [(NSMapTable *)self->_ignoreHIDEdgeFlagsAssertions removeObjectForKey:v7];
      [v8 _invalidate];
    }
  }
}

- (BOOL)areSystemGesturesDisabledForAccessibility
{
  return self->_systemGesturesDisabledForAccessibility;
}

- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3
{
  self->_systemGesturesDisabledForAccessibilitdouble y = a3;
}

- (SBIndirectTouchLifecycleMonitor)indirectTouchLifecycleMonitor
{
  return self->_indirectTouchLifecycleMonitor;
}

- (void)setIndirectTouchLifecycleMonitor:(id)a3
{
}

- (void)setSystemGestureManager:(id)a3
{
}

- (SBSystemUIPointerInteractionDelegate)systemPointerInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionDelegate);
  return (SBSystemUIPointerInteractionDelegate *)WeakRetained;
}

- (void)setSystemPointerInteractionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemPointerInteractionDelegate);
  objc_destroyWeak((id *)&self->_systemGestureManager);
  objc_storeStrong((id *)&self->_indirectTouchLifecycleMonitor, 0);
  objc_storeStrong((id *)&self->_systemPencilInteraction, 0);
  objc_storeStrong((id *)&self->_ignoreHIDEdgeFlagsAssertion, 0);
  objc_storeStrong((id *)&self->_ignoreHIDEdgeFlagsAssertions, 0);
  objc_storeStrong((id *)&self->_systemPointerContextIDAssertion, 0);
  objc_storeStrong((id *)&self->_systemPointerInteraction, 0);
  objc_storeStrong((id *)&self->_systemGesturesAllowedToken, 0);
  objc_storeStrong((id *)&self->_pointerEventRoutingAssertion, 0);
  objc_storeStrong((id *)&self->_systemGestureEventDeferringRule, 0);
  objc_storeStrong((id *)&self->_systemGestureSymbolicRule, 0);
  objc_storeStrong((id *)&self->_gestureTypesAllowedWhileDisableAssertionsExist, 0);
  objc_storeStrong((id *)&self->_gesturesDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_touchGestures, 0);
  objc_storeStrong((id *)&self->_recognizingTouchGestures, 0);
  objc_storeStrong((id *)&self->_typeToState, 0);
  objc_storeStrong((id *)&self->_gestureToType, 0);
  objc_storeStrong((id *)&self->_typeToGesture, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

- (void)removeGestureRecognizer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "we don't currently think this is a system gesture: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_systemGestureChanged:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_27(&dword_1D85BA000, v0, v1, "%s: (Display - %@) - %@", v2);
}

@end