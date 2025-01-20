@interface SBExternalDisplayWallpaperViewController
- (BOOL)enableBlurEffects;
- (SBExternalDisplayWallpaperEffectView)wallpaperEffectView;
- (SBExternalDisplayWallpaperViewController)initWithWindowScene:(id)a3;
- (UIView)wallpaperContainerView;
- (void)setWallpaperContainerView:(id)a3;
- (void)setWallpaperEffectView:(id)a3;
@end

@implementation SBExternalDisplayWallpaperViewController

- (SBExternalDisplayWallpaperViewController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBExternalDisplayWallpaperViewController;
  v5 = [(SBExternalDisplayWallpaperViewController *)&v23 init];
  if (v5)
  {
    v6 = [[SBExternalDisplayWallpaperEffectView alloc] initExternalDisplayWithDelegate:v5 wallpaperVariant:1 transformOptions:15];
    wallpaperEffectView = v5->_wallpaperEffectView;
    v5->_wallpaperEffectView = v6;

    [(SBExternalDisplayWallpaperEffectView *)v5->_wallpaperEffectView setClipsToBounds:1];
    [(SBExternalDisplayWallpaperEffectView *)v5->_wallpaperEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v9 = [v4 screen];
    [v9 bounds];
    uint64_t v10 = objc_msgSend(v8, "initWithFrame:");
    wallpaperContainerView = v5->_wallpaperContainerView;
    v5->_wallpaperContainerView = (UIView *)v10;

    v12 = v5->_wallpaperContainerView;
    v13 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [(UIView *)v5->_wallpaperContainerView setUserInteractionEnabled:0];
    [(UIView *)v5->_wallpaperContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(SBExternalDisplayWallpaperViewController *)v5 view];
    [v14 addSubview:v5->_wallpaperContainerView];

    v15 = [(SBExternalDisplayWallpaperViewController *)v5 view];
    id v16 = (id)SBHPinViewWithinView();

    v17 = [(SBExternalDisplayWallpaperViewController *)v5 wallpaperContainerView];
    v18 = [(SBExternalDisplayWallpaperViewController *)v5 wallpaperEffectView];
    [v17 addSubview:v18];

    v19 = [(SBExternalDisplayWallpaperViewController *)v5 wallpaperEffectView];
    v20 = [(SBExternalDisplayWallpaperViewController *)v5 wallpaperContainerView];
    id v21 = (id)SBHPinViewWithinView();
  }
  return v5;
}

- (BOOL)enableBlurEffects
{
  return 0;
}

- (UIView)wallpaperContainerView
{
  return self->_wallpaperContainerView;
}

- (void)setWallpaperContainerView:(id)a3
{
}

- (SBExternalDisplayWallpaperEffectView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (void)setWallpaperEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end