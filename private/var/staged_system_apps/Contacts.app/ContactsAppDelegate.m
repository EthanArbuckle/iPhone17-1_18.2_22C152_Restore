@interface ContactsAppDelegate
+ (OS_os_log)log;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (CNCapabilitiesManager)capabilitiesManager;
- (CNSchedulerProvider)schedulerProvider;
- (ContactsAppDelegate)init;
- (ContactsAppDelegate)initWithCapabilitiesManager:(id)a3 mainBundle:(id)a4 schedulerProvider:(id)a5;
- (ContactsSceneDelegate)mainSceneDelegate;
- (NSBundle)mainBundle;
- (UIWindow)window;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation ContactsAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4 = a3;
  kdebug_trace();
  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    v5 = [v4 statusBar];
    [v5 setAlpha:0.0];
  }
  kdebug_trace();

  return 1;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  uint64_t v6 = UIApplicationLaunchOptionsSearchResultIdentifierKey;
  v7 = [v5 objectForKeyedSubscript:UIApplicationLaunchOptionsSearchResultIdentifierKey];

  if (v7)
  {
    objc_opt_class();
    v8 = [v5 objectForKeyedSubscript:v6];
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if ((*(uint64_t (**)(void, id))(CNIsStringEmpty + 16))(CNIsStringEmpty, v10))
    {
      v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000F178((uint64_t)v10, v11);
      }
    }
    else
    {
      v11 = [(ContactsAppDelegate *)self mainSceneDelegate];
      [v11 showContactWithIdentifier:v10];
    }
  }
  kdebug_trace();

  return 1;
}

- (ContactsAppDelegate)init
{
  v3 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  id v4 = +[NSBundle mainBundle];
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v6 = [v5 defaultSchedulerProvider];
  v7 = [(ContactsAppDelegate *)self initWithCapabilitiesManager:v3 mainBundle:v4 schedulerProvider:v6];

  return v7;
}

- (ContactsAppDelegate)initWithCapabilitiesManager:(id)a3 mainBundle:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ContactsAppDelegate;
  v12 = [(ContactsAppDelegate *)&v15 init];
  if (v12)
  {
    kdebug_trace();
    objc_storeStrong((id *)&v12->_capabilitiesManager, a3);
    objc_storeStrong((id *)&v12->_mainBundle, a4);
    objc_storeStrong((id *)&v12->_schedulerProvider, a5);
    kdebug_trace();
    v13 = v12;
  }

  return v12;
}

- (UIWindow)window
{
  return self->_window;
}

+ (OS_os_log)log
{
  if (qword_100025B58 != -1) {
    dispatch_once(&qword_100025B58, &stru_10001C4A8);
  }
  v2 = (void *)qword_100025B60;

  return (OS_os_log *)v2;
}

- (ContactsSceneDelegate)mainSceneDelegate
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 connectedScenes];
  id v4 = [v3 allObjects];
  id v5 = [v4 firstObject];

  uint64_t v6 = +[UIApplication sharedApplication];
  v7 = [v6 connectedScenes];
  v8 = [v7 _cn_firstObjectPassingTest:&stru_10001C4E8];

  objc_opt_class();
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = v5;
  }
  id v10 = [v9 delegate];
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  return [a4 configuration:a3];
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ContactsAppDelegate *)self mainSceneDelegate];
  unsigned __int8 v10 = [v9 runTest:v8 options:v7];

  return v10;
}

- (void)setWindow:(id)a3
{
}

- (CNCapabilitiesManager)capabilitiesManager
{
  return self->_capabilitiesManager;
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_capabilitiesManager, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end