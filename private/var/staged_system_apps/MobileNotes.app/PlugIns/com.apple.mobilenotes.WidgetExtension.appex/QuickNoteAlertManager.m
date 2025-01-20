@interface QuickNoteAlertManager
+ (id)sharedInstance;
- (void)_cleanupRemoteAlertHandle:(id)a3;
- (void)activateRemoteAlert;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation QuickNoteAlertManager

+ (id)sharedInstance
{
  if (qword_1000A6498[0] != -1) {
    dispatch_once(qword_1000A6498, &stru_10009E3F8);
  }
  v2 = (void *)qword_1000A6490;

  return v2;
}

- (void)activateRemoteAlert
{
  if (!self->_remoteAlertHandle)
  {
    id v7 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.SystemPaperViewService" viewControllerClassName:@"ViewController"];
    id v3 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    id v4 = +[SBSRemoteAlertHandle newHandleWithDefinition:v7 configurationContext:v3];
    id v5 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    [v4 registerObserver:self];
    [v4 activateWithContext:v5];
    remoteAlertHandle = self->_remoteAlertHandle;
    self->_remoteAlertHandle = (SBSRemoteAlertHandle *)v4;
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10007BA30(v3);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10007BA74(v5);
  }

  [(QuickNoteAlertManager *)self _cleanupRemoteAlertHandle:v4];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 domain];
  if ([v8 isEqualToString:SBSRemoteAlertHandleInvalidationErrorDomain])
  {
    if (![v6 code] || objc_msgSend(v6, "code") == (id)5)
    {

      goto LABEL_11;
    }
    BOOL v9 = [v6 code] == (id)4;
  }
  else
  {
    BOOL v9 = 0;
  }

  if (!v6 || v9)
  {
LABEL_11:
    v10 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10007BAB8((uint64_t)v6, v10);
    }
    goto LABEL_13;
  }
  v10 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10007BB30((uint64_t)v6, v10);
  }
LABEL_13:

  [(QuickNoteAlertManager *)self _cleanupRemoteAlertHandle:v7];
}

- (void)_cleanupRemoteAlertHandle:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000417C;
  v5[3] = &unk_10009E420;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void).cxx_destruct
{
}

@end