@interface PBUIFakeBlurView
+ (id)_imageForStyle:(int64_t *)a3 withSource:(id)a4;
+ (id)_imageForStyle:(int64_t *)a3 withSource:(id)a4 overrideTraitCollection:(id)a5;
+ (void)_imageForStyle:(int64_t)a3 withSource:(id)a4 overrideTraitCollection:(id)a5 result:(id)a6;
- (BOOL)isFullscreen;
- (BOOL)parallaxEnabledForVariant:(int64_t)a3;
- (BOOL)shouldMatchWallpaperPosition;
- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4;
- (NSString)description;
- (PBUIFakeBlurImageProviding)imageProvider;
- (PBUIFakeBlurObserver)observer;
- (PBUIFakeBlurView)initWithVariant:(int64_t)a3 imageProvider:(id)a4 fakeBlurRegistry:(id)a5 wallpaperViewDelegate:(id)a6 transformOptions:(unint64_t)a7 reachabilityCoordinator:(id)a8;
- (PBUIFakeBlurView)initWithVariant:(int64_t)a3 wallpaperViewController:(id)a4 transformOptions:(unint64_t)a5 reachabilityCoordinator:(id)a6;
- (PBUIFakeBlurViewRegistering)fakeBlurRegistry;
- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator;
- (PBUIWallpaperViewController)wallpaperViewController;
- (UIView)providedImageView;
- (double)parallaxFactorForVariant:(int64_t)a3;
- (double)zoomFactorForVariant:(int64_t)a3;
- (double)zoomScale;
- (id)_effectiveTraitCollectionForMode:(void *)a1;
- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5;
- (id)newImageProviderView;
- (int64_t)effectiveStyle;
- (int64_t)variant;
- (unint64_t)transformOptions;
- (void)_createOrRemoveMatchMoveAnimationIfNeeded;
- (void)_setImage:(uint64_t)a3 style:(int)a4 notify:;
- (void)_updateImageFromProviderWithTraitCollection:(id *)a1;
- (void)_updateImageWithSource:(uint64_t)a1 overrideTraitCollection:(void *)a2 notifyObserver:(void *)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)handleReachabilityYOffsetDidChange;
- (void)layoutSubviews;
- (void)offsetWallpaperBy:(CGPoint)a3;
- (void)reconfigureFromProvider;
- (void)reconfigureWithSource:(id)a3;
- (void)requestStyle:(int64_t)a3;
- (void)rotateToInterfaceOrientation:(int64_t)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setShouldMatchWallpaperPosition:(BOOL)a3;
- (void)setTransformOptions:(unint64_t)a3;
- (void)setZoomScale:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImageFromProviderForWallpaperMode:(int64_t)a3;
- (void)updateImageWithSource:(id)a3;
- (void)updateImageWithSource:(void *)a3 overrideTraitCollection:;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PBUIFakeBlurView

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIFakeBlurView;
  [(PBUIFakeBlurView *)&v5 willMoveToWindow:a3];
  v4 = [(PBUIFakeBlurView *)self layer];
  [v4 removeAllAnimations];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIFakeBlurView;
  [(PBUIFakeBlurView *)&v3 didMoveToWindow];
  -[PBUIFakeBlurView _createOrRemoveMatchMoveAnimationIfNeeded]((unsigned __int8 *)self);
}

- (void)_createOrRemoveMatchMoveAnimationIfNeeded
{
  v45[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 window];
    objc_super v3 = [v2 layer];
    v4 = [v3 superlayer];

    objc_super v5 = [v4 superlayer];

    if (v5)
    {
      uint64_t v6 = [v4 superlayer];

      v4 = (void *)v6;
    }
    if (!v4) {
      goto LABEL_18;
    }
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"AlignFakeWallpaperToLayer-%p", v4);
    [a1 bounds];
    double v9 = v8;
    double v11 = v10;
    v12 = [a1 traitCollection];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13 == -1)
    {
      v15 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v16 = [v15 userInterfaceIdiom];

      BOOL v14 = (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    }
    else
    {
      BOOL v14 = v13 == 0;
    }
    char v17 = 0;
    if (v14 && v11 < v9) {
      char v17 = soft_PUIFeatureEnabled(0);
    }
    int v18 = a1[440];
    v19 = [a1 layer];
    id v20 = v19;
    if (!v18 || (v17 & 1) != 0)
    {
      [v19 removeAnimationForKey:v7];
    }
    else
    {
      v21 = [v19 animationKeys];
      char v22 = [v21 containsObject:v7];

      if (v22)
      {
LABEL_17:

LABEL_18:
        return;
      }
      [v4 bounds];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      objc_msgSend(a1, "setFrame:");
      [a1 layoutIfNeeded];
      id v20 = objc_alloc_init(MEMORY[0x1E4F39C00]);
      [v20 setSourceLayer:v4];
      v31 = (void *)MEMORY[0x1E4F29238];
      v46.origin.x = v24;
      v46.origin.y = v26;
      v46.size.width = v28;
      v46.size.height = v30;
      double MinX = CGRectGetMinX(v46);
      v47.origin.x = v24;
      v47.origin.y = v26;
      v47.size.width = v28;
      v47.size.height = v30;
      v33 = objc_msgSend(v31, "valueWithCGPoint:", MinX, CGRectGetMinY(v47));
      v45[0] = v33;
      v34 = (void *)MEMORY[0x1E4F29238];
      v48.origin.x = v24;
      v48.origin.y = v26;
      v48.size.width = v28;
      v48.size.height = v30;
      double MaxX = CGRectGetMaxX(v48);
      v49.origin.x = v24;
      v49.origin.y = v26;
      v49.size.width = v28;
      v49.size.height = v30;
      v36 = objc_msgSend(v34, "valueWithCGPoint:", MaxX, CGRectGetMinY(v49));
      v45[1] = v36;
      v37 = (void *)MEMORY[0x1E4F29238];
      v50.origin.x = v24;
      v50.origin.y = v26;
      v50.size.width = v28;
      v50.size.height = v30;
      double v38 = CGRectGetMaxX(v50);
      v51.origin.x = v24;
      v51.origin.y = v26;
      v51.size.width = v28;
      v51.size.height = v30;
      v39 = objc_msgSend(v37, "valueWithCGPoint:", v38, CGRectGetMaxY(v51));
      v45[2] = v39;
      v40 = (void *)MEMORY[0x1E4F29238];
      v52.origin.x = v24;
      v52.origin.y = v26;
      v52.size.width = v28;
      v52.size.height = v30;
      double v41 = CGRectGetMinX(v52);
      v53.origin.x = v24;
      v53.origin.y = v26;
      v53.size.width = v28;
      v53.size.height = v30;
      v42 = objc_msgSend(v40, "valueWithCGPoint:", v41, CGRectGetMaxY(v53));
      v45[3] = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
      [v20 setSourcePoints:v43];

      [v20 setDuration:INFINITY];
      [v20 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v20 setRemovedOnCompletion:0];
      v44 = [a1 layer];
      [v44 addAnimation:v20 forKey:v7];
    }
    goto LABEL_17;
  }
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PBUIFakeBlurView;
  [(PBUIFakeBlurView *)&v23 layoutSubviews];
  [(UIView *)self->_providedImageView sizeToFit];
  [(PBUIFakeBlurView *)self bounds];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  if (soft_PUIDynamicRotationIsActive() && height > width)
  {
    BSRectGetCenter();
    double v12 = v11;
    double v14 = v13;
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 _referenceBounds];
    double width = v16;
    double height = v17;

    double x = v12 - width * 0.5;
    double y = v14 - height * 0.5;
  }
  reachabilityCoordinator = self->_reachabilityCoordinator;
  if (reachabilityCoordinator)
  {
    v19 = [(PBUIFakeBlurView *)self window];
    if ([(PBUIWallpaperReachabilityCoordinating *)reachabilityCoordinator isWindowIgnoredForReachability:v19])
    {
    }
    else
    {
      BOOL v20 = [(PBUIFakeBlurView *)self shouldMatchWallpaperPosition];

      if (v20)
      {
        [(PBUIWallpaperReachabilityCoordinating *)self->_reachabilityCoordinator effectiveReachabilityYOffset];
        CGFloat v22 = -v21;
        v24.origin.double x = x;
        v24.origin.double y = y;
        v24.size.double width = width;
        v24.size.double height = height;
        CGRect v25 = CGRectOffset(v24, 0.0, v22);
        double x = v25.origin.x;
        double y = v25.origin.y;
        double width = v25.size.width;
        double height = v25.size.height;
      }
    }
  }
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  CGRect v27 = CGRectOffset(v26, self->_wallpaperOffset.x, self->_wallpaperOffset.y);
  -[PBUIWallpaperView setFrame:](self->_wallpaperView, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  [(PBUIWallpaperView *)self->_wallpaperView setNeedsLayout];
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (void)reconfigureFromProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    char v4 = [(PBUIFakeBlurView *)self transformOptions];
    int64_t v5 = [(PBUIFakeBlurView *)self variant];
    wallpaperView = self->_wallpaperView;
    [v9 parallaxFactorForVariant:v5];
    -[PBUIWallpaperView setParallaxFactor:](wallpaperView, "setParallaxFactor:");
    uint64_t v7 = (v4 & 8) != 0 ? 0 : [v9 parallaxEnabledForVariant:v5];
    [(PBUIWallpaperView *)self->_wallpaperView setParallaxEnabled:v7];
    id WeakRetained = v9;
    if ((v4 & 4) == 0)
    {
      double v8 = self->_wallpaperView;
      [v9 zoomFactorForVariant:v5];
      -[PBUIWallpaperView setZoomFactor:](v8, "setZoomFactor:");
      id WeakRetained = v9;
    }
  }
}

- (int64_t)effectiveStyle
{
  return self->_effectiveStyle;
}

- (int64_t)variant
{
  return [(PBUIWallpaperView *)self->_wallpaperView variant];
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (void)offsetWallpaperBy:(CGPoint)a3
{
  if (self->_wallpaperOffset.x != a3.x || self->_wallpaperOffset.y != a3.y)
  {
    self->_wallpaperOffset = a3;
    [(PBUIFakeBlurView *)self setNeedsLayout];
    [(PBUIFakeBlurView *)self layoutIfNeeded];
  }
}

- (void)requestStyle:(int64_t)a3
{
  if (self->_requestedStyle != a3)
  {
    self->_requestedStyle = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);

    if (WeakRetained)
    {
      if (objc_opt_respondsToSelector()) {
        [(UIView *)self->_providedImageView requestStyle:a3];
      }
      id v8 = [(PBUIFakeBlurView *)self traitCollection];
      -[PBUIFakeBlurView _updateImageFromProviderWithTraitCollection:]((id *)&self->super.super.super.isa, v8);
    }
    else
    {
      id v8 = [(PBUIFakeBlurView *)self wallpaperViewController];
      uint64_t v6 = [v8 _sourceForFakeBlurView:self];
      uint64_t v7 = [v8 fakeBlurViewOverrideTraitCollection];
      -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:]((uint64_t)self, v6, v7);
    }
  }
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  if (self->_shouldMatchWallpaperPosition != a3)
  {
    BOOL v3 = a3;
    self->_shouldMatchWallpaperPosition = a3;
    if (objc_opt_respondsToSelector()) {
      [(UIView *)self->_providedImageView setShouldMatchWallpaperPosition:v3];
    }
    -[PBUIFakeBlurView _createOrRemoveMatchMoveAnimationIfNeeded]((unsigned __int8 *)self);
  }
}

- (void)setObserver:(id)a3
{
}

- (void)_updateImageFromProviderWithTraitCollection:(id *)a1
{
  if (a1)
  {
    id v7 = a1[52];
    BOOL v3 = a1 + 60;
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    uint64_t v6 = objc_msgSend(WeakRetained, "imageForWallpaperStyle:variant:traitCollection:", &v7, objc_msgSend(a1, "variant"), v4);

    -[PBUIFakeBlurView _setImage:style:notify:]((uint64_t)a1, v6, (uint64_t)v7, 1);
  }
}

- (void)_setImage:(uint64_t)a3 style:(int)a4 notify:
{
  id v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 480));
    int v9 = [WeakRetained updateImageProviderView:*(void *)(a1 + 448) withImage:v7];

    if (v9)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__PBUIFakeBlurView__setImage_style_notify___block_invoke;
      v12[3] = &unk_1E62B2798;
      v12[4] = a1;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v12];
      double v10 = [*(id *)(a1 + 432) layer];
      [v10 reloadValueForKeyPath:@"contents"];

      [*(id *)(a1 + 432) setNeedsLayout];
    }
    if (*(void *)(a1 + 424) != a3)
    {
      *(void *)(a1 + 424) = a3;
      if (a4)
      {
        id v11 = objc_loadWeakRetained((id *)(a1 + 472));
        [v11 fakeBlurView:a1 didChangeStyle:*(void *)(a1 + 424)];
      }
    }
  }
}

- (PBUIFakeBlurView)initWithVariant:(int64_t)a3 imageProvider:(id)a4 fakeBlurRegistry:(id)a5 wallpaperViewDelegate:(id)a6 transformOptions:(unint64_t)a7 reachabilityCoordinator:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  int v18 = [MEMORY[0x1E4F42D90] mainScreen];
  [v18 bounds];
  v28.receiver = self;
  v28.super_class = (Class)PBUIFakeBlurView;
  v19 = -[PBUIFakeBlurView initWithFrame:](&v28, sel_initWithFrame_);

  if (v19)
  {
    *(_OWORD *)(v19 + 456) = *MEMORY[0x1E4F1DAD8];
    BOOL v20 = [[PBUIWallpaperConfiguration alloc] initWithVariant:a3 type:1];
    double v21 = [PBUIWallpaperView alloc];
    uint64_t v22 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](v21, "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v20, a3, 0, v16, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v23 = (void *)*((void *)v19 + 54);
    *((void *)v19 + 54) = v22;

    [v19 addSubview:*((void *)v19 + 54)];
    [v19 setTransformOptions:a7];
    uint64_t v24 = [v14 newImageProviderView];
    CGRect v25 = (void *)*((void *)v19 + 56);
    *((void *)v19 + 56) = v24;

    [*((id *)v19 + 56) setOpaque:1];
    CGRect v26 = [*((id *)v19 + 56) layer];
    [v26 setContentsOpaque:1];

    [*((id *)v19 + 54) setContentView:*((void *)v19 + 56)];
    objc_storeWeak((id *)v19 + 60, v14);
    objc_storeWeak((id *)v19 + 61, v15);
    [v15 _registerFakeBlurView:v19];
    [v19 reconfigureFromProvider];
    *((void *)v19 + 53) = -1;
    *((void *)v19 + 52) = -1;
    v19[440] = 1;
    objc_storeStrong((id *)v19 + 63, a8);
    [*((id *)v19 + 63) addReachabilityObserver:v19];
  }
  return (PBUIFakeBlurView *)v19;
}

- (void)setTransformOptions:(unint64_t)a3
{
  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3;
    if (PBUIWallpaperTransformOptionsShouldIgnoreRotation(a3))
    {
      wallpaperView = self->_wallpaperView;
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v7[0] = *MEMORY[0x1E4F1DAB8];
      v7[1] = v6;
      v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(PBUIWallpaperView *)wallpaperView setTransform:v7];
    }
    [(PBUIWallpaperView *)self->_wallpaperView setTransformOptions:a3];
    if (objc_opt_respondsToSelector()) {
      [(UIView *)self->_providedImageView setTransformOptions:a3];
    }
  }
}

- (void)rotateToInterfaceOrientation:(int64_t)a3
{
  if ((PBUIWallpaperTransformOptionsShouldIgnoreRotation(self->_transformOptions) & 1) == 0)
  {
    if (PBUIWallpaperTransformOptionsShouldIgnoreLandscapeRotation(self->_transformOptions))
    {
      wallpaperView = self->_wallpaperView;
      switch(a3)
      {
        case 1:
          double v6 = 0.0;
          break;
        case 3:
          double v6 = 1.57079633;
          break;
        case 4:
          double v6 = -1.57079633;
          break;
        default:
          double v6 = 3.14159265;
          if (a3 != 2) {
            double v6 = 0.0;
          }
          break;
      }
      CGAffineTransformMakeRotation(&v14, v6);
      UIIntegralTransform();
      CGAffineTransformInvert(&v16, &v15);
      int v9 = &v16;
    }
    else
    {
      int IsActive = soft_PUIDynamicRotationIsActive();
      wallpaperView = self->_wallpaperView;
      if (IsActive)
      {
        long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v13[0] = *MEMORY[0x1E4F1DAB8];
        v13[1] = v8;
        v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        int v9 = (CGAffineTransform *)v13;
      }
      else
      {
        switch(a3)
        {
          case 1:
            double v10 = 0.0;
            break;
          case 3:
            double v10 = 1.57079633;
            break;
          case 4:
            double v10 = -1.57079633;
            break;
          default:
            double v10 = 3.14159265;
            if (a3 != 2) {
              double v10 = 0.0;
            }
            break;
        }
        CGAffineTransformMakeRotation(&v11, v10);
        UIIntegralTransform();
        int v9 = (CGAffineTransform *)&v12;
      }
    }
    [(PBUIWallpaperView *)wallpaperView setTransform:v9];
  }
  [(PBUIFakeBlurView *)self layoutIfNeeded];
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t requestedStyle = self->_requestedStyle;
  int64_t effectiveStyle = self->_effectiveStyle;
  double v6 = PBUIWallpaperStyleDescription(requestedStyle);
  if (requestedStyle == effectiveStyle)
  {
    id v7 = @"style";
  }
  else
  {
    id v8 = (id)[v3 appendObject:v6 withName:@"requestedStyle"];

    double v6 = PBUIWallpaperStyleDescription(self->_effectiveStyle);
    id v7 = @"effectiveStyle";
  }
  id v9 = (id)[v3 appendObject:v6 withName:v7];

  id v10 = (id)[v3 appendSuper];
  CGAffineTransform v11 = [v3 build];

  return (NSString *)v11;
}

- (void)_updateImageWithSource:(uint64_t)a1 overrideTraitCollection:(void *)a2 notifyObserver:(void *)a3
{
  if (a1)
  {
    uint64_t v8 = *(void *)(a1 + 416);
    id v5 = a3;
    id v6 = a2;
    id v7 = [(id)objc_opt_class() _imageForStyle:&v8 withSource:v6 overrideTraitCollection:v5];

    -[PBUIFakeBlurView _setImage:style:notify:](a1, v7, v8, 1);
  }
}

- (double)zoomScale
{
  [(PBUIWallpaperView *)self->_wallpaperView zoomFactor];
  return result;
}

- (void)setZoomScale:(double)a3
{
}

- (void)handleReachabilityYOffsetDidChange
{
  [(PBUIFakeBlurView *)self setNeedsLayout];
  [(PBUIFakeBlurView *)self layoutIfNeeded];
}

- (PBUIFakeBlurView)initWithVariant:(int64_t)a3 wallpaperViewController:(id)a4 transformOptions:(unint64_t)a5 reachabilityCoordinator:(id)a6
{
  id v10 = a4;
  CGAffineTransform v11 = [(PBUIFakeBlurView *)self initWithVariant:a3 imageProvider:self fakeBlurRegistry:v10 wallpaperViewDelegate:v10 transformOptions:a5 reachabilityCoordinator:a6];
  char v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_wallpaperViewController, v10);
    double v13 = [v10 _sourceForFakeBlurView:v12];
    [(PBUIFakeBlurView *)v12 reconfigureWithSource:v13];
  }
  return v12;
}

- (void)dealloc
{
  BOOL v3 = [(PBUIFakeBlurView *)self wallpaperViewController];
  [v3 _unregisterFakeBlurView:self];
  if (self->_providedImageView && (objc_opt_respondsToSelector() & 1) != 0) {
    [(UIView *)self->_providedImageView invalidate];
  }

  v4.receiver = self;
  v4.super_class = (Class)PBUIFakeBlurView;
  [(PBUIFakeBlurView *)&v4 dealloc];
}

- (void)reconfigureWithSource:(id)a3
{
  id v8 = a3;
  char v4 = [(PBUIFakeBlurView *)self transformOptions];
  wallpaperView = self->_wallpaperView;
  [v8 parallaxFactor];
  -[PBUIWallpaperView setParallaxFactor:](wallpaperView, "setParallaxFactor:");
  if ((v4 & 8) != 0 || ![v8 parallaxEnabled]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [(id)objc_opt_class() allowsParallax];
  }
  [(PBUIWallpaperView *)self->_wallpaperView setParallaxEnabled:v6];
  if ((v4 & 4) == 0)
  {
    id v7 = self->_wallpaperView;
    [v8 zoomFactor];
    -[PBUIWallpaperView setZoomFactor:](v7, "setZoomFactor:");
  }
}

- (id)_effectiveTraitCollectionForMode:(void *)a1
{
  if (a1)
  {
    BOOL v3 = [a1 wallpaperViewController];
    char v4 = [v3 fakeBlurViewOverrideTraitCollection];

    if (!v4)
    {
      if (a2 == 2) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 1;
      }
      char v4 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:v5];
    }
  }
  else
  {
    char v4 = 0;
  }
  return v4;
}

- (void)updateImageWithSource:(id)a3
{
  id v4 = a3;
  -[PBUIFakeBlurView _effectiveTraitCollectionForMode:](self, [v4 wallpaperMode]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:]((uint64_t)self, v4, v5);
}

- (void)updateImageWithSource:(void *)a3 overrideTraitCollection:
{
  if (a1) {
    -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:](a1, a2, a3);
  }
}

- (void)updateImageFromProviderForWallpaperMode:(int64_t)a3
{
  -[PBUIFakeBlurView _effectiveTraitCollectionForMode:](self, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIFakeBlurView _updateImageFromProviderWithTraitCollection:]((id *)&self->super.super.super.isa, v4);
}

uint64_t __43__PBUIFakeBlurView__setImage_style_notify___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) sizeToFit];
}

+ (id)_imageForStyle:(int64_t *)a3 withSource:(id)a4
{
  return (id)[a1 _imageForStyle:a3 withSource:a4 overrideTraitCollection:0];
}

+ (id)_imageForStyle:(int64_t *)a3 withSource:(id)a4 overrideTraitCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = 0;
  CGAffineTransform v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  int v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  int64_t v10 = *a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection___block_invoke;
  _OWORD v13[3] = &unk_1E62B2BE8;
  v13[4] = &v14;
  v13[5] = a3;
  [a1 _imageForStyle:v10 withSource:v8 overrideTraitCollection:v9 result:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __70__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v7 = a2;
  **(void **)(a1 + 40) = a4;
}

+ (void)_imageForStyle:(int64_t)a3 withSource:(id)a4 overrideTraitCollection:(id)a5 result:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  char v12 = (void (**)(id, id, void *, int64_t))a6;
  if (a3 == 3)
  {
    id v13 = [v10 blurredImage];
    uint64_t v14 = [v10 blurredImageURL];
    if (v13) {
      a3 = 3;
    }
    else {
      a3 = 0;
    }
  }
  else
  {
    CGAffineTransform v15 = [v10 legibilitySettings];
    uint64_t v16 = [v15 contentColor];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    _WallpaperBackdropParametersForStyleAndAverageColor(a3, v16, (uint64_t)&v34);
    uint64_t HasTint = _WallpaperStyleHasTint(a3);
    long long v30 = v34;
    long long v31 = v35;
    long long v32 = v36;
    long long v33 = v37;
    id v13 = [v10 imageForBackdropParameters:&v30 includeTint:HasTint overrideTraitCollection:v11];
    long long v30 = v34;
    long long v31 = v35;
    long long v32 = v36;
    long long v33 = v37;
    uint64_t v14 = [v10 imageURLForBackdropParameters:&v30 includeTint:HasTint overrideTraitCollection:v11];
    if (!v13)
    {
      if (a3)
      {
        *(void *)&long long v30 = 0;
        *((void *)&v30 + 1) = &v30;
        *(void *)&long long v31 = 0x3032000000;
        *((void *)&v31 + 1) = __Block_byref_object_copy__0;
        *(void *)&long long v32 = __Block_byref_object_dispose__0;
        *((void *)&v32 + 1) = 0;
        uint64_t v24 = 0;
        CGRect v25 = &v24;
        uint64_t v26 = 0x3032000000;
        CGRect v27 = __Block_byref_object_copy__0;
        objc_super v28 = __Block_byref_object_dispose__0;
        id v29 = 0;
        uint64_t v20 = 0;
        double v21 = &v20;
        uint64_t v22 = 0x2020000000;
        uint64_t v23 = 0;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __77__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection_result___block_invoke;
        v19[3] = &unk_1E62B2C10;
        v19[4] = &v30;
        v19[5] = &v24;
        v19[6] = &v20;
        [a1 _imageForStyle:3 withSource:v10 overrideTraitCollection:v11 result:v19];
        id v13 = *(id *)(*((void *)&v30 + 1) + 40);
        id v18 = (id)v25[5];

        a3 = v21[3];
        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(&v24, 8);

        _Block_object_dispose(&v30, 8);
      }
      else
      {
        id v13 = [v10 snapshotImage];
        id v18 = [v10 snapshotImageURL];
      }
      uint64_t v14 = v18;
    }
  }
  v12[2](v12, v13, v14, a3);
}

void __77__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection_result___block_invoke(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[4] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(a1[5] + 8);
  char v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

- (void)setFullscreen:(BOOL)a3
{
}

- (BOOL)isFullscreen
{
  return ![(PBUIFakeBlurView *)self shouldMatchWallpaperPosition];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIFakeBlurView;
  [(PBUIFakeBlurView *)&v9 traitCollectionDidChange:v4];
  if (_WallpaperStyleUpdatesWithUserInterfaceStyle(self->_requestedStyle))
  {
    id v5 = [(PBUIFakeBlurView *)self traitCollection];
    uint64_t v6 = [v4 userInterfaceStyle];
    if (v6 != [v5 userInterfaceStyle])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __45__PBUIFakeBlurView_traitCollectionDidChange___block_invoke;
      _OWORD v7[3] = &unk_1E62B2C38;
      v7[4] = self;
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

void __45__PBUIFakeBlurView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 480));

  BOOL v3 = *(id **)(a1 + 32);
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 40);
    -[PBUIFakeBlurView _updateImageFromProviderWithTraitCollection:](v3, v4);
  }
  else
  {
    id v7 = [v3 wallpaperViewController];
    id v5 = [v7 _sourceForFakeBlurView:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:](v6, v5, *(void **)(a1 + 40));
    }
  }
}

- (id)newImageProviderView
{
  return objc_alloc_init(MEMORY[0x1E4F42AA0]);
}

- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v9 = v8;
    }
    else {
      objc_super v9 = 0;
    }
  }
  else
  {
    objc_super v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = objc_opt_class();
  id v12 = v6;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  id v14 = v13;

  BOOL v15 = 0;
  if (v10 && v14)
  {
    id v16 = [v10 image];
    BOOL v15 = v14 != v16;
    if (v14 != v16) {
      [v10 setImage:v14];
    }
  }
  return v15;
}

- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5
{
  id v9 = a5;
  if ([(PBUIFakeBlurView *)self variant] != a4)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v15 = PBUIStringForWallpaperVariant(a4);
    id v16 = PBUIStringForWallpaperVariant([(PBUIFakeBlurView *)self variant]);
    [v14 handleFailureInMethod:a2, self, @"PBUIFakeBlurView.m", 506, @"Unexpected variant %@ (expected %@)", v15, v16 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  uint64_t v11 = [WeakRetained _sourceForFakeBlurView:self];

  if (v11)
  {
    id v12 = [(id)objc_opt_class() _imageForStyle:a3 withSource:v11 overrideTraitCollection:v9];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (double)parallaxFactorForVariant:(int64_t)a3
{
  if ([(PBUIFakeBlurView *)self variant] != a3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = PBUIStringForWallpaperVariant(a3);
    id v13 = PBUIStringForWallpaperVariant([(PBUIFakeBlurView *)self variant]);
    [v11 handleFailureInMethod:a2, self, @"PBUIFakeBlurView.m", 517, @"Unexpected variant %@ (expected %@)", v12, v13 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  uint64_t v7 = [WeakRetained _sourceForFakeBlurView:self];
  [v7 parallaxFactor];
  double v9 = v8;

  return v9;
}

- (BOOL)parallaxEnabledForVariant:(int64_t)a3
{
  if ([(PBUIFakeBlurView *)self variant] != a3)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = PBUIStringForWallpaperVariant(a3);
    id v12 = PBUIStringForWallpaperVariant([(PBUIFakeBlurView *)self variant]);
    [v10 handleFailureInMethod:a2, self, @"PBUIFakeBlurView.m", 523, @"Unexpected variant %@ (expected %@)", v11, v12 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  uint64_t v7 = [WeakRetained _sourceForFakeBlurView:self];

  if ([v7 parallaxEnabled]) {
    char v8 = [(id)objc_opt_class() allowsParallax];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (double)zoomFactorForVariant:(int64_t)a3
{
  if ([(PBUIFakeBlurView *)self variant] != a3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = PBUIStringForWallpaperVariant(a3);
    id v13 = PBUIStringForWallpaperVariant([(PBUIFakeBlurView *)self variant]);
    [v11 handleFailureInMethod:a2, self, @"PBUIFakeBlurView.m", 530, @"Unexpected variant %@ (expected %@)", v12, v13 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  uint64_t v7 = [WeakRetained _sourceForFakeBlurView:self];
  [v7 zoomFactor];
  double v9 = v8;

  return v9;
}

- (PBUIFakeBlurObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PBUIFakeBlurObserver *)WeakRetained;
}

- (UIView)providedImageView
{
  return self->_providedImageView;
}

- (PBUIFakeBlurImageProviding)imageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);
  return (PBUIFakeBlurImageProviding *)WeakRetained;
}

- (PBUIFakeBlurViewRegistering)fakeBlurRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakeBlurRegistry);
  return (PBUIFakeBlurViewRegistering *)WeakRetained;
}

- (PBUIWallpaperViewController)wallpaperViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  return (PBUIWallpaperViewController *)WeakRetained;
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_destroyWeak((id *)&self->_wallpaperViewController);
  objc_destroyWeak((id *)&self->_fakeBlurRegistry);
  objc_destroyWeak((id *)&self->_imageProvider);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_providedImageView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end