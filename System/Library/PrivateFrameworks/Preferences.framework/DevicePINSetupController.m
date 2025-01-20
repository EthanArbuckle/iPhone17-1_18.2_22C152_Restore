@interface DevicePINSetupController
- (BOOL)allowOptionsButton;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)popupStyleIsModal;
- (BOOL)success;
- (CGSize)preferredContentSize;
- (DevicePINSetupController)init;
- (void)setAllowOptionsButton:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
@end

@implementation DevicePINSetupController

- (DevicePINSetupController)init
{
  v4.receiver = self;
  v4.super_class = (Class)DevicePINSetupController;
  v2 = [(PSSetupController *)&v4 init];
  if (v2 && (PSUsePadStylePIN() & 1) == 0) {
    [(DevicePINSetupController *)v2 setModalPresentationStyle:0];
  }
  return v2;
}

- (BOOL)success
{
  v2 = [(DevicePINSetupController *)self topViewController];
  char v3 = [v2 success];

  return v3;
}

- (BOOL)popupStyleIsModal
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (CGSize)preferredContentSize
{
  char v3 = [(PSSetupController *)self controller];

  if (v3)
  {
    objc_super v4 = [(PSSetupController *)self controller];
    [v4 preferredContentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setAllowOptionsButton:self->_allowOptionsButton];
  }
  v7.receiver = self;
  v7.super_class = (Class)DevicePINSetupController;
  [(PSSetupController *)&v7 showController:v6 animate:v4];
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)allowOptionsButton
{
  return self->_allowOptionsButton;
}

- (void)setAllowOptionsButton:(BOOL)a3
{
  self->_allowOptionsButton = a3;
}

@end