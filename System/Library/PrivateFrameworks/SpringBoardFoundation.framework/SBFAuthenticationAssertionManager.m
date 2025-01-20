@interface SBFAuthenticationAssertionManager
- (BOOL)hasActiveAssertions;
- (BOOL)isAssertionValid:(id)a3;
- (NSString)description;
- (SBFAuthenticationAssertionManager)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addAssertion:(id)a3;
- (void)dealloc;
- (void)removeAssertion:(id)a3;
@end

@implementation SBFAuthenticationAssertionManager

- (SBFAuthenticationAssertionManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBFAuthenticationAssertionManager;
  v2 = [(SBFAuthenticationAssertionManager *)&v13 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBFPasscodeLockTrackerForPreventLockAssertions);
    preventLockTracker = v2->_preventLockTracker;
    v2->_preventLockTracker = &v3->super;

    v5 = objc_alloc_init(SBFPasscodeLockTrackerForTransientAssertions);
    transientTracker = v2->_transientTracker;
    v2->_transientTracker = &v5->super;

    objc_initWeak(&location, v2);
    id v7 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v11, &location);
    uint64_t v8 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureToken = v2->_stateCaptureToken;
    v2->_stateCaptureToken = (BSInvalidatable *)v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __41__SBFAuthenticationAssertionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained descriptionWithMultilinePrefix:0];

  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBFAuthenticationAssertionManager;
  [(SBFAuthenticationAssertionManager *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBFAuthenticationAssertionManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFAuthenticationAssertionManager *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBFAuthenticationAssertionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBFAuthenticationAssertionManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SBFAuthenticationAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E548CBA0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __75__SBFAuthenticationAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"preventLockTracker"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"transientTracker"];
}

- (void)addAssertion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogAuthenticationAssertions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 publicDescription];
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, "Adding authentication assertion %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [v4 type];
  if (v7 == 1)
  {
    uint64_t v8 = 8;
    goto LABEL_7;
  }
  if (v7 == 2)
  {
    uint64_t v8 = 16;
LABEL_7:
    [*(id *)((char *)&self->super.isa + v8) addAssertion:v4];
  }
}

- (void)removeAssertion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogAuthenticationAssertions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 publicDescription];
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, "Removed authentication assertion %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [v4 type];
  if (v7 == 1)
  {
    uint64_t v8 = 8;
    goto LABEL_7;
  }
  if (v7 == 2)
  {
    uint64_t v8 = 16;
LABEL_7:
    [*(id *)((char *)&self->super.isa + v8) removeAssertion:v4];
  }
}

- (BOOL)hasActiveAssertions
{
  if ([(SBFAuthenticationAssertionTracker *)self->_preventLockTracker hasActiveAssertions]) {
    return 1;
  }
  transientTracker = self->_transientTracker;
  return [(SBFAuthenticationAssertionTracker *)transientTracker hasActiveAssertions];
}

- (BOOL)isAssertionValid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 1)
  {
    uint64_t v6 = 8;
  }
  else
  {
    if (v5 != 2)
    {
      char v7 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = 16;
  }
  char v7 = [*(id *)((char *)&self->super.isa + v6) isAssertionValid:v4];
LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_transientTracker, 0);
  objc_storeStrong((id *)&self->_preventLockTracker, 0);
}

@end