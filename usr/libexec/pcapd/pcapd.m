void start()
{
  uint64_t v0;
  const char *v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  CFStringRef v5;
  const char *v6;
  uint32_t v7;
  int v8;
  NSObject *v9;
  uint32_t v10;
  uint32_t v11;
  FILE *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void v22[4];
  int v23;
  void handler[4];
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint32_t v33;
  void **v34;
  uint64_t v35;
  intptr_t (*v36)(uint64_t, uint64_t);
  void *v37;
  dispatch_semaphore_t v38;

  if (sub_100005CDC("com.apple.pcapd"))
  {
    qword_10000C048 = (uint64_t)dispatch_workloop_create_inactive("com.apple.pcapd");
    if (!qword_10000C048)
    {
      fprintf(__stderrp, "%s:%d dispatch_queue_create() failed: main queue\n", "main", 180);
      v0 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136315394;
      v27 = "main";
      v28 = 1024;
      v29 = 180;
      v1 = "%s:%d dispatch_queue_create() failed: main queue";
      goto LABEL_18;
    }
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)qword_10000C048);
    v2 = dispatch_semaphore_create(0);
    if (!v2)
    {
      fprintf(__stderrp, "%s:%d dispatch_semaphore_create() failed\n", "main", 255);
      v0 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136315394;
      v27 = "main";
      v28 = 1024;
      v29 = 255;
      v1 = "%s:%d dispatch_semaphore_create() failed";
      goto LABEL_18;
    }
    v3 = v2;
    v34 = _NSConcreteStackBlock;
    v35 = 0x40000000;
    v36 = sub_100003EAC;
    v37 = &unk_100008238;
    v38 = v2;
    if (lockdown_checkin_xpc())
    {
      fprintf(__stderrp, "%s:%d failure to secure checkin with the lockdown service\n", "main", 265);
      v0 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136315394;
      v27 = "main";
      v28 = 1024;
      v29 = 265;
      v1 = "%s:%d failure to secure checkin with the lockdown service";
      goto LABEL_18;
    }
    v4 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v3, v4))
    {
      fprintf(__stderrp, "%s:%d Timed out waiting for the service to checkin in.\n", "main", 270);
      v0 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136315394;
      v27 = "main";
      v28 = 1024;
      v29 = 270;
      v1 = "%s:%d Timed out waiting for the service to checkin in.";
      goto LABEL_18;
    }
    dispatch_release(v3);
    v5 = (const __CFString *)kLockdownNotificationHostDetached;
    v6 = sub_100003EBC(kLockdownNotificationHostDetached);
    v7 = notify_register_dispatch(v6, (int *)&unk_10000C058, (dispatch_queue_t)qword_10000C048, &stru_100008278);
    if (v7)
    {
      v11 = v7;
      v12 = __stderrp;
      v13 = sub_100003EBC(v5);
      fprintf(v12, "%s:%d failed to setup notification for %s: %d\n", "main", 288, v13, v11);
      v14 = qword_10000D090;
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v27 = "main";
        v28 = 1024;
        v29 = 288;
        v30 = 2080;
        v31 = sub_100003EBC(v5);
        v32 = 1024;
        v33 = v11;
        v1 = "%s:%d failed to setup notification for %s: %d";
        v9 = v14;
        v10 = 34;
        goto LABEL_19;
      }
    }
    else
    {
      v8 = sub_100004210();
      if (v8 == -1)
      {
        fprintf(__stderrp, "%s:%d failure to kernel control socket\n", "main", 295);
        v0 = qword_10000D090;
        if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136315394;
        v27 = "main";
        v28 = 1024;
        v29 = 295;
        v1 = "%s:%d failure to kernel control socket";
        goto LABEL_18;
      }
      v15 = v8;
      v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v8, 0, (dispatch_queue_t)qword_10000C048);
      qword_10000C060 = (uint64_t)v16;
      if (v16)
      {
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 0x40000000;
        handler[2] = sub_100004A08;
        handler[3] = &unk_100008298;
        v25 = v15;
        dispatch_source_set_event_handler(v16, handler);
        dispatch_resume((dispatch_object_t)qword_10000C060);
        v17 = 30;
        v18 = &dword_100000004;
        while (1)
        {
          signal(v17, (void (__cdecl *)(int))1);
          v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v17, 0, (dispatch_queue_t)qword_10000C048);
          if (!v19) {
            break;
          }
          v20 = v19;
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 0x40000000;
          v22[2] = sub_100004EFC;
          v22[3] = &unk_1000082B8;
          v23 = v17;
          dispatch_source_set_event_handler(v19, v22);
          dispatch_resume(v20);
          v17 = *(_DWORD *)((char *)&unk_100007160 + v18);
          v18 += 4;
          if (v18 == 32) {
            dispatch_main();
          }
        }
        fprintf(__stderrp, "%s:%d dispatch_source_create(%d) failed\n", "main", 431, v17);
        v21 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v27 = "main";
          v28 = 1024;
          v29 = 431;
          v30 = 1024;
          LODWORD(v31) = v17;
          v1 = "%s:%d dispatch_source_create(%d) failed";
          v9 = v21;
          v10 = 24;
          goto LABEL_19;
        }
      }
      else
      {
        fprintf(__stderrp, "%s:%d dispatch_source_create() for DISPATCH_SOURCE_TYPE_READ failed.\n", "main", 415);
        v0 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "main";
          v28 = 1024;
          v29 = 415;
          v1 = "%s:%d dispatch_source_create() for DISPATCH_SOURCE_TYPE_READ failed.";
LABEL_18:
          v9 = v0;
          v10 = 18;
LABEL_19:
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v1, buf, v10);
        }
      }
    }
  }
LABEL_20:
  exit(1);
}

intptr_t sub_100003EAC(uint64_t a1, uint64_t a2)
{
  qword_10000C050 = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

const char *sub_100003EBC(const __CFString *a1)
{
  if (!a1) {
    return "<NULL>";
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFStringGetTypeID())
  {
    CFTypeID v7 = CFGetTypeID(a1);
    if (v7 == CFDataGetTypeID())
    {
      CFStringRef v8 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)a1, 0x8000100u);
      if (!v8) {
        goto LABEL_15;
      }
    }
    else
    {
      CFStringRef v8 = CFCopyDescription(a1);
      if (!v8) {
        goto LABEL_15;
      }
    }
    CFStringRef v9 = v8;
    if (CFStringGetCString(v8, &byte_10000C080[1024 * (uint64_t)dword_10000D080], 1024, 0x8000100u))
    {
      CStringPtr = &byte_10000C080[1024 * (uint64_t)dword_10000D080];
      if (dword_10000D080 <= 2) {
        int v10 = dword_10000D080 + 1;
      }
      else {
        int v10 = 0;
      }
      dword_10000D080 = v10;
    }
    else
    {
      CStringPtr = 0;
    }
    CFRelease(v9);
    goto LABEL_24;
  }
  CFStringEncoding FastestEncoding = CFStringGetFastestEncoding(a1);
  if (!FastestEncoding || FastestEncoding == 134217984 || FastestEncoding == 1536)
  {
    CStringPtr = CFStringGetCStringPtr(a1, FastestEncoding);
    if (CStringPtr) {
      goto LABEL_24;
    }
  }
  if (CFStringGetCString(a1, &byte_10000C080[1024 * (uint64_t)dword_10000D080], 1024, 0x8000100u))
  {
    CStringPtr = &byte_10000C080[1024 * (uint64_t)dword_10000D080];
    if (dword_10000D080 <= 2) {
      int v5 = dword_10000D080 + 1;
    }
    else {
      int v5 = 0;
    }
    dword_10000D080 = v5;
    goto LABEL_24;
  }
LABEL_15:
  CStringPtr = 0;
LABEL_24:
  if (CStringPtr) {
    return CStringPtr;
  }
  else {
    return "???";
  }
}

void sub_100004034(id a1, int a2)
{
  if (qword_10000C060)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10000C060);
    if (qword_10000C060)
    {
      dispatch_release((dispatch_object_t)qword_10000C060);
      qword_10000C060 = 0;
    }
  }
  sub_1000040FC();
  fprintf(__stdoutp, "%s:%d Device was detached from host, exiting\n", "main_block_invoke", 284);
  CFTypeID v2 = qword_10000D090;
  if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v4 = "main_block_invoke";
    __int16 v5 = 1024;
    int v6 = 284;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Device was detached from host, exiting", buf, 0x12u);
  }
  exit(1);
}

void sub_1000040FC()
{
  if (qword_10000D088)
  {
    fprintf(__stdoutp, "%s:%d cleanup %s\n", "cleanup_pktap", 605, (const char *)qword_10000D088);
    v0 = qword_10000D090;
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      CFTypeID v2 = "cleanup_pktap";
      __int16 v3 = 1024;
      int v4 = 605;
      __int16 v5 = 2080;
      uint64_t v6 = qword_10000D088;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s:%d cleanup %s", buf, 0x1Cu);
    }
    pcap_cleanup_pktap_interface();
    if (qword_10000D088)
    {
      free((void *)qword_10000D088);
      qword_10000D088 = 0;
    }
  }
}

uint64_t sub_100004210()
{
  memset(v51, 0, 32);
  int v40 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  qword_10000D088 = pcap_setup_pktap_interface();
  if (qword_10000D088)
  {
    snprintf(__str, 0x13uLL, "/dev/bpf%d", 0);
    uint64_t v0 = open(__str, 0);
    if (v0 == -1)
    {
      int v1 = 1;
      while (*__error() == 16)
      {
        snprintf(__str, 0x13uLL, "/dev/bpf%d", v1);
        uint64_t v2 = open(__str, 0);
        ++v1;
        if (v2 != -1)
        {
          uint64_t v0 = v2;
          goto LABEL_7;
        }
      }
      v12 = __stderrp;
      v13 = __error();
      v14 = strerror(*v13);
      fprintf(v12, "%s:%d open(%s) - %s\n", "pcapd_open_bpf_device", 476, __str, v14);
      v15 = qword_10000D090;
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
        sub_100006634((uint64_t)__str, v15);
      }
    }
    else
    {
LABEL_7:
      if (dword_10000D098 >= 1)
      {
        fprintf(__stdoutp, "%s:%d intended bpf buffer size: %u\n", "pcapd_open_bpf_device", 486, dword_10000C000);
        __int16 v3 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG)) {
          sub_100006590(v3);
        }
      }
      if (ioctl(v0, 0xC0044266uLL, &dword_10000C000) < 0)
      {
        CFStringRef v9 = __stderrp;
        int v10 = __error();
        v11 = strerror(*v10);
        fprintf(v9, "%s:%d ioctl(BIOCSBLEN) - %s\n", "pcapd_open_bpf_device", 488, v11);
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
          sub_100005FDC();
        }
      }
      else if (ioctl(v0, 0x40044266uLL, &dword_10000C000) < 0)
      {
        v16 = __stderrp;
        v17 = __error();
        v18 = strerror(*v17);
        fprintf(v16, "%s:%d ioctl(BIOCGBLEN) - %s\n", "pcapd_open_bpf_device", 492, v18);
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
          sub_100006070();
        }
      }
      else
      {
        if (dword_10000D098 >= 1)
        {
          fprintf(__stdoutp, "%s:%d final bpf buffer size: %u\n", "pcapd_open_bpf_device", 495, dword_10000C000);
          int v4 = qword_10000D090;
          if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG)) {
            sub_1000064EC(v4);
          }
        }
        uint64_t v5 = dword_10000C000;
        if (!dword_10000C000) {
          sub_100006104((char **)buf);
        }
        uint64_t v6 = malloc_type_malloc(dword_10000C000, 0x5CED6262uLL);
        if (!v6) {
          sub_100006138((char **)buf, v5);
        }
        qword_10000C068 = (uint64_t)v6;
        int v40 = 1;
        if (ioctl(v0, 0xC004427FuLL, &v40) < 0)
        {
          v19 = __stderrp;
          v20 = __error();
          v21 = strerror(*v20);
          fprintf(v19, "%s:%d ioctl(BIOCSWANTPKTAP) - %s\n", "pcapd_open_bpf_device", 506, v21);
          if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
            sub_100006174();
          }
        }
        else
        {
          __strlcpy_chk();
          if (ioctl(v0, 0x8020426CuLL, v51) == -1)
          {
            v22 = __stderrp;
            v23 = __error();
            v24 = strerror(*v23);
            fprintf(v22, "%s:%d ioctl(BIOCSETIF) - %s\n", "pcapd_open_bpf_device", 515, v24);
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
              sub_100006208();
            }
          }
          else
          {
            int v40 = 149;
            if (ioctl(v0, 0x80044278uLL, &v40) == -1)
            {
              v25 = __stderrp;
              v26 = __error();
              v27 = strerror(*v26);
              fprintf(v25, "%s:%d ioctl(BIOCSDLT) - %s\n", "pcapd_open_bpf_device", 524, v27);
              if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
                sub_10000629C();
              }
            }
            else
            {
              uint64_t v38 = 1;
              LODWORD(v39) = 0;
              if (ioctl(v0, 0x8010426DuLL, &v38) == -1)
              {
                v28 = __stderrp;
                v29 = __error();
                v30 = strerror(*v29);
                fprintf(v28, "%s:%d ioctl(BIOCSRTIMEOUT) - %s\n", "pcapd_open_bpf_device", 534, v30);
                if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
                  sub_100006330();
                }
              }
              else
              {
                int v7 = fcntl(v0, 3, 0);
                if (v7 == -1)
                {
                  v31 = __stderrp;
                  v32 = __error();
                  v33 = strerror(*v32);
                  fprintf(v31, "%s:%d fcntl(F_GETFL) - %s\n", "pcapd_open_bpf_device", 543, v33);
                  if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
                    sub_1000063C4();
                  }
                }
                else
                {
                  if ((v7 & 4) != 0 || fcntl(v0, 4, v7 | 4u) != -1)
                  {
                    fprintf(__stdoutp, "%s:%d taping %s over %s\n", "pcapd_open_bpf_device", 554, (const char *)qword_10000D088, __str);
                    CFStringRef v8 = qword_10000D090;
                    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315906;
                      v42 = "pcapd_open_bpf_device";
                      __int16 v43 = 1024;
                      int v44 = 554;
                      __int16 v45 = 2080;
                      uint64_t v46 = qword_10000D088;
                      __int16 v47 = 2080;
                      v48 = __str;
                      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d taping %s over %s", buf, 0x26u);
                    }
                    return v0;
                  }
                  v34 = __stderrp;
                  v35 = __error();
                  v36 = strerror(*v35);
                  fprintf(v34, "%s:%d fcntl(F_SETFL) - %s\n", "pcapd_open_bpf_device", 549, v36);
                  if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
                    sub_100006458();
                  }
                }
              }
            }
          }
        }
      }
      close(v0);
    }
  }
  else
  {
    fprintf(__stderrp, "%s:%d pcap_setup_pktap_interface() fail - %s\n", "pcapd_open_bpf_device", 462, v49);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_100005F54();
    }
  }
  if (qword_10000C068)
  {
    free((void *)qword_10000C068);
    qword_10000C068 = 0;
  }
  sub_1000040FC();
  return 0xFFFFFFFFLL;
}

uint64_t sub_100004A08(uint64_t a1)
{
  do
  {
LABEL_1:
    while (1)
    {
      uint64_t result = read(*(_DWORD *)(a1 + 32), (void *)qword_10000C068, dword_10000C000);
      if (result == -1) {
        break;
      }
      if (!result) {
        return result;
      }
      if (result >= 1)
      {
        unint64_t v2 = qword_10000C068;
        unint64_t v3 = qword_10000C068 + result;
        while (1)
        {
          long long v35 = 0u;
          memset(v36, 0, 19);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          if (v2 + 176 > v3) {
            break;
          }
          int v4 = (_DWORD *)(v2 + *(unsigned __int16 *)(v2 + 16));
          uint64_t v5 = (char *)v4 + *v4;
          sub_1000058E8((uint64_t)v4);
          sub_100005A28((uint64_t)v5, (*(_DWORD *)(v2 + 8) - *v4));
          sub_100005470((int *)v2, (uint64_t)&v31);
          sub_100005154((uint64_t)&v31);
          uint64_t v6 = *(unsigned int *)(v2 + 8) - (unint64_t)*v4 + 99;
          uint64_t v7 = qword_10000C078;
          if (v6 > qword_10000C070)
          {
            CFStringRef v8 = reallocf((void *)qword_10000C078, *(unsigned int *)(v2 + 8) - (unint64_t)*v4 + 99);
            if (!v8) {
              sub_1000066F0((char **)buf, v6);
            }
            uint64_t v7 = (uint64_t)v8;
            qword_10000C078 = (uint64_t)v8;
            qword_10000C070 = v6;
          }
          long long v9 = v31;
          long long v10 = v33;
          *(_OWORD *)(v7 + 16) = v32;
          *(_OWORD *)(v7 + 32) = v10;
          *(_OWORD *)uint64_t v7 = v9;
          long long v11 = v34;
          long long v12 = v35;
          long long v13 = v36[0];
          *(_DWORD *)(v7 + 95) = *(_DWORD *)((char *)v36 + 15);
          *(_OWORD *)(v7 + 64) = v12;
          *(_OWORD *)(v7 + 80) = v13;
          *(_OWORD *)(v7 + 48) = v11;
          memcpy((void *)(v7 + 99), v5, (*(_DWORD *)(v2 + 8) - *v4));
          CFDataRef v14 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)v7, v6, kCFAllocatorNull);
          if (!v14)
          {
            fprintf(__stderrp, "%s:%d unable to allocate memory for packet\n", "main_block_invoke", 368);
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
              sub_10000672C();
            }
            lockdown_disconnect();
            goto LABEL_26;
          }
          CFDataRef v15 = v14;
          if (dword_10000D098 >= 1)
          {
            v16 = __stdoutp;
            CFIndex Length = CFDataGetLength(v14);
            fprintf(v16, "%s:%d sending remote packet to host with payload size: %ld\n", "main_block_invoke", 377, Length);
            v18 = qword_10000D090;
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
            {
              CFIndex v19 = CFDataGetLength(v15);
              *(_DWORD *)buf = 136315650;
              v26 = "main_block_invoke";
              __int16 v27 = 1024;
              int v28 = 377;
              __int16 v29 = 2048;
              CFIndex v30 = v19;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s:%d sending remote packet to host with payload size: %ld", buf, 0x1Cu);
            }
          }
          if (lockdown_send_message())
          {
            fprintf(__stderrp, "%s:%d unable to send packet\n", "main_block_invoke", 382);
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
              sub_1000067B8();
            }
            lockdown_disconnect();
            sub_1000040FC();
            CFRelease(v15);
            goto LABEL_30;
          }
          CFRelease(v15);
          v2 += (*(_DWORD *)(v2 + 8) + *(unsigned __int16 *)(v2 + 16) + 3) & 0x1FFFFFFFCLL;
          if (v2 >= v3) {
            goto LABEL_1;
          }
        }
        fprintf(__stdoutp, "%s:%d not enough space for bpf and pktap headers\n", "main_block_invoke", 335);
        v20 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "main_block_invoke";
          __int16 v27 = 1024;
          int v28 = 335;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d not enough space for bpf and pktap headers", buf, 0x12u);
        }
      }
    }
  }
  while (*__error() == 4);
  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result != 35)
  {
    v21 = __stderrp;
    v22 = __error();
    v23 = strerror(*v22);
    fprintf(v21, "%s:%d read bpf %s\n", "main_block_invoke", 311, v23);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_100006844();
    }
LABEL_26:
    close(*(_DWORD *)(a1 + 32));
    sub_1000040FC();
LABEL_30:
    exit(1);
  }
  return result;
}

void sub_100004EFC(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 0x1F)
  {
    if (((1 << v1) & 0xE248) == 0)
    {
      if (v1 == 30)
      {
        int v4 = dword_10000D098;
        if (dword_10000D098 == 0x7FFFFFFF) {
          return;
        }
        ++dword_10000D098;
        fprintf(__stdoutp, "%s:%d pcapd verbosity now %d\n", "handle_signal", 577, v4 + 1);
        unint64_t v3 = qword_10000D090;
        if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v6 = "handle_signal";
        __int16 v7 = 1024;
        int v8 = 577;
        __int16 v9 = 1024;
        int v10 = dword_10000D098;
      }
      else
      {
        if (v1 != 31) {
          return;
        }
        int v2 = dword_10000D098 - 1;
        if (dword_10000D098 < 1) {
          return;
        }
        --dword_10000D098;
        fprintf(__stdoutp, "%s:%d pcapd verbosity now %d\n", "handle_signal", 583, v2);
        unint64_t v3 = qword_10000D090;
        if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v6 = "handle_signal";
        __int16 v7 = 1024;
        int v8 = 583;
        __int16 v9 = 1024;
        int v10 = dword_10000D098;
      }
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d pcapd verbosity now %d", buf, 0x18u);
      return;
    }
    sub_1000040FC();
  }
}

void sub_100005134(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

int8x8_t sub_100005154(uint64_t a1)
{
  *(_DWORD *)a1 = bswap32(*(_DWORD *)a1);
  *(_DWORD *)(a1 + 5) = bswap32(*(_DWORD *)(a1 + 5));
  *(int8x8_t *)(a1 + 13) = vrev32_s8(*(int8x8_t *)(a1 + 13));
  *(_DWORD *)(a1 + 21) = bswap32(*(_DWORD *)(a1 + 21));
  *(_WORD *)(a1 + 10) = bswap32(*(unsigned __int16 *)(a1 + 10)) >> 16;
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 87));
  *(int8x8_t *)(a1 + 87) = result;
  *(_DWORD *)(a1 + 95) = bswap32(*(_DWORD *)(a1 + 95));
  return result;
}

uint64_t sub_1000051B0(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    fprintf(__stderrp, "%s:%d iptap_hdr == NULL\n", "rvi_iptap_to_pktap", 58);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_1000068D8();
    }
    errx(5, "iptap_hdr == NULL");
  }
  if (!a2)
  {
    fprintf(__stderrp, "%s:%d pktap_hdr == NULL\n", "rvi_iptap_to_pktap", 63);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_100006958();
    }
    errx(5, "pktap_hdr == NULL");
  }
  *(_OWORD *)(a2 + 140) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(void *)a2 = 0x10000009CLL;
  unsigned int v4 = *(unsigned __int8 *)(a1 + 9);
  int v5 = 1;
  if (v4 > 0x36)
  {
    if (*(unsigned __int8 *)(a1 + 9) > 0xD0u)
    {
      if (v4 == 209) {
        goto LABEL_22;
      }
      if (v4 != 255) {
        goto LABEL_20;
      }
    }
    else if (v4 != 55 && v4 != 57)
    {
      goto LABEL_20;
    }
LABEL_21:
    int v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned __int8 *)(a1 + 9) <= 0x16u)
  {
    if (v4 != 1)
    {
      if (v4 == 6) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    if (strcmp((const char *)(a1 + 25), "utun") && strcmp((const char *)(a1 + 25), "ipsec"))
    {
LABEL_20:
      int v5 = 12;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v4 != 23)
  {
    if (v4 != 24) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  int v5 = 9;
LABEL_22:
  *(_DWORD *)(a2 + 8) = v5;
  snprintf((char *)(a2 + 12), 0x18uLL, "%s%u", (const char *)(a1 + 25), *(unsigned __int16 *)(a1 + 10));
  int v6 = *(unsigned __int8 *)(a1 + 12);
  if (v6 == 1)
  {
    int v7 = 2;
  }
  else if (v6 == 16)
  {
    int v7 = 1;
  }
  else
  {
    int v7 = *(_DWORD *)(a2 + 36);
  }
  *(_DWORD *)(a2 + 36) = v7 | *(_DWORD *)(a1 + 95);
  *(void *)(a2 + 40) = *(void *)(a1 + 13);
  int v8 = *(_DWORD *)(a1 + 21);
  *(_DWORD *)(a2 + 76) = *(_DWORD *)(a1 + 62);
  int v9 = *(_DWORD *)(a1 + 41);
  *(_DWORD *)(a2 + 48) = v8;
  *(_DWORD *)(a2 + 52) = v9;
  uint64_t result = __strlcpy_chk();
  int v11 = *(_DWORD *)(a1 + 66);
  if (v11 == -1 || v11 == *(_DWORD *)(a1 + 41))
  {
    *(_DWORD *)(a2 + 84) = -1;
  }
  else
  {
    *(_DWORD *)(a2 + 36) |= 4u;
    *(_DWORD *)(a2 + 84) = v11;
    uint64_t result = __strlcpy_chk();
  }
  int v12 = *(_DWORD *)(a1 + 87);
  int v13 = *(_DWORD *)(a1 + 91);
  if (*(void *)(a1 + 87))
  {
    *(_DWORD *)(a2 + 36) |= 0x2000u;
    *(_DWORD *)(a2 + 116) = v12;
    *(_DWORD *)(a2 + 120) = v13;
  }
  *(_WORD *)(a2 + 80) = *(unsigned __int8 *)(a1 + 9);
  *(_WORD *)(a2 + 82) = *(_WORD *)(a1 + 10);
  return result;
}

void sub_100005470(int *a1, uint64_t a2)
{
  if (!a1)
  {
    fprintf(__stderrp, "%s:%d bpfhdr == NULL\n", "rvi_bpf_to_iptap", 140);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_1000069D8();
    }
    errx(5, "bpfhdr == NULL");
  }
  if (!a2)
  {
    fprintf(__stderrp, "%s:%d iptap_hdr == NULL\n", "rvi_bpf_to_iptap", 145);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_100006A58();
    }
    errx(5, "iptap_hdr == NULL");
  }
  uint64_t v4 = (uint64_t)a1 + *((unsigned __int16 *)a1 + 8);
  *(_DWORD *)a2 = 99;
  *(unsigned char *)(a2 + 4) = 2;
  *(_DWORD *)(a2 + 5) = a1[2] - *(_DWORD *)v4;
  *(unsigned char *)(a2 + 9) = *(unsigned char *)(v4 + 80);
  int v5 = *(_DWORD *)(v4 + 36);
  if (v5)
  {
    char v6 = 16;
  }
  else
  {
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    char v6 = 1;
  }
  *(unsigned char *)(a2 + 12) = v6;
LABEL_8:
  *(_DWORD *)(a2 + 95) = v5;
  *(_DWORD *)(a2 + 13) = *(_DWORD *)(v4 + 40);
  if (*(_DWORD *)(v4 + 8)) {
    int v7 = *(_DWORD *)(v4 + 44);
  }
  else {
    int v7 = 4;
  }
  *(_DWORD *)(a2 + 17) = v7;
  int v8 = *(_DWORD *)(v4 + 52);
  *(_DWORD *)(a2 + 21) = *(_DWORD *)(v4 + 48);
  *(_DWORD *)(a2 + 41) = v8;
  __strlcpy_chk();
  *(_DWORD *)(a2 + 62) = *(_DWORD *)(v4 + 76);
  *(_DWORD *)(a2 + 66) = *(_DWORD *)(v4 + 84);
  __strlcpy_chk();
  int v9 = *(_DWORD *)(v4 + 116);
  int v10 = *(_DWORD *)(v4 + 120);
  if (*(void *)(v4 + 116) || (int v9 = *a1, v10 = a1[1], *(void *)a1))
  {
    *(_DWORD *)(a2 + 95) |= 0x2000u;
    *(_DWORD *)(a2 + 87) = v9;
    *(_DWORD *)(a2 + 91) = v10;
  }
  int v11 = strpbrk((char *)(v4 + 12), "0123456789");
  if (v11)
  {
    int v12 = v11;
    *(_WORD *)(a2 + 10) = atoi(v11);
    char *v12 = 0;
    __strlcpy_chk();
  }
  else
  {
    fprintf(__stderrp, "%s:%d no unit number in %s\n", "rvi_bpf_to_iptap", 193, (const char *)(v4 + 12));
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_100006AD8();
    }
    *(_WORD *)(a2 + 10) = 0;
  }
}

void sub_1000056EC(uint64_t a1)
{
  if (dword_10000D098 >= 2)
  {
    sub_100005854(v3, *(_DWORD *)(a1 + 95));
    int v2 = "input";
    if (*(unsigned char *)(a1 + 12) == 1) {
      int v2 = "output";
    }
    snprintf(__str, 0x100uLL, "iptap: %s hdr_length: %d length: %d frame_pre_length: %dframe_pst_length: %d version: %d type: %d ifname: %s%d process %s.%d svc %d tstamp %d.%d flags 0x%x (%s)", v2, *(_DWORD *)a1, *(_DWORD *)(a1 + 5), *(_DWORD *)(a1 + 17), *(_DWORD *)(a1 + 21), *(unsigned __int8 *)(a1 + 4), *(unsigned __int8 *)(a1 + 9), (const char *)(a1 + 25), *(unsigned __int16 *)(a1 + 10), (const char *)(a1 + 45), *(_DWORD *)(a1 + 41), *(_DWORD *)(a1 + 62), *(_DWORD *)(a1 + 87), *(_DWORD *)(a1 + 91), *(_DWORD *)(a1 + 95),
      v3);
    if (dword_10000D098 >= 1)
    {
      fprintf(__stdoutp, "%s:%d %s\n", "rvi_log_iptap_header", 256, __str);
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG)) {
        sub_100006B60();
      }
    }
  }
}

uint64_t sub_100005854(char *a1, unsigned int a2)
{
  uint64_t v2 = 0;
  v5[0] = 0;
  unint64_t v3 = v5;
  do
  {
    if ((a2 >> v2)) {
      *(_WORD *)v3++ = aIopiTnrksc2w[v2];
    }
    ++v2;
  }
  while (v2 != 32);
  return snprintf(a1, 0x21uLL, "%s", v5);
}

void sub_1000058E8(uint64_t a1)
{
  if (dword_10000D098 >= 2)
  {
    sub_100005854(v2, *(_DWORD *)(a1 + 36));
    snprintf(__str, 0x100uLL, "pktap length %u type_next %u dlt %u ifname %s iftype %u flags 0x%x (%s) proto_fam %u prelen %u postlen %u pid %u comm %s svc %u epid %u ecomm %s ", *(_DWORD *)a1, *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), (const char *)(a1 + 12), *(unsigned __int16 *)(a1 + 80), *(_DWORD *)(a1 + 36), v2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), (const char *)(a1 + 56), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 84), (const char *)(a1 + 88));
    if (dword_10000D098 >= 1)
    {
      fprintf(__stdoutp, "%s:%d %s\n", "rvi_log_pktap_header", 286, __str);
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG)) {
        sub_100006BE8();
      }
    }
  }
}

void sub_100005A28(uint64_t a1, unint64_t a2)
{
  if (dword_10000D098 >= 3 && a2 != 0)
  {
    unint64_t v4 = 0;
    unint64_t v5 = 16;
    do
    {
      unint64_t v25 = v5;
      if (a2 >= v5) {
        unint64_t v6 = v5;
      }
      else {
        unint64_t v6 = a2;
      }
      int v7 = snprintf(__str, 0x63uLL, "\t0x%04lx:  ", v4);
      uint64_t v8 = v7;
      unint64_t v9 = v4 + 16;
      if (v4 == -16)
      {
        uint64_t v10 = v7;
      }
      else
      {
        uint64_t v11 = 0;
        do
        {
          if (v4 + v11 >= a2)
          {
            char v16 = 32;
            __str[v8] = 32;
          }
          else
          {
            unsigned int v12 = *(unsigned __int8 *)(a1 + v4 + v11);
            int v13 = (v12 >> 4) + 87;
            if (v12 < 0xA0) {
              LOBYTE(v13) = (*(unsigned char *)(a1 + v4 + v11) >> 4) | 0x30;
            }
            __str[v8] = v13;
            unsigned int v14 = v12 & 0xF;
            char v15 = v12 & 0xF | 0x30;
            char v16 = (v12 & 0xF) + 87;
            if (v14 < 0xA) {
              char v16 = v15;
            }
          }
          __str[v8 + 1] = v16;
          uint64_t v10 = v8 + 2;
          if (((_BYTE)v4 + (_BYTE)v11))
          {
            __str[v10] = 32;
            uint64_t v10 = v8 + 3;
          }
          if (v11 == 15) {
            __str[v10++] = 32;
          }
          ++v11;
          uint64_t v8 = v10;
        }
        while (v4 + v11 < v9);
      }
      *(_WORD *)&__str[v10] = 8224;
      uint64_t v17 = v10 + 2;
      if (v9 >= a2) {
        unint64_t v18 = a2;
      }
      else {
        unint64_t v18 = v4 + 16;
      }
      if (v4 < v18)
      {
        uint64_t v19 = a1;
        do
        {
          uint64_t v20 = *(unsigned __int8 *)(v19 + v4);
          if (*(char *)(v19 + v4) < 0) {
            __uint32_t v21 = __maskrune(*(unsigned __int8 *)(v19 + v4), 0x40000uLL);
          }
          else {
            __uint32_t v21 = _DefaultRuneLocale.__runetype[v20] & 0x40000;
          }
          ++v19;
          if (v21) {
            char v22 = v20;
          }
          else {
            char v22 = 46;
          }
          __str[v17++] = v22;
          --v6;
        }
        while (v4 != v6);
      }
      __str[v17] = 0;
      if (dword_10000D098 >= 1)
      {
        fprintf(__stdoutp, "%s:%d %s\n", "rvi_log_hexdump", 330, __str);
        v23 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v27 = "rvi_log_hexdump";
          __int16 v28 = 1024;
          int v29 = 330;
          __int16 v30 = 2080;
          long long v31 = __str;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s:%d %s", buf, 0x1Cu);
        }
      }
      unint64_t v5 = v25 + 16;
      unint64_t v4 = v9;
    }
    while (v9 < a2);
  }
}

BOOL sub_100005CDC(char *subsystem)
{
  if (!qword_10000D090)
  {
    qword_10000D090 = (uint64_t)os_log_create(subsystem, "");
    if (!qword_10000D090)
    {
      fwrite("os_log_create failed", 0x14uLL, 1uLL, __stderrp);
      return 0;
    }
  }
  CFStringRef v2 = CFStringCreateWithCString(0, subsystem, 0x8000100u);
  if (!v2)
  {
    fprintf(__stderrp, "%s:%d CFStringCreateWithCString subsystem failed\n", "rvi_init_logging", 350);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_100006C70();
    }
    return 0;
  }
  CFStringRef v3 = v2;
  CFStringRef v4 = CFStringCreateWithCString(0, "verbose", 0);
  BOOL v5 = v4 != 0;
  if (v4)
  {
    CFStringRef v6 = v4;
    Boolean keyExistsAndHasValidFormat = 0;
    unint64_t AppIntegerValue = CFPreferencesGetAppIntegerValue(v4, v3, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      if (AppIntegerValue <= 0x7FFFFFFE)
      {
        dword_10000D098 = AppIntegerValue;
        fprintf(__stdoutp, "%s:%d rvi_debug_verbosity is now %d\n", "rvi_init_logging", 363, AppIntegerValue);
        uint64_t v8 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          unsigned int v12 = "rvi_init_logging";
          __int16 v13 = 1024;
          int v14 = 363;
          __int16 v15 = 1024;
          int v16 = dword_10000D098;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d rvi_debug_verbosity is now %d", buf, 0x18u);
        }
      }
    }
    CFRelease(v6);
  }
  else
  {
    fprintf(__stderrp, "%s:%d CFStringCreateWithCString verbose_key failed\n", "rvi_init_logging", 355);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR)) {
      sub_100006CF0();
    }
  }
  CFRelease(v3);
  return v5;
}

void sub_100005F38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100005F54()
{
  v1[0] = 136315650;
  sub_100005124();
  sub_100005110();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d pcap_setup_pktap_interface() fail - %s", (uint8_t *)v1, 0x1Cu);
}

void sub_100005FDC()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSBLEN) - %s", v3, v4, v5, v6, 2u);
}

void sub_100006070()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCGBLEN) - %s", v3, v4, v5, v6, 2u);
}

void sub_100006104(char **a1)
{
  *a1 = 0;
  asprintf(a1, "strict_malloc called with size 0");
  qword_10000C010 = (uint64_t)*a1;
  __break(1u);
}

void sub_100006138(char **a1, uint64_t a2)
{
  *a1 = 0;
  asprintf(a1, "strict_malloc(%zu) failed", a2);
  qword_10000C010 = (uint64_t)*a1;
  __break(1u);
}

void sub_100006174()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSWANTPKTAP) - %s", v3, v4, v5, v6, 2u);
}

void sub_100006208()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSETIF) - %s", v3, v4, v5, v6, 2u);
}

void sub_10000629C()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSDLT) - %s", v3, v4, v5, v6, 2u);
}

void sub_100006330()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSRTIMEOUT) - %s", v3, v4, v5, v6, 2u);
}

void sub_1000063C4()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d fcntl(F_GETFL) - %s", v3, v4, v5, v6, 2u);
}

void sub_100006458()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d fcntl(F_SETFL) - %s", v3, v4, v5, v6, 2u);
}

void sub_1000064EC(os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "pcapd_open_bpf_device";
  __int16 v3 = 1024;
  int v4 = 495;
  __int16 v5 = 1024;
  int v6 = dword_10000C000;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:%d final bpf buffer size: %u", (uint8_t *)&v1, 0x18u);
}

void sub_100006590(os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "pcapd_open_bpf_device";
  __int16 v3 = 1024;
  int v4 = 486;
  __int16 v5 = 1024;
  int v6 = dword_10000C000;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:%d intended bpf buffer size: %u", (uint8_t *)&v1, 0x18u);
}

void sub_100006634(uint64_t a1, NSObject *a2)
{
  int v4 = __error();
  strerror(*v4);
  *(_DWORD *)int v6 = 136315906;
  sub_100005124();
  *(_DWORD *)&v6[7] = 476;
  v6[9] = 2080;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:%d open(%s) - %s", (uint8_t *)v6, 0x26u);
}

void sub_1000066F0(char **a1, uint64_t a2)
{
  *a1 = 0;
  asprintf(a1, "_strict_reallocf(%zu) failed", a2);
  qword_10000C010 = (uint64_t)*a1;
  __break(1u);
}

void sub_10000672C()
{
  v1[0] = 136315394;
  sub_100005124();
  *(_DWORD *)((char *)&v1[3] + 2) = 368;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d unable to allocate memory for packet", (uint8_t *)v1, 0x12u);
}

void sub_1000067B8()
{
  v1[0] = 136315394;
  sub_100005124();
  *(_DWORD *)((char *)&v1[3] + 2) = 382;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d unable to send packet", (uint8_t *)v1, 0x12u);
}

void sub_100006844()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100005124();
  sub_100005110();
  sub_100005134((void *)&_mh_execute_header, v1, v2, "%s:%d read bpf %s", v3, v4, v5, v6, 2u);
}

void sub_1000068D8()
{
  sub_100005124();
  sub_100005F38((void *)&_mh_execute_header, v0, v1, "%s:%d iptap_hdr == NULL", v2, v3, v4, v5, 2u);
}

void sub_100006958()
{
  sub_100005124();
  sub_100005F38((void *)&_mh_execute_header, v0, v1, "%s:%d pktap_hdr == NULL", v2, v3, v4, v5, 2u);
}

void sub_1000069D8()
{
  sub_100005124();
  sub_100005F38((void *)&_mh_execute_header, v0, v1, "%s:%d bpfhdr == NULL", v2, v3, v4, v5, 2u);
}

void sub_100006A58()
{
  sub_100005124();
  sub_100005F38((void *)&_mh_execute_header, v0, v1, "%s:%d iptap_hdr == NULL", v2, v3, v4, v5, 2u);
}

void sub_100006AD8()
{
  v1[0] = 136315650;
  sub_100005124();
  sub_100005110();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d no unit number in %s", (uint8_t *)v1, 0x1Cu);
}

void sub_100006B60()
{
  v1[0] = 136315650;
  sub_100005124();
  sub_100005110();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d %s", (uint8_t *)v1, 0x1Cu);
}

void sub_100006BE8()
{
  v1[0] = 136315650;
  sub_100005124();
  sub_100005110();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d %s", (uint8_t *)v1, 0x1Cu);
}

void sub_100006C70()
{
  sub_100005124();
  sub_100005F38((void *)&_mh_execute_header, v0, v1, "%s:%d CFStringCreateWithCString subsystem failed", v2, v3, v4, v5, 2u);
}

void sub_100006CF0()
{
  sub_100005124();
  sub_100005F38((void *)&_mh_execute_header, v0, v1, "%s:%d CFStringCreateWithCString verbose_key failed", v2, v3, v4, v5, 2u);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
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

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return _CFStringGetFastestEncoding(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_main(void)
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

uint64_t pcap_cleanup_pktap_interface()
{
  return _pcap_cleanup_pktap_interface();
}

uint64_t pcap_setup_pktap_interface()
{
  return _pcap_setup_pktap_interface();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
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

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return _strpbrk(__s1, __s2);
}