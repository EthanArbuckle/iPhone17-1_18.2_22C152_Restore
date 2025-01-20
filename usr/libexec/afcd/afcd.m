uint64_t start(int a1, char *const *a2)
{
  int v4;
  const char *v5;
  const char *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  CFStringRef Value;
  CFStringRef v10;
  CFTypeID v11;
  CFComparisonResult v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int *v17;
  int *v19;
  NSObject *v20;
  NSObject *global_queue;
  stat v22;
  char *errorbuf;
  unsigned char v24[1024];

  bzero(v24, 0x400uLL);
  memset(&v22, 0, sizeof(v22));
  AFCPlatformInitialize();
  AFCLog();
  signal(13, (void (__cdecl *)(int))1);
  while (1)
  {
    v4 = getopt_long(a1, a2, "r", (const option *)&off_100008000, 0);
    if (v4 != 114) {
      break;
    }
    qword_100008040 = (uint64_t)"com.apple.crashreportcopymobile";
  }
  if (v4 != -1)
  {
    fwrite("usage: afcd [-r]\n", 0x11uLL, 1uLL, __stderrp);
    fwrite("  -r | --crash-reporter      : run afcd for crash reporter\n", 0x3BuLL, 1uLL, __stderrp);
    goto LABEL_42;
  }
  v5 = (const char *)qword_100008040;
  if (!qword_100008040)
  {
    v5 = "com.apple.afcd";
    qword_100008040 = (uint64_t)"com.apple.afcd";
  }
  if (strcmp(v5, "com.apple.crashreportcopymobile"))
  {
    v6 = "/private/var/mobile/Media";
    goto LABEL_17;
  }
  v7 = (const __CFDictionary *)MKBUserTypeDeviceMode();
  if (!v7) {
    goto LABEL_16;
  }
  v8 = v7;
  Value = (const __CFString *)CFDictionaryGetValue(v7, kMKBDeviceModeKey);
  if (!Value || (v10 = Value, v11 = CFGetTypeID(Value), v11 != CFStringGetTypeID()))
  {
    CFRelease(v8);
    goto LABEL_16;
  }
  v12 = CFStringCompare(v10, kMKBDeviceModeMultiUser, 0);
  CFRelease(v8);
  if (v12)
  {
LABEL_16:
    v6 = "/private/var/mobile/Library/Logs/CrashReporter";
    goto LABEL_17;
  }
  v13 = container_system_group_path_for_identifier();
  if (!v13) {
    goto LABEL_43;
  }
  v14 = (void *)v13;
  v6 = v24;
  __strcpy_chk();
  __strcat_chk();
  free(v14);
LABEL_17:
  if (kqueue() == -1)
  {
LABEL_43:
    AFCLog();
LABEL_42:
    exit(1);
  }
  if (lstat(v6, &v22) < 0)
  {
    if (*__error() != 2) {
      goto LABEL_36;
    }
  }
  else if ((v22.st_mode & 0xF000) == 0xA000)
  {
    goto LABEL_40;
  }
  qword_100008048 = (uint64_t)realpath_DARWIN_EXTSN(v6, 0);
  if (qword_100008048) {
    goto LABEL_26;
  }
  if (*__error() != 2)
  {
    v19 = __error();
    strerror(*v19);
    goto LABEL_43;
  }
  if (mkdir(v6, 0x1EDu) < 0)
  {
LABEL_36:
    __error();
    goto LABEL_40;
  }
  qword_100008048 = (uint64_t)strdup(v6);
LABEL_26:
  AFCLog();
  if (lstat((const char *)qword_100008048, &v22) < 0) {
    goto LABEL_36;
  }
  AFCLog();
  if ((v22.st_mode & 0xF000) == 0x4000)
  {
    errorbuf = 0;
    v15 = sandbox_extension_issue_file();
    if (v15)
    {
      v16 = (void *)v15;
      if (sandbox_init("afcd", 2uLL, &errorbuf) < 0)
      {
        AFCLog();
        sandbox_free_error(errorbuf);
      }
      else
      {
        if ((sandbox_extension_consume() & 0x8000000000000000) == 0)
        {
          free(v16);
          qword_100008050 = (uint64_t)dispatch_group_create();
          v20 = dispatch_queue_create("afcd xpc listener", 0);
          qword_100008058 = (uint64_t)v20;
          global_queue = dispatch_get_global_queue(2, 0);
          dispatch_set_target_queue(v20, global_queue);
          AFCLog();
          sub_1000029D8((const char *)qword_100008040, qword_100008058);
          dispatch_main();
        }
        __error();
        if (!errorbuf)
        {
          v17 = __error();
          strerror(*v17);
        }
        AFCLog();
      }
      free(v16);
    }
    else
    {
      __error();
      AFCLog();
    }
  }
LABEL_40:
  AFCLog();
  return 1;
}

void sub_1000029D8(const char *a1, NSObject *a2)
{
  if (!qword_100008060)
  {
    AFCLog();
    mach_service = xpc_connection_create_mach_service(a1, a2, 1uLL);
    qword_100008060 = (uint64_t)mach_service;
    if (!mach_service)
    {
      AFCLog();
      exit(1);
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100002AB4;
    handler[3] = &unk_1000042C0;
    char v6 = 0;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume((xpc_connection_t)qword_100008060);
  }
}

uint64_t sub_100002AB4(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    char v6 = *(unsigned char *)(a1 + 32);
    AFCLog();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100002C2C;
    handler[3] = &unk_1000042E0;
    char v8 = v6;
    void handler[4] = object;
    xpc_connection_set_event_handler((xpc_connection_t)object, handler);
    AFCLog();
    xpc_connection_resume((xpc_connection_t)object);
    return AFCLog();
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (object == &_xpc_error_termination_imminent)
      {
        AFCLog();
        exit(0);
      }
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      AFCLog();
      xpc_connection_cancel((xpc_connection_t)qword_100008060);
      exit(1);
    }
    return AFCLog();
  }
}

void sub_100002C2C(uint64_t a1, void *a2)
{
  AFCLog();
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    AFCLog();
    if (!lockdown_copy_checkin_info())
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      bzero(buffer, 0x400uLL);
      AFCLog();
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, 0);
      int v7 = secure_lockdown_checkin();
      CFRelease(Mutable);
      if (v7) {
        goto LABEL_18;
      }
      lockdown_get_socket();
      lockdown_get_securecontext();
      AFCLog();
      int socket = lockdown_get_socket();
      lockdown_get_securecontext();
      v9 = (const char *)qword_100008048;
      AFCLog();
      xpc_transaction_begin();
      int v17 = 1;
      if (setsockopt(socket, 0xFFFF, 4130, &v17, 4u) < 0)
      {
        v10 = __error();
        strerror(*v10);
        AFCLog();
      }
      if (!AFCCreateServerContext()
        || (CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, v9, 0x8000100u),
            AFCServerContextSetRootPath(),
            CFRelease(v11),
            AFCServerContextSetLockdownConnection(),
            (uint64_t v12 = AFCConnectionCreate()) == 0))
      {
LABEL_18:
        AFCLog();
        exit(1);
      }
      v13 = (void *)v12;
      AFCConnectionSetSecureContext();
      AFCConnectionSetDisposeSecureContextOnInvalidate();
      AFCInitServerConnection();
      if (v5) {
        AFCServerConnectionSetFileCoordinationEnabled();
      }
      AFCLog();
      global_queue = dispatch_get_global_queue(21, 0);
      dispatch_group_async_f((dispatch_group_t)qword_100008050, global_queue, v13, (dispatch_function_t)sub_1000030A4);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_100003150;
      block[3] = &unk_100004300;
      char v16 = 1;
      dispatch_group_notify((dispatch_group_t)qword_100008050, (dispatch_queue_t)qword_100008058, block);
      AFCLog();
      CFRelease(0);
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_error {
         && a2 != &_xpc_error_termination_imminent
  }
         && a2 != &_xpc_error_connection_invalid)
  {
    xpc_dictionary_get_string(a2, _xpc_error_key_description);
  }
  AFCLog();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

uint64_t sub_1000030A4(const void *a1)
{
  if (AFCServerContextGetLockdownConnection())
  {
    AFCServerContextGetLockdownConnection();
    lockdown_disconnect();
  }
  AFCFreeServerContext();
  AFCConnectionSetContext();
  AFCConnectionInvalidate();
  CFRelease(a1);
  AFCLog();
  xpc_transaction_end();
  return 0;
}

uint64_t sub_100003150(uint64_t a1)
{
  uint64_t result = AFCLog();
  if (!*(unsigned char *)(a1 + 32))
  {
    AFCLog();
    exit(0);
  }
  return result;
}

uint64_t AFCConnectionCreate()
{
  return _AFCConnectionCreate();
}

uint64_t AFCConnectionGetContext()
{
  return _AFCConnectionGetContext();
}

uint64_t AFCConnectionInvalidate()
{
  return _AFCConnectionInvalidate();
}

uint64_t AFCConnectionSetContext()
{
  return _AFCConnectionSetContext();
}

uint64_t AFCConnectionSetDisposeSecureContextOnInvalidate()
{
  return _AFCConnectionSetDisposeSecureContextOnInvalidate();
}

uint64_t AFCConnectionSetIOTimeout()
{
  return _AFCConnectionSetIOTimeout();
}

uint64_t AFCConnectionSetSecureContext()
{
  return _AFCConnectionSetSecureContext();
}

uint64_t AFCCreateServerContext()
{
  return _AFCCreateServerContext();
}

uint64_t AFCFreeServerContext()
{
  return _AFCFreeServerContext();
}

uint64_t AFCInitServerConnection()
{
  return _AFCInitServerConnection();
}

uint64_t AFCLog()
{
  return _AFCLog();
}

uint64_t AFCPlatformInitialize()
{
  return _AFCPlatformInitialize();
}

uint64_t AFCServeWithRoot()
{
  return _AFCServeWithRoot();
}

uint64_t AFCServerConnectionSetFileCoordinationEnabled()
{
  return _AFCServerConnectionSetFileCoordinationEnabled();
}

uint64_t AFCServerContextGetLockdownConnection()
{
  return _AFCServerContextGetLockdownConnection();
}

uint64_t AFCServerContextGetRootPath()
{
  return _AFCServerContextGetRootPath();
}

uint64_t AFCServerContextSetLockdownConnection()
{
  return _AFCServerContextSetLockdownConnection();
}

uint64_t AFCServerContextSetRootPath()
{
  return _AFCServerContextSetRootPath();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t MKBUserTypeDeviceMode()
{
  return _MKBUserTypeDeviceMode();
}

int *__error(void)
{
  return ___error();
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

int kqueue(void)
{
  return _kqueue();
}

uint64_t lockdown_copy_checkin_info()
{
  return _lockdown_copy_checkin_info();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_securecontext()
{
  return _lockdown_get_securecontext();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

void sandbox_free_error(char *errorbuf)
{
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}