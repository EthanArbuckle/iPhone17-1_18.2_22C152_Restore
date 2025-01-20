uint64_t sub_100001A7C(int a1, uint64_t a2, void *a3, int a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  const char *v19;
  uint32_t v20;
  int v21;
  int *v22;
  char *v23;
  int v25;
  int v26;
  int *v27;
  char *v28;
  const char *v29;
  uint32_t v30;
  void *v31;
  char *errorbuf;
  uint8_t buf[4];
  void v34[2];

  v7 = a3;
  v8 = v7;
  if (a1 < 0 || !v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid inputs", buf, 2u);
    }
    goto LABEL_28;
  }
  v9 = v7;
  v10 = v9;
  v11 = v9;
  if (a4 == 1)
  {
    v11 = [v9 stringByAppendingPathComponent:@"Documents"];
  }
  v12 = +[NSFileManager defaultManager];
  v13 = [v12 fileExistsAtPath:v11];

  if (v13)
  {
    v11 = v11;
    [v11 UTF8String];
    v14 = sandbox_extension_issue_file();
    if (v14)
    {
      v15 = (void *)v14;
      errorbuf = 0;
      if (sandbox_init("mobile-house-arrest", 1uLL, &errorbuf) < 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *__error();
          *(_DWORD *)buf = 67109378;
          LODWORD(v34[0]) = v25;
          WORD2(v34[0]) = 2080;
          *(void *)((char *)v34 + 6) = errorbuf;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sandbox_init failed: %d (%s)", buf, 0x12u);
        }
        sandbox_free_error(errorbuf);
        goto LABEL_41;
      }
      if (sandbox_extension_consume() < 0)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_41;
        }
        v26 = *__error();
        v27 = __error();
        v28 = strerror(*v27);
        *(_DWORD *)buf = 67109378;
        LODWORD(v34[0]) = v26;
        WORD2(v34[0]) = 2080;
        *(void *)((char *)v34 + 6) = v28;
        v29 = "sandbox_extension_consume failed: %d (%s)";
        v30 = 18;
      }
      else
      {
        if (AFCCreateServerContext())
        {
          if (AFCConnectionCreate())
          {
            if (a2) {
              AFCConnectionSetSecureContext();
            }
            AFCInitServerConnection();
            AFCServerConnectionSetFileCoordinationEnabled();
            AFCServerConnectionSetRespectDataProtectionClass();
            AFCConnectionSetIOTimeout();
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_100002FCC((uint64_t)v10, (uint64_t)v11);
            }
            v16 = AFCServeWithRoot();
            if (v16 != -402636789 && (v17 = v16) != 0)
            {
              v31 = (void *)AFCCopyErrorString();
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                LODWORD(v34[0]) = v17;
                WORD2(v34[0]) = 2112;
                *(void *)((char *)v34 + 6) = v31;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AFCServe failed: 0x%x (%@)", buf, 0x12u);
              }

              v18 = 0xFFFFFFFFLL;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_100002F84();
              }
              v18 = 0;
            }
            AFCFreeServerContext();
            AFCConnectionClose();
            goto LABEL_42;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not open the AFC connection", buf, 2u);
          }
          AFCFreeServerContext();
LABEL_41:
          v18 = 0xFFFFFFFFLL;
LABEL_42:
          free(v15);

          goto LABEL_29;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_41;
        }
        *(_WORD *)buf = 0;
        v29 = "Could not create AFC server context";
        v30 = 2;
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
      goto LABEL_41;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    v21 = *__error();
    v22 = __error();
    v23 = strerror(*v22);
    *(_DWORD *)buf = 67109378;
    LODWORD(v34[0]) = v21;
    WORD2(v34[0]) = 2080;
    *(void *)((char *)v34 + 6) = v23;
    v19 = "sandbox_extension_issue_file failed: %d (%s)";
    v20 = 18;
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34[0] = v11;
    v19 = "%@ does not exist";
    v20 = 12;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
  }
LABEL_27:

LABEL_28:
  v18 = 0xFFFFFFFFLL;
LABEL_29:

  return v18;
}

CFStringRef sub_100001F88(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  v6 = v5;
  char v51 = 0;
  if (!a1 || !v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "invalid input";
      goto LABEL_8;
    }
LABEL_9:
    CFStringRef v8 = @"InternalFailure";
    goto LABEL_10;
  }
  if (a3 >= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "invalid request";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v50 = 0;
  id v10 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v50];
  v11 = (__CFString *)v50;
  if (v10)
  {
LABEL_16:
    id v13 = v10;
    id v14 = v6;
    id v15 = v13;
    objc_opt_class();
    v16 = v15;
    if (objc_opt_isKindOfClass())
    {
      v16 = [v15 containingBundleRecord];
    }
    id v17 = v16;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v14;
        v21 = "%@ is not an application or extension for an application.";
        goto LABEL_24;
      }
LABEL_25:
      char v22 = 0;
      CFStringRef v8 = @"ApplicationLookupFailed";
      goto LABEL_26;
    }
    v19 = [v17 applicationState];
    unsigned int v20 = [v19 isPlaceholder];

    if (v20)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v14;
        v21 = "found placeholder for %@";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    v47 = v11;
    if (os_variant_allows_internal_security_policies()) {
      unsigned int v34 = [v17 isAdHocCodeSigned];
    }
    else {
      unsigned int v34 = 0;
    }
    v35 = [v17 typeForInstallMachinery];
    unsigned __int8 v36 = [v35 isEqualToString:@"User"];

    if ((v36 & 1) == 0 && (v34 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v17 typeForInstallMachinery];
        *(_DWORD *)buf = 138412546;
        id v53 = v14;
        __int16 v54 = 2112;
        CFStringRef v55 = v37;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid application type for %@: %@", buf, 0x16u);
      }
      char v22 = 0;
      CFStringRef v8 = @"InstallationLookupFailed";
      v11 = v47;
      goto LABEL_26;
    }
    if (a3 == 1)
    {
      v11 = v47;
      if ((([v17 isFileSharingEnabled] | v34) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v14;
          v41 = "file sharing is not enabled for %@";
          uint32_t v45 = 12;
          goto LABEL_79;
        }
        goto LABEL_80;
      }
    }
    else
    {
      v11 = v47;
      if ((([v15 isProfileValidated] | v34) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if ([v15 isProfileValidated]) {
            CFStringRef v42 = @"true";
          }
          else {
            CFStringRef v42 = @"false";
          }
          unsigned int v43 = [v17 isAdHocCodeSigned];
          *(_DWORD *)buf = 138412802;
          if (v43) {
            CFStringRef v44 = @"true";
          }
          else {
            CFStringRef v44 = @"false";
          }
          id v53 = v14;
          __int16 v54 = 2112;
          CFStringRef v55 = v42;
          __int16 v56 = 2112;
          CFStringRef v57 = v44;
          v41 = "unsupported code signature for %@ (validated profile: %@, ad-hoc signed: %@)";
          goto LABEL_76;
        }
LABEL_80:
        char v22 = 0;
        CFStringRef v8 = @"InstallationLookupFailed";
LABEL_26:

        if (v22)
        {
          uint64_t v23 = [v15 dataContainerURL];
          if (v23)
          {
            v24 = (__CFString *)v23;
            id v46 = v14;
            v25 = v11;
            v26 = +[NSFileManager defaultManager];
            v27 = [(__CFString *)v24 path];
            unsigned __int8 v28 = [v26 fileExistsAtPath:v27 isDirectory:&v51];

            if (v28)
            {
              v29 = v25;
              if (v51)
              {
                dispatch_time_t v30 = dispatch_time(0, 1000000000);
                v31 = dispatch_get_global_queue(0, 0);
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_100002888;
                block[3] = &unk_100004238;
                block[4] = a1;
                dispatch_after(v30, v31, block);

                v32 = [(__CFString *)v24 path];
                LODWORD(v31) = lockdown_get_socket();
                uint64_t securecontext = lockdown_get_securecontext();
                sub_100001A7C((int)v31, securecontext, v32, a3);
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v53 = v46;
                  __int16 v54 = 2112;
                  CFStringRef v55 = v24;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid data container for %@ (%@)", buf, 0x16u);
                }

                CFStringRef v8 = @"InvalidPath";
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v53 = v46;
                __int16 v54 = 2112;
                CFStringRef v55 = v24;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "missing data container for %@ (%@)", buf, 0x16u);
              }

              CFStringRef v8 = @"PathMissing";
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v53 = v14;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to retrieve data container for %@", buf, 0xCu);
            }

            CFStringRef v8 = @"MissingContainer";
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v53 = v14;
            __int16 v54 = 2112;
            CFStringRef v55 = v8;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ is not an allowed app bundle or extension: %@", buf, 0x16u);
          }
        }
        goto LABEL_10;
      }
      if ((([v15 isUPPValidated] ^ 1 | v34) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if ([v15 isUPPValidated]) {
            CFStringRef v38 = @"true";
          }
          else {
            CFStringRef v38 = @"false";
          }
          unsigned int v39 = [v17 isAdHocCodeSigned];
          *(_DWORD *)buf = 138412802;
          if (v39) {
            CFStringRef v40 = @"true";
          }
          else {
            CFStringRef v40 = @"false";
          }
          id v53 = v14;
          __int16 v54 = 2112;
          CFStringRef v55 = v38;
          __int16 v56 = 2112;
          CFStringRef v57 = v40;
          v41 = "unsupported code signature for %@ (UPP validated profile: %@, ad-hoc signed: %@)";
LABEL_76:
          uint32_t v45 = 32;
LABEL_79:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v41, buf, v45);
          goto LABEL_80;
        }
        goto LABEL_80;
      }
    }
    CFStringRef v8 = 0;
    char v22 = 1;
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v53 = v6;
    __int16 v54 = 2112;
    CFStringRef v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to lookup application for %@, attempting app extension: %@", buf, 0x16u);
  }
  v49 = v11;
  id v10 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v6 error:&v49];
  v12 = v49;

  if (v10)
  {
    v11 = v12;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v53 = v6;
    __int16 v54 = 2112;
    CFStringRef v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to lookup app extension for %@: %@", buf, 0x16u);
  }

  CFStringRef v8 = @"ApplicationLookupFailed";
LABEL_10:

  return v8;
}

void sub_100002888(uint64_t a1)
{
}

uint64_t start()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  int v6 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100003058();
  }
  id v0 = &_dispatch_main_q;
  *((_DWORD *)v4 + 6) = lockdown_checkin_xpc();

  if (*((_DWORD *)v4 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = *((_DWORD *)v4 + 6);
      *(_DWORD *)buf = 67109120;
      int v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to checkin with lockdown: 0x%08x", buf, 8u);
    }
    exit(1);
  }
  CFRunLoopRun();
  _Block_object_dispose(&v3, 8);
  return 0;
}

void sub_100002A28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_100002A48(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = lockdown_receive_message();
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive request from host: 0x%08x", buf, 8u);
    }
LABEL_17:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "closing connection", buf, 2u);
    }
    lockdown_disconnect();
    exit(0);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received request: %@", buf, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [0 objectForKeyedSubscript:@"Command"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v6 = [0 objectForKeyedSubscript:@"Identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v5 isEqualToString:@"VendContainer"])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "vend container", buf, 2u);
          }
          unsigned int v7 = 0;
          goto LABEL_15;
        }
        if ([v5 isEqualToString:@"VendDocuments"])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "vend documents", buf, 2u);
          }
          unsigned int v7 = 1;
LABEL_15:
          sub_100001F88(a2, v6, v7);
          int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v8) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v5;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received unknown command: %@", buf, 0xCu);
        }
        int v8 = @"UnknownCommand";
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request did not contain an identifier", buf, 2u);
        }
        int v8 = @"MissingIdentifier";
      }
LABEL_16:
      sub_100002E24(a2, @"Error", v8);
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Request did not contain a command";
      goto LABEL_26;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v10 = "Request is invalid";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
  }
  int v8 = @"MissingCommand";
  goto LABEL_16;
}

void sub_100002E24(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = v5;
  if (v4 && v5)
  {
    id v14 = v4;
    id v15 = v5;
    unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    int v8 = lockdown_send_message();
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        v11 = v7;
        __int16 v12 = 1024;
        int v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send message (%@) to host: 0x%08x", (uint8_t *)&v10, 0x12u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid inputs", (uint8_t *)&v10, 2u);
    }
    unsigned int v7 = 0;
  }
}

void sub_100002F84()
{
  *(_WORD *)id v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "closing afc connection", v0, 2u);
}

void sub_100002FCC(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "serving %@, w/ sandbox path %@", (uint8_t *)&v2, 0x16u);
}

void sub_100003058()
{
  *(_WORD *)id v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "starting house arrest", v0, 2u);
}

uint64_t AFCConnectionClose()
{
  return _AFCConnectionClose();
}

uint64_t AFCConnectionCreate()
{
  return _AFCConnectionCreate();
}

uint64_t AFCConnectionSetIOTimeout()
{
  return _AFCConnectionSetIOTimeout();
}

uint64_t AFCConnectionSetSecureContext()
{
  return _AFCConnectionSetSecureContext();
}

uint64_t AFCCopyErrorString()
{
  return _AFCCopyErrorString();
}

uint64_t AFCCreateServerContext()
{
  return _AFCCreateServerContext();
}

uint64_t AFCFreeServerContext()
{
  return _AFCFreeServerContext();
}

uint64_t AFCInitServerConnection()
{
  return _AFCInitServerConnection();
}

uint64_t AFCServeWithRoot()
{
  return _AFCServeWithRoot();
}

uint64_t AFCServerConnectionSetFileCoordinationEnabled()
{
  return _AFCServerConnectionSetFileCoordinationEnabled();
}

uint64_t AFCServerConnectionSetRespectDataProtectionClass()
{
  return _AFCServerConnectionSetRespectDataProtectionClass();
}

void CFRunLoopRun(void)
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
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_securecontext()
{
  return _lockdown_get_securecontext();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

void sandbox_free_error(char *errorbuf)
{
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return [a1 containingBundleRecord];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_isAdHocCodeSigned(void *a1, const char *a2, ...)
{
  return [a1 isAdHocCodeSigned];
}

id objc_msgSend_isFileSharingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFileSharingEnabled];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return [a1 isProfileValidated];
}

id objc_msgSend_isUPPValidated(void *a1, const char *a2, ...)
{
  return [a1 isUPPValidated];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_typeForInstallMachinery(void *a1, const char *a2, ...)
{
  return [a1 typeForInstallMachinery];
}