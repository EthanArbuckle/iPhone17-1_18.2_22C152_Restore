@interface MCProfileDaemonManagedConfigurationHelper
- (void)removeApplicationWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)removeProfileWithIdentifier:(id)a3 async:(BOOL)a4;
@end

@implementation MCProfileDaemonManagedConfigurationHelper

- (void)removeProfileWithIdentifier:(id)a3 async:(BOOL)a4
{
  if (a3)
  {
    id v5 = a3;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v7 = +[MCProfileServiceServer sharedServer];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000989B0;
    v9[3] = &unk_1000EB530;
    v8 = v6;
    v10 = v8;
    [v7 removeProfileWithIdentifier:v5 installationType:1 source:@"com.apple.managedconfiguration.profiled" completion:v9];

    if (!a4) {
      dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

- (void)removeApplicationWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[DMFConnection currentUserConnection];
  v8 = objc_opt_new();
  [v8 setBundleIdentifier:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100098AAC;
  v11[3] = &unk_1000EC5B8;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 performRequest:v8 completion:v11];
}

@end