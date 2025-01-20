@interface SBDashBoardVibrantWallpaperChevronView
- (CSWallpaperColorProvider)wallpaperColorProvider;
- (SBDashBoardVibrantWallpaperChevronView)init;
- (SBDashBoardVibrantWallpaperChevronView)initWithColor:(id)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)strength;
- (void)_updateVibrancy;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
- (void)setWallpaperColorProvider:(id)a3;
@end

@implementation SBDashBoardVibrantWallpaperChevronView

- (SBDashBoardVibrantWallpaperChevronView)init
{
  if ([MEMORY[0x1E4F5E490] supportsVibrancy]) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  v3 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  v4 = [(SBDashBoardVibrantWallpaperChevronView *)self initWithColor:v3];

  return v4;
}

- (SBDashBoardVibrantWallpaperChevronView)initWithColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardVibrantWallpaperChevronView;
  v3 = [(SBUIChevronView *)&v7 initWithColor:a3];
  if (v3)
  {
    v4 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:0];
    effectView = v3->_effectView;
    v3->_effectView = v4;

    [(PBUIWallpaperEffectViewBase *)v3->_effectView setStyle:10];
  }
  return v3;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBDashBoardVibrantWallpaperChevronView *)self _updateVibrancy];
  }
}

- (void)_updateVibrancy
{
  if ([MEMORY[0x1E4F5E490] supportsVibrancy])
  {
    v3 = (void *)MEMORY[0x1E4F5E490];
    effectView = self->_effectView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
    objc_msgSend(v3, "updateVibrantView:backgroundView:colorProvider:", self, effectView);
  }
  else
  {
    id WeakRetained = [(_UILegibilitySettings *)self->_legibilitySettings secondaryColor];
    [(SBUIChevronView *)self setVibrantSettings:0];
    [(SBUIChevronView *)self setBackgroundView:0];
    [(SBDashBoardVibrantWallpaperChevronView *)self setBackgroundColor:0];
    [(SBUIChevronView *)self setColor:WeakRetained];
  }
}

- (double)strength
{
  return self->_legibilityStrength;
}

- (void)setStrength:(double)a3
{
  self->_legibilityStrength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
  return (CSWallpaperColorProvider *)WeakRetained;
}

- (void)setWallpaperColorProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end