@interface PDNetworkConnectionTask
- (id)request;
- (void)_destroyConnectionManager;
- (void)_handleConnectionFailureWithError:(id)a3;
- (void)_handleConnectionSuccessWithResponse:(id)a3 data:(id)a4;
- (void)_startConnection:(BOOL)a3;
- (void)dealloc;
- (void)performCancel;
- (void)performReset;
- (void)performStart:(BOOL)a3;
@end

@implementation PDNetworkConnectionTask

- (void)dealloc
{
  [(PDNetworkConnectionTask *)self _destroyConnectionManager];
  v3.receiver = self;
  v3.super_class = (Class)PDNetworkConnectionTask;
  [(PDNetworkConnectionTask *)&v3 dealloc];
}

- (void)performStart:(BOOL)a3
{
}

- (void)performCancel
{
}

- (void)performReset
{
  v3.receiver = self;
  v3.super_class = (Class)PDNetworkConnectionTask;
  [(PDNetworkTask *)&v3 performReset];
  [(PDNetworkConnectionTask *)self _destroyConnectionManager];
}

- (void)_startConnection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(PDSecureConnectionManager);
  connectionManager = self->_connectionManager;
  self->_connectionManager = v5;

  objc_initWeak(&location, self);
  v7 = self->_connectionManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001CD49C;
  v15[3] = &unk_10073DE18;
  objc_copyWeak(&v16, &location);
  [(PDSecureConnectionManager *)v7 setSuccessHandler:v15];
  v8 = self->_connectionManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001CD514;
  v13[3] = &unk_100737480;
  objc_copyWeak(&v14, &location);
  [(PDSecureConnectionManager *)v8 setFailureHandler:v13];
  v9 = [(PDNetworkConnectionTask *)self request];
  [v9 setAllowsCellularAccess:v3];
  uint64_t v10 = PKAllowHTTP();
  v11 = [v9 URL];
  v12 = [v11 host];
  +[NSURLRequest setAllowsAnyHTTPSCertificate:v10 forHost:v12];

  [(PDSecureConnectionManager *)self->_connectionManager setRequest:v9];
  [(PDSecureConnectionManager *)self->_connectionManager start];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleConnectionSuccessWithResponse:(id)a3 data:(id)a4
{
}

- (void)_handleConnectionFailureWithError:(id)a3
{
}

- (void)_destroyConnectionManager
{
  [(PDSecureConnectionManager *)self->_connectionManager setSuccessHandler:0];
  [(PDSecureConnectionManager *)self->_connectionManager setFailureHandler:0];
  [(PDSecureConnectionManager *)self->_connectionManager cancel];
  connectionManager = self->_connectionManager;
  self->_connectionManager = 0;
}

- (id)request
{
  return 0;
}

- (void).cxx_destruct
{
}

@end