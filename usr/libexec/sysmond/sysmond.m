uint64_t start()
{
  _xpc_connection_s *mach_service;

  if (mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_10000CDB8))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000072EC();
    }
  }
  else
  {
    if (!mach_port_insert_right(mach_task_self_, dword_10000CDB8, dword_10000CDB8, 0x14u))
    {
      mach_service = xpc_connection_create_mach_service(SYSMON_XPC_SERVICE_NAME, 0, 1uLL);
      xpc_connection_set_event_handler(mach_service, &stru_1000083B8);
      xpc_connection_resume(mach_service);
      dispatch_main();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000072A4();
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_100003DDC(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    v3 = (void *)xpc_connection_copy_entitlement_value();
    if (v3 && (v4 = v3, xpc_release(v3), v4 == &_xpc_BOOL_true))
    {
      v5 = _NSConcreteStackBlock;
      *(void *)&long long v6 = 0x40000000;
      *((void *)&v6 + 1) = sub_100003F48;
      v7 = &unk_1000083D8;
      v8 = a2;
      xpc_connection_set_event_handler((xpc_connection_t)a2, &v5);
      xpc_connection_resume((xpc_connection_t)a2);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v5) = 67109378;
        HIDWORD(v5) = xpc_connection_get_pid((xpc_connection_t)a2);
        LOWORD(v6) = 2080;
        *(void *)((char *)&v6 + 2) = "com.apple.sysmond.client";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Client %d denied; missing \"%s\" entitlement.",
          (uint8_t *)&v5,
          0x12u);
      }
      xpc_connection_cancel((xpc_connection_t)a2);
    }
  }
}

void sub_100003F48(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v4 = sub_1000057DC(object);
    if (v4)
    {
      xpc_object_t v5 = sub_10000588C(v4);
      _os_object_release();
      xpc_dictionary_set_mach_send();
      if (v5)
      {
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v5);
        xpc_release(v5);
      }
    }
    else
    {
      xpc_dictionary_set_mach_send();
    }
  }
}

BOOL sub_100004028(uint64_t a1)
{
  *(_OWORD *)v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  *(_OWORD *)v13 = 0u;
  *(_OWORD *)value = 0u;
  *(_OWORD *)v11 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)xpc_object_t v5 = 0u;
  *(_OWORD *)long long v6 = 0u;
  int v2 = sub_100005768(a1);
  int v3 = proc_pidinfo(v2, 18, 0, v5, 192);
  if (v3 == 192)
  {
    if (HIDWORD(v5[1]) != v2) {
      sub_100007334();
    }
    sub_1000060E0(a1, 1, LODWORD(v5[0]));
    sub_1000060E0(a1, 2, HIDWORD(v5[0]));
    sub_1000060E0(a1, 3, LODWORD(v5[1]));
    sub_1000060E0(a1, 5, LODWORD(v6[0]));
    sub_1000060E0(a1, 6, HIDWORD(v6[0]));
    sub_1000060E0(a1, 7, LODWORD(v6[1]));
    sub_1000060E0(a1, 8, HIDWORD(v6[1]));
    sub_1000060E0(a1, 9, LODWORD(v7[0]));
    sub_1000060E0(a1, 10, HIDWORD(v7[0]));
    sub_1000060E0(a1, 11, LODWORD(v7[1]));
    sub_1000061F0(a1, 12, (char *)&v8);
    sub_1000061F0(a1, 13, (char *)v9);
    sub_1000060E0(a1, 14, LODWORD(value[0]));
    sub_1000060E0(a1, 15, HIDWORD(value[0]));
    sub_1000060E0(a1, 16, LODWORD(value[1]));
    sub_100006084(a1, 17, SHIDWORD(value[1]));
    sub_1000060E0(a1, 18, LODWORD(v11[0]));
    sub_100006084(a1, 19, SHIDWORD(v11[0]));
    sub_100006194(a1, 20, 1000000000 * v11[1] + 1000 * v12);
    sub_1000060E0(a1, 55, LODWORD(v6[0]));
    sub_100006028(a1, 56, (v5[0] & 0x800000) != 0);
    sub_1000060E0(a1, 69, v13[1]);
    sub_1000060E0(a1, 70, v14[0]);
    sub_1000060E0(a1, 71, 0);
  }
  return v3 == 192;
}

BOOL sub_10000427C(uint64_t a1)
{
  *(_OWORD *)v13 = 0u;
  *(_OWORD *)v14 = 0u;
  long long v11 = 0u;
  *(_OWORD *)value = 0u;
  *(_OWORD *)v9 = 0u;
  long long v10 = 0u;
  int v2 = sub_100005768(a1);
  int v3 = proc_pidinfo(v2, 4, 0, v9, 96);
  if (v3 == 96)
  {
    sub_1000060E0(a1, 21, v9[0]);
    sub_1000060E0(a1, 22, v9[1]);
    uint64_t v4 = sub_100004424(v10);
    sub_1000060E0(a1, 23, v4);
    uint64_t v5 = sub_100004424(*((unint64_t *)&v10 + 1));
    sub_1000060E0(a1, 24, v5);
    uint64_t v6 = sub_100004424(v11);
    sub_1000060E0(a1, 25, v6);
    uint64_t v7 = sub_100004424(*((unint64_t *)&v11 + 1));
    sub_1000060E0(a1, 26, v7);
    sub_100006084(a1, 27, SLODWORD(value[0]));
    sub_100006084(a1, 28, SHIDWORD(value[0]));
    sub_1000060E0(a1, 29, value[1] & ~(SLODWORD(value[1]) >> 31));
    sub_100006084(a1, 30, SHIDWORD(value[1]));
    sub_100006084(a1, 31, SLODWORD(v13[0]));
    sub_100006084(a1, 32, SHIDWORD(v13[0]));
    sub_100006084(a1, 33, SLODWORD(v13[1]));
    sub_100006084(a1, 34, SHIDWORD(v13[1]));
    sub_100006084(a1, 35, SLODWORD(v14[0]));
    sub_100006084(a1, 36, SHIDWORD(v14[0]));
    sub_100006084(a1, 37, SLODWORD(v14[1]));
    sub_100006084(a1, 38, SHIDWORD(v14[1]));
  }
  return v3 == 96;
}

unint64_t sub_100004424(unint64_t a1)
{
  if (qword_10000CDC0 != -1) {
    dispatch_once(&qword_10000CDC0, &stru_100008418);
  }
  return (unint64_t)(*(double *)&qword_10000CAF0 * (double)a1 / *(double *)&qword_10000CAF8);
}

BOOL sub_10000448C(uint64_t a1)
{
  uint64_t value = 0;
  uint64_t v6 = 0;
  int v2 = sub_100005768(a1);
  int v3 = proc_pidinfo(v2, 12, 0, &value, 16);
  if (v3 == 16)
  {
    sub_1000060E0(a1, 39, value);
    sub_1000060E0(a1, 40, HIDWORD(value));
    sub_1000060E0(a1, 41, v6);
    sub_1000060E0(a1, 42, HIDWORD(v6));
  }
  return v3 == 16;
}

BOOL sub_100004524(uint64_t a1)
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v15 = 0u;
  int v2 = sub_100005768(a1);
  int v3 = proc_pid_rusage(v2, 2, buffer);
  if (!v3)
  {
    sub_1000060E0(a1, 63, v19);
    unint64_t v4 = mach_absolute_time() - v19;
    uint64_t v5 = sub_100004424(v4);
    sub_1000060E0(a1, 61, v5);
    uint64_t v6 = sub_100004424(v15);
    sub_1000060E0(a1, 23, v6);
    uint64_t v7 = sub_100004424(*((unint64_t *)&v15 + 1));
    sub_1000060E0(a1, 24, v7);
    sub_1000060E0(a1, 47, v16);
    sub_1000060E0(a1, 46, *((uint64_t *)&v16 + 1));
    sub_1000060E0(a1, 29, v17);
    sub_1000060E0(a1, 65, *((uint64_t *)&v17 + 1));
    sub_1000060E0(a1, 22, v18);
    sub_1000060E0(a1, 66, *((uint64_t *)&v18 + 1));
    sub_100005770(a1);
    pm_sample_task_and_pid();
    pm_energy_impact();
    double v9 = v8;
    if (sub_100005768(a1))
    {
      double v10 = v9 * 1000000000.0;
      sub_1000060E0(a1, 60, (unint64_t)v10);
      unint64_t v11 = sub_100004424(v4);
      sub_10000613C(a1, 62, (double)(unint64_t)v10 * 100.0 / (double)v11);
    }
    else
    {
      sub_1000060E0(a1, 60, 0);
    }
    xpc_object_t v12 = xpc_uuid_create((const unsigned __int8 *)buffer);
    sub_100005FC4(a1, 64, (uint64_t)v12);
    xpc_release(v12);
    sub_1000060E0(a1, 72, v23);
    sub_1000060E0(a1, 73, *((uint64_t *)&v23 + 1));
  }
  return v3 == 0;
}

BOOL sub_1000047DC(uint64_t a1)
{
  uint64_t v7 = 0;
  *(_OWORD *)uint64_t value = 0u;
  long long v6 = 0u;
  int v2 = sub_100005768(a1);
  int v3 = proc_pidinfo(v2, 20, 1uLL, value, 40);
  if (v3 == 40) {
    sub_1000060E0(a1, 75, value[0]);
  }
  return v3 == 40;
}

void sub_10000484C(id a1)
{
  mach_timebase_info info = 0;
  if (mach_timebase_info(&info))
  {
    _os_assumes_log();
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    *(double *)&qword_10000CAF0 = (double)v1;
    *(double *)&qword_10000CAF8 = (double)v2;
  }
}

void *sub_1000048A0(void *a1, uint64_t a2)
{
  unint64_t v4 = (void *)sub_100005ABC();
  xpc_object_t v5 = xpc_retain(a1);
  v4[2] = v5;
  size_t v6 = sub_100005D6C(v5);
  v4[3] = v6;
  v4[4] = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
  v4[5] = a2;
  sub_1000060E0((uint64_t)v4, 1, a2);
  return v4;
}

xpc_object_t sub_100004918(uint64_t a1)
{
  xpc_object_t v2 = xpc_array_create(0, 0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 0x40000000;
  v24 = sub_100004B3C;
  v25 = &unk_100008520;
  uint64_t v26 = a1;
  xpc_object_t v27 = v2;
  unsigned int v3 = proc_listpids(1u, 0, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    unint64_t v4 = v3;
    xpc_object_t v5 = malloc_type_malloc(v3, 0xCC3D7942uLL);
    if (v5)
    {
      size_t v6 = v5;
      while (1)
      {
        unsigned int v7 = proc_listpids(1u, 0, v6, v4);
        if ((v7 & 0x80000000) != 0) {
          break;
        }
        unsigned int v8 = v7;
        if (v4 >= v7 + 4)
        {
          unint64_t v9 = v7 >> 2;
          double v10 = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
          unint64_t v11 = v10;
          if (v8 >= 4)
          {
            if (v9 <= 1) {
              uint64_t v12 = 1;
            }
            else {
              uint64_t v12 = v8 >> 2;
            }
            v13 = (int *)v6;
            v14 = v10;
            do
            {
              int v15 = *v13++;
              uint64_t v29 = 0;
              memset(buffer, 0, sizeof(buffer));
              int v16 = proc_pidinfo(v15, 20, 1uLL, buffer, 40);
              uint64_t v17 = *(void *)&buffer[0];
              if (v16 != 40) {
                uint64_t v17 = 1;
              }
              *v14++ = v17;
              --v12;
            }
            while (v12);
          }
          free(v6);
          qsort_b(v11, v8 >> 2, 8uLL, &stru_100008560);
          if (*v11 != 1) {
            sub_100007334();
          }
          v24((uint64_t)v23, 1);
          if (v8 >= 8)
          {
            uint64_t v18 = 2;
            if (v9 > 2) {
              uint64_t v18 = v8 >> 2;
            }
            uint64_t v19 = 8 * v18;
            uint64_t v20 = 1;
            uint64_t v21 = 8;
            do
            {
              if (v11[(unint64_t)v21 / 8] != v20)
              {
                ((void (*)(void *))v24)(v23);
                uint64_t v20 = v11[(unint64_t)v21 / 8];
              }
              v21 += 8;
            }
            while (v19 != v21);
          }
          size_t v6 = v11;
          break;
        }
        v4 += 64;
        size_t v6 = reallocf(v6, v4);
        if (!v6) {
          return v2;
        }
      }
      free(v6);
    }
  }
  return v2;
}

void sub_100004B3C(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = sub_1000048A0(*(void **)(a1 + 32), a2);
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  unint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  uint64_t v6[2] = sub_100004C28;
  v6[3] = &unk_100008500;
  v6[4] = &v7;
  v6[5] = v3;
  sub_100005CC4(v4, (uint64_t)v6);
  if (!*((unsigned char *)v8 + 24))
  {
    xpc_object_t v5 = sub_100005EEC((uint64_t)v3);
    xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v5);
    xpc_release(v5);
  }
  j___os_object_release();
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_100004C28(uint64_t result, int a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0;
  while (1)
  {
    if (dword_100008438[v4] == a2)
    {
      result = sub_100005F80(*(void *)(v3 + 40), a2);
      if ((result & 1) == 0)
      {
        result = (*(uint64_t (**)(void))&dword_100008438[v4 + 2])(*(void *)(v3 + 40));
        if ((result & 1) == 0) {
          break;
        }
      }
    }
    v4 += 4;
    if (v4 == 48) {
      return result;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = 1;
  return result;
}

BOOL sub_100004CB0(uint64_t a1)
{
  int v2 = coalition_info_resource_usage();
  if (!v2)
  {
    sub_1000060E0(a1, 2, 0);
    sub_1000060E0(a1, 3, 0);
    sub_1000060E0(a1, 4, 0);
    sub_1000060E0(a1, 5, 0);
    sub_1000060E0(a1, 6, 0);
    sub_1000060E0(a1, 7, 0);
    sub_1000060E0(a1, 8, 0);
    sub_1000060E0(a1, 9, 0);
    pm_energy_impact();
    if (*(void *)(a1 + 40) == 1) {
      double v3 = 0.0;
    }
    sub_10000613C(a1, 12, v3);
  }
  return v2 == 0;
}

uint64_t sub_100004E64(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 1)
  {
    sub_1000061F0(a1, 13, "com.apple.system");
    sub_1000061F0(a1, 14, "com.apple.system");
    return 1;
  }
  uint64_t result = xpc_coalition_copy_info();
  if (result)
  {
    double v3 = (void *)result;
    if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = (char *)xpc_dictionary_get_string(v3, XPC_COALITION_INFO_KEY_NAME);
      if (string) {
        sub_1000061F0(a1, 13, string);
      }
      xpc_object_t v5 = (char *)xpc_dictionary_get_string(v3, XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER);
      if (v5) {
        sub_1000061F0(a1, 14, v5);
      }
      xpc_release(v3);
      return 1;
    }
    return 0;
  }
  return result;
}

int sub_100004F40(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 > *(void *)a3;
  }
}

BOOL sub_100004F58(uint64_t a1)
{
  kern_return_t v3;
  _OWORD v5[2];
  uint64_t value[3];
  mach_msg_type_number_t task_info_outCnt;

  *(_OWORD *)uint64_t value = 0u;
  memset(v5, 0, sizeof(v5));
  task_name_t v2 = sub_100005770(a1);
  task_info_outCnt = 12;
  double v3 = task_info(v2, 0x15u, (task_info_t)v5, &task_info_outCnt);
  if (!v3)
  {
    sub_1000060E0(a1, 48, value[0]);
    sub_1000060E0(a1, 49, value[1]);
  }
  return v3 == 0;
}

uint64_t sub_100004FD8(uint64_t a1)
{
  if (sub_100005768(a1))
  {
    ipc_space_inspect_t v2 = sub_100005770(a1);
    memset(&basic_info, 0, sizeof(basic_info));
    if (!mach_port_space_basic_info(v2, &basic_info)) {
      sub_1000060E0(a1, 50, basic_info.iisb_table_inuse);
    }
  }
  return 1;
}

BOOL sub_100005038(uint64_t a1)
{
  kern_return_t v3;
  int64_t value;
  BOOLean_t get_default;
  mach_msg_type_number_t policy_infoCnt;

  uint64_t value = 0;
  task_policy_get_t v2 = sub_100005770(a1);
  get_default = 0;
  policy_infoCnt = 2;
  double v3 = task_policy_get(v2, 8u, (task_policy_t)&value, &policy_infoCnt, &get_default);
  if (!v3)
  {
    sub_100006084(a1, 57, (int)value);
    sub_100006084(a1, 58, SHIDWORD(value));
  }
  return v3 == 0;
}

BOOL sub_1000050B4(uint64_t a1)
{
  kern_return_t v3;
  _OWORD v5[3];
  uint64_t v6[2];
  long long v7;
  long long v8;
  uint64_t value[2];
  uint64_t v10[2];
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  int v26;
  mach_msg_type_number_t task_info_outCnt;

  uint64_t v26 = 0;
  v24 = 0u;
  v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v20 = 0u;
  uint64_t v21 = 0u;
  uint64_t v18 = 0u;
  uint64_t v19 = 0u;
  int v16 = 0u;
  uint64_t v17 = 0u;
  v14 = 0u;
  int v15 = 0u;
  uint64_t v12 = 0u;
  v13 = 0u;
  *(_OWORD *)char v10 = 0u;
  unint64_t v11 = 0u;
  unsigned int v8 = 0u;
  *(_OWORD *)uint64_t value = 0u;
  *(_OWORD *)size_t v6 = 0u;
  uint64_t v7 = 0u;
  memset(v5, 0, sizeof(v5));
  task_name_t v2 = sub_100005770(a1);
  task_info_outCnt = 93;
  double v3 = task_info(v2, 0x17u, (task_info_t)v5, &task_info_outCnt);
  if (!v3)
  {
    sub_1000060E0(a1, 59, value[1]);
    sub_1000060E0(a1, 67, v10[1] + v6[0] - value[0]);
    sub_1000060E0(a1, 68, v6[1]);
    sub_1000060E0(a1, 74, v10[1]);
  }
  return v3 == 0;
}

uint64_t sub_100005198(uint64_t a1)
{
  *(void *)int v15 = 0x3100000001;
  int v16 = sub_100005768(a1);
  if (sub_100005768(a1))
  {
    if (qword_10000CDC8 != -1) {
      dispatch_once(&qword_10000CDC8, &stru_1000085A0);
    }
    size_t v14 = dword_10000CDD0;
    task_name_t v2 = (char *)malloc_type_malloc(dword_10000CDD0, 0xB3228DD5uLL);
    if (sysctl(v15, 3u, v2, &v14, 0, 0)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = v14 >= 4;
    }
    if (!v3)
    {
      free(v2);
      return 0;
    }
    unint64_t v6 = *(unsigned int *)v2;
    xpc_object_t v7 = xpc_array_create(0, 0);
    size_t v8 = v14 - 4;
    if (v14 != 4)
    {
      int v9 = 0;
      unint64_t v10 = 0;
      unint64_t v11 = v2 + 4;
      do
      {
        int v12 = v9;
        int v9 = *v11;
        if (*v11) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13 && memchr(v11, 0, v8))
        {
          if (v10)
          {
            if (v10 <= v6) {
              xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, v11);
            }
          }
          else
          {
            sub_1000061F0(a1, 43, v11);
          }
          ++v10;
          int v9 = *v11;
        }
        ++v11;
        --v8;
      }
      while (v8);
    }
    sub_100005FC4(a1, 44, (uint64_t)v7);
    xpc_release(v7);
    free(v2);
  }
  else
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, "kernel_task");
    sub_100005FC4(a1, 44, (uint64_t)v5);
    xpc_release(v5);
  }
  return 1;
}

void sub_10000539C(id a1)
{
  size_t v1 = 4;
  if (sysctlbyname("kern.argmax", &dword_10000CDD0, &v1, 0, 0)) {
    dword_10000CDD0 = 0x40000;
  }
}

xpc_object_t sub_1000053F0(uint64_t a1)
{
  xpc_object_t v2 = xpc_array_create(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000;
  size_t v14 = sub_100005568;
  int v15 = &unk_100008AA8;
  uint64_t v16 = a1;
  xpc_object_t v17 = v2;
  unsigned int v3 = proc_listpids(1u, 0, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    unint64_t v4 = v3;
    xpc_object_t v5 = (char *)malloc_type_malloc(v3, 0xE4979E02uLL);
    if (v5)
    {
      unint64_t v6 = v5;
      while (1)
      {
        unsigned int v7 = proc_listpids(1u, 0, v6, v4);
        unsigned int v8 = v7;
        if ((v7 & 0x80000000) != 0)
        {
LABEL_7:
          qsort_b(v6, (unint64_t)(int)v8 >> 2, 4uLL, &stru_100008AE8);
          goto LABEL_11;
        }
        if (v4 >= v7 + 4) {
          break;
        }
        v4 += 64;
        unint64_t v6 = (char *)reallocf(v6, v4);
        if (!v6) {
          goto LABEL_7;
        }
      }
      size_t v9 = v7 >> 2;
      qsort_b(v6, v9, 4uLL, &stru_100008AE8);
      if (v8 >= 4)
      {
        uint64_t v10 = 0;
        uint64_t v11 = 4 * v9;
        do
        {
          v14((uint64_t)v13, *(_DWORD *)&v6[v10]);
          v10 += 4;
        }
        while (v11 != v10);
      }
LABEL_11:
      free(v6);
    }
  }
  return v2;
}

void sub_100005568(uint64_t a1, int a2)
{
  uint64_t v3 = sub_1000056EC(*(void **)(a1 + 32), a2);
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  unint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  uint64_t v6[2] = sub_100005654;
  v6[3] = &unk_100008A88;
  v6[4] = &v7;
  v6[5] = v3;
  sub_100005CC4(v4, (uint64_t)v6);
  if (!*((unsigned char *)v8 + 24))
  {
    xpc_object_t v5 = sub_100005EEC(v3);
    xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v5);
    xpc_release(v5);
  }
  j___os_object_release();
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_100005654(uint64_t result, int a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0;
  while (1)
  {
    if (dword_1000085C0[v4] == a2)
    {
      uint64_t result = sub_100005F80(*(void *)(v3 + 40), a2);
      if ((result & 1) == 0)
      {
        uint64_t result = (*(uint64_t (**)(void))&dword_1000085C0[v4 + 2])(*(void *)(v3 + 40));
        if ((result & 1) == 0) {
          break;
        }
      }
    }
    v4 += 4;
    if (v4 == 304) {
      return result;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = 1;
  return result;
}

int sub_1000056DC(id a1, const void *a2, const void *a3)
{
  return *(_DWORD *)a2 - *(_DWORD *)a3;
}

uint64_t sub_1000056EC(void *a1, int a2)
{
  uint64_t v4 = sub_100005A54();
  xpc_object_t v5 = xpc_retain(a1);
  *(void *)(v4 + 16) = v5;
  size_t v6 = sub_100005D6C(v5);
  *(void *)(v4 + 24) = v6;
  *(void *)(v4 + 32) = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
  *(_DWORD *)(v4 + 40) = a2;
  *(_DWORD *)(v4 + 44) = 0;
  sub_1000060E0(v4, 4, a2);
  return v4;
}

uint64_t sub_100005768(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_100005770(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 44);
  if (!result)
  {
    mach_port_name_t tn = 0;
    if (*(_DWORD *)(a1 + 40))
    {
      if (task_read_for_pid()) {
        return *(unsigned int *)(a1 + 44);
      }
    }
    else if (task_name_for_pid(mach_task_self_, 0, &tn))
    {
      return *(unsigned int *)(a1 + 44);
    }
    uint64_t result = tn;
    *(_DWORD *)(a1 + 44) = tn;
  }
  return result;
}

uint64_t sub_1000057DC(void *a1)
{
  uint64_t v2 = sub_100005AF0();
  *(void *)(v2 + 16) = xpc_dictionary_get_uint64(a1, SYSMON_XPC_KEY_TYPE);
  xpc_object_t value = xpc_dictionary_get_value(a1, SYSMON_XPC_KEY_ATTRIBUTES);
  *(void *)(v2 + 24) = value;
  if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_data)
  {
    xpc_retain(*(xpc_object_t *)(v2 + 24));
    *(void *)(v2 + 32) = xpc_dictionary_get_uint64(a1, SYSMON_XPC_KEY_FLAGS);
  }
  else
  {
    _os_assumes_log();
    *(void *)(v2 + 24) = 0;
    j___os_object_release();
    return 0;
  }
  return v2;
}

xpc_object_t sub_10000588C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  size_t v1 = *(void **)(a1 + 24);
  size_t length = xpc_data_get_length(v1);
  uint64_t v4 = malloc_type_malloc(length, 0x1CE7A272uLL);
  if (xpc_data_get_bytes(v1, v4, 0, length) != length) {
    _os_assumes_log();
  }
  if (v2 == 3)
  {
    size_t v6 = v4 + 1;
    char v7 = v4[1];
    if ((v7 & 4) != 0) {
      *v4 |= 0x22u;
    }
    if ((v7 & 8) != 0)
    {
      *v4 |= 2u;
      goto LABEL_13;
    }
  }
  else if (v2 == 1)
  {
    char v5 = v4[6];
    if ((v5 & 8) != 0)
    {
      *v4 |= 0x10u;
      v4[2] |= 0x80u;
      v4[3] |= 1u;
    }
    if ((v5 & 0x10) != 0)
    {
      *v4 |= 0x10u;
      size_t v6 = v4 + 7;
      char v7 = v4[7];
LABEL_13:
      *size_t v6 = v7 | 0x10;
    }
  }
  xpc_object_t v8 = xpc_data_create(v4, length);
  free(v4);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_HEADER, v8);
  switch(v2)
  {
    case 3:
      xpc_object_t v10 = sub_100004918((uint64_t)v8);
      break;
    case 2:
      xpc_object_t v10 = sub_10000624C(v8);
      break;
    case 1:
      xpc_object_t v10 = sub_1000053F0((uint64_t)v8);
      break;
    default:
      goto LABEL_22;
  }
  uint64_t v11 = v10;
  if (v10)
  {
    xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_TABLE, v10);
    xpc_release(v11);
  }
LABEL_22:
  xpc_object_t v12 = xpc_date_create_from_current();
  xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_TIMESTAMP, v12);
  xpc_release(v12);
  xpc_release(v8);
  return v9;
}

uint64_t sub_100005A54()
{
  uint64_t v0 = objc_opt_class();

  return __os_object_alloc(v0, 48);
}

uint64_t sub_100005A88()
{
  uint64_t v0 = objc_opt_class();

  return __os_object_alloc(v0, 48);
}

uint64_t sub_100005ABC()
{
  uint64_t v0 = objc_opt_class();

  return __os_object_alloc(v0, 48);
}

uint64_t sub_100005AF0()
{
  uint64_t v0 = objc_opt_class();

  return __os_object_alloc(v0, 40);
}

size_t sub_100005CC4(void *a1, uint64_t a2)
{
  bytes_ptr = xpc_data_get_bytes_ptr(a1);
  size_t result = xpc_data_get_length(a1);
  if (result)
  {
    size_t v6 = result;
    for (uint64_t i = 0; i != v6; ++i)
    {
      unsigned int v8 = bytes_ptr[i];
      if (bytes_ptr[i])
      {
        do
        {
          unsigned int v9 = __clz(__rbit32(v8));
          v8 &= ~(1 << v9);
          size_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, (8 * i) | v9);
        }
        while ((_BYTE)v8);
      }
    }
  }
  return result;
}

uint64_t sub_100005D6C(void *a1)
{
  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  for (uint64_t i = 0; length; --length)
  {
    unsigned int v5 = *bytes_ptr++;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
    v6.i16[0] = vaddlv_u8(v6);
    i += v6.u32[0];
  }
  return i;
}

uint64_t sub_100005DC8(void *a1, int a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = -1;
  v10[3] = -1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_100005E90;
  v4[3] = &unk_100008B10;
  int v5 = a2;
  v4[4] = v10;
  v4[5] = &v6;
  sub_100005CC4(a1, (uint64_t)v4);
  uint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t sub_100005E90(uint64_t result, int a2)
{
  ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  if (*(_DWORD *)(result + 48) == a2)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
    if (*(void *)(v2 + 24) != -1) {
      sub_100007334();
    }
    *(void *)(v2 + 24) = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

xpc_object_t sub_100005EEC(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    for (size_t i = 0; i < v2; ++i)
    {
      if (!*(void *)(*(void *)(a1 + 32) + 8 * i))
      {
        xpc_object_t v4 = xpc_null_create();
        size_t v2 = *(void *)(a1 + 24);
        *(void *)(*(void *)(a1 + 32) + 8 * i) = v4;
      }
    }
  }
  xpc_object_t v5 = xpc_array_create(*(xpc_object_t **)(a1 + 32), v2);
  if (*(void *)(a1 + 24))
  {
    unint64_t v6 = 0;
    do
    {
      xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 8 * v6));
      unint64_t v7 = *(void *)(a1 + 24);
      *(void *)(*(void *)(a1 + 32) + 8 * v6++) = 0;
    }
    while (v6 < v7);
  }
  return v5;
}

BOOL sub_100005F80(uint64_t a1, int a2)
{
  uint64_t v3 = sub_100005DC8(*(void **)(a1 + 16), a2);
  return (v3 & 0x8000000000000000) == 0 && *(void *)(*(void *)(a1 + 32) + 8 * v3) != 0;
}

uint64_t sub_100005FC4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = sub_100005DC8(*(void **)(a1 + 16), a2);
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(void *)(v6 + 8 * result))
    {
      *(void *)(v6 + 8 * result) = a3;
      unint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8 * result);
      return (uint64_t)xpc_retain(v7);
    }
  }
  return result;
}

void sub_100006028(uint64_t a1, int a2, BOOL value)
{
  xpc_object_t v5 = xpc_BOOL_create(value);
  sub_100005FC4(a1, a2, (uint64_t)v5);

  xpc_release(v5);
}

void sub_100006084(uint64_t a1, int a2, int64_t value)
{
  xpc_object_t v5 = xpc_int64_create(value);
  sub_100005FC4(a1, a2, (uint64_t)v5);

  xpc_release(v5);
}

void sub_1000060E0(uint64_t a1, int a2, uint64_t value)
{
  xpc_object_t v5 = xpc_uint64_create(value);
  sub_100005FC4(a1, a2, (uint64_t)v5);

  xpc_release(v5);
}

void sub_10000613C(uint64_t a1, int a2, double a3)
{
  xpc_object_t v5 = xpc_double_create(a3);
  sub_100005FC4(a1, a2, (uint64_t)v5);

  xpc_release(v5);
}

void sub_100006194(uint64_t a1, int a2, int64_t interval)
{
  xpc_object_t v5 = xpc_date_create(interval);
  sub_100005FC4(a1, a2, (uint64_t)v5);

  xpc_release(v5);
}

void sub_1000061F0(uint64_t a1, int a2, char *string)
{
  xpc_object_t v5 = xpc_string_create(string);
  sub_100005FC4(a1, a2, (uint64_t)v5);

  xpc_release(v5);
}

xpc_object_t sub_10000624C(void *a1)
{
  xpc_object_t v2 = xpc_array_create(0, 0);
  uint64_t v3 = sub_10000631C(a1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  uint64_t v6[2] = sub_10000637C;
  v6[3] = &unk_100008D70;
  v6[4] = v3;
  sub_100005CC4(a1, (uint64_t)v6);
  xpc_object_t v4 = sub_100005EEC(v3);
  xpc_array_set_value(v2, 0xFFFFFFFFFFFFFFFFLL, v4);
  xpc_release(v4);
  j___os_object_release();
  return v2;
}

uint64_t sub_10000631C(void *a1)
{
  uint64_t v2 = sub_100005A88();
  xpc_object_t v3 = xpc_retain(a1);
  *(void *)(v2 + 16) = v3;
  size_t v4 = sub_100005D6C(v3);
  *(void *)(v2 + 24) = v4;
  *(void *)(v2 + 32) = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
  *(_DWORD *)(v2 + 40) = 0;
  return v2;
}

uint64_t sub_10000637C(uint64_t result, int a2)
{
  uint64_t v3 = result;
  for (uint64_t i = 0; i != 144; i += 4)
  {
    if (dword_100008B30[i] == a2)
    {
      uint64_t result = sub_100005F80(*(void *)(v3 + 32), a2);
      if ((result & 1) == 0) {
        uint64_t result = (*(uint64_t (**)(void))&dword_100008B30[i + 2])(*(void *)(v3 + 32));
      }
    }
  }
  return result;
}

uint64_t sub_1000063EC(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 40);
  if (!result)
  {
    uint64_t result = mach_host_self();
    *(_DWORD *)(a1 + 40) = result;
  }
  return result;
}

BOOL sub_10000641C(uint64_t a1)
{
  kern_return_t v3;
  uint64_t v4;
  uint64_t value[2];
  uint64_t v7[2];
  uint64_t v8[2];
  uint64_t v9[2];
  uint64_t v10[2];
  uint64_t v11[2];
  uint64_t v12[2];
  uint64_t v13[2];
  uint64_t v14[2];
  uint64_t v15;
  mach_msg_type_number_t host_info64_outCnt;

  int v15 = 0;
  *(_OWORD *)BOOL v13 = 0u;
  *(_OWORD *)size_t v14 = 0u;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)xpc_object_t v12 = 0u;
  *(_OWORD *)uint64_t v9 = 0u;
  *(_OWORD *)xpc_object_t v10 = 0u;
  *(_OWORD *)unint64_t v7 = 0u;
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)xpc_object_t value = 0u;
  host_t v2 = sub_1000063EC(a1);
  host_info64_outCnt = 38;
  uint64_t v3 = host_statistics64(v2, 4, (host_info64_t)value, &host_info64_outCnt);
  if (!v3)
  {
    sub_1000060E0(a1, 1, (LODWORD(value[0]) - HIDWORD(v11[1])));
    sub_1000060E0(a1, 2, HIDWORD(value[0]));
    sub_1000060E0(a1, 3, LODWORD(value[1]));
    sub_1000060E0(a1, 4, HIDWORD(value[1]));
    sub_1000060E0(a1, 5, v7[0]);
    sub_1000060E0(a1, 6, v7[1]);
    sub_1000060E0(a1, 7, v8[0]);
    sub_1000060E0(a1, 8, v8[1]);
    sub_1000060E0(a1, 9, v9[0]);
    sub_1000060E0(a1, 10, v9[1]);
    sub_1000060E0(a1, 11, v10[0]);
    sub_1000060E0(a1, 12, v10[1]);
    sub_1000060E0(a1, 13, v11[0]);
    sub_1000060E0(a1, 14, LODWORD(v11[1]));
    sub_1000060E0(a1, 15, HIDWORD(v11[1]));
    sub_1000060E0(a1, 16, v12[0]);
    sub_1000060E0(a1, 17, v12[1]);
    sub_1000060E0(a1, 18, v13[0]);
    sub_1000060E0(a1, 19, v13[1]);
    sub_1000060E0(a1, 20, LODWORD(v14[0]));
    sub_1000060E0(a1, 21, HIDWORD(v14[0]));
    sub_1000060E0(a1, 33, LODWORD(v14[1]));
    sub_1000060E0(a1, 34, HIDWORD(v14[1]));
    sub_1000060E0(a1, 35, v15);
    if (qword_10000CDE0 != -1) {
      dispatch_once(&qword_10000CDE0, &stru_100008DB0);
    }
    size_t v4 = qword_10000CDD8;
    sub_1000060E0(a1, 36, qword_10000CDD8);
    sub_1000060E0(a1, 37, v15 + v4);
    sub_1000060E0(a1, 38, v4 - (LODWORD(value[0]) - HIDWORD(v11[1])));
  }
  return v3 == 0;
}

uint64_t sub_10000668C(uint64_t a1)
{
  processor_set_name_array_t processor_sets = 0;
  mach_msg_type_number_t processor_setsCnt = 0;
  host_priv_t v2 = sub_1000063EC(a1);
  if (host_processor_sets(v2, &processor_sets, &processor_setsCnt))
  {
LABEL_13:
    _os_assumes_log();
    return 0;
  }
  if (processor_setsCnt)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    while (1)
    {
      *(void *)info_out = 0;
      uint64_t v9 = 0;
      mach_msg_type_number_t info_outCnt = 4;
      if (processor_set_statistics(processor_sets[v3], 4, info_out, &info_outCnt)) {
        goto LABEL_13;
      }
      uint64_t v5 = info_out[1];
      if (mach_port_deallocate(mach_task_self_, processor_sets[v3])) {
        _os_assumes_log();
      }
      v4 += v5;
      if (++v3 >= (unint64_t)processor_setsCnt) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v4 = 0;
LABEL_10:
  sub_1000060E0(a1, 24, v4);
  if (mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)processor_sets, 4 * processor_setsCnt)) {
    _os_assumes_log();
  }
  return 1;
}

void sub_1000067A8(id a1)
{
  size_t v1 = 8;
  sysctlbyname("hw.memsize", &qword_10000CDD8, &v1, 0, 0);
  qword_10000CDD8 /= vm_kernel_page_size;
}

void sub_100006810(int a1, void *a2)
{
}

uint64_t sub_100006818(void *context)
{
  if (qword_10000CDF0 != -1) {
    dispatch_once(&qword_10000CDF0, &stru_100008E18);
  }
  dispatch_sync_f((dispatch_queue_t)qword_10000CDF8, context, (dispatch_function_t)sub_1000068EC);
  return 1;
}

void sub_100006884(id a1)
{
  qword_10000CDF8 = (uint64_t)dispatch_queue_create("process_get_libtop_memory mutex", 0);
  *(_OWORD *)&v1.version = xmmword_100008DD0;
  *(_OWORD *)&v1.release = *(_OWORD *)&off_100008DE0;
  v1.equal = 0;
  qword_10000CDE8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &v1);
}

void sub_1000068EC(uint64_t a1)
{
  uint64_t v1 = a1;
  int v2 = sub_100005768(a1);
  vm_map_read_t v3 = sub_100005770(v1);
  uint64_t v4 = (char *)malloc_type_calloc(1uLL, 0x4C0uLL, 0x10300403E5244D6uLL);
  *((_DWORD *)v4 + 1) = v2;
  uint64_t v5 = (int *)(v4 + 936);
  *((_DWORD *)v4 + 234) = 0;
  uint64_t v6 = qword_10000CE30;
  if (!qword_10000CE30)
  {
    qword_10000CE30 = 12;
    if (sysctlnametomib("sysctl.proc_cputype", dword_10000CE00, (size_t *)&qword_10000CE30))
    {
      qword_10000CE30 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = qword_10000CE30;
    if (!qword_10000CE30) {
      goto LABEL_3;
    }
  }
  dword_10000CE00[v6] = v2;
  v41[0] = 4;
  if (!sysctl(dword_10000CE00, v6 + 1, v5, v41, 0, 0))
  {
LABEL_3:
    vm_size_t v7 = vm_kernel_page_size;
    mach_vm_size_t size = 0;
    address[0] = 0;
    *((_DWORD *)v4 + 302) = 0;
    *(void *)mach_timebase_info info = 0;
    uint64_t v47 = 0;
    int v48 = 0;
    mach_msg_type_number_t infoCnt = 5;
    mach_port_t object_name = 0;
    if (mach_vm_region(v3, address, &size, 12, info, &infoCnt, &object_name))
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v35 = 0;
      int v10 = 0;
      uint64_t v38 = 0;
LABEL_5:
      uint64_t v11 = v35 + v8;
      *((void *)v4 + 4) = v35 + v8;
      *((void *)v4 + 5) = v9;
      *((void *)v4 + 6) = v37;
      *((void *)v4 + 7) = v38;
      *((void *)v4 + 8) = v36;
      *((_DWORD *)v4 + 18) = v10;
      *((_DWORD *)v4 + 19) = 0;
LABEL_6:
      sub_1000060E0(v1, 53, v11);
      sub_1000060E0(v1, 54, *((void *)v4 + 6));
      goto LABEL_9;
    }
    int v10 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    uint64_t v32 = v1;
    vm_size_t v34 = v7;
    while (1)
    {
      int v12 = *v5;
      if (*v5 <= 16777222)
      {
        if (v12 == 7) {
          goto LABEL_21;
        }
        if (v12 != 12)
        {
          if (v12 != 18) {
            goto LABEL_71;
          }
LABEL_21:
          uint64_t v13 = 0x20000000;
          mach_vm_address_t v14 = 2415919104;
          goto LABEL_28;
        }
        uint64_t v13 = 0x40000000;
        mach_vm_address_t v14 = 0x40000000;
      }
      else if (v12 > 16777233)
      {
        if (v12 == 16777234)
        {
          mach_vm_address_t v14 = 0x7FFF60000000;
          uint64_t v13 = 2684354560;
        }
        else
        {
          if (v12 != 33554444) {
LABEL_71:
          }
            sub_100007350(v12);
          uint64_t v13 = 2281701376;
          mach_vm_address_t v14 = 436207616;
        }
      }
      else if (v12 == 16777223)
      {
        mach_vm_address_t v14 = 0x7FF800000000;
        uint64_t v13 = 0x7FE000000;
      }
      else
      {
        if (v12 != 16777228) {
          goto LABEL_71;
        }
        uint64_t v13 = 0x180000000;
        mach_vm_address_t v14 = 0x180000000;
      }
LABEL_28:
      mach_vm_address_t v15 = v14 + v13;
      int v16 = v48;
      if (v14 <= address[0] && v15 > address[0])
      {
        v38 += v7 * v47;
        if (!*((_DWORD *)v4 + 302) && v48 == 3)
        {
          int v43 = 0;
          *(_OWORD *)v41 = 0u;
          long long v42 = 0u;
          mach_vm_address_t v40 = address[0];
          mach_vm_size_t v39 = size;
          mach_msg_type_number_t infoCnt = 9;
          if (mach_vm_region(v3, &v40, &v39, 10, (vm_region_info_t)v41, &infoCnt, &object_name)) {
            goto LABEL_5;
          }
          if (v42) {
            *((_DWORD *)v4 + 302) = 1;
          }
          int v16 = v48;
        }
        if (v16 != 2) {
          goto LABEL_48;
        }
        ++v10;
LABEL_47:
        v8 += (HIDWORD(v47) + (unint64_t)v47) * v7;
        v9 += size;
        goto LABEL_48;
      }
      ++v10;
      int v18 = info[1];
      if (v48 == 1 && info[1] == 1) {
        goto LABEL_47;
      }
      switch((char)v48)
      {
        case 1:
        case 4:
          int v19 = *((_DWORD *)v4 + 1);
          if (v19)
          {
            unint64_t v20 = info[0];
            int v31 = HIDWORD(v47);
            mach_vm_size_t v33 = size;
            Value = CFDictionaryGetValue((CFDictionaryRef)qword_10000CDE8, (const void *)info[0]);
            if (Value)
            {
              long long v22 = Value;
              if (*(_DWORD *)Value == v19)
              {
                uint64_t v1 = v32;
                Value[1] += v33;
                unsigned int v23 = *((_DWORD *)Value + 7) + 1;
                *((_DWORD *)Value + 7) = v23;
                uint64_t v5 = (int *)(v4 + 936);
LABEL_57:
                if (v23 >= 2)
                {
                  int v26 = v22[8];
                  if (v26 != 3) {
                    v22[4] = v26;
                  }
                  v35 -= *((void *)v22 + 5);
                  v9 -= *((void *)v22 + 6);
                  v37 -= *((void *)v22 + 7);
                }
                v22[8] = 3;
                *((void *)v22 + 6) = 0;
                *((void *)v22 + 7) = 0;
                *((void *)v22 + 5) = 0;
                int v27 = v22[4];
                if (v27 != 6)
                {
                  if (v27 == 4 && v22[6] == v23)
                  {
                    v22[8] = 4;
                    v22[4] = 6;
                    vm_size_t v28 = v34 * v22[5];
                    v35 += v28;
                    uint64_t v29 = *((void *)v22 + 1);
                    *((void *)v22 + 5) = v28;
                    *((void *)v22 + 6) = v29;
                    v9 += v29;
                  }
                  else
                  {
                    vm_size_t v30 = v34 * v22[5];
                    *((void *)v22 + 7) = v30;
                    v37 += v30;
                  }
                }
                if (v48 != 1)
                {
                  vm_size_t v7 = v34;
                  break;
                }
                vm_size_t v7 = v34;
                mach_vm_size_t v24 = v34 * v47;
                v8 += v24;
                goto LABEL_68;
              }
              *(_DWORD *)Value = v19;
              Value[1] += v33;
              unsigned int v23 = 1;
              *((_DWORD *)Value + 7) = 1;
            }
            else
            {
              v25 = malloc_type_malloc(0x40uLL, 0x1000040EA6C7F01uLL);
              if (!v25)
              {
                uint64_t v11 = *((void *)v4 + 4);
                uint64_t v1 = v32;
                goto LABEL_6;
              }
              long long v22 = v25;
              _DWORD *v25 = v19;
              v25[1] = v20;
              *((void *)v25 + 1) = v33;
              v25[4] = v16;
              v25[5] = v31;
              v25[6] = v18;
              v25[7] = 1;
              CFDictionarySetValue((CFMutableDictionaryRef)qword_10000CDE8, (const void *)v20, v25);
              unsigned int v23 = v22[7];
            }
            uint64_t v1 = v32;
            v22[8] = 3;
            *((void *)v22 + 6) = 0;
            *((void *)v22 + 7) = 0;
            *((void *)v22 + 5) = 0;
            uint64_t v5 = (int *)(v4 + 936);
            goto LABEL_57;
          }
          uint64_t v5 = (int *)(v4 + 936);
          if (v48 == 1)
          {
            v8 += v7 * v47;
            mach_vm_size_t v24 = size;
LABEL_68:
            v9 += v24;
            break;
          }
          break;
        case 2:
        case 8:
          goto LABEL_47;
        case 3:
          v36 += size;
          break;
        default:
          sub_100007384();
      }
LABEL_48:
      address[0] += size;
      *(void *)mach_timebase_info info = 0;
      uint64_t v47 = 0;
      int v48 = 0;
      mach_msg_type_number_t infoCnt = 5;
      mach_port_t object_name = 0;
      if (mach_vm_region(v3, address, &size, 12, info, &infoCnt, &object_name)) {
        goto LABEL_5;
      }
    }
  }
LABEL_9:
  free(v4);
}

uint64_t sub_100006EFC(uint64_t a1)
{
  size_t size = 0;
  if (sysctl(dword_10000CDA0, 6u, 0, &size, 0, 0) < 0) {
    return 0;
  }
  int v2 = (unsigned __int16 *)malloc_type_malloc(size, 0x15BA3060uLL);
  if (!v2) {
    sub_100007334();
  }
  vm_map_read_t v3 = v2;
  if (sysctl(dword_10000CDA0, 6u, v2, &size, 0, 0) < 0)
  {
    free(v3);
    return 0;
  }
  if (v3 >= (unsigned __int16 *)((char *)v3 + size))
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = v3;
    do
    {
      if (*((unsigned char *)v8 + 3) == 18)
      {
        v6 += *((void *)v8 + 9);
        v4 += *((void *)v8 + 7);
        v5 += *((void *)v8 + 13);
        v7 += *((void *)v8 + 12);
      }
      uint64_t v8 = (unsigned __int16 *)((char *)v8 + *v8);
    }
    while (v8 < (unsigned __int16 *)((char *)v3 + size));
  }
  free(v3);
  sub_1000060E0(a1, 29, v4);
  sub_1000060E0(a1, 31, v6);
  sub_1000060E0(a1, 30, v7);
  sub_1000060E0(a1, 32, v5);
  return 1;
}

BOOL sub_100007068(uint64_t a1)
{
  kern_return_t MatchingServices;
  io_object_t v4;
  io_registry_entry_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDictionaryRef Value;
  CFDictionaryRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  uint64_t v17;
  uint64_t valuePtr;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;

  existing = 0;
  valuePtr = 0;
  properties = 0;
  CFDictionaryRef v2 = IOServiceMatching("IOBlockStorageDriver");
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing);
  if (MatchingServices)
  {
    _os_assumes_log();
  }
  else
  {
    xpc_object_t v17 = a1;
    uint64_t v4 = IOIteratorNext(existing);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      do
      {
        valuePtr = 0;
        properties = 0;
        if (IORegistryEntryCreateCFProperties(v5, &properties, kCFAllocatorDefault, 0))
        {
          _os_assumes_log();
        }
        else if (properties)
        {
          Value = (const __CFDictionary *)CFDictionaryGetValue(properties, @"Statistics");
          if (Value)
          {
            uint64_t v11 = Value;
            int v12 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Operations (Read)");
            if (v12)
            {
              CFNumberGetValue(v12, kCFNumberSInt64Type, &valuePtr);
              v9 += valuePtr;
            }
            uint64_t v13 = (const __CFNumber *)CFDictionaryGetValue(v11, @"Bytes (Read)");
            if (v13)
            {
              CFNumberGetValue(v13, kCFNumberSInt64Type, &valuePtr);
              v7 += valuePtr;
            }
            mach_vm_address_t v14 = (const __CFNumber *)CFDictionaryGetValue(v11, @"Operations (Write)");
            if (v14)
            {
              CFNumberGetValue(v14, kCFNumberSInt64Type, &valuePtr);
              v8 += valuePtr;
            }
            mach_vm_address_t v15 = (const __CFNumber *)CFDictionaryGetValue(v11, @"Bytes (Write)");
            if (v15)
            {
              CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
              v6 += valuePtr;
            }
          }
          CFRelease(properties);
        }
        IOObjectRelease(v5);
        uint64_t v5 = IOIteratorNext(existing);
      }
      while (v5);
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v6 = 0;
    }
    IOIteratorReset(existing);
    IOObjectRelease(existing);
    sub_1000060E0(v17, 27, v7);
    sub_1000060E0(v17, 28, v6);
    sub_1000060E0(v17, 25, v9);
    sub_1000060E0(v17, 26, v8);
    MatchingServices = 0;
  }
  return MatchingServices == 0;
}

void sub_1000072A4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Error: sysmond failed to insert mach port rights", v0, 2u);
}

void sub_1000072EC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Error: sysmond failed to allocate mach port", v0, 2u);
}

void sub_100007334()
{
}

void sub_100007350(int a1)
{
}

void sub_100007384()
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_object_release()
{
  return __os_object_release();
}

void abort(void)
{
}

uint64_t coalition_info_resource_usage()
{
  return _coalition_info_resource_usage();
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

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

kern_return_t host_processor_sets(host_priv_t host_priv, processor_set_name_array_t *processor_sets, mach_msg_type_number_t *processor_setsCnt)
{
  return _host_processor_sets(host_priv, processor_sets, processor_setsCnt);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return _host_statistics64(host_priv, flavor, host_info64_out, host_info64_outCnt);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_space_basic_info(ipc_space_inspect_t task, ipc_info_space_basic_t *basic_info)
{
  return _mach_port_space_basic_info(task, basic_info);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return _mach_vm_region(target_task, address, size, flavor, info, infoCnt, object_name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t pm_energy_impact()
{
  return _pm_energy_impact();
}

uint64_t pm_sample_task_and_pid()
{
  return _pm_sample_task_and_pid();
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return _proc_listpids(type, typeinfo, buffer, buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

kern_return_t processor_set_statistics(processor_set_name_t pset, processor_set_flavor_t flavor, processor_set_info_t info_out, mach_msg_type_number_t *info_outCnt)
{
  return _processor_set_statistics(pset, flavor, info_out, info_outCnt);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return _sysctlnametomib(a1, a2, a3);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return _task_name_for_pid(target_tport, pid, tn);
}

kern_return_t task_policy_get(task_policy_get_t task, task_policy_flavor_t flavor, task_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return _task_policy_get(task, flavor, policy_info, policy_infoCnt, get_default);
}

uint64_t task_read_for_pid()
{
  return _task_read_for_pid();
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

uint64_t xpc_coalition_copy_info()
{
  return _xpc_coalition_copy_info();
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

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
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

xpc_object_t xpc_date_create(int64_t interval)
{
  return _xpc_date_create(interval);
}

xpc_object_t xpc_date_create_from_current(void)
{
  return _xpc_date_create_from_current();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
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

uint64_t xpc_dictionary_set_mach_send()
{
  return _xpc_dictionary_set_mach_send();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return _xpc_double_create(value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return _xpc_uuid_create(uuid);
}