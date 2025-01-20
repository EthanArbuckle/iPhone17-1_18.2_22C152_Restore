@interface VideosExtrasFeatureContainerViewController
- (UIView)menuBarView;
- (VideosExtrasContext)context;
- (VideosExtrasFeatureContainerViewController)initWithContext:(id)a3;
- (VideosExtrasVideoPlaybackViewController)videoPlaybackViewController;
- (double)collectionViewHeight;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (void)_menuBarHeightChange:(id)a3;
- (void)dealloc;
- (void)setCollectionViewHeight:(double)a3;
- (void)setMenuBarView:(id)a3;
- (void)setVideoPlaybackViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation VideosExtrasFeatureContainerViewController

- (VideosExtrasFeatureContainerViewController)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasFeatureContainerViewController;
  v5 = [(VideosExtrasFeatureContainerViewController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__menuBarHeightChange_ name:@"VideosExtrasMainTemplateBarHeightChangeNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasFeatureContainerViewController;
  [(VideosExtrasFeatureContainerViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasFeatureContainerViewController;
  [(VideosExtrasFeatureContainerViewController *)&v4 viewDidLoad];
  v3 = [(VideosExtrasFeatureContainerViewController *)self context];
  [v3 extrasRequestReloadWithContext:0];
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = [(VideosExtrasFeatureContainerViewController *)self childViewControllers];
  v3 = [v2 lastObject];

  return v3;
}

- (void)setVideoPlaybackViewController:(id)a3
{
  v5 = (VideosExtrasVideoPlaybackViewController *)a3;
  p_videoPlaybackViewController = &self->_videoPlaybackViewController;
  videoPlaybackViewController = self->_videoPlaybackViewController;
  if (videoPlaybackViewController != v5)
  {
    [(VideosExtrasVideoPlaybackViewController *)videoPlaybackViewController willMoveToParentViewController:0];
    v8 = [(VideosExtrasVideoPlaybackViewController *)*p_videoPlaybackViewController view];
    [v8 removeFromSuperview];

    [(VideosExtrasVideoPlaybackViewController *)*p_videoPlaybackViewController removeFromParentViewController];
    [(VideosExtrasVideoPlaybackViewController *)*p_videoPlaybackViewController setOverlayVisibilityChangeAnimationBlock:0];
    objc_storeStrong((id *)&self->_videoPlaybackViewController, a3);
    if (v5)
    {
      overlayViewAdjustmentConstraint = self->_overlayViewAdjustmentConstraint;
      if (overlayViewAdjustmentConstraint) {
        [(NSLayoutConstraint *)overlayViewAdjustmentConstraint setActive:0];
      }
      v10 = [(VideosExtrasFeatureContainerViewController *)self view];
      v11 = [(VideosExtrasVideoPlaybackViewController *)v5 view];
      [v10 bounds];
      objc_msgSend(v11, "setFrame:");
      [(VideosExtrasFeatureContainerViewController *)self addChildViewController:v5];
      v12 = [(VideosExtrasVideoPlaybackViewController *)v5 view];
      [v10 addSubview:v12];

      [(VideosExtrasVideoPlaybackViewController *)v5 didMoveToParentViewController:self];
      v13 = [(VideosExtrasVideoPlaybackViewController *)v5 overlayView];
      v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v13 attribute:4 relatedBy:0 toItem:v11 attribute:4 multiplier:1.0 constant:0.0];
      v15 = self->_overlayViewAdjustmentConstraint;
      self->_overlayViewAdjustmentConstraint = v14;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarView);
      if (WeakRetained)
      {
        [(NSLayoutConstraint *)self->_overlayViewAdjustmentConstraint setActive:1];
        id v17 = objc_loadWeakRetained((id *)&self->_menuBarView);
        [v13 alpha];
        objc_msgSend(v17, "setAlpha:");

        id v18 = objc_loadWeakRetained((id *)&self->_menuBarView);
        objc_msgSend(v18, "setHidden:", objc_msgSend(v13, "isHidden"));
      }
      objc_initWeak(&location, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke;
      v21[3] = &unk_1E6DF59E8;
      objc_copyWeak(&v22, &location);
      [(VideosExtrasVideoPlaybackViewController *)v5 setOverlayVisibilityChangeAnimationBlock:v21];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke_2;
      v19[3] = &unk_1E6DF59E8;
      objc_copyWeak(&v20, &location);
      [(VideosExtrasVideoPlaybackViewController *)v5 setOverlayVisibilityChangeAnimationCompletionBlock:v19];
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
}

void __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_super v4 = [WeakRetained navigationController];
    v5 = [v4 topViewController];

    id WeakRetained = v11;
    if (v5 == v11)
    {
      id v6 = objc_loadWeakRetained(v11 + 125);
      v7 = v6;
      if (a2)
      {
        double v8 = 0.0;
      }
      else
      {
        [v6 setHidden:0];

        objc_super v9 = [v11 navigationController];
        v10 = [v9 navigationBar];
        [v10 setHidden:0];

        id v6 = objc_loadWeakRetained(v11 + 125);
        v7 = v6;
        double v8 = 1.0;
      }
      [v6 setAlpha:v8];

      id WeakRetained = v11;
    }
  }
}

void __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v9 = WeakRetained;
    objc_super v4 = [WeakRetained navigationController];
    v5 = [v4 topViewController];

    id WeakRetained = v9;
    if (v5 == v9)
    {
      id v6 = objc_loadWeakRetained(v9 + 125);
      [v6 setHidden:a2];

      v7 = [v9 navigationController];
      double v8 = [v7 navigationBar];
      [v8 setHidden:a2];

      id WeakRetained = v9;
    }
  }
}

- (void)_menuBarHeightChange:(id)a3
{
  id v5 = [a3 object];
  [v5 floatValue];
  [(NSLayoutConstraint *)self->_overlayViewAdjustmentConstraint setConstant:(float)-v4];
}

- (void)setMenuBarView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarView);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_menuBarView);

    if (!v6)
    {
      [v4 frame];
      [(NSLayoutConstraint *)self->_overlayViewAdjustmentConstraint setConstant:-CGRectGetHeight(v8)];
    }
    objc_storeWeak((id *)&self->_menuBarView, v4);
    [(NSLayoutConstraint *)self->_overlayViewAdjustmentConstraint setActive:v4 != 0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__VideosExtrasFeatureContainerViewController_setMenuBarView___block_invoke;
    v7[3] = &unk_1E6DF3D58;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

void __61__VideosExtrasFeatureContainerViewController_setMenuBarView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  v3 = [*(id *)(*(void *)(a1 + 32) + 976) overlayView];
  [v3 alpha];
  objc_msgSend(WeakRetained, "setAlpha:");

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  id v4 = [*(id *)(*(void *)(a1 + 32) + 976) overlayView];
  objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "isHidden"));
}

- (VideosExtrasContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (VideosExtrasContext *)WeakRetained;
}

- (VideosExtrasVideoPlaybackViewController)videoPlaybackViewController
{
  return self->_videoPlaybackViewController;
}

- (UIView)menuBarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarView);
  return (UIView *)WeakRetained;
}

- (double)collectionViewHeight
{
  return self->_collectionViewHeight;
}

- (void)setCollectionViewHeight:(double)a3
{
  self->_collectionViewHeight = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuBarView);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_overlayViewAdjustmentConstraint, 0);
  objc_storeStrong((id *)&self->_videoPlaybackViewController, 0);
}

@end