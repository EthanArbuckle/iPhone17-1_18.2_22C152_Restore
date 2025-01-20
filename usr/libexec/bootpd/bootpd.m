void sub_100004140()
{
  void *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  in_addr_t *v6;
  in_addr v7;
  uint64_t v8;
  in_addr v9;
  char *v10;
  int v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint8_t *v15;
  __int16 v16;
  char *v17;
  uint8_t v18[40];

  v0 = (void *)qword_10001C9C8;
  if (*(int *)(qword_10001C9C8 + 8) < 1) {
    goto LABEL_22;
  }
  v1 = 0;
  v2 = 0;
  do
  {
    v3 = *v0 + 96 * v1;
    if (!sub_1000102E8((uint64_t)qword_10001C9D0)
      || (v4 = (const char *)nullsub_1(v3), sub_100004368(v4)))
    {
      if (sub_10000FF24(v3) && (sub_10000FEC0(v3) & 8) == 0)
      {
        v11 = v2;
        if ((int)sub_10000FEC8(v3) >= 1)
        {
          v5 = 0;
          do
          {
            v6 = (in_addr_t *)sub_10000FED0(v3, v5);
            v7.s_addr = *v6;
            inet_ntoa(v7);
            __strlcpy_chk();
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v8 = nullsub_1(v3);
              v9.s_addr = v6[1];
              v10 = inet_ntoa(v9);
              *(_DWORD *)buf = 136315650;
              v13 = v8;
              v14 = 2080;
              v15 = v18;
              v16 = 2080;
              v17 = v10;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "interface %s: ip %s mask %s", buf, 0x20u);
            }
            v5 = (v5 + 1);
          }
          while ((int)v5 < (int)sub_10000FEC8(v3));
        }
        v2 = v11 + 1;
      }
    }
    ++v1;
    v0 = (void *)qword_10001C9C8;
  }
  while (v1 < *(int *)(qword_10001C9C8 + 8));
  if (!v2)
  {
LABEL_22:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "no available interfaces", v18, 2u);
    }
    if ((byte_10001C9E0 & 1) == 0) {
      exit(2);
    }
  }
}

uint64_t sub_100004368(const char *a1)
{
  if ((int)sub_1000102E8((uint64_t)&unk_10001C9D0) < 1) {
    return 0;
  }
  int v2 = 0;
  while (1)
  {
    v3 = (const char *)sub_100010304((uint64_t)&unk_10001C9D0, v2);
    if (!strcmp(a1, v3)) {
      break;
    }
    if (++v2 >= (int)sub_1000102E8((uint64_t)&unk_10001C9D0)) {
      return 0;
    }
  }
  return 1;
}

void sub_1000043EC()
{
  v0 = sub_10000F618();
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "interface list initialization failed", v2, 2u);
    }
    exit(1);
  }
  uint64_t v1 = (uint64_t)v0;
  sub_10000FE3C(&qword_10001C9C8);
  qword_10001C9C8 = v1;
}

void sub_100004478()
{
  v0 = inetroute_list_init();
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v3) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "can't get inetroutes list", (uint8_t *)&v3, 2u);
    }
    exit(1);
  }
  uint64_t v1 = (uint64_t)v0;
  inetroute_list_free((void **)&qword_10001C9E8);
  qword_10001C9E8 = v1;
  if (byte_10001C0B0)
  {
    Mutable = CFStringCreateMutable(0, 0);
    inetroute_list_print_cfstr(Mutable, (int *)qword_10001C9E8);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 138412290;
      v4 = Mutable;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Routes:\n%@", (uint8_t *)&v3, 0xCu);
    }
    CFRelease(Mutable);
  }
}

uint64_t sub_1000045AC(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 76) | dword_10001C9F0) >> 6) & 1;
}

uint64_t sub_1000045C4(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 76) | dword_10001C9F0) >> 7) & 1;
}

uint64_t sub_1000045DC(uint64_t a1)
{
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a1 + 76) & 0x7FFFFFFD | 0x80000000;
  return sub_1000045F4(1);
}

uint64_t sub_1000045F4(uint64_t result)
{
  if (result | dword_10001D4A8)
  {
    int v1 = result;
    SCDynamicStoreRemoveValue((SCDynamicStoreRef)qword_10001D4A0, @"com.apple.bootpd.DHCPServer");
    if (v1)
    {
      int v2 = (void *)qword_10001C9C8;
      if (*(int *)(qword_10001C9C8 + 8) >= 1)
      {
        uint64_t v3 = 0;
        uint64_t v4 = 0;
        Mutable = 0;
        do
        {
          uint64_t v6 = *v2 + v3;
          if ((*(_DWORD *)(v6 + 76) & 0x80000000) != 0)
          {
            v7 = (const char *)nullsub_1(v6);
            CFStringRef v8 = CFStringCreateWithCString(0, v7, 0x8000100u);
            if (v8)
            {
              CFStringRef v9 = v8;
              if (!Mutable) {
                Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
              }
              CFArrayAppendValue(Mutable, v9);
              CFRelease(v9);
            }
          }
          ++v4;
          int v2 = (void *)qword_10001C9C8;
          v3 += 96;
        }
        while (v4 < *(int *)(qword_10001C9C8 + 8));
        values = Mutable;
        if (Mutable)
        {
          CFStringRef v11 = @"DisabledInterfaces";
          CFDictionaryRef v10 = CFDictionaryCreate(0, (const void **)&v11, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          SCDynamicStoreAddTemporaryValue((SCDynamicStoreRef)qword_10001D4A0, @"com.apple.bootpd.DHCPServer", v10);
          CFRelease(v10);
        }
      }
    }
    result = notify_post("com.apple.bootpd.DHCPDisabledInterfaces");
    dword_10001D4A8 = v1;
  }
  return result;
}

void sub_100004770(const __CFDictionary *a1, const void *a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      if ((sub_10000C2BC(Value, a4) & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        uint64_t v8 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid '%s' property", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void sub_10000482C()
{
}

void start(int a1, char *const *a2)
{
  v38.s_addr = 0;
  byte_10001C0B0 = 0;
  byte_10001C1C0 = 0;
  sub_1000102B0(qword_10001C9D0);
  sub_1000043EC();
  int v4 = getopt(a1, a2, "aBbc:Ddf:hHi:Io:Pp:qr:St:v");
  if (v4 == -1)
  {
    char v5 = 0;
    int v6 = 1;
LABEL_35:
    memset(&buf, 0, sizeof(buf));
    if (fstat(0, &buf) < 0
      || (HIDWORD(v9) = buf.st_mode & 0xF000, LODWORD(v9) = HIDWORD(v9) - 0x2000, (v9 >> 13) <= 4))
    {
      *(_OWORD *)&buf.st_dev = xmmword_100014CC0;
      if ((v5 & 1) == 0)
      {
        if (fork()) {
          exit(0);
        }
        for (int i = 0; i != 10; ++i)
          close(i);
        open("/", 0);
        dup2(0, 1);
        dup2(0, 2);
        int v11 = open("/dev/tty", 2);
        if (v11 >= 1)
        {
          int v12 = v11;
          ioctl(v11, 0x20007471uLL, 0);
          close(v12);
        }
      }
      int v13 = socket(2, 2, 0);
      dword_10001C080 = v13;
      if (v13 < 0)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
          goto LABEL_100;
        }
        *(_WORD *)v36 = 0;
        v14 = "socket call failed";
        goto LABEL_46;
      }
      HIWORD(buf.st_dev) = 17152;
      *(_DWORD *)&buf.st_mode = 0;
      if (bind(v13, (const sockaddr *)&buf, 0x10u) < 0)
      {
        int v17 = 10;
        while (1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v18 = __error();
            v19 = strerror(*v18);
            *(_DWORD *)v36 = 136315138;
            v37 = v19;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "bind call failed: %s", v36, 0xCu);
          }
          if (*__error() != 48) {
            goto LABEL_100;
          }
          if (!--v17) {
            break;
          }
          sleep(0xAu);
          if ((bind(dword_10001C080, (const sockaddr *)&buf, 0x10u) & 0x80000000) == 0) {
            goto LABEL_57;
          }
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          v14 = "exiting";
LABEL_46:
          p_stat buf = v36;
          os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_81:
          uint32_t v27 = 2;
LABEL_82:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v16, v14, p_buf, v27);
        }
LABEL_100:
        exit(1);
      }
    }
    else
    {
      dword_10001C080 = 0;
      gettimeofday((timeval *)&qword_10001CA00, 0);
      if ((byte_10001C9E0 & 1) == 0)
      {
        v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        dispatch_source_set_event_handler(v20, &stru_100018590);
        dispatch_time_t v21 = dispatch_time(0, 15000000000);
        dispatch_source_set_timer(v20, v21, 0x37E11D600uLL, 0);
        dispatch_resume(v20);
      }
    }
LABEL_57:
    v22 = fopen("/var/run/bootpd.pid", "w");
    if (v22)
    {
      v23 = v22;
      pid_t v24 = getpid();
      fprintf(v23, "%d\n", v24);
      fclose(v23);
    }
    if (v5) {
      byte_10001CA10 = 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "server starting", (uint8_t *)&buf, 2u);
    }
    *(_DWORD *)v36 = 1;
    if (setsockopt(dword_10001C080, 0, 20, v36, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_100;
      }
      v25 = __error();
      v26 = strerror(*v25);
      buf.st_dev = 136315138;
      *(void *)&buf.st_mode = v26;
      v14 = "setsockopt(IP_RECVIF) failed: %s";
      p_stat buf = (uint8_t *)&buf;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v27 = 12;
      goto LABEL_82;
    }
    if (setsockopt(dword_10001C080, 0xFFFF, 4356, v36, 4u) < 0
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt(SO_RECV_ANYIF) failed", (uint8_t *)&buf, 2u);
    }
    if (setsockopt(dword_10001C080, 0xFFFF, 32, v36, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_100;
      }
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(SO_BROADCAST) failed";
    }
    else if (setsockopt(dword_10001C080, 0, 7, v36, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_100;
      }
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(IPPROTO_IP, IP_RECVDSTADDR) failed";
    }
    else
    {
      if ((setsockopt(dword_10001C080, 0xFFFF, 4, v36, 4u) & 0x80000000) == 0)
      {
        *(_DWORD *)v36 = 900;
        if (setsockopt(dword_10001C080, 0xFFFF, 4230, v36, 4u) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v28 = __error();
          v29 = strerror(*v28);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v29;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt(SO_TRAFFIC_CLASS) failed, %s", (uint8_t *)&buf, 0xCu);
        }
        *(_DWORD *)v36 = 0;
        if (setsockopt(dword_10001C080, 0xFFFF, 4352, v36, 4u) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v30 = __error();
          v31 = strerror(*v30);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v31;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt(SO_DEFUNCTOK) failed, %s", (uint8_t *)&buf, 0xCu);
        }
        *(_DWORD *)v36 = 1;
        if (ioctl(dword_10001C080, 0x8004667EuLL, v36) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v32 = __error();
          v33 = strerror(*v32);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v33;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ioctl FIONBIO failed, %s", (uint8_t *)&buf, 0xCu);
        }
        v34 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, dword_10001C080, 0, (dispatch_queue_t)&_dispatch_main_q);
        dispatch_source_set_event_handler(v34, &stru_100018550);
        dispatch_resume(v34);
        v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
        dispatch_source_set_event_handler(v35, &stru_1000185D0);
        dispatch_resume(v35);
        signal(1, (void (__cdecl *)(int))1);
        if (v6) {
          sub_100008544();
        }
        dispatch_main();
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_100;
      }
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(SO_REUSEADDR) failed";
    }
    p_stat buf = (uint8_t *)&buf;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_81;
  }
  char v5 = 0;
  int v6 = 1;
  while (1)
  {
    if ((char)v4 <= 79)
    {
      if ((char)v4 != 68)
      {
        if ((char)v4 == 73)
        {
          int v6 = 0;
        }
        else if ((char)v4 == 72)
        {
LABEL_76:
          sub_10000482C();
        }
        goto LABEL_34;
      }
      int v7 = dword_10001C9F4 | 2;
    }
    else
    {
      switch((char)v4)
      {
        case 'b':
          byte_10001C9F8 = 1;
          goto LABEL_34;
        case 'c':
        case 'e':
        case 'g':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 's':
        case 'u':
          goto LABEL_34;
        case 'd':
          char v5 = 1;
          goto LABEL_34;
        case 'f':
          off_10001C098 = optarg;
          goto LABEL_34;
        case 'h':
          goto LABEL_76;
        case 'i':
          if (sub_100004368(optarg))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              buf.st_dev = 136315138;
              *(void *)&buf.st_mode = optarg;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "interface %s already specified", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            sub_1000103B0((uint64_t)qword_10001C9D0, (uint64_t)optarg);
          }
          goto LABEL_34;
        case 'o':
          int v8 = atoi(optarg);
          if ((v8 - 17) <= 0xFFFFFFEF)
          {
            printf("max hops value %s must be in the range 1..16\n");
            goto LABEL_100;
          }
          dword_10001C0A0 = v8;
          goto LABEL_34;
        case 'p':
          word_10001C084 = strtoul(optarg, 0, 0);
          printf("Priority set to %d\n", (unsigned __int16)word_10001C084);
          goto LABEL_34;
        case 'q':
          dword_10001C0A8 = 1;
          goto LABEL_34;
        case 'r':
          dword_10001C9F4 |= 0x10u;
          if (!inet_aton(optarg, &v38) || v38.s_addr + 1 <= 1)
          {
            printf("Invalid relay server ip address %s\n");
            goto LABEL_100;
          }
          if (sub_10000F4CC((uint64_t *)qword_10001C9C8, v38.s_addr))
          {
            printf("Relay server ip address %s specifies this host\n");
            goto LABEL_100;
          }
          sub_1000052A0(v38.s_addr);
          goto LABEL_34;
        case 't':
          off_10001C088 = optarg;
          goto LABEL_34;
        case 'v':
          byte_10001C9FC = 1;
          goto LABEL_34;
        default:
          if ((char)v4 == 80)
          {
            byte_10001C9E0 = 1;
            goto LABEL_34;
          }
          if ((char)v4 != 83) {
            goto LABEL_34;
          }
          int v7 = dword_10001C9F4 | 1;
          break;
      }
    }
    dword_10001C9F4 = v7;
LABEL_34:
    int v4 = getopt(a1, a2, "aBbc:Ddf:hHi:Io:Pp:qr:St:v");
    if (v4 == -1) {
      goto LABEL_35;
    }
  }
}

_DWORD *sub_1000052A0(int a1)
{
  if (qword_10001CA38)
  {
    uint64_t v2 = ++dword_10001CA40;
    result = malloc_type_realloc((void *)qword_10001CA38, 4 * v2, 0x100004052888210uLL);
    qword_10001CA38 = (uint64_t)result;
    if (!result)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "realloc failed, exiting", v4, 2u);
      }
      exit(1);
    }
    result[dword_10001CA40 - 1] = a1;
  }
  else
  {
    result = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    qword_10001CA38 = (uint64_t)result;
    _DWORD *result = a1;
    dword_10001CA40 = 1;
  }
  return result;
}

void sub_100005390(id a1)
{
  long long v137 = xmmword_100014CC0;
  qword_10001D258 = (uint64_t)&qword_10001D278;
  dword_10001D260 = 1;
  qword_10001D268 = (uint64_t)&unk_10001D288;
  qword_10001D270 = 512;
  qword_10001D278 = (uint64_t)&byte_10001CA48;
  unk_10001D280 = 2048;
  qword_10001D248 = (uint64_t)&v137;
  dword_10001D250 = 16;
  ssize_t v1 = recvmsg(dword_10001C080, (msghdr *)&qword_10001D248, 0);
  if (v1 < 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    *(_DWORD *)stat buf = 6291714;
    char v5 = "recvmsg failed, %m";
    int v6 = buf;
    os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
    uint32_t v8 = 4;
    goto LABEL_8;
  }
  unint64_t v2 = v1;
  if ((byte_10001CA44 & 1) == 0)
  {
    sub_1000086C0(0);
    if (gethostname(&byte_10001C0B3, 0x100uLL))
    {
      byte_10001C0B3 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 6291714;
        uint64_t v3 = "gethostname() failed, %m";
        uint32_t v4 = 4;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v3, buf, v4);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)&buf[4] = &byte_10001C0B3;
      uint64_t v3 = "server name %s";
      uint32_t v4 = 12;
      goto LABEL_11;
    }
    sub_1000043EC();
    sub_100004140();
    sub_100004478();
    sub_1000045F4(0);
    CFPropertyListRef v9 = sub_10000BE30(off_10001C098);
    if (v9)
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v9) != TypeID)
      {
        CFRelease(v9);
        CFPropertyListRef v9 = 0;
      }
    }
    LODWORD(v126) = 0;
    dword_10001C9F0 = dword_10001C9F4;
    byte_10001C1C0 = byte_10001C9FC;
    byte_10001C0B0 = byte_10001CA10;
    if (!v9)
    {
      dword_10001CA34 = 0;
LABEL_50:
      if (qword_10001D488)
      {
        free((void *)qword_10001D488);
        qword_10001D488 = 0;
      }
      if (qword_10001D490)
      {
        free((void *)qword_10001D490);
        qword_10001D490 = 0;
      }
      dword_10001D498 = 0;
      dword_10001D49C = 0;
      if (v9)
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, @"allow");
        CFTypeID v33 = CFArrayGetTypeID();
        if (Value && CFGetTypeID(Value) == v33 && CFArrayGetCount(Value) >= 1) {
          qword_10001D488 = (uint64_t)sub_100008340(Value, &dword_10001D498);
        }
        CFArrayRef v34 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, @"deny");
        CFTypeID v35 = CFArrayGetTypeID();
        if (v34 && CFGetTypeID(v34) == v35 && CFArrayGetCount(v34) >= 1) {
          qword_10001D490 = (uint64_t)sub_100008340(v34, &dword_10001D49C);
        }
      }
      dword_10001C0AC = 0;
      sub_100004770((const __CFDictionary *)v9, @"reply_threshold_seconds", (uint64_t)"reply_threshold_seconds", &dword_10001C0AC);
      byte_10001C0B1 = 0;
      LODWORD(v126) = 0;
      sub_100004770((const __CFDictionary *)v9, @"dhcp_ignore_client_identifier", (uint64_t)"dhcp_ignore_client_identifier", &v126);
      if (v126) {
        byte_10001C0B1 = 1;
      }
      byte_10001C0B2 = 0;
      LODWORD(v126) = 0;
      sub_100004770((const __CFDictionary *)v9, @"dhcp_supply_bootfile", (uint64_t)"dhcp_supply_bootfile", &v126);
      if (v126)
      {
        byte_10001C0B2 = 1;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 136315138;
          *(void *)&buf[4] = "dhcp_supply_bootfile";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s is enabled", buf, 0xCu);
        }
      }
      dword_10001C0A4 = sub_1000080D4((const __CFDictionary *)v9, @"use_server_config_for_dhcp_options", (uint64_t)"use_server_config_for_dhcp_options", 1);
      SubnetListFree((uint64_t **)&qword_10001C1B8);
      if (v9)
      {
        v36 = CFDictionaryGetValue((CFDictionaryRef)v9, @"Subnets");
        CFTypeID v37 = CFArrayGetTypeID();
        if (v36)
        {
          if (CFGetTypeID(v36) == v37)
          {
            qword_10001C1B8 = (uint64_t)SubnetListCreateWithArray(v36);
            if (qword_10001C1B8)
            {
              if (byte_10001C1C0)
              {
                Mutable = CFStringCreateMutable(0, 0);
                SubnetListPrintCFString(Mutable, qword_10001C1B8);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)stat buf = 138412290;
                  *(void *)&buf[4] = Mutable;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                CFRelease(Mutable);
              }
            }
          }
        }
        sub_1000092AC();
        CFRelease(v9);
      }
      else
      {
        sub_1000092AC();
      }
      res_9_init();
      qword_10001CA20 = 0;
      if (qword_10001CA18)
      {
        free((void *)qword_10001CA18);
        qword_10001CA18 = 0;
      }
      if (qword_10001CA28)
      {
        free((void *)qword_10001CA28);
        qword_10001CA28 = 0;
      }
      dword_10001CA30 = 0;
      dword_10001CA14 = 0;
      int nscount = _res.nscount;
      if (nscount)
      {
        __dst[0].tv_sec = 0;
        if (byte_10001C0B0)
        {
          tv_sec = CFStringCreateMutable(0, 0);
          __dst[0].tv_sec = (__darwin_time_t)tv_sec;
          int nscount = _res.nscount;
        }
        else
        {
          tv_sec = 0;
        }
        qword_10001CA18 = (uint64_t)malloc_type_malloc(4 * nscount, 0x100004052888210uLL);
        int v41 = _res.nscount;
        if (v41 >= 1)
        {
          uint64_t v42 = 0;
          p_sin_addr = &_res.nsaddr_list[0].sin_addr;
          do
          {
            in_addr_t s_addr = p_sin_addr->s_addr;
            p_sin_addr += 4;
            v44.in_addr_t s_addr = s_addr;
            if (s_addr + 1 >= 2 && LOBYTE(v44.s_addr) != 127)
            {
              int v46 = dword_10001CA14;
              *(in_addr *)(qword_10001CA18 + 4 * dword_10001CA14) = v44;
              if (tv_sec)
              {
                v47 = inet_ntoa(v44);
                CFStringAppendFormat(tv_sec, 0, @" %s", v47);
                int v46 = dword_10001CA14;
                int v41 = _res.nscount;
              }
              dword_10001CA14 = v46 + 1;
            }
            ++v42;
          }
          while (v42 < v41);
        }
        if (!dword_10001CA14)
        {
          free((void *)qword_10001CA18);
          qword_10001CA18 = 0;
          sub_10000BDF8((const void **)__dst);
          tv_sec = (__CFString *)__dst[0].tv_sec;
        }
        if (tv_sec)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = 138412290;
            *(void *)&buf[4] = tv_sec;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "DNS servers: %@", buf, 0xCu);
            tv_sec = (__CFString *)__dst[0].tv_sec;
          }
          CFRelease(tv_sec);
        }
        if (dword_10001CA14)
        {
          __dst[0].tv_sec = 0;
          if (byte_10001C0B0)
          {
            v48 = CFStringCreateMutable(0, 0);
            __dst[0].tv_sec = (__darwin_time_t)v48;
          }
          else
          {
            v48 = 0;
          }
          if (_res.defdname[0])
          {
            if (*(_DWORD *)_res.defdname != 1633906540 || *(_WORD *)&_res.defdname[4] != 108)
            {
              qword_10001CA20 = (uint64_t)_res.defdname;
              if (byte_10001C0B0)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = _res.defdname;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "DNS domain: %s", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v50 = 0;
          while (_res.dnsrch[v50])
          {
            if (v48) {
              CFStringAppendFormat(v48, 0, @" %s", _res.dnsrch[v50]);
            }
            if (++v50 == 6) {
              goto LABEL_119;
            }
          }
          if (v50)
          {
LABEL_119:
            qword_10001CA28 = (uint64_t)sub_10000D5B0((uint64_t)_res.dnsrch, v50, 0, &dword_10001CA30, 1);
            if (!v48) {
              goto LABEL_123;
            }
            goto LABEL_120;
          }
          sub_10000BDF8((const void **)__dst);
          v48 = (__CFString *)__dst[0].tv_sec;
          if (!__dst[0].tv_sec) {
            goto LABEL_123;
          }
LABEL_120:
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = 138412290;
            *(void *)&buf[4] = v48;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "DNS search: %@", buf, 0xCu);
            v48 = (__CFString *)__dst[0].tv_sec;
          }
          CFRelease(v48);
        }
      }
LABEL_123:
      byte_10001CA44 = 1;
      goto LABEL_124;
    }
    CFStringRef v11 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, @"ipv6_only_wait");
    LODWORD(__dst[0].tv_sec) = 0;
    if (v11)
    {
      if (sub_10000C2BC(v11, __dst))
      {
        int v12 = (LODWORD(__dst[0].tv_sec) != 0) << 24;
LABEL_23:
        dword_10001CA34 = v12;
        if (sub_1000080D4((const __CFDictionary *)v9, @"verbose", (uint64_t)"verbose", 0)) {
          byte_10001C1C0 = 1;
        }
        if (sub_1000080D4((const __CFDictionary *)v9, @"debug", (uint64_t)"debug", 0)) {
          byte_10001C0B0 = 1;
        }
        int v13 = CFDictionaryGetValue((CFDictionaryRef)v9, @"bootp_enabled");
        sub_1000081A8((uint64_t)v13, 1);
        v14 = CFDictionaryGetValue((CFDictionaryRef)v9, @"dhcp_enabled");
        sub_1000081A8((uint64_t)v14, 2);
        v15 = CFDictionaryGetValue((CFDictionaryRef)v9, @"relay_enabled");
        sub_1000081A8((uint64_t)v15, 16);
        CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, @"relay_ip_list");
        CFTypeID v17 = CFArrayGetTypeID();
        if (v16 && CFGetTypeID(v16) == v17)
        {
          CFIndex Count = CFArrayGetCount(v16);
          if (qword_10001CA38)
          {
            free((void *)qword_10001CA38);
            qword_10001CA38 = 0;
            dword_10001CA40 = 0;
          }
          if (Count >= 1)
          {
            for (CFIndex i = 0; Count != i; ++i)
            {
              LODWORD(__dst[0].tv_sec) = 0;
              CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, i);
              CFTypeID v21 = CFStringGetTypeID();
              if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v21) {
                continue;
              }
              if (sub_10000C168(ValueAtIndex, (in_addr *)__dst))
              {
                in_addr_t v22 = __dst[0].tv_sec;
                if ((LODWORD(__dst[0].tv_sec) + 1) > 1)
                {
                  if (!sub_10000F4CC((uint64_t *)qword_10001C9C8, __dst[0].tv_sec))
                  {
                    sub_1000052A0(__dst[0].tv_sec);
                    continue;
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v27.in_addr_t s_addr = __dst[0].tv_sec;
                    v28 = inet_ntoa(v27);
                    *(_DWORD *)stat buf = 136315138;
                    *(void *)&buf[4] = v28;
                    v25 = "Relay server ip address %s specifies this host";
LABEL_44:
                    uint32_t v26 = 12;
LABEL_45:
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v23.in_addr_t s_addr = v22;
                  pid_t v24 = inet_ntoa(v23);
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = v24;
                  v25 = "Invalid relay server ip address %s";
                  goto LABEL_44;
                }
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)stat buf = 0;
                v25 = "Invalid relay server ip address";
                uint32_t v26 = 2;
                goto LABEL_45;
              }
            }
          }
        }
        v29 = CFDictionaryGetValue((CFDictionaryRef)v9, @"ignore_allow_deny");
        sub_1000081A8((uint64_t)v29, 32);
        v30 = CFDictionaryGetValue((CFDictionaryRef)v9, @"detect_other_dhcp_server");
        sub_1000081A8((uint64_t)v30, 64);
        v31 = CFDictionaryGetValue((CFDictionaryRef)v9, @"ipv6_only_preferred");
        sub_1000081A8((uint64_t)v31, 128);
        goto LABEL_50;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        *(void *)&buf[4] = "ipv6_only_wait";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid '%s' property", buf, 0xCu);
      }
    }
    int v12 = 0;
    goto LABEL_23;
  }
LABEL_124:
  if (v2 >= 0xEC && byte_10001CA4A <= 0x10u)
  {
    *(_DWORD *)stat buf = 0;
    v51 = sub_1000084D0(7, buf);
    if (v51) {
      BOOL v52 = *(_DWORD *)buf == 4;
    }
    else {
      BOOL v52 = 0;
    }
    int v53 = !v52;
    if (v52) {
      v54 = v51;
    }
    else {
      v54 = 0;
    }
    if (byte_10001C0B0)
    {
      v55 = v51;
      BOOL v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v53)
      {
        if (v56)
        {
          *(_WORD *)stat buf = 0;
          v57 = "no destination address";
          uint32_t v58 = 2;
LABEL_141:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v57, buf, v58);
        }
      }
      else if (v56)
      {
        v59.in_addr_t s_addr = *v55;
        v60 = inet_ntoa(v59);
        *(_DWORD *)stat buf = 136315138;
        *(void *)&buf[4] = v60;
        v57 = "destination address %s";
        uint32_t v58 = 12;
        goto LABEL_141;
      }
    }
    LODWORD(v126) = 0;
    v61 = sub_1000084D0(20, &v126);
    if (!v61) {
      return;
    }
    if (!v126) {
      return;
    }
    v62 = v61;
    if (*((unsigned __int8 *)v61 + 5) > 0x10uLL) {
      return;
    }
    __memmove_chk();
    buf[*((unsigned __int8 *)v62 + 5)] = 0;
    uint64_t v63 = sub_10000F590((uint64_t *)qword_10001C9C8, (char *)buf);
    if (v63)
    {
      uint64_t v64 = v63;
      if (sub_10000FF24(v63))
      {
        if ((int)sub_1000102E8((uint64_t)qword_10001C9D0) < 1 || sub_100004368((const char *)buf))
        {
          int v65 = *(_DWORD *)(v64 + 76);
          if ((v65 & 0x80000000) == 0)
          {
            char v66 = v65 | dword_10001C9F0;
            if ((v66 & 0x1F) != 0)
            {
              if (byte_10001CA4A == 6 && (v66 & 0x20) == 0)
              {
                if (qword_10001D490
                  && bsearch(&unk_10001CA64, (const void *)qword_10001D490, dword_10001D49C, 6uLL, (int (__cdecl *)(const void *, const void *))sub_100010A38))
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                    return;
                  }
                  v67 = ether_ntoa((const ether_addr *)&unk_10001CA64);
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = v67;
                  char v5 = "%s is in deny list, ignoring";
LABEL_237:
                  int v6 = buf;
                  goto LABEL_173;
                }
                if (qword_10001D488
                  && !bsearch(&unk_10001CA64, (const void *)qword_10001D488, dword_10001D498, 6uLL, (int (__cdecl *)(const void *, const void *))sub_100010A38))
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                    return;
                  }
                  v100 = ether_ntoa((const ether_addr *)&unk_10001CA64);
                  *(_DWORD *)stat buf = 136315138;
                  *(void *)&buf[4] = v100;
                  char v5 = "%s is not in the allow list, ignoring";
                  goto LABEL_237;
                }
              }
              gettimeofday((timeval *)&qword_10001CA00, 0);
              if (byte_10001CA48 != 1) {
                goto LABEL_200;
              }
              v132[0] = 0;
              v132[1] = 0;
              v129 = 0;
              uint64_t v126 = v64;
              __src = &byte_10001CA48;
              uint64_t v128 = v2;
              v130 = v54;
              v131 = &qword_10001CA00;
              sub_10000CAA4(v132);
              if (sub_10000CC5C(v132, (uint64_t)&byte_10001CA48, v2, 0)
                && (v129 = v132, *(_DWORD *)stat buf = 0, (v68 = sub_10000CBAC((uint64_t)v132, 53, buf, 0)) != 0))
              {
                char v69 = 0;
                unsigned int v70 = *v68;
              }
              else
              {
                unsigned int v70 = 0;
                char v69 = 1;
              }
              if (byte_10001C1C0)
              {
                v71 = CFStringCreateMutable(0, 0);
                sub_10000D1B0(v71, (unsigned __int8 *)&byte_10001CA48, v2);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)stat buf = 138412290;
                  *(void *)&buf[4] = v71;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "---- Client Request ----\n%@", buf, 0xCu);
                }
                CFRelease(v71);
              }
              if (!byte_10001CA74 || !strcmp(&byte_10001CA74, &byte_10001C0B3))
              {
                int v72 = dword_10001CA5C;
                if (!dword_10001CA5C || v72 == sub_10000FED8(v64))
                {
                  int v73 = *(_DWORD *)(v64 + 76);
                  if ((v69 & 1) != 0 || v73 < 0 || ((v73 | dword_10001C9F0) & 2) == 0)
                  {
                    if (((v73 | dword_10001C9F0) & 1) == 0) {
                      goto LABEL_199;
                    }
                    v135 = 0;
                    v136 = 0;
                    if (v128 < 0x12C) {
                      goto LABEL_199;
                    }
                    v74 = __src;
                    v134.in_addr_t s_addr = 0;
                    unsigned int v75 = bswap32(*((unsigned __int16 *)__src + 4));
                    int v76 = dword_10001C0AC;
                    if (dword_10001C0AC > HIWORD(v75))
                    {
                      if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)stat buf = 67109376;
                        *(_DWORD *)&buf[4] = HIWORD(v75);
                        *(_WORD *)&buf[8] = 1024;
                        *(_DWORD *)&buf[10] = v76;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "rq->bp_secs %d < threshold %d", buf, 0xEu);
                      }
                      goto LABEL_199;
                    }
                    memcpy(__dst, __src, 0x12CuLL);
                    LOBYTE(__dst[0].tv_sec) = 2;
                    int v114 = *((_DWORD *)__src + 3);
                    if (v114)
                    {
                      v134.in_addr_t s_addr = *((_DWORD *)__src + 3);
                      if (!sub_100008F04(v114, (char **)&v135, (char **)&v136)) {
                        goto LABEL_199;
                      }
                    }
                    else
                    {
                      *(void *)stat buf = 0;
                      *(void *)&buf[8] = v126;
                      *(void *)&buf[16] = 0;
                      *(_DWORD *)stat buf = *((_DWORD *)__src + 6);
                      if (!sub_100008E1C(*((unsigned __int8 *)__src + 1), (char *)__src + 28, *((unsigned __int8 *)__src + 2), (unsigned int (*)(uint64_t, void))sub_10000743C, (uint64_t)buf, &v134, (char **)&v135, (char **)&v136))goto LABEL_199; {
                      LODWORD(__dst[1].tv_sec) = v134;
                      }
                    }
                    v74[235] = 0;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v117 = nullsub_1(v126);
                      v118 = v135;
                      if (!v135)
                      {
                        v119.in_addr_t s_addr = v134.s_addr;
                        v118 = inet_ntoa(v119);
                      }
                      *(_DWORD *)stat buf = 136315650;
                      *(void *)&buf[4] = v117;
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = v118;
                      *(_WORD *)&buf[22] = 2080;
                      *(void *)&buf[24] = v74 + 108;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "BOOTP request [%s]: %s requested file '%s'", buf, 0x20u);
                    }
                    if (sub_100006E34(v74 + 108, (uint64_t)v135, v136, (char *)&__dst[6].tv_usec + 4, 128))
                    {
                      if (*((_DWORD *)v74 + 59) == 1666417251)
                      {
                        long long v154 = 0u;
                        long long v155 = 0u;
                        long long v152 = 0u;
                        long long v153 = 0u;
                        long long v150 = 0u;
                        long long v151 = 0u;
                        long long v148 = 0u;
                        long long v149 = 0u;
                        long long v146 = 0u;
                        long long v147 = 0u;
                        long long v144 = 0u;
                        long long v145 = 0u;
                        long long v142 = 0u;
                        long long v143 = 0u;
                        long long v140 = 0u;
                        long long v141 = 0u;
                        long long v139 = 0u;
                        memset(buf, 0, sizeof(buf));
                        sub_10000CF38((uint64_t)buf, &__dst[15], 60);
                        sub_1000077FC((char *)v135, v134.s_addr, v126, (uint64_t *)buf, 0, 0);
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)v133 = 0;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "added vendor extensions", v133, 2u);
                        }
                        if (sub_10000CF40((uint64_t)buf, 255, 0, 0))
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)v133 = 0;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "couldn't add end tag", v133, 2u);
                          }
                        }
                        else
                        {
                          *(&__dst[14].tv_usec + 1) = 1666417251;
                        }
                      }
                      HIDWORD(__dst[1].tv_sec) = sub_10000FED8(v126);
                      __strlcpy_chk();
                      if (sub_100007494(v126, (uint64_t)__dst, 0x12Cu, 0, 0)
                        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                      {
                        v120 = v135;
                        v121.in_addr_t s_addr = v134.s_addr;
                        v122 = inet_ntoa(v121);
                        *(_DWORD *)stat buf = 136315650;
                        *(void *)&buf[4] = v120;
                        *(_WORD *)&buf[12] = 2080;
                        *(void *)&buf[14] = v122;
                        *(_WORD *)&buf[22] = 1024;
                        *(_DWORD *)&buf[24] = 300;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "reply sent %s %s pktsize %d", buf, 0x1Cu);
                      }
                    }
                    if (v135) {
                      free(v135);
                    }
                    if (v136) {
                      free(v136);
                    }
                    goto LABEL_199;
                  }
                  sub_100009994(&v126, v70, 1);
                }
              }
LABEL_199:
              sub_10000CAA8((uint64_t)v132);
LABEL_200:
              v77 = aPrivateTftpboo;
              if (qword_10001CA38
                && v2 >= 0x12C
                && ((*(_DWORD *)(v64 + 76) | dword_10001C9F0) & 0x10) != 0)
              {
                if (byte_10001CA48 != 2)
                {
                  if (byte_10001CA48 == 1)
                  {
                    char v78 = byte_10001CA4B;
                    if (dword_10001C0A0 > byte_10001CA4B
                      && dword_10001C0AC <= bswap32((unsigned __int16)word_10001CA50) >> 16)
                    {
                      int v123 = dword_10001CA60;
                      if (!dword_10001CA60)
                      {
                        dword_10001CA60 = sub_10000FED8(v64);
                        char v78 = byte_10001CA4B;
                      }
                      byte_10001CA4B = v78 + 1;
                      v79 = aPrivateTftpboo;
                      if (dword_10001CA40 >= 1)
                      {
                        uint64_t v80 = 0;
                        int v125 = 0;
                        v81 = &_os_log_default;
                        unint64_t v124 = v2;
                        do
                        {
                          in_addr_t v82 = *(_DWORD *)(*((void *)v77 + 327) + 4 * v80);
                          if (v82 != sub_10000FF00(v64))
                          {
                            if (byte_10001C1C0) {
                              BOOL v83 = v125 == 0;
                            }
                            else {
                              BOOL v83 = 0;
                            }
                            if (v83)
                            {
                              v84 = CFStringCreateMutable(0, 0);
                              sub_10000D1B0(v84, (unsigned __int8 *)&byte_10001CA48, v2);
                              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)stat buf = 138412290;
                                *(void *)&buf[4] = v84;
                                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "==== Relayed Request ====\n%@", buf, 0xCu);
                              }
                              CFRelease(v84);
                              int v125 = 1;
                            }
                            v85 = v81;
                            int v86 = dword_10001C080;
                            v87 = off_10001C090;
                            uint64_t v88 = nullsub_1(v64);
                            int v89 = byte_10001CA49;
                            int v90 = sub_10000FED8(v64);
                            int v91 = sub_100013BF0(v86, v87, v88, v89, 0, v82, v90, 0x43u, 0x44u, &byte_10001CA48, v2);
                            v81 = v85;
                            if (v91 < 0)
                            {
                              v79 = aPrivateTftpboo;
                              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                              {
                                v95.in_addr_t s_addr = v82;
                                v96 = inet_ntoa(v95);
                                *(_DWORD *)stat buf = 136315394;
                                *(void *)&buf[4] = v96;
                                _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "send to %s failed, %m", buf, 0xEu);
                              }
                              unint64_t v2 = v124;
                              v77 = aPrivateTftpboo;
                            }
                            else
                            {
                              if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                              {
                                uint64_t v92 = nullsub_1(v64);
                                v93.in_addr_t s_addr = v82;
                                v94 = inet_ntoa(v93);
                                *(_DWORD *)stat buf = 136315394;
                                *(void *)&buf[4] = v92;
                                *(_WORD *)&buf[12] = 2080;
                                *(void *)&buf[14] = v94;
                                _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "Relayed Request [%s] to %s", buf, 0x16u);
                              }
                              unint64_t v2 = v124;
                              v77 = aPrivateTftpboo;
                              v79 = aPrivateTftpboo;
                            }
                          }
                          ++v80;
                        }
                        while (v80 < *((int *)v79 + 656));
                      }
                      if (!v123) {
                        dword_10001CA60 = 0;
                      }
                      --byte_10001CA4B;
                    }
                  }
                  goto LABEL_254;
                }
                if (dword_10001CA60)
                {
                  uint64_t v97 = sub_10000F4CC((uint64_t *)qword_10001C9C8, dword_10001CA60);
                  if (v97)
                  {
                    uint64_t v98 = v97;
                    if ((word_10001CA52 & 0x80) != 0)
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)stat buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replying using broadcast IP address", buf, 2u);
                      }
                      int v99 = -1;
                    }
                    else
                    {
                      int v99 = dword_10001CA58;
                    }
                    if (byte_10001C1C0)
                    {
                      v101 = CFStringCreateMutable(0, 0);
                      sub_10000D1B0(v101, (unsigned __int8 *)&byte_10001CA48, v2);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)stat buf = 138412290;
                        *(void *)&buf[4] = v101;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "==== Relayed Reply ====\n%@", buf, 0xCu);
                      }
                      CFRelease(v101);
                    }
                    int v102 = dword_10001C080;
                    v103 = off_10001C090;
                    uint64_t v104 = nullsub_1(v98);
                    int v105 = byte_10001CA49;
                    int v106 = sub_10000FED8(v98);
                    int v107 = sub_100013BF0(v102, v103, v104, v105, (uint64_t)&unk_10001CA64, v99, v106, 0x44u, 0x43u, &byte_10001CA48, v2);
                    BOOL v108 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
                    if (v107 < 0)
                    {
                      if (!v108) {
                        goto LABEL_254;
                      }
                      v115.in_addr_t s_addr = v99;
                      v116 = inet_ntoa(v115);
                      *(_DWORD *)stat buf = 136315394;
                      *(void *)&buf[4] = v116;
                      v112 = "send %s failed, %m";
                      uint32_t v113 = 14;
                    }
                    else
                    {
                      if (!v108) {
                        goto LABEL_254;
                      }
                      uint64_t v109 = nullsub_1(v98);
                      v110.in_addr_t s_addr = v99;
                      v111 = inet_ntoa(v110);
                      *(_DWORD *)stat buf = 136315394;
                      *(void *)&buf[4] = v109;
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = v111;
                      v112 = "Relayed Response [%s] to %s";
                      uint32_t v113 = 22;
                    }
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v112, buf, v113);
                  }
                }
              }
LABEL_254:
              if (!byte_10001C1C0) {
                return;
              }
              *(void *)&__dst[0].tv_usec = 0;
              __dst[0].tv_sec = 0;
              uint64_t v126 = 0;
              __src = 0;
              gettimeofday(__dst, 0);
              sub_100010754(__dst[0].tv_sec, __dst[0].tv_usec, qword_10001CA00, *(int *)algn_10001CA08, (uint64_t)&v126);
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
                return;
              }
              *(_DWORD *)stat buf = 134218240;
              *(void *)&buf[4] = v126;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = __src;
              char v5 = "service time %lu.%06d seconds";
              int v6 = buf;
              os_log_type_t v7 = OS_LOG_TYPE_INFO;
              uint32_t v8 = 18;
LABEL_8:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v7, v5, v6, v8);
              return;
            }
          }
          if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            return;
          }
          LODWORD(__dst[0].tv_sec) = 136315138;
          *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
          char v5 = "ignoring request on %s (no services enabled)";
        }
        else
        {
          if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            return;
          }
          LODWORD(__dst[0].tv_sec) = 136315138;
          *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
          char v5 = "ignoring request on %s";
        }
      }
      else
      {
        if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        LODWORD(__dst[0].tv_sec) = 136315138;
        *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
        char v5 = "ignoring request on %s (no IP address)";
      }
    }
    else
    {
      if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      LODWORD(__dst[0].tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
      char v5 = "unknown interface %s";
    }
    int v6 = (uint8_t *)__dst;
LABEL_173:
    os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
    uint32_t v8 = 12;
    goto LABEL_8;
  }
}

BOOL sub_100006E34(unsigned char *a1, uint64_t a2, unsigned char *a3, char *a4, int a5)
{
  if ((!a1 || !*a1) && (!a3 || !*a3))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = 0;
      uint32_t v8 = "no replyfile";
      CFPropertyListRef v9 = (uint8_t *)&v18;
      uint32_t v10 = 2;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v8, v9, v10);
    }
    return 1;
  }
  __strlcpy_chk();
  if (v18 == 47)
  {
    __strlcpy_chk();
    if (!a2) {
      goto LABEL_13;
    }
  }
  else
  {
    __strlcpy_chk();
    __strlcat_chk();
    __strlcat_chk();
    if (!a2) {
      goto LABEL_13;
    }
  }
  int v11 = strlen(__s);
  __strlcat_chk();
  __strlcat_chk();
  if ((access(__s, 4) & 0x80000000) == 0) {
    goto LABEL_14;
  }
  __s[v11] = 0;
LABEL_13:
  if ((access(__s, 4) & 0x80000000) == 0) {
    goto LABEL_14;
  }
  if (byte_10001C9F8 != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      *(void *)CFArrayRef v16 = __s;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "boot file %s* missing", (uint8_t *)&v15, 0xCu);
    }
LABEL_14:
    int v12 = strlen(__s);
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v12 < a5)
    {
      if (v13)
      {
        int v15 = 136315138;
        *(void *)CFArrayRef v16 = __s;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replyfile %s", (uint8_t *)&v15, 0xCu);
      }
      strlcpy(a4, __s, a5);
      return 1;
    }
    if (v13)
    {
      int v15 = 67109376;
      *(_DWORD *)CFArrayRef v16 = v12;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = a5;
      uint32_t v8 = "boot file name too long %d >= %d";
      CFPropertyListRef v9 = (uint8_t *)&v15;
      uint32_t v10 = 14;
      goto LABEL_20;
    }
    return 1;
  }
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (result)
  {
    int v15 = 136315138;
    *(void *)CFArrayRef v16 = __s;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "boot file %s* missing - not replying", (uint8_t *)&v15, 0xCu);
    return 0;
  }
  return result;
}

uint64_t sub_100007158(unsigned int a1, unsigned int a2, uint64_t a3)
{
  if (a2)
  {
    if (qword_10001C1B8) {
      return SubnetListAreAddressesOnSameSupernet(qword_10001C1B8, a1, a2);
    }
    return 0;
  }
  int v5 = HIBYTE(a1);
  int v6 = BYTE2(a1);
  int v7 = BYTE1(a1);
  int v8 = a1;
  unsigned int v9 = a1 & 0xFF000000 | (BYTE2(a1) << 16) | (BYTE1(a1) << 8) | a1;
  if (sub_10000FF48(a3, v9) != -1)
  {
    if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      return 1;
    }
    int v23 = 136316162;
    uint64_t v24 = nullsub_1(a3);
    __int16 v25 = 1024;
    *(_DWORD *)uint32_t v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    __int16 v27 = 1024;
    int v28 = v6;
    __int16 v29 = 1024;
    int v30 = v5;
    uint32_t v10 = "%s: %d.%d.%d.%d on subnet";
    uint32_t v11 = 36;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v23, v11);
    return 1;
  }
  int v12 = sub_10000FFD8(a3);
  uint64_t v13 = *(unsigned int *)qword_10001C9E8;
  if ((int)v13 >= 1)
  {
    v14 = *(unsigned __int8 **)(qword_10001C9E8 + 8);
    while (1)
    {
      if (v14[9] == 18 && v12 == *((unsigned __int16 *)v14 + 5))
      {
        int v15 = *((_DWORD *)v14 + 1);
        if (v15)
        {
          if ((v15 & v9) == *(_DWORD *)v14) {
            break;
          }
        }
      }
      v14 += 28;
      if (!--v13) {
        goto LABEL_17;
      }
    }
    if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      return 1;
    }
    uint64_t v18 = nullsub_1(a3);
    int v19 = *v14;
    int v20 = v14[1];
    int v21 = v14[2];
    int v22 = v14[3];
    int v23 = 136317186;
    uint64_t v24 = v18;
    __int16 v25 = 1024;
    *(_DWORD *)uint32_t v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    __int16 v27 = 1024;
    int v28 = v6;
    __int16 v29 = 1024;
    int v30 = v5;
    __int16 v31 = 1024;
    int v32 = v19;
    __int16 v33 = 1024;
    int v34 = v20;
    __int16 v35 = 1024;
    int v36 = v21;
    __int16 v37 = 1024;
    int v38 = v22;
    uint32_t v10 = "%s: %d.%d.%d.%d on subnet route %d.%d.%d.%d";
    uint32_t v11 = 60;
    goto LABEL_8;
  }
LABEL_17:
  if (byte_10001C1C0)
  {
    uint64_t result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    uint64_t v16 = nullsub_1(a3);
    v17.in_addr_t s_addr = v9;
    int v23 = 136315394;
    uint64_t v24 = v16;
    __int16 v25 = 2080;
    *(void *)uint32_t v26 = inet_ntoa(v17);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: ip %s not reachable", (uint8_t *)&v23, 0x16u);
  }
  return 0;
}

BOOL sub_10000743C(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = 1;
  *(_DWORD *)(a1 + 16) = 1;
  if (*(_DWORD *)(a1 + 4) != a2) {
    return sub_100007158(a2, *(_DWORD *)a1, *(void *)(a1 + 8)) != 0;
  }
  return v2;
}

BOOL sub_100007494(uint64_t a1, uint64_t a2, unsigned int a3, int a4, in_addr_t *a5)
{
  in_addr_t v7 = *(_DWORD *)(a2 + 12);
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v8.in_addr_t s_addr = v7;
      *(_DWORD *)stat buf = 136315138;
      uint32_t v26 = inet_ntoa(v8);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "reply ciaddr %s", buf, 0xCu);
    }
    uint64_t v9 = 0;
LABEL_5:
    unsigned int v10 = 68;
    unsigned __int16 v11 = 67;
    goto LABEL_23;
  }
  in_addr_t v7 = *(_DWORD *)(a2 + 24);
  if (!v7)
  {
    if (a4 || (*(_WORD *)(a2 + 10) & 0x80) != 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replying using broadcast IP address", buf, 2u);
      }
      uint64_t v9 = 0;
      in_addr_t v7 = -1;
    }
    else
    {
      v14 = (in_addr_t *)(a2 + 16);
      if (a5) {
        v14 = a5;
      }
      in_addr_t v7 = *v14;
      uint64_t v9 = a2 + 28;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v15.in_addr_t s_addr = v7;
      uint64_t v16 = inet_ntoa(v15);
      *(_DWORD *)stat buf = 136315138;
      uint32_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replying to %s", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v13.in_addr_t s_addr = v7;
    *(_DWORD *)stat buf = 136315138;
    uint32_t v26 = inet_ntoa(v13);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "reply giaddr %s", buf, 0xCu);
  }
  if (a4)
  {
    uint64_t v9 = 0;
    *(_WORD *)(a2 + 10) |= 0x8000u;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unsigned int v10 = 67;
  unsigned __int16 v11 = 68;
LABEL_23:
  int v17 = dword_10001C080;
  uint64_t v18 = off_10001C090;
  uint64_t v19 = nullsub_1(a1);
  int v20 = sub_10000FFBC(a1);
  int v21 = sub_10000FED8(a1);
  if ((sub_100013BF0(v17, v18, v19, v20, v9, v7, v21, v10, v11, (void *)a2, a3) & 0x80000000) != 0)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)stat buf = 6291714;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "transmit failed, %m", buf, 4u);
      return 0;
    }
  }
  else
  {
    if (byte_10001C1C0)
    {
      Mutable = CFStringCreateMutable(0, 0);
      sub_10000D1B0(Mutable, (unsigned __int8 *)a2, a3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 138412290;
        uint32_t v26 = (char *)Mutable;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "==== Server Reply ====\n%@", buf, 0xCu);
      }
      CFRelease(Mutable);
    }
    return 1;
  }
  return result;
}

uint64_t sub_1000077FC(char *a1, unsigned int a2, uint64_t a3, uint64_t *a4, unsigned char *a5, unsigned int a6)
{
  int v54 = sub_10000D188((uint64_t)a4);
  if (qword_10001C1B8)
  {
    uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(qword_10001C1B8, a2, 1);
    if (!SubnetForAddress) {
      uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(qword_10001C1B8, a2, 0);
    }
  }
  else
  {
    uint64_t SubnetForAddress = 0;
  }
  if (a5) {
    uint64_t v11 = a6;
  }
  else {
    uint64_t v11 = 5;
  }
  if (!a5) {
    a5 = &unk_100014CB0;
  }
  if ((int)v11 >= 1)
  {
    __src = 0;
    uint64_t v12 = 0;
    int v56 = 0;
    in_addr v13 = &_os_log_default;
    v14 = "couldn't add hostname: %s";
    while (1)
    {
      int v15 = *a5;
      if ((v15 - 50) >= 0xA)
      {
        if (*a5 > 0x3Cu)
        {
          if (v15 == 61 || v15 == 255) {
            goto LABEL_13;
          }
          goto LABEL_26;
        }
        if (*a5) {
          break;
        }
      }
LABEL_13:
      ++a5;
      if (!--v11) {
        return sub_10000D188((uint64_t)a4) - v54;
      }
    }
    if (v15 == 12)
    {
      if (!a1) {
        goto LABEL_13;
      }
      int v16 = strlen(a1);
      if (!sub_10000CF40((uint64_t)a4, 12, v16, a1) || !os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v17 = sub_10000D160(a4);
      *(_DWORD *)stat buf = 136315138;
      *(void *)in_addr v59 = v17;
      uint64_t v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      int v20 = v14;
      goto LABEL_22;
    }
LABEL_26:
    if (SubnetForAddress)
    {
      int v57 = 0;
      OptionPtrAndLength = (void *)SubnetGetOptionPtrAndLength(SubnetForAddress, v15, &v57);
      BOOL v23 = OptionPtrAndLength != 0;
      if (OptionPtrAndLength
        && sub_10000CF40((uint64_t)a4, *a5, v57, OptionPtrAndLength)
        && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v14;
        __int16 v25 = v13;
        uint64_t v26 = v12;
        uint64_t v27 = SubnetForAddress;
        int v28 = a1;
        int v29 = *a5;
        int v30 = sub_10000D160(a4);
        *(_DWORD *)stat buf = 67109378;
        *(_DWORD *)in_addr v59 = v29;
        a1 = v28;
        uint64_t SubnetForAddress = v27;
        uint64_t v12 = v26;
        in_addr v13 = v25;
        v14 = v24;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = v30;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "couldn't add option %d: %s", buf, 0x12u);
      }
    }
    else
    {
      BOOL v23 = 0;
    }
    if (v23 || !dword_10001C0A4) {
      goto LABEL_87;
    }
    if (!v56)
    {
      uint64_t v31 = sub_10000FF48(a3, a2);
      if (v31 != -1) {
        uint64_t v12 = sub_10000FED0(a3, v31);
      }
      __src = (_DWORD *)inetroute_default(qword_10001C9E8);
    }
    unsigned int v32 = *a5;
    int v56 = 1;
    if (v32 <= 5)
    {
      if (v32 == 1)
      {
        if (!v12) {
          goto LABEL_69;
        }
        uint64_t v51 = v12;
        uint64_t v42 = (_DWORD *)(v12 + 4);
        if (sub_10000CF40((uint64_t)a4, 1, 4, v42))
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v43 = sub_10000D160(a4);
            *(_DWORD *)stat buf = 136315138;
            *(void *)in_addr v59 = v43;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "couldn't add subnet_mask: %s", buf, 0xCu);
          }
          int v56 = 1;
          uint64_t v12 = v51;
          goto LABEL_13;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v46.in_addr_t s_addr = *v42;
          v47 = inet_ntoa(v46);
          uint64_t v48 = nullsub_1(a3);
          *(_DWORD *)stat buf = 136315394;
          *(void *)in_addr v59 = v47;
          *(_WORD *)&v59[8] = 2080;
          *(void *)&v59[10] = v48;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "subnet mask %s derived from %s", buf, 0x16u);
          int v56 = 1;
          uint64_t v12 = v51;
          goto LABEL_88;
        }
        int v56 = 1;
        uint64_t v12 = v51;
        goto LABEL_87;
      }
      if (v32 != 3) {
        goto LABEL_87;
      }
      int v56 = 1;
      if (!__src) {
        goto LABEL_13;
      }
      if (!v12) {
        goto LABEL_13;
      }
      int v37 = *(_DWORD *)(v12 + 4);
      int v36 = *(_DWORD *)(v12 + 8);
      int v56 = 1;
      if ((*__src & v37) != v36 || (v37 & a2) != v36) {
        goto LABEL_13;
      }
      if (sub_10000CF40((uint64_t)a4, 3, 4, __src))
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = sub_10000D160(a4);
          *(_DWORD *)stat buf = 136315138;
          *(void *)in_addr v59 = v38;
          int v34 = v13;
          __int16 v35 = "couldn't add router: %s";
          goto LABEL_59;
        }
LABEL_69:
        int v56 = 1;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        in_addr v44 = v13;
        v45 = "default route added as router";
        goto LABEL_85;
      }
    }
    else
    {
      if (v32 != 6)
      {
        if (v32 != 15)
        {
          if (v32 != 119) {
            goto LABEL_87;
          }
          if (qword_10001CA28)
          {
            if (sub_10000CF40((uint64_t)a4, 119, dword_10001CA30, (void *)qword_10001CA28))
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v33 = sub_10000D160(a4);
                *(_DWORD *)stat buf = 136315138;
                *(void *)in_addr v59 = v33;
                int v34 = v13;
                __int16 v35 = "couldn't add domain search: %s";
                goto LABEL_59;
              }
              goto LABEL_69;
            }
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)stat buf = 0;
              in_addr v44 = v13;
              v45 = "domain search added";
LABEL_85:
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, v45, buf, 2u);
              int v56 = 1;
              goto LABEL_88;
            }
          }
          goto LABEL_86;
        }
        if (qword_10001CA20)
        {
          int v40 = strlen((const char *)qword_10001CA20);
          if (sub_10000CF40((uint64_t)a4, 15, v40, (void *)qword_10001CA20))
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int v41 = sub_10000D160(a4);
              *(_DWORD *)stat buf = 136315138;
              *(void *)in_addr v59 = v41;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "couldn't add domain name: %s", buf, 0xCu);
            }
            int v56 = 1;
            v14 = "couldn't add hostname: %s";
            goto LABEL_13;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)stat buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "default domain name added", buf, 2u);
            int v56 = 1;
            v14 = "couldn't add hostname: %s";
            goto LABEL_88;
          }
          int v56 = 1;
        }
        else
        {
          int v56 = 1;
        }
        v14 = "couldn't add hostname: %s";
LABEL_87:
        if (v23) {
          goto LABEL_13;
        }
LABEL_88:
        if (*a5 != 108 || ((*(_DWORD *)(a3 + 76) | dword_10001C9F0) & 0x80) == 0) {
          goto LABEL_13;
        }
        if (sub_10000CF40((uint64_t)a4, 108, 4, &dword_10001CA34))
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          v49 = sub_10000D160(a4);
          *(_DWORD *)stat buf = 136315138;
          *(void *)in_addr v59 = v49;
          uint64_t v18 = v13;
          os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
          int v20 = "couldn't add ipv6 only preferred: %s";
LABEL_22:
          uint32_t v21 = 12;
        }
        else
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
            goto LABEL_13;
          }
          *(_WORD *)stat buf = 0;
          uint64_t v18 = v13;
          os_log_type_t v19 = OS_LOG_TYPE_INFO;
          int v20 = "IPv6-only preferred option added";
          uint32_t v21 = 2;
        }
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v20, buf, v21);
        goto LABEL_13;
      }
      if (!dword_10001CA14) {
        goto LABEL_69;
      }
      if (sub_10000CF40((uint64_t)a4, 6, 4 * dword_10001CA14, (void *)qword_10001CA18))
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v39 = sub_10000D160(a4);
          *(_DWORD *)stat buf = 136315138;
          *(void *)in_addr v59 = v39;
          int v34 = v13;
          __int16 v35 = "couldn't add dns servers: %s";
LABEL_59:
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
        }
        goto LABEL_69;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        in_addr v44 = v13;
        v45 = "default dns servers added";
        goto LABEL_85;
      }
    }
LABEL_86:
    int v56 = 1;
    goto LABEL_87;
  }
  return sub_10000D188((uint64_t)a4) - v54;
}

void sub_10000803C(id a1)
{
  v2.tv_sec = 0;
  *(void *)&v2.tv_usec = 0;
  gettimeofday(&v2, 0);
  if (v2.tv_sec - qword_10001CA00 >= 300)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)ssize_t v1 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "idle, exiting", v1, 2u);
    }
    exit(0);
  }
}

void sub_1000080C8(id a1)
{
  byte_10001CA44 = 0;
}

BOOL sub_1000080D4(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    int v8 = 0;
    if (Value)
    {
      if (sub_10000C2BC(Value, &v8))
      {
        return v8 != 0;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        uint64_t v10 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid '%s' property", buf, 0xCu);
      }
    }
  }
  return a4;
}

uint64_t sub_1000081A8(uint64_t result, int a2)
{
  if (!result) {
    return result;
  }
  CFStringRef v3 = (const __CFString *)result;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (CFGetTypeID(v3) == TypeID)
  {
    BOOL result = CFEqual(v3, kCFBooleanTrue);
    if (!result) {
      return result;
    }
    goto LABEL_4;
  }
  CFTypeID v5 = CFStringGetTypeID();
  if (CFGetTypeID(v3) == v5)
  {
    uint64_t v6 = 1;
    CFStringRef ValueAtIndex = v3;
    goto LABEL_7;
  }
  CFTypeID v10 = CFArrayGetTypeID();
  BOOL result = CFGetTypeID(v3);
  if (result == v10)
  {
    BOOL result = CFArrayGetCount((CFArrayRef)v3);
    if (!result)
    {
LABEL_4:
      dword_10001C9F0 |= a2;
      return result;
    }
    uint64_t v6 = result;
    if (result >= 1)
    {
      CFStringRef ValueAtIndex = 0;
LABEL_7:
      for (CFIndex i = 0; i != v6; ++i)
      {
        if (i || !ValueAtIndex)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v3, i);
          BOOL result = CFStringGetTypeID();
          if (!ValueAtIndex) {
            continue;
          }
          uint64_t v9 = result;
          BOOL result = CFGetTypeID(ValueAtIndex);
          if (result != v9) {
            continue;
          }
        }
        BOOL result = CFStringGetCString(ValueAtIndex, buffer, 17, 0x600u);
        if (result && buffer[0])
        {
          BOOL result = sub_10000F590((uint64_t *)qword_10001C9C8, buffer);
          if (result) {
            *(_DWORD *)(result + 76) |= a2;
          }
        }
      }
    }
  }
  return result;
}

char *sub_100008340(const __CFArray *a1, _DWORD *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFTypeID v5 = (char *)malloc_type_malloc(6 * Count, 0x1000040274DC3F3uLL);
  if (Count < 1) {
    goto LABEL_12;
  }
  CFIndex v6 = 0;
  int v7 = 0;
  do
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
    CFTypeID TypeID = CFStringGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == TypeID)
      {
        if (CFStringGetCString(ValueAtIndex, buffer, 64, 0x600u))
        {
          if (strlen(buffer) >= 2)
          {
            CFTypeID v10 = ether_aton(&buffer[2 * (*(unsigned __int16 *)buffer == 11313)]);
            if (v10)
            {
              uint64_t v11 = &v5[6 * v7];
              int v12 = *(_DWORD *)v10->octet;
              *((_WORD *)v11 + 2) = *(_WORD *)&v10->octet[4];
              *(_DWORD *)uint64_t v11 = v12;
              ++v7;
            }
          }
        }
      }
    }
    ++v6;
  }
  while (Count != v6);
  if (v7)
  {
    qsort(v5, v7, 6uLL, (int (__cdecl *)(const void *, const void *))sub_100010A38);
  }
  else
  {
LABEL_12:
    free(v5);
    int v7 = 0;
    CFTypeID v5 = 0;
  }
  *a2 = v7;
  return v5;
}

unsigned int *sub_1000084D0(int a1, _DWORD *a2)
{
  *a2 = 0;
  timeval v2 = (unsigned int *)qword_10001D268;
  if (qword_10001D270 < 0xC || qword_10001D268 == 0) {
    return 0;
  }
  while (v2[1] || v2[2] != a1)
  {
    timeval v2 = (unsigned int *)((char *)v2 + ((*v2 + 3) & 0x1FFFFFFFCLL));
    if ((unint64_t)(v2 + 3) > qword_10001D268 + (unint64_t)qword_10001D270) {
      return 0;
    }
  }
  if (*v2 < 0xC) {
    return 0;
  }
  *a2 = *v2 - 12;
  return v2 + 3;
}

uint64_t sub_100008544()
{
  CFDictionaryRef v0 = CFDictionaryCreate(0, (const void **)&kSCDynamicStoreUseSessionKeys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  qword_10001D4A0 = (uint64_t)SCDynamicStoreCreateWithOptions(0, @"com.apple.network.bootpd", v0, (SCDynamicStoreCallBack)sub_1000086B4, 0);
  CFRelease(v0);
  if (!qword_10001D4A0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFTypeID v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SCDynamicStoreCreate failed", v5, 2u);
    }
    exit(2);
  }
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
  Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_10001D4A0, 0, Mutable);
  CFRelease(Mutable);
  CFStringRef v3 = (const __SCDynamicStore *)qword_10001D4A0;

  return SCDynamicStoreSetDispatchQueue(v3, (dispatch_queue_t)&_dispatch_main_q);
}

void sub_1000086B4()
{
  byte_10001CA44 = 0;
}

void sub_1000086C0(const char *a1)
{
  memset(&v31, 0, sizeof(v31));
  if (a1) {
    ssize_t v1 = a1;
  }
  else {
    ssize_t v1 = "/etc/bootptab";
  }
  timeval v2 = fopen(v1, "r");
  if (!v2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)stat buf = 136315138;
    v45 = v1;
    int v22 = "can't open %s";
    BOOL v23 = buf;
    os_log_type_t v24 = OS_LOG_TYPE_INFO;
    uint32_t v25 = 12;
    goto LABEL_59;
  }
  CFStringRef v3 = v2;
  int v4 = fileno(v2);
  if (!fstat(v4, &v31) && v31.st_mtimespec.tv_sec == qword_10001D4B0)
  {
    fclose(v3);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    v45 = v1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "re-reading %s", buf, 0xCu);
  }
  qword_10001D4B0 = v31.st_mtimespec.tv_sec;
  CFTypeID v5 = (void *)qword_10001D4B8;
  if (qword_10001D4B8)
  {
    do
    {
      CFIndex v6 = (void *)*v5;
      hostfree(&qword_10001D4B8, v5);
      CFTypeID v5 = v6;
    }
    while (v6);
  }
  uint64_t v29 = 0;
  if (fgets((char *)buf, 256, v3))
  {
    int v26 = 0;
    int v7 = 0;
    int v8 = 0;
    BOOL v9 = 1;
    while (1)
    {
      int v10 = strlen((const char *)buf);
      if (v10) {
        buf[v10 - 1] = 0;
      }
      int v30 = buf;
      ++v8;
      if (buf[0] <= 0x23u && ((1 << buf[0]) & 0x900000001) != 0) {
        goto LABEL_20;
      }
      if (!v9) {
        break;
      }
      BOOL v9 = buf[0] != 37;
LABEL_20:
      uint64_t v29 = 0;
      if (!fgets((char *)buf, 256, v3)) {
        goto LABEL_57;
      }
    }
    int v27 = v7 + 1;
    sub_100008CC4(&v30, v8, v41, 63);
    sub_100008CC4(&v30, v8, v43, 64);
    sscanf(v43, "%d", &v29);
    sub_100008CC4(&v30, v8, v43, 64);
    int v12 = &v42;
    __strlcpy_chk();
    uint64_t v13 = 0;
    int v14 = 1;
    do
    {
      int v28 = 0;
      for (CFIndex i = v12 + 1; ; ++i)
      {
        unsigned int v16 = *((unsigned __int8 *)i - 1);
        if (v16 <= 0x3A && ((1 << v16) & 0x400400000000001) != 0) {
          break;
        }
      }
      *((unsigned char *)i - 1) = 0;
      if (sscanf(v12, "%x", &v28) != 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unsigned int v32 = 136315394;
          __int16 v33 = v43;
          __int16 v34 = 1024;
          int v35 = v8;
          int v20 = "bad hex address: %s, at line %d of bootptab";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, v32, 0x12u);
        }
LABEL_43:
        BOOL v9 = 0;
        int v7 = v27;
        goto LABEL_20;
      }
      int v18 = v28;
      uint64_t v19 = v13 + 1;
      v36[v13] = v28;
      if (v18) {
        int v14 = 0;
      }
      if (!v16) {
        break;
      }
      ++v13;
      int v12 = i;
    }
    while (v19 != 32);
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v32 = 136315394;
        __int16 v33 = v43;
        __int16 v34 = 1024;
        int v35 = v8;
        int v20 = "zero hex address: %s, at line %d of bootptab";
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    if (v29 != 1 || v19 == 6)
    {
      sub_100008CC4(&v30, v8, v43, 64);
      HIDWORD(v29) = inet_addr(v43);
      int v7 = v27;
      if ((HIDWORD(v29) + 1) > 1)
      {
        sub_100008CC4(&v30, v8, v37, 127);
        hostadd((uint64_t)&qword_10001D4B8, 0, v29, (uint64_t)v36, v19, (_DWORD *)&v29 + 1, v41, (const char *)v37);
        BOOL v9 = 0;
        ++v26;
        goto LABEL_20;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_52;
      }
      *(_DWORD *)unsigned int v32 = 136315394;
      __int16 v33 = v43;
      __int16 v34 = 1024;
      int v35 = v8;
      uint32_t v21 = "bad internet address: %s, at line %d of bootptab";
    }
    else
    {
      int v7 = v27;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_52:
        BOOL v9 = 0;
        goto LABEL_20;
      }
      *(_DWORD *)unsigned int v32 = 136315394;
      __int16 v33 = v43;
      __int16 v34 = 1024;
      int v35 = v8;
      uint32_t v21 = "bad hex address: %s, at line %d of bootptab";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, v32, 0x12u);
    goto LABEL_52;
  }
  int v7 = 0;
  int v26 = 0;
LABEL_57:
  fclose(v3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v37 = 67109376;
    int v38 = v26;
    __int16 v39 = 1024;
    int v40 = v7 - v26;
    int v22 = "Loaded %d entries from bootptab (%d bad)";
    BOOL v23 = v37;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    uint32_t v25 = 14;
LABEL_59:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v24, v22, v23, v25);
  }
}

void sub_100008CC4(unsigned char **a1, int a2, unsigned char *a3, int a4)
{
  for (CFIndex i = *a1; ; ++i)
  {
    int v8 = *i;
    if (v8 != 9 && v8 != 32) {
      break;
    }
  }
  if (*i)
  {
    for (uint64_t j = 0; ; ++j)
    {
      if (v8 <= 0x20u && ((1 << v8) & 0x100000201) != 0)
      {
        a3[j] = 0;
        i += j;
        goto LABEL_13;
      }
      a3[j] = v8;
      if (a4 <= 2) {
        break;
      }
      LOBYTE(v8) = i[j + 1];
      --a4;
    }
    a3[j + 1] = 0;
    i += j;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = a3;
      __int16 v12 = 1024;
      int v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "string truncated: %s, on line %d of bootptab", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    *a3 = 0;
  }
LABEL_13:
  *a1 = i;
}

uint64_t sub_100008E1C(int a1, void *a2, unsigned int a3, unsigned int (*a4)(uint64_t, void), uint64_t a5, _DWORD *a6, char **a7, char **a8)
{
  uint64_t v8 = qword_10001D4B8;
  if (!qword_10001D4B8) {
    return 0;
  }
  size_t v17 = a3;
  while (*(unsigned __int8 *)(v8 + 20) != a1
       || *(unsigned __int8 *)(v8 + 21) != a3
       || bcmp(a2, (const void *)(v8 + 22), v17)
       || a4 && !a4(a5, *(unsigned int *)(v8 + 16)))
  {
    uint64_t v8 = *(void *)v8;
    if (!v8) {
      return 0;
    }
  }
  if (a7) {
    *a7 = strdup(*(const char **)(v8 + 280));
  }
  if (a8) {
    *a8 = strdup(*(const char **)(v8 + 288));
  }
  *a6 = *(_DWORD *)(v8 + 16);
  return 1;
}

uint64_t sub_100008F04(int a1, char **a2, char **a3)
{
  uint64_t v3 = qword_10001D4B8;
  if (!qword_10001D4B8) {
    return 0;
  }
  while (*(_DWORD *)(v3 + 16) != a1)
  {
    uint64_t v3 = *(void *)v3;
    if (!v3) {
      return 0;
    }
  }
  if (a2) {
    *a2 = strdup(*(const char **)(v3 + 280));
  }
  if (a3) {
    *a3 = strdup(*(const char **)(v3 + 288));
  }
  return 1;
}

uint64_t sub_100008F7C(uint64_t *a1)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_100012508(a1);
  sub_10001251C((uint64_t)a1, 104857600);
  if (sub_10001261C((uint64_t)a1, "/var/db/dhcpd_leases")) {
    return 1;
  }
  sub_1000125A8(a1);
  uint64_t result = 0;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

uint64_t sub_100008FE4(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t *a4, in_addr *a5)
{
  CFTypeID v5 = *(void **)(a1 + 8);
  if (!v5) {
    return 0;
  }
  while (1)
  {
    v18.in_addr_t s_addr = 0;
    uint64_t v9 = sub_100013248(*v5, v5[1], "ip_address", 0);
    if (v9 << 32 != 0xFFFFFFFF00000000)
    {
      uint64_t v10 = v5[1];
      if (*(_DWORD *)(v10 + 24 * (int)v9 + 8))
      {
        if (inet_aton(**(const char ***)(v10 + 24 * (int)v9 + 16), &v18)
          && sub_100007158(v18.s_addr, a3, a2))
        {
          uint64_t v11 = sub_100013248(*v5, v5[1], "lease", 0);
          if (v11 << 32 == 0xFFFFFFFF00000000) {
            break;
          }
          uint64_t v12 = v5[1];
          if (*(_DWORD *)(v12 + 24 * (int)v11 + 8))
          {
            uint64_t v13 = strtol(**(const char ***)(v12 + 24 * (int)v11 + 16), 0, 0);
            if ((v13 != 0x7FFFFFFFFFFFFFFFLL || *__error() != 34) && *a4 > v13) {
              break;
            }
          }
        }
      }
    }
    CFTypeID v5 = (void *)v5[5];
    if (!v5) {
      return 0;
    }
  }
  uint64_t v19 = v5;
  sub_1000091D8((uint64_t *)&v19);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v15.in_addr_t s_addr = v18.s_addr;
    unsigned int v16 = inet_ntoa(v15);
    *(_DWORD *)stat buf = 136315138;
    uint32_t v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "dhcp: reclaimed address %s", buf, 0xCu);
  }
  a5->in_addr_t s_addr = v18.s_addr;
  return 1;
}

uint64_t sub_1000091D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  sub_100012B60((uint64_t)&xmmword_10001D4C8, *a1);
  sub_1000124C4(v2);
  *a1 = 0;
  sub_1000129D8((unsigned int **)&xmmword_10001D4C8, (const std::__fs::filesystem::path *)"/var/db/dhcpd_leases");

  return notify_post("com.apple.bootpd.DHCPLeaseList");
}

uint64_t sub_10000924C(uint64_t a1)
{
  int v4 = 0;
  ssize_t v1 = sub_10000CBAC(a1, 57, &v4, 0);
  uint64_t result = 548;
  if (v1 && v4 == 2)
  {
    unsigned int v3 = bswap32(*(unsigned __int16 *)v1) >> 16;
    if (v3 <= 0x224) {
      return 548;
    }
    else {
      return v3;
    }
  }
  return result;
}

void sub_1000092AC()
{
  if (byte_10001D4C0)
  {
    long long v0 = 0uLL;
    uint64_t v1 = 0;
    if (sub_100008F7C((uint64_t *)&v0))
    {
      sub_1000125A8((uint64_t *)&xmmword_10001D4C8);
      xmmword_10001D4C8 = v0;
      qword_10001D4D8 = v1;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 67109120;
        int v3 = HIDWORD(qword_10001D4D8);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcp: re-reading lease list (%d entries)", buf, 8u);
      }
    }
  }
  else if (sub_100008F7C((uint64_t *)&xmmword_10001D4C8))
  {
    byte_10001D4C0 = 1;
  }
}

uint64_t sub_1000093AC(uint64_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t *a6)
{
  uint64_t v8 = a1;
  int __src = a3;
  long long v10 = a5[1];
  long long v9 = a5[2];
  *(_OWORD *)a1 = *a5;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v9;
  long long v11 = a5[3];
  long long v12 = a5[4];
  long long v13 = a5[6];
  *(_OWORD *)(a1 + 80) = a5[5];
  *(_OWORD *)(a1 + 96) = v13;
  *(_OWORD *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 64) = v12;
  long long v14 = a5[7];
  long long v15 = a5[8];
  long long v16 = a5[10];
  *(_OWORD *)(a1 + 144) = a5[9];
  *(_OWORD *)(a1 + 160) = v16;
  *(_OWORD *)(a1 + 112) = v14;
  *(_OWORD *)(a1 + 128) = v15;
  long long v17 = a5[11];
  long long v18 = a5[12];
  long long v19 = a5[13];
  *(_OWORD *)(a1 + 220) = *(_OWORD *)((char *)a5 + 220);
  *(_OWORD *)(a1 + 192) = v18;
  *(_OWORD *)(a1 + 208) = v19;
  *(_OWORD *)(a1 + 176) = v17;
  *(_DWORD *)(a1 + 20) = a3;
  *(unsigned char *)(a1 + 3) = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 2;
  *(_DWORD *)(a1 + 236) = 1666417251;
  sub_10000CF38((uint64_t)a6, (void *)(a1 + 240), a2 - 240);
  if (sub_10000D130((uint64_t)a6, a4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 67109378;
      LODWORD(v26[0]) = a4;
      WORD2(v26[0]) = 2080;
      *(void *)((char *)v26 + 6) = sub_10000D160(a6);
      int v20 = "make_dhcp_reply: couldn't add dhcp message tag %d: %s";
      uint32_t v21 = 18;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v20, buf, v21);
      return 0;
    }
    return 0;
  }
  if (sub_10000CF40((uint64_t)a6, 54, 4, &__src))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v22 = sub_10000D160(a6);
      *(_DWORD *)stat buf = 136315138;
      v26[0] = v22;
      int v20 = "make_dhcp_reply: couldn't add server identifier tag: %s";
      uint32_t v21 = 12;
      goto LABEL_7;
    }
    return 0;
  }
  return v8;
}

void sub_100009578(unsigned int *a1, uint64_t a2, _DWORD *a3)
{
  snprintf(__str, 0x20uLL, "0x%lx", a2);
  sub_100013424(a1, "lease", __str, a3);
}

uint64_t sub_100009600(unsigned int a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t result = qword_10001C1B8;
  if (qword_10001C1B8)
  {
    if (a1)
    {
      *a4 = a1;
      return SubnetListAcquireAddress(result, a4, (uint64_t (*)(uint64_t, uint64_t))sub_10000BA80, a3);
    }
    else if ((int)sub_10000FEC8(a2) < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v9 = 0;
      while (1)
      {
        *a4 = *(_DWORD *)(sub_10000FED0(a2, v9) + 8);
        uint64_t result = SubnetListAcquireAddress(qword_10001C1B8, a4, (uint64_t (*)(uint64_t, uint64_t))sub_10000BA80, a3);
        if (result) {
          break;
        }
        uint64_t v9 = (v9 + 1);
        if ((int)v9 >= (int)sub_10000FEC8(a2)) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000096F4(const char *a1, const char *a2, in_addr_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if (a4)
  {
    long long v10 = sub_10000B998(a4, a5);
    *(void *)&__str[8] = 0;
    uint64_t v26 = 0;
    *(void *)__str = "name";
    if (v10) {
      sub_100013350((unsigned int *)&__str[8], v10, 0);
    }
    long long v23 = *(_OWORD *)__str;
    uint64_t v24 = v26;
    sub_100012ECC((unsigned int *)&v19, (uint64_t)&v23, 0);
    sub_1000132E4(&__str[8]);
    free(v10);
  }
  v11.in_addr_t s_addr = a3;
  long long v12 = inet_ntoa(v11);
  unint64_t v13 = v19;
  *(void *)&__str[8] = 0;
  uint64_t v26 = 0;
  *(void *)__str = "ip_address";
  if (v12) {
    sub_100013350((unsigned int *)&__str[8], v12, 0);
  }
  long long v23 = *(_OWORD *)__str;
  uint64_t v24 = v26;
  sub_100012ECC((unsigned int *)&v19, (uint64_t)&v23, v13);
  sub_1000132E4(&__str[8]);
  unint64_t v14 = v19;
  *(void *)&__str[8] = 0;
  uint64_t v26 = 0;
  *(void *)__str = "hw_address";
  if (a2) {
    sub_100013350((unsigned int *)&__str[8], a2, 0);
  }
  long long v23 = *(_OWORD *)__str;
  uint64_t v24 = v26;
  sub_100012ECC((unsigned int *)&v19, (uint64_t)&v23, v14);
  sub_1000132E4(&__str[8]);
  unint64_t v15 = v19;
  *(void *)&__str[8] = 0;
  uint64_t v26 = 0;
  *(void *)__str = "identifier";
  if (a1) {
    sub_100013350((unsigned int *)&__str[8], a1, 0);
  }
  long long v23 = *(_OWORD *)__str;
  uint64_t v24 = v26;
  sub_100012ECC((unsigned int *)&v19, (uint64_t)&v23, v15);
  sub_1000132E4(&__str[8]);
  snprintf(__str, 0x80uLL, "0x%lx", a6);
  unint64_t v16 = v19;
  *((void *)&v23 + 1) = 0;
  uint64_t v24 = 0;
  *(void *)&long long v23 = "lease";
  sub_100013350((unsigned int *)&v23 + 2, __str, 0);
  long long v21 = v23;
  uint64_t v22 = v24;
  sub_100012ECC((unsigned int *)&v19, (uint64_t)&v21, v16);
  sub_1000132E4((void *)&v23 + 1);
  long long v17 = sub_100012460(v19, v20);
  sub_1000125E8((uint64_t *)&xmmword_10001D4C8, (uint64_t)v17);
  sub_1000129D8((unsigned int **)&xmmword_10001D4C8, (const std::__fs::filesystem::path *)"/var/db/dhcpd_leases");
  sub_1000130CC((unsigned int *)&v19);
  return notify_post("com.apple.bootpd.DHCPLeaseList");
}

void sub_100009994(uint64_t *a1, unsigned int a2, int a3)
{
  memset(v189, 0, sizeof(v189));
  *(void *)v188 = 0;
  int v187 = 0;
  v186 = 0;
  unsigned int __src = 0;
  uint64_t v183 = 0;
  memset(v202, 0, sizeof(v202));
  unsigned int v182 = 0;
  uint64_t v6 = a1[1];
  if (byte_10001C0B2) {
    int v7 = (char **)&v189[1];
  }
  else {
    int v7 = 0;
  }
  v185.in_addr_t s_addr = 0;
  unsigned int v8 = sub_10000924C(a1[3]);
  if (v8 >= 0x5DC) {
    int v9 = 1500;
  }
  else {
    int v9 = v8;
  }
  long long v10 = sub_10000CBAC(a1[3], 61, v189, 0);
  if (!v10
    || (int)v189[0] < 2
    || (in_addr v11 = v10 + 1, v12 = *v10, v13 = v189[0] - 1, --v189[0], byte_10001C0B1) && *(unsigned char *)(v6 + 2))
  {
    int v12 = *(unsigned __int8 *)(v6 + 1);
    int v13 = *(unsigned __int8 *)(v6 + 2);
    v189[0] = v13;
    if (!v13)
    {
      unint64_t v15 = 0;
      goto LABEL_22;
    }
    in_addr v11 = (void *)(v6 + 28);
  }
  unint64_t v14 = identifierToStringWithBuffer(v12, (uint64_t)v11, v13, __str, 128);
  unint64_t v15 = v14;
  if (!v14)
  {
LABEL_22:
    unint64_t v16 = 0;
    goto LABEL_330;
  }
  int v178 = v9;
  unint64_t v16 = v14;
  if (!v12)
  {
    unint64_t v16 = identifierToStringWithBuffer(*(unsigned __int8 *)(v6 + 1), v6 + 28, *(unsigned __int8 *)(v6 + 2), v200, 48);
    if (!v16) {
      goto LABEL_330;
    }
  }
  int v174 = a3;
  long long v17 = sub_10000CBAC(a1[3], 12, &v187, 0);
  int v18 = v187;
  BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  uint64_t v176 = (uint64_t)v17;
  if (v17 && v18)
  {
    if (!v19) {
      goto LABEL_31;
    }
    if (a2 > 8) {
      uint64_t v20 = "<unknown>";
    }
    else {
      uint64_t v20 = off_1000185F0[a2];
    }
    uint64_t v22 = nullsub_1(*a1);
    *(_DWORD *)stat buf = 136316162;
    *(void *)v198 = v20;
    *(_WORD *)&v198[8] = 2080;
    *(void *)&v198[10] = v22;
    *(_WORD *)&v198[18] = 2080;
    *(void *)&v198[20] = v15;
    *(_WORD *)&v198[28] = 1040;
    *(_DWORD *)&v198[30] = v187;
    *(_WORD *)&v198[34] = 2080;
    v199[0] = v17;
    long long v23 = "DHCP %s [%s]: %s <%.*s>";
    uint32_t v24 = 48;
  }
  else
  {
    if (!v19) {
      goto LABEL_31;
    }
    if (a2 > 8) {
      long long v21 = "<unknown>";
    }
    else {
      long long v21 = off_1000185F0[a2];
    }
    uint64_t v25 = nullsub_1(*a1);
    *(_DWORD *)stat buf = 136315650;
    *(void *)v198 = v21;
    *(_WORD *)&v198[8] = 2080;
    *(void *)&v198[10] = v25;
    *(_WORD *)&v198[18] = 2080;
    *(void *)&v198[20] = v15;
    long long v23 = "DHCP %s [%s]: %s";
    uint32_t v24 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v23, buf, v24);
LABEL_31:
  v173 = sub_10000CBAC(a1[3], 51, (_DWORD *)&v183 + 1, 0);
  v180 = v15;
  v177 = v16;
  if (!v12)
  {
    BOOL v28 = 0;
LABEL_36:
    unsigned int v181 = 0;
    *(void *)&v198[4] = *a1;
    *(void *)&v198[12] = 0;
    int v34 = *(_DWORD *)(v6 + 12);
    *(_DWORD *)stat buf = *(_DWORD *)(v6 + 24);
    *(_DWORD *)v198 = v34;
    int v35 = (unsigned int *)sub_100012C20((uint64_t *)&xmmword_10001D4C8, v15, (unsigned int (*)(uint64_t, void))sub_10000743C, (uint64_t)buf, &v185, &v181);
    unsigned int v32 = v35;
    *(void *)v188 = v35;
    if (v181 == 1) {
      BOOL v28 = 1;
    }
    BOOL v172 = v28;
    if (v35)
    {
      if (qword_10001C1B8 && (uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(qword_10001C1B8, v185.s_addr, 1)) != 0)
      {
        uint64_t v37 = SubnetForAddress;
        if (SubnetDoesAllocate(SubnetForAddress))
        {
          uint64_t v38 = *v32;
          if (!v38) {
            goto LABEL_181;
          }
          __int16 v39 = (const char ***)(*((void *)v32 + 1) + 16);
          while (strcmp("lease", (const char *)*(v39 - 2)))
          {
            v39 += 3;
            if (!--v38) {
              goto LABEL_181;
            }
          }
          if (*((_DWORD *)v39 - 2) && (v111 = **v39) != 0)
          {
            uint64_t v112 = strtol(v111, 0, 0);
            if (v112 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v15 = (char *)v180;
              if (*__error() == 34)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v190 = 136315138;
                  *(void *)v191 = v111;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "S_lease_time_expiry: lease '%s' bad", v190, 0xCu);
                }
                uint64_t v33 = 0;
              }
              else
              {
                uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
              }
              sub_100012BBC((uint64_t *)&xmmword_10001D4C8, (uint64_t)v32);
LABEL_269:
              unsigned int MaxLease = SubnetGetMaxLease(v37);
              unsigned int MinLease = SubnetGetMinLease(v37);
              if (v173)
              {
                unsigned int v147 = bswap32(*(_DWORD *)v173);
                unsigned int __src = v147;
                if (v147 > MaxLease)
                {
                  int v31 = 0;
                  unsigned int v148 = MaxLease;
                  LODWORD(v32) = 0;
LABEL_274:
                  unsigned int __src = v148;
LABEL_305:
                  int v30 = 2;
                  uint64_t v29 = v37;
                  goto LABEL_53;
                }
                if (v147 >= MinLease)
                {
                  int v31 = 0;
                  LODWORD(v32) = 0;
                  goto LABEL_305;
                }
              }
              else
              {
                uint64_t v149 = *(void *)a1[5];
                if (v149 + MinLease < v33)
                {
                  int v31 = 0;
                  LODWORD(v32) = 0;
                  unsigned int v148 = v33 - v149;
                  goto LABEL_274;
                }
              }
              int v31 = 0;
              LODWORD(v32) = 0;
              unsigned int __src = MinLease;
              goto LABEL_305;
            }
            uint64_t v33 = v112;
            sub_100012BBC((uint64_t *)&xmmword_10001D4C8, (uint64_t)v32);
            unint64_t v15 = (char *)v180;
            if (v33 != -1) {
              goto LABEL_269;
            }
            int v30 = 2;
          }
          else
          {
LABEL_181:
            sub_100012BBC((uint64_t *)&xmmword_10001D4C8, (uint64_t)v32);
            int v30 = 2;
            unint64_t v15 = (char *)v180;
          }
          uint64_t v29 = v37;
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v37 = 0;
      }
      sub_1000091D8((uint64_t *)v188);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        v40.in_addr_t s_addr = v185.s_addr;
        int v41 = inet_ntoa(v40);
        *(_DWORD *)v190 = 136315394;
        *(void *)v191 = v15;
        *(_WORD *)&v191[8] = 2080;
        v192 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: removing %s binding for %s", v190, 0x16u);
      }
      *(void *)v188 = 0;
      LODWORD(v32) = 1;
      uint64_t v29 = v37;
    }
    else
    {
      uint64_t v29 = 0;
    }
    int v30 = 0;
    uint64_t v33 = 0;
    int v31 = 1;
    goto LABEL_53;
  }
  *(_OWORD *)&v198[4] = (unint64_t)*a1;
  int v26 = *(_DWORD *)(v6 + 12);
  *(_DWORD *)stat buf = *(_DWORD *)(v6 + 24);
  *(_DWORD *)v198 = v26;
  int v27 = sub_100008E1C(v12, v11, v189[0], (unsigned int (*)(uint64_t, void))sub_10000743C, (uint64_t)buf, &v185, (char **)&v186, v7);
  BOOL v28 = *(_DWORD *)&v198[12] == 1;
  if (!v27) {
    goto LABEL_36;
  }
  BOOL v172 = *(_DWORD *)&v198[12] == 1;
  uint64_t v29 = 0;
  int v30 = 1;
LABEL_34:
  int v31 = 0;
  LODWORD(v32) = 0;
  unsigned int __src = -1;
  uint64_t v33 = -1;
LABEL_53:
  int v42 = v178 - 28;
  switch(a2)
  {
    case 1u:
      int v43 = v31;
      uint64_t v44 = qword_10001D4E0;
      if (!qword_10001D4E0) {
        goto LABEL_191;
      }
      size_t v45 = v189[0];
      while (*(unsigned __int8 *)(v44 + 20) != v12
           || v45 != *(unsigned __int8 *)(v44 + 21)
           || bcmp(v11, (const void *)(v44 + 22), v45))
      {
        uint64_t v44 = *(void *)v44;
        if (!v44) {
          goto LABEL_191;
        }
      }
      hostfree(&qword_10001D4E0, (void *)v44);
LABEL_191:
      if (sub_10000B720(*a1, a1[3]))
      {
        unint64_t v16 = (char *)v177;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "client IPv6-only preferred", buf, 2u);
        }
        in_addr_t s_addr = 0;
        v185.in_addr_t s_addr = 0;
        unsigned int v114 = 3600;
      }
      else
      {
        unint64_t v16 = (char *)v177;
        if (v43)
        {
          if (!v174) {
            goto LABEL_330;
          }
          uint64_t v115 = sub_100009600(*(_DWORD *)(v6 + 24), *a1, a1[5], &v185.s_addr);
          if (!v115
            && (!sub_100008FE4((uint64_t)&xmmword_10001D4C8, *a1, *(_DWORD *)(v6 + 24), (uint64_t *)a1[5], &v185)|| !qword_10001C1B8|| (uint64_t v115 = SubnetListGetSubnetForAddress(qword_10001C1B8, v185.s_addr, 1)) == 0))
          {
            unint64_t v16 = (char *)v177;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)stat buf = 0;
              in_addr v93 = "no ip addresses";
              v94 = buf;
              os_log_type_t v95 = OS_LOG_TYPE_DEFAULT;
              uint32_t v96 = 2;
              goto LABEL_220;
            }
            goto LABEL_330;
          }
          unsigned int v116 = SubnetGetMaxLease(v115);
          unsigned int v117 = SubnetGetMinLease(v115);
          if (v173)
          {
            unsigned int v118 = bswap32(*(_DWORD *)v173);
            unsigned int __src = v118;
            unint64_t v16 = (char *)v177;
            if (v118 <= v116)
            {
              unint64_t v15 = (char *)v180;
              if (v118 < v117) {
                unsigned int __src = v117;
              }
            }
            else
            {
              unsigned int __src = v116;
              unint64_t v15 = (char *)v180;
            }
          }
          else
          {
            unsigned int __src = v117;
            unint64_t v15 = (char *)v180;
            unint64_t v16 = (char *)v177;
          }
        }
        v133 = hostadd((uint64_t)&qword_10001D4E0, (_OWORD *)a1[5], v12, (uint64_t)v11, v189[0], &v185, 0, 0);
        if (!v133) {
          goto LABEL_330;
        }
        unsigned int v114 = __src;
        in_addr_t s_addr = v185.s_addr;
        *((void *)v133 + 39) = __src;
      }
      unsigned int __src = bswap32(v114);
      uint64_t v134 = *a1;
      uint64_t v135 = sub_10000FF48(*a1, s_addr);
      if (v135 == -1) {
        int v136 = sub_10000FED8(v134);
      }
      else {
        int v136 = *(_DWORD *)sub_10000FED0(v134, v135);
      }
      unsigned int v182 = 2;
      uint64_t v137 = sub_1000093AC((uint64_t)buf, v42, v136, 2, (_OWORD *)v6, (uint64_t *)v202);
      if (v137)
      {
        uint64_t v63 = v137;
        in_addr_t v138 = v185.s_addr;
        *(_DWORD *)(v137 + 12) = 0;
        *(_DWORD *)(v137 + 16) = v138;
        if (*(void *)&v189[1]) {
          __strlcpy_chk();
        }
        if (!sub_10000CF40((uint64_t)v202, 51, 4, &__src))
        {
          int v64 = 0;
          int v69 = 3;
          goto LABEL_142;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          long long v139 = sub_10000D160((uint64_t *)v202);
          *(_DWORD *)v190 = 136315138;
          *(void *)v191 = v139;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: couldn't add lease time tag: %s", v190, 0xCu);
        }
      }
      unint64_t v15 = (char *)v180;
      goto LABEL_330;
    case 3u:
      int v171 = v31;
      uint64_t v170 = v29;
      unsigned int v181 = 0;
      v179 = (in_addr_t *)sub_10000CBAC(a1[3], 54, &v181, 0);
      uint64_t v48 = sub_10000CBAC(a1[3], 50, &v181, 0);
      v49 = (unsigned int *)v48;
      if (v48) {
        int v50 = *(_DWORD *)v48;
      }
      else {
        int v50 = 0;
      }
      int v175 = v30;
      uint64_t v65 = *a1;
      uint64_t v66 = sub_10000FF48(*a1, v50);
      if (v66 == -1) {
        unsigned int v67 = sub_10000FED8(v65);
      }
      else {
        unsigned int v67 = *(_DWORD *)sub_10000FED0(v65, v66);
      }
      if (v179)
      {
        uint64_t v70 = qword_10001D4E0;
        if (qword_10001D4E0)
        {
          size_t v71 = v189[0];
          do
          {
            if (*(unsigned __int8 *)(v70 + 20) == v12
              && v71 == *(unsigned __int8 *)(v70 + 21)
              && !bcmp(v11, (const void *)(v70 + 22), v71))
            {
              break;
            }
            uint64_t v70 = *(void *)v70;
          }
          while (v70);
        }
        int v72 = v42;
        int v73 = v67;
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "SELECT", buf, 2u);
        }
        in_addr_t v74 = *v179;
        int v30 = v175;
        if (*v179 != v73)
        {
          if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v80.in_addr_t s_addr = v74;
            v81 = inet_ntoa(v80);
            *(_DWORD *)stat buf = 136315138;
            *(void *)v198 = v81;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "client selected %s", buf, 0xCu);
          }
          if (v70) {
            hostfree(&qword_10001D4E0, (void *)v70);
          }
          if (v175 == 2) {
            sub_1000091D8((uint64_t *)v188);
          }
          if (sub_1000045AC(*a1))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v82.in_addr_t s_addr = *v179;
              BOOL v83 = inet_ntoa(v82);
              uint64_t v84 = nullsub_1(*a1);
              *(_DWORD *)stat buf = 136315394;
              *(void *)v198 = v83;
              *(_WORD *)&v198[8] = 2080;
              *(void *)&v198[10] = v84;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: detected another DHCP server %s, disabling DHCP on %s", buf, 0x16u);
            }
            sub_1000045DC(*a1);
          }
          goto LABEL_329;
        }
        if (v70) {
          char v75 = 0;
        }
        else {
          char v75 = v171;
        }
        if ((v75 & 1) == 0)
        {
          if (v70)
          {
            v185.in_addr_t s_addr = *(_DWORD *)(v70 + 16);
            uint64_t v76 = *(void *)(v70 + 312);
            uint64_t v33 = 0xFFFFFFFFLL;
            if (v76 != 0xFFFFFFFFLL) {
              uint64_t v33 = *(void *)a1[5] + v76;
            }
            unsigned int __src = *(void *)(v70 + 312);
          }
          if (v49)
          {
            in_addr_t v77 = *v49;
            if (*v49 == v185.s_addr)
            {
              if ((v171 & 1) == 0)
              {
                int v30 = v175;
                if (v175 == 2)
                {
                  if (v176 && v187 > 0)
                  {
                    long long v140 = sub_10000B998(v176, v187);
                    long long v141 = *(unsigned int **)v188;
                    sub_100013424(*(unsigned int **)v188, "name", v140, &v183);
                    free(v140);
                  }
                  else
                  {
                    long long v141 = *(unsigned int **)v188;
                  }
                  sub_100009578(v141, v33, &v183);
                }
                int v69 = 4;
                goto LABEL_115;
              }
              if (qword_10001C1B8) {
                uint64_t v170 = SubnetListGetSubnetForAddress(qword_10001C1B8, *v49, 1);
              }
              if (v170)
              {
                sub_1000096F4(v180, v177, v185.s_addr, v176, v187, v33);
                int v69 = 4;
                int v30 = v175;
LABEL_115:
                unsigned int __src = bswap32(__src);
                unsigned int v182 = 5;
                uint64_t v63 = sub_1000093AC((uint64_t)buf, v72, v73, 5, (_OWORD *)v6, (uint64_t *)v202);
                *(in_addr *)(v63 + 16) = v185;
                if (*(void *)&v189[1]) {
                  __strlcpy_chk();
                }
                if (!sub_10000CF40((uint64_t)v202, 51, 4, &__src))
                {
                  int v64 = 0;
                  goto LABEL_142;
                }
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
                  goto LABEL_329;
                }
                char v78 = sub_10000D160((uint64_t *)v202);
                *(_DWORD *)v190 = 136315138;
                *(void *)v191 = v78;
                v79 = "dhcpd: couldn't add lease time tag: %s";
                goto LABEL_162;
              }
              uint64_t v160 = sub_10000B7A4((uint64_t)buf, v42, v73, &v182, "unexpected server failure", (_OWORD *)v6, (uint64_t *)v202);
              if (!v160) {
                goto LABEL_329;
              }
              uint64_t v63 = v160;
              int v30 = v175;
              int v64 = 0;
LABEL_232:
              int v69 = 4;
              goto LABEL_142;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v129.in_addr_t s_addr = v77;
              v130 = inet_ntoa(v129);
              *(_DWORD *)stat buf = 136316418;
              *(void *)v198 = v180;
              *(_WORD *)&v198[8] = 2080;
              *(void *)&v198[10] = v130;
              *(_WORD *)&v198[18] = 1024;
              *(_DWORD *)&v198[20] = LOBYTE(v185.s_addr);
              *(_WORD *)&v198[24] = 1024;
              *(_DWORD *)&v198[26] = BYTE1(v185.s_addr);
              *(_WORD *)&v198[30] = 1024;
              *(_DWORD *)&v198[32] = BYTE2(v185.s_addr);
              LOWORD(v199[0]) = 1024;
              *(_DWORD *)((char *)v199 + 2) = HIBYTE(v185.s_addr);
              in_addr v121 = "dhcpd: host %s sends SELECT with wrong IP address %s, should be %d.%d.%d.%d";
              uint32_t v122 = 46;
              goto LABEL_229;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 136315138;
            *(void *)v198 = v180;
            in_addr v121 = "dhcpd: host %s sends SELECT without Requested IP option";
            uint32_t v122 = 12;
LABEL_229:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v121, buf, v122);
          }
          uint64_t v131 = sub_10000B7A4((uint64_t)buf, v42, v73, &v182, "protocol error in SELECT state", (_OWORD *)v6, (uint64_t *)v202);
          if (!v131) {
            goto LABEL_329;
          }
          uint64_t v63 = v131;
          int v64 = 1;
          goto LABEL_232;
        }
LABEL_329:
        unint64_t v15 = (char *)v180;
        unint64_t v16 = (char *)v177;
        goto LABEL_330;
      }
      if (sub_10000B720(*a1, a1[3]))
      {
        int v72 = v42;
        unsigned int __src = 3600;
        v185.in_addr_t s_addr = 0;
        int v69 = 0;
        int v73 = v67;
        int v30 = v175;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "client IPv6-only preferred", buf, 2u);
          int v69 = 0;
        }
        goto LABEL_115;
      }
      int v73 = v67;
      if (!v49)
      {
        if (!*(_DWORD *)(v6 + 12))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_329;
          }
          *(_DWORD *)stat buf = 136315138;
          *(void *)v198 = v180;
          v79 = "dhcpd: host %s in unknown state";
          int v99 = buf;
          os_log_type_t v100 = OS_LOG_TYPE_DEBUG;
          goto LABEL_163;
        }
        int v72 = v42;
        int v30 = v175;
        if (!byte_10001C0B0) {
          goto LABEL_280;
        }
        v127 = (_DWORD *)a1[4];
        if (!v127 || *v127 == -1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)stat buf = 0;
            uint64_t v128 = "rebind";
            goto LABEL_279;
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)stat buf = 0;
          uint64_t v128 = "renew";
LABEL_279:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v128, buf, 2u);
        }
LABEL_280:
        if (v171)
        {
          if (!v32)
          {
            if (!byte_10001C0B0) {
              goto LABEL_329;
            }
            BOOL v161 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            if (v172)
            {
              if (!v161) {
                goto LABEL_329;
              }
              *(_WORD *)stat buf = 0;
              v79 = "Client binding is not applicable";
            }
            else
            {
              if (!v161) {
                goto LABEL_329;
              }
              *(_WORD *)stat buf = 0;
              v79 = "No binding for client";
            }
            int v99 = buf;
            os_log_type_t v100 = OS_LOG_TYPE_DEBUG;
            uint32_t v101 = 2;
            goto LABEL_173;
          }
          int v69 = 0;
          goto LABEL_283;
        }
        long long v151 = (_DWORD *)a1[4];
        if (!v151 || *v151 == -1 || *(_DWORD *)(v6 + 24))
        {
          unsigned int v152 = *(_DWORD *)(v6 + 12);
          in_addr_t v153 = v185.s_addr;
          uint64_t v132 = v170;
          if (v152 != v185.s_addr)
          {
            if (!byte_10001C0B0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_329;
            }
            *(_DWORD *)stat buf = 67110912;
            *(_DWORD *)v198 = v152;
            *(_WORD *)&v198[4] = 1024;
            *(_DWORD *)&v198[6] = BYTE1(v152);
            *(_WORD *)&v198[10] = 1024;
            *(_DWORD *)&v198[12] = BYTE2(v152);
            *(_WORD *)&v198[16] = 1024;
            *(_DWORD *)&v198[18] = HIBYTE(v152);
            *(_WORD *)&v198[22] = 1024;
            *(_DWORD *)&v198[24] = v153;
            *(_WORD *)&v198[28] = 1024;
            *(_DWORD *)&v198[30] = BYTE1(v153);
            *(_WORD *)&v198[34] = 1024;
            LODWORD(v199[0]) = BYTE2(v153);
            WORD2(v199[0]) = 1024;
            *(_DWORD *)((char *)v199 + 6) = HIBYTE(v153);
            v79 = "Incorrect ciaddr %d.%d.%d.%d should be %d.%d.%d.%d";
            int v99 = buf;
            os_log_type_t v100 = OS_LOG_TYPE_DEBUG;
            uint32_t v101 = 50;
            goto LABEL_173;
          }
          int v69 = 8;
LABEL_291:
          if (v30 == 1)
          {
            unsigned int __src = -1;
            goto LABEL_115;
          }
          if (v176 && v187 >= 1)
          {
            long long v154 = sub_10000B998(v176, v187);
            sub_100013424(*(unsigned int **)v188, "name", v154, &v183);
            free(v154);
            uint64_t v132 = v170;
          }
          uint64_t v155 = v132;
          unsigned int v156 = SubnetGetMaxLease(v132);
          unsigned int v157 = SubnetGetMaxLease(v155);
          unsigned int v158 = v157;
          if (v173)
          {
            unsigned int v159 = bswap32(*(_DWORD *)v173);
            unsigned int __src = v159;
            if (v159 > v156)
            {
              unsigned int __src = v156;
              unsigned int v159 = v156;
              goto LABEL_318;
            }
            if (v159 < v157)
            {
              unsigned int __src = v157;
              unsigned int v159 = v157;
            }
          }
          else
          {
            unsigned int __src = v157;
            BOOL v162 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            unsigned int v159 = v158;
            if (v162)
            {
              v163.in_addr_t s_addr = v185.s_addr;
              v164 = inet_ntoa(v163);
              v165 = off_100018638[v69];
              *(_DWORD *)stat buf = 136315394;
              *(void *)v198 = v164;
              *(_WORD *)&v198[8] = 2080;
              *(void *)&v198[10] = v165;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "dhcpd: %s lease extended to %s client", buf, 0x16u);
              unsigned int v159 = __src;
            }
          }
          if (v159 == -1)
          {
            uint64_t v166 = -1;
            goto LABEL_320;
          }
LABEL_318:
          uint64_t v166 = *(void *)a1[5] + v159;
LABEL_320:
          sub_100009578(*(unsigned int **)v188, v166, &v183);
          goto LABEL_115;
        }
        in_addr_t v167 = *(_DWORD *)(v6 + 12);
        if (v167 != v185.s_addr)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v168.in_addr_t s_addr = v167;
            v169 = inet_ntoa(v168);
            *(_DWORD *)stat buf = 136316162;
            *(void *)v198 = v169;
            *(_WORD *)&v198[8] = 1024;
            *(_DWORD *)&v198[10] = LOBYTE(v185.s_addr);
            *(_WORD *)&v198[14] = 1024;
            *(_DWORD *)&v198[16] = BYTE1(v185.s_addr);
            *(_WORD *)&v198[20] = 1024;
            *(_DWORD *)&v198[22] = BYTE2(v185.s_addr);
            *(_WORD *)&v198[26] = 1024;
            *(_DWORD *)&v198[28] = HIBYTE(v185.s_addr);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: client ciaddr=%s should use %d.%d.%d.%d", buf, 0x24u);
            in_addr_t v167 = *(_DWORD *)(v6 + 12);
          }
          v185.in_addr_t s_addr = v167;
        }
        int v69 = 7;
LABEL_234:
        uint64_t v132 = v170;
        goto LABEL_291;
      }
      if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "init-reboot", buf, 2u);
      }
      int v30 = v175;
      if (v171)
      {
        if (!v32)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_329;
          }
          v143.in_addr_t s_addr = *v49;
          long long v144 = inet_ntoa(v143);
          *(_DWORD *)stat buf = 136315394;
          *(void *)v198 = v180;
          *(_WORD *)&v198[8] = 2080;
          *(void *)&v198[10] = v144;
          v79 = "dhcpd: INIT-REBOOT host %s binding for %s with another server";
          int v99 = buf;
          os_log_type_t v100 = OS_LOG_TYPE_DEBUG;
          uint32_t v101 = 22;
          goto LABEL_173;
        }
        int v72 = v42;
        int v69 = 6;
LABEL_283:
        long long v142 = "requested address no longer available";
        goto LABEL_284;
      }
      int v72 = v42;
      int v69 = 6;
      if (*v49 == v185.s_addr) {
        goto LABEL_234;
      }
      long long v142 = "requested address incorrect";
LABEL_284:
      uint64_t v150 = sub_10000B7A4((uint64_t)buf, v72, v73, &v182, v142, (_OWORD *)v6, (uint64_t *)v202);
      if (!v150) {
        goto LABEL_329;
      }
      uint64_t v63 = v150;
      int v64 = 1;
LABEL_142:
      if (byte_10001C0B0)
      {
LABEL_143:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          int v90 = off_100018638[v69];
          *(_DWORD *)v190 = 136315138;
          *(void *)v191 = v90;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "state=%s", v190, 0xCu);
        }
      }
LABEL_145:
      if (v30 == 2
        && v183
        && !sub_1000129D8((unsigned int **)&xmmword_10001D4C8, (const std::__fs::filesystem::path *)"/var/db/dhcpd_leases"))
      {
        goto LABEL_329;
      }
      unsigned int v91 = bswap32(*(unsigned __int16 *)(v6 + 8));
      int v92 = dword_10001C0AC;
      if (dword_10001C0AC <= HIWORD(v91))
      {
        if (!v63) {
          goto LABEL_329;
        }
        if (v182 == 5 || v182 == 2)
        {
          unsigned int v181 = 0;
          uint64_t v97 = sub_10000CBAC(a1[3], 55, &v181, 0);
          if (!*(void *)&v189[1])
          {
            *(_OWORD *)(v63 + 220) = 0u;
            *(_OWORD *)(v63 + 204) = 0u;
            *(_OWORD *)(v63 + 188) = 0u;
            *(_OWORD *)(v63 + 172) = 0u;
            *(_OWORD *)(v63 + 156) = 0u;
            *(_OWORD *)(v63 + 140) = 0u;
            *(_OWORD *)(v63 + 124) = 0u;
            *(_OWORD *)(v63 + 108) = 0u;
          }
          __strlcpy_chk();
          if (v97) {
            sub_1000077FC((char *)v186, v185.s_addr, *a1, (uint64_t *)v202, v97, v181);
          }
          if (sub_10000CF40((uint64_t)v202, 255, 0, 0))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              uint64_t v98 = sub_10000D160((uint64_t *)v202);
              *(_DWORD *)v190 = 136315138;
              *(void *)v191 = v98;
              v79 = "couldn't add end tag: %s";
LABEL_162:
              int v99 = v190;
              os_log_type_t v100 = OS_LOG_TYPE_INFO;
LABEL_163:
              uint32_t v101 = 12;
LABEL_173:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v100, v79, v99, v101);
              goto LABEL_329;
            }
            goto LABEL_329;
          }
        }
        unsigned int v102 = sub_10000D108((uint64_t)v202) + 240;
        if (v102 <= 0x12C) {
          unsigned int v103 = 300;
        }
        else {
          unsigned int v103 = v102;
        }
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          if (v182 > 8) {
            uint64_t v104 = "<unknown>";
          }
          else {
            uint64_t v104 = off_1000185F0[v182];
          }
          *(_DWORD *)v190 = 136315394;
          *(void *)v191 = v104;
          *(_WORD *)&v191[8] = 1024;
          LODWORD(v192) = v103;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Sending: DHCP %s (size %d)", v190, 0x12u);
        }
        if (!sub_100007494(*a1, v63, v103, v64, &v185.s_addr)) {
          goto LABEL_329;
        }
        in_addr v119 = v186;
        unint64_t v15 = (char *)v180;
        unint64_t v16 = (char *)v177;
        if (!v186 && *(void *)v188)
        {
          v120 = (void *)sub_10000BA10(*(unsigned int **)v188, "name");
          v186 = v120;
          if (v120)
          {
            in_addr v119 = strdup((const char *)v120);
            v186 = v119;
          }
          else
          {
            in_addr v119 = 0;
          }
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          if (v182 > 8) {
            int v123 = "<unknown>";
          }
          else {
            int v123 = off_1000185F0[v182];
          }
          if (v119) {
            unint64_t v124 = (const char *)v119;
          }
          else {
            unint64_t v124 = "<no hostname>";
          }
          v125.in_addr_t s_addr = v185.s_addr;
          uint64_t v126 = inet_ntoa(v125);
          *(_DWORD *)v190 = 136315906;
          *(void *)v191 = v123;
          *(_WORD *)&v191[8] = 2080;
          v192 = (void *)v124;
          __int16 v193 = 2080;
          v194 = v126;
          __int16 v195 = 1024;
          unsigned int v196 = v103;
          in_addr v93 = "%s sent %s %s pktsize %d";
          v94 = v190;
          os_log_type_t v95 = OS_LOG_TYPE_INFO;
          uint32_t v96 = 38;
          goto LABEL_220;
        }
      }
      else
      {
        unint64_t v15 = (char *)v180;
        unint64_t v16 = (char *)v177;
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v190 = 67109376;
          *(_DWORD *)v191 = HIWORD(v91);
          *(_WORD *)&v191[4] = 1024;
          *(_DWORD *)&v191[6] = v92;
          in_addr v93 = "rp->dp_secs %d < threshold %d";
          v94 = v190;
          os_log_type_t v95 = OS_LOG_TYPE_DEBUG;
          uint32_t v96 = 14;
LABEL_220:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v95, v93, v94, v96);
        }
      }
LABEL_330:
      if (v186) {
        free(v186);
      }
      if (*(void *)&v189[1]) {
        free(*(void **)&v189[1]);
      }
      if (v15 != __str) {
        free(v15);
      }
      if (v16 && v16 != v15 && v16 != v200) {
        free(v16);
      }
      return;
    case 4u:
      *(_DWORD *)v190 = 0;
      uint64_t v51 = sub_10000CBAC(a1[3], 54, v190, 0);
      BOOL v52 = (int *)sub_10000CBAC(a1[3], 50, v190, 0);
      if (!v51) {
        goto LABEL_329;
      }
      int v53 = (in_addr_t *)v52;
      if (!v52) {
        goto LABEL_329;
      }
      uint64_t v54 = *a1;
      uint64_t v55 = sub_10000FF48(*a1, *v52);
      if (v55 == -1) {
        unsigned int v56 = sub_10000FED8(v54);
      }
      else {
        unsigned int v56 = *(_DWORD *)sub_10000FED0(v54, v55);
      }
      if (*(_DWORD *)v51 == v56)
      {
        if (v30 == 2 && v185.s_addr == *v53)
        {
          v85 = *(unsigned int **)v188;
          sub_10001353C(*(uint64_t *)v188, "identifier", &v183);
          sub_100009578(v85, *(void *)a1[5] + 600, &v183);
          sub_100013424(v85, "declined", v180, &v183);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v86.in_addr_t s_addr = v185.s_addr;
            v87 = inet_ntoa(v86);
            *(_DWORD *)stat buf = 136315394;
            *(void *)v198 = v87;
            *(_WORD *)&v198[8] = 2080;
            *(void *)&v198[10] = v180;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: IP %s declined by %s", buf, 0x16u);
          }
          if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v88.in_addr_t s_addr = v185.s_addr;
            int v89 = inet_ntoa(v88);
            *(_DWORD *)stat buf = 136315138;
            *(void *)v198 = v89;
            in_addr v46 = "marking host %s as declined";
            uint32_t v47 = 12;
            goto LABEL_64;
          }
        }
        goto LABEL_141;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_329;
      }
      v105.in_addr_t s_addr = *v53;
      int v106 = inet_ntoa(v105);
      int v107 = *v51;
      int v108 = v51[1];
      int v109 = v51[2];
      int v110 = v51[3];
      *(_DWORD *)stat buf = 136316418;
      *(void *)v198 = v180;
      *(_WORD *)&v198[8] = 2080;
      *(void *)&v198[10] = v106;
      *(_WORD *)&v198[18] = 1024;
      *(_DWORD *)&v198[20] = v107;
      *(_WORD *)&v198[24] = 1024;
      *(_DWORD *)&v198[26] = v108;
      *(_WORD *)&v198[30] = 1024;
      *(_DWORD *)&v198[32] = v109;
      LOWORD(v199[0]) = 1024;
      *(_DWORD *)((char *)v199 + 2) = v110;
      v79 = "dhcpd: host %s declines IP %s from server %d.%d.%d.%d";
      int v99 = buf;
      os_log_type_t v100 = OS_LOG_TYPE_DEBUG;
      uint32_t v101 = 46;
      goto LABEL_173;
    case 7u:
      if (v30 == 2)
      {
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v57.in_addr_t s_addr = v185.s_addr;
          uint32_t v58 = inet_ntoa(v57);
          *(_DWORD *)stat buf = 136315138;
          *(void *)v198 = v58;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s released by client, setting expiration to now", buf, 0xCu);
        }
        in_addr v59 = *(unsigned int **)v188;
        snprintf((char *)buf, 0x20uLL, "0x%lx", *(void *)a1[5]);
        sub_100013424(v59, "lease", (const char *)buf, &v183);
      }
      goto LABEL_141;
    case 8u:
      v185.in_addr_t s_addr = *(_DWORD *)(v6 + 12);
      uint64_t v60 = *a1;
      uint64_t v61 = sub_10000FF48(*a1, v185.s_addr);
      if (v61 == -1) {
        int v62 = sub_10000FED8(v60);
      }
      else {
        int v62 = *(_DWORD *)sub_10000FED0(v60, v61);
      }
      unsigned int v182 = 5;
      uint64_t v68 = sub_1000093AC((uint64_t)buf, v42, v62, 5, (_OWORD *)v6, (uint64_t *)v202);
      if (!v68) {
        goto LABEL_329;
      }
      uint64_t v63 = v68;
      int v64 = 0;
      int v69 = 0;
      goto LABEL_142;
    default:
      if (!byte_10001C0B0)
      {
        uint64_t v63 = 0;
        int v64 = 0;
        goto LABEL_145;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v63 = 0;
        int v69 = 0;
        int v64 = 0;
        goto LABEL_143;
      }
      *(_WORD *)stat buf = 0;
      in_addr v46 = "unknown message ignored";
      uint32_t v47 = 2;
LABEL_64:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v46, buf, v47);
LABEL_141:
      int v64 = 0;
      int v69 = 0;
      uint64_t v63 = 0;
      goto LABEL_142;
  }
}

uint64_t sub_10000B720(uint64_t a1, uint64_t a2)
{
  if (!sub_1000045C4(a1)) {
    return 0;
  }
  int v7 = 0;
  int v3 = sub_10000CBAC(a2, 55, &v7, 0);
  uint64_t v4 = 0;
  if (v3)
  {
    int v5 = v7;
    if (v7 >= 1)
    {
      while (*v3 != 108)
      {
        ++v3;
        if (!--v5) {
          return 0;
        }
      }
      return 1;
    }
  }
  return v4;
}

uint64_t sub_10000B7A4(uint64_t a1, int a2, int a3, _DWORD *a4, char *a5, _OWORD *a6, uint64_t *a7)
{
  if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315138;
    uint64_t v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "sending a NAK: '%s'", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v14 = sub_1000093AC(a1, a2, a3, 6, a6, a7);
  uint64_t v15 = v14;
  if (v14)
  {
    *(_DWORD *)(v14 + 12) = 0;
    *(_DWORD *)(v14 + 16) = 0;
    if (a5 && (int v16 = strlen(a5), sub_10000CF40((uint64_t)a7, 56, v16, a5)))
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      long long v17 = sub_10000D160(a7);
      int v21 = 136315138;
      uint64_t v22 = (void *)v17;
      int v18 = "dhcpd: couldn't add NAK message type: %s";
    }
    else
    {
      if (!sub_10000CF40((uint64_t)a7, 255, 0, 0))
      {
        *a4 = 6;
        return v15;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      BOOL v19 = sub_10000D160(a7);
      int v21 = 136315138;
      uint64_t v22 = (void *)v19;
      int v18 = "dhcpd: couldn't add end tag: %s";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0xCu);
    return 0;
  }
  return v15;
}

unsigned char *sub_10000B998(uint64_t a1, int a2)
{
  if (a2 < 1) {
    return 0;
  }
  uint64_t result = malloc_type_malloc((a2 + 1), 0xF5130B02uLL);
  uint64_t v5 = 0;
  do
  {
    int v6 = *(unsigned __int8 *)(a1 + v5);
    if (v6 == 10 || v6 == 0) {
      LOBYTE(v6) = 46;
    }
    result[v5++] = v6;
  }
  while (a2 != v5);
  result[a2] = 0;
  return result;
}

uint64_t sub_10000BA10(unsigned int *a1, char *__s1)
{
  uint64_t v2 = *a1;
  if (!v2) {
    return 0;
  }
  for (uint64_t i = *((void *)a1 + 1) + 16; strcmp(__s1, *(const char **)(i - 16)); i += 24)
  {
    if (!--v2) {
      return 0;
    }
  }
  if (*(_DWORD *)(i - 8)) {
    return **(void **)i;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000BA80(void *a1, in_addr_t a2)
{
  if (sub_100008F04(a2, 0, 0) || sub_100012DDC((uint64_t *)&xmmword_10001D4C8, a2)) {
    return 1;
  }
  uint64_t v6 = qword_10001D4E0;
  if (qword_10001D4E0)
  {
    while (*(_DWORD *)(v6 + 16) != a2)
    {
      uint64_t v6 = *(void *)v6;
      if (!v6) {
        return 0;
      }
    }
    unint64_t v7 = *a1 - *(void *)(v6 + 296);
    if (v7 <= 0x3B)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v8.in_addr_t s_addr = a2;
        int v9 = 136315394;
        long long v10 = inet_ntoa(v8);
        __int16 v11 = 1024;
        int v12 = 60 - v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "dhcpd: %s will remain pending %d secs", (uint8_t *)&v9, 0x12u);
      }
      return 1;
    }
    hostfree(&qword_10001D4E0, (void *)v6);
  }
  return 0;
}

uint64_t sub_10000BBC8(int a1)
{
  if (a1 < 0) {
    return 0;
  }
  else {
    return close(a1);
  }
}

uint64_t sub_10000BBD8()
{
  snprintf(__str, 0x100uLL, "/dev/bpf%d", 0);
  uint64_t v0 = open(__str, 2, 0);
  if ((v0 & 0x80000000) != 0)
  {
    if (*__error() != 16) {
      return v0;
    }
    for (int i = 1; ; ++i)
    {
      snprintf(__str, 0x100uLL, "/dev/bpf%d", i);
      uint64_t v0 = open(__str, 2, 0);
      if ((v0 & 0x80000000) == 0) {
        break;
      }
      if (*__error() != 16) {
        return v0;
      }
    }
  }
  int v3 = 900;
  ioctl(v0, 0x8004427BuLL, &v3);
  return v0;
}

uint64_t sub_10000BCE4(int a1)
{
  memset(v3, 0, sizeof(v3));
  __strlcpy_chk();
  return ioctl(a1, 0x8020426CuLL, v3);
}

uint64_t sub_10000BD68(int a1)
{
  uint64_t v3 = 6;
  v2[1] = &v3;
  v2[0] = 1;
  return ioctl(a1, 0x80104267uLL, v2);
}

ssize_t sub_10000BDDC(int a1, const void *a2, int a3)
{
  return write(a1, a2, a3);
}

void sub_10000BDF8(const void **a1)
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

CFPropertyListRef sub_10000BE30(const char *a1)
{
  memset(&v11, 0, sizeof(v11));
  if (stat(a1, &v11) < 0) {
    return 0;
  }
  off_t st_size = v11.st_size;
  if (!v11.st_size) {
    return 0;
  }
  uint64_t v3 = malloc_type_malloc(v11.st_size, 0xE2EAFFC1uLL);
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

uint64_t sub_10000BF30(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
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

uint64_t sub_10000BFB8(const __CFArray *a1, uint64_t a2, unsigned int *a3, _DWORD *a4)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFIndex v9 = Count;
  signed int v10 = 8 * Count;
  if (a2)
  {
    if ((int)*a3 < v10) {
      return 0;
    }
    int v12 = (UInt8 *)(a2 + v10);
  }
  else
  {
    int v12 = 0;
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
        int v17 = sub_10000BF30(ValueAtIndex, v12, v16, 0);
        *(void *)(a2 + 8 * v13) = v12;
        v12 += v17;
      }
      else
      {
        int v17 = sub_10000BF30(ValueAtIndex, v12, 0, 0);
      }
      v10 += v17;
    }
    while (v9 != ++v13);
  }
  *a3 = (v10 + 7) & 0xFFFFFFF8;
  *a4 = v9;
  return 1;
}

void *sub_10000C0D0(const __CFArray *a1, _DWORD *a2)
{
  size_t size = 0;
  *a2 = 0;
  if (!sub_10000BFB8(a1, 0, (unsigned int *)&size, (_DWORD *)&size + 1)) {
    return 0;
  }
  uint64_t v4 = malloc_type_malloc((int)size, 0xA7A2F498uLL);
  if (!sub_10000BFB8(a1, (uint64_t)v4, (unsigned int *)&size, (_DWORD *)&size + 1))
  {
    free(v4);
    return 0;
  }
  *a2 = HIDWORD(size);
  return v4;
}

uint64_t sub_10000C168(const __CFString *a1, in_addr *a2)
{
  a2->in_addr_t s_addr = 0;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64, 0x600u);
  if (result) {
    return inet_aton(buffer, a2) == 1;
  }
  return result;
}

uint64_t sub_10000C21C(const __CFString *a1, _DWORD *a2)
{
  sub_10000BF30(a1, (UInt8 *)__str, 64, 0);
  unint64_t v3 = strtoul(__str, 0, 0);
  if (v3 == -1) {
    return 0;
  }
  int v4 = v3;
  if (*__error() == 34) {
    return 0;
  }
  *a2 = v4;
  return 1;
}

uint64_t sub_10000C2BC(const __CFString *a1, _DWORD *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1)
  {
    CFBooleanGetTypeID();
    CFNumberGetTypeID();
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return (sub_10000C21C(a1, a2) & 1) != 0;
  }
  CFTypeID v6 = CFBooleanGetTypeID();
  if (CFGetTypeID(a1) != v6)
  {
    CFTypeID v7 = CFNumberGetTypeID();
    if (CFGetTypeID(a1) == v7)
    {
      uint64_t result = CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, a2);
      if (!result) {
        return result;
      }
      return 1;
    }
    return 0;
  }
  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1;
}

UInt8 *sub_10000C380(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  CFIndex maxBufLen = 0;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0, 0, &maxBufLen);
  if (!maxBufLen) {
    return 0;
  }
  CFTypeID v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x10A3B885uLL);
  v10.CFIndex location = location;
  v10.CFIndex length = length;
  CFStringGetBytes(a1, v10, a3, 0, 0, v7, maxBufLen, &maxBufLen);
  v7[maxBufLen] = 0;
  return v7;
}

UInt8 *sub_10000C438(const __CFString *a1, CFStringEncoding a2)
{
  v4.CFIndex length = CFStringGetLength(a1);
  v4.CFIndex location = 0;

  return sub_10000C380(a1, v4, a2);
}

CFDataRef sub_10000C480(CFStringRef theString)
{
  return CFStringCreateExternalRepresentation(0, theString, 0x8000100u, 0);
}

char *sub_10000C498(unsigned int a1)
{
  if (a1 <= 0xE) {
    return (char *)&unk_100018680 + 24 * a1;
  }
  else {
    return 0;
  }
}

void sub_10000C4B4(CFMutableStringRef theString, int a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4 = a4;
  switch(a2)
  {
    case 1:
      CFStringAppendFormat(theString, 0, @"\n");
      sub_100010784(theString, (uint64_t)a3, v4);
      return;
    case 2:
      if (*a3) {
        int v8 = "TRUE";
      }
      else {
        int v8 = "FALSE";
      }
      CFStringAppendFormat(theString, 0, @"%s", v8);
      return;
    case 3:
      uint64_t v7 = *a3;
      goto LABEL_12;
    case 4:
      uint64_t v7 = bswap32(*(unsigned __int16 *)a3) >> 16;
      goto LABEL_12;
    case 5:
    case 6:
      uint64_t v7 = bswap32(*(_DWORD *)a3);
LABEL_12:
      CFStringAppendFormat(theString, 0, @"0x%x", v7);
      return;
    case 9:
      CFStringAppendFormat(theString, 0, @"%.*s", a4, a3);
      return;
    case 10:
      CFStringAppendFormat(theString, 0, @"%d.%d.%d.%d", *a3, a3[1], a3[2], a3[3]);
      return;
    case 13:
      int v20 = 0;
      CFIndex v9 = (unsigned __int8 *)sub_10000DD7C((uint64_t)a3, a4, &v20);
      CFStringAppendFormat(theString, 0, @"{");
      if (!v9) {
        goto LABEL_31;
      }
      if (v20 >= 1)
      {
        for (uint64_t i = 0; i < v20; CFStringAppendFormat(theString, 0, @"%s%s", v11, *(void *)&v9[8 * i++]))
        {
          if (i) {
            CFRange v11 = ", ";
          }
          else {
            CFRange v11 = "";
          }
        }
      }
      break;
    case 14:
      int v19 = 0;
      CFIndex v9 = (unsigned __int8 *)sub_10000E6E4(a3, a4, &v19);
      CFStringAppendFormat(theString, 0, @"{");
      if (!v9) {
        goto LABEL_31;
      }
      if (v19 >= 1)
      {
        int v12 = 0;
        CFIndex v13 = v9;
        do
        {
          if (v12) {
            uint64_t v14 = "; ";
          }
          else {
            uint64_t v14 = "";
          }
          CFStringAppendFormat(theString, 0, @"%s%d.%d.%d.%d/%d, %d.%d.%d.%d", v14, *v13, v13[1], v13[2], v13[3], *((unsigned int *)v13 + 1), v13[8], v13[9], v13[10], v13[11]);
          ++v12;
          v13 += 12;
        }
        while (v12 < v19);
      }
      break;
    default:
      return;
  }
  free(v9);
LABEL_31:
  CFStringAppendFormat(theString, 0, @"}", v15, v16, v17, v18);
}

void sub_10000C7A4(CFMutableStringRef theString, unsigned int a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4 = a3;
  if (a2 <= 0xE && (unsigned int v6 = *((_DWORD *)&unk_100018680 + 6 * a2 + 1)) != 0)
  {
    if (v6 <= 0xE)
    {
      uint64_t v7 = *((int *)&unk_100018680 + 6 * v6);
      int v8 = (int)a4 / (int)v7;
      CFStringAppendFormat(theString, 0, @"{");
      if (v8 >= 1)
      {
        for (int i = 0; i != v8; ++i)
        {
          if (i) {
            CFStringAppendFormat(theString, 0, @", ");
          }
          sub_10000C4B4(theString, v6, v4, v7);
          v4 += v7;
        }
      }
      CFStringAppendFormat(theString, 0, @"}");
    }
  }
  else
  {
    sub_10000C4B4(theString, a2, a3, a4);
  }
}

BOOL sub_10000C8E0(CFMutableStringRef theString, unsigned __int8 *a2)
{
  uint64_t v3 = *a2;
  unsigned int v4 = *((_DWORD *)&unk_1000187E8 + 4 * v3);
  if (v4 >= 0xF)
  {
    CFStringAppendFormat(theString, 0, @"unknown type %d\n", *((unsigned int *)&unk_1000187E8 + 4 * v3));
  }
  else
  {
    uint64_t v5 = a2[1];
    unsigned int v6 = a2 + 2;
    CFStringAppendFormat(theString, 0, @"%s (%s): ", *((void *)&unk_1000187E8 + 2 * v3 + 1), *((void *)&unk_100018680 + 3 * v4 + 1));
    if (v3 == 53)
    {
      unint64_t v7 = *v6;
      if (v7 > 8) {
        int v8 = "<unknown>";
      }
      else {
        int v8 = (&off_1000197E8)[v7];
      }
      CFStringAppendFormat(theString, 0, @"%s ", v8);
    }
    sub_10000C7A4(theString, v4, v6, v5);
    CFStringAppendFormat(theString, 0, @"\n", v10);
  }
  return v4 < 0xF;
}

char *sub_10000C9F4(unsigned int a1)
{
  if (a1 <= 0xFF) {
    return (char *)&unk_1000187E8 + 16 * a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000CA0C(char *__s2)
{
  uint64_t v2 = 0;
  for (int i = (const char **)&off_1000187F0; strcmp(*i, __s2); i += 2)
  {
    if (++v2 == 256)
    {
      if (!strncmp(__s2, "option_", 7uLL)) {
        unsigned int v4 = __s2 + 7;
      }
      else {
        unsigned int v4 = __s2;
      }
      unsigned int v5 = strtoul(v4, 0, 10);
      if (v5 >= 0x101uLL) {
        return 0xFFFFFFFFLL;
      }
      else {
        return v5;
      }
    }
  }
  return v2;
}

uint64_t sub_10000CAAC(void *a1, unsigned __int8 *a2, int a3, char *a4)
{
  if (a4) {
    *a4 = 0;
  }
  sub_1000102B0(a1);
  if (a3 < 1)
  {
    int v8 = 0;
    if ((a3 & 0x80000000) == 0) {
      return 1;
    }
    goto LABEL_16;
  }
  while (1)
  {
    int v8 = *a2;
    if (*a2) {
      break;
    }
    ++a2;
    --a3;
LABEL_9:
    if (a3 <= 0) {
      goto LABEL_14;
    }
  }
  if (v8 != 255)
  {
    if (a3 < 2) {
      goto LABEL_16;
    }
    uint64_t v9 = a2[1];
    sub_1000103B0((uint64_t)a1, (uint64_t)a2);
    a3 -= v9 + 2;
    a2 += v9 + 2;
    goto LABEL_9;
  }
  sub_1000103B0((uint64_t)a1, (uint64_t)a2);
  --a3;
LABEL_14:
  if ((a3 & 0x80000000) == 0) {
    return 1;
  }
LABEL_16:
  if (a4) {
    snprintf(a4, 0x100uLL, "parse failed near tag %d", v8);
  }
  sub_1000102B8((uint64_t)a1);
  return 0;
}

unsigned __int8 *sub_10000CBAC(uint64_t a1, int a2, _DWORD *a3, int *a4)
{
  uint64_t result = 0;
  if (a2 && a2 != 255)
  {
    if (a4) {
      int v9 = *a4;
    }
    else {
      int v9 = 0;
    }
    while (1)
    {
      if (v9 >= (int)sub_1000102E8(a1)) {
        return 0;
      }
      uint64_t v10 = (unsigned __int8 *)sub_100010304(a1, v9);
      if (*v10 == a2) {
        break;
      }
      ++v9;
    }
    if (a3) {
      *a3 = v10[1];
    }
    if (a4) {
      *a4 = v9 + 1;
    }
    return v10 + 2;
  }
  return result;
}

uint64_t sub_10000CC5C(void *a1, uint64_t a2, unsigned int a3, char *a4)
{
  sub_1000102B0(a1);
  if (a4)
  {
    *a4 = 0;
    if (a3 <= 0xEF)
    {
      snprintf(a4, 0x100uLL, "packet is too short: %d < %d", a3, 240);
      return 0;
    }
    if (*(_DWORD *)(a2 + 236) != 1666417251)
    {
      uint64_t result = 0;
      strcpy(a4, "missing magic number");
      return result;
    }
  }
  else if (a3 < 0xF0 || *(_DWORD *)(a2 + 236) != 1666417251)
  {
    return 0;
  }
  uint64_t result = sub_10000CAAC(a1, (unsigned __int8 *)(a2 + 240), a3 - 240, a4);
  if (result)
  {
    int v12 = 0;
    int v9 = sub_10000CBAC((uint64_t)a1, 52, &v12, 0);
    if (v9 && v12 == 1)
    {
      uint64_t v10 = v9;
      v11[0] = 0;
      v11[1] = 0;
      sub_1000102B0(v11);
      if ((*v10 | 2) == 3 && sub_10000CAAC(v11, (unsigned __int8 *)(a2 + 108), 128, 0))
      {
        sub_10001052C((uint64_t)a1, (uint64_t)v11);
        sub_1000102B8((uint64_t)v11);
      }
      if ((*v10 & 0xFE) == 2)
      {
        if (sub_10000CAAC(v11, (unsigned __int8 *)(a2 + 44), 64, 0))
        {
          sub_10001052C((uint64_t)a1, (uint64_t)v11);
          sub_1000102B8((uint64_t)v11);
        }
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_10000CDF0(__CFString *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000102E8(a2);
  CFStringAppendFormat(a1, 0, @"Options count is %d\n", v4);
  uint64_t result = sub_1000102E8(a2);
  if ((int)result >= 1)
  {
    int v6 = 0;
    do
    {
      unint64_t v7 = (unsigned __int8 *)sub_100010304(a2, v6);
      if (!sub_10000C8E0(a1, v7)) {
        CFStringAppendFormat(a1, 0, @"undefined tag %d len %d\n", *v7, v7[1]);
      }
      ++v6;
      uint64_t result = sub_1000102E8(a2);
    }
    while (v6 < (int)result);
  }
  return result;
}

double sub_10000CEB8(uint64_t a1, void *a2, int a3, int a4)
{
  bzero(a2, a3);
  double result = 0.0;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)a1 = 287454020;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 296) = a4;
  return result;
}

double sub_10000CF38(uint64_t a1, void *a2, int a3)
{
  return sub_10000CEB8(a1, a2, a3, 1);
}

uint64_t sub_10000CF40(uint64_t a1, int a2, int a3, void *__src)
{
  *(unsigned char *)(a1 + 40) = 0;
  unsigned int v5 = (char *)(a1 + 40);
  if (a3 >= 256)
  {
    snprintf(v5, 0x100uLL, "tag %d option %d > %d", __src);
    return 1;
  }
  if (*(void *)a1 != 287454020 || *(_DWORD *)(a1 + 24))
  {
    __strlcpy_chk();
    return 1;
  }
  if (a2)
  {
    if (a2 == 255)
    {
      uint64_t v7 = *(int *)(a1 + 20);
      if ((int)v7 >= *(_DWORD *)(a1 + 16))
      {
        snprintf(v5, 0x100uLL, "can't add end tag %d > %d", __src);
        return 1;
      }
      *(unsigned char *)(*(void *)(a1 + 8) + v7) = -1;
      ++*(_DWORD *)(a1 + 20);
      *(_DWORD *)(a1 + 24) = 1;
      goto LABEL_22;
    }
    int v10 = a3 + 2;
    uint64_t v11 = *(int *)(a1 + 20);
    if (a3 + 2 + (int)v11 + *(_DWORD *)(a1 + 296) > *(_DWORD *)(a1 + 16))
    {
      snprintf(v5, 0x100uLL, "can't add tag %d (%d > %d)", __src);
      return 2;
    }
    *(unsigned char *)(*(void *)(a1 + 8) + v11) = a2;
    *(unsigned char *)(*(int *)(a1 + 20) + *(void *)(a1 + 8) + 1) = a3;
    if (a3) {
      memmove((void *)(*(int *)(a1 + 20) + *(void *)(a1 + 8) + 2), __src, a3);
    }
    int v12 = *(_DWORD *)(a1 + 28);
    int v13 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 28) = v13;
    *(_DWORD *)(a1 + 32) = v12;
    int v9 = v10 + v13;
  }
  else
  {
    uint64_t v8 = *(int *)(a1 + 20);
    if (*(_DWORD *)(a1 + 296) + (int)v8 >= *(_DWORD *)(a1 + 16))
    {
      snprintf(v5, 0x100uLL, "can't add pad tag %d > %d", __src);
      return 2;
    }
    *(unsigned char *)(*(void *)(a1 + 8) + v8) = 0;
    int v9 = *(_DWORD *)(a1 + 20) + 1;
  }
  *(_DWORD *)(a1 + 20) = v9;
LABEL_22:
  uint64_t result = 0;
  ++*(_DWORD *)(a1 + 36);
  return result;
}

uint64_t sub_10000D108(uint64_t result)
{
  if (result)
  {
    if (*(void *)result == 287454020) {
      return *(unsigned int *)(result + 20);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000D130(uint64_t a1, char a2)
{
  char __src = a2;
  return sub_10000CF40(a1, 53, 1, &__src);
}

const char *sub_10000D160(uint64_t *a1)
{
  uint64_t result = "<bad parameter>";
  if (a1)
  {
    uint64_t v4 = *a1;
    uint64_t v3 = a1 + 5;
    if (v4 == 287454020) {
      return (const char *)v3;
    }
  }
  return result;
}

uint64_t sub_10000D188(uint64_t result)
{
  if (result)
  {
    if (*(void *)result == 287454020) {
      return *(unsigned int *)(result + 36);
    }
    else {
      return 0;
    }
  }
  return result;
}

void sub_10000D1B0(CFMutableStringRef theString, unsigned __int8 *a2, uint64_t a3)
{
  unsigned int v3 = a3;
  if (a3 > 0xEB)
  {
    v7[0] = 0;
    v7[1] = 0;
    sub_10000CAA4(v7);
    sub_10000CC5C(v7, (uint64_t)a2, v3, 0);
    sub_10000D248(theString, a2, v6, (uint64_t)v7);
    sub_10000CAA8((uint64_t)v7);
  }
  else
  {
    CFStringAppendFormat(theString, 0, @"Packet is too short %d < %d\n", a3, 236);
  }
}

void sub_10000D248(__CFString *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  CFStringAppendFormat(a1, 0, @"op = ");
  int v7 = *a2;
  if (v7 == 2)
  {
    CFStringAppendFormat(a1, 0, @"BOOTREPLY\n");
  }
  else if (v7 == 1)
  {
    CFStringAppendFormat(a1, 0, @"BOOTREQUEST\n");
  }
  else
  {
    CFStringAppendFormat(a1, 0, @"OP(%d)\n", *a2);
  }
  CFStringAppendFormat(a1, 0, @"htype = %d\n", a2[1]);
  CFStringAppendFormat(a1, 0, @"flags = 0x%x\n", bswap32(*((unsigned __int16 *)a2 + 5)) >> 16);
  unsigned int v8 = a2[2];
  if (v8 >= 0x11)
  {
    int v10 = 16;
    CFStringAppendFormat(a1, 0, @"hlen = %d (invalid > %lu)\n", a2[2], 16);
    int v9 = "[truncated] ";
  }
  else
  {
    CFStringAppendFormat(a1, 0, @"hlen = %d\n", a2[2]);
    int v9 = "";
    int v10 = v8;
  }
  CFStringAppendFormat(a1, 0, @"hops = %d\n", a2[3]);
  CFStringAppendFormat(a1, 0, @"xid = 0x%lx\n", bswap32(*((_DWORD *)a2 + 1)));
  CFStringAppendFormat(a1, 0, @"secs = %hu\n", bswap32(*((unsigned __int16 *)a2 + 4)) >> 16);
  uint64_t v11 = inet_ntop(2, a2 + 12, v16, 0x10u);
  CFStringAppendFormat(a1, 0, @"ciaddr = %s\n", v11);
  int v12 = inet_ntop(2, a2 + 16, v16, 0x10u);
  CFStringAppendFormat(a1, 0, @"yiaddr = %s\n", v12);
  int v13 = inet_ntop(2, a2 + 20, v16, 0x10u);
  CFStringAppendFormat(a1, 0, @"siaddr = %s\n", v13);
  uint64_t v14 = inet_ntop(2, a2 + 24, v16, 0x10u);
  CFStringAppendFormat(a1, 0, @"giaddr = %s\n", v14);
  CFStringAppendFormat(a1, 0, @"chaddr = %s", v9);
  if (v10)
  {
    for (uint64_t i = 0; i != v10; CFStringAppendFormat(a1, 0, @"%0x", a2[i++ + 28]))
    {
      if (i) {
        CFStringAppendFormat(a1, 0, @":");
      }
    }
  }
  CFStringAppendFormat(a1, 0, @"\n");
  CFStringAppendFormat(a1, 0, @"sname = %.*s\n", 64, a2 + 44);
  CFStringAppendFormat(a1, 0, @"file = %.*s\n", 128, a2 + 108);
  if (a4)
  {
    if ((int)sub_10000CAA0(a4) >= 1)
    {
      CFStringAppendFormat(a1, 0, @"options:\n");
      sub_10000CDF0(a1, a4);
    }
  }
}

void *sub_10000D5B0(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
{
  unsigned int v5 = a4;
  uint64_t v6 = a3;
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
    int v9 = &v59;
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
  int v9 = (long long *)a3;
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
      uint64_t v6 = malloc_type_malloc(v10, 0x64155627uLL);
      memcpy(v6, *((const void **)&v67 + 1), v10);
    }
    goto LABEL_84;
  }
  uint64_t v11 = 0;
  uint64_t v52 = a2;
  while (1)
  {
    uint64_t v54 = v11;
    int v12 = *(const char **)(v7 + 8 * v11);
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
    uint64_t v16 = v14 + 24;
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
      if ((sub_10000E2D8((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0) {
        goto LABEL_75;
      }
      goto LABEL_64;
    }
    uint64_t v57 = v69;
    if ((int)v69 < 1)
    {
      unsigned int v24 = 0;
LABEL_41:
      if ((sub_10000E2D8((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
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
        sub_10000E3C4((void **)v14);
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
      uint64_t v29 = *(void **)v14;
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
        unsigned int v32 = (unsigned __int8 *)(v25 + *(unsigned int *)(*(void *)(v26 + 32) + 4 * v28 - 4));
        size_t v33 = *v32;
        int v34 = (unsigned __int8 *)(*((void *)v14 + 1) + *(unsigned int *)(v29[4] + 4 * v30 - 4));
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
    __int16 v39 = *(void **)v14;
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
            if (!sub_10000E2D8((uint64_t)&v59, &__src, 2)) {
              goto LABEL_75;
            }
          }
          ++v38;
          int v43 = *(void **)v14;
        }
        else
        {
          int v43 = *(void **)v14;
          uint64_t v44 = *(unsigned int *)(*(void *)(*(void *)v14 + 32) + 4 * v41);
          if ((v37 & 1) == 0)
          {
            if (!sub_10000E2D8((uint64_t)&v59, (void *)(*((void *)v14 + 1) + v44), *(unsigned __int8 *)(*((void *)v14 + 1) + v44) + 1))goto LABEL_75; {
            int v43 = *(void **)v14;
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
      __int16 v39 = *(void **)v14;
    }
    uint64_t v46 = SDWORD1(v69);
    if (DWORD1(v69) == v69)
    {
      if (DWORD1(v69))
      {
        DWORD1(v69) *= 2;
        uint32_t v47 = reallocf(*((void **)&v68 + 1), 16 * v46);
      }
      else
      {
        DWORD1(v69) = 8;
        uint32_t v47 = malloc_type_malloc(0x40uLL, 0x2004093837F09uLL);
      }
      *((void *)&v68 + 1) = v47;
    }
    else
    {
      uint32_t v47 = (void *)*((void *)&v68 + 1);
    }
    uint64_t v48 = (int)v69;
    LODWORD(v69) = v69 + 1;
    v47[v48] = v39;
    *(void *)uint64_t v14 = 0;
LABEL_64:
    sub_10000E3C4((void **)v14);
    free(v14);
    uint64_t v7 = a1;
    uint64_t v11 = v54 + 1;
    if (v54 + 1 == v52)
    {
      int v10 = v68;
      uint64_t v6 = a3;
      unsigned int v5 = a4;
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
    sub_10000E240(*(int **)v14, v18);
    *(unsigned char *)(*((void *)v14 + 1) + v18) = v20;
    v19 += v20 + 1;
    size_t v18 = ++v17;
    int v20 = 0;
LABEL_19:
    if (v17 == v13 + 1)
    {
      uint64_t v16 = (char *)*((void *)v14 + 1);
      goto LABEL_22;
    }
  }
  fprintf(__stderrp, "label length %d > %d\n", v20, 63);
LABEL_71:
  sub_10000E3C4((void **)v14);
  free(v14);
  if ((v68 & 0x80000000) != 0 || (int)v68 > SDWORD1(v68)) {
    fprintf(__stderrp, "trying to set used to %d\n", v55);
  }
  else {
    LODWORD(v68) = v55;
  }
LABEL_80:
  unsigned int v5 = a4;
  fprintf(__stderrp, "failed to add %s\n", *(const char **)(v7 + 8 * v54));
  if (a3) {
    int v10 = v68;
  }
  else {
    int v10 = 0;
  }
  uint64_t v6 = 0;
LABEL_84:
  sub_10000DBE8((uint64_t)&v59);
LABEL_85:
  *unsigned int v5 = v10;
  return v6;
}

void sub_10000DBE8(uint64_t a1)
{
  sub_10000E1E8((_OWORD *)a1);
  unsigned int v3 = (void **)(a1 + 152);
  uint64_t v2 = *(void **)(a1 + 152);
  if (v2)
  {
    if (*(int *)(a1 + 160) >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      do
      {
        sub_10000E3C4((void **)(*(void *)(a1 + 152) + v4));
        ++v5;
        v4 += 8;
      }
      while (v5 < *(int *)(a1 + 160));
      uint64_t v2 = *v3;
    }
    free(v2);
  }
  void *v3 = 0;
  *(void *)(a1 + 160) = 0;
}

CFDataRef sub_10000DC60(const __CFArray *a1, char a2)
{
  CFIndex length = 0;
  unsigned int v3 = sub_10000C0D0(a1, &length);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (UInt8 *)sub_10000D5B0((uint64_t)v3, length, 0, (_DWORD *)&length + 1, a2);
  free(v4);
  CFDataRef v6 = CFDataCreate(0, v5, SHIDWORD(length));
  free(v5);
  return v6;
}

CFDataRef sub_10000DCEC(const __CFString *a1)
{
  LODWORD(length) = 0;
  uint64_t v1 = sub_10000C438(a1, 0x8000100u);
  CFDataRef v6 = v1;
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  unsigned int v3 = (UInt8 *)sub_10000D5B0((uint64_t)&v6, 1, 0, &length, 0);
  free(v2);
  if (!v3) {
    return 0;
  }
  CFDataRef v4 = CFDataCreate(0, v3, (int)length);
  free(v3);
  return v4;
}

char *sub_10000DD7C(uint64_t a1, unsigned int a2, int *a3)
{
  __src[0] = 0;
  memset(v11, 0, sizeof(v11));
  __src[1] = v11;
  size_t __n = 0x8000000000;
  int v4 = sub_10000DE98(a1, a2, (uint64_t)v11, 0);
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
  sub_10000E1E8(v11);
  return v6;
}

uint64_t sub_10000DE98(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
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
      int v12 = (unsigned __int8 *)(a1 + v8);
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
              sub_10000E240((int *)v29, v8);
          }
          if ((v10 & 1) == 0) {
            sub_10000E2D8(a3, &__src, 1);
          }
          sub_10000E2D8(a3, v12 + 1, v13);
          char v10 = 0;
          size_t v8 = v8 + v13 + 1;
        }
        else
        {
          char __src = 0;
          char v10 = 1;
          sub_10000E2D8(a3, &__src, 1);
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
    sub_10000E1E8((_OWORD *)a3);
    uint64_t v4 = 0;
LABEL_49:
    if (v30[0] && v30[0] != v29) {
      free(v30[0]);
    }
  }
  return v4;
}

double sub_10000E1E8(_OWORD *a1)
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

int *sub_10000E240(int *result, size_t size)
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

uint64_t sub_10000E2D8(uint64_t a1, void *__src, int a3)
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
      int v12 = malloc_type_malloc(v10, 0x6DA55C14uLL);
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

void sub_10000E3C4(void **a1)
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

void *sub_10000E414(unsigned __int8 *a1, int a2, void *a3, int *a4)
{
  int v5 = a3;
  int v6 = 0;
  if (a1 && a2)
  {
    int v7 = a1;
    if (a3)
    {
      int v8 = *a4;
      if (!*a4)
      {
        int v6 = 0;
        goto LABEL_26;
      }
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v27 = 0;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
      int v9 = (long long *)a3;
      LOBYTE(v26) = 1;
    }
    else
    {
      uint64_t v27 = 0;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
      int v8 = 64;
      int v9 = &v22;
    }
    *((void *)&v26 + 1) = v9;
    HIDWORD(v27) = v8;
    if (a2 < 1)
    {
      int v6 = 0;
      if (a3)
      {
LABEL_24:
        sub_10000E694(&v22);
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v10 = a2;
      do
      {
        unsigned __int8 __src = *((_DWORD *)v7 + 1);
        int v11 = __src;
        if (__src > 0x20u || !sub_10000F118((uint64_t)&v22, &__src, 1uLL)) {
          goto LABEL_19;
        }
        if (v11)
        {
          unsigned int v12 = v11 & 0xF8;
          if ((v11 & 7) != 0) {
            unsigned int v12 = (v11 & 0xF8) + 8;
          }
          if ((sub_10000F118((uint64_t)&v22, v7, v12 >> 3) & 1) == 0) {
            goto LABEL_19;
          }
        }
        if ((sub_10000F118((uint64_t)&v22, v7 + 8, 4uLL) & 1) == 0)
        {
LABEL_19:
          sub_100014334();
          _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            uint64_t v13 = _os_log_pack_size();
            __chkstk_darwin(v13, v14);
            __error();
            uint64_t v15 = _os_log_pack_fill();
            int v16 = *v7;
            int v17 = v7[1];
            int v18 = v7[2];
            int v19 = v7[3];
            *(_DWORD *)uint64_t v15 = 67109888;
            *(_DWORD *)(v15 + 4) = v16;
            *(_WORD *)(v15 + 8) = 1024;
            *(_DWORD *)(v15 + 10) = v17;
            *(_WORD *)(v15 + 14) = 1024;
            *(_DWORD *)(v15 + 16) = v18;
            *(_WORD *)(v15 + 20) = 1024;
            *(_DWORD *)(v15 + 22) = v19;
            __SC_log_send();
          }
          int v6 = 0;
          int v5 = 0;
          goto LABEL_24;
        }
        v7 += 12;
        --v10;
      }
      while (v10);
      int v6 = v27;
      if (v5) {
        goto LABEL_24;
      }
    }
    int v5 = malloc_type_malloc(v6, 0xFED602F4uLL);
    memcpy(v5, *((const void **)&v26 + 1), v6);
    goto LABEL_24;
  }
LABEL_26:
  *a4 = v6;
  return v5;
}

double sub_10000E694(_OWORD *a1)
{
  if (!*((unsigned char *)a1 + 64))
  {
    int v2 = (_OWORD *)*((void *)a1 + 9);
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
  *((void *)a1 + 10) = 0;
  double result = 0.0;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

_DWORD *sub_10000E6E4(unsigned __int8 *a1, int a2, int *a3)
{
  BOOL v4 = 0;
  int v5 = 0;
  if (a1 && a2)
  {
    int v8 = sub_10000E798(a1, a2, 0, 0);
    int v5 = v8;
    if (!v8)
    {
LABEL_6:
      BOOL v4 = 0;
      goto LABEL_7;
    }
    BOOL v4 = malloc_type_malloc(12 * v8, 0x10000403E1C8BA9uLL);
    if (sub_10000E798(a1, a2, v4, v5) != v5)
    {
      free(v4);
      int v5 = 0;
      goto LABEL_6;
    }
  }
LABEL_7:
  *a3 = v5;
  return v4;
}

uint64_t sub_10000E798(unsigned __int8 *a1, int a2, _DWORD *__dst, int a4)
{
  if (a2 >= 1)
  {
    unsigned int v5 = a2;
    uint64_t v7 = 0;
    uint64_t v8 = a4;
    for (uint64_t i = __dst; ; i += 3)
    {
      unsigned int v10 = *a1;
      if (v10 >= 0x21) {
        break;
      }
      LODWORD(v11) = v10 + 8;
      if ((v10 & 7) != 0) {
        unint64_t v11 = v11;
      }
      else {
        unint64_t v11 = *a1;
      }
      unint64_t v12 = v11 >> 3;
      unsigned int v13 = (v11 >> 3) + 5;
      int v14 = v5 - v13;
      if (v5 < v13)
      {
        sub_100014334();
        _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          uint64_t v18 = _os_log_pack_size();
          __chkstk_darwin(v18, v19);
          __error();
          uint64_t v20 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v20 = 67109376;
          *(_DWORD *)(v20 + 4) = v5;
          *(_WORD *)(v20 + 8) = 1024;
          *(_DWORD *)(v20 + 10) = v13;
          __SC_log_send();
        }
        return 0;
      }
      if (__dst)
      {
        if (v7 >= v8)
        {
          sub_100014334();
          _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            uint64_t v21 = _os_log_pack_size();
            __chkstk_darwin(v21, v22);
            __error();
            long long v23 = (_DWORD *)_os_log_pack_fill();
            _DWORD *v23 = 67109120;
            v23[1] = a4;
            __SC_log_send();
          }
          return 0;
        }
        *uint64_t i = 0;
        i[1] = v10;
        memcpy(i, a1 + 1, v11 >> 3);
        i[2] = *(_DWORD *)&a1[v12 + 1];
      }
      ++v7;
      a1 += v13;
      v5 -= v13;
      if (v14 <= 0) {
        return v7;
      }
    }
    sub_100014334();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v15 = _os_log_pack_size();
      __chkstk_darwin(v15, v16);
      __error();
      int v17 = (_DWORD *)_os_log_pack_fill();
      *int v17 = 67109120;
      v17[1] = v10;
      __SC_log_send();
    }
  }
  return 0;
}

in_addr *sub_10000EAC0(const __CFArray *a1, _DWORD *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (!Count) {
    goto LABEL_27;
  }
  uint64_t v5 = Count;
  if (Count)
  {
    sub_100014334();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v18 = _os_log_pack_size();
      __chkstk_darwin(v18, v19);
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
    }
    goto LABEL_27;
  }
  if (Count >= 0) {
    uint64_t v6 = Count;
  }
  else {
    uint64_t v6 = Count + 1;
  }
  uint64_t v7 = v6 >> 1;
  uint64_t v8 = (in_addr *)malloc_type_malloc(12 * (v6 >> 1) + 12, 0x10000403E1C8BA9uLL);
  int v9 = v8;
  if (v5 < 2)
  {
LABEL_26:
    free(v9);
LABEL_27:
    LODWORD(v7) = 0;
    int v9 = 0;
    goto LABEL_28;
  }
  uint64_t v29 = a2;
  char v30 = 0;
  unsigned int v10 = v8 + 3;
  CFIndex v11 = 1;
  uint64_t v12 = v7;
  do
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v11 - 1);
    CFStringRef v14 = (const __CFString *)CFArrayGetValueAtIndex(a1, v11);
    CFTypeID TypeID = CFStringGetTypeID();
    if (!ValueAtIndex
      || CFGetTypeID(ValueAtIndex) != TypeID
      || (CFTypeID v16 = CFStringGetTypeID(), !v14)
      || CFGetTypeID(v14) != v16)
    {
      sub_100014334();
      _SC_syslog_os_log_mapping();
      a2 = v29;
      if (!__SC_log_enabled()) {
        goto LABEL_26;
      }
      uint64_t v20 = _os_log_pack_size();
      __chkstk_darwin(v20, v21);
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      goto LABEL_25;
    }
    if ((sub_10000EF24(ValueAtIndex, v10, (int *)&v10[1]) & 1) == 0)
    {
      sub_100014334();
      _SC_syslog_os_log_mapping();
      a2 = v29;
      if (__SC_log_enabled())
      {
        uint64_t v23 = _os_log_pack_size();
        __chkstk_darwin(v23, v24);
        __error();
        uint64_t v25 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v25 = 138412290;
        *(void *)(v25 + 4) = ValueAtIndex;
LABEL_25:
        __SC_log_send();
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    if ((sub_10000C168(v14, v10 + 2) & 1) == 0)
    {
      sub_100014334();
      _SC_syslog_os_log_mapping();
      a2 = v29;
      if (__SC_log_enabled())
      {
        uint64_t v26 = _os_log_pack_size();
        __chkstk_darwin(v26, v27);
        __error();
        uint64_t v28 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v28 = 138412290;
        *(void *)(v28 + 4) = v14;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    if ((v10->s_addr != 0) | v30 & 1)
    {
      v10 += 3;
    }
    else
    {
      uint64_t v17 = *(void *)&v10->s_addr;
      v9[2].in_addr_t s_addr = v10[2].s_addr;
      *(void *)&v9->in_addr_t s_addr = v17;
      char v30 = 1;
    }
    v11 += 2;
    --v12;
  }
  while (v12);
  a2 = v29;
  if ((unint64_t)(v5 + 1) < 3) {
    goto LABEL_26;
  }
  if ((v30 & 1) == 0)
  {
    v9[2].in_addr_t s_addr = 0;
    LODWORD(v7) = v7 + 1;
    *(void *)&v9->in_addr_t s_addr = 0;
  }
LABEL_28:
  *a2 = v7;
  return v9;
}

uint64_t sub_10000EF24(const __CFString *a1, in_addr *a2, int *a3)
{
  uint64_t v5 = (char *)sub_10000C438(a1, 0x600u);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = strchr(v5, 47);
    if (v7)
    {
      char *v7 = 0;
      unsigned int v8 = strtoul(v7 + 1, 0, 0);
      if (v8 >= 0x21)
      {
        sub_100014334();
        _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          uint64_t v9 = _os_log_pack_size();
          __chkstk_darwin(v9, v10);
          __error();
          CFIndex v11 = (_DWORD *)_os_log_pack_fill();
          *CFIndex v11 = 67109120;
          v11[1] = v8;
          __SC_log_send();
        }
        goto LABEL_22;
      }
    }
    else
    {
      unsigned int v8 = -1;
    }
    if (inet_aton(v6, a2) == 1)
    {
      int v13 = bswap32(a2->s_addr);
      if (v8) {
        int v14 = -1 << -(char)v8;
      }
      else {
        int v14 = 0;
      }
      if (v13 >> 30 == 2) {
        int v15 = 16;
      }
      else {
        int v15 = 24;
      }
      if (v13 >= 0) {
        int v15 = 8;
      }
      int v16 = -1 << -(char)v15;
      if (v8 != -1)
      {
        int v15 = v8;
        int v16 = v14;
      }
      if ((v16 & v13) == 0)
      {
        int v15 = 0;
        a2->in_addr_t s_addr = 0;
      }
      *a3 = v15;
      uint64_t v12 = 1;
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v12 = 0;
LABEL_23:
    free(v6);
    return v12;
  }
  return 0;
}

uint64_t sub_10000F118(uint64_t a1, void *__src, size_t __n)
{
  unsigned int v3 = __n;
  uint64_t v6 = *(int *)(a1 + 84);
  if ((int)v6 - *(_DWORD *)(a1 + 80) >= (int)__n) {
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    *(_DWORD *)(a1 + 84) = v6 + 64;
    uint64_t v12 = *(void **)(a1 + 72);
    if (v12 == (void *)a1)
    {
      int v13 = malloc_type_malloc(v6 + 64, 0x75B8D83FuLL);
      *(void *)(a1 + 72) = v13;
      memcpy(v13, (const void *)a1, *(int *)(a1 + 80));
    }
    else
    {
      uint64_t result = (uint64_t)reallocf(v12, v6 + 64);
      *(void *)(a1 + 72) = result;
      if (!result) {
        return result;
      }
    }
LABEL_9:
    memcpy((void *)(*(void *)(a1 + 72) + *(int *)(a1 + 80)), __src, v3);
    *(_DWORD *)(a1 + 80) += v3;
    return 1;
  }
  sub_100014334();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if (result)
  {
    uint64_t v8 = _os_log_pack_size();
    __chkstk_darwin(v8, v9);
    __error();
    uint64_t v10 = _os_log_pack_fill();
    int v11 = *(_DWORD *)(a1 + 84) - *(_DWORD *)(a1 + 80);
    *(_DWORD *)uint64_t v10 = 67109376;
    *(_DWORD *)(v10 + 4) = v3;
    *(_WORD *)(v10 + 8) = 1024;
    *(_DWORD *)(v10 + 10) = v11;
    __SC_log_send();
    return 0;
  }
  return result;
}

void *sub_10000F2DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1000102B0(a1);
  a1[2] = a2;
  a1[3] = a3;
  return result;
}

void sub_10000F314(uint64_t *a1)
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v3 = 0;
  while (sub_100010328(a1, 0, &v3))
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
  sub_1000102B8(v1);
}

uint64_t sub_10000F384(_OWORD *a1, int a2)
{
  if (a2 < 32)
  {
    unsigned int v2 = 0;
  }
  else
  {
    unsigned int v2 = 0;
    unsigned int v3 = a2;
    do
    {
      a2 = v3 - 32;
      uint16x8_t v4 = *(uint16x8_t *)a1;
      uint16x8_t v5 = *((uint16x8_t *)a1 + 1);
      a1 += 2;
      v2 += vaddvq_s32(vaddq_s32((int32x4_t)vaddl_u16(*(uint16x4_t *)v4.i8, *(uint16x4_t *)v5.i8), (int32x4_t)vaddl_high_u16(v4, v5)));
      BOOL v6 = v3 > 0x3F;
      v3 -= 32;
    }
    while (v6);
  }
  if (a2 < 8)
  {
    int v7 = a2;
    if (!a2) {
      return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
    }
  }
  else
  {
    do
    {
      int v7 = a2 - 8;
      uint16x4_t v8 = *(uint16x4_t *)a1;
      a1 = (_OWORD *)((char *)a1 + 8);
      v2 += vaddvq_s32((int32x4_t)vmovl_u16(v8));
      BOOL v6 = a2 > 0xF;
      a2 -= 8;
    }
    while (v6);
    if (!v7) {
      return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
    }
  }
  unsigned int v2 = HIWORD(v2) + (unsigned __int16)v2;
  if (HIWORD(v2)) {
    v2 -= 0xFFFF;
  }
  int v9 = v7 - 2;
  if (v7 < 2)
  {
    int v11 = (unsigned __int8 *)a1;
  }
  else
  {
    uint64_t v10 = v9 & 0xFFFFFFFE;
    int v11 = (unsigned __int8 *)a1 + v10 + 2;
    for (unsigned int i = v7; i > 1; i -= 2)
    {
      int v13 = *(unsigned __int16 *)a1;
      a1 = (_OWORD *)((char *)a1 + 2);
      v2 += v13;
    }
    int v9 = v7 - v10 - 4;
  }
  if (v9 == -1) {
    v2 += *v11;
  }
  return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
}

__n128 sub_10000F484(__n128 *a1)
{
  unsigned int v2 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  if (v2)
  {
    __n128 result = *a1;
    *unsigned int v2 = *a1;
  }
  return result;
}

uint64_t sub_10000F4CC(uint64_t *a1, int a2)
{
  uint64_t v4 = 0;
  if (!a1) {
    goto LABEL_3;
  }
LABEL_2:
  for (int i = *((_DWORD *)a1 + 2); ; int i = 0)
  {
    if (v4 >= i) {
      return 0;
    }
    uint64_t v6 = *a1;
    uint64_t v7 = *a1 + 96 * v4 + 24;
    if ((int)sub_10000CAA0(v7) >= 1) {
      break;
    }
LABEL_9:
    ++v4;
    if (a1) {
      goto LABEL_2;
    }
LABEL_3:
    ;
  }
  uint64_t v8 = 0;
  while (*(_DWORD *)sub_10000F380(v7, v8) != a2)
  {
    uint64_t v8 = (v8 + 1);
    if ((int)v8 >= (int)sub_10000CAA0(v7)) {
      goto LABEL_9;
    }
  }
  return v6 + 96 * v4;
}

uint64_t sub_10000F590(uint64_t *a1, char *__s2)
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

void *sub_10000F618()
{
  uint64_t v0 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  uint64_t v1 = v0;
  if (v0 && !sub_10000F670((uint64_t)v0))
  {
    free(v1);
    return 0;
  }
  return v1;
}

uint64_t sub_10000F670(uint64_t a1)
{
  long long v65 = 0;
  memset(v69, 0, 44);
  *(void *)a1 = 0;
  int v2 = getifaddrs(&v65);
  unsigned int v3 = v65;
  if (v2 < 0) {
    goto LABEL_89;
  }
  if (!v65)
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
  uint64_t v5 = v65;
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
    unsigned int v3 = v65;
    goto LABEL_89;
  }
  int v8 = socket(2, 2, 0);
  unsigned int v3 = v65;
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
  int v64 = v8;
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
        int v34 = *(_DWORD *)&ifa_addr->sa_data[2];
        ifa_netmask = v3->ifa_netmask;
        if (ifa_netmask) {
          int v36 = *(_DWORD *)&ifa_netmask->sa_data[2];
        }
        else {
          int v36 = 0;
        }
        if ((*(_WORD *)(v25 + 16) & 2) != 0 && (ifa_dstaddr = v3->ifa_dstaddr) != 0) {
          int v38 = *(_DWORD *)&ifa_dstaddr->sa_data[2];
        }
        else {
          int v38 = 0;
        }
        __int16 v39 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
        if (v39)
        {
          _DWORD *v39 = v34;
          v39[1] = v36;
          v39[2] = v36 & v34;
          v39[3] = v38;
        }
        sub_10000F378(v25 + 24, v39);
        goto LABEL_82;
      }
LABEL_30:
      uint64_t v33 = sub_10001021C((uint64_t *)a1);
      if (v33)
      {
        uint64_t v25 = v33;
        *(_WORD *)(v33 + 16) = v3->ifa_flags;
        ifa_addr = v3->ifa_addr;
        goto LABEL_32;
      }
      sub_100014334();
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
    uint64_t v26 = sub_10001021C((uint64_t *)a1);
    if (!v26)
    {
      sub_100014334();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_82;
      }
LABEL_45:
      uint64_t v40 = _os_log_pack_size();
      __chkstk_darwin(v40, v41);
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
      sub_100014334();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v28 = _os_log_pack_size();
        __chkstk_darwin(v28, v29);
        __error();
        uint64_t v30 = _os_log_pack_fill();
        int v31 = ifa_addr->sa_data[2];
        int v32 = ifa_addr->sa_data[4];
        *(_DWORD *)uint64_t v30 = 136315906;
        *(void *)(v30 + 4) = ifa_name;
        *(_WORD *)(v30 + 12) = 1024;
        *(_DWORD *)(v30 + 14) = v31;
        *(_WORD *)(v30 + 18) = 1024;
        *(_DWORD *)(v30 + 20) = v32;
        *(_WORD *)(v30 + 24) = 2048;
        unsigned int v27 = 16;
        *(void *)(v30 + 26) = 16;
        __SC_log_send();
        int v9 = v64;
      }
      else
      {
        unsigned int v27 = 16;
      }
    }
    *(unsigned char *)(v19 + 74) = v27;
    memmove((void *)(v19 + 56), &ifa_addr->sa_data[ifa_addr->sa_data[3] + 6], v27);
    char v42 = ifa_addr->sa_data[2];
    *(unsigned char *)(v19 + 75) = v42;
    *(_WORD *)(v19 + 72) = *(_WORD *)ifa_addr->sa_data;
    ifa_data = (char *)v3->ifa_data;
    if (ifa_data) {
      char v42 = *ifa_data;
    }
    *(unsigned char *)(v19 + 18) = v42;
    if (sub_10000FFE0(v9, (uint64_t)ifa_name, (uint64_t)v69))
    {
      if (*(unsigned char *)(v19 + 18) == 6)
      {
        uint64_t v44 = sub_100010074(v9, (uint64_t)ifa_name);
        if ((v44 & 0x4000) != 0) {
          *(unsigned char *)(v19 + 19) |= 8u;
        }
        if ((v69[1] & 0xE0) == 0x80)
        {
          char v45 = *(unsigned char *)(v19 + 19);
          *(unsigned char *)(v19 + 19) = v45 | 1;
          if ((v44 & 0x100000) != 0)
          {
            char v59 = v45 | 3;
            goto LABEL_70;
          }
          keys = @"IOInterfaceName";
          values = (void *)CFStringCreateWithCString(0, ifa_name, 0x8000100u);
          long long v66 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          keys = @"IOPropertyMatch";
          CFDictionaryRef v46 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v66, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(v66);
          io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v46);
          if (MatchingService)
          {
            io_object_t v48 = MatchingService;
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IO80211InterfaceRole", kCFAllocatorDefault, 0);
            if (CFProperty)
            {
              int v50 = CFProperty;
              CFTypeID TypeID = CFStringGetTypeID();
              BOOL v52 = CFGetTypeID(v50) == TypeID && CFEqual(v50, @"Infrastructure") != 0;
              CFRelease(v50);
              IOObjectRelease(v48);
              if (v52)
              {
                char v59 = *(unsigned char *)(v19 + 19) | 0x10;
LABEL_70:
                *(unsigned char *)(v19 + 19) = v59;
              }
            }
            else
            {
              IOObjectRelease(v48);
            }
          }
        }
        else
        {
          CFStringRef v53 = CFStringCreateWithCString(0, ifa_name, 0x8000100u);
          uint64_t v54 = _SCNetworkInterfaceCreateWithBSDName();
          if (v54)
          {
            int v55 = (const void *)v54;
            int IsTetheredHotspot = _SCNetworkInterfaceIsTetheredHotspot();
            int IsCarPlay = _SCNetworkInterfaceIsCarPlay();
            CFRelease(v55);
            if (IsCarPlay)
            {
              if (IsTetheredHotspot) {
                char v58 = 36;
              }
              else {
                char v58 = 32;
              }
              CFRelease(v53);
            }
            else
            {
              CFRelease(v53);
              if (!IsTetheredHotspot) {
                goto LABEL_71;
              }
              char v58 = 4;
            }
            char v59 = *(unsigned char *)(v19 + 19) | v58;
            goto LABEL_70;
          }
          CFRelease(v53);
        }
      }
LABEL_71:
      if (SLODWORD(v69[2]) < 1)
      {
        int v61 = 0;
        unint64_t v60 = 0;
        uint64_t v62 = 0;
      }
      else
      {
        unint64_t v60 = (unint64_t)(BYTE8(v69[1]) & 2) << 31;
        if (BYTE8(v69[1])) {
          int v61 = (DWORD2(v69[1]) >> 2) & 1;
        }
        else {
          int v61 = 0;
        }
        if ((BYTE8(v69[1]) & 1) == 0) {
          unint64_t v60 = 0;
        }
        uint64_t v62 = 1;
        if ((BYTE8(v69[1]) & 1) == 0) {
          uint64_t v62 = 0;
        }
      }
      *(void *)(v19 + 80) = v62 | v60;
      *(_DWORD *)(v19 + 88) = v61;
    }
LABEL_82:
    unsigned int v3 = v3->ifa_next;
  }
  while (v3);
  size_t v10 = 96 * *(int *)(a1 + 8) + 96;
LABEL_94:
  *(void *)a1 = reallocf(*(void **)a1, v10);
  if (v65) {
    freeifaddrs(v65);
  }
  if ((v9 & 0x80000000) == 0) {
    close(v9);
  }
  return 1;
}

void sub_10000FE3C(uint64_t *a1)
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
          sub_10000F314((uint64_t *)(*(void *)v2 + v4));
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

uint64_t sub_10000FEC0(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 16);
}

uint64_t sub_10000FEC8(uint64_t a1)
{
  return sub_10000CAA0(a1 + 24);
}

uint64_t sub_10000FED0(uint64_t a1, uint64_t a2)
{
  return sub_10000F380(a1 + 24, a2);
}

unsigned int *sub_10000FED8(uint64_t a1)
{
  uint64_t result = (unsigned int *)sub_10000F380(a1 + 24, 0);
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t sub_10000FF00(uint64_t a1)
{
  return *(unsigned int *)(sub_10000F380(a1 + 24, 0) + 12);
}

BOOL sub_10000FF24(uint64_t a1)
{
  return (int)sub_10000CAA0(a1 + 24) > 0;
}

uint64_t sub_10000FF48(uint64_t a1, int a2)
{
  uint64_t v3 = a1 + 24;
  int v4 = sub_10000CAA0(a1 + 24);
  if (v4 < 1) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = sub_10000F380(v3, v6);
    if ((*(_DWORD *)(v7 + 4) & a2) == *(_DWORD *)(v7 + 8)) {
      break;
    }
    uint64_t v6 = (v6 + 1);
    if (v5 == v6) {
      return 0xFFFFFFFFLL;
    }
  }
  return v6;
}

uint64_t sub_10000FFBC(uint64_t a1)
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

uint64_t sub_10000FFD8(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 72);
}

uint64_t sub_10000FFE0(int a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100010074(int a1, uint64_t a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  __strlcpy_chk();
  if (ioctl(a1, 0xC020698EuLL, &v10) != -1) {
    return v11;
  }
  if (*__error() != 6 && *__error() != 82 && *__error() != 22)
  {
    sub_100014334();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v5 = _os_log_pack_size();
      __chkstk_darwin(v5, v6);
      __error();
      uint64_t v7 = _os_log_pack_fill();
      int v8 = __error();
      int v9 = strerror(*v8);
      *(_DWORD *)uint64_t v7 = 136315394;
      *(void *)(v7 + 4) = a2;
      *(_WORD *)(v7 + 12) = 2080;
      *(void *)(v7 + 14) = v9;
      __SC_log_send();
    }
  }
  return 0;
}

uint64_t sub_10001021C(uint64_t *a1)
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
  sub_10000F2DC((void *)(v3 + 24), (uint64_t)j__free, (uint64_t)sub_10000F484);
  return v3;
}

void *sub_1000102B0(void *result)
{
  unsigned int *result = 0;
  result[1] = 0;
  return result;
}

void sub_1000102B8(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

uint64_t sub_1000102E8(uint64_t result)
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

uint64_t sub_100010304(uint64_t a1, int a2)
{
  if (*(void *)a1 && *(_DWORD *)(a1 + 12) > a2) {
    return *(void *)(*(void *)a1 + 8 * a2);
  }
  else {
    return 0;
  }
}

uint64_t sub_100010328(uint64_t *a1, unsigned int a2, void *a3)
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

BOOL sub_1000103B0(uint64_t a1, uint64_t a2)
{
  BOOL result = sub_1000103F4(a1);
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

BOOL sub_1000103F4(uint64_t a1)
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

BOOL sub_100010488(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((a3 & 0x80000000) != 0) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 12);
  BOOL result = sub_1000103F4(a1);
  if (v6 <= (int)a3)
  {
    if (!result) {
      return result;
    }
    uint64_t v8 = *(void *)a1;
    uint64_t v9 = *(int *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v9 + 1;
    *(void *)(v8 + 8 * v9) = a2;
  }
  else
  {
    if (!result) {
      return result;
    }
    memmove((void *)(*(void *)a1 + 8 * a3 + 8), (const void *)(*(void *)a1 + 8 * a3), 8 * (int)(*(_DWORD *)(a1 + 12) - a3));
    *(void *)(*(void *)a1 + 8 * a3) = a2;
    ++*(_DWORD *)(a1 + 12);
  }
  return 1;
}

uint64_t sub_10001052C(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 12);
  if (!v2) {
    return 1;
  }
  int v5 = *(_DWORD *)(a1 + 12) + v2;
  if (v5 <= *(_DWORD *)(a1 + 8))
  {
    uint64_t result = *(void *)a1;
    if (*(void *)a1)
    {
LABEL_9:
      memmove((void *)(result + 8 * *(int *)(a1 + 12)), *(const void **)a2, 8 * *(int *)(a2 + 12));
      *(_DWORD *)(a1 + 12) += *(_DWORD *)(a2 + 12);
      return 1;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 8) = v5;
    int v6 = *(void **)a1;
    if (*(void *)a1) {
      uint64_t result = (uint64_t)malloc_type_realloc(v6, 8 * v5, 0x80040B8603338uLL);
    }
    else {
      uint64_t result = (uint64_t)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    }
    *(void *)a1 = result;
    if (result) {
      goto LABEL_9;
    }
  }
  return result;
}

char *sub_1000105E8(int a1, unsigned int a2)
{
  int v2 = 0;
  int v14 = a1;
  unsigned int v3 = bswap32(a2);
  while (((v3 >> v2) & 1) == 0)
  {
    if (++v2 == 32)
    {
      byte_10001D4E8 = 0;
      int v4 = 32;
      int v5 = 4;
      goto LABEL_7;
    }
  }
  int v4 = 32 - v2;
  byte_10001D4E8 = 0;
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
      uint64_t v12 = ".";
    }
    else {
      uint64_t v12 = "";
    }
    snprintf(__str, 8uLL, "%d%s", v10, v12);
    __strlcat_chk();
    LODWORD(v7) = v7 - 1;
    --v8;
  }
  while (v8);
LABEL_12:
  if ((v4 & 7) != 0)
  {
    snprintf(__str, 8uLL, "/%d", v4);
    __strlcat_chk();
  }
  return &byte_10001D4E8;
}

uint64_t sub_100010754(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  *(void *)a5 = result - a3;
  *(_DWORD *)(a5 + 8) = a2 - a4;
  if (a2 - a4 < 0)
  {
    *(_DWORD *)(a5 + 8) = a2 - a4 + 1000000;
    *(void *)a5 = result - a3 - 1;
  }
  return result;
}

void sub_100010784(CFMutableStringRef theString, uint64_t a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    do
    {
      if (!v6) {
        CFStringAppendFormat(theString, 0, @"%04x ", v5);
      }
      int v8 = *(char *)(a2 + v5);
      if (v8 < 0) {
        __uint32_t v9 = __maskrune(*(unsigned __int8 *)(a2 + v5), 0x40000uLL);
      }
      else {
        __uint32_t v9 = _DefaultRuneLocale.__runetype[*(unsigned __int8 *)(a2 + v5)] & 0x40000;
      }
      unsigned __int8 v10 = *(unsigned char *)(a2 + v5);
      if (v9) {
        char v11 = v8;
      }
      else {
        char v11 = 46;
      }
      v14[v6] = v11;
      CFStringAppendFormat(theString, 0, @" %02x", v10);
      if (v6 == 7)
      {
        CFStringAppendFormat(theString, 0, @" ");
        int v6 = 8;
      }
      else if (v6 == 15)
      {
        char v15 = 0;
        CFStringAppendFormat(theString, 0, @"  %s\n", v14);
        int v6 = 0;
      }
      else
      {
        ++v6;
      }
      ++v5;
    }
    while (a3 != v5);
    if (v6)
    {
      if (v6 >= 8) {
        uint64_t v12 = "";
      }
      else {
        uint64_t v12 = " ";
      }
      if (v6 <= 15)
      {
        uint64_t v13 = v6;
        do
        {
          CFStringAppendFormat(theString, 0, @"   ");
          v14[v13++] = 32;
        }
        while (v13 != 16);
      }
      char v15 = 0;
      CFStringAppendFormat(theString, 0, @"  %s%s\n", v12, v14);
    }
  }
}

void sub_100010970(CFMutableStringRef theString, uint64_t a2, int a3, int a4)
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
          *(_WORD *)char v11 = a4;
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

void sub_100010A30(__CFString *a1, uint64_t a2, int a3)
{
}

uint64_t sub_100010A38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + v2) - *(unsigned __int8 *)(a2 + v2);
    if (v3) {
      break;
    }
    if (++v2 == 6) {
      return 0;
    }
  }
  return v3;
}

char *identifierToStringWithBuffer(int a1, uint64_t a2, int a3, char *__str, int a5)
{
  int v8 = 3 * a3 + 4;
  size_t v9 = v8;
  if (__str && (uint64_t v10 = __str, v8 <= a5) || (uint64_t v10 = (char *)malloc_type_malloc(v8, 0x78A35FCFuLL)) != 0)
  {
    snprintf(v10, v9, "%x%c", a1, 44);
    if (a3 >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        if (v11) {
          uint64_t v12 = ":";
        }
        else {
          uint64_t v12 = "";
        }
        snprintf(__stra, 4uLL, "%s%x", v12, *(unsigned __int8 *)(a2 + v11));
        strlcat(v10, __stra, v9);
        ++v11;
      }
      while (a3 != v11);
    }
  }
  return v10;
}

uint64_t SubnetDoesAllocate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t SubnetGetMaxLease(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t SubnetGetMinLease(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

uint64_t SubnetGetOptionPtrAndLength(uint64_t a1, int a2, _DWORD *a3)
{
  if (a2 == 1)
  {
    *a3 = 4;
    return a1 + 12;
  }
  else
  {
    int v4 = *(_DWORD *)(a1 + 56);
    if (v4 < 1)
    {
      return 0;
    }
    else
    {
      for (uint64_t i = *(void *)(a1 + 48) + 8; *(_DWORD *)(i - 8) != a2; i += 16)
      {
        if (!--v4) {
          return 0;
        }
      }
      *a3 = *(_DWORD *)(i - 4);
      return *(void *)i;
    }
  }
}

uint64_t *SubnetListCreateWithArray(const void *a1)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
  {
    syslog(5, "subnets: type is not an array");
    return 0;
  }
  uint64_t v3 = (uint64_t *)malloc_type_malloc(0x20uLL, 0x1080040EE4F9096uLL);
  int v4 = v3;
  if (v3)
  {
    *(_OWORD *)uint64_t v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    sub_10000F2DC(v3, (uint64_t)j__free_0, 0);
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      CFIndex v6 = 0;
      CFIndex v55 = Count;
      while (1)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
        int v57 = 0;
        CFTypeID v8 = CFDictionaryGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v8) {
          goto LABEL_85;
        }
        v60[0] = 0;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"name");
        if (Value)
        {
          CFTypeID v10 = CFStringGetTypeID();
          if (CFGetTypeID(Value) != v10) {
            goto LABEL_85;
          }
          int v11 = sub_10000BF30(Value, 0, 0, 0);
          int v12 = v11 >= 2 ? v11 : 0;
        }
        else
        {
          int v12 = 0;
        }
        CFStringRef v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"supernet");
        if (v13)
        {
          CFTypeID v14 = CFStringGetTypeID();
          if (CFGetTypeID(v13) != v14) {
            goto LABEL_85;
          }
          int v15 = sub_10000BF30(v13, 0, 0, 0);
          int v16 = v15 >= 2 ? v15 : 0;
          int v56 = v16;
          int v17 = v16 + v12;
        }
        else
        {
          int v56 = 0;
          int v17 = v12;
        }
        char v58 = 0;
        uint64_t v59 = 0;
        CFStringRef v18 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"net_address");
        CFTypeID v19 = CFStringGetTypeID();
        if (!v18
          || CFGetTypeID(v18) != v19
          || !sub_10000C168(v18, (in_addr *)&v59 + 1)
          || (CFStringRef v20 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"net_mask"),
              CFTypeID v21 = CFStringGetTypeID(),
              !v20)
          || CFGetTypeID(v20) != v21
          || !sub_10000C168(v20, (in_addr *)&v59)
          || (uint64_t v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"net_range"),
              CFTypeID v23 = CFArrayGetTypeID(),
              !v22)
          || CFGetTypeID(v22) != v23
          || CFArrayGetCount((CFArrayRef)v22) != 2
          || (CFStringRef v24 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v22, 0), !sub_10001187C(v24))
          || !sub_10000C168(v24, (in_addr *)&v58)
          || (CFStringRef v25 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v22, 1), !sub_10001187C(v25))
          || !sub_10000C168(v25, (in_addr *)&v58 + 1)
          || (v58 & v59) != HIDWORD(v59)
          || (HIDWORD(v58) & v59) != HIDWORD(v59)
          || bswap32(v58) > bswap32(HIDWORD(v58)))
        {
LABEL_85:
          __strlcpy_chk();
          syslog(5, "subnets: create failed, %s", v60);
          goto LABEL_86;
        }
        if (!v12)
        {
          uint64_t v26 = sub_1000105E8(SHIDWORD(v59), v59);
          CFStringRef Value = 0;
          int v12 = strlen(v26) + 1;
          v17 += v12;
        }
        unsigned int v27 = sub_1000118C0((const __CFDictionary *)ValueAtIndex, &v57);
        CFArrayRef v28 = v27;
        if (v27)
        {
          unsigned int v29 = (v57 + 7) & 0xFFFFFFF8;
          int v57 = v29 + 16 * CFArrayGetCount(v27);
          v17 += v57;
        }
        uint64_t v30 = (const char **)malloc_type_malloc(v17 + 64, 0xCE3239EBuLL);
        *(_OWORD *)uint64_t v30 = 0u;
        *((_OWORD *)v30 + 1) = 0u;
        *((_OWORD *)v30 + 2) = 0u;
        *((_OWORD *)v30 + 3) = 0u;
        sub_100012154((uint64_t)v30, (CFDictionaryRef)ValueAtIndex);
        int v31 = v59;
        *((_DWORD *)v30 + 2) = HIDWORD(v59);
        *((_DWORD *)v30 + 3) = v31;
        v30[2] = v58;
        *((unsigned char *)v30 + 24) = sub_1000121F8((const __CFDictionary *)ValueAtIndex);
        int v32 = (UInt8 *)(v30 + 8);
        if (v28)
        {
          *((_DWORD *)v30 + 14) = CFArrayGetCount(v28);
          uint64_t v33 = v57;
          v30[6] = (const char *)sub_100012258(v28, (uint64_t)(v30 + 8), v57);
          v32 += v33;
          CFRelease(v28);
          int v34 = *((_DWORD *)v30 + 14);
          if (v34 >= 1)
          {
            int v35 = v30[6];
            int v36 = v35 + 8;
            int v37 = *((_DWORD *)v30 + 14);
            while (*((_DWORD *)v36 - 2) != 3)
            {
              v36 += 2;
              if (!--v37)
              {
                int v38 = 0;
                goto LABEL_49;
              }
            }
            int v38 = (int *)*v36;
LABEL_49:
            __int16 v39 = v35 + 4;
            while (*((_DWORD *)v39 - 1) != 121)
            {
              v39 += 16;
              if (!--v34) {
                goto LABEL_65;
              }
            }
            if (v38)
            {
              uint64_t v40 = *(void *)(v39 + 4);
              if (v40)
              {
                unsigned int v41 = *(_DWORD *)v39;
                if (!*(unsigned char *)v40 && v41 >= 5)
                {
                  int v43 = *v38;
                  if (!*(_DWORD *)(v40 + 1) && v43 != 0) {
                    *(_DWORD *)(v40 + 1) = v43;
                  }
                }
              }
            }
          }
        }
LABEL_65:
        uint8_t *v30 = (const char *)v32;
        if (Value)
        {
          sub_10000BF30(Value, v32, v12, 0);
        }
        else
        {
          char v45 = sub_1000105E8(SHIDWORD(v59), v59);
          strncpy((char *)v32, v45, v12);
        }
        if (v56)
        {
          sub_10000BF30(v13, &v32[v12], v56, 0);
          v30[5] = (const char *)&v32[v12];
        }
        *((_DWORD *)v30 + 9) = v58;
        int v46 = sub_10000CAA0(v4);
        if (v46 >= 1) {
          break;
        }
LABEL_76:
        sub_10000F378(v4, v30);
LABEL_79:
        if (++v6 == v55) {
          return v4;
        }
      }
      int v47 = v46;
      uint64_t v48 = 0;
      while (1)
      {
        uint64_t v49 = sub_10000F380(v4, v48);
        unsigned int v50 = *(_DWORD *)(v49 + 16);
        unsigned int v51 = *((_DWORD *)v30 + 4);
        if (v51 == v50) {
          break;
        }
        unsigned int v52 = bswap32(v51);
        unsigned int v53 = bswap32(v50);
        if (v52 < v53)
        {
          if (bswap32(*((_DWORD *)v30 + 5)) < v53)
          {
            sub_10000F37C(v4, v30, v48);
            goto LABEL_79;
          }
          break;
        }
        if (bswap32(*(_DWORD *)(v49 + 20)) >= v52) {
          break;
        }
        uint64_t v48 = (v48 + 1);
        if (v47 == v48) {
          goto LABEL_76;
        }
      }
      syslog(5, "subnets: '%s' net_range overlaps with subnet '%s'", *v30, *(const char **)v49);
      free(v30);
LABEL_86:
      sub_10000F314(v4);
      free(v4);
      return 0;
    }
  }
  return v4;
}

void SubnetListFree(uint64_t **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      sub_10000F314(*a1);
      free(v2);
      *a1 = 0;
    }
  }
}

void SubnetListPrintCFString(__CFString *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CAA0(a2);
  int v5 = v4;
  CFStringAppendFormat(a1, 0, @"Subnets[%d]\n", v4);
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = sub_10000F380(a2, v6);
      uint64_t v6 = (v6 + 1);
      CFStringAppendFormat(a1, 0, @"%2d. ", v6);
      CFTypeID v8 = *(char **)v7;
      if (!*(void *)v7) {
        CFTypeID v8 = sub_1000105E8(*(_DWORD *)(v7 + 8), *(_DWORD *)(v7 + 12));
      }
      CFStringAppendFormat(a1, 0, @"Subnet '%s'", v8);
      if (*(void *)(v7 + 40)) {
        CFStringAppendFormat(a1, 0, @": supernet %s\n", *(void *)(v7 + 40));
      }
      else {
        CFStringAppendFormat(a1, 0, @"\n", v20);
      }
      v9.in_addr_t s_addr = *(_DWORD *)(v7 + 8);
      CFTypeID v10 = inet_ntoa(v9);
      CFStringAppendFormat(a1, 0, @"\tNetwork: %s", v10);
      v11.in_addr_t s_addr = *(_DWORD *)(v7 + 12);
      int v12 = inet_ntoa(v11);
      CFStringAppendFormat(a1, 0, @"/%s\n", v12);
      v13.in_addr_t s_addr = *(_DWORD *)(v7 + 16);
      CFTypeID v14 = inet_ntoa(v13);
      CFStringAppendFormat(a1, 0, @"\tRange: %s..", v14);
      v15.in_addr_t s_addr = *(_DWORD *)(v7 + 20);
      int v16 = inet_ntoa(v15);
      CFStringAppendFormat(a1, 0, @"%s\n", v16);
      int v17 = "yes";
      if (!*(unsigned char *)(v7 + 24)) {
        int v17 = "no";
      }
      CFStringAppendFormat(a1, 0, @"\tAllocate: %s\n", v17);
      if (*(unsigned char *)(v7 + 24)) {
        CFStringAppendFormat(a1, 0, @"\tLease Min: %d   Lease Max: %d\n", *(unsigned int *)(v7 + 28), *(unsigned int *)(v7 + 32));
      }
      if (*(_DWORD *)(v7 + 56))
      {
        CFStringAppendFormat(a1, 0, @"\tOptions:\n");
        CFStringAppendFormat(a1, 0, @"\t%6s %6s   %s\n", "Code", "Length", "Data");
        if (*(int *)(v7 + 56) >= 1)
        {
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          do
          {
            CFStringAppendFormat(a1, 0, @"\t%6d %6d   ", *(unsigned int *)(*(void *)(v7 + 48) + v18), *(unsigned int *)(*(void *)(v7 + 48) + v18 + 4));
            sub_100010A30(a1, *(void *)(*(void *)(v7 + 48) + v18 + 8), *(_DWORD *)(*(void *)(v7 + 48) + v18 + 4));
            CFStringAppendFormat(a1, 0, @"\n");
            ++v19;
            v18 += 16;
          }
          while (v19 < *(int *)(v7 + 56));
        }
      }
    }
    while (v6 != v5);
  }
}

uint64_t SubnetListAcquireAddress(uint64_t a1, unsigned int *a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  unsigned int v8 = *a2;
  uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(a1, *a2, 0);
  if (!SubnetForAddress) {
    return 0;
  }
  uint64_t v10 = SubnetForAddress;
  int v11 = sub_10000CAA0(a1);
  if (v11 < 1) {
    return 0;
  }
  int v12 = v11;
  uint64_t v22 = a2;
  uint64_t v13 = 0;
  unsigned int v24 = v8;
  int v23 = v11;
  while (1)
  {
    uint64_t v14 = sub_10000F380(a1, v13);
    uint64_t v15 = v14;
    if (v14 != v10 && (*(_DWORD *)(v14 + 12) & v8) != *(_DWORD *)(v14 + 8))
    {
      uint64_t v19 = *(const char **)(v14 + 40);
      if (!v19) {
        goto LABEL_17;
      }
      uint64_t v20 = *(const char **)(v10 + 40);
      if (!v20 || strcmp(v19, v20)) {
        goto LABEL_17;
      }
    }
    if (!*(unsigned char *)(v15 + 24)) {
      goto LABEL_17;
    }
    unsigned int v16 = bswap32(*(_DWORD *)(v15 + 20));
    unsigned int v17 = bswap32(*(_DWORD *)(v15 + 36));
    if (v17 == v16 + 1) {
      unsigned int v17 = bswap32(*(_DWORD *)(v15 + 16));
    }
    if (v17 <= v16) {
      break;
    }
LABEL_13:
    *(_DWORD *)(v15 + 36) = bswap32(v16 + 1);
    unsigned int v8 = v24;
    int v12 = v23;
LABEL_17:
    uint64_t v13 = (v13 + 1);
    if (v13 == v12) {
      return 0;
    }
  }
  if (a3)
  {
    while (1)
    {
      uint64_t v18 = bswap32(v17);
      if ((a3(a4, v18) & 1) == 0) {
        break;
      }
      if (++v17 > v16) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    LODWORD(v18) = bswap32(v17);
  }
  unsigned int *v22 = v18;
  *(_DWORD *)(v15 + 36) = v18;
  return v15;
}

uint64_t SubnetListGetSubnetForAddress(uint64_t a1, unsigned int a2, int a3)
{
  int v6 = sub_10000CAA0(a1);
  if (a3) {
    uint64_t v7 = (unsigned int (*)(uint64_t, void))sub_1000117AC;
  }
  else {
    uint64_t v7 = (unsigned int (*)(uint64_t, void))sub_100011798;
  }
  if (v6 < 1) {
    return 0;
  }
  int v8 = v6;
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = sub_10000F380(a1, v9);
    if (v7(v10, a2)) {
      break;
    }
    uint64_t v9 = (v9 + 1);
    if (v8 == v9) {
      return 0;
    }
  }
  return v10;
}

BOOL sub_100011798(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 12) & a2) == *(_DWORD *)(a1 + 8);
}

BOOL sub_1000117AC(_DWORD *a1, unsigned int a2)
{
  if ((a1[3] & a2) == a1[2] && (unsigned int v2 = bswap32(a2), v2 >= bswap32(a1[4]))) {
    return v2 <= bswap32(a1[5]);
  }
  else {
    return 0;
  }
}

uint64_t SubnetListAreAddressesOnSameSupernet(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t SubnetForAddress = SubnetListGetSubnetForAddress(a1, a2, 0);
  uint64_t v6 = SubnetListGetSubnetForAddress(a1, a3, 0);
  uint64_t result = 0;
  if (SubnetForAddress && v6)
  {
    if (SubnetForAddress == v6)
    {
      return 1;
    }
    else
    {
      uint64_t result = *(void *)(SubnetForAddress + 40);
      if (result)
      {
        int v8 = *(const char **)(v6 + 40);
        return v8 && strcmp((const char *)result, v8) == 0;
      }
    }
  }
  return result;
}

const void *sub_10001187C(const void *a1)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0;
}

__CFArray *sub_1000118C0(const __CFDictionary *a1, _DWORD *a2)
{
  *a2 = 0;
  CFIndex Count = CFDictionaryGetCount(a1);
  if (!Count) {
    return 0;
  }
  CFIndex v5 = Count;
  int v56 = a2;
  size_t v6 = 8 * Count;
  uint64_t v7 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  int v8 = (const void **)malloc_type_malloc(v6, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(a1, v7, v8);
  theArray = CFArrayCreateMutable(0, v5, &kCFTypeArrayCallBacks);
  if (v5 >= 1)
  {
    uint64_t v9 = 0;
    int v58 = 0;
    while (1)
    {
      unsigned int valuePtr = 0;
      CFStringRef v10 = (const __CFString *)v7[v9];
      CFStringRef ValueAtIndex = (const __CFString *)v8[v9];
      if (!CFStringHasPrefix(v10, @"dhcp_")) {
        goto LABEL_34;
      }
      v62.CFIndex length = CFStringGetLength(v10) - 5;
      v62.CFIndex location = 5;
      int v12 = (char *)sub_10000C380(v10, v62, 0x8000100u);
      if (!v12) {
        goto LABEL_34;
      }
      uint64_t v13 = v12;
      unsigned int v14 = sub_10000CA0C(v12);
      unsigned int valuePtr = v14;
      if (v14 == 1) {
        goto LABEL_33;
      }
      unsigned int v15 = v14;
      if (v14 == -1)
      {
        syslog(5, "subnets: unrecognized option '%s'");
        goto LABEL_33;
      }
      __str[0] = 0;
      CFTypeID TypeID = CFDataGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == TypeID) {
          break;
        }
      }
      CFTypeID v21 = (unsigned int *)sub_10000C9F4(v15);
      if (!v21) {
        goto LABEL_27;
      }
      uint64_t v22 = (int *)v21;
      int v23 = sub_10000C498(*v21);
      int v24 = *v22;
      if (!v23)
      {
        snprintf(__str, 0x100uLL, "Unknown type %d");
        goto LABEL_32;
      }
      CFStringRef v25 = v23;
      CFTypeID v26 = CFArrayGetTypeID();
      if (!ValueAtIndex)
      {
        CFStringGetTypeID();
LABEL_31:
        CFNumberGetTypeID();
        CFBooleanGetTypeID();
        CFArrayGetTypeID();
LABEL_32:
        syslog(5, "subnets: Failed to convert '%s': %s");
        goto LABEL_33;
      }
      if (CFGetTypeID(ValueAtIndex) != v26) {
        goto LABEL_21;
      }
      if (!CFArrayGetCount((CFArrayRef)ValueAtIndex))
      {
LABEL_27:
        __strlcpy_chk();
        goto LABEL_32;
      }
      if (!*((_DWORD *)v25 + 4))
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, 0);
        CFTypeID v27 = CFStringGetTypeID();
        if (!ValueAtIndex) {
          goto LABEL_31;
        }
      }
      else
      {
LABEL_21:
        CFTypeID v27 = CFStringGetTypeID();
      }
      if (CFGetTypeID(ValueAtIndex) != v27)
      {
        CFTypeID v29 = CFNumberGetTypeID();
        if (CFGetTypeID(ValueAtIndex) != v29)
        {
          CFTypeID v30 = CFBooleanGetTypeID();
          if (CFGetTypeID(ValueAtIndex) != v30)
          {
            CFTypeID v33 = CFArrayGetTypeID();
            if (CFGetTypeID(ValueAtIndex) != v33) {
              goto LABEL_32;
            }
            CFIndex v34 = CFArrayGetCount((CFArrayRef)ValueAtIndex);
            uint64_t v35 = v34;
            switch(v24)
            {
              case 7:
              case 8:
                *(_DWORD *)&bytes[4] = 0;
                CFDataRef theData = CFDataCreateMutable(0, v34 * *(int *)v25);
                if (v35 < 1) {
                  goto LABEL_63;
                }
                CFIndex v36 = 0;
                while (1)
                {
                  CFStringRef v37 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v36);
                  if ((sub_10000C2BC(v37, &bytes[4]) & 1) == 0) {
                    break;
                  }
                  if (*(_DWORD *)v25 == 1)
                  {
                    bytes[0] = bytes[4];
                    int v38 = theData;
                    CFIndex v39 = 1;
                  }
                  else
                  {
                    *(_WORD *)bytes = bswap32(*(unsigned __int16 *)&bytes[4]) >> 16;
                    int v38 = theData;
                    CFIndex v39 = 2;
                  }
                  CFDataAppendBytes(v38, bytes, v39);
                  if (v35 == ++v36)
                  {
LABEL_63:
                    CFDataRef v40 = theData;
                    CFDataRef Copy = CFDataCreateCopy(0, theData);
                    goto LABEL_89;
                  }
                }
                __strlcpy_chk();
                CFDataRef Copy = 0;
                CFDataRef v40 = theData;
LABEL_89:
                CFDataRef v50 = v40;
                goto LABEL_96;
              case 11:
                goto LABEL_76;
              case 12:
                if (v34) {
                  goto LABEL_27;
                }
LABEL_76:
                *(_DWORD *)&bytes[4] = 0;
                CFMutableDataRef Mutable = CFDataCreateMutable(0, 4 * v34);
                CFDataRef v42 = Mutable;
                if (v35 < 1) {
                  goto LABEL_82;
                }
                CFIndex v43 = 0;
                uint64_t v53 = v35;
                theDataa = Mutable;
                break;
              case 13:
                CFDataRef Copy = sub_10000DC60((const __CFArray *)ValueAtIndex, 1);
                if (!Copy) {
                  goto LABEL_27;
                }
                goto LABEL_14;
              case 14:
                *(_DWORD *)&bytes[4] = 0;
                int v46 = (unsigned __int8 *)sub_10000EAC0((const __CFArray *)ValueAtIndex, &bytes[4]);
                if (!v46) {
                  goto LABEL_73;
                }
                int v47 = v46;
                *(_DWORD *)bytes = 0;
                uint64_t v48 = (const UInt8 *)sub_10000E414(v46, *(int *)&bytes[4], 0, (int *)bytes);
                if (v48)
                {
                  uint64_t v49 = (UInt8 *)v48;
                  CFDataRef Copy = CFDataCreate(0, v48, *(int *)bytes);
                  free(v49);
                }
                else
                {
                  CFDataRef Copy = 0;
                }
                free(v47);
                goto LABEL_13;
              default:
                snprintf(__str, 0x100uLL, "Can't convert array to %s");
                goto LABEL_32;
            }
            while (1)
            {
              CFStringRef v44 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v43);
              CFTypeID v45 = CFStringGetTypeID();
              if (!v44 || CFGetTypeID(v44) != v45 || (sub_10000C168(v44, (in_addr *)&bytes[4]) & 1) == 0) {
                break;
              }
              CFDataRef v42 = theDataa;
              CFDataAppendBytes(theDataa, &bytes[4], 4);
              if (v53 == ++v43)
              {
LABEL_82:
                CFDataRef Copy = CFDataCreateCopy(0, v42);
                goto LABEL_95;
              }
            }
            __strlcpy_chk();
            CFDataRef Copy = 0;
            CFDataRef v42 = theDataa;
LABEL_95:
            CFDataRef v50 = v42;
LABEL_96:
            CFRelease(v50);
            goto LABEL_13;
          }
        }
        *(_DWORD *)&bytes[4] = 0;
        if (*((_DWORD *)v25 + 1))
        {
          BOOL v28 = v24 == 12;
          int v24 = *((_DWORD *)v25 + 1);
          if (v28)
          {
LABEL_72:
            __strlcpy_chk();
LABEL_73:
            CFDataRef Copy = 0;
            goto LABEL_13;
          }
        }
        CFTypeID v31 = CFBooleanGetTypeID();
        if (CFGetTypeID(ValueAtIndex) == v31)
        {
          unsigned int v32 = CFEqual(ValueAtIndex, kCFBooleanTrue) != 0;
          *(_DWORD *)&bytes[4] = v32;
        }
        else
        {
          if (!CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt32Type, &bytes[4])) {
            goto LABEL_72;
          }
          unsigned int v32 = *(_DWORD *)&bytes[4];
        }
        CFDataRef v17 = sub_1000123A0(v24, v32);
        goto LABEL_12;
      }
      *(void *)bytes = 0;
      if (*((_DWORD *)v25 + 1))
      {
        BOOL v28 = v24 == 12;
        int v24 = *((_DWORD *)v25 + 1);
        if (v28) {
          goto LABEL_72;
        }
      }
      switch(v24)
      {
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
          if ((sub_10000C21C(ValueAtIndex, bytes) & 1) == 0) {
            goto LABEL_72;
          }
          CFDataRef Copy = sub_1000123A0(v24, *(unsigned int *)bytes);
          if (!Copy) {
            goto LABEL_71;
          }
          break;
        case 9:
          CFDataRef v17 = sub_10000C480(ValueAtIndex);
          goto LABEL_12;
        case 10:
          if ((sub_10000C168(ValueAtIndex, (in_addr *)&bytes[4]) & 1) == 0) {
            goto LABEL_72;
          }
          CFDataRef v17 = CFDataCreate(0, &bytes[4], 4);
          goto LABEL_12;
        case 13:
          CFDataRef Copy = sub_10000DCEC(ValueAtIndex);
          if (!Copy) {
LABEL_71:
          }
            __strlcpy_chk();
          break;
        default:
          snprintf(__str, 0x100uLL, "Failed to convert from string to %s", *((const char **)v25 + 1));
          goto LABEL_73;
      }
LABEL_13:
      if (!Copy) {
        goto LABEL_32;
      }
LABEL_14:
      v58 += CFDataGetLength(Copy);
      uint64_t v19 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFNumberRef v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      CFDictionarySetValue(v19, @"Tag", v20);
      CFRelease(v20);
      CFDictionarySetValue(v19, @"Data", Copy);
      CFRelease(Copy);
      CFArrayAppendValue(theArray, v19);
      CFRelease(v19);
LABEL_33:
      free(v13);
LABEL_34:
      if (++v9 == v5) {
        goto LABEL_98;
      }
    }
    CFDataRef v17 = (const __CFData *)CFRetain(ValueAtIndex);
LABEL_12:
    CFDataRef Copy = v17;
    goto LABEL_13;
  }
  int v58 = 0;
LABEL_98:
  free(v7);
  free(v8);
  unsigned int v51 = theArray;
  if (!CFArrayGetCount(theArray))
  {
    CFRelease(theArray);
    return 0;
  }
  *int v56 = v58;
  return v51;
}

uint64_t sub_100012154(uint64_t a1, CFDictionaryRef theDict)
{
  unsigned int v10 = 0;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"lease_max");
  int v5 = sub_10000C2BC(Value, &v10);
  int v6 = v10;
  if (!v5) {
    int v6 = 86400;
  }
  *(_DWORD *)(a1 + 32) = v6;
  CFStringRef v7 = (const __CFString *)CFDictionaryGetValue(theDict, @"lease_min");
  uint64_t result = sub_10000C2BC(v7, &v10);
  unsigned int v9 = v10;
  if (!v10) {
    unsigned int v9 = 3600;
  }
  if (!result) {
    unsigned int v9 = 3600;
  }
  *(_DWORD *)(a1 + 28) = v9;
  if (*(_DWORD *)(a1 + 32) < v9) {
    *(_DWORD *)(a1 + 32) = v9;
  }
  return result;
}

BOOL sub_1000121F8(const __CFDictionary *a1)
{
  CFStringRef Value = CFDictionaryGetValue(a1, @"allocate");
  CFTypeID TypeID = CFBooleanGetTypeID();
  return Value && CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 0;
}

uint64_t sub_100012258(const __CFArray *a1, uint64_t a2, int a3)
{
  CFIndex Count = CFArrayGetCount(a1);
  uint64_t v7 = 16 * Count;
  if (16 * Count > (unint64_t)a3)
  {
    syslog(5, "copyOptionsDataArrayToOptionTLVList %d < %d");
    return 0;
  }
  CFIndex v8 = Count;
  if (Count >= 1)
  {
    CFIndex v9 = 0;
    unsigned int v10 = (char *)(a2 + v7);
    int v11 = a3 - v7;
    for (uint64_t i = (void *)(a2 + 8); ; i += 2)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v9);
      int valuePtr = 0;
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"Data");
      CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Tag");
      CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
      int Length = CFDataGetLength(Value);
      *((_DWORD *)i - 2) = valuePtr;
      *((_DWORD *)i - 1) = Length;
      *uint64_t i = v10;
      if (v11 < Length) {
        break;
      }
      BytePtr = CFDataGetBytePtr(Value);
      memcpy(v10, BytePtr, Length);
      v10 += Length;
      ++v9;
      v11 -= Length;
      if (v8 == v9) {
        return a2;
      }
    }
    syslog(5, "copyOptionsDataArrayToOptionTLVList option %d < %d");
    return 0;
  }
  return a2;
}

CFDataRef sub_1000123A0(int a1, unsigned int a2)
{
  BOOL v6 = 0;
  switch(a1)
  {
    case 2:
      BOOL v6 = a2 != 0;
      goto LABEL_6;
    case 3:
      BOOL v6 = a2;
LABEL_6:
      unsigned int v2 = (UInt8 *)&v6;
      CFIndex v3 = 1;
      goto LABEL_8;
    case 4:
      *(_WORD *)bytes = bswap32(a2) >> 16;
      unsigned int v2 = bytes;
      CFIndex v3 = 2;
      goto LABEL_8;
    case 5:
    case 6:
      unsigned int v7 = bswap32(a2);
      unsigned int v2 = (UInt8 *)&v7;
      CFIndex v3 = 4;
LABEL_8:
      CFDataRef result = CFDataCreate(0, v2, v3);
      break;
    default:
      CFDataRef result = 0;
      break;
  }
  return result;
}

void *sub_100012460(unsigned int a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_malloc(0x30uLL, 0x10A0040A76AC297uLL);
  if (v4)
  {
    void *v4 = sub_100013138(a1, a2);
    v4[1] = v5;
    v4[4] = 0;
    v4[5] = 0;
  }
  return v4;
}

void sub_1000124C4(uint64_t a1)
{
  sub_1000130CC((unsigned int *)a1);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;

  free((void *)a1);
}

void *sub_100012508(void *result)
{
  result[1] = 0;
  result[2] = 0;
  unsigned int *result = 0;
  *((_DWORD *)result + 4) = 256;
  return result;
}

void sub_10001251C(uint64_t a1, int a2)
{
  if (a2 <= 10) {
    int v2 = 10;
  }
  else {
    int v2 = a2;
  }
  *(_DWORD *)(a1 + 16) = v2;
  int v3 = *(_DWORD *)(a1 + 20);
  int v4 = v3 - v2;
  if (v3 > v2)
  {
    if (v4 <= 0)
    {
      *(void *)(a1 + 8) = 0;
      CFIndex v8 = (void *)a1;
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 8);
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = *(void *)(v6 + 40);
        sub_1000124C4(v7);
        --v4;
      }
      while (v4);
      *(void *)(a1 + 8) = v6;
      CFIndex v8 = (void *)(v6 + 32);
      if (!v6) {
        CFIndex v8 = (void *)a1;
      }
    }
    *CFIndex v8 = 0;
    *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 16);
  }
}

uint64_t sub_1000125A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    do
    {
      uint64_t v3 = *(void *)(result + 32);
      sub_1000124C4(result);
      uint64_t result = v3;
    }
    while (v3);
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

uint64_t *sub_1000125E8(uint64_t *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *result;
    *(void *)(a2 + 32) = *result;
    *(void *)(a2 + 40) = 0;
    if (v2) {
      uint64_t v3 = (void *)(v2 + 40);
    }
    else {
      uint64_t v3 = result + 1;
    }
    void *v3 = a2;
    unsigned int *result = a2;
    ++*((_DWORD *)result + 5);
  }
  return result;
}

uint64_t sub_10001261C(uint64_t a1, char *__filename)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v3 = fopen(__filename, "r");
  if (v3)
  {
    int v4 = v3;
    int v5 = 0;
    int v6 = 0;
LABEL_3:
    int v7 = v6;
    while (1)
    {
      int v8 = 1023;
      CFIndex v9 = __s;
      do
      {
        int v10 = fgetc(v4);
        if ((v10 + 1) < 2) {
          break;
        }
        if (v8 >= 1)
        {
          *v9++ = v10;
          --v8;
        }
      }
      while (v10 != 10);
      if (v9 == __s) {
        break;
      }
      *CFIndex v9 = 0;
      ++v5;
      if (!(*(unsigned __int16 *)__s ^ 0xA7B | v32))
      {
        int v6 = 1;
        if (v7 && v7 != 3)
        {
          fprintf(__stderrp, "unexpected '{' at line %d\n");
          goto LABEL_35;
        }
        goto LABEL_3;
      }
      if (!(*(unsigned __int16 *)__s ^ 0xA7D | v32))
      {
        if ((v7 - 3) <= 0xFFFFFFFD)
        {
          fprintf(__stderrp, "unexpected '}' at line %d\n");
          goto LABEL_35;
        }
        int v6 = 3;
        if (v23)
        {
          CFDataRef v17 = sub_100012460(v23, v24);
          if (v17)
          {
            v17[4] = 0;
            uint64_t v18 = *(void *)(a1 + 8);
            v17[5] = v18;
            uint64_t v19 = (void *)(v18 + 32);
            if (!*(void *)a1) {
              uint64_t v19 = (void *)a1;
            }
            void *v19 = v17;
            *(void *)(a1 + 8) = v17;
            ++*(_DWORD *)(a1 + 20);
          }
          sub_1000130CC((unsigned int *)&v23);
          int v6 = 3;
        }
        goto LABEL_3;
      }
      bzero(v29, 0x300uLL);
      int v11 = strlen(__s);
      int v12 = strchr(__s, 61);
      int v13 = strspn(__s, " \t\n");
      if (v13 != v11)
      {
        if (v12)
        {
          unsigned int v14 = v12 - __s;
          int v15 = v14 - v13;
          if (v14 - v13 >= 0x80)
          {
            int v15 = 127;
            fprintf(__stderrp, "property name truncated to %d bytes at line %d\n", 127, v5);
            unsigned int v14 = v12 - __s;
          }
          unsigned int v16 = v11 - v14 - 2;
          if (v16 >= 0x300)
          {
            unsigned int v16 = 767;
            fprintf(__stderrp, "value truncated to %d bytes at line %d\n", 767, v5);
          }
          __strncpy_chk();
          v30[v15] = 0;
          __strncpy_chk();
          v29[v16] = 0;
          *((void *)&v27 + 1) = 0;
          uint64_t v28 = 0;
          *(void *)&long long v27 = v30;
          sub_100013350((unsigned int *)&v27 + 2, v29, 0);
        }
        else
        {
          unsigned int v20 = ~v13 + v11;
          if (v20 >= 0x80)
          {
            unsigned int v20 = 127;
            fprintf(__stderrp, "property name truncated to %d bytes at line %d\n", 127, v5);
          }
          __strncpy_chk();
          v30[v20] = 0;
          *((void *)&v27 + 1) = 0;
          uint64_t v28 = 0;
          *(void *)&long long v27 = v30;
        }
        long long v25 = v27;
        uint64_t v26 = v28;
        sub_100012ECC((unsigned int *)&v23, (uint64_t)&v25, 0xFFFFFFFFFFFFFFFFLL);
        sub_1000132E4((void *)&v27 + 1);
        int v6 = 2;
        goto LABEL_3;
      }
    }
    if ((v7 - 1) <= 1) {
      fwrite("file ends prematurely\n", 0x16uLL, 1uLL, __stderrp);
    }
LABEL_35:
    fclose(v4);
  }
  else
  {
    perror(__filename);
  }
  sub_1000130CC((unsigned int *)&v23);
  return 1;
}

uint64_t sub_1000129D8(unsigned int **a1, const std::__fs::filesystem::path *a2)
{
  snprintf((char *)__str, 0x100uLL, "%s-", (const char *)a2);
  int v4 = fopen((const char *)__str, "w");
  if (v4)
  {
    int v5 = v4;
    for (uint64_t i = *a1; i; uint64_t i = (unsigned int *)*((void *)i + 4))
    {
      fwrite("{\n", 2uLL, 1uLL, v5);
      if (*i)
      {
        uint64_t v7 = 0;
        unint64_t v8 = 0;
        do
        {
          if (*(_DWORD *)(*((void *)i + 1) + v7 + 8)) {
            fprintf(v5, "\t%s=%s\n");
          }
          else {
            fprintf(v5, "\t%s\n");
          }
          ++v8;
          v7 += 24;
        }
        while (v8 < *i);
      }
      fwrite("}\n", 2uLL, 1uLL, v5);
    }
    fclose(v5);
    rename(__str, a2, v9);
    return 1;
  }
  else
  {
    perror((const char *)__str);
    return 0;
  }
}

uint64_t sub_100012B60(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a2 + 40);
    if (v2) {
      *(void *)(v2 + 32) = *(void *)(a2 + 32);
    }
    uint64_t v3 = *(void *)(a2 + 32);
    if (v3) {
      *(void *)(v3 + 40) = v2;
    }
    if (*(void *)result == a2) {
      *(void *)uint64_t result = v3;
    }
    if (*(void *)(result + 8) == a2) {
      *(void *)(result + 8) = *(void *)(a2 + 40);
    }
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 40) = 0;
    --*(_DWORD *)(result + 20);
  }
  return result;
}

uint64_t *sub_100012BBC(uint64_t *result, uint64_t a2)
{
  if (*result != a2)
  {
    uint64_t v3 = result;
    uint64_t result = (uint64_t *)sub_100012B60((uint64_t)result, a2);
    if (a2)
    {
      uint64_t v4 = *v3;
      *(void *)(a2 + 32) = *v3;
      *(void *)(a2 + 40) = 0;
      if (v4) {
        int v5 = (uint64_t *)(v4 + 40);
      }
      else {
        int v5 = v3 + 1;
      }
      *int v5 = a2;
      uint64_t *v3 = a2;
      ++*((_DWORD *)v3 + 5);
    }
  }
  return result;
}

void *sub_100012C20(uint64_t *a1, const char *a2, unsigned int (*a3)(uint64_t, void), uint64_t a4, in_addr *a5, _DWORD *a6)
{
  if (a6) {
    *a6 = 0;
  }
  CFIndex v9 = (void *)*a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v10 = sub_100013248(*v9, v9[1], "identifier", 0);
      if (v10 << 32 != 0xFFFFFFFF00000000)
      {
        int v11 = v10;
        uint64_t v12 = v9[1];
        uint64_t v13 = v12 + 24 * (int)v10;
        int v15 = *(_DWORD *)(v13 + 8);
        unsigned int v14 = (_DWORD *)(v13 + 8);
        if (v15)
        {
          if (!a5 && !strcmp(**(const char ***)(v12 + 24 * (int)v10 + 16), a2))
          {
            if (a6) {
              *a6 = 1;
            }
            goto LABEL_26;
          }
          uint64_t v16 = sub_100013248(*v9, v12, "ip_address", 0);
          if (v16 << 32 != 0xFFFFFFFF00000000)
          {
            uint64_t v17 = v9[1];
            uint64_t v18 = v17 + 24 * (int)v16;
            int v20 = *(_DWORD *)(v18 + 8);
            uint64_t v19 = (_DWORD *)(v18 + 8);
            if (v20)
            {
              if (*v14) {
                break;
              }
            }
          }
        }
      }
LABEL_22:
      CFIndex v9 = (void *)v9[4];
      if (!v9) {
        return v9;
      }
    }
    uint64_t v21 = 0;
    uint64_t v22 = (void *)(v12 + 24 * v11 + 16);
    uint64_t v23 = (void *)(v17 + 24 * (int)v16 + 16);
    while (1)
    {
      if (!strcmp(*(const char **)(*v22 + 8 * v21), a2)
        && inet_aton(*(const char **)(*v23 + 8 * (v21 % *v19)), a5))
      {
        if (a6) {
          *a6 = 1;
        }
        if (!a3 || a5 && a3(a4, a5->s_addr)) {
          break;
        }
      }
      if (++v21 >= (unint64_t)*v14) {
        goto LABEL_22;
      }
    }
LABEL_26:
    sub_100012BBC(a1, (uint64_t)v9);
  }
  return v9;
}

void *sub_100012DDC(uint64_t *a1, int a2)
{
  uint64_t v2 = (void *)*a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v5 = sub_100013248(*v2, v2[1], "ip_address", 0);
      if (v5 << 32 != 0xFFFFFFFF00000000)
      {
        uint64_t v6 = v2[1];
        uint64_t v7 = v6 + 24 * (int)v5;
        int v9 = *(_DWORD *)(v7 + 8);
        unint64_t v8 = (unsigned int *)(v7 + 8);
        if (v9) {
          break;
        }
      }
LABEL_10:
      uint64_t v2 = (void *)v2[4];
      if (!v2) {
        return v2;
      }
    }
    uint64_t v10 = 0;
    int v11 = (void *)(v6 + 24 * (int)v5 + 16);
    while (1)
    {
      v14.in_addr_t s_addr = 0;
      if (inet_aton(*(const char **)(*v11 + 8 * v10), &v14) && v14.s_addr == a2) {
        break;
      }
      if (++v10 >= (unint64_t)*v8) {
        goto LABEL_10;
      }
    }
    sub_100012BBC(a1, (uint64_t)v2);
  }
  return v2;
}

uint64_t sub_100012ECC(unsigned int *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (void *)*((void *)a1 + 1);
  unsigned int v7 = *a1 + 1;
  if (v6) {
    unint64_t v8 = (char *)malloc_type_realloc(v6, 24 * v7, 0x1090040D67CC068uLL);
  }
  else {
    unint64_t v8 = (char *)malloc_type_malloc(24 * v7, 0x1090040D67CC068uLL);
  }
  *((void *)a1 + 1) = v8;
  unint64_t v9 = *a1;
  if (v9 <= a3)
  {
    a3 = *a1;
  }
  else
  {
    uint64_t v10 = 24 * v9;
    do
    {
      uint64_t v11 = *((void *)a1 + 1) + v10;
      --v9;
      *(_OWORD *)uint64_t v11 = *(_OWORD *)(v11 - 24);
      *(void *)(v11 + 16) = *(void *)(v11 - 8);
      v10 -= 24;
    }
    while (v9 > a3);
    unint64_t v8 = (char *)*((void *)a1 + 1);
  }
  uint64_t v12 = (char **)&v8[24 * a3];
  uint64_t v13 = *(const char **)a2;
  uint64_t v14 = *(void *)(a2 + 8);
  int v15 = *(const char ***)(a2 + 16);
  uint64_t v16 = strdup(v13);
  uint64_t result = sub_1000131D0(v14, v15);
  *uint64_t v12 = v16;
  v12[1] = (char *)result;
  v12[2] = v18;
  ++*a1;
  return result;
}

void *sub_100012FD0(int *a1, uint64_t a2)
{
  int v2 = a2;
  sub_100013088(*((void *)a1 + 1) + 24 * a2);
  int v4 = v2 + 1;
  int v5 = *a1;
  if (v2 + 1 < *a1)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 24 * v4;
    do
    {
      uint64_t v8 = *((void *)a1 + 1);
      uint64_t v9 = v8 + 24 * v2;
      uint64_t v10 = (long long *)(v8 + v7);
      long long v11 = *v10;
      *(void *)(v9 + 16) = *((void *)v10 + 2);
      *(_OWORD *)uint64_t v9 = v11;
      int v2 = v6++;
      int v5 = *a1;
      v7 += 24;
    }
    while (*a1 > v6);
  }
  uint64_t v12 = (void *)*((void *)a1 + 1);
  *a1 = v5 - 1;
  uint64_t result = malloc_type_realloc(v12, 24 * (v5 - 1), 0x1090040D67CC068uLL);
  *((void *)a1 + 1) = result;
  return result;
}

void sub_100013088(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
  }

  sub_1000132E4((void *)(a1 + 8));
}

void sub_1000130CC(unsigned int *a1)
{
  int v2 = (void *)*((void *)a1 + 1);
  if (v2)
  {
    if (*a1)
    {
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      do
      {
        sub_100013088(*((void *)a1 + 1) + v3);
        ++v4;
        v3 += 24;
      }
      while (v4 < *a1);
      int v2 = (void *)*((void *)a1 + 1);
    }
    free(v2);
    *(void *)a1 = 0;
    *((void *)a1 + 1) = 0;
  }
}

uint64_t sub_100013138(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char *)malloc_type_malloc(24 * a1, 0x1090040D67CC068uLL);
  if (v3)
  {
    int v5 = v4 + 16;
    uint64_t v6 = (const char ***)(a2 + 16);
    uint64_t v7 = v3;
    do
    {
      *(v5 - 2) = strdup((const char *)*(v6 - 2));
      *(v5 - 1) = sub_1000131D0(*(v6 - 1), *v6);
      *int v5 = v8;
      v5 += 3;
      v6 += 3;
      --v7;
    }
    while (v7);
  }
  return v3;
}

uint64_t sub_1000131D0(unsigned int a1, const char **a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char **)malloc_type_malloc(8 * a1, 0x10040436913F5uLL);
  if (v3)
  {
    int v5 = v4;
    uint64_t v6 = v3;
    do
    {
      uint64_t v7 = *a2++;
      *v5++ = strdup(v7);
      --v6;
    }
    while (v6);
  }
  return v3;
}

uint64_t sub_100013248(unsigned int a1, uint64_t a2, char *__s1, const char *a4)
{
  uint64_t v4 = a1;
  if (!a1) {
    return -1;
  }
  uint64_t v7 = 0;
  for (uint64_t i = (const char ***)(a2 + 16); strcmp(__s1, (const char *)*(i - 2)); i += 3)
  {
    if (v4 == ++v7) {
      return -1;
    }
  }
  if (a4)
  {
    uint64_t v9 = *((unsigned int *)i - 2);
    if (v9)
    {
      for (uint64_t j = *i; strcmp(a4, *j); ++j)
      {
        if (!--v9) {
          return -1;
        }
      }
      return v7;
    }
    return -1;
  }
  return v7;
}

void sub_1000132E4(void *a1)
{
  int v2 = (void *)a1[1];
  if (v2)
  {
    unint64_t v3 = *(unsigned int *)a1;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        uint64_t v5 = a1[1];
        uint64_t v6 = *(void **)(v5 + 8 * i);
        if (v6)
        {
          free(v6);
          *(void *)(v5 + 8 * i) = 0;
          unint64_t v3 = *(unsigned int *)a1;
        }
      }
      int v2 = (void *)a1[1];
    }
    free(v2);
    *a1 = 0;
    a1[1] = 0;
  }
}

char *sub_100013350(unsigned int *a1, const char *a2, unint64_t a3)
{
  uint64_t v6 = (void *)*((void *)a1 + 1);
  if (v6) {
    uint64_t v7 = malloc_type_realloc(v6, 8 * (*a1 + 1), 0x10040436913F5uLL);
  }
  else {
    uint64_t v7 = malloc_type_malloc(8 * (*a1 + 1), 0x10040436913F5uLL);
  }
  uint64_t v8 = v7;
  *((void *)a1 + 1) = v7;
  unint64_t v9 = *a1;
  unint64_t v10 = v9;
  if (v9 > a3)
  {
    unint64_t v11 = *a1;
    do
    {
      *(void *)(*((void *)a1 + 1) + 8 * v11) = *(void *)(*((void *)a1 + 1) + 8 * v11 - 8);
      --v11;
    }
    while (v11 > a3);
    uint64_t v8 = (void *)*((void *)a1 + 1);
    unint64_t v10 = a3;
  }
  uint64_t result = strdup(a2);
  v8[v10] = result;
  *a1 = v9 + 1;
  return result;
}

void sub_100013424(unsigned int *a1, char *__s1, const char *a3, _DWORD *a4)
{
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)a1;
  if (!*(void *)a1)
  {
LABEL_5:
    unint64_t v10 = -1;
LABEL_9:
    uint64_t v16 = 0;
    long long v15 = (unint64_t)__s1;
    if (a3) {
      sub_100013350((unsigned int *)&v15 + 2, a3, 0);
    }
    long long v13 = v15;
    uint64_t v14 = v16;
    sub_100012ECC(a1, (uint64_t)&v13, v10);
    sub_1000132E4((void *)&v15 + 1);
    if (a4) {
      *a4 = 1;
    }
    return;
  }
  unint64_t v10 = 0;
  uint64_t v11 = *((void *)a1 + 1);
  uint64_t v12 = (const char **)v11;
  while (strcmp(__s1, *v12))
  {
    ++v10;
    v12 += 3;
    if (v9 == v10) {
      goto LABEL_5;
    }
  }
  if (!a3 || sub_100013248(v8, v11, __s1, a3) != v10)
  {
    sub_100012FD0((int *)a1, v10);
    goto LABEL_9;
  }
}

uint64_t sub_10001353C(uint64_t result, char *__s1, _DWORD *a3)
{
  uint64_t v3 = *(unsigned int *)result;
  if (*(_DWORD *)result)
  {
    uint64_t v6 = (int *)result;
    uint64_t v7 = 0;
    for (unint64_t i = *(const char ***)(result + 8); ; i += 3)
    {
      uint64_t result = strcmp(__s1, *i);
      if (!result) {
        break;
      }
      v7 += (uint64_t)&_mh_execute_header;
      if (!--v3) {
        return result;
      }
    }
    if (v7 != 0xFFFFFFFF00000000)
    {
      uint64_t result = (uint64_t)sub_100012FD0(v6, v7 >> 32);
      if (a3) {
        *a3 = 1;
      }
    }
  }
  return result;
}

void hostfree(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  if (!v3) {
    uint64_t v3 = a1;
  }
  void *v3 = *a2;
  if (*a2) {
    *(void *)(*a2 + 8) = a2[1];
  }
  uint64_t v4 = (void *)a2[35];
  if (v4)
  {
    free(v4);
    a2[35] = 0;
  }
  uint64_t v5 = (void *)a2[36];
  if (v5) {
    free(v5);
  }

  free(a2);
}

_OWORD *hostadd(uint64_t a1, _OWORD *a2, char a3, uint64_t a4, char a5, _DWORD *a6, const char *a7, const char *a8)
{
  long long v15 = malloc_type_malloc(0x140uLL, 0x1030040E79DA29AuLL);
  uint64_t v16 = v15;
  if (v15)
  {
    v15[18] = 0u;
    v15[19] = 0u;
    v15[16] = 0u;
    v15[17] = 0u;
    v15[14] = 0u;
    v15[15] = 0u;
    v15[12] = 0u;
    v15[13] = 0u;
    v15[10] = 0u;
    v15[11] = 0u;
    v15[8] = 0u;
    v15[9] = 0u;
    v15[6] = 0u;
    v15[7] = 0u;
    v15[4] = 0u;
    v15[5] = 0u;
    v15[2] = 0u;
    v15[3] = 0u;
    _OWORD *v15 = 0u;
    v15[1] = 0u;
    if (a2) {
      *(_OWORD *)((char *)v15 + 296) = *a2;
    }
    *((unsigned char *)v15 + 20) = a3;
    *((unsigned char *)v15 + 21) = a5;
    __memmove_chk();
    if (a6) {
      *((_DWORD *)v16 + 4) = *a6;
    }
    if (a7) {
      *((void *)v16 + 35) = strdup(a7);
    }
    if (a8) {
      *((void *)v16 + 36) = strdup(a8);
    }
    *(void *)uint64_t v16 = *(void *)a1;
    *((void *)v16 + 1) = 0;
    if (*(void *)a1) {
      *(void *)(*(void *)a1 + 8) = v16;
    }
    *(void *)a1 = v16;
  }
  return v16;
}

void **inetroute_list_init()
{
  size_t size = 0;
  uint64_t v24 = 0;
  *(_OWORD *)long long v25 = xmmword_100014D00;
  uint64_t v26 = 1;
  if (sysctl(v25, 6u, 0, &size, 0, 0) < 0)
  {
    perror("route-sysctl-estimate");
    goto LABEL_47;
  }
  uint64_t v0 = (unsigned __int16 *)malloc_type_malloc(size, 0xA7C6D049uLL);
  if (!v0)
  {
LABEL_47:
    inetroute_list_free((void **)&v24);
    return 0;
  }
  int v1 = v0;
  if (sysctl(v25, 6u, v0, &size, 0, 0) < 0)
  {
    perror("sysctl of routing table");
    goto LABEL_46;
  }
  int v2 = (void **)malloc_type_malloc(0x18uLL, 0x1020040903548AEuLL);
  uint64_t v24 = v2;
  *((_DWORD *)v2 + 4) = -1;
  *(_DWORD *)int v2 = 0;
  uint64_t v3 = malloc_type_malloc(0x38uLL, 0x100004027586B93uLL);
  v2[1] = v3;
  if (!v3)
  {
LABEL_46:
    free(v1);
    goto LABEL_47;
  }
  if ((uint64_t)size >= 1)
  {
    unint64_t v4 = (unint64_t)v1 + size;
    int v5 = 2;
    uint64_t v6 = v1;
    do
    {
      uint64_t v7 = (unsigned __int8 *)(v6 + 46);
      int v8 = *((_DWORD *)v6 + 3);
      if (v8)
      {
        uint64_t v13 = (*v7 & 0xFC) + 4;
        if ((*v7 & 3) == 0) {
          uint64_t v13 = *v7;
        }
        if (*v7) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 4;
        }
        uint64_t v9 = &v7[v14];
        if ((v8 & 2) != 0)
        {
LABEL_9:
          uint64_t v10 = (*v9 & 0xFC) + 4;
          if ((*v9 & 3) == 0) {
            uint64_t v10 = *v9;
          }
          if (*v9) {
            uint64_t v11 = v10;
          }
          else {
            uint64_t v11 = 4;
          }
          uint64_t v12 = &v9[v11];
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v9 = (unsigned __int8 *)(v6 + 46);
        uint64_t v7 = 0;
        if ((v8 & 2) != 0) {
          goto LABEL_9;
        }
      }
      uint64_t v12 = v9;
      uint64_t v9 = 0;
LABEL_22:
      if ((v8 & 4) != 0) {
        long long v15 = v12;
      }
      else {
        long long v15 = 0;
      }
      if (v7 && (v8 & 4) != 0 && v7[1] == 2 && v9 && (v6[4] & 4) == 0)
      {
        int v16 = *(_DWORD *)v2;
        if (*(_DWORD *)v2 == v5)
        {
          v5 *= 2;
          uint64_t v17 = malloc_type_realloc(v2[1], 28 * v5, 0x100004027586B93uLL);
          v2[1] = v17;
          if (!v17) {
            goto LABEL_46;
          }
          int v16 = *(_DWORD *)v2;
        }
        else
        {
          uint64_t v17 = v2[1];
        }
        int v18 = v16;
        uint64_t v19 = (char *)&v17[7 * v16];
        *(void *)uint64_t v19 = 0;
        *((void *)v19 + 1) = 0;
        *((_DWORD *)v19 + 6) = 0;
        *((void *)v19 + 2) = 0;
        *(_DWORD *)uint64_t v19 = *((_DWORD *)v7 + 1);
        if (*v15) {
          v17[7 * v18 + 1] = *((_DWORD *)v15 + 1);
        }
        if ((*((unsigned char *)v6 + 11) & 1) == 0 && !*((_DWORD *)v7 + 1)) {
          *((_DWORD *)v2 + 4) = *(_DWORD *)v2;
        }
        uint64_t v20 = (uint64_t)&v17[7 * v18 + 2];
        long long v21 = *(_OWORD *)v9;
        if (v9[1] == 18) {
          *(_DWORD *)(v20 + 16) = *((_DWORD *)v9 + 4);
        }
        *(_OWORD *)uint64_t v20 = v21;
        ++*(_DWORD *)v2;
      }
      uint64_t v6 = (unsigned __int16 *)((char *)v6 + *v6);
    }
    while ((unint64_t)v6 < v4);
  }
  free(v1);
  return v2;
}

void inetroute_list_free(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void *)v2[1];
      if (v3)
      {
        free(v3);
        int v2 = *a1;
      }
      v2[1] = 0;
      free(*a1);
      *a1 = 0;
    }
  }
}

uint64_t inetroute_default(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if (v1 == -1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 8) + 28 * v1;
  int v3 = *(unsigned __int8 *)(v2 + 9);
  uint64_t v4 = v2 + 12;
  if (v3 == 2) {
    return v4;
  }
  else {
    return 0;
  }
}

void inetroute_list_print_cfstr(__CFString *a1, int *a2)
{
  if (*a2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)a2 + 1) + v4;
      int v7 = *(unsigned __int8 *)(v6 + 9);
      int v8 = sub_1000105E8(*(_DWORD *)v6, *(_DWORD *)(v6 + 4));
      uint64_t v9 = v8;
      if (v7 == 18)
      {
        CFStringAppendFormat(a1, 0, @"%s ==> link %d\n", v8, *(unsigned __int16 *)(v6 + 10));
      }
      else
      {
        uint64_t v10 = inet_ntop(2, (const void *)(v6 + 12), v11, 0x10u);
        CFStringAppendFormat(a1, 0, @"%s ==> %s\n", v9, v10);
      }
      ++v5;
      v4 += 28;
    }
    while (v5 < *a2);
  }
}

ssize_t sub_100013BF0(int a1, _WORD *a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, unsigned int a8, unsigned __int16 a9, void *a10, int a11)
{
  if ((byte_10001D508 & 1) == 0)
  {
    byte_10001D508 = 1;
    dword_10001D50C = arc4random();
  }
  if ((a4 == 24 || a4 == 1) && (a5 || a6 == -1))
  {
    int v20 = sub_100013FF0(a3);
    if (v20 < 0)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      int v21 = v20;
      uint64_t v39 = a3;
      if (a4 == 24)
      {
        *(void *)a2 = -1;
        a2[8] = 8;
        uint64_t v22 = (char *)(a2 + 9);
        uint64_t v23 = (char *)(a2 + 13);
        uint64_t v24 = a2 + 23;
        int v25 = 46;
      }
      else
      {
        uint64_t v22 = (char *)(a2 + 7);
        uint64_t v23 = (char *)(a2 + 11);
        uint64_t v24 = a2 + 21;
        if (a6 == -1)
        {
          int v28 = -1;
          a2[2] = -1;
        }
        else
        {
          int v28 = *(_DWORD *)a5;
          a2[2] = *(_WORD *)(a5 + 4);
        }
        *(_DWORD *)a2 = v28;
        a2[6] = 8;
        int v25 = 42;
      }
      int v29 = v25 + a11;
      memmove(v24, a10, a11);
      *(_DWORD *)uint64_t v23 = a7;
      *((_DWORD *)v23 + 1) = a6;
      *((_WORD *)v23 + 4) = 4352;
      unsigned int v30 = bswap32(a11 + 8) >> 16;
      *((_WORD *)v23 + 5) = v30;
      *((_WORD *)v22 + 10) = __rev16(a9);
      *((_WORD *)v22 + 11) = __rev16(a8);
      *((_DWORD *)v22 + 6) = (unsigned __int16)v30;
      *((_WORD *)v22 + 13) = sub_10000F384(v23, a11 + 20);
      *(void *)uint64_t v22 = 0;
      *((void *)v22 + 1) = 0;
      char *v22 = 69;
      *((_DWORD *)v22 + 2) = 4607;
      *((_DWORD *)v22 + 3) = a7;
      *((_DWORD *)v22 + 4) = a6;
      *((_WORD *)v22 + 1) = bswap32(a11 + 28) >> 16;
      unsigned int v31 = dword_10001D50C++;
      *((_WORD *)v22 + 2) = bswap32(v31) >> 16;
      *((_WORD *)v22 + 5) = sub_10000F384(v22, 20);
      ssize_t v19 = sub_10000BDDC(v21, a2, v29);
      if ((v19 & 0x80000000) != 0)
      {
        sub_100014334();
        _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          uint64_t v32 = _os_log_pack_size();
          __chkstk_darwin(v32, v33);
          __error();
          uint64_t v34 = _os_log_pack_fill();
          uint64_t v35 = __error();
          CFIndex v36 = strerror(*v35);
          int v37 = *__error();
          *(_DWORD *)uint64_t v34 = 136315650;
          *(void *)(v34 + 4) = v39;
          *(_WORD *)(v34 + 12) = 2080;
          *(void *)(v34 + 14) = v36;
          *(_WORD *)(v34 + 22) = 1024;
          *(_DWORD *)(v34 + 24) = v37;
          __SC_log_send();
        }
      }
      sub_10000BBC8(v21);
    }
  }
  else if (a1 < 0)
  {
    sub_100014334();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v26 = _os_log_pack_size();
      __chkstk_darwin(v26, v27);
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
    }
    return 0;
  }
  else
  {
    *(void *)&v40.sa_data[6] = 0;
    *(_WORD *)&v40.sa_len = 528;
    *(_WORD *)v40.sa_data = __rev16(a8);
    *(_DWORD *)&v40.sa_data[2] = a6;
    if (sendto(a1, a10, a11, 0, &v40, 0x10u) >= a11) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return v19;
}

uint64_t sub_100013FF0(uint64_t a1)
{
  uint64_t v2 = sub_10000BBD8();
  uint64_t v3 = v2;
  if ((v2 & 0x80000000) != 0)
  {
    sub_100014334();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      uint64_t v10 = _os_log_pack_size();
      __chkstk_darwin(v10, v11);
      __error();
      uint64_t v12 = _os_log_pack_fill();
      uint64_t v13 = __error();
      uint64_t v14 = strerror(*v13);
      int v15 = *__error();
      *(_DWORD *)uint64_t v12 = 136315394;
      *(void *)(v12 + 4) = v14;
      *(_WORD *)(v12 + 12) = 1024;
      *(_DWORD *)(v12 + 14) = v15;
      __SC_log_send();
    }
  }
  else
  {
    if ((sub_10000BD68(v2) & 0x80000000) != 0)
    {
      sub_100014334();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        uint64_t v16 = _os_log_pack_size();
        __chkstk_darwin(v16, v17);
        __error();
        uint64_t v18 = _os_log_pack_fill();
        ssize_t v19 = __error();
        int v20 = strerror(*v19);
        int v21 = *__error();
        *(_DWORD *)uint64_t v18 = 136315394;
        *(void *)(v18 + 4) = v20;
        *(_WORD *)(v18 + 12) = 1024;
        *(_DWORD *)(v18 + 14) = v21;
        __SC_log_send();
      }
      goto LABEL_11;
    }
    if ((sub_10000BCE4(v3) & 0x80000000) != 0)
    {
      if (*__error() != 6)
      {
        sub_100014334();
        _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          uint64_t v4 = _os_log_pack_size();
          __chkstk_darwin(v4, v5);
          __error();
          uint64_t v6 = _os_log_pack_fill();
          int v7 = __error();
          int v8 = strerror(*v7);
          int v9 = *__error();
          *(_DWORD *)uint64_t v6 = 136315650;
          *(void *)(v6 + 4) = a1;
          *(_WORD *)(v6 + 12) = 2080;
          *(void *)(v6 + 14) = v8;
          *(_WORD *)(v6 + 22) = 1024;
          *(_DWORD *)(v6 + 24) = v9;
          __SC_log_send();
        }
      }
LABEL_11:
      sub_10000BBC8(v3);
      return 0xFFFFFFFFLL;
    }
  }
  return v3;
}

uint64_t sub_100014334()
{
  return qword_10001D510;
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

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return _CFDataCreateCopy(allocator, theData);
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

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
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

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
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

Boolean SCDynamicStoreAddTemporaryValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return _SCDynamicStoreAddTemporaryValue(store, key, value);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions(CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreateWithOptions(allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreRemoveValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreRemoveValue(store, key);
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
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

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_pack_fill()
{
  return __os_log_pack_fill();
}

uint64_t _os_log_pack_size()
{
  return __os_log_pack_size();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return _bsearch(__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dup2(int a1, int a2)
{
  return _dup2(a1, a2);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return _ether_aton(a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return _ether_ntoa(a1);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fgetc(FILE *a1)
{
  return _fgetc(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

pid_t fork(void)
{
  return _fork();
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

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
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

int res_9_init(void)
{
  return _res_9_init();
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
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

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
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

size_t strspn(const char *__s, const char *__charset)
{
  return _strspn(__s, __charset);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}