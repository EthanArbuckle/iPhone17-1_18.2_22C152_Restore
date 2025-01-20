@interface AppleConnectSSOAuthenticator
- (ASAuthorizationController)authenticationController;
- (AppleConnectSSOAuthenticatorDelegate)delegate;
- (NSString)appIdentifier;
- (NSString)envIdentifier;
- (id)queryItemsWithParameters:(id)a3;
- (void)authenticate;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)setAppIdentifier:(id)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvIdentifier:(id)a3;
@end

@implementation AppleConnectSSOAuthenticator

- (id)queryItemsWithParameters:(id)a3
{
  id v3 = a3;
  +[NSMutableArray array];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100A8A718;
  v10 = &unk_101315E38;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = &stru_101315E10;
  id v4 = v11;
  [v3 enumerateKeysAndObjectsUsingBlock:&v7];

  id v5 = [v4 copy:v7, v8, v9, v10];

  return v5;
}

- (void)authenticate
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(AppleConnectSSOAuthenticator *)self appIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"applicationIdentifier"];

  id v5 = [(AppleConnectSSOAuthenticator *)self envIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"environmentIdentifier"];

  CFStringRef v24 = @"DAWRequest";
  v6 = [&__kCFBooleanTrue stringValue];
  v25 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  uint64_t v8 = objc_opt_new();
  v9 = [(AppleConnectSSOAuthenticator *)self queryItemsWithParameters:v7];
  [v8 setQueryItems:v9];

  v10 = [v8 percentEncodedQuery];
  [v3 setObject:v10 forKeyedSubscript:@"otherParameters"];

  id v11 = +[NSURL URLWithString:@"https://sso.corp.apple.com/authenticate"];
  v12 = +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:v11];
  unsigned int v13 = [v12 canPerformAuthorization];
  uint64_t v14 = [v12 url];
  v15 = (void *)v14;
  if (v13)
  {
    NSLog(@"INFO: Will authenticate with provider URL: %@.", v14);

    v16 = [v12 createRequest];
    v17 = [(AppleConnectSSOAuthenticator *)self queryItemsWithParameters:v3];
    [v16 setAuthorizationOptions:v17];

    id v18 = objc_alloc((Class)ASAuthorizationController);
    v23 = v16;
    v19 = +[NSArray arrayWithObjects:&v23 count:1];
    id v20 = [v18 initWithAuthorizationRequests:v19];
    [(AppleConnectSSOAuthenticator *)self setAuthenticationController:v20];

    v21 = [(AppleConnectSSOAuthenticator *)self authenticationController];
    [v21 setDelegate:self];

    v22 = [(AppleConnectSSOAuthenticator *)self authenticationController];
    [v22 performRequests];
  }
  else
  {
    NSLog(@"ERROR: Can't authenticate with provider URL: %@.", v14);

    v16 = +[NSError errorWithDomain:@"AppleConnectErrorDomain" code:-105 userInfo:0];
    v22 = [(AppleConnectSSOAuthenticator *)self delegate];
    [v22 authenticator:self didCompleteWithError:v16];
  }
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5 = a4;
  v6 = [v5 credential];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 credential];
    uint64_t v8 = [v7 authenticatedResponse];
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = [AppleConnectSSOResult alloc];
  v10 = [v8 allHeaderFields];
  id v11 = [(AppleConnectSSOResult *)v9 initWithResponse:v10];

  if (v11)
  {
    v12 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Authentication did succeed.", v15, 2u);
    }

    unsigned int v13 = [(AppleConnectSSOAuthenticator *)self delegate];
    [v13 authenticator:self didCompleteWithResult:v11];
  }
  else
  {
    unsigned int v13 = +[NSError errorWithDomain:@"AppleConnectErrorDomain" code:-99999 userInfo:0];
    uint64_t v14 = [(AppleConnectSSOAuthenticator *)self delegate];
    [v14 authenticator:self didCompleteWithError:v13];
  }
  [(AppleConnectSSOAuthenticator *)self setAuthenticationController:0];
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = a4;
  v6 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Authentication did fail with error: %@.", (uint8_t *)&v8, 0xCu);
  }

  v7 = [(AppleConnectSSOAuthenticator *)self delegate];
  [v7 authenticator:self didCompleteWithError:v5];

  [(AppleConnectSSOAuthenticator *)self setAuthenticationController:0];
}

- (AppleConnectSSOAuthenticatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AppleConnectSSOAuthenticatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)envIdentifier
{
  return self->_envIdentifier;
}

- (void)setEnvIdentifier:(id)a3
{
}

- (ASAuthorizationController)authenticationController
{
  return self->_authenticationController;
}

- (void)setAuthenticationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_envIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end