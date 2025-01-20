@interface PurchaseManagerClient
- (BOOL)finishesPurchases;
- (BOOL)useRemoteAuthentication;
- (PurchaseManagerClient)initWithInputConnection:(id)a3;
- (int64_t)URLBagType;
- (int64_t)uniqueIdentifier;
- (void)ackConnection;
- (void)dealloc;
- (void)postNotificationWithResponse:(id)a3;
- (void)sendAuthenticateRequestWithContext:(id)a3 responseHandler:(id)a4;
- (void)sendError:(id)a3 forPurchases:(id)a4;
- (void)sendResponse:(id)a3;
- (void)sendResponse:(id)a3 forPurchases:(id)a4;
- (void)sendResponses:(id)a3;
- (void)setFinishesPurchases:(BOOL)a3;
- (void)setUniqueIdentifier:(int64_t)a3;
- (void)setUseRemoteAuthentication:(BOOL)a3;
@end

@implementation PurchaseManagerClient

- (BOOL)finishesPurchases
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BEA0;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PurchaseManagerClient)initWithInputConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PurchaseManagerClient;
  char v3 = [(XPCClient *)&v6 initWithInputConnection:a3];
  if (v3)
  {
    CFUUIDRef v4 = CFUUIDCreate(0);
    v3->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v4);
    CFRelease(v4);
  }
  return v3;
}

- (int64_t)uniqueIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BAC0;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setUseRemoteAuthentication:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BE24;
  v4[3] = &unk_1003A3860;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BE8C;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setFinishesPurchases:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BE74;
  v4[3] = &unk_1003A3860;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)ackConnection
{
  dispatchQueue = self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BF08;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PurchaseManagerClient;
  [(XPCClient *)&v3 dealloc];
}

- (void)sendAuthenticateRequestWithContext:(id)a3 responseHandler:(id)a4
{
  dispatchQueue = self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018EC14;
  block[3] = &unk_1003A7080;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)sendError:(id)a3 forPurchases:(id)a4
{
  id v8 = objc_alloc_init((Class)SSPurchaseResponse);
  id v7 = [a3 userInfo];
  objc_msgSend(v8, "setCancelsPurchaseBatch:", objc_msgSend(objc_msgSend(v7, "objectForKey:", SSPurchaseErrorKeyShouldCancelPurchaseBatch), "BOOLValue"));
  [v8 setError:a3];
  [(PurchaseManagerClient *)self sendResponse:v8 forPurchases:a4];
  if ([a4 count]) {
    [(PurchaseManagerClient *)self postNotificationWithResponse:v8];
  }
}

- (void)sendResponse:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(PurchaseManagerClient *)self sendResponses:v4];
}

- (void)sendResponse:(id)a3 forPurchases:(id)a4
{
  dispatchQueue = self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018F70C;
  block[3] = &unk_1003A3410;
  block[4] = self;
  void block[5] = a4;
  block[6] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)sendResponses:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10018F93C;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)postNotificationWithResponse:(id)a3
{
  id v4 = [a3 error];
  id v5 = +[SSLogConfig sharedDaemonConfig];
  id v6 = v5;
  if (v4)
  {
    if (!v5) {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v36 = 138543362;
      uint64_t v37 = objc_opt_class();
      LODWORD(v32) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v36, v32);
        free(v10);
        SSFileLog();
      }
    }
  }
  else
  {
    if (!v5) {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v36 = 138543362;
      uint64_t v37 = objc_opt_class();
      LODWORD(v32) = 12;
      v31 = &v36;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v36, v32);
        free(v14);
        v31 = (int *)v15;
        SSFileLog();
      }
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    +[NSKeyedArchiver setClassName:v17 forClass:objc_opt_class()];
    uint64_t v33 = 0;
    v18 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v33];
    if (v33)
    {
      id v19 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v19) {
        id v19 = +[SSLogConfig sharedConfig];
      }
      unsigned int v20 = objc_msgSend(v19, "shouldLog", v31);
      if ([v19 shouldLogToDisk]) {
        int v21 = v20 | 2;
      }
      else {
        int v21 = v20;
      }
      if (!os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v21 &= 2u;
      }
      if (v21)
      {
        uint64_t v22 = objc_opt_class();
        int v36 = 138543618;
        uint64_t v37 = v22;
        __int16 v38 = 2114;
        uint64_t v39 = v33;
        LODWORD(v32) = 22;
        uint64_t v23 = _os_log_send_and_compose_impl();
        if (v23)
        {
          v24 = (void *)v23;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v36, v32);
          free(v24);
          SSFileLog();
        }
      }
    }
    id v25 = objc_alloc((Class)NSMutableDictionary);
    CFStringRef v34 = @"response";
    v35 = v18;
    id v26 = objc_msgSend(v25, "initWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v27 = +[AMSBuyParams buyParamsWithString:](AMSBuyParams, "buyParamsWithString:", objc_msgSend(objc_msgSend(a3, "purchase"), "buyParameters"));
    id v28 = [(AMSBuyParams *)v27 propertyForKey:AMSBuyParamPropertyClientCorrelationKey];
    if (v28) {
      [v26 setObject:v28 forKeyedSubscript:@"clientCorrelationKey"];
    }
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, kSSPurchaseRequestSucceededNotification, 0, (CFDictionaryRef)[v26 copy], 1u);
    id v30 = +[EventDispatcher eventDispatcher];
    [v30 postEventWithName:SSEventNamePurchaseSucceeded userInfo:v26];
  }
}

- (int64_t)URLBagType
{
  if ([(XPCClient *)self hasEntitlements]) {
    return 0;
  }
  else {
    return [(XPCClient *)self isAppleSigned] ^ 1;
  }
}

- (BOOL)useRemoteAuthentication
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100190058;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end