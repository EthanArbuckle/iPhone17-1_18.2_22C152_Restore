@interface SMUPasswordController
- (SMUPasswordController)initWithTitle:(id)a3 passwordLength:(int64_t)a4 supportedOrientations:(unint64_t)a5;
- (UIViewController)viewController;
- (id)passwordEnteredHandler;
- (id)passwordEntryCancelledHandler;
- (void)alertController:(id)a3 enteredText:(id)a4;
- (void)alertControllerCancelled:(id)a3;
- (void)dismiss;
- (void)setPasswordEnteredHandler:(id)a3;
- (void)setPasswordEntryCancelledHandler:(id)a3;
@end

@implementation SMUPasswordController

- (SMUPasswordController)initWithTitle:(id)a3 passwordLength:(int64_t)a4 supportedOrientations:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SMUPasswordController;
  v9 = [(SMUPasswordController *)&v13 init];
  if (v9)
  {
    v10 = [(TVRAlertController *)[SMUPasswordAlertController alloc] initWithTitle:v8 passcodeSize:a4];
    alertController = v9->_alertController;
    v9->_alertController = v10;

    [(TVRAlertController *)v9->_alertController setDelegate:v9];
    [(SMUPasswordAlertController *)v9->_alertController setSupportedOrientations:a5];
  }

  return v9;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_alertController;
}

- (void)dismiss
{
}

- (void)alertController:(id)a3 enteredText:(id)a4
{
  passwordEnteredHandler = (void (**)(id, id))self->_passwordEnteredHandler;
  if (passwordEnteredHandler) {
    passwordEnteredHandler[2](passwordEnteredHandler, a4);
  }
}

- (void)alertControllerCancelled:(id)a3
{
  passwordEntryCancelledHandler = (void (**)(void))self->_passwordEntryCancelledHandler;
  if (passwordEntryCancelledHandler) {
    passwordEntryCancelledHandler[2]();
  }
}

- (id)passwordEnteredHandler
{
  return self->_passwordEnteredHandler;
}

- (void)setPasswordEnteredHandler:(id)a3
{
}

- (id)passwordEntryCancelledHandler
{
  return self->_passwordEntryCancelledHandler;
}

- (void)setPasswordEntryCancelledHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passwordEntryCancelledHandler, 0);
  objc_storeStrong(&self->_passwordEnteredHandler, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end