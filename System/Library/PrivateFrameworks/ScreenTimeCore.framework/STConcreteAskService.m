@interface STConcreteAskService
- (STAskServiceDelegate)delegate;
- (void)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation STConcreteAskService

- (void)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(STConcreteAskService *)self delegate];
  [v10 respondToAskForTimeRequestWithIdentifier:v9 answer:a4 completionHandler:v8];
}

- (STAskServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STAskServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end