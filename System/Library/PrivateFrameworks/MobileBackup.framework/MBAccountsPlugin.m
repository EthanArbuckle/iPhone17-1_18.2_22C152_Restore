@interface MBAccountsPlugin
- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4;
@end

@implementation MBAccountsPlugin

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  if (objc_msgSend(a4, "restoresPrimaryAccount", a3))
  {
    v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling backup for the account", buf, 2u);
      _MBLog();
    }

    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10029EF1C;
    v8[3] = &unk_100411060;
    v9 = v5;
    v6 = v5;
    +[MBServiceAccount setBackupEnabled:1 completion:v8];
    MBGroupWaitForever();
  }
  return 0;
}

@end