@interface NRTermsAcknowledgementRegistryProxy
+ (BOOL)requireAnEntitlement;
+ (id)entitlements;
+ (id)machServiceName;
+ (id)serverExportedInterface;
- (id)registryDelegate;
- (void)add:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5;
- (void)checkForAcknowledgement:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5;
- (void)logCaller:(SEL)a3 args:(id)a4;
@end

@implementation NRTermsAcknowledgementRegistryProxy

+ (id)machServiceName
{
  return @"com.apple.nanoregistry.termsacknowledgementregistry";
}

+ (id)serverExportedInterface
{
  if (qword_1001A12C8 != -1) {
    dispatch_once(&qword_1001A12C8, &stru_1001686D8);
  }
  v2 = (void *)qword_1001A12C0;

  return v2;
}

+ (id)entitlements
{
  CFStringRef v5 = @"com.apple.nanoregistry.termsacknowledgementregistry";
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (BOOL)requireAnEntitlement
{
  return 1;
}

- (id)registryDelegate
{
  return [(NRTermsAcknowledgementRegistryProxy *)self target];
}

- (void)add:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[NSString stringWithFormat:@"NRTermsAcknowlegementRegistryProxy: add:(%@) forDeviceID:(%@)", v9, v10];
  [(NRTermsAcknowledgementRegistryProxy *)self logCaller:a2 args:v12];

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1000A15BC;
  v21[4] = sub_1000A15CC;
  id v22 = +[NROSTransaction transactionWithName:@"addTerms"];
  [v9 setWritable:1];
  v13 = [(NRTermsAcknowledgementRegistryProxy *)self appPath];
  v14 = [v13 lastPathComponent];
  [v9 _setLoggingProcessName:v14];

  v15 = +[NRQueue registryDaemonQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A15D4;
  v16[3] = &unk_100168728;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = v21;
  [v15 dispatchAsync:v16];

  _Block_object_dispose(v21, 8);
}

- (void)checkForAcknowledgement:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[NSString stringWithFormat:@"NRTermsAcknowlegementRegistryProxy: checkForAcknowledgement:(%@) forDeviceID:(%@)", v9, v10];
  [(NRTermsAcknowledgementRegistryProxy *)self logCaller:a2 args:v12];

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1000A15BC;
  v21[4] = sub_1000A15CC;
  id v22 = +[NROSTransaction transactionWithName:@"checkTerms"];
  [v9 setWritable:1];
  v13 = [(NRTermsAcknowledgementRegistryProxy *)self appPath];
  v14 = [v13 lastPathComponent];
  [v9 _setLoggingProcessName:v14];

  v15 = +[NRQueue registryDaemonQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A1AE0;
  v16[3] = &unk_100168728;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = v21;
  [v15 dispatchAsync:v16];

  _Block_object_dispose(v21, 8);
}

- (void)logCaller:(SEL)a3 args:(id)a4
{
  id v6 = a4;
  v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(NRTermsAcknowledgementRegistryProxy *)self appPath];
      id v11 = NSStringFromSelector(a3);
      int v12 = 138543874;
      v13 = v10;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ called %{public}@ %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

@end