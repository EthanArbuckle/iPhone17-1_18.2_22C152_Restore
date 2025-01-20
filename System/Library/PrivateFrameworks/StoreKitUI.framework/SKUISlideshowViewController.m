@interface SKUISlideshowViewController
- (SKUIClientContext)clientContext;
- (SKUISlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SKUISlideshowViewControllerDataSource)dataSource;
- (SKUISlideshowViewControllerDelegate)delegate;
- (id)_itemViewControllerForIndex:(int64_t)a3;
- (id)animatorForDismissedController:(id)a3;
- (id)animatorForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)currentItemViewController;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (int64_t)currentIndex;
- (unint64_t)supportedInterfaceOrientations;
- (void)_contentViewTapped:(id)a3;
- (void)_doneButtonTapped:(id)a3;
- (void)_fadeOutOverlayAfterDelay:(unint64_t)a3;
- (void)_restoreStatusBarAppearanceState;
- (void)_saveStatusBarAppearanceState;
- (void)_setOverlayVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_toggleFadeOverlay;
- (void)_updateCurrentIndex;
- (void)_updateTitleWithIndex:(int64_t)a3;
- (void)dealloc;
- (void)loadView;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)reloadData;
- (void)setClientContext:(id)a3;
- (void)setCurrentIndex:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)slideshowItemViewControllerDidBeginPinchGesture:(id)a3;
- (void)slideshowItemViewControllerDidDismissWithPinchGesture:(id)a3 ratio:(double)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SKUISlideshowViewController

- (SKUISlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISlideshowViewController initWithNibName:bundle:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUISlideshowViewController;
  v8 = [(SKUISlideshowViewController *)&v19 initWithNibName:v6 bundle:v7];
  v9 = v8;
  if (v8)
  {
    v8->_currentIndex = 0;
    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    remoteLoadQueue = v9->_remoteLoadQueue;
    v9->_remoteLoadQueue = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemViewControllersCache = v9->_itemViewControllersCache;
    v9->_itemViewControllersCache = v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1A50]) initWithTransitionStyle:1 navigationOrientation:0 options:0];
    pageViewController = v9->_pageViewController;
    v9->_pageViewController = (UIPageViewController *)v14;

    [(UIPageViewController *)v9->_pageViewController setDataSource:v9];
    [(UIPageViewController *)v9->_pageViewController setDelegate:v9];
    [(SKUISlideshowViewController *)v9 addChildViewController:v9->_pageViewController];
    v9->_shouldCancelDelayedOverlayVisibilityChange = 0;
    v9->_overlayVisibilityWillChangeWithDelay = 0;
    v9->_lockOverlayControlsVisible = 0;
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v9 action:sel__doneButtonTapped_];
    v17 = [(SKUISlideshowViewController *)v9 navigationItem];
    [v17 setRightBarButtonItem:v16];
  }
  return v9;
}

- (void)dealloc
{
  [(UIPageViewController *)self->_pageViewController setDataSource:0];
  [(UIPageViewController *)self->_pageViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUISlideshowViewController;
  [(SKUISlideshowViewController *)&v3 dealloc];
}

- (id)animatorForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_alloc_init(SKUISlideshowAnimator);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = [v9 slideshowViewController:self poppedImageViewAtIndex:self->_currentIndex];

    [(SKUISlideshowAnimator *)v6 setImageView:v10];
  }

  return v6;
}

- (id)animatorForDismissedController:(id)a3
{
  v4 = objc_alloc_init(SKUISlideshowDismissalAnimator);
  v5 = [(SKUISlideshowViewController *)self currentItemViewController];
  id v6 = [v5 imageScrollView];
  id v7 = [v6 imageView];

  char v8 = [v7 image];

  id v9 = [(SKUISlideshowViewController *)self view];
  v10 = v9;
  if (v8)
  {
    [v7 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    objc_super v19 = [v7 superview];
    objc_msgSend(v10, "convertRect:fromView:", v19, v12, v14, v16, v18);
    -[SKUISlideshowDismissalAnimator setImageRect:](v4, "setImageRect:");
  }
  else
  {
    [v9 bounds];
    -[SKUISlideshowDismissalAnimator setImageRect:](v4, "setImageRect:");
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    [v22 slideshowViewController:self scrollToImageAtIndex:self->_currentIndex];
  }
  id v23 = objc_loadWeakRetained((id *)&self->_delegate);
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    v26 = [v25 slideshowViewController:self poppedImageViewAtIndex:self->_currentIndex];

    [(SKUISlideshowDismissalAnimator *)v4 setImageView:v26];
  }

  return v4;
}

- (void)setCurrentIndex:(int64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v5 = -[SKUISlideshowViewController _itemViewControllerForIndex:](self, "_itemViewControllerForIndex:");
  pageViewController = self->_pageViewController;
  v8[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(UIPageViewController *)pageViewController setViewControllers:v7 direction:0 animated:0 completion:0];

  self->_currentIndex = a3;
  [(SKUISlideshowViewController *)self _updateCurrentIndex];
}

- (void)reloadData
{
}

- (id)currentItemViewController
{
  objc_super v3 = [(UIPageViewController *)self->_pageViewController viewControllers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(UIPageViewController *)self->_pageViewController viewControllers];
    id v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  id v10 = (id)objc_msgSend(v3, "initWithFrame:");

  v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v10 setBackgroundColor:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2020];
  [v6 setAutoresizingMask:18];
  [v10 addSubview:v6];
  id v7 = [(UIPageViewController *)self->_pageViewController view];
  [v10 bounds];
  objc_msgSend(v7, "setFrame:");
  [v10 addSubview:v7];
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__contentViewTapped_];
  [v8 setNumberOfTapsRequired:2];
  [v7 addGestureRecognizer:v8];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__contentViewTapped_];
  [v9 requireGestureRecognizerToFail:v8];
  [v7 addGestureRecognizer:v9];
  [(SKUISlideshowViewController *)self setView:v10];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SKUISlideshowViewController;
  [(SKUISlideshowViewController *)&v3 viewDidLoad];
  [(SKUISlideshowViewController *)self setCurrentIndex:self->_currentIndex];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUISlideshowViewController;
  [(SKUISlideshowViewController *)&v4 viewWillAppear:a3];
  [(SKUISlideshowViewController *)self _saveStatusBarAppearanceState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUISlideshowViewController;
  [(SKUISlideshowViewController *)&v4 viewWillDisappear:a3];
  [(SKUISlideshowViewController *)self _restoreStatusBarAppearanceState];
  self->_shouldCancelDelayedOverlayVisibilityChange = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUISlideshowViewController;
  [(SKUISlideshowViewController *)&v4 viewDidAppear:a3];
  [(SKUISlideshowViewController *)self _setOverlayVisible:1 animated:1];
  [(SKUISlideshowViewController *)self _fadeOutOverlayAfterDelay:2];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!self->_overlayVisible)
  {
    id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v7 setStatusBarHidden:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUISlideshowViewController;
  [(SKUISlideshowViewController *)&v8 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!self->_overlayVisible)
  {
    id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v7 setStatusBarHidden:1];
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUISlideshowViewController;
  [(SKUISlideshowViewController *)&v8 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "indexInCollection", a3) + 1;

  return [(SKUISlideshowViewController *)self _itemViewControllerForIndex:v5];
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "indexInCollection", a3) - 1;

  return [(SKUISlideshowViewController *)self _itemViewControllerForIndex:v5];
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  if (a6)
  {
    id v7 = [a3 viewControllers];
    id v8 = [v7 objectAtIndexedSubscript:0];

    self->_currentIndex = [v8 indexInCollection];
    [(SKUISlideshowViewController *)self _updateCurrentIndex];
  }
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  self->_shouldCancelDelayedOverlayVisibilityChange = 1;
}

- (void)slideshowItemViewControllerDidBeginPinchGesture:(id)a3
{
}

- (void)slideshowItemViewControllerDidDismissWithPinchGesture:(id)a3 ratio:(double)a4
{
  if (a4 > 0.0)
  {
    id v6 = [(SKUISlideshowViewController *)self delegate];
    [(SKUISlideshowViewController *)self _restoreStatusBarAppearanceState];
    if (objc_opt_respondsToSelector()) {
      [v6 slideshowViewControllerDidFinish:self];
    }
    else {
      [(SKUISlideshowViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (id)_itemViewControllerForIndex:(int64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = WeakRetained;
  if (a3 < 0 || !WeakRetained)
  {

    goto LABEL_11;
  }
  id v8 = objc_loadWeakRetained((id *)p_dataSource);
  int64_t v9 = [v8 numberOfItemsInSlideshowViewController:self];

  if (v9 <= a3)
  {
LABEL_11:
    double v12 = 0;
    goto LABEL_12;
  }
  itemViewControllersCache = self->_itemViewControllersCache;
  double v11 = [NSNumber numberWithInteger:a3];
  double v12 = [(NSMutableDictionary *)itemViewControllersCache objectForKeyedSubscript:v11];

  if (!v12)
  {
    double v12 = objc_alloc_init(SKUISlideshowItemViewController);
    [(SKUISlideshowItemViewController *)v12 setClientContext:self->_clientContext];
    [(SKUISlideshowItemViewController *)v12 setIndexInCollection:a3];
    [(SKUISlideshowItemViewController *)v12 setDelegate:self];
    id v13 = objc_loadWeakRetained((id *)p_dataSource);
    double v14 = [v13 slideshowViewController:self placeholderImageAtIndex:a3];

    if (v14) {
      [(SKUISlideshowItemViewController *)v12 setItemImage:v14];
    }
    id v15 = objc_loadWeakRetained((id *)p_dataSource);
    double v16 = [v15 slideshowViewController:self dataConsumerAtIndex:a3];

    id v17 = objc_loadWeakRetained((id *)p_dataSource);
    double v18 = [v17 slideshowViewController:self imageURLAtIndex:a3];

    if (v18)
    {
      objc_super v19 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v18];
      [v19 setITunesStoreRequest:0];
      [v19 setDataConsumer:v16];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __59__SKUISlideshowViewController__itemViewControllerForIndex___block_invoke;
      v23[3] = &unk_1E6428340;
      char v24 = v12;
      [v19 setOutputBlock:v23];
      [(NSOperationQueue *)self->_remoteLoadQueue addOperation:v19];
    }
    v20 = self->_itemViewControllersCache;
    char v21 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v20 setObject:v12 forKeyedSubscript:v21];
  }
LABEL_12:

  return v12;
}

void __59__SKUISlideshowViewController__itemViewControllerForIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SKUISlideshowViewController__itemViewControllerForIndex___block_invoke_2;
  v5[3] = &unk_1E6421FF8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __59__SKUISlideshowViewController__itemViewControllerForIndex___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setItemImage:*(void *)(a1 + 40)];
}

- (void)_updateCurrentIndex
{
}

- (void)_updateTitleWithIndex:(int64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v16 setNumberStyle:1];
    id v7 = NSNumber;
    id v8 = objc_loadWeakRetained((id *)p_dataSource);
    int64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "numberOfItemsInSlideshowViewController:", self));
    id v10 = [v16 stringFromNumber:v9];

    double v11 = [NSNumber numberWithInteger:a3 + 1];
    double v12 = [v16 stringFromNumber:v11];

    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"SCREENSHOTS_INDEX_STRING"];
    }
    else {
    double v14 = +[SKUIClientContext localizedStringForKey:@"SCREENSHOTS_INDEX_STRING" inBundles:0];
    }
    id v15 = [NSString stringWithValidatedFormat:v14, @"%@%@", 0, v12, v10 validFormatSpecifiers error];
    [(SKUISlideshowViewController *)self setTitle:v15];
  }
  else
  {
    [(SKUISlideshowViewController *)self setTitle:0];
  }
}

- (void)_contentViewTapped:(id)a3
{
  id v7 = a3;
  if ([v7 numberOfTapsRequired] == 1)
  {
    if ([v7 numberOfTouches] == 1)
    {
      if (self->_overlayVisible)
      {
        if (self->_overlayVisibilityWillChangeWithDelay) {
          self->_shouldCancelDelayedOverlayVisibilityChange = 1;
        }
      }
      else
      {
        [(SKUISlideshowViewController *)self _fadeOutOverlayAfterDelay:4];
      }
      [(SKUISlideshowViewController *)self _toggleFadeOverlay];
    }
  }
  else if ([v7 numberOfTapsRequired] == 2)
  {
    id v4 = [(UIPageViewController *)self->_pageViewController viewControllers];
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];

    id v6 = [v5 imageScrollView];
    [v7 locationInView:v6];
    objc_msgSend(v6, "zoomIntoPoint:");
  }
}

- (void)_doneButtonTapped:(id)a3
{
  id v4 = [(SKUISlideshowViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 slideshowViewControllerDidFinish:self];
  }
  else {
    [(SKUISlideshowViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_toggleFadeOverlay
{
  id v3 = [(SKUISlideshowViewController *)self navigationController];

  if (v3)
  {
    BOOL v4 = !self->_overlayVisible;
    [(SKUISlideshowViewController *)self _setOverlayVisible:v4 animated:1];
  }
}

- (void)_fadeOutOverlayAfterDelay:(unint64_t)a3
{
  if (!self->_overlayVisibilityWillChangeWithDelay)
  {
    self->_overlayVisibilityWillChangeWithDelay = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SKUISlideshowViewController__fadeOutOverlayAfterDelay___block_invoke;
    block[3] = &unk_1E64250B0;
    objc_copyWeak(v6, &location);
    v6[1] = (id)a3;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }
}

void __57__SKUISlideshowViewController__fadeOutOverlayAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1010] = 0;
    if (WeakRetained[1011])
    {
      id v3 = WeakRetained;
      [WeakRetained _fadeOutOverlayAfterDelay:*(void *)(a1 + 40)];
      id WeakRetained = v3;
    }
    else
    {
      if (!WeakRetained[1009])
      {
        dispatch_time_t v4 = WeakRetained;
        [WeakRetained _setOverlayVisible:0 animated:1];
        id WeakRetained = v4;
      }
      WeakRetained[1009] = 0;
    }
  }
}

- (void)_setOverlayVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_overlayVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v7 setStatusBarHidden:!v5 withAnimation:1];

    id v8 = [(SKUISlideshowViewController *)self navigationController];
    int64_t v9 = [v8 navigationBar];

    double v10 = 0.0;
    if (v5) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    [v9 setAlpha:(double)!v5];
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    if (v4) {
      double v10 = 0.349999994;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__SKUISlideshowViewController__setOverlayVisible_animated___block_invoke;
    v14[3] = &unk_1E6426868;
    id v15 = v9;
    double v16 = v11;
    id v13 = v9;
    [v12 animateWithDuration:2 delay:v14 options:0 animations:v10 completion:0.0];
    self->_overlayVisible = v5;
  }
}

uint64_t __59__SKUISlideshowViewController__setOverlayVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_saveStatusBarAppearanceState
{
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  self = (SKUISlideshowViewController *)((char *)self + 1016);
  *(unsigned char *)&self->super.super._responderFlags = [v3 isStatusBarHidden];
  self->super.super.super.isa = (Class)[v3 statusBarStyle];
}

- (void)_restoreStatusBarAppearanceState
{
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v3 = [v6 isStatusBarHidden];
  p_savedStatusBarState = &self->_savedStatusBarState;
  int hidden = p_savedStatusBarState->hidden;
  if (hidden != v3) {
    [v6 setStatusBarHidden:hidden != 0];
  }
  if ([v6 statusBarStyle] != p_savedStatusBarState->style) {
    objc_msgSend(v6, "setStatusBarStyle:");
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUISlideshowViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SKUISlideshowViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (SKUISlideshowViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISlideshowViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_itemViewControllersCache, 0);
  objc_storeStrong((id *)&self->_remoteLoadQueue, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISlideshowViewController initWithNibName:bundle:]";
}

@end