@interface SBScreenSleepCoordinatorBacklightEnvironment
- (BLSBacklightSceneVisualState)visualState;
- (BOOL)clientHasDelegate;
- (BOOL)clientSupportsAlwaysOn;
- (BOOL)hasUnrestrictedFramerateUpdates;
- (BOOL)isAlwaysOnEnabledForEnvironment;
- (BOOL)isClientActive;
- (BOOL)isDisplayBlanked;
- (BOOL)isLiveUpdating;
- (NSDate)presentationDate;
- (NSString)identifier;
- (RBSProcessIdentity)budgetProcessIdentity;
- (SBScreenSleepCoordinatorBacklightEnvironment)initWithCoordinator:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearPresentationDate;
- (void)invalidateContentForReason:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6;
- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3;
- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3;
- (void)setLiveUpdating:(BOOL)a3;
- (void)setUnrestrictedFramerateUpdates:(BOOL)a3;
- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4;
- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10;
@end

@implementation SBScreenSleepCoordinatorBacklightEnvironment

- (SBScreenSleepCoordinatorBacklightEnvironment)initWithCoordinator:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBScreenSleepCoordinatorBacklightEnvironment;
  v5 = [(SBScreenSleepCoordinatorBacklightEnvironment *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_screenSleepCoordinator, v4);
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v6->_lock_observers;
    v6->_lock_observers = (NSHashTable *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F4F500]) initWithActiveAppearance:1 updateFidelity:3 adjustedLuminance:2];
    lock_visualState = v6->_lock_visualState;
    v6->_lock_visualState = (BLSBacklightSceneVisualState *)v11;
  }
  return v6;
}

- (NSString)identifier
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NSUUID *)self->_uuid UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return (NSString *)v7;
}

- (RBSProcessIdentity)budgetProcessIdentity
{
  return 0;
}

- (BOOL)clientHasDelegate
{
  return 1;
}

- (BOOL)isClientActive
{
  return 1;
}

- (BLSBacklightSceneVisualState)visualState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_visualState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)presentationDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_presentationDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)clientSupportsAlwaysOn
{
  return 1;
}

- (BOOL)isAlwaysOnEnabledForEnvironment
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabledForEnvironment;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_alwaysOnEnabledForEnvironment != v3) {
    self->_lock_alwaysOnEnabledForEnvironment = v3;
  }
  v6 = (void *)[(NSHashTable *)self->_lock_observers copy];
  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "hostEnvironment:hostDidSetAlwaysOnEnabledForEnvironment:", self, v3, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)isLiveUpdating
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_liveUpdating;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLiveUpdating:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_liveUpdating != v3) {
    self->_lock_liveUpdating = v3;
  }
  v6 = (void *)[(NSHashTable *)self->_lock_observers copy];
  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "hostEnvironment:hostDidSetLiveUpdating:", self, v3, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_unrestrictedFramerateUpdates;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_unrestrictedFramerateUpdates != v3) {
    self->_lock_unrestrictedFramerateUpdates = v3;
  }
  v6 = (void *)[(NSHashTable *)self->_lock_observers copy];
  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "hostEnvironment:hostDidSetUnrestrictedFramerateUpdates:", self, v3, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)isDisplayBlanked
{
  return 0;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  BOOL v12 = a5;
  id v28 = a3;
  id v16 = a4;
  id v17 = a6;
  uint64_t v18 = (void (**)(void))a8;
  v19 = (void (**)(void, __n128))a9;
  v20 = (void (**)(void))a10;
  if (v19)
  {
    v21.n128_u64[0] = 0x3FE999999999999ALL;
    if (!v12) {
      v21.n128_f64[0] = 0.0;
    }
    v19[2](v19, v21);
  }
  os_unfair_lock_lock(&self->_lock);
  v22 = self->_lock_visualState;
  objc_storeStrong((id *)&self->_lock_visualState, a3);
  v23 = [v16 date];
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = v23;

  os_unfair_lock_unlock(&self->_lock);
  v18[2](v18);
  v25 = [v17 changeRequest];
  uint64_t v26 = [v25 sourceEvent];

  if (v26 == 15)
  {
    v27 = v28;
    if (v20) {
      v20[2](v20);
    }
  }
  else
  {
    v27 = v28;
    id v29 = v28;
    v30 = v22;
    v31 = v20;
    BSDispatchMain();
  }
}

void __192__SBScreenSleepCoordinatorBacklightEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained transitionToVisualState:*(void *)(a1 + 40) fromVisualState:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F4F4A0];
  id v9 = a6;
  id v10 = a3;
  id v11 = [v8 alloc];
  BOOL v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v13 = (void *)[v11 initWithDate:v12 fidelity:0];
  v15[0] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  (*((void (**)(id, id, void *))a6 + 2))(v9, v10, v14);
}

- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [v6 date];
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = v7;

  lock_visualState = self->_lock_visualState;
  uint64_t v10 = [v6 fidelity];

  id v11 = (BLSBacklightSceneVisualState *)[(BLSBacklightSceneVisualState *)lock_visualState newVisualStateWithUpdateFidelity:v10];
  BOOL v12 = self->_lock_visualState;
  self->_lock_visualState = v11;

  os_unfair_lock_unlock(&self->_lock);
  long long v13 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    long long v13 = v14;
  }
}

- (void)clearPresentationDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidateContentForReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)[(NSHashTable *)self->_lock_observers copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "hostEnvironment:invalidateContentForReason:", self, v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_presentationDate, 0);
  objc_storeStrong((id *)&self->_lock_visualState, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_screenSleepCoordinator);
}

@end