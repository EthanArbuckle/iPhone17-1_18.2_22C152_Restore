uint64_t start()
{
  os_log_t v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _UNKNOWN **v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  _UNKNOWN **v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  unint64_t v27;
  char *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  char *v34;
  char *v35;
  NSObject *v36;
  NSObject *v37;
  unint64_t v38;
  uint64_t (**v39)(void);
  int v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  unint64_t v45;
  void (**v46)(void);
  void *v47;
  NSObject *v48;
  NSObject *v50;
  void *context;
  char *v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  char *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;

  v0 = os_log_create("com.apple.BiometricKit", "Daemon");
  v1 = (void *)qword_100008090;
  qword_100008090 = (uint64_t)v0;

  v2 = (void *)qword_100008090;
  if (!qword_100008090)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003258();
    }
    v2 = (void *)qword_100008090;
  }
  objc_storeStrong((id *)&qword_100008098, v2);
  if (qword_100008090) {
    v3 = qword_100008090;
  }
  else {
    v3 = &_os_log_default;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "--- /usr/libexec/biometrickitd ---\n", buf, 2u);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004158);
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004178);

  v4 = +[NSMutableArray array];
  v5 = +[NSProcessInfo processInfo];
  v6 = [v5 arguments];

  if ([v6 count])
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = [v6 objectAtIndexedSubscript:v7];
      v10 = [v9 isEqualToString:@"-module"];

      if (v10)
      {
        if ((char *)[v6 count] - 1 <= v7)
        {
          if (qword_100008090) {
            v13 = qword_100008090;
          }
          else {
            v13 = &_os_log_default;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "invalid program arguments, using default modules\n", buf, 2u);
          }
          [v4 removeAllObjects];
          break;
        }
        v11 = [v6 objectAtIndexedSubscript:++v8];
        v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 integerValue]);

        if ([&off_100004270 indexOfObject:v12] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (qword_100008090) {
            v14 = qword_100008090;
          }
          else {
            v14 = &_os_log_default;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "invalid module index, using default modules\n", buf, 2u);
          }
          [v4 removeAllObjects];

          break;
        }
        [v4 addObject:v12];
      }
      v7 = (char *)++v8;
    }
    while ((unint64_t)[v6 count] > v8);
  }
  if ([v4 count]) {
    v15 = (_UNKNOWN **)[v4 copy];
  }
  else {
    v15 = 0;
  }

  v16 = [v15 count];
  if (!v16)
  {

    v15 = &off_100004258;
  }
  if (![v15 count])
  {
    v50 = qword_100008090 ? qword_100008090 : &_os_log_default;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v59 = "moduleIndexes.count > 0";
      v60 = 2048;
      v61 = 0;
      v62 = 2080;
      v63 = &unk_100003766;
      v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/biometrickitd/biometrickitd.m";
      v66 = 1024;
      v67 = 80;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (qword_100008090) {
    v17 = qword_100008090;
  }
  else {
    v17 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = (const char *)[v15 count];
    *(_DWORD *)buf = 134217984;
    v59 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "number of modules: %lu\n", buf, 0xCu);
  }
  v20 = +[NSMutableArray array];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v21 = v15;
  v22 = [v21 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v22)
  {
    v23 = v22;
    v24 = *(void *)v54;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/usr/lib/libBKDM%lu.dylib", [*(id *)(*((void *)&v53 + 1) + 8 * i) unsignedLongValue]);
        [v20 addObject:v26];
      }
      v23 = [v21 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v23);
  }

  v52 = (char *)malloc_type_calloc((size_t)[v20 count], 0x18uLL, 0x80040D6874129uLL);
  if ([v20 count])
  {
    v27 = 0;
    v28 = v52;
    do
    {
      v29 = [v20 objectAtIndexedSubscript:v27];
      *(void *)v28 = dlopen((const char *)[v29 UTF8String], 1);

      if (*(void *)v28)
      {
        v30 = dlsym(*(void **)v28, "BKDMInitialize");
        *((void *)v28 + 1) = v30;
        if (!v30)
        {
          v36 = qword_100008090 ? qword_100008090 : &_os_log_default;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v59 = "modules[i].BKDMInitialize";
            v60 = 2048;
            v61 = 0;
            v62 = 2080;
            v63 = &unk_100003766;
            v64 = 2080;
            v65 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/biometrickitd/biometrickitd.m";
            v66 = 1024;
            v67 = 96;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        v31 = dlsym(*(void **)v28, "BKDMTerminate");
        *((void *)v28 + 2) = v31;
        if (!v31)
        {
          v37 = qword_100008090 ? qword_100008090 : &_os_log_default;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v59 = "modules[i].BKDMTerminate";
            v60 = 2048;
            v61 = 0;
            v62 = 2080;
            v63 = &unk_100003766;
            v64 = 2080;
            v65 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/biometrickitd/biometrickitd.m";
            v66 = 1024;
            v67 = 98;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
      }
      else if (v16)
      {
        v32 = qword_100008090 ? qword_100008090 : &_os_log_default;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = v32;
          v34 = [v20 objectAtIndexedSubscript:v27];
          v35 = dlerror();
          *(_DWORD *)buf = 138412546;
          v59 = v34;
          v60 = 2080;
          v61 = v35;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "error loading BKDM plugin from %@: %s\n", buf, 0x16u);
        }
      }
      ++v27;
      v28 += 24;
    }
    while ((unint64_t)[v20 count] > v27);
  }
  if ([v20 count])
  {
    v38 = 0;
    v39 = (uint64_t (**)(void))(v52 + 8);
    do
    {
      if (*v39)
      {
        v40 = (*v39)();
        if (v40)
        {
          v41 = v40;
          if (v40 == 19)
          {
            dlclose(*(v39 - 1));
          }
          else
          {
            if (qword_100008090) {
              v42 = qword_100008090;
            }
            else {
              v42 = &_os_log_default;
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v59 = "!err || (err == 19)";
              v60 = 2048;
              v61 = 0;
              v62 = 2080;
              v63 = &unk_100003766;
              v64 = 2080;
              v65 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/biometrickitd/biometrickitd.m";
              v66 = 1024;
              v67 = 108;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            if (v41 != 19)
            {
              goto LABEL_90;
            }
          }
        }
      }
      ++v38;
      v39 += 3;
    }
    while ((unint64_t)[v20 count] > v38);
  }
  notify_post("com.apple.BiometricKit.serverStarted");
  if (qword_100008090) {
    v43 = qword_100008090;
  }
  else {
    v43 = &_os_log_default;
  }
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "currentRunLoop run\n", buf, 2u);
  }
  v44 = +[NSRunLoop currentRunLoop];
  [v44 run];

LABEL_90:
  if ([v20 count])
  {
    v45 = 0;
    v46 = (void (**)(void))(v52 + 16);
    do
    {
      if (*v46) {
        (*v46)();
      }
      v47 = *(v46 - 2);
      if (v47) {
        dlclose(v47);
      }
      ++v45;
      v46 += 3;
    }
    while ((unint64_t)[v20 count] > v45);
  }
  free(v52);
  if (qword_100008098) {
    v48 = qword_100008098;
  }
  else {
    v48 = &_os_log_default;
  }
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "EXIT\n", buf, 2u);
  }

  return 0;
}

void sub_100003258()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Daemon'!\n", v0, 2u);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_retainAutorelease(id a1)
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

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}