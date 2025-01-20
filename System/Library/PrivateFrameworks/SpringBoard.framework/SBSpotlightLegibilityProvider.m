@interface SBSpotlightLegibilityProvider
- (CGRect)_rectForSpotlightHeader;
- (SBFLegibilitySettingsProviderDelegate)delegate;
- (SBSpotlightLegibilityProvider)initWithVariant:(int64_t)a3;
- (SBSpotlightLegibilityProvider)initWithVariant:(int64_t)a3 wallpaperController:(id)a4;
- (_UILegibilitySettings)legibilitySettings;
- (void)_calculateLegibilitySettings;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
- (void)wallpaperGeometryDidChangeForVariant:(int64_t)a3;
- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4;
@end

@implementation SBSpotlightLegibilityProvider

- (SBSpotlightLegibilityProvider)initWithVariant:(int64_t)a3
{
  v5 = +[SBWallpaperController sharedInstance];
  v6 = [(SBSpotlightLegibilityProvider *)self initWithVariant:a3 wallpaperController:v5];

  return v6;
}

- (SBSpotlightLegibilityProvider)initWithVariant:(int64_t)a3 wallpaperController:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSpotlightLegibilityProvider;
  v8 = [(SBSpotlightLegibilityProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, 0);
    v9->_variant = a3;
    objc_storeStrong((id *)&v9->_wallpaperController, a4);
    [(SBWallpaperController *)v9->_wallpaperController addObserver:v9 forVariant:a3];
  }

  return v9;
}

- (void)dealloc
{
  [(SBWallpaperController *)self->_wallpaperController removeObserver:self forVariant:self->_variant];
  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightLegibilityProvider;
  [(SBSpotlightLegibilityProvider *)&v3 dealloc];
}

- (_UILegibilitySettings)legibilitySettings
{
  currentLegibilitySettings = self->_currentLegibilitySettings;
  if (!currentLegibilitySettings)
  {
    [(SBSpotlightLegibilityProvider *)self _calculateLegibilitySettings];
    currentLegibilitySettings = self->_currentLegibilitySettings;
  }
  return currentLegibilitySettings;
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_variant == a3 && WeakRetained != 0)
  {
    id v7 = WeakRetained;
    [(SBSpotlightLegibilityProvider *)self _calculateLegibilitySettings];
    [v7 providerLegibilitySettingsChanged:self];
    id WeakRetained = v7;
  }
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_variant == a4 && WeakRetained != 0)
  {
    id v8 = WeakRetained;
    [(SBSpotlightLegibilityProvider *)self _calculateLegibilitySettings];
    [v8 providerLegibilitySettingsChanged:self];
    id WeakRetained = v8;
  }
}

- (void)wallpaperGeometryDidChangeForVariant:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_variant == a3 && WeakRetained != 0)
  {
    id v7 = WeakRetained;
    [(SBSpotlightLegibilityProvider *)self _calculateLegibilitySettings];
    [v7 providerLegibilitySettingsChanged:self];
    id WeakRetained = v7;
  }
}

- (void)_calculateLegibilitySettings
{
  wallpaperController = self->_wallpaperController;
  [(SBSpotlightLegibilityProvider *)self _rectForSpotlightHeader];
  -[SBWallpaperController averageColorInRect:forVariant:](wallpaperController, "averageColorInRect:forVariant:", self->_variant);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (_UILegibilitySettings *)[objc_alloc(MEMORY[0x1E4F43228]) initWithContentColor:v6];
  currentLegibilitySettings = self->_currentLegibilitySettings;
  self->_currentLegibilitySettings = v4;
}

- (CGRect)_rectForSpotlightHeader
{
  if (self->_variant == 1) {
    [MEMORY[0x1E4FA5E38] todayViewSearchBar];
  }
  else {
  objc_super v3 = [MEMORY[0x1E4FA5E38] notificationCenterSearchBar];
  }
  v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SBWallpaperController *)self->_wallpaperController windowScene];
  v14 = [v13 screen];
  v15 = [v14 coordinateSpace];
  objc_msgSend(v4, "convertRect:toCoordinateSpace:", v15, v6, v8, v10, v12);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFLegibilitySettingsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
}

@end