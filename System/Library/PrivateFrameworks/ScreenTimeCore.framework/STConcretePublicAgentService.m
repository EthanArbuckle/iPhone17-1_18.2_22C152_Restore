@interface STConcretePublicAgentService
- (STPublicAgentServiceDelegate)delegate;
- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)requestConfigurationWithReplyHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation STConcretePublicAgentService

- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STConcretePublicAgentService *)self delegate];
  [v11 deleteAllWebApplicationHistory:v10 clientBundleURLWrapper:v9 replyHandler:v8];
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STConcretePublicAgentService *)self delegate];
  [v14 deleteWebHistoryDuringInterval:v13 webApplication:v12 clientBundleURLWrapper:v11 replyHandler:v10];
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STConcretePublicAgentService *)self delegate];
  [v14 deleteWebHistoryForURL:v13 webApplication:v12 clientBundleURLWrapper:v11 replyHandler:v10];
}

- (void)requestConfigurationWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STConcretePublicAgentService *)self delegate];
  [v5 requestConfigurationWithReplyHandler:v4];
}

- (STPublicAgentServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STPublicAgentServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end