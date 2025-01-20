@interface PBUIPortalReplicaEffectView
- (BOOL)isEffectView;
- (BOOL)isFullscreen;
- (PBUIFakeBlurObserver)observer;
- (PBUIPortalReplicaEffectView)initWithFrame:(CGRect)a3;
- (double)effectWeight;
- (double)zoomScale;
- (int64_t)effectiveStyle;
- (unint64_t)transformOptions;
- (void)requestStyle:(int64_t)a3;
- (void)setEffectWeight:(double)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setNeedsSourceUpdate;
- (void)setObserver:(id)a3;
@end

@implementation PBUIPortalReplicaEffectView

- (PBUIPortalReplicaEffectView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PBUIPortalReplicaEffectView;
  v3 = -[PBUIPortalReplicaView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:-2];
    effectView = v3->_effectView;
    v3->_effectView = (_UIBackdropView *)v4;

    v6 = v3->_effectView;
    [(PBUIPortalReplicaEffectView *)v3 bounds];
    -[_UIBackdropView setFrame:](v6, "setFrame:");
    [(_UIBackdropView *)v3->_effectView setAutoresizingMask:18];
    [(_UIBackdropView *)v3->_effectView setHidden:1];
    [(PBUIPortalReplicaEffectView *)v3 addSubview:v3->_effectView];
    [(PBUIPortalReplicaEffectView *)v3 setAutoresizingMask:18];
    [(PBUIPortalReplicaEffectView *)v3 setClipsToBounds:1];
    v7 = [(PBUIPortalReplicaView *)v3 debugView];

    if (v7)
    {
      v8 = [(PBUIPortalReplicaView *)v3 debugView];
      v9 = [MEMORY[0x1E4F428B8] greenColor];
      v10 = [v9 colorWithAlphaComponent:0.4];
      [v8 setColor:v10];

      v11 = [(PBUIPortalReplicaView *)v3 debugView];
      [(PBUIPortalReplicaEffectView *)v3 bringSubviewToFront:v11];
    }
  }
  return v3;
}

- (void)setNeedsSourceUpdate
{
  v20.receiver = self;
  v20.super_class = (Class)PBUIPortalReplicaEffectView;
  [(PBUIPortalReplicaView *)&v20 setNeedsSourceUpdate];
  if (self->_style) {
    BOOL v3 = [(PBUIPortalReplicaView *)self shouldMatchWallpaperPosition];
  }
  else {
    BOOL v3 = 0;
  }
  [(PBUIPortalReplicaView *)self setShouldMatchWallpaperPosition:v3];
  uint64_t v4 = [(PBUIPortalReplicaView *)self source];
  v5 = [v4 legibilitySettings];
  v6 = [v5 contentColor];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  _WallpaperBackdropParametersForStyleAndAverageColor(self->_style, v6, (uint64_t)&v16);
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  v15[3] = v19;
  v7 = PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)v15);
  if (v7)
  {
    [(MTMaterialView *)self->_materialView setHidden:1];
    [(_UIBackdropView *)self->_effectView setHidden:0];
    [(_UIBackdropView *)self->_effectView transitionToSettings:v7];
  }
  else
  {
    [(_UIBackdropView *)self->_effectView setHidden:1];
    [(MTMaterialView *)self->_materialView setHidden:0];
    if (!self->_materialView)
    {
      uint64_t v8 = *((void *)&v19 + 1);
      id MTMaterialViewClass = getMTMaterialViewClass();
      if (v8 == 3) {
        objc_msgSend(MTMaterialViewClass, "pui_homeScreenLegibilityMaterialView");
      }
      else {
      v10 = [MTMaterialViewClass materialViewWithRecipe:19];
      }
      materialView = self->_materialView;
      self->_materialView = v10;

      v12 = self->_materialView;
      [(PBUIPortalReplicaEffectView *)self bounds];
      -[MTMaterialView setFrame:](v12, "setFrame:");
      [(MTMaterialView *)self->_materialView setAutoresizingMask:18];
      [(PBUIPortalReplicaEffectView *)self addSubview:self->_materialView];
      objc_super v13 = [(PBUIPortalReplicaView *)self debugView];

      if (v13)
      {
        v14 = [(PBUIPortalReplicaView *)self debugView];
        [(PBUIPortalReplicaEffectView *)self bringSubviewToFront:v14];
      }
    }
  }
}

- (double)effectWeight
{
  materialView = self->_materialView;
  if (!materialView) {
    return 1.0;
  }
  [(MTMaterialView *)materialView weighting];
  return result;
}

- (void)setEffectWeight:(double)a3
{
}

- (int64_t)effectiveStyle
{
  return self->_style;
}

- (void)requestStyle:(int64_t)a3
{
  if (a3 == -1) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = a3;
  }
  if (self->_style != v3)
  {
    self->_style = v3;
    [(PBUIPortalReplicaEffectView *)self setNeedsSourceUpdate];
  }
}

- (void)setFullscreen:(BOOL)a3
{
}

- (BOOL)isFullscreen
{
  return ![(PBUIPortalReplicaView *)self shouldMatchWallpaperPosition];
}

- (BOOL)isEffectView
{
  return 1;
}

- (PBUIFakeBlurObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PBUIFakeBlurObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end