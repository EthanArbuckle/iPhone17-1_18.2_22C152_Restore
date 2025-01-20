@interface SBLockScreenPluginOverlayViewController
+ (BOOL)_pluginNeedsOverlay:(id)a3;
- (SBLockScreenPluginOverlayViewController)initWithPlugin:(id)a3;
- (id)_newOverlayView;
- (void)loadView;
@end

@implementation SBLockScreenPluginOverlayViewController

+ (BOOL)_pluginNeedsOverlay:(id)a3
{
  id v3 = a3;
  v4 = [v3 appearance];
  uint64_t v5 = [v4 backgroundStyle];

  if (v5 == 3)
  {
    v6 = +[SBWallpaperController sharedInstance];
    v7 = [v6 legibilitySettingsForVariant:0];
    v8 = [v3 appearance];
    v9 = [v8 legibilitySettings];

    uint64_t v10 = [v7 style];
    BOOL v12 = [v9 style] != 2 && v10 == 2;
  }
  else
  {
    BOOL v12 = v5 != 0;
  }

  return v12;
}

- (SBLockScreenPluginOverlayViewController)initWithPlugin:(id)a3
{
  id v4 = a3;
  if (+[SBLockScreenPluginOverlayViewController _pluginNeedsOverlay:v4])
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLockScreenPluginOverlayViewController;
    uint64_t v5 = [(SBLockScreenPluginOverlayViewController *)&v9 init];
    v6 = v5;
    if (v5) {
      objc_storeWeak((id *)&v5->_plugin, v4);
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)loadView
{
  id v3 = [(SBLockScreenPluginOverlayViewController *)self _newOverlayView];
  [(SBLockScreenPluginOverlayViewController *)self setView:v3];
}

- (id)_newOverlayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  id v3 = [WeakRetained appearance];
  uint64_t v4 = [v3 backgroundStyle];

  if (!v4) {
    return 0;
  }
  if (v4 != 2) {
    uint64_t v4 = 1;
  }
  uint64_t v5 = [SBLockOverlayView alloc];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[SBUILockOverlayView initWithFrame:style:](v5, "initWithFrame:style:", v4, v6, v7, v8, v9);
}

- (void).cxx_destruct
{
}

@end