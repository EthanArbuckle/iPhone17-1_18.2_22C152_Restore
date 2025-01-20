@interface _NFFieldDetectSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)isFeatureSupported:(unint64_t)a3;
- (BOOL)requireSuppressDefaultAppPresentmentAssertion;
- (BOOL)skipAppLaunch;
- (BOOL)unfiltered;
- (_NFFieldDetectSession)initWithRemoteObject:(id)a3 workQueue:(id)a4;
- (unint64_t)notificationCategories;
- (unint64_t)notificationConfig;
- (void)didStartSession:(id)a3;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)handleFilteredFieldNotification:(id)a3;
- (void)setNotificationCategories:(unint64_t)a3;
- (void)setNotificationConfig:(unint64_t)a3;
- (void)setUnfiltered:(BOOL)a3;
@end

@implementation _NFFieldDetectSession

- (_NFFieldDetectSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_NFFieldDetectSession;
  v4 = [(_NFXPCSession *)&v8 initWithRemoteObject:a3 workQueue:a4];
  v5 = v4;
  if (v4)
  {
    v4->_notificationConfig = 1;
    v4->_notificationCategories = -1;
    v6 = v4;
  }

  return v5;
}

+ (id)validateEntitlements:(id)a3
{
  if ([a3 cardModeAccess])
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
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v11, ClassName, Name, 30);
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
      int v32 = 30;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_100319E88;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 31];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (void)handleFieldNotification:(id)a3
{
  id v6 = a3;
  if (([(_NFFieldDetectSession *)self notificationConfig] & 2) != 0)
  {
    v4 = [(_NFXPCSession *)self remoteObject];
    [v4 didDetectField:1];
  }
  if ([(_NFFieldDetectSession *)self notificationConfig])
  {
    id v5 = [(_NFXPCSession *)self remoteObject];
    [v5 didDetectFieldNotification:v6];
  }
}

- (void)handleFilteredFieldNotification:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(_NFFieldDetectSession *)self unfiltered];
  id v5 = v8;
  if (v4)
  {
    if (([(_NFFieldDetectSession *)self notificationConfig] & 2) != 0)
    {
      id v6 = [(_NFXPCSession *)self remoteObject];
      [v6 didDetectField:1];
    }
    unint64_t v4 = [(_NFFieldDetectSession *)self notificationConfig];
    id v5 = v8;
    if (v4)
    {
      v7 = [(_NFXPCSession *)self remoteObject];
      [v7 didDetectFieldNotification:v8];

      id v5 = v8;
    }
  }

  _objc_release_x1(v4, v5);
}

- (BOOL)skipAppLaunch
{
  return (LOBYTE(self->_notificationConfig) >> 2) & 1;
}

- (BOOL)requireSuppressDefaultAppPresentmentAssertion
{
  return (LOBYTE(self->_notificationConfig) >> 3) & 1;
}

- (void)didStartSession:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NFFieldDetectSession;
  id v4 = a3;
  [(_NFSession *)&v6 didStartSession:v4];
  id v5 = [(_NFXPCSession *)self remoteObject];
  [v5 didStartSession:v4];
}

- (BOOL)isFeatureSupported:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NFFieldDetectSession;
  return [(_NFSession *)&v4 isFeatureSupported:a3];
}

- (void)handleFieldChanged:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 || ([(_NFFieldDetectSession *)self notificationConfig] & 2) == 0)
  {
    id v5 = [(_NFXPCSession *)self remoteObject];
    [v5 didDetectField:v3];
  }
}

- (BOOL)unfiltered
{
  return self->_unfiltered;
}

- (void)setUnfiltered:(BOOL)a3
{
  self->_unfiltered = a3;
}

- (unint64_t)notificationConfig
{
  return self->_notificationConfig;
}

- (void)setNotificationConfig:(unint64_t)a3
{
  self->_notificationConfig = a3;
}

- (unint64_t)notificationCategories
{
  return self->_notificationCategories;
}

- (void)setNotificationCategories:(unint64_t)a3
{
  self->_notificationCategories = a3;
}

@end