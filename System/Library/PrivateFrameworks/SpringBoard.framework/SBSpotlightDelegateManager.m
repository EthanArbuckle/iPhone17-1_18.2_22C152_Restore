@interface SBSpotlightDelegateManager
+ (SBSpotlightDelegateManager)sharedInstance;
- (NSMutableDictionary)delegatesForLevel;
- (SBSpotlightDelegateManager)init;
- (id)activeDelegate;
- (void)_modifyDelegatesWithBlock:(id)a3;
- (void)addSpotlightDelegate:(id)a3 forLevel:(unint64_t)a4;
- (void)dismissSearchView;
- (void)removeSpotlightDelegate:(id)a3 forLevel:(unint64_t)a4;
- (void)searchViewContentAvailabilityDidChange;
- (void)searchViewKeyboardPresentationStateDidChange;
- (void)setDelegatesForLevel:(id)a3;
- (void)spotlightActivationRequestServerDidRequestSpotlightActivation:(id)a3;
@end

@implementation SBSpotlightDelegateManager

+ (SBSpotlightDelegateManager)sharedInstance
{
  if (sharedInstance_onceToken_29 != -1) {
    dispatch_once(&sharedInstance_onceToken_29, &__block_literal_global_231);
  }
  v2 = (void *)sharedInstance_sharedInstance_4;
  return (SBSpotlightDelegateManager *)v2;
}

void __44__SBSpotlightDelegateManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBSpotlightDelegateManager);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;
}

- (SBSpotlightDelegateManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightDelegateManager;
  v2 = [(SBSpotlightDelegateManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FA6C00]) initWithDelegate:v2];
    activationRequestServer = v2->_activationRequestServer;
    v2->_activationRequestServer = (SBSSpotlightActivationRequestServer *)v3;

    [(SBSSpotlightActivationRequestServer *)v2->_activationRequestServer startServer];
  }
  return v2;
}

- (void)addSpotlightDelegate:(id)a3 forLevel:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 >= 4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSpotlightMultiplexingViewController.m", 113, @"Invalid parameter not satisfying: %@", @"level < SBSpotlightMultiplexingLevelCount" object file lineNumber description];
  }
  v8 = SBLogSpotlight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v15 = a4;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Adding Spotlight delegate at level %ld: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__SBSpotlightDelegateManager_addSpotlightDelegate_forLevel___block_invoke;
  v11[3] = &unk_1E6AF6FC0;
  id v12 = v7;
  unint64_t v13 = a4;
  v11[4] = self;
  id v9 = v7;
  [(SBSpotlightDelegateManager *)self _modifyDelegatesWithBlock:v11];
}

void __60__SBSpotlightDelegateManager_addSpotlightDelegate_forLevel___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = a1[4];
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(a1[4] + 16);
  }
  objc_super v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  id v9 = [v2 objectForKey:v6];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v7 = *(void **)(a1[4] + 16);
    v8 = [NSNumber numberWithUnsignedInteger:a1[6]];
    [v7 setObject:v9 forKey:v8];
  }
  [v9 addObject:a1[5]];
}

- (void)removeSpotlightDelegate:(id)a3 forLevel:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 >= 4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSpotlightMultiplexingViewController.m", 130, @"Invalid parameter not satisfying: %@", @"level < SBSpotlightMultiplexingLevelCount" object file lineNumber description];
  }
  v8 = SBLogSpotlight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v15 = a4;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Removing Spotlight delegate at level %ld: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SBSpotlightDelegateManager_removeSpotlightDelegate_forLevel___block_invoke;
  v11[3] = &unk_1E6AF6FC0;
  id v12 = v7;
  unint64_t v13 = a4;
  v11[4] = self;
  id v9 = v7;
  [(SBSpotlightDelegateManager *)self _modifyDelegatesWithBlock:v11];
}

void __63__SBSpotlightDelegateManager_removeSpotlightDelegate_forLevel___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 16);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  id v6 = [v2 objectForKey:v3];

  [v6 removeObject:a1[5]];
  if (![v6 count])
  {
    uint64_t v4 = *(void **)(a1[4] + 16);
    v5 = [NSNumber numberWithUnsignedInteger:a1[6]];
    [v4 removeObjectForKey:v5];
  }
}

- (id)activeDelegate
{
  uint64_t v3 = 3;
  do
  {
    delegatesForLevel = self->_delegatesForLevel;
    v5 = [NSNumber numberWithInteger:v3];
    id v6 = [(NSMutableDictionary *)delegatesForLevel objectForKey:v5];

    id v7 = [v6 lastObject];

    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v3 == 0;
    }
    --v3;
  }
  while (!v8);
  return v7;
}

- (void)_modifyDelegatesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v6 = [(SBSpotlightDelegateManager *)self activeDelegate];
  v4[2](v4);

  id v5 = [(SBSpotlightDelegateManager *)self activeDelegate];
  if (v6 != v5)
  {
    [v5 didBecomeActiveDelegate];
    [v6 didResignActiveDelegate:v5 == 0];
  }
}

- (void)dismissSearchView
{
  id v2 = [(SBSpotlightDelegateManager *)self activeDelegate];
  [v2 dismissSearchView];
}

- (void)searchViewKeyboardPresentationStateDidChange
{
  id v2 = [(SBSpotlightDelegateManager *)self activeDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 searchViewKeyboardPresentationStateDidChange];
  }
}

- (void)searchViewContentAvailabilityDidChange
{
  id v2 = [(SBSpotlightDelegateManager *)self activeDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 searchViewContentAvailabilityDidChange];
  }
}

- (void)spotlightActivationRequestServerDidRequestSpotlightActivation:(id)a3
{
  if ((SBSpotlightIsVisible() & 1) == 0)
  {
    uint64_t v3 = (void *)SBApp;
    [v3 toggleSearchOnWindowScene:0 fromBreadcrumbSource:0 withWillBeginHandler:&__block_literal_global_70_3 completionHandler:&__block_literal_global_72_0];
  }
}

- (NSMutableDictionary)delegatesForLevel
{
  return self->_delegatesForLevel;
}

- (void)setDelegatesForLevel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesForLevel, 0);
  objc_storeStrong((id *)&self->_activationRequestServer, 0);
}

@end