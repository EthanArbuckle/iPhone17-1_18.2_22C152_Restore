@interface SBDeviceApplicationSceneOverlayBasicWrapperViewController
- (BOOL)_canShowWhileLocked;
- (SBDeviceApplicationSceneOverlayBasicWrapperViewController)initWithContentViewController:(id)a3 rendersWhileLocked:(BOOL)a4 needsCounterRotation:(BOOL)a5;
- (SBDeviceApplicationSceneOverlayView)overlayView;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBDeviceApplicationSceneOverlayBasicWrapperViewController

- (SBDeviceApplicationSceneOverlayBasicWrapperViewController)initWithContentViewController:(id)a3 rendersWhileLocked:(BOOL)a4 needsCounterRotation:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  v10 = [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_rendersWhileLocked = a4;
    objc_storeStrong((id *)&v10->_contentViewController, a3);
    v11->_needsCounterRotation = a5;
  }

  return v11;
}

- (void)loadView
{
  v3 = [[SBDeviceApplicationSceneOverlayBasicWrapperView alloc] initWithCounterRotationRequirement:self->_needsCounterRotation];
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = v3;

  v5 = self->_contentWrapperView;
  [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)self setView:v5];
}

- (SBDeviceApplicationSceneOverlayView)overlayView
{
  [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)self loadViewIfNeeded];
  contentWrapperView = self->_contentWrapperView;
  return (SBDeviceApplicationSceneOverlayView *)contentWrapperView;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  v5 = [(UIViewController *)self->_contentViewController view];
  [(UIViewController *)self->_contentViewController beginAppearanceTransition:1 animated:v3];
  [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)self addChildViewController:self->_contentViewController];
  [(SBDeviceApplicationSceneOverlayBasicWrapperView *)self->_contentWrapperView addSubview:v5];
  [(SBDeviceApplicationSceneOverlayBasicWrapperView *)self->_contentWrapperView bounds];
  objc_msgSend(v5, "setFrame:");
  [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)&v4 viewDidAppear:a3];
  [(UIViewController *)self->_contentViewController endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  [(UIViewController *)self->_contentViewController beginAppearanceTransition:0 animated:v3];
  [(UIViewController *)self->_contentViewController willMoveToParentViewController:0];
  v5 = [(UIViewController *)self->_contentViewController view];
  [v5 removeFromSuperview];

  [(UIViewController *)self->_contentViewController removeFromParentViewController];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)&v4 viewDidDisappear:a3];
  [(UIViewController *)self->_contentViewController endAppearanceTransition];
  [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)self setView:0];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperViewController;
  [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)&v4 viewDidLayoutSubviews];
  BOOL v3 = [(UIViewController *)self->_contentViewController view];
  [(SBDeviceApplicationSceneOverlayBasicWrapperView *)self->_contentWrapperView bounds];
  objc_msgSend(v3, "setFrame:");
}

- (BOOL)_canShowWhileLocked
{
  return self->_rendersWhileLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end