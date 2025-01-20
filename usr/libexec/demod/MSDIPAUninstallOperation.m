@interface MSDIPAUninstallOperation
- (BOOL)_IXUninstallAppIPA;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDIPAUninstallOperation

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_IXUninstallAppIPA"];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)_IXUninstallAppIPA
{
  v2 = [(MSDOperation *)self context];
  v3 = [v2 identifier];

  v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Uninstallig app: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100085C6C;
  v18[3] = &unk_100153630;
  id v6 = v3;
  id v19 = v6;
  p_long long buf = &buf;
  v7 = v5;
  v20 = v7;
  +[IXAppInstallCoordinator uninstallAppWithBundleID:v6 requestUserConfirmation:0 completion:v18];
  dispatch_time_t v8 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Timed out waiting for app removal to finish.", v17, 2u);
    }
  }
  int v10 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    v11 = +[MSDCache sharedInstance];
    unsigned int v12 = [v11 containerExist:v6];

    if (v12)
    {
      v13 = +[MSDCache sharedInstance];
      unsigned __int8 v14 = [v13 deleteContainer:v6];

      if ((v14 & 1) == 0)
      {
        v15 = sub_100068600();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000D5920((uint64_t)v6, v15);
        }
      }
    }
  }

  _Block_object_dispose(&buf, 8);
  return v10 != 0;
}

@end