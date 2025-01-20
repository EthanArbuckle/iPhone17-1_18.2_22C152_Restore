BOOL isInternalBuild()
{
  if (qword_1000146D0 != -1) {
    dispatch_once(&qword_1000146D0, &stru_1000106B8);
  }
  return byte_1000146C8 != 0;
}

void sub_100003394(id a1)
{
  byte_1000146C8 = CRIsAppleInternal();
}

id isTaskingEnabled(uint64_t a1)
{
  v2 = (void *)OSAGetDATaskingValue();
  if (!v2 || (id result = [v2 intValue], result != 1))
  {
    NSLog(@"NANDStats: %@ status not available", a1);
    return 0;
  }
  return result;
}

uint64_t isSeedBuild()
{
  return 0;
}

BOOL CRUOpenSQLDB()
{
  errmsg = 0;
  if (CRUdb)
  {
    int v0 = 0;
    return v0 == 0;
  }
  int v0 = sqlite3_open("/var/mobile/Library/Caches/NANDUsage.db", (sqlite3 **)&CRUdb);
  pStmt = 0;
  int v1 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "PRAGMA user_version;", -1, &pStmt, 0);
  if (v1 == 100) {
    goto LABEL_6;
  }
  if (v1) {
    goto LABEL_16;
  }
  if (sqlite3_step(pStmt) == 100)
  {
LABEL_6:
    int v2 = sqlite3_column_int(pStmt, 0);
    sqlite3_finalize(pStmt);
    pStmt = 0;
    if (v2 == 1) {
      goto LABEL_16;
    }
    int v3 = sqlite3_exec((sqlite3 *)CRUdb, "DROP TABLE NANDStats;", 0, 0, &errmsg);
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v4) {
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      v5 = "NANDStats: Failed to drop table";
    }
    else
    {
      if (!v4) {
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      v5 = "NANDStats: Dropping table due to schema mismatch";
    }
    uint32_t v6 = 2;
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 67109378;
    int v15 = v0;
    __int16 v16 = 2080;
    v17 = errmsg;
    v5 = "NANDStats: Failed to check user_version for CRUdb - %d %s\n";
    uint32_t v6 = 18;
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
LABEL_16:
  if (v0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 67109120;
    int v15 = v0;
    v7 = "NANDStats: Failed to open CRUdb with error number %d\n";
    uint32_t v8 = 8;
    goto LABEL_25;
  }
  int v9 = sqlite3_exec((sqlite3 *)CRUdb, "PRAGMA journal_mode = WAL", 0, 0, &errmsg);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v15 = v10;
      __int16 v16 = 2080;
      v17 = errmsg;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: Failed to enable WAL for CRUdb - %d %s\n", buf, 0x12u);
    }
  }
  int v0 = sqlite3_exec((sqlite3 *)CRUdb, "PRAGMA user_version = 1;", 0, 0, &errmsg);
  if (v0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 67109378;
    int v15 = v0;
    __int16 v16 = 2080;
    v17 = errmsg;
    v7 = "NANDStats: Failed to set user_version for CRUdb - %d %s\n";
    uint32_t v8 = 18;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
LABEL_26:
    if (CRUdb)
    {
      sqlite3_close((sqlite3 *)CRUdb);
      CRUdb = 0;
    }
  }
  return v0 == 0;
}

uint64_t CRUCloseSQLDB()
{
  uint64_t result = CRUdb;
  if (CRUdb)
  {
    uint64_t result = sqlite3_close((sqlite3 *)CRUdb);
    CRUdb = 0;
  }
  return result;
}

BOOL CRUCreateTable()
{
  return sqlite3_exec((sqlite3 *)CRUdb, "CREATE TABLE IF NOT EXISTS NANDStats( bundleID TEXT NOT NULL,  presentDialog INTEGER,  dialogTimestamp INTEGER DEFAULT 0,  dialogInterval INTEGER DEFAULT 1,  logicalWrites INTEGER DEFAULT 0,  PRIMARY KEY (bundleID))", 0, 0, 0) == 0;
}

CFUserNotificationRef displayNotification(uint64_t a1, uint64_t a2, CFTimeInterval a3)
{
  SInt32 error = 0;
  return CFUserNotificationCreate(kCFAllocatorDefault, a3, 0, &error, (CFDictionaryRef)[objc_alloc((Class)NSMutableDictionary) initWithObjectsAndKeys:a1, kCFUserNotificationAlertHeaderKey, @"Dismiss", kCFUserNotificationDefaultButtonTitleKey, @"Learn more", kCFUserNotificationAlternateButtonTitleKey, a2, kCFUserNotificationAlertMessageKey, 0]);
}

void InstallIOCSNotificationHandler()
{
  mach_port_name_t name = 0;
  if (qword_1000146D8) {
    return;
  }
  int v0 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "IOCS: Installing IOCS notification handler", buf, 2u);
  }
  qword_1000146D8 = (uint64_t)malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
  if (mach_port_allocate(mach_task_self_, 1u, &name))
  {
    sub_10000B49C();
  }
  else if (mach_port_insert_right(mach_task_self_, name, name, 0x14u))
  {
    sub_10000B410();
  }
  else
  {
    mach_port_t v1 = mach_host_self();
    if (host_set_special_port(v1, 32, name))
    {
      sub_10000B384();
    }
    else
    {
      if (!mach_port_set_context(mach_task_self_, name, qword_1000146D8))
      {
        int v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
        int v3 = dispatch_queue_create("com.apple.fs_task_scheduler", v2);
        *(void *)qword_1000146D8 = v3;
        BOOL v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, name, 0, v3);
        *(void *)(qword_1000146D8 + 8) = v4;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100003A80;
        handler[3] = &unk_1000106D8;
        mach_port_name_t v7 = name;
        dispatch_source_set_event_handler(v4, handler);
        v5 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IOCS: Successfully installed mach_port", buf, 2u);
        }
        dispatch_resume(*(dispatch_object_t *)(qword_1000146D8 + 8));
        return;
      }
      sub_10000B2F8();
    }
  }
  if (name) {
    mach_port_deallocate(mach_task_self_, name);
  }
}

void sub_100003A80(uint64_t a1)
{
  if (mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))iocompressionstats_notification_server, 0x1000u, *(_DWORD *)(a1 + 32), 0))
  {
    sub_10000B2F8();
  }
}

void fetch_and_process_iocs_store_buffer(int a1, int a2)
{
  size_t size = 0;
  int v10 = a1;
  if (sysctlbyname("vfs.io_compression_dump_stats", 0, &size, &v10, 4uLL))
  {
    int v3 = oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    BOOL v4 = "IOCS: Failed to get buffer length\n";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    return;
  }
  if (size >= 0x6400001)
  {
    int v3 = oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    BOOL v4 = "IOCS: Buffer length needed longer than supported \n";
    goto LABEL_13;
  }
  v5 = malloc_type_calloc(1uLL, size, 0xA236C864uLL);
  if (!v5)
  {
    int v3 = oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    BOOL v4 = "IOCS: Failed to allocate buffer for reading iocs_store_buffer_entry\n";
    goto LABEL_13;
  }
  uint32_t v6 = v5;
  int v7 = sysctlbyname("vfs.io_compression_dump_stats", v5, &size, &v10, 4uLL);
  uint32_t v8 = oslog;
  BOOL v9 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IOCS: Failed to get iocs_store_buffer_entry from XNU", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      int v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IOCS: Sucessfully read iocs_store_buffer. Action = %d", buf, 8u);
    }
    ProcessIOCSStoreBuffer((uint64_t)v6, size, a2);
  }
  free(v6);
}

uint64_t iocompressionstats_notification()
{
  int v0 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "IOCS: received kernel notification", v2, 2u);
  }
  fetch_and_process_iocs_store_buffer(4, 1);
  return 0;
}

void sub_100003D70(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100003D90()
{
  return __os_assumes_log(v0);
}

BOOL sub_100003DB4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void GetWriteSourceFromFilePath(const char *a1, char *a2)
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v3 = (void *)ContainerToBundleIDMap;
  id v4 = [(id)ContainerToBundleIDMap countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        uint32_t v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v10 = [(id)ContainerToBundleIDMap objectForKey:v8];
        if (!strncmp((const char *)[v8 UTF8String], a1, (size_t)objc_msgSend(v8, "length"))
          || strlen(a1) >= 9
          && !strncmp((const char *)[v8 UTF8String], a1 + 8, (size_t)objc_msgSend(v8, "length")))
        {
          strncpy(a2, (const char *)[v10 UTF8String], 0x3FFuLL);
          return;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }
  v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"/private/var/mobile/Library/Caches/", @"/private/var/root/Library/Caches/", @"/private/var/mobile/Library/Preferences/", @"/private/var/root/Library/Preferences/", @"/private/var/mobile/Library/HTTPStorages/", @"/private/var/root/Library/HTTPStorages/", @"/private/var/mobile/Library/Logs/", @"/private/var/root/Library/Logs/", @"/private/var/mobile/Library/Saved Application State/", @"/private/var/root/Library/Saved Application State/", @"/private/var/mobile/Library/Cookies/", @"/private/var/root/Library/Cookies/", @"/private/var/mobile/Library/Application Support/", @"/private/var/root/Library/Application Support/", @"/private/var/mobile/Library/", @"/private/var/root/Library/", @"/private/var/mobile/",
          @"/private/var/root/",
          @"/private/var/db/",
          @"/private/var/log/",
          @"/private/var/logs/",
          @"/private/var/tmp/",
          @"/private/var/preferences/",
          @"/private/var/",
          @"/dev/",
          0);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v12) {
    goto LABEL_23;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v27;
  while (2)
  {
    for (j = 0; j != v13; j = (char *)j + 1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v11);
      }
      __int16 v16 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
      v17 = (const char *)[v16 UTF8String];
      int v18 = [v16 length];
      if (v18 >= 1023) {
        int v19 = 1023;
      }
      else {
        int v19 = v18;
      }
      if (!strncmp(v17, a1, v19))
      {
        v20 = [+[NSString stringWithUTF8String:a1] componentsSeparatedByString:@"/"];
        id v21 = [[objc_msgSend(v16, "componentsSeparatedByString:", @"/") count];
        if ([(NSArray *)v20 count] >= (int)v21)
        {
          id v22 = [(NSArray *)v20 objectAtIndex:(((void)v21 << 32) - 0x100000000) >> 32];
          if (([v16 hasSuffix:@"Preferences/"] & 1) != 0
            || [v16 hasSuffix:@"preferences/"])
          {
            v23 = @".plist";
          }
          else
          {
            if (![v16 hasSuffix:@"Saved Application State/"])
            {
              if (![v16 hasSuffix:@"Cookies/"])
              {
                v24 = a2;
                goto LABEL_30;
              }
              v23 = @".binaryCookies";
              v24 = a2;
              if (![v22 hasSuffix:@".binaryCookies"]) {
                goto LABEL_30;
              }
              goto LABEL_29;
            }
            v23 = @".savedState";
          }
          v24 = a2;
          if (([v22 hasSuffix:v23] & 1) == 0)
          {
LABEL_30:
            strncpy(v24, (const char *)[v22 UTF8String], 0x3FFuLL);
            return;
          }
LABEL_29:
          id v22 = [v22 substringToIndex:[v22 length] - [v23 length]];
          goto LABEL_30;
        }
      }
    }
    id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_23:
  bzero(a2, 0x3FFuLL);
}

int64_t GetFileExtensionFromFilePath(const char *a1, const char **a2)
{
  int64_t result = strnlen(a1, 0x400uLL);
  if (result < 2) {
    goto LABEL_11;
  }
  uint64_t v5 = result >= 20 ? 20 : result;
  int64_t v6 = result - 1;
  while (a1[v6] != 46)
  {
    --v6;
    if (!--v5) {
      goto LABEL_11;
    }
  }
  if (v6 == -1) {
LABEL_11:
  }
    int v7 = (const char *)&unk_10000D177;
  else {
    int v7 = &a1[v6];
  }
  *a2 = v7;
  return result;
}

BOOL IOCSOpenSQLDB()
{
  if (qword_1000146E0)
  {
    int v0 = 0;
LABEL_12:
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_10000B528();
    }
    return v0 == 0;
  }
  uint64_t v1 = +[NSFileManager defaultManager];
  uint64_t v8 = 0;
  if ([(NSFileManager *)v1 fileExistsAtPath:@"/var/db/IOCS/IOCSMonitoring.db"]) {
    goto LABEL_7;
  }
  int v2 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "IOCS: DB file does not exist, creating the file", (uint8_t *)&v7, 2u);
  }
  if ([(NSFileManager *)v1 createDirectoryAtPath:@"/var/db/IOCS" withIntermediateDirectories:0 attributes:0 error:&v8])
  {
LABEL_7:
    int v3 = sqlite3_open("/var/db/IOCS/IOCSMonitoring.db", (sqlite3 **)&qword_1000146E0);
    if (v3)
    {
      int v0 = v3;
      sqlite3_close((sqlite3 *)qword_1000146E0);
      qword_1000146E0 = 0;
    }
    else
    {
      int v7 = 0;
      int v0 = sqlite3_exec((sqlite3 *)qword_1000146E0, "PRAGMA journal_mode = WAL", 0, 0, &v7);
      if (v0)
      {
        id v4 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
          sub_10000B55C((uint64_t *)&v7, v0, v4);
        }
      }
    }
    goto LABEL_12;
  }
  int64_t v6 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IOCS: Failed to create DIR", (uint8_t *)&v7, 2u);
  }
  return 0;
}

BOOL IOCSDeleteAllRowsSQLDB()
{
  if (qword_1000146E0)
  {
    if (sqlite3_open("/var/db/IOCS/IOCSMonitoring.db", (sqlite3 **)&qword_1000146E0))
    {
      sqlite3_close((sqlite3 *)qword_1000146E0);
      BOOL result = 0;
      qword_1000146E0 = 0;
    }
    else
    {
      errmsg = 0;
      return sqlite3_exec((sqlite3 *)qword_1000146E0, "DELETE FROM IOCSTable", 0, 0, &errmsg) == 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_10000B5E8();
    }
    return 1;
  }
  return result;
}

uint64_t IOCSCloseSQLDB()
{
  uint64_t result = qword_1000146E0;
  if (qword_1000146E0)
  {
    uint64_t result = sqlite3_close((sqlite3 *)qword_1000146E0);
    qword_1000146E0 = 0;
  }
  return result;
}

BOOL IOCSCreateTable()
{
  return sqlite3_exec((sqlite3 *)qword_1000146E0, "CREATE TABLE IF NOT EXISTS IOCSTable( writeSource TEXT,  fileExtension INTEGER,  uncompressedBytes INTEGER,  compressedBytes INTEGER,  bufferSizeCompressionDist BLOB,  blockCompressedSizeDist BLOB,  PRIMARY KEY(writeSource, fileExtension))", 0, 0, 0) == 0;
}

size_t printLine(int a1)
{
  if (a1 >= 1)
  {
    int v1 = a1;
    do
    {
      fputs("-------------", __stdoutp);
      --v1;
    }
    while (v1);
  }
  int v2 = __stdoutp;

  return fwrite("-\n", 2uLL, 1uLL, v2);
}

size_t PrintIOCSStoreBufferEntry(uint64_t a1)
{
  bzero(v12, 0x400uLL);
  v11 = 0;
  GetWriteSourceFromFilePath((const char *)a1, v12);
  GetFileExtensionFromFilePath((const char *)a1, &v11);
  size_t result = printf("IOCS: File Path: %s\nProcess Information: %s\nExtension: %s\n", (const char *)a1, v12, v11);
  if (*(void *)(a1 + 128))
  {
    fprintf(__stdoutp, "TotalUncompressedBytes = %lld\n", *(void *)(a1 + 128));
    fprintf(__stdoutp, "TotalCompressedBytes = %lld\n", *(void *)(a1 + 136));
    fwrite("Block Level compressed buffer size histogram\n", 0x2DuLL, 1uLL, __stdoutp);
    printLine(16);
    for (int i = 0; i != 4096; i += 256)
    {
      if (!i) {
        fputc(124, __stdoutp);
      }
      fprintf(__stdoutp, "  %4d-%4d |", i, i + 255);
    }
    fputc(10, __stdoutp);
    printLine(16);
    for (uint64_t j = 0; j != 64; j += 4)
    {
      int v5 = *(_DWORD *)(a1 + 424 + j);
      if (!j) {
        fputc(124, __stdoutp);
      }
      fprintf(__stdoutp, "%9d   |", v5);
    }
    fputc(10, __stdoutp);
    printLine(16);
    fwrite("Buffer size (Rows) vs compressibility (Columns) histogram \n", 0x3BuLL, 1uLL, __stdoutp);
    printLine(8);
    fprintf(__stdoutp, "|%12s", (const char *)&unk_10000D177);
    for (uint64_t k = 0; k != 28; k += 4)
    {
      if (!k) {
        fputc(124, __stdoutp);
      }
      fprintf(__stdoutp, "   %02d - %02d%% |", *(_DWORD *)((char *)&unk_10000CBA0 + k), *(_DWORD *)((char *)&unk_10000CBA0 + k + 4) - 1);
    }
    fputc(10, __stdoutp);
    printLine(8);
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 144;
    do
    {
      fprintf(__stdoutp, "|%12s", (&off_100010738)[v7]);
      for (uint64_t m = 0; m != 28; m += 4)
      {
        int v10 = *(_DWORD *)(v8 + m);
        if (!m) {
          fputc(124, __stdoutp);
        }
        fprintf(__stdoutp, "%9d   |", v10);
      }
      fputc(10, __stdoutp);
      ++v7;
      v8 += 28;
    }
    while (v7 != 10);
    printLine(8);
    return fwrite("\n\n", 2uLL, 1uLL, __stdoutp);
  }
  return result;
}

void ProcessIOCSStoreBuffer(uint64_t a1, uint64_t a2, int a3)
{
  if (IOCSOpenSQLDB())
  {
    if (sqlite3_exec((sqlite3 *)qword_1000146E0, "CREATE TABLE IF NOT EXISTS IOCSTable( writeSource TEXT,  fileExtension INTEGER,  uncompressedBytes INTEGER,  compressedBytes INTEGER,  bufferSizeCompressionDist BLOB,  blockCompressedSizeDist BLOB,  PRIMARY KEY(writeSource, fileExtension))", 0, 0, 0))
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_10000B69C();
      }
    }
    else
    {
      if (ContainerToBundleIDMap) {
        [(id)ContainerToBundleIDMap removeAllObjects];
      }
      else {
        ContainerToBundleIDMap = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
      }
      [+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace") enumerateBundlesOfType:0 block:&stru_1000107A8];
      if (a2 >= 1)
      {
        uint64_t v5 = 0;
        int v32 = a3;
        uint64_t v31 = a2;
        do
        {
          uint64_t v7 = a1 + v5;
          if (a3 == 1)
          {
            v34 = v6;
            bzero(__s, 0x400uLL);
            v38 = 0;
            GetWriteSourceFromFilePath((const char *)v7, __s);
            GetFileExtensionFromFilePath((const char *)v7, &v38);
            BOOL v9 = v38;
            ppStmt = 0;
            int v10 = sqlite3_prepare_v2((sqlite3 *)qword_1000146E0, "SELECT uncompressedBytes,compressedBytes,bufferSizeCompressionDist,blockCompressedSizeDist FROM IOCSTable WHERE writeSource = ? AND fileExtension = ?", -1, &ppStmt, 0);
            if (v10)
            {
              int v11 = v10;
              id v12 = oslog;
              if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
              {
                long long v30 = sqlite3_errmsg((sqlite3 *)qword_1000146E0);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = v11;
                *(_WORD *)&buf[8] = 2080;
                *(void *)&buf[10] = v30;
                _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "IOCS: SQL table Insert failure: %d %s\n", buf, 0x12u);
              }
              sqlite3_finalize(ppStmt);
              a3 = v32;
              a2 = v31;
            }
            else
            {
              int v13 = strlen(__s);
              sqlite3_bind_text(ppStmt, 1, __s, v13, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              int v14 = strlen(v9);
              v35 = v9;
              sqlite3_bind_text(ppStmt, 2, v9, v14, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              if (sqlite3_step(ppStmt) != 100) {
                goto LABEL_42;
              }
              int v37 = 0;
              do
              {
                if (v37 >= 1)
                {
                  int v15 = oslog;
                  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&uint8_t buf[4] = __s;
                    *(_WORD *)&uint8_t buf[12] = 2080;
                    *(void *)&buf[14] = v35;
                    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "IOCS: IOCSdb: We should only ever have one row %s %s", buf, 0x16u);
                  }
                }
                uint64_t v63 = 0;
                memset(v62, 0, sizeof(v62));
                long long v60 = 0u;
                long long v61 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                memset(buf, 0, sizeof(buf));
                sqlite3_int64 v16 = sqlite3_column_int64(ppStmt, 0);
                sqlite3_int64 v17 = sqlite3_column_int64(ppStmt, 1);
                int v18 = sqlite3_column_bytes(ppStmt, 2);
                int v19 = (char *)sqlite3_column_blob(ppStmt, 2);
                int v20 = sqlite3_column_bytes(ppStmt, 3);
                id v21 = (char *)sqlite3_column_blob(ppStmt, 3);
                sqlite3_int64 v22 = *(void *)(v7 + 128) + v16;
                *(void *)&buf[8] = *(void *)(v7 + 136) + v17;
                *(void *)buf = v22;
                if (v19 && v18 == 280)
                {
                  if (v21 && v20 == 64)
                  {
                    uint64_t v23 = 0;
                    uint64_t v24 = a1 + 144 + v5;
                    v25 = &buf[16];
                    do
                    {
                      for (uint64_t i = 0; i != 28; i += 4)
                        *(_DWORD *)&v25[i] = *(_DWORD *)&v19[i] + *(_DWORD *)(v24 + i);
                      ++v23;
                      v25 += 28;
                      v19 += 28;
                      v24 += 28;
                    }
                    while (v23 != 10);
                    for (uint64_t j = 0; j != 64; j += 4)
                      *(_DWORD *)((char *)v62 + j + 8) = *(_DWORD *)&v21[j] + *(_DWORD *)(a1 + 424 + v5 + j);
                    ++v37;
                    sub_1000057E8((sqlite3_int64 *)buf, __s, v35);
                  }
                  else
                  {
                    long long v29 = oslog;
                    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
                      sub_10000B65C(&v39, v40, v29);
                    }
                  }
                }
                else
                {
                  long long v28 = oslog;
                  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
                    sub_10000B61C(&v41, v42, v28);
                  }
                }
              }
              while (sqlite3_step(ppStmt) == 100);
              a3 = v32;
              a2 = v31;
              if (!v37) {
LABEL_42:
              }
                sub_1000057E8((sqlite3_int64 *)(v7 + 128), __s, v35);
            }
            int64_t v6 = v34;
          }
          else if (!a3)
          {
            uint64_t v8 = v6;
            PrintIOCSStoreBufferEntry(a1 + v5);
            int64_t v6 = v8;
          }
          uint64_t v5 = (int)v5 + 488;
        }
        while (v5 < a2);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_10000B6D0();
  }
}

void IOCSPeriodicSyncToCA(_xpc_activity_s *a1)
{
  fetch_and_process_iocs_store_buffer(4, 1);
  if (a1)
  {
    if (xpc_activity_should_defer(a1))
    {
      BOOL v2 = xpc_activity_set_state(a1, 3);
      int v3 = oslog;
      BOOL v4 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (!v4) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: deferring XPC activity";
      }
      else
      {
        if (!v4) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: unable to defer XPC activity, abandon";
      }
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v25, 2u);
      return;
    }
    fetch_and_process_iocs_store_buffer(1, 1);
    if (xpc_activity_should_defer(a1))
    {
      BOOL v6 = xpc_activity_set_state(a1, 3);
      int v3 = oslog;
      BOOL v7 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (!v7) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: deferring XPC activity";
      }
      else
      {
        if (!v7) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: unable to defer XPC activity, abandon";
      }
      goto LABEL_33;
    }
  }
  else
  {
    fetch_and_process_iocs_store_buffer(1, 1);
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)qword_1000146E0, "SELECT writeSource, fileExtension, uncompressedBytes, compressedBytes,bufferSizeCompressionDist, blockCompressedSizeDist FROM IOCSTable", -1, &ppStmt, 0))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_10000B738();
    }
    sqlite3_finalize(ppStmt);
  }
  else
  {
    uint64_t v8 = (char *)malloc_type_malloc(0xBuLL, 0xBB9810D1uLL);
    BOOL v9 = oslog;
    if (v8)
    {
      int v10 = v8;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending IOCS Data to CA, SELECT query succeeded", (uint8_t *)v25, 2u);
      }
      unsigned int v11 = 0;
      while (sqlite3_step(ppStmt) == 100)
      {
        id v12 = sqlite3_column_text(ppStmt, 0);
        int v13 = sqlite3_column_text(ppStmt, 1);
        unint64_t v14 = sqlite3_column_int64(ppStmt, 2);
        sqlite3_int64 v15 = sqlite3_column_int64(ppStmt, 3);
        sqlite3_int64 v16 = sqlite3_column_blob(ppStmt, 4);
        sqlite3_int64 v17 = (char *)sqlite3_column_blob(ppStmt, 5);
        if (v14 >= 0xA000)
        {
          int v18 = v17;
          uint64_t v19 = 0;
          int32x4_t v20 = 0uLL;
          do
          {
            int32x4_t v20 = vaddq_s32(*(int32x4_t *)&v17[v19], v20);
            v19 += 16;
          }
          while (v19 != 64);
          if (vaddvq_s32(v20) >= 10)
          {
            strncpy(v10, (const char *)v13, 0xAuLL);
            v10[10] = 0;
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_100005958;
            v25[3] = &unk_100010808;
            v25[4] = v15;
            v25[5] = v14;
            v25[6] = v10;
            v25[7] = v12;
            v25[8] = v18;
            v25[9] = v16;
            analytics_send_event_lazy();
            ++v11;
            if (a1 && !(v11 % 0xC8) && xpc_activity_should_defer(a1))
            {
              BOOL v21 = xpc_activity_set_state(a1, 3);
              sqlite3_int64 v22 = oslog;
              BOOL v23 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
              if (v21)
              {
                if (!v23) {
                  break;
                }
                *(_DWORD *)buf = 67109120;
                unsigned int v28 = v11;
                uint64_t v24 = "IOCS: deferring XPC activity after processing %d rows";
              }
              else
              {
                if (!v23) {
                  break;
                }
                *(_DWORD *)buf = 67109120;
                unsigned int v28 = v11;
                uint64_t v24 = "IOCS: unable to defer XPC activity, abandon after %d rows";
              }
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 8u);
              break;
            }
            if (v11 == 10001) {
              break;
            }
          }
        }
      }
      free(v10);
    }
    else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10000B704();
    }
  }
  IOCSDeleteAllRowsSQLDB();
}

uint64_t IOCSFeatureEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t EnableIOCSCollection()
{
  int v6 = 0;
  size_t v5 = 4;
  int v4 = 1;
  uint64_t v0 = 0xFFFFFFFFLL;
  if (!sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, &v4, 4uLL))
  {
    int v1 = sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, 0, 0);
    if (v6) {
      BOOL v2 = v1 == 0;
    }
    else {
      BOOL v2 = 0;
    }
    if (v2) {
      return 1;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return v0;
}

uint64_t DisableIOCSCollection()
{
  int v6 = 0;
  size_t v5 = 4;
  int v4 = 0;
  uint64_t v0 = 0xFFFFFFFFLL;
  if (!sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, &v4, 4uLL))
  {
    int v1 = sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, 0, 0);
    if (v6 != 1 && v1 == 0) {
      return 1;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return v0;
}

uint64_t GetIOCSCollectionStatus()
{
  unsigned int v2 = 0;
  size_t v1 = 4;
  if (sysctlbyname("vfs.io_compression_stats_enable", &v2, &v1, 0, 0)
    && os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_10000B7BC();
  }
  return v2;
}

id IOCSTaskingEnabled()
{
  uint64_t v0 = (void *)OSAGetDATaskingValue();
  if (!v0 || (id result = [v0 intValue], result != 1))
  {
    id result = (id)os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10000B7F0();
      return 0;
    }
  }
  return result;
}

void ScheduleIOCSTask()
{
}

void sub_100005560(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (IOCSTaskingEnabled())
    {
      int v3 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IOCS: Tasking enabled", buf, 2u);
      }
      if (GetIOCSCollectionStatus() == 1)
      {
        int v4 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IOCS: data collection has been running. Syncing data to CA", v10, 2u);
        }
        InstallIOCSNotificationHandler();
        IOCSPeriodicSyncToCA(a2);
      }
      else
      {
        int v6 = EnableIOCSCollection();
        BOOL v7 = oslog;
        if (v6 == 1)
        {
          if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v9 = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IOCS: data collection has not been running. Installing IOCS notification handler", v9, 2u);
          }
          InstallIOCSNotificationHandler();
        }
        else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        {
          sub_10000B824();
        }
      }
    }
    else if (GetIOCSCollectionStatus() == 1)
    {
      size_t v5 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IOCS: tasking is turned off, disabling data collection", v8, 2u);
      }
      DisableIOCSCollection();
    }
  }
}

void sub_100005708(id a1, LSBundleProxy *a2, BOOL *a3)
{
  id v5 = [(LSBundleProxy *)a2 bundleIdentifier];
  if ([(LSBundleProxy *)a2 dataContainerURL])
  {
    id v6 = [[-[LSBundleProxy dataContainerURL](a2, "dataContainerURL") path] stringByStandardizingPath];
    [(id)ContainerToBundleIDMap setObject:v5 forKey:v6];
  }
  [(-[LSBundleProxy groupContainerURLs](a2, "groupContainerURLs")) enumerateKeysAndObjectsUsingBlock:&stru_1000107E8];
}

void sub_10000579C(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = [[[a3 path] stringByStandardizingPath];
  id v6 = (void *)ContainerToBundleIDMap;

  [v6 setObject:a2 forKey:v5];
}

uint64_t sub_1000057E8(sqlite3_int64 *a1, const char *a2, const char *a3)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)qword_1000146E0, "REPLACE INTO IOCSTable (writeSource,fileExtension,uncompressedBytes,compressedBytes,bufferSizeCompressionDist,blockCompressedSizeDist)  VALUES (?,?,?,?,?,?)", -1, &ppStmt, 0))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_10000B8DC();
    }
  }
  else
  {
    int v6 = strlen(a2);
    sqlite3_bind_text(ppStmt, 1, a2, v6, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v7 = strlen(a3);
    sqlite3_bind_text(ppStmt, 2, a3, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int64(ppStmt, 3, *a1);
    sqlite3_bind_int64(ppStmt, 4, a1[1]);
    sqlite3_bind_blob(ppStmt, 5, a1 + 2, 280, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_blob(ppStmt, 6, a1 + 37, 64, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(ppStmt) != 101 && os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_10000B858();
    }
  }
  return sqlite3_finalize(ppStmt);
}

xpc_object_t sub_100005958(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "CompressedWriteSize", *(void *)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "UncompressedWriteSize", *(void *)(a1 + 40));
  xpc_dictionary_set_string(v2, "FileExtension", *(const char **)(a1 + 48));
  xpc_dictionary_set_string(v2, "WriteSource", *(const char **)(a1 + 56));
  xpc_dictionary_set_data(v2, "BlockCompressionHistogram", *(const void **)(a1 + 64), 0x40uLL);
  xpc_dictionary_set_data(v2, "BufferSizeCompressionHistogram", *(const void **)(a1 + 72), 0x118uLL);
  return v2;
}

void sub_100005A0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005A4C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int main(int argc, const char **argv, const char **envp)
{
  int is_darwinos = os_variant_is_darwinos();
  if (argc < 2 || (int v6 = getopt(argc, (char *const *)argv, "fi") << 24, v6 == -16777216))
  {
    syslog(5, "Started");
    int v7 = +[NSUserDefaults standardUserDefaults];
    v28[0] = @"NANDNotificationThresholdPerInterval";
    v29[0] = +[NSNumber numberWithDouble:10.0];
    v28[1] = @"NANDNotificationThresholdPerDay";
    v29[1] = +[NSNumber numberWithDouble:100.0];
    v28[2] = @"NANDNotificationTimeout";
    v29[2] = +[NSNumber numberWithDouble:0.0];
    [(NSUserDefaults *)v7 registerDefaults:+[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3]];
    BOOL v8 = isInternalBuild();
    unsigned int v9 = isTaskingEnabled(@"NANDUsageDialogActive");
    char v10 = !((v8 && v9 != 0) & _os_feature_enabled_impl()) | is_darwinos;
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        id v12 = "True";
        if (v9) {
          int v13 = "True";
        }
        else {
          int v13 = "False";
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&uint8_t buf[12] = 2080;
        if (!is_darwinos) {
          id v12 = "False";
        }
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2080;
        uint64_t v31 = "False";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: nand_longetivity_daemon feature not enabled. isTaskingEnabled: %s, isWeakLinked: %s, nandDaemonEnabled: %s", buf, 0x20u);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: Registering nand_longetivity_daemon", buf, 2u);
      }
      [(NSUserDefaults *)v7 doubleForKey:@"NANDNotificationThresholdPerInterval"];
      uint64_t v15 = v14;
      [(NSUserDefaults *)v7 doubleForKey:@"NANDNotificationThresholdPerDay"];
      uint64_t v17 = v16;
      [(NSUserDefaults *)v7 doubleForKey:@"NANDNotificationTimeout"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: In nand_longetivity_daemon. Registering nand stats info daemon\n", buf, 2u);
      }
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      char v27 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x2020000000;
      v25[3] = 0;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v24[3] = 0;
      if (!qword_1000146E8)
      {
        id v18 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1000062F8;
        uint64_t v31 = (const char *)&unk_1000108E0;
        int v32 = v26;
        long long v33 = v25;
        v34 = v24;
        [v18 setTransitionHandler:buf];
        qword_1000146E8 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v18];
      }
      xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_int64(v19, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_string(v19, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100006D80;
      handler[3] = &unk_100010908;
      handler[5] = v15;
      handler[6] = v17;
      void handler[4] = v26;
      xpc_activity_register("com.apple.fs_task_scheduler.nandstats", v19, handler);
      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v26, 8);
    }
    xpc_activity_register("com.apple.fs_task_scheduler", XPC_ACTIVITY_CHECK_IN, &stru_100010928);
    if ((is_darwinos & 1) == 0 && IOCSFeatureEnabled())
    {
      int32x4_t v20 = os_log_create("com.apple.FSTaskScheduler.IOCS", "main");
      oslog = (uint64_t)v20;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "IOCS feature is enabled, setting up IOCS periodic job", buf, 2u);
      }
      ScheduleIOCSTask();
    }
    CFRunLoopRun();
    NSLog(@"FSTaskScheduler :: CALLING FROM END OF RUNLOOP");
    if (qword_1000146E8)
    {
      [(id)qword_1000146E8 invalidate];
      qword_1000146E8 = 0;
    }
  }
  else
  {
    do
    {
      int v21 = v6 >> 24;
      if (v21 != 102)
      {
        if (v21 == 105)
        {
          if (IOCSFeatureEnabled())
          {
            if (GetIOCSCollectionStatus() == 1)
            {
              puts("Force syncing IOCS data to CA");
              IOCSPeriodicSyncToCA(0);
            }
            else
            {
              if (EnableIOCSCollection() == 1)
              {
                InstallIOCSNotificationHandler();
                dispatch_main();
              }
              fwrite("Failed to enabled IOCS collection\n", 0x22uLL, 1uLL, __stderrp);
            }
          }
          else
          {
            puts("IOCompressionStats disabled. Enabled the feature flag.");
          }
          exit(0);
        }
        puts("Usage: FSTaskScheduler [-ai]");
        exit(1);
      }
      int v6 = getopt(argc, (char *const *)argv, "fi") << 24;
    }
    while (v6 != -16777216);
    sub_1000060A8();
  }
  return 0;
}

void sub_10000606C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_1000060A8()
{
  uint64_t v0 = CopyFSInfo();
  CFNumberRef storage_capacity = get_storage_capacity();
  if (v0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100006134;
    v2[3] = &unk_100010870;
    v2[4] = storage_capacity;
    [(__CFDictionary *)v0 enumerateKeysAndObjectsUsingBlock:v2];
  }
}

id sub_100006134(uint64_t a1, uint64_t a2, void *a3)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a2 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = a3;
  }
  else {
    int v6 = 0;
  }
  id result = [v6 mutableCopy];
  if (a2) {
    BOOL v8 = result == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    unsigned int v9 = result;
    [result enumerateKeysAndObjectsUsingBlock:&stru_100010890];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      [v9 setValue:v10 forKey:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "capacityGB")];
    }
    return (id)AnalyticsSendEventLazy();
  }
  return result;
}

uint64_t sub_100006248(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_100006250(id a1, id a2, id a3, BOOL *a4)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a2 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a3 = 0;
  }
  if (a2) {
    BOOL v6 = a3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    CFStringRef v7 = buildAggDKey(a2);
    id v8 = [a3 longLongValue];
    _ADClientSetValueForScalarKey(v7, v8);
  }
}

void sub_1000062F8(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    return;
  }
  uint64_t v4 = a1;
  if (!CRUOpenSQLDB())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: Unable to open SQL database\n", buf, 2u);
    }
    return;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v5 = [a3 elements];
  id v6 = [v5 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (!v6) {
    return;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v67;
  uint64_t v9 = SBSDisplayLayoutElementHomeScreenIdentifier;
  uint64_t v54 = SBSDisplayLayoutElementHomeScreenIdentifier;
  uint64_t v55 = *(void *)v67;
  id v51 = v5;
  uint64_t v52 = v4;
  while (2)
  {
    for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v67 != v8) {
        objc_enumerationMutation(v5);
      }
      BOOL v11 = *(void **)(*((void *)&v66 + 1) + 8 * i);
      if (objc_msgSend(objc_msgSend(v11, "identifier"), "isEqualToString:", v9))
      {
        if (!*(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24)) {
          continue;
        }
        long long v56 = i;
        pStmt = 0;
        id v12 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24)) allowPlaceholder:0 error:&pStmt];
        if (!v12)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          uint64_t v41 = *(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24);
          *(_DWORD *)buf = 136315394;
          *(void *)v72 = v41;
          *(_WORD *)&v72[8] = 2112;
          *(void *)&v72[10] = pStmt;
          v42 = "NANDStats - Exception ::::: Attempt to retrieve application record for bundle identifier %s failed with error: %@\n";
          uint32_t v43 = 22;
LABEL_59:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v42, buf, v43);
          continue;
        }
        id v13 = [[[v12 localizedName] UTF8String];
        BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        id v57 = v13;
        if (!v13)
        {
          if (!v14) {
            continue;
          }
          *(_WORD *)buf = 0;
          v42 = "NANDStats - Exception ::::: Unable to derive appName from localizedName\n";
          uint32_t v43 = 2;
          goto LABEL_59;
        }
        if (v14)
        {
          uint64_t v15 = *(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24);
          *(_DWORD *)buf = 136315394;
          *(void *)v72 = v15;
          *(_WORD *)&v72[8] = 2080;
          *(void *)&v72[10] = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: localizedName for bundleID: %s is %s\n", buf, 0x16u);
        }
        uint64_t v16 = [+[NSFileManager defaultManager] URLForDirectory:5 inDomain:8 appropriateForURL:0 create:0 error:0];
        if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: Failed to find path to System-domain Library directory", buf, 2u);
        }
        uint64_t v17 = +[NSURL fileURLWithPath:@"Extensions/IONVMeFamily.kext" isDirectory:0 relativeToURL:v16];
        if (![(NSURL *)v17 checkResourceIsReachableAndReturnError:0]
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: IONVMeFamily kext bundle file not found", buf, 2u);
        }
        uint64_t v18 = +[NSBundle bundleWithURL:v17];
        uint64_t v19 = +[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", [(NSBundle *)v18 localizations], +[NSLocale preferredLanguages]);
        if (!v18) {
          goto LABEL_38;
        }
        int32x4_t v20 = v19;
        [(NSBundle *)v18 _cfBundle];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (!v21) {
          goto LABEL_38;
        }
        id v22 = v21;
        id v53 = v7;
        uint64_t v23 = *(void *)v62;
LABEL_23:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = CFBundleCopyLocalizedStringForLocalization();
          long long v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFBundleCopyLocalizedStringForLocalization(), +[NSString stringWithUTF8String:v57]);
          char v27 = v26;
          if (v25 && v26 != 0) {
            break;
          }
          if (v22 == (id)++v24)
          {
            id v22 = [(NSArray *)v20 countByEnumeratingWithState:&v61 objects:v70 count:16];
            if (v22) {
              goto LABEL_23;
            }
            break;
          }
        }
        BOOL v29 = !v25 || v27 == 0;
        id v5 = v51;
        uint64_t v4 = v52;
        id v7 = v53;
        if (v29) {
LABEL_38:
        }
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ is writing relatively large amounts of data to internal storage. This may cause additional NAND wear.", +[NSString stringWithUTF8String:v57]);
        time_t v30 = time(0);
        ppStmt[1] = (sqlite3_stmt *)_NSConcreteStackBlock;
        ppStmt[2] = (sqlite3_stmt *)3221225472;
        ppStmt[3] = (sqlite3_stmt *)sub_100006C94;
        ppStmt[4] = (sqlite3_stmt *)&unk_1000108B8;
        long long v59 = xmmword_10000CBE0;
        ppStmt[5] = *(sqlite3_stmt **)(v4 + 48);
        id v60 = v57;
        AnalyticsSendEventLazy();
        ppStmt[0] = 0;
        int v31 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "UPDATE NANDStats SET presentDialog = ?, dialogTimestamp = ?, dialogInterval = CASE WHEN presentDialog >> 8 & 0x1 == 0x1 AND dialogInterval >= 25 THEN 30 WHEN presentDialog >> 8 & 0x1 == 0x1 AND dialogInterval < 25 THEN dialogInterval * 5 ELSE dialogInterval END WHERE bundleID = ?", -1, ppStmt, 0);
        if (v31)
        {
          int v46 = v31;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            long long v47 = sqlite3_errmsg((sqlite3 *)CRUdb);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v72 = v46;
            *(_WORD *)&v72[4] = 2080;
            *(void *)&v72[6] = v47;
            long long v48 = "NANDStats - Exception ::::: SQL Update prepare failure %d %s\n";
            goto LABEL_76;
          }
LABEL_77:
          sqlite3_finalize(ppStmt[0]);
          return;
        }
        sqlite3_bind_int64(ppStmt[0], 1, 0);
        sqlite3_bind_int64(ppStmt[0], 2, v30);
        int v32 = strlen(*(const char **)(*(void *)(*(void *)(v4 + 40) + 8) + 24));
        sqlite3_bind_text(ppStmt[0], 3, *(const char **)(*(void *)(*(void *)(v4 + 40) + 8) + 24), v32, 0);
        int v33 = sqlite3_step(ppStmt[0]);
        if (v33 != 101)
        {
          int v49 = v33;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            long long v50 = sqlite3_errmsg((sqlite3 *)CRUdb);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v72 = v49;
            *(_WORD *)&v72[4] = 2080;
            *(void *)&v72[6] = v50;
            long long v48 = "NANDStats - Exception ::::: SQL Update step failure %d %s\n";
LABEL_76:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v48, buf, 0x12u);
          }
          goto LABEL_77;
        }
        sqlite3_finalize(ppStmt[0]);
        v34 = *(void **)(*(void *)(*(void *)(v4 + 40) + 8) + 24);
        if (v34)
        {
          free(v34);
          *(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = 0;
          *(void *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) = 0;
        }
        uint64_t v9 = v54;
        uint64_t v8 = v55;
        uint64_t i = v56;
      }
      else if ((objc_msgSend(objc_msgSend(v11, "identifier"), "containsString:", @"com.apple.springboard") & 1) == 0)
      {
        pStmt = 0;
        int v35 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "SELECT bundleID, logicalWrites FROM NANDStats WHERE presentDialog & 0x1 = 0x1", -1, &pStmt, 0);
        if (v35)
        {
          int v44 = v35;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v45 = sqlite3_errmsg((sqlite3 *)CRUdb);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v72 = v44;
            *(_WORD *)&v72[4] = 2080;
            *(void *)&v72[6] = v45;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL Select failure %d %s\n", buf, 0x12u);
          }
          sqlite3_finalize(pStmt);
          CRUCloseSQLDB();
          return;
        }
        if (sqlite3_step(pStmt) != 100 || !sqlite3_data_count(pStmt))
        {
          sqlite3_finalize(pStmt);
          CRUCloseSQLDB();
          *(unsigned char *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) = 0;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: INFO!! Displayed notifications for all apps. Invalidating mainDisplayLayoutMonitor", buf, 2u);
          }
          if (qword_1000146E8)
          {
            [(id)qword_1000146E8 invalidate];
            qword_1000146E8 = 0;
          }
          return;
        }
        sqlite3_reset(pStmt);
        while (sqlite3_step(pStmt) == 100)
        {
          v36 = sqlite3_column_text(pStmt, 0);
          sqlite3_int64 v37 = sqlite3_column_int64(pStmt, 1);
          if (objc_msgSend(objc_msgSend(v11, "identifier"), "containsString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v36)))
          {
            id v38 = v7;
            uint64_t v39 = *(void *)(*(void *)(v4 + 40) + 8);
            v40 = *(void **)(v39 + 24);
            if (v40)
            {
              free(v40);
              *(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = 0;
              *(void *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) = 0;
              uint64_t v39 = *(void *)(*(void *)(v4 + 40) + 8);
            }
            *(void *)(v39 + 24) = strdup((const char *)v36);
            *(void *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) = v37;
            id v7 = v38;
            break;
          }
        }
        sqlite3_finalize(pStmt);
        uint64_t v9 = v54;
        uint64_t v8 = v55;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v66 objects:v73 count:16];
    if (v7) {
      continue;
    }
    break;
  }
}

NSDictionary *sub_100006C94(void *a1)
{
  v3[0] = @"dismiss";
  v4[0] = +[NSNumber numberWithUnsignedLongLong:a1[5]];
  v3[1] = @"learnMore";
  v4[1] = +[NSNumber numberWithUnsignedLongLong:a1[6]];
  v3[2] = @"logicalWrites";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1[4] + 8) + 24)];
  v3[3] = @"application";
  v4[3] = +[NSString stringWithUTF8String:a1[7]];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
}

void sub_100006D80(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) != 2) {
    return;
  }
  int v3 = &selRef_URLForDirectory_inDomain_appropriateForURL_create_error_;
  if (!qword_1000146E8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: mainDisplayLayoutMonitor is invalidated. Restarting the runloop.", buf, 2u);
    }
    CFRunLoopRef Main = CFRunLoopGetMain();
    CFRetain(Main);
    CFRunLoopStop(Main);
    CFRelease(Main);
  }
  if (!CRUOpenSQLDB())
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "NANDStats - Exception ::::: Unable to open SQL database\n";
    goto LABEL_15;
  }
  if (!CRUCreateTable())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = sqlite3_errmsg((sqlite3 *)CRUdb);
      *(_DWORD *)buf = 136315138;
      *(void *)v72 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats -  Exception ::::: Unable to create NANDStats table %s\n", buf, 0xCu);
    }
    CRUCloseSQLDB();
    goto LABEL_19;
  }
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "SELECT bundleID, dialogTimestamp, dialogInterval FROM NANDStats", -1, &ppStmt, 0);
  if (!v5)
  {
    id v53 = objc_alloc_init((Class)NSMutableDictionary);
    id v55 = objc_alloc_init((Class)NSMutableDictionary);
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    id v56 = objc_alloc_init((Class)NSMutableDictionary);
    id v52 = objc_alloc_init((Class)NSMutableDictionary);
    while (sqlite3_step(ppStmt) == 100)
    {
      id v13 = sqlite3_column_text(ppStmt, 0);
      sqlite3_int64 v14 = sqlite3_column_int64(ppStmt, 1);
      uint64_t v15 = sqlite3_column_int(ppStmt, 2);
      if (v14)
      {
        uint64_t v16 = v15;
        NSLog(@"NANDStats: Apps with positive dialog timestamp [bundleId: %s - dialogTimestamp: %llu - Interval: %u]", v13, v14, v15);
        [v12 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14) stringWithUTF8String:v13]];
        [v55 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16) stringWithUTF8String:v13]];
      }
      [v56 setObject:[NSNumber numberWithBool:0] forKey:[NSString stringWithUTF8String:v13]];
    }
    sqlite3_finalize(ppStmt);
    CFStringRef v78 = @"LogicalWriteThresholdPerDay";
    uint64_t v54 = a1;
    v79 = +[NSNumber numberWithDouble:*(double *)(a1 + 40) * 1073741820.0];
    +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    uint64_t v17 = (void *)PLQueryRegistered();
    id v18 = [v17 objectForKeyedSubscript:@"lastUpgradeTimestamp"];
    id v19 = [v17 objectForKeyedSubscript:@"responseStartTimestamp"];
    NSLog(@"NANDStats: lastUpgradeTimestamp = %@ responseStartTimestamp = %@", v18, v19);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = [v17 objectForKeyedSubscript:@"queryResultsPerDay"];
    id v49 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
    if (v49)
    {
      uint64_t v20 = 0;
      BOOL v21 = 0;
      uint64_t v50 = *(void *)v67;
      id v46 = v19;
      id v47 = v18;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v67 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v51 = v22;
          uint64_t v23 = *(void **)(*((void *)&v66 + 1) + 8 * v22);
          unint64_t v24 = 86400 * v20 + [v19 unsignedIntValue];
          if (v24 < [v18 unsignedIntValue]
            || v24 >= [v18 unsignedIntValue] + 259200)
          {
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v25 = [v23 countByEnumeratingWithState:&v62 objects:v76 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v63;
              while (2)
              {
                for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v63 != v27) {
                    objc_enumerationMutation(v23);
                  }
                  BOOL v29 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                  [v56 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1)] forKey:v29];
                  id v30 = [[v23 objectForKeyedSubscript:v29] unsignedLongLongValue];
                  if ([v12 objectForKey:v29]
                    && (unint64_t)objc_msgSend(objc_msgSend(v12, "objectForKey:", v29), "unsignedLongLongValue") >= v24)
                  {
                    NSLog(@"NANDStats: INFO!! BundleId : %@ already reported for day %lu with timestamp %llu", v29, v20, v24);
                  }
                  else
                  {
                    int v31 = sub_1000076F4(v20, v29, (unint64_t)v30, v24, v53, v12, v55, v52, *(double *)(v54 + 48));
                    if (v31 == 2)
                    {
                      int v32 = 1;
                      goto LABEL_52;
                    }
                    BOOL v21 = (v31 | v21) != 0;
                  }
                }
                id v26 = [v23 countByEnumeratingWithState:&v62 objects:v76 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }
          }
          else
          {
            NSLog(@"NANDStats: ALERT!! OS upgrade occurred. Ignoring current day with number %lu : %llu. Upgrade timestamp : %@", v20, v24, v18);
          }
          ++v20;
          uint64_t v22 = v51 + 1;
          id v19 = v46;
          id v18 = v47;
        }
        while ((id)(v51 + 1) != v49);
        id v49 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
      }
      while (v49);
    }
    else
    {
      BOOL v21 = 0;
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v33 = [v56 countByEnumeratingWithState:&v58 objects:v75 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v59;
      while (2)
      {
        for (uint64_t j = 0; j != v34; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v59 != v35) {
            objc_enumerationMutation(v56);
          }
          sqlite3_int64 v37 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
          if ((objc_msgSend(objc_msgSend(v56, "objectForKey:", v37), "BOOLValue") & 1) == 0)
          {
            NSLog(@"NANDStats: Deleting app %@ as it may be uninstalled", v37);
            id v38 = (const char *)[v37 UTF8String];
            pStmt = 0;
            int v39 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "DELETE FROM NANDStats WHERE bundleID = ?", -1, &pStmt, 0);
            if (v39)
            {
              int v44 = v39;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v45 = sqlite3_errmsg((sqlite3 *)CRUdb);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v72 = v44;
                *(_WORD *)&v72[4] = 2080;
                *(void *)&v72[6] = v45;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL delete failure %d %s\n", buf, 0x12u);
              }
              uint64_t v8 = pStmt;
              goto LABEL_12;
            }
            int v40 = strlen(v38);
            sqlite3_bind_text(pStmt, 1, v38, v40, 0);
            int v41 = sqlite3_step(pStmt);
            if (v41 != 101)
            {
              int v42 = v41;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                uint32_t v43 = sqlite3_errmsg((sqlite3 *)CRUdb);
                *(_DWORD *)buf = 136315650;
                *(void *)v72 = v38;
                *(_WORD *)&v72[8] = 1024;
                *(_DWORD *)&v72[10] = v42;
                __int16 v73 = 2080;
                v74 = v43;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL Delete step failure for bundleID: %s [%d %s]\n", buf, 0x1Cu);
              }
            }
            sqlite3_finalize(pStmt);
          }
        }
        id v34 = [v56 countByEnumeratingWithState:&v58 objects:v75 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }
    int v32 = 0;
LABEL_52:

    if (v32 && CRUdb) {
      sqlite3_file_control((sqlite3 *)CRUdb, 0, 101, 0);
    }
    CRUCloseSQLDB();
    int v3 = &selRef_URLForDirectory_inDomain_appropriateForURL_create_error_;
    if (v21)
    {
      *(unsigned char *)(*(void *)(*(void *)(v54 + 32) + 8) + 24) = 1;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_WORD *)buf = 0;
      uint64_t v9 = "NANDStats: INFO!! isNANDStatsReporting set to true";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      return;
    }
LABEL_19:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: INFO!! isNANDStatsReporting set to false. Invalidating FBSDisplayLayoutMonitor", buf, 2u);
    }
    BOOL v11 = v3[221];
    if (v11)
    {
      [v11 invalidate];
      v3[221] = 0;
    }
    return;
  }
  int v6 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sqlite3_errmsg((sqlite3 *)CRUdb);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v72 = v6;
    *(_WORD *)&v72[4] = 2080;
    *(void *)&v72[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL Select failure %d %s\n", buf, 0x12u);
  }
  uint64_t v8 = ppStmt;
LABEL_12:
  sqlite3_finalize(v8);
  CRUCloseSQLDB();
}

uint64_t sub_1000076F4(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, void *a5, void *a6, void *a7, void *a8, double a9)
{
  if (a9 * 1073741820.0 >= (double)a3)
  {
    NSLog(@"NANDStats: INFO!! BundleId : %@ with writes: %llu being counted towards NAND dialog reporting for day %lu", a2, a3, a1);
    if ([a5 objectForKey:a2])
    {
      uint64_t v21 = [[objc_msgSend(a5, "objectForKey:", a2) unsignedIntValue] + 1;
      [a5 setObject:[NSNumber numberWithUnsignedInt:v21] forKey:a2];
      [a8 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(objc_msgSend(a8, "objectForKey:", a2), "unsignedLongLongValue") + a3) forKey:a2];
      if (v21 >= 5)
      {
        if (![a7 objectForKey:a2]
          || (unsigned int v22 = objc_msgSend(objc_msgSend(a7, "objectForKey:", a2), "unsignedIntValue"),
              (unint64_t)objc_msgSend(objc_msgSend(a6, "objectForKey:", a2), "unsignedLongLongValue")
            + 86400 * v22 < a4))
        {
          [objc_msgSend(a8, "objectForKey:", a2) unsignedLongLongValue];
          id v12 = a2;
          sqlite3_int64 v13 = a3;
          int v14 = 1;
          goto LABEL_3;
        }
        NSLog(@"NANDStats: INFO!! Not reporting bundleId : %@ for day %lu. Too frequent since last dialog was reported.", a2, a1);
      }
    }
    else
    {
      [a5 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1)] forKey:a2];
      [a8 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3)] forKey:a2];
    }
    return 0;
  }
  NSLog(@"NANDStats: INFO!! BundleId : %@ has exceeded the day %lu budget", a2, a1);
  id v12 = a2;
  sqlite3_int64 v13 = a3;
  int v14 = 0;
LABEL_3:

  return sub_100007908(v12, v13, v14);
}

uint64_t sub_100007908(void *a1, sqlite3_int64 a2, int a3)
{
  ppStmt = 0;
  int v6 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "REPLACE INTO NANDStats(bundleID, presentDialog, logicalWrites) VALUES(?, ?, ?)", -1, &ppStmt, 0);
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = sqlite3_errmsg((sqlite3 *)CRUdb);
      *(_DWORD *)buf = 67109378;
      int v20 = v7;
      __int16 v21 = 2080;
      unsigned int v22 = v8;
      uint64_t v9 = "NANDStats - Exception ::::: sqlite insert prepare failed %d %s\n";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x12u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v10 = (const char *)[a1 UTF8String];
  int v11 = strlen(v10);
  uint64_t v12 = 1;
  sqlite3_bind_text(ppStmt, 1, v10, v11, 0);
  if (a3) {
    sqlite3_int64 v13 = 257;
  }
  else {
    sqlite3_int64 v13 = 1;
  }
  sqlite3_bind_int64(ppStmt, 2, v13);
  sqlite3_bind_int64(ppStmt, 3, a2);
  int v14 = sqlite3_step(ppStmt);
  if (v14 != 101)
  {
    int v15 = v14;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = sqlite3_errmsg((sqlite3 *)CRUdb);
      *(_DWORD *)buf = 67109378;
      int v20 = v15;
      __int16 v21 = 2080;
      unsigned int v22 = v16;
      uint64_t v9 = "NANDStats - Exception ::::: sqlite insert failed %d %s\n";
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v12 = 2;
  }
  sqlite3_finalize(ppStmt);
  return v12;
}

void sub_100007AD4(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (&_SBSGetScreenLockStatus)
    {
      if (v2)
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FSTaskScheduler :: Sending data to CA", v4, 2u);
      }
      sub_1000060A8();
    }
    else if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FSTaskScheduler :: No SpringBoardServices framework. Not sending FS Stats to CA.", buf, 2u);
    }
    CFRunLoopRef Main = CFRunLoopGetMain();
    CFRetain(Main);
    CFRunLoopStop(Main);
    CFRelease(Main);
  }
}

_DWORD *(*iocompressionstats_notification_server_routine(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 5600) {
    return sub_100007BC8;
  }
  else {
    return 0;
  }
}

_DWORD *sub_100007BC8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    id result = (_DWORD *)iocompressionstats_notification();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t iocompressionstats_notification_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 5600)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }
    else
    {
      *(_DWORD *)(a2 + 32) = iocompressionstats_notification();
    }
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t FSDConnect(const char *a1)
{
  *(void *)mainPort = 0;
  if (IOMainPort(0, &mainPort[1]))
  {
    warnx("IOMasterPort failed");
  }
  else
  {
    CFDictionaryRef v2 = IOServiceMatching(a1);
    if (v2)
    {
      if (IOServiceGetMatchingServices(mainPort[1], v2, mainPort))
      {
        warnx("IOServiceGetMatchingServices failed");
      }
      else
      {
        fsdService = IOIteratorNext(mainPort[0]);
        IOObjectRelease(mainPort[0]);
        if (fsdService)
        {
          if (!IOServiceOpen(fsdService, mach_task_self_, 0, (io_connect_t *)&fsdConnection)) {
            return 1;
          }
          warnx("IOServiceOpen failed for class '%s'");
        }
        else
        {
          warnx("No %s instance found");
        }
      }
    }
    else
    {
      warnx("IOServiceMatching failed for %s");
    }
  }
  return 0;
}

void FSDDisconnect()
{
  if (fsdConnection && IOServiceClose(fsdConnection)) {
    warnx("IOServiceClose failed");
  }
  fsdConnection = 0;
}

uint64_t GetDiskObject(const char *a1)
{
  io_iterator_t iterator = 0;
  memset(name, 0, 128);
  uint64_t v2 = 0;
  if (IORegistryEntryCreateIterator(fsdService, "IOService", 0, &iterator))
  {
    int v3 = "IORegistryEntryCreateIterator failed";
  }
  else
  {
    int v3 = "IORegistryEntryGetName failed";
    while (1)
    {
      if (v2) {
        IOObjectRelease(v2);
      }
      uint64_t v2 = IOIteratorNext(iterator);
      if (IORegistryEntryGetName(v2, name)) {
        break;
      }
      if (!strcmp(name, a1)) {
        goto LABEL_7;
      }
    }
  }
  warnx(v3);
LABEL_7:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  return v2;
}

uint64_t FSDGetInfo(const char *a1, int a2)
{
  if (a2)
  {
    uint64_t result = sub_1000080F0(fsdService, "NAND Controller");
    if (!result) {
      return result;
    }
    uint64_t result = GetDiskObject(a1);
    if (!result) {
      return result;
    }
    io_object_t v4 = result;
    if (!sub_1000080F0(result, "NAND Devices"))
    {
      IOObjectRelease(v4);
      return 0;
    }
  }
  else
  {
    uint64_t result = GetDiskObject(a1);
    io_object_t v4 = result;
    if (!result) {
      return result;
    }
  }
  uint64_t v5 = 0;
  if (sub_1000081B4(v4, @"#ce", (UInt8 *)&gBankCount, 4)
    && sub_1000081B4(v4, @"ppn-device", (UInt8 *)&gPpnDevice, 4)
    && sub_1000081B4(v4, @"device-readid", (UInt8 *)&v5, 8)
    && sub_1000081B4(v4, @"#ce-blocks", (UInt8 *)&gBlocksPerBank, 4)
    && sub_1000081B4(v4, @"#block-pages", gPagesPerBlock, 4)
    && sub_1000081B4(v4, @"#page-bytes", gBytesPerPage, 4))
  {
    gBuses = gBankCount;
    gTotalCAUs = 1;
    gBlocksPerCAU = gBlocksPerBank;
    if (sub_1000081B4(v4, @"ppn-spec-version", (UInt8 *)&gPpnSpecLong, 8)) {
      snprintf(gPpnSpec, 0xDuLL, "%llx", gPpnSpecLong);
    }
    gDevID = v5;
  }
  else
  {
    warnx("cannot get basic NAND parameters");
  }
  IOObjectRelease(v4);
  return 1;
}

BOOL sub_1000080F0(io_registry_entry_t a1, char *a2)
{
  kern_return_t v5;
  CFMutableDictionaryRef properties;

  puts(a2);
  if (*a2)
  {
    size_t v4 = 0;
    do
    {
      putchar(61);
      ++v4;
    }
    while (v4 < strlen(a2));
  }
  properties = 0;
  putchar(10);
  uint64_t v5 = IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0);
  if (v5)
  {
    warnx("IORegistryEntryCreateCFProperties failed");
  }
  else
  {
    TAOCFPrettyPrint(properties);
    CFRelease(properties);
    putchar(10);
  }
  return v5 == 0;
}

BOOL sub_1000081B4(io_registry_entry_t a1, const __CFString *a2, UInt8 *a3, CFIndex a4)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    sub_100009050(a2);
    return 0;
  }
  uint64_t v8 = CFProperty;
  CFTypeID v9 = CFGetTypeID(CFProperty);
  if (v9 != CFNumberGetTypeID())
  {
    CFTypeID v11 = CFGetTypeID(v8);
    if (v11 == CFBooleanGetTypeID())
    {
      *(_DWORD *)a3 = CFBooleanGetValue((CFBooleanRef)v8);
      return 1;
    }
    CFTypeID v13 = CFGetTypeID(v8);
    if (v13 == CFDataGetTypeID())
    {
      CFIndex Length = CFDataGetLength((CFDataRef)v8);
      if (Length >= a4) {
        v15.length = a4;
      }
      else {
        v15.length = Length;
      }
      v15.location = 0;
      CFDataGetBytes((CFDataRef)v8, v15, a3);
      return 1;
    }
    CFTypeID v16 = CFGetTypeID(v8);
    if (v16 == CFArrayGetTypeID())
    {
      gControllers = (uint64_t)v8;
      return 1;
    }
    sub_100009098(v8, v17, a2);
    return 0;
  }
  if (a4 < 5) {
    CFNumberType v10 = kCFNumberSInt32Type;
  }
  else {
    CFNumberType v10 = kCFNumberSInt64Type;
  }
  return CFNumberGetValue((CFNumberRef)v8, v10, a3) != 0;
}

uint64_t FSDGetAdvancedInfo(const __CFString *a1, int a2)
{
  io_iterator_t existing = 0;
  CFDictionaryRef v4 = IOServiceMatching("IOMedia");
  IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  if (!existing) {
    return 0;
  }
  io_object_t v5 = IOIteratorNext(existing);
  if (v5)
  {
    io_registry_entry_t v6 = v5;
    do
    {
      CFTypeRef v7 = IORegistryEntrySearchCFProperty(v6, "IOService", a1, kCFAllocatorDefault, 3u);
      IOObjectRelease(v6);
      if (!v7) {
        break;
      }
      CFArrayRef v83 = 0;
      CFArrayRef v84 = 0;
      CFTypeID v8 = CFGetTypeID(v7);
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)v7;
      if (v8 != CFDictionaryGetTypeID())
      {
        CFTypeID v10 = CFGetTypeID(v7);
        if (v10 != CFArrayGetTypeID()) {
          goto LABEL_66;
        }
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v7, 0);
      }
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"manufacturer-id");
      if (!Value) {
        goto LABEL_66;
      }
      CFStringRef v12 = Value;
      CFTypeID v13 = CFGetTypeID(Value);
      if (v13 == CFStringGetTypeID())
      {
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v12, SystemEncoding);
        if (CStringPtr)
        {
          strncpy(gManufacturerID, CStringPtr, 0x15uLL)[20] = 0;
        }
        else
        {
          CFStringEncoding v17 = CFStringGetSystemEncoding();
          if (CFStringGetCString(v12, gManufacturerID, 21, v17)) {
            byte_1000141FC = 0;
          }
        }
      }
      else
      {
        CFTypeID v16 = CFGetTypeID(v12);
        if (v16 != CFDataGetTypeID())
        {
          sub_100009294(v12, v86);
          goto LABEL_66;
        }
        if (CFDataGetLength((CFDataRef)v12) != 8)
        {
          warnx("Manufacturer ID not 8 bytes as expected\n");
          goto LABEL_66;
        }
        v88.location = 0;
        v88.length = 8;
        CFDataGetBytes((CFDataRef)v12, v88, buffer);
        snprintf(gManufacturerID, 0x15uLL, "0x%llx", *(void *)buffer);
        gManufacturerIDLong = *(void *)buffer;
      }
      CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"firmware-version");
      if (v18)
      {
        CFStringRef v19 = v18;
        CFTypeID v20 = CFGetTypeID(v18);
        if (v20 == CFStringGetTypeID())
        {
          CFStringEncoding v21 = CFStringGetSystemEncoding();
          unsigned int v22 = CFStringGetCStringPtr(v19, v21);
          if (v22)
          {
            strncpy((char *)gFirmwareVersion, v22, 0x11uLL);
          }
          else
          {
            CFStringEncoding v24 = CFStringGetSystemEncoding();
            if (!CFStringGetCString(v19, (char *)gFirmwareVersion, 17, v24)) {
              goto LABEL_26;
            }
          }
        }
        else
        {
          CFTypeID v23 = CFGetTypeID(v19);
          if (v23 != CFDataGetTypeID())
          {
            sub_100009250(v19, v86);
            goto LABEL_66;
          }
          if (CFDataGetLength((CFDataRef)v19) != 16)
          {
            warnx("Firmware Version not the expected size\n");
            goto LABEL_66;
          }
          v89.location = 0;
          v89.length = 16;
          CFDataGetBytes((CFDataRef)v19, v89, gFirmwareVersion);
        }
        byte_10001422B = 0;
      }
LABEL_26:
      CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"msp-version");
      if (!v25) {
        goto LABEL_34;
      }
      CFStringRef v26 = v25;
      CFTypeID v27 = CFGetTypeID(v25);
      if (v27 != CFStringGetTypeID())
      {
        CFTypeID v30 = CFGetTypeID(v26);
        if (v30 != CFDataGetTypeID())
        {
          sub_10000920C(v26, v86);
          goto LABEL_66;
        }
        if (CFDataGetLength((CFDataRef)v26) != 16)
        {
          warnx("MSP Version not the expected size\n");
          goto LABEL_66;
        }
        v90.location = 0;
        v90.length = 16;
        CFDataGetBytes((CFDataRef)v26, v90, gMSPVersion);
        byte_10001423C = 0;
        goto LABEL_33;
      }
      CFStringEncoding v28 = CFStringGetSystemEncoding();
      BOOL v29 = CFStringGetCStringPtr(v26, v28);
      if (v29)
      {
        strncpy((char *)gMSPVersion, v29, 0x11uLL)[16] = 0;
LABEL_33:
        gMSPVersionPresent = 1;
        goto LABEL_34;
      }
      CFStringEncoding v38 = CFStringGetSystemEncoding();
      if (CFStringGetCString(v26, (char *)gMSPVersion, 17, v38))
      {
        gMSPVersionPresent = 1;
        byte_10001423C = 0;
      }
LABEL_34:
      CFStringRef v31 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"nand-marketing-name");
      if (!v31) {
        goto LABEL_45;
      }
      CFStringRef v32 = v31;
      CFTypeID v33 = CFGetTypeID(v31);
      if (v33 == CFStringGetTypeID())
      {
        CFStringEncoding v34 = CFStringGetSystemEncoding();
        uint64_t v35 = CFStringGetCStringPtr(v32, v34);
        if (v35)
        {
          strncpy((char *)gMarketingName, v35, 0x15uLL);
        }
        else
        {
          CFStringEncoding v39 = CFStringGetSystemEncoding();
          if (!CFStringGetCString(v32, (char *)gMarketingName, 21, v39)) {
            goto LABEL_45;
          }
        }
      }
      else
      {
        CFTypeID v36 = CFGetTypeID(v32);
        if (v36 != CFDataGetTypeID())
        {
          sub_1000091C8(v32, v86);
          goto LABEL_66;
        }
        uint64_t Length = CFDataGetLength((CFDataRef)v32);
        if (Length > 20)
        {
          warnx("Marketing Name not the expected size\n");
          goto LABEL_66;
        }
        v91.length = Length;
        v91.location = 0;
        CFDataGetBytes((CFDataRef)v32, v91, gMarketingName);
      }
      byte_100014251 = 0;
LABEL_45:
      CFStringRef v40 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"vendor-name");
      if (!v40) {
        goto LABEL_52;
      }
      CFStringRef v41 = v40;
      CFTypeID v42 = CFGetTypeID(v40);
      if (v42 != CFStringGetTypeID())
      {
        sub_100009184(v41, v86);
        goto LABEL_66;
      }
      CFStringEncoding v43 = CFStringGetSystemEncoding();
      int v44 = CFStringGetCStringPtr(v41, v43);
      if (v44)
      {
        gManufacturerPresent = 1;
        strncpy(gManufacturer, v44, 0x1EuLL);
      }
      else
      {
        CFStringEncoding v45 = CFStringGetSystemEncoding();
        if (!CFStringGetCString(v41, gManufacturer, 30, v45)) {
          goto LABEL_52;
        }
        gManufacturerPresent = 1;
      }
      byte_10001421A = 0;
LABEL_52:
      CFStringRef v46 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"controller-unique-id");
      if (v46)
      {
        CFStringRef v47 = v46;
        CFTypeID v48 = CFGetTypeID(v46);
        if (v48 != CFStringGetTypeID())
        {
          CFTypeID v51 = CFGetTypeID(v47);
          if (v51 != CFDataGetTypeID())
          {
            sub_100009140(v47, v86);
            goto LABEL_66;
          }
          if (CFDataGetLength((CFDataRef)v47) != 16)
          {
            warnx("Controller UID not the expected size\n");
            goto LABEL_66;
          }
          v92.location = 0;
          v92.length = 16;
          CFDataGetBytes((CFDataRef)v47, v92, v87);
          uint64_t v52 = 0;
          gControllerUID = 0;
          id v53 = &byte_100014253;
          do
          {
            unint64_t v54 = v87[v52];
            *(v53 - 1) = a0123456789abcd[v54 >> 4];
            *id v53 = a0123456789abcd[v54 & 0xF];
            v53 += 2;
            ++v52;
          }
          while (v52 != 16);
          goto LABEL_62;
        }
        CFStringEncoding v49 = CFStringGetSystemEncoding();
        uint64_t v50 = CFStringGetCStringPtr(v47, v49);
        if (v50)
        {
          strncpy(&gControllerUID, v50, 0x21uLL);
LABEL_62:
          byte_100014272 = 0;
          goto LABEL_63;
        }
        CFStringEncoding v55 = CFStringGetSystemEncoding();
        if (CFStringGetCString(v47, &gControllerUID, 33, v55)) {
          goto LABEL_62;
        }
      }
LABEL_63:
      CFStringRef v56 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"chip-id");
      if (!v56) {
        goto LABEL_87;
      }
      CFStringRef v57 = v56;
      CFTypeID v58 = CFGetTypeID(v56);
      if (v58 == CFStringGetTypeID())
      {
        CFStringEncoding v60 = CFStringGetSystemEncoding();
        long long v61 = CFStringGetCStringPtr(v57, v60);
        if (v61)
        {
          long long v62 = strncpy(gChipID, v61, 0xDuLL);
          v62[12] = 0;
LABEL_85:
          if (isPpnDevice(v62)) {
            gPpnDevice = 1;
          }
        }
        else
        {
          CFStringEncoding v63 = CFStringGetSystemEncoding();
          if (CFStringGetCString(v57, gChipID, 13, v63))
          {
            byte_1000143DC = 0;
            long long v62 = gChipID;
            goto LABEL_85;
          }
        }
LABEL_87:
        long long v64 = CFDictionaryGetValue(ValueAtIndex, @"capacity");
        FSDRetrieveValueFromCFNumber(v64, &gCapacity);
        long long v65 = CFDictionaryGetValue(ValueAtIndex, @"num-bus");
        FSDRetrieveValueFromCFNumber(v65, &gBuses);
        CFArrayRef v84 = (CFArrayRef)CFDictionaryGetValue(ValueAtIndex, @"dies-per-bus");
        if (v84)
        {
          CFIndex v66 = FSDFetchArrayHelper(&v84, 0x10uLL, (char *)gDiesPerBus);
          if (v66 != gBuses) {
            warnx("diesPerBus elements count (%zu) not as expected (%u)\n", v66, gBuses);
          }
        }
        else
        {
          int v82 = 0;
          long long v67 = CFDictionaryGetValue(ValueAtIndex, @"dies-per-channel");
          FSDRetrieveValueFromCFNumber(v67, &v82);
          uint64_t v68 = gBuses;
          if (gBuses)
          {
            long long v69 = gDiesPerBus;
            int v70 = v82;
            do
            {
              *v69++ = v70;
              --v68;
            }
            while (v68);
          }
        }
        CFArrayRef v83 = (CFArrayRef)CFDictionaryGetValue(ValueAtIndex, @"bus-to-msp");
        if (v83)
        {
          CFIndex v71 = FSDFetchArrayHelper(&v83, 0x10uLL, (char *)&gBusToMsp);
          if (v71 != gBuses) {
            warnx("busToMsp elements count (%zu) not as expected (%u)\n", v71, gBuses);
          }
        }
        else
        {
          uint64_t v72 = gBuses;
          if (gBuses)
          {
            uint64_t v73 = 0;
            do
            {
              *((_DWORD *)&gBusToMsp + v73) = v73 >> 1;
              ++v73;
            }
            while (v72 != v73);
          }
        }
        v74 = CFDictionaryGetValue(ValueAtIndex, @"num-dip");
        FSDRetrieveValueFromCFNumber(v74, &gTotalCAUs);
        v75 = CFDictionaryGetValue(ValueAtIndex, @"blocks-per-cau");
        FSDRetrieveValueFromCFNumber(v75, &gBlocksPerCAU);
        v76 = CFDictionaryGetValue(ValueAtIndex, @"page-size");
        FSDRetrieveValueFromCFNumber(v76, &gBytesPerPage);
        v77 = CFDictionaryGetValue(ValueAtIndex, @"pages-per-block-mlc");
        FSDRetrieveValueFromCFNumber(v77, &gPagesPerBlock);
        CFStringRef v78 = CFDictionaryGetValue(ValueAtIndex, @"default-bits-per-cell");
        FSDRetrieveValueFromCFNumber(v78, &gBitsPerCell);
        v79 = CFDictionaryGetValue(ValueAtIndex, @"program-scheme");
        FSDRetrieveValueFromCFNumber(v79, &gPrgmScheme);
        if (a2)
        {
          puts("\nDevice Characteristics:\n");
          TAOCFPrettyPrint((const __CFDictionary *)v7);
        }
        CFRelease(v7);
        uint64_t v59 = 1;
        goto LABEL_102;
      }
      sub_1000090FC(v57, v86);
LABEL_66:
      CFRelease(v7);
      io_registry_entry_t v6 = IOIteratorNext(existing);
    }
    while (v6);
  }
  uint64_t v59 = 0;
LABEL_102:
  if (existing) {
    IOObjectRelease(existing);
  }
  return v59;
}

uint64_t isPpnDevice(const char *a1)
{
  gPpnSpec[0] = 0;
  size_t v2 = strlen(a1);
  uint64_t result = 0;
  if (v2 >= 7)
  {
    for (uint64_t i = 0; i != 6; ++i)
    {
      if (a1[i] != ppnChipID[i]) {
        return 0;
      }
    }
    if (strlen(a1) < 7)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v5 = 0;
      do
      {
        gPpnSpec[v5] = a1[v5 + 6];
        unsigned int v6 = v5 + 1;
        size_t v7 = strlen(a1);
        size_t v8 = v5 + 7;
        ++v5;
      }
      while (v7 > v8);
      uint64_t v9 = v6;
    }
    gPpnSpec[v9] = 0;
    return 1;
  }
  return result;
}

uint64_t FSDHexDump(uint64_t result, unsigned char *a2, unsigned int a3, unsigned int a4)
{
  *a2 = 0;
  if (((2 * a3) | 1) <= a4)
  {
    if (a3)
    {
      int v4 = 0;
      LOBYTE(v5) = 0;
      do
      {
        a2[v5] = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(result + v4) >> 4];
        uint64_t v6 = v5 | 1;
        LOBYTE(v5) = v5 + 2;
        a2[v6] = a0123456789abcd[*(unsigned char *)(result + v4++) & 0xF];
      }
      while (a3 > v4);
      uint64_t v5 = v5;
    }
    else
    {
      uint64_t v5 = 0;
    }
    a2[v5] = 0;
  }
  return result;
}

void FSDRetrieveValueFromCFNumber(const void *a1, void *a2)
{
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFNumberGetTypeID())
    {
      CFNumberType Type = CFNumberGetType((CFNumberRef)a1);
      if (!CFNumberGetValue((CFNumberRef)a1, Type, a2))
      {
        warnx("value could not be copied\n");
      }
    }
    else
    {
      sub_1000092D8(a1, v6);
    }
  }
}

CFIndex FSDFetchArrayHelper(CFArrayRef *a1, unint64_t a2, char *a3)
{
  unint64_t Count = CFArrayGetCount(*a1);
  if (Count > a2) {
    return 0;
  }
  CFIndex v7 = Count;
  __chkstk_darwin();
  uint64_t v9 = (const void **)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v8 >= 0x200) {
    size_t v10 = 512;
  }
  else {
    size_t v10 = v8;
  }
  bzero((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  v15.location = 0;
  v15.length = v7;
  CFArrayGetValues(*a1, v15, v9);
  bzero(a3, 4 * a2);
  if (v7)
  {
    CFIndex v11 = v7;
    do
    {
      CFStringRef v12 = *v9++;
      FSDRetrieveValueFromCFNumber(v12, a3);
      a3 += 4;
      --v11;
    }
    while (v11);
  }
  return v7;
}

uint64_t sub_100009034(const __CFString *a1)
{
  return CFStringGetCString(a1, v1, 64, 0x600u);
}

void sub_100009050(const __CFString *a1)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a1, SystemEncoding);
  warnx("error fetching property '%s'", CStringPtr);
}

void sub_100009098(const void *a1, char *a2, const __CFString *a3)
{
  CFTypeID v5 = CFGetTypeID(a1);
  CFStringRef v6 = CFCopyTypeIDDescription(v5);
  CFStringGetCString(v6, a2, 64, 0x600u);
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a3, SystemEncoding);
  warnx("property '%s' has unexpected type '%s'", CStringPtr, a2);
}

void sub_1000090FC(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("Chip ID has unexpected type '%s'\n", a2);
}

void sub_100009140(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("Controller UID has unexpected type '%s'\n", a2);
}

void sub_100009184(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("manufacturer name has unexpected type '%s'\n", a2);
}

void sub_1000091C8(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("marketing name has unexpected type '%s'\n", a2);
}

void sub_10000920C(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("msp-version has unexpected type '%s'\n", a2);
}

void sub_100009250(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("firmware-version has unexpected type '%s'\n", a2);
}

void sub_100009294(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("manufacturerID has unexpected type '%s'\n", a2);
}

void sub_1000092D8(const void *a1, const char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  sub_100009034(v4);
  warnx("value has unexpected type '%s'\n", a2);
}

void TAOCFPrettyPrint(const __CFDictionary *a1)
{
  v1[0] = 0;
  v1[1] = "\t";
  v1[2] = __stdoutp;
  sub_1000093F4(a1, v1);
}

void TAOCFPrettyPrintToFile(const __CFDictionary *a1, uint64_t a2)
{
  v2[0] = 0;
  v2[1] = "\t";
  v2[2] = a2;
  sub_1000093F4(a1, v2);
}

void TAOCFPrettyPrintWithIndenter(const __CFDictionary *a1, uint64_t a2)
{
  v2[1] = a2;
  v2[2] = __stdoutp;
  v2[0] = 0;
  sub_1000093F4(a1, v2);
}

void TAOCFPrettyPrintToFileWithIndenter(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  v3[1] = a3;
  v3[2] = a2;
  v3[0] = 0;
  sub_1000093F4(a1, v3);
}

void sub_1000093F4(const __CFDictionary *a1, void *a2)
{
  if (a1)
  {
    CFDictionaryRef v3 = a1;
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_1000095D0, a2);
      return;
    }
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      v6.length = CFArrayGetCount(v3);
      v6.location = 0;
      CFArrayApplyFunction(v3, v6, (CFArrayApplierFunction)sub_100009638, a2);
      return;
    }
    CFTypeID v7 = CFGetTypeID(v3);
    if (v7 == CFTreeGetTypeID())
    {
      sub_1000096CC(v3, (uint64_t)a2);
      return;
    }
    CFTypeID v8 = CFGetTypeID(v3);
    if (v8 == CFBagGetTypeID())
    {
      CFBagApplyFunction(v3, (CFBagApplierFunction)sub_100009750, a2);
      return;
    }
    a1 = v3;
  }

  sub_100009578((uint64_t)a1, (uint64_t)a2);
}

void sub_100009578(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v3 = (char *)sub_100009764(a1);
  sub_100009824(v3, 0, a2);
  if (v3)
  {
    free(v3);
  }
}

void sub_1000095D0(uint64_t a1, const void *a2, uint64_t a3)
{
  CFTypeID v5 = (char *)sub_100009764(a1);
  sub_100009824(v5, a2, a3);
  if (v5)
  {
    free(v5);
  }
}

void sub_100009638(const void *a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = v4 + 1;
  snprintf(__str, 0x100uLL, "%d", v4);
  sub_100009824(__str, a1, a2);
}

void sub_1000096CC(__CFTree *a1, uint64_t a2)
{
  memset(&context, 0, sizeof(context));
  int v4 = *(_DWORD *)a2 + 1;
  long long v6 = *(_OWORD *)(a2 + 8);
  v5[0] = v4;
  v5[1] = 0;
  CFTreeGetContext(a1, &context);
  sub_100009824((char *)&unk_10000D177, context.info, a2);
  CFTreeApplyFunctionToChildren(a1, (CFTreeApplierFunction)sub_1000096CC, v5);
}

void sub_100009750(const void *a1, uint64_t a2)
{
}

void *sub_100009764(uint64_t a1)
{
  CFStringRef v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@", a1);
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = a1 == 0;
  }
  if (v3) {
    CFStringRef v4 = v2;
  }
  else {
    CFStringRef v4 = @"<error getting string representation>";
  }
  CFIndex Length = CFStringGetLength(v4);
  CFIndex v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  CFTypeID v7 = malloc_type_malloc(v6, 0x7F6D81C0uLL);
  if (v7 && !CFStringGetCString(v4, (char *)v7, v6, 0x8000100u))
  {
    free(v7);
    return 0;
  }
  return v7;
}

void sub_100009824(char *a1, const void *a2, uint64_t a3)
{
  if (*(int *)a3 >= 1)
  {
    int v6 = 0;
    do
    {
      fputs(*(const char **)(a3 + 8), *(FILE **)(a3 + 16));
      ++v6;
    }
    while (v6 < *(_DWORD *)a3);
  }
  fputs(a1, *(FILE **)(a3 + 16));
  if (a2)
  {
    if (a1 && *a1) {
      fputc(58, *(FILE **)(a3 + 16));
    }
    CFTypeID v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID()
      || (CFTypeID v8 = CFGetTypeID(a2), v8 == CFArrayGetTypeID())
      || (CFTypeID v9 = CFGetTypeID(a2), v9 == CFTreeGetTypeID())
      || (CFTypeID v10 = CFGetTypeID(a2), v10 == CFBagGetTypeID()))
    {
      fputc(10, *(FILE **)(a3 + 16));
      v14[0] = *(_DWORD *)a3 + 1;
      v14[1] = 0;
      long long v15 = *(_OWORD *)(a3 + 8);
      sub_1000093F4(a2, v14);
    }
    else
    {
      CFStringRef v12 = (char *)sub_100009764((uint64_t)a2);
      if (a1 && *a1) {
        fputc(32, *(FILE **)(a3 + 16));
      }
      CFTypeID v13 = *(FILE **)(a3 + 16);
      if (v12)
      {
        fprintf(v13, "%s\n", v12);
        free(v12);
      }
      else
      {
        fwrite("(NULL)\n", 7uLL, 1uLL, v13);
      }
    }
  }
  else
  {
    CFIndex v11 = *(FILE **)(a3 + 16);
    fputc(10, v11);
  }
}

CFStringRef buildAggDKey(void *a1)
{
  values[0] = kFSInfoCAPrefix;
  values[1] = a1;
  CFArrayRef v1 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 2, &kCFTypeArrayCallBacks);
  return CFStringCreateByCombiningStrings(kCFAllocatorDefault, v1, @".");
}

CFNumberRef get_storage_capacity()
{
  unint64_t v6 = 0;
  values[0] = @"Device Characteristics";
  values[1] = @"Controller Characteristics";
  CFArrayRef v0 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 2, &kCFTypeArrayCallBacks);
  CFIndex v1 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v3 = i;
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v0, v1);
    if (FSDGetAdvancedInfo(ValueAtIndex, 0))
    {
      if (gCapacity) {
        break;
      }
    }
    CFIndex v1 = 1;
    if ((v3 & 1) == 0) {
      return CFNumberCreate(0, kCFNumberLongLongType, &v6);
    }
  }
  unint64_t v6 = gCapacity / 0x3B9ACA00uLL;
  return CFNumberCreate(0, kCFNumberLongLongType, &v6);
}

uint64_t FSStats_listenToLockStateChangeNotification(uint64_t result)
{
  if (&_SBSGetScreenLockStatus)
  {
    CFIndex v1 = result;
    CFStringRef v2 = (const void *)MGCopyAnswer();
    if (v2)
    {
      char v3 = v2;
      BOOL v4 = CFEqual(v2, @"AppleTV") != 0;
      CFRelease(v3);
    }
    else
    {
      BOOL v4 = 0;
    }
    uint64_t result = notify_register_dispatch(&aComAppleSpring_0[100 * v4], &dword_1000146F0, v1, &stru_1000109B0);
    if (!result)
    {
      uint64_t result = SBSGetScreenLockStatus();
      if (!result) {
        byte_1000146F4 = 0;
      }
    }
  }
  return result;
}

void sub_100009C4C(id a1, int a2)
{
  if (!(killRequested | SBSGetScreenLockStatus()))
  {
    killRequested = 1;
    byte_1000146F4 = 0;
    CFStringRef v2 = (_opaque_pthread_t *)gtid;
    if (gtid)
    {
      pthread_kill(v2, 30);
    }
  }
}

__CFDictionary *CopyFSInfo()
{
  memset(&v15, 0, sizeof(v15));
  CFTypeID v13 = 0;
  unsigned int v11 = 0;
  uint64_t v10 = 0;
  memset(&v14, 0, 512);
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  int v6 = 0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 80, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v12[2] = 0;
  v12[0] = 5;
  v12[1] = 2147485184;
  if (!getattrlist("/private/var", v12, &v10, 0xCuLL, 0))
  {
    uint64_t v9 = sub_10000A0B0(HIDWORD(v10), 3u);
    uint64_t v8 = sub_10000A0B0(v11, 3u);
    if (!statfs("/private/var", &v14))
    {
      int v1 = sub_10000A128(1);
      f_bsize_t size = v14.f_bsize;
      if (!v1) {
        HIDWORD(v7) = sub_10000A0B0((v14.f_bsize* (unint64_t)(vaddvq_s32((int32x4_t)xmmword_10001447C) + dword_10001448C)) >> 20, 2u);
      }
      int v6 = (v14.f_bfree * f_bsize) >> 20;
      LODWORD(v7) = (v14.f_blocks * f_bsize) >> 20;
    }
  }
  char v3 = CFDictionaryCreateMutable(kCFAllocatorDefault, 12, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  sub_10000A1AC(v3, @"FilesCount", &v9, kCFNumberIntType);
  sub_10000A1AC(v3, @"DirectoriesCount", &v8, kCFNumberIntType);
  sub_10000A1AC(v3, @"MetadataMB", (char *)&v7 + 4, kCFNumberIntType);
  sub_10000A1AC(v3, @"TotalFreeSize", &v6, kCFNumberIntType);
  sub_10000A1AC(v3, @"TotalSize", &v7, kCFNumberIntType);
  CFDictionarySetValue(Mutable, @"com.apple.FileSystemInfo.MiscStats", v3);
  xmmword_100014558 = 0u;
  xmmword_100014568 = 0u;
  defrag_stats = 0u;
  if (!fsctl("/private/var", 0xC0304A33uLL, &defrag_stats, 0) || !*__error())
  {
    BOOL v4 = CFDictionaryCreateMutable(kCFAllocatorDefault, 8, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sub_10000A1AC(v4, @"FxDefragBlocksReallocated", &defrag_stats, kCFNumberLongLongType);
    sub_10000A1AC(v4, @"FxDefragFextsReallocated", (char *)&defrag_stats + 8, kCFNumberLongLongType);
    sub_10000A1AC(v4, @"FxDefragFextsSkipped", &xmmword_100014558, kCFNumberLongLongType);
    sub_10000A1AC(v4, @"FxDefragChunksChosen", (char *)&xmmword_100014558 + 8, kCFNumberLongLongType);
    sub_10000A1AC(v4, @"FxDefragRuns", &xmmword_100014568, kCFNumberIntType);
    sub_10000A1AC(v4, @"FxDefragCompletions", (char *)&xmmword_100014568 + 4, kCFNumberIntType);
    sub_10000A1AC(v4, @"FxDefragDeepRuns", (char *)&xmmword_100014568 + 8, kCFNumberIntType);
    sub_10000A1AC(v4, @"FxDefragDeepCompletions", (char *)&xmmword_100014568 + 12, kCFNumberIntType);
    CFDictionarySetValue(Mutable, @"com.apple.FileSystemInfo.NANDDefragStats", v4);
  }
  killRequested = 0;
  gtid = 0;
  pthread_attr_init(&v15);
  pthread_attr_setdetachstate(&v15, 1);
  pthread_create((pthread_t *)&gtid, &v15, (void *(__cdecl *)(void *))sub_10000A22C, Mutable);
  pthread_attr_destroy(&v15);
  pthread_join((pthread_t)gtid, &v13);
  gtid = 0;
  return Mutable;
}

uint64_t sub_10000A0B0(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    long double v4 = log10((double)a1) + 1.0;
    unsigned int v5 = v4 - a2;
    if (v4 >= a2)
    {
      if (v5 > 9)
      {
        return 0;
      }
      else
      {
        unsigned int v6 = dword_10000CC08[v5];
        unsigned int v7 = v2 / v6;
        if (v2 % v6 >= v6 >> 1) {
          ++v7;
        }
        return v7 * v6;
      }
    }
  }
  return v2;
}

uint64_t sub_10000A128(int a1)
{
  *(_OWORD *)&word_100014478 = 0u;
  unk_100014538 = 0u;
  unk_100014528 = 0u;
  unk_100014518 = 0u;
  unk_100014508 = 0u;
  unk_1000144F8 = 0u;
  unk_1000144E8 = 0u;
  unk_1000144D8 = 0u;
  unk_1000144C8 = 0u;
  unk_1000144B8 = 0u;
  *(_OWORD *)&dword_1000144A8 = 0u;
  unk_100014498 = 0u;
  *(long long *)((char *)&xmmword_10001447C + 12) = 0u;
  fsinfo = a1;
  word_100014478 = 1;
  uint64_t result = fsctl("/private/var", 0xC0D4682DuLL, &fsinfo, 0);
  if (result) {
    return *__error();
  }
  return result;
}

void sub_10000A1AC(__CFDictionary *a1, const void *a2, const void *a3, CFNumberType theType)
{
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, theType, a3);
  if (a2)
  {
    CFNumberRef v7 = v6;
    if (v6)
    {
      CFDictionarySetValue(a1, a2, v6);
      CFRelease(v7);
    }
  }
}

uint64_t sub_10000A22C(__CFDictionary *a1)
{
  if (a1)
  {
    uint64_t v95 = 0;
    int v94 = 0;
    int v93 = 0;
    unint64_t v92 = 0;
    int v91 = 0;
    v90.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_10000B238;
    *(void *)&v90.sa_masuint64_t k = 0;
    sigaction(30, &v90, 0);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.FSInfo", 0);
    if (v2)
    {
      byte_1000146F4 = 1;
      object = v2;
      FSStats_listenToLockStateChangeNotification((uint64_t)v2);
      if (byte_1000146F4 == 1)
      {
        if (!sub_10000A128(2))
        {
          HIDWORD(v95) = sub_10000A0B0(xmmword_10001447C, 2u);
          LODWORD(v95) = sub_10000A0B0(DWORD1(xmmword_10001447C), 2u);
          int v94 = sub_10000A0B0(DWORD2(xmmword_10001447C), 2u);
          int v93 = sub_10000A0B0(HIDWORD(xmmword_10001447C), 2u);
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          sub_10000A1AC(Mutable, @"dataExtents", (char *)&v95 + 4, kCFNumberIntType);
          sub_10000A1AC(Mutable, @"catalogExtents", &v95, kCFNumberIntType);
          sub_10000A1AC(Mutable, @"allocationExtents", &v94, kCFNumberIntType);
          sub_10000A1AC(Mutable, @"attributeExtents", &v93, kCFNumberIntType);
          CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.MetaDataExtents", Mutable);
        }
        if (byte_1000146F4 == 1)
        {
          if (!sub_10000A128(3))
          {
            unint64_t v92 = __PAIR64__(xmmword_10001447C, DWORD1(xmmword_10001447C));
            int v91 = HIDWORD(xmmword_10001447C);
            unsigned int v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            sub_10000A1AC(v5, @"PercentFreeExtents", (char *)&v92 + 4, kCFNumberIntType);
            sub_10000A1AC(v5, @"PercentFreeCatalog", &v92, kCFNumberIntType);
            sub_10000A1AC(v5, @"PercentFreeAttributes", &v91, kCFNumberIntType);
            CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.MetaDataPercentFree", v5);
          }
          if (byte_1000146F4 == 1)
          {
            if (!sub_10000A128(11))
            {
              CFNumberRef v6 = &bucket;
              LODWORD(bucket) = sub_10000A0B0(xmmword_10001447C, 2u);
              DWORD1(bucket) = sub_10000A0B0(DWORD1(xmmword_10001447C), 2u);
              DWORD2(bucket) = sub_10000A0B0(DWORD2(xmmword_10001447C), 2u);
              HIDWORD(bucket) = sub_10000A0B0(HIDWORD(xmmword_10001447C), 2u);
              LODWORD(xmmword_100014588) = sub_10000A0B0(dword_10001448C, 2u);
              DWORD1(xmmword_100014588) = sub_10000A0B0(dword_100014490, 2u);
              CFNumberRef v7 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              uint64_t v8 = -6;
              do
              {
                snprintf(keyName, 0xFFuLL, "FilesClass%d", v8 + 7);
                sub_10000B26C(v7, v6);
                CFNumberRef v6 = (long long *)((char *)v6 + 4);
                BOOL v9 = __CFADD__(v8++, 1);
              }
              while (!v9);
              CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.FilesClass", v7);
            }
            if (byte_1000146F4 == 1)
            {
              if (!sub_10000A128(4))
              {
                uint64_t v10 = 0;
                xmmword_1000145A8 = 0u;
                unk_1000145B8 = 0u;
                xmmword_100014588 = 0u;
                *(_OWORD *)&dword_100014598 = 0u;
                bucket = 0u;
                do
                {
                  if (v10 >= 5) {
                    unsigned int v11 = 5;
                  }
                  else {
                    unsigned int v11 = v10;
                  }
                  *((_DWORD *)&bucket + v11) += fsinfo[v10++ + 2];
                }
                while (v10 != 42);
                CFStringRef v12 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                CFTypeID v13 = &bucket;
                uint64_t v14 = -6;
                do
                {
                  snprintf(keyName, 0xFFuLL, "ExtentsCount%d", v14 + 7);
                  sub_10000B26C(v12, v13);
                  CFTypeID v13 = (long long *)((char *)v13 + 4);
                  BOOL v9 = __CFADD__(v14++, 1);
                }
                while (!v9);
                CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.ExtentsCount", v12);
              }
              if (byte_1000146F4 == 1)
              {
                if (!sub_10000A128(8))
                {
                  unint64_t v15 = 0;
                  xmmword_1000145A8 = 0u;
                  unk_1000145B8 = 0u;
                  xmmword_100014588 = 0u;
                  *(_OWORD *)&dword_100014598 = 0u;
                  bucket = 0u;
                  do
                  {
                    uint64_t v16 = v15 >> 1;
                    if (v15 >= 0xC) {
                      uint64_t v16 = 5;
                    }
                    *((_DWORD *)&bucket + v16) += fsinfo[v15++ + 2];
                  }
                  while (v15 != 51);
                  CFStringEncoding v17 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                  CFStringRef v18 = &bucket;
                  uint64_t v19 = -6;
                  do
                  {
                    snprintf(keyName, 0xFFuLL, "NameSize%d", v19 + 7);
                    sub_10000B26C(v17, v18);
                    CFStringRef v18 = (long long *)((char *)v18 + 4);
                    BOOL v9 = __CFADD__(v19++, 1);
                  }
                  while (!v9);
                  CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.NameSize", v17);
                }
                if (byte_1000146F4 == 1)
                {
                  if (!sub_10000A128(9))
                  {
                    uint64_t v20 = 0;
                    xmmword_1000145A8 = 0u;
                    unk_1000145B8 = 0u;
                    xmmword_100014588 = 0u;
                    *(_OWORD *)&dword_100014598 = 0u;
                    bucket = 0u;
                    do
                    {
                      if (v20 >= 8) {
                        unsigned int v21 = 8;
                      }
                      else {
                        unsigned int v21 = v20;
                      }
                      *((_DWORD *)&bucket + v21) += fsinfo[v20++ + 2];
                    }
                    while (v20 != 42);
                    unsigned int v22 = CFDictionaryCreateMutable(kCFAllocatorDefault, 9, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                    CFTypeID v23 = &bucket;
                    uint64_t v24 = -9;
                    do
                    {
                      snprintf(keyName, 0xFFuLL, "XattrSize%d", v24 + 10);
                      sub_10000B26C(v22, v23);
                      CFTypeID v23 = (long long *)((char *)v23 + 4);
                      BOOL v9 = __CFADD__(v24++, 1);
                    }
                    while (!v9);
                    CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.XattrSize", v22);
                  }
                  if (byte_1000146F4 == 1)
                  {
                    if (!sub_10000A128(12))
                    {
                      unint64_t v25 = 0;
                      int v26 = 0;
                      int v27 = 0;
                      int v28 = 0;
                      int v29 = 0;
                      int v30 = 0;
                      xmmword_1000145A8 = 0u;
                      unk_1000145B8 = 0u;
                      xmmword_100014588 = 0u;
                      *(_OWORD *)&dword_100014598 = 0u;
                      bucket = 0u;
                      do
                      {
                        if (v25 > 3)
                        {
                          if (v25 == 4)
                          {
                            v29 += dword_10001448C;
                            DWORD1(bucket) = v29;
                          }
                          else if (v25 > 5)
                          {
                            if (v25 == 6)
                            {
                              v27 += dword_100014494;
                              HIDWORD(bucket) = v27;
                            }
                            else
                            {
                              v26 += fsinfo[v25 + 2];
                              LODWORD(xmmword_100014588) = v26;
                            }
                          }
                          else
                          {
                            v28 += dword_100014490;
                            DWORD2(bucket) = v28;
                          }
                        }
                        else
                        {
                          v30 += fsinfo[v25 + 2];
                          LODWORD(bucket) = v30;
                        }
                        ++v25;
                      }
                      while (v25 != 42);
                      CFStringRef v31 = CFDictionaryCreateMutable(kCFAllocatorDefault, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                      CFStringRef v32 = &bucket;
                      uint64_t v33 = -5;
                      do
                      {
                        snprintf(keyName, 0xFFuLL, "SymLinkSize%d", v33 + 6);
                        sub_10000B26C(v31, v32);
                        CFStringRef v32 = (long long *)((char *)v32 + 4);
                        BOOL v9 = __CFADD__(v33++, 1);
                      }
                      while (!v9);
                      CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.SymLinkSize", v31);
                    }
                    if (byte_1000146F4 == 1)
                    {
                      if (!sub_10000A128(7))
                      {
                        uint64_t v34 = 0;
                        xmmword_1000145A8 = 0u;
                        unk_1000145B8 = 0u;
                        xmmword_100014588 = 0u;
                        *(_OWORD *)&dword_100014598 = 0u;
                        bucket = 0u;
                        do
                        {
                          if (v34 >= 9) {
                            unsigned int v35 = 9;
                          }
                          else {
                            unsigned int v35 = v34;
                          }
                          *((_DWORD *)&bucket + v35) += fsinfo[v34++ + 2];
                        }
                        while (v34 != 42);
                        CFTypeID v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 10, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                        sqlite3_int64 v37 = &bucket;
                        uint64_t v38 = -10;
                        do
                        {
                          snprintf(keyName, 0xFFuLL, "Valence%d", v38 + 11);
                          sub_10000B26C(v36, v37);
                          CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.Valence", v36);
                          sqlite3_int64 v37 = (long long *)((char *)v37 + 4);
                          BOOL v9 = __CFADD__(v38++, 1);
                        }
                        while (!v9);
                      }
                      if (byte_1000146F4 == 1)
                      {
                        if (!sub_10000A128(5))
                        {
                          unint64_t v39 = 0;
                          int v40 = 0;
                          int v41 = 0;
                          int v42 = 0;
                          int v43 = 0;
                          int v44 = 0;
                          int v45 = 0;
                          xmmword_1000145A8 = 0u;
                          unk_1000145B8 = 0u;
                          xmmword_100014588 = 0u;
                          *(_OWORD *)&dword_100014598 = 0u;
                          bucket = 0u;
                          do
                          {
                            CFStringRef v46 = &fsinfo[v39];
                            if (v39 > 0xC)
                            {
                              if (v39 > 0xE)
                              {
                                if (v39 > 0x11)
                                {
                                  if (v39 > 0x14)
                                  {
                                    int v47 = v46[2];
                                    if (v39 > 0x1C)
                                    {
                                      v40 += v47;
                                      DWORD1(xmmword_100014588) = v40;
                                    }
                                    else
                                    {
                                      v41 += v47;
                                      LODWORD(xmmword_100014588) = v41;
                                    }
                                  }
                                  else
                                  {
                                    v42 += v46[2];
                                    HIDWORD(bucket) = v42;
                                  }
                                }
                                else
                                {
                                  v43 += v46[2];
                                  DWORD2(bucket) = v43;
                                }
                              }
                              else
                              {
                                v44 += v46[2];
                                DWORD1(bucket) = v44;
                              }
                            }
                            else
                            {
                              v45 += v46[2];
                              LODWORD(bucket) = v45;
                            }
                            ++v39;
                          }
                          while (v39 != 42);
                          CFTypeID v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                          CFStringEncoding v49 = &bucket;
                          uint64_t v50 = -6;
                          do
                          {
                            snprintf(keyName, 0xFFuLL, "ExtentsSize%d", v50 + 7);
                            sub_10000B26C(v48, v49);
                            CFStringEncoding v49 = (long long *)((char *)v49 + 4);
                            BOOL v9 = __CFADD__(v50++, 1);
                          }
                          while (!v9);
                          CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.ExtentsSize", v48);
                        }
                        if (byte_1000146F4 == 1)
                        {
                          int v51 = sub_10000A128(6);
                          if (!v51)
                          {
                            unint64_t v52 = 0;
                            int v53 = 0;
                            int v54 = 0;
                            uint64_t v83 = 0;
                            int v82 = 0;
                            uint64_t v86 = 0;
                            int v55 = 0;
                            int v56 = 0;
                            int v57 = 0;
                            int v58 = 0;
                            int v59 = 0;
                            int v60 = 0;
                            int v61 = 0;
                            xmmword_1000145A8 = 0u;
                            unk_1000145B8 = 0u;
                            xmmword_100014588 = 0u;
                            *(_OWORD *)&dword_100014598 = 0u;
                            bucket = 0u;
                            do
                            {
                              if (v52 == 1)
                              {
                                v53 += DWORD1(xmmword_10001447C);
                                DWORD1(bucket) = v53;
                              }
                              else if (v52)
                              {
                                if (v52 > 2)
                                {
                                  if (v52 > 4)
                                  {
                                    if (v52 == 5)
                                    {
                                      v59 += dword_100014490;
                                      LODWORD(xmmword_100014588) = v59;
                                    }
                                    else if (v52 > 6)
                                    {
                                      if (v52 == 7)
                                      {
                                        v57 += unk_100014498;
                                        DWORD2(xmmword_100014588) = v57;
                                      }
                                      else if (v52 > 8)
                                      {
                                        if (v52 == 9)
                                        {
                                          v56 += unk_1000144A0;
                                          dword_100014598 = v56;
                                        }
                                        else if (v52 > 0xA)
                                        {
                                          if (v52 == 11)
                                          {
                                            HIDWORD(v86) += dword_1000144A8;
                                            dword_1000145A0 = HIDWORD(v86);
                                          }
                                          else if (v52 > 0xC)
                                          {
                                            long long v62 = &fsinfo[v52];
                                            if (v52 > 0xF)
                                            {
                                              int v63 = v62[2];
                                              if (v52 > 0x11)
                                              {
                                                LODWORD(v83) = v83 + v63;
                                                DWORD2(xmmword_1000145A8) = v83;
                                              }
                                              else
                                              {
                                                v82 += v63;
                                                DWORD1(xmmword_1000145A8) = v82;
                                              }
                                            }
                                            else
                                            {
                                              HIDWORD(v83) += v62[2];
                                              LODWORD(xmmword_1000145A8) = HIDWORD(v83);
                                            }
                                          }
                                          else
                                          {
                                            LODWORD(v86) = v86 + dword_1000144AC;
                                            dword_1000145A4 = v86;
                                          }
                                        }
                                        else
                                        {
                                          v55 += dword_1000144A4;
                                          dword_10001459C = v55;
                                        }
                                      }
                                      else
                                      {
                                        v51 += dword_10001449C;
                                        HIDWORD(xmmword_100014588) = v51;
                                      }
                                    }
                                    else
                                    {
                                      v58 += dword_100014494;
                                      DWORD1(xmmword_100014588) = v58;
                                    }
                                  }
                                  else
                                  {
                                    v60 += fsinfo[v52 + 2];
                                    HIDWORD(bucket) = v60;
                                  }
                                }
                                else
                                {
                                  v61 += DWORD2(xmmword_10001447C);
                                  DWORD2(bucket) = v61;
                                }
                              }
                              else
                              {
                                v54 += xmmword_10001447C;
                                LODWORD(bucket) = v54;
                              }
                              ++v52;
                            }
                            while (v52 != 42);
                            long long v64 = CFDictionaryCreateMutable(kCFAllocatorDefault, 15, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                            long long v65 = &bucket;
                            uint64_t v66 = -15;
                            do
                            {
                              snprintf(keyName, 0xFFuLL, "FileSize%d", v66 + 16);
                              sub_10000B26C(v64, v65);
                              long long v65 = (long long *)((char *)v65 + 4);
                              BOOL v9 = __CFADD__(v66++, 1);
                            }
                            while (!v9);
                            CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.FileSize", v64);
                          }
                          if (byte_1000146F4 == 1)
                          {
                            int v67 = sub_10000A128(10);
                            if (!v67)
                            {
                              unint64_t v68 = 0;
                              int v69 = 0;
                              int v70 = 0;
                              int v84 = 0;
                              int v85 = 0;
                              uint64_t v87 = 0;
                              int v88 = 0;
                              int v71 = 0;
                              int v72 = 0;
                              int v73 = 0;
                              int v74 = 0;
                              int v75 = 0;
                              int v76 = 0;
                              int v77 = 0;
                              xmmword_1000145A8 = 0u;
                              unk_1000145B8 = 0u;
                              xmmword_100014588 = 0u;
                              *(_OWORD *)&dword_100014598 = 0u;
                              bucket = 0u;
                              do
                              {
                                if (v68 == 1)
                                {
                                  v69 += DWORD1(xmmword_10001447C);
                                  DWORD1(bucket) = v69;
                                }
                                else if (v68)
                                {
                                  if (v68 > 2)
                                  {
                                    if (v68 == 3)
                                    {
                                      v76 += HIDWORD(xmmword_10001447C);
                                      HIDWORD(bucket) = v76;
                                    }
                                    else if (v68 > 4)
                                    {
                                      if (v68 == 5)
                                      {
                                        v74 += dword_100014490;
                                        DWORD1(xmmword_100014588) = v74;
                                      }
                                      else if (v68 > 6)
                                      {
                                        if (v68 > 8)
                                        {
                                          if (v68 > 0xA)
                                          {
                                            if (v68 == 11)
                                            {
                                              v71 += dword_1000144A8;
                                              dword_10001459C = v71;
                                            }
                                            else if (v68 > 0xD)
                                            {
                                              if (v68 > 0xF)
                                              {
                                                if (v68 == 16)
                                                {
                                                  LODWORD(v87) = v87 + dword_1000144BC;
                                                  LODWORD(xmmword_1000145A8) = v87;
                                                }
                                                else
                                                {
                                                  int v78 = fsinfo[v68 + 2];
                                                  if (v68 > 0x12)
                                                  {
                                                    v85 += v78;
                                                    DWORD2(xmmword_1000145A8) = v85;
                                                  }
                                                  else
                                                  {
                                                    v84 += v78;
                                                    DWORD1(xmmword_1000145A8) = v84;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                HIDWORD(v87) += fsinfo[v68 + 2];
                                                dword_1000145A4 = HIDWORD(v87);
                                              }
                                            }
                                            else
                                            {
                                              v88 += fsinfo[v68 + 2];
                                              dword_1000145A0 = v88;
                                            }
                                          }
                                          else
                                          {
                                            v72 += fsinfo[v68 + 2];
                                            dword_100014598 = v72;
                                          }
                                        }
                                        else
                                        {
                                          v67 += fsinfo[v68 + 2];
                                          HIDWORD(xmmword_100014588) = v67;
                                        }
                                      }
                                      else
                                      {
                                        v73 += dword_100014494;
                                        DWORD2(xmmword_100014588) = v73;
                                      }
                                    }
                                    else
                                    {
                                      v75 += dword_10001448C;
                                      LODWORD(xmmword_100014588) = v75;
                                    }
                                  }
                                  else
                                  {
                                    v77 += DWORD2(xmmword_10001447C);
                                    DWORD2(bucket) = v77;
                                  }
                                }
                                else
                                {
                                  v70 += xmmword_10001447C;
                                  LODWORD(bucket) = v70;
                                }
                                ++v68;
                              }
                              while (v68 != 42);
                              v79 = CFDictionaryCreateMutable(kCFAllocatorDefault, 15, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                              v80 = &bucket;
                              uint64_t v81 = -15;
                              do
                              {
                                snprintf(keyName, 0xFFuLL, "FreeExtentSize%d", v81 + 16);
                                sub_10000B26C(v79, v80);
                                v80 = (long long *)((char *)v80 + 4);
                                BOOL v9 = __CFADD__(v81++, 1);
                              }
                              while (!v9);
                              CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.FreeExtentSize", v79);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      notify_cancel(dword_1000146F0);
      dispatch_release(object);
      pthread_exit(0);
    }
  }
  return 0;
}

void sub_10000B238()
{
  unsigned int v0 = pthread_self();
  syslog(5, "SIGUSR1 received by TID(%u)\n", v0);
}

void sub_10000B26C(__CFDictionary *a1, const void *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, keyName, 0x8000100u);
  if (v4)
  {
    CFStringRef v5 = v4;
    sub_10000A1AC(a1, v4, a2, kCFNumberIntType);
    CFRelease(v5);
  }
}

void sub_10000B2F8()
{
  sub_100003D90();
  if (sub_100003DB4())
  {
    sub_100003DA8();
    sub_100003D70((void *)&_mh_execute_header, v0, v1, "IOCS: failed to set context for inbound notifications on the mach port. Error = %d", v2, v3, v4, v5, v6);
  }
}

void sub_10000B384()
{
  sub_100003D90();
  if (sub_100003DB4())
  {
    sub_100003DA8();
    sub_100003D70((void *)&_mh_execute_header, v0, v1, "IOCS: failed to bind host special port. Error = %d", v2, v3, v4, v5, v6);
  }
}

void sub_10000B410()
{
  sub_100003D90();
  if (sub_100003DB4())
  {
    sub_100003DA8();
    sub_100003D70((void *)&_mh_execute_header, v0, v1, "IOCS: failed to insert send right. Error = %d", v2, v3, v4, v5, v6);
  }
}

void sub_10000B49C()
{
  sub_100003D90();
  if (sub_100003DB4())
  {
    sub_100003DA8();
    sub_100003D70((void *)&_mh_execute_header, v0, v1, "IOCS: failed to allocate a mach port. Error = %d", v2, v3, v4, v5, v6);
  }
}

void sub_10000B528()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: Sucessfully opened IOCSdb", v2, v3, v4, v5, v6);
}

void sub_10000B55C(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2080;
  uint64_t v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IOCS: Failed to enable WAL for IOCSdb - %d %s\n", (uint8_t *)v4, 0x12u);
}

void sub_10000B5E8()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: Failed to DELETE", v2, v3, v4, v5, v6);
}

void sub_10000B61C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IOCSdb: error reading bufferSizeCompressionDist\n", buf, 2u);
}

void sub_10000B65C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IOCSdb: error reading blockCompressedSizeDist\n", buf, 2u);
}

void sub_10000B69C()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: SQL Create table failed.\n", v2, v3, v4, v5, v6);
}

void sub_10000B6D0()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: SQL Database open failed.\n", v2, v3, v4, v5, v6);
}

void sub_10000B704()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: fileExtension malloc failed", v2, v3, v4, v5, v6);
}

void sub_10000B738()
{
  sqlite3_errmsg((sqlite3 *)qword_1000146E0);
  sub_100005A28();
  sub_100005A4C((void *)&_mh_execute_header, v0, v1, "IOCS: SQL table failed to read: %d %s\n", v2, v3, v4, v5, v6);
}

void sub_10000B7BC()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: Unable to read vfs.io_compression_stats_enable\n", v2, v3, v4, v5, v6);
}

void sub_10000B7F0()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: com.apple.da IOCompressionStats not available\n", v2, v3, v4, v5, v6);
}

void sub_10000B824()
{
  sub_100005A40();
  sub_100005A0C((void *)&_mh_execute_header, v0, v1, "IOCS: Failed to enabled IOCS collection\n", v2, v3, v4, v5, v6);
}

void sub_10000B858()
{
  sqlite3_errmsg((sqlite3 *)qword_1000146E0);
  sub_100005A28();
  sub_100005A4C((void *)&_mh_execute_header, v0, v1, "IOCS: table insert failure: %d %s\n", v2, v3, v4, v5, v6);
}

void sub_10000B8DC()
{
  sqlite3_errmsg((sqlite3 *)qword_1000146E0);
  sub_100005A28();
  sub_100005A4C((void *)&_mh_execute_header, v0, v1, "IOCS: SQL table Insert failure: %d %s\n", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void *context)
{
}

CFTypeID CFBagGetTypeID(void)
{
  return _CFBagGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return _CFBundleCopyLocalizedStringForLocalization();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return _CFCopyTypeIDDescription(type_id);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return _CFNumberGetType(number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return _CFStringCreateByCombiningStrings(alloc, theArray, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CFTreeApplyFunctionToChildren(CFTreeRef tree, CFTreeApplierFunction applier, void *context)
{
}

void CFTreeGetContext(CFTreeRef tree, CFTreeContext *context)
{
}

CFTypeID CFTreeGetTypeID(void)
{
  return _CFTreeGetTypeID();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

uint64_t CRIsAppleInternal()
{
  return _CRIsAppleInternal();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t OSAGetDATaskingValue()
{
  return _OSAGetDATaskingValue();
}

uint64_t PLQueryRegistered()
{
  return _PLQueryRegistered();
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

kern_return_t host_set_special_port(host_priv_t host_priv, int which, mach_port_t port)
{
  return _host_set_special_port(host_priv, which, port);
}

long double log10(long double __x)
{
  return _log10(__x);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server_once(a1, a2, a3, a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_set_context(ipc_space_t task, mach_port_name_t name, mach_port_context_t context)
{
  return _mach_port_set_context(task, name, context);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_kill(pthread_t a1, int a2)
{
  return _pthread_kill(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_data_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_data_count(pStmt);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return _sqlite3_file_control(a1, zDbName, op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void warnx(const char *a1, ...)
{
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__cfBundle(void *a1, const char *a2, ...)
{
  return [a1 _cfBundle];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return [a1 groupContainerURLs];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}