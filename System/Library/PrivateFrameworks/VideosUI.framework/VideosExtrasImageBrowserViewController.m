@interface VideosExtrasImageBrowserViewController
- (BOOL)allowsPinchingImageForInteractiveZoomingImageTransition;
- (UIPageViewController)pageViewController;
- (VideosExtrasImageBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VideosExtrasImageBrowserViewControllerDataSource)dataSource;
- (VideosExtrasImageBrowserViewControllerDelegate)delegate;
- (VideosExtrasZoomingImageInteractiveTransitionSource)zoomingImageInteractiveTransitionSource;
- (id)_imageViewControllerAtIndex:(unint64_t)a3;
- (id)_visibleImageViewController;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (unint64_t)_numberOfImages;
- (unint64_t)visibleImageIndex;
- (void)_addPageViewForController:(id)a3 toView:(id)a4;
- (void)_removePageViewController;
- (void)_updatePageViewController;
- (void)_updateTitle;
- (void)dealloc;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)handlePinchGestureForZoomingImageInteractiveTransitionWithContext:(id)a3;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)setAllowsPinchingImageForInteractiveZoomingImageTransition:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPageViewController:(id)a3;
- (void)setVisibleImageIndex:(unint64_t)a3;
- (void)setZoomingImageInteractiveTransitionSource:(id)a3;
- (void)viewDidLoad;
@end

@implementation VideosExtrasImageBrowserViewController

- (VideosExtrasImageBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasImageBrowserViewController;
  v4 = [(VideosExtrasImageBrowserViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(VideosExtrasImageBrowserViewController *)v4 setAutomaticallyAdjustsScrollViewInsets:0];
    v5->_visibleImageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)dealloc
{
  [(VideosExtrasImageBrowserViewController *)self _removePageViewController];
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasImageBrowserViewController;
  [(VideosExtrasImageBrowserViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasImageBrowserViewController;
  [(VideosExtrasImageBrowserViewController *)&v6 viewDidLoad];
  objc_super v3 = [(VideosExtrasImageBrowserViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setBackgroundColor:v4];

  v5 = [(VideosExtrasImageBrowserViewController *)self pageViewController];
  if (v5) {
    [(VideosExtrasImageBrowserViewController *)self _addPageViewForController:v5 toView:v3];
  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  v5 = (char *)objc_msgSend(a4, "imageIndex", a3);
  if (v5)
  {
    v5 = [(VideosExtrasImageBrowserViewController *)self _imageViewControllerAtIndex:v5 - 1];
  }
  return v5;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  unint64_t v5 = objc_msgSend(a4, "imageIndex", a3) + 1;
  if (v5 >= [(VideosExtrasImageBrowserViewController *)self _numberOfImages])
  {
    objc_super v6 = 0;
  }
  else
  {
    objc_super v6 = [(VideosExtrasImageBrowserViewController *)self _imageViewControllerAtIndex:v5];
  }
  return v6;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsPinchingImageForInteractiveZoomingImageTransition:", -[VideosExtrasImageBrowserViewController allowsPinchingImageForInteractiveZoomingImageTransition](self, "allowsPinchingImageForInteractiveZoomingImageTransition"));
  unint64_t v5 = [(VideosExtrasImageBrowserViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "imageBrowserViewController:willTransitionToImageAtIndex:", self, objc_msgSend(v6, "imageIndex"));
  }
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v6 = a6;
  v8 = [a3 viewControllers];
  id v10 = [v8 firstObject];

  objc_msgSend(v10, "setAllowsPinchingImageForInteractiveZoomingImageTransition:", -[VideosExtrasImageBrowserViewController allowsPinchingImageForInteractiveZoomingImageTransition](self, "allowsPinchingImageForInteractiveZoomingImageTransition"));
  self->_visibleImageIndex = [v10 imageIndex];
  [(VideosExtrasImageBrowserViewController *)self _updateTitle];
  v9 = [(VideosExtrasImageBrowserViewController *)self delegate];
  if (v6)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v9, "imageBrowserViewController:didCompleteTransitionToImageAtIndex:", self, objc_msgSend(v10, "imageIndex"));
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v9 imageBrowserViewControllerDidCancelTransition:self];
  }
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  -[VideosExtrasImageBrowserViewController setVisibleImageIndex:](self, "setVisibleImageIndex:", [v4 itemIndex]);
  unint64_t v5 = [(VideosExtrasImageBrowserViewController *)self view];
  [v5 setHidden:1];

  id v6 = [(VideosExtrasImageBrowserViewController *)self _visibleImageViewController];
  [v6 prepareZoomingImageTransitionWithContext:v4];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasImageBrowserViewController *)self _visibleImageViewController];
  [v5 performZoomingImageTransitionWithContext:v4];
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(VideosExtrasImageBrowserViewController *)self _visibleImageViewController];
  [v7 finalizeZoomingImageTransitionWithContext:v6 transitionFinished:v4];

  id v8 = [(VideosExtrasImageBrowserViewController *)self view];
  [v8 setHidden:0];
}

- (void)handlePinchGestureForZoomingImageInteractiveTransitionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasImageBrowserViewController *)self zoomingImageInteractiveTransitionSource];
  [v5 handlePinchGestureForZoomingImageInteractiveTransitionWithContext:v4];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(VideosExtrasImageBrowserViewController *)self _updatePageViewController];
    id v5 = obj;
  }
}

- (void)setAllowsPinchingImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  if (self->_allowsPinchingImageForInteractiveZoomingImageTransition != a3)
  {
    BOOL v3 = a3;
    self->_allowsPinchingImageForInteractiveZoomingImageTransition = a3;
    id v4 = [(VideosExtrasImageBrowserViewController *)self _visibleImageViewController];
    [v4 setAllowsPinchingImageForInteractiveZoomingImageTransition:v3];
  }
}

- (void)setVisibleImageIndex:(unint64_t)a3
{
  if (self->_visibleImageIndex != a3)
  {
    self->_visibleImageIndex = a3;
    [(VideosExtrasImageBrowserViewController *)self _updatePageViewController];
    [(VideosExtrasImageBrowserViewController *)self _updateTitle];
  }
}

- (void)_addPageViewForController:(id)a3 toView:(id)a4
{
  id v5 = a4;
  id v7 = [a3 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:v7];
  id v6 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v7, v5, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v5 addConstraints:v6];
}

- (id)_imageViewControllerAtIndex:(unint64_t)a3
{
  id v5 = objc_alloc_init(VideosExtrasImageViewController);
  [(VideosExtrasImageViewController *)v5 setImageIndex:a3];
  [(VideosExtrasImageViewController *)v5 setZoomingImageTransitionIdentifier:@"VideosExtrasImageBrowserZoomingImageTransitionIdentifier"];
  id v6 = [(VideosExtrasImageBrowserViewController *)self dataSource];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke;
  v23[3] = &unk_1E6DF6038;
  id v7 = v5;
  v24 = v7;
  [v6 imageBrowserViewController:self loadImageAtIndex:a3 withCompletionHandler:v23];

  id v8 = [(VideosExtrasImageBrowserViewController *)self dataSource];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_2;
  v21[3] = &unk_1E6DF6060;
  v9 = v7;
  v22 = v9;
  [v8 imageBrowserViewController:self loadTitleAtIndex:a3 withCompletionHandler:v21];

  id v10 = [(VideosExtrasImageBrowserViewController *)self dataSource];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_3;
  v19[3] = &unk_1E6DF6060;
  v11 = v9;
  v20 = v11;
  [v10 imageBrowserViewController:self loadSubtitleAtIndex:a3 withCompletionHandler:v19];

  v12 = [(VideosExtrasImageBrowserViewController *)self dataSource];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_4;
  v17[3] = &unk_1E6DF6060;
  v13 = v11;
  v18 = v13;
  [v12 imageBrowserViewController:self loadDescriptionAtIndex:a3 withCompletionHandler:v17];

  v14 = v18;
  v15 = v13;

  return v15;
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2];
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setTitleString:a2];
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSubtitleString:a2];
}

uint64_t __70__VideosExtrasImageBrowserViewController__imageViewControllerAtIndex___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDescriptionString:a2];
}

- (unint64_t)_numberOfImages
{
  BOOL v3 = [(VideosExtrasImageBrowserViewController *)self dataSource];
  unint64_t v4 = [v3 numberOfImagesForBrowserViewController:self];

  return v4;
}

- (void)_removePageViewController
{
  id v4 = [(VideosExtrasImageBrowserViewController *)self pageViewController];
  if (v4)
  {
    [v4 willMoveToParentViewController:0];
    if ([(VideosExtrasImageBrowserViewController *)self isViewLoaded])
    {
      BOOL v3 = [v4 view];
      [v3 removeFromSuperview];
    }
    [v4 removeFromParentViewController];
    [v4 setDataSource:0];
    [v4 setDelegate:0];
    [(VideosExtrasImageBrowserViewController *)self setPageViewController:0];
  }
}

- (void)_updatePageViewController
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VideosExtrasImageBrowserViewController *)self dataSource];
  unint64_t v4 = [(VideosExtrasImageBrowserViewController *)self visibleImageIndex];
  if (!v3 || (unint64_t v5 = v4, v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    [(VideosExtrasImageBrowserViewController *)self _removePageViewController];
  }
  else
  {
    id v6 = [(VideosExtrasImageBrowserViewController *)self pageViewController];
    if (!v6)
    {
      uint64_t v12 = *MEMORY[0x1E4FB2E18];
      v13[0] = &unk_1F3F3E558;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1A50]) initWithTransitionStyle:1 navigationOrientation:0 options:v7];
      [v6 setDataSource:self];
      [v6 setDelegate:self];
      [(VideosExtrasImageBrowserViewController *)self addChildViewController:v6];
      if ([(VideosExtrasImageBrowserViewController *)self isViewLoaded])
      {
        id v8 = [(VideosExtrasImageBrowserViewController *)self view];
        [(VideosExtrasImageBrowserViewController *)self _addPageViewForController:v6 toView:v8];
      }
      [v6 didMoveToParentViewController:self];
      [(VideosExtrasImageBrowserViewController *)self setPageViewController:v6];
    }
    v9 = [(VideosExtrasImageBrowserViewController *)self _imageViewControllerAtIndex:v5];
    v11 = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v6 setViewControllers:v10 direction:0 animated:0 completion:0];
  }
}

- (void)_updateTitle
{
  BOOL v3 = NSString;
  unint64_t v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  unint64_t v5 = [v4 localizedStringForKey:@"PAGE_NUMBER_WITH_COUNT_%lu_%lu" value:0 table:@"VideosExtras"];
  objc_msgSend(v3, "localizedStringWithFormat:", v5, -[VideosExtrasImageBrowserViewController visibleImageIndex](self, "visibleImageIndex") + 1, -[VideosExtrasImageBrowserViewController _numberOfImages](self, "_numberOfImages"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(VideosExtrasImageBrowserViewController *)self setTitle:v6];
}

- (id)_visibleImageViewController
{
  v2 = [(VideosExtrasImageBrowserViewController *)self pageViewController];
  BOOL v3 = [v2 viewControllers];
  unint64_t v4 = [v3 firstObject];

  return v4;
}

- (VideosExtrasImageBrowserViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (VideosExtrasImageBrowserViewControllerDataSource *)WeakRetained;
}

- (VideosExtrasImageBrowserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VideosExtrasImageBrowserViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VideosExtrasZoomingImageInteractiveTransitionSource)zoomingImageInteractiveTransitionSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomingImageInteractiveTransitionSource);
  return (VideosExtrasZoomingImageInteractiveTransitionSource *)WeakRetained;
}

- (void)setZoomingImageInteractiveTransitionSource:(id)a3
{
}

- (BOOL)allowsPinchingImageForInteractiveZoomingImageTransition
{
  return self->_allowsPinchingImageForInteractiveZoomingImageTransition;
}

- (unint64_t)visibleImageIndex
{
  return self->_visibleImageIndex;
}

- (UIPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (void)setPageViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_destroyWeak((id *)&self->_zoomingImageInteractiveTransitionSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end