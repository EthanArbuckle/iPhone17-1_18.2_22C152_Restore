@interface PBUIAccessibilityTintView
- (BOOL)isFullscreen;
- (BOOL)shouldMatchWallpaperPosition;
- (PBUIAccessibilityTintView)initWithVariant:(int64_t)a3 wallpaperPresenter:(id)a4 wallpaperLegibilityProvider:(id)a5;
- (PBUIAccessibilityTintView)initWithVariant:(int64_t)a3 wallpaperViewController:(id)a4;
- (PBUIFakeBlurObserver)observer;
- (PBUILegacyWallpaperPresenting)wallpaperPresenter;
- (PBUIWallpaperLegibilityProviding)wallpaperLegibilityProvider;
- (double)zoomScale;
- (int64_t)effectiveStyle;
- (unint64_t)transformOptions;
- (void)_updateBackgroundColor;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)setFullscreen:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setShouldMatchWallpaperPosition:(BOOL)a3;
- (void)setTransformOptions:(unint64_t)a3;
@end

@implementation PBUIAccessibilityTintView

- (PBUIAccessibilityTintView)initWithVariant:(int64_t)a3 wallpaperViewController:(id)a4
{
  return [(PBUIAccessibilityTintView *)self initWithVariant:a3 wallpaperPresenter:a4 wallpaperLegibilityProvider:a4];
}

- (PBUIAccessibilityTintView)initWithVariant:(int64_t)a3 wallpaperPresenter:(id)a4 wallpaperLegibilityProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PBUIAccessibilityTintView;
  v10 = -[PBUIAccessibilityTintView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v11 = v10;
  if (v10)
  {
    [(PBUIAccessibilityTintView *)v10 setAutoresizingMask:18];
    v11->_variant = a3;
    objc_storeWeak((id *)&v11->_wallpaperPresenter, v8);
    objc_storeWeak((id *)&v11->_wallpaperLegibilityProvider, v9);
    v11->_shouldMatchWallpaperPosition = 1;
    [v8 addObserver:v11 forVariant:v11->_variant];
    [(PBUIAccessibilityTintView *)v11 _updateBackgroundColor];
  }

  return v11;
}

- (void)dealloc
{
  v3 = [(PBUIAccessibilityTintView *)self wallpaperPresenter];
  [v3 removeObserver:self forVariant:self->_variant];

  v4.receiver = self;
  v4.super_class = (Class)PBUIAccessibilityTintView;
  [(PBUIAccessibilityTintView *)&v4 dealloc];
}

- (int64_t)effectiveStyle
{
  return 3;
}

- (double)zoomScale
{
  return 1.0;
}

- (void)didMoveToWindow
{
  id v3 = [(PBUIAccessibilityTintView *)self superview];
  [v3 bounds];
  -[PBUIAccessibilityTintView setFrame:](self, "setFrame:");
}

- (void)didMoveToSuperview
{
  id v3 = [(PBUIAccessibilityTintView *)self superview];
  [v3 bounds];
  -[PBUIAccessibilityTintView setFrame:](self, "setFrame:");
}

- (void)setFullscreen:(BOOL)a3
{
}

- (BOOL)isFullscreen
{
  return ![(PBUIAccessibilityTintView *)self shouldMatchWallpaperPosition];
}

- (void)_updateBackgroundColor
{
  id v4 = [(PBUIAccessibilityTintView *)self wallpaperLegibilityProvider];
  id v3 = [v4 averageColorForVariant:self->_variant];
  [(PBUIAccessibilityTintView *)self setBackgroundColor:v3];
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  self->_shouldMatchWallpaperPosition = a3;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (void)setTransformOptions:(unint64_t)a3
{
  self->_transformOptions = a3;
}

- (PBUIFakeBlurObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PBUIFakeBlurObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (PBUILegacyWallpaperPresenting)wallpaperPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresenter);
  return (PBUILegacyWallpaperPresenting *)WeakRetained;
}

- (PBUIWallpaperLegibilityProviding)wallpaperLegibilityProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperLegibilityProvider);
  return (PBUIWallpaperLegibilityProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperLegibilityProvider);
  objc_destroyWeak((id *)&self->_wallpaperPresenter);
  objc_destroyWeak((id *)&self->_observer);
}

@end