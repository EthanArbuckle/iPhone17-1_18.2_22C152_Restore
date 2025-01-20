@interface PBUIScrollableStaticWallpaperView
+ (BOOL)_canCacheImages;
+ (BOOL)_canDownscaleSampleImage;
+ (BOOL)_shouldScaleForParallax;
- (BOOL)automaticallyEnablesParallax;
- (BOOL)supportsCropping;
- (CGPoint)_boundedContentOffsetForOverhang;
- (CGPoint)_maximumContentOffsetForOverhang;
- (CGPoint)_minimumContentOffsetForOverhang;
- (CGRect)_cropRect;
- (CGRect)cropRect;
- (CGSize)_imageSize;
- (PBUIScrollableStaticWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8;
- (double)_parallaxFactorWithZoomScale:(double)a3 contentOffset:(CGPoint)a4;
- (double)_scrollViewParallaxFactor;
- (double)_throttleDuration;
- (double)cropZoomScale;
- (id)_newImageView;
- (id)_scrollView;
- (id)_wallpaperImageForAnalysis;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)_cancelThrottle;
- (void)_resetColorBoxes;
- (void)_scrollViewDidUpdate;
- (void)_setupContentViewWithOptions:(unint64_t)a3;
- (void)_setupScrollView;
- (void)_updateParallaxForScroll;
- (void)_updateScrollViewZoomScales;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)setAutomaticallyEnablesParallax:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setCropRect:(CGRect)a3 zoomScale:(double)a4;
- (void)setParallaxEnabled:(BOOL)a3;
@end

@implementation PBUIScrollableStaticWallpaperView

- (PBUIScrollableStaticWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  v17.receiver = self;
  v17.super_class = (Class)PBUIScrollableStaticWallpaperView;
  v8 = -[PBUIStaticWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v17, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, a4, a5, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v8)
  {
    v9 = +[PBUIWallpaperDomain rootSettings];
    uint64_t v10 = [v9 lockScreenParallaxSettings];
    parallaxSettings = v8->_parallaxSettings;
    v8->_parallaxSettings = (PBUIWallpaperParallaxSettings *)v10;

    v8->_automaticallyEnablesParallax = 1;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.PaperBoardSevices.ScrollableStaticWallpaperView", 0);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    throttleCanUpdateFlag = v8->_throttleCanUpdateFlag;
    v8->_throttleCanUpdateFlag = (BSAtomicFlag *)v14;

    [(PBUIScrollableStaticWallpaperView *)v8 setOpaque:1];
  }
  return v8;
}

- (void)dealloc
{
  [(PBUIScrollableStaticWallpaperView *)self _cancelThrottle];
  [(UIScrollView *)self->_scrollView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PBUIScrollableStaticWallpaperView;
  [(PBUIWallpaperView *)&v3 dealloc];
}

+ (BOOL)_shouldScaleForParallax
{
  return 0;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PBUIWallpaperView *)self parallaxEnabled] && v3)
  {
    [(UIScrollView *)self->_scrollView zoomScale];
    double minimumZoomScale = v5;
    [(UIScrollView *)self->_scrollView zoomScale];
    if (v7 < self->_minimumZoomScaleForParallax)
    {
      -[UIScrollView setZoomScale:animated:](self->_scrollView, "setZoomScale:animated:", 1);
      double minimumZoomScale = self->_minimumZoomScale;
    }
    [(PBUIScrollableStaticWallpaperView *)self _boundedContentOffsetForOverhang];
    double v9 = v8;
    double v11 = v10;
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1);
    -[PBUIScrollableStaticWallpaperView _parallaxFactorWithZoomScale:contentOffset:](self, "_parallaxFactorWithZoomScale:contentOffset:", minimumZoomScale, v9, v11);
    -[PBUIWallpaperView setParallaxFactor:](self, "setParallaxFactor:");
  }
  v12.receiver = self;
  v12.super_class = (Class)PBUIScrollableStaticWallpaperView;
  [(PBUIWallpaperView *)&v12 setParallaxEnabled:v3];
}

- (double)_scrollViewParallaxFactor
{
  scrollView = self->_scrollView;
  if (!scrollView) {
    return 1.0;
  }
  [(UIScrollView *)scrollView zoomScale];
  double v5 = v4;
  [(UIScrollView *)self->_scrollView contentOffset];
  -[PBUIScrollableStaticWallpaperView _parallaxFactorWithZoomScale:contentOffset:](self, "_parallaxFactorWithZoomScale:contentOffset:", v5, v6, v7);
  return result;
}

- (double)_parallaxFactorWithZoomScale:(double)a3 contentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  double v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_INFO, "//////////_parallaxFactorWithZoomScale//////////", buf, 2u);
  }

  double v9 = PBUILogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v44 = a3;
    _os_log_impl(&dword_1BC4B3000, v9, OS_LOG_TYPE_INFO, "zoomScale %g", buf, 0xCu);
  }

  double v10 = PBUILogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    double minimumZoomScale = self->_minimumZoomScale;
    *(_DWORD *)buf = 134217984;
    double v44 = minimumZoomScale;
    _os_log_impl(&dword_1BC4B3000, v10, OS_LOG_TYPE_INFO, "minimumZoomScale %g", buf, 0xCu);
  }

  objc_super v12 = PBUILogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    minimumZoomScaleForParalladouble x = self->_minimumZoomScaleForParallax;
    *(_DWORD *)buf = 134217984;
    double v44 = minimumZoomScaleForParallax;
    _os_log_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_INFO, "minimumZoomScaleForParallax %g", buf, 0xCu);
  }

  double v14 = fmin(fmax((a3 - self->_minimumZoomScale) / (self->_minimumZoomScaleForParallax - self->_minimumZoomScale), 0.0), 1.0);
  v15 = PBUILogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v44 = v14;
    _os_log_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_INFO, "zoomFactor %g", buf, 0xCu);
  }
  double v42 = v14;

  [(PBUIScrollableStaticWallpaperView *)self _minimumContentOffsetForOverhang];
  double v17 = v16;
  double v19 = v18;
  v20 = PBUILogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v46.double x = v17;
    v46.double y = v19;
    NSStringFromCGPoint(v46);
    double v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    double v44 = v21;
    _os_log_impl(&dword_1BC4B3000, v20, OS_LOG_TYPE_INFO, "minOffset %{public}@", buf, 0xCu);
  }
  [(PBUIScrollableStaticWallpaperView *)self _maximumContentOffsetForOverhang];
  double v23 = v22;
  double v25 = v24;
  v26 = PBUILogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v47.double x = v23;
    v47.double y = v25;
    NSStringFromCGPoint(v47);
    double v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    double v44 = v27;
    _os_log_impl(&dword_1BC4B3000, v26, OS_LOG_TYPE_INFO, "maxOffset %{public}@", buf, 0xCu);
  }
  v28 = PBUILogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v44 = x / v17;
    _os_log_impl(&dword_1BC4B3000, v28, OS_LOG_TYPE_INFO, "minOffsetXFactor %g", buf, 0xCu);
  }

  double v29 = y;
  double v30 = y / v19;
  v31 = PBUILogCommon();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v44 = v30;
    _os_log_impl(&dword_1BC4B3000, v31, OS_LOG_TYPE_INFO, "minOffsetYFactor %g", buf, 0xCu);
  }

  if (x / v17 >= v30) {
    double v32 = v30;
  }
  else {
    double v32 = x / v17;
  }
  double v33 = fmin(fmax(v32, 0.0), 1.0);
  v34 = PBUILogCommon();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v44 = v33;
    _os_log_impl(&dword_1BC4B3000, v34, OS_LOG_TYPE_INFO, "minOffsetFactor %g", buf, 0xCu);
  }

  double v35 = (v17 + v23 - x) / v17;
  if (v35 >= (v19 + v25 - v29) / v19) {
    double v35 = (v19 + v25 - v29) / v19;
  }
  double v36 = fmin(fmax(v35, 0.0), 1.0);
  v37 = PBUILogCommon();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v44 = v36;
    _os_log_impl(&dword_1BC4B3000, v37, OS_LOG_TYPE_INFO, "maxOffsetFactor %g", buf, 0xCu);
  }

  double v38 = v42;
  if (v42 > v33) {
    double v38 = v33;
  }
  if (v38 <= v36) {
    double v36 = v38;
  }
  v39 = PBUILogCommon();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v44 = v36;
    _os_log_impl(&dword_1BC4B3000, v39, OS_LOG_TYPE_INFO, "result: %g", buf, 0xCu);
  }

  v40 = PBUILogCommon();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v40, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
  }

  return v36;
}

+ (BOOL)_canCacheImages
{
  return 0;
}

+ (BOOL)_canDownscaleSampleImage
{
  return 0;
}

- (void)_resetColorBoxes
{
  id v3 = [(PBUIStaticWallpaperView *)self _createColorBoxes];
  [(PBUIStaticWallpaperView *)self setColorBoxes:v3];
}

- (void)setContentView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIScrollableStaticWallpaperView;
  [(PBUIWallpaperView *)&v4 setContentView:a3];
  [(PBUIScrollableStaticWallpaperView *)self _resetColorBoxes];
}

- (void)_setupContentViewWithOptions:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v13 bounds];
  double v8 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42DB0]), "initWithFrame:", v4, v5, v6, v7);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  double v10 = self->_scrollView;
  [(PBUIScrollableStaticWallpaperView *)self frame];
  UIRectGetCenter();
  -[UIScrollView setCenter:](v10, "setCenter:");
  [(UIScrollView *)self->_scrollView setClipsToBounds:0];
  [(UIScrollView *)self->_scrollView setScrollsToTop:0];
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  [(UIScrollView *)self->_scrollView _setSupportsPointerDragScrolling:1];
  double v11 = [(PBUIScrollableStaticWallpaperView *)self _newImageView];
  imageView = self->_imageView;
  self->_imageView = v11;

  [(UIScrollView *)self->_scrollView addSubview:self->_imageView];
  [(PBUIScrollableStaticWallpaperView *)self _setupScrollView];
  [(PBUIScrollableStaticWallpaperView *)self setContentView:self->_scrollView];
}

- (id)_newImageView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  double v4 = [(PBUIStaticWallpaperView *)self wallpaperImage];
  double v5 = (void *)[v3 initWithImage:v4];

  return v5;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)didMoveToWindow
{
  id v3 = [(PBUIScrollableStaticWallpaperView *)self window];

  if (v3)
  {
    [(PBUIScrollableStaticWallpaperView *)self _scrollViewDidUpdate];
  }
}

- (CGSize)_imageSize
{
  [(PBUIScrollableStaticWallpaperView *)self _cropRect];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)_wallpaperImageForAnalysis
{
  [(UIScrollView *)self->_scrollView zoomScale];
  CGFloat v4 = v3;
  double v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 scale];
  CGFloat v7 = v6;

  [(PBUIScrollableStaticWallpaperView *)self _cropRect];
  double x = v18.origin.x;
  double y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  if (CGRectEqualToRect(v18, *MEMORY[0x1E4F1DB28]))
  {
    objc_super v12 = 0;
  }
  else
  {
    v17.CGFloat width = width;
    v17.CGFloat height = height;
    UIGraphicsBeginImageContextWithOptions(v17, 1, v7);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, v4, v4);
    double v14 = [(PBUIStaticWallpaperView *)self wallpaperImage];
    objc_msgSend(v14, "drawAtPoint:", -x / v4, -y / v4);

    objc_super v12 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return v12;
}

- (void)_cancelThrottle
{
  throttleTimer = self->_throttleTimer;
  if (throttleTimer)
  {
    dispatch_source_cancel(throttleTimer);
    CGFloat v4 = self->_throttleTimer;
    self->_throttleTimer = 0;
  }
  throttleCanUpdateFlag = self->_throttleCanUpdateFlag;
  [(BSAtomicFlag *)throttleCanUpdateFlag setFlag:0];
}

- (void)_scrollViewDidUpdate
{
  if ([(BSAtomicFlag *)self->_throttleCanUpdateFlag setFlag:1])
  {
    if (!self->_throttleTimer)
    {
      [(PBUIScrollableStaticWallpaperView *)self _throttleDuration];
      double v4 = v3;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke;
      handler[3] = &unk_1E62B2798;
      handler[4] = self;
      double v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      if (v5)
      {
        dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
        dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        dispatch_source_set_event_handler(v5, handler);
        dispatch_resume(v5);
      }
      throttleTimer = self->_throttleTimer;
      self->_throttleTimer = (OS_dispatch_source *)v5;
    }
    [(PBUIScrollableStaticWallpaperView *)self _updateParallaxForScroll];
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_2;
    block[3] = &unk_1E62B39F0;
    objc_copyWeak(&v10, &location);
    dispatch_async(workQueue, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelThrottle];
}

void __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained _createColorBoxes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_3;
  v5[3] = &unk_1E62B4030;
  objc_copyWeak(&v7, v1);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setColorBoxes:*(void *)(a1 + 32)];
  double v2 = [WeakRetained _computeAverageColor];
  [WeakRetained updateLegibilitySettingsForAverageColor:v2];
}

- (void)_updateParallaxForScroll
{
  [(PBUIScrollableStaticWallpaperView *)self _scrollViewParallaxFactor];
  double v4 = v3;
  BOOL v5 = [(PBUIWallpaperView *)self parallaxEnabled];
  if (v4 >= 0.75 || !v5)
  {
    BOOL v7 = v5;
    v11.receiver = self;
    v11.super_class = (Class)PBUIScrollableStaticWallpaperView;
    [(PBUIWallpaperView *)&v11 parallaxFactor];
    if (v4 >= 0.75 && vabdd_f64(v4, v8) > 0.1)
    {
      [(PBUIWallpaperView *)self setParallaxFactor:v4];
      char v9 = !self->_automaticallyEnablesParallax || v7;
      if (v9)
      {
        [(PBUIWallpaperView *)self _applyParallaxSettings];
      }
      else
      {
        v10.receiver = self;
        v10.super_class = (Class)PBUIScrollableStaticWallpaperView;
        [(PBUIWallpaperView *)&v10 setParallaxEnabled:1];
        self->_automaticallyEnablesParalladouble x = 0;
      }
    }
  }
  else
  {
    [(PBUIScrollableStaticWallpaperView *)self setParallaxEnabled:0];
    self->_automaticallyEnablesParalladouble x = 1;
  }
}

- (double)_throttleDuration
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 _graphicsQuality] == 100) {
    double v3 = 0.2;
  }
  else {
    double v3 = 1.0;
  }

  return v3;
}

- (void)_updateScrollViewZoomScales
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v3 = PBUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_INFO, "//////////_updateScrollViewZoomScales//////////", buf, 2u);
  }

  v28.receiver = self;
  v28.super_class = (Class)PBUIScrollableStaticWallpaperView;
  double v4 = [(PBUIStaticWallpaperView *)&v28 wallpaperImage];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  char v9 = PBUILogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v32.CGFloat width = v6;
    v32.CGFloat height = v8;
    objc_super v10 = NSStringFromCGSize(v32);
    *(_DWORD *)buf = 138543362;
    double v30 = *(double *)&v10;
    _os_log_impl(&dword_1BC4B3000, v9, OS_LOG_TYPE_INFO, "imageSize: %{public}@", buf, 0xCu);
  }
  [(UIScrollView *)self->_scrollView bounds];
  double v13 = v12 / v6;
  if (v12 / v6 < v11 / v8) {
    double v13 = v11 / v8;
  }
  self->_double minimumZoomScale = v13;
  -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:");
  [(UIScrollView *)self->_scrollView setMaximumZoomScale:fmax(self->_minimumZoomScale + self->_minimumZoomScale, 5.0)];
  +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForCurrentDevice];
  double v15 = v14;
  double v17 = v16;
  CGRect v18 = PBUILogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v33.CGFloat width = v15;
    v33.CGFloat height = v17;
    double v19 = NSStringFromCGSize(v33);
    *(_DWORD *)buf = 138543362;
    double v30 = *(double *)&v19;
    _os_log_impl(&dword_1BC4B3000, v18, OS_LOG_TYPE_INFO, "parallaxSize: %{public}@", buf, 0xCu);
  }
  double v20 = v15 / v6;
  double v21 = PBUILogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v30 = v20;
    _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_INFO, "scaleX: %g", buf, 0xCu);
  }

  double v22 = v17 / v8;
  double v23 = PBUILogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v30 = v22;
    _os_log_impl(&dword_1BC4B3000, v23, OS_LOG_TYPE_INFO, "scaleY: %g", buf, 0xCu);
  }

  if (v20 >= v22) {
    double v24 = v20;
  }
  else {
    double v24 = v22;
  }
  self->_minimumZoomScaleForParalladouble x = v24;
  double v25 = PBUILogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    minimumZoomScaleForParalladouble x = self->_minimumZoomScaleForParallax;
    *(_DWORD *)buf = 134217984;
    double v30 = minimumZoomScaleForParallax;
    _os_log_impl(&dword_1BC4B3000, v25, OS_LOG_TYPE_INFO, "minimumZoomScaleForParallax: %g", buf, 0xCu);
  }

  double v27 = PBUILogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v27, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
  }
}

- (void)_setupScrollView
{
  v11.receiver = self;
  v11.super_class = (Class)PBUIScrollableStaticWallpaperView;
  double v3 = [(PBUIStaticWallpaperView *)&v11 wallpaperImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v7);
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(PBUIScrollableStaticWallpaperView *)self _updateScrollViewZoomScales];
  [(UIScrollView *)self->_scrollView setZoomScale:self->_minimumZoomScaleForParallax];
  [(UIScrollView *)self->_scrollView contentSize];
  double v9 = v8;
  [(UIScrollView *)self->_scrollView bounds];
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", (v9 - v10) * 0.5, 0.0);
  [(PBUIScrollableStaticWallpaperView *)self _boundedContentOffsetForOverhang];
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0);
  [(UIScrollView *)self->_scrollView setBounces:1];
  [(UIScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setScrollEnabled:1];
}

- (CGPoint)_boundedContentOffsetForOverhang
{
  [(UIScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(PBUIScrollableStaticWallpaperView *)self _minimumContentOffsetForOverhang];
  double v8 = v7;
  double v10 = v9;
  [(PBUIScrollableStaticWallpaperView *)self _maximumContentOffsetForOverhang];
  if (v8 >= v4) {
    double v13 = v8;
  }
  else {
    double v13 = v4;
  }
  if (v11 > v13) {
    double v11 = v13;
  }
  if (v10 >= v6) {
    double v14 = v10;
  }
  else {
    double v14 = v6;
  }
  if (v12 > v14) {
    double v12 = v14;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)_minimumContentOffsetForOverhang
{
  +[PBUIWallpaperParallaxSettings overhangSizeForCurrentDevice];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)_maximumContentOffsetForOverhang
{
  +[PBUIWallpaperParallaxSettings overhangSizeForCurrentDevice];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_scrollView contentSize];
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self->_scrollView bounds];
  double v12 = v8 - v11 - v4;
  double v14 = v10 - v13 - v6;
  result.double y = v14;
  result.double x = v12;
  return result;
}

- (CGRect)_cropRect
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  double v3 = PBUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_INFO, "//////////_cropRect//////////", buf, 2u);
  }

  [(UIScrollView *)self->_scrollView bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = PBUILogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v64.origin.double x = v5;
    v64.origin.double y = v7;
    v64.size.CGFloat width = v9;
    v64.size.CGFloat height = v11;
    double v13 = NSStringFromCGRect(v64);
    *(_DWORD *)buf = 138543362;
    double v60 = *(double *)&v13;
    _os_log_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_INFO, "zoomedRect: %{public}@", buf, 0xCu);
  }
  [(UIScrollView *)self->_scrollView zoomScale];
  double v15 = v14;
  double v16 = PBUILogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v60 = v15;
    _os_log_impl(&dword_1BC4B3000, v16, OS_LOG_TYPE_INFO, "zoomScale: %g", buf, 0xCu);
  }

  v58.receiver = self;
  v58.super_class = (Class)PBUIScrollableStaticWallpaperView;
  double v17 = [(PBUIStaticWallpaperView *)&v58 wallpaperImage];
  CGRect v18 = v17;
  if (v15 == 0.0 || v17 == 0)
  {
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [v17 size];
    double v25 = v15 * v24;
    double v27 = v15 * v26;
    objc_super v28 = PBUILogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v62.CGFloat width = v25;
      v62.CGFloat height = v27;
      double v30 = NSStringFromCGSize(v62);
      *(_DWORD *)buf = 138543362;
      double v60 = *(double *)&v30;
      _os_log_impl(&dword_1BC4B3000, v28, OS_LOG_TYPE_INFO, "scaledImageSize: %{public}@", buf, 0xCu);
    }
    double v56 = v27;

    double v31 = 0.0;
    if ([(PBUIWallpaperView *)self parallaxEnabled])
    {
      [(PBUIScrollableStaticWallpaperView *)self parallaxFactor];
      double v31 = v32;
    }
    +[PBUIWallpaperParallaxSettings bestWallpaperSizeForParallaxFactor:v31];
    double v34 = v33;
    double v36 = v35;
    v37 = PBUILogCommon();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v60 = v31;
      _os_log_impl(&dword_1BC4B3000, v37, OS_LOG_TYPE_INFO, "parallaxFactor: %g", buf, 0xCu);
    }

    double v38 = PBUILogCommon();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v63.CGFloat width = v34;
      v63.CGFloat height = v36;
      v39 = NSStringFromCGSize(v63);
      *(_DWORD *)buf = 138543362;
      double v60 = *(double *)&v39;
      _os_log_impl(&dword_1BC4B3000, v38, OS_LOG_TYPE_INFO, "bestSize: %{public}@", buf, 0xCu);
    }
    double v40 = (v34 - v9) * 0.5;
    double v41 = (v36 - v11) * 0.5;
    if (v40 >= v5) {
      double v40 = v5;
    }
    if (v40 >= v25 - (v5 + v9)) {
      double v40 = v25 - (v5 + v9);
    }
    if (v41 >= v7) {
      double v41 = v7;
    }
    if (v41 >= v56 - (v7 + v11)) {
      double v41 = v56 - (v7 + v11);
    }
    if (v40 >= 0.0) {
      double v42 = v40;
    }
    else {
      double v42 = 0.0;
    }
    if (v41 >= 0.0) {
      double v43 = v41;
    }
    else {
      double v43 = 0.0;
    }
    double v44 = PBUILogCommon();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v60 = v42;
      _os_log_impl(&dword_1BC4B3000, v44, OS_LOG_TYPE_INFO, "extraX: %g", buf, 0xCu);
    }

    uint64_t v45 = PBUILogCommon();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v60 = v43;
      _os_log_impl(&dword_1BC4B3000, v45, OS_LOG_TYPE_INFO, "extraY: %g", buf, 0xCu);
    }

    [(PBUIWallpaperView *)self contentScaleFactor];
    CGAffineTransformMakeScale(&v57, 1.0 / v46, 1.0 / v46);
    v65.origin.double x = v5 - v42;
    v65.origin.double y = v7 - v43;
    v65.size.CGFloat width = v9 + v42 * 2.0;
    v65.size.CGFloat height = v11 + v43 * 2.0;
    CGRectApplyAffineTransform(v65, &v57);
    CGPoint v47 = PBUILogCommon();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC4B3000, v47, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
    }

    UIRectCenteredIntegralRect();
    double v20 = v48;
    double v21 = v49;
    double v22 = v50;
    double v23 = v51;
  }

  double v52 = v20;
  double v53 = v21;
  double v54 = v22;
  double v55 = v23;
  result.size.CGFloat height = v55;
  result.size.CGFloat width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (CGRect)cropRect
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v3 = PBUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_INFO, "//////////cropRect//////////", (uint8_t *)&v29, 2u);
  }

  [(PBUIScrollableStaticWallpaperView *)self _cropRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = PBUILogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v32.origin.double x = v5;
    v32.origin.double y = v7;
    v32.size.CGFloat width = v9;
    v32.size.CGFloat height = v11;
    double v13 = NSStringFromCGRect(v32);
    int v29 = 138543362;
    double v30 = v13;
    _os_log_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_INFO, "pre crop rect: %{public}@", (uint8_t *)&v29, 0xCu);
  }
  -[UIScrollView convertRect:toView:](self->_scrollView, "convertRect:toView:", self->_imageView, v5, v7, v9, v11);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  double v22 = PBUILogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v33.origin.double x = v15;
    v33.origin.double y = v17;
    v33.size.CGFloat width = v19;
    v33.size.CGFloat height = v21;
    double v23 = NSStringFromCGRect(v33);
    int v29 = 138543362;
    double v30 = v23;
    _os_log_impl(&dword_1BC4B3000, v22, OS_LOG_TYPE_INFO, "result crop rect: %{public}@", (uint8_t *)&v29, 0xCu);
  }
  double v24 = PBUILogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1BC4B3000, v24, OS_LOG_TYPE_INFO, "/////////////////////////", (uint8_t *)&v29, 2u);
  }

  double v25 = v15;
  double v26 = v17;
  double v27 = v19;
  double v28 = v21;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (BOOL)supportsCropping
{
  return 1;
}

- (double)cropZoomScale
{
  [(UIScrollView *)self->_scrollView zoomScale];
  double v4 = v3;
  [(PBUIWallpaperView *)self contentScaleFactor];
  return v4 * v5;
}

- (void)setCropRect:(CGRect)a3 zoomScale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    [(PBUIWallpaperView *)self contentScaleFactor];
    CGFloat v11 = v10;
    [(UIScrollView *)self->_scrollView setZoomScale:a4 / v10];
    -[UIScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", self->_imageView, x, y, width, height);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGAffineTransformMakeScale(&v30, v11, v11);
    v31.origin.double x = v13;
    v31.origin.double y = v15;
    v31.size.double width = v17;
    v31.size.double height = v19;
    CGRectApplyAffineTransform(v31, &v30);
    UIRectCenteredIntegralRect();
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [(UIScrollView *)self->_scrollView bounds];
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v21 + (v25 - v28) * 0.5, v23 + (v27 - v29) * 0.5);
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIScrollableStaticWallpaperView;
  [(PBUIWallpaperView *)&v5 layoutSubviews];
  scrollView = self->_scrollView;
  double v4 = [(UIScrollView *)scrollView superview];
  [v4 bounds];
  UIRectGetCenter();
  -[UIScrollView setCenter:](scrollView, "setCenter:");
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_imageView;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(PBUIScrollableStaticWallpaperView *)self _scrollViewDidUpdate];
  }
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  if ([(PBUIWallpaperView *)self parallaxEnabled])
  {
    [(PBUIScrollableStaticWallpaperView *)self _boundedContentOffsetForOverhang];
    scrollView = self->_scrollView;
    -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 1);
  }
}

- (BOOL)automaticallyEnablesParallax
{
  return self->_automaticallyEnablesParallax;
}

- (void)setAutomaticallyEnablesParallax:(BOOL)a3
{
  self->_automaticallyEnablesParalladouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleCanUpdateFlag, 0);
  objc_storeStrong((id *)&self->_throttleTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end