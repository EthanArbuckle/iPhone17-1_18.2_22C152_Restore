@interface MBDaemonPlugin
- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5;
- (id)endingBackupWithEngine:(id)a3;
- (id)preparingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (id)startingBackupWithEngine:(id)a3;
- (void)_waitForRebootSignal;
@end

@implementation MBDaemonPlugin

- (id)startingBackupWithEngine:(id)a3
{
  if (([a3 isDeviceTransferEngine] & 1) == 0)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting sync spinner for backup", v5, 2u);
      _MBLog();
    }
    SBSSetStatusBarShowsSyncActivity();
  }
  return 0;
}

- (id)endingBackupWithEngine:(id)a3
{
  if (([a3 isDeviceTransferEngine] & 1) == 0)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping sync spinner for backup", v5, 2u);
      _MBLog();
    }
    SBSSetStatusBarShowsSyncActivity();
  }
  return 0;
}

- (id)preparingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  if ((objc_msgSend(a4, "isDeviceTransferEngine", a3) & 1) != 0
    || !objc_msgSend(objc_msgSend(a4, "settingsContext"), "shouldNotifySpringBoard"))
  {
    v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Not sending notification that a restore has started", v19, 2u);
      _MBLog();
    }
    return 0;
  }
  int out_token = 0;
  *(void *)v19 = 0;
  v20 = v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004345C;
  handler[3] = &unk_1000F19D8;
  handler[4] = v19;
  uint64_t v6 = notify_register_dispatch("com.apple.SpringBoard.ReadyForRestore", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
  if (v6) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:1 format:@"notify_register_dispatch failed: %u", v6]);
  }
  v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Sending notification that a restore has started", buf, 2u);
    _MBLog();
  }
  id v8 = +[MBNotificationCenter sharedNotificationCenter];
  uint64_t v9 = MBBackupAgentRestoreStartedNotification;
  [v8 setState:1 forNotification:MBBackupAgentRestoreStartedNotification];
  [+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter") postNotification:v9];
  [+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter") setState:1 forNotification:@"com.apple.MobileSync.BackupAgent.RestoreStarted"];
  [+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter") postNotification:@"com.apple.MobileSync.BackupAgent.RestoreStarted"];
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Waiting for notification from SpringBoard that it's ready for a restore", buf, 2u);
    _MBLog();
  }
  double Current = CFAbsoluteTimeGetCurrent();
  int v12 = (int)(Current - CFAbsoluteTimeGetCurrent() + 90.0);
  if (v12 < 1 || v20[24])
  {
    CFRunLoopRunResult v13 = 0;
  }
  else
  {
    do
    {
      CFRunLoopRunResult v13 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, (double)v12, 0);
      int v12 = (int)(Current - CFAbsoluteTimeGetCurrent() + 90.0);
    }
    while (v12 >= 1 && !v20[24]);
  }
  [+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter") setState:0 forNotification:v9];
  [+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter") setState:0 forNotification:@"com.apple.MobileSync.BackupAgent.RestoreStarted"];
  notify_cancel(out_token);
  if (v13 != kCFRunLoopRunTimedOut)
  {
    self->_restoreStarted = 1;
    _Block_object_dispose(v19, 8);
    return 0;
  }
  v14 = +[MBError errorWithCode:1 format:@"Timeout waiting for SpringBoard notification from SpringBoard that it's ready for a restore"];
  _Block_object_dispose(v19, 8);
  return v14;
}

- (void)_waitForRebootSignal
{
  char v8 = 0;
  unsigned int v2 = [[+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0) getBooleanValueForKey:@"RestoreShouldReboot" keyExists:&v8];
  if (v8) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      if (!(v4 + 24 * (v5 / 0x18)))
      {
        uint64_t v6 = MBGetDefaultLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v10 = @"com.apple.MobileBackup";
          __int16 v11 = 2112;
          CFStringRef v12 = @"RestoreShouldReboot";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not rebooting after restore because %@ %@ preference is set - unset this preference to finish the restore", buf, 0x16u);
          _MBLog();
        }
      }
      sleep(5u);
      char v8 = 0;
      unsigned int v7 = [[+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0) getBooleanValueForKey:@"RestoreShouldReboot" keyExists:&v8];
      if (!v8) {
        break;
      }
      ++v5;
      --v4;
    }
    while (!v7);
  }
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  [(MBDaemonPlugin *)self _waitForRebootSignal];
  if (([a4 isDeviceTransferEngine] & 1) == 0
    && self->_restoreStarted
    && objc_msgSend(objc_msgSend(a4, "settingsContext"), "shouldNotifySpringBoard"))
  {
    unsigned int v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Sending notification that a restore has ended", buf, 2u);
      _MBLog();
    }
    id v8 = +[MBNotificationCenter sharedNotificationCenter];
    [v8 postNotification:MBBackupAgentRestoreEndedNotification];
    [[+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter") postNotification:@"com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded"];
  }
  else
  {
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not sending notification that a restore has ended", v11, 2u);
      _MBLog();
    }
  }
  return 0;
}

@end