int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;

  unsetenv("TMPDIR");
  _set_user_dir_suffix();
  v4 = _MXMGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 infoDictionary];
    v7 = [v6 objectForKeyedSubscript:@"CFBundleName"];
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting %@.", (uint8_t *)&v11, 0xCu);
  }
  v8 = objc_opt_new();
  v9 = +[NSXPCListener serviceListener];
  [v9 setDelegate:v8];
  [v9 resume];

  return 0;
}

uint64_t uncache_regular_file(int a1, size_t a2)
{
  if (!a2) {
    return 0;
  }
  v3 = mmap(0, a2, 1, 1, a1, 0);
  if (v3 == (void *)-1)
  {
    sub_1000087DC();
  }
  else
  {
    v4 = v3;
    if (msync(v3, a2, 18) != -1)
    {
      munmap(v4, a2);
      return 0;
    }
    v6 = _MXMGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error while trying to uncache: msync", v7, 2u);
    }

    munmap(v4, a2);
  }
  return 1;
}

uint64_t uncache_dir2(DIR *a1)
{
  v16 = 0;
  int v2 = open(".", 0);
  if (v2 == -1)
  {
    v12 = _MXMGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__str = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error while trying to uncache: open(\".\", ...)", __str, 2u);
    }

    return 1;
  }
  int v3 = v2;
  int v4 = dirfd(a1);
  if (fchdir(v4) == -1)
  {
    v13 = _MXMGetLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      goto LABEL_28;
    }
    *(_WORD *)__str = 0;
    v14 = "Error while trying to uncache: fchdir(dirfd(dirp))";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, __str, 2u);
    goto LABEL_27;
  }
  v5 = (dirent *)malloc_type_malloc(0x418uLL, 0x1000040D92F83E5uLL);
  int v6 = readdir_r(a1, v5, &v16);
  BOOL v7 = v6 == 0;
  if (!v6 && v16 == v5)
  {
    do
    {
      if (strcmp(".", v5->d_name))
      {
        if (strcmp("..", v5->d_name))
        {
          if (uncache_filename(v5->d_name, 0)) {
            goto LABEL_23;
          }
          ssize_t v8 = getxattr(v5->d_name, "com.apple.ResourceFork", 0, 0, 0, 32);
          if (v8 != -1)
          {
            ssize_t v9 = v8;
            snprintf((char *)__str, 0x400uLL, "%s/..namedfork/rsrc", v5->d_name);
            if (uncache_filename(__str, v9)) {
              goto LABEL_23;
            }
          }
        }
      }
      int v10 = readdir_r(a1, v5, &v16);
      BOOL v7 = v10 == 0;
    }
    while (!v10 && v16 == v5);
  }
  if (v7)
  {
    free(v5);
    if (fchdir(v3) != -1)
    {
      close(v3);
      return 0;
    }
    v13 = _MXMGetLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)__str = 0;
    v14 = "Error while trying to uncache: fchdir(oldcwdfd)";
    goto LABEL_26;
  }
  v15 = _MXMGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__str = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error while trying to uncache: readdir_r", __str, 2u);
  }

LABEL_23:
  free(v5);
  fchdir(v3);
LABEL_28:
  close(v3);
  return 1;
}

uint64_t uncache_filename(const char *a1, size_t a2)
{
  memset(&v21.st_size, 0, 48);
  int v4 = open(a1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4 == -1)
  {
    int v10 = _MXMGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Error while trying to uncache: open";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    }
LABEL_13:

    return 1;
  }
  int v5 = v4;
  if (fstat(v4, &v21) == -1)
  {
    int v10 = _MXMGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Error while trying to uncache: fstat";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  int v6 = v21.st_mode & 0xF000;
  if (v6 == 0x8000)
  {
    if (a2) {
      size_t st_size = a2;
    }
    else {
      size_t st_size = v21.st_size;
    }
    if (!uncache_regular_file(v5, st_size)) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
  if (v6 != 0x4000)
  {
    v15 = _MXMGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v21.st_mode;
      v16 = "Cannot uncache file of mode 0%o";
      v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      uint32_t v19 = 8;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
    }
LABEL_26:

    goto LABEL_27;
  }
  BOOL v7 = opendir(a1);
  if (!v7)
  {
    v15 = _MXMGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Error while trying to uncache: opendir";
      v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 2;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  ssize_t v8 = v7;
  int v9 = uncache_dir2(v7);
  closedir(v8);
  if (v9)
  {
LABEL_27:
    v20 = _MXMGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = a1;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Uncache failed with filepath: %s", buf, 0xCu);
    }

    close(v5);
    return 1;
  }
LABEL_18:
  close(v5);
  v13 = _MXMGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = a1;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Uncached filename: %s", buf, 0xCu);
  }

  return 0;
}

uint64_t _uncacheFilepath(void *a1)
{
  id v1 = a1;
  uncache_filename((const char *)[v1 UTF8String], 0);

  return 0;
}

void sub_100004EC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    int v10 = _MXMGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Exception caught while trying to uncache: %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100004E8CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _MXMGetLog()
{
  if (qword_100011C18 != -1) {
    dispatch_once(&qword_100011C18, &stru_10000C478);
  }
  return qword_100011C10;
}

void sub_100004FA0(id a1)
{
  qword_100011C10 = (uint64_t)os_log_create("com.apple.metricmeasurement", "Default");
  _objc_release_x1();
}

uint64_t _MXMGetInstrumentsLog()
{
  if (qword_100011C28 != -1) {
    dispatch_once(&qword_100011C28, &stru_10000C498);
  }
  return qword_100011C20;
}

void sub_100005028(id a1)
{
  qword_100011C20 = (uint64_t)os_log_create("com.apple.metricmeasurement", "PointsOfInterest");
  _objc_release_x1();
}

void sub_100005C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005C8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005C9C(uint64_t a1)
{
}

void sub_100005CA4(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  v13.tv_sec = 0;
  v13.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &v13);
  double v9 = (double)(v13.tv_sec - *(void *)(a1 + 56));
  [*(id *)(a1 + 32) add:a4];
  unsigned int v10 = [*(id *)(a1 + 32) checkQuiesced:v9];
  char v11 = 0;
  if (v8) {
    goto LABEL_10;
  }
  if (v10)
  {
    v12 = _MXMGetLog();
    char v11 = 1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Successfully quiesced within: %f", buf, 0xCu);
    }
LABEL_9:

LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
    [v7 cancel];
    goto LABEL_11;
  }
  if (*(double *)(a1 + 72) <= v9)
  {
    v12 = _MXMGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Timed out: %f", buf, 0xCu);
    }
    char v11 = 0;
    goto LABEL_9;
  }
LABEL_11:
}

void sub_100006F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006F3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[NSMutableDictionary dictionary];
  uint64_t v10 = 0;
  char v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = *(id *)(a1 + 32);
  sysmon_table_apply();
  objc_msgSend(*(id *)(a1 + 32), "logTopUsageProcesses:", v8, _NSConcreteStackBlock, 3221225472, sub_1000070BC, &unk_10000C510);
  [*(id *)(a1 + 32) convertToPercent:*(unsigned int *)(a1 + 64) ncpus:v11[3]];
  double v5 = 100.0 - v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id, void, double))(v6 + 16))(v6, WeakRetained, *(void *)(a1 + 40), v5);

  _Block_object_dispose(&v10, 8);
}

void sub_1000070A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000070BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_10000722C;
  v14 = sub_10000723C;
  id v15 = 0;
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  sysmon_row_apply();
  double v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) convertToPercent:*(unsigned int *)(a1 + 56) ncpus:v7[3]];
  double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setValue:v5 forKey:v11[5]];

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

void sub_100007208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000722C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000723C(uint64_t a1)
{
}

void sub_100007244(void *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 51)
  {
    xpc_object_t xdouble = v5;
    BOOL v9 = xpc_get_type(v5) == (xpc_type_t)&_xpc_type_double;
    id v5 = xdouble;
    if (v9)
    {
      double value = xpc_double_get_value(xdouble);
      id v5 = xdouble;
      *(double *)(*(void *)(a1[5] + 8) + 24) = value;
      *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24)
                                                   + *(double *)(*(void *)(a1[6] + 8) + 24);
    }
  }
  else if (a2 == 13)
  {
    xpc_object_t xdoublea = v5;
    uint64_t v6 = xpc_to_foundation(v5);
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v5 = xdoublea;
  }
}

id xpc_to_foundation(void *a1)
{
  id v1 = a1;
  xpc_type_t type = xpc_get_type(v1);
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    +[NSMutableArray arrayWithCapacity:xpc_array_get_count(v1)];
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100007B3C;
    applier[3] = &unk_10000C5A0;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v4;
    xpc_array_apply(v1, applier);
    id v5 = v13;
    goto LABEL_12;
  }
  if (type != (xpc_type_t)&_xpc_type_BOOL)
  {
    if (type == (xpc_type_t)&_xpc_type_date)
    {
      int64_t value = xpc_date_get_value(v1);
      unsigned int v7 = dword_100011C34;
      if (!dword_100011C34)
      {
        mach_timebase_info((mach_timebase_info_t)&dword_100011C30);
        unsigned int v7 = dword_100011C34;
      }
      double v8 = (double)(value * (unint64_t)dword_100011C30 / v7) / 1000000000.0;
LABEL_19:
      uint64_t v3 = +[NSNumber numberWithDouble:v8];
      goto LABEL_20;
    }
    if (type != (xpc_type_t)&_xpc_type_dictionary)
    {
      if (type != (xpc_type_t)&_xpc_type_double)
      {
        if (type == (xpc_type_t)&_xpc_type_int64)
        {
          uint64_t v3 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v1)];
        }
        else if (type == (xpc_type_t)&_xpc_type_string)
        {
          uint64_t v3 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v1)];
        }
        else
        {
          if (type == (xpc_type_t)&_xpc_type_uint64) {
            +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v1)];
          }
          else {
          uint64_t v3 = +[NSNull null];
          }
        }
        goto LABEL_20;
      }
      double v8 = xpc_double_get_value(v1);
      goto LABEL_19;
    }
    +[NSMutableDictionary dictionaryWithCapacity:xpc_dictionary_get_count(v1)];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007B90;
    v10[3] = &unk_10000C5C8;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v4;
    xpc_dictionary_apply(v1, v10);
    id v5 = v11;
LABEL_12:

    goto LABEL_21;
  }
  uint64_t v3 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v1)];
LABEL_20:
  id v4 = (id)v3;
LABEL_21:

  return v4;
}

int64_t sub_100007808(id a1, id a2, id a3)
{
  id v4 = a3;
  [a2 doubleValue];
  double v6 = v5;
  [v4 doubleValue];
  double v8 = v7;

  return v6 < v8;
}

double MachAbsoluteTimeToTimeInterval(uint64_t a1)
{
  unsigned int v2 = dword_100011C34;
  if (!dword_100011C34)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_100011C30);
    unsigned int v2 = dword_100011C34;
  }
  return (double)((unint64_t)dword_100011C30 * a1 / v2) / 1000000000.0;
}

uint64_t sub_100007B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = xpc_to_foundation(a3);
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a2];

  return 1;
}

uint64_t sub_100007B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = xpc_to_foundation(a3);
  double v6 = *(void **)(a1 + 32);
  double v7 = +[NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

id _fullProcessNameForPid()
{
  int v0 = __chkstk_darwin();
  if (v0 < 1 || (int v1 = v0, bzero(buffer, 0x1000uLL), proc_pidpath(v1, buffer, 0x1000u) < 1))
  {
    unsigned int v2 = 0;
  }
  else
  {
    buffer[4095] = 0;
    unsigned int v2 = +[NSString stringWithUTF8String:basename(buffer)];
  }
  return v2;
}

uint64_t _processIdentifierWithProcessName(void *a1)
{
  id v1 = a1;
  *__error() = 0;
  unsigned int v2 = proc_listpids(1u, 0, 0, 0);
  if ((v2 & 0x80000000) != 0)
  {
    v16 = _MXMGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v23 = v17;
      os_log_type_t v18 = "Failed to read pids: %d";
      uint32_t v19 = v16;
      uint32_t v20 = 8;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v18, buf, v20);
    }
LABEL_23:
    uint64_t v11 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }
  int v3 = v2;
  size_t v4 = v2;
  double v5 = malloc_type_malloc(v2, 0x80D4F8AuLL);
  if (!v5)
  {
    v16 = _MXMGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v18 = "Failed to allocate buffer";
      uint32_t v19 = v16;
      uint32_t v20 = 2;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  double v6 = v5;
  memset(v5, 255, v4);
  int v7 = proc_listpids(1u, 0, v6, v3);
  double v8 = _MXMGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v23 = v1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Searching for procName: %@", buf, 0xCu);
  }

  if (v7 < 4)
  {
LABEL_15:
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  else
  {
    if ((unint64_t)v7 >> 2 <= 1) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = (unint64_t)v7 >> 2;
    }
    uint64_t v10 = (int *)v6;
    while (1)
    {
      int v12 = *v10++;
      uint64_t v11 = v12;
      if (v12 >= 1)
      {
        id v13 = _fullProcessNameForPid();
        v14 = _MXMGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v23 = v13;
          *(_WORD *)&v23[8] = 1024;
          *(_DWORD *)&v23[10] = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Checking %@ (%d)", buf, 0x12u);
        }

        unsigned __int8 v15 = [v13 isEqualToString:v1];
        if (v15) {
          break;
        }
      }
      if (!--v9) {
        goto LABEL_15;
      }
    }
  }
  free(v6);
  v16 = _MXMGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v23 = v11;
    *(_WORD *)&v23[4] = 2112;
    *(void *)&v23[6] = v1;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Found pid (%d) for process name: %@", buf, 0x12u);
  }
LABEL_24:

  return v11;
}

uint64_t _terminateProcess(void *a1)
{
  id v1 = a1;
  if (os_variant_allows_internal_security_policies())
  {
    unsigned int v2 = _MXMGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AppleInternal policies must be enabled for successful process termination.", buf, 2u);
    }
    uint64_t v3 = 0;
    goto LABEL_20;
  }
  uint64_t v4 = _processIdentifierWithProcessName(v1);
  if ((int)v4 >= 1)
  {
    int v5 = v4;
    double v6 = +[RBSProcessIdentifier identifierWithPid:v4];
    unsigned int v2 = +[RBSProcessPredicate predicateMatchingIdentifier:v6];

    id v7 = [objc_alloc_init((Class)RBSTerminateContext) initWithExplanation:@"Terminating process between performance test iterations via MetricMeasurement"];
    [v7 setReportType:0];
    id v8 = [objc_alloc((Class)RBSTerminateRequest) initWithPredicate:v2 context:v7];
    unint64_t v9 = v8;
    if (v8)
    {
      id v15 = 0;
      unsigned __int8 v10 = [v8 execute:&v15];
      uint64_t v11 = v15;
      int v12 = _MXMGetLog();
      id v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v17 = v1;
          __int16 v18 = 1024;
          int v19 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Successfully terminated process with name: %@ (%d)", buf, 0x12u);
        }

        uint64_t v3 = 1;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v17 = v1;
        __int16 v18 = 1024;
        int v19 = v5;
        __int16 v20 = 2112;
        stat v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error occurred when trying to terminate process with name: %@ (%d). Error: %@", buf, 0x1Cu);
      }
    }
    else
    {
      uint64_t v11 = _MXMGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v1;
        __int16 v18 = 1024;
        int v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create RBSTerminateRequest for process name: %@ (%d)", buf, 0x12u);
      }
    }
    uint64_t v3 = 0;
LABEL_19:

    goto LABEL_20;
  }
  unsigned int v2 = _MXMGetLog();
  uint64_t v3 = 1;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Unable to find process ID for process name: %@. Skipping termination.", buf, 0xCu);
  }
LABEL_20:

  return v3;
}

void sub_1000087DC()
{
  perror("mmap");
  int v0 = _MXMGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error while trying to uncache: mmap", v1, 2u);
  }
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

int dirfd(DIR *dirp)
{
  return _dirfd(dirp);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fchdir(int a1)
{
  return _fchdir(a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return _msync(a1, a2, a3);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

void perror(const char *a1)
{
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return _proc_listpids(type, typeinfo, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t sysmon_request_add_attribute()
{
  return _sysmon_request_add_attribute();
}

uint64_t sysmon_request_cancel()
{
  return _sysmon_request_cancel();
}

uint64_t sysmon_request_create()
{
  return _sysmon_request_create();
}

uint64_t sysmon_request_execute()
{
  return _sysmon_request_execute();
}

uint64_t sysmon_request_set_interval()
{
  return _sysmon_request_set_interval();
}

uint64_t sysmon_row_apply()
{
  return _sysmon_row_apply();
}

uint64_t sysmon_table_apply()
{
  return _sysmon_table_apply();
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return _xpc_date_get_value(xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return _xpc_dictionary_get_count(xdict);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__remoteProbe(void *a1, const char *a2, ...)
{
  return [a1 _remoteProbe];
}

id objc_msgSend_average(void *a1, const char *a2, ...)
{
  return [a1 average];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return [a1 execute];
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return [a1 filepath];
}

id objc_msgSend_full(void *a1, const char *a2, ...)
{
  return [a1 full];
}

id objc_msgSend_halfTargetHits(void *a1, const char *a2, ...)
{
  return [a1 halfTargetHits];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_majorityHalfTargetsHit(void *a1, const char *a2, ...)
{
  return [a1 majorityHalfTargetsHit];
}

id objc_msgSend_majorityTargetsHit(void *a1, const char *a2, ...)
{
  return [a1 majorityTargetsHit];
}

id objc_msgSend_metric(void *a1, const char *a2, ...)
{
  return [a1 metric];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_samples(void *a1, const char *a2, ...)
{
  return [a1 samples];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_startPerformanceTrace(void *a1, const char *a2, ...)
{
  return [a1 startPerformanceTrace];
}

id objc_msgSend_stopPerformanceTrace(void *a1, const char *a2, ...)
{
  return [a1 stopPerformanceTrace];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_targetHits(void *a1, const char *a2, ...)
{
  return [a1 targetHits];
}

id objc_msgSend_total(void *a1, const char *a2, ...)
{
  return [a1 total];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_wait_sema(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wait_sema");
}