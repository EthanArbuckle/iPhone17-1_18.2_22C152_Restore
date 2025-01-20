@interface SBSwitcherLayoutCalculationsCache
- (CGRect)frameForKey:(id)a3 validityToken:(id)a4 fallback:(id)a5;
- (SBSwitcherLayoutCalculationsCache)init;
- (SBSwitcherLayoutCalculationsCacheDelegate)delegate;
- (SBSwitcherLayoutCalculationsCacheValidityToken)validityToken;
- (double)scaleForKey:(id)a3 validityToken:(id)a4 fallback:(id)a5;
- (void)rebuildIfNecessaryForValidityToken:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBSwitcherLayoutCalculationsCache

- (SBSwitcherLayoutCalculationsCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherLayoutCalculationsCache;
  v2 = [(SBSwitcherLayoutCalculationsCache *)&v6 init];
  v3 = v2;
  if (v2)
  {
    cachedLayoutCalculationsByKey = v2->_cachedLayoutCalculationsByKey;
    v2->_cachedLayoutCalculationsByKey = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

- (CGRect)frameForKey:(id)a3 validityToken:(id)a4 fallback:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (double (**)(void))a5;
  [(SBSwitcherLayoutCalculationsCache *)self rebuildIfNecessaryForValidityToken:a4];
  v10 = [(NSDictionary *)self->_cachedLayoutCalculationsByKey objectForKey:v8];
  v11 = v10;
  if (v10)
  {
    [v10 frame];
  }
  else
  {
    v16 = SBLogAppSwitcher();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Cache didn't have layoutCalculations for key %@", (uint8_t *)&v25, 0xCu);
    }

    double v12 = v9[2](v9);
  }
  double v17 = v12;
  double v18 = v13;
  double v19 = v14;
  double v20 = v15;

  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)scaleForKey:(id)a3 validityToken:(id)a4 fallback:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (double (**)(void))a5;
  [(SBSwitcherLayoutCalculationsCache *)self rebuildIfNecessaryForValidityToken:a4];
  v10 = [(NSDictionary *)self->_cachedLayoutCalculationsByKey objectForKey:v8];
  v11 = v10;
  if (v10)
  {
    [v10 scale];
  }
  else
  {
    double v13 = SBLogAppSwitcher();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "Cache didn't have layoutCalculations for key %@", (uint8_t *)&v16, 0xCu);
    }

    double v12 = v9[2](v9);
  }
  double v14 = v12;

  return v14;
}

- (void)rebuildIfNecessaryForValidityToken:(id)a3
{
  id v10 = a3;
  if (!-[SBSwitcherLayoutCalculationsCacheValidityToken isEqual:](self->_validityToken, "isEqual:"))
  {
    objc_super v6 = [(SBSwitcherLayoutCalculationsCache *)self delegate];
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBSwitcherLayoutCalculationsCache.m" lineNumber:54 description:@"Must have set delegate by now"];
    }
    v7 = [v6 buildLayoutCalculationsForCache:self];
    cachedLayoutCalculationsByKey = self->_cachedLayoutCalculationsByKey;
    self->_cachedLayoutCalculationsByKey = v7;

    objc_storeStrong((id *)&self->_validityToken, a3);
  }
}

- (SBSwitcherLayoutCalculationsCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherLayoutCalculationsCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSwitcherLayoutCalculationsCacheValidityToken)validityToken
{
  return self->_validityToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedLayoutCalculationsByKey, 0);
}

@end