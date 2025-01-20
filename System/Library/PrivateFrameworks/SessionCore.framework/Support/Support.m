void sub_100002A04()
{
  void *v0;
  void *v1;
  unsigned int v2;
  id v3;
  id v4;
  uint8_t buf[4];
  void *v6;

  _set_user_dir_suffix();
  v0 = NSTemporaryDirectory();
  v1 = +[NSFileManager defaultManager];
  v4 = 0;
  v2 = [v1 removeItemAtPath:v0 error:&v4];
  v3 = v4;

  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully cleared temporary directory (%@) contents on startup.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100002FA0((uint64_t)v3);
  }
}

void sub_100002B74(id a1)
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.liveactivitiesd.daemon_workloop");
  v2 = (void *)qword_100008148;
  qword_100008148 = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)qword_100008148, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  v3 = qword_100008148;
  dispatch_activate(v3);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002F60();
  static OS_os_log.default.getter();
  Logger.init(_:)();
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Good morning! 🍎", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100002A04();
  type metadata accessor for Daemon();
  id v10 = [self sharedDaemonWorkloop];
  qword_100008158 = Daemon.__allocating_init(workloop:)();
  dispatch thunk of Daemon.start()();
  static NotificationName.daemonStartup.getter();
  uint64_t v11 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v11 + 32));
  swift_release();
  id v12 = [self mainRunLoop];
  [v12 run];

  return 0;
}

unint64_t sub_100002F60()
{
  unint64_t result = qword_100008140;
  if (!qword_100008140)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008140);
  }
  return result;
}

void sub_100002FA0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error clearing temporary directory contents on startup: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t dispatch thunk of Daemon.start()()
{
  return dispatch thunk of Daemon.start()();
}

uint64_t Daemon.__allocating_init(workloop:)()
{
  return Daemon.__allocating_init(workloop:)();
}

uint64_t type metadata accessor for Daemon()
{
  return type metadata accessor for Daemon();
}

uint64_t static NotificationName.daemonStartup.getter()
{
  return static NotificationName.daemonStartup.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return _dispatch_workloop_set_qos_class_floor();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_sharedDaemonWorkloop(void *a1, const char *a2, ...)
{
  return _[a1 sharedDaemonWorkloop];
}