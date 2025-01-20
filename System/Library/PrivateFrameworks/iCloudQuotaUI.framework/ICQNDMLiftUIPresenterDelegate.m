@interface ICQNDMLiftUIPresenterDelegate
- (ICQNDMLiftUIPresenterDelegate)initWithPresentingViewController:(id)a3;
- (UIViewController)presentingViewController;
- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5;
- (void)liftUIPresenter:(id)a3 performAction:(int64_t)a4 parameters:(id)a5 completion:(id)a6;
- (void)liftUIPresenterDidCancel:(id)a3;
- (void)liftUIPresenterDidComplete:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICQNDMLiftUIPresenterDelegate

- (ICQNDMLiftUIPresenterDelegate)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v5 = [(ICQNDMLiftUIPresenterDelegate *)self init];
  [(ICQNDMLiftUIPresenterDelegate *)v5 setPresentingViewController:v4];

  return v5;
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  id v3 = [(ICQNDMLiftUIPresenterDelegate *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)liftUIPresenterDidComplete:(id)a3
{
  id v3 = [(ICQNDMLiftUIPresenterDelegate *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = _ICQGetLogSystem();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICQNDMLiftUIPresenterDelegate liftUIPresenter:didLoadWithSuccess:error:]((uint64_t)v7, v9);
    }

    v9 = [(ICQNDMLiftUIPresenterDelegate *)self presentingViewController];
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = @"NO";
    if (v5) {
      v10 = @"YES";
    }
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Loaded NDM LiftUI with success %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)liftUIPresenter:(id)a3 performAction:(int64_t)a4 parameters:(id)a5 completion:(id)a6
{
  v10 = (void (**)(id, uint64_t, void))a6;
  if (a4 == 101)
  {
    v9 = [(ICQNDMLiftUIPresenterDelegate *)self presentingViewController];
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    v10[2](v10, [MEMORY[0x263F88908] performAction:a4 parameters:a5 options:0], 0);
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)liftUIPresenter:(uint64_t)a1 didLoadWithSuccess:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Could not load NDM LiftUI with error %@", (uint8_t *)&v2, 0xCu);
}

@end