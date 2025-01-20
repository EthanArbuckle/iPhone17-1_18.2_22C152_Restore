@interface SBHearingTestModeCoordinator
+ (id)dndHearingTestModeClientIdentifier;
+ (id)dndModeAssertionClientIdentifier;
- (SBHearingTestModeCoordinator)init;
- (int64_t)hearingTestMode;
- (void)_acquireDNDModeAssertion;
- (void)_invalidateDNDModeAssertion;
- (void)_noteHearingTestModeActiveForProviderWithIdentifier:(id)a3;
- (void)_noteHearingTestModeInactiveForProviderWithIdentifier:(id)a3;
- (void)_recalculateHearingTestMode;
- (void)_setDNDHearingTestModeActive:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)addSceneExtensionIfNeeded:(id)a3;
- (void)hearingTestModeHostComponentDidChangeActiveState:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setHearingTestMode:(int64_t)a3;
@end

@implementation SBHearingTestModeCoordinator

- (void)addSceneExtensionIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 clientProcess];
  if ([v5 hasEntitlement:@"com.apple.springboard.hearing-test-mode"])
  {
    [v4 addExtension:objc_opt_class()];
    v6 = SBLogHearingTestMode();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 identifier];
      int v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Successfully added scene extension to scene with hearing test mode entitlement: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v8 = objc_opt_class();
    v9 = [v4 componentForExtension:v8 ofClass:objc_opt_class()];
    hearingTestModeHostComponent = self->_hearingTestModeHostComponent;
    self->_hearingTestModeHostComponent = v9;

    [(SBSUIHearingTestModeHostComponent *)self->_hearingTestModeHostComponent setDelegate:self];
  }
}

+ (id)dndModeAssertionClientIdentifier
{
  return @"com.apple.private.SpringBoard.focus.hearingTestMode";
}

+ (id)dndHearingTestModeClientIdentifier
{
  return @"com.apple.private.SpringBoard.focus.0191488e-ff8a-728d-a9f7-08a0a77abd7d";
}

- (SBHearingTestModeCoordinator)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBHearingTestModeCoordinator;
  v2 = [(SBHearingTestModeCoordinator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SBHearingTestModeCoordinator *)v2 _invalidateDNDModeAssertion];
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        uint64_t v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (v5) {
    [(NSHashTable *)self->_observers removeObject:v5];
  }
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)setHearingTestMode:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_hearingTestMode != a3)
  {
    self->_hearingTestMode = a3;
    if (a3 == 1)
    {
      [(SBHearingTestModeCoordinator *)self _acquireDNDModeAssertion];
    }
    else if (!a3)
    {
      [(SBHearingTestModeCoordinator *)self _invalidateDNDModeAssertion];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = (void *)[(NSHashTable *)self->_observers copy];
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
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 hearingTestModeCoordinatorDidChangeActiveState:self];
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

- (void)_noteHearingTestModeActiveForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  identifiersForHearingTestModeActiveProviders = self->_identifiersForHearingTestModeActiveProviders;
  id v8 = v4;
  if (!identifiersForHearingTestModeActiveProviders)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_identifiersForHearingTestModeActiveProviders;
    self->_identifiersForHearingTestModeActiveProviders = v6;

    id v4 = v8;
    identifiersForHearingTestModeActiveProviders = self->_identifiersForHearingTestModeActiveProviders;
  }
  [(NSMutableSet *)identifiersForHearingTestModeActiveProviders addObject:v4];
  [(SBHearingTestModeCoordinator *)self _recalculateHearingTestMode];
}

- (void)_noteHearingTestModeInactiveForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_identifiersForHearingTestModeActiveProviders, "containsObject:"))
  {
    [(NSMutableSet *)self->_identifiersForHearingTestModeActiveProviders removeObject:v4];
    [(SBHearingTestModeCoordinator *)self _recalculateHearingTestMode];
  }
}

- (void)_recalculateHearingTestMode
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_identifiersForHearingTestModeActiveProviders count])
  {
    [(SBHearingTestModeCoordinator *)self setHearingTestMode:1];
  }
  else
  {
    [(SBHearingTestModeCoordinator *)self setHearingTestMode:0];
    identifiersForHearingTestModeActiveProviders = self->_identifiersForHearingTestModeActiveProviders;
    self->_identifiersForHearingTestModeActiveProviders = 0;
  }
  id v4 = SBLogHearingTestMode();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = SBSHearingTestModeDescription();
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Updating coordinator hearing test mode to: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_acquireDNDModeAssertion
{
}

- (void)_invalidateDNDModeAssertion
{
}

- (void)_setDNDHearingTestModeActive:(BOOL)a3
{
  uint64_t v5 = dispatch_get_global_queue(-32768, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBHearingTestModeCoordinator__setDNDHearingTestModeActive___block_invoke;
  v6[3] = &unk_1E6AF5D38;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __61__SBHearingTestModeCoordinator__setDNDHearingTestModeActive___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F5F5E8];
  v3 = [(id)objc_opt_class() dndHearingTestModeClientIdentifier];
  id v4 = [v2 serviceForClientIdentifier:v3];

  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  id v11 = 0;
  char v6 = [v4 setHearingTestIsActive:v5 error:&v11];
  id v7 = v11;
  uint64_t v8 = SBLogHearingTestMode();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = SBSHearingTestModeDescription();
      *(_DWORD *)buf = 138543362;
      long long v13 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Coordinator successfully set hearing test mode to: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __61__SBHearingTestModeCoordinator__setDNDHearingTestModeActive___block_invoke_cold_1((uint64_t)v7, v9);
  }
}

- (void)hearingTestModeHostComponentDidChangeActiveState:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogHearingTestMode();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 hearingTestMode];
    char v6 = SBSHearingTestModeDescription();
    int v9 = 138543362;
    long long v10 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Coordinator did receive %{public}@ for hearing test mode via delegate", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [v4 hearingTestMode];
  uint64_t v8 = [v4 identifier];
  if (v7 == 1) {
    [(SBHearingTestModeCoordinator *)self _noteHearingTestModeActiveForProviderWithIdentifier:v8];
  }
  else {
    [(SBHearingTestModeCoordinator *)self _noteHearingTestModeInactiveForProviderWithIdentifier:v8];
  }
}

- (int64_t)hearingTestMode
{
  return self->_hearingTestMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndService, 0);
  objc_storeStrong((id *)&self->_hearingTestModeHostComponent, 0);
  objc_storeStrong((id *)&self->_identifiersForHearingTestModeActiveProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __61__SBHearingTestModeCoordinator__setDNDHearingTestModeActive___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error setting hearing test mode %{public}@", (uint8_t *)&v2, 0xCu);
}

@end