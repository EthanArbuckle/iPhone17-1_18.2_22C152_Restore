@interface PMTOTPMigrationController
- (NSArray)totpGenerators;
- (PMTOTPMigrationController)initWithMigrationURL:(id)a3;
- (PMTOTPMigrationControllerDelegate)delegate;
- (UIViewController)viewController;
- (int64_t)numberOfCodes;
- (void)addGenerator:(id)a3 toSavedAccount:(id)a4;
- (void)setDelegate:(id)a3;
- (void)totpMigrationController:(id)a3 presentDetailsForSavedAccount:(id)a4;
- (void)totpMigrationController:(id)a3 presentPickerForGenerator:(id)a4;
- (void)totpMigrationControllerFinishedImport:(id)a3;
@end

@implementation PMTOTPMigrationController

- (PMTOTPMigrationController)initWithMigrationURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PMTOTPMigrationController;
  v5 = [(PMTOTPMigrationController *)&v10 init];
  if (v5
    && (v6 = [[_TtC17PasswordManagerUI26_PMTOTPMigrationController alloc] initWithMigrationURL:v4 delegate:v5], controller = v5->_controller, v5->_controller = v6, controller, v5->_controller))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (UIViewController)viewController
{
  return [(_PMTOTPMigrationController *)self->_controller viewController];
}

- (void)addGenerator:(id)a3 toSavedAccount:(id)a4
{
}

- (int64_t)numberOfCodes
{
  return [(_PMTOTPMigrationController *)self->_controller numberOfCodes];
}

- (NSArray)totpGenerators
{
  return [(_PMTOTPMigrationController *)self->_controller totpGenerators];
}

- (void)totpMigrationControllerFinishedImport:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained totpMigrationControllerFinishedImport:self];
  }
}

- (void)totpMigrationController:(id)a3 presentDetailsForSavedAccount:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained totpMigrationController:self presentDetailsForSavedAccount:v6];
  }
}

- (void)totpMigrationController:(id)a3 presentPickerForGenerator:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained totpMigrationController:self presentPickerForGenerator:v6];
  }
}

- (PMTOTPMigrationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PMTOTPMigrationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end