void sub_2142840E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  NSObject *OSLog;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    OSLog = W5GetOSLog();
    if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    objc_end_catch();
    JUMPOUT(0x2142840B0);
  }
  _Unwind_Resume(exception_object);
}

void sub_214284E50(_Unwind_Exception *a1)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_214285530(_Unwind_Exception *a1)
{
}

void sub_214285A60(void *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    objc_begin_catch(a1);
    JUMPOUT(0x214285980);
  }
  JUMPOUT(0x214285A90);
}

void sub_21428630C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21428664C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21428698C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t W5GetOSLog()
{
  if (qword_26AB09F50 != -1) {
    dispatch_once(&qword_26AB09F50, &__block_literal_global);
  }
  return _MergedGlobals;
}

uint64_t W5CreateTarball(void *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v31 = 0;
  memset(&v30, 0, sizeof(v30));
  stat((const char *)objc_msgSend((id)objc_msgSend(a1, "path"), "UTF8String"), &v30);
  if (qword_26AB09F50 != -1) {
    dispatch_once(&qword_26AB09F50, &__block_literal_global);
  }
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [a1 path];
    off_t st_size = v30.st_size;
    uint64_t v8 = [a2 path];
    int v38 = 136316418;
    v39 = "W5CreateTarball";
    __int16 v40 = 2080;
    v41 = "W5MiscUtil.m";
    __int16 v42 = 1024;
    int v43 = 388;
    __int16 v44 = 2114;
    uint64_t v45 = v6;
    __int16 v46 = 2048;
    off_t v47 = st_size;
    __int16 v48 = 2114;
    uint64_t v49 = v8;
    LODWORD(v29) = 58;
    v28 = &v38;
    _os_log_send_and_compose_impl();
  }
  uint64_t v9 = archive_write_new();
  if (!v9)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08438];
    uint64_t v36 = *MEMORY[0x263F08338];
    v37 = @"ENOMEM";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v17 = v14;
    uint64_t v18 = v15;
    uint64_t v19 = 12;
LABEL_17:
    id v31 = (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16, v28, v29);
    goto LABEL_18;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a1, "path")) & 1) == 0)
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08438];
    uint64_t v34 = *MEMORY[0x263F08338];
    v35 = @"ENOENT";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v17 = v20;
    uint64_t v18 = v21;
    uint64_t v19 = 2;
    goto LABEL_17;
  }
  archive_write_add_filter_gzip();
  archive_write_set_format_pax();
  objc_msgSend((id)objc_msgSend(a2, "path"), "UTF8String");
  int v10 = archive_write_open_filename();
  if (v10)
  {
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08438];
    uint64_t v24 = v10;
    uint64_t v32 = *MEMORY[0x263F08338];
    v33 = @"err";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v17 = v22;
    uint64_t v18 = v23;
    uint64_t v19 = v24;
    goto LABEL_17;
  }
  if (__W5ArchiveAddURLToArchive(v9, a1, objc_msgSend((id)objc_msgSend(a2, "lastPathComponent"), "stringByDeletingPathExtension"), &v31))
  {
    if (qword_26AB09F50 != -1) {
      dispatch_once(&qword_26AB09F50, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [a1 path];
      uint64_t v12 = [a2 path];
      int v38 = 136316162;
      v39 = "W5CreateTarball";
      __int16 v40 = 2080;
      v41 = "W5MiscUtil.m";
      __int16 v42 = 1024;
      int v43 = 412;
      __int16 v44 = 2114;
      uint64_t v45 = v11;
      __int16 v46 = 2114;
      off_t v47 = v12;
      uint64_t v13 = 1;
      _os_log_send_and_compose_impl();
    }
    else
    {
      uint64_t v13 = 1;
    }
    goto LABEL_22;
  }
LABEL_18:
  if (qword_26AB09F50 != -1) {
    dispatch_once(&qword_26AB09F50, &__block_literal_global);
  }
  uint64_t v13 = 0;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [a2 path];
    uint64_t v26 = [v31 code];
    v39 = "W5CreateTarball";
    __int16 v40 = 2080;
    int v38 = 136316162;
    v41 = "W5MiscUtil.m";
    __int16 v42 = 1024;
    int v43 = 408;
    __int16 v44 = 2114;
    uint64_t v45 = v25;
    __int16 v46 = 2048;
    off_t v47 = v26;
    _os_log_send_and_compose_impl();
    uint64_t v13 = 0;
  }
LABEL_22:
  if (a3 && v31) {
    *a3 = v31;
  }
  if (v9) {
    archive_write_free();
  }
  return v13;
}

uint64_t __W5ArchiveAddURLToArchive(uint64_t a1, void *a2, void *a3, id *a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v40 = 0;
  uint64_t v8 = (void *)MEMORY[0x21669CC20]();
  if (![a2 checkResourceIsReachableAndReturnError:&v40]) {
    goto LABEL_33;
  }
  id v39 = 0;
  if (![a2 getResourceValue:&v39 forKey:*MEMORY[0x263EFF6A8] error:&v40]) {
    goto LABEL_33;
  }
  if ([v39 BOOLValue])
  {
    memset(&v51, 0, sizeof(v51));
    stat((const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "UTF8String"), &v51);
    if (qword_26AB09F50 != -1) {
      dispatch_once(&qword_26AB09F50, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [a2 path];
      *(void *)&v42[4] = "__W5ArchiveAddURLToArchive";
      __int16 v43 = 2080;
      *(_DWORD *)__int16 v42 = 136316162;
      __int16 v44 = "W5MiscUtil.m";
      __int16 v45 = 1024;
      int v46 = 341;
      __int16 v47 = 2114;
      uint64_t v48 = v9;
      __int16 v49 = 2048;
      off_t st_size = v51.st_size;
      LODWORD(v30) = 48;
      v28 = v42;
      _os_log_send_and_compose_impl();
    }
    int v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager", v28, v30), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a2, 0, 0, &v40);
    if (v10)
    {
      uint64_t v11 = v10;
      v33 = a4;
      uint64_t v12 = v8;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v13 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v36;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
            id v34 = 0;
            if ((__W5ArchiveAddURLToArchive(a1, v17, objc_msgSend(a3, "stringByAppendingPathComponent:", objc_msgSend(v17, "lastPathComponent", v29, v31)), &v34) & 1) == 0)
            {
              if (qword_26AB09F50 != -1) {
                dispatch_once(&qword_26AB09F50, &__block_literal_global);
              }
              if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v32 = [a2 path];
                uint64_t v18 = [v34 code];
                *(_DWORD *)__int16 v42 = 136316162;
                *(void *)&v42[4] = "__W5ArchiveAddURLToArchive";
                __int16 v43 = 2080;
                __int16 v44 = "W5MiscUtil.m";
                __int16 v45 = 1024;
                int v46 = 351;
                __int16 v47 = 2114;
                uint64_t v48 = v32;
                __int16 v49 = 2048;
                off_t st_size = v18;
                LODWORD(v31) = 48;
                uint64_t v29 = v42;
                _os_log_send_and_compose_impl();
              }
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v19 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
          uint64_t v14 = v19;
        }
        while (v19);
      }
      uint64_t v20 = 1;
      uint64_t v8 = v12;
      a4 = v33;
      goto LABEL_25;
    }
    if (qword_26AB09F50 != -1) {
      dispatch_once(&qword_26AB09F50, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [a2 path];
      uint64_t v25 = [v40 code];
      *(void *)&v42[4] = "__W5ArchiveAddURLToArchive";
      __int16 v43 = 2080;
      *(_DWORD *)__int16 v42 = 136316162;
      __int16 v44 = "W5MiscUtil.m";
      __int16 v45 = 1024;
      int v46 = 344;
      __int16 v47 = 2114;
      uint64_t v48 = v24;
      __int16 v49 = 2048;
      off_t st_size = v25;
      _os_log_send_and_compose_impl();
    }
LABEL_33:
    uint64_t v20 = 0;
    goto LABEL_25;
  }
  *(void *)__int16 v42 = 0;
  if ((__W5ArchiveAddFileURLToArchive() & 1) == 0)
  {
    if (qword_26AB09F50 != -1) {
      dispatch_once(&qword_26AB09F50, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [a2 path];
      uint64_t v27 = [*(id *)v42 code];
      *(void *)&v51.st_mode = "__W5ArchiveAddURLToArchive";
      WORD2(v51.st_ino) = 2080;
      v51.st_dev = 136316162;
      *(__darwin_ino64_t *)((char *)&v51.st_ino + 6) = (__darwin_ino64_t)"W5MiscUtil.m";
      HIWORD(v51.st_gid) = 1024;
      v51.st_rdev = 359;
      *((_WORD *)&v51.st_rdev + 2) = 2114;
      *(void *)((char *)&v51.st_rdev + 6) = v26;
      HIWORD(v51.st_atimespec.tv_sec) = 2048;
      v51.st_atimespec.tv_nsec = v27;
      _os_log_send_and_compose_impl();
    }
  }
  uint64_t v20 = 1;
LABEL_25:
  id v21 = v40;
  id v22 = v40;
  if (a4 && v40) {
    *a4 = v40;
  }
  return v20;
}

uint64_t W5DescriptionForPeerDiscoveryFlags(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x263F089D8] string];
  v3 = v2;
  if (a1) {
    [v2 appendString:@"Rapport "];
  }
  if (![v3 length]) {
    return objc_msgSend(NSString, "stringWithFormat:", @"? (%lu)", a1);
  }
  uint64_t v4 = [v3 length] - 1;
  return objc_msgSend(v3, "substringWithRange:", 0, v4);
}

uint64_t W5DescriptionForPeerControlFlags(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x263F089D8] string];
  v3 = v2;
  if (a1) {
    [v2 appendString:@"ForceBLE "];
  }
  if (![v3 length]) {
    return objc_msgSend(NSString, "stringWithFormat:", @"? (%lu)", a1);
  }
  uint64_t v4 = [v3 length] - 1;
  return objc_msgSend(v3, "substringWithRange:", 0, v4);
}

os_log_t __W5GetOSLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.wifivelocity", "");
  _MergedGlobals = (uint64_t)result;
  return result;
}

uint64_t W5NSDateToISO8601Description(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F088C0];
  uint64_t v3 = [MEMORY[0x263EFFA18] systemTimeZone];
  return [v2 stringFromDate:a1 timeZone:v3 formatOptions:1907];
}

uint64_t __W5ArchiveAddFileURLToArchive()
{
  MEMORY[0x270FA5388]();
  v1 = v0;
  uint64_t v3 = v2;
  v5 = v4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  memset(&v32, 0, sizeof(v32));
  stat((const char *)objc_msgSend((id)objc_msgSend(v4, "path"), "UTF8String"), &v32);
  if (qword_26AB09F50 != -1) {
    dispatch_once(&qword_26AB09F50, &__block_literal_global);
  }
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v5 path];
    v41 = "__W5ArchiveAddFileURLToArchive";
    __int16 v42 = 2080;
    *(_DWORD *)buf = 136316162;
    *(void *)__int16 v43 = "W5MiscUtil.m";
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)&v43[10] = 276;
    *(_WORD *)&v43[14] = 2114;
    *(void *)&v43[16] = v6;
    __int16 v44 = 2048;
    off_t st_size = v32.st_size;
    LODWORD(v31) = 48;
    uint64_t v30 = buf;
    _os_log_send_and_compose_impl();
  }
  uint64_t v7 = archive_entry_new();
  if (v7)
  {
    archive_entry_copy_stat();
    [v3 UTF8String];
    archive_entry_set_pathname();
    archive_entry_set_perm();
    int v8 = archive_write_header();
    if (v8)
    {
      int v20 = v8;
      uint64_t v21 = *MEMORY[0x263F08438];
      uint64_t v36 = *MEMORY[0x263F08338];
      long long v37 = @"err";
      uint64_t v22 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v21, v8, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [v3 UTF8String];
        uint64_t v24 = archive_error_string();
        *(_DWORD *)buf = 136446722;
        v41 = (const char *)v23;
        __int16 v42 = 1026;
        *(_DWORD *)__int16 v43 = v20;
        *(_WORD *)&v43[4] = 2082;
        *(void *)&v43[6] = v24;
        _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] archive_write_header() FAILED for %{public}s, returned %{public}d (%{public}s)", buf, 0x1Cu);
      }
      goto LABEL_21;
    }
    int v9 = open((const char *)objc_msgSend((id)objc_msgSend(v5, "path"), "UTF8String"), 0);
    if ((v9 & 0x80000000) == 0)
    {
      int v10 = v9;
      if (read(v9, v33, 0x2000uLL) < 1)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = [v3 UTF8String];
          *(_DWORD *)buf = 136446210;
          v41 = (const char *)v29;
          _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] Unexpected zero-length file encountered for %{public}s", buf, 0xCu);
        }
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        do
          v11 += archive_write_data();
        while (read(v10, v33, 0x2000uLL) > 0);
      }
      close(v10);
      if (v11 != v32.st_size && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = [v3 UTF8String];
        *(_DWORD *)buf = 136446722;
        v41 = (const char *)v28;
        __int16 v42 = 2050;
        *(void *)__int16 v43 = v32.st_size;
        *(_WORD *)&v43[8] = 2050;
        *(void *)&v43[10] = v11;
        _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] Bytes written does not equal file size (file='%{public}s', size=%{public}lld, written=%{public}zd)", buf, 0x20u);
      }
      uint64_t v12 = 1;
      goto LABEL_13;
    }
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08438];
    uint64_t v27 = *__error();
    uint64_t v34 = *MEMORY[0x263F08338];
    long long v35 = @"errno";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v17 = v25;
    uint64_t v18 = v26;
    uint64_t v19 = v27;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08438];
    uint64_t v38 = *MEMORY[0x263F08338];
    id v39 = @"ENOMEM";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v17 = v14;
    uint64_t v18 = v15;
    uint64_t v19 = 12;
  }
  uint64_t v22 = objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16, v30, v31);
LABEL_21:
  uint64_t v12 = 0;
  if (v1 && v22)
  {
    uint64_t v12 = 0;
    uint64_t *v1 = v22;
  }
LABEL_13:
  if (v7) {
    archive_entry_free();
  }
  return v12;
}

void *W5XPCRequestDelegateInterface()
{
  v0 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C511900];
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startBrowsingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopBrowsingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startAdvertisingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopAdvertisingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startMonitoringEvents_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopMonitoringEvents_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryPeerCacheAndReply_, 0, 1);
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0), sel_queryPeerCacheAndReply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryLocalPeerAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryLocalPeerAndReply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryStatusForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryStatusForPeer_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryStatusForPeer_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 0, 1);
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 1, 1);
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 0, 0);
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 0, 1);
  uint64_t v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 1, 1);
  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 0, 0);
  v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 1, 0);
  uint64_t v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 3, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 0, 1);
  uint64_t v25 = (void *)MEMORY[0x263EFFA08];
  uint64_t v26 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_registerRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 0);
  uint64_t v27 = (void *)MEMORY[0x263EFFA08];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, objc_opt_class(), 0), sel_registerRemoteDiagnosticEventsForPeer_configuration_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_registerRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 0);
  stat v32 = (void *)MEMORY[0x263EFFA08];
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v32, "setWithObjects:", v33, v34, v35, v36, objc_opt_class(), 0), sel_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryRegisteredDiagnosticsPeersWithReply_, 0, 1);
  long long v37 = (void *)MEMORY[0x263EFFA08];
  uint64_t v38 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0), sel_queryRegisteredDiagnosticsPeersWithReply_, 1, 1);
  id v39 = (void *)MEMORY[0x263EFFA08];
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, v44, v45, objc_opt_class(), 0), sel_startDiagnosticsModeWithConfiguration_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startDiagnosticsModeWithConfiguration_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startDiagnosticsModeWithConfiguration_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopDiagnosticsModeWithUUID_info_reply_, 0, 0);
  uint64_t v46 = (void *)MEMORY[0x263EFFA08];
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v46, "setWithObjects:", v47, v48, v49, v50, v51, v52, objc_opt_class(), 0), sel_stopDiagnosticsModeWithUUID_info_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopDiagnosticsModeWithUUID_info_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 0, 0);
  v53 = (void *)MEMORY[0x263EFFA08];
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v53, "setWithObjects:", v54, v55, v56, objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 0, 1);
  v57 = (void *)MEMORY[0x263EFFA08];
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v60 = objc_opt_class();
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v57, "setWithObjects:", v58, v59, v60, v61, v62, objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryDebugConfigurationForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryDebugConfigurationForPeer_reply_, 0, 1);
  v63 = (void *)MEMORY[0x263EFFA08];
  uint64_t v64 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0), sel_queryDebugConfigurationForPeer_reply_, 1, 1);
  v65 = (void *)MEMORY[0x263EFFA08];
  uint64_t v66 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0), sel_setDebugConfiguration_peer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_setDebugConfiguration_peer_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_setDebugConfiguration_peer_reply_, 0, 1);
  v67 = (void *)MEMORY[0x263EFFA08];
  uint64_t v68 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 0, 0);
  v69 = (void *)MEMORY[0x263EFFA08];
  uint64_t v70 = objc_opt_class();
  uint64_t v71 = objc_opt_class();
  uint64_t v72 = objc_opt_class();
  uint64_t v73 = objc_opt_class();
  uint64_t v74 = objc_opt_class();
  uint64_t v75 = objc_opt_class();
  uint64_t v76 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v69, "setWithObjects:", v70, v71, v72, v73, v74, v75, v76, objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 0, 1);
  v77 = (void *)MEMORY[0x263EFFA08];
  uint64_t v78 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v77, "setWithObjects:", v78, objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 2, 1);
  v79 = (void *)MEMORY[0x263EFFA08];
  uint64_t v80 = objc_opt_class();
  uint64_t v81 = objc_opt_class();
  uint64_t v82 = objc_opt_class();
  uint64_t v83 = objc_opt_class();
  uint64_t v84 = objc_opt_class();
  uint64_t v85 = objc_opt_class();
  uint64_t v86 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v79, "setWithObjects:", v80, v81, v82, v83, v84, v85, v86, objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 0, 1);
  v87 = (void *)MEMORY[0x263EFFA08];
  uint64_t v88 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 2, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startPeerDiscoveryWithConfiguration_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startPeerDiscoveryWithConfiguration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startPeerDiscoveryWithConfiguration_uuid_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopPeerDiscoveryWithUUID_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopPeerDiscoveryWithUUID_reply_, 0, 1);
  v89 = (void *)MEMORY[0x263EFFA08];
  uint64_t v90 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 3, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 0, 1);
  v91 = (void *)MEMORY[0x263EFFA08];
  uint64_t v92 = objc_opt_class();
  uint64_t v93 = objc_opt_class();
  uint64_t v94 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v91, "setWithObjects:", v92, v93, v94, objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 1, 1);
  v95 = (void *)MEMORY[0x263EFFA08];
  uint64_t v96 = objc_opt_class();
  uint64_t v97 = objc_opt_class();
  uint64_t v98 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v95, "setWithObjects:", v96, v97, v98, objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 2, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 3, 1);
  v99 = (void *)MEMORY[0x263EFFA08];
  uint64_t v100 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 3, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 0, 1);
  v101 = (void *)MEMORY[0x263EFFA08];
  uint64_t v102 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v101, "setWithObjects:", v102, objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 1, 1);
  v103 = (void *)MEMORY[0x263EFFA08];
  uint64_t v104 = objc_opt_class();
  uint64_t v105 = objc_opt_class();
  uint64_t v106 = objc_opt_class();
  uint64_t v107 = objc_opt_class();
  uint64_t v108 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v103, "setWithObjects:", v104, v105, v106, v107, v108, objc_opt_class(), 0), sel_runWiFiPerformanceLoggingWithConfiguration_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiPerformanceLoggingWithConfiguration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiPerformanceLoggingWithConfiguration_uuid_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_cancelAllRequestsAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_log_timestamp_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startMonitoringFaultEventsForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_startMonitoringFaultEventsForPeer_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopMonitoringFaultEventsForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_stopMonitoringFaultEventsForPeer_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_submitFaultEvent_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_submitFaultEvent_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryFaultEventCacheForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryFaultEventCacheForPeer_reply_, 0, 1);
  v109 = (void *)MEMORY[0x263EFFA08];
  uint64_t v110 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0), sel_queryFaultEventCacheForPeer_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 0, 0);
  v111 = (void *)MEMORY[0x263EFFA08];
  uint64_t v112 = objc_opt_class();
  uint64_t v113 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v111, "setWithObjects:", v112, v113, objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 0, 1);
  v114 = (void *)MEMORY[0x263EFFA08];
  uint64_t v115 = objc_opt_class();
  uint64_t v116 = objc_opt_class();
  uint64_t v117 = objc_opt_class();
  uint64_t v118 = objc_opt_class();
  uint64_t v119 = objc_opt_class();
  uint64_t v120 = objc_opt_class();
  uint64_t v121 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v114, "setWithObjects:", v115, v116, v117, v118, v119, v120, v121, objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 1, 1);
  return v0;
}

void *W5XPCEventDelegateInterface()
{
  v0 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C511960];
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_receivedEvent_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0), sel_receivedPeerDiscoveryEvent_, 0, 0);
  return v0;
}

id W5FormattedDescriptionForDebugConfiguration(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v3 = [a1 wifi] + 1;
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = off_2641FDB98[v3];
  }
  objc_msgSend(v2, "appendFormat:", @"Wi-Fi                     : %s\n", -[__CFString UTF8String](v4, "UTF8String"));
  unint64_t v5 = [a1 megaWiFiProfile] + 1;
  if (v5 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_2641FDB98[v5];
  }
  objc_msgSend(v2, "appendFormat:", @"Wi-Fi Profile (Mega)      : %s\n", -[__CFString UTF8String](v6, "UTF8String"));
  unint64_t v7 = [a1 noLoggingWiFiProfile] + 1;
  if (v7 > 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = off_2641FDB98[v7];
  }
  objc_msgSend(v2, "appendFormat:", @"Wi-Fi Profile (NoLogging) : %s\n", -[__CFString UTF8String](v8, "UTF8String"));
  unint64_t v9 = [a1 eapol] + 1;
  if (v9 > 2) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = off_2641FDB98[v9];
  }
  objc_msgSend(v2, "appendFormat:", @"EAPOL                     : %s\n", -[__CFString UTF8String](v10, "UTF8String"));
  unint64_t v11 = [a1 bluetooth] + 1;
  if (v11 > 2) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = off_2641FDB98[v11];
  }
  objc_msgSend(v2, "appendFormat:", @"Bluetooth                 : %s\n", -[__CFString UTF8String](v12, "UTF8String"));
  unint64_t v13 = [a1 stbc] + 1;
  if (v13 > 2) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = off_2641FDB98[v13];
  }
  objc_msgSend(v2, "appendFormat:", @"STBC                      : %s\n", -[__CFString UTF8String](v14, "UTF8String"));
  [v2 appendFormat:@"Diagnostics               : %@\n", objc_msgSend((id)objc_msgSend(a1, "diagnosticsMode"), "description")];
  uint64_t v15 = (void *)[v2 copy];
  return v15;
}

__CFString *W5DescriptionForLogState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2) {
    return 0;
  }
  else {
    return off_2641FDB98[a1 + 1];
  }
}

id W5FormattedDescriptionForStatus(void *a1)
{
  uint64_t v187 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  [v2 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v2 appendFormat:@"NETWORK\n"];
  v162 = v2;
  [v2 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  v161 = a1;
  unint64_t v3 = (void *)[a1 network];
  uint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
  if ([v3 primaryIPv4InterfaceName])
  {
    objc_msgSend(v4, "appendFormat:", @"    Primary IPv4         : %s (%s / %s)\n", objc_msgSend((id)objc_msgSend(v3, "primaryIPv4InterfaceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv4ServiceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv4ServiceID"), "UTF8String"));
    unint64_t v5 = (void *)[v3 primaryIPv4Addresses];
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v171 objects:&v175 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v172;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v172 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "appendFormat:", @"                         : %s\n", objc_msgSend(*(id *)(*((void *)&v171 + 1) + 8 * i), "UTF8String"));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v171 objects:&v175 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [v4 appendFormat:@"    Primary IPv4         : None\n"];
  }
  if ([v3 primaryIPv6InterfaceName])
  {
    objc_msgSend(v4, "appendFormat:", @"    Primary IPv6         : %s (%s / %s)\n", objc_msgSend((id)objc_msgSend(v3, "primaryIPv6InterfaceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv6ServiceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv6ServiceID"), "UTF8String"));
    uint64_t v10 = (void *)[v3 primaryIPv6Addresses];
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v167 objects:&v183 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v168;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v168 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v4, "appendFormat:", @"                         : %s\n", objc_msgSend(*(id *)(*((void *)&v167 + 1) + 8 * j), "UTF8String"));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v167 objects:&v183 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [v4 appendFormat:@"    Primary IPv6         : None\n"];
  }
  uint64_t v15 = (void *)[v3 primaryDNSAddresses];
  if ([v15 count])
  {
    objc_msgSend(v4, "appendFormat:", @"    DNS Addresses        : %s\n", objc_msgSend((id)objc_msgSend(v15, "firstObject"), "UTF8String"));
    if ((unint64_t)[v15 count] >= 2 && (unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      unint64_t v16 = 1;
      do
        objc_msgSend(v4, "appendFormat:", @"                         : %s\n", objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16++), "UTF8String"));
      while (v16 < [v15 count]);
    }
  }
  else
  {
    [v4 appendFormat:@"    DNS Addresses        : None\n"];
  }
  v17 = "Not Reachable";
  if (([v3 isAppleReachable] & 2) != 0 && (objc_msgSend(v3, "isAppleReachable") & 4) == 0) {
    v17 = "Reachable";
  }
  uint64_t v18 = [v3 isAppleReachable];
  uint64_t v19 = " (WWAN)";
  if ((v18 & 0x40000) == 0) {
    uint64_t v19 = "";
  }
  objc_msgSend(v4, "appendFormat:", @"    Apple                : %s%s\n", v17, v19);
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v4, "copy"));
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v162 appendFormat:@"WIFI\n"];
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  uint64_t v20 = (void *)[v161 wifi];
  uint64_t v21 = (void *)[MEMORY[0x263F089D8] string];
  objc_msgSend(v21, "appendFormat:", @"    MAC Address          : %s (hw=%s)\n", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "macAddress"), "redactedForWiFi"), "UTF8String"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "hardwareMACAddress"), "redactedForWiFi"), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", @"    Interface Name       : %s\n", objc_msgSend((id)objc_msgSend(v20, "interfaceName"), "UTF8String"));
  if ([v20 powerOn]) {
    uint64_t v22 = "On";
  }
  else {
    uint64_t v22 = "Off";
  }
  if (objc_msgSend((id)objc_msgSend(v20, "power"), "length") == 24) {
    uint64_t v23 = objc_msgSend((id)objc_msgSend(v20, "power"), "bytes");
  }
  else {
    uint64_t v23 = 0;
  }
  objc_msgSend(v21, "appendFormat:", @"    Power                : %s [%s]\n", v22, objc_msgSend(W5DescriptionForPower(v23), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", @"    Op Mode              : %s\n", -[__CFString UTF8String](W5DescriptionForOpMode(objc_msgSend(v20, "opMode")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ssidString"), "redactedForWiFi"), "UTF8String")) {
    uint64_t v24 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ssidString"), "redactedForWiFi"), "UTF8String");
  }
  else {
    uint64_t v24 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    SSID                 : %s\n", v24);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "bssid"), "redactedForWiFi"), "UTF8String")) {
    uint64_t v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "bssid"), "redactedForWiFi"), "UTF8String");
  }
  else {
    uint64_t v25 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    BSSID                : %s\n", v25);
  objc_msgSend(v21, "appendFormat:", @"    RSSI                 : %i dBm\n", objc_msgSend(v20, "rssi"));
  objc_msgSend(v21, "appendFormat:", @"    CCA                  : %i %%\n", objc_msgSend(v20, "cca"));
  objc_msgSend(v21, "appendFormat:", @"    Noise                : %i dBm\n", objc_msgSend(v20, "noise"));
  [v20 txRate];
  objc_msgSend(v21, "appendFormat:", @"    Tx Rate              : %.1f Mbps\n", v26);
  if ([v20 ssid]) {
    objc_msgSend(v21, "appendFormat:", @"    Security             : %s\n", -[__CFString UTF8String](W5DescriptionForSecurity(objc_msgSend(v20, "security")), "UTF8String"));
  }
  else {
    objc_msgSend(v21, "appendFormat:", @"    Security             : None\n", v160);
  }
  if ([v20 security] == 12
    || [v20 security] == 11
    || [v20 security] == 9
    || [v20 security] == 10
    || [v20 security] == 8)
  {
    uint64_t v27 = [v20 eapolControlMode];
    if (v27 >= 4) {
      uint64_t v28 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%d)", v27);
    }
    else {
      uint64_t v28 = off_2641FE488[(int)v27];
    }
    objc_msgSend(v21, "appendFormat:", @"    802.1X Mode          : %s\n", -[__CFString UTF8String](v28, "UTF8String"));
    objc_msgSend(v21, "appendFormat:", @"    802.1X Supplicant    : %s\n", -[__CFString UTF8String](W5DescriptionForEAPOLSupplicantState(objc_msgSend(v20, "eapolSupplicantState")), "UTF8String"));
  }
  objc_msgSend(v21, "appendFormat:", @"    PHY Mode             : %s\n", -[__CFString UTF8String](W5DescriptionForPHYMode(objc_msgSend(v20, "phyMode")), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", @"    MCS Index            : %i\n", objc_msgSend(v20, "mcsIndex"));
  uint64_t v29 = [v20 ssid];
  if (v29) {
    uint64_t v29 = [v20 guardInterval];
  }
  objc_msgSend(v21, "appendFormat:", @"    Guard Interval       : %i\n", v29);
  objc_msgSend(v21, "appendFormat:", @"    NSS                  : %i\n", objc_msgSend(v20, "numberOfSpacialStreams"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "channel"), "description"), "UTF8String")) {
    uint64_t v30 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "channel"), "description"), "UTF8String");
  }
  else {
    uint64_t v30 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    Channel              : %s\n", v30);
  objc_msgSend(v21, "appendFormat:", @"    Country Code         : %s\n", objc_msgSend((id)objc_msgSend(v20, "countryCode"), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", @"    Scan Cache Count     : %lu\n", objc_msgSend((id)objc_msgSend(v20, "cachedScanResults"), "count"));
  if (objc_msgSend((id)objc_msgSend(v20, "networkServiceID"), "UTF8String")) {
    uint64_t v31 = (const char *)objc_msgSend((id)objc_msgSend(v20, "networkServiceID"), "UTF8String");
  }
  else {
    uint64_t v31 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    NetworkServiceID     : %s\n", v31);
  objc_msgSend(v21, "appendFormat:", @"    IPv4 Config Method   : %s\n", -[__CFString UTF8String](W5DescriptionForIPv4ConfigMethod(objc_msgSend(v20, "ipv4ConfigMethod")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "firstObject"), "UTF8String")) {
    stat v32 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "firstObject"), "UTF8String");
  }
  else {
    stat v32 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    IPv4 Address         : %s\n", v32);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "count") >= 2)
  {
    unint64_t v33 = 1;
    do
      objc_msgSend(v21, "appendFormat:", @"                         : %s\n", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "objectAtIndexedSubscript:", v33++), "UTF8String"));
    while (v33 < objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "count"));
  }
  if (objc_msgSend((id)objc_msgSend(v20, "ipv4RouterAddress"), "UTF8String")) {
    uint64_t v34 = (const char *)objc_msgSend((id)objc_msgSend(v20, "ipv4RouterAddress"), "UTF8String");
  }
  else {
    uint64_t v34 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    IPv4 Router          : %s\n", v34);
  objc_msgSend(v21, "appendFormat:", @"    IPv6 Config Method   : %s\n", -[__CFString UTF8String](W5DescriptionForIPv6ConfigMethod(objc_msgSend(v20, "ipv6ConfigMethod")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "firstObject"), "UTF8String")) {
    uint64_t v35 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "firstObject"), "UTF8String");
  }
  else {
    uint64_t v35 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    IPv6 Address         : %s\n", v35);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "count") >= 2)
  {
    unint64_t v36 = 1;
    do
      objc_msgSend(v21, "appendFormat:", @"                         : %s\n", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "objectAtIndexedSubscript:", v36++), "UTF8String"));
    while (v36 < objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "count"));
  }
  if (objc_msgSend((id)objc_msgSend(v20, "ipv6RouterAddress"), "UTF8String")) {
    long long v37 = (const char *)objc_msgSend((id)objc_msgSend(v20, "ipv6RouterAddress"), "UTF8String");
  }
  else {
    long long v37 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    IPv6 Router          : %s\n", v37);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "firstObject"), "UTF8String")) {
    uint64_t v38 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "firstObject"), "UTF8String");
  }
  else {
    uint64_t v38 = "None";
  }
  objc_msgSend(v21, "appendFormat:", @"    DNS                  : %s\n", v38);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "count") >= 2)
  {
    unint64_t v39 = 1;
    do
      objc_msgSend(v21, "appendFormat:", @"                         : %s\n", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "objectAtIndexedSubscript:", v39++), "UTF8String"));
    while (v39 < objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "count"));
  }
  objc_msgSend(v21, "appendFormat:", @"    BTC Mode             : %s\n", objc_msgSend(W5DescriptionForBTCMode(objc_msgSend(v20, "btcMode")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend(v20, "desense"), "length") == 16) {
    uint64_t v40 = objc_msgSend((id)objc_msgSend(v20, "desense"), "bytes");
  }
  else {
    uint64_t v40 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(v20, "desenseLevel"), "length") == 8) {
    uint64_t v41 = objc_msgSend((id)objc_msgSend(v20, "desenseLevel"), "bytes");
  }
  else {
    uint64_t v41 = 0;
  }
  objc_msgSend(v21, "appendFormat:", @"    Desense              : %s\n", objc_msgSend(W5DescriptionForDesense(v40, v41), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend(v20, "chainAck"), "length") == 24) {
    uint64_t v42 = objc_msgSend((id)objc_msgSend(v20, "chainAck"), "bytes");
  }
  else {
    uint64_t v42 = 0;
  }
  objc_msgSend(v21, "appendFormat:", @"    Chain Ack            : [%s]\n", objc_msgSend(W5DescriptionForChainAck(v42), "UTF8String"));
  if ([v20 txChainPower])
  {
    objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + 4))
    {
      objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
      if (*(int *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + 4) >= 1)
      {
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
          uint64_t v45 = *(int *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + v43 + 8);
          if (v45 >= 3) {
            uint64_t v46 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%u", v45);
          }
          else {
            uint64_t v46 = off_2641FE510[v45];
          }
          objc_msgSend(v21, "appendFormat:", @"    Tx Power [%i]         : %s\n", v44, -[__CFString UTF8String](v46, "UTF8String"));
          objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
          if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + v43 + 8) == 2)
          {
            objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
            uint64_t v47 = objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes");
            uint64_t v48 = *(unsigned int *)(v47 + v43 + 12);
            uint64_t v49 = *(unsigned int *)(v47 + v43 + 16);
            uint64_t v50 = *(unsigned int *)(v47 + v43 + 20);
            uint64_t v51 = *(unsigned int *)(v47 + v43 + 24);
            uint64_t v52 = (void *)[MEMORY[0x263F089D8] string];
            objc_msgSend(v52, "appendFormat:", @"      Current            : %i\n", v49);
            objc_msgSend(v52, "appendFormat:", @"      Offset             : %i\n", v48);
            objc_msgSend(v52, "appendFormat:", @"      Min                : %i\n", v50);
            objc_msgSend(v52, "appendFormat:", @"      Max                : %i\n", v51);
            id v53 = (id)[v52 copy];
          }
          ++v44;
          objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
          v43 += 20;
        }
        while (v44 < *(int *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + 4));
      }
    }
  }
  uint64_t v54 = "Disabled";
  if ([v20 btcConfig])
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 4)) {
      uint64_t v54 = "Enabled";
    }
  }
  objc_msgSend(v21, "appendFormat:", @"    BTC Profile 2.4GHz   : %s\n", v54);
  if ([v20 btcConfig])
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 4))
    {
      objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "length");
      if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "bytes") + 8))
      {
        if (objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "length") == 572) {
          uint64_t v55 = objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "bytes");
        }
        else {
          uint64_t v55 = 0;
        }
        objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
        uint64_t v56 = v55 + 140 * *(unsigned int *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 8);
        long long v180 = *(_OWORD *)(v56 + 92);
        long long v181 = *(_OWORD *)(v56 + 108);
        v182[0] = *(_OWORD *)(v56 + 124);
        *(_OWORD *)((char *)v182 + 12) = *(_OWORD *)(v56 + 136);
        long long v176 = *(_OWORD *)(v56 + 28);
        long long v177 = *(_OWORD *)(v56 + 44);
        long long v178 = *(_OWORD *)(v56 + 60);
        long long v179 = *(_OWORD *)(v56 + 76);
        long long v175 = *(_OWORD *)(v56 + 12);
        __printBTCProfile((unsigned int *)&v175);
      }
    }
  }
  v57 = "Disabled";
  if ([v20 btcConfig])
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 12)) {
      v57 = "Enabled";
    }
  }
  objc_msgSend(v21, "appendFormat:", @"    BTC Profile 5GHz     : %s\n", v57);
  if ([v20 btcConfig])
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 12))
    {
      objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "length");
      if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "bytes") + 8))
      {
        if (objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "length") == 572) {
          uint64_t v58 = objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "bytes");
        }
        else {
          uint64_t v58 = 0;
        }
        objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
        uint64_t v59 = v58 + 140 * *(unsigned int *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 16);
        long long v180 = *(_OWORD *)(v59 + 92);
        long long v181 = *(_OWORD *)(v59 + 108);
        v182[0] = *(_OWORD *)(v59 + 124);
        *(_OWORD *)((char *)v182 + 12) = *(_OWORD *)(v59 + 136);
        long long v176 = *(_OWORD *)(v59 + 28);
        long long v177 = *(_OWORD *)(v59 + 44);
        long long v178 = *(_OWORD *)(v59 + 60);
        long long v179 = *(_OWORD *)(v59 + 76);
        long long v175 = *(_OWORD *)(v59 + 12);
        __printBTCProfile((unsigned int *)&v175);
      }
    }
  }
  int v60 = [v20 isSnifferSupported];
  uint64_t v61 = "NO";
  if (v60) {
    uint64_t v61 = "YES";
  }
  objc_msgSend(v21, "appendFormat:", @"    Sniffer Supported    : %s\n", v61);
  uint64_t v62 = "Yes";
  if (objc_msgSend((id)objc_msgSend(v20, "capabilities"), "containsObject:", &unk_26C50A0A0)) {
    v63 = "Yes";
  }
  else {
    v63 = "No";
  }
  objc_msgSend(v21, "appendFormat:", @"    Supports 6e          : %s\n", v63);
  objc_msgSend(v21, "appendFormat:", @"    Supported Channels   : %s\n", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "supportedChannels"), "componentsJoinedByString:", @","), "UTF8String"));
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v21, "copy"));
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v162 appendFormat:@"BLUETOOTH\n"];
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  uint64_t v64 = (void *)[v161 bluetooth];
  v65 = (void *)[MEMORY[0x263F089D8] string];
  int v66 = [v64 powerOn];
  v67 = "Off";
  if (v66) {
    v67 = "On";
  }
  objc_msgSend(v65, "appendFormat:", @"    Power                : %s\n", v67);
  if (objc_msgSend((id)objc_msgSend(v64, "address"), "UTF8String")) {
    uint64_t v68 = (const char *)objc_msgSend((id)objc_msgSend(v64, "address"), "UTF8String");
  }
  else {
    uint64_t v68 = "None";
  }
  objc_msgSend(v65, "appendFormat:", @"    Address              : %s\n", v68);
  if ([v64 isDiscoverable]) {
    v69 = "Yes";
  }
  else {
    v69 = "No";
  }
  objc_msgSend(v65, "appendFormat:", @"    Discoverable         : %s\n", v69);
  if ([v64 isConnectable]) {
    uint64_t v70 = "Yes";
  }
  else {
    uint64_t v70 = "No";
  }
  objc_msgSend(v65, "appendFormat:", @"    Connectable          : %s\n", v70);
  if ([v64 isScanning]) {
    uint64_t v71 = "Yes";
  }
  else {
    uint64_t v71 = "No";
  }
  objc_msgSend(v65, "appendFormat:", @"    Scanning             : %s\n", v71);
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  obuint64_t j = v64;
  uint64_t v72 = (void *)[v64 devices];
  uint64_t v73 = [v72 countByEnumeratingWithState:&v171 objects:&v175 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v78 = *(void *)v172;
    do
    {
      for (uint64_t k = 0; k != v74; ++k)
      {
        if (*(void *)v172 != v78) {
          objc_enumerationMutation(v72);
        }
        uint64_t v80 = *(void **)(*((void *)&v171 + 1) + 8 * k);
        v75 += [v80 isPaired];
        v76 += [v80 isCloudPaired];
        v77 += [v80 isConnected];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v171 objects:&v175 count:16];
    }
    while (v74);
  }
  else
  {
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
  }
  objc_msgSend(v65, "appendFormat:", @"    Devices              : %lu (paired=%lu cloud=%lu connected=%lu)\n\n", objc_msgSend((id)objc_msgSend(obj, "devices"), "count"), v75, v76, v77);
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id obja = (id)[obj devices];
  uint64_t v81 = [obja countByEnumeratingWithState:&v167 objects:&v183 count:16];
  uint64_t v82 = "No";
  if (v81)
  {
    uint64_t v83 = v81;
    uint64_t v84 = @"    %s\n";
    uint64_t v85 = @"    Address          : %s\n";
    uint64_t v86 = *(void *)v168;
    v87 = @"    Paired           : %s\n";
    v163 = v65;
    do
    {
      for (uint64_t m = 0; m != v83; ++m)
      {
        if (*(void *)v168 != v86) {
          objc_enumerationMutation(obja);
        }
        v89 = *(void **)(*((void *)&v167 + 1) + 8 * m);
        objc_msgSend(v65, "appendFormat:", v84, objc_msgSend((id)objc_msgSend(v89, "name"), "UTF8String"));
        objc_msgSend(v65, "appendFormat:", v85, objc_msgSend((id)objc_msgSend(v89, "address"), "UTF8String"));
        if ([v89 isPaired]) {
          uint64_t v90 = v62;
        }
        else {
          uint64_t v90 = v82;
        }
        objc_msgSend(v65, "appendFormat:", v87, v90);
        if ([v89 isCloudPaired]) {
          v91 = v62;
        }
        else {
          v91 = v82;
        }
        objc_msgSend(v65, "appendFormat:", @"    CloudPaired      : %s\n", v91);
        if ([v89 isConnected]) {
          uint64_t v92 = v62;
        }
        else {
          uint64_t v92 = v82;
        }
        objc_msgSend(v65, "appendFormat:", @"    Connected        : %s\n", v92);
        if ([v89 isConnected])
        {
          uint64_t v93 = v83;
          uint64_t v94 = v82;
          uint64_t v95 = v86;
          uint64_t v96 = v62;
          uint64_t v97 = v87;
          uint64_t v98 = v85;
          v99 = v84;
          uint64_t v100 = [v89 majorClass];
          unint64_t v101 = [v89 minorClass];
          uint64_t v102 = v100;
          uint64_t v84 = v99;
          uint64_t v85 = v98;
          v87 = v97;
          uint64_t v62 = v96;
          uint64_t v86 = v95;
          uint64_t v82 = v94;
          uint64_t v83 = v93;
          v65 = v163;
          objc_msgSend(v163, "appendFormat:", @"    Type             : %s\n", objc_msgSend((id)W5DescriptionForBluetoothDeviceType(v102, v101), "UTF8String"));
          if ([v89 isLowEnergy]) {
            v103 = v62;
          }
          else {
            v103 = v82;
          }
          objc_msgSend(v163, "appendFormat:", @"    LE               : %s\n", v103);
          if ([v89 isAppleDevice]) {
            uint64_t v104 = v62;
          }
          else {
            uint64_t v104 = v82;
          }
          objc_msgSend(v163, "appendFormat:", @"    Apple            : %s\n", v104);
        }
        [v65 appendFormat:@"\n"];
      }
      uint64_t v83 = [obja countByEnumeratingWithState:&v167 objects:&v183 count:16];
    }
    while (v83);
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v65, "copy"));
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v162 appendFormat:@"AWDL\n"];
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  uint64_t v105 = (void *)[v161 awdl];
  uint64_t v106 = (void *)[MEMORY[0x263F089D8] string];
  if ([v105 power]) {
    uint64_t v107 = (const char *)objc_msgSend((id)objc_msgSend(v105, "macAddress"), "UTF8String");
  }
  else {
    uint64_t v107 = "n/a";
  }
  if ([v105 power]) {
    uint64_t v108 = (const char *)objc_msgSend((id)objc_msgSend(v105, "hardwareMACAddress"), "UTF8String");
  }
  else {
    uint64_t v108 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", @"    MAC Address            : %s (hw=%s)\n", v107, v108);
  unint64_t v109 = [v105 airDropDiscoverableMode];
  if (v109 >= 3) {
    uint64_t v110 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", v109);
  }
  else {
    uint64_t v110 = off_2641FDE48[v109];
  }
  objc_msgSend(v106, "appendFormat:", @"    AirDrop Disc Mode      : %s\n", -[__CFString UTF8String](v110, "UTF8String"));
  if ([v105 awdlSyncEnabled])
  {
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v105, "awdlSyncEnabled"), "bytes") + 8)) {
      v111 = v62;
    }
    else {
      v111 = v82;
    }
  }
  else
  {
    v111 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", @"    AWDL Enabled           : %s\n", v111);
  objc_msgSend(v106, "appendFormat:", @"    Interface Name         : %s\n", objc_msgSend((id)objc_msgSend(v105, "interfaceName"), "UTF8String"));
  int v112 = [v105 power];
  uint64_t v113 = "Off";
  if (v112) {
    uint64_t v113 = "On";
  }
  objc_msgSend(v106, "appendFormat:", @"    Power                  : %s\n", v113);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "firstObject"), "UTF8String")) {
    v114 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "firstObject"), "UTF8String");
  }
  else {
    v114 = "None";
  }
  objc_msgSend(v106, "appendFormat:", @"    IPv6 Address           : %s\n", v114);
  if ([v105 awdlStrategy]) {
    uint64_t v115 = (const char *)-[__CFString UTF8String](W5DescriptionForAWDLScheduleState(*(unsigned int *)(objc_msgSend((id)objc_msgSend(v105, "awdlStrategy"), "bytes")+ 8)), "UTF8String");
  }
  else {
    uint64_t v115 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", @"    Schedule State         : %s\n", v115);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "count") >= 2)
  {
    unint64_t v116 = 1;
    do
      objc_msgSend(v106, "appendFormat:", @"                           : %s\n", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "objectAtIndexedSubscript:", v116++), "UTF8String"));
    while (v116 < objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "count"));
  }
  if ([v105 awdlSyncChannelSequence]) {
    uint64_t v117 = (const char *)objc_msgSend(W5DebugDescriptionForAWDLSyncChannelSequence(objc_msgSend((id)objc_msgSend(v105, "awdlSyncChannelSequence"), "bytes")), "UTF8String");
  }
  else {
    uint64_t v117 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", @"    Channel Sequence       : %s\n", v117);
  if ([v105 awdlOpMode])
  {
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v105, "awdlOpMode"), "bytes") + 4) <= 2u) {
      uint64_t v118 = off_2641FDB80[*(unsigned int *)(objc_msgSend((id)objc_msgSend(v105, "awdlOpMode"), "bytes") + 4)];
    }
    else {
      uint64_t v118 = "UNKNOWN";
    }
  }
  else
  {
    uint64_t v118 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", @"    Op Mode                : %s\n", v118);
  if ([v105 awdlSyncState])
  {
    uint64_t v119 = (__CFString *)objc_msgSend((id)objc_msgSend(v105, "awdlSyncState"), "bytes");
    if (v119)
    {
      unsigned int v120 = HIDWORD(v119->isa) - 1;
      if (v120 > 2) {
        uint64_t v119 = @"Stop";
      }
      else {
        uint64_t v119 = off_2641FDE30[v120];
      }
    }
    uint64_t v121 = (const char *)[(__CFString *)v119 UTF8String];
  }
  else
  {
    uint64_t v121 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", @"    Sync State             : %s\n", v121);
  uint64_t v122 = objc_msgSend((id)objc_msgSend(v105, "awdlSyncParameters"), "bytes");
  if (v122)
  {
    v123 = (unsigned int *)v122;
    [v106 appendFormat:@"    Sync Params\n"];
    objc_msgSend(v106, "appendFormat:", @"      AW Period            : %d\n", v123[2]);
    objc_msgSend(v106, "appendFormat:", @"      AW Length            : %d\n", v123[1]);
    objc_msgSend(v106, "appendFormat:", @"      Extension Length     : %d\n", v123[3]);
    objc_msgSend(v106, "appendFormat:", @"      Sync Frame Period    : %d (Non-Election Master=%d)\n", v123[4], v123[5]);
  }
  else
  {
    [v106 appendString:@"    Sync Params            : n/a\n"];
  }
  uint64_t v124 = objc_msgSend((id)objc_msgSend(v105, "awdlMasterChannel"), "bytes");
  uint64_t v125 = objc_msgSend((id)objc_msgSend(v105, "awdlSecondaryMasterChannel"), "bytes");
  if (v124 && v125) {
    objc_msgSend(v106, "appendFormat:", @"    Master Channel         : %u/%u\n", *(unsigned int *)(v124 + 4), *(unsigned int *)(v125 + 4));
  }
  else {
    [v106 appendString:@"    Master Channel         : n/a\n"];
  }
  uint64_t v126 = objc_msgSend((id)objc_msgSend(v105, "awdlElectionParameters"), "bytes");
  if (v126)
  {
    uint64_t v127 = v126;
    [v106 appendFormat:@"    Election Params\n"];
    objc_msgSend(v106, "appendFormat:", @"      Election ID          : %u\n", *(unsigned __int16 *)(v127 + 18));
    objc_msgSend(v106, "appendFormat:", @"      Self Metric          : %u\n", *(unsigned int *)(v127 + 32));
    objc_msgSend(v106, "appendFormat:", @"      Flags                : 0x%x\n", *(unsigned __int8 *)(v127 + 16));
    objc_msgSend(v106, "appendFormat:", @"      Top Master Metric    : %u\n", *(unsigned int *)(v127 + 28));
    objc_msgSend(v106, "appendFormat:", @"      Distance From Top    : %u\n", *(unsigned __int8 *)(v127 + 20));
    objc_msgSend(v106, "appendFormat:", @"      Top Master           : %02X:%02X:%02X:%02X:%02X:%02X\n", *(unsigned __int8 *)(v127 + 22), *(unsigned __int8 *)(v127 + 23), *(unsigned __int8 *)(v127 + 24), *(unsigned __int8 *)(v127 + 25), *(unsigned __int8 *)(v127 + 26), *(unsigned __int8 *)(v127 + 27));
  }
  else
  {
    [v106 appendString:@"    Election Params        : n/a\n"];
  }
  uint64_t v128 = objc_msgSend((id)objc_msgSend(v105, "awdlPeerDatabase"), "bytes");
  if (v128) {
    objc_msgSend(v106, "appendFormat:", @"      PeerDB Count         : %u\n", *(unsigned int *)(v128 + 4));
  }
  uint64_t v129 = objc_msgSend((id)objc_msgSend(v105, "awdlSidecarDiagnostics"), "bytes");
  if (v129) {
    objc_msgSend(v106, "appendFormat:", @"      Sidecar Tx Latency   : %ums\n", *(unsigned int *)(v129 + 4));
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v106, "copy"));
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v162 appendFormat:@"POWER\n"];
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  v130 = (void *)[v161 power];
  v131 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v132 = [v130 powerSourceType];
  if (v132 >= 4) {
    v133 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", v132);
  }
  else {
    v133 = off_2641FE450[v132];
  }
  objc_msgSend(v131, "appendFormat:", @"    Power Source         : %s\n", -[__CFString UTF8String](v133, "UTF8String"));
  unsigned int v134 = [v130 batteryWarningLevel];
  if (v134 - 1 >= 3) {
    v135 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", v134);
  }
  else {
    v135 = off_2641FE470[v134 - 1];
  }
  objc_msgSend(v131, "appendFormat:", @"    Battery Warning Level: %s\n", -[__CFString UTF8String](v135, "UTF8String"));
  [v130 powerStateCaps];
  objc_msgSend(v131, "appendFormat:", @"    System Caps          : %s\n", objc_msgSend((id)W5DescriptionForPowerStateCaps(), "UTF8String"));
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v131, "copy"));
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v162 appendFormat:@"WIFI FAULTS LAST HOUR\n"];
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  v136 = (void *)[v161 lastHrFaults];
  v137 = (void *)[MEMORY[0x263F089D8] string];
  if ([v136 lastHrFaults]
    && (![v136 lastHrFaults] || objc_msgSend((id)objc_msgSend(v136, "lastHrFaults"), "count")))
  {
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id objb = (id)[v136 lastHrFaults];
    uint64_t v138 = [objb countByEnumeratingWithState:&v183 objects:&v175 count:16];
    if (v138)
    {
      uint64_t v139 = v138;
      uint64_t v140 = *(void *)v184;
      do
      {
        for (uint64_t n = 0; n != v139; ++n)
        {
          if (*(void *)v184 != v140) {
            objc_enumerationMutation(objb);
          }
          v142 = *(void **)(*((void *)&v183 + 1) + 8 * n);
          objc_msgSend(v137, "appendFormat:", @"    Fault                : %s\n", objc_msgSend((id)objc_msgSend(v142, "objectForKeyedSubscript:", @"type"), "UTF8String"));
          [v137 appendFormat:@"%@", __printDictionaryContents(v142, objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"date", @"interface", 0), 0)];
        }
        uint64_t v139 = [objb countByEnumeratingWithState:&v183 objects:&v175 count:16];
      }
      while (v139);
    }
  }
  else
  {
    [v137 appendFormat:@"    None\n"];
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v137, "copy"));
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v162 appendFormat:@"WIFI RECOVERIES LAST HOUR\n"];
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  v143 = (void *)[v161 lastHrRecoveries];
  v144 = (void *)[MEMORY[0x263F089D8] string];
  if ([v143 lastHrRecoveries]
    && (![v143 lastHrRecoveries] || objc_msgSend((id)objc_msgSend(v143, "lastHrRecoveries"), "count")))
  {
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    v145 = (void *)[v143 lastHrRecoveries];
    uint64_t v146 = [v145 countByEnumeratingWithState:&v183 objects:&v175 count:16];
    if (v146)
    {
      uint64_t v147 = v146;
      uint64_t v148 = *(void *)v184;
      do
      {
        for (iuint64_t i = 0; ii != v147; ++ii)
        {
          if (*(void *)v184 != v148) {
            objc_enumerationMutation(v145);
          }
          v150 = *(void **)(*((void *)&v183 + 1) + 8 * ii);
          objc_msgSend(v144, "appendFormat:", @"    Reason               : %s\n", objc_msgSend((id)objc_msgSend(v150, "objectForKeyedSubscript:", @"recoveryReason"), "UTF8String"));
          [v144 appendFormat:@"%@", __printDictionaryContents(v150, 0, objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"recoveryReason", 0))];
        }
        uint64_t v147 = [v145 countByEnumeratingWithState:&v183 objects:&v175 count:16];
      }
      while (v147);
    }
  }
  else
  {
    [v144 appendFormat:@"    None\n"];
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v144, "copy"));
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  [v162 appendFormat:@"WIFI LINK TESTS LAST HOUR\n"];
  [v162 appendFormat:@"————————————————————————————————————————————————————————————————————\n"];
  v151 = (void *)[v161 lastHrLinkTests];
  v152 = (void *)[MEMORY[0x263F089D8] string];
  if ([v151 lastHrLinkTests]
    && (![v151 lastHrLinkTests] || objc_msgSend((id)objc_msgSend(v151, "lastHrLinkTests"), "count")))
  {
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    v153 = (void *)[v151 lastHrLinkTests];
    uint64_t v154 = [v153 countByEnumeratingWithState:&v183 objects:&v175 count:16];
    if (v154)
    {
      uint64_t v155 = v154;
      uint64_t v156 = *(void *)v184;
      do
      {
        for (juint64_t j = 0; jj != v155; ++jj)
        {
          if (*(void *)v184 != v156) {
            objc_enumerationMutation(v153);
          }
          v158 = *(void **)(*((void *)&v183 + 1) + 8 * jj);
          objc_msgSend(v152, "appendFormat:", @"    Reason               : %s\n", objc_msgSend((id)objc_msgSend(v158, "objectForKeyedSubscript:", @"initiatingReason"), "UTF8String"));
          [v152 appendFormat:@"%@", __printDictionaryContents(v158, 0, objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"initiatingReason", 0))];
        }
        uint64_t v155 = [v153 countByEnumeratingWithState:&v183 objects:&v175 count:16];
      }
      while (v155);
    }
  }
  else
  {
    [v152 appendFormat:@"    None\n"];
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v152, "copy"));
  return (id)[v162 copy];
}

id W5FormattedHeaderForDiagnosticsTestResults()
{
  v0 = (void *)[MEMORY[0x263F089D8] string];
  [v0 appendString:@"————————————————————————————————————————————————————————————————————————————————————————————————————————\n"];
  [v0 appendString:@"Timestamp    Name                          Duration    Result    Description                            \n"];
  [v0 appendString:@"————————————————————————————————————————————————————————————————————————————————————————————————————————\n"];
  v1 = (void *)[v0 copy];
  return v1;
}

id W5FormattedHeaderForDiagnosticsTestResults2()
{
  v0 = (void *)[MEMORY[0x263F089D8] string];
  [v0 appendString:@"————————————————————————————————————————————————————————————————————————————————————————————————————————\n"];
  [v0 appendString:@"Name                                       Duration    Result    Timestamp           Description        \n"];
  [v0 appendString:@"————————————————————————————————————————————————————————————————————————————————————————————————————————\n"];
  v1 = (void *)[v0 copy];
  return v1;
}

id W5FormattedDescriptionForDiagnosticsTestResult2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  if (qword_26AB09F70 != -1) {
    dispatch_once(&qword_26AB09F70, &__block_literal_global_1);
  }
  uint64_t v6 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v7 = (void *)MEMORY[0x263EFF910];
  [a1 testStarted];
  uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  [a1 testCompleted];
  double v10 = v9;
  [a1 testStarted];
  double v12 = v11;
  uint64_t v13 = (__CFString *)objc_msgSend((id)objc_msgSend(a1, "configuration"), "objectForKeyedSubscript:", @"NameOverride");
  if (!v13) {
    uint64_t v13 = W5DescriptionForDiagnosticsTestID([a1 testID]);
  }
  double v14 = v10 - v12;
  for (uint64_t i = (void *)[MEMORY[0x263F089D8] string]; a2; --a2)
    [i appendString:a3];
  uint64_t v16 = [(id)objc_msgSend(NSString stringWithFormat:@"%@%@", i, v13), "UTF8String"];
  if ([a1 result]) {
    v17 = "Yes";
  }
  else {
    v17 = "No";
  }
  objc_msgSend(v6, "appendFormat:", @"%-43.43s%-12.3f%-10.10s%-20.12s%s\n", v16, *(void *)&v14, v17, objc_msgSend((id)objc_msgSend((id)_MergedGlobals_1, "stringFromDate:", v8), "UTF8String"), -[__CFString UTF8String](W5DescriptionForDiagnosticsTestResult(a1), "UTF8String"));
  if ([a1 testID] == 28)
  {
    uint64_t v18 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"ScanResults");
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v77 objects:v85 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v78 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v6, "appendFormat:", @"                                                                                     '%s' — %s (%s)\n", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * j), "ssidString"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * j), "bssid"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * j), "countryCode"), "UTF8String"));
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v77 objects:v85 count:16];
      }
      while (v20);
    }
  }
  else if ([a1 testID] == 24 || objc_msgSend(a1, "testID") == 23)
  {
    objc_msgSend(v6, "appendFormat:", @"                                                                                     Recommended 2.4GHz — %ld\n", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"2GHzChannel"), "channel"));
    uint64_t v23 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"5GHzChannel");
    uint64_t v24 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"5GHzNonDFSChannel");
    uint64_t v25 = [v23 channel];
    uint64_t v26 = [v24 channel];
    uint64_t v27 = [v23 channel];
    if (v25 == v26) {
      objc_msgSend(v6, "appendFormat:", @"                                                                                     Recommended 5GHz — %ld\n", v27, v60);
    }
    else {
      objc_msgSend(v6, "appendFormat:", @"                                                                                     Recommended 5GHz — %ld,%ld\n", v27, objc_msgSend(v24, "channel"));
    }
  }
  else if ([a1 testID] == 29)
  {
    uint64_t v29 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"ScanResults");
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v73 objects:v84 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v74;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v74 != v32) {
            objc_enumerationMutation(v29);
          }
          objc_msgSend(v6, "appendFormat:", @"                                                                                     '%s' — %s\n", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * k), "ssidString"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * k), "bssid"), "UTF8String"));
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v73 objects:v84 count:16];
      }
      while (v31);
    }
  }
  else if ([a1 testID] == 27)
  {
    uint64_t v34 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"ScanResults");
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v69 objects:v83 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v70;
      do
      {
        for (uint64_t m = 0; m != v36; ++m)
        {
          if (*(void *)v70 != v37) {
            objc_enumerationMutation(v34);
          }
          objc_msgSend(v6, "appendFormat:", @"                                                                                     '%s' — %s (ch %ld)\n", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * m), "ssidString"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * m), "bssid"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * m), "channel"), "channel"));
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v69 objects:v83 count:16];
      }
      while (v36);
    }
  }
  else if ([a1 testID] == 48)
  {
    unint64_t v39 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PreferredNetworks");
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v82 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v66;
      do
      {
        for (uint64_t n = 0; n != v41; ++n)
        {
          if (*(void *)v66 != v42) {
            objc_enumerationMutation(v39);
          }
          objc_msgSend(v6, "appendFormat:", @"                                                                                     '%s' — %s\n", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * n), "ssidString"), "UTF8String"), -[__CFString UTF8String](W5DescriptionForSecurity(objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * n), "security")), "UTF8String"));
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v82 count:16];
      }
      while (v41);
    }
  }
  else if ([a1 testID] == 4 || objc_msgSend(a1, "testID") == 5 || objc_msgSend(a1, "testID") == 6)
  {
    uint64_t v44 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PingResults");
    if ((unint64_t)[v44 count] >= 2)
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v61 objects:v81 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v62;
        do
        {
          for (iuint64_t i = 0; ii != v46; ++ii)
          {
            if (*(void *)v62 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void **)(*((void *)&v61 + 1) + 8 * ii);
            uint64_t v50 = [v49 address];
            [v49 min];
            uint64_t v52 = v51;
            id v53 = W5DescriptionForPingTrafficClass([v49 trafficClass]);
            uint64_t v54 = [v49 dataLength] + 64;
            [v49 interval];
            uint64_t v56 = v55;
            [v49 wait];
            uint64_t v58 = v57;
            [v49 timeout];
            [v6 appendFormat:@"                                                                                     %@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs / t=%fs / c=%ld\n", v50, v52, v53, v54, v56, v58, v59, objc_msgSend(v49, "count")];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v61 objects:v81 count:16];
        }
        while (v46);
      }
    }
  }
  return (id)[v6 copy];
}

uint64_t __W5FormattedDescriptionForDiagnosticsTestResult2_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  _MergedGlobals_1 = (uint64_t)v0;
  return [v0 setDateFormat:@"HH:mm:ss.SSS"];
}

__CFString *W5DescriptionForDiagnosticsTestID(unint64_t a1)
{
  if (a1 >= 0x40) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%li>", a1);
  }
  else {
    return off_2641FDBB0[a1];
  }
}

__CFString *W5DescriptionForDiagnosticsTestResult(void *a1)
{
  [a1 testID];
  os_log_t result = &stru_26C4FB5C0;
  switch((unint64_t)&stru_26C4FB5C0)
  {
    case 0uLL:
    case 0x35uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x3EuLL:
      return result;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      unint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PingResult");
      uint64_t v4 = NSString;
      if ([a1 didPass]) {
        unint64_t v5 = "";
      }
      else {
        unint64_t v5 = "not ";
      }
      uint64_t v6 = [v3 address];
      [v3 min];
      uint64_t v8 = v7;
      double v9 = W5DescriptionForPingTrafficClass([v3 trafficClass]);
      uint64_t v10 = [v3 dataLength] + 64;
      [v3 interval];
      uint64_t v12 = v11;
      [v3 wait];
      uint64_t v14 = v13;
      [v3 timeout];
      uint64_t v16 = v15;
      uint64_t v141 = [v3 count];
      uint64_t v139 = v14;
      uint64_t v140 = v16;
      uint64_t v138 = v12;
      v136 = v9;
      uint64_t v137 = v10;
      uint64_t v135 = v8;
      v17 = @"Could %sping router (%@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs t=%fs / c=%ld)";
      goto LABEL_152;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      uint64_t v18 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PingResults");
      if ((unint64_t)[v18 count] >= 2)
      {
        int v19 = [a1 didPass];
        uint64_t v20 = NSString;
        v133 = (__CFString *)[v18 count];
        if (v19) {
          v17 = @"Could ping DNS server(s) (%ld)";
        }
        else {
          v17 = @"Could not ping DNS server(s) (%ld)";
        }
        goto LABEL_159;
      }
      uint64_t v29 = (void *)[v18 firstObject];
      uint64_t v4 = NSString;
      if ([a1 didPass]) {
        unint64_t v5 = "";
      }
      else {
        unint64_t v5 = "not ";
      }
      uint64_t v6 = [v29 address];
      [v29 min];
      uint64_t v31 = v30;
      uint64_t v32 = W5DescriptionForPingTrafficClass([v29 trafficClass]);
      uint64_t v33 = [v29 dataLength] + 64;
      [v29 interval];
      uint64_t v35 = v34;
      [v29 wait];
      uint64_t v37 = v36;
      [v29 timeout];
      uint64_t v39 = v38;
      uint64_t v141 = [v29 count];
      uint64_t v139 = v37;
      uint64_t v140 = v39;
      uint64_t v138 = v35;
      v136 = v32;
      uint64_t v137 = v33;
      uint64_t v135 = v31;
      v17 = @"Could %sping DNS server (%@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs / t=%fs / c=%ld)";
      goto LABEL_152;
    case 7uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Could not resolve 'captive.apple.com'";
      uint64_t v42 = @"Could resolve 'captive.apple.com'";
      goto LABEL_107;
    case 8uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Detected double NAT";
      uint64_t v42 = @"Did not detect double NAT";
      goto LABEL_107;
    case 9uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Could not reach 'www.apple.com'";
      uint64_t v42 = @"Could reach 'www.apple.com'";
      goto LABEL_107;
    case 0xAuLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Could not retrieve 'https://captive.apple.com'";
      uint64_t v42 = @"Could retrieve 'https://captive.apple.com'";
      goto LABEL_107;
    case 0xBuLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Could not retrieve 'https://captive.apple.com' over Wi-Fi";
      uint64_t v42 = @"Could retrieve 'https://captive.apple.com' over Wi-Fi";
      goto LABEL_107;
    case 0xCuLL:
      uint64_t v43 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv4Router");
      uint64_t v44 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv4Addresses");
      if ([a1 didPass])
      {
        uint64_t v20 = NSString;
        v133 = (__CFString *)v43;
        unsigned int v134 = (__CFString *)[v44 firstObject];
        v17 = @"Wi-Fi has IPv4 assigned (router=%@ ip=%@)";
        goto LABEL_159;
      }
      return @"Wi-Fi does not have IPv4 assigned";
    case 0xDuLL:
      uint64_t v90 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv6Router");
      v91 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv6Addresses");
      if ([a1 didPass])
      {
        uint64_t v20 = NSString;
        v133 = (__CFString *)v90;
        unsigned int v134 = (__CFString *)[v91 firstObject];
        v17 = @"Wi-Fi has IPv6 assigned (router=%@ ip=%@)";
        goto LABEL_159;
      }
      return @"Wi-Fi does not have IPv6 assigned";
    case 0xEuLL:
      unint64_t v92 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv4ConfigMethod"), "integerValue");
      uint64_t v20 = NSString;
      v133 = W5DescriptionForIPv4ConfigMethod(v92);
      v17 = @"Wi-Fi is using '%@' for IPv4";
      goto LABEL_159;
    case 0xFuLL:
      unint64_t v93 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv6ConfigMethod"), "integerValue");
      uint64_t v20 = NSString;
      v133 = W5DescriptionForIPv6ConfigMethod(v93);
      v17 = @"Wi-Fi is using '%@' for IPv6";
      goto LABEL_159;
    case 0x10uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Detected custom DNS settings";
      uint64_t v42 = @"Did not detect custom DNS settings";
      goto LABEL_107;
    case 0x11uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Detected custom web proxy settings";
      uint64_t v42 = @"Did not detect custom web proxy settings";
      goto LABEL_107;
    case 0x12uLL:
      uint64_t v94 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"BTPairedCount"), "integerValue");
      long long v73 = NSString;
      v133 = (__CFString *)v94;
      v17 = @"Paired Bluetooth device count (%ld)";
      goto LABEL_113;
    case 0x13uLL:
      uint64_t v95 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"BTConnectedCount"), "integerValue");
      long long v73 = NSString;
      v133 = (__CFString *)v95;
      v17 = @"Connected Bluetooth device count (%ld)";
      goto LABEL_113;
    case 0x14uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Bluetooth coexistence is active";
      uint64_t v42 = @"Bluetooth coexistence is not active";
      goto LABEL_107;
    case 0x15uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"AWDL is active";
      uint64_t v42 = @"AWDL is not active";
      goto LABEL_107;
    case 0x16uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"AWDL real time mode is active";
      uint64_t v42 = @"AWDL real time mode is not active";
      goto LABEL_107;
    case 0x17uLL:
    case 0x18uLL:
      uint64_t v21 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"CCA");
      uint64_t v22 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"CurrentChannel");
      int v23 = [a1 didPass];
      uint64_t v20 = NSString;
      uint64_t v24 = [v22 channel];
      if (v23)
      {
        if (v21)
        {
          uint64_t v25 = NSString;
          [v21 floatValue];
          uint64_t v27 = (__CFString *)objc_msgSend(v25, "stringWithFormat:", @"%.1f%%", v26);
        }
        else
        {
          uint64_t v27 = @"n/a";
        }
        v133 = (__CFString *)v24;
        unsigned int v134 = v27;
        v17 = @"Current channel (%ld) is NOT congested (CCA = %@)";
      }
      else
      {
        if (v21)
        {
          v87 = NSString;
          [v21 floatValue];
          v89 = (__CFString *)objc_msgSend(v87, "stringWithFormat:", @"%.1f%%", v88);
        }
        else
        {
          v89 = @"n/a";
        }
        v133 = (__CFString *)v24;
        unsigned int v134 = v89;
        v17 = @"Current channel (%ld) is congested (CCA = %@)";
      }
      goto LABEL_159;
    case 0x19uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"2.4GHz band is congested";
      uint64_t v42 = @"2.4GHz band is not congested";
      goto LABEL_107;
    case 0x1AuLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"5GHz band is congested";
      uint64_t v42 = @"5GHz band is not congested";
      goto LABEL_107;
    case 0x1BuLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Found HT40 network(s) in 2.4GHz";
      uint64_t v42 = @"Did not find HT40 network(s) in 2.4GHz";
      goto LABEL_107;
    case 0x1CuLL:
      uint64_t v96 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"AdoptedCountryCode");
      if ([a1 didPass]) {
        return (__CFString *)[NSString stringWithFormat:@"Did not find conflicting country code(s) (%@)", v96, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"Found conflicting country code(s) (%@)", v96, v134, v135, v136, v137, v138, v139, v140, v141];
      }
    case 0x1DuLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Found conflicting security types";
      uint64_t v42 = @"Did not find conflicting security types";
      goto LABEL_107;
    case 0x1EuLL:
      uint64_t v45 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"ScanResults");
      if ([a1 didPass]) {
        return @"Did not find any hidden networks";
      }
      uint64_t v20 = NSString;
      v133 = (__CFString *)[v45 count];
      v17 = @"Found %ld hidden network(s)";
      goto LABEL_159;
    case 0x1FuLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"No Wi-Fi networks are visible";
      uint64_t v42 = @"Wi-Fi networks are visible";
      goto LABEL_107;
    case 0x20uLL:
      uint64_t v46 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      uint64_t v47 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"RSSI"), "integerValue");
      uint64_t v48 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"Noise"), "integerValue");
      int v49 = [a1 didPass];
      uint64_t v50 = @"Current network";
      if (v46) {
        uint64_t v50 = (__CFString *)v46;
      }
      if (v49) {
        return (__CFString *)[NSString stringWithFormat:@"%@ has good signal (RSSI=%lddBm, SNR=%lddB)", v50, v47, v47 - v48, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"%@ has poor signal (RSSI=%lddBm, SNR=%lddB)", v50, v47, v47 - v48, v136, v137, v138, v139, v140, v141];
      }
    case 0x21uLL:
      uint64_t v51 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      uint64_t v52 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"AirPortModelName");
      if ([a1 didPass]) {
        return (__CFString *)[NSString stringWithFormat:@"%@", v52, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      uint64_t v121 = @"Current network";
      if (v51) {
        uint64_t v121 = (__CFString *)v51;
      }
      return (__CFString *)[NSString stringWithFormat:@"%@ is not an AirPort Base Station", v121, v134, v135, v136, v137, v138, v139, v140, v141];
    case 0x22uLL:
      uint64_t v97 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"BeaconInterval"), "integerValue");
      long long v73 = NSString;
      v133 = (__CFString *)v97;
      v17 = @"Beacon interval is %ldms";
      goto LABEL_113;
    case 0x23uLL:
      uint64_t v98 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"BeaconInterval"), "integerValue");
      long long v73 = NSString;
      v133 = (__CFString *)v98;
      v17 = @"DTIM interval is %ldms";
      goto LABEL_113;
    case 0x24uLL:
      id v53 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"ScanResults");
      if ([a1 didPass])
      {
        uint64_t v20 = NSString;
        v133 = (__CFString *)[v53 count];
        v17 = @"%ld PNL networks have conflicting PHY modes (802.11ac).";
        goto LABEL_159;
      }
      return @"No PNL networks have conflicting PHY modes (802.11ac).";
    case 0x25uLL:
      v99 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"ScanResults");
      if ([a1 didPass])
      {
        uint64_t v20 = NSString;
        v133 = (__CFString *)[v99 count];
        v17 = @"%ld PNL networks have conflicting PHY modes (802.11n).";
        goto LABEL_159;
      }
      return @"No PNL networks have conflicting PHY modes (802.11n).";
    case 0x26uLL:
      uint64_t v100 = (__CFString *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      unint64_t v101 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"Security"), "integerValue");
      int v102 = [a1 didPass];
      uint64_t v20 = NSString;
      if (!v100) {
        uint64_t v100 = @"Current network";
      }
      if (v102)
      {
        v133 = v100;
        unsigned int v134 = W5DescriptionForSecurity(v101);
        v17 = @"%@ does not use open security (%@)";
      }
      else
      {
        v133 = v100;
        v17 = @"%@ uses open security";
      }
      goto LABEL_159;
    case 0x27uLL:
      uint64_t v54 = (__CFString *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      unint64_t v55 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"Security"), "integerValue");
      int v56 = [a1 didPass];
      uint64_t v20 = NSString;
      if (!v54) {
        uint64_t v54 = @"Current network";
      }
      if (v56)
      {
        v133 = v54;
        unsigned int v134 = W5DescriptionForSecurity(v55);
        v17 = @"%@ does not use WEP security (%@)";
      }
      else
      {
        v133 = v54;
        v17 = @"%@ uses WEP security";
      }
      goto LABEL_159;
    case 0x28uLL:
      uint64_t v57 = (__CFString *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      unint64_t v58 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"Security"), "integerValue");
      int v59 = [a1 didPass];
      uint64_t v20 = NSString;
      if (!v57) {
        uint64_t v57 = @"Current network";
      }
      if (v59)
      {
        v133 = v57;
        unsigned int v134 = W5DescriptionForSecurity(v58);
        v17 = @"%@ does not use WPA security (%@)";
      }
      else
      {
        v133 = v57;
        v17 = @"%@ uses WPA security";
      }
      goto LABEL_159;
    case 0x29uLL:
      uint64_t v103 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      int v104 = [a1 didPass];
      uint64_t v105 = @"Current network";
      if (v103) {
        uint64_t v105 = (__CFString *)v103;
      }
      if (v104) {
        return (__CFString *)[NSString stringWithFormat:@"%@ is not using 802.11b", v105, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"%@ is using 802.11b", v105, v134, v135, v136, v137, v138, v139, v140, v141];
      }
    case 0x2AuLL:
      uint64_t v106 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      int v107 = [a1 didPass];
      uint64_t v108 = @"Current network";
      if (v106) {
        uint64_t v108 = (__CFString *)v106;
      }
      if (v107) {
        return (__CFString *)[NSString stringWithFormat:@"%@ is not ambiguous", v108, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"%@ is ambiguous", v108, v134, v135, v136, v137, v138, v139, v140, v141];
      }
    case 0x2BuLL:
      uint64_t v60 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      int v61 = [a1 didPass];
      long long v62 = @"Current network";
      if (v60) {
        long long v62 = (__CFString *)v60;
      }
      if (v61) {
        return (__CFString *)[NSString stringWithFormat:@"%@ is not marked as hidden", v62, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"%@ is marked as hidden", v62, v134, v135, v136, v137, v138, v139, v140, v141];
      }
    case 0x2CuLL:
      uint64_t v63 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      int v64 = [a1 didPass];
      long long v65 = @"Current network";
      if (v63) {
        long long v65 = (__CFString *)v63;
      }
      if (v64) {
        return (__CFString *)[NSString stringWithFormat:@"%@ is not an iOS PH", v65, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"%@ is an iOS PH", v65, v134, v135, v136, v137, v138, v139, v140, v141];
      }
    case 0x2DuLL:
      uint64_t v66 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      int v67 = [a1 didPass];
      long long v68 = @"Current network";
      if (v66) {
        long long v68 = (__CFString *)v66;
      }
      if (v67) {
        return (__CFString *)[NSString stringWithFormat:@"%@ is not Passpoint", v68, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"%@ is Passpoint", v68, v134, v135, v136, v137, v138, v139, v140, v141];
      }
    case 0x2EuLL:
      uint64_t v69 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
      int v70 = [a1 didPass];
      long long v71 = @"Current network";
      if (v69) {
        long long v71 = (__CFString *)v69;
      }
      if (v70) {
        return (__CFString *)[NSString stringWithFormat:@"%@ is not captive", v71, v134, v135, v136, v137, v138, v139, v140, v141];
      }
      else {
        return (__CFString *)[NSString stringWithFormat:@"%@ is captive", v71, v134, v135, v136, v137, v138, v139, v140, v141];
      }
    case 0x2FuLL:
      uint64_t v109 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PNLCount"), "integerValue");
      long long v73 = NSString;
      v133 = (__CFString *)v109;
      v17 = @"Wi-Fi PNL count (%ld)";
      goto LABEL_113;
    case 0x30uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"PNL contains hidden networks";
      uint64_t v42 = @"PNL does not contain hidden networks";
      goto LABEL_107;
    case 0x31uLL:
    case 0x32uLL:
      if ([a1 didPass])
      {
        uint64_t v28 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"Mbps");
        uint64_t v20 = NSString;
        v133 = (__CFString *)[v28 integerValue];
        v17 = @"Completed speed test (%ld Mbps)";
        goto LABEL_159;
      }
      unsigned int v120 = NSString;
      return (__CFString *)[v120 stringWithFormat:@"Failed to perform speed test"];
    case 0x33uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Current network is 'leaky'";
      uint64_t v42 = @"Current network is not 'leaky'";
      goto LABEL_107;
    case 0x34uLL:
      if ([a1 didPass])
      {
        uint64_t v72 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"NetworkName");
        long long v73 = NSString;
        v133 = (__CFString *)v72;
        v17 = @"Wi-Fi is associated to '%@'";
        goto LABEL_113;
      }
      return @"Wi-Fi is not associated";
    case 0x36uLL:
      int v40 = [a1 didPass];
      uint64_t v41 = @"Could not curl 'https://captive.apple.com'";
      uint64_t v42 = @"Could curl 'https://captive.apple.com'";
LABEL_107:
      if (v40) {
        return v42;
      }
      else {
        return v41;
      }
    case 0x39uLL:
      uint64_t v74 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv4InterfaceName");
      uint64_t v75 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv4ServiceName");
      long long v76 = (void *)[a1 info];
      long long v77 = @"IPv4ServiceID";
      goto LABEL_111;
    case 0x3AuLL:
      uint64_t v74 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv6InterfaceName");
      uint64_t v75 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"IPv6ServiceName");
      long long v76 = (void *)[a1 info];
      long long v77 = @"IPv6ServiceID";
LABEL_111:
      uint64_t v110 = [v76 objectForKeyedSubscript:v77];
      if (!v74) {
        return @"None";
      }
      long long v73 = NSString;
      unsigned int v134 = (__CFString *)v75;
      uint64_t v135 = v110;
      v133 = (__CFString *)v74;
      v17 = @"%@ (%@ / %@)";
LABEL_113:
      v111 = v73;
      goto LABEL_160;
    case 0x3BuLL:
      long long v78 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PingResult");
      long long v79 = NSString;
      if ([a1 didPass]) {
        long long v80 = "";
      }
      else {
        long long v80 = "not ";
      }
      uint64_t v81 = [v78 address];
      [v78 min];
      uint64_t v83 = v82;
      uint64_t v84 = W5DescriptionForPingTrafficClass([v78 trafficClass]);
      uint64_t v85 = [v78 dataLength] + 64;
      [v78 wait];
      return (__CFString *)[v79 stringWithFormat:@"Could %sping AWDL (%@ / %.2fms / %@ / %ld bytes / w=%fs / c=%ld)", v80, v81, v83, v84, v85, v86, objc_msgSend(v78, "count"), v140, v141];
    case 0x3CuLL:
      if ([a1 result])
      {
        int v112 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PeerDiagnosticsResults");
        uint64_t v20 = NSString;
        v133 = (__CFString *)[v112 count];
        v17 = @"Collected diagnostics from %lu device(s)";
        goto LABEL_159;
      }
      return @"No peers or no response";
    case 0x3DuLL:
      if ([a1 result])
      {
        uint64_t v113 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PeerDevicesInfo");
        unsigned int v114 = objc_msgSend((id)objc_msgSend(v113, "objectForKey:", @"numberOfIOSDevices"), "unsignedIntValue");
        unint64_t v115 = objc_msgSend((id)objc_msgSend(v113, "objectForKey:", @"numberOfTVOSDevices"), "unsignedIntValue")+ (unint64_t)v114;
        unint64_t v116 = v115
             + objc_msgSend((id)objc_msgSend(v113, "objectForKey:", @"numberOfMacOSDevices"), "unsignedIntValue");
        uint64_t v117 = (__CFString *)(v116
                            + objc_msgSend((id)objc_msgSend(v113, "objectForKey:", @"numberOfWatchOSDevices"), "unsignedIntValue"));
        uint64_t v4 = NSString;
        v133 = (__CFString *)[v113 objectForKeyedSubscript:@"DeviceModel"];
        unsigned int v134 = v117;
        v17 = @"Collected peer device info from %@: found %lu devices";
        goto LABEL_153;
      }
      os_log_t result = @"No response";
      break;
    case 0x3FuLL:
      uint64_t v118 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", @"PingsReceived");
      if ((unint64_t)[v118 count] < 2)
      {
        uint64_t v122 = (void *)[v118 firstObject];
        uint64_t v4 = NSString;
        if ([a1 didPass]) {
          unint64_t v5 = "";
        }
        else {
          unint64_t v5 = "not ";
        }
        uint64_t v6 = [v122 address];
        [v122 min];
        uint64_t v124 = v123;
        uint64_t v125 = W5DescriptionForPingTrafficClass([v122 trafficClass]);
        uint64_t v126 = [v122 dataLength] + 64;
        [v122 interval];
        uint64_t v128 = v127;
        [v122 wait];
        uint64_t v130 = v129;
        [v122 timeout];
        uint64_t v132 = v131;
        uint64_t v141 = [v122 count];
        uint64_t v139 = v130;
        uint64_t v140 = v132;
        uint64_t v138 = v128;
        v136 = v125;
        uint64_t v137 = v126;
        uint64_t v135 = v124;
        v17 = @"Could %sping IP address (%@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs / t=%fs / c=%ld)";
LABEL_152:
        v133 = (__CFString *)v5;
        unsigned int v134 = (__CFString *)v6;
LABEL_153:
        v111 = v4;
      }
      else
      {
        int v119 = [a1 didPass];
        uint64_t v20 = NSString;
        v133 = (__CFString *)[v118 count];
        if (v119) {
          v17 = @"Could ping IP address(es) (%ld)";
        }
        else {
          v17 = @"Could not ping IP address(es) (%ld)";
        }
LABEL_159:
        v111 = v20;
      }
LABEL_160:
      os_log_t result = (__CFString *)objc_msgSend(v111, "stringWithFormat:", v17, v133, v134, v135, v136, v137, v138, v139, v140, v141);
      break;
    default:
      uint64_t v4 = NSString;
      v133 = (__CFString *)[a1 testID];
      v17 = @"<%li>";
      goto LABEL_153;
  }
  return result;
}

__CFString *W5DescriptionForSecurity(unint64_t a1)
{
  if (a1 > 0xF) {
    return @"?";
  }
  else {
    return off_2641FDDB0[a1];
  }
}

__CFString *W5DescriptionForPingTrafficClass(uint64_t a1)
{
  if (a1 > 499)
  {
    if (a1 <= 699)
    {
      if (a1 == 500) {
        return @"RV";
      }
      if (a1 == 600) {
        return @"OAM";
      }
    }
    else
    {
      switch(a1)
      {
        case 700:
          return @"VI";
        case 800:
          return @"VO";
        case 900:
          return @"CTL";
      }
    }
  }
  else if (a1 <= 199)
  {
    if (!a1) {
      return @"BE";
    }
    if (a1 == 100) {
      return @"BK_SYS";
    }
  }
  else
  {
    switch(a1)
    {
      case 200:
        return @"BK";
      case 300:
        return @"RD";
      case 400:
        return @"AV";
    }
  }
  return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%ld>", a1);
}

id W5FormattedDescriptionForDiagnosticsTestResult(void *a1)
{
  return W5FormattedDescriptionForDiagnosticsTestResult2(a1, 0, 0);
}

__CFString *W5MachineSerialNumber()
{
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService) {
    return @"????????????";
  }
  io_object_t v3 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IOPlatformSerialNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    unint64_t v5 = CFProperty;
    uint64_t v6 = (__CFString *)[NSString stringWithString:CFProperty];
    CFRelease(v5);
  }
  else
  {
    uint64_t v6 = @"????????????";
  }
  IOObjectRelease(v3);
  return v6;
}

BOOL W5IsSelfAssignedIPv4(void *a1)
{
  CFDictionaryRef v1 = (void *)[a1 componentsSeparatedByString:@"."];
  return (unint64_t)[v1 count] >= 2
      && objc_msgSend((id)objc_msgSend(v1, "objectAtIndexedSubscript:", 0), "integerValue") == 169
      && objc_msgSend((id)objc_msgSend(v1, "objectAtIndexedSubscript:", 1), "integerValue") == 254;
}

uint64_t W5IsSelfAssignedIPv6(void *a1)
{
  CFDictionaryRef v1 = (void *)[a1 componentsSeparatedByString:@"::"];
  if ((unint64_t)[v1 count] < 2) {
    return 0;
  }
  uint64_t v2 = objc_msgSend((id)objc_msgSend(v1, "objectAtIndexedSubscript:", 1), "componentsSeparatedByString:", @":");
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "firstObject"), "lowercaseString"), "isEqualToString:", @"fe80");
  if (result) {
    return [v2 count] == 4;
  }
  return result;
}

id W5DescriptionForAWDLElectionParameters(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  io_object_t v3 = v2;
  if (a1)
  {
    objc_msgSend(v2, "appendFormat:", @"  Election ID           %u\n", *(unsigned __int16 *)(a1 + 18));
    objc_msgSend(v3, "appendFormat:", @"  Self Metric           0x%x\n", *(unsigned int *)(a1 + 32));
    objc_msgSend(v3, "appendFormat:", @"  Flags                 0x%x\n", *(unsigned __int8 *)(a1 + 16));
    objc_msgSend(v3, "appendFormat:", @"  Top Master Metric     0x%x\n", *(unsigned int *)(a1 + 28));
    objc_msgSend(v3, "appendFormat:", @"  Distance From Top     %u\n", *(unsigned __int8 *)(a1 + 20));
    objc_msgSend(v3, "appendFormat:", @"  Top Master            %02X:%02X:%02X:%02X:%02X:%02X\n", *(unsigned __int8 *)(a1 + 22), *(unsigned __int8 *)(a1 + 23), *(unsigned __int8 *)(a1 + 24), *(unsigned __int8 *)(a1 + 25), *(unsigned __int8 *)(a1 + 26), *(unsigned __int8 *)(a1 + 27));
  }
  uint64_t v4 = (void *)[v3 copy];
  return v4;
}

__CFString *W5DescriptionForAWDLSyncState(__CFString *result)
{
  if (result)
  {
    unsigned int v1 = HIDWORD(result->isa) - 1;
    if (v1 > 2) {
      return @"Stop";
    }
    else {
      return off_2641FDE30[v1];
    }
  }
  return result;
}

id W5DebugDescriptionForAWDLSyncState(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  io_object_t v3 = v2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 4);
    switch(v4)
    {
      case 1:
        objc_msgSend(v2, "appendFormat:", @"master [%02X:%02X:%02X:%02X:%02X:%02X]", *(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a1 + 9), *(unsigned __int8 *)(a1 + 10), *(unsigned __int8 *)(a1 + 11), *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
        break;
      case 2:
        objc_msgSend(v2, "appendFormat:", @"slave [%02X:%02X:%02X:%02X:%02X:%02X]", *(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a1 + 9), *(unsigned __int8 *)(a1 + 10), *(unsigned __int8 *)(a1 + 11), *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
        break;
      case 3:
        objc_msgSend(v2, "appendFormat:", @"non-election master [%02X:%02X:%02X:%02X:%02X:%02X]", *(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a1 + 9), *(unsigned __int8 *)(a1 + 10), *(unsigned __int8 *)(a1 + 11), *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
        break;
      default:
        [v2 appendString:@"stop"];
        break;
    }
  }
  unint64_t v5 = (void *)[v3 copy];
  return v5;
}

__CFString *W5DescriptionForAWDLOpMode(uint64_t a1)
{
  if (!a1) {
    return &stru_26C4FB5C0;
  }
  uint64_t v1 = *(unsigned int *)(a1 + 4);
  if (v1 <= 2) {
    uint64_t v2 = off_2641FDB80[v1];
  }
  else {
    uint64_t v2 = "UNKNOWN";
  }
  return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"AWDL OpMode: %s", v2);
}

id W5DescriptionForAWDLSyncParameters(unsigned int *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  io_object_t v3 = v2;
  if (a1)
  {
    objc_msgSend(v2, "appendFormat:", @"  AW Period             %d\n", a1[2]);
    objc_msgSend(v3, "appendFormat:", @"  AW Length             %d\n", a1[1]);
    objc_msgSend(v3, "appendFormat:", @"  Extension Length      %d\n", a1[3]);
    objc_msgSend(v3, "appendFormat:", @"  Sync Frame Period     %d (NE Master=%d)\n", a1[4], a1[5]);
  }
  int v4 = (void *)[v3 copy];
  return v4;
}

id W5DebugDescriptionForAWDLSyncChannelSequence(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  if (a1 && *(unsigned char *)(a1 + 5))
  {
    unint64_t v3 = 0;
    int v4 = (unsigned int *)(a1 + 16);
    while (1)
    {
      objc_msgSend(v2, "appendFormat:", @"%u", *v4);
      if (*v4)
      {
        unsigned int v5 = v4[1];
        uint64_t v6 = @"++";
        if ((v5 & 0x400) != 0) {
          goto LABEL_10;
        }
        if ((v5 & 4) != 0) {
          break;
        }
      }
LABEL_11:
      ++v3;
      unint64_t v7 = *(unsigned __int8 *)(a1 + 5);
      if (v3 < v7)
      {
        [v2 appendString:@" "];
        unint64_t v7 = *(unsigned __int8 *)(a1 + 5);
      }
      v4 += 3;
      if (v3 >= v7) {
        goto LABEL_14;
      }
    }
    if ((v5 & 0x200) != 0) {
      uint64_t v6 = @"+";
    }
    else {
      uint64_t v6 = @"-";
    }
LABEL_10:
    [v2 appendString:v6];
    goto LABEL_11;
  }
LABEL_14:
  uint64_t v8 = (void *)[v2 copy];
  return v8;
}

id W5DescriptionForAWDLSyncChannelSequence(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  if (a1)
  {
    id v3 = W5DebugDescriptionForAWDLSyncChannelSequence(a1);
    int v4 = (void *)[MEMORY[0x263EFF980] array];
    unsigned int v5 = (void *)[v3 componentsSeparatedByString:@" "];
    if ([v5 count])
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 1;
      do
      {
        double v9 = v7;
        uint64_t v10 = [v5 objectAtIndexedSubscript:v6];
        unint64_t v7 = (void *)v10;
        if (!v9 || !v10) {
          goto LABEL_11;
        }
        if ([v9 isEqualToString:v10])
        {
          uint64_t v11 = ++v8;
          if (v6 != [v5 count] - 1) {
            goto LABEL_11;
          }
        }
        else
        {
          uint64_t v11 = 1;
        }
        [v4 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@(%ld)", v9, v8)];
        uint64_t v8 = v11;
LABEL_11:
        ++v6;
      }
      while (v6 < [v5 count]);
    }
    if ([v4 count])
    {
      unint64_t v12 = 0;
      do
      {
        uint64_t v13 = [v4 objectAtIndexedSubscript:v12];
        if (v12 >= [v4 count] - 1) {
          uint64_t v14 = @"%@";
        }
        else {
          uint64_t v14 = @"%@ ";
        }
        objc_msgSend(v2, "appendFormat:", v14, v13);
        ++v12;
      }
      while (v12 < [v4 count]);
    }
  }
  uint64_t v15 = (void *)[v2 copy];
  return v15;
}

__CFString *W5DescriptionForAirDropDiscoverableMode(unint64_t a1)
{
  if (a1 >= 3) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a1);
  }
  else {
    return off_2641FDE48[a1];
  }
}

__CFString *W5DescriptionForAWDLScheduleState(uint64_t a1)
{
  if (!(!v2 & v1))
  {
    int v5 = a1;
    uint64_t result = @"Discovery";
    switch(v5)
    {
      case 0:
        return result;
      case 1:
      case 2:
      case 6:
      case 7:
      case 8:
        goto LABEL_11;
      case 3:
        return @"Idle";
      case 4:
        return @"Low Power";
      case 5:
        return @"Data";
      case 9:
        return @"RealTimeData";
      default:
        JUMPOUT(0);
    }
  }
  switch((int)a1)
  {
    case 24:
      uint64_t result = @"Scan + Data";
      break;
    case 26:
      uint64_t result = @"Scan + RealtimeData";
      break;
    case 28:
      uint64_t result = @"Piggyback Scan + Data";
      break;
    case 29:
      uint64_t result = @"Infra Priority";
      break;
    case 32:
      uint64_t result = @"Forced";
      break;
    default:
LABEL_11:
      uint64_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%u)", a1);
      break;
  }
  return result;
}

__CFString *W5DescriptionForDiagnosticsState(unint64_t a1)
{
  if (a1 > 0xB) {
    return 0;
  }
  else {
    return off_2641FDE60[a1];
  }
}

__CFString *W5DescriptionForDiagnosticsRole(char a1)
{
  if ((a1 & 8) != 0) {
    char v2 = @"Controller";
  }
  else {
    char v2 = &stru_26C4FB5C0;
  }
  if ((a1 & 4) == 0)
  {
    if ((a1 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    if ([(__CFString *)v2 length])
    {
      char v2 = (__CFString *)[(__CFString *)v2 stringByAppendingString:@"/Primary"];
      if ((a1 & 2) != 0) {
        goto LABEL_17;
      }
    }
    else
    {
      char v2 = @"Primary";
      if ((a1 & 2) != 0) {
        goto LABEL_17;
      }
    }
LABEL_7:
    if ((a1 & 0x10) == 0) {
      return v2;
    }
    goto LABEL_21;
  }
  if ([(__CFString *)v2 length])
  {
    char v2 = (__CFString *)[(__CFString *)v2 stringByAppendingString:@"/Sniffer"];
    if (a1) {
      goto LABEL_13;
    }
  }
  else
  {
    char v2 = @"Sniffer";
    if (a1) {
      goto LABEL_13;
    }
  }
LABEL_6:
  if ((a1 & 2) == 0) {
    goto LABEL_7;
  }
LABEL_17:
  if ([(__CFString *)v2 length])
  {
    char v2 = (__CFString *)[(__CFString *)v2 stringByAppendingString:@"/Secondary"];
    if ((a1 & 0x10) == 0) {
      return v2;
    }
  }
  else
  {
    char v2 = @"Secondary";
    if ((a1 & 0x10) == 0) {
      return v2;
    }
  }
LABEL_21:
  if (![(__CFString *)v2 length]) {
    return @"RemoteListener";
  }
  return (__CFString *)[(__CFString *)v2 stringByAppendingString:@"/RemoteListener"];
}

__CFString *W5DescriptionForDiagnosticsFaultType(uint64_t a1)
{
  uint64_t result = @"None";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = @"Home Theather";
      break;
    case 2:
    case 6:
      uint64_t result = @"Airplay Audio";
      break;
    case 3:
      uint64_t result = @"Siri";
      break;
    case 4:
    case 5:
    case 7:
      goto LABEL_4;
    default:
      if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_4:
      }
        uint64_t result = @"Unknown";
      else {
        uint64_t result = @"Unsupported";
      }
      break;
  }
  return result;
}

__CFString *W5ExtendedDescriptionForDiagnosticsTestID(unint64_t a1)
{
  if (a1 >= 0x3F) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%li>", a1);
  }
  else {
    return off_2641FDEC0[a1];
  }
}

__CFString *W5DescriptionForIPv4ConfigMethod(unint64_t a1)
{
  if (a1 >= 8) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a1);
  }
  else {
    return off_2641FE0B8[a1];
  }
}

__CFString *W5DescriptionForIPv6ConfigMethod(unint64_t a1)
{
  if (a1 >= 6) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a1);
  }
  else {
    return off_2641FE0F8[a1];
  }
}

__CFString *W5DescriptionForEventID(uint64_t a1)
{
  uint64_t result = @"None";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = @"WiFi Status Changed";
      break;
    case 2:
      uint64_t result = @"AWDL Status Changed";
      break;
    case 3:
      uint64_t result = @"Bluetooth Status Changed";
      break;
    case 4:
      uint64_t result = @"Network Status Changed";
      break;
    case 5:
      uint64_t result = @"Power Status Changed";
      break;
    case 6:
      uint64_t result = @"Peer Updated";
      break;
    case 7:
      uint64_t result = @"Upload Performance Test Updated";
      break;
    default:
      if (a1 == 38) {
        uint64_t result = @"Fault Detected";
      }
      else {
        uint64_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a1);
      }
      break;
  }
  return result;
}

__CFString *W5DescriptionForLogItemID(unint64_t a1)
{
  if (a1 >= 0x5D) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%li>", a1);
  }
  else {
    return off_2641FE128[a1];
  }
}

id W5DescriptionForReachabilityFlags(int a1, uint64_t a2)
{
  int v4 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  int v5 = v4;
  if (a1) {
    unint64_t v6 = "Yes";
  }
  else {
    unint64_t v6 = "No";
  }
  [v4 appendFormat:@"%@TransientConnection: %s\n", a2, v6];
  if ((a1 & 2) != 0) {
    unint64_t v7 = "Yes";
  }
  else {
    unint64_t v7 = "No";
  }
  [v5 appendFormat:@"%@Reachable: %s\n", a2, v7];
  if ((a1 & 4) != 0) {
    uint64_t v8 = "Yes";
  }
  else {
    uint64_t v8 = "No";
  }
  [v5 appendFormat:@"%@ConnectionRequired: %s\n", a2, v8];
  if ((a1 & 8) != 0) {
    double v9 = "Yes";
  }
  else {
    double v9 = "No";
  }
  [v5 appendFormat:@"%@ConnectionOnTraffic: %s\n", a2, v9];
  if ((a1 & 0x10) != 0) {
    uint64_t v10 = "Yes";
  }
  else {
    uint64_t v10 = "No";
  }
  [v5 appendFormat:@"%@InterventionRequired: %s\n", a2, v10];
  if ((a1 & 0x20) != 0) {
    uint64_t v11 = "Yes";
  }
  else {
    uint64_t v11 = "No";
  }
  [v5 appendFormat:@"%@ConnectionOnDemand: %s\n", a2, v11];
  if ((a1 & 0x10000) != 0) {
    unint64_t v12 = "Yes";
  }
  else {
    unint64_t v12 = "No";
  }
  [v5 appendFormat:@"%@IsLocalAddress: %s\n", a2, v12];
  if ((a1 & 0x20000) != 0) {
    uint64_t v13 = "Yes";
  }
  else {
    uint64_t v13 = "No";
  }
  [v5 appendFormat:@"%@IsDirect: %s\n", a2, v13];
  if ((a1 & 0x40000) != 0) {
    uint64_t v14 = "Yes";
  }
  else {
    uint64_t v14 = "No";
  }
  [v5 appendFormat:@"%@IsWWAN: %s", a2, v14];
  uint64_t v15 = (void *)[v5 copy];
  return v15;
}

__CFString *W5DescriptionForDeviceType(unint64_t a1)
{
  uint64_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%lu)", a1);
  if (a1 <= 7) {
    return off_2641FE410[a1];
  }
  return result;
}

__CFString *W5DescriptionForPowerSourceType(unint64_t a1)
{
  if (a1 >= 4) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a1);
  }
  else {
    return off_2641FE450[a1];
  }
}

__CFString *W5DescriptionForBatteryWarningLevel(unsigned int a1)
{
  if (a1 - 1 >= 3) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a1);
  }
  else {
    return off_2641FE470[a1 - 1];
  }
}

uint64_t W5DescriptionForPowerStateCaps()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (IOPMGetCapabilitiesDescription()) {
    return [NSString stringWithUTF8String:v1];
  }
  else {
    return 0;
  }
}

__CFString *W5DescriptionForChannelWidth(void *a1)
{
  if (([a1 flags] & 0x400) != 0) {
    return @"80 MHz";
  }
  if (([a1 flags] & 4) != 0) {
    return @"40 MHz";
  }
  if (([a1 flags] & 2) != 0) {
    return @"20 MHz";
  }
  return 0;
}

__CFString *W5DescriptionForEAPOLControlMode(uint64_t a1)
{
  if (a1 >= 4) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%d)", a1);
  }
  else {
    return off_2641FE488[(int)a1];
  }
}

__CFString *W5DescriptionForEAPOLControlState(uint64_t a1)
{
  if (a1 >= 4) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%d)", a1);
  }
  else {
    return off_2641FE4A8[(int)a1];
  }
}

__CFString *W5DescriptionForEAPOLSupplicantState(uint64_t a1)
{
  if (a1 >= 9) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (%d)", a1);
  }
  else {
    return off_2641FE4C8[(int)a1];
  }
}

__CFString *W5DescriptionForOpMode(uint64_t a1)
{
  if (!a1) {
    return @"None";
  }
  if ((a1 & 0x10) != 0) {
    return @"MONITOR";
  }
  if (a1) {
    return @"STA";
  }
  if ((a1 & 2) != 0) {
    return @"IBSS";
  }
  if ((a1 & 8) != 0) {
    return @"HOSTAP";
  }
  return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (0x%X)", a1);
}

__CFString *W5DescriptionForPHYMode(uint64_t a1)
{
  if (!a1) {
    return @"None";
  }
  if ((a1 & 0x100) != 0) {
    return @"11ax";
  }
  if ((a1 & 0x80) != 0) {
    return @"11ac";
  }
  if ((a1 & 0x10) != 0) {
    return @"11n";
  }
  if ((a1 & 8) != 0) {
    return @"11g";
  }
  if ((a1 & 2) != 0) {
    return @"11a";
  }
  if ((a1 & 4) != 0) {
    return @"11b";
  }
  return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"? (0x%X)", a1);
}

id W5DescriptionForPower(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  if (a1)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 4);
    if (v3 >= 4) {
      unsigned int v3 = 4;
    }
    if (v3)
    {
      unint64_t v4 = 0;
      do
      {
        switch(*(_DWORD *)(a1 + 8 + 4 * v4))
        {
          case 0:
            int v5 = v2;
            unint64_t v6 = @"Off";
            goto LABEL_13;
          case 1:
            int v5 = v2;
            unint64_t v6 = @"On";
            goto LABEL_13;
          case 2:
            int v5 = v2;
            unint64_t v6 = @"Tx";
            goto LABEL_13;
          case 3:
            int v5 = v2;
            unint64_t v6 = @"Rx";
            goto LABEL_13;
          case 4:
            int v5 = v2;
            unint64_t v6 = @"Restricted";
LABEL_13:
            [v5 appendString:v6];
            break;
          default:
            objc_msgSend(v2, "appendFormat:", @"%u", *(unsigned int *)(a1 + 8 + 4 * v4));
            break;
        }
        LODWORD(v7) = *(_DWORD *)(a1 + 4);
        if (v4 < (v7 - 1))
        {
          [v2 appendFormat:@","];
          LODWORD(v7) = *(_DWORD *)(a1 + 4);
        }
        ++v4;
        if (v7 >= 4) {
          unint64_t v7 = 4;
        }
        else {
          unint64_t v7 = v7;
        }
      }
      while (v4 < v7);
    }
  }
  uint64_t v8 = (void *)[v2 copy];
  return v8;
}

id W5DescriptionForChainAck(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  if (a1)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 4);
    if (v3 >= 4) {
      unsigned int v3 = 4;
    }
    if (v3)
    {
      for (unint64_t i = 0; i < v8; ++i)
      {
        int v5 = *(_DWORD *)(a1 + 8 + 4 * i);
        if (v5 == 1)
        {
          unint64_t v6 = v2;
          unint64_t v7 = @"On";
        }
        else
        {
          if (v5)
          {
            objc_msgSend(v2, "appendFormat:", @"%u", *(unsigned int *)(a1 + 8 + 4 * i));
            goto LABEL_12;
          }
          unint64_t v6 = v2;
          unint64_t v7 = @"Off";
        }
        [v6 appendString:v7];
LABEL_12:
        LODWORD(v_Block_object_dispose(&STACK[0x310], 8) = *(_DWORD *)(a1 + 4);
        if (i < (v8 - 1))
        {
          [v2 appendFormat:@","];
          LODWORD(v_Block_object_dispose(&STACK[0x310], 8) = *(_DWORD *)(a1 + 4);
        }
        if (v8 >= 4) {
          unint64_t v8 = 4;
        }
        else {
          unint64_t v8 = v8;
        }
      }
    }
  }
  double v9 = (void *)[v2 copy];
  return v9;
}

__CFString *W5DescriptionForChainPowerState(uint64_t a1)
{
  if (a1 >= 3) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%u", a1);
  }
  else {
    return off_2641FE510[(int)a1];
  }
}

id W5DescriptionForTxChainPower(unsigned int *a1, uint64_t a2)
{
  unint64_t v4 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v4 appendFormat:@"%@Current: %i\n", a2, a1[2]];
  [v4 appendFormat:@"%@Offset: %i\n", a2, a1[1]];
  [v4 appendFormat:@"%@Min: %i\n", a2, a1[3]];
  [v4 appendFormat:@"%@Max: %i\n", a2, a1[4]];
  int v5 = (void *)[v4 copy];
  return v5;
}

id W5DescriptionForDesense(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  int v5 = v4;
  if (a1 && a2)
  {
    int v6 = *(_DWORD *)(a1 + 4);
    if ((~v6 & 3) != 0)
    {
      if (v6)
      {
        objc_msgSend(v4, "appendFormat:", @"2GHz[%i,%i] lvl %i", *(__int16 *)(a1 + 8), *(__int16 *)(a1 + 10), *(unsigned int *)(a2 + 4), v9, v10);
      }
      else if ((v6 & 2) != 0)
      {
        objc_msgSend(v4, "appendFormat:", @"5GHz[%i,%i] lvl %i", *(__int16 *)(a1 + 12), *(__int16 *)(a1 + 14), *(unsigned int *)(a2 + 4), v9, v10);
      }
      else
      {
        [v4 appendString:@"None"];
      }
    }
    else
    {
      objc_msgSend(v4, "appendFormat:", @"2GHz[%i,%i] 5GHz[%i,%i] lvl %i", *(__int16 *)(a1 + 8), *(__int16 *)(a1 + 10), *(__int16 *)(a1 + 12), *(__int16 *)(a1 + 14), *(unsigned int *)(a2 + 4));
    }
  }
  unint64_t v7 = (void *)[v5 copy];
  return v7;
}

id W5DescriptionForDesenseFlags(int a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  unsigned int v3 = v2;
  unint64_t v4 = @"5GHz";
  if ((a1 & 2) == 0) {
    unint64_t v4 = @"None";
  }
  if (a1) {
    unint64_t v4 = @"2GHz";
  }
  if ((~a1 & 3) != 0) {
    int v5 = v4;
  }
  else {
    int v5 = @"2GHz 5GHz";
  }
  [v2 appendString:v5];
  int v6 = (void *)[v3 copy];
  return v6;
}

id W5DescriptionForBTCMode(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  unsigned int v3 = v2;
  switch((int)a1)
  {
    case 0:
      unint64_t v4 = @"Off";
      goto LABEL_12;
    case 1:
      unint64_t v4 = @"On";
      goto LABEL_12;
    case 2:
      unint64_t v4 = @"Default";
      goto LABEL_12;
    case 3:
      unint64_t v4 = @"Full TDM";
      goto LABEL_12;
    case 4:
      unint64_t v4 = @"Full TDM Preempt";
      goto LABEL_12;
    case 5:
      unint64_t v4 = @"Lightweight";
      goto LABEL_12;
    case 6:
      unint64_t v4 = @"Unique Antennae";
      goto LABEL_12;
    case 7:
      unint64_t v4 = @"Hybrid";
      goto LABEL_12;
    case 8:
      unint64_t v4 = @"Hybrid (WLTX)";
LABEL_12:
      [v2 appendString:v4];
      break;
    default:
      objc_msgSend(v2, "appendFormat:", @"? (%i)", a1);
      break;
  }
  int v5 = (void *)[v3 copy];
  return v5;
}

id W5DescriptionForBTCProfile(unsigned int *a1, uint64_t a2)
{
  unint64_t v4 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v4 appendFormat:@"%@Mode: %@\n", a2, W5DescriptionForBTCMode(*a1)];
  [v4 appendFormat:@"%@Desense: %@\n", a2, W5DescriptionForDesenseFlags(a1[1])];
  [v4 appendFormat:@"%@Desense Level: %i\n", a2, a1[2]];
  [v4 appendFormat:@"%@Desense Threshold: [%i,%i]\n", a2, a1[4], a1[3]];
  [v4 appendFormat:@"%@Chain Ack: [", a2];
  if (a1[5])
  {
    unint64_t v5 = 0;
    do
    {
      if (a1[v5 + 6] == 1) {
        int v6 = "On";
      }
      else {
        int v6 = "Off";
      }
      objc_msgSend(v4, "appendFormat:", @"%s", v6);
      unsigned int v7 = a1[5];
      if (v5 < v7 - 1)
      {
        [v4 appendString:@","];
        unsigned int v7 = a1[5];
      }
      ++v5;
    }
    while (v5 < v7);
  }
  [v4 appendString:@"]\n"];
  [v4 appendFormat:@"%@Chain Tx Power Offset: [", a2];
  if (a1[5])
  {
    unint64_t v8 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", @"%i", a1[v8 + 10]);
      unsigned int v9 = a1[5];
      if (v8 < v9 - 1)
      {
        [v4 appendString:@","];
        unsigned int v9 = a1[5];
      }
      ++v8;
    }
    while (v8 < v9);
  }
  [v4 appendString:@"]\n"];
  [v4 appendFormat:@"%@WiFi RSSI Threshold / Hysteresis: %i/%i\n", a2, a1[14], a1[15]];
  [v4 appendFormat:@"%@BT RSSI Threshold / Hysteresis: %i/%i\n", a2, a1[16], a1[17]];
  [v4 appendFormat:@"%@SISO Resp Enable: [", a2];
  if (a1[18])
  {
    unint64_t v10 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", @"%i", a1[v10 + 19]);
      unsigned int v11 = a1[18];
      if (v10 < v11 - 1)
      {
        [v4 appendString:@","];
        unsigned int v11 = a1[18];
      }
      ++v10;
    }
    while (v10 < v11);
  }
  [v4 appendString:@"]\n"];
  [v4 appendFormat:@"%@Max SISO Resp Power: [", a2];
  if (a1[18])
  {
    unint64_t v12 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", @"%i", a1[v12 + 27]);
      unsigned int v13 = a1[18];
      if (v12 < v13 - 1)
      {
        [v4 appendString:@","];
        unsigned int v13 = a1[18];
      }
      ++v12;
    }
    while (v12 < v13);
  }
  [v4 appendString:@"]\n"];
  uint64_t v14 = (void *)[v4 copy];
  return v14;
}

uint64_t W5DescriptionForBluetoothDeviceType(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"0x%lx", a1);
  unint64_t v5 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"0x%lx", a2);
  switch(a1)
  {
    case 0:
      int v6 = @"Misc";
      break;
    case 1:
      if (a2 < 7) {
        unint64_t v5 = off_2641FE528[a2];
      }
      int v6 = @"Computer";
      break;
    case 2:
      if (a2 < 6) {
        unint64_t v5 = off_2641FE560[a2];
      }
      int v6 = @"Phone";
      break;
    case 3:
      int v6 = @"Access Point";
      break;
    case 4:
      if (a2 < 0x13 && ((0x5FFF7u >> a2) & 1) != 0) {
        unint64_t v5 = off_2641FE590[a2];
      }
      int v6 = @"Audio";
      break;
    case 5:
      unint64_t v7 = (a2 & 0xF) - 1;
      if (v7 >= 9)
      {
        unint64_t v9 = a2 & 0x30;
        int v6 = @"Peripheral";
        if (v9 == 48)
        {
          unint64_t v5 = @"Combo";
        }
        else
        {
          unint64_t v10 = @"Keyboard";
          if (v9 == 16) {
            int v6 = @"Peripheral";
          }
          else {
            unint64_t v10 = v5;
          }
          if (v9 == 32) {
            unint64_t v5 = @"Mouse";
          }
          else {
            unint64_t v5 = v10;
          }
          if (v9 == 32) {
            int v6 = @"Peripheral";
          }
        }
      }
      else
      {
        unint64_t v5 = off_2641FE628[v7];
        int v6 = @"Peripheral";
      }
      break;
    case 6:
      unint64_t v8 = __ROR8__(a2, 2);
      if (v8 < 9 && ((0x117u >> v8) & 1) != 0) {
        unint64_t v5 = off_2641FE670[v8];
      }
      int v6 = @"Imaging";
      break;
    case 7:
      if (a2 - 1 < 5) {
        unint64_t v5 = off_2641FE6B8[a2 - 1];
      }
      int v6 = @"Wearable";
      break;
    case 8:
      if (a2 - 1 < 5) {
        unint64_t v5 = off_2641FE6E0[a2 - 1];
      }
      int v6 = @"Toy";
      break;
    case 9:
      if (a2 < 8) {
        unint64_t v5 = off_2641FE708[a2];
      }
      int v6 = @"Health";
      break;
    default:
      if (a1 == 31) {
        int v6 = @"Unclassified";
      }
      else {
        int v6 = (__CFString *)v4;
      }
      break;
  }
  return [NSString stringWithFormat:@"%@ - %@", v6, v5];
}

__CFString *W5DescriptionForBluetoothDeviceManufacturer(uint64_t a1)
{
  uint64_t result = @"Ericsson";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = @"Nokia";
      break;
    case 2:
      uint64_t result = @"Intel";
      break;
    case 3:
      uint64_t result = @"IBM";
      break;
    case 4:
      uint64_t result = @"Toshiba";
      break;
    case 5:
      uint64_t result = @"3Com";
      break;
    case 6:
      uint64_t result = @"Microsoft";
      break;
    case 7:
      uint64_t result = @"Lucent";
      break;
    case 8:
      uint64_t result = @"Motorola";
      break;
    case 9:
      uint64_t result = @"Infineon";
      break;
    case 10:
      uint64_t result = @"Cambridge";
      break;
    case 11:
      uint64_t result = @"Silicon Wave";
      break;
    case 12:
      uint64_t result = @"Digianswer";
      break;
    case 13:
      uint64_t result = @"Texas Instruments";
      break;
    case 14:
      uint64_t result = @"Parthus";
      break;
    case 15:
      uint64_t result = @"Broadcom";
      break;
    case 16:
      uint64_t result = @"Mitel";
      break;
    case 17:
      uint64_t result = @"Widcomm";
      break;
    case 18:
      uint64_t result = @"Zeevo";
      break;
    case 19:
      uint64_t result = @"Atmel";
      break;
    case 20:
      uint64_t result = @"Mitsubishi";
      break;
    case 21:
      uint64_t result = @"RXT Telecom";
      break;
    case 22:
      uint64_t result = @"KC Technology";
      break;
    case 23:
      uint64_t result = @"New Logic";
      break;
    case 24:
      uint64_t result = @"Transilica";
      break;
    case 25:
      uint64_t result = @"Rohde and Schwarz";
      break;
    case 26:
      uint64_t result = @"TTPCom";
      break;
    case 27:
      uint64_t result = @"Signia";
      break;
    case 28:
      uint64_t result = @"Conexant";
      break;
    case 29:
      uint64_t result = @"Qualcomm";
      break;
    case 30:
      uint64_t result = @"Inventel";
      break;
    case 31:
      uint64_t result = @"AVM Berlin";
      break;
    case 32:
      uint64_t result = @"Bandspeed";
      break;
    case 33:
      uint64_t result = @"Mansella";
      break;
    case 34:
      uint64_t result = @"NEC";
      break;
    case 35:
      uint64_t result = @"Wave Plus";
      break;
    case 36:
      uint64_t result = @"Alcatel";
      break;
    case 37:
      uint64_t result = @"Philips";
      break;
    case 38:
      uint64_t result = @"CTechnologies";
      break;
    case 39:
      uint64_t result = @"Open Interface";
      break;
    case 40:
      uint64_t result = @"RFC Micro";
      break;
    case 41:
      uint64_t result = @"Hitachi";
      break;
    case 42:
      uint64_t result = @"Symbol";
      break;
    case 43:
      uint64_t result = @"Tenovis";
      break;
    case 44:
      uint64_t result = @"Macronix";
      break;
    case 45:
      uint64_t result = @"GCT Semi";
      break;
    case 46:
      uint64_t result = @"Norwood";
      break;
    case 47:
      uint64_t result = @"MewTel";
      break;
    case 48:
      uint64_t result = @"ST Micro";
      break;
    case 49:
      uint64_t result = @"Synopsys";
      break;
    case 50:
      uint64_t result = @"Red M Comms";
      break;
    case 51:
      uint64_t result = @"Commil";
      break;
    case 52:
      uint64_t result = @"CATC";
      break;
    case 53:
      uint64_t result = @"Eclipse";
      break;
    case 54:
      uint64_t result = @"Renesas";
      break;
    case 55:
      uint64_t result = @"Mobilian";
      break;
    case 56:
      uint64_t result = @"Terax";
      break;
    case 57:
      uint64_t result = @"Integrated System Solution";
      break;
    case 58:
      uint64_t result = @"Matsushita";
      break;
    case 59:
      uint64_t result = @"Gennum";
      break;
    case 60:
      uint64_t result = @"RIM";
      break;
    case 61:
      uint64_t result = @"IPextreme";
      break;
    case 62:
      uint64_t result = @"System and Chips";
      break;
    case 63:
      uint64_t result = @"Bluetooth SIG";
      break;
    case 64:
      uint64_t result = @"Seiko Epson";
      break;
    case 65:
      uint64_t result = @"Integrated Silicon Solution";
      break;
    case 66:
      uint64_t result = @"CONWISE";
      break;
    case 67:
      uint64_t result = @"Parrot";
      break;
    case 68:
      uint64_t result = @"Socket Comms";
      break;
    case 69:
      uint64_t result = @"Atheros Comms";
      break;
    case 70:
      uint64_t result = @"MediaTek";
      break;
    case 71:
      uint64_t result = @"Bluegiga";
      break;
    case 72:
      uint64_t result = @"Marvell";
      break;
    case 73:
      uint64_t result = @"3DSP";
      break;
    case 74:
      uint64_t result = @"Accel Semi";
      break;
    case 75:
      uint64_t result = @"Continental Auto";
      break;
    case 76:
      uint64_t result = @"Apple";
      break;
    case 77:
      uint64_t result = @"Staccato";
      break;
    case 78:
      uint64_t result = @"Avago";
      break;
    case 79:
      uint64_t result = @"APT";
      break;
    case 80:
      uint64_t result = @"SiRF";
      break;
    case 81:
      uint64_t result = @"TZero";
      break;
    case 82:
      uint64_t result = @"JandM";
      break;
    case 83:
      uint64_t result = @"Free2Move";
      break;
    case 84:
      uint64_t result = @"3DiJoy";
      break;
    case 85:
      uint64_t result = @"Plantronics";
      break;
    case 86:
      uint64_t result = @"Sony Ericsson";
      break;
    case 87:
      uint64_t result = @"Harmon";
      break;
    case 88:
      uint64_t result = @"Visio";
      break;
    case 89:
      uint64_t result = @"Nordic";
      break;
    case 90:
      uint64_t result = @"EMMicro";
      break;
    default:
      if (a1 == 0xFFFF) {
        uint64_t result = @"Interop ID";
      }
      else {
        uint64_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%ld>", a1);
      }
      break;
  }
  return result;
}

__CFString *W5DescriptionForBluetoothDeviceRole(unint64_t a1)
{
  if (a1 >= 5) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%ld>", a1);
  }
  else {
    return off_2641FE748[a1];
  }
}

__CFString *W5DescriptionForBluetoothDeviceConnectionMode(unint64_t a1)
{
  if (a1 >= 5) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%ld>", a1);
  }
  else {
    return off_2641FE770[a1];
  }
}

__CFString *W5DescriptionForWiFiDropReason(unint64_t a1)
{
  if (a1 >= 7) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"<%ld>", a1);
  }
  else {
    return off_2641FE798[a1];
  }
}

id W5DescriptionForFaultsStatus(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  if (a1 && [a1 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(a1);
          }
          unint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_msgSend(v2, "appendFormat:", @"    Fault                : %s\n", objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"type"), "UTF8String"));
          [v2 appendFormat:@"%@", __printDictionaryContents(v7, objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"date", @"interface", 0), 0)];
        }
        uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  else
  {
    [v2 appendFormat:@"    None\n"];
  }
  return (id)[v2 copy];
}

id __printDictionaryContents(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (qword_26AB09F80 != -1) {
    dispatch_once(&qword_26AB09F80, &__block_literal_global_2639);
  }
  int v6 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v7 = (void *)[a1 allKeys];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  if ([v7 containsObject:@"date"])
  {
    id v9 = (id)[MEMORY[0x263EFF9B0] orderedSetWithObject:@"date"];
    id v10 = v9;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  }
  [v9 addObjectsFromArray:v8];
  if (a2) {
    [v9 intersectSet:a2];
  }
  if (a3) {
    [v9 minusSet:a3];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unsigned int v13 = @"date";
    uint64_t v14 = *(void *)v30;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      uint64_t v28 = v12;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
        v17 = (void *)[a1 valueForKey:v16];
        if ([v16 containsString:v13])
        {
          [v17 timeIntervalSinceNow];
          objc_msgSend(v6, "appendFormat:", @"    |> Age               : %02ld:%02ld:%02ld HH:MM:SS Ago\n", (unint64_t)-v18 / 0xE10, (unint64_t)-v18 % 0xE10 / 0x3C, (unint64_t)-v18 % 0xE10 % 0x3C);
          uint64_t v16 = (void *)[NSString stringWithFormat:@"%@", objc_msgSend((id)qword_26AB09F78, "stringFromDate:", v17)];
          int v19 = @"    |> Date              : %s\n";
LABEL_25:
          objc_msgSend(v6, "appendFormat:", v19, objc_msgSend(v16, "UTF8String"));
          goto LABEL_26;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v20 = v13;
          uint64_t v21 = a1;
          id v22 = v9;
          objc_msgSend(v6, "appendFormat:", @"    |> %s", objc_msgSend(v16, "UTF8String"));
          if ((unint64_t)[v16 length] <= 0x11)
          {
            if ([v16 length] != 18)
            {
              unsigned int v23 = 1;
              do
                [v6 appendFormat:@" "];
              while (18 - [v16 length] > (unint64_t)v23++);
            }
          }
          else
          {
            [v6 appendFormat:@" "];
          }
          uint64_t v16 = (void *)[NSString stringWithFormat:@"%@", v17];
          int v19 = @": %s\n";
          id v9 = v22;
          a1 = v21;
          unsigned int v13 = v20;
          uint64_t v14 = v27;
          uint64_t v12 = v28;
          goto LABEL_25;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v19 = @"    |> %s (NSDictionary not followed)";
          goto LABEL_25;
        }
        objc_opt_class();
        int v19 = @"    |> %s (NSArray not followed)";
        if (objc_opt_isKindOfClass()) {
          goto LABEL_25;
        }
LABEL_26:
        ++v15;
      }
      while (v15 != v12);
      uint64_t v25 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v12 = v25;
    }
    while (v25);
  }

  return (id)[v6 copy];
}

id W5DescriptionForLinkTestsStatus(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  if (a1 && [a1 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(a1);
          }
          unint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_msgSend(v2, "appendFormat:", @"    Reason               : %s\n", objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"initiatingReason"), "UTF8String"));
          [v2 appendFormat:@"%@", __printDictionaryContents(v7, 0, objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"initiatingReason", 0))];
        }
        uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  else
  {
    [v2 appendFormat:@"    None\n"];
  }
  return (id)[v2 copy];
}

id W5DescriptionForRecoveriesStatus(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  if (a1 && [a1 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(a1);
          }
          unint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_msgSend(v2, "appendFormat:", @"    Reason               : %s\n", objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"recoveryReason"), "UTF8String"));
          [v2 appendFormat:@"%@", __printDictionaryContents(v7, 0, objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"recoveryReason", 0))];
        }
        uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  else
  {
    [v2 appendFormat:@"    None\n"];
  }
  return (id)[v2 copy];
}

id __printBTCProfile(unsigned int *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  objc_msgSend(v2, "appendFormat:", @"      Mode                      : %s\n", objc_msgSend(W5DescriptionForBTCMode(*a1), "UTF8String"));
  objc_msgSend(v2, "appendFormat:", @"      Desense                   : %s\n", objc_msgSend(W5DescriptionForDesenseFlags(a1[1]), "UTF8String"));
  objc_msgSend(v2, "appendFormat:", @"      Desense Lvl               : %i\n", a1[2]);
  objc_msgSend(v2, "appendFormat:", @"      Desense Thr               : [%i,%i]\n", a1[4], a1[3]);
  [v2 appendFormat:@"      Chain Ack                 : ["];
  if (a1[5])
  {
    unint64_t v3 = 0;
    do
    {
      if (a1[v3 + 6] == 1) {
        uint64_t v4 = "On";
      }
      else {
        uint64_t v4 = "Off";
      }
      objc_msgSend(v2, "appendFormat:", @"%s", v4);
      unsigned int v5 = a1[5];
      if (v3 < v5 - 1)
      {
        [v2 appendFormat:@","];
        unsigned int v5 = a1[5];
      }
      ++v3;
    }
    while (v3 < v5);
  }
  [v2 appendFormat:@"]\n"];
  [v2 appendFormat:@"      Chain Tx Power Offset     : ["];
  if (a1[5])
  {
    unint64_t v6 = 0;
    do
    {
      objc_msgSend(v2, "appendFormat:", @"%i", a1[v6 + 10]);
      unsigned int v7 = a1[5];
      if (v6 < v7 - 1)
      {
        [v2 appendFormat:@","];
        unsigned int v7 = a1[5];
      }
      ++v6;
    }
    while (v6 < v7);
  }
  [v2 appendFormat:@"]\n"];
  objc_msgSend(v2, "appendFormat:", @"      WiFi RSSI Thresh / Hyst   : %i/%i\n", a1[14], a1[15]);
  objc_msgSend(v2, "appendFormat:", @"      BT RSSI Thresh / Hyst     : %i/%i\n", a1[16], a1[17]);
  [v2 appendFormat:@"      SISO Resp Enable          : ["];
  if (a1[18])
  {
    unint64_t v8 = 0;
    do
    {
      objc_msgSend(v2, "appendFormat:", @"%i", a1[v8 + 19]);
      unsigned int v9 = a1[18];
      if (v8 < v9 - 1)
      {
        [v2 appendFormat:@","];
        unsigned int v9 = a1[18];
      }
      ++v8;
    }
    while (v8 < v9);
  }
  [v2 appendFormat:@"]\n"];
  [v2 appendFormat:@"      Max SISO Resp Power       : ["];
  if (a1[18])
  {
    unint64_t v10 = 0;
    do
    {
      objc_msgSend(v2, "appendFormat:", @"%i", a1[v10 + 27]);
      unsigned int v11 = a1[18];
      if (v10 < v11 - 1)
      {
        [v2 appendFormat:@","];
        unsigned int v11 = a1[18];
      }
      ++v10;
    }
    while (v10 < v11);
  }
  [v2 appendFormat:@"]\n"];
  long long v12 = (void *)[v2 copy];
  return v12;
}

uint64_t ____printDictionaryContents_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  qword_26AB09F78 = (uint64_t)v0;
  return [v0 setDateFormat:@"yyyy'-'MM'-'dd HH:mm:ss.SSS"];
}

void sub_2142A1834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2142A1FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2142A3258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2142A37CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2142A40B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2142A4904(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2142A4C58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2142A867C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2142A9364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2142AA620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2142AAEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2142AB670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2142ACAD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2142ACE84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2142AD118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2142AD34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

uint64_t IOPMGetCapabilitiesDescription()
{
  return MEMORY[0x270EF48B0]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x270F97D18]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x270F97E00]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x270F97FA0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x270F97FE8]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x270F98070]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x270ED9308](object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openpty(int *a1, int *a2, char *a3, termios *a4, winsize *a5)
{
  return MEMORY[0x270EDA868](a1, a2, a3, a4, a5);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_transaction_get_description()
{
  return MEMORY[0x270EDAA98]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t xpc_transaction_try_exit_clean()
{
  return MEMORY[0x270EDC420]();
}