@interface MCDAlertController
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation MCDAlertController

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCDAlertController;
  [(MCDAlertController *)&v9 viewDidAppear:a3];
  v4 = [(MCDAlertController *)self presentingViewController];
  v5 = [v4 view];
  presentingViewControllerView = self->_presentingViewControllerView;
  self->_presentingViewControllerView = v5;

  v7 = self->_presentingViewControllerView;
  uint64_t v8 = objc_opt_class();
  MCDSetChargeOnDescendantsOfView(v7, v8, 0.0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCDAlertController;
  [(MCDAlertController *)&v7 viewDidDisappear:a3];
  presentingViewControllerView = self->_presentingViewControllerView;
  uint64_t v5 = objc_opt_class();
  MCDSetChargeOnDescendantsOfView(presentingViewControllerView, v5, -0.9);
  v6 = self->_presentingViewControllerView;
  self->_presentingViewControllerView = 0;
}

- (void).cxx_destruct
{
}

@end