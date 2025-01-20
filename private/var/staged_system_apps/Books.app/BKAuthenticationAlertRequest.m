@interface BKAuthenticationAlertRequest
+ (id)sharedRequester;
- (BKAuthenticationAlertRequest)init;
- (void)_handleAuthResult:(id)a3 error:(id)a4;
- (void)_notifyHandlers:(BOOL)a3;
- (void)dealloc;
- (void)requestAuthenticationPolitely:(BOOL)a3 completion:(id)a4;
@end

@implementation BKAuthenticationAlertRequest

+ (id)sharedRequester
{
  if (qword_100B4A640 != -1) {
    dispatch_once(&qword_100B4A640, &stru_100A4B428);
  }
  v2 = (void *)qword_100B4A638;

  return v2;
}

- (BKAuthenticationAlertRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKAuthenticationAlertRequest;
  v2 = [(BKAuthenticationAlertRequest *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ibooks.authentication.request", 0);
    authQueue = v2->_authQueue;
    v2->_authQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(AMSPromise *)self->_authPromise cancel];
  v3.receiver = self;
  v3.super_class = (Class)BKAuthenticationAlertRequest;
  [(BKAuthenticationAlertRequest *)&v3 dealloc];
}

- (void)_notifyHandlers:(BOOL)a3
{
  authQueue = self->_authQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F4048;
  v4[3] = &unk_100A44E60;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(authQueue, v4);
}

- (void)requestAuthenticationPolitely:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = +[BKReachability sharedReachabilityForInternetConnection];
  unsigned int v8 = [v7 currentReachabilityStatus];

  if (v8)
  {
    v9 = +[UIApplication sharedApplication];
    if ([v9 launchedToTest])
    {
    }
    else
    {
      v10 = +[AETestDriver shared];
      unsigned int v11 = [v10 reading];

      if (!v11)
      {
        authQueue = self->_authQueue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1001F42F0;
        v17[3] = &unk_100A43E28;
        BOOL v19 = a3;
        v17[4] = self;
        id v18 = v6;
        id v16 = v6;
        dispatch_async(authQueue, v17);
        v14 = v18;
        goto LABEL_6;
      }
    }
  }
  v12 = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F42DC;
  block[3] = &unk_100A442B8;
  id v21 = v6;
  id v13 = v6;
  dispatch_async(v12, block);
  v14 = v21;
LABEL_6:
}

- (void)_handleAuthResult:(id)a3 error:(id)a4
{
  id v5 = a3;
  authQueue = self->_authQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F4A3C;
  v8[3] = &unk_100A43DD8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(authQueue, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authQueue, 0);
  objc_storeStrong((id *)&self->_authPromise, 0);

  objc_storeStrong((id *)&self->_handlers, 0);
}

@end