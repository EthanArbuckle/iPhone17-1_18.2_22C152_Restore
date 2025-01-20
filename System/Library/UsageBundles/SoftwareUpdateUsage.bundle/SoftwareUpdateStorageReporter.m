@interface SoftwareUpdateStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4;
- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3;
- (float)sizeForCategory:(id)a3;
- (id)usageBundleApps;
- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4;
@end

@implementation SoftwareUpdateStorageReporter

- (id)usageBundleApps
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_2804;
  v17 = sub_2814;
  id v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_281C;
  v9[3] = &unk_4258;
  v9[4] = self;
  v12 = &v13;
  v5 = v3;
  v10 = v5;
  id v6 = v4;
  id v11 = v6;
  [v6 downloadAndInstallState:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 0;
}

- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4
{
  if (a4) {
    [*a4 setProperty:@"com.apple.Preferences" forKey:PSLazyIconAppID];
  }
}

- (float)sizeForCategory:(id)a3
{
  [(PSUsageBundleApp *)self->_app totalSize];
  return result;
}

- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  __assert_rtn("-[SoftwareUpdateStorageReporter deleteDataForCategory:withError:]", "SoftwareUpdateStorageReporter.m", 82, "0");
}

- (void).cxx_destruct
{
}

@end