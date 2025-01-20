@interface PSEnrollContainerViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)isModalInPresentation;
- (BiometricKitUIEnrollViewController)enrollController;
- (CGSize)preferredContentSize;
- (void)dealloc;
- (void)setEnrollController:(id)a3;
- (void)teardown;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSEnrollContainerViewController

- (void)dealloc
{
  [(PSEnrollContainerViewController *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)PSEnrollContainerViewController;
  [(PSEnrollContainerViewController *)&v3 dealloc];
}

- (void)teardown
{
  [(BiometricKitUIEnrollViewController *)self->_enrollController setDelegate:0];
  enrollController = self->_enrollController;
  self->_enrollController = 0;
}

- (BOOL)isModalInPresentation
{
  v2 = [(PSEnrollContainerViewController *)self enrollController];
  char v3 = [v2 isModalInPresentation];

  return v3;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PSEnrollContainerViewController;
  [(PSEnrollContainerViewController *)&v8 viewDidLoad];
  char v3 = [(PSEnrollContainerViewController *)self view];
  v4 = [MEMORY[0x263F825C8] whiteColor];
  [v3 setBackgroundColor:v4];

  v5 = objc_opt_new();
  [v5 configureWithTransparentBackground];
  v6 = [(PSEnrollContainerViewController *)self navigationItem];
  [v6 setScrollEdgeAppearance:v5];

  v7 = [(PSEnrollContainerViewController *)self navigationItem];
  [v7 setStandardAppearance:v5];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PSEnrollContainerViewController;
  [(PSEnrollContainerViewController *)&v12 viewWillAppear:a3];
  v4 = [(PSEnrollContainerViewController *)self enrollController];
  [(PSEnrollContainerViewController *)self addChildViewController:v4];

  v5 = [(PSEnrollContainerViewController *)self enrollController];
  v6 = [v5 view];
  v7 = [(PSEnrollContainerViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  objc_super v8 = [(PSEnrollContainerViewController *)self view];
  v9 = [(PSEnrollContainerViewController *)self enrollController];
  v10 = [v9 view];
  [v8 addSubview:v10];

  v11 = [(PSEnrollContainerViewController *)self enrollController];
  [v11 didMoveToParentViewController:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSEnrollContainerViewController;
  [(PSEnrollContainerViewController *)&v6 viewDidDisappear:a3];
  if (objc_opt_class())
  {
    v4 = [(PSEnrollContainerViewController *)self enrollController];
    [v4 beginAppearanceTransition:0 animated:1];
    [v4 willMoveToParentViewController:0];
    v5 = [v4 view];
    [v5 removeFromSuperview];

    [v4 removeFromParentViewController];
    [v4 endAppearanceTransition];
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PSEnrollContainerViewController;
  [(PSEnrollContainerViewController *)&v6 viewDidLayoutSubviews];
  char v3 = [(PSEnrollContainerViewController *)self enrollController];
  v4 = [v3 view];
  v5 = [(PSEnrollContainerViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (CGSize)preferredContentSize
{
  v2 = [(PSEnrollContainerViewController *)self enrollController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BiometricKitUIEnrollViewController)enrollController
{
  return self->_enrollController;
}

- (void)setEnrollController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end