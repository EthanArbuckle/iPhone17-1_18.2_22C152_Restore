@interface MBAppleCarePlugin
- (id)endedBackupWithEngine:(id)a3 error:(id)a4;
- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5;
- (void)_logEventWithSubtype:(id)a3 code:(int64_t)a4;
@end

@implementation MBAppleCarePlugin

- (void)_logEventWithSubtype:(id)a3 code:(int64_t)a4
{
  if (!a3) {
    sub_10009A33C();
  }
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = a3;
    __int16 v12 = 2048;
    int64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Logging event for AppleCare: [backup, %@, %lu]", buf, 0x16u);
    id v7 = a3;
    int64_t v8 = a4;
    _MBLog();
  }
  v9[0] = @"backup";
  v9[1] = a3;
  v9[2] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4, v7, v8);
  +[NSArray arrayWithObjects:v9 count:3];
  logEventForAppleCare();
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  if ([a3 isServiceEngine])
  {
    CFStringRef v7 = @"iCloudBackup";
  }
  else if ([a3 isDeviceTransferEngine])
  {
    CFStringRef v7 = @"D2DBackup";
  }
  else if ([a3 isDriveEngine])
  {
    CFStringRef v7 = @"iTunesBackup";
  }
  else
  {
    CFStringRef v7 = 0;
  }
  -[MBAppleCarePlugin _logEventWithSubtype:code:](self, "_logEventWithSubtype:code:", v7, [a4 code]);
  return 0;
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  if (objc_msgSend(a4, "isServiceEngine", a3))
  {
    CFStringRef v8 = @"iCloudRestore";
  }
  else if ([a4 isDeviceTransferEngine])
  {
    CFStringRef v8 = @"D2DRestore";
  }
  else if ([a4 isDriveEngine])
  {
    CFStringRef v8 = @"iTunesRestore";
  }
  else
  {
    CFStringRef v8 = 0;
  }
  -[MBAppleCarePlugin _logEventWithSubtype:code:](self, "_logEventWithSubtype:code:", v8, [a5 code]);
  return 0;
}

@end