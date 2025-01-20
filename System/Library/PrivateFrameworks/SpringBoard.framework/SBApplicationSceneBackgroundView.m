@interface SBApplicationSceneBackgroundView
- (BOOL)_isTranslucent;
- (BOOL)isFullscreen;
- (BOOL)needsClassicModeBackground;
- (BOOL)shouldUseBrightMaterial;
- (NSString)description;
- (SBApplicationSceneBackgroundView)initWithFrame:(CGRect)a3;
- (_BYTE)_opaqueBackgroundColor;
- (_BYTE)_opaqueBackgroundColorOrClearColor;
- (int64_t)wallpaperStyle;
- (unint64_t)transformOptions;
- (void)_backgroundWallpaperEffectView;
- (void)_setupBackground;
- (void)_setupBackgroundWithAnimationSettings:(uint64_t)a1;
- (void)_teardownBackgroundWallpaperEffectView;
- (void)setFullscreen:(BOOL)a3;
- (void)setNeedsClassicModeBackground:(BOOL)a3;
- (void)setShouldUseBrightMaterial:(BOOL)a3;
- (void)setTransformOptions:(unint64_t)a3;
- (void)setWallpaperStyle:(int64_t)a3;
- (void)setWallpaperStyle:(int64_t)a3 withAnimationSettings:(id)a4;
@end

@implementation SBApplicationSceneBackgroundView

- (void)setWallpaperStyle:(int64_t)a3
{
  if (self->_wallpaperStyle != a3)
  {
    self->_wallpaperStyle = a3;
    [(SBApplicationSceneBackgroundView *)self _setupBackground];
  }
}

- (SBApplicationSceneBackgroundView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBApplicationSceneBackgroundView;
  result = -[SBApplicationSceneBackgroundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_wallpaperStyle = -1;
    result->_transformOptions = 33;
  }
  return result;
}

- (void)setNeedsClassicModeBackground:(BOOL)a3
{
  if (self->_needsClassicModeBackground != a3)
  {
    self->_needsClassicModeBackground = a3;
    [(SBApplicationSceneBackgroundView *)self _setupBackground];
  }
}

- (void)_setupBackground
{
  if (self && self->_wallpaperStyle != 1)
  {
    -[SBApplicationSceneBackgroundView _backgroundWallpaperEffectView](self);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setWallpaperStyle:self->_wallpaperStyle];
    [v5 setForcesOpaque:1];
    [(SBApplicationSceneBackgroundView *)self bounds];
    objc_msgSend(v5, "setFrame:");
    [v5 setFullscreen:self->_fullscreen];
    [(SBApplicationSceneBackgroundView *)self addSubview:v5];
    objc_super v4 = self;
    uint64_t v3 = 0;
  }
  else
  {
    -[SBApplicationSceneBackgroundView _teardownBackgroundWallpaperEffectView]((uint64_t)self);
    uint64_t v3 = -[SBApplicationSceneBackgroundView _opaqueBackgroundColorOrClearColor](self);
    objc_super v4 = self;
    id v5 = (id)v3;
  }
  [(SBApplicationSceneBackgroundView *)v4 setBackgroundColor:v3];
}

- (void)_teardownBackgroundWallpaperEffectView
{
  if (a1)
  {
    [*(id *)(a1 + 416) removeFromSuperview];
    v2 = *(void **)(a1 + 416);
    *(void *)(a1 + 416) = 0;
  }
}

- (_BYTE)_opaqueBackgroundColorOrClearColor
{
  if (a1)
  {
    if (a1[424]) {
      -[SBApplicationSceneBackgroundView _opaqueBackgroundColor](a1);
    }
    else {
    a1 = [MEMORY[0x1E4F428B8] clearColor];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
}

- (void)_backgroundWallpaperEffectView
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = (void *)a1[52];
    if (!v3)
    {
      objc_super v4 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1 transformOptions:a1[54]];
      id v5 = (void *)v2[52];
      v2[52] = v4;

      [(id)v2[52] setAutoresizingMask:18];
      uint64_t v3 = (void *)v2[52];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  objc_super v4 = PBUIWallpaperStyleDescription();
  id v5 = (id)[v3 appendObject:v4 withName:@"wallpaperStyle"];

  id v6 = (id)[v3 appendBool:self->_wallpaperStyle != 1 withName:@"_isTranslucent"];
  id v7 = (id)[v3 appendSuper];
  v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)_isTranslucent
{
  if (result) {
    return *(void *)(result + 408) != 1;
  }
  return result;
}

- (void)setWallpaperStyle:(int64_t)a3 withAnimationSettings:(id)a4
{
  if (self->_wallpaperStyle != a3)
  {
    self->_wallpaperStyle = a3;
    -[SBApplicationSceneBackgroundView _setupBackgroundWithAnimationSettings:]((uint64_t)self, a4);
  }
}

- (void)_setupBackgroundWithAnimationSettings:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    [(id)a1 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = *(id *)(a1 + 416);
    v13 = *(void **)(a1 + 416);
    *(void *)(a1 + 416) = 0;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v7, v9, v11);
    v15 = (void *)MEMORY[0x1E4F42FF0];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke;
    v44[3] = &unk_1E6AF5290;
    id v16 = v14;
    id v45 = v16;
    uint64_t v46 = a1;
    [v15 performWithoutAnimation:v44];
    if (*(void *)(a1 + 408) == 1)
    {
      v17 = (void *)MEMORY[0x1E4F4F898];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_5;
      v28[3] = &unk_1E6AF5290;
      id v29 = v12;
      uint64_t v30 = a1;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_6;
      v25[3] = &unk_1E6AF4A98;
      id v26 = v29;
      id v27 = v16;
      id v18 = v16;
      [v17 animateWithSettings:v3 options:4 actions:v28 completion:v25];

      id v19 = v29;
    }
    else
    {
      v20 = -[SBApplicationSceneBackgroundView _backgroundWallpaperEffectView]((void *)a1);
      v21 = (void *)MEMORY[0x1E4F42FF0];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_2;
      v37[3] = &unk_1E6AF6D10;
      id v22 = v20;
      id v38 = v22;
      uint64_t v39 = a1;
      double v40 = v5;
      double v41 = v7;
      double v42 = v9;
      double v43 = v11;
      [v21 performWithoutAnimation:v37];
      v23 = (void *)MEMORY[0x1E4F4F898];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_3;
      v34[3] = &unk_1E6AF5290;
      id v35 = v22;
      uint64_t v36 = a1;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_4;
      v31[3] = &unk_1E6AF4A98;
      id v32 = v12;
      id v33 = v16;
      id v24 = v16;
      id v19 = v22;
      [v23 animateWithSettings:v3 options:4 actions:v34 completion:v31];
    }
  }
}

- (void)setFullscreen:(BOOL)a3
{
  if (self->_fullscreen != a3)
  {
    self->_fullscreen = a3;
    [(SBApplicationSceneBackgroundView *)self _setupBackground];
  }
}

- (void)setTransformOptions:(unint64_t)a3
{
  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3 | 0x20;
    -[PBUIWallpaperEffectViewBase setTransformOptions:](self->_backgroundWallpaperEffectView, "setTransformOptions:");
  }
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = -[SBApplicationSceneBackgroundView _opaqueBackgroundColor](*(unsigned char **)(a1 + 40));
  [v2 setBackgroundColor:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  return [v4 insertSubview:v5 atIndex:0];
}

- (_BYTE)_opaqueBackgroundColor
{
  if (a1)
  {
    if (a1[426]) {
      [MEMORY[0x1E4F428B8] systemMidGrayColor];
    }
    else {
    a1 = [MEMORY[0x1E4F428B8] blackColor];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setWallpaperStyle:*(void *)(*(void *)(a1 + 40) + 408)];
  [*(id *)(a1 + 32) setForcesOpaque:1];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 32) setFullscreen:*(unsigned __int8 *)(*(void *)(a1 + 40) + 425)];
  [*(id *)(a1 + 40) addSubview:*(void *)(a1 + 32)];
  v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setBackgroundColor:0];
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

void __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(unsigned char **)(a1 + 40);
  -[SBApplicationSceneBackgroundView _opaqueBackgroundColorOrClearColor](v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setBackgroundColor:v3];
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (void)setShouldUseBrightMaterial:(BOOL)a3
{
  if (self->_shouldUseBrightMaterial != a3)
  {
    self->_shouldUseBrightMaterial = a3;
    [(SBApplicationSceneBackgroundView *)self _setupBackground];
  }
}

- (int64_t)wallpaperStyle
{
  return self->_wallpaperStyle;
}

- (BOOL)needsClassicModeBackground
{
  return self->_needsClassicModeBackground;
}

- (BOOL)isFullscreen
{
  return self->_fullscreen;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (BOOL)shouldUseBrightMaterial
{
  return self->_shouldUseBrightMaterial;
}

@end