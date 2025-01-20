@interface MBRestoreNetworkAccessPrompt
+ (id)connection;
- (BOOL)isCancellable;
- (MBHelperServiceProtocol)proxy;
- (MBRestoreNetworkAccessPrompt)init;
- (OS_dispatch_group)cancelGroup;
- (OS_dispatch_queue)notificationQueue;
- (id)notificationRef;
- (void)_cancelWithBlocking:(BOOL)a3;
- (void)_finishXPCWithError:(id)a3;
- (void)_firePromptWithDict:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)fireCellularPromptWithEstimate:(unint64_t)a3 completion:(id)a4;
- (void)fireWiFiPromptWithCompletion:(id)a3;
- (void)setCancelGroup:(id)a3;
- (void)setNotificationRef:(id)a3;
- (void)setProxy:(id)a3;
@end

@implementation MBRestoreNetworkAccessPrompt

- (MBRestoreNetworkAccessPrompt)init
{
  v13.receiver = self;
  v13.super_class = (Class)MBRestoreNetworkAccessPrompt;
  v2 = [(MBRestoreNetworkAccessPrompt *)&v13 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    cancelGroup = v2->_cancelGroup;
    v2->_cancelGroup = (OS_dispatch_group *)v3;

    atomic_store(0, (unsigned __int8 *)&v2->_isPromptInFlight);
    atomic_store(0, (unsigned __int8 *)&v2->_cancellationInProgress);
    atomic_store(0, (unsigned __int8 *)&v2->_isCancellable);
    objc_storeStrong((id *)&v2->_notificationQueue, &_dispatch_main_q);
    uint64_t v5 = [(id)objc_opt_class() connection];
    if (!v5) {
      __assert_rtn("-[MBRestoreNetworkAccessPrompt init]", "MBRestoreNetworkAccessPrompt.m", 43, "connection != nil");
    }
    v6 = (void *)v5;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100123DBC;
    v11[3] = &unk_100411060;
    v7 = v2;
    v12 = v7;
    uint64_t v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
    proxy = v7->_proxy;
    v7->_proxy = (MBHelperServiceProtocol *)v8;

    if (!v7->_proxy) {
      __assert_rtn("-[MBRestoreNetworkAccessPrompt init]", "MBRestoreNetworkAccessPrompt.m", 48, "_proxy != nil");
    }
  }
  return v2;
}

- (void)dealloc
{
  [(MBRestoreNetworkAccessPrompt *)self _cancelWithBlocking:0];
  v3.receiver = self;
  v3.super_class = (Class)MBRestoreNetworkAccessPrompt;
  [(MBRestoreNetworkAccessPrompt *)&v3 dealloc];
}

- (void)_cancelWithBlocking:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to cancel restore network prompt, blocking:%d", buf, 8u);
    _MBLog();
  }

  v6 = self;
  objc_sync_enter(v6);
  v7 = (__CFUserNotification *)v6->_notificationRef;
  id notificationRef = v6->_notificationRef;
  v6->_id notificationRef = 0;

  objc_sync_exit(v6);
  if (v7)
  {
    atomic_store(1u, (unsigned __int8 *)&v6->_cancellationInProgress);
    CFUserNotificationCancel(v7);
    if (v3) {
      dispatch_group_wait((dispatch_group_t)v6->_cancelGroup, 0xFFFFFFFFFFFFFFFFLL);
    }
    atomic_store(0, (unsigned __int8 *)&v6->_cancellationInProgress);
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelled active restore network prompt", buf, 2u);
LABEL_10:
      _MBLog();
    }
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No active network prompt to cancel", buf, 2u);
      goto LABEL_10;
    }
  }
}

- (void)cancel
{
}

- (BOOL)isCancellable
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCancellable);
  return v2 & 1;
}

- (void)fireCellularPromptWithEstimate:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void, void *))a4;
  if (atomic_exchange(&self->_isPromptInFlight._Value, 1u))
  {
    v14 = +[MBError errorWithCode:3 format:@"A prompt is already in-flight"];
    v6[2](v6, 0, v14);
  }
  else
  {
    v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating cellular prompt", buf, 2u);
      _MBLog();
    }

    *(void *)buf = 0;
    v20 = buf;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100124394;
    v23 = sub_1001243A4;
    v24 = &stru_100418BA8;
    proxy = self->_proxy;
    if (!proxy) {
      __assert_rtn("-[MBRestoreNetworkAccessPrompt fireCellularPromptWithEstimate:completion:]", "MBRestoreNetworkAccessPrompt.m", 94, "_proxy != nil");
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001243AC;
    v18[3] = &unk_100411088;
    v18[4] = buf;
    [(MBHelperServiceProtocol *)proxy localizedStringFromByteCount:a3 countStyle:0 reply:v18];
    v9 = MBLocalizedStringFromTable();
    uint64_t v15 = *((void *)v20 + 5);
    v10 = MBLocalizedStringWithSubstitutions();
    BOOL v11 = MBLocalizedStringFromTable();
    v12 = MBLocalizedStringFromTable();
    v25[0] = kCFUserNotificationAlertHeaderKey;
    v25[1] = kCFUserNotificationAlertMessageKey;
    v26[0] = v9;
    v26[1] = v10;
    v25[2] = kCFUserNotificationDefaultButtonTitleKey;
    v25[3] = kCFUserNotificationAlternateButtonTitleKey;
    v26[2] = v11;
    v26[3] = v12;
    objc_super v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4, v15);
    dispatch_group_enter((dispatch_group_t)self->_cancelGroup);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001244A0;
    v16[3] = &unk_100413C58;
    v16[4] = self;
    v17 = v6;
    [(MBRestoreNetworkAccessPrompt *)self _firePromptWithDict:v13 retryCount:1 completion:v16];

    _Block_object_dispose(buf, 8);
  }
}

- (void)fireWiFiPromptWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  if (atomic_exchange(&self->_isPromptInFlight._Value, 1u))
  {
    v14 = +[MBError errorWithCode:3 format:@"A prompt is already in-flight"];
    v4[2](v4, 0, v14);
  }
  else
  {
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating WiFi prompt", buf, 2u);
      _MBLog();
    }

    v6 = objc_msgSend(@"MBS_WIFI_NEEDED_ALERT_TITLE", "mb_stringByAppendingGreenteaSuffix");
    v7 = MBLocalizedStringFromTable();

    uint64_t v8 = objc_msgSend(@"MBS_WIFI_NEEDED_ALERT_DESCRIPTION", "mb_stringByAppendingGreenteaSuffix");
    v9 = MBLocalizedStringFromTable();

    v10 = objc_msgSend(@"MBS_WIFI_NEEDED_ALERT_SETTINGS_BUTTON", "mb_stringByAppendingGreenteaSuffix");
    BOOL v11 = MBLocalizedStringFromTable();

    v12 = MBLocalizedStringFromTable();
    v18[0] = kCFUserNotificationAlertHeaderKey;
    v18[1] = kCFUserNotificationAlertMessageKey;
    v19[0] = v7;
    v19[1] = v9;
    v18[2] = kCFUserNotificationDefaultButtonTitleKey;
    v18[3] = kCFUserNotificationAlternateButtonTitleKey;
    v19[2] = v11;
    v19[3] = v12;
    objc_super v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    dispatch_group_enter((dispatch_group_t)self->_cancelGroup);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001247FC;
    v15[3] = &unk_100413C58;
    v15[4] = self;
    v16 = v4;
    [(MBRestoreNetworkAccessPrompt *)self _firePromptWithDict:v13 retryCount:1 completion:v15];
  }
}

- (void)_firePromptWithDict:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = 10;
  if (a4 == 1) {
    uint64_t v10 = 0;
  }
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001249A8;
  block[3] = &unk_100413C80;
  dispatch_time_t v12 = 1000000000 * v10;
  id v18 = v9;
  unint64_t v19 = a4;
  id v16 = v8;
  v17 = self;
  uint64_t v20 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_after(v12, notificationQueue, block);
}

+ (id)connection
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (qword_1004824E0)
  {
    id v3 = (id)qword_1004824E0;
  }
  else
  {
    if (qword_1004824F0 != -1) {
      dispatch_once(&qword_1004824F0, &stru_100413CA0);
    }
    id v4 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.MobileBackup.MBHelperService"];
    [v4 setRemoteObjectInterface:qword_1004824E8];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100124E24;
    v6[3] = &unk_100411038;
    v6[4] = v2;
    [v4 setInvalidationHandler:v6];
    objc_storeStrong((id *)&qword_1004824E0, v4);
    [v4 resume];
    id v3 = (id)qword_1004824E0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)_finishXPCWithError:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MBPrebuddyFollowUpController finish XPC with error: %{public}@", buf, 0xCu);
    _MBLog();
  }
}

- (id)notificationRef
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setNotificationRef:(id)a3
{
}

- (OS_dispatch_group)cancelGroup
{
  return self->_cancelGroup;
}

- (void)setCancelGroup:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (MBHelperServiceProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_cancelGroup, 0);
  objc_storeStrong(&self->_notificationRef, 0);
}

@end