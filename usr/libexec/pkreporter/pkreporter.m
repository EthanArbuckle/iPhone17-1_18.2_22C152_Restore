uint64_t start(int a1, char **a2)
{
  int v4;
  int *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;

  v10 = 0;
  while (1)
  {
    v4 = getopt_long(a1, a2, "dv", (const option *)&off_100004138, &v10);
    v5 = &dword_100008088;
    if (v4 == 100) {
      goto LABEL_2;
    }
    if (v4 != 118) {
      break;
    }
    v5 = &dword_10000808C;
LABEL_2:
    ++*v5;
  }
  if (v4 != -1)
  {
    fwrite("Usage: \tpkreporter [-d|--debug] [-v|--verbose]\n", 0x2FuLL, 1uLL, __stderrp);
    exit(2);
  }
  v7 = +[PKHost defaultHost];
  [v7 discoverPlugInsForAttributes:&__NSDictionary0__struct flags:512 found:&stru_100004198];

  v8 = +[NSRunLoop currentRunLoop];
  [v8 run];

  return 0;
}

void sub_100002F10(id a1, NSSet *a2, NSError *a3)
{
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    v13 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = [(NSError *)v13 localizedDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)v77 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Discovery of plugins fails: %{public}@", buf, 0xCu);
    }
    exit(1);
  }
  v6 = +[NSMutableDictionary dictionary];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v7 = v4;
  id v8 = [(NSSet *)v7 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v8)
  {
    uint64_t v15 = *(void *)v70;
    uint64_t v16 = PKProtocolAttribute;
    do
    {
      uint64_t v17 = 0;
      if ((unint64_t)v8 <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = (uint64_t)v8;
      }
      do
      {
        if (*(void *)v70 != v15) {
          objc_enumerationMutation(v7);
        }
        v19 = *(void **)(*((void *)&v69 + 1) + 8 * v17);
        v20 = [v19 attributes];
        uint64_t v21 = [v20 objectForKeyedSubscript:v16];

        if (v21) {
          v22 = (__CFString *)v21;
        }
        else {
          v22 = @"*Unknown*";
        }
        v23 = [v6 objectForKeyedSubscript:v22];
        if (!v23)
        {
          v23 = +[NSMutableSet set];
          [v6 setObject:v23 forKeyedSubscript:v22];
        }
        [v23 addObject:v19];

        ++v17;
      }
      while (v18 != v17);
      id v8 = [(NSSet *)v7 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v8);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  v10 = 0;
  if (!v9)
  {
LABEL_4:

    id v11 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      if (v10) {
        uint64_t v12 = 1 << (flsl((uint64_t)v10) - 1);
      }
      else {
        uint64_t v12 = 0;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v77 = v10;
      *(_WORD *)&v77[8] = 2048;
      *(void *)&v77[10] = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Total number of plugins: %ld (%ld)", buf, 0x16u);
    }

    if (v10) {
      flsl((uint64_t)v10);
    }
    ADClientSetValueForScalarKey();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uid_t v53 = geteuid();
      id v54 = [obj count];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v77 = v53;
      *(_WORD *)&v77[4] = 2048;
      *(void *)&v77[6] = v54;
      *(_WORD *)&v77[14] = 2048;
      *(void *)&v77[16] = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "(UID %d) Found %lu plugin types, %ld plugins", buf, 0x1Cu);
    }
    exit(0);
  }
  uint64_t v55 = *(void *)v66;
LABEL_25:
  uint64_t v24 = 0;
  if ((unint64_t)v9 <= 1) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = (uint64_t)v9;
  }
  uint64_t v56 = v25;
  while (1)
  {
    if (*(void *)v66 != v55) {
      objc_enumerationMutation(obj);
    }
    uint64_t v59 = v24;
    v26 = *(void **)(*((void *)&v65 + 1) + 8 * v24);
    v27 = [obj objectForKeyedSubscript:v26, v55];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v77 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v60 = v10;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v28 = v27;
    id v29 = [v28 countByEnumeratingWithState:&v61 objects:v73 count:16];
    v58 = v26;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    if (v29)
    {
      uint64_t v32 = *(void *)v62;
      do
      {
        uint64_t v33 = 0;
        if ((unint64_t)v29 <= 1) {
          uint64_t v34 = 1;
        }
        else {
          uint64_t v34 = (uint64_t)v29;
        }
        do
        {
          if (*(void *)v62 != v32) {
            objc_enumerationMutation(v28);
          }
          v35 = *(void **)(*((void *)&v61 + 1) + 8 * v33);
          if ([v35 userElection] == (id)1)
          {
            ++v30;
            v36 = [v35 identifier];
            unsigned int v37 = [v36 hasPrefix:@"com.apple."];

            v31 += v37 ^ 1;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v38 = [v35 identifier];
            id v39 = [v35 userElection];
            *(_DWORD *)buf = 138412546;
            *(void *)v77 = v38;
            *(_WORD *)&v77[8] = 2048;
            *(void *)&v77[10] = v39;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\t%@ - election: %ld", buf, 0x16u);
          }
          ++v33;
        }
        while (v34 != v33);
        id v29 = [v28 countByEnumeratingWithState:&v61 objects:v73 count:16];
      }
      while (v29);
    }

    id v40 = [v28 count];
    id v41 = [v28 count];
    id v42 = v58;
    id v43 = &_os_log_default;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    if (v40)
    {
      uint64_t v47 = 1 << (flsl((uint64_t)v40) - 1);
      if (v30)
      {
LABEL_58:
        uint64_t v48 = 1 << (flsl(v30) - 1);
        if (!v31) {
          goto LABEL_62;
        }
        goto LABEL_59;
      }
    }
    else
    {
      uint64_t v47 = 0;
      if (v30) {
        goto LABEL_58;
      }
    }
    uint64_t v48 = 0;
    if (!v31)
    {
LABEL_62:
      uint64_t v49 = 0;
      goto LABEL_63;
    }
LABEL_59:
    uint64_t v49 = 1 << (flsl(v31) - 1);
LABEL_63:
    uint64_t v50 = (uint64_t)v41 - v30;
    if (v41 == (id)v30)
    {
      uint64_t v51 = 0;
    }
    else
    {
      char v52 = flsl(v50);
      uint64_t v50 = (uint64_t)v41 - v30;
      uint64_t v51 = 1 << (v52 - 1);
    }
    *(_DWORD *)buf = 138414338;
    *(void *)v77 = v42;
    *(_WORD *)&v77[8] = 2048;
    *(void *)&v77[10] = v40;
    *(_WORD *)&v77[18] = 2048;
    *(void *)&v77[20] = v47;
    __int16 v78 = 2048;
    uint64_t v79 = v30;
    __int16 v80 = 2048;
    uint64_t v81 = v48;
    __int16 v82 = 2048;
    uint64_t v83 = v31;
    __int16 v84 = 2048;
    uint64_t v85 = v49;
    __int16 v86 = 2048;
    uint64_t v87 = v50;
    __int16 v88 = 2048;
    uint64_t v89 = v51;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "plugin type: %@: %ld (%ld) plugins; %ld (%ld) enabled; %ld (%ld) enabled 3rd party; %ld (%ld) disabled",
      buf,
      0x5Cu);
LABEL_48:

    if (v40) {
      flsl((uint64_t)v40);
    }
    if (v30) {
      flsl(v30);
    }
    id v44 = v42;
    if (qword_100008090 != -1) {
      dispatch_once(&qword_100008090, &stru_1000041D8);
    }
    v45 = [(id)qword_100008098 objectForKeyedSubscript:v44];
    v46 = v45;
    if (v45)
    {
      [v45 stringByAppendingString:@".extensionsinstalled"];
      ADClientSetValueForScalarKey();
      [v46 stringByAppendingString:@".enabled"];
      ADClientSetValueForScalarKey();
    }

    v10 = &v60[(void)[v28 count]];
    uint64_t v24 = v59 + 1;
    if (v59 + 1 == v56)
    {
      id v9 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (!v9) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
}

void sub_1000036D8(id a1)
{
  v1 = (void *)qword_100008098;
  qword_100008098 = (uint64_t)&off_100004520;
}

uint64_t ADClientSetValueForScalarKey()
{
  return _ADClientSetValueForScalarKey();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int flsl(uint64_t a1)
{
  return _flsl(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
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

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultHost(void *a1, const char *a2, ...)
{
  return [a1 defaultHost];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_userElection(void *a1, const char *a2, ...)
{
  return [a1 userElection];
}