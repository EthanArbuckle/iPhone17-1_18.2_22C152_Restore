void sub_100002388()
{
  void *v0;
  void *v1;
  unsigned __int8 v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  id obj;
  id v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  unsigned char v27[128];

  v0 = +[RMECacheEnumerator getGcoreSpoolWithCreateIfNecessary:0];
  if (!v0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Unable to get RME gcore spool path, the container may not exist";
LABEL_21:
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v13, buf, 2u);
    goto LABEL_24;
  }
  v20 = 0;
  v1 = +[NSFileManager defaultManager];
  v2 = [v1 fileExistsAtPath:v0 isDirectory:&v20];

  if ((v2 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "RME gcore spool directory has not been created";
    goto LABEL_21;
  }
  if (v20)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = +[NSFileManager defaultManager];
    v4 = [v3 enumeratorAtPath:v0];

    obj = v4;
    v5 = [v4 countByEnumeratingWithState:&v16 objects:v27 count:16];
    if (v5)
    {
      v6 = v5;
      v7 = *(void *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v10 = [v0 stringByAppendingFormat:@"/%@", v9];
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v9;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Delete remaining gcore spool files: delete %@", buf, 0xCu);
          }
          v11 = +[NSFileManager defaultManager];
          v15 = 0;
          [v11 removeItemAtPath:v10 error:&v15];
          v12 = v15;

          if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v22 = v9;
            v23 = 2112;
            v24 = v10;
            v25 = 2112;
            v26 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error deleting gcore file %@ (path=%@): %@", buf, 0x20u);
          }
        }
        v6 = [obj countByEnumeratingWithState:&v16 objects:v27 count:16];
      }
      while (v6);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error getting the RME container gcore spool directory", buf, 2u);
  }
LABEL_24:
}

CFTypeRef sub_1000026DC(uint64_t a1, int a2, void *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    return 0;
  }
  v4 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v8 = 0;
  id v5 = sub_100002974(v4, a2, &v8);
  CFTypeRef v6 = sub_1000028D8(v4, v8);

  return v6;
}

void sub_100002768()
{
  self;
  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x3032000000;
  v0[3] = sub_1000035F4;
  v0[4] = sub_100003604;
  v1 = objc_alloc_init(RMECacheDeleter);
  CacheDeleteRegisterInfoCallbacks();
  _Block_object_dispose(v0, 8);
}

void sub_1000028C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

CFTypeRef sub_1000028D8(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v3 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

  id v5 = +[NSNumber numberWithUnsignedInteger:a2];
  [v4 setObject:v5 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  CFTypeRef v6 = CFRetain(v4);
  return v6;
}

id sub_100002974(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = [objc_alloc((Class)RMECacheEnumerator) initCacheEnumeratorWithVolume:v5];
  v7 = sub_100002C3C(0, 0, v6);
  uint64_t v8 = +[NSFileManager defaultManager];
  if (a3) {
    *a3 = 0;
  }
  if (!v7 || ![v7 count]) {
    goto LABEL_8;
  }
  float v9 = 0.75;
  if ((a2 - 2) <= 2) {
    float v9 = flt_10000D7E0[a2 - 2];
  }
  int v10 = (int)(float)(v9 * (float)(unint64_t)[v7 count]);
  v11 = (char *)[v7 count];
  v12 = [v7 count];
  if (v11 != (char *)v10)
  {
    v24 = a3;
    id v25 = v6;
    id v26 = v5;
    v13 = [v7 subarrayWithRange:v12 - &v11[-v10]];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v13);
          }
          v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v21 = [v8 attributesOfItemAtPath:v20 error:0];
          NSFileAttributeType v22 = [v21 fileType];

          if (v22 == NSFileTypeDirectory) {
            uint64_t v23 = sub_100003508(v20);
          }
          else {
            uint64_t v23 = (uint64_t)[v21 fileSize];
          }
          v17 += v23;
        }
        id v16 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (v24) {
      void *v24 = v17;
    }
    id v6 = v25;
    id v5 = v26;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Can purge %lu from %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_8:
    v13 = 0;
  }

  return v13;
}

id sub_100002C3C(char a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = +[NSMutableArray array];
  uint64_t v7 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v61 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v9 = [v5 nextValidURL];
  v59 = v5;
  v60 = (void *)v7;
  if (v9)
  {
    int v10 = (void *)v9;
    v58 = v4;
    while (1)
    {
      id v74 = 0;
      [v10 getResourceValue:&v74 forKey:NSURLCreationDateKey error:0];
      id v12 = v74;
      if (v12) {
        break;
      }
LABEL_26:

      uint64_t v33 = [v5 nextValidURL];

      int v10 = (void *)v33;
      if (!v33) {
        goto LABEL_37;
      }
    }
    id v73 = 0;
    [v10 getResourceValue:&v73 forKey:NSURLNameKey error:0];
    id v13 = v73;
    if (!v13 || (a1 & 1) == 0 && [v12 compare:v7] != (id)-1 && objc_msgSend(v12, "compare:", v7))
    {
LABEL_25:

      goto LABEL_26;
    }
    if (!v4 || [v13 hasSuffix:@".lite_diag"])
    {
      [v61 addObject:v10];
      goto LABEL_25;
    }
    id v14 = v13;
    id v15 = [v14 rangeOfString:@"_"];
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
    id v56 = v15;
    id v16 = +[NSString stringWithUTF8String:".memgraph"];
    unsigned __int8 v17 = [v14 hasSuffix:v16];

    if (v17)
    {
      uint64_t v18 = 34;
      id v19 = v56;
    }
    else
    {
      v20 = +[NSString stringWithUTF8String:".lite_diag"];
      unsigned int v21 = [v14 hasSuffix:v20];

      id v5 = v59;
      id v19 = v56;
      if (!v21) {
        goto LABEL_23;
      }
      uint64_t v18 = 35;
    }
    uint64_t v22 = (uint64_t)v19 + 1;
    if ([v14 containsString:off_100014638[0]]) {
      v22 += (uint64_t)[(__CFString *)off_100014638[0] length];
    }
    uint64_t v23 = v22 + v18;
    v24 = (char *)[v14 length];
    id v26 = &v24[-v23];
    BOOL v25 = (uint64_t)v24 <= v23;
    id v5 = v59;
    if (!v25)
    {
      uint64_t v27 = [v14 substringWithRange:v22, v26];

      long long v28 = (void *)v27;
      id v4 = v58;
      uint64_t v7 = (uint64_t)v60;
      if (!v28) {
        goto LABEL_25;
      }
      id v57 = v28;
      id v29 = v58;
      long long v30 = [v29 objectForKeyedSubscript:@"AllowAllProcessesInSysdiagnose"];
      v31 = v30;
      if (v30 && [v30 BOOLValue])
      {

        uint64_t v32 = v57;
      }
      else
      {
        id v34 = [v29 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];
        unsigned int v54 = [v34 containsObject:v57];

        id v5 = v59;
        uint64_t v32 = v57;

        if (!v54)
        {
LABEL_36:

          goto LABEL_24;
        }
      }
      v35 = [v8 objectForKeyedSubscript:v32];
      if (v35)
      {
        id v72 = 0;
        [v10 getResourceValue:&v72 forKey:NSURLCreationDateKey error:0];
        id v36 = v72;
        v37 = v35;
        id v38 = v36;
        id v71 = 0;
        v53 = v37;
        [v37 getResourceValue:&v71 forKey:NSURLCreationDateKey error:0];
        v55 = v38;
        if ([v71 compare:v38] == (id)-1)
        {
          v35 = v53;
          [v61 addObject:v53];
          uint64_t v32 = v57;
          [v8 setObject:v10 forKeyedSubscript:v57];
        }
        else
        {
          [v61 addObject:v10];
          uint64_t v32 = v57;
          v35 = v53;
        }
      }
      else
      {
        [v8 setObject:v10 forKeyedSubscript:v32];
      }

      goto LABEL_36;
    }
LABEL_23:

LABEL_24:
    id v4 = v58;
    uint64_t v7 = (uint64_t)v60;
    goto LABEL_25;
  }
LABEL_37:
  [v61 sortUsingComparator:&stru_100010838];
  v39 = [v8 keysSortedByValueUsingComparator:&stru_100010838];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v40 = [v39 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v68;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v68 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v67 + 1) + 8 * i)];
        v45 = [v44 path];
        [v6 addObject:v45];
      }
      id v41 = [v39 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v41);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v46 = v61;
  id v47 = [v46 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v64;
    do
    {
      for (j = 0; j != v48; j = (char *)j + 1)
      {
        if (*(void *)v64 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)j) path];
        [v6 addObject:v51];
      }
      id v48 = [v46 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v48);
  }

  return v6;
}

void start()
{
  if (getppid() == 1)
  {
    v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    uint64_t v1 = dispatch_queue_create("com.apple.ReportMemoryException.listener", v0);
    v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ReportMemoryException.analysis", v2);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ReportMemoryException.bulkAnalysis", 0);
    mach_service = xpc_connection_create_mach_service("com.apple.ReportMemoryException", v1, 1uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000ABAC;
    handler[3] = &unk_100010888;
    uint64_t v7 = v1;
    id v12 = v7;
    id v13 = v3;
    id v14 = v4;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);
    sub_100002768();
    dispatch_time_t v8 = dispatch_time(0, 60000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000B2D8;
    v9[3] = &unk_1000108B0;
    int v10 = v7;
    dispatch_after(v8, v10, v9);
    sub_100002388();

    dispatch_main();
  }
  fwrite("Error: This service may only be launched by launchd.\n", 0x35uLL, 1uLL, __stderrp);
  _exit(-1);
}

uint64_t sub_100003508(void *a1)
{
  id v1 = a1;
  [v1 fileSystemRepresentation];
  if ((dirstat_np() & 0x80000000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    dispatch_queue_t v3 = __error();
    dispatch_queue_t v4 = strerror(*v3);
    *(_DWORD *)buf = 138412546;
    id v6 = v1;
    __int16 v7 = 2080;
    dispatch_time_t v8 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Directory sizing for %@ failed with error %s", buf, 0x16u);
  }

  return 0;
}

uint64_t sub_1000035F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003604(uint64_t a1)
{
}

CFTypeRef sub_10000360C(uint64_t a1, int a2, void *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    return 0;
  }
  dispatch_queue_t v4 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v18 = 0;
  id v5 = sub_100002974(v4, a2, &v18);
  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 removeItemAtPath:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11) error:0, v14];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }
  CFTypeRef v12 = sub_1000028D8(v4, v18);

  return v12;
}

CFTypeRef sub_100003790(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    return 0;
  }
  uint64_t v27 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  id v26 = [objc_alloc((Class)RMECacheEnumerator) initCacheEnumeratorWithVolume:v27];
  dispatch_queue_t v3 = sub_100002C3C(0, 0, v26);
  dispatch_queue_t v4 = +[NSFileManager defaultManager];
  long long v30 = +[NSDate dateWithTimeIntervalSinceNow:-345600.0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v41 = v30;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing applicable files older than %{public}@", buf, 0xCu);
  }
  id v5 = [v3 reverseObjectEnumerator];
  id v29 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v35 objects:buf count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        CFTypeRef v12 = [v4 attributesOfItemAtPath:v11 error:0];
        id v13 = v12;
        if (v12)
        {
          long long v14 = [v12 fileCreationDate];
          id v15 = [v30 compare:v14];

          if (v15 == (id)-1)
          {

            goto LABEL_20;
          }
          [v29 addObject:v11];
          NSFileAttributeType v16 = [v13 fileType];

          if (v16 == NSFileTypeDirectory) {
            uint64_t v17 = sub_100003508(v11);
          }
          else {
            uint64_t v17 = (uint64_t)[v13 fileSize];
          }
          v8 += v17;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v35 objects:buf count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_20:

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v29;
  id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        [v4 removeItemAtPath:*(void *)(*((void *)&v31 + 1) + 8 * (void)j) error:0];
      }
      id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }

  CFTypeRef v23 = sub_1000028D8(v27, v8);
  return v23;
}

id sub_100003C78(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
    dispatch_queue_t v4 = +[NSFileManager defaultManager];
    id v30 = 0;
    id v5 = [v4 attributesOfItemAtPath:v3 error:&v30];
    id v6 = v30;

    BOOL v7 = v6 == 0;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v6 description];
        *(_DWORD *)buf = 138412546;
        id v34 = v3;
        __int16 v35 = 2112;
        long long v36 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve file size for \"%@\" with error: %@", buf, 0x16u);
      }
      id v9 = 0;
    }
    else
    {
      id v9 = [v5 fileSize];
    }
  }
  else
  {
    id v9 = 0;
    BOOL v7 = 0;
  }
  v31[0] = @"execName";
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v29 = v10;
  if (!v10)
  {
    uint64_t v10 = +[NSNull null];
  }
  long long v28 = (void *)v10;
  v32[0] = v10;
  v31[1] = @"bundleID";
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v27 = v11;
  if (!v11)
  {
    uint64_t v11 = +[NSNull null];
  }
  v32[1] = v11;
  v31[2] = @"exceptionType";
  id v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(void *)(a1 + 56), v11);
  v32[2] = v26;
  v31[3] = @"footprint";
  BOOL v25 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
  v32[3] = v25;
  v31[4] = @"footprintPeak";
  v24 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
  v32[4] = v24;
  v31[5] = @"jetsamLimit";
  CFTypeRef v12 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
  v32[5] = v12;
  v31[6] = @"memgraphAttempted";
  id v13 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
  v32[6] = v13;
  v31[7] = @"reasonMemgraphSkipped";
  long long v14 = +[NSNumber numberWithInteger:*(void *)(a1 + 88)];
  v32[7] = v14;
  v31[8] = @"memgraphSucceeded";
  id v15 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
  v32[8] = v15;
  v31[9] = @"reasonMemgraphFailed";
  NSFileAttributeType v16 = +[NSNumber numberWithInteger:*(void *)(a1 + 96)];
  v32[9] = v16;
  v31[10] = @"diagFileSizeSucceeded";
  uint64_t v17 = +[NSNumber numberWithBool:v7];
  v32[10] = v17;
  v31[11] = @"diagFileSize";
  id v18 = +[NSNumber numberWithUnsignedLongLong:v9];
  v32[11] = v18;
  v31[12] = @"isMSLEnabled";
  id v19 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 106)];
  v32[12] = v19;
  v31[13] = @"isGcoreCapture";
  id v20 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 107)];
  v32[13] = v20;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:14];

  if (!v27) {
  if (!v29)
  }

  return v21;
}

void sub_100004088(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = a5;
  if (qword_1000146A8 != -1) {
    dispatch_once(&qword_1000146A8, &stru_100010560);
  }
  if ((int)atomic_fetch_add(&dword_1000146A0, 1u) < 2)
  {
    if (mach_port_mod_refs(mach_task_self_, a1, 0, 1))
    {
      id v15 = +[NSError errorWithDomain:MREErrorDomain[0] code:3 userInfo:0];
      v11[2](v11, v15);

      atomic_fetch_add(&dword_1000146A0, 0xFFFFFFFF);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000435C;
      block[3] = &unk_100010588;
      int v25 = a1;
      char v26 = a2;
      id v21 = (id)os_transaction_create();
      uint64_t v22 = v9;
      id v23 = v10;
      v24 = v11;
      id v16 = v21;
      dispatch_async(v22, block);
    }
  }
  else
  {
    if (v11)
    {
      CFTypeRef v12 = +[NSError errorWithDomain:MREErrorDomain[0] code:13 userInfo:0];
      v11[2](v11, v12);
    }
    id v27 = 0;
    id v28 = 0;
    +[MemoryResourceException extractExecNameAndBundleIDMinimal:a1 execNameOut:&v28 bundleIDOut:&v27];
    id v13 = v28;
    id v14 = v27;
    LOWORD(v19) = 0;
    LOBYTE(v18) = 0;
    LOBYTE(v17) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v13, v14, 7, 0, 0, 0, v17, 5, v18, 0, 0, v19);
    atomic_fetch_add(&dword_1000146A0, 0xFFFFFFFF);
  }
}

void sub_100004318(id a1)
{
  CSSetForceSafeMachVMReads();
  qword_1000146B0 = sub_100009260(0);

  _objc_release_x1();
}

void sub_10000435C(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 64);
  int v2 = *(unsigned __int8 *)(a1 + 68);
  id v3 = *(void **)(a1 + 40);
  dispatch_queue_t v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v155 = *(id *)(a1 + 32);
  v156 = v3;
  queue = v4;
  id v6 = v5;
  id v169 = 0;
  v159 = +[MemoryResourceException resourceExceptionFromTask:v1 error:&v169];
  id v158 = v169;
  mach_port_deallocate(mach_task_self_, v1);
  if (!v159 || v158 || [v159 exceptionType] == (id)7)
  {
    if (v6) {
      v6[2](v6, v158);
    }
    goto LABEL_187;
  }
  id v7 = v159;
  if (qword_1000146C8 != -1) {
    dispatch_once(&qword_1000146C8, &stru_1000105F0);
  }
  uint64_t v8 = (void *)qword_1000146C0;
  if (qword_1000146C0 && os_signpost_enabled((os_log_t)qword_1000146C0))
  {
    loga = v8;
    v153 = [v7 execName];
    v150 = [v7 bundleID];
    id v9 = [v7 exceptionType];
    id v146 = [v7 limitValue];
    id v144 = [v7 upTime];
    unsigned int v142 = [v7 pid];
    v140 = [v7 coalitionBundleID];
    id v138 = [v7 ledgerPhysFootprint];
    id v136 = [v7 ledgerPhysFootprintPeak];
    id v135 = [v7 ledgerInternal];
    id v133 = [v7 ledgerInternalCompressed];
    id v131 = [v7 ledgerAlternateAccounting];
    id v129 = [v7 ledgerAlternateAccountingCompressed];
    id v10 = [v7 ledgerIOKitMapped];
    id v11 = [v7 ledgerPageTable];
    id v12 = [v7 ledgerWiredMem];
    id v13 = [v7 ledgerPurgeableNonvolatile];
    id v14 = [v7 ledgerPurgeableNonvolatileCompressed];
    id v15 = [v7 ledgerNetworkNonvolatile];
    id v16 = [v7 ledgerNetworkNonvolatileCompressed];
    *(_DWORD *)buf = 138548226;
    *(void *)&uint8_t buf[4] = v153;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v150;
    *(_WORD *)&buf[22] = 2050;
    *(void *)&buf[24] = v9;
    *(_WORD *)v171 = 2050;
    *(void *)&v171[2] = v146;
    *(_WORD *)&v171[10] = 2050;
    *(void *)&v171[12] = v144;
    *(_WORD *)&v171[20] = 1026;
    *(_DWORD *)&v171[22] = v142;
    *(_WORD *)&v171[26] = 2114;
    *(void *)&v171[28] = v140;
    *(_WORD *)&v171[36] = 2050;
    *(void *)&v171[38] = v138;
    *(_WORD *)&v171[46] = 2050;
    id v172 = v136;
    __int16 v173 = 2050;
    id v174 = v135;
    __int16 v175 = 2050;
    id v176 = v133;
    __int16 v177 = 2050;
    id v178 = v131;
    __int16 v179 = 2050;
    id v180 = v129;
    __int16 v181 = 2050;
    id v182 = v10;
    __int16 v183 = 2050;
    id v184 = v11;
    __int16 v185 = 2050;
    id v186 = v12;
    __int16 v187 = 2050;
    id v188 = v13;
    __int16 v189 = 2050;
    id v190 = v14;
    __int16 v191 = 2050;
    id v192 = v15;
    __int16 v193 = 2050;
    id v194 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, loga, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CorpseReceived", "execName=%{public,signpost.description:attribute}@ bundleID=%{public,signpost.description:attribute}@ exceptionType=%{public,signpost.description:attribute}ld limitValue=%{public,signpost.description:attribute}llu upTime=%{public,signpost.description:attribute}lli pid=%{public,signpost.description:attribute}d coalitionBundleID=%{public,signpost.description:attribute}@ ledgerPhysFootprint=%{public,signpost.description:attribute}llu ledgerPhysFootprintPeak=%{public,signpost.description:attribute}llu ledgerInternal=%{public,signpost.description:attribute}llu ledgerInternalCompressed=%{public,signpost.description:attribute}llu ledgerAlternateAccounting=%{public,signpost.description:attribute}llu ledgerAlternateAccountingCompressed=%{public,signpost.description:attribute}llu ledgerIOKitMapped=%{public,signpost.description:attribute}llu ledgerPageTable=%{public,signpost.description:attribute}llu ledgerWiredMem=%{public,signpost.description:attribute}llu ledgerPurgeableNonvolatile=%{public,signpost.description:attribute}llu ledgerPurgeableNonvolatileCompressed=%{public,signpost.description:attribute}llu ledgerNetworkNonvolatile=%{public,signpost.description:attribute}llu ledgerNetworkNonvolatileCompressed=%{public,signpost.description:attribute}llu ", buf, 0xC6u);
  }
  v154 = [v7 execName];
  if (qword_1000146D0 - qword_1000146D8 >= (unint64_t)sub_100006290(v154))
  {
    [v7 releaseAnalyzedTask];
    id v21 = [v7 execName];
    uint64_t v22 = [v7 bundleID];
    id v23 = [v7 exceptionType];
    id v24 = [v7 ledgerPhysFootprint];
    id v25 = [v7 ledgerPhysFootprintPeak];
    id v26 = [v7 limitValue];
    unsigned __int8 v27 = [v7 isMSLEnabled];
    BYTE1(v108) = [v7 gcoreCapture];
    LOBYTE(v108) = v27;
    LOBYTE(v107) = 0;
    LOBYTE(v106) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v21, v22, v23, v24, v25, v26, v106, 4, v107, 0, 0, v108);

    if (v6)
    {
      id v28 = +[NSError errorWithDomain:MREErrorDomain[0] code:14 userInfo:0];
      v6[2](v6, v28);
    }
    goto LABEL_186;
  }
  unsigned int v143 = [v7 pid];
  if (([v7 isFirstParty] & 1) == 0 && (sub_10000A2D0() & 1) == 0)
  {
    id v47 = [v7 execName];
    id v48 = [v7 bundleID];
    id v49 = [v7 exceptionType];
    id v50 = [v7 ledgerPhysFootprint];
    id v51 = [v7 ledgerPhysFootprintPeak];
    id v52 = [v7 limitValue];
    unsigned __int8 v53 = [v7 isMSLEnabled];
    BYTE1(v108) = [v7 gcoreCapture];
    LOBYTE(v108) = v53;
    LOBYTE(v107) = 0;
    LOBYTE(v106) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v47, v48, v49, v50, v51, v52, v106, 7, v107, 0, 0, v108);

    [v7 releaseAnalyzedTask];
    if (v6) {
      v6[2](v6, 0);
    }
    goto LABEL_186;
  }
  if (v2)
  {
    uint64_t v151 = 0;
    LOBYTE(v17) = 0;
    int v18 = 1;
    int v19 = 1;
    id v20 = v154;
    goto LABEL_170;
  }
  os_log_t log = (os_log_t)v7;
  unsigned int v116 = [log pid];
  uint64_t v29 = [log execName];
  id v30 = [log currentTime];
  unsigned int v132 = [log isMSLEnabled];
  long long v31 = (void *)qword_1000146B0;
  id v134 = [log exceptionType];
  id v147 = v31;
  id v32 = v29;
  id v152 = v30;
  LOBYTE(from) = 0;
  v139 = v32;
  if (!v32 || !v152 || !v147)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v116;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v152;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Insufficient data available to evaluation the available file quota. execname: %{public}@ [%d], date: %@", buf, 0x1Cu);
    }
    id v44 = 0;
    int v45 = 0;
    int v17 = 0;
    BOOL v46 = 0;
    goto LABEL_155;
  }
  LOBYTE(location) = 0;
  int64_t v141 = sub_10000A344(v147, (uint64_t)v134, v32, &location, &from);
  v121 = [v147 objectForKeyedSubscript:off_1000145F8[0]];
  v120 = [v147 objectForKeyedSubscript:off_100014600[0]];
  v119 = [v147 objectForKeyedSubscript:off_100014608[0]];
  v117 = [v147 objectForKeyedSubscript:off_100014618[0]];
  v118 = [v147 objectForKeyedSubscript:off_100014610[0]];
  uint64_t v115 = sub_10000A874((uint64_t)v147);
  id v33 = [v121 integerValue];
  if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v34 = (uint64_t)v33;
  }
  uint64_t v130 = v34;
  id v35 = [v120 integerValue];
  if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v36 = (uint64_t)v35;
  }
  uint64_t v126 = v36;
  id v37 = [v119 integerValue];
  if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v38 = (uint64_t)v37;
  }
  uint64_t v128 = v38;
  id v39 = [v118 integerValue];
  if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v40 = (uint64_t)v39;
  }
  uint64_t v125 = v40;
  id v41 = [v117 integerValue];
  uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  if ((unint64_t)v41 < 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v42 = (uint64_t)v41;
  }
  uint64_t v127 = v42;
  if (!v130 && !v126 && !v42)
  {
    BOOL v43 = !v141 || location == 0;
    if (v43 && !v125)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "File limit set to 0. Skipping.", buf, 2u);
      }
      id v44 = 0;
      int v45 = 0;
      int v17 = 0;
      BOOL v46 = 0;
      goto LABEL_154;
    }
  }
  unsigned int v54 = (char *)[@".memgraph" length];
  id v145 = [objc_alloc((Class)RMECacheEnumerator) initCacheEnumerator];
  v55 = [v145 nextValidURL];
  if (!v55)
  {
    uint64_t v57 = 0;
    uint64_t v124 = 0;
    uint64_t v137 = 0;
    uint64_t v122 = 0;
    uint64_t v81 = 0;
    uint64_t v114 = 0;
    int64_t v56 = 0;
LABEL_116:
    if (v81 >= v127)
    {
      int v45 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_124;
      }
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v127;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v139;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v116;
      v82 = "The total lite diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
    }
    else
    {
      if (v114 < v115)
      {
        int v45 = 1;
LABEL_124:
        if (v132 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v130;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v57;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "MSL Enabled in Process: daily MSL memgraph limit = %ld, in the last 24 hours %li MSL memgraphs have been saved.", buf, 0x16u);
        }
        if (v134 == (id)6)
        {
          if (v124 >= v125)
          {
            id v44 = +[NSString stringWithFormat:@"memgraph %@ limit of %ld has already been exceeded in the last 24 hours", @"global", v126];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v125;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v139;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v116;
              v83 = "The total diagnostic threshold memgraph limit of %ld has been exceeded in the last 24 hours. Skippin"
                    "g %{public}@ [%d]";
LABEL_150:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v83, buf, 0x1Cu);
              goto LABEL_151;
            }
            goto LABEL_151;
          }
        }
        else
        {
          unsigned int v84 = v132;
          if (v57 >= v130) {
            unsigned int v84 = 0;
          }
          if (v84 == 1)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The MSL memgraph limit has NOT exceeded in the last 24 hours", buf, 2u);
            }
          }
          else
          {
            if (!(_BYTE)location && v122 >= v126)
            {
              id v44 = +[NSString stringWithFormat:@"memgraph %@ limit of %ld has already been exceeded in the last 24 hours", @"global", v126];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218498;
                *(void *)&uint8_t buf[4] = v126;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v139;
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = v116;
                v83 = "The total full diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
                goto LABEL_150;
              }
LABEL_151:
              int v17 = 0;
              goto LABEL_152;
            }
            if (v56 >= v141)
            {
              if ((_BYTE)location) {
                CFStringRef v85 = @"critical per process";
              }
              else {
                CFStringRef v85 = @"per process";
              }
              id v44 = +[NSString stringWithFormat:@"memgraph %@ limit of %ld has already been exceeded in the last 24 hours", v85, v141];
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_151;
              }
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v141;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v139;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v116;
              v83 = "The per process full diagnostic log limit of %ld has already been exceeded in the last 24 hours. Ski"
                    "pping %{public}@ [%d]";
              goto LABEL_150;
            }
          }
        }
        id v44 = 0;
        int v17 = 1;
LABEL_152:
        BOOL v46 = v137 < v128;
        goto LABEL_153;
      }
      int v45 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_124;
      }
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v115;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v139;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v116;
      v82 = "The per process lite diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v82, buf, 0x1Cu);
    int v45 = 0;
    goto LABEL_124;
  }
  int64_t v56 = 0;
  uint64_t v114 = 0;
  uint64_t v122 = 0;
  uint64_t v123 = 0;
  uint64_t v137 = 0;
  uint64_t v124 = 0;
  uint64_t v57 = 0;
  v113 = v54 + 25;
  while (1)
  {
    if ((_BYTE)location) {
      BOOL v58 = v56 < v141;
    }
    else {
      BOOL v58 = 0;
    }
    if (!v58)
    {
      char v59 = v57 < v130 ? v132 : 0;
      BOOL v60 = v134 == (id)6 && v124 < v125;
      BOOL v61 = v60;
      if ((v59 & 1) == 0 && v122 >= v126 && v137 >= v128 && v123 >= v127 && !v61)
      {
LABEL_114:
        uint64_t v81 = v123;
        goto LABEL_116;
      }
    }
    block[0] = 0;
    [v55 getResourceValue:block forKey:NSURLCreationDateKey error:0];
    id v63 = block[0];
    long long v64 = v63;
    if (!v63) {
      goto LABEL_113;
    }
    if ([v63 compare:v152] == (id)1) {
      break;
    }
    [v152 timeIntervalSinceDate:v64];
    if (v65 <= 86400.0)
    {
      v167[0] = 0;
      [v55 getResourceValue:v167 forKey:NSURLNameKey error:0];
      id v66 = v167[0];
      if (v66)
      {
        long long v67 = v66;
        unsigned int v68 = [v66 containsString:off_100014640];
        if (v137 < v128) {
          uint64_t v69 = v68;
        }
        else {
          uint64_t v69 = 0;
        }
        v137 += v69;
        if ([v67 hasSuffix:@".memgraph"])
        {
          long long v70 = MREExceptionTypeToString();
          unsigned int v71 = [v67 hasPrefix:v70];

          if (v71)
          {
            ++v124;
LABEL_112:

            goto LABEL_113;
          }
          unsigned int v76 = [v67 containsString:off_100014638[0]];
          unsigned int v77 = v76;
          if (v57 < v130) {
            unsigned int v78 = v76;
          }
          else {
            unsigned int v78 = 0;
          }
          if (v78 == 1)
          {
            ++v57;
            goto LABEL_112;
          }
          if (!(_BYTE)location)
          {
            if (v122 >= v126) {
              goto LABEL_112;
            }
            ++v122;
          }
          if (v141 == 0x7FFFFFFFFFFFFFFFLL || v56 >= v141) {
            goto LABEL_112;
          }
          id v72 = MREExceptionTypeToString();
          if ([v67 hasPrefix:v72])
          {
            id v112 = [objc_alloc((Class)NSString) initWithFormat:@"%@_%@", v72, v139];
            v110 = (char *)[v112 length];
            if (v77) {
              unint64_t v79 = (unint64_t)[(__CFString *)off_100014638[0] length];
            }
            else {
              unint64_t v79 = 0;
            }
            if ([v67 hasPrefix:v112]
              && [v67 length] == &v110[(void)v113 + v79])
            {
              ++v56;
            }
          }
        }
        else
        {
          if (v123 >= v127) {
            goto LABEL_112;
          }
          ++v123;
          if (v115 == 0x7FFFFFFFFFFFFFFFLL || v114 >= v115) {
            goto LABEL_112;
          }
          id v111 = [@".lite_diag" length];
          id v72 = MREExceptionTypeToString();
          if ([v67 hasPrefix:v72])
          {
            id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%@_%@", v72, v139];
            v109 = (char *)[v73 length];
            if ([v67 hasPrefix:v73])
            {
              id v74 = (char *)[v67 length];
              uint64_t v75 = v114;
              if (v74 == &v109[(void)v111 + 25]) {
                uint64_t v75 = v114 + 1;
              }
              uint64_t v114 = v75;
            }
          }
        }

        goto LABEL_112;
      }
      long long v67 = 0;
      goto LABEL_112;
    }
LABEL_113:

    uint64_t v80 = [v145 nextValidURL];

    v55 = (void *)v80;
    if (!v80) {
      goto LABEL_114;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v139;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v116;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The system clock may be out of sync, and prevents us from determining available quota for a memgraph for %{public}@ [%d]", buf, 0x12u);
  }

  id v44 = 0;
  int v45 = 0;
  int v17 = 0;
  BOOL v46 = 0;
LABEL_153:

LABEL_154:
LABEL_155:

  id v86 = v44;
  if (v86) {
    [log setMemgraphError:v86];
  }

  if (!v17)
  {
    int v18 = 0;
    uint64_t v91 = 2;
    goto LABEL_167;
  }
  if (qword_1000146E0 != -1) {
    dispatch_once(&qword_1000146E0, &stru_100010660);
  }
  unint64_t v87 = dword_1000146A4;
  if (!dword_1000146A4
    || (id v88 = [log limitValue], v89 = (double)v87 * 0.75, v89 >= (double)(unint64_t)v88))
  {
    uint64_t v151 = 0;
    LOBYTE(v17) = 0;
    int v18 = 1;
    goto LABEL_168;
  }
  if (from | v46)
  {
    id v20 = v154;
    int v19 = v45;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v154;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v143;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting memgraph generation for large process %{public}@ [%d].", buf, 0x12u);
    }
    if (v46)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v154;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v143;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Will use gcore for large process collection %{public}@ [%d].", buf, 0x12u);
      }
      uint64_t v151 = 0;
      int v18 = 1;
      LOBYTE(v17) = 1;
    }
    else
    {
      uint64_t v151 = 0;
      LOBYTE(v17) = 0;
      int v18 = 1;
    }
  }
  else
  {
    v90 = +[NSString stringWithFormat:@"memgraph is larger than its limit of %dMB to generate", (int)v89];
    [log setMemgraphError:v90];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v20 = v154;
      *(void *)&uint8_t buf[4] = v154;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v143;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping memgraph generation for %{public}@ [%d] because it is too large. (gcoreDiagAllowed=%{BOOL}i)", buf, 0x18u);
      int v18 = 0;
      LOBYTE(v17) = 0;
      uint64_t v151 = 3;
      goto LABEL_169;
    }
    int v18 = 0;
    LOBYTE(v17) = 0;
    uint64_t v91 = 3;
LABEL_167:
    uint64_t v151 = v91;
LABEL_168:
    id v20 = v154;
LABEL_169:
    int v19 = v45;
  }
LABEL_170:
  if (v19 | v18)
  {
    v167[0] = 0;
    v167[1] = v167;
    v167[2] = (id)0x2810000000;
    v167[3] = &unk_10000FDD3;
    int v168 = 0;
    v92 = (void *)++qword_1000146D0;
    if (v6) {
      dispatch_qos_class_t v93 = QOS_CLASS_UTILITY;
    }
    else {
      dispatch_qos_class_t v93 = QOS_CLASS_BACKGROUND;
    }
    if (v17)
    {
      uint64_t v94 = 300;
      goto LABEL_181;
    }
    if (v20 && (sub_1000099C0(v20) & 1) != 0)
    {
      uint64_t v94 = 120;
LABEL_181:
      qword_100014688 += v94;
    }
    else
    {
      uint64_t v94 = 60;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v94;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v143;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using timeout of %llu seconds for process %@ [%d]", buf, 0x1Cu);
    }
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100006374;
    *(void *)&buf[24] = &unk_100010618;
    id v101 = v7;
    *(void *)v171 = v101;
    *(void *)&v171[24] = v167;
    LOBYTE(v172) = v19;
    BYTE1(v172) = v18;
    BYTE2(v172) = v17;
    *(void *)&v171[32] = v94;
    *(void *)&v171[40] = v151;
    v102 = v6;
    *(void *)&v171[16] = v102;
    *(void *)&v171[8] = v155;
    v103 = objc_retainBlock(buf);
    dispatch_block_t v104 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v93, 0, v103);

    dispatch_async(queue, v104);
    objc_initWeak(&location, v101);
    objc_initWeak(&from, v102);
    dispatch_time_t v105 = dispatch_time(0, 1000000000 * v94);
    block[0] = _NSConcreteStackBlock;
    block[1] = (id)3221225472;
    block[2] = sub_100007284;
    block[3] = &unk_100010640;
    v162[1] = v92;
    objc_copyWeak(&v161, &location);
    objc_copyWeak(v162, &from);
    char v163 = v19;
    char v164 = v18;
    void block[4] = v167;
    v162[2] = (id)v94;
    v162[3] = (id)v151;
    dispatch_after(v105, v156, block);
    objc_destroyWeak(v162);
    objc_destroyWeak(&v161);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    _Block_object_dispose(v167, 8);
  }
  else
  {
    v95 = [v7 execName];
    v96 = [v7 bundleID];
    id v97 = [v7 exceptionType];
    id v98 = [v7 ledgerPhysFootprint];
    id v99 = [v7 ledgerPhysFootprintPeak];
    id v100 = [v7 limitValue];
    BYTE1(v108) = v151 == 3;
    LOBYTE(v108) = [v7 isMSLEnabled];
    LOBYTE(v107) = 0;
    LOBYTE(v106) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v95, v96, v97, v98, v99, v100, v106, v151, v107, 0, 0, v108);

    [v7 releaseAnalyzedTask];
    if (v6) {
      v6[2](v6, 0);
    }
  }
LABEL_186:

LABEL_187:
  atomic_fetch_add(&dword_1000146A0, 0xFFFFFFFF);
}

void sub_100005B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_100005B54(mach_port_name_t a1, void *a2, int a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (qword_1000146B8 != -1) {
    dispatch_once(&qword_1000146B8, &stru_1000105A8);
  }
  if ((int)atomic_fetch_add(&dword_1000146A0, 1u) < 2)
  {
    if (!mach_port_mod_refs(mach_task_self_, a1, 0, 1))
    {
      id v20 = (void *)os_transaction_create();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005DAC;
      block[3] = &unk_1000105D0;
      mach_port_name_t v29 = a1;
      int v30 = a3;
      uint64_t v28 = a4;
      id v23 = v13;
      id v24 = v20;
      id v25 = v14;
      id v26 = v15;
      id v27 = v16;
      id v21 = v20;
      dispatch_async(v25, block);

      goto LABEL_10;
    }
    int v17 = MREErrorDomain[0];
    uint64_t v18 = 3;
    goto LABEL_8;
  }
  if (v16)
  {
    int v17 = MREErrorDomain[0];
    uint64_t v18 = 13;
LABEL_8:
    int v19 = +[NSError errorWithDomain:v17 code:v18 userInfo:0];
    (*((void (**)(id, void *))v16 + 2))(v16, v19);
  }
  atomic_fetch_add(&dword_1000146A0, 0xFFFFFFFF);
LABEL_10:
}

void sub_100005D68(id a1)
{
  CSSetForceSafeMachVMReads();
  qword_1000146B0 = sub_100009260(0);

  _objc_release_x1();
}

void sub_100005DAC(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 80);
  int v2 = *(_DWORD *)(a1 + 84);
  id v3 = *(void **)(a1 + 40);
  dispatch_queue_t v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v6 = *(void **)(a1 + 64);
  id v7 = *(void **)(a1 + 72);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v4;
  id v11 = v5;
  id v12 = v6;
  if (qword_100014708 != -1) {
    dispatch_once(&qword_100014708, &stru_100010740);
  }
  id v42 = 0;
  id v13 = +[MemoryResourceException resourceExceptionFromTask:v1 error:&v42];
  id v14 = v42;
  mach_port_deallocate(mach_task_self_, v1);
  if (!v13 || v14 || [v13 exceptionType] == (id)7)
  {
    if (v12) {
      v12[2](v12, v14);
    }
  }
  else
  {
    id v15 = [v13 execName];
    if (qword_1000146D0 - qword_1000146D8 >= (unint64_t)sub_100006290(v15))
    {
      [v13 releaseAnalyzedTask];
      if (v12)
      {
        id v23 = +[NSError errorWithDomain:MREErrorDomain[0] code:14 userInfo:0];
        v12[2](v12, v23);
      }
    }
    else
    {
      int v30 = v7;
      unsigned int v16 = [v13 pid];
      uint64_t v28 = (void *)++qword_1000146D0;
      if (v12) {
        int v17 = 17;
      }
      else {
        int v17 = 9;
      }
      dispatch_qos_class_t qos_class = v17;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "liteAnalysisMemgraphOnly";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        id v44 = v15;
        LOWORD(v45) = 1024;
        *(_DWORD *)((char *)&v45 + 2) = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Using timeout of %llu seconds for process %@ [%d]", buf, 0x26u);
      }
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      char v41 = 0;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100008A0C;
      v33[3] = &unk_100010790;
      mach_port_name_t v29 = v15;
      id v18 = v13;
      int v39 = v2;
      id v34 = v18;
      uint64_t v38 = v40;
      id v25 = v8;
      id v35 = v25;
      int v19 = v12;
      id v37 = v19;
      id v36 = v9;
      id v20 = objc_retainBlock(v33);
      dispatch_block_t v21 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, qos_class, 0, v20);
      *(void *)qos_classa = v8;
      uint64_t v22 = v21;

      dispatch_async(v11, v22);
      objc_initWeak(&location, v18);
      objc_initWeak(&from, v19);
      dispatch_time_t when = dispatch_time(0, 1000000000 * (void)v30);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100008DAC;
      id v44 = &unk_1000107B8;
      v48[1] = v28;
      BOOL v46 = v40;
      objc_copyWeak(&v47, &location);
      objc_copyWeak(v48, &from);
      id v45 = v25;
      v48[2] = v30;
      id v15 = v29;
      dispatch_after(when, v10, buf);

      objc_destroyWeak(v48);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      id v8 = *(id *)qos_classa;
      _Block_object_dispose(v40, 8);
    }
  }
  atomic_fetch_add(&dword_1000146A0, 0xFFFFFFFF);
}

void sub_10000624C(id a1)
{
  qword_1000146C0 = (uint64_t)os_log_create("com.apple.ReportMemoryException", "MemoryResourceException");

  _objc_release_x1();
}

uint64_t sub_100006290(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1 && sub_1000099C0(v1))
  {
    uint64_t v3 = 2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109634;
      v5[1] = 1;
      __int16 v6 = 1024;
      int v7 = 2;
      __int16 v8 = 2114;
      id v9 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bumping max bulk requests in flight from %d to %d for critical process %{public}@.", (uint8_t *)v5, 0x18u);
    }
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

void sub_100006374(uint64_t a1)
{
  id v1 = *(void **)(a1 + 48);
  int v2 = *(os_unfair_lock_s **)(*(void *)(a1 + 56) + 8);
  int v3 = *(unsigned __int8 *)(a1 + 80);
  int v4 = *(unsigned __int8 *)(a1 + 81);
  int v5 = *(unsigned __int8 *)(a1 + 82);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v87 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 32);
  double v89 = v1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [v7 execName];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v7 pid];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin analysis for %{public}@ [%d]", buf, 0x12u);
  }
  sub_100007738(v7);
  id v88 = [(id)qword_1000146B0 objectForKeyedSubscript:off_100014628[0]];
  if ([v88 BOOLValue]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  [v7 _populateAddtionalMetadataWithOptions:v9 timeoutSecs:v6];
  uint64_t v91 = v7;
  if (!v5 && v3 && v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 execName];
      unsigned int v11 = [v7 pid];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to save lite diagnostic before generating a memgraph for process %@ [%d]", buf, 0x12u);
    }
    id v95 = 0;
    id v12 = sub_10000796C(v7, 1, 0, &v95);
    id v13 = v95;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v91 execName];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully saved initial lite diagnostic for process %@ at %@", buf, 0x16u);
      }
      [v91 setLiteDiagFilePath:v12];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v77 = [v91 execName];
      unsigned int v78 = [v13 localizedDescription];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v77;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v78;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to save initial lite diagnostic for process %@: %{public}@", buf, 0x16u);
    }
    id v7 = v91;
  }
  unint64_t v94 = 0;
  uint64_t v15 = [v7 execName];
  uint64_t v16 = 2;
  if (v15)
  {
    int v17 = (void *)v15;
    id v18 = [(id)qword_1000146B0 objectForKeyedSubscript:off_100014630[0]];
    int v19 = [v7 execName];
    unsigned int v20 = [v18 containsObject:v19];

    if (v20) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = 2;
    }
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_block_t v21 = [v91 execName];
      unsigned int v22 = [v91 pid];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to create a gcore for process %@ [%d]", buf, 0x12u);
    }
    id v93 = 0;
    id v23 = v91;
    id v24 = +[RMECacheEnumerator getGcoreSpoolWithCreateIfNecessary:1];
    id v25 = v24;
    if (v24)
    {
      id v26 = sub_10000824C(v24, &v93, @".core", v23);
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = v27;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get gcore spool file path", buf, 2u);
        }
        id v27 = 0;
        uint64_t v28 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get gcore spool directory", buf, 2u);
      }
      v96[0] = NSLocalizedDescriptionKey;
      *(void *)buf = @"Failed to get gcore spool directory";
      id v27 = +[NSDictionary dictionaryWithObjects:buf forKeys:v96 count:1];
      +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v27];
      uint64_t v28 = 0;
      id v93 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v29 = v93;
    if (!v28)
    {
      int v30 = v91;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v75 = [v23 execName];
        unsigned int v76 = [v23 pid];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v75;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v76;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v29;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get filepath to save the gcore for  %@ [%d]: %@", buf, 0x1Cu);
      }
      goto LABEL_55;
    }
    if (sub_1000085DC() && sub_1000086AC())
    {
      id v31 = objc_alloc_init((Class)NSMutableDictionary);
      id v32 = [objc_alloc((Class)NSNumber) initWithInt:[v23 task]];
      [v31 setObject:v32 forKeyedSubscript:@"port"];

      [v31 setObject:&off_100011340 forKeyedSubscript:@"pid"];
      [v31 setObject:&__kCFBooleanTrue forKeyedSubscript:@"annotations"];
      [v31 setObject:v28 forKeyedSubscript:@"filename"];
      id v33 = v31;
      id v34 = (uint64_t (*)(id))sub_1000086AC();
      if (!v34)
      {
        dlerror();
        abort_report_np();
      }
      int v35 = v34(v33);

      [v23 releaseAnalyzedTask];
      if (!v35)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = [v23 execName];
          unsigned int v37 = [v23 pid];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v37;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully created a gcore for %{public}@ [%d] at %@", buf, 0x1Cu);
        }
        [v23 setGcoreCapture:1];
        [v23 setGcoreFilePath:v28];
        [v23 _generateMemgraphWithContentLevel:v16 timeoutSecs:v6 memgraphFailedReasonOut:&v94];
LABEL_51:
        int v30 = v91;
        id v40 = v28;
        unlink((const char *)[v40 UTF8String]);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v40;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleted gcore at %@", buf, 0xCu);
        }
LABEL_55:

        goto LABEL_56;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "GCoreFramework is not available, will not collect gcore", buf, 2u);
      }
      [v23 releaseAnalyzedTask];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = [v23 execName];
      unsigned int v39 = [v23 pid];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v39;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot create a gcore for %{public}@ [%d] ", buf, 0x12u);
    }
    unint64_t v94 = 4;
    goto LABEL_51;
  }
  if (v4) {
    [v91 _generateMemgraphWithContentLevel:v16 timeoutSecs:v6 memgraphFailedReasonOut:&v94];
  }
  [v91 releaseAnalyzedTask];
  id v29 = 0;
  int v30 = v91;
LABEL_56:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    char v41 = [v30 execName];
    unsigned int v42 = [v30 pid];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v41;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v42;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Saving log file for %{public}@ [%d]", buf, 0x12u);
  }
  os_unfair_lock_lock(v2 + 8);
  id v92 = v29;
  uint64_t v43 = sub_10000796C(v30, v3 != 0, v4 != 0, &v92);
  id v44 = v92;

  os_unfair_lock_unlock(v2 + 8);
  BOOL v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  v90 = (void *)v43;
  id v86 = v44;
  if (v43)
  {
    if (v45)
    {
      BOOL v46 = [v30 execName];
      unsigned int v47 = [v30 pid];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v47;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v90;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Memory Resource Exception log for %{public}@ [%d] saved at %{public}@", buf, 0x1Cu);
    }
    int v48 = sub_10000A250();
    if (v4 && v48)
    {
      id v49 = v30;
      id v50 = v90;
      id v51 = objc_alloc_init((Class)SDRDiagnosticReporter);
      [v49 exceptionType];
      id v52 = MREExceptionTypeToString();
      if ([v49 isMSLEnabled]) {
        CFStringRef v53 = @"MallocStackLogging Enabled";
      }
      else {
        CFStringRef v53 = &stru_100010E20;
      }
      unsigned int v54 = [v49 execName];
      id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%llu", [v49 limitValue]];
      int64_t v56 = [v51 signatureWithDomain:@"Performance" type:@"MemoryResourceException" subType:v52 subtypeContext:v53 detectedProcess:v54 triggerThresholdValues:v55];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v56;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Symptoms Diagnostic Reporter signature created: %@", buf, 0xCu);
      }
      uint64_t v57 = [v49 memoryGraph];

      if (v57)
      {
        id v99 = v50;
        uint64_t v100 = kSymptomDiagnosticKeyPayloadPath;
        BOOL v58 = +[NSArray arrayWithObjects:&v99 count:1];
        id v101 = v58;
        char v59 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
      }
      else
      {
        char v59 = 0;
      }
      int v30 = v91;
      v62 = [v49 cachedMetaDataDict];

      if (!v62) {
        id v63 = [v49 createMetaDataDict];
      }
      long long v64 = [v49 cachedMetaDataDict];

      if (v64)
      {
        double v65 = [v49 cachedMetaDataDict];
        id v98 = v65;
        long long v64 = +[NSArray arrayWithObjects:&v98 count:1];
      }
      v96[0] = kSymptomDiagnosticActionLogArchive;
      v96[1] = kSymptomDiagnosticActionGetNetworkInfo;
      *(void *)buf = &__kCFBooleanFalse;
      *(void *)&buf[8] = &__kCFBooleanFalse;
      v96[2] = kSymptomDiagnosticActionCrashAndSpinLogs;
      v96[3] = kSymptomDiagnosticActionDiagnosticExtensions;
      *(void *)&buf[16] = &__kCFBooleanFalse;
      *(void *)&unsigned char buf[24] = &__kCFBooleanFalse;
      id v66 = +[NSDictionary dictionaryWithObjects:buf forKeys:v96 count:4];
      [v51 snapshotWithSignature:v56 duration:v64 events:v59 payload:v66 actions:&stru_100010720 reply:0.0];
    }
  }
  else
  {
    if (v45)
    {
      BOOL v60 = [v30 execName];
      unsigned int v61 = [v30 pid];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v60;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v61;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v44;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Memory Resource Exception log for %{public}@ [%d] could not be saved due to error: %@", buf, 0x1Cu);
    }
    sub_10000A250();
  }
  unsigned int v84 = [v30 execName];
  v82 = [v30 bundleID];
  id v85 = [v30 exceptionType];
  id v83 = [v30 ledgerPhysFootprint];
  id v67 = [v30 ledgerPhysFootprintPeak];
  id v68 = [v30 limitValue];
  if (v4) {
    uint64_t v69 = 0;
  }
  else {
    uint64_t v69 = v87;
  }
  long long v70 = [v30 memoryGraph];
  unsigned int v71 = [v30 memoryGraph];
  uint64_t v72 = 0;
  if (!v71)
  {
    if (v94 > 6) {
      uint64_t v72 = 3;
    }
    else {
      uint64_t v72 = qword_10000D860[v94];
    }
    int v30 = v91;
  }
  BOOL v73 = v4 != 0;
  unsigned __int8 v74 = [v30 isMSLEnabled];
  BYTE1(v81) = [v30 gcoreCapture];
  LOBYTE(v81) = v74;
  LOBYTE(v80) = v70 != 0;
  LOBYTE(v79) = v73;
  +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v84, v82, v85, v83, v67, v68, v79, v69, v80, v72, v90, v81);

  free((void *)qword_1000146E8);
  qword_1000146E8 = 0;
  qword_100014650 = (uint64_t)"Bulk analysis completed.";
  if (v89) {
    v89[2](v89, v86);
  }

  ++qword_1000146D8;
}

void sub_100007284(uint64_t a1)
{
  if ((unint64_t)qword_1000146D8 < *(void *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = objc_loadWeakRetained((id *)(a1 + 48));
    int v4 = *(os_unfair_lock_s **)(*(void *)(a1 + 32) + 8);
    int v5 = *(unsigned __int8 *)(a1 + 80);
    int v6 = *(unsigned __int8 *)(a1 + 81);
    __int16 v8 = *(void **)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    id v34 = WeakRetained;
    uint64_t v9 = (void (**)(id, void *))v3;
    if (v34)
    {
      id v10 = v4 + 8;
      os_unfair_lock_lock(v4 + 8);
      id v11 = [v34 copy];
      id v12 = [v11 memoryGraph];

      if (!v12)
      {
        id v13 = v9;
        id v14 = +[NSString stringWithFormat:@"memgraph analysis has timed out (timeout: %llu secs)", v8];
        [v11 setMemgraphError:v14];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v11 execName];
          *(_DWORD *)buf = 138543874;
          unsigned int v37 = v15;
          __int16 v38 = 1024;
          unsigned int v39 = [v11 pid];
          __int16 v40 = 2048;
          uint64_t v41 = (uint64_t)v8;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin timeout operations for %{public}@ [%d] (timeout: %llu secs)", buf, 0x1Cu);
        }
        if (v6 | v5)
        {
          id v35 = 0;
          uint64_t v33 = sub_10000796C(v11, v5 != 0, v6 != 0, &v35);
          id v16 = v35;
        }
        else
        {
          uint64_t v33 = 0;
          id v16 = 0;
        }
        if (v13)
        {
          int v17 = +[NSError errorWithDomain:MREErrorDomain[0] code:8 userInfo:0];
          v13[2](v13, v17);
        }
        BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v33)
        {
          if (v18)
          {
            dispatch_block_t v21 = [v11 execName];
            unsigned int v22 = [v11 pid];
            *(_DWORD *)buf = 138543874;
            unsigned int v37 = v21;
            __int16 v38 = 1024;
            unsigned int v39 = v22;
            __int16 v40 = 2114;
            uint64_t v41 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Analysis of %{public}@ [%d] timed out. Saved out lite_diag: %{public}@. Self-destructing.", buf, 0x1Cu);
          }
        }
        else if (v18)
        {
          int v19 = [v11 execName];
          unsigned int v20 = [v11 pid];
          *(_DWORD *)buf = 138543874;
          unsigned int v37 = v19;
          __int16 v38 = 1024;
          unsigned int v39 = v20;
          __int16 v40 = 2112;
          uint64_t v41 = (uint64_t)v16;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Analysis of %{public}@ [%d] timed out. Failed to save out lite_diag due to error: %@", buf, 0x1Cu);
        }
        id v23 = [v11 execName];
        id v24 = [v11 bundleID];
        id v25 = [v11 exceptionType];
        id v26 = [v11 ledgerPhysFootprint];
        id v27 = [v11 ledgerPhysFootprintPeak];
        id v28 = [v11 limitValue];
        unsigned __int8 v29 = [v11 isMSLEnabled];
        BYTE1(v32) = [v34 gcoreCapture];
        LOBYTE(v32) = v29;
        LOBYTE(v31) = 0;
        LOBYTE(v30) = v7 == 0;
        +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:](RMETelemetry, "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:", v23, v24, v25, v26, v27, v28, v30, v7, v31, 2, v33, v32);

        _exit(-1);
      }
      os_unfair_lock_unlock(v10);
    }
  }
}

void sub_1000076E8(id a1)
{
  size_t v1 = 4;
  if (sysctlbyname("kern.max_task_pmem", &dword_1000146A4, &v1, 0, 0)) {
    dword_1000146A4 = 0;
  }
}

void sub_100007738(void *a1)
{
  id v1 = a1;
  id v21 = objc_alloc((Class)NSString);
  unsigned int v20 = [v1 execName];
  int v2 = [v1 bundleID];
  id v19 = [v1 exceptionType];
  id v18 = [v1 ledgerPhysFootprint];
  id v17 = [v1 ledgerInternal];
  id v3 = [v1 ledgerInternalCompressed];
  id v4 = [v1 ledgerAlternateAccounting];
  id v5 = [v1 ledgerAlternateAccountingCompressed];
  id v6 = [v1 ledgerIOKitMapped];
  id v7 = [v1 ledgerPageTable];
  id v8 = [v1 ledgerWiredMem];
  id v9 = [v1 ledgerPurgeableNonvolatile];
  id v10 = [v1 ledgerPurgeableNonvolatileCompressed];

  id v11 = [v21 initWithFormat:@"execName=%@, bundleId=%@, excType=%ld, physFootprint=%llu, internal=%llu, internalComp=%llu, alt=%llu, altComp=%llu, iokit=%llu, pageTable=%llu, wired=%llu, purgNonvol=%llu, purgNonvolComp=%llu", v20, v2, v19, v18, v17, v3, v4, v5, v6, v7, v8, v9, v10];
  id v12 = v11;
  id v13 = (const char *)[v12 UTF8String];
  if (v13)
  {
    id v14 = v13;
    free((void *)qword_1000146E8);
    uint64_t v15 = strdup(v14);
    qword_1000146E8 = (uint64_t)v15;
    if (v15)
    {
      qword_100014650 = (uint64_t)v15;
    }
    else
    {
      int v16 = *__error();
      qword_100014650 = (uint64_t)"Bulk analysis in flight. Unable to format corpse info.";
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v23 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy string for CrashReporterInfo: %{darwin.errno}d", buf, 8u);
      }
    }
  }
  else
  {
    qword_100014650 = (uint64_t)"Bulk analysis in flight. Unable to format corpse info.";
  }
}

id sub_10000796C(void *a1, char a2, int a3, void *a4)
{
  id v7 = a1;
  if (a3) {
    id v8 = @".memgraph";
  }
  else {
    id v8 = @".lite_diag";
  }
  if (a2 & 1) != 0 || (a3)
  {
    id v11 = +[RMECacheEnumerator getLogContainer:1];
    id v12 = v11;
    if (!v11)
    {
      if (!a4)
      {
        uint64_t v16 = 0;
        id v9 = 0;
        goto LABEL_30;
      }
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      *(void *)buf = @"Failed to get log container";
      id v18 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v47 count:1];
      +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v18];
      uint64_t v16 = 0;
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

LABEL_30:
      id v23 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v16];
      if (v23)
      {
        id v24 = [v7 _saveLogFileWithHandle:v23 error:a4];
        [v23 closeFile];
        if (v24 != (id)2)
        {
          if (v24 == (id)1 && [(__CFString *)v8 isEqualToString:@".memgraph"])
          {
            BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if ((a2 & 1) == 0)
            {
              if (v25)
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v9;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempted to save out memgraph, but no memgraph data could be written to file. Now attempting to delete invalid memgraph, since we don't have quota remaining for lite diags: %{public}@", buf, 0xCu);
              }
              if (sub_1000080EC(v9)) {
                id v36 = 0;
              }
              else {
                id v36 = v9;
              }
              id v34 = v36;
              goto LABEL_51;
            }
            if (v25)
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v9;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempted to save out memgraph, but no memgraph data could be written to file. Changing to lite diag: %{public}@", buf, 0xCu);
            }
            id v26 = [v9 stringByReplacingOccurrencesOfString:@".memgraph" withString:@".lite_diag"];
            id v27 = +[NSFileManager defaultManager];
            unsigned __int8 v28 = [v27 moveItemAtPath:v9 toPath:v26 error:0];

            if ((v28 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v9;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not rename invalid memgraph to lite_diag. Attempting to delete: %{public}@", buf, 0xCu);
              }
              if (sub_1000080EC(v9)) {
                unsigned int v37 = 0;
              }
              else {
                unsigned int v37 = v9;
              }
              id v10 = v37;

              goto LABEL_52;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v9;
              __int16 v41 = 2114;
              unsigned int v42 = v26;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully renamed invalid memgraph to lite_diag. %{public}@ -> %{public}@", buf, 0x16u);
            }
          }
          else
          {
            id v26 = v9;
          }
          uint64_t v31 = [v7 liteDiagFilePath];

          if (v31 && a3)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [v7 liteDiagFilePath];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v32;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleting initial lite diagnostic so we don't have 2 diagnostics on-device: %{public}@", buf, 0xCu);
            }
            uint64_t v33 = [v7 liteDiagFilePath];
            sub_1000080EC(v33);

            [v7 setLiteDiagFilePath:0];
          }
          id v34 = v26;
          id v9 = v34;
LABEL_51:
          id v10 = v34;
          goto LABEL_52;
        }
      }
      else
      {
        close(v16);
        if (a4)
        {
          unsigned __int8 v29 = +[NSString stringWithFormat:@"Failed to create file handle from fd: %d", v16];
          NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
          id v44 = v29;
          uint64_t v30 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          *a4 = +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v30];
        }
      }
      id v10 = 0;
LABEL_52:

      goto LABEL_53;
    }
    sub_10000824C(v11, a4, v8, v7);
    id v13 = objc_claimAutoreleasedReturnValue();
    id v14 = strdup((const char *)[v13 UTF8String]);
    if (v14)
    {
      uint64_t v15 = v14;
      id v38 = v13;
      id v39 = v7;
      uint64_t v16 = mkstemps(v14, (int)[(__CFString *)v8 length]);
      uint64_t v17 = *__error();
      id v18 = [objc_alloc((Class)NSString) initWithUTF8String:v15];
      free(v15);
      if (v16 == -1)
      {
        if (a4)
        {
          unsigned int v20 = +[NSString stringWithFormat:@"Failed to create file (errno: %d)", v17];
          NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
          *(void *)buf = v20;
          id v21 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v47 count:1];
          *a4 = +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v21];
        }
        uint64_t v16 = 0;
        id v9 = 0;
        goto LABEL_22;
      }
      if (sub_100009128(v18, v16, (uint64_t)a4))
      {
        id v18 = v18;
        id v9 = v18;
LABEL_22:
        id v13 = v38;
        id v7 = v39;
LABEL_28:

        goto LABEL_29;
      }
      close(v16);
      id v13 = v38;
      if (a4)
      {
        NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
        *(void *)buf = @"Failed to set proper permissions";
        unsigned int v22 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v47 count:1];
        *a4 = +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v22];
      }
      uint64_t v16 = 0;
    }
    else
    {
      if (a4)
      {
        NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
        *(void *)buf = @"Failed to create file name C string";
        id v19 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v47 count:1];
        *a4 = +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v19];
      }
      uint64_t v16 = 0;
      id v18 = 0;
    }
    id v9 = 0;
    goto LABEL_28;
  }
  if (!a4)
  {
    id v10 = 0;
    goto LABEL_54;
  }
  NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
  CFStringRef v46 = @"Quotas for both lite and full diags unavailable";
  id v9 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v9];
  id v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

LABEL_54:

  return v10;
}

id sub_1000080EC(void *a1)
{
  id v1 = a1;
  int v2 = +[NSFileManager defaultManager];
  id v7 = 0;
  id v3 = [v2 removeItemAtPath:v1 error:&v7];
  id v4 = v7;

  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully deleted %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v4 localizedDescription];
    *(_DWORD *)buf = 138543618;
    id v9 = v1;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ due to error %@", buf, 0x16u);
  }
  return v3;
}

id sub_10000824C(void *a1, void *a2, void *a3, void *a4)
{
  id v6 = a1;
  id v27 = a3;
  id v7 = a4;
  id v8 = [v7 execName];

  if (v8)
  {
    id v9 = [v7 execName];
  }
  else
  {
    id v9 = @"UNKNOWN_PROCESS";
  }
  __int16 v10 = [v7 currentTime];
  if (v10 || (+[NSDate date], (__int16 v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (qword_1000146F8 != -1) {
      dispatch_once(&qword_1000146F8, &stru_100010680);
    }
    id v11 = [(id)qword_1000146F0 components:252 fromDate:v10];
  }
  else
  {
    id v11 = 0;
  }
  [v7 exceptionType];
  id v12 = MREExceptionTypeToString();
  unsigned int v13 = [v7 isMSLEnabled];
  id v14 = off_100014638[0];
  if (!v13) {
    id v14 = &stru_100010E20;
  }
  uint64_t v15 = v14;
  unsigned int v16 = [v7 gcoreCapture];
  uint64_t v17 = off_100014640;
  if (!v16) {
    uint64_t v17 = &stru_100010E20;
  }
  id v18 = v17;
  id v19 = objc_alloc((Class)NSString);
  if (v11)
  {
    unsigned int v20 = v15;
    id v21 = [v19 initWithFormat:@"%@/%@%@%@_%@_%04ld-%02ld-%02ld_%02ld%02ld%02ld.XXXXXX%@", v6, v12, v18, v15, v9, [v11 year], [v11 month], [v11 day], [v11 hour], [v11 minute], [v11 second], v27];
    if (v21)
    {
LABEL_15:
      id v22 = v21;
      id v23 = v7;
      goto LABEL_19;
    }
  }
  else
  {
    id v21 = [v19 initWithFormat:@"%@/%@%@%@_%@.XXXXXX%@", v6, v12, v18, v15, v9, v27];
    unsigned int v20 = v15;
    if (v21) {
      goto LABEL_15;
    }
  }
  id v23 = v7;
  if (a2)
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Failed to create file name NSString";
    id v24 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a2 = +[NSError errorWithDomain:@"ReportMemoryExceptionError" code:1 userInfo:v24];
  }
LABEL_19:

  return v21;
}

void sub_100008590(id a1)
{
  qword_1000146F0 = (uint64_t)[objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

  _objc_release_x1();
}

uint64_t sub_1000085DC()
{
  if (!qword_100014690) {
    qword_100014690 = _sl_dlopen();
  }
  return qword_100014690;
}

uint64_t sub_1000086AC()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100014698;
  uint64_t v6 = qword_100014698;
  if (!qword_100014698)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1000087EC;
    v2[3] = &unk_1000106E0;
    v2[4] = &v3;
    sub_1000087EC((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100008760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008778()
{
  uint64_t result = _sl_dlopen();
  qword_100014690 = result;
  return result;
}

void *sub_1000087EC(uint64_t a1)
{
  int v2 = (void *)sub_1000085DC();
  if (!v2)
  {
    id v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "create_gcore_with_options");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100014698 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100008878(id a1, NSDictionary *a2)
{
  int v2 = a2;
  uint64_t v3 = [(NSDictionary *)v2 objectForKeyedSubscript:kSymptomDiagnosticReplySuccess];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)v2 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID];
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    int v7 = 138412290;
    id v8 = v5;
    uint64_t v6 = "Symptoms Diagnostic Reporter accepted the memory resource exception. SessionID: %@";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NSDictionary *)v2 objectForKeyedSubscript:kSymptomDiagnosticReplyReason];
    int v7 = 138412290;
    id v8 = v5;
    uint64_t v6 = "Symptoms Diagnostic Reporter rejected the memory resource exception with reason %@.";
    goto LABEL_6;
  }
LABEL_8:
}

void sub_1000089CC(id a1)
{
  qword_100014700 = (uint64_t)dispatch_queue_create("com.apple.ReportMemoryException.saveMemgraph", 0);

  _objc_release_x1();
}

void sub_100008A0C(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 72);
  id v3 = *(id *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [v3 execName];
    *(_DWORD *)buf = 136315650;
    id v14 = "bulkAnalysisMemgraphOnly";
    __int16 v15 = 2114;
    unsigned int v16 = v4;
    __int16 v17 = 1024;
    unsigned int v18 = [v3 pid];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Begin analysis for %{public}@ [%d]", buf, 0x1Cu);
  }
  sub_100007738(v3);
  unsigned __int8 v5 = [v3 generateMemoryGraphWithContentLevel:v2 memgraphFailedReasonOut:0];
  [v3 releaseAnalyzedTask];
  free((void *)qword_1000146E8);
  qword_1000146E8 = 0;
  qword_100014650 = (uint64_t)"Bulk analysis completed.";

  ++qword_1000146D8;
  uint64_t v6 = qword_100014700;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008BF4;
  block[3] = &unk_100010768;
  uint64_t v11 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  unsigned __int8 v12 = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  dispatch_sync(v6, block);
}

void sub_100008BF4(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    int v1 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v2 = *(void **)(a1 + 40);
    id v3 = *(void **)(a1 + 48);
    id v4 = *(id *)(a1 + 32);
    id v5 = v2;
    uint64_t v6 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v4 execName];
      *(_DWORD *)id v10 = 136315650;
      *(void *)&v10[4] = "saveMemgraphOnly";
      __int16 v11 = 2114;
      unsigned __int8 v12 = v7;
      __int16 v13 = 1024;
      unsigned int v14 = [v4 pid];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Saving log file for %{public}@ [%d]", v10, 0x1Cu);
    }
    sub_100007738(v4);
    if (v1)
    {
      *(void *)id v10 = 0;
      [v4 _saveLogFileWithHandle:v5 error:v10];
      id v8 = *(id *)v10;
    }
    else
    {
      id v8 = +[NSError errorWithDomain:MREErrorDomain[0] code:4 userInfo:0];
    }
    id v9 = v8;
    free((void *)qword_1000146E8);
    qword_1000146E8 = 0;
    qword_100014650 = (uint64_t)"Bulk analysis completed.";
    if (v6) {
      v6[2](v6, v9);
    }
  }
}

void sub_100008DAC(uint64_t a1)
{
  uint64_t v2 = qword_100014700;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008E90;
  v6[3] = &unk_1000107B8;
  uint64_t v3 = *(void *)(a1 + 40);
  v10[1] = *(id *)(a1 + 64);
  uint64_t v8 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(v10, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 32);
  id v5 = *(void **)(a1 + 72);
  id v7 = v4;
  v10[2] = v5;
  dispatch_sync(v2, v6);

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void sub_100008E90(uint64_t a1)
{
  if ((unint64_t)qword_1000146D8 < *(void *)(a1 + 64))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v3 = objc_loadWeakRetained((id *)(a1 + 56));
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 72);
    id v6 = WeakRetained;
    id v7 = v4;
    uint64_t v8 = (void (**)(id, void *))v3;
    if (v6)
    {
      id v9 = [v6 copy];
      id v10 = [v9 memoryGraph];

      if (!v10)
      {
        __int16 v11 = +[NSString stringWithFormat:@"memgraph-only analysis has timed out (timeout: %llu secs)", v5];
        [v6 setMemgraphError:v11];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v12 = [v6 execName];
          *(_DWORD *)buf = 136315906;
          __int16 v17 = "bulkAnalysisMemgraphOnlyTimeout";
          __int16 v18 = 2114;
          id v19 = v12;
          __int16 v20 = 1024;
          unsigned int v21 = [v6 pid];
          __int16 v22 = 2048;
          uint64_t v23 = v5;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Begin timeout memgraph-only operations for %{public}@ [%d] (timeout: %llu secs)", buf, 0x26u);
        }
        [v7 closeFile];
        if (v8)
        {
          __int16 v13 = +[NSError errorWithDomain:MREErrorDomain[0] code:8 userInfo:0];
          v8[2](v8, v13);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          unsigned int v14 = [v9 execName];
          unsigned int v15 = [v9 pid];
          *(_DWORD *)buf = 136315650;
          __int16 v17 = "bulkAnalysisMemgraphOnlyTimeout";
          __int16 v18 = 2114;
          id v19 = v14;
          __int16 v20 = 1024;
          unsigned int v21 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Memgraph-only analysis of %{public}@ [%d] timed out.", buf, 0x1Cu);
        }
      }
    }
  }
}

id sub_100009128(void *a1, uint64_t a2, uint64_t a3)
{
  NSFileAttributeKey v9 = NSFileProtectionKey;
  NSFileProtectionType v10 = NSFileProtectionNone;
  id v4 = a1;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v6 = +[NSFileManager defaultManager];
  id v7 = [v6 setAttributes:v5 ofItemAtPath:v4 error:a3];

  return v7;
}

id sub_100009208()
{
  uint64_t v0 = sub_100009260(0);
  int v1 = [v0 objectForKeyedSubscript:off_100014620[0]];

  return v1;
}

id sub_100009260(__CFString *a1)
{
  int v1 = @"/Library/Managed Preferences/mobile/com.apple.ReportMemoryException.plist";
  if (a1) {
    int v1 = a1;
  }
  uint64_t v2 = v1;
  id v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v2];
  if (v4) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  id v7 = 0;
  if (v4)
  {
    id v7 = +[NSDictionary dictionaryWithContentsOfFile:v2];
  }
  uint64_t v8 = +[RMECacheEnumerator getEPLProfilePath];
  uint64_t v69 = v6;
  if (v8)
  {
    NSFileAttributeKey v9 = (void *)v8;
    NSFileProtectionType v10 = +[NSFileManager defaultManager];
    if ([v10 fileExistsAtPath:v9]) {
      __int16 v11 = v9;
    }
    else {
      __int16 v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      id v67 = v9;
      id v12 = +[NSDictionary dictionaryWithContentsOfFile:v12];
    }
    else
    {
      id v67 = 0;
    }
  }
  else
  {
    id v67 = 0;
    id v12 = 0;
  }
  id v68 = v7;
  id v70 = v12;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics) {
    uint64_t v15 = 30;
  }
  else {
    uint64_t v15 = 0;
  }
  BOOL v16 = (has_internal_diagnostics & 1) != 0;
  if (has_internal_diagnostics) {
    uint64_t v17 = 120;
  }
  else {
    uint64_t v17 = 0;
  }
  if (has_internal_diagnostics) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 0;
  }
  if (has_internal_diagnostics) {
    uint64_t v19 = 10;
  }
  else {
    uint64_t v19 = 0;
  }
  if (has_internal_diagnostics) {
    uint64_t v20 = 12;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = has_internal_diagnostics ^ 1u;
  __int16 v22 = +[NSNumber numberWithInteger:v15];
  [v13 setObject:v22 forKeyedSubscript:off_100014600[0]];

  uint64_t v23 = +[NSNumber numberWithInteger:v16];
  [v13 setObject:v23 forKeyedSubscript:off_100014608[0]];

  id v24 = +[NSNumber numberWithInteger:v17];
  [v13 setObject:v24 forKeyedSubscript:off_100014618[0]];

  BOOL v25 = +[NSNumber numberWithInteger:v16];
  [v13 setObject:v25 forKeyedSubscript:@"PerProcessLimit"];

  id v26 = +[NSNumber numberWithInteger:v20];
  [v13 setObject:v26 forKeyedSubscript:@"LitePerProcessLimit"];

  id v27 = +[NSNumber numberWithInteger:v18];
  [v13 setObject:v27 forKeyedSubscript:@"PerCriticalProcessLimit"];

  NSErrorUserInfoKey v28 = +[NSNumber numberWithInteger:v19];
  [v13 setObject:v28 forKeyedSubscript:off_1000145F8[0]];

  CFStringRef v29 = +[NSNumber numberWithInteger:v19];
  [v13 setObject:v29 forKeyedSubscript:off_100014610[0]];

  uint64_t v30 = +[NSMutableDictionary dictionary];
  [v13 setObject:v30 forKeyedSubscript:@"ProcessSpecificFullDiagQuotas"];

  uint64_t v31 = +[NSNumber numberWithBool:v21];
  [v13 setObject:v31 forKeyedSubscript:@"AllowAllProcessesInSysdiagnose"];

  id v32 = [objc_alloc((Class)NSMutableSet) initWithArray:&off_100011388];
  if ([v32 count]) {
    id v33 = [v32 mutableCopy];
  }
  else {
    id v33 = objc_alloc_init((Class)NSMutableSet);
  }
  id v34 = v33;
  [v13 setObject:v33 forKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];

  id v35 = +[NSMutableSet set];
  if (os_variant_has_internal_diagnostics())
  {
    [v35 addObject:@"mediaserverd"];
    [v35 addObject:@"cameracaptured"];
  }
  if (os_variant_has_internal_diagnostics()) {
    [v35 addObject:@"backboardd"];
  }
  [v13 setObject:v35 forKeyedSubscript:@"LargeExemptedProcesses"];

  [v13 setObject:v32 forKeyedSubscript:off_100014620[0]];
  id v36 = +[NSNumber numberWithBool:0];
  [v13 setObject:v36 forKeyedSubscript:off_100014628[0]];

  unsigned int v37 = +[NSMutableArray array];
  [v13 setObject:v37 forKeyedSubscript:off_100014630[0]];

  id v38 = objc_alloc((Class)NSMutableDictionary);
  id v39 = objc_alloc_init((Class)NSMutableDictionary);
  id v40 = [v38 initWithObjectsAndKeys:v39, @"ExecNameList", 0];
  __int16 v41 = MREExceptionTypeToString();
  [v13 setObject:v40 forKeyedSubscript:v41];

  id v42 = objc_alloc((Class)NSMutableDictionary);
  id v43 = objc_alloc_init((Class)NSMutableDictionary);
  id v44 = [v42 initWithObjectsAndKeys:v43, @"ExecNameList", 0];
  NSErrorUserInfoKey v45 = MREExceptionTypeToString();
  [v13 setObject:v44 forKeyedSubscript:v45];

  id v46 = objc_alloc((Class)NSMutableDictionary);
  id v47 = objc_alloc_init((Class)NSMutableDictionary);
  id v48 = [v46 initWithObjectsAndKeys:v47, @"ExecNameList", 0];
  id v49 = MREExceptionTypeToString();
  [v13 setObject:v48 forKeyedSubscript:v49];

  id v50 = objc_alloc((Class)NSMutableDictionary);
  id v51 = objc_alloc_init((Class)NSMutableDictionary);
  id v52 = [v50 initWithObjectsAndKeys:v51, @"ExecNameList", 0];
  CFStringRef v53 = MREExceptionTypeToString();
  [v13 setObject:v52 forKeyedSubscript:v53];

  id v54 = objc_alloc((Class)NSMutableDictionary);
  id v55 = objc_alloc_init((Class)NSMutableDictionary);
  id v56 = [v54 initWithObjectsAndKeys:v55, @"ExecNameList", 0];
  uint64_t v57 = MREExceptionTypeToString();
  [v13 setObject:v56 forKeyedSubscript:v57];

  id v58 = objc_alloc((Class)NSMutableDictionary);
  id v59 = objc_alloc_init((Class)NSMutableDictionary);
  id v60 = [v58 initWithObjectsAndKeys:v59, @"ExecNameList", 0];
  unsigned int v61 = MREExceptionTypeToString();
  [v13 setObject:v60 forKeyedSubscript:v61];

  id v62 = objc_alloc((Class)NSMutableDictionary);
  id v63 = objc_alloc_init((Class)NSMutableDictionary);
  id v64 = [v62 initWithObjectsAndKeys:v63, @"ExecNameList", 0];
  double v65 = MREExceptionTypeToString();
  [v13 setObject:v64 forKeyedSubscript:v65];

  if (v70) {
    sub_100009A10(v13, v70);
  }
  if (v68) {
    sub_100009A10(v13, v68);
  }

  return v13;
}

id sub_1000099C0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100009208();
  id v3 = [v2 containsObject:v1];

  return v3;
}

void sub_100009A10(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = &AnalyticsSendEventLazy_ptr;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 objectForKeyedSubscript:@"ExpirationDate"];
    if (!v6)
    {
LABEL_5:
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      NSFileAttributeKey v9 = [v3 allKeys];
      id v10 = [v9 countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (!v10) {
        goto LABEL_77;
      }
      id v11 = v10;
      uint64_t v12 = *(void *)v53;
      id v42 = v3;
      while (1)
      {
        id v13 = 0;
        do
        {
          if (*(void *)v53 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v13);
          if ((objc_msgSend(v14, "isEqualToString:", off_100014600[0], v40) & 1) != 0
            || ([v14 isEqualToString:off_100014608[0]] & 1) != 0
            || ([v14 isEqualToString:off_1000145F8[0]] & 1) != 0
            || ([v14 isEqualToString:off_100014610[0]] & 1) != 0
            || ([v14 isEqualToString:off_100014618[0]] & 1) != 0
            || ([v14 isEqualToString:@"PerProcessLimit"] & 1) != 0
            || ([v14 isEqualToString:@"LitePerProcessLimit"] & 1) != 0
            || ([v14 isEqualToString:@"PerCriticalProcessLimit"] & 1) != 0
            || [v14 isEqualToString:@"AllowAllProcessesInSysdiagnose"])
          {
            id v15 = [v4 objectForKeyedSubscript:v14];
            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (unint64_t)[v15 integerValue] + 1 <= 0x2711)
              {
                [v3 setObject:v15 forKeyedSubscript:v14];
              }
            }
          }
          else if ([v14 isEqualToString:@"ProcessSpecificFullDiagQuotas"])
          {
            id v15 = [v4 objectForKeyedSubscript:v14];
            if (v15)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v3 objectForKeyedSubscript:v14];
                BOOL v16 = v9;
                v18 = uint64_t v17 = v5;
                sub_10000A9F4(v18, v15);

                uint64_t v5 = v17;
                NSFileAttributeKey v9 = v16;
              }
            }
          }
          else if (([v14 isEqualToString:@"LargeExemptedProcesses"] & 1) != 0 {
                 || ([v14 isEqualToString:off_100014630[0]] & 1) != 0
          }
                 || [v14 isEqualToString:off_100014620[0]])
          {
            id v15 = [v4 objectForKeyedSubscript:v14];
            if (v15)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v40 = v6;
                __int16 v41 = v9;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                id v15 = v15;
                id v19 = [v15 countByEnumeratingWithState:&v48 objects:v61 count:16];
                if (v19)
                {
                  id v20 = v19;
                  uint64_t v43 = *(void *)v49;
                  do
                  {
                    for (i = 0; i != v20; i = (char *)i + 1)
                    {
                      if (*(void *)v49 != v43) {
                        objc_enumerationMutation(v15);
                      }
                      __int16 v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if (![v14 isEqualToString:off_100014630[0]]
                          || os_variant_has_internal_diagnostics()
                          && ([v22 isEqualToString:@"mediaserverd"] & 1) != 0)
                        {
                          uint64_t v23 = [v3 objectForKeyedSubscript:v14, v40];
                          [v23 addObject:v22];

                          id v3 = v42;
                          if ([v14 isEqualToString:off_100014620[0]])
                          {
                            id v24 = [v42 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];
                            [v24 addObject:v22];

                            id v3 = v42;
                          }
                        }
                        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          id v58 = v22;
                          __int16 v59 = 2112;
                          id v60 = off_100014630[0];
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ignoring process \"%@\" for \"%@\" key, since it isn't know to have received privacy approval for collecting fullContent memgraphs for this OS configuration.", buf, 0x16u);
                        }
                      }
                    }
                    id v20 = [v15 countByEnumeratingWithState:&v48 objects:v61 count:16];
                  }
                  while (v20);
                }

                goto LABEL_50;
              }
            }
          }
          else
          {
            if (![v14 isEqualToString:@"ProcessesAllowedInSysdiagnose"])
            {
              __int16 v41 = v9;
              uint64_t v31 = v5;
              unsigned int v32 = [v14 isEqualToString:off_100014628[0]];
              uint64_t v33 = [v4 objectForKeyedSubscript:v14];
              id v15 = (id)v33;
              if (v32)
              {
                objc_opt_class();
                uint64_t v5 = v31;
                if (objc_opt_isKindOfClass()) {
                  [v3 setObject:v15 forKeyedSubscript:off_100014628[0]];
                }
                goto LABEL_51;
              }
              if (v33)
              {
                id v40 = v6;
                id v34 = [v3 objectForKeyedSubscript:v14];
                id v35 = [v15 objectForKeyedSubscript:@"PerProcessLimit"];
                if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if ((unint64_t)[v35 integerValue] + 1 <= 0x2711)
                  {
                    [v34 setObject:v35 forKeyedSubscript:@"PerProcessLimit"];
                    goto LABEL_73;
                  }
                }
                else
                {
LABEL_73:
                  id v36 = [v34 objectForKeyedSubscript:@"ExecNameList"];
                  unsigned int v37 = [v15 objectForKeyedSubscript:@"ExecNameList"];
                  sub_10000A9F4(v36, v37);

                  id v3 = v42;
                }

                id v6 = v40;
              }
              uint64_t v5 = v31;
              goto LABEL_51;
            }
            id v15 = [v4 objectForKeyedSubscript:v14];
            if (v15)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v40 = v6;
                __int16 v41 = v9;
                long long v46 = 0u;
                long long v47 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                id v15 = v15;
                id v25 = [v15 countByEnumeratingWithState:&v44 objects:v56 count:16];
                if (v25)
                {
                  id v26 = v25;
                  uint64_t v27 = *(void *)v45;
                  do
                  {
                    for (j = 0; j != v26; j = (char *)j + 1)
                    {
                      if (*(void *)v45 != v27) {
                        objc_enumerationMutation(v15);
                      }
                      uint64_t v29 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v30 = [v42 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];
                        [v30 addObject:v29];
                      }
                    }
                    id v26 = [v15 countByEnumeratingWithState:&v44 objects:v56 count:16];
                  }
                  while (v26);
                }

                id v3 = v42;
LABEL_50:
                id v6 = v40;
                uint64_t v5 = &AnalyticsSendEventLazy_ptr;
LABEL_51:
                NSFileAttributeKey v9 = v41;
              }
            }
          }

          id v13 = (char *)v13 + 1;
        }
        while (v13 != v11);
        id v38 = [v9 countByEnumeratingWithState:&v52 objects:v62 count:16];
        id v11 = v38;
        if (!v38)
        {
LABEL_77:

          goto LABEL_81;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = +[NSDate date];
      id v8 = [v6 compare:v7];

      if (v8 != (id)-1) {
        goto LABEL_5;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_81;
      }
      *(_WORD *)buf = 0;
      id v39 = "The input preferences have expired. Skipping.";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
LABEL_81:

        goto LABEL_82;
      }
      *(_WORD *)buf = 0;
      id v39 = "The input preferences are malformed. Skipping.";
    }
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v39, buf, 2u);
    goto LABEL_81;
  }
LABEL_82:
}

uint64_t sub_10000A250()
{
  if (qword_100014718 != -1) {
    dispatch_once(&qword_100014718, &stru_1000107D8);
  }
  return byte_100014710;
}

void sub_10000A294(id a1)
{
  char v1 = DiagnosticLogSubmissionEnabled();
  byte_100014710 = os_variant_has_internal_diagnostics() & v1;
}

uint64_t sub_10000A2D0()
{
  if (qword_100014720 != -1) {
    dispatch_once(&qword_100014720, &stru_1000107F8);
  }
  return byte_100014711;
}

void sub_10000A314(id a1)
{
  if (os_variant_has_internal_diagnostics()) {
    byte_100014711 = 1;
  }
}

unint64_t sub_10000A344(void *a1, uint64_t a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  id v8 = a1;
  id v9 = a3;
  id v10 = v9;
  if (v8)
  {
    if (sub_1000099C0(v9))
    {
      id v11 = [v8 objectForKeyedSubscript:@"PerCriticalProcessLimit"];
      id v12 = [v11 integerValue];

      *a4 = 1;
    }
    else
    {
      id v12 = 0;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v31 = *a4;
      int v35 = 136315650;
      id v36 = "RMEGetMemgraphLimitForExecName";
      __int16 v37 = 1024;
      LODWORD(v38[0]) = v31;
      WORD2(v38[0]) = 2048;
      *(void *)((char *)v38 + 6) = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - isCriticalProcess: %d, dailyCriticalProcessLimit: %ld", (uint8_t *)&v35, 0x1Cu);
    }
    unsigned int v14 = [v8 objectForKeyedSubscript:@"LargeExemptedProcesses"];
    if ([v14 containsObject:v10]) {
      *a5 = 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v32 = *a5;
      int v35 = 136315394;
      id v36 = "RMEGetMemgraphLimitForExecName";
      __int16 v37 = 1024;
      LODWORD(v38[0]) = v32;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - isLargeExemptProcess: %d", (uint8_t *)&v35, 0x12u);
    }
    id v15 = [v8 objectForKeyedSubscript:@"PerProcessLimit"];
    id v16 = [v15 integerValue];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v35 = 136315394;
      id v36 = "RMEGetMemgraphLimitForExecName";
      __int16 v37 = 2048;
      v38[0] = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - fullDiagPerProcessLimit: %ld", (uint8_t *)&v35, 0x16u);
    }
    uint64_t v17 = [v8 objectForKeyedSubscript:@"ProcessSpecificFullDiagQuotas"];
    uint64_t v18 = [v17 objectForKeyedSubscript:v10];

    if (v18)
    {
      id v19 = [v17 objectForKeyedSubscript:v10];
      id v16 = [v19 integerValue];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        int v35 = 136315394;
        id v36 = "RMEGetMemgraphLimitForExecName";
        __int16 v37 = 2048;
        v38[0] = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - specificLimit: %ld", (uint8_t *)&v35, 0x16u);
      }
    }
    id v20 = MREExceptionTypeToString();
    uint64_t v21 = [v8 objectForKeyedSubscript:v20];

    if (v21)
    {
      __int16 v22 = [v21 objectForKeyedSubscript:@"PerProcessLimit"];
      uint64_t v23 = v22;
      if (v22) {
        id v16 = [v22 integerValue];
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v33 = [v23 integerValue];
        int v35 = 136315394;
        id v36 = "RMEGetMemgraphLimitForExecName";
        __int16 v37 = 2048;
        v38[0] = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - typeLimit: %ld", (uint8_t *)&v35, 0x16u);
      }
      id v24 = [v21 objectForKeyedSubscript:@"ExecNameList"];
      id v25 = v24;
      if (v24)
      {
        id v26 = [v24 objectForKeyedSubscript:v10];
        uint64_t v27 = v26;
        if (v26) {
          id v16 = [v26 integerValue];
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          id v34 = [v27 integerValue];
          int v35 = 136315394;
          id v36 = "RMEGetMemgraphLimitForExecName";
          __int16 v37 = 2048;
          v38[0] = v34;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - exceptionSpecificLimit: %ld", (uint8_t *)&v35, 0x16u);
        }
      }
    }
    unint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = (unint64_t)v16;
    }
    if ((unint64_t)v12 < 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v28 = (unint64_t)v12;
    }
    if (v28 <= v29) {
      unint64_t v13 = v29;
    }
    else {
      unint64_t v13 = v28;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v35 = 136315394;
      id v36 = "RMEGetMemgraphLimitForExecName";
      __int16 v37 = 2048;
      v38[0] = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - final limit: %ld", (uint8_t *)&v35, 0x16u);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

uint64_t sub_10000A874(uint64_t result)
{
  if (result)
  {
    char v1 = [(id)result objectForKeyedSubscript:@"LitePerProcessLimit"];
    id v2 = [v1 integerValue];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315394;
      id v4 = "RMEGetLiteLimitForExecName";
      __int16 v5 = 2048;
      id v6 = v2;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s - liteDiagPerProcessLimit: %ld", (uint8_t *)&v3, 0x16u);
    }
    if ((unint64_t)v2 >= 0x7FFFFFFFFFFFFFFFLL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      return (uint64_t)v2;
    }
  }
  return result;
}

int64_t sub_10000A958(id a1, NSURL *a2, NSURL *a3)
{
  id v9 = 0;
  id v4 = a3;
  [(NSURL *)a2 getResourceValue:&v9 forKey:NSURLCreationDateKey error:0];
  id v8 = 0;
  id v5 = v9;
  [(NSURL *)v4 getResourceValue:&v8 forKey:NSURLCreationDateKey error:0];

  id v6 = [v8 compare:v5];
  return (int64_t)v6;
}

void sub_10000A9F4(void *a1, void *a2)
{
  id v11 = a1;
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = [v3 allKeys];
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v10 = [v3 objectForKeyedSubscript:v9];
              if (v10)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (unint64_t)[v10 integerValue] + 1 <= 0x2711)
                {
                  [v11 setObject:v10 forKeyedSubscript:v9];
                }
              }
            }
            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
    }
  }
}

void sub_10000ABAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      id v4 = "Got xpc error for peer: %s";
      uint32_t v5 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_target_queue((xpc_connection_t)v3, *(dispatch_queue_t *)(a1 + 32));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10000AD68;
      v6[3] = &unk_100010860;
      id v7 = *(id *)(a1 + 40);
      id v8 = *(id *)(a1 + 48);
      xpc_connection_set_event_handler((xpc_connection_t)v3, v6);
      xpc_connection_resume((xpc_connection_t)v3);

      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v4 = "Unexpected XPC event";
      uint32_t v5 = 2;
LABEL_7:
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v4, buf, v5);
    }
  }
LABEL_9:
}

void sub_10000AD68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got xpc error message in ReportMemoryException client connection: %s", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v4 = *(void **)(a1 + 32);
    uint32_t v5 = *(void **)(a1 + 40);
    id v6 = v3;
    id v7 = v4;
    id v8 = v5;
    int64_t int64 = xpc_dictionary_get_int64(v6, "MessageType");
    id v10 = xpc_dictionary_get_remote_connection(v6);
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    long long v12 = reply;
    long long v13 = 0;
    if (v10 && reply)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      id v39 = sub_10000B410;
      id v40 = &unk_1000108D8;
      id v41 = v6;
      id v42 = v12;
      long long v13 = objc_retainBlock(&buf);
    }
    if (int64 != 3)
    {
      if (int64 == 2)
      {
        uint64_t v18 = xpc_dictionary_copy_mach_send();
        if ((v18 + 1) > 1)
        {
          uint64_t v31 = v18;
          char v32 = xpc_dictionary_get_BOOL(v6, "WithMemgraph");
          sub_100004088(v31, v32, v7, v8, v13);
          mach_port_deallocate(mach_task_self_, v31);
          goto LABEL_46;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
LABEL_46:

          goto LABEL_47;
        }
        *(_WORD *)id v36 = 0;
        id v19 = "Unable to get port for memory analysis";
      }
      else
      {
        if (int64 != 1)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)id v36 = 136315138;
          string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
          id v19 = "Unexpected message from ReportMemoryException client: %s";
          uint32_t v20 = 12;
LABEL_26:
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v19, v36, v20);
          goto LABEL_46;
        }
        int64_t v14 = xpc_dictionary_get_int64(v6, "AuthToken");
        if (v10 && v12)
        {
          xpc_dictionary_set_int64(v12, "AuthToken", ~v14);
          xpc_connection_send_message((xpc_connection_t)v10, v12);
          goto LABEL_46;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
        *(_WORD *)id v36 = 0;
        id v19 = "Received an auth request without a reply context!";
      }
      uint32_t v20 = 2;
      goto LABEL_26;
    }
    mach_port_name_t v15 = xpc_dictionary_copy_mach_send();
    if (v15 + 1 > 1)
    {
      mach_port_name_t v21 = v15;
      int v22 = xpc_dictionary_get_int64(v6, "TimeoutSeconds");
      int v23 = v22;
      if (v22) {
        BOOL v24 = v22 <= 60;
      }
      else {
        BOOL v24 = 0;
      }
      int v25 = !v24;
      int v35 = v25;
      unsigned int v26 = xpc_dictionary_get_int64(v6, "ContentLevel");
      unsigned int v27 = v26;
      if (v26 >= 3)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_44;
        }
        *(_DWORD *)id v36 = 67109120;
        LODWORD(string) = v27;
        id v16 = "Invalid content level for memgraph request: %d";
        uint32_t v17 = 8;
LABEL_42:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v16, v36, v17);
LABEL_44:
        if (v13)
        {
          id v33 = +[NSError errorWithDomain:MREErrorDomain[0] code:16 userInfo:0];
          (*((void (**)(_OWORD *, void *))v13 + 2))(v13, v33);
        }
        goto LABEL_46;
      }
      int v34 = v26;
      uint64_t v28 = xpc_dictionary_dup_fd(v6, "MemgraphFileDescriptor");
      if (v28 != -1)
      {
        id v29 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v28 closeOnDealloc:1];
        if (v35) {
          uint64_t v30 = 60;
        }
        else {
          uint64_t v30 = v23;
        }
        sub_100005B54(v21, v29, v34, v30, v7, v8, v13);
        mach_port_deallocate(mach_task_self_, v21);

        goto LABEL_46;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      *(_WORD *)id v36 = 0;
      id v16 = "Unable to get file descriptor to write out memgraph";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      *(_WORD *)id v36 = 0;
      id v16 = "Unable to get port for memory analysis";
    }
    uint32_t v17 = 2;
    goto LABEL_42;
  }
LABEL_47:
}

void sub_10000B2D8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v2 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Calling xpc_transaction_exit_clean() and scheduling force exit.", v2, 2u);
  }
  xpc_transaction_exit_clean();
  sub_10000B354(*(void **)(a1 + 32), 60);
}

void sub_10000B354(void *a1, uint64_t a2)
{
  id v3 = a1;
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B4F4;
  v6[3] = &unk_100010900;
  id v7 = v3;
  uint64_t v8 = a2;
  uint32_t v5 = v3;
  dispatch_after(v4, v5, v6);
}

void sub_10000B410(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(id *)(a1 + 32);
  xpc_dictionary_get_remote_connection(v3);
  dispatch_time_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint32_t v5 = *(void **)(a1 + 40);
    if (v5)
    {
      if (v7)
      {
        id v6 = [v7 domain];
        xpc_dictionary_set_string(v5, "ErrorDomain", (const char *)[v6 UTF8String]);

        xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "ErrorCode", (int64_t)[v7 code]);
        uint32_t v5 = *(void **)(a1 + 40);
      }
      xpc_connection_send_message(v4, v5);
    }
  }
}

void sub_10000B4F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  if (qword_100014728 >= (unint64_t)qword_100014688)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v4) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ReportMemoryException still alive after xpc_transaction_exit_clean() and has waited out timeouts for critical analysis requests. Exiting at risk of data loss.\n", (uint8_t *)&v4, 2u);
    }
    _exit(-1);
  }
  id v3 = v2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = v1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ReportMemoryException potentially still has pending critical bulk analysis requests. Checking again in %lld seconds.", (uint8_t *)&v4, 0xCu);
  }
  sub_10000B354(v3, v1);
  qword_100014728 += v1;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t CSSetForceSafeMachVMReads()
{
  return _CSSetForceSafeMachVMReads();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

uint64_t MREExceptionTypeToString()
{
  return _MREExceptionTypeToString();
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

void _exit(int a1)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

int close(int a1)
{
  return _close(a1);
}

uint64_t dirstat_np()
{
  return _dirstat_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

pid_t getppid(void)
{
  return _getppid();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

int mkstemps(char *a1, int a2)
{
  return _mkstemps(a1, a2);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
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

uint64_t xpc_dictionary_copy_mach_send()
{
  return _xpc_dictionary_copy_mach_send();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_cachedMetaDataDict(void *a1, const char *a2, ...)
{
  return [a1 cachedMetaDataDict];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_coalitionBundleID(void *a1, const char *a2, ...)
{
  return [a1 coalitionBundleID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createMetaDataDict(void *a1, const char *a2, ...)
{
  return [a1 createMetaDataDict];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_exceptionType(void *a1, const char *a2, ...)
{
  return [a1 exceptionType];
}

id objc_msgSend_execName(void *a1, const char *a2, ...)
{
  return [a1 execName];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_gcoreCapture(void *a1, const char *a2, ...)
{
  return [a1 gcoreCapture];
}

id objc_msgSend_getEPLProfilePath(void *a1, const char *a2, ...)
{
  return [a1 getEPLProfilePath];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_initCacheEnumerator(void *a1, const char *a2, ...)
{
  return [a1 initCacheEnumerator];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isFirstParty(void *a1, const char *a2, ...)
{
  return [a1 isFirstParty];
}

id objc_msgSend_isMSLEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMSLEnabled];
}

id objc_msgSend_ledgerAlternateAccounting(void *a1, const char *a2, ...)
{
  return [a1 ledgerAlternateAccounting];
}

id objc_msgSend_ledgerAlternateAccountingCompressed(void *a1, const char *a2, ...)
{
  return [a1 ledgerAlternateAccountingCompressed];
}

id objc_msgSend_ledgerIOKitMapped(void *a1, const char *a2, ...)
{
  return [a1 ledgerIOKitMapped];
}

id objc_msgSend_ledgerInternal(void *a1, const char *a2, ...)
{
  return [a1 ledgerInternal];
}

id objc_msgSend_ledgerInternalCompressed(void *a1, const char *a2, ...)
{
  return [a1 ledgerInternalCompressed];
}

id objc_msgSend_ledgerNetworkNonvolatile(void *a1, const char *a2, ...)
{
  return [a1 ledgerNetworkNonvolatile];
}

id objc_msgSend_ledgerNetworkNonvolatileCompressed(void *a1, const char *a2, ...)
{
  return [a1 ledgerNetworkNonvolatileCompressed];
}

id objc_msgSend_ledgerPageTable(void *a1, const char *a2, ...)
{
  return [a1 ledgerPageTable];
}

id objc_msgSend_ledgerPhysFootprint(void *a1, const char *a2, ...)
{
  return [a1 ledgerPhysFootprint];
}

id objc_msgSend_ledgerPhysFootprintPeak(void *a1, const char *a2, ...)
{
  return [a1 ledgerPhysFootprintPeak];
}

id objc_msgSend_ledgerPurgeableNonvolatile(void *a1, const char *a2, ...)
{
  return [a1 ledgerPurgeableNonvolatile];
}

id objc_msgSend_ledgerPurgeableNonvolatileCompressed(void *a1, const char *a2, ...)
{
  return [a1 ledgerPurgeableNonvolatileCompressed];
}

id objc_msgSend_ledgerWiredMem(void *a1, const char *a2, ...)
{
  return [a1 ledgerWiredMem];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_limitValue(void *a1, const char *a2, ...)
{
  return [a1 limitValue];
}

id objc_msgSend_liteDiagFilePath(void *a1, const char *a2, ...)
{
  return [a1 liteDiagFilePath];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_memoryGraph(void *a1, const char *a2, ...)
{
  return [a1 memoryGraph];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextValidURL(void *a1, const char *a2, ...)
{
  return [a1 nextValidURL];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_releaseAnalyzedTask(void *a1, const char *a2, ...)
{
  return [a1 releaseAnalyzedTask];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_upTime(void *a1, const char *a2, ...)
{
  return [a1 upTime];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}