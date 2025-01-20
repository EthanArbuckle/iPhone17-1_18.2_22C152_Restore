@interface VUIViewController
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (_TtC8VideosUI17VUIViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI17VUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation VUIViewController

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  v2 = self;
  unsigned __int8 v3 = VUIViewController.shouldAutomaticallyForwardAppearanceMethods.getter();

  return v3 & 1;
}

- (void)updateViewConstraints
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  VUIViewController.updateViewConstraints()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  VUIViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  VUIViewController.viewDidLayoutSubviews()();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (UIViewController_optional *)OUTLINED_FUNCTION_8_8();
  VUIViewController.willMove(toParent:)(v6);
}

- (_TtC8VideosUI17VUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI17VUIViewController *)VUIViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (UIViewController_optional *)OUTLINED_FUNCTION_8_8();
  VUIViewController.didMove(toParent:)(v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  VUIViewController.viewDidDisappear(_:)(v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  VUIViewController.viewDidAppear(_:)(v4);
}

- (void)loadView
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  VUIViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  VUIViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  VUIViewController.viewWillAppear(_:)(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  VUIViewController.viewWillDisappear(_:)(v4);
}

- (_TtC8VideosUI17VUIViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI17VUIViewController *)VUIViewController.init(coder:)(a3);
}

@end