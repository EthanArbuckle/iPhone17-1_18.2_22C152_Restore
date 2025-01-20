void init_launchd_helper(uint64_t a1)
{
  qword_4138 = a1;
  xpc_event_provider_create();
}

void sub_35D4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 == 1)
  {
    v8 = malloc_type_calloc(1uLL, 0x48uLL, 0x10B0040E7BEABC5uLL);
    v8[1] = a2;
    string = xpc_dictionary_get_string(a3, "Executable");
    if (string)
    {
      if (*string == 47)
      {
        v8[2] = strdup(string);
        os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)qword_4148);
        v8[3] = v10;
        v11 = sub_396C((const char *)v8[2]);
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          CFIndex v12 = (CFIndex)v11;
          v13 = qword_4148;
          if (os_signpost_enabled((os_log_t)qword_4148))
          {
            LODWORD(buf.version) = 136446210;
            *(CFIndex *)((char *)&buf.version + 4) = v12;
            _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_EVENT, v10, "EventsChangedForExecutable", "executable_missing=%{public, signpost.telemetry:string1}s enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
          }
        }
      }
    }
    xpc_object_t value = xpc_dictionary_get_value(a3, "UID");
    if (value)
    {
      v15 = value;
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
      {
        v8[5] = xpc_retain(v15);
        *((unsigned char *)v8 + 64) = 1;
      }
    }
    v16 = xpc_dictionary_get_string(a3, "UserName");
    if (v16)
    {
      v8[6] = strdup(v16);
      *((unsigned char *)v8 + 64) = 1;
    }
    v17 = xpc_dictionary_get_string(a3, "GroupName");
    if (v17)
    {
      v8[7] = strdup(v17);
      *((unsigned char *)v8 + 64) = 1;
    }
    BOOL v18 = xpc_dictionary_get_BOOL(a3, "SkipImmediatePoll");
    void *v8 = launchd_helper_events;
    launchd_helper_events = (uint64_t)v8;
    if (!v18) {
      sub_39B4();
    }
    v19 = (const char *)v8[2];
    if (v19)
    {
      values = (void *)CFStringCreateWithCString(kCFAllocatorDefault, v19, 0x8000100u);
      CFArrayRef v20 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = v8;
      FSEventStreamRef v21 = FSEventStreamCreate(kCFAllocatorDefault, (FSEventStreamCallback)sub_3BD8, &buf, v20, 0xFFFFFFFFFFFFFFFFLL, 0.05, 4u);
      v8[4] = v21;
      if (!v21) {
        _os_assumes_log();
      }
      xpc_event_provider_get_queue();
    }
  }
  else if (a1 == 2)
  {
    v4 = &launchd_helper_events;
    v5 = &launchd_helper_events;
    while (1)
    {
      v5 = (uint64_t *)*v5;
      if (!v5) {
        break;
      }
      if (v5[1] == a2)
      {
        for (i = (uint64_t *)launchd_helper_events; i != v5; i = (uint64_t *)*i)
          v4 = i;
        uint64_t *v4 = *v5;
        free((void *)v5[2]);
        v22 = (void *)v5[5];
        if (v22) {
          xpc_release(v22);
        }
        free((void *)v5[6]);
        free((void *)v5[7]);
        v23 = (__FSEventStream *)v5[4];
        if (v23)
        {
          FSEventStreamStop(v23);
          FSEventStreamInvalidate((FSEventStreamRef)v5[4]);
          FSEventStreamRelease((FSEventStreamRef)v5[4]);
          v5[4] = 0;
        }
        free(v5);
        return;
      }
    }
  }
}

char *sub_396C(const char *a1)
{
  v1 = (char *)a1;
  if (!strncmp(a1, "/var/", 5uLL)) {
    return strrchr(v1, 47) + 1;
  }
  return v1;
}

const char *sub_39B4()
{
  uint64_t v0 = off_4130();
  BOOL v18 = 0;
  memset(&v17, 0, sizeof(v17));
  v16 = 0;
  memset(&v15, 0, sizeof(v15));
  v1 = *(const char **)(v0 + 16);
  if (v1)
  {
    memset(&v21, 0, sizeof(v21));
    result = (const char *)stat(v1, &v21);
    if (result || (v21.st_mode & 0xF000) != 0x8000 || (v21.st_mode & 0x49) == 0) {
      return result;
    }
    v3 = sub_396C(*(const char **)(v0 + 16));
    os_signpost_id_t v4 = *(void *)(v0 + 24);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v3;
      v6 = qword_4148;
      if (os_signpost_enabled((os_log_t)qword_4148))
      {
        *(_DWORD *)FSEventStreamContext buf = 136446210;
        CFArrayRef v20 = v5;
        _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_EVENT, v4, "PollStateForExecutable", "executable_found=%{public, signpost.telemetry:string1}s enableTelemetry=YES ", buf, 0xCu);
      }
    }
    *(void *)(v0 + 24) = 0;
    unint64_t v7 = 1;
  }
  else
  {
    unint64_t v7 = 0;
  }
  v8 = *(void **)(v0 + 40);
  if (v8)
  {
    uid_t value = xpc_uint64_get_value(v8);
    result = (const char *)getpwuid_r(value, &v17, (char *)&v21, 0x1000uLL, &v18);
    if (result) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v18 == 0;
    }
    if (v10) {
      unint64_t v11 = v7;
    }
    else {
      unint64_t v11 = v7 + 1;
    }
    if (v10) {
      return result;
    }
    unint64_t v12 = v7 + 1;
    unint64_t v7 = v11;
  }
  else
  {
    unint64_t v12 = v7;
  }
  result = *(const char **)(v0 + 48);
  if (result)
  {
    ++v12;
    result = (const char *)getpwnam_r(result, &v17, (char *)&v21, 0x1000uLL, &v18);
    if (!result && v18 != 0) {
      ++v7;
    }
  }
  if (v7 >= v12)
  {
    result = *(const char **)(v0 + 56);
    if (result)
    {
      ++v12;
      result = (const char *)getgrnam_r(result, &v15, (char *)&v21, 0x1000uLL, &v16);
      if (result) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v16 == 0;
      }
      if (!v14) {
        ++v7;
      }
    }
    if (v7 >= v12) {
      xpc_event_provider_token_set_state();
    }
  }
  return result;
}

const char *sub_3BD8()
{
  return sub_39B4();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return _FSEventStreamCreate(allocator, callback, context, pathsToWatch, sinceWhen, latency, flags);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return _FSEventStreamStart(streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return _getgrnam_r(a1, a2, a3, a4, a5);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwnam_r(a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwuid_r(a1, a2, a3, a4, a5);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_set_state()
{
  while (1)
    ;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}