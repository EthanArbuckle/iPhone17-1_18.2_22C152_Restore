@interface NRRepeatingAlertEngineItemLaunchBridgeDeleteGraduationBackup
- (void)_setShowGraduationUnpairInstructions;
- (void)defaultButtonWasPressed;
- (void)notificationDismissed;
@end

@implementation NRRepeatingAlertEngineItemLaunchBridgeDeleteGraduationBackup

- (void)defaultButtonWasPressed
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NRRepeatingAlertEngineItemLaunchBridgeDeleteGraduationBackup - defaultButtonWasPressed", v6, 2u);
    }
  }
  [(NRRepeatingAlertEngineItemLaunchBridgeDeleteGraduationBackup *)self _setShowGraduationUnpairInstructions];
}

- (void)notificationDismissed
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NRRepeatingAlertEngineItemLaunchBridgeDeleteGraduationBackup - notificationDismissed", buf, 2u);
    }
  }
  [(NRRepeatingAlertEngineItemLaunchBridgeDeleteGraduationBackup *)self _setShowGraduationUnpairInstructions];
  memcpy(buf, "com.apple.Bridge", 0x400uLL);
  SBSSpringBoardServerPort();
  int v6 = SBSetApplicationBadgeNumber();
  if (v6)
  {
    int v7 = v6;
    v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67240192;
        v11[1] = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to badge bridge app: %{public}d", (uint8_t *)v11, 8u);
      }
    }
  }
}

- (void)_setShowGraduationUnpairInstructions
{
}

@end