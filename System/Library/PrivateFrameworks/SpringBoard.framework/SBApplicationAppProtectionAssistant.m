@interface SBApplicationAppProtectionAssistant
+ (BOOL)areAnyApplicationsHidden;
+ (BOOL)areAnyApplicationsLocked;
+ (BOOL)shouldHideApplicationWithBundleIdentifier:(id)a3;
+ (id)_assistantForBundleIdentifier:(id)a3;
+ (id)assistantForApplication:(id)a3;
- (APApplication)appProtectionApplication;
- (BOOL)isHidden;
- (BOOL)shouldHide;
- (BOOL)shouldShield;
- (BSCompoundAssertion)visibilityAssertions;
- (NSHashTable)observers;
- (NSString)description;
- (NSString)displayName;
- (NSTimer)shouldHideDebounceTimer;
- (SBAppProtectionCoordinator)owningCoordinator;
- (SBApplicationAppProtectionAssistant)initWithApplication:(id)a3;
- (id)acquireVisibilityAssertionForReason:(id)a3;
- (id)createShieldUIView;
- (id)createShieldUIViewController;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_updateShouldHide;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)requestUnshielding;
- (void)setOwningCoordinator:(id)a3;
- (void)setShouldHide:(BOOL)a3;
- (void)setShouldHideDebounceTimer:(id)a3;
- (void)setShouldShield:(BOOL)a3;
@end

@implementation SBApplicationAppProtectionAssistant

+ (BOOL)areAnyApplicationsHidden
{
  BOOL v2 = +[SBAppProtectionCoordinator isEnabled];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4B800] hiddenMetaSubject];
    char v4 = [v3 isHidden];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)shouldShield
{
  return self->_shouldShield;
}

void __59__SBApplicationAppProtectionAssistant_initWithApplication___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v4 = [WeakRetained owningCoordinator];
  int v5 = [v3 isActive];

  if (v5) {
    [v4 noteSceneWillBecomeForegroundVisibleForAssistant:WeakRetained];
  }
  else {
    [v4 noteAllScenesDismissedForAssistant:WeakRetained];
  }
}

- (SBAppProtectionCoordinator)owningCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningCoordinator);
  return (SBAppProtectionCoordinator *)WeakRetained;
}

- (APApplication)appProtectionApplication
{
  return self->_appProtectionApplication;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBApplicationAppProtectionAssistant.m", 149, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  observers = self->_observers;
  if (!observers)
  {
    v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v8 = self->_observers;
    self->_observers = v7;

    id v5 = v10;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v5];
}

+ (id)assistantForApplication:(id)a3
{
  id v3 = a3;
  char v4 = +[SBApplicationController sharedInstanceIfExists];
  id v5 = [v4 _appProtectionCoordinator];
  v6 = [v5 assistantForApplication:v3];

  return v6;
}

- (id)acquireVisibilityAssertionForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBApplicationAppProtectionAssistant *)self visibilityAssertions];
  v6 = [v5 acquireForReason:v4];

  return v6;
}

- (BSCompoundAssertion)visibilityAssertions
{
  return self->_visibilityAssertions;
}

+ (id)_assistantForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SBApplicationController sharedInstanceIfExists];
  v6 = [v5 applicationWithBundleIdentifier:v4];

  v7 = [a1 assistantForApplication:v6];

  return v7;
}

+ (BOOL)areAnyApplicationsLocked
{
  BOOL v2 = +[SBAppProtectionCoordinator isEnabled];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F4B800] lockedMetaSubject];
    char v4 = [v3 isLocked];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)shouldHideApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (+[SBAppProtectionCoordinator isEnabled])
  {
    id v5 = [a1 _assistantForBundleIdentifier:v4];
    char v6 = [v5 shouldHide];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (SBApplicationAppProtectionAssistant)initWithApplication:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBApplicationAppProtectionAssistant.m", 58, @"Invalid parameter not satisfying: %@", @"application" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)SBApplicationAppProtectionAssistant;
  char v6 = [(SBApplicationAppProtectionAssistant *)&v28 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F4B7E0];
    v8 = [v5 bundleIdentifier];
    uint64_t v9 = [v7 applicationWithBundleIdentifier:v8];
    appProtectionApplication = v6->_appProtectionApplication;
    v6->_appProtectionApplication = (APApplication *)v9;

    uint64_t v11 = [v5 displayName];
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v11;

    objc_initWeak(&location, v6);
    v13 = (void *)MEMORY[0x1E4F4F6E8];
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v5 bundleIdentifier];
    v18 = [v14 stringWithFormat:@"%@: %p - %@", v16, v6, v17];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__SBApplicationAppProtectionAssistant_initWithApplication___block_invoke;
    v25[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v26, &location);
    uint64_t v19 = [v13 assertionWithIdentifier:v18 stateDidChangeHandler:v25];
    visibilityAssertions = v6->_visibilityAssertions;
    v6->_visibilityAssertions = (BSCompoundAssertion *)v19;

    v21 = v6->_visibilityAssertions;
    v22 = SBLogAppProtection();
    [(BSCompoundAssertion *)v21 setLog:v22];

    v6->_shouldHide = [(APApplication *)v6->_appProtectionApplication isHidden];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)invalidate
{
  [(BSCompoundAssertion *)self->_visibilityAssertions invalidate];
  shouldHideDebounceTimer = self->_shouldHideDebounceTimer;
  [(NSTimer *)shouldHideDebounceTimer invalidate];
}

- (void)setShouldShield:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_shouldShield != a3)
  {
    BOOL v3 = a3;
    self->_shouldShield = a3;
    id v5 = SBLogAppProtection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = [(SBApplicationAppProtectionAssistant *)self succinctDescription];
      LODWORD(buf) = 67109378;
      HIDWORD(buf) = v3;
      __int16 v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Setting shouldShield: %{BOOL}u for %{public}@", (uint8_t *)&buf, 0x12u);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 appProtectionAssistantShouldShieldDidChange:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    if (v3 && [(SBApplicationAppProtectionAssistant *)self isHidden])
    {
      v12 = [(SBApplicationAppProtectionAssistant *)self shouldHideDebounceTimer];
      if (v12)
      {
      }
      else if ([(SBApplicationAppProtectionAssistant *)self isHidden])
      {
        objc_initWeak(&buf, self);
        v14 = (void *)MEMORY[0x1E4F1CB00];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __55__SBApplicationAppProtectionAssistant_setShouldShield___block_invoke;
        v16[3] = &unk_1E6AF61A0;
        objc_copyWeak(&v17, &buf);
        v15 = [v14 scheduledTimerWithTimeInterval:0 repeats:v16 block:3.0];
        [(SBApplicationAppProtectionAssistant *)self setShouldHideDebounceTimer:v15];

        objc_destroyWeak(&v17);
        objc_destroyWeak(&buf);
      }
    }
    else
    {
      v13 = [(SBApplicationAppProtectionAssistant *)self shouldHideDebounceTimer];
      [v13 invalidate];

      [(SBApplicationAppProtectionAssistant *)self setShouldHideDebounceTimer:0];
      [(SBApplicationAppProtectionAssistant *)self setShouldHide:0];
    }
  }
}

void __55__SBApplicationAppProtectionAssistant_setShouldShield___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldHideDebounceTimer:0];
  [WeakRetained _updateShouldHide];
}

- (BOOL)isHidden
{
  BOOL v2 = [(SBApplicationAppProtectionAssistant *)self appProtectionApplication];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setShouldHide:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_shouldHide != a3)
  {
    self->_shouldHide = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 appProtectionAssistantShouldHideDidChange:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updateShouldHide
{
  char v3 = [(SBApplicationAppProtectionAssistant *)self shouldHideDebounceTimer];
  char v4 = [v3 isValid];

  if ((v4 & 1) == 0
    && [(SBApplicationAppProtectionAssistant *)self isHidden]
    && [(SBApplicationAppProtectionAssistant *)self shouldShield])
  {
    if (self->_shouldHide)
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v6 = [(SBApplicationAppProtectionAssistant *)self owningCoordinator];
      int v7 = [v6 shouldSuppressHiding];

      uint64_t v5 = v7 ^ 1u;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(SBApplicationAppProtectionAssistant *)self setShouldHide:v5];
}

- (id)createShieldUIViewController
{
  char v3 = [SBAppProtectionShieldViewController alloc];
  char v4 = [(SBApplicationAppProtectionAssistant *)self owningCoordinator];
  uint64_t v5 = [v4 systemAppOutlet];
  uint64_t v6 = [(SBAppProtectionShieldViewController *)v3 initWithAssistant:self systemAppOutlet:v5];

  return v6;
}

- (id)createShieldUIView
{
  char v3 = [SBAppProtectionShieldView alloc];
  char v4 = [(SBApplicationAppProtectionAssistant *)self owningCoordinator];
  uint64_t v5 = [v4 systemAppOutlet];
  uint64_t v6 = [(SBAppProtectionShieldView *)v3 initWithAssistant:self systemAppOutlet:v5];

  return v6;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_observers removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      id v4 = v7;
    }
  }
}

- (void)requestUnshielding
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = SBLogAppProtection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SBApplicationAppProtectionAssistant *)self succinctDescription];
    *(_DWORD *)id buf = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will request unshielding", buf, 0xCu);
  }
  NSUInteger v5 = [MEMORY[0x1E4F4B7E8] sharedGuard];
  uint64_t v6 = [(SBApplicationAppProtectionAssistant *)self appProtectionApplication];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SBApplicationAppProtectionAssistant_requestUnshielding__block_invoke;
  v7[3] = &unk_1E6AF8948;
  v7[4] = self;
  [v5 authenticateForShieldDismissalForSubject:v6 completion:v7];
}

void __57__SBApplicationAppProtectionAssistant_requestUnshielding__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SBLogAppProtection();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) succinctDescription];
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "authenticateForSubject: %@ with success: %{BOOL}u error: %{public}@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (NSString)description
{
  return (NSString *)[(SBApplicationAppProtectionAssistant *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  char v3 = [(SBApplicationAppProtectionAssistant *)self succinctDescriptionBuilder];
  id v4 = [(SBApplicationAppProtectionAssistant *)self appProtectionApplication];
  id v5 = [v4 bundleIdentifier];
  [v3 appendString:v5 withName:@"app"];

  uint64_t v6 = [v3 build];

  return v6;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(SBApplicationAppProtectionAssistant *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBApplicationAppProtectionAssistant *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBApplicationAppProtectionAssistant_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __77__SBApplicationAppProtectionAssistant_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldShield"), @"shouldShield", 1);
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldHide"), @"shouldHide", 1);
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHidden"), @"isHidden", 1);
  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) visibilityAssertions];
  id v6 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "isActive"), @"visibilityAssertions.isActive", 1);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)shouldHide
{
  return self->_shouldHide;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSTimer)shouldHideDebounceTimer
{
  return self->_shouldHideDebounceTimer;
}

- (void)setShouldHideDebounceTimer:(id)a3
{
}

- (void)setOwningCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningCoordinator);
  objc_storeStrong((id *)&self->_shouldHideDebounceTimer, 0);
  objc_storeStrong((id *)&self->_visibilityAssertions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_appProtectionApplication, 0);
}

@end