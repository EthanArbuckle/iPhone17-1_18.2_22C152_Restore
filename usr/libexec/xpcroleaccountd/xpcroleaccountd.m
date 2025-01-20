void *sub_100003E4C(int a1, uint64_t a2, void *a3, ssize_t *a4)
{
  void *v8;
  ssize_t v9;
  ssize_t v10;
  void *v11;
  void *v12;

  v8 = sub_100004100(*(void *)(a2 + 96));
  v9 = read(a1, v8, *(void *)(a2 + 96));
  v10 = v9;
  if (v9 != *(void *)(a2 + 96))
  {
    if (v9 && (v9 != -1 || *__error())) {
      _os_assumes_log();
    }
    goto LABEL_8;
  }
  v11 = (void *)xpc_create_from_plist();
  v12 = v11;
  if (v11)
  {
    if (xpc_get_type(v11) != (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_release(v12);
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    if (a3 && a4)
    {
      *a4 = v10;
      *a3 = v8;
      return v12;
    }
  }
LABEL_9:
  free(v8);
  return v12;
}

int *sub_100003F34(int *result)
{
  if ((result & 0x80000000) == 0)
  {
    result = (int *)close((int)result);
    if (result)
    {
      if (*__error()) {
        _os_assumes_log();
      }
      result = __error();
      if (*result == 9) {
        sub_100005A9C();
      }
    }
  }
  return result;
}

void *sub_100003F7C(const char *a1)
{
  return sub_100003F88(a1, 0, 0);
}

void *sub_100003F88(const char *a1, void *a2, ssize_t *a3)
{
  if (!a1) {
    return 0;
  }
  v5 = (int *)open(a1, 0);
  if (v5 == -1) {
    return 0;
  }
  v6 = v5;
  memset(&v10, 0, sizeof(v10));
  int v7 = fstat((int)v5, &v10);
  if (v7 | v10.st_uid || (v10.st_mode & 0x12) != 0) {
    v8 = 0;
  }
  else {
    v8 = sub_100003E4C((int)v6, (uint64_t)&v10, a2, a3);
  }
  sub_100003F34(v6);
  return v8;
}

uint64_t xpc_support_relax_roleaccount_policy()
{
  if (qword_10000C030 != -1) {
    dispatch_once(&qword_10000C030, &stru_1000083A0);
  }
  return byte_10000C038;
}

void sub_100004088(id a1)
{
  v1 = sub_100003F7C("/Library/Preferences/com.apple.security.xpc.plist");
  if (v1)
  {
    v2 = v1;
    if (xpc_dictionary_get_value(v1, "RestrictRoleAccountServices") == &_xpc_BOOL_false) {
      byte_10000C038 = 1;
    }
    xpc_release(v2);
  }
}

void *sub_100004100(size_t size)
{
  do
  {
    v2 = malloc_type_calloc(1uLL, size, 0x5C63E6C5uLL);
    if (v2) {
      break;
    }
    if (*__error() != 12 && *__error()) {
      sub_100005AB8();
    }
  }
  while (sub_100005A28());
  return v2;
}

void start(int a1, uint64_t a2)
{
  if (a1 == 2)
  {
    v3 = *(const char **)(a2 + 8);
    if (!strcmp(v3, "-launchd"))
    {
      sub_10000428C();
      sub_10000433C();
    }
    if (!strcmp(v3, "-boot")) {
      sub_10000437C();
    }
    sub_10000428C();
    v6 = sub_1000042E8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a2 + 8);
      int v8 = 136446210;
      uint64_t v9 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "invoked with unknown argument: %{public}s", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    sub_10000428C();
    v5 = sub_1000042E8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 67109120;
      LODWORD(v9) = a1;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "unexpected argument count, exiting: %d", (uint8_t *)&v8, 8u);
    }
  }
  exit(64);
}

uint64_t sub_10000428C()
{
  uint64_t result = isatty(1);
  if (result)
  {
    v1 = __stdoutp;
    v2 = getprogname();
    fprintf(v1, "%s cannot be run directly.\n", v2);
    exit(78);
  }
  return result;
}

id sub_1000042E8()
{
  if (qword_10000C048 != -1) {
    dispatch_once(&qword_10000C048, &stru_1000083E0);
  }
  v0 = (void *)qword_10000C040;

  return v0;
}

void sub_10000433C()
{
  mach_service = xpc_connection_create_mach_service("com.apple.xpc.roleaccountd", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100008420);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_10000437C()
{
  v5[0] = "/private/var/db/com.apple.xpc.roleaccountd.staging";
  v5[1] = 0;
  v0 = fts_open(v5, 0, 0);
  if (!v0)
  {
    if (*__error()) {
      _os_assumes_log();
    }
    exit(74);
  }
  v1 = v0;
  v2 = fts_read(v0);
  if (v2)
  {
    v3 = v2;
    do
    {
      if (v3->fts_level && v3->fts_info != 1)
      {
        if (lchflags(v3->fts_path, 0) == -1)
        {
          __error();
          _os_assumes_log();
        }
        if (remove((const std::__fs::filesystem::path *)v3->fts_path, v4) == -1)
        {
          __error();
          _os_assumes_log();
        }
      }
      v3 = fts_read(v1);
    }
    while (v3);
  }
  if (fts_close(v1) == -1)
  {
    __error();
    _os_assumes_log();
  }
  exit(0);
}

void sub_100004478(id a1)
{
  qword_10000C040 = (uint64_t)os_log_create("xpcroleaccountd", "default");

  _objc_release_x1();
}

void sub_1000044BC(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v5 = v2;
    pid_t pid = xpc_connection_get_pid(v5);
    uint64_t v7 = (void *)xpc_connection_copy_entitlement_value();

    int v8 = sub_1000042E8();
    uint64_t v9 = v8;
    if (v7 == &_xpc_BOOL_true)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v14) = pid;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "pid[%d]: accepting incoming conncection", buf, 8u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000046EC;
      handler[3] = &unk_100008448;
      stat v10 = v5;
      v12 = v10;
      xpc_connection_set_event_handler(v10, handler);
      xpc_connection_activate(v10);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v14) = pid;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "pid[%d]: refusing incoming connection - process doesn't have xpcproxy entitlements", buf, 8u);
      }

      xpc_connection_cancel(v5);
    }
  }
  else
  {
    v3 = xpc_copy_description(v2);
    v4 = sub_1000042E8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connection error: %s", buf, 0xCu);
    }

    free(v3);
  }
}

void sub_1000046EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  v6 = v4;
  pid_t pid = xpc_connection_get_pid(v6);
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      uint64_t v9 = reply;
      id v10 = v5;
      if (xpc_dictionary_get_string(v10, "Path"))
      {
        if (xpc_dictionary_get_string(v10, "Token"))
        {
          if (sandbox_extension_consume() == -1)
          {
            v23 = sub_1000042E8();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_100005BB4();
            }

            goto LABEL_18;
          }
          id v11 = (id)xpc_bundle_create();
          uint64_t property = xpc_bundle_get_property();
          if (property)
          {
            from = (char *)property;
            uint64_t v13 = xpc_bundle_get_property();
            if (v13)
            {
              v14 = (const char *)v13;
              v15 = xpc_bundle_copy_info_dictionary();
              v16 = v15;
              if (!v15
                || xpc_get_type(v15) != (xpc_type_t)&_xpc_type_dictionary
                || xpc_dictionary_get_string(v16, "CFBundleIdentifier"))
              {

                int v26 = sub_1000055A4("/private/var/db/com.apple.xpc.roleaccountd.staging");
                if (v26
                  || (int v26 = sub_1000055A4("/private/var/db/com.apple.xpc.roleaccountd.staging/exec")) != 0
                  || (int v26 = sub_1000055A4("/private/var/db/com.apple.xpc.roleaccountd.staging/tmp")) != 0)
                {
LABEL_38:
                  v25 = 0;
                  *__error() = v26;
                  goto LABEL_39;
                }
                bzero(__str, 0x400uLL);
                memset(buf, 0, 144);
                if (lstat(v14, buf))
                {
                  v31 = sub_1000042E8();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                    sub_100006398();
                  }

                  int v26 = *__error();
                  if (v26) {
                    goto LABEL_38;
                  }
                }
                else
                {
                  __darwin_ino64_t st_ino = buf[0].st_ino;
                  dev_t st_dev = buf[0].st_dev;
                  int v33 = xpc_support_relax_roleaccount_policy();
                  v34 = (const char *)&unk_100006FEF;
                  if (v33) {
                    v34 = "-relaxed";
                  }
                  snprintf((char *)__str, 0x400uLL, "%s/%d.%lld%s.xpc", "/private/var/db/com.apple.xpc.roleaccountd.staging/exec", st_dev, st_ino, v34);
                }
                memset(&v78, 0, sizeof(v78));
                if (!lstat((const char *)__str, &v78))
                {
                  v40 = &v14[strlen(from) + 1];
                  v41 = sub_1000042E8();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                  {
                    buf[0].dev_t st_dev = 67109378;
                    *(_DWORD *)&buf[0].st_mode = pid;
                    LOWORD(buf[0].st_ino) = 2082;
                    *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = (__darwin_ino64_t)__str;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "pid[%d]: secured service bundle exists: [%{public}s]", (uint8_t *)buf, 0x12u);
                  }

                  bzero(buf, 0x400uLL);
                  snprintf((char *)buf, 0x400uLL, "%s/%s", (const char *)__str, v40);
                  v42 = sub_1000042E8();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    v83.dev_t st_dev = 67109378;
                    *(_DWORD *)&v83.st_mode = pid;
                    LOWORD(v83.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&v83.st_ino + 2) = (__darwin_ino64_t)buf;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "pid[%d]: secured service bundle executable: %s", (uint8_t *)&v83, 0x12u);
                  }

                  memset(&v83, 0, sizeof(v83));
                  if (lstat((const char *)buf, &v83))
                  {
                    v43 = sub_1000042E8();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                      sub_100005E34();
                    }

                    v25 = 0;
                  }
                  else if (!v83.st_uid && (v83.st_mode & 0x40) != 0)
                  {
                    v25 = (void *)xpc_bundle_create();
                  }
                  else
                  {
                    v50 = sub_1000042E8();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                      sub_100005DA8();
                    }

                    v25 = 0;
                    *__error() = 1;
                  }
LABEL_39:

                  int v27 = *__error();
                  if (sandbox_extension_release() == -1)
                  {
                    v28 = sub_1000042E8();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                      sub_100005C54();
                    }
                  }
                  *__error() = v27;
                  if (v25)
                  {
                    executable_path = (const char *)xpc_bundle_get_executable_path();
                    v22 = sub_100005A48(executable_path);

                    if (v22)
                    {
                      xpc_dictionary_set_string(v9, "Path", v22);
                      xpc_dictionary_set_uint64(v9, "Retval", 0);
                      v20 = sub_1000042E8();
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      {
                        buf[0].dev_t st_dev = 67109378;
                        *(_DWORD *)&buf[0].st_mode = pid;
                        LOWORD(buf[0].st_ino) = 2082;
                        *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = (__darwin_ino64_t)v22;
                        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "pid[%d]: successfully staged: %{public}s", (uint8_t *)buf, 0x12u);
                      }
LABEL_22:

                      xpc_connection_send_message(v6, v9);
                      free(v22);

                      goto LABEL_23;
                    }
LABEL_19:
                    v19 = __error();
                    xpc_dictionary_set_uint64(v9, "Retval", *v19);
                    v20 = sub_1000042E8();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      int v21 = *__error();
                      buf[0].dev_t st_dev = 67109376;
                      *(_DWORD *)&buf[0].st_mode = pid;
                      LOWORD(buf[0].st_ino) = 1024;
                      *(_DWORD *)((char *)&buf[0].st_ino + 2) = v21;
                      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "pid[%d]: failed: %{errno}d", (uint8_t *)buf, 0xEu);
                    }
                    v22 = 0;
                    goto LABEL_22;
                  }
LABEL_18:

                  goto LABEL_19;
                }
                bzero(buf, 0x400uLL);
                memset(out, 0, sizeof(out));
                uuid_generate(out);
                memset(&v83, 0, 37);
                uuid_unparse(out, (char *)&v83);
                snprintf((char *)buf, 0x400uLL, "%s/%s", "/private/var/db/com.apple.xpc.roleaccountd.staging/tmp", (const char *)&v83);
                v35 = sub_1000042E8();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  LODWORD(v81[0]) = 136315138;
                  *(CFTypeRef *)((char *)v81 + 4) = buf;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "staging area for bundle: %s", (uint8_t *)v81, 0xCu);
                }

                v36 = copyfile_state_alloc();
                copyfile_state_set(v36, 6u, sub_1000057E0);
                int v37 = copyfile(from, (const char *)buf, v36, 0xC800Fu);
                copyfile_state_free(v36);
                if (v37)
                {
                  v38 = sub_1000042E8();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                    sub_1000062E4(pid, v37, v38);
                  }

                  int v39 = *__error();
                  if (v39) {
                    int v26 = v39;
                  }
                  else {
                    int v26 = 79;
                  }
                  goto LABEL_38;
                }
                id v75 = (id)xpc_bundle_create();
                path = (const char *)xpc_bundle_get_path();
                v81[0] = 0;
                CFStringRef v45 = CFStringCreateWithCString(0, path, 0x8000100u);
                if (v45)
                {
                  *(void *)&v83.dev_t st_dev = kMISValidationOptionAllowAdHocSigning;
                  v83.__darwin_ino64_t st_ino = kMISValidationOptionTrustCacheOnly;
                  *(void *)uuid_t out = kCFBooleanTrue;
                  *(void *)&out[8] = kCFBooleanTrue;
                  CFDictionaryRef v46 = CFDictionaryCreate(0, (const void **)&v83, (const void **)out, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                  if (v46)
                  {
                    CFStringRef v70 = v45;
                    CFDictionaryRef cf = v46;
                    int v47 = MISValidateSignatureAndCopyInfo();
                    if (v47)
                    {
                      int v48 = v47;
                      v49 = sub_1000042E8();
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        sub_10000626C(v48, v49);
                      }
                    }
                    else
                    {
                      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v81[0], kMISValidationInfoEntitlements);
                      if (Value && (CFDictionaryRef v52 = Value, v53 = CFGetTypeID(Value), v53 == CFDictionaryGetTypeID()))
                      {
                        CFBooleanRef v54 = (const __CFBoolean *)CFDictionaryGetValue(v52, @"com.apple.private.xpc.role-account");
                        if (v54 && v54 == kCFBooleanTrue)
                        {
                          v72 = xpc_bundle_get_info_dictionary();
                          if (v72)
                          {
                            uint64_t v55 = _CFXPCCreateCFObjectFromXPCObject();
                            if (v55)
                            {
                              v56 = (void *)v55;
                              CFStringRef v45 = v70;
                              goto LABEL_103;
                            }
                            v49 = sub_1000042E8();
                            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                              sub_100006204();
                            }
                            goto LABEL_101;
                          }
                          v49 = sub_1000042E8();
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                            sub_1000061D0();
                          }
                        }
                        else
                        {
                          v49 = sub_1000042E8();
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                            sub_100006238();
                          }
                        }
                      }
                      else
                      {
                        v49 = sub_1000042E8();
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                          sub_10000619C();
                        }
                      }
                    }
                    v72 = 0;
LABEL_101:
                    CFStringRef v45 = v70;
                    goto LABEL_102;
                  }
                  v49 = sub_1000042E8();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                    sub_100006168();
                  }
                }
                else
                {
                  v49 = sub_1000042E8();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                    sub_100006134();
                  }
                }
                CFDictionaryRef cf = 0;
                v72 = 0;
LABEL_102:

                v56 = 0;
LABEL_103:
                if (v81[0]) {
                  CFRelease(v81[0]);
                }
                if (cf) {
                  CFRelease(cf);
                }
                if (v45) {
                  CFRelease(v45);
                }
                if (v56)
                {
                  CFTypeID v57 = CFGetTypeID(v56);
                  if (v57 != CFDictionaryGetTypeID())
                  {
                    v58 = sub_1000042E8();
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
                      sub_100006100();
                    }

                    CFRelease(v56);
                    v56 = 0;
                  }
                }

                v59 = v75;
                if (v56)
                {
                  v60 = v56;
                  v61 = [v56 objectForKeyedSubscript:@"XPCService"];
                  if (v61 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v62 = v61;
                    v63 = [v61 objectForKeyedSubscript:@"_RoleAccount"];
                    if (v63 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v73 = [v62 objectForKeyedSubscript:@"ServiceType"];
                      if (!v73) {
                        goto LABEL_122;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if ([v73 isEqualToString:@"Application"])
                        {
LABEL_122:

                          v64 = sub_1000042E8();
                          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                          {
                            v83.dev_t st_dev = 136315138;
                            *(void *)&v83.st_mode = __str;
                            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "moving staging area to secured destination: %s", (uint8_t *)&v83, 0xCu);
                          }

                          rename((const std::__fs::filesystem::path *)buf, __str, v65);
                          if (!v66) {
                            goto LABEL_156;
                          }
                          if (*__error() == 66)
                          {
                            memset(&v83, 0, sizeof(v83));
                            if (!lstat(from, &v83) && (v83.st_mode & 0xF000) == 0x4000 && !v83.st_uid)
                            {
                              sub_100005784((const char *)buf);
LABEL_156:
                              v25 = (void *)xpc_bundle_create();
                              goto LABEL_157;
                            }
                            v67 = sub_1000042E8();
                            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
                              sub_100005F80();
                            }

                            int v68 = 1;
                          }
                          else
                          {
                            v69 = sub_1000042E8();
                            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                              sub_100005FB4();
                            }

                            int v68 = *__error();
                            if (!v68) {
                              goto LABEL_156;
                            }
                          }
                          sub_100005784((const char *)buf);
                          v25 = 0;
                          *__error() = v68;
LABEL_157:
                          v59 = v75;
                          goto LABEL_137;
                        }
                        sub_1000042E8();
                        froma = (char *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled((os_log_t)froma, OS_LOG_TYPE_ERROR)) {
                          sub_100006030();
                        }
                      }
                      else
                      {
                        sub_1000042E8();
                        froma = (char *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled((os_log_t)froma, OS_LOG_TYPE_ERROR)) {
                          sub_100006098();
                        }
                      }
                    }
                    else
                    {
                      v73 = sub_1000042E8();
                      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        sub_100005F18();
                      }
                    }
                  }
                  else
                  {
                    v62 = v61;
                    v63 = sub_1000042E8();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                      sub_100005EB0();
                    }
                  }

                  v59 = v75;
                }

                sub_100005784((const char *)buf);
                v25 = 0;
                *__error() = 79;
LABEL_137:

                goto LABEL_39;
              }
              v30 = sub_1000042E8();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                sub_10000641C();
              }

              int v24 = 109;
            }
            else
            {
              v16 = sub_1000042E8();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                sub_100005D40();
              }
              int v24 = 2;
            }
          }
          else
          {
            v16 = sub_1000042E8();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              sub_100005CD8();
            }
            int v24 = 2;
          }

          v25 = 0;
          *__error() = v24;
          goto LABEL_39;
        }
        v18 = sub_1000042E8();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100005B4C();
        }
      }
      else
      {
        v17 = sub_1000042E8();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100005AD4(pid, v17);
        }
      }
      *__error() = 22;
      goto LABEL_18;
    }
  }
LABEL_23:
}

uint64_t sub_1000055A4(char *a1)
{
  if ((mkdir(a1, 0x1C0u) & 0x80000000) == 0) {
    return 0;
  }
  if (*__error() == 17)
  {
    memset(&v10, 0, sizeof(v10));
    int v3 = lstat(a1, &v10);
    BOOL v4 = (v10.st_mode & 0xF000) != 0x4000 && v3 == 0;
    BOOL v5 = (v10.st_mode & 0xFFF) != 0x1C0 && v3 == 0;
    if (v10.st_uid) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v4 || v5 || v6)
    {
      int v8 = sub_1000042E8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = strrchr(a1, 47);
        *(_DWORD *)buf = 136315906;
        v12 = v9;
        __int16 v13 = 1024;
        BOOL v14 = v4;
        __int16 v15 = 1024;
        BOOL v16 = v5;
        __int16 v17 = 1024;
        BOOL v18 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "bad ownership/permissions on staging area (%s) (%d,%d,%d)", buf, 0x1Eu);
      }

      *__error() = 1;
      return *__error();
    }
    if ((v3 & 0x80000000) == 0) {
      return 0;
    }
    uint64_t v7 = sub_1000042E8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100006484(a1);
    }
  }
  else
  {
    uint64_t v7 = sub_1000042E8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000650C(a1);
    }
  }

  return *__error();
}

void sub_100005784(const char *a1)
{
  if (removefile(a1, 0, 1u))
  {
    v1 = sub_1000042E8();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100006594();
    }
  }
}

uint64_t sub_1000057E0(int a1, int a2, int a3, int a4, char *a5)
{
  if (a2 != 2) {
    return 0;
  }
  uint64_t v11 = v5;
  uint64_t v12 = v6;
  memset(&v10, 0, sizeof(v10));
  if (lchown(a5, 0, 0))
  {
    int v8 = sub_1000042E8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000066C4();
    }
LABEL_12:

    return 2;
  }
  if (lstat(a5, &v10))
  {
    int v8 = sub_1000042E8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100006648();
    }
    goto LABEL_12;
  }
  if ((v10.st_mode & 0xF000) == 0xA000)
  {
    int v8 = sub_1000042E8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100006614();
    }
    goto LABEL_12;
  }
  return 0;
}

void sub_1000058E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005918(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100005938(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000059A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000059BC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000059DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

uint64_t sub_100005A28()
{
  return 1;
}

char *sub_100005A48(const char *a1)
{
  for (i = a1; ; a1 = i)
  {
    uint64_t result = strdup(a1);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        sub_100005AB8();
      }
    }
    sub_100005A28();
  }
  return result;
}

void sub_100005A9C()
{
}

void sub_100005AB8()
{
}

void sub_100005AD4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "pid[%d]: received incoming message with no path", (uint8_t *)v2, 8u);
}

void sub_100005B4C()
{
  sub_100005900();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "pid[%d]: received incoming message with no token for path[%{public}s]");
}

void sub_100005BB4()
{
  sub_1000059FC();
  __error();
  sub_1000059DC((void *)&_mh_execute_header, v0, v1, "pid[%d]: received invalid token[%d] for path[%{public}s]", v2, v3, v4, v5, 2u);
}

void sub_100005C54()
{
  sub_1000059FC();
  __error();
  sub_10000597C();
  sub_1000059DC((void *)&_mh_execute_header, v0, v1, "pid[%d]: unable to release sandbox extension for path[%s] with error[%d]", v2, v3, v4, v5, v6);
}

void sub_100005CD8()
{
  sub_100005900();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "pid[%d]: unable to resolve bundle root path[%{public}s]");
}

void sub_100005D40()
{
  sub_100005900();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "pid[%d]: unable to resolve bundle executable path[%{public}s]");
}

void sub_100005DA8()
{
  sub_100005A0C();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "bad ownership/permissions on existing RoleAccount executable (mode/uid): %u/%u", v2, 0xEu);
}

void sub_100005E34()
{
  __error();
  sub_100005A0C();
  sub_100005938((void *)&_mh_execute_header, v0, v1, "stat(2) on existing RoleAccount executable failed: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_100005EB0()
{
  sub_100005A18();
  sub_1000059A0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: XPCService dictionary is invalid", v2, v3, v4, v5, v6);
}

void sub_100005F18()
{
  sub_100005A18();
  sub_1000059A0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: RoleAccount name is invalid", v2, v3, v4, v5, v6);
}

void sub_100005F80()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "role account service exists but is not a root-owned directory.", v2, v3, v4, v5, v6);
}

void sub_100005FB4()
{
  __error();
  sub_100005A0C();
  sub_100005938((void *)&_mh_execute_header, v0, v1, "could not rename staged service: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_100006030()
{
  sub_100005A18();
  sub_1000059A0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: RoleAccount service must have ServiceType Application", v2, v3, v4, v5, v6);
}

void sub_100006098()
{
  sub_100005A18();
  sub_1000059A0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: RoleAccount ServiceType must be a string", v2, v3, v4, v5, v6);
}

void sub_100006100()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "service Info.plist is invalid", v2, v3, v4, v5, v6);
}

void sub_100006134()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "could not create CFString!", v2, v3, v4, v5, v6);
}

void sub_100006168()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "could not create options dictionary!", v2, v3, v4, v5, v6);
}

void sub_10000619C()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "invalid info for bundle", v2, v3, v4, v5, v6);
}

void sub_1000061D0()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "service has bogus Info.plist", v2, v3, v4, v5, v6);
}

void sub_100006204()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "could not retrieve Info.plist", v2, v3, v4, v5, v6);
}

void sub_100006238()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "service does not possess RoleAccount entitlement", v2, v3, v4, v5, v6);
}

void sub_10000626C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "bundle code signature not valid: %d", (uint8_t *)v2, 8u);
}

void sub_1000062E4(int a1, int a2, NSObject *a3)
{
  int v6 = *__error();
  v7[0] = 67109632;
  v7[1] = a1;
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "pid[%d]: copyfile(3) failed on service: %d, (errno %{errno}d)", (uint8_t *)v7, 0x14u);
}

void sub_100006398()
{
  sub_1000059FC();
  __error();
  sub_10000597C();
  sub_1000059DC((void *)&_mh_execute_header, v0, v1, "pid[%d]: could not stat(2) RoleAccount executable: %s: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10000641C()
{
  sub_100005900();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "pid[%d]: bundle has no CFBundleIdentifier at path[%{public}s]");
}

void sub_100006484(char *a1)
{
  strrchr(a1, 47);
  __error();
  sub_100005964();
  sub_1000059BC((void *)&_mh_execute_header, v1, v2, "staging area exists but is weird (%s): %{errno}d", v3, v4, v5, v6, v7);
}

void sub_10000650C(char *a1)
{
  strrchr(a1, 47);
  __error();
  sub_100005964();
  sub_1000059BC((void *)&_mh_execute_header, v1, v2, "could not create staging directory (%s): %{errno}d", v3, v4, v5, v6, v7);
}

void sub_100006594()
{
  __error();
  sub_100005964();
  sub_1000059BC((void *)&_mh_execute_header, v0, v1, "could not remove staged service from tmppath %{public}s: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_100006614()
{
  sub_100005958();
  sub_1000058E4((void *)&_mh_execute_header, v0, v1, "encountered symbolic link during copy", v2, v3, v4, v5, v6);
}

void sub_100006648()
{
  __error();
  sub_100005A0C();
  sub_100005938((void *)&_mh_execute_header, v0, v1, "lstat(2) failed during copy: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1000066C4()
{
  __error();
  sub_100005A0C();
  sub_100005938((void *)&_mh_execute_header, v0, v1, "chown(2) failed during copyfile(3): %{errno}d", v2, v3, v4, v5, v6);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return _MISValidateSignatureAndCopyInfo();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return _copyfile_state_alloc();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return _copyfile_state_free(a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return _copyfile_state_set(s, flag, src);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

const char *getprogname(void)
{
  return _getprogname();
}

int isatty(int a1)
{
  return _isatty(a1);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return _lchflags(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

void uuid_generate(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
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

uint64_t xpc_bundle_get_info_dictionary()
{
  return _xpc_bundle_get_info_dictionary();
}

uint64_t xpc_bundle_get_path()
{
  return _xpc_bundle_get_path();
}

uint64_t xpc_bundle_get_property()
{
  return _xpc_bundle_get_property();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
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

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_create_from_plist()
{
  return _xpc_create_from_plist();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}