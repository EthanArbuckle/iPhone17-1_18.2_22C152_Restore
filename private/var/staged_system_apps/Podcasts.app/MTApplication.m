@interface MTApplication
+ (BOOL)handleTextViewURL:(id)a3 interaction:(int64_t)a4;
+ (BOOL)localLibraryUpdatesDisabled;
+ (id)appController;
+ (id)sharedApplication;
- (MTApplication)init;
- (UIApplicationDelegate)strongDelegate;
- (id)_extendLaunchTest;
- (id)delegate;
- (void)completeOpenURLWithSuccess:(BOOL)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)openURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setStrongDelegate:(id)a3;
@end

@implementation MTApplication

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  [(MTApplication *)self setStrongDelegate:v4];
  v5.receiver = self;
  v5.super_class = (Class)MTApplication;
  [(MTApplication *)&v5 setDelegate:v4];
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)MTApplication;
  v2 = [(MTApplication *)&v4 delegate];

  return v2;
}

+ (BOOL)localLibraryUpdatesDisabled
{
  unsigned int v2 = +[UIApplication isRunningInStoreDemoMode];
  v3 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Local library updates disabled: %d", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (id)_extendLaunchTest
{
  return @"ResponsiveLaunchTest";
}

- (void)setStrongDelegate:(id)a3
{
}

- (MTApplication)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTApplication;
  unsigned int v2 = [(MTApplication *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTApplication *)v2 subscribeToLifecycleEventNotifications];
  }
  return v3;
}

+ (id)sharedApplication
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTApplication;
  unsigned int v2 = [super sharedApplication];

  return v2;
}

+ (id)appController
{
  unsigned int v2 = [a1 sharedApplication];
  v3 = [v2 delegate];
  objc_super v4 = [v3 appController];

  return v4;
}

+ (BOOL)handleTextViewURL:(id)a3 interaction:(int64_t)a4
{
  if (!a4)
  {
    id v5 = a3;
    v6 = +[UIApplication sharedApplication];
    [v6 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
  }
  return a4 != 0;
}

- (void)dealloc
{
  [(MTApplication *)self unsubscribeFromLifecycleEventNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MTApplication;
  [(MTApplication *)&v3 dealloc];
}

- (void)openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MTApplication *)self delegate];
  unsigned int v12 = [v11 canOpenURL:v8];

  if (v12)
  {
    v13 = [v8 scheme];
    if ([v13 isEqualToString:@"http"])
    {
    }
    else
    {
      v14 = [v8 scheme];
      unsigned int v15 = [v14 isEqualToString:@"https"];

      if (!v15)
      {
        char v17 = 0;
LABEL_10:
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000936B8;
        v21[3] = &unk_10054F240;
        char v24 = v17;
        v21[4] = self;
        id v22 = v8;
        id v23 = v10;
        v20.receiver = self;
        v20.super_class = (Class)MTApplication;
        [(MTApplication *)&v20 openURL:v22 options:v9 completionHandler:v21];

        goto LABEL_11;
      }
    }
    v16 = [v9 objectForKeyedSubscript:UIApplicationOpenURLOptionUniversalLinksOnly];

    if (v16)
    {
      char v17 = 1;
    }
    else
    {
      id v18 = [v9 mutableCopy];
      [v18 setObject:&__kCFBooleanTrue forKey:UIApplicationOpenURLOptionUniversalLinksOnly];

      char v17 = 1;
      id v9 = v18;
    }
    goto LABEL_10;
  }
  v19.receiver = self;
  v19.super_class = (Class)MTApplication;
  [(MTApplication *)&v19 openURL:v8 options:v9 completionHandler:v10];
LABEL_11:
}

- (void)completeOpenURLWithSuccess:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000937CC;
    v7[3] = &unk_10054F268;
    id v8 = v5;
    BOOL v9 = a3;
    +[NSThread mainThread:v7];
  }
}

- (UIApplicationDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (void).cxx_destruct
{
}

@end