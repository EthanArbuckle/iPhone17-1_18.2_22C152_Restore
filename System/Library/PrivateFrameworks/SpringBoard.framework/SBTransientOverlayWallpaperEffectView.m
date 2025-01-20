@interface SBTransientOverlayWallpaperEffectView
- (BOOL)prepareToAnimateToTransitionState:(id *)a3;
- (CATransform3D)_currentWallpaperTransform;
- (SBTransientOverlayWallpaperEffectView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4;
- (int64_t)containerOrientation;
- (int64_t)wallpaperStyle;
- (void)_updateWallpaperGeometry;
- (void)layoutSubviews;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setTransitionState:(id *)a3;
- (void)setWallpaperStyle:(int64_t)a3;
@end

@implementation SBTransientOverlayWallpaperEffectView

- (SBTransientOverlayWallpaperEffectView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SBTransientOverlayWallpaperEffectView;
  v5 = -[SBTransientOverlayWallpaperEffectView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F43140]);
    [(SBTransientOverlayWallpaperEffectView *)v5 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    wallpaperRotationView = v5->_wallpaperRotationView;
    v5->_wallpaperRotationView = (_UIDirectionalRotationView *)v7;

    [(_UIDirectionalRotationView *)v5->_wallpaperRotationView setCounterTransformView:1];
    [(SBTransientOverlayWallpaperEffectView *)v5 addSubview:v5->_wallpaperRotationView];
    v9 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:a4 transformOptions:1];
    wallpaperEffectView = v5->_wallpaperEffectView;
    v5->_wallpaperEffectView = v9;

    [(PBUIWallpaperEffectViewBase *)v5->_wallpaperEffectView setForcesOpaque:1];
    [(PBUIWallpaperEffectViewBase *)v5->_wallpaperEffectView setFullscreen:1];
    [(SBWallpaperEffectView *)v5->_wallpaperEffectView setAlpha:1.0];
    [(_UIDirectionalRotationView *)v5->_wallpaperRotationView addSubview:v5->_wallpaperEffectView];
    [(SBTransientOverlayWallpaperEffectView *)v5 _updateWallpaperGeometry];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBTransientOverlayWallpaperEffectView;
  [(SBTransientOverlayWallpaperEffectView *)&v3 layoutSubviews];
  [(SBTransientOverlayWallpaperEffectView *)self _updateWallpaperGeometry];
}

- (BOOL)prepareToAnimateToTransitionState:(id *)a3
{
  return [(PBUIWallpaperEffectViewBase *)self->_wallpaperEffectView prepareToAnimateToTransitionState:a3];
}

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    [(SBTransientOverlayWallpaperEffectView *)self _updateWallpaperGeometry];
  }
}

- (void)setTransitionState:(id *)a3
{
  wallpaperEffectView = self->_wallpaperEffectView;
  $1D129F7B4C980C50E70029647222EF17 v4 = *a3;
  [(PBUIWallpaperEffectViewBase *)wallpaperEffectView setTransitionState:&v4];
}

- (void)setWallpaperStyle:(int64_t)a3
{
}

- (int64_t)wallpaperStyle
{
  return [(PBUIWallpaperEffectViewBase *)self->_wallpaperEffectView wallpaperStyle];
}

- (CATransform3D)_currentWallpaperTransform
{
  result = [(SBTransientOverlayWallpaperEffectView *)self containerOrientation];
  v5 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v6;
  long long v7 = v5[7];
  *(_OWORD *)&retstr->m41 = v5[6];
  *(_OWORD *)&retstr->m43 = v7;
  long long v8 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v8;
  long long v9 = v5[3];
  *(_OWORD *)&retstr->m21 = v5[2];
  *(_OWORD *)&retstr->m23 = v9;
  if (result != (CATransform3D *)1)
  {
    BSDegreesToRadians();
    result = CATransform3DMakeRotation(&v15, v10, 0.0, 0.0, 1.0);
    long long v11 = *(_OWORD *)&v15.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v15.m31;
    *(_OWORD *)&retstr->m33 = v11;
    long long v12 = *(_OWORD *)&v15.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v15.m41;
    *(_OWORD *)&retstr->m43 = v12;
    long long v13 = *(_OWORD *)&v15.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v15.m11;
    *(_OWORD *)&retstr->m13 = v13;
    long long v14 = *(_OWORD *)&v15.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v15.m21;
    *(_OWORD *)&retstr->m23 = v14;
  }
  return result;
}

- (void)_updateWallpaperGeometry
{
  [(SBTransientOverlayWallpaperEffectView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  [(SBTransientOverlayWallpaperEffectView *)self _currentWallpaperTransform];
  int64_t v11 = [(SBTransientOverlayWallpaperEffectView *)self containerOrientation];
  double Height = v8;
  double Width = v10;
  if ((unint64_t)(v11 - 3) <= 1)
  {
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    double Height = CGRectGetHeight(v26);
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    double Width = CGRectGetWidth(v27);
  }
  -[_UIDirectionalRotationView setBounds:](self->_wallpaperRotationView, "setBounds:", v4, v6, Height, Width);
  wallpaperRotationView = self->_wallpaperRotationView;
  UIRectGetCenter();
  -[_UIDirectionalRotationView setCenter:](wallpaperRotationView, "setCenter:");
  CATransform3D v15 = self->_wallpaperRotationView;
  v17[4] = v22;
  v17[5] = v23;
  v17[6] = v24;
  v17[7] = v25;
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  v17[3] = v21;
  [(_UIDirectionalRotationView *)v15 setTransform3D:v17];
  wallpaperEffectView = self->_wallpaperEffectView;
  [(_UIDirectionalRotationView *)self->_wallpaperRotationView bounds];
  -[SBWallpaperEffectView setFrame:](wallpaperEffectView, "setFrame:");
  [(_UIDirectionalRotationView *)self->_wallpaperRotationView layoutIfNeeded];
  [(SBWallpaperEffectView *)self->_wallpaperEffectView layoutIfNeeded];
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperRotationView, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
}

@end