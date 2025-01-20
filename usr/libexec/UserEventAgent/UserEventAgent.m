BOOL xpc_event_provider_token_fire(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return xpc_event_provider_token_fire_with_reply(a1, a2, a3, 0);
}

BOOL xpc_event_provider_token_fire_with_reply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a1 + 16)) {
    sub_100006CC8(&v6, v7);
  }
  if (a4)
  {
    int v4 = xpc_event_publisher_fire_with_reply();
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    int v4 = xpc_event_publisher_fire_noboost();
  }
  else
  {
    int v4 = xpc_event_publisher_fire();
  }
  return v4 == 0;
}

BOOL xpc_event_provider_token_set_state(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    sub_100006CC8(&v2, v3);
  }
  return xpc_event_publisher_set_subscriber_keepalive() == 0;
}

uint64_t sub_100004AC8(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 1)
  {
    if (a4) {
      sub_100006D34(&v11, v12);
    }
    uint64_t v10 = *(void *)(result + 32);
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 24);
    uint64_t v9 = *(void *)(v10 + 32);
    uint64_t v6 = 2;
    uint64_t v7 = a3;
    uint64_t v8 = 0;
  }
  else
  {
    if (a2) {
      return result;
    }
    uint64_t v4 = *(void *)(result + 32);
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 24);
    uint64_t v6 = 1;
    uint64_t v7 = a3;
    uint64_t v8 = a4;
    uint64_t v9 = *(void *)(v4 + 32);
  }

  return v5(v6, v7, v8, v9);
}

void start(int a1, uint64_t a2)
{
  qword_10000C040 = (uint64_t)os_log_create("com.apple.UserEventAgent", "Daemon");
  if (setiopolicy_np(9, 0, 1))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    *(_OWORD *)buf = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    __error();
    uint64_t v8 = __error();
    strerror(*v8);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  else
  {
    if (qword_10000C070 != -1) {
      dispatch_once(&qword_10000C070, &stru_100008398);
    }
    qword_10000C048 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
    if (qword_10000C048)
    {
      qword_10000C050 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
      if (qword_10000C050)
      {
        CFBundleGetMainBundle();
        if (qword_10000C078 != -1) {
          dispatch_once(&qword_10000C078, &stru_1000083B8);
        }
        if (a1 < 4 || !byte_10000C080) {
          goto LABEL_23;
        }
        uint64_t v4 = *(const char **)(a2 + 16);
        if (!strncmp(v4, "r", 2uLL))
        {
          int v5 = a1 - 3;
          dword_10000C058 = a1 - 3;
          byte_10000C05C = 1;
          uint64_t v6 = qword_10000C040;
          if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            uint64_t v7 = "Running specific plugin in UserEventAgent";
LABEL_16:
            _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
LABEL_17:
            int v5 = dword_10000C058;
            qword_10000C060 = a2 + 24;
            if (dword_10000C058 < 1)
            {
LABEL_22:
              byte_10000C05C = 0;
              byte_10000C05D = 0;
              qword_10000C060 = 0;
LABEL_23:
              vproc_swap_integer();
              fwrite("This program is not meant to be run directly.\n", 0x2EuLL, 1uLL, __stderrp);
              goto LABEL_25;
            }
LABEL_20:
            if (byte_10000C05C != 1 || v5 == 1) {
              goto LABEL_23;
            }
            goto LABEL_22;
          }
        }
        else
        {
          if (strncmp(v4, "d", 2uLL)) {
            goto LABEL_17;
          }
          int v5 = a1 - 3;
          dword_10000C058 = a1 - 3;
          byte_10000C05D = 1;
          uint64_t v6 = qword_10000C040;
          if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            uint64_t v7 = "Not running some plugin in original UserEventAgent";
            goto LABEL_16;
          }
        }
        qword_10000C060 = a2 + 24;
        goto LABEL_20;
      }
      uint64_t v9 = qword_10000C040;
      if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        goto LABEL_24;
      }
      goto LABEL_25;
    }
  }
  uint64_t v9 = qword_10000C040;
  if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
LABEL_24:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to create a set.", buf, 2u);
  }
LABEL_25:
  exit(1);
}

void sub_10000510C(int a1)
{
  memset(&v68, 0, sizeof(v68));
  uint64_t v2 = dispatch_group_create();
  snprintf(__str, 0x400uLL, "%s/%s/*.plugin", (const char *)&unk_1000075E5, "System/Library/UserEventPlugins");
  v3 = dispatch_queue_set_specific;
  if (!glob(__str, 0, 0, &v68))
  {
    group = v2;
    if (v68.gl_pathc)
    {
      size_t v4 = 0;
      int v5 = &selRef_UTF8String;
      do
      {
        uint64_t v6 = xpc_bundle_create();
        if (!v6)
        {
          long long v13 = qword_10000C040;
          if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR))
          {
            long long v14 = v68.gl_pathv[v4];
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to create bundle: %{public}s", buf, 0xCu);
          }
          goto LABEL_56;
        }
        uint64_t v7 = (void *)v6;
        uint64_t v8 = (void *)xpc_bundle_copy_info_dictionary();
        if (!v8)
        {
          if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR)) {
            sub_100006718();
          }
          goto LABEL_55;
        }
        uint64_t v9 = v8;
        string = xpc_dictionary_get_string(v8, "CFBundleIdentifier");
        id v11 = [objc_alloc((Class)NSString) initWithUTF8String:string];
        unsigned __int8 v12 = [(id)qword_10000C048 containsObject:v11];
        if (a1)
        {
          if ((v12 & 1) == 0) {
            goto LABEL_17;
          }
        }
        else if (v12)
        {
          goto LABEL_17;
        }
        if ([v5[10] containsObject:v11])
        {
          v15 = qword_10000C040;
          int v16 = 0;
          if (!os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          *(_DWORD *)v78 = 136446210;
          uint64_t v79 = (uint64_t)string;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not loading plugin with bundleID: %{public}s as it's already loaded.", v78, 0xCu);
LABEL_17:
          int v16 = 0;
          goto LABEL_19;
        }
        [v5[10] addObject:v11];
        int v16 = 1;
LABEL_19:

        if (qword_10000C078 != -1) {
          dispatch_once(&qword_10000C078, &stru_1000083B8);
        }
        char v17 = v16 ^ 1;
        if (!byte_10000C080) {
          char v17 = 1;
        }
        if (v17) {
          goto LABEL_35;
        }
        if ((byte_10000C05C & 1) == 0)
        {
          if (byte_10000C05D == 1)
          {
            if (string)
            {
              uint64_t v20 = dword_10000C058;
              if (dword_10000C058 >= 1)
              {
                v21 = (const char **)qword_10000C060;
                while (1)
                {
                  v22 = *v21;
                  size_t v23 = strlen(*v21);
                  if (!strncmp(string, *v21, v23 + 1)) {
                    break;
                  }
                  ++v21;
                  if (!--v20) {
                    goto LABEL_35;
                  }
                }
                v61 = qword_10000C040;
                if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v78 = 136446210;
                  uint64_t v79 = (uint64_t)v22;
                  _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Blocked a plugin: %{public}s from running in the original UEA.", v78, 0xCu);
                }
                goto LABEL_54;
              }
            }
          }
LABEL_35:
          if (v16)
          {
            v24 = xpc_dictionary_get_string(v9, "XPCEventModuleInitializer");
            if (v24)
            {
              v25 = v24;
              v26 = malloc_type_calloc(1uLL, 0x28uLL, 0xF0040D69E7C16uLL);
              *((void *)v26 + 1) = sub_100005C08();
              v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
              v28 = dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_UTILITY, 0);
              *((void *)v26 + 2) = dispatch_queue_create(string, v28);
              id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s UserEventAgent plugin", string];
              *((void *)v26 + 3) = strdup((const char *)[v29 UTF8String]);
              *(void *)v26 = qword_10000C068;
              qword_10000C068 = (uint64_t)v26;
              v30 = dlsym(*((void **)v26 + 1), v25);
              if (v30)
              {
                v31 = v30;
                path = (const char *)xpc_bundle_get_path();
                v33 = strdup(path);
                *(void *)buf = _NSConcreteStackBlock;
                *(void *)&buf[8] = 3221225472;
                *(void *)&uint8_t buf[16] = sub_100005C8C;
                v74 = &unk_1000083F8;
                v75 = v33;
                v76 = v26;
                v77 = v31;
                dispatch_block_t v34 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, buf);
                dispatch_group_async(group, *((dispatch_queue_t *)v26 + 2), v34);
                _Block_release(v34);
              }
              else
              {
                v60 = qword_10000C040;
                if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v62 = xpc_bundle_get_path();
                  *(_DWORD *)v78 = 136446466;
                  uint64_t v79 = v62;
                  __int16 v80 = 2082;
                  double v81 = *(double *)&v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}s: dlsym(%{public}s) failed", v78, 0x16u);
                }
              }
            }
            else
            {
              uint64_t v71 = 0;
              v35 = sub_100005C08();
              if (v35)
              {
                v36 = v35;
                xpc_object_t value = xpc_dictionary_get_value(v9, "CFPlugInFactories");
                if (value)
                {
                  v38 = value;
                  if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary)
                  {
                    v39 = xpc_dictionary_get_string(v38, "FB86416D-6164-2070-726F-70735C216EC0");
                    if (v39)
                    {
                      v40 = (uint64_t (*)(const CFAllocatorRef, CFUUIDRef))dlsym(v36, v39);
                      if (!v40) {
                        goto LABEL_76;
                      }
                      v41 = v40;
                      CFUUIDRef v42 = CFUUIDGetConstantUUIDWithBytes(0, 0xFCu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
                      uint64_t v43 = v41(kCFAllocatorDefault, v42);
                      if (!v43) {
                        goto LABEL_76;
                      }
                      uint64_t v44 = v43;
                      v45 = *(void (**)(uint64_t, void, void, uint64_t *))(*(void *)v43 + 8);
                      CFUUIDRef v46 = CFUUIDGetConstantUUIDWithBytes(0, 0xFDu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
                      CFUUIDBytes v47 = CFUUIDGetUUIDBytes(v46);
                      v45(v44, *(void *)&v47.byte0, *(void *)&v47.byte8, &v71);
                      (*(void (**)(uint64_t))(*(void *)v44 + 24))(v44);
                      if (v71)
                      {
                        v48 = qword_10000C040;
                        if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v49 = xpc_bundle_get_path();
                          *(_DWORD *)v78 = 136446210;
                          uint64_t v79 = v49;
                          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Calling initializer for %{public}s", v78, 0xCu);
                        }
                        uint64_t v50 = mach_absolute_time();
                        (*(void (**)(uint64_t))(*(void *)v71 + 32))(v71);
                        uint64_t v51 = mach_absolute_time();
                        v52 = qword_10000C040;
                        if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v53 = xpc_bundle_get_path();
                          double v57 = sub_100005E84(v51 - v50, v54, v55, v56);
                          *(_DWORD *)v78 = 136446466;
                          uint64_t v79 = v53;
                          __int16 v80 = 2048;
                          double v81 = v57;
                          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Initializer for %{public}s finished (took %f seconds)", v78, 0x16u);
                        }
                        v58 = malloc_type_calloc(1uLL, 0x28uLL, 0xF0040D69E7C16uLL);
                        uint64_t v59 = v71;
                        void *v58 = qword_10000C068;
                        v58[1] = v59;
                        qword_10000C068 = (uint64_t)v58;
                      }
                      else
                      {
LABEL_76:
                        if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR)) {
                          sub_100006764();
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          goto LABEL_54;
        }
        if (!string) {
          goto LABEL_35;
        }
        size_t v18 = strlen(*(const char **)qword_10000C060);
        if (!strncmp(string, *(const char **)qword_10000C060, v18 + 1)) {
          goto LABEL_35;
        }
        v19 = qword_10000C040;
        if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEBUG)) {
          sub_1000067B0(&v69, v70, v19);
        }
LABEL_54:
        xpc_release(v9);
        int v5 = &selRef_UTF8String;
LABEL_55:
        xpc_release(v7);
LABEL_56:
        ++v4;
      }
      while (v4 < v68.gl_pathc);
    }
    globfree(&v68);
    uint64_t v2 = group;
    v3 = dispatch_queue_set_specific;
  }
  v63 = qword_10000C040;
  if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEFAULT))
  {
    if (a1) {
      v64 = (const char *)&unk_1000075E5;
    }
    else {
      v64 = "non";
    }
    *(_DWORD *)buf = *((void *)v3 + 159);
    *(void *)&buf[4] = v64;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = __str;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Waiting for %{public}s system critical plugins to finish initializing from path: %{public}s", buf, 0x16u);
  }
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v65 = qword_10000C040;
  if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEFAULT))
  {
    if (a1) {
      v66 = (const char *)&unk_1000075E5;
    }
    else {
      v66 = "non";
    }
    *(_DWORD *)buf = *((void *)v3 + 159);
    *(void *)&buf[4] = v66;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = __str;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "All %{public}s system critical plugins finished initializing from path: %{public}s", buf, 0x16u);
  }
  dispatch_release(v2);
}

uint64_t xpc_event_module_get_queue(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

asl_object_t xpc_event_module_get_aslclient(uint64_t a1)
{
  asl_object_t result = *(asl_object_t *)(a1 + 32);
  if (!result)
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 16));
    asl_object_t result = asl_open(label, "com.apple.XPCEventAgent", 0);
    *(void *)(a1 + 32) = result;
  }
  return result;
}

void sub_100005A88(id a1)
{
  v5.rlim_t rlim_cur = 0;
  v5.rlim_max = 0;
  if (getrlimit(8, &v5))
  {
    v1 = qword_10000C040;
    if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR)) {
      sub_100006890(v1);
    }
  }
  else
  {
    rlim_t rlim_cur = v5.rlim_cur;
    if (v5.rlim_cur <= 0x9FF)
    {
      v5.rlim_t rlim_cur = 2560;
      int v3 = setrlimit(8, &v5);
      size_t v4 = qword_10000C040;
      if (v3)
      {
        if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR)) {
          sub_1000067F0(rlim_cur, v4);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        rlim_t v7 = rlim_cur;
        __int16 v8 = 2048;
        rlim_t v9 = v5.rlim_cur;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully setrlimit(): Previous = %llu, Current limit = %llu", buf, 0x16u);
      }
    }
  }
}

void sub_100005BB0(id a1)
{
  byte_10000C080 = os_variant_has_internal_diagnostics();
}

void sub_100005BD8(id a1)
{
  xpc_transaction_exit_clean();
  v1 = qword_10000C088;

  dispatch_source_cancel(v1);
}

void *sub_100005C08()
{
  executable_path = (const char *)xpc_bundle_get_executable_path();
  if (executable_path)
  {
    asl_object_t result = dlopen(executable_path, 5);
    if (result) {
      return result;
    }
    if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR)) {
      sub_10000699C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR))
  {
    sub_100006920();
  }
  return 0;
}

void sub_100005C8C(uint64_t a1)
{
  uint64_t v2 = qword_10000C040;
  if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Calling initializer for %{public}s", buf, 0xCu);
  }
  size_t v4 = _os_activity_create((void *)&_mh_execute_header, *(const char **)(*(void *)(a1 + 40) + 24), (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v4, &v16);
  uint64_t v5 = mach_absolute_time();
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, 0);
  if (!Mutable)
  {
    v15 = qword_10000C040;
    if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR)) {
      sub_100006A18(v15);
    }
    exit(1);
  }
  CFMutableArrayRef v7 = Mutable;
  dispatch_queue_set_specific(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 16), off_10000C038, Mutable, 0);
  (*(void (**)(void))(a1 + 48))(*(void *)(a1 + 40));
  uint64_t v8 = mach_absolute_time();
  rlim_t v9 = qword_10000C040;
  if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    double v14 = sub_100005E84(v8 - v5, v10, v11, v12);
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initializer for %{public}s finished (took %f seconds)", buf, 0x16u);
  }
  sub_100005FB8();
  dispatch_queue_set_specific(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 16), off_10000C038, 0, 0);
  CFRelease(v7);
  free(*(void **)(a1 + 32));
  os_activity_scope_leave(&v16);
}

double sub_100005E84(unint64_t a1, double a2, double a3, double a4)
{
  if (qword_10000C098 != -1) {
    dispatch_once(&qword_10000C098, &stru_100008418);
  }
  LODWORD(a4) = HIDWORD(qword_10000C090);
  LODWORD(a3) = qword_10000C090;
  return (double)a1 * (double)*(unint64_t *)&a3 / (double)*(unint64_t *)&a4 / 1000000000.0;
}

void sub_100005EF8(id a1)
{
  if (mach_timebase_info((mach_timebase_info_t)&qword_10000C090))
  {
    v1 = qword_10000C040;
    if (os_log_type_enabled((os_log_t)qword_10000C040, OS_LOG_TYPE_ERROR)) {
      sub_100006A5C(v1);
    }
    qword_10000C090 = (uint64_t)&_mh_execute_header;
  }
}

void sub_100005F58(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005F78(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_100005F98()
{
  return xpc_bundle_get_path();
}

void sub_100005FB8()
{
  CFArrayRef specific = (const __CFArray *)dispatch_get_specific(off_10000C038);
  if (specific && (CFArrayRef v1 = specific, TypeID = CFArrayGetTypeID(), TypeID == CFGetTypeID(v1)))
  {
    CFIndex Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(v1, i);
        if (ValueAtIndex)
        {
          CFMutableArrayRef v7 = ValueAtIndex;
          if (ValueAtIndex[2])
          {
            xpc_event_publisher_activate();
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v8 = *v7;
              *(_DWORD *)buf = 136315138;
              uint64_t v10 = v8;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully activated the xpc_provider with name: %s", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_100006AA0();
  }
}

void sub_100006110(int a1)
{
  os_unfair_lock_lock_with_options();
  int v2 = dword_10000C0A4;
  dword_10000C0A4 = a1;
  if (v2 != a1)
  {
    if (a1 == 1)
    {
      for (uint64_t i = qword_10000C0A8; i; uint64_t i = *(void *)(i + 40))
        xpc_event_publisher_activate();
    }
    else if (!a1)
    {
      sub_100006AE8();
    }
  }

  os_unfair_lock_unlock(&stru_10000C0A0);
}

unsigned char *xpc_event_provider_create(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = malloc_type_calloc(1uLL, 0x38uLL, 0x10B0040BE157AC1uLL);
  if (v6)
  {
    CFMutableArrayRef v7 = strdup(a1);
    *(void *)uint64_t v6 = v7;
    if (!v7) {
      sub_100006B04(v17, &v18);
    }
    uint64_t v8 = v7;
    if (!strcmp(v7, "com.apple.cts")
      || !strcmp(v8, "com.apple.distnoted.matching")
      || !strcmp(v8, "com.apple.xpc.activity"))
    {
      v6[48] = 1;
    }
    rlim_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create(v8, v10);
    *((void *)v6 + 1) = v11;
    if (!v11) {
      sub_100006B70(v17, &v18);
    }
    *((void *)v6 + 3) = a2;
    if (!a2) {
      sub_100006BDC(v17, &v18);
    }
    *((void *)v6 + 4) = a3;
    *((void *)v6 + 2) = xpc_event_publisher_create();
    *(void *)&long long v18 = _NSConcreteStackBlock;
    *((void *)&v18 + 1) = 0x40000000;
    __int16 v19 = sub_100004AC8;
    double v20 = &unk_100008438;
    v21 = v6;
    xpc_event_publisher_set_handler();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 0x40000000;
    v17[2] = sub_10000644C;
    v17[3] = &unk_100008458;
    v17[4] = v6;
    xpc_event_publisher_set_error_handler();
    os_unfair_lock_lock_with_options();
    *((void *)v6 + 5) = qword_10000C0A8;
    qword_10000C0A8 = (uint64_t)v6;
    if (dword_10000C0A4 == 1) {
      xpc_event_publisher_activate();
    }
    os_unfair_lock_unlock(&stru_10000C0A0);
    CFArrayRef specific = (__CFArray *)dispatch_get_specific(off_10000C038);
    if (specific && (uint64_t v13 = specific, TypeID = CFArrayGetTypeID(), TypeID == CFGetTypeID(v13)))
    {
      CFArrayAppendValue(v13, v6);
    }
    else
    {
      uint64_t v15 = *(void *)v6;
      if (strncmp("com.apple.bonjour.events", *(const char **)v6, 0x19uLL)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_100006C48(v15);
      }
    }
  }
  return v6;
}

uint64_t xpc_event_provider_get_queue(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_10000644C()
{
}

uint64_t sub_100006524()
{
  return _os_log_send_and_compose_impl();
}

double sub_100006548(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_100006584()
{
  return _os_crash_msg();
}

BOOL sub_10000659C()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

unsigned char *UserEventAgentRegisterForLaunchEvents(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = malloc_type_malloc(0x10uLL, 0x80040803F642BuLL);
  *uint64_t v6 = a2;
  v6[1] = a3;

  return xpc_event_provider_create(a1, (uint64_t)sub_100006628, (uint64_t)v6);
}

void sub_100006628(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  uint64_t valuePtr = a2;
  if (a1 == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &valuePtr);
  if (a3) {
    a3 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  (*(void (**)(uint64_t, CFNumberRef, const void *, void))a4)(v6, v7, a3, *(void *)(a4 + 8));
  CFRelease(v7);
  if (a3) {
    CFRelease(a3);
  }
}

uint64_t UserEventAgentSetLaunchEventState(uint64_t a1, CFNumberRef number)
{
  uint64_t valuePtr = 0;
  uint64_t result = CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
  if (result) {
    return xpc_event_provider_token_set_state(a1);
  }
  return result;
}

void sub_100006718()
{
  uint64_t v2 = sub_100005F98();
  _DWORD *v1 = 136446210;
  *uint64_t v0 = v2;
  sub_100005F78((void *)&_mh_execute_header, v3, v4, "Failed to copy info dictionary for bundle %{public}s");
}

void sub_100006764()
{
  uint64_t v2 = sub_100005F98();
  _DWORD *v1 = 136446210;
  *uint64_t v0 = v2;
  sub_100005F78((void *)&_mh_execute_header, v3, v4, "error: %{public}s does not support IUserEventAgent interface\n");
}

void sub_1000067B0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Blocked a plugin from running in case of isolated.", buf, 2u);
}

void sub_1000067F0(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = v4;
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to setrlimit(): %{errno}d. Current limit: %llu", (uint8_t *)v5, 0x12u);
}

void sub_100006890(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to getrlimit: %{errno}d", (uint8_t *)v3, 8u);
}

void sub_100006920()
{
  xpc_bundle_get_path();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "%{public}s: missing executable", v2, v3, v4, v5, 2u);
}

void sub_10000699C()
{
  dlerror();
  sub_100005F58((void *)&_mh_execute_header, v0, v1, "%{public}s", v2, v3, v4, v5, 2u);
}

void sub_100006A18(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to allocate an array.", v1, 2u);
}

void sub_100006A5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to get timebase info", v1, 2u);
}

void sub_100006AA0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to activate xpc_provider immediately after initializer returned. Context corrupted.", v0, 2u);
}

void sub_100006AE8()
{
}

void sub_100006B04(void *a1, _OWORD *a2)
{
}

void sub_100006B70(void *a1, _OWORD *a2)
{
}

void sub_100006BDC(void *a1, _OWORD *a2)
{
}

void sub_100006C48(uint64_t a1)
{
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to set the monitor (%s) in the current queue's context.", (uint8_t *)&v1, 0xCu);
}

void sub_100006CC8(void *a1, _OWORD *a2)
{
}

void sub_100006D34(void *a1, _OWORD *a2)
{
  sub_100006548(a1, a2);
  sub_10000659C();
  sub_100006568();
  sub_100006524();
  uint64_t v2 = (__CFArray *)sub_100006584();
  __break(1u);
  CFArrayAppendValue(v2, v3);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
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

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CTTelephonyCenterGetDefault()
{
  return _CTTelephonyCenterGetDefault();
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

int *__error(void)
{
  return ___error();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return _asl_open(ident, facility, opts);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return _glob(a1, a2, a3, a4);
}

void globfree(glob_t *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

uint64_t vproc_swap_string()
{
  return _vproc_swap_string();
}

uint64_t xpc_bundle_copy_info_dictionary()
{
  return _xpc_bundle_copy_info_dictionary();
}

uint64_t xpc_bundle_create()
{
  return _xpc_bundle_create();
}

uint64_t xpc_bundle_get_executable_path()
{
  return _xpc_bundle_get_executable_path();
}

uint64_t xpc_bundle_get_path()
{
  return _xpc_bundle_get_path();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_fire_noboost()
{
  return _xpc_event_publisher_fire_noboost();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return _xpc_event_publisher_fire_with_reply();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

uint64_t xpc_event_publisher_set_subscriber_keepalive()
{
  return _xpc_event_publisher_set_subscriber_keepalive();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_strerror()
{
  return _xpc_strerror();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}