void sub_100002884(uint64_t a1, uint64_t a2)
{
  void *v4;
  void v5[6];

  if (qword_100018898 != -1) {
    dispatch_once(&qword_100018898, &stru_100014818);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002948;
  v5[3] = &unk_1000147D8;
  v5[4] = a1;
  v5[5] = a2;
  [(id)qword_1000188A0 eapConfigurationWithCompletion:v5];
}

void sub_100002948(uint64_t a1, void *a2, uint64_t a3)
{
  v21 = 0;
  uint64_t v22 = 0;
  LogHandle = EAPLogGetLogHandle();
  if (!a3)
  {
    uint64_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, (os_log_type_t)v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, (os_log_type_t)v12, "received EAP configuration from Factory OTA Client", buf, 2u);
    }
    if (a2)
    {
      CFTypeID v13 = CFGetTypeID(objc_msgSend(objc_msgSend(a2, "tlsCertificateChain", v21, v22), "firstObject"));
      if (v13 == SecCertificateGetTypeID())
      {
        CFTypeID v14 = CFGetTypeID([a2 tlsKey]);
        if (v14 == SecKeyGetTypeID())
        {
          objc_msgSend(objc_msgSend(a2, "tlsCertificateChain", 0), "firstObject");
          [a2 tlsKey];
          uint64_t v22 = SecIdentityCreate();
          if ((unint64_t)objc_msgSend(objc_msgSend(a2, "tlsCertificateChain"), "count") >= 2)
          {
            MutableCopy = CFArrayCreateMutableCopy(0, (CFIndex)objc_msgSend(objc_msgSend(a2, "tlsCertificateChain"), "count"), (CFArrayRef)objc_msgSend(a2, "tlsCertificateChain"));
            CFArrayRemoveValueAtIndex(MutableCopy, 0);
            int v16 = 0;
            v21 = MutableCopy;
            goto LABEL_19;
          }
          goto LABEL_11;
        }
        v17 = EAPLogGetLogHandle();
        os_log_type_t v18 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v17, v18)) {
          goto LABEL_18;
        }
        *(_WORD *)buf = 0;
        v8 = "received invalid client private key from Factory OTA Client";
      }
      else
      {
        v17 = EAPLogGetLogHandle();
        os_log_type_t v18 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v17, v18)) {
          goto LABEL_18;
        }
        *(_WORD *)buf = 0;
        v8 = "received invalid client certificate from Factory OTA Client";
      }
      v9 = v17;
      os_log_type_t v10 = v18;
      uint32_t v11 = 2;
      goto LABEL_17;
    }
LABEL_11:
    int v16 = 0;
    goto LABEL_19;
  }
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v7))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = a3;
    v8 = "failed to fetch EAP configuration from Factory OTA Client, error: %@";
    v9 = LogHandle;
    os_log_type_t v10 = v7;
    uint32_t v11 = 12;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
  }
LABEL_18:
  int v16 = 1;
LABEL_19:
  v19 = *(void (**)(void, __CFArray **))(a1 + 32);
  if (v19)
  {
    if (v16) {
      v20 = 0;
    }
    else {
      v20 = &v21;
    }
    v19(*(void *)(a1 + 40), v20);
    if ((v16 & 1) == 0)
    {
      my_CFRelease();
      my_CFRelease();
    }
  }
}

id sub_100002BE4()
{
  if (qword_100018898 != -1) {
    dispatch_once(&qword_100018898, &stru_100014818);
  }
  id v1 = [(id)qword_1000188A0 isInFactoryMode];
  return v1;
}

void sub_100002C4C(id a1)
{
  qword_1000188A0 = (uint64_t)objc_alloc_init((Class)FactoryOTAEAPClient);
}

void sub_100002F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100002F58(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) callback];
  if (result)
  {
    v5 = (uint64_t (*)(id, uint64_t, void))[*(id *)(a1 + 32) callback];
    id v3 = [*(id *)(a1 + 32) callbackContext];
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    return (id)v5(v3, v4, 0);
  }
  return result;
}

void sub_10000357C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000035A0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) callback];
  if (result)
  {
    v5 = (uint64_t (*)(id, void, uint64_t))[*(id *)(a1 + 32) callback];
    id v3 = [*(id *)(a1 + 32) callbackContext];
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    return (id)v5(v3, 0, v4);
  }
  return result;
}

id sub_10000361C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) callback];
  if (result)
  {
    v5 = (uint64_t (*)(id, uint64_t, void))[*(id *)(a1 + 32) callback];
    id v3 = [*(id *)(a1 + 32) callbackContext];
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    return (id)v5(v3, v4, 0);
  }
  return result;
}

id sub_1000037E4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) callback];
  if (result)
  {
    v5 = (uint64_t (*)(id, uint64_t, void))[*(id *)(a1 + 32) callback];
    id v3 = [*(id *)(a1 + 32) callbackContext];
    uint64_t v4 = *(void *)(a1 + 40);
    return (id)v5(v3, v4, 0);
  }
  return result;
}

AppSSOProviderCredentialSource *sub_100003924(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a3;
  uint32_t v11 = [[AppSSOProviderCredentialSource alloc] initWithProviderURLString:a1 ssid:a2 queue:v9 callback:a4 context:a5];
  uint64_t v12 = v11;
  if (v11)
  {
    [(AppSSOProviderCredentialSource *)v11 startAuthorization];
    CFTypeID v13 = v12;
  }
  else
  {
    CFTypeID v14 = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      v17[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "failed to initialize AppSSOProviderCredentialSource", (uint8_t *)v17, 2u);
    }
  }

  return v12;
}

void sub_100003A1C(void *a1)
{
  [a1 invalidate];
}

uint64_t sub_100003A64()
{
  uint64_t v0 = 0;
  while (1)
  {
    uint64_t v1 = EAPClientModuleAddBuiltinModule();
    if (v1) {
      break;
    }
    v0 += 16;
    if (v0 == 160) {
      return v1;
    }
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v3))
  {
    uint64_t v4 = *(uint64_t *)((char *)&off_100014888 + v0 + 8);
    int v6 = 136315394;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = v1;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "EAPClientAddBuiltinModule(%s) failed %d", (uint8_t *)&v6, 0x12u);
  }
  return v1;
}

void start(int a1, char *const *a2)
{
  long long theDict = 0uLL;
  uint64_t v65 = 0;
  int v64 = -1;
  *(void *)v63 = 0;
  int v4 = getopt(a1, a2, "c:g:i:lu:") << 24;
  if (v4 == -16777216) {
    goto LABEL_2;
  }
  v57 = 0;
  int v5 = 0;
  int v6 = 0;
  int v7 = 0;
  gid_t v8 = -1;
  uid_t v9 = -1;
  do
  {
    HIDWORD(v10) = (v4 >> 24) - 99;
    LODWORD(v10) = HIDWORD(v10);
    switch((v10 >> 1))
    {
      case 0u:
        v57 = optarg;
        break;
      case 2u:
        if (v5) {
          goto LABEL_2;
        }
        gid_t v8 = strtoul(optarg, 0, 0);
        int v5 = 1;
        break;
      case 3u:
        if (v6) {
          goto LABEL_2;
        }
        int v6 = optarg;
        break;
      case 9u:
        if (v7) {
          goto LABEL_2;
        }
        uid_t v9 = strtoul(optarg, 0, 0);
        int v7 = 1;
        break;
      default:
        goto LABEL_2;
    }
    int v4 = getopt(a1, a2, "c:g:i:lu:") << 24;
  }
  while (v4 != -16777216);
  if (optind != a1 || v6 == 0)
  {
LABEL_2:
    fprintf(__stderrp, "usage:\n%s -i <if_name> [ -u <uid> ] [ -g <gid> ]\n", *(const char **)a2);
    exit(64);
  }
  if (v9 == -1) {
    uid_t v9 = getuid();
  }
  if (v8 == -1) {
    gid_t v8 = getgid();
  }
  EAPLogInit();
  int v12 = EAPOLClientEstablishSession();
  if (((v5 | v7) & 1) != 0 && !getuid())
  {
    if ((v5 & 1) != 0 && setgid(v8) < 0)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v14)) {
        goto LABEL_32;
      }
      os_log_type_t v15 = __error();
      int v16 = strerror(*v15);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v60 = v8;
      *(_WORD *)&v60[4] = 2080;
      *(void *)&v60[6] = v16;
      v17 = "setgid(%d) failed, %s";
      goto LABEL_31;
    }
    if ((v7 & 1) != 0 && setuid(v9) < 0)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v14)) {
        goto LABEL_32;
      }
      os_log_type_t v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v60 = v9;
      *(_WORD *)&v60[4] = 2080;
      *(void *)&v60[6] = v19;
      v17 = "setuid(%d) failed, %s";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v14, v17, buf, 0x12u);
LABEL_32:
      sub_100004394(77);
    }
  }
  if (v12)
  {
    execv(*(const char **)a2, a2);
    v29 = EAPLogGetLogHandle();
    os_log_type_t v30 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v29, v30)) {
      goto LABEL_48;
    }
    v31 = __error();
    v32 = strerror(*v31);
    *(_DWORD *)buf = 136315138;
    *(void *)v60 = v32;
    v33 = "exec failed, %s";
    v34 = v29;
    os_log_type_t v35 = v30;
    uint32_t v36 = 12;
    goto LABEL_47;
  }
  CFRunLoopGetCurrent();
  v20 = (const __SCPreferences *)EAPOLControlPrefsInit();
  int v21 = sub_100004418(v20, 0);
  uint64_t v22 = EAPLogGetLogHandle();
  os_log_type_t v23 = _SC_syslog_os_log_mapping();
  BOOL v24 = os_log_type_enabled(v22, v23);
  if (v21)
  {
    if (v24)
    {
      *(_DWORD *)buf = 136315650;
      *(void *)v60 = v6;
      *(_WORD *)&v60[8] = 1024;
      *(_DWORD *)&v60[10] = v9;
      __int16 v61 = 1024;
      gid_t v62 = v8;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s START uid %d gid %d", buf, 0x18u);
    }
    v37 = EAPLogGetLogHandle();
    os_log_type_t v38 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v37, v38))
    {
LABEL_44:
      uint64_t v65 = LinkAddresses_create();
      if (!v65)
      {
        v39 = EAPLogGetLogHandle();
        os_log_type_t v40 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v39, v40)) {
          goto LABEL_48;
        }
        *(_WORD *)buf = 0;
        v33 = "Could not build interface list";
        v34 = v39;
        os_log_type_t v35 = v40;
        uint32_t v36 = 2;
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v34, v35, v33, buf, v36);
LABEL_48:
        exit(71);
      }
      uint64_t v41 = LinkAddresses_lookup();
      if (!v41)
      {
        v42 = EAPLogGetLogHandle();
        os_log_type_t v43 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v42, v43)) {
          goto LABEL_60;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v60 = v6;
        v44 = "interface '%s' does not exist";
        goto LABEL_59;
      }
      if (*(unsigned char *)(v41 + 4) != 6)
      {
        v42 = EAPLogGetLogHandle();
        os_log_type_t v43 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v42, v43)) {
          goto LABEL_60;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v60 = v6;
        v44 = "interface '%s' is not ethernet";
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v42, v43, v44, buf, 0xCu);
LABEL_60:
        exit(78);
      }
      *(void *)v63 = sub_10000C7F4(v6, v41 + *(unsigned __int8 *)(v41 + 5) + 8, &theDict);
      if (!*(void *)v63)
      {
        v45 = EAPLogGetLogHandle();
        os_log_type_t v46 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v45, v46))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v60 = v6;
          _os_log_impl((void *)&_mh_execute_header, v45, v46, "EAPOLSocketSourceCreate(%s) failed", buf, 0xCu);
        }
        goto LABEL_56;
      }
      if (v57)
      {
        if ((void)theDict)
        {
          fprintf(__stderrp, "Ignoring -c %s\n", v57);
        }
        else
        {
          v47 = (const void *)my_CFPropertyListCreateFromFile();
          *((void *)&theDict + 1) = v47;
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (!v47 || CFGetTypeID(v47) != TypeID)
          {
            fprintf(__stderrp, "contents of file %s invalid\n", v57);
            my_CFRelease();
            sub_100004394(78);
          }
        }
      }
      if (theDict == 0)
      {
        v49 = EAPLogGetLogHandle();
        os_log_type_t v50 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v60 = v6;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "%s: config/control dictionary missing", buf, 0xCu);
        }
      }
      else if (!sub_100003A64())
      {
        uint64_t v51 = sub_10000DA2C(*(uint64_t *)v63, (CFDictionaryRef)theDict, &v64);
        if (v51)
        {
          v54 = (void *)v51;
          if (!(void)theDict)
          {
            char v58 = 0;
            sub_1000048E8(v51, *((const __CFDictionary **)&theDict + 1), &v58);
            v55 = EAPLogGetLogHandle();
            os_log_type_t v56 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v55, v56))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v55, v56, "Supplicant_update_configuration says we should stop - exiting", buf, 2u);
            }
            exit(69);
          }
          setsid();
          chdir("/");
          my_CFRelease();
          my_CFRelease();
          sub_10000673C(v54, v64);
          LinkAddresses_free();
          CFRunLoopRun();
          sub_100004394(0);
        }
        v52 = EAPLogGetLogHandle();
        os_log_type_t v53 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v52, v53))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, v53, "EAPOLSocketSourceCreateSupplicant failed", buf, 2u);
        }
        sub_10000D960((uint64_t *)v63);
LABEL_56:
        sub_100004394(69);
      }
      sub_100004394(70);
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v60 = v21;
    v25 = "Verbose mode enabled (LogFlags 0x%x)";
    v26 = v37;
    os_log_type_t v27 = v38;
    uint32_t v28 = 8;
  }
  else
  {
    if (!v24) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)v60 = v6;
    *(_WORD *)&v60[8] = 1024;
    *(_DWORD *)&v60[10] = v9;
    __int16 v61 = 1024;
    gid_t v62 = v8;
    v25 = "%s START uid %d gid %d";
    v26 = v22;
    os_log_type_t v27 = v23;
    uint32_t v28 = 24;
  }
  _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
  goto LABEL_44;
}

void sub_100004394(int a1)
{
  if (sub_10000ED34(1))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "exit", v4, 2u);
    }
  }
  exit(a1);
}

uint64_t sub_100004410(const __SCPreferences *a1)
{
  return sub_100004418(a1, 1);
}

uint64_t sub_100004418(const __SCPreferences *a1, int a2)
{
  uint64_t LogFlags = EAPOLControlPrefsGetLogFlags();
  sub_10000EC04(LogFlags, a2);
  if (a1)
  {
    sub_10000B400(a1);
    sub_100008DB0(a1);
    EAPOLControlPrefsSynchronize();
  }
  return LogFlags;
}

void sub_100004470(uint64_t a1)
{
  v2 = (uint64_t *)a1;
  sub_100004508(a1);
  sub_10000B90C(*(void *)(a1 + 24));
  sub_10000ABBC(*(void *)(a1 + 16));
  if (sub_10000B8A4(*(void *)(a1 + 24))) {
    sub_10000BDF0(*(void *)(a1 + 24));
  }
  if (*(_DWORD *)a1 == 4)
  {
    *(_DWORD *)a1 = 6;
    *(_DWORD *)(a1 + 488) = 0;
    sub_100004508(a1);
    sub_10000B914(*(void *)(a1 + 24), 2, 0, 0);
    sub_100008E8C((unsigned int *)a1);
  }
  sub_100004578(&v2);
}

uint64_t sub_100004508(uint64_t a1)
{
  if (*(void *)(a1 + 280))
  {
    EAPClientModulePluginFree();
    *(void *)(a1 + 280) = 0;
    my_CFRelease();
    *(void *)(a1 + 432) = 0;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
  }
  my_CFRelease();
  uint64_t result = my_CFRelease();
  *(_DWORD *)(a1 + 456) = 0;
  *(void *)(a1 + 464) = 0;
  return result;
}

void sub_100004578(uint64_t **a1)
{
  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      sub_10000AB80(v2 + 2);
      my_CFRelease();
      my_CFRelease();
      my_CFRelease();
      my_CFRelease();
      my_CFRelease();
      my_CFRelease();
      my_CFRelease();
      os_log_type_t v3 = (CFTypeRef *)v2[12];
      if (v3)
      {
        CFRelease(v3[1]);
        CFRelease(*v3);
        free(v3);
      }
      v2[12] = 0;
      my_CFRelease();
      my_CFRelease();
      my_CFRelease();
      int v4 = (void *)v2[16];
      if (v4) {
        free(v4);
      }
      int v5 = (void *)v2[18];
      if (v5) {
        free(v5);
      }
      int v6 = (void *)v2[20];
      if (v6) {
        free(v6);
      }
      my_CFRelease();
      sub_100008944((uint64_t)(v2 + 24));
      sub_100008978((uint64_t)v2);
      sub_100004508((uint64_t)v2);
      free(v2);
    }
    *a1 = 0;
  }
}

void sub_100004680(void **a1)
{
  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      my_CFRelease();
      my_CFRelease();
      my_CFRelease();
      free(v2);
    }
    *a1 = 0;
  }
}

CFTypeID sub_1000046D4(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, @"EAPClientConfiguration");
  CFTypeID result = CFDictionaryGetTypeID();
  if (Value)
  {
    CFTypeID v4 = result;
    CFTypeID result = CFGetTypeID(Value);
    if (result == v4)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)Value);
      CFDictionaryRemoveValue(MutableCopy, @"ExtensibleSSOProvider");
      CFDictionarySetValue(a1, @"EAPClientConfiguration", MutableCopy);
      return my_CFRelease();
    }
  }
  return result;
}

BOOL sub_100004770(uint64_t a1, const void **a2)
{
  int v12 = a2;
  if (a2 && *((unsigned char *)a2 + 16))
  {
    Mutable = *(__CFDictionary **)(a1 + 64);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(a1 + 64) = Mutable;
    }
    if (*a2)
    {
      CFDictionarySetValue(Mutable, @"UserName", *a2);
      *(unsigned char *)(a1 + 175) = 0;
    }
    int v5 = a2[1];
    if (v5)
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), @"UserPassword", v5);
      *(unsigned char *)(a1 + 174) = 0;
    }
    int v6 = a2[3];
    CFTypeID TypeID = CFDataGetTypeID();
    if (v6)
    {
      if (CFGetTypeID(v6) == TypeID)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), @"TLSIdentityHandle", a2[3]);
        *(unsigned char *)(a1 + 176) = 0;
      }
    }
    *(unsigned char *)(a1 + 177) = *((unsigned char *)a2 + 17);
    sub_100004680((void **)&v12);
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
    sub_1000046D4(MutableCopy);
    sub_1000048E8(a1, MutableCopy, 0);
    my_CFRelease();
    sub_1000061B4(a1);
    return 1;
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(LogHandle, v10);
    if (result)
    {
      LOWORD(MutableCopy) = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v10, "invalid/unauthorized appsso provider response", (uint8_t *)&MutableCopy, 2u);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000048E8(uint64_t a1, const __CFDictionary *a2, unsigned char *a3)
{
  if (a3) {
    *a3 = 0;
  }
  my_CFRelease();
  Value = CFDictionaryGetValue(a2, @"ManagerName");
  CFTypeID TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID) {
    *(void *)(a1 + 240) = CFRetain(Value);
  }
  gid_t v8 = CFDictionaryGetValue(a2, @"ClientItemID");
  if (!v8)
  {
    my_CFRelease();
    my_CFRelease();
    v20 = CFDictionaryGetValue(a2, @"EAPClientConfiguration");
    CFTypeID v21 = CFDictionaryGetTypeID();
    if (v20)
    {
      if (CFGetTypeID(v20) == v21) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    if (v22) {
      Defaultuint64_t AuthenticationProperties = (const __CFDictionary *)v20;
    }
    else {
      Defaultuint64_t AuthenticationProperties = a2;
    }
    ID = CFDictionaryGetValue(a2, @"UniqueIdentifier");
    v26 = 0;
    uint64_t v14 = 0;
    goto LABEL_27;
  }
  uid_t v9 = v8;
  CFTypeID v10 = CFDictionaryGetTypeID();
  if (CFGetTypeID(v9) != v10)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24)) {
      goto LABEL_176;
    }
    *(_WORD *)v203 = 0;
    v25 = "invalid item dict";
    goto LABEL_175;
  }
  my_CFRelease();
  my_CFRelease();
  uint64_t v11 = EAPOLClientConfigurationCreateWithAuthorization();
  if (!v11)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24)) {
      goto LABEL_176;
    }
    *(_WORD *)v203 = 0;
    v25 = "couldn't create configuration";
    goto LABEL_175;
  }
  uint64_t v12 = v11;
  uint64_t v13 = EAPOLClientItemIDCreateWithDictionary();
  *(void *)(a1 + 224) = v13;
  *(void *)(a1 + 232) = v12;
  if (!v13)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24)) {
      goto LABEL_176;
    }
    *(_WORD *)v203 = 0;
    v25 = "couldn't instantiate item";
    goto LABEL_175;
  }
  uint64_t v14 = EAPOLClientItemIDGetProfile();
  if (!v14)
  {
    Defaultuint64_t AuthenticationProperties = (const __CFDictionary *)EAPOLClientConfigurationGetDefaultAuthenticationProperties();
    ID = 0;
    goto LABEL_144;
  }
  uint64_t AuthenticationProperties = EAPOLClientProfileGetAuthenticationProperties();
  if (!AuthenticationProperties)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24)) {
      goto LABEL_176;
    }
    *(_WORD *)v203 = 0;
    v25 = "profile has no authentication properties";
LABEL_175:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v24, v25, v203, 2u);
LABEL_176:
    uint64_t v102 = 0;
    if (a3) {
      *a3 = 1;
    }
    return v102;
  }
  Defaultuint64_t AuthenticationProperties = (const __CFDictionary *)AuthenticationProperties;
  ID = (const void *)EAPOLClientProfileGetID();
  uint64_t v204 = 0;
  memset(v203, 0, sizeof(v203));
  if (!*(void *)(a1 + 248))
  {
    out_token[0] = 0;
    notify_port[0] = 0;
    if (notify_register_mach_port(kEAPOLClientConfigurationChangedNotifyKey, notify_port, 0, out_token))
    {
      os_log_type_t v18 = EAPLogGetLogHandle();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v18, v19))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "notify_register_mach_port() failed", buf, 2u);
      }
      goto LABEL_144;
    }
    *(void *)&v203[8] = a1;
    v151 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
    if (v151)
    {
      v152 = v151;
      CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0, v151, 0);
      if (RunLoopSource)
      {
        v154 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v154, kCFRunLoopDefaultMode);
        CFRelease(v154);
        *(void *)(a1 + 248) = v152;
        *(_DWORD *)(a1 + 256) = out_token[0];
        goto LABEL_144;
      }
      v196 = EAPLogGetLogHandle();
      os_log_type_t v197 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v196, v197))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v196, v197, "CFMachPortCreateRunLoopSource() failed", buf, 2u);
      }
      CFRelease(v152);
    }
    notify_cancel(out_token[0]);
  }
LABEL_144:
  v26 = CFDictionaryGetValue(a2, @"EAPClientConfiguration");
  CFTypeID v108 = CFDictionaryGetTypeID();
  if (v26 && CFGetTypeID(v26) != v108) {
    v26 = 0;
  }
LABEL_27:
  my_CFRelease();
  *(void *)(a1 + 40) = CFDictionaryCreateCopy(0, a2);
  if (!*(void *)(a1 + 96))
  {
    *(unsigned char *)(a1 + 500) = sub_10000B0DC();
    os_log_type_t v27 = EAPLogGetLogHandle();
    os_log_type_t v28 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v27, v28))
    {
      if (*(unsigned char *)(a1 + 500)) {
        v29 = "is";
      }
      else {
        v29 = "is not";
      }
      *(_DWORD *)v203 = 136315138;
      *(void *)&v203[4] = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "in-box auth %s requested", v203, 0xCu);
    }
  }
  *(unsigned char *)(a1 + 501) = sub_100002BE4();
  os_log_type_t v30 = EAPLogGetLogHandle();
  os_log_type_t v31 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v30, v31))
  {
    if (*(unsigned char *)(a1 + 501)) {
      v32 = "is";
    }
    else {
      v32 = "is not";
    }
    *(_DWORD *)v203 = 136315138;
    *(void *)&v203[4] = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "factory ota auth %s requested", v203, 0xCu);
  }
  if (DefaultAuthenticationProperties
    && CFDictionaryContainsKey(DefaultAuthenticationProperties, @"ExtensibleSSOProvider")
    && (v33 = CFDictionaryGetValue(DefaultAuthenticationProperties, @"ExtensibleSSOProvider"),
        CFTypeID v34 = CFStringGetTypeID(),
        v33))
  {
    CFTypeID v35 = v34;
    CFTypeID v36 = CFGetTypeID(v33);
    *(unsigned char *)(a1 + 499) = v36 == v35;
    if (v36 == v35)
    {
      v37 = EAPLogGetLogHandle();
      os_log_type_t v38 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v37, v38))
      {
        *(_WORD *)v203 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "appsso provider auth is requested", v203, 2u);
      }
      v39 = CFDictionaryGetValue(DefaultAuthenticationProperties, @"ExtensibleSSOProvider");
      *(void *)(a1 + 72) = v39;
      CFRetain(v39);
    }
  }
  else
  {
    *(unsigned char *)(a1 + 499) = 0;
  }
  os_log_type_t v40 = CFDictionaryGetValue(DefaultAuthenticationProperties, @"UserName");
  BOOL v41 = sub_100006A78((BOOL)v40);
  v42 = CFDictionaryGetValue(DefaultAuthenticationProperties, @"UserPassword");
  BOOL v43 = sub_100006A78((BOOL)v42);
  v44 = (CFDictionaryRef *)(a1 + 48);
  my_CFRelease();
  if (v41
    || v43
    || *(void *)(a1 + 56)
    || *(void *)(a1 + 64)
    || *(void *)(a1 + 96)
    || v14
    || *(unsigned char *)(a1 + 501)
    || v26
    || CFDictionaryContainsKey(DefaultAuthenticationProperties, @"ProfileID"))
  {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, DefaultAuthenticationProperties);
    os_log_type_t v46 = MutableCopy;
    if (v41) {
      CFDictionaryRemoveValue(MutableCopy, @"UserName");
    }
    if (v43) {
      CFDictionaryRemoveValue(v46, @"UserPassword");
    }
    CFDictionaryRemoveValue(v46, @"ProfileID");
    if (v26) {
      CFDictionaryApplyFunction((CFDictionaryRef)v26, (CFDictionaryApplierFunction)sub_100006AD0, v46);
    }
    if (v14)
    {
      v47 = (const void *)EAPOLClientProfileGetID();
      CFDictionarySetValue(v46, @"ProfileID", v47);
    }
    CFDictionaryRef v48 = *(const __CFDictionary **)(a1 + 56);
    if (v48) {
      CFDictionaryApplyFunction(v48, (CFDictionaryApplierFunction)sub_100006AD0, v46);
    }
    CFDictionaryRef v49 = *(const __CFDictionary **)(a1 + 64);
    if (v49) {
      CFDictionaryApplyFunction(v49, (CFDictionaryApplierFunction)sub_100006AD0, v46);
    }
    os_log_type_t v50 = *(const void ***)(a1 + 96);
    if (v50 && *v50) {
      CFDictionarySetValue(v46, @"TLSClientIdentityTrustChainCertificates", *v50);
    }
    if (*(unsigned char *)(a1 + 501))
    {
      uint64_t v51 = *(const void **)(a1 + 104);
      if (v51) {
        CFDictionarySetValue(v46, @"TLSClientIdentityTrustChainCertificates", v51);
      }
    }
  }
  else
  {
    os_log_type_t v46 = (__CFDictionary *)CFRetain(DefaultAuthenticationProperties);
  }
  CFDictionaryRef *v44 = v46;
  if (sub_10000ED34(2))
  {
    CFDictionaryRef v52 = *v44;
    unint64_t v53 = (unint64_t)CFDictionaryGetValue(*v44, @"UserPassword");
    unint64_t v54 = (unint64_t)CFDictionaryGetValue(v52, @"NewPassword");
    if (v53 | v54)
    {
      unint64_t v55 = v54;
      os_log_type_t v56 = CFDictionaryCreateMutableCopy(0, 0, v52);
      v57 = v56;
      if (v53) {
        CFDictionarySetValue(v56, @"UserPassword", @"XXXXXXXX");
      }
      if (v55) {
        CFDictionarySetValue(v57, @"NewPassword", @"XXXXXXXX");
      }
      char v58 = (const void *)my_CFPropertyListCopyAsXMLString();
      v59 = v57;
    }
    else
    {
      gid_t v62 = CFDictionaryGetValue(v52, @"TLSClientIdentityTrustChainCertificates");
      CFTypeID v63 = CFArrayGetTypeID();
      if (!v62 || CFGetTypeID(v62) != v63 || !CFArrayGetCount((CFArrayRef)v62)) {
        goto LABEL_90;
      }
      CFIndex Count = CFArrayGetCount((CFArrayRef)v62);
      Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      if (Count >= 1)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex((CFArrayRef)v62, i);
          CFDataRef v68 = SecCertificateCopyData(ValueAtIndex);
          CFArrayAppendValue(Mutable, v68);
          CFRelease(v68);
        }
      }
      if (!Mutable)
      {
LABEL_90:
        char v58 = (const void *)my_CFPropertyListCopyAsXMLString();
        if (!v58) {
          goto LABEL_94;
        }
        goto LABEL_91;
      }
      v69 = CFDictionaryCreateMutableCopy(0, 0, v52);
      CFDictionarySetValue(v69, @"TLSClientIdentityTrustChainCertificates", Mutable);
      char v58 = (const void *)my_CFPropertyListCopyAsXMLString();
      CFRelease(v69);
      v59 = Mutable;
    }
    CFRelease(v59);
    if (!v58) {
      goto LABEL_94;
    }
LABEL_91:
    v70 = EAPLogGetLogHandle();
    os_log_type_t v71 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v70, v71))
    {
      *(_DWORD *)v203 = 138412290;
      *(void *)&v203[4] = v58;
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "update_configuration\n%@", v203, 0xCu);
    }
    CFRelease(v58);
    goto LABEL_94;
  }
  v60 = EAPLogGetLogHandle();
  os_log_type_t v61 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v60, v61))
  {
    *(_WORD *)v203 = 0;
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "update_configuration", v203, 2u);
  }
LABEL_94:
  ++*(_DWORD *)(a1 + 32);
  my_CFRelease();
  if (ID)
  {
    CFTypeID v72 = CFStringGetTypeID();
    if (CFGetTypeID(ID) == v72) {
      *(void *)(a1 + 88) = CFRetain(ID);
    }
  }
  *(void *)buf = 0;
  if (!*v44)
  {
    CFArrayGetTypeID();
LABEL_130:
    sub_100008944(a1 + 192);
    uint64_t v102 = 1;
    goto LABEL_131;
  }
  v73 = CFDictionaryGetValue(*v44, @"AcceptEAPTypes");
  CFTypeID v74 = CFArrayGetTypeID();
  if (!v73 || CFGetTypeID(v73) != v74) {
    goto LABEL_130;
  }
  v199 = (_DWORD **)(a1 + 192);
  sub_100008944(a1 + 192);
  CFIndex v75 = CFArrayGetCount((CFArrayRef)v73);
  if (!v75) {
    goto LABEL_152;
  }
  uint64_t v76 = v75;
  notify_port[0] = 0;
  v77 = malloc_type_malloc(4 * v75, 0x100004052888210uLL);
  if (v76 < 1) {
    goto LABEL_151;
  }
  CFIndex v78 = 0;
  int v79 = 0;
  int v80 = 0;
  v198 = v73;
  do
  {
    v81 = CFArrayGetValueAtIndex((CFArrayRef)v73, v78);
    CFTypeID v82 = CFNumberGetTypeID();
    if (!v81 || CFGetTypeID(v81) != v82)
    {
      v92 = EAPLogGetLogHandle();
      os_log_type_t v93 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v92, v93)) {
        goto LABEL_123;
      }
      *(_DWORD *)v203 = 67109120;
      *(_DWORD *)&v203[4] = v78;
      v94 = v92;
      os_log_type_t v95 = v93;
      v96 = "AcceptEAPTypes[%d] contains invalid type, ignoring";
      goto LABEL_121;
    }
    if (CFNumberGetValue((CFNumberRef)v81, kCFNumberIntType, notify_port))
    {
      if (EAPClientModuleLookup())
      {
        int v83 = v80;
        if (v80 >= 1)
        {
          uint64_t v84 = 0;
          do
          {
            if (v77[v84] == notify_port[0])
            {
              v85 = EAPLogGetLogHandle();
              os_log_type_t v86 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v85, v86))
              {
                uint64_t v87 = EAPTypeStr();
                *(_DWORD *)v203 = 67109890;
                *(_DWORD *)&v203[4] = v78;
                *(_WORD *)&v203[8] = 2080;
                *(void *)&v203[10] = v87;
                *(_WORD *)&v203[18] = 1024;
                *(_DWORD *)&v203[20] = notify_port[0];
                *(_WORD *)&v203[24] = 1024;
                *(_DWORD *)&v203[26] = v84;
                _os_log_impl((void *)&_mh_execute_header, v85, v86, "AcceptEAPTypes[%d] %s (%d) already specified at [%d], ignoring", v203, 0x1Eu);
              }
            }
            ++v84;
          }
          while (v83 != v84);
        }
        mach_port_t v88 = notify_port[0];
        v77[v83] = notify_port[0];
        int v80 = v83 + 1;
        BOOL v89 = v88 > 0x2B;
        uint64_t v90 = (1 << v88) & 0x80002200000;
        if (!v89 && v90 != 0) {
          ++v79;
        }
        v73 = v198;
      }
      else
      {
        v100 = EAPLogGetLogHandle();
        os_log_type_t v101 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v100, v101))
        {
          *(_DWORD *)v203 = 67109376;
          *(_DWORD *)&v203[4] = v78;
          *(_WORD *)&v203[8] = 1024;
          *(_DWORD *)&v203[10] = notify_port[0];
          v94 = v100;
          os_log_type_t v95 = v101;
          v96 = "AcceptEAPTypes[%d] specifies unsupported type %d, ignoring";
          uint32_t v97 = 14;
          goto LABEL_122;
        }
      }
    }
    else
    {
      v98 = EAPLogGetLogHandle();
      os_log_type_t v99 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v98, v99))
      {
        *(_DWORD *)v203 = 67109120;
        *(_DWORD *)&v203[4] = v78;
        v94 = v98;
        os_log_type_t v95 = v99;
        v96 = "AcceptEAPTypes[%d] contains invalid number, ignoring";
LABEL_121:
        uint32_t v97 = 8;
LABEL_122:
        _os_log_impl((void *)&_mh_execute_header, v94, v95, v96, v203, v97);
      }
    }
LABEL_123:
    ++v78;
  }
  while (v78 != v76);
  v44 = (CFDictionaryRef *)(a1 + 48);
  if (!v80)
  {
LABEL_151:
    free(v77);
    goto LABEL_152;
  }
  *(void *)(a1 + 192) = v77;
  *(_DWORD *)(a1 + 200) = v80;
  if (v79 == v80) {
    *(unsigned char *)(a1 + 208) = 1;
  }
LABEL_152:
  CFArrayRef v109 = (const __CFArray *)CFDictionaryGetValue(*v44, @"InnerAcceptEAPTypes");
  CFTypeID v110 = CFArrayGetTypeID();
  if (v109)
  {
    if (CFGetTypeID(v109) == v110) {
      CFArrayRef v111 = v109;
    }
    else {
      CFArrayRef v111 = 0;
    }
  }
  else
  {
    CFArrayRef v111 = 0;
  }
  if (sub_10000C5CC(*(void *)(a1 + 24)) == 1) {
    *(unsigned char *)(a1 + 173) = sub_100009C74(*(const __CFDictionary **)(a1 + 48), @"OneTimeUserPassword", 0);
  }
  if (!*(unsigned char *)(a1 + 175)
    && (v116 = CFDictionaryGetValue(*v44, @"UserName"), CFTypeID v117 = CFStringGetTypeID(), v116)
    && CFGetTypeID(v116) == v117)
  {
    v112 = (const char *)my_CFStringToCString();
  }
  else
  {
    v112 = 0;
  }
  if (*(unsigned char *)(a1 + 174))
  {
LABEL_162:
    v113 = 0;
  }
  else
  {
    v118 = CFDictionaryGetValue(*v44, @"UserPassword");
    v119 = CFDictionaryGetValue(*v44, @"UserPasswordKeychainItemID");
    CFTypeID v120 = CFStringGetTypeID();
    if (v118 && CFGetTypeID(v118) == v120)
    {
      v113 = (const char *)my_CFStringToCString();
    }
    else
    {
      CFTypeID v123 = CFStringGetTypeID();
      if (v119 && CFGetTypeID(v119) == v123)
      {
        *(void *)out_token = 0;
        *(void *)notify_port = 0;
        int v124 = EAPSecKeychainPasswordItemCopy();
        if (v124)
        {
          int v125 = v124;
          v126 = EAPLogGetLogHandle();
          os_log_type_t v127 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v126, v127))
          {
            *(_DWORD *)v203 = 134217984;
            *(void *)&v203[4] = v125;
            _os_log_impl((void *)&_mh_execute_header, v126, v127, "SecKeychainFindGenericPassword failed, %ld", v203, 0xCu);
          }
          v113 = 0;
        }
        else
        {
          v113 = (const char *)sub_100009CD8(*(const __CFData **)out_token);
        }
        my_CFRelease();
        my_CFRelease();
        if (!v113)
        {
          v193 = EAPLogGetLogHandle();
          os_log_type_t v194 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v193, v194))
          {
            uint64_t v195 = sub_10000B88C(*(void *)(a1 + 24), 0);
            *(_DWORD *)v203 = 136315138;
            *(void *)&v203[4] = v195;
            _os_log_impl((void *)&_mh_execute_header, v193, v194, "%s: failed to retrieve password from keychain", v203, 0xCu);
          }
          goto LABEL_162;
        }
      }
      else
      {
        if (v112) {
          goto LABEL_162;
        }
        if (!*(void *)(a1 + 224)
          || (*(void *)notify_port = 0, *(void *)v203 = 0, !EAPOLClientItemIDCopyPasswordItem()))
        {
          v112 = 0;
          goto LABEL_162;
        }
        if (*(void *)notify_port) {
          v113 = (const char *)sub_100009CD8(*(const __CFData **)notify_port);
        }
        else {
          v113 = 0;
        }
        if (*(void *)v203) {
          v112 = (const char *)sub_100009CD8(*(const __CFData **)v203);
        }
        else {
          v112 = 0;
        }
        my_CFRelease();
        my_CFRelease();
      }
    }
  }
  if (*(unsigned char *)(a1 + 176))
  {
    BOOL v114 = 0;
    BOOL v115 = 0;
  }
  else
  {
    if (sub_100009D40((const __CFArray *)v73)) {
      int v121 = 1;
    }
    else {
      int v121 = sub_100009D40(v111);
    }
    BOOL v115 = sub_100009C74(*v44, @"TLSCertificateIsRequired", v121);
    if (v121)
    {
      CFDictionaryRef v128 = *v44;
      if (*v44)
      {
        v129 = CFDictionaryGetValue(v128, @"TLSMinimumVersion");
        CFTypeID v130 = CFStringGetTypeID();
        if (v129 && CFGetTypeID(v129) == v130) {
          LODWORD(v128) = CFEqual(v129, @"1.3");
        }
        else {
          LODWORD(v128) = 0;
        }
      }
      BOOL v114 = v128 != 0;
    }
    else
    {
      BOOL v114 = 0;
    }
  }
  v131 = EAPLogGetLogHandle();
  os_log_type_t v132 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v131, v132))
  {
    v133 = "is not";
    if (v114) {
      v133 = "is";
    }
    *(_DWORD *)v203 = 136315138;
    *(void *)&v203[4] = v133;
    _os_log_impl((void *)&_mh_execute_header, v131, v132, "EAP identity privacy %s required", v203, 0xCu);
  }
  if (!v115)
  {
LABEL_227:
    BOOL v144 = 0;
    goto LABEL_243;
  }
  if (CFDictionaryGetValue(*v44, @"TLSIdentityHandle"))
  {
    int SecIdentity = EAPSecIdentityHandleCreateSecIdentity();
    if (SecIdentity)
    {
      int v135 = SecIdentity;
      v136 = EAPLogGetLogHandle();
      os_log_type_t v137 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v136, v137))
      {
        *(_DWORD *)v203 = 134217984;
        *(void *)&v203[4] = v135;
        _os_log_impl((void *)&_mh_execute_header, v136, v137, "EAPSecIdentityHandleCreateSecIdentity failed, %ld", v203, 0xCu);
      }
    }
  }
  if (!*(void *)buf && *(void *)(a1 + 224)) {
    *(void *)buf = EAPOLClientItemIDCopyIdentity();
  }
  if (*(unsigned char *)(a1 + 500))
  {
    uint64_t v138 = *(void *)(a1 + 96);
    if (v138)
    {
      v139 = *(const void **)(v138 + 8);
      if (v139) {
        *(void *)buf = CFRetain(v139);
      }
    }
  }
  if (*(unsigned char *)(a1 + 501))
  {
    v140 = *(const void **)(a1 + 112);
    if (v140) {
      *(void *)buf = CFRetain(v140);
    }
  }
  my_CFRelease();
  v141 = *(__SecIdentity **)buf;
  *(void *)(a1 + 184) = *(void *)buf;
  if (!v114)
  {
    BOOL v144 = 0;
    if (v112 || !v141) {
      goto LABEL_243;
    }
    *(void *)notify_port = 0;
    OSStatus v145 = SecIdentityCopyCertificate(v141, (SecCertificateRef *)notify_port);
    if (v145)
    {
      OSStatus v146 = v145;
      v147 = EAPLogGetLogHandle();
      os_log_type_t v148 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v147, v148))
      {
        *(_DWORD *)v203 = 134217984;
        *(void *)&v203[4] = v146;
        _os_log_impl((void *)&_mh_execute_header, v147, v148, "EAPSecIdentityHandleCreateSecIdentity failed, %ld", v203, 0xCu);
      }
    }
    else
    {
      v156 = (const void *)EAPSecCertificateCopyUserNameString();
      CFRelease(*(CFTypeRef *)notify_port);
      if (v156)
      {
        v112 = (const char *)my_CFStringToCString();
        CFRelease(v156);
LABEL_242:
        BOOL v144 = v112 != 0;
        goto LABEL_243;
      }
    }
    v112 = 0;
    goto LABEL_242;
  }
  v142 = CFDictionaryGetValue(*v44, @"OuterIdentity");
  CFTypeID v143 = CFStringGetTypeID();
  if (v142 && CFGetTypeID(v142) == v143)
  {
    v112 = (const char *)my_CFStringToCString();
    goto LABEL_227;
  }
  v149 = EAPLogGetLogHandle();
  os_log_type_t v150 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v149, v150))
  {
    *(_DWORD *)v203 = 138412290;
    *(void *)&v203[4] = @"OuterIdentity";
    _os_log_impl((void *)&_mh_execute_header, v149, v150, "%@ is not configured, unable to prompt for EAP Identity", v203, 0xCu);
  }
  BOOL v144 = 0;
  *(unsigned char *)(a1 + 497) = 1;
LABEL_243:
  if ((v113 != 0) != (*(void *)buf != 0))
  {
    uint64_t v157 = *(unsigned int *)(a1 + 200);
    if ((int)v157 >= 2)
    {
      v158 = *v199;
      if (*v199)
      {
        uint64_t v159 = 0;
        while (v158[v159] != 13)
        {
          if (v157 == ++v159) {
            goto LABEL_249;
          }
        }
      }
      else
      {
LABEL_249:
        LODWORD(v159) = -1;
      }
      if (*(void *)buf)
      {
        if (v159 == -1)
        {
          if (!sub_100009C74(*v44, @"TLSCertificateIsRequired", 0))
          {
            v172 = EAPLogGetLogHandle();
            os_log_type_t v173 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v172, v173))
            {
              uint64_t v174 = sub_10000B88C(*(void *)(a1 + 24), 0);
              *(_DWORD *)v203 = 136315138;
              *(void *)&v203[4] = v174;
              v162 = "%s: identity specified but EAP-TLS isn't enabled";
              v163 = v172;
              os_log_type_t v164 = v173;
              uint32_t v165 = 12;
LABEL_268:
              _os_log_impl((void *)&_mh_execute_header, v163, v164, v162, v203, v165);
            }
          }
        }
        else
        {
          *(_DWORD *)(a1 + 200) = 1;
          _DWORD *v158 = 13;
          if (sub_10000ED34(1))
          {
            v160 = EAPLogGetLogHandle();
            os_log_type_t v161 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v160, v161))
            {
              *(_WORD *)v203 = 0;
              v162 = "identity is specified, enabling EAP-TLS only";
              v163 = v160;
              os_log_type_t v164 = v161;
              uint32_t v165 = 2;
              goto LABEL_268;
            }
          }
        }
      }
      else if (v159 != -1)
      {
        if (sub_10000ED34(1))
        {
          v166 = EAPLogGetLogHandle();
          os_log_type_t v167 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v166, v167))
          {
            *(_WORD *)v203 = 0;
            _os_log_impl((void *)&_mh_execute_header, v166, v167, "password is specified, disabling EAP-TLS", v203, 2u);
          }
        }
        if ((v159 & 0x80000000) == 0)
        {
          int v168 = *(_DWORD *)(a1 + 200);
          if (v168 > (int)v159)
          {
            LODWORD(v169) = v168 - 1;
            if (v168 - 1 > (int)v159)
            {
              v170 = *v199;
              uint64_t v171 = v159;
              do
              {
                v170[v171] = v170[v171 + 1];
                uint64_t v169 = *(int *)(a1 + 200) - 1;
                ++v171;
              }
              while (v171 < v169);
            }
            *(_DWORD *)(a1 + 200) = v169;
          }
        }
      }
    }
  }
  if (v112) {
    char v175 = 1;
  }
  else {
    char v175 = v115;
  }
  if ((v175 & 1) == 0)
  {
    if (*(int *)(a1 + 200) < 1) {
      goto LABEL_296;
    }
    uint64_t v178 = 0;
    char v179 = 1;
    while (1)
    {
      if (!EAPClientModuleLookup()) {
        goto LABEL_284;
      }
      *(void *)v203 = EAPClientModulePluginUserName();
      if (*(void *)v203)
      {
        v112 = (const char *)my_CFStringToCString();
        my_CFRelease();
        if (v112)
        {
          BOOL v144 = 1;
          break;
        }
LABEL_296:
        v183 = *(void **)(a1 + 144);
        BOOL v177 = v183 != 0;
        if (v183) {
          free(v183);
        }
        int v182 = 0;
        *(void *)(a1 + 144) = 0;
        goto LABEL_300;
      }
      int v180 = (*v199)[v178];
      if (v180 == 18 || v180 == 23)
      {
        char v179 = 0;
        if (++v178 >= *(int *)(a1 + 200)) {
          goto LABEL_293;
        }
      }
      else
      {
LABEL_284:
        if (++v178 >= *(int *)(a1 + 200))
        {
          if (v179) {
            goto LABEL_296;
          }
LABEL_293:
          *(unsigned char *)(a1 + 497) = 1;
          goto LABEL_296;
        }
      }
    }
  }
  v176 = *(char **)(a1 + 144);
  if (v112 && v176)
  {
    BOOL v177 = strcmp(*(const char **)(a1 + 144), v112) != 0;
    free(v176);
    *(void *)(a1 + 144) = v112;
  }
  else
  {
    BOOL v177 = v176 != v112;
    if (v176) {
      free(*(void **)(a1 + 144));
    }
    *(void *)(a1 + 144) = v112;
    if (!v112)
    {
      int v182 = 0;
      goto LABEL_300;
    }
  }
  int v182 = strlen(v112);
LABEL_300:
  *(_DWORD *)(a1 + 152) = v182;
  *(unsigned char *)(a1 + 172) = v144;
  v184 = *(char **)(a1 + 160);
  if (v113 && v184)
  {
    unsigned int v185 = strcmp(*(const char **)(a1 + 160), v113) || v177;
    goto LABEL_309;
  }
  unsigned int v185 = v184 != v113 || v177;
  if (v184) {
LABEL_309:
  }
    free(v184);
  *(void *)(a1 + 160) = v113;
  if (v113) {
    int v186 = strlen(v113);
  }
  else {
    int v186 = 0;
  }
  *(_DWORD *)(a1 + 168) = v186;
  if (!*(unsigned char *)(a1 + 208)
    || (v187 = CFDictionaryGetValue(*v44, @"OuterIdentity"), CFTypeID v188 = CFStringGetTypeID(), !v187)
    || CFGetTypeID(v187) != v188)
  {
    v192 = *(void **)(a1 + 128);
    if (v192) {
      uint64_t v102 = 1;
    }
    else {
      uint64_t v102 = v185;
    }
    if (v192) {
      free(v192);
    }
    *(void *)(a1 + 128) = 0;
LABEL_328:
    *(_DWORD *)(a1 + 136) = 0;
    goto LABEL_131;
  }
  v189 = (const char *)my_CFStringToCString();
  v190 = v189;
  v191 = *(char **)(a1 + 128);
  if (v189 && v191)
  {
    if (!strcmp(*(const char **)(a1 + 128), v189)) {
      uint64_t v102 = v185;
    }
    else {
      uint64_t v102 = 1;
    }
    free(v191);
    *(void *)(a1 + 128) = v190;
    goto LABEL_335;
  }
  if (v191 == v189) {
    uint64_t v102 = v185;
  }
  else {
    uint64_t v102 = 1;
  }
  if (v191) {
    free(*(void **)(a1 + 128));
  }
  *(void *)(a1 + 128) = v190;
  if (!v190) {
    goto LABEL_328;
  }
LABEL_335:
  *(_DWORD *)(a1 + 136) = strlen(v190);
LABEL_131:
  uint64_t v103 = *(void *)(a1 + 280);
  if (v103) {
    LODWORD(v103) = EAPClientModulePluginEAPType();
  }
  v104 = *(int **)(a1 + 192);
  if (!v104) {
    goto LABEL_140;
  }
  uint64_t v105 = *(unsigned int *)(a1 + 200);
  if ((int)v105 < 1) {
    goto LABEL_140;
  }
  uint64_t v106 = 0xFFFFFFFFLL;
  while (1)
  {
    int v107 = *v104++;
    if (v107 == v103) {
      break;
    }
    --v106;
    if (!--v105) {
      goto LABEL_140;
    }
  }
  if (!v106)
  {
LABEL_140:
    sub_100004508(a1);
    return 1;
  }
  return v102;
}

void sub_1000061B4(uint64_t a1)
{
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v3))
  {
    *(_WORD *)CFTypeID v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "other_source_supplied_credentials", v4, 2u);
  }
  if (*(_DWORD *)a1 == 3)
  {
    if (*(void *)(a1 + 472)) {
      sub_100007500(a1, a1 + 472);
    }
  }
  else if (*(_DWORD *)a1 == 2)
  {
    sub_100006F68(a1, 4, 0);
  }
}

void sub_10000626C(uint64_t a1, __CFError *a2, const void **a3)
{
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v7))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "appsso_provider_callback", v17, 2u);
  }
  if (a2)
  {
    CFStringRef v8 = CFErrorCopyDescription(a2);
    uid_t v9 = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)v17 = 138412290;
      *(void *)&v17[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "failed to fetch credentials from AppSSO provider, error: %@", v17, 0xCu);
    }
    CFRelease(v8);
    if (*(_DWORD *)(a1 + 488) != 20) {
      goto LABEL_15;
    }
LABEL_12:
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
    *(void *)v17 = MutableCopy;
    sub_1000046D4(MutableCopy);
    sub_1000048E8(a1, MutableCopy, 0);
    my_CFRelease();
    goto LABEL_13;
  }
  if (*(_DWORD *)(a1 + 488) != 20)
  {
LABEL_15:
    os_log_type_t v15 = EAPLogGetLogHandle();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)v17 = 136315138;
      *(void *)&v17[4] = "OtherInputRequired";
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "supplicant's last status is not %s", v17, 0xCu);
    }
    return;
  }
  uint64_t v11 = EAPLogGetLogHandle();
  os_log_type_t v12 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v11, v12))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "received credentials from AppSSO provider", v17, 2u);
  }
  if (!sub_100004770(a1, a3)) {
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v14 = *(void **)(a1 + 80);
  if (v14)
  {
    sub_100003A1C(v14);
    *(void *)(a1 + 80) = 0;
  }
}

const char *sub_1000064B4(int a1)
{
  if (a1 > 999)
  {
    switch(a1)
    {
      case 1000:
        return "ErrnoError";
      case 1001:
        return "SecurityError";
      case 1002:
        return "PluginSpecificError";
      default:
        return "<unknown>";
    }
  }
  else
  {
    BOOL result = "OK";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        BOOL result = "Failed";
        break;
      case 2:
        BOOL result = "AllocationFailed";
        break;
      case 3:
        BOOL result = "UserInputRequired";
        break;
      case 4:
        BOOL result = "ConfigurationInvalid";
        break;
      case 5:
        BOOL result = "ProtocolNotSupported";
        break;
      case 6:
        BOOL result = "ServerCertificateNotTrusted";
        break;
      case 7:
        BOOL result = "InnerProtocolNotSupported";
        break;
      case 8:
        BOOL result = "InternalError";
        break;
      case 9:
        BOOL result = "UserCancelledAuthentication";
        break;
      case 10:
        BOOL result = "UnknownRootCertificate";
        break;
      case 11:
        BOOL result = "NoRootCertificate";
        break;
      case 12:
        BOOL result = "CertificateExpired";
        break;
      case 13:
        BOOL result = "CertificateNotYetValid";
        break;
      case 14:
        BOOL result = "CertificateRequiresConfirmation";
        break;
      case 15:
        BOOL result = "UserInputNotPossible";
        break;
      case 16:
        BOOL result = "ResourceUnavailable";
        break;
      case 17:
        BOOL result = "ProtocolError";
        break;
      case 18:
        BOOL result = "AuthenticationStalled";
        break;
      case 20:
        BOOL result = "OtherInputRequired";
        break;
      default:
        return "<unknown>";
    }
  }
  return result;
}

BOOL sub_100006674(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
    CFDictionaryRef v9 = MutableCopy;
    *(void *)(a1 + 96) = a2;
    sub_1000048E8(a1, MutableCopy, 0);
    my_CFRelease();
    sub_1000061B4(a1);
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v6, "received NULL EAP configuration from MIB", v8, 2u);
    }
  }
  return a2 != 0;
}

void sub_10000673C(void *a1, int a2)
{
  int v10 = a2;
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v5))
  {
    uint64_t v6 = sub_10000B88C(a1[3], 0);
    unsigned int v7 = sub_10000C5CC(a1[3]);
    if (v7 > 3) {
      CFStringRef v8 = "<unknown>";
    }
    else {
      CFStringRef v8 = off_100014970[v7];
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v5, "%s: 802.1X %s Mode", buf, 0x16u);
  }
  if (sub_10000C188(a1[3]))
  {
    if (a2 == -1) {
      CFDictionaryRef v9 = 0;
    }
    else {
      CFDictionaryRef v9 = &v10;
    }
    sub_100006874((uint64_t)a1, v9);
  }
  else
  {
    sub_1000069FC(a1, 0);
  }
}

void sub_100006874(uint64_t a1, _DWORD *a2)
{
  sub_10000B90C(*(void *)(a1 + 24));
  sub_10000ABBC(*(void *)(a1 + 16));
  *(_DWORD *)a1 = 0;
  sub_100008E8C((unsigned int *)a1);
  *(_DWORD *)(a1 + 120) = -1;
  *(_DWORD *)(a1 + 204) = 0;
  *(void *)(a1 + 488) = 0;
  sub_100004508(a1);
  sub_100008978(a1);
  if (a2)
  {
    uint64_t v8 = 0;
    char v9 = 0;
    v7[1] = 9;
    v7[0] = &v8;
    EAPOLPacketSetLength();
    BYTE5(v8) = *a2;
    BYTE4(v8) = 1;
    char v9 = 1;
    EAPPacketSetLength();
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v5, "Re-created EAP Request Identity", v6, 2u);
    }
    sub_100006D60(a1, 0, v7);
  }
  else
  {
    sub_100006D60(a1, 0, 0);
  }
}

void *sub_1000069FC(void *result, int a2)
{
  if (!a2)
  {
    uint64_t v3 = (uint64_t)result;
    sub_10000B90C(result[3]);
    sub_10000ABBC(*(void *)(v3 + 16));
    *(_DWORD *)uint64_t v3 = 7;
    *(unsigned char *)(v3 + 272) = 1;
    sub_100008E8C((unsigned int *)v3);
    CFTypeID v4 = *(void **)(v3 + 24);
    return sub_10000B900(v4, (uint64_t)sub_100006D60, v3, 0);
  }
  return result;
}

BOOL sub_100006A78(BOOL result)
{
  if (result)
  {
    CFStringRef v1 = (const __CFString *)result;
    CFTypeID TypeID = CFStringGetTypeID();
    return CFGetTypeID(v1) != TypeID || CFStringGetLength(v1) == 0;
  }
  return result;
}

void sub_100006AD0(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

uint64_t sub_100006AE4(uint64_t a1, int a2, CFDictionaryRef theDict)
{
  unsigned __int8 v13 = 0;
  switch(a2)
  {
    case 1:
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Configuration");
      if (!Value) {
        return 1;
      }
      int v5 = sub_1000048E8(a1, Value, &v13);
      if (v13) {
        return v13;
      }
      int v6 = v5;
      if (!sub_10000C188(*(void *)(a1 + 24))) {
        return v13;
      }
      if (*(_DWORD *)(a1 + 488) != 3) {
        goto LABEL_25;
      }
      if (*(_DWORD *)a1 == 3)
      {
        if ((v6 & 1) == 0) {
          goto LABEL_29;
        }
LABEL_28:
        sub_100006874(a1, 0);
        return v13;
      }
      if (*(_DWORD *)a1 != 2)
      {
LABEL_25:
        if (!v6) {
          return v13;
        }
        goto LABEL_28;
      }
      if (*(void *)(a1 + 144)) {
        goto LABEL_24;
      }
      return v13;
    case 2:
      return 1;
    case 3:
      if (*(_DWORD *)a1 != 7) {
        sub_100006D60(a1, 0, 0);
      }
      return v13;
    case 4:
      CFDictionaryRef v7 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"UserInput");
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        CFMutableDictionaryRef Mutable = *(CFMutableDictionaryRef *)(a1 + 56);
        if (!Mutable)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          *(void *)(a1 + 56) = Mutable;
        }
        CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)sub_100006AD0, Mutable);
        if (!sub_10000B8A4(*(void *)(a1 + 24)) && my_CFDictionaryGetBooleanValue()) {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), @"TLSSaveTrustExceptions", kCFBooleanFalse);
        }
      }
      CFDictionaryRef Copy = CFDictionaryCreateCopy(0, *(CFDictionaryRef *)(a1 + 40));
      sub_1000048E8(a1, Copy, 0);
      my_CFRelease();
      if (sub_10000ED34(1))
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v11 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v11))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, LogHandle, v11, "user_supplied_data", buf, 2u);
        }
      }
      if (*(_DWORD *)a1 == 3)
      {
LABEL_29:
        if (*(void *)(a1 + 472)) {
          sub_100007500(a1, (void *)(a1 + 472));
        }
      }
      else if (*(_DWORD *)a1 == 2)
      {
LABEL_24:
        sub_100006F68((unsigned int *)a1, 4, 0);
      }
      return v13;
    default:
      return v13;
  }
}

void sub_100006D60(uint64_t a1, int a2, void *a3)
{
  uint64_t v5 = dword_100018860;
  if (a2 == 2)
  {
    if (a3)
    {
LABEL_20:
      sub_10000B914(*(void *)(a1 + 24), 1, 0, 0);
      char v9 = *(CFRunLoopTimerRef **)(a1 + 16);
      sub_10000AC14(v9, v5, 0, (__CFRunLoopTimer *)sub_100006D60, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0);
      return;
    }
  }
  else
  {
    if (a2 != 1)
    {
      if (a2) {
        return;
      }
      sub_10000B90C(*(void *)(a1 + 24));
      sub_10000ABBC(*(void *)(a1 + 16));
      *(_DWORD *)a1 = 1;
      sub_100008E8C((unsigned int *)a1);
      *(_DWORD *)(a1 + 264) = 0;
      sub_10000B900(*(void **)(a1 + 24), (uint64_t)sub_100006D60, a1, 1);
      sub_10000C5D8(*(void *)(a1 + 24));
    }
    if (a3)
    {
      uint64_t v6 = *a3;
      if (*(unsigned char *)(*a3 + 1) != 3)
      {
        if (!*(unsigned char *)(*a3 + 1) && *(unsigned char *)(v6 + 4) == 1)
        {
          if (*(unsigned char *)(v6 + 8) == 1)
          {
            sub_100006F68((unsigned int *)a1, 0, a3);
          }
          else
          {
            sub_100008AC8((unsigned int *)a1, 0, a3);
          }
        }
        return;
      }
      if (*(unsigned char *)(v6 + 4) != 2) {
        return;
      }
      goto LABEL_20;
    }
  }
  int v7 = *(_DWORD *)(a1 + 264);
  if (v7 != dword_100018864)
  {
    *(_DWORD *)(a1 + 264) = v7 + 1;
    goto LABEL_20;
  }
  sub_10000B90C(*(void *)(a1 + 24));
  sub_10000ABBC(*(void *)(a1 + 16));
  *(_DWORD *)a1 = 8;
  *(unsigned char *)(a1 + 272) = 1;
  sub_100008E8C((unsigned int *)a1);
  CFDictionaryRef v8 = *(void **)(a1 + 24);

  sub_10000B900(v8, (uint64_t)sub_100006D60, a1, 0);
}

void sub_100006F68(unsigned int *a1, int a2, void *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = dword_100018868;
  switch(a2)
  {
    case 0:
      ++a1[67];
      a1[51] = 0;
      sub_10000B90C(*((void *)a1 + 3));
      sub_10000ABBC(*((void *)a1 + 2));
      *a1 = 2;
      *((unsigned char *)a1 + 498) = 0;
      sub_10000B900(*((void **)a1 + 3), (uint64_t)sub_100006F68, (uint64_t)a1, 1);
      goto LABEL_3;
    case 1:
LABEL_3:
      *((unsigned char *)a1 + 272) = 0;
      CFDictionaryRef v8 = (unsigned char *)*a3;
      if (!*(unsigned char *)(*a3 + 1))
      {
        if (v8[4] == 1 && v8[8] == 1)
        {
          unsigned int Length = EAPPacketGetLength();
          my_CFRelease();
          os_log_type_t v11 = (const UInt8 *)memchr(v8 + 9, 0, (int)(Length - 5));
          if (Length >= 6 && v11 != 0)
          {
            CFStringRef v13 = CFStringCreateWithBytes(0, v11 + 1, (int)(Length - 5 + v8 + 9 - (v11 + 1)), 0x8000100u, 0);
            *(void *)os_log_type_t v23 = v13;
            if (v13)
            {
              *((void *)a1 + 27) = CFStringCreateArrayBySeparatingStrings(0, v13, @",");
              my_CFRelease();
            }
          }
          if (sub_10000ED34(1))
          {
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v15 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v15))
            {
              *(_WORD *)os_log_type_t v23 = 0;
              _os_log_impl((void *)&_mh_execute_header, LogHandle, v15, "EAP Request Identity", v23, 2u);
            }
          }
          a1[30] = v8[5];
          if (sub_100009DFC((uint64_t)a1))
          {
            a1[122] = 0;
            *((unsigned char *)a1 + 498) = 1;
            sub_100008E8C(a1);
            sub_10000AC14(*((CFRunLoopTimerRef **)a1 + 2), v7, 0, (__CFRunLoopTimer *)sub_100006F68, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0);
          }
          else if (*((unsigned char *)a1 + 497))
          {
            v20 = EAPLogGetLogHandle();
            os_log_type_t v21 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v20, v21))
            {
              *(_WORD *)os_log_type_t v23 = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, v21, "Acquired: cannot prompt for missing user name", v23, 2u);
            }
            a1[122] = 15;
            sub_10000A004((uint64_t)a1, 0, 0);
          }
          else
          {
            if (*((unsigned char *)a1 + 499) || *((unsigned char *)a1 + 500) || *((unsigned char *)a1 + 501)) {
              int v22 = 20;
            }
            else {
              int v22 = 3;
            }
            a1[122] = v22;
            sub_100008E8C(a1);
          }
        }
        else if (a2)
        {
          sub_100008AC8(a1, 0, a3);
        }
        else
        {
          v17 = EAPLogGetLogHandle();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            if (v6 > 8) {
              os_log_type_t v19 = "<unknown>";
            }
            else {
              os_log_type_t v19 = off_100014928[v6];
            }
            *(_DWORD *)os_log_type_t v23 = 136315138;
            *(void *)&v23[4] = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, v18, "internal error: recursion avoided from state %s", v23, 0xCu);
          }
        }
      }
      break;
    case 2:
      if ((int)a1[67] >= dword_10001886C)
      {
        a1[67] = 0;
        a1[122] = 18;
        sub_10000A004((uint64_t)a1, 0, 0);
      }
      else
      {
        sub_100006D60(a1, 0, 0);
      }
      break;
    case 4:
      if (sub_100009DFC((uint64_t)a1))
      {
        a1[122] = 0;
        sub_100008E8C(a1);
        char v9 = (CFRunLoopTimerRef *)*((void *)a1 + 2);
        sub_10000AC14(v9, v7, 0, (__CFRunLoopTimer *)sub_100006F68, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0);
      }
      else
      {
        if (*((unsigned char *)a1 + 499) || *((unsigned char *)a1 + 500) || *((unsigned char *)a1 + 501)) {
          int v16 = 20;
        }
        else {
          int v16 = 3;
        }
        a1[122] = v16;
        sub_100008E8C(a1);
      }
      break;
    default:
      return;
  }
}

void sub_100007500(uint64_t a1, void *a2)
{
  uint64_t v2 = (unsigned char *)*a2;
  if (!*(void *)(a1 + 144)) {
    return;
  }
  switch(v2[4])
  {
    case 1:
      int v5 = v2[8];
      if (!v2[8]) {
        return;
      }
      uint64_t v6 = dword_100018868;
      uint64_t v7 = *(void *)(a1 + 280);
      if (v7) {
        LODWORD(v7) = EAPClientModulePluginEAPType();
      }
      if (v7 == v5) {
        goto LABEL_22;
      }
      uint64_t v8 = *(void *)(a1 + 192);
      if (!v8) {
        goto LABEL_60;
      }
      int v9 = v2[8];
      int v10 = *(_DWORD *)(a1 + 200);
      if (v10 < 1) {
        goto LABEL_55;
      }
      uint64_t v11 = 0xFFFFFFFFLL;
      uint64_t v12 = *(int **)(a1 + 192);
      uint64_t v13 = *(unsigned int *)(a1 + 200);
      break;
    case 2:
      int v15 = v2[8];
      uint64_t v16 = *(void *)(a1 + 280);
      if (v16) {
        LODWORD(v16) = EAPClientModulePluginEAPType();
      }
      if (v16 != v15) {
        return;
      }
      goto LABEL_22;
    case 3:
      if (*(void *)(a1 + 280)) {
        goto LABEL_22;
      }
      sub_100007F3C(a1, 0, 0);
      return;
    case 4:
      if (*(void *)(a1 + 280)) {
        goto LABEL_22;
      }
      *(_DWORD *)(a1 + 488) = 1;
      sub_10000A004(a1, 0, 0);
      return;
    default:
      goto LABEL_22;
  }
  while (1)
  {
    int v14 = *v12++;
    if (v14 == v9) {
      break;
    }
    --v11;
    if (!--v13) {
      goto LABEL_55;
    }
  }
  if (!v11)
  {
LABEL_55:
    uint64_t v47 = *(int *)(a1 + 204);
    if ((int)v47 >= v10 || (*(_DWORD *)(a1 + 204) = v47 + 1, (int v48 = *(_DWORD *)(v8 + 4 * v47)) == 0))
    {
LABEL_60:
      if (sub_10000ED34(1))
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v51 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v51))
        {
          uint64_t v52 = EAPTypeStr();
          int v53 = v2[8];
          *(_DWORD *)buf = 136315394;
          uint64_t v60 = v52;
          __int16 v61 = 1024;
          *(_DWORD *)gid_t v62 = v53;
          _os_log_impl((void *)&_mh_execute_header, LogHandle, v51, "EAP Request: %s (%d) not enabled", buf, 0x12u);
        }
      }
      sub_10000A60C(a1, v2[5], 0);
      int v23 = 5;
      goto LABEL_64;
    }
    sub_10000A4BC(v9, a1 + 192);
    sub_10000A60C(a1, v2[5], v48);
    CFDictionaryRef v49 = *(CFRunLoopTimerRef **)(a1 + 16);
    sub_10000AC14(v49, v6, 0, (__CFRunLoopTimer *)sub_100008AC8, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0);
    return;
  }
  sub_10000ABBC(*(void *)(a1 + 16));
  sub_100004508(a1);
  if ((sub_10000A76C(a1, v2[8]) & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 488) == 3)
    {
      sub_10000A900(a1, (uint64_t)a2);
      sub_100008E8C((unsigned int *)a1);
      return;
    }
    unint64_t v54 = EAPLogGetLogHandle();
    os_log_type_t v55 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v54, v55)) {
      goto LABEL_65;
    }
    uint64_t v56 = EAPTypeStr();
    int v57 = v2[8];
    int v58 = *(_DWORD *)(a1 + 488);
    *(_DWORD *)buf = 136315650;
    uint64_t v60 = v56;
    __int16 v61 = 1024;
    *(_DWORD *)gid_t v62 = v57;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = v58;
    v33 = "EAP Request: %s (%d) init failed, %d";
    CFTypeID v34 = v54;
    os_log_type_t v35 = v55;
    uint32_t v36 = 24;
    goto LABEL_36;
  }
  if (sub_10000ED34(1))
  {
    BOOL v43 = EAPLogGetLogHandle();
    os_log_type_t v44 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = EAPTypeStr();
      int v46 = v2[8];
      *(_DWORD *)buf = 136315394;
      uint64_t v60 = v45;
      __int16 v61 = 1024;
      *(_DWORD *)gid_t v62 = v46;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "EAP Request: %s (%d) accepted", buf, 0x12u);
    }
  }
  sub_100008E8C((unsigned int *)a1);
LABEL_22:
  if (!*(void *)(a1 + 280)) {
    return;
  }
  v17 = (uint64_t *)(a1 + 440);
  my_CFRelease();
  my_CFRelease();
  *(void *)(a1 + 328) = *(void *)(a1 + 144);
  *(_DWORD *)(a1 + 336) = *(_DWORD *)(a1 + 152);
  *(void *)(a1 + 352) = *(void *)(a1 + 160);
  *(_DWORD *)(a1 + 360) = *(_DWORD *)(a1 + 168);
  *(_DWORD *)(a1 + 308) = *(_DWORD *)(a1 + 32);
  sub_10000AA28(a1);
  *(unsigned char *)(a1 + 296) = (sub_10000EBF8() & 0x1000) == 0;
  int v18 = EAPClientModulePluginProcess();
  *(void *)(a1 + 448) = EAPClientModulePluginPublishProperties();
  if (v18 == 2)
  {
    uint64_t v24 = EAPClientModulePluginFailureString();
    if (v24)
    {
      uint64_t v25 = v24;
      v26 = EAPLogGetLogHandle();
      os_log_type_t v27 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v60 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "error string '%s'", buf, 0xCu);
      }
    }
    os_log_type_t v28 = EAPLogGetLogHandle();
    os_log_type_t v29 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v28, v29)) {
      goto LABEL_65;
    }
    uint64_t v30 = sub_10000B88C(*(void *)(a1 + 24), 0);
    uint64_t v31 = *(void *)(a1 + 464);
    int v32 = *(_DWORD *)(a1 + 488);
    *(_DWORD *)buf = 136315650;
    uint64_t v60 = v30;
    __int16 v61 = 2080;
    *(void *)gid_t v62 = v31;
    *(_WORD *)&v62[8] = 1024;
    int v63 = v32;
    v33 = "%s %s: authentication failed with status %d";
    CFTypeID v34 = v28;
    os_log_type_t v35 = v29;
    uint32_t v36 = 28;
LABEL_36:
    _os_log_impl((void *)&_mh_execute_header, v34, v35, v33, buf, v36);
LABEL_65:
    sub_10000A004(a1, 0, 0);
    return;
  }
  if (v18 == 1)
  {
    v37 = EAPLogGetLogHandle();
    os_log_type_t v38 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = sub_10000B88C(*(void *)(a1 + 24), 0);
      uint64_t v40 = *(void *)(a1 + 464);
      *(_DWORD *)buf = 136315394;
      uint64_t v60 = v39;
      __int16 v61 = 2080;
      *(void *)gid_t v62 = v40;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "%s %s: successfully authenticated", buf, 0x16u);
    }
    if (sub_10000B8A4(*(void *)(a1 + 24))) {
      sub_10000A994(a1);
    }
    sub_100007F3C(a1, 0, 0);
  }
  else
  {
    if (v18) {
      return;
    }
    if (*(_DWORD *)(a1 + 488) == 3)
    {
      sub_10000A900(a1, (uint64_t)a2);
      *(void *)(a1 + 440) = EAPClientModulePluginRequireProperties();
      int v19 = *(unsigned __int8 *)(a1 + 497);
      v20 = EAPLogGetLogHandle();
      if (v19)
      {
        os_log_type_t v21 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = *v17;
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Authenticating: can't prompt for missing properties %@", buf, 0xCu);
        }
        int v23 = 15;
LABEL_64:
        *(_DWORD *)(a1 + 488) = v23;
        goto LABEL_65;
      }
      int v41 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v20, (os_log_type_t)v41))
      {
        uint64_t v42 = *v17;
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = v42;
        _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v41, "Authenticating: user input required for properties %@", buf, 0xCu);
      }
    }
    sub_100008E8C((unsigned int *)a1);
    if (sub_10000B8A4(*(void *)(a1 + 24))) {
      sub_10000A994(a1);
    }
  }
}

void sub_100007DA8(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 268) = 0;
  if (!a2)
  {
    uint64_t v6 = *(CFRunLoopTimerRef **)(a1 + 16);
    uint64_t v7 = (__CFRunLoopTimer *)sub_1000069FC;
    uint64_t v8 = 1;
    int v9 = 0;
    goto LABEL_21;
  }
  int v3 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 != 1)
  {
    if (v3 != 7)
    {
      int v10 = 0;
      uint64_t v11 = 5;
      goto LABEL_15;
    }
    if (*(void *)(a1 + 280))
    {
      if (sub_10000BE94(*(void *)(a1 + 24)))
      {
        if (sub_10000ED34(1))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v5 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v5))
          {
            *(_WORD *)uint64_t v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, LogHandle, v5, "Valid PMK Exists", v13, 2u);
          }
        }
        sub_100007F3C(a1, 0, 0);
        return;
      }
      int v3 = *(_DWORD *)a1;
    }
    else
    {
      int v3 = 7;
    }
  }
  uint64_t v11 = 0;
  int v10 = 500000;
LABEL_15:
  if (v3 == 4 && sub_10000BE94(*(void *)(a1 + 24)))
  {
    uint64_t v12 = *(void *)(a1 + 16);
    sub_10000ABBC(v12);
    return;
  }
  uint64_t v6 = *(CFRunLoopTimerRef **)(a1 + 16);
  uint64_t v7 = (__CFRunLoopTimer *)sub_100006D60;
  uint64_t v8 = v11;
  int v9 = v10;
LABEL_21:

  sub_10000AC14(v6, v8, v9, v7, (__CFRunLoopTimer *)a1, 0, 0);
}

void sub_100007F3C(uint64_t a1, int a2, uint64_t *a3)
{
  if (a2 != 1)
  {
    if (!a2)
    {
      sub_10000B90C(*(void *)(a1 + 24));
      sub_10000ABBC(*(void *)(a1 + 16));
      *(_DWORD *)(a1 + 268) = 0;
      *(_DWORD *)a1 = 4;
      sub_100008978(a1);
      if (*(unsigned char *)(a1 + 173)) {
        goto LABEL_11;
      }
      CFDictionaryRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"NewPassword");
      CFTypeID TypeID = CFStringGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        uint64_t v6 = *(void **)(a1 + 160);
        if (v6) {
          free(v6);
        }
        uint64_t v7 = (const char *)my_CFStringToCString();
        *(void *)(a1 + 160) = v7;
        if (v7) {
          *(_DWORD *)(a1 + 168) = strlen(v7);
        }
      }
      if (*(unsigned char *)(a1 + 173))
      {
LABEL_11:
        *(unsigned char *)(a1 + 174) = 1;
        uint64_t v8 = *(void **)(a1 + 160);
        if (v8)
        {
          free(v8);
          *(void *)(a1 + 160) = 0;
        }
        *(_DWORD *)(a1 + 168) = 0;
      }
      sub_100008E8C((unsigned int *)a1);
      int v9 = *(void **)(a1 + 24);
      sub_10000B900(v9, (uint64_t)sub_100007F3C, a1, 1);
    }
    return;
  }
  sub_10000ABBC(*(void *)(a1 + 16));
  uint64_t v11 = *a3;
  if (*(unsigned char *)(*a3 + 1) != 3)
  {
    if (!*(unsigned char *)(*a3 + 1) && *(unsigned char *)(v11 + 4) == 1)
    {
      int v12 = *(unsigned __int8 *)(v11 + 8);
      if (v12 == 2)
      {
        sub_10000A268(*(_DWORD *)a1, v11 + 4);
        sub_10000A3A0(a1);
      }
      else if (v12 == 1)
      {
        sub_100006F68(a1, 0, a3);
      }
      else
      {
        sub_100008AC8(a1, 0, a3);
      }
    }
    return;
  }
  if (!sub_10000B8A4(*(void *)(a1 + 24))) {
    return;
  }
  uint64_t v13 = *a3;
  if (*(unsigned char *)(v13 + 4) != 1) {
    return;
  }
  size_t __len = 0;
  uint64_t v14 = EAPClientModulePluginSessionKey();
  if (!v14)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v22)) {
      return;
    }
    *(_WORD *)macOut = 0;
    int v23 = "session key is NULL";
LABEL_58:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v22, v23, macOut, 2u);
    return;
  }
  int v15 = (const void *)v14;
  uint64_t v16 = EAPClientModulePluginServerKey();
  if (!v16)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v22)) {
      return;
    }
    *(_WORD *)macOut = 0;
    int v23 = "server key is NULL";
    goto LABEL_58;
  }
  v17 = (const void *)v16;
  unsigned int Length = EAPOLPacketGetLength();
  size_t v19 = Length + 4;
  if (sub_10000ED34(16)) {
    CFMutableDictionaryRef Mutable = CFStringCreateMutable(0, 0);
  }
  else {
    CFMutableDictionaryRef Mutable = 0;
  }
  size_t v24 = SHIDWORD(__len);
  uint64_t v25 = malloc_type_malloc(v19, 0xAFB62631uLL);
  memmove(v25, (const void *)v13, v19);
  v25[4] = 0;
  v25[5] = 0;
  CCHmac(1u, v17, v24, v25, v19, macOut);
  BOOL v27 = *(void *)(v13 + 32) != *(void *)macOut || *(void *)(v13 + 40) != *(void *)&macOut[8];
  if (Mutable)
  {
    CFStringAppendFormat(Mutable, 0, @"Signature: ");
    print_bytes_cfstr();
    os_log_type_t v28 = "INVALID";
    if (!v27) {
      os_log_type_t v28 = "valid";
    }
    CFStringAppendFormat(Mutable, 0, @" is %s", v28);
    free(v25);
    os_log_type_t v29 = EAPLogGetLogHandle();
    os_log_type_t v30 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v29, v30))
    {
      *(_DWORD *)macOut = 138412290;
      *(void *)&macOut[4] = Mutable;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@", macOut, 0xCu);
    }
    CFRelease(Mutable);
  }
  else
  {
    free(v25);
  }
  if (v27)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v22)) {
      return;
    }
    *(_WORD *)macOut = 0;
    int v23 = "key signature mismatch, ignoring";
    goto LABEL_58;
  }
  int v31 = *(char *)(v13 + 31);
  if (v31 >= 0) {
    unsigned int v32 = 1;
  }
  else {
    unsigned int v32 = 2;
  }
  int v33 = EAPOLKeyDescriptorGetLength();
  if (Length < 0x2D)
  {
    if (sub_10000ED34(1))
    {
      int v41 = EAPLogGetLogHandle();
      os_log_type_t v42 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v41, v42))
      {
        BOOL v43 = "Broadcast";
        if (v31 < 0) {
          BOOL v43 = "Unicast";
        }
        *(_DWORD *)macOut = 136315394;
        *(void *)&macOut[4] = v43;
        *(_WORD *)&macOut[12] = 1024;
        *(_DWORD *)&macOut[14] = v33;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "set %s key length %d using session key", macOut, 0x12u);
      }
    }
    sub_10000B8B0(*(void *)(a1 + 24), v32, *(unsigned char *)(v13 + 31) & 0x7F, (uint64_t)v15, v33);
  }
  else
  {
    size_t v47 = 0;
    size_t v34 = (int)__len + 16;
    os_log_type_t v35 = malloc_type_malloc(v34, 0xF9155699uLL);
    *os_log_type_t v35 = *(_OWORD *)(v13 + 15);
    memmove(v35 + 1, v15, (int)__len);
    dataOut = malloc_type_malloc(Length - 44, 0xEFD37E65uLL);
    CCCryptorStatus v37 = CCCrypt(1u, 4u, 0, v35, v34, 0, (const void *)(v13 + 48), Length - 44, dataOut, Length - 44, &v47);
    BOOL v38 = sub_10000ED34(1);
    if (v37)
    {
      if (v38)
      {
        uint64_t v39 = EAPLogGetLogHandle();
        os_log_type_t v40 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v39, v40))
        {
          *(_DWORD *)macOut = 67109120;
          *(_DWORD *)&macOut[4] = v37;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "key process: RC4 decrypt failed %d", macOut, 8u);
        }
      }
    }
    else
    {
      if (v38)
      {
        os_log_type_t v44 = EAPLogGetLogHandle();
        os_log_type_t v45 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v44, v45))
        {
          int v46 = "Broadcast";
          if (v31 < 0) {
            int v46 = "Unicast";
          }
          *(_DWORD *)macOut = 136315394;
          *(void *)&macOut[4] = v46;
          *(_WORD *)&macOut[12] = 1024;
          *(_DWORD *)&macOut[14] = v33;
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "set %s key length %d using descriptor", macOut, 0x12u);
        }
      }
      sub_10000B8B0(*(void *)(a1 + 24), v32, *(unsigned char *)(v13 + 31) & 0x7F, (uint64_t)dataOut, v33);
    }
    free(dataOut);
    free(v35);
  }
}

void *sub_1000086FC(uint64_t a1)
{
  sub_10000AB44();
  uint64_t v11 = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    BOOL result = malloc_type_malloc(0x1F8uLL, 0x10F0040E1D3ED99uLL);
    if (result)
    {
      result[62] = 0;
      *((_OWORD *)result + 29) = 0u;
      *((_OWORD *)result + 30) = 0u;
      *((_OWORD *)result + 27) = 0u;
      *((_OWORD *)result + 28) = 0u;
      *((_OWORD *)result + 25) = 0u;
      *((_OWORD *)result + 26) = 0u;
      *((_OWORD *)result + 23) = 0u;
      *((_OWORD *)result + 24) = 0u;
      *((_OWORD *)result + 21) = 0u;
      *((_OWORD *)result + 22) = 0u;
      *((_OWORD *)result + 19) = 0u;
      *((_OWORD *)result + 20) = 0u;
      *((_OWORD *)result + 17) = 0u;
      *((_OWORD *)result + 18) = 0u;
      *((_OWORD *)result + 15) = 0u;
      *((_OWORD *)result + 16) = 0u;
      *((_OWORD *)result + 13) = 0u;
      *((_OWORD *)result + 14) = 0u;
      *((_OWORD *)result + 11) = 0u;
      *((_OWORD *)result + 12) = 0u;
      *((_OWORD *)result + 9) = 0u;
      *((_OWORD *)result + 10) = 0u;
      *((_OWORD *)result + 7) = 0u;
      *((_OWORD *)result + 8) = 0u;
      *((_OWORD *)result + 5) = 0u;
      *((_OWORD *)result + 6) = 0u;
      *((_OWORD *)result + 3) = 0u;
      *((_OWORD *)result + 4) = 0u;
      *((_OWORD *)result + 1) = 0u;
      *((_OWORD *)result + 2) = 0u;
      *(_OWORD *)BOOL result = 0u;
      result[2] = v3;
      result[3] = a1;
      return result;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      __int16 v9 = 0;
      uint64_t v7 = "malloc failed";
      uint64_t v8 = (uint8_t *)&v9;
      goto LABEL_8;
    }
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      __int16 v10 = 0;
      uint64_t v7 = "Timer_create failed";
      uint64_t v8 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v6, v7, v8, 2u);
    }
  }
  sub_10000AB80(&v11);
  return 0;
}

void *sub_100008838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1000086FC(a1);
  CFTypeID v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 8) = *(_DWORD *)(a2 + 32);
    os_log_type_t v5 = *(const void **)(a2 + 184);
    if (v5)
    {
      CFRetain(v5);
      v4[23] = *(void *)(a2 + 184);
    }
    v4[6] = CFRetain(*(CFTypeRef *)(a2 + 48));
    CFDictionaryRef v6 = *(const __CFDictionary **)(a2 + 56);
    if (v6) {
      v4[7] = CFDictionaryCreateMutableCopy(0, 0, v6);
    }
    uint64_t v7 = *(const char **)(a2 + 128);
    if (v7)
    {
      uint8_t v4[16] = strdup(v7);
      *((_DWORD *)v4 + 34) = *(_DWORD *)(a2 + 136);
    }
    uint64_t v8 = *(const char **)(a2 + 144);
    if (v8)
    {
      v4[18] = strdup(v8);
      *((_DWORD *)v4 + 38) = *(_DWORD *)(a2 + 152);
    }
    __int16 v9 = *(const char **)(a2 + 160);
    if (v9)
    {
      v4[20] = strdup(v9);
      *((_DWORD *)v4 + 42) = *(_DWORD *)(a2 + 168);
    }
    long long v10 = *(_OWORD *)(a2 + 192);
    v4[26] = *(void *)(a2 + 208);
    *((_OWORD *)v4 + 12) = v10;
    uint64_t v11 = malloc_type_malloc(4 * *(int *)(a2 + 200), 0x100004052888210uLL);
    v4[24] = v11;
    memmove(v11, *(const void **)(a2 + 192), 4 * *(int *)(a2 + 200));
    *((unsigned char *)v4 + 497) = 1;
  }
  return v4;
}

uint64_t sub_100008938(uint64_t result)
{
  *(unsigned char *)(result + 497) = 1;
  return result;
}

void sub_100008944(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
}

void sub_100008978(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 472);
  if (v2)
  {
    uint64_t v3 = (void *)(a1 + 472);
    free(v2);
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
}

uint64_t sub_1000089AC(unsigned int *a1, _DWORD *a2)
{
  *a2 = a1[122];
  return *a1;
}

_DWORD *sub_1000089BC(_DWORD *result)
{
  if (*result == 3)
  {
    CFStringRef v1 = result;
    if (sub_10000ED34(1))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v3))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "Simulating EAP Success packet", buf, 2u);
      }
    }
    *(_WORD *)buf = 1;
    EAPOLPacketSetLength();
    __int16 v6 = 3;
    EAPPacketSetLength();
    v4[0] = buf;
    v4[1] = 8;
    return (_DWORD *)sub_100008AC8(v1, 1, v4);
  }
  return result;
}

void sub_100008AC8(unsigned int *a1, int a2, void *a3)
{
  if (a2 == 2)
  {
    sub_100006D60(a1, 0, 0);
  }
  else
  {
    uint64_t v6 = *a1;
    if (a2 != 1)
    {
      if (a2) {
        return;
      }
      if (sub_10000B8A4(*((void *)a1 + 3)))
      {
        sub_10000BED0(*((void *)a1 + 3), 0, 0);
        *((unsigned char *)a1 + 496) = 0;
      }
      *a1 = 3;
      sub_100008E8C(a1);
      sub_10000B900(*((void **)a1 + 3), (uint64_t)sub_100008AC8, (uint64_t)a1, 1);
    }
    sub_10000ABBC(*((void *)a1 + 2));
    *((unsigned char *)a1 + 272) = 0;
    uint64_t v7 = *a3;
    if (!*(unsigned char *)(*a3 + 1))
    {
      int v8 = *(unsigned __int8 *)(v7 + 4);
      if ((v8 - 1) < 2)
      {
        int v9 = *(unsigned __int8 *)(v7 + 8);
        if (v9 == 2)
        {
          if (v8 != 2)
          {
            sub_10000A268(*a1, v7 + 4);
            sub_10000A3A0((uint64_t)a1);
          }
          return;
        }
        if (v9 == 1)
        {
          if (v8 != 2)
          {
            if (a2)
            {
              sub_100006F68(a1, 0, a3);
            }
            else
            {
              LogHandle = EAPLogGetLogHandle();
              os_log_type_t v11 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(LogHandle, v11))
              {
                if (v6 > 8) {
                  int v12 = "<unknown>";
                }
                else {
                  int v12 = off_100014928[v6];
                }
                int v13 = 136315138;
                uint64_t v14 = v12;
                _os_log_impl((void *)&_mh_execute_header, LogHandle, v11, "internal error: recursion avoided from state %s", (uint8_t *)&v13, 0xCu);
              }
            }
          }
          return;
        }
      }
      else if (v8 != 4 && v8 != 3)
      {
        return;
      }
      sub_100007500((uint64_t)a1, a3);
    }
  }
}

const __SCPreferences *sub_100008DB0(const __SCPreferences *result)
{
  if (result)
  {
    CFPropertyListRef Value = SCPreferencesGetValue(result, @"Supplicant");
    BOOL result = (const __SCPreferences *)CFDictionaryGetTypeID();
    if (Value)
    {
      uint64_t v2 = result;
      BOOL result = (const __SCPreferences *)CFGetTypeID(Value);
      if (result == v2)
      {
        dword_100018860 = sub_10000B2D0((const __CFDictionary *)Value, @"StartPeriodSeconds", 5u);
        dword_100018864 = sub_10000B2D0((const __CFDictionary *)Value, @"StartAttemptsMax", 3u);
        dword_100018868 = sub_10000B2D0((const __CFDictionary *)Value, @"AuthPeriodSeconds", 5u);
        dword_10001886C = sub_10000B2D0((const __CFDictionary *)Value, @"AuthAttemptsMax", 4u);
        BOOL result = (const __SCPreferences *)sub_10000B2D0((const __CFDictionary *)Value, @"HeldPeriodSeconds", 0x3Cu);
        dword_100018870 = (int)result;
      }
    }
  }
  return result;
}

uint64_t sub_100008E8C(unsigned int *a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int v3 = sub_10000C5CC(*((void *)a1 + 3));
  if (v3)
  {
    int v4 = v3;
    sub_1000096D4(Mutable, @"Mode", v3);
    if (v4 == 3) {
      CFDictionarySetValue(Mutable, @"SystemMode", kCFBooleanTrue);
    }
  }
  os_log_type_t v5 = (const void *)*((void *)a1 + 11);
  if (v5) {
    CFDictionarySetValue(Mutable, @"UniqueIdentifier", v5);
  }
  sub_1000096D4(Mutable, @"SupplicantState", *a1);
  if (*((unsigned char *)a1 + 272))
  {
    sub_1000096D4(Mutable, @"ClientStatus", 0);
    sub_1000096D4(Mutable, @"DomainSpecificError", 0);
  }
  else
  {
    int v6 = a1[114];
    if (v6)
    {
      uint64_t v7 = (const char *)*((void *)a1 + 58);
      if (v7)
      {
        *(void *)buf = CFStringCreateWithCString(0, v7, 0x600u);
        CFDictionarySetValue(Mutable, @"EAPTypeName", *(const void **)buf);
        my_CFRelease();
      }
      sub_1000096D4(Mutable, @"EAPType", v6);
    }
    int v8 = a1[123];
    sub_1000096D4(Mutable, @"ClientStatus", a1[122]);
    sub_1000096D4(Mutable, @"DomainSpecificError", v8);
    unsigned int v9 = a1[122];
    if (v9 == 3)
    {
      if (*((void *)a1 + 18))
      {
        uint64_t v16 = (void *)*((void *)a1 + 55);
        v17 = Mutable;
      }
      else
      {
        v17 = Mutable;
        uint64_t v16 = 0;
      }
      sub_100009638(v17, v16);
    }
    else if (v9 == 20)
    {
      if (*((unsigned char *)a1 + 499))
      {
        uint64_t v10 = sub_10000B8CC(*((void *)a1 + 3));
        if (v10) {
          CFStringRef v11 = (const __CFString *)v10;
        }
        else {
          CFStringRef v11 = @"network";
        }
        uint64_t v12 = *((void *)a1 + 9);
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v14 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v14))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v12;
          __int16 v60 = 2112;
          __int16 v61 = (void *)v11;
          _os_log_impl((void *)&_mh_execute_header, LogHandle, v14, "fetching credentials with provider url: [%@], ssid:[%@]", buf, 0x16u);
        }
        int v15 = sub_100003924(v12, (uint64_t)v11, &_dispatch_main_q, (uint64_t)sub_10000626C, (uint64_t)a1);
        if (v15) {
          *((void *)a1 + 10) = v15;
        }
      }
      else if (*((unsigned char *)a1 + 500))
      {
        int v18 = EAPLogGetLogHandle();
        os_log_type_t v19 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v18, v19))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "fetching EAP configuration from MIB source", buf, 2u);
        }
        sub_10000AD64((uint64_t)sub_100009730, (uint64_t)a1);
      }
      else if (*((unsigned char *)a1 + 501))
      {
        sub_1000095A4((uint64_t)a1);
      }
    }
    v20 = (const void *)*((void *)a1 + 56);
    if (v20) {
      CFDictionarySetValue(Mutable, @"AdditionalProperties", v20);
    }
    os_log_type_t v21 = (const void *)*((void *)a1 + 27);
    if (v21) {
      CFDictionarySetValue(Mutable, @"IdentityAttributes", v21);
    }
  }
  sub_1000096D4(Mutable, @"ConfigurationGeneration", a1[8]);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v23 = CFDateCreate(0, Current);
  CFDictionarySetValue(Mutable, @"LastStatusTimestamp", v23);
  if (*a1 == 4)
  {
    CFTypeRef v24 = (CFTypeRef)*((void *)a1 + 1);
    if (!v24)
    {
      CFTypeRef v24 = CFRetain(v23);
      *((void *)a1 + 1) = v24;
    }
    CFDictionarySetValue(Mutable, @"Timestamp", v24);
  }
  CFRelease(v23);
  if (sub_10000ED34(5))
  {
    sub_10000ED34(4);
    if (Mutable && (*a1 == 5 || sub_10000ED34(4))) {
      uint64_t v25 = my_CFPropertyListCopyAsXMLString();
    }
    else {
      uint64_t v25 = 0;
    }
    unsigned int v26 = a1[122];
    if (v26 == 1002)
    {
      int v31 = EAPLogGetLogHandle();
      os_log_type_t v32 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = *a1;
        if (v33 > 8) {
          size_t v34 = "<unknown>";
        }
        else {
          size_t v34 = off_100014928[v33];
        }
        int v49 = a1[122];
        os_log_type_t v50 = sub_1000064B4(v49);
        unsigned int v51 = a1[123];
        uint64_t v52 = ":\n";
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v34;
        if (!v25) {
          uint64_t v52 = "";
        }
        __int16 v60 = 2080;
        CFStringRef v53 = &stru_100014DB0;
        __int16 v61 = (void *)v50;
        if (v25) {
          CFStringRef v53 = (const __CFString *)v25;
        }
        __int16 v62 = 1024;
        int v63 = v49;
        __int16 v64 = 1024;
        *(_DWORD *)uint64_t v65 = v51;
        *(_WORD *)&v65[4] = 2080;
        *(void *)&v65[6] = v52;
        *(_WORD *)&v65[14] = 2112;
        *(void *)&v65[16] = v53;
        os_log_type_t v45 = "State=%s Status=%s (%d): %d%s%@";
        int v46 = v31;
        os_log_type_t v47 = v32;
        uint32_t v48 = 54;
        goto LABEL_73;
      }
    }
    else if (v26 == 1001)
    {
      BOOL v27 = EAPLogGetLogHandle();
      os_log_type_t v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = *a1;
        if (v29 > 8) {
          os_log_type_t v30 = "<unknown>";
        }
        else {
          os_log_type_t v30 = off_100014928[v29];
        }
        int v39 = a1[122];
        os_log_type_t v40 = sub_1000064B4(v39);
        uint64_t v41 = EAPSecurityErrorString();
        unsigned int v42 = a1[123];
        BOOL v43 = ":\n";
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = v30;
        if (!v25) {
          BOOL v43 = "";
        }
        __int16 v60 = 2080;
        CFStringRef v44 = &stru_100014DB0;
        __int16 v61 = (void *)v40;
        if (v25) {
          CFStringRef v44 = (const __CFString *)v25;
        }
        __int16 v62 = 1024;
        int v63 = v39;
        __int16 v64 = 2080;
        *(void *)uint64_t v65 = v41;
        *(_WORD *)&v65[8] = 1024;
        *(_DWORD *)&v65[10] = v42;
        *(_WORD *)&v65[14] = 2080;
        *(void *)&v65[16] = v43;
        __int16 v66 = 2112;
        CFStringRef v67 = v44;
        os_log_type_t v45 = "State=%s Status=%s (%d): %s (%d)%s%@";
        int v46 = v27;
        os_log_type_t v47 = v28;
        uint32_t v48 = 64;
LABEL_73:
        _os_log_impl((void *)&_mh_execute_header, v46, v47, v45, buf, v48);
      }
    }
    else
    {
      os_log_type_t v35 = EAPLogGetLogHandle();
      os_log_type_t v36 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = *a1;
        if (v37 > 8) {
          BOOL v38 = "<unknown>";
        }
        else {
          BOOL v38 = off_100014928[v37];
        }
        int v54 = a1[122];
        os_log_type_t v55 = sub_1000064B4(v54);
        *(_DWORD *)buf = 136316162;
        uint64_t v56 = ":\n";
        *(void *)&uint8_t buf[4] = v38;
        if (!v25) {
          uint64_t v56 = "";
        }
        __int16 v60 = 2080;
        __int16 v61 = (void *)v55;
        __int16 v62 = 1024;
        CFStringRef v57 = &stru_100014DB0;
        if (v25) {
          CFStringRef v57 = (const __CFString *)v25;
        }
        int v63 = v54;
        __int16 v64 = 2080;
        *(void *)uint64_t v65 = v56;
        *(_WORD *)&v65[8] = 2112;
        *(void *)&v65[10] = v57;
        os_log_type_t v45 = "State=%s Status=%s (%d)%s%@";
        int v46 = v35;
        os_log_type_t v47 = v36;
        uint32_t v48 = 48;
        goto LABEL_73;
      }
    }
    my_CFRelease();
  }
  sub_10000C194(*((void *)a1 + 3));
  return my_CFRelease();
}

void sub_1000095A4(uint64_t a1)
{
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v3))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "fetching EAP configuration from Factory OTA client", v4, 2u);
  }
  sub_100002884((uint64_t)sub_1000098D8, a1);
}

void sub_100009638(CFMutableDictionaryRef theDict, void *value)
{
  if (value)
  {
    CFDictionarySetValue(theDict, @"RequiredProperties", value);
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, @"UserName");
    CFDictionarySetValue(theDict, @"RequiredProperties", Mutable);
    my_CFRelease();
  }
}

uint64_t sub_1000096D4(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a1, a2, v6);
  return my_CFRelease();
}

void sub_100009730(uint64_t a1, uint64_t a2)
{
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v5))
  {
    *(_WORD *)CFStringRef v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v5, "mib_access_callback", v11, 2u);
  }
  if (*(_DWORD *)(a1 + 488) == 20)
  {
    if (!sub_100006674(a1, a2))
    {
      CFNumberRef v6 = EAPLogGetLogHandle();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v6, v7))
      {
        *(_WORD *)CFStringRef v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "failed to process EAP configuration from MIB", v11, 2u);
      }
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
      *(void *)CFStringRef v11 = MutableCopy;
      *(unsigned char *)(a1 + 500) = 0;
      sub_1000048E8(a1, MutableCopy, 0);
      my_CFRelease();
    }
  }
  else
  {
    unsigned int v9 = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)CFStringRef v11 = 136315138;
      *(void *)&v11[4] = "OtherInputRequired";
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "supplicant's last status is not %s", v11, 0xCu);
    }
  }
}

void sub_1000098D8(uint64_t a1, CFTypeRef *a2)
{
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v5, "factory_ota_access_callback", buf, 2u);
  }
  if (*(_DWORD *)(a1 + 488) == 20)
  {
    if (a2)
    {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
      *(void *)buf = MutableCopy;
      if (*a2) {
        *(void *)(a1 + 104) = CFRetain(*a2);
      }
      *(void *)(a1 + 112) = CFRetain(a2[1]);
      sub_1000048E8(a1, MutableCopy, 0);
      my_CFRelease();
      sub_1000061B4(a1);
    }
    else
    {
      unsigned int v9 = EAPLogGetLogHandle();
      os_log_type_t v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)os_log_type_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "received NULL EAP configuration from MIB", v14, 2u);
      }
      CFStringRef v11 = EAPLogGetLogHandle();
      os_log_type_t v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "failed to process EAP configuration from Factory OTA", buf, 2u);
      }
      CFDictionaryRef v13 = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
      *(void *)buf = v13;
      *(unsigned char *)(a1 + 501) = 0;
      sub_1000048E8(a1, v13, 0);
      my_CFRelease();
    }
  }
  else
  {
    os_log_type_t v7 = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "OtherInputRequired";
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "supplicant's last status is not %s", buf, 0xCu);
    }
  }
}

void sub_100009B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a4 + 224) && EAPOLClientItemIDGetProfileID())
  {
    uint64_t v5 = EAPOLClientConfigurationCreateWithAuthorization();
    if (v5)
    {
      CFNumberRef v6 = (const void *)v5;
      if (!EAPOLClientConfigurationGetProfileWithID())
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v8 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v8))
        {
          uint64_t v9 = sub_10000B88C(*(void *)(a4 + 24), 0);
          int v12 = 136315138;
          uint64_t v13 = v9;
          _os_log_impl((void *)&_mh_execute_header, LogHandle, v8, "%s: profile no longer exists, stopping", (uint8_t *)&v12, 0xCu);
        }
        sub_10000B88C(*(void *)(a4 + 24), 0);
        EAPOLControlStop();
      }
      CFRelease(v6);
    }
    else
    {
      os_log_type_t v10 = EAPLogGetLogHandle();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "EAPOLClientConfiguration() failed", (uint8_t *)&v12, 2u);
      }
    }
  }
}

BOOL sub_100009C74(const __CFDictionary *a1, const void *a2, int a3)
{
  if (a1)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        a3 = CFBooleanGetValue(Value);
      }
    }
  }
  return a3 != 0;
}

void *sub_100009CD8(const __CFData *a1)
{
  int Length = CFDataGetLength(a1);
  os_log_type_t v3 = malloc_type_malloc(Length + 1, 0x3941B928uLL);
  BytePtr = CFDataGetBytePtr(a1);
  memmove(v3, BytePtr, Length);
  *((unsigned char *)v3 + Length) = 0;
  return v3;
}

CFArrayRef sub_100009D40(const __CFArray *result)
{
  if (result)
  {
    CFArrayRef v1 = result;
    CFIndex Count = CFArrayGetCount(result);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v3 = Count;
      CFIndex v4 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
        int valuePtr = 0;
        CFTypeID TypeID = CFNumberGetTypeID();
        if (ValueAtIndex)
        {
          if (CFGetTypeID(ValueAtIndex) == TypeID
            && CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr)
            && valuePtr == 13)
          {
            break;
          }
        }
        if (v3 == ++v4) {
          return 0;
        }
      }
      return (const __CFArray *)1;
    }
  }
  return result;
}

BOOL sub_100009DFC(uint64_t a1)
{
  int v15 = 0;
  if (*(void *)(a1 + 280))
  {
    *(void *)buf = EAPClientModulePluginCopyIdentity();
    if (*(void *)buf)
    {
      uint64_t v2 = (const char *)my_CFStringToCString();
      my_CFRelease();
      if (v2)
      {
        CFIndex v3 = *(void **)(a1 + 144);
        if (v3) {
          free(v3);
        }
        *(void *)(a1 + 144) = v2;
        *(_DWORD *)(a1 + 152) = strlen(v2);
        *(unsigned char *)(a1 + 172) = 1;
      }
    }
  }
  uint64_t v4 = *(void *)(a1 + 144);
  if (v4)
  {
    uint64_t v5 = 136;
    if (*(void *)(a1 + 128))
    {
      uint64_t v6 = *(void *)(a1 + 128);
    }
    else
    {
      uint64_t v5 = 152;
      uint64_t v6 = *(void *)(a1 + 144);
    }
    int v7 = *(_DWORD *)(a1 + v5);
    if (sub_10000ED34(1))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v9))
      {
        *(_DWORD *)buf = 68157954;
        *(_DWORD *)&uint8_t buf[4] = v7;
        __int16 v17 = 2080;
        uint64_t v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v9, "EAP Response Identity %.*s", buf, 0x12u);
      }
    }
    os_log_type_t v10 = (uint8_t *)EAPPacketCreate();
    if ((sub_10000B914(*(void *)(a1 + 24), 0, v10, v15) & 0x80000000) != 0)
    {
      os_log_type_t v11 = EAPLogGetLogHandle();
      os_log_type_t v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)os_log_type_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "EAPOLSocketTransmit failed", v14, 2u);
      }
    }
    if (v10 != buf) {
      free(v10);
    }
  }
  return v4 != 0;
}

void sub_10000A004(uint64_t a1, int a2, uint64_t *a3)
{
  switch(a2)
  {
    case 2:
      sub_100006D60(a1, 0, 0);
      break;
    case 1:
      uint64_t v10 = *a3;
      if (!*(unsigned char *)(*a3 + 1) && *(unsigned char *)(v10 + 4) == 1)
      {
        int v11 = *(unsigned __int8 *)(v10 + 8);
        if (v11 == 2)
        {
          sub_10000A268(*(_DWORD *)a1, v10 + 4);
          sub_10000A3A0(a1);
        }
        else if (v11 == 1)
        {
          sub_100006F68(a1, 0, a3);
        }
        else
        {
          sub_100008AC8(a1, 0, a3);
        }
      }
      break;
    case 0:
      uint64_t v4 = dword_100018870;
      if (sub_10000B8A4(*(void *)(a1 + 24)))
      {
        sub_10000BED0(*(void *)(a1 + 24), 0, 0);
        *(unsigned char *)(a1 + 496) = 0;
      }
      sub_10000B90C(*(void *)(a1 + 24));
      sub_10000ABBC(*(void *)(a1 + 16));
      *(_DWORD *)a1 = 5;
      sub_100008E8C((unsigned int *)a1);
      *(_DWORD *)(a1 + 120) = -1;
      *(_DWORD *)(a1 + 204) = 0;
      int v5 = *(_DWORD *)(a1 + 488);
      if (v5 == 1 || v5 == 1001 && ((int v6 = *(_DWORD *)(a1 + 492), v6 == -50) || v6 == -9809))
      {
        if ((*(void *)(a1 + 280) || *(unsigned char *)(a1 + 498)) && !*(unsigned char *)(a1 + 497))
        {
          *(unsigned char *)(a1 + 176) = 1;
          my_CFRelease();
          *(unsigned char *)(a1 + 175) = 1;
          int v7 = *(void **)(a1 + 144);
          if (v7)
          {
            free(v7);
            *(void *)(a1 + 144) = 0;
          }
          *(_DWORD *)(a1 + 152) = 0;
          *(unsigned char *)(a1 + 172) = 0;
          *(unsigned char *)(a1 + 174) = 1;
          os_log_type_t v8 = *(void **)(a1 + 160);
          if (v8)
          {
            free(v8);
            *(void *)(a1 + 160) = 0;
          }
          *(_DWORD *)(a1 + 168) = 0;
        }
      }
      *(void *)(a1 + 488) = 0;
      sub_100008978(a1);
      sub_100004508(a1);
      sub_10000B900(*(void **)(a1 + 24), (uint64_t)sub_10000A004, a1, 1);
      os_log_type_t v9 = *(CFRunLoopTimerRef **)(a1 + 16);
      sub_10000AC14(v9, v4, 0, (__CFRunLoopTimer *)sub_10000A004, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0);
      break;
  }
}

uint64_t sub_10000A268(unsigned int a1, uint64_t a2)
{
  unsigned int Length = EAPPacketGetLength();
  if (Length < 6) {
    CFStringRef v5 = 0;
  }
  else {
    CFStringRef v5 = CFStringCreateWithBytes(0, (const UInt8 *)(a2 + 5), Length - 5, 0x8000100u, 0);
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v7))
  {
    if (a1 > 8) {
      os_log_type_t v8 = "<unknown>";
    }
    else {
      os_log_type_t v8 = off_100014928[a1];
    }
    CFStringRef v9 = &stru_100014DB0;
    if (v5) {
      CFStringRef v9 = v5;
    }
    *(_DWORD *)buf = 136315394;
    os_log_type_t v12 = v8;
    __int16 v13 = 2112;
    CFStringRef v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "%s: Notification '%@'", buf, 0x16u);
  }
  return my_CFRelease();
}

void sub_10000A3A0(uint64_t a1)
{
  char v10 = 0;
  int v8 = 0;
  int v9 = 0;
  if (sub_10000ED34(1))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "EAP Response Notification", buf, 2u);
    }
  }
  EAPPacketCreate();
  if ((sub_10000B914(*(void *)(a1 + 24), 0, &v9, 5) & 0x80000000) != 0)
  {
    uint64_t v4 = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "EAPOLSocketTransmit notification failed", v6, 2u);
    }
  }
}

void sub_10000A4BC(int a1, uint64_t a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = EAPTypeStr();
      CFStringAppendFormat(Mutable, 0, @"%s(%d) ", v6, *(unsigned int *)(*(void *)a2 + 4 * v5++));
    }
    while (v5 < *(int *)(a2 + 8));
  }
  if (CFStringGetLength(Mutable) >= 1 && sub_10000ED34(1))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_DWORD *)buf = 67109378;
      int v10 = a1;
      __int16 v11 = 2112;
      CFMutableStringRef v12 = Mutable;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v8, "EAP Request: NAK'ing EAP type %d with %@", buf, 0x12u);
    }
  }
  CFRelease(Mutable);
}

void sub_10000A60C(uint64_t a1, uint64_t a2, int a3)
{
  int v10 = 0;
  if (a3)
  {
    uint64_t v4 = EAPPacketCreate();
    uint64_t v5 = (char *)v4;
    if (*(int *)(a1 + 200) >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        *(unsigned char *)(v4 + v6 + 5) = *(_DWORD *)(*(void *)(a1 + 192) + 4 * v6);
        ++v6;
      }
      while (v6 < *(int *)(a1 + 200));
    }
  }
  else
  {
    uint64_t v5 = (char *)EAPPacketCreate();
    v5[5] = 0;
  }
  if ((sub_10000B914(*(void *)(a1 + 24), 0, v5, v10) & 0x80000000) != 0)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v8, "EAPOLSocketTransmit nak failed", v9, 2u);
    }
  }
  if (v5 != &v11) {
    free(v5);
  }
}

uint64_t sub_10000A76C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 456) = 0;
  *(void *)(a1 + 464) = 0;
  if (*(void *)(a1 + 280))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "already initialized", v8, 2u);
    }
  }
  else
  {
    uint64_t result = EAPClientModuleLookup();
    if (!result) {
      return result;
    }
    uint64_t v7 = result;
    my_CFRelease();
    my_CFRelease();
    *(void *)(a1 + 432) = 0;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(void *)(a1 + 312) = sub_10000B88C(*(void *)(a1 + 24), (_DWORD *)(a1 + 320));
    *(_DWORD *)(a1 + 304) = sub_10000B8E8() - 4;
    *(void *)(a1 + 328) = *(void *)(a1 + 144);
    *(_DWORD *)(a1 + 336) = *(_DWORD *)(a1 + 152);
    *(void *)(a1 + 352) = *(void *)(a1 + 160);
    *(_DWORD *)(a1 + 360) = *(_DWORD *)(a1 + 168);
    sub_10000AA28(a1);
    *(void *)(a1 + 384) = *(void *)(a1 + 184);
    *(unsigned char *)(a1 + 296) = (sub_10000EBF8() & 0x1000) == 0;
    *(unsigned char *)(a1 + 376) = sub_10000C5CC(*(void *)(a1 + 24)) == 3;
    *(_DWORD *)(a1 + 488) = EAPClientModulePluginInit();
    *(void *)(a1 + 464) = EAPClientModulePluginEAPName();
    *(_DWORD *)(a1 + 456) = a2;
    if (*(_DWORD *)(a1 + 488)) {
      return 0;
    }
    *(void *)(a1 + 280) = v7;
  }
  return 1;
}

void sub_10000A900(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 472);
  if (v2 != *(void **)a2)
  {
    *(void *)(a1 + 472) = 0;
    *(void *)(a1 + 480) = 0;
    uint64_t v5 = malloc_type_malloc(*(unsigned int *)(a2 + 8), 0xE5D94C0FuLL);
    *(void *)(a1 + 472) = v5;
    *(_DWORD *)(a1 + 480) = *(_DWORD *)(a2 + 8);
    memmove(v5, *(const void **)a2, *(unsigned int *)(a2 + 8));
    if (v2)
    {
      free(v2);
    }
  }
}

uint64_t sub_10000A994(uint64_t result)
{
  if (!*(unsigned char *)(result + 496))
  {
    uint64_t v1 = result;
    uint64_t result = EAPClientModulePluginMasterSessionKeyCopyBytes();
    if (result)
    {
      uint64_t result = sub_10000BED0(*(void *)(v1 + 24), (uint64_t)v2, result);
      if (result) {
        *(unsigned char *)(v1 + 496) = 1;
      }
    }
  }
  return result;
}

CFTypeRef sub_10000AA28(uint64_t a1)
{
  my_CFRelease();
  CFBooleanRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"TLSTrustExceptionsDomain");
  os_log_type_t v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"TLSTrustExceptionsID");
  if (Value) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = sub_10000B8CC(*(void *)(a1 + 24));
    if (v5)
    {
      CFStringRef v6 = (CFStringRef)v5;
      CFStringRef v7 = @"WirelessSSID";
    }
    else
    {
      CFStringRef v6 = *(CFStringRef *)(a1 + 88);
      if (v6)
      {
        CFStringRef v7 = @"ProfileID";
      }
      else
      {
        int v9 = (const char *)sub_10000B88C(*(void *)(a1 + 24), 0);
        CFStringRef v6 = CFStringCreateWithCString(0, v9, 0x600u);
        CFStringRef v7 = @"NetworkInterfaceName";
      }
    }
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 48));
    CFDictionarySetValue(MutableCopy, @"TLSTrustExceptionsDomain", v7);
    CFDictionarySetValue(MutableCopy, @"TLSTrustExceptionsID", v6);
    *(void *)(a1 + 368) = MutableCopy;
    return (CFTypeRef)my_CFRelease();
  }
  else
  {
    CFTypeRef result = CFRetain(*(CFTypeRef *)(a1 + 48));
    *(void *)(a1 + 368) = result;
  }
  return result;
}

double sub_10000AB44()
{
  uint64_t v0 = malloc_type_malloc(0x30uLL, 0x1080040A1D151D1uLL);
  if (v0)
  {
    double result = 0.0;
    v0[1] = 0u;
    v0[2] = 0u;
    _OWORD *v0 = 0u;
  }
  return result;
}

void sub_10000AB80(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  if (*a1)
  {
    sub_10000ABBC(*a1);
    free(v1);
    *a1 = 0;
  }
}

uint64_t sub_10000ABBC(uint64_t result)
{
  if (result)
  {
    *(unsigned char *)(result + 40) = 0;
    *(void *)double result = 0;
    double result = *(void *)(result + 32);
    if (result)
    {
      CFRunLoopTimerInvalidate((CFRunLoopTimerRef)result);
      return my_CFRelease();
    }
  }
  return result;
}

uint64_t sub_10000AC14(CFRunLoopTimerRef *a1, uint64_t a2, int a3, __CFRunLoopTimer *a4, __CFRunLoopTimer *a5, __CFRunLoopTimer *a6, __CFRunLoopTimer *a7)
{
  memset(&v23, 0, sizeof(v23));
  if (!a1) {
    return 0;
  }
  sub_10000ABBC((uint64_t)a1);
  *((unsigned char *)a1 + 40) = 0;
  if (!a4) {
    return 0;
  }
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a7;
  uint64_t v14 = 1;
  *((unsigned char *)a1 + 40) = 1;
  BOOL v15 = a2 < 1;
  BOOL v16 = a3 < 1000;
  double Current = CFAbsoluteTimeGetCurrent();
  double v18 = 0.0;
  if (!v15 || !v16) {
    double v18 = (double)a2;
  }
  double v19 = v18 + Current;
  double v20 = (double)a3 / 1000000.0;
  if (v15 && v16) {
    double v20 = 0.001;
  }
  v23.info = a1;
  a1[4] = CFRunLoopTimerCreate(0, v20 + v19, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_10000AD3C, &v23);
  os_log_type_t v21 = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(v21, a1[4], kCFRunLoopDefaultMode);
  return v14;
}

uint64_t sub_10000AD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void, void))a2;
  if (*(void *)a2)
  {
    if (*(unsigned char *)(a2 + 40))
    {
      *(unsigned char *)(a2 + 40) = 0;
      return v2(*(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
    }
  }
  return result;
}

void sub_10000AD64(uint64_t a1, uint64_t a2)
{
  if (qword_1000188A8 != -1) {
    dispatch_once(&qword_1000188A8, &stru_1000149D0);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000AE28;
  v5[3] = &unk_1000149B0;
  v5[4] = a1;
  v5[5] = a2;
  [(id)qword_1000188B0 eapConfigurationWithCompletion:v5];
}

void sub_10000AE28(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = a3;
      CFStringRef v7 = "failed to fetch EAP configuration from MIB, error: %@";
      os_log_type_t v8 = LogHandle;
      os_log_type_t v9 = v6;
      uint32_t v10 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
    }
LABEL_15:
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  if (!a2) {
    goto LABEL_15;
  }
  CFTypeID v12 = CFGetTypeID(objc_msgSend(objc_msgSend(a2, "tlsCertificateChain"), "firstObject"));
  if (v12 != SecCertificateGetTypeID())
  {
    BOOL v16 = EAPLogGetLogHandle();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v16, v17)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    CFStringRef v7 = "received invalid client certificate from MIB";
LABEL_13:
    os_log_type_t v8 = v16;
    os_log_type_t v9 = v17;
    uint32_t v10 = 2;
    goto LABEL_14;
  }
  CFTypeID v13 = CFGetTypeID([a2 tlsKey]);
  if (v13 != SecKeyGetTypeID())
  {
    BOOL v16 = EAPLogGetLogHandle();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v16, v17)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    CFStringRef v7 = "received invalid client private key from MIB";
    goto LABEL_13;
  }
  uint64_t v14 = malloc_type_malloc(0x10uLL, 0x600405C6656D0uLL);
  *uint64_t v14 = 0;
  v14[1] = 0;
  objc_msgSend(objc_msgSend(a2, "tlsCertificateChain"), "firstObject");
  [a2 tlsKey];
  v14[1] = SecIdentityCreate();
  if ((unint64_t)objc_msgSend(objc_msgSend(a2, "tlsCertificateChain"), "count") >= 2)
  {
    CFDictionaryRef MutableCopy = CFArrayCreateMutableCopy(0, (CFIndex)objc_msgSend(objc_msgSend(a2, "tlsCertificateChain"), "count"), (CFArrayRef)objc_msgSend(a2, "tlsCertificateChain"));
    CFArrayRemoveValueAtIndex(MutableCopy, 0);
    *uint64_t v14 = MutableCopy;
  }
LABEL_16:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B0C4;
  block[3] = &unk_100014990;
  long long v19 = *(_OWORD *)(a1 + 32);
  double v20 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void *sub_10000B0C4(void *result)
{
  uint64_t v1 = (uint64_t (*)(void, void))result[4];
  if (v1) {
    return (void *)v1(result[5], result[6]);
  }
  return result;
}

id sub_10000B0DC()
{
  if (qword_1000188A8 != -1) {
    dispatch_once(&qword_1000188A8, &stru_1000149D0);
  }
  id v1 = [(id)qword_1000188B0 isInBoxUpdateMode:0];
  return v1;
}

void sub_10000B148(id a1)
{
  qword_1000188B0 = (uint64_t)objc_alloc_init((Class)MIBUClient);
}

_OWORD *sub_10000B170(CFSocketNativeHandle a1)
{
  memset(&v7, 0, sizeof(v7));
  uint64_t v2 = malloc_type_malloc(0x30uLL, 0x10A004024772EFBuLL);
  os_log_type_t v3 = v2;
  if (v2)
  {
    v2[1] = 0u;
    v2[2] = 0u;
    _OWORD *v2 = 0u;
    v7.info = v2;
    *((_DWORD *)v2 + 4) = a1;
    BOOL v4 = CFSocketCreateWithNative(0, a1, 1uLL, (CFSocketCallBack)sub_10000B230, &v7);
    *((void *)v3 + 1) = v4;
    *(void *)os_log_type_t v3 = CFSocketCreateRunLoopSource(0, v4, 0);
    double Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)v3, kCFRunLoopDefaultMode);
  }
  return v3;
}

uint64_t sub_10000B230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = (uint64_t (*)(void, void))a5[3];
  if (v5) {
    return v5(a5[4], a5[5]);
  }
  return result;
}

void sub_10000B244(CFRunLoopSourceRef **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      if (*v2)
      {
        double Current = CFRunLoopGetCurrent();
        CFRunLoopRemoveSource(Current, *v2, kCFRunLoopDefaultMode);
        CFSocketInvalidate(v2[1]);
        CFRelease(v2[1]);
        v2[1] = 0;
        CFRelease(*v2);
      }
      free(v2);
    }
    *a1 = 0;
  }
}

void *sub_10000B2BC(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t sub_10000B2C8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t sub_10000B2D0(const __CFDictionary *a1, const void *a2, unsigned int a3)
{
  return sub_10000B2D8(a1, a2, a3, 1);
}

uint64_t sub_10000B2D8(const __CFDictionary *a1, const void *a2, unsigned int a3, int a4)
{
  unsigned int valuePtr = a3;
  CFBooleanRef Value = CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && !CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr)) {
    unsigned int valuePtr = a3;
  }
  if (a4)
  {
    if (sub_10000ED34(8))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v10))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = a2;
        __int16 v15 = 1024;
        unsigned int v16 = valuePtr;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v10, "%@ = %d", buf, 0x12u);
      }
    }
  }
  return valuePtr;
}

void sub_10000B400(const __SCPreferences *a1)
{
  if (!a1) {
    return;
  }
  CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(a1, @"MTU");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    int valuePtr = 0;
    if (!CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v13)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      os_log_type_t v8 = "com.apple.eapolclient.MTU invalid";
      os_log_type_t v9 = LogHandle;
      os_log_type_t v10 = v13;
      uint32_t v11 = 2;
      goto LABEL_10;
    }
    int v4 = valuePtr;
    uint64_t v5 = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    BOOL v7 = os_log_type_enabled(v5, v6);
    if (v4 > 575)
    {
      if (v7)
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v29 = valuePtr;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Using MTU %d", buf, 8u);
      }
      dword_1000188B8 = valuePtr;
      goto LABEL_14;
    }
    if (v7)
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)uint64_t v29 = valuePtr;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = 576;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = 1280;
      os_log_type_t v8 = "com.apple.eapolclient.MTU %d < %d, using default %d";
      os_log_type_t v9 = v5;
      os_log_type_t v10 = v6;
      uint32_t v11 = 20;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
    }
  }
LABEL_14:
  CFDictionaryRef v14 = (const __CFDictionary *)SCPreferencesGetValue(a1, @"Preauthentication");
  CFTypeID v15 = CFDictionaryGetTypeID();
  if (v14 && CFGetTypeID(v14) == v15)
  {
    CFBooleanRef v16 = (const __CFBoolean *)CFDictionaryGetValue(v14, @"EnablePreauthentication");
    CFTypeID v17 = CFBooleanGetTypeID();
    if (v16)
    {
      if (CFGetTypeID(v16) == v17) {
        LODWORD(v16) = CFBooleanGetValue(v16);
      }
      else {
        LODWORD(v16) = 0;
      }
    }
    if (sub_10000ED34(8))
    {
      double v18 = EAPLogGetLogHandle();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v18, v19))
      {
        double v20 = "false";
        if (v16 == 1) {
          double v20 = "true";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v29 = @"EnablePreauthentication";
        *(_WORD *)&v29[8] = 2080;
        os_log_type_t v30 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ = %s", buf, 0x16u);
      }
    }
    byte_1000188BC = v16 != 0;
    if (v16)
    {
      dword_100018874 = sub_10000B2D8(v14, @"ScanDelayAuthenticatedSeconds", 0xAu, 1);
      dword_100018878 = sub_10000B2D8(v14, @"ScanDelayRoamSeconds", 0xAu, 1);
      dword_10001887C = sub_10000B2D8(v14, @"ScanPeriodSeconds", 0xFFFFFFFF, 1);
      dword_100018880 = sub_10000B2D8(v14, @"NumberOfScans", 1u, 1);
    }
  }
  CFDictionaryRef v21 = (const __CFDictionary *)SCPreferencesGetValue(a1, @"Testing");
  CFTypeID v22 = CFDictionaryGetTypeID();
  if (v21 && CFGetTypeID(v21) == v22)
  {
    dword_1000188C0 = sub_10000B2D8(v21, @"TransmitPacketLossPercent", 0, 0);
    if (dword_1000188C0)
    {
      CFRunLoopTimerContext v23 = EAPLogGetLogHandle();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v29 = dword_1000188C0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Will simulate %d%% transmit packet loss", buf, 8u);
      }
    }
    dword_1000188C4 = sub_10000B2D8(v21, @"ReceivePacketLossPercent", 0, 0);
    if (dword_1000188C4)
    {
      uint64_t v25 = EAPLogGetLogHandle();
      os_log_type_t v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v29 = dword_1000188C4;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Will simulate %d%% receive packet loss", buf, 8u);
      }
    }
  }
}

uint64_t sub_10000B88C(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    *a2 = *(_DWORD *)(v2 + 24);
  }
  return v2 + 8;
}

uint64_t sub_10000B8A4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 64);
}

BOOL sub_10000B8B0(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  return *(unsigned char *)(v5 + 64) && sub_10000EED8(*(void *)(v5 + 88), a2, a3, a4, a5);
}

uint64_t sub_10000B8CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 64)) {
    return *(void *)(v1 + 96);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000B8E8()
{
  if (dword_1000188B8) {
    return dword_1000188B8;
  }
  else {
    return 1280;
  }
}

void *sub_10000B900(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

uint64_t sub_10000B90C(uint64_t result)
{
  *(void *)(result + 8) = 0;
  return result;
}

uint64_t sub_10000B914(uint64_t a1, int a2, const void *a3, int a4)
{
  unsigned __int8 v6 = a2;
  if (a2)
  {
    os_log_type_t v8 = *(void **)(a1 + 56);
    if (v8) {
      free(v8);
    }
    *(void *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 64) = 0;
  }
  else
  {
    sub_10000B998(a1, a3, a4);
  }
  uint64_t v9 = *(void *)(a1 + 32);

  return sub_10000BA0C(v9, (ether_addr *)a1, v6, (uint64_t)a3, a4);
}

void sub_10000B998(uint64_t a1, const void *a2, int a3)
{
  unsigned __int8 v6 = *(void **)(a1 + 56);
  if (v6) {
    free(v6);
  }
  if (a2)
  {
    BOOL v7 = malloc_type_malloc(a3, 0x9F778415uLL);
    *(void *)(a1 + 56) = v7;
    memmove(v7, a2, a3);
  }
  else
  {
    a3 = 0;
    *(void *)(a1 + 56) = 0;
  }
  *(_DWORD *)(a1 + 64) = a3;
}

uint64_t sub_10000BA0C(uint64_t a1, ether_addr *a2, unsigned __int8 a3, uint64_t a4, int a5)
{
  if (a4) {
    int v9 = a5;
  }
  else {
    int v9 = 0;
  }
  if (a4) {
    int64_t v10 = (a5 + 18);
  }
  else {
    int64_t v10 = 18;
  }
  __memset_chk();
  if (*(ether_addr **)(a1 + 144) == a2)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      if (!*(unsigned char *)(a1 + 110))
      {
        sub_10000DE74(a1, 0);
        if (!*(unsigned char *)(a1 + 110))
        {
          if (!sub_10000ED34(1)) {
            return 0xFFFFFFFFLL;
          }
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v33 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v33)) {
            return 0xFFFFFFFFLL;
          }
          *(_DWORD *)os_log_type_t v36 = 67109120;
          *(_DWORD *)&v36[4] = v9 + 4;
          BOOL v27 = "Transmit: unknown BSSID, not sending %d bytes";
          os_log_type_t v28 = v36;
          uint64_t v29 = LogHandle;
          os_log_type_t v30 = v33;
          uint32_t v31 = 8;
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v29, v30, v27, v28, v31);
          return 0xFFFFFFFFLL;
        }
      }
      a2 = (ether_addr *)(a1 + 104);
      __int16 v11 = -29048;
    }
    else
    {
      __int16 v11 = -29048;
      a2 = (ether_addr *)&dword_1000112D8;
    }
  }
  else
  {
    __int16 v11 = -14456;
  }
  ether_addr v37 = *a2;
  __int16 v40 = v11;
  int v38 = *(_DWORD *)(a1 + 28);
  __int16 v39 = *(_WORD *)(a1 + 32);
  v41[0] = 1;
  v41[1] = a3;
  EAPOLPacketSetLength();
  if (a4) {
    __memmove_chk();
  }
  *(void *)&v36[10] = 0;
  *(void *)&v36[2] = 0;
  *(_WORD *)os_log_type_t v36 = 6930;
  if (sub_10000ED34(16))
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    os_log_type_t v13 = ether_ntoa(&v37);
    sub_10000E1CC((uint64_t)v13, v41, (v9 + 4), 0, Mutable);
    CFStringAppendFormat(Mutable, 0, @"\n");
    EAPOLPacketIsValid();
    CFDictionaryRef v14 = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      int v34 = 138412290;
      os_log_type_t v35 = Mutable;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@", (uint8_t *)&v34, 0xCu);
    }
    CFRelease(Mutable);
  }
  else if (sub_10000ED34(1))
  {
    CFBooleanRef v16 = ether_ntoa(&v37);
    sub_10000E1CC((uint64_t)v16, v41, (v9 + 4), 0, 0);
  }
  uint32_t v17 = dword_1000188C0;
  if (!dword_1000188C0 || arc4random() / 0x28F5C28 >= v17)
  {
    int v21 = sub_10000B2C8(*(void *)(a1 + 56));
    ssize_t v22 = sendto(v21, &v37, v10, 0, (const sockaddr *)v36, 0x12u);
    uint64_t result = 0;
    if (v22 >= v10) {
      return result;
    }
    CFRunLoopTimerContext v23 = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v23, v24)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v25 = __error();
    os_log_type_t v26 = strerror(*v25);
    int v34 = 136315138;
    os_log_type_t v35 = v26;
    BOOL v27 = "EAPOLSocketSourceTransmit: sendto failed, %s";
    os_log_type_t v28 = (uint8_t *)&v34;
    uint64_t v29 = v23;
    os_log_type_t v30 = v24;
    uint32_t v31 = 12;
    goto LABEL_29;
  }
  double v18 = EAPLogGetLogHandle();
  os_log_type_t v19 = _SC_syslog_os_log_mapping();
  uint64_t result = os_log_type_enabled(v18, v19);
  if (result)
  {
    int v34 = 67109120;
    LODWORD(v35) = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Simulating transmit packet loss: dropping %d bytes", (uint8_t *)&v34, 8u);
    return 0;
  }
  return result;
}

void sub_10000BDF0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 64) && *(void *)(v1 + 144) == a1 && sub_10000F254() && sub_10000ED34(1))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "PMK cache cleared", v4, 2u);
    }
  }
}

uint64_t sub_10000BE94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 144) == a1 && *(unsigned char *)(v1 + 64) && *(unsigned char *)(v1 + 65) && *(unsigned char *)(v1 + 110)) {
    return sub_10000F25C(*(void *)(v1 + 88), (const ether_addr *)(v1 + 104));
  }
  else {
    return 0;
  }
}

BOOL sub_10000BED0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 64) || !*(unsigned char *)(v3 + 65)) {
    return 0;
  }
  unsigned __int8 v6 = (const ether_addr *)a1;
  if (*(void *)(v3 + 144) == a1)
  {
    sub_10000C0F8(*(void *)(a1 + 32));
    if (a3)
    {
      int64_t v10 = sub_10000FC78((const char *)(v3 + 8), (uint64_t)sub_10000EB1C, v3);
      *(void *)(v3 + 72) = v10;
      if (v10)
      {
        *(unsigned char *)(v3 + 68) = *(unsigned char *)(v3 + 67) ^ 1;
        *(unsigned char *)(v3 + 67) = 1;
        if (sub_10000ED34(1))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v12 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v12))
          {
            LOWORD(v15) = 0;
            _os_log_impl((void *)&_mh_execute_header, LogHandle, v12, "4-way handshake notification scheduled", (uint8_t *)&v15, 2u);
          }
        }
      }
    }
    if (sub_10000ED34(1))
    {
      os_log_type_t v13 = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        int v15 = 67109120;
        LODWORD(v16) = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "set_msk %d", (uint8_t *)&v15, 8u);
      }
    }
    unsigned __int8 v6 = 0;
  }
  else if (sub_10000ED34(1))
  {
    BOOL v7 = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      int v15 = 136315394;
      CFBooleanRef v16 = ether_ntoa(v6);
      __int16 v17 = 1024;
      int v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "set_msk %s %d", (uint8_t *)&v15, 0x12u);
    }
  }
  return sub_10000F154(*(void *)(v3 + 88), (uint64_t)v6, a2, a3);
}

void sub_10000C0F8(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 72);
  if (v2)
  {
    sub_10000FBF8(v2);
    *(void *)(a1 + 72) = 0;
    if (sub_10000ED34(1))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v4))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v4, "4-way handshake notification unscheduled", v5, 2u);
      }
    }
  }
}

uint64_t sub_10000C188(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 66);
}

void sub_10000C194(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)v1)
  {
    if (*(void *)(v1 + 144) != a1)
    {
      int v23 = 0;
      int v3 = sub_1000089AC(*(unsigned int **)(a1 + 40), &v23);
      switch(v3)
      {
        case 3:
          if (v23 != 3) {
            return;
          }
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v13 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v13)) {
            goto LABEL_19;
          }
          os_log_type_t v14 = ether_ntoa((const ether_addr *)a1);
          *(_DWORD *)buf = 136315138;
          uint64_t v25 = v14;
          BOOL v7 = "Supplicant %s Authenticating, requires user input";
          break;
        case 4:
          if (!sub_10000ED34(1)) {
            goto LABEL_19;
          }
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v13 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v13)) {
            goto LABEL_19;
          }
          int v15 = ether_ntoa((const ether_addr *)a1);
          *(_DWORD *)buf = 136315138;
          uint64_t v25 = v15;
          BOOL v7 = "Supplicant %s Authenticated - Complete";
          break;
        case 5:
          os_log_type_t v4 = EAPLogGetLogHandle();
          os_log_type_t v5 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v4, v5)) {
            goto LABEL_19;
          }
          unsigned __int8 v6 = ether_ntoa((const ether_addr *)a1);
          *(_DWORD *)buf = 136315394;
          uint64_t v25 = v6;
          __int16 v26 = 1024;
          int v27 = v23;
          BOOL v7 = "Supplicant %s Held, status %d";
          os_log_type_t v8 = v4;
          os_log_type_t v9 = v5;
          uint32_t v10 = 18;
          goto LABEL_18;
        default:
          return;
      }
      os_log_type_t v8 = LogHandle;
      os_log_type_t v9 = v13;
      uint32_t v10 = 12;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
LABEL_19:
      *(unsigned char *)(a1 + 48) = 1;
      *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
      return;
    }
    int v23 = 0;
    int v11 = sub_1000089AC(*(unsigned int **)(a1 + 40), &v23);
    switch(v11)
    {
      case 4:
        if (!*(unsigned char *)(v1 + 67))
        {
          sub_10000C0F8(v1);
          sub_10000C538((void *)v1);
          *(unsigned char *)(v1 + 67) = 1;
        }
        break;
      case 5:
        sub_10000C0F8(v1);
        *(unsigned char *)(v1 + 67) = 0;
        sub_10000C538((void *)v1);
        break;
      case 6:
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 64)) {
          *(unsigned char *)(v1 + 68) = 1;
        }
        break;
      case 7:
        sub_10000C0F8(v1);
        *(unsigned char *)(v1 + 67) = 0;
        break;
      default:
        break;
    }
    int v16 = EAPOLClientReportStatus();
    if (v16)
    {
      int v17 = v16;
      int v18 = EAPLogGetLogHandle();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v18, v19))
      {
        double v20 = strerror(v17);
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "EAPOLClientReportStatus failed: %s", buf, 0xCu);
      }
    }
    if (byte_1000188BC)
    {
      uint64_t v21 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v21 + 64))
      {
        if (v11 == 4)
        {
          if ((dword_100018874 & 0x80000000) == 0) {
            sub_10000AC14(*(CFRunLoopTimerRef **)(v21 + 128), dword_100018874, 0, (__CFRunLoopTimer *)sub_10000E66C, *(__CFRunLoopTimer **)(a1 + 32), 0, 0);
          }
        }
        else
        {
          sub_10000ABBC(*(void *)(v21 + 128));
          sub_10000F38C(*(void *)(v21 + 88));
          for (uint64_t i = *(void *)(*(void *)(a1 + 32) + 152); i; uint64_t i = *(void *)(i + 72))
          {
            *(unsigned char *)(i + 48) = 1;
            *(unsigned char *)(*(void *)(i + 32) + 120) = 1;
          }
        }
      }
    }
  }
}

void *sub_10000C538(void *result)
{
  if (*result)
  {
    if (sub_10000ED34(1))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v2 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v2))
      {
        *(_WORD *)int v3 = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v2, "force renew", v3, 2u);
      }
    }
    return (void *)EAPOLClientForceRenew();
  }
  return result;
}

uint64_t sub_10000C5CC(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 172);
}

uint64_t sub_10000C5D8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 64))
    {
      uint64_t result = LinkAddresses_create();
      if (result)
      {
        os_log_type_t v2 = (char *)(v1 + 8);
        uint64_t v3 = LinkAddresses_lookup();
        if (v3)
        {
          uint64_t v4 = v3;
          int v5 = *(unsigned __int8 *)(v3 + 4);
          LogHandle = EAPLogGetLogHandle();
          if (v5 == 6)
          {
            os_log_type_t v7 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v7))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v21 = ether_ntoa((const ether_addr *)(v1 + 28));
              _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "current local MAC address: [%s]", buf, 0xCu);
            }
            uint64_t v8 = v4 + *(unsigned __int8 *)(v4 + 5);
            __int16 v9 = *(_WORD *)(v8 + 12);
            *(_DWORD *)(v1 + 28) = *(_DWORD *)(v8 + 8);
            uint64_t v10 = v1 + 28;
            *(_WORD *)(v10 + 4) = v9;
            int v11 = EAPLogGetLogHandle();
            os_log_type_t v12 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v11, v12)) {
              return LinkAddresses_free();
            }
            os_log_type_t v13 = ether_ntoa((const ether_addr *)v10);
            *(_DWORD *)buf = 136315138;
            uint64_t v21 = v13;
            os_log_type_t v14 = "new local MAC address: [%s]";
            int v15 = v11;
            os_log_type_t v16 = v12;
            goto LABEL_14;
          }
          os_log_type_t v19 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v19))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v21 = v2;
            os_log_type_t v14 = "interface '%s' is not ethernet";
            int v15 = LogHandle;
            os_log_type_t v16 = v19;
            goto LABEL_14;
          }
        }
        else
        {
          int v17 = EAPLogGetLogHandle();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v21 = v2;
            os_log_type_t v14 = "interface '%s' does not exist";
            int v15 = v17;
            os_log_type_t v16 = v18;
LABEL_14:
            _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, 0xCu);
          }
        }
        return LinkAddresses_free();
      }
    }
  }
  return result;
}

char *sub_10000C7F4(const char *a1, uint64_t a2, void *a3)
{
  v57[0] = 0;
  int __errnum = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  *a3 = 0;
  BOOL v5 = sub_10000ED48(a1, &v54);
  memset(&v60, 0, sizeof(v60));
  if (fstat(0, &v60) || (v60.st_mode & 0xF000) != 0xC000)
  {
    CFSocketNativeHandle v6 = eapol_socket();
    if (v6 == -1)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v15))
      {
        os_log_type_t v16 = __error();
        int v17 = strerror(*v16);
        v60.st_dev = 136315394;
        *(void *)&v60.st_mode = a1;
        WORD2(v60.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v60.st_ino + 6) = (__darwin_ino64_t)v17;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v15, "eapol_socket(%s) failed, %s", (uint8_t *)&v60, 0x16u);
      }
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      CFRunLoopObserverRef v12 = 0;
      CFSocketNativeHandle v6 = -1;
      goto LABEL_20;
    }
  }
  else
  {
    CFSocketNativeHandle v6 = 0;
  }
  os_log_type_t v7 = (CFRunLoopSourceRef *)sub_10000B170(v6);
  v57[0] = v7;
  if (!v7)
  {
    os_log_type_t v18 = EAPLogGetLogHandle();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      LOWORD(v60.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "FDHandler_create failed", (uint8_t *)&v60, 2u);
    }
    uint64_t v8 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  __int16 v9 = (char *)malloc_type_malloc(0xB0uLL, 0x10E0040888D9ED5uLL);
  if (!v9)
  {
    double v20 = EAPLogGetLogHandle();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      LOWORD(v60.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "malloc failed", (uint8_t *)&v60, 2u);
    }
LABEL_19:
    uint64_t v10 = 0;
    CFRunLoopObserverRef v12 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  long long v11 = 0uLL;
  *((_OWORD *)v9 + 9) = 0u;
  *((_OWORD *)v9 + 10) = 0u;
  *((_OWORD *)v9 + 7) = 0u;
  *((_OWORD *)v9 + 8) = 0u;
  *((_OWORD *)v9 + 5) = 0u;
  *((_OWORD *)v9 + 6) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *(_OWORD *)__int16 v9 = 0u;
  if (v5)
  {
    *(void *)&v60.st_dev = 0;
    memset(&v60.st_uid, 0, 24);
    v60.st_ino = (__darwin_ino64_t)v9;
    CFRunLoopObserverRef v12 = CFRunLoopObserverCreate(0, 0x20uLL, 1u, 0, (CFRunLoopObserverCallBack)sub_10000CEBC, (CFRunLoopObserverContext *)&v60);
    if (v12)
    {
      sub_10000AB44();
      uint64_t v55 = v13;
      if (v13)
      {
        uint64_t v53 = v13;
        long long v11 = 0uLL;
        goto LABEL_33;
      }
      int v38 = EAPLogGetLogHandle();
      os_log_type_t v39 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v38, v39)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      __int16 v40 = "Timer_create failed";
    }
    else
    {
      int v38 = EAPLogGetLogHandle();
      os_log_type_t v39 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v38, v39)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      __int16 v40 = "CFRunLoopObserverCreate failed";
    }
    int v49 = buf;
    os_log_type_t v50 = v38;
    os_log_type_t v51 = v39;
    uint32_t v52 = 2;
    goto LABEL_51;
  }
  uint64_t v53 = 0;
  CFRunLoopObserverRef v12 = 0;
LABEL_33:
  *(void *)&v60.st_dev = v11;
  *(_OWORD *)&v60.st_uid = v11;
  v60.st_atimespec.tv_sec = 0;
  v60.st_ino = (__darwin_ino64_t)v10;
  SCDynamicStoreRef v23 = SCDynamicStoreCreate(0, @"EAPOLClient", (SCDynamicStoreCallBack)sub_10000CEF0, (SCDynamicStoreContext *)&v60);
  if (v23)
  {
    os_log_type_t v24 = v23;
    CFMutableStringRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    BOOL v26 = v5;
    v59 = Mutable;
    int v27 = &kSCEntNetAirPort;
    if (!v5) {
      int v27 = &kSCEntNetLink;
    }
    CFStringRef v58 = SCDynamicStoreKeyCreate(0, @"%@/%@/%@/%s/%@", kSCDynamicStoreDomainState, kSCCompNetwork, kSCCompInterface, a1, *v27);
    CFArrayAppendValue(Mutable, v58);
    my_CFRelease();
    SCDynamicStoreSetNotificationKeys(v24, Mutable, 0);
    my_CFRelease();
    CFRunLoopSourceRef RunLoopSource = (CFRunLoopSourceRef *)SCDynamicStoreCreateRunLoopSource(0, v24, 0);
    v57[1] = RunLoopSource;
    double Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)RunLoopSource, kCFRunLoopDefaultMode);
    my_CFRelease();
    *((void *)v10 + 19) = 0;
    *((void *)v10 + 20) = v10 + 152;
    __strlcpy_chk();
    *((_DWORD *)v10 + 6) = strlen(v10 + 8);
    __int16 v30 = *(_WORD *)(a2 + 4);
    *((_DWORD *)v10 + 7) = *(_DWORD *)a2;
    *((_WORD *)v10 + 16) = v30;
    *((void *)v10 + 7) = v8;
    *((void *)v10 + 17) = v24;
    v10[64] = v26;
    *((void *)v10 + 11) = v54;
    uint32_t v31 = sub_10000B2BC(v8, (uint64_t)sub_10000D0BC, (uint64_t)v10, 0);
    sub_10000CEF0((uint64_t)v31, v32, (uint64_t)v10);
    uint64_t v33 = EAPOLClientAttach();
    *(void *)uint64_t v10 = v33;
    if (!v33)
    {
      int v34 = EAPLogGetLogHandle();
      os_log_type_t v35 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v34, v35))
      {
        os_log_type_t v36 = strerror(__errnum);
        v60.st_dev = 136315394;
        *(void *)&v60.st_mode = v10 + 8;
        WORD2(v60.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v60.st_ino + 6) = (__darwin_ino64_t)v36;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "EAPOLClientAttach(%s) failed: %s", (uint8_t *)&v60, 0x16u);
      }
    }
    if (v12)
    {
      *((void *)v10 + 14) = v12;
      ether_addr v37 = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(v37, *((CFRunLoopObserverRef *)v10 + 14), kCFRunLoopDefaultMode);
    }
    *((void *)v10 + 16) = v53;
    return v10;
  }
  uint64_t v41 = EAPLogGetLogHandle();
  os_log_type_t v42 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v41, v42))
  {
    int v43 = SCError();
    CFStringRef v44 = SCErrorString(v43);
    *(_DWORD *)buf = 136315138;
    __int16 v62 = v44;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "SCDynamicStoreCreate() failed, %s", buf, 0xCu);
  }
  os_log_type_t v45 = EAPLogGetLogHandle();
  os_log_type_t v46 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v45, v46))
  {
    int v47 = SCError();
    uint32_t v48 = SCErrorString(v47);
    v60.st_dev = 136315138;
    *(void *)&v60.st_mode = v48;
    __int16 v40 = "link_event_register failed: %s";
    int v49 = (uint8_t *)&v60;
    os_log_type_t v50 = v45;
    os_log_type_t v51 = v46;
    uint32_t v52 = 12;
LABEL_51:
    _os_log_impl((void *)&_mh_execute_header, v50, v51, v40, v49, v52);
  }
LABEL_20:
  if (v54) {
    sub_10000F354(v54);
  }
  if (v10) {
    free(v10);
  }
  if (v8)
  {
    sub_10000B244(v57);
  }
  else if ((v6 & 0x80000000) == 0)
  {
    close(v6);
  }
  if (v12) {
    CFRelease(v12);
  }
  sub_10000AB80(&v55);
  return 0;
}

void sub_10000CEBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 120))
  {
    sub_10000E4E8();
    *(unsigned char *)(a3 + 120) = 0;
  }
}

void sub_10000CEF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 64))
  {
    int v4 = *(unsigned __int8 *)(a3 + 66);
    sub_10000DE74(a3, 0);
    if (v4 == *(unsigned __int8 *)(a3 + 66)) {
      return;
    }
  }
  else
  {
    int v5 = socket(2, 2, 0);
    if (v5 < 0)
    {
      perror("socket");
      BOOL v8 = 0;
    }
    else
    {
      int v6 = v5;
      *(_OWORD *)buf = 0u;
      memset(v16, 0, sizeof(v16));
      __strlcpy_chk();
      BOOL v8 = ioctl(v6, 0xC02C6938uLL, buf) >= 0 && (v16[2] & 3) != 1;
      close(v6);
    }
    *(unsigned char *)(a3 + 66) = v8;
  }
  if (sub_10000ED34(1))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v10))
    {
      if (*(unsigned char *)(a3 + 66)) {
        long long v11 = "active";
      }
      else {
        long long v11 = "inactive";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v10, "link %s", buf, 0xCu);
    }
  }
  uint64_t v12 = *(void *)(a3 + 144);
  if (v12)
  {
    if (*(unsigned char *)(a3 + 66))
    {
      BOOL v13 = 1;
    }
    else
    {
      os_log_type_t v14 = *(void **)(v12 + 56);
      if (v14) {
        free(v14);
      }
      *(void *)(v12 + 56) = 0;
      *(_DWORD *)(v12 + 64) = 0;
      uint64_t v12 = *(void *)(a3 + 144);
      BOOL v13 = *(unsigned char *)(a3 + 66) != 0;
    }
    sub_100007DA8(*(void *)(v12 + 40), v13);
  }
}

void sub_10000D0BC(uint64_t a1)
{
  int v2 = sub_10000B2C8(*(void *)(a1 + 56));
  ssize_t v3 = recv(v2, &v47, 0x640uLL, 0);
  uint64_t v4 = v3;
  if (v3 > 0)
  {
    if ((unint64_t)v3 <= 0xD)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v6)) {
        return;
      }
      *(_DWORD *)buf = 67109376;
      LODWORD(v46[0]) = v4;
      WORD2(v46[0]) = 1024;
      *(_DWORD *)((char *)v46 + 6) = 14;
      os_log_type_t v7 = "Packet truncated (%d < %d)";
      BOOL v8 = LogHandle;
      os_log_type_t v9 = v6;
      uint32_t v10 = 14;
      goto LABEL_28;
    }
    int v15 = v49;
    unsigned int v16 = __rev16(v49);
    if (v16 != 34958 && v16 != 35015)
    {
      uint64_t v25 = EAPLogGetLogHandle();
      os_log_type_t v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v46[0]) = v16;
        os_log_type_t v7 = "Unexpected ethertype (%02x)";
        BOOL v8 = v25;
        os_log_type_t v9 = v26;
        uint32_t v10 = 8;
        goto LABEL_28;
      }
      return;
    }
    int v18 = v3 - 14;
    if ((EAPOLPacketIsValid() & 1) == 0)
    {
      if (sub_10000ED34(1))
      {
        CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
        uint64_t v29 = ether_ntoa(&v47);
        CFStringAppendFormat(Mutable, 0, @"Ether packet: dest %s ", v29);
        __int16 v30 = ether_ntoa(&v48);
        CFStringAppendFormat(Mutable, 0, @"source %s type 0x%04x\n", v30, bswap32(v49) >> 16);
        EAPOLPacketIsValid();
        uint32_t v31 = EAPLogGetLogHandle();
        os_log_type_t v32 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v46[0]) = v4;
          WORD2(v46[0]) = 2112;
          *(void *)((char *)v46 + 6) = Mutable;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "Ignoring Receive Packet Size %d\n%@", buf, 0x12u);
        }
        CFRelease(Mutable);
      }
      return;
    }
    if (v15 == 36488)
    {
      *(ether_addr *)(a1 + 80) = v48;
      *(unsigned char *)(a1 + 86) = 1;
      if (*(unsigned char *)(a1 + 64))
      {
        if (!*(unsigned char *)(a1 + 110)
          || (*(_DWORD *)v48.octet == *(_DWORD *)(a1 + 104)
            ? (BOOL v19 = *(unsigned __int16 *)&v48.octet[4] == *(unsigned __int16 *)(a1 + 108))
            : (BOOL v19 = 0),
              !v19))
        {
          sub_10000DE74(a1, (int *)&v48);
        }
      }
    }
    *(void *)(a1 + 40) = v50;
    double v20 = (void *)(a1 + 40);
    *(_DWORD *)(a1 + 48) = v18;
    if (sub_10000ED34(16))
    {
      os_log_type_t v21 = CFStringCreateMutable(0, 0);
      ssize_t v22 = ether_ntoa(&v48);
      sub_10000E1CC((uint64_t)v22, v50, v4, 1, v21);
      CFStringAppendFormat(v21, 0, @"\n");
      EAPOLPacketIsValid();
      SCDynamicStoreRef v23 = EAPLogGetLogHandle();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412290;
        v46[0] = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@", buf, 0xCu);
      }
      CFRelease(v21);
    }
    else if (sub_10000ED34(1))
    {
      uint64_t v33 = ether_ntoa(&v48);
      sub_10000E1CC((uint64_t)v33, v50, v4, 1, 0);
    }
    if (v15 == 36488)
    {
      uint64_t v34 = *(void *)(a1 + 144);
      if (v34) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v34 = *(void *)(a1 + 152);
      if (v34)
      {
        while (*(_DWORD *)v34 != *(_DWORD *)v48.octet
             || *(unsigned __int16 *)(v34 + 4) != *(unsigned __int16 *)&v48.octet[4])
        {
          uint64_t v34 = *(void *)(v34 + 72);
          if (!v34) {
            goto LABEL_62;
          }
        }
LABEL_37:
        os_log_type_t v35 = *(unsigned __int8 **)(v34 + 56);
        if (v35)
        {
          if (v50[1]) {
            BOOL v36 = 0;
          }
          else {
            BOOL v36 = v50[4] == 1;
          }
          if (v36 && v50[5] == v35[1])
          {
            if (sub_10000ED34(1))
            {
              ether_addr v37 = EAPLogGetLogHandle();
              os_log_type_t v38 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v37, v38))
              {
                int v39 = *(_DWORD *)(v34 + 64);
                *(_DWORD *)buf = 67109120;
                LODWORD(v46[0]) = v39;
                _os_log_impl((void *)&_mh_execute_header, v37, v38, "Retransmit EAP packet %d bytes", buf, 8u);
              }
            }
            sub_10000BA0C(*(void *)(v34 + 32), (ether_addr *)v34, 0, *(void *)(v34 + 56), *(_DWORD *)(v34 + 64));
            goto LABEL_62;
          }
          free(v35);
          *(void *)(v34 + 56) = 0;
          *(_DWORD *)(v34 + 64) = 0;
        }
        uint32_t v41 = dword_1000188C4;
        if (dword_1000188C4 && arc4random() / 0x28F5C28 < v41)
        {
          os_log_type_t v42 = EAPLogGetLogHandle();
          os_log_type_t v43 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v42, v43))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v46[0]) = v18;
            _os_log_impl((void *)&_mh_execute_header, v42, v43, "Simulate receive packet loss: dropping %d bytes", buf, 8u);
          }
        }
        else
        {
          CFStringRef v44 = *(void (**)(void, void, void *))(v34 + 8);
          if (v44) {
            v44(*(void *)(v34 + 16), *(void *)(v34 + 24), v20);
          }
        }
      }
    }
LABEL_62:
    void *v20 = 0;
    return;
  }
  if (v3 < 0)
  {
    long long v11 = EAPLogGetLogHandle();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      BOOL v13 = __error();
      os_log_type_t v14 = strerror(*v13);
      *(_DWORD *)buf = 136315138;
      v46[0] = v14;
      os_log_type_t v7 = "recv failed %s";
      BOOL v8 = v11;
      os_log_type_t v9 = v12;
      uint32_t v10 = 12;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
    }
  }
}

void sub_10000D6A4(uint64_t a1, int a2, uint64_t a3)
{
  int v18 = 0;
  if (a2)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = a3 + 8;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v6, "%s: EAPOLController died", buf, 0xCu);
    }
    if (*(_DWORD *)(a3 + 172) != 1) {
LABEL_16:
    }
      exit(0);
  }
  else
  {
    int Config = EAPOLClientGetConfig();
    if (Config)
    {
      int __errnum = Config;
      os_log_type_t v7 = EAPLogGetLogHandle();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = a3 + 8;
        __int16 v22 = 2080;
        SCDynamicStoreRef v23 = strerror(__errnum);
        os_log_type_t v9 = "%s: EAPOLClientGetConfig failed, %s";
        uint32_t v10 = v7;
        os_log_type_t v11 = v8;
        uint32_t v12 = 22;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
      }
    }
    else
    {
      BOOL v13 = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v21 = a3 + 8;
        os_log_type_t v9 = "%s: EAPOLClientGetConfig returned NULL control";
        uint32_t v10 = v13;
        os_log_type_t v11 = v14;
        uint32_t v12 = 12;
        goto LABEL_12;
      }
    }
  }
  uint64_t v19 = a3;
  int v15 = EAPLogGetLogHandle();
  os_log_type_t v16 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = a3 + 8;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s STOP", buf, 0xCu);
  }
  *(unsigned char *)(a3 + 68) = 0;
  sub_100004470(*(void *)(*(void *)(a3 + 144) + 40));
  sub_10000D960(&v19);
  goto LABEL_16;
}

void sub_10000D960(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      sub_10000B244((CFRunLoopSourceRef **)(v2 + 56));
      if (*(unsigned char *)(v2 + 64)) {
        sub_10000F354(*(void *)(v2 + 88));
      }
      my_CFRelease();
      if (*(void *)(v2 + 112))
      {
        double Current = CFRunLoopGetCurrent();
        CFRunLoopRemoveObserver(Current, *(CFRunLoopObserverRef *)(v2 + 112), kCFRunLoopDefaultMode);
        my_CFRelease();
      }
      my_CFRelease();
      if (*(unsigned char *)(v2 + 68))
      {
        usleep(0x7A120u);
        sub_10000C538((void *)v2);
      }
      EAPOLClientDetach();
      sub_10000AB80((uint64_t *)(v2 + 128));
      sub_10000C0F8(v2);
      free((void *)v2);
    }
    *a1 = 0;
  }
}

uint64_t sub_10000DA2C(uint64_t a1, CFDictionaryRef theDict, _DWORD *a3)
{
  CFDictionaryRef v3 = theDict;
  int v21 = 0;
  char v20 = 0;
  int v18 = 0;
  uint64_t v19 = 0;
  *a3 = -1;
  if (!theDict)
  {
    int v8 = 0;
    goto LABEL_9;
  }
  int v17 = 0;
  CFNumberRef Value = CFDictionaryGetValue(theDict, @"Command");
  if (!sub_10000DC88(Value, &v17)) {
    goto LABEL_23;
  }
  if (v17 != 1)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v14)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = a1 + 8;
    int v15 = "%s: received stop command";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v14, v15, buf, 0xCu);
    goto LABEL_23;
  }
  os_log_type_t v6 = CFDictionaryGetValue(v3, @"Mode");
  if (v6 && !sub_10000DC88(v6, &v21))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v14)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = a1 + 8;
    int v15 = "%s: Mode property invalid";
    goto LABEL_22;
  }
  CFDictionaryRef v7 = (const __CFDictionary *)CFDictionaryGetValue(v3, @"Configuration");
  if (!v7)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v14))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = a1 + 8;
      int v15 = "%s: configuration empty";
      goto LABEL_22;
    }
LABEL_23:
    sub_10000DDEC(&v19);
    sub_100004578(&v18);
    return 0;
  }
  CFDictionaryRef v3 = v7;
  int v8 = v21;
LABEL_9:
  *(_DWORD *)(a1 + 172) = v8;
  os_log_type_t v9 = sub_10000DCF0(a1, 0);
  uint64_t v19 = v9;
  if (!v9) {
    goto LABEL_23;
  }
  uint32_t v10 = v9;
  os_log_type_t v11 = sub_1000086FC((uint64_t)v9);
  int v18 = v11;
  if (!v11) {
    goto LABEL_23;
  }
  uint64_t v12 = (uint64_t)v11;
  if ((v21 & 0xFFFFFFFE) == 2) {
    sub_100008938((uint64_t)v11);
  }
  if (v3)
  {
    sub_1000048E8(v12, v3, &v20);
    if (v20) {
      return 0;
    }
  }
  v10[5] = v12;
  return v12;
}

BOOL sub_10000DC88(const void *a1, void *a2)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  return a1 && CFGetTypeID(a1) == TypeID && CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, a2) != 0;
}

void *sub_10000DCF0(uint64_t a1, int *a2)
{
  uint64_t v4 = malloc_type_malloc(0x58uLL, 0x10A00403A3767D5uLL);
  int v5 = v4;
  if (v4)
  {
    v4[10] = 0;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    *((_OWORD *)v4 + 2) = 0u;
    *(_OWORD *)uint64_t v4 = 0u;
    v4[4] = a1;
    if (a2)
    {
      int v6 = *a2;
      *((_WORD *)v4 + 2) = *((_WORD *)a2 + 2);
      *(_DWORD *)uint64_t v4 = v6;
      CFDictionaryRef v7 = *(void **)(a1 + 160);
      v4[10] = v7;
      *CFDictionaryRef v7 = v4;
      *(void *)(a1 + 160) = v4 + 9;
      ++*(_DWORD *)(a1 + 168);
    }
    else
    {
      *(void *)(a1 + 144) = v4;
    }
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v9))
    {
      v11[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v9, "malloc failed", (uint8_t *)v11, 2u);
    }
  }
  return v5;
}

void sub_10000DDEC(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = v2[4];
      if (v2 == *(void **)(v3 + 144))
      {
        *(void *)(v3 + 144) = 0;
      }
      else
      {
        uint64_t v4 = v2[9];
        int v5 = (void *)v2[10];
        if (v4)
        {
          *(void *)(v4 + 80) = v5;
          int v5 = (void *)v2[10];
        }
        else
        {
          *(void *)(v3 + 160) = v5;
        }
        *int v5 = v4;
        --*(_DWORD *)(v3 + 168);
      }
      int v6 = (void *)v2[7];
      if (v6) {
        free(v6);
      }
      free(v2);
    }
    *a1 = 0;
  }
}

void sub_10000DE74(uint64_t a1, int *a2)
{
  if (!*(unsigned char *)(a1 + 64)) {
    return;
  }
  __int16 v23 = 0;
  int v22 = 0;
  if (sub_10000EE6C(*(void *)(a1 + 88), (uint64_t)&v22))
  {
    *(unsigned char *)(a1 + 66) = 1;
    if (a2)
    {
      if (*(unsigned char *)(a1 + 110))
      {
        if (*a2 == *(_DWORD *)(a1 + 104) && *((unsigned __int16 *)a2 + 2) == *(unsigned __int16 *)(a1 + 108))
        {
          int v5 = 0;
LABEL_34:
          *(unsigned char *)(a1 + 110) = 1;
          int v13 = *a2;
          *(_WORD *)(a1 + 108) = *((_WORD *)a2 + 2);
          *(_DWORD *)(a1 + 104) = v13;
          CFStringRef v14 = sub_10000F418();
          BOOL v15 = sub_10000EFFC() != 0;
          int v17 = (const __CFString **)(a1 + 96);
          os_log_type_t v16 = *(const void **)(a1 + 96);
          *(unsigned char *)(a1 + 65) = v15;
          if (v16 && v14 && !CFEqual(v16, v14))
          {
            sub_10000ABBC(*(void *)(a1 + 128));
            sub_10000F38C(*(void *)(a1 + 88));
          }
          my_CFRelease();
          char *v17 = v14;
          if (v5)
          {
            if (sub_10000ED34(1))
            {
              LogHandle = EAPLogGetLogHandle();
              os_log_type_t v19 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(LogHandle, v19))
              {
                if (*v17) {
                  CFStringRef v20 = *v17;
                }
                else {
                  CFStringRef v20 = @"<unknown>";
                }
                int v21 = ether_ntoa((const ether_addr *)a2);
                *(_DWORD *)buf = 138412546;
                os_log_type_t v26 = (void *)v20;
                __int16 v27 = 2080;
                os_log_type_t v28 = v21;
                _os_log_impl((void *)&_mh_execute_header, LogHandle, v19, "Associated SSID %@ BSSID %s", buf, 0x16u);
              }
            }
          }
          return;
        }
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 110)) {
        return;
      }
      a2 = &v22;
    }
    if (byte_1000188BC)
    {
      uint64_t v8 = *(void *)(a1 + 152);
      if (v8)
      {
        while (*(_DWORD *)v8 != *a2 || *(unsigned __int16 *)(v8 + 4) != *((unsigned __int16 *)a2 + 2))
        {
          uint64_t v8 = *(void *)(v8 + 72);
          if (!v8) {
            goto LABEL_30;
          }
        }
        os_log_type_t v24 = (void *)v8;
        if (sub_10000ED34(1) && sub_10000ED34(1))
        {
          uint32_t v10 = EAPLogGetLogHandle();
          os_log_type_t v11 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v10, v11))
          {
            uint64_t v12 = ether_ntoa((const ether_addr *)a2);
            *(_DWORD *)buf = 136315138;
            os_log_type_t v26 = v12;
            _os_log_impl((void *)&_mh_execute_header, v10, v11, "Removing Supplicant for %s", buf, 0xCu);
          }
        }
        sub_100004578((uint64_t **)(v8 + 40));
        sub_10000DDEC(&v24);
      }
LABEL_30:
      if (*(unsigned char *)(a1 + 110) && (dword_100018878 & 0x80000000) == 0) {
        sub_10000AC14(*(CFRunLoopTimerRef **)(a1 + 128), dword_100018878, 0, (__CFRunLoopTimer *)sub_10000E66C, (__CFRunLoopTimer *)a1, 0, 0);
      }
    }
    int v5 = 1;
    goto LABEL_34;
  }
  *(unsigned char *)(a1 + 110) = 0;
  *(unsigned char *)(a1 + 65) = 0;
  sub_10000C0F8(a1);
  if (sub_10000ED34(1))
  {
    int v6 = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Disassociated", buf, 2u);
    }
  }
  my_CFRelease();
  sub_10000ABBC(*(void *)(a1 + 128));
  sub_10000F38C(*(void *)(a1 + 88));
  *(_WORD *)(a1 + 66) = 0;
}

void sub_10000E1CC(uint64_t a1, unsigned __int8 *a2, uint64_t a3, int a4, __CFString *a5)
{
  if (a4) {
    os_log_type_t v9 = "From";
  }
  else {
    os_log_type_t v9 = "To";
  }
  if (a4) {
    uint32_t v10 = "Receive";
  }
  else {
    uint32_t v10 = "Transmit";
  }
  if (a2[1])
  {
    if (a5)
    {
      uint64_t v29 = EAPOLPacketTypeStr();
      CFStringAppendFormat(a5, 0, @"%s Packet Size %d: EAPOL %s (%d) %s %s", v10, a3, v29, a2[1], v9, a1);
      return;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v14))
    {
      uint64_t v15 = EAPOLPacketTypeStr();
      int v16 = a2[1];
      *(_DWORD *)buf = 136316418;
      uint64_t v33 = v10;
      __int16 v34 = 1024;
      int v35 = a3;
      __int16 v36 = 2080;
      uint64_t v37 = v15;
      __int16 v38 = 1024;
      int v39 = v16;
      __int16 v40 = 2080;
      uint64_t v41 = (uint64_t)v9;
      __int16 v42 = 2080;
      *(void *)os_log_type_t v43 = a1;
      int v17 = "%s Packet Size %d: EAPOL %s (%d) %s %s";
LABEL_22:
      os_log_type_t v24 = LogHandle;
      os_log_type_t v25 = v14;
      uint32_t v26 = 54;
      goto LABEL_23;
    }
  }
  else if (a2[4] - 1 > 1)
  {
    if (!a5)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v14)) {
        return;
      }
      uint64_t v27 = EAPCodeStr();
      int v28 = a2[4];
      *(_DWORD *)buf = 136316418;
      uint64_t v33 = v10;
      __int16 v34 = 1024;
      int v35 = a3;
      __int16 v36 = 2080;
      uint64_t v37 = v27;
      __int16 v38 = 1024;
      int v39 = v28;
      __int16 v40 = 2080;
      uint64_t v41 = (uint64_t)v9;
      __int16 v42 = 2080;
      *(void *)os_log_type_t v43 = a1;
      int v17 = "%s Packet Size %d: EAP %s (%d) %s %s";
      goto LABEL_22;
    }
    uint64_t v30 = EAPCodeStr();
    CFStringAppendFormat(a5, 0, @"%s Packet Size %d: EAP %s (%d) %s %s", v10, a3, v30, a2[4], v9, a1);
  }
  else
  {
    if (a5)
    {
      uint64_t v11 = EAPCodeStr();
      uint64_t v12 = a2[4];
      uint64_t v31 = EAPTypeStr();
      CFStringAppendFormat(a5, 0, @"%s Packet Size %d: EAP %s (%d) %s (%d) %s %s", v10, a3, v11, v12, v31, a2[8], v9, a1);
      return;
    }
    int v18 = EAPLogGetLogHandle();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = EAPCodeStr();
      int v21 = a2[4];
      uint64_t v22 = EAPTypeStr();
      int v23 = a2[8];
      *(_DWORD *)buf = 136316930;
      uint64_t v33 = v10;
      __int16 v34 = 1024;
      int v35 = a3;
      __int16 v36 = 2080;
      uint64_t v37 = v20;
      __int16 v38 = 1024;
      int v39 = v21;
      __int16 v40 = 2080;
      uint64_t v41 = v22;
      __int16 v42 = 1024;
      *(_DWORD *)os_log_type_t v43 = v23;
      *(_WORD *)&v43[4] = 2080;
      *(void *)&v43[6] = v9;
      __int16 v44 = 2080;
      uint64_t v45 = a1;
      int v17 = "%s Packet Size %d: EAP %s (%d) %s (%d) %s %s";
      os_log_type_t v24 = v18;
      os_log_type_t v25 = v19;
      uint32_t v26 = 70;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v24, v25, v17, buf, v26);
    }
  }
}

void sub_10000E4E8()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = (void **)((char *)&v11 - ((v1 + 15) & 0xFFFFFFFF0));
  uint64_t v3 = *(void *)(v0 + 152);
  if (v3)
  {
    if (v1 >= 0x200) {
      size_t v4 = 512;
    }
    else {
      size_t v4 = v1;
    }
    bzero((char *)&v11 - ((v1 + 15) & 0xFFFFFFFF0), v4);
    int v6 = 0;
    do
    {
      if (*(unsigned char *)(v3 + 48)) {
        v2[v6++] = (void *)v3;
      }
      uint64_t v3 = *(void *)(v3 + 72);
    }
    while (v3);
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      *(void *)&long long v5 = 136315138;
      long long v11 = v5;
      do
      {
        uint64_t v12 = *v2;
        if (sub_10000ED34(1) && sub_10000ED34(1))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v9 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v9))
          {
            uint32_t v10 = ether_ntoa((const ether_addr *)v12);
            *(_DWORD *)buf = v11;
            os_log_type_t v14 = v10;
            _os_log_impl((void *)&_mh_execute_header, LogHandle, v9, "Removing Supplicant for %s", buf, 0xCu);
          }
        }
        sub_100004578((uint64_t **)v12 + 5);
        sub_10000DDEC(&v12);
        ++v2;
        --v7;
      }
      while (v7);
    }
  }
}

void sub_10000E66C(uint64_t a1)
{
  unint64_t v1 = *(const void **)(a1 + 96);
  if (v1)
  {
    sub_10000F4F4(*(void *)(a1 + 88), v1, dword_100018880, (uint64_t)sub_10000E714, a1);
    if (sub_10000ED34(1))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v3))
      {
        *(_WORD *)size_t v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "Scan initiated", v4, 2u);
      }
    }
  }
}

void sub_10000E714(uint64_t a1, const __CFArray *a2, uint64_t a3)
{
  if (!a2)
  {
    if (!sub_10000ED34(1)) {
      goto LABEL_44;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "Scan complete: no APs";
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, LogHandle, v32, v33, buf, 2u);
    goto LABEL_44;
  }
  if (!*(unsigned char *)(a3 + 110))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "main Supplicant bssid is unknown, skipping";
    goto LABEL_43;
  }
  if (sub_10000ED34(1))
  {
    CFIndex Count = CFArrayGetCount(a2);
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(a2, i);
        BytePtr = (const ether_addr *)CFDataGetBytePtr(ValueAtIndex);
        if (i) {
          uint32_t v10 = ", ";
        }
        else {
          uint32_t v10 = "";
        }
        long long v11 = ether_ntoa(BytePtr);
        CFStringAppendFormat(Mutable, 0, @"%s%s", v10, v11);
      }
    }
    uint64_t v12 = EAPLogGetLogHandle();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = "s";
      *(_DWORD *)buf = 134218498;
      if (Count == 1) {
        os_log_type_t v14 = "";
      }
      CFIndex v36 = Count;
      __int16 v37 = 2080;
      __int16 v38 = v14;
      __int16 v39 = 2112;
      __int16 v40 = Mutable;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Scan complete: %ld AP%s = { %@ }", buf, 0x20u);
    }
    CFRelease(Mutable);
  }
  CFIndex v15 = CFArrayGetCount(a2);
  if (v15 >= 1)
  {
    CFIndex v16 = v15;
    for (CFIndex j = 0; j != v16; ++j)
    {
      __int16 v34 = 0;
      CFDataRef v18 = (const __CFData *)CFArrayGetValueAtIndex(a2, j);
      os_log_type_t v19 = (UInt8 *)CFDataGetBytePtr(v18);
      if (*(_DWORD *)v19 != *(_DWORD *)(a3 + 104) || *((unsigned __int16 *)v19 + 2) != *(unsigned __int16 *)(a3 + 108))
      {
        uint64_t v21 = *(void *)(a3 + 152);
        if (v21)
        {
          while (*(_DWORD *)v21 != *(_DWORD *)v19 || *(unsigned __int16 *)(v21 + 4) != *((unsigned __int16 *)v19 + 2))
          {
            uint64_t v21 = *(void *)(v21 + 72);
            if (!v21) {
              goto LABEL_27;
            }
          }
        }
        else
        {
LABEL_27:
          __int16 v34 = 0;
          int v23 = (ether_addr *)sub_10000DCF0(a3, (int *)v19);
          __int16 v34 = v23;
          if (v23)
          {
            os_log_type_t v24 = sub_100008838((uint64_t)v23, *(void *)(*(void *)(a3 + 144) + 40));
            *(void *)&v34[6].octet[4] = v24;
            if (v24)
            {
              if (sub_10000ED34(1))
              {
                os_log_type_t v25 = EAPLogGetLogHandle();
                os_log_type_t v26 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v25, v26))
                {
                  uint64_t v27 = ether_ntoa(v34);
                  *(_DWORD *)buf = 136315138;
                  CFIndex v36 = (CFIndex)v27;
                  _os_log_impl((void *)&_mh_execute_header, v25, v26, "Supplicant %s created", buf, 0xCu);
                }
              }
              sub_10000673C(*(void *)&v34[6].octet[4], 0xFFFFFFFFLL);
            }
            else
            {
              int v28 = EAPLogGetLogHandle();
              os_log_type_t v29 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v28, v29))
              {
                uint64_t v30 = ether_ntoa(v34);
                *(_DWORD *)buf = 136315138;
                CFIndex v36 = (CFIndex)v30;
                _os_log_impl((void *)&_mh_execute_header, v28, v29, "Supplicant create %s failed", buf, 0xCu);
              }
              sub_10000DDEC((void **)&v34);
            }
          }
        }
      }
    }
  }
LABEL_44:
  if (dword_10001887C >= 1) {
    sub_10000AC14(*(CFRunLoopTimerRef **)(a3 + 128), dword_10001887C, 0, (__CFRunLoopTimer *)sub_10000E66C, (__CFRunLoopTimer *)a3, 0, 0);
  }
}

void sub_10000EB1C(uint64_t a1, uint64_t a2)
{
  int v8 = 0;
  if (sub_10000ED34(1))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v4))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v4, "4-way handshake complete", v7, 2u);
    }
  }
  int v5 = sub_1000089AC(*(unsigned int **)(*(void *)(a2 + 144) + 40), &v8);
  if (v5 == 3)
  {
    sub_1000089BC(*(_DWORD **)(*(void *)(a2 + 144) + 40));
  }
  else if (v5 == 4 && *(unsigned char *)(a2 + 68))
  {
    sub_10000C538((void *)a2);
  }
  int v6 = *(_DWORD **)(a2 + 72);
  if (v6)
  {
    sub_10000FBF8(v6);
    *(void *)(a2 + 72) = 0;
  }
}

uint64_t sub_10000EBF8()
{
  return dword_1000188C8;
}

void sub_10000EC04(int a1, int a2)
{
  int v2 = a1;
  if (dword_1000188C8 == a1)
  {
    if (a1) {
      return;
    }
  }
  else
  {
    if (a1)
    {
      if (a2)
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v4 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v4))
        {
          v7[0] = 67109120;
          v7[1] = v2;
          _os_log_impl((void *)&_mh_execute_header, LogHandle, v4, "Verbose mode enabled (uint64_t LogFlags = 0x%x)", (uint8_t *)v7, 8u);
        }
      }
      goto LABEL_12;
    }
    if (a2)
    {
      int v5 = EAPLogGetLogHandle();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v5, v6))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Verbose mode disabled", (uint8_t *)v7, 2u);
      }
    }
  }
  int v2 = 4107;
LABEL_12:
  dword_1000188C8 = v2;
}

BOOL sub_10000ED34(int a1)
{
  return (dword_1000188C8 & a1) != 0;
}

BOOL sub_10000ED48(const char *a1, void *a2)
{
  int v4 = Apple80211Open();
  if (v4)
  {
    int v5 = v4;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(LogHandle, v7);
    if (result)
    {
      *(_DWORD *)buf = 67109120;
      int v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v7, "Apple80211Open failed, %x", buf, 8u);
      return 0;
    }
  }
  else
  {
    CFStringRef v9 = CFStringCreateWithCString(0, a1, 0x600u);
    int v10 = Apple80211BindToInterface();
    CFRelease(v9);
    if (v10)
    {
      Apple80211Close();
      BOOL result = 0;
    }
    else
    {
      BOOL result = 1;
    }
    *a2 = 0;
  }
  return result;
}

BOOL sub_10000EE6C(uint64_t a1, uint64_t a2)
{
  int v3 = Apple80211Get();
  BOOL result = 0;
  if (!v3)
  {
    if (*(_DWORD *)a2) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = *(unsigned __int16 *)(a2 + 4) == 0;
    }
    return !v5;
  }
  return result;
}

BOOL sub_10000EED8(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a2 > 3 || a5 != 5 && a5 != 13) {
    return 0;
  }
  __memcpy_chk();
  return Apple80211Set() == 0;
}

uint64_t sub_10000EFFC()
{
  CFDictionaryRef theDict = 0;
  int valuePtr = 0;
  int v0 = Apple80211CopyValue();
  if (v0)
  {
    int v1 = v0;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = v1;
      _os_log_impl((void *)&_mh_execute_header, LogHandle, v3, "Apple80211CopyValue(APPLE80211_IOC_AUTH_TYPE) failed, 0x%x", buf, 8u);
    }
  }
  my_CFRelease();
  return 0;
}

BOOL sub_10000F154(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 | 0x40) != 0x40) {
    return 0;
  }
  if (a4) {
    __memcpy_chk();
  }
  return Apple80211Set() == 0;
}

uint64_t sub_10000F254()
{
  return 0;
}

uint64_t sub_10000F25C(uint64_t a1, const ether_addr *a2)
{
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  uint64_t v4 = 0;
  if (!Apple80211Get())
  {
    CFIndex Count = CFArrayGetCount(Mutable);
    os_log_type_t v6 = ether_ntoa(a2);
    CFStringRef v7 = CFStringCreateWithCString(0, v6, 0x600u);
    if (Count < 1)
    {
LABEL_7:
      uint64_t v4 = 0;
    }
    else
    {
      CFIndex v8 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v8);
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"PMKSA_AUTHENTICATOR");
        if (Value)
        {
          uint64_t v4 = 1;
          if (CFStringCompare(Value, v7, 1uLL) == kCFCompareEqualTo) {
            break;
          }
        }
        if (Count == ++v8) {
          goto LABEL_7;
        }
      }
    }
    CFRelease(v7);
  }
  CFRelease(Mutable);
  return v4;
}

uint64_t sub_10000F354(uint64_t a1)
{
  sub_10000F38C(a1);

  return Apple80211Close();
}

void sub_10000F38C(uint64_t a1)
{
  int v1 = off_100018888;
  if (off_100018888)
  {
    while (1)
    {
      uint64_t v2 = *((void *)v1 + 5);
      if (*(void *)v1 == a1) {
        break;
      }
      int v1 = (void *)*((void *)v1 + 5);
      if (!v2) {
        return;
      }
    }
    os_log_type_t v3 = (void *)*((void *)v1 + 6);
    if (v2)
    {
      *(void *)(v2 + 48) = v3;
      os_log_type_t v3 = (void *)*((void *)v1 + 6);
    }
    else
    {
      off_100018890 = (_UNKNOWN **)*((void *)v1 + 6);
    }
    *os_log_type_t v3 = v2;
    Apple80211EventMonitoringHalt();
    CFRelease(*((CFTypeRef *)v1 + 3));
    free(v1);
  }
}

CFStringRef sub_10000F418()
{
  CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
  if (Apple80211Get())
  {
    CFRelease(Mutable);
    return 0;
  }
  if (!Mutable) {
    return 0;
  }
  BytePtr = CFDataGetBytePtr(Mutable);
  CFIndex Length = CFDataGetLength(Mutable);
  CFStringRef v1 = CFStringCreateWithBytes(0, BytePtr, Length, 0x8000100u, 0);
  if (!v1)
  {
    uint64_t v4 = CFDataGetBytePtr(Mutable);
    CFIndex v5 = CFDataGetLength(Mutable);
    CFStringRef v1 = CFStringCreateWithBytes(0, v4, v5, 0, 0);
  }
  CFRelease(Mutable);
  return v1;
}

uint64_t sub_10000F4F4(uint64_t a1, CFTypeRef cf2, int a3, uint64_t a4, uint64_t a5)
{
  if (cf2 && a4)
  {
    int v10 = (char *)off_100018888;
    if (off_100018888)
    {
      while (*(void *)v10 != a1)
      {
        int v10 = (char *)*((void *)v10 + 5);
        if (!v10) {
          goto LABEL_6;
        }
      }
      if (!CFEqual(*((CFTypeRef *)v10 + 3), cf2))
      {
        CFRetain(cf2);
        CFRelease(*((CFTypeRef *)v10 + 3));
        *((void *)v10 + 3) = cf2;
        *((_DWORD *)v10 + 8) = 0;
      }
LABEL_21:
      *((void *)v10 + 1) = a4;
      *((void *)v10 + 2) = a5;
      if (*((_DWORD *)v10 + 8) == 1)
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v27 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v27)) {
          return 1;
        }
        LOWORD(v39) = 0;
        int v28 = "scan already in progress";
        os_log_type_t v29 = LogHandle;
        os_log_type_t v30 = v27;
        uint32_t v31 = 2;
      }
      else
      {
        CFMutableDataRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionarySetValue(Mutable, @"SSID_STR", cf2);
        CFDictionarySetValue(Mutable, @"SCAN_MERGE", kCFBooleanFalse);
        int v39 = a3;
        CFNumberRef v33 = CFNumberCreate(0, kCFNumberSInt32Type, &v39);
        CFDictionarySetValue(Mutable, @"SCAN_NUM_SCANS", v33);
        CFRelease(v33);
        uint64_t v23 = 1;
        int v39 = 1;
        CFNumberRef v34 = CFNumberCreate(0, kCFNumberSInt32Type, &v39);
        CFDictionarySetValue(Mutable, @"SCAN_PHY_MODE", v34);
        CFRelease(v34);
        int v39 = 1;
        CFNumberRef v35 = CFNumberCreate(0, kCFNumberSInt32Type, &v39);
        CFDictionarySetValue(Mutable, @"SCAN_TYPE", v35);
        CFRelease(v35);
        int v36 = Apple80211ScanAsync();
        CFRelease(Mutable);
        if (!v36)
        {
          *((_DWORD *)v10 + 8) = 1;
          return v23;
        }
        __int16 v37 = EAPLogGetLogHandle();
        os_log_type_t v38 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v37, v38)) {
          return 1;
        }
        int v39 = 67109120;
        int v40 = v36;
        int v28 = "Apple80211ScanAsync failed, %d";
        os_log_type_t v29 = v37;
        os_log_type_t v30 = v38;
        uint32_t v31 = 8;
      }
      _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, (uint8_t *)&v39, v31);
      return 1;
    }
LABEL_6:
    CFRunLoopGetCurrent();
    int v11 = Apple80211EventMonitoringInit();
    if (v11)
    {
      int v12 = v11;
      os_log_type_t v13 = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        int v39 = 67109120;
        int v40 = v12;
        CFIndex v15 = "Apple80211EventMonitoringInit failed, %d";
LABEL_16:
        CFDataRef v18 = v13;
        os_log_type_t v19 = v14;
        uint32_t v20 = 8;
        goto LABEL_17;
      }
    }
    else
    {
      int started = Apple80211StartMonitoringEvent();
      if (!started)
      {
        int v10 = (char *)malloc_type_malloc(0x38uLL, 0x10E004080CAEFD5uLL);
        *(_OWORD *)(v10 + 8) = 0u;
        *(_OWORD *)(v10 + 24) = 0u;
        *(_OWORD *)(v10 + 40) = 0u;
        *(void *)int v10 = a1;
        *((void *)v10 + 3) = CFRetain(cf2);
        *((void *)v10 + 5) = 0;
        os_log_type_t v25 = off_100018890;
        *((void *)v10 + 6) = off_100018890;
        void *v25 = v10;
        off_100018890 = (_UNKNOWN **)(v10 + 40);
        goto LABEL_21;
      }
      int v22 = started;
      Apple80211EventMonitoringHalt();
      os_log_type_t v13 = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        int v39 = 67109120;
        int v40 = v22;
        CFIndex v15 = "Apple80211StartMonitoringEvent failed, %d";
        goto LABEL_16;
      }
    }
  }
  else
  {
    CFIndex v16 = EAPLogGetLogHandle();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(v39) = 0;
      CFIndex v15 = "ssid and/or func NULL";
      CFDataRef v18 = v16;
      os_log_type_t v19 = v17;
      uint32_t v20 = 2;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v15, (uint8_t *)&v39, v20);
    }
  }
  return 0;
}

void sub_10000F924(int a1, uint64_t a2, int a3, CFArrayRef theArray)
{
  if (a3 != 10)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v15)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    int v33 = a3;
    CFStringRef v9 = "unexpected event %d";
    int v10 = LogHandle;
    os_log_type_t v11 = v15;
    uint32_t v12 = 8;
    goto LABEL_9;
  }
  uint64_t v4 = off_100018888;
  if (!off_100018888)
  {
LABEL_5:
    CFStringRef v7 = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v7, v8)) {
      return;
    }
    *(_WORD *)buf = 0;
    CFStringRef v9 = "no callback?";
    int v10 = v7;
    os_log_type_t v11 = v8;
    uint32_t v12 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    return;
  }
  while (*v4 != a2)
  {
    uint64_t v4 = (void *)v4[5];
    if (!v4) {
      goto LABEL_5;
    }
  }
  CFIndex v16 = (void (*)(void, void, void))v4[1];
  uint64_t v17 = v4[2];
  *((_DWORD *)v4 + 8) = 2;
  CFDataRef v18 = (const void *)v4[3];
  CFIndex Count = CFArrayGetCount(theArray);
  if (!Count) {
    goto LABEL_29;
  }
  uint64_t v20 = Count;
  os_log_type_t v30 = v16;
  theArraya = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (v20 >= 1)
  {
    CFIndex v21 = 0;
    CFIndex v22 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v21);
      CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"SSID_STR");
      if (Value)
      {
        if (CFEqual(Value, v18))
        {
          CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
          CFTypeID TypeID = CFStringGetTypeID();
          if (v25)
          {
            if (CFGetTypeID(v25) == TypeID)
            {
              if (CFStringGetCString(v25, (char *)buf, 32, 0x600u))
              {
                os_log_type_t v27 = ether_aton((const char *)buf);
                if (v27)
                {
                  CFDataRef v28 = CFDataCreate(0, v27->octet, 6);
                  if (v28)
                  {
                    CFDataRef v29 = v28;
                    v34.location = 0;
                    v34.length = v22;
                    if (!CFArrayContainsValue(theArraya, v34, v28))
                    {
                      CFArrayAppendValue(theArraya, v29);
                      ++v22;
                    }
                    CFRelease(v29);
                  }
                }
              }
            }
          }
        }
      }
      ++v21;
    }
    while (v20 != v21);
  }
  if (!CFArrayGetCount(theArraya))
  {
    CFRelease(theArraya);
    CFIndex v16 = v30;
LABEL_29:
    v16(a2, 0, v17);
    return;
  }
  v30(a2, theArraya, v17);
  if (theArraya) {
    CFRelease(theArraya);
  }
}

void sub_10000FBF8(_DWORD *a1)
{
  io_object_t v2 = a1[2];
  if (v2) {
    IOObjectRelease(v2);
  }
  if (*(void *)a1)
  {
    double Current = CFRunLoopGetCurrent();
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)a1);
    CFRunLoopRemoveSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    IONotificationPortDestroy(*(IONotificationPortRef *)a1);
  }
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;

  free(a1);
}

_OWORD *sub_10000FC78(const char *a1, uint64_t a2, uint64_t a3)
{
  kern_return_t ParentEntry;
  kern_return_t v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  kern_return_t v30;
  NSObject *v31;
  os_log_type_t v32;
  kern_return_t v33;
  kern_return_t v34;
  NSObject *v35;
  os_log_type_t v36;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  io_object_t object;
  io_iterator_t existing[2];
  uint8_t buf[4];
  void v42[2];

  if (!a2) {
    return 0;
  }
  os_log_type_t v6 = malloc_type_malloc(0x20uLL, 0x10E00406B6A89D0uLL);
  *os_log_type_t v6 = 0u;
  v6[1] = 0u;
  *(void *)existing = 0;
  object = 0;
  CFDictionaryRef v7 = IOBSDNameMatching(kIOMasterPortDefault, 0, a1);
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v7, existing))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v9))
    {
LABEL_6:
      os_log_type_t v14 = 0;
LABEL_7:
      int v15 = 1;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315138;
    v42[0] = a1;
    int v10 = "No such interface %s\n";
    os_log_type_t v11 = LogHandle;
    os_log_type_t v12 = v9;
    uint32_t v13 = 12;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    goto LABEL_6;
  }
  IONotificationPortRef v17 = IONotificationPortCreate(kIOMasterPortDefault);
  if (!v17)
  {
    CFIndex v22 = EAPLogGetLogHandle();
    uint64_t v23 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v22, v23)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int v10 = "IONotificationPortCreate failed\n";
    os_log_type_t v11 = v22;
    os_log_type_t v12 = v23;
    uint32_t v13 = 2;
    goto LABEL_5;
  }
  os_log_type_t v14 = v17;
  io_object_t v18 = IOIteratorNext(existing[0]);
  object = v18;
  if (!v18)
  {
    os_log_type_t v24 = EAPLogGetLogHandle();
    CFStringRef v25 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v24, v25)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    os_log_type_t v26 = "IOIteratorNext no object\n";
    os_log_type_t v27 = v24;
    CFDataRef v28 = v25;
    CFDataRef v29 = 2;
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v27, v28, v26, buf, v29);
    goto LABEL_7;
  }
  ParentEntry = IORegistryEntryGetParentEntry(v18, "IOService", &object);
  if (ParentEntry)
  {
    uint64_t v20 = ParentEntry;
    CFIndex v21 = 0;
LABEL_30:
    uint32_t v31 = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v31, v32)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109376;
    LODWORD(v42[0]) = v21;
    WORD2(v42[0]) = 1024;
    *(_DWORD *)((char *)v42 + 6) = v20;
    os_log_type_t v26 = "IORegistryEntryGetParentEntry(%d) failed, kr = 0x%x";
    os_log_type_t v27 = v31;
    CFDataRef v28 = v32;
    CFDataRef v29 = 14;
    goto LABEL_32;
  }
  os_log_type_t v30 = IORegistryEntryGetParentEntry(object, "IOService", &object);
  if (v30)
  {
    uint64_t v20 = v30;
    CFIndex v21 = 1;
    goto LABEL_30;
  }
  int v33 = IOServiceAddInterestNotification(v14, object, "IOGeneralInterest", (IOServiceInterestCallback)sub_100010014, v6, &existing[1]);
  if (v33)
  {
    CFRange v34 = v33;
    CFNumberRef v35 = EAPLogGetLogHandle();
    int v36 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v35, v36)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v42[0]) = v34;
    os_log_type_t v26 = "IOServiceAddInterestNotification failed, 0x%x\n";
    os_log_type_t v27 = v35;
    CFDataRef v28 = v36;
    CFDataRef v29 = 8;
    goto LABEL_32;
  }
  double Current = CFRunLoopGetCurrent();
  CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(v14);
  CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  int v15 = 0;
  *(void *)os_log_type_t v6 = v14;
  *((_DWORD *)v6 + 2) = existing[1];
  *((void *)v6 + 2) = a2;
  *((void *)v6 + 3) = a3;
LABEL_8:
  if (existing[0]) {
    IOObjectRelease(existing[0]);
  }
  if (object) {
    IOObjectRelease(object);
  }
  if (v15)
  {
    if (v14) {
      IONotificationPortDestroy(v14);
    }
    if (existing[1]) {
      IOObjectRelease(existing[1]);
    }
    free(v6);
    return 0;
  }
  return v6;
}

uint64_t sub_100010014(uint64_t result, uint64_t a2, int a3)
{
  if (a3 == -536870608) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(result + 24));
  }
  return result;
}

uint64_t Apple80211BindToInterface()
{
  return _Apple80211BindToInterface();
}

uint64_t Apple80211Close()
{
  return _Apple80211Close();
}

uint64_t Apple80211CopyValue()
{
  return _Apple80211CopyValue();
}

uint64_t Apple80211EventMonitoringHalt()
{
  return _Apple80211EventMonitoringHalt();
}

uint64_t Apple80211EventMonitoringInit()
{
  return _Apple80211EventMonitoringInit();
}

uint64_t Apple80211Get()
{
  return _Apple80211Get();
}

uint64_t Apple80211Open()
{
  return _Apple80211Open();
}

uint64_t Apple80211ScanAsync()
{
  return _Apple80211ScanAsync();
}

uint64_t Apple80211Set()
{
  return _Apple80211Set();
}

uint64_t Apple80211StartMonitoringEvent()
{
  return _Apple80211StartMonitoringEvent();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCrypt(op, alg, options, key, keyLength, iv, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
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

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
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

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return _CFRunLoopObserverCreate(allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return _CFSocketCreateRunLoopSource(allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return _CFSocketCreateWithNative(allocator, sock, callBackTypes, callout, context);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t EAPClientModuleAddBuiltinModule()
{
  return _EAPClientModuleAddBuiltinModule();
}

uint64_t EAPClientModuleLookup()
{
  return _EAPClientModuleLookup();
}

uint64_t EAPClientModulePluginCopyIdentity()
{
  return _EAPClientModulePluginCopyIdentity();
}

uint64_t EAPClientModulePluginEAPName()
{
  return _EAPClientModulePluginEAPName();
}

uint64_t EAPClientModulePluginEAPType()
{
  return _EAPClientModulePluginEAPType();
}

uint64_t EAPClientModulePluginFailureString()
{
  return _EAPClientModulePluginFailureString();
}

uint64_t EAPClientModulePluginFree()
{
  return _EAPClientModulePluginFree();
}

uint64_t EAPClientModulePluginFreePacket()
{
  return _EAPClientModulePluginFreePacket();
}

uint64_t EAPClientModulePluginInit()
{
  return _EAPClientModulePluginInit();
}

uint64_t EAPClientModulePluginMasterSessionKeyCopyBytes()
{
  return _EAPClientModulePluginMasterSessionKeyCopyBytes();
}

uint64_t EAPClientModulePluginProcess()
{
  return _EAPClientModulePluginProcess();
}

uint64_t EAPClientModulePluginPublishProperties()
{
  return _EAPClientModulePluginPublishProperties();
}

uint64_t EAPClientModulePluginRequireProperties()
{
  return _EAPClientModulePluginRequireProperties();
}

uint64_t EAPClientModulePluginServerKey()
{
  return _EAPClientModulePluginServerKey();
}

uint64_t EAPClientModulePluginSessionKey()
{
  return _EAPClientModulePluginSessionKey();
}

uint64_t EAPClientModulePluginUserName()
{
  return _EAPClientModulePluginUserName();
}

uint64_t EAPCodeStr()
{
  return _EAPCodeStr();
}

uint64_t EAPLogGetLogHandle()
{
  return _EAPLogGetLogHandle();
}

uint64_t EAPLogInit()
{
  return _EAPLogInit();
}

uint64_t EAPOLClientAttach()
{
  return _EAPOLClientAttach();
}

uint64_t EAPOLClientConfigurationCreateWithAuthorization()
{
  return _EAPOLClientConfigurationCreateWithAuthorization();
}

uint64_t EAPOLClientConfigurationGetDefaultAuthenticationProperties()
{
  return _EAPOLClientConfigurationGetDefaultAuthenticationProperties();
}

uint64_t EAPOLClientConfigurationGetProfileWithID()
{
  return _EAPOLClientConfigurationGetProfileWithID();
}

uint64_t EAPOLClientDetach()
{
  return _EAPOLClientDetach();
}

uint64_t EAPOLClientEstablishSession()
{
  return _EAPOLClientEstablishSession();
}

uint64_t EAPOLClientForceRenew()
{
  return _EAPOLClientForceRenew();
}

uint64_t EAPOLClientGetConfig()
{
  return _EAPOLClientGetConfig();
}

uint64_t EAPOLClientItemIDCopyIdentity()
{
  return _EAPOLClientItemIDCopyIdentity();
}

uint64_t EAPOLClientItemIDCopyPasswordItem()
{
  return _EAPOLClientItemIDCopyPasswordItem();
}

uint64_t EAPOLClientItemIDCreateWithDictionary()
{
  return _EAPOLClientItemIDCreateWithDictionary();
}

uint64_t EAPOLClientItemIDGetProfile()
{
  return _EAPOLClientItemIDGetProfile();
}

uint64_t EAPOLClientItemIDGetProfileID()
{
  return _EAPOLClientItemIDGetProfileID();
}

uint64_t EAPOLClientProfileGetAuthenticationProperties()
{
  return _EAPOLClientProfileGetAuthenticationProperties();
}

uint64_t EAPOLClientProfileGetID()
{
  return _EAPOLClientProfileGetID();
}

uint64_t EAPOLClientReportStatus()
{
  return _EAPOLClientReportStatus();
}

uint64_t EAPOLControlPrefsGetLogFlags()
{
  return _EAPOLControlPrefsGetLogFlags();
}

uint64_t EAPOLControlPrefsInit()
{
  return _EAPOLControlPrefsInit();
}

uint64_t EAPOLControlPrefsSynchronize()
{
  return _EAPOLControlPrefsSynchronize();
}

uint64_t EAPOLControlStop()
{
  return _EAPOLControlStop();
}

uint64_t EAPOLKeyDescriptorGetLength()
{
  return _EAPOLKeyDescriptorGetLength();
}

uint64_t EAPOLPacketGetLength()
{
  return _EAPOLPacketGetLength();
}

uint64_t EAPOLPacketIsValid()
{
  return _EAPOLPacketIsValid();
}

uint64_t EAPOLPacketSetLength()
{
  return _EAPOLPacketSetLength();
}

uint64_t EAPOLPacketTypeStr()
{
  return _EAPOLPacketTypeStr();
}

uint64_t EAPPacketCreate()
{
  return _EAPPacketCreate();
}

uint64_t EAPPacketGetLength()
{
  return _EAPPacketGetLength();
}

uint64_t EAPPacketSetLength()
{
  return _EAPPacketSetLength();
}

uint64_t EAPSecCertificateCopyUserNameString()
{
  return _EAPSecCertificateCopyUserNameString();
}

uint64_t EAPSecIdentityHandleCreateSecIdentity()
{
  return _EAPSecIdentityHandleCreateSecIdentity();
}

uint64_t EAPSecKeychainPasswordItemCopy()
{
  return _EAPSecKeychainPasswordItemCopy();
}

uint64_t EAPSecurityErrorString()
{
  return _EAPSecurityErrorString();
}

uint64_t EAPTypeStr()
{
  return _EAPTypeStr();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

uint64_t LinkAddresses_create()
{
  return _LinkAddresses_create();
}

uint64_t LinkAddresses_free()
{
  return _LinkAddresses_free();
}

uint64_t LinkAddresses_lookup()
{
  return _LinkAddresses_lookup();
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return _SCDynamicStoreCreateRunLoopSource(allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return _SCDynamicStoreKeyCreate(allocator, fmt);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return _SecCertificateGetTypeID();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

uint64_t SecIdentityCreate()
{
  return _SecIdentityCreate();
}

CFTypeID SecKeyGetTypeID(void)
{
  return _SecKeyGetTypeID();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SC_CFMachPortCreateWithPort()
{
  return __SC_CFMachPortCreateWithPort();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return __SC_syslog_os_log_mapping();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t eapol_socket()
{
  return _eapol_socket();
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return _ether_aton(a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return _ether_ntoa(a1);
}

int execv(const char *__path, char *const *__argv)
{
  return _execv(__path, __argv);
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

gid_t getgid(void)
{
  return _getgid();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uid_t getuid(void)
{
  return _getuid();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t my_CFDictionaryGetBooleanValue()
{
  return _my_CFDictionaryGetBooleanValue();
}

uint64_t my_CFPropertyListCopyAsXMLString()
{
  return _my_CFPropertyListCopyAsXMLString();
}

uint64_t my_CFPropertyListCreateFromFile()
{
  return _my_CFPropertyListCreateFromFile();
}

uint64_t my_CFRelease()
{
  return _my_CFRelease();
}

uint64_t my_CFStringToCString()
{
  return _my_CFStringToCString();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return _notify_register_mach_port(name, notify_port, flags, out_token);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void perror(const char *a1)
{
}

uint64_t print_bytes_cfstr()
{
  return _print_bytes_cfstr();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

pid_t setsid(void)
{
  return _setsid();
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
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

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_callbackContext(void *a1, const char *a2, ...)
{
  return [a1 callbackContext];
}

id objc_msgSend_canPerformAuthorization(void *a1, const char *a2, ...)
{
  return [a1 canPerformAuthorization];
}

id objc_msgSend_cancelAuthorization(void *a1, const char *a2, ...)
{
  return [a1 cancelAuthorization];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isInFactoryMode(void *a1, const char *a2, ...)
{
  return [a1 isInFactoryMode];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_startAuthorization(void *a1, const char *a2, ...)
{
  return [a1 startAuthorization];
}

id objc_msgSend_tlsCertificateChain(void *a1, const char *a2, ...)
{
  return [a1 tlsCertificateChain];
}

id objc_msgSend_tlsKey(void *a1, const char *a2, ...)
{
  return [a1 tlsKey];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}