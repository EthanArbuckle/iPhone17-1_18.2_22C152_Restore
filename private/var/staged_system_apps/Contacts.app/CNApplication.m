@interface CNApplication
+ (void)prewarmResourcesForLaunch;
- (BOOL)areAllLaunchTasksComplete;
- (BOOL)openURL:(id)a3;
- (CNApplication)init;
- (id)_extendLaunchTest;
- (void)checkInLaunchTasks:(unint64_t)a3;
@end

@implementation CNApplication

- (CNApplication)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNApplication;
  v2 = [(CNApplication *)&v6 init];
  if (v2)
  {
    v3 = +[CNUIContactsEnvironment currentEnvironment];
    [v3 setLaunchCheckinRegistrar:v2];
    v4 = v2;
  }
  return v2;
}

+ (void)prewarmResourcesForLaunch
{
  kdebug_trace();
  v2 = +[ContactsSplitViewController prewarmContactStoreDataSourceBlock];
  v3 = +[ContactsSplitViewController resourcesPrewarmingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002250;
  block[3] = &unk_10001C5C0;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

- (id)_extendLaunchTest
{
  return @"contactsExtendedLaunch";
}

- (void)checkInLaunchTasks:(unint64_t)a3
{
  atomic_fetch_or(&self->_launchTaskCompletionMask, a3);
  if ([(CNApplication *)self areAllLaunchTasksComplete]
    && (atomic_exchange((atomic_uchar *volatile)&self->_extendedLaunchFinished, 1u) & 1) == 0)
  {
    id v4 = [(CNApplication *)self _launchTestName];
    [(CNApplication *)self finishedTest:v4 extraResults:0];
  }
}

- (BOOL)areAllLaunchTasksComplete
{
  unsigned int v2 = atomic_load((unsigned int *)&self->_launchTaskCompletionMask);
  return v2 == 63;
}

- (BOOL)openURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 scheme];
  unsigned int v6 = [v5 isEqualToString:@"tel"];

  if (v6)
  {
    v7 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned __int8 v8 = [v7 openSensitiveURL:v4 withOptions:0];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNApplication;
    unsigned __int8 v8 = [(CNApplication *)&v10 openURL:v4];
  }

  return v8;
}

@end