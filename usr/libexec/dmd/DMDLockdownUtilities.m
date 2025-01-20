@interface DMDLockdownUtilities
+ (BOOL)setDeviceName:(id)a3 outError:(id *)a4;
+ (NSDate)deviceLastCloudBackupDate;
@end

@implementation DMDLockdownUtilities

+ (NSDate)deviceLastCloudBackupDate
{
  v2 = (void *)lockdown_connect();
  if (v2)
  {
    v3 = (void *)lockdown_copy_value();
    lockdown_disconnect();
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v2 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v3 unsignedLongLongValue] + 978307200.0);
LABEL_8:

        goto LABEL_9;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000856A4();
      }
    }
    v2 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return (NSDate *)v2;
}

+ (BOOL)setDeviceName:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100051F8C;
  v10[3] = &unk_1000CB2F0;
  v10[4] = a4;
  v6 = objc_retainBlock(v10);
  if (lockdown_connect())
  {
    int v7 = lockdown_set_value();
    lockdown_disconnect();
    if (!v7)
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000856EC(v7);
    }
  }
  ((void (*)(void *, uint64_t))v6[2])(v6, 2300);
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

@end