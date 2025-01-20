void sub_10000164C(int a1)
{
  os_release((void *)qword_1000103C8);
  qword_1000103C8 = 0;
  if (dword_100010390 != -1)
  {
    close(dword_100010390);
    dword_100010390 = -1;
  }
  if (qword_1000103B0) {
    xpc_connection_cancel((xpc_connection_t)qword_1000103B0);
  }
  if (qword_1000103B8) {
    CFRelease((CFTypeRef)qword_1000103B8);
  }
  if (qword_1000103C0) {
    CFRelease((CFTypeRef)qword_1000103C0);
  }
  exit(a1);
}

uint64_t sub_1000016C4()
{
  return os_log_with_args();
}

uint64_t sub_100001708()
{
  return os_log_with_args();
}

uint64_t sub_10000174C()
{
  return os_log_with_args();
}

uint64_t sub_100001790(const char *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000103B8);
  if (Count < 1)
  {
LABEL_5:
    LOWORD(v4) = -1;
  }
  else
  {
    CFIndex v3 = Count;
    CFIndex v4 = 0;
    while (1)
    {
      ValueAtIndex = (const char *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000103B8, v4);
      if (!strncmp(a1, ValueAtIndex, 0x40uLL)) {
        break;
      }
      if (v3 == ++v4) {
        goto LABEL_5;
      }
    }
  }
  return (unsigned __int16)v4;
}

uint64_t sub_100001808(uint64_t a1, const char *a2)
{
  CFArrayRef v3 = (const __CFArray *)qword_1000103C0;
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000103C0);
  if (Count < 1)
  {
LABEL_5:
    LOWORD(v6) = -1;
  }
  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    while (1)
    {
      ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v3, v6);
      if (!strncmp(a2, ValueAtIndex, 0x40uLL)) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
  }
  return (unsigned __int16)v6;
}

uint64_t sub_100001884()
{
  return dword_100010390;
}

const char *sub_100001890(uint64_t a1)
{
  if (a1 > 3222291537)
  {
    if (a1 <= 3295691826)
    {
      if (a1 <= 3223864408)
      {
        if (a1 == 3222291538) {
          return "DIOCXCOMMIT";
        }
        if (a1 == 3222291539) {
          return "DIOCXROLLBACK";
        }
      }
      else
      {
        switch(a1)
        {
          case 3223864409:
            return "DIOCSETIFFLAG";
          case 3223864410:
            return "DIOCCLRIFFLAG";
          case 3235398674:
            return "DIOCCLRSTATES";
        }
      }
    }
    else if (a1 > 3424666629)
    {
      switch(a1)
      {
        case 3424666630:
          return "DIOCGETRULES";
        case 3424666651:
          return "DIOCINSERTRULE";
        case 3424666652:
          return "DIOCDELETERULE";
      }
    }
    else
    {
      switch(a1)
      {
        case 3295691827:
          return "DIOCBEGINADDRS";
        case 3295691828:
          return "DIOCADDADDR";
        case 3424666628:
          return "DIOCADDRULE";
      }
    }
  }
  else if (a1 <= 3221505047)
  {
    if (a1 <= 536888341)
    {
      if (a1 == 536888321) {
        return "DIOCSTART";
      }
      if (a1 == 536888322) {
        return "DIOCSTOP";
      }
    }
    else
    {
      switch(a1)
      {
        case 536888342:
          return "DIOCCLRSTATUS";
        case 536888405:
          return "DIOCCLRSRCNODES";
        case 1074283528:
          return "DIOCSTARTREF";
      }
    }
  }
  else if (a1 > 3222291460)
  {
    switch(a1)
    {
      case 3222291461:
        return "DIOCGETSTARTERS";
      case 3222291465:
        return "DIOCSTOPREF";
      case 3222291537:
        return "DIOCXBEGIN";
    }
  }
  else
  {
    switch(a1)
    {
      case 3221505048:
        return "DIOCSETDEBUG";
      case 3221767197:
        return "DIOCSETTIMEOUT";
      case 3221767208:
        return "DIOCSETLIMIT";
    }
  }
  return "UNKNOWN";
}

void start(int a1, char *const *a2)
{
  CFIndex v4 = *a2;
  errorbuf = 0;
  if (sandbox_init("pfd", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "sandbox_init: %s\n", errorbuf);
    sandbox_free_error(errorbuf);
  }
  while (1)
  {
    int v5 = getopt(a1, a2, "D");
    if (v5 != 68) {
      break;
    }
    dword_100010398 = 1;
  }
  if (v5 == -1)
  {
    sub_100001CA4();
    sub_100001CF4();
    sub_1000021E4();
    sub_1000022E8();
    sub_100002478();
    sub_1000024EC();
    dispatch_main();
  }
  sub_100001C48(v4);
  exit(1);
}

uint64_t sub_100001C48(const char *a1)
{
  printf("Usage: %s ", a1);
  puts("[-D]");
  puts("\noptions:");

  return puts("\t-D\tEnable PF debugging");
}

void sub_100001CA4()
{
  qword_1000103C8 = (uint64_t)os_log_create(off_100010000[0], "daemon");
  if (!qword_1000103C8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100008140();
  }
}

void sub_100001CF4()
{
  if (dword_100010390 != -1) {
    sub_10000164C(22);
  }
  int v0 = open("/dev/pfm", 2);
  dword_100010390 = v0;
  if (v0 == -1 || fcntl(v0, 2, 1) == -1)
  {
    sub_1000016C4();
    v14 = __error();
    sub_10000164C(*v14);
  }
  xmmword_1000103D0 = xmmword_1000088C0;
  unk_1000103E0 = xmmword_1000088D0;
  xmmword_1000103F0 = xmmword_1000088E0;
  unk_100010400 = xmmword_1000088F0;
  xmmword_100010410 = xmmword_100008900;
  unk_100010420 = xmmword_100008910;
  qword_100010430 = 0x9600000000;
  if (dword_100010398) {
    int v1 = 3;
  }
  else {
    int v1 = 1;
  }
  LODWORD(v17[0]) = v1;
  if (ioctl(dword_100010390, 0xC0044418uLL, v17)) {
    sub_1000016C4();
  }
  sub_10000174C();
  unint64_t v2 = 0;
  *(void *)&v17[0] = 0;
  do
  {
    LODWORD(v17[0]) = v2;
    int v3 = ioctl(dword_100010390, 0xC0084427uLL, v17, v15, v16);
    if (v3)
    {
      int v5 = v3;
LABEL_50:
      sub_1000016C4();
LABEL_51:
      sub_10000164C(v5);
    }
    uint64_t v4 = dword_100008928[v2];
    if (DWORD1(v17[0]) <= v4
      && (DWORD1(v17[0]) = dword_100008928[v2], ioctl(dword_100010390, 0xC0084428uLL, v17)))
    {
      int v5 = *__error();
      if (v5 == 16) {
        goto LABEL_50;
      }
      unint64_t v15 = v2;
      uint64_t v16 = v4;
      sub_1000016C4();
    }
    else
    {
      int v5 = 0;
    }
    if (v2 > 4) {
      break;
    }
    ++v2;
  }
  while (!v5);
  if (v5) {
    goto LABEL_51;
  }
  unint64_t v6 = 0;
  do
  {
    *(void *)&v17[0] = __PAIR64__(*((_DWORD *)&xmmword_1000103D0 + v6), v6);
    if (ioctl(dword_100010390, 0xC008441DuLL, v17, v15, v16))
    {
      int v5 = *__error();
      unint64_t v15 = v6;
      uint64_t v16 = *((unsigned int *)&xmmword_1000103D0 + v6);
      sub_1000016C4();
    }
    else
    {
      int v5 = 0;
    }
    if (v6 > 0x18) {
      break;
    }
    ++v6;
  }
  while (!v5);
  if (v5) {
    goto LABEL_51;
  }
  uint64_t v18 = 0x10000000000;
  memset(v17, 0, sizeof(v17));
  if ((unint64_t)__strlcpy_chk() >= 0x10) {
    sub_1000016C4();
  }
  if (ioctl(dword_100010390, 0xC0284459uLL, v17))
  {
    int v7 = *__error();
    sub_1000016C4();
    if (v7)
    {
      int v13 = v7;
      goto LABEL_55;
    }
  }
  v17[0] = 0uLL;
  if (ioctl(dword_100010390, 0xC0104405uLL, v17) < 0)
  {
    if (*__error() == 2) {
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  v8 = malloc_type_malloc(2 * SLODWORD(v17[0]), 0x2829944CuLL);
  if (!v8) {
    goto LABEL_43;
  }
  v9 = v8;
  *((void *)&v17[0] + 1) = v8;
  if (ioctl(dword_100010390, 0xC0104405uLL, v17) < 0)
  {
    free(v9);
    if (*__error() == 2)
    {
LABEL_42:
      sub_100001708();
      goto LABEL_44;
    }
LABEL_43:
    sub_1000016C4();
LABEL_44:
    int v13 = *__error();
    if ((v13 & 0xFFFFFFFD) == 0) {
      return;
    }
LABEL_55:
    sub_10000164C(v13);
  }
  int v10 = v17[0];
  if (SLODWORD(v17[0]) >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *((void *)&v17[0] + 1);
    while (strncmp((const char *)(v12 + v11 + 20), "pfd", 0x40uLL))
    {
      v11 += 84;
      if ((int)v11 >= v10) {
        goto LABEL_47;
      }
    }
    sub_10000174C();
    qword_1000103A0 = *(void *)(v12 + v11);
  }
LABEL_47:
  free(v9);
}

void sub_1000021E4()
{
  memset(&v1, 0, sizeof(v1));
  int v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &v1);
  qword_1000103B8 = (uint64_t)v0;
  if (!v0)
  {
    sub_1000016C4();
    sub_10000164C(12);
  }
  CFArrayAppendValue(v0, off_1000100D0[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, kPFThreadBR[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100F8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_100010100[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100D8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100E0[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100E8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100F0[0]);
}

void sub_1000022E8()
{
  memset(&v1, 0, sizeof(v1));
  int v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &v1);
  qword_1000103C0 = (uint64_t)v0;
  if (!v0)
  {
    sub_1000016C4();
    sub_10000164C(12);
  }
  CFArrayAppendValue(v0, off_100010110[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010118[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010120[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010128[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010130[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010138[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010140[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010148[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010150[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010158[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, kPFThreadBR_nat64[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010160[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010168[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010170[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010178[0]);
}

void sub_100002478()
{
  mach_service = xpc_connection_create_mach_service(off_100010008[0], (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  qword_1000103B0 = (uint64_t)mach_service;
  if (!mach_service)
  {
    sub_1000016C4();
    sub_10000164C(12);
  }
  xpc_connection_set_event_handler(mach_service, &stru_10000C408);
  CFArrayCallBacks v1 = (_xpc_connection_s *)qword_1000103B0;

  xpc_connection_resume(v1);
}

void sub_1000024EC()
{
  v5.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v5.sa_mask = 0x200000000;
  sigaction(1, &v5, 0);
  sigaction(13, &v5, 0);
  sigaction(14, &v5, 0);
  sigaction(24, &v5, 0);
  sigaction(25, &v5, 0);
  sigaction(26, &v5, 0);
  sigaction(27, &v5, 0);
  sigaction(18, &v5, 0);
  sigaction(21, &v5, 0);
  sigaction(22, &v5, 0);
  sigaction(30, &v5, 0);
  sigaction(31, &v5, 0);
  sigaction(29, &v5, 0);
  sigaction(15, &v5, 0);
  sigaction(2, &v5, 0);
  int v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1DuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  CFArrayCallBacks v1 = v0;
  if (v0)
  {
    dispatch_source_set_event_handler(v0, &stru_10000C448);
    dispatch_resume(v1);
  }
  unint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (v2)
  {
    int v3 = v2;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_100002794;
    v4[3] = &unk_10000C468;
    v4[4] = v1;
    v4[5] = v2;
    dispatch_source_set_event_handler(v2, v4);
    dispatch_resume(v3);
  }
}

void sub_1000026C8(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_10000174C();
    sub_1000027D0((_xpc_connection_s *)a2);
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      xpc_dictionary_get_string(a2, _xpc_error_key_description);
      sub_1000016C4();
      sub_10000164C(22);
    }
    sub_1000016C4();
  }
}

void sub_100002794(uint64_t a1)
{
}

void sub_1000027D0(_xpc_connection_s *a1)
{
  if (__CFADD__(dword_100010438++, 1)) {
    sub_100008188();
  }
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100002878;
  handler[3] = &unk_10000C4A8;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  xpc_connection_resume(a1);
}

void sub_100002878(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      sub_1000016C4();
      return;
    }
    goto LABEL_25;
  }
  *(_OWORD *)size = 0u;
  long long v137 = 0u;
  CFErrorRef error = 0;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  unint64_t v6 = SecTaskCreateWithAuditToken(0, &token);
  if (!v6) {
    goto LABEL_24;
  }
  int v7 = v6;
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.pf.allow", &error);
  CFErrorRef v9 = error;
  if (!error && v8)
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    BOOL v11 = TypeID == CFGetTypeID(v8) && CFEqual(v8, kCFBooleanTrue) != 0;
    goto LABEL_14;
  }
  BOOL v11 = 0;
  if (v8)
  {
LABEL_14:
    CFRelease(v8);
    CFErrorRef v9 = error;
  }
  if (v9) {
    CFRelease(v9);
  }
  CFRelease(v7);
  if (!v11)
  {
LABEL_24:
    xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
    xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
    sub_1000016C4();
    if (&_xpc_type_dictionary == &_xpc_type_error)
    {
LABEL_25:
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      sub_100001708();
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      if (!dword_100010438) {
        sub_1000081B4();
      }
      --dword_100010438;
      return;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    if (reply)
    {
      xpc_object_t v24 = reply;
      xpc_dictionary_set_uint64(reply, off_100010010[0], 0x7D2uLL);
      v25 = *(_xpc_connection_s **)(a1 + 32);
LABEL_73:
      sub_100003D14(v25, v24);
LABEL_74:
      v50 = v24;
LABEL_75:
      xpc_release(v50);
    }
    else
    {
LABEL_76:
      sub_1000016C4();
    }
    return;
  }
  uint64_t v12 = *(_xpc_connection_s **)(a1 + 32);
  int v13 = off_100010000;
  uint64_t uint64 = xpc_dictionary_get_uint64(object, off_100010010[0]);
  switch(uint64)
  {
    case 0x3E9uLL:
      *(void *)token.val = 0;
      *(void *)v134 = 0;
      CFErrorRef error = 0;
      CFStringRef v15 = 0;
      if (!sub_100003D84(object, (const char **)&token, (const char **)&error)) {
        goto LABEL_175;
      }
      uint64_t v16 = *(const char **)token.val;
      int v17 = sub_100001790(*(const char **)token.val);
      uint64_t v18 = (const char *)error;
      int v19 = sub_100001808((uint64_t)v16, (const char *)error);
      xpc_object_t value = xpc_dictionary_get_value(object, off_100010030[0]);
      if (!value) {
        goto LABEL_174;
      }
      uint64_t v21 = (uint64_t)value;
      xpc_object_t v22 = xpc_dictionary_get_value(object, off_100010038[0]);
      if (!v22 || xpc_get_type(v22) != (xpc_type_t)&_xpc_type_uint64) {
        goto LABEL_174;
      }
      unsigned __int16 v114 = xpc_dictionary_get_uint64(object, off_100010038[0]);
      size[0] = 0;
      LOWORD(size[1]) = 0;
      CFStringRef v15 = sub_100004304(v16, v18, v17, v19, size);
      if (!v15) {
        goto LABEL_198;
      }
      if (!sub_100005CA0(v16, v18, v15, v114, v21)) {
        sub_100004078(v16, v18, (uint64_t)size);
      }
      if (!sub_100005EC8())
      {
        sub_100004198(v16, v18, *(uint64_t *)v134, v15);
        goto LABEL_200;
      }
      xpc_object_t v115 = xpc_dictionary_create_reply(object);
      if (v115)
      {
        xpc_object_t v33 = v115;
        xpc_dictionary_set_uint64(v115, off_100010010[0], 0x7D1uLL);
        v53 = off_100010040[0];
        uint64_t v55 = *(void *)v134;
        v54 = v33;
        goto LABEL_178;
      }
      sub_1000016C4();
      sub_100004198(v16, v18, *(uint64_t *)v134, v15);
      sub_100004078(v16, v18, (uint64_t)size);
      goto LABEL_183;
    case 0x3EAuLL:
      size[0] = 0;
      *(void *)token.val = 0;
      LODWORD(error) = 0;
      if (sub_100003D84(object, (const char **)size, (const char **)&token))
      {
        xpc_object_t v32 = xpc_dictionary_get_value(object, off_100010040[0]);
        if (!v32 || xpc_get_type(v32) != (xpc_type_t)&_xpc_type_uint64)
        {
          sub_1000016C4();
          xpc_object_t v33 = xpc_dictionary_create_reply(object);
          CFStringRef v15 = 0;
          if (v33) {
            goto LABEL_177;
          }
          goto LABEL_182;
        }
        uint64_t v106 = xpc_dictionary_get_uint64(object, off_100010040[0]);
        v107 = (const char *)size[0];
        v108 = *(const char **)token.val;
        CFStringRef v15 = sub_100004814((const char *)size[0], *(const char **)token.val);
        if (sub_100004198(v107, v108, v106, v15))
        {
          int v109 = sub_100005D80(v15, &error);
          char v51 = v109;
          if (v109 && !error)
          {
            CFStringGetCStringPtr(v15, 0);
            sub_10000174C();
            sub_100005AB4(v107, v108);
            xpc_object_t v33 = xpc_dictionary_create_reply(object);
            if (v33) {
              goto LABEL_80;
            }
            goto LABEL_182;
          }
        }
        else
        {
          char v51 = 0;
        }
      }
      else
      {
        char v51 = 0;
        CFStringRef v15 = 0;
      }
      xpc_object_t v52 = xpc_dictionary_create_reply(object);
      if (!v52) {
        goto LABEL_182;
      }
      xpc_object_t v33 = v52;
      if ((v51 & 1) == 0) {
        goto LABEL_177;
      }
      goto LABEL_80;
    case 0x3EBuLL:
      *(void *)token.val = 0;
      CFErrorRef error = 0;
      CFStringRef v15 = 0;
      if (!sub_100003D84(object, (const char **)&token, (const char **)&error)) {
        goto LABEL_175;
      }
      xpc_object_t v34 = xpc_dictionary_get_value(object, off_100010020[0]);
      if (v34
        && xpc_get_type(v34) == (xpc_type_t)&_xpc_type_string
        && (uint64_t v16 = *(const char **)token.val,
            int v110 = sub_100001790(*(const char **)token.val),
            uint64_t v18 = (const char *)error,
            int v111 = sub_100001808((uint64_t)v16, (const char *)error),
            (xpc_object_t v112 = xpc_dictionary_get_value(object, off_100010028[0])) != 0)
        && xpc_get_type(v112) == (xpc_type_t)&_xpc_type_array)
      {
        xpc_dictionary_get_value(object, off_100010028[0]);
        size[0] = 0;
        LOWORD(size[1]) = 0;
        CFStringRef v15 = sub_100004304(v16, v18, v110, v111, size);
        if (v15)
        {
          if (sub_1000048A8())
          {
            if (sub_100005EC8())
            {
              xpc_object_t v116 = xpc_dictionary_create_reply(object);
              if (!v116)
              {
                sub_1000016C4();
                sub_100005AB4(v16, v18);
                goto LABEL_183;
              }
              xpc_object_t v33 = v116;
LABEL_80:
              v53 = off_100010010[0];
              v54 = v33;
              uint64_t v55 = 2001;
LABEL_178:
              xpc_dictionary_set_uint64(v54, v53, v55);
              sub_100003D14(v12, v33);
              v62 = v33;
LABEL_179:
              xpc_release(v62);
LABEL_180:
              if (!v15) {
                return;
              }
LABEL_183:
              CFRelease(v15);
              return;
            }
            sub_100005AB4(v16, v18);
          }
          else
          {
LABEL_200:
            sub_100004078(v16, v18, (uint64_t)size);
          }
        }
        else
        {
LABEL_198:
          sub_1000016C4();
        }
      }
      else
      {
LABEL_174:
        sub_1000016C4();
        CFStringRef v15 = 0;
      }
LABEL_175:
      xpc_object_t v113 = xpc_dictionary_create_reply(object);
      if (!v113)
      {
LABEL_182:
        sub_1000016C4();
        if (!v15) {
          return;
        }
        goto LABEL_183;
      }
      xpc_object_t v33 = v113;
LABEL_177:
      v53 = off_100010010[0];
      v54 = v33;
      uint64_t v55 = 2000;
      goto LABEL_178;
    case 0x3ECuLL:
      size[0] = 0;
      *(void *)token.val = 0;
      if (!sub_100003D84(object, (const char **)size, (const char **)&token)) {
        goto LABEL_70;
      }
      BOOL v35 = sub_100005AB4((const char *)size[0], *(const char **)token.val);
      goto LABEL_59;
    case 0x3EDuLL:
      size[0] = 0;
      *(void *)token.val = 0;
      int v36 = sub_100003D84(object, (const char **)size, (const char **)&token);
      CFStringRef v15 = 0;
      xpc_object_t v37 = 0;
      LOBYTE(error) = v36;
      if (v36)
      {
        CFStringRef v15 = sub_100004814((const char *)size[0], *(const char **)token.val);
        xpc_object_t v37 = sub_100005F74();
      }
      xpc_object_t v38 = xpc_dictionary_create_reply(object);
      if (v38)
      {
        v39 = v38;
        if ((_BYTE)error)
        {
          xpc_dictionary_set_uint64(v38, off_100010010[0], 0x7D1uLL);
          if (v37) {
            xpc_dictionary_set_value(v39, off_100010028[0], v37);
          }
        }
        else
        {
          xpc_dictionary_set_uint64(v38, off_100010010[0], 0x7D0uLL);
        }
        sub_100003D14(v12, v39);
        xpc_release(v39);
      }
      else
      {
        sub_1000016C4();
      }
      if (!v37) {
        goto LABEL_180;
      }
      v62 = v37;
      goto LABEL_179;
    case 0x3EEuLL:
      xpc_object_t v40 = xpc_dictionary_get_value(object, off_100010030[0]);
      if (v40)
      {
        xpc_object_t v41 = xpc_dictionary_create(0, 0, 0);
        if (v41)
        {
          LOBYTE(v40) = sub_100006D44(v40, v41);
        }
        else
        {
          sub_1000016C4();
          LOBYTE(v40) = 0;
        }
      }
      else
      {
        sub_1000016C4();
        xpc_object_t v41 = 0;
      }
      xpc_object_t v63 = xpc_dictionary_create_reply(object);
      if (v63)
      {
        v64 = v63;
        if (v40)
        {
          xpc_dictionary_set_uint64(v63, off_100010010[0], 0x7D1uLL);
          xpc_dictionary_set_value(v64, off_100010030[0], v41);
        }
        else
        {
          xpc_dictionary_set_uint64(v63, off_100010010[0], 0x7D0uLL);
        }
        sub_100003D14(v12, v64);
        xpc_release(v64);
      }
      else
      {
        sub_1000016C4();
      }
      if (!v41) {
        return;
      }
      v50 = v41;
      goto LABEL_75;
    case 0x3EFuLL:
      size[0] = 0;
      *(void *)token.val = 0;
      if (!sub_100003D84(object, (const char **)size, (const char **)&token))
      {
LABEL_70:
        xpc_object_t v24 = xpc_dictionary_create_reply(object);
        if (!v24) {
          goto LABEL_76;
        }
        goto LABEL_71;
      }
      BOOL v35 = sub_100006C1C((const char *)size[0], *(const char **)token.val);
LABEL_59:
      BOOL v42 = v35;
      xpc_object_t v43 = xpc_dictionary_create_reply(object);
      if (!v43) {
        goto LABEL_76;
      }
      xpc_object_t v24 = v43;
      if (!v42) {
        goto LABEL_71;
      }
      v44 = off_100010010[0];
      uint64_t v45 = 2001;
      goto LABEL_72;
    default:
      if (uint64 != 3000)
      {
        if (uint64 == 3001)
        {
          size[0] = 0;
          size[1] = 0;
          token.val[0] = 0;
          LODWORD(error) = 0;
          if (!object) {
            goto LABEL_33;
          }
          if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
            goto LABEL_33;
          }
          xpc_object_t v56 = xpc_dictionary_get_value(object, off_100010050[0]);
          if (!v56) {
            goto LABEL_33;
          }
          v57 = v56;
          if (xpc_get_type(v56) != (xpc_type_t)&_xpc_type_dictionary) {
            goto LABEL_33;
          }
          token.val[0] = 0;
          xpc_object_t v58 = xpc_dictionary_get_value(v57, off_1000100A8[0]);
          if (!v58) {
            goto LABEL_33;
          }
          v59 = v58;
          if (xpc_get_type(v58) != (xpc_type_t)&_xpc_type_data) {
            goto LABEL_33;
          }
          if (xpc_data_get_bytes(v59, &token, 0, 4uLL) != 4) {
            goto LABEL_33;
          }
          xpc_object_t v60 = xpc_dictionary_get_value(v57, off_1000100B0[0]);
          if (!v60) {
            goto LABEL_33;
          }
          v61 = v60;
          unint64_t v2 = (char *)&_xpc_type_uint64;
          if (xpc_get_type(v60) != (xpc_type_t)&_xpc_type_uint64 || xpc_uint64_get_value(v61) >= 0x10000) {
            goto LABEL_33;
          }
          unsigned __int16 v117 = xpc_uint64_get_value(v61);
          xpc_object_t v118 = xpc_dictionary_get_value(v57, off_1000100C8[0]);
          if (v118
            && (v119 = v118, xpc_get_type(v118) == (xpc_type_t)&_xpc_type_uint64)
            && xpc_uint64_get_value(v119) < 0x100)
          {
            unsigned __int8 v120 = xpc_uint64_get_value(v119);
          }
          else
          {
            sub_1000016C4();
            unsigned __int8 v120 = 0;
          }
          LODWORD(error) = 0;
          xpc_object_t v121 = xpc_dictionary_get_value(v57, off_1000100B8[0]);
          if (v121
            && (v122 = v121, xpc_get_type(v121) == (xpc_type_t)&_xpc_type_data)
            && xpc_data_get_bytes(v122, &error, 0, 4uLL) == 4)
          {
            int v123 = 1;
          }
          else
          {
            sub_1000016C4();
            int v123 = 0;
          }
          xpc_object_t v124 = xpc_dictionary_get_value(v57, off_1000100C0[0]);
          if (v124
            && (v125 = v124, xpc_get_type(v124) == (xpc_type_t)&_xpc_type_uint64)
            && xpc_uint64_get_value(v125) < 0x10000)
          {
            unsigned __int16 v126 = xpc_uint64_get_value(v125);
          }
          else
          {
            sub_1000016C4();
            unsigned __int16 v126 = 0;
          }
          uint64_t v127 = sub_100001884();
          if ((v127 & 0x80000000) == 0 && (unint64_t v2 = (char *)v127, (ioctl(v127, 0xC0104419uLL, size) & 0x80000000) == 0))
          {
            v128 = malloc_type_malloc(SLODWORD(size[0]), 0x783562F8uLL);
            v27 = v128;
            if (!v128
              || (size[1] = (size_t)v128, bzero(v128, SLODWORD(size[0])), ioctl((int)v2, 0xC0104419uLL, size) < 0))
            {
LABEL_251:
              sub_1000016C4();
              char v26 = 0;
            }
            else
            {
              if (SLODWORD(size[0]) >= 1)
              {
                uint64_t v129 = 0;
                unint64_t v2 = 0;
                char v26 = 0;
                while (1)
                {
                  size_t v130 = size[1] + v129;
                  if (*(unsigned char *)(size[1] + v129 + 282) == 2
                    && (*(_DWORD *)(v130 + 24) != *(_DWORD *)(v130 + 48)
                     || *(unsigned __int16 *)(size[1] + v129 + 40) != *(unsigned __int16 *)(size[1] + v129 + 64))
                    && *(_DWORD *)(v130 + 24) == token.val[0]
                    && *(unsigned __int16 *)(size[1] + v129 + 40) == v117)
                  {
                    if (v123 && *(_DWORD *)(size[1] + v129 + 72) != error
                      || v126 && *(unsigned __int16 *)(size[1] + v129 + 88) != v126
                      || v120 && *(unsigned __int8 *)(size[1] + v129 + 284) != v120)
                    {
                      goto LABEL_34;
                    }
                    if (v26) {
                      goto LABEL_251;
                    }
                    char v26 = 1;
                    unint64_t v2 = (char *)(size[1] + v129);
                  }
                  v129 += 297;
                  if ((int)v129 >= SLODWORD(size[0])) {
                    goto LABEL_34;
                  }
                }
              }
              char v26 = 0;
              unint64_t v2 = 0;
            }
          }
          else
          {
LABEL_33:
            sub_1000016C4();
            char v26 = 0;
            v27 = 0;
          }
LABEL_34:
          xpc_object_t v28 = xpc_dictionary_create_reply(object);
          if (v28)
          {
            v29 = v28;
            v30 = off_100010010[0];
            if (v26)
            {
              xpc_dictionary_set_uint64(v28, off_100010010[0], 0x7D1uLL);
              xpc_dictionary_set_data(v29, off_100010098[0], v2 + 48, 4uLL);
              v30 = off_1000100A0[0];
              uint64_t v31 = *((unsigned __int16 *)v2 + 32);
              xpc_object_t v28 = v29;
            }
            else
            {
              uint64_t v31 = 2000;
            }
            xpc_dictionary_set_uint64(v28, v30, v31);
            sub_100003D14(v12, v29);
          }
          if (v27) {
            free(v27);
          }
          return;
        }
        sub_1000016C4();
        xpc_object_t v49 = xpc_dictionary_create_reply(object);
        if (!v49) {
          goto LABEL_76;
        }
        xpc_object_t v24 = v49;
LABEL_71:
        v44 = off_100010010[0];
        xpc_object_t v43 = v24;
        uint64_t v45 = 2000;
LABEL_72:
        xpc_dictionary_set_uint64(v43, v44, v45);
        v25 = v12;
        goto LABEL_73;
      }
      if (!object
        || xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary
        || (xpc_object_t v65 = xpc_dictionary_get_value(object, off_100010048[0])) == 0
        || (v66 = v65, xpc_get_type(v65) != (xpc_type_t)&_xpc_type_dictionary)
        || (xpc_object_t v67 = xpc_dictionary_get_value(v66, off_100010058[0])) == 0
        || (v68 = v67, xpc_get_type(v67) != (xpc_type_t)&_xpc_type_array)
        || (int v69 = sub_100001884(), size[0] = 0, size[1] = 0, ioctl(v69, 0xC0104419uLL, size) < 0))
      {
        sub_1000016C4();
        v46 = 0;
        goto LABEL_65;
      }
      sub_100001708();
      unint64_t v70 = (SLODWORD(size[0]) & 0xFFFFFFFFFFFFFFF8) + 8;
      size_t v71 = v70 + 40 * xpc_array_get_count(v68) + 8 * (v70 / 0x129) + 96;
      v72 = (char *)malloc_type_malloc(v71, 0x1765BE4CuLL);
      v46 = v72;
      if (!v72 || (size[1] = (size_t)v72, bzero(v72, v71), ioctl(v69, 0xC0104419uLL, size, 297) < 0))
      {
        sub_1000016C4();
        goto LABEL_65;
      }
      int v73 = size[0];
      unint64_t v131 = SLODWORD(size[0]) & 0xFFFFFFFFFFFFFFF8;
      v74 = &v46[v131];
      *((_WORD *)v74 + 8) = 529;
      *((_WORD *)v74 + 20) = 7697;
      *((_WORD *)v74 + 32) = 518;
      *((_WORD *)v74 + 44) = 7686;
      uint64_t v75 = (uint64_t)&v46[v131 + 104];
      size_t v76 = size[1];
      if (v73 < 1) {
        goto LABEL_130;
      }
      uint64_t v77 = 0;
      break;
  }
  do
  {
    int v78 = *(unsigned __int8 *)(v76 + v77 + 282);
    if (v78 == 30)
    {
      int v79 = *(unsigned __int8 *)(v76 + v77 + 284);
      if (v79 == 6)
      {
        v80 = &v46[v131 + 80];
LABEL_127:
        ++*(_DWORD *)v80;
        goto LABEL_128;
      }
      v80 = &v46[v131 + 32];
    }
    else
    {
      if (v78 != 2) {
        goto LABEL_128;
      }
      int v79 = *(unsigned __int8 *)(v76 + v77 + 284);
      v80 = &v46[v131 + 56];
      if (v79 == 6) {
        goto LABEL_127;
      }
      v80 = &v46[v131 + 8];
    }
    if (v79 == 17) {
      goto LABEL_127;
    }
LABEL_128:
    v77 += 297;
  }
  while ((int)v77 < v73);
  size_t v76 = size[1];
LABEL_130:
  *(void *)&v46[v131 + 24] = v75;
  uint64_t v81 = v75 + 8 * *(unsigned int *)&v46[v131 + 8];
  *(void *)&v46[v131 + 48] = v81;
  uint64_t v82 = v81 + 8 * *(unsigned int *)&v46[v131 + 32];
  *(void *)&v46[v131 + 72] = v82;
  *(void *)&v46[v131 + 96] = v82 + 8 * *(unsigned int *)&v46[v131 + 56];
  *(void *)token.val = &v46[v131 + 8];
  if (v73 >= 1)
  {
    uint64_t v83 = 0;
    while (1)
    {
      int v84 = *(unsigned __int8 *)(v76 + v83 + 282);
      if (v84 == *(unsigned __int8 *)(v76 + v83 + 283)) {
        break;
      }
LABEL_143:
      v83 += 297;
      if ((int)v83 >= v73) {
        goto LABEL_144;
      }
    }
    if (v84 != 2)
    {
      if (v84 == 30)
      {
        int v85 = *(unsigned __int8 *)(v76 + v83 + 284);
        if (v85 == 6)
        {
          uint64_t v86 = (uint64_t)&v46[v131 + 80];
LABEL_142:
          uint64_t v87 = *(unsigned int *)(v86 + 4);
          *(void *)(*(void *)(v86 + 16) + 8 * v87) = v76 + v83;
          *(_DWORD *)(v86 + 4) = v87 + 1;
          goto LABEL_143;
        }
        uint64_t v86 = (uint64_t)&v46[v131 + 32];
LABEL_139:
        if (v85 == 17) {
          goto LABEL_142;
        }
      }
      sub_100001708();
      int v73 = size[0];
      goto LABEL_143;
    }
    int v85 = *(unsigned __int8 *)(v76 + v83 + 284);
    uint64_t v86 = (uint64_t)&v46[v131 + 56];
    if (v85 == 6) {
      goto LABEL_142;
    }
    uint64_t v86 = (uint64_t)&v46[v131 + 8];
    goto LABEL_139;
  }
LABEL_144:
  sub_100001708();
  unint64_t v132 = ((unint64_t)((((SLODWORD(size[0]) & 0xFFFFFFFFFFFFFFF8) + 8) * (unsigned __int128)0xDCA8F158C7F91AB9) >> 64) >> 5) & 0x7FFFFFFFFFFFFF8;
  if (xpc_array_get_count(v68))
  {
    size_t v88 = 0;
    v89 = (unsigned __int8 *)&v46[v132 + 120 + (int)v131];
    while (1)
    {
      xpc_object_t v90 = xpc_array_get_value(v68, v88);
      if (!v90) {
        break;
      }
      v91 = v90;
      if (xpc_get_type(v90) != (xpc_type_t)&_xpc_type_dictionary) {
        break;
      }
      xpc_object_t v92 = xpc_dictionary_get_value(v91, off_100010060[0]);
      if (!v92) {
        break;
      }
      v93 = v92;
      if (xpc_get_type(v92) != (xpc_type_t)&_xpc_type_data) {
        break;
      }
      bytes_ptr = xpc_data_get_bytes_ptr(v93);
      size_t length = xpc_data_get_length(v93);
      xpc_object_t v96 = xpc_dictionary_get_value(v91, off_100010068[0]);
      if (!v96) {
        break;
      }
      v97 = v96;
      if (xpc_get_type(v96) != (xpc_type_t)&_xpc_type_uuid || length != 48 || *bytes_ptr != 2) {
        break;
      }
      bytes = xpc_uuid_get_bytes(v97);
      uuid_copy(v89, bytes);
      sub_100003E44((uint64_t *)&token, (uint64_t)bytes_ptr, (uint64_t)(v89 - 16));
      xpc_uuid_get_bytes(v97);
      xpc_uuid_get_bytes(v97);
      sub_100001708();
      ++v88;
      v89 += 40;
      if (v88 >= xpc_array_get_count(v68)) {
        goto LABEL_155;
      }
    }
LABEL_246:
    sub_1000016C4();
    int v13 = off_100010000;
LABEL_65:
    xpc_object_t v47 = xpc_dictionary_create_reply(object);
    if (v47)
    {
      xpc_object_t v24 = v47;
      xpc_dictionary_set_uint64(v47, v13[2], 0x7D0uLL);
LABEL_67:
      sub_100003D14(v12, v24);
      char v48 = 0;
      goto LABEL_162;
    }
  }
  else
  {
LABEL_155:
    xpc_object_t empty = xpc_array_create_empty();
    if (!empty) {
      goto LABEL_246;
    }
    v100 = empty;
    xpc_object_t v101 = xpc_dictionary_create_reply(object);
    if (v101)
    {
      xpc_object_t v24 = v101;
      xpc_dictionary_set_uint64(v101, off_100010010[0], 0x7D1uLL);
      if (xpc_array_get_count(v68))
      {
        size_t v102 = 0;
        v103 = &v46[v132 + 136 + (int)v131];
        do
        {
          xpc_object_t v104 = xpc_dictionary_create_empty();
          xpc_dictionary_set_uint64(v104, off_100010088[0], *((void *)v103 - 4));
          xpc_dictionary_set_uint64(v104, off_100010090[0], *((void *)v103 - 3));
          xpc_dictionary_set_uuid(v104, off_100010078[0], (const unsigned __int8 *)v103 - 16);
          char v105 = *v103;
          v103 += 40;
          xpc_dictionary_set_BOOL(v104, off_100010080[0], v105);
          xpc_array_append_value(v100, v104);
          xpc_release(v104);
          ++v102;
        }
        while (v102 < xpc_array_get_count(v68));
      }
      xpc_dictionary_set_value(v24, off_100010070[0], v100);
      xpc_release(v100);
      goto LABEL_67;
    }
  }
  sub_1000016C4();
  xpc_object_t v24 = 0;
  char v48 = 1;
LABEL_162:
  if (v46) {
    free(v46);
  }
  if ((v48 & 1) == 0) {
    goto LABEL_74;
  }
}

void sub_100003D14(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t v4 = xpc_copy_description(object);
  sub_10000174C();
  free(v4);

  xpc_connection_send_message(a1, object);
}

uint64_t sub_100003D84(void *a1, const char **a2, const char **a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, off_100010018[0]);
  if (value
    && xpc_get_type(value) == (xpc_type_t)&_xpc_type_string
    && (xpc_object_t v8 = xpc_dictionary_get_value(a1, off_100010020[0])) != 0
    && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_string)
  {
    *a2 = xpc_dictionary_get_string(a1, off_100010018[0]);
    *a3 = xpc_dictionary_get_string(a1, off_100010020[0]);
    return 1;
  }
  else
  {
    sub_1000016C4();
    return 0;
  }
}

uint64_t sub_100003E44(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  for (unint64_t i = 0; i != 4; ++i)
  {
    if (*(unsigned char *)(a2 + 8))
    {
      int v20 = *(unsigned __int8 *)(a2 + 9);
      if ((i & 1) != 0 && v20 == 4) {
        continue;
      }
      if ((i & 1) == 0 && v20 == 96) {
        continue;
      }
    }
    if ((*(unsigned char *)(a2 + 8) & 2) != 0)
    {
      int v21 = *(unsigned __int8 *)(a2 + 10);
      if (i <= 1 && v21 == 6) {
        continue;
      }
      if (i >= 2 && v21 == 17) {
        continue;
      }
    }
    uint64_t v7 = *a1;
    *(unsigned char *)(a3 + 32) = 0;
    *(void *)a3 = 0;
    uint64_t v8 = v7 + 24 * i;
    unsigned int v11 = *(_DWORD *)(v8 + 4);
    int v10 = (unsigned int *)(v8 + 4);
    unint64_t v9 = v11;
    if (v11)
    {
      unint64_t v12 = 0;
      int v13 = (void *)(v7 + 24 * i + 16);
      do
      {
        uint64_t v14 = *(void *)(*v13 + 8 * v12);
        if (((*(unsigned char *)(a2 + 8) & 0x10) == 0 || *(unsigned __int16 *)(a2 + 44) == *(unsigned __int16 *)(v14 + 40))
          && ((*(unsigned char *)(a2 + 8) & 0x20) == 0 || *(unsigned __int16 *)(a2 + 46) == *(unsigned __int16 *)(v14 + 88))
          && ((*(unsigned char *)(a2 + 8) & 2) == 0 || *(unsigned __int8 *)(a2 + 10) == *(unsigned __int8 *)(v14 + 284)))
        {
          if ((*(unsigned char *)(a2 + 8) & 1) == 0) {
            goto LABEL_34;
          }
          int v15 = *(unsigned __int8 *)(a2 + 9);
          if (v15 == 96)
          {
            if (*(unsigned char *)(v14 + 282) != 2)
            {
              if ((*(unsigned char *)(a2 + 8) & 4) == 0
                || (*(void *)(a2 + 12) == *(void *)(v14 + 24)
                  ? (BOOL v16 = *(void *)(a2 + 20) == *(void *)(v14 + 32))
                  : (BOOL v16 = 0),
                    v16))
              {
                if ((*(unsigned char *)(a2 + 8) & 8) == 0
                  || (*(void *)(a2 + 28) == *(void *)(v14 + 72)
                    ? (BOOL v17 = *(void *)(a2 + 36) == *(void *)(v14 + 80))
                    : (BOOL v17 = 0),
                      v17))
                {
LABEL_34:
                  *(unsigned char *)(a3 + 32) = 1;
                  unint64_t v18 = (*(unsigned int *)(v14 + 256) | ((unint64_t)*(unsigned int *)(v14 + 252) << 32))
                      + *(void *)a3;
                  unint64_t v19 = (*(unsigned int *)(v14 + 248) | ((unint64_t)*(unsigned int *)(v14 + 244) << 32))
                      + *(void *)(a3 + 8);
                  *(void *)a3 = v18;
                  *(void *)(a3 + 8) = v19;
                  goto LABEL_35;
                }
              }
            }
          }
          else if (v15 != 4 {
                 || *(unsigned char *)(v14 + 282) != 30
          }
                 && ((*(unsigned char *)(a2 + 8) & 4) == 0 || *(_DWORD *)(a2 + 24) == *(_DWORD *)(v14 + 48))
                 && ((*(unsigned char *)(a2 + 8) & 8) == 0 || *(_DWORD *)(a2 + 40) == *(_DWORD *)(v14 + 72)))
          {
            goto LABEL_34;
          }
        }
        sub_100001708();
        unint64_t v9 = *v10;
LABEL_35:
        ++v12;
      }
      while (v12 < v9);
    }
  }
  sub_10000174C();
  return *(unsigned __int8 *)(a3 + 32);
}

void sub_100004078(const char *a1, const char *a2, uint64_t a3)
{
  unint64_t v6 = 0;
  while (!*(void *)(a3 + 8 * v6))
  {
LABEL_8:
    if (++v6 == 10) {
      return;
    }
  }
  if (v6 > 4) {
    CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s%s", "com.apple", a1);
  }
  else {
    CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s", "/", v9);
  }
  CFStringRef v8 = v7;
  if (v7)
  {
    sub_100004198(a1, a2, *(void *)(a3 + 8 * v6), v7);
    CFRelease(v8);
    goto LABEL_8;
  }

  sub_1000016C4();
}

BOOL sub_100004198(const char *a1, const char *a2, uint64_t a3, CFStringRef theString)
{
  BOOL result = 0;
  if (a1 && a2 && theString)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0);
    if (CStringPtr)
    {
      uint64_t v9 = CStringPtr;
      bzero(v12, 0xC20uLL);
      if (strncmp(v9, "/", 0x40uLL))
      {
        snprintf(__str, 0x40uLL, "%s%s", a1, a2);
        strncpy(v16, __str, 0x40uLL);
      }
      snprintf(v14, 0x40uLL, "%s", v9);
      uint64_t v15 = a3;
      if (ioctl(dword_100010390, 0xCC20441CuLL, v12))
      {
        int v10 = *__error();
        sub_100001890(3424666652);
        sub_1000016C4();
        return v10 == 0;
      }
      else
      {
        if (!v13) {
          sub_100005BA8();
        }
        return 1;
      }
    }
    else
    {
      sub_1000016C4();
      return 0;
    }
  }
  return result;
}

CFStringRef sub_100004304(const char *a1, const char *a2, int a3, int a4, void *a5)
{
  CFStringRef v5 = 0;
  if (!a1 || !a2) {
    return v5;
  }
  snprintf(__str, 0x40uLL, "%s%s", "com.apple.", a1);
  snprintf(v19, 0x40uLL, "%s", a2);
  snprintf(v18, 0x40uLL, "%s%s", a1, a2);
  CFStringRef v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s%s%s", __str, "/", v19);
  if (!v5)
  {
    sub_1000016C4();
    return v5;
  }
  if (!strncmp(a1, off_1000100D0[0], 0x40uLL))
  {
    BOOL v14 = strncmp(a1, off_1000100D8[0], 0x40uLL) == 0;
  }
  else
  {
    int v11 = strncmp(a1, kPFThreadBR[0], 0x40uLL);
    int v12 = strncmp(a1, off_1000100E8[0], 0x40uLL);
    int v13 = strncmp(a1, off_1000100D8[0], 0x40uLL);
    BOOL v14 = v13 == 0;
    if (v12 && v11)
    {
      int v15 = 0;
      int v16 = 0;
      BOOL v14 = 0;
      if (v13) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    if (v11)
    {
      int v16 = 0;
      goto LABEL_15;
    }
  }
  if (sub_100004684((uint64_t)__str, (uint64_t)"/", 0, a3, 2u, a5))
  {
LABEL_21:
    CFRelease(v5);
    sub_100004078(a1, a2, (uint64_t)a5);
    return 0;
  }
  int v16 = 1;
LABEL_15:
  if (sub_100004684((uint64_t)__str, (uint64_t)"/", 0, a3, 4u, a5 + 1)) {
    goto LABEL_21;
  }
  int v15 = 1;
  if (!v14) {
    goto LABEL_19;
  }
LABEL_17:
  if (sub_100004684((uint64_t)__str, (uint64_t)"/", 0, a3, 5u, a5 + 2)) {
    goto LABEL_21;
  }
  BOOL v14 = 1;
LABEL_19:
  if (sub_100004684((uint64_t)__str, (uint64_t)"/", 0, a3, 0, a5 + 3)
    || sub_100004684((uint64_t)__str, (uint64_t)"/", 0, a3, 1u, a5 + 4)
    || v16 && sub_100004684((uint64_t)v19, (uint64_t)__str, v18, a4, 2u, a5 + 5)
    || v15 && sub_100004684((uint64_t)v19, (uint64_t)__str, v18, a4, 4u, a5 + 6)
    || v14 && sub_100004684((uint64_t)v19, (uint64_t)__str, v18, a4, 5u, a5 + 7)
    || sub_100004684((uint64_t)v19, (uint64_t)__str, v18, a4, 0, a5 + 8)
    || sub_100004684((uint64_t)v19, (uint64_t)__str, v18, a4, 1u, a5 + 9))
  {
    goto LABEL_21;
  }
  return v5;
}

uint64_t sub_100004684(uint64_t a1, uint64_t a2, const char *a3, int a4, unsigned int a5, void *a6)
{
  bzero(v13, 0xC20uLL);
  __strlcpy_chk();
  __strlcpy_chk();
  if (a5 <= 5 && ((0x37u >> a5) & 1) != 0) {
    char v17 = 0xB0800040002uLL >> (8 * a5);
  }
  int v16 = a4;
  if (a3) {
    strncpy(v15, a3, 0x40uLL);
  }
  if (ioctl(dword_100010390, 0xCC20441BuLL, v13))
  {
    uint64_t v10 = 0;
    int v11 = *__error();
    if (v11 && v11 != 17)
    {
      uint64_t v10 = v11;
      sub_100001890(3424666651);
      sub_1000016C4();
    }
  }
  else
  {
    if (a6) {
      *a6 = v14;
    }
    sub_10000174C();
    return 0;
  }
  return v10;
}

CFStringRef sub_100004814(const char *a1, const char *a2)
{
  snprintf(__str, 0x40uLL, "%s%s/%s", "com.apple.", a1, a2);
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, SystemEncoding);
}

BOOL sub_1000048A8()
{
  int v3 = (const char *)__chkstk_darwin();
  BOOL result = 1;
  if (v0)
  {
    if (v3)
    {
      if (v1)
      {
        CFStringRef v5 = v2;
        if (v2)
        {
          unint64_t v6 = v0;
          if (CFStringGetCStringPtr(v1, 0))
          {
            snprintf(__str, 0x40uLL, "%s%s", v3, v6);
            memcpy(__dst, &unk_1000089B0, sizeof(__dst));
            CFStringRef v7 = &__dst[4];
            uint64_t v8 = 8;
            do
            {
              if (v8 != 2) {
                __strlcpy_chk();
              }
              v7 += 1032;
              --v8;
            }
            while (v8);
            if (!sub_100004A6C(0xC0104451uLL, (uint64_t)__dst))
            {
              int64_t count = xpc_array_get_count(v5);
              if (count < 1) {
                return sub_100004A6C(0xC0104452uLL, (uint64_t)__dst) == 0;
              }
              int64_t v10 = count;
              size_t v11 = 0;
              while (1)
              {
                xpc_array_get_value(v5, v11);
                if (sub_100004AEC()) {
                  break;
                }
                if (v10 == ++v11) {
                  return sub_100004A6C(0xC0104452uLL, (uint64_t)__dst) == 0;
                }
              }
              sub_1000016C4();
            }
            sub_100004A6C(0xC0104453uLL, (uint64_t)__dst);
          }
          else
          {
            sub_1000016C4();
          }
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100004A6C(unint64_t a1, uint64_t a2)
{
  v5[0] = 0x40800000008;
  v5[1] = a2;
  if (!ioctl(dword_100010390, a1, v5)) {
    return 0;
  }
  uint64_t v3 = *__error();
  sub_100001890(a1);
  sub_1000016C4();
  return v3;
}

uint64_t sub_100004AEC()
{
  uint64_t v0 = __chkstk_darwin();
  int v69 = v1;
  uint64_t v3 = v2;
  int v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  int64_t v10 = (void *)v0;
  memset(v77, 0, 496);
  long long v76 = 0u;
  bzero(v71, 0x470uLL);
  snprintf(v74, 0x400uLL, "%s", v9);
  if (!ioctl(dword_100010390, 0xC4704433uLL, v71)
    || (uint64_t v11 = *__error(), sub_100001890(3295691827), sub_1000016C4(), !v11))
  {
    xpc_object_t value = xpc_dictionary_get_value(v10, off_100010188[0]);
    if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
    {
      bzero(&v76, 0xC20uLL);
      LOBYTE(v14) = xpc_dictionary_get_uint64(v10, off_100010188[0]);
      char v109 = v14;
      if (v14 >= 2uLL)
      {
        if ((v14 & 0xFE) == 2)
        {
          unsigned int v15 = 0;
        }
        else if ((v14 & 0xFE) == 4)
        {
          unsigned int v15 = 2;
        }
        else
        {
          char v16 = v14 - 8;
          if (v14 - 8) < 7u && ((0x63u >> v16))
          {
            unint64_t v14 = 0xE0D0E0E0E0908uLL >> (8 * v16);
            unsigned int v15 = 4;
          }
          else if ((unint64_t)v14 - 11 >= 2)
          {
            sub_1000016C4();
            unsigned int v15 = 22;
            LOBYTE(v14) = v109;
          }
          else
          {
            unsigned int v15 = 5;
          }
        }
      }
      else
      {
        unsigned int v15 = 1;
      }
      if (v14 <= 0xDu && ((1 << v14) & 0x2110) != 0)
      {
        uint64_t v11 = sub_100007404(v75, v10, off_1000101E0[0]);
        if (v11) {
          return v11;
        }
        if (v109 == 13) {
          char uint64 = 2;
        }
        else {
          char uint64 = xpc_dictionary_get_uint64(v10, off_1000101A8[0]);
        }
        char v73 = uint64;
        if (ioctl(dword_100010390, 0xC4704434uLL, v71))
        {
          uint64_t v11 = *__error();
          sub_100001890(3295691828);
          sub_1000016C4();
          return v11;
        }
      }
      if (v7) {
        DWORD1(v76) = *(_DWORD *)(v7 + 1032 * v15 + 1028);
      }
      int v97 = v5;
      DWORD2(v76) = v72;
      snprintf((char *)v77, 0x40uLL, "%s", v9);
      strncpy(v96, v3, 0x40uLL);
      string = xpc_dictionary_get_string(v10, off_1000101A0[0]);
      if (string) {
        snprintf(v88, 0x10uLL, "%s", string);
      }
      xpc_object_t v19 = xpc_dictionary_get_value(v10, off_100010198[0]);
      if (v19 && xpc_get_type(v19) == (xpc_type_t)&_xpc_type_uint64) {
        char v110 = xpc_dictionary_get_uint64(v10, off_100010198[0]);
      }
      xpc_object_t v20 = xpc_dictionary_get_value(v10, off_100010308[0]);
      if (v20 && xpc_get_type(v20) == (xpc_type_t)&_xpc_type_uint64) {
        char v111 = xpc_dictionary_get_uint64(v10, off_100010308[0]);
      }
      xpc_object_t v21 = xpc_dictionary_get_value(v10, off_100010310[0]);
      if (v21 && xpc_get_type(v21) == (xpc_type_t)&_xpc_type_uint64) {
        char v112 = xpc_dictionary_get_uint64(v10, off_100010310[0]);
      }
      xpc_object_t v22 = xpc_dictionary_get_value(v10, off_1000101B8[0]);
      if (v22 && xpc_get_type(v22) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v113 = xpc_dictionary_get_BOOL(v10, off_1000101B8[0]);
      }
      xpc_object_t v23 = xpc_dictionary_get_value(v10, off_1000101A8[0]);
      if (v23 && xpc_get_type(v23) == (xpc_type_t)&_xpc_type_uint64) {
        char v117 = xpc_dictionary_get_uint64(v10, off_1000101A8[0]);
      }
      xpc_object_t v24 = xpc_dictionary_get_value(v10, off_100010318[0]);
      if (v24 && xpc_get_type(v24) == (xpc_type_t)&_xpc_type_uint64) {
        char v119 = xpc_dictionary_get_uint64(v10, off_100010318[0]) + 1;
      }
      xpc_object_t v25 = xpc_dictionary_get_value(v10, off_100010320[0]);
      if (v25 && xpc_get_type(v25) == (xpc_type_t)&_xpc_type_uint64) {
        char v120 = xpc_dictionary_get_uint64(v10, off_100010320[0]) + 1;
      }
      xpc_object_t v26 = xpc_dictionary_get_value(v10, off_1000101B0[0]);
      if (v26 && xpc_get_type(v26) == (xpc_type_t)&_xpc_type_uint64) {
        char v118 = xpc_dictionary_get_uint64(v10, off_1000101B0[0]);
      }
      xpc_object_t v27 = xpc_dictionary_get_value(v10, off_100010370[0]);
      if (v27 && xpc_get_type(v27) == (xpc_type_t)&_xpc_type_uint64) {
        __int16 v101 = xpc_dictionary_get_uint64(v10, off_100010370[0]);
      }
      xpc_object_t v28 = xpc_dictionary_get_value(v10, off_100010368[0]);
      if (v28 && xpc_get_type(v28) == (xpc_type_t)&_xpc_type_uint64) {
        char v123 = xpc_dictionary_get_uint64(v10, off_100010368[0]);
      }
      xpc_object_t v29 = xpc_dictionary_get_value(v10, off_100010360[0]);
      if (v29 && xpc_get_type(v29) == (xpc_type_t)&_xpc_type_uint64)
      {
        int v30 = xpc_dictionary_get_uint64(v10, off_100010360[0]);
        v108 |= v30;
      }
      xpc_object_t v31 = xpc_dictionary_get_value(v10, off_100010328[0]);
      if (v31)
      {
        if (xpc_get_type(v31) == (xpc_type_t)&_xpc_type_uint64)
        {
          int v32 = xpc_dictionary_get_uint64(v10, off_100010328[0]);
          v108 |= v32;
          if ((v108 & 8) != 0) {
            int v100 = 17040131;
          }
        }
      }
      xpc_object_t v33 = xpc_dictionary_get_value(v10, off_100010330[0]);
      if (v33 && xpc_get_type(v33) == (xpc_type_t)&_xpc_type_uint64) {
        char v125 = xpc_dictionary_get_uint64(v10, off_100010330[0]);
      }
      xpc_object_t v34 = xpc_dictionary_get_value(v10, off_100010338[0]);
      if (v34 && xpc_get_type(v34) == (xpc_type_t)&_xpc_type_uint64)
      {
        LOWORD(v100) = xpc_dictionary_get_uint64(v10, off_100010338[0]) | 0x300;
        HIWORD(v100) = 260;
      }
      xpc_object_t v35 = xpc_dictionary_get_value(v10, off_100010340[0]);
      if (v35)
      {
        if (xpc_get_type(v35) == (xpc_type_t)&_xpc_type_uint64)
        {
          HIWORD(v100) = xpc_dictionary_get_uint64(v10, off_100010340[0]) | 0x100;
          if (!(_WORD)v100) {
            LOWORD(v100) = 771;
          }
        }
      }
      xpc_object_t v36 = xpc_dictionary_get_value(v10, off_1000102E0[0]);
      if (v36 && xpc_get_type(v36) == (xpc_type_t)&_xpc_type_uint64) {
        char v104 = xpc_dictionary_get_uint64(v10, off_1000102E0[0]);
      }
      xpc_object_t v37 = xpc_dictionary_get_value(v10, off_1000102D0[0]);
      if (v37 && xpc_get_type(v37) == (xpc_type_t)&_xpc_type_uint64) {
        int v102 = xpc_dictionary_get_uint64(v10, off_1000102D0[0]);
      }
      xpc_object_t v38 = xpc_dictionary_get_value(v10, off_1000102D8[0]);
      if (v38 && xpc_get_type(v38) == (xpc_type_t)&_xpc_type_uint64) {
        int v103 = xpc_dictionary_get_uint64(v10, off_1000102D8[0]);
      }
      xpc_object_t v39 = xpc_dictionary_get_value(v10, off_100010300[0]);
      if (v39 && xpc_get_type(v39) == (xpc_type_t)&_xpc_type_uint64) {
        char v107 = xpc_dictionary_get_uint64(v10, off_100010300[0]);
      }
      xpc_object_t v40 = xpc_dictionary_get_value(v10, off_1000102F0[0]);
      if (v40 && xpc_get_type(v40) == (xpc_type_t)&_xpc_type_uint64) {
        int v105 = xpc_dictionary_get_uint64(v10, off_1000102F0[0]);
      }
      xpc_object_t v41 = xpc_dictionary_get_value(v10, off_1000102F8[0]);
      if (v41 && xpc_get_type(v41) == (xpc_type_t)&_xpc_type_uint64) {
        int v106 = xpc_dictionary_get_uint64(v10, off_1000102F8[0]);
      }
      xpc_object_t v42 = xpc_dictionary_get_value(v10, off_1000101E8[0]);
      if (v42 && xpc_get_type(v42) == (xpc_type_t)&_xpc_type_uint64) {
        char v121 = xpc_dictionary_get_uint64(v10, off_1000101E8[0]);
      }
      xpc_object_t v43 = xpc_dictionary_get_value(v10, off_1000101F0[0]);
      if (v43 && xpc_get_type(v43) == (xpc_type_t)&_xpc_type_uint64) {
        char v122 = xpc_dictionary_get_uint64(v10, off_1000101F0[0]);
      }
      xpc_object_t v44 = xpc_dictionary_get_value(v10, off_100010220[0]);
      if (v44 && xpc_get_type(v44) == (xpc_type_t)&_xpc_type_uint64) {
        char v116 = xpc_dictionary_get_uint64(v10, off_100010220[0]);
      }
      xpc_object_t v45 = xpc_dictionary_get_value(v10, off_100010228[0]);
      if (v45 && xpc_get_type(v45) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v124 = xpc_dictionary_get_BOOL(v10, off_100010228[0]);
      }
      v46 = xpc_dictionary_get_string(v10, off_100010348[0]);
      if (v46) {
        snprintf(v89, 0x40uLL, "%s", v46);
      }
      xpc_object_t v47 = xpc_dictionary_get_string(v10, off_100010350[0]);
      if (v47) {
        snprintf(v90, 0x40uLL, "%s", v47);
      }
      xpc_object_t v48 = xpc_dictionary_get_value(v10, off_100010358[0]);
      if (v48 && xpc_get_type(v48) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v114 = xpc_dictionary_get_BOOL(v10, off_100010358[0]);
      }
      xpc_object_t v49 = xpc_dictionary_get_value(v10, off_100010248[0]);
      if (v49 && xpc_get_type(v49) == (xpc_type_t)&_xpc_type_uint64) {
        char v127 = xpc_dictionary_get_uint64(v10, off_100010248[0]);
      }
      xpc_object_t v50 = xpc_dictionary_get_value(v10, off_100010240[0]);
      if (v50 && xpc_get_type(v50) == (xpc_type_t)&_xpc_type_uint64) {
        char v126 = xpc_dictionary_get_uint64(v10, off_100010240[0]);
      }
      xpc_object_t v51 = xpc_dictionary_get_value(v10, off_100010250[0]);
      if (v51 && xpc_get_type(v51) == (xpc_type_t)&_xpc_type_uint64) {
        int v98 = xpc_dictionary_get_uint64(v10, off_100010250[0]);
      }
      xpc_object_t v52 = xpc_dictionary_get_value(v10, off_100010258[0]);
      if (v52 && xpc_get_type(v52) == (xpc_type_t)&_xpc_type_BOOL) {
        BOOL v115 = xpc_dictionary_get_BOOL(v10, off_100010258[0]);
      }
      xpc_object_t v53 = xpc_dictionary_get_value(v10, off_100010260[0]);
      if (v53 && xpc_get_type(v53) == (xpc_type_t)&_xpc_type_uint64) {
        int v99 = xpc_dictionary_get_uint64(v10, off_100010260[0]);
      }
      xpc_object_t v54 = xpc_dictionary_get_value(v10, off_100010380[0]);
      if (v54 && xpc_get_type(v54) == (xpc_type_t)&_xpc_type_uint64) {
        int v129 = xpc_dictionary_get_uint64(v10, off_100010380[0]);
      }
      xpc_object_t v55 = xpc_dictionary_get_value(v10, off_100010378[0]);
      if (v55 && xpc_get_type(v55) == (xpc_type_t)&_xpc_type_uint64) {
        int v128 = xpc_dictionary_get_uint64(v10, off_100010378[0]);
      }
      uint64_t v11 = sub_100007404(v78, v10, off_1000101C0[0]);
      if (!v11)
      {
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102A8[0]);
        xpc_object_t v56 = xpc_dictionary_get_value(v10, __str);
        if (v56 && xpc_get_type(v56) == (xpc_type_t)&_xpc_type_BOOL) {
          BOOL v82 = xpc_dictionary_get_BOOL(v10, __str);
        }
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102C0[0]);
        xpc_object_t v57 = xpc_dictionary_get_value(v10, __str);
        if (v57 && xpc_get_type(v57) == (xpc_type_t)&_xpc_type_uint64) {
          char v81 = xpc_dictionary_get_uint64(v10, __str);
        }
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
        xpc_object_t v58 = xpc_dictionary_get_value(v10, __str);
        if (v58 && xpc_get_type(v58) == (xpc_type_t)&_xpc_type_uint64) {
          __int16 v79 = bswap32(xpc_dictionary_get_uint64(v10, __str)) >> 16;
        }
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B8[0]);
        xpc_object_t v59 = xpc_dictionary_get_value(v10, __str);
        if (v59 && xpc_get_type(v59) == (xpc_type_t)&_xpc_type_uint64) {
          __int16 v80 = bswap32(xpc_dictionary_get_uint64(v10, __str)) >> 16;
        }
        uint64_t v11 = sub_100007404(v83, v10, "to");
        if (!v11)
        {
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102A8[0]);
          xpc_object_t v60 = xpc_dictionary_get_value(v10, __str);
          if (v60 && xpc_get_type(v60) == (xpc_type_t)&_xpc_type_BOOL) {
            BOOL v87 = xpc_dictionary_get_BOOL(v10, __str);
          }
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102C0[0]);
          xpc_object_t v61 = xpc_dictionary_get_value(v10, __str);
          if (v61 && xpc_get_type(v61) == (xpc_type_t)&_xpc_type_uint64) {
            char v86 = xpc_dictionary_get_uint64(v10, __str);
          }
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B0[0]);
          xpc_object_t v62 = xpc_dictionary_get_value(v10, __str);
          if (v62 && xpc_get_type(v62) == (xpc_type_t)&_xpc_type_uint64) {
            __int16 v84 = bswap32(xpc_dictionary_get_uint64(v10, __str)) >> 16;
          }
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B8[0]);
          xpc_object_t v63 = xpc_dictionary_get_value(v10, __str);
          if (v63 && xpc_get_type(v63) == (xpc_type_t)&_xpc_type_uint64) {
            __int16 v85 = bswap32(xpc_dictionary_get_uint64(v10, __str)) >> 16;
          }
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102C0[0]);
          xpc_object_t v64 = xpc_dictionary_get_value(v10, __str);
          if (v64 && xpc_get_type(v64) == (xpc_type_t)&_xpc_type_uint64) {
            char v93 = xpc_dictionary_get_uint64(v10, __str);
          }
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102B0[0]);
          xpc_object_t v65 = xpc_dictionary_get_value(v10, __str);
          if (v65 && xpc_get_type(v65) == (xpc_type_t)&_xpc_type_uint64) {
            __int16 v91 = xpc_dictionary_get_uint64(v10, __str);
          }
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102B8[0]);
          xpc_object_t v66 = xpc_dictionary_get_value(v10, __str);
          if (v66 && xpc_get_type(v66) == (xpc_type_t)&_xpc_type_uint64) {
            __int16 v92 = xpc_dictionary_get_uint64(v10, __str);
          }
          if (v109 == 13)
          {
            char v117 = 30;
            char v94 = 2;
          }
          if (v7)
          {
            uint64_t v67 = 3424666628;
            int v68 = ioctl(dword_100010390, 0xCC204404uLL, &v76);
          }
          else
          {
            uint64_t v67 = 3424666651;
            int v68 = ioctl(dword_100010390, 0xCC20441BuLL, &v76);
          }
          if (v68)
          {
            uint64_t v11 = *__error();
            sub_100001890(v67);
            sub_1000016C4();
          }
          else
          {
            uint64_t v11 = 0;
          }
          if (v69) {
            *int v69 = v95;
          }
        }
      }
    }
    else
    {
      sub_1000016C4();
      return 22;
    }
  }
  return v11;
}

BOOL sub_100005AB4(const char *a1, const char *a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    snprintf(__str, 0x40uLL, "%s%s", a1, a2);
    bzero(v6, 0xC20uLL);
    strncpy(v8, __str, 0x40uLL);
    if (ioctl(dword_100010390, 0xCC20441CuLL, v6))
    {
      int v4 = *__error();
      sub_100001890(3424666652);
      sub_1000016C4();
      return v4 == 0;
    }
    else
    {
      if (!v7) {
        sub_100005BA8();
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_100005BA8()
{
  if (qword_1000103A0)
  {
    v1[0] = qword_1000103A0;
    v1[1] = 0;
    if (ioctl(dword_100010390, 0xC0104409uLL, v1))
    {
      if (*__error() != 2) {
        sub_100001890(3222291465);
      }
      return sub_1000016C4();
    }
    else
    {
      uint64_t result = sub_10000174C();
      qword_1000103A0 = 0;
    }
  }
  else
  {
    return sub_10000174C();
  }
  return result;
}

BOOL sub_100005CA0(const char *a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  BOOL result = 0;
  if (a1 && a2 && a3 && a5)
  {
    snprintf(__str, 0x40uLL, "%s%s", a1, a2);
    if (CFStringGetCStringPtr(a3, 0))
    {
      return sub_100004AEC() == 0;
    }
    else
    {
      sub_1000016C4();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100005D80(const __CFString *a1, _DWORD *a2)
{
  bzero(v9, 0xC20uLL);
  v12[1] = v12;
  if (!CFStringGetCString(a1, v11, 1024, 0x8000100u)) {
    goto LABEL_19;
  }
  int v4 = 0;
  *a2 = 0;
  while (1)
  {
    if ((v4 & 0x7FFFFFFB) == 0xA || v4 == 12 || v4 == 9 || (v4 & 0x7FFFFFF9) == 1) {
      goto LABEL_15;
    }
    char v13 = v4;
    if (ioctl(dword_100010390, 0xCC204406uLL, v9)) {
      break;
    }
    *a2 += v10;
LABEL_15:
    if (++v4 == 15) {
      return 1;
    }
  }
  sub_100001890(3424666630);
LABEL_19:
  sub_1000016C4();
  return 0;
}

BOOL sub_100005EC8()
{
  if (qword_1000103A0)
  {
    sub_10000174C();
    return 1;
  }
  if (!ioctl(dword_100010390, 0x40084408uLL, &qword_1000103A0)) {
    return 1;
  }
  int v1 = *__error();
  if (v1 == 17)
  {
    sub_1000016C4();
    return 1;
  }
  sub_100001890(1074283528);
  sub_1000016C4();
  return v1 == 0;
}

xpc_object_t sub_100005F74()
{
  uint64_t v0 = __chkstk_darwin();
  unint64_t v2 = v1;
  CFStringRef v3 = (const __CFString *)v0;
  bzero(v53, 0xC20uLL);
  CStringPtr = CFStringGetCStringPtr(v3, 0);
  snprintf(v56, 0x40uLL, "%s", CStringPtr);
  xpc_object_t v4 = xpc_array_create(0, 0);
  int v5 = 0;
  xpc_object_t v50 = v2;
  while (1)
  {
    BOOL v6 = (v5 & 0x7FFFFFFB) == 0xA || v5 == 12;
    BOOL v7 = v6 || v5 == 9;
    if (!v7 && (v5 & 0x7FFFFFF9) != 1)
    {
      unsigned __int8 value_4 = v5;
      if (ioctl(dword_100010390, 0xCC204406uLL, v53))
      {
        uint64_t v48 = 3424666630;
LABEL_167:
        sub_100001890(v48);
        sub_1000016C4();
        xpc_release(v4);
        xpc_object_t v4 = 0;
        *unint64_t v2 = 0;
        return v4;
      }
      int v52 = v55;
      if (v55 >= 1) {
        break;
      }
    }
LABEL_158:
    if (++v5 == 15)
    {
      if (!xpc_array_get_count(v4))
      {
        sub_10000174C();
        xpc_release(v4);
        xpc_object_t v4 = 0;
      }
      *unint64_t v2 = 1;
      return v4;
    }
  }
  int v9 = 0;
  while (1)
  {
    int v55 = v9;
    if (ioctl(dword_100010390, 0xCC204407uLL, v53))
    {
      uint64_t v48 = 3424666631;
      goto LABEL_167;
    }
    int v10 = v54;
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    if (!v11) {
      break;
    }
    int v12 = v11;
    xpc_dictionary_set_uint64(v11, off_100010188[0], value_4);
    if (value_4 > 0xEu || ((1 << value_4) & 0x6330) == 0) {
      xpc_dictionary_set_uint64(v12, off_100010198[0], value_5);
    }
    if (v67[0]) {
      xpc_dictionary_set_string(v12, off_1000101A0[0], v67);
    }
    if (v99) {
      xpc_dictionary_set_uint64(v12, off_1000101A8[0], v99);
    }
    if (value_4 == 1 && (value & 0xD) != 0)
    {
      xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
      if (!v14) {
        goto LABEL_168;
      }
      unsigned int v15 = v14;
      if ((value & 8) != 0)
      {
        unint64_t v18 = off_100010328[0];
        uint64_t v16 = 8;
      }
      else
      {
        if ((value & 1) == 0)
        {
          if ((value & 4) != 0)
          {
            xpc_dictionary_set_uint64(v14, off_100010328[0], 4uLL);
            if (v82) {
              xpc_dictionary_set_uint64(v15, off_100010338[0], v82);
            }
            uint64_t v16 = v83;
            if (v83)
            {
              char v17 = off_100010340;
              goto LABEL_39;
            }
          }
LABEL_41:
          xpc_dictionary_set_value(v12, off_100010190[0], v15);
          xpc_release(v15);
          goto LABEL_42;
        }
        xpc_dictionary_set_uint64(v14, off_100010328[0], 1uLL);
        uint64_t v16 = v107;
        if (!v107) {
          goto LABEL_41;
        }
        char v17 = off_100010330;
LABEL_39:
        unint64_t v18 = *v17;
        xpc_object_t v14 = v15;
      }
      xpc_dictionary_set_uint64(v14, v18, v16);
      goto LABEL_41;
    }
LABEL_42:
    if (v100)
    {
      xpc_object_t v19 = getprotobynumber(v100);
      if (v19) {
        xpc_dictionary_set_string(v12, off_1000101B0[0], v19->p_name);
      }
      else {
        xpc_dictionary_set_uint64(v12, off_1000101B0[0], v100);
      }
    }
    if (v95) {
      xpc_dictionary_set_BOOL(v12, off_1000101B8[0], 1);
    }
    if (v108 - 1 <= 2) {
      xpc_dictionary_set_uint64(v12, off_100010240[0], v108);
    }
    if (v109 - 1 <= 2) {
      xpc_dictionary_set_uint64(v12, off_100010248[0], v109);
    }
    if (!value_4 && v98) {
      xpc_dictionary_set_uint64(v12, off_100010220[0], v98);
    }
    if (v106) {
      xpc_dictionary_set_BOOL(v12, off_100010228[0], 1);
    }
    if (v80) {
      xpc_dictionary_set_uint64(v12, off_100010250[0], v80);
    }
    if (v97) {
      xpc_dictionary_set_BOOL(v12, off_100010258[0], 1);
    }
    if (v81) {
      xpc_dictionary_set_uint64(v12, off_100010260[0], v81);
    }
    if (v75) {
      xpc_dictionary_set_uint64(v12, off_100010268[0], v75);
    }
    if (v76) {
      xpc_dictionary_set_uint64(v12, off_100010270[0], v76);
    }
    if (v77) {
      xpc_dictionary_set_uint64(v12, off_100010278[0], v77);
    }
    if (v78) {
      xpc_dictionary_set_uint64(v12, off_100010280[0], v78);
    }
    if (v79) {
      xpc_dictionary_set_uint64(v12, off_100010288[0], v79);
    }
    if (v103)
    {
      uint64_t v20 = 0;
      *(_OWORD *)BOOL v114 = 0u;
      *(_OWORD *)BOOL v113 = 0u;
      xpc_object_t v21 = v113;
      char v22 = 70;
      do
      {
        if ((v103 >> v20)) {
          *v21++ = v22;
        }
        char v22 = aFsrpauew[++v20];
      }
      while (v20 != 8);
      if (!v104) {
        goto LABEL_86;
      }
    }
    else
    {
      if (!v104) {
        goto LABEL_87;
      }
      *(_OWORD *)BOOL v114 = 0u;
      *(_OWORD *)BOOL v113 = 0u;
      xpc_object_t v21 = v113;
    }
    uint64_t v23 = 0;
    *xpc_object_t v21 = 47;
    xpc_object_t v24 = v21 + 1;
    char v25 = 70;
    do
    {
      if ((v104 >> v23)) {
        *v24++ = v25;
      }
      char v25 = aFsrpauew[++v23];
    }
    while (v23 != 8);
LABEL_86:
    xpc_dictionary_set_string(v12, off_1000101E8[0], v113);
LABEL_87:
    if (v87 && !sub_100007AC0(v87, v85, v86, off_1000101F8[0], v12)
      || v89 && !sub_100007AC0(v89, v88, v88, off_100010200[0], v12))
    {
      goto LABEL_165;
    }
    int v26 = value_4;
    if (value_4 == 2)
    {
      if (!value && !v105 && !v84) {
        goto LABEL_107;
      }
      xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
      if (!v27) {
        goto LABEL_168;
      }
      xpc_object_t v28 = v27;
      if (value) {
        xpc_dictionary_set_uint64(v27, off_100010360[0], value);
      }
      if (v105) {
        xpc_dictionary_set_uint64(v28, off_100010368[0], v105);
      }
      if (v84) {
        xpc_dictionary_set_uint64(v28, off_100010370[0], v84);
      }
      xpc_dictionary_set_value(v12, off_100010218[0], v28);
      xpc_release(v28);
      int v26 = value_4;
    }
    if (v26 == 11 && v110)
    {
      xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
      if (!v29) {
        goto LABEL_168;
      }
      int v30 = v29;
      xpc_dictionary_set_uint64(v29, off_100010380[0], v111);
      xpc_dictionary_set_uint64(v30, off_100010378[0], v110);
      xpc_dictionary_set_value(v12, off_100010238[0], v30);
      xpc_release(v30);
    }
LABEL_107:
    if (value_6)
    {
      xpc_object_t v31 = xpc_dictionary_create(0, 0, 0);
      if (!v31) {
        goto LABEL_168;
      }
      int v32 = v31;
      if (value_6) {
        xpc_dictionary_set_uint64(v31, off_100010308[0], value_6);
      }
      if (value_7)
      {
        snprintf(v112, 0x40uLL, "pflog%d", value_7);
        xpc_dictionary_set_string(v32, off_100010310[0], v112);
      }
      xpc_dictionary_set_value(v12, off_100010208[0], v32);
      xpc_release(v32);
    }
    if ((v100 == 58 || v100 == 1) && v101)
    {
      xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
      if (!v33) {
        goto LABEL_168;
      }
      xpc_object_t v34 = v33;
      xpc_dictionary_set_uint64(v33, off_100010318[0], v101 - 1);
      if (v102) {
        xpc_dictionary_set_uint64(v34, off_100010320[0], v102 - 1);
      }
      xpc_dictionary_set_value(v12, off_100010210[0], v34);
      xpc_release(v34);
    }
    if (v68[0] | v69[0])
    {
      xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
      if (!v35)
      {
LABEL_168:
        xpc_release(v12);
        break;
      }
      xpc_object_t v36 = v35;
      if (v68[0]) {
        xpc_dictionary_set_string(v35, off_100010348[0], v68);
      }
      if (v69[0]) {
        xpc_dictionary_set_string(v36, off_100010350[0], v69);
      }
      if (v96) {
        xpc_dictionary_set_BOOL(v36, off_100010358[0], 1);
      }
      xpc_dictionary_set_value(v12, off_100010230[0], v36);
      xpc_release(v36);
    }
    if ((v58
       || (vmaxvq_u8((uint8x16_t)vmvnq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32(v57[0]), (int16x8_t)vceqzq_s32(v57[1])), (int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32(v62[0]), (int16x8_t)vceqzq_s32(v62[1]))))) & 1) != 0|| v63 | v61|| v66)&& (!sub_100007CF4((uint64_t)v57, v99, v61, v59, v60, v100, v12, off_1000101C0[0])|| (sub_100007CF4((uint64_t)v62, v99, v66, v64, v65, v100, v12, off_1000101D8[0]) & 1) == 0))
    {
      sub_1000016C4();
LABEL_165:
      xpc_release(v12);
      goto LABEL_170;
    }
    unsigned __int8 v37 = value_4;
    if (value_4 <= 0xDu && ((1 << value_4) & 0x2110) != 0)
    {
      bzero(v113, 0x470uLL);
      memcpy(&v114[3], CStringPtr, 0x400uLL);
      v114[0] = v37;
      *(_DWORD *)&v113[12] = v9;
      *(_DWORD *)&v113[4] = v10;
      if (ioctl(dword_100010390, 0xC4704435uLL, v113))
      {
        sub_1000016C4();
      }
      else
      {
        unint64_t v70 = 0;
        size_t v71 = &v70;
        int v41 = *(_DWORD *)&v113[8];
        if (!*(_DWORD *)&v113[8]) {
          goto LABEL_141;
        }
        int v42 = 0;
        do
        {
          *(_DWORD *)&v113[8] = v42;
          if (ioctl(dword_100010390, 0xC4704436uLL, v113)
            || (xpc_object_t v43 = (char *)malloc_type_calloc(1uLL, 0x58uLL, 0x10A2040E07ACC14uLL)) == 0)
          {
            sub_1000016C4();
            v46 = v70;
            if (v70)
            {
              do
              {
                xpc_object_t v47 = (void *)v46[6];
                free(v46);
                v46 = v47;
              }
              while (v47);
            }
            goto LABEL_137;
          }
          xpc_object_t v44 = v43;
          memmove(v43, &v115, 0x58uLL);
          *((void *)v44 + 6) = 0;
          xpc_object_t v45 = v71;
          *((void *)v44 + 7) = v71;
          *xpc_object_t v45 = v44;
          size_t v71 = (void **)(v44 + 48);
          ++v42;
        }
        while (v41 != v42);
        unint64_t v2 = v50;
        if (!v70) {
          goto LABEL_141;
        }
        if (sub_100007CF4((uint64_t)v70, v99, v74, v72, v73, v100, v12, off_1000101E0[0]))
        {
          char v38 = 1;
          goto LABEL_138;
        }
      }
LABEL_137:
      sub_1000016C4();
      char v38 = 0;
LABEL_138:
      xpc_object_t v39 = v70;
      if (v70)
      {
        do
        {
          xpc_object_t v40 = (void *)v39[6];
          free(v39);
          xpc_object_t v39 = v40;
        }
        while (v40);
      }
      unint64_t v2 = v50;
      if ((v38 & 1) == 0) {
        goto LABEL_165;
      }
    }
LABEL_141:
    xpc_array_append_value(v4, v12);
    xpc_release(v12);
    *unint64_t v2 = 1;
    if (++v9 == v52) {
      goto LABEL_158;
    }
  }
  sub_1000016C4();
LABEL_170:
  *unint64_t v2 = 0;
  sub_1000016C4();
  xpc_release(v4);
  return 0;
}

BOOL sub_100006C1C(const char *a1, const char *a2)
{
  int v2 = -1;
  if (a1)
  {
    if (a2)
    {
      uint64_t v5 = 0;
      memset(v4, 0, sizeof(v4));
      snprintf((char *)&v4[9] + 8, 0x40uLL, "%s%s", a1, a2);
      sub_1000016C4();
      if (!ioctl(dword_100010390, 0xC0D84412uLL, v4)
        || (int v2 = *__error(), sub_100001890(3235398674), sub_1000016C4(), !v2))
      {
        sub_10000174C();
        int v2 = 0;
      }
    }
  }
  return v2 == 0;
}

uint64_t sub_100006D44(void *a1, void *a2)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v26 = 0;
  xpc_object_t value = xpc_dictionary_get_value(a1, off_100010198[0]);
  if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
  {
    HIBYTE(v26) = xpc_dictionary_get_uint64(a1, off_100010198[0]);
    xpc_dictionary_set_uint64(a2, off_100010198[0], HIBYTE(v26));
  }
  xpc_object_t v5 = xpc_dictionary_get_value(a1, off_1000101A8[0]);
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_uint64)
  {
    LOBYTE(v26) = xpc_dictionary_get_uint64(a1, off_1000101A8[0]);
    xpc_dictionary_set_uint64(a2, off_1000101A8[0], v26);
  }
  xpc_object_t v6 = xpc_dictionary_get_value(a1, off_1000101B0[0]);
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_uint64)
  {
    BYTE1(v26) = xpc_dictionary_get_uint64(a1, off_1000101B0[0]);
    xpc_dictionary_set_uint64(a2, off_1000101B0[0], BYTE1(v26));
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    if (sub_1000071F4(&v21, a1, off_1000101C0[0], v7))
    {
LABEL_12:
      uint64_t v9 = 0;
LABEL_37:
      xpc_release(v8);
      return v9;
    }
    snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
    xpc_object_t v10 = xpc_dictionary_get_value(a1, __str);
    if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_uint64)
    {
      unsigned int uint64 = xpc_dictionary_get_uint64(a1, __str);
      LOWORD(v25) = bswap32(uint64) >> 16;
      xpc_dictionary_set_uint64(v8, off_1000102B0[0], (unsigned __int16)uint64);
    }
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    if (!v12)
    {
      sub_1000016C4();
      goto LABEL_12;
    }
    char v13 = v12;
    if (!sub_1000071F4(&v22, a1, off_1000101D8[0], v12))
    {
      snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B0[0]);
      xpc_object_t v14 = xpc_dictionary_get_value(a1, __str);
      if (v14 && xpc_get_type(v14) == (xpc_type_t)&_xpc_type_uint64)
      {
        unsigned int v15 = xpc_dictionary_get_uint64(a1, __str);
        WORD2(v25) = bswap32(v15) >> 16;
        xpc_dictionary_set_uint64(v13, off_1000102B0[0], (unsigned __int16)v15);
      }
      if (ioctl(dword_100010390, 0xC0544417uLL, &v21) == -1)
      {
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_100010298[0]);
        snprintf(key, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
        xpc_dictionary_get_string(a1, __str);
        xpc_dictionary_get_uint64(a1, key);
      }
      else
      {
        xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
        if (v16)
        {
          char v17 = v16;
          if ((sub_100007338(&v23, v26, v16) & 1) == 0) {
            goto LABEL_39;
          }
          if (WORD4(v25)) {
            xpc_dictionary_set_uint64(v17, off_1000102B0[0], __rev16(WORD4(v25)));
          }
          xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
          if (v18)
          {
            xpc_object_t v19 = v18;
            uint64_t v9 = sub_100007338(&v24, v26, v18);
            if (v9)
            {
              if (WORD6(v25)) {
                xpc_dictionary_set_uint64(v19, off_1000102B0[0], __rev16(WORD6(v25)));
              }
              xpc_dictionary_set_value(a2, off_1000101C0[0], v8);
              xpc_dictionary_set_value(a2, off_1000101D8[0], v13);
              xpc_dictionary_set_value(a2, off_1000101C8[0], v17);
              xpc_dictionary_set_value(a2, off_1000101D0[0], v19);
            }
            else
            {
              sub_1000016C4();
            }
            xpc_release(v19);
          }
          else
          {
LABEL_39:
            sub_1000016C4();
            uint64_t v9 = 0;
          }
          xpc_release(v17);
          goto LABEL_36;
        }
      }
      sub_1000016C4();
    }
    uint64_t v9 = 0;
LABEL_36:
    xpc_release(v13);
    goto LABEL_37;
  }
  sub_1000016C4();
  return 0;
}

uint64_t sub_1000071F4(_DWORD *a1, void *a2, const char *a3, void *a4)
{
  xpc_object_t v11 = 0;
  if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010298[0]) < 1) {
    return 22;
  }
  string = xpc_dictionary_get_string(a2, __str);
  if (!string) {
    return 22;
  }
  uint64_t v8 = string;
  int v13 = 0;
  xpc_dictionary_set_string(a4, off_100010298[0], string);
  if (inet_pton(2, v8, &v13) == 1)
  {
    uint64_t result = 0;
    *a1 = v13;
    return result;
  }
  memset(&v12.ai_socktype, 0, 40);
  v12.ai_sockxpc_type_t type = 2;
  *(void *)&v12.ai_flags = 0x1E00000004;
  if (getaddrinfo(v8, "0", &v12, &v11)) {
    return 22;
  }
  xpc_object_t v10 = v11;
  *(_OWORD *)a1 = *(_OWORD *)&v11->ai_addr->sa_data[6];
  freeaddrinfo(v10);
  return 0;
}

uint64_t sub_100007338(_DWORD *a1, int a2, void *a3)
{
  if (!*a1 && !a1[1] && !a1[2] && !a1[3]) {
    return 1;
  }
  memset(v5, 0, 46);
  if (inet_ntop(a2, a1, (char *)v5, 0x2Eu))
  {
    xpc_dictionary_set_string(a3, off_100010298[0], (const char *)v5);
    return 1;
  }
  sub_1000016C4();
  return 0;
}

uint64_t sub_100007404(int8x16_t *a1, void *a2, const char *a3)
{
  if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010290[0]) < 1 || (xpc_object_t v6 = xpc_dictionary_get_string(a2, __str)) == 0)
  {
    __endptr = 0;
    if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010298[0]) >= 1
      && (xpc_object_t v7 = (char *)xpc_dictionary_get_string(a2, __str)) != 0)
    {
      uint64_t v8 = v7;
      uint64_t v9 = strrchr(v7, 47);
      if (v9)
      {
        xpc_object_t v10 = v9;
        xpc_object_t v11 = v9 + 1;
        uint64_t v12 = strtol(v9 + 1, &__endptr, 0);
        if (!__endptr) {
          goto LABEL_29;
        }
        if (__endptr == v11) {
          goto LABEL_29;
        }
        if (*__endptr) {
          goto LABEL_29;
        }
        unsigned __int8 v13 = v12;
        if (v12 >= 129) {
          goto LABEL_29;
        }
        size_t v14 = strlen(v8);
        size_t v15 = strlen(v10);
        xpc_object_t v16 = (char *)malloc_type_malloc(v14 - v15 + 1, 0x75BFF506uLL);
        if (v16)
        {
          char v17 = v16;
          size_t v18 = strlen(v8);
          size_t v19 = strlen(v10);
          strlcpy(v17, v8, v18 - v19 + 1);
          goto LABEL_32;
        }
      }
      else
      {
        xpc_object_t v27 = strdup(v8);
        if (v27)
        {
          char v17 = v27;
          unsigned __int8 v13 = 0x80;
LABEL_32:
          v46.ai_flags = 0;
          if (strrchr(v8, 47))
          {
            int v28 = inet_net_pton(2, v8, &v46, 4uLL);
            if (v28 == -1) {
              goto LABEL_51;
            }
          }
          else
          {
            if (inet_pton(2, v8, &v46) != 1)
            {
LABEL_51:
              char v38 = __error();
              strerror(*v38);
              sub_10000174C();
              xpc_object_t v45 = 0;
              memset(&v46.ai_socktype, 0, 40);
              v46.ai_sockxpc_type_t type = 2;
              *(void *)&v46.ai_flags = 0x1E00000004;
              int v39 = getaddrinfo(v17, "0", &v46, &v45);
              if (v39)
              {
                gai_strerror(v39);
                sub_10000174C();
                free(v17);
LABEL_29:
                sub_1000016C4();
                return 22;
              }
              int v41 = v45;
              int64x2_t v42 = *(int64x2_t *)&v45->ai_addr->sa_data[6];
              *a1 = (int8x16_t)v42;
              sub_100007944(a1, v13, v42, v40);
              freeaddrinfo(v41);
LABEL_54:
              free(v17);
              return 0;
            }
            LOBYTE(v28) = 32;
          }
          a1->i32[0] = v46.ai_flags;
          a1[2].i8[8] = 0;
          sub_100007944(a1, v28, v29, v30);
          goto LABEL_54;
        }
      }
    }
    else
    {
      if (snprintf(__str, 0x40uLL, "%s%s", a3, off_1000102A0[0]) < 1) {
        return 0;
      }
      string = xpc_dictionary_get_string(a2, __str);
      if (!string) {
        return 0;
      }
      long long v21 = strdup(string);
      if (v21)
      {
        long long v22 = v21;
        long long v23 = strrchr(v21, 58);
        if (v23)
        {
          long long v24 = v23;
          __int8 v25 = 0;
          do
          {
            if (!strcmp(v24 + 1, "network"))
            {
              char v26 = 1;
            }
            else if (!strcmp(v24 + 1, "broadcast"))
            {
              char v26 = 2;
            }
            else if (!strcmp(v24 + 1, "peer"))
            {
              char v26 = 4;
            }
            else
            {
              if (strcmp(v24 + 1, "0")) {
                goto LABEL_59;
              }
              char v26 = 8;
            }
            v25 |= v26;
            *long long v24 = 0;
            long long v24 = strrchr(v22, 58);
          }
          while (v24);
        }
        else
        {
          __int8 v25 = 0;
        }
        if ((v25 & (v25 - 1) & 6) == 0)
        {
          *(void *)&v46.ai_flags = 0;
          if ((getifaddrs((ifaddrs **)&v46) & 0x80000000) == 0)
          {
            xpc_object_t v31 = &v46;
            do
            {
              xpc_object_t v31 = *(addrinfo **)&v31->ai_flags;
              if (!v31)
              {
                freeifaddrs(*(ifaddrs **)&v46.ai_flags);
                goto LABEL_58;
              }
            }
            while (strncmp(*(const char **)&v31->ai_socktype, v22, 0x10uLL));
            freeifaddrs(*(ifaddrs **)&v46.ai_flags);
            a1[2].i8[8] = 2;
            a1[2].i8[9] = v25;
            snprintf(a1->i8, 0x10uLL, "%s", v22);
            uint64_t uint64 = xpc_dictionary_get_uint64(a2, off_1000101A8[0]);
            if (uint64 == 30)
            {
              xpc_object_t v35 = a1;
              unsigned int v36 = 128;
            }
            else
            {
              if (uint64 != 2) {
                return 0;
              }
              xpc_object_t v35 = a1;
              unsigned int v36 = 32;
            }
            sub_100007944(v35, v36, v33, v34);
            return 0;
          }
          xpc_object_t v43 = __error();
          strerror(*v43);
          sub_1000016C4();
        }
LABEL_58:
        sub_1000016C4();
LABEL_59:
        free(v22);
        return 22;
      }
    }
    sub_1000016C4();
    return 12;
  }
  if (!strncmp(v6, off_100010388, 0x40uLL)) {
    return 0;
  }
  return 22;
}

int64x2_t sub_100007944(int8x16_t *a1, unsigned int a2, int64x2_t result, int8x16_t a4)
{
  unsigned __int8 v4 = a2;
  a1[1].i64[0] = 0;
  a1[1].i64[1] = 0;
  xpc_object_t v6 = a1 + 1;
  unsigned __int8 v7 = a2 - 32;
  if (a2 < 0x20)
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v8 = v7 >> 5;
    memset(&a1[1], 255, 4 * v8 + 4);
    uint64_t result = vdupq_n_s64(v8);
    a4 = (int8x16_t)v4;
    v9.i8[1] = -32;
    v9.i16[1] = -7968;
    v9.i32[1] = -522133280;
    v9.i8[0] = v7;
    *(int8x8_t *)result.i8 = vbsl_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008980, (uint64x2_t)result), (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008970, (uint64x2_t)result)), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008960, (uint64x2_t)result), (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008950, (uint64x2_t)result)))), (int8x8_t)v4, v9);
    result.i8[0] = vaddv_s8(*(int8x8_t *)result.i8);
    unsigned __int8 v4 = result.i8[0];
    unint64_t v10 = v8 + 1;
  }
  if (v4)
  {
    int v11 = 0;
    unsigned int v12 = v4 ^ 0x1F;
    if (v12 >= 0x1E) {
      unsigned int v12 = 30;
    }
    int v13 = v12 ^ 0x1F;
    uint32x4_t v14 = (uint32x4_t)vdupq_n_s32(v13 - 1);
    int v15 = ((_BYTE)v13 + 3) & 0x3C;
    a4.i32[0] = v6->i32[v10];
    int32x4_t v16 = (int32x4_t)xmmword_100008990;
    v17.i64[0] = 0x100000001;
    v17.i64[1] = 0x100000001;
    v18.i64[0] = 0x300000003;
    v18.i64[1] = 0x300000003;
    do
    {
      int8x16_t v19 = a4;
      a4 = vorrq_s8(a4, (int8x16_t)vshlq_u32(v17, (uint32x4_t)v16));
      v11 += 4;
      int32x4_t v16 = vaddq_s32(v16, v18);
    }
    while (v15 != v11);
    uint64_t result = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v11 - 4), (int8x16_t)xmmword_1000089A0), v14), v19, a4);
    *(int8x8_t *)result.i8 = vorr_s8(*(int8x8_t *)result.i8, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)result, (int8x16_t)result, 8uLL));
    v6->i32[v10] = bswap32(result.i32[0] | result.i32[1]);
  }
  if (!a1[2].i8[8])
  {
    uint64_t result = (int64x2_t)vandq_s8(a1[1], *a1);
    *a1 = (int8x16_t)result;
  }
  return result;
}

BOOL sub_100007AC0(unsigned int a1, unsigned int a2, int a3, const char *a4, void *a5)
{
  LODWORD(v7) = a3;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (v10)
  {
    int v11 = off_1000101F8[0];
    size_t v12 = strnlen(off_1000101F8[0], 0x40uLL);
    int v13 = strncmp(a4, v11, v12);
    if (a2 == 0x7FFFFFFF && (a1 & 0xFE) == 2)
    {
      uint64_t v7 = a1;
      if (v13)
      {
        xpc_dictionary_set_string(v10, off_1000102E8[0], "unknown");
        uint32x4_t v14 = off_100010300;
LABEL_10:
        xpc_dictionary_set_uint64(v10, *v14, v7);
        int v15 = off_100010200;
LABEL_16:
        xpc_dictionary_set_value(a5, *v15, v10);
        xpc_release(v10);
        return v10 != 0;
      }
      xpc_dictionary_set_string(v10, off_1000102C8[0], "unknown");
      int32x4_t v16 = off_1000102E0[0];
      uint32x4_t v17 = v10;
      uint64_t v18 = a1;
    }
    else
    {
      if (v13)
      {
        xpc_dictionary_set_uint64(v10, off_1000102F0[0], a2);
        uint32x4_t v14 = off_1000102F8;
        uint64_t v7 = v7;
        xpc_dictionary_set_uint64(v10, off_1000102F8[0], v7);
        xpc_dictionary_set_uint64(v10, off_100010300[0], a1);
        int v15 = off_100010200;
        if (a1 > 9 || ((1 << a1) & 0x302) == 0) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      xpc_dictionary_set_uint64(v10, off_1000102D0[0], a2);
      xpc_dictionary_set_uint64(v10, off_1000102E0[0], a1);
      int v15 = off_1000101F8;
      if (a1 > 9 || ((1 << a1) & 0x302) == 0) {
        goto LABEL_16;
      }
      int32x4_t v16 = off_1000102D8[0];
      uint64_t v18 = v7;
      uint32x4_t v17 = v10;
    }
    xpc_dictionary_set_uint64(v17, v16, v18);
    int v15 = off_1000101F8;
    goto LABEL_16;
  }
  sub_1000016C4();
  return v10 != 0;
}

uint64_t sub_100007CF4(uint64_t a1, int a2, unsigned int a3, int a4, int a5, int a6, void *a7, char *a8)
{
  LODWORD(v11) = a5;
  LODWORD(v12) = a4;
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  if (v16)
  {
    uint32x4_t v17 = v16;
    if (*(unsigned char *)(a1 + 40))
    {
      if (*(unsigned char *)(a1 + 40) == 2)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        *(_OWORD *)__str = 0u;
        long long v40 = 0u;
        char v18 = *(unsigned char *)(a1 + 41);
        if (v18)
        {
          snprintf(__str, 0x40uLL, "%s:network", (const char *)a1);
          char v18 = *(unsigned char *)(a1 + 41);
          if ((v18 & 2) == 0)
          {
LABEL_6:
            if ((v18 & 4) == 0) {
              goto LABEL_7;
            }
            goto LABEL_31;
          }
        }
        else if ((*(unsigned char *)(a1 + 41) & 2) == 0)
        {
          goto LABEL_6;
        }
        snprintf(__str, 0x40uLL, "%s:broadcast", (const char *)a1);
        char v18 = *(unsigned char *)(a1 + 41);
        if ((v18 & 4) == 0)
        {
LABEL_7:
          if ((v18 & 8) == 0)
          {
LABEL_9:
            int8x16_t v19 = off_1000102A0[0];
            uint64_t v20 = __str;
            goto LABEL_45;
          }
LABEL_8:
          snprintf(__str, 0x40uLL, "%s:0", (const char *)a1);
          goto LABEL_9;
        }
LABEL_31:
        snprintf(__str, 0x40uLL, "%s:peer", (const char *)a1);
        if ((*(unsigned char *)(a1 + 41) & 8) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
LABEL_33:
      sub_1000016C4();
      uint64_t v21 = 0;
LABEL_63:
      xpc_release(v17);
      return v21;
    }
    if (*(_DWORD *)a1
      || *(_DWORD *)(a1 + 4)
      || *(_DWORD *)(a1 + 8)
      || *(_DWORD *)(a1 + 12)
      || *(_DWORD *)(a1 + 16)
      || *(_DWORD *)(a1 + 20)
      || *(_DWORD *)(a1 + 24)
      || *(_DWORD *)(a1 + 28))
    {
      long long v41 = 0u;
      long long v42 = 0u;
      *(_OWORD *)__str = 0u;
      long long v40 = 0u;
      if (!inet_ntop(a2, (const void *)a1, __str, 0x40u)) {
        goto LABEL_33;
      }
      if (!*(_DWORD *)(a1 + 16) && !*(_DWORD *)(a1 + 20) && !*(_DWORD *)(a1 + 24) && !*(_DWORD *)(a1 + 28)) {
        goto LABEL_43;
      }
      uint64_t v22 = 0;
      int v23 = 0;
      while (1)
      {
        unsigned int v24 = *(_DWORD *)(a1 + 16 + v22);
        if (v24 != -1) {
          break;
        }
        v23 += 32;
        v22 += 4;
        if (v22 == 16)
        {
          int v23 = 128;
          goto LABEL_38;
        }
      }
      unsigned int v25 = bswap32(v24);
      if ((v25 & 0x80000000) != 0)
      {
        int v26 = 0;
        do
          char v27 = v26-- + 30;
        while (((v25 >> v27) & 1) != 0);
        v23 -= v26;
      }
LABEL_38:
      int v28 = a2 == 2 ? 32 : 128;
      if (v23 == v28) {
        snprintf(string, 0x40uLL, "%s");
      }
      else {
LABEL_43:
      }
        snprintf(string, 0x40uLL, "%s/%d");
      int8x16_t v19 = off_100010298[0];
      uint64_t v20 = string;
    }
    else
    {
      int8x16_t v19 = off_100010290[0];
      uint64_t v20 = off_100010388;
    }
LABEL_45:
    xpc_dictionary_set_string(v17, v19, v20);
    if (a6 == 6) {
      int64x2_t v29 = "tcp";
    }
    else {
      int64x2_t v29 = "udp";
    }
    int8x16_t v30 = getservbyport(v12, v29);
    unsigned int v31 = __rev16(v12);
    unsigned int v32 = __rev16(v11);
    if (off_1000101E0[0] == a8) {
      uint64_t v11 = v11;
    }
    else {
      uint64_t v11 = v32;
    }
    if (off_1000101E0[0] == a8) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = v31;
    }
    if (v30 && ((p_s_name = (const char **)&v30->s_name, a3 - 2 < 6) || !a3))
    {
      xpc_dictionary_set_uint64(v17, off_1000102C0[0], a3);
      xpc_dictionary_set_string(v17, off_1000102B0[0], *p_s_name);
    }
    else if (v12)
    {
      if (a3 - 2 >= 6 && a3)
      {
        if (!v11 || v12 == v11 || a3 > 9 || ((1 << a3) & 0x302) == 0) {
          goto LABEL_62;
        }
        xpc_dictionary_set_uint64(v17, off_1000102C0[0], a3);
        xpc_dictionary_set_uint64(v17, off_1000102B0[0], v12);
        int8x16_t v34 = off_1000102B8[0];
        xpc_object_t v35 = v17;
        uint64_t v36 = v11;
      }
      else
      {
        xpc_dictionary_set_uint64(v17, off_1000102C0[0], a3);
        int8x16_t v34 = off_1000102B0[0];
        xpc_object_t v35 = v17;
        uint64_t v36 = v12;
      }
      xpc_dictionary_set_uint64(v35, v34, v36);
    }
LABEL_62:
    xpc_dictionary_set_value(a7, a8, v17);
    uint64_t v21 = 1;
    goto LABEL_63;
  }
  sub_1000016C4();
  return 0;
}

void sub_100008140()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os log object", v0, 2u);
}

void sub_100008188()
{
  __assert_rtn("PFDClientNewConnection", "PFDClient.c", 1401, "__pfdnclients != 0");
}

void sub_1000081B4()
{
  __assert_rtn("__PFDClientRemoveConnection", "PFDClient.c", 1319, "__pfdnclients != 0");
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
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

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

const char *__cdecl gai_strerror(int a1)
{
  return _gai_strerror(a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

protoent *__cdecl getprotobynumber(int a1)
{
  return _getprotobynumber(a1);
}

servent *__cdecl getservbyport(int a1, const char *a2)
{
  return _getservbyport(a1, a2);
}

int inet_net_pton(int a1, const char *a2, void *a3, __darwin_size_t a4)
{
  return _inet_net_pton(a1, a2, a3, a4);
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

void os_release(void *object)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void sandbox_free_error(char *errorbuf)
{
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
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

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return _xpc_connection_get_name(connection);
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

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return _xpc_data_get_bytes(xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
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

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return _xpc_uuid_get_bytes(xuuid);
}