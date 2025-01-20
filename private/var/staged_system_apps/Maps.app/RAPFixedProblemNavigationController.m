@interface RAPFixedProblemNavigationController
+ (id)fixedProblemNavigationControllerWithProblemStatusResponse:(id)a3;
- (RAPFixedProblemViewController)fixedProblemViewController;
- (id)doneHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)handleDone:(id)a3;
- (void)setDoneHandler:(id)a3;
- (void)setFixedProblemViewController:(id)a3;
@end

@implementation RAPFixedProblemNavigationController

+ (id)fixedProblemNavigationControllerWithProblemStatusResponse:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RAPFixedProblemViewController);
  [(RAPFixedProblemViewController *)v4 setProblemStatusResponse:v3];

  v5 = [[RAPFixedProblemNavigationController alloc] initWithRootViewController:v4];
  [(RAPFixedProblemNavigationController *)v5 setFixedProblemViewController:v4];

  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)handleDone:(id)a3
{
  id v3 = [(RAPFixedProblemNavigationController *)self doneHandler];
  v3[2]();
}

- (id)doneHandler
{
  return self->_doneHandler;
}

- (void)setDoneHandler:(id)a3
{
}

- (RAPFixedProblemViewController)fixedProblemViewController
{
  return self->_fixedProblemViewController;
}

- (void)setFixedProblemViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong((id *)&self->_fixedProblemViewController, 0);

  objc_storeStrong(&self->doneHandler, 0);
}

@end