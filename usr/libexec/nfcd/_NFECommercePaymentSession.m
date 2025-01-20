@interface _NFECommercePaymentSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)isSessionSEOnly;
- (BOOL)willStartSession;
- (NFSecureElementWrapper)secureElementWrapper;
- (id)initialRoutingConfig;
- (void)didStartSession:(id)a3;
- (void)getAppletsWithCompletion:(id)a3;
- (void)performECommercePayment:(id)a3 request:(id)a4 completion:(id)a5;
- (void)setSecureElementWrapper:(id)a3;
- (void)validateEcommercePaymentRequest:(id)a3 completion:(id)a4;
@end

@implementation _NFECommercePaymentSession

+ (id)validateEntitlements:(id)a3
{
  if ([a3 eCommerceAccess])
  {
    id v5 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring ecomm access", v11, ClassName, Name, 32);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v14;
      __int16 v27 = 2082;
      v28 = object_getClassName(a1);
      __int16 v29 = 2082;
      v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 32;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring ecomm access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031A5A8;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 33];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:1];
}

- (BOOL)willStartSession
{
  sub_1002535C4();
  v4.receiver = self;
  v4.super_class = (Class)_NFECommercePaymentSession;
  return [(_NFSession *)&v4 willStartSession];
}

- (void)didStartSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NFECommercePaymentSession;
  id v4 = a3;
  [(_NFSession *)&v9 didStartSession:v4];
  id v5 = +[_NFHardwareManager sharedHardwareManager];
  v6 = [v5 secureElementWrapper];
  secureElementWrapper = self->_secureElementWrapper;
  self->_secureElementWrapper = v6;

  v8 = [(_NFXPCSession *)self remoteObject];
  [v8 didStartSession:v4];
}

- (void)getAppletsWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFECommercePaymentSession;
  v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D5C0;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)performECommercePayment:(id)a3 request:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_NFECommercePaymentSession;
  v12 = [(_NFSession *)&v21 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D9D4;
  block[3] = &unk_100302250;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (void)validateEcommercePaymentRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFECommercePaymentSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006DF94;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (NFSecureElementWrapper)secureElementWrapper
{
  return (NFSecureElementWrapper *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSecureElementWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end