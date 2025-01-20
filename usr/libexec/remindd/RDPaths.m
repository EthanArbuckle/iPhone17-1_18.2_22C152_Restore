@interface RDPaths
+ (BOOL)isDataSeparationEnabled;
+ (NSURL)defaultApplicationDocumentsURL;
+ (NSURL)locationBundleURL;
+ (id)defaultReminderDataContainerURL;
+ (id)pptSentinelURLInContainerURL:(id)a3;
+ (id)reminderDataContainerURLWithAppDocumentsURL:(id)a3;
+ (id)urlForIsolatedContainerWithIdentifier:(id)a3;
+ (void)unitTest_setDefaultApplicationDocumentsURL:(id)a3;
@end

@implementation RDPaths

+ (NSURL)locationBundleURL
{
  if (qword_100922830 != -1) {
    dispatch_once(&qword_100922830, &stru_1008AD9F8);
  }
  v2 = (void *)qword_100922828;

  return (NSURL *)v2;
}

+ (NSURL)defaultApplicationDocumentsURL
{
  if ([a1 isDataSeparationEnabled])
  {
    if (qword_100922838 != -1) {
      dispatch_once(&qword_100922838, &stru_1008ADA18);
    }
    v2 = (void *)qword_100922840;
    if (!qword_100922840)
    {
      dispatch_sync((dispatch_queue_t)qword_100922820, &stru_1008ADA38);
      v2 = (void *)qword_100922840;
    }
    id v3 = v2;
  }
  else
  {
    id v3 = +[REMPaths legacy_applicationDocumentsURL];
  }

  return (NSURL *)v3;
}

+ (id)defaultReminderDataContainerURL
{
  v2 = [a1 defaultApplicationDocumentsURL];
  id v3 = [v2 rem_URLByAppendingReminderDataContainerPathComponent];

  return v3;
}

+ (id)reminderDataContainerURLWithAppDocumentsURL:(id)a3
{
  return [a3 rem_URLByAppendingReminderDataContainerPathComponent];
}

+ (id)pptSentinelURLInContainerURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"ppt.sentinel"];
}

+ (BOOL)isDataSeparationEnabled
{
  v2 = +[RDFeatureFlagsObjCWrapper wrappedFeatureFlagsWithRawValue:@"dataSeparation"];
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

+ (id)urlForIsolatedContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [a1 defaultApplicationDocumentsURL];
  v6 = [v5 URLByAppendingPathComponent:@"IsolatedContainers/" isDirectory:1];
  v7 = [v6 URLByAppendingPathComponent:v4 isDirectory:1];

  return v7;
}

+ (void)unitTest_setDefaultApplicationDocumentsURL:(id)a3
{
  id v4 = a3;
  if (qword_100922838 != -1) {
    dispatch_once(&qword_100922838, &stru_1008ADA58);
  }
  v5 = qword_100922820;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004308;
  block[3] = &unk_1008ADA80;
  id v6 = v4;
  id v8 = v6;
  dispatch_sync(v5, block);
  if (([a1 isDataSeparationEnabled] & 1) == 0) {
    +[REMPaths unitTest_setLegacyApplicationDocumentsURL:v6];
  }
}

@end