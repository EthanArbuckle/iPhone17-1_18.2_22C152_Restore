@interface ICHandwritingDebugPillOrnamentViewController
- (ICHandwritingDebugDelegate)delegate;
- (ICHandwritingDebugPillOrnamentViewController)initWithRootViewController:(id)a3 delegate:(id)a4;
- (ICHandwritingDebugViewController)handwritingDebugViewController;
- (UINavigationController)handwritingDebugNavigationController;
- (void)refresh;
- (void)setHandwritingDebugNavigationController:(id)a3;
- (void)setHandwritingDebugViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICHandwritingDebugPillOrnamentViewController

- (ICHandwritingDebugPillOrnamentViewController)initWithRootViewController:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICHandwritingDebugPillOrnamentViewController;
  v7 = -[ICPillOrnamentViewController initWithRootViewController:contentAnchorPoint:sceneAnchorPoint:offset:cornerRadius:](&v13, sel_initWithRootViewController_contentAnchorPoint_sceneAnchorPoint_offset_cornerRadius_, a3, 0.0, 0.5, 1.0, 0.5, 24.0, 0.0, 32.0);
  if (v7)
  {
    v8 = [[ICHandwritingDebugViewController alloc] initWithDelegate:v6];
    handwritingDebugViewController = v7->_handwritingDebugViewController;
    v7->_handwritingDebugViewController = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7->_handwritingDebugViewController];
    handwritingDebugNavigationController = v7->_handwritingDebugNavigationController;
    v7->_handwritingDebugNavigationController = (UINavigationController *)v10;
  }
  return v7;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)ICHandwritingDebugPillOrnamentViewController;
  [(ICHandwritingDebugPillOrnamentViewController *)&v12 viewDidLoad];
  v3 = [(ICHandwritingDebugPillOrnamentViewController *)self handwritingDebugNavigationController];
  v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(ICHandwritingDebugPillOrnamentViewController *)self handwritingDebugNavigationController];
  [(ICHandwritingDebugPillOrnamentViewController *)self addChildViewController:v5];

  id v6 = [(ICPillOrnamentViewController *)self contentView];
  v7 = [(ICHandwritingDebugPillOrnamentViewController *)self handwritingDebugNavigationController];
  v8 = [v7 view];
  [v6 addSubview:v8];

  v9 = [(ICHandwritingDebugPillOrnamentViewController *)self handwritingDebugNavigationController];
  uint64_t v10 = [v9 view];
  objc_msgSend(v10, "ic_addAnchorsToFillSuperview");

  v11 = [(ICHandwritingDebugPillOrnamentViewController *)self handwritingDebugNavigationController];
  [v11 didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICHandwritingDebugPillOrnamentViewController;
  [(ICHandwritingDebugPillOrnamentViewController *)&v3 viewDidLayoutSubviews];
  -[ICPillOrnamentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 400.0, 600.0);
  [(ICHandwritingDebugPillOrnamentViewController *)self refresh];
}

- (ICHandwritingDebugDelegate)delegate
{
  v2 = [(ICHandwritingDebugPillOrnamentViewController *)self handwritingDebugViewController];
  objc_super v3 = [v2 delegate];

  return (ICHandwritingDebugDelegate *)v3;
}

- (void)refresh
{
  id v2 = [(ICHandwritingDebugPillOrnamentViewController *)self handwritingDebugViewController];
  [v2 refresh];
}

- (ICHandwritingDebugViewController)handwritingDebugViewController
{
  return self->_handwritingDebugViewController;
}

- (void)setHandwritingDebugViewController:(id)a3
{
}

- (UINavigationController)handwritingDebugNavigationController
{
  return self->_handwritingDebugNavigationController;
}

- (void)setHandwritingDebugNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingDebugNavigationController, 0);
  objc_storeStrong((id *)&self->_handwritingDebugViewController, 0);
}

@end