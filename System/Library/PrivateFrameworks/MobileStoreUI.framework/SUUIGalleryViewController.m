@interface SUUIGalleryViewController
- (SUUIEmbeddedMediaViewDelegate)embeddedMediaDelegate;
- (SUUIGalleryPageComponent)galleryComponent;
- (SUUIGalleryViewController)initWithGalleryComponent:(id)a3 artworkLoader:(id)a4;
- (SUUIMediaComponent)selectedMediaComponent;
- (id)_newViewControllerWithIndex:(int64_t)a3;
- (id)_newViewWithMediaComponent:(id)a3;
- (id)_selectedViewController;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (void)_finishPaneAnimation;
- (void)_showNextPaneAnimated:(BOOL)a3;
- (void)_startCycleTimer;
- (void)_stopCycleTimer;
- (void)_tapAction:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)loadArtworkForChildComponent:(id)a3 reason:(int64_t)a4 constraintWidth:(double)a5;
- (void)loadView;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)performActionForSelectedComponentAnimated:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setEmbeddedMediaDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUUIGalleryViewController

- (SUUIGalleryViewController)initWithGalleryComponent:(id)a3 artworkLoader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIGalleryViewController;
  v9 = [(SUUIGalleryViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_artworkLoader, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    componentArtworkRequests = v10->_componentArtworkRequests;
    v10->_componentArtworkRequests = (NSMapTable *)v11;

    objc_storeStrong((id *)&v10->_galleryComponent, a3);
  }

  return v10;
}

- (void)dealloc
{
  cycleTimer = self->_cycleTimer;
  if (cycleTimer) {
    dispatch_source_cancel(cycleTimer);
  }
  [(UIPageViewController *)self->_pageViewController setDataSource:0];
  [(UIPageViewController *)self->_pageViewController setDelegate:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer removeTarget:self action:0];
  v4.receiver = self;
  v4.super_class = (Class)SUUIGalleryViewController;
  [(SUUIGalleryViewController *)&v4 dealloc];
}

- (void)loadArtworkForChildComponent:(id)a3 reason:(int64_t)a4 constraintWidth:(double)a5
{
  id v16 = a3;
  id v8 = -[NSMapTable objectForKey:](self->_componentArtworkRequests, "objectForKey:");
  v9 = v8;
  if (!v8
    || !-[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_artworkLoader, "trySetReason:forRequestWithIdentifier:", a4, [v8 unsignedIntegerValue]))
  {
    v10 = [v16 bestThumbnailArtwork];
    uint64_t v11 = [v10 URL];
    if (v11)
    {
      v12 = objc_alloc_init(SUUIArtworkRequest);
      v13 = +[SUUISizeToFitImageDataConsumer consumerWithConstraintSize:](SUUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", a5, 0.0);
      [(SUUIArtworkRequest *)v12 setDataConsumer:v13];

      [(SUUIArtworkRequest *)v12 setDelegate:self];
      [(SUUIArtworkRequest *)v12 setURL:v11];
      componentArtworkRequests = self->_componentArtworkRequests;
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v12, "requestIdentifier"));
      [(NSMapTable *)componentArtworkRequests setObject:v15 forKey:v16];

      [(SUUIResourceLoader *)self->_artworkLoader loadResourceWithRequest:v12 reason:a4];
    }
  }
}

- (void)performActionForSelectedComponentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(SUUIGalleryViewController *)self _selectedViewController];
  id v5 = [v4 mediaView];

  [v5 beginPlaybackAnimated:v3];
}

- (SUUIMediaComponent)selectedMediaComponent
{
  v2 = [(SUUIGalleryViewController *)self _selectedViewController];
  BOOL v3 = [v2 component];

  return (SUUIMediaComponent *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIGalleryViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v7 = [(SUUIGalleryViewController *)self _selectedViewController];
  v6 = [v7 view];
  [v6 setBackgroundColor:v4];
}

- (void)setEmbeddedMediaDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIGalleryViewController *)self _selectedViewController];
  id v6 = [v5 mediaView];

  [v6 setDelegate:v4];
  objc_storeWeak((id *)&self->_embeddedMediaDelegate, v4);
}

- (void)loadView
{
  v40[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  [(SUUIGalleryViewController *)self setView:v3];
  id v4 = [(SUUIGalleryPageComponent *)self->_galleryComponent childComponents];
  uint64_t v5 = [v4 count];

  pageIndicator = self->_pageIndicator;
  if (pageIndicator) {
    goto LABEL_6;
  }
  if (![(SUUIGalleryPageComponent *)self->_galleryComponent hidesPageIndicator] && v5 >= 2)
  {
    id v7 = (UIPageControl *)objc_alloc_init(MEMORY[0x263F829F0]);
    id v8 = self->_pageIndicator;
    self->_pageIndicator = v7;

    [(UIPageControl *)self->_pageIndicator setEnabled:0];
    [(UIPageControl *)self->_pageIndicator setNumberOfPages:v5];
    [(UIPageControl *)self->_pageIndicator sizeToFit];
  }
  pageIndicator = self->_pageIndicator;
  if (pageIndicator)
  {
LABEL_6:
    [(UIPageControl *)pageIndicator bounds];
    objc_msgSend(v3, "setFrame:");
  }
  pageViewController = self->_pageViewController;
  if (!pageViewController)
  {
    v10 = (UIPageViewController *)[objc_alloc(MEMORY[0x263F829F8]) initWithTransitionStyle:1 navigationOrientation:0 options:0];
    uint64_t v11 = self->_pageViewController;
    self->_pageViewController = v10;

    [(UIPageViewController *)self->_pageViewController setDataSource:self];
    [(UIPageViewController *)self->_pageViewController setDelegate:self];
    if (v5 >= 1)
    {
      id v12 = [(SUUIGalleryViewController *)self _newViewControllerWithIndex:0];
      v40[0] = v12;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];

      [(UIPageViewController *)self->_pageViewController setViewControllers:v13 direction:0 animated:0 completion:0];
    }
    [(SUUIGalleryViewController *)self addChildViewController:self->_pageViewController];
    pageViewController = self->_pageViewController;
  }
  objc_super v14 = [(UIPageViewController *)pageViewController view];
  [v14 setAutoresizingMask:18];
  [v3 bounds];
  objc_msgSend(v14, "setFrame:");
  [v3 addSubview:v14];
  [v14 subviews];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v20 setDelegate:self];
          [v20 setScrollsToTop:0];
          goto LABEL_21;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  if (!self->_tapGestureRecognizer)
  {
    v21 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__tapAction_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v21;

    v23 = [(UIPageViewController *)self->_pageViewController gestureRecognizers];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          [(UITapGestureRecognizer *)self->_tapGestureRecognizer requireGestureRecognizerToFail:*(void *)(*((void *)&v30 + 1) + 8 * j)];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v25);
    }
    [v14 addGestureRecognizer:self->_tapGestureRecognizer];
  }
  v28 = self->_pageIndicator;
  if (v28)
  {
    [(UIPageControl *)v28 setAutoresizingMask:10];
    v29 = self->_pageIndicator;
    [v3 bounds];
    -[UIPageControl setFrame:](v29, "setFrame:");
    [v3 addSubview:self->_pageIndicator];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIGalleryViewController *)self _startCycleTimer];
  v5.receiver = self;
  v5.super_class = (Class)SUUIGalleryViewController;
  [(SUUIGalleryViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIGalleryViewController *)self _stopCycleTimer];
  v5.receiver = self;
  v5.super_class = (Class)SUUIGalleryViewController;
  [(SUUIGalleryViewController *)&v5 viewWillDisappear:v3];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SUUIGalleryViewController *)self _selectedViewController];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 component];
    v10 = [(NSMapTable *)self->_componentArtworkRequests objectForKey:v9];
    uint64_t v11 = [v10 unsignedIntegerValue];
    if (v11 == [v13 requestIdentifier])
    {
      id v12 = [v8 view];
      [v12 setThumbnailImage:v6];
    }
  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v4 = -[SUUIGalleryViewController _newViewControllerWithIndex:](self, "_newViewControllerWithIndex:", objc_msgSend(a4, "galleryIndex", a3) - 1);
  return v4;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v4 = -[SUUIGalleryViewController _newViewControllerWithIndex:](self, "_newViewControllerWithIndex:", objc_msgSend(a4, "galleryIndex", a3) + 1);
  return v4;
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  id v7 = [(SUUIGalleryViewController *)self _selectedViewController];
  -[UIPageControl setCurrentPage:](self->_pageIndicator, "setCurrentPage:", [v7 galleryIndex]);
}

- (void)_tapAction:(id)a3
{
  if ([a3 state] == 3)
  {
    [(SUUIGalleryViewController *)self performActionForSelectedComponentAnimated:1];
  }
}

- (void)_finishPaneAnimation
{
  id v3 = [(SUUIGalleryViewController *)self _selectedViewController];
  -[UIPageControl setCurrentPage:](self->_pageIndicator, "setCurrentPage:", [v3 galleryIndex]);
  [(SUUIGalleryViewController *)self _startCycleTimer];
}

- (id)_newViewControllerWithIndex:(int64_t)a3
{
  objc_super v5 = [(SUUIGalleryPageComponent *)self->_galleryComponent childComponents];
  unint64_t v6 = a3 % (unint64_t)[v5 count];
  id v7 = [v5 objectAtIndex:v6];
  id v8 = [[SUUIGalleryPaneViewController alloc] initWithMediaComponent:v7 galleryIndex:v6];
  v9 = [(NSMapTable *)self->_componentArtworkRequests objectForKey:v7];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_artworkLoader, "cachedResourceForRequestIdentifier:", [v9 unsignedIntegerValue]);
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = [(SUUIGalleryViewController *)self _newViewWithMediaComponent:v7];
  [v12 setAutoresizingMask:18];
  id v13 = [(SUUIGalleryViewController *)self view];
  objc_super v14 = [v13 backgroundColor];
  [v12 setBackgroundColor:v14];

  [v12 setThumbnailImage:v11];
  [(SUUIGalleryPaneViewController *)v8 setView:v12];

  return v8;
}

- (id)_newViewWithMediaComponent:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(SUUIEmbeddedMediaView);
  unint64_t v6 = [v4 accessibilityLabel];
  [(SUUIEmbeddedMediaView *)v5 setAccessibilityLabel:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_embeddedMediaDelegate);
  [(SUUIEmbeddedMediaView *)v5 setDelegate:WeakRetained];

  -[SUUIEmbeddedMediaView setMediaType:](v5, "setMediaType:", [v4 mediaType]);
  id v8 = [v4 mediaURLString];

  [(SUUIEmbeddedMediaView *)v5 setMediaURLString:v8];
  return v5;
}

- (id)_selectedViewController
{
  v2 = [(UIPageViewController *)self->_pageViewController viewControllers];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)_showNextPaneAnimated:(BOOL)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [(SUUIGalleryViewController *)self view];
  char v5 = [v4 isUserInteractionEnabled];
  [v4 setUserInteractionEnabled:0];
  [(SUUIGalleryViewController *)self _stopCycleTimer];
  unint64_t v6 = [(SUUIGalleryViewController *)self _selectedViewController];
  id v7 = -[SUUIGalleryViewController _newViewControllerWithIndex:](self, "_newViewControllerWithIndex:", [v6 galleryIndex] + 1);
  objc_initWeak(&location, self);
  pageViewController = self->_pageViewController;
  v14[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__SUUIGalleryViewController__showNextPaneAnimated___block_invoke;
  v10[3] = &unk_265406BC8;
  objc_copyWeak(&v11, &location);
  char v12 = v5;
  [(UIPageViewController *)pageViewController setViewControllers:v9 direction:0 animated:1 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __51__SUUIGalleryViewController__showNextPaneAnimated___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained view];
  [v4 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 40)];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _finishPaneAnimation];
}

- (void)_startCycleTimer
{
  [(SUUIGalleryPageComponent *)self->_galleryComponent cycleInterval];
  if (v3 > 0.0)
  {
    double v4 = v3;
    cycleTimer = self->_cycleTimer;
    if (cycleTimer)
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
      dispatch_source_set_timer(cycleTimer, v6, 0, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      id v8 = self->_cycleTimer;
      self->_cycleTimer = v7;

      v9 = self->_cycleTimer;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __45__SUUIGalleryViewController__startCycleTimer__block_invoke;
      v12[3] = &unk_265401538;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_event_handler(v9, v12);
      v10 = self->_cycleTimer;
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_source_set_timer(v10, v11, 0, 0);
      dispatch_resume((dispatch_object_t)self->_cycleTimer);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __45__SUUIGalleryViewController__startCycleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showNextPaneAnimated:1];
}

- (void)_stopCycleTimer
{
  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    dispatch_source_cancel(cycleTimer);
    double v4 = self->_cycleTimer;
    self->_cycleTimer = 0;
  }
}

- (SUUIEmbeddedMediaViewDelegate)embeddedMediaDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_embeddedMediaDelegate);
  return (SUUIEmbeddedMediaViewDelegate *)WeakRetained;
}

- (SUUIGalleryPageComponent)galleryComponent
{
  return self->_galleryComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_pageIndicator, 0);
  objc_storeStrong((id *)&self->_galleryComponent, 0);
  objc_destroyWeak((id *)&self->_embeddedMediaDelegate);
  objc_storeStrong((id *)&self->_cycleTimer, 0);
  objc_storeStrong((id *)&self->_componentArtworkRequests, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end