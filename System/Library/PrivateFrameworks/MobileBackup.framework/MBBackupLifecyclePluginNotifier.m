@interface MBBackupLifecyclePluginNotifier
- (BOOL)_notifyPluginsOfState:(unint64_t)a3 engineError:(id)a4 error:(id *)a5;
- (BOOL)notifyPluginsOfEndedBackup:(id)a3 error:(id *)a4;
- (BOOL)notifyPluginsOfEndingBackupWithError:(id *)a3;
- (BOOL)notifyPluginsOfPreparedBackupWithError:(id *)a3;
- (BOOL)notifyPluginsOfPreparingBackupWithError:(id *)a3;
- (BOOL)notifyPluginsOfStartingBackupWithError:(id *)a3;
- (MBBackupLifecyclePluginNotifier)initWithEngine:(id)a3;
- (MBEngine)engine;
- (unint64_t)lastNotifiedState;
- (void)setEngine:(id)a3;
- (void)setLastNotifiedState:(unint64_t)a3;
@end

@implementation MBBackupLifecyclePluginNotifier

- (MBBackupLifecyclePluginNotifier)initWithEngine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MBBackupLifecyclePluginNotifier;
  v5 = [(MBBackupLifecyclePluginNotifier *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_lastNotifiedState = 0;
    objc_storeWeak((id *)&v5->_engine, v4);
  }

  return v6;
}

- (BOOL)_notifyPluginsOfState:(unint64_t)a3 engineError:(id)a4 error:(id *)a5
{
  objc_super v8 = (char *)a4;
  unint64_t v9 = [(MBBackupLifecyclePluginNotifier *)self lastNotifiedState];
  unint64_t v10 = v9;
  v11 = &selRef_startingBackupWithEngine_;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_12;
    case 2uLL:
      v11 = &selRef_preparingBackupWithEngine_;
      if (v9 == 1) {
        goto LABEL_12;
      }
      goto LABEL_9;
    case 3uLL:
      v11 = &selRef_preparedBackupWithEngine_;
      if (v9 == 2) {
        goto LABEL_12;
      }
      goto LABEL_9;
    case 4uLL:
      v11 = &selRef_endingBackupWithEngine_;
      if (v9 - 1 < 3) {
        goto LABEL_12;
      }
      goto LABEL_9;
    case 5uLL:
      v11 = &selRef_endedBackupWithEngine_error_;
      if (v9 == 4) {
        goto LABEL_12;
      }
LABEL_9:
      if (v9 == a3)
      {
LABEL_12:
        v13 = *v11;
        v14 = [(MBBackupLifecyclePluginNotifier *)self engine];
        if (!v14) {
          __assert_rtn("-[MBBackupLifecyclePluginNotifier _notifyPluginsOfState:engineError:error:]", "MBBackupPluginLifecycleNotifier.m", 77, "engine");
        }
        v15 = v14;
        v16 = [v14 settingsContext];
        v17 = [v16 plugins];
        v18 = [v17 objectEnumerator];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        if (a3 == 5)
        {
          *(void *)&buf[16] = sub_10015C5BC;
          v24 = &unk_100414A30;
          v26 = v8;
          v27 = v13;
          v25 = v15;
        }
        else
        {
          *(void *)&buf[16] = sub_10015C540;
          v24 = &unk_100414A08;
          v25 = v15;
          v26 = v13;
        }
        v19 = MBNotifyPluginsBlock(v15, v18, v13, (uint64_t)buf);

        BOOL v12 = v19 == 0;
        if (v19)
        {
          if (a5) {
            *a5 = v19;
          }
        }
        else
        {
          v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            *(void *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a3;
            *(_WORD *)&buf[22] = 2112;
            v24 = v15;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Notified backup plugins for state transition:%ld -> %ld engine:%@", buf, 0x20u);
            _MBLog();
          }

          [(MBBackupLifecyclePluginNotifier *)self setLastNotifiedState:a3];
        }
      }
      else if (a5)
      {
        +[MBError errorWithCode:1, @"Cannot notify plugins of state transition %ld -> %ld", v9, a3 format];
        BOOL v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = 0;
      }

      return v12;
    default:
      v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Invalid state to notify:%ld", buf, 0xCu);
        _MBLog();
      }

      __assert_rtn("-[MBBackupLifecyclePluginNotifier _notifyPluginsOfState:engineError:error:]", "MBBackupPluginLifecycleNotifier.m", 65, "0");
  }
}

- (BOOL)notifyPluginsOfStartingBackupWithError:(id *)a3
{
  return [(MBBackupLifecyclePluginNotifier *)self _notifyPluginsOfState:1 engineError:0 error:a3];
}

- (BOOL)notifyPluginsOfPreparingBackupWithError:(id *)a3
{
  return [(MBBackupLifecyclePluginNotifier *)self _notifyPluginsOfState:2 engineError:0 error:a3];
}

- (BOOL)notifyPluginsOfPreparedBackupWithError:(id *)a3
{
  return [(MBBackupLifecyclePluginNotifier *)self _notifyPluginsOfState:3 engineError:0 error:a3];
}

- (BOOL)notifyPluginsOfEndingBackupWithError:(id *)a3
{
  return [(MBBackupLifecyclePluginNotifier *)self _notifyPluginsOfState:4 engineError:0 error:a3];
}

- (BOOL)notifyPluginsOfEndedBackup:(id)a3 error:(id *)a4
{
  return [(MBBackupLifecyclePluginNotifier *)self _notifyPluginsOfState:5 engineError:a3 error:a4];
}

- (MBEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (MBEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (unint64_t)lastNotifiedState
{
  return self->_lastNotifiedState;
}

- (void)setLastNotifiedState:(unint64_t)a3
{
  self->_lastNotifiedState = a3;
}

- (void).cxx_destruct
{
}

@end