@interface ICTrailingSidebarSplitViewController
- (BOOL)isTransitioning;
- (BOOL)shouldRenderAsOverlay;
- (ICTrailingSidebarSplitViewController)initWithViewControllerManager:(id)a3;
- (ICViewControllerManager)viewControllerManager;
- (UIViewController)contentViewController;
- (UIViewController)sidebarViewController;
- (void)setContentViewController:(id)a3;
- (void)setSidebarHidden:(BOOL)a3;
- (void)setSidebarViewController:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setViewControllerManager:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICTrailingSidebarSplitViewController

- (ICTrailingSidebarSplitViewController)initWithViewControllerManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTrailingSidebarSplitViewController;
  v5 = [(ICTrailingSidebarSplitViewController *)&v8 initWithStyle:1];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_viewControllerManager, v4);
  }

  return v6;
}

- (void)setSidebarViewController:(id)a3
{
}

- (void)setContentViewController:(id)a3
{
}

- (UIViewController)contentViewController
{
  return (UIViewController *)[(ICTrailingSidebarSplitViewController *)self viewControllerForColumn:2];
}

- (UIViewController)sidebarViewController
{
  return (UIViewController *)[(ICTrailingSidebarSplitViewController *)self viewControllerForColumn:0];
}

- (void)setSidebarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICTrailingSidebarSplitViewController *)self setTransitioning:1];
  if (v3) {
    [(ICTrailingSidebarSplitViewController *)self hideColumn:0];
  }
  else {
    [(ICTrailingSidebarSplitViewController *)self showColumn:0];
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000968DC;
  v5[3] = &unk_100625AF0;
  v5[4] = self;
  [(ICTrailingSidebarSplitViewController *)self ic_performBlockAfterActiveTransition:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICTrailingSidebarSplitViewController;
  -[ICSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096984;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldRenderAsOverlay
{
  BOOL v3 = [(ICTrailingSidebarSplitViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  if (v7 > v5) {
    return 1;
  }
  objc_super v8 = [(ICTrailingSidebarSplitViewController *)self view];
  unsigned __int8 v9 = [v8 ic_hasCompactSize];

  return v9;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (void)setViewControllerManager:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (void).cxx_destruct
{
}

@end