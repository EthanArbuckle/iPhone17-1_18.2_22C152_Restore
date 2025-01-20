@interface SBDashBoardLegibilityProvider
- (CSLegibilityProviderDelegate)legibilityProviderDelegate;
- (SBDashBoardLegibilityProvider)init;
- (SBDashBoardLegibilityProvider)initWithWallpaperController:(id)a3;
- (SBWallpaperController)wallpaperController;
- (id)_wallpaperLegibilitySettings;
- (void)_notifyDelegate;
- (void)setLegibilityProviderDelegate:(id)a3;
- (void)setWallpaperController:(id)a3;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4;
@end

@implementation SBDashBoardLegibilityProvider

- (SBDashBoardLegibilityProvider)init
{
  v3 = +[SBWallpaperController sharedInstance];
  v4 = [(SBDashBoardLegibilityProvider *)self initWithWallpaperController:v3];

  return v4;
}

- (SBDashBoardLegibilityProvider)initWithWallpaperController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardLegibilityProvider;
  v6 = [(SBDashBoardLegibilityProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wallpaperController, a3);
    [(SBWallpaperController *)v7->_wallpaperController addObserver:v7 forVariant:0];
  }

  return v7;
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (!a4) {
    [(SBDashBoardLegibilityProvider *)self _notifyDelegate];
  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (!a3) {
    [(SBDashBoardLegibilityProvider *)self _notifyDelegate];
  }
}

- (id)_wallpaperLegibilitySettings
{
  return [(SBWallpaperController *)self->_wallpaperController legibilitySettingsForVariant:0];
}

- (void)_notifyDelegate
{
  id v3 = [(SBDashBoardLegibilityProvider *)self legibilityProviderDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 coverSheetLegibilityProviderDidUpdate:self];
  }
}

- (CSLegibilityProviderDelegate)legibilityProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legibilityProviderDelegate);
  return (CSLegibilityProviderDelegate *)WeakRetained;
}

- (void)setLegibilityProviderDelegate:(id)a3
{
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (void)setWallpaperController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_destroyWeak((id *)&self->_legibilityProviderDelegate);
}

@end