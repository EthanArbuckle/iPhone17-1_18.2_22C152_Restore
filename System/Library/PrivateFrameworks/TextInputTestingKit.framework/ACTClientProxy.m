@interface ACTClientProxy
- (ACTClientProtocol)client;
- (ACTClientProxy)initWithClient:(id)a3;
- (void)closeRequestToken:(id)a3;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)pushCandidates:(id)a3 requestToken:(id)a4;
@end

@implementation ACTClientProxy

- (void).cxx_destruct
{
}

- (ACTClientProtocol)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (ACTClientProtocol *)WeakRetained;
}

- (void)closeRequestToken:(id)a3
{
  id v5 = a3;
  v4 = [(ACTClientProxy *)self client];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 closeRequestToken:v5];
  }
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ACTClientProxy *)self client];
  v8 = v7;
  if (v7) {
    [v7 pushCandidateResultSet:v9 requestToken:v6];
  }
}

- (void)pushCandidates:(id)a3 requestToken:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ACTClientProxy *)self client];
  v8 = v7;
  if (v7) {
    [v7 pushAutocorrections:v9 requestToken:v6];
  }
}

- (ACTClientProxy)initWithClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACTClientProxy;
  id v5 = [(ACTClientProxy *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_client, v4);
  }

  return v6;
}

@end