void start()
{
  NSObject *v0;
  _xpc_connection_s *mach_service;
  void handler[5];

  xpc_track_activity();
  v0 = dispatch_queue_create("com.apple.tzlink", 0);
  mach_service = xpc_connection_create_mach_service("com.apple.tzlink", v0, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100003710;
  handler[3] = &unk_100004128;
  handler[4] = v0;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_100003710(uint64_t a1, _xpc_connection_s *object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(object, *(dispatch_queue_t *)(a1 + 32));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_1000037BC;
    handler[3] = &unk_100004108;
    handler[4] = object;
    xpc_connection_set_event_handler(object, handler);
    xpc_connection_resume(object);
  }
}

void sub_1000037BC(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = (void *)xpc_connection_copy_entitlement_value();
    if (!v4 || (v5 = v4, BOOL value = xpc_BOOL_get_value(v4), xpc_release(v5), !value))
    {
      int v9 = 1;
      goto LABEL_8;
    }
    string = xpc_dictionary_get_string(object, "tz");
    if (!string)
    {
      int v9 = 22;
      goto LABEL_8;
    }
    v8 = string;
    if ((unint64_t)__strlcpy_chk() >= 0x400)
    {
      int v9 = 63;
LABEL_8:
      xpc_object_t reply = xpc_dictionary_create_reply(object);
      xpc_dictionary_set_uint64(reply, "error", v9);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
      xpc_release(reply);
      return;
    }
    v11 = strdup(v8);
    *(void *)&v13.st_dev = v11;
    while (1)
    {
      v12 = strsep((char **)&v13, "/");
      if (!v12) {
        break;
      }
      int v9 = 22;
      if (!*v12 || *v12 == 46) {
        goto LABEL_18;
      }
      if ((unint64_t)__strlcat_chk() > 0x3FF || (unint64_t)__strlcat_chk() >= 0x400)
      {
        int v9 = 63;
LABEL_18:
        free(v11);
        goto LABEL_8;
      }
    }
    free(v11);
    memset(&v13, 0, sizeof(v13));
    if (lstat(v14, &v13))
    {
      if (!*__error()) {
        goto LABEL_34;
      }
      int v9 = *__error();
      if (v9) {
        goto LABEL_8;
      }
LABEL_31:
      unlink("/var/db/timezone/localtime");
      if (!symlink(v14, "/var/db/timezone/localtime"))
      {
        notify_post("SignificantTimeChangeNotification");
        int v9 = 0;
        goto LABEL_8;
      }
      if (*__error())
      {
        int v9 = *__error();
        goto LABEL_8;
      }
LABEL_34:
      int v9 = 14;
      goto LABEL_8;
    }
    if ((v13.st_mode & 0xF000) == 0x8000)
    {
      if (*(void *)&v13.st_uid)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100003AC8();
        }
      }
      else
      {
        if ((v13.st_mode & 0x1FF) == 0x1A4) {
          goto LABEL_31;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100003B4C();
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_100003BC8((uint64_t)v14);
    }
    int v9 = 2;
    goto LABEL_8;
  }
}

void sub_100003AC8()
{
  sub_100003AB0();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "tzlink failed; \"%{public}s\" is owned by %d:%d",
    v2,
    0x18u);
}

void sub_100003B4C()
{
  sub_100003AB0();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "tzlink failed; \"%{public}s\" has access permissions %o",
    v0,
    0x12u);
}

void sub_100003BC8(uint64_t a1)
{
  int v1 = 136446210;
  uint64_t v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "tzlink failed; \"%{public}s\" is not a regular file",
    (uint8_t *)&v1,
    0xCu);
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
{
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_track_activity()
{
  return _xpc_track_activity();
}