@interface STConcreteSetupService
- (STSetupServiceDelegate)delegate;
- (void)applyUpdatedConfiguration:(id)a3 completionHandler:(id)a4;
- (void)currentConfigurationForUser:(id)a3 completionHandler:(id)a4;
- (void)promptForPasscodeFromUserWithEndpoint:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation STConcreteSetupService

- (void)currentConfigurationForUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteSetupService *)self delegate];
  [v8 currentConfigurationForUser:v7 completionHandler:v6];
}

- (void)applyUpdatedConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteSetupService *)self delegate];
  [v8 applyUpdatedConfiguration:v7 completionHandler:v6];
}

- (void)promptForPasscodeFromUserWithEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteSetupService *)self delegate];
  [v8 promptForPasscodeFromUserWithEndpoint:v7 completionHandler:v6];
}

- (STSetupServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STSetupServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end