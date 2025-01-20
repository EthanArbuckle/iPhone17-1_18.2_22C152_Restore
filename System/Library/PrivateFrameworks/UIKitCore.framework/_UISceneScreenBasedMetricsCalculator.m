@interface _UISceneScreenBasedMetricsCalculator
- (UIWindowScene)_scene;
- (void)_setScene:(id)a3;
- (void)_updateMetricsOnWindows:(id)a3 animated:(BOOL)a4;
@end

@implementation _UISceneScreenBasedMetricsCalculator

- (void)_updateMetricsOnWindows:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  p_scene = &self->_scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v8 = [WeakRetained _effectiveSettings];
  uint64_t v9 = [v8 interfaceOrientation];

  id v10 = objc_loadWeakRetained((id *)p_scene);
  v11 = [v10 _effectiveUIClientSettings];
  uint64_t v12 = [v11 interfaceOrientation];

  id v13 = objc_loadWeakRetained((id *)p_scene);
  int v14 = [v13 _affectsScreenOrientation];
  char v15 = [(id)UIApp _viewServiceIgnoresSceneForLegacyInterfaceOrientation:v13];

  if (([(id)UIApp isFrontBoard] & 1) == 0 && v14 && (v15 & 1) == 0)
  {
    id v16 = objc_loadWeakRetained((id *)p_scene);
    v17 = [v16 screen];
    [v17 _setInterfaceOrientation:v9];
  }
  id v18 = objc_loadWeakRetained((id *)p_scene);
  _UISceneMetricsCalculatorApplySceneCornerRadiiToScreenIfNecessary(v18);

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73___UISceneScreenBasedMetricsCalculator__updateMetricsOnWindows_animated___block_invoke;
  v20[3] = &unk_1E52DD178;
  id v21 = v5;
  uint64_t v22 = v9;
  uint64_t v23 = v12;
  id v19 = v5;
  +[UIView performWithoutAnimation:v20];
}

- (UIWindowScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIWindowScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end