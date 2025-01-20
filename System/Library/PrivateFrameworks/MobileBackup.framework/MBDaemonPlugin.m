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
  id v6 = a3;
  id v7 = a4;
  if (([v7 isDeviceTransferEngine] & 1) != 0
    || ([v7 settingsContext],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 shouldNotifySpringBoard],
        v8,
        !v9))
  {
    v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Not sending notification that a restore has started", v29, 2u);
      _MBLog();
    }
  }
  else
  {
    int out_token = 0;
    *(void *)v29 = 0;
    v30 = v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    id v10 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100203104;
    handler[3] = &unk_1004167F8;
    handler[4] = v29;
    uint64_t v11 = notify_register_dispatch("com.apple.SpringBoard.ReadyForRestore", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

    if (v11) {
      objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"notify_register_dispatch failed: %u", v11));
    }
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Sending notification that a restore has started", buf, 2u);
      _MBLog();
    }

    v13 = +[MBNotificationCenter sharedNotificationCenter];
    uint64_t v14 = MBBackupAgentRestoreStartedNotification;
    [v13 setState:1 forNotification:MBBackupAgentRestoreStartedNotification];

    v15 = +[MBNotificationCenter sharedNotificationCenter];
    [v15 postNotification:v14];

    v16 = +[MBNotificationCenter sharedNotificationCenter];
    [v16 setState:1 forNotification:@"com.apple.MobileSync.BackupAgent.RestoreStarted"];

    v17 = +[MBNotificationCenter sharedNotificationCenter];
    [v17 postNotification:@"com.apple.MobileSync.BackupAgent.RestoreStarted"];

    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Waiting for notification from SpringBoard that it's ready for a restore", buf, 2u);
      _MBLog();
    }

    double Current = CFAbsoluteTimeGetCurrent();
    int v20 = (int)(Current - CFAbsoluteTimeGetCurrent() + 90.0);
    if (v20 < 1 || v30[24])
    {
      CFRunLoopRunResult v21 = 0;
    }
    else
    {
      do
      {
        CFRunLoopRunResult v21 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, (double)v20, 0);
        int v20 = (int)(Current - CFAbsoluteTimeGetCurrent() + 90.0);
      }
      while (v20 >= 1 && !v30[24]);
    }
    v22 = +[MBNotificationCenter sharedNotificationCenter];
    [v22 setState:0 forNotification:v14];

    v23 = +[MBNotificationCenter sharedNotificationCenter];
    [v23 setState:0 forNotification:@"com.apple.MobileSync.BackupAgent.RestoreStarted"];

    notify_cancel(out_token);
    if (v21 == kCFRunLoopRunTimedOut)
    {
      v24 = +[MBError errorWithCode:1 format:@"Timeout waiting for SpringBoard notification from SpringBoard that it's ready for a restore"];
      _Block_object_dispose(v29, 8);
      goto LABEL_17;
    }
    self->_restoreStarted = 1;
    _Block_object_dispose(v29, 8);
  }
  v24 = 0;
LABEL_17:

  return v24;
}

- (void)_waitForRebootSignal
{
  uint64_t v2 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    char v10 = 0;
    v4 = +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0, v8, v9);
    unsigned int v5 = [v4 getBooleanValueForKey:@"RestoreShouldReboot" keyExists:&v10];
    if (!v10 || v5 != 0) {
      break;
    }
    if (!(v2 + 24 * (i / 0x18)))
    {
      id v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v12 = @"com.apple.MobileBackup";
        __int16 v13 = 2112;
        CFStringRef v14 = @"RestoreShouldReboot";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not rebooting after restore because %@ %@ preference is set - unset this preference to finish the restore", buf, 0x16u);
        CFStringRef v8 = @"com.apple.MobileBackup";
        CFStringRef v9 = @"RestoreShouldReboot";
        _MBLog();
      }
    }
    sleep(5u);

    --v2;
  }
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  id v6 = a4;
  [(MBDaemonPlugin *)self _waitForRebootSignal];
  if (([v6 isDeviceTransferEngine] & 1) == 0
    && self->_restoreStarted
    && ([v6 settingsContext],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 shouldNotifySpringBoard],
        v7,
        v8))
  {
    CFStringRef v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sending notification that a restore has ended", buf, 2u);
      _MBLog();
    }

    char v10 = +[MBNotificationCenter sharedNotificationCenter];
    [v10 postNotification:MBBackupAgentRestoreEndedNotification];

    uint64_t v11 = +[MBNotificationCenter sharedNotificationCenter];
    [v11 postNotification:@"com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded"];
  }
  else
  {
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not sending notification that a restore has ended", v13, 2u);
      _MBLog();
    }
  }

  return 0;
}

@end