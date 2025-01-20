@interface EVOnboardingBaseViewController
- (EVOnboardingBaseViewController)initWithDelegate:(id)a3;
- (OBBaseWelcomeController)obViewController;
- (void)setObViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EVOnboardingBaseViewController

- (EVOnboardingBaseViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EVOnboardingBaseViewController;
  v5 = [(EVOnboardingBaseViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)EVOnboardingBaseViewController;
  [(EVOnboardingBaseViewController *)&v12 viewDidLoad];
  v3 = [(EVOnboardingBaseViewController *)self obViewController];
  [(EVOnboardingBaseViewController *)self addChildViewController:v3];
  id v4 = [(EVOnboardingBaseViewController *)self view];
  v5 = [v3 view];
  [v4 addSubview:v5];

  [v3 didMoveToParentViewController:self];
  v6 = [v3 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [v3 view];
  objc_super v8 = [(EVOnboardingBaseViewController *)self view];
  LODWORD(v9) = 1148846080;
  v10 = [v7 _maps_constraintsEqualToEdgesOfView:v8 priority:v9];
  v11 = [v10 allConstraints];
  +[NSLayoutConstraint activateConstraints:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EVOnboardingBaseViewController;
  -[EVOnboardingBaseViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = [(EVOnboardingBaseViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    objc_super v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EVOnboardingBaseViewController;
  [(EVOnboardingBaseViewController *)&v8 viewWillDisappear:a3];
  id v4 = [(EVOnboardingBaseViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
  if ([(EVOnboardingBaseViewController *)self isMovingFromParentViewController])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained onboardingViewControllerWillMoveFromParentViewController:self];
  }
}

- (OBBaseWelcomeController)obViewController
{
  [(EVOnboardingBaseViewController *)self doesNotRecognizeSelector:a2];
  obViewController = self->_obViewController;

  return obViewController;
}

- (void)setObViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end