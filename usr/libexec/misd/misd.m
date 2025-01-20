uint64_t sub_100004944(void *a1, uint64_t a2)
{
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;
  xpc_object_t v14;
  void *v15;
  unsigned __int8 v16;
  int v17;
  xpc_object_t v18;
  void *v19;
  const char *string_ptr;
  xpc_object_t v21;
  void *v22;
  const char *v23;
  char v24;
  xpc_object_t v26;
  void *v27;
  uint64_t v28;
  long long v29;
  long long v30;

  if (!a1) {
    goto LABEL_3;
  }
  if (xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_3;
  }
  value = xpc_dictionary_get_value(a1, netrbClientLowLatencyFlowParam[0]);
  if (!value) {
    goto LABEL_3;
  }
  v6 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_3;
  }
  v30 = 0uLL;
  v29 = 0uLL;
  v7 = xpc_dictionary_get_value(v6, netrbClientIfnetTrafficDescriptorIpVersion[0]);
  if (v7 && (v8 = v7, xpc_get_type(v7) == (xpc_type_t)&_xpc_type_uint64))
  {
    v16 = xpc_uint64_get_value(v8);
    v17 = v16;
    if (v16 != 4 && v16 != 96) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 1u;
      *(unsigned char *)(a2 + 9) = v16;
    }
    v18 = xpc_dictionary_get_value(v6, netrbClientIfnetTrafficDescriptorLocalIp[0]);
    if (v18 && (v19 = v18, xpc_get_type(v18) == (xpc_type_t)&_xpc_type_string))
    {
      string_ptr = xpc_string_get_string_ptr(v19);
      if (a2) {
        *(unsigned char *)(a2 + 8) |= 4u;
      }
    }
    else
    {
      sub_100004E0C();
      string_ptr = 0;
    }
    v21 = xpc_dictionary_get_value(v6, netrbClientIfnetTrafficDescriptorRemoteIp[0]);
    if (v21 && (v22 = v21, xpc_get_type(v21) == (xpc_type_t)&_xpc_type_string))
    {
      v23 = xpc_string_get_string_ptr(v22);
      if (a2) {
        *(unsigned char *)(a2 + 8) |= 8u;
      }
    }
    else
    {
      sub_100004E0C();
      v23 = 0;
    }
    if (v17 == 4)
    {
      if (string_ptr && inet_pton(2, string_ptr, (char *)&v30 + 12) != 1
        || v23 && inet_pton(2, v23, (char *)&v29 + 12) != 1)
      {
        goto LABEL_3;
      }
      if (a2)
      {
        *(_DWORD *)(a2 + 24) = HIDWORD(v30);
        *(_DWORD *)(a2 + 40) = HIDWORD(v29);
      }
    }
    else
    {
      if (string_ptr && inet_pton(30, string_ptr, &v30) != 1 || v23 && inet_pton(30, v23, &v29) != 1) {
        goto LABEL_3;
      }
      if (a2)
      {
        *(_OWORD *)(a2 + 12) = v30;
        *(_OWORD *)(a2 + 28) = v29;
      }
    }
  }
  else
  {
    sub_100004DC8();
  }
  v9 = xpc_dictionary_get_value(v6, netrbClientIfnetTrafficDescriptorIpProtocol[0]);
  if (v9 && (v10 = v9, xpc_get_type(v9) == (xpc_type_t)&_xpc_type_uint64))
  {
    v24 = xpc_uint64_get_value(v10);
    if (v24 != 17 && v24 != 6) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 2u;
      *(unsigned char *)(a2 + 10) = v24;
    }
  }
  else
  {
    sub_100004E0C();
  }
  v11 = xpc_dictionary_get_value(v6, netrbClientIfnetTrafficDescriptorLocalPort[0]);
  if (v11)
  {
    v12 = v11;
    if (xpc_get_type(v11) != (xpc_type_t)&_xpc_type_uint64) {
      goto LABEL_3;
    }
    v13 = xpc_uint64_get_value(v12);
    if (v13 - 0x10000 < 0xFFFFFFFFFFFF0001) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 0x10u;
      *(_WORD *)(a2 + 44) = bswap32(v13) >> 16;
    }
  }
  else
  {
    sub_100004E0C();
  }
  v14 = xpc_dictionary_get_value(v6, netrbClientIfnetTrafficDescriptorRemotePort[0]);
  if (v14)
  {
    v15 = v14;
    if (xpc_get_type(v14) != (xpc_type_t)&_xpc_type_uint64) {
      goto LABEL_3;
    }
    v28 = xpc_uint64_get_value(v15);
    if (v28 - 0x10000 < 0xFFFFFFFFFFFF0001) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 0x20u;
      *(_WORD *)(a2 + 46) = bswap32(v28) >> 16;
    }
  }
  else
  {
    sub_100004DC8();
  }
  v26 = xpc_dictionary_get_value(v6, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout[0]);
  if (v26)
  {
    v27 = v26;
    if (xpc_get_type(v26) != (xpc_type_t)&_xpc_type_uint64 || xpc_uint64_get_value(v27) >= 0x69781)
    {
LABEL_3:
      sub_100004DC8();
      return 0;
    }
  }
  return 1;
}

uint64_t sub_100004DC8()
{
  return os_log_with_args();
}

uint64_t sub_100004E0C()
{
  return os_log_with_args();
}

void start(int a1, char **a2)
{
  __endptr = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2000000000;
  int v17 = 0;
  v4 = basename(*a2);
  snprintf((char *)&__str, 0x28uLL, "com.apple.misd.mainQ.%p", &qword_100039470);
  HIBYTE(__str.st_atimespec.tv_sec) = 0;
  qword_100039470 = (uint64_t)dispatch_queue_create((const char *)&__str, 0);
  if (!qword_100039470)
  {
    sub_100005EAC();
    goto LABEL_38;
  }
  memset(&__str, 0, sizeof(__str));
  if (!stat("/AppleInternal", &__str) && (__str.st_mode & 0xF000) == 0x4000 && (__str.st_mode & 0x140) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    memset(&__str, 0, sizeof(__str));
    BOOL v5 = !stat("/System/Library/PreferenceBundles/CarrierSettings.bundle", &__str)
      && (__str.st_mode & 0xF000) == 0x4000
      && (__str.st_mode & 0x140) != 0;
  }
  dword_100039460 = v5;
  while (1)
  {
    int v6 = getopt(a1, a2, "Be:p:P:t:v");
    int v7 = v6;
    if (v6 > 111)
    {
      switch(v6)
      {
        case 'p':
          goto LABEL_20;
        case 't':
          uint64_t v10 = strtol(optarg, &__endptr, 0);
          if (!*optarg || *__endptr || v10 < 0)
          {
            fprintf(__stderrp, "Bad idle timeout: %s\n");
            goto LABEL_38;
          }
          break;
        case 'v':
          dword_10003946C = 1;
          break;
        default:
          goto LABEL_51;
      }
    }
    else if (v6 <= 79)
    {
      if (v6 != 66)
      {
        if (v6 == -1)
        {
          if (dword_10003946C) {
            sub_1000062C4(dword_10003946C);
          }
          if (sub_100005DBC())
          {
            if (dword_100039460)
            {
              sub_100005EAC();
              sub_10001CCE8();
            }
            *(void *)&__str.st_dev = 1;
            __str.st_ino = 0x200000000;
            sigaction(1, (const sigaction *)&__str, 0);
            sigaction(13, (const sigaction *)&__str, 0);
            sigaction(14, (const sigaction *)&__str, 0);
            sigaction(24, (const sigaction *)&__str, 0);
            sigaction(25, (const sigaction *)&__str, 0);
            sigaction(26, (const sigaction *)&__str, 0);
            sigaction(27, (const sigaction *)&__str, 0);
            sigaction(18, (const sigaction *)&__str, 0);
            sigaction(21, (const sigaction *)&__str, 0);
            sigaction(22, (const sigaction *)&__str, 0);
            sigaction(30, (const sigaction *)&__str, 0);
            sigaction(31, (const sigaction *)&__str, 0);
            sigaction(2, (const sigaction *)&__str, 0);
            sigaction(15, (const sigaction *)&__str, 0);
            sigaction(20, (const sigaction *)&__str, 0);
            v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, (dispatch_queue_t)qword_100039470);
            qword_100038EA0 = (uint64_t)v11;
            if (v11)
            {
              dispatch_source_set_event_handler(v11, &stru_100034BD8);
              dispatch_resume((dispatch_object_t)qword_100038EA0);
            }
            v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_100039470);
            qword_100038EA8 = (uint64_t)v12;
            if (v12)
            {
              dispatch_source_set_event_handler(v12, &stru_100034C18);
              dispatch_resume((dispatch_object_t)qword_100038EA8);
            }
            snprintf((char *)&__str, 0x22uLL, "com.apple.misd.%p", &qword_100039478);
            BYTE1(__str.st_atimespec.tv_sec) = 0;
            qword_100039478 = (uint64_t)dispatch_queue_create((const char *)&__str, 0);
            if (qword_100039478)
            {
              *((_DWORD *)v15 + 6) = 0;
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000;
              block[2] = sub_1000054FC;
              block[3] = &unk_100034B98;
              block[4] = &v14;
              dispatch_sync((dispatch_queue_t)qword_100039470, block);
              if (!*((_DWORD *)v15 + 6))
              {
                sub_1000055E8();
                dispatch_main();
              }
            }
            else
            {
              sub_100005EAC();
              *((_DWORD *)v15 + 6) = 12;
            }
          }
        }
        else
        {
LABEL_51:
          sub_100005464(v4);
        }
LABEL_38:
        sub_10000539C(1);
      }
      dword_100038D30 = 0;
    }
    else if (v6 == 80)
    {
LABEL_20:
      if (dword_100039460)
      {
        uint64_t v8 = strtol(optarg, &__endptr, 0);
        if (!*optarg || *__endptr || (v8 < 0x10000 ? (BOOL v9 = v8 <= 0) : (BOOL v9 = 1), v9))
        {
          fprintf(__stderrp, "Bad port : %s\n");
          goto LABEL_38;
        }
        ++dword_100039464;
        if (v7 == 112) {
          word_100039468 = v8;
        }
        else {
          word_10003946A = v8;
        }
      }
    }
    else
    {
      if (v6 != 101) {
        goto LABEL_51;
      }
      __strlcpy_chk();
    }
  }
}

void sub_10000539C(int a1)
{
  if (qword_100038E98)
  {
    xpc_connection_cancel((xpc_connection_t)qword_100038E98);
    xpc_release((xpc_object_t)qword_100038E98);
    qword_100038E98 = 0;
  }
  if (qword_100039470)
  {
    dispatch_release((dispatch_object_t)qword_100039470);
    qword_100039470 = 0;
  }
  if (qword_100039478)
  {
    dispatch_release((dispatch_object_t)qword_100039478);
    qword_100039478 = 0;
  }
  if (qword_100038EA0)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100038EA0);
    dispatch_release((dispatch_object_t)qword_100038EA0);
    qword_100038EA0 = 0;
  }
  if (qword_100038EA8)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100038EA8);
    dispatch_release((dispatch_object_t)qword_100038EA8);
    qword_100038EA8 = 0;
  }
  sub_100013D80();
  sub_1000177E8();
  sub_100014858();
  sub_10001B7C4();
  sub_10001D030();
  sub_100005EAC();
  sub_100006268();
  exit(a1);
}

uint64_t sub_100005464(const char *a1)
{
  printf("Usage: %s ", a1);
  puts("[-Bcv6] [-e EXTIF] [-p LO] [-P HI] [-t TIMEOUT]");
  puts("\nptions:");
  puts("\t-B\tDisable bridge");
  puts("\t-v\tEnable verbose logging");
  puts("\t-e EXTIF\tExternal interface name");
  puts("\t-p LO\tPort forwarding range, LO");
  puts("\t-P HI\tPort forwarding range, HI");

  return puts("\t-t TIMEOUT\tIdle timeout");
}

void sub_1000054FC(uint64_t a1)
{
  sub_10001CD2C();
  int v2 = sub_100013D6C();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  if (v2
    || (int v3 = sub_100016324(), (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3) != 0)
    || (int v4 = sub_10001480C(), (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4) != 0))
  {
    strerror(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    sub_100005EAC();
  }
  else
  {
    sub_10001B5FC();
  }
}

void sub_1000055E8()
{
  mach_service = xpc_connection_create_mach_service(off_100038B90[0], (dispatch_queue_t)qword_100039470, 1uLL);
  qword_100038E98 = (uint64_t)mach_service;
  if (!mach_service)
  {
    sub_100005EAC();
    sub_10000539C(12);
  }
  xpc_connection_set_event_handler(mach_service, &stru_100034C58);
  v1 = (_xpc_connection_s *)qword_100038E98;

  xpc_connection_resume(v1);
}

void sub_100005660(id a1)
{
}

void sub_100005684(id a1)
{
}

void sub_1000056A8(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100005EAC();
    xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)qword_100039470);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_1000057D0;
    handler[3] = &unk_100034C78;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(a2, _xpc_error_key_description);
    sub_100005EAC();
  }
  else
  {
    sub_100005EAC();
  }
}

void sub_1000057D0(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      sub_100005EAC();
      int v6 = *(_xpc_connection_s **)(a1 + 32);
      int v7 = (uint64_t *)qword_1000394C8;
      if (qword_1000394C8)
      {
        do
        {
          uint64_t v8 = *v7;
          if (*(_xpc_connection_s **)(v7[10] + 8) == v6)
          {
            sub_100005EAC();
            sub_10000E6A0(v7);
          }
          int v7 = (uint64_t *)v8;
        }
        while (v8);
      }
      xpc_connection_cancel(v6);
    }
    else
    {
      sub_100005EAC();
    }
    return;
  }
  if (xpc_dictionary_get_uint64(object, off_100038B98[0]) == 1000)
  {
    memset(buffer, 0, 32);
    xpc_connection_get_audit_token();
    if (sub_100005D24())
    {
      int v5 = 1;
    }
    else
    {
      if (!sub_100005D24())
      {
        sub_100005EAC();
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        proc_name(pid, buffer, 0x40u);
        sub_100005EAC();
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        if (reply)
        {
          uint64_t v16 = reply;
          xpc_dictionary_set_uint64(reply, off_100038BF8[0], 0x7D2uLL);
          sub_100007100(*(_xpc_connection_s **)(a1 + 32), v16);
          xpc_release(v16);
          return;
        }
        goto LABEL_55;
      }
      int v5 = 2;
    }
  }
  else
  {
    int v5 = 0;
  }
  BOOL v9 = (void *)xpc_connection_copy_entitlement_value();
  if (v9)
  {
    uint64_t v10 = v9;
    if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v10)) {
      v5 |= 4u;
    }
    xpc_release(v10);
  }
  v11 = *(_xpc_connection_s **)(a1 + 32);
  uint64_t uint64 = xpc_dictionary_get_uint64(object, off_100038B98[0]);
  if (dword_10003946C || byte_100039480)
  {
    pid_t v13 = xpc_connection_get_pid(v11);
    proc_name(v13, buffer, 0x40u);
    sub_100005D94(uint64);
    sub_100005EAC();
  }
  switch(uint64)
  {
    case 0x3E8uLL:
      sub_100007174(v11, object, v5);
      break;
    case 0x3E9uLL:
      sub_100007338(v11, object);
      break;
    case 0x3EAuLL:
      sub_100007CD4(v11, object);
      break;
    case 0x3EBuLL:
      sub_100007DCC(v11, object);
      break;
    case 0x3ECuLL:
      sub_100007ED4(v11, object);
      break;
    case 0x3EDuLL:
      sub_10000810C(v11, object);
      break;
    case 0x3EEuLL:
      sub_100008224(v11, object);
      break;
    case 0x3EFuLL:
      sub_10000839C(v11, object);
      break;
    case 0x3F0uLL:
      sub_100008460(v11, object);
      break;
    case 0x3F1uLL:
      sub_1000085B8(v11, object);
      break;
    case 0x3F2uLL:
      sub_100008710(v11, object);
      break;
    case 0x3F3uLL:
      sub_100008818(v11, object);
      break;
    case 0x3F4uLL:
      sub_1000072AC(v11, object);
      break;
    case 0x3F5uLL:
      sub_100007FDC(v11, object);
      break;
    case 0x3F6uLL:
      sub_10000895C(v11, object);
      break;
    case 0x3F7uLL:
      sub_1000091B8(v11, object);
      break;
    case 0x3F8uLL:
      sub_1000096C0(v11, object);
      break;
    case 0x3F9uLL:
      sub_1000097A0(v11, object);
      break;
    case 0x3FAuLL:
      sub_10000989C(v11, object);
      break;
    case 0x3FBuLL:
      sub_100009BB8(v11, object);
      break;
    default:
      sub_100005EAC();
      break;
  }
  if (dword_10003946C || byte_100039480)
  {
    sub_100005D94(uint64);
LABEL_55:
    sub_100005EAC();
  }
}

BOOL sub_100005D24()
{
  v0 = (void *)xpc_copy_entitlement_for_token();
  if (!v0) {
    return 0;
  }
  v1 = v0;
  BOOL v2 = xpc_get_type(v0) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v1);
  xpc_release(v1);
  return v2;
}

const char *sub_100005D94(uint64_t a1)
{
  if ((unint64_t)(a1 - 1000) > 0x11) {
    return "unknown";
  }
  else {
    return (&off_100034C98)[a1 - 1000];
  }
}

uint64_t sub_100005DBC()
{
  if (qword_100038EB0) {
    return 1;
  }
  v1 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.MobileInternetSharing", @"com.apple.MIS.logging.plist");
  qword_100038EB0 = (uint64_t)v1;
  if (v1
    && SCPreferencesSetCallback(v1, (SCPreferencesCallBack)sub_100005F14, 0)
    && SCPreferencesSetDispatchQueue((SCPreferencesRef)qword_100038EB0, (dispatch_queue_t)qword_100039470))
  {
    sub_100005F14((const __SCPreferences *)qword_100038EB0, 3);
    return 1;
  }
  int v2 = SCError();
  SCErrorString(v2);
  sub_100005EAC();
  uint64_t result = qword_100038EB0;
  if (qword_100038EB0)
  {
    CFRelease((CFTypeRef)qword_100038EB0);
    uint64_t result = 0;
    qword_100038EB0 = 0;
  }
  return result;
}

uint64_t sub_100005EAC()
{
  uint64_t result = sub_1000062C8();
  if (result) {
    return os_log_with_args();
  }
  return result;
}

void sub_100005F14(const __SCPreferences *a1, char a2)
{
  if ((a2 & 2) != 0)
  {
    sub_100005EAC();
    CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(a1, @"MISDLogging");
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        LODWORD(Value) = CFBooleanGetValue(Value);
      }
      else {
        LODWORD(Value) = 0;
      }
    }
    if (byte_100039480 != Value)
    {
      byte_100039480 = (char)Value;
      if (!dword_10003946C)
      {
        sub_1000062C8();
        sub_100005EAC();
      }
    }
    CFBooleanRef v6 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"EnablePFLog");
    CFTypeID v7 = CFBooleanGetTypeID();
    if (v6 && CFGetTypeID(v6) == v7) {
      int v8 = CFBooleanGetValue(v6);
    }
    else {
      int v8 = 0;
    }
    if (v8 != byte_100039485)
    {
      byte_100039485 = v8;
      sub_100005EAC();
    }
    CFPropertyListRef v9 = SCPreferencesGetValue(a1, @"IPv6OnlyPreferred");
    CFTypeID v10 = CFBooleanGetTypeID();
    int v11 = v9 && CFGetTypeID(v9) == v10 && CFBooleanGetValue((CFBooleanRef)v9) == 0;
    if (v11 != byte_100039482)
    {
      byte_100039482 = v11;
      sub_100005EAC();
    }
    CFPropertyListRef v12 = SCPreferencesGetValue(a1, @"IPv6UsePREF64");
    CFTypeID v13 = CFBooleanGetTypeID();
    int v14 = v12 && CFGetTypeID(v12) == v13 && CFBooleanGetValue((CFBooleanRef)v12) == 0;
    if (v14 != byte_100039483)
    {
      byte_100039483 = v14;
      sub_100005EAC();
    }
    CFPropertyListRef v15 = SCPreferencesGetValue(a1, @"IPv6Enable");
    CFTypeID v16 = CFBooleanGetTypeID();
    int v17 = v15 && CFGetTypeID(v15) == v16 && CFBooleanGetValue((CFBooleanRef)v15) == 0;
    if (v17 != byte_100039481)
    {
      byte_100039481 = v17;
      sub_100005EAC();
    }
    CFBooleanRef v18 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"PREF64OnDualSim");
    CFTypeID v19 = CFBooleanGetTypeID();
    if (v18 && CFGetTypeID(v18) == v19) {
      int v20 = CFBooleanGetValue(v18);
    }
    else {
      int v20 = 0;
    }
    if (v20 != byte_100039484)
    {
      byte_100039484 = v20;
      sub_100005EAC();
    }
    SCPreferencesSynchronize(a1);
  }
}

void sub_100006268()
{
  v0 = (const void *)qword_100038EB0;
  if (qword_100038EB0)
  {
    if (dword_10003946C) {
      BOOL v1 = 0;
    }
    else {
      BOOL v1 = byte_100039480 == 0;
    }
    if (!v1)
    {
      byte_100039480 = 0;
      sub_1000062C8();
      v0 = (const void *)qword_100038EB0;
    }
    CFRelease(v0);
    qword_100038EB0 = 0;
  }
}

BOOL sub_1000062C8()
{
  os_log_t v0 = (os_log_t)qword_100038EB8;
  if (!qword_100038EB8)
  {
    os_log_t v0 = os_log_create("com.apple.MobileInternetSharing", "daemon");
    qword_100038EB8 = (uint64_t)v0;
    if (!v0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100025414(&v2);
        os_log_t v0 = v2;
      }
      else
      {
        os_log_t v0 = 0;
      }
    }
  }
  return v0 != 0;
}

uint64_t sub_100006344(uint64_t a1)
{
  uint64_t v2 = a1;
  return sub_100006370(0, &v2);
}

uint64_t sub_100006370(uint64_t a1, void *a2)
{
  uint64_t v2 = (uint64_t *)qword_100038EC8;
  if (!qword_100038EC8) {
    return 0;
  }
  uint64_t v5 = 0;
  do
  {
    CFBooleanRef v6 = (uint64_t *)v2[13];
    if (!a1 || sub_100006AB8((uint64_t)v2, a1)) {
      v5 += sub_100006B70(v2, a2);
    }
    uint64_t v2 = v6;
  }
  while (v6);
  if (v5 && !qword_100038EC8)
  {
    sub_100005EAC();
    dispatch_source_cancel((dispatch_source_t)qword_100038ED0);
    dispatch_release((dispatch_object_t)qword_100038ED0);
    qword_100038ED0 = 0;
  }
  return v5;
}

uint64_t sub_100006424()
{
  return sub_100006370(0, 0);
}

uint64_t sub_100006430(uint64_t a1, _OWORD *a2, uint64_t a3, unint64_t a4, char a5)
{
  uint64_t v25 = a3;
  if (!qword_100038EC0) {
    goto LABEL_11;
  }
  sub_100005EAC();
  if ((a5 & 1) == 0)
  {
    uint64_t v9 = qword_100038EC8;
    if (qword_100038EC8)
    {
      unint64_t v10 = a4 / 0x3C + 2;
      while (!sub_100006AB8(v9, (uint64_t)a2))
      {
        uint64_t v9 = *(void *)(v9 + 104);
        if (!v9) {
          goto LABEL_10;
        }
      }
      sub_100005EAC();
      CFPropertyListRef v12 = *(void **)(v9 + 48);
      if (v12)
      {
        while (*v12 != a3)
        {
          CFPropertyListRef v12 = (void *)v12[1];
          if (!v12) {
            goto LABEL_16;
          }
        }
        goto LABEL_11;
      }
LABEL_16:
      CFTypeID v13 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
      *CFTypeID v13 = a3;
      v13[1] = *(void *)(v9 + 48);
      *(void *)(v9 + 48) = v13;
      if (v10 > *(unsigned __int16 *)(v9 + 98))
      {
        *(_WORD *)(v9 + 98) = v10;
        *(_WORD *)(v9 + 96) = v10;
        sub_100005EAC();
      }
    }
    else
    {
LABEL_10:
      int v26 = 786433;
      long long v28 = 0uLL;
      uint64_t v27 = 0;
      sub_100005EAC();
      if (os_nexus_controller_add_traffic_rule()) {
        goto LABEL_11;
      }
      sub_100005EAC();
      int v14 = malloc_type_malloc(0x70uLL, 0x1020040761EC19CuLL);
      long long v16 = a2[1];
      long long v15 = a2[2];
      *int v14 = *a2;
      v14[1] = v16;
      v14[2] = v15;
      *((void *)v14 + 13) = qword_100038EC8;
      qword_100038EC8 = (uint64_t)v14;
      ++qword_100038ED8;
      int v17 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
      *((void *)v14 + 6) = 0;
      *((void *)v14 + 7) = 0;
      *int v17 = a3;
      __int16 v18 = a4 / 0x3C + 2;
      *((_WORD *)v14 + 48) = v18;
      *((_WORD *)v14 + 49) = v18;
      sub_100005EAC();
      *((void *)v14 + 10) = 0;
      *((void *)v14 + 11) = 0;
      v17[1] = *((void *)v14 + 6);
      uint64_t v19 = *((void *)v14 + 7) + 1;
      *((void *)v14 + 6) = v17;
      *((void *)v14 + 7) = v19;
      v14[4] = v28;
    }
    if (qword_100038ED0) {
      goto LABEL_22;
    }
    int v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100039470);
    qword_100038ED0 = (uint64_t)v20;
    if (v20)
    {
      dispatch_source_set_event_handler(v20, &stru_100034D48);
      v21 = qword_100038ED0;
      dispatch_time_t v22 = dispatch_walltime(0, 60000000000);
      dispatch_source_set_timer(v21, v22, 0xDF8475800uLL, 0);
      byte_100038EE0 = 1;
      sub_100005EAC();
LABEL_22:
      if (byte_100038EE0 == 1)
      {
        dispatch_resume((dispatch_object_t)qword_100038ED0);
        byte_100038EE0 = 0;
      }
      goto LABEL_24;
    }
LABEL_11:
    sub_100005EAC();
    goto LABEL_12;
  }
  sub_100005EAC();
  uint64_t v24 = sub_100006370((uint64_t)a2, &v25);
  sub_100005EAC();
  if (v24)
  {
LABEL_24:
    uint64_t v11 = 1;
    sub_100005EAC();
    return v11;
  }
LABEL_12:
  sub_100005EAC();
  return 0;
}

uint64_t sub_100006848()
{
  if (qword_100038EC0) {
    sub_100025474();
  }
  uint64_t result = os_nexus_controller_create();
  qword_100038EC0 = result;
  return result;
}

uint64_t sub_10000687C()
{
  uint64_t result = qword_100038EC0;
  if (qword_100038EC0)
  {
    uint64_t result = os_nexus_controller_destroy();
    qword_100038EC0 = 0;
  }
  return result;
}

uint64_t sub_1000068AC(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 9) == 96) {
    return 0;
  }
  if (*(unsigned char *)(a2 + 8))
  {
    int v6 = socket(30, 2, 0);
    if (v6 < 0)
    {
      sub_100005EAC();
      return 0xFFFFFFFFLL;
    }
    int v7 = v6;
    int v12 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    if ((unint64_t)__strlcpy_chk() >= 0x10) {
      goto LABEL_8;
    }
    if (ioctl(v7, 0xC02469C9uLL, &v10) < 0)
    {
      sub_100005EAC();
    }
    else
    {
      int v8 = sub_100009E48(a1, 0, 0);
      if (v8 != 2)
      {
        if (v8) {
          goto LABEL_9;
        }
        char v9 = *(unsigned char *)(a2 + 8);
        if ((v9 & 4) != 0) {
          *(_OWORD *)(a2 + 12) = v11;
        }
        if ((v9 & 8) == 0 || (__memcpy_chk(), nw_nat64_synthesize_v6()))
        {
          uint64_t v3 = 0;
          *(unsigned char *)(a2 + 9) = 96;
          goto LABEL_21;
        }
LABEL_8:
        sub_100005EAC();
LABEL_9:
        uint64_t v3 = 0xFFFFFFFFLL;
LABEL_21:
        close(v7);
        return v3;
      }
    }
    uint64_t v3 = 0;
    goto LABEL_21;
  }
  sub_100005EAC();
  return 0;
}

BOOL sub_100006AB8(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8)) {
    return 0;
  }
  int v2 = *(unsigned __int8 *)(a1 + 9);
  if (v2 != *(unsigned __int8 *)(a2 + 9)) {
    return 0;
  }
  if (v2 == 96)
  {
    if (*(void *)(a1 + 12) != *(void *)(a2 + 12) || *(void *)(a1 + 20) != *(void *)(a2 + 20)) {
      return 0;
    }
    if (*(void *)(a1 + 28) != *(void *)(a2 + 28) || *(void *)(a1 + 36) != *(void *)(a2 + 36)) {
      return 0;
    }
  }
  else if (v2 != 4 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24) || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40))
  {
    return 0;
  }
  if (*(unsigned __int16 *)(a1 + 44) == *(unsigned __int16 *)(a2 + 44)) {
    return *(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46);
  }
  return 0;
}

uint64_t sub_100006B70(uint64_t *a1, void *a2)
{
  int v4 = a1 + 6;
  uint64_t result = a1[6];
  if (result)
  {
    while (1)
    {
      uint64_t v6 = *(void *)(result + 8);
      if (!a2 || *(void *)result == *a2)
      {
        uint64_t v7 = *v4;
        int v8 = v4;
        if (*v4 != result)
        {
          do
          {
            uint64_t v9 = v7;
            uint64_t v7 = *(void *)(v7 + 8);
          }
          while (v7 != result);
          int v8 = (uint64_t *)(v9 + 8);
        }
        *int v8 = v6;
        uint64_t v10 = a1[7];
        if (!v10) {
          sub_1000254A0();
        }
        a1[7] = v10 - 1;
        free((void *)result);
        if (!a1[7]) {
          break;
        }
      }
      uint64_t result = v6;
      if (!v6) {
        return result;
      }
    }
    long long v11 = &qword_100038EC8;
    uint64_t v12 = qword_100038EC8;
    if ((uint64_t *)qword_100038EC8 != a1)
    {
      do
      {
        uint64_t v13 = v12;
        uint64_t v12 = *(void *)(v12 + 104);
      }
      while ((uint64_t *)v12 != a1);
      long long v11 = (uint64_t *)(v13 + 104);
    }
    uint64_t *v11 = a1[13];
    if (!qword_100038ED8) {
      sub_1000254CC();
    }
    --qword_100038ED8;
    if (os_nexus_controller_remove_traffic_rule()) {
      sub_100005EAC();
    }
    free(a1);
    return 1;
  }
  return result;
}

void sub_100006C98(id a1)
{
  uint64_t v1 = qword_100038EC8;
  if (qword_100038EC8)
  {
    uint64_t v2 = 0;
    while ((PFStateQueryAppendTrafficDescriptor() & 1) != 0)
    {
      uint64_t v1 = *(void *)(v1 + 104);
      --v2;
      if (!v1)
      {
        if (!v2) {
          break;
        }
        PFFindStatesByDescriptor();
        return;
      }
    }
  }
  sub_100005EAC();
}

void sub_100006D34(id a1, BOOL a2, void *a3, void *a4)
{
  if (a2 && a3)
  {
    if (xpc_array_get_count(a3))
    {
      size_t v5 = 0;
      do
      {
        uint64_t v10 = 0;
        long long v9 = 0u;
        xpc_array_get_value(a3, v5);
        PFGetDescriptorStateDetails();
        uint64_t v6 = qword_100038EC8;
        while (v6)
        {
          uint64_t v7 = v6;
          uint64_t v6 = *(void *)(v6 + 104);
          if (!uuid_compare((const unsigned __int8 *)(v7 + 64), (const unsigned __int8 *)&v9))
          {
            sub_100005EAC();
            if ((_BYTE)v10 && *(_OWORD *)(v7 + 80) != 0)
            {
              sub_100005EAC();
              sub_100005EAC();
              *(_OWORD *)(v7 + 80) = 0u;
              *(_WORD *)(v7 + 96) = *(_WORD *)(v7 + 98);
            }
            else
            {
              if (!*(_WORD *)(v7 + 96)) {
                sub_1000254F8();
              }
              __int16 v8 = *(_WORD *)(v7 + 96) - 1;
              *(_WORD *)(v7 + 96) = v8;
              if (!v8) {
                sub_100006B70((uint64_t *)v7, 0);
              }
              sub_100005EAC();
            }
            break;
          }
        }
        ++v5;
      }
      while (v5 < xpc_array_get_count(a3));
    }
  }
  else
  {
    sub_100005EAC();
  }
  if (!qword_100038EC8)
  {
    sub_100005EAC();
    dispatch_source_cancel((dispatch_source_t)qword_100038ED0);
    dispatch_release((dispatch_object_t)qword_100038ED0);
    qword_100038ED0 = 0;
  }
  if (a3) {
    xpc_release(a3);
  }
}

uint64_t sub_100006F78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a4 || !result || !a2 || !a3) {
    sub_100025550();
  }
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a4;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 32) = a5;
  if (__CFADD__(dword_100039488++, 1)) {
    sub_100025524();
  }
  *(void *)uint64_t result = qword_1000394A0;
  qword_1000394A0 = result;
  return result;
}

void sub_100006FE0(uint64_t a1)
{
  if (!a1) {
    sub_10002557C();
  }
  uint64_t v1 = &qword_1000394A0;
  uint64_t v2 = &qword_1000394A0;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (v2[3] == a1)
    {
      for (i = (uint64_t *)qword_1000394A0; i != v2; i = (uint64_t *)*i)
        uint64_t v1 = i;
      uint64_t *v1 = *v2;
      if (!dword_100039488) {
        sub_1000255A8();
      }
      --dword_100039488;
      size_t v5 = (_xpc_connection_s *)v2[1];
      int v4 = (void *)v2[2];
      if (*(_DWORD *)(*(void *)(a1 + 280) + 288) == 101) {
        sub_100017C00(4);
      }
      if (v4 && v5)
      {
        xpc_dictionary_set_uint64(v4, off_100038BF8[0], 0x7D3uLL);
        sub_100007100(v5, v4);
        xpc_release(v4);
      }
      sub_100005EAC();
      free(v2);
      return;
    }
  }
}

void sub_100007100(_xpc_connection_s *a1, xpc_object_t object)
{
  int v4 = xpc_copy_description(object);
  sub_100005EAC();
  free(v4);

  xpc_connection_send_message(a1, object);
}

uint64_t sub_100007174(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v7 = reply;
    __int16 v8 = sub_10000DFBC((uint64_t)a1);
    if (v8 || (__int16 v8 = sub_10000E16C((uint64_t)a1, original)) != 0)
    {
      long long v9 = sub_10000E410(a1, (uint64_t)v8, a3);
      if (v9)
      {
        uint64_t v10 = v9;
        xpc_dictionary_set_uint64(v7, off_100038BF8[0], 0x7D1uLL);
        xpc_dictionary_set_string(v7, off_100038BA0[0], v10 + 96);
        uint64_t v11 = 1;
LABEL_10:
        sub_100007100(a1, v7);
        xpc_release(v7);
        return v11;
      }
      sub_100005EAC();
      sub_10000E0B8(v8);
    }
    else
    {
      sub_100005EAC();
    }
    xpc_dictionary_set_uint64(v7, off_100038BF8[0], 0x7D0uLL);
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  sub_100005EAC();
  return 0;
}

BOOL sub_1000072AC(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    sub_10000E5E4(original, (uint64_t)a1);
    xpc_dictionary_set_uint64(reply, off_100038BF8[0], 0x7D1uLL);
    sub_100007100(a1, reply);
    xpc_release(reply);
  }
  else
  {
    sub_100005EAC();
  }
  return reply != 0;
}

uint64_t sub_100007338(_xpc_connection_s *a1, xpc_object_t original)
{
  int v47 = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (!reply)
  {
    sub_100005EAC();
    return 0;
  }
  size_t v5 = reply;
  memset(v48, 0, sizeof(v48));
  uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
  if (!v6 || (uint64_t v7 = v6, (*(unsigned char *)(v6 + 508) & 1) == 0) || *(void *)(v6 + 24))
  {
    sub_100005EAC();
LABEL_8:
    uint64_t v8 = 0;
LABEL_9:
    uint64_t v9 = 2000;
LABEL_10:
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v9);
    sub_100007100(a1, v5);
    xpc_release(v5);
    return v8;
  }
  uint64_t v8 = (uint64_t)malloc_type_malloc(0x28uLL, 0x10A0040D1175C0DuLL);
  if (!v8)
  {
    sub_100005EAC();
    goto LABEL_9;
  }
  xpc_object_t value = xpc_dictionary_get_value(original, off_100038C60[0]);
  if (!value) {
    goto LABEL_19;
  }
  uint64_t v12 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_19;
  }
  xpc_object_t v13 = xpc_dictionary_get_value(original, off_100038C00[0]);
  if (!v13) {
    goto LABEL_19;
  }
  if (xpc_get_type(v13) != (xpc_type_t)&_xpc_type_uint64) {
    goto LABEL_19;
  }
  xpc_object_t v14 = xpc_dictionary_get_value(original, off_100038C08[0]);
  if (!v14) {
    goto LABEL_19;
  }
  if (xpc_get_type(v14) != (xpc_type_t)&_xpc_type_uint64) {
    goto LABEL_19;
  }
  xpc_object_t v15 = xpc_dictionary_get_value(v12, off_100038C70[0]);
  if (!v15) {
    goto LABEL_19;
  }
  long long v16 = v15;
  if (xpc_get_type(v15) != (xpc_type_t)&_xpc_type_uint64) {
    goto LABEL_19;
  }
  if (xpc_uint64_get_value(v16) != 1)
  {
    xpc_object_t v20 = xpc_dictionary_get_value(v12, off_100038C68[0]);
    if (!v20 || xpc_get_type(v20) != (xpc_type_t)&_xpc_type_string) {
      goto LABEL_19;
    }
  }
  xpc_object_t v17 = xpc_dictionary_get_value(v12, off_100038C80[0]);
  if (v17)
  {
    if (xpc_get_type(v17) != (xpc_type_t)&_xpc_type_uint64) {
      goto LABEL_19;
    }
  }
  xpc_object_t v18 = xpc_dictionary_get_value(v12, off_100038CB8[0]);
  if (v18)
  {
    if (xpc_get_type(v18) != (xpc_type_t)&_xpc_type_uint64) {
      goto LABEL_19;
    }
  }
  xpc_object_t v19 = xpc_dictionary_get_value(v12, off_100038C88[0]);
  if (v19)
  {
    if (xpc_get_type(v19) != (xpc_type_t)&_xpc_type_uint64) {
      goto LABEL_19;
    }
  }
  int uint64 = xpc_dictionary_get_uint64(original, off_100038C00[0]);
  int v22 = xpc_dictionary_get_uint64(v12, off_100038CB8[0]);
  int v46 = uint64;
  BOOL v23 = !v22 && uint64 == 201;
  int v24 = v23 ? 500 : v22;
  xpc_object_t v25 = xpc_dictionary_get_value(v12, off_100038CC0[0]);
  int v26 = v25;
  if (v25)
  {
    if (xpc_get_type(v25) != (xpc_type_t)&_xpc_type_dictionary) {
      goto LABEL_19;
    }
  }
  xpc_object_t v27 = xpc_dictionary_get_value(v12, off_100038CC8[0]);
  long long v28 = v27;
  if (v27)
  {
    if (xpc_get_type(v27) != (xpc_type_t)&_xpc_type_dictionary) {
      goto LABEL_19;
    }
  }
  if (!v26 && v24 == 502) {
    goto LABEL_19;
  }
  memset((char *)v48 + 4, 0, 92);
  LODWORD(v48[0]) = v24;
  if (v24 == 502)
  {
    xpc_object_t v29 = xpc_dictionary_get_value(v26, off_100038CD0[0]);
    if (!v29) {
      goto LABEL_19;
    }
    if (xpc_get_type(v29) != (xpc_type_t)&_xpc_type_string) {
      goto LABEL_19;
    }
    xpc_object_t v40 = xpc_dictionary_get_value(v26, off_100038CD8[0]);
    if (!v40) {
      goto LABEL_19;
    }
    if (xpc_get_type(v40) != (xpc_type_t)&_xpc_type_string) {
      goto LABEL_19;
    }
    string = xpc_dictionary_get_string(v26, off_100038CD0[0]);
    v42 = xpc_dictionary_get_string(v26, off_100038CD8[0]);
    if (!string || !v42) {
      goto LABEL_19;
    }
    __strlcpy_chk();
    __strlcpy_chk();
  }
  else if (v28 && v24 == 500 && !sub_100007A4C(v28, (char *)v48 + 4, (unsigned char *)&v48[3] + 2))
  {
    goto LABEL_20;
  }
  v30 = (char *)xpc_dictionary_get_string(v12, off_100038C90[0]);
  v31 = (char *)xpc_dictionary_get_string(v12, off_100038C98[0]);
  v32 = (char *)xpc_dictionary_get_string(v12, off_100038CA0[0]);
  if (!sub_100007B2C(v30, v31, v32)) {
    goto LABEL_20;
  }
  xpc_object_t v33 = xpc_dictionary_get_value(original, off_100038C20[0]);
  if (v33 && xpc_get_type(v33) != (xpc_type_t)&_xpc_type_string)
  {
LABEL_19:
    sub_100005EAC();
LABEL_20:
    free((void *)v8);
    goto LABEL_8;
  }
  int v34 = xpc_dictionary_get_uint64(original, off_100038C08[0]);
  v45 = (char *)xpc_dictionary_get_string(original, off_100038C20[0]);
  v44 = (char *)xpc_dictionary_get_string(v12, off_100038C68[0]);
  int v43 = xpc_dictionary_get_uint64(v12, off_100038C70[0]);
  int v35 = xpc_dictionary_get_uint64(v12, off_100038C80[0]);
  int v36 = xpc_dictionary_get_uint64(v12, off_100038C88[0]);
  v37 = sub_10000A090(v46, v34, v45, v44, v43, v35, v36, 0, 0, 0, v30, v31, v32, *(_DWORD *)(v7 + 508) & 0xFFFFFFFD, v48, 0, &v47);
  if (!v37)
  {
    if (xpc_dictionary_get_uint64(v12, off_100038C70[0]) != 1) {
      xpc_dictionary_get_string(v12, off_100038C68[0]);
    }
    goto LABEL_19;
  }
  uint64_t v38 = (uint64_t)v37;
  int v39 = sub_10000BB6C((uint64_t)v37, v7);
  if (!v39)
  {
    xpc_dictionary_set_string(v5, off_100038C10[0], (const char *)(v38 + 20));
    free((void *)v8);
    uint64_t v8 = 1;
    uint64_t v9 = 2001;
    goto LABEL_10;
  }
  if (v39 != 36)
  {
    sub_100009C08(v38);
    goto LABEL_20;
  }
  sub_100006F78(v8, (uint64_t)a1, (uint64_t)v5, v38, -1);
  if (xpc_dictionary_get_uint64(v12, off_100038C70[0]) != 1) {
    xpc_dictionary_get_string(v12, off_100038C68[0]);
  }
  sub_100005EAC();
  return 1;
}

uint64_t sub_100007A4C(void *a1, char *a2, unsigned char *a3)
{
  string = xpc_dictionary_get_string(a1, off_100038CD8[0]);
  if (string
    && (v7[0] = 0, v7[1] = 0, inet_pton(30, string, v7) == 1)
    && LOBYTE(v7[0]) == 253
    && inet_ntop(30, v7, a2, 0x2Eu))
  {
    *a3 = 64;
    return 1;
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
}

uint64_t sub_100007B2C(char *a1, char *a2, char *a3)
{
  if (!a1 && !a2 && !a3) {
    return 1;
  }
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (sub_10000FC34(a1) && sub_10000FC34(a2) && sub_10000FC34(a3))
        {
          in_addr_t v7 = inet_addr(a1);
          in_addr_t v8 = inet_addr(a2);
          in_addr_t v9 = inet_addr(a3);
          if (sub_10000FCB4(v9) && (int)sub_1000121A0(v9) < 31 && sub_1000155D4(v7) && sub_1000155D4(v8))
          {
            unsigned int v10 = bswap32(v9 & v7);
            if (bswap32(v7) >= v10 && v10 + ~(-1 << -(char)sub_1000121A0(v9)) >= bswap32(v8)) {
              return 1;
            }
          }
        }
      }
    }
  }
  sub_100005EAC();
  return 0;
}

uint64_t sub_100007CD4(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    if (v6 && (uint64_t v7 = v6, (*(unsigned char *)(v6 + 508) & 1) != 0) && (v10 = *(void *)(v6 + 88)) != 0)
    {
      sub_10000BE44(v10, v7);
      sub_100006424();
      uint64_t v8 = 1;
      sub_100005EAC();
      uint64_t v9 = 2001;
    }
    else
    {
      sub_100005EAC();
      uint64_t v8 = 0;
      uint64_t v9 = 2000;
    }
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v9);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v8;
}

BOOL sub_100007DCC(_xpc_connection_s *a1, xpc_object_t original)
{
  uint64_t value = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    BOOL v7 = v6 != 0;
    if (v6)
    {
      sub_1000178DC((_DWORD *)&value + 1, &value);
      xpc_dictionary_set_uint64(v5, off_100038BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v5, off_100038C18[0], HIDWORD(value));
      uint64_t v8 = off_100038C28[0];
      uint64_t v9 = value;
      uint64_t v10 = v5;
    }
    else
    {
      sub_100005EAC();
      uint64_t v8 = off_100038BF8[0];
      uint64_t v10 = v5;
      uint64_t v9 = 2000;
    }
    xpc_dictionary_set_uint64(v10, v8, v9);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v7;
}

BOOL sub_100007ED4(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    if (sub_10000E618(original, (uint64_t)a1)
      && (unsigned int uint64 = xpc_dictionary_get_uint64(original, off_100038C18[0]), uint64 - 1024 > 0xFFFFFFFB))
    {
      if (uint64 < 0x3FE) {
        int v9 = sub_100017944(uint64);
      }
      else {
        int v9 = sub_100017B20(uint64);
      }
      BOOL v7 = v9 == 0;
      if (v9) {
        uint64_t v8 = 2000;
      }
      else {
        uint64_t v8 = 2001;
      }
    }
    else
    {
      sub_100005EAC();
      BOOL v7 = 0;
      uint64_t v8 = 2000;
    }
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v8);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v7;
}

uint64_t sub_100007FDC(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    *(void *)string = 0;
    uint64_t v12 = 0;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    if (v6 && (*(unsigned char *)(v6 + 508) & 1) != 0)
    {
      int v9 = sub_1000182CC(string);
      BOOL v7 = off_100038BF8[0];
      if (!v9)
      {
        xpc_dictionary_set_uint64(v5, off_100038BF8[0], 0x7D1uLL);
        xpc_dictionary_set_string(v5, off_100038C20[0], string);
        uint64_t v8 = 1;
        goto LABEL_8;
      }
    }
    else
    {
      sub_100005EAC();
      BOOL v7 = off_100038BF8[0];
    }
    xpc_dictionary_set_uint64(v5, v7, 0x7D0uLL);
    uint64_t v8 = 0;
LABEL_8:
    sub_100007100(a1, v5);
    xpc_release(v5);
    return v8;
  }
  sub_100005EAC();
  return 0;
}

uint64_t sub_10000810C(_xpc_connection_s *a1, xpc_object_t original)
{
  LODWORD(value) = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    if (v6 && (*(unsigned char *)(v6 + 508) & 1) != 0)
    {
      sub_100018118((_WORD *)&value + 1, &value);
      xpc_dictionary_set_uint64(v5, off_100038BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v5, off_100038C30[0], WORD1(value));
      xpc_dictionary_set_uint64(v5, off_100038C38[0], (unsigned __int16)value);
      uint64_t v7 = 1;
    }
    else
    {
      sub_100005EAC();
      xpc_dictionary_set_uint64(v5, off_100038BF8[0], 0x7D0uLL);
      uint64_t v7 = 0;
    }
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v7;
}

uint64_t sub_100008224(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    if (v6
      && (*(unsigned char *)(v6 + 508) & 1) != 0
      && (xpc_object_t value = xpc_dictionary_get_value(original, off_100038C30[0])) != 0
      && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64
      && (uint64_t uint64 = xpc_dictionary_get_uint64(original, off_100038C30[0]), uint64 < 0x10000)
      && (v12 = uint64, (xpc_object_t v13 = xpc_dictionary_get_value(original, off_100038C38[0])) != 0)
      && xpc_get_type(v13) == (xpc_type_t)&_xpc_type_uint64
      && (uint64_t v14 = xpc_dictionary_get_uint64(original, off_100038C38[0]), v14 < 0x10000))
    {
      uint64_t v7 = sub_100018078(v12, v14);
      if (v7) {
        uint64_t v10 = 2001;
      }
      else {
        uint64_t v10 = 2000;
      }
    }
    else
    {
      sub_100005EAC();
      uint64_t v7 = 0;
      uint64_t v10 = 2000;
    }
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v10);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v7;
}

BOOL sub_10000839C(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    if (sub_10000E618(original, (uint64_t)a1))
    {
      BOOL v6 = sub_100018284();
      if (v6) {
        uint64_t v7 = 2001;
      }
      else {
        uint64_t v7 = 2000;
      }
    }
    else
    {
      sub_100005EAC();
      BOOL v6 = 0;
      uint64_t v7 = 2000;
    }
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v7);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v6;
}

uint64_t sub_100008460(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    if (v6)
    {
      unsigned int uint64 = xpc_dictionary_get_uint64(original, off_100038C40[0]);
      if (uint64 - 7 > 0xFFFFFFFA)
      {
        xpc_object_t value = xpc_dictionary_get_value(original, netrbClientHostDeviceId[0]);
        if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64) {
          uint64_t v10 = xpc_dictionary_get_uint64(original, off_100038C78[0]);
        }
        else {
          uint64_t v10 = 0xFFFFFFFFLL;
        }
        sub_10000E904(v6, uint64, v10);
        uint64_t v6 = 1;
        uint64_t v8 = 2001;
        goto LABEL_13;
      }
      sub_100005EAC();
      uint64_t v6 = 0;
    }
    else
    {
      sub_100005EAC();
    }
    uint64_t v8 = 2000;
LABEL_13:
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v8);
    sub_100007100(a1, v5);
    xpc_release(v5);
    return v6;
  }
  sub_100005EAC();
  return 0;
}

uint64_t sub_1000085B8(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    if (v6)
    {
      unsigned int uint64 = xpc_dictionary_get_uint64(original, off_100038C40[0]);
      if (uint64 - 7 > 0xFFFFFFFA)
      {
        xpc_object_t value = xpc_dictionary_get_value(original, netrbClientHostDeviceId[0]);
        if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64) {
          uint64_t v10 = xpc_dictionary_get_uint64(original, off_100038C78[0]);
        }
        else {
          uint64_t v10 = 0xFFFFFFFFLL;
        }
        sub_10000EA1C(v6, uint64, v10);
        uint64_t v6 = 1;
        uint64_t v8 = 2001;
        goto LABEL_13;
      }
      sub_100005EAC();
      uint64_t v6 = 0;
    }
    else
    {
      sub_100005EAC();
    }
    uint64_t v8 = 2000;
LABEL_13:
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v8);
    sub_100007100(a1, v5);
    xpc_release(v5);
    return v6;
  }
  sub_100005EAC();
  return 0;
}

BOOL sub_100008710(_xpc_connection_s *a1, xpc_object_t original)
{
  uint64_t value = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    BOOL v7 = v6 != 0;
    if (v6)
    {
      sub_10000EB0C(v6, (_DWORD *)&value + 1, &value);
      xpc_dictionary_set_uint64(v5, off_100038BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v5, off_100038C48[0], HIDWORD(value));
      uint64_t v8 = off_100038C50[0];
      uint64_t v9 = value;
      uint64_t v10 = v5;
    }
    else
    {
      sub_100005EAC();
      uint64_t v8 = off_100038BF8[0];
      uint64_t v10 = v5;
      uint64_t v9 = 2000;
    }
    xpc_dictionary_set_uint64(v10, v8, v9);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v7;
}

uint64_t sub_100008818(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    size_t v5 = reply;
    uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
    if (v6
      && (uint64_t v7 = v6, v8 = xpc_dictionary_get_uint64(original, off_100038C40[0]), v8 - 7 > 0xFFFFFFFA)
      && xpc_dictionary_get_value(original, off_100038C58[0]))
    {
      unsigned int uint64 = xpc_dictionary_get_uint64(original, off_100038C58[0]);
      uint64_t v9 = sub_10000EB40(v7, v8, uint64);
      if (v9) {
        uint64_t v11 = 2001;
      }
      else {
        uint64_t v11 = 2000;
      }
    }
    else
    {
      sub_100005EAC();
      uint64_t v9 = 0;
      uint64_t v11 = 2000;
    }
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], v11);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v9;
}

uint64_t sub_10000895C(_xpc_connection_s *a1, xpc_object_t original)
{
  *(_OWORD *)xpc_object_t v40 = 0u;
  memset(v41, 0, sizeof(v41));
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (!reply)
  {
    sub_100005EAC();
    return 0;
  }
  size_t v5 = reply;
  uint64_t v6 = sub_10000E618(original, (uint64_t)a1);
  if (!v6)
  {
    sub_100005EAC();
LABEL_18:
    sub_100005EAC();
    xpc_dictionary_set_uint64(v5, off_100038BF8[0], 0x7D0uLL);
    sub_100007100(a1, v5);
    xpc_release(v5);
    return 0;
  }
  uint64_t v7 = v6;
  if ((*(unsigned char *)(v6 + 508) & 0xA) == 0 || *(void *)(v6 + 24) || *(void *)(v6 + 88) || (sub_10000E880(v6) & 1) == 0)
  {
LABEL_17:
    sub_100005EAC();
    goto LABEL_18;
  }
  int uint64 = xpc_dictionary_get_uint64(original, off_100038C00[0]);
  int v9 = xpc_dictionary_get_uint64(original, off_100038C80[0]);
  if (v9) {
    sub_100005EAC();
  }
  if ((uint64 - 202) < 2)
  {
    uint64_t v38 = 0;
    BOOL v10 = 0;
  }
  else if (uint64 == 204)
  {
    uint64_t v38 = (char *)xpc_dictionary_get_string(original, off_100038C20[0]);
    if (!v38 || !*v38 || !sub_100009108(v38)) {
      goto LABEL_17;
    }
    if ((*(unsigned char *)(v7 + 508) & 8) != 0) {
      goto LABEL_71;
    }
    int v9 = sub_10000A8C4(v38);
    BOOL v10 = xpc_dictionary_get_BOOL(original, off_100038BD0[0]);
    sub_100005EAC();
  }
  else
  {
    if (uint64 != 201) {
      goto LABEL_17;
    }
    BOOL v10 = 0;
    uint64_t v38 = off_100038CB0[0];
  }
  sub_100005EAC();
  uuid = xpc_dictionary_get_uuid(original, off_100038CE0[0]);
  if (!uuid)
  {
    if (uint64 == 202)
    {
      sub_10001232C(202);
      goto LABEL_17;
    }
    BOOL v36 = v10;
    xpc_object_t v17 = xpc_dictionary_get_string(original, off_100038C90[0]);
    xpc_object_t v18 = (char *)xpc_dictionary_get_string(original, off_100038C98[0]);
    xpc_object_t v19 = xpc_dictionary_get_string(original, off_100038CA0[0]);
    xpc_object_t v20 = (char *)v19;
    int v35 = v18;
    if (uint64 == 204)
    {
      if (v17 || v18 || v19) {
        goto LABEL_17;
      }
    }
    else
    {
      v21 = (char *)v17;
      int v22 = v17;
      BOOL v23 = v20;
      int v24 = sub_100007B2C(v21, v18, v20);
      xpc_object_t v20 = v23;
      xpc_object_t v17 = v22;
      uuid = 0;
      if (!v24) {
        goto LABEL_18;
      }
    }
    string = v20;
    xpc_object_t value = xpc_dictionary_get_value(original, off_100038CC8[0]);
    if (value)
    {
      if (uint64 != 201) {
        goto LABEL_17;
      }
      int v26 = value;
      if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary) {
        goto LABEL_17;
      }
      if (!sub_100007A4C(v26, v40, &v39)) {
        goto LABEL_18;
      }
    }
    int v34 = 0;
    goto LABEL_61;
  }
  if (uint64 != 202)
  {
    sub_10001232C(uint64);
    goto LABEL_17;
  }
  xpc_object_t v13 = (char *)xpc_dictionary_get_string(original, off_100038CE8[0]);
  string = (char *)xpc_dictionary_get_string(original, off_100038CA0[0]);
  if (v13)
  {
    if (!sub_10000FC34(v13)) {
      goto LABEL_17;
    }
    if (!string) {
      goto LABEL_17;
    }
    in_addr_t v14 = inet_addr(string);
    if (!sub_10000FCB4(v14)) {
      goto LABEL_17;
    }
  }
  xpc_object_t v15 = (char *)xpc_dictionary_get_string(original, off_100038CF0[0]);
  BOOL v36 = v10;
  if (!v15)
  {
    int v34 = v13;
    int v35 = 0;
    xpc_object_t v17 = 0;
LABEL_61:
    xpc_object_t v33 = 0;
    goto LABEL_62;
  }
  long long v16 = v15;
  if (!sub_10000FD04(v15)) {
    goto LABEL_17;
  }
  xpc_object_t v33 = v16;
  int v34 = v13;
  xpc_object_t v17 = 0;
  int v35 = 0;
LABEL_62:
  if (xpc_dictionary_get_value(original, off_100038BC0[0]) && !xpc_dictionary_get_BOOL(original, off_100038BC0[0]))
  {
    if ((*(unsigned char *)(v7 + 508) & 8) == 0)
    {
      char v28 = 0;
      goto LABEL_69;
    }
LABEL_71:
    sub_100005EAC();
    xpc_dictionary_set_uint64(v5, off_100038BE8[0], 0x1771uLL);
    goto LABEL_18;
  }
  xpc_object_t v27 = xpc_dictionary_get_uuid(original, off_100038BA8[0]);
  if (sub_100018F6C(v27, v5)) {
    goto LABEL_17;
  }
  xpc_object_t v29 = xpc_dictionary_get_string(v5, off_100038BB0[0]);
  v30 = ether_aton(v29);
  __int16 v31 = *(_WORD *)&v30->octet[4];
  *(_DWORD *)(v7 + 9) = *(_DWORD *)v30->octet;
  *(_WORD *)(v7 + 13) = v31;
  char v28 = 1;
LABEL_69:
  *(unsigned char *)(v7 + 76) = xpc_dictionary_get_BOOL(original, off_100038BC8[0]);
  *(unsigned char *)(v7 + 77) = xpc_dictionary_get_BOOL(original, off_100038BD8[0]);
  *(unsigned char *)(v7 + 78) = xpc_dictionary_get_BOOL(original, off_100038BE0[0]);
  *(unsigned char *)(v7 + 79) = v36;
  *(unsigned char *)(v7 + 8) = v28;
  *(_DWORD *)(v7 + 72) = v9;
  if (sub_10000EC20(v7)) {
    goto LABEL_17;
  }
  if (v17)
  {
    xpc_dictionary_set_string(v5, off_100038C90[0], v17);
    xpc_dictionary_set_string(v5, off_100038C98[0], v35);
    xpc_dictionary_set_string(v5, off_100038CA0[0], string);
  }
  if (v38) {
    xpc_dictionary_set_string(v5, off_100038C20[0], v38);
  }
  if (v40[0]) {
    xpc_dictionary_set_string(v5, off_100038CD8[0], v40);
  }
  if (uuid)
  {
    xpc_dictionary_set_uuid(v5, off_100038CE0[0], uuid);
    if (v34)
    {
      xpc_dictionary_set_string(v5, off_100038CE8[0], v34);
      xpc_dictionary_set_string(v5, off_100038CA0[0], string);
    }
    if (v33) {
      xpc_dictionary_set_string(v5, off_100038CF0[0], v33);
    }
  }
  *(_DWORD *)(v7 + 48) = uint64;
  *(void *)(v7 + 56) = a1;
  *(void *)(v7 + 64) = v5;
  if (__CFADD__(dword_1000394D0++, 1)) {
    sub_1000255D4();
  }
  return 1;
}

BOOL sub_100009108(const char *a1)
{
  xpc_object_t v2 = sub_1000247FC();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  size_t count = xpc_array_get_count(v2);
  if (count)
  {
    size_t v5 = count;
    string = xpc_array_get_string(v3, 0);
    if (!strcmp(string, a1))
    {
      BOOL v11 = 1;
    }
    else
    {
      size_t v7 = 1;
      do
      {
        size_t v8 = v7;
        if (v5 == v7) {
          break;
        }
        int v9 = xpc_array_get_string(v3, v7);
        int v10 = strcmp(v9, a1);
        size_t v7 = v8 + 1;
      }
      while (v10);
      BOOL v11 = v8 < v5;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  xpc_release(v3);
  return v11;
}

BOOL sub_1000091B8(_xpc_connection_s *a1, void *a2)
{
  unsigned __int16 v20 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  __int16 v17 = 0;
  long long v16 = 0;
  memset(v15, 0, sizeof(v15));
  xpc_object_t xdict = 0;
  BOOL v4 = 0;
  if (sub_100009434((uint64_t)a1, a2, (uint64_t *)&v15[1], &xdict))
  {
    unsigned __int8 v21 = 0;
    BOOL v4 = 0;
    if (sub_1000094F0(a2, v15, &v20, &v21, &v18, &v17, &v16))
    {
      uint64_t v5 = *(void *)&v15[1];
      uint64_t v6 = *(void *)(*(void *)&v15[1] + 88);
      if (!v6) {
        goto LABEL_13;
      }
      uint64_t v7 = *(void *)(v6 + 288);
      if (!v7) {
        goto LABEL_13;
      }
      int v8 = v21;
      if (v21 == 2)
      {
        int v9 = *(_DWORD *)(v7 + 680);
        if (v18 == v9 || (*(_DWORD *)(v7 + 684) & (v9 ^ v18)) != 0) {
          goto LABEL_13;
        }
      }
      else
      {
        v13[0] = 0;
        v13[1] = 0;
        if (*(_DWORD *)(v7 + 1128) != 500 || *(unsigned char *)(v7 + 1107) || !*(unsigned char *)(v7 + 1178)) {
          goto LABEL_13;
        }
        inet_pton(30, (const char *)(v7 + 1132), v13);
        if (v13[0] != v18 || !v19)
        {
          inet_ntop(30, &v18, v22, 0x2Eu);
LABEL_13:
          sub_100005EAC();
          BOOL v4 = 0;
          goto LABEL_14;
        }
      }
      BOOL v4 = sub_1000200D8(v5, v15[0], v20, v8, &v18, v17) == 0;
    }
  }
LABEL_14:
  xpc_object_t v10 = xdict;
  if (xdict)
  {
    if (v4) {
      uint64_t v11 = 2001;
    }
    else {
      uint64_t v11 = 2000;
    }
    xpc_dictionary_set_uint64(xdict, off_100038BF8[0], v11);
    sub_100007100(a1, v10);
    xpc_release(v10);
  }
  return v4;
}

uint64_t sub_100009434(uint64_t a1, xpc_object_t original, uint64_t *a3, void *a4)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (!reply)
  {
    sub_100005EAC();
    uint64_t v10 = 0;
LABEL_7:
    uint64_t result = 0;
    goto LABEL_8;
  }
  uint64_t v9 = sub_10000E618(original, a1);
  uint64_t v10 = v9;
  if (!v9 || *(_DWORD *)(v9 + 48) != 201)
  {
    sub_100005EAC();
    goto LABEL_7;
  }
  uint64_t result = 1;
LABEL_8:
  *a4 = reply;
  *a3 = v10;
  return result;
}

uint64_t sub_1000094F0(void *a1, unsigned char *a2, _WORD *a3, unsigned char *a4, void *a5, _WORD *a6, const char **a7)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, off_100038CF8[0]);
  if (!value) {
    goto LABEL_3;
  }
  in_addr_t v14 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_3;
  }
  char uint64 = xpc_dictionary_get_uint64(v14, off_100038D20[0]);
  *a4 = uint64;
  if (uint64 != 2 && uint64 != 30) {
    goto LABEL_3;
  }
  if (a2)
  {
    char v19 = xpc_dictionary_get_uint64(v14, off_100038D08[0]);
    *a2 = v19;
    if (v19 != 6 && v19 != 17) {
      goto LABEL_3;
    }
  }
  if (a3 && (__int16 v21 = xpc_dictionary_get_uint64(v14, off_100038D10[0]), (*a3 = v21) == 0)
    || a6 && (__int16 v22 = xpc_dictionary_get_uint64(v14, off_100038D28), (*a6 = v22) == 0))
  {
LABEL_3:
    sub_100005EAC();
    string = 0;
    goto LABEL_4;
  }
  if (a5)
  {
    string = xpc_dictionary_get_string(v14, off_100038D18[0]);
    if (!string || !inet_pton(*a4, string, a5))
    {
      sub_100005EAC();
LABEL_4:
      uint64_t result = 0;
      if (!a7) {
        return result;
      }
      goto LABEL_5;
    }
  }
  else
  {
    string = 0;
  }
  uint64_t result = 1;
  if (a7) {
LABEL_5:
  }
    *a7 = string;
  return result;
}

BOOL sub_1000096C0(_xpc_connection_s *a1, void *a2)
{
  unsigned __int16 v11 = 0;
  uint64_t v10 = 0;
  unsigned __int8 v9 = 0;
  xpc_object_t xdict = 0;
  BOOL v4 = 0;
  if (sub_100009434((uint64_t)a1, a2, &v10, &xdict))
  {
    unsigned __int8 v12 = 0;
    BOOL v4 = 0;
    if (sub_1000094F0(a2, &v9, &v11, &v12, 0, 0, 0)) {
      BOOL v4 = sub_10002037C(v10, v9, v11, v12) == 0;
    }
  }
  xpc_object_t v5 = xdict;
  if (xdict)
  {
    if (v4) {
      uint64_t v6 = 2001;
    }
    else {
      uint64_t v6 = 2000;
    }
    xpc_dictionary_set_uint64(xdict, off_100038BF8[0], v6);
    sub_100007100(a1, v5);
    xpc_release(v5);
  }
  return v4;
}

BOOL sub_1000097A0(_xpc_connection_s *a1, void *a2)
{
  xpc_object_t xdict = 0;
  uint64_t v10 = 0;
  if (sub_100009434((uint64_t)a1, a2, &v10, &xdict)
    && (unsigned __int8 v11 = 0, sub_1000094F0(a2, 0, 0, &v11, 0, 0, 0)))
  {
    xpc_object_t v4 = sub_100020500(v10, v11);
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
    xpc_object_t v4 = 0;
  }
  xpc_object_t v6 = xdict;
  if (xdict)
  {
    if (v5) {
      uint64_t v7 = 2001;
    }
    else {
      uint64_t v7 = 2000;
    }
    xpc_dictionary_set_uint64(xdict, off_100038BF8[0], v7);
    if (v4) {
      xpc_dictionary_set_value(v6, off_100038D00[0], v4);
    }
    sub_100007100(a1, v6);
    xpc_release(v6);
  }
  if (v4) {
    xpc_release(v4);
  }
  return v5;
}

uint64_t sub_10000989C(_xpc_connection_s *a1, void *a2)
{
  sub_100005EAC();

  return sub_1000098EC(a1, a2, 0);
}

uint64_t sub_1000098EC(_xpc_connection_s *a1, void *a2, char a3)
{
  uint64_t v6 = sub_10000E618(a2, (uint64_t)a1);
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v7 = *(void *)(v6 + 88);
  if (!v7)
  {
    sub_100005EAC();
    uint64_t v7 = qword_100039490;
    if (!qword_100039490) {
      goto LABEL_16;
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  if ((sub_100004944(a2, (uint64_t)&v21) & 1) == 0) {
    goto LABEL_16;
  }
  if (BYTE9(v21) == 4 && (~BYTE8(v21) & 0x14) == 0 && PFQueryGatewayAddrAndPortForDescriptor())
  {
    DWORD2(v22) = 0;
    WORD6(v23) = 0;
    sub_100005EAC();
  }
  else
  {
    sub_100005EAC();
    BYTE8(v21) &= 0xEBu;
  }
  if ((sub_1000068AC(*(void *)(v7 + 296), (uint64_t)&v21) & 0x80000000) == 0)
  {
    LOBYTE(v21) = 2;
    WORD1(v21) = 48;
    DWORD1(v21) = 3;
    xpc_object_t value = xpc_dictionary_get_value(a2, netrbClientLowLatencyFlowParam[0]);
    xpc_object_t v9 = xpc_dictionary_get_value(value, netrbClientIfnetTrafficDescriptorDeviceId[0]);
    if (v9 && (uint64_t v10 = v9, xpc_get_type(v9) == (xpc_type_t)&_xpc_type_uint64)) {
      uint64_t v11 = xpc_uint64_get_value(v10);
    }
    else {
      uint64_t v11 = 0xFFFFFFFFLL;
    }
    xpc_object_t v18 = xpc_dictionary_get_value(value, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout[0]);
    if (v18 && (char v19 = v18, xpc_get_type(v18) == (xpc_type_t)&_xpc_type_uint64))
    {
      uint64_t v20 = xpc_uint64_get_value(v19);
      sub_100005EAC();
    }
    else
    {
      uint64_t v20 = 300;
    }
    uint64_t v12 = sub_100006430(v7, &v21, v11, v20, a3);
  }
  else
  {
LABEL_16:
    sub_100005EAC();
    uint64_t v12 = 0;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  if (reply)
  {
    in_addr_t v14 = reply;
    if (v12) {
      uint64_t v15 = 2001;
    }
    else {
      uint64_t v15 = 2000;
    }
  }
  else
  {
    uint64_t v15 = 2000;
    do
    {
      sub_100005EAC();
      xpc_object_t v16 = xpc_dictionary_create_reply(a2);
    }
    while (!v16);
    in_addr_t v14 = v16;
    uint64_t v12 = 0;
  }
  xpc_dictionary_set_uint64(v14, off_100038BF8[0], v15);
  sub_100007100(a1, v14);
  xpc_release(v14);
  return v12;
}

uint64_t sub_100009BB8(_xpc_connection_s *a1, void *a2)
{
  sub_100005EAC();

  return sub_1000098EC(a1, a2, 1);
}

void sub_100009C08(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16)) {
    sub_100025658();
  }
  uint64_t v2 = *(void *)(a1 + 280);
  if (v2)
  {
    int v3 = *(_DWORD *)(v2 + 288);
    if (v3 != 101 && (v3 != 103 || (*(unsigned char *)(v2 + 584) & 2) != 0 && *(_DWORD *)(v2 + 20) != 204)) {
      sub_10001F968((void *)a1);
    }
  }
  uint64_t v4 = *(void *)(a1 + 288);
  if (v4)
  {
    BOOL v5 = *(void (**)(void))(v4 + 624);
    if (!v5) {
      sub_10002562C();
    }
    v5();
  }
  uint64_t v6 = *(uint64_t **)(a1 + 280);
  if (v6)
  {
    sub_100009D2C(v6);
    *(void *)(a1 + 280) = 0;
  }
  uint64_t v7 = *(uint64_t **)(a1 + 288);
  if (v7)
  {
    sub_100009D2C(v7);
    *(void *)(a1 + 288) = 0;
  }
  int v8 = *(uint64_t **)(a1 + 296);
  if (v8)
  {
    sub_100009D2C(v8);
    *(void *)(a1 + 296) = 0;
  }
  xpc_object_t v9 = &qword_100039490;
  for (i = (uint64_t *)qword_100039490; i != (uint64_t *)a1; i = (uint64_t *)*i)
    xpc_object_t v9 = i;
  *xpc_object_t v9 = *(void *)a1;
  if (!dword_100038EE8) {
    sub_100025600();
  }
  --dword_100038EE8;
  sub_100005EAC();

  free((void *)a1);
}

void sub_100009D2C(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 2);
  if (!v1) {
    sub_100025684();
  }
  int v3 = v1 - 1;
  *((_DWORD *)a1 + 2) = v3;
  if (!v3)
  {
    uint64_t v4 = (void (*)(uint64_t *))a1[75];
    if (v4) {
      v4(a1);
    }
    BOOL v5 = &qword_100039498;
    for (i = (uint64_t *)qword_100039498; i != a1; i = (uint64_t *)*i)
      BOOL v5 = i;
    *BOOL v5 = *a1;
    if (!dword_100038F08) {
      sub_1000256B0();
    }
    --dword_100038F08;
    sub_100005EAC();
    free(a1);
  }
}

uint64_t sub_100009E48(uint64_t a1, char a2, char *a3)
{
  if (*(_DWORD *)(a1 + 1264) != 1 || (a2 & 1) != 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v6 = socket(30, 2, 0);
    if (v6 < 0)
    {
      sub_100005EAC();
      *(_DWORD *)(a1 + 1264) = -1;
      return 1;
    }
    int v7 = v6;
    if ((unint64_t)__strlcpy_chk() >= 0x10)
    {
      sub_100005EAC();
      uint64_t v5 = 1;
LABEL_11:
      *(_DWORD *)(a1 + 1264) = -1;
LABEL_12:
      close(v7);
      return v5;
    }
    if (ioctl(v7, 0xC06069C1uLL, &v12) < 0 || (v14 - 13) <= 0xFFFFFFF3)
    {
      sub_100005EAC();
      uint64_t v5 = 2;
      goto LABEL_11;
    }
    *(_DWORD *)(a1 + 1264) = 1;
    if (*(void *)(a1 + 1244) == (void)v13
      && *(void *)(a1 + 1252) == *((void *)&v13 + 1)
      && *(_DWORD *)(a1 + 1260) == (unint64_t)v14)
    {
      sub_100005EAC();
      if (a3)
      {
        char v11 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      *(_OWORD *)(a1 + 1244) = v13;
      *(_DWORD *)(a1 + 1260) = v14;
      if (a3)
      {
        char v11 = 1;
LABEL_25:
        *a3 = v11;
      }
    }
    sub_100005EAC();
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  sub_100005EAC();
  return 0;
}

char *sub_10000A090(int a1, int a2, char *__s1, char *a4, int a5, int a6, int a7, int *a8, unsigned __int8 *src, long long *a10, char *a11, const char *a12, const char *a13, int a14, _OWORD *a15, int a16, int *a17)
{
  unsigned int v17 = a1 - 200;
  if ((a1 - 200) >= 5) {
    goto LABEL_5;
  }
  int v18 = a2 - 300;
  if ((a2 - 300) >= 5) {
    goto LABEL_5;
  }
  int v24 = dword_1000290F4[v17];
  if (a5 == 1 && v17 >= 2) {
    goto LABEL_5;
  }
  if (a5 == 1 && a2 != 301) {
    goto LABEL_5;
  }
  if (a5 == 1) {
    char v28 = "_auth";
  }
  else {
    char v28 = a4;
  }
  if (a5 == 1) {
    int v29 = 101;
  }
  else {
    int v29 = dword_100029108[v17];
  }
  if (!a15) {
    sub_1000256DC();
  }
  if ((*(_DWORD *)a15 - 500) >= 3 || v17 <= 1 && *(_DWORD *)a15 == 501) {
    goto LABEL_5;
  }
  int v57 = v29;
  int v55 = dword_10002911C[v18];
  v60 = (char *)v28;
  BOOL v58 = a5 != 1;
  if (a5 != 1 && !if_nametoindex(a4)) {
    goto LABEL_5;
  }
  if (__s1)
  {
    int v30 = *__s1;
    if (*__s1)
    {
      if (v17 != 4 && !strncmp(__s1, off_100038CB0[0], 0x10uLL))
      {
        sub_100005EAC();
        int v30 = 1;
      }
      else
      {
        if (!if_nametoindex(__s1))
        {
LABEL_5:
          sub_100005EAC();
          xpc_object_t v25 = 0;
          int v26 = 22;
LABEL_6:
          *a17 = v26;
          return v25;
        }
        int v30 = 0;
      }
      if (v24 != 201 && v24 != 204) {
        goto LABEL_5;
      }
    }
  }
  else
  {
    int v30 = 0;
  }
  int v56 = v30;
  if (v17 <= 1)
  {
    if (v30)
    {
      uint64_t v31 = qword_100039498;
      if (qword_100039498)
      {
        __s2 = off_100038CB0[0];
        while (*(_DWORD *)(v31 + 16) != 1
             || *(_DWORD *)(v31 + 1128) != 502
             || *(_DWORD *)(v31 + 20) != 201
             || !strncmp((const char *)(v31 + 308), __s2, 0x100uLL))
        {
          uint64_t v31 = *(void *)v31;
          if (!v31) {
            goto LABEL_51;
          }
        }
LABEL_87:
        sub_100005EAC();
        xpc_object_t v25 = 0;
        int v26 = 16;
        goto LABEL_6;
      }
    }
    else if (__s1)
    {
      if (*(_DWORD *)a15 == 502)
      {
        if (*__s1)
        {
          uint64_t v32 = qword_100039498;
          if (qword_100039498)
          {
            __s2a = off_100038CB0[0];
            while (*(_DWORD *)(v32 + 16) != 1
                 || *(_DWORD *)(v32 + 20) != 201
                 || strncmp((const char *)(v32 + 308), __s2a, 0x100uLL))
            {
              uint64_t v32 = *(void *)v32;
              if (!v32) {
                goto LABEL_51;
              }
            }
            goto LABEL_87;
          }
        }
      }
    }
  }
LABEL_51:
  xpc_object_t v33 = (char *)malloc_type_malloc(0x138uLL, 0x1020040F55D4EC8uLL);
  xpc_object_t v25 = v33;
  if (!v33)
  {
    strerror(12);
    sub_100005EAC();
    *a17 = 12;
    return v25;
  }
  BOOL v34 = 0;
  *((void *)v33 + 38) = 0;
  *((_OWORD *)v33 + 17) = 0u;
  *((_OWORD *)v33 + 18) = 0u;
  *((_OWORD *)v33 + 15) = 0u;
  *((_OWORD *)v33 + 16) = 0u;
  *((_OWORD *)v33 + 13) = 0u;
  *((_OWORD *)v33 + 14) = 0u;
  *((_OWORD *)v33 + 11) = 0u;
  *((_OWORD *)v33 + 12) = 0u;
  *((_OWORD *)v33 + 9) = 0u;
  *((_OWORD *)v33 + 10) = 0u;
  *((_OWORD *)v33 + 7) = 0u;
  *((_OWORD *)v33 + 8) = 0u;
  *((_OWORD *)v33 + 5) = 0u;
  *((_OWORD *)v33 + 6) = 0u;
  *((_OWORD *)v33 + 3) = 0u;
  *((_OWORD *)v33 + 4) = 0u;
  *((_OWORD *)v33 + 1) = 0u;
  *((_OWORD *)v33 + 2) = 0u;
  char v35 = !v58;
  if (v18 == 1) {
    char v35 = 1;
  }
  *(_OWORD *)xpc_object_t v33 = 0uLL;
  BOOL v36 = v60;
  if ((v35 & 1) == 0 && dword_100038D30)
  {
    BOOL v36 = v60;
    BOOL v34 = sub_10000A778(v60) == 0;
  }
  BOOL v59 = v34;
  v37 = sub_10000A868(v36);
  if (v37)
  {
    sub_100009D2C(v37);
    sub_100005EAC();
    int v38 = 17;
LABEL_83:
    *a17 = v38;
    free(v25);
    return 0;
  }
  if (a5 != 1 && !a6) {
    a6 = sub_10000A8C4(v60);
  }
  char v39 = sub_10000AA18(__s1, v57, v24, v56, a15);
  if (!v39) {
    goto LABEL_76;
  }
  xpc_object_t v40 = (char *)v39 + 308;
  __s2b = (char *)v39;
  int v41 = *((unsigned __int8 *)v39 + 1107);
  if (!v59)
  {
    int v46 = sub_10000AD24(0, v24, v55, v60, v40, a5, v57, a6, a7, 0, a8, a11, a12, a13, a14, v56, a15, v41 != 0, src,
            a10,
            a16);
    if (v46)
    {
      int v43 = v46;
      v45 = 0;
      goto LABEL_79;
    }
LABEL_81:
    sub_100009D2C((uint64_t *)__s2b);
    goto LABEL_82;
  }
  v51 = (char *)v39 + 308;
  v42 = sub_10000AD24(0, v24, v55, v60, v40, a5, v57, a6, (int)&_mh_execute_header, (unint64_t)&_mh_execute_header >> 32, a8, 0, 0, 0, a14, v56, a15, v41 != 0, src,
          0,
          a16);
  if (!v42) {
    goto LABEL_81;
  }
  int v43 = v42;
  if (v17 == 4) {
    v44 = __s1;
  }
  else {
    v44 = v51;
  }
  v45 = sub_10000B184(*((_DWORD *)v42 + 74), a11, a12, a13, v24, v55, v44, a14, v56, a15, __s2b[1107], src, a10, a16);
  if (!v45)
  {
    sub_100009D2C(v43);
    sub_100009D2C((uint64_t *)__s2b);
LABEL_76:
    sub_100005EAC();
LABEL_82:
    int v38 = 6;
    goto LABEL_83;
  }
LABEL_79:
  int v47 = dword_100038EEC++;
  *((_DWORD *)v25 + 69) = v47;
  *((_DWORD *)v25 + 4) = 0;
  *((void *)v25 + 36) = v45;
  *((void *)v25 + 37) = __s2b;
  *((void *)v25 + 35) = v43;
  unsigned int v48 = *((_DWORD *)v43 + 72) - 100;
  if (v48 > 4) {
    v49 = "unknown";
  }
  else {
    v49 = off_100034E68[v48];
  }
  snprintf(v25 + 20, 0x100uLL, "%s.%s-%d", "com.apple.MobileInternetSharing", v49, v47);
  *(void *)xpc_object_t v25 = qword_100039490;
  qword_100039490 = (uint64_t)v25;
  sub_100005EAC();
  if (__CFADD__(dword_100038EE8++, 1)) {
    sub_100025708();
  }
  *a17 = 0;
  return v25;
}

uint64_t sub_10000A778(const char *a1)
{
  int v8 = 0;
  if (!a1 || !*a1) {
    sub_100025734();
  }
  if (getifaddrs(&v8))
  {
    uint64_t v2 = *__error();
    sub_100005EAC();
    int v3 = v8;
    if (!v8) {
      return v2;
    }
    goto LABEL_13;
  }
  int v3 = v8;
  if (v8)
  {
    uint64_t v4 = v8;
    while (1)
    {
      if (!strncmp(a1, v4->ifa_name, 0x10uLL))
      {
        ifa_addr = v4->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18) {
            break;
          }
        }
      }
      uint64_t v4 = v4->ifa_next;
      if (!v4) {
        goto LABEL_12;
      }
    }
    if (ifa_addr->sa_data[4] == 6)
    {
      ifa_data = (unsigned __int8 *)v4->ifa_data;
      if (!ifa_data || *ifa_data != 209)
      {
        uint64_t v2 = 0;
        if (!v3) {
          return v2;
        }
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  uint64_t v2 = 22;
  if (v3) {
LABEL_13:
  }
    freeifaddrs(v3);
  return v2;
}

uint64_t *sub_10000A868(char *__s1)
{
  uint64_t v2 = &qword_100039498;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (!strncmp(__s1, (const char *)v2 + 28, 0x100uLL))
    {
      int v3 = *((_DWORD *)v2 + 2);
      *((_DWORD *)v2 + 2) = v3 + 1;
      if (v3 == -1) {
        sub_100025760();
      }
      return v2;
    }
  }
  return v2;
}

uint64_t sub_10000A8C4(unsigned char *a1)
{
  if (!a1) {
    sub_10002578C();
  }
  if (!*a1) {
    sub_1000257B8();
  }
  long long v4 = 0u;
  long long v5 = 0u;
  int v1 = socket(2, 2, 0);
  if (v1 < 0)
  {
    sub_100005EAC();
    goto LABEL_12;
  }
  int v2 = v1;
  long long v4 = 0u;
  long long v5 = 0u;
  if ((unint64_t)__strlcpy_chk() >= 0x10)
  {
    sub_100005EAC();
    close(v2);
LABEL_12:
    sub_100005EAC();
    return 1500;
  }
  if (ioctl(v2, 0xC0206933uLL, &v4) == -1) {
    sub_100005EAC();
  }
  if (close(v2)) {
    sub_100005EAC();
  }
  uint64_t result = v5;
  if ((int)v5 <= 0) {
    goto LABEL_12;
  }
  return result;
}

void *sub_10000AA18(char *__s1, int a2, int a3, int a4, _OWORD *a5)
{
  if (__s1)
  {
    if (*__s1) {
      int v10 = a4 ^ 1;
    }
    else {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)stat __str = 0u;
  long long v21 = 0u;
  uint64_t v11 = qword_100039498;
  if (qword_100039498)
  {
    char v12 = v10 ^ 1 | a4;
    int v13 = v10 | a4;
    while (1)
    {
      if ((v12 & 1) == 0 && !strncmp(__s1, (const char *)(v11 + 308), 0x100uLL) && *(_DWORD *)(v11 + 16) != 1)
      {
        sub_100005EAC();
        return 0;
      }
      if (*(_DWORD *)(v11 + 16) == 1
        && *(_DWORD *)(v11 + 20) == a3
        && (!v13 || a4 && *(unsigned char *)(v11 + 564) || __s1 && !strncmp(__s1, (const char *)(v11 + 308), 0x100uLL)))
      {
        break;
      }
      uint64_t v11 = *(void *)v11;
      if (!v11) {
        goto LABEL_19;
      }
    }
    int v18 = *(_DWORD *)(v11 + 8);
    *(_DWORD *)(v11 + 8) = v18 + 1;
    if (v18 == -1) {
      sub_1000257E4();
    }
    sub_100005EAC();
  }
  else
  {
LABEL_19:
    char v14 = v10 ^ a4 ^ 1;
    if (v10 != a4) {
      int v15 = 102;
    }
    else {
      int v15 = 100;
    }
    if (byte_100039450)
    {
      char v14 = 0;
      int v15 = 102;
    }
    if (a2 == 103) {
      int v16 = 103;
    }
    else {
      int v16 = v15;
    }
    if (a2 == 103) {
      char v17 = 0;
    }
    else {
      char v17 = v14;
    }
    switch(v16)
    {
      case 'f':
        snprintf(__str, 0x100uLL, "%s");
        break;
      default:
        snprintf(__str, 0x100uLL, "ext-%s-%d");
        break;
    }
    return sub_10000AD24(1, a3, 0, __str, byte_1000290F0, 0, v16, 0, 0, 0, 0, 0, 0, 0, 0, a4, a5, v17, 0,
             0,
             0);
  }
  return (void *)v11;
}

void *sub_10000AD24(int a1, int a2, int a3, const char *a4, const char *a5, int a6, int a7, int a8, int a9, int a10, int *a11, const char *a12, const char *a13, const char *a14, int a15, char a16, _OWORD *a17, char a18, unsigned __int8 *src, long long *a20,int a21)
{
  int v21 = a7 - 100;
  if ((a7 - 100) >= 5) {
    sub_100025894();
  }
  long long v28 = malloc_type_malloc(0x500uLL, 0x10A004065807024uLL);
  long long v29 = v28;
  if (v28)
  {
    int v47 = a5;
    if (a20
      && (*((_DWORD *)a20 + 8)
       || (*(void *)a20 == *(void *)in6addr_any.__u6_addr8
         ? (BOOL v30 = *((void *)a20 + 1) == *(void *)&in6addr_any.__u6_addr32[2])
         : (BOOL v30 = 0),
           !v30)))
    {
      if (a12) {
        sub_100025868();
      }
      int v31 = a1;
      int v46 = 1;
    }
    else
    {
      int v31 = a1;
      int v46 = 0;
    }
    bzero(v28, 0x500uLL);
    *((_DWORD *)v29 + 2) = 1;
    *((_DWORD *)v29 + 4) = v31;
    *((_DWORD *)v29 + 5) = a2;
    *((_DWORD *)v29 + 6) = a3;
    *((_DWORD *)v29 + 72) = a7;
    *((_DWORD *)v29 + 73) = a9;
    *((_DWORD *)v29 + 76) = a10;
    if (v31) {
      int v32 = 0;
    }
    else {
      int v32 = a8;
    }
    *((_DWORD *)v29 + 74) = v32;
    snprintf((char *)v29 + 28, 0x100uLL, "%s", a4);
    *((_DWORD *)v29 + 71) = a6;
    if (a11)
    {
      int v33 = *a11;
      *((_WORD *)v29 + 322) = *((_WORD *)a11 + 2);
      *((_DWORD *)v29 + 160) = v33;
      *((unsigned char *)v29 + 646) = 1;
    }
    if (a12) {
      in_addr_t v34 = inet_addr(a12);
    }
    else {
      in_addr_t v34 = 0;
    }
    *((_DWORD *)v29 + 173) = v34;
    if (a13) {
      in_addr_t v35 = inet_addr(a13);
    }
    else {
      in_addr_t v35 = 0;
    }
    *((_DWORD *)v29 + 174) = v35;
    if (a14) {
      in_addr_t v36 = inet_addr(a14);
    }
    else {
      in_addr_t v36 = 0;
    }
    *((_DWORD *)v29 + 171) = v36;
    snprintf((char *)v29 + 565, 0x10uLL, "%s", v47);
    *((unsigned char *)v29 + 564) = a16;
    *((_DWORD *)v29 + 146) = a15;
    *((_DWORD *)v29 + 310) = a21;
    if (!a17) {
      sub_100025810();
    }
    long long v37 = a17[1];
    *(_OWORD *)(v29 + 141) = *a17;
    *(_OWORD *)(v29 + 143) = v37;
    long long v38 = a17[2];
    long long v39 = a17[3];
    long long v40 = a17[5];
    *(_OWORD *)(v29 + 149) = a17[4];
    *(_OWORD *)(v29 + 151) = v40;
    *(_OWORD *)(v29 + 145) = v38;
    *(_OWORD *)(v29 + 147) = v39;
    *((unsigned char *)v29 + 1107) = a18;
    if (v46)
    {
      long long v41 = *a20;
      long long v42 = a20[1];
      *(_OWORD *)((char *)v29 + 676) = *(long long *)((char *)a20 + 28);
      *(_OWORD *)(v29 + 81) = v41;
      *(_OWORD *)(v29 + 83) = v42;
      *((unsigned char *)v29 + 688) = 1;
    }
    if (src) {
      uuid_copy((unsigned __int8 *)v29 + 1224, src);
    }
    switch(v21)
    {
      case 0:
        int v43 = sub_100013E4C((uint64_t)v29);
        if (v43) {
          goto LABEL_39;
        }
        goto LABEL_41;
      case 1:
        int v43 = sub_100019C2C((uint64_t)v29);
        if (!v43) {
          goto LABEL_41;
        }
        goto LABEL_39;
      case 2:
        goto LABEL_38;
      case 3:
        goto LABEL_40;
      case 4:
        if (a2 == 201)
        {
LABEL_38:
          int v43 = sub_100014898((uint64_t)v29);
          if (v43)
          {
LABEL_39:
            strerror(v43);
            sub_100005EAC();
            free(v29);
            return 0;
          }
        }
        else
        {
LABEL_40:
          int v43 = sub_100015EC4((uint64_t)v29);
          if (v43) {
            goto LABEL_39;
          }
        }
LABEL_41:
        if (__CFADD__(dword_100038F08++, 1)) {
          sub_10002583C();
        }
        *long long v29 = qword_100039498;
        qword_100039498 = (uint64_t)v29;
        sub_100005EAC();
        break;
      default:
        int v43 = 45;
        goto LABEL_39;
    }
  }
  return v29;
}

void *sub_10000B184(int a1, char *a2, const char *a3, const char *a4, int a5, int a6, const char *a7, int a8, char a9, _OWORD *a10, char a11, unsigned __int8 *src, long long *a13, int a14)
{
  if (a2)
  {
    HIDWORD(v29) = inet_addr(a2);
    LODWORD(v29) = inet_addr(a3);
    uint64_t v21 = inet_addr(a4);
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v21 = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)stat __str = 0u;
  long long v32 = 0u;
  uint64_t v22 = qword_100039498;
  if (!qword_100039498)
  {
LABEL_24:
    if (sub_10001C8FC(__str)) {
      return 0;
    }
    else {
      return sub_10000AD24(0, a5, a6, __str, a7, 0, 104, a1, 0, 0, 0, a2, a3, a4, a8, a9, a10, a11, src, a13, a14);
    }
  }
  while (1)
  {
    if (*(_DWORD *)(v22 + 16)) {
      goto LABEL_12;
    }
    if (*(_DWORD *)(v22 + 288) != 104) {
      goto LABEL_12;
    }
    if (*(_DWORD *)(v22 + 20) != a5) {
      goto LABEL_12;
    }
    if (*(_DWORD *)(v22 + 24) != a6) {
      goto LABEL_12;
    }
    if (*(_DWORD *)(v22 + 296) != a1) {
      goto LABEL_12;
    }
    if (*(_DWORD *)(v22 + 584) != a8) {
      goto LABEL_12;
    }
    uint64_t v23 = v21;
    int v24 = strncmp((const char *)(v22 + 565), a7, 0x10uLL);
    uint64_t v21 = v23;
    if (v24
      || a2
      && (v29 != __PAIR64__(*(_DWORD *)(v22 + 692), *(_DWORD *)(v22 + 696)) || v23 != *(_DWORD *)(v22 + 684)))
    {
      goto LABEL_12;
    }
    int is_null = uuid_is_null((const unsigned __int8 *)(v22 + 1224));
    if (src) {
      break;
    }
    uint64_t v21 = v23;
    if (is_null) {
      goto LABEL_22;
    }
LABEL_12:
    uint64_t v22 = *(void *)v22;
    if (!v22) {
      goto LABEL_24;
    }
  }
  uint64_t v21 = v23;
  if (is_null) {
    goto LABEL_12;
  }
  int v26 = uuid_compare(src, (const unsigned __int8 *)(v22 + 1224));
  uint64_t v21 = v23;
  if (v26) {
    goto LABEL_12;
  }
LABEL_22:
  int v27 = *(_DWORD *)(v22 + 8);
  *(_DWORD *)(v22 + 8) = v27 + 1;
  if (v27 == -1) {
    sub_1000258C0();
  }
  sub_100005EAC();
  return (void *)v22;
}

void sub_10000B498(uint64_t a1, int a2)
{
  if (a2 == 36 || *(_DWORD *)(a1 + 16) != 1) {
    sub_1000258EC();
  }
  int v3 = (uint64_t *)qword_1000394A0;
  if (qword_1000394A0)
  {
    int v5 = 0;
    do
    {
      while (1)
      {
        int v6 = v3;
        int v3 = (uint64_t *)*v3;
        uint64_t v7 = v6[3];
        if (v7)
        {
          if (*(void *)(v7 + 296) == a1) {
            break;
          }
        }
        if (!v3) {
          return;
        }
      }
      if (*(_DWORD *)(v7 + 16) != 1) {
        sub_100025918();
      }
      if (!a2) {
        int v5 = sub_10000B648(v6[3], (*(_DWORD *)(*(void *)(v7 + 8) + 508) >> 3) & 1);
      }
      int v8 = (void *)v6[2];
      if (v8)
      {
        xpc_object_t v9 = (_xpc_connection_s *)v6[1];
        if (v9)
        {
          int v10 = (void *)v6[2];
          if (a2 | v5)
          {
            xpc_dictionary_set_uint64(v10, off_100038BF8[0], 0x7D0uLL);
          }
          else
          {
            xpc_dictionary_set_uint64(v10, off_100038BF8[0], 0x7D1uLL);
            xpc_dictionary_set_string(v8, off_100038C10[0], (const char *)(v7 + 20));
            int v11 = *((_DWORD *)v6 + 8);
            if (v11 != -1) {
              xpc_dictionary_set_fd(v8, off_100038BB8[0], v11);
            }
          }
          sub_100007100(v9, v8);
          xpc_release(v8);
        }
      }
      if (a2 | v5)
      {
        sub_10000B9A0(v7);
        sub_100009C08(v7);
      }
      char v12 = (uint64_t *)qword_1000394A0;
      if ((uint64_t *)qword_1000394A0 == v6)
      {
        int v13 = &qword_1000394A0;
      }
      else
      {
        do
        {
          int v13 = v12;
          char v12 = (uint64_t *)*v12;
        }
        while (v12 != v6);
      }
      *int v13 = *v6;
      free(v6);
      --dword_100039488;
    }
    while (v3);
  }
}

uint64_t sub_10000B648(uint64_t a1, int a2)
{
  if (byte_100039481) {
    goto LABEL_2;
  }
  uint64_t v5 = *(void *)(a1 + 296);
  int v6 = *(_DWORD *)(v5 + 1128);
  if (v6 == 502) {
    goto LABEL_10;
  }
  if (v6 != 500)
  {
LABEL_2:
    BOOL v4 = 0;
    goto LABEL_11;
  }
  if (*(unsigned char *)(v5 + 1107))
  {
    if (!*(unsigned char *)(v5 + 704))
    {
      if (*(unsigned char *)(v5 + 564)) {
        sub_10002599C();
      }
      goto LABEL_2;
    }
    goto LABEL_10;
  }
  if (*(unsigned char *)(v5 + 564))
  {
LABEL_10:
    BOOL v4 = 1;
    goto LABEL_11;
  }
  BOOL v4 = *(unsigned char *)(v5 + 1105) != 0;
LABEL_11:
  int v7 = *(_DWORD *)(*(void *)(a1 + 280) + 288);
  if (*(void *)(a1 + 288)) {
    uint64_t v8 = *(void *)(a1 + 288);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 280);
  }
  int v9 = *(unsigned __int8 *)(v8 + 700);
  if (*(_DWORD *)(v8 + 288) != 104)
  {
LABEL_21:
    int v13 = *(uint64_t (**)(uint64_t, uint64_t, void))(v8 + 592);
    if (!v13) {
      sub_100025970();
    }
    uint64_t v11 = v13(a1 + 20, v8, *(void *)(a1 + 296));
    if (!v11)
    {
      if ((v7 | 2) == 0x67 && ((*(unsigned char *)(v8 + 584) & 2) == 0 || *(_DWORD *)(v8 + 20) == 204)
        || (uint64_t v11 = sub_10001E394((void *)a1), !v11))
      {
        char v14 = *(uint64_t (**)(uint64_t, void, uint64_t))(v8 + 608);
        char v15 = !v4;
        if (!v14) {
          char v15 = 1;
        }
        if ((v15 & 1) != 0 || (uint64_t v11 = v14(a1 + 20, *(void *)(a1 + 296), v8), !v11))
        {
          if ((v7 | 2) != 0x67
            && !*(unsigned char *)(v8 + 700)
            && ((uint64_t v24 = *(void *)(a1 + 296), *(_DWORD *)(v24 + 680)) ? (v25 = 1) : (v25 = v4),
                ((v25 & 1) != 0 || *(unsigned char *)(v24 + 564))
             && (xpc_object_t v26 = xpc_array_create(0, 0),
                 xpc_array_set_string(v26, 0xFFFFFFFFFFFFFFFFLL, (const char *)(v8 + 308)),
                 uint64_t v11 = sub_100024A14(*(void *)(a1 + 296), v26),
                 xpc_release(v26),
                 v11)))
          {
            sub_100005EAC();
          }
          else
          {
            *(_DWORD *)(a1 + 16) = 2;
            uint64_t v11 = 0;
            *(void *)(a1 + 304) = mach_continuous_time();
          }
        }
      }
    }
    goto LABEL_35;
  }
  int v10 = *(uint64_t (**)(uint64_t))(v8 + 616);
  if (!v10) {
    sub_100025944();
  }
  uint64_t v11 = v10(v8);
  if (!v11)
  {
    if (a2)
    {
      uint64_t v12 = *(void *)(a1 + 280);
      if (!*(unsigned char *)(v12 + 646)
        || (sub_10001C9A8(*(void *)(a1 + 288) + 308, v12 + 308, (int *)(v12 + 640), 0) & 1) == 0)
      {
        sub_100005EAC();
        uint64_t v11 = 0;
        *__error() = 22;
        goto LABEL_35;
      }
      sub_100005EAC();
    }
    goto LABEL_21;
  }
LABEL_35:
  int v16 = *(_DWORD *)(v8 + 288);
  if (v9 || v16 == 101 || (*(unsigned char *)(v8 + 700) ? (BOOL v17 = v11 == 0) : (BOOL v17 = 1), v17))
  {
    if (v16 == 101 || v11 != 0) {
      return v11;
    }
    if (*(unsigned char *)(v8 + 700)) {
      return v11;
    }
    int v19 = *(_DWORD *)(v8 + 20);
    if ((v19 | 2) != 0xCB) {
      return v11;
    }
    int v20 = 1;
    *(unsigned char *)(v8 + 700) = 1;
    if (v19 != 201)
    {
      if (v19 != 203) {
        return v11;
      }
      goto LABEL_56;
    }
LABEL_58:
    uint64_t v22 = &dword_1000394D4;
    goto LABEL_59;
  }
  int v21 = *(_DWORD *)(v8 + 20);
  if ((v21 | 2) != 0xCB) {
    return v11;
  }
  *(unsigned char *)(v8 + 700) = 0;
  if (v21 == 201)
  {
    int v20 = -1;
    goto LABEL_58;
  }
  if (v21 == 203)
  {
    int v20 = -1;
LABEL_56:
    uint64_t v22 = &dword_1000394D8;
LABEL_59:
    *v22 += v20;
  }
  return v11;
}

uint64_t sub_10000B9A0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 2)
  {
    uint64_t v2 = *(void *)(a1 + 280);
    if (v2)
    {
      if (*(void *)(a1 + 304))
      {
        if (*(_DWORD *)(v2 + 284) < 2u) {
          goto LABEL_9;
        }
        if (mach_continuous_time() < *(void *)(a1 + 304)) {
          sub_1000259C8();
        }
        mach_timebase_info info = 0;
        if (!mach_timebase_info(&info)) {
          analytics_send_event_lazy();
        }
      }
    }
  }
  sub_100005EAC();
LABEL_9:
  *(_DWORD *)(a1 + 16) = 0;
  if (!*(void *)(a1 + 8)) {
    return sub_100005EAC();
  }
  uint64_t result = sub_100005EAC();
  *(void *)(*(void *)(a1 + 8) + 88) = 0;
  *(void *)(a1 + 8) = 0;
  return result;
}

uint64_t sub_10000BB6C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 88) || *(void *)(a1 + 8)) {
    return 16;
  }
  int v5 = *(_DWORD *)(a1 + 16);
  if (v5)
  {
    if (v5 == 1) {
      return 0;
    }
    else {
      return 37;
    }
  }
  unsigned int v18 = 0;
  uint64_t v7 = *(void *)(a1 + 280);
  int v8 = *(_DWORD *)(v7 + 288);
  if (v8 == 103) {
    goto LABEL_10;
  }
  int v13 = *(_DWORD *)(v7 + 584);
  if (v8 == 101) {
    sub_100005EAC();
  }
  int v14 = sub_10001789C(v8 == 101, v13);
  int v15 = v14;
  if (v14)
  {
    strerror(v14);
    sub_100005EAC();
  }
  unsigned int v18 = v15;
  if ((*(unsigned char *)(a2 + 508) & 2) == 0)
  {
    if (v15 && *(_DWORD *)(*(void *)(a1 + 280) + 288) == 102) {
      goto LABEL_40;
    }
    goto LABEL_10;
  }
  uint64_t v16 = *(void *)(a1 + 296);
  if (v15) {
    BOOL v17 = (char *)(v16 + 308) == netrbClientAnyExternal[0];
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    sub_100005EAC();
    goto LABEL_10;
  }
  if (!v15 || *(_DWORD *)(v16 + 288) != 100)
  {
LABEL_10:
    if (*(_DWORD *)(*(void *)(a1 + 280) + 288) != 101 || (sub_100017BC4(&v18) & 1) != 0)
    {
      uint64_t v9 = *(void *)(a1 + 288);
      if (!v9
        || (unsigned int v18 = sub_10001B7DC((char *)(v9 + 308), *(_DWORD *)(v9 + 20), *(_DWORD *)(v9 + 24), *(unsigned int *)(v9 + 584), (char *)(v9 + 565), (*(_DWORD *)(v9 + 1240) >> 1) & 1)) == 0)
      {
        uint64_t v10 = *(void *)(a1 + 296);
        if (!v10 || (uint64_t v11 = *(uint64_t (**)(uint64_t))(v10 + 592)) == 0) {
          sub_1000259F4();
        }
        unsigned int v12 = v11(a1 + 20);
        unsigned int v18 = v12;
        if (v12)
        {
          if (v12 == 36 || v12 == 62) {
            *(_DWORD *)(a1 + 16) = 1;
          }
          else {
            sub_1000178B8();
          }
        }
        else
        {
          unsigned int v18 = sub_10000B648(a1, (*(_DWORD *)(a2 + 508) >> 3) & 1);
        }
      }
      goto LABEL_40;
    }
  }
  sub_100005EAC();
LABEL_40:
  uint64_t v3 = v18;
  if (*(_DWORD *)(*(void *)(a1 + 280) + 288) != 103)
  {
    sub_100017C00(v18);
    uint64_t v3 = v18;
  }
  if (v3)
  {
    if (v3 != 36)
    {
      sub_10000B9A0(a1);
      sub_100017C00(v3);
      return v3;
    }
    if (*(_DWORD *)(a1 + 16) != 1) {
      sub_100025A78();
    }
  }
  if (*(void *)(a1 + 8)) {
    sub_100025A4C();
  }
  *(void *)(a1 + 8) = a2;
  if (*(void *)(a2 + 88)) {
    sub_100025A20();
  }
  *(void *)(a2 + 88) = a1;
  sub_100005EAC();
  return v3;
}

void sub_10000BE44(uint64_t a1, uint64_t a2)
{
  sub_10000BE88(a2);

  sub_10000BF00(a1, a2);
}

void *sub_10000BE88(uint64_t a1)
{
  for (uint64_t i = 0; i != 7; ++i)
  {
    uint64_t v3 = a1 + 8 * i;
    uint64_t result = *(void **)(v3 + 424);
    if (result)
    {
      int v5 = (void *)(v3 + 424);
      do
      {
        *int v5 = result[2];
        free(result);
        uint64_t result = (void *)*v5;
      }
      while (*v5);
    }
    uint64_t v6 = a1 + 4 * i;
    signed int v7 = *(_DWORD *)(v6 + 480);
    *(_DWORD *)(v6 + 480) = 0;
    if (v7 >= 1) {
      uint64_t result = (void *)sub_100018204(i, v7);
    }
  }
  return result;
}

void sub_10000BF00(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 88) && *(void *)(a1 + 8))
  {
    sub_10000B9A0(a1);
    sub_100006FE0(a1);
    sub_100009C08(a1);
  }
}

uint64_t sub_10000BF60()
{
  if (dword_100038D44 != -1) {
    return 0;
  }
  notify_key = (const char *)nwi_state_get_notify_key();
  if (!notify_register_dispatch(notify_key, &dword_100038D44, (dispatch_queue_t)qword_100039470, &stru_100034DC8))
  {
    sub_10000BFF0();
    sub_1000207F0(1);
    sub_1000208E4(1);
    return 0;
  }
  sub_100005EAC();
  uint64_t result = 0xFFFFFFFFLL;
  dword_100038D44 = -1;
  return result;
}

uint64_t sub_10000BFF0()
{
  int v0 = dword_1000394B8;
  int v1 = dword_1000394BC;
  uint64_t v16 = 0;
  if (dword_100038D44 == -1 || (uint64_t v15 = nwi_state_copy()) == 0)
  {
    return sub_100005EAC();
  }
  else
  {
    sub_100005EAC();
    for (uint64_t i = qword_1000394A8; i; uint64_t i = *(void *)i)
    {
      *(_WORD *)(i + 40) = *(unsigned __int8 *)(i + 41);
      *(_DWORD *)(i + 28) = -1;
    }
    for (uint64_t j = qword_1000394B0; j; uint64_t j = *(void *)j)
    {
      *(_WORD *)(j + 40) = *(unsigned __int8 *)(j + 41);
      *(_DWORD *)(j + 28) = -1;
    }
    dword_1000394B8 = 0;
    dword_1000394BC = 0;
    uint64_t result = sub_1000125C4(&v15, 2, (_DWORD *)&v16 + 1);
    if (v15)
    {
      int v5 = result;
      uint64_t result = sub_1000125C4(&v15, 30, &v16);
      if (v15)
      {
        if (v0 == dword_1000394B8) {
          int v6 = v5;
        }
        else {
          int v6 = 1;
        }
        if (v1 == dword_1000394BC) {
          int v7 = result;
        }
        else {
          int v7 = 1;
        }
        uint64_t v8 = qword_100039498;
        if ((v6 | v7) == 1 && qword_100039498 != 0)
        {
          while (*(_DWORD *)(v8 + 16) != 1 || !*(unsigned char *)(v8 + 564))
          {
            uint64_t v8 = *(void *)v8;
            if (!v8) {
              goto LABEL_51;
            }
          }
          int v10 = HIDWORD(v16);
          if (SHIDWORD(v16) >= (int)v16) {
            int v10 = v16;
          }
          if (!v10) {
            int v10 = 1500;
          }
          *(_DWORD *)(v8 + 296) = v10;
          *(_DWORD *)(v8 + 300) = v10 - 40;
          if (v6)
          {
            sub_10001D138((char *)(v8 + 308), 0, 0, v10 - 40);
            uint64_t v11 = qword_1000394A8;
            if (qword_1000394A8)
            {
              while (!*(unsigned char *)(v11 + 40) || *(unsigned char *)(v11 + 41))
              {
                uint64_t v11 = *(void *)v11;
                if (!v11) {
                  goto LABEL_39;
                }
              }
              sub_10001FEFC((char *)(v8 + 308), 1, 0);
            }
          }
LABEL_39:
          if (byte_100039481) {
            int v12 = 0;
          }
          else {
            int v12 = v7;
          }
          if (v12 == 1)
          {
            sub_10001DC54((char *)(v8 + 308), *(_DWORD *)(v8 + 300));
            uint64_t v13 = qword_1000394B0;
            if (qword_1000394B0)
            {
              while (!*(unsigned char *)(v13 + 40) || *(unsigned char *)(v13 + 41))
              {
                uint64_t v13 = *(void *)v13;
                if (!v13) {
                  goto LABEL_49;
                }
              }
              sub_10001FEFC((char *)(v8 + 308), 0, 1);
            }
LABEL_49:
            int v14 = sub_100023308();
            if (v14)
            {
              strerror(v14);
              sub_100005EAC();
            }
          }
        }
LABEL_51:
        return nwi_state_release();
      }
    }
  }
  return result;
}

uint64_t sub_10000C2B8()
{
  uint64_t result = dword_100038D44;
  if (dword_100038D44 != -1)
  {
    notify_cancel(dword_100038D44);
    dword_100038D44 = -1;
    int v1 = (uint64_t *)qword_1000394A8;
    if (qword_1000394A8)
    {
      do
      {
        uint64_t v2 = (uint64_t *)qword_1000394A8;
        if ((uint64_t *)qword_1000394A8 == v1)
        {
          uint64_t v3 = &qword_1000394A8;
        }
        else
        {
          do
          {
            uint64_t v3 = v2;
            uint64_t v2 = (uint64_t *)*v2;
          }
          while (v2 != v1);
        }
        BOOL v4 = (uint64_t *)*v1;
        *uint64_t v3 = *v1;
        free(v1);
        if (!dword_100038EF0) {
          sub_100025AD0();
        }
        --dword_100038EF0;
        int v1 = v4;
      }
      while (v4);
    }
    int v5 = (uint64_t *)qword_1000394B0;
    if (qword_1000394B0)
    {
      do
      {
        int v6 = (uint64_t *)qword_1000394B0;
        if ((uint64_t *)qword_1000394B0 == v5)
        {
          int v7 = &qword_1000394B0;
        }
        else
        {
          do
          {
            int v7 = v6;
            int v6 = (uint64_t *)*v6;
          }
          while (v6 != v5);
        }
        uint64_t v8 = (uint64_t *)*v5;
        *int v7 = *v5;
        free(v5);
        if (!dword_100038EF4) {
          sub_100025AA4();
        }
        --dword_100038EF4;
        int v5 = v8;
      }
      while (v8);
    }
    sub_1000207F0(0);
    uint64_t result = sub_1000208E4(0);
  }
  dword_1000394B8 = 0;
  dword_1000394BC = 0;
  return result;
}

uint64_t sub_10000C3E0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_100025B80();
  }
  if (*(_DWORD *)(a1 + 20) != 201) {
    sub_100025B54();
  }
  if (!*(unsigned char *)(a1 + 308)) {
    sub_100025AFC();
  }
  if (*(unsigned char *)(a1 + 564)) {
    sub_100025B28();
  }
  if (*(unsigned char *)(a1 + 1107))
  {
    if (*(_DWORD *)(a1 + 288) != 102)
    {
      uint64_t v2 = sub_10000C6D8(a1);
      if (v2)
      {
        uint64_t v3 = v2;
        sub_100005EAC();
        return v3;
      }
    }
  }
  if (*(void *)(a1 + 1112)) {
    return 0;
  }
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  SCDynamicStoreRef v4 = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.MobileInternetSharing", (SCDynamicStoreCallBack)sub_100013440, &context);
  *(void *)(a1 + 1112) = v4;
  if (!v4)
  {
    uint64_t v13 = __error();
    strerror(*v13);
    sub_100005EAC();
    Mutable = 0;
LABEL_24:
    uint64_t v3 = 12;
    goto LABEL_25;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable || (CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a1 + 308), 0x600u)) == 0)
  {
    sub_100005EAC();
    goto LABEL_24;
  }
  CFStringRef v7 = v6;
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v6, kSCEntNetIPv4);
  if (!NetworkInterfaceEntity) {
    goto LABEL_23;
  }
  CFStringRef v9 = NetworkInterfaceEntity;
  CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
  CFRelease(v9);
  if (*(_DWORD *)(a1 + 1128) != 500 || *(_DWORD *)(a1 + 288) != 102) {
    goto LABEL_19;
  }
  CFStringRef v10 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v7, kSCEntNetIPv6);
  if (!v10)
  {
LABEL_23:
    sub_100005EAC();
    CFRelease(v7);
    goto LABEL_24;
  }
  CFStringRef v11 = v10;
  CFArrayAppendValue(Mutable, v10);
  CFRelease(v11);
LABEL_19:
  CFRelease(v7);
  SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(a1 + 1112), Mutable, 0);
  int v12 = SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(a1 + 1112), (dispatch_queue_t)qword_100039470);
  if (v12)
  {
    sub_100013440(v12, Mutable, a1);
    CFRelease(Mutable);
    return 0;
  }
  int v16 = SCError();
  SCErrorString(v16);
  sub_100005EAC();
  uint64_t v3 = 22;
LABEL_25:
  int v14 = *(const __SCDynamicStore **)(a1 + 1112);
  if (v14)
  {
    SCDynamicStoreSetDispatchQueue(v14, 0);
    CFRelease(*(CFTypeRef *)(a1 + 1112));
    *(void *)(a1 + 1112) = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  sub_100005EAC();
  sub_10000C9A4(a1);
  return v3;
}

uint64_t sub_10000C6D8(uint64_t a1)
{
  int v12 = 1;
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_100025BD8();
  }
  if (!*(unsigned char *)(a1 + 1107)) {
    sub_100025BAC();
  }
  if (*(void *)(a1 + 1120)) {
    return 0;
  }
  int v14 = 0;
  uint64_t v13 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v27 = 0;
  int v3 = socket(32, 3, 1);
  int v4 = v3;
  if (v3 == -1
    || (v13 = 0x100000001, int v14 = 7, ioctl(v3, 0x800C6502uLL, &v13) == -1)
    || ioctl(v4, 0x8004667EuLL, &v12) == -1)
  {
    sub_100005EAC();
    uint64_t v2 = *__error();
  }
  else
  {
    int v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v4, 0, (dispatch_queue_t)qword_100039470);
    *(void *)(a1 + 1120) = v5;
    if (v5)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_100012A34;
      handler[3] = &unk_100034E28;
      handler[4] = a1;
      dispatch_source_set_event_handler(v5, handler);
      CFStringRef v6 = *(NSObject **)(a1 + 1120);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000;
      v9[2] = sub_100012C74;
      v9[3] = &unk_100034E48;
      int v10 = v4;
      dispatch_source_set_cancel_handler(v6, v9);
      dispatch_resume(*(dispatch_object_t *)(a1 + 1120));
      uint64_t v27 = 0;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v2 = sub_100012C7C(a1, (uint64_t)&v15);
      if (!v2)
      {
        sub_10000CAA8(a1, (unsigned __int8 *)&v15);
        return v2;
      }
      sub_100005EAC();
    }
    else
    {
      sub_100005EAC();
      uint64_t v2 = 12;
    }
  }
  CFStringRef v7 = *(NSObject **)(a1 + 1120);
  if (v7)
  {
    dispatch_source_cancel(v7);
    dispatch_release(*(dispatch_object_t *)(a1 + 1120));
    *(void *)(a1 + 1120) = 0;
  }
  if (v4 != -1) {
    close(v4);
  }
  return v2;
}

uint64_t sub_10000C9A4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_100025C04();
  }
  if (*(unsigned char *)(a1 + 1107))
  {
    if (*(unsigned char *)(a1 + 704))
    {
      uint64_t v6 = 0;
      memset(v5, 0, sizeof(v5));
      sub_10000CAA8(a1, (unsigned __int8 *)v5);
    }
  }
  else
  {
    sub_10000D15C(a1, (uint64_t)&in6addr_any);
  }
  if (*(_DWORD *)(a1 + 680)) {
    sub_10000D440(a1, 0, 0);
  }
  uint64_t v2 = *(const __SCDynamicStore **)(a1 + 1112);
  if (v2)
  {
    SCDynamicStoreSetDispatchQueue(v2, 0);
    CFRelease(*(CFTypeRef *)(a1 + 1112));
    *(void *)(a1 + 1112) = 0;
  }
  int v3 = *(NSObject **)(a1 + 1120);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*(dispatch_object_t *)(a1 + 1120));
    *(void *)(a1 + 1120) = 0;
  }
  return 0;
}

void sub_10000CAA8(uint64_t a1, unsigned __int8 *a2)
{
  if (!*(unsigned char *)(a1 + 1107)) {
    sub_100025C30();
  }
  int v4 = (unsigned __int8 *)(a1 + 704);
  int v5 = *(unsigned __int8 *)(a1 + 704);
  if (v5 == *a2)
  {
    if (!*(unsigned char *)(a1 + 704)) {
      return;
    }
    int v6 = *(unsigned __int8 *)(a1 + 741);
    if (v6 == a2[37]
      && sub_1000133A0((unsigned __int8 *)(a1 + 720), a2 + 16, v6)
      && *(unsigned __int8 *)(a1 + 876) == a2[172]
      && *(unsigned __int16 *)(a1 + 814) == *((unsigned __int16 *)a2 + 55)
      && *(_DWORD *)(a1 + 860) == *((_DWORD *)a2 + 39)
      && *(_DWORD *)(a1 + 864) == *((_DWORD *)a2 + 40)
      && *(void *)(a1 + 744) == *((void *)a2 + 5)
      && *(void *)(a1 + 752) == *((void *)a2 + 6)
      && *(_DWORD *)(a1 + 848) == *((_DWORD *)a2 + 36))
    {
      if (*v4)
      {
        if (!*(unsigned char *)(a1 + 1106))
        {
          sub_100011A04(a1 + 308, 1);
          *(unsigned char *)(a1 + 1106) = 1;
          sub_1000208E4(1);
          if (dword_1000394D4)
          {
            char v7 = *(unsigned char *)(a1 + 1106);
            long long v8 = *((_OWORD *)v4 + 11);
            long long v81 = *((_OWORD *)v4 + 10);
            long long v82 = v8;
            uint64_t v83 = *((void *)v4 + 24);
            long long v9 = *((_OWORD *)v4 + 7);
            long long v77 = *((_OWORD *)v4 + 6);
            long long v78 = v9;
            long long v10 = *((_OWORD *)v4 + 9);
            long long v79 = *((_OWORD *)v4 + 8);
            long long v80 = v10;
            long long v11 = *((_OWORD *)v4 + 3);
            long long v73 = *((_OWORD *)v4 + 2);
            long long v74 = v11;
            long long v12 = *((_OWORD *)v4 + 5);
            long long v75 = *((_OWORD *)v4 + 4);
            long long v76 = v12;
            long long v13 = *((_OWORD *)v4 + 1);
            long long v71 = *(_OWORD *)v4;
            long long v72 = v13;
            int v14 = (char *)(a1 + 308);
LABEL_23:
            sub_10001E038(v14, (uint64_t)&v71, v7);
            return;
          }
        }
      }
      return;
    }
    int v5 = *v4;
  }
  if (!v5)
  {
    if (*a2)
    {
      inet_ntop(30, a2 + 16, v84, 0x2Eu);
      sub_100005EAC();
      sub_100011A04(a1 + 308, 1);
      *(unsigned char *)(a1 + 1106) = 1;
      *(_OWORD *)int v4 = *(_OWORD *)a2;
      long long v21 = *((_OWORD *)a2 + 8);
      long long v23 = *((_OWORD *)a2 + 5);
      long long v22 = *((_OWORD *)a2 + 6);
      *((_OWORD *)v4 + 7) = *((_OWORD *)a2 + 7);
      *((_OWORD *)v4 + 8) = v21;
      *((_OWORD *)v4 + 5) = v23;
      *((_OWORD *)v4 + 6) = v22;
      long long v25 = *((_OWORD *)a2 + 10);
      long long v24 = *((_OWORD *)a2 + 11);
      long long v26 = *((_OWORD *)a2 + 9);
      *((void *)v4 + 24) = *((void *)a2 + 24);
      *((_OWORD *)v4 + 10) = v25;
      *((_OWORD *)v4 + 11) = v24;
      *((_OWORD *)v4 + 9) = v26;
      long long v28 = *((_OWORD *)a2 + 3);
      long long v27 = *((_OWORD *)a2 + 4);
      long long v29 = *((_OWORD *)a2 + 2);
      *((_OWORD *)v4 + 1) = *((_OWORD *)a2 + 1);
      *((_OWORD *)v4 + 2) = v29;
      *((_OWORD *)v4 + 3) = v28;
      *((_OWORD *)v4 + 4) = v27;
      sub_1000208E4(1);
      if (!dword_1000394D4) {
        goto LABEL_59;
      }
      xpc_object_t v30 = xpc_array_create(0, 0);
      for (uint64_t i = qword_100039498; i; uint64_t i = *(void *)i)
      {
        if (!strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
        {
          if (!*(_DWORD *)(i + 16) && !*(unsigned char *)(i + 700) && *(_DWORD *)(i + 20) == 201) {
            sub_100011890((const char *)(i + 308), 1);
          }
          if (*(unsigned char *)(i + 700) && *(_DWORD *)(i + 20) == 201)
          {
            if (sub_100015C14(i, (unsigned char *)a1, 1)) {
              sub_100005EAC();
            }
            else {
              xpc_array_set_string(v30, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
            }
          }
        }
      }
      if (!xpc_array_get_count(v30) || sub_100024A14(a1, v30))
      {
LABEL_62:
        if (v30) {
          xpc_release(v30);
        }
        return;
      }
      char v57 = *(unsigned char *)(a1 + 1106) != 0;
LABEL_52:
      long long v58 = *((_OWORD *)v4 + 11);
      long long v81 = *((_OWORD *)v4 + 10);
      long long v82 = v58;
      uint64_t v83 = *((void *)v4 + 24);
      long long v59 = *((_OWORD *)v4 + 7);
      long long v77 = *((_OWORD *)v4 + 6);
      long long v78 = v59;
      long long v60 = *((_OWORD *)v4 + 9);
      long long v79 = *((_OWORD *)v4 + 8);
      long long v80 = v60;
      long long v61 = *((_OWORD *)v4 + 3);
      long long v73 = *((_OWORD *)v4 + 2);
      long long v74 = v61;
      long long v62 = *((_OWORD *)v4 + 5);
      long long v75 = *((_OWORD *)v4 + 4);
      long long v76 = v62;
      long long v63 = *((_OWORD *)v4 + 1);
      long long v71 = *(_OWORD *)v4;
      long long v72 = v63;
      if (!sub_10001E038((char *)(a1 + 308), (uint64_t)&v71, v57))
      {
        int v64 = sub_100023308();
        if (v64 || (int v64 = sub_1000243C8()) != 0)
        {
          strerror(v64);
          sub_100005EAC();
        }
      }
      goto LABEL_62;
    }
LABEL_39:
    if (sub_1000133A0((unsigned __int8 *)(a1 + 720), a2 + 16, *(unsigned __int8 *)(a1 + 741)))
    {
      if (!sub_1000133A0((unsigned __int8 *)(a1 + 720), a2 + 16, *(unsigned __int8 *)(a1 + 741))) {
        return;
      }
      inet_ntop(30, a2 + 16, v84, 0x2Eu);
      sub_100005EAC();
      *(_OWORD *)int v4 = *(_OWORD *)a2;
      long long v32 = *((_OWORD *)a2 + 1);
      long long v33 = *((_OWORD *)a2 + 2);
      long long v34 = *((_OWORD *)a2 + 4);
      *((_OWORD *)v4 + 3) = *((_OWORD *)a2 + 3);
      *((_OWORD *)v4 + 4) = v34;
      *((_OWORD *)v4 + 1) = v32;
      *((_OWORD *)v4 + 2) = v33;
      long long v35 = *((_OWORD *)a2 + 5);
      long long v36 = *((_OWORD *)a2 + 6);
      long long v37 = *((_OWORD *)a2 + 8);
      *((_OWORD *)v4 + 7) = *((_OWORD *)a2 + 7);
      *((_OWORD *)v4 + 8) = v37;
      *((_OWORD *)v4 + 5) = v35;
      *((_OWORD *)v4 + 6) = v36;
      long long v38 = *((_OWORD *)a2 + 9);
      long long v39 = *((_OWORD *)a2 + 10);
      long long v40 = *((_OWORD *)a2 + 11);
      *((void *)v4 + 24) = *((void *)a2 + 24);
      *((_OWORD *)v4 + 10) = v39;
      *((_OWORD *)v4 + 11) = v40;
      *((_OWORD *)v4 + 9) = v38;
      if (*(unsigned char *)(a1 + 1106))
      {
        if (!dword_1000394D4) {
          goto LABEL_59;
        }
      }
      else
      {
        sub_100011A04(a1 + 308, 1);
        sub_1000208E4(1);
        *(unsigned char *)(a1 + 1106) = 1;
        if (!dword_1000394D4) {
          goto LABEL_59;
        }
        long long v65 = *((_OWORD *)v4 + 11);
        long long v81 = *((_OWORD *)v4 + 10);
        long long v82 = v65;
        uint64_t v83 = *((void *)v4 + 24);
        long long v66 = *((_OWORD *)v4 + 7);
        long long v77 = *((_OWORD *)v4 + 6);
        long long v78 = v66;
        long long v67 = *((_OWORD *)v4 + 9);
        long long v79 = *((_OWORD *)v4 + 8);
        long long v80 = v67;
        long long v68 = *((_OWORD *)v4 + 3);
        long long v73 = *((_OWORD *)v4 + 2);
        long long v74 = v68;
        long long v69 = *((_OWORD *)v4 + 5);
        long long v75 = *((_OWORD *)v4 + 4);
        long long v76 = v69;
        long long v70 = *((_OWORD *)v4 + 1);
        long long v71 = *(_OWORD *)v4;
        long long v72 = v70;
        if (sub_10001E038((char *)(a1 + 308), (uint64_t)&v71, 1)) {
          return;
        }
      }
      int v41 = sub_100023308();
      if (!v41) {
        return;
      }
      strerror(v41);
LABEL_59:
      sub_100005EAC();
      return;
    }
    inet_ntop(30, a2 + 16, v84, 0x2Eu);
    inet_ntop(30, (const void *)(a1 + 720), v85, 0x2Eu);
    sub_100005EAC();
    long long v42 = *((_OWORD *)v4 + 3);
    *(_OWORD *)(a1 + 936) = *((_OWORD *)v4 + 2);
    *(_OWORD *)(a1 + 952) = v42;
    long long v43 = *((_OWORD *)v4 + 7);
    *(_OWORD *)(a1 + 1000) = *((_OWORD *)v4 + 6);
    *(_OWORD *)(a1 + 1016) = v43;
    long long v44 = *((_OWORD *)v4 + 5);
    *(_OWORD *)(a1 + 968) = *((_OWORD *)v4 + 4);
    *(_OWORD *)(a1 + 984) = v44;
    *(void *)(a1 + 1096) = *((void *)v4 + 24);
    long long v45 = *((_OWORD *)v4 + 11);
    *(_OWORD *)(a1 + 1064) = *((_OWORD *)v4 + 10);
    *(_OWORD *)(a1 + 1080) = v45;
    long long v46 = *((_OWORD *)v4 + 9);
    *(_OWORD *)(a1 + 1032) = *((_OWORD *)v4 + 8);
    *(_OWORD *)(a1 + 1048) = v46;
    long long v47 = *((_OWORD *)v4 + 1);
    *(_OWORD *)(a1 + 904) = *(_OWORD *)v4;
    *(_OWORD *)(a1 + 920) = v47;
    *(_OWORD *)int v4 = *(_OWORD *)a2;
    long long v48 = *((_OWORD *)a2 + 1);
    long long v49 = *((_OWORD *)a2 + 2);
    long long v50 = *((_OWORD *)a2 + 4);
    *((_OWORD *)v4 + 3) = *((_OWORD *)a2 + 3);
    *((_OWORD *)v4 + 4) = v50;
    *((_OWORD *)v4 + 1) = v48;
    *((_OWORD *)v4 + 2) = v49;
    long long v51 = *((_OWORD *)a2 + 5);
    long long v52 = *((_OWORD *)a2 + 6);
    long long v53 = *((_OWORD *)a2 + 8);
    *((_OWORD *)v4 + 7) = *((_OWORD *)a2 + 7);
    *((_OWORD *)v4 + 8) = v53;
    *((_OWORD *)v4 + 5) = v51;
    *((_OWORD *)v4 + 6) = v52;
    long long v54 = *((_OWORD *)a2 + 9);
    long long v55 = *((_OWORD *)a2 + 10);
    long long v56 = *((_OWORD *)a2 + 11);
    *((void *)v4 + 24) = *((void *)a2 + 24);
    *((_OWORD *)v4 + 10) = v55;
    *((_OWORD *)v4 + 11) = v56;
    *((_OWORD *)v4 + 9) = v54;
    if (!*(unsigned char *)(a1 + 1106))
    {
      sub_100011A04(a1 + 308, 1);
      sub_1000208E4(1);
      *(unsigned char *)(a1 + 1106) = 1;
    }
    if (!dword_1000394D4) {
      goto LABEL_59;
    }
    xpc_object_t v30 = 0;
    char v57 = 1;
    goto LABEL_52;
  }
  if (*a2) {
    goto LABEL_39;
  }
  if (*(unsigned char *)(a1 + 1106))
  {
    sub_100011A04(a1 + 308, 0);
    sub_1000208E4(0);
    *(unsigned char *)(a1 + 1106) = 0;
    if (dword_1000394D4)
    {
      long long v15 = *((_OWORD *)v4 + 11);
      long long v81 = *((_OWORD *)v4 + 10);
      long long v82 = v15;
      uint64_t v83 = *((void *)v4 + 24);
      long long v16 = *((_OWORD *)v4 + 7);
      long long v77 = *((_OWORD *)v4 + 6);
      long long v78 = v16;
      long long v17 = *((_OWORD *)v4 + 9);
      long long v79 = *((_OWORD *)v4 + 8);
      long long v80 = v17;
      long long v18 = *((_OWORD *)v4 + 3);
      long long v73 = *((_OWORD *)v4 + 2);
      long long v74 = v18;
      long long v19 = *((_OWORD *)v4 + 5);
      long long v75 = *((_OWORD *)v4 + 4);
      long long v76 = v19;
      long long v20 = *((_OWORD *)v4 + 1);
      long long v71 = *(_OWORD *)v4;
      long long v72 = v20;
      int v14 = (char *)(a1 + 308);
      char v7 = 0;
      goto LABEL_23;
    }
  }
}

void sub_10000D15C(uint64_t a1, uint64_t a2)
{
  if (byte_100039481) {
    return;
  }
  if (*(unsigned char *)(a1 + 1107)) {
    sub_100025C5C();
  }
  int v3 = (void *)(a1 + 648);
  if (*(void *)a2 == *(void *)(a1 + 648) && *(void *)(a2 + 8) == *(void *)(a1 + 656))
  {
    BOOL v8 = *v3 == *(void *)in6addr_any.__u6_addr8 && *(void *)(a1 + 656) == *(void *)&in6addr_any.__u6_addr32[2];
    if (!v8 && !*(unsigned char *)(a1 + 1105))
    {
      sub_1000208E4(1);
      *(unsigned char *)(a1 + 1105) = 1;
    }
  }
  else
  {
    uint64_t v5 = *(void *)&in6addr_any.__u6_addr32[2];
    if (*(void *)a2 == *(void *)in6addr_any.__u6_addr8 && *(void *)(a2 + 8) == v5)
    {
      if (*(unsigned char *)(a1 + 1105))
      {
        sub_1000208E4(0);
        *(unsigned char *)(a1 + 1105) = 0;
        return;
      }
    }
    else if (*v3 != *(void *)in6addr_any.__u6_addr8 || *(void *)(a1 + 656) != v5)
    {
      *(_OWORD *)int v3 = *(_OWORD *)a2;
      if (!*(unsigned char *)(a1 + 1105))
      {
        sub_1000208E4(1);
        *(unsigned char *)(a1 + 1105) = 1;
      }
      if (dword_1000394D4)
      {
        sub_10001FEFC((char *)(a1 + 308), 0, 1);
      }
      return;
    }
    if (*v3 == *(void *)in6addr_any.__u6_addr8 && *(void *)(a1 + 656) == v5)
    {
      *(_OWORD *)int v3 = *(_OWORD *)a2;
      if (!*(unsigned char *)(a1 + 1105))
      {
        sub_1000208E4(1);
        *(unsigned char *)(a1 + 1105) = 1;
      }
      if (dword_1000394D4)
      {
        xpc_object_t v10 = xpc_array_create(0, 0);
        for (uint64_t i = qword_100039498; i; uint64_t i = *(void *)i)
        {
          if (!strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
          {
            if (!*(_DWORD *)(i + 16) && !*(unsigned char *)(i + 700) && *(_DWORD *)(i + 20) == 201) {
              sub_100011890((const char *)(i + 308), 1);
            }
            if (*(unsigned char *)(i + 700) && *(_DWORD *)(i + 20) == 201)
            {
              if (sub_100015C14(i, (unsigned char *)a1, 1)) {
                sub_100005EAC();
              }
              else {
                xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
              }
            }
          }
        }
        if (xpc_array_get_count(v10))
        {
          if (!sub_100024A14(a1, v10)
            && !sub_10001DC54((char *)(a1 + 308), *(_DWORD *)(a1 + 300)))
          {
            int v12 = sub_100023308();
            if (v12 || (int v12 = sub_1000243C8()) != 0)
            {
              strerror(v12);
              sub_100005EAC();
            }
          }
        }
        if (v10)
        {
          xpc_release(v10);
        }
      }
    }
  }
}

void sub_10000D440(uint64_t a1, int a2, int a3)
{
  int v6 = *(_DWORD *)(a1 + 1264);
  if (!a2 && !*(_DWORD *)(a1 + 680))
  {
    long long v9 = (int *)(a1 + 680);
    sub_100005EAC();
    int v10 = *v9;
    if (!*v9) {
      return;
    }
    BOOL v7 = 0;
    goto LABEL_28;
  }
  if (sub_100023130() && !byte_100039484)
  {
    sub_100005EAC();
    BOOL v7 = v6 == 1;
    goto LABEL_19;
  }
  int v8 = sub_100009E48(a1, 1, 0);
  if (v8)
  {
    if (v8 != 2)
    {
      sub_100005EAC();
      return;
    }
    sub_100005EAC();
  }
  if (v6)
  {
    if (v6 != *(_DWORD *)(a1 + 1264))
    {
      BOOL v7 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    int v6 = *(_DWORD *)(a1 + 1264);
  }
  if (v6 == 1 && sub_100023308()) {
    return;
  }
  BOOL v7 = 0;
LABEL_19:
  int v10 = *(_DWORD *)(a1 + 680);
  if (v10 != a2)
  {
    long long v9 = (int *)(a1 + 680);
    if (a2)
    {
      if (v10)
      {
        *long long v9 = a2;
        goto LABEL_35;
      }
      int v13 = *(unsigned __int8 *)(a1 + 1104);
      *(_DWORD *)(a1 + 680) = a2;
      int v14 = (_DWORD *)(a1 + 684);
      *(_DWORD *)(a1 + 684) = a3;
      if (v13)
      {
LABEL_52:
        if (!qword_1000394D4) {
          return;
        }
        xpc_object_t v12 = xpc_array_create(0, 0);
        for (uint64_t i = qword_100039498; i; uint64_t i = *(void *)i)
        {
          if (*(unsigned char *)(i + 700)
            && *(_DWORD *)(i + 20) == 201
            && !strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
          {
            if (sub_100015600(i, a1))
            {
              sub_100005EAC();
            }
            else
            {
              xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
              if (sub_10001A38C(i, a1)) {
                goto LABEL_44;
              }
            }
          }
        }
        if (!xpc_array_get_count(v12)) {
          goto LABEL_44;
        }
        if (sub_100024A14(a1, v12)) {
          goto LABEL_44;
        }
        sub_10001D138((char *)(a1 + 308), v9, v14, *(_DWORD *)(a1 + 300));
        if (!v7) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
LABEL_51:
      sub_1000207F0(1);
      *(unsigned char *)(a1 + 1104) = 1;
      goto LABEL_52;
    }
LABEL_28:
    if (*(unsigned char *)(a1 + 1104))
    {
      sub_1000207F0(0);
      *(unsigned char *)(a1 + 1104) = 0;
      if (*(_DWORD *)(a1 + 1264) != 1 || !v7) {
        return;
      }
      goto LABEL_42;
    }
    if (v10) {
      goto LABEL_41;
    }
    *(_DWORD *)(a1 + 680) = a2;
    int v14 = (_DWORD *)(a1 + 684);
    *(_DWORD *)(a1 + 684) = a3;
    goto LABEL_51;
  }
  if (*(_DWORD *)(a1 + 684) != a3)
  {
    if (!a2) {
      return;
    }
LABEL_35:
    *(_DWORD *)(a1 + 684) = a3;
    if (!*(unsigned char *)(a1 + 1104))
    {
      sub_1000207F0(1);
      *(unsigned char *)(a1 + 1104) = 1;
    }
    if (qword_1000394D4)
    {
      sub_10001FEFC((char *)(a1 + 308), 1, 0);
      if (!v7) {
        return;
      }
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (!a2) {
    return;
  }
  if (!*(unsigned char *)(a1 + 1104))
  {
    sub_1000207F0(1);
    *(unsigned char *)(a1 + 1104) = 1;
    if (!v7) {
      return;
    }
    goto LABEL_42;
  }
LABEL_41:
  if (!v7) {
    return;
  }
LABEL_42:
  xpc_object_t v12 = 0;
LABEL_43:
  sub_100005EAC();
  *(_DWORD *)(a1 + 1264) = 0;
  sub_100017B44();
LABEL_44:
  if (v12)
  {
    xpc_release(v12);
  }
}

uint64_t sub_10000D7CC(uint64_t a1)
{
  xpc_object_t v2 = xpc_array_create(0, 0);
  for (uint64_t i = qword_100039498; i; uint64_t i = *(void *)i)
  {
    if (!*(_DWORD *)(i + 16)
      && *(_DWORD *)(i + 20) == 201
      && *(unsigned char *)(i + 700)
      && !strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
    {
      xpc_array_set_string(v2, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
    }
  }
  if (xpc_array_get_count(v2))
  {
    sub_100024FD4((char *)(a1 + 308), v2);
    int v4 = (void *)qword_100039490;
    if (qword_100039490)
    {
      do
      {
        if (v4[37] == a1) {
          sub_10001F968(v4);
        }
        int v4 = (void *)*v4;
      }
      while (v4);
    }
  }
  if (v2) {
    xpc_release(v2);
  }
  return 0;
}

uint64_t sub_10000D8AC(uint64_t a1, const char *a2)
{
  xpc_object_t v4 = xpc_array_create(0, 0);
  for (uint64_t i = qword_100039498; i; uint64_t i = *(void *)i)
  {
    if (!*(_DWORD *)(i + 16) && *(_DWORD *)(i + 20) == 201 && !strncmp((const char *)(i + 565), a2, 0x10uLL))
    {
      snprintf((char *)(i + 565), 0x10uLL, "%s", (const char *)(a1 + 308));
      if (*(unsigned char *)(i + 700)) {
        xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
      }
    }
  }
  if (xpc_array_get_count(v4))
  {
    sub_100024A14(a1, v4);
    int v6 = (void *)qword_100039490;
    if (qword_100039490)
    {
      do
      {
        if (v6[37] == a1) {
          sub_10001E394(v6);
        }
        int v6 = (void *)*v6;
      }
      while (v6);
    }
  }
  if (v4) {
    xpc_release(v4);
  }
  return 0;
}

void sub_10000D9C8(const char *a1, Boolean *a2, Boolean *a3)
{
  int v6 = SCPreferencesCreate(0, @"com.apple.MobileInternetSharing", 0);
  *a2 = 0;
  *a3 = 0;
  if (v6)
  {
    BOOL v7 = v6;
    int v8 = (const __SCNetworkService *)sub_10000DB28(v6, a1);
    if (v8)
    {
      long long v9 = v8;
      int v10 = SCNetworkServiceCopyProtocol(v8, kSCNetworkProtocolTypeIPv4);
      if (v10)
      {
        long long v11 = v10;
        *a2 = SCNetworkProtocolGetEnabled(v10);
        CFRelease(v11);
      }
      xpc_object_t v12 = SCNetworkServiceCopyProtocol(v9, kSCNetworkProtocolTypeIPv6);
      if (v12)
      {
        int v13 = v12;
        *a3 = SCNetworkProtocolGetEnabled(v12);
        CFRelease(v13);
      }
      sub_100005EAC();
      CFRelease(v9);
    }
    else
    {
      sub_100005EAC();
    }
    CFRelease(v7);
  }
  else
  {
    sub_100005EAC();
  }
}

CFTypeRef sub_10000DB28(const __SCPreferences *a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x600u);
  if (v3)
  {
    CFStringRef v4 = v3;
    uint64_t v5 = SCNetworkSetCopyCurrent(a1);
    if (v5)
    {
      int v6 = v5;
      CFArrayRef v7 = SCNetworkSetCopyServices(v5);
      if (v7)
      {
        CFArrayRef v8 = v7;
        CFIndex Count = CFArrayGetCount(v7);
        if (Count < 1)
        {
LABEL_10:
          CFTypeRef v15 = 0;
        }
        else
        {
          CFIndex v10 = Count;
          CFIndex v11 = 0;
          while (1)
          {
            ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v8, v11);
            Interface = SCNetworkServiceGetInterface(ValueAtIndex);
            if (Interface)
            {
              CFStringRef BSDName = SCNetworkInterfaceGetBSDName(Interface);
              if (BSDName)
              {
                if (CFEqual(BSDName, v4)) {
                  break;
                }
              }
            }
            if (v10 == ++v11) {
              goto LABEL_10;
            }
          }
          CFTypeRef v15 = CFRetain(ValueAtIndex);
        }
        CFRelease(v8);
      }
      else
      {
        sub_100005EAC();
        CFTypeRef v15 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      sub_100005EAC();
      CFTypeRef v15 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
  return v15;
}

void sub_10000DC60(uint64_t a1)
{
  SCDynamicStoreRef v2 = SCDynamicStoreCreate(0, @"com.apple.MobileInternetSharing", 0, 0);
  if (!v2) {
    return;
  }
  CFStringRef v3 = v2;
  SCDynamicStoreRef v4 = SCDynamicStoreCreate(0, @"com.apple.MobileInternetSharing", 0, 0);
  if (!v4) {
    goto LABEL_34;
  }
  SCDynamicStoreRef v5 = v4;
  CFStringRef v6 = CFStringCreateWithCString(0, (const char *)(a1 + 308), 0x600u);
  if (!v6)
  {
    CFRelease(v5);
    goto LABEL_34;
  }
  CFStringRef v7 = v6;
  CFStringRef v8 = kSCDynamicStoreDomainSetup;
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetInterface);
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, NetworkServiceEntity);
  CFRelease(NetworkServiceEntity);
  CFDictionaryRef v11 = SCDynamicStoreCopyMultiple(v5, 0, Mutable);
  CFRelease(Mutable);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v11 || CFGetTypeID(v11) != TypeID)
  {
    sub_100005EAC();
    uint64_t Count = 0;
    goto LABEL_28;
  }
  uint64_t Count = CFDictionaryGetCount(v11);
  int v14 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFTypeRef v15 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(v11, v15, v14);
  if (Count >= 1)
  {
    CFStringRef cf1 = v7;
    long long v26 = v14;
    long long v16 = (const __CFDictionary **)v14;
    long long v17 = (CFStringRef *)v15;
    while (1)
    {
      CFDictionaryRef v18 = *v16;
      CFTypeID v19 = CFDictionaryGetTypeID();
      if (v18)
      {
        if (CFGetTypeID(v18) == v19)
        {
          CFBooleanRef Value = CFDictionaryGetValue(v18, kSCPropNetInterfaceDeviceName);
          if (Value)
          {
            if (CFEqual(cf1, Value)) {
              break;
            }
          }
        }
      }
      ++v17;
      ++v16;
      if (!--Count) {
        goto LABEL_13;
      }
    }
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, *v17, @"/");
    if (!ArrayBySeparatingStrings)
    {
      uint64_t Count = 0;
LABEL_13:
      CFStringRef v8 = kSCDynamicStoreDomainSetup;
      CFStringRef v7 = cf1;
      int v14 = v26;
      goto LABEL_25;
    }
    CFArrayRef v22 = ArrayBySeparatingStrings;
    CFStringRef v8 = kSCDynamicStoreDomainSetup;
    CFStringRef v7 = cf1;
    int v14 = v26;
    if (CFArrayGetCount(ArrayBySeparatingStrings) >= 4)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v22, 3);
      uint64_t Count = (uint64_t)CFRetain(ValueAtIndex);
    }
    else
    {
      uint64_t Count = 0;
    }
    CFRelease(v22);
    goto LABEL_25;
  }
  uint64_t Count = 0;
  if (v14) {
LABEL_25:
  }
    free(v14);
  if (v15) {
    free(v15);
  }
LABEL_28:
  if (v11) {
    CFRelease(v11);
  }
  CFRelease(v7);
  CFRelease(v5);
  if (Count)
  {
    CFStringRef v24 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, v8, (CFStringRef)Count, kSCEntNetIPv4);
    if (v24)
    {
      CFStringRef v25 = v24;
      SCDynamicStoreNotifyValue(v3, v24);
      CFRelease(v25);
    }
    CFRelease((CFTypeRef)Count);
    goto LABEL_35;
  }
LABEL_34:
  sub_100005EAC();
LABEL_35:

  CFRelease(v3);
}

uint64_t *sub_10000DFBC(uint64_t a1)
{
  uint64_t result = &qword_1000394C0;
  while (1)
  {
    uint64_t result = (uint64_t *)*result;
    if (!result) {
      break;
    }
    if (result[1] == a1)
    {
      int v3 = *((_DWORD *)result + 6);
      if (!v3) {
        sub_100025C88();
      }
      *((_DWORD *)result + 6) = v3 + 1;
      return result;
    }
  }
  return result;
}

void sub_10000E004(unsigned int a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2)
  {
    int v3 = v2;
    xpc_dictionary_set_uint64(v2, off_100038CA8[0], a1);
    sub_100005EAC();
    for (uint64_t i = qword_1000394C0; i; uint64_t i = *(void *)i)
      xpc_connection_send_message(*(xpc_connection_t *)(i + 16), v3);
    xpc_release(v3);
  }
  else
  {
    sub_100005EAC();
  }
}

void sub_10000E0B8(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 6);
  if (!v1) {
    sub_100025CB4();
  }
  int v3 = v1 - 1;
  *((_DWORD *)a1 + 6) = v3;
  if (!v3)
  {
    if (a1[2])
    {
      sub_100005EAC();
      xpc_connection_cancel((xpc_connection_t)a1[2]);
      xpc_release((xpc_object_t)a1[2]);
    }
    SCDynamicStoreRef v4 = &qword_1000394C0;
    for (uint64_t i = (uint64_t *)qword_1000394C0; i != a1; uint64_t i = (uint64_t *)*i)
      SCDynamicStoreRef v4 = i;
    uint64_t *v4 = *a1;
    free(a1);
    if (!dword_100038EF8) {
      sub_100025CE0();
    }
    --dword_100038EF8;
  }
}

void *sub_10000E16C(uint64_t a1, void *a2)
{
  SCDynamicStoreRef v4 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
  SCDynamicStoreRef v5 = v4;
  if (v4)
  {
    *(_OWORD *)SCDynamicStoreRef v4 = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    v4[1] = a1;
    *((_DWORD *)v4 + 6) = 1;
    xpc_object_t value = (_xpc_endpoint_s *)xpc_dictionary_get_value(a2, off_100038BF0[0]);
    if (value && (CFStringRef v7 = xpc_connection_create_from_endpoint(value)) != 0)
    {
      CFStringRef v8 = v7;
      v5[2] = v7;
      xpc_connection_set_target_queue(v7, (dispatch_queue_t)qword_100039470);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_10000E2D4;
      handler[3] = &unk_100034DE8;
      handler[4] = v8;
      void handler[5] = a1;
      handler[6] = v5;
      xpc_connection_set_event_handler(v8, handler);
      xpc_connection_resume(v8);
      *SCDynamicStoreRef v5 = qword_1000394C0;
      qword_1000394C0 = (uint64_t)v5;
      if (__CFADD__(dword_100038EF8++, 1)) {
        sub_100025D0C();
      }
    }
    else
    {
      sub_100005EAC();
      free(v5);
      return 0;
    }
  }
  else
  {
    sub_100005EAC();
  }
  return v5;
}

void sub_10000E2D4(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  sub_100005EAC();
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        CFStringRef v6 = &qword_1000394C0;
        while (1)
        {
          CFStringRef v6 = (uint64_t *)*v6;
          if (!v6) {
            break;
          }
          if (v6[2] == v5)
          {
            sub_100005EAC();
            if (!*((_DWORD *)v6 + 6)) {
              sub_100025D38();
            }
            sub_100005EAC();
            xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
            xpc_release(*(xpc_object_t *)(a1 + 32));
            *(void *)(*(void *)(a1 + 48) + 16) = 0;
            return;
          }
        }
      }
    }
    else if (object == &_xpc_error_termination_imminent || object == &_xpc_error_connection_interrupted)
    {
      sub_100005EAC();
    }
  }
}

char *sub_10000E410(_xpc_connection_s *a1, uint64_t a2, int a3)
{
  pid_t pid = xpc_connection_get_pid(a1);
  CFStringRef v7 = (char *)malloc_type_malloc(0x200uLL, 0x10A00401629E6F1uLL);
  CFStringRef v8 = v7;
  if (v7)
  {
    *((_OWORD *)v7 + 29) = 0u;
    *((_OWORD *)v7 + 30) = 0u;
    *((_OWORD *)v7 + 27) = 0u;
    *((_OWORD *)v7 + 28) = 0u;
    *((_OWORD *)v7 + 25) = 0u;
    *((_OWORD *)v7 + 26) = 0u;
    *((_OWORD *)v7 + 23) = 0u;
    *((_OWORD *)v7 + 24) = 0u;
    *((_OWORD *)v7 + 21) = 0u;
    *((_OWORD *)v7 + 22) = 0u;
    *((_OWORD *)v7 + 19) = 0u;
    *((_OWORD *)v7 + 20) = 0u;
    *((_OWORD *)v7 + 17) = 0u;
    *((_OWORD *)v7 + 18) = 0u;
    *((_OWORD *)v7 + 15) = 0u;
    *((_OWORD *)v7 + 16) = 0u;
    *((_OWORD *)v7 + 13) = 0u;
    *((_OWORD *)v7 + 14) = 0u;
    *((_OWORD *)v7 + 11) = 0u;
    *((_OWORD *)v7 + 12) = 0u;
    *((_OWORD *)v7 + 9) = 0u;
    *((_OWORD *)v7 + 10) = 0u;
    *((_OWORD *)v7 + 7) = 0u;
    *((_OWORD *)v7 + 8) = 0u;
    *((_OWORD *)v7 + 4) = 0u;
    *((_OWORD *)v7 + 5) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *(_OWORD *)CFStringRef v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *(_OWORD *)(v7 + 492) = 0u;
    *((_OWORD *)v7 + 6) = 0u;
    *((void *)v7 + 10) = a2;
    *((_DWORD *)v7 + 127) = a3;
    *((_DWORD *)v7 + 88) = pid;
    proc_name(pid, v7 + 356, 0x40u);
    snprintf(v8 + 96, 0x100uLL, "%s.%p-%p-%d", "com.apple.MobileInternetSharing", v8, a1, dword_100038EFC);
    sub_100005EAC();
    uint64_t v9 = qword_1000394C8;
    if (qword_1000394C8)
    {
      uint64_t v10 = qword_1000394C8;
      while (strncmp(v8 + 96, (const char *)(v10 + 96), 0x100uLL)
           || *(_xpc_connection_s **)(*(void *)(v10 + 80) + 8) != a1)
      {
        uint64_t v10 = *(void *)v10;
        if (!v10) {
          goto LABEL_7;
        }
      }
      sub_100005EAC();
      free(v8);
      return 0;
    }
    else
    {
LABEL_7:
      int v11 = dword_100038EFC++;
      if (v11 == -1) {
        sub_100025D64();
      }
      *(void *)CFStringRef v8 = v9;
      qword_1000394C8 = (uint64_t)v8;
      if (!v11)
      {
        sub_100006848();
        if (qword_100038F00) {
          sub_100025D90();
        }
        qword_100038F00 = os_transaction_create();
      }
    }
  }
  return v8;
}

void sub_10000E5E4(void *a1, uint64_t a2)
{
  xpc_object_t v2 = (uint64_t *)sub_10000E618(a1, a2);
  if (v2)
  {
    sub_10000E6A0(v2);
  }
}

uint64_t sub_10000E618(void *a1, uint64_t a2)
{
  string = xpc_dictionary_get_string(a1, off_100038BA0[0]);
  uint64_t v4 = qword_1000394C8;
  if (string) {
    BOOL v5 = qword_1000394C8 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  CFStringRef v6 = string;
  do
  {
    if (!strncmp(v6, (const char *)(v4 + 96), 0x100uLL) && *(void *)(*(void *)(v4 + 80) + 8) == a2) {
      break;
    }
    uint64_t v4 = *(void *)v4;
  }
  while (v4);
  return v4;
}

void sub_10000E6A0(uint64_t *a1)
{
  xpc_object_t v2 = &qword_1000394C8;
  for (uint64_t i = (uint64_t *)qword_1000394C8; i != a1; uint64_t i = (uint64_t *)*i)
    xpc_object_t v2 = i;
  *xpc_object_t v2 = *a1;
  if (!dword_100038EFC) {
    sub_100025DBC();
  }
  --dword_100038EFC;
  sub_10000BE88((uint64_t)a1);
  uint64_t v4 = a1[11];
  if (v4)
  {
    if (*(uint64_t **)(v4 + 8) != a1) {
      sub_100025E6C();
    }
    sub_10000BF00(v4, (uint64_t)a1);
    if (a1[11]) {
      sub_100025E40();
    }
  }
  BOOL v5 = (uint64_t *)a1[10];
  if (v5) {
    sub_10000E0B8(v5);
  }
  sub_1000206B8((uint64_t)a1, 2);
  sub_1000206B8((uint64_t)a1, 30);
  if (*(_DWORD *)((char *)a1 + 9) | *(unsigned __int16 *)((char *)a1 + 13)) {
    sub_100018D9C((uint64_t)a1 + 9);
  }
  if (*(_DWORD *)((char *)a1 + 15)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = *(unsigned __int16 *)((char *)a1 + 19) == 0;
  }
  if (!v6) {
    sub_100018630((uint64_t)a1 + 15);
  }
  if (a1[3])
  {
    IOEthernetControllerSetLinkStatus();
    IOEthernetControllerSetDispatchQueue();
    CFRelease((CFTypeRef)a1[3]);
    a1[3] = 0;
    if (!dword_1000394D0) {
      sub_100025E14();
    }
    --dword_1000394D0;
    CFStringRef v7 = (void *)a1[8];
    if (v7 && a1[7])
    {
      xpc_dictionary_set_uint64(v7, off_100038BF8[0], 0x7D3uLL);
      sub_100007100((_xpc_connection_s *)a1[7], (xpc_object_t)a1[8]);
      xpc_release((xpc_object_t)a1[8]);
      a1[7] = 0;
      a1[8] = 0;
    }
  }
  sub_100005EAC();
  free(a1);
  if (!dword_100038EFC)
  {
    sub_100005EAC();
    sub_10000687C();
    if (!qword_100038F00) {
      sub_100025DE8();
    }
    os_release((void *)qword_100038F00);
    qword_100038F00 = 0;
  }
}

uint64_t sub_10000E880(uint64_t a1)
{
  int v1 = 0;
  xpc_object_t v2 = &qword_1000394C8;
  while (1)
  {
    xpc_object_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (*((_DWORD *)v2 + 88) == *(_DWORD *)(a1 + 352))
    {
      if (v2[3]) {
        ++v1;
      }
    }
    if (v1 == 10) {
      goto LABEL_9;
    }
  }
  if (dword_1000394D0 == 128)
  {
LABEL_9:
    sub_100005EAC();
    return 0;
  }
  return 1;
}

uint64_t sub_10000E904(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2 - 7 <= 0xFFFFFFFA) {
    sub_100025E98();
  }
  uint64_t v6 = a2;
  if (a3 == 0xFFFFFFFFLL) {
    goto LABEL_8;
  }
  uint64_t v7 = a1 + 8 * a2;
  CFStringRef v8 = *(void **)(v7 + 424);
  if (v8)
  {
    while (*v8 != a3)
    {
      CFStringRef v8 = (void *)v8[2];
      if (!v8) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v9 = malloc_type_malloc(0x18uLL, 0x10200406E52F545uLL);
  if (v9)
  {
    *(void *)uint64_t v9 = a3;
    v9[2] = a2;
    *((void *)v9 + 2) = *(void *)(v7 + 424);
    *(void *)(v7 + 424) = v9;
LABEL_8:
    uint64_t v10 = a1 + 4 * v6;
    int v11 = *(_DWORD *)(v10 + 480);
    *(_DWORD *)(v10 + 480) = v11 + 1;
    if (v11 == -1) {
      sub_100025EC4();
    }
    return sub_1000181A0(a2, 1);
  }
LABEL_12:

  return sub_100005EAC();
}

void sub_10000EA1C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2 - 7 <= 0xFFFFFFFA) {
    sub_100025EF0();
  }
  uint64_t v5 = a2;
  if (a3 != 0xFFFFFFFFLL)
  {
    uint64_t v6 = a1 + 8 * a2;
    uint64_t v7 = *(void **)(v6 + 424);
    if (!v7) {
      return;
    }
    CFStringRef v8 = (void *)(v6 + 424);
    uint64_t v9 = v7;
    while (*v9 != a3)
    {
      uint64_t v9 = (void *)v9[2];
      if (!v9) {
        return;
      }
    }
    if (v7 != v9)
    {
      do
      {
        uint64_t v10 = v7;
        uint64_t v7 = (void *)v7[2];
      }
      while (v7 != v9);
      CFStringRef v8 = v10 + 2;
      uint64_t v7 = v9;
    }
    *CFStringRef v8 = v7[2];
    sub_100006344(a3);
    free(v9);
  }
  uint64_t v11 = a1 + 4 * v5;
  int v12 = *(_DWORD *)(v11 + 480);
  BOOL v13 = __OFSUB__(v12, 1);
  int v14 = v12 - 1;
  if (v14 < 0 == v13)
  {
    *(_DWORD *)(v11 + 480) = v14;
    sub_100018204(a2, 1u);
  }
}

uint64_t sub_10000EB0C(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = sub_100018194();
  uint64_t result = sub_100018258();
  *a3 = result;
  return result;
}

uint64_t sub_10000EB40(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 - 7 <= 0xFFFFFFFA) {
    sub_100025F1C();
  }
  uint64_t v3 = a1 + 4 * a2;
  unsigned int v4 = *(_DWORD *)(v3 + 480);
  *(_DWORD *)(v3 + 480) = a3;
  if (v4 >= a3)
  {
    if (v4 > a3) {
      sub_100018204(a2, v4 - a3);
    }
  }
  else
  {
    sub_1000181A0(a2, a3 - v4);
  }
  return 1;
}

uint64_t sub_10000EBA0(uint64_t result)
{
  return result;
}

uint64_t sub_10000EBB0(uint64_t a1, const char *a2)
{
  uint64_t result = snprintf((char *)(a1 + 308), 0x100uLL, "%s", a2);
  unsigned int v4 = *(uint64_t (**)(uint64_t, void))(a1 + 632);
  if (v4)
  {
    return v4(a1, 0);
  }
  return result;
}

uint64_t sub_10000EC20(uint64_t a1)
{
  __int16 v16 = 0;
  *(_DWORD *)bytes = 0;
  uint64_t v2 = sub_100018800((uint64_t)bytes);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_100005EAC();
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 15) = *(_DWORD *)bytes;
  *(_WORD *)(a1 + 19) = v16;
  CFDataRef v4 = CFDataCreate(kCFAllocatorDefault, bytes, 6);
  if (!v4)
  {
    sub_100005EAC();
LABEL_17:
    uint64_t v3 = 12;
    goto LABEL_18;
  }
  CFDataRef v5 = v4;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_100005EAC();
    BOOL v13 = v5;
LABEL_16:
    CFRelease(v13);
    goto LABEL_17;
  }
  uint64_t v7 = Mutable;
  CFDictionarySetValue(Mutable, @"EnableMultiPages", kCFBooleanTrue);
  CFDictionarySetValue(v7, kIOEthernetHardwareAddress, v5);
  int v8 = *(_DWORD *)(a1 + 72);
  if (v8) {
    sub_10000EF20(v7, @"MaxTransferUnit", v8);
  }
  if (*(unsigned char *)(a1 + 76)) {
    CFDictionarySetValue(v7, @"EnableTSO", kCFBooleanTrue);
  }
  CFDictionarySetValue(v7, @"NamePrefix", @"vmenet");
  sub_10000EF20(v7, @"SubType", 9);
  uint64_t v9 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v9)
  {
    sub_100005EAC();
    CFRelease(v5);
    BOOL v13 = v7;
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  CFDictionarySetValue(v9, @"Product Name", @"VM network interface");
  CFDictionarySetValue(v10, kIOUserEthernetInterfaceRole, @"VMNET");
  CFDictionarySetValue(v10, @"HiddenInterface", kCFBooleanTrue);
  CFDictionarySetValue(v10, @"IsEphemeral", kCFBooleanTrue);
  CFDictionarySetValue(v7, kIOUserEthernetInterfaceMergeProperties, v10);
  uint64_t v11 = IOEthernetControllerCreate();
  *(void *)(a1 + 24) = v11;
  if (!v11)
  {
    uint64_t v3 = 12;
    goto LABEL_22;
  }
  IOEthernetControllerSetDispatchQueue();
  IOEthernetControllerRegisterBSDAttachCallback();
  char v12 = 1;
  if (IOEthernetControllerSetLinkStatus())
  {
    uint64_t v3 = 22;
LABEL_22:
    sub_100005EAC();
    char v12 = 0;
    goto LABEL_24;
  }
  uint64_t v3 = 0;
LABEL_24:
  CFRelease(v5);
  CFRelease(v10);
  CFRelease(v7);
  if (v12) {
    return 0;
  }
LABEL_18:
  if (*(void *)(a1 + 24))
  {
    IOEthernetControllerSetDispatchQueue();
    CFRelease(*(CFTypeRef *)(a1 + 24));
    *(void *)(a1 + 24) = 0;
  }
  return v3;
}

void sub_10000EF20(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void sub_10000EF88(uint64_t a1, uint64_t a2)
{
  int v36 = 0x200000;
  memset(v35, 0, sizeof(v35));
  int v34 = 0;
  uint64_t v2 = (void *)qword_1000394C8;
  if (!qword_1000394C8)
  {
LABEL_7:
    sub_100005EAC();
    return;
  }
  memset(v37, 0, sizeof(v37));
  while (v2 != (void *)a2 || !*(void *)(a2 + 24) || !*(void *)(a2 + 64))
  {
    uint64_t v2 = (void *)*v2;
    if (!v2) {
      goto LABEL_7;
    }
  }
  io_registry_entry_t IONetworkInterfaceObject = IOEthernetControllerGetIONetworkInterfaceObject();
  if (!IONetworkInterfaceObject) {
    goto LABEL_30;
  }
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(IONetworkInterfaceObject, @"BSD Name", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    goto LABEL_30;
  }
  CFStringRef v6 = CFProperty;
  CFStringGetCString(CFProperty, (char *)(a2 + 32), 16, 0x600u);
  sub_100005EAC();
  CFRelease(v6);
  int BSDSocket = IOEthernetControllerGetBSDSocket();
  *(_DWORD *)(a2 + 52) = BSDSocket;
  if (BSDSocket < 0) {
    goto LABEL_30;
  }
  if (setsockopt(BSDSocket, 0xFFFF, 4097, &v36, 4u) != -1
    || (int v33 = 0, v32 = 4, !sysctlbyname("kern.ipc.maxsockbuf", &v33, &v32, 0, 0))
    && (int v36 = v33, setsockopt(*(_DWORD *)(a2 + 52), 0xFFFF, 4097, &v36, 4u) != -1))
  {
    if (setsockopt(*(_DWORD *)(a2 + 52), 0xFFFF, 4098, &v36, 4u) != -1)
    {
      int v8 = malloc_type_malloc(0x28uLL, 0x10A0040D1175C0DuLL);
      if (v8)
      {
        uint64_t v9 = v8;
        memset((char *)v37 + 4, 0, 92);
        LODWORD(v37[0]) = 501;
        int v10 = *(_DWORD *)(a2 + 48);
        if (v10 == 201)
        {
          LODWORD(v37[0]) = 500;
          if (xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038CD8[0]))
          {
            __strlcpy_chk();
            BYTE2(v37[3]) = 64;
            xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038CD8[0], 0);
          }
          int v10 = *(_DWORD *)(a2 + 48);
        }
        int v31 = v9;
        if (v10 == 202)
        {
          uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(*(xpc_object_t *)(a2 + 64), off_100038CE0[0]);
          if (uuid)
          {
            string = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038CE8[0]);
            BOOL v13 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038CA0[0]);
            if (string)
            {
              int v14 = v13;
              if (!v13) {
                sub_100025F74();
              }
              inet_pton(2, string, &v35[32]);
              inet_pton(2, v14, &v35[36]);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038CE8[0], 0);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038CA0[0], 0);
            }
            CFTypeRef v15 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038CF0[0]);
            if (v15)
            {
              inet_pton(30, v15, v35);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038CF0[0], 0);
            }
          }
        }
        else
        {
          uuid = 0;
        }
        CFTypeID v19 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038C90[0]);
        long long v20 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038C98[0]);
        long long v21 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038CA0[0]);
        CFArrayRef v22 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100038C20[0]);
        if (*(unsigned char *)(a2 + 8)) {
          long long v23 = (int *)(a2 + 9);
        }
        else {
          long long v23 = 0;
        }
        if (*(_DWORD *)(a2 + 72)) {
          int v24 = *(_DWORD *)(a2 + 72);
        }
        else {
          int v24 = 1500;
        }
        int v25 = *(unsigned __int8 *)(a2 + 78);
        if (*(unsigned char *)(a2 + 79)) {
          v25 |= 2u;
        }
        if (*(unsigned __int8 *)(a2 + 77) | *(_DWORD *)(a2 + 508) & 8) {
          int v26 = 304;
        }
        else {
          int v26 = 302;
        }
        long long v27 = sub_10000A090(*(_DWORD *)(a2 + 48), v26, v22, (char *)(a2 + 32), 2, v24, 0, v23, uuid, (long long *)v35, v19, v20, v21, 2, v37, v25, &v34);
        if (v19) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038C90[0], 0);
        }
        if (v20) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038C98[0], 0);
        }
        if (v21) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038CA0[0], 0);
        }
        if (v22) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038C20[0], 0);
        }
        if (uuid) {
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100038CE0[0], 0);
        }
        if (v27)
        {
          int v28 = sub_10000BB6C((uint64_t)v27, a2);
          if (v28 == 36)
          {
            sub_100006F78((uint64_t)v31, *(void *)(a2 + 56), *(void *)(a2 + 64), (uint64_t)v27, *(_DWORD *)(a2 + 52));
            sub_100005EAC();
            goto LABEL_33;
          }
          int v16 = v28;
          if (v28)
          {
            sub_100009C08((uint64_t)v27);
          }
          else
          {
            xpc_dictionary_set_string(*(xpc_object_t *)(a2 + 64), off_100038C10[0], v27 + 20);
            xpc_dictionary_set_fd(*(xpc_object_t *)(a2 + 64), off_100038BB8[0], *(_DWORD *)(a2 + 52));
            if (*(_DWORD *)(a2 + 48) != 204)
            {
              uint64_t v29 = *((void *)v27 + 36);
              if (v29) {
                sub_100013BCC(*(void **)(a2 + 64), v29);
              }
            }
            xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), off_100038C80[0], v24);
            int v16 = 0;
          }
        }
        else
        {
          sub_100005EAC();
          int v16 = v34;
          if (!v34) {
            sub_100025F48();
          }
        }
        free(v31);
        goto LABEL_70;
      }
LABEL_30:
      sub_100005EAC();
      long long v17 = off_100038BF8;
      uint64_t v18 = 2000;
      goto LABEL_31;
    }
  }
  sub_100005EAC();
  int v16 = *__error();
LABEL_70:
  if (v16) {
    uint64_t v30 = 2000;
  }
  else {
    uint64_t v30 = 2001;
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), off_100038BF8[0], v30);
  if (v16 != 16) {
    goto LABEL_32;
  }
  long long v17 = off_100038BE8;
  uint64_t v18 = 6000;
LABEL_31:
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), *v17, v18);
LABEL_32:
  sub_100007100(*(_xpc_connection_s **)(a2 + 56), *(xpc_object_t *)(a2 + 64));
  xpc_release(*(xpc_object_t *)(a2 + 64));
LABEL_33:
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
}

uint64_t sub_10000F63C(const char *a1)
{
  int v14 = 0;
  in_addr_t v13 = 0;
  long long v12 = 0uLL;
  if (getifaddrs(&v14) < 0)
  {
    uint64_t v3 = *__error();
    sub_100005EAC();
LABEL_22:
    if (v14) {
      freeifaddrs(v14);
    }
  }
  else
  {
    uint64_t v2 = v14;
    if (v14)
    {
      uint64_t v3 = 0;
      while (1)
      {
        ifa_addr = v2->ifa_addr;
        if (!ifa_addr) {
          goto LABEL_19;
        }
        int sa_family = ifa_addr->sa_family;
        BOOL v6 = sa_family == 30 || sa_family == 2;
        if (!v6 || strncmp(a1, v2->ifa_name, 0x10uLL)) {
          goto LABEL_19;
        }
        if (sa_family == 2)
        {
          in_addr_t v13 = *(_DWORD *)&ifa_addr->sa_data[2];
          v7.s_addr = v13;
          int v8 = inet_ntoa(v7);
          snprintf(__str, 0x10uLL, "%s", v8);
          int v9 = sub_10000F81C(a1, &v13);
          if (v9) {
            goto LABEL_15;
          }
        }
        else
        {
          long long v12 = *(_OWORD *)&ifa_addr->sa_data[6];
          inet_ntop(30, &v12, v15, 0x2Eu);
          int v9 = sub_10000F944(a1, &v12);
          if (v9)
          {
LABEL_15:
            unsigned int v10 = v9;
            strerror(v9);
            sub_100005EAC();
            if (v3) {
              uint64_t v3 = v3;
            }
            else {
              uint64_t v3 = v10;
            }
            goto LABEL_19;
          }
        }
        sub_100005EAC();
LABEL_19:
        uint64_t v2 = v2->ifa_next;
        if (!v2) {
          goto LABEL_22;
        }
      }
    }
    return 0;
  }
  return v3;
}

uint64_t sub_10000F81C(const char *a1, _DWORD *a2)
{
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    in_addr v7 = __error();
    strerror(*v7);
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v5 = v4;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      LOWORD(v11) = 528;
      HIDWORD(v11) = *a2;
    }
    if (ioctl(v5, 0x80206919uLL, __dst) == -1)
    {
      uint64_t v6 = *__error();
      int v8 = __error();
      strerror(*v8);
      sub_100005EAC();
    }
    else
    {
      uint64_t v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_10000F944(const char *a1, _OWORD *a2)
{
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    in_addr v7 = __error();
    strerror(*v7);
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v5 = v4;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    memset(&__dst[16], 0, 32);
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      *(_WORD *)&char __dst[16] = 7708;
      *(_OWORD *)&__dst[24] = *a2;
    }
    if (ioctl(v5, 0x81206919uLL, __dst) == -1)
    {
      uint64_t v6 = *__error();
      int v8 = __error();
      strerror(*v8);
      sub_100005EAC();
    }
    else
    {
      uint64_t v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_10000FAC0(const char *a1)
{
  *(void *)buffer = 0x600000001;
  int v13 = 0;
  size_t v12 = 4;
  if (sysctl(buffer, 2u, &v13, &v12, 0, 0) < 0)
  {
    unsigned int v10 = __error();
    strerror(*v10);
    sub_100005EAC();
LABEL_11:
    sub_100005EAC();
    return 0;
  }
  if (!v13) {
    goto LABEL_11;
  }
  int v2 = 4 * v13;
  uint64_t v3 = (int *)malloc_type_malloc(4 * v13, 0xFCF8E920uLL);
  if (!v3) {
    goto LABEL_11;
  }
  int v4 = v3;
  int v5 = proc_listallpids(v3, v2);
  if (v5 < 1)
  {
LABEL_9:
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    in_addr v7 = v4;
    while (1)
    {
      int v8 = proc_pidpath(*v7, buffer, 0x400u);
      if (v8 >= 1)
      {
        *((unsigned char *)buffer + v++*(_DWORD *)(result + 8) = 0;
        if (!strncmp((const char *)buffer, a1, 0x400uLL)) {
          break;
        }
      }
      ++v7;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    uint64_t v9 = *v7;
  }
  free(v4);
  return v9;
}

BOOL sub_10000FC34(char *a1)
{
  if (a1)
  {
    HIDWORD(v2[0]) = 0;
    v2[1] = 0;
    return inet_pton(2, a1, (char *)v2 + 4) != 0;
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
}

BOOL sub_10000FCB4(unsigned int a1)
{
  int v1 = 0;
  int v2 = 0;
  unsigned int v3 = bswap32(a1);
  while (v1 != 1)
  {
    int v1 = (v3 >> v2) & 1;
LABEL_6:
    if (++v2 == 32) {
      return v1 != 0;
    }
  }
  if ((v3 >> v2))
  {
    int v1 = 1;
    goto LABEL_6;
  }
  return 0;
}

BOOL sub_10000FD04(char *a1)
{
  if (a1)
  {
    v2[0] = 0;
    int v3 = 0;
    v2[1] = 0;
    return inet_pton(30, a1, v2) != 0;
  }
  else
  {
    sub_100005EAC();
    return 0;
  }
}

uint64_t sub_10000FD60(uint64_t a1, int a2)
{
  long long v7 = 0u;
  long long v8 = 0u;
  int v3 = socket(2, 2, 0);
  if (v3 < 0)
  {
    uint64_t v4 = *__error();
    sub_100005EAC();
    if (v3 == -1) {
      return v4;
    }
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    if ((unint64_t)__strlcpy_chk() > 0xF {
      || ioctl(v3, 0xC0206911uLL, &v7) < 0
    }
      || (LOWORD(v++*(_DWORD *)(result + 8) = v8 | a2 & ~(unsigned __int16)(a2 >> 31), ioctl(v3, 0x80206910uLL, &v7) < 0))
    {
      uint64_t v4 = *__error();
      int v5 = __error();
      strerror(*v5);
      sub_100005EAC();
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  close(v3);
  return v4;
}

uint64_t sub_10000FEC8(char *a1)
{
  if (!a1) {
    sub_100025FA0();
  }
  if (!*a1) {
    sub_100025FCC();
  }
  __int16 v7 = 0;
  uint64_t v2 = sub_10000FD60((uint64_t)a1, -1);
  uint64_t v3 = v2;
  if (v2)
  {
    strerror(v2);
    sub_100005EAC();
  }
  sub_10000D9C8(a1, (Boolean *)&v7 + 1, (Boolean *)&v7);
  if (HIBYTE(v7))
  {
    uint64_t v4 = sub_10000FFB4(a1);
    uint64_t v3 = v4;
    if (v4)
    {
      strerror(v4);
      sub_100005EAC();
    }
  }
  if ((_BYTE)v7)
  {
    uint64_t v5 = sub_10001015C(a1);
    uint64_t v3 = v5;
    if (v5)
    {
      strerror(v5);
      sub_100005EAC();
    }
  }
  return v3;
}

uint64_t sub_10000FFB4(unsigned char *a1)
{
  if (!a1) {
    sub_100025FF8();
  }
  if (!*a1) {
    sub_100026024();
  }
  long long v8 = 0u;
  long long v9 = 0u;
  int v1 = socket(2, 2, 0);
  if (v1 < 0)
  {
    uint64_t v5 = __error();
    strerror(*v5);
    sub_100005EAC();
    uint64_t v3 = *__error();
    goto LABEL_13;
  }
  int v2 = v1;
  long long v8 = 0u;
  long long v9 = 0u;
  if ((unint64_t)__strlcpy_chk() >= 0x10)
  {
    uint64_t v3 = *__error();
LABEL_6:
    uint64_t v4 = __error();
    strerror(*v4);
    sub_100005EAC();
    goto LABEL_11;
  }
  if (ioctl(v2, 0xC0206950uLL, &v8) == -1 && *__error() != 17)
  {
    uint64_t v3 = *__error();
    if (v3) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_11:
  if (close(v2))
  {
    uint64_t v6 = __error();
    uint64_t v3 = *v6;
    strerror(*v6);
    sub_100005EAC();
  }
LABEL_13:
  if (!v3) {
    sub_100005EAC();
  }
  return v3;
}

uint64_t sub_10001015C(unsigned char *a1)
{
  if (!a1) {
    sub_100026050();
  }
  if (!*a1) {
    sub_10002607C();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  int v1 = socket(30, 2, 0);
  if (v1 < 0)
  {
    uint64_t v3 = *__error();
    goto LABEL_13;
  }
  int v2 = v1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  if ((unint64_t)__strlcpy_chk() < 0x10)
  {
    if (ioctl(v2, 0xC080696EuLL, &v5) != -1 || *__error() == 17)
    {
      uint64_t v3 = 0;
      goto LABEL_11;
    }
    uint64_t v3 = *__error();
    if (!v3) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = *__error();
  }
  sub_100005EAC();
LABEL_11:
  if (!close(v2)) {
    goto LABEL_14;
  }
  uint64_t v3 = *__error();
LABEL_13:
  sub_100005EAC();
LABEL_14:
  if (!v3) {
    sub_100005EAC();
  }
  return v3;
}

uint64_t sub_10001030C(char *a1, int a2, int a3, char a4)
{
  if (!a1) {
    sub_1000260A8();
  }
  if (!*a1) {
    sub_1000260D4();
  }
  __int16 v19 = 0;
  uint64_t v8 = sub_10000F63C(a1);
  uint64_t v9 = v8;
  if (v8)
  {
    strerror(v8);
    sub_100005EAC();
  }
  if ((a4 & 1) == 0)
  {
    uint64_t v10 = sub_10000FD60((uint64_t)a1, -1);
    uint64_t v9 = v10;
    if (v10)
    {
      strerror(v10);
      sub_100005EAC();
    }
  }
  sub_10000D9C8(a1, (Boolean *)&v19 + 1, (Boolean *)&v19);
  int v11 = HIBYTE(v19);
  if (HIBYTE(v19))
  {
    if ((a4 & 1) == 0)
    {
      uint64_t v12 = sub_10000FFB4(a1);
      uint64_t v9 = v12;
      if (v12)
      {
        strerror(v12);
        sub_100005EAC();
      }
    }
  }
  int v13 = v19;
  if (a2 && (_BYTE)v19)
  {
    int v14 = sub_1000104F0(a1);
    if (v14)
    {
      strerror(v14);
      sub_100005EAC();
    }
    uint64_t v15 = sub_10001064C(a1);
    uint64_t v9 = v15;
    if (v15)
    {
      strerror(v15);
      sub_100005EAC();
    }
    if ((a4 & 1) == 0)
    {
      uint64_t v16 = sub_10001015C(a1);
      uint64_t v9 = v16;
      if (v16)
      {
        strerror(v16);
        sub_100005EAC();
      }
    }
  }
  if (a3) {
    sub_100010778(a1, 1);
  }
  if (v11 || v13)
  {
    uint64_t v17 = sub_10000FD60((uint64_t)a1, 1);
    uint64_t v9 = v17;
    if (v17)
    {
      strerror(v17);
      sub_100005EAC();
    }
  }
  return v9;
}

uint64_t sub_1000104F0(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    long long v5 = __error();
    strerror(*v5);
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v3 = v2;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    long long v10 = 0u;
    long long v9 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC1206984uLL, &__dst) == -1)
    {
      uint64_t v4 = *__error();
      long long v6 = __error();
      strerror(*v6);
      sub_100005EAC();
    }
    else
    {
      uint64_t v4 = 0;
    }
    close(v3);
  }
  return v4;
}

uint64_t sub_10001064C(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    long long v5 = __error();
    strerror(*v5);
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v3 = v2;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    long long v10 = 0u;
    long long v9 = 0u;
    strncpy(__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC0806982uLL, __dst) == -1)
    {
      uint64_t v4 = *__error();
      long long v6 = __error();
      strerror(*v6);
      sub_100005EAC();
    }
    else
    {
      uint64_t v4 = 0;
    }
    close(v3);
  }
  return v4;
}

uint64_t sub_100010778(const char *a1, int a2)
{
  uint64_t v4 = SCPreferencesCreate(0, @"com.apple.MobileInternetSharing", 0);
  if (v4)
  {
    long long v5 = v4;
    long long v6 = (const __SCNetworkService *)sub_10000DB28(v4, a1);
    if (!v6)
    {
      sub_100005EAC();
      uint64_t v8 = 0xFFFFFFFFLL;
LABEL_13:
      CFRelease(v5);
      return v8;
    }
    long long v7 = v6;
    if (SCNetworkServiceGetEnabled(v6) != a2)
    {
      if (!SCNetworkServiceSetEnabled(v7, a2) || !SCPreferencesCommitChanges(v5) || !SCPreferencesApplyChanges(v5))
      {
        sub_100005EAC();
        uint64_t v8 = 0xFFFFFFFFLL;
        goto LABEL_12;
      }
      sub_100005EAC();
    }
    uint64_t v8 = 0;
LABEL_12:
    CFRelease(v7);
    goto LABEL_13;
  }
  sub_100005EAC();
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000108B8(char *a1, int a2, char a3)
{
  if (!a1) {
    sub_100026100();
  }
  if (!*a1) {
    sub_10002612C();
  }
  if (a2) {
    sub_100010778(a1, 0);
  }
  int v5 = sub_10000F63C(a1);
  if (v5)
  {
    strerror(v5);
    sub_100005EAC();
  }
  if ((a3 & 1) == 0)
  {
    int v6 = sub_1000109F8(a1);
    if (v6)
    {
      strerror(v6);
      sub_100005EAC();
    }
  }
  int v7 = sub_100010B58(a1);
  if (v7)
  {
    strerror(v7);
    sub_100005EAC();
  }
  int v8 = sub_100010C94(a1);
  if (v8)
  {
    strerror(v8);
    sub_100005EAC();
  }
  if ((a3 & 1) == 0)
  {
    int v9 = sub_100010DD0(a1);
    if (v9)
    {
      strerror(v9);
      sub_100005EAC();
    }
  }
  uint64_t v10 = sub_10000FD60((uint64_t)a1, -1);
  uint64_t v11 = v10;
  if (v10)
  {
    strerror(v10);
    sub_100005EAC();
  }
  return v11;
}

uint64_t sub_1000109F8(unsigned char *a1)
{
  if (!a1) {
    sub_100026158();
  }
  if (!*a1) {
    sub_100026184();
  }
  long long v5 = 0u;
  long long v6 = 0u;
  int v1 = socket(2, 2, 0);
  if (v1 < 0)
  {
    sub_100005EAC();
    uint64_t v3 = *__error();
  }
  else
  {
    int v2 = v1;
    long long v5 = 0u;
    long long v6 = 0u;
    if ((unint64_t)__strlcpy_chk() > 0xF || ioctl(v2, 0xC0206951uLL, &v5) == -1)
    {
      uint64_t v3 = *__error();
      sub_100005EAC();
    }
    else
    {
      uint64_t v3 = 0;
    }
    if (close(v2))
    {
      uint64_t v3 = *__error();
      sub_100005EAC();
    }
  }
  if (!v3) {
    sub_100005EAC();
  }
  return v3;
}

uint64_t sub_100010B58(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v3 = v2;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    long long v10 = 0u;
    long long v9 = 0u;
    long long v8 = 0u;
    long long v7 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC1206985uLL, &__dst) == -1)
    {
      uint64_t v4 = *__error();
      sub_100005EAC();
    }
    else
    {
      uint64_t v4 = 0;
    }
    close(v3);
  }
  return v4;
}

uint64_t sub_100010C94(const char *a1)
{
  int v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v3 = v2;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    long long v10 = 0u;
    long long v9 = 0u;
    long long v8 = 0u;
    long long v7 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC1206983uLL, &__dst) == -1)
    {
      uint64_t v4 = *__error();
      sub_100005EAC();
    }
    else
    {
      uint64_t v4 = 0;
    }
    close(v3);
  }
  return v4;
}

uint64_t sub_100010DD0(unsigned char *a1)
{
  if (!a1) {
    sub_1000261B0();
  }
  if (!*a1) {
    sub_1000261DC();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  int v1 = socket(30, 2, 0);
  if (v1 < 0)
  {
    uint64_t v3 = *__error();
LABEL_12:
    sub_100005EAC();
    goto LABEL_13;
  }
  int v2 = v1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  if ((unint64_t)__strlcpy_chk() > 0xF || ioctl(v2, 0xC120696FuLL, &v5) == -1)
  {
    uint64_t v3 = *__error();
    sub_100005EAC();
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (close(v2))
  {
    uint64_t v3 = *__error();
    goto LABEL_12;
  }
LABEL_13:
  if (!v3) {
    sub_100005EAC();
  }
  return v3;
}

uint64_t sub_100010F70(unsigned char *a1)
{
  if (!a1) {
    sub_100026208();
  }
  if (!*a1) {
    sub_100026234();
  }
  int v2 = sub_1000109F8(a1);
  if (v2)
  {
    strerror(v2);
    sub_100005EAC();
  }
  uint64_t v3 = sub_100010DD0(a1);
  uint64_t v4 = v3;
  if (v3)
  {
    strerror(v3);
    sub_100005EAC();
  }
  return v4;
}

uint64_t sub_100011000(const char *a1)
{
  long long v5 = 0;
  if (!a1 || !*a1) {
    sub_100026260();
  }
  if (getifaddrs(&v5))
  {
    sub_100005EAC();
  }
  else
  {
    uint64_t v4 = &v5;
    while (1)
    {
      uint64_t v4 = (ifaddrs **)*v4;
      if (!v4) {
        break;
      }
      if (!strncmp(a1, (const char *)v4[1], 0x10uLL))
      {
        uint64_t v2 = *((unsigned int *)v4 + 4);
        goto LABEL_6;
      }
    }
  }
  uint64_t v2 = 0;
LABEL_6:
  if (v5) {
    freeifaddrs(v5);
  }
  return v2;
}

uint64_t sub_100011094(unsigned char *a1, int a2)
{
  if (!a1) {
    sub_10002628C();
  }
  if (!*a1) {
    sub_1000262B8();
  }
  long long v9 = 0u;
  long long v10 = 0u;
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    uint64_t v6 = *__error();
    sub_100005EAC();
    if (!v6) {
      return v6;
    }
    goto LABEL_14;
  }
  int v5 = v4;
  long long v9 = 0u;
  long long v10 = 0u;
  if ((unint64_t)__strlcpy_chk() < 0x10)
  {
    LODWORD(v10) = a2;
    if (ioctl(v5, 0x80206934uLL, &v9) == -1)
    {
      unsigned int v7 = *__error();
      if (sub_10000A8C4(a1) == a2) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v7;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = *__error();
    sub_100005EAC();
  }
  close(v5);
  if (v6)
  {
LABEL_14:
    strerror(v6);
    sub_100005EAC();
  }
  return v6;
}

uint64_t sub_1000111F8(const char *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  int v8 = socket(2, 2, 0);
  if (v8 < 0)
  {
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v9 = v8;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      LOWORD(v13) = 528;
      DWORD1(v13) = *a2;
    }
    if (a3)
    {
      LOWORD(v15) = 528;
      DWORD1(v15) = *a3;
    }
    if (a4 || a2 && (a4 = a2, (sub_100011000(a1) & 0x10) != 0))
    {
      LOWORD(v14) = 528;
      DWORD1(v14) = *a4;
    }
    if (ioctl(v9, 0x8040691AuLL, __dst) == -1)
    {
      uint64_t v10 = *__error();
      sub_100005EAC();
    }
    else
    {
      uint64_t v10 = 0;
    }
    close(v9);
  }
  return v10;
}

uint64_t sub_10001135C(const char *a1, _OWORD *a2, long long *a3, int a4)
{
  int v8 = socket(30, 2, 0);
  if (v8 < 0)
  {
    long long v11 = __error();
    strerror(*v11);
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v9 = v8;
    uint64_t v19 = 0;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    memset(&__dst[16], 0, 32);
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      *(_WORD *)&char __dst[16] = 7708;
      *(_OWORD *)&__dst[24] = *a2;
    }
    if (a3)
    {
      WORD4(v16) = 7708;
      long long v17 = *a3;
    }
    DWORD1(v1++*(_DWORD *)(result + 8) = a4;
    uint64_t v20 = -1;
    if (ioctl(v9, 0x8080691AuLL, __dst) == -1)
    {
      uint64_t v10 = *__error();
      long long v12 = __error();
      strerror(*v12);
      sub_100005EAC();
    }
    else
    {
      uint64_t v10 = 0;
    }
    close(v9);
  }
  return v10;
}

uint64_t sub_1000114D0(uint64_t a1)
{
  long long v11 = 0;
  if (getifaddrs(&v11))
  {
    uint64_t v2 = *__error();
    sub_100005EAC();
  }
  else
  {
    uint64_t v3 = v11;
    if (v11)
    {
      while (1)
      {
        ifa_addr = v3->ifa_addr;
        if (ifa_addr && ifa_addr->sa_family == 18 && ifa_addr->sa_data[4] == 6)
        {
          int v5 = &ifa_addr->sa_len + ifa_addr->sa_data[3];
          int v6 = *((_DWORD *)v5 + 2);
          int v7 = *((unsigned __int16 *)v5 + 6);
          if (*(_DWORD *)a1 == v6 && *(unsigned __int16 *)(a1 + 4) == v7) {
            break;
          }
        }
        uint64_t v3 = v3->ifa_next;
        if (!v3)
        {
          uint64_t v2 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v2 = 22;
LABEL_13:
      int v9 = v11;
    }
    else
    {
      int v9 = 0;
      uint64_t v2 = 0;
    }
    freeifaddrs(v9);
  }
  return v2;
}

uint64_t sub_10001159C(uint64_t a1, int *a2, int a3)
{
  long long v13 = 0;
  if (!a2) {
    sub_1000262E4();
  }
  if (getifaddrs(&v13))
  {
    sub_100005EAC();
    return 0;
  }
  else
  {
    int v7 = v13;
    if (v13)
    {
      int v8 = (const char *)(a1 + 308);
      int v9 = v13;
      while (strncmp(v8, v9->ifa_name, 0x10uLL) || (v9->ifa_flags & 0x10) == 0)
      {
        int v9 = v9->ifa_next;
        if (!v9) {
          goto LABEL_9;
        }
      }
      if (a3)
      {
        ifa_netmask = v9->ifa_netmask;
        if (ifa_netmask) {
          int v12 = *(_DWORD *)&ifa_netmask->sa_data[2];
        }
        else {
          int v12 = -1;
        }
        *a2 = v12;
      }
      uint64_t v6 = 1;
    }
    else
    {
LABEL_9:
      uint64_t v6 = 0;
    }
    freeifaddrs(v7);
  }
  return v6;
}

uint64_t sub_100011674(uint64_t a1)
{
  int v7 = 0;
  if (!*(unsigned char *)(a1 + 308)) {
    sub_100026310();
  }
  if (getifaddrs(&v7))
  {
    uint64_t v2 = *__error();
    sub_100005EAC();
  }
  else
  {
    uint64_t v3 = v7;
    if (v7)
    {
      int v4 = v7;
      while (1)
      {
        if (!strncmp((const char *)(a1 + 308), v4->ifa_name, 0x10uLL))
        {
          ifa_addr = v4->ifa_addr;
          if (ifa_addr)
          {
            if (ifa_addr->sa_family == 30
              && ifa_addr->sa_data[6] == 254
              && (ifa_addr->sa_data[7] & 0xC0) == 0x80)
            {
              break;
            }
          }
        }
        int v4 = v4->ifa_next;
        if (!v4) {
          goto LABEL_14;
        }
      }
      uint64_t v2 = 0;
      *(sockaddr *)(a1 + 664) = *(sockaddr *)&ifa_addr->sa_data[6];
    }
    else
    {
LABEL_14:
      uint64_t v2 = 6;
    }
    freeifaddrs(v3);
  }
  return v2;
}

uint64_t sub_100011760(const char *a1)
{
  return sub_100011768(a1, 1);
}

uint64_t sub_100011768(const char *a1, int a2)
{
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    int v7 = __error();
    strerror(*v7);
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v5 = v4;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    strncpy(__dst, a1, 0x10uLL);
    LODWORD(v11) = a2;
    if (ioctl(v5, 0xC020698DuLL, __dst) == -1)
    {
      uint64_t v6 = *__error();
      int v8 = __error();
      strerror(*v8);
      sub_100005EAC();
    }
    else
    {
      uint64_t v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_100011880(const char *a1)
{
  return sub_100011768(a1, 0);
}

uint64_t sub_100011888(const char *a1)
{
  return sub_100011890(a1, 1);
}

uint64_t sub_100011890(const char *a1, int a2)
{
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    int v7 = __error();
    strerror(*v7);
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v5 = v4;
    long long v27 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    LODWORD(v11) = a2;
    if (ioctl(v5, 0xC1206988uLL, &__dst) == -1)
    {
      uint64_t v6 = *__error();
      int v8 = __error();
      strerror(*v8);
      sub_100005EAC();
    }
    else
    {
      uint64_t v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_1000119FC(const char *a1)
{
  return sub_100011890(a1, 0);
}

uint64_t sub_100011A04(uint64_t a1, int a2)
{
  int v3 = socket(30, 2, 0);
  if (v3 < 0)
  {
    sub_100005EAC();
    return *__error();
  }
  else
  {
    int v4 = v3;
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    memset(v8, 0, sizeof(v8));
    __strlcpy_chk();
    if (ioctl(v4, 0xC030694CuLL, v8) < 0
      || (!a2 ? (int v5 = 0) : (int v5 = 32),
          DWORD1(v9) = DWORD1(v9) & 0xFFFFFFDF | v5,
          uint64_t v6 = 0,
          ioctl(v4, 0xC0486957uLL, v8) < 0))
    {
      uint64_t v6 = *__error();
      sub_100005EAC();
    }
    close(v4);
  }
  return v6;
}

uint64_t sub_100011B48(posix_spawnattr_t *a1, posix_spawn_file_actions_t *a2)
{
  uint64_t v4 = posix_spawn_file_actions_init(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    strerror(v4);
LABEL_17:
    sub_100005EAC();
    return v5;
  }
  if (dword_10003946C) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = byte_100039480 == 0;
  }
  if (v6)
  {
    posix_spawn_file_actions_addopen(a2, 1, "/dev/null", 1, 0);
    posix_spawn_file_actions_addopen(a2, 2, "/dev/null", 1, 0);
  }
  sigset_t v11 = 0;
  uint64_t v7 = posix_spawnattr_init(a1);
  if (v7)
  {
    uint64_t v5 = v7;
    posix_spawn_file_actions_destroy(a2);
    strerror(v5);
    goto LABEL_17;
  }
  uint64_t v8 = posix_spawnattr_setflags(a1, 12);
  if (v8)
  {
    uint64_t v5 = v8;
    posix_spawnattr_destroy(a1);
    posix_spawn_file_actions_destroy(a2);
    strerror(v5);
    goto LABEL_17;
  }
  uint64_t v9 = posix_spawnattr_setsigmask(a1, &v11);
  if (v9)
  {
    uint64_t v5 = v9;
    posix_spawnattr_destroy(a1);
    posix_spawn_file_actions_destroy(a2);
    strerror(v5);
    goto LABEL_17;
  }
  sigset_t v11 = -1;
  uint64_t v5 = posix_spawnattr_setsigdefault(a1, &v11);
  if (v5)
  {
    posix_spawnattr_destroy(a1);
    posix_spawn_file_actions_destroy(a2);
    strerror(v5);
    goto LABEL_17;
  }
  return v5;
}

void sub_100011CF4(const __CFArray *a1, const char *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x600u);
  if (v5)
  {
    CFStringRef v6 = v5;
    v8.location = 0;
    v8.length = Count;
    if (!CFArrayContainsValue(a1, v8, v5)) {
      CFArrayAppendValue(a1, v6);
    }
    CFRelease(v6);
  }
}

void sub_100011D88(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x600u);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void sub_100011E00(__CFDictionary *a1, const void *a2, __int16 a3)
{
  __int16 valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberShortType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t sub_100011E68(CFPropertyListRef propertyList, const std::__fs::filesystem::path *a2, uid_t a3, gid_t a4, uint64_t a5, int a6)
{
  uint64_t v6 = 22;
  if (propertyList && a2 && a5)
  {
    CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (Data)
    {
      CFDataRef v13 = Data;
      snprintf((char *)__str, 0x400uLL, "%s-", (const char *)a2);
      if (a6 == 1) {
        int v14 = open_dprotected_np((const char *)__str, 1537, 4, 0, a5);
      }
      else {
        int v14 = open((const char *)__str, 1537, a5);
      }
      int v15 = v14;
      if (v14 < 0)
      {
        uint64_t v6 = *__error();
        CFRelease(v13);
      }
      else
      {
        size_t Length = CFDataGetLength(v13);
        BytePtr = CFDataGetBytePtr(v13);
        if (write(v15, BytePtr, Length) == Length)
        {
          rename(__str, a2, v18);
          if (v19)
          {
            uint64_t v6 = v19;
            unlink((const char *)__str);
          }
          else
          {
            uint64_t v6 = chown((const char *)a2, a3, a4);
          }
        }
        else
        {
          uint64_t v6 = *__error();
        }
        CFRelease(v13);
        close(v15);
      }
    }
    else
    {
      return 12;
    }
  }
  return v6;
}

size_t sub_10001200C(const char *a1, int *a2, int a3)
{
  memset(&v17, 0, sizeof(v17));
  int v6 = stat(a1, &v17);
  *a2 = v6;
  if (v6 < 0) {
    return 0;
  }
  size_t st_size = v17.st_size;
  if (v17.st_size)
  {
    CFRange v8 = (UInt8 *)malloc_type_malloc(v17.st_size, 0xE23C9A12uLL);
    if (v8)
    {
      uint64_t v9 = v8;
      if (a3 == 1) {
        int v10 = open_dprotected_np(a1, 0, 4, 0);
      }
      else {
        int v10 = open(a1, 0);
      }
      int v12 = v10;
      if ((v10 & 0x80000000) == 0)
      {
        if (read(v10, v9, st_size) == st_size)
        {
          CFDataRef v13 = CFDataCreateWithBytesNoCopy(0, v9, st_size, kCFAllocatorNull);
          if (v13)
          {
            CFDataRef v14 = v13;
            size_t st_size = (size_t)CFPropertyListCreateWithData(kCFAllocatorDefault, v13, 0, 0, 0);
            if (!st_size) {
              *a2 = 12;
            }
            CFRelease(v14);
            goto LABEL_21;
          }
          size_t st_size = 0;
          int v15 = 12;
        }
        else
        {
          size_t st_size = 0;
          int v15 = *__error();
        }
        *a2 = v15;
LABEL_21:
        free(v9);
        close(v12);
        return st_size;
      }
      *a2 = *__error();
      free(v9);
      return 0;
    }
    size_t st_size = 0;
    int v11 = 12;
  }
  else
  {
    int v11 = 22;
  }
  *a2 = v11;
  return st_size;
}

uint64_t sub_1000121A0(unsigned int a1)
{
  unsigned int v1 = bswap32(a1);
  int v2 = -32;
  while (((v1 >> v2) & 1) == 0)
  {
    if (__CFADD__(v2++, 1)) {
      return 32;
    }
  }
  return -v2;
}

char *sub_1000121C8(int a1, unsigned int a2)
{
  int v2 = 0;
  int v14 = a1;
  unsigned int v3 = bswap32(a2);
  while (((v3 >> v2) & 1) == 0)
  {
    if (++v2 == 32)
    {
      byte_100038F0C = 0;
      int v4 = 32;
      int v5 = 4;
      goto LABEL_7;
    }
  }
  int v4 = 32 - v2;
  byte_100038F0C = 0;
  unsigned int v6 = 39 - v2;
  if (v6 < 8) {
    goto LABEL_12;
  }
  int v5 = v6 >> 3;
LABEL_7:
  uint64_t v7 = (v5 - 1);
  uint64_t v8 = v7 + 1;
  uint64_t v9 = (unsigned __int8 *)&v14;
  do
  {
    int v11 = *v9++;
    int v10 = v11;
    if (v7) {
      int v12 = ".";
    }
    else {
      int v12 = (const char *)&unk_100029759;
    }
    snprintf(__str, 8uLL, "%d%s", v10, v12);
    __strlcat_chk();
    LODWORD(v7) = v7 - 1;
    --v8;
  }
  while (v8);
LABEL_12:
  snprintf(__str, 8uLL, "/%d", v4);
  __strlcat_chk();
  return &byte_100038F0C;
}

const char *sub_10001232C(int a1)
{
  if ((a1 - 201) > 3) {
    return "unknown_mode";
  }
  else {
    return off_100034E90[a1 - 201];
  }
}

const char *sub_100012354(int a1)
{
  if ((a1 - 301) > 3) {
    return "unknown";
  }
  else {
    return off_100034EB0[a1 - 301];
  }
}

uint64_t sub_10001237C()
{
  return 0;
}

uint64_t sub_100012480(const char *a1, BOOL *a2)
{
  int v4 = SCPreferencesCreate(0, @"com.apple.MobileInternetSharing", 0);
  if (v4)
  {
    int v5 = v4;
    unsigned int v6 = (const __SCNetworkService *)sub_10000DB28(v4, a1);
    if (v6)
    {
      uint64_t v7 = v6;
      *a2 = SCNetworkServiceGetEnabled(v6) != 0;
      sub_100005EAC();
      CFRelease(v7);
      uint64_t v8 = 0;
    }
    else
    {
      sub_100005EAC();
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    CFRelease(v5);
  }
  else
  {
    sub_100005EAC();
    return 0xFFFFFFFFLL;
  }
  return v8;
}

xpc_object_t sub_100012560(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "iftype", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 280) + 284));
  xpc_dictionary_set_uint64(v2, "duration", *(void *)(a1 + 40));
  return v2;
}

uint64_t sub_1000125C4(void *a1, int a2, _DWORD *a3)
{
  unsigned int v3 = a3;
  int v4 = a2;
  *a3 = 0;
  if (a2 == 2)
  {
    unsigned int v6 = &dword_1000394B8;
    int v35 = 5;
    uint64_t v7 = &qword_1000394A8;
  }
  else
  {
    if (a2 != 30) {
      sub_100026394();
    }
    unsigned int v6 = &dword_1000394BC;
    int v35 = 6;
    uint64_t v7 = &qword_1000394B0;
  }
  int interface_names = nwi_state_get_interface_names();
  if (interface_names)
  {
    uint64_t v9 = malloc_type_malloc(8 * interface_names, 0x10040436913F5uLL);
    if (v9)
    {
      int v10 = v9;
      int v11 = nwi_state_get_interface_names();
      if (v11 >= 1)
      {
        uint64_t v30 = v3;
        int v31 = v6;
        uint64_t v12 = 0;
        uint64_t v34 = 0;
        int v32 = 0;
        int v33 = v4;
        uint64_t v13 = v11;
        while (1)
        {
          int v14 = (const char *)v10[v12];
          if (v14)
          {
            if (*v14)
            {
              if (if_nametoindex((const char *)v10[v12]))
              {
                if (nwi_state_get_ifstate())
                {
                  uint64_t flags = nwi_ifstate_get_flags();
                  if ((~flags & v35) == 0) {
                    break;
                  }
                }
              }
            }
          }
          sub_100005EAC();
LABEL_18:
          if (++v12 == v13) {
            goto LABEL_59;
          }
        }
        if (v4 == 30)
        {
          int v36 = 0;
          if (getifaddrs(&v36))
          {
            sub_100005EAC();
LABEL_30:
            unsigned int v3 = v30;
LABEL_54:
            int v4 = v33;
            goto LABEL_18;
          }
          long long v16 = v36;
          uint64_t v29 = v36;
          if (!v36) {
            goto LABEL_30;
          }
          while (1)
          {
            ifa_addr = v16->ifa_addr;
            if (ifa_addr)
            {
              if (ifa_addr->sa_family == 30
                && !strncmp(v14, v16->ifa_name, 0x10uLL)
                && (ifa_addr->sa_data[6] != 254 || (ifa_addr->sa_data[7] & 0xC0) != 0x80))
              {
                break;
              }
            }
            long long v16 = v16->ifa_next;
            if (!v16)
            {
              free(v29);
              goto LABEL_30;
            }
          }
          free(v29);
          unsigned int v3 = v30;
        }
        sub_100005EAC();
        long long v18 = v7;
        while (1)
        {
          long long v18 = (uint64_t *)*v18;
          if (!v18) {
            break;
          }
          if (!strncmp((const char *)v18 + 8, v14, 0x10uLL)) {
            goto LABEL_43;
          }
        }
        uint64_t v19 = malloc_type_malloc(0x30uLL, 0x102004051B57111uLL);
        if (!v19)
        {
          int v28 = __error();
          strerror(*v28);
          sub_100005EAC();
          free(v10);
          goto LABEL_57;
        }
        long long v18 = (uint64_t *)v19;
        *((_OWORD *)v19 + 2) = 0u;
        *(_OWORD *)uint64_t v19 = 0u;
        *((_OWORD *)v19 + 1) = 0u;
        snprintf((char *)v19 + 8, 0x10uLL, "%s", v14);
        *long long v18 = *v7;
        *uint64_t v7 = (uint64_t)v18;
        if (v33 == 2)
        {
          BOOL v20 = __CFADD__(dword_100038EF0++, 1);
          if (v20) {
            sub_10002633C();
          }
        }
        else
        {
          BOOL v20 = __CFADD__(dword_100038EF4++, 1);
          if (v20) {
            sub_100026368();
          }
        }
        HIDWORD(v34) = 1;
LABEL_43:
        if (flags != v18[4]) {
          v18[4] = flags;
        }
        int v21 = sub_10000A8C4((unsigned char *)v18 + 8);
        int v22 = HIDWORD(v34);
        if (v21 != *((_DWORD *)v18 + 6))
        {
          *((_DWORD *)v18 + 6) = v21;
          int v22 = 1;
        }
        if ((int)v34 > v21 || v34 == 0) {
          int v24 = v21;
        }
        else {
          int v24 = v34;
        }
        *((unsigned char *)v18 + 41) = 1;
        LODWORD(v34) = v24;
        HIDWORD(v34) = (*((unsigned char *)v18 + 40) == 0) | v22;
        *((_DWORD *)v18 + 7) = v32;
        ++*v31;
        ++v32;
        goto LABEL_54;
      }
      uint64_t v34 = 0;
LABEL_59:
      *unsigned int v3 = v34;
      free(v10);
      char v25 = BYTE4(v34);
    }
    else
    {
      long long v26 = __error();
      strerror(*v26);
      sub_100005EAC();
LABEL_57:
      nwi_state_release();
      char v25 = 0;
      *a1 = 0;
    }
  }
  else
  {
    sub_100005EAC();
    char v25 = 0;
  }
  return v25 & 1;
}

void sub_100012A34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 1107)) {
    sub_1000263C0();
  }
  xpc_object_t v2 = (void *)qword_100039498;
  if (qword_100039498)
  {
    while (v2 != (void *)v1 || *(_DWORD *)(v1 + 16) != 1 || *(_DWORD *)(v1 + 20) != 201)
    {
      xpc_object_t v2 = (void *)*v2;
      if (!v2) {
        return;
      }
    }
    dispatch_source_get_data(*(dispatch_source_t *)(v1 + 1120));
    sub_100005EAC();
    bzero(v12, 0x400uLL);
    int handle = dispatch_source_get_handle(*(dispatch_source_t *)(v1 + 1120));
    ssize_t v4 = read(handle, v12, 0x400uLL);
    if (v4 == -1)
    {
LABEL_22:
      int v9 = *__error();
      if (v9 && v9 != 35)
      {
        strerror(v9);
LABEL_26:
        sub_100005EAC();
      }
    }
    else
    {
      ssize_t v5 = v4;
LABEL_10:
      if (v5 >= 1)
      {
        ssize_t v6 = 0;
        while (1)
        {
          uint64_t v7 = &v12[v6];
          v6 += *(unsigned int *)&v12[v6];
          if (v6 > v5)
          {
            sub_100005EAC();
LABEL_21:
            bzero(v12, 0x400uLL);
            int v8 = dispatch_source_get_handle(*(dispatch_source_t *)(v1 + 1120));
            ssize_t v5 = read(v8, v12, 0x400uLL);
            if (v5 != -1) {
              goto LABEL_10;
            }
            goto LABEL_22;
          }
          if (v7[1] == 1
            && v7[2] == 1
            && v7[3] == 7
            && v7[5] == 1
            && if_nametoindex((const char *)(v1 + 308)) == v7[28])
          {
            break;
          }
          if (v6 >= v5) {
            goto LABEL_21;
          }
        }
        sub_100005EAC();
        uint64_t v11 = 0;
        memset(v10, 0, sizeof(v10));
        if (sub_100012C7C(v1, (uint64_t)v10)) {
          goto LABEL_26;
        }
        sub_10000CAA8(v1, (unsigned __int8 *)v10);
      }
    }
  }
}

uint64_t sub_100012C74(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_100012C7C(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 1107)) {
    sub_1000263EC();
  }
  long long v4 = *(_OWORD *)(a1 + 880);
  v41[9] = *(_OWORD *)(a1 + 864);
  v41[10] = v4;
  uint64_t v42 = *(void *)(a1 + 896);
  long long v5 = *(_OWORD *)(a1 + 816);
  v41[5] = *(_OWORD *)(a1 + 800);
  v41[6] = v5;
  long long v6 = *(_OWORD *)(a1 + 848);
  v41[7] = *(_OWORD *)(a1 + 832);
  v41[8] = v6;
  long long v7 = *(_OWORD *)(a1 + 752);
  v41[1] = *(_OWORD *)(a1 + 736);
  v41[2] = v7;
  long long v8 = *(_OWORD *)(a1 + 784);
  v41[3] = *(_OWORD *)(a1 + 768);
  v41[4] = v8;
  long long v9 = *(_OWORD *)(a1 + 720);
  long long v40 = *(_OWORD *)(a1 + 704);
  v41[0] = v9;
  BOOL v10 = (v9 | DWORD1(v9) | DWORD2(v9) | HIDWORD(v9)) == 0;
  *(_OWORD *)long long v43 = xmmword_1000290D0;
  int __errnum = 0;
  long long v39 = 0;
  uint64_t v11 = (char *)sub_100013218((int)"ICMPV6CTL_ND6_DRLIST", v43, (size_t *)&v39, &__errnum);
  if (!v11)
  {
    uint64_t v13 = __errnum;
    if (__errnum) {
      goto LABEL_4;
    }
    sub_100005EAC();
    return 0;
  }
  uint64_t v12 = v39;
  uint64_t v13 = __errnum;
  if (__errnum)
  {
LABEL_4:
    if (v13 != 2)
    {
      strerror(v13);
      sub_100005EAC();
    }
    int v14 = 0;
    goto LABEL_7;
  }
  *(_OWORD *)long long v43 = xmmword_1000290E0;
  long long v39 = 0;
  int __errnum = 0;
  int v14 = (char *)sub_100013218((int)"ICMPV6CTL_ND6_PRLIST", v43, (size_t *)&v39, &__errnum);
  if (!v14)
  {
    uint64_t v13 = __errnum;
    if (!__errnum)
    {
      sub_100005EAC();
      int v14 = 0;
      uint64_t v13 = 2;
      goto LABEL_7;
    }
    goto LABEL_17;
  }
  long long v37 = v39;
  uint64_t v13 = __errnum;
  if (__errnum)
  {
LABEL_17:
    if (v13 != 2) {
      goto LABEL_82;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_100026418();
  }
  long long v16 = (const char *)(a1 + 308);
  unsigned int v17 = if_nametoindex(v16);
  if (v17)
  {
    if ((uint64_t)v12 < 1) {
      goto LABEL_65;
    }
    unsigned int v18 = v17;
    uint64_t v34 = 0;
    int v35 = 0;
    uint64_t v33 = a2;
    int v36 = (char *)v12 + (void)v11;
    uint64_t v19 = v11;
    while ((uint64_t)v37 < 1 || v18 != *((unsigned __int16 *)v19 + 20))
    {
LABEL_62:
      v19 += 48;
      if (v19 >= v36)
      {
        a2 = v33;
        int v28 = v34;
        uint64_t v29 = v35;
        if (v34 && v35)
        {
LABEL_70:
          memmove((void *)(a2 + 8), v28, 0x48uLL);
          long long v31 = *((_OWORD *)v29 + 1);
          long long v30 = *((_OWORD *)v29 + 2);
          *(_OWORD *)(a2 + 80) = *(_OWORD *)v29;
          *(_OWORD *)(a2 + 96) = v31;
          *(_OWORD *)(a2 + 112) = v30;
          *(unsigned char *)a2 = 1;
          inet_ntop(30, (const void *)(a2 + 16), (char *)v43, 0x2Eu);
          sub_100005EAC();
          uint64_t v13 = 0;
        }
        else
        {
LABEL_65:
          sub_100005EAC();
          uint64_t v13 = 2;
        }
LABEL_71:
        if (*(unsigned char *)a2)
        {
          int v32 = socket(30, 2, 0);
          if (v32 < 0)
          {
            uint64_t v13 = *__error();
            sub_100005EAC();
            if (v32 != -1) {
              goto LABEL_80;
            }
          }
          else
          {
            if ((unint64_t)__strlcpy_chk() >= 0x10 || ioctl(v32, 0xC030694CuLL, a2 + 128) < 0)
            {
              uint64_t v13 = *__error();
              sub_100005EAC();
            }
            else
            {
              uint64_t v13 = 0;
            }
LABEL_80:
            close(v32);
          }
          if (v13)
          {
LABEL_82:
            strerror(v13);
            goto LABEL_83;
          }
        }
        goto LABEL_7;
      }
    }
    BOOL v20 = v14;
    while (1)
    {
      unsigned int v21 = *((unsigned __int16 *)v20 + 33);
      if (v20[29] != 64) {
        goto LABEL_61;
      }
      if (v18 != *((unsigned __int16 *)v20 + 32) || v21 == 0) {
        goto LABEL_61;
      }
      long long v39 = 0;
      if (getifaddrs(&v39))
      {
        int v23 = *__error();
        sub_100005EAC();
      }
      else
      {
        long long v26 = v39;
        if (!v39) {
          goto LABEL_61;
        }
        while (1)
        {
          if (!strncmp(v16, v26->ifa_name, 0x10uLL))
          {
            ifa_addr = v26->ifa_addr;
            if (ifa_addr)
            {
              if (ifa_addr->sa_family == 30
                && (ifa_addr->sa_data[6] != 254 || (ifa_addr->sa_data[7] & 0xC0) != 0x80)
                && *(void *)&ifa_addr->sa_data[6] == *((void *)v20 + 1))
              {
                break;
              }
            }
          }
          long long v26 = v26->ifa_next;
          if (!v26)
          {
            int v23 = -1;
            goto LABEL_57;
          }
        }
        int v23 = 0;
LABEL_57:
        if (v39) {
          free(v39);
        }
      }
      if (!v23 && *((_WORD *)v20 + 33))
      {
        uint64_t v24 = 0;
        while (*(void *)&v20[v24 + 80] != *((void *)v19 + 1) || *(void *)&v20[v24 + 88] != *((void *)v19 + 2))
        {
          v24 += 28;
          if (28 * *((unsigned __int16 *)v20 + 33) == v24) {
            goto LABEL_61;
          }
        }
        if (v10
          || (uint64_t v34 = v20,
              int v35 = v19,
              sub_1000133A0((unsigned __int8 *)v41, (unsigned __int8 *)v20 + 8, v20[29])))
        {
          uint64_t v29 = v19;
          int v28 = v20;
          a2 = v33;
          goto LABEL_70;
        }
      }
LABEL_61:
      v20 += 28 * v21 + 72;
      if (v20 >= (char *)v37 + (unint64_t)v14) {
        goto LABEL_62;
      }
    }
  }
  uint64_t v13 = *__error();
  sub_100005EAC();
  if ((v13 & 0xFFFFFFFD) == 0) {
    goto LABEL_71;
  }
LABEL_83:
  sub_100005EAC();
LABEL_7:
  if (v11) {
    free(v11);
  }
  if (v14) {
    free(v14);
  }
  if (v13 == 2) {
    return 0;
  }
  return v13;
}

void *sub_100013218(int a1, int *a2, size_t *a3, int *a4)
{
  size_t size = 0;
  int v7 = 1;
  while (1)
  {
    if (v7 != 1) {
      sub_100005EAC();
    }
    if (sysctl(a2, 4u, 0, &size, 0, 0) < 0)
    {
      int v9 = *__error();
LABEL_12:
      strerror(v9);
      sub_100005EAC();
LABEL_14:
      long long v8 = 0;
      goto LABEL_17;
    }
    if (!size)
    {
      sub_100005EAC();
      int v9 = 0;
      goto LABEL_14;
    }
    long long v8 = malloc_type_malloc(size, 0xF14D96CAuLL);
    if (!v8)
    {
      sub_100005EAC();
      int v9 = 12;
      goto LABEL_17;
    }
    if (!sysctl(a2, 4u, v8, &size, 0, 0)) {
      break;
    }
    free(v8);
    int v9 = *__error();
    if (*__error() != 12) {
      goto LABEL_12;
    }
    if (++v7 == 11) {
      goto LABEL_14;
    }
  }
  int v9 = 0;
LABEL_17:
  size_t v10 = size;
  if (!v8) {
    size_t v10 = 0;
  }
  *a3 = v10;
  *a4 = v9;
  return v8;
}

BOOL sub_1000133A0(unsigned __int8 *a1, unsigned __int8 *a2, int a3)
{
  char v3 = a3;
  if (a3 >= 129)
  {
    sub_100005EAC();
    return 0;
  }
  size_t v6 = (unint64_t)a3 >> 3;
  return !bcmp(a1, a2, v6) && ((v3 & 7) == 0 || a1[v6] >> (8 - (v3 & 7)) == a2[v6] >> (8 - (v3 & 7)));
}

void sub_100013440(int a1, CFArrayRef theArray, uint64_t a3)
{
  if (!a3) {
    sub_100026444();
  }
  char v3 = (void *)qword_100039498;
  if (qword_100039498)
  {
    in6_addr v47 = (in6_addr)0;
    while (v3 != (void *)a3 || *(_DWORD *)(a3 + 16) != 1 || *(_DWORD *)(a3 + 20) != 201)
    {
      char v3 = (void *)*v3;
      if (!v3) {
        return;
      }
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      uint64_t v9 = a3 + 308;
      long long v43 = (void *)(a3 + 648);
      int v48 = 0;
      int v49 = 0;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v8);
        if (CFStringHasSuffix(ValueAtIndex, kSCEntNetIPv4))
        {
          if (!ValueAtIndex || (uint64_t v11 = *(const __SCDynamicStore **)(a3 + 1112)) == 0)
          {
            sub_100005EAC();
            goto LABEL_85;
          }
          CFPropertyListRef v12 = SCDynamicStoreCopyValue(v11, ValueAtIndex);
          if (v12)
          {
            uint64_t v13 = v12;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (CFGetTypeID(v13) != TypeID) {
              goto LABEL_84;
            }
            CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)v13, kSCPropNetIPv4Addresses);
            if (!Value) {
              goto LABEL_49;
            }
            long long v16 = Value;
            CFTypeID v17 = CFArrayGetTypeID();
            if (CFGetTypeID(v16) != v17) {
              goto LABEL_84;
            }
            if (CFArrayGetCount((CFArrayRef)v16))
            {
              int v18 = 1;
              if ((sub_10001159C(a3, &v48, 1) & 1) == 0)
              {
                uint64_t v19 = CFDictionaryGetValue((CFDictionaryRef)v13, kSCPropNetIPv4SubnetMasks);
                if (!v19
                  || (BOOL v20 = v19, v21 = CFArrayGetTypeID(), CFGetTypeID(v20) != v21)
                  || !CFArrayGetCount((CFArrayRef)v20))
                {
LABEL_84:
                  sub_100005EAC();
                  CFRelease(v13);
LABEL_85:
                  sub_100005EAC();
                  return;
                }
                CFStringRef v22 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v20, 0);
                CFStringGetCString(v22, buffer, 16, 0x600u);
                if (inet_pton(2, buffer, &v48) == 1)
                {
                  int v18 = 1;
                }
                else
                {
                  sub_100005EAC();
                  int v18 = 0;
                }
              }
              CFStringRef v35 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v16, 0);
              CFStringGetCString(v35, buffer, 16, 0x600u);
              if (inet_pton(2, buffer, &v49) != 1) {
                goto LABEL_84;
              }
              CFRelease(v13);
              if (!v18) {
                goto LABEL_85;
              }
            }
            else
            {
LABEL_49:
              int v48 = 0;
              int v49 = 0;
              CFRelease(v13);
            }
          }
          else
          {
            int v48 = 0;
            int v49 = 0;
          }
          uint64_t v36 = *(unsigned int *)(a3 + 680);
          if (v36 != v49 || (uint64_t v37 = *(unsigned int *)(a3 + 684), v37 != v48))
          {
            inet_ntop(2, (const void *)(a3 + 680), buffer, 0x10u);
            inet_ntop(2, &v49, v64, 0x10u);
            sub_100005EAC();
            LODWORD(v37) = v48;
            LODWORD(v36) = v49;
          }
          sub_10000D440(a3, v36, v37);
        }
        else if (CFStringHasSuffix(ValueAtIndex, kSCEntNetIPv6))
        {
          in6_addr v47 = in6addr_any;
          if (!ValueAtIndex || (int v23 = *(const __SCDynamicStore **)(a3 + 1112)) == 0)
          {
            sub_100005EAC();
            goto LABEL_64;
          }
          *(void *)int v64 = 0;
          in6_addr v65 = (in6_addr)0;
          int v66 = 0;
          CFPropertyListRef v24 = SCDynamicStoreCopyValue(v23, ValueAtIndex);
          if (!v24) {
            goto LABEL_51;
          }
          CFTypeID v25 = CFDictionaryGetTypeID();
          if (CFGetTypeID(v24) != v25) {
            goto LABEL_51;
          }
          CFArrayRef v26 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v24, kSCPropNetIPv6Addresses);
          if (v26)
          {
            CFArrayRef v27 = v26;
            CFTypeID v28 = CFArrayGetTypeID();
            if (CFGetTypeID(v27) == v28)
            {
              CFIndex v46 = CFArrayGetCount(v27);
              if (v46)
              {
                if (*(unsigned char *)(a3 + 1107))
                {
                  CFArrayRef v42 = 0;
LABEL_35:
                  CFArrayRef theArraya = v27;
                  if (v46 >= 1)
                  {
                    CFIndex v29 = 0;
                    while (1)
                    {
                      CFStringRef v30 = (const __CFString *)CFArrayGetValueAtIndex(theArraya, v29);
                      if (v30)
                      {
                        CFStringRef v31 = v30;
                        uint64_t v32 = v9;
                        CFTypeID v33 = CFStringGetTypeID();
                        BOOL v41 = CFGetTypeID(v31) == v33;
                        uint64_t v9 = v32;
                        if (v41)
                        {
                          CFStringGetCString(v31, buffer, 46, 0x600u);
                          if (inet_pton(30, buffer, &v65) == 1
                            && (v65.__u6_addr8[0] != 254 || (v65.__u6_addr8[1] & 0xC0) != 0x80))
                          {
                            if (*(unsigned char *)(a3 + 1107)) {
                              break;
                            }
                            int valuePtr = 0;
                            CFNumberRef v34 = (const __CFNumber *)CFArrayGetValueAtIndex(v42, v29);
                            if (CFNumberGetValue(v34, kCFNumberSInt32Type, &valuePtr))
                            {
                              if ((valuePtr & 0x109F) == 0) {
                                break;
                              }
                            }
                          }
                        }
                      }
                      if (v46 == ++v29) {
                        goto LABEL_51;
                      }
                    }
                    in6_addr v47 = v65;
                    sub_100005EAC();
                    CFRelease(v24);
                    if (*(unsigned char *)(a3 + 1107))
                    {
                      if (!*(void *)(a3 + 1120) && sub_10000C6D8(a3)) {
                        sub_100005EAC();
                      }
                    }
                    else
                    {
                      BOOL v41 = *v43 == *(void *)v47.__u6_addr8 && *(void *)(a3 + 656) == *(void *)&v47.__u6_addr32[2];
                      if (!v41)
                      {
                        inet_ntop(30, v43, buffer, 0x2Eu);
                        inet_ntop(30, &v47, v64, 0x2Eu);
                        sub_100005EAC();
                        sub_10000D15C(a3, (uint64_t)&v47);
                      }
                    }
                    goto LABEL_60;
                  }
LABEL_51:
                  sub_100005EAC();
                  if (!v24)
                  {
LABEL_64:
                    long long v38 = *(NSObject **)(a3 + 1120);
                    if (v38)
                    {
                      if (!*(unsigned char *)(a3 + 1107)) {
                        sub_100026470();
                      }
                      if (!*(unsigned char *)(a3 + 704)) {
                        goto LABEL_68;
                      }
                      uint64_t v63 = 0;
                      long long v61 = 0u;
                      long long v62 = 0u;
                      long long v59 = 0u;
                      long long v60 = 0u;
                      long long v57 = 0u;
                      long long v58 = 0u;
                      long long v55 = 0u;
                      long long v56 = 0u;
                      long long v53 = 0u;
                      long long v54 = 0u;
                      *(_OWORD *)buffer = 0u;
                      long long v52 = 0u;
                      sub_10000CAA8(a3, (unsigned __int8 *)buffer);
                      long long v38 = *(NSObject **)(a3 + 1120);
                      if (v38)
                      {
LABEL_68:
                        dispatch_source_cancel(v38);
                        dispatch_release(*(dispatch_object_t *)(a3 + 1120));
                        *(void *)(a3 + 1120) = 0;
                      }
                    }
                    goto LABEL_60;
                  }
LABEL_63:
                  CFRelease(v24);
                  goto LABEL_64;
                }
                CFArrayRef v39 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v24, kSCPropNetIPv6Flags);
                if (v39)
                {
                  CFArrayRef v40 = v39;
                  CFArrayRef theArrayb = (CFArrayRef)CFArrayGetTypeID();
                  CFArrayRef v42 = v40;
                  if ((CFArrayRef)CFGetTypeID(v40) == theArrayb && CFArrayGetCount(v40) == v46) {
                    goto LABEL_35;
                  }
                }
              }
            }
          }
          sub_100005EAC();
          goto LABEL_63;
        }
LABEL_60:
        ++v8;
      }
      while (v8 != v7);
    }
  }
}

void sub_100013BCC(void *a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a2 + 684);
  unsigned int v5 = *(_DWORD *)(a2 + 680);
  int v6 = *(_DWORD *)(a2 + 692);
  if (v6)
  {
    if (v6 != (v5 & v4)) {
      unsigned int v5 = *(_DWORD *)(a2 + 692);
    }
    unsigned int v7 = *(_DWORD *)(a2 + 696);
  }
  else
  {
    unsigned int v7 = bswap32(bswap32(v5 | ~v4) - 1);
  }
  CFIndex v8 = off_100038C90[0];
  unsigned int v12 = v5;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v8, string);
  uint64_t v9 = off_100038C98[0];
  unsigned int v12 = v7;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v9, string);
  size_t v10 = off_100038CA0[0];
  unsigned int v12 = v4;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v10, string);
  if (*(_DWORD *)(a2 + 1128) == 500 && !*(unsigned char *)(a2 + 1107))
  {
    if (*(unsigned char *)(a2 + 1178))
    {
      xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v11, off_100038CD8[0], (const char *)(a2 + 1132));
      xpc_dictionary_set_value(a1, off_100038CC8[0], v11);
      xpc_release(v11);
    }
  }
}

uint64_t sub_100013D6C()
{
  byte_100038F2C = 1;
  return 0;
}

void sub_100013D80()
{
  if (byte_100038F2C == 1) {
    byte_100038F2C = 0;
  }
}

uint64_t sub_100013D98(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 0;
  uint64_t result = (uint64_t)sub_100023020(a2);
  if (!result)
  {
    memset(v5, 0, sizeof(v5));
    uint64_t result = (uint64_t)sub_100022FE0((uint64_t)v5);
    *a3 = BYTE1(v5[0]);
    if (!result)
    {
      if (LOBYTE(v5[0]))
      {
        sub_100018144(DWORD1(v5[0]));
        sub_100005EAC();
        return 0;
      }
      else
      {
        return 45;
      }
    }
  }
  return result;
}

uint64_t sub_100013E4C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) != 1) {
    sub_1000264F4();
  }
  if (*(_DWORD *)(a1 + 288) != 100) {
    sub_1000264C8();
  }
  int v2 = dword_100038F30++;
  if (v2 > 0) {
    return 0;
  }
  if (v2 < 0) {
    sub_10002649C();
  }
  if (*(unsigned char *)(a1 + 1269))
  {
    sub_100014130(a1);
    return 37;
  }
  else
  {
    sub_100023060(1, (uint64_t)sub_1000141B0, a1);
    sub_100023160();
    uint64_t result = 0;
    *(unsigned char *)(a1 + 1269) = 1;
    *(void *)(a1 + 592) = sub_100013F1C;
    *(void *)(a1 + 600) = sub_1000140FC;
    *(void *)(a1 + 632) = 0;
  }
  return result;
}

uint64_t sub_100013F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a2 + 288) != 100) {
    sub_10002654C();
  }
  if (!dword_100038F30) {
    sub_100026520();
  }
  BOOL v4 = *(_DWORD *)(a3 + 288) == 101;
  *(unsigned char *)(a2 + 126++*(_DWORD *)(result + 8) = v4;
  if (v4)
  {
    memset(v9, 0, sizeof(v9));
    sub_100005EAC();
    id v5 = sub_100022FE0((uint64_t)v9);
    if (v5) {
      sub_100017944(0x3FDu);
    }
    if (LOBYTE(v9[0]))
    {
      if (BYTE1(v9[0]))
      {
        sub_100017B9C();
LABEL_16:
        *(unsigned char *)(a2 + 126++*(_DWORD *)(result + 8) = 0;
        goto LABEL_17;
      }
      unsigned int v6 = 1021;
    }
    else
    {
      unsigned int v6 = 1020;
    }
    sub_100017944(v6);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a2 + 12) || *(unsigned char *)(a2 + 1276))
  {
    sub_100005EAC();
    return 0;
  }
  sub_100005EAC();
  id v8 = sub_100022FA0(1);
  if (!v8)
  {
    *(unsigned char *)(a2 + 1276) = 1;
    *(_DWORD *)(a2 + 12) = 0;
    return 36;
  }
  id v5 = v8;
  sub_100005EAC();
LABEL_17:
  *(_DWORD *)(a2 + 12) = v5 == 0;
  if (v5 == 36) {
    return 36;
  }
  sub_10000B498(a2, (int)v5);
  if (v5 && v5 != 62)
  {
    strerror((int)v5);
    sub_100005EAC();
  }
  return (uint64_t)v5;
}

double sub_1000140FC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 288) != 100) {
    sub_100026578();
  }

  return sub_100014130(a1);
}

double sub_100014130(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 288) != 100) {
    sub_100026654();
  }
  int v1 = dword_100038F30;
  if (!dword_100038F30) {
    sub_1000265A4();
  }
  --dword_100038F30;
  if (v1 <= 1)
  {
    sub_100014794(a1, 1);
    if (*(void *)(a1 + 1120)) {
      sub_100026628();
    }
    if (*(void *)(a1 + 1112)) {
      sub_1000265FC();
    }
    if (*(unsigned char *)(a1 + 1269)) {
      sub_1000265D0();
    }
    double result = 0.0;
    *(_OWORD *)(a1 + 592) = 0u;
  }
  return result;
}

void sub_1000141B0(int a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    goto LABEL_8;
  }
  unsigned int v5 = a1 - 1;
  if (!a2 && v5 <= 1) {
    sub_100005EAC();
  }
  if (dword_100038F30 && *(unsigned char *)(a3 + 1269))
  {
    sub_10000EBA0(a3);
    switch(v5)
    {
      case 0u:
        sub_100005EAC();
        if ((*(unsigned char *)(a3 + 1276)
           || *(unsigned char *)(a2 + 16) && strncmp((const char *)(a3 + 308), (const char *)(a2 + 16), 0x100uLL))
          && *(unsigned char *)(a2 + 2)
          && *(_DWORD *)(a2 + 8) == 3)
        {
          goto LABEL_21;
        }
        if (!*(unsigned char *)(a3 + 1270) || *(unsigned char *)(a2 + 2) && *(_DWORD *)(a2 + 8) == 3) {
          goto LABEL_37;
        }
        goto LABEL_29;
      case 1u:
        sub_100005EAC();
        if (*(_DWORD *)a2 == 3)
        {
          if (*(unsigned char *)(a3 + 1276)
            || *(unsigned char *)(a2 + 8) && strncmp((const char *)(a3 + 308), (const char *)(a2 + 8), 0x100uLL))
          {
LABEL_21:
            sub_100005EAC();
            int v6 = sub_10001460C(a3);
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        if (!*(unsigned char *)(a3 + 1270))
        {
LABEL_37:
          int v6 = 0;
          goto LABEL_38;
        }
LABEL_29:
        sub_100005EAC();
        *(_DWORD *)(a3 + 12) = 0;
        *(unsigned char *)(a3 + 1270) = 0;
        sub_10000C9A4(a3);
        if (!*(unsigned char *)(a3 + 1271))
        {
          sub_10000E004(0x1388u);
          *(unsigned char *)(a3 + 1271) = 1;
        }
        sub_100017C00(36);
        *(unsigned char *)(a3 + 1276) = 1;
        if (sub_1000178B8() == 45) {
          int v6 = 45;
        }
        else {
          int v6 = 0;
        }
LABEL_38:
        *(_DWORD *)(a3 + 1272) = v6;
        sub_100009D2C((uint64_t *)a3);
        break;
      case 2u:
        sub_100005EAC();
        sub_100014794(a3, 0);
        int v6 = 36;
        sub_100017C00(36);
        sub_100017944(0x3FCu);
        goto LABEL_38;
      case 3u:
        if (!dword_100038F30) {
          goto LABEL_37;
        }
        sub_100005EAC();
        if (dword_100038F30 <= 0) {
          sub_10002649C();
        }
        if (*(unsigned char *)(a3 + 1269))
        {
          int v6 = 37;
        }
        else
        {
          int v6 = 0;
          *(unsigned char *)(a3 + 1269) = 1;
        }
        goto LABEL_38;
      default:
        sub_100005EAC();
        int v6 = 6;
        goto LABEL_38;
    }
  }
  else
  {
LABEL_8:
    sub_100005EAC();
  }
}

uint64_t sub_10001460C(uint64_t a1)
{
  *(void *)stat __str = 0;
  uint64_t v10 = 0;
  *(void *)__s2 = 0;
  uint64_t v8 = 0;
  if (sub_1000230B8((uint64_t)__s2))
  {
    sub_100005EAC();
    uint64_t v2 = 19;
    sub_100005EAC();
  }
  else
  {
    int v3 = strncmp((const char *)(a1 + 308), __s2, 0x100uLL);
    if (v3)
    {
      snprintf(__str, 0x10uLL, "%s", (const char *)(a1 + 308));
      sub_10000C9A4(a1);
      sub_10000D7CC(a1);
    }
    sub_10000EBB0(a1, __s2);
    int v4 = sub_10000A8C4((unsigned char *)(a1 + 308));
    *(_DWORD *)(a1 + 296) = v4;
    *(_DWORD *)(a1 + 300) = v4 - 40;
    if (v3) {
      sub_10000D8AC(a1, __str);
    }
    sub_100005EAC();
    uint64_t v2 = sub_10000C3E0(a1);
    if (v2) {
      sub_100005EAC();
    }
  }
  *(unsigned char *)(a1 + 1276) = 0;
  BOOL v5 = v2 == 0;
  *(_DWORD *)(a1 + 12) = v5;
  *(unsigned char *)(a1 + 1270) = v5;
  sub_100017C00(v2);
  sub_10000B498(a1, v2);
  return v2;
}

uint64_t sub_100014794(uint64_t a1, int a2)
{
  if ((*(_DWORD *)(a1 + 288) - 102) <= 0xFFFFFFFD) {
    sub_100026680();
  }
  if (a2 && dword_100038F30) {
    sub_1000266AC();
  }
  uint64_t result = sub_10000C9A4(a1);
  *(unsigned char *)(a1 + 1276) = 0;
  if (a2)
  {
    sub_100023060(0, 0, 0);
    uint64_t result = (uint64_t)sub_100022FA0(0);
  }
  *(unsigned char *)(a1 + 1269) = 0;
  return result;
}

uint64_t sub_10001480C()
{
  byte_100038F34 = 1;
  uint64_t result = sub_100019D10();
  if (!result)
  {
    sub_1000249DC();
    uint64_t result = sub_100023190();
    if (!result)
    {
      return sub_1000242BC();
    }
  }
  return result;
}

uint64_t sub_100014858()
{
  if (byte_100038F34 == 1)
  {
    sub_10001A210();
    sub_1000249FC();
    sub_100023210();
    uint64_t result = nullsub_1();
    byte_100038F34 = 0;
  }
  return result;
}

uint64_t sub_100014898(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 1128);
  if (v1 == 501) {
    sub_1000266D8();
  }
  int v3 = *(unsigned __int8 *)(a1 + 1107);
  int v5 = v1 == 500 && v3 == 0;
  if (v1 != 502 && v3 == v5) {
    sub_100026704();
  }
  int v7 = *(_DWORD *)(a1 + 16);
  sub_10000EBB0(a1, (const char *)(a1 + 28));
  if (v7) {
    goto LABEL_21;
  }
  unsigned int v8 = *(_DWORD *)(a1 + 296);
  if (!v8)
  {
    unsigned int v8 = 1500;
    goto LABEL_17;
  }
  if (v8 <= 0x4FF)
  {
    unsigned int v8 = 1280;
LABEL_17:
    *(_DWORD *)(a1 + 296) = v8;
  }
  if (*(_DWORD *)(a1 + 288) != 104)
  {
    uint64_t v9 = sub_100011094((unsigned char *)(a1 + 308), v8);
    if (v9) {
      goto LABEL_30;
    }
  }
  if (!*(_DWORD *)(a1 + 304))
  {
    uint64_t v9 = sub_10001A228();
    if (!v9)
    {
      uint64_t v10 = sub_100023254();
      if (v10)
      {
        uint64_t v9 = v10;
        sub_10001AD4C(a1);
      }
      else
      {
        if (v1 == 502) {
          goto LABEL_21;
        }
        uint64_t v12 = sub_100024314();
        if (!v12) {
          goto LABEL_21;
        }
        uint64_t v9 = v12;
        sub_10001AD4C(a1);
        sub_10002415C();
      }
    }
LABEL_30:
    sub_100005EAC();
    return v9;
  }
LABEL_21:
  *(void *)(a1 + 592) = sub_100014A3C;
  *(void *)(a1 + 600) = sub_100014C2C;
  *(void *)(a1 + 632) = 0;
  *(void *)(a1 + 60++*(_DWORD *)(result + 8) = sub_100014DF0;
  if (!*(_DWORD *)(a1 + 16))
  {
    if (*(_DWORD *)(a1 + 288) == 104)
    {
      *(void *)(a1 + 616) = sub_100014F28;
      *(void *)(a1 + 624) = sub_100014FB0;
    }
    if (!*(_DWORD *)(a1 + 304)) {
      sub_100014FF8(a1);
    }
  }
  return 0;
}

uint64_t sub_100014A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(a2 + 288);
  if (v5 != 102 && v5 != 104) {
    sub_100026730();
  }
  if (*(_DWORD *)(a2 + 16) != 1)
  {
    if (*(unsigned char *)(a2 + 700)) {
      goto LABEL_29;
    }
    *(unsigned char *)(a2 + 700) = 1;
    int v7 = qword_1000394D4;
    LODWORD(qword_1000394D4) = qword_1000394D4 + 1;
    if (v7 < 0) {
      sub_100026788();
    }
    uint64_t v8 = sub_100015600(a2, a3);
    if (v8)
    {
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v9 = sub_100015C14(a2, (unsigned char *)a3, 0);
      if (!v9) {
        goto LABEL_16;
      }
      uint64_t v6 = v9;
    }
    sub_100005EAC();
    goto LABEL_30;
  }
  if (!*(unsigned char *)(a2 + 564)) {
    goto LABEL_7;
  }
  if (sub_10000BF60() == -1) {
    goto LABEL_29;
  }
  if (!*(unsigned char *)(a2 + 564))
  {
LABEL_7:
    uint64_t v6 = sub_10000C3E0(a2);
    if (v6) {
      goto LABEL_30;
    }
  }
LABEL_16:
  if (*(_DWORD *)(a2 + 16) == 1 && *(unsigned char *)(a2 + 564))
  {
    int v10 = *(_DWORD *)(a2 + 296);
    if (!v10)
    {
      int v10 = 1500;
      *(_DWORD *)(a2 + 296) = 1500;
    }
    *(_DWORD *)(a2 + 300) = v10 - 40;
    goto LABEL_28;
  }
  int v11 = sub_10000A8C4((unsigned char *)(a2 + 308));
  *(_DWORD *)(a2 + 296) = v11;
  int v12 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 300) = v11 - 40;
  if (v12 == 1)
  {
LABEL_28:
    sub_100005EAC();
    goto LABEL_29;
  }
  if (v12)
  {
LABEL_29:
    uint64_t v6 = 0;
    goto LABEL_30;
  }
  if (!*(unsigned char *)(a3 + 564) && !*(_DWORD *)(a3 + 680) || (uint64_t v6 = sub_10001A38C(a2, a3), !v6))
  {
    *(unsigned char *)(a2 + 700) = 0;
    if ((int)qword_1000394D4 <= 0) {
      sub_10002675C();
    }
    uint64_t v6 = 0;
    LODWORD(qword_1000394D4) = qword_1000394D4 - 1;
  }
LABEL_30:
  *(_DWORD *)(a2 + 12) = v6 == 0;
  return v6;
}

void sub_100014C2C(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 288) - 102) >= 3) {
    sub_100026838();
  }
  if (*(void *)(a1 + 632)) {
    sub_10002680C();
  }
  int v2 = *(_DWORD *)(a1 + 1128);
  *(_DWORD *)(a1 + 12) = 0;
  *(_OWORD *)(a1 + 592) = 0u;
  *(_OWORD *)(a1 + 60++*(_DWORD *)(result + 8) = 0u;
  *(void *)(a1 + 624) = 0;
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (*(_DWORD *)(a1 + 20) == 201) {
      sub_10000C9A4(a1);
    }
    if (*(unsigned char *)(a1 + 564))
    {
      sub_10000C2B8();
    }
    return;
  }
  if (*(unsigned char *)(a1 + 700))
  {
    *(unsigned char *)(a1 + 700) = 0;
    int v3 = *(_DWORD *)(a1 + 20);
    if (v3 == 203)
    {
      int v4 = (uint64_t *)((char *)&qword_1000394D4 + 4);
      int v5 = HIDWORD(qword_1000394D4);
      if (SHIDWORD(qword_1000394D4) <= 0) {
        sub_1000267E0();
      }
    }
    else
    {
      if (v3 != 201) {
        goto LABEL_17;
      }
      int v4 = &qword_1000394D4;
      int v5 = qword_1000394D4;
      if ((int)qword_1000394D4 <= 0) {
        sub_1000267B4();
      }
    }
    *(_DWORD *)int v4 = v5 - 1;
  }
LABEL_17:
  if (*(_DWORD *)(a1 + 304)) {
    goto LABEL_27;
  }
  sub_10001AD4C(a1);
  if (*(_DWORD *)(a1 + 20) != 201) {
    goto LABEL_25;
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = v6;
    xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)(a1 + 308));
    sub_100024FD4((char *)(a1 + 565), v7);
    xpc_release(v7);
  }
  if (byte_100039481) {
    goto LABEL_27;
  }
  sub_10002415C();
  if (v2 != 502)
  {
    sub_100024778();
LABEL_25:
    int v8 = 1;
    goto LABEL_26;
  }
  sub_1000208E4(0);
  int v8 = 0;
LABEL_26:
  sub_1000152E4(a1, v8, 1);
LABEL_27:
  sub_10000DC60(a1);
  if (*(_DWORD *)(a1 + 288) == 104)
  {
    sub_10001C42C((char *)(a1 + 308));
  }
}

uint64_t sub_100014DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16) || (int v4 = *(_DWORD *)(a3 + 288), v4 != 102) && v4 != 104) {
    sub_100026864();
  }
  if (*(_DWORD *)(a2 + 1128) != 502 && !*(unsigned char *)(a2 + 704) && *(unsigned char *)(a2 + 1107)) {
    sub_1000268E8();
  }
  if (*(unsigned char *)(a3 + 700)) {
    return 0;
  }
  *(unsigned char *)(a3 + 700) = 1;
  int v6 = qword_1000394D4;
  LODWORD(qword_1000394D4) = qword_1000394D4 + 1;
  if (v6 < 0) {
    sub_100026890();
  }
  if (*(_DWORD *)(a3 + 1128) == 502) {
    sub_1000208E4(1);
  }
  uint64_t v7 = sub_100023308();
  if (v7 || *(_DWORD *)(a3 + 1128) != 502 && (uint64_t v7 = sub_1000243C8(), v7))
  {
    uint64_t v5 = v7;
    strerror(v7);
    sub_100005EAC();
  }
  else
  {
    *(unsigned char *)(a3 + 700) = 0;
    if ((int)qword_1000394D4 <= 0) {
      sub_1000268BC();
    }
    uint64_t v5 = 0;
    LODWORD(qword_1000394D4) = qword_1000394D4 - 1;
  }
  return v5;
}

uint64_t sub_100014F28(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 16) || *(_DWORD *)(a1 + 288) != 104) {
    sub_100026914();
  }
  uint64_t v3 = sub_10001C0A4((char *)(a2 + 308), (char *)(a1 + 308), a3, 0, *(_DWORD *)(a2 + 1240) & 1, 0);
  if (v3) {
    sub_100005EAC();
  }
  return v3;
}

uint64_t sub_100014FB0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 16) || *(_DWORD *)(a1 + 288) != 104) {
    sub_100026940();
  }

  return sub_10001C758((char *)(a2 + 308), (char *)(a1 + 308));
}

uint64_t sub_100014FF8(uint64_t result)
{
  if (*(_DWORD *)(result + 16) || (uint64_t v1 = result, *(_DWORD *)(result + 304))) {
    sub_10002696C();
  }
  v16.in_addr_t s_addr = 0;
  if (*(_DWORD *)(result + 292))
  {
    *(_DWORD *)(result + 684) = -251658241;
    char v2 = sub_1000121A0(0xF0FFFFFF);
    int v3 = *(_DWORD *)(v1 + 292);
    uint64_t result = inet_aton("172.19.73.1", &v16);
    in_addr_t s_addr = v16.s_addr;
    unsigned int v5 = (bswap32(v16.s_addr & 0xF0FFFFFF) + (v3 - 1) * (16 << -v2)) | 1;
LABEL_9:
    *(_DWORD *)(v1 + 680) = bswap32(v5);
    goto LABEL_10;
  }
  unsigned int v6 = *(_DWORD *)(result + 692);
  if (v6)
  {
    in_addr_t s_addr = 0;
    unsigned int v7 = *(_DWORD *)(result + 684) & v6;
    unsigned int v8 = bswap32(v6);
    unsigned int v9 = bswap32(v7);
    if (v7 == v6) {
      unsigned int v5 = v9 + 1;
    }
    else {
      unsigned int v5 = v8;
    }
    goto LABEL_9;
  }
  if ((*(unsigned char *)(result + 584) & 2) != 0)
  {
    c.count[0] = 0;
    uint64_t result = sub_100018364(*(_DWORD *)(result + 20), &v16, &c);
    if (result)
    {
      if (*(_DWORD *)(v1 + 20) == 201) {
        int v12 = "192.168.64.1";
      }
      else {
        int v12 = "192.168.128.1";
      }
      uint64_t result = inet_aton(v12, &v16);
      unsigned int v13 = -256;
    }
    else
    {
      unsigned int v13 = bswap32(c.count[0]);
    }
    in_addr_t s_addr = v16.s_addr;
    *(_DWORD *)(v1 + 680) = bswap32((bswap32(v16.s_addr) & v13) + 1);
    unsigned int v11 = bswap32(v13);
  }
  else
  {
    uint64_t result = inet_aton("172.20.10.1", &v16);
    in_addr_t s_addr = v16.s_addr;
    *(_DWORD *)(v1 + 680) = v16.s_addr & 0xF0FFFFFF | 0x1000000;
    unsigned int v11 = -251658241;
  }
  *(_DWORD *)(v1 + 684) = v11;
LABEL_10:
  if (!byte_100039481 && *(_DWORD *)(v1 + 1128) == 500 && !*(unsigned char *)(v1 + 1107) && !*(unsigned char *)(v1 + 1178))
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    int v19 = *(_DWORD *)(v1 + 684);
    in_addr_t data = s_addr;
    memset(&c, 0, sizeof(c));
    v17.tv_seCC_SHA256_CTX c = 0;
    v17.tv_nseCC_SHA256_CTX c = 0;
    if ((byte_100038F45 & 1) == 0)
    {
      if (gethostuuid(byte_100038F35, &v17))
      {
        int v10 = __error();
        strerror(*v10);
        sub_100005EAC();
      }
      else
      {
        byte_100038F45 = 1;
      }
    }
    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, &data, 4u);
    CC_SHA256_Update(&c, &v19, 4u);
    if (byte_100038F45 == 1) {
      CC_SHA256_Update(&c, byte_100038F35, 0x10u);
    }
    CC_SHA256_Final(md, &c);
    LOBYTE(v14) = -3;
    *(_DWORD *)((char *)&v14 + 1) = *(_DWORD *)md;
    HIDWORD(v14) = *(_DWORD *)&md[3];
    uint64_t v15 = 0;
    *(unsigned char *)(v1 + 117++*(_DWORD *)(result + 8) = 64;
    inet_ntop(30, &v14, (char *)(v1 + 1132), 0x2Eu);
    return sub_100005EAC();
  }
  return result;
}

uint64_t sub_1000152E4(uint64_t a1, int a2, int a3)
{
  if ((*(_DWORD *)(a1 + 288) - 102) >= 3) {
    sub_1000269C4();
  }
  if (*(_DWORD *)(a1 + 16)) {
    sub_100026998();
  }
  if (a2)
  {
    int v6 = sub_100015460(a1);
    if (v6)
    {
      strerror(v6);
      sub_100005EAC();
    }
  }
  if (a3)
  {
    int v7 = sub_100010C94((const char *)(a1 + 308));
    if (v7)
    {
      strerror(v7);
      sub_100005EAC();
    }
  }
  if (*(_DWORD *)(a1 + 20) == 201)
  {
    if (a2) {
      sub_100011880((const char *)(a1 + 308));
    }
    if (a3) {
      sub_1000119FC((const char *)(a1 + 308));
    }
  }
  unsigned int v8 = (char *)(a1 + 308);
  uint64_t v9 = sub_10000F63C(v8);
  uint64_t v10 = v9;
  if (v9)
  {
    strerror(v9);
    sub_100005EAC();
  }
  if (a2)
  {
    uint64_t v11 = sub_1000109F8(v8);
    uint64_t v10 = v11;
    if (v11)
    {
      strerror(v11);
      sub_100005EAC();
    }
  }
  if (a3)
  {
    uint64_t v12 = sub_100010DD0(v8);
    uint64_t v10 = v12;
    if (v12)
    {
      strerror(v12);
      sub_100005EAC();
    }
  }
  sub_10001030C(v8, a3, 0, 0);
  return v10;
}

uint64_t sub_100015460(uint64_t a1)
{
  char v2 = (char *)(a1 + 308);
  uint64_t v3 = if_nametoindex((const char *)(a1 + 308));
  if (v3)
  {
    if (*(_DWORD *)(a1 + 680))
    {
      int v4 = socket(17, 3, 2);
      if (v4 < 0)
      {
        uint64_t v3 = *__error();
        sub_100005EAC();
      }
      else
      {
        int v5 = v4;
        int v6 = *(_DWORD *)(a1 + 680);
        int v7 = *(_DWORD *)(a1 + 684);
        int v8 = v7 & v6;
        int v9 = sub_100016150(v4, 2, v7 & v6, v6, v7, v2, 0, v6, 0);
        sub_1000121C8(v8, *(_DWORD *)(a1 + 684));
        if (v9) {
          strerror(v9);
        }
        sub_100005EAC();
        uint64_t v10 = sub_100016150(v5, 2, 0, *(_DWORD *)(a1 + 680), 0, v2, v3, *(_DWORD *)(a1 + 680), 3);
        uint64_t v3 = v10;
        if (v10) {
          strerror(v10);
        }
        sub_100005EAC();
        close(v5);
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

BOOL sub_1000155D4(unsigned int a1)
{
  unsigned int v1 = bswap32(a1);
  BOOL v2 = HIBYTE(v1) == 10 || v1 >> 20 == 2753;
  unsigned int v3 = HIWORD(v1);
  return v2 || v3 == 49320;
}

uint64_t sub_100015600(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a1 + 288) - 102) >= 3) {
    sub_100026ACC();
  }
  if (*(_DWORD *)(a1 + 16)) {
    sub_100026AA0();
  }
  if (*(_DWORD *)(a1 + 304)) {
    sub_100026A74();
  }
  if (*(unsigned char *)(a1 + 701)) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 1128);
  if (*(_DWORD *)(a1 + 20) == 201 && !*(unsigned char *)(a2 + 564) && !*(_DWORD *)(a2 + 680))
  {
    if (!*(unsigned char *)(a2 + 308)) {
      sub_100005EAC();
    }
    sub_100005EAC();
    return 0;
  }
  sub_100011880((const char *)(a1 + 308));
  v44[0] = 0;
  if ((*(_DWORD *)(a1 + 288) - 102) >= 3) {
    sub_100026A48();
  }
  if (*(_DWORD *)(a1 + 16)) {
    sub_100026A1C();
  }
  if (getifaddrs(v44) < 0)
  {
    uint64_t v3 = *__error();
    sub_100005EAC();
  }
  else
  {
    char v5 = sub_1000121A0(*(_DWORD *)(a1 + 684));
    unsigned int v6 = *(_DWORD *)(a1 + 680);
    unsigned int v7 = bswap32(v6);
    BOOL v8 = HIBYTE(v7) == 10 || v7 >> 20 == 2753;
    unsigned int v9 = HIWORD(v7);
    char v11 = v8 || v9 == 49320;
    int v12 = *(_DWORD *)(a1 + 692);
    BOOL v13 = 1;
    if (!v12) {
      BOOL v13 = *(unsigned char *)(a1 + 688) != 0;
    }
    if (v44[0])
    {
      int v14 = *(_DWORD *)(a1 + 684);
      char v15 = v13 | v11 ^ 1;
      int v16 = (1 << (32 - v5)) + 1;
      int v17 = 255 << (32 - v5);
      unsigned int v18 = *(_DWORD *)(a1 + 680);
      uint64_t v3 = 49;
      while (1)
      {
        unsigned int v19 = v18 & v14;
        BOOL v20 = v44[0];
        while (1)
        {
          ifa_addr = v20->ifa_addr;
          if (ifa_addr->sa_family == 2)
          {
            int v22 = *(_DWORD *)&ifa_addr->sa_data[2];
            if (v22 == v18 || (*(_DWORD *)&v20->ifa_netmask->sa_data[2] & v22) == v19) {
              break;
            }
          }
          BOOL v20 = v20->ifa_next;
          if (!v20)
          {
            unsigned int v6 = v18;
            goto LABEL_35;
          }
        }
        if (v15) {
          break;
        }
        unsigned int v18 = bswap32(v16 + bswap32(v19));
        if ((bswap32((v18 ^ v6) & v14) & v17) == 0) {
          goto LABEL_40;
        }
      }
      uint64_t v3 = 48;
    }
    else
    {
LABEL_35:
      *(_DWORD *)(a1 + 680) = v6;
      if ((!v12 || !*(unsigned char *)(a1 + 688)) && (*(unsigned char *)(a1 + 584) & 2) != 0) {
        sub_100018488(*(_DWORD *)(a1 + 20), (const void *)(a1 + 680), (const void *)(a1 + 684));
      }
      uint64_t v3 = 0;
    }
  }
LABEL_40:
  if (v44[0]) {
    freeifaddrs(v44[0]);
  }
  if (v3)
  {
    strerror(v3);
  }
  else
  {
    v23.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
    CFPropertyListRef v24 = inet_ntoa(v23);
    snprintf((char *)v44, 0x10uLL, "%s", v24);
    v25.in_addr_t s_addr = *(_DWORD *)(a1 + 684);
    CFArrayRef v26 = inet_ntoa(v25);
    snprintf(__str, 0x10uLL, "%s", v26);
    if (v4 != 502 && *(_DWORD *)(a1 + 20) == 201 && (uint64_t v27 = sub_100011760((const char *)(a1 + 308)), v27))
    {
      uint64_t v3 = v27;
    }
    else
    {
      CFTypeID v28 = (int *)(a1 + 680);
      CFIndex v29 = (int *)(a1 + 684);
      uint64_t v30 = sub_1000111F8((const char *)(a1 + 308), (_DWORD *)(a1 + 680), (_DWORD *)(a1 + 684), 0);
      if (v30)
      {
        uint64_t v3 = v30;
        strerror(v30);
      }
      else
      {
        sub_100005EAC();
        if (v4 == 502)
        {
LABEL_53:
          uint64_t v3 = 0;
          *(unsigned char *)(a1 + 701) = 1;
          return v3;
        }
        int v32 = 1;
        char v33 = 1;
        do
        {
          unsigned int v34 = if_nametoindex((const char *)(a1 + 308));
          if (v34)
          {
            if (!*v28) {
              goto LABEL_53;
            }
            __int16 v35 = v34;
            int v36 = socket(17, 3, 2);
            if (v36 < 0)
            {
              uint64_t v3 = *__error();
              sub_100005EAC();
            }
            else
            {
              int v37 = v36;
              int v38 = *v29 & *v28;
              uint64_t v39 = sub_100016150(v36, 1, v38, *v28, *v29, (char *)(a1 + 308), 0, *v28, 1);
              uint64_t v3 = v39;
              if (!v39 || v39 == 17)
              {
                sub_1000121C8(v38, *v29);
                sub_100005EAC();
                uint64_t v41 = sub_100016150(v37, 1, 0, *v28, 0, (char *)(a1 + 308), v35, *v28, 3);
                uint64_t v42 = v41;
                if (v41 && v41 != 17)
                {
                  strerror(v41);
                  sub_100005EAC();
                  uint64_t v3 = v42;
                }
                else
                {
                  sub_100005EAC();
                  uint64_t v3 = 0;
                  if (v42 && v42 != 17) {
                    sub_1000269F0();
                  }
                }
              }
              else
              {
                sub_1000121C8(v38, *v29);
                strerror(v3);
                sub_100005EAC();
              }
              close(v37);
            }
            if (!v3) {
              goto LABEL_53;
            }
          }
          else
          {
            sub_100005EAC();
            uint64_t v3 = 19;
          }
          sub_100015460(a1);
          if ((v33 & 1) == 0)
          {
            strerror(v3);
            sub_100005EAC();
            sleep(1u);
          }
          char v33 = 0;
          ++v32;
        }
        while (v32 != 4);
        strerror(v3);
      }
    }
  }
  sub_100005EAC();
  return v3;
}

uint64_t sub_100015C14(uint64_t a1, unsigned char *a2, int a3)
{
  if (byte_100039481) {
    goto LABEL_2;
  }
  if ((*(_DWORD *)(a1 + 288) - 102) >= 3) {
    sub_100026B50();
  }
  if (*(_DWORD *)(a1 + 16)) {
    sub_100026B24();
  }
  if (*(_DWORD *)(a1 + 304)) {
    sub_100026AF8();
  }
  if (a3) {
    goto LABEL_9;
  }
  if (!sub_100010C94((const char *)(a1 + 308)))
  {
    uint64_t v7 = sub_10001015C((unsigned char *)(a1 + 308));
    if (v7 || (uint64_t v7 = sub_10001064C((const char *)(a1 + 308)), v7))
    {
      uint64_t v4 = v7;
      strerror(v7);
      goto LABEL_22;
    }
    if (*(unsigned char *)(a1 + 688)
      && (*(_DWORD *)(a1 + 648) || *(_DWORD *)(a1 + 652) || *(_DWORD *)(a1 + 656) || *(_DWORD *)(a1 + 660)))
    {
      inet_ntop(30, (const void *)(a1 + 648), v9, 0x2Eu);
      long long v8 = xmmword_100029130;
      if (sub_10001135C((const char *)(a1 + 308), (_OWORD *)(a1 + 648), &v8, 0)) {
        goto LABEL_2;
      }
      sub_100005EAC();
    }
LABEL_9:
    if (*(_DWORD *)(a1 + 20) != 201) {
      return 0;
    }
    if (*(_DWORD *)(a1 + 1128) != 502)
    {
      if (a2[1107])
      {
        if (!a2[704]) {
          goto LABEL_13;
        }
      }
      else if (!a2[564] && !a2[1105])
      {
LABEL_13:
        if (!a2[308]) {
          sub_100005EAC();
        }
        goto LABEL_2;
      }
    }
    uint64_t v4 = sub_100011888((const char *)(a1 + 308));
    if (!v4) {
      return v4;
    }
LABEL_22:
    sub_100005EAC();
    return v4;
  }
  strerror(0);
LABEL_2:
  sub_100005EAC();
  return 0;
}

uint64_t sub_100015EC4(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 16))
  {
    sub_10000EBB0(a1, (const char *)(a1 + 28));
    unsigned int v2 = *(_DWORD *)(a1 + 296);
    if (v2)
    {
      if (v2 > 0x4FF) {
        goto LABEL_8;
      }
      unsigned int v2 = 1280;
    }
    else
    {
      unsigned int v2 = 1500;
    }
    *(_DWORD *)(a1 + 296) = v2;
LABEL_8:
    if (*(_DWORD *)(a1 + 288) != 104)
    {
      uint64_t result = sub_100011094((unsigned char *)(a1 + 308), v2);
      if (result) {
        return result;
      }
    }
    if (!*(_DWORD *)(a1 + 304) && *(_DWORD *)(a1 + 20) == 203)
    {
      uint64_t result = sub_10001A228();
      if (result) {
        return result;
      }
    }
    goto LABEL_13;
  }
  sub_10000EBB0(a1, "bcast-local");
  *(_DWORD *)(a1 + 296) = 1500;
LABEL_13:
  *(void *)(a1 + 592) = sub_100015FE0;
  *(void *)(a1 + 600) = sub_100014C2C;
  *(void *)(a1 + 632) = 0;
  if (!*(_DWORD *)(a1 + 16))
  {
    if (*(_DWORD *)(a1 + 288) == 104)
    {
      *(void *)(a1 + 616) = sub_100014F28;
      *(void *)(a1 + 624) = sub_100014FB0;
    }
    if (!*(_DWORD *)(a1 + 304) && *(_DWORD *)(a1 + 20) == 203) {
      sub_100014FF8(a1);
    }
  }
  return 0;
}

uint64_t sub_100015FE0(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if ((*(_DWORD *)(a2 + 288) - 105) <= 0xFFFFFFFD) {
    sub_100026B7C();
  }
  int v4 = *(_DWORD *)(a2 + 16);
  if (v4) {
    goto LABEL_3;
  }
  if (!*(unsigned char *)(a2 + 700))
  {
    *(unsigned char *)(a2 + 700) = 1;
    int v8 = *(_DWORD *)(a2 + 20);
    if (v8 != 204)
    {
      if (v8 == 203)
      {
        int v9 = HIDWORD(qword_1000394D4)++;
        if (v9 < 0) {
          sub_100026BA8();
        }
      }
      if (*(_DWORD *)(a2 + 680))
      {
        uint64_t v10 = sub_100015600(a2, (uint64_t)a3);
        if (v10)
        {
          uint64_t v5 = v10;
LABEL_17:
          sub_100005EAC();
          goto LABEL_8;
        }
      }
      uint64_t v11 = sub_100015C14(a2, a3, 0);
      if (v11)
      {
        uint64_t v5 = v11;
        goto LABEL_17;
      }
      int v4 = *(_DWORD *)(a2 + 16);
      if (v4)
      {
LABEL_3:
        *(_DWORD *)(a2 + 296) = 1500;
LABEL_4:
        if (v4 == 1) {
          sub_100005EAC();
        }
        goto LABEL_7;
      }
    }
    int v12 = sub_10000A8C4((unsigned char *)(a2 + 308));
    int v4 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 296) = v12;
    if (!v4)
    {
      if (*(_DWORD *)(a2 + 20) == 203)
      {
        uint64_t v5 = sub_10001A38C(a2, (uint64_t)a3);
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    goto LABEL_4;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  *(_DWORD *)(a2 + 12) = v5 == 0;
  return v5;
}

uint64_t sub_100016150(int a1, char a2, int a3, int a4, int a5, char *__s, __int16 a7, int a8, char a9)
{
  long long v25 = 0u;
  memset(v26, 0, 220);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  BYTE3(v1++*(_DWORD *)(result + 8) = a2;
  BYTE2(v1++*(_DWORD *)(result + 8) = 5;
  int v13 = dword_100038D48++;
  DWORD1(v19) = v13;
  if (a9 & 1 | a3) {
    unsigned int v14 = 2305;
  }
  else {
    unsigned int v14 = 2051;
  }
  *((void *)&v18 + 1) = v14 | 0x3700000000;
  if ((a9 & 2) != 0)
  {
    WORD2(v1++*(_DWORD *)(result + 8) = a7;
    v14 |= 0x1000000u;
    DWORD2(v1++*(_DWORD *)(result + 8) = v14;
  }
  WORD6(v23) = 528;
  LODWORD(v24) = a3;
  if ((v14 & 2) != 0)
  {
    WORD6(v24) = 528;
    LODWORD(v25) = a4;
    char v15 = (char *)&v25 + 12;
  }
  else
  {
    WORD6(v24) = 4628;
    BYTE1(v25) = strlen(__s);
    __memmove_chk();
    char v15 = (char *)v26;
  }
  *(_WORD *)char v15 = 528;
  *((_DWORD *)v15 + 1) = a5;
  *((_WORD *)v15 + ++*(_DWORD *)(result + 8) = 4628;
  unsigned __int8 v16 = strlen(__s);
  v15[21] = v16;
  memmove(v15 + 24, __s, v16);
  *((_WORD *)v15 + 1++*(_DWORD *)(result + 8) = 528;
  *((_DWORD *)v15 + 10) = a8;
  LOWORD(v1++*(_DWORD *)(result + 8) = (_WORD)v15 - ((unsigned __int16)&v23 + 12) + 144;
  if (write(a1, &v18, (int)(v15 - (&v23 + 12) + 144)) == -1) {
    return *__error();
  }
  else {
    return 0;
  }
}

uint64_t sub_100016324()
{
  byte_100038F48 = 1;
  int v0 = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.MobileInternetSharing", 0, 0);
  qword_100038F50 = (uint64_t)v0;
  if (!v0
    || !SCDynamicStoreSetDispatchQueue(v0, (dispatch_queue_t)qword_100039470)
    || !SCDynamicStoreSetDisconnectCallBack())
  {
    int v21 = SCError();
    SCErrorString(v21);
    sub_100005EAC();
    return 12;
  }
  CFURLRef v1 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (!v1) {
    return 2;
  }
  CFURLRef v2 = v1;
  int v70 = 0;
  CFStringRef v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  if (!v3)
  {
    uint64_t v22 = 12;
    goto LABEL_110;
  }
  CFStringRef v4 = v3;
  CFStringGetCString(v3, byte_100038F58, 1024, 0x600u);
  uint64_t v5 = getpwnam("mobile");
  if (!v5)
  {
    uint64_t v22 = 2;
    goto LABEL_109;
  }
  dword_100039358 = v5->pw_gid;
  if (qword_100039360) {
    free((void *)qword_100039360);
  }
  size_t v6 = strlen(byte_100038F58) + 59;
  uint64_t v7 = (char *)malloc_type_malloc(v6, 0x29EFF63DuLL);
  qword_100039360 = (uint64_t)v7;
  if (!v7)
  {
LABEL_98:
    uint64_t v22 = 12;
    goto LABEL_109;
  }
  snprintf(v7, v6, "%s%s", byte_100038F58, "/Library/Preferences/com.apple.MobileInternetSharing.plist");
  *(_OWORD *)&dword_10003936C = 0u;
  *(_OWORD *)&dword_10003937C = 0u;
  unk_10003938C = 0u;
  unk_10003939C = 0;
  dword_100039368[0] = 3;
  qword_100039370 = (uint64_t)vdup_n_s32(0x3FCu);
  dword_10003937C = 0;
  if (!qword_100039360) {
    sub_100026BD4();
  }
  int v71 = 0;
  size_t v8 = sub_10001200C((const char *)qword_100039360, &v71, 1);
  if (!v8)
  {
    sub_100005EAC();
    if (!v71) {
      sub_100026C00();
    }
    BOOL v25 = 0;
    int v26 = dword_100039368[0];
    goto LABEL_36;
  }
  int v9 = (const void *)v8;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(v9) != TypeID) {
    goto LABEL_29;
  }
  CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)v9, @"Version");
  if (!Value) {
    goto LABEL_29;
  }
  int v12 = Value;
  CFTypeID v13 = CFNumberGetTypeID();
  if (CFGetTypeID(v12) != v13) {
    goto LABEL_29;
  }
  unsigned int v14 = CFDictionaryGetValue((CFDictionaryRef)v9, @"State");
  if (!v14) {
    goto LABEL_29;
  }
  char v15 = v14;
  CFTypeID v16 = CFNumberGetTypeID();
  if (CFGetTypeID(v15) != v16
    || (int v17 = CFDictionaryGetValue((CFDictionaryRef)v9, @"UState")) == 0
    || (v18 = v17, v19 = v4, v20 = CFNumberGetTypeID(), v50 = CFGetTypeID(v18) == v20, CFStringRef v4 = v19, !v50))
  {
LABEL_29:
    sub_100005EAC();
    int v24 = 2;
LABEL_30:
    int v71 = v24;
    goto LABEL_31;
  }
  if (!CFNumberGetValue((CFNumberRef)v12, kCFNumberIntType, dword_100039368)
    || !CFNumberGetValue((CFNumberRef)v15, kCFNumberIntType, &qword_100039370)
    || !CFNumberGetValue((CFNumberRef)v18, kCFNumberIntType, &dword_10003936C))
  {
    sub_100005EAC();
    int v24 = 22;
    goto LABEL_30;
  }
  int v71 = sub_100019898(v9);
LABEL_31:
  CFRelease(v9);
  BOOL v25 = v71 == 0;
  int v26 = dword_100039368[0];
  if (!v71 && dword_100039368[0] == 3)
  {
    int v27 = qword_100039370;
    BOOL v25 = 1;
    goto LABEL_38;
  }
LABEL_36:
  int v27 = 1020;
  if (v26 != 3) {
    LODWORD(qword_100039370) = 1020;
  }
LABEL_38:
  if (dword_10003936C != 1023) {
    dword_10003936C = 1022;
  }
  CFTypeID v28 = SCPreferencesCreate(0, @"com.apple.MobileInternetSharing", @"com.apple.radios.plist");
  qword_1000393A8 = (uint64_t)v28;
  if (v28)
  {
    if (SCPreferencesSetCallback(v28, (SCPreferencesCallBack)sub_100016CAC, 0)
      && SCPreferencesSetDispatchQueue((SCPreferencesRef)qword_1000393A8, (dispatch_queue_t)qword_100039470))
    {
      sub_100016D0C();
    }
    else
    {
      int v29 = SCError();
      SCErrorString(v29);
      sub_100005EAC();
      CFRelease((CFTypeRef)qword_1000393A8);
      qword_1000393A8 = 0;
    }
  }
  else
  {
    int v30 = SCError();
    SCErrorString(v30);
    sub_100005EAC();
  }
  sub_100016DD4(0, 0, v27, 0, 0, &v70, 0);
  if (!v70)
  {
    if (qword_100039370 != v27 || !v25) {
      sub_1000172F0();
    }
    sub_1000173AC((const __SCDynamicStore *)qword_100038F50);
  }
  unsigned int v72 = 0;
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_1000393C0;
  if (!qword_1000393C0)
  {
    CFDictionaryRef v33 = (const __CFDictionary *)sub_10001200C("/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (int *)&v72, 0);
    if (v33)
    {
      CFDictionaryRef v34 = v33;
      qword_1000393C0 = (uint64_t)CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v33);
      CFRelease(v34);
      CFDictionaryRef Mutable = (const __CFDictionary *)qword_1000393C0;
    }
    else
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_1000393C0 = (uint64_t)Mutable;
    }
    if (!Mutable) {
      goto LABEL_97;
    }
  }
  __int16 v35 = (CFArrayRef *)&byte_100038F58[168];
  CFArrayRef v36 = (const __CFArray *)qword_1000393B0;
  if (!qword_1000393B0)
  {
    CFArrayRef v37 = (const __CFArray *)CFDictionaryGetValue(Mutable, @"MAC_ARRAY");
    CFArrayRef v36 = v37
        ? CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v37)
        : CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    qword_1000393B0 = (uint64_t)v36;
    if (!v36)
    {
LABEL_97:
      sub_100005EAC();
      goto LABEL_98;
    }
  }
  if (!qword_1000393B8)
  {
    CFArrayRef v38 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1000393C0, @"MAC_IOUE_ARRAY");
    if (v38) {
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v38);
    }
    else {
      CFMutableArrayRef MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    }
    qword_1000393B8 = (uint64_t)MutableCopy;
    if (MutableCopy)
    {
      CFArrayRef v36 = (const __CFArray *)qword_1000393B0;
      goto LABEL_70;
    }
    goto LABEL_97;
  }
LABEL_70:
  CFStringRef v68 = v4;
  CFURLRef v69 = v2;
  CFIndex Count = CFArrayGetCount(v36);
  if (Count >= 1)
  {
    CFIndex v41 = Count;
    CFIndex v42 = 0;
    char v43 = 0;
    while (1)
    {
      long long v44 = v35;
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v35[118], v42);
      if (ValueAtIndex)
      {
        CFDictionaryRef v46 = ValueAtIndex;
        CFTypeID v47 = CFDictionaryGetTypeID();
        if (CFGetTypeID(v46) == v47)
        {
          CFBooleanRef v48 = (CFBooleanRef)CFDictionaryGetValue(v46, @"MAC_USED");
          CFTypeID v49 = CFBooleanGetTypeID();
          if (!v48 || (CFGetTypeID(v48) == v49 ? (BOOL v50 = v48 == kCFBooleanFalse) : (BOOL v50 = 0), !v50))
          {
            long long v51 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v46);
            if (!v51)
            {
              sub_100005EAC();
              uint64_t v22 = 12;
              CFStringRef v4 = v68;
LABEL_106:
              CFURLRef v2 = v69;
              goto LABEL_109;
            }
            long long v52 = v51;
            CFDictionarySetValue(v51, @"MAC_USED", kCFBooleanFalse);
            CFArraySetValueAtIndex(v44[118], v42, v52);
            CFRelease(v52);
            char v43 = 1;
          }
        }
      }
      ++v42;
      __int16 v35 = v44;
      if (v41 == v42) {
        goto LABEL_84;
      }
    }
  }
  char v43 = 0;
LABEL_84:
  long long v53 = (const void **)&byte_100038F58[168];
  CFIndex v54 = CFArrayGetCount((CFArrayRef)qword_1000393B8);
  if (v54 < 1)
  {
    CFURLRef v2 = v69;
LABEL_100:
    if ((v43 & 1) == 0)
    {
      uint64_t v22 = 0;
      goto LABEL_108;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, @"MAC_ARRAY", (const void *)qword_1000393B0);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, @"MAC_IOUE_ARRAY", v53[119]);
    in6_addr v65 = (const void *)qword_1000393C0;
    uid_t v66 = geteuid();
    gid_t v67 = getgid();
    unsigned int v72 = sub_100011E68(v65, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v66, v67, 416, 0);
    CFStringRef v4 = v68;
    if (v72)
    {
      CFRelease((CFTypeRef)qword_1000393B0);
      CFRelease(v53[119]);
      CFRelease((CFTypeRef)qword_1000393C0);
      qword_1000393B0 = 0;
      v53[119] = 0;
      qword_1000393C0 = 0;
      sub_100005EAC();
      uint64_t v22 = v72;
    }
    else
    {
      uint64_t v22 = 0;
    }
    goto LABEL_106;
  }
  CFIndex v55 = v54;
  CFIndex v56 = 0;
  CFURLRef v2 = v69;
  while (1)
  {
    long long v57 = CFArrayGetValueAtIndex((CFArrayRef)v53[119], v56);
    if (!v57) {
      goto LABEL_95;
    }
    long long v58 = v57;
    CFTypeID v59 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v58) != v59) {
      goto LABEL_95;
    }
    CFBooleanRef v60 = (CFBooleanRef)CFDictionaryGetValue((CFDictionaryRef)v58, @"MAC_IOUE_USED");
    CFTypeID v61 = CFBooleanGetTypeID();
    if (v60)
    {
      if (CFGetTypeID(v60) == v61 && v60 == kCFBooleanFalse) {
        goto LABEL_95;
      }
    }
    uint64_t v63 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)v58);
    if (!v63) {
      break;
    }
    int v64 = v63;
    CFDictionarySetValue(v63, @"MAC_IOUE_USED", kCFBooleanFalse);
    CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000393B8, v56, v64);
    CFRelease(v64);
    char v43 = 1;
LABEL_95:
    ++v56;
    long long v53 = (const void **)(byte_100038F58 + 168);
    if (v55 == v56) {
      goto LABEL_100;
    }
  }
  sub_100005EAC();
  uint64_t v22 = 12;
LABEL_108:
  CFStringRef v4 = v68;
LABEL_109:
  CFRelease(v4);
LABEL_110:
  CFRelease(v2);
  return v22;
}

uint64_t sub_100016C68(const __SCDynamicStore *a1)
{
  sub_100005EAC();

  return sub_1000173AC(a1);
}

void sub_100016CAC(uint64_t a1, char a2)
{
  if ((a2 & 2) != 0 && qword_1000393A8)
  {
    sub_100016D0C();
    int v2 = qword_100039370;
    int v3 = dword_100039378;
    int v4 = dword_10003937C;
    sub_100016DD4(0, 0, v2, v3, v4, 0, 0);
  }
}

void sub_100016D0C()
{
  if (!qword_1000393A8) {
    sub_100026C2C();
  }
  CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue((SCPreferencesRef)qword_1000393A8, @"AirplaneMode");
  if (Value)
  {
    CFBooleanRef v1 = Value;
    CFTypeID v2 = CFGetTypeID(Value);
    if (v2 == CFBooleanGetTypeID())
    {
      int v3 = byte_1000393A0;
      int v4 = CFBooleanGetValue(v1);
      if (v3 != (v4 != 0))
      {
        byte_1000393A0 = v4 != 0;
        sub_100005EAC();
      }
    }
  }
  uint64_t v5 = (const __SCPreferences *)qword_1000393A8;

  SCPreferencesSynchronize(v5);
}

uint64_t sub_100016DD4(uint64_t a1, char a2, int a3, int a4, int a5, _DWORD *a6, int a7)
{
  __int16 v28 = 0;
  if (a6) {
    *a6 = 0;
  }
  if (byte_100039450)
  {
    __int16 v28 = 257;
LABEL_5:
    int v13 = 1;
    goto LABEL_8;
  }
  sub_100005EAC();
  if (!sub_100013D98(a1, (uint64_t)&v28 + 1, &v28)) {
    goto LABEL_5;
  }
  int v13 = 0;
LABEL_8:
  sub_100005EAC();
  char v26 = a2;
  if (!v13)
  {
    if (qword_100039370 == 1020)
    {
LABEL_18:
      byte_1000393A1 = HIBYTE(v28) ^ 1;
      int v15 = 45;
LABEL_19:
      sub_100005EAC();
      if (byte_100039450) {
        int v16 = 0;
      }
      else {
        int v16 = a1;
      }
      if ((v13 & v16) != 0) {
        int v17 = 1021;
      }
      else {
        int v17 = 1020;
      }
      LODWORD(qword_100039370) = v17;
      dword_100039378 = 0;
      sub_100005EAC();
      unsigned int v18 = qword_100039370;
      goto LABEL_26;
    }
LABEL_17:
    sub_100005EAC();
    LODWORD(qword_100039370) = 1020;
    goto LABEL_18;
  }
  if (a1 && qword_100039370 == 1021 && dword_100039378 != 2 && dword_100039378 != 4) {
    goto LABEL_17;
  }
  if (qword_100039370 == 1020)
  {
    if ((_BYTE)v28)
    {
      int v14 = dword_10003936C;
      int v15 = 45;
    }
    else
    {
      dword_100039378 = 3;
      int v15 = 80;
      int v14 = 1021;
    }
    LODWORD(qword_100039370) = v14;
    sub_100005EAC();
    unsigned int v18 = qword_100039370;
  }
  else
  {
    if (!(_BYTE)v28)
    {
      sub_100005EAC();
      LODWORD(qword_100039370) = 1021;
      dword_100039378 = 3;
      byte_1000393A1 = HIBYTE(v28) ^ 1;
      LODWORD(v20) = 80;
      unsigned int v18 = 1021;
      goto LABEL_31;
    }
    int v15 = 45;
    unsigned int v18 = qword_100039370;
  }
  byte_1000393A1 = HIBYTE(v28) ^ 1;
  if (v18 - 1024 <= 0xFFFFFFFC) {
    goto LABEL_19;
  }
LABEL_26:
  if (v18 >= 0x3FE)
  {
    int v19 = HIDWORD(qword_100039370);
    if (byte_1000393A0 | byte_1000393A1)
    {
      unsigned int v21 = HIDWORD(qword_100039370);
      if (HIDWORD(qword_100039370) == 1020)
      {
        HIDWORD(qword_100039370) = v18;
        unsigned int v21 = v18;
      }
      int v22 = 1022;
      LODWORD(qword_100039370) = 1022;
      dword_100039378 = 4;
    }
    else
    {
      if (HIDWORD(qword_100039370) >= 0x3FE)
      {
        LODWORD(qword_100039370) = HIDWORD(qword_100039370);
        *(uint64_t *)((char *)&qword_100039370 + 4) = 1020;
        goto LABEL_45;
      }
      int v22 = v18;
      unsigned int v21 = HIDWORD(qword_100039370);
    }
    if (v18 == v22 && v19 == v21)
    {
LABEL_46:
      if (v18 == 1023)
      {
        sub_100005EAC();
        LODWORD(v20) = 0;
      }
      else
      {
        BOOL v23 = v18 != 1022;
        if (dword_100039378 == 4) {
          BOOL v23 = 1;
        }
        if ((v26 & 4) == 0) {
          BOOL v23 = 1;
        }
        if (v23) {
          LODWORD(v20) = v15;
        }
        else {
          LODWORD(v20) = 0;
        }
        if (v18 == 1022 && v23)
        {
          sub_100005EAC();
          LODWORD(v20) = v15;
        }
      }
      goto LABEL_58;
    }
LABEL_45:
    sub_100005EAC();
    unsigned int v18 = qword_100039370;
    goto LABEL_46;
  }
  LODWORD(v20) = v15;
LABEL_31:
  if (v18 == 1021 && a1)
  {
    if (dword_100039378 == 3) {
      uint64_t v20 = 80;
    }
    else {
      uint64_t v20 = 36;
    }
    dword_100039378 = sub_1000197C0(v20);
  }
LABEL_58:
  if (a7 && qword_100039370 >= 0x3FE) {
    dword_10003936C = qword_100039370;
  }
  dword_10003937C = v20;
  if (v20 != a5 || qword_100039370 != a3 || dword_100039378 != a4)
  {
    if (qword_100039370 != a3) {
      sub_1000172F0();
    }
    sub_1000173AC((const __SCDynamicStore *)qword_100038F50);
    if (a6) {
      *a6 = 1;
    }
  }
  if (v20 == 45 || v20 == 0) {
    return v20;
  }
  else {
    return 45;
  }
}

void sub_1000172F0()
{
  if (!qword_100039360) {
    sub_100026C58();
  }
  int v0 = sub_100019A1C(1);
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = (const std::__fs::filesystem::path *)qword_100039360;
    uid_t v3 = geteuid();
    sub_100011E68(v1, v2, v3, dword_100039358, 384, 1);
    sub_100005EAC();
    CFRelease(v1);
  }
}

uint64_t sub_1000173AC(const __SCDynamicStore *a1)
{
  if (!a1) {
    sub_100026C84();
  }
  CFStringRef v2 = SCDynamicStoreKeyCreate(0, @"%@", @"com.apple.MobileInternetSharing");
  if (!v2) {
    return 12;
  }
  CFStringRef v3 = v2;
  int v4 = sub_100019A1C(0);
  if (v4)
  {
    uint64_t v5 = v4;
    CFNumberRef v34 = CFNumberCreate(0, kCFNumberIntType, &dword_100039378);
    CFDictionarySetValue(v5, @"Reason", v34);
    CFNumberRef v33 = CFNumberCreate(0, kCFNumberIntType, &dword_10003937C);
    CFDictionarySetValue(v5, @"Errnum", v33);
    CFDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    uint64_t v7 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    for (uint64_t i = qword_1000393C8; i; uint64_t i = *(void *)i)
    {
      CFStringRef v9 = CFStringCreateWithCString(0, (const char *)(i + 12), 0x600u);
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
      size_t count = xpc_array_get_count(*(xpc_object_t *)(i + 32));
      if (count)
      {
        size_t v11 = count;
        for (size_t j = 0; j != v11; ++j)
        {
          string = xpc_array_get_string(*(xpc_object_t *)(i + 32), j);
          CFStringRef v14 = CFStringCreateWithCString(0, string, 0x600u);
          CFArrayAppendValue(v7, v14);
          CFRelease(v14);
        }
      }
    }
    CFDictionarySetValue(v5, @"InternalInterfaces", v7);
    CFDictionarySetValue(v5, @"ExternalInterfaces", Mutable);
    int v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &dword_100039380);
    CFDictionarySetValue(v15, @"Max", v16);
    uint64_t v17 = 0;
    int v18 = 0;
    do
    {
      v18 += dword_100039368[v17 + 7];
      ++v17;
    }
    while (v17 != 7);
    int valuePtr = v18;
    CFNumberRef v19 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v15, @"Current", v19);
    CFStringRef v35 = v3;
    CFNumberRef v31 = v19;
    CFNumberRef cf = v16;
    if (!dword_100039380) {
      goto LABEL_15;
    }
    uint64_t v20 = 0;
    int v21 = 0;
    do
    {
      v21 += dword_100039368[v20 + 7];
      ++v20;
    }
    while (v20 != 7);
    if (v21 >= dword_100039380) {
      int v22 = (const void **)&kCFBooleanFalse;
    }
    else {
LABEL_15:
    }
      int v22 = (const void **)&kCFBooleanTrue;
    CFDictionarySetValue(v15, @"MoreAllowed", *v22);
    int v24 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v25 = -2;
    char v26 = (char *)&unk_100039384;
    do
    {
      if (v25 <= 4)
      {
        int v27 = (const void *)*((void *)&off_100034F10 + v25);
        CFNumberRef v28 = CFNumberCreate(0, kCFNumberIntType, v26);
        if (v28)
        {
          CFNumberRef v29 = v28;
          CFDictionarySetValue(v24, v27, v28);
          CFRelease(v29);
        }
      }
      ++v25;
      v26 += 4;
    }
    while (v25 != 5);
    CFDictionarySetValue(v15, @"Type", v24);
    CFDictionarySetValue(v5, @"Hosts", v15);
    if (v15) {
      CFRelease(v15);
    }
    CFStringRef v3 = v35;
    if (cf) {
      CFRelease(cf);
    }
    if (v31) {
      CFRelease(v31);
    }
    if (v24) {
      CFRelease(v24);
    }
    if (v34) {
      CFRelease(v34);
    }
    if (v33) {
      CFRelease(v33);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    uint64_t v23 = SCDynamicStoreSetValue(a1, v35, v5) == 0;
    sub_100005EAC();
    CFRelease(v5);
  }
  else
  {
    uint64_t v23 = 12;
  }
  CFRelease(v3);
  return v23;
}

void sub_1000177E8()
{
  if (byte_100038F48 == 1)
  {
    if (qword_100039360)
    {
      free((void *)qword_100039360);
      qword_100039360 = 0;
    }
    if (qword_1000393A8)
    {
      CFRelease((CFTypeRef)qword_1000393A8);
      qword_1000393A8 = 0;
    }
    if (qword_1000393B0)
    {
      CFRelease((CFTypeRef)qword_1000393B0);
      qword_1000393B0 = 0;
    }
    if (qword_1000393B8)
    {
      CFRelease((CFTypeRef)qword_1000393B8);
      qword_1000393B8 = 0;
    }
    if (qword_1000393C0)
    {
      CFRelease((CFTypeRef)qword_1000393C0);
      qword_1000393C0 = 0;
    }
    if (qword_100038F50)
    {
      SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)qword_100038F50, 0);
      CFRelease((CFTypeRef)qword_100038F50);
      qword_100038F50 = 0;
    }
    byte_100038F48 = 0;
  }
}

uint64_t sub_10001789C(uint64_t a1, char a2)
{
  return sub_100016DD4(a1, a2, qword_100039370, dword_100039378, dword_10003937C, 0, 0);
}

uint64_t sub_1000178B8()
{
  return sub_100016DD4(0, 0, qword_100039370, dword_100039378, dword_10003937C, 0, 0);
}

uint64_t sub_1000178DC(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = sub_100016DD4(0, 0, qword_100039370, dword_100039378, dword_10003937C, 0, 0);
  if (a1) {
    *a1 = qword_100039370;
  }
  if (a2) {
    *a2 = dword_100039378;
  }
  return result;
}

uint64_t sub_100017944(unsigned int a1)
{
  return 0;
}

uint64_t sub_100017968(unsigned int a1, int a2, int a3)
{
  int v5 = qword_100039370;
  int v6 = dword_100039378;
  int v7 = dword_10003937C;
  if (a2)
  {
    if (a3) {
      sub_100026CB0();
    }
    if (a1 != 1022) {
      sub_100026CDC();
    }
    if (dword_10003936C <= 0x3FE) {
      int v8 = 1022;
    }
    else {
      int v8 = dword_10003936C;
    }
    dword_100039378 = 0;
    dword_10003937C = 0;
    if (byte_1000393A0 | byte_1000393A1) {
      dword_100039378 = 4;
    }
  }
  else if (qword_100039370 < 0x3FE && byte_100039450 == 0 && a1 > 0x3FD)
  {
    int v8 = 1020;
  }
  else
  {
    int v8 = a1;
  }
  sub_100005EAC();
  LODWORD(qword_100039370) = v8;
  if (a2) {
    int v11 = v6;
  }
  else {
    int v11 = dword_100039378;
  }
  if (a2) {
    int v12 = v7;
  }
  else {
    int v12 = dword_10003937C;
  }

  return sub_100016DD4(0, 0, v5, v11, v12, 0, a3);
}

uint64_t sub_100017B20(unsigned int a1)
{
  return 0;
}

void sub_100017B44()
{
  if (qword_100039370 == 1023)
  {
    sub_100017968(0x3FEu, 0, 0);
    sub_100017968(0x3FFu, 0, 0);
  }
}

uint64_t sub_100017B9C()
{
  return 0;
}

uint64_t sub_100017BC4(_DWORD *a1)
{
  uint64_t result = 0;
  *a1 = 0;
  if (qword_100039370 <= 0x3FD)
  {
    if (qword_100039370 == 1020)
    {
      uint64_t result = 0;
      *a1 = 45;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_100017C00(uint64_t a1)
{
  int v1 = a1;
  int v2 = sub_1000197C0(a1);
  int v3 = 4;
  if (v2 != 4)
  {
    if (byte_1000393A0 | byte_1000393A1) {
      int v3 = 4;
    }
    else {
      int v3 = v2;
    }
  }
  sub_100005EAC();
  if (v3 != dword_100039378 || dword_10003937C != v1)
  {
    dword_100039378 = v3;
    dword_10003937C = v1;
    sub_1000173AC((const __SCDynamicStore *)qword_100038F50);
  }
  return 0;
}

uint64_t sub_100017D20(char *__s1, const char *a2)
{
  int v4 = &qword_1000393C8;
  while (1)
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if (!strcmp(__s1, (const char *)v4 + 12)) {
      goto LABEL_8;
    }
  }
  int v5 = (uint64_t *)malloc_type_malloc(0x28uLL, 0x10A00403AAC9C39uLL);
  if (!v5) {
    return 12;
  }
  int v4 = v5;
  v5[4] = 0;
  *(_OWORD *)int v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  xpc_object_t v6 = xpc_array_create(0, 0);
  v4[4] = (uint64_t)v6;
  if (!v6)
  {
    free(v4);
    return 12;
  }
  snprintf((char *)v4 + 12, 0x10uLL, "%s", __s1);
LABEL_8:
  size_t count = xpc_array_get_count((xpc_object_t)v4[4]);
  if (count)
  {
    size_t v8 = count;
    size_t v9 = 0;
    while (1)
    {
      string = xpc_array_get_string((xpc_object_t)v4[4], v9);
      if (!strcmp(string, a2)) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_12;
      }
    }
    sub_100005EAC();
    return 22;
  }
  else
  {
LABEL_12:
    xpc_array_set_string((xpc_object_t)v4[4], 0xFFFFFFFFFFFFFFFFLL, a2);
    int v11 = *((_DWORD *)v4 + 2);
    *((_DWORD *)v4 + 2) = v11 + 1;
    if (!v11)
    {
      uint64_t *v4 = qword_1000393C8;
      qword_1000393C8 = (uint64_t)v4;
    }
    int v12 = (const __SCDynamicStore *)qword_100038F50;
    return sub_1000173AC(v12);
  }
}

uint64_t sub_100017E9C(char *__s1, const char *a2)
{
  int v4 = &qword_1000393C8;
  int v5 = &qword_1000393C8;
  do
  {
    int v5 = (uint64_t *)*v5;
    if (!v5)
    {
      sub_100005EAC();
      return 0;
    }
  }
  while (strcmp(__s1, (const char *)v5 + 12));
  xpc_object_t v6 = (void *)v5[4];
  xpc_object_t v7 = xpc_array_create(0, 0);
  size_t count = xpc_array_get_count(v6);
  if (count)
  {
    size_t v9 = count;
    size_t v10 = 0;
    char v11 = 0;
    size_t v19 = count - 1;
LABEL_6:
    size_t v12 = v10;
    do
    {
      string = xpc_array_get_string(v6, v12);
      if (!strcmp(string, a2))
      {
        size_t v10 = v12 + 1;
        char v11 = 1;
        if (v19 != v12) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
      xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, string);
      ++v12;
    }
    while (v9 != v12);
    if ((v11 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_14:
    xpc_release(v6);
    v5[4] = (uint64_t)v7;
    sub_100005EAC();
    int v15 = *((_DWORD *)v5 + 2);
    if (!v15) {
      sub_100026D08();
    }
    int v16 = v15 - 1;
    *((_DWORD *)v5 + 2) = v16;
    if (!v16)
    {
      for (uint64_t i = (uint64_t *)qword_1000393C8; i != v5; uint64_t i = (uint64_t *)*i)
        int v4 = i;
      uint64_t *v4 = *v5;
      xpc_release((xpc_object_t)v5[4]);
      free(v5);
    }
    int v18 = (const __SCDynamicStore *)qword_100038F50;
    return sub_1000173AC(v18);
  }
  else
  {
LABEL_19:
    xpc_release(v7);
    sub_100005EAC();
    return 22;
  }
}

uint64_t sub_100018078(__int16 a1, __int16 a2)
{
  if (dword_100039460) {
    BOOL v2 = dword_100039464 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = (unsigned __int16)word_10003946A;
    int v5 = (unsigned __int16)word_100039468;
    word_100039468 = a1;
    word_10003946A = a2;
    sub_10001CCE8();
    if (v5 != (unsigned __int16)word_100039468 || v4 != (unsigned __int16)word_10003946A)
    {
      sub_1000172F0();
      sub_1000173AC((const __SCDynamicStore *)qword_100038F50);
    }
  }
  return v3;
}

_WORD *sub_100018118(_WORD *result, _WORD *a2)
{
  if (result) {
    *uint64_t result = word_100039468;
  }
  if (a2) {
    *a2 = word_10003946A;
  }
  return result;
}

uint64_t sub_100018144(uint64_t result)
{
  if ((result & 0x80000000) != 0) {
    sub_100026D34();
  }
  int v1 = dword_100039380;
  dword_100039380 = result;
  if (v1 != result)
  {
    BOOL v2 = (const __SCDynamicStore *)qword_100038F50;
    return sub_1000173AC(v2);
  }
  return result;
}

uint64_t sub_100018194()
{
  return dword_100039380;
}

uint64_t sub_1000181A0(int a1, int a2)
{
  if ((a1 - 7) <= 0xFFFFFFFA) {
    sub_100026D60();
  }
  if (!a2) {
    sub_100026D8C();
  }
  BOOL v2 = &dword_100039368[a1];
  int v4 = v2[7];
  uint64_t v3 = v2 + 7;
  int v5 = v4 + a2;
  if (!(v4 + a2)) {
    sub_100026DB8();
  }
  *uint64_t v3 = v5;
  xpc_object_t v6 = (const __SCDynamicStore *)qword_100038F50;

  return sub_1000173AC(v6);
}

uint64_t sub_100018204(int a1, unsigned int a2)
{
  if ((a1 - 7) <= 0xFFFFFFFA) {
    sub_100026DE4();
  }
  BOOL v2 = &dword_100039368[a1];
  int v5 = v2[7];
  uint64_t v3 = (unsigned int *)(v2 + 7);
  unsigned int v4 = v5;
  if (v5)
  {
    BOOL v6 = v4 >= a2;
    unsigned int v7 = v4 - a2;
    if (!v6) {
      unsigned int v7 = 0;
    }
    *uint64_t v3 = v7;
    sub_1000173AC((const __SCDynamicStore *)qword_100038F50);
  }
  return 0;
}

uint64_t sub_100018258()
{
  uint64_t v0 = 0;
  LODWORD(result) = 0;
  do
  {
    uint64_t result = (dword_100039368[v0 + 7] + result);
    ++v0;
  }
  while (v0 != 7);
  return result;
}

BOOL sub_100018284()
{
  if (!dword_100039380) {
    return 1;
  }
  uint64_t v0 = 0;
  int v1 = 0;
  do
  {
    v1 += dword_100039368[v0 + 7];
    ++v0;
  }
  while (v0 != 7);
  return v1 < dword_100039380;
}

uint64_t sub_1000182CC(char *a1)
{
  BOOL v2 = off_100038CB0[0];
  uint64_t v3 = &qword_1000393C8;
  do
  {
    uint64_t v3 = (uint64_t *)*v3;
    if (!v3) {
      return 6;
    }
  }
  while (!strncmp((const char *)v3 + 12, v2, 0x10uLL));
  if (!if_nametoindex((const char *)v3 + 12)) {
    sub_100026E10();
  }
  snprintf(a1, 0x10uLL, "%s", (const char *)v3 + 12);
  return 0;
}

uint64_t sub_100018364(int a1, void *a2, void *a3)
{
  if (!a2 || !a3) {
    sub_100026E3C();
  }
  if (!qword_1000393C0) {
    sub_100026E68();
  }
  if (a1 == 201) {
    CFStringRef v5 = @"Shared_Net_Address";
  }
  else {
    CFStringRef v5 = @"Host_Net_Address";
  }
  if (a1 == 201) {
    CFStringRef v6 = @"Shared_Net_Mask";
  }
  else {
    CFStringRef v6 = @"Host_Net_Mask";
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_1000393C0, v5);
  CFStringRef v8 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_1000393C0, v6);
  uint64_t result = 19;
  if (Value)
  {
    if (v8)
    {
      CFStringGetCString(Value, buffer, 16, 0x600u);
      CFStringGetCString(v8, v10, 16, 0x600u);
      inet_pton(2, buffer, a2);
      inet_pton(2, v10, a3);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100018488(int a1, const void *a2, const void *a3)
{
  if (!a2 || !a3) {
    sub_100026E94();
  }
  if (!qword_1000393C0) {
    sub_100026EC0();
  }
  inet_ntop(2, a2, cStr, 0x10u);
  inet_ntop(2, a3, v16, 0x10u);
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x600u);
  CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, v16, 0x600u);
  CFStringRef v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (a1 == 201) {
      CFStringRef v11 = @"Shared_Net_Address";
    }
    else {
      CFStringRef v11 = @"Host_Net_Address";
    }
    if (a1 == 201) {
      CFStringRef v12 = @"Shared_Net_Mask";
    }
    else {
      CFStringRef v12 = @"Host_Net_Mask";
    }
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, v11, v5);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, v12, v7);
    int v13 = (const void *)qword_1000393C0;
    uid_t v14 = geteuid();
    gid_t v15 = getgid();
    uint64_t v9 = sub_100011E68(v13, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v14, v15, 416, 0);
    if (v9) {
      sub_100005EAC();
    }
LABEL_21:
    CFRelease(v5);
    if (!v7) {
      return v9;
    }
    goto LABEL_11;
  }
  sub_100005EAC();
  uint64_t v9 = 12;
  if (v5) {
    goto LABEL_21;
  }
  if (v7) {
LABEL_11:
  }
    CFRelease(v7);
  return v9;
}

uint64_t sub_100018630(uint64_t a1)
{
  if (!qword_1000393C0) {
    sub_100026EEC();
  }
  if (!qword_1000393B8) {
    sub_100026F18();
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000393B8);
  if (Count < 1) {
    return 22;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B8, v4);
    if (ValueAtIndex)
    {
      CFDictionaryRef v6 = ValueAtIndex;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v6) == TypeID)
      {
        CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v6, @"MAC_IOUE");
        if (Value)
        {
          CFDataRef v9 = Value;
          CFTypeID v10 = CFDataGetTypeID();
          if (CFGetTypeID(v9) == v10)
          {
            BytePtr = CFDataGetBytePtr(v9);
            if (BytePtr)
            {
              if (*(_DWORD *)BytePtr == *(_DWORD *)a1
                && *((unsigned __int16 *)BytePtr + 2) == *(unsigned __int16 *)(a1 + 4))
              {
                break;
              }
            }
          }
        }
      }
    }
    if (v3 == ++v4) {
      return 22;
    }
  }
  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v6);
  if (!MutableCopy)
  {
    uint64_t v13 = 12;
LABEL_21:
    sub_100005EAC();
    return v13;
  }
  int v16 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"MAC_IOUE_USED", kCFBooleanFalse);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000393B8, v4, v16);
  CFRelease(v16);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, @"MAC_IOUE_ARRAY", (const void *)qword_1000393B8);
  uint64_t v17 = (const void *)qword_1000393C0;
  LODWORD(v16) = geteuid();
  gid_t v18 = getgid();
  uint64_t v13 = sub_100011E68(v17, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (uid_t)v16, v18, 416, 0);
  if (v13) {
    goto LABEL_21;
  }
  return v13;
}

uint64_t sub_100018800(uint64_t a1)
{
  if (!qword_1000393C0) {
    sub_100026F44();
  }
  if (!qword_1000393B8) {
    sub_100026F70();
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000393B8);
  if (Count < 1)
  {
LABEL_18:
    sub_100018AFC((unsigned __int16 *)bytes, 0);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      gid_t v15 = Mutable;
      CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, bytes, 6);
      if (v16)
      {
        CFDataRef v17 = v16;
        CFDictionarySetValue(v15, @"MAC_IOUE", v16);
        CFRelease(v17);
        *(_DWORD *)a1 = *(_DWORD *)bytes;
        *(_WORD *)(a1 + 4) = v28;
        CFDictionarySetValue(v15, @"MAC_IOUE_USED", kCFBooleanTrue);
        CFArrayAppendValue((CFMutableArrayRef)qword_1000393B8, v15);
        gid_t v18 = v15;
        goto LABEL_21;
      }
      sub_100005EAC();
      CFRelease(v15);
      return 12;
    }
LABEL_23:
    sub_100005EAC();
    return 12;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B8, v4);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == TypeID)
      {
        CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue(ValueAtIndex, @"MAC_IOUE_USED");
        CFTypeID v8 = CFBooleanGetTypeID();
        if (Value)
        {
          if (CFGetTypeID(Value) == v8 && Value != kCFBooleanTrue)
          {
            CFDataRef v10 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"MAC_IOUE");
            CFTypeID v11 = CFDataGetTypeID();
            if (v10)
            {
              if (CFGetTypeID(v10) == v11)
              {
                BytePtr = CFDataGetBytePtr(v10);
                if (BytePtr)
                {
                  uint64_t v13 = (uint64_t)BytePtr;
                  if (CFDataGetLength(v10) == 6 && !sub_1000114D0(v13)) {
                    break;
                  }
                }
              }
            }
          }
        }
      }
    }
    if (v3 == ++v4) {
      goto LABEL_18;
    }
  }
  int v24 = *(_DWORD *)v13;
  *(_WORD *)(a1 + 4) = *(_WORD *)(v13 + 4);
  *(_DWORD *)a1 = v24;
  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, ValueAtIndex);
  if (!MutableCopy) {
    goto LABEL_23;
  }
  char v26 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"MAC_IOUE_USED", kCFBooleanTrue);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000393B8, v4, v26);
  gid_t v18 = v26;
LABEL_21:
  CFRelease(v18);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, @"MAC_IOUE_ARRAY", (const void *)qword_1000393B8);
  size_t v19 = (const void *)qword_1000393C0;
  uid_t v20 = geteuid();
  gid_t v21 = getgid();
  uint64_t v22 = sub_100011E68(v19, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v20, v21, 416, 0);
  if (v22) {
    sub_100005EAC();
  }
  return v22;
}

uint64_t sub_100018AFC(unsigned __int16 *a1, const void *a2)
{
  if (!qword_1000393B0) {
    sub_100026F9C();
  }
  unsigned __int8 Count = CFArrayGetCount((CFArrayRef)qword_1000393B0);
  if (!qword_1000393B8) {
    sub_100026FC8();
  }
  unsigned __int8 v5 = CFArrayGetCount((CFArrayRef)qword_1000393B8);
  int v6 = Count;
  int v24 = Count;
  int v25 = v5;
  uint64_t v7 = Count;
  uint64_t v8 = v5;
  do
  {
    if (a2)
    {
      CC_MD5(a2, 0x10u, md);
      *(_DWORD *)a1 = *(_DWORD *)md;
      a1[2] = v27;
      goto LABEL_7;
    }
    while (1)
    {
      while (1)
      {
        arc4random_buf(a1, 6uLL);
LABEL_7:
        *(unsigned char *)a1 = *(unsigned char *)a1 & 0xFC | 2;
        if (!sub_1000114D0((uint64_t)a1)) {
          break;
        }
        if (a2) {
          return 22;
        }
      }
      LODWORD(v9) = 0;
      if (v6)
      {
        CFIndex v9 = 0;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B0, v9);
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (ValueAtIndex)
          {
            if (CFGetTypeID(ValueAtIndex) == TypeID)
            {
              CFDataRef Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"MAC_ADDRESS");
              CFTypeID v13 = CFDataGetTypeID();
              if (Value)
              {
                if (CFGetTypeID(Value) == v13)
                {
                  BytePtr = CFDataGetBytePtr(Value);
                  if (BytePtr)
                  {
                    if (*(_DWORD *)a1 == *(_DWORD *)BytePtr && a1[2] == *((unsigned __int16 *)BytePtr + 2)) {
                      break;
                    }
                  }
                }
              }
            }
          }
          if (v7 == ++v9) {
            goto LABEL_25;
          }
        }
        int v6 = v24;
      }
      if (v9 == v6) {
        break;
      }
      int v6 = v24;
      if (a2) {
        return 22;
      }
    }
LABEL_25:
    if (v25)
    {
      CFIndex v16 = 0;
      while (1)
      {
        CFDictionaryRef v17 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B8, v16);
        CFTypeID v18 = CFDictionaryGetTypeID();
        if (v17)
        {
          if (CFGetTypeID(v17) == v18)
          {
            CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(v17, @"MAC_IOUE");
            CFTypeID v20 = CFDataGetTypeID();
            if (v19)
            {
              if (CFGetTypeID(v19) == v20)
              {
                gid_t v21 = CFDataGetBytePtr(v19);
                if (v21)
                {
                  if (*(_DWORD *)a1 == *(_DWORD *)v21 && a1[2] == *((unsigned __int16 *)v21 + 2)) {
                    break;
                  }
                }
              }
            }
          }
        }
        if (v8 == ++v16) {
          return 0;
        }
      }
    }
    else
    {
      LODWORD(v16) = 0;
    }
    int v6 = v24;
  }
  while (!a2 && v16 != v25);
  if (v16 == v25) {
    return 0;
  }
  return 22;
}

uint64_t sub_100018D9C(uint64_t a1)
{
  if (!qword_1000393C0) {
    sub_100026FF4();
  }
  if (!qword_1000393B0) {
    sub_100027020();
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000393B0);
  if (Count < 1) {
    return 22;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B0, v4);
    if (ValueAtIndex)
    {
      CFDictionaryRef v6 = ValueAtIndex;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v6) == TypeID)
      {
        CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v6, @"MAC_ADDRESS");
        if (Value)
        {
          CFDataRef v9 = Value;
          CFTypeID v10 = CFDataGetTypeID();
          if (CFGetTypeID(v9) == v10)
          {
            BytePtr = CFDataGetBytePtr(v9);
            if (BytePtr)
            {
              if (*(_DWORD *)BytePtr == *(_DWORD *)a1
                && *((unsigned __int16 *)BytePtr + 2) == *(unsigned __int16 *)(a1 + 4))
              {
                break;
              }
            }
          }
        }
      }
    }
    if (v3 == ++v4) {
      return 22;
    }
  }
  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v6);
  if (!MutableCopy)
  {
    uint64_t v13 = 12;
LABEL_21:
    sub_100005EAC();
    return v13;
  }
  CFIndex v16 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"MAC_USED", kCFBooleanFalse);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000393B0, v4, v16);
  CFRelease(v16);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, @"MAC_ARRAY", (const void *)qword_1000393B0);
  CFDictionaryRef v17 = (const void *)qword_1000393C0;
  LODWORD(v16) = geteuid();
  gid_t v18 = getgid();
  uint64_t v13 = sub_100011E68(v17, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (uid_t)v16, v18, 416, 0);
  if (v13) {
    goto LABEL_21;
  }
  return v13;
}

uint64_t sub_100018F6C(const unsigned __int8 *a1, void *a2)
{
  memset(uu, 0, sizeof(uu));
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000393B0);
  uint64_t v5 = Count;
  if (a1 && Count)
  {
    uuid_unparse(a1, out);
    CFAllocatorRef v6 = kCFAllocatorDefault;
    CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
    if (v7)
    {
      CFStringRef v8 = v7;
      if (v5 < 1) {
        goto LABEL_16;
      }
      gid_t v67 = (unsigned __int8 *)a1;
      CFIndex v9 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B0, v9);
        if (ValueAtIndex)
        {
          CFDictionaryRef v11 = ValueAtIndex;
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (CFGetTypeID(v11) == TypeID)
          {
            CFDataRef Value = CFDictionaryGetValue(v11, @"UUID_MAC");
            if (Value)
            {
              uid_t v14 = Value;
              CFTypeID v15 = CFStringGetTypeID();
              if (CFGetTypeID(v14) == v15)
              {
                if (CFEqual(v14, v8)) {
                  break;
                }
              }
            }
          }
        }
        if (v5 == ++v9)
        {
          a1 = v67;
          goto LABEL_16;
        }
      }
      CFBooleanRef v46 = (CFBooleanRef)CFDictionaryGetValue(v11, @"MAC_USED");
      CFTypeID v47 = CFBooleanGetTypeID();
      if (v46)
      {
        CFBooleanRef v48 = kCFBooleanTrue;
        if (CFGetTypeID(v46) == v47 && v46 == kCFBooleanTrue) {
          goto LABEL_87;
        }
      }
      else
      {
        CFBooleanRef v48 = kCFBooleanTrue;
      }
      CFIndex v54 = CFDictionaryGetValue(v11, @"MAC_ADDRESS");
      if (!v54 || (CFIndex v55 = v54, v56 = CFDataGetTypeID(), CFGetTypeID(v55) != v56))
      {
LABEL_87:
        sub_100005EAC();
        CFMutableArrayRef MutableCopy = 0;
        uint64_t v18 = 22;
        goto LABEL_84;
      }
      CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v11);
      if (MutableCopy)
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        CFDateRef v58 = CFDateCreate(kCFAllocatorDefault, Current);
        if (v58)
        {
          CFDateRef v59 = v58;
          CFDictionarySetValue(MutableCopy, @"MAC_TIME_USED", v58);
          CFDictionarySetValue(MutableCopy, @"MAC_USED", v48);
          CFRelease(v59);
          CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000393B0, v9, MutableCopy);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, @"MAC_ARRAY", (const void *)qword_1000393B0);
          CFBooleanRef v60 = (const void *)qword_1000393C0;
          uid_t v61 = geteuid();
          gid_t v62 = getgid();
          uint64_t v63 = sub_100011E68(v60, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v61, v62, 416, 0);
          if (!v63)
          {
            uint64_t v18 = sub_1000196D4(a2, (CFDataRef)v55, v67);
            goto LABEL_84;
          }
          uint64_t v18 = v63;
          goto LABEL_71;
        }
      }
LABEL_83:
      sub_100005EAC();
      uint64_t v18 = 12;
      goto LABEL_84;
    }
LABEL_34:
    sub_100005EAC();
    return 12;
  }
  if (!a1)
  {
    uuid_generate(uu);
    uuid_unparse(uu, out);
    CFAllocatorRef v6 = kCFAllocatorDefault;
    CFStringRef v19 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
    if (v19)
    {
      CFStringRef v8 = v19;
      while (1)
      {
        if (v5 < 1)
        {
          CFIndex v20 = 0;
        }
        else
        {
          CFIndex v20 = 0;
          while (1)
          {
            CFDictionaryRef v21 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B0, v20);
            if (v21)
            {
              CFDictionaryRef v22 = v21;
              CFTypeID v23 = CFDictionaryGetTypeID();
              if (CFGetTypeID(v22) == v23)
              {
                int v24 = CFDictionaryGetValue(v22, @"UUID_MAC");
                if (v24)
                {
                  int v25 = v24;
                  CFTypeID v26 = CFStringGetTypeID();
                  if (CFGetTypeID(v25) == v26)
                  {
                    if (CFEqual(v25, v8)) {
                      break;
                    }
                  }
                }
              }
            }
            if (v5 == ++v20) {
              goto LABEL_32;
            }
          }
        }
        if (v5 == v20)
        {
LABEL_32:
          if (!sub_100018AFC((unsigned __int16 *)bytes, uu))
          {
            int v27 = 1;
            a1 = 0;
            goto LABEL_37;
          }
        }
        CFRelease(v8);
        uuid_generate(uu);
        uuid_unparse(uu, out);
        CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
        if (!v8) {
          goto LABEL_34;
        }
      }
    }
    goto LABEL_34;
  }
  uuid_unparse(a1, out);
  CFAllocatorRef v6 = kCFAllocatorDefault;
  CFStringRef v16 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
  if (!v16) {
    goto LABEL_34;
  }
  CFStringRef v8 = v16;
LABEL_16:
  if (sub_100018AFC((unsigned __int16 *)bytes, a1))
  {
    sub_100005EAC();
    CFMutableArrayRef MutableCopy = 0;
    uint64_t v18 = 22;
    goto LABEL_84;
  }
  int v27 = 0;
LABEL_37:
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableArrayRef MutableCopy = Mutable;
  if (!Mutable) {
    goto LABEL_83;
  }
  CFDictionarySetValue(Mutable, @"UUID_MAC", v8);
  CFDataRef v29 = CFDataCreate(v6, bytes, 6);
  if (!v29) {
    goto LABEL_83;
  }
  CFDataRef v30 = v29;
  CFDictionarySetValue(MutableCopy, @"MAC_ADDRESS", v29);
  CFRelease(v30);
  CFAbsoluteTime v31 = CFAbsoluteTimeGetCurrent();
  CFDateRef v32 = CFDateCreate(v6, v31);
  if (!v32) {
    goto LABEL_83;
  }
  CFDateRef v33 = v32;
  CFDictionarySetValue(MutableCopy, @"MAC_TIME_USED", v32);
  CFRelease(v33);
  CFDictionarySetValue(MutableCopy, @"MAC_USED", kCFBooleanTrue);
  if (v5 < 138)
  {
    CFArrayAppendValue((CFMutableArrayRef)qword_1000393B0, MutableCopy);
    goto LABEL_70;
  }
  int v65 = v27;
  CFStringRef v68 = a1;
  uid_t v66 = a2;
  CFIndex v34 = 0;
  CFIndex v35 = 0;
  CFDateRef v36 = 0;
  while (1)
  {
    CFDictionaryRef v37 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000393B0, v34);
    if (v37)
    {
      CFDictionaryRef v38 = v37;
      CFTypeID v39 = CFDictionaryGetTypeID();
      if (CFGetTypeID(v38) == v39)
      {
        CFBooleanRef v40 = (CFBooleanRef)CFDictionaryGetValue(v38, @"MAC_USED");
        CFTypeID v41 = CFBooleanGetTypeID();
        if (!v40) {
          break;
        }
        if (CFGetTypeID(v40) != v41 || v40 != kCFBooleanTrue) {
          break;
        }
      }
    }
LABEL_56:
    if (v5 == ++v34)
    {
      CFIndex v34 = v5;
      goto LABEL_66;
    }
  }
  CFDateRef v43 = (const __CFDate *)CFDictionaryGetValue(v38, @"MAC_TIME_USED");
  if (v43)
  {
    CFDateRef v44 = v43;
    CFTypeID v45 = CFDateGetTypeID();
    if (CFGetTypeID(v44) == v45)
    {
      if (v36)
      {
        if (CFDateCompare(v36, v44, 0) == kCFCompareGreaterThan)
        {
          CFDateRef v36 = v44;
          CFIndex v35 = v34;
        }
      }
      else
      {
        CFDateRef v36 = v44;
        CFIndex v35 = v34;
      }
      goto LABEL_56;
    }
  }
  CFIndex v35 = v34;
LABEL_66:
  a2 = v66;
  if (!v36 && v5 == v34)
  {
    sub_100005EAC();
    uint64_t v18 = 19;
    goto LABEL_84;
  }
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000393B0, v35, MutableCopy);
  a1 = v68;
  int v27 = v65;
LABEL_70:
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000393C0, @"MAC_ARRAY", (const void *)qword_1000393B0);
  CFTypeID v49 = (const void *)qword_1000393C0;
  uid_t v50 = geteuid();
  gid_t v51 = getgid();
  uint64_t v18 = sub_100011E68(v49, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v50, v51, 416, 0);
  if (v18)
  {
LABEL_71:
    sub_100005EAC();
    goto LABEL_84;
  }
  CFDataRef v52 = (const __CFData *)CFDictionaryGetValue(MutableCopy, @"MAC_ADDRESS");
  if (v27) {
    long long v53 = uu;
  }
  else {
    long long v53 = (unsigned __int8 *)a1;
  }
  sub_1000196D4(a2, v52, v53);
LABEL_84:
  CFRelease(v8);
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v18;
}

uint64_t sub_1000196D4(void *a1, CFDataRef theData, _OWORD *a3)
{
  BytePtr = CFDataGetBytePtr(theData);
  if (BytePtr)
  {
    snprintf(__str, 0x14uLL, "%02x:%02x:%02x:%02x:%02x:%02x", *BytePtr, BytePtr[1], BytePtr[2], BytePtr[3], BytePtr[4], BytePtr[5]);
    xpc_dictionary_set_string(a1, off_100038BB0[0], __str);
    *(_OWORD *)uuid = *a3;
    xpc_dictionary_set_uuid(a1, off_100038BA8[0], uuid);
    return 0;
  }
  else
  {
    sub_100005EAC();
    return 12;
  }
}

uint64_t sub_1000197C0(uint64_t result)
{
  if ((int)result > 35)
  {
    switch(result)
    {
      case '$':
        return 2;
      case 'P':
        return 3;
      case '-':
        return 1;
    }
    goto LABEL_14;
  }
  if (!result) {
    return result;
  }
  if (result == 4) {
    return 5;
  }
  if (result != 19)
  {
LABEL_14:
    sub_100005EAC();
    return 6;
  }
  return 4;
}

const void *sub_100019854(const void *a1)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0;
}

uint64_t sub_100019898(const void *a1)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 22;
  }
  CFDataRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"ForwardedPorts");
  uint64_t result = 0;
  if (!Value || dword_100039464) {
    return result;
  }
  CFTypeID v5 = CFArrayGetTypeID();
  if (CFGetTypeID(Value) != v5) {
    return 22;
  }
  if (CFArrayGetCount((CFArrayRef)Value) < 1) {
    return 22;
  }
  CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, 0);
  if (!ValueAtIndex) {
    return 22;
  }
  CFStringRef v7 = ValueAtIndex;
  CFTypeID v8 = CFDictionaryGetTypeID();
  if (CFGetTypeID(v7) != v8) {
    return 22;
  }
  CFIndex v9 = CFDictionaryGetValue((CFDictionaryRef)v7, @"Low");
  CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v7, @"High");
  if (!v9) {
    return 22;
  }
  CFNumberRef v11 = v10;
  CFTypeID v12 = CFNumberGetTypeID();
  CFTypeID v13 = CFGetTypeID(v9);
  uint64_t result = 22;
  if (v13 == v12 && v11)
  {
    if (sub_100019854(v11))
    {
      int valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)v9, kCFNumberShortType, (char *)&valuePtr + 2))
      {
        if (CFNumberGetValue(v11, kCFNumberShortType, &valuePtr))
        {
          word_100039468 = HIWORD(valuePtr);
          word_10003946A = valuePtr;
          sub_10001CCE8();
          return 0;
        }
      }
    }
    return 22;
  }
  return result;
}

__CFDictionary *sub_100019A1C(int a1)
{
  int v14 = 3;
  int valuePtr = 1020;
  if ((qword_100039370 & 0xFFFFFFFC) == 0x3FC) {
    int valuePtr = qword_100039370;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if (a1 && byte_1000393A0 | byte_1000393A1) {
      int valuePtr = HIDWORD(qword_100039370);
    }
    CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFDictionarySetValue(Mutable, @"State", v3);
      CFRelease(v4);
    }
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &dword_10003936C);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionarySetValue(Mutable, @"UState", v5);
      CFRelease(v6);
    }
    CFNumberRef v7 = CFNumberCreate(0, kCFNumberIntType, &v14);
    if (v7)
    {
      CFNumberRef v8 = v7;
      CFDictionarySetValue(Mutable, @"Version", v7);
      CFRelease(v8);
    }
    if (!dword_100039464)
    {
      if ((unsigned __int16)word_100039468 | (unsigned __int16)word_10003946A)
      {
        CFMutableArrayRef v9 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        if (v9)
        {
          CFNumberRef v10 = v9;
          CFNumberRef v11 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (v11)
          {
            CFTypeID v12 = v11;
            sub_100011E00(v11, @"Low", word_100039468);
            sub_100011E00(v12, @"High", word_10003946A);
            CFArrayAppendValue(v10, v12);
            CFRelease(v12);
            CFDictionarySetValue(Mutable, @"ForwardedPorts", v10);
          }
          CFRelease(v10);
        }
      }
    }
  }
  return Mutable;
}

uint64_t sub_100019C2C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 288) != 101) {
    sub_100027078();
  }
  if (*(_DWORD *)(a1 + 16)) {
    sub_10002704C();
  }
  *(void *)(a1 + 592) = sub_100019C84;
  *(void *)(a1 + 60sub_100017968(0x3FEu, 1, 0) = sub_100019CDC;
  *(void *)(a1 + 632) = 0;
  return 0;
}

uint64_t sub_100019C84(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 288) != 101) {
    sub_1000270A4();
  }
  sub_100005EAC();
  *(_DWORD *)(a2 + 12) = 1;
  return 0;
}

double sub_100019CDC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 288) != 101) {
    sub_1000270D0();
  }
  *(void *)(a1 + 632) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 592) = 0u;
  return result;
}

uint64_t sub_100019D10()
{
  if (!dword_100038D38) {
    return 0;
  }
  int v29 = 0;
  CFStringRef v0 = CFStringCreateWithCString(kCFAllocatorDefault, "com.apple.MobileInternetSharing", 0x600u);
  if (v0)
  {
    CFStringRef v1 = v0;
    CFDictionaryRef v2 = (const __CFDictionary *)sub_10001200C("/Library/Preferences/SystemConfiguration/bootpd.plist", &v29, 0);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v2 && CFGetTypeID(v2) == TypeID)
    {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v2);
      CFDictionaryRef v5 = MutableCopy;
      if (MutableCopy)
      {
        CFMutableArrayRef v6 = sub_10001AF28(MutableCopy, @"Subnets");
        if (v6)
        {
          CFArrayRef v7 = v6;
          CFArrayRef v8 = sub_10001AF28(v5, @"dhcp_enabled");
          CFArrayRef v9 = sub_10001AF28(v5, @"ignore_allow_deny");
          CFArrayRef v10 = sub_10001AF28(v5, @"detect_other_dhcp_server");
          CFArrayRef v11 = sub_10001AF28(v5, @"ipv6_only_preferred");
          CFIndex Count = CFArrayGetCount(v7);
          if (Count >= 1)
          {
            CFIndex v13 = Count;
            char v25 = 0;
            CFArrayRef v27 = v9;
            CFArrayRef v28 = v8;
            CFArrayRef v26 = v10;
            while (2)
            {
              CFIndex v14 = 0;
              while (1)
              {
                CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v7, v14);
                CFTypeID v16 = CFDictionaryGetTypeID();
                if (ValueAtIndex)
                {
                  if (CFGetTypeID(ValueAtIndex) == v16)
                  {
                    CFDataRef Value = CFDictionaryGetValue(ValueAtIndex, @"_creator");
                    CFTypeID v18 = CFStringGetTypeID();
                    if (Value)
                    {
                      if (CFGetTypeID(Value) == v18 && CFEqual(Value, v1)) {
                        break;
                      }
                    }
                  }
                }
                if (v13 == ++v14)
                {
                  CFArrayRef v9 = v27;
                  CFArrayRef v8 = v28;
                  CFArrayRef v10 = v26;
                  if ((v25 & 1) == 0) {
                    goto LABEL_38;
                  }
                  goto LABEL_37;
                }
              }
              CFStringRef v19 = CFDictionaryGetValue(ValueAtIndex, @"interface");
              CFTypeID v20 = CFStringGetTypeID();
              if (v19 && CFGetTypeID(v19) == v20)
              {
                CFArrayRef v8 = v28;
                sub_10001AFB8(v28, v19);
                CFArrayRef v9 = v27;
                sub_10001AFB8(v27, v19);
                sub_10001AFB8(v26, v19);
                sub_10001AFB8(v11, v19);
                CFIndex v21 = v14;
                CFArrayRef v10 = v26;
                CFArrayRemoveValueAtIndex(v7, v21);
                CFIndex v13 = CFArrayGetCount(v7);
                char v25 = 1;
                if (v13 > 0) {
                  continue;
                }
LABEL_37:
                sub_10001B050(v5, @"Subnets", v7, 1);
                sub_10001B050(v5, @"dhcp_enabled", v8, 0);
                sub_10001B050(v5, @"ignore_allow_deny", v9, 1);
                sub_10001B050(v5, @"detect_other_dhcp_server", v10, 0);
                sub_10001B050(v5, @"ipv6_only_preferred", v11, 1);
                uid_t v23 = geteuid();
                gid_t v24 = getgid();
                int v29 = sub_100011E68(v5, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/bootpd.plist", v23, v24, 420, 0);
                sub_10001ACDC();
                goto LABEL_38;
              }
              break;
            }
            unlink("/Library/Preferences/SystemConfiguration/bootpd.plist");
            CFArrayRef v9 = v27;
            CFArrayRef v8 = v28;
            CFArrayRef v10 = v26;
          }
LABEL_38:
          CFRelease(v1);
          if (v10) {
            CFRelease(v10);
          }
          if (v9) {
            CFRelease(v9);
          }
          CFRelease(v7);
          if (!v8) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
      }
      else
      {
        sub_100005EAC();
      }
    }
    else
    {
      sub_100005EAC();
      CFDictionaryRef v5 = 0;
    }
    CFArrayRef v11 = 0;
    CFArrayRef v8 = (const __CFArray *)v1;
LABEL_23:
    CFRelease(v8);
LABEL_24:
    if (v5) {
      CFRelease(v5);
    }
    if (v2) {
      CFRelease(v2);
    }
    if (v11) {
      CFRelease(v11);
    }
    goto LABEL_31;
  }
  sub_100005EAC();
LABEL_31:
  if (sub_10001A11C()) {
    sub_10001237C();
  }
  byte_1000393D0 = 1;
  return 0;
}

uint64_t sub_10001A11C()
{
  int v11 = 0;
  CFDictionaryRef v0 = (const __CFDictionary *)sub_10001200C("/Library/Preferences/SystemConfiguration/bootpd.plist", &v11, 0);
  if (!v0) {
    return 1;
  }
  CFDictionaryRef v1 = v0;
  CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue(v0, @"bootp_enabled");
  if (Value) {
    BOOL v3 = Value == kCFBooleanFalse;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3
    && ((CFBooleanRef v4 = (const __CFBoolean *)CFDictionaryGetValue(v1, @"dhcp_enabled")) == 0 || v4 == kCFBooleanFalse)
    && ((CFBooleanRef v5 = (const __CFBoolean *)CFDictionaryGetValue(v1, @"netboot_enabled")) == 0 || v5 == kCFBooleanFalse)
    && ((CFBooleanRef v6 = (const __CFBoolean *)CFDictionaryGetValue(v1, @"old_netboot_enabled")) == 0
     || v6 == kCFBooleanFalse))
  {
    CFBooleanRef v9 = (CFBooleanRef)CFDictionaryGetValue(v1, @"relay_enabled");
    if (v9) {
      BOOL v10 = v9 == kCFBooleanFalse;
    }
    else {
      BOOL v10 = 1;
    }
    uint64_t v7 = v10;
  }
  else
  {
    uint64_t v7 = 0;
  }
  CFRelease(v1);
  return v7;
}

void sub_10001A210()
{
  if (byte_1000393D0 == 1) {
    byte_1000393D0 = 0;
  }
}

uint64_t sub_10001A228()
{
  if (dword_1000393D4 < 0)
  {
    int v1 = -1;
    uint64_t v0 = 2;
    goto LABEL_5;
  }
  if (!dword_1000393D4)
  {
    if (!dword_100038D38) {
      return 0;
    }
    if (access("/usr/libexec/bootpd", 0))
    {
      uint64_t v0 = *__error();
      sub_100005EAC();
      if (!v0) {
        goto LABEL_3;
      }
    }
    else
    {
      if (dword_100038D4C == -1)
      {
        if (notify_register_dispatch(DHCPSDisabledInterfacesNotificationKey, &dword_100038D4C, (dispatch_queue_t)qword_100039470, &stru_100034FA8))
        {
          sub_100005EAC();
          sub_100005EAC();
          int v1 = -1;
          uint64_t v0 = 12;
          goto LABEL_5;
        }
      }
      else
      {
        sub_100005EAC();
      }
      uint64_t v3 = sub_10001237C();
      if (!v3) {
        goto LABEL_3;
      }
      uint64_t v0 = v3;
      sub_100005EAC();
    }
    int v1 = -1;
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v0 = 0;
  int v1 = dword_1000393D4 + 1;
LABEL_5:
  dword_1000393D4 = v1;
  return v0;
}

uint64_t sub_10001A38C(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    sub_1000270FC();
  }
  if (dword_1000393D4 < 0 || !dword_100038D38)
  {
    sub_100005EAC();
    return 19;
  }
  if (!qword_1000394D4) {
    goto LABEL_5;
  }
  int v6 = 3600;
  int __errnum = 12;
  *(_DWORD *)int valuePtr = 3600;
  uint64_t v7 = SCPreferencesCreate(0, @"com.apple.MobileInternetSharing", @"com.apple.InternetSharing.default.plist");
  if (v7)
  {
    CFArrayRef v8 = v7;
    CFDictionaryRef v9 = (const __CFDictionary *)SCPreferencesGetValue(v7, @"bootpd");
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v9)
    {
      if (CFGetTypeID(v9) == TypeID)
      {
        CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v9, @"DHCPLeaseTimeSecs");
        CFTypeID v12 = CFNumberGetTypeID();
        if (v11)
        {
          if (CFGetTypeID(v11) == v12) {
            CFNumberGetValue(v11, kCFNumberIntType, valuePtr);
          }
        }
      }
    }
    CFRelease(v8);
    int v6 = *(_DWORD *)valuePtr;
  }
  if (*(unsigned char *)(a1 + 700) && *(unsigned char *)(a1 + 701))
  {
    if ((*(_DWORD *)(a1 + 20) | 2) != 0xCB) {
      sub_100027128();
    }
    int v13 = *(_DWORD *)(a1 + 1128);
    int v14 = *(_DWORD *)(a2 + 1264);
    CFDictionaryRef v15 = (const __CFDictionary *)sub_10001200C("/Library/Preferences/SystemConfiguration/bootpd.plist", &__errnum, 0);
    CFTypeID v16 = CFDictionaryGetTypeID();
    if (v15 && CFGetTypeID(v15) == v16) {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v15);
    }
    else {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFDictionaryRef v18 = MutableCopy;
    if (!MutableCopy)
    {
      sub_100005EAC();
      CFArrayRef v20 = 0;
      goto LABEL_80;
    }
    if (v13 == 502) {
      CFMutableArrayRef v19 = 0;
    }
    else {
      CFMutableArrayRef v19 = sub_10001AF28(MutableCopy, @"Subnets");
    }
    CFArrayRef value = sub_10001AF28(v18, @"dhcp_enabled");
    CFArrayRef cf = sub_10001AF28(v18, @"ignore_allow_deny");
    CFArrayRef v72 = sub_10001AF28(v18, @"detect_other_dhcp_server");
    CFArrayRef v20 = sub_10001AF28(v18, @"ipv6_only_preferred");
    if ((*(unsigned char *)(a1 + 584) & 2) != 0 && *(_DWORD *)(a1 + 20) == 201)
    {
      CFDictionarySetValue(v18, @"use_server_config_for_dhcp_options", kCFBooleanTrue);
      CFBooleanRef v21 = kCFBooleanFalse;
    }
    else
    {
      CFBooleanRef v21 = kCFBooleanFalse;
      CFDictionarySetValue(v18, @"use_server_config_for_dhcp_options", kCFBooleanFalse);
    }
    CFDictionaryRemoveValue(v18, @"dhcp_ignore_client_identifier");
    CFDictionarySetValue(v18, @"bootp_enabled", v21);
    sub_100011CF4(value, (const char *)(a1 + 308));
    sub_100011CF4(cf, (const char *)(a1 + 308));
    BOOL v22 = v13 == 502 || v14 == 1;
    int v23 = v22;
    if (v22)
    {
      if (!byte_100039482) {
        sub_100011CF4(v20, (const char *)(a1 + 308));
      }
      sub_100005EAC();
      BOOL v22 = v13 == 502;
      CFArrayRef v24 = v72;
      if (v22) {
        goto LABEL_65;
      }
    }
    else
    {
      CFArrayRef v24 = v72;
      sub_100011CF4(v72, (const char *)(a1 + 308));
      sub_100005EAC();
    }
    int v71 = v23;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
LABEL_71:
      if (v24) {
        CFRelease(v24);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (v19) {
        CFRelease(v19);
      }
      if (value) {
        CFRelease(value);
      }
      CFRelease(v18);
LABEL_80:
      if (v15) {
        CFRelease(v15);
      }
      if (v20) {
        CFRelease(v20);
      }
      uint64_t v2 = __errnum;
      if (__errnum)
      {
        strerror(__errnum);
        sub_100005EAC();
        return v2;
      }
      goto LABEL_86;
    }
    CFArrayRef v26 = Mutable;
    CFArrayRef v27 = sub_1000121C8(*(_DWORD *)(a1 + 680), *(_DWORD *)(a1 + 684));
    sub_100011D88(v26, @"name", v27);
    in_addr_t v28 = *(_DWORD *)(a1 + 684) & *(_DWORD *)(a1 + 680);
    v29.in_addr_t s_addr = v28;
    CFDataRef v30 = inet_ntoa(v29);
    sub_100011D88(v26, @"net_address", v30);
    v31.in_addr_t s_addr = v28;
    inet_ntoa(v31);
    sub_100005EAC();
    v32.in_addr_t s_addr = *(_DWORD *)(a1 + 684);
    CFDateRef v33 = inet_ntoa(v32);
    sub_100011D88(v26, @"net_mask", v33);
    v34.in_addr_t s_addr = *(_DWORD *)(a1 + 684);
    inet_ntoa(v34);
    sub_100005EAC();
    if (*(_DWORD *)(a1 + 20) == 201)
    {
      v35.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
      CFDateRef v36 = inet_ntoa(v35);
      sub_100011D88(v26, @"dhcp_router", v36);
      v37.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
      inet_ntoa(v37);
      sub_100005EAC();
      if (*(_DWORD *)(a1 + 20) == 201)
      {
        CFMutableArrayRef v38 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        if (!v38) {
          goto LABEL_55;
        }
        CFArrayRef v39 = v38;
        v40.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
        CFTypeID v41 = inet_ntoa(v40);
        sub_100011CF4(v39, v41);
        v42.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
        inet_ntoa(v42);
        sub_100005EAC();
        CFDictionarySetValue(v26, @"dhcp_domain_name_server", v39);
        CFRelease(v39);
      }
    }
    sub_100011D88(v26, @"_creator", "com.apple.MobileInternetSharing");
    CFDictionarySetValue(v26, @"allocate", kCFBooleanTrue);
    sub_10000EF20(v26, @"lease_min", v6);
    sub_10000EF20(v26, @"lease_max", v6);
    sub_100005EAC();
    CFMutableArrayRef v43 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if (v43)
    {
      CFMutableArrayRef v44 = v43;
      unsigned int v45 = *(_DWORD *)(a1 + 680);
      unsigned int v46 = *(_DWORD *)(a1 + 684);
      unsigned int v47 = v46 & v45;
      unsigned int v48 = *(_DWORD *)(a1 + 692);
      theArray = v19;
      if (v48 && v47 != v48)
      {
        if (v45 != v48) {
          sub_100027180();
        }
        unsigned int v50 = bswap32(v48) + 1;
      }
      else
      {
        unsigned int v49 = bswap32(v47);
        if (bswap32(v45) != v49 + 1) {
          sub_100027154();
        }
        unsigned int v50 = v49 + 2;
      }
      int v51 = 1 << -(char)sub_1000121A0(v46);
      int v52 = *(_DWORD *)(a1 + 680);
      unsigned int v53 = *(_DWORD *)(a1 + 684);
      unsigned int v54 = v53 & v52;
      unsigned int v55 = *(_DWORD *)(a1 + 696);
      if (!v55 || v51 + bswap32(v54) - 1 == bswap32(v55))
      {
        if (v51 < 4)
        {
          sub_1000121C8(v52, v53);
          sub_100005EAC();
          CFRelease(v44);
          CFRelease(v26);
          int __errnum = 49;
          CFMutableArrayRef v19 = theArray;
          goto LABEL_62;
        }
        unsigned int v55 = bswap32(v51 + bswap32(v54) - 2);
      }
      in_addr_t v56 = bswap32(v50);
      v57.in_addr_t s_addr = v56;
      CFDateRef v58 = inet_ntoa(v57);
      sub_100011CF4(v44, v58);
      v59.in_addr_t s_addr = v56;
      inet_ntoa(v59);
      sub_100005EAC();
      v60.in_addr_t s_addr = v55;
      uid_t v61 = inet_ntoa(v60);
      sub_100011CF4(v44, v61);
      v62.in_addr_t s_addr = v55;
      inet_ntoa(v62);
      sub_100005EAC();
      CFDictionarySetValue(v26, @"net_range", v44);
      CFRelease(v44);
      sub_100011D88(v26, @"interface", (char *)(a1 + 308));
      CFMutableArrayRef v19 = theArray;
      CFArrayAppendValue(theArray, v26);
      CFRelease(v26);
      CFDictionarySetValue(v18, @"Subnets", theArray);
      CFArrayRef v24 = v72;
      int v23 = v71;
LABEL_65:
      CFDictionarySetValue(v18, @"dhcp_enabled", value);
      CFDictionarySetValue(v18, @"ignore_allow_deny", cf);
      if (v23)
      {
        if (!CFArrayGetCount(v20))
        {
LABEL_70:
          uid_t v66 = geteuid();
          gid_t v67 = getgid();
          int __errnum = sub_100011E68(v18, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/bootpd.plist", v66, v67, 420, 0);
          goto LABEL_71;
        }
        CFStringRef v63 = @"ipv6_only_preferred";
        int v64 = v18;
        CFArrayRef v65 = v20;
      }
      else
      {
        CFStringRef v63 = @"detect_other_dhcp_server";
        int v64 = v18;
        CFArrayRef v65 = v24;
      }
      CFDictionarySetValue(v64, v63, v65);
      goto LABEL_70;
    }
LABEL_55:
    CFRelease(v26);
LABEL_62:
    CFArrayRef v24 = v72;
    goto LABEL_71;
  }
LABEL_86:
  uint64_t v2 = sub_10001ACDC();
  if (v2) {
    return v2;
  }
  sub_1000121C8(*(_DWORD *)(a1 + 680), *(_DWORD *)(a1 + 684));
  sub_100005EAC();
  if (*(_DWORD *)(a1 + 20) != 201) {
    return 0;
  }
  v68.in_addr_t s_addr = *(_DWORD *)(a1 + 680);
  CFURLRef v69 = inet_ntoa(v68);
  snprintf(valuePtr, 0x10uLL, "%s", v69);
LABEL_5:
  sub_100005EAC();
  return 0;
}

uint64_t sub_10001ACDC()
{
  pid_t v0 = sub_10000FAC0("/usr/libexec/bootpd");
  if (!v0) {
    return 0;
  }
  uint64_t v1 = kill(v0, 1);
  if (v1)
  {
    uint64_t v2 = __error();
    strerror(*v2);
    sub_100005EAC();
  }
  return v1;
}

void sub_10001AD4C(uint64_t a1)
{
  if ((dword_1000393D4 & 0x80000000) == 0)
  {
    if (dword_1000393D4 >= 2 && qword_1000394D4)
    {
      sub_10001ADF4(a1);
    }
    else
    {
      sub_10001ADF4(a1);
      if (dword_100038D4C != -1)
      {
        notify_cancel(dword_100038D4C);
        dword_100038D4C = -1;
      }
      if (sub_10001A11C()) {
        sub_10001237C();
      }
    }
    if (dword_1000393D4 >= 1) {
      --dword_1000393D4;
    }
  }
}

void sub_10001ADF4(uint64_t a1)
{
  char v8 = 0;
  CFStringRef v1 = CFStringCreateWithCString(0, (const char *)(a1 + 308), 0x600u);
  if (v1)
  {
    CFStringRef v2 = v1;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (!Mutable)
    {
      sub_100005EAC();
      CFArrayRef v6 = (const __CFArray *)v2;
      goto LABEL_10;
    }
    CFArrayRef v4 = Mutable;
    CFArrayAppendValue(Mutable, v2);
    int v5 = sub_10001B1E4(v4, &v8);
    if (!v5)
    {
      if (!v8) {
        goto LABEL_5;
      }
      pid_t v7 = sub_10000FAC0("/usr/libexec/bootpd");
      if (!v7 || !kill(v7, 1)) {
        goto LABEL_5;
      }
      int v5 = *__error();
    }
    strerror(v5);
    sub_100005EAC();
LABEL_5:
    CFRelease(v2);
    CFArrayRef v6 = v4;
LABEL_10:
    CFRelease(v6);
    return;
  }

  sub_100005EAC();
}

CFMutableArrayRef sub_10001AF28(const __CFDictionary *a1, const void *a2)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFArrayGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    return CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, Value);
  }
  else
  {
    return CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  }
}

CFArrayRef sub_10001AFB8(const __CFArray *result, const void *a2)
{
  if (result)
  {
    CFArrayRef v3 = result;
    CFIndex Count = CFArrayGetCount(result);
    v8.location = 0;
    v8.length = Count;
    FirstIndexOfCFArrayRef Value = CFArrayGetFirstIndexOfValue(v3, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0;
    }
    else
    {
      CFIndex v6 = FirstIndexOfValue;
      CFIndex v7 = Count - 1;
      do
      {
        CFArrayRemoveValueAtIndex(v3, v6);
        v9.location = 0;
        v9.length = v7;
        CFIndex v6 = CFArrayGetFirstIndexOfValue(v3, v9, a2);
        --v7;
      }
      while (v6 != -1);
      return (const __CFArray *)1;
    }
  }
  return result;
}

void sub_10001B050(__CFDictionary *a1, const void *a2, CFArrayRef theArray, int a4)
{
  if (!theArray) {
    return;
  }
  if (CFArrayGetCount(theArray))
  {
    CFRange v8 = a1;
    CFRange v9 = a2;
    CFBooleanRef v10 = theArray;
LABEL_10:
    CFDictionarySetValue(v8, v9, v10);
    return;
  }
  if (!a4)
  {
    CFBooleanRef v10 = kCFBooleanFalse;
    CFRange v8 = a1;
    CFRange v9 = a2;
    goto LABEL_10;
  }

  CFDictionaryRemoveValue(a1, a2);
}

void sub_10001B104(id a1, int a2)
{
  sub_100005EAC();
  if (dword_100038D4C == -1)
  {
    sub_100005EAC();
  }
  else
  {
    uint64_t v2 = DHCPSCopyDisabledInterfaces();
    if (v2)
    {
      CFArrayRef v3 = (const __CFArray *)v2;
      CFTypeID TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(v3) == TypeID)
      {
        if (CFArrayGetCount(v3))
        {
          char v5 = 0;
          sub_10001B1E4(v3, &v5);
          if (v5) {
            sub_10001ACDC();
          }
        }
      }
      CFRelease(v3);
    }
  }
}

uint64_t sub_10001B1E4(const __CFArray *a1, unsigned char *a2)
{
  unsigned int v35 = 0;
  CFIndex Count = CFArrayGetCount(a1);
  in_addr v34 = a2;
  *a2 = 0;
  CFArrayRef v4 = (const void *)sub_10001200C("/Library/Preferences/SystemConfiguration/bootpd.plist", (int *)&v35, 0);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v4) {
    return v35;
  }
  if (CFGetTypeID(v4) != TypeID)
  {
LABEL_41:
    CFRelease(v4);
    return v35;
  }
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)v4);
  if (!MutableCopy)
  {
    sub_100005EAC();
    goto LABEL_41;
  }
  CFDictionaryRef v7 = MutableCopy;
  CFTypeRef v30 = v4;
  CFArrayRef v8 = sub_10001AF28(MutableCopy, @"Subnets");
  CFArrayRef v9 = sub_10001AF28(v7, @"dhcp_enabled");
  CFArrayRef v10 = sub_10001AF28(v7, @"ignore_allow_deny");
  CFArrayRef v11 = sub_10001AF28(v7, @"detect_other_dhcp_server");
  CFArrayRef cf = v7;
  CFMutableArrayRef v12 = sub_10001AF28(v7, @"ipv6_only_preferred");
  CFArrayRef v4 = v12;
  CFIndex v13 = Count;
  if (Count >= 1)
  {
    CFIndex v14 = 0;
    CFArrayRef v31 = v11;
    CFArrayRef v32 = v12;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v14);
      CFTypeID v16 = CFStringGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v16)
      {
        CFArrayRef v17 = v10;
        CFArrayRef v18 = v9;
        *(void *)buffer = 0;
        uint64_t v37 = 0;
        CFStringGetCString(ValueAtIndex, buffer, 16, 0x600u);
        sub_100005EAC();
        if (v8)
        {
          CFIndex v19 = CFArrayGetCount(v8);
          if (v19 >= 1)
          {
            CFIndex v20 = v19;
            CFIndex v21 = 0;
            while (1)
            {
              CFDictionaryRef v22 = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v21);
              CFTypeID v23 = CFDictionaryGetTypeID();
              if (v22)
              {
                if (CFGetTypeID(v22) == v23)
                {
                  CFArrayRef Value = CFDictionaryGetValue(v22, @"interface");
                  CFTypeID v25 = CFStringGetTypeID();
                  if (Value)
                  {
                    if (CFGetTypeID(Value) == v25 && CFEqual(ValueAtIndex, Value)) {
                      break;
                    }
                  }
                }
              }
              if (v20 == ++v21) {
                goto LABEL_17;
              }
            }
            CFArrayRemoveValueAtIndex(v8, v21);
            *in_addr v34 = 1;
          }
        }
LABEL_17:
        CFArrayRef v9 = v18;
        if (sub_10001AFB8(v18, ValueAtIndex)) {
          *in_addr v34 = 1;
        }
        CFArrayRef v10 = v17;
        CFArrayRef v4 = v32;
        if (sub_10001AFB8(v17, ValueAtIndex)) {
          *in_addr v34 = 1;
        }
        CFArrayRef v11 = v31;
        CFIndex v13 = Count;
        if (sub_10001AFB8(v31, ValueAtIndex)) {
          *in_addr v34 = 1;
        }
        if (sub_10001AFB8(v32, ValueAtIndex)) {
          *in_addr v34 = 1;
        }
      }
      ++v14;
    }
    while (v14 != v13);
  }
  if (*v34)
  {
    sub_10001B050(cf, @"Subnets", v8, 1);
    sub_10001B050(cf, @"dhcp_enabled", v9, 0);
    sub_10001B050(cf, @"ignore_allow_deny", v10, 1);
    sub_10001B050(cf, @"detect_other_dhcp_server", v11, 0);
    sub_10001B050(cf, @"ipv6_only_preferred", (CFArrayRef)v4, 1);
    uid_t v26 = geteuid();
    gid_t v27 = getgid();
    unsigned int v35 = sub_100011E68(cf, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/bootpd.plist", v26, v27, 420, 0);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  CFRelease(cf);
  CFRelease(v30);
  if (v4) {
    goto LABEL_41;
  }
  return v35;
}

void sub_10001B5FC()
{
  CFArrayRef v3 = 0;
  int v13 = 0;
  long long v12 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)char __dst = 0u;
  *(_OWORD *)__n = 0u;
  if (getifaddrs(&v3))
  {
    __error();
    sub_100005EAC();
  }
  else
  {
    int v0 = socket(2, 2, 0);
    if (v0 < 0)
    {
      __error();
      sub_100005EAC();
    }
    else
    {
      int v1 = v0;
      for (uint64_t i = v3; i; uint64_t i = i->ifa_next)
      {
        if (strnstr(i->ifa_name, "bridge", 0x10uLL))
        {
          int v13 = 0;
          long long v12 = 0u;
          long long v10 = 0u;
          long long v11 = 0u;
          long long v8 = 0u;
          long long v9 = 0u;
          long long v6 = 0u;
          long long v7 = 0u;
          *(_OWORD *)char __dst = 0u;
          *(_OWORD *)__n = 0u;
          strncpy(__dst, i->ifa_name, 0x10uLL);
          if (ioctl(v1, 0xC0946990uLL, __dst) != -1
            && LODWORD(__n[0])
            && !strncmp((const char *)__n + 4, "com.apple.MobileInternetSharing", LODWORD(__n[0]))
            && sub_10001BC10(i->ifa_name))
          {
            sub_100005EAC();
          }
        }
      }
      close(v1);
    }
    freeifaddrs(v3);
  }
  byte_1000393D8 = 1;
}

void sub_10001B7C4()
{
  if (byte_1000393D8 == 1) {
    byte_1000393D8 = 0;
  }
}

uint64_t sub_10001B7DC(char *__s1, int a2, int a3, uint64_t a4, char *a5, int a6)
{
  if (!__s1) {
    sub_1000271AC();
  }
  if (!*__s1) {
    sub_1000271D8();
  }
  long long v11 = &qword_1000393E0;
  while (1)
  {
    long long v11 = (uint64_t *)*v11;
    if (!v11) {
      break;
    }
    if (!strncmp(__s1, (const char *)v11 + 8, 0x10uLL)) {
      return 0;
    }
  }
  if (if_nametoindex(__s1))
  {
    uint64_t v12 = sub_10001BC10(__s1);
    if (v12) {
      goto LABEL_37;
    }
  }
  *(_OWORD *)char __dst = 0u;
  *(_OWORD *)CFDictionaryRef v22 = 0u;
  int v13 = socket(2, 2, 0);
  if ((v13 & 0x80000000) == 0)
  {
    *(_OWORD *)char __dst = 0u;
    *(_OWORD *)CFDictionaryRef v22 = 0u;
    if ((unint64_t)__strlcpy_chk() > 0xF || ioctl(v13, 0xC020697AuLL, __dst) < 0)
    {
      uint64_t v12 = *__error();
      sub_100005EAC();
    }
    else
    {
      uint64_t v12 = 0;
    }
LABEL_18:
    close(v13);
    if (!v12) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
  uint64_t v12 = *__error();
  sub_100005EAC();
  if (v13 != -1) {
    goto LABEL_18;
  }
  if (!v12)
  {
LABEL_19:
    memset(v22, 0, sizeof(v22));
    *(_OWORD *)char __dst = 0u;
    int v14 = socket(2, 2, 0);
    if (v14 < 0)
    {
      uint64_t v12 = *__error();
      sub_100005EAC();
      if (v14 == -1)
      {
LABEL_26:
        if ((v12 & 0x80000000) == 0)
        {
          CFDictionaryRef v15 = (char *)malloc_type_malloc(0x30uLL, 0x10A00409936FB06uLL);
          if (v15)
          {
            CFTypeID v16 = v15;
            *((_OWORD *)v15 + 1) = 0u;
            *((_OWORD *)v15 + 2) = 0u;
            *(_OWORD *)CFDictionaryRef v15 = 0u;
            snprintf(v15 + 8, 0x10uLL, "%s", __s1);
            *((_DWORD *)v16 + 1sub_100017968(0x3FEu, 1, 0) = 1;
            *((_DWORD *)v16 + 6) = a2;
            *((_DWORD *)v16 + 7) = a3;
            xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
            *((void *)v16 + 4) = v17;
            if (v17)
            {
              *(void *)CFTypeID v16 = qword_1000393E0;
              qword_1000393E0 = (uint64_t)v16;
              if (__CFADD__(dword_1000393E8++, 1)) {
                sub_100027204();
              }
              if (a2 != 204)
              {
                sub_10000FD60((uint64_t)__s1, 1);
                if (!v12) {
                  return v12;
                }
                goto LABEL_37;
              }
              uint64_t v19 = sub_10001C0A4(a5, __s1, 0, 1, 0, a6);
              uint64_t v12 = v19;
              if (!v19)
              {
                sub_100005EAC();
                sub_10000FD60((uint64_t)__s1, 1);
                return v12;
              }
              strerror(v19);
              goto LABEL_33;
            }
            sub_100005EAC();
            free(v16);
          }
          sub_10001232C(a2);
          sub_100012354(a3);
          sub_100005EAC();
          uint64_t v12 = 12;
          goto LABEL_36;
        }
LABEL_33:
        sub_100005EAC();
LABEL_36:
        sub_10001BF70();
        goto LABEL_37;
      }
    }
    else
    {
      strncpy(__dst, __s1, 0x10uLL);
      strcpy(&v22[4], "com.apple.MobileInternetSharing");
      memset(&v22[36], 0, 96);
      *(_DWORD *)CFDictionaryRef v22 = 31;
      if (ioctl(v14, 0xC094698FuLL, __dst) < 0)
      {
        uint64_t v12 = *__error();
        sub_100005EAC();
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    close(v14);
    goto LABEL_26;
  }
LABEL_37:
  sub_100005EAC();
  return v12;
}

uint64_t sub_10001BC10(char *a1)
{
  if (!a1) {
    sub_100027230();
  }
  if (!*a1) {
    sub_10002725C();
  }
  memset(v12, 0, 12);
  if (!if_nametoindex(a1))
  {
    uint64_t v6 = 0;
    goto LABEL_24;
  }
  CFDictionaryRef v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    uint64_t v6 = *__error();
    sub_100005EAC();
    char v5 = 0;
  }
  else
  {
    CFDictionaryRef v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    CFArrayRef v3 = malloc_type_realloc(0, 0x2000uLL, 0x48C2642uLL);
    if (!v3)
    {
      sub_100005EAC();
      char v5 = 0;
      uint64_t v6 = 12;
LABEL_18:
      close(v2);
      goto LABEL_19;
    }
    size_t v4 = 0x2000;
    while (1)
    {
      char v5 = v3;
      bzero(v3, v4);
      LODWORD(v12[0]) = v4;
      *(void **)((char *)v12 + 4) = v5;
      if ((unint64_t)__strlcpy_chk() >= 0x10
        || (long long v14 = xmmword_100029150, v15 = v12, ioctl(v2, 0xC028697BuLL, &v13) < 0))
      {
        uint64_t v6 = *__error();
        sub_100005EAC();
        goto LABEL_17;
      }
      if (LODWORD(v12[0]) + 80 < (int)v4) {
        break;
      }
      CFDictionaryRef v15 = 0;
      size_t v4 = (2 * v4);
      long long v13 = 0u;
      long long v14 = 0u;
      CFArrayRef v3 = malloc_type_realloc(v5, v4, 0x48C2642uLL);
      if (!v3)
      {
        sub_100005EAC();
        free(v5);
        char v5 = 0;
        uint64_t v6 = 12;
        goto LABEL_17;
      }
    }
    uint64_t v6 = 0;
  }
LABEL_17:
  if (v2 != -1) {
    goto LABEL_18;
  }
LABEL_19:
  if (v5 && v6)
  {
    free(v5);
    *(void **)((char *)v12 + 4) = 0;
LABEL_23:
    sub_100005EAC();
    goto LABEL_24;
  }
  if (v6) {
    goto LABEL_23;
  }
  if (LODWORD(v12[0]) >= 0x50)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      long long v10 = *(char **)((char *)v12 + 4) + v8;
      if ((*(unsigned char **)((char *)v12 + 4))[v8])
      {
        sub_100005EAC();
        sub_100011880(v10);
        sub_1000119FC(v10);
        sub_10000FEC8(v10);
        int v11 = sub_10001C660((uint64_t)v10, (uint64_t)a1);
        sub_10001030C(v10, 1, 1, 1);
        if (v11) {
          sub_100005EAC();
        }
      }
      ++v9;
      v8 += 80;
    }
    while (v9 < LODWORD(v12[0]) / 0x50uLL);
  }
  sub_100011880(a1);
  sub_1000119FC(a1);
  sub_1000108B8(a1, 0, 0);
  uint64_t v6 = sub_10001BF70();
LABEL_24:
  if (*(void **)((char *)v12 + 4))
  {
    free(*(void **)((char *)v12 + 4));
    *(void **)((char *)v12 + 4) = 0;
  }
  if (v6) {
    sub_100005EAC();
  }
  return v6;
}

uint64_t sub_10001BF70()
{
  long long v3 = 0u;
  long long v4 = 0u;
  int v0 = socket(2, 2, 0);
  if (v0 < 0)
  {
    uint64_t v1 = *__error();
    sub_100005EAC();
    if (v0 == -1) {
      return v1;
    }
    goto LABEL_10;
  }
  long long v3 = 0u;
  long long v4 = 0u;
  if ((unint64_t)__strlcpy_chk() >= 0x10)
  {
    uint64_t v1 = *__error();
LABEL_9:
    sub_100005EAC();
    goto LABEL_10;
  }
  if (ioctl(v0, 0x80206979uLL, &v3) < 0)
  {
    uint64_t v1 = *__error();
    goto LABEL_9;
  }
  sub_100005EAC();
  uint64_t v1 = 0;
LABEL_10:
  close(v0);
  return v1;
}

uint64_t sub_10001C0A4(char *a1, char *__s1, int a3, char a4, int a5, int a6)
{
  BOOL value = 0;
  if (!a1) {
    sub_100027288();
  }
  if (!*a1) {
    sub_1000272B4();
  }
  if (!__s1) {
    sub_1000272E0();
  }
  if (!*__s1) {
    sub_10002730C();
  }
  uint64_t v12 = &qword_1000393E0;
  do
  {
    uint64_t v12 = (uint64_t *)*v12;
    if (!v12) {
      goto LABEL_9;
    }
  }
  while (strncmp(__s1, (const char *)v12 + 8, 0x10uLL));
  if (xpc_dictionary_get_value((xpc_object_t)v12[4], a1))
  {
LABEL_9:
    sub_100005EAC();
    uint64_t v13 = 22;
LABEL_10:
    sub_100005EAC();
    return v13;
  }
  if ((a4 & 1) == 0)
  {
    sub_100012480(a1, &value);
    sub_1000108B8(a1, value, 1);
    sub_100011760(a1);
  }
  memset(v21, 0, sizeof(v21));
  if ((unint64_t)__strlcpy_chk() < 0x10)
  {
    int v15 = socket(2, 2, 0);
    if ((v15 & 0x80000000) == 0)
    {
      int v16 = v15;
      uint64_t v13 = sub_10001CB68((uint64_t)__s1, v15, 0, (uint64_t)"BRDGADD", (uint64_t)v21, 1);
      close(v16);
      if (!v13) {
        goto LABEL_17;
      }
LABEL_22:
      if (a4) {
        goto LABEL_10;
      }
LABEL_26:
      sub_100011880(a1);
      sub_10001030C(a1, 1, value, 0);
      goto LABEL_10;
    }
  }
  uint64_t v13 = *__error();
  sub_100005EAC();
  if (v13) {
    goto LABEL_22;
  }
LABEL_17:
  if ((a4 & 1) == 0)
  {
    sub_100010F70(a1);
    uint64_t v18 = sub_10000FD60((uint64_t)a1, 1);
    if (v18)
    {
LABEL_25:
      uint64_t v13 = v18;
      strerror(v18);
      sub_100005EAC();
      sub_10001C660((uint64_t)a1, (uint64_t)__s1);
      goto LABEL_26;
    }
    if (a5) {
      int v19 = ((*((_DWORD *)v12 + 7) == 304) << 11) | 0x10000;
    }
    else {
      int v19 = (*((_DWORD *)v12 + 7) == 304) << 11;
    }
    if (v19)
    {
      uint64_t v18 = sub_10001C528((uint64_t)a1, (uint64_t)__s1, v19);
      if (v18) {
        goto LABEL_25;
      }
      sub_100005EAC();
    }
    if (a3) {
      sub_100011888(a1);
    }
    goto LABEL_37;
  }
  if (!a6)
  {
LABEL_37:
    uint64_t v13 = 0;
    goto LABEL_38;
  }
  uint64_t v17 = sub_10001C528((uint64_t)a1, (uint64_t)__s1, 0x8000);
  uint64_t v13 = v17;
  if (v17) {
    strerror(v17);
  }
  sub_100005EAC();
LABEL_38:
  xpc_dictionary_set_BOOL((xpc_object_t)v12[4], a1, value);
  if (!xpc_dictionary_get_count((xpc_object_t)v12[4])) {
    sub_100027338();
  }
  sub_10001232C(*((_DWORD *)v12 + 6));
  sub_100012354(*((_DWORD *)v12 + 7));
  sub_100005EAC();
  if (v13) {
    goto LABEL_10;
  }
  return v13;
}

uint64_t sub_10001C42C(char *__s1)
{
  if (!__s1) {
    sub_100027364();
  }
  if (!*__s1) {
    sub_100027390();
  }
  int v2 = &qword_1000393E0;
  long long v3 = &qword_1000393E0;
  do
  {
    long long v3 = (uint64_t *)*v3;
    if (!v3)
    {
      sub_100005EAC();
      return 22;
    }
  }
  while (strncmp(__s1, (const char *)v3 + 8, 0x10uLL));
  int v4 = *((_DWORD *)v3 + 10) - 1;
  *((_DWORD *)v3 + 1sub_100017968(0x3FEu, 1, 0) = v4;
  if (v4) {
    sub_1000273E8();
  }
  sub_10000FD60((uint64_t)__s1, -1);
  sub_10001BF70();
  for (uint64_t i = (uint64_t *)qword_1000393E0; i != v3; uint64_t i = (uint64_t *)*i)
    int v2 = i;
  *int v2 = *v3;
  if (!dword_1000393E8) {
    sub_1000273BC();
  }
  --dword_1000393E8;
  xpc_release((xpc_object_t)v3[4]);
  free(v3);
  return 0;
}

uint64_t sub_10001C528(uint64_t a1, uint64_t a2, int a3)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if ((unint64_t)__strlcpy_chk() >= 0x10 || (int v5 = socket(2, 2, 0), v5 < 0))
  {
    uint64_t v7 = *__error();
    sub_100005EAC();
  }
  else
  {
    int v6 = v5;
    uint64_t v7 = sub_10001CB68(a2, v5, 2, (uint64_t)"BRDGGIFFLGS", (uint64_t)&v9, 0);
    if (!v7)
    {
      LODWORD(v1sub_100017968(0x3FEu, 1, 0) = v10 | a3;
      uint64_t v7 = sub_10001CB68(a2, v6, 3, (uint64_t)"BRDGSIFFLGS", (uint64_t)&v9, 1);
    }
    close(v6);
  }
  return v7;
}

uint64_t sub_10001C660(uint64_t a1, uint64_t a2)
{
  memset(v7, 0, sizeof(v7));
  if ((unint64_t)__strlcpy_chk() >= 0x10 || (int v3 = socket(2, 2, 0), v3 < 0))
  {
    uint64_t v5 = *__error();
    sub_100005EAC();
  }
  else
  {
    int v4 = v3;
    uint64_t v5 = sub_10001CB68(a2, v3, 1, (uint64_t)"BRDGDEL", (uint64_t)v7, 1);
    close(v4);
  }
  return v5;
}

uint64_t sub_10001C758(char *a1, char *__s1)
{
  if (!a1) {
    sub_100027414();
  }
  if (!*a1) {
    sub_100027440();
  }
  if (!__s1) {
    sub_10002746C();
  }
  if (!*__s1) {
    sub_100027498();
  }
  int v4 = &qword_1000393E0;
  do
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      goto LABEL_10;
    }
  }
  while (strncmp(__s1, (const char *)v4 + 8, 0x10uLL));
  xpc_object_t value = xpc_dictionary_get_value((xpc_object_t)v4[4], a1);
  if (!value || (int v6 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_BOOL))
  {
LABEL_10:
    sub_100005EAC();
    return 0;
  }
  sub_100005EAC();
  BOOL v9 = xpc_BOOL_get_value(v6);
  xpc_dictionary_set_value((xpc_object_t)v4[4], a1, 0);
  sub_100011880(a1);
  sub_1000119FC(a1);
  sub_10000FEC8(a1);
  uint64_t v10 = sub_10001C660((uint64_t)a1, (uint64_t)__s1);
  if (!v10)
  {
    sub_10001232C(*((_DWORD *)v4 + 6));
    sub_100012354(*((_DWORD *)v4 + 7));
    sub_100005EAC();
    sub_10001030C(a1, 1, v9, 1);
    return 0;
  }
  uint64_t v7 = v10;
  if (v9) {
    sub_100010778(a1, 1);
  }
  sub_100005EAC();
  return v7;
}

uint64_t sub_10001C8FC(char *__str)
{
  if (!__str) {
    sub_1000274C4();
  }
  int v2 = 0;
  while (1)
  {
    snprintf(__str, 0x10uLL, "%s%d", "bridge", v2 + 100);
    if (!if_nametoindex(__str)) {
      break;
    }
    if (++v2 == 2147483547) {
      return 22;
    }
  }
  sub_100005EAC();
  return 0;
}

uint64_t sub_10001C9A8(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  int v6 = socket(2, 2, 0);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
    if ((unint64_t)__strlcpy_chk() <= 0xF)
    {
      if ((unint64_t)__strlcpy_chk() <= 0xF)
      {
        int v9 = v14;
        int v10 = v14 | 1;
        LODWORD(v14) = v14 | 1;
        if (a3)
        {
          int v11 = *a3;
          WORD4(v15) = *((_WORD *)a3 + 2);
          int v10 = v9 | 3;
          DWORD1(v15) = v11;
          LODWORD(v14) = v9 | 3;
        }
        if (a4)
        {
          HIDWORD(v15) = *a4;
          LODWORD(v14) = v10 | 4;
        }
        long long v17 = xmmword_100029160;
        uint64_t v18 = &v14;
        uint64_t v8 = 1;
        if ((ioctl(v7, 0x8028697BuLL, &v16) & 0x80000000) == 0) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    long long v12 = __error();
    strerror(*v12);
    sub_100005EAC();
LABEL_13:
    close(v7);
    return v8;
  }
  sub_100005EAC();
  return 0;
}

uint64_t sub_10001CB68(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  if ((unint64_t)__strlcpy_chk() >= 0x10)
  {
    int v10 = __error();
    uint64_t v11 = *v10;
    strerror(*v10);
LABEL_9:
    sub_100005EAC();
    return v11;
  }
  *(void *)&long long v16 = a3;
  *((void *)&v16 + 1) = 80;
  uint64_t v17 = a5;
  if (a6) {
    int v12 = ioctl(a2, 0x8028697BuLL, &v15);
  }
  else {
    int v12 = ioctl(a2, 0xC028697BuLL, &v15);
  }
  if (v12 < 0)
  {
    long long v13 = __error();
    uint64_t v11 = *v13;
    strerror(*v13);
    goto LABEL_9;
  }
  sub_100005EAC();
  return 0;
}

void sub_10001CCE8()
{
  __int16 v0 = word_100039468;
  if ((unsigned __int16)word_100039468 <= (unsigned __int16)word_10003946A)
  {
    if (word_100039468) {
      BOOL v1 = 1;
    }
    else {
      BOOL v1 = word_10003946A == 0;
    }
    if (!v1) {
      word_100039468 = word_10003946A;
    }
  }
  else
  {
    if (word_10003946A) {
      word_100039468 = word_10003946A;
    }
    word_10003946A = v0;
  }
}

void sub_10001CD2C()
{
  if (PFUserCreate())
  {
    PFUserDeleteRules();
    PFUserRelease();
    if (PFUserCreate())
    {
      PFUserDeleteRules();
      PFUserRelease();
      if (PFUserCreate())
      {
        PFUserDeleteRules();
        PFUserRelease();
        if (PFUserCreate())
        {
          PFUserDeleteRules();
          PFUserRelease();
          if (PFUserCreate())
          {
            PFUserDeleteRules();
            PFUserRelease();
            if (PFUserCreate())
            {
              PFUserDeleteRules();
              PFUserRelease();
              if (PFUserCreate())
              {
                PFUserDeleteRules();
                PFUserRelease();
                if (PFUserCreate())
                {
                  PFUserDeleteRules();
                  PFUserRelease();
                }
              }
            }
          }
        }
      }
    }
  }
  if (!access("/usr/libexec/ftp-proxy", 0))
  {
    SMJobSetEnabled();
    byte_1000393F0 = 1;
  }
  byte_1000393F4 = 1;
}

void sub_10001D030()
{
  if (byte_1000393F4 == 1)
  {
    if (byte_1000393F0 == 1) {
      SMJobSetEnabled();
    }
    byte_1000393F4 = 0;
  }
}

uint64_t *sub_10001D138(char *__s1, _DWORD *a2, _DWORD *a3, int a4)
{
  uint64_t v8 = &qword_1000393F8;
  while (1)
  {
    uint64_t v8 = (uint64_t *)*v8;
    if (!v8) {
      return v8;
    }
    if (!strncmp(__s1, (const char *)v8 + 20, 0x10uLL))
    {
      if (*((unsigned char *)v8 + 344))
      {
        if (a4) {
          goto LABEL_6;
        }
      }
      else
      {
        if (!*a2) {
          return 0;
        }
        *((_DWORD *)v8 + 13) = *a2;
        *((_DWORD *)v8 + 14) = *a3;
        if (a4) {
LABEL_6:
        }
          *((_DWORD *)v8 + 4) = a4;
      }
      uint64_t v9 = PFUserCreate();
      if (!v9) {
        return (uint64_t *)12;
      }
      if (*((unsigned char *)v8 + 344)) {
        BOOL v10 = dword_1000394B8 == 0;
      }
      else {
        BOOL v10 = 0;
      }
      if (v10)
      {
        PFUserDeleteRules();
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v8 = (uint64_t *)sub_10001D2D8((uint64_t)v8, v9);
      }
      PFUserRelease();
      return v8;
    }
  }
}

uint64_t *sub_10001D26C(char *__s1, int a2)
{
  int v4 = &qword_1000393F8;
  while (1)
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if (!strncmp(__s1, (const char *)v4 + 20, 0x10uLL))
    {
      if (a2)
      {
        int v5 = *((_DWORD *)v4 + 87);
        *((_DWORD *)v4 + 87) = v5 + 1;
        if (v5 == -1) {
          sub_1000274F0();
        }
      }
      return v4;
    }
  }
  return v4;
}

uint64_t sub_10001D2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules();
  if (*(unsigned char *)(a1 + 344))
  {
    uint64_t v5 = qword_1000394A8;
    if (qword_1000394A8)
    {
      while (1)
      {
        if (*(unsigned char *)(v5 + 41))
        {
          uint64_t v6 = sub_1000209D8((const char *)(v5 + 8), 0, 0, a2, v4);
          if (v6) {
            break;
          }
        }
        uint64_t v5 = *(void *)v5;
        if (!v5) {
          goto LABEL_8;
        }
      }
LABEL_96:
      uint64_t v7 = v6;
      goto LABEL_97;
    }
  }
  else
  {
    uint64_t v7 = sub_1000209D8((const char *)(a1 + 20), 0, 0, a2, v4);
    if (v7) {
      goto LABEL_97;
    }
  }
LABEL_8:
  uint64_t v8 = qword_1000393F8;
  if (!qword_1000393F8)
  {
LABEL_70:
    unsigned int v46 = (unsigned __int16)word_100039468;
    unsigned int v47 = (unsigned __int16)word_10003946A;
    int v48 = *(unsigned __int8 *)(a1 + 344);
    if ((unsigned __int16)word_100039468 | (unsigned __int16)word_10003946A)
    {
      if (*(unsigned char *)(a1 + 344)) {
        sub_100027574();
      }
      uint64_t v49 = 0;
      uint64_t v50 = qword_1000393F8;
      do
      {
        if (!v50) {
          break;
        }
        if (!*(_DWORD *)(v50 + 8) && !strncmp((const char *)(v50 + 36), (const char *)(a1 + 20), 0x100uLL)) {
          uint64_t v49 = v50;
        }
        uint64_t v50 = *(void *)v50;
      }
      while (v50);
      if (!v49) {
        sub_10002751C();
      }
      unsigned int v52 = *(_DWORD *)(v49 + 52);
      unsigned int v51 = *(_DWORD *)(v49 + 56);
      int v53 = v51 & v52;
      unsigned int v54 = bswap32(v52);
      unsigned int v55 = bswap32(v51 & v52);
      if (v54 != v55 + 1) {
        sub_100027548();
      }
      int v56 = bswap32(v55 + 2);
      uint64_t v7 = sub_100020EBC((const char *)(v49 + 20), (const char *)(a1 + 20), v53, v51, 6u, v46, v47, v46, v47, SHIDWORD(v61), v56, a2, v4);
      if (v7) {
        goto LABEL_97;
      }
      uint64_t v7 = sub_100020EBC((const char *)(v49 + 20), (const char *)(a1 + 20), v53, *(_DWORD *)(v49 + 56), 0x11u, (unsigned __int16)word_100039468, (unsigned __int16)word_10003946A, (unsigned __int16)word_100039468, word_10003946A, v62, v56, a2, v4);
      if (v7) {
        goto LABEL_97;
      }
      int v48 = *(unsigned __int8 *)(a1 + 344);
    }
    if (v48)
    {
      for (uint64_t i = qword_1000394A8; i; uint64_t i = *(void *)i)
      {
        if (*(unsigned char *)(i + 41))
        {
          uint64_t v6 = sub_100021304((const char *)(i + 8), a2, v4, 2u);
          if (v6) {
            goto LABEL_96;
          }
        }
      }
    }
    else
    {
      CFDateRef v58 = (const char *)(a1 + 20);
      uint64_t v7 = sub_100021304(v58, a2, v4, 2u);
      if (v7) {
        goto LABEL_97;
      }
      for (uint64_t j = qword_1000393F8; j; uint64_t j = *(void *)j)
      {
        if (!*(_DWORD *)(j + 8) && !strncmp((const char *)(j + 36), v58, 0x100uLL))
        {
          uint64_t v6 = sub_1000215D4(v58, (const char *)(j + 20), a2, v4);
          if (v6) {
            goto LABEL_96;
          }
        }
      }
    }
    PFUserCommitRules();
    return 0;
  }
  uint64_t v9 = (const char *)(a1 + 20);
  while (1)
  {
    if (*(_DWORD *)(v8 + 8) || strncmp((const char *)(v8 + 36), v9, 0x100uLL)) {
      goto LABEL_69;
    }
    if (*(_DWORD *)(a1 + 16) >= *(_DWORD *)(v8 + 16)) {
      unsigned int v10 = *(_DWORD *)(v8 + 16);
    }
    else {
      unsigned int v10 = *(_DWORD *)(a1 + 16);
    }
    uint64_t v6 = sub_1000209D8((const char *)(v8 + 20), 0, v10, a2, v4);
    if (v6) {
      goto LABEL_96;
    }
    uint64_t v6 = sub_1000209D8((const char *)(v8 + 20), 0x32u, 0, a2, v4);
    if (v6) {
      goto LABEL_96;
    }
    inet_ntop(2, (const void *)(v8 + 52), v64, 0x10u);
    if (*(unsigned char *)(a1 + 344))
    {
      for (uint64_t k = qword_1000394A8; k; uint64_t k = *(void *)k)
      {
        if (*(unsigned char *)(k + 41))
        {
          unsigned int v12 = bswap32(*(_DWORD *)(v8 + 56));
          if ((v12 & 0x80000000) != 0)
          {
            int v14 = 0;
            do
              char v15 = v14-- + 30;
            while (((v12 >> v15) & 1) != 0);
            int v13 = -v14;
          }
          else
          {
            int v13 = 0;
          }
          uint64_t v6 = sub_100020B54((const char *)(k + 8), 2u, v64, v13, a2, v4);
          if (v6) {
            goto LABEL_96;
          }
          uint64_t v6 = sub_100020E30((const char *)(k + 8), 2, a2, v4);
          if (v6) {
            goto LABEL_96;
          }
        }
      }
    }
    else
    {
      unsigned int v16 = bswap32(*(_DWORD *)(v8 + 56));
      if ((v16 & 0x80000000) != 0)
      {
        int v18 = 0;
        do
          char v19 = v18-- + 30;
        while (((v16 >> v19) & 1) != 0);
        int v17 = -v18;
      }
      else
      {
        int v17 = 0;
      }
      uint64_t v6 = sub_100020B54(v9, 2u, v64, v17, a2, v4);
      if (v6) {
        goto LABEL_96;
      }
    }
    unsigned int v20 = *(_DWORD *)(v8 + 56);
    int v63 = *(_DWORD *)(v8 + 52);
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    if (!v21)
    {
      sub_100005EAC();
LABEL_103:
      uint64_t v7 = 12;
      goto LABEL_97;
    }
    CFDictionaryRef v22 = v21;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    *(_OWORD *)stat __str = 0u;
    long long v67 = 0u;
    xpc_dictionary_set_uint64(v21, kPFAction, 5uLL);
    xpc_dictionary_set_string(v22, kPFInterface, (const char *)(v8 + 20));
    xpc_dictionary_set_uint64(v22, kPFFamily, 2uLL);
    xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
    if (!v23)
    {
      sub_100005EAC();
LABEL_102:
      xpc_release(v22);
      goto LABEL_103;
    }
    CFArrayRef v24 = v23;
    inet_ntop(2, &v63, string, 0x10u);
    xpc_dictionary_set_string(v24, kPFSubAddress, string);
    xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
    if (!v25)
    {
      sub_100005EAC();
      xpc_release(v24);
      goto LABEL_102;
    }
    uid_t v26 = v25;
    unsigned int v27 = bswap32(v20);
    if ((v27 & 0x80000000) != 0)
    {
      int v29 = 0;
      do
        char v30 = v29-- + 30;
      while (((v27 >> v30) & 1) != 0);
      int v28 = -v29;
    }
    else
    {
      int v28 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", string, v28);
    xpc_dictionary_set_string(v26, kPFSubAddress, __str);
    xpc_dictionary_set_value(v22, kPFFrom, v24);
    xpc_dictionary_set_value(v22, kPFTo, v26);
    int v31 = sub_100021724(a2, v4, v22);
    if (v31)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uid_t v61 = "mis_pf_configure_nonat";
      sub_100005EAC();
      uint64_t v7 = 22;
    }
    xpc_release(v24);
    xpc_release(v26);
    xpc_release(v22);
    if (!v31) {
      goto LABEL_97;
    }
    if (byte_1000393F0 == 1 && !*(unsigned char *)(a1 + 344)) {
      break;
    }
LABEL_68:
    uint64_t v9 = (const char *)(a1 + 20);
LABEL_69:
    uint64_t v8 = *(void *)v8;
    if (!v8) {
      goto LABEL_70;
    }
  }
  unsigned int v32 = *(_DWORD *)(v8 + 56);
  int v63 = *(_DWORD *)(v8 + 52);
  xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
  if (v33)
  {
    in_addr v34 = v33;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    *(_OWORD *)stat __str = 0u;
    long long v67 = 0u;
    xpc_dictionary_set_string(v33, kPFSubAddress, "127.0.0.1");
    xpc_dictionary_set_uint64(v34, kPFSubLowPort, 0x1F55uLL);
    xpc_dictionary_set_uint64(v34, kPFSubPortOperator, 0);
    xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
    CFDateRef v36 = v35;
    if (v35
      && (xpc_dictionary_set_uint64(v35, kPFAction, 8uLL),
          xpc_dictionary_set_uint64(v36, kPFProtocol, 6uLL),
          xpc_dictionary_set_string(v36, kPFInterface, (const char *)(v8 + 20)),
          xpc_dictionary_set_uint64(v36, kPFFamily, 2uLL),
          (xpc_object_t v37 = xpc_dictionary_create(0, 0, 0)) != 0))
    {
      CFMutableArrayRef v38 = v37;
      inet_ntop(2, &v63, string, 0x10u);
      unsigned int v39 = bswap32(v32);
      if ((v39 & 0x80000000) != 0)
      {
        int v43 = 0;
        do
          char v44 = v43-- + 30;
        while (((v39 >> v44) & 1) != 0);
        int v40 = -v43;
      }
      else
      {
        int v40 = 0;
      }
      snprintf(__str, 0x100uLL, "%s/%d", string, v40);
      xpc_dictionary_set_string(v38, kPFSubAddress, __str);
      xpc_object_t v45 = xpc_dictionary_create(0, 0, 0);
      in_addr v42 = v45;
      if (v45)
      {
        xpc_dictionary_set_string(v45, kPFSubAddressLabel, kPFAny);
        xpc_dictionary_set_uint64(v42, kPFSubLowPort, 0x15uLL);
        xpc_dictionary_set_uint64(v42, kPFSubPortOperator, 2uLL);
        xpc_dictionary_set_value(v36, kPFFrom, v38);
        xpc_dictionary_set_value(v36, kPFTo, v42);
        xpc_dictionary_set_value(v36, kPFNATRDRAddress, v34);
        if (sub_100021724(a2, v4, v36))
        {
          int v41 = 0;
        }
        else
        {
          uid_t v61 = "mis_pf_configure_ftp_proxy";
          sub_100005EAC();
          int v41 = 22;
        }
      }
      else
      {
        sub_100005EAC();
        int v41 = 12;
      }
      xpc_release(v34);
      xpc_release(v38);
      if (!v42)
      {
LABEL_65:
        if (v36) {
          xpc_release(v36);
        }
        if (v41) {
          goto LABEL_105;
        }
        goto LABEL_68;
      }
    }
    else
    {
      sub_100005EAC();
      int v41 = 12;
      in_addr v42 = v34;
    }
    xpc_release(v42);
    goto LABEL_65;
  }
  sub_100005EAC();
LABEL_105:
  uint64_t v7 = 1;
LABEL_97:
  PFUserClearRules();
  return v7;
}

uint64_t *sub_10001DC54(char *__s1, int a2)
{
  uint64_t v4 = &qword_1000393F8;
  while (1)
  {
    uint64_t v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if (!strncmp(__s1, (const char *)v4 + 20, 0x10uLL))
    {
      if (a2) {
        *((_DWORD *)v4 + 4) = a2;
      }
      uint64_t v5 = PFUserCreate();
      if (!v5) {
        return (uint64_t *)12;
      }
      if (*((unsigned char *)v4 + 344)) {
        BOOL v6 = dword_1000394BC == 0;
      }
      else {
        BOOL v6 = 0;
      }
      if (v6)
      {
        PFUserDeleteRules();
        uint64_t v4 = 0;
      }
      else
      {
        uint64_t v4 = (uint64_t *)sub_10001DD50((uint64_t)v4, v5);
      }
      PFUserRelease();
      return v4;
    }
  }
  return v4;
}

uint64_t sub_10001DD50(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 281)) {
    return 45;
  }
  uint64_t v5 = PFUserBeginRules();
  BOOL v6 = &qword_1000394B0;
  if (*(unsigned char *)(a1 + 344))
  {
    for (uint64_t i = qword_1000394B0; i; uint64_t i = *(void *)i)
    {
      if (*(unsigned char *)(i + 41))
      {
        uint64_t v8 = sub_1000209D8((const char *)(i + 8), 0, 0, a2, v5);
        if (v8) {
          goto LABEL_32;
        }
      }
    }
  }
  else
  {
    uint64_t v2 = sub_1000209D8((const char *)(a1 + 20), 0, 0, a2, v5);
    if (v2) {
      goto LABEL_40;
    }
  }
  uint64_t v9 = &byte_100038F58[168];
  uint64_t v10 = qword_1000393F8;
  if (qword_1000393F8)
  {
    uint64_t v11 = (const char *)(a1 + 20);
    do
    {
      if (!*(_DWORD *)(v10 + 8)
        && !*(unsigned char *)(v10 + 281)
        && *(unsigned char *)(v10 + 328)
        && !strncmp((const char *)(v10 + 36), v11, 0x100uLL))
      {
        if (*(_DWORD *)(a1 + 16) >= *(_DWORD *)(v10 + 16)) {
          unsigned int v12 = *(_DWORD *)(v10 + 16);
        }
        else {
          unsigned int v12 = *(_DWORD *)(a1 + 16);
        }
        uint64_t v8 = sub_1000209D8((const char *)(v10 + 20), 0, v12, a2, v5);
        if (v8) {
          goto LABEL_32;
        }
        uint64_t v8 = sub_1000209D8((const char *)(v10 + 20), 0x32u, 0, a2, v5);
        if (v8) {
          goto LABEL_32;
        }
        char v19 = v11;
        if (*(unsigned char *)(a1 + 344))
        {
          int v13 = v6;
          uint64_t v14 = *v6;
          if (*v6)
          {
            while (1)
            {
              if (*(unsigned char *)(v14 + 41))
              {
                uint64_t v8 = sub_100020B54((const char *)(v14 + 8), 0x1Eu, (const char *)(v10 + 282), *(unsigned __int8 *)(v10 + 328), a2, v5);
                if (v8) {
                  break;
                }
                uint64_t v8 = sub_100020E30((const char *)(v14 + 8), 30, a2, v5);
                if (v8) {
                  break;
                }
              }
              uint64_t v14 = *(void *)v14;
              if (!v14) {
                goto LABEL_31;
              }
            }
LABEL_32:
            uint64_t v2 = v8;
LABEL_40:
            PFUserClearRules();
            return v2;
          }
        }
        else
        {
          int v13 = v6;
          uint64_t v8 = sub_100020B54(v11, 0x1Eu, (const char *)(v10 + 282), *(unsigned __int8 *)(v10 + 328), a2, v5);
          if (v8) {
            goto LABEL_32;
          }
        }
LABEL_31:
        uint64_t v8 = sub_100021B9C((const char *)(v10 + 20), a2, v5, 1u);
        BOOL v6 = v13;
        uint64_t v9 = byte_100038F58 + 168;
        uint64_t v11 = v19;
        if (v8) {
          goto LABEL_32;
        }
      }
      uint64_t v10 = *(void *)v10;
    }
    while (v10);
  }
  if (*(unsigned char *)(a1 + 344))
  {
    for (uint64_t j = *v6; j; uint64_t j = *(void *)j)
    {
      if (*(unsigned char *)(j + 41))
      {
        uint64_t v8 = sub_100021304((const char *)(j + 8), a2, v5, 0x1Eu);
        if (v8) {
          goto LABEL_32;
        }
      }
    }
  }
  else
  {
    unsigned int v16 = (const char *)(a1 + 20);
    uint64_t v2 = sub_100021304(v16, a2, v5, 0x1Eu);
    if (v2) {
      goto LABEL_40;
    }
    for (uint64_t k = (const char *)*((void *)v9 + 127); k; uint64_t k = *(const char **)k)
    {
      if (!*((_DWORD *)k + 2) && !strncmp(k + 36, v16, 0x100uLL))
      {
        uint64_t v8 = sub_1000215D4(v16, k + 20, a2, v5);
        if (v8) {
          goto LABEL_32;
        }
      }
    }
  }
  PFUserCommitRules();
  return 0;
}

uint64_t sub_10001E038(char *__s1, uint64_t a2, char a3)
{
  BOOL v6 = &qword_1000393F8;
  do
  {
    BOOL v6 = (uint64_t *)*v6;
    if (!v6) {
      return 22;
    }
  }
  while (strncmp(__s1, (const char *)v6 + 20, 0x10uLL));
  if (*((unsigned char *)v6 + 344)) {
    sub_1000275A0();
  }
  if (!*(unsigned char *)a2) {
    return 0;
  }
  *((_OWORD *)v6 + 5) = *(_OWORD *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  long long v8 = *(_OWORD *)(a2 + 32);
  long long v9 = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v6 + ++*(_DWORD *)(result + 8) = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v6 + 9) = v9;
  *((_OWORD *)v6 + 6) = v7;
  *((_OWORD *)v6 + 7) = v8;
  long long v10 = *(_OWORD *)(a2 + 80);
  long long v11 = *(_OWORD *)(a2 + 96);
  long long v12 = *(_OWORD *)(a2 + 128);
  *((_OWORD *)v6 + 12) = *(_OWORD *)(a2 + 112);
  *((_OWORD *)v6 + 13) = v12;
  *((_OWORD *)v6 + 1sub_100017968(0x3FEu, 1, 0) = v10;
  *((_OWORD *)v6 + 11) = v11;
  long long v13 = *(_OWORD *)(a2 + 144);
  long long v14 = *(_OWORD *)(a2 + 160);
  long long v15 = *(_OWORD *)(a2 + 176);
  v6[34] = *(void *)(a2 + 192);
  *((_OWORD *)v6 + 15) = v14;
  *((_OWORD *)v6 + 16) = v15;
  *((_OWORD *)v6 + 14) = v13;
  *((unsigned char *)v6 + 28sub_100017968(0x3FEu, 1, 0) = a3;
  uint64_t v16 = PFUserCreate();
  if (!v16) {
    return 12;
  }
  uint64_t v17 = sub_10001E150((uint64_t)v6, v16);
  PFUserRelease();
  return v17;
}

uint64_t sub_10001E150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules();
  uint64_t v5 = qword_1000393F8;
  if (!qword_1000393F8)
  {
LABEL_11:
    PFUserCommitRules();
    return 0;
  }
  while (1)
  {
    if (*(_DWORD *)(v5 + 8) || strncmp((const char *)(v5 + 36), (const char *)(a1 + 20), 0x100uLL)) {
      goto LABEL_10;
    }
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6)
    {
      sub_100005EAC();
      uint64_t v11 = 12;
      goto LABEL_17;
    }
    long long v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (!v8)
    {
      sub_100005EAC();
      uint64_t v11 = 12;
      goto LABEL_16;
    }
    long long v9 = v8;
    xpc_dictionary_set_uint64(v7, kPFAction, 1uLL);
    xpc_dictionary_set_uint64(v7, kPFDirection, 1uLL);
    xpc_dictionary_set_string(v7, kPFInterface, (const char *)(v5 + 20));
    xpc_dictionary_set_uint64(v7, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v9, kPFSubReturnType, 8uLL);
    xpc_dictionary_set_value(v7, kPFReturnOptions, v9);
    xpc_release(v9);
    if ((sub_100021724(a2, v4, v7) & 1) == 0) {
      break;
    }
    xpc_release(v7);
    if (*(unsigned char *)(a1 + 280)
      && (uint64_t v10 = sub_100021DFC(a1, (const char *)(v5 + 20), a2, v4, 1, 1u, (const void *)(a1 + 96), *(unsigned __int8 *)(a1 + 117)), v10)|| (uint64_t v10 = sub_100021B9C((const char *)(v5 + 20), a2, v4, 1u), v10))
    {
      uint64_t v11 = v10;
      goto LABEL_17;
    }
LABEL_10:
    uint64_t v5 = *(void *)v5;
    if (!v5) {
      goto LABEL_11;
    }
  }
  sub_100005EAC();
  uint64_t v11 = 22;
LABEL_16:
  xpc_release(v7);
LABEL_17:
  PFUserClearRules();
  return v11;
}

uint64_t sub_10001E394(void *a1)
{
  if (a1[36]) {
    uint64_t v1 = a1[36];
  }
  else {
    uint64_t v1 = a1[35];
  }
  if (*(_DWORD *)(a1[35] + 288) == 101) {
    return 0;
  }
  int v3 = sub_10001D26C((char *)(a1[37] + 308), 1);
  if (!v3)
  {
    uint64_t v4 = (uint64_t *)sub_10001E908(a1[37], byte_100029220);
    if (!v4)
    {
      sub_100005EAC();
      return 0xFFFFFFFFLL;
    }
    int v3 = v4;
    uint64_t *v4 = qword_1000393F8;
    qword_1000393F8 = (uint64_t)v4;
  }
  uint64_t v5 = sub_10001D26C((char *)(v1 + 308), 1);
  if (!v5)
  {
    long long v15 = (xpc_object_t *)sub_10001E908(v1, (const char *)v3 + 20);
    if (!v15)
    {
      sub_100005EAC();
LABEL_29:
      sub_10001EB18(v3);
      return 0xFFFFFFFFLL;
    }
    uint64_t v16 = (char *)v15;
    xpc_object_t *v15 = (xpc_object_t)qword_1000393F8;
    qword_1000393F8 = (uint64_t)v15;
    if (*((_DWORD *)v15 + 3) == 104) {
      xpc_array_set_string(v15[42], 0xFFFFFFFFFFFFFFFFLL, (const char *)(a1[35] + 308));
    }
    if (*((unsigned char *)v3 + 352))
    {
      if (*((_DWORD *)v3 + 13))
      {
        uint64_t v17 = PFUserCreate();
        if (v17)
        {
          uint64_t v18 = sub_10001EBA4((uint64_t)v3, v17);
          if (v18)
          {
            uint64_t v14 = v18;
          }
          else
          {
            uint64_t v14 = sub_100017D20((char *)v3 + 20, v16 + 20);
            if (!v14) {
              goto LABEL_80;
            }
          }
          uint64_t v21 = 0;
          uint64_t v19 = 0;
          goto LABEL_66;
        }
        uint64_t v21 = 0;
        uint64_t v19 = 0;
        goto LABEL_65;
      }
      sub_100005EAC();
      uint64_t v17 = 0;
      uint64_t v21 = 0;
      uint64_t v19 = 0;
      uint64_t v14 = 49;
LABEL_66:
      sub_10001EB18((uint64_t *)v16);
      sub_10001EB18(v3);
      if (!v19)
      {
        if (!v21)
        {
          if (!v17) {
            return v14;
          }
          goto LABEL_79;
        }
        goto LABEL_73;
      }
      PFUserDeleteRules();
      char v23 = 0;
      goto LABEL_68;
    }
    if (*(_DWORD *)(a1[35] + 288) == 103)
    {
      uint64_t v19 = PFUserCreate();
      if (v19)
      {
        uint64_t v20 = sub_10001EE20((uint64_t)v3, v19);
        if (!v20)
        {
          uint64_t v21 = PFUserCreate();
          if (v21)
          {
            uint64_t v22 = sub_10001F7A8((uint64_t)v3, v21);
            if (!v22) {
              goto LABEL_59;
            }
            goto LABEL_56;
          }
LABEL_64:
          uint64_t v17 = 0;
          goto LABEL_65;
        }
LABEL_43:
        uint64_t v14 = v20;
        uint64_t v17 = 0;
        uint64_t v21 = 0;
        goto LABEL_66;
      }
LABEL_45:
      uint64_t v17 = 0;
      uint64_t v21 = 0;
LABEL_65:
      uint64_t v14 = 12;
      goto LABEL_66;
    }
    if (*((_DWORD *)v3 + 13) || (uint64_t v19 = 0, *((unsigned char *)v3 + 344)) && dword_1000394B8)
    {
      uint64_t v19 = PFUserCreate();
      if (!v19) {
        goto LABEL_45;
      }
      uint64_t v20 = sub_10001D2D8((uint64_t)v3, v19);
      if (v20) {
        goto LABEL_43;
      }
    }
    if (v16[328])
    {
      uint64_t v21 = PFUserCreate();
      if (v21)
      {
        uint64_t v22 = sub_10001DD50((uint64_t)v3, v21);
        if (!v22)
        {
LABEL_59:
          uint64_t v14 = sub_100017D20((char *)v3 + 20, v16 + 20);
          if (!v14)
          {
            uint64_t v17 = 0;
            char v23 = 1;
            if (!v19)
            {
LABEL_69:
              if (!v21) {
                goto LABEL_75;
              }
              if (v23)
              {
                char v23 = 1;
LABEL_74:
                PFUserRelease();
LABEL_75:
                if (!v17) {
                  return v14;
                }
                if (v23)
                {
LABEL_80:
                  PFUserRelease();
                  return v14;
                }
LABEL_79:
                PFUserDeleteRules();
                goto LABEL_80;
              }
LABEL_73:
              PFUserDeleteRules();
              char v23 = 0;
              goto LABEL_74;
            }
LABEL_68:
            PFUserRelease();
            goto LABEL_69;
          }
          goto LABEL_60;
        }
LABEL_56:
        uint64_t v14 = v22;
LABEL_60:
        uint64_t v17 = 0;
        goto LABEL_66;
      }
    }
    else
    {
      if (!*((unsigned char *)v3 + 80))
      {
        uint64_t v21 = 0;
        goto LABEL_59;
      }
      if (*((unsigned char *)v3 + 344)) {
        sub_1000275CC();
      }
      uint64_t v21 = PFUserCreate();
      if (v21)
      {
        uint64_t v22 = sub_10001E150((uint64_t)v3, v21);
        if (!v22) {
          goto LABEL_59;
        }
        goto LABEL_56;
      }
    }
    sub_100005EAC();
    goto LABEL_64;
  }
  if (*(_DWORD *)(v1 + 288) != 104) {
    sub_1000275F8();
  }
  xpc_object_t v6 = v5;
  long long v7 = (const char *)(a1[35] + 308);
  xpc_object_t v8 = (void *)v5[42];
  size_t count = xpc_array_get_count(v8);
  if (count)
  {
    unint64_t v10 = count;
    string = xpc_array_get_string(v8, 0);
    if (strcmp(string, v7))
    {
      size_t v12 = 1;
      while (v10 != v12)
      {
        long long v13 = xpc_array_get_string(v8, v12++);
        if (!strcmp(v13, v7))
        {
          if (v12 - 1 >= v10) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      goto LABEL_17;
    }
LABEL_16:
    sub_100005EAC();
    sub_10001EB18(v6);
    goto LABEL_29;
  }
LABEL_17:
  xpc_array_set_string((xpc_object_t)v6[42], 0xFFFFFFFFFFFFFFFFLL, v7);
  return 0;
}

_OWORD *sub_10001E908(uint64_t a1, const char *a2)
{
  uint64_t v4 = malloc_type_malloc(0x190uLL, 0x10A0040374E5239uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    v4[23] = 0u;
    v4[24] = 0u;
    v4[21] = 0u;
    v4[22] = 0u;
    v4[19] = 0u;
    v4[20] = 0u;
    v4[17] = 0u;
    v4[18] = 0u;
    v4[15] = 0u;
    v4[16] = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    _OWORD *v4 = 0u;
    int v6 = *(_DWORD *)(a1 + 16);
    if (!v6)
    {
      if (*(_DWORD *)(a1 + 288) == 104)
      {
        xpc_object_t v7 = xpc_array_create(0, 0);
        *((void *)v5 + 42) = v7;
        if (!v7)
        {
          sub_100005EAC();
          free(v5);
          return 0;
        }
      }
      snprintf((char *)v5 + 36, 0x10uLL, "%s", a2);
      int v6 = *(_DWORD *)(a1 + 16);
    }
    int v8 = *(_DWORD *)(a1 + 288);
    *((_DWORD *)v5 + 2) = v6;
    *((_DWORD *)v5 + 3) = v8;
    *((_DWORD *)v5 + 4) = *(_DWORD *)(a1 + 300);
    snprintf((char *)v5 + 20, 0x10uLL, "%s", (const char *)(a1 + 308));
    *((_DWORD *)v5 + 13) = *(_DWORD *)(a1 + 680);
    *(_OWORD *)((char *)v5 + 6sub_100017968(0x3FEu, 1, 0) = *(_OWORD *)(a1 + 648);
    *((_DWORD *)v5 + 14) = *(_DWORD *)(a1 + 684);
    *((unsigned char *)v5 + 28sub_100017968(0x3FEu, 1, 0) = *(unsigned char *)(a1 + 1106);
    int v9 = *(unsigned __int8 *)(a1 + 1107);
    *((unsigned char *)v5 + 281) = v9;
    *((unsigned char *)v5 + 344) = *(unsigned char *)(a1 + 564);
    *((_DWORD *)v5 + 87) = 1;
    int v10 = *(_DWORD *)(a1 + 1128);
    *((unsigned char *)v5 + 352) = v10 == 502;
    if (v10 == 502)
    {
      if (v9) {
        sub_100027624();
      }
      snprintf((char *)v5 + 353, 0x2EuLL, "%s/96", (const char *)(a1 + 1178));
    }
    else if (v9)
    {
      if (v10 != 500) {
        sub_100027650();
      }
      v5[5] = *(_OWORD *)(a1 + 704);
      long long v11 = *(_OWORD *)(a1 + 720);
      long long v12 = *(_OWORD *)(a1 + 736);
      long long v13 = *(_OWORD *)(a1 + 768);
      v5[8] = *(_OWORD *)(a1 + 752);
      v5[9] = v13;
      v5[6] = v11;
      v5[7] = v12;
      long long v14 = *(_OWORD *)(a1 + 784);
      long long v15 = *(_OWORD *)(a1 + 800);
      long long v16 = *(_OWORD *)(a1 + 832);
      _OWORD v5[12] = *(_OWORD *)(a1 + 816);
      v5[13] = v16;
      v5[10] = v14;
      v5[11] = v15;
      long long v17 = *(_OWORD *)(a1 + 848);
      long long v18 = *(_OWORD *)(a1 + 864);
      long long v19 = *(_OWORD *)(a1 + 880);
      *((void *)v5 + 34) = *(void *)(a1 + 896);
      v5[15] = v18;
      v5[16] = v19;
      v5[14] = v17;
    }
    else if (v10 == 500 && !*((_DWORD *)v5 + 2))
    {
      long long v20 = *(_OWORD *)(a1 + 1132);
      long long v21 = *(_OWORD *)(a1 + 1148);
      *(_OWORD *)((char *)v5 + 313) = *(_OWORD *)(a1 + 1163);
      *(_OWORD *)((char *)v5 + 282) = v20;
      *(_OWORD *)((char *)v5 + 29++*(_DWORD *)(result + 8) = v21;
    }
  }
  return v5;
}

void sub_10001EB18(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 87) - 1;
  *((_DWORD *)a1 + 87) = v1;
  if (!v1)
  {
    if (*((_DWORD *)a1 + 3) == 104) {
      xpc_release((xpc_object_t)a1[42]);
    }
    int v3 = &qword_1000393F8;
    for (uint64_t i = (uint64_t *)qword_1000393F8; i != a1; uint64_t i = (uint64_t *)*i)
      int v3 = i;
    *int v3 = *a1;
    free(a1);
  }
}

uint64_t sub_10001EBA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules();
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
  {
    sub_100005EAC();
LABEL_8:
    uint64_t v10 = 12;
LABEL_15:
    PFUserClearRules();
    return v10;
  }
  int v6 = v5;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (!v7)
  {
    sub_100005EAC();
    xpc_release(v6);
    goto LABEL_8;
  }
  int v8 = v7;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    inet_ntop(2, (const void *)(a1 + 52), string, 0x10u);
    xpc_dictionary_set_uint64(v6, kPFAction, 0xDuLL);
    xpc_dictionary_set_uint64(v6, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_string(v8, kPFSubAddress, (const char *)(a1 + 353));
    xpc_dictionary_set_value(v6, kPFTo, v8);
    xpc_dictionary_set_string(v9, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v9, kPFSubLowPort, 0x8000uLL);
    xpc_dictionary_set_uint64(v9, kPFSubHighPort, 0xBFFFuLL);
    xpc_dictionary_set_uint64(v9, kPFSubPortOperator, 0);
    xpc_dictionary_set_value(v6, kPFNATRDRAddress, v9);
    if (sub_100021724(a2, v4, v6))
    {
      uint64_t v10 = 0;
      int v11 = 1;
    }
    else
    {
      sub_100005EAC();
      int v11 = 0;
      uint64_t v10 = 22;
    }
  }
  else
  {
    sub_100005EAC();
    int v11 = 0;
    uint64_t v10 = 12;
  }
  xpc_release(v6);
  xpc_release(v8);
  if (v9) {
    xpc_release(v9);
  }
  if (!v11) {
    goto LABEL_15;
  }
  PFUserCommitRules();
  return 0;
}

uint64_t sub_10001EE20(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = PFUserBeginRules();
  uint64_t v4 = qword_1000393F8;
  if (!qword_1000393F8)
  {
LABEL_50:
    PFUserCommitRules();
    return 0;
  }
  xpc_object_t v5 = (const char *)(a1 + 20);
  while (1)
  {
    if (*(_DWORD *)(v4 + 8) || strncmp((const char *)(v4 + 36), v5, 0x100uLL)) {
      goto LABEL_49;
    }
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6) {
      goto LABEL_51;
    }
    xpc_object_t v7 = v6;
    xpc_dictionary_set_uint64(v6, kPFAction, 1uLL);
    xpc_dictionary_set_string(v7, kPFInterface, (const char *)(v4 + 20));
    if ((sub_100021724(a2, v48, v7) & 1) == 0)
    {
      sub_100005EAC();
      xpc_release(v7);
      uint64_t v18 = 22;
      goto LABEL_59;
    }
    xpc_release(v7);
    unsigned int v8 = *(_DWORD *)(v4 + 56);
    int v49 = *(_DWORD *)(v4 + 52);
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    if (!v9) {
      goto LABEL_51;
    }
    uint64_t v10 = v9;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    *(_OWORD *)stat __str = 0u;
    xpc_dictionary_set_uint64(v9, kPFAction, 0);
    xpc_dictionary_set_string(v10, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v10, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v10, kPFKeepState, 1uLL);
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    if (!v11) {
      goto LABEL_52;
    }
    long long v12 = v11;
    inet_ntop(2, &v49, v50, 0x10u);
    unsigned int v13 = bswap32(v8);
    if ((v13 & 0x80000000) != 0)
    {
      int v15 = 0;
      do
        char v16 = v15-- + 30;
      while (((v13 >> v16) & 1) != 0);
      int v14 = -v15;
    }
    else
    {
      int v14 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", v50, v14);
    xpc_dictionary_set_string(v12, kPFSubAddress, __str);
    xpc_dictionary_set_value(v10, kPFFrom, v12);
    xpc_dictionary_set_value(v10, kPFTo, v12);
    int v17 = sub_100021724(a2, v48, v10);
    if (v17)
    {
      uint64_t v18 = 0;
    }
    else
    {
      sub_100005EAC();
      uint64_t v18 = 22;
    }
    xpc_release(v12);
    xpc_release(v10);
    if (!v17) {
      goto LABEL_59;
    }
    unsigned int v19 = *(_DWORD *)(v4 + 56);
    int v49 = *(_DWORD *)(v4 + 52);
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    if (!v20)
    {
LABEL_51:
      sub_100005EAC();
      goto LABEL_58;
    }
    uint64_t v10 = v20;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    *(_OWORD *)stat __str = 0u;
    xpc_dictionary_set_uint64(v20, kPFAction, 0);
    xpc_dictionary_set_string(v10, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v10, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v10, kPFKeepState, 1uLL);
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    if (!v21) {
      goto LABEL_52;
    }
    uint64_t v22 = v21;
    inet_ntop(2, &v49, v50, 0x10u);
    unsigned int v23 = bswap32(v19);
    if ((v23 & 0x80000000) != 0)
    {
      int v25 = 0;
      do
        char v26 = v25-- + 30;
      while (((v23 >> v26) & 1) != 0);
      int v24 = -v25;
    }
    else
    {
      int v24 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", v50, v24);
    xpc_dictionary_set_string(v22, kPFSubAddress, __str);
    xpc_dictionary_set_value(v10, kPFFrom, v22);
    xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
    if (!v27) {
      goto LABEL_53;
    }
    int v28 = v27;
    strcpy(__str, "224.0.0.0/24");
    xpc_dictionary_set_string(v27, kPFSubAddress, __str);
    xpc_dictionary_set_value(v10, kPFTo, v28);
    int v29 = sub_100021724(a2, v48, v10);
    if (v29)
    {
      uint64_t v18 = 0;
    }
    else
    {
      sub_100005EAC();
      uint64_t v18 = 22;
    }
    xpc_release(v22);
    xpc_release(v28);
    xpc_release(v10);
    if (!v29) {
      goto LABEL_59;
    }
    unsigned int v30 = *(_DWORD *)(v4 + 56);
    int v49 = *(_DWORD *)(v4 + 52);
    xpc_object_t v31 = xpc_dictionary_create(0, 0, 0);
    if (!v31) {
      goto LABEL_51;
    }
    uint64_t v10 = v31;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    *(_OWORD *)stat __str = 0u;
    xpc_dictionary_set_uint64(v31, kPFAction, 0);
    xpc_dictionary_set_string(v10, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v10, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v10, kPFKeepState, 1uLL);
    xpc_object_t v32 = xpc_dictionary_create(0, 0, 0);
    if (!v32) {
      goto LABEL_52;
    }
    uint64_t v22 = v32;
    inet_ntop(2, &v49, v50, 0x10u);
    unsigned int v33 = bswap32(v30);
    if ((v33 & 0x80000000) != 0)
    {
      int v35 = 0;
      do
        char v36 = v35-- + 30;
      while (((v33 >> v36) & 1) != 0);
      int v34 = -v35;
    }
    else
    {
      int v34 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", v50, v34);
    xpc_dictionary_set_string(v22, kPFSubAddress, __str);
    xpc_dictionary_set_value(v10, kPFFrom, v22);
    xpc_object_t v37 = xpc_dictionary_create(0, 0, 0);
    if (!v37)
    {
LABEL_53:
      sub_100005EAC();
      unsigned int v46 = v22;
      goto LABEL_56;
    }
    CFMutableArrayRef v38 = v37;
    strcpy(__str, "255.255.255.255");
    xpc_dictionary_set_string(v37, kPFSubAddress, __str);
    xpc_dictionary_set_value(v10, kPFTo, v38);
    int v39 = sub_100021724(a2, v48, v10);
    if (v39)
    {
      uint64_t v18 = 0;
    }
    else
    {
      sub_100005EAC();
      uint64_t v18 = 22;
    }
    xpc_release(v22);
    xpc_release(v38);
    xpc_release(v10);
    if (!v39) {
      goto LABEL_59;
    }
    xpc_object_t v40 = xpc_dictionary_create(0, 0, 0);
    if (!v40) {
      goto LABEL_51;
    }
    uint64_t v10 = v40;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    *(_OWORD *)stat __str = 0u;
    xpc_dictionary_set_uint64(v40, kPFAction, 0);
    xpc_dictionary_set_string(v10, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v10, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v10, kPFKeepState, 1uLL);
    xpc_dictionary_set_string(v10, kPFProtocol, "udp");
    xpc_object_t v41 = xpc_dictionary_create(0, 0, 0);
    if (!v41)
    {
LABEL_52:
      sub_100005EAC();
      goto LABEL_57;
    }
    in_addr v42 = v41;
    strcpy(__str, "0.0.0.0");
    xpc_dictionary_set_string(v41, kPFSubAddress, __str);
    xpc_dictionary_set_uint64(v42, kPFSubLowPort, 0x44uLL);
    xpc_dictionary_set_uint64(v42, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v10, kPFFrom, v42);
    xpc_object_t v43 = xpc_dictionary_create(0, 0, 0);
    if (!v43) {
      break;
    }
    char v44 = v43;
    xpc_dictionary_set_string(v43, kPFSubAddressLabel, kPFAny);
    xpc_dictionary_set_uint64(v44, kPFSubLowPort, 0x43uLL);
    xpc_dictionary_set_uint64(v44, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v10, kPFTo, v44);
    int v45 = sub_100021724(a2, v48, v10);
    if (v45)
    {
      uint64_t v18 = 0;
    }
    else
    {
      sub_100005EAC();
      uint64_t v18 = 22;
    }
    xpc_release(v42);
    xpc_release(v44);
    xpc_release(v10);
    if (!v45) {
      goto LABEL_59;
    }
LABEL_49:
    uint64_t v4 = *(void *)v4;
    if (!v4) {
      goto LABEL_50;
    }
  }
  sub_100005EAC();
  unsigned int v46 = v42;
LABEL_56:
  xpc_release(v46);
LABEL_57:
  xpc_release(v10);
LABEL_58:
  uint64_t v18 = 12;
LABEL_59:
  PFUserClearRules();
  return v18;
}

uint64_t sub_10001F7A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PFUserBeginRules();
  uint64_t v5 = qword_1000393F8;
  if (qword_1000393F8)
  {
    while (1)
    {
      if (!*(_DWORD *)(v5 + 8) && !strncmp((const char *)(v5 + 36), (const char *)(a1 + 20), 0x100uLL))
      {
        uint64_t v6 = sub_100021B9C((const char *)(v5 + 20), a2, v4, 0);
        if (v6) {
          break;
        }
        sub_100005EAC();
        if (*(_DWORD *)(v5 + 60) || *(_DWORD *)(v5 + 64) || *(_DWORD *)(v5 + 68) || *(_DWORD *)(v5 + 72))
        {
          int8x16_t v9 = *(int8x16_t *)(v5 + 60);
          int8x16_t v9 = vandq_s8(v9, (int8x16_t)xmmword_100029130);
          inet_ntop(30, &v9, v10, 0x2Eu);
          sub_100005EAC();
          uint64_t v6 = sub_100021DFC(a1, (const char *)(v5 + 20), a2, v4, 0, 0, &v9, 64);
          if (v6) {
            break;
          }
        }
      }
      uint64_t v5 = *(void *)v5;
      if (!v5) {
        goto LABEL_11;
      }
    }
    uint64_t v7 = v6;
    PFUserClearRules();
  }
  else
  {
LABEL_11:
    PFUserCommitRules();
    return 0;
  }
  return v7;
}

void sub_10001F968(void *a1)
{
  uint64_t v1 = a1[35];
  if (a1[36]) {
    uint64_t v2 = a1[36];
  }
  else {
    uint64_t v2 = a1[35];
  }
  if (*(_DWORD *)(v1 + 288) == 101) {
    return;
  }
  uint64_t v4 = (const char *)(a1[37] + 308);
  uint64_t v5 = &qword_1000393F8;
  do
  {
    uint64_t v5 = (uint64_t *)*v5;
    if (!v5)
    {
LABEL_20:
      sub_100005EAC();
      return;
    }
  }
  while (strncmp(v4, (const char *)v5 + 20, 0x10uLL));
  uint64_t v6 = (const char *)(v2 + 308);
  uint64_t v7 = &qword_1000393F8;
  do
  {
    uint64_t v7 = (uint64_t *)*v7;
    if (!v7) {
      goto LABEL_20;
    }
  }
  while (strncmp((const char *)(v2 + 308), (const char *)v7 + 20, 0x10uLL));
  if (*((_DWORD *)v7 + 3) == 104)
  {
    uint64_t v26 = v2;
    unsigned int v8 = (const char *)(v1 + 308);
    int8x16_t v9 = (void *)v7[42];
    xpc_object_t v10 = xpc_array_create(0, 0);
    size_t count = xpc_array_get_count(v9);
    if (!count)
    {
LABEL_29:
      xpc_release(v10);
      goto LABEL_20;
    }
    size_t v12 = count;
    size_t v13 = 0;
    char v14 = 0;
    size_t v25 = count - 1;
LABEL_14:
    char v27 = v14;
    size_t v15 = v13;
    do
    {
      string = xpc_array_get_string(v9, v15);
      if (!strcmp(string, v8))
      {
        size_t v13 = v15 + 1;
        char v14 = 1;
        if (v25 != v15) {
          goto LABEL_14;
        }
        goto LABEL_23;
      }
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, string);
      ++v15;
    }
    while (v12 != v15);
    if ((v27 & 1) == 0) {
      goto LABEL_29;
    }
LABEL_23:
    xpc_release(v9);
    v7[42] = (uint64_t)v10;
    uint64_t v2 = v26;
  }
  int v17 = *((_DWORD *)v7 + 87);
  int v18 = *((_DWORD *)v5 + 87);
  sub_10001EB18(v7);
  sub_10001EB18(v5);
  if (v17 > 1) {
    return;
  }
  sub_100017E9C((char *)(a1[37] + 308), v6);
  uint64_t v19 = a1[35];
  if (*(_DWORD *)(v19 + 1128) == 502)
  {
    uint64_t v20 = PFUserCreate();
    if (!v20) {
      return;
    }
    uint64_t v21 = v20;
    if (v18 >= 2)
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      goto LABEL_41;
    }
    PFUserDeleteRules();
    PFUserDeleteRules();
LABEL_66:
    PFUserRelease();
    return;
  }
  if (*(_DWORD *)(v19 + 288) == 103)
  {
    uint64_t v23 = PFUserCreate();
    if (!v23) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v23 = PFUserCreate();
    if (!v23) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)(v2 + 1107) || !*(unsigned char *)(v2 + 1178) || *(_DWORD *)(v2 + 288) == 103)
  {
    int v24 = (unsigned char *)a1[37];
    if (v24[1107] && v24[704] && *(_DWORD *)(a1[35] + 288) != 103)
    {
      if (v24[564]) {
        sub_10002767C();
      }
      uint64_t v22 = PFUserCreate();
      if (!v22) {
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v22 = PFUserCreate();
      if (!v22)
      {
LABEL_60:
        sub_100005EAC();
        goto LABEL_61;
      }
    }
  }
  else
  {
    if (*(_DWORD *)(v2 + 1128) != 500) {
      sub_1000276A8();
    }
    uint64_t v22 = PFUserCreate();
    if (!v22) {
      goto LABEL_60;
    }
  }
  if (v18 <= 1)
  {
    PFUserDeleteRules();
    PFUserDeleteRules();
LABEL_61:
    uint64_t v21 = 0;
    goto LABEL_62;
  }
  uint64_t v21 = 0;
LABEL_41:
  if (!*((unsigned char *)v5 + 352))
  {
    if (*((_DWORD *)v5 + 13) || *((unsigned char *)v5 + 344) && dword_1000394B8)
    {
      if (*(_DWORD *)(a1[35] + 288) == 103)
      {
LABEL_55:
        sub_10001EE20((uint64_t)v5, v23);
        goto LABEL_70;
      }
      sub_10001D2D8((uint64_t)v5, v23);
    }
    else if (*(_DWORD *)(a1[35] + 288) == 103)
    {
      goto LABEL_55;
    }
LABEL_70:
    if (*((unsigned char *)v5 + 281))
    {
      if (*((unsigned char *)v5 + 80) && *(_DWORD *)(a1[35] + 288) != 103)
      {
        sub_10001E150((uint64_t)v5, v22);
        if (v23) {
          goto LABEL_62;
        }
        goto LABEL_63;
      }
    }
    else if (*(unsigned char *)(v2 + 1178) && *(_DWORD *)(v2 + 288) != 103)
    {
      sub_10001DD50((uint64_t)v5, v22);
      if (v23) {
        goto LABEL_62;
      }
      goto LABEL_63;
    }
    sub_10001F7A8((uint64_t)v5, v22);
    if (v23) {
      goto LABEL_62;
    }
    goto LABEL_63;
  }
  sub_10001EBA4((uint64_t)v5, v21);
  if (v23) {
LABEL_62:
  }
    PFUserRelease();
LABEL_63:
  if (v22) {
    PFUserRelease();
  }
  if (v21) {
    goto LABEL_66;
  }
}

uint64_t sub_10001FEFC(char *__s1, int a2, int a3)
{
  uint64_t v6 = &qword_1000393F8;
  while (1)
  {
    uint64_t v6 = (uint64_t *)*v6;
    if (!v6) {
      break;
    }
    uint64_t result = strncmp(__s1, (const char *)v6 + 20, 0x10uLL);
    if (!result)
    {
      if (a2)
      {
        sub_100005EAC();
        uint64_t v8 = PFUserCreate();
        if (!v8) {
          return sub_100005EAC();
        }
        uint64_t v9 = v8;
        uint64_t result = PFUserClearStates();
        if (!a3)
        {
LABEL_7:
          uint64_t v10 = 0;
          if (!v9) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v9 = 0;
        if (!a3) {
          goto LABEL_7;
        }
      }
      sub_100005EAC();
      uint64_t v10 = PFUserCreate();
      if (v10)
      {
        uint64_t result = PFUserClearStates();
        if (!v9) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t result = sub_100005EAC();
        if (!v9)
        {
LABEL_16:
          if (v10)
          {
            return PFUserRelease();
          }
          return result;
        }
      }
LABEL_15:
      uint64_t result = PFUserRelease();
      goto LABEL_16;
    }
  }

  return sub_100005EAC();
}

uint64_t sub_1000200D8(uint64_t a1, int a2, int a3, int a4, _DWORD *a5, __int16 a6)
{
  if ((*(unsigned char *)(a1 + 508) & 8) != 0)
  {
    sub_100005EAC();
    return 80;
  }
  else
  {
    inet_ntop(a4, a5, v23, 0x2Eu);
    if (a4 == 2) {
      size_t v12 = &qword_100038D50;
    }
    else {
      size_t v12 = &qword_100038D60;
    }
    sub_100005EAC();
    uint64_t v13 = *v12;
    if (*v12)
    {
      while (*(unsigned __int8 *)(v13 + 44) != a2 || *(unsigned __int16 *)(v13 + 42) != a3)
      {
        uint64_t v13 = *(void *)v13;
        if (!v13) {
          goto LABEL_9;
        }
      }
      sub_100005EAC();
      return 17;
    }
    else
    {
LABEL_9:
      char v14 = (char *)malloc_type_malloc(0x30uLL, 0x10A00403747CE00uLL);
      size_t v15 = (uint64_t *)v14;
      *((_OWORD *)v14 + 1) = 0u;
      *((_OWORD *)v14 + 2) = 0u;
      *(_OWORD *)char v14 = 0u;
      *((void *)v14 + 2) = a1;
      v14[44] = a2;
      *((_WORD *)v14 + 21) = a3;
      *((_WORD *)v14 + 2sub_100017968(0x3FEu, 1, 0) = a6;
      char v16 = v14 + 24;
      v14[45] = a4;
      if (a4 == 2)
      {
        *char v16 = *a5;
        int v17 = &off_100038D58;
      }
      else
      {
        *(_OWORD *)char v16 = *(_OWORD *)a5;
        int v17 = &off_100038D68;
      }
      uint64_t v19 = *v17;
      *(void *)char v14 = 0;
      *((void *)v14 + 1) = v19;
      *uint64_t v19 = (uint64_t)v14;
      *int v17 = (uint64_t *)v14;
      int v18 = sub_10002031C(a4);
      if (v18)
      {
        uint64_t v20 = *v15;
        uint64_t v21 = (uint64_t *)v15[1];
        if (*v15)
        {
          *(void *)(v20 + ++*(_DWORD *)(result + 8) = v21;
          uint64_t v21 = (uint64_t *)v15[1];
        }
        else
        {
          *int v17 = v21;
        }
        uint64_t *v21 = v20;
        free(v15);
      }
    }
  }
  return (uint64_t)v18;
}

uint64_t *sub_10002031C(int a1)
{
  uint64_t v1 = qword_100039498;
  if (!qword_100039498) {
    return 0;
  }
  while (*(_DWORD *)(v1 + 16) != 1 || !*(unsigned char *)(v1 + 564))
  {
    uint64_t v1 = *(void *)v1;
    if (!v1) {
      return 0;
    }
  }
  if (a1 == 2) {
    return sub_10001D138((char *)(v1 + 308), 0, 0, *(_DWORD *)(v1 + 300));
  }
  else {
    return sub_10001DC54((char *)(v1 + 308), *(_DWORD *)(v1 + 300));
  }
}

uint64_t sub_10002037C(uint64_t a1, int a2, int a3, int a4)
{
  if ((*(unsigned char *)(a1 + 508) & 8) != 0)
  {
    sub_100005EAC();
    return 80;
  }
  else
  {
    if (a4 == 2) {
      uint64_t v7 = &qword_100038D50;
    }
    else {
      uint64_t v7 = &qword_100038D60;
    }
    sub_100005EAC();
    uint64_t v8 = (void *)*v7;
    if (*v7)
    {
      while (*((unsigned __int8 *)v8 + 44) != a2 || *((unsigned __int16 *)v8 + 21) != a3)
      {
        uint64_t v8 = (void *)*v8;
        if (!v8) {
          goto LABEL_9;
        }
      }
      uint64_t v10 = (void *)*v8;
      xpc_object_t v11 = (void *)v8[1];
      if (*v8)
      {
        v10[1] = v11;
        xpc_object_t v11 = (void *)v8[1];
      }
      else
      {
        if (a4 == 2) {
          size_t v12 = &qword_100038D50;
        }
        else {
          size_t v12 = &qword_100038D60;
        }
        v12[1] = (uint64_t)v11;
      }
      void *v11 = v10;
      free(v8);
      return (uint64_t)sub_10002031C(a4);
    }
    else
    {
LABEL_9:
      sub_100005EAC();
      return 2;
    }
  }
}

xpc_object_t sub_100020500(uint64_t a1, int a2)
{
  uint64_t v2 = &qword_100038D60;
  if (a2 == 2) {
    uint64_t v2 = &qword_100038D50;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    xpc_object_t v5 = 0;
    while (*(void *)(v3 + 16) != a1)
    {
LABEL_22:
      uint64_t v3 = *(void *)v3;
      if (!v3) {
        return v5;
      }
    }
    uint64_t v6 = *(unsigned __int8 *)(v3 + 45);
    BOOL v7 = v6 == 30 || v6 == 2;
    if (v7
      && (uint64_t v8 = *(unsigned __int16 *)(v3 + 40), *(_WORD *)(v3 + 40))
      && (uint64_t v9 = *(unsigned __int8 *)(v3 + 44),
          uint64_t v10 = *(unsigned __int16 *)(v3 + 42),
          inet_ntop(*(unsigned __int8 *)(v3 + 45), (const void *)(v3 + 24), string, 0x2Eu)))
    {
      xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
      size_t v12 = v11;
      if (v9) {
        xpc_dictionary_set_uint64(v11, off_100038D08[0], v9);
      }
      if (v10) {
        xpc_dictionary_set_uint64(v12, off_100038D10[0], v10);
      }
      xpc_dictionary_set_uint64(v12, off_100038D20[0], v6);
      xpc_dictionary_set_uint64(v12, off_100038D28, v8);
      xpc_dictionary_set_string(v12, off_100038D18[0], string);
      if (v5) {
        goto LABEL_21;
      }
    }
    else
    {
      size_t v12 = 0;
      if (v5)
      {
LABEL_21:
        xpc_array_append_value(v5, v12);
        xpc_release(v12);
        goto LABEL_22;
      }
    }
    xpc_object_t v5 = xpc_array_create(0, 0);
    goto LABEL_21;
  }
  return 0;
}

void sub_1000206B8(uint64_t a1, int a2)
{
  if (a2 == 2) {
    uint64_t v2 = &qword_100038D50;
  }
  else {
    uint64_t v2 = &qword_100038D60;
  }
  uint64_t v3 = (void *)*v2;
  if (*v2)
  {
    if (a2 == 2) {
      xpc_object_t v5 = &qword_100038D50;
    }
    else {
      xpc_object_t v5 = &qword_100038D60;
    }
    do
    {
      uint64_t v6 = (void *)*v3;
      if (v3[2] == a1)
      {
        inet_ntop(*((unsigned __int8 *)v3 + 45), v3 + 3, v9, 0x2Eu);
        sub_100005EAC();
        BOOL v7 = (void *)*v3;
        uint64_t v8 = (void *)v3[1];
        if (*v3)
        {
          v7[1] = v8;
          uint64_t v8 = (void *)v3[1];
        }
        else
        {
          v5[1] = (uint64_t)v8;
        }
        *uint64_t v8 = v7;
        free(v3);
      }
      uint64_t v3 = v6;
    }
    while (v6);
  }
}

uint64_t sub_1000207F0(int a1)
{
  int v5 = a1;
  *(_OWORD *)uint64_t v6 = xmmword_100029200;
  int v1 = dword_100039400;
  if (a1)
  {
    ++dword_100039400;
    if (v1 > 0) {
      return 0;
    }
  }
  else
  {
    --dword_100039400;
    if (v1 != 1) {
      return 0;
    }
  }
  uint64_t v3 = sysctl(v6, 4u, 0, 0, &v5, 4uLL);
  if ((v3 & 0x80000000) != 0) {
    uint64_t v2 = *__error();
  }
  else {
    uint64_t v2 = v3;
  }
  sub_100005EAC();
  return v2;
}

uint64_t sub_1000208E4(int a1)
{
  int v5 = a1;
  *(_OWORD *)uint64_t v6 = xmmword_100029210;
  int v1 = dword_100039404;
  if (a1)
  {
    ++dword_100039404;
    if (v1 > 0) {
      return 0;
    }
  }
  else
  {
    --dword_100039404;
    if (v1 != 1) {
      return 0;
    }
  }
  uint64_t v3 = sysctl(v6, 4u, 0, 0, &v5, 4uLL);
  if ((v3 & 0x80000000) != 0) {
    uint64_t v2 = *__error();
  }
  else {
    uint64_t v2 = v3;
  }
  sub_100005EAC();
  return v2;
}

uint64_t sub_1000209D8(const char *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (!v10)
  {
    sub_100005EAC();
    return 12;
  }
  xpc_object_t v11 = v10;
  xpc_dictionary_set_uint64(v10, kPFAction, 2uLL);
  xpc_dictionary_set_uint64(v11, kPFProtocol, a2);
  xpc_dictionary_set_string(v11, kPFInterface, a1);
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  if (!v12)
  {
    sub_100005EAC();
    xpc_release(v11);
    return 12;
  }
  uint64_t v13 = v12;
  xpc_dictionary_set_uint64(v12, kPFSubScrubMaxMSS, a3);
  xpc_dictionary_set_uint64(v13, kPFSubScrubFlags, 0x100uLL);
  xpc_dictionary_set_value(v11, kPFScrubOptions, v13);
  if (sub_100021724(a4, a5, v11))
  {
    uint64_t v14 = 0;
  }
  else
  {
    sub_100005EAC();
    uint64_t v14 = 22;
  }
  xpc_release(v13);
  xpc_release(v11);
  return v14;
}

uint64_t sub_100020B54(const char *a1, unsigned int a2, const char *a3, int a4, uint64_t a5, uint64_t a6)
{
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  if (!v12)
  {
    sub_100005EAC();
    return 12;
  }
  uint64_t v13 = v12;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)stat __str = 0u;
  long long v21 = 0u;
  snprintf(__str, 0x100uLL, "%s:0", a1);
  xpc_dictionary_set_string(v13, kPFSubDynInterface, __str);
  xpc_dictionary_set_uint64(v13, kPFSubLowPort, 0x8000uLL);
  xpc_dictionary_set_uint64(v13, kPFSubHighPort, 0xBFFFuLL);
  xpc_dictionary_set_uint64(v13, kPFSubPortOperator, 0);
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  if (!v14)
  {
    sub_100005EAC();
    xpc_release(v13);
    return 12;
  }
  size_t v15 = v14;
  xpc_dictionary_set_uint64(v14, kPFAction, 4uLL);
  xpc_dictionary_set_string(v15, kPFInterface, a1);
  xpc_dictionary_set_uint64(v15, kPFFamily, a2);
  xpc_dictionary_set_uint64(v15, kPFExtFilter, 3uLL);
  xpc_dictionary_set_uint64(v15, kPFExtMap, 3uLL);
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  if (v16)
  {
    int v17 = v16;
    snprintf(__str, 0x100uLL, "%s/%d", a3, a4);
    xpc_dictionary_set_string(v17, kPFSubAddress, __str);
    xpc_dictionary_set_value(v15, kPFFrom, v17);
    xpc_dictionary_set_value(v15, kPFNATRDRAddress, v13);
    if (sub_100021724(a5, a6, v15))
    {
      uint64_t v18 = 0;
    }
    else
    {
      sub_100005EAC();
      uint64_t v18 = 22;
    }
    xpc_release(v13);
  }
  else
  {
    sub_100005EAC();
    uint64_t v18 = 12;
    int v17 = v13;
  }
  xpc_release(v17);
  xpc_release(v15);
  return v18;
}

uint64_t sub_100020E30(const char *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2) {
    BOOL v7 = &qword_100038D50;
  }
  else {
    BOOL v7 = &qword_100038D60;
  }
  while (1)
  {
    BOOL v7 = (uint64_t *)*v7;
    if (!v7) {
      break;
    }
    uint64_t result = sub_1000217C8(a1, *((unsigned __int8 *)v7 + 44), *((unsigned __int16 *)v7 + 21), *((unsigned __int16 *)v7 + 21), *((unsigned __int16 *)v7 + 20), *((unsigned __int16 *)v7 + 20), *((unsigned __int8 *)v7 + 45), v7 + 3, a3, a4);
    if (result) {
      return result;
    }
  }
  return 0;
}

uint64_t sub_100020EBC(const char *a1, const char *a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9, int a10, int a11, uint64_t a12, uint64_t a13)
{
  int v33 = a11;
  uint64_t v19 = sub_1000217C8(a2, a5, a6, a7, a8, a9, 2u, &v33, a12, a13);
  if (v19) {
    return v19;
  }
  int v34 = v33;
  int v35 = a3;
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  if (!v21)
  {
    sub_100005EAC();
    return 12;
  }
  long long v22 = v21;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)stat __str = 0u;
  snprintf(__str, 0x100uLL, "%s:0", a2);
  xpc_dictionary_set_string(v22, kPFSubDynInterface, __str);
  xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
  long long v24 = v23;
  if (v23
    && (xpc_dictionary_set_uint64(v23, kPFAction, 4uLL),
        xpc_dictionary_set_string(v24, kPFInterface, a1),
        xpc_dictionary_set_uint64(v24, kPFProtocol, a5),
        xpc_dictionary_set_uint64(v24, kPFFamily, 2uLL),
        (xpc_object_t v25 = xpc_dictionary_create(0, 0, 0)) != 0))
  {
    long long v26 = v25;
    inet_ntop(2, &v35, string, 0x10u);
    unsigned int v27 = bswap32(a4);
    if ((v27 & 0x80000000) != 0)
    {
      int v30 = 0;
      do
        char v31 = v30-- + 30;
      while (((v27 >> v31) & 1) != 0);
      int v28 = -v30;
    }
    else
    {
      int v28 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", string, v28);
    xpc_dictionary_set_string(v26, kPFSubAddress, __str);
    xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
    if (v29)
    {
      uint64_t v32 = 2;
      inet_ntop(2, &v34, string, 0x10u);
      xpc_dictionary_set_string(v29, kPFSubAddress, string);
      xpc_dictionary_set_uint64(v29, kPFSubLowPort, a8);
      if (a8 != a9)
      {
        xpc_dictionary_set_uint64(v29, kPFSubHighPort, a9);
        uint64_t v32 = 9;
      }
      xpc_dictionary_set_uint64(v29, kPFSubPortOperator, v32);
      xpc_dictionary_set_uint64(v22, kPFSubLowPort, 0x8000uLL);
      xpc_dictionary_set_uint64(v22, kPFSubHighPort, 0xBFFFuLL);
      xpc_dictionary_set_uint64(v22, kPFSubPortOperator, 0);
      xpc_dictionary_set_uint64(v24, kPFExtFilter, 1uLL);
      xpc_dictionary_set_uint64(v24, kPFExtMap, 1uLL);
      xpc_dictionary_set_value(v24, kPFFrom, v26);
      xpc_dictionary_set_value(v24, kPFTo, v29);
      xpc_dictionary_set_value(v24, kPFNATRDRAddress, v22);
      if (sub_100021724(a12, a13, v24))
      {
        uint64_t v19 = 0;
      }
      else
      {
        sub_100005EAC();
        uint64_t v19 = 22;
      }
    }
    else
    {
      sub_100005EAC();
      uint64_t v19 = 12;
    }
    xpc_release(v22);
    xpc_release(v26);
    if (!v29) {
      goto LABEL_23;
    }
  }
  else
  {
    sub_100005EAC();
    uint64_t v19 = 12;
    xpc_object_t v29 = v22;
  }
  xpc_release(v29);
LABEL_23:
  if (v24) {
    xpc_release(v24);
  }
  return v19;
}

uint64_t sub_100021304(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    sub_100005EAC();
    return 12;
  }
  uint64_t v9 = v8;
  xpc_dictionary_set_uint64(v8, kPFAction, 0);
  xpc_dictionary_set_uint64(v9, kPFFamily, a4);
  xpc_dictionary_set_string(v9, kPFInterface, a1);
  xpc_dictionary_set_uint64(v9, kPFKeepState, 1uLL);
  xpc_dictionary_set_uint64(v9, kPFExtFilter, 1uLL);
  if ((sub_100021724(a2, a3, v9) & 1) == 0)
  {
    sub_100005EAC();
    uint64_t v12 = 22;
LABEL_9:
    uint64_t v13 = v9;
LABEL_19:
    xpc_release(v13);
    return v12;
  }
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (!v10)
  {
    sub_100005EAC();
    uint64_t v12 = 12;
    goto LABEL_9;
  }
  xpc_object_t v11 = v10;
  xpc_dictionary_set_uint64(v10, kPFAction, 0);
  xpc_dictionary_set_uint64(v11, kPFFamily, a4);
  xpc_dictionary_set_string(v11, kPFInterface, a1);
  xpc_dictionary_set_uint64(v11, kPFProtocol, 0x32uLL);
  if (sub_100021724(a2, a3, v11))
  {
    uint64_t v12 = 0;
  }
  else
  {
    sub_100005EAC();
    uint64_t v12 = 22;
  }
  if (a4 == 2)
  {
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    size_t v15 = v14;
    if (v14)
    {
      xpc_dictionary_set_uint64(v14, kPFAction, 0);
      xpc_dictionary_set_uint64(v15, kPFFamily, 2uLL);
      xpc_dictionary_set_uint64(v15, kPFProtocol, 2uLL);
      xpc_dictionary_set_uint64(v15, kPFKeepState, 1uLL);
      xpc_dictionary_set_BOOL(v15, kPFAllowOpts, 1);
      if ((sub_100021724(a2, a3, v15) & 1) == 0)
      {
        sub_100005EAC();
        uint64_t v12 = 22;
      }
    }
    else
    {
      sub_100005EAC();
      uint64_t v12 = 12;
    }
  }
  else
  {
    size_t v15 = 0;
  }
  xpc_release(v9);
  xpc_release(v11);
  if (v15)
  {
    uint64_t v13 = v15;
    goto LABEL_19;
  }
  return v12;
}

uint64_t sub_1000215D4(const char *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v7 = if_nametoindex(a1);
  if (v7)
  {
    unsigned int v8 = v7;
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      xpc_object_t v10 = v9;
      xpc_dictionary_set_uint64(v9, kPFAction, 0);
      xpc_dictionary_set_string(v10, kPFInterface, a2);
      xpc_dictionary_set_uint64(v10, kPFRTableID, v8);
      xpc_dictionary_set_uint64(v10, kPFKeepState, 1uLL);
      xpc_dictionary_set_uint64(v10, kPFExtFilter, 1uLL);
      if (sub_100021724(a3, a4, v10))
      {
        uint64_t v11 = 0;
      }
      else
      {
        sub_100005EAC();
        uint64_t v11 = 22;
      }
      xpc_release(v10);
    }
    else
    {
      sub_100005EAC();
      return 12;
    }
  }
  else
  {
    sub_100005EAC();
    return 6;
  }
  return v11;
}

uint64_t sub_100021724(uint64_t a1, uint64_t a2, xpc_object_t xdict)
{
  if (byte_100039485)
  {
    uint64_t v6 = (void *)qword_100039408;
    if (!qword_100039408)
    {
      qword_100039408 = (uint64_t)xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64((xpc_object_t)qword_100039408, kPFSubLogFlags, 1uLL);
      uint64_t v6 = (void *)qword_100039408;
    }
    xpc_dictionary_set_value(xdict, kPFLog, v6);
  }

  return _PFUserAddRule(a1, a2, xdict);
}

uint64_t sub_1000217C8(const char *a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, const void *a8, uint64_t a9, uint64_t a10)
{
  if (a3 > a4 || a5 > a6) {
    sub_1000276D4();
  }
  if (a4 - a3 != a6 - a5) {
    sub_100027700();
  }
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  if (!v18)
  {
    sub_100005EAC();
    return 12;
  }
  uint64_t v19 = v18;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(_OWORD *)stat __str = 0u;
  long long v31 = 0u;
  inet_ntop(a7, a8, string, 0x2Eu);
  xpc_dictionary_set_string(v19, kPFSubAddress, string);
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  if (!v20)
  {
    sub_100005EAC();
    xpc_release(v19);
    return 12;
  }
  xpc_object_t v21 = v20;
  xpc_dictionary_set_uint64(v20, kPFAction, 8uLL);
  xpc_dictionary_set_uint64(v21, kPFProtocol, a2);
  xpc_dictionary_set_string(v21, kPFInterface, a1);
  xpc_dictionary_set_uint64(v21, kPFFamily, a7);
  xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
  if (v22)
  {
    xpc_object_t v23 = v22;
    snprintf(__str, 0x100uLL, "%s:0", a1);
    xpc_dictionary_set_string(v23, kPFSubDynInterface, __str);
    xpc_dictionary_set_uint64(v23, kPFSubLowPort, a3);
    if (a3 == a4)
    {
      uint64_t v24 = 2;
    }
    else
    {
      xpc_dictionary_set_uint64(v23, kPFSubHighPort, a4);
      uint64_t v24 = 9;
    }
    xpc_dictionary_set_uint64(v23, kPFSubPortOperator, v24);
    long long v26 = (const char **)&kPFSubLowPort;
    if (a5 == a6)
    {
      uint64_t v27 = 2;
      unsigned int v28 = a5;
    }
    else
    {
      xpc_dictionary_set_uint64(v19, kPFSubLowPort, a5);
      long long v26 = (const char **)&kPFSubHighPort;
      uint64_t v27 = 9;
      unsigned int v28 = a6;
    }
    xpc_dictionary_set_uint64(v19, *v26, v28);
    xpc_dictionary_set_uint64(v19, kPFSubPortOperator, v27);
    xpc_dictionary_set_value(v21, kPFTo, v23);
    xpc_dictionary_set_value(v21, kPFNATRDRAddress, v19);
    if (sub_100021724(a9, a10, v21))
    {
      sub_100005EAC();
      uint64_t v25 = 0;
    }
    else
    {
      sub_100005EAC();
      uint64_t v25 = 22;
    }
    xpc_release(v19);
  }
  else
  {
    sub_100005EAC();
    uint64_t v25 = 12;
    xpc_object_t v23 = v19;
  }
  xpc_release(v23);
  xpc_release(v21);
  return v25;
}

uint64_t sub_100021B9C(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    xpc_object_t v9 = v8;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)string = 0u;
    long long v17 = 0u;
    xpc_dictionary_set_uint64(v8, kPFAction, 0);
    xpc_dictionary_set_uint64(v9, kPFDirection, a4);
    xpc_dictionary_set_string(v9, kPFInterface, a1);
    xpc_dictionary_set_uint64(v9, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v9, kPFKeepState, 1uLL);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      uint64_t v11 = v10;
      strcpy(string, "fe80::/10");
      xpc_dictionary_set_string(v10, kPFSubAddress, string);
      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      if (v12)
      {
        uint64_t v13 = v12;
        xpc_dictionary_set_string(v12, kPFSubAddressLabel, kPFAny);
        xpc_dictionary_set_value(v9, kPFFrom, v11);
        xpc_dictionary_set_value(v9, kPFTo, v13);
        if (sub_100021724(a2, a3, v9))
        {
          uint64_t v14 = 0;
        }
        else
        {
          sub_100005EAC();
          uint64_t v14 = 22;
        }
        xpc_release(v11);
        xpc_release(v13);
        goto LABEL_12;
      }
      sub_100005EAC();
      xpc_release(v11);
    }
    else
    {
      sub_100005EAC();
    }
    uint64_t v14 = 12;
LABEL_12:
    xpc_release(v9);
    return v14;
  }
  sub_100005EAC();
  return 12;
}

uint64_t sub_100021DFC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, const void *a7, int a8)
{
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  if (v16)
  {
    long long v17 = v16;
    xpc_dictionary_set_uint64(v16, kPFAction, 0);
    xpc_dictionary_set_uint64(v17, kPFDirection, a6);
    xpc_dictionary_set_string(v17, kPFInterface, a2);
    xpc_dictionary_set_uint64(v17, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v17, kPFKeepState, 1uLL);
    if (a5)
    {
      unsigned int v18 = if_nametoindex((const char *)(a1 + 20));
      if (!v18)
      {
        sub_100005EAC();
        uint64_t v23 = 6;
        goto LABEL_16;
      }
      xpc_dictionary_set_uint64(v17, kPFRTableID, v18);
    }
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    if (v19)
    {
      long long v20 = v19;
      inet_ntop(30, a7, v26, 0x2Eu);
      snprintf(__str, 0x36uLL, "%s/%d", v26, a8);
      xpc_dictionary_set_string(v20, kPFSubAddress, __str);
      xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
      if (v21)
      {
        long long v22 = v21;
        xpc_dictionary_set_string(v21, kPFSubAddressLabel, kPFAny);
        xpc_dictionary_set_value(v17, kPFFrom, v20);
        xpc_dictionary_set_value(v17, kPFTo, v22);
        if (sub_100021724(a3, a4, v17))
        {
          uint64_t v23 = 0;
        }
        else
        {
          sub_100005EAC();
          uint64_t v23 = 22;
        }
        xpc_release(v20);
        xpc_release(v22);
        goto LABEL_16;
      }
      sub_100005EAC();
      xpc_release(v20);
    }
    else
    {
      sub_100005EAC();
    }
    uint64_t v23 = 12;
LABEL_16:
    xpc_release(v17);
    return v23;
  }
  sub_100005EAC();
  return 12;
}

id sub_100022148(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  qword_100039418 = (uint64_t)result;
  return result;
}

id sub_1000223BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleCTNotification:a2 notificationInfo:a3];
}

id sub_100022718(uint64_t a1, void *a2)
{
  [objc_msgSend(a2, "description") UTF8String];
  sub_100005EAC();
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 activateTethering:0];
}

id sub_100022FA0(uint64_t a1)
{
  uint64_t v2 = +[misCTClientSharedInstance sharedInstance];

  return (id)[(misCTClientSharedInstance *)v2 activateTethering:a1];
}

id sub_100022FE0(uint64_t a1)
{
  uint64_t v2 = +[misCTClientSharedInstance sharedInstance];

  return (id)[(misCTClientSharedInstance *)v2 getTetheringStatus:a1];
}

id sub_100023020(uint64_t a1)
{
  uint64_t v2 = +[misCTClientSharedInstance sharedInstance];

  return (id)[(misCTClientSharedInstance *)v2 isDataPlanEnabled:a1];
}

id sub_100023060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = +[misCTClientSharedInstance sharedInstance];

  return (id)[(misCTClientSharedInstance *)v6 registerCellularDataStatusNotification:a1 callback:a2 callbackArg:a3];
}

uint64_t sub_1000230B8(uint64_t a1)
{
  uint64_t v1 = [+[misCTClientSharedInstance sharedInstance] getTetheringInterfaceName:a1];
  sub_100005EAC();
  return v1;
}

id sub_100023130()
{
  __int16 v0 = +[misCTClientSharedInstance sharedInstance];

  return (id)[(misCTClientSharedInstance *)v0 isDualSim];
}

id sub_100023160()
{
  __int16 v0 = +[misCTClientSharedInstance sharedInstance];

  return [(misCTClientSharedInstance *)v0 _updateDualSimStatus];
}

uint64_t sub_100023190()
{
  if (!dword_100038D3C) {
    return 0;
  }
  if (qword_100039420 || (qword_100039420 = (uint64_t)dispatch_semaphore_create(0)) != 0)
  {
    unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
    uint64_t result = 0;
    byte_100039428 = 1;
  }
  else
  {
    sub_100005EAC();
    return 12;
  }
  return result;
}

void sub_100023210()
{
  if (byte_100039428 == 1)
  {
    if (qword_100039420)
    {
      dispatch_release((dispatch_object_t)qword_100039420);
      qword_100039420 = 0;
    }
    byte_100039428 = 0;
  }
}

uint64_t sub_100023254()
{
  if (!dword_100038D3C) {
    return 0;
  }
  if (dword_10003942C < 0)
  {
    int v1 = -1;
    uint64_t v0 = 2;
  }
  else if (!dword_10003942C {
         && access("/usr/sbin/rtadvd", 0)
  }
         && (uint64_t v0 = *__error(), sub_100005EAC(), v0))
  {
    int v1 = -1;
  }
  else
  {
    uint64_t v0 = 0;
    int v1 = dword_10003942C + 1;
  }
  dword_10003942C = v1;
  return v0;
}

uint64_t sub_100023308()
{
  posix_spawnattr_t v39 = 0;
  posix_spawn_file_actions_t v40 = 0;
  pid_t v38 = 0;
  uint64_t v0 = &byte_100038F58[168];
  if (dword_10003942C < 0 || !dword_100038D3C || !dword_1000394D4)
  {
    sub_100005EAC();
    uint64_t v2 = 0;
    goto LABEL_144;
  }
  pid_t v1 = dword_100039430;
  if (dword_100039430)
  {
    if (!qword_100039438) {
      sub_100027808();
    }
    if (kill(dword_100039430, 0) != 3)
    {
      unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
      if (sub_100023F74(v1, (dispatch_queue_t)qword_100039478))
      {
        sub_100005EAC();
      }
      else
      {
        if (qword_100039438)
        {
          dispatch_source_cancel((dispatch_source_t)qword_100039438);
          dispatch_release((dispatch_object_t)qword_100039438);
          qword_100039438 = 0;
        }
        sub_100005EAC();
        kill(v1, 9);
        dispatch_semaphore_wait((dispatch_semaphore_t)qword_100039420, 0xFFFFFFFFFFFFFFFFLL);
        dword_100039430 = 0;
      }
    }
  }
  uint64_t v3 = (char **)malloc_type_malloc(8 * dword_1000394D4 + 48, 0x10040436913F5uLL);
  *uint64_t v3 = "rtadvd";
  v3[1] = "-c";
  v3[2] = "/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf";
  v3[3] = "-f";
  v3[4] = "-s";
  uint64_t v4 = &qword_100039498;
  do
  {
    uint64_t v4 = (uint64_t *)*v4;
    if (!v4)
    {
      uint64_t v14 = qword_100039498;
      if (!qword_100039498)
      {
LABEL_45:
        uint64_t v2 = 0;
        goto LABEL_143;
      }
      char v15 = 0;
      int v16 = 5;
      do
      {
        if (!*(_DWORD *)(v14 + 16)
          && *(unsigned char *)(v14 + 700)
          && *(_DWORD *)(v14 + 20) == 201
          && !strncmp((const char *)(v14 + 565), off_100038CB0[0], 0x10uLL))
        {
          if (!*(unsigned char *)(v14 + 1178)) {
            sub_1000277B0();
          }
          v3[v16++] = (char *)(v14 + 308);
          char v15 = 1;
        }
        uint64_t v14 = *(void *)v14;
      }
      while (v14);
      uint64_t v17 = qword_100039498;
      if (!qword_100039498)
      {
LABEL_58:
        v3[v16] = 0;
        if (v15) {
          goto LABEL_28;
        }
        goto LABEL_59;
      }
      while (1)
      {
        if (*(unsigned char *)(v17 + 1107))
        {
          if (*(unsigned char *)(v17 + 704)) {
            goto LABEL_51;
          }
        }
        else if (*(unsigned char *)(v17 + 1105))
        {
LABEL_51:
          for (uint64_t i = qword_100039498; i; uint64_t i = *(void *)i)
          {
            if (*(unsigned char *)(i + 700)
              && *(_DWORD *)(i + 20) == 201
              && !strncmp((const char *)(i + 565), (const char *)(v17 + 308), 0x10uLL))
            {
              v3[v16++] = (char *)(i + 308);
              char v15 = 1;
            }
          }
        }
        uint64_t v17 = *(void *)v17;
        if (!v17) {
          goto LABEL_58;
        }
      }
    }
  }
  while (*((_DWORD *)v4 + 282) != 502);
  sub_100005EAC();
  int v5 = &qword_100039498;
  do
  {
    int v5 = (uint64_t *)*v5;
    if (!v5) {
      goto LABEL_45;
    }
  }
  while (*((_DWORD *)v5 + 4) != 1);
  uint64_t v6 = qword_100039498;
  if (!qword_100039498) {
    goto LABEL_45;
  }
  char v7 = 0;
  xpc_object_t v8 = (char *)v5 + 308;
  int v9 = 5;
  do
  {
    if (*(unsigned char *)(v6 + 700) && *(_DWORD *)(v6 + 20) == 201 && !strncmp((const char *)(v6 + 565), v8, 0x10uLL))
    {
      if (*(_DWORD *)(v6 + 1128) != 502) {
        sub_1000277DC();
      }
      v3[v9++] = (char *)(v6 + 308);
      char v7 = 1;
    }
    uint64_t v6 = *(void *)v6;
  }
  while (v6);
  v3[v9] = 0;
  if ((v7 & 1) == 0)
  {
LABEL_59:
    uint64_t v2 = 0;
    goto LABEL_143;
  }
LABEL_28:
  snprintf((char *)__str, 0x100uLL, "%s-", "/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
  xpc_object_t v10 = fopen((const char *)__str, "w");
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v2 = qword_100039498;
    if (qword_100039498)
    {
      uint64_t v12 = qword_100039498;
      while (*(_DWORD *)(v12 + 16) != 1 || !*(unsigned char *)(v12 + 564))
      {
        uint64_t v12 = *(void *)v12;
        if (!v12)
        {
          char v13 = 1;
          goto LABEL_63;
        }
      }
      if (strncmp((const char *)(v12 + 308), off_100038CB0[0], 0x10uLL)) {
        sub_100027784();
      }
      char v13 = 0;
      do
      {
LABEL_63:
        if (!*(_DWORD *)(v2 + 16)
          && *(unsigned char *)(v2 + 700)
          && *(_DWORD *)(v2 + 20) == 201
          && !strncmp((const char *)(v2 + 565), off_100038CB0[0], 0x10uLL))
        {
          if (!*(unsigned char *)(v2 + 1178)) {
            sub_100027758();
          }
          fprintf(v11, "%s:\\\n", (const char *)(v2 + 308));
          fprintf(v11, "\t:maxinterval#%u", 135);
          fprintf(v11, ":mininterval#%u:\\\n", 45);
          fputc(9, v11);
          int v19 = sub_100011674(v2);
          int v20 = dword_1000394BC;
          if (!v19 && dword_1000394BC)
          {
            fprintf(v11, ":raflags#%u", 64);
            int v20 = dword_1000394BC;
          }
          BOOL v21 = v20 == 0;
          int v22 = 9000;
          if (v21) {
            int v22 = 0;
          }
          fprintf(v11, ":rltime#%u:\\\n", v22);
          fprintf(v11, "\t:addr=\"%s\":prefixlen#%u:pinfoflags#%u\\\n", (const char *)(v2 + 1132), *(unsigned __int8 *)(v2 + 1178), 192);
          if (*(_DWORD *)(v2 + 664) || *(_DWORD *)(v2 + 668) || *(_DWORD *)(v2 + 672) || *(_DWORD *)(v2 + 676))
          {
            fwrite("\t:rdnssaddrs#1:\\\n", 0x11uLL, 1uLL, v11);
            inet_ntop(30, (const void *)(v2 + 664), v42, 0x2Eu);
            fprintf(v11, "\t:rdnssaddr%d=\"%s\":\\\n", 0, v42);
          }
          if ((v13 & 1) == 0)
          {
            unsigned int v23 = *(_DWORD *)(v12 + 296);
            if (v23 >= *(_DWORD *)(v2 + 296)) {
              unsigned int v23 = *(_DWORD *)(v2 + 296);
            }
            fprintf(v11, "\t:mtu#%u\n", v23);
          }
        }
        uint64_t v2 = *(void *)v2;
      }
      while (v2);
      uint64_t v24 = qword_100039498;
      if (qword_100039498)
      {
        while (2)
        {
          if (!*(_DWORD *)(v24 + 16)) {
            goto LABEL_130;
          }
          int v25 = *(unsigned __int8 *)(v24 + 1107);
          if (*(unsigned char *)(v24 + 1107))
          {
            if (!*(unsigned char *)(v24 + 704)) {
              goto LABEL_130;
            }
          }
          else if (!*(unsigned char *)(v24 + 1105) && *(_DWORD *)(v24 + 1128) != 502)
          {
LABEL_130:
            uint64_t v24 = *(void *)v24;
            if (!v24) {
              goto LABEL_131;
            }
            continue;
          }
          break;
        }
        uint64_t v26 = qword_100039498;
        if (!qword_100039498) {
          goto LABEL_130;
        }
        long long v27 = (const char *)(v24 + 308);
        uint64_t v28 = 848;
        if (!*(unsigned char *)(v24 + 1107)) {
          uint64_t v28 = 296;
        }
        uint64_t v37 = v28;
        while (2)
        {
          if (*(unsigned char *)(v26 + 700)
            && *(_DWORD *)(v26 + 20) == 201
            && !strncmp((const char *)(v26 + 565), v27, 0x10uLL))
          {
            fprintf(v11, "%s:\\\n", (const char *)(v26 + 308));
            fprintf(v11, "\t:maxinterval#%u", 135);
            fprintf(v11, ":mininterval#%u:\\\n", 45);
            if (v25) {
              fprintf(v11, "\t:chlim#%u", *(unsigned __int8 *)(v24 + 876));
            }
            else {
              fputc(9, v11);
            }
            if (!sub_100011674(v26) && *(_DWORD *)(v26 + 1128) != 502) {
              fprintf(v11, ":raflags#%u", 64);
            }
            if (v25)
            {
              unsigned int v29 = *(unsigned __int16 *)(v24 + 814);
              if (v29 >= 0x2328) {
                unsigned int v29 = 9000;
              }
              fprintf(v11, ":rltime#%u", v29);
              fprintf(v11, ":rtime#%u", 1000 * *(_DWORD *)(v24 + 860));
              fprintf(v11, ":retrans#%u:\\\n", *(_DWORD *)(v24 + 864));
              inet_ntop(30, (const void *)(v24 + 720), v42, 0x2Eu);
              if (*(unsigned char *)(v24 + 904))
              {
                fprintf(v11, "\t:addr0=\"%s\":prefixlen0#%u:pinfoflags0#%u", v42, *(unsigned __int8 *)(v24 + 741), 192);
                fprintf(v11, ":vltime0#%lu", *(void *)(v24 + 744));
                fwrite(":vltimedecr0#true", 0x11uLL, 1uLL, v11);
                fprintf(v11, ":pltime0#%lu", *(void *)(v24 + 752));
                fwrite(":pltimedecr0#true:\\\n", 0x14uLL, 1uLL, v11);
                inet_ntop(30, (const void *)(v24 + 920), v42, 0x2Eu);
                long long v27 = (const char *)(v24 + 308);
                fprintf(v11, "\t:addr1=\"%s\":prefixlen1#%u:pinfoflags1#%u", v42, *(unsigned __int8 *)(v24 + 741), 192);
                fwrite(":vltime1#0", 0xAuLL, 1uLL, v11);
                long long v30 = ":pltime1#0:\\\n";
                size_t v31 = 13;
              }
              else
              {
                fprintf(v11, "\t:addr=\"%s\":prefixlen#%u:pinfoflags#%u", v42, *(unsigned __int8 *)(v24 + 741), 192);
                fprintf(v11, ":vltime#%lu", *(void *)(v24 + 744));
                fwrite(":vltimedecr#true", 0x10uLL, 1uLL, v11);
                fprintf(v11, ":pltime#%lu", *(void *)(v24 + 752));
                long long v30 = ":pltimedecr#true:\\\n";
                size_t v31 = 19;
              }
              fwrite(v30, v31, 1uLL, v11);
              if (*(_DWORD *)(v24 + 1264) == 1 && !byte_100039483)
              {
                if (!inet_ntop(30, (const void *)(v24 + 1244), v41, 0x2Eu))
                {
                  uint64_t v2 = *__error();
                  sub_100005EAC();
                  fclose(v11);
                  uint64_t v0 = byte_100038F58 + 168;
                  goto LABEL_134;
                }
LABEL_116:
                fprintf(v11, "\t:pref64addr=\"%s\":pref64len#%u:pref64lifetime#%u:\\\n");
              }
            }
            else
            {
              fprintf(v11, ":rltime#%u:\\\n", 9000);
              if (*(_DWORD *)(v26 + 1128) == 502)
              {
                fprintf(v11, "\t:addr0=\"%s\":prefixlen0#%u:pinfoflags0#%u:\\\n", (const char *)(v26 + 1132), 64, 192);
                if (!byte_100039483) {
                  goto LABEL_116;
                }
              }
              else
              {
                fprintf(v11, "\t:addr0=\"%s\":prefixlen0#%u:pinfoflags0#%u:\\\n");
              }
            }
            if (*(_DWORD *)(v26 + 664) || *(_DWORD *)(v26 + 668) || *(_DWORD *)(v26 + 672) || *(_DWORD *)(v26 + 676))
            {
              fwrite("\t:rdnssaddrs#1:\\\n", 0x11uLL, 1uLL, v11);
              long long v27 = (const char *)(v24 + 308);
              inet_ntop(30, (const void *)(v26 + 664), v42, 0x2Eu);
              fprintf(v11, "\t:rdnssaddr%d=\"%s\":\\\n", 0, v42);
            }
            else if (*(_DWORD *)(v26 + 1128) == 502)
            {
              sub_100005EAC();
              uint64_t v2 = 6;
              goto LABEL_132;
            }
            unsigned int v32 = *(_DWORD *)(v26 + 296);
            if (*(_DWORD *)(v24 + v37) < v32) {
              unsigned int v32 = *(_DWORD *)(v24 + v37);
            }
            fprintf(v11, "\t:mtu#%u\n", v32);
          }
          uint64_t v26 = *(void *)v26;
          if (!v26) {
            goto LABEL_130;
          }
          continue;
        }
      }
LABEL_131:
      uint64_t v2 = 0;
LABEL_132:
      uint64_t v0 = &byte_100038F58[168];
    }
    fclose(v11);
    rename(__str, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf", v33);
  }
  else
  {
    uint64_t v2 = *__error();
    sub_100005EAC();
  }
LABEL_134:
  if (v2)
  {
    strerror(v2);
    sub_100005EAC();
  }
  else
  {
    uint64_t v2 = sub_100011B48(&v39, &v40);
    if (!v2)
    {
      uint64_t v34 = posix_spawn(&v38, "/usr/sbin/rtadvd", &v40, &v39, v3, environ);
      uint64_t v2 = v34;
      if (v34)
      {
        strerror(v34);
        sub_100005EAC();
      }
      else
      {
        sub_100005EAC();
        pid_t v35 = v38;
        *((_DWORD *)v0 + 26++*(_DWORD *)(result + 8) = v38;
        if (sub_100023F74(v35, (dispatch_queue_t)qword_100039470))
        {
          sub_100005EAC();
          sub_100024064();
        }
      }
      posix_spawnattr_destroy(&v39);
      posix_spawn_file_actions_destroy(&v40);
    }
  }
LABEL_143:
  free(v3);
  if (!v2)
  {
LABEL_144:
    if (*((_DWORD *)v0 + 268)) {
      sub_100005EAC();
    }
  }
  return v2;
}

uint64_t sub_100023F74(int a1, dispatch_queue_t queue)
{
  uint64_t v3 = qword_100039478;
  uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a1, 0x80000000uLL, queue);
  int v5 = v4;
  if (v3 == queue)
  {
    if (v4)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_1000241C4;
      handler[3] = &unk_100035060;
      handler[4] = v4;
      dispatch_source_set_event_handler(v4, handler);
      uint64_t v6 = v5;
      goto LABEL_6;
    }
  }
  else
  {
    qword_100039438 = (uint64_t)v4;
    if (v4)
    {
      dispatch_source_set_event_handler(v4, &stru_1000350A0);
      uint64_t v6 = qword_100039438;
LABEL_6:
      dispatch_resume(v6);
      return 0;
    }
  }
  return 12;
}

void sub_100024064()
{
  pid_t v0 = dword_100039430;
  if (dword_100039430 && kill(dword_100039430, 0) != 3)
  {
    unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
    if (sub_100023F74(v0, (dispatch_queue_t)qword_100039478))
    {
      sub_100005EAC();
    }
    else
    {
      if (qword_100039438)
      {
        dispatch_source_cancel((dispatch_source_t)qword_100039438);
        dispatch_release((dispatch_object_t)qword_100039438);
        qword_100039438 = 0;
      }
      sub_100005EAC();
      kill(v0, 15);
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_100039420, 0xFFFFFFFFFFFFFFFFLL);
      dword_100039430 = 0;
    }
  }
}

void sub_10002415C()
{
  if ((dword_10003942C & 0x80000000) == 0)
  {
    if (dword_10003942C < 2 || dword_100039430 == 0 || qword_1000394D4 == 0) {
      sub_100024064();
    }
    else {
      sub_100023308();
    }
    if (dword_10003942C >= 1) {
      --dword_10003942C;
    }
  }
}

intptr_t sub_1000241C4(uint64_t a1)
{
  int v4 = 0;
  pid_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  waitpid(data, &v4, 1);
  sub_100005EAC();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_100039420);
}

void sub_10002423C(id a1)
{
  int v2 = 0;
  pid_t data = dispatch_source_get_data((dispatch_source_t)qword_100039438);
  waitpid(data, &v2, 1);
  sub_100005EAC();
  if (dword_100039430)
  {
    dword_100039430 = 0;
    dispatch_source_cancel((dispatch_source_t)qword_100039438);
    dispatch_release((dispatch_object_t)qword_100039438);
    qword_100039438 = 0;
  }
}

uint64_t sub_1000242BC()
{
  if (dword_100038D40)
  {
    sub_10001237C();
    byte_100039444 = 0;
    unlink("/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist");
  }
  return 0;
}

uint64_t sub_100024314()
{
  if (dword_100039440 < 0)
  {
    int v1 = -1;
    uint64_t v0 = 2;
  }
  else
  {
    if (dword_100039440) {
      goto LABEL_3;
    }
    if (!dword_100038D40) {
      return 0;
    }
    if (access("/usr/libexec/dhcp6d", 0) && (uint64_t v0 = *__error(), sub_100005EAC(), v0))
    {
      int v1 = -1;
    }
    else
    {
LABEL_3:
      uint64_t v0 = 0;
      int v1 = dword_100039440 + 1;
    }
  }
  dword_100039440 = v1;
  return v0;
}

uint64_t sub_1000243C8()
{
  if (dword_100039440 < 0 || !dword_100038D40 || !dword_1000394D4) {
    goto LABEL_25;
  }
  keys = 0;
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  values = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  for (uint64_t i = qword_100039498; i; uint64_t i = *(void *)i)
  {
    if (*(unsigned char *)(i + 700) && *(_DWORD *)(i + 20) == 201)
    {
      if (*(_DWORD *)(i + 664)
        || *(_DWORD *)(i + 668)
        || *(_DWORD *)(i + 672)
        || *(_DWORD *)(i + 676)
        || !sub_100011674(i))
      {
        sub_100011CF4(Mutable, (const char *)(i + 308));
        inet_ntop(30, (const void *)(i + 664), v13, 0x2Eu);
        sub_100011CF4((const __CFArray *)values, v13);
      }
      else
      {
        sub_100005EAC();
      }
    }
  }
  if (!CFArrayGetCount(Mutable))
  {
    sub_100005EAC();
    CFRelease(Mutable);
    CFRelease(values);
    uint64_t v6 = 22;
LABEL_27:
    strerror(v6);
    goto LABEL_28;
  }
  int v2 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v2, @"enabled_interfaces", Mutable);
  CFRelease(Mutable);
  keys = @"dhcp_dns_servers";
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(values);
  CFDictionarySetValue(v2, @"options", v3);
  CFRelease(v3);
  if (byte_100039480) {
    CFDictionarySetValue(v2, @"verbose", kCFBooleanTrue);
  }
  uid_t v4 = geteuid();
  gid_t v5 = getgid();
  uint64_t v6 = sub_100011E68(v2, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist", v4, v5, 420, 0);
  CFRelease(v2);
  if (v6) {
    goto LABEL_27;
  }
  if (byte_100039444 != 1)
  {
    uint64_t v6 = sub_10001237C();
    if (!v6) {
      byte_100039444 = 1;
    }
    goto LABEL_28;
  }
  pid_t v7 = sub_10000FAC0("/usr/libexec/dhcp6d");
  if (v7)
  {
    uint64_t v8 = kill(v7, 1);
    if (v8)
    {
      uint64_t v6 = v8;
      int v9 = __error();
      strerror(*v9);
      sub_100005EAC();
      strerror(v6);
LABEL_28:
      sub_100005EAC();
      return v6;
    }
  }
LABEL_25:
  sub_100005EAC();
  return 0;
}

uint64_t sub_100024778()
{
  if ((dword_100039440 & 0x80000000) == 0)
  {
    if (dword_100039440 < 2 || qword_1000394D4 == 0)
    {
      sub_10001237C();
      byte_100039444 = 0;
      uint64_t result = unlink("/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist");
    }
    else
    {
      uint64_t result = sub_1000243C8();
    }
    if (dword_100039440 >= 1) {
      --dword_100039440;
    }
  }
  return result;
}

xpc_object_t sub_1000247FC()
{
  char v13 = 0;
  if (getifaddrs(&v13) == -1) {
    return 0;
  }
  uint64_t v0 = v13;
  if (v13)
  {
    xpc_object_t v1 = 0;
    while (1)
    {
      if (v0->ifa_addr->sa_family == 18)
      {
        ifa_pid_t data = (unsigned __int8 *)v0->ifa_data;
        if (ifa_data)
        {
          int v3 = *ifa_data;
          ifa_name = v0->ifa_name;
          if ((v3 - 135) < 2) {
            goto LABEL_7;
          }
          if (v3 == 6)
          {
            CFStringRef v5 = CFStringCreateWithCString(0, v0->ifa_name, 0x8000100u);
            uint64_t v6 = (const void *)_SCNetworkInterfaceCreateWithBSDName();
            CFRelease(v5);
            if (v6)
            {
              if (_SCNetworkInterfaceSupportsVMNETBridgedMode())
              {
                CFRelease(v6);
LABEL_7:
                if (!v1) {
                  xpc_object_t v1 = xpc_array_create(0, 0);
                }
                xpc_array_set_string(v1, 0xFFFFFFFFFFFFFFFFLL, ifa_name);
                goto LABEL_16;
              }
              if (_SCNetworkInterfaceIsHiddenConfiguration()
                || (CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType((SCNetworkInterfaceRef)v6)) == 0)
              {
LABEL_15:
                CFRelease(v6);
                goto LABEL_16;
              }
              CFStringRef v8 = InterfaceType;
              if (CFEqual(InterfaceType, kSCNetworkInterfaceTypeIEEE80211))
              {
                int v9 = strncmp(ifa_name, "en", 2uLL);
                CFRelease(v6);
                if (!v9) {
                  goto LABEL_7;
                }
              }
              else
              {
                if (!CFEqual(v8, kSCNetworkInterfaceTypeEthernet) || _SCNetworkInterfaceIsTethered()) {
                  goto LABEL_15;
                }
                int IsPhysicalEthernet = _SCNetworkInterfaceIsPhysicalEthernet();
                CFRelease(v6);
                if (IsPhysicalEthernet) {
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
LABEL_16:
      uint64_t v0 = v0->ifa_next;
      if (!v0)
      {
        uint64_t v11 = v13;
        goto LABEL_28;
      }
    }
  }
  uint64_t v11 = 0;
  xpc_object_t v1 = 0;
LABEL_28:
  freeifaddrs(v11);
  return v1;
}

void sub_1000249DC()
{
  if (dword_100038D34) {
    byte_100039448 = 1;
  }
}

void sub_1000249FC()
{
  if (byte_100039448 == 1) {
    byte_100039448 = 0;
  }
}

uint64_t sub_100024A14(uint64_t a1, void *a2)
{
  if (!dword_100038D34)
  {
    sub_100005EAC();
    return 0;
  }
  uid_t v4 = (const char *)(a1 + 308);
  CFStringRef v5 = &qword_1000394E0;
  while (1)
  {
    CFStringRef v5 = (uint64_t *)*v5;
    if (!v5) {
      break;
    }
    if (!strncmp((const char *)v5 + 8, v4, 0x10uLL)) {
      goto LABEL_13;
    }
  }
  uint64_t v6 = (uint64_t *)malloc_type_malloc(0x40uLL, 0x10A004087B56009uLL);
  if (!v6)
  {
LABEL_40:
    uint64_t v30 = 12;
    strerror(12);
    sub_100005EAC();
    return v30;
  }
  CFStringRef v5 = v6;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  BOOL v7 = *(_DWORD *)(a1 + 1128) == 502;
  *((_DWORD *)v6 + 11) = v7;
  if (v7)
  {
    sub_100005EAC();
    if (*((_DWORD *)v5 + 11)) {
      sub_100027860();
    }
  }
  xpc_object_t v8 = xpc_array_create(0, 0);
  v5[4] = (uint64_t)v8;
  if (!v8)
  {
    free(v5);
    goto LABEL_40;
  }
  snprintf((char *)v5 + 8, 0x10uLL, "%s", v4);
  *CFStringRef v5 = qword_1000394E0;
  qword_1000394E0 = (uint64_t)v5;
  ++dword_10003944C;
LABEL_13:
  sub_100005EAC();
  int v9 = (void *)v5[4];
  if (v9)
  {
    size_t count = xpc_array_get_count((xpc_object_t)v5[4]);
    if (count)
    {
      size_t v11 = count;
      for (size_t i = 0; i != v11; ++i)
      {
        xpc_array_get_string(v9, i);
        sub_100005EAC();
      }
    }
  }
  size_t v13 = xpc_array_get_count(a2);
  if (v13)
  {
    size_t v14 = v13;
    size_t v15 = 0;
    char v16 = 0;
    while (1)
    {
      string = xpc_array_get_string(a2, v15);
      unsigned int v18 = (void *)v5[4];
      size_t v19 = xpc_array_get_count(v18);
      if (!v19) {
        goto LABEL_25;
      }
      unint64_t v20 = v19;
      BOOL v21 = xpc_array_get_string(v18, 0);
      if (strcmp(v21, string)) {
        break;
      }
LABEL_27:
      if (++v15 == v14) {
        goto LABEL_30;
      }
    }
    size_t v22 = 1;
    while (v20 != v22)
    {
      unsigned int v23 = xpc_array_get_string(v18, v22++);
      if (!strcmp(v23, string))
      {
        if (v22 - 1 < v20) {
          goto LABEL_27;
        }
        break;
      }
    }
LABEL_25:
    xpc_array_set_string((xpc_object_t)v5[4], 0xFFFFFFFFFFFFFFFFLL, string);
    int v24 = *((_DWORD *)v5 + 10);
    *((_DWORD *)v5 + 1sub_100017968(0x3FEu, 1, 0) = v24 + 1;
    if (v24 == -1) {
      sub_100027834();
    }
    char v16 = 1;
    goto LABEL_27;
  }
  char v16 = 0;
LABEL_30:
  sub_100005EAC();
  int v25 = (void *)v5[4];
  if (v25)
  {
    size_t v26 = xpc_array_get_count((xpc_object_t)v5[4]);
    if (v26)
    {
      size_t v27 = v26;
      for (size_t j = 0; j != v27; ++j)
      {
        xpc_array_get_string(v25, j);
        sub_100005EAC();
      }
    }
  }
  if ((v16 & 1) == 0) {
    return 0;
  }

  return sub_100024D5C((uint64_t)v5);
}

uint64_t sub_100024D5C(uint64_t a1)
{
  if (dword_100038D34 && *(_DWORD *)(a1 + 40))
  {
    uint64_t v1 = mrc_dns_proxy_parameters_create();
    sub_100005EAC();
    if (v1) {
      mrc_release();
    }
  }
  else
  {
    sub_100005EAC();
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100024FD4(char *__s2, void *a2)
{
  if (!dword_100038D34)
  {
LABEL_22:
    sub_100005EAC();
    return 22;
  }
  uid_t v4 = &qword_1000394E0;
  CFStringRef v5 = &qword_1000394E0;
  do
  {
    CFStringRef v5 = (uint64_t *)*v5;
    if (!v5) {
      goto LABEL_22;
    }
  }
  while (strncmp((const char *)v5 + 8, __s2, 0x10uLL));
  sub_100005EAC();
  uint64_t v6 = (void *)v5[4];
  if (v6)
  {
    size_t count = xpc_array_get_count((xpc_object_t)v5[4]);
    if (count)
    {
      size_t v8 = count;
      for (size_t i = 0; i != v8; ++i)
      {
        xpc_array_get_string(v6, i);
        sub_100005EAC();
      }
    }
  }
  xpc_object_t v10 = (void *)v5[4];
  xpc_object_t v11 = xpc_array_create(0, 0);
  size_t v12 = xpc_array_get_count(v10);
  if (!v12)
  {
    int v15 = 0;
LABEL_25:
    xpc_release(v11);
    goto LABEL_26;
  }
  size_t v13 = v12;
  size_t v14 = 0;
  int v15 = 0;
  do
  {
    string = xpc_array_get_string(v10, v14);
    size_t v17 = xpc_array_get_count(a2);
    if (v17)
    {
      unint64_t v18 = v17;
      size_t v19 = xpc_array_get_string(a2, 0);
      if (!strcmp(v19, string))
      {
LABEL_17:
        ++v15;
        goto LABEL_19;
      }
      size_t v20 = 1;
      while (v18 != v20)
      {
        BOOL v21 = xpc_array_get_string(a2, v20++);
        if (!strcmp(v21, string))
        {
          if (v20 - 1 >= v18) {
            break;
          }
          goto LABEL_17;
        }
      }
    }
    xpc_array_set_string(v11, 0xFFFFFFFFFFFFFFFFLL, string);
LABEL_19:
    ++v14;
  }
  while (v14 != v13);
  if (v15 <= 0)
  {
    uid_t v4 = &qword_1000394E0;
    goto LABEL_25;
  }
  xpc_release(v10);
  v5[4] = (uint64_t)v11;
  uid_t v4 = &qword_1000394E0;
LABEL_26:
  sub_100005EAC();
  unsigned int v23 = (void *)v5[4];
  if (v23)
  {
    size_t v24 = xpc_array_get_count((xpc_object_t)v5[4]);
    if (v24)
    {
      size_t v25 = v24;
      for (size_t j = 0; j != v25; ++j)
      {
        xpc_array_get_string(v23, j);
        sub_100005EAC();
      }
    }
  }
  if (v15 >= 1)
  {
    int v27 = *((_DWORD *)v5 + 10);
    int v28 = v27 - v15;
    if (v27 < v15) {
      sub_1000278B8();
    }
    *((_DWORD *)v5 + 1sub_100017968(0x3FEu, 1, 0) = v28;
    uint64_t v29 = v5[3];
    if (v28 < 1)
    {
      if (v29)
      {
        sub_100005EAC();
        mrc_dns_proxy_invalidate();
        v5[3] = 0;
      }
    }
    else if (v29)
    {
      sub_100024D5C((uint64_t)v5);
    }
    if (!*((_DWORD *)v5 + 10))
    {
      for (uint64_t k = (uint64_t *)qword_1000394E0; k != v5; uint64_t k = (uint64_t *)*k)
        uid_t v4 = k;
      uint64_t *v4 = *v5;
      if (!dword_10003944C) {
        sub_1000278E4();
      }
      --dword_10003944C;
      xpc_release((xpc_object_t)v5[4]);
      free(v5);
    }
  }
  return 0;
}

uint64_t sub_100025308(uint64_t a1, int a2)
{
  switch(a2)
  {
    case -1:
      sub_100005EAC();
      mrc_release();
      break;
    default:
      return sub_100005EAC();
  }
  return sub_100005EAC();
}

void sub_100025414(void *a1)
{
  *(_WORD *)int v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os log object", v2, 2u);
  *a1 = qword_100038EB8;
}

void sub_100025474()
{
  __assert_rtn("mis_create_nexus_controller", "mis_lowlatency.c", 542, "nexus_controller_handle == NULL");
}

void sub_1000254A0()
{
}

void sub_1000254CC()
{
}

void sub_1000254F8()
{
}

void sub_100025524()
{
  __assert_rtn("netrbServiceRequestAdd", "mis_rpc.c", 57, "mis_nsvc_request != 0");
}

void sub_100025550()
{
  __assert_rtn("netrbServiceRequestAdd", "mis_rpc.c", 48, "service != NULL && connection != NULL && reply != NULL && m != NULL");
}

void sub_10002557C()
{
  __assert_rtn("netrbServiceRequestRemove", "mis_rpc.c", 68, "m != NULL");
}

void sub_1000255A8()
{
  __assert_rtn("netrbServiceRequestRemove", "mis_rpc.c", 73, "mis_nsvc_request != 0");
}

void sub_1000255D4()
{
}

void sub_100025600()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 245, "mis_nsvc != 0");
}

void sub_10002562C()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 221, "m->ms_bridge->mi_delete != NULL");
}

void sub_100025658()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 208, "m->ms_svcstate == MIS_SVC_IDLE");
}

void sub_100025684()
{
  __assert_rtn("mis_if_release", "mis_impl.c", 3447, "mif->mi_refcnt != 0");
}

void sub_1000256B0()
{
  __assert_rtn("mis_if_release", "mis_impl.c", 3455, "mis_nif != 0");
}

void sub_1000256DC()
{
  __assert_rtn("mis_svc_create", "mis_impl.c", 386, "natInfo != NULL");
}

void sub_100025708()
{
  __assert_rtn("mis_svc_create", "mis_impl.c", 568, "mis_nsvc != 0");
}

void sub_100025734()
{
  __assert_rtn("mis_is_bridgeable", "mis_impl.c", 4332, "ifname != NULL && ifname[0] != '\\0'");
}

void sub_100025760()
{
  __assert_rtn("mis_if_lookup", "mis_impl.c", 3316, "mif->mi_refcnt != 0");
}

void sub_10002578C()
{
  __assert_rtn("mis_getifmtu", "mis_impl.c", 4577, "ifname != NULL");
}

void sub_1000257B8()
{
  __assert_rtn("mis_getifmtu", "mis_impl.c", 4578, "ifname[0] != '\\0'");
}

void sub_1000257E4()
{
  __assert_rtn("mis_if_get_extif", "mis_impl.c", 3491, "mif->mi_refcnt != 0");
}

void sub_100025810()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3376, "natInfo != NULL");
}

void sub_10002583C()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3419, "mis_nif != 0");
}

void sub_100025868()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3352, "!(if_address_fixed && saddr != NULL)");
}

void sub_100025894()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3341, "iftype == MIS_IFTYPE_PDP || iftype == MIS_IFTYPE_AUTH || iftype == MIS_IFTYPE_BROADCAST || iftype == MIS_IFTYPE_BROADCAST_LOCAL || iftype == MIS_IFTYPE_BRIDGE");
}

void sub_1000258C0()
{
  __assert_rtn("mis_if_get_bridge", "mis_impl.c", 3565, "mif->mi_refcnt != 0");
}

void sub_1000258EC()
{
  __assert_rtn("mis_svc_complete", "mis_impl.c", 734, "mif_ext->mi_class == MIS_IFCLASS_EXT && result != EINPROGRESS");
}

void sub_100025918()
{
  __assert_rtn("mis_svc_complete", "mis_impl.c", 738, "m->ms_svcstate == MIS_SVC_STARTING");
}

void sub_100025944()
{
  __assert_rtn("mis_svc_start_internal_interface", "mis_impl.c", 630, "mif_int->mi_add != NULL");
}

void sub_100025970()
{
  __assert_rtn("mis_svc_start_internal_interface", "mis_impl.c", 652, "mif_int != NULL && mif_int->mi_start != NULL");
}

void sub_10002599C()
{
}

void sub_1000259C8()
{
  __assert_rtn("mis_send_svc_usage_event", "mis_impl.c", 5784, "now >= ms->ms_start_time");
}

void sub_1000259F4()
{
  __assert_rtn("mis_svc_start_external_interface", "mis_impl.c", 590, "m->ms_ext != NULL && m->ms_ext->mi_start != NULL");
}

void sub_100025A20()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 865, "mc->mc_mis == NULL");
}

void sub_100025A4C()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 863, "m->ms_client == NULL");
}

void sub_100025A78()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 861, "err != EINPROGRESS || m->ms_svcstate == MIS_SVC_STARTING");
}

void sub_100025AA4()
{
  __assert_rtn("nwi_notification_cleanup", "mis_impl.c", 1194, "mis_nnwi_ipv6 != 0");
}

void sub_100025AD0()
{
  __assert_rtn("nwi_notification_cleanup", "mis_impl.c", 1188, "mis_nnwi != 0");
}

void sub_100025AFC()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2233, "mif->mi_name[0] != '\\0'");
}

void sub_100025B28()
{
}

void sub_100025B54()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2232, "mif->mi_mode == NETRB_INTERNET_SHARING_MODE");
}

void sub_100025B80()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2231, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_100025BAC()
{
}

void sub_100025BD8()
{
  __assert_rtn("mis_listen_prefix_events", "mis_impl.c", 2157, "mif_ext->mi_class == MIS_IFCLASS_EXT");
}

void sub_100025C04()
{
  __assert_rtn("mis_cleanup_external_listeners", "mis_impl.c", 2253, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_100025C30()
{
}

void sub_100025C5C()
{
}

void sub_100025C88()
{
}

void sub_100025CB4()
{
  __assert_rtn("mis_netrb_remote_connection_release", "mis_impl.c", 2860, "ne->ne_refcnt != 0");
}

void sub_100025CE0()
{
}

void sub_100025D0C()
{
  __assert_rtn("mis_netrb_remote_connection_create", "mis_impl.c", 2963, "mis_nepoint != 0");
}

void sub_100025D38()
{
}

void sub_100025D64()
{
  __assert_rtn("mis_client_create", "mis_impl.c", 3015, "mis_nclient != 0");
}

void sub_100025D90()
{
  __assert_rtn("mis_client_create", "mis_impl.c", 3022, "mis_xpc_transaction == NULL");
}

void sub_100025DBC()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3058, "mis_nclient != 0");
}

void sub_100025DE8()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3092, "mis_xpc_transaction != NULL");
}

void sub_100025E14()
{
}

void sub_100025E40()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3073, "mc->mc_mis == NULL");
}

void sub_100025E6C()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3071, "mc->mc_mis->ms_client == mc");
}

void sub_100025E98()
{
  __assert_rtn("mis_client_add_host", "mis_impl.c", 3162, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_100025EC4()
{
  __assert_rtn("mis_client_add_host", "mis_impl.c", 3195, "mc->mc_host_count[iftype] != 0");
}

void sub_100025EF0()
{
  __assert_rtn("mis_client_remove_host", "mis_impl.c", 3206, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_100025F1C()
{
  __assert_rtn("mis_client_set_host_count", "mis_impl.c", 3289, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_100025F48()
{
  __assert_rtn("mis_vmnet_interface_attached_callback", "mis_impl.c", 3821, "err != 0");
}

void sub_100025F74()
{
  __assert_rtn("mis_vmnet_interface_attached_callback", "mis_impl.c", 3763, "interface_network_mask != NULL");
}

void sub_100025FA0()
{
  __assert_rtn("interface_back_attach", "mis_impl.c", 4197, "ifname != NULL");
}

void sub_100025FCC()
{
  __assert_rtn("interface_back_attach", "mis_impl.c", 4198, "ifname[0] != '\\0'");
}

void sub_100025FF8()
{
  __assert_rtn("mis_protoattach", "mis_impl.c", 4394, "ifname != NULL");
}

void sub_100026024()
{
  __assert_rtn("mis_protoattach", "mis_impl.c", 4395, "ifname[0] != '\\0'");
}

void sub_100026050()
{
  __assert_rtn("mis_protoattach6", "mis_impl.c", 4430, "ifname != NULL");
}

void sub_10002607C()
{
  __assert_rtn("mis_protoattach6", "mis_impl.c", 4431, "ifname[0] != '\\0'");
}

void sub_1000260A8()
{
  __assert_rtn("interface_back", "mis_impl.c", 4226, "ifname != NULL");
}

void sub_1000260D4()
{
  __assert_rtn("interface_back", "mis_impl.c", 4227, "ifname[0] != '\\0'");
}

void sub_100026100()
{
  __assert_rtn("interface_quiesce", "mis_impl.c", 4275, "ifname != NULL");
}

void sub_10002612C()
{
  __assert_rtn("interface_quiesce", "mis_impl.c", 4276, "ifname[0] != '\\0'");
}

void sub_100026158()
{
  __assert_rtn("mis_protodetach", "mis_impl.c", 4467, "ifname != NULL");
}

void sub_100026184()
{
  __assert_rtn("mis_protodetach", "mis_impl.c", 4468, "ifname[0] != '\\0'");
}

void sub_1000261B0()
{
  __assert_rtn("mis_protodetach6", "mis_impl.c", 4502, "ifname != NULL");
}

void sub_1000261DC()
{
  __assert_rtn("mis_protodetach6", "mis_impl.c", 4503, "ifname[0] != '\\0'");
}

void sub_100026208()
{
  __assert_rtn("interface_quiesce_detach", "mis_impl.c", 4312, "ifname != NULL");
}

void sub_100026234()
{
  __assert_rtn("interface_quiesce_detach", "mis_impl.c", 4313, "ifname[0] != '\\0'");
}

void sub_100026260()
{
  __assert_rtn("mis_get_interface_flags", "mis_impl.c", 4369, "ifname != NULL && ifname[0] != '\\0'");
}

void sub_10002628C()
{
  __assert_rtn("mis_setifmtu", "mis_impl.c", 4538, "ifname != NULL");
}

void sub_1000262B8()
{
  __assert_rtn("mis_setifmtu", "mis_impl.c", 4539, "ifname[0] != '\\0'");
}

void sub_1000262E4()
{
  __assert_rtn("mis_is_interface_ppp", "mis_impl.c", 4923, "mask != NULL");
}

void sub_100026310()
{
  __assert_rtn("mis_get_linklocal", "mis_impl.c", 4961, "mif->mi_name[0] != '\\0'");
}

void sub_10002633C()
{
}

void sub_100026368()
{
}

void sub_100026394()
{
  __assert_rtn("mis_nwi_process_state", "mis_impl.c", 960, "af == AF_INET6");
}

void sub_1000263C0()
{
}

void sub_1000263EC()
{
}

void sub_100026418()
{
  __assert_rtn("mis_get_prefix_router", "mis_impl.c", 2559, "mif_ext->mi_class == MIS_IFCLASS_EXT");
}

void sub_100026444()
{
  __assert_rtn("mis_dynamic_store_changed", "mis_impl.c", 1669, "mif_ext != NULL");
}

void sub_100026470()
{
}

void sub_10002649C()
{
}

void sub_1000264C8()
{
  __assert_rtn("mis_pdp_init", "mis_pdp.c", 293, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_1000264F4()
{
  __assert_rtn("mis_pdp_init", "mis_pdp.c", 292, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_100026520()
{
  __assert_rtn("mis_pdp_start", "mis_pdp.c", 470, "mis_pdp_refcnt != 0");
}

void sub_10002654C()
{
  __assert_rtn("mis_pdp_start", "mis_pdp.c", 469, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100026578()
{
  __assert_rtn("mis_pdp_stop", "mis_pdp.c", 483, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_1000265A4()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 341, "mis_pdp_refcnt != 0");
}

void sub_1000265D0()
{
}

void sub_1000265FC()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 349, "mif->mi_SCDynamicStore == NULL");
}

void sub_100026628()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 348, "mif->mi_prefixDispatchSource == NULL");
}

void sub_100026654()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 339, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100026680()
{
  __assert_rtn("mis_pdp_context_invalidate", "mis_pdp.c", 358, "mif->mi_type == MIS_IFTYPE_PDP || mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000266AC()
{
  __assert_rtn("mis_pdp_context_invalidate", "mis_pdp.c", 359, "!all || mis_pdp_refcnt == 0");
}

void sub_1000266D8()
{
  __assert_rtn("mis_bcast_init", "mis_bcast.c", 250, "mif->mi_nat_param.ni_nattype != NETRB_NONAT");
}

void sub_100026704()
{
  __assert_rtn("mis_bcast_init", "mis_bcast.c", 251, "nat64 || nat66 != mif->mi_prefix_sharing");
}

void sub_100026730()
{
  __assert_rtn("mis_bcast_start", "mis_bcast.c", 879, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_10002675C()
{
}

void sub_100026788()
{
}

void sub_1000267B4()
{
}

void sub_1000267E0()
{
}

void sub_10002680C()
{
  __assert_rtn("mis_bcast_stop", "mis_bcast.c", 970, "mif->mi_notify == NULL");
}

void sub_100026838()
{
  __assert_rtn("mis_bcast_stop", "mis_bcast.c", 969, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100026864()
{
  __assert_rtn("mis_bcast_startv6", "mis_bcast.c", 1064, "mif_int->mi_class == MIS_IFCLASS_INT && (mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BRIDGE)");
}

void sub_100026890()
{
}

void sub_1000268BC()
{
}

void sub_1000268E8()
{
  __assert_rtn("mis_bcast_startv6", "mis_bcast.c", 1066, "mif_ext->mi_nat_param.ni_nattype == NETRB_NAT64 || mif_ext->mi_prefixinfo.mp_prefix_present || !mif_ext->mi_prefix_sharing");
}

void sub_100026914()
{
  __assert_rtn("mis_bridge_add", "mis_bcast.c", 1111, "mif_bridge->mi_class == MIS_IFCLASS_INT && mif_bridge->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100026940()
{
  __assert_rtn("mis_bridge_delete", "mis_bcast.c", 1128, "mif->mi_class == MIS_IFCLASS_INT && mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_10002696C()
{
  __assert_rtn("mis_bcast_init_addr", "mis_bcast.c", 632, "mif->mi_class == MIS_IFCLASS_INT && mif->mi_member == 0");
}

void sub_100026998()
{
  __assert_rtn("mis_bcast_teardown_interface", "mis_bcast.c", 457, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_1000269C4()
{
  __assert_rtn("mis_bcast_teardown_interface", "mis_bcast.c", 456, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_1000269F0()
{
  __assert_rtn("mis_bcast_setup_routes", "mis_bcast.c", 388, "err == 0 || err == EEXIST");
}

void sub_100026A1C()
{
  __assert_rtn("mis_bcast_fix_addrs", "mis_bcast.c", 552, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100026A48()
{
  __assert_rtn("mis_bcast_fix_addrs", "mis_bcast.c", 551, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_100026A74()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 725, "mif_int->mi_member == 0");
}

void sub_100026AA0()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 724, "mif_int->mi_class == MIS_IFCLASS_INT");
}

void sub_100026ACC()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 722, "mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif_int->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100026AF8()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 814, "mif_int->mi_member == 0");
}

void sub_100026B24()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 813, "mif_int->mi_class == MIS_IFCLASS_INT");
}

void sub_100026B50()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 811, "mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BRIDGE || mif_int->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_100026B7C()
{
  __assert_rtn("mis_bcast_local_start", "mis_bcast.c", 1200, "mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100026BA8()
{
}

void sub_100026BD4()
{
  __assert_rtn("read_settings", "mis_set.c", 651, "plist_path != NULL");
}

void sub_100026C00()
{
  __assert_rtn("read_settings", "mis_set.c", 655, "err != 0");
}

void sub_100026C2C()
{
  __assert_rtn("mis_set_update_airplane_mode", "mis_set.c", 463, "set_prefs != NULL");
}

void sub_100026C58()
{
  __assert_rtn("write_settings", "mis_set.c", 1085, "plist_path != NULL");
}

void sub_100026C84()
{
  __assert_rtn("publish_settings", "mis_set.c", 1110, "sr != NULL");
}

void sub_100026CB0()
{
}

void sub_100026CDC()
{
  __assert_rtn("mis_set_state_common", "mis_set.c", 1175, "state == NETRB_SVC_STATE_OFF");
}

void sub_100026D08()
{
  __assert_rtn("mis_remove_settings", "mis_set.c", 1364, "st->st_refcnt != 0");
}

void sub_100026D34()
{
  __assert_rtn("mis_set_max_hosts", "mis_set.c", 1421, "limit >= 0");
}

void sub_100026D60()
{
  __assert_rtn("mis_set_add_host", "mis_set.c", 1441, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_100026D8C()
{
}

void sub_100026DB8()
{
  __assert_rtn("mis_set_add_host", "mis_set.c", 1443, "(gset.mset_hosts[iftype] + count) != 0");
}

void sub_100026DE4()
{
  __assert_rtn("mis_set_remove_host", "mis_set.c", 1452, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_100026E10()
{
  __assert_rtn("mis_get_ext", "mis_set.c", 1514, "if_nametoindex(st->st_ext_name) != 0");
}

void sub_100026E3C()
{
  __assert_rtn("mis_set_get_vmnet_subnet_information", "mis_set.c", 1544, "addr != NULL && mask != NULL");
}

void sub_100026E68()
{
  __assert_rtn("mis_set_get_vmnet_subnet_information", "mis_set.c", 1545, "vmnet_plist != NULL");
}

void sub_100026E94()
{
  __assert_rtn("mis_set_vmnet_subnet_information", "mis_set.c", 1573, "addr != NULL && mask != NULL");
}

void sub_100026EC0()
{
  __assert_rtn("mis_set_vmnet_subnet_information", "mis_set.c", 1574, "vmnet_plist != NULL");
}

void sub_100026EEC()
{
  __assert_rtn("mis_set_reclaim_mac_io_ethernet", "mis_set.c", 1641, "vmnet_plist != NULL");
}

void sub_100026F18()
{
  __assert_rtn("mis_set_reclaim_mac_io_ethernet", "mis_set.c", 1642, "mac_ioue_array != NULL");
}

void sub_100026F44()
{
  __assert_rtn("mis_set_get_mac_io_ethernet", "mis_set.c", 1700, "vmnet_plist != NULL");
}

void sub_100026F70()
{
  __assert_rtn("mis_set_get_mac_io_ethernet", "mis_set.c", 1701, "mac_ioue_array != NULL");
}

void sub_100026F9C()
{
  __assert_rtn("mis_set_get_unique_mac_address", "mis_set.c", 1789, "mac_array_plist != NULL");
}

void sub_100026FC8()
{
  __assert_rtn("mis_set_get_unique_mac_address", "mis_set.c", 1792, "mac_ioue_array != NULL");
}

void sub_100026FF4()
{
  __assert_rtn("mis_set_reclaim_mac_address", "mis_set.c", 1876, "vmnet_plist != NULL");
}

void sub_100027020()
{
  __assert_rtn("mis_set_reclaim_mac_address", "mis_set.c", 1877, "mac_array_plist != NULL");
}

void sub_10002704C()
{
  __assert_rtn("mis_auth_init", "mis_auth.c", 36, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100027078()
{
  __assert_rtn("mis_auth_init", "mis_auth.c", 35, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000270A4()
{
  __assert_rtn("mis_auth_start", "mis_auth.c", 48, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000270D0()
{
  __assert_rtn("mis_auth_stop", "mis_auth.c", 57, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000270FC()
{
  __assert_rtn("dhcp_start", "mis_dhcp.c", 935, "mif != NULL");
}

void sub_100027128()
{
  __assert_rtn("dhcp_interface_config_add", "mis_dhcp.c", 259, "mif->mi_mode == NETRB_INTERNET_SHARING_MODE || mif->mi_mode == NETRB_LOCAL_WITH_DHCP_MODE");
}

void sub_100027154()
{
  __assert_rtn("bcast_range", "mis_dhcp.c", 206, "ntohl(mif->mi_address_info.mi_addr.s_addr) == ntohl(mif->mi_address_info.mi_addr.s_addr & mif->mi_address_info.mi_netmask.s_addr) + 1");
}

void sub_100027180()
{
  __assert_rtn("bcast_range", "mis_dhcp.c", 196, "ntohl(mif->mi_address_info.mi_addr.s_addr) == ntohl(mif->mi_saddr.s_addr)");
}

void sub_1000271AC()
{
  __assert_rtn("mis_bridge_create", "mis_bridge.c", 510, "bridgeName != NULL");
}

void sub_1000271D8()
{
  __assert_rtn("mis_bridge_create", "mis_bridge.c", 511, "bridgeName[0] != '\\0'");
}

void sub_100027204()
{
}

void sub_100027230()
{
  __assert_rtn("delete_entire_bridge", "mis_bridge.c", 346, "bridgename != NULL");
}

void sub_10002725C()
{
  __assert_rtn("delete_entire_bridge", "mis_bridge.c", 347, "bridgename[0] != '\\0'");
}

void sub_100027288()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 615, "ifname != NULL");
}

void sub_1000272B4()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 616, "ifname[0] != '\\0'");
}

void sub_1000272E0()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 617, "bridgename != NULL");
}

void sub_10002730C()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 618, "bridgename[0] != '\\0'");
}

void sub_100027338()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 714, "xpc_dictionary_get_count(bridge->bridgeMembers) != 0");
}

void sub_100027364()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 573, "bridgeName != NULL");
}

void sub_100027390()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 574, "bridgeName[0] != '\\0'");
}

void sub_1000273BC()
{
}

void sub_1000273E8()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 582, "bridge->bridge_refcnt == 0");
}

void sub_100027414()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 733, "ifname != NULL");
}

void sub_100027440()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 734, "ifname[0] != '\\0'");
}

void sub_10002746C()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 735, "bridgename != NULL");
}

void sub_100027498()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 736, "bridgename[0] != '\\0'");
}

void sub_1000274C4()
{
  __assert_rtn("mis_get_bridge_name", "mis_bridge.c", 783, "bridge_name != NULL");
}

void sub_1000274F0()
{
  __assert_rtn("mis_pfif_lookup", "mis_pf.c", 2687, "pe->refcnt != 0");
}

void sub_10002751C()
{
  __assert_rtn("mis_pf_addrules_v4", "mis_pf.c", 513, "pe_last != NULL");
}

void sub_100027548()
{
  __assert_rtn("mis_pf_addrules_v4", "mis_pf.c", 521, "ntohl(pe_last->pe_addr.s_addr) == ntohl(pe_last->pe_addr.s_addr & pe_last->pe_netmask.s_addr) + 1");
}

void sub_100027574()
{
}

void sub_1000275A0()
{
}

void sub_1000275CC()
{
}

void sub_1000275F8()
{
  __assert_rtn("mis_pf_start", "mis_pf.c", 891, "mif_int->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100027624()
{
}

void sub_100027650()
{
  __assert_rtn("mis_pfif_clone", "mis_pf.c", 2753, "mif->mi_nat_param.ni_nattype == NETRB_DEFAULT_NAT");
}

void sub_10002767C()
{
}

void sub_1000276A8()
{
  __assert_rtn("mis_pf_stop", "mis_pf.c", 1092, "mif_int->mi_nat_param.ni_nattype == NETRB_DEFAULT_NAT");
}

void sub_1000276D4()
{
  __assert_rtn("mis_pf_configure_rdr", "mis_pf.c", 1266, "ext_lo_port <= ext_hi_port && int_lo_port <= int_hi_port");
}

void sub_100027700()
{
  __assert_rtn("mis_pf_configure_rdr", "mis_pf.c", 1267, "ext_hi_port - ext_lo_port == int_hi_port - int_lo_port");
}

void sub_10002772C()
{
  __assert_rtn("-[misCTClientSharedInstance activateTethering:]", "mis_ctinterface.m", 236, "self.ctServerConnection != NULL");
}

void sub_100027758()
{
  __assert_rtn("rtadvd_config_create", "mis_rtadvd.c", 108, "mif->mi_nat_param.ni_nat66.ra_prefix_len != 0");
}

void sub_100027784()
{
  __assert_rtn("rtadvd_config_create", "mis_rtadvd.c", 96, "strncmp(mif_ext->mi_name, netrbXPCAnyExternal, NETRB_IFNAMSIZ) == 0");
}

void sub_1000277B0()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 474, "mif->mi_nat_param.ni_nat66.ra_prefix_len != 0");
}

void sub_1000277DC()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 460, "mif->mi_nat_param.ni_nattype == NETRB_NAT64");
}

void sub_100027808()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 425, "rtadvd_source != NULL");
}

void sub_100027834()
{
  __assert_rtn("dns_proxy_insert_interfaces", "mis_dnsproxy.c", 272, "dns_object->dns_refcnt != 0");
}

void sub_100027860()
{
}

void sub_10002788C()
{
}

void sub_1000278B8()
{
  __assert_rtn("dns_proxy_remove_interfaces", "mis_dnsproxy.c", 310, "removed_count <= dns_object->dns_refcnt");
}

void sub_1000278E4()
{
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_MD5(data, len, md);
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

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
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

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
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

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return _CFCopyHomeDirectoryURLForUser();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
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

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return _CFDateCompare(theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
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

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

uint64_t DHCPSCopyDisabledInterfaces()
{
  return _DHCPSCopyDisabledInterfaces();
}

uint64_t IOEthernetControllerCreate()
{
  return _IOEthernetControllerCreate();
}

uint64_t IOEthernetControllerGetBSDSocket()
{
  return _IOEthernetControllerGetBSDSocket();
}

uint64_t IOEthernetControllerGetIONetworkInterfaceObject()
{
  return _IOEthernetControllerGetIONetworkInterfaceObject();
}

uint64_t IOEthernetControllerRegisterBSDAttachCallback()
{
  return _IOEthernetControllerRegisterBSDAttachCallback();
}

uint64_t IOEthernetControllerSetDispatchQueue()
{
  return _IOEthernetControllerSetDispatchQueue();
}

uint64_t IOEthernetControllerSetLinkStatus()
{
  return _IOEthernetControllerSetLinkStatus();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PFFindStatesByDescriptor()
{
  return _PFFindStatesByDescriptor();
}

uint64_t PFGetDescriptorStateDetails()
{
  return _PFGetDescriptorStateDetails();
}

uint64_t PFQueryGatewayAddrAndPortForDescriptor()
{
  return _PFQueryGatewayAddrAndPortForDescriptor();
}

uint64_t PFStateQueryAppendTrafficDescriptor()
{
  return _PFStateQueryAppendTrafficDescriptor();
}

uint64_t PFUserBeginRules()
{
  return _PFUserBeginRules();
}

uint64_t PFUserClearRules()
{
  return _PFUserClearRules();
}

uint64_t PFUserClearStates()
{
  return _PFUserClearStates();
}

uint64_t PFUserCommitRules()
{
  return _PFUserCommitRules();
}

uint64_t PFUserCreate()
{
  return _PFUserCreate();
}

uint64_t PFUserDeleteRules()
{
  return _PFUserDeleteRules();
}

uint64_t PFUserRelease()
{
  return _PFUserRelease();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return _SCDynamicStoreKeyCreate(allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreNotifyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreNotifyValue(store, key);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return _SCDynamicStoreSetDisconnectCallBack();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return _SCDynamicStoreSetValue(store, key, value);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetBSDName(interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterfaceType(interface);
}

Boolean SCNetworkProtocolGetEnabled(SCNetworkProtocolRef protocol)
{
  return _SCNetworkProtocolGetEnabled(protocol);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return _SCNetworkServiceCopyProtocol(service, protocolType);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetEnabled(service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetInterface(service);
}

Boolean SCNetworkServiceSetEnabled(SCNetworkServiceRef service, Boolean enabled)
{
  return _SCNetworkServiceSetEnabled(service, enabled);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyCurrent(prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return _SCNetworkSetCopyServices(set);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return _SCPreferencesSetDispatchQueue(prefs, queue);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

uint64_t SMJobSetEnabled()
{
  return _SMJobSetEnabled();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return __CTServerConnectionGetCellularDataIsEnabled();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return __CTServerConnectionRegisterForNotification();
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return __SCNetworkInterfaceCreateWithBSDName();
}

uint64_t _SCNetworkInterfaceIsHiddenConfiguration()
{
  return __SCNetworkInterfaceIsHiddenConfiguration();
}

uint64_t _SCNetworkInterfaceIsPhysicalEthernet()
{
  return __SCNetworkInterfaceIsPhysicalEthernet();
}

uint64_t _SCNetworkInterfaceIsTethered()
{
  return __SCNetworkInterfaceIsTethered();
}

uint64_t _SCNetworkInterfaceSupportsVMNETBridgedMode()
{
  return __SCNetworkInterfaceSupportsVMNETBridgedMode();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
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

void dispatch_release(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return _ether_aton(a1);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

gid_t getgid(void)
{
  return _getgid();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return _gethostuuid(a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

in_addr_t inet_addr(const char *a1)
{
  return _inet_addr(a1);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return _inet_aton(a1, a2);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return _inet_ntoa(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t mrc_dns_proxy_activate()
{
  return _mrc_dns_proxy_activate();
}

uint64_t mrc_dns_proxy_create()
{
  return _mrc_dns_proxy_create();
}

uint64_t mrc_dns_proxy_invalidate()
{
  return _mrc_dns_proxy_invalidate();
}

uint64_t mrc_dns_proxy_parameters_add_input_interface()
{
  return _mrc_dns_proxy_parameters_add_input_interface();
}

uint64_t mrc_dns_proxy_parameters_create()
{
  return _mrc_dns_proxy_parameters_create();
}

uint64_t mrc_dns_proxy_parameters_set_output_interface()
{
  return _mrc_dns_proxy_parameters_set_output_interface();
}

uint64_t mrc_dns_proxy_set_event_handler()
{
  return _mrc_dns_proxy_set_event_handler();
}

uint64_t mrc_dns_proxy_set_queue()
{
  return _mrc_dns_proxy_set_queue();
}

uint64_t mrc_release()
{
  return _mrc_release();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nw_nat64_synthesize_v6()
{
  return _nw_nat64_synthesize_v6();
}

uint64_t nwi_ifstate_get_flags()
{
  return _nwi_ifstate_get_flags();
}

uint64_t nwi_state_copy()
{
  return _nwi_state_copy();
}

uint64_t nwi_state_get_ifstate()
{
  return _nwi_state_get_ifstate();
}

uint64_t nwi_state_get_interface_names()
{
  return _nwi_state_get_interface_names();
}

uint64_t nwi_state_get_notify_key()
{
  return _nwi_state_get_notify_key();
}

uint64_t nwi_state_release()
{
  return _nwi_state_release();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

uint64_t os_nexus_controller_add_traffic_rule()
{
  return _os_nexus_controller_add_traffic_rule();
}

uint64_t os_nexus_controller_create()
{
  return _os_nexus_controller_create();
}

uint64_t os_nexus_controller_destroy()
{
  return _os_nexus_controller_destroy();
}

uint64_t os_nexus_controller_remove_traffic_rule()
{
  return _os_nexus_controller_remove_traffic_rule();
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return _posix_spawn_file_actions_addopen(a1, a2, a3, a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigdefault(a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigmask(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return _proc_listallpids(buffer, buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return _xpc_connection_create_from_endpoint(endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return _xpc_dictionary_get_count(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__setupCTServerConnection(void *a1, const char *a2, ...)
{
  return [a1 _setupCTServerConnection];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_carrierEnabled(void *a1, const char *a2, ...)
{
  return [a1 carrierEnabled];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectionAvailabilityStatus(void *a1, const char *a2, ...)
{
  return [a1 connectionAvailabilityStatus];
}

id objc_msgSend_connectionStatus(void *a1, const char *a2, ...)
{
  return [a1 connectionStatus];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_ctServerConnection(void *a1, const char *a2, ...)
{
  return [a1 ctServerConnection];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_misPdpMaxHosts(void *a1, const char *a2, ...)
{
  return [a1 misPdpMaxHosts];
}

id objc_msgSend_pdp(void *a1, const char *a2, ...)
{
  return [a1 pdp];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return [a1 subscriptionsInUse];
}

id objc_msgSend_userAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 userAuthenticated];
}