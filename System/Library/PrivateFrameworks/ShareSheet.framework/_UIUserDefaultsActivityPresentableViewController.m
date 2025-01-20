@interface _UIUserDefaultsActivityPresentableViewController
- (UIViewController)navigationController;
- (UIViewController)userDefaultsViewController;
- (_UIUserDefaultsActivityPresentableViewController)initWithUserDefaultsViewController:(id)a3;
- (void)_loadNavigationController;
- (void)setNavigationController:(id)a3;
- (void)setUserDefaultsViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UIUserDefaultsActivityPresentableViewController

- (_UIUserDefaultsActivityPresentableViewController)initWithUserDefaultsViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIUserDefaultsActivityPresentableViewController;
  v5 = [(_UIUserDefaultsActivityPresentableViewController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(_UIUserDefaultsActivityPresentableViewController *)v5 setUserDefaultsViewController:v4];
    [(_UIUserDefaultsActivityPresentableViewController *)v6 setModalPresentationCapturesStatusBarAppearance:1];
    [(_UIUserDefaultsActivityPresentableViewController *)v6 setModalPresentationStyle:5];
    v7 = [(_UIUserDefaultsActivityPresentableViewController *)v6 view];
    [v7 setTintAdjustmentMode:1];
  }
  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)_UIUserDefaultsActivityPresentableViewController;
  [(_UIUserDefaultsActivityPresentableViewController *)&v3 viewDidLoad];
  [(_UIUserDefaultsActivityPresentableViewController *)self _loadNavigationController];
}

- (void)_loadNavigationController
{
  v27[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [_UIUserDefaultsActivityNavigationController alloc];
  id v4 = [(_UIUserDefaultsActivityPresentableViewController *)self userDefaultsViewController];
  v5 = [(_UIUserDefaultsActivityNavigationController *)v3 initWithRootViewController:v4];

  v6 = [(_UIUserDefaultsActivityNavigationController *)v5 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_UIUserDefaultsActivityNavigationController *)v5 willMoveToParentViewController:self];
  v26 = v5;
  [(_UIUserDefaultsActivityPresentableViewController *)self addChildViewController:v5];
  v7 = [(_UIUserDefaultsActivityPresentableViewController *)self view];
  [v7 addSubview:v6];

  [(_UIUserDefaultsActivityNavigationController *)v5 didMoveToParentViewController:self];
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v24 = [v6 topAnchor];
  v25 = [(_UIUserDefaultsActivityPresentableViewController *)self view];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[0] = v22;
  v20 = [v6 bottomAnchor];
  v21 = [(_UIUserDefaultsActivityPresentableViewController *)self view];
  v19 = [v21 bottomAnchor];
  v17 = [v20 constraintEqualToAnchor:v19];
  v27[1] = v17;
  v8 = [v6 leftAnchor];
  objc_super v9 = [(_UIUserDefaultsActivityPresentableViewController *)self view];
  v10 = [v9 leftAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v27[2] = v11;
  v12 = [v6 rightAnchor];
  v13 = [(_UIUserDefaultsActivityPresentableViewController *)self view];
  v14 = [v13 rightAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v27[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v18 activateConstraints:v16];
}

- (UIViewController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (UIViewController)userDefaultsViewController
{
  return self->_userDefaultsViewController;
}

- (void)setUserDefaultsViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end