@interface VideosExtrasSlideshowViewController
- (BOOL)isAnimatingTransition;
- (BOOL)isViewVisible;
- (NSTimer)transitionTimer;
- (UIImage)nextImage;
- (VideosExtrasConstrainedArtworkContainerView)disappearingImageContainerView;
- (VideosExtrasConstrainedArtworkContainerView)imageContainerView;
- (VideosExtrasSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VideosExtrasSlideshowViewControllerDataSource)dataSource;
- (double)transitionInterval;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)_numberOfImages;
- (unint64_t)transitionStyle;
- (unint64_t)visibleImageIndex;
- (void)_invalidateTransitionTimer;
- (void)_loadImageContainerViewIfAppropriateWithImage:(id)a3;
- (void)_performDissolveTransition;
- (void)_performInstantaneousTransition;
- (void)_performPushTransition;
- (void)_performWipeTransition;
- (void)_prepareNextImageAndScheduleTransitionTimerIfAppropriate;
- (void)_reload;
- (void)_scheduleTransitionTimer;
- (void)_transitionDidComplete;
- (void)_transitionTimerDidFire:(id)a3;
- (void)_transitionToNextImageIfAppropriate;
- (void)dealloc;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setAnimatingTransition:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDisappearingImageContainerView:(id)a3;
- (void)setImageContainerView:(id)a3;
- (void)setNextImage:(id)a3;
- (void)setTransitionInterval:(double)a3;
- (void)setTransitionStyle:(unint64_t)a3;
- (void)setTransitionTimer:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)setVisibleImageIndex:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VideosExtrasSlideshowViewController

- (VideosExtrasSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasSlideshowViewController;
  result = [(VideosExtrasSlideshowViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_visibleImageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  [(VideosExtrasSlideshowViewController *)self _invalidateTransitionTimer];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasSlideshowViewController;
  [(VideosExtrasSlideshowViewController *)&v3 dealloc];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasSlideshowViewController;
  [(VideosExtrasSlideshowViewController *)&v4 viewDidAppear:a3];
  [(VideosExtrasSlideshowViewController *)self setViewVisible:1];
  [(VideosExtrasSlideshowViewController *)self _prepareNextImageAndScheduleTransitionTimerIfAppropriate];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasSlideshowViewController;
  [(VideosExtrasSlideshowViewController *)&v4 viewDidDisappear:a3];
  [(VideosExtrasSlideshowViewController *)self setViewVisible:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasSlideshowViewController;
  [(VideosExtrasSlideshowViewController *)&v3 viewDidLoad];
  [(VideosExtrasSlideshowViewController *)self _loadImageContainerViewIfAppropriateWithImage:0];
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
  objc_super v5 = [v4 artworkView];

  if ([v8 appearState] == 1)
  {
    v6 = [v8 zoomingImageView];
    [v6 replicateStateFromImageView:v5];
  }
  v7 = [(VideosExtrasSlideshowViewController *)self view];
  [v7 setHidden:1];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v7 = a3;
  if (![v7 appearState])
  {
    objc_super v4 = [v7 zoomingImageView];
    objc_super v5 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
    v6 = [v5 artworkView];
    [v4 replicateStateFromImageView:v6];
  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  id v4 = [(VideosExtrasSlideshowViewController *)self view];
  [v4 setHidden:0];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(VideosExtrasSlideshowViewController *)self _reload];
    objc_super v5 = obj;
  }
}

- (void)setVisibleImageIndex:(unint64_t)a3
{
  if (self->_visibleImageIndex != a3)
  {
    self->_visibleImageIndex = a3;
    [(VideosExtrasSlideshowViewController *)self _reload];
  }
}

- (double)transitionInterval
{
  double result = self->_transitionInterval;
  if (result < 2.22044605e-16) {
    return 3.0;
  }
  return result;
}

- (void)_invalidateTransitionTimer
{
  objc_super v3 = [(VideosExtrasSlideshowViewController *)self transitionTimer];
  [v3 invalidate];

  [(VideosExtrasSlideshowViewController *)self setTransitionTimer:0];
}

- (void)_scheduleTransitionTimer
{
  [(VideosExtrasSlideshowViewController *)self _invalidateTransitionTimer];
  objc_super v3 = (void *)MEMORY[0x1E4F1CB00];
  [(VideosExtrasSlideshowViewController *)self transitionInterval];
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__transitionTimerDidFire_, 0, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(VideosExtrasSlideshowViewController *)self setTransitionTimer:v4];
}

- (void)_transitionTimerDidFire:(id)a3
{
  [(VideosExtrasSlideshowViewController *)self _invalidateTransitionTimer];
  [(VideosExtrasSlideshowViewController *)self _transitionToNextImageIfAppropriate];
}

- (void)_performDissolveTransition
{
  id v19 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
  [(VideosExtrasSlideshowViewController *)self setDisappearingImageContainerView:v19];
  objc_super v3 = [(VideosExtrasSlideshowViewController *)self nextImage];
  [(VideosExtrasSlideshowViewController *)self _loadImageContainerViewIfAppropriateWithImage:v3];

  id v4 = [(VideosExtrasSlideshowViewController *)self view];
  [v4 bringSubviewToFront:v19];

  objc_super v5 = [v19 layer];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  id v15 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  [v5 setMask:v14];
  v16 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"backgroundColor"];
  id v17 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v16, "setFromValue:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(v16, "setToValue:", objc_msgSend(v14, "backgroundColor"));
  [v16 setDuration:0.5];
  v18 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v16 setTimingFunction:v18];

  [v16 setDelegate:self];
  [v14 addAnimation:v16 forKey:@"dissolve"];
}

- (void)_performInstantaneousTransition
{
  objc_super v3 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
  [(VideosExtrasSlideshowViewController *)self setDisappearingImageContainerView:v3];

  id v4 = [(VideosExtrasSlideshowViewController *)self nextImage];
  [(VideosExtrasSlideshowViewController *)self _loadImageContainerViewIfAppropriateWithImage:v4];

  [(VideosExtrasSlideshowViewController *)self _transitionDidComplete];
}

- (void)_performPushTransition
{
  objc_super v3 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
  [(VideosExtrasSlideshowViewController *)self setDisappearingImageContainerView:v3];
  id v4 = [(VideosExtrasSlideshowViewController *)self nextImage];
  [(VideosExtrasSlideshowViewController *)self _loadImageContainerViewIfAppropriateWithImage:v4];

  objc_super v5 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
  double v6 = [(VideosExtrasSlideshowViewController *)self view];
  [v6 bounds];
  double Width = CGRectGetWidth(v26);

  double v8 = Width + 60.0;
  [v5 center];
  uint64_t v10 = v9;
  double v12 = v8 + v11;
  [v5 setCenter:v8 + v11];
  [v3 center];
  double v13 = (void *)MEMORY[0x1E4FB1EB0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke;
  v19[3] = &unk_1E6DF6588;
  double v22 = v12 - v8;
  uint64_t v23 = v10;
  id v20 = v5;
  id v21 = v3;
  double v24 = v14 - v8;
  uint64_t v25 = v15;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke_2;
  v18[3] = &unk_1E6DF5B20;
  v18[4] = self;
  id v16 = v3;
  id v17 = v5;
  [v13 animateWithDuration:v19 animations:v18 completion:0.5];
}

uint64_t __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);
  return objc_msgSend(v2, "setCenter:", v3, v4);
}

uint64_t __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionDidComplete];
}

- (void)_performWipeTransition
{
  v28[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
  [(VideosExtrasSlideshowViewController *)self setDisappearingImageContainerView:v3];
  double v4 = [(VideosExtrasSlideshowViewController *)self nextImage];
  [(VideosExtrasSlideshowViewController *)self _loadImageContainerViewIfAppropriateWithImage:v4];

  objc_super v5 = [(VideosExtrasSlideshowViewController *)self view];
  [v5 bringSubviewToFront:v3];

  double v6 = [v3 layer];
  [v6 bounds];
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  double v11 = 20.0 / CGRectGetWidth(v29);
  double v12 = v11 + 1.0;
  double v13 = -v11;
  id v14 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
  id v15 = [MEMORY[0x1E4FB1618] clearColor];
  v28[0] = [v15 CGColor];
  id v16 = [MEMORY[0x1E4FB1618] blackColor];
  v28[1] = [v16 CGColor];
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v14 setColors:v17];

  objc_msgSend(v14, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v14, "setEndPoint:", v13, 0.5);
  objc_msgSend(v14, "setFrame:", x, y, width, height);
  [v6 setMask:v14];
  v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"startPoint"];
  id v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v12, 0.5);
  [v18 setFromValue:v19];

  id v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.5);
  [v18 setToValue:v20];

  id v21 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"endPoint"];
  double v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.5);
  [v21 setFromValue:v22];

  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v13, 0.5);
  [v21 setToValue:v23];

  id v24 = objc_alloc_init(MEMORY[0x1E4F39B38]);
  v27[0] = v18;
  v27[1] = v21;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  [v24 setAnimations:v25];

  [v24 setDuration:0.5];
  CGRect v26 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v24 setTimingFunction:v26];

  [v24 setDelegate:self];
  [v14 addAnimation:v24 forKey:@"wipe"];
}

- (void)_transitionDidComplete
{
  double v3 = [(VideosExtrasSlideshowViewController *)self disappearingImageContainerView];
  [v3 removeFromSuperview];

  [(VideosExtrasSlideshowViewController *)self setDisappearingImageContainerView:0];
  [(VideosExtrasSlideshowViewController *)self setAnimatingTransition:0];
}

- (void)_loadImageContainerViewIfAppropriateWithImage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VideosExtrasSlideshowViewController *)self visibleImageIndex];
  unint64_t v6 = [(VideosExtrasSlideshowViewController *)self _numberOfImages];
  if (v4 || v5 < v6)
  {
    double v7 = [(VideosExtrasSlideshowViewController *)self view];
    [v7 bounds];
    double v12 = -[VideosExtrasConstrainedArtworkContainerView initWithFrame:]([VideosExtrasConstrainedArtworkContainerView alloc], "initWithFrame:", v8, v9, v10, v11);
    [(VideosExtrasConstrainedArtworkContainerView *)v12 setAutoresizingMask:18];
    double v13 = [MEMORY[0x1E4FB1618] blackColor];
    [(VideosExtrasConstrainedArtworkContainerView *)v12 setBackgroundColor:v13];

    [(VideosExtrasConstrainedArtworkContainerView *)v12 setShouldAutoresizeMaskLayerToFillBounds:1];
    [v7 addSubview:v12];
    [(VideosExtrasSlideshowViewController *)self setImageContainerView:v12];
    if (v4)
    {
      id v14 = [(VideosExtrasConstrainedArtworkContainerView *)v12 artworkView];
      [v14 setImage:v4];
    }
    else
    {
      id v15 = [(VideosExtrasSlideshowViewController *)self dataSource];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __85__VideosExtrasSlideshowViewController__loadImageContainerViewIfAppropriateWithImage___block_invoke;
      v16[3] = &unk_1E6DF6038;
      id v17 = v12;
      [v15 slideshowViewController:self loadImageAtIndex:v5 withCompletionHandler:v16];
    }
  }
}

void __85__VideosExtrasSlideshowViewController__loadImageContainerViewIfAppropriateWithImage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 artworkView];
  [v4 setImage:v3];
}

- (unint64_t)_numberOfImages
{
  id v3 = [(VideosExtrasSlideshowViewController *)self dataSource];
  unint64_t v4 = [v3 numberOfImagesForSlideshowViewController:self];

  return v4;
}

- (void)_prepareNextImageAndScheduleTransitionTimerIfAppropriate
{
  if ([(VideosExtrasSlideshowViewController *)self isViewVisible])
  {
    unint64_t v3 = [(VideosExtrasSlideshowViewController *)self visibleImageIndex];
    unint64_t v4 = [(VideosExtrasSlideshowViewController *)self _numberOfImages];
    if (v3 < v4)
    {
      unint64_t v5 = v4;
      [(VideosExtrasSlideshowViewController *)self setNextImage:0];
      [(VideosExtrasSlideshowViewController *)self _scheduleTransitionTimer];
      if (v3 + 1 == v5) {
        unint64_t v6 = 0;
      }
      else {
        unint64_t v6 = v3 + 1;
      }
      double v7 = [(VideosExtrasSlideshowViewController *)self dataSource];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __95__VideosExtrasSlideshowViewController__prepareNextImageAndScheduleTransitionTimerIfAppropriate__block_invoke;
      v9[3] = &unk_1E6DF65B0;
      id v10 = v7;
      unint64_t v11 = v3;
      v9[4] = self;
      id v8 = v7;
      [v8 slideshowViewController:self loadImageAtIndex:v6 withCompletionHandler:v9];
    }
  }
}

void __95__VideosExtrasSlideshowViewController__prepareNextImageAndScheduleTransitionTimerIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) visibleImageIndex] == *(void *)(a1 + 48))
  {
    unint64_t v3 = [*(id *)(a1 + 32) dataSource];
    unint64_t v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      [*(id *)(a1 + 32) setNextImage:v6];
      unint64_t v5 = [*(id *)(a1 + 32) transitionTimer];

      if (!v5) {
        [*(id *)(a1 + 32) _transitionToNextImageIfAppropriate];
      }
    }
  }
}

- (void)_reload
{
  if ([(VideosExtrasSlideshowViewController *)self isViewLoaded])
  {
    unint64_t v3 = [(VideosExtrasSlideshowViewController *)self imageContainerView];
    [v3 removeFromSuperview];

    [(VideosExtrasSlideshowViewController *)self setImageContainerView:0];
    [(VideosExtrasSlideshowViewController *)self _invalidateTransitionTimer];
    [(VideosExtrasSlideshowViewController *)self _loadImageContainerViewIfAppropriateWithImage:0];
    [(VideosExtrasSlideshowViewController *)self _prepareNextImageAndScheduleTransitionTimerIfAppropriate];
  }
}

- (void)_transitionToNextImageIfAppropriate
{
  uint64_t v7 = [(VideosExtrasSlideshowViewController *)self nextImage];
  unint64_t v3 = [(VideosExtrasSlideshowViewController *)self _numberOfImages];
  unint64_t v4 = (void *)v7;
  if (v7)
  {
    unint64_t v5 = v3;
    if (self->_visibleImageIndex < v3)
    {
      BOOL v6 = [(VideosExtrasSlideshowViewController *)self isViewVisible];
      unint64_t v4 = (void *)v7;
      if (v6)
      {
        self->_visibleImageIndedouble x = (self->_visibleImageIndex + 1) % v5;
        [(VideosExtrasSlideshowViewController *)self setAnimatingTransition:1];
        switch([(VideosExtrasSlideshowViewController *)self transitionStyle])
        {
          case 0uLL:
            [(VideosExtrasSlideshowViewController *)self _performInstantaneousTransition];
            break;
          case 1uLL:
            [(VideosExtrasSlideshowViewController *)self _performDissolveTransition];
            break;
          case 2uLL:
            [(VideosExtrasSlideshowViewController *)self _performPushTransition];
            break;
          case 3uLL:
            [(VideosExtrasSlideshowViewController *)self _performWipeTransition];
            break;
          default:
            break;
        }
        [(VideosExtrasSlideshowViewController *)self _prepareNextImageAndScheduleTransitionTimerIfAppropriate];
        unint64_t v4 = (void *)v7;
      }
    }
  }
}

- (VideosExtrasSlideshowViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (VideosExtrasSlideshowViewControllerDataSource *)WeakRetained;
}

- (unint64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(unint64_t)a3
{
  self->_transitionStyle = a3;
}

- (void)setTransitionInterval:(double)a3
{
  self->_transitionInterval = a3;
}

- (unint64_t)visibleImageIndex
{
  return self->_visibleImageIndex;
}

- (BOOL)isAnimatingTransition
{
  return self->_animatingTransition;
}

- (void)setAnimatingTransition:(BOOL)a3
{
  self->_animatingTransition = a3;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (VideosExtrasConstrainedArtworkContainerView)disappearingImageContainerView
{
  return self->_disappearingImageContainerView;
}

- (void)setDisappearingImageContainerView:(id)a3
{
}

- (VideosExtrasConstrainedArtworkContainerView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setImageContainerView:(id)a3
{
}

- (UIImage)nextImage
{
  return self->_nextImage;
}

- (void)setNextImage:(id)a3
{
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_nextImage, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_disappearingImageContainerView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end