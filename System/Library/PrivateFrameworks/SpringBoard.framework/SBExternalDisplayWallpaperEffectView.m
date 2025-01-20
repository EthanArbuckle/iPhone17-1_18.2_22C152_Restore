@interface SBExternalDisplayWallpaperEffectView
- (BOOL)enableBlurEffects;
- (SBExternalDisplayWallpaperConfigurations)delegate;
- (SBWallpaperEffectView)wallpaperEffectView;
- (UIView)blurBackgroundView;
- (id)initExternalDisplayWithDelegate:(id)a3 wallpaperVariant:(int64_t)a4 transformOptions:(unint64_t)a5;
- (void)setBlurBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWallpaperEffectView:(id)a3;
@end

@implementation SBExternalDisplayWallpaperEffectView

- (id)initExternalDisplayWithDelegate:(id)a3 wallpaperVariant:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBExternalDisplayWallpaperEffectView;
  v9 = [(SBExternalDisplayWallpaperEffectView *)&v19 init];
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:a4 transformOptions:a5];
    id v12 = p_isa[53];
    p_isa[53] = v11;

    [p_isa[53] setClipsToBounds:1];
    [p_isa[53] setForcesOpaque:1];
    id v13 = p_isa[53];
    v14 = [MEMORY[0x1E4F83BA0] defaultConfiguration];
    [v13 setExternalDisplayConfiguration:v14];

    [p_isa[53] setStyle:0];
    [p_isa[53] setFullscreen:1];
    [p_isa[53] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa addSubview:p_isa[53]];
    id v15 = (id)SBHPinViewWithinView();
    if ([p_isa enableBlurEffects])
    {
      v16 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:51 options:2 initialWeighting:1.0];
      [v16 setGroupNameBase:@"SBExternalDisplayWallpaperEffectView"];
      [v16 setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:1];
      objc_msgSend(v16, "bs_setHitTestingDisabled:", 1);
      [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
      [p_isa addSubview:v16];
      id v17 = (id)SBHPinViewWithinView();
    }
  }

  return p_isa;
}

- (BOOL)enableBlurEffects
{
  v2 = [(SBExternalDisplayWallpaperEffectView *)self delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v3 = [v2 enableBlurEffects];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (SBExternalDisplayWallpaperConfigurations)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBExternalDisplayWallpaperConfigurations *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
}

- (SBWallpaperEffectView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (void)setWallpaperEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end