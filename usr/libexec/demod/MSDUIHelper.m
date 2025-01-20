@interface MSDUIHelper
+ (id)sharedInstance;
- (BOOL)allowCancel;
- (BOOL)disableIdleTimer;
- (BOOL)launchFullScreenUI;
- (BOOL)launchFullScreenUI_ios;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (MSDUIHelper)init;
- (NSConditionLock)conditionLock;
- (NSError)fullScreenUILaunchError_iOS;
- (NSString)fullScreenUIAppId;
- (NSString)message;
- (OS_dispatch_queue)uiHelperQueue;
- (OS_xpc_object)connection;
- (OS_xpc_object)pendingMessage;
- (RBSProcessMonitor)fullScreenUIAppMonitor;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (int)fullScreenState;
- (int64_t)backlightStatus;
- (int64_t)currentProgress;
- (void)activateFullScreenUIAppMonitor;
- (void)deactivateFullScreenUIAppMonitor;
- (void)demoUpdateAllowCancel:(BOOL)a3;
- (void)demoUpdateCompleted:(id)a3;
- (void)demoUpdateFailed:(id)a3;
- (void)demoUpdateProgress:(int64_t)a3;
- (void)fullScreenUICanceledByUser;
- (void)handleFullScreenUIAppStateChange:(unsigned __int8)a3 withVisibility:(BOOL)a4;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)requestFullScreenUI;
- (void)setAllowCancel:(BOOL)a3;
- (void)setBacklightStatus:(int64_t)a3;
- (void)setConditionLock:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentProgress:(int64_t)a3;
- (void)setDisableIdleTimer:(BOOL)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setFullScreenState:(int)a3;
- (void)setFullScreenUIAppId:(id)a3;
- (void)setFullScreenUIAppMonitor:(id)a3;
- (void)setFullScreenUILaunchError_iOS:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPendingMessage:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setUiHelperQueue:(id)a3;
- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4;
- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4 disableIdleTimer:(BOOL)a5;
- (void)stopFullScreenUI:(id)a3;
@end

@implementation MSDUIHelper

+ (id)sharedInstance
{
  if (qword_100189CA8 != -1) {
    dispatch_once(&qword_100189CA8, &stru_100153DD0);
  }
  v2 = (void *)qword_100189CA0;

  return v2;
}

- (MSDUIHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDUIHelper;
  v2 = [(MSDUIHelper *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(MSDUIHelper *)v2 setFullScreenState:0];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.msduihelper", 0);
    [(MSDUIHelper *)v3 setUiHelperQueue:v4];

    [(MSDUIHelper *)v3 setCurrentProgress:0];
    [(MSDUIHelper *)v3 setFullScreenUIAppId:@"com.apple.StoreDemoViewService"];
    v5 = +[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:0];
    [(MSDUIHelper *)v3 setDisplayLayoutMonitor:v5];

    v6 = v3;
  }

  return v3;
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(MSDUIHelper *)self uiHelperQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AC4E4;
  v7[3] = &unk_100153DF8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4
{
}

- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4 disableIdleTimer:(BOOL)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  v9 = [(MSDUIHelper *)self uiHelperQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AC7A8;
  v11[3] = &unk_100153E20;
  objc_copyWeak(&v13, &location);
  BOOL v14 = a4;
  id v12 = v8;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)stopFullScreenUI:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(MSDUIHelper *)self uiHelperQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ACA14;
  v7[3] = &unk_100153E70;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fullScreenUICanceledByUser
{
  objc_initWeak(&location, self);
  v3 = [(MSDUIHelper *)self uiHelperQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000ACEE0;
  v4[3] = &unk_100151AC8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)requestFullScreenUI
{
  [(MSDUIHelper *)self setFullScreenState:1];
  unsigned int v3 = [(MSDUIHelper *)self launchFullScreenUI];
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request to launch blocking UI: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  dispatch_time_t v5 = dispatch_time(0, 15000000000);
  id v6 = [(MSDUIHelper *)self uiHelperQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AD0E4;
  block[3] = &unk_100151AC8;
  objc_copyWeak(&v8, &buf);
  dispatch_after(v5, v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&buf);
}

- (BOOL)launchFullScreenUI
{
  unsigned int v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to start blocking UI...", v5, 2u);
  }

  return [(MSDUIHelper *)self launchFullScreenUI_ios];
}

- (void)activateFullScreenUIAppMonitor
{
  unsigned int v3 = [(MSDUIHelper *)self displayLayoutMonitor];
  [v3 addObserver:self];

  objc_initWeak(&location, self);
  dispatch_time_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_1000AD300;
  id v8 = &unk_100153EC0;
  objc_copyWeak(&v9, &location);
  id v4 = +[RBSProcessMonitor monitorWithConfiguration:&v5];
  -[MSDUIHelper setFullScreenUIAppMonitor:](self, "setFullScreenUIAppMonitor:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)deactivateFullScreenUIAppMonitor
{
  unsigned int v3 = [(MSDUIHelper *)self displayLayoutMonitor];
  [v3 removeObserver:self];

  id v4 = [(MSDUIHelper *)self fullScreenUIAppMonitor];

  if (v4)
  {
    dispatch_time_t v5 = [(MSDUIHelper *)self fullScreenUIAppMonitor];
    [v5 invalidate];

    [(MSDUIHelper *)self setFullScreenUIAppMonitor:0];
  }
}

- (void)handleFullScreenUIAppStateChange:(unsigned __int8)a3 withVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = a3;
  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v5;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Full screen UI app state change to %d, visible:%d", (uint8_t *)&buf, 0xEu);
  }

  objc_initWeak(&buf, self);
  if (v5 <= 1)
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "App is crashed or terminated.", v17, 2u);
    }

    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    id v10 = [(MSDUIHelper *)self uiHelperQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AD8A4;
    block[3] = &unk_100151AC8;
    v11 = &v16;
    objc_copyWeak(&v16, &buf);
    dispatch_after(v9, v10, block);
LABEL_14:

    objc_destroyWeak(v11);
    goto LABEL_15;
  }
  if ((v5 == 3 || v5 == 4 && !v4) && [(MSDUIHelper *)self backlightStatus])
  {
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "App is no longer in foreground.", v17, 2u);
    }

    id v10 = [(MSDUIHelper *)self uiHelperQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AD940;
    v13[3] = &unk_100151AC8;
    v11 = &v14;
    objc_copyWeak(&v14, &buf);
    dispatch_async(v10, v13);
    goto LABEL_14;
  }
LABEL_15:
  objc_destroyWeak(&buf);
}

- (BOOL)launchFullScreenUI_ios
{
  [(MSDUIHelper *)self setFullScreenUILaunchError_iOS:0];
  v35[0] = @"DisplayString";
  unsigned int v3 = [(MSDUIHelper *)self message];
  v36[0] = v3;
  v35[1] = @"CancelButton";
  BOOL v4 = +[NSNumber numberWithBool:[(MSDUIHelper *)self allowCancel]];
  v36[1] = v4;
  v35[2] = @"DisableIdleTimer";
  unsigned int v5 = +[NSNumber numberWithBool:[(MSDUIHelper *)self disableIdleTimer]];
  v36[2] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

  v7 = [(MSDUIHelper *)self remoteAlertHandle];

  if (v7) {
    goto LABEL_2;
  }
  dispatch_time_t v9 = +[MSDTargetDevice sharedInstance];
  unsigned int v10 = [v9 mode];

  if (v10 == 4)
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000DBC80();
    }

    +[MSDAppLauncherTerminator launchApp:@"com.apple.StoreDemoViewService" withOptions:0 outError:0];
  }
  id v12 = objc_alloc((Class)SBSRemoteAlertDefinition);
  id v13 = +[RBSProcessIdentity identityForApplicationJobLabel:@"com.apple.StoreDemoViewService"];
  id v14 = [v12 initWithSceneProvidingProcess:v13 configurationIdentifier:@"BlockingUIRemoteAlert"];

  id v15 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  [v15 setUserInfo:v6];
  id v16 = +[SBSRemoteAlertHandle newHandleWithDefinition:v14 configurationContext:v15];
  [(MSDUIHelper *)self setRemoteAlertHandle:v16];

  id v17 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  v18 = [(MSDUIHelper *)self remoteAlertHandle];
  [v18 addObserver:self];

  id v19 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  [(MSDUIHelper *)self setConditionLock:v19];

  BOOL v20 = [(MSDUIHelper *)self remoteAlertHandle];
  [v20 activateWithContext:v17];

  v21 = sub_100068600();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136315138;
    v32 = "-[MSDUIHelper launchFullScreenUI_ios]";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Full screen UI was launched.", (uint8_t *)&v31, 0xCu);
  }

  v22 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
  v23 = [(MSDUIHelper *)self conditionLock];
  unsigned int v24 = [v23 lockWhenCondition:1 beforeDate:v22];

  v25 = sub_100068600();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136315138;
    v32 = "-[MSDUIHelper launchFullScreenUI_ios]";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Full screen UI launch completed.", (uint8_t *)&v31, 0xCu);
  }

  if (!v24)
  {

LABEL_13:
    v27 = [(MSDUIHelper *)self fullScreenUILaunchError_iOS];

    if (v27)
    {
      v28 = sub_100068600();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(MSDUIHelper *)self fullScreenUILaunchError_iOS];
        int v31 = 136315394;
        v32 = "-[MSDUIHelper launchFullScreenUI_ios]";
        __int16 v33 = 2114;
        v34 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: Error = %{public}@", (uint8_t *)&v31, 0x16u);
      }
    }
    else
    {
      if (v24)
      {
LABEL_20:
        BOOL v8 = 0;
        goto LABEL_21;
      }
      v28 = sub_100068600();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315138;
        v32 = "-[MSDUIHelper launchFullScreenUI_ios]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: Error = Timeout launching full screen UI.", (uint8_t *)&v31, 0xCu);
      }
    }

    goto LABEL_20;
  }
  v26 = [(MSDUIHelper *)self fullScreenUILaunchError_iOS];

  if (v26) {
    goto LABEL_13;
  }
LABEL_2:
  BOOL v8 = 1;
LABEL_21:

  return v8;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  BOOL v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    BOOL v8 = "-[MSDUIHelper remoteAlertHandleDidActivate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s is called.", (uint8_t *)&v7, 0xCu);
  }

  unsigned int v5 = [(MSDUIHelper *)self conditionLock];

  if (v5)
  {
    uint64_t v6 = [(MSDUIHelper *)self conditionLock];
    [v6 unlockWithCondition:1];
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315138;
    id v14 = "-[MSDUIHelper remoteAlertHandleDidDeactivate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s is called.", buf, 0xCu);
  }

  uint64_t v6 = [(MSDUIHelper *)self conditionLock];

  if (v6)
  {
    int v7 = [(MSDUIHelper *)self conditionLock];
    [v7 unlockWithCondition:1];
  }
  BOOL v8 = [(MSDUIHelper *)self remoteAlertHandle];
  [v8 removeObserver:self];

  dispatch_time_t v9 = [(MSDUIHelper *)self remoteAlertHandle];
  [v9 invalidate];

  [(MSDUIHelper *)self setRemoteAlertHandle:0];
  objc_initWeak((id *)buf, self);
  unsigned int v10 = [(MSDUIHelper *)self uiHelperQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AE188;
  v11[3] = &unk_100153A18;
  void v11[4] = self;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_async(v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 localizedDescription];
    int v10 = 136315394;
    v11 = "-[MSDUIHelper remoteAlertHandle:didInvalidateWithError:]";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called with error - %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(MSDUIHelper *)self setFullScreenUILaunchError_iOS:v5];
  BOOL v8 = [(MSDUIHelper *)self conditionLock];

  if (v8)
  {
    dispatch_time_t v9 = [(MSDUIHelper *)self conditionLock];
    [v9 unlockWithCondition:1];
  }
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  BOOL v8 = [(MSDUIHelper *)self uiHelperQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE458;
  block[3] = &unk_100152040;
  objc_copyWeak(&v12, &location);
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)demoUpdateFailed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(MSDUIHelper *)self uiHelperQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE71C;
  block[3] = &unk_100153A18;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)demoUpdateProgress:(int64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = [(MSDUIHelper *)self uiHelperQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AEBE0;
  block[3] = &unk_100153F10;
  v7[1] = (id)a3;
  objc_copyWeak(v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)demoUpdateAllowCancel:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = [(MSDUIHelper *)self uiHelperQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AEE2C;
  block[3] = &unk_100153F38;
  BOOL v8 = a3;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)demoUpdateCompleted:(id)a3
{
}

- (NSString)fullScreenUIAppId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFullScreenUIAppId:(id)a3
{
}

- (OS_dispatch_queue)uiHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUiHelperQueue:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMessage:(id)a3
{
}

- (BOOL)allowCancel
{
  return self->_allowCancel;
}

- (void)setAllowCancel:(BOOL)a3
{
  self->_allowCancel = a3;
}

- (BOOL)disableIdleTimer
{
  return self->_disableIdleTimer;
}

- (void)setDisableIdleTimer:(BOOL)a3
{
  self->_disableIdleTimer = a3;
}

- (int)fullScreenState
{
  return self->_fullScreenState;
}

- (void)setFullScreenState:(int)a3
{
  self->_fullScreenState = a3;
}

- (OS_xpc_object)pendingMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingMessage:(id)a3
{
}

- (int64_t)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(int64_t)a3
{
  self->_currentProgress = a3;
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return (SBSRemoteAlertHandle *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (NSConditionLock)conditionLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConditionLock:(id)a3
{
}

- (NSError)fullScreenUILaunchError_iOS
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFullScreenUILaunchError_iOS:(id)a3
{
}

- (int64_t)backlightStatus
{
  return self->_backlightStatus;
}

- (void)setBacklightStatus:(int64_t)a3
{
  self->_backlightStatus = a3;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (RBSProcessMonitor)fullScreenUIAppMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFullScreenUIAppMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenUIAppMonitor, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_fullScreenUILaunchError_iOS, 0);
  objc_storeStrong((id *)&self->_conditionLock, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_pendingMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_uiHelperQueue, 0);
  objc_storeStrong((id *)&self->_fullScreenUIAppId, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end