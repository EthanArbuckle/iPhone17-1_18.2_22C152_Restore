@interface _NFSeshatSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)isSessionSEOnly;
- (NFDriverWrapper)driverWrapper;
- (NFSecureElementWrapper)embeddedSecureElementWrapper;
- (id)initialRoutingConfig;
- (void)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 completion:(id)a6;
- (void)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 completion:(id)a6;
- (void)deleteSlot:(unsigned __int8)a3 completion:(id)a4;
- (void)derive:(unsigned __int8)a3 userHash:(id)a4 completion:(id)a5;
- (void)didStartSession:(id)a3;
- (void)getDataWithCompletion:(id)a3;
- (void)getHashWithCompletion:(id)a3;
- (void)maybeTTR:(unsigned int)a3 appletResult:(unsigned __int16)a4;
- (void)obliterateWithCompletion:(id)a3;
- (void)resetCounter:(unsigned __int8)a3 userToken:(id)a4 completion:(id)a5;
- (void)setDriverWrapper:(id)a3;
- (void)setEmbeddedSecureElementWrapper:(id)a3;
- (void)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 completion:(id)a5;
@end

@implementation _NFSeshatSession

+ (id)validateEntitlements:(id)a3
{
  if ([a3 seshatAccess])
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
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring seshat access", v11, ClassName, Name, 33);
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
      int v32 = 33;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring seshat access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031FCF0;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 34];
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

- (void)didStartSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NFSeshatSession;
  id v4 = a3;
  [(_NFSession *)&v9 didStartSession:v4];
  id v5 = +[_NFHardwareManager sharedHardwareManager];
  v6 = [v5 secureElementWrapper];
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v6;

  v8 = [(_NFXPCSession *)self remoteObject];
  [v8 didStartSession:v4];
}

- (void)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 completion:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_NFSeshatSession;
  v13 = [(_NFSession *)&v22 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100228058;
  block[3] = &unk_100307F98;
  id v18 = v12;
  SEL v19 = a2;
  unsigned __int8 v20 = a3;
  unsigned __int8 v21 = a4;
  block[4] = self;
  id v17 = v11;
  id v14 = v11;
  id v15 = v12;
  dispatch_async(v13, block);
}

- (void)derive:(unsigned __int8)a3 userHash:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSeshatSession;
  id v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100228A74;
  block[3] = &unk_1003031F8;
  unsigned __int8 v18 = a3;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  SEL v17 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

- (void)resetCounter:(unsigned __int8)a3 userToken:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSeshatSession;
  id v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100229470;
  block[3] = &unk_1003031F8;
  unsigned __int8 v18 = a3;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  SEL v17 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

- (void)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 completion:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_NFSeshatSession;
  id v13 = [(_NFSession *)&v22 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100229E54;
  block[3] = &unk_100307F98;
  BOOL v20 = a3;
  unsigned __int8 v21 = a4;
  block[4] = self;
  id v17 = v11;
  id v18 = v12;
  SEL v19 = a2;
  id v14 = v12;
  id v15 = v11;
  dispatch_async(v13, block);
}

- (void)deleteSlot:(unsigned __int8)a3 completion:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NFSeshatSession;
  v8 = [(_NFSession *)&v14 workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10022A840;
  v10[3] = &unk_100302E40;
  id v11 = v7;
  SEL v12 = a2;
  unsigned __int8 v13 = a3;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)getDataWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSeshatSession;
  v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022B178;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)getHashWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSeshatSession;
  v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022BACC;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_NFSeshatSession;
  objc_super v11 = [(_NFSession *)&v19 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022C428;
  block[3] = &unk_1003031F8;
  unsigned __int8 v18 = a3;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  SEL v17 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

- (void)obliterateWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSeshatSession;
  v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022CDCC;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)maybeTTR:(unsigned int)a3 appletResult:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if (a3) {
    BOOL v8 = a3 == 24;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (a4 == 36864 || a4 == 26277) {
    int v9 = 0;
  }
  if (!(a3 | a4)) {
    int v9 = 1;
  }
  if (v9)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i Invoking TTR for %d 0x%x", v15, ClassName, Name, 526, v5, v4);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      SEL v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67110402;
      int v22 = v18;
      __int16 v23 = 2082;
      v24 = object_getClassName(self);
      __int16 v25 = 2082;
      int v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 526;
      __int16 v29 = 1024;
      int v30 = v5;
      __int16 v31 = 1024;
      int v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invoking TTR for %d 0x%x", buf, 0x2Eu);
    }

    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"Result: %d Applet Result: %d", v5, v4];
    sub_100198FF8((uint64_t)NFBugCapture, @"Seshat Failure!", v19, 0);
    +[NFExceptionsCALogger postAnalyticsSEFailureEvent:11 context:v19 error:0];
  }
}

- (BOOL)isSessionSEOnly
{
  return 1;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDriverWrapper:(id)a3
{
}

- (NFSecureElementWrapper)embeddedSecureElementWrapper
{
  return (NFSecureElementWrapper *)objc_getProperty(self, a2, 168, 1);
}

- (void)setEmbeddedSecureElementWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedSecureElementWrapper, 0);

  objc_storeStrong((id *)&self->_driverWrapper, 0);
}

@end