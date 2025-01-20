@interface DMDEngineRegisterConfigurationSourceOperation
- (DMDEngineRegisterConfigurationSourceOperationDelegate)delegate;
- (DMFRegisterConfigurationSourceRequest)request;
- (NSString)clientIdentifier;
- (void)delegateUpdatedDeclarationSourceAndEndOperation:(id)a3;
- (void)main;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineRegisterConfigurationSourceOperation

- (void)main
{
  v3 = [(DMDEngineDatabaseOperation *)self database];
  id v4 = [v3 newBackgroundContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004508C;
  v6[3] = &unk_1000C9BE0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)delegateUpdatedDeclarationSourceAndEndOperation:(id)a3
{
  id v8 = a3;
  if (!+[NSThread isMainThread])
  {
    v6 = +[NSAssertionHandler currentHandler];
    id v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"DMDEngineRegisterConfigurationSourceOperation.m", 97, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  id v5 = [(DMDEngineRegisterConfigurationSourceOperation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 registerConfigurationSourceOperation:self didUpdateRegistrationForConfigurationSource:v8];
  }
  [(DMDEngineRegisterConfigurationSourceOperation *)self setResultObject:0];
}

- (DMDEngineRegisterConfigurationSourceOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DMDEngineRegisterConfigurationSourceOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMFRegisterConfigurationSourceRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end