@interface NCNotificationManagementAlertController
- (BOOL)shouldAutorotate;
- (NCNotificationManagementAlertController)initWithRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5;
- (NCNotificationManagementControllerSettingsDelegate)settingsDelegate;
- (NCNotificationRequest)request;
- (void)setRequest:(id)a3;
- (void)setSettingsDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation NCNotificationManagementAlertController

- (NCNotificationManagementAlertController)initWithRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationManagementAlertController;
  v9 = [(NCNotificationManagementAlertController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(NCNotificationManagementAlertController *)v9 setPreferredStyle:0];
    [(NCNotificationManagementAlertController *)v10 setRequest:v7];
    [(NCNotificationManagementAlertController *)v10 setSettingsDelegate:v8];
  }

  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationManagementAlertController;
  [(NCNotificationManagementAlertController *)&v3 viewDidLoad];
  [(NCNotificationManagementAlertController *)self _configureView];
}

- (BOOL)shouldAutorotate
{
  objc_super v3 = [(NCNotificationManagementAlertController *)self presentingViewController];
  if (v3)
  {
    v4 = [(NCNotificationManagementAlertController *)self presentingViewController];
    char v5 = [v4 shouldAutorotate];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (NCNotificationManagementControllerSettingsDelegate)settingsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsDelegate);

  return (NCNotificationManagementControllerSettingsDelegate *)WeakRetained;
}

- (void)setSettingsDelegate:(id)a3
{
}

- (NCNotificationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_destroyWeak((id *)&self->_settingsDelegate);
}

@end