uint64_t start()
{
  void *v0;
  NSObject *v1;
  int v2;
  size_t v3;
  NSObject *v4;
  NSObject *v5;
  SOSDaemon *v6;
  int v8;
  uint8_t *v9;
  uint8_t buf[72];

  v1 = sub_1000025DC();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "sosd launched", buf, 2u);
  }

  v2 = _set_user_dir_suffix();
  v3 = confstr(65537, (char *)buf, 0x40uLL);
  v4 = sub_1000025DC();
  v5 = v4;
  if (v2 && v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = buf;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "set sosd temporary directory to %s", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100002674(v5);
  }

  v6 = objc_alloc_init(SOSDaemon);
  [(SOSDaemon *)v6 run];

  return 0;
}

id sub_100001380(uint64_t a1)
{
  [(id)objc_opt_class() connectToDaemon];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v2 start];
}

void sub_100001624(uint64_t a1, uint64_t a2)
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000025D4;
  block[3] = &unk_1000042F0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100001C34(uint64_t a1, int a2)
{
  v4 = sub_1000025DC();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully acquired location status bar assertion: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100002790(a1, v5);
  }
}

void sub_100001D10(uint64_t a1)
{
  v2 = sub_1000025DC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Location status bar assertion invalidated: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000024B0(id a1)
{
  dword_100008360 = kFZListenerCapNotifications | kFZListenerCapManageStatus | kFZListenerCapChats | kFZListenerCapFileTransfers | kFZListenerCapIDQueries | kFZListenerCapOnDemandChatRegistry;
}

id sub_1000025D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) languageDidChange];
}

id sub_1000025DC()
{
  if (qword_100008378 != -1) {
    dispatch_once(&qword_100008378, &stru_100004310);
  }
  v0 = (void *)qword_100008370;

  return v0;
}

void sub_100002630(id a1)
{
  qword_100008370 = (uint64_t)os_log_create("com.apple.calls.sos", "default");

  _objc_release_x1();
}

void sub_100002674(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "unable to change temporary directory with error %d", (uint8_t *)v3, 8u);
}

void sub_100002704(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Notification token registration failed, status %d token %d", (uint8_t *)v4, 0xEu);
}

void sub_100002790(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to acquire location status bar assertion: %@", (uint8_t *)&v3, 0xCu);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_connectToDaemon(void *a1, const char *a2, ...)
{
  return [a1 connectToDaemon];
}

id objc_msgSend_createKeepAlivePathStateFile(void *a1, const char *a2, ...)
{
  return [a1 createKeepAlivePathStateFile];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteKeepAlivePathStateFile(void *a1, const char *a2, ...)
{
  return [a1 deleteKeepAlivePathStateFile];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_keepAliveFileDirectory(void *a1, const char *a2, ...)
{
  return [a1 keepAliveFileDirectory];
}

id objc_msgSend_keepAliveFilePath(void *a1, const char *a2, ...)
{
  return [a1 keepAliveFilePath];
}

id objc_msgSend_keepAliveFilename(void *a1, const char *a2, ...)
{
  return [a1 keepAliveFilename];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_releaseLocationStatusBarAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseLocationStatusBarAssertion];
}

id objc_msgSend_releaseMessageSendingOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 releaseMessageSendingOSTransaction];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sosStatusManager(void *a1, const char *a2, ...)
{
  return [a1 sosStatusManager];
}

id objc_msgSend_startSendingLocationUpdateNotification(void *a1, const char *a2, ...)
{
  return [a1 startSendingLocationUpdateNotification];
}

id objc_msgSend_stopSendingLocationUpdateNotification(void *a1, const char *a2, ...)
{
  return [a1 stopSendingLocationUpdateNotification];
}

id objc_msgSend_takeLocationStatusBarAssertion(void *a1, const char *a2, ...)
{
  return [a1 takeLocationStatusBarAssertion];
}

id objc_msgSend_takeMessageSendingOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 takeMessageSendingOSTransaction];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}