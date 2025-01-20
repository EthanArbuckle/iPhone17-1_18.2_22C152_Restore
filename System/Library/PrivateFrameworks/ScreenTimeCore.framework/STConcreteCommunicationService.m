@interface STConcreteCommunicationService
- (STCommunicationServiceDelegate)delegate;
- (void)authenticatePasscodeForUserWithEndpoint:(id)a3 completionHandler:(id)a4;
- (void)currentCommunicationConfigurationWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation STConcreteCommunicationService

- (void)currentCommunicationConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STConcreteCommunicationService *)self delegate];
  [v5 currentCommunicationConfigurationWithCompletionHandler:v4];
}

- (STCommunicationServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STCommunicationServiceDelegate *)WeakRetained;
}

- (void)authenticatePasscodeForUserWithEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteCommunicationService *)self delegate];
  [v8 authenticatePasscodeForUserWithEndpoint:v7 completionHandler:v6];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end