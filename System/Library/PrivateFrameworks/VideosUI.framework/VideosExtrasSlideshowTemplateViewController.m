@interface VideosExtrasSlideshowTemplateViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldPerformZoomingImageTransitionFromImageElement:(id)a3 toImageAtIndex:(unint64_t)a4;
- (BOOL)showsPlaceholder;
- (IKSlideshowElement)templateElement;
- (NSArray)imageElements;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (VideosExtrasSlideshowTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5;
- (VideosExtrasSlideshowViewController)slideshowViewController;
- (unint64_t)numberOfImagesForSlideshowViewController:(id)a3;
- (void)_firstImageLoadedHideNavigationBar;
- (void)_toggleVisibilityOfNavigationBar;
- (void)dealloc;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setImageElements:(id)a3;
- (void)setSlideshowViewController:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)slideshowViewController:(id)a3 loadImageAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VideosExtrasSlideshowTemplateViewController

- (VideosExtrasSlideshowTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  v5 = [(VideosExtrasTemplateViewController *)&v27 initWithDocument:a3 options:a4 context:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(VideosExtrasSlideshowTemplateViewController *)v5 templateElement];
    uint64_t v8 = [v7 transition];
    if ((unint64_t)(v8 - 2) >= 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8 - 1;
    }
    [v7 transitionInterval];
    if (v10 >= 2.22044605e-16) {
      double v11 = v10;
    }
    else {
      double v11 = 3.0;
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13 = [v7 images];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 addObject:v18];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }
    [(VideosExtrasSlideshowTemplateViewController *)v6 setImageElements:v12];
    v19 = objc_alloc_init(VideosExtrasSlideshowViewController);
    [(VideosExtrasSlideshowViewController *)v19 setDataSource:v6];
    [(VideosExtrasSlideshowViewController *)v19 setTransitionStyle:v9];
    [(VideosExtrasSlideshowViewController *)v19 setTransitionInterval:v11];
    [(VideosExtrasSlideshowViewController *)v19 setVisibleImageIndex:0];
    [(VideosExtrasSlideshowTemplateViewController *)v6 addChildViewController:v19];
    [(VideosExtrasSlideshowViewController *)v19 didMoveToParentViewController:v6];
    [(VideosExtrasSlideshowTemplateViewController *)v6 setSlideshowViewController:v19];
    v20 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    v21 = [v20 localizedStringForKey:@"SLIDESHOW_TITLE" value:0 table:@"VideosExtras"];
    [(VideosExtrasSlideshowTemplateViewController *)v6 setTitle:v21];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(VideosExtrasSlideshowTemplateViewController *)self slideshowViewController];
  [v3 willMoveToParentViewController:0];
  if ([v3 isViewLoaded])
  {
    v4 = [v3 view];
    [v4 removeFromSuperview];
  }
  [v3 removeFromParentViewController];
  [v3 setDataSource:0];
  v5 = [(VideosExtrasSlideshowTemplateViewController *)self tapGestureRecognizer];
  [v5 removeTarget:self action:0];

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v6 dealloc];
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(VideosExtrasSlideshowTemplateViewController *)self navigationController];
  char v3 = [v2 isNavigationBarHidden];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  [(VideosExtrasElementViewController *)&v12 viewWillAppear:a3];
  v4 = [(VideosExtrasSlideshowTemplateViewController *)self navigationController];
  v5 = [v4 viewControllers];
  objc_super v6 = (void *)[v5 mutableCopy];

  v7 = [v6 lastObject];

  if (v7 == self) {
    [v6 removeLastObject];
  }
  uint64_t v8 = [v6 lastObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    double v10 = [(VideosExtrasSlideshowTemplateViewController *)self slideshowViewController];
    uint64_t v11 = [v9 indexOfVisibleItem];

    [v10 setVisibleImageIndex:v11];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v5 viewDidDisappear:a3];
  v4 = [(VideosExtrasSlideshowTemplateViewController *)self view];
  [v4 clearArtworkCatalogs];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v10 viewDidLoad];
  objc_super v3 = [(VideosExtrasSlideshowTemplateViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  objc_super v5 = [(VideosExtrasSlideshowTemplateViewController *)self slideshowViewController];
  objc_super v6 = [v5 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v6];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v6, v3, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v7 addObjectsFromArray:v8];

  [v3 addConstraints:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  [v3 addGestureRecognizer:v9];
  [(VideosExtrasSlideshowTemplateViewController *)self setTapGestureRecognizer:v9];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasSlideshowTemplateViewController;
  [(VideosExtrasSlideshowTemplateViewController *)&v4 viewWillDisappear:a3];
  if (self->_overlayHidden) {
    [(VideosExtrasSlideshowTemplateViewController *)self _toggleVisibilityOfNavigationBar];
  }
}

- (IKSlideshowElement)templateElement
{
  v2 = [(VideosExtrasTemplateViewController *)self document];
  objc_super v3 = [v2 templateElement];

  return (IKSlideshowElement *)v3;
}

- (BOOL)showsPlaceholder
{
  return 0;
}

- (unint64_t)numberOfImagesForSlideshowViewController:(id)a3
{
  objc_super v3 = [(VideosExtrasSlideshowTemplateViewController *)self imageElements];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)slideshowViewController:(id)a3 loadImageAtIndex:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = [(VideosExtrasSlideshowTemplateViewController *)self imageElements];
  uint64_t v11 = [v10 objectAtIndex:a4];

  objc_super v12 = [(VideosExtrasSlideshowTemplateViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  [v12 clearArtworkCatalogs];
  uint64_t v17 = [v11 artworkCatalog];
  objc_msgSend(v17, "setFittingSize:", v14, v16);
  uint64_t v18 = objc_alloc_init(VideosExtrasSlideshowArtworkCatalogHelper);
  [(VideosExtrasSlideshowArtworkCatalogHelper *)v18 setArtworkCatalog:v17];
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __110__VideosExtrasSlideshowTemplateViewController_slideshowViewController_loadImageAtIndex_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E6DF7B50;
  v19 = v18;
  v22 = v19;
  id v20 = v9;
  id v23 = v20;
  objc_copyWeak(&v24, &location);
  [v17 setDestination:v12 configurationBlock:v21];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

void __110__VideosExtrasSlideshowTemplateViewController_slideshowViewController_loadImageAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_super v6 = [*(id *)(a1 + 32) artworkCatalog];

    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [*(id *)(a1 + 32) setArtworkCatalog:0];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained _firstImageLoadedHideNavigationBar];
    }
  }
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasSlideshowTemplateViewController *)self slideshowViewController];
  [v5 prepareZoomingImageTransitionWithContext:v4];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasSlideshowTemplateViewController *)self slideshowViewController];
  [v5 performZoomingImageTransitionWithContext:v4];
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(VideosExtrasSlideshowTemplateViewController *)self slideshowViewController];
  [v7 finalizeZoomingImageTransitionWithContext:v6 transitionFinished:v4];
}

- (BOOL)shouldPerformZoomingImageTransitionFromImageElement:(id)a3 toImageAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(VideosExtrasSlideshowTemplateViewController *)self slideshowViewController];
  if ([v7 isAnimatingTransition])
  {
    char v8 = 0;
  }
  else
  {
    id v9 = [(VideosExtrasSlideshowTemplateViewController *)self imageElements];
    if ([v9 count] <= a4)
    {
      char v8 = 0;
    }
    else
    {
      objc_super v10 = [v9 objectAtIndex:a4];
      uint64_t v11 = [v10 bestURL];
      objc_super v12 = [v6 bestURL];
      char v8 = [v11 isEqual:v12];
    }
  }

  return v8;
}

- (void)_firstImageLoadedHideNavigationBar
{
  if (!self->_preventNavbarAutohide)
  {
    self->_preventNavbarAutohide = 1;
    objc_super v3 = [(VideosExtrasSlideshowTemplateViewController *)self navigationController];
    BOOL v4 = v3;
    if (v3)
    {
      id v6 = v3;
      char v5 = [v3 isNavigationBarHidden];
      BOOL v4 = v6;
      if ((v5 & 1) == 0)
      {
        [(VideosExtrasSlideshowTemplateViewController *)self _toggleVisibilityOfNavigationBar];
        BOOL v4 = v6;
      }
    }
  }
}

- (void)_toggleVisibilityOfNavigationBar
{
  self->_overlayHidden ^= 1u;
  id v6 = [(VideosExtrasSlideshowTemplateViewController *)self navigationController];
  if (v6)
  {
    [v6 _setNavigationBarHidden:self->_overlayHidden edge:15 duration:0.3];
    [(VideosExtrasSlideshowTemplateViewController *)self setNeedsStatusBarAppearanceUpdate];
    self->_preventNavbarAutohide = 1;
  }
  objc_super v3 = [(VideosExtrasTemplateViewController *)self context];
  BOOL v4 = [v3 extrasRootViewController];
  char v5 = [v4 mainMenuBar];
  [v5 setHidden:self->_overlayHidden];
}

- (VideosExtrasSlideshowViewController)slideshowViewController
{
  return self->_slideshowViewController;
}

- (void)setSlideshowViewController:(id)a3
{
}

- (NSArray)imageElements
{
  return self->_imageElements;
}

- (void)setImageElements:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageElements, 0);
  objc_storeStrong((id *)&self->_slideshowViewController, 0);
}

@end