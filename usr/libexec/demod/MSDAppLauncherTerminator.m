@interface MSDAppLauncherTerminator
+ (BOOL)launchApp:(id)a3 withOptions:(id)a4 outError:(id *)a5;
+ (BOOL)terminateApp:(id)a3 outError:(id *)a4;
@end

@implementation MSDAppLauncherTerminator

+ (BOOL)launchApp:(id)a3 withOptions:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1000188F8;
  v31 = sub_100018908;
  id v32 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  v11 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v39 = FBSOpenApplicationOptionKeyUnlockDevice;
  v40 = &__kCFBooleanTrue;
  v12 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v13 = +[NSMutableDictionary dictionaryWithDictionary:v12];

  if (v8) {
    [v13 addEntriesFromDictionary:v8];
  }
  v14 = +[FBSOpenApplicationOptions optionsWithDictionary:v13];
  v15 = sub_100068600();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Launching app: %{public}@", buf, 0xCu);
  }

  v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000C8AA8((uint64_t)v13, v16);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100018910;
  v22[3] = &unk_100151F80;
  v25 = &v27;
  id v17 = v7;
  id v23 = v17;
  v26 = &v33;
  v18 = v9;
  v24 = v18;
  [v11 openApplication:v17 withOptions:v14 completion:v22];
  if (dispatch_semaphore_wait(v18, v10))
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000C8A64(v19);
    }
  }
  if (a5) {
    *a5 = (id) v28[5];
  }
  BOOL v20 = *((unsigned char *)v34 + 24) != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

+ (BOOL)terminateApp:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v5];
  id v7 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:@"Terminated by demod"];
  id v8 = [objc_alloc((Class)RBSTerminateRequest) initWithPredicate:v6 context:v7];
  dispatch_semaphore_t v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Terminating app: %{public}@", buf, 0xCu);
  }

  id v14 = 0;
  unsigned __int8 v10 = [v8 execute:&v14];
  id v11 = v14;
  if (v10)
  {
    if (a4) {
LABEL_5:
    }
      *a4 = v11;
  }
  else
  {
    v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000C8BC4((uint64_t)v5, v11);
    }

    if (a4) {
      goto LABEL_5;
    }
  }

  return v10;
}

@end