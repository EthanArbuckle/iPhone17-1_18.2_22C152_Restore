@interface TPSAppViewController
- (BOOL)viewDidAppeared;
- (BOOL)viewWillAppear;
- (TPSAppViewController)initWithAppController:(id)a3;
- (TPSAppViewControllerViewCycleDelegate)viewCycleDelegate;
- (TPSUIAppController)appController;
- (unint64_t)supportedInterfaceOrientations;
- (void)setAppController:(id)a3;
- (void)setViewCycleDelegate:(id)a3;
- (void)setViewDidAppeared:(BOOL)a3;
- (void)setViewWillAppear:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TPSAppViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom]) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (TPSAppViewController)initWithAppController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAppViewController;
  v6 = [(TPSViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appController, a3);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAppViewController;
  [(TPSAppViewController *)&v5 viewWillAppear:a3];
  self->_viewWillAppear = 1;
  v4 = [(TPSAppViewController *)self viewCycleDelegate];
  [v4 appViewControllerViewWillAppear:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSAppViewController;
  [(TPSAppViewController *)&v4 viewDidAppear:a3];
  self->_viewDidAppeared = 1;
}

- (TPSAppViewControllerViewCycleDelegate)viewCycleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewCycleDelegate);

  return (TPSAppViewControllerViewCycleDelegate *)WeakRetained;
}

- (void)setViewCycleDelegate:(id)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAppViewController;
  [(TPSAppViewController *)&v5 viewWillDisappear:a3];
  self->_viewWillAppear = 0;
  objc_super v4 = [(TPSAppViewController *)self viewCycleDelegate];
  [v4 appViewControllerViewWillDisappear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSAppViewController;
  [(TPSAppViewController *)&v4 viewDidDisappear:a3];
  self->_viewDidAppeared = 0;
}

- (BOOL)viewWillAppear
{
  return self->_viewWillAppear;
}

- (void)setViewWillAppear:(BOOL)a3
{
  self->_viewWillAppear = a3;
}

- (BOOL)viewDidAppeared
{
  return self->_viewDidAppeared;
}

- (void)setViewDidAppeared:(BOOL)a3
{
  self->_viewDidAppeared = a3;
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appController, 0);

  objc_destroyWeak((id *)&self->_viewCycleDelegate);
}

@end