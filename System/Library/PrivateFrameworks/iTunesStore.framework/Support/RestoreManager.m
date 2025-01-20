@interface RestoreManager
+ (id)sharedInstance;
+ (void)_applyRestoreCellularAccess;
- (BOOL)isCellularAllowed;
- (RestoreManager)init;
- (void)_queue_fetchRestoreCellularAccess;
- (void)_queue_restoreStateChangeHandler;
- (void)dealloc;
@end

@implementation RestoreManager

+ (id)sharedInstance
{
  if (qword_100401F80 != -1) {
    dispatch_once(&qword_100401F80, &stru_1003A8368);
  }
  v2 = (void *)qword_100401F88;

  return v2;
}

- (RestoreManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)RestoreManager;
  v2 = [(RestoreManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.itunesstored.RestoreManager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    if (_os_feature_enabled_impl())
    {
      ISWeakLinkedStringConstantForString();
      id v6 = objc_claimAutoreleasedReturnValue();
      v7 = (const char *)[v6 UTF8String];

      v8 = v2->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100172F3C;
      handler[3] = &unk_1003A8390;
      v9 = v2;
      v15 = v9;
      notify_register_dispatch(v7, &v2->_restoreStateToken, v8, handler);
      v10 = v2->_dispatchQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100172F44;
      v12[3] = &unk_1003A3140;
      v13 = v9;
      dispatch_async(v10, v12);
    }
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_restoreCellularToken);
  notify_cancel(self->_restoreStateToken);
  v3.receiver = self;
  v3.super_class = (Class)RestoreManager;
  [(RestoreManager *)&v3 dealloc];
}

- (BOOL)isCellularAllowed
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100173074;
  v6[3] = &unk_1003A34F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatchQueue, v6);
  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (void)_applyRestoreCellularAccess
{
  if (_os_feature_enabled_impl())
  {
    id v2 = +[DownloadsDatabase downloadsDatabase];
    [v2 modifyAsyncUsingTransactionBlock:&stru_1003A83B0];
  }
}

- (void)_queue_fetchRestoreCellularAccess
{
  if (_os_feature_enabled_impl())
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    restoreManager = self->_restoreManager;
    if (!restoreManager)
    {
      v5 = +[NSAssertionHandler currentHandler];
      [v5 handleFailureInMethod:a2, self, @"RestoreManager.m", 136, @"Invalid parameter not satisfying: %@", @"_restoreManager != nil" object file lineNumber description];

      restoreManager = self->_restoreManager;
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10017350C;
    v6[3] = &unk_1003A83D8;
    v6[4] = self;
    [(MBManager *)restoreManager fetchBackgroundRestoreCellularAccessWithCompletion:v6];
  }
}

- (void)_queue_restoreStateChangeHandler
{
  if (!_os_feature_enabled_impl()) {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(self->_restoreStateToken, &state64);
  uint64_t v4 = +[SSLogConfig sharedDaemonConfig];
  v5 = (void *)v4;
  if (state)
  {
    if (!v4)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v30 = 67109120;
      LODWORD(v31) = state;
      LODWORD(v27) = 8;
      char v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        return;
      }
      v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v30, v27);
      free(v10);
      SSFileLog();
    }

    goto LABEL_15;
  }
  if (!v4)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  v13 = [v5 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    int v14 = v12;
  }
  else {
    int v14 = v12 & 2;
  }
  if (!v14) {
    goto LABEL_27;
  }
  int v30 = 134217984;
  uint64_t v31 = state64;
  LODWORD(v27) = 12;
  v26 = &v30;
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v30, v27);
    free(v15);
    v26 = (int *)v13;
    SSFileLog();
LABEL_27:
  }
  if (!self->_restoreManager && state64 - 1 <= 1)
  {
    objc_super v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      objc_super v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = objc_msgSend(v16, "shouldLog", v26);
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = [v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      LOWORD(v30) = 0;
      LODWORD(v27) = 2;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_42:

        v22 = (MBManager *)objc_alloc_init((Class)sub_1000E7CCC());
        restoreManager = self->_restoreManager;
        self->_restoreManager = v22;

        v24 = (const char *)[@"com.apple.private.restrict-post.MobileBackup.backgroundCellularAccessChanged" UTF8String];
        dispatchQueue = self->_dispatchQueue;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100173B9C;
        handler[3] = &unk_1003A8390;
        void handler[4] = self;
        notify_register_dispatch(v24, &self->_restoreCellularToken, dispatchQueue, handler);
        [(RestoreManager *)self _queue_fetchRestoreCellularAccess];
        return;
      }
      v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v30, v27);
      free(v21);
      SSFileLog();
    }

    goto LABEL_42;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_cellularAccess, 0);
}

@end