@interface WLKPostPlayAutoPlayToggleInterface
- (NSNumber)isNextEpisodeSettingEnabled;
- (NSNumber)isRecommendedItemsSettingEnabled;
- (NSTimer)nextEpisodeBouncer;
- (NSTimer)recommendedItemsBouncer;
- (WLKPostPlayAutoPlayToggleInterface)initWithDelegate:(id)a3;
- (WLKPostPlayAutoPlayToggleInterfaceDelegate)delegate;
- (void)_autoPlayNextEpisodeSettingDidChange:(id)a3;
- (void)_autoPlayRecommendedItemsSettingDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsNextEpisodeSettingEnabled:(id)a3;
- (void)setIsRecommendedItemsSettingEnabled:(id)a3;
- (void)setNextEpisodeBouncer:(id)a3;
- (void)setRecommendedItemsBouncer:(id)a3;
@end

@implementation WLKPostPlayAutoPlayToggleInterface

- (WLKPostPlayAutoPlayToggleInterface)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WLKPostPlayAutoPlayToggleInterface;
  v5 = [(WLKPostPlayAutoPlayToggleInterface *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__autoPlayNextEpisodeSettingDidChange_ name:@"WLKPostPlayAutoPlayNextEpisodeSettingChangedNotification" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v6 selector:sel__autoPlayRecommendedItemsSettingDidChange_ name:@"WLKPostPlayAutoPlayNextEpisodeSettingChangedNotification" object:0];
  }
  return v6;
}

- (NSNumber)isNextEpisodeSettingEnabled
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&__accessLock_0);
  if (!self->_isNextEpisodeSettingEnabled)
  {
    v3 = +[WLKPostPlayAutoPlayManager defaultManager];
    uint64_t v4 = [v3 isEnabledForType:1];

    v5 = [NSNumber numberWithBool:v4];
    isNextEpisodeSettingEnabled = self->_isNextEpisodeSettingEnabled;
    self->_isNextEpisodeSettingEnabled = v5;
  }
  v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_isNextEpisodeSettingEnabled;
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlayToggleInterface - isNextEpisodeSettingEnabled returns %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = self->_isNextEpisodeSettingEnabled;
  os_unfair_lock_unlock(&__accessLock_0);

  return v9;
}

- (void)setIsNextEpisodeSettingEnabled:(id)a3
{
  v5 = (NSNumber *)a3;
  if (self->_isNextEpisodeSettingEnabled != v5)
  {
    os_unfair_lock_lock(&__accessLock_0);
    objc_storeStrong((id *)&self->_isNextEpisodeSettingEnabled, a3);
    os_unfair_lock_unlock(&__accessLock_0);
    if (v5)
    {
      [(NSTimer *)self->_nextEpisodeBouncer invalidate];
      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x1E4F1CB00];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __69__WLKPostPlayAutoPlayToggleInterface_setIsNextEpisodeSettingEnabled___block_invoke;
      v9[3] = &unk_1E620B350;
      objc_copyWeak(&v11, &location);
      objc_super v10 = v5;
      v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v9 block:0.5];
      nextEpisodeBouncer = self->_nextEpisodeBouncer;
      self->_nextEpisodeBouncer = v7;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __69__WLKPostPlayAutoPlayToggleInterface_setIsNextEpisodeSettingEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_initWeak(&location, WeakRetained);
  uint64_t v5 = [*(id *)(a1 + 32) BOOLValue];
  v6 = objc_alloc_init(WLKPostPlayAutoPlaySettings);
  v7 = [NSNumber numberWithBool:v5];
  [(WLKPostPlayAutoPlaySettings *)v6 setNextEpisodeSettingValue:v7];

  v8 = +[WLKPostPlayAutoPlayManager defaultManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__WLKPostPlayAutoPlayToggleInterface_setIsNextEpisodeSettingEnabled___block_invoke_2;
  v9[3] = &unk_1E620B328;
  char v11 = v5;
  objc_copyWeak(&v10, &location);
  [v8 setSettings:v6 completion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__WLKPostPlayAutoPlayToggleInterface_setIsNextEpisodeSettingEnabled___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    v6 = [v10 nextEpisodeSettingValue];

    if (v6)
    {
      v7 = [v10 nextEpisodeSettingValue];
      int v8 = [v7 BOOLValue];

      if (*(unsigned __int8 *)(a1 + 40) != v8)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        [WeakRetained _autoPlayNextEpisodeSettingDidChange:0];
      }
    }
  }
}

- (NSNumber)isRecommendedItemsSettingEnabled
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&__accessLock_0);
  if (!self->_isRecommendedItemsSettingEnabled)
  {
    id v3 = +[WLKPostPlayAutoPlayManager defaultManager];
    uint64_t v4 = [v3 isEnabledForType:2];

    id v5 = [NSNumber numberWithBool:v4];
    isRecommendedItemsSettingEnabled = self->_isRecommendedItemsSettingEnabled;
    self->_isRecommendedItemsSettingEnabled = v5;
  }
  v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = self->_isRecommendedItemsSettingEnabled;
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlayToggleInterface - isRecommendedItemsSettingEnabled returns %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = self->_isRecommendedItemsSettingEnabled;
  os_unfair_lock_unlock(&__accessLock_0);

  return v9;
}

- (void)setIsRecommendedItemsSettingEnabled:(id)a3
{
  id v5 = (NSNumber *)a3;
  if (self->_isRecommendedItemsSettingEnabled != v5)
  {
    os_unfair_lock_lock(&__accessLock_0);
    objc_storeStrong((id *)&self->_isRecommendedItemsSettingEnabled, a3);
    os_unfair_lock_unlock(&__accessLock_0);
    if (v5)
    {
      [(NSTimer *)self->_recommendedItemsBouncer invalidate];
      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x1E4F1CB00];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__WLKPostPlayAutoPlayToggleInterface_setIsRecommendedItemsSettingEnabled___block_invoke;
      v9[3] = &unk_1E620B350;
      objc_copyWeak(&v11, &location);
      id v10 = v5;
      v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v9 block:0.5];
      recommendedItemsBouncer = self->_recommendedItemsBouncer;
      self->_recommendedItemsBouncer = v7;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __74__WLKPostPlayAutoPlayToggleInterface_setIsRecommendedItemsSettingEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_initWeak(&location, WeakRetained);
  uint64_t v5 = [*(id *)(a1 + 32) BOOLValue];
  v6 = objc_alloc_init(WLKPostPlayAutoPlaySettings);
  v7 = [NSNumber numberWithBool:v5];
  [(WLKPostPlayAutoPlaySettings *)v6 setRecommendedItemsSettingValue:v7];

  int v8 = +[WLKPostPlayAutoPlayManager defaultManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__WLKPostPlayAutoPlayToggleInterface_setIsRecommendedItemsSettingEnabled___block_invoke_2;
  v9[3] = &unk_1E620B328;
  char v11 = v5;
  objc_copyWeak(&v10, &location);
  [v8 setSettings:v6 completion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __74__WLKPostPlayAutoPlayToggleInterface_setIsRecommendedItemsSettingEnabled___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    v6 = [v10 recommendedItemsSettingValue];

    if (v6)
    {
      v7 = [v10 recommendedItemsSettingValue];
      int v8 = [v7 BOOLValue];

      if (*(unsigned __int8 *)(a1 + 40) != v8)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        [WeakRetained _autoPlayRecommendedItemsSettingDidChange:0];
      }
    }
  }
}

- (void)_autoPlayNextEpisodeSettingDidChange:(id)a3
{
  isNextEpisodeSettingEnabled = self->_isNextEpisodeSettingEnabled;
  self->_isNextEpisodeSettingEnabled = 0;

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 nextEpisodeSettingDidChange];
  }
}

- (void)_autoPlayRecommendedItemsSettingDidChange:(id)a3
{
  isRecommendedItemsSettingEnabled = self->_isRecommendedItemsSettingEnabled;
  self->_isRecommendedItemsSettingEnabled = 0;

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 recommendedItemsSettingDidChange];
  }
}

- (WLKPostPlayAutoPlayToggleInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WLKPostPlayAutoPlayToggleInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSTimer)nextEpisodeBouncer
{
  return self->_nextEpisodeBouncer;
}

- (void)setNextEpisodeBouncer:(id)a3
{
}

- (NSTimer)recommendedItemsBouncer
{
  return self->_recommendedItemsBouncer;
}

- (void)setRecommendedItemsBouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedItemsBouncer, 0);
  objc_storeStrong((id *)&self->_nextEpisodeBouncer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_isRecommendedItemsSettingEnabled, 0);

  objc_storeStrong((id *)&self->_isNextEpisodeSettingEnabled, 0);
}

@end