id sub_100004904(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = [a2 name];
  v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

id sub_100004A68(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 creationDate];
  v5 = v4;
  if (v4 && [v4 compare:*(void *)(a1 + 32)] == (id)-1)
  {
    v7 = [v3 name];
    id v6 = [v7 hasPrefix:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL sub_100005024(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

uint64_t MBMobileUID()
{
  uint64_t result = qword_100025FF8;
  if (qword_100025FF8 < 0)
  {
    v1 = getpwnam((const char *)[@"mobile" UTF8String]);
    if (!v1)
    {
      v2 = [MBException alloc];
      id v3 = __error();
      v4 = strerror(*v3);
      v5 = [(MBException *)v2 initWithCode:1, @"getpwnam(\"%@\") failed: %s (%d)", @"mobile", v4, *__error() format];
      objc_exception_throw(v5);
    }
    uint64_t result = v1->pw_uid;
    qword_100025FF8 = result;
  }
  return result;
}

uint64_t sub_1000063D0(uint64_t a1)
{
  qword_100026228 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

id sub_100006598(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  id result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  if (result == (id)1)
  {
    id v3 = (objc_class *)objc_opt_class();
    class_getName(v3);
    *(void *)(*(void *)(a1 + 32) + 32) = os_transaction_create();
    return (id)_objc_release_x1();
  }
  return result;
}

void sub_1000066A8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;

    v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void sub_10000690C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000694C(id a1)
{
  v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MBHelperServiceProtocol];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, objc_opt_class(), 0);
  [v1 setClasses:v4 forSelector:"runEncodingTask:reply:" argumentIndex:0 ofReply:0];

  v5 = (void *)qword_100026238;
  qword_100026238 = (uint64_t)v1;
}

uint64_t sub_100006A20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) _removeConnection:WeakRetained];
  }
  return _objc_release_x1();
}

void sub_100006B00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = v2 + 1;
  if (!v2) {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_100006BA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24) - 1;
  *(void *)(v1 + 24) = v2;
  if (!v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 32))
    {
      v5 = *(NSObject **)(v4 + 16);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100006C84;
      handler[3] = &unk_100020818;
      handler[4] = v4;
      dispatch_source_set_event_handler(v5, handler);
      dispatch_time_t v6 = dispatch_time(0, 300000000000);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      dispatch_time_t v6 = -1;
    }
    dispatch_source_set_timer(*(dispatch_source_t *)(v4 + 16), v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_100006C84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

id MBTemporaryPath()
{
  if (qword_100026248 != -1) {
    dispatch_once(&qword_100026248, &stru_100020838);
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000070DC;
  v8 = sub_1000070EC;
  id v9 = 0;
  v0 = sub_1000070F4();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007148;
  block[3] = &unk_100020860;
  block[4] = &v4;
  dispatch_sync(v0, block);

  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000701C(id a1)
{
  strcpy(v4, "/var/tmp/backupd-XXXXXXXXXXXXXXX");
  id v1 = mkdtemp(v4);
  qword_100026250 = (uint64_t)v1;
  if (!v1)
  {
    uint64_t v2 = [MBException alloc];
    CFStringRef v3 = @"Unable to create /var/tmp/backupd-XXXXXXXXXX directory (mkdtemp)";
    goto LABEL_6;
  }
  qword_100026250 = (uint64_t)strdup(v1);
  if (!qword_100026250)
  {
    uint64_t v2 = [MBException alloc];
    CFStringRef v3 = @"Unable to create /var/tmp/backupd-XXXXXXXXXX directory (strdup)";
LABEL_6:
    objc_exception_throw([(MBException *)v2 initWithCode:1 format:v3]);
  }
}

uint64_t sub_1000070DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000070EC(uint64_t a1)
{
}

id sub_1000070F4()
{
  if (qword_100026260 != -1) {
    dispatch_once(&qword_100026260, &stru_100020880);
  }
  v0 = (void *)qword_100026258;
  return v0;
}

void sub_100007148(uint64_t a1)
{
  if (!qword_100026250) {
    objc_exception_throw([[MBException alloc] initWithCode:1 format:@"Unable to create /var/tmp/backupd-XXXXXXXXXX directory"]);
  }
  snprintf(__str, 0x401uLL, "%s/XXXXXXXXXXXXXXX", (const char *)qword_100026250);
  if (mktemp(__str))
  {
    id v2 = [objc_alloc((Class)NSString) initWithUTF8String:__str];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = *(NSObject **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  else
  {
    uint64_t v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 67109120;
      int v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "mktemp failed: %{errno}d", buf, 8u);
      uint64_t v6 = __error();
      _MBLog(@"ERROR", (uint64_t)"mktemp failed: %{errno}d", v7, v8, v9, v10, v11, v12, *v6);
    }
  }
}

void sub_100007290(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("MBTemporaryPath", v3);
  id v2 = (void *)qword_100026258;
  qword_100026258 = (uint64_t)v1;
}

NSMutableString *MBStringWithArray(void *a1)
{
  id v2 = +[NSMutableString stringWithString:@"["];
  id v3 = [a1 objectEnumerator];
  id v4 = [v3 nextObject];
  if (v4)
  {
    id v5 = v4;
    do
    {
      if ([(NSMutableString *)v2 length] != (id)1) {
        [(NSMutableString *)v2 appendString:@", "];
      }
      [(NSMutableString *)v2 appendString:MBStringWithObject(v5)];
      id v5 = [v3 nextObject];
    }
    while (v5);
  }
  [(NSMutableString *)v2 appendString:@"]"];
  return v2;
}

NSMutableString *MBStringWithObject(void *a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (NSMutableString *)MBStringWithArray(a1);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = (unsigned __int8 *)[a1 bytes];
      unint64_t v4 = 2 * (void)[a1 length];
      return (NSMutableString *)MBStringWithNibbles(v3, v4);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return MBStringWithDictionary(a1);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          return MBStringWithSet(a1);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            return (NSMutableString *)+[NSString stringWithFormat:@"\"%@\"", a1];
          }
          else
          {
            return (NSMutableString *)[a1 description];
          }
        }
      }
    }
  }
}

id MBStringWithNibbles(unsigned __int8 *a1, unint64_t a2)
{
  unint64_t v4 = malloc_type_malloc(2 * a2, 0x1000040BDFB0063uLL);
  if (a2)
  {
    unint64_t v5 = 0;
    do
    {
      unsigned int v7 = *a1++;
      char v6 = v7;
      v4[v5] = a0123456789abcd[(unint64_t)v7 >> 4];
      if (v5 + 1 < a2) {
        v4[v5 + 1] = a0123456789abcd[v6 & 0xF];
      }
      v5 += 2;
    }
    while (v5 < a2);
  }
  id v8 = [objc_alloc((Class)NSString) initWithCharactersNoCopy:v4 length:a2 freeWhenDone:1];
  return v8;
}

id MBStringWithDate(id result)
{
  if (result) {
    return +[NSDateFormatter localizedStringFromDate:result dateStyle:1 timeStyle:2];
  }
  return result;
}

NSMutableString *MBStringWithDictionary(void *a1)
{
  id v2 = +[NSMutableString stringWithString:@"{"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      char v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v6);
        if ([(NSMutableString *)v2 length] != (id)1) {
          [(NSMutableString *)v2 appendString:@", "];
        }
        -[NSMutableString appendFormat:](v2, "appendFormat:", @"%@: %@", v7, MBStringWithObject([a1 objectForKeyedSubscript:v7]));
        char v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  [(NSMutableString *)v2 appendString:@"}"];
  return v2;
}

NSMutableString *MBStringWithSet(void *a1)
{
  id v2 = +[NSMutableString stringWithString:@"{"];
  id v3 = [a1 objectEnumerator];
  id v4 = [v3 nextObject];
  if (v4)
  {
    id v5 = v4;
    do
    {
      if ([(NSMutableString *)v2 length] != (id)1) {
        [(NSMutableString *)v2 appendString:@", "];
      }
      [(NSMutableString *)v2 appendString:MBStringWithObject(v5)];
      id v5 = [v3 nextObject];
    }
    while (v5);
  }
  [(NSMutableString *)v2 appendString:@"}"];
  return v2;
}

uint64_t MBHTTPDateFormatter()
{
  if (qword_100026268 != -1) {
    dispatch_once(&qword_100026268, &stru_1000208A0);
  }
  return qword_100026270;
}

void sub_100007878(id a1)
{
  qword_100026270 = (uint64_t)objc_alloc_init((Class)NSDateFormatter);
  id v1 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [(id)qword_100026270 setLocale:v1];
  id v2 = (void *)qword_100026270;
  [v2 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss z"];
}

char *sub_100007990(const char *a1, void *a2, char *a3)
{
  id v5 = a2;
  if (!a1) {
    sub_100013C74();
  }
  if (!v5) {
    sub_100013CA0();
  }
  id v6 = v5;
  snprintf(__str, 0x401uLL, "%s/%s_XXXXXXXXXXXXXXX", a1, (const char *)[v6 fileSystemRepresentation]);
  uint64_t v7 = mkdtemp(__str);
  if (v7)
  {
    a3 = strdup(v7);
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      *(_DWORD *)buf = 136315394;
      v19 = __str;
      __int16 v20 = 1024;
      int v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=tmpdir= Failed to create %s directory (mkdtemp error: %d)", buf, 0x12u);
      __error();
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= Failed to create %s directory (mkdtemp error: %d)", v10, v11, v12, v13, v14, v15, (uint64_t)__str);
    }

    if (a3)
    {
      v16 = +[NSString stringWithUTF8String:__str];
      *(void *)a3 = +[MBError posixErrorWithPath:v16, @"TempDir: Failed to create directory (mkdtemp error: %d)", *__error() format];

      a3 = 0;
    }
  }

  return a3;
}

uint64_t sub_100007D70(const char *a1)
{
  if (!a1) {
    sub_100013D7C();
  }
  uint64_t result = mkpath_np(a1, 0x1FFu);
  if (result != 17)
  {
    return MBMobileUID();
  }
  return result;
}

id sub_10000804C(const char *a1)
{
  if (!a1) {
    sub_100013E84();
  }
  snprintf(__str, 0x401uLL, "%s/XXXXXXXXXXXXXXX", a1);
  mktemp(__str);
  id v1 = +[NSString mb_stringWithFileSystemRepresentation:__str];
  return v1;
}

void sub_100008580(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008724(id a1)
{
  id v1 = strdup("/var/tmp/com.apple.backup.testing");
  qword_100026278 = (uint64_t)v1;
  sub_100007D70(v1);
}

void sub_10000875C(id a1)
{
  id v1 = strdup("/var/mobile/tmp/com.apple.backup.testing");
  qword_100026288 = (uint64_t)v1;
  sub_100007D70(v1);
}

void sub_100008794(id a1)
{
  id v1 = strdup("/var/tmp/com.apple.backup");
  qword_100026298 = (uint64_t)v1;
  sub_100007D70(v1);
}

uint64_t MBIsTransientErrorCode(uint64_t a1)
{
  uint64_t result = 1;
  if (a1 > 299)
  {
    unint64_t v3 = a1 - 300;
    if (v3 > 8 || ((1 << v3) & 0x135) == 0) {
      return 0;
    }
  }
  else if (((unint64_t)(a1 - 202) > 0x12 || ((1 << (a1 + 54)) & 0x78041) == 0) {
         && ((unint64_t)a1 > 0x14 || ((1 << a1) & 0x1A0000) == 0)
  }
         && (unint64_t)(a1 - 105) >= 2)
  {
    return 0;
  }
  return result;
}

void MBDiagnoseGetNumberOfFileExtents(const char *a1)
{
  id v2 = (uint64_t *)malloc_type_malloc(0x10uLL, 0x85514AE9uLL);
  if (!v2) {
    sub_100013EB0();
  }
  unint64_t v3 = v2;
  uint64_t *v2 = 0;
  v2[1] = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v52 = 0;
  long long v51 = xmmword_100017ED0;
  v53 = v2;
  long long v54 = 0x10uLL;
  if (fsctl(a1, 0xC1B04A1EuLL, &v51, 0))
  {
    free(v3);
    id v4 = MBGetDefaultLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return;
    }
    int v5 = *__error();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d", buf, 8u);
    uint64_t v49 = *__error();
    uint64_t v12 = "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d";
LABEL_5:
    _MBLog(@"DEFAULT", (uint64_t)v12, v6, v7, v8, v9, v10, v11, v49);
    goto LABEL_6;
  }
  if (!(void)v55)
  {
    free(v3);
    id v4 = MBGetDefaultLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) returned zero buffer entries", buf, 2u);
    uint64_t v12 = "=diag= fsctl(APFSIOC_DEBUG_STATS) returned zero buffer entries";
    goto LABEL_5;
  }
  uint64_t v13 = (char *)malloc_type_malloc(0x4E200uLL, 0x81E2D296uLL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *v3;
      uint64_t v17 = v3[1];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=diag= Dstream id %llu, dstream size %llu bytes\n", buf, 0x16u);
      _MBLog(@"DEFAULT", (uint64_t)"=diag= Dstream id %llu, dstream size %llu bytes\n", v18, v19, v20, v21, v22, v23, *v3);
    }

    for (uint64_t i = 0; ; uint64_t i = *((void *)v25 - 7) + *((void *)v25 - 8))
    {
      bzero(v14, 0x4E200uLL);
      uint64_t v109 = 0;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v86 = 0u;
      *(_OWORD *)buf = xmmword_100017EE0;
      *(void *)&buf[16] = 10;
      v82 = v14;
      uint64_t v83 = 320000;
      uint64_t v84 = i;
      uint64_t v85 = *v3;
      if (fsctl(a1, 0xC1B04A1EuLL, buf, 0)) {
        break;
      }
      if (!(void)v86)
      {
        v35 = MBGetDefaultLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v79 = 134217984;
          *(void *)v80 = i;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) for FUSION_DEBUG_STATS_PURE_FEXTS_ONLY returned zero buffer entries at offset %lld", v79, 0xCu);
          _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_DEBUG_STATS) for FUSION_DEBUG_STATS_PURE_FEXTS_ONLY returned zero buffer entries at offset %lld", v43, v44, v45, v46, v47, v48, i);
        }
        goto LABEL_23;
      }
      v25 = &v14[64 * (void)v86];
      v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *((void *)v25 - 8);
        uint64_t v28 = *((void *)v25 - 7);
        *(_DWORD *)v79 = 134218240;
        *(void *)v80 = v27;
        *(_WORD *)&v80[8] = 2048;
        *(void *)&v80[10] = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "=diag= Extent offset %lld and length %lld\n", v79, 0x16u);
        _MBLog(@"DEFAULT", (uint64_t)"=diag= Extent offset %lld and length %lld\n", v29, v30, v31, v32, v33, v34, *((void *)v25 - 8));
      }
    }
    v35 = MBGetDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = *__error();
      *(_DWORD *)v79 = 67109376;
      *(_DWORD *)v80 = v36;
      *(_WORD *)&v80[4] = 2048;
      *(void *)&v80[6] = i;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d, cannot get extents at offset %lld", v79, 0x12u);
      uint64_t v50 = *__error();
      _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d, cannot get extents at offset %lld", v37, v38, v39, v40, v41, v42, v50);
    }
LABEL_23:

    free(v14);
  }
  free(v3);
}

void MBDiagnoseFile(void *a1)
{
  id v1 = a1;
  __darwin_ino64_t v2 = geteuid();
  unint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138543618;
      *(void *)&buf.__darwin_ino64_t f_iosize = v1;
      WORD2(buf.f_blocks) = 1024;
      *(_DWORD *)((char *)&buf.f_blocks + 6) = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=diag= Dumping diagnostics for %{public}@ (%d)", (uint8_t *)&buf, 0x12u);
    }

    __darwin_ino64_t f_iosize = v2;
    _MBLog(@"DEFAULT", (uint64_t)"=diag= Dumping diagnostics for %{public}@ (%d)", v5, v6, v7, v8, v9, v10, (uint64_t)v1);
  }

  id v11 = v1;
  uint64_t v12 = (const char *)[v11 fileSystemRepresentation];
  id v13 = [v11 lastPathComponent];
  uint64_t v14 = (const char *)[v13 fileSystemRepresentation];

  id v15 = [v11 stringByDeletingLastPathComponent];
  uint64_t v16 = (const char *)[v15 fileSystemRepresentation];

  if (v11)
  {
    if (!v12)
    {
      uint64_t v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=diag= nil path FSR", (uint8_t *)&buf, 2u);
        uint64_t v41 = "=diag= nil path FSR";
        goto LABEL_214;
      }
      goto LABEL_215;
    }
    if (!v14)
    {
      uint64_t v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=diag= nil name FSR", (uint8_t *)&buf, 2u);
        uint64_t v41 = "=diag= nil name FSR";
        goto LABEL_214;
      }
      goto LABEL_215;
    }
    if (v16)
    {
      if (access(v12, 4))
      {
        uint64_t v17 = *__error();
        uint64_t v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v18;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=diag= access(R_OK) failed: %{errno}d", (uint8_t *)&buf, 8u);
          }

          _MBLog(@"DEFAULT", (uint64_t)"=diag= access(R_OK) failed: %{errno}d", v20, v21, v22, v23, v24, v25, v17);
        }

        if (access(v12, 0))
        {
          uint64_t v26 = *__error();
          uint64_t v27 = MBGetDefaultLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = v27;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              buf.f_bsize = 67109120;
              buf.__darwin_ino64_t f_iosize = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=diag= access(F_OK) failed: %{errno}d", (uint8_t *)&buf, 8u);
            }

            _MBLog(@"DEFAULT", (uint64_t)"=diag= access(F_OK) failed: %{errno}d", v28, v29, v30, v31, v32, v33, v26);
          }
        }
        else
        {
          uint64_t v27 = MBGetDefaultLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = v27;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              buf.f_bsize = 67109120;
              buf.__darwin_ino64_t f_iosize = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=diag= access(F_OK): %d", (uint8_t *)&buf, 8u);
            }

            _MBLog(@"DEFAULT", (uint64_t)"=diag= access(F_OK): %d", v48, v49, v50, v51, v52, v53, 0);
          }
        }
      }
      else
      {
        uint64_t v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = v27;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=diag= access(R_OK): %d", (uint8_t *)&buf, 8u);
          }

          _MBLog(@"DEFAULT", (uint64_t)"=diag= access(R_OK): %d", v42, v43, v44, v45, v46, v47, 0);
        }
      }

      memset(&v379, 0, sizeof(v379));
      if (stat(v12, &v379))
      {
        uint64_t v54 = *__error();
        long long v55 = MBGetDefaultLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          long long v55 = v55;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = v54;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "=diag= stat failed: %{errno}d", (uint8_t *)&buf, 8u);
          }

          _MBLog(@"DEFAULT", (uint64_t)"=diag= stat failed: %{errno}d", v56, v57, v58, v59, v60, v61, v54);
        }
        __darwin_ino64_t st_ino = 0;
      }
      else
      {
        __darwin_ino64_t st_ino = v379.st_ino;
        long long v55 = MBGetDefaultLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          long long v55 = v55;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67113472;
            buf.__darwin_ino64_t f_iosize = v379.st_dev;
            LOWORD(buf.f_blocks) = 2048;
            *(uint64_t *)((char *)&buf.f_blocks + 2) = v379.st_ino;
            WORD1(buf.f_bfree) = 1024;
            HIDWORD(buf.f_bfree) = v379.st_mode;
            LOWORD(buf.f_bavail) = 1024;
            *(_DWORD *)((char *)&buf.f_bavail + 2) = v379.st_nlink;
            HIWORD(buf.f_bavail) = 1024;
            LODWORD(buf.f_files) = v379.st_uid;
            WORD2(buf.f_files) = 1024;
            *(_DWORD *)((char *)&buf.f_files + 6) = v379.st_gid;
            WORD1(buf.f_ffree) = 1024;
            HIDWORD(buf.f_ffree) = v379.st_rdev;
            LOWORD(buf.f_fsid.val[0]) = 2048;
            *(fsid_t *)((char *)&buf.f_fsid + 2) = (fsid_t)v379.st_atimespec.tv_sec;
            HIWORD(buf.f_owner) = 2048;
            *(void *)&buf.f_type = v379.st_atimespec.tv_nsec;
            LOWORD(buf.f_fssubtype) = 2048;
            *(void *)((char *)&buf.f_fssubtype + 2) = v379.st_mtimespec.tv_sec;
            *(_WORD *)&buf.f_fstypename[6] = 2048;
            *(void *)&buf.f_fstypename[8] = v379.st_mtimespec.tv_nsec;
            *(_WORD *)buf.f_mntonname = 2048;
            *(void *)&buf.f_mntonname[2] = v379.st_ctimespec.tv_sec;
            *(_WORD *)&buf.f_mntonname[10] = 2048;
            *(void *)&buf.f_mntonname[12] = v379.st_ctimespec.tv_nsec;
            *(_WORD *)&buf.f_mntonname[20] = 2048;
            *(void *)&buf.f_mntonname[22] = v379.st_size;
            *(_WORD *)&buf.f_mntonname[30] = 2048;
            *(void *)&buf.f_mntonname[32] = v379.st_blocks << 9;
            *(_WORD *)&buf.f_mntonname[40] = 1024;
            *(_DWORD *)&buf.f_mntonname[42] = v379.st_blksize;
            *(_WORD *)&buf.f_mntonname[46] = 1024;
            *(_DWORD *)&buf.f_mntonname[48] = v379.st_flags;
            *(_WORD *)&buf.f_mntonname[52] = 1024;
            *(_DWORD *)&buf.f_mntonname[54] = v379.st_gen;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "=diag= stat: dev %d, ino %llu, mode 0%o, nlink %u, uid %u, gid %u, rdev %d, atime %lu.%ld, mtime %lu.%ld, ctime %lu.%ld, lgsize %lld, physize %lld, blksize %d, flags %u, gen %u", (uint8_t *)&buf, 0x92u);
          }

          uint64_t st_flags = v379.st_flags;
          uint64_t st_gen = v379.st_gen;
          blkcnt_t v340 = v379.st_blocks << 9;
          uint64_t st_blksize = v379.st_blksize;
          uint64_t st_size = v379.st_size;
          timespec st_ctimespec = v379.st_ctimespec;
          timespec st_mtimespec = v379.st_mtimespec;
          timespec st_atimespec = v379.st_atimespec;
          *((void *)&v334 + 1) = v379.st_gid;
          uint64_t st_rdev = v379.st_rdev;
          *((void *)&v333 + 1) = v379.st_nlink;
          *(void *)&long long v334 = v379.st_uid;
          __darwin_ino64_t f_iosize = v379.st_ino;
          *(void *)&long long v333 = v379.st_mode;
          _MBLog(@"DEFAULT", (uint64_t)"=diag= stat: dev %d, ino %llu, mode 0%o, nlink %u, uid %u, gid %u, rdev %d, atime %lu.%ld, mtime %lu.%ld, ctime %lu.%ld, lgsize %lld, physize %lld, blksize %d, flags %u, gen %u", v63, v64, v65, v66, v67, v68, v379.st_dev);
        }
      }

      long long v377 = xmmword_100017F50;
      uint64_t v378 = 0x1800000403;
      memset(v376, 0, sizeof(v376));
      long long v374 = 0u;
      long long v375 = 0u;
      long long v373 = 0u;
      long long v372 = 0u;
      v357 = v12;
      if (getattrlist(v12, &v377, &v372, 0x64uLL, 0x29u))
      {
        uint64_t v69 = *__error();
        long long v70 = MBGetDefaultLog();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          long long v70 = v70;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = v69;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "=diag= getattrlist failed: %{errno}d", (uint8_t *)&buf, 8u);
          }

          _MBLog(@"DEFAULT", (uint64_t)"=diag= getattrlist failed: %{errno}d", v71, v72, v73, v74, v75, v76, v69);
        }
      }
      else
      {
        if (!st_ino)
        {
          if ((BYTE7(v372) & 2) != 0) {
            __darwin_ino64_t st_ino = *(void *)((char *)&v375 + 4);
          }
          else {
            __darwin_ino64_t st_ino = 0;
          }
        }
        if (HIDWORD(v373) != 1)
        {
          long long v77 = MBGetDefaultLog();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            __darwin_ino64_t v78 = st_ino;
            v79 = v77;
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.f_bsize) = 0;
              _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "=diag= warning: not a regular file, link info and sizes will be garbage", (uint8_t *)&buf, 2u);
            }

            _MBLog(@"DEFAULT", (uint64_t)"=diag= warning: not a regular file, link info and sizes will be garbage", v80, v81, v82, v83, v84, v85, v330);
            __darwin_ino64_t st_ino = v78;
          }
        }
        long long v70 = MBGetDefaultLog();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          long long v70 = v70;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            buf.__darwin_ino64_t f_iosize = v372;
            *(_DWORD *)((char *)&buf.f_blocks + 2) = (DWORD1(v372) >> 1) & 1;
            LODWORD(buf.f_bfree) = DWORD2(v373);
            *(_DWORD *)((char *)&buf.f_bfree + 6) = (DWORD1(v372) >> 3) & 1;
            HIDWORD(buf.f_bavail) = HIDWORD(v373);
            *(_DWORD *)((char *)&buf.f_files + 2) = (DWORD1(v372) >> 25) & 1;
            buf.f_ffree = *(void *)((char *)&v375 + 4);
            *(int32_t *)((char *)buf.f_fsid.val + 2) = (DWORD1(v372) >> 15) & 1;
            buf.f_owner = v374;
            *(uint32_t *)((char *)&buf.f_type + 2) = HIWORD(DWORD1(v372)) & 1;
            buf.f_fssubtype = DWORD1(v374);
            *(_DWORD *)&buf.f_fstypename[2] = (DWORD1(v372) >> 17) & 1;
            *(_DWORD *)&buf.f_fstypename[8] = DWORD2(v374);
            *(_DWORD *)&buf.f_fstypename[14] = (DWORD1(v372) >> 18) & 1;
            *(_DWORD *)&buf.f_mntonname[4] = HIDWORD(v374);
            *(_DWORD *)&buf.f_mntonname[10] = (DWORD1(v372) >> 19) & 1;
            *(_DWORD *)&buf.f_mntonname[16] = v375;
            *(_DWORD *)&buf.f_mntonname[22] = (DWORD1(v372) >> 30) & 1;
            *(_DWORD *)&buf.f_mntonname[28] = HIDWORD(v375);
            *(_DWORD *)&buf.f_mntonname[34] = v373 & 1;
            *(_DWORD *)&buf.f_mntonname[40] = v376[0];
            *(_DWORD *)&buf.f_mntonname[46] = (v373 >> 1) & 1;
            *(void *)&buf.f_mntonname[52] = *(void *)&v376[1];
            *(_DWORD *)&buf.f_mntonname[62] = (v373 >> 10) & 1;
            *(void *)&buf.f_mntonname[68] = *(void *)&v376[3];
            *(_DWORD *)&buf.f_mntonname[78] = (DWORD1(v373) >> 3) & 1;
            *(void *)&buf.f_mntonname[84] = *(void *)&v376[5];
            LOWORD(buf.f_blocks) = 1024;
            HIWORD(buf.f_blocks) = 1024;
            WORD2(buf.f_bfree) = 1024;
            WORD1(buf.f_bavail) = 1024;
            LOWORD(buf.f_files) = 1024;
            LOWORD(buf.f_fsid.val[0]) = 1024;
            HIWORD(buf.f_fsid.val[1]) = 1024;
            LOWORD(buf.f_type) = 1024;
            HIWORD(buf.f_flags) = 1024;
            *(_WORD *)buf.f_fstypename = 1024;
            *(_WORD *)&buf.f_fstypename[6] = 1024;
            *(_WORD *)&buf.f_fstypename[12] = 1024;
            *(_WORD *)&buf.f_mntonname[2] = 1024;
            *(_WORD *)&buf.f_mntonname[8] = 1024;
            *(_WORD *)&buf.f_mntonname[14] = 1024;
            *(_WORD *)&buf.f_mntonname[20] = 1024;
            *(_WORD *)&buf.f_mntonname[26] = 1024;
            *(_WORD *)&buf.f_mntonname[32] = 1024;
            *(_WORD *)&buf.f_mntonname[38] = 1024;
            *(_WORD *)&buf.f_mntonname[44] = 1024;
            *(_WORD *)&buf.f_mntonname[60] = 1024;
            *(_WORD *)&buf.f_mntonname[76] = 1024;
            *(_WORD *)&buf.f_mntonname[92] = 1024;
            *(_DWORD *)&buf.f_mntonname[94] = (DWORD1(v373) >> 4) & 1;
            HIWORD(buf.f_files) = 2048;
            *(_WORD *)&buf.f_mntonname[50] = 2048;
            *(_WORD *)&buf.f_mntonname[66] = 2048;
            *(_WORD *)&buf.f_mntonname[82] = 2048;
            *(_WORD *)&buf.f_mntonname[98] = 2048;
            *(void *)&buf.f_mntonname[100] = *(void *)&v376[7];
            buf.f_bsize = 67116288;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "=diag= getattrlist: len %u, dev (%d)%d, type (%d)%u, fileId (%d)%llu, uid (%d)%u, gid (%d)%u, access (%d)0%o, flags (%d)0x%x, gencount (%d)%u, protclass (%d)%u, nlink (%d)%u, lgsize (%d)%lld, physize (%d)%lld, realsize (%d)%lld, linkid (%d)%llu", (uint8_t *)&buf, 0xC4u);
          }

          __darwin_ino64_t v356 = (DWORD1(v372) >> 1) & 1;
          uint64_t v355 = (DWORD1(v372) >> 3) & 1;
          uint64_t v353 = (DWORD1(v373) >> 4) & 1;
          uint64_t v354 = *(void *)&v376[7];
          uint64_t v351 = (DWORD1(v373) >> 3) & 1;
          uint64_t v352 = *(void *)&v376[5];
          uint64_t v349 = (v373 >> 10) & 1;
          uint64_t v350 = *(void *)&v376[3];
          uint64_t v347 = (v373 >> 1) & 1;
          uint64_t v348 = *(void *)&v376[1];
          uint64_t v345 = v373 & 1;
          uint64_t v346 = v376[0];
          uint64_t st_gen = (DWORD1(v372) >> 30) & 1;
          uint64_t v344 = HIDWORD(v375);
          uint64_t st_blksize = (DWORD1(v372) >> 19) & 1;
          uint64_t st_flags = v375;
          uint64_t st_size = (DWORD1(v372) >> 18) & 1;
          blkcnt_t v340 = HIDWORD(v374);
          st_ctimespec.tv_sec = (DWORD1(v372) >> 17) & 1;
          st_ctimespec.tv_nsec = DWORD2(v374);
          st_mtimespec.tv_sec = HIWORD(DWORD1(v372)) & 1;
          st_mtimespec.tv_nsec = DWORD1(v374);
          st_atimespec.tv_sec = (DWORD1(v372) >> 15) & 1;
          st_atimespec.tv_nsec = v374;
          *((void *)&v334 + 1) = (DWORD1(v372) >> 25) & 1;
          uint64_t st_rdev = *(void *)((char *)&v375 + 4);
          *((void *)&v333 + 1) = v355;
          *(void *)&long long v334 = HIDWORD(v373);
          __darwin_ino64_t f_iosize = v356;
          *(void *)&long long v333 = DWORD2(v373);
          _MBLog(@"DEFAULT", (uint64_t)"=diag= getattrlist: len %u, dev (%d)%d, type (%d)%u, fileId (%d)%llu, uid (%d)%u, gid (%d)%u, access (%d)0%o, flags (%d)0x%x, gencount (%d)%u, protclass (%d)%u, nlink (%d)%u, lgsize (%d)%lld, physize (%d)%lld, realsize (%d)%lld, linkid (%d)%llu", v353, st_size, *(uint64_t *)&v376[5], st_blksize, *(uint64_t *)&v376[7], v345, v372);
        }
      }

      fsid_t f_fsid = 0;
      int v86 = open(v16, 256);
      if (v86 == -1)
      {
        __darwin_ino64_t v96 = *__error();
        long long v97 = MBGetDefaultLog();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          long long v98 = v97;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 136446466;
            *(void *)&buf.__darwin_ino64_t f_iosize = v16;
            WORD2(buf.f_blocks) = 1024;
            *(_DWORD *)((char *)&buf.f_blocks + 6) = v96;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "=diag= open failed at %{public}s: %{errno}d", (uint8_t *)&buf, 0x12u);
          }

          __darwin_ino64_t f_iosize = v96;
          _MBLog(@"DEFAULT", (uint64_t)"=diag= open failed at %{public}s: %{errno}d", v99, v100, v101, v102, v103, v104, (uint64_t)v16);
        }

        if (!st_ino) {
          goto LABEL_125;
        }
      }
      else
      {
        int v87 = v86;
        *(void *)v358 = st_ino;
        bzero(&buf, 0x878uLL);
        if (fstatfs(v87, &buf))
        {
          __darwin_ino64_t v88 = *__error();
          long long v89 = MBGetDefaultLog();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            long long v89 = v89;
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v386.d_ino) = 136446466;
              *(__uint64_t *)((char *)&v386.d_ino + 4) = (__uint64_t)v16;
              WORD2(v386.d_seekoff) = 1024;
              *(_DWORD *)((char *)&v386.d_seekoff + 6) = v88;
              _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "=diag= fstatfs failed at %{public}s: %{errno}d", (uint8_t *)&v386, 0x12u);
            }

            __darwin_ino64_t f_iosize = v88;
            _MBLog(@"DEFAULT", (uint64_t)"=diag= fstatfs failed at %{public}s: %{errno}d", v90, v91, v92, v93, v94, v95, (uint64_t)v16);
          }
        }
        else
        {
          fsid_t f_fsid = buf.f_fsid;
          long long v89 = MBGetDefaultLog();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            long long v89 = v89;
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v386.d_ino) = 67112448;
              HIDWORD(v386.d_ino) = buf.f_bsize;
              LOWORD(v386.d_seekoff) = 1024;
              *(_DWORD *)((char *)&v386.d_seekoff + 2) = buf.f_iosize;
              HIWORD(v386.d_seekoff) = 2048;
              *(void *)&v386.int d_reclen = buf.f_blocks;
              *(_WORD *)&v386.d_name[3] = 2048;
              *(void *)&v386.d_name[5] = buf.f_bfree;
              *(_WORD *)&v386.d_name[13] = 2048;
              *(void *)&v386.d_name[15] = buf.f_bavail;
              *(_WORD *)&v386.d_name[23] = 2048;
              *(void *)&v386.d_name[25] = buf.f_files;
              *(_WORD *)&v386.d_name[33] = 2048;
              *(void *)&v386.d_name[35] = buf.f_ffree;
              *(_WORD *)&v386.d_name[43] = 1024;
              *(_DWORD *)&v386.d_name[45] = buf.f_fsid.val[0];
              *(_WORD *)&v386.d_name[49] = 1024;
              *(_DWORD *)&v386.d_name[51] = buf.f_fsid.val[1];
              *(_WORD *)&v386.d_name[55] = 1024;
              *(_DWORD *)&v386.d_name[57] = buf.f_owner;
              *(_WORD *)&v386.d_name[61] = 1024;
              *(_DWORD *)&v386.d_name[63] = buf.f_type;
              *(_WORD *)&v386.d_name[67] = 1024;
              *(_DWORD *)&v386.d_name[69] = buf.f_flags;
              *(_WORD *)&v386.d_name[73] = 1024;
              *(_DWORD *)&v386.d_name[75] = buf.f_fssubtype;
              *(_WORD *)&v386.d_name[79] = 1024;
              *(_DWORD *)&v386.d_name[81] = buf.f_flags_ext;
              _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "=diag= fstatfs: bsize %u, iosize %d, blocks %llu, bfree %llu, bavail %llu, files %llu, ffree %llu, fsid {%d, %d}, owner %d, type %d, flags 0x%x, fssubtype %d, flags_ext 0x%x", (uint8_t *)&v386, 0x6Au);
            }

            st_ctimespec.tv_nsec = buf.f_fssubtype;
            uint64_t st_size = buf.f_flags_ext;
            st_mtimespec.tv_nsec = buf.f_type;
            st_ctimespec.tv_sec = buf.f_flags;
            st_atimespec.tv_nsec = buf.f_fsid.val[1];
            st_mtimespec.tv_sec = buf.f_owner;
            uint64_t st_rdev = buf.f_ffree;
            st_atimespec.tv_sec = buf.f_fsid.val[0];
            long long v333 = *(_OWORD *)&buf.f_blocks;
            long long v334 = *(_OWORD *)&buf.f_bavail;
            __darwin_ino64_t f_iosize = buf.f_iosize;
            _MBLog(@"DEFAULT", (uint64_t)"=diag= fstatfs: bsize %u, iosize %d, blocks %llu, bfree %llu, bavail %llu, files %llu, ffree %llu, fsid {%d, %d}, owner %d, type %d, flags 0x%x, fssubtype %d, flags_ext 0x%x", v105, v106, v107, v108, v109, v110, buf.f_bsize);
          }
        }

        v111 = fdopendir(v87);
        if (v111)
        {
          v112 = v111;
          uint64_t v113 = 0;
          while (1)
          {
            bzero(&v386, 0x418uLL);
            v370 = 0;
            uint64_t v114 = readdir_r(v112, &v386, &v370);
            if (v114) {
              break;
            }
            if (!v370) {
              goto LABEL_99;
            }
            if (*(unsigned __int16 *)v386.d_name != 46
              && *(unsigned __int16 *)v386.d_name ^ 0x2E2E | v386.d_name[2]
              && !strcmp(v386.d_name, v14))
            {
              __uint64_t d_ino = *(void *)v358;
              if (!*(void *)v358) {
                __uint64_t d_ino = v386.d_ino;
              }
              v322 = MBGetDefaultLog();
              if (os_log_type_enabled(v322, OS_LOG_TYPE_DEFAULT))
              {
                v323 = v322;
                if (os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v380) = 67110144;
                  DWORD1(v380) = v113;
                  WORD4(v380) = 1024;
                  *(_DWORD *)((char *)&v380 + 10) = v386.d_type;
                  HIWORD(v380) = 2048;
                  __uint64_t v381 = v386.d_ino;
                  __int16 v382 = 1024;
                  int d_namlen = v386.d_namlen;
                  __int16 v384 = 1024;
                  int d_reclen = v386.d_reclen;
                  _os_log_impl((void *)&_mh_execute_header, v323, OS_LOG_TYPE_DEFAULT, "=diag= readdir_r found file entry (%u), type %d, ino %llu, namelen %d, reclen %d", (uint8_t *)&v380, 0x24u);
                }

                *((void *)&v333 + 1) = v386.d_namlen;
                *(void *)&long long v334 = v386.d_reclen;
                __darwin_ino64_t f_iosize = v386.d_type;
                *(void *)&long long v333 = v386.d_ino;
                _MBLog(@"DEFAULT", (uint64_t)"=diag= readdir_r found file entry (%u), type %d, ino %llu, namelen %d, reclen %d", v324, v325, v326, v327, v328, v329, v113);
              }

              closedir(v112);
              __darwin_ino64_t st_ino = d_ino;
              if (d_ino) {
                goto LABEL_104;
              }
LABEL_125:
              long long v380 = 0uLL;
              if (fsctl(v12, 0x40104A0EuLL, &v380, 0))
              {
                uint64_t v177 = *__error();
                v178 = MBGetDefaultLog();
                if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
                {
                  v178 = v178;
                  if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 67109120;
                    buf.__darwin_ino64_t f_iosize = v177;
                    _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_CLONE_INFO) failed: %{errno}d", (uint8_t *)&buf, 8u);
                  }

                  _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_GET_CLONE_INFO) failed: %{errno}d", v179, v180, v181, v182, v183, v184, v177);
                }
              }
              else
              {
                v178 = MBGetDefaultLog();
                if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
                {
                  v178 = v178;
                  if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 134218240;
                    *(void *)&buf.__darwin_ino64_t f_iosize = v380;
                    WORD2(buf.f_blocks) = 2048;
                    *(uint64_t *)((char *)&buf.f_blocks + 6) = *((void *)&v380 + 1);
                    _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_CLONE_INFO): flags 0x%llx, private_id %llu", (uint8_t *)&buf, 0x16u);
                  }

                  __darwin_ino64_t f_iosize = *((void *)&v380 + 1);
                  _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_GET_CLONE_INFO): flags 0x%llx, private_id %llu", v185, v186, v187, v188, v189, v190, v380);
                }
              }

              uint64_t v331 = 0;
              int v359 = open_dprotected_np(v12, 0, 0, 1);
              if (v359 == -1)
              {
                uint64_t v199 = *__error();
                v200 = MBGetDefaultLog();
                if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
                {
                  buf.f_bsize = 67109120;
                  buf.__darwin_ino64_t f_iosize = v199;
                  _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_DEFAULT, "=diag= Failed to open the file raw encrypted: %{errno}d", (uint8_t *)&buf, 8u);
                  _MBLog(@"DEFAULT", (uint64_t)"=diag= Failed to open the file raw encrypted: %{errno}d", v201, v202, v203, v204, v205, v206, v199);
                }
              }
              else
              {
                uint64_t v369 = 0;
                if (fsctl(v12, 0x40084A25uLL, &v369, 8u))
                {
                  uint64_t v191 = *__error();
                  v192 = MBGetDefaultLog();
                  if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
                  {
                    v192 = v192;
                    if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 67109120;
                      buf.__darwin_ino64_t f_iosize = v191;
                      _os_log_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS) failed: %{errno}d", (uint8_t *)&buf, 8u);
                    }

                    _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS) failed: %{errno}d", v193, v194, v195, v196, v197, v198, v191);
                  }
                }
                else
                {
                  v192 = MBGetDefaultLog();
                  if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
                  {
                    v192 = v192;
                    if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 134217984;
                      *(void *)&buf.__darwin_ino64_t f_iosize = v369;
                      _os_log_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS): flags 0x%llx", (uint8_t *)&buf, 0xCu);
                    }

                    _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS): flags 0x%llx", v207, v208, v209, v210, v211, v212, v369);
                  }
                }

                long long v367 = 0u;
                long long v368 = 0u;
                long long v366 = 0u;
                if (fsctl(v12, 0x40304A6DuLL, &v366, 0))
                {
                  uint64_t v213 = *__error();
                  v214 = MBGetDefaultLog();
                  if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                  {
                    v214 = v214;
                    if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 67109120;
                      buf.__darwin_ino64_t f_iosize = v213;
                      _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO) failed: %{errno}d", (uint8_t *)&buf, 8u);
                    }

                    _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO) failed: %{errno}d", v215, v216, v217, v218, v219, v220, v213);
                  }
                }
                else
                {
                  v214 = MBGetDefaultLog();
                  if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                  {
                    v214 = v214;
                    if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 134219264;
                      *(void *)&buf.__darwin_ino64_t f_iosize = v366;
                      WORD2(buf.f_blocks) = 2048;
                      *(uint64_t *)((char *)&buf.f_blocks + 6) = *((void *)&v366 + 1);
                      HIWORD(buf.f_bfree) = 2048;
                      buf.f_bavail = v367;
                      LOWORD(buf.f_files) = 2048;
                      *(uint64_t *)((char *)&buf.f_files + 2) = *((void *)&v367 + 1);
                      WORD1(buf.f_ffree) = 2048;
                      *(uint64_t *)((char *)&buf.f_ffree + 4) = v368;
                      LOWORD(buf.f_fsid.val[1]) = 2048;
                      *(fsid_t *)((char *)&buf.f_fsid + 6) = (fsid_t)*((void *)&v368 + 1);
                      _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO): file flags: 0x%llx related flags: 0x%llx, file acctime: %llu\n gen count: %llu sync root id: %llu size: %llu", (uint8_t *)&buf, 0x3Eu);
                    }

                    long long v334 = v368;
                    __darwin_ino64_t f_iosize = *((void *)&v366 + 1);
                    long long v333 = v367;
                    _MBLog(@"DEFAULT", (uint64_t)"=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO): file flags: 0x%llx related flags: 0x%llx, file acctime: %llu\n gen count: %llu sync root id: %llu size: %llu", v221, v222, v223, v224, v225, v226, v366);
                  }
                }

                v227 = MBGetDefaultLog();
                if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
                {
                  v228 = v227;
                  if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(buf.f_bsize) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "=diag= Dumping extent information", (uint8_t *)&buf, 2u);
                  }

                  _MBLog(@"DEFAULT", (uint64_t)"=diag= Dumping extent information", v229, v230, v231, v232, v233, v234, v331);
                }

                uint64_t v235 = 0;
                uint64_t v236 = 0;
                while (1)
                {
                  LODWORD(v386.d_ino) = 0;
                  *(__uint64_t *)((char *)&v386.d_ino + 4) = 0x7FFFFFFFFFFFFFFFLL;
                  *(__uint64_t *)((char *)&v386.d_seekoff + 4) = v236;
                  if (fcntl(v359, 65, &v386, f_iosize, v333, v334, st_rdev, st_atimespec, st_mtimespec, st_ctimespec, st_size, v340, st_blksize, st_flags, st_gen, v344, v345, v346, v347,
                         v348,
                         v349,
                         v350,
                         v351,
                         v352,
                         v353,
                         v354,
                         v355,
                         v356))
                  {
                    break;
                  }
                  uint64_t v237 = *(__uint64_t *)((char *)&v386.d_ino + 4);
                  v238 = MBGetDefaultLog();
                  if (os_log_type_enabled(v238, OS_LOG_TYPE_DEFAULT))
                  {
                    v239 = v238;
                    if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 134218496;
                      *(void *)&buf.__darwin_ino64_t f_iosize = v236;
                      WORD2(buf.f_blocks) = 2048;
                      *(uint64_t *)((char *)&buf.f_blocks + 6) = v237;
                      HIWORD(buf.f_bfree) = 2048;
                      buf.f_bavail = *(__uint64_t *)((char *)&v386.d_seekoff + 4);
                      _os_log_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_DEFAULT, "=diag= 0x%llx:+%lld @ 0x%llx", (uint8_t *)&buf, 0x20u);
                    }

                    __darwin_ino64_t f_iosize = v237;
                    *(void *)&long long v333 = *(__uint64_t *)((char *)&v386.d_seekoff + 4);
                    _MBLog(@"DEFAULT", (uint64_t)"=diag= 0x%llx:+%lld @ 0x%llx", v240, v241, v242, v243, v244, v245, v236);
                  }

                  if (v237 < 1 || (v237 ^ 0x7FFFFFFFFFFFFFFFLL) < v236) {
                    goto LABEL_176;
                  }
                  v236 += v237;
                  uint64_t v235 = (v235 + 1);
                  if (v235 == 10000)
                  {
                    uint64_t v235 = 10000;
                    goto LABEL_176;
                  }
                }
                int v246 = *__error();
                if (v246 != 34)
                {
                  v247 = MBGetDefaultLog();
                  if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
                  {
                    v248 = v247;
                    if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 134218240;
                      *(void *)&buf.__darwin_ino64_t f_iosize = v236;
                      WORD2(buf.f_blocks) = 1024;
                      *(_DWORD *)((char *)&buf.f_blocks + 6) = v246;
                      _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_DEFAULT, "=diag= log2phys failed at 0x%llx: %{errno}d", (uint8_t *)&buf, 0x12u);
                    }

                    _MBLog(@"DEFAULT", (uint64_t)"=diag= log2phys failed at 0x%llx: %{errno}d", v249, v250, v251, v252, v253, v254, v236);
                  }
                }
LABEL_176:
                v255 = MBGetDefaultLog();
                if (os_log_type_enabled(v255, OS_LOG_TYPE_DEFAULT))
                {
                  v256 = v255;
                  if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 67109120;
                    buf.__darwin_ino64_t f_iosize = v235;
                    _os_log_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_DEFAULT, "=diag= Found %u extents", (uint8_t *)&buf, 8u);
                  }

                  _MBLog(@"DEFAULT", (uint64_t)"=diag= Found %u extents", v257, v258, v259, v260, v261, v262, v235);
                }

                v263 = (unsigned int *)malloc_type_malloc(0x4000uLL, 0x445AE8B7uLL);
                if (!v263) {
                  sub_100013EDC();
                }
                v264 = v263;
                int v360 = 1;
                uint64_t v362 = 0;
                uint64_t v361 = 0;
                int v363 = 0;
                uint64_t v364 = 0x4000;
                v365 = v263;
                if (ffsctl(v359, 0x80284A7FuLL, &v360, 0))
                {
                  uint64_t v265 = *__error();
                  v266 = MBGetDefaultLog();
                  if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
                  {
                    v267 = v266;
                    if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 67109120;
                      buf.__darwin_ino64_t f_iosize = v265;
                      _os_log_impl((void *)&_mh_execute_header, v267, OS_LOG_TYPE_DEFAULT, "=diag= Failed to get the crypto file infos: %{errno}d", (uint8_t *)&buf, 8u);
                    }

                    _MBLog(@"DEFAULT", (uint64_t)"=diag= Failed to get the crypto file infos: %{errno}d", v268, v269, v270, v271, v272, v273, v265);
                  }
                }
                else
                {
                  if ((*((void *)v264 + 2) & 0x8000000000000000) == 0) {
                    sub_100013F08();
                  }
                  v274 = MBGetDefaultLog();
                  if (os_log_type_enabled(v274, OS_LOG_TYPE_DEFAULT))
                  {
                    v275 = v274;
                    if (os_log_type_enabled(v275, OS_LOG_TYPE_DEFAULT))
                    {
                      int32_t v276 = v264[85];
                      uint64_t v277 = *((void *)v264 + 3);
                      buf.f_bsize = 67109376;
                      buf.__darwin_ino64_t f_iosize = v276;
                      LOWORD(buf.f_blocks) = 2048;
                      *(uint64_t *)((char *)&buf.f_blocks + 2) = v277;
                      _os_log_impl((void *)&_mh_execute_header, v275, OS_LOG_TYPE_DEFAULT, "=diag= Found %u crypto ids for filesize %lld", (uint8_t *)&buf, 0x12u);
                    }

                    _MBLog(@"DEFAULT", (uint64_t)"=diag= Found %u crypto ids for filesize %lld", v278, v279, v280, v281, v282, v283, v264[85]);
                  }

                  if (v264[85])
                  {
                    unsigned __int16 v284 = 0;
                    v285 = (char *)(v264 + 86);
                    do
                    {
                      int v286 = v284;
                      v287 = (uint64_t *)&v285[312 * v284];
                      uint64_t v288 = v287[2];
                      v289 = MBGetDefaultLog();
                      if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
                      {
                        v290 = v289;
                        if (os_log_type_enabled(v290, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v291 = *v287;
                          uint64_t v292 = *(void *)&v285[312 * v286 + 8];
                          buf.f_bsize = 134218496;
                          *(void *)&buf.__darwin_ino64_t f_iosize = v291;
                          WORD2(buf.f_blocks) = 2048;
                          *(uint64_t *)((char *)&buf.f_blocks + 6) = v292;
                          HIWORD(buf.f_bfree) = 2048;
                          buf.f_bavail = v288;
                          _os_log_impl((void *)&_mh_execute_header, v290, OS_LOG_TYPE_DEFAULT, "=diag= offset %lld:length %llu, id %lld", (uint8_t *)&buf, 0x20u);
                        }

                        _MBLog(@"DEFAULT", (uint64_t)"=diag= offset %lld:length %llu, id %lld", v293, v294, v295, v296, v297, v298, *v287);
                      }

                      v299 = MBGetDefaultLog();
                      if (os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT))
                      {
                        v300 = v299;
                        if (os_log_type_enabled(v300, OS_LOG_TYPE_DEFAULT))
                        {
                          v301 = &v285[312 * v286];
                          int v302 = *((_DWORD *)v301 + 10);
                          int v303 = *((_DWORD *)v301 + 11);
                          int v304 = *((unsigned __int16 *)v301 + 24);
                          LODWORD(v301) = *((unsigned __int16 *)v301 + 25);
                          buf.f_bsize = 134219008;
                          *(void *)&buf.__darwin_ino64_t f_iosize = v288;
                          WORD2(buf.f_blocks) = 1024;
                          *(_DWORD *)((char *)&buf.f_blocks + 6) = v302;
                          WORD1(buf.f_bfree) = 1024;
                          HIDWORD(buf.f_bfree) = v303;
                          LOWORD(buf.f_bavail) = 1024;
                          *(_DWORD *)((char *)&buf.f_bavail + 2) = v304;
                          HIWORD(buf.f_bavail) = 1024;
                          LODWORD(buf.f_files) = v301;
                          _os_log_impl((void *)&_mh_execute_header, v300, OS_LOG_TYPE_DEFAULT, "=diag= crypto_id %llu key_class %u, os_vers 0x%x, rev %hu, len %hu", (uint8_t *)&buf, 0x24u);
                        }

                        _MBLog(@"DEFAULT", (uint64_t)"=diag= crypto_id %llu key_class %u, os_vers 0x%x, rev %hu, len %hu", v305, v306, v307, v308, v309, v310, v288);
                      }

                      unsigned __int16 v284 = v286 + 1;
                    }
                    while (v264[85] > (unsigned __int16)(v286 + 1));
                  }
                }
                free(v264);
                MBDiagnoseGetNumberOfFileExtents(v357);
                if (getxattr(v357, "com.apple.ResourceFork", 0, 0, 0, 0) != -1)
                {
                  v311 = MBGetDefaultLog();
                  if (os_log_type_enabled(v311, OS_LOG_TYPE_DEFAULT))
                  {
                    v312 = v311;
                    if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                    {
                      buf.f_bsize = 136315138;
                      *(void *)&buf.__darwin_ino64_t f_iosize = v357;
                      _os_log_impl((void *)&_mh_execute_header, v312, OS_LOG_TYPE_DEFAULT, "=diag= %s is a compressed file", (uint8_t *)&buf, 0xCu);
                    }

                    _MBLog(@"DEFAULT", (uint64_t)"=diag= %s is a compressed file", v313, v314, v315, v316, v317, v318, (uint64_t)v357);
                  }

                  id v319 = [v11 stringByAppendingPathComponent:@"/..namedfork/rsrc"];
                  MBDiagnoseGetNumberOfFileExtents((const char *)[v319 fileSystemRepresentation]);
                }
                close(v359);
              }
              uint64_t v34 = MBGetDefaultLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                v320 = v34;
                if (os_log_type_enabled(v320, OS_LOG_TYPE_DEFAULT))
                {
                  buf.f_bsize = 138543362;
                  *(void *)&buf.__darwin_ino64_t f_iosize = v11;
                  _os_log_impl((void *)&_mh_execute_header, v320, OS_LOG_TYPE_DEFAULT, "=diag= Finished dumping diagnostics for %{public}@", (uint8_t *)&buf, 0xCu);
                }

                uint64_t v330 = (uint64_t)v11;
                uint64_t v41 = "=diag= Finished dumping diagnostics for %{public}@";
LABEL_214:
                _MBLog(@"DEFAULT", (uint64_t)v41, v35, v36, v37, v38, v39, v40, v330);
              }
              goto LABEL_215;
            }
            uint64_t v113 = (v113 + 1);
            if (v113 == 500000)
            {
              uint64_t v113 = 500000;
              goto LABEL_99;
            }
          }
          uint64_t v124 = v114;
          __darwin_ino64_t v125 = *__error();
          v126 = MBGetDefaultLog();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
          {
            v127 = v126;
            if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v380) = 67109376;
              DWORD1(v380) = v124;
              WORD4(v380) = 1024;
              *(_DWORD *)((char *)&v380 + 10) = v125;
              _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "=diag= readdir_r failed: %d (%{errno}d)", (uint8_t *)&v380, 0xEu);
            }

            __darwin_ino64_t f_iosize = v125;
            _MBLog(@"DEFAULT", (uint64_t)"=diag= readdir_r failed: %d (%{errno}d)", v128, v129, v130, v131, v132, v133, v124);
          }

LABEL_99:
          closedir(v112);
          v134 = MBGetDefaultLog();
          __darwin_ino64_t st_ino = *(void *)v358;
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
          {
            v135 = v134;
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v386.d_ino) = 67109120;
              HIDWORD(v386.d_ino) = v113;
              _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "=diag= Failed to find the file using readdir_r (%u)", (uint8_t *)&v386, 8u);
            }

            _MBLog(@"DEFAULT", (uint64_t)"=diag= Failed to find the file using readdir_r (%u)", v136, v137, v138, v139, v140, v141, v113);
          }

          if (!*(void *)v358) {
            goto LABEL_125;
          }
          goto LABEL_104;
        }
        __darwin_ino64_t v115 = *__error();
        v116 = MBGetDefaultLog();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          v117 = v116;
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v386.d_ino) = 136446466;
            *(__uint64_t *)((char *)&v386.d_ino + 4) = (__uint64_t)v16;
            WORD2(v386.d_seekoff) = 1024;
            *(_DWORD *)((char *)&v386.d_seekoff + 6) = v115;
            _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "=diag= fdopendir failed at %{public}s: %{errno}d", (uint8_t *)&v386, 0x12u);
          }

          __darwin_ino64_t f_iosize = v115;
          _MBLog(@"DEFAULT", (uint64_t)"=diag= fdopendir failed at %{public}s: %{errno}d", v118, v119, v120, v121, v122, v123, (uint64_t)v16);
        }

        close(v87);
        __darwin_ino64_t st_ino = *(void *)v358;
        if (!*(void *)v358) {
          goto LABEL_125;
        }
      }
LABEL_104:
      if (f_fsid.val[0])
      {
        *(void *)&long long v380 = st_ino;
        int v142 = openbyid_np();
        if (v142 == -1)
        {
          uint64_t v161 = *__error();
          v162 = MBGetDefaultLog();
          if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
          {
            v163 = v162;
            if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
            {
              buf.f_bsize = 67109888;
              buf.__darwin_ino64_t f_iosize = f_fsid.val[0];
              LOWORD(buf.f_blocks) = 1024;
              *(_DWORD *)((char *)&buf.f_blocks + 2) = f_fsid.val[1];
              HIWORD(buf.f_blocks) = 2048;
              buf.f_bfree = st_ino;
              LOWORD(buf.f_bavail) = 1024;
              *(_DWORD *)((char *)&buf.f_bavail + 2) = v161;
              _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "=diag= openbyid_np({%d, %d}, %llu) failed: %{errno}d", (uint8_t *)&buf, 0x1Eu);
            }

            *(void *)&long long v333 = st_ino;
            *((void *)&v333 + 1) = v161;
            __darwin_ino64_t f_iosize = f_fsid.val[1];
            _MBLog(@"DEFAULT", (uint64_t)"=diag= openbyid_np({%d, %d}, %llu) failed: %{errno}d", v164, v165, v166, v167, v168, v169, f_fsid.val[0]);
          }
        }
        else
        {
          int v143 = v142;
          v144 = MBGetDefaultLog();
          if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
          {
            v145 = v144;
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              buf.f_bsize = 67109632;
              buf.__darwin_ino64_t f_iosize = f_fsid.val[0];
              LOWORD(buf.f_blocks) = 1024;
              *(_DWORD *)((char *)&buf.f_blocks + 2) = f_fsid.val[1];
              HIWORD(buf.f_blocks) = 2048;
              buf.f_bfree = st_ino;
              _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "=diag= openbyid_np({%d, %d}, %llu) succeeded", (uint8_t *)&buf, 0x18u);
            }

            __darwin_ino64_t f_iosize = f_fsid.val[1];
            *(void *)&long long v333 = st_ino;
            _MBLog(@"DEFAULT", (uint64_t)"=diag= openbyid_np({%d, %d}, %llu) succeeded", v146, v147, v148, v149, v150, v151, f_fsid.val[0]);
          }

          ssize_t v152 = pread(v143, &buf, 0x10uLL, 0);
          if (v152 == -1)
          {
            uint64_t v170 = *__error();
            v154 = MBGetDefaultLog();
            if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
            {
              v154 = v154;
              if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v386.d_ino) = 67109120;
                HIDWORD(v386.d_ino) = v170;
                _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "=diag= pread failed: %d", (uint8_t *)&v386, 8u);
              }

              _MBLog(@"DEFAULT", (uint64_t)"=diag= pread failed: %d", v171, v172, v173, v174, v175, v176, v170);
            }
          }
          else
          {
            uint64_t v153 = v152;
            v154 = MBGetDefaultLog();
            if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
            {
              v154 = v154;
              if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v386.d_ino) = 134217984;
                *(__uint64_t *)((char *)&v386.d_ino + 4) = v153;
                _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "=diag= pread returned %ld bytes", (uint8_t *)&v386, 0xCu);
              }

              _MBLog(@"DEFAULT", (uint64_t)"=diag= pread returned %ld bytes", v155, v156, v157, v158, v159, v160, v153);
            }
          }

          close(v143);
        }
      }
      goto LABEL_125;
    }
    uint64_t v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=diag= nil dir path FSR", (uint8_t *)&buf, 2u);
      uint64_t v41 = "=diag= nil dir path FSR";
      goto LABEL_214;
    }
LABEL_215:
  }
}

void MBDiagnoseiCloudBackupFileAtPath(void *a1)
{
  id v3 = a1;
  id v1 = +[NSProcessInfo processInfo];
  __darwin_ino64_t v2 = [v1 processName];

  if ([v2 isEqualToString:@"backupd"]
    && atomic_fetch_add_explicit(dword_1000262A8, 1u, memory_order_relaxed) <= 1)
  {
    MBDiagnoseFile(v3);
  }
}

uint64_t MBSimpleChecksumForString(void *a1)
{
  id v1 = (const char *)[a1 UTF8String];
  int64_t v2 = strlen(v1);
  if (v2 < 1) {
    return 0;
  }
  unsigned int v3 = 0;
  id v4 = (char *)&v1[v2];
  do
  {
    int64_t v5 = v4 - v1;
    if ((unint64_t)(v4 - v1) < 4)
    {
      switch(v5)
      {
        case 1:
          int v6 = *v1 << 24;
          uint64_t v7 = 1;
          break;
        case 2:
          int v6 = (v1[1] << 16) | (*v1 << 24);
          uint64_t v7 = 2;
          break;
        case 3:
          int v6 = (v1[1] << 16) | (*v1 << 24) | (v1[2] << 8);
          uint64_t v7 = 3;
          break;
        default:
          sub_100013F34();
      }
    }
    else
    {
      int v6 = (v1[1] << 16) | (*v1 << 24) | (v1[2] << 8) | v1[3];
      uint64_t v7 = 4;
    }
    v1 += v7;
    v3 += v6;
  }
  while (v1 < v4);
  return v3;
}

id MBGetDefaultLog()
{
  if (qword_1000262B8 != -1) {
    dispatch_once(&qword_1000262B8, &stru_100020920);
  }
  v0 = (void *)qword_1000262B0;
  return v0;
}

void sub_10000DEDC(id a1)
{
  qword_1000262B0 = (uint64_t)os_log_create("com.apple.mobilebackup", "Default");
  _objc_release_x1();
}

id MBGetLogDateFormatter()
{
  if (qword_1000262C8 != -1) {
    dispatch_once(&qword_1000262C8, &stru_100020940);
  }
  v0 = (void *)qword_1000262C0;
  return v0;
}

void sub_10000DF74(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  int64_t v2 = (void *)qword_1000262C0;
  qword_1000262C0 = (uint64_t)v1;

  [(id)qword_1000262C0 setFormatterBehavior:1040];
  unsigned int v3 = (void *)qword_1000262C0;
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

CFStringRef MBGetLogDir()
{
  if (MBIsInternalInstall()) {
    return @"/var/mobile/Library/Logs/MobileBackup";
  }
  else {
    return @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/MobileBackup";
  }
}

id sub_10000E004(void *a1)
{
  id v1 = a1;
  int64_t v2 = (char *)[v1 length];
  unsigned int v3 = +[NSMutableString stringWithCapacity:v2];
  if (v2)
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v7 = 0;
    while (1)
    {
      unsigned int v8 = [v1 characterAtIndex:v4];
      switch(v7)
      {
        case 0:
          int v7 = v8 == 37;
          goto LABEL_20;
        case 1:
          uint64_t v9 = v8 - 64;
          if (v9 > 0x3B) {
            goto LABEL_26;
          }
          if (((1 << (v8 - 64)) & 0x129C2FA010000E3) != 0) {
            goto LABEL_19;
          }
          if (v9 == 16) {
            goto LABEL_23;
          }
          if (v9 != 59) {
            goto LABEL_26;
          }
          if (v6 < v4)
          {
            id v10 = v3;
            id v11 = objc_msgSend(v1, "substringWithRange:", v6, v4 - v6);
            [v10 appendString:v11];
          }
          int v7 = 2;
          unint64_t v6 = v4;
          goto LABEL_20;
        case 2:
          if (v8 == 125) {
            int v7 = 3;
          }
          else {
            int v7 = 2;
          }
          if (v8 == 125) {
            unint64_t v5 = v4 + 1;
          }
          goto LABEL_20;
        case 3:
          uint64_t v12 = v8 - 64;
          if (v12 > 0x38) {
            goto LABEL_26;
          }
          if (((1 << (v8 - 64)) & 0x129C2FA010000E3) != 0) {
            goto LABEL_19;
          }
          if (v12 == 16)
          {
LABEL_23:
            if (v5 < v4)
            {
              id v13 = v3;
              uint64_t v14 = objc_msgSend(v1, "substringWithRange:", v5, v4 - v5);
              [v13 appendString:v14];
            }
            [v3 appendString:@"p"];
            unint64_t v5 = v4 + 1;
          }
          else
          {
LABEL_26:
            if (v8 != 37)
            {
              int v7 = 3;
              goto LABEL_20;
            }
          }
LABEL_19:
          int v7 = 0;
          unint64_t v6 = v5;
LABEL_20:
          if (v2 == (char *)++v4) {
            goto LABEL_29;
          }
          break;
        default:
          goto LABEL_20;
      }
    }
  }
  unint64_t v6 = 0;
LABEL_29:
  BOOL v15 = (unint64_t)v2 > v6;
  uint64_t v16 = &v2[-v6];
  if (v15)
  {
    id v17 = v3;
    uint64_t v18 = objc_msgSend(v1, "substringWithRange:", v6, v16);
    [v17 appendString:v18];
  }
  return v3;
}

void _MBLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (sFileLoggingEnabled)
  {
    uint64_t v12 = +[NSString stringWithCString:a2 encoding:4];
    id v13 = objc_alloc((Class)NSString);
    uint64_t v14 = sub_10000E004(v12);
    id v15 = [v13 initWithFormat:v14 arguments:&a9];

    sub_10000E33C(v10, v15);
  }
}

void sub_10000E33C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (qword_1000262E8 != -1) {
    dispatch_once(&qword_1000262E8, &stru_1000209A8);
  }
  unint64_t v5 = MBGetLogDateFormatter();
  unint64_t v6 = +[NSDate date];
  int v7 = [v5 stringFromDate:v6];

  __uint64_t v76 = 0;
  if (pthread_threadid_np(0, &v76))
  {
    __uint64_t v8 = 0;
    __uint64_t v76 = 0;
  }
  else
  {
    __uint64_t v8 = v76;
  }
  uint64_t v9 = +[NSString stringWithFormat:@"%@ %d.%llx %@: %@\n", v7, dword_1000262E0, v8, v3, v4];
  id v10 = (const char *)[v9 UTF8String];
  size_t v11 = strlen(v10);
  pthread_mutex_lock(&stru_100026120);
  uint64_t v12 = &OBJC_PROTOCOL___MBHelperServiceProtocol;
  if (qword_1000262D8)
  {
    if (qword_100026300 != -1) {
      dispatch_once(&qword_100026300, &stru_1000209E8);
    }
    if (qword_1000262F8 > (unint64_t)qword_1000262F0) {
      goto LABEL_80;
    }
    if (qword_1000262D8) {
      fclose((FILE *)qword_1000262D8);
    }
  }
  if (qword_100026310 != -1) {
    dispatch_once(&qword_100026310, &stru_100020A28);
  }
  if (byte_100026308)
  {
    id v13 = MBGetLogDir();
    uint64_t v14 = (const char *)[v13 fileSystemRepresentation];
    if (mkdir(v14, 0x1C0u) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000141C8();
      }
    }
    else if (!geteuid())
    {
      memset(&v84, 0, sizeof(v84));
      if (lstat(v14, &v84))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100014144();
        }
      }
      else
      {
        uid_t v58 = MBMobileUID();
        if (v84.st_uid == v58 && v84.st_gid == v58 || !lchown(v14, v58, v58))
        {
          if ((~v84.st_mode & 0x1C0) != 0
            && lchmod(v14, 0x1C0u)
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_10001403C();
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1000140C0();
        }
      }
    }
  }
  if (qword_100026328 != -1) {
    dispatch_once(&qword_100026328, &stru_100020A88);
  }
  if (!byte_100026320)
  {
    qword_1000262D8 = 0;
    goto LABEL_82;
  }
  size_t v67 = v11;
  id v68 = v3;
  id v15 = MBGetLogDir();
  uint64_t v69 = sub_10000EC9C();
  uint64_t v16 = objc_msgSend(v15, "stringByAppendingPathComponent:");
  qword_1000262F0 = 0;
  memset(&v84, 0, sizeof(v84));
  id v17 = v16;
  uint64_t v71 = v15;
  if (!lstat((const char *)[v17 fileSystemRepresentation], &v84))
  {
    if (qword_100026300 != -1) {
      dispatch_once(&qword_100026300, &stru_1000209E8);
    }
    off_t v74 = qword_1000262F8;
    if (qword_100026348 != -1) {
      dispatch_once(&qword_100026348, &stru_100020AC8);
    }
    uint64_t v18 = qword_100026340;
    time_t v19 = time(0);
    __darwin_time_t v72 = v19;
    off_t st_size = v84.st_size;
    if (v74 < v84.st_size
      || (qword_1000262F0 = v84.st_size, v19 > v84.st_birthtimespec.tv_sec)
      && v19 - v84.st_birthtimespec.tv_sec >= 86401)
    {
      uint64_t v20 = +[NSFileManager defaultManager];
      if (qword_100026338 != -1) {
        dispatch_once(&qword_100026338, &stru_100020AA8);
      }
      if (byte_100026330)
      {
        id v62 = v17;
        uint64_t v63 = v10;
        uint64_t v64 = v9;
        uint64_t v65 = v7;
        id v66 = v4;
        uint64_t v21 = [v20 contentsOfDirectoryAtPath:v15 error:0];
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = sub_10000EF58;
        v82[3] = &unk_100020968;
        id v22 = v69;
        id v83 = v22;
        uint64_t v60 = +[NSPredicate predicateWithBlock:v82];
        uint64_t v61 = v21;
        uint64_t v59 = objc_msgSend(v21, "filteredArrayUsingPredicate:");
        uint64_t v23 = [v59 sortedArrayUsingComparator:&stru_100020A08];
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id obj = v23;
        id v24 = [v23 countByEnumeratingWithState:&v78 objects:v85 count:16];
        if (!v24) {
          goto LABEL_66;
        }
        id v25 = v24;
        uint64_t v26 = *(void *)v79;
        uint64_t v70 = v18;
        while (1)
        {
          for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v79 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            uint64_t v29 = [v28 stringByDeletingPathExtension];
            unsigned __int8 v30 = [v29 isEqualToString:v22];

            if ((v30 & 1) == 0)
            {
              if (([v28 isEqualToString:v22] & 1) == 0) {
                continue;
              }
              unsigned int v32 = 0;
LABEL_48:
              uint64_t v33 = [v15 stringByAppendingPathComponent:v28];
              uint64_t v34 = v33;
              if (v18 <= v32)
              {
                id v45 = v33;
                if (!lstat((const char *)[v45 fileSystemRepresentation], &v84)
                  && v72 > v84.st_mtimespec.tv_sec
                  && v72 - v84.st_mtimespec.tv_sec >= 864001)
                {
                  uint64_t v46 = v20;
                  id v47 = v45;
                  goto LABEL_60;
                }
              }
              else if (v74 < st_size)
              {
                if (v18 > v32 + 1)
                {
                  uint64_t v35 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
                  [(id)v35 description];
                  v37 = uint64_t v36 = v15;
                  uint64_t v38 = [v22 stringByAppendingPathExtension:v37];
                  uint64_t v39 = [v36 stringByAppendingPathComponent:v38];

                  id v77 = 0;
                  uint64_t v40 = v20;
                  LOBYTE(v35) = [v20 moveItemAtPath:v34 toPath:v39 error:&v77];
                  id v41 = v77;
                  uint64_t v42 = v41;
                  if ((v35 & 1) == 0)
                  {
                    uint64_t v43 = [v41 domain];
                    if ([v43 isEqualToString:NSCocoaErrorDomain])
                    {
                      id v44 = [v42 code];

                      if (v44 == (id)513) {
                        [v40 removeItemAtPath:v34 error:0];
                      }
                    }
                    else
                    {
                    }
                  }

                  uint64_t v20 = v40;
                  uint64_t v18 = v70;
                  id v15 = v71;
                  goto LABEL_63;
                }
                uint64_t v46 = v20;
                id v47 = v34;
LABEL_60:
                [v46 removeItemAtPath:v47 error:0];
              }
LABEL_63:

              continue;
            }
            uint64_t v31 = [v28 pathExtension];
            unsigned int v32 = [v31 intValue];

            if ((v32 & 0x80000000) == 0) {
              goto LABEL_48;
            }
          }
          id v25 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
          if (!v25)
          {
LABEL_66:

            int v7 = v65;
            id v4 = v66;
            id v10 = v63;
            uint64_t v9 = v64;
            uint64_t v12 = &OBJC_PROTOCOL___MBHelperServiceProtocol;
            id v17 = v62;
            goto LABEL_69;
          }
        }
      }
      [v20 removeItemAtPath:v17 error:0];
LABEL_69:
    }
  }
  uint64_t v48 = v12;
  uint64_t v49 = v10;
  id v50 = v17;
  uint64_t v51 = fopen((const char *)[v50 fileSystemRepresentation], "a");
  if (v51)
  {
    uid_t v52 = MBMobileUID();
    int v53 = fileno(v51);
    if (!fstat(v53, &v84))
    {
      uid_t st_uid = v84.st_uid;
      if (v84.st_uid != v52 && st_uid == geteuid()) {
        fchown(v53, v52, 0xFFFFFFFF);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100013FB8();
  }

  qword_1000262D8 = (uint64_t)v51;
  id v10 = v49;
  size_t v11 = v67;
  id v3 = v68;
  if (v51)
  {
    uint64_t v12 = v48;
    if (ftello(v51))
    {
      fputs("\n", (FILE *)qword_1000262D8);
      ++v48[10].class_meths;
    }
LABEL_80:
    long long v55 = (FILE *)qword_1000262D8;
    if (qword_1000262D8)
    {
      v12[10].class_meths = (__objc2_meth_list *)((char *)v12[10].class_meths + v11);
      fputs(v10, v55);
      uint64_t v56 = qword_1000262D0;
      dispatch_time_t v57 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(v56, v57, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
LABEL_82:
  pthread_mutex_unlock(&stru_100026120);
}

id sub_10000EC9C()
{
  v0 = +[NSProcessInfo processInfo];
  id v1 = [v0 processName];

  if (!v1 || (id v2 = v1, !strcmp((const char *)[v2 UTF8String], "backupd"))) {
    +[NSString stringWithFormat:@"%@.%@", @"MobileBackup", @"log", v5];
  }
  else {
  id v3 = +[NSString stringWithFormat:@"%@-%@.%@", @"MobileBackup", v2, @"log"];
  }

  return v3;
}

void sub_10000ED7C(id a1)
{
  dword_1000262E0 = getpid();
  id v1 = dispatch_get_global_queue(17, 0);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v1);
  id v3 = (void *)qword_1000262D0;
  qword_1000262D0 = (uint64_t)v2;

  dispatch_source_set_timer((dispatch_source_t)qword_1000262D0, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000262D0, &stru_1000209C8);
  id v4 = qword_1000262D0;
  dispatch_resume(v4);
}

void sub_10000EE1C(id a1)
{
  pthread_mutex_lock(&stru_100026120);
  dispatch_source_set_timer((dispatch_source_t)qword_1000262D0, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (qword_1000262D8) {
    fflush((FILE *)qword_1000262D8);
  }
  pthread_mutex_unlock(&stru_100026120);
}

void sub_10000EE7C(id a1)
{
  id v1 = getenv("MBMaxLogSize");
  if (v1)
  {
    uint64_t v2 = strtol(v1, 0, 10);
    if ((unint64_t)(v2 - 1) >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v3 = 10485760;
    }
    else {
      uint64_t v3 = v2;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MBMaxLogSize=%ld", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    uint64_t v3 = 10485760;
  }
  qword_1000262F8 = v3;
}

id sub_10000EF58(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

int64_t sub_10000EF64(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

void sub_10000EF70(id a1)
{
  id v1 = MBGetLogDir();
  uint64_t v2 = [v1 stringByDeletingLastPathComponent];

  getpid();
  id v5 = v2;
  [v5 fileSystemRepresentation];
  byte_100026308 = sandbox_check() == 0;
  uint64_t v3 = os_log_set_hook();
  int v4 = (void *)qword_100026318;
  qword_100026318 = v3;
}

void sub_10000F040(id a1, unsigned __int8 a2, os_log_message_s *a3)
{
  if (qword_100026318) {
    (*(void (**)(void))(qword_100026318 + 16))();
  }
  var16 = a3->var16;
  if (var16)
  {
    if (!strcmp(var16, "MBSwift"))
    {
      uint64_t v5 = os_log_copy_message_string();
      if (v5)
      {
        unint64_t v6 = (void *)v5;
        int v7 = +[NSString stringWithUTF8String:os_log_type_get_name()];
        __uint64_t v8 = +[NSString stringWithUTF8String:v6];
        sub_10000E33C(v7, v8);

        free(v6);
      }
    }
  }
}

void sub_10000F120(id a1)
{
  id v1 = MBGetLogDir();
  getpid();
  id v2 = v1;
  [v2 fileSystemRepresentation];
  byte_100026320 = sandbox_check() == 0;
}

void sub_10000F1BC(id a1)
{
  id v1 = MBGetLogDir();
  if (v1)
  {
    id v6 = v1;
    getpid();
    id v5 = [v6 fileSystemRepresentation];
    if (sandbox_check())
    {
      BOOL v2 = 0;
    }
    else
    {
      uint64_t v3 = +[NSProcessInfo processInfo];
      int v4 = [v3 processName];

      BOOL v2 = ([v4 isEqualToString:@"healthd"] & 1) == 0
        && ![v4 isEqualToString:@"imagent"];
    }
    id v1 = v6;
    byte_100026330 = v2;
  }
}

void sub_10000F2B0(id a1)
{
  id v1 = getenv("MBMaxLogCount");
  uint64_t v2 = 10;
  if (v1)
  {
    uint64_t v3 = strtol(v1, 0, 10);
    if ((unint64_t)(v3 - 1) < 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v2 = v3;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MBMaxLogCount=%ld", (uint8_t *)&v4, 0xCu);
    }
  }
  qword_100026340 = v2;
}

void sub_10000F39C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t MBIsInternalInstall()
{
  if (qword_100026358 != -1) {
    dispatch_once(&qword_100026358, &stru_100020AE8);
  }
  return byte_100026350;
}

void sub_10000F3FC(id a1)
{
  id v1 = (void *)MGCopyAnswer();
  byte_100026350 = [v1 BOOLValue];
  if (v1)
  {
    CFRelease(v1);
  }
}

void sub_1000100D4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) encodingMethod];
  if (v2 - 2 < 2)
  {
    int v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48) == 1) {
      [v4 _archive];
    }
    else {
      [v4 _unarchive];
    }
  }
  else
  {
    if (v2 == -1)
    {
      [*(id *)(a1 + 32) setEncodingMethod:1];
    }
    else if (v2 != 1)
    {
      uint64_t v3 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, @"Unknown encoding method %ld", (int)[*(id *)(a1 + 32) encodingMethod]);
      goto LABEL_13;
    }
    uint64_t v5 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48) == 1) {
      [v5 _compress];
    }
    else {
      [v5 _decompress];
    }
  uint64_t v3 = };
LABEL_13:
  id v6 = (id)v3;
  [*(id *)(a1 + 32) _finishWithError:v3];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL sub_10001076C(int a1, int *a2, void *a3)
{
  if (!a2) {
    sub_1000144B4();
  }
  *a2 = 0;
  switch(a1)
  {
    case -1:
    case 2:
      id v4 = 0;
      int v5 = 2049;
      goto LABEL_9;
    case 1:
      id v4 = 0;
      int v5 = 517;
      goto LABEL_9;
    case 3:
      id v4 = 0;
      int v5 = 774;
LABEL_9:
      *a2 = v5;
      BOOL v6 = 1;
      break;
    default:
      id v4 = +[MBError errorWithCode:1, @"Invalid file compression method %ld", a1 format];
      BOOL v6 = v4 == 0;
      if (a3 && v4)
      {
        id v4 = v4;
        BOOL v6 = 0;
        *a3 = v4;
      }
      break;
  }

  return v6;
}

uint64_t sub_100010858(unsigned int a1, char *a2, void *a3)
{
  if (!a2) {
    sub_1000144E0();
  }
  *a2 = 0;
  switch(a1)
  {
    case 0x205u:
      id v4 = 0;
      uint64_t v6 = 1;
      *a2 = 1;
      break;
    case 0x306u:
      id v4 = 0;
      char v5 = 3;
      goto LABEL_8;
    case 0x801u:
      id v4 = 0;
      char v5 = 2;
LABEL_8:
      *a2 = v5;
LABEL_9:
      uint64_t v6 = 1;
      break;
    default:
      id v4 = +[MBError errorWithCode:1, @"Invalid compression algorithm %ld", a1 format];
      if (!v4)
      {
        if (*a2 == 255 || !*a2) {
          sub_10001450C();
        }
        id v4 = 0;
        goto LABEL_9;
      }
      if (a3)
      {
        id v4 = v4;
        uint64_t v6 = 0;
        *a3 = v4;
      }
      else
      {
        uint64_t v6 = 0;
      }
      break;
  }

  return v6;
}

void sub_1000122B4(id a1)
{
  NSTemporaryDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"tmpbackupXXXXXXXX"];
  unsigned int v2 = (void *)qword_100026360;
  qword_100026360 = v1;
}

void sub_100012CEC(id a1)
{
  qword_100026370 = (uint64_t)dispatch_semaphore_create(2);
  _objc_release_x1();
}

void sub_100012D24(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.backupd.encoding", attr);
  id v3 = (void *)qword_100026380;
  qword_100026380 = (uint64_t)v2;
}

void sub_100012DAC(id a1)
{
  qword_100026390 = (uint64_t)dispatch_semaphore_create(1);
  _objc_release_x1();
}

void sub_100012DE4(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.backupd.decoding", attr);
  id v3 = (void *)qword_1000263A0;
  qword_1000263A0 = (uint64_t)v2;
}

int main(int argc, const char **argv, const char **envp)
{
  signal(13, (void (__cdecl *)(int))1);
  id v3 = +[NSXPCListener serviceListener];
  id v4 = +[MBHelperServiceDelegate sharedInstance];
  [v3 setDelegate:v4];

  [v3 resume];
  return 0;
}

void sub_10001331C(id a1)
{
  NSTemporaryDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"tmpbackupencodeXXXXXXXX"];
  dispatch_queue_t v2 = (void *)qword_1000263B0;
  qword_1000263B0 = v1;
}

void sub_100013378(uint64_t a1)
{
  unlink((const char *)[*(id *)(a1 + 32) fileSystemRepresentation]);
  close(*(_DWORD *)(a1 + 64));
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  char v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void **)(a1 + 40);
    int v7 = [v6 error];
    *(_DWORD *)statfs buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    time_t v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finished task:%@, error:%@", buf, 0x16u);

    __uint64_t v8 = *(void **)(a1 + 40);
    id v15 = [v8 error];
    _MBLog(@"INFO", (uint64_t)"Finished task:%@, error:%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  }
  [*(id *)(a1 + 48) idle];
}

void sub_100013ABC()
{
}

void sub_100013AE8()
{
}

void sub_100013B14()
{
  __assert_rtn("+[MBFileSystemManager listSnapshotsForVolume:error:]", "MBFileSystemManager.m", 505, "p <= attrBuf + sizeof(attrBuf)");
}

void sub_100013B40()
{
  __assert_rtn("+[MBFileSystemManager listSnapshotsForVolume:error:]", "MBFileSystemManager.m", 484, "namePtr[nameLength - 1] == '\\0'");
}

void sub_100013B6C()
{
}

void sub_100013B98()
{
}

void sub_100013BC4()
{
}

void sub_100013BF0()
{
}

void sub_100013C1C()
{
}

void sub_100013C48()
{
}

void sub_100013C74()
{
}

void sub_100013CA0()
{
}

void sub_100013CCC()
{
}

void sub_100013CF8()
{
}

void sub_100013D24()
{
}

void sub_100013D50()
{
}

void sub_100013D7C()
{
}

void sub_100013DA8()
{
}

void sub_100013DD4()
{
}

void sub_100013E00()
{
}

void sub_100013E2C()
{
}

void sub_100013E58()
{
}

void sub_100013E84()
{
}

void sub_100013EB0()
{
}

void sub_100013EDC()
{
}

void sub_100013F08()
{
}

void sub_100013F34()
{
}

void sub_100013F60()
{
}

void sub_100013F8C()
{
}

void sub_100013FB8()
{
  __error();
  sub_10000F384();
  sub_10000F39C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to open MobileBackup log file at %@: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10001403C()
{
  __error();
  sub_10000F384();
  sub_10000F39C((void *)&_mh_execute_header, &_os_log_default, v0, "lchmod failed at %s: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_1000140C0()
{
  __error();
  sub_10000F384();
  sub_10000F39C((void *)&_mh_execute_header, &_os_log_default, v0, "lchown failed at %s: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_100014144()
{
  __error();
  sub_10000F384();
  sub_10000F39C((void *)&_mh_execute_header, &_os_log_default, v0, "lstat failed at %s: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_1000141C8()
{
  __error();
  sub_10000F384();
  sub_10000F39C((void *)&_mh_execute_header, &_os_log_default, v0, "mkdir failed at %s: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10001424C()
{
  __assert_rtn("-[MBFileEncodingTask initWithType:encodingMethod:]", "MBFileEncodingTask.m", 54, "type != MBFileEncodingTypeUnspecified");
}

void sub_100014278()
{
  __assert_rtn("-[MBFileEncodingTask initWithType:encodingMethod:]", "MBFileEncodingTask.m", 55, "encodingMethod != MBFileEncodingMethodUnspecified");
}

void sub_1000142A4()
{
  __assert_rtn("-[MBFileEncodingTask start]", "MBFileEncodingTask.m", 108, "type == MBFileEncodingTypeEncode || type == MBFileEncodingTypeDecode");
}

void sub_1000142D0()
{
}

void sub_1000142FC()
{
}

void sub_100014328()
{
  __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 249, "self.encodingMethod != MBFileEncodingMethodUnspecified");
}

void sub_100014354()
{
  __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 250, "self.encodingMethod != MBFileEncodingMethodDefault");
}

void sub_100014380()
{
}

void sub_1000143AC()
{
}

void sub_1000143D8()
{
}

void sub_100014404()
{
}

void sub_100014430()
{
  __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 246, "dstCompressionMethod != MBFileCompressionMethodUnspecified");
}

void sub_10001445C()
{
  __assert_rtn("-[MBFileEncodingTask _compress]", "MBFileEncodingTask.m", 247, "dstCompressionMethod != MBFileCompressionMethodDefault");
}

void sub_100014488()
{
}

void sub_1000144B4()
{
}

void sub_1000144E0()
{
}

void sub_10001450C()
{
  __assert_rtn("makeFileCompressionMethodFromCompressionAlgorithm", "MBFileEncodingTask.m", 227, "*compressionMethod != MBFileCompressionMethodUnspecified && *compressionMethod != MBFileCompressionMethodDefault");
}

void sub_100014538()
{
}

void sub_100014564()
{
}

void sub_100014590()
{
  __assert_rtn("-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]", "MBFileEncodingTask.m", 318, "operation == COMPRESSION_STREAM_ENCODE || operation == COMPRESSION_STREAM_DECODE");
}

void sub_1000145BC()
{
}

void sub_1000145E8()
{
}

void sub_100014614()
{
}

void sub_100014640()
{
  __assert_rtn("-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]", "MBFileEncodingTask.m", 325, "pc != MBProtectionClassUnspecified");
}

void sub_10001466C()
{
}

void sub_100014698()
{
  __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 461, "stream.src_ptr == MAP_FAILED || (stream.src_ptr - srcBuffer) <= srcBufferSize");
}

void sub_1000146C4()
{
  __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 505, "stream.dst_ptr - dstBuffer <= dstBufferSize");
}

void sub_1000146F0()
{
  __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 506, "stream.dst_size <= dstBufferSize");
}

void sub_10001471C()
{
}

void sub_100014748()
{
}

void sub_100014774()
{
}

void sub_1000147A0()
{
}

void sub_1000147CC()
{
  __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 620, "self.encodingMethod == MBFileEncodingMethodCompressedSQLiteText || self.encodingMethod == MBFileEncodingMethodCompressedSQLiteBinary");
}

void sub_1000147F8()
{
  __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 618, "dstCompressionMethod != MBFileCompressionMethodUnspecified");
}

void sub_100014824()
{
  __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 619, "dstCompressionMethod != MBFileCompressionMethodDefault");
}

void sub_100014850()
{
}

void sub_10001487C()
{
  __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 594, "!pa || count == 1");
}

void sub_1000148A8()
{
}

void sub_1000148D4()
{
}

void sub_100014900()
{
  __assert_rtn("-[MBFileEncodingTask _unarchive]", "MBFileEncodingTask.m", 747, "!pa || count >= 1");
}

void sub_10001492C()
{
}

void sub_100014958()
{
  __assert_rtn("-[MBHelperService runEncodingTask:reply:]", "MBHelperService.m", 27, "task.compressionMethod != MBFileEncodingMethodUnspecified");
}

void sub_100014984()
{
  __assert_rtn("-[MBHelperService runEncodingTask:reply:]", "MBHelperService.m", 53, "dstFd == -1");
}

uint64_t CCHmacOneShot()
{
  return _CCHmacOneShot();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

uint64_t _sqlite3_apple_archive()
{
  return __sqlite3_apple_archive();
}

uint64_t _sqlite3_apple_unarchive()
{
  return __sqlite3_apple_unarchive();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return _fdopendir(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fgetattrlist(a1, a2, a3, a4, a5);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_create(a1, a2, a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_delete(a1, a2, a3);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  return _fs_snapshot_list(a1, a2, a3, a4, a5);
}

int fs_snapshot_mount(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return _fs_snapshot_mount(a1, a2, a3, a4);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return _fs_snapshot_rename(a1, a2, a3, a4);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return _fstatfs(a1, a2);
}

off_t ftello(FILE *__stream)
{
  return _ftello(__stream);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return _getfsstat(a1, a2, a3);
}

int getpagesize(void)
{
  return _getpagesize();
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return _madvise(a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

char *__cdecl mktemp(char *a1)
{
  return _mktemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
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

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

uint64_t openbyid_np()
{
  return _openbyid_np();
}

uint64_t os_log_copy_message_string()
{
  return _os_log_copy_message_string();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

uint64_t os_log_set_hook()
{
  return _os_log_set_hook();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_log_type_get_name()
{
  return _os_log_type_get_name();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return _pthread_threadid_np(a1, a2);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_check()
{
  return _sandbox_check();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

void sqlite3_free(void *a1)
{
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__archive(void *a1, const char *a2, ...)
{
  return [a1 _archive];
}

id objc_msgSend__compress(void *a1, const char *a2, ...)
{
  return [a1 _compress];
}

id objc_msgSend__decompress(void *a1, const char *a2, ...)
{
  return [a1 _decompress];
}

id objc_msgSend__unarchive(void *a1, const char *a2, ...)
{
  return [a1 _unarchive];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compressionMethod(void *a1, const char *a2, ...)
{
  return [a1 compressionMethod];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destinationDigest(void *a1, const char *a2, ...)
{
  return [a1 destinationDigest];
}

id objc_msgSend_destinationPath(void *a1, const char *a2, ...)
{
  return [a1 destinationPath];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_encodingMethod(void *a1, const char *a2, ...)
{
  return [a1 encodingMethod];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return [a1 errorCode];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_final(void *a1, const char *a2, ...)
{
  return [a1 final];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return [a1 group];
}

id objc_msgSend_idle(void *a1, const char *a2, ...)
{
  return [a1 idle];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_protectionClass(void *a1, const char *a2, ...)
{
  return [a1 protectionClass];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sha1(void *a1, const char *a2, ...)
{
  return [a1 sha1];
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return [a1 sha256];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sourceDigest(void *a1, const char *a2, ...)
{
  return [a1 sourceDigest];
}

id objc_msgSend_sourceIsLive(void *a1, const char *a2, ...)
{
  return [a1 sourceIsLive];
}

id objc_msgSend_sourcePath(void *a1, const char *a2, ...)
{
  return [a1 sourcePath];
}

id objc_msgSend_spaceSavingsThreshold(void *a1, const char *a2, ...)
{
  return [a1 spaceSavingsThreshold];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return [a1 validate];
}

id objc_msgSend_volumeMountPoint(void *a1, const char *a2, ...)
{
  return [a1 volumeMountPoint];
}

id objc_msgSend_volumeMountPointForFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeMountPointForFile:error:");
}