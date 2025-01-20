uint64_t sub_10000166C(uint64_t a1, int *a2, unsigned int a3, uint64_t a4, _DWORD *a5)
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v11;
  int v12;
  int v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;

  if (a3 <= 7)
  {
    *a5 = 107;
    v6 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "nlc_simulate";
      v7 = "%s: message too small";
      v8 = v6;
      v9 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v15, v9);
      return 5;
    }
    return 5;
  }
  if (*a2 != 21)
  {
    *a5 = 108;
    v11 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v12 = *a2;
      v15 = 136315650;
      v16 = "nlc_simulate";
      v17 = 1024;
      v18 = v12;
      v19 = 1024;
      v20 = 21;
      v7 = "%s: incompatible version %d, should be %d";
      v8 = v11;
      v9 = 24;
      goto LABEL_9;
    }
    return 5;
  }
  if (a2[1])
  {
    *a5 = 107;
    return 5;
  }
  v14 = sub_100002C6C(a2);
  *a5 = v14;
  if (v14 == 1) {
    return 0;
  }
  else {
    return 5;
  }
}

uint64_t sub_1000017E8(uint64_t a1, int *a2, unsigned int a3, uint64_t a4, _DWORD *a5)
{
  if (a3 <= 7)
  {
    *a5 = 107;
    v6 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      v17 = "nlc_stop_simulation";
      v7 = "%s: message too small";
      v8 = v6;
      uint32_t v9 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v16, v9);
      return 5;
    }
    return 5;
  }
  if (*a2 != 21)
  {
    *a5 = 108;
    v13 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v14 = *a2;
      int v16 = 136315650;
      v17 = "nlc_stop_simulation";
      __int16 v18 = 1024;
      int v19 = v14;
      __int16 v20 = 1024;
      int v21 = 21;
      v7 = "%s: incompatible version %d, should be %d";
      v8 = v13;
      uint32_t v9 = 24;
      goto LABEL_13;
    }
    return 5;
  }
  if (a2[1] != 1)
  {
    *a5 = 107;
LABEL_11:
    v15 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v7 = "Error stopping simulation";
      v8 = v15;
      uint32_t v9 = 2;
      goto LABEL_13;
    }
    return 5;
  }
  int v11 = sub_100002B70();
  uint64_t result = 0;
  *a5 = v11;
  if (v11 != 1) {
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_1000019AC(uint64_t a1, int *a2, unsigned int a3, _OWORD *a4, _DWORD *a5, uint64_t a6, _DWORD *a7)
{
  if (a3 > 7)
  {
    if (*a2 == 21)
    {
      if (a2[1] == 2)
      {
        *a5 = 208;
        a4[11] = 0u;
        a4[12] = 0u;
        a4[9] = 0u;
        a4[10] = 0u;
        a4[7] = 0u;
        a4[8] = 0u;
        a4[5] = 0u;
        a4[6] = 0u;
        a4[3] = 0u;
        a4[4] = 0u;
        a4[1] = 0u;
        a4[2] = 0u;
        *a4 = 0u;
        *(void *)a4 = 0x200000015;
        sub_100002DF8((uint64_t)a4);
        uint64_t result = 0;
        *a7 = 1;
        return result;
      }
      *a7 = 107;
      int v16 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        uint32_t v9 = "Error get simulation status";
        v10 = v16;
        uint32_t v11 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      *a7 = 108;
      int v14 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v15 = *a2;
        int v17 = 136315650;
        __int16 v18 = "nlc_get_status";
        __int16 v19 = 1024;
        int v20 = v15;
        __int16 v21 = 1024;
        int v22 = 21;
        uint32_t v9 = "%s: incompatible version %d, should be %d";
        v10 = v14;
        uint32_t v11 = 24;
        goto LABEL_11;
      }
    }
  }
  else
  {
    *a7 = 107;
    v8 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      __int16 v18 = "nlc_get_status";
      uint32_t v9 = "%s: message too small";
      v10 = v8;
      uint32_t v11 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v17, v11);
    }
  }
  return 5;
}

double sub_100001B9C()
{
  double result = 0.0;
  xmmword_10000C04C = 0u;
  unk_10000C05C = 0u;
  xmmword_10000C02C = 0u;
  unk_10000C03C = 0u;
  xmmword_10000C01C = 0u;
  return result;
}

uint64_t sub_100001BB8(int a1, _DWORD *a2)
{
  uint64_t v3 = 0;
  v4 = (int *)&xmmword_10000C01C + 1;
  while (1)
  {
    int v5 = *v4;
    v4 += 2;
    if (!v5) {
      break;
    }
    if (++v3 == 10)
    {
      if (dword_10000C070) {
        return 106;
      }
      uint64_t v3 = 10;
      break;
    }
  }
  v7 = (_DWORD *)&xmmword_10000C01C + 2 * v3;
  _DWORD *v7 = a1;
  v8 = v7 + 1;
  do
  {
    int v9 = random();
    *a2 = v9;
    _DWORD *v8 = v9;
  }
  while (!v9);
  ++dword_10000C06C;
  return 1;
}

uint64_t sub_100001C48(int a1, int a2)
{
  uint64_t v2 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v2 + 4) != a2 || *(_DWORD *)((char *)&xmmword_10000C01C + v2) != a1)
  {
    v2 += 8;
    if (v2 == 80) {
      return 103;
    }
  }
  return 1;
}

uint64_t sub_100001C8C(int a1, int a2)
{
  uint64_t v2 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v2) != a1 || *(_DWORD *)((char *)&xmmword_10000C01C + v2 + 4) != a2)
  {
    v2 += 8;
    if (v2 == 80) {
      return 103;
    }
  }
  *(void *)((char *)&xmmword_10000C01C + v2) = 0;
  --dword_10000C06C;
  return 1;
}

uint64_t sub_100001CE4(uint64_t a1, mach_port_name_t *a2, _DWORD *a3, int *a4, _OWORD *a5)
{
  mach_port_t previous = 0;
  long long v8 = a5[1];
  *(_OWORD *)token.val = *a5;
  *(_OWORD *)&token.val[4] = v8;
  CFErrorRef v26 = 0;
  int v9 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  CFTypeRef v10 = SecTaskCopyValueForEntitlement(v9, @"com.apple.private.nlcd-control", &v26);
  CFRelease(v9);
  if (!v10) {
    goto LABEL_9;
  }
  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFBooleanGetTypeID())
  {
    CFRelease(v10);
    goto LABEL_9;
  }
  int Value = CFBooleanGetValue((CFBooleanRef)v10);
  CFRelease(v10);
  if (!Value)
  {
LABEL_9:
    int v16 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Process not entitled for this action", (uint8_t *)&token, 2u);
    }
    int v15 = 0;
    uint64_t v14 = 5;
    goto LABEL_12;
  }
  if (dword_10000C06C >= 11)
  {
    v13 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No more connections available to nlcd", (uint8_t *)&token, 2u);
    }
    uint64_t v14 = 5;
    int v15 = 106;
    goto LABEL_12;
  }
  uint64_t v18 = mach_port_allocate(mach_task_self_, 1u, a2);
  if (v18)
  {
    uint64_t v14 = v18;
    __int16 v19 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Unable to allocate port for client", (uint8_t *)&token, 2u);
    }
    goto LABEL_24;
  }
  uint64_t inserted = mach_port_insert_right(mach_task_self_, *a2, *a2, 0x14u);
  if (inserted)
  {
    uint64_t v14 = inserted;
    __int16 v21 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      int v22 = "Insert right failed on client port";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&token, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  uint64_t v23 = mach_port_move_member(mach_task_self_, *a2, dword_10000C080);
  if (v23)
  {
    uint64_t v14 = v23;
    __int16 v21 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      int v22 = "Unable to add client port to portset";
      goto LABEL_22;
    }
LABEL_23:
    mach_port_destroy(mach_task_self_, *a2);
LABEL_24:
    int v15 = 105;
    goto LABEL_12;
  }
  if (mach_port_request_notification(mach_task_self_, *a2, 70, 1u, *a2, 0x15u, &previous))
  {
    v24 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Unable to register for notifications on client port", (uint8_t *)&token, 2u);
    }
    mach_port_destroy(mach_task_self_, *a2);
    uint64_t v14 = 5;
    goto LABEL_24;
  }
  if (sub_100001BB8(*a2, a3) == 1)
  {
    uint64_t v14 = 0;
    int v15 = 1;
  }
  else
  {
    v25 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Unable to create session for client", (uint8_t *)&token, 2u);
    }
    mach_port_destroy(mach_task_self_, *a2);
    uint64_t v14 = 5;
    int v15 = 102;
  }
LABEL_12:
  *a4 = v15;
  return v14;
}

uint64_t sub_100002080(int a1, int a2, int *a3)
{
  uint64_t v4 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v4 + 4) != a2 || *(_DWORD *)((char *)&xmmword_10000C01C + v4) != a1)
  {
    v4 += 8;
    if (v4 == 80)
    {
LABEL_10:
      v6 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to disconnect", v9, 2u);
      }
      int v7 = 103;
      goto LABEL_13;
    }
  }
  uint64_t v5 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v5) != a1 || *(_DWORD *)((char *)&xmmword_10000C01C + v5 + 4) != a2)
  {
    v5 += 8;
    if (v5 == 80) {
      goto LABEL_10;
    }
  }
  *(void *)((char *)&xmmword_10000C01C + v5) = 0;
  --dword_10000C06C;
  int v7 = 1;
LABEL_13:
  *a3 = v7;
  return 0;
}

uint64_t sub_100002178()
{
  long long v8 = 0;
  socklen_t v7 = 0;
  if ((sub_100002234(&v8, &v7) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v0 = 40268;
LABEL_3:
  uint64_t v1 = v0 + 1;
  unint64_t v2 = v7;
  uint64_t v3 = (char *)v8;
  if (v7 >= 0x160)
  {
    while (*(void *)v3 == 0x4000)
    {
      if (v1 == *((_DWORD *)v3 + 2))
      {
        if (v0++ >= 0xFFFF) {
          break;
        }
        goto LABEL_3;
      }
      int v4 = 184 * *((_DWORD *)v3 + 67) + 352;
      v3 += v4;
      v2 -= v4;
      if (v2 < 0x160) {
        break;
      }
    }
  }
  if (v8) {
    free(v8);
  }
  return v1;
}

uint64_t sub_100002234(void *a1, socklen_t *a2)
{
  int v4 = 0;
  socklen_t v5 = 1024;
  socklen_t v16 = 1024;
  do
  {
    socklen_t v6 = v16;
    if (v16 < v5) {
      goto LABEL_7;
    }
    int v7 = 2 * v5;
    socklen_t v5 = 2 * v5 + 200;
    socklen_t v16 = v7 + 200;
    long long v8 = malloc_type_realloc(v4, (v7 + 200), 0x1F393A34uLL);
    if (!v8)
    {
      CFTypeRef v10 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        return 0xFFFFFFFFLL;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "get_dummynet_rules";
      CFTypeID v11 = "%s: realloc\n";
      v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_12;
    }
    int v4 = v8;
  }
  while ((sub_100002510(64, v8, &v16) & 0x80000000) == 0);
  if (*__error() == 55)
  {
    socklen_t v16 = 0;
    free(v4);
    int v4 = 0;
    socklen_t v6 = v16;
LABEL_7:
    *a1 = v4;
    *a2 = v6;
    return 1;
  }
  free(v4);
  uint64_t v14 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    int v15 = *__error();
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "get_dummynet_rules";
    __int16 v19 = 1024;
    int v20 = v15;
    CFTypeID v11 = "%s: IP_DUMMYNET_GET failed (%d)\n";
    v12 = v14;
    uint32_t v13 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
  }
  return 0xFFFFFFFFLL;
}

void sub_1000023EC(int a1)
{
  memset(v11, 0, sizeof(v11));
  DWORD2(v11[0]) = a1;
  socklen_t v4 = 352;
  if (sub_100002510(61, v11, &v4))
  {
    unint64_t v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v3 = *__error();
      *(_DWORD *)buf = 136315650;
      socklen_t v6 = "delete_pipe";
      __int16 v7 = 1024;
      int v8 = a1;
      __int16 v9 = 1024;
      int v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: IP_DUMMYNET_DEL(pipe %d) failed (%d)\n", buf, 0x18u);
    }
  }
}

uint64_t sub_100002510(int a1, void *a2, socklen_t *a3)
{
  int v6 = dword_10000C000;
  if (dword_10000C000 == -1)
  {
    int v6 = socket(2, 3, 255);
    dword_10000C000 = v6;
    if ((v6 & 0x80000000) == 0)
    {
LABEL_3:
      if (a1 == 64)
      {
        return getsockopt(v6, 0, 64, a2, a3);
      }
      else
      {
        socklen_t v9 = *a3;
        return setsockopt(v6, 0, a1, a2, v9);
      }
    }
  }
  else if ((dword_10000C000 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  int v8 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    CFTypeID v11 = "do_cmd";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: socket unavailable\n", (uint8_t *)&v10, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000269C(int a1, float *a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  float v2 = a2[2];
  DWORD2(v12) = a1;
  if (v2 != 0.0)
  {
    double v3 = v2;
    if (v2 < 0.0) {
      double v3 = 0.0;
    }
    if (v2 <= 1.0) {
      double v4 = v3;
    }
    else {
      double v4 = 1.0;
    }
    HIDWORD(v24) = (int)(v4 * 2147483650.0);
  }
  float v5 = *a2;
  if (!*(_DWORD *)a2) {
    goto LABEL_15;
  }
  *((float *)&v12 + 3) = *a2;
  int v6 = *((_DWORD *)a2 + 1);
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_14;
    }
    int v7 = 1000000;
  }
  else
  {
    int v7 = 1000;
  }
  LODWORD(v5) *= v7;
  *((float *)&v12 + 3) = v5;
LABEL_14:
  if ((LODWORD(v5) & 0x80000000) == 0)
  {
LABEL_15:
    if (*((_DWORD *)a2 + 3)) {
      *(float *)&long long v13 = a2[3];
    }
    if (*((_DWORD *)a2 + 4))
    {
      *((float *)&v24 + 2) = a2[4];
      if (*((_DWORD *)a2 + 5) == 1) {
        WORD1(v23) = 8;
      }
    }
    socklen_t v10 = 352;
    if (sub_100002510(60, &v12, &v10)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  socklen_t v9 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    socklen_t v10 = 136315138;
    CFTypeID v11 = "config_pipe";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: bandwidth too large\n", (uint8_t *)&v10, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100002844(int a1, uint64_t a2)
{
  long long v17 = 0;
  socklen_t v16 = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)(a2 + 32) = 0;
  if ((sub_100002234(&v17, &v16) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  double v4 = v17;
  socklen_t v5 = v16;
  int v6 = (char *)v17;
  do
  {
    if (v5 < 0x160 || (int v7 = v6, *(void *)v6 != 0x4000))
    {
      uint64_t v11 = 0;
      if (!v17) {
        return v11;
      }
      goto LABEL_15;
    }
    int v8 = 184 * *((_DWORD *)v6 + 67) + 352;
    v6 += v8;
    v5 -= v8;
  }
  while (*((_DWORD *)v7 + 2) != a1);
  int v9 = *((_DWORD *)v7 + 51);
  if (v9)
  {
    if (v9 == 0x7FFFFFFF) {
      float v10 = 1.0;
    }
    else {
      float v10 = (double)v9 / 2147483650.0;
    }
  }
  else
  {
    float v10 = 0.0;
  }
  int v12 = *((_DWORD *)v7 + 4);
  int v13 = *((_DWORD *)v7 + 3) / 1000;
  *(float *)(a2 + 8) = v10;
  *(_DWORD *)a2 = v13;
  *(_DWORD *)(a2 + 4) = 0;
  int v14 = *((_DWORD *)v7 + 50);
  *(_DWORD *)(a2 + 12) = v12;
  *(_DWORD *)(a2 + 16) = v14;
  *(_DWORD *)(a2 + 20) = (*((unsigned __int16 *)v7 + 89) >> 3) & 1;
  uint64_t v11 = 1;
  if (v4) {
LABEL_15:
  }
    free(v4);
  return v11;
}

BOOL sub_100002974()
{
  int v4 = 0;
  size_t v3 = 4;
  int v0 = sysctlbyname("net.link.generic.system.enable_netagent", &v4, &v3, 0, 0);
  if (v0)
  {
    int v1 = v0;
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100006904(v1);
      return 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "enable_netagent = 0x%x\n", buf, 8u);
    }
    return v4 == 1;
  }
  return result;
}

void sub_100002A74(int a1)
{
  int v4 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "set enable_netagent %d", buf, 8u);
  }
  int v2 = sysctlbyname("net.link.generic.system.enable_netagent", 0, 0, &v4, 4uLL);
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000069A8(&v4, v3);
    }
  }
}

void sub_100002B60()
{
}

void sub_100002B68()
{
}

uint64_t sub_100002B70()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315650;
    int v2 = "kc_stop_simulation";
    __int16 v3 = 1024;
    int v4 = dword_10000C070;
    __int16 v5 = 1024;
    int v6 = sub_100002E54();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: kc_was_netagent_disabled %d netem_is_simulation_on() %d", (uint8_t *)&v1, 0x18u);
  }
  if (sub_100002E54()) {
    return sub_100003698();
  }
  if ((_BYTE)dword_10000C070)
  {
    sub_100002A74(1);
    LOBYTE(dword_10000C070) = 0;
  }
  return sub_100005EA0();
}

uint64_t sub_100002C6C(_DWORD *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "kc_start_simulation";
    __int16 v7 = 1024;
    int v8 = dword_10000C070;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: kc_was_netagent_disabled %d", (uint8_t *)&v5, 0x12u);
  }
  BOOL v2 = sub_100002E60(a1);
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (!v2)
  {
    if (v3)
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "simulation using packetfilter", (uint8_t *)&v5, 2u);
    }
    if (sub_100002974())
    {
      sub_100002A74(0);
      LOBYTE(dword_10000C070) = 1;
    }
    return sub_100006048((uint64_t)a1);
  }
  if (v3)
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "simulation using NetEm", (uint8_t *)&v5, 2u);
  }
  uint64_t result = sub_1000030E0((uint64_t)a1);
  if (result != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006A38();
    }
    return sub_100006048((uint64_t)a1);
  }
  return result;
}

uint64_t sub_100002DF8(uint64_t a1)
{
  if (sub_100002E54())
  {
    return sub_100003784(a1);
  }
  else
  {
    return sub_10000517C(a1);
  }
}

uint64_t sub_100002E54()
{
  return BYTE1(dword_10000C070);
}

BOOL sub_100002E60(_DWORD *a1)
{
  int v7 = 0;
  size_t v6 = 4;
  int v2 = sysctlbyname("net.link.generic.system.if_attach_nx", &v7, &v6, 0, 0);
  BOOL result = 0;
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "if_attach_nx = 0x%x\n", buf, 8u);
    }
    if ((~v7 & 7) != 0) {
      return 0;
    }
    if (a1[2])
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      *(_WORD *)buf = 0;
      int v4 = "NetEm doesn't support secondary condition";
      goto LABEL_20;
    }
    if (!a1[29])
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      *(_WORD *)buf = 0;
      int v4 = "NetEm doesn't support loopback";
      goto LABEL_20;
    }
    if (a1[28] || a1[40] || a1[42] || a1[41] || a1[49] || a1[50] || a1[51])
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      *(_WORD *)buf = 0;
      int v4 = "NetEm doesn't support family/proto/port config";
      goto LABEL_20;
    }
    if (a1[38] || a1[39] || a1[47] || a1[48])
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_WORD *)buf = 0;
        int v4 = "NetEm doesn't support qsize config";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v4, buf, 2u);
        return 0;
      }
    }
    else
    {
      BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      BOOL result = 1;
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "use NetEm simulation", buf, 2u);
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_1000030E0(uint64_t a1)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  memset(v12, 0, sizeof(v12));
  LODWORD(v13) = 1;
  unint64_t v1 = *(unsigned int *)(a1 + 172);
  if (v1)
  {
    int v2 = *(_DWORD *)(a1 + 176);
    if (v2 == 1)
    {
      unsigned int v3 = 1000000;
    }
    else
    {
      if (v2) {
        goto LABEL_8;
      }
      unsigned int v3 = 1000;
    }
    unint64_t v1 = v1 * (unint64_t)v3;
  }
  else
  {
    unint64_t v1 = -1;
  }
LABEL_8:
  *((void *)&v13 + 1) = v1;
  float v4 = *(float *)(a1 + 180) * 100000.0;
  LODWORD(v14) = *(_DWORD *)(a1 + 184);
  LODWORD(v15) = v4;
  LODWORD(v17) = 1;
  unint64_t v5 = *(unsigned int *)(a1 + 136);
  if (v5)
  {
    int v6 = *(_DWORD *)(a1 + 140);
    if (v6 == 1)
    {
      unsigned int v7 = 1000000;
    }
    else
    {
      if (v6) {
        goto LABEL_15;
      }
      unsigned int v7 = 1000;
    }
    unint64_t v5 = v5 * (unint64_t)v7;
  }
  else
  {
    unint64_t v5 = -1;
  }
LABEL_15:
  *((void *)&v17 + 1) = v5;
  int v9 = *(unsigned __int8 *)(a1 + 120);
  uint64_t v8 = a1 + 120;
  float v10 = *(float *)(v8 + 24) * 100000.0;
  LODWORD(v18) = *(_DWORD *)(v8 + 28);
  LODWORD(v19) = v10;
  if (v9)
  {
    if (sub_100003240(v8, (uint64_t)v12)) {
      return 0;
    }
  }
  else if (sub_100003510((uint64_t)v12, 1))
  {
    return 0;
  }
  uint64_t result = 1;
  BYTE1(dword_10000C070) = 1;
  return result;
}

uint64_t sub_100003240(uint64_t a1, uint64_t a2)
{
  long long v24 = 0u;
  long long v25 = 0u;
  if (a1)
  {
    *__error() = 0;
    int v4 = socket(2, 2, 0);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      __strlcpy_chk();
      if (ioctl(v5, 0xC02069D8uLL, &v24) < 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          long long v17 = __error();
          long long v18 = strerror(*v17);
          *(_DWORD *)buf = 136315394;
          uint64_t v21 = (uint64_t)v18;
          __int16 v22 = 2080;
          uint64_t v23 = a1;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ioctl get no traffic shaping error %s on %s", buf, 0x16u);
        }
      }
      else if (v25)
      {
        uint64_t v6 = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v21 = a1;
          unsigned int v7 = "no traffic shaping on %s";
          os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_25;
        }
        goto LABEL_27;
      }
      __strlcpy_chk();
      if ((ioctl(v5, 0xC0F06991uLL, a2) & 0x80000000) == 0 || *__error() == 2 || *__error() == 6 || *__error() == 19)
      {
        if (*__error() == 6)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100006ABC();
          }
        }
        else
        {
          if (*__error() != 19)
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
LABEL_26:
              uint64_t v6 = 0;
              goto LABEL_27;
            }
            *(_DWORD *)buf = 136315138;
            uint64_t v21 = a1;
            unsigned int v7 = "set interface link parameters on %s";
            os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v8, v7, buf, 0xCu);
            goto LABEL_26;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100006B2C();
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100006B9C(a1);
      }
      uint64_t v6 = 0xFFFFFFFFLL;
LABEL_27:
      close(v5);
      return v6;
    }
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_100006A80(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003510(uint64_t a1, char a2)
{
  BOOL v9 = 0;
  if (getifaddrs(&v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006CC4();
    }
    return 0xFFFFFFFFLL;
  }
  int v5 = v9;
  if (v9)
  {
    uint64_t v6 = 0;
    while (1)
    {
      if (v5->ifa_flags)
      {
        ifa_name = v5->ifa_name;
        if (!v6 || strcmp(v6, v5->ifa_name))
        {
          if (sub_100003AD4(ifa_name))
          {
            if (sub_100003240((uint64_t)v5->ifa_name, a1))
            {
              uint64_t v6 = ifa_name;
              if (a2) {
                return 0xFFFFFFFFLL;
              }
              goto LABEL_19;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            sub_100006C80(&v10, (uint64_t *)&v5->ifa_name, &v11);
          }
          uint64_t v6 = ifa_name;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        sub_100006C3C(&v12, (uint64_t)v5, &v13);
      }
LABEL_19:
      int v5 = v5->ifa_next;
      if (!v5)
      {
        os_log_type_t v8 = v9;
        goto LABEL_22;
      }
    }
  }
  os_log_type_t v8 = 0;
LABEL_22:
  freeifaddrs(v8);
  return 0;
}

uint64_t sub_100003698()
{
  memset(v10, 0, sizeof(v10));
  if (sub_100003510((uint64_t)v10, 0))
  {
    BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v0) {
      sub_100006D4C(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "netem simulation stop", v9, 2u);
  }
  BYTE1(dword_10000C070) = 0;
  return 1;
}

uint64_t sub_100003784(uint64_t a1)
{
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
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  long long v17 = 0;
  long long v18 = v19;
  int v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_100006A80(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 0;
  }
  int v3 = v2;
  if (getifaddrs(&v17) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006CC4();
  }
  uint64_t v4 = v17;
  if (!v17)
  {
LABEL_16:
    close(v3);
    return 0;
  }
  while ((v4->ifa_flags & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100006D88(&v32, (uint64_t)v4, &v33);
    }
LABEL_15:
    uint64_t v4 = v4->ifa_next;
    if (!v4) {
      goto LABEL_16;
    }
  }
  if ((sub_100003AD4(v4->ifa_name) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100006C80(&v30, (uint64_t *)&v4->ifa_name, &v31);
    }
    goto LABEL_15;
  }
  __strlcpy_chk();
  if (ioctl(v3, 0xC0F06992uLL, &v18) < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006DCC(&v15, v16);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    ifa_name = v4->ifa_name;
    *(_DWORD *)buf = 136315138;
    long long v29 = ifa_name;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "get interface link parameters on %s", buf, 0xCu);
  }
  if (sub_100003A48(*((unint64_t *)&v20 + 1), (unsigned int *)(a1 + 172), (int *)(a1 + 176))
    || sub_100003A48(*((unint64_t *)&v24 + 1), (unsigned int *)(a1 + 136), (int *)(a1 + 140)))
  {
    return 0;
  }
  *(float *)(a1 + 180) = (float)v22 / 100000.0;
  *(float *)(a1 + 144) = (float)v26 / 100000.0;
  *(_DWORD *)(a1 + 184) = v21;
  *(_DWORD *)(a1 + 148) = v25;
  return 1;
}

uint64_t sub_100003A48(unint64_t a1, unsigned int *a2, int *a3)
{
  unsigned int v3 = a1;
  if (a1 > 0xF4240)
  {
    int v4 = 1;
LABEL_5:
    uint64_t result = 0;
    *a3 = v4;
    *a2 = v3 / 0xF4240;
    return result;
  }
  if (a1 > 0x3E8)
  {
    int v4 = 0;
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006E10();
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003AD4(const char *a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  size_t v2 = strlen(off_10000C008);
  if (strncmp(a1, off_10000C008, v2))
  {
    int v3 = socket(2, 2, 0);
    if ((v3 & 0x80000000) == 0)
    {
      int v4 = v3;
      __strlcpy_chk();
      if (ioctl(v4, 0xC020699FuLL, &v15))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100006E80();
        }
      }
      else if (v16 == 6 || v16 == 255 || v16 == 144)
      {
        uint64_t v5 = 1;
        goto LABEL_14;
      }
      uint64_t v5 = 0;
LABEL_14:
      close(v4);
      return v5;
    }
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_100006A80(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return 0;
}

void sub_100003C1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003C38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

float *sub_100003C60@<X0>(float *result@<X0>, void *a2@<X2>, uint64_t a3@<X8>, float a4@<S0>)
{
  *uint64_t result = a4;
  *a2 = a3;
  return result;
}

void sub_100003C6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_100003C84(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  mig_reply_setup(a1, a2);
  a2[1].msgh_remote_port = -300;
  mach_msg_id_t msgh_id = a1->msgh_id;
  if ((msgh_id - 78) > 0xFFFFFFF1)
  {
    if (msgh_id == 70)
    {
      a2->msgh_bits = 0;
      a2->msgh_remote_port = 0;
      uint64_t result = 1;
      a2[1].msgh_remote_port = 0;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return sub_100006870(a1, (uint64_t)a2);
  }
  return result;
}

uint64_t sub_100003D08()
{
  mach_port_t sp = 0;
  if (bootstrap_check_in(bootstrap_port, "com.apple.NetworkLinkConditioner", &sp))
  {
    uint64_t v1 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)size_t v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "bootstrap_check_in failed, no port to listen on", v2, 2u);
    }
    exit(104);
  }
  mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10000C080);
  return mach_port_move_member(mach_task_self_, sp, dword_10000C080);
}

uint64_t sub_100003DC8()
{
  return mach_msg_server((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100003C84, 0x2044u, dword_10000C080, 50331648);
}

uint64_t start(uint64_t a1, char **a2)
{
  errorbuf = 0;
  if (sandbox_init("nlcd", 1uLL, &errorbuf) == -1) {
    sub_100006EF0((const char **)&errorbuf);
  }
  int v3 = *a2;
  int v4 = strrchr(v3, 47);
  if (v4) {
    uint64_t v5 = (uint64_t)(v4 + 1);
  }
  else {
    uint64_t v5 = (uint64_t)v3;
  }
  qword_10000C078 = v5;
  off_10000C010 = os_log_create("com.apple.nlcd", "default");
  sub_100003D08();
  unsigned int v6 = time(0);
  srandom(v6);
  sub_100001B9C();
  mach_msg_server((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100003C84, 0x2044u, dword_10000C080, 50331648);
  return 0;
}

uint64_t sub_100003EB4(const char *a1, int a2)
{
  if (dword_10000C018)
  {
    int v4 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "pf_add_pipe";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  if (!a1)
  {
    uint64_t v8 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315138;
    v45 = "pf_add_pipe";
    uint64_t v9 = "%s: conf == NULL";
LABEL_58:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
    goto LABEL_59;
  }
  int v5 = *(_DWORD *)a1;
  if (a2)
  {
    if ((v5 & 4) == 0)
    {
      unsigned int v6 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "pf_add_pipe";
        uint64_t v7 = "%s: OUTDIR && !(conf->flags & NLC_FLAG_SIMULATE_UPLINK)";
LABEL_14:
        uint64_t v10 = v6;
        uint32_t v11 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v7, buf, v11);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    uint64_t v13 = (int *)(a1 + 28);
  }
  else
  {
    if ((v5 & 8) == 0)
    {
      unsigned int v6 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "pf_add_pipe";
        uint64_t v7 = "%s: INDIR && !(conf->flags & NLC_FLAG_SIMULATE_DOWNLINK)";
        goto LABEL_14;
      }
LABEL_16:
      uint64_t v12 = 0;
      goto LABEL_60;
    }
    uint64_t v13 = (int *)(a1 + 64);
  }
  int v14 = sub_100002178();
  if (v14 == -1)
  {
    uint64_t v8 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315138;
    v45 = "pf_add_pipe";
    uint64_t v9 = "%s: getDummynetPipeNumber() returned -1 ";
    goto LABEL_58;
  }
  int v15 = v14;
  if ((sub_10000269C(v14, (float *)v13) & 0x80000000) != 0)
  {
    uint64_t v8 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315138;
    v45 = "pf_add_pipe";
    uint64_t v9 = "%s: config_pipe() returned -1 ";
    goto LABEL_58;
  }
  int v16 = 0;
  char v17 = 1;
  if (a2) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 1;
  }
  int v41 = v15;
  uint64_t v42 = v15;
  uint64_t value = v18;
  while (1)
  {
    char v19 = v17;
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    if (!v20)
    {
      v37 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "pf_add_pipe";
        __int16 v46 = 1024;
        int v47 = v41;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create pipe %d failed", buf, 0x12u);
      }
      goto LABEL_78;
    }
    long long v21 = v20;
    xpc_dictionary_set_uint64(v20, kPFAction, 0xBuLL);
    xpc_dictionary_set_uint64(v21, kPFDirection, value);
    xpc_dictionary_set_BOOL(v21, kPFQuick, 1);
    xpc_dictionary_set_BOOL(v21, kPFAllowOpts, 1);
    int v22 = *((_DWORD *)a1 + 1);
    if (v22 == 2 || !(v22 | v16))
    {
      xpc_dictionary_set_uint64(v21, kPFFamily, 2uLL);
      if (v13[6] == 58) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v13[6];
      }
      goto LABEL_36;
    }
    if (v22 == 30 || (v16 & (v22 == 0)) != 0)
    {
      xpc_dictionary_set_uint64(v21, kPFFamily, 0x1EuLL);
      if (v13[6] == 1) {
        uint64_t v23 = 58;
      }
      else {
        uint64_t v23 = v13[6];
      }
LABEL_36:
      xpc_dictionary_set_uint64(v21, kPFProtocol, v23);
    }
    xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
    if (!v24)
    {
      v38 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_76;
      }
      goto LABEL_77;
    }
    long long v25 = v24;
    xpc_dictionary_set_uint64(v24, kPFSubDummyNetPipe, v42);
    xpc_dictionary_set_uint64(v25, kPFSubDummyNetPipeType, 0x4000uLL);
    xpc_dictionary_set_value(v21, kPFDummyNet, v25);
    xpc_release(v25);
    int v26 = v13[8];
    if (!v26) {
      goto LABEL_43;
    }
    long long v27 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "pf_add_pipe";
      __int16 v46 = 1024;
      int v47 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s: linkconfig->src_port %u", buf, 0x12u);
    }
    xpc_object_t v28 = xpc_dictionary_create(0, 0, 0);
    if (!v28)
    {
      v38 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
LABEL_76:
        *(_DWORD *)buf = 136315394;
        v45 = "pf_add_pipe";
        __int16 v46 = 1024;
        int v47 = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create subrule_dn %d failed", buf, 0x12u);
      }
LABEL_77:
      xpc_release(v21);
LABEL_78:
      uint64_t v12 = 12;
      goto LABEL_60;
    }
    long long v29 = v28;
    xpc_dictionary_set_string(v28, kPFSubAddressLabel, kPFAny);
    xpc_dictionary_set_uint64(v29, kPFSubLowPort, v13[8]);
    xpc_dictionary_set_uint64(v29, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v21, kPFFrom, v29);
    xpc_release(v29);
LABEL_43:
    int v30 = v13[7];
    if (v30)
    {
      uint64_t v31 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "pf_add_pipe";
        __int16 v46 = 1024;
        int v47 = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s: linkconfig->dst_port %u", buf, 0x12u);
      }
      xpc_object_t v32 = xpc_dictionary_create(0, 0, 0);
      if (!v32)
      {
        v38 = off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
          goto LABEL_76;
        }
        goto LABEL_77;
      }
      uint64_t v33 = v32;
      xpc_dictionary_set_string(v32, kPFSubAddressLabel, kPFAny);
      xpc_dictionary_set_uint64(v33, kPFSubLowPort, v13[7]);
      xpc_dictionary_set_uint64(v33, kPFSubPortOperator, 2uLL);
      xpc_dictionary_set_value(v21, kPFTo, v33);
      xpc_release(v33);
    }
    if (a1[12]) {
      xpc_dictionary_set_string(v21, kPFInterface, a1 + 12);
    }
    char v34 = PFUserAddRule();
    xpc_release(v21);
    if ((v34 & 1) == 0) {
      break;
    }
    uint64_t v12 = *((unsigned int *)a1 + 1);
    if (v12)
    {
      v40 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315394;
      v45 = "pf_add_pipe";
      __int16 v46 = 1024;
      int v47 = v12;
      uint64_t v7 = "%s: done netlink->family != AF_UNSPEC %u";
      uint64_t v10 = v40;
      uint32_t v11 = 18;
      goto LABEL_15;
    }
    char v17 = 0;
    int v16 = 1;
    if ((v19 & 1) == 0) {
      goto LABEL_60;
    }
  }
  v39 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "pf_add_pipe";
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", buf, 0xCu);
  }
  sub_1000023EC(v41);
LABEL_59:
  uint64_t v12 = 0xFFFFFFFFLL;
LABEL_60:
  if (dword_10000C018)
  {
    v35 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "pf_add_pipe";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
    }
  }
  return v12;
}

uint64_t sub_100004764()
{
  if (dword_10000C018)
  {
    BOOL v0 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "pf_add_noloopbackrule";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v9, 0xCu);
    }
  }
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  if (v1)
  {
    size_t v2 = v1;
    xpc_dictionary_set_uint64(v1, kPFAction, 0xCuLL);
    xpc_dictionary_set_uint64(v2, kPFDirection, 0);
    xpc_dictionary_set_BOOL(v2, kPFQuick, 1);
    xpc_dictionary_set_string(v2, kPFInterface, "lo0");
    char v3 = PFUserAddRule();
    xpc_release(v2);
    if (v3)
    {
      uint64_t v4 = 0;
    }
    else
    {
      unsigned int v6 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        uint64_t v10 = "pf_add_noloopbackrule";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", (uint8_t *)&v9, 0xCu);
      }
      uint64_t v4 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    int v5 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "pf_add_noloopbackrule";
      uint64_t v4 = 12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create failed", (uint8_t *)&v9, 0xCu);
    }
    else
    {
      uint64_t v4 = 12;
    }
  }
  if (dword_10000C018)
  {
    uint64_t v7 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "pf_add_noloopbackrule";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

uint64_t sub_1000049D0()
{
  if (dword_10000C018)
  {
    BOOL v0 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "pf_add_allowoptsrule";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v9, 0xCu);
    }
  }
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  if (v1)
  {
    size_t v2 = v1;
    xpc_dictionary_set_uint64(v1, kPFAction, 0);
    xpc_dictionary_set_uint64(v2, kPFDirection, 0);
    xpc_dictionary_set_BOOL(v2, kPFAllowOpts, 1);
    char v3 = PFUserAddRule();
    xpc_release(v2);
    if (v3)
    {
      uint64_t v4 = 0;
    }
    else
    {
      unsigned int v6 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        uint64_t v10 = "pf_add_allowoptsrule";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", (uint8_t *)&v9, 0xCu);
      }
      uint64_t v4 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    int v5 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "pf_add_allowoptsrule";
      uint64_t v4 = 12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create", (uint8_t *)&v9, 0xCu);
    }
    else
    {
      uint64_t v4 = 12;
    }
  }
  if (dword_10000C018)
  {
    uint64_t v7 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "pf_add_allowoptsrule";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

uint64_t sub_100004C20()
{
  if (dword_10000C018)
  {
    BOOL v0 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v12, 0xCu);
    }
  }
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  if (!v1)
  {
    uint64_t v7 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = "pf_add_scrubrule";
      uint64_t v6 = 12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create", (uint8_t *)&v12, 0xCu);
      goto LABEL_17;
    }
LABEL_13:
    uint64_t v6 = 12;
    goto LABEL_17;
  }
  size_t v2 = v1;
  xpc_dictionary_set_uint64(v1, kPFAction, 2uLL);
  xpc_dictionary_set_uint64(v2, kPFDirection, 0);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    uint64_t v8 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create subrule_scrub failed", (uint8_t *)&v12, 0xCu);
    }
    xpc_release(v2);
    goto LABEL_13;
  }
  uint64_t v4 = v3;
  xpc_dictionary_set_uint64(v3, kPFSubScrubFlags, 0x100uLL);
  xpc_dictionary_set_value(v2, kPFScrubOptions, v4);
  xpc_release(v4);
  char v5 = PFUserAddRule();
  xpc_release(v2);
  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    int v9 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v6 = 0xFFFFFFFFLL;
  }
LABEL_17:
  if (dword_10000C018)
  {
    uint64_t v10 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v12, 0xCu);
    }
  }
  return v6;
}

uint64_t sub_100004F04()
{
  if (dword_10000C018)
  {
    BOOL v0 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint32_t v11 = "pf_delete_pipes";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v10, 0xCu);
    }
  }
  xpc_object_t v1 = (void *)PFUserCopyRules_S();
  size_t v2 = v1;
  if (v1)
  {
    if (xpc_array_get_count(v1))
    {
      size_t v3 = 0;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(v2, v3);
        if (!value) {
          break;
        }
        int v5 = sub_100005114(value);
        if (v5 >= 1) {
          sub_1000023EC(v5);
        }
        if (xpc_array_get_count(v2) <= ++v3) {
          goto LABEL_17;
        }
      }
      uint64_t v6 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        uint32_t v11 = "pf_delete_pipes";
        uint64_t v7 = "%s: pf_delete_pipes failed";
        goto LABEL_16;
      }
    }
  }
  else
  {
    uint64_t v6 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint32_t v11 = "pf_delete_pipes";
      uint64_t v7 = "%s: PFUserCopyRules_S failed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, 0xCu);
    }
  }
LABEL_17:
  if (dword_10000C018)
  {
    uint64_t v8 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint32_t v11 = "pf_delete_pipes";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v2) {
    xpc_release(v2);
  }
  return 0;
}

uint64_t sub_100005114(void *a1)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFDummyNet);
  if (value && (size_t v2 = value, xpc_dictionary_get_uint64(value, kPFSubDummyNetPipeType) == 0x4000)) {
    return xpc_dictionary_get_uint64(v2, kPFSubDummyNetPipe);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

BOOL sub_10000517C(uint64_t a1)
{
  long long v56 = 0uLL;
  int v57 = 0;
  int v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  v48[0] = 0;
  v48[1] = 0;
  if (dword_10000C018)
  {
    xpc_object_t v1 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  int v2 = sub_100005848(v48);
  if (v2) {
    goto LABEL_63;
  }
  xpc_object_t xarray = (xpc_object_t)PFUserCopyRules_S();
  if (!xarray)
  {
    uint64_t v33 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s: PFUserCopyRules_S failed", buf, 0xCu);
    }
    goto LABEL_63;
  }
  size_t count = xpc_array_get_count(xarray);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 0;
  unint64_t v46 = count;
  if (!count) {
    goto LABEL_62;
  }
  size_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v43 = 0;
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  uint64_t v9 = 0xFFFFFFFFLL;
  int v10 = (const char **)&kPFProtocol;
  while (1)
  {
    xpc_object_t value = xpc_array_get_value(xarray, v4);
    if (!value)
    {
      char v34 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_62;
      }
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      v35 = "%s: PFGetUserRules_S failed";
      goto LABEL_60;
    }
    int v12 = value;
    int v13 = sub_100005114(value);
    if (v13 < 0)
    {
      xpc_object_t v20 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "pf_list_rules";
        __int16 v54 = 1024;
        int v55 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s: rule_pipenum %d < 0", buf, 0x12u);
      }
      goto LABEL_46;
    }
    v45 = v7;
    if (v46 > v8 + 1)
    {
      uint64_t v42 = v5;
      int v14 = v10;
      uint64_t v15 = v9;
      uint64_t v16 = v6;
      xpc_object_t v17 = xpc_array_get_value(xarray, v8 + 1);
      if (!v17)
      {
        char v34 = off_10000C010;
        if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
          goto LABEL_62;
        }
        *(_DWORD *)buf = 136315138;
        v53 = "pf_list_rules";
        v35 = "%s: PFGetUserRules_S failed";
        goto LABEL_60;
      }
      uint64_t v18 = v17;
      int v19 = sub_100005114(v17);
      if (v19 >= 1 && v13 == v19)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v12, kPFDirection);
        if (uint64 == xpc_dictionary_get_uint64(v18, kPFDirection))
        {
          ++v8;
          uint64_t v6 = 1;
        }
        else
        {
          uint64_t v6 = v16;
        }
      }
      else
      {
        uint64_t v6 = v16;
      }
      uint64_t v9 = v15;
      int v10 = v14;
      uint64_t v5 = v42;
    }
    if ((int)sub_100002844(v13, (uint64_t)&v49) <= 0) {
      break;
    }
    int v21 = 0;
    long long v56 = 0uLL;
    int v57 = 0;
    if (!v6) {
      int v21 = xpc_dictionary_get_uint64(v12, kPFFamily);
    }
    DWORD2(v50) = xpc_dictionary_get_uint64(v12, *v10);
    xpc_object_t v22 = xpc_dictionary_get_value(v12, kPFFrom);
    if (v22)
    {
      uint64_t v23 = v22;
      if (xpc_dictionary_get_uint64(v22, kPFSubPortOperator) == 2) {
        int v51 = xpc_dictionary_get_uint64(v23, kPFSubLowPort);
      }
    }
    xpc_object_t v24 = xpc_dictionary_get_value(v12, kPFTo);
    if (v24)
    {
      long long v25 = v24;
      if (xpc_dictionary_get_uint64(v24, kPFSubPortOperator) == 2) {
        HIDWORD(v50) = xpc_dictionary_get_uint64(v25, kPFSubLowPort);
      }
    }
    if (!v45 || v21 != *v45 && (*v45 != 2 || v21 != 30 || DWORD2(v50) != 58 || *(_DWORD *)(v43 + 24) != 1))
    {
      xpc_dictionary_get_uint64(v12, kPFDirection);
LABEL_41:
      if ((int)v9 < 1)
      {
        uint64_t v5 = a1 + 100 * ((int)v9 + 1) + 8;
        uint64_t v9 = (int)v9 + 1;
        goto LABEL_43;
      }
      char v34 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
        goto LABEL_62;
      }
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      v35 = "%s: too many configs, giving up";
LABEL_60:
      v37 = v34;
      uint32_t v38 = 12;
      goto LABEL_61;
    }
    uint64_t v26 = xpc_dictionary_get_uint64(v12, kPFDirection);
    if (v26 != 2)
    {
      if (v26 != 1 || (*(unsigned char *)v5 & 8) == 0) {
        goto LABEL_43;
      }
      goto LABEL_41;
    }
    if ((*(unsigned char *)v5 & 4) != 0) {
      goto LABEL_41;
    }
LABEL_43:
    *(_DWORD *)(v5 + 4) = v21;
    uint64_t v7 = (_DWORD *)(v5 + 4);
    long long v27 = v56;
    *(_DWORD *)(v5 + 24) = v57;
    *(_OWORD *)(v5 + 8) = v27;
    uint64_t v28 = xpc_dictionary_get_uint64(v12, kPFDirection);
    int v29 = *(_DWORD *)v5;
    if (v28 == 1)
    {
      *(_DWORD *)uint64_t v5 = v29 | 8;
      uint64_t v43 = v5 + 64;
      long long v30 = v50;
      *(_OWORD *)(v5 + 64) = v49;
      *(_OWORD *)(v5 + 80) = v30;
      *(_DWORD *)(v5 + 96) = v51;
    }
    else
    {
      *(_DWORD *)uint64_t v5 = v29 | 4;
      uint64_t v43 = v5 + 28;
      int v31 = v51;
      long long v32 = v50;
      *(_OWORD *)(v5 + 28) = v49;
      *(_OWORD *)(v5 + 44) = v32;
      *(_DWORD *)(v5 + 60) = v31;
    }
LABEL_46:
    size_t v4 = ++v8;
    if (v46 <= v8) {
      goto LABEL_62;
    }
  }
  v36 = off_10000C010;
  if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
    goto LABEL_62;
  }
  *(_DWORD *)buf = 136315394;
  v53 = "pf_list_rules";
  __int16 v54 = 1024;
  int v55 = v13;
  v35 = "%s: unknown pipe %d";
  v37 = v36;
  uint32_t v38 = 18;
LABEL_61:
  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v35, buf, v38);
LABEL_62:
  xpc_release(xarray);
  int v2 = 0;
LABEL_63:
  sub_100005A64(v48);
  if (dword_10000C018)
  {
    v39 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
    }
  }
  return v2 == 0;
}

uint64_t sub_100005848(uint64_t *a1)
{
  if (dword_10000C018)
  {
    int v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v11, 0xCu);
    }
  }
  *a1 = 0;
  a1[1] = 0;
  uint64_t v3 = PFUserCreate();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = PFUserBeginRules();
    if (v5 != -1)
    {
      uint64_t v6 = v5;
      uint64_t result = 0;
      *a1 = v4;
      a1[1] = v6;
      return result;
    }
    uint64_t v9 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: PFUserBeginRules failed", (uint8_t *)&v11, 0xCu);
    }
    PFUserRelease();
  }
  else
  {
    unsigned int v8 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: PFUserCreate failed", (uint8_t *)&v11, 0xCu);
    }
  }
  if (dword_10000C018)
  {
    int v10 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v11, 0xCu);
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_100005A64(void *a1)
{
  if (dword_10000C018)
  {
    int v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "cleanPFContext";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*a1) {
    PFUserRelease();
  }
  *a1 = 0;
  a1[1] = 0;
  if (dword_10000C018)
  {
    uint64_t v3 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "cleanPFContext";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t sub_100005B90(int a1, uint64_t a2)
{
  if (dword_10000C018)
  {
    int v4 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "pf_find_token";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  *(_OWORD *)buf = 0uLL;
  if (ioctl(a1, 0xC0104405uLL, buf) < 0)
  {
    if (*__error() == 2) {
      goto LABEL_18;
    }
    int v12 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_DWORD *)long long v25 = 136315138;
    uint64_t v26 = "pf_find_token";
    int v13 = "%s: DIOCGETSTARTERS failed";
    int v14 = v12;
    uint32_t v15 = 12;
    goto LABEL_17;
  }
  uint64_t v5 = malloc_type_malloc(2 * *(int *)buf, 0x285F6EEuLL);
  if (v5)
  {
    uint64_t v6 = v5;
    *(void *)&buf[8] = v5;
    if (ioctl(a1, 0xC0104405uLL, buf) < 0)
    {
      if (*__error() != 2)
      {
        uint64_t v18 = off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long v25 = 136315138;
          uint64_t v26 = "pf_find_token";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s: DIOCGETSTARTERS failed", v25, 0xCu);
        }
      }
    }
    else
    {
      int v7 = *(_DWORD *)buf;
      if (*(int *)buf >= 1)
      {
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)&buf[8];
        int v10 = (const char *)qword_10000C078;
        while (1)
        {
          uint64_t v11 = v9 + v8;
          if (!strcmp((const char *)(v9 + v8 + 20), v10)) {
            break;
          }
          v8 += 84;
          if ((int)v8 >= v7) {
            goto LABEL_22;
          }
        }
        long long v21 = *(_OWORD *)(v11 + 16);
        *(_OWORD *)a2 = *(_OWORD *)v11;
        *(_OWORD *)(a2 + 16) = v21;
        long long v22 = *(_OWORD *)(v11 + 32);
        long long v23 = *(_OWORD *)(v11 + 48);
        long long v24 = *(_OWORD *)(v11 + 64);
        *(_DWORD *)(a2 + 80) = *(_DWORD *)(v11 + 80);
        *(_OWORD *)(a2 + 48) = v23;
        *(_OWORD *)(a2 + 64) = v24;
        *(_OWORD *)(a2 + 32) = v22;
        uint64_t v17 = 1;
        goto LABEL_23;
      }
    }
LABEL_22:
    uint64_t v17 = 0;
LABEL_23:
    free(v6);
    goto LABEL_24;
  }
  uint64_t v16 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v25 = 0;
    int v13 = "malloc";
    int v14 = v16;
    uint32_t v15 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, v25, v15);
  }
LABEL_18:
  uint64_t v17 = 0;
LABEL_24:
  if (dword_10000C018)
  {
    int v19 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long v25 = 136315138;
      uint64_t v26 = "pf_find_token";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s:end", v25, 0xCu);
    }
  }
  return v17;
}

uint64_t sub_100005EA0()
{
  v5[0] = 0;
  v5[1] = 0;
  if (dword_10000C018)
  {
    BOOL v0 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  if (sub_100005848(v5)) {
    goto LABEL_9;
  }
  sub_100004F04();
  if ((PFUserDeleteRules() & 1) == 0)
  {
    int v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: PFUserCommitRules failed", buf, 0xCu);
    }
LABEL_9:
    uint64_t v1 = 0;
    goto LABEL_10;
  }
  uint64_t v1 = 1;
LABEL_10:
  sub_100005A64(v5);
  if (dword_10000C018)
  {
    uint64_t v3 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
    }
  }
  return v1;
}

uint64_t sub_100006048(uint64_t a1)
{
  v20[0] = 0;
  v20[1] = 0;
  if (dword_10000C018)
  {
    int v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v22 = "pf_add_rules";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  if (sub_100005EA0())
  {
    if (sub_100005848(v20) || sub_1000049D0() || sub_100004C20()) {
      goto LABEL_35;
    }
    uint64_t v3 = 0;
    int v4 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      uint64_t v7 = a1 + 100 * v3;
      int v9 = *(_DWORD *)(v7 + 8);
      uint64_t v8 = (const char *)(v7 + 8);
      if (v9)
      {
        if (v4)
        {
          int v4 = 1;
        }
        else if (*(_DWORD *)(a1 + 100 * v3 + 16))
        {
          sub_100004764();
          int v4 = v6 & 1;
        }
        else
        {
          int v4 = 0;
        }
        if (sub_100003EB4(v8, 0) || sub_100003EB4(v8, 1)) {
          goto LABEL_35;
        }
      }
      else
      {
        int v10 = off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          long long v22 = "pf_add_rules";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: done conf->flags == 0", buf, 0xCu);
        }
      }
      char v5 = 0;
      uint64_t v3 = 1;
    }
    while ((v6 & 1) != 0);
    if (dword_10000C018)
    {
      uint64_t v11 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v22 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
      }
    }
    if (PFUserCommitRules())
    {
      int v12 = 0;
    }
    else
    {
      uint32_t v15 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v22 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s: PFUserCommitRules failed", buf, 0xCu);
      }
      int v12 = -1;
    }
    if (dword_10000C018)
    {
      uint64_t v16 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v22 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
      }
    }
    if (v12)
    {
LABEL_35:
      uint64_t v17 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v22 = "pf_add_rules";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s: result != 0", buf, 0xCu);
      }
      sub_100004F04();
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = 1;
    }
    sub_100005A64(v20);
    if (dword_10000C018)
    {
      uint64_t v18 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v22 = "pf_add_rules";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
      }
    }
  }
  else
  {
    int v13 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v22 = "pf_add_rules";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: pf_delete_rules() failed", buf, 0xCu);
    }
    return 0;
  }
  return v14;
}

uint64_t sub_100006474(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 40273) >= 0xFFFFFFFB) {
    return (uint64_t)*(&off_1000082C0 + 5 * (v1 - 40268) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *sub_1000064B0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  uint64_t v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(void *)(a2 + 32) = 0x11000000000000;
  uint64_t v5 = result[3];
  long long v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  uint64_t result = (_DWORD *)sub_100001CE4(v5, (mach_port_name_t *)(a2 + 28), (_DWORD *)(a2 + 48), (int *)(a2 + 52), v7);
  if (!result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000658C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_100002080(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100006610(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (unsigned int v3 = result[1], v3 < 0x28)
    || v3 > 0x428
    || (unsigned int v4 = result[8], v4 > 0x400)
    || ((unsigned int v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), !v6))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v7 = NDR_record;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = v7;
    return result;
  }
  uint64_t result = (_DWORD *)sub_10000166C(result[3], result + 9, v4, *(unsigned int *)((char *)result + v5 + 36), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v7 = NDR_record;
  if (result) {
    goto LABEL_10;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_1000066C8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (unsigned int v3 = result[1], v3 < 0x28)
    || v3 > 0x428
    || (unsigned int v4 = result[8], v4 > 0x400)
    || ((unsigned int v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), !v6))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v7 = NDR_record;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = v7;
    return result;
  }
  uint64_t result = (_DWORD *)sub_1000017E8(result[3], result + 9, v4, *(unsigned int *)((char *)result + v5 + 36), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v7 = NDR_record;
  if (result) {
    goto LABEL_10;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_100006780(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (unsigned int v3 = result[1], v3 >= 0x28)
    && v3 <= 0x428
    && (unsigned int v4 = result[8], v4 <= 0x400)
    && ((unsigned int v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), v6))
  {
    int v9 = 0;
    *(_DWORD *)(a2 + 36) = 1024;
    uint64_t result = (_DWORD *)sub_1000019AC(result[3], result + 9, v4, (_OWORD *)(a2 + 40), (_DWORD *)(a2 + 36), *(unsigned int *)((char *)result + v5 + 36), &v9);
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v7 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      uint64_t v8 = (*(_DWORD *)(a2 + 36) + 3) & 0xFFFFFFFC;
      *(_DWORD *)(a2 + 4) = v8 + 44;
      *(_DWORD *)(a2 + v8 + 40) = v9;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v7 = NDR_record;
  }
  *(NDR_record_t *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_100006870(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 40273) >= 0xFFFFFFFB
    && (unsigned int v5 = (void (*)(void))*(&off_1000082C0 + 5 * (v4 - 40268) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100006904(int a1)
{
  int v2 = __error();
  int v3 = strerror(*v2);
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2080;
  BOOL v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error getting enable_netagent sysctl err(%d) %s", (uint8_t *)v4, 0x12u);
}

void sub_1000069A8(int *a1, int a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error setting enable_netagent sysctl to %d, err(%d)", (uint8_t *)v3, 0xEu);
}

void sub_100006A38()
{
  *(_WORD *)BOOL v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "NetEm simulation failure, fall back to packetfilter", v0, 2u);
}

void sub_100006A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006ABC()
{
  sub_100003C54();
  sub_100003C38((void *)&_mh_execute_header, &_os_log_default, v0, "link params cannot be set on %s", v1, v2, v3, v4, v5);
}

void sub_100006B2C()
{
  sub_100003C54();
  sub_100003C38((void *)&_mh_execute_header, &_os_log_default, v0, "%s: no device", v1, v2, v3, v4, v5);
}

void sub_100006B9C(uint64_t a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100003C54();
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ioctl set link params error %s on %s", v3, 0x16u);
}

void sub_100006C3C(float *a1, uint64_t a2, void *a3)
{
  sub_100003C60(a1, a3, *(void *)(a2 + 8), 4.8149e-34);
  sub_100003C6C((void *)&_mh_execute_header, &_os_log_default, v3, "%s not UP, skipped", v4);
}

void sub_100006C80(float *a1, uint64_t *a2, void *a3)
{
  sub_100003C60(a1, a3, *a2, 4.8149e-34);
  sub_100003C6C((void *)&_mh_execute_header, &_os_log_default, v3, "%s not in conditionable list, skip", v4);
}

void sub_100006CC4()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "getifaddrs %{errno}d", (uint8_t *)v1, 8u);
}

void sub_100006D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006D88(float *a1, uint64_t a2, void *a3)
{
  sub_100003C60(a1, a3, *(void *)(a2 + 8), 4.8149e-34);
  sub_100003C6C((void *)&_mh_execute_header, &_os_log_default, v3, "%s not up, skip", v4);
}

void sub_100006DCC(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ioctl (get link params)", buf, 2u);
}

void sub_100006E10()
{
  sub_100003C54();
  sub_100003C38((void *)&_mh_execute_header, &_os_log_default, v0, "bad bps %llu, min 1Kbps", v1, v2, v3, v4, v5);
}

void sub_100006E80()
{
  sub_100003C54();
  sub_100003C38((void *)&_mh_execute_header, &_os_log_default, v0, "SIOCGIFTYPE %s", v1, v2, v3, v4, v5);
}

void sub_100006EF0(const char **a1)
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t PFUserAddRule()
{
  return _PFUserAddRule();
}

uint64_t PFUserBeginRules()
{
  return _PFUserBeginRules();
}

uint64_t PFUserCommitRules()
{
  return _PFUserCommitRules();
}

uint64_t PFUserCopyRules_S()
{
  return _PFUserCopyRules_S();
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

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

int *__error(void)
{
  return ___error();
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

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

int close(int a1)
{
  return _close(a1);
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

mach_msg_return_t mach_msg_server(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server(a1, a2, a3, a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_destroy(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_destroy(task, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_move_member(ipc_space_t task, mach_port_name_t member, mach_port_name_t after)
{
  return _mach_port_move_member(task, member, after);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void mig_reply_setup(mach_msg_header_t *a1, mach_msg_header_t *a2)
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

uint64_t random(void)
{
  return _random();
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

void srandom(unsigned int a1)
{
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

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
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

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

void xpc_release(xpc_object_t object)
{
}