@interface SBFaceContactExpectationManager
- (BOOL)_sceneHasBypassEntitlement:(id)a3;
- (SBFaceContactExpectationManager)initWithSceneManager:(id)a3;
- (SBFaceContactExpectationManager)initWithSceneManager:(id)a3 proximitySensorManager:(id)a4;
- (id)_frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod:(BOOL *)a3;
- (id)_proximitySensorClientID;
- (id)description;
- (void)updateFaceContactExpectation;
@end

@implementation SBFaceContactExpectationManager

- (void)updateFaceContactExpectation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v9 = 0;
  v3 = [(SBFaceContactExpectationManager *)self _frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod:&v9];
  BOOL v4 = [v3 count] != 0;
  if (self->_faceExpected != v4)
  {
    v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v3, "bs_map:", &__block_literal_global_336);
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "scenes expecting face contact:%{public}@", buf, 0xCu);
    }
    self->_faceExpected = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_proximitySensorManager);
    v8 = [(SBFaceContactExpectationManager *)self _proximitySensorClientID];
    [WeakRetained client:v8 wantsProximityDetectionEnabled:self->_faceExpected disableGracePeriod:v9];
  }
}

- (id)_frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod:(BOOL *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  v6 = [WeakRetained topmostForegroundUIScenesMatching:&__block_literal_global_21_1];
  v7 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_24_3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 |= [(SBFaceContactExpectationManager *)self _sceneHasBypassEntitlement:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  *a3 = v10 & 1;

  return v7;
}

BOOL __102__SBFaceContactExpectationManager__frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 proximityDetectionModes] != 0;
}

unint64_t __102__SBFaceContactExpectationManager__frontmostScenesExpectingFaceContactAndGetShouldDisableGracePeriod___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 clientSettings];
  if (([v2 proximityDetectionModes] & 4) != 0) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = ((unint64_t)[v2 proximityDetectionModes] >> 3) & 1;
  }

  return v3;
}

- (SBFaceContactExpectationManager)initWithSceneManager:(id)a3
{
  BOOL v4 = (void *)SBApp;
  id v5 = a3;
  v6 = [v4 proximitySensorManager];
  v7 = [(SBFaceContactExpectationManager *)self initWithSceneManager:v5 proximitySensorManager:v6];

  return v7;
}

- (SBFaceContactExpectationManager)initWithSceneManager:(id)a3 proximitySensorManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sceneManager != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBFaceContactExpectationManager initWithSceneManager:proximitySensorManager:](a2, (uint64_t)self, (uint64_t)v14);
    }
LABEL_11:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8D2C50CLL);
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"proxManager != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBFaceContactExpectationManager initWithSceneManager:proximitySensorManager:](a2, (uint64_t)self, (uint64_t)v14);
    }
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)SBFaceContactExpectationManager;
  int v10 = [(SBFaceContactExpectationManager *)&v17 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_sceneManager, v7);
    objc_storeWeak(p_isa + 2, v9);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SBFaceContactExpectationManager_initWithSceneManager_proximitySensorManager___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  uint64_t v12 = p_isa;
  long long v16 = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return v12;
}

uint64_t __79__SBFaceContactExpectationManager_initWithSceneManager_proximitySensorManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFaceContactExpectation];
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_faceExpected withName:@"_faceExpected"];
  id v5 = [v3 build];

  return v5;
}

uint64_t __63__SBFaceContactExpectationManager_updateFaceContactExpectation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)_sceneHasBypassEntitlement:(id)a3
{
  unint64_t v3 = [a3 clientHandle];
  id v4 = [v3 processHandle];

  BOOL v5 = 0;
  if (v4)
  {
    objc_msgSend(v4, "auditToken", 0, 0, 0, 0);
    if (BSAuditTokenTaskHasEntitlement()) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (id)_proximitySensorClientID
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  uint64_t v9 = [v3 stringWithFormat:@"%@-%@", v5, v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proximitySensorManager);
  objc_destroyWeak((id *)&self->_sceneManager);
}

- (void)initWithSceneManager:(uint64_t)a3 proximitySensorManager:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBFaceContactExpectationManager.m";
  __int16 v10 = 1024;
  int v11 = 39;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithSceneManager:(uint64_t)a3 proximitySensorManager:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"SBFaceContactExpectationManager.m";
  __int16 v10 = 1024;
  int v11 = 40;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end