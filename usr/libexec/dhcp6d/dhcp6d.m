void start(int a1, uint64_t a2)
{
  const char *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void handler[5];

  if (a1 < 2) {
    v2 = 0;
  }
  else {
    v2 = *(const char **)(a2 + 8);
  }
  v3 = sub_100003414(v2);
  if (!v3) {
    exit(1);
  }
  v4 = v3;
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10000340C;
  handler[3] = &unk_10000C3D8;
  handler[4] = v4;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  signal(1, (void (__cdecl *)(int))1);
  dispatch_main();
}

void sub_10000340C(uint64_t a1)
{
}

void *sub_100003414(const char *a1)
{
  v20 = 0;
  unsigned int v2 = sub_1000037C0();
  if ((v2 & 0x80000000) != 0)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v8 = _os_log_pack_size();
      __chkstk_darwin(v8);
      __error();
      uint64_t v9 = _os_log_pack_fill();
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)uint64_t v9 = 136315138;
      *(void *)(v9 + 4) = v11;
      __SC_log_send();
    }
    goto LABEL_10;
  }
  unsigned int v3 = v2;
  v4 = sub_100003B34();
  v20 = v4;
  if (!v4)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v12 = _os_log_pack_size();
      __chkstk_darwin(v12);
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
    }
    close(v3);
LABEL_10:
    sub_100006360(&v20);
    return 0;
  }
  v5 = v4;
  v6 = malloc_type_malloc(0x50uLL, 0x10F004095A59CC2uLL);
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  if (a1) {
    v7 = a1;
  }
  else {
    v7 = "/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist";
  }
  v13 = strdup(v7);
  *((void *)v6 + 2) = v5;
  *((void *)v6 + 3) = v13;
  *(_DWORD *)v6 = v3;
  v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v3, 0, (dispatch_queue_t)&_dispatch_main_q);
  *((void *)v6 + 1) = v14;
  dispatch_set_context(v14, (void *)v3);
  dispatch_set_finalizer_f(*((dispatch_object_t *)v6 + 1), (dispatch_function_t)j__close);
  v15 = *((void *)v6 + 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100003D0C;
  handler[3] = &unk_10000C3F8;
  handler[4] = v6;
  dispatch_source_set_event_handler(v15, handler);
  sub_100004180((uint64_t)v6);
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = v6;
  v16 = SCDynamicStoreCreate(0, @"DHCPv6Server", (SCDynamicStoreCallBack)sub_1000059E0, &context);
  values = (void *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6);
  CFArrayRef v17 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  CFRelease(values);
  SCDynamicStoreSetNotificationKeys(v16, 0, v17);
  CFRelease(v17);
  *((void *)v6 + 6) = v16;
  SCDynamicStoreSetDispatchQueue(v16, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_resume(*((dispatch_object_t *)v6 + 1));
  return v6;
}

uint64_t sub_1000037C0()
{
  int v12 = 1;
  uint64_t v0 = socket(30, 2, 0);
  uint64_t v1 = v0;
  if ((v0 & 0x80000000) == 0)
  {
    *(void *)&v13.sa_len = 587341312;
    *(void *)&v13.sa_data[6] = 0;
    int v15 = 0;
    uint64_t v14 = 0;
    if (bind(v0, &v13, 0x1Cu))
    {
      _SC_LOG_DEFAULT();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
      {
LABEL_6:
        close(v1);
        return 0xFFFFFFFFLL;
      }
      uint64_t v2 = _os_log_pack_size();
      __chkstk_darwin(v2);
      __error();
    }
    else
    {
      if (ioctl(v1, 0x8004667EuLL, &v12) < 0)
      {
        _SC_LOG_DEFAULT();
        _SC_syslog_os_log_mapping();
        if (!__SC_log_enabled()) {
          goto LABEL_6;
        }
      }
      else
      {
        if ((setsockopt(v1, 41, 61, &v12, 4u) & 0x80000000) == 0) {
          return v1;
        }
        _SC_LOG_DEFAULT();
        _SC_syslog_os_log_mapping();
        if (!__SC_log_enabled()) {
          goto LABEL_6;
        }
      }
      uint64_t v11 = _os_log_pack_size();
      __chkstk_darwin(v11);
      __error();
    }
    uint64_t v3 = _os_log_pack_fill();
    v4 = __error();
    v5 = strerror(*v4);
    *(_DWORD *)uint64_t v3 = 136315138;
    *(void *)(v3 + 4) = v5;
    __SC_log_send();
    goto LABEL_6;
  }
  _SC_LOG_DEFAULT();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    uint64_t v6 = _os_log_pack_size();
    __chkstk_darwin(v6);
    __error();
    uint64_t v7 = _os_log_pack_fill();
    uint64_t v8 = __error();
    uint64_t v9 = strerror(*v8);
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = v9;
    __SC_log_send();
  }
  return v1;
}

const void *sub_100003B34()
{
  CFPropertyListRef v0 = sub_100006398("/var/db/com.apple.dhcp6d.plist");
  v10 = v0;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v0
    && CFGetTypeID(v0) == TypeID
    && (Value = CFDictionaryGetValue((CFDictionaryRef)v0, @"DUID"), CFTypeID v3 = CFDataGetTypeID(), Value)
    && CFGetTypeID(Value) == v3)
  {
    CFRetain(Value);
  }
  else
  {
    Value = sub_100004520();
    if (!Value) {
      goto LABEL_10;
    }
  }
  Mutable = CFStringCreateMutable(0, 0);
  BytePtr = (unsigned __int16 *)CFDataGetBytePtr((CFDataRef)Value);
  CFIndex Length = CFDataGetLength((CFDataRef)Value);
  sub_100008AFC(Mutable, BytePtr, Length);
  _SC_LOG_DEFAULT();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    uint64_t v7 = _os_log_pack_size();
    __chkstk_darwin(v7);
    __error();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)(v8 + 4) = Mutable;
    __SC_log_send();
  }
  CFRelease(Mutable);
LABEL_10:
  sub_100006360(&v10);
  return Value;
}

void sub_100003D0C(uint64_t a1)
{
}

void sub_100003D14(int *a1)
{
  memset(v19, 0, sizeof(v19));
  int v20 = 0;
  *(void *)&v17.msg_namelen = 28;
  *(void *)&v17.msg_iovlen = 1;
  v18[0] = v21;
  v18[1] = 1500;
  v17.msg_name = v19;
  v17.msg_iov = (iovec *)v18;
  v17.msg_control = &v22;
  *(void *)&v17.msg_controllen = 32;
  unint64_t v2 = recvmsg(*a1, &v17, 0);
  if ((v2 & 0x8000000000000000) != 0)
  {
    if (*__error() != 35)
    {
      _SC_LOG_DEFAULT();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v6 = _os_log_pack_size();
        __chkstk_darwin(v6);
        __error();
        uint64_t v7 = _os_log_pack_fill();
        uint64_t v8 = __error();
        uint64_t v9 = strerror(*v8);
        int v10 = *__error();
        *(_DWORD *)uint64_t v7 = 136315394;
        *(void *)(v7 + 4) = v9;
        *(_WORD *)(v7 + 12) = 1024;
        *(_DWORD *)(v7 + 14) = v10;
LABEL_8:
        __SC_log_send();
      }
    }
  }
  else
  {
    uint64_t v3 = v2;
    if (v2 <= 3)
    {
      _SC_LOG_DEFAULT();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        return;
      }
      uint64_t v4 = _os_log_pack_size();
      __chkstk_darwin(v4);
      __error();
      uint64_t v5 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v5 = 134218240;
      *(void *)(v5 + 4) = v3;
      *(_WORD *)(v5 + 12) = 1024;
      *(_DWORD *)(v5 + 14) = 4;
      goto LABEL_8;
    }
    if (v17.msg_controllen < 0xC) {
      goto LABEL_22;
    }
    msg_control = (unsigned int *)v17.msg_control;
    if (!v17.msg_control) {
      goto LABEL_22;
    }
    int v12 = 0;
    do
    {
      if (msg_control[1] == 41)
      {
        if (msg_control[2] == 46)
        {
          if (*msg_control >= 0x20) {
            int v12 = msg_control + 3;
          }
        }
        else
        {
          _SC_LOG_DEFAULT();
          _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            uint64_t v13 = _os_log_pack_size();
            __chkstk_darwin(v13);
            __error();
            uint64_t v14 = (_DWORD *)_os_log_pack_fill();
            unsigned int v15 = msg_control[2];
            _DWORD *v14 = 67109120;
            v14[1] = v15;
            __SC_log_send();
          }
        }
      }
      msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3) & 0x1FFFFFFFCLL));
    }
    while ((char *)(msg_control + 3) <= (char *)v17.msg_control + v17.msg_controllen);
    if (v12)
    {
      sub_10000499C((uint64_t)a1, (uint64_t)v19, v21, v3, v12[4]);
    }
    else
    {
LABEL_22:
      _SC_LOG_DEFAULT();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v16 = _os_log_pack_size();
        __chkstk_darwin(v16);
        __error();
        *(_WORD *)_os_log_pack_fill() = 0;
        __SC_log_send();
      }
    }
  }
}

void sub_100004180(uint64_t a1)
{
  CFPropertyListRef v2 = sub_100006398(*(const char **)(a1 + 24));
  uint64_t v9 = v2;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v2 && CFGetTypeID(v2) == TypeID)
  {
    CFTypeID v4 = CFDictionaryGetTypeID();
  }
  else
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v5 = _os_log_pack_size();
      __chkstk_darwin(v5);
      __error();
      uint64_t v6 = _os_log_pack_fill();
      uint64_t v7 = *(void *)(a1 + 24);
      *(_DWORD *)uint64_t v6 = 136315138;
      *(void *)(v6 + 4) = v7;
      __SC_log_send();
    }
    CFTypeID v4 = CFDictionaryGetTypeID();
    if (!v2)
    {
      CFDictionaryRef v8 = 0;
      goto LABEL_11;
    }
  }
  if (CFGetTypeID(v2) == v4) {
    CFDictionaryRef v8 = (const __CFDictionary *)v2;
  }
  else {
    CFDictionaryRef v8 = 0;
  }
LABEL_11:
  sub_100004304(a1, v8);
  sub_100006360(&v9);
}

void sub_100004304(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"enabled_interfaces");
    CFTypeID TypeID = CFArrayGetTypeID();
    if (Value && CFGetTypeID(Value) != TypeID) {
      Value = 0;
    }
    uint64_t v6 = CFDictionaryGetValue(theDict, @"options");
    CFTypeID v7 = CFDictionaryGetTypeID();
    if (v6 && CFGetTypeID(v6) != v7) {
      uint64_t v6 = 0;
    }
    CFBooleanRef v8 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"verbose");
    CFTypeID v9 = CFBooleanGetTypeID();
    if (v8)
    {
      if (CFGetTypeID(v8) == v9)
      {
        int v10 = CFBooleanGetValue(v8);
        if (v10 != byte_100010000)
        {
          byte_100010000 = v10 != 0;
          _SC_LOG_DEFAULT();
          _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            _os_log_pack_size();
            __chkstk_darwin();
            __error();
            uint64_t v11 = _os_log_pack_fill();
            if (byte_100010000) {
              int v12 = "enabled";
            }
            else {
              int v12 = "disabled";
            }
            *(_DWORD *)uint64_t v11 = 136315138;
            *(void *)(v11 + 4) = v12;
            __SC_log_send();
          }
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
    Value = 0;
  }
  sub_1000059EC(a1, Value);
  sub_100006238(a1, (const __CFDictionary *)v6);
}

__CFData *sub_100004520()
{
  CFPropertyListRef v0 = sub_100007C8C();
  uint64_t v13 = v0;
  if (!v0)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v1 = sub_100007B90((uint64_t)v0);
  if (!v1)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v2 = v1;
  uint64_t v3 = (const void *)sub_100008550(v1);
  int v4 = sub_100007C80(v2);
  unsigned int v5 = sub_100008534(v2);
  uint64_t v6 = sub_100008E28(v3, v4, v5);
  if (!v6)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_11:
      uint64_t v11 = _os_log_pack_size();
      __chkstk_darwin(v11);
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
      CFTypeID v7 = 0;
      goto LABEL_13;
    }
LABEL_12:
    CFTypeID v7 = 0;
    goto LABEL_13;
  }
  CFTypeID v7 = v6;
  sub_100004840(v6);
  _SC_LOG_DEFAULT();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    uint64_t v8 = _os_log_pack_size();
    __chkstk_darwin(v8);
    __error();
    uint64_t v9 = _os_log_pack_fill();
    uint64_t v10 = nullsub_1(v2);
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = v10;
    __SC_log_send();
  }
LABEL_13:
  sub_1000084B0((uint64_t *)&v13);
  return v7;
}

void sub_100004840(void *a1)
{
  values = a1;
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)&off_10000C418, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if ((sub_100006498(v3, (const std::__fs::filesystem::path *)"/var/db/com.apple.dhcp6d.plist", 0x1A4u) & 0x80000000) != 0)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v1 = _os_log_pack_size();
      __chkstk_darwin(v1);
      __error();
      uint64_t v2 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v2 = 136315138;
      *(void *)(v2 + 4) = "/var/db/com.apple.dhcp6d.plist";
      __SC_log_send();
    }
  }
  sub_100006360((const void **)&v3);
}

void sub_10000499C(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5)
{
  memset(v71, 0, sizeof(v71));
  int v68 = 0;
  v67[0] = 0;
  v67[1] = 0;
  uint64_t v7 = *(unsigned int *)(a1 + 72);
  if ((int)v7 < 1) {
    goto LABEL_15;
  }
  uint64_t v11 = 0;
  while (*(_DWORD *)(*(void *)(a1 + 56) + 4 * v11) != a5)
  {
    if (v7 == ++v11) {
      goto LABEL_15;
    }
  }
  if (v11 == 0xFFFFFFFFLL || !*(void *)(*(void *)(a1 + 64) + 8 * v11))
  {
LABEL_15:
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v17 = _os_log_pack_size();
      __chkstk_darwin(v17);
      __error();
      uint64_t v18 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v18 = 67109376;
      *(_DWORD *)(v18 + 4) = a5;
      *(_WORD *)(v18 + 8) = 1024;
      *(_DWORD *)(v18 + 10) = a4;
      __SC_log_send();
    }
  }
  else if (*a3 == 11)
  {
    uint64_t v66 = *(void *)(*(void *)(a1 + 64) + 8 * v11);
    int v12 = sub_10000953C((uint64_t)a3, a4, (char *)v71);
    v69 = v12;
    if (byte_100010000)
    {
      Mutable = CFStringCreateMutable(0, 0);
      DHCPv6PacketPrintToString(Mutable, a3, a4);
      if (v12) {
        sub_1000095A4(Mutable, (uint64_t)v12);
      }
      _SC_LOG_DEFAULT();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v14 = _os_log_pack_size();
        v65 = v12;
        v64 = v62;
        __chkstk_darwin(v14);
        __error();
        uint64_t v15 = _os_log_pack_fill();
        uint64_t v16 = inet_ntop(30, (const void *)(a2 + 8), v70, 0x2Eu);
        *(_DWORD *)uint64_t v15 = 136315650;
        *(void *)(v15 + 4) = v66;
        *(_WORD *)(v15 + 12) = 2080;
        *(void *)(v15 + 14) = v16;
        *(_WORD *)(v15 + 22) = 2112;
        *(void *)(v15 + 24) = Mutable;
        int v12 = v65;
        __SC_log_send();
      }
      CFRelease(Mutable);
    }
    else
    {
      uint64_t v23 = _SC_LOG_DEFAULT();
      int v24 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v25 = _os_log_pack_size();
        uint64_t v63 = v23;
        v64 = v62;
        __chkstk_darwin(v25);
        v65 = v12;
        __error();
        uint64_t v26 = _os_log_pack_fill();
        v27 = DHCPv6MessageTypeName(*a3);
        v62[3] = v24;
        v28 = v27;
        int v29 = *a3;
        v30 = inet_ntop(30, (const void *)(a2 + 8), v70, 0x2Eu);
        *(_DWORD *)uint64_t v26 = 136316162;
        *(void *)(v26 + 4) = v66;
        *(_WORD *)(v26 + 12) = 2080;
        *(void *)(v26 + 14) = v28;
        *(_WORD *)(v26 + 22) = 1024;
        *(_DWORD *)(v26 + 24) = v29;
        *(_WORD *)(v26 + 28) = 1024;
        *(_DWORD *)(v26 + 30) = a4;
        *(_WORD *)(v26 + 34) = 2080;
        *(void *)(v26 + 36) = v30;
        int v12 = v65;
        __SC_log_send();
      }
    }
    if (v12)
    {
      v31 = sub_100009700((uint64_t)v12, 2, (unsigned int *)&v68, 0);
      if (v31)
      {
        v32 = v31;
        if (!sub_100008DE0(v31, v68))
        {
          _SC_LOG_DEFAULT();
          _SC_syslog_os_log_mapping();
          if (__SC_log_enabled()) {
            goto LABEL_49;
          }
          goto LABEL_55;
        }
        CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 16));
        if (Length != v68 || (BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 16)), bcmp(v32, BytePtr, v68)))
        {
          _SC_LOG_DEFAULT();
          _SC_syslog_os_log_mapping();
          if (__SC_log_enabled()) {
            goto LABEL_49;
          }
          goto LABEL_55;
        }
      }
      DHCPv6PacketSetMessageType(&v72, 7);
      __int16 v73 = *(_WORD *)(a3 + 1);
      unsigned __int8 v74 = a3[3];
      sub_100009340((uint64_t)v67, (uint64_t)&v75, 1496);
      v37 = sub_100009700((uint64_t)v12, 1, (unsigned int *)&v68, 0);
      if (!v37) {
        goto LABEL_34;
      }
      v38 = v37;
      if (!sub_100008DE0(v37, v68))
      {
        _SC_LOG_DEFAULT();
        _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
LABEL_49:
          uint64_t v56 = _os_log_pack_size();
          __chkstk_darwin(v56);
          __error();
          *(_WORD *)_os_log_pack_fill() = 0;
LABEL_54:
          __SC_log_send();
        }
LABEL_55:
        sub_100009554(&v69);
        return;
      }
      if (!sub_100009354((uint64_t)v67, 1u, (unsigned __int16)v68, v38, (char *)v71))
      {
        _SC_LOG_DEFAULT();
        _SC_syslog_os_log_mapping();
        if (!__SC_log_enabled()) {
          goto LABEL_55;
        }
      }
      else
      {
LABEL_34:
        unsigned __int16 v39 = CFDataGetLength(*(CFDataRef *)(a1 + 16));
        v40 = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 16));
        if (sub_100009354((uint64_t)v67, 2u, v39, v40, (char *)v71))
        {
          v41 = sub_100009700((uint64_t)v12, 6, (unsigned int *)&v68, 0);
          if (v41 && *(void *)(a1 + 32) && v68 >= 2)
          {
            v42 = v41;
            uint64_t v43 = 0;
            while (1)
            {
              unsigned int v44 = bswap32(v42[v43]);
              unsigned int v45 = HIWORD(v44);
              CFDataRef v46 = (const __CFData *)sub_1000097AC(*(const __CFDictionary **)(a1 + 32), SHIWORD(v44));
              if (v46)
              {
                CFDataRef v47 = v46;
                unsigned __int16 v48 = CFDataGetLength(v46);
                v49 = (UInt8 *)CFDataGetBytePtr(v47);
                if (!sub_100009354((uint64_t)v67, v45, v48, v49, (char *)v71)) {
                  break;
                }
              }
              if (++v43 >= (unint64_t)v68 >> 1) {
                goto LABEL_42;
              }
            }
            _SC_LOG_DEFAULT();
            _SC_syslog_os_log_mapping();
            if (!__SC_log_enabled()) {
              goto LABEL_55;
            }
            uint64_t v59 = _os_log_pack_size();
            __chkstk_darwin(v59);
            __error();
            uint64_t v60 = _os_log_pack_fill();
            v61 = sub_10000910C(v45);
            *(_DWORD *)uint64_t v60 = 136315394;
            *(void *)(v60 + 4) = v61;
            *(_WORD *)(v60 + 12) = 2080;
            *(void *)(v60 + 14) = v71;
          }
          else
          {
LABEL_42:
            int v50 = sub_10000934C((uint64_t)v67);
            unsigned int v51 = sub_100005574((int *)a1, a5, (_OWORD *)(a2 + 8), &v72, (v50 + 4));
            int v52 = v51;
            if (v51 <= 0x32 && ((1 << v51) & 0x4000000000041) != 0) {
              goto LABEL_55;
            }
            _SC_LOG_DEFAULT();
            _SC_syslog_os_log_mapping();
            if (!__SC_log_enabled()) {
              goto LABEL_55;
            }
            uint64_t v53 = _os_log_pack_size();
            __chkstk_darwin(v53);
            __error();
            uint64_t v54 = _os_log_pack_fill();
            v55 = strerror(v52);
            *(_DWORD *)uint64_t v54 = 136315394;
            *(void *)(v54 + 4) = v66;
            *(_WORD *)(v54 + 12) = 2080;
            *(void *)(v54 + 14) = v55;
          }
          goto LABEL_54;
        }
        _SC_LOG_DEFAULT();
        _SC_syslog_os_log_mapping();
        if (!__SC_log_enabled()) {
          goto LABEL_55;
        }
      }
      uint64_t v57 = _os_log_pack_size();
      __chkstk_darwin(v57);
      __error();
      uint64_t v58 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v58 = 136315138;
      *(void *)(v58 + 4) = v71;
      goto LABEL_54;
    }
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v35 = _os_log_pack_size();
      __chkstk_darwin(v35);
      __error();
      uint64_t v36 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v36 = 136315138;
      *(void *)(v36 + 4) = v71;
      __SC_log_send();
    }
  }
  else
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v19 = _os_log_pack_size();
      __chkstk_darwin(v19);
      __error();
      uint64_t v20 = _os_log_pack_fill();
      v21 = DHCPv6MessageTypeName(*a3);
      int v22 = *a3;
      *(_DWORD *)uint64_t v20 = 136315906;
      *(void *)(v20 + 4) = v21;
      *(_WORD *)(v20 + 12) = 1024;
      *(_DWORD *)(v20 + 14) = v22;
      *(_WORD *)(v20 + 18) = 1024;
      *(_DWORD *)(v20 + 20) = a5;
      *(_WORD *)(v20 + 24) = 1024;
      *(_DWORD *)(v20 + 26) = a4;
      __SC_log_send();
    }
  }
}

uint64_t sub_100005574(int *a1, unsigned int a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5)
{
  uint64_t v36 = a3;
  memset(v40, 0, sizeof(v40));
  if (byte_100010000)
  {
    Mutable = CFStringCreateMutable(0, 0);
    DHCPv6PacketPrintToString(Mutable, a4, a5);
    uint64_t v10 = sub_10000953C((uint64_t)a4, a5, (char *)v40);
    *(void *)v37 = v10;
    if (v10)
    {
      sub_1000095A4(Mutable, (uint64_t)v10);
      sub_100009554((void **)v37);
    }
    else
    {
      _SC_LOG_DEFAULT();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v20 = _os_log_pack_size();
        uint64_t v35 = a1;
        __chkstk_darwin(v20);
        __error();
        uint64_t v21 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v21 = 136315138;
        *(void *)(v21 + 4) = v40;
        __SC_log_send();
        a1 = v35;
      }
    }
    uint64_t v22 = _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v23 = _os_log_pack_size();
      v34 = (void *)v22;
      uint64_t v35 = (int *)&v33;
      __chkstk_darwin(v23);
      __error();
      uint64_t v24 = _os_log_pack_fill();
      uint64_t v25 = Mutable;
      int v26 = a5;
      a5 = (uint64_t)a4;
      v27 = a1;
      unsigned int v28 = a2;
      int v29 = if_indextoname(a2, v39);
      v30 = inet_ntop(30, v36, v38, 0x2Eu);
      *(_DWORD *)uint64_t v24 = 136315906;
      *(void *)(v24 + 4) = v29;
      a2 = v28;
      a1 = v27;
      a4 = (unsigned __int8 *)a5;
      LODWORD(a5) = v26;
      Mutable = v25;
      *(_WORD *)(v24 + 12) = 1024;
      *(_DWORD *)(v24 + 14) = a5;
      *(_WORD *)(v24 + 18) = 2080;
      *(void *)(v24 + 20) = v30;
      *(_WORD *)(v24 + 28) = 2112;
      *(void *)(v24 + 30) = v25;
      __SC_log_send();
    }
    CFRelease(Mutable);
  }
  else
  {
    uint64_t v11 = _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v12 = _os_log_pack_size();
      LODWORD(v35) = a2;
      v34 = &v33;
      __chkstk_darwin(v12);
      __error();
      uint64_t v13 = _os_log_pack_fill();
      uint64_t v14 = if_indextoname(v35, v39);
      uint64_t v33 = v11;
      uint64_t v15 = v14;
      uint64_t v16 = DHCPv6MessageTypeName(*a4);
      uint64_t v17 = a1;
      int v18 = *a4;
      uint64_t v19 = inet_ntop(30, v36, v38, 0x2Eu);
      *(_DWORD *)uint64_t v13 = 136316162;
      *(void *)(v13 + 4) = v15;
      *(_WORD *)(v13 + 12) = 2080;
      *(void *)(v13 + 14) = v16;
      *(_WORD *)(v13 + 22) = 1024;
      *(_DWORD *)(v13 + 24) = v18;
      a1 = v17;
      *(_WORD *)(v13 + 28) = 1024;
      *(_DWORD *)(v13 + 30) = a5;
      *(_WORD *)(v13 + 34) = 2080;
      *(void *)(v13 + 36) = v19;
      a2 = v35;
      __SC_log_send();
    }
  }
  int v31 = *a1;
  *(_OWORD *)&v37[12] = *(long long *)((char *)&xmmword_10000AF68 + 12);
  *(_OWORD *)v37 = xmmword_10000AF68;
  *(_OWORD *)&v37[8] = *v36;
  *(_WORD *)&v37[2] = 8706;
  return sub_100008A08(v31, a2, v37, (uint64_t)a4, a5, -1);
}

void sub_1000059E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1000059EC(uint64_t a1, const void *a2)
{
  unsigned int v20 = 0;
  int v4 = *(const void **)(a1 + 40);
  uint64_t v19 = v4;
  if (!byte_100010000 || sub_100006964(v4, a2))
  {
    if (a2) {
      goto LABEL_4;
    }
LABEL_28:
    LODWORD(v6) = 0;
    unsigned int v5 = 0;
    uint64_t v8 = 0;
    char v14 = 1;
    goto LABEL_29;
  }
  _SC_LOG_DEFAULT();
  _SC_syslog_os_log_mapping();
  int v15 = __SC_log_enabled();
  if (!a2)
  {
    if (v15)
    {
      _os_log_pack_size();
      __chkstk_darwin();
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
      char v14 = 1;
      LODWORD(v6) = 0;
      unsigned int v5 = 0;
      goto LABEL_24;
    }
    goto LABEL_28;
  }
  if (v15)
  {
    _os_log_pack_size();
    __chkstk_darwin();
    __error();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 138412290;
    *(void *)(v16 + 4) = a2;
    __SC_log_send();
  }
LABEL_4:
  unsigned int v5 = sub_10000675C((const __CFArray *)a2, &v20);
  uint64_t v6 = v20;
  if (!v5)
  {
    char v14 = 0;
LABEL_24:
    uint64_t v8 = 0;
    goto LABEL_29;
  }
  uint64_t v7 = if_nameindex();
  uint64_t v8 = (int *)malloc_type_malloc(4 * (int)v6, 0x100004052888210uLL);
  if ((int)v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (v7 && (if_name = v7->if_name) != 0)
      {
        uint64_t v11 = (const char *)v5[i];
        uint64_t v12 = v7;
        while (strcmp(if_name, v11))
        {
          if_name = v12[1].if_name;
          ++v12;
          if (!if_name) {
            goto LABEL_12;
          }
        }
        int if_index = v12->if_index;
      }
      else
      {
LABEL_12:
        int if_index = 0;
      }
      v8[i] = if_index;
    }
  }
  if (v7) {
    if_freenameindex(v7);
  }
  LODWORD(v6) = v20;
  if (v8)
  {
    sub_100005D08(a1, (uint64_t)v8, (uint64_t)v5, v20);
    char v14 = 0;
    LODWORD(v6) = v20;
  }
  else
  {
    char v14 = 0;
  }
LABEL_29:
  sub_100005EAC(a1, v8, v6);
  uint64_t v17 = *(void **)(a1 + 56);
  if (v17) {
    free(v17);
  }
  int v18 = *(void **)(a1 + 64);
  if (v18) {
    free(v18);
  }
  *(_DWORD *)(a1 + 72) = v20;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v5;
  if ((v14 & 1) == 0) {
    CFRetain(a2);
  }
  *(void *)(a1 + 40) = a2;
  sub_100006360(&v19);
}

uint64_t sub_100005D08(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 >= 1)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = 0;
    uint64_t v8 = a4;
    do
    {
      int v9 = *(_DWORD *)(a2 + 4 * v7);
      if (v9)
      {
        uint64_t v10 = *(void *)(v4 + 8 * v7);
        uint64_t v11 = *(unsigned int *)(v6 + 72);
        if ((int)v11 < 1) {
          goto LABEL_10;
        }
        uint64_t v12 = *(int **)(v6 + 56);
        uint64_t v13 = 0xFFFFFFFFLL;
        while (1)
        {
          int v14 = *v12++;
          if (v14 == v9) {
            break;
          }
          --v13;
          if (!--v11) {
            goto LABEL_10;
          }
        }
        if (!v13)
        {
LABEL_10:
          result = sub_10000606C(*(_DWORD *)v6, 80, v9);
          if (!result)
          {
            _SC_LOG_DEFAULT();
            _SC_syslog_os_log_mapping();
            result = __SC_log_enabled();
            if (result)
            {
              _os_log_pack_size();
              __chkstk_darwin();
              __error();
              uint64_t v15 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v15 = 136315138;
              *(void *)(v15 + 4) = v10;
              result = __SC_log_send();
              uint64_t v4 = a3;
            }
          }
        }
      }
      ++v7;
    }
    while (v7 != v8);
  }
  return result;
}

uint64_t sub_100005EAC(uint64_t result, int *a2, unsigned int a3)
{
  if (*(int *)(result + 72) >= 1)
  {
    int v3 = a3;
    uint64_t v5 = result;
    uint64_t v6 = 0;
    uint64_t v7 = a3;
    do
    {
      uint64_t v8 = *(int *)(*(void *)(v5 + 56) + 4 * v6);
      if (v8)
      {
        uint64_t v9 = *(void *)(*(void *)(v5 + 64) + 8 * v6);
        if (!a2 || v3 < 1) {
          goto LABEL_11;
        }
        uint64_t v10 = a2;
        uint64_t v11 = v7;
        uint64_t v12 = 0xFFFFFFFFLL;
        while (1)
        {
          int v13 = *v10++;
          if (v13 == v8) {
            break;
          }
          --v12;
          if (!--v11) {
            goto LABEL_11;
          }
        }
        if (!v12)
        {
LABEL_11:
          result = sub_10000606C(*(_DWORD *)v5, 81, v8);
          if (!result)
          {
            _SC_LOG_DEFAULT();
            _SC_syslog_os_log_mapping();
            result = __SC_log_enabled();
            if (result)
            {
              _os_log_pack_size();
              __chkstk_darwin();
              __error();
              uint64_t v14 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v14 = 136315138;
              *(void *)(v14 + 4) = v9;
              result = __SC_log_send();
              int v3 = a3;
            }
          }
        }
      }
      ++v6;
    }
    while (v6 < *(int *)(v5 + 72));
  }
  return result;
}

uint64_t sub_10000606C(int a1, int a2, int a3)
{
  if ((a2 & 0xFFFFFFFE) != 0x50) {
    return 0xFFFFFFFFLL;
  }
  int v11 = a3;
  v12[0] = xmmword_10000AF84;
  memset((char *)&v12[1] + 12, 0, 100);
  *(_OWORD *)((char *)v12 + 12) = *(long long *)((char *)&xmmword_10000AF84 + 12);
  uint64_t v5 = setsockopt(a1, 41, a2, &v11, 0x84u);
  if (v5)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      __chkstk_darwin();
      __error();
      uint64_t v6 = _os_log_pack_fill();
      if (a2 == 80) {
        uint64_t v7 = "MCAST_JOIN_GROUP";
      }
      else {
        uint64_t v7 = "MCAST_LEAVE_GROUP";
      }
      uint64_t v8 = __error();
      uint64_t v9 = strerror(*v8);
      *(_DWORD *)uint64_t v6 = 136315650;
      *(void *)(v6 + 4) = v7;
      *(_WORD *)(v6 + 12) = 1024;
      *(_DWORD *)(v6 + 14) = a3;
      *(_WORD *)(v6 + 18) = 2080;
      *(void *)(v6 + 20) = v9;
      __SC_log_send();
    }
  }
  return v5;
}

void sub_100006238(uint64_t a1, const __CFDictionary *a2)
{
  if (!a2)
  {
LABEL_5:
    CFMutableDictionaryRef v3 = 0;
    goto LABEL_6;
  }
  CFMutableDictionaryRef v3 = sub_100009814(a2);
  if (!v3)
  {
    _SC_LOG_DEFAULT();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      __chkstk_darwin();
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
    }
    goto LABEL_5;
  }
LABEL_6:
  sub_100006360((const void **)(a1 + 32));
  *(void *)(a1 + 32) = v3;
}

void sub_100006360(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

CFPropertyListRef sub_100006398(const char *a1)
{
  memset(&v11, 0, sizeof(v11));
  if (stat(a1, &v11) < 0) {
    return 0;
  }
  off_t st_size = v11.st_size;
  if (!v11.st_size) {
    return 0;
  }
  CFMutableDictionaryRef v3 = malloc_type_malloc(v11.st_size, 0xE2EAFFC1uLL);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  int v5 = open(a1, 0);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    read(v5, v4, st_size);
    close(v6);
  }
  CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v4, st_size, kCFAllocatorNull);
  if (v7)
  {
    CFDataRef v8 = v7;
    CFPropertyListRef v9 = CFPropertyListCreateWithData(0, v7, 0, 0, 0);
    CFRelease(v8);
  }
  else
  {
    CFPropertyListRef v9 = 0;
  }
  free(v4);
  return v9;
}

uint64_t sub_100006498(CFPropertyListRef propertyList, const std::__fs::filesystem::path *a2, unsigned int a3)
{
  if (!propertyList) {
    return 0;
  }
  CFDataRef Data = CFPropertyListCreateData(0, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data) {
    return 0;
  }
  CFDataRef v6 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  size_t Length = CFDataGetLength(v6);
  snprintf((char *)__str, 0x400uLL, "%s-", (const char *)a2);
  int v9 = open((const char *)__str, 1537, a3);
  if (v9 < 0)
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  else
  {
    int v10 = v9;
    if (write(v9, BytePtr, Length) == Length)
    {
      rename(__str, a2, v11);
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    close(v10);
  }
  CFRelease(v6);
  return v12;
}

uint64_t sub_1000065BC(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  CFIndex usedBufLen = 0;
  v11.length = CFStringGetLength(a1);
  v11.location = 0;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  int v8 = usedBufLen;
  if (a2) {
    a2[usedBufLen] = 0;
  }
  return (v8 + 1);
}

uint64_t sub_100006644(const __CFArray *a1, uint64_t a2, unsigned int *a3, _DWORD *a4)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFIndex v9 = Count;
  signed int v10 = 8 * Count;
  if (a2)
  {
    if ((int)*a3 < v10) {
      return 0;
    }
    uint64_t v12 = (UInt8 *)(a2 + v10);
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (Count >= 1)
  {
    CFIndex v13 = 0;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v13);
      CFTypeID TypeID = CFStringGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID) {
        return 0;
      }
      if (a2)
      {
        int v16 = *a3 - v10;
        if (v16 < 0) {
          return 0;
        }
        int v17 = sub_1000065BC(ValueAtIndex, v12, v16, 0);
        *(void *)(a2 + 8 * v13) = v12;
        v12 += v17;
      }
      else
      {
        int v17 = sub_1000065BC(ValueAtIndex, v12, 0, 0);
      }
      v10 += v17;
    }
    while (v9 != ++v13);
  }
  *a3 = (v10 + 7) & 0xFFFFFFF8;
  *a4 = v9;
  return 1;
}

void *sub_10000675C(const __CFArray *a1, _DWORD *a2)
{
  size_t size = 0;
  *a2 = 0;
  if (!sub_100006644(a1, 0, (unsigned int *)&size, (_DWORD *)&size + 1)) {
    return 0;
  }
  uint64_t v4 = malloc_type_malloc((int)size, 0xA7A2F498uLL);
  if (!sub_100006644(a1, (uint64_t)v4, (unsigned int *)&size, (_DWORD *)&size + 1))
  {
    free(v4);
    return 0;
  }
  *a2 = HIDWORD(size);
  return v4;
}

uint64_t sub_1000067F4(const __CFString *a1, void *a2)
{
  *a2 = 0;
  a2[1] = 0;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64, 0x600u);
  if (result) {
    return inet_pton(30, buffer, a2) == 1;
  }
  return result;
}

void *sub_1000068AC(const __CFArray *a1, int *a2)
{
  int Count = CFArrayGetCount(a1);
  int v5 = Count;
  if (!Count) {
    return 0;
  }
  CFDataRef v6 = malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  CFDataRef v7 = v6;
  if (v5 >= 1)
  {
    CFIndex v8 = 0;
    CFIndex v9 = v6;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v8);
      if ((sub_1000067F4(ValueAtIndex, v9) & 1) == 0) {
        break;
      }
      ++v8;
      v9 += 2;
      if (v5 == v8) {
        goto LABEL_6;
      }
    }
    free(v7);
    return 0;
  }
LABEL_6:
  *a2 = v5;
  return v7;
}

uint64_t sub_100006964(const void *a1, const void *a2)
{
  if (!a1) {
    return a2 == 0;
  }
  if (!a2) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFGetTypeID(a2)) {
    return 0;
  }

  return CFEqual(a1, a2);
}

void sub_1000069E8(CFMutableStringRef theString, uint64_t a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    uint64_t v9 = 0;
    uint64_t v10 = a3;
    do
    {
      if (v9)
      {
        if (a4 != 32 || (v9 & 7) != 0) {
          *(_WORD *)CFRange v11 = a4;
        }
        else {
          strcpy(v11, "  ");
        }
      }
      else
      {
        v11[0] = 0;
      }
      CFStringAppendFormat(theString, 0, @"%s%02x", v11, *(unsigned __int8 *)(a2 + v9++));
    }
    while (v10 != v9);
  }
}

UInt8 *sub_100006AA8(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  CFIndex maxBufLen = 0;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0, 0, &maxBufLen);
  if (!maxBufLen) {
    return 0;
  }
  CFDataRef v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x10A3B885uLL);
  v10.CFIndex location = location;
  v10.CFIndex length = length;
  CFStringGetBytes(a1, v10, a3, 0, 0, v7, maxBufLen, &maxBufLen);
  v7[maxBufLen] = 0;
  return v7;
}

UInt8 *sub_100006B60(const __CFString *a1, CFStringEncoding a2)
{
  v4.CFIndex length = CFStringGetLength(a1);
  v4.CFIndex location = 0;

  return sub_100006AA8(a1, v4, a2);
}

CFDataRef sub_100006BA8(CFStringRef theString)
{
  return CFStringCreateExternalRepresentation(0, theString, 0x8000100u, 0);
}

void *sub_100006BC0(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
{
  uint64_t v5 = a4;
  CFDataRef v6 = a3;
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v7 = a1;
  int v8 = *a4;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  if (!a3)
  {
    *(void *)&long long v68 = 0;
    long long v67 = 0uLL;
    long long v65 = 0uLL;
    long long v66 = 0uLL;
    long long v63 = 0uLL;
    long long v64 = 0uLL;
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    int v8 = 128;
    uint64_t v9 = &v59;
    long long v59 = 0uLL;
    long long v60 = 0uLL;
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    int v10 = 0;
    goto LABEL_85;
  }
  long long v67 = 0uLL;
  *(void *)&long long v68 = 0;
  long long v65 = 0uLL;
  long long v66 = 0uLL;
  long long v63 = 0uLL;
  long long v64 = 0uLL;
  long long v61 = 0uLL;
  long long v62 = 0uLL;
  long long v59 = 0uLL;
  long long v60 = 0uLL;
  uint64_t v9 = (long long *)a3;
  LOBYTE(v67) = 1;
LABEL_7:
  *((void *)&v67 + 1) = v9;
  DWORD1(v68) = v8;
  *((void *)&v68 + 1) = 0;
  *(void *)&long long v69 = 0;
  BYTE8(v69) = a5;
  if (a2 < 1)
  {
    int v10 = 0;
LABEL_67:
    if (!v6)
    {
      CFDataRef v6 = malloc_type_malloc(v10, 0x64155627uLL);
      memcpy(v6, *((const void **)&v67 + 1), v10);
    }
    goto LABEL_84;
  }
  uint64_t v11 = 0;
  uint64_t v52 = a2;
  while (1)
  {
    uint64_t v54 = v11;
    uint64_t v12 = *(const char **)(v7 + 8 * v11);
    int v55 = v68;
    int v13 = strlen(v12);
    uint64_t v14 = (char *)malloc_type_malloc(v13 + 26, 0xA1EABF7AuLL);
    uint64_t v15 = malloc_type_malloc(0x30uLL, 0x101004044458BAAuLL);
    if (v15)
    {
      *(_OWORD *)((char *)v15 + 28) = 0u;
      _OWORD *v15 = 0u;
      v15[1] = 0u;
      *((_DWORD *)v15 + 11) = 8;
      *((void *)v15 + 4) = v15;
    }
    int v16 = v14 + 24;
    *(void *)uint64_t v14 = v15;
    *((void *)v14 + 1) = v14 + 24;
    if ((v13 & 0x80000000) == 0) {
      break;
    }
    int v19 = 0;
LABEL_22:
    *((_DWORD *)v14 + 4) = v19 + 1;
    v16[v19] = 0;
    if (!BYTE8(v69))
    {
      if ((sub_1000078E8((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0) {
        goto LABEL_75;
      }
      goto LABEL_64;
    }
    uint64_t v57 = v69;
    if ((int)v69 < 1)
    {
      unsigned int v24 = 0;
LABEL_41:
      if ((sub_1000078E8((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
      {
LABEL_75:
        if ((v68 & 0x80000000) != 0 || (int)v68 > SDWORD1(v68))
        {
          fprintf(__stderrp, "trying to set used to %d\n", v55);
          uint64_t v7 = a1;
        }
        else
        {
          LODWORD(v68) = v55;
          uint64_t v7 = a1;
        }
        sub_1000079D4((void **)v14);
        free(v14);
        goto LABEL_80;
      }
      uint64_t v23 = 0;
      unsigned int v38 = 0;
      char v37 = 1;
      goto LABEL_43;
    }
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    unsigned int v24 = 0;
    uint64_t v56 = *((void *)&v68 + 1);
    uint64_t v25 = *((void *)&v67 + 1);
    do
    {
      uint64_t v26 = *(void *)(v56 + 8 * v22);
      if (!v26) {
        break;
      }
      unsigned int v27 = 0;
      uint64_t v28 = *(unsigned int *)(v26 + 40);
      int v29 = *(void **)v14;
      uint64_t v30 = *(unsigned int *)(*(void *)v14 + 40);
      do
      {
        unsigned int v31 = v27;
        if ((int)v28 < 1) {
          break;
        }
        if ((int)v30 < 1) {
          break;
        }
        v32 = (unsigned __int8 *)(v25 + *(unsigned int *)(*(void *)(v26 + 32) + 4 * v28 - 4));
        size_t v33 = *v32;
        v34 = (unsigned __int8 *)(*((void *)v14 + 1) + *(unsigned int *)(v29[4] + 4 * v30 - 4));
        if (v33 != *v34) {
          break;
        }
        int v35 = memcmp(v32 + 1, v34 + 1, v33);
        unsigned int v27 = v31 + 1;
        --v28;
        --v30;
      }
      while (!v35);
      BOOL v36 = v31 > v24;
      if ((int)v31 > (int)v24) {
        unsigned int v24 = v31;
      }
      if (v36) {
        uint64_t v23 = v26;
      }
      ++v22;
    }
    while (v22 != v57);
    if (!v23) {
      goto LABEL_41;
    }
    char v37 = 0;
    unsigned int v38 = *(_DWORD *)(v23 + 40) - v24;
LABEL_43:
    unsigned __int16 v39 = *(void **)v14;
    uint64_t v40 = *(unsigned int *)(*(void *)v14 + 40);
    if ((int)v40 >= 1)
    {
      uint64_t v41 = 0;
      uint64_t v42 = v40 - v24;
      do
      {
        if (v41 >= (int)v42)
        {
          int v45 = *(_DWORD *)(*(void *)(v23 + 32) + 4 * (int)v38);
          if (v42 == v41)
          {
            __int16 __src = bswap32(v45 | 0xC000) >> 16;
            if (!sub_1000078E8((uint64_t)&v59, &__src, 2)) {
              goto LABEL_75;
            }
          }
          ++v38;
          uint64_t v43 = *(void **)v14;
        }
        else
        {
          uint64_t v43 = *(void **)v14;
          uint64_t v44 = *(unsigned int *)(*(void *)(*(void *)v14 + 32) + 4 * v41);
          if ((v37 & 1) == 0)
          {
            if (!sub_1000078E8((uint64_t)&v59, (void *)(*((void *)v14 + 1) + v44), *(unsigned __int8 *)(*((void *)v14 + 1) + v44) + 1))goto LABEL_75; {
            uint64_t v43 = *(void **)v14;
            }
          }
          int v45 = v44 + v55;
        }
        if (v41 > *((int *)v43 + 10)) {
          fprintf(__stderrp, "attempt to set offset 0x%x at index %d\n", v45, v41);
        }
        *(_DWORD *)(v43[4] + 4 * v41++) = v45;
      }
      while (v40 != v41);
      unsigned __int16 v39 = *(void **)v14;
    }
    uint64_t v46 = SDWORD1(v69);
    if (DWORD1(v69) == v69)
    {
      if (DWORD1(v69))
      {
        DWORD1(v69) *= 2;
        CFDataRef v47 = reallocf(*((void **)&v68 + 1), 16 * v46);
      }
      else
      {
        DWORD1(v69) = 8;
        CFDataRef v47 = malloc_type_malloc(0x40uLL, 0x2004093837F09uLL);
      }
      *((void *)&v68 + 1) = v47;
    }
    else
    {
      CFDataRef v47 = (void *)*((void *)&v68 + 1);
    }
    uint64_t v48 = (int)v69;
    LODWORD(v69) = v69 + 1;
    v47[v48] = v39;
    *(void *)uint64_t v14 = 0;
LABEL_64:
    sub_1000079D4((void **)v14);
    free(v14);
    uint64_t v7 = a1;
    uint64_t v11 = v54 + 1;
    if (v54 + 1 == v52)
    {
      int v10 = v68;
      CFDataRef v6 = a3;
      uint64_t v5 = a4;
      goto LABEL_67;
    }
  }
  uint64_t v17 = 0;
  size_t v18 = 0;
  int v19 = 0;
  int v20 = 0;
  while (1)
  {
    if (v17 != v13)
    {
      int v21 = v12[v17];
      if (v21 != 46)
      {
        ++v17;
        *(unsigned char *)(*((void *)v14 + 1) + v17) = v21;
        ++v20;
        goto LABEL_19;
      }
    }
    if (!v20)
    {
      fwrite("label length is 0\n", 0x12uLL, 1uLL, __stderrp);
      goto LABEL_71;
    }
    if (v20 >= 64) {
      break;
    }
    sub_100007850(*(int **)v14, v18);
    *(unsigned char *)(*((void *)v14 + 1) + v18) = v20;
    v19 += v20 + 1;
    size_t v18 = ++v17;
    int v20 = 0;
LABEL_19:
    if (v17 == v13 + 1)
    {
      int v16 = (char *)*((void *)v14 + 1);
      goto LABEL_22;
    }
  }
  fprintf(__stderrp, "label length %d > %d\n", v20, 63);
LABEL_71:
  sub_1000079D4((void **)v14);
  free(v14);
  if ((v68 & 0x80000000) != 0 || (int)v68 > SDWORD1(v68)) {
    fprintf(__stderrp, "trying to set used to %d\n", v55);
  }
  else {
    LODWORD(v68) = v55;
  }
LABEL_80:
  uint64_t v5 = a4;
  fprintf(__stderrp, "failed to add %s\n", *(const char **)(v7 + 8 * v54));
  if (a3) {
    int v10 = v68;
  }
  else {
    int v10 = 0;
  }
  CFDataRef v6 = 0;
LABEL_84:
  sub_1000071F8((uint64_t)&v59);
LABEL_85:
  _DWORD *v5 = v10;
  return v6;
}

void sub_1000071F8(uint64_t a1)
{
  sub_1000077F8((_OWORD *)a1);
  CFMutableDictionaryRef v3 = (void **)(a1 + 152);
  uint64_t v2 = *(void **)(a1 + 152);
  if (v2)
  {
    if (*(int *)(a1 + 160) >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      do
      {
        sub_1000079D4((void **)(*(void *)(a1 + 152) + v4));
        ++v5;
        v4 += 8;
      }
      while (v5 < *(int *)(a1 + 160));
      uint64_t v2 = *v3;
    }
    free(v2);
  }
  *CFMutableDictionaryRef v3 = 0;
  *(void *)(a1 + 160) = 0;
}

CFDataRef sub_100007270(const __CFArray *a1, char a2)
{
  CFIndex length = 0;
  CFMutableDictionaryRef v3 = sub_10000675C(a1, &length);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (UInt8 *)sub_100006BC0((uint64_t)v3, length, 0, (_DWORD *)&length + 1, a2);
  free(v4);
  CFDataRef v6 = CFDataCreate(0, v5, SHIDWORD(length));
  free(v5);
  return v6;
}

CFDataRef sub_1000072FC(const __CFString *a1)
{
  LODWORD(length) = 0;
  uint64_t v1 = sub_100006B60(a1, 0x8000100u);
  CFDataRef v6 = v1;
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  CFMutableDictionaryRef v3 = (UInt8 *)sub_100006BC0((uint64_t)&v6, 1, 0, &length, 0);
  free(v2);
  if (!v3) {
    return 0;
  }
  CFDataRef v4 = CFDataCreate(0, v3, (int)length);
  free(v3);
  return v4;
}

char *sub_10000738C(uint64_t a1, unsigned int a2, int *a3)
{
  __src[0] = 0;
  memset(v11, 0, sizeof(v11));
  __src[1] = v11;
  size_t __n = 0x8000000000;
  int v4 = sub_1000074A8(a1, a2, (uint64_t)v11, 0);
  int v5 = v4;
  if (v4)
  {
    CFDataRef v6 = (char *)malloc_type_malloc((int)__n + 8 * v4, 0x1C7CB10DuLL);
    uint64_t v7 = &v6[8 * v5];
    memcpy(v7, __src[1], (int)__n);
    if (v5 >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        *(void *)&v6[v8] = v7;
        v7 += strlen(v7) + 1;
        v8 += 8;
      }
      while (8 * v5 != v8);
    }
  }
  else
  {
    CFDataRef v6 = 0;
  }
  if (v6) {
    int v9 = v5;
  }
  else {
    int v9 = 0;
  }
  *a3 = v9;
  sub_1000077F8(v11);
  return v6;
}

uint64_t sub_1000074A8(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0;
  if (a1 && a2)
  {
    size_t v7 = 0;
    size_t v8 = 0;
    uint64_t v4 = 0;
    unsigned int v9 = 0;
    v30[1] = (void *)0x800000000;
    memset(v29, 0, sizeof(v29));
    v30[0] = v29;
    char v10 = 1;
    unsigned int v11 = a2;
    do
    {
      uint64_t v12 = (unsigned __int8 *)(a1 + v8);
      unsigned int v13 = *v12;
      if ((~v13 & 0xC0) != 0)
      {
        if (v8 >= v7)
        {
          if (v13 >= 0x40)
          {
            fprintf(__stderrp, "label length %d > %d\n");
            goto LABEL_48;
          }
          unsigned int v18 = v13 + 1;
          if (v11 <= v13)
          {
            fprintf(__stderrp, "label truncated %d < %d\n");
            goto LABEL_48;
          }
          size_t v7 = v18 + v7;
          v11 -= v18;
        }
        if (*v12)
        {
          char __src = 46;
          if (SLODWORD(v30[1]) < 1) {
            goto LABEL_29;
          }
          if (*(_DWORD *)v30[0] != v8)
          {
            uint64_t v19 = 1;
            do
            {
              unint64_t v20 = v19;
              if (LODWORD(v30[1]) == v19) {
                break;
              }
              int v21 = *((_DWORD *)v30[0] + v19++);
            }
            while (v21 != v8);
            if (v20 >= LODWORD(v30[1])) {
LABEL_29:
            }
              sub_100007850((int *)v29, v8);
          }
          if ((v10 & 1) == 0) {
            sub_1000078E8(a3, &__src, 1);
          }
          sub_1000078E8(a3, v12 + 1, v13);
          char v10 = 0;
          size_t v8 = v8 + v13 + 1;
        }
        else
        {
          char __src = 0;
          char v10 = 1;
          sub_1000078E8(a3, &__src, 1);
          uint64_t v4 = (v4 + 1);
          unsigned int v9 = v7;
          size_t v8 = v7;
          if (a4) {
            break;
          }
        }
      }
      else
      {
        if (a4)
        {
          uint64_t v22 = __stderrp;
          uint64_t v23 = "single name with pointers\n";
          size_t v24 = 26;
          goto LABEL_47;
        }
        if (v8 >= v7)
        {
          if (v11 <= 1)
          {
            uint64_t v22 = __stderrp;
            uint64_t v23 = "truncated pointer value\n";
            size_t v24 = 24;
            goto LABEL_47;
          }
          size_t v7 = (v7 + 2);
          v11 -= 2;
        }
        unsigned int v14 = bswap32(*(_WORD *)v12 & 0xFF3F);
        if (v8 <= HIWORD(v14))
        {
          uint64_t v22 = __stderrp;
          uint64_t v23 = "pointer points at or ahead of current position\n";
          size_t v24 = 47;
          goto LABEL_47;
        }
        size_t v8 = HIWORD(v14);
        if (v9 <= v8)
        {
          uint64_t v22 = __stderrp;
          uint64_t v23 = "attempt to create infinite loop\n";
          size_t v24 = 32;
          goto LABEL_47;
        }
        if (SLODWORD(v30[1]) < 1) {
          goto LABEL_38;
        }
        if (*(_DWORD *)v30[0] != v8)
        {
          uint64_t v15 = 1;
          do
          {
            unint64_t v16 = v15;
            if (LODWORD(v30[1]) == v15) {
              break;
            }
            int v17 = *((_DWORD *)v30[0] + v15++);
          }
          while (v17 != v8);
          if (v16 >= LODWORD(v30[1]))
          {
LABEL_38:
            uint64_t v22 = __stderrp;
            uint64_t v23 = "attempt to point off into the weeds\n";
            size_t v24 = 36;
            goto LABEL_47;
          }
        }
      }
    }
    while (v8 < a2);
    if (v4) {
      goto LABEL_49;
    }
    uint64_t v22 = __stderrp;
    if (*(_DWORD *)(a3 + 144))
    {
      uint64_t v23 = "name missing end label\n";
      size_t v24 = 23;
    }
    else
    {
      uint64_t v23 = "empty list\n";
      size_t v24 = 11;
    }
LABEL_47:
    fwrite(v23, v24, 1uLL, v22);
LABEL_48:
    sub_1000077F8((_OWORD *)a3);
    uint64_t v4 = 0;
LABEL_49:
    if (v30[0] && v30[0] != v29) {
      free(v30[0]);
    }
  }
  return v4;
}

double sub_1000077F8(_OWORD *a1)
{
  if (!*((unsigned char *)a1 + 128))
  {
    uint64_t v2 = (_OWORD *)*((void *)a1 + 17);
    if (v2) {
      BOOL v3 = v2 == a1;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      free(v2);
    }
  }
  *((void *)a1 + 18) = 0;
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

int *sub_100007850(int *result, size_t size)
{
  int v2 = size;
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[11];
  if (v4 == result[10])
  {
    result[11] = 2 * v4;
    int v5 = (void *)*((void *)result + 4);
    if (v5 == (void *)v3)
    {
      CFDataRef v6 = malloc_type_malloc(8 * v4, 0x100004052888210uLL);
      *(void *)(v3 + 32) = v6;
      double result = (int *)memmove(v6, (const void *)v3, 4 * *(int *)(v3 + 40));
    }
    else
    {
      double result = (int *)reallocf(v5, 8 * v4);
      *(void *)(v3 + 32) = result;
    }
  }
  uint64_t v7 = *(void *)(v3 + 32);
  uint64_t v8 = *(int *)(v3 + 40);
  *(_DWORD *)(v3 + 40) = v8 + 1;
  *(_DWORD *)(v7 + 4 * v8) = v2;
  return result;
}

uint64_t sub_1000078E8(uint64_t a1, void *__src, int a3)
{
  int v6 = *(_DWORD *)(a1 + 148);
  int v7 = v6 - *(_DWORD *)(a1 + 144);
  if (v7 < a3)
  {
    if (*(unsigned char *)(a1 + 128))
    {
      fprintf(__stderrp, "user-supplied buffer failed to add data with length %d (> %d)\n", a3, v7);
      return 0;
    }
    if (a3 <= 128) {
      int v9 = 128;
    }
    else {
      int v9 = a3;
    }
    int v10 = v6 + v9;
    *(_DWORD *)(a1 + 148) = v10;
    unsigned int v11 = *(void **)(a1 + 136);
    if (v11 == (void *)a1)
    {
      uint64_t v12 = malloc_type_malloc(v10, 0x6DA55C14uLL);
      *(void *)(a1 + 136) = v12;
      memcpy(v12, (const void *)a1, *(int *)(a1 + 144));
    }
    else
    {
      *(void *)(a1 + 136) = reallocf(v11, v10);
    }
  }
  memcpy((void *)(*(void *)(a1 + 136) + *(int *)(a1 + 144)), __src, a3);
  *(_DWORD *)(a1 + 144) += a3;
  return 1;
}

void sub_1000079D4(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void *)v2[4];
      if (v3) {
        BOOL v4 = v3 == v2;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4) {
        free(v3);
      }
      free(v2);
      *a1 = 0;
    }
  }
}

void *sub_100007A24(void *a1, uint64_t a2, uint64_t a3)
{
  double result = sub_100008828(a1);
  a1[2] = a2;
  a1[3] = a3;
  return result;
}

void sub_100007A5C(uint64_t *a1)
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v3 = 0;
  while (sub_1000088A0(a1, 0, &v3))
  {
    if (v3)
    {
      int v2 = *(void (**)(void))(v1 + 16);
      if (v2) {
        v2();
      }
    }
    a1 = (uint64_t *)v1;
  }
  sub_100008830(v1);
}

__n128 sub_100007AC4(__n128 *a1)
{
  int v2 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  if (v2)
  {
    __n128 result = *a1;
    *int v2 = *a1;
  }
  return result;
}

uint64_t sub_100007B0C(uint64_t *a1, char *__s2)
{
  uint64_t v4 = -96;
  uint64_t v5 = -1;
  while (1)
  {
    int v6 = a1 ? *((_DWORD *)a1 + 2) : 0;
    if (++v5 >= v6) {
      break;
    }
    uint64_t v7 = v4 + 96;
    uint64_t v8 = *a1;
    int v9 = strcmp((const char *)(*a1 + v4 + 96), __s2);
    uint64_t v4 = v7;
    if (!v9) {
      return v8 + v7;
    }
  }
  return 0;
}

uint64_t sub_100007B90(uint64_t a1)
{
  uint64_t result = sub_100007B0C((uint64_t *)a1, "en0");
  if (!result)
  {
    if (a1 && (uint64_t v3 = *(unsigned int *)(a1 + 8), (int)v3 >= 1))
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      int v6 = 0;
      uint64_t v7 = *(int *)(a1 + 8);
      do
      {
        if (v4 >= v7) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = *(void *)a1 + 96 * v4;
        }
        int v9 = *(unsigned __int8 *)(v8 + 18);
        if (v9 == 6 || v9 == 144)
        {
          if (v6)
          {
            if (strcmp((const char *)v8, v6) < 0) {
              int v6 = (const char *)v8;
            }
          }
          else
          {
            int v6 = (const char *)v8;
          }
        }
        else if (!v5)
        {
          if (*(unsigned char *)(v8 + 74)) {
            uint64_t v5 = v8;
          }
          else {
            uint64_t v5 = 0;
          }
        }
        ++v4;
      }
      while (v4 != v3);
    }
    else
    {
      int v6 = 0;
      uint64_t v5 = 0;
    }
    if (v5) {
      BOOL v10 = v6 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10) {
      return v5;
    }
    else {
      return (uint64_t)v6;
    }
  }
  return result;
}

uint64_t sub_100007C80(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 74);
}

void *sub_100007C8C()
{
  CFPropertyListRef v0 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  uint64_t v1 = v0;
  if (v0 && !sub_100007CE4((uint64_t)v0))
  {
    free(v1);
    return 0;
  }
  return v1;
}

uint64_t sub_100007CE4(uint64_t a1)
{
  long long v63 = 0;
  memset(v67, 0, 44);
  *(void *)a1 = 0;
  int v2 = getifaddrs(&v63);
  uint64_t v3 = v63;
  if (v2 < 0) {
    goto LABEL_89;
  }
  if (!v63)
  {
LABEL_91:
    uint64_t result = *(void *)a1;
    if (*(void *)a1)
    {
      free((void *)result);
      uint64_t result = 0;
      *(void *)a1 = 0;
    }
    return result;
  }
  int v4 = 0;
  uint64_t v5 = v63;
  while (v5->ifa_addr)
  {
    uint64_t v5 = v5->ifa_next;
    --v4;
    if (!v5) {
      goto LABEL_8;
    }
  }
  if (!v4)
  {
LABEL_89:
    if (v3) {
      freeifaddrs(v3);
    }
    goto LABEL_91;
  }
LABEL_8:
  int v6 = -v4;
  uint64_t v7 = malloc_type_malloc(96 * -v4, 0x1080040B03B560BuLL);
  *(void *)a1 = v7;
  if (!v7)
  {
    uint64_t v3 = v63;
    goto LABEL_89;
  }
  int v8 = socket(2, 2, 0);
  uint64_t v3 = v63;
  if (v8 < 0) {
    goto LABEL_89;
  }
  int v9 = v8;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = v6;
  size_t v10 = 96;
  if (!v3) {
    goto LABEL_94;
  }
  int v62 = v8;
  do
  {
    ifa_addr = v3->ifa_addr;
    if (!ifa_addr) {
      goto LABEL_82;
    }
    ifa_name = v3->ifa_name;
    int sa_family = ifa_addr->sa_family;
    if (sa_family == 2)
    {
      uint64_t v20 = 96 * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
      uint64_t v21 = -96;
      do
      {
        uint64_t v22 = v21 + 96;
        if (v20 == v21 + 96) {
          goto LABEL_30;
        }
        uint64_t v23 = *(void *)a1;
        int v24 = strcmp((const char *)(*(void *)a1 + v21 + 96), ifa_name);
        uint64_t v21 = v22;
      }
      while (v24);
      if (v23)
      {
        uint64_t v25 = v23 + v22;
LABEL_32:
        int v33 = *(_DWORD *)&ifa_addr->sa_data[2];
        ifa_netmask = v3->ifa_netmask;
        if (ifa_netmask) {
          int v35 = *(_DWORD *)&ifa_netmask->sa_data[2];
        }
        else {
          int v35 = 0;
        }
        if ((*(_WORD *)(v25 + 16) & 2) != 0 && (ifa_dstaddr = v3->ifa_dstaddr) != 0) {
          int v37 = *(_DWORD *)&ifa_dstaddr->sa_data[2];
        }
        else {
          int v37 = 0;
        }
        unsigned int v38 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
        if (v38)
        {
          _DWORD *v38 = v33;
          v38[1] = v35;
          v38[2] = v35 & v33;
          v38[3] = v37;
        }
        sub_100007AC0(v25 + 24, v38);
        goto LABEL_82;
      }
LABEL_30:
      uint64_t v32 = sub_100008794((uint64_t *)a1);
      if (v32)
      {
        uint64_t v25 = v32;
        *(_WORD *)(v32 + 16) = v3->ifa_flags;
        ifa_addr = v3->ifa_addr;
        goto LABEL_32;
      }
      sub_100008FC4();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_82;
      }
      goto LABEL_45;
    }
    if (sa_family != 18) {
      goto LABEL_82;
    }
    uint64_t v14 = 96 * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
    uint64_t v15 = -96;
    do
    {
      uint64_t v16 = v15 + 96;
      if (v14 == v15 + 96) {
        goto LABEL_25;
      }
      uint64_t v17 = *(void *)a1;
      int v18 = strcmp((const char *)(*(void *)a1 + v15 + 96), ifa_name);
      uint64_t v15 = v16;
    }
    while (v18);
    if (v17)
    {
      uint64_t v19 = v17 + v16;
      goto LABEL_27;
    }
LABEL_25:
    uint64_t v26 = sub_100008794((uint64_t *)a1);
    if (!v26)
    {
      sub_100008FC4();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_82;
      }
LABEL_45:
      uint64_t v39 = _os_log_pack_size();
      __chkstk_darwin(v39);
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
      goto LABEL_82;
    }
    uint64_t v19 = v26;
    *(_WORD *)(v26 + 16) = v3->ifa_flags;
LABEL_27:
    unsigned int v27 = ifa_addr->sa_data[4];
    if (v27 >= 0x11)
    {
      sub_100008FC4();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v28 = _os_log_pack_size();
        __chkstk_darwin(v28);
        __error();
        uint64_t v29 = _os_log_pack_fill();
        int v30 = ifa_addr->sa_data[2];
        int v31 = ifa_addr->sa_data[4];
        *(_DWORD *)uint64_t v29 = 136315906;
        *(void *)(v29 + 4) = ifa_name;
        *(_WORD *)(v29 + 12) = 1024;
        *(_DWORD *)(v29 + 14) = v30;
        *(_WORD *)(v29 + 18) = 1024;
        *(_DWORD *)(v29 + 20) = v31;
        *(_WORD *)(v29 + 24) = 2048;
        unsigned int v27 = 16;
        *(void *)(v29 + 26) = 16;
        __SC_log_send();
        int v9 = v62;
      }
      else
      {
        unsigned int v27 = 16;
      }
    }
    *(unsigned char *)(v19 + 74) = v27;
    memmove((void *)(v19 + 56), &ifa_addr->sa_data[ifa_addr->sa_data[3] + 6], v27);
    char v40 = ifa_addr->sa_data[2];
    *(unsigned char *)(v19 + 75) = v40;
    *(_WORD *)(v19 + 72) = *(_WORD *)ifa_addr->sa_data;
    ifa_data = (char *)v3->ifa_data;
    if (ifa_data) {
      char v40 = *ifa_data;
    }
    *(unsigned char *)(v19 + 18) = v40;
    if (sub_100008558(v9, (uint64_t)ifa_name, (uint64_t)v67))
    {
      if (*(unsigned char *)(v19 + 18) == 6)
      {
        uint64_t v42 = sub_1000085EC(v9, (uint64_t)ifa_name);
        if ((v42 & 0x4000) != 0) {
          *(unsigned char *)(v19 + 19) |= 8u;
        }
        if ((v67[1] & 0xE0) == 0x80)
        {
          char v43 = *(unsigned char *)(v19 + 19);
          *(unsigned char *)(v19 + 19) = v43 | 1;
          if ((v42 & 0x100000) != 0)
          {
            char v57 = v43 | 3;
            goto LABEL_70;
          }
          keys = @"IOInterfaceName";
          values = (void *)CFStringCreateWithCString(0, ifa_name, 0x8000100u);
          long long v64 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          keys = @"IOPropertyMatch";
          CFDictionaryRef v44 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v64, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(v64);
          io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v44);
          if (MatchingService)
          {
            io_object_t v46 = MatchingService;
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IO80211InterfaceRole", kCFAllocatorDefault, 0);
            if (CFProperty)
            {
              uint64_t v48 = CFProperty;
              CFTypeID TypeID = CFStringGetTypeID();
              BOOL v50 = CFGetTypeID(v48) == TypeID && CFEqual(v48, @"Infrastructure") != 0;
              CFRelease(v48);
              IOObjectRelease(v46);
              if (v50)
              {
                char v57 = *(unsigned char *)(v19 + 19) | 0x10;
LABEL_70:
                *(unsigned char *)(v19 + 19) = v57;
              }
            }
            else
            {
              IOObjectRelease(v46);
            }
          }
        }
        else
        {
          CFStringRef v51 = CFStringCreateWithCString(0, ifa_name, 0x8000100u);
          uint64_t v52 = _SCNetworkInterfaceCreateWithBSDName();
          if (v52)
          {
            uint64_t v53 = (const void *)v52;
            int IsTetheredHotspot = _SCNetworkInterfaceIsTetheredHotspot();
            int IsCarPlay = _SCNetworkInterfaceIsCarPlay();
            CFRelease(v53);
            if (IsCarPlay)
            {
              if (IsTetheredHotspot) {
                char v56 = 36;
              }
              else {
                char v56 = 32;
              }
              CFRelease(v51);
            }
            else
            {
              CFRelease(v51);
              if (!IsTetheredHotspot) {
                goto LABEL_71;
              }
              char v56 = 4;
            }
            char v57 = *(unsigned char *)(v19 + 19) | v56;
            goto LABEL_70;
          }
          CFRelease(v51);
        }
      }
LABEL_71:
      if (SLODWORD(v67[2]) < 1)
      {
        int v59 = 0;
        unint64_t v58 = 0;
        uint64_t v60 = 0;
      }
      else
      {
        unint64_t v58 = (unint64_t)(BYTE8(v67[1]) & 2) << 31;
        if (BYTE8(v67[1])) {
          int v59 = (DWORD2(v67[1]) >> 2) & 1;
        }
        else {
          int v59 = 0;
        }
        if ((BYTE8(v67[1]) & 1) == 0) {
          unint64_t v58 = 0;
        }
        uint64_t v60 = 1;
        if ((BYTE8(v67[1]) & 1) == 0) {
          uint64_t v60 = 0;
        }
      }
      *(void *)(v19 + 80) = v60 | v58;
      *(_DWORD *)(v19 + 88) = v59;
    }
LABEL_82:
    uint64_t v3 = v3->ifa_next;
  }
  while (v3);
  size_t v10 = 96 * *(int *)(a1 + 8) + 96;
LABEL_94:
  *(void *)a1 = reallocf(*(void **)a1, v10);
  if (v63) {
    freeifaddrs(v63);
  }
  if ((v9 & 0x80000000) == 0) {
    close(v9);
  }
  return 1;
}

void sub_1000084B0(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      if (*(int *)(v2 + 8) >= 1)
      {
        uint64_t v3 = 0;
        uint64_t v4 = 24;
        do
        {
          sub_100007A5C((uint64_t *)(*(void *)v2 + v4));
          ++v3;
          v4 += 96;
        }
        while (v3 < *(int *)(v2 + 8));
      }
      if (*(void *)v2) {
        free(*(void **)v2);
      }
      free((void *)v2);
      *a1 = 0;
    }
  }
}

uint64_t sub_100008534(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 75);
  if (v1 == 144) {
    unsigned int v2 = 24;
  }
  else {
    unsigned int v2 = -1;
  }
  if (v1 == 6) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t sub_100008550(uint64_t a1)
{
  return a1 + 56;
}

uint64_t sub_100008558(int a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)(a3 + 28) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  __strlcpy_chk();
  if (ioctl(a1, 0xC02C6938uLL, a3) != -1) {
    return 1;
  }
  if (*__error() != 102) {
    return 0;
  }
  *(_DWORD *)(a3 + 24) = 3;
  uint64_t result = 1;
  *(_DWORD *)(a3 + 32) = 1;
  return result;
}

uint64_t sub_1000085EC(int a1, uint64_t a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  __strlcpy_chk();
  if (ioctl(a1, 0xC020698EuLL, &v9) != -1) {
    return v10;
  }
  if (*__error() != 6 && *__error() != 82 && *__error() != 22)
  {
    sub_100008FC4();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v5 = _os_log_pack_size();
      __chkstk_darwin(v5);
      __error();
      uint64_t v6 = _os_log_pack_fill();
      uint64_t v7 = __error();
      int v8 = strerror(*v7);
      *(_DWORD *)uint64_t v6 = 136315394;
      *(void *)(v6 + 4) = a2;
      *(_WORD *)(v6 + 12) = 2080;
      *(void *)(v6 + 14) = v8;
      __SC_log_send();
    }
  }
  return 0;
}

uint64_t sub_100008794(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 2);
  if (v1 >= *((_DWORD *)a1 + 3)) {
    return 0;
  }
  uint64_t v2 = *a1;
  *((_DWORD *)a1 + 2) = v1 + 1;
  uint64_t v3 = v2 + 96 * v1;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  __strlcpy_chk();
  sub_100007A24((void *)(v3 + 24), (uint64_t)j__free, (uint64_t)sub_100007AC4);
  return v3;
}

void *sub_100008828(void *result)
{
  *uint64_t result = 0;
  result[1] = 0;
  return result;
}

void sub_100008830(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

uint64_t sub_100008860(uint64_t result)
{
  if (result)
  {
    if (*(void *)result) {
      return *(unsigned int *)(result + 12);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000887C(uint64_t a1, int a2)
{
  if (*(void *)a1 && *(_DWORD *)(a1 + 12) > a2) {
    return *(void *)(*(void *)a1 + 8 * a2);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000088A0(uint64_t *a1, unsigned int a2, void *a3)
{
  uint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  uint64_t result = 0;
  if ((a2 & 0x80000000) == 0)
  {
    int v6 = *((_DWORD *)a1 + 3);
    if (v6 > (int)a2)
    {
      if (a3) {
        *a3 = *(void *)(v3 + 8 * a2);
      }
      if ((int)(v6 + ~a2) >= 1)
      {
        memmove((void *)(*a1 + 8 * a2), (const void *)(*a1 + 8 * (a2 + 1)), 8 * (v6 + ~a2));
        int v6 = *((_DWORD *)a1 + 3);
      }
      *((_DWORD *)a1 + 3) = v6 - 1;
      return 1;
    }
  }
  return result;
}

BOOL sub_100008928(uint64_t a1, uint64_t a2)
{
  BOOL result = sub_10000896C(a1);
  if (result)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(int *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v6 + 1;
    *(void *)(v5 + 8 * v6) = a2;
    return 1;
  }
  return result;
}

BOOL sub_10000896C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  int v3 = *(_DWORD *)(a1 + 8);
  if (!v2)
  {
    if (!v3)
    {
      int v3 = 16;
      *(_DWORD *)(a1 + 8) = 16;
    }
    *(_DWORD *)(a1 + 12) = 0;
    uint64_t v2 = malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
    goto LABEL_7;
  }
  if (v3 == *(_DWORD *)(a1 + 12))
  {
    *(_DWORD *)(a1 + 8) = 2 * v3;
    uint64_t v2 = malloc_type_realloc(v2, 16 * v3, 0x80040B8603338uLL);
LABEL_7:
    *(void *)a1 = v2;
  }
  return v2 != 0;
}

void sub_100008A00(__CFString *a1, uint64_t a2, int a3)
{
}

uint64_t sub_100008A08(int a1, int a2, void *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = a5;
  v11[0] = a4;
  v11[1] = a5;
  v10.msg_name = a3;
  *(&v10.msg_namelen + 1) = 0;
  v10.msg_namelen = 28;
  v10.msg_iov = (iovec *)v11;
  *(&v10.msg_iovlen + 1) = 0;
  v10.msg_iovlen = 1;
  v10.msg_control = &v12;
  if (a6 >= 0) {
    socklen_t v7 = 48;
  }
  else {
    socklen_t v7 = 32;
  }
  v10.msg_controllen = v7;
  v10.msg_flags = 0;
  long long v15 = 0u;
  long long v14 = 0u;
  int v13 = 46;
  uint64_t v12 = 0x2900000020;
  int v16 = 0;
  LODWORD(v15) = a2;
  if ((a6 & 0x80000000) == 0)
  {
    *(void *)((char *)&v15 + 4) = 0x2900000010;
    HIDWORD(v15) = 47;
    int v16 = a6;
  }
  ssize_t v8 = sendmsg(a1, &v10, 0);
  uint64_t result = 0;
  if (v8 != v6) {
    return *__error();
  }
  return result;
}

void sub_100008AFC(CFMutableStringRef theString, unsigned __int16 *a2, uint64_t a3)
{
  int v3 = a3;
  if ((int)a3 >= 2)
  {
    uint64_t v7 = bswap32(*a2) >> 16;
    switch((int)v7)
    {
      case 1:
        int v8 = a3 - 8;
        if (a3 < 8)
        {
          uint64_t v6 = 8;
          goto LABEL_3;
        }
        CFStringAppendFormat(theString, 0, @"DUID LLT HW %d Time %u Addr ", bswap32(a2[1]) >> 16, bswap32(*((_DWORD *)a2 + 1)));
        uint64_t v10 = (uint64_t)(a2 + 4);
        goto LABEL_19;
      case 2:
        int v8 = a3 - 6;
        if (a3 < 6)
        {
          uint64_t v6 = 6;
          goto LABEL_3;
        }
        CFStringAppendFormat(theString, 0, @"DUID EN Num %d Id ", __rev16(a2[2]));
        uint64_t v10 = (uint64_t)(a2 + 3);
        goto LABEL_19;
      case 3:
        int v8 = a3 - 4;
        if (a3 < 4)
        {
          uint64_t v6 = 4;
          goto LABEL_3;
        }
        CFStringAppendFormat(theString, 0, @"DUID LL HW %d Addr ", bswap32(a2[1]) >> 16);
        uint64_t v10 = (uint64_t)(a2 + 2);
LABEL_19:
        long long v9 = theString;
        int v11 = v8;
        int v12 = 58;
LABEL_20:
        sub_1000069E8(v9, v10, v11, v12);
        return;
      case 4:
        if (a3 < 0x12)
        {
          uint64_t v6 = 18;
          goto LABEL_3;
        }
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)a2 + 2, out);
        CFStringAppendFormat(theString, 0, @"DUID UUID %s", out);
        break;
      default:
        CFStringAppendFormat(theString, 0, @"DUID (unrecognized type=%d): ", v7);
        long long v9 = theString;
        uint64_t v10 = (uint64_t)a2;
        int v11 = v3;
        int v12 = 32;
        goto LABEL_20;
    }
  }
  else
  {
    uint64_t v6 = 2;
LABEL_3:
    CFStringAppendFormat(theString, 0, @"DUID too short (%d < %d), CFDataRef Data = { ", a3, v6);
    sub_1000069E8(theString, (uint64_t)a2, v3, 32);
    CFStringAppendCString(theString, " }", 0x600u);
  }
}

BOOL sub_100008DE0(unsigned __int16 *a1, int a2)
{
  if (a2 < 2) {
    return 0;
  }
  unsigned int v2 = (bswap32(*a1) >> 16) - 1;
  return (unsigned __int16)v2 <= 3u && dword_10000AFB0[(__int16)v2] <= a2;
}

__CFData *sub_100008E28(const void *a1, int a2, unsigned int a3)
{
  size_t v5 = a2;
  CFIndex v6 = a2 + 8;
  Mutable = CFDataCreateMutable(0, v6);
  CFDataSetLength(Mutable, v6);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *(_WORD *)MutableBytePtr = 256;
  *((_WORD *)MutableBytePtr + 1) = bswap32(a3) >> 16;
  memcpy(MutableBytePtr + 8, a1, v5);
  memset(&v11, 0, sizeof(v11));
  v11.tm_year = 100;
  v11.tm_mday = 1;
  int v9 = timegm(&v11);
  *((_DWORD *)MutableBytePtr + 1) = bswap32(time(0) - v9);
  return Mutable;
}

const char *DHCPv6MessageTypeName(unsigned int a1)
{
  if (a1 > 0xD) {
    return "<unknown";
  }
  else {
    return off_10000C420[(char)a1];
  }
}

unsigned char *DHCPv6PacketSetMessageType(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void DHCPv6PacketPrintToString(CFMutableStringRef theString, unsigned __int8 *a2, uint64_t a3)
{
  if ((int)a3 > 3)
  {
    uint64_t v6 = *a2;
    uint64_t v7 = DHCPv6MessageTypeName(*a2);
    CFStringAppendFormat(theString, 0, @"DHCPv6 %s (%d) Transaction ID 0x%06x Length %d\n", v7, v6, bswap32((a2[1] << 8) | (a2[2] << 16) | (a2[3] << 24)), a3);
  }
  else
  {
    CFStringAppendFormat(theString, 0, @"Packet too short %d < %d\n", a3, 4);
  }
}

uint64_t sub_100008FC4()
{
  return qword_100010008;
}

uint64_t sub_100008FD0(int a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 1:
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 7;
      break;
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
      return result;
    case 5:
      uint64_t result = 8;
      break;
    case 6:
    case 8:
      uint64_t result = 3;
      break;
    case 12:
    case 22:
    case 23:
      uint64_t result = 5;
      break;
    case 13:
      uint64_t result = 9;
      break;
    case 14:
      uint64_t result = 0;
      break;
    case 21:
    case 24:
      uint64_t result = 6;
      break;
    case 25:
      uint64_t result = 11;
      break;
    case 26:
      uint64_t result = 12;
      break;
    case 41:
    case 42:
      goto LABEL_7;
    default:
      if (a1 == 103) {
LABEL_7:
      }
        uint64_t result = 10;
      break;
  }
  return result;
}

const char *sub_10000910C(int a1)
{
  int v1 = a1 - 1;
  uint64_t result = "CLIENTID";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "SERVERID";
      break;
    case 2:
      uint64_t result = "IA_NA";
      break;
    case 3:
      uint64_t result = "IA_TA";
      break;
    case 4:
      uint64_t result = "IAADDR";
      break;
    case 5:
      uint64_t result = "ORO";
      break;
    case 6:
      uint64_t result = "PREFERENCE";
      break;
    case 7:
      uint64_t result = "ELAPSED_TIME";
      break;
    case 8:
      uint64_t result = "RELAY_MSG";
      break;
    case 9:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
      goto LABEL_5;
    case 10:
      uint64_t result = "AUTH";
      break;
    case 11:
      uint64_t result = "UNICAST";
      break;
    case 12:
      uint64_t result = "STATUS_CODE";
      break;
    case 13:
      uint64_t result = "RAPID_COMMIT";
      break;
    case 14:
      uint64_t result = "USER_CLASS";
      break;
    case 15:
      uint64_t result = "VENDOR_CLASS";
      break;
    case 16:
      uint64_t result = "VENDOR_OPTS";
      break;
    case 17:
      uint64_t result = "INTERFACE_ID";
      break;
    case 18:
      uint64_t result = "RECONF_MSG";
      break;
    case 19:
      uint64_t result = "RECONF_ACCEPT";
      break;
    case 20:
      uint64_t result = "SIP_SERVER_D";
      break;
    case 21:
      uint64_t result = "SIP_SERVER_A";
      break;
    case 22:
      uint64_t result = "DNS_SERVERS";
      break;
    case 23:
      uint64_t result = "DOMAIN_LIST";
      break;
    case 24:
      uint64_t result = "IA_PD";
      break;
    case 25:
      uint64_t result = "IAPREFIX";
      break;
    case 40:
      uint64_t result = "POSIX_TIMEZONE";
      break;
    case 41:
      uint64_t result = "TZDB_TIMEZONE";
      break;
    default:
      if ("CLIENTID" == 103) {
        uint64_t result = "CAPTIVE_PORTAL_URL";
      }
      else {
LABEL_5:
      }
        uint64_t result = "<unknown>";
      break;
  }
  return result;
}

uint64_t sub_100009340(uint64_t result, uint64_t a2, int a3)
{
  *(void *)uint64_t result = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = 0;
  return result;
}

uint64_t sub_10000934C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

BOOL sub_100009354(uint64_t a1, unsigned int a2, size_t __len, void *__src, char *a5)
{
  int v6 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
  int v7 = __len + 4;
  *a5 = 0;
  if (v6 < (int)__len + 4)
  {
    tm v11 = sub_10000910C(a2);
    snprintf(a5, 0x100uLL, "No room for option %s (%d), %d < %d", v11, a2, v6, v7);
  }
  else
  {
    int v9 = (_WORD *)(*(void *)a1 + *(int *)(a1 + 12));
    *int v9 = __rev16(a2);
    v9[1] = __rev16(__len);
    if (__len) {
      memmove(v9 + 2, __src, __len);
    }
    *(_DWORD *)(a1 + 12) += v7;
  }
  return v6 >= v7;
}

_OWORD *sub_10000941C(unsigned __int16 *a1, unsigned int a2, char *a3)
{
  long long v10 = 0uLL;
  sub_100008828(&v10);
  if (a2 >= 4)
  {
    int v7 = a1;
    while (1)
    {
      unsigned int v8 = (bswap32(v7[1]) >> 16) + 4;
      unsigned int v6 = a2 - v8;
      if ((int)a2 < (int)v8) {
        break;
      }
      sub_100008928((uint64_t)&v10, (uint64_t)v7);
      int v7 = (unsigned __int16 *)((char *)v7 + v8);
      a2 -= v8;
      if (v6 < 4) {
        goto LABEL_6;
      }
    }
    if (a3)
    {
      sub_10000910C(bswap32(*v7) >> 16);
      snprintf(a3, 0x100uLL, "truncated option %s (%d) at offset %d, left %d < need %d");
    }
  }
  else
  {
    unsigned int v6 = a2;
LABEL_6:
    if (!v6)
    {
      uint64_t result = malloc_type_malloc(0x10uLL, 0x1080040FC6463CFuLL);
      *uint64_t result = v10;
      return result;
    }
    if (a3) {
      snprintf(a3, 0x100uLL, "truncated buffer at offset %d\n");
    }
  }
  sub_100008830((uint64_t)&v10);
  return 0;
}

_OWORD *sub_10000953C(uint64_t a1, int a2, char *a3)
{
  BOOL v3 = __OFSUB__(a2, 4);
  signed int v4 = a2 - 4;
  if (v4 < 0 != v3) {
    return 0;
  }
  else {
    return sub_10000941C((unsigned __int16 *)(a1 + 4), v4, a3);
  }
}

void sub_100009554(void **a1)
{
  int v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    sub_100008830((uint64_t)v1);
    free(v1);
  }
}

void sub_1000095A4(__CFString *a1, uint64_t a2)
{
}

void sub_1000095AC(__CFString *a1, uint64_t a2, int a3)
{
  uint64_t v6 = sub_100008860(a2);
  int v7 = v6;
  CFStringAppendFormat(a1, 0, @"Options[%d] = {\n", v6);
  if (v7 >= 1)
  {
    for (int i = 0; i != v7; ++i)
    {
      int v9 = (unsigned __int16 *)sub_10000887C(a2, i);
      unsigned int v10 = *v9;
      unsigned int v11 = v9[1];
      if (a3 >= 1)
      {
        int v12 = a3;
        do
        {
          CFStringAppendFormat(a1, 0, @"  ");
          --v12;
        }
        while (v12);
      }
      CFStringAppendFormat(a1, 0, @"  ");
      sub_100009F28(a1, bswap32(v10) >> 16, bswap32(v11) >> 16, v9 + 2, a3);
    }
  }
  if (a3 >= 1)
  {
    do
    {
      CFStringAppendFormat(a1, 0, @"  ");
      --a3;
    }
    while (a3);
  }

  CFStringAppendFormat(a1, 0, @"}\n");
}

unsigned __int16 *sub_100009700(uint64_t a1, int a2, unsigned int *a3, int *a4)
{
  int v8 = sub_100008860(a1);
  int v9 = v8;
  if (a4) {
    int v10 = *a4;
  }
  else {
    int v10 = 0;
  }
  if (v10 >= v8) {
    return 0;
  }
  while (1)
  {
    unsigned int v11 = (unsigned __int16 *)sub_10000887C(a1, v10);
    if (a2 == bswap32(*v11) >> 16) {
      break;
    }
    if (v9 == ++v10) {
      return 0;
    }
  }
  if (a4) {
    *a4 = v10 + 1;
  }
  *a3 = bswap32(v11[1]) >> 16;
  return v11 + 2;
}

const void *sub_1000097AC(const __CFDictionary *a1, __int16 a2)
{
  __int16 valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
  if (!v3) {
    return 0;
  }
  CFNumberRef v4 = v3;
  Value = CFDictionaryGetValue(a1, v3);
  CFRelease(v4);
  return Value;
}

CFMutableDictionaryRef sub_100009814(const __CFDictionary *a1)
{
  CFIndex Count = CFDictionaryGetCount(a1);
  if (!Count) {
    return 0;
  }
  uint64_t v3 = Count;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v22 = Mutable;
  size_t v5 = (const void **)malloc_type_malloc(16 * v3, 0xBCB6576AuLL);
  uint64_t v6 = &v5[v3];
  CFDictionaryGetKeysAndValues(a1, v5, v6);
  if (v3 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v19 = Mutable;
    uint64_t v20 = &v5[v3];
    uint64_t v21 = v5;
    do
    {
      CFStringRef v8 = (const __CFString *)v5[v7];
      CFStringRef v9 = (const __CFString *)v6[v7];
      if (CFStringHasPrefix(v8, @"dhcp_"))
      {
        v24.CFIndex length = CFStringGetLength(v8) - 5;
        v24.CFIndex location = 5;
        int v10 = sub_100006AA8(v8, v24, 0x8000100u);
        if (v10)
        {
          unsigned int v11 = (char *)v10;
          uint64_t v12 = 0;
          while (strcasecmp(v11, *(const char **)&word_10000C490[v12 + 4]))
          {
            v12 += 8;
            if ((v12 * 2) == 80) {
              goto LABEL_11;
            }
          }
          unsigned __int16 v13 = word_10000C490[v12];
          if (!v13)
          {
LABEL_11:
            if ((*v11 - 48) > 9 || (unsigned __int16 v13 = strtoul(v11, 0, 0)) == 0)
            {
              _SC_LOG_DEFAULT();
              _SC_syslog_os_log_mapping();
              if (!__SC_log_enabled()) {
                goto LABEL_19;
              }
LABEL_18:
              _os_log_pack_size();
              __chkstk_darwin();
              __error();
              uint64_t v17 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v17 = 138412290;
              *(void *)(v17 + 4) = v8;
              __SC_log_send();
              CFMutableDictionaryRef Mutable = v19;
              goto LABEL_19;
            }
          }
          CFDataRef v14 = sub_100009B98(v13, v9);
          if (v14)
          {
            CFDataRef v15 = v14;
            unsigned __int16 valuePtr = v13;
            CFNumberRef v16 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
            CFDictionarySetValue(Mutable, v16, v15);
            CFRelease(v16);
            CFRelease(v15);
            goto LABEL_19;
          }
          _SC_LOG_DEFAULT();
          _SC_syslog_os_log_mapping();
          if (__SC_log_enabled()) {
            goto LABEL_18;
          }
LABEL_19:
          free(v11);
          uint64_t v6 = v20;
          size_t v5 = v21;
        }
      }
      ++v7;
    }
    while (v7 != v3);
  }
  free(v5);
  if (!CFDictionaryGetCount(Mutable))
  {
    sub_100006360((const void **)&v22);
    return v22;
  }
  return Mutable;
}

CFDataRef sub_100009B98(int a1, const __CFString *a2)
{
  int v3 = sub_100008FD0(a1);
  CFTypeID TypeID = CFDataGetTypeID();
  if (!a2)
  {
    CFStringGetTypeID();
    CFArrayGetTypeID();
    return (CFDataRef)a2;
  }
  if (CFGetTypeID(a2) == TypeID)
  {
    return (CFDataRef)CFRetain(a2);
  }
  CFTypeID v6 = CFStringGetTypeID();
  if (CFGetTypeID(a2) == v6)
  {
    if (v3 == 6)
    {
      return sub_1000072FC(a2);
    }
    else
    {
      if (v3 == 5)
      {
        *(void *)bytes = 0;
        uint64_t v12 = 0;
        if (sub_1000067F4(a2, bytes)) {
          return CFDataCreate(0, bytes, 16);
        }
        _SC_LOG_DEFAULT();
        _SC_syslog_os_log_mapping();
        if (__SC_log_enabled()) {
          goto LABEL_29;
        }
        return 0;
      }
      return sub_100006BA8(a2);
    }
  }
  else
  {
    CFTypeID v7 = CFArrayGetTypeID();
    if (CFGetTypeID(a2) != v7) {
      return 0;
    }
    if (v3 != 6)
    {
      if (v3 == 5)
      {
        *(_DWORD *)bytes = 0;
        CFStringRef v8 = (const UInt8 *)sub_1000068AC((const __CFArray *)a2, (int *)bytes);
        if (v8)
        {
          CFStringRef v9 = (UInt8 *)v8;
          a2 = (const __CFString *)CFDataCreate(0, v8, 16 * *(int *)bytes);
          free(v9);
          return (CFDataRef)a2;
        }
        _SC_LOG_DEFAULT();
        _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
LABEL_29:
          _os_log_pack_size();
          __chkstk_darwin();
          __error();
          uint64_t v10 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v10 = 138412290;
          *(void *)(v10 + 4) = a2;
          __SC_log_send();
        }
      }
      return 0;
    }
    return sub_100007270((const __CFArray *)a2, 0);
  }
}

void sub_100009F28(__CFString *a1, unsigned int a2, uint64_t a3, unsigned __int16 *a4, int a5)
{
  uint64_t v10 = sub_10000910C(a2);
  CFStringAppendFormat(a1, 0, @"%s (%d) Length %d: ", v10, a2, a3);
  switch(sub_100008FD0(a2))
  {
    case 0u:
      return;
    case 2u:
      sub_100008AFC(a1, a4, a3);
      goto LABEL_55;
    case 3u:
      if (a3 >= 2)
      {
        uint64_t v11 = 0;
        do
        {
          unsigned int v12 = bswap32(a4[v11]);
          uint64_t v13 = HIWORD(v12);
          if ((v11 * 2)) {
            CFDataRef v14 = ", ";
          }
          else {
            CFDataRef v14 = "";
          }
          if (a2 == 6)
          {
            int v35 = sub_10000910C(HIWORD(v12));
            CFStringAppendFormat(a1, 0, @"%s%s (%d)", v14, v35, v13);
          }
          else
          {
            CFStringAppendFormat(a1, 0, @"%s%d", v14, HIWORD(v12), v37);
          }
          ++v11;
        }
        while ((a3 & 0xFFFE) != (v11 * 2));
      }
      goto LABEL_55;
    case 4u:
      if (a3 >= 4)
      {
        uint64_t v15 = 0;
        int v16 = a3 & 0xFFFC;
        do
        {
          if ((v15 * 2)) {
            uint64_t v17 = ", ";
          }
          else {
            uint64_t v17 = "";
          }
          CFStringAppendFormat(a1, 0, @"%s%d", v17, bswap32(*(_DWORD *)&a4[v15]));
          v15 += 2;
        }
        while (v16 != (v15 * 2));
      }
      goto LABEL_55;
    case 5u:
      if (a3 >= 0x10)
      {
        uint64_t v18 = 0;
        int v19 = a3 & 0xFFF0;
        do
        {
          if ((v18 * 2)) {
            uint64_t v20 = ", ";
          }
          else {
            uint64_t v20 = "";
          }
          uint64_t v21 = inet_ntop(30, &a4[v18], v39, 0x2Eu);
          CFStringAppendFormat(a1, 0, @"%s%s", v20, v21);
          v18 += 8;
        }
        while (v19 != (v18 * 2));
      }
      goto LABEL_61;
    case 6u:
      *(_DWORD *)uint64_t v39 = 0;
      CFMutableDictionaryRef v22 = sub_10000738C((uint64_t)a4, a3, (int *)v39);
      if (v22)
      {
        uint64_t v23 = v22;
        if (*(int *)v39 >= 1)
        {
          uint64_t v24 = 0;
          do
          {
            if (v24) {
              uint64_t v25 = ", ";
            }
            else {
              uint64_t v25 = "";
            }
            CFStringAppendFormat(a1, 0, @"%s%s", v25, *(void *)&v23[8 * v24++]);
          }
          while (v24 < *(int *)v39);
        }
        free(v23);
      }
      else
      {
        CFStringAppendFormat(a1, 0, @" Invalid");
LABEL_59:
        if (a3)
        {
          CFStringAppendFormat(a1, 0, @" Data ");
          sub_100008A00(a1, (uint64_t)a4, a3);
        }
      }
LABEL_61:
      CFStringAppendFormat(a1, 0, @"\n", v33, v34, v37);
      return;
    case 7u:
      if (a3 <= 0xB)
      {
        CFStringAppendFormat(a1, 0, @" IA_NA option is too short %d < %d\n", a3, 12, v37);
        return;
      }
      unsigned int v26 = a3 - 12;
      CFStringAppendFormat(a1, 0, @" IA_NA IAID=%d T1=%d T2=%d", bswap32(*(_DWORD *)a4), bswap32(*((_DWORD *)a4 + 1)), bswap32(*((_DWORD *)a4 + 2)));
      goto LABEL_52;
    case 8u:
      sub_10000A54C(a1, (uint64_t)a4, a3, a5);
      return;
    case 9u:
      if (a3 > 1)
      {
        unsigned int v27 = bswap32(*a4);
        uint64_t v28 = HIWORD(v27);
        uint64_t v29 = (a3 - 2);
        int v30 = sub_10000A72C(HIWORD(v27));
        if (v29) {
          CFStringAppendFormat(a1, 0, @" STATUS_CODE %s (%d) '%.*s'\n", v30, v28, v29, a4 + 1);
        }
        else {
          CFStringAppendFormat(a1, 0, @" STATUS_CODE %s (%d)\n", v30, v28, v37);
        }
      }
      else
      {
        CFStringAppendFormat(a1, 0, @" STATUS_CODE option is too short %d < %d\n", a3, 2, v37);
      }
      return;
    case 0xAu:
      *(void *)uint64_t v39 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)a4, a3, 0x8000100u, 0);
      CFStringAppendFormat(a1, 0, @" %@\n", *(void *)v39);
      sub_100006360((const void **)v39);
      return;
    case 0xBu:
      if (a3 > 0xB)
      {
        unsigned int v26 = a3 - 12;
        CFStringAppendFormat(a1, 0, @" IA_PD IAID=%d T1=%d T2=%d", bswap32(*(_DWORD *)a4), bswap32(*((_DWORD *)a4 + 1)), bswap32(*((_DWORD *)a4 + 2)));
LABEL_52:
        if (v26)
        {
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          *(_OWORD *)uint64_t v39 = 0u;
          long long v40 = 0u;
          int v31 = sub_10000941C(a4 + 6, v26, v39);
          if (v31)
          {
            uint64_t v32 = v31;
            CFStringAppendFormat(a1, 0, @" ");
            sub_1000095AC(a1, v32, (a5 + 1));
            sub_100008830((uint64_t)v32);
            free(v32);
          }
          else
          {
            CFStringAppendFormat(a1, 0, @" options invalid:\n\t%s\n", v39, v36, v38);
          }
        }
        else
        {
LABEL_55:
          CFStringAppendFormat(a1, 0, @"\n");
        }
      }
      else
      {
        CFStringAppendFormat(a1, 0, @" IA_PD option is too short %d < %d\n", a3, 12, v37);
      }
      return;
    case 0xCu:
      sub_10000A638(a1, (uint64_t)a4, a3, a5);
      return;
    default:
      goto LABEL_59;
  }
}

void sub_10000A54C(CFMutableStringRef theString, uint64_t a2, uint64_t a3, int a4)
{
  if ((int)a3 > 23)
  {
    unsigned int v7 = a3 - 24;
    CFStringRef v8 = inet_ntop(30, (const void *)a2, v11, 0x2Eu);
    CFStringAppendFormat(theString, 0, @" IAADDR %s Preferred %d Valid=%d", v8, bswap32(*(_DWORD *)(a2 + 16)), bswap32(*(_DWORD *)(a2 + 20)));
    if (v7) {
      sub_10000A754(theString, (unsigned __int16 *)(a2 + 24), v7, a4);
    }
    else {
      CFStringAppendFormat(theString, 0, @"\n", v9, v10);
    }
  }
  else
  {
    CFStringAppendFormat(theString, 0, @" IAADDR option is too short %d < %d\n", a3, 24);
  }
}

void sub_10000A638(CFMutableStringRef theString, uint64_t a2, uint64_t a3, int a4)
{
  if ((int)a3 > 24)
  {
    unsigned int v7 = a3 - 25;
    CFStringRef v8 = inet_ntop(30, (const void *)(a2 + 9), v11, 0x2Eu);
    CFStringAppendFormat(theString, 0, @" IAPREFIX %s/%d Preferred %d Valid=%d", v8, *(unsigned __int8 *)(a2 + 8), bswap32(*(_DWORD *)a2), bswap32(*(_DWORD *)(a2 + 4)));
    if (v7) {
      sub_10000A754(theString, (unsigned __int16 *)(a2 + 25), v7, a4);
    }
    else {
      CFStringAppendFormat(theString, 0, @"\n", v9, v10);
    }
  }
  else
  {
    CFStringAppendFormat(theString, 0, @" IAPREFIX option is too short %d < %d\n", a3, 25);
  }
}

const char *sub_10000A72C(unsigned int a1)
{
  if (a1 > 0x16) {
    return "<unknown>";
  }
  else {
    return (&off_10000C4E0)[(__int16)a1];
  }
}

void sub_10000A754(__CFString *a1, unsigned __int16 *a2, unsigned int a3, int a4)
{
  memset(v8, 0, sizeof(v8));
  CFTypeID v6 = sub_10000941C(a2, a3, (char *)v8);
  if (v6)
  {
    unsigned int v7 = v6;
    CFStringAppendFormat(a1, 0, @" ");
    sub_1000095AC(a1, v7, (a4 + 1));
    sub_100008830((uint64_t)v7);
    free(v7);
  }
  else
  {
    CFStringAppendFormat(a1, 0, @" options invalid:\n\t%s\n", v8);
  }
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

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
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

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
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

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
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

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return __SCNetworkInterfaceCreateWithBSDName();
}

uint64_t _SCNetworkInterfaceIsCarPlay()
{
  return __SCNetworkInterfaceIsCarPlay();
}

uint64_t _SCNetworkInterfaceIsTetheredHotspot()
{
  return __SCNetworkInterfaceIsTetheredHotspot();
}

uint64_t _SC_LOG_DEFAULT()
{
  return __SC_LOG_DEFAULT();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return __SC_syslog_os_log_mapping();
}

uint64_t __SC_log_enabled()
{
  return ___SC_log_enabled();
}

uint64_t __SC_log_send()
{
  return ___SC_log_send();
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_log_pack_fill()
{
  return __os_log_pack_fill();
}

uint64_t _os_log_pack_size()
{
  return __os_log_pack_size();
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_main(void)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
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

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

void if_freenameindex(if_nameindex *a1)
{
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

if_nameindex *if_nameindex(void)
{
  return _if_nameindex();
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return _recvmsg(a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return _sendmsg(a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
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

time_t time(time_t *a1)
{
  return _time(a1);
}

time_t timegm(tm *const a1)
{
  return _timegm(a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}