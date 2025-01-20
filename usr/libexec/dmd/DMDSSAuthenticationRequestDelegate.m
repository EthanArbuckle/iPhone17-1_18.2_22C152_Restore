@interface DMDSSAuthenticationRequestDelegate
+ (double)timeout;
+ (id)delegateWithAuthenticationContext:(id)a3;
- (SSAccount)authenticatedAccount;
- (id)_storeLoginFailedError;
- (void)authenticateRequest:(id)a3 didReceiveResponse:(id)a4;
- (void)setAuthenticatedAccount:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation DMDSSAuthenticationRequestDelegate

+ (id)delegateWithAuthenticationContext:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)SSAuthenticateRequest) initWithAuthenticationContext:v3];

  v5 = [(DMDSSRequestDelegate *)[DMDSSAuthenticationRequestDelegate alloc] initWithRequest:v4];

  return v5;
}

+ (double)timeout
{
  return 900.0;
}

- (id)_storeLoginFailedError
{
  if (qword_1000FBCE8 != -1) {
    dispatch_once(&qword_1000FBCE8, &stru_1000CBDB0);
  }
  v2 = (void *)qword_1000FBCE0;

  return v2;
}

- (void)startWithCompletionBlock:(id)a3
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100071858;
  v16[3] = &unk_1000CB430;
  id v4 = a3;
  id v17 = v4;
  v5 = objc_retainBlock(v16);
  v6 = +[MCProfileConnection sharedConnection];
  unsigned int v7 = [v6 appWhitelistState];

  if (v7) {
    BOOL v8 = v7 == 6;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      id v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@ starting user authentication.", buf, 0xCu);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100071870;
    v14[3] = &unk_1000CAB70;
    v14[4] = self;
    v15 = v5;
    v13.receiver = self;
    v13.super_class = (Class)DMDSSAuthenticationRequestDelegate;
    [(DMDSSRequestDelegate *)&v13 startWithCompletionBlock:v14];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not prompting for iTunes account in limited apps mode.", buf, 2u);
    }
    v12 = [(DMDSSAuthenticationRequestDelegate *)self _storeLoginFailedError];
    ((void (*)(void *, void *, void))v5[2])(v5, v12, 0);
  }
}

- (void)authenticateRequest:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  if ([v5 authenticateResponseType] == (id)4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User successfully logged into iTunes account.", v7, 2u);
    }
    v6 = [v5 authenticatedAccount];
    [(DMDSSAuthenticationRequestDelegate *)self setAuthenticatedAccount:v6];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100087F20(v5);
  }
}

- (SSAccount)authenticatedAccount
{
  return self->_authenticatedAccount;
}

- (void)setAuthenticatedAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end