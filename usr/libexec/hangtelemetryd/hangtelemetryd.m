void start()
{
  NSObject *v0;
  _xpc_connection_s *mach_service;
  dispatch_time_t v2;
  NSObject *v3;

  sub_100001214();
  v0 = sub_10000123C();
  mach_service = xpc_connection_create_mach_service("com.apple.hangtelemetryd", v0, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_100004270);
  xpc_connection_activate(mach_service);
  v2 = dispatch_time(0, 10000000000);
  v3 = sub_10000123C();
  dispatch_after(v2, v3, &stru_1000042B0);

  dispatch_main();
}

void sub_100001214()
{
  if (qword_100008098 != -1) {
    dispatch_once(&qword_100008098, &stru_1000042D0);
  }
}

id sub_10000123C()
{
  if (qword_1000080B0 != -1) {
    dispatch_once(&qword_1000080B0, &stru_100004310);
  }
  v0 = (void *)qword_1000080A8;

  return v0;
}

void sub_100001290(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v3 = sub_1000027B0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = xpc_connection_get_pid(v2);
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "XPC: Client started new connection: pid %d", (uint8_t *)v6, 8u);
    }

    v4 = v2;
    v5 = sub_10000123C();
    xpc_connection_set_target_queue(v4, v5);

    xpc_connection_set_event_handler(v4, &stru_100004330);
    xpc_connection_activate(v4);
  }
}

void sub_1000013A0(id a1)
{
  v1 = sub_1000027B0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Calling xpc_transaction_exit_clean() now", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_10000140C(id a1)
{
  v1 = dispatch_get_global_queue(25, 0);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);
  v3 = (void *)qword_1000080A0;
  qword_1000080A0 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000080A0, &stru_1000042F0);
  v4 = qword_1000080A0;

  dispatch_activate(v4);
}

void sub_10000148C(id a1)
{
  v1 = sub_1000027B0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_source_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Received SIGTERM, exiting", v2, 2u);
  }

  exit(0);
}

void sub_1000014EC(id a1)
{
  qword_1000080A8 = (uint64_t)dispatch_queue_create("com.apple.hangtelemetry", 0);

  _objc_release_x1();
}

void sub_10000152C(id a1, OS_xpc_object *a2)
{
  dispatch_source_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v3 = v2;
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "command");
    if (uint64 == 1)
    {
      if (qword_1000080B8 != -1) {
        dispatch_once(&qword_1000080B8, &stru_100004350);
      }
      reply = xpc_dictionary_create_reply(v3);
      xpc_dictionary_get_remote_connection(v3);
      v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (reply && v6)
      {
        xpc_connection_send_message(v6, reply);
      }
      else
      {
        v9 = sub_1000027B0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          sub_100002848(reply != 0, v9);
        }
      }
    }
    else
    {
      uint64_t v8 = uint64;
      reply = sub_1000027B0();
      if (os_log_type_enabled(reply, OS_LOG_TYPE_FAULT)) {
        sub_1000028E0(v8, reply);
      }
    }
  }
}

void sub_100001658(id a1)
{
  int v1 = sub_1000026CC();
  dispatch_source_t v2 = sub_1000027B0();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100002958(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    goto LABEL_54;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "New boot: Refreshing telemetry metadata and saving in settings", buf, 2u);
  }

  if (qword_1000080C8 != -1) {
    dispatch_once(&qword_1000080C8, &stru_100004370);
  }
  unsigned int v11 = (unsigned __int16)word_1000080C0;
  if (qword_1000080D0 != -1) {
    dispatch_once(&qword_1000080D0, &stru_100004390);
  }
  uint64_t v12 = dword_1000080D8;
  size_t v38 = 8;
  v39 = 0;
  int v13 = sysctlbyname("kern.roots_installed", &v39, &v38, 0, 0);
  v14 = sub_1000027B0();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to get installed root info kern.roots_installed: %{errno}d", buf, 8u);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v41 = v39;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Installed root info kern.roots_installed: %llu", buf, 0xCu);
    }

    if (v39)
    {
      unsigned int v25 = 257;
      word_1000080DC = 257;
      goto LABEL_33;
    }
  }
  if (objc_opt_class())
  {
    id v17 = objc_alloc_init((Class)DUSession);
    id v37 = 0;
    unsigned __int8 v18 = [v17 openAndReturnError:&v37];
    id v19 = v37;
    id v20 = v19;
    if ((v18 & 1) == 0)
    {
      v23 = sub_1000027B0();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v20;
        v24 = "Unable to open darwinup: %@";
        goto LABEL_27;
      }
LABEL_28:

      unsigned int v25 = (unsigned __int16)word_1000080DC;
      goto LABEL_33;
    }

    id v36 = 0;
    v21 = [v17 allInstalledRootsAndReturnError:&v36];
    id v20 = v36;
    v22 = sub_1000027B0();
    v23 = v22;
    if (!v21 && v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v20;
        v24 = "Unable to get all installed roots via darwinup: %@";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100002A20(v21, v23);
    }

    LOBYTE(word_1000080DC) = 1;
    HIBYTE(word_1000080DC) = [v21 count] != 0;
  }
  else
  {
    word_1000080DC = 1;
  }
  unsigned int v25 = (unsigned __int16)word_1000080DC;
LABEL_33:
  if (qword_1000080E0 != -1) {
    dispatch_once(&qword_1000080E0, &stru_1000043B0);
  }
  unsigned int v26 = (unsigned __int16)word_1000080DE;
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v27 = objc_alloc_init((Class)NSMutableArray);
  [v27 addObject:@"HangTracerTelemetryBootSessionUUID"];
  if (v26)
  {
    v29 = +[NSNumber numberWithBool:(v26 >> 8) & 1];
    [v3 setObject:v29 forKeyedSubscript:@"HangTracerTelemetryHaveNonDefaultFeatureFlags"];

    if (v11) {
      goto LABEL_37;
    }
  }
  else
  {
    [v27 addObject:@"HangTracerTelemetryHaveNonDefaultFeatureFlags"];
    if (v11)
    {
LABEL_37:
      v28 = +[NSNumber numberWithBool:(v11 >> 8) & 1];
      [v3 setObject:v28 forKeyedSubscript:@"HangTracerTelemetrySerialLoggingEnabled"];

      goto LABEL_40;
    }
  }
  [v27 addObject:@"HangTracerTelemetrySerialLoggingEnabled"];
LABEL_40:
  if ((int)v12 < 1)
  {
    [v27 addObject:@"HangTracerTelemetryNumOSCryptexFileExtents"];
    if ((v25 & 1) == 0) {
      goto LABEL_42;
    }
LABEL_44:
    v31 = +[NSNumber numberWithBool:(v25 >> 8) & 1];
    [v3 setObject:v31 forKeyedSubscript:@"HangTracerTelemetryHaveRootsInstalled"];

    goto LABEL_45;
  }
  v30 = +[NSNumber numberWithInt:v12];
  [v3 setObject:v30 forKeyedSubscript:@"HangTracerTelemetryNumOSCryptexFileExtents"];

  if (v25) {
    goto LABEL_44;
  }
LABEL_42:
  [v27 addObject:@"HangTracerTelemetryHaveRootsInstalled"];
LABEL_45:
  CFPreferencesSetMultiple((CFDictionaryRef)v3, (CFArrayRef)v27, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  v32 = sem_open("hangtelemetryd.onceatboot", 2560, 292, 1);
  if (v32 == (sem_t *)-1)
  {
    int v33 = *__error();
    v34 = sub_1000027B0();
    v35 = v34;
    if (v33 == 17)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "HTTelemetrySetRanThisBoot called twice", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      sub_100002990(v35);
    }
  }
  else
  {
    sem_close(v32);
  }
  notify_post(off_100008090);

LABEL_54:
}

void sub_100001C60(id a1)
{
  vm_size_t v1 = vm_page_size;
  __chkstk_darwin(a1);
  dispatch_source_t v2 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v33 = v1;
  int v3 = sysctlbyname("kern.bootargs", v2, &v33, 0, 0);
  size_t v4 = v33;
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v33 >= v1;
  }
  if (v5)
  {
    uint64_t v6 = sub_1000027B0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to get kern.bootargs: %{errno}d", buf, 8u);
    }
  }
  else
  {
    v2[v33] = 0;
    LOBYTE(word_1000080C0) = 1;
    if (v4 < 9)
    {
LABEL_28:
      id v17 = sub_1000027B0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100002B24(v17, v18, v19, v20, v21, v22, v23, v24);
      }

      BOOL v25 = 0;
    }
    else
    {
      size_t v8 = 0;
      while (1)
      {
        uint64_t v9 = &v2[v8];
        if (!strncmp(&v2[v8], "serial=", 7uLL)) {
          break;
        }
        if (v8 < v4)
        {
          while (1)
          {
            unsigned int v10 = v2[v8];
            BOOL v11 = v10 > 0x20;
            uint64_t v12 = (1 << v10) & 0x100000201;
            if (!v11 && v12 != 0) {
              break;
            }
            if (v4 == ++v8)
            {
LABEL_26:
              size_t v8 = v4;
              goto LABEL_27;
            }
          }
        }
        if (v8 < v4)
        {
          while (1)
          {
            unsigned int v14 = v2[v8];
            BOOL v11 = v14 > 0x20;
            uint64_t v15 = (1 << v14) & 0x100000201;
            if (v11 || v15 == 0) {
              break;
            }
            if (v4 == ++v8) {
              goto LABEL_26;
            }
          }
        }
LABEL_27:
        if (v8 + 8 >= v4) {
          goto LABEL_28;
        }
      }
      *__error() = 0;
      unsigned int v26 = v9 + 7;
      unint64_t v27 = strtoull(v9 + 7, 0, 0);
      int v28 = *__error();
      v29 = sub_1000027B0();
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = *__error();
          *(_DWORD *)buf = 136315394;
          v35 = v26;
          __int16 v36 = 1024;
          int v37 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Non-integer serial=%s (error %{errno}d), assuming enabled", buf, 0x12u);
        }

        BOOL v25 = 1;
      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_100002AAC(v27, v30);
        }

        BOOL v25 = v27 != 0;
      }
    }
    HIBYTE(word_1000080C0) = v25;
  }
}

void sub_100001F34(id a1)
{
  vm_size_t v1 = +[MSUDataAccessor sharedDataAccessor];
  id v26 = 0;
  id v2 = [v1 copyPathForPersonalizedData:11 error:&v26];
  id v3 = v26;

  if (!v2)
  {
    uint64_t v15 = sub_1000027B0();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    v34.st_dev = 138412290;
    *(void *)&v34.st_mode = v3;
    int v16 = "Unable to get path for MSUDA_CRYPTEX1_OS_CRYPTEX: (%@)";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v34, 0xCu);
    goto LABEL_21;
  }
  id v4 = v2;
  BOOL v5 = (const char *)[v4 fileSystemRepresentation];
  if (!v5)
  {
    uint64_t v15 = sub_1000027B0();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    v34.st_dev = 138412290;
    *(void *)&v34.st_mode = v4;
    int v16 = "Unable to get fileSystemRepresentation for cryptex path %@";
    goto LABEL_15;
  }
  uint64_t v6 = (uint64_t)v5;
  int v7 = open(v5, 0, 0);
  if (v7 < 0)
  {
    id v17 = sub_1000027B0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *__error();
      v34.st_dev = 136315394;
      *(void *)&v34.st_mode = v6;
      WORD2(v34.st_ino) = 1024;
      *(_DWORD *)((char *)&v34.st_ino + 6) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FileExtent: error opening \"%s\": %{errno}d", (uint8_t *)&v34, 0x12u);
    }

    int v14 = 0;
    goto LABEL_19;
  }
  int v8 = v7;
  memset(&v34, 0, sizeof(v34));
  if (fstat(v7, &v34))
  {
    uint64_t v9 = sub_1000027B0();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      goto LABEL_9;
    }
    int v10 = *__error();
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = v6;
    __int16 v32 = 1024;
    LODWORD(v33) = v10;
    BOOL v11 = "FileExtent: failed to get file size for \"%s\": %{errno}d";
    uint64_t v12 = v9;
    uint32_t v13 = 18;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_8;
  }
  off_t st_size = v34.st_size;
  if (!v34.st_size)
  {
    uint64_t v9 = sub_1000027B0();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = v6;
    BOOL v11 = "FileExtent: no extents for \"%s\" (empty file)\n";
    uint64_t v12 = v9;
    uint32_t v13 = 12;
    goto LABEL_7;
  }
  if (v34.st_size >= 1)
  {
    off_t v20 = 0;
    int v14 = 0;
    while (1)
    {
      int v27 = 0;
      off_t v28 = st_size - v20;
      off_t v29 = v20;
      if (fcntl(v8, 65, &v27))
      {
        uint64_t v21 = sub_1000027B0();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        int v22 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = v22;
        uint64_t v23 = "FileExtent: error in fcntl(): %{errno}d";
        uint64_t v24 = v21;
        uint32_t v25 = 8;
        goto LABEL_35;
      }
      if (!v28) {
        break;
      }
      v20 += v28;
      ++v14;
      if (v20 >= st_size) {
        goto LABEL_10;
      }
    }
    uint64_t v21 = sub_1000027B0();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v31 = v20;
    __int16 v32 = 2048;
    off_t v33 = st_size;
    uint64_t v23 = "FileExtent: 0 contigbytes fcntl() at offset %lld out of %lld";
    uint64_t v24 = v21;
    uint32_t v25 = 22;
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
LABEL_36:

    goto LABEL_10;
  }
LABEL_9:
  int v14 = 0;
LABEL_10:
  close(v8);
LABEL_19:
  dword_1000080D8 = v14;
  uint64_t v15 = sub_1000027B0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100002B5C(v6, v15);
  }
LABEL_21:
}

void sub_10000232C(id a1)
{
  vm_size_t v1 = +[FFConfiguration shared];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 domains];
    id v4 = [v3 count];

    if (v4)
    {
      LOBYTE(word_1000080DE) = 1;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      BOOL v5 = [v2 domains];
      id v32 = [v5 countByEnumeratingWithState:&v40 objects:v51 count:16];
      if (v32)
      {
        uint64_t v6 = *(void *)v41;
        stat v34 = v5;
        uint64_t v31 = *(void *)v41;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v41 != v6) {
              objc_enumerationMutation(v5);
            }
            uint64_t v33 = v7;
            uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * v7);
            uint64_t v9 = [v2 featuresForDomain:v8];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v10 = v9;
            id v11 = [v10 countByEnumeratingWithState:&v36 objects:v50 count:16];
            if (v11)
            {
              id v12 = v11;
              uint64_t v13 = *(void *)v37;
              while (2)
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v37 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                  int v16 = [v2 stateForFeature:v15 domain:v8 level:4];
                  if (v16)
                  {
                    id v17 = [v2 defaultStateForFeature:v15 domain:v8];
                    int v18 = v17;
                    if (!v17 || (id v19 = [v17 value], v19 != objc_msgSend(v16, "value")))
                    {
                      off_t v28 = sub_1000027B0();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                      {
                        id v29 = [v16 value];
                        id v30 = [v18 value];
                        *(_DWORD *)buf = 138412802;
                        uint64_t v45 = v15;
                        __int16 v46 = 2048;
                        id v47 = v29;
                        __int16 v48 = 2048;
                        id v49 = v30;
                        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Found non-default feature flag for %@: %ld (default %ld)", buf, 0x20u);
                      }

                      HIBYTE(word_1000080DE) = 1;
                      [v2 invalidateCache];

                      id v2 = v34;
                      goto LABEL_29;
                    }
                  }
                }
                id v12 = [v10 countByEnumeratingWithState:&v36 objects:v50 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }

            uint64_t v7 = v33 + 1;
            BOOL v5 = v34;
            uint64_t v6 = v31;
          }
          while ((id)(v33 + 1) != v32);
          id v32 = [v34 countByEnumeratingWithState:&v40 objects:v51 count:16];
        }
        while (v32);
      }

      off_t v20 = sub_1000027B0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100002BE8(v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    else
    {
      off_t v20 = sub_1000027B0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unable to get feature flags", buf, 2u);
      }
    }

    [v2 invalidateCache];
LABEL_29:
  }
}

void sub_1000026B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_1000026CC()
{
  v0 = sem_open("hangtelemetryd.onceatboot", 0);
  if (v0 == (sem_t *)-1)
  {
    if (*__error() == 2) {
      return 0;
    }
    id v2 = sub_1000027B0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *__error();
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "sem_open() failed: %{errno}d", (uint8_t *)v4, 8u);
    }
  }
  else
  {
    sem_close(v0);
  }
  return 1;
}

id sub_1000027B0()
{
  if (qword_1000080F0 != -1) {
    dispatch_once(&qword_1000080F0, &stru_100004400);
  }
  v0 = (void *)qword_1000080E8;

  return v0;
}

void sub_100002804(id a1)
{
  qword_1000080E8 = (uint64_t)os_log_create("com.apple.hangtracer", (const char *)&unk_1000033BD);

  _objc_release_x1();
}

void sub_100002848(char a1, NSObject *a2)
{
  v2[0] = 67109632;
  v2[1] = a1 & 1;
  __int16 v3 = 1024;
  int v4 = 1;
  __int16 v5 = 2048;
  uint64_t v6 = 1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "No reply:%d or no connection:%d for command %llu", (uint8_t *)v2, 0x18u);
}

void sub_1000028E0(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unknown command %llu", (uint8_t *)&v2, 0xCu);
}

void sub_100002958(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002990(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "sem_open() creation failed: %{errno}d", (uint8_t *)v3, 8u);
}

void sub_100002A20(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%lu darwinup roots are installed", (uint8_t *)&v3, 0xCu);
}

void sub_100002AAC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found serial=%llu", (uint8_t *)&v2, 0xCu);
}

void sub_100002B24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002B5C(uint64_t a1, NSObject *a2)
{
  v2[0] = 67109378;
  v2[1] = dword_1000080D8;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Shared cache fragmentation OS Cryptex File Extents count is %d for file: (\"%s\")", (uint8_t *)v2, 0x12u);
}

void sub_100002BE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
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

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return [a1 invalidateCache];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return [a1 sharedDataAccessor];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}