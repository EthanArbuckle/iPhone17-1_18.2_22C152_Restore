@interface SBSALayoutModeSupportingProvider
- (id)preferencesFromContext:(id)a3;
- (void)_transitionToLayoutModeIfNecessary:(int64_t)a3 context:(id)a4;
@end

@implementation SBSALayoutModeSupportingProvider

- (id)preferencesFromContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [v8 elementContexts];
    uint64_t v10 = [v9 count];
    if (v10)
    {
      unint64_t v11 = v10;
      v12 = objc_msgSend(v9, "bs_firstObjectPassingTest:", &__block_literal_global_321);
      if (v12)
      {
        uint64_t v13 = 3;
      }
      else if (v11 > 1)
      {
        uint64_t v13 = 1;
      }
      else
      {
        v17 = objc_msgSend(v9, "sbsa_onlyObjectOrNil");
        uint64_t v18 = [v17 layoutMode];

        if (v18 == 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = 2;
        }
      }
      [(SBSALayoutModeSupportingProvider *)self _transitionToLayoutModeIfNecessary:v13 context:v8];
    }
    else
    {
      v14 = SBLogSystemAperturePreferencesStackElements();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SBSALayoutModeSupportingProvider preferencesFromContext:](v8);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionProvider);
      [WeakRetained removeFromParentProvider];
      objc_storeWeak((id *)&self->_activeTransitionProvider, 0);
      v16 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderRespondingToSelector:sel_supportedElementLayoutMode];
      [v16 removeFromParentProvider];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SBSALayoutModeSupportingProvider;
  v19 = [(SBSABasePreferencesProvider *)&v21 preferencesFromContext:v8];

  return v19;
}

BOOL __59__SBSALayoutModeSupportingProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layoutMode] == 3;
}

- (void)_transitionToLayoutModeIfNecessary:(int64_t)a3 context:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionProvider);
  id v8 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderRespondingToSelector:sel_supportedElementLayoutMode];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 supportedElementLayoutMode] == a3)
  {
    id v9 = v8;
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = [v6 preferences];
      int v12 = [v11 isCollisionImminent];

      if (!v12) {
        goto LABEL_18;
      }
      uint64_t v13 = SBLogSystemAperturePreferencesStackElements();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 134349570;
        uint64_t v20 = [v6 queryIteration];
        __int16 v21 = 2112;
        v22 = v10;
        __int16 v23 = 2112;
        id v24 = WeakRetained;
        _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "[%{public}lu] Layout provider for desired layout mode exists, but collision required – removing layout provider '%@', transition provider '%@'", (uint8_t *)&v19, 0x20u);
      }

      [v10 removeFromParentProvider];
      [WeakRetained removeFromParentProvider];

      objc_storeWeak((id *)&self->_activeTransitionProvider, 0);
      id WeakRetained = 0;
    }
  }
  v14 = SBLogSystemAperturePreferencesStackElements();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[SBSALayoutModeSupportingProvider _transitionToLayoutModeIfNecessary:context:](v6);
  }

  uint64_t v15 = [WeakRetained targetElementLayoutMode];
  int v16 = [WeakRetained isInitialized] ^ 1;
  if (v15 == a3) {
    LOBYTE(v16) = 1;
  }
  if (!WeakRetained || (v16 & 1) == 0)
  {
    v17 = objc_alloc_init(SBSALayoutTransitionProvider);
    objc_storeWeak((id *)&self->_activeTransitionProvider, v17);
    [(SBSABasePreferencesProvider *)self setChildProvider:v17];
    uint64_t v18 = SBLogSystemAperturePreferencesStackElements();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SBSALayoutModeSupportingProvider _transitionToLayoutModeIfNecessary:context:](v6, (uint64_t)v17, v18);
    }

    [WeakRetained removeFromParentProvider];
  }
  uint64_t v10 = 0;
LABEL_18:
}

- (void).cxx_destruct
{
}

- (void)preferencesFromContext:(void *)a1 .cold.1(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] No elements – removing all transition and element providers", v3, v4, v5, v6, 0);
}

- (void)_transitionToLayoutModeIfNecessary:(NSObject *)a3 context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134349314;
  uint64_t v6 = [a1 queryIteration];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added new transition provider: %@", (uint8_t *)&v5, 0x16u);
}

- (void)_transitionToLayoutModeIfNecessary:(void *)a1 context:.cold.2(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] No layout provider for desired layout mode – transition required", v3, v4, v5, v6, 0);
}

@end