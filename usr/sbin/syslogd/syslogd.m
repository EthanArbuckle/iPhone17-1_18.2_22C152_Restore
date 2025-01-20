void sub_100004388(uint64_t a1, uint64_t a2)
{
  void v4[6];

  atomic_fetch_add_explicit((atomic_uint *volatile)&xmmword_100022388 + 2, 1u, memory_order_relaxed);
  asl_msg_retain();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_100004424;
  v4[3] = &unk_10001C7C0;
  v4[4] = a1;
  v4[5] = a2;
  dispatch_async((dispatch_queue_t)qword_100020040, v4);
}

uint64_t sub_100004424(uint64_t a1)
{
  time_t v2 = time(0);
  uint64_t v3 = qword_100022418;
  byte_100020048 = 0;
  uint64_t val_for_key = asl_msg_get_val_for_key();
  if (val_for_key)
  {
    if (v3)
    {
      uint64_t v5 = *(void *)(v3 + 24);
      if (v5)
      {
        v6 = (const char *)val_for_key;
        do
        {
          if (!strcmp(v6, *(const char **)v5)) {
            sub_1000045D0(v5, *(void *)(a1 + 32));
          }
          uint64_t v5 = *(void *)(v5 + 24);
        }
        while (v5);
      }
    }
  }
  else
  {
    if (!dword_10002004C || asl_check_option(*(void *)(a1 + 32), "store") == 1) {
      sub_10000459C(*(void *)(a1 + 32));
    }
    if (sub_1000045D0(v3, *(void *)(a1 + 32))) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v3 == 0;
    }
    if (!v7)
    {
      while (1)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (!v3) {
          break;
        }
        sub_1000045D0(v3, *(void *)(a1 + 32));
      }
    }
  }
  if (asl_msg_get_val_for_key()) {
    asl_msg_set_key_val();
  }
  if (dword_100022404) {
    sub_100007D8C(*(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  else {
    atomic_fetch_add_explicit((atomic_ullong *volatile)&xmmword_100022388, -*(void *)(a1 + 40), memory_order_relaxed);
  }
  uint64_t result = asl_msg_release();
  atomic_fetch_add_explicit((atomic_uint *volatile)&xmmword_100022388 + 2, 0xFFFFFFFF, memory_order_relaxed);
  if (v2 - qword_100020050 >= 300)
  {
    uint64_t result = sub_100004A2C(300);
    qword_100020050 = v2;
  }
  return result;
}

void sub_10000459C(uint64_t a1)
{
  if (!qword_100022418 || (*(unsigned char *)(qword_100022418 + 8)) && (byte_100020048 & 1) == 0)
  {
    byte_100020048 = 1;
    sub_10000B87C(a1);
  }
}

uint64_t sub_1000045D0(uint64_t a1, uint64_t a2)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 16);
      do
      {
        if ((*(_DWORD *)(v6 + 8) - 12) <= 2)
        {
          uint64_t v7 = *(void *)(v6 + 24);
          if (v7) {
            *(_DWORD *)(v7 + 72) &= ~0x80000000;
          }
        }
        uint64_t v6 = *(void *)(v6 + 40);
      }
      while (v6);
      do
      {
        if (*(void *)v5)
        {
          int v8 = *(_DWORD *)(v5 + 8);
          if ((v8 - 17) >= 3)
          {
            if (v8 == 5 && asl_msg_cmp() != 1) {
              return 0;
            }
            if (asl_msg_cmp() == 1)
            {
              int v9 = *(_DWORD *)(v5 + 8);
              uint64_t result = 1;
              switch(v9)
              {
                case 1:
                  sub_100005BA4(a1, *(char **)(v5 + 16), 1);
                  break;
                case 3:
                  return result;
                case 4:
                  return 0;
                case 6:
                  if (*(unsigned char *)(a1 + 8))
                  {
                    v14 = *(const char **)(v5 + 16);
                    if (v14) {
                      notify_post(v14);
                    }
                  }
                  break;
                case 8:
                  if (*(void *)a1 && !strcmp(*(const char **)a1, "com.apple.asl"))
                  {
                    v15 = *(char **)(v5 + 16);
                    int v16 = atoi(v15);
                    v17 = strchr(v15, 32);
                    if (v17 || (v17 = strchr(v15, 9)) != 0)
                    {
                      *v17++ = 0;
                      int v18 = atoi(v17);
                    }
                    else
                    {
                      int v18 = -1;
                    }
                    if (v16 != -1) {
                      asl_msg_set_key_val();
                    }
                    if (v17)
                    {
                      if (v18 != -1) {
                        asl_msg_set_key_val();
                      }
                      *(v17 - 1) = 32;
                    }
                  }
                  break;
                case 11:
                  sub_10000459C(a2);
                  break;
                case 12:
                case 13:
                  uint64_t v10 = *(void *)(v5 + 24);
                  if (!v10) {
                    break;
                  }
                  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
                    break;
                  }
                  int v11 = *(_DWORD *)(v10 + 72);
                  if (v11 < 0) {
                    break;
                  }
                  *(_DWORD *)(v10 + 72) = v11 | 0x80000000;
                  if (v9 == 12)
                  {
                    uint64_t v24 = *(void *)(v10 + 192);
                    if (!v24) {
                      goto LABEL_56;
                    }
                    v13 = (_DWORD *)(v24 + 28);
                    goto LABEL_55;
                  }
                  if (v9 == 13)
                  {
                    uint64_t v12 = *(void *)(v10 + 192);
                    if (v12)
                    {
                      v13 = (_DWORD *)(v12 + 36);
LABEL_55:
                      ++*v13;
                    }
                  }
LABEL_56:
                  if ((v11 & 0x400) != 0)
                  {
                    sub_100005D14();
                    asl_msg_retain();
                    v25 = qword_100020060;
                    block = _NSConcreteStackBlock;
                    uint64_t v28 = 0x40000000;
                    v29 = sub_100005D70;
                    v26 = &unk_10001C970;
LABEL_60:
                    v30 = v26;
                    uint64_t v31 = a1;
                    uint64_t v32 = v5;
                    uint64_t v33 = a2;
                    dispatch_async(v25, &block);
                  }
                  else
                  {
                    sub_100005E34((const char **)a1, v5);
                  }
                  break;
                case 14:
                  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
                    break;
                  }
                  uint64_t v19 = *(void *)(v5 + 24);
                  if (!v19) {
                    break;
                  }
                  uint64_t v20 = *(void *)(v19 + 192);
                  if (!v20) {
                    break;
                  }
                  int v21 = *(_DWORD *)(v19 + 72);
                  if (v21 < 0) {
                    break;
                  }
                  *(_DWORD *)(v19 + 72) = v21 | 0x80000000;
                  ++*(_DWORD *)(v20 + 24);
                  if ((v21 & 0x400) == 0)
                  {
                    sub_1000075F0((const char **)a1, v5);
                    break;
                  }
                  sub_100005D14();
                  asl_msg_retain();
                  v25 = qword_100020060;
                  block = _NSConcreteStackBlock;
                  uint64_t v28 = 0x40000000;
                  v29 = sub_10000752C;
                  v26 = &unk_10001CAD8;
                  goto LABEL_60;
                case 16:
                  asl_msg_get_val_for_key();
                  v22 = *(const char **)(v5 + 16);
                  if (!v22) {
                    break;
                  }
                  if (!strcmp(*(const char **)(v5 + 16), "enable"))
                  {
                    unsigned int v23 = *(_DWORD *)(a1 + 8) | 1;
LABEL_52:
                    *(_DWORD *)(a1 + 8) = v23;
                    break;
                  }
                  if (!strcmp(v22, "disable"))
                  {
                    unsigned int v23 = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE;
                    goto LABEL_52;
                  }
                  if (!strcmp(v22, "checkpoint") || !strcmp(v22, "rotate")) {
                    sub_1000059B4(a1, 0, 1);
                  }
                  break;
                default:
                  break;
              }
            }
          }
        }
        uint64_t v5 = *(void *)(v5 + 40);
      }
      while (v5);
    }
    return 0;
  }
  return result;
}

void sub_100004A2C(time_t a1)
{
  time_t v2 = time(0);
  uint64_t v9 = qword_100022418;
  if (qword_100022418)
  {
    time_t v10 = v2;
    while (1)
    {
      uint64_t v11 = *(void *)(v9 + 16);
      if (v11) {
        break;
      }
LABEL_30:
      uint64_t v9 = *(void *)(v9 + 24);
      if (!v9) {
        return;
      }
    }
    while (1)
    {
      if (!a1)
      {
        uint64_t v16 = *(void *)(v11 + 24);
        if (v16)
        {
          if ((*(unsigned char *)(v16 + 73) & 4) != 0)
          {
            sub_100006CD0(v11, 3, v3, v4, v5, v6, v7, v8);
            if (*(_DWORD *)(v11 + 8) != 13) {
              sub_100007118(v11, 1);
            }
          }
        }
        goto LABEL_29;
      }
      int v12 = *(_DWORD *)(v11 + 8);
      switch(v12)
      {
        case 12:
          uint64_t v19 = *(void *)(v11 + 24);
          if (!v19) {
            goto LABEL_29;
          }
          uint64_t v20 = *(void *)(v19 + 192);
          if (!v20 || !*(void *)(v20 + 8) || *(_DWORD *)(v20 + 28)) {
            goto LABEL_29;
          }
          uint64_t v15 = *(void *)(v20 + 16);
          break;
        case 14:
          uint64_t v17 = *(void *)(v11 + 24);
          if (!v17) {
            goto LABEL_29;
          }
          uint64_t v18 = *(void *)(v17 + 192);
          if (!v18 || (*(_DWORD *)v18 & 0x80000000) != 0 || *(_DWORD *)(v18 + 24)) {
            goto LABEL_29;
          }
          uint64_t v15 = *(void *)(v18 + 8);
          break;
        case 13:
          uint64_t v13 = *(void *)(v11 + 24);
          if (!v13) {
            goto LABEL_29;
          }
          uint64_t v14 = *(void *)(v13 + 192);
          if (!v14 || !*(void *)(v14 + 8) || *(_DWORD *)(v14 + 36)) {
            goto LABEL_29;
          }
          uint64_t v15 = *(void *)(v14 + 24);
          break;
        default:
          goto LABEL_29;
      }
      if (v10 - v15 >= a1) {
        sub_100006CD0(v11, 3, v3, v4, v5, v6, v7, v8);
      }
LABEL_29:
      uint64_t v11 = *(void *)(v11 + 40);
      if (!v11) {
        goto LABEL_30;
      }
    }
  }
}

uint64_t sub_100004B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100020058 != -1) {
    dispatch_once(&qword_100020058, &stru_10001C800);
  }
  if (qword_100022418 || (qword_100022418 = (uint64_t)asl_out_module_init()) != 0)
  {
    sub_100009A44("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"asl_action");
    dword_10002004C = 0;
    uint64_t v8 = qword_100022418;
    if (qword_100022418)
    {
      int v9 = 0;
      do
      {
        for (uint64_t i = *(void *)(v8 + 16); i; uint64_t i = *(void *)(i + 40))
        {
          sub_1000053BC((const char **)v8, i);
          uint64_t v11 = *(void *)(i + 24);
          if (v11) {
            v9 |= *(_DWORD *)(v11 + 72) & 0x404;
          }
        }
        uint64_t v8 = *(void *)(v8 + 24);
      }
      while (v8);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    if (DWORD2(xmmword_100022428))
    {
      int v12 = qword_100022438 ? (const char *)qword_100022438 : "/var/log/syslogd.log";
      uint64_t v13 = fopen(v12, "a");
      if (v13)
      {
        uint64_t v14 = v13;
        for (uint64_t j = qword_100022418; j; uint64_t j = *(void *)(j + 24))
        {
          uint64_t v16 = *(const char **)j;
          if (!*(void *)j) {
            uint64_t v16 = "<unknown>";
          }
          if ((*(_DWORD *)(j + 8) & 2) != 0) {
            uint64_t v17 = " (local)";
          }
          else {
            uint64_t v17 = (const char *)&unk_100019287;
          }
          fprintf(v14, "module: %s%s\n", v16, v17);
          asl_out_module_print(v14, j);
          fputc(10, v14);
        }
        fclose(v14);
      }
    }
    qword_100020050 = time(0);
    if ((v9 & 4) != 0)
    {
      sub_10000580C(0);
      if (!qword_100020070) {
        sub_100007CAC();
      }
    }
  }
  return 0;
}

void sub_100004D34(id a1)
{
  qword_100020040 = (uint64_t)dispatch_queue_create("ASL Action Queue", 0);
  qword_100020060 = (uint64_t)dispatch_queue_create("iOS CrashLog Queue", 0);
  v1 = qword_100020040;

  notify_register_dispatch("com.apple.crash_mover", &dword_100020000, v1, &stru_10001C840);
}

void sub_100004DAC(id a1, int a2)
{
  uint64_t state64 = 0;
  uint64_t v2 = qword_100020068;
  if (!notify_get_state(dword_100020000, &state64) && state64 != (v2 != 0))
  {
    qword_100020068 = 0;
    if (state64 == 1 && (qword_100020068 = time(0)) != 0)
    {
      sub_100009A44("CrashMover active: suspending crashlog queue and closing files\n", v3, v4, v5, v6, v7, v8, v9, v10);
      dispatch_suspend((dispatch_object_t)qword_100020060);
      sub_100004A2C(0);
    }
    else
    {
      sub_100009A44("CrashMover finished\n", v3, v4, v5, v6, v7, v8, v9, v10);
      dispatch_resume((dispatch_object_t)qword_100020060);
    }
  }
}

uint64_t sub_100004E5C()
{
  return 0;
}

time_t sub_100004E8C()
{
  if (qword_100020068)
  {
    dispatch_resume((dispatch_object_t)qword_100020060);
    qword_100020068 = 0;
  }
  dispatch_sync((dispatch_queue_t)qword_100020060, &stru_10001CB38);
  uint64_t v6 = qword_100022418;
  if (qword_100022418)
  {
    uint64_t v7 = qword_100022418;
    do
    {
      for (uint64_t i = *(void *)(v7 + 16); i; uint64_t i = *(void *)(i + 40))
      {
        switch(*(_DWORD *)(i + 8))
        {
          case 0xC:
          case 0xD:
            sub_100006CD0(i, 4, v0, v1, v2, v3, v4, v5);
            uint64_t v9 = *(void *)(i + 24);
            if (v9)
            {
              char v10 = *(void **)(v9 + 192);
              if (!v10) {
                goto LABEL_17;
              }
              free(v10);
              goto LABEL_16;
            }
            break;
          case 0xE:
            sub_100006CD0(i, 4, v0, v1, v2, v3, v4, v5);
            uint64_t v11 = *(void *)(i + 24);
            if (v11)
            {
              uint64_t v12 = *(void *)(v11 + 192);
              if (v12)
              {
                if (*(_DWORD *)(v12 + 16)) {
                  sub_1000078D4(i);
                }
                sub_1000074CC(v12);
LABEL_16:
                uint64_t v9 = *(void *)(i + 24);
LABEL_17:
                *(void *)(v9 + 192) = 0;
              }
            }
            break;
          case 0x11:
          case 0x12:
          case 0x13:
            sub_100007A5C(*(int **)(i + 32));
            break;
          default:
            continue;
        }
      }
      uint64_t v7 = *(void *)(v7 + 24);
    }
    while (v7);
  }
  asl_out_module_free(v6);
  qword_100022418 = 0;
  time_t result = time(0);
  qword_100020050 = result;
  return result;
}

uint64_t sub_100004FE8()
{
  return 0;
}

void sub_100005014(id a1)
{
  time_t v1 = sub_100004E8C();

  sub_100004B6C(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000503C(char *__s2)
{
  uint64_t v1 = qword_100022418;
  if (qword_100022418 && __s2)
  {
    do
    {
      if (*(void *)v1 && !strcmp(*(const char **)v1, __s2)) {
        break;
      }
      uint64_t v1 = *(void *)(v1 + 24);
    }
    while (v1);
  }
  return v1;
}

uint64_t sub_100005090(char *a1)
{
  uint64_t v22 = 0;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2000000000;
  uint64_t v25 = 0;
  if (a1)
  {
    uint64_t v1 = *a1;
    if (*a1)
    {
      if (v1 == 64) {
        uint64_t v2 = a1 + 1;
      }
      else {
        uint64_t v2 = a1;
      }
      while (1)
      {
        int v3 = *v2;
        if (v3 != 32 && v3 != 9) {
          break;
        }
        ++v2;
      }
      uint64_t v5 = explode(v2, " \t");
      uint64_t v13 = (void **)v5;
      v23[3] = (uint64_t)v5;
      if (!v5) {
        goto LABEL_16;
      }
      unsigned int v14 = -1;
      do
        ++v14;
      while (*(void *)&v5[8 * v14]);
      if (v14 < 2)
      {
LABEL_16:
        uint64_t v1 = 0xFFFFFFFFLL;
LABEL_25:
        free_string_list(v13);
        goto LABEL_26;
      }
      if (qword_100022418)
      {
        if (strcasecmp(*((const char **)v5 + 1), "define") || !strcmp((const char *)*v13, "*"))
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 0x40000000;
          v19[2] = sub_100005864;
          v19[3] = &unk_10001C910;
          v19[4] = &v22;
          unsigned int v20 = v14;
          dispatch_sync((dispatch_queue_t)qword_100020040, v19);
LABEL_21:
          uint64_t v1 = 0;
LABEL_24:
          uint64_t v13 = (void **)v23[3];
          goto LABEL_25;
        }
        uint64_t v17 = strdup(v2);
        if (v17)
        {
          uint64_t v18 = v17;
          block[0] = _NSConcreteStackBlock;
          block[1] = 0x40000000;
          block[2] = sub_10000529C;
          block[3] = &unk_10001C8E8;
          block[4] = &v22;
          block[5] = v17;
          dispatch_sync((dispatch_queue_t)qword_100020040, block);
          free(v18);
          goto LABEL_21;
        }
        uint64_t v15 = "asl_action_control_set_param: memory allocation failed\n";
      }
      else
      {
        uint64_t v15 = "asl_action_control_set_param: no modules loaded\n";
      }
      sub_100009A44(v15, v6, v7, v8, v9, v10, v11, v12, v19[0]);
      uint64_t v1 = 0xFFFFFFFFLL;
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v1 = 0xFFFFFFFFLL;
  }
LABEL_26:
  _Block_object_dispose(&v22, 8);
  return v1;
}

void sub_10000529C(uint64_t a1)
{
  for (uint64_t i = *(unsigned __int8 **)(a1 + 40); ; ++i)
  {
    int v2 = *i;
    if (v2 == 32 || v2 == 9) {
      break;
    }
  }
  while (v2 == 9 || v2 == 32)
  {
    char v4 = *++i;
    LOBYTE(v2) = v4;
  }
  while (v2 != 9 && v2 != 32)
  {
    char v5 = *++i;
    LOBYTE(v2) = v5;
  }
  uint64_t v6 = **(char ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v7 = (const char **)sub_10000503C(v6);
  if (!v7)
  {
    uint64_t v8 = (const char **)asl_out_module_new(v6);
    uint64_t v7 = v8;
    uint64_t v9 = qword_100022418;
    do
    {
      uint64_t v10 = v9;
      uint64_t v9 = *(void *)(v9 + 24);
    }
    while (v9);
    *(void *)(v10 + 24) = v8;
  }
  uint64_t v11 = asl_out_module_parse_line((uint64_t)v7, i);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1000053BC(v7, (uint64_t)v11);
    uint64_t v13 = v12[3];
    if (v13)
    {
      if ((*(unsigned char *)(v13 + 72) & 4) != 0)
      {
        sub_10000580C(0);
        if (!qword_100020070)
        {
          sub_100007CAC();
        }
      }
    }
  }
}

void sub_1000053BC(const char **a1, uint64_t a2)
{
  if (a1)
  {
    char v4 = (const char **)qword_100022418;
    if ((const char **)qword_100022418 != a1)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      if (v5)
      {
        if (*(void *)(v5 + 8) && qword_100022418 != 0)
        {
          while (1)
          {
            uint64_t v7 = v4[2];
            if (v7) {
              break;
            }
LABEL_14:
            char v4 = (const char **)v4[3];
            if (v4) {
              BOOL v11 = v4 == a1;
            }
            else {
              BOOL v11 = 1;
            }
            if (v11) {
              goto LABEL_23;
            }
          }
          while (1)
          {
            if (*((_DWORD *)v7 + 2) == 2)
            {
              uint64_t v8 = *((void *)v7 + 3);
              if (v8)
              {
                uint64_t v9 = *(const char **)(v8 + 8);
                if (v9)
                {
                  uint64_t v10 = *(void *)(a2 + 24);
                  if (!strcmp(*(const char **)(v10 + 8), v9)) {
                    break;
                  }
                }
              }
            }
            uint64_t v7 = (const char *)*((void *)v7 + 5);
            if (!v7) {
              goto LABEL_14;
            }
          }
          asl_out_dst_data_release(v10);
          *(void *)(a2 + 24) = 0;
          if (*(_DWORD *)(a2 + 8) == 2)
          {
            name = 0;
            asprintf(&name, "[Sender syslogd] [Level 5] [PID %u] [Message Configuration Notice:\nASL Module \"%s\" sharing output destination \"%s\" with ASL Module \"%s\".\nOutput parameters from ASL Module \"%s\" override any specified in ASL Module \"%s\".] [UID 0] [GID 0] [Facility syslog]", dword_10002237C, *a1, *(const char **)(*((void *)v7 + 3) + 8), *v4, *v4, *a1);
            sub_10000A6C8(name);
            free(name);
          }
          else
          {
            *(void *)(a2 + 24) = asl_out_dst_data_retain(*((void *)v7 + 3));
          }
        }
      }
    }
LABEL_23:
    switch(*(_DWORD *)(a2 + 8))
    {
      case 1:
        if (!*(void *)a2) {
          sub_100005BA4((uint64_t)a1, *(char **)(a2 + 16), 1);
        }
        break;
      case 5:
        if ((const char **)qword_100022418 != a1)
        {
          uint64_t v12 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
          if (v12)
          {
            uint64_t v13 = v12;
            name = 0;
            asprintf(&name, "[Sender syslogd] [Level 5] [PID %u] [Message Configuration Notice:\nASL Module \"%s\" claims selected messages.\nThose messages may not appear in standard system log files or in the ASL database.] [UID 0] [GID 0] [Facility syslog]", dword_10002237C, *a1);
            sub_10000A6C8(name);
            free(name);
            *(void *)uint64_t v13 = asl_msg_copy();
            v13[2] = 4;
            uint64_t v14 = qword_100022418;
            *((void *)v13 + 5) = *(void *)(qword_100022418 + 16);
            *(void *)(v14 + 16) = v13;
          }
          uint64_t v15 = *(const char **)(a2 + 16);
          if (!v15 || strcmp(v15, "only")) {
            *(_DWORD *)(a2 + 8) = 0;
          }
        }
        break;
      case 0xB:
        ++dword_10002004C;
        break;
      case 0xC:
        if (!*(void *)(*(void *)(a2 + 24) + 192))
        {
          size_t v16 = 40;
          unsigned int v17 = 1098898501;
          goto LABEL_37;
        }
        break;
      case 0xD:
        if (!*(void *)(*(void *)(a2 + 24) + 192))
        {
          size_t v16 = 72;
          unsigned int v17 = -1672229542;
LABEL_37:
          *(void *)(*(void *)(a2 + 24) + 192) = malloc_type_calloc(1uLL, v16, v17 | 0x102004000000000);
        }
        break;
      case 0xE:
        uint64_t v18 = *(_DWORD **)(*(void *)(a2 + 24) + 192);
        if (v18
          || (uint64_t v18 = malloc_type_calloc(1uLL, 0x38uLL, 0x10300401EE6F584uLL),
              (*(void *)(*(void *)(a2 + 24) + 192) = v18) != 0))
        {
          *uint64_t v18 = -1;
        }
        break;
      case 0x11:
        name = 0;
        uint64_t v19 = (const char *)sub_100007C14((uint64_t)a1, a2);
        if (v19)
        {
          asprintf(&name, "%s%s", "com.apple.system.notify.service.path:0x87:", v19);
          if (name)
          {
            int out_token = 0;
            notify_register_dispatch(name, &out_token, (dispatch_queue_t)qword_100020040, &stru_10001CBF8);
            free(name);
            unsigned int v20 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
            int v21 = out_token;
            if (v20) {
              goto LABEL_50;
            }
            goto LABEL_44;
          }
        }
        break;
      case 0x12:
        uint64_t v22 = (void *)sub_100007A9C((uint64_t)a1, a2);
        notification_key = (char *)configuration_profile_create_notification_key();
        free(v22);
        if (notification_key)
        {
          LODWORD(name) = 0;
          uint64_t v24 = qword_100020040;
          uint64_t v25 = &stru_10001CB78;
          goto LABEL_49;
        }
        break;
      case 0x13:
        v26 = (void *)sub_100007A9C((uint64_t)a1, a2);
        notification_key = (char *)configuration_profile_create_notification_key();
        free(v26);
        if (notification_key)
        {
          LODWORD(name) = 0;
          uint64_t v24 = qword_100020040;
          uint64_t v25 = &stru_10001CBB8;
LABEL_49:
          notify_register_dispatch(notification_key, (int *)&name, v24, v25);
          free(notification_key);
          unsigned int v20 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
          int v21 = (int)name;
          if (v20)
          {
LABEL_50:
            *unsigned int v20 = v21;
            *(void *)(a2 + 32) = v20;
          }
          else
          {
LABEL_44:
            notify_cancel(v21);
          }
        }
        break;
      default:
        return;
    }
  }
}

uint64_t sub_10000580C(int a1)
{
  for (uint64_t i = qword_100022418; i; uint64_t i = *(void *)(i + 24))
    sub_1000059B4(i, 0, a1);

  return asl_trigger_aslmanager();
}

uint64_t sub_100005864(uint64_t a1)
{
  int v2 = **(char ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = strcmp(v2, "*");
  int v4 = result;
  if (result)
  {
    uint64_t result = sub_10000503C(v2);
    uint64_t i = result;
    if (result) {
      goto LABEL_5;
    }
  }
  else
  {
    for (uint64_t i = qword_100022418; i; uint64_t i = *(void *)(i + 24))
    {
LABEL_5:
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      uint64_t v7 = *(const char **)(v6 + 8);
      uint64_t result = strcasecmp(v7, "enable");
      if (result)
      {
        uint64_t result = strcasecmp(v7, "checkpoint");
        if (!result)
        {
          if (*(_DWORD *)(a1 + 40) < 3u)
          {
            uint64_t v9 = i;
            uint64_t v8 = 0;
          }
          else
          {
            uint64_t v8 = *(char **)(v6 + 16);
            uint64_t v9 = i;
          }
          uint64_t result = sub_1000059B4(v9, v8, 1);
        }
        if (v4) {
          return result;
        }
      }
      else if (v4 || (uint64_t result = strcmp(*(const char **)i, "com.apple.asl"), result))
      {
        if (*(_DWORD *)(a1 + 40) < 3u || (uint64_t result = atoi(*(const char **)(v6 + 16)), result)) {
          unsigned int v10 = *(_DWORD *)(i + 8) | 1;
        }
        else {
          unsigned int v10 = *(_DWORD *)(i + 8) & 0xFFFFFFFE;
        }
        *(_DWORD *)(i + 8) = v10;
        if (v4) {
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000059B4(uint64_t a1, char *__s2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = 0;
  do
  {
    if ((*(_DWORD *)(v3 + 8) | 2) == 0xE)
    {
      uint64_t v7 = *(void *)(v3 + 24);
      if ((*(unsigned char *)(v7 + 72) & 4) != 0
        && (!__s2
         || (uint64_t v8 = *(char **)(v7 + 8)) != 0
         && (!strcmp(*(const char **)(v7 + 8), __s2) || (uint64_t v9 = strrchr(v8, 47)) != 0 && !strcmp(v9 + 1, __s2)))
        && (int)sub_100007118(v3, a3) >= 1)
      {
        sub_100006CD0(v3, 0);
        uint64_t v6 = 1;
      }
    }
    uint64_t v3 = *(void *)(v3 + 40);
  }
  while (v3);
  return v6;
}

void sub_100005A84(uint64_t a1, uint64_t a2, char a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100005B00;
  block[3] = &unk_10001C930;
  char v4 = a3;
  block[4] = a1;
  block[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_100020040, block);
}

uint64_t sub_100005B00(uint64_t result)
{
  uint64_t v1 = qword_100022418;
  if (qword_100022418)
  {
    uint64_t v2 = result;
    do
    {
      if (*(unsigned char *)(v2 + 48) || (uint64_t result = asl_msg_lookup(), !result)) {
        uint64_t result = asl_msg_set_key_val();
      }
      uint64_t v1 = *(void *)(v1 + 24);
    }
    while (v1);
  }
  return result;
}

void sub_100005BA4(uint64_t a1, char *a2, int a3)
{
  uint64_t v6 = (const char **)explode(a2, " \t");
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  unsigned int v8 = -1;
  do
    ++v8;
  while (v6[v8]);
  if (v8)
  {
    uint64_t v9 = *v6;
    if (!strcasecmp(*v6, "enable"))
    {
      if (v8 >= 2) {
        int v10 = atoi(v7[1]);
      }
      else {
        int v10 = 1;
      }
      BOOL v12 = v10 == 0;
      if (a3) {
        BOOL v12 = v10 != 0;
      }
    }
    else
    {
      if (strcasecmp(v9, "disable"))
      {
        free_string_list((void **)v7);
        if (!strcmp(*(const char **)a1, "com.apple.asl"))
        {
          sub_10000924C(a2, a3);
        }
        return;
      }
      if (v8 >= 2) {
        int v11 = atoi(v7[1]);
      }
      else {
        int v11 = 1;
      }
      BOOL v13 = v11 == 0;
      if (a3) {
        BOOL v13 = v11;
      }
      BOOL v12 = !v13;
    }
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE | v12;
  }

  free_string_list((void **)v7);
}

void sub_100005D14()
{
  if (qword_100020068)
  {
    if (time(0) - qword_100020068 >= 61)
    {
      sub_100009A44("CrashMover timeout: resuming crashlog queue\n", v0, v1, v2, v3, v4, v5, v6, v7);
      dispatch_resume((dispatch_object_t)qword_100020060);
      qword_100020068 = 0;
    }
  }
}

void sub_100005D70(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100005DF4;
  block[3] = &unk_10001C950;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)qword_100020040, block);
}

uint64_t sub_100005DF4(uint64_t a1)
{
  sub_100005E34(*(const char ***)(a1 + 32), *(void *)(a1 + 40));

  return asl_msg_release();
}

void sub_100005E34(const char **a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 8) != 13)
  {
    uint64_t v16 = *(void *)(a2 + 24);
    if (!v16) {
      return;
    }
    uint64_t v17 = *(void *)(v16 + 192);
    if (!v17) {
      return;
    }
    int v18 = *(_DWORD *)(v17 + 28);
    if (v18) {
      *(_DWORD *)(v17 + 28) = v18 - 1;
    }
    uint64_t __ptr = 0;
    if (*(void *)(v17 + 8))
    {
      ++*(void *)v17;
      goto LABEL_18;
    }
    if (sub_10000630C(a2)) {
      goto LABEL_32;
    }
    int set_position = asl_file_read_set_position();
    if (set_position)
    {
      char v23 = set_position;
      asl_core_error();
      sub_100009A44("_act_store_file_setup: asl_file_read_set_position failed %d %s\n", v24, v25, v26, v27, v28, v29, v30, v23);
    }
    else
    {
      uint64_t v40 = *(void *)(v17 + 8);
      *(void *)uint64_t v17 = *(void *)(v40 + 80) + 1;
      if (!fseek(*(FILE **)(v40 + 104), 0, 2))
      {
LABEL_18:
        *(void *)(v17 + 16) = time(0);
        *(_DWORD *)(*(void *)(a2 + 24) + 76) = 0;
        uint64_t __ptr = *(void *)v17;
        if (!asl_file_save())
        {
          *(void *)(*(void *)(a2 + 24) + 184) = *(void *)(*(void *)(v17 + 8) + 96);
          if (sub_100007118(a2, 0) == 1) {
            asl_trigger_aslmanager();
          }
          return;
        }
LABEL_32:
        uint64_t v19 = "_act_store_file";
        unsigned int v20 = a1;
        uint64_t v21 = a2;
LABEL_33:
        sub_1000061E8((char)v19, v20, v21);
        return;
      }
      int v41 = *__error();
      v42 = __error();
      strerror(*v42);
      sub_100009A44("_act_store_file_setup: fseek failed %d %s\n", v43, v44, v45, v46, v47, v48, v49, v41);
    }
    sub_100006CD0(a2, 2);
    goto LABEL_32;
  }
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 192);
    if (v5)
    {
      int v6 = *(_DWORD *)(v5 + 36);
      if (v6) {
        *(_DWORD *)(v5 + 36) = v6 - 1;
      }
      if (asl_msg_get_val_for_key())
      {
        uint64_t v7 = *(void *)(a2 + 24);
        if (v7)
        {
          uint64_t v8 = *(void *)(v7 + 192);
          if (v8)
          {
            if (*(void *)(v7 + 8))
            {
              if (sub_10000630C(a2))
              {
                sub_100009A44("_act_store_dir_setup: _act_dst_open %s failed\n", v9, v10, v11, v12, v13, v14, v15, *(void *)(*(void *)(a2 + 24) + 8));
              }
              else
              {
                uint64_t __ptr = 0;
                rewind(*(FILE **)v8);
                if (fread(&__ptr, 8uLL, 1uLL, *(FILE **)v8) == 1)
                {
                  *(void *)(v8 + 16) = asl_core_ntohq() + 1;
                  uint64_t __ptr = asl_core_htonq();
                  rewind(*(FILE **)v8);
                  if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)v8) == 1)
                  {
                    fflush(*(FILE **)v8);
                    if (fseek(*(FILE **)(*(void *)(v8 + 8) + 104), 0, 2))
                    {
                      int v31 = *__error();
                      uint64_t v32 = __error();
                      strerror(*v32);
                      sub_100009A44("_act_store_dir_setup: aslfile fseek failed %d %s\n", v33, v34, v35, v36, v37, v38, v39, v31);
                      sub_100006CD0(a2, 2);
                    }
                    else
                    {
                      *(void *)(v5 + 24) = time(0);
                      *(_DWORD *)(*(void *)(a2 + 24) + 76) = 0;
                      if (!asl_file_save())
                      {
                        *(void *)(*(void *)(a2 + 24) + 184) = *(void *)(*(void *)(v5 + 8) + 96);
                        return;
                      }
                      char v68 = asl_core_error();
                      sub_100009A44("_act_store_dir asl_file_save FAILED %s\n", v69, v70, v71, v72, v73, v74, v75, v68);
                    }
                  }
                  else
                  {
                    int v59 = *__error();
                    v60 = __error();
                    strerror(*v60);
                    sub_100009A44("_act_store_dir_setup: storedata write failed %d %s\n", v61, v62, v63, v64, v65, v66, v67, v59);
                    sub_100006CD0(a2, 2);
                  }
                }
                else
                {
                  int v50 = *__error();
                  v51 = __error();
                  strerror(*v51);
                  sub_100009A44("_act_store_dir_setup: storedata read failed %d %s\n", v52, v53, v54, v55, v56, v57, v58, v50);
                  sub_100006CD0(a2, 2);
                }
              }
            }
          }
        }
        uint64_t v19 = "_act_store_dir";
        unsigned int v20 = a1;
        uint64_t v21 = a2;
        goto LABEL_33;
      }
    }
  }
}

void sub_1000061E8(char a1, const char **a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 24);
  if ((*(unsigned char *)(v3 + 73) & 8) == 0)
  {
    ++*(_DWORD *)(v3 + 76);
    asl_core_error();
    sub_100009A44("%s: %s save to %s failed: %s\n", v7, v8, v9, v10, v11, v12, v13, a1);
    uint64_t v14 = *(void *)(a3 + 24);
    unsigned int v15 = *(_DWORD *)(v14 + 76);
    if (v15 >= 6)
    {
      uint64_t v22 = 0;
      uint64_t v16 = *a2;
      uint64_t v17 = *(const char **)(v14 + 8);
      int v18 = dword_10002237C;
      uint64_t v19 = (const char *)asl_core_error();
      asprintf(&v22, "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message Disabling module %s writes to %s following %u failures (%s)]", v18, v16, v17, v15, v19);
      sub_10000A6C8(v22);
      free(v22);
      int v20 = *(_DWORD *)(a3 + 8);
      switch(v20)
      {
        case 12:
          goto LABEL_6;
        case 14:
          sub_1000074CC(*(void *)(*(void *)(a3 + 24) + 192));
          break;
        case 13:
LABEL_6:
          uint64_t v21 = *(void **)(*(void *)(a3 + 24) + 192);
          if (v21) {
            free(v21);
          }
          break;
      }
      *(void *)(*(void *)(a3 + 24) + 192) = 0;
      *(_DWORD *)(a3 + 8) = 0;
    }
  }
}

uint64_t sub_10000630C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(unsigned int **)(v2 + 192);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 == 12)
  {
    if (*((void *)v3 + 1)) {
      return 0;
    }
    int v29 = asl_out_mkpath(qword_100022418, a1);
    uint64_t v30 = *(void *)(a1 + 24);
    if (v29)
    {
      sub_100009A44("_asl_file_open: asl_out_mkpath %s failed\n", v22, v23, v24, v25, v26, v27, v28, *(void *)(v30 + 8));
      return 0xFFFFFFFFLL;
    }
    int open = asl_out_dst_file_create_open(v30, 0);
    if (open < 0)
    {
      uint64_t v72 = *(void *)(*(void *)(a1 + 24) + 16);
      __error();
      uint64_t v73 = __error();
      strerror(*v73);
      sub_100009A44("_asl_file_open: _act_file_create_open %s failed %d %s\n", v74, v75, v76, v77, v78, v79, v80, v72);
      return 0xFFFFFFFFLL;
    }
    close(open);
    if (*(void *)(*(void *)(a1 + 24) + 16))
    {
      if (asl_file_open_write())
      {
        uint64_t v37 = *(void *)(*(void *)(a1 + 24) + 16);
        __error();
        uint64_t v38 = __error();
        strerror(*v38);
        sub_100009A44("_asl_file_open: asl_file_open_write %s failed %d %s\n", v39, v40, v41, v42, v43, v44, v45, v37);
        return 0xFFFFFFFFLL;
      }
      int v90 = fileno(*(FILE **)(*((void *)v3 + 1) + 104));
      uint64_t v91 = *((void *)v3 + 1);
      v92 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v90, 1uLL, (dispatch_queue_t)qword_100020040);
      *((void *)v3 + 4) = v92;
      if (v92)
      {
        *(void *)&v191.st_dev = _NSConcreteStackBlock;
        v191.st_ino = 0x40000000;
        *(void *)&v191.st_uid = sub_1000073CC;
        *(void *)&v191.st_rdev = &unk_10001CA10;
        v191.st_atimespec.tv_sec = a1;
        dispatch_source_set_event_handler(v92, &v191);
        v100 = *((void *)v3 + 4);
        *(void *)&handler[0].tm_sec = _NSConcreteStackBlock;
        *(void *)&handler[0].tm_hour = 0x40000000;
        *(void *)&handler[0].tm_mon = sub_1000073D8;
        *(void *)&handler[0].tm_wday = &unk_10001CA30;
        LODWORD(handler[0].tm_gmtoff) = v90;
        *(void *)&handler[0].tm_isdst = v91;
        dispatch_source_set_cancel_handler(v100, handler);
        dispatch_resume(*((dispatch_object_t *)v3 + 4));
      }
      sub_100009A44("_asl_file_open ASL file %s fd %d\n", v93, v94, v95, v96, v97, v98, v99, *(void *)(*(void *)(a1 + 24) + 16));
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  if (v4 != 14)
  {
    if (v4 == 13)
    {
      int v5 = sub_100007034(a1);
      uint64_t v13 = *(void *)(a1 + 24);
      if (v5)
      {
        sub_100009A44("_asl_dir_today_open: No directory at path %s\n", v6, v7, v8, v9, v10, v11, v12, *(void *)(v13 + 8));
LABEL_8:
        sub_100009A44("_act_dst_open:_asl_dir_today_open %s FAILED!\n", v14, v15, v16, v17, v18, v19, v20, *(void *)(*(void *)(a1 + 24) + 8));
        return 0xFFFFFFFFLL;
      }
      uint64_t v34 = *(void *)(v13 + 192);
      memset(handler, 0, 56);
      time_t __ptr = time(0);
      if (!localtime_r(&__ptr, handler))
      {
        uint64_t v46 = __error();
        char v181 = strerror(*v46);
        sub_100009A44("_asl_dir_today_open: localtime_r error %s\n", v47, v48, v49, v50, v51, v52, v53, v181);
        goto LABEL_8;
      }
      if (sub_100007118(a1, 0) == 1) {
        asl_trigger_aslmanager();
      }
      if (*(void *)(v34 + 8))
      {
        if (__PAIR64__(*(_DWORD *)(v34 + 40), *(_DWORD *)(v34 + 44)) == *(void *)&handler[0].tm_mon
          && *(_DWORD *)(v34 + 48) == handler[0].tm_mday)
        {
          goto LABEL_51;
        }
        sub_100006F58(a1);
      }
      uint64_t v35 = *(void *)(a1 + 24);
      if (*(unsigned char *)(v35 + 73))
      {
        asl_make_timestamp(__ptr, *(_DWORD *)(v35 + 64), __str, 0x20uLL);
        asprintf((char **)(*(void *)(a1 + 24) + 16), "%s/%s.asl");
      }
      else
      {
        asprintf((char **)(v35 + 16), "%s/%d.%02d.%02d.asl");
      }
      if (!*(void *)(*(void *)(a1 + 24) + 16))
      {
        uint64_t v64 = __error();
        char v182 = strerror(*v64);
        sub_100009A44("_asl_dir_today_open: asprintf error %s\n", v65, v66, v67, v68, v69, v70, v71, v182);
        goto LABEL_8;
      }
      mode_t v54 = umask(0);
      int v55 = asl_file_open_write();
      umask(v54);
      if (v55)
      {
        uint64_t v56 = *(void *)(*(void *)(a1 + 24) + 16);
        asl_core_error();
        sub_100009A44("_asl_dir_today_open: asl_file_open_write %s error %s\n", v57, v58, v59, v60, v61, v62, v63, v56);
LABEL_44:
        free(*(void **)(*(void *)(a1 + 24) + 16));
        *(void *)(*(void *)(a1 + 24) + 16) = 0;
        goto LABEL_8;
      }
      if (fseek(*(FILE **)(*(void *)(v34 + 8) + 104), 0, 2))
      {
        uint64_t v81 = *(void *)(*(void *)(a1 + 24) + 16);
        v82 = __error();
        strerror(*v82);
        sub_100009A44("_asl_dir_today_open: fseek %s error %s\n", v83, v84, v85, v86, v87, v88, v89, v81);
        goto LABEL_44;
      }
      *(int32x2_t *)(v34 + 40) = vrev64_s32(*(int32x2_t *)&handler[0].tm_mon);
      *(_DWORD *)(v34 + 48) = handler[0].tm_mday;
      int v101 = fileno(*(FILE **)(*(void *)(v34 + 8) + 104));
      __darwin_time_t v102 = *(void *)(v34 + 8);
      v103 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v101, 1uLL, (dispatch_queue_t)qword_100020040);
      *(void *)(v34 + 64) = v103;
      if (v103)
      {
        v184 = _NSConcreteStackBlock;
        uint64_t v185 = 0x40000000;
        v186 = sub_100007314;
        v187 = &unk_10001C990;
        uint64_t v188 = a1;
        dispatch_source_set_event_handler(v103, &v184);
        v111 = *(NSObject **)(v34 + 64);
        *(void *)&v191.st_dev = _NSConcreteStackBlock;
        v191.st_ino = 0x40000000;
        *(void *)&v191.st_uid = sub_100007320;
        *(void *)&v191.st_rdev = &unk_10001C9B0;
        LODWORD(v191.st_atimespec.tv_nsec) = v101;
        v191.st_atimespec.tv_sec = v102;
        dispatch_source_set_cancel_handler(v111, &v191);
        dispatch_resume(*(dispatch_object_t *)(v34 + 64));
      }
      sub_100009A44("_asl_dir_today_open ASL file %s fd %d\n", v104, v105, v106, v107, v108, v109, v110, *(void *)(*(void *)(a1 + 24) + 16));
LABEL_51:
      uint64_t v112 = *(void *)(*(void *)(a1 + 24) + 192);
      if (!*(void *)v112)
      {
        if (sub_100007034(a1))
        {
          sub_100009A44("_asl_dir_storedata_open: No directory at path %s\n", v113, v114, v115, v116, v117, v118, v119, *(void *)(*(void *)(a1 + 24) + 8));
LABEL_54:
          sub_100009A44("_act_dst_open:_asl_dir_storedata_open %s FAILED!  Closing today file\n", v120, v121, v122, v123, v124, v125, v126, *(void *)(*(void *)(a1 + 24) + 8));
          sub_100006F58(a1);
          return 0xFFFFFFFFLL;
        }
        snprintf((char *)handler, 0x400uLL, "%s/%s", *(const char **)(*(void *)(a1 + 24) + 8), "StoreData");
        memset(&v191, 0, sizeof(v191));
        if (stat((const char *)handler, &v191))
        {
          if (*__error() != 2)
          {
            v148 = __error();
            char v183 = strerror(*v148);
            sub_100009A44("_asl_dir_storedata_open: stat error %s\n", v149, v150, v151, v152, v153, v154, v155, v183);
            goto LABEL_54;
          }
          v127 = fopen((const char *)handler, "w+");
          *(void *)uint64_t v112 = v127;
          if (!v127)
          {
            v164 = __error();
            strerror(*v164);
            sub_100009A44("_asl_dir_storedata_open: fopen new %s: %s\n", v165, v166, v167, v168, v169, v170, v171, (char)handler);
            goto LABEL_54;
          }
          time_t __ptr = asl_core_htonq();
          if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)v112) != 1)
          {
            int v172 = *__error();
            v173 = __error();
            strerror(*v173);
            sub_100009A44("_asl_dir_storedata_open: storedata write failed %d %s\n", v174, v175, v176, v177, v178, v179, v180, v172);
            goto LABEL_54;
          }
          if (chown((const char *)handler, **(_DWORD **)(*(void *)(a1 + 24) + 120), **(_DWORD **)(*(void *)(a1 + 24) + 136)))
          {
            v128 = __error();
            strerror(*v128);
            sub_100009A44("_asl_dir_storedata_open: chown %d %d new %s: %s\n", v129, v130, v131, v132, v133, v134, v135, (char)handler);
            goto LABEL_54;
          }
          v136 = *(FILE **)v112;
        }
        else
        {
          v136 = fopen((const char *)handler, "r+");
          *(void *)uint64_t v112 = v136;
          if (!v136)
          {
            v156 = __error();
            strerror(*v156);
            sub_100009A44("_asl_dir_storedata_open: fopen existing %s: %s\n", v157, v158, v159, v160, v161, v162, v163, (char)handler);
            goto LABEL_54;
          }
        }
        int v137 = fileno(v136);
        v138 = *(FILE **)v112;
        v139 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v137, 1uLL, (dispatch_queue_t)qword_100020040);
        *(void *)(v112 + 56) = v139;
        if (v139)
        {
          *(void *)__str = _NSConcreteStackBlock;
          uint64_t v193 = 0x40000000;
          v194 = sub_100007370;
          v195 = &unk_10001C9D0;
          uint64_t v196 = a1;
          dispatch_source_set_event_handler(v139, __str);
          v147 = *(NSObject **)(v112 + 56);
          v184 = _NSConcreteStackBlock;
          uint64_t v185 = 0x40000000;
          v186 = sub_10000737C;
          v187 = &unk_10001C9F0;
          int v189 = v137;
          uint64_t v188 = (uint64_t)v138;
          dispatch_source_set_cancel_handler(v147, &v184);
          dispatch_resume(*(dispatch_object_t *)(v112 + 56));
        }
        sub_100009A44("_asl_dir_storedata_open ASL storedata %s fd %d\n", v140, v141, v142, v143, v144, v145, v146, (char)handler);
      }
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  if ((*v3 & 0x80000000) == 0) {
    return 0;
  }
  unsigned int v31 = asl_out_dst_file_create_open(v2, 0);
  *uint64_t v3 = v31;
  if ((v31 & 0x80000000) != 0)
  {
    if (asl_out_mkpath(qword_100022418, a1)) {
      return 0xFFFFFFFFLL;
    }
    unsigned int v31 = asl_out_dst_file_create_open(*(void *)(a1 + 24), 0);
    *uint64_t v3 = v31;
    if ((v31 & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t result = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v31, 1uLL, (dispatch_queue_t)qword_100020040);
  *((void *)v3 + 6) = result;
  if (result)
  {
    unsigned int v32 = *v3;
    *(void *)&handler[0].tm_sec = _NSConcreteStackBlock;
    *(void *)&handler[0].tm_hour = 0x40000000;
    *(void *)&handler[0].tm_mon = sub_100007428;
    *(void *)&handler[0].tm_wday = &unk_10001CA50;
    LODWORD(handler[0].tm_gmtoff) = v32;
    *(void *)&handler[0].tm_isdst = a1;
    dispatch_source_set_event_handler((dispatch_source_t)result, handler);
    uint64_t v33 = *((void *)v3 + 6);
    *(void *)&v191.st_dev = _NSConcreteStackBlock;
    v191.st_ino = 0x40000000;
    *(void *)&v191.st_uid = sub_10000747C;
    *(void *)&v191.st_rdev = &unk_10001CA70;
    LODWORD(v191.st_atimespec.tv_sec) = v32;
    dispatch_source_set_cancel_handler(v33, &v191);
    dispatch_resume(*((dispatch_object_t *)v3 + 6));
    return 0;
  }
  return result;
}

void sub_100006CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)(a1 + 24);
    if (v9)
    {
      if (*(void *)(v9 + 192))
      {
        int v10 = a2;
        int v11 = *(_DWORD *)(a1 + 8);
        switch(v11)
        {
          case 12:
            sub_100009A44("_act_dst_close: %s ASL FILE %s\n", a2, a3, a4, a5, a6, a7, a8, (char)off_10001CA90[a2]);
            uint64_t v20 = *(void *)(a1 + 24);
            if (v20)
            {
              uint64_t v21 = *(void *)(v20 + 192);
              if (*(void *)(v21 + 8))
              {
                int v22 = *(_DWORD *)(v21 + 28);
                if (v22)
                {
                  uint64_t v51 = 0;
                  asprintf(&v51, "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message ASL File %s was closed with %d pending messages]", dword_10002237C, *(const char **)(v20 + 16), v22);
                  sub_10000A6C8((uint64_t)v51);
                  free(v51);
                }
                uint64_t v23 = *(NSObject **)(v21 + 32);
                if (v23)
                {
                  dispatch_source_cancel(v23);
                  dispatch_release(*(dispatch_object_t *)(v21 + 32));
                  *(void *)(v21 + 32) = 0;
                }
                else
                {
                  char v43 = fileno(*(FILE **)(*(void *)(v21 + 8) + 104));
                  sub_100009A44("close ASL fd %d\n", v44, v45, v46, v47, v48, v49, v50, v43);
                  asl_file_close();
                }
                *(void *)(v21 + 8) = 0;
              }
            }
            break;
          case 14:
            sub_100009A44("_act_dst_close: %s FILE %s\n", a2, a3, a4, a5, a6, a7, a8, (char)off_10001CA90[a2]);
            uint64_t v31 = *(void *)(a1 + 24);
            uint64_t v32 = *(void *)(v31 + 192);
            if ((*(_DWORD *)v32 & 0x80000000) == 0)
            {
              int v33 = *(_DWORD *)(v32 + 24);
              if (v33)
              {
                uint64_t v51 = 0;
                asprintf(&v51, "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message File %s was closed with %d pending messages]", dword_10002237C, *(const char **)(v31 + 16), v33);
                sub_10000A6C8((uint64_t)v51);
                free(v51);
              }
              uint64_t v34 = *(NSObject **)(v32 + 48);
              if (v34)
              {
                dispatch_source_cancel(v34);
                dispatch_release(*(dispatch_object_t *)(v32 + 48));
                *(void *)(v32 + 48) = 0;
              }
              else
              {
                sub_100009A44("close fd %d\n", v24, v25, v26, v27, v28, v29, v30, *(_DWORD *)v32);
                close(*(_DWORD *)v32);
              }
              *(_DWORD *)uint64_t v32 = -1;
            }
            break;
          case 13:
            sub_100009A44("_act_dst_close: %s ASL DIR %s\n", a2, a3, a4, a5, a6, a7, a8, (char)off_10001CA90[a2]);
            if (v10)
            {
              uint64_t v12 = *(void *)(*(void *)(a1 + 24) + 192);
              if (*(void *)v12)
              {
                if (*(void *)(v12 + 56))
                {
                  dispatch_source_cancel(*(dispatch_source_t *)(v12 + 56));
                  dispatch_release(*(dispatch_object_t *)(v12 + 56));
                }
                else
                {
                  char v35 = fileno(*(FILE **)v12);
                  sub_100009A44("close ASL storedata fd %d\n", v36, v37, v38, v39, v40, v41, v42, v35);
                  fclose(*(FILE **)v12);
                }
                sub_100009A44("_asl_dir_storedata_close %p\n", v13, v14, v15, v16, v17, v18, v19, *(void *)v12);
                *(void *)uint64_t v12 = 0;
              }
            }
            sub_100006F58(a1);
            break;
        }
      }
    }
  }
}

void sub_100006F58(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(v1 + 192);
  if (*(void *)(v2 + 8))
  {
    int v4 = *(_DWORD *)(v2 + 36);
    if (v4)
    {
      uint64_t v14 = 0;
      asprintf(&v14, "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message ASL Store %s was closed with %d pending messages]", dword_10002237C, *(const char **)(v1 + 16), v4);
      sub_10000A6C8((uint64_t)v14);
      free(v14);
    }
    int v5 = *(NSObject **)(v2 + 64);
    if (v5)
    {
      dispatch_source_cancel(v5);
      dispatch_release(*(dispatch_object_t *)(v2 + 64));
      *(void *)(v2 + 64) = 0;
    }
    else
    {
      char v6 = fileno(*(FILE **)(*(void *)(v2 + 8) + 104));
      sub_100009A44("close ASL fd %d\n", v7, v8, v9, v10, v11, v12, v13, v6);
      asl_file_close();
    }
    *(void *)(v2 + 40) = 0;
    *(_DWORD *)(v2 + 48) = 0;
    free(*(void **)(*(void *)(a1 + 24) + 16));
    *(void *)(*(void *)(a1 + 24) + 16) = 0;
    *(void *)(v2 + 8) = 0;
  }
}

uint64_t sub_100007034(uint64_t a1)
{
  memset(&v26, 0, sizeof(v26));
  if (stat(*(const char **)(*(void *)(a1 + 24) + 8), &v26))
  {
    if (*__error() == 2)
    {
      uint64_t result = asl_out_mkpath(qword_100022418, a1);
      if (!result) {
        return result;
      }
      sub_100009A44("_asl_dir_create: asl_out_mkpath failed: %s\n", v10, v11, v12, v13, v14, v15, v16, *(void *)(*(void *)(a1 + 24) + 8));
    }
    else
    {
      uint64_t v17 = __error();
      char v25 = strerror(*v17);
      sub_100009A44("_asl_dir_create: stat error %s\n", v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    if ((v26.st_mode & 0xF000) == 0x4000) {
      return 0;
    }
    sub_100009A44("_asl_dir_create: expected a directory at path %s\n", v2, v3, v4, v5, v6, v7, v8, *(void *)(*(void *)(a1 + 24) + 8));
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100007118(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 24);
  if (!result) {
    return result;
  }
  uint64_t v5 = *(const char **)(result + 16);
  if (v5)
  {
    if (!a2) {
      goto LABEL_9;
    }
  }
  else
  {
    if (!*(void *)(result + 8)) {
      return 0;
    }
    uint64_t v5 = v22;
    asl_dst_make_current_name(result, 0, v22, 0x400uLL);
    uint64_t result = *(void *)(a1 + 24);
    if (!a2) {
      goto LABEL_9;
    }
  }
  if ((*(unsigned char *)(result + 73) & 0x80) == 0)
  {
    int v6 = 0;
    goto LABEL_11;
  }
LABEL_9:
  if (!*(void *)(result + 152)) {
    return 0;
  }
  int v6 = 1;
LABEL_11:
  unint64_t st_size = *(void *)(result + 184);
  if (st_size && *(void *)(result + 176))
  {
    if (!v6) {
      goto LABEL_22;
    }
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    if (stat(v5, &v21) < 0)
    {
      if (*__error() == 2) {
        return 0;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = *(void *)(a1 + 24);
    if (!*(void *)(result + 176))
    {
      __darwin_time_t tv_sec = v21.st_birthtimespec.tv_sec;
      *(void *)(result + 176) = v21.st_birthtimespec.tv_sec;
      if (!tv_sec) {
        *(void *)(result + 176) = v21.st_mtimespec.tv_sec;
      }
    }
    unint64_t st_size = v21.st_size;
    *(void *)(result + 184) = v21.st_size;
    if (!v6) {
      goto LABEL_22;
    }
  }
  if (st_size < *(void *)(result + 152)) {
    return 0;
  }
LABEL_22:
  if (*(unsigned char *)(result + 73))
  {
    sub_100006CD0(a1, 0);
  }
  else
  {
    snprintf((char *)&v21, 0x400uLL, "%s", v5);
    time_t v9 = time(0);
    uint64_t v10 = *(void *)(a1 + 24);
    *(void *)(v10 + 176) = v9;
    asl_dst_make_current_name(v10, 256, (char *)__s2, 0x400uLL);
    sub_100006CD0(a1, 0);
    if (strcmp((const char *)&v21, (const char *)__s2))
    {
      rename((const std::__fs::filesystem::path *)&v21, __s2, v11);
      sub_100009A44("CHECKPOINT RENAME %s %s\n", v12, v13, v14, v15, v16, v17, v18, (char)&v21);
    }
  }
  uint64_t v19 = *(void *)(a1 + 24);
  *(void *)(v19 + 176) = 0;
  *(void *)(v19 + 184) = 0;
  return 1;
}

uint64_t sub_100007314(uint64_t a1)
{
  return sub_100006CD0(*(void *)(a1 + 32), 1);
}

uint64_t sub_100007320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A44("cancel/close ASL file fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));

  return asl_file_close();
}

uint64_t sub_100007370(uint64_t a1)
{
  return sub_100006CD0(*(void *)(a1 + 32), 1);
}

uint64_t sub_10000737C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A44("cancel/close ASL storedata fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));
  time_t v9 = *(FILE **)(a1 + 32);

  return fclose(v9);
}

uint64_t sub_1000073CC(uint64_t a1)
{
  return sub_100006CD0(*(void *)(a1 + 32), 1);
}

uint64_t sub_1000073D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A44("cancel/close ASL file fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));

  return asl_file_close();
}

uint64_t sub_100007428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A44("dispatch_source DISPATCH_VNODE_DELETE fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));
  uint64_t v9 = *(void *)(a1 + 32);

  return sub_100006CD0(v9, 1);
}

uint64_t sub_10000747C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A44("cancel/close file fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 32));
  int v9 = *(_DWORD *)(a1 + 32);

  return close(v9);
}

void sub_1000074CC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 40);
    if (v2)
    {
      if (!*(_DWORD *)(a1 + 16))
      {
        dispatch_resume(v2);
        uint64_t v2 = *(NSObject **)(a1 + 40);
      }
      dispatch_release(v2);
    }
    free(*(void **)(a1 + 32));
    free((void *)a1);
  }
}

void sub_10000752C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000075B0;
  block[3] = &unk_10001CAB8;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)qword_100020040, block);
}

uint64_t sub_1000075B0(uint64_t a1)
{
  sub_1000075F0(*(const char ***)(a1 + 32), *(void *)(a1 + 40));

  return asl_msg_release();
}

void sub_1000075F0(const char **a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a2 + 24);
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 192);
      if (v4)
      {
        int v6 = *(_DWORD *)(v4 + 24);
        if (v6) {
          *(_DWORD *)(v4 + 24) = v6 - 1;
        }
        unsigned int v16 = 0;
        if ((*(unsigned char *)(v3 + 73) & 0x40) == 0)
        {
          time_t v7 = time(0);
          uint64_t v8 = (char *)asl_format_message();
          if ((*(unsigned char *)(*(void *)(a2 + 24) + 72) & 8) == 0)
          {
LABEL_8:
            int v9 = 0;
            goto LABEL_9;
          }
          if (!*(void *)(v4 + 40))
          {
            uint64_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100020040);
            *(void *)(v4 + 40) = v10;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 0x40000000;
            handler[2] = sub_1000078CC;
            handler[3] = &unk_10001CAF8;
            handler[4] = a2;
            dispatch_source_set_event_handler(v10, handler);
          }
          int v9 = 0;
          if ((void)xmmword_100022460 && v8)
          {
            if (!*(void *)(v4 + 32)) {
              goto LABEL_8;
            }
            int v9 = asl_core_string_hash();
            if (*(_DWORD *)(v4 + 20) == v9
              && !strcmp(*(const char **)(v4 + 32), v8 + 16)
              && v7 - *(void *)(v4 + 8) < (unint64_t)xmmword_100022460)
            {
              int v11 = *(_DWORD *)(v4 + 16);
              if (!v11)
              {
                uint64_t v12 = *(NSObject **)(v4 + 40);
                dispatch_time_t v13 = dispatch_time(0, 1000000000 * xmmword_100022460);
                dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
                dispatch_resume(*(dispatch_object_t *)(v4 + 40));
                int v11 = *(_DWORD *)(v4 + 16);
              }
              *(_DWORD *)(v4 + 16) = v11 + 1;
              goto LABEL_11;
            }
          }
LABEL_9:
          if (sub_10000630C(a2))
          {
            sub_1000061E8((char)"_act_file", a1, a2);
LABEL_11:
            free(v8);
            return;
          }
          *(_DWORD *)(*(void *)(a2 + 24) + 76) = 0;
          if (*(_DWORD *)(v4 + 16))
          {
            sub_1000078D4(a2);
            if (v8) {
              goto LABEL_27;
            }
          }
          else
          {
            free(*(void **)(v4 + 32));
            *(void *)(v4 + 32) = 0;
            if (v8)
            {
LABEL_27:
              *(void *)(v4 + 32) = strdup(v8 + 16);
              *(_DWORD *)(v4 + 16) = 0;
              *(_DWORD *)(v4 + 20) = v9;
              *(void *)(v4 + 8) = v7;
              if (v16 >= 2)
              {
                ssize_t v14 = write(*(_DWORD *)v4, v8, v16 - 1);
                if (v14) {
                  *(void *)(*(void *)(a2 + 24) + 184) += v14;
                }
                if (sub_100007118(a2, 0) == 1) {
                  asl_trigger_aslmanager();
                }
              }
              goto LABEL_11;
            }
          }
          *(_DWORD *)(v4 + 16) = 0;
          *(_DWORD *)(v4 + 20) = v9;
          *(void *)(v4 + 8) = v7;
          goto LABEL_11;
        }
        handler[5] = 0;
        asl_msg_lookup();
      }
    }
  }
}

void sub_1000078CC(uint64_t a1)
{
}

void sub_1000078D4(uint64_t a1)
{
  time_t v18 = time(0);
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 24);
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 192);
      if (v3)
      {
        free(*(void **)(v3 + 32));
        *(void *)(v3 + 32) = 0;
        if (*(_DWORD *)(v3 + 16))
        {
          dispatch_suspend(*(dispatch_object_t *)(v3 + 40));
          *(_OWORD *)uint64_t v20 = 0u;
          long long v21 = 0u;
          ctime_r(&v18, v20);
          BYTE3(v21) = 0;
          uint64_t v19 = 0;
          int v4 = *(_DWORD *)(v3 + 16);
          uint64_t v5 = "s";
          if (v4 == 1) {
            uint64_t v5 = (const char *)&unk_100019287;
          }
          asprintf(&v19, "%s --- last message repeated %u time%s ---\n", &v20[4], v4, v5);
          *(_DWORD *)(v3 + 16) = 0;
          int v6 = v19;
          *(void *)(v3 + 8) = v18;
          if (v6)
          {
            int open = *(_DWORD *)v3;
            if ((*(_DWORD *)v3 & 0x80000000) != 0)
            {
              int open = asl_out_dst_file_create_open(*(void *)(a1 + 24), 0);
              *(_DWORD *)uint64_t v3 = open;
              int v6 = v19;
            }
            int v8 = strlen(v6);
            int v9 = write(open, v6, v8);
            free(v19);
            if (v9 < 0 || v9 < v8)
            {
              uint64_t v10 = __error();
              strerror(*v10);
              sub_100009A44("%s: error writing repeat message (%s): %s\n", v11, v12, v13, v14, v15, v16, v17, (char)"asl_action");
            }
          }
        }
      }
    }
  }
}

void sub_100007A5C(int *a1)
{
  if (a1) {
    notify_cancel(*a1);
  }

  free(a1);
}

uint64_t sub_100007A9C(uint64_t a1, uint64_t a2)
{
  asl_msg_fetch();
  uint64_t result = 0;
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

void sub_100007B34(id a1, int a2)
{
}

void sub_100007B3C(int a1)
{
  uint64_t v2 = qword_100022418;
  if (!qword_100022418)
  {
LABEL_13:
    asl_out_module_free(0);
    return;
  }
  while (1)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3) {
      break;
    }
LABEL_12:
    uint64_t v2 = *(void *)(v2 + 24);
    if (!v2) {
      goto LABEL_13;
    }
  }
  while (1)
  {
    int v4 = *(_DWORD *)(v3 + 8);
    if (v4 == 19 || v4 == 18) {
      break;
    }
    if (v4 == 17)
    {
      uint64_t v5 = *(_DWORD **)(v3 + 32);
      if (v5)
      {
        if (*v5 == a1)
        {
          sub_100007C14(v2, v3);
          return;
        }
      }
    }
LABEL_11:
    uint64_t v3 = *(void *)(v3 + 40);
    if (!v3) {
      goto LABEL_12;
    }
  }
  int v6 = *(_DWORD **)(v3 + 32);
  if (!v6 || *v6 != a1) {
    goto LABEL_11;
  }
  time_t v7 = (void *)sub_100007A9C(v2, v3);

  free(v7);
}

void sub_100007C0C(id a1, int a2)
{
}

uint64_t sub_100007C14(uint64_t a1, uint64_t a2)
{
  asl_msg_fetch();
  uint64_t result = 0;
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

void sub_100007CA4(id a1, int a2)
{
}

void sub_100007CAC()
{
  time_t v2 = time(0);
  if (!qword_100020070)
  {
    memset(&v3, 0, sizeof(v3));
    localtime_r(&v2, &v3);
    *(void *)&v3.tm_sec = 0;
    v3.tm_hour = 0;
    ++v3.tm_mday;
    time_t v2 = mktime(&v3);
    when.__darwin_time_t tv_sec = v2;
    when.tv_nsec = 0;
    uint64_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100020040);
    qword_100020070 = (uint64_t)v0;
    dispatch_time_t v1 = dispatch_walltime(&when, 0);
    dispatch_source_set_timer(v0, v1, 0x4E94914F0000uLL, 0);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100020070, &stru_10001CC38);
    dispatch_resume((dispatch_object_t)qword_100020070);
  }
}

void sub_100007D84(id a1)
{
}

void sub_100007D8C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)&xmmword_100022388 + 3, 1u, memory_order_relaxed);
    asl_msg_retain();
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_100007E30;
    v4[3] = &unk_10001CC58;
    v4[4] = a1;
    v4[5] = a2;
    dispatch_async((dispatch_queue_t)qword_100020078, v4);
  }
}

uint64_t sub_100007E30(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    time_t v115 = time(0);
    time_t v2 = (unsigned int *)qword_100020088;
    if (!qword_100020088)
    {
      tm v3 = 0;
      __s = 0;
      goto LABEL_118;
    }
    __s = 0;
    tm v3 = 0;
    while (1)
    {
      unint64_t v4 = *v2;
      if (!v4) {
        goto LABEL_90;
      }
      unint64_t v5 = 0;
      int v6 = 0;
      do
      {
        while (1)
        {
          int v7 = *(_DWORD *)(*((void *)v2 + 6) + 4 * v5);
          if (v7 == -1) {
            goto LABEL_20;
          }
          if (v6 != 1 || v7 < 0) {
            break;
          }
          ++v5;
          int v6 = 1;
          if (v5 >= v4) {
            goto LABEL_27;
          }
        }
        if (!v6 && v7 == -2)
        {
LABEL_19:
          int v6 = 0;
          goto LABEL_20;
        }
        uint64_t val_for_key = (const char *)asl_msg_get_val_for_key();
        int v9 = *(const char **)(*((void *)v2 + 4) + 8 * v5);
        if (!strcmp(v9, "*")
          || (size_t v10 = *(unsigned int *)(*((void *)v2 + 5) + 4 * v5), v10) && !strncasecmp(v9, val_for_key, v10)
          || val_for_key && !strcasecmp(v9, val_for_key))
        {
          if (*(_DWORD *)(*((void *)v2 + 6) + 4 * v5) == -2) {
            goto LABEL_19;
          }
          uint64_t v11 = (const char *)asl_msg_get_val_for_key();
          if (v11)
          {
            int v12 = atoi(v11);
            if ((v12 & 0x80000000) == 0 && v12 <= *(_DWORD *)(*((void *)v2 + 6) + 4 * v5)) {
              int v6 = 1;
            }
          }
        }
LABEL_20:
        ++v5;
        unint64_t v4 = *v2;
      }
      while (v5 < v4);
      if (!v6) {
        goto LABEL_90;
      }
LABEL_27:
      uint64_t v119 = 0;
      int v118 = 0;
      if (v2[4] == -1)
      {
        uint64_t v120 = 0;
        uint64_t v15 = (const char *)*((void *)v2 + 1);
        int v16 = *(unsigned __int8 *)v15;
        if (v16 == 33)
        {
          *((void *)v2 + 2) = 0x5FFFFFFFFLL;
          goto LABEL_28;
        }
        if (v16 != 64)
        {
          if (v16 != 47)
          {
            if (!strcmp(*((const char **)v2 + 1), "*")) {
              *((void *)v2 + 2) = 0x4FFFFFFFFLL;
            }
            else {
              sub_100009A44("%s: unsupported / unknown output name: %s\n", v38, v39, v40, v41, v42, v43, v44, (char)"bsd_out");
            }
            goto LABEL_28;
          }
          int v17 = open(v15, 131593, 420);
          v2[4] = v17;
          if (v17 < 0)
          {
            uint64_t v68 = __error();
            strerror(*v68);
            sub_100009A44("%s: open failed for file: %s (%s)\n", v69, v70, v71, v72, v73, v74, v75, (char)"bsd_out");
            goto LABEL_28;
          }
          v2[5] = 1;
          if (!strcmp(*((const char **)v2 + 1), "/dev/console")) {
            int v18 = 2;
          }
          else {
            int v18 = 1;
          }
LABEL_44:
          v2[5] = v18;
          goto LABEL_28;
        }
        uint64_t v34 = strdup(v15 + 1);
        if (!v34) {
          goto LABEL_28;
        }
        char v35 = v34;
        uint64_t v36 = strrchr(v34, 58);
        if (v36)
        {
          *uint64_t v36 = 0;
          uint64_t v37 = v36 + 1;
        }
        else
        {
          uint64_t v37 = "syslog";
        }
        memset(&v121, 0, sizeof(v121));
        v121.ai_socktype = 2;
        int v86 = getaddrinfo(v35, v37, &v121, &v120);
        free(v35);
        if (v86)
        {
          gai_strerror(v86);
          sub_100009A44("%s: getaddrinfo failed for node %s service %s: (%s)\n", v87, v88, v89, v90, v91, v92, v93, (char)"bsd_out");
          goto LABEL_28;
        }
        uint64_t v94 = v120;
        if (v120)
        {
          while (1)
          {
            int v95 = socket(v94->ai_family, v94->ai_socktype, v94->ai_protocol);
            v2[4] = v95;
            if ((v95 & 0x80000000) == 0) {
              break;
            }
            uint64_t v94 = v94->ai_next;
            if (!v94) {
              goto LABEL_110;
            }
          }
          uint64_t v96 = malloc_type_malloc(v94->ai_addrlen, 0x6EAFFA10uLL);
          *((void *)v2 + 3) = v96;
          if (!v96) {
            goto LABEL_28;
          }
          memcpy(v96, v94->ai_addr, v94->ai_addrlen);
        }
LABEL_110:
        freeaddrinfo(v120);
        int v104 = v2[4];
        if (v104 < 0)
        {
          sub_100009A44("%s: connection failed for %s\n", v97, v98, v99, v100, v101, v102, v103, (char)"bsd_out");
        }
        else
        {
          if ((fcntl(v104, 4, 4) & 0x80000000) == 0)
          {
            int v18 = 3;
            goto LABEL_44;
          }
          close(v2[4]);
          v2[4] = -1;
          uint64_t v105 = __error();
          strerror(*v105);
          sub_100009A44("%s: couldn't set O_NONBLOCK for fd %d: %s\n", v106, v107, v108, v109, v110, v111, v112, (char)"bsd_out");
        }
        free(*((void **)v2 + 3));
        *((void *)v2 + 3) = 0;
      }
LABEL_28:
      if (v2[5] == 5)
      {
        notify_post((const char *)(*((void *)v2 + 1) + 1));
        goto LABEL_90;
      }
      if (v3 || (tm v3 = (char *)asl_format_message()) != 0)
      {
        if ((void)xmmword_100022460 && *((void *)v2 + 10))
        {
          strlen(v3 + 16);
          unsigned int v13 = asl_core_string_hash();
          if (v2[14] != v13 || strcmp(*((const char **)v2 + 10), v3 + 16))
          {
            BOOL v14 = 0;
            goto LABEL_46;
          }
          unint64_t v76 = v115 - *((void *)v2 + 8);
          BOOL v14 = v76 < (unint64_t)xmmword_100022460;
          BOOL v19 = v76 >= (unint64_t)xmmword_100022460;
        }
        else
        {
          BOOL v14 = 0;
          unsigned int v13 = 0;
LABEL_46:
          BOOL v19 = 1;
        }
        unsigned int v20 = v2[5];
        if (__s)
        {
LABEL_48:
          if (v20 == 3)
          {
            long long v21 = (const sockaddr *)*((void *)v2 + 3);
            if (v21)
            {
              size_t v22 = strlen(__s);
              if ((sendto(v2[4], __s, v22, 0, v21, v21->sa_len) & 0x80000000) != 0)
              {
                uint64_t v23 = "%s: error sending message (%s): %s\n";
                goto LABEL_52;
              }
            }
            goto LABEL_87;
          }
LABEL_63:
          size_t v45 = strlen(v3);
          if (v20 - 1 > 1) {
            goto LABEL_87;
          }
          size_t v46 = v45;
          char v47 = !v19;
          if (v20 != 1) {
            char v47 = 1;
          }
          if ((v47 & 1) == 0 && v2[15]) {
            sub_100008ED8((uint64_t)v2);
          }
          uint64_t v48 = (const char *)asl_msg_get_val_for_key();
          if (!v48)
          {
            unsigned int v50 = v2[5];
            goto LABEL_74;
          }
          int v49 = strcmp(v48, "kern");
          unsigned int v50 = v2[5];
          if (v49 || (unsigned int v51 = v46, v50 != 2))
          {
LABEL_74:
            BOOL v52 = v50 == 1;
            char v53 = !v14;
            if (!v52) {
              char v53 = 1;
            }
            if (v53)
            {
              unsigned int v51 = write(v2[4], v3, v46);
            }
            else
            {
              if (!*((void *)v2 + 9))
              {
                mode_t v54 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100020078);
                *((void *)v2 + 9) = v54;
                handler[0] = _NSConcreteStackBlock;
                handler[1] = 0x40000000;
                handler[2] = sub_1000090A0;
                handler[3] = &unk_10001CD78;
                handler[4] = v2;
                dispatch_source_set_event_handler(v54, handler);
              }
              unsigned int v51 = v46;
              if (!v2[15])
              {
                int v55 = *((void *)v2 + 9);
                dispatch_time_t v56 = dispatch_time(0, 1000000000 * xmmword_100022460);
                dispatch_source_set_timer(v55, v56, 0xFFFFFFFFFFFFFFFFLL, 0);
                dispatch_resume(*((dispatch_object_t *)v2 + 9));
                unsigned int v51 = v46;
              }
            }
          }
          if ((v51 & 0x80000000) == 0 && v51 >= v46) {
            goto LABEL_87;
          }
          uint64_t v57 = *((void *)v2 + 1);
          uint64_t v58 = __error();
          uint64_t v114 = strerror(*v58);
          sub_100009A44("%s: error writing message (%s): %s\n", v59, v60, v61, v62, v63, v64, v65, (char)"bsd_out");
          close(v2[4]);
          int v66 = open(*((const char **)v2 + 1), 131593, 420, v57, v114);
          v2[4] = v66;
          if (v66 < 0)
          {
            uint64_t v78 = __error();
            strerror(*v78);
            sub_100009A44("%s: re-open failed for file: %s (%s)\n", v79, v80, v81, v82, v83, v84, v85, (char)"bsd_out");
          }
          else
          {
            unsigned int v67 = write(v66, v3, v46);
            if ((v67 & 0x80000000) != 0)
            {
              uint64_t v23 = "%s: error re-writing message (%s): %s\n";
            }
            else
            {
              uint64_t v23 = "%s: error re-writing message (%s): %s\n";
              if (v67 >= v46) {
                goto LABEL_87;
              }
            }
LABEL_52:
            uint64_t v24 = __error();
            strerror(*v24);
            sub_100009A44(v23, v25, v26, v27, v28, v29, v30, v31, (char)"bsd_out");
LABEL_87:
            if (v14)
            {
              ++v2[15];
            }
            else
            {
              free(*((void **)v2 + 10));
              *((void *)v2 + 10) = 0;
              *((void *)v2 + 10) = strdup(v3 + 16);
              v2[14] = v13;
              v2[15] = 0;
              *((void *)v2 + 8) = v115;
            }
          }
        }
        else
        {
          if (v20 != 3)
          {
            __s = 0;
            goto LABEL_63;
          }
          uint64_t v32 = (const char *)asl_msg_get_val_for_key();
          if (v32) {
            int v33 = atoi(v32);
          }
          else {
            int v33 = 7;
          }
          asl_msg_get_val_for_key();
          int v77 = asl_syslog_faciliy_name_to_num();
          uint64_t v119 = 0;
          asprintf(&v119, "<%d>%s", v77 & ~(v77 >> 31) | v33, v3);
          __s = v119;
          if (v119)
          {
            unsigned int v20 = v2[5];
            goto LABEL_48;
          }
          __s = 0;
        }
      }
LABEL_90:
      time_t v2 = (unsigned int *)*((void *)v2 + 11);
      if (!v2)
      {
LABEL_118:
        free(v3);
        free(__s);
        break;
      }
    }
  }
  uint64_t result = asl_msg_release();
  atomic_fetch_add_explicit((atomic_ullong *volatile)&xmmword_100022388, -*(void *)(a1 + 40), memory_order_relaxed);
  atomic_fetch_add_explicit((atomic_uint *volatile)&xmmword_100022388 + 3, 0xFFFFFFFF, memory_order_relaxed);
  return result;
}

uint64_t sub_1000086C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009A44("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"bsd_out");
  qword_100020088 = 0;
  qword_100020090 = (uint64_t)&qword_100020088;
  int v8 = fopen("/etc/syslog.conf", "r");
  if (v8)
  {
    int v9 = v8;
    line_from_file = get_line_from_file(v8);
    if (line_from_file)
    {
      uint64_t v11 = line_from_file;
      int v49 = v9;
      do
      {
        for (uint64_t i = v11; ; ++i)
        {
          int v13 = *i;
          if (v13 != 9 && v13 != 32) {
            break;
          }
        }
        if (v13 != 35)
        {
          unsigned int v50 = explode(i, "; \t");
          if (v50)
          {
            BOOL v14 = (unsigned int *)malloc_type_calloc(1uLL, 0x68uLL, 0x10B004011DEFA78uLL);
            if (v14)
            {
              uint64_t v15 = v14;
              int v16 = -1;
              v14[4] = -1;
              int v17 = *(unsigned char **)v50;
              if (*(void *)v50)
              {
                uint64_t v18 = 0;
                do
                {
                  if (*v17) {
                    int v16 = v18;
                  }
                  int v17 = *(unsigned char **)&v50[8 * v18++ + 8];
                }
                while (v17);
              }
              BOOL v19 = strdup(*(const char **)&v50[8 * v16]);
              *((void *)v15 + 1) = v19;
              if (v19)
              {
                unsigned int v20 = (void **)v50;
                if (v16 >= 1)
                {
                  uint64_t v21 = 0;
                  uint64_t v48 = v16;
                  do
                  {
                    size_t v22 = (char *)v20[v21];
                    if (*v22)
                    {
                      uint64_t v23 = explode(v22, ",.");
                      uint64_t v24 = (void **)v23;
                      uint64_t v25 = *(unsigned char **)v23;
                      if (*(void *)v23)
                      {
                        uint64_t v26 = 0;
                        LODWORD(v27) = -1;
                        do
                        {
                          if (*v25) {
                            uint64_t v27 = v26;
                          }
                          else {
                            uint64_t v27 = v27;
                          }
                          uint64_t v25 = *(unsigned char **)&v23[8 * v26++ + 8];
                        }
                        while (v25);
                        if ((int)v27 >= 1)
                        {
                          uint64_t v28 = (const char **)v23;
                          for (uint64_t j = v27; j; --j)
                          {
                            if (!**v28) {
                              goto LABEL_71;
                            }
                            uint64_t v30 = (const char *)v24[v27];
                            if (!v30) {
                              goto LABEL_71;
                            }
                            if (!strcasecmp((const char *)v24[v27], "emerg") || !strcasecmp(v30, "panic"))
                            {
                              int v51 = 0;
                            }
                            else
                            {
                              if (!strcasecmp(v30, "alert"))
                              {
                                int v31 = 1;
                              }
                              else if (!strcasecmp(v30, "crit"))
                              {
                                int v31 = 2;
                              }
                              else if (!strcasecmp(v30, "err") || !strcasecmp(v30, "error"))
                              {
                                int v31 = 3;
                              }
                              else if (!strcasecmp(v30, "warn") || !strcasecmp(v30, "warning"))
                              {
                                int v31 = 4;
                              }
                              else if (!strcasecmp(v30, "notice"))
                              {
                                int v31 = 5;
                              }
                              else if (!strcasecmp(v30, "info"))
                              {
                                int v31 = 6;
                              }
                              else if (!strcasecmp(v30, "debug") || !strcmp(v30, "*"))
                              {
                                int v31 = 7;
                              }
                              else
                              {
                                if (strcasecmp(v30, "none")) {
                                  goto LABEL_71;
                                }
                                int v31 = -2;
                              }
                              int v51 = v31;
                            }
                            if (*v15)
                            {
                              *((void *)v15 + 4) = reallocf(*((void **)v15 + 4), 8 * (*v15 + 1));
                              *((void *)v15 + 5) = reallocf(*((void **)v15 + 5), 4 * (*v15 + 1));
                              uint64_t v32 = reallocf(*((void **)v15 + 6), 4 * (*v15 + 1));
                            }
                            else
                            {
                              *((void *)v15 + 4) = malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL);
                              *((void *)v15 + 5) = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
                              uint64_t v32 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
                            }
                            *((void *)v15 + 6) = v32;
                            if (!*((void *)v15 + 4) || !*((void *)v15 + 5) || !v32) {
                              goto LABEL_79;
                            }
                            int v33 = *v28;
                            if (*v28 && (unsigned int v34 = strlen(*v28), (v35 = v34) != 0))
                            {
                              int v36 = *(unsigned __int8 *)v33;
                              if (v36 == 39 || v36 == 34)
                              {
                                if ((++v33)[v34 - 2] == v36) {
                                  int v37 = -2;
                                }
                                else {
                                  int v37 = -1;
                                }
                                unsigned int v35 = v37 + v34;
                              }
                              uint64_t v38 = malloc_type_calloc(1uLL, v35 + 1, 0xC1ED50EAuLL);
                              uint64_t v39 = v38;
                              if (v38) {
                                memcpy(v38, v33, v35);
                              }
                            }
                            else
                            {
                              uint64_t v39 = 0;
                            }
                            uint64_t v40 = *v15;
                            *(void *)(*((void *)v15 + 4) + 8 * v40) = v39;
                            uint64_t v41 = *((void *)v15 + 4);
                            if (!*(void *)(v41 + 8 * v40)) {
                              goto LABEL_79;
                            }
                            uint64_t v42 = *((void *)v15 + 5);
                            *(_DWORD *)(v42 + 4 * v40) = 0;
                            uint64_t v43 = *v15;
                            uint64_t v44 = *(char **)(v41 + 8 * v43);
                            size_t v45 = strchr(v44, 42);
                            if (v45)
                            {
                              *(_DWORD *)(v42 + 4 * v43) = v45 - v44;
                              uint64_t v43 = *v15;
                            }
                            *(_DWORD *)(*((void *)v15 + 6) + 4 * v43) = v51;
                            ++*v15;
LABEL_71:
                            ++v28;
                          }
                        }
                      }
                      free_string_list(v24);
                      unsigned int v20 = (void **)v50;
                    }
                    ++v21;
                  }
                  while (v21 != v48);
                }
                free_string_list(v20);
                *((void *)v15 + 11) = 0;
                size_t v46 = (void *)qword_100020090;
                *((void *)v15 + 12) = qword_100020090;
                *size_t v46 = v15;
                qword_100020090 = (uint64_t)(v15 + 22);
              }
            }
          }
        }
LABEL_79:
        free(v11);
        int v9 = v49;
        uint64_t v11 = get_line_from_file(v49);
      }
      while (v11);
    }
    fclose(v9);
  }
  if (qword_100020080 != -1) {
    dispatch_once(&qword_100020080, &stru_10001CC98);
  }
  return 0;
}

void sub_100008C04(id a1)
{
  qword_100020078 = (uint64_t)dispatch_queue_create("BSD Out Queue", 0);
  qword_100020098 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100020078);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100020098, &stru_10001CCD8);
  dispatch_time_t v1 = qword_100020098;
  dispatch_time_t v2 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v1, v2, 0x45D964B800uLL, 0);
  tm v3 = qword_100020098;

  dispatch_resume(v3);
}

void sub_100008CAC(id a1)
{
  time_t v1 = time(0);
  uint64_t v2 = qword_100020088;
  if (qword_100020088)
  {
    time_t v3 = v1;
    do
    {
      if (*(_DWORD *)(v2 + 20) == 1 && !*(_DWORD *)(v2 + 60) && (unint64_t)(v3 - *(void *)(v2 + 64)) >= 0x12D)
      {
        unint64_t v4 = *(void **)(v2 + 24);
        if (!v4
          || (free(v4), *(void *)(v2 + 24) = 0, int v5 = *(_DWORD *)(v2 + 20), (v5 - 1) < 2)
          || v5 == 3)
        {
          int v6 = *(_DWORD *)(v2 + 16);
          if ((v6 & 0x80000000) == 0) {
            close(v6);
          }
          *(_DWORD *)(v2 + 16) = -1;
        }
      }
      uint64_t v2 = *(void *)(v2 + 88);
    }
    while (v2);
  }
}

uint64_t sub_100008D54()
{
  return 0;
}

void sub_100008D84()
{
  uint64_t v0 = (unsigned int *)qword_100020088;
  if (qword_100020088)
  {
    do
    {
      time_t v1 = (unsigned int *)*((void *)v0 + 11);
      uint64_t v2 = *((void *)v0 + 9);
      if (v2)
      {
        if (v0[15])
        {
          sub_100008ED8((uint64_t)v0);
          uint64_t v2 = *((void *)v0 + 9);
        }
        dispatch_source_cancel(v2);
        dispatch_resume(*((dispatch_object_t *)v0 + 9));
        dispatch_release(*((dispatch_object_t *)v0 + 9));
      }
      free(*((void **)v0 + 1));
      free(*((void **)v0 + 3));
      free(*((void **)v0 + 10));
      free(*((void **)v0 + 5));
      free(*((void **)v0 + 6));
      int v3 = v0[4];
      if ((v3 & 0x80000000) == 0) {
        close(v3);
      }
      unint64_t v4 = (void *)*((void *)v0 + 4);
      if (v4)
      {
        if (*v0)
        {
          unint64_t v5 = 0;
          do
            free(*(void **)(*((void *)v0 + 4) + 8 * v5++));
          while (v5 < *v0);
          unint64_t v4 = (void *)*((void *)v0 + 4);
        }
        free(v4);
      }
      uint64_t v6 = *((void *)v0 + 11);
      int v7 = (void *)*((void *)v0 + 12);
      if (v6)
      {
        *(void *)(v6 + 96) = v7;
        int v7 = (void *)*((void *)v0 + 12);
      }
      else
      {
        qword_100020090 = *((void *)v0 + 12);
      }
      *int v7 = v6;
      free(v0);
      uint64_t v0 = v1;
    }
    while (v1);
  }
}

uint64_t sub_100008E84()
{
  return 0;
}

void sub_100008EB0(id a1)
{
  sub_100008D84();

  sub_1000086C4(v1, v2, v3, v4, v5, v6, v7, v8);
}

void sub_100008ED8(uint64_t a1)
{
  if (a1 && *(_DWORD *)(a1 + 20) == 1 && *(_DWORD *)(a1 + 60))
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 72));
    time_t v27 = time(0);
    *(_OWORD *)uint64_t v29 = 0u;
    long long v30 = 0u;
    ctime_r(&v27, v29);
    BYTE3(v30) = 0;
    __s = 0;
    int v2 = *(_DWORD *)(a1 + 60);
    uint64_t v3 = "s";
    if (v2 == 1) {
      uint64_t v3 = (const char *)&unk_100019287;
    }
    asprintf(&__s, "%s: --- last message repeated %u time%s ---\n", &v29[4], v2, v3);
    *(_DWORD *)(a1 + 60) = 0;
    if (__s)
    {
      int v4 = strlen(__s);
      int v5 = write(*(_DWORD *)(a1 + 16), __s, v4);
      if ((v5 & 0x80000000) == 0 && v5 >= v4) {
        goto LABEL_15;
      }
      uint64_t v6 = *(void *)(a1 + 8);
      uint64_t v7 = __error();
      uint64_t v26 = strerror(*v7);
      sub_100009A44("%s: error writing repeat message (%s): %s\n", v8, v9, v10, v11, v12, v13, v14, (char)"bsd_out");
      close(*(_DWORD *)(a1 + 16));
      int v15 = open(*(const char **)(a1 + 8), 131593, 420, v6, v26);
      *(_DWORD *)(a1 + 16) = v15;
      if (v15 < 0)
      {
        int v17 = "%s: re-open failed for file: %s (%s)\n";
      }
      else
      {
        int v16 = write(v15, __s, v4);
        int v17 = "%s: error re-writing message (%s): %s\n";
        if ((v16 & 0x80000000) == 0 && v16 >= v4) {
          goto LABEL_15;
        }
      }
      uint64_t v18 = __error();
      strerror(*v18);
      sub_100009A44(v17, v19, v20, v21, v22, v23, v24, v25, (char)"bsd_out");
LABEL_15:
      free(__s);
    }
  }
}

void sub_1000090A0(uint64_t a1)
{
}

uint64_t sub_1000090A8()
{
  _os_nospin_lock_lock();
  ++dword_10002234C;

  return _os_nospin_lock_unlock();
}

uint64_t sub_1000090FC()
{
  _os_nospin_lock_lock();
  if (dword_10002234C >= 1) {
    --dword_10002234C;
  }

  return _os_nospin_lock_unlock();
}

uint64_t sub_10000914C()
{
  _os_nospin_lock_lock();
  dword_10002237C = getpid();
  DWORD2(xmmword_100022428) = 0;
  free((void *)qword_100022438);
  qword_100022438 = 0;
  LODWORD(xmmword_100022408) = 1;
  xmmword_100022448 = xmmword_100018710;
  qword_100022458 = 0x1388000001F4;
  xmmword_100022460 = xmmword_100018720;
  qword_100022480 = 3072000;
  xmmword_100022470 = xmmword_100018730;
  qword_100022418 = (uint64_t)asl_out_module_init();
  uint64_t result = _os_nospin_lock_unlock();
  if (qword_100022418)
  {
    for (uint64_t i = *(void *)(qword_100022418 + 16); i; uint64_t i = *(void *)(i + 40))
    {
      if (*(_DWORD *)(i + 8) == 1 && !*(void *)i)
      {
        int v2 = *(char **)(i + 16);
        uint64_t result = strncmp(v2, "debug", 5uLL);
        if (!result) {
          uint64_t result = sub_10000924C(v2, 1);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000924C(char *a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *a1;
  if (*a1)
  {
    if (v2 == 61) {
      ++a1;
    }
    while (1)
    {
      int v4 = *a1;
      if (v4 != 32 && v4 != 9) {
        break;
      }
      ++a1;
    }
    uint64_t v6 = (const char **)explode(a1, " \t");
    if (v6)
    {
      uint64_t v7 = v6;
      unsigned int v8 = -1;
      do
        ++v8;
      while (v6[v8]);
      if (!v8) {
        goto LABEL_17;
      }
      uint64_t v9 = *v6;
      if (!strcasecmp(*v6, "debug"))
      {
        if (v8 == 1)
        {
          int v10 = a2;
          uint64_t v11 = 0;
        }
        else
        {
          int v16 = v7[1];
          int v10 = strcmp(v16, "0");
          if (v10)
          {
            if (!strcmp(v16, "1"))
            {
              uint64_t v11 = v7[2];
              int v10 = 1;
            }
            else
            {
              int v10 = a2;
              uint64_t v11 = v16;
            }
          }
          else
          {
            uint64_t v11 = v7[2];
          }
        }
        sub_10000FFE0(v10, v11);
        goto LABEL_80;
      }
      if (v8 == 1)
      {
LABEL_17:
        uint64_t v2 = 0xFFFFFFFFLL;
LABEL_81:
        free_string_list((void **)v7);
        return v2;
      }
      if (!strcasecmp(v9, "hostname"))
      {
        _os_nospin_lock_lock();
        if (a2)
        {
          int v17 = strdup(v7[1]);
        }
        else
        {
          free((void *)qword_100022440);
          int v17 = 0;
        }
        qword_100022440 = (uint64_t)v17;
      }
      else if (!strcasecmp(v9, "mark_time"))
      {
        _os_nospin_lock_lock();
        if (a2) {
          uint64_t v18 = atoll(v7[1]);
        }
        else {
          uint64_t v18 = 0;
        }
        *((void *)&xmmword_100022460 + 1) = v18;
      }
      else if (!strcasecmp(v9, "dup_delay"))
      {
        _os_nospin_lock_lock();
        if (a2) {
          uint64_t v19 = atoll(v7[1]);
        }
        else {
          uint64_t v19 = 30;
        }
        *(void *)&xmmword_100022460 = v19;
      }
      else if (!strcasecmp(v9, "remote_delay"))
      {
        _os_nospin_lock_lock();
        if (a2) {
          int v20 = atol(v7[1]);
        }
        else {
          int v20 = 5000;
        }
        HIDWORD(qword_100022458) = v20;
      }
      else if (!strcasecmp(v9, "utmp_ttl"))
      {
        _os_nospin_lock_lock();
        if (a2) {
          uint64_t v21 = atoll(v7[1]);
        }
        else {
          uint64_t v21 = 31622400;
        }
        *(void *)&xmmword_100022470 = v21;
      }
      else if (!strcasecmp(v9, "mps_limit"))
      {
        _os_nospin_lock_lock();
        if (a2) {
          int v22 = atol(v7[1]);
        }
        else {
          int v22 = 500;
        }
        LODWORD(qword_100022458) = v22;
      }
      else if (!strcasecmp(v9, "memory_max"))
      {
        _os_nospin_lock_lock();
        if (a2) {
          uint64_t v23 = atoll(v7[1]);
        }
        else {
          uint64_t v23 = 3072000;
        }
        qword_100022480 = v23;
      }
      else
      {
        if (strcasecmp(v9, "stats_interval"))
        {
          if (!strcasecmp(v9, "max_file_size"))
          {
            pthread_mutex_lock((pthread_mutex_t *)qword_100022398);
            if (xmmword_100022448)
            {
              asl_store_close();
              *(void *)&xmmword_1000223E8 = 0;
              if (a2) {
                int v25 = atoi(v7[1]);
              }
              else {
                int v25 = 25600000;
              }
              DWORD1(xmmword_100022448) = v25;
            }
            pthread_mutex_unlock((pthread_mutex_t *)qword_100022398);
            goto LABEL_80;
          }
          if (!strcasecmp(v9, "db") || !strcasecmp(v9, "database") || !strcasecmp(v9, "datastore"))
          {
            if (!a2)
            {
              int v27 = 2;
              int v28 = 25600000;
              int v29 = 256;
              int v30 = 1024000;
LABEL_121:
              sub_100010058(v27, v28, v29, v30);
              goto LABEL_80;
            }
            uint64_t v12 = v7[1];
            if (*(unsigned __int8 *)v12 - 48 <= 9)
            {
              int v13 = atoi(v7[1]);
              if (v8 < 3)
              {
                int v32 = 0;
                int v33 = 0;
                goto LABEL_113;
              }
              uint64_t v14 = v7[2];
              if (!strcmp(v14, "-")) {
                int v15 = 0;
              }
              else {
                int v15 = atoi(v14);
              }
              if (v8 < 4)
              {
                int v33 = 0;
                int v32 = 0;
              }
              else
              {
                unsigned int v35 = v7[3];
                if (!strcmp(v35, "-")) {
                  int v37 = 0;
                }
                else {
                  int v37 = atoi(v35);
                }
                if (v8 < 5)
                {
                  int v32 = 0;
                }
                else
                {
                  int v36 = v7[4];
                  int v32 = strcmp(v36, "-");
                  if (v32) {
                    int v32 = atoi(v36);
                  }
                }
                int v33 = v37;
              }
LABEL_112:
              int v28 = v15;
              if (v15)
              {
LABEL_114:
                if (v33) {
                  int v29 = v33;
                }
                else {
                  int v29 = DWORD2(xmmword_100022448);
                }
                if (v32) {
                  int v30 = v32;
                }
                else {
                  int v30 = HIDWORD(xmmword_100022448);
                }
                int v27 = v13;
                goto LABEL_121;
              }
LABEL_113:
              int v28 = DWORD1(xmmword_100022448);
              goto LABEL_114;
            }
            if (!strcasecmp(v7[1], "file"))
            {
              if (v8 < 3)
              {
                int v32 = 0;
              }
              else
              {
                unsigned int v34 = v7[2];
                int v32 = strcmp(v34, "-");
                if (v32)
                {
                  int v15 = atoi(v34);
                  int v33 = 0;
                  int v32 = 0;
                  int v13 = 1;
                  goto LABEL_112;
                }
              }
              int v33 = 0;
              int v13 = 1;
              goto LABEL_113;
            }
            if (strncasecmp(v12, "mem", 3uLL)) {
              goto LABEL_17;
            }
            if (v8 < 3)
            {
              int v32 = 0;
            }
            else
            {
              int v31 = v7[2];
              int v32 = strcmp(v31, "-");
              if (v32)
              {
                int v33 = atoi(v31);
                int v32 = 0;
LABEL_105:
                int v13 = 2;
                goto LABEL_113;
              }
            }
            int v33 = 0;
            goto LABEL_105;
          }
LABEL_80:
          uint64_t v2 = 0;
          goto LABEL_81;
        }
        _os_nospin_lock_lock();
        if (a2) {
          uint64_t v24 = atoll(v7[1]);
        }
        else {
          uint64_t v24 = 600;
        }
        *((void *)&xmmword_100022470 + 1) = v24;
      }
      _os_nospin_lock_unlock();
      goto LABEL_80;
    }
    return 0xFFFFFFFFLL;
  }
  return v2;
}

void sub_100009814(uint64_t a1, int a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    int v4 = asl_check_option(a1, "control");
    BOOL v12 = v4 != 0;
    if (v4 || byte_1000200A4 != 1) {
      goto LABEL_9;
    }
    if (qword_100022480 >= 0) {
      uint64_t v13 = qword_100022480;
    }
    else {
      uint64_t v13 = qword_100022480 + 1;
    }
    if ((uint64_t)xmmword_100022388 < v13 >> 1)
    {
      sub_100009A44("Work queue re-enabled at 1/2 max.  size %lld  max %lld\n", v5, v6, v7, v8, v9, v10, v11, xmmword_100022388);
      byte_1000200A4 = 0;
LABEL_9:
      uint64_t v14 = os_transaction_create();
      unint64_t v15 = 0;
      uint64_t v16 = v3;
      do
      {
        uint64_t v17 = *(void *)(v16 + 16);
        uint64_t v16 = *(void *)(v16 + 24);
        v15 += v17;
      }
      while (v16);
      if ((uint64_t)(xmmword_100022388 + v15) >= qword_100022480)
      {
        byte_1000200A4 = 1;
        asl_msg_release();
        sub_100009A44("Work queue disabled.  msize %lld  size %lld  max %lld\n", v18, v19, v20, v21, v22, v23, v24, v15);
        snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 2] [PID %u] [Message Internal memory size limit %lld exceeded - dropping messages] [UID 0] [UID 0] [Facility syslog]", dword_10002237C, qword_100022480);
        uint64_t v3 = asl_msg_from_string();
      }
      atomic_fetch_add_explicit((atomic_ullong *volatile)&xmmword_100022388, v15, memory_order_relaxed);
      atomic_fetch_add_explicit(&dword_100022380, 1u, memory_order_relaxed);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_100009B28;
      block[3] = &unk_10001CDD8;
      int v27 = a2;
      BOOL v28 = v12;
      void block[4] = v3;
      block[5] = v15;
      void block[6] = v14;
      dispatch_async((dispatch_queue_t)qword_1000223D0, block);
      return;
    }
    sub_100009A44("Work queue draining: dropped message.\n", v5, v6, v7, v8, v9, v10, v11, v25);
    asl_msg_release();
  }
}

uint64_t sub_100009A44(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (DWORD2(xmmword_100022428))
  {
    uint64_t v10 = qword_100022438 ? (const char *)qword_100022438 : "/var/log/syslogd.log";
    uint64_t v11 = fopen(v10, "a");
    if (v11)
    {
      BOOL v12 = v11;
      fprintf(v11, "W %d %llu", dword_100022380, (void)xmmword_100022388);
      if (*((void *)&xmmword_1000223E8 + 1)) {
        fprintf(v12, "   M %u %u %lu", *(_DWORD *)(*((void *)&xmmword_1000223E8 + 1) + 28), *(_DWORD *)(*((void *)&xmmword_1000223E8 + 1) + 24), *(void *)(*((void *)&xmmword_1000223E8 + 1) + 48));
      }
      fwrite(" ; ", 3uLL, 1uLL, v12);
      vfprintf(v12, a1, &a9);
      fclose(v12);
    }
  }
  return 0;
}

void sub_100009B28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_64;
  }
  int v3 = *(_DWORD *)(a1 + 56);
  time_t v4 = time(0);
  uint64_t val_for_key = (const char *)asl_msg_get_val_for_key();
  if (val_for_key)
  {
    int v6 = atoi(val_for_key);
    if (v6 == 1)
    {
      uint64_t v7 = (const char *)asl_msg_get_val_for_key();
      if (v7) {
        int v8 = atoi(v7);
      }
      else {
        int v8 = 1;
      }
      uint64_t v9 = (const char *)asl_msg_get_val_for_key();
    }
    else
    {
      int v8 = v6;
      uint64_t v9 = 0;
    }
  }
  else
  {
    asl_msg_set_key_val();
    uint64_t v9 = 0;
    int v8 = 0;
  }
  memset(out, 0, 37);
  *(_OWORD *)uuid_t uu = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v65 = 0;
  uint64_t v10 = (unsigned __int8 *)asl_msg_get_val_for_key();
  if (v3 == 4) {
    unsigned int v11 = 5;
  }
  else {
    unsigned int v11 = 7;
  }
  if (v10)
  {
    if (!v10[1])
    {
      int v12 = *v10;
      if ((v12 & 0xF8) == 0x30) {
        unsigned int v11 = v12 - 48;
      }
    }
  }
  snprintf(__str, 0x40uLL, "%d", v11);
  asl_msg_set_key_val();
  if (!v8 && qword_100022458 && !HIDWORD(xmmword_100022368))
  {
    if (qword_1000200A8 == v4)
    {
      unsigned int v13 = dword_1000200B4;
    }
    else
    {
      dword_1000200B0 = qword_100022458;
      unsigned int v13 = 7;
      dword_1000200B4 = 7;
      qword_1000200A8 = v4;
    }
    if (v13 > v11) {
      dword_1000200B4 = v11;
    }
    int v14 = dword_1000200B0;
    if (dword_1000200B0 >= 1)
    {
      --dword_1000200B0;
      if (v14 != 1) {
        goto LABEL_34;
      }
      goto LABEL_32;
    }
    if ((dword_1000200B0 & 0x80000000) == 0)
    {
LABEL_32:
      dword_1000200B0 = -1;
      v69[0] = 0;
      asprintf(v69, "*** kernel exceeded %d log message per second limit  -  remaining messages this second discarded ***", qword_100022458);
      if (v69[0])
      {
        asl_msg_set_key_val();
        free(v69[0]);
        v68[0] = dword_1000200B4 + 48;
        v68[1] = 0;
        asl_msg_set_key_val();
      }
      goto LABEL_34;
    }
LABEL_64:
    atomic_fetch_add_explicit((atomic_ullong *volatile)&xmmword_100022388, -*(void *)(a1 + 40), memory_order_relaxed);
    goto LABEL_146;
  }
  if (v8)
  {
    uuid_clear(uu);
    if (proc_pidinfo(v8, 17, 1uLL, uu, 56) == 56)
    {
      uuid_unparse(uu, out);
      asl_msg_set_key_val();
    }
  }
LABEL_34:
  uint64_t v15 = asl_msg_get_val_for_key();
  if (v15) {
    uint64_t v15 = asl_core_parse_time();
  }
  if (v15 > v4 || v15 == 0) {
    time_t v17 = v4;
  }
  else {
    time_t v17 = v15;
  }
  snprintf(__str, 0x3FuLL, "%llu", v17);
  asl_msg_set_key_val();
  if (!asl_msg_get_val_for_key())
  {
    if (!qword_100022440)
    {
      if (qword_1000200B8 != -1) {
        dispatch_once(&qword_1000200B8, &stru_10001CE18);
      }
      LODWORD(v69[0]) = 1;
      if (dword_100020028 < 0 || (uint32_t v24 = notify_check(dword_100020028, (int *)v69), v24 | LODWORD(v69[0])))
      {
        if (gethostname((char *)&qword_1000200C0, 0x100uLL) < 0)
        {
          strcpy((char *)&qword_1000200C0, "localhost");
        }
        else
        {
          uint64_t v26 = strchr((char *)&qword_1000200C0, 46);
          if (v26) {
            char *v26 = 0;
          }
        }
      }
    }
    asl_msg_set_key_val();
  }
  uint64_t v60 = v4;
  uint64_t v18 = (const char *)asl_msg_get_val_for_key();
  if (!v18)
  {
LABEL_48:
    asl_msg_set_key_val();
    int v20 = -2;
    goto LABEL_49;
  }
  uint64_t v19 = v18;
  int v20 = atoi(v18);
  if (!v20)
  {
    if (!strcmp(v19, "0"))
    {
      int v20 = 0;
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  uint64_t v21 = (const char *)asl_msg_get_val_for_key();
  if (!v21) {
    goto LABEL_52;
  }
  uint64_t v22 = v21;
  int v23 = atoi(v21);
  if (v23) {
    goto LABEL_53;
  }
  if (!strcmp(v22, "0"))
  {
    int v23 = 0;
  }
  else
  {
LABEL_52:
    asl_msg_set_key_val();
    int v23 = -2;
  }
LABEL_53:
  if ((v3 - 5) >= 2)
  {
    if (v3 == 4 || v3 == 1)
    {
      asl_msg_set_key_val();
      int v20 = 0;
LABEL_57:
      asl_msg_set_key_val();
      goto LABEL_58;
    }
    if (!v20)
    {
      asl_msg_set_key_val();
      int v20 = -2;
    }
    if (v23 == 80 || !v23) {
      goto LABEL_57;
    }
  }
LABEL_58:
  if (!v9)
  {
    uint64_t v9 = (const char *)asl_msg_get_val_for_key();
    if (!v9)
    {
      if (v3 == 4)
      {
        char v25 = "kernel";
      }
      else
      {
        if (v3 != 1)
        {
LABEL_78:
          uint64_t v9 = 0;
LABEL_86:
          asl_msg_set_key_val();
          goto LABEL_87;
        }
        char v25 = "syslogd";
      }
      uint64_t v9 = v25;
      goto LABEL_86;
    }
  }
  if (v3 != 4 && v20 && !strcmp(v9, "kernel")) {
    goto LABEL_78;
  }
LABEL_87:
  uint64_t v27 = asl_msg_get_val_for_key();
  if (!v27)
  {
    if (v3 == 4) {
      BOOL v28 = "kern";
    }
    else {
      BOOL v28 = "user";
    }
    goto LABEL_99;
  }
  BOOL v28 = (const char *)v27;
  if (*(unsigned char *)v27 == 35)
  {
    int v29 = (const char *)(v27 + 1);
    if (*(unsigned __int8 *)(v27 + 1) - 48 <= 9 && !(8 * atoi(v29))) {
      strcmp(v29, "0");
    }
    BOOL v28 = (const char *)asl_syslog_faciliy_num_to_name();
    goto LABEL_99;
  }
  int v30 = strncmp((const char *)v27, "com.apple.system", 0x10uLL);
  if (v20 && !v30) {
LABEL_99:
  }
    asl_msg_set_key_val();
  if (v3 == 4)
  {
    asl_msg_set_key_val();
LABEL_103:
    asl_msg_set_key_val();
    goto LABEL_104;
  }
  uint64_t v31 = asl_msg_get_val_for_key();
  if (!(v31 | asl_msg_get_val_for_key())) {
    goto LABEL_103;
  }
LABEL_104:
  if (!strcmp(v28, "com.apple.system.utmpx") || !strcmp(v28, "com.apple.system.lastlog"))
  {
    snprintf(__str, 0x40uLL, "%llu", (void)xmmword_100022470 + v17);
    asl_msg_set_key_val();
  }
  if (v3 == 4 && v11 <= 3)
  {
    sub_10000BC98(v2);
    goto LABEL_112;
  }
  if (v3 != 1)
  {
    unsigned int v11 = -1;
LABEL_112:
    __s1 = (char *)v9;
    if (*((void *)&xmmword_100022470 + 1))
    {
      int v32 = (unsigned int *)xmmword_100022428;
      if (v60 - qword_100022420 >= *((uint64_t *)&xmmword_100022470 + 1) && (void)xmmword_100022428)
      {
        uint64_t v33 = asl_msg_new();
        if (v33)
        {
          unsigned int v58 = v11;
          asl_msg_set_key_val();
          asl_msg_set_key_val();
          asl_msg_set_key_val();
          snprintf((char *)v69, 0x40uLL, "%d", dword_10002237C);
          asl_msg_set_key_val();
          snprintf((char *)v69, 0x40uLL, "%d", 5);
          asl_msg_set_key_val();
          snprintf((char *)v69, 0x40uLL, "%u", *v32);
          asl_msg_set_key_val();
          snprintf((char *)v69, 0x40uLL, "%u", v32[1]);
          asl_msg_set_key_val();
          unint64_t v34 = v32[2];
          if (v34)
          {
            for (unint64_t i = 0; i < v34; ++i)
            {
              int v36 = *(void ***)(*((void *)v32 + 2) + 8 * i);
              if (v36)
              {
                do
                {
                  uint64_t v61 = 0;
                  int v37 = (void **)v36[3];
                  snprintf(v68, 0x40uLL, "%llu %llu", v36[1], v36[2]);
                  asprintf(&v61, "*%s", (const char *)*v36);
                  if (v61)
                  {
                    asl_msg_set_key_val();
                    uint64_t v38 = v61;
                  }
                  else
                  {
                    uint64_t v38 = 0;
                  }
                  free(v38);
                  free(*v36);
                  free(v36);
                  int v36 = v37;
                }
                while (v37);
                unint64_t v34 = v32[2];
              }
            }
          }
          free(*((void **)v32 + 2));
          free(v32);
          unsigned int v11 = v58;
        }
        sub_100009814(v33, 1);
        qword_100022420 = v60;
        *(void *)&xmmword_100022428 = 0;
        goto LABEL_129;
      }
    }
    else
    {
      int v32 = (unsigned int *)xmmword_100022428;
    }
    if (v32)
    {
LABEL_134:
      uint64_t v42 = 0;
      uint64_t v43 = v2;
      do
      {
        uint64_t v44 = *(void *)(v43 + 16);
        uint64_t v43 = *(void *)(v43 + 24);
        v42 += v44;
      }
      while (v43);
      uint64_t v45 = asl_msg_get_val_for_key();
      uint64_t v46 = xmmword_100022428;
      ++*(_DWORD *)xmmword_100022428;
      if (v45) {
        ++*(_DWORD *)(v46 + 4);
      }
      sub_10000AEA8(v46, "*", v42);
      sub_10000AEA8(xmmword_100022428, __s1, v42);
      if (*(_DWORD *)(a1 + 56) == 4 && (v11 & 0x80000000) == 0)
      {
        char v47 = off_10001CD98[v11];
        if ((dword_100020008[v11] & 0x80000000) != 0)
        {
          int v48 = notify_register_plain();
          if (v48) {
            sub_100009A44("notify_register_plain(%s) failed status %u\n", v49, v50, v51, v52, v53, v54, v55, v48);
          }
        }
        notify_post(v47);
      }
      goto LABEL_144;
    }
LABEL_129:
    uint64_t v39 = malloc_type_malloc(0x18uLL, 0x1080040216EE090uLL);
    uint64_t v40 = v39;
    if (v39)
    {
      *((_DWORD *)v39 + 2) = 256;
      uint64_t v41 = malloc_type_calloc(0x100uLL, 8uLL, 0x2004093837F09uLL);
      v40[2] = v41;
      if (v41)
      {
        *uint64_t v40 = 0;
      }
      else
      {
        free(v40);
        uint64_t v40 = 0;
      }
    }
    *(void *)&xmmword_100022428 = v40;
    goto LABEL_134;
  }
LABEL_144:
  if (!v20)
  {
    if (*(unsigned char *)(a1 + 60))
    {
      dispatch_time_t v56 = (const char *)asl_msg_get_val_for_key();
      if (v56)
      {
        uint64_t v57 = (char *)v56;
        if (!strncmp(v56, "= reset", 7uLL))
        {
          sub_10000914C();
          sub_100004FE8();
        }
        else
        {
          if (!strncmp(v57, "= crash", 7uLL)) {
            abort();
          }
          if (!strncmp(v57, "@ ", 2uLL))
          {
            sub_100005090(v57);
          }
          else if (!strncmp(v57, "= ", 2uLL))
          {
            sub_10000924C(v57, 1);
          }
        }
      }
    }
  }
  sub_100004388(*(void *)(a1 + 32), *(void *)(a1 + 40));
LABEL_146:
  asl_msg_release();
  atomic_fetch_add_explicit(&dword_100022380, 0xFFFFFFFF, memory_order_relaxed);
  os_release(*(void **)(a1 + 48));
}

uint64_t sub_10000A6C8(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v1 = asl_msg_from_string();
  if (!v1) {
    return 1;
  }
  sub_100009814(v1, 1);
  return 0;
}

void sub_10000A708()
{
  uint64_t v0 = 0;
  asprintf(&v0, "[Sender syslogd] [Level 6] [PID %u] [Message -- MARK --] [UID 0] [UID 0] [Facility syslog]", dword_10002237C);
  sub_10000A6C8((uint64_t)v0);
  free(v0);
}

char *sub_10000A758(uint64_t a1, int a2, uint64_t a3, int a4)
{
  time_t v4 = 0;
  if (!a1 || a2 < 1) {
    return v4;
  }
  uint64_t v9 = 0;
  if (a4 == 4) {
    int v10 = 5;
  }
  else {
    int v10 = 7;
  }
  uint64_t v45 = 0;
  while (1)
  {
    int v11 = *(unsigned __int8 *)(a1 + v9);
    if (v11 != 32 && v11 != 9) {
      break;
    }
    if (a2 == ++v9) {
      return 0;
    }
  }
  int v46 = 0;
  memset(&v44, 0, sizeof(v44));
  time_t v43 = 0;
  int v14 = (char *)(a1 + v9);
  if (v11 == 60)
  {
    if (sscanf(v14 + 1, "%d", &v46) == 1 && (int v10 = v46 & 7, v46 >= 8)) {
      uint64_t v15 = asl_syslog_faciliy_num_to_name();
    }
    else {
      uint64_t v15 = 0;
    }
    if ((int)v9 + 1 >= a2)
    {
      LODWORD(v9) = v9 + 1;
      ++v14;
    }
    else if (v14[1] == 62)
    {
LABEL_26:
      v14 += 2;
      LODWORD(v9) = v9 + 2;
    }
    else
    {
      while (1)
      {
        uint64_t v16 = a1 + v9;
        if (a2 - 2 == v9) {
          break;
        }
        ++v9;
        if (*(unsigned char *)(v16 + 2) == 62)
        {
          int v14 = (char *)(a1 + v9);
          goto LABEL_26;
        }
      }
      int v14 = (char *)(v16 + 2);
      LODWORD(v9) = a2;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  snprintf(__str, 8uLL, "%d", v10);
  if (a2 - (int)v9 >= 16 && v14[9] == 58 && v14[12] == 58 && v14[15] == 32)
  {
    time_t v17 = (char *)malloc_type_malloc(0x10uLL, 0xCDF66348uLL);
    time_t v4 = v17;
    if (!v17) {
      return v4;
    }
    uint64_t v18 = *(void *)v14;
    *(void *)(v17 + 7) = *(void *)(v14 + 7);
    *(void *)time_t v17 = v18;
    v17[15] = 0;
    time_t v43 = asl_core_parse_time();
    if (v43 == -1)
    {
      uint64_t v45 = v4;
    }
    else
    {
      free(v4);
      gmtime_r(&v43, &v44);
      asprintf(&v45, "%d.%02d.%02d %02d:%02d:%02d UTC", v44.tm_year + 1900, v44.tm_mon + 1, v44.tm_mday, v44.tm_hour, v44.tm_min, v44.tm_sec);
    }
    v14 += 16;
    LODWORD(v9) = v9 + 16;
  }
  if (a4 == 4)
  {
    time_t v4 = (char *)asl_msg_new();
    if (v4)
    {
      asl_msg_set_key_val();
      asl_msg_set_key_val();
LABEL_41:
      asl_msg_set_key_val();
      return v4;
    }
    return v4;
  }
  if (a4 == 3 && (uint64_t v19 = strchr(v14, 32)) != 0)
  {
    int v20 = v19;
    int v21 = v19 - v14;
    int v22 = v19 - v14 + 1;
    int v23 = malloc_type_malloc(v22, 0x72F0938DuLL);
    if (!v23) {
      return 0;
    }
    uint32_t v24 = v23;
    memcpy(v23, v14, v21);
    v24[v21] = 0;
    int v14 = v20 + 1;
    LODWORD(v9) = v22 + v9;
  }
  else
  {
    uint32_t v24 = 0;
  }
  char v25 = strchr(v14, 58);
  uint64_t v26 = strchr(v14, 91);
  if (v25)
  {
    uint64_t v27 = v26;
    if (v26 && v26 < v25 && *(v25 - 1) == 93)
    {
      uint64_t v28 = (v26 - v14);
      int v29 = malloc_type_malloc(((uint64_t)&_mh_execute_header + (v28 << 32)) >> 32, 0x8BE0C0ABuLL);
      if (!v29) {
        return 0;
      }
      int v30 = v29;
      uint64_t v42 = v15;
      uint64_t v31 = v24;
      memcpy(v29, v14, (int)v28);
      v30[(int)v28] = 0;
      int v32 = v27 + 1;
      uint64_t v33 = malloc_type_malloc((int)v25 - ((int)v27 + 1), 0x30D079B3uLL);
      if (!v33) {
        return 0;
      }
      unint64_t v34 = v33;
      int v35 = ~v32 + v25;
      memcpy(v33, v32, v35);
      v34[v35] = 0;
      int v36 = v25 - v14;
    }
    else
    {
      int v36 = v25 - v14;
      int v37 = malloc_type_malloc(((uint64_t)&_mh_execute_header + ((v25 - v14) << 32)) >> 32, 0xDFCD5118uLL);
      if (!v37) {
        return 0;
      }
      int v30 = v37;
      uint64_t v42 = v15;
      uint64_t v31 = v24;
      memcpy(v37, v14, v36);
      unint64_t v34 = 0;
      v30[v36] = 0;
    }
    int v14 = v25 + 1;
    LODWORD(v9) = v9 + v36 + 1;
    uint32_t v24 = v31;
    uint64_t v15 = v42;
  }
  else
  {
    int v30 = 0;
    unint64_t v34 = 0;
  }
  if (*v14 == 32) {
    uint64_t v38 = v14 + 1;
  }
  else {
    uint64_t v38 = v14;
  }
  size_t v39 = a2 - v9 - (*v14 == 32);
  if ((int)v39 >= 1)
  {
    uint64_t v40 = malloc_type_malloc((v39 + 1), 0xC91C1B06uLL);
    if (v40)
    {
      uint64_t v41 = v40;
      memcpy(v40, v38, v39);
      v41[v39] = 0;
      goto LABEL_65;
    }
    return 0;
  }
  uint64_t v41 = 0;
LABEL_65:
  if (!v15) {
    asl_syslog_faciliy_num_to_name();
  }
  time_t v4 = (char *)asl_msg_new();
  if (v4)
  {
    if (v45)
    {
      asl_msg_set_key_val();
      free(v45);
    }
    asl_msg_set_key_val();
    if (v30)
    {
      asl_msg_set_key_val();
      free(v30);
    }
    asl_msg_set_key_val();
    if (v34) {
      free(v34);
    }
    if (v41)
    {
      asl_msg_set_key_val();
      free(v41);
    }
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    if (v24)
    {
      asl_msg_set_key_val();
      free(v24);
      return v4;
    }
    if (!a3) {
      return v4;
    }
    goto LABEL_41;
  }
  return v4;
}

char *sub_10000AD60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  int v10 = a2;
  uint64_t v11 = a1;
  int v12 = "NULL";
  if (a1) {
    LOBYTE(v12) = a1;
  }
  sub_100009A44("asl_input_parse: %s\n", a2, a3, a4, a5, a6, a7, a8, (char)v12);
  if (v11)
  {
    if (!v10) {
      int v10 = strlen((const char *)v11);
    }
    int v15 = 0;
    BOOL v13 = *(unsigned char *)v11 == 60 || v10 < 12;
    if (!v13 && sscanf((const char *)v11, "%d ", &v15) == 1 && *(unsigned char *)(v11 + 10) == 32 && *(unsigned char *)(v11 + 11) == 91)
    {
      uint64_t v11 = asl_msg_from_string();
      if (v11 && a3) {
        asl_msg_set_key_val();
      }
    }
    else
    {
      return sub_10000A758(v11, v10, a3, v8);
    }
  }
  return (char *)v11;
}

void sub_10000AE74(id a1)
{
}

void sub_10000AEA8(uint64_t a1, char *__s1, uint64_t a3)
{
  if (a1 && __s1)
  {
    char v6 = *__s1;
    if (*__s1)
    {
      unsigned __int8 v7 = 0;
      int v8 = __s1 + 1;
      do
      {
        v7 ^= v6 ^ (2 * v7);
        int v9 = *v8++;
        char v6 = v9;
      }
      while (v9);
      uint64_t v10 = v7;
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 16) + 8 * v10);
    if (v11)
    {
      while (!*(void *)v11 || strcmp(__s1, *(const char **)v11))
      {
        uint64_t v11 = *(void *)(v11 + 24);
        if (!v11) {
          goto LABEL_12;
        }
      }
      uint64_t v15 = *(void *)(v11 + 16) + a3;
      ++*(void *)(v11 + 8);
      *(void *)(v11 + 16) = v15;
    }
    else
    {
LABEL_12:
      int v12 = malloc_type_malloc(0x20uLL, 0x1030040A9292222uLL);
      BOOL v13 = strdup(__s1);
      *int v12 = v13;
      if (v13)
      {
        v12[1] = 1;
        v12[2] = a3;
        uint64_t v14 = *(void *)(a1 + 16);
        v12[3] = *(void *)(v14 + 8 * v10);
        *(void *)(v14 + 8 * v10) = v12;
      }
      else
      {
        free(v12);
      }
    }
  }
}

void sub_10000AFBC(int a1)
{
  if (qword_1000201C8 != -1) {
    dispatch_once(&qword_1000201C8, &stru_10001CE58);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000B090;
  block[3] = &unk_10001CE78;
  int v3 = a1;
  dispatch_async((dispatch_queue_t)qword_1000201D0, block);
}

void sub_10000B064(id a1)
{
  qword_1000201D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

uint64_t sub_10000B090(uint64_t a1)
{
  if (DWORD2(xmmword_100022368))
  {
    uint64_t v2 = (void *)xmmword_100022368;
  }
  else
  {
    uint64_t v2 = 0;
    *(void *)&xmmword_100022368 = 0;
  }
  uint64_t result = (uint64_t)reallocf(v2, 4 * (DWORD2(xmmword_100022368) + 1));
  *(void *)&xmmword_100022368 = result;
  if (result)
  {
    int v11 = DWORD2(xmmword_100022368) + 1;
    *(_DWORD *)(result + 4 * SDWORD2(xmmword_100022368)) = *(_DWORD *)(a1 + 32);
  }
  else
  {
    uint64_t result = sub_100009A44("add_lockdown_session: realloc failed\n", v4, v5, v6, v7, v8, v9, v10, v12);
    int v11 = 0;
  }
  DWORD2(xmmword_100022368) = v11;
  HIDWORD(xmmword_100022368) = v11 + dword_1000201D8;
  return result;
}

void sub_10000B118(int a1)
{
  if (qword_1000201C8 != -1) {
    dispatch_once(&qword_1000201C8, &stru_10001CEB8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000B1EC;
  block[3] = &unk_10001CED8;
  int v3 = a1;
  dispatch_async((dispatch_queue_t)qword_1000201D0, block);
}

void sub_10000B1C0(id a1)
{
  qword_1000201D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

void sub_10000B1EC(uint64_t a1)
{
  int v1 = DWORD2(xmmword_100022368);
  if (SDWORD2(xmmword_100022368) < 1) {
    goto LABEL_11;
  }
  uint64_t v2 = 0;
  int v3 = 0;
  uint64_t v4 = xmmword_100022368;
  do
  {
    int v5 = *(_DWORD *)(v4 + 4 * v2);
    if (v5 != *(_DWORD *)(a1 + 32))
    {
      if (v2 != v3)
      {
        *(_DWORD *)(v4 + 4 * v3) = v5;
        int v1 = DWORD2(xmmword_100022368);
      }
      ++v3;
    }
    ++v2;
  }
  while (v2 < v1);
  if (v3)
  {
    *(void *)&xmmword_100022368 = reallocf((void *)xmmword_100022368, 4 * v3);
    if (!(void)xmmword_100022368)
    {
      sub_100009A44("remove_lockdown_session: realloc failed\n", v6, v7, v8, v9, v10, v11, v12, v13);
      int v3 = 0;
    }
  }
  else
  {
LABEL_11:
    free((void *)xmmword_100022368);
    int v3 = 0;
    *(void *)&xmmword_100022368 = 0;
  }
  DWORD2(xmmword_100022368) = v3;
  HIDWORD(xmmword_100022368) = v3 + dword_1000201D8;
}

void sub_10000B2A4(uint64_t a1)
{
  if (qword_1000201C8 != -1) {
    dispatch_once(&qword_1000201C8, &stru_10001CF18);
  }
  asl_msg_retain();
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000B380;
  block[3] = &unk_10001CF38;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_1000201D0, block);
}

void sub_10000B354(id a1)
{
  qword_1000201D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

uint64_t sub_10000B380()
{
  size_t __nbyte = 0;
  if (SDWORD2(xmmword_100022368) < 1) {
    goto LABEL_31;
  }
  if (HIDWORD(qword_100022458))
  {
    v66.__darwin_time_t tv_sec = 0;
    *(void *)&v66.__darwin_suseconds_t tv_usec = 0;
    if (!gettimeofday(&v66, 0))
    {
      if ((void)xmmword_1000201F8)
      {
        __darwin_time_t tv_sec = v66.tv_sec;
        if (v66.tv_sec <= (uint64_t)xmmword_1000201F8)
        {
          __darwin_suseconds_t tv_usec = v66.tv_usec;
        }
        else
        {
          __darwin_time_t tv_sec = --v66.tv_sec;
          __darwin_suseconds_t tv_usec = v66.tv_usec + 1000000;
          v66.tv_usec += 1000000;
        }
        unint64_t v2 = 1000000 * (tv_sec - xmmword_1000201F8) - SDWORD2(xmmword_1000201F8) + tv_usec;
        if (v2 < HIDWORD(qword_100022458)) {
          usleep(v2);
        }
      }
      else
      {
        __darwin_suseconds_t tv_usec = v66.tv_usec;
      }
      if (tv_usec > 999999)
      {
        ++v66.tv_sec;
        v66.__darwin_suseconds_t tv_usec = tv_usec - 1000000;
      }
      xmmword_1000201F8 = (__int128)v66;
    }
  }
  int v3 = (void *)asl_format_message();
  uint64_t v4 = v3;
  if (!DWORD2(xmmword_100022368))
  {
    free(v3);
LABEL_31:
    int v28 = dword_1000201D8;
    goto LABEL_34;
  }
  unint64_t v5 = 0;
  int v6 = 0;
  do
  {
    if (write(*(_DWORD *)(xmmword_100022368 + 4 * v5), v4, __nbyte) < 0)
    {
      int v7 = *(_DWORD *)(xmmword_100022368 + 4 * v5);
      __error();
      uint64_t v8 = __error();
      strerror(*v8);
      sub_100009A44("send_to_direct_watchers: lockdown %d write error: %d %s\n", v9, v10, v11, v12, v13, v14, v15, v7);
      close(*(_DWORD *)(xmmword_100022368 + 4 * v5));
      *(_DWORD *)(xmmword_100022368 + 4 * v5) = -1;
      int v6 = 1;
    }
    ++v5;
  }
  while (v5 < DWORD2(xmmword_100022368));
  free(v4);
  if (!v6) {
    goto LABEL_31;
  }
  int v16 = DWORD2(xmmword_100022368);
  time_t v17 = (_DWORD *)xmmword_100022368;
  if (SDWORD2(xmmword_100022368) < 1) {
    goto LABEL_32;
  }
  uint64_t v18 = 0;
  int v19 = 0;
  do
  {
    int v20 = v17[v18];
    if ((v20 & 0x80000000) == 0)
    {
      if (v18 != v19)
      {
        v17[v19] = v20;
        int v16 = DWORD2(xmmword_100022368);
      }
      ++v19;
    }
    ++v18;
  }
  while (v18 < v16);
  if (v19)
  {
    *(void *)&xmmword_100022368 = reallocf(v17, 4 * v19);
    if (!(void)xmmword_100022368)
    {
      sub_100009A44("sweep_lockdown_session_fds: realloc failed\n", v21, v22, v23, v24, v25, v26, v27, v63);
      int v19 = 0;
    }
  }
  else
  {
LABEL_32:
    free(v17);
    int v19 = 0;
    *(void *)&xmmword_100022368 = 0;
  }
  int v28 = dword_1000201D8;
  DWORD2(xmmword_100022368) = v19;
  HIDWORD(xmmword_100022368) = dword_1000201D8 + v19;
LABEL_34:
  if (!v28)
  {
    qword_100020208 = 0;
    return asl_msg_release();
  }
  if (!qword_100020208)
  {
    dword_1000201D8 = 0;
    return asl_msg_release();
  }
  uint64_t v65 = (char *)asl_msg_to_string();
  if (v65)
  {
    HIDWORD(__nbyte) = bswap32(__nbyte);
    int v29 = &dword_100020000;
    if (!dword_1000201D8)
    {
      free(v65);
      return asl_msg_release();
    }
    unint64_t v30 = 0;
    int v31 = 0;
    do
    {
      if ((unint64_t)send(*(_DWORD *)(qword_100020208 + 4 * v30), (char *)&__nbyte + 4, 4uLL, 0) >= 4)
      {
        if (__nbyte)
        {
          int v32 = v29;
          unsigned int v33 = 0;
          unsigned int v34 = 0;
          while (2)
          {
            if (v33 <= 0x65) {
              int v35 = 101;
            }
            else {
              int v35 = v33;
            }
            int v36 = v35 + 1;
            while (1)
            {
              *__error() = 0;
              ssize_t v37 = send(*(_DWORD *)(qword_100020208 + 4 * v30), &v65[v34], __nbyte - v34, 0);
              char v38 = v37;
              if (v37 > 0) {
                break;
              }
              __error();
              sub_100009A44("send_to_direct_watchers: send returned %d (errno %d)\n", v39, v40, v41, v42, v43, v44, v45, v38);
              if (*__error() != 35)
              {
                close(*(_DWORD *)(qword_100020208 + 4 * v30));
                *(_DWORD *)(qword_100020208 + 4 * v30) = -1;
                int v31 = 1;
                int v29 = v32;
                goto LABEL_57;
              }
              if (v36 == ++v33)
              {
                sub_100009A44("send_to_direct_watchers: exceeded EAGAIN limit - closing connection\n", v46, v47, v48, v49, v50, v51, v52, v64);
                goto LABEL_56;
              }
              *__error() = 0;
              if (v34 >= __nbyte) {
                goto LABEL_56;
              }
            }
            v34 += v37;
            if (v34 < __nbyte) {
              continue;
            }
            break;
          }
LABEL_56:
          int v29 = v32;
        }
      }
      else
      {
        close(*(_DWORD *)(qword_100020208 + 4 * v30));
        *(_DWORD *)(qword_100020208 + 4 * v30) = -1;
        int v31 = 1;
      }
LABEL_57:
      ++v30;
      unint64_t v53 = v29[118];
    }
    while (v30 < v53);
    free(v65);
    if (v31)
    {
      if (v53)
      {
        uint64_t v54 = 0;
        unsigned int v55 = 0;
        dispatch_time_t v56 = (_DWORD *)qword_100020208;
        uint64_t v57 = (_WORD *)qword_100020210;
        do
        {
          int v58 = v56[v54];
          if ((v58 & 0x80000000) == 0)
          {
            if (v54 != v55)
            {
              v56[v55] = v58;
              v57[v55] = v57[v54];
            }
            ++v55;
          }
          ++v54;
        }
        while (v53 != v54);
        v29[118] = v55;
        if (v55)
        {
          uint64_t v59 = reallocf(v56, 4 * v55);
          qword_100020208 = (uint64_t)v59;
          uint64_t v60 = reallocf(v57, 2 * v55);
          uint64_t v61 = v60;
          qword_100020210 = (uint64_t)v60;
          if (!v59 || !v60)
          {
            free(v59);
            qword_100020208 = 0;
            free(v61);
            qword_100020210 = 0;
            v29[118] = 0;
          }
          return asl_msg_release();
        }
      }
      else
      {
        v29[118] = 0;
        dispatch_time_t v56 = (_DWORD *)qword_100020208;
        uint64_t v57 = (_WORD *)qword_100020210;
      }
      free(v56);
      qword_100020208 = 0;
      free(v57);
      qword_100020210 = 0;
    }
  }
  return asl_msg_release();
}

void sub_10000B87C(uint64_t a1)
{
  if (qword_1000201E8 != -1) {
    dispatch_once(&qword_1000201E8, &stru_10001CF78);
  }
  sub_10000B2A4(a1);
  int v2 = xmmword_100022448;
  LODWORD(v3) = v2 | (asl_check_option(a1, "asl_db_file") != 0);
  uint64_t v4 = v3 | 2;
  if (asl_check_option(a1, "asl_db_memory")) {
    uint64_t v3 = v4;
  }
  else {
    uint64_t v3 = v3;
  }
  sub_10000BB1C(v3);
  if (v3)
  {
    if (asl_store_save())
    {
      char v5 = asl_core_error();
      sub_100009A44("asl_store_save: %s\n", v6, v7, v8, v9, v10, v11, v12, v5);
      asl_store_release();
      *(void *)&xmmword_1000223E8 = 0;
      sub_10000BB1C(v3);
      if (asl_store_save())
      {
        char v13 = asl_core_error();
        sub_100009A44("(retry) asl_store_save: %s\n", v14, v15, v16, v17, v18, v19, v20, v13);
        asl_store_release();
        *(void *)&xmmword_1000223E8 = 0;
        LODWORD(xmmword_100022448) = xmmword_100022448 | 2;
        if (!*((void *)&xmmword_1000223E8 + 1)
          && asl_memory_open(DWORD2(xmmword_100022448), HIDWORD(xmmword_100022448), (void *)&xmmword_1000223E8 + 1))
        {
          char v21 = asl_core_error();
          sub_100009A44("asl_memory_open: %s\n", v22, v23, v24, v25, v26, v27, v28, v21);
        }
        uint64_t v3 = v4;
      }
    }
  }
  uint64_t v47 = 0;
  if ((v3 & 2) != 0)
  {
    uint64_t v47 = 0;
    if (asl_memory_save(*((uint64_t *)&xmmword_1000223E8 + 1), a1, (uint64_t)&v47))
    {
      char v29 = asl_core_error();
      sub_100009A44("asl_memory_save: %s\n", v30, v31, v32, v33, v34, v35, v36, v29);
      asl_memory_close(*((dispatch_object_t **)&xmmword_1000223E8 + 1));
      *((void *)&xmmword_1000223E8 + 1) = 0;
      sub_10000BB1C(v3);
      uint64_t v47 = 0;
      if (asl_memory_save(*((uint64_t *)&xmmword_1000223E8 + 1), a1, (uint64_t)&v47))
      {
        char v37 = asl_core_error();
        sub_100009A44("(retry) asl_memory_save: %s\n", v38, v39, v40, v41, v42, v43, v44, v37);
        asl_memory_close(*((dispatch_object_t **)&xmmword_1000223E8 + 1));
        *((void *)&xmmword_1000223E8 + 1) = 0;
      }
    }
  }
  if ((byte_1000201DC & 1) == 0)
  {
    byte_1000201DC = 1;
    uint64_t v45 = qword_1000201E0;
    dispatch_time_t v46 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v45, v46, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)qword_1000201E0);
  }
}

void sub_10000BA9C(id a1)
{
  qword_1000201E0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000201E0, &stru_10001CFB8);
  byte_1000201DC = 0;
}

void sub_10000BAE8(id a1)
{
  byte_1000201DC = 0;
}

uint64_t sub_10000BB1C(uint64_t result)
{
  char v1 = result;
  memset(&v47, 0, sizeof(v47));
  if ((result & 1) == 0 || (void)xmmword_1000223E8)
  {
LABEL_10:
    if ((v1 & 2) == 0) {
      return result;
    }
    goto LABEL_11;
  }
  int v2 = (const char *)asl_filesystem_path();
  if (stat(v2, &v47))
  {
    int v3 = *__error();
    uint64_t v4 = (const char *)asl_filesystem_path();
    char v5 = (char)v4;
    if (v3 != 2)
    {
      uint64_t v30 = __error();
      strerror(*v30);
      return sub_100009A44("error: can't stat data store %s: %s\n", v31, v32, v33, v34, v35, v36, v37, v5);
    }
    if (mkdir(v4, 0x1EDu))
    {
      char v6 = asl_filesystem_path();
      uint64_t v7 = __error();
      strerror(*v7);
      return sub_100009A44("error: can't create data store %s: %s\n", v8, v9, v10, v11, v12, v13, v14, v6);
    }
  }
  else if ((v47.st_mode & 0xF000) != 0x4000)
  {
    char v46 = asl_filesystem_path();
    return sub_100009A44("error: %s is not a directory", v38, v39, v40, v41, v42, v43, v44, v46);
  }
  if (asl_store_open_write())
  {
    char v15 = asl_core_error();
    uint64_t result = sub_100009A44("asl_store_open_write: %s\n", v16, v17, v18, v19, v20, v21, v22, v15);
    goto LABEL_10;
  }
  if (DWORD1(xmmword_100022448)) {
    asl_store_max_file_size();
  }
  uint64_t result = asl_trigger_aslmanager();
  if ((v1 & 2) != 0)
  {
LABEL_11:
    if (!*((void *)&xmmword_1000223E8 + 1))
    {
      uint64_t result = asl_memory_open(DWORD2(xmmword_100022448), HIDWORD(xmmword_100022448), (void *)&xmmword_1000223E8 + 1);
      if (result)
      {
        char v45 = asl_core_error();
        return sub_100009A44("asl_memory_open: %s\n", v23, v24, v25, v26, v27, v28, v29, v45);
      }
    }
  }
  return result;
}

uint64_t sub_10000BC98(uint64_t result)
{
  uint64_t v10 = 0;
  if ((xmmword_100022448 & 2) == 0 && !*((void *)&xmmword_1000223E8 + 1))
  {
    uint64_t v1 = result;
    if (asl_memory_open(DWORD2(xmmword_100022448), HIDWORD(xmmword_100022448), (void *)&xmmword_1000223E8 + 1))
    {
      char v2 = asl_core_error();
      return sub_100009A44("asl_memory_open: %s\n", v3, v4, v5, v6, v7, v8, v9, v2);
    }
    else
    {
      return asl_memory_save(*((uint64_t *)&xmmword_1000223E8 + 1), v1, (uint64_t)&v10);
    }
  }
  return result;
}

uint64_t sub_10000BD18(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8, int a9, int a10)
{
  if (a4 == -1) {
    return 2 * (xmmword_100022448 & 1);
  }
  memset(out, 0, 37);
  *(_OWORD *)uuid_t uu = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v23 = 0;
  if (a10)
  {
    uuid_clear(uu);
    if (proc_pidinfo(a10, 17, 1uLL, uu, 56) == 56)
    {
      uint64_t v18 = out;
      uuid_unparse(uu, out);
    }
    else
    {
      uint64_t v18 = "NO ACCESS";
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  if (xmmword_100022448 & 2 | dword_100022350) {
    return asl_memory_match_restricted_uuid(*((uint64_t *)&xmmword_1000223E8 + 1), a1, a2, a7, a3, a4, a5, a6, a8, a9, (uint64_t)v18);
  }
  else {
    return 9999;
  }
}

void sub_10000BE84()
{
  mach_msg_return_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_msg_id_t msgh_id;
  mach_msg_return_t v14;
  void v15[5];
  void block[6];
  char __str[264];

  unint64_t v0 = 0;
  uint64_t v1 = &dword_10001CFE0;
  do
  {
    if (!strcmp(*((const char **)v1 - 1), "_asl_server_message")) {
      int v2 = *v1;
    }
    else {
      int v2 = 0;
    }
    if (v0 > 4) {
      break;
    }
    ++v0;
    v1 += 4;
  }
  while (!v2);
  qword_1000201F0 = (uint64_t)dispatch_queue_create("ASL Server Queue", 0);
  while (1)
  {
    do
      uint64_t v3 = (mach_msg_header_t *)malloc_type_calloc(1uLL, 0x94uLL, 0x1FFE4BA6uLL);
    while (!v3);
    uint64_t v4 = v3;
    v3->msgh_local_port = dword_100022358;
    v3->msgh_size = 148;
    uint64_t v5 = mach_msg(v3, 50333698, 0, 0x94u, dword_100022354, 0, 0);
    if (v5) {
      break;
    }
    msgh_id = v4->msgh_id;
    if (v4->msgh_local_port == dword_10002235C && msgh_id == 72)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_10000C080;
      block[3] = &unk_10001D038;
      void block[4] = v4;
      void block[5] = v4;
      dispatch_async((dispatch_queue_t)qword_1000201F0, block);
    }
    else if (msgh_id == v2)
    {
      sub_10000C198(v4);
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 0x40000000;
      v15[2] = sub_10000C374;
      v15[3] = &unk_10001D058;
      v15[4] = v4;
      dispatch_async((dispatch_queue_t)qword_1000201F0, v15);
    }
  }
  uint64_t v14 = v5;
  sub_100009A44("FATAL ERROR: mach_msg() receive failed with status 0x%08x\n", v6, v7, v8, v9, v10, v11, v12, v5);
  snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 1] [PID %u] [Facility syslog] [Message FATAL ERROR: mach_msg() receive failed with status 0x%08x]", dword_10002237C, v14);
  sub_10000A6C8((uint64_t)__str);
  sleep(1u);
  abort();
}

void sub_10000C080(uint64_t a1)
{
  mach_port_name_t v2 = *(_DWORD *)(*(void *)(a1 + 32) + 32);
  int v3 = dword_100020218;
  if (dword_100020218)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (_DWORD *)qword_100020220;
    while (*(_DWORD *)(qword_100020220 + 4 * v4) != v2)
    {
      if (dword_100020218 == ++v4) {
        goto LABEL_12;
      }
    }
    if (dword_100020218 == 1)
    {
      free((void *)qword_100020220);
      qword_100020220 = 0;
      dword_100020218 = 0;
    }
    else
    {
      if ((int)v4 + 1 < dword_100020218)
      {
        do
        {
          v5[v4] = v5[v4 + 1];
          ++v4;
        }
        while (v3 - 1 != v4);
      }
      dword_100020218 = v3 - 1;
      qword_100020220 = (uint64_t)reallocf(v5, 4 * (v3 - 1));
    }
    sub_100009A44("cancel_session: %u\n", v6, v7, v8, v9, v10, v11, v12, v2);
    mach_port_deallocate(mach_task_self_, v2);
    sub_1000090FC();
    mach_port_name_t v2 = *(_DWORD *)(*(void *)(a1 + 32) + 32);
  }
LABEL_12:
  mach_port_deallocate(mach_task_self_, v2);
  uint64_t v13 = *(void **)(a1 + 40);

  free(v13);
}

void sub_10000C198(mach_msg_header_t *a1)
{
  mach_port_name_t v2 = (mach_msg_header_t *)malloc_type_calloc(1uLL, 0x8CuLL, 0x85FC6FC1uLL);
  int v3 = voucher_mach_msg_adopt(a1);
  asl_ipc_server(a1, (uint64_t)v2);
  if ((v2->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = v2[1].msgh_remote_port;
    if (msgh_remote_port)
    {
      if (msgh_remote_port == -305)
      {
        v2->mach_port_t msgh_remote_port = 0;
      }
      else if ((a1->msgh_bits & 0x80000000) != 0)
      {
        a1->mach_port_t msgh_remote_port = 0;
        mach_msg_destroy(a1);
      }
    }
  }
  if (!v2->msgh_remote_port)
  {
    if ((v2->msgh_bits & 0x80000000) == 0) {
      goto LABEL_18;
    }
LABEL_17:
    mach_msg_destroy(v2);
    goto LABEL_18;
  }
  uint64_t v5 = mach_msg(v2, 17, v2->msgh_size, 0, 0, 0xAu, 0);
  if ((v5 - 268435459) <= 1) {
    goto LABEL_17;
  }
  if (v5)
  {
    if (v5 == 268435469)
    {
      sub_100009A44("ERROR: mach_msg() send failed with MACH_SEND_NO_BUFFER 0x%08x\n", v5, v6, v7, v8, v9, v10, v11, 13);
      snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message mach_msg() send failed with status 0x%08x (MACH_SEND_NO_BUFFER)]");
    }
    else
    {
      if (v5 != 268435472) {
        sub_10001784C(__str, v5, v6, v7, v8, v9, v10, v11);
      }
      sub_100009A44("ERROR: mach_msg() send failed with MACH_SEND_INVALID_HEADER 0x%08x\n", v5, v6, v7, v8, v9, v10, v11, 16);
      snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message mach_msg() send failed with status 0x%08x (MACH_SEND_INVALID_HEADER)]");
    }
    sub_10000A6C8((uint64_t)__str);
    goto LABEL_17;
  }
LABEL_18:
  voucher_mach_msg_revert(v3);
  free(a1);
  free(v2);
}

void sub_10000C374(uint64_t a1)
{
}

uint64_t sub_10000C37C(int a1, vm_address_t address, vm_size_t size, uint64_t a4, int a5, char a6, void *a7, _DWORD *a8, void *a9, int *a10, _OWORD *a11)
{
  if (a6) {
    int v11 = -1;
  }
  else {
    int v11 = 1;
  }
  sub_10000C3D0(address, size, a4, a5, 0, v11, a7, a8, a9, a10, a11);
  return 0;
}

void sub_10000C3D0(vm_address_t address, vm_size_t size, uint64_t a3, int a4, int a5, int a6, void *a7, _DWORD *a8, void *a9, int *a10, _OWORD *a11)
{
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  if (address)
  {
    unsigned int v15 = size;
    if (*(unsigned char *)(address + (size - 1)))
    {
      vm_deallocate(mach_task_self_, address, size);
      int v17 = 1;
LABEL_4:
      *a10 = v17;
      return;
    }
    uint64_t v43 = a7;
    uint64_t v44 = a8;
    uint64_t v18 = asl_msg_list_from_string();
    vm_deallocate(mach_task_self_, address, v15);
  }
  else
  {
    uint64_t v43 = a7;
    uint64_t v44 = a8;
    uint64_t v18 = asl_msg_list_from_string();
  }
  uint64_t v48 = 0;
  euidp[0] = -1;
  memset(&euidp[1], 0, 12);
  pid_t pidp = -1;
  gid_t egidp = -1;
  long long v19 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v19;
  audit_token_to_au32(&atoken, 0, euidp, &egidp, 0, 0, &pidp, 0, 0);
  if (v18 && *(_DWORD *)(v18 + 8) == 1 && asl_check_option(**(void **)(v18 + 16), "control"))
  {
    uint64_t v20 = **(void **)(v18 + 16);
    uid_t v21 = euidp[0];
    uint64_t v48 = 0;
    uint64_t v22 = asl_msg_list_new();
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = asl_msg_new();
      if (v24)
      {
        uint64_t v25 = v24;
        uid_t v42 = v21;
        uint64_t v49 = 0;
        asl_msg_list_append();
        int v26 = asl_msg_count();
        if (v26 != 1 && asl_msg_lookup()) {
          goto LABEL_119;
        }
        if (DWORD2(xmmword_100022428)) {
          snprintf((char *)&atoken, 0x100uLL, "1 %s", (const char *)qword_100022438);
        }
        else {
          LOWORD(atoken.val[0]) = 48;
        }
        asl_msg_set_key_val();
        if (v26 != 1)
        {
LABEL_119:
          if (asl_msg_lookup()) {
            goto LABEL_118;
          }
        }
        unsigned int v37 = ((xmmword_100022448 >> 1) & 1) + (xmmword_100022448 & 1);
        if (v37)
        {
          long long v63 = 0u;
          long long v64 = 0u;
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
          long long v51 = 0u;
          long long v52 = 0u;
          memset(&atoken, 0, sizeof(atoken));
          if (xmmword_100022448)
          {
            __strncat_chk();
            if (v37 >= 2) {
              __strncat_chk();
            }
            unsigned int v38 = 2;
          }
          else
          {
            unsigned int v38 = 1;
          }
          if ((xmmword_100022448 & 2) != 0)
          {
            __strncat_chk();
            if (v38 < v37) {
              __strncat_chk();
            }
          }
        }
        asl_msg_set_key_val();
        if (v26 == 1)
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", DWORD1(xmmword_100022448));
          asl_msg_set_key_val();
        }
        else
        {
LABEL_118:
          if (!asl_msg_lookup())
          {
            snprintf((char *)&atoken, 0x100uLL, "%u", DWORD1(xmmword_100022448));
            asl_msg_set_key_val();
          }
          if (asl_msg_lookup()) {
            goto LABEL_62;
          }
        }
        snprintf((char *)&atoken, 0x100uLL, "%u", DWORD2(xmmword_100022448));
        asl_msg_set_key_val();
        if (v26 == 1)
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(xmmword_100022448));
          asl_msg_set_key_val();
LABEL_65:
          snprintf((char *)&atoken, 0x100uLL, "%u", qword_100022458);
          asl_msg_set_key_val();
          if (v26 == 1)
          {
            snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_100022460);
            asl_msg_set_key_val();
LABEL_70:
            snprintf((char *)&atoken, 0x100uLL, "%llu", *((void *)&xmmword_100022460 + 1));
            asl_msg_set_key_val();
            if (v26 == 1)
            {
              snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_100022470);
              asl_msg_set_key_val();
LABEL_75:
              snprintf((char *)&atoken, 0x100uLL, "%lld", (void)xmmword_100022388);
              asl_msg_set_key_val();
              if (v26 == 1)
              {
                snprintf((char *)&atoken, 0x100uLL, "%lld", qword_100022480);
                asl_msg_set_key_val();
LABEL_80:
                snprintf((char *)&atoken, 0x100uLL, "%lld", *((void *)&xmmword_100022470 + 1));
                asl_msg_set_key_val();
                if (v26 == 1)
                {
                  snprintf((char *)&atoken, 0x100uLL, "%d", dword_100022380);
                  asl_msg_set_key_val();
LABEL_85:
                  snprintf((char *)&atoken, 0x100uLL, "%d", DWORD2(xmmword_100022388));
                  asl_msg_set_key_val();
                  if (v26 == 1)
                  {
                    snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_100022388));
                    asl_msg_set_key_val();
LABEL_90:
                    snprintf((char *)&atoken, 0x100uLL, "%d", dword_10002234C);
                    asl_msg_set_key_val();
                    if (v26 == 1)
                    {
                      snprintf((char *)&atoken, 0x100uLL, "%d", dword_100022350);
                      asl_msg_set_key_val();
LABEL_95:
                      snprintf((char *)&atoken, 0x100uLL, "%d", DWORD2(xmmword_100022368));
                      asl_msg_set_key_val();
                      if (v26 == 1)
                      {
                        snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(qword_100022458));
                        asl_msg_set_key_val();
LABEL_100:
                        snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_100022368));
                        asl_msg_set_key_val();
LABEL_101:
                        if (dword_100022400)
                        {
                          unint64_t v39 = 0;
                          do
                          {
                            if (v26 == 1 || !asl_msg_lookup())
                            {
                              if (*(_DWORD *)(*(void *)(*((void *)&xmmword_100022408 + 1) + 8 * v39) + 8)) {
                                uint64_t v40 = "enabled";
                              }
                              else {
                                uint64_t v40 = "disabled";
                              }
                              snprintf((char *)&atoken, 0x100uLL, "%s", v40);
                              asl_msg_set_key_val();
                            }
                            ++v39;
                          }
                          while (v39 < dword_100022400);
                        }
                        sub_100005A84(v20, v25, v26 == 1);
                        if (!asl_msg_lookup())
                        {
                          if (v42) {
                            int v41 = -1;
                          }
                          else {
                            int v41 = sub_100005090(v49);
                          }
                          snprintf((char *)&atoken, 0x100uLL, "%d", v41);
                          asl_msg_set_key_val();
                        }
                        asl_msg_release();
                        int v35 = 0;
                        uint64_t v48 = v23;
                        goto LABEL_31;
                      }
LABEL_97:
                      if (!asl_msg_lookup())
                      {
                        snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(qword_100022458));
                        asl_msg_set_key_val();
                      }
                      if (asl_msg_lookup()) {
                        goto LABEL_101;
                      }
                      goto LABEL_100;
                    }
LABEL_92:
                    if (!asl_msg_lookup())
                    {
                      snprintf((char *)&atoken, 0x100uLL, "%d", dword_100022350);
                      asl_msg_set_key_val();
                    }
                    if (asl_msg_lookup()) {
                      goto LABEL_97;
                    }
                    goto LABEL_95;
                  }
LABEL_87:
                  if (!asl_msg_lookup())
                  {
                    snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_100022388));
                    asl_msg_set_key_val();
                  }
                  if (asl_msg_lookup()) {
                    goto LABEL_92;
                  }
                  goto LABEL_90;
                }
LABEL_82:
                if (!asl_msg_lookup())
                {
                  snprintf((char *)&atoken, 0x100uLL, "%d", dword_100022380);
                  asl_msg_set_key_val();
                }
                if (asl_msg_lookup()) {
                  goto LABEL_87;
                }
                goto LABEL_85;
              }
LABEL_77:
              if (!asl_msg_lookup())
              {
                snprintf((char *)&atoken, 0x100uLL, "%lld", qword_100022480);
                asl_msg_set_key_val();
              }
              if (asl_msg_lookup()) {
                goto LABEL_82;
              }
              goto LABEL_80;
            }
LABEL_72:
            if (!asl_msg_lookup())
            {
              snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_100022470);
              asl_msg_set_key_val();
            }
            if (asl_msg_lookup()) {
              goto LABEL_77;
            }
            goto LABEL_75;
          }
LABEL_67:
          if (!asl_msg_lookup())
          {
            snprintf((char *)&atoken, 0x100uLL, "%llu", (void)xmmword_100022460);
            asl_msg_set_key_val();
          }
          if (asl_msg_lookup()) {
            goto LABEL_72;
          }
          goto LABEL_70;
        }
LABEL_62:
        if (!asl_msg_lookup())
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(xmmword_100022448));
          asl_msg_set_key_val();
        }
        if (asl_msg_lookup()) {
          goto LABEL_67;
        }
        goto LABEL_65;
      }
      asl_msg_list_release();
    }
    int v35 = 9;
    goto LABEL_31;
  }
  pid_t v27 = pidp;
  if (pidp <= 0)
  {
    int v30 = euidp[0];
  }
  else
  {
    uint64_t v28 = (void *)xpc_copy_entitlement_for_token();
    if (v28)
    {
      uint64_t v29 = v28;
      if (xpc_dictionary_get_BOOL(v28, "com.apple.asl.access_as_root"))
      {
        euidp[0] = 0;
      }
      else
      {
        xpc_object_t value = xpc_dictionary_get_value(v29, "com.apple.asl.access_as_uid");
        if (value)
        {
          uint64_t v32 = value;
          if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_int64) {
            euidp[0] = xpc_int64_get_value(v32);
          }
        }
        xpc_object_t v33 = xpc_dictionary_get_value(v29, "com.apple.asl.access_as_gid");
        if (v33)
        {
          uint64_t v34 = v33;
          if (xpc_get_type(v33) == (xpc_type_t)&_xpc_type_int64) {
            gid_t egidp = xpc_int64_get_value(v34);
          }
        }
      }
      xpc_release(v29);
    }
    int v30 = euidp[0];
    if (!euidp[0]) {
      pid_t v27 = 0;
    }
  }
  int v35 = sub_10000BD18(v18, (uint64_t)&v48, a3, a4, a5, a6, (uint64_t)a9, v30, egidp, v27);
LABEL_31:
  *a10 = v35;
  asl_msg_list_release();
  if (*a10 == 2)
  {
    if (v48) {
      asl_msg_list_release();
    }
  }
  else
  {
    euidp[1] = 0;
    uint64_t v36 = (void *)asl_msg_list_to_string();
    asl_msg_list_release();
    if (v36 && euidp[1])
    {
      if (vm_allocate(mach_task_self_, (vm_address_t *)&euidp[2], euidp[1], 1358954497))
      {
        free(v36);
        int v17 = 9999;
        goto LABEL_4;
      }
      memmove(*(void **)&euidp[2], v36, euidp[1]);
      free(v36);
      *uint64_t v43 = *(void *)&euidp[2];
      *uint64_t v44 = euidp[1];
    }
  }
}

uint64_t sub_10000D15C(int a1, vm_address_t address, vm_size_t size, uint64_t a4, int a5, int a6, int a7, void *a8, _DWORD *a9, long long a10, _OWORD *a11)
{
  return 0;
}

uint64_t sub_10000D1B4(int a1, vm_address_t address, uint64_t size, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (address)
  {
    int v8 = size;
    vm_size_t v10 = size;
    if (*(unsigned char *)(address + (size - 1)))
    {
LABEL_7:
      vm_deallocate(mach_task_self_, address, v10);
      return 0;
    }
    sub_100009A44("__asl_server_message: %s\n", address, size, (uint64_t)a4, a5, a6, a7, a8, address);
    if ((uint64_t)(xmmword_100022388 + v10) > qword_100022480)
    {
      sub_100009A44("Server queue dropped message.  message size %u  queue size %lld  max %lld\n", v12, v13, v14, v15, v16, v17, v18, v8);
      snprintf((char *)__str, 0x100uLL, "[Sender syslogd] [Level 2] [PID %u] [Message Received message size %u overflows work queue (size %lld limit %lld) - dropping message] [UID 0] [UID 0] [Facility syslog]", dword_10002237C, v8, (void)xmmword_100022388, qword_100022480);
      sub_10000A6C8((uint64_t)__str);
      goto LABEL_7;
    }
    long long v19 = malloc_type_malloc(v10, 0x7CE31C45uLL);
    if (!v19) {
      goto LABEL_7;
    }
    uint64_t v20 = v19;
    memcpy(v19, (const void *)address, v10);
    vm_deallocate(mach_task_self_, address, v10);
    gid_t egidp = -1;
    uid_t euidp = -1;
    pid_t pidp = -1;
    long long v21 = a4[1];
    *(_OWORD *)__str[0].val = *a4;
    *(_OWORD *)&__str[0].val[4] = v21;
    audit_token_to_au32(__str, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
    atomic_fetch_add_explicit(&dword_100022380, 1u, memory_order_relaxed);
    atomic_fetch_add_explicit((atomic_ullong *volatile)&xmmword_100022388, v10, memory_order_relaxed);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_10000D3C4;
    block[3] = &unk_10001D078;
    void block[4] = v20;
    int v24 = v8;
    uid_t v25 = euidp;
    gid_t v26 = egidp;
    pid_t v27 = pidp;
    dispatch_async((dispatch_queue_t)qword_1000201F0, block);
  }
  return 0;
}

void sub_10000D3C4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  int v2 = *(_DWORD *)(a1 + 44);
  int v5 = *(_DWORD *)(a1 + 48);
  int v4 = *(_DWORD *)(a1 + 52);
  uint64_t v6 = asl_msg_from_string();
  free(v1);
  atomic_fetch_add_explicit((atomic_ullong *volatile)&xmmword_100022388, -v3, memory_order_relaxed);
  atomic_fetch_add_explicit(&dword_100022380, 0xFFFFFFFF, memory_order_relaxed);
  if (v6)
  {
    mach_port_name_t tn = 0;
    if (!task_name_for_pid(mach_task_self_, v4, &tn)) {
      sub_10000D7F8(tn);
    }
    snprintf(__str, 0x40uLL, "%d", v2);
    asl_msg_set_key_val();
    snprintf(__str, 0x40uLL, "%d", v5);
    asl_msg_set_key_val();
    snprintf(__str, 0x40uLL, "%d", v4);
    asl_msg_set_key_val();
    sub_100009814(v6, 5);
  }
}

uint64_t sub_10000D520(int a1, vm_address_t address, uint64_t size, _DWORD *a4, vm_address_t *a5, _DWORD *a6, int *a7, _OWORD *a8)
{
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  if (!address) {
    goto LABEL_4;
  }
  unsigned int v9 = size;
  if (*(unsigned char *)(address + (size - 1)))
  {
    vm_deallocate(mach_task_self_, address, size);
LABEL_4:
    int v11 = 1;
LABEL_5:
    *a7 = v11;
    return 0;
  }
  sub_100009A44("__asl_server_create_aux_link: %s\n", address, size, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, address);
  if ((xmmword_100022448 & 1) == 0)
  {
    vm_deallocate(mach_task_self_, address, v9);
    int v11 = 2;
    goto LABEL_5;
  }
  uint64_t v16 = asl_msg_from_string();
  vm_deallocate(mach_task_self_, address, v9);
  if (v16)
  {
    vm_address_t addressa = 0;
    __s = 0;
    gid_t egidp = -1;
    uid_t euidp = -1;
    pid_t pidp = -1;
    long long v17 = a8[1];
    *(_OWORD *)atoken.val = *a8;
    *(_OWORD *)&atoken.val[4] = v17;
    audit_token_to_au32(&atoken, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
    mach_port_name_t tn = 0;
    if (!task_name_for_pid(mach_task_self_, pidp, &tn)) {
      sub_10000D7F8(tn);
    }
    snprintf((char *)&atoken, 0x40uLL, "%d", euidp);
    asl_msg_set_key_val();
    snprintf((char *)&atoken, 0x40uLL, "%d", egidp);
    asl_msg_set_key_val();
    snprintf((char *)&atoken, 0x40uLL, "%d", pidp);
    asl_msg_set_key_val();
    *a7 = asl_store_open_aux();
    asl_msg_release();
    if (!*a7)
    {
      if (__s)
      {
        int v18 = fileport_makeport();
        close(0);
        long long v19 = __s;
        if ((v18 & 0x80000000) == 0)
        {
          vm_size_t v20 = strlen(__s) + 1;
          *a6 = v20;
          if (!vm_allocate(mach_task_self_, &addressa, v20, 1358954497))
          {
            memmove((void *)addressa, __s, *a6);
            free(__s);
            *a5 = addressa;
            return 0;
          }
          long long v19 = __s;
        }
        free(v19);
      }
      else
      {
        close(0);
      }
      int v11 = 9999;
      goto LABEL_5;
    }
  }
  return 0;
}

uint64_t sub_10000D7F8(uint64_t name)
{
  if (name)
  {
    mach_port_name_t v1 = name;
    if (dword_10002235C)
    {
      if (dword_100020218)
      {
        int v2 = (int *)qword_100020220;
        uint64_t v3 = dword_100020218;
        while (1)
        {
          int v4 = *v2++;
          if (v4 == name) {
            break;
          }
          if (!--v3)
          {
            int v5 = reallocf((void *)qword_100020220, 4 * (dword_100020218 + 1));
            goto LABEL_9;
          }
        }
      }
      else
      {
        int v5 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
LABEL_9:
        qword_100020220 = (uint64_t)v5;
        if (v5)
        {
          int v13 = dword_100020218;
          v5[dword_100020218] = v1;
          dword_100020218 = v13 + 1;
          sub_100009A44("register_session: %u   PID %d\n", v6, v7, v8, v9, v10, v11, v12, v1);
          mach_port_t previous = 0;
          mach_port_request_notification(mach_task_self_, v1, 72, 0, dword_10002235C, 0x15u, &previous);
          mach_port_deallocate(mach_task_self_, previous);
          return sub_1000090A8();
        }
      }
    }
    mach_port_t v14 = mach_task_self_;
    return mach_port_deallocate(v14, v1);
  }
  return name;
}

uint64_t sub_10000D940(uint64_t a1, __int16 a2, _OWORD *a3)
{
  pid_t pidp = -1;
  long long v4 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  sub_100009A44("__asl_server_register_direct_watch: pid %u port %hu\n", v5, v6, v7, v8, v9, v10, v11, pidp);
  if (qword_1000201C8 != -1) {
    dispatch_once(&qword_1000201C8, &stru_10001D0B8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000DA6C;
  block[3] = &unk_10001D0D8;
  __int16 v14 = a2;
  dispatch_async((dispatch_queue_t)qword_1000201D0, block);
  return 0;
}

void sub_10000DA40(id a1)
{
  qword_1000201D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

void sub_10000DA6C(uint64_t a1)
{
  __int16 v1 = *(_WORD *)(a1 + 32);
  if (v1)
  {
    int v2 = socket(2, 1, 0);
    if ((v2 & 0x80000000) == 0)
    {
      int v3 = v2;
      v13.sa_len = 0;
      *(void *)&v13.sa_data[6] = 0;
      v13.sa_family = 2;
      *(_WORD *)v13.sa_data = v1;
      *(_DWORD *)&v13.sa_data[2] = 16777343;
      if (!connect(v2, &v13, 0x10u))
      {
        int v12 = 1;
        setsockopt(v3, 0xFFFF, 4130, &v12, 4u);
        int v12 = 1;
        setsockopt(v3, 6, 1, &v12, 4u);
        int v4 = fcntl(v3, 3, 0);
        LODWORD(v5) = v4 | 4;
        if (v4 == -1) {
          uint64_t v5 = 4;
        }
        else {
          uint64_t v5 = v5;
        }
        fcntl(v3, 4, v5);
        if (dword_1000201D8)
        {
          unsigned int v6 = dword_1000201D8 + 1;
          uint64_t v7 = reallocf((void *)qword_100020208, 4 * (dword_1000201D8 + 1));
          qword_100020208 = (uint64_t)v7;
          uint64_t v8 = reallocf((void *)qword_100020210, 2 * v6);
        }
        else
        {
          qword_100020208 = (uint64_t)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
          uint64_t v8 = malloc_type_calloc(1uLL, 2uLL, 0x1000040BDFB0063uLL);
          uint64_t v7 = (_DWORD *)qword_100020208;
        }
        qword_100020210 = (uint64_t)v8;
        if (v7 && v8)
        {
          uint64_t v9 = dword_1000201D8;
          v7[dword_1000201D8] = v3;
          v8[v9] = v1;
          int v10 = v9 + 1;
          int v11 = DWORD2(xmmword_100022368) + v10;
        }
        else
        {
          close(v3);
          free((void *)qword_100020208);
          qword_100020208 = 0;
          free((void *)qword_100020210);
          int v10 = 0;
          qword_100020210 = 0;
          int v11 = SDWORD2(xmmword_100022368) > 0;
        }
        dword_1000201D8 = v10;
        HIDWORD(xmmword_100022368) = v11;
      }
    }
  }
}

uint64_t sub_10000DC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = a2;
  sub_100009A44("__asl_server_cancel_direct_watch: %hu\n", a2, a3, a4, a5, a6, a7, a8, bswap32(a2) >> 16);
  if (qword_1000201C8 != -1) {
    dispatch_once(&qword_1000201C8, &stru_10001D118);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000DD60;
  block[3] = &unk_10001D138;
  __int16 v11 = v8;
  dispatch_async((dispatch_queue_t)qword_1000201D0, block);
  return 0;
}

void sub_10000DD34(id a1)
{
  qword_1000201D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

void sub_10000DD60(uint64_t a1)
{
  int v1 = dword_1000201D8;
  if (dword_1000201D8)
  {
    uint64_t v2 = 0;
    int v3 = (void *)qword_100020210;
    while (*(unsigned __int16 *)(qword_100020210 + 2 * v2) != *(unsigned __int16 *)(a1 + 32))
    {
      if (dword_1000201D8 == ++v2) {
        return;
      }
    }
    if (dword_1000201D8 == 1)
    {
      free((void *)qword_100020208);
      qword_100020208 = 0;
LABEL_13:
      free(v3);
      qword_100020210 = 0;
      dword_1000201D8 = 0;
      HIDWORD(xmmword_100022368) = SDWORD2(xmmword_100022368) > 0;
      return;
    }
    int v4 = (_DWORD *)qword_100020208;
    if ((int)v2 + 1 < dword_1000201D8)
    {
      do
      {
        v4[v2] = v4[v2 + 1];
        *((_WORD *)v3 + v2) = *((_WORD *)v3 + v2 + 1);
        ++v2;
      }
      while (v1 - 1 != v2);
    }
    unsigned int v5 = v1 - 1;
    dword_1000201D8 = v1 - 1;
    HIDWORD(xmmword_100022368) = DWORD2(xmmword_100022368) + v1 - 1;
    unsigned int v6 = reallocf(v4, 4 * (v1 - 1));
    qword_100020208 = (uint64_t)v6;
    uint64_t v7 = reallocf(v3, 2 * v5);
    int v3 = v7;
    qword_100020210 = (uint64_t)v7;
    if (!v6 || !v7)
    {
      free(v6);
      qword_100020208 = 0;
      goto LABEL_13;
    }
  }
}

void sub_10000DE98(int a1)
{
  ssize_t v1 = read(a1, (char *)&unk_100020228 + dword_100021228, 4096 - dword_100021228);
  if (v1 >= 1)
  {
    uint64_t v6 = v1;
    uint64_t v7 = 0;
    int v8 = dword_100021228;
    uint64_t v9 = (char *)&unk_100020228 + dword_100021228;
    unsigned int v10 = dword_100021228 + &unk_100020228;
    __int16 v11 = (char *)&unk_100020228;
    do
    {
      if (v9[v7] == 10)
      {
        v9[v7] = 0;
        int v12 = sub_10000AD60((uint64_t)v11, v10 + v7 - v11, 0, 4, v2, v3, v4, v5);
        sub_100009814((uint64_t)v12, 4);
        __int16 v11 = &v9[v7 + 1];
      }
      ++v7;
    }
    while (v6 > v7);
    if (v11 != (char *)&unk_100020228)
    {
      __memmove_chk();
      dword_100021228 = v8 + &unk_100020228 - v11 + v7;
    }
  }
}

uint64_t sub_10000DF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100021230 != -1) {
    dispatch_once(&qword_100021230, &stru_10001D178);
  }
  sub_100009A44("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"klog_in");
  if (dword_10002002C < 0)
  {
    int v10 = open("/dev/klog", 0, 0);
    dword_10002002C = v10;
    if (v10 < 0)
    {
      __int16 v11 = __error();
      strerror(*v11);
      sub_100009A44("%s: couldn't open %s: %s\n", v12, v13, v14, v15, v16, v17, v18, (char)"klog_in");
      return 0xFFFFFFFFLL;
    }
    if (fcntl(v10, 4, 4) < 0)
    {
      close(dword_10002002C);
      uint64_t v8 = 0xFFFFFFFFLL;
      dword_10002002C = -1;
      long long v19 = __error();
      strerror(*v19);
      sub_100009A44("%s: couldn't set O_NONBLOCK for fd %d (%s): %s\n", v20, v21, v22, v23, v24, v25, v26, (char)"klog_in");
      return v8;
    }
    qword_100021240 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, dword_10002002C, 0, (dispatch_queue_t)qword_100021238);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100021240, &stru_10001D1B8);
    dispatch_resume((dispatch_object_t)qword_100021240);
  }
  return 0;
}

void sub_10000E0E4(id a1)
{
  qword_100021238 = (uint64_t)dispatch_queue_create("klog_in", 0);
}

void sub_10000E110(id a1)
{
}

uint64_t sub_10000E11C()
{
  if (dword_10002002C < 0) {
    return 1;
  }
  dispatch_source_cancel((dispatch_source_t)qword_100021240);
  dispatch_release((dispatch_object_t)qword_100021240);
  qword_100021240 = 0;
  close(dword_10002002C);
  uint64_t result = 0;
  dword_10002002C = -1;
  return result;
}

uint64_t sub_10000E178()
{
  return 0;
}

uint64_t sub_10000E180(int a1)
{
  uint64_t v2 = 0;
  if (a1 == 2)
  {
    asl_memory_statistics(*((uint64_t **)&xmmword_1000223E8 + 1), &v2);
  }
  else if (a1 == 1)
  {
    asl_store_statistics();
  }
  return v2;
}

void sub_10000E1E0(int *a1)
{
  if (!a1) {
    goto LABEL_268;
  }
  *(void *)int out_token = 0;
  int v1 = a1[1];
  unint64_t v2 = *a1;
  free(a1);
  sub_100009A44("%s %d: starting interactive session for %ssocket %d\n", v3, v4, v5, v6, v7, v8, v9, (char)"remote");
  out_token[0] = -1;
  out_token[1] = -1;
  if ((xmmword_100022448 & 2) != 0) {
    int v10 = 2;
  }
  else {
    int v10 = xmmword_100022448 & 1;
  }
  int v165 = v10;
  unint64_t v171 = 0;
  uint64_t v179 = 0;
  uint64_t v180 = 0;
  uint64_t v178 = 0;
  if (v1) {
    sleep(1u);
  }
  v183[0] = 0;
  uint64_t v181 = 0;
  unsigned int v177 = 0;
  uint64_t v176 = 0;
  uint64_t v174 = 0;
  memset(&v173, 0, sizeof(v173));
  memset(&v172, 0, sizeof(v172));
  strcpy(__s, "\n========================\nASL is here to serve you\n");
  size_t v11 = strlen(__s);
  if (write(v2, __s, v11) < 0)
  {
    close(v2);
    goto LABEL_267;
  }
  if (v1)
  {
    strcpy(__s, "> ");
    size_t v12 = strlen(__s);
    if (write(v2, __s, v12) < 0)
    {
      sub_100009A44("%s %d: terminating session for %ssocket %d\n", v13, v14, v15, v16, v17, v18, v19, (char)"remote");
      uint64_t v20 = 0;
      if ((v2 & 0x80000000) == 0)
      {
        uint64_t v166 = 0;
        LODWORD(v21) = 0;
        goto LABEL_257;
      }
      goto LABEL_263;
    }
  }
  uint64_t v22 = 0;
  unint64_t v167 = 0;
  int v23 = 0;
  int v169 = 1 << v2;
  unint64_t v168 = v2 >> 5;
  uint64_t v166 = 0;
  int v24 = 1;
  while (1)
  {
    do
    {
      do
      {
LABEL_14:
        int v170 = v23;
        uint64_t v21 = v22;
        if ((v1 & 1) == 0)
        {
          if (v24)
          {
            strcpy(__s, "> ");
            size_t v25 = strlen(__s);
            if (write(v2, __s, v25) < 0) {
              goto LABEL_255;
            }
          }
        }
        bzero(__s, 0x400uLL);
        memset(&v173, 0, sizeof(v173));
        if (__darwin_check_fd_set_overflow(v2, &v173, 0)) {
          v173.fds_bits[v168] |= v169;
        }
        memset(&v172, 0, sizeof(v172));
        if (__darwin_check_fd_set_overflow(v2, &v172, 0)) {
          v172.fds_bits[v168] |= v169;
        }
        unint64_t v33 = out_token[1];
        int v34 = v2;
        if (out_token[1] != -1)
        {
          if (__darwin_check_fd_set_overflow(out_token[1], &v173, 0)) {
            *(__int32_t *)((char *)v173.fds_bits + ((v33 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v33;
          }
          int v34 = out_token[1];
          if (out_token[1] <= (int)v2) {
            int v34 = v2;
          }
        }
        int v35 = select(v34 + 1, &v173, 0, &v172, 0);
        int v24 = 1;
        uint64_t v22 = v21;
        int v23 = v170;
      }
      while (!v35);
      if (v35 < 0)
      {
        __error();
        uint64_t v149 = __error();
        strerror(*v149);
        sub_100009A44("%s %d: select %d %s\n", v150, v151, v152, v153, v154, v155, v156, (char)"remote");
        goto LABEL_255;
      }
      if (__darwin_check_fd_set_overflow(v2, &v172, 0) && (v172.fds_bits[v168] & v169) != 0)
      {
        sub_100009A44("%s %d: error on socket %d\n", v36, v37, v38, v39, v40, v41, v42, (char)"remote");
        goto LABEL_255;
      }
      unint64_t v43 = out_token[1];
      if (out_token[1] != -1
        && __darwin_check_fd_set_overflow(out_token[1], &v173, 0)
        && ((*(unsigned int *)((char *)v173.fds_bits + ((v43 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v43) & 1) != 0)
      {
        read(out_token[1], v183, 4uLL);
      }
      if (__darwin_check_fd_set_overflow(v2, &v172, 0) && (v172.fds_bits[v168] & v169) != 0)
      {
        sub_100009A44("%s %d: socket %d reported error\n", v44, v45, v46, v47, v48, v49, v50, (char)"remote");
        goto LABEL_255;
      }
      if (!__darwin_check_fd_set_overflow(v2, &v173, 0) || (v173.fds_bits[v168] & v169) == 0) {
        goto LABEL_203;
      }
      ssize_t v51 = read(v2, __s, 0x3FFuLL);
      if (v51 < 1)
      {
        __error();
        uint64_t v157 = __error();
        strerror(*v157);
        sub_100009A44("%s %d: read error on socket %d: %d %s\n", v158, v159, v160, v161, v162, v163, v164, (char)"remote");
        goto LABEL_255;
      }
      if (v51 != 1)
      {
        do
        {
          int v52 = __s[v51 - 1];
          if (v52 != 13 && v52 != 10) {
            break;
          }
          __s[v51 - 1] = 0;
        }
        while ((unint64_t)v51-- > 2);
      }
      if (*(unsigned __int16 *)__s == 113
        || !(*(_DWORD *)__s ^ 0x74697571 | __s[4])
        || !(*(_DWORD *)__s ^ 0x74697865 | __s[4]))
      {
        strcpy(__s, "Goodbye\n");
        size_t v140 = strlen(__s);
        write(v2, __s, v140);
        close(v2);
        sub_100009A44("%s %d: terminating session for %ssocket %d\n", v141, v142, v143, v144, v145, v146, v147, (char)"remote");
        goto LABEL_260;
      }
      if (*(unsigned __int16 *)__s == 63 || !(*(_DWORD *)__s ^ 0x706C6568 | __s[4]))
      {
        strcpy(__s, "Commands\n");
        size_t v60 = strlen(__s);
        if (write(v2, __s, v60) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    quit                 exit session\n");
        size_t v61 = strlen(__s);
        if (write(v2, __s, v61) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    select [val]         get [set] current database\n");
        size_t v62 = strlen(__s);
        if (write(v2, __s, v62) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "                         val must be \"file\" or \"mem\"\n");
        size_t v63 = strlen(__s);
        if (write(v2, __s, v63) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    file [on/off]        enable / disable file store\n");
        size_t v64 = strlen(__s);
        if (write(v2, __s, v64) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    memory [on/off]      enable / disable memory store\n");
        size_t v65 = strlen(__s);
        if (write(v2, __s, v65) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    stats                database statistics\n");
        size_t v66 = strlen(__s);
        if (write(v2, __s, v66) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    flush                flush database\n");
        size_t v67 = strlen(__s);
        if (write(v2, __s, v67) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    dbsize [val]         get [set] database size (# of records)\n");
        size_t v68 = strlen(__s);
        if (write(v2, __s, v68) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    watch                print new messages as they arrive\n");
        size_t v69 = strlen(__s);
        if (write(v2, __s, v69) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    stop                 stop watching for new messages\n");
        size_t v70 = strlen(__s);
        if (write(v2, __s, v70) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    raw                  use raw format for printing messages\n");
        size_t v71 = strlen(__s);
        if (write(v2, __s, v71) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    std                  use standard format for printing messages\n");
        size_t v72 = strlen(__s);
        if (write(v2, __s, v72) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    *                    show all log messages\n");
        size_t v73 = strlen(__s);
        if (write(v2, __s, v73) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    * key val            equality search for messages (single key/value pair)\n");
        size_t v74 = strlen(__s);
        if (write(v2, __s, v74) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    * op key val         search for matching messages (single key/value pair)\n");
        size_t v75 = strlen(__s);
        if (write(v2, __s, v75) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "    * [op key val] ...   search for matching messages (multiple key/value pairs)\n");
        size_t v76 = strlen(__s);
        if (write(v2, __s, v76) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "                         operators:  =  <  >  ! (not equal)  T (key exists)  R (regex)\n");
        size_t v77 = strlen(__s);
        if (write(v2, __s, v77) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "                         modifiers (must follow operator):\n");
        size_t v78 = strlen(__s);
        if (write(v2, __s, v78) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "                                 C=casefold  N=numeric  S=substring  A=prefix  Z=suffix\n");
        size_t v79 = strlen(__s);
        if (write(v2, __s, v79) < 0) {
          goto LABEL_255;
        }
        strcpy(__s, "\n");
        goto LABEL_89;
      }
      if (*(_DWORD *)__s == 1952543859 && *(unsigned __int16 *)&__s[4] == 115)
      {
        sub_10000E180(v165);
        uint64_t v82 = (void *)asl_format_message();
        write(v2, v82, v177);
        free(v82);
        asl_msg_release();
        int v24 = 1;
        uint64_t v22 = v21;
        int v23 = v170;
        goto LABEL_14;
      }
      if (*(_DWORD *)__s == 1937075302 && *(unsigned __int16 *)&__s[4] == 104) {
        goto LABEL_203;
      }
      if (*(_DWORD *)__s == 1701602675 && *(unsigned __int16 *)&__s[4] == 29795)
      {
        for (unint64_t i = &__s[6]; ; ++i)
        {
          int v84 = *i;
          if (v84 != 9 && v84 != 32) {
            break;
          }
        }
        if (!*i)
        {
          if (v165 == 1)
          {
            strcpy(__s, "file store\n");
          }
          else if (v165)
          {
            strcpy(__s, "memory store\n");
          }
          else
          {
            strcpy(__s, "no store\n");
          }
          goto LABEL_89;
        }
        if (strncmp(i, "file", 4uLL))
        {
          if (strncmp(i, "mem", 3uLL))
          {
            strcpy(__s, "unknown database type\n");
            goto LABEL_161;
          }
          if ((xmmword_100022448 & 2) == 0)
          {
            strcpy(__s, "memory database is not enabled\n");
            goto LABEL_89;
          }
          int v165 = 2;
LABEL_181:
          strcpy(__s, "OK\n");
          goto LABEL_89;
        }
        if (xmmword_100022448)
        {
          int v165 = 1;
          goto LABEL_181;
        }
        strcpy(__s, "file database is not enabled\n");
LABEL_161:
        size_t v103 = strlen(__s);
        ssize_t v81 = write(v2, __s, v103);
        int v24 = 1;
        uint64_t v22 = v21;
LABEL_92:
        int v23 = v170;
        if (v81 < 0) {
          goto LABEL_255;
        }
        goto LABEL_14;
      }
      if (*(_DWORD *)__s == 1701603686)
      {
        for (uint64_t j = &__s[4]; ; ++j)
        {
          int v59 = *j;
          if (v59 != 9 && v59 != 32) {
            break;
          }
        }
        if (!*j)
        {
          uint64_t v91 = (const char *)&unk_100019287;
          if ((xmmword_100022448 & 1) == 0) {
            uint64_t v91 = "not ";
          }
          snprintf(__s, 0x400uLL, "file database is %senabled\n", v91);
          size_t v92 = strlen(__s);
          if (write(v2, __s, v92) < 0) {
            goto LABEL_255;
          }
          int v93 = v165;
          if (xmmword_100022448) {
            int v93 = 1;
          }
LABEL_149:
          int v165 = v93;
          int v24 = 1;
          uint64_t v22 = v21;
          int v23 = v170;
          goto LABEL_14;
        }
        if (!strcmp(j, "on"))
        {
          int v94 = xmmword_100022448 | 1;
        }
        else
        {
          if (strcmp(j, "off")) {
            goto LABEL_181;
          }
          int v94 = xmmword_100022448 & 0xFFFFFFFE;
        }
        goto LABEL_180;
      }
      if (*(_DWORD *)__s == 1869440365 && *(unsigned __int16 *)&__s[4] == 31090)
      {
        for (k = &__s[6]; ; ++k)
        {
          int v96 = *k;
          if (v96 != 9 && v96 != 32) {
            break;
          }
        }
        if (!*k)
        {
          uint64_t v97 = (const char *)&unk_100019287;
          if ((xmmword_100022448 & 2) == 0) {
            uint64_t v97 = "not ";
          }
          snprintf(__s, 0x400uLL, "memory database is %senabled\n", v97);
          size_t v98 = strlen(__s);
          if (write(v2, __s, v98) < 0) {
            goto LABEL_255;
          }
          int v93 = v165;
          if ((xmmword_100022448 & 2) != 0) {
            int v93 = 2;
          }
          goto LABEL_149;
        }
        if (!strcmp(k, "on"))
        {
          int v94 = xmmword_100022448 | 2;
        }
        else
        {
          if (strcmp(k, "off")) {
            goto LABEL_181;
          }
          int v94 = xmmword_100022448 & 0xFFFFFFFD;
        }
LABEL_180:
        LODWORD(xmmword_100022448) = v94;
        goto LABEL_181;
      }
      if (*(_DWORD *)__s == 1769169508 && *(unsigned __int16 *)&__s[4] == 25978)
      {
        uint64_t v99 = &__s[6];
        if (!v165)
        {
          strcpy(__s, "no store\n");
          size_t v100 = strlen(__s);
          ssize_t v81 = write(v2, __s, v100);
          int v165 = 0;
LABEL_90:
          int v24 = 1;
LABEL_91:
          uint64_t v22 = v21;
          goto LABEL_92;
        }
        while (1)
        {
          int v101 = *(unsigned __int8 *)v99;
          if (v101 != 9 && v101 != 32) {
            break;
          }
          ++v99;
        }
        if (*v99)
        {
          int v105 = atoi(v99);
          v183[0] = v105;
          if (v165 == 2)
          {
            DWORD2(xmmword_100022448) = v105;
          }
          else if (v165 == 1)
          {
            DWORD1(xmmword_100022448) = v105;
          }
          goto LABEL_181;
        }
        if (v165 == 2)
        {
          int v102 = DWORD2(xmmword_100022448);
        }
        else if (v165 == 1)
        {
          int v102 = DWORD1(xmmword_100022448);
        }
        else
        {
          int v102 = 0;
        }
        snprintf(__s, 0x400uLL, "DB size %u\n", v102);
LABEL_89:
        size_t v80 = strlen(__s);
        ssize_t v81 = write(v2, __s, v80);
        goto LABEL_90;
      }
      if (!(*(_DWORD *)__s ^ 0x706F7473 | __s[4]))
      {
        if (v21)
        {
          notify_cancel(out_token[0]);
          out_token[0] = -1;
          out_token[1] = -1;
          unint64_t v171 = 0;
          if (v166) {
            free(v166);
          }
          strcpy(__s, "OK\n");
          size_t v104 = strlen(__s);
          ssize_t v81 = write(v2, __s, v104);
          uint64_t v22 = 0;
          uint64_t v166 = 0;
          unint64_t v167 = 0;
          LODWORD(v21) = 0;
        }
        else
        {
          strcpy(__s, "not watching!\n");
          size_t v106 = strlen(__s);
          ssize_t v81 = write(v2, __s, v106);
          uint64_t v22 = 0;
        }
        int v24 = 1;
        goto LABEL_92;
      }
      if (*(_DWORD *)__s == 6583411)
      {
        int v23 = 0;
        int v24 = 1;
        uint64_t v22 = v21;
        goto LABEL_14;
      }
      int v24 = 1;
      uint64_t v22 = v21;
      int v23 = 1;
    }
    while (*(_DWORD *)__s == 7823730);
    if (*(_DWORD *)__s == 1668571511 && *(unsigned __int16 *)&__s[4] == 104) {
      break;
    }
    int v88 = __s[0];
    if (__s[0] - 33 > 0x33 || ((1 << (__s[0] - 33)) & 0x8000038000201) == 0)
    {
      strcpy(__s, "unrecognized command\n");
      size_t v137 = strlen(__s);
      if (write(v2, __s, v137) < 0) {
        goto LABEL_255;
      }
      strcpy(__s, "enter \"help\" for help\n");
      goto LABEL_249;
    }
    uint64_t v178 = 0;
    uint64_t v179 = 0;
    uint64_t v180 = 0;
    if (v166)
    {
      free(v166);
      int v88 = __s[0];
    }
    for (m = (unsigned char *)((unint64_t)__s | (v88 == 42)); ; ++m)
    {
      unsigned int v90 = *m;
      if (v90 > 0x51)
      {
        if (v90 == 82 || v90 == 84)
        {
LABEL_201:
          uint64_t v174 = 0;
          asprintf(&v174, "Q [%s]");
        }
        else if (v90 == 91)
        {
          uint64_t v174 = 0;
          asprintf(&v174, "Q %s");
        }
        else
        {
LABEL_250:
          uint64_t v174 = 0;
          asprintf(&v174, "Q [= %s]");
        }
        uint64_t v166 = (void *)asl_msg_from_string();
        free(v174);
LABEL_203:
        int v107 = 0;
        int v109 = 1;
        goto LABEL_204;
      }
      if (v90 > 0x3E) {
        goto LABEL_250;
      }
      if (((1 << v90) & 0x100000200) == 0) {
        break;
      }
    }
    if (((1 << v90) & 0x7000000200000000) != 0) {
      goto LABEL_201;
    }
    if (*m) {
      goto LABEL_250;
    }
    int v107 = 0;
    uint64_t v166 = 0;
    BOOL v108 = v21 == 2;
    int v24 = 1;
    if (v1)
    {
      uint64_t v22 = 2;
      int v23 = v170;
      if (v21 == 2) {
        continue;
      }
    }
LABEL_209:
    if (v21) {
      unint64_t v110 = v167;
    }
    else {
      unint64_t v110 = 0;
    }
    uint64_t v181 = 0;
    unint64_t v171 = 0;
    sub_10000BD18((uint64_t)&v178, (uint64_t)&v181, v110, 0, 0, 0, (uint64_t)&v171, 0, 0, 0);
    if (v171 >= v110) {
      unint64_t v111 = v171 + 1;
    }
    else {
      unint64_t v111 = v110;
    }
    if (!v108) {
      unint64_t v111 = v110;
    }
    unint64_t v167 = v111;
    uint64_t v112 = v181;
    if (v181)
    {
      if (v170)
      {
        if (v108 && (strcpy(__s, "\n"), size_t v113 = strlen(__s), write(v2, __s, v113) < 0))
        {
          LODWORD(v21) = 2;
        }
        else
        {
          unsigned int v177 = 0;
          uint64_t v114 = (void *)asl_msg_list_to_string();
          write(v2, v114, v177);
          free(v114);
          strcpy(__s, "\n");
          size_t v115 = strlen(__s);
          if ((write(v2, __s, v115) & 0x8000000000000000) == 0) {
            goto LABEL_237;
          }
        }
LABEL_255:
        sub_100009A44("%s %d: terminating session for %ssocket %d\n", v26, v27, v28, v29, v30, v31, v32, (char)"remote");
        if ((v2 & 0x80000000) == 0)
        {
          if (v1) {
LABEL_257:
          }
            sub_10000B118(v2);
LABEL_258:
          close(v2);
        }
LABEL_260:
        if (v21 == 1) {
          dispatch_resume((dispatch_object_t)qword_1000223D0);
        }
        uint64_t v20 = v166;
LABEL_263:
        if ((out_token[0] & 0x80000000) == 0)
        {
          v148 = v20;
          notify_cancel(out_token[0]);
          uint64_t v20 = v148;
        }
        if (v20) {
          asl_msg_release();
        }
LABEL_267:
        a1 = 0;
LABEL_268:
        pthread_exit(a1);
      }
      uint64_t v21 = v21;
      if ((v21 - 1) <= 1)
      {
        strcpy(__s, "\n");
        size_t v116 = strlen(__s);
        if (write(v2, __s, v116) < 0) {
          goto LABEL_255;
        }
        uint64_t v112 = v181;
      }
      strcpy(__s, "\n");
      v183[0] = 0;
      if (*(_DWORD *)(v112 + 8))
      {
LABEL_229:
        uint64_t v117 = (void *)asl_format_message();
        while (1)
        {
          *__error() = 0;
          if ((write(v2, v117, v177) & 0x80000000) != 0)
          {
            __error();
            int v118 = __error();
            strerror(*v118);
            sub_100009A44("%s %d: %d/%d write data failed: %d %s\n", v119, v120, v121, v122, v123, v124, v125, (char)"remote");
            if (*__error() != 35)
            {
              free(v117);
              asl_msg_list_release();
              uint64_t v181 = 0;
              goto LABEL_255;
            }
            usleep(0x2710u);
          }
          if (*__error() != 35)
          {
            free(v117);
            if (HIDWORD(qword_100022458)) {
              usleep(HIDWORD(qword_100022458));
            }
            if (++v183[0] >= *(_DWORD *)(v181 + 8))
            {
LABEL_237:
              uint64_t v21 = v21;
              break;
            }
            goto LABEL_229;
          }
        }
      }
LABEL_238:
      asl_msg_list_release();
      uint64_t v22 = v21;
      int v23 = v170;
      if (v21 == 1)
      {
        sub_10000AFBC(v2);
        dispatch_resume((dispatch_object_t)qword_1000223D0);
        uint64_t v22 = 2;
        int v23 = v170;
      }
    }
    else
    {
      if (v21)
      {
        int v24 = v107;
        goto LABEL_238;
      }
      strcpy(__s, "-nil-\n");
      size_t v126 = strlen(__s);
      if (write(v2, __s, v126) < 0)
      {
        LODWORD(v21) = 0;
        goto LABEL_255;
      }
      asl_msg_list_release();
      uint64_t v22 = 0;
      int v24 = 1;
      int v23 = v170;
    }
  }
  if ((v1 & 1) == 0 && v21)
  {
    strcpy(__s, "already watching!\n");
LABEL_249:
    size_t v138 = strlen(__s);
    ssize_t v81 = write(v2, __s, v138);
    goto LABEL_91;
  }
  if (v1)
  {
    dispatch_suspend((dispatch_object_t)qword_1000223D0);
    uint64_t v21 = 1;
  }
  else
  {
    uint32_t v127 = notify_register_file_descriptor("com.apple.system.logger.message", &out_token[1], 0, out_token);
    if (v127)
    {
      snprintf(__s, 0x400uLL, "notify_register_file_descriptor failed: %d\n", v127);
      size_t v128 = strlen(__s);
      ssize_t v129 = write(v2, __s, v128);
      uint64_t v22 = v21;
      int v23 = v170;
      if (v129 < 0)
      {
        sub_100009A44("%s %d: terminating session for %ssocket %d\n", v130, v131, v132, v133, v134, v135, v136, (char)"remote");
        if ((v2 & 0x80000000) == 0) {
          goto LABEL_258;
        }
        goto LABEL_260;
      }
      goto LABEL_14;
    }
    uint64_t v21 = 2;
  }
  strcpy(__s, "OK\n");
  size_t v139 = strlen(__s);
  if (write(v2, __s, v139) < 0) {
    goto LABEL_255;
  }
  int v107 = 2;
  int v109 = 2;
LABEL_204:
  BOOL v108 = v21 == 2;
  if ((v1 & 1) == 0 || (v24 = 1, v22 = 2, int v23 = v170, v21 != 2))
  {
    if (v166)
    {
      LODWORD(v179) = 1;
      uint64_t v176 = v166;
      int v24 = v109;
      uint64_t v180 = &v176;
    }
    else
    {
      uint64_t v166 = 0;
      int v24 = v109;
    }
    goto LABEL_209;
  }
  goto LABEL_14;
}

uint64_t sub_10000F914(int a1, int a2)
{
  memset(&v45, 0, sizeof(v45));
  pthread_t v33 = 0;
  if (a2 == 1) {
    socklen_t v3 = 128;
  }
  else {
    socklen_t v3 = 106;
  }
  socklen_t v36 = v3;
  sockaddr v37 = (sockaddr)0;
  long long v38 = 0uLL;
  long long v39 = 0uLL;
  long long v40 = 0uLL;
  long long v41 = 0uLL;
  long long v42 = 0uLL;
  long long v43 = 0uLL;
  long long v44 = 0uLL;
  int v4 = accept(a1, &v37, &v36);
  if (v4 == -1)
  {
    uint64_t v8 = __error();
    strerror(*v8);
    sub_100009A44("%s: accept: %s\n", v9, v10, v11, v12, v13, v14, v15, (char)"remote");
    return 0;
  }
  int v5 = v4;
  unsigned int v35 = fcntl(v4, 3, 0) & 0xFFFFFFFB;
  if (fcntl(v5, 4, v35) < 0)
  {
    uint64_t v16 = __error();
    strerror(*v16);
    sub_100009A44("%s: fcntl: %s\n", v17, v18, v19, v20, v21, v22, v23, (char)"remote");
LABEL_15:
    close(v5);
    return 0;
  }
  int v34 = 1;
  setsockopt(v5, 0xFFFF, 4130, &v34, 4u);
  if (a2 == 1)
  {
    unsigned int v35 = 1;
    setsockopt(v5, 6, 1, &v35, 4u);
  }
  uint64_t v6 = malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
  if (!v6)
  {
    int v24 = __error();
    strerror(*v24);
    sub_100009A44("%s: malloc: %s\n", v25, v26, v27, v28, v29, v30, v31, (char)"remote");
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  _DWORD *v6 = v5;
  if (!a2) {
    v6[1] |= 1u;
  }
  pthread_attr_init(&v45);
  pthread_attr_setdetachstate(&v45, 2);
  pthread_create(&v33, &v45, (void *(__cdecl *)(void *))sub_10000E1E0, v7);
  pthread_attr_destroy(&v45);
  return 0;
}

uint64_t sub_10000FB24()
{
  uint64_t v0 = socket(1, 1, 0);
  if ((v0 & 0x80000000) != 0)
  {
    unint64_t v2 = __error();
    strerror(*v2);
    sub_100009A44("%s: socket: %s\n", v3, v4, v5, v6, v7, v8, v9, (char)"remote");
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = v0;
  int v45 = 1;
  if (setsockopt(v0, 0xFFFF, 512, &v45, 4u) < 0)
  {
    uint64_t v10 = __error();
    strerror(*v10);
    sub_100009A44("%s: setsockopt: %s\n", v11, v12, v13, v14, v15, v16, v17, (char)"remote");
LABEL_12:
    close(v1);
    return 0xFFFFFFFFLL;
  }
  mkdir("/var/run/lockdown", 0x1FFu);
  sockaddr v46 = (sockaddr)0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  memset(v51, 0, sizeof(v51));
  v46.sa_family = 1;
  __strlcpy_chk();
  unlink(v46.sa_data);
  if (bind(v1, &v46, 0x69u) < 0)
  {
    uint64_t v18 = __error();
    strerror(*v18);
    sub_100009A44("%s: bind: %s\n", v19, v20, v21, v22, v23, v24, v25, (char)"remote");
    goto LABEL_12;
  }
  if (fcntl(v1, 4, 4) < 0)
  {
    uint64_t v26 = __error();
    strerror(*v26);
    sub_100009A44("%s: fcntl: %s\n", v27, v28, v29, v30, v31, v32, v33, (char)"remote");
    goto LABEL_12;
  }
  if (listen(v1, 5) < 0)
  {
    int v34 = __error();
    strerror(*v34);
    sub_100009A44("%s: listen: %s\n", v35, v36, v37, v38, v39, v40, v41, (char)"remote");
    goto LABEL_12;
  }
  chmod("/var/run/lockdown/syslog.sock", 0x1B6u);
  qword_100021250 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v1, 0, (dispatch_queue_t)qword_100021248);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10000FD94;
  handler[3] = &unk_10001D1D8;
  int v44 = v1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_100021250, handler);
  dispatch_resume((dispatch_object_t)qword_100021250);
  return v1;
}

uint64_t sub_10000FD94(uint64_t a1)
{
  return sub_10000F914(*(_DWORD *)(a1 + 32), 0);
}

uint64_t sub_10000FDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100021258 != -1) {
    dispatch_once(&qword_100021258, &stru_10001D218);
  }
  sub_100009A44("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"remote");
  dword_100020030 = sub_10000FB24();
  return 0;
}

void sub_10000FE0C(id a1)
{
  qword_100021248 = (uint64_t)dispatch_queue_create("remote", 0);
}

uint64_t sub_10000FE38()
{
  if ((dword_100020030 & 0x80000000) == 0) {
    close(dword_100020030);
  }
  dword_100020030 = -1;
  return 0;
}

uint64_t sub_10000FE70()
{
  return 0;
}

uint64_t sub_10000FE78()
{
  kern_return_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  kern_return_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  kern_return_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  uint64_t v0 = launch_data_new_string("CheckIn");
  qword_100022360 = (uint64_t)launch_msg(v0);
  launch_data_free(v0);
  if (!qword_100022360)
  {
    sub_100009A44("%d launchd checkin failed\n", v1, v2, v3, v4, v5, v6, v7, dword_10002237C);
    goto LABEL_16;
  }
  uint64_t v8 = launch_data_dict_lookup((const launch_data_t)qword_100022360, "MachServices");
  if (!v8)
  {
    sub_100009A44("%d launchd lookup of LAUNCH_JOBKEY_MACHSERVICES failed\n", v9, v10, v11, v12, v13, v14, v15, dword_10002237C);
    goto LABEL_16;
  }
  uint64_t v16 = launch_data_dict_lookup(v8, "com.apple.system.logger");
  if (!v16)
  {
    sub_100009A44("%d launchd lookup of SERVICE_NAME failed\n", v17, v18, v19, v20, v21, v22, v23, dword_10002237C);
    goto LABEL_16;
  }
  dword_100022358 = launch_data_get_machport(v16);
  uint64_t v24 = mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_10002235C);
  if (v24)
  {
    sub_100009A44("mach_port_allocate dead_session_port failed: %d", v25, v26, v27, v28, v29, v30, v31, v24);
    goto LABEL_16;
  }
  uint64_t v32 = mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_100022354);
  if (v32)
  {
    sub_100009A44("mach_port_allocate listen_set failed: %d", v33, v34, v35, v36, v37, v38, v39, v32);
    goto LABEL_16;
  }
  uint64_t v40 = mach_port_move_member(mach_task_self_, dword_100022358, dword_100022354);
  if (v40)
  {
    sub_100009A44("mach_port_move_member server_port failed: %d", v41, v42, v43, v44, v45, v46, v47, v40);
    goto LABEL_16;
  }
  uint64_t result = mach_port_move_member(mach_task_self_, dword_10002235C, dword_100022354);
  if (result)
  {
    sub_100009A44("mach_port_move_member dead_session_port failed (%u)", v49, v50, v51, v52, v53, v54, v55, result);
LABEL_16:
    exit(1);
  }
  return result;
}

uint64_t sub_10000FFE0(int a1, const char *a2)
{
  _os_nospin_lock_lock();
  DWORD2(xmmword_100022428) = a1;
  free((void *)qword_100022438);
  qword_100022438 = 0;
  if (a2) {
    qword_100022438 = (uint64_t)strdup(a2);
  }

  return _os_nospin_lock_unlock();
}

uint64_t sub_100010058(int a1, int a2, int a3, int a4)
{
  pthread_mutex_lock((pthread_mutex_t *)qword_100022398);
  char v8 = xmmword_100022448;
  if (xmmword_100022448)
  {
    asl_store_close();
    *(void *)&xmmword_1000223E8 = 0;
    char v8 = xmmword_100022448;
  }
  if ((v8 & 2) != 0)
  {
    asl_memory_close(*((dispatch_object_t **)&xmmword_1000223E8 + 1));
    *((void *)&xmmword_1000223E8 + 1) = 0;
  }
  LODWORD(xmmword_100022448) = a1;
  DWORD1(xmmword_100022448) = a2;
  DWORD2(xmmword_100022448) = a3;
  HIDWORD(xmmword_100022448) = a4;
  uint64_t v9 = (pthread_mutex_t *)qword_100022398;

  return pthread_mutex_unlock(v9);
}

void sub_1000100F4(int a1)
{
  *(void *)char v8 = 0x1500000001;
  if (!a1)
  {
    uint64_t v4 = asl_msg_new();
    if (!v4) {
      return;
    }
    uint64_t v2 = v4;
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    snprintf(__str, 0x100uLL, "%u", dword_10002237C);
    asl_msg_set_key_val();
    goto LABEL_10;
  }
  bzero(&v6, 0x280uLL);
  v6.ut_type = 2;
  v6.ut_pid = 1;
  size_t v5 = 16;
  if (sysctl(v8, 2u, &v6.ut_tv, &v5, 0, 0) < 0) {
    gettimeofday(&v6.ut_tv, 0);
  }
  pututxline(&v6);
  uint64_t v1 = asl_msg_new();
  if (v1)
  {
    uint64_t v2 = v1;
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    snprintf(__str, 0x100uLL, "BOOT_TIME %lu %u", v6.ut_tv.tv_sec, v6.ut_tv.tv_usec);
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    snprintf(__str, 0x100uLL, "%lu", v6.ut_tv.tv_sec);
    asl_msg_set_key_val();
    asl_msg_set_key_val();
    snprintf(__str, 0x100uLL, "%u", v6.ut_tv.tv_usec);
    asl_msg_set_key_val();
    uint64_t v3 = "000";
    if (!v6.ut_tv.tv_usec) {
      uint64_t v3 = (const char *)&unk_100019287;
    }
    snprintf(__str, 0x100uLL, "%u%s", v6.ut_tv.tv_usec, v3);
LABEL_10:
    asl_msg_set_key_val();
    sub_100009814(v2, 1);
  }
}

void start(int a1, uint64_t a2)
{
  *(void *)token = 0;
  *(void *)int out_token = 0;
  time_t v95 = 0;
  name = 0;
  setiopolicy_np(0, 0, 2);
  unk_100022348 = 0u;
  *(_OWORD *)&dword_100022358 = 0u;
  xmmword_100022368 = 0u;
  unk_100022378 = 0u;
  xmmword_100022388 = 0u;
  *(_OWORD *)&qword_100022398 = 0u;
  xmmword_1000223A8 = 0u;
  unk_1000223B8 = 0u;
  unk_1000223C8 = 0u;
  *(_OWORD *)&qword_1000223D8 = 0u;
  xmmword_1000223E8 = 0u;
  unk_1000223F8 = 0u;
  xmmword_100022408 = 0u;
  *(_OWORD *)&qword_100022418 = 0u;
  xmmword_100022428 = 0u;
  *(_OWORD *)&qword_100022438 = 0u;
  xmmword_100022448 = 0u;
  *(_OWORD *)&qword_100022458 = 0u;
  *(long long *)((char *)&xmmword_100022460 + 8) = 0u;
  *(long long *)((char *)&xmmword_100022470 + 8) = 0u;
  qword_100022398 = (uint64_t)malloc_type_calloc(1uLL, 0x40uLL, 0x1000040FA0F61DDuLL);
  pthread_mutex_init((pthread_mutex_t *)qword_100022398, 0);
  qword_1000223D0 = (uint64_t)dispatch_queue_create("Work Queue", 0);
  dispatch_suspend((dispatch_object_t)qword_1000223D0);
  sub_10000914C();
  dword_100021260 = 1;
  dword_100020034 = 0;
  _malloc_no_asl_log = 1;
  if (a1 < 2)
  {
    int v94 = xmmword_100022448;
LABEL_65:
    if (!v94) {
      *(void *)&xmmword_100022448 = 0x186A00000000001;
    }
    signal(1, (void (__cdecl *)(int))1);
    *(_OWORD *)uint64_t v97 = 0u;
    long long v98 = 0u;
    time_t v95 = time(0);
    ctime_r(&v95, v97);
    BYTE3(v98) = 0;
    sub_100009A44("\n%s syslogd PID %d starting\n", v16, v17, v18, v19, v20, v21, v22, (char)v97);
    memset(&v101, 0, sizeof(v101));
    if (stat("/var/run/syslog.pid", &v101)) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = (v101.st_mode & 0xF000) == 0x8000;
    }
    int v24 = !v23;
    uint64_t v25 = fopen("/var/run/syslog.pid", "w");
    if (v25)
    {
      uint64_t v26 = v25;
      fprintf(v25, "%d\n", dword_10002237C);
      fclose(v26);
    }
    sub_1000100F4(v24);
    notify_register_plain();
    notify_set_state(token[0], 0);
    sub_100009A44("reading launch plist\n", v27, v28, v29, v30, v31, v32, v33, v88);
    sub_10000FE78();
    sub_100009A44("initializing modules\n", v34, v35, v36, v37, v38, v39, v40, v89);
    uint64_t v41 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
    if (v41)
    {
      long long v50 = v41;
      *(void *)uint64_t v41 = "asl_action";
      v41[2] = 1;
      *((void *)v41 + 2) = sub_100004B6C;
      *((void *)v41 + 3) = sub_100004FE8;
      *((void *)v41 + 4) = sub_100004E5C;
      sub_100004B6C((uint64_t)v41, v42, v43, v44, v45, v46, v47, v48);
      ssize_t v51 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
      if (v51)
      {
        int v52 = v51;
        *(void *)ssize_t v51 = "bsd_out";
        int v53 = dword_100020034;
        v51[2] = dword_100020034;
        *((void *)v51 + 2) = sub_1000086C4;
        *((void *)v51 + 3) = sub_100008E84;
        *((void *)v51 + 4) = sub_100008D54;
        if (v53)
        {
          sub_1000086C4((uint64_t)v51, v42, v43, v44, v45, v46, v47, v48);
          dword_100022404 = 1;
        }
        long long v54 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
        if (v54)
        {
          long long v55 = v54;
          *(void *)long long v54 = "klog_in";
          int v56 = dword_100020038;
          v54[2] = dword_100020038;
          *((void *)v54 + 2) = sub_10000DF98;
          *((void *)v54 + 3) = sub_10000E178;
          *((void *)v54 + 4) = sub_10000E11C;
          if (v56) {
            sub_10000DF98((uint64_t)v54, v42, v43, v44, v45, v46, v47, v48);
          }
          long long v57 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
          if (v57)
          {
            long long v58 = v57;
            *(void *)long long v57 = "udp_in";
            int v59 = dword_10002003C;
            v57[2] = dword_10002003C;
            *((void *)v57 + 2) = sub_1000111C8;
            *((void *)v57 + 3) = sub_100011508;
            *((void *)v57 + 4) = sub_10001148C;
            if (v59) {
              sub_1000111C8((uint64_t)v57, v42, v43, v44, v45, v46, v47, v48);
            }
            size_t v60 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
            if (v60)
            {
              size_t v61 = v60;
              *(void *)size_t v60 = "remote";
              int v62 = dword_100021260;
              v60[2] = dword_100021260;
              *((void *)v60 + 2) = sub_10000FDA0;
              *((void *)v60 + 3) = sub_10000FE70;
              *((void *)v60 + 4) = sub_10000FE38;
              if (v62) {
                sub_10000FDA0((uint64_t)v60, v42, v43, v44, v45, v46, v47, v48);
              }
              dword_100022400 = 5;
              size_t v63 = malloc_type_calloc(5uLL, 8uLL, 0x2004093837F09uLL);
              *((void *)&xmmword_100022408 + 1) = v63;
              if (v63)
              {
                *size_t v63 = v50;
                *(void *)(*((void *)&xmmword_100022408 + 1) + 8) = v52;
                *(void *)(*((void *)&xmmword_100022408 + 1) + 16) = v55;
                *(void *)(*((void *)&xmmword_100022408 + 1) + 24) = v58;
                *(void *)(*((void *)&xmmword_100022408 + 1) + 32) = v61;
                sub_100009A44("setting up network change notification handler\n", v42, v43, v44, v45, v46, v47, v48, v90);
                notify_register_dispatch("com.apple.system.config.network_change", &out_token[1], (dispatch_queue_t)qword_1000223D0, &stru_10001D258);
                sub_100009A44("setting up quota notification handler\n", v64, v65, v66, v67, v68, v69, v70, v91);
                name = 0;
                asprintf(&name, "%s%s", "com.apple.system.notify.service.path:0x87:", "/etc/asl/.noquota");
                if (name)
                {
                  notify_register_dispatch(name, out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_10001D298);
                  free(name);
                }
                qword_1000223E0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
                dispatch_source_set_event_handler((dispatch_source_t)qword_1000223E0, &stru_10001D2D8);
                dispatch_resume((dispatch_object_t)qword_1000223E0);
                notify_register_plain();
                if (*((void *)&xmmword_100022460 + 1))
                {
                  qword_1000223D8 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
                  dispatch_source_set_event_handler((dispatch_source_t)qword_1000223D8, &stru_10001D358);
                  size_t v78 = qword_1000223D8;
                  dispatch_time_t v79 = dispatch_time(0, 1000000000 * *((void *)&xmmword_100022460 + 1));
                  dispatch_source_set_timer(v78, v79, 1000000000 * *((void *)&xmmword_100022460 + 1), 0);
                  dispatch_resume((dispatch_object_t)qword_1000223D8);
                }
                sub_100009A44("starting mach service\n", v71, v72, v73, v74, v75, v76, v77, v92);
                global_queue = dispatch_get_global_queue(0, 0);
                dispatch_async(global_queue, &stru_10001D398);
                sub_100009A44("starting work queue\n", v81, v82, v83, v84, v85, v86, v87, v93);
                dispatch_resume((dispatch_object_t)qword_1000223D0);
                dispatch_main();
              }
              long long v49 = "alloc failed (init_modules)\n";
            }
            else
            {
              long long v49 = "alloc failed (init_modules remote)\n";
            }
          }
          else
          {
            long long v49 = "alloc failed (init_modules udp_in)\n";
          }
        }
        else
        {
          long long v49 = "alloc failed (init_modules klog_in)\n";
        }
      }
      else
      {
        long long v49 = "alloc failed (init_modules bsd_out)\n";
      }
    }
    else
    {
      long long v49 = "alloc failed (init_modules asl_action)\n";
    }
    sub_100009A44(v49, v42, v43, v44, v45, v46, v47, v48, v90);
    exit(1);
  }
  int v4 = 1;
  do
  {
    uint64_t v5 = v4 + 1;
    if (!strcmp(*(const char **)(a2 + 8 * v4), "-config") && (int)v5 < a1)
    {
      uint64_t v7 = *(const char **)(a2 + 8 * v5);
      if (*v7 != 45)
      {
        if (!strcmp(*(const char **)(a2 + 8 * v5), "mac"))
        {
          *(void *)&xmmword_100022448 = 0x186A00000000001;
        }
        else if (!strcmp(v7, "appletv"))
        {
          *(void *)&xmmword_100022448 = 0x9C400000000001;
        }
        else if (!strcmp(v7, "iphone"))
        {
          LODWORD(xmmword_100022448) = 2;
          dword_100021260 = 1;
        }
        ++v4;
      }
    }
    ++v4;
  }
  while (v4 < a1);
  int v94 = xmmword_100022448;
  int v8 = 1;
  while (1)
  {
    uint64_t v9 = *(const char **)(a2 + 8 * v8);
    if (!strcmp(v9, "-d"))
    {
      DWORD2(xmmword_100022428) = 1;
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1 || (uint64_t v11 = *(const char **)(a2 + 8 * v10), *v11 == 45))
      {
LABEL_63:
        LODWORD(v10) = v8;
        goto LABEL_64;
      }
      qword_100022438 = (uint64_t)strdup(v11);
    }
    else if (!strcmp(v9, "-db"))
    {
      uint64_t v12 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      uint64_t v13 = *(const char **)(a2 + 8 * v12);
      if (*v13 == 45) {
        goto LABEL_63;
      }
      if (!strcmp(*(const char **)(a2 + 8 * v12), "file"))
      {
        LODWORD(xmmword_100022448) = v94 | 1;
        uint64_t v10 = v8 + 2;
        v94 |= 1u;
        if (v8 + 2 < a1)
        {
          uint64_t v15 = *(const char **)(a2 + 8 * v10);
          if (*v15 != 45)
          {
            DWORD1(xmmword_100022448) = atol(v15);
            goto LABEL_64;
          }
        }
LABEL_55:
        LODWORD(v10) = v8 + 1;
        goto LABEL_64;
      }
      if (strcmp(v13, "memory")) {
        goto LABEL_55;
      }
      LODWORD(xmmword_100022448) = v94 | 2;
      uint64_t v10 = v8 + 2;
      v94 |= 2u;
      if (v8 + 2 >= a1) {
        goto LABEL_55;
      }
      uint64_t v14 = *(const char **)(a2 + 8 * v10);
      if (*v14 == 45) {
        goto LABEL_55;
      }
      DWORD2(xmmword_100022448) = atol(v14);
    }
    else if (!strcmp(v9, "-m"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      *((void *)&xmmword_100022460 + 1) = 60 * atoll(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-utmp_ttl"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      *(void *)&xmmword_100022470 = atol(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-mps_limit"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      LODWORD(qword_100022458) = atol(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-dup_delay"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      *(void *)&xmmword_100022460 = atoll(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-klog_in"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_100020038 = atoi(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-udp_in"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_10002003C = atoi(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-launchd_in"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      LODWORD(xmmword_100022408) = atoi(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-bsd_out"))
    {
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_100020034 = atoi(*(const char **)(a2 + 8 * v10));
    }
    else
    {
      if (strcmp(v9, "-remote")) {
        goto LABEL_63;
      }
      uint64_t v10 = v8 + 1;
      if (v8 + 1 >= a1) {
        goto LABEL_63;
      }
      dword_100021260 = atoi(*(const char **)(a2 + 8 * v10));
    }
LABEL_64:
    int v8 = v10 + 1;
    if ((int)v10 + 1 >= a1) {
      goto LABEL_65;
    }
  }
}

void sub_100010F10(id a1, int a2)
{
  if (dword_10002003C) {
    sub_100011508();
  }
  if (dword_100020034)
  {
    sub_100008E84();
  }
}

void sub_100010F58(id a1, int a2)
{
  memset(&v3, 0, sizeof(v3));
  uint64_t v2 = 0;
  if (stat("/etc/asl/.noquota", &v3)) {
    asprintf(&v2, "[Sender syslogd] [Level 2] [PID %u] [Facility syslog] [Message *** MESSAGE QUOTAS ENABLED ***]");
  }
  else {
    asprintf(&v2, "[Sender syslogd] [Level 2] [PID %u] [Facility syslog] [Message *** MESSAGE QUOTAS DISABLED FOR ALL PROCESSES ***]");
  }
  sub_10000A6C8((uint64_t)v2);
  free(v2);
}

void sub_100010FE4(id a1)
{
}

void sub_100010FF8(id a1)
{
  uint64_t v8 = sub_100009A44("SIGHUP reset\n", v1, v2, v3, v4, v5, v6, v7, v13);
  int v9 = dword_100022400;
  if (dword_100022400 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *((void *)&xmmword_100022408 + 1);
    do
    {
      uint64_t v12 = *(void *)(v11 + 8 * v10);
      if (*(_DWORD *)(v12 + 8))
      {
        uint64_t v8 = (*(uint64_t (**)(uint64_t))(v12 + 24))(v8);
        uint64_t v11 = *((void *)&xmmword_100022408 + 1);
        int v9 = dword_100022400;
      }
      ++v10;
    }
    while (v10 < v9);
  }
}

void sub_100011074(int a1)
{
  socklen_t v19 = 128;
  sockaddr v21 = (sockaddr)0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  ssize_t v1 = recvfrom(a1, byte_100021268, 0x1000uLL, 0, &v21, &v19);
  if (v1 < 1) {
    return;
  }
  uint64_t v2 = v1;
  v20[0] = 0;
  if (v21.sa_family == 30)
  {
    uint64_t v3 = &v21.sa_data[6];
    int v4 = 30;
  }
  else
  {
    if (v21.sa_family != 2)
    {
      uint64_t v5 = 0;
      goto LABEL_8;
    }
    uint64_t v3 = &v21.sa_data[2];
    int v4 = 2;
  }
  inet_ntop(v4, v3, v20, 0x40u);
  uint64_t v5 = v20;
  sub_100009A44("%s: fd %d recvfrom %s len %d\n", v6, v7, v8, v9, v10, v11, v12, (char)"udp_in");
LABEL_8:
  byte_100021268[v2] = 0;
  char v13 = strrchr(byte_100021268, 10);
  if (v13) {
    char *v13 = 0;
  }
  uint64_t v18 = sub_10000AD60((uint64_t)byte_100021268, v2, (uint64_t)v5, 3, v14, v15, v16, v17);
  sub_100009814((uint64_t)v18, 3);
}

uint64_t sub_1000111C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100022270 != -1) {
    dispatch_once(&qword_100022270, &stru_10001D3D8);
  }
  sub_100009A44("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"udp_in");
  if (dword_100022280 > 0) {
    return 0;
  }
  if (qword_100022360)
  {
    uint64_t v16 = launch_data_dict_lookup((const launch_data_t)qword_100022360, "Sockets");
    if (v16)
    {
      long long v24 = launch_data_dict_lookup(v16, "NetworkListener");
      if (v24)
      {
        uint64_t v32 = v24;
        dword_100022280 = launch_data_array_get_count(v24);
        if (dword_100022280 < 1)
        {
          sub_100009A44("%s: launchd fd array is empty\n", v33, v34, v35, v36, v37, v38, v39, (char)"udp_in");
        }
        else
        {
          size_t v40 = 0;
          int v71 = 0;
          while (1)
          {
            dword_100022284[v40] = -1;
            index = launch_data_array_get_index(v32, v40);
            if (!index) {
              break;
            }
            uint64_t fd = launch_data_get_fd(index);
            int v71 = 0x20000;
            if (setsockopt(fd, 0xFFFF, 4098, &v71, 4u) < 0)
            {
              long long v50 = __error();
              uint64_t v67 = fd;
              uint64_t v68 = strerror(*v50);
              sub_100009A44("%s: couldn't set receive buffer size for file descriptor %d: %s\n", v51, v52, v53, v54, v55, v56, v57, (char)"udp_in");
            }
            if (fcntl(fd, 4, 4, v67, v68) < 0)
            {
              long long v58 = __error();
              uint64_t v67 = fd;
              uint64_t v68 = strerror(*v58);
              sub_100009A44("%s: couldn't set O_NONBLOCK for file descriptor %d: %s\n", v59, v60, v61, v62, v63, v64, v65, (char)"udp_in");
            }
            dword_100022284[v40] = fd;
            uint64_t v66 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, (int)fd, 0, (dispatch_queue_t)qword_100022278);
            qword_1000222C8[v40] = v66;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 0x40000000;
            handler[2] = sub_100011484;
            handler[3] = &unk_10001D3F8;
            int v70 = fd;
            dispatch_source_set_event_handler(v66, handler);
            dispatch_resume(qword_1000222C8[v40]);
            uint64_t result = 0;
            if ((uint64_t)++v40 >= dword_100022280) {
              return result;
            }
          }
          sub_100009A44("%s: launchd file discriptor array element 0 is NULL\n", v42, v43, v44, v45, v46, v47, v48, (char)"udp_in");
        }
      }
      else
      {
        sub_100009A44("%s: launchd lookup of UDP_SOCKET_NAME failed\n", v25, v26, v27, v28, v29, v30, v31, (char)"udp_in");
      }
    }
    else
    {
      sub_100009A44("%s: launchd lookup of LAUNCH_JOBKEY_SOCKETS failed\n", v17, v18, v19, v20, v21, v22, v23, (char)"udp_in");
    }
  }
  else
  {
    sub_100009A44("%s: launchd dict is NULL\n", v8, v9, v10, v11, v12, v13, v14, (char)"udp_in");
  }
  return 0xFFFFFFFFLL;
}

void sub_100011458(id a1)
{
  qword_100022278 = (uint64_t)dispatch_queue_create("udp_in", 0);
}

void sub_100011484(uint64_t a1)
{
}

uint64_t sub_10001148C()
{
  int v0 = dword_100022280;
  if (!dword_100022280) {
    return 0xFFFFFFFFLL;
  }
  if (dword_100022280 >= 1)
  {
    uint64_t v1 = 0;
    do
    {
      int v2 = dword_100022284[v1];
      if (v2 != -1)
      {
        close(v2);
        dword_100022284[v1] = -1;
        int v0 = dword_100022280;
      }
      ++v1;
    }
    while (v1 < v0);
  }
  uint64_t result = 0;
  dword_100022280 = 0;
  return result;
}

uint64_t sub_100011508()
{
  uint64_t v0 = sub_10001148C();
  if (v0) {
    return 0xFFFFFFFFLL;
  }

  return sub_1000111C8(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t asl_memory_statistics(uint64_t *a1, uint64_t *a2)
{
  if (!a1) {
    return 2;
  }
  if (!a2) {
    return 1;
  }
  uint64_t v4 = asl_msg_new();
  if (!v4) {
    return 9;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *((unsigned int *)a1 + 6);
  unint64_t v7 = ((unint64_t)(*((_DWORD *)a1 + 7) + 1) << 7) | 0x40;
  if (v6)
  {
    uint64_t v8 = *a1;
    do
    {
      uint64_t v9 = *(const char **)(*(void *)v8 + 8);
      if (v9) {
        v7 += strlen(v9) + 17;
      }
      else {
        v7 += 16;
      }
      v8 += 8;
      --v6;
    }
    while (v6);
  }
  snprintf(__str, 0x100uLL, "%llu", v7);
  asl_msg_set_key_val();
  if (*((_DWORD *)a1 + 7))
  {
    int v10 = 0;
    uint64_t v11 = (void **)a1[1];
    uint64_t v12 = *((unsigned int *)a1 + 7);
    do
    {
      uint64_t v13 = *v11++;
      if (*v13) {
        ++v10;
      }
      --v12;
    }
    while (v12);
  }
  else
  {
    int v10 = 0;
  }
  snprintf(__str, 0x100uLL, "%u", *((_DWORD *)a1 + 7));
  asl_msg_set_key_val();
  snprintf(__str, 0x100uLL, "%u", v10);
  asl_msg_set_key_val();
  snprintf(__str, 0x100uLL, "%u", *((_DWORD *)a1 + 6));
  asl_msg_set_key_val();
  snprintf(__str, 0x100uLL, "%lu", a1[6]);
  asl_msg_set_key_val();
  snprintf(__str, 0x100uLL, "%lu", a1[5]);
  asl_msg_set_key_val();
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t asl_memory_close(dispatch_object_t *a1)
{
  if (a1)
  {
    uint64_t v2 = a1[7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100011808;
    block[3] = &unk_10001D418;
    void block[4] = a1;
    dispatch_sync(v2, block);
    dispatch_release(a1[7]);
    free(a1);
  }
  return 0;
}

void sub_100011808(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  if (v3)
  {
    if (*(_DWORD *)(v2 + 28))
    {
      unint64_t v4 = 0;
      do
      {
        free(*(void **)(*(void *)(v2 + 8) + 8 * v4));
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8 * v4++) = 0;
        uint64_t v2 = *(void *)(a1 + 32);
      }
      while (v4 < *(unsigned int *)(v2 + 28));
      uint64_t v3 = *(void **)(v2 + 8);
    }
    free(v3);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  free(*(void **)(v2 + 16));
  *(void *)(*(void *)(a1 + 32) + 16) = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)v5;
  if (*(void *)v5)
  {
    if (*(_DWORD *)(v5 + 24))
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = *(void **)v5;
        uint64_t v9 = v8[v7];
        if (v9)
        {
          free(*(void **)(v9 + 8));
          free(*(void **)(**(void **)(a1 + 32) + 8 * v7));
          uint64_t v8 = **(void ***)(a1 + 32);
        }
        v8[v7++] = 0;
        uint64_t v5 = *(void *)(a1 + 32);
      }
      while (v7 < *(unsigned int *)(v5 + 24));
      uint64_t v6 = *(void **)v5;
    }
    free(v6);
    **(void **)(a1 + 32) = 0;
  }
}

uint64_t asl_memory_open(unsigned int a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 1;
  }
  if (a1) {
    size_t v4 = a1;
  }
  else {
    size_t v4 = 2000;
  }
  if (a2) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = 4096000;
  }
  uint64_t v6 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040714EAED2uLL);
  if (v6)
  {
    unint64_t v7 = v6;
    dispatch_queue_t v8 = dispatch_queue_create("ASL Memory Queue", 0);
    *((void *)v7 + 7) = v8;
    if (v8)
    {
      *((void *)v7 + 5) = v5;
      *((_DWORD *)v7 + 7) = v4;
      uint64_t v9 = malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
      *((void *)v7 + 1) = v9;
      if (v9)
      {
        uint64_t v10 = 0;
        while (1)
        {
          *(void *)(*((void *)v7 + 1) + 8 * v10) = malloc_type_calloc(1uLL, 0x80uLL, 0x10A00402869003AuLL);
          if (!*(void *)(*((void *)v7 + 1) + 8 * v10)) {
            break;
          }
          if (v4 == ++v10)
          {
            uint64_t v11 = malloc_type_calloc(1uLL, 0x80uLL, 0x10A00402869003AuLL);
            *((void *)v7 + 2) = v11;
            if (v11)
            {
              uint64_t result = 0;
              *a3 = v7;
              return result;
            }
            break;
          }
        }
        asl_memory_close((dispatch_object_t *)v7);
        return 9;
      }
      dispatch_release(*((dispatch_object_t *)v7 + 7));
    }
    free(v7);
  }
  return 9;
}

uint64_t asl_memory_save(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  if (a1 && *(void *)(a1 + 16))
  {
    uint64_t v3 = *(NSObject **)(a1 + 56);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_100011B10;
    v6[3] = &unk_10001D440;
    v6[4] = &v7;
    v6[5] = a1;
    v6[6] = a2;
    v6[7] = a3;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v8 + 6);
  }
  else
  {
    uint64_t v4 = 2;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_100011B10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 16)) != 0)
  {
    if (*(void *)(a1 + 48))
    {
      *(_OWORD *)(v3 + 96) = 0u;
      *(_OWORD *)(v3 + 112) = 0u;
      *(_OWORD *)(v3 + 64) = 0u;
      *(_OWORD *)(v3 + 80) = 0u;
      *(_OWORD *)(v3 + 32) = 0u;
      *(_OWORD *)(v3 + 48) = 0u;
      *(_OWORD *)uint64_t v3 = 0u;
      *(_OWORD *)(v3 + 16) = 0u;
      *(_WORD *)(v3 + 120) = 0;
      *(unsigned char *)(v3 + 122) = 7;
      *(void *)(v3 + 104) = -1;
      *(void *)(v3 + 8) = -1;
      *(_OWORD *)(v3 + 88) = xmmword_100018760;
      while (asl_msg_fetch() != -1)
        ;
      int v4 = 0;
    }
    else
    {
      int v4 = 5;
    }
  }
  else
  {
    int v4 = 2;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    unsigned int v6 = *(_DWORD *)(v5 + 32);
    uint64_t v7 = **(void **)(a1 + 56);
    if (v7)
    {
      **(void **)(v5 + 16) = v7;
      unsigned int v8 = v6;
    }
    else
    {
      uint64_t v9 = asl_core_new_msg_id();
      uint64_t v5 = *(void *)(a1 + 40);
      **(void **)(v5 + 16) = v9;
      **(void **)(a1 + 56) = v9;
      unsigned int v8 = *(_DWORD *)(v5 + 32);
    }
    uint64_t v10 = *(void *)(*(void *)(v5 + 8) + 8 * v8);
    sub_100012144(v5, v10);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 8 * *(unsigned int *)(*(void *)(a1 + 40) + 32)) = *(void *)(*(void *)(a1 + 40) + 16);
    *(void *)(*(void *)(a1 + 40) + 16) = v10;
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = *(_DWORD *)(v11 + 32);
    if ((v12 + 1) < *(_DWORD *)(v11 + 28)) {
      int v13 = v12 + 1;
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v11 + 32) = v13;
    while (1)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (*(void *)(v14 + 48) <= *(void *)(v14 + 40)) {
        break;
      }
      sub_100012144(v14, *(void *)(*(void *)(v14 + 8) + 8 * *(unsigned int *)(v14 + 32)));
      uint64_t v15 = *(void *)(a1 + 40);
      unsigned int v16 = *(_DWORD *)(v15 + 28);
      int v17 = *(_DWORD *)(v15 + 32);
      if (v17 + 1 < v16) {
        int v18 = v17 + 1;
      }
      else {
        int v18 = 0;
      }
      *(_DWORD *)(v15 + 32) = v18;
      if (v18 == v6)
      {
        if (v16)
        {
          unint64_t v19 = 0;
          do
          {
            uint64_t v20 = *(_OWORD **)(*(void *)(v15 + 8) + 8 * v19);
            v20[6] = 0uLL;
            v20[7] = 0uLL;
            v20[4] = 0uLL;
            v20[5] = 0uLL;
            v20[2] = 0uLL;
            v20[3] = 0uLL;
            *uint64_t v20 = 0uLL;
            v20[1] = 0uLL;
            ++v19;
          }
          while (v19 < *(unsigned int *)(v15 + 28));
        }
        uint64_t v21 = *(void **)v15;
        if (*(void *)v15)
        {
          unint64_t v22 = *(unsigned int *)(v15 + 24);
          if (v22)
          {
            for (unint64_t i = 0; i < v22; ++i)
            {
              long long v24 = *(void **)v15;
              uint64_t v25 = *(void *)(*(void *)v15 + 8 * i);
              if (v25)
              {
                free(*(void **)(v25 + 8));
                free(*(void **)(*(void *)v15 + 8 * i));
                long long v24 = *(void **)v15;
                unint64_t v22 = *(unsigned int *)(v15 + 24);
              }
              v24[i] = 0;
            }
            uint64_t v21 = *(void **)v15;
          }
          free(v21);
          *(void *)uint64_t v15 = 0;
        }
        *(_DWORD *)(v15 + 24) = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 9999;
        return;
      }
    }
  }
}

double sub_100012144(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    sub_100013808(a1, *(void *)(a2 + 24));
    sub_100013808(a1, *(void *)(a2 + 32));
    sub_100013808(a1, *(void *)(a2 + 40));
    sub_100013808(a1, *(void *)(a2 + 48));
    sub_100013808(a1, *(void *)(a2 + 56));
    sub_100013808(a1, *(void *)(a2 + 64));
    sub_100013808(a1, *(void *)(a2 + 72));
    if (*(_DWORD *)(a2 + 116))
    {
      unint64_t v4 = 0;
      do
        sub_100013808(a1, *(void *)(*(void *)(a2 + 80) + 8 * v4++));
      while (v4 < *(unsigned int *)(a2 + 116));
    }
    uint64_t v5 = *(void **)(a2 + 80);
    if (v5) {
      free(v5);
    }
    double result = 0.0;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_100012214(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (!a1) {
    return 2;
  }
  uint64_t result = 1;
  if (a2 && a3)
  {
    *a3 = 0;
    uint64_t v6 = asl_msg_new();
    if (v6)
    {
      uint64_t v7 = v6;
      snprintf(__str, 0x40uLL, "%llu", *(void *)a2);
      asl_msg_set_key_val();
      snprintf(__str, 0x40uLL, "%u", *(unsigned __int8 *)(a2 + 122));
      asl_msg_set_key_val();
      if (*(void *)(a2 + 8) != -1)
      {
        snprintf(__str, 0x40uLL, "%llu", *(void *)(a2 + 8));
        asl_msg_set_key_val();
      }
      if (*(_DWORD *)(a2 + 88) != -1)
      {
        snprintf(__str, 0x40uLL, "%u", *(_DWORD *)(a2 + 88));
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 24)) {
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 32)) {
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 40)) {
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 48)) {
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 64)) {
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 72)) {
        asl_msg_set_key_val();
      }
      if (*(_DWORD *)(a2 + 92) != -1)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 92));
        asl_msg_set_key_val();
      }
      if (*(_DWORD *)(a2 + 112))
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 112));
        asl_msg_set_key_val();
      }
      if (*(_DWORD *)(a2 + 96) != -2)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 96));
        asl_msg_set_key_val();
      }
      if (*(_DWORD *)(a2 + 100) != -2)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 100));
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 56)) {
        asl_msg_set_key_val();
      }
      __int16 v8 = *(_WORD *)(a2 + 120);
      if (v8)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 104));
        asl_msg_set_key_val();
        __int16 v8 = *(_WORD *)(a2 + 120);
      }
      if ((v8 & 2) != 0)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 108));
        asl_msg_set_key_val();
      }
      if (*(void *)(a2 + 16))
      {
        snprintf(__str, 0x40uLL, "%llu", *(void *)(a2 + 16));
        asl_msg_set_key_val();
      }
      unsigned int v9 = *(_DWORD *)(a2 + 116);
      if (v9)
      {
        unsigned int v10 = 0;
        while (1)
        {
          uint64_t v11 = *(void *)(a2 + 80);
          uint64_t v12 = *(void *)(v11 + 8 * v10);
          uint64_t v13 = v12 ? *(void *)(v12 + 8) : 0;
          if (!*(void *)(v11 + 8 * (v10 + 1))) {
            break;
          }
          if (v13) {
            goto LABEL_44;
          }
LABEL_45:
          v10 += 2;
          if (v10 >= v9) {
            goto LABEL_50;
          }
        }
        if (!v13) {
          goto LABEL_45;
        }
LABEL_44:
        asl_msg_set_key_val();
        unsigned int v9 = *(_DWORD *)(a2 + 116);
        goto LABEL_45;
      }
LABEL_50:
      uint64_t result = 0;
      *a3 = v7;
    }
    else
    {
      return 9;
    }
  }
  return result;
}

uint64_t asl_memory_match_restricted_uuid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, int a9, int a10, uint64_t a11)
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2000000000;
  int v23 = 0;
  if (a1)
  {
    if (a3)
    {
      uint64_t v11 = *(NSObject **)(a1 + 56);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000;
      v14[2] = sub_10001270C;
      v14[3] = &unk_10001D468;
      v14[4] = &v20;
      v14[5] = a1;
      v14[6] = a2;
      v14[7] = a3;
      v14[8] = a4;
      v14[9] = a5;
      int v15 = a6;
      int v16 = a7;
      int v17 = a8;
      int v18 = a9;
      int v19 = a10;
      v14[10] = a11;
      dispatch_sync(v11, v14);
      uint64_t v12 = *((unsigned int *)v21 + 6);
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 2;
  }
  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t sub_10001270C(uint64_t a1)
{
  uint64_t result = sub_100012768(*(void *)(a1 + 40), *(void *)(a1 + 48), *(uint64_t **)(a1 + 56), *(void **)(a1 + 64), *(void *)(a1 + 72), *(_DWORD *)(a1 + 88), *(_DWORD *)(a1 + 92), *(_DWORD *)(a1 + 96), *(void *)(a1 + 100), *(const char **)(a1 + 80));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100012768(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, int a6, unsigned int a7, int a8, uint64_t a9, const char *a10)
{
  *(void *)&v136.__darwin_suseconds_t tv_usec = 0;
  uint64_t v137 = 0;
  *(void *)&v135.__darwin_suseconds_t tv_usec = 0;
  v136.__darwin_time_t tv_sec = 0;
  v135.__darwin_time_t tv_sec = 0;
  size_t v15 = asl_msg_list_count();
  size_t v16 = v15;
  if (v15)
  {
    int v17 = malloc_type_calloc(v15, 8uLL, 0x2004093837F09uLL);
    if (!v17) {
      return 9;
    }
    int v18 = v17;
    int v19 = malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL);
    if (!v19)
    {
      free(v18);
      return 9;
    }
    uint64_t v20 = v19;
    int v126 = a6;
    unsigned int v128 = a7;
    int v122 = a8;
    uint64_t v124 = a3;
    uint64_t v21 = 0;
    int v22 = 0;
    unsigned int v23 = 0;
    while (1)
    {
      uint64_t index = asl_msg_list_get_index();
      if (!a1)
      {
LABEL_102:
        int v74 = 0x20000000;
        goto LABEL_103;
      }
      v20[v21] = 0x80000000;
      if (!index || !asl_msg_count()) {
        goto LABEL_101;
      }
      __int16 v139 = 0;
      size_t v140 = 0;
      size_t v138 = 0;
      v20[v21] = 0;
      if (asl_msg_fetch() != -1)
      {
        while (v139 == 1)
        {
          if (asl_msg_fetch() == -1) {
            goto LABEL_11;
          }
        }
LABEL_101:
        uint64_t v26 = 0;
        goto LABEL_104;
      }
LABEL_11:
      uint64_t v25 = malloc_type_calloc(1uLL, 0x80uLL, 0x10A00402869003AuLL);
      if (!v25) {
        goto LABEL_102;
      }
      uint64_t v26 = (uint64_t)v25;
      if (asl_msg_fetch() == -1) {
        goto LABEL_104;
      }
      while (1)
      {
        if (!v140) {
          goto LABEL_99;
        }
        if (!strcmp(v140, "ASLMessageID"))
        {
          uint64_t v33 = v138;
          if (v138)
          {
            int v34 = v20[v21];
            if (v34) {
              goto LABEL_109;
            }
            v20[v21] = v34 | 1;
            *(void *)uint64_t v26 = atoll(v33);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "Time"))
        {
          if (v138)
          {
            int v35 = v20[v21];
            if ((v35 & 2) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v35 | 2;
            *(void *)(v26 + 8) = asl_core_parse_time();
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "TimeNanoSec"))
        {
          uint64_t v36 = v138;
          if (v138)
          {
            int v37 = v20[v21];
            if ((v37 & 4) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v37 | 4;
            *(_DWORD *)(v26 + 88) = atoll(v36);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "Level"))
        {
          uint64_t v38 = v138;
          if (v138)
          {
            int v39 = v20[v21];
            if ((v39 & 8) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v39 | 8;
            *(unsigned char *)(v26 + 122) = atoi(v38);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "PID"))
        {
          size_t v40 = v138;
          if (v138)
          {
            int v41 = v20[v21];
            if ((v41 & 0x10) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v41 | 0x10;
            *(_DWORD *)(v26 + 92) = atoi(v40);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "UID"))
        {
          uint64_t v42 = v138;
          if (v138)
          {
            int v43 = v20[v21];
            if ((v43 & 0x20) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v43 | 0x20;
            *(_DWORD *)(v26 + 96) = atoi(v42);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "GID"))
        {
          uint64_t v44 = v138;
          if (v138)
          {
            int v45 = v20[v21];
            if ((v45 & 0x40) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v45 | 0x40;
            *(_DWORD *)(v26 + 100) = atoi(v44);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "ReadUID"))
        {
          uint64_t v46 = v138;
          if (v138)
          {
            int v47 = v20[v21];
            if ((v47 & 0x80) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v47 | 0x80;
            *(_DWORD *)(v26 + 104) = atoi(v46);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "ReadGID"))
        {
          uint64_t v48 = v138;
          if (v138)
          {
            int v49 = v20[v21];
            if ((v49 & 0x100) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v49 | 0x100;
            *(_DWORD *)(v26 + 108) = atoi(v48);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "RefPID"))
        {
          long long v50 = v138;
          if (v138)
          {
            int v51 = v20[v21];
            if ((v51 & 0x200) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v51 | 0x200;
            *(_DWORD *)(v26 + 112) = atoi(v50);
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "Host"))
        {
          uint64_t v52 = v138;
          if (v138)
          {
            int v53 = v20[v21];
            if ((v53 & 0x400) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v53 | 0x400;
            uint64_t v54 = sub_100013588(a1, v52, 0);
            *(void *)(v26 + 24) = v54;
            if (!v54) {
              goto LABEL_110;
            }
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "Sender"))
        {
          uint64_t v55 = v138;
          if (v138)
          {
            int v56 = v20[v21];
            if ((v56 & 0x800) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v56 | 0x800;
            uint64_t v57 = sub_100013588(a1, v55, 0);
            *(void *)(v26 + 32) = v57;
            if (!v57) {
              goto LABEL_110;
            }
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "SenderMachUUID"))
        {
          long long v58 = v138;
          if (v138)
          {
            int v59 = v20[v21];
            if ((v59 & 0x1000) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v59 | 0x1000;
            *(void *)(v26 + 32) = sub_100013588(a1, v58, 0);
            if (!*(void *)(v26 + 40)) {
              goto LABEL_110;
            }
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "Facility"))
        {
          uint64_t v60 = v138;
          if (v138)
          {
            int v61 = v20[v21];
            if ((v61 & 0x2000) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v61 | 0x2000;
            uint64_t v62 = sub_100013588(a1, v60, 0);
            *(void *)(v26 + 48) = v62;
            if (!v62) {
              goto LABEL_110;
            }
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "Message"))
        {
          uint64_t v63 = v138;
          if (v138)
          {
            int v64 = v20[v21];
            if ((v64 & 0x4000) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v64 | 0x4000;
            uint64_t v65 = sub_100013588(a1, v63, 0);
            *(void *)(v26 + 56) = v65;
            if (!v65) {
              goto LABEL_110;
            }
          }
          goto LABEL_99;
        }
        if (!strcmp(v140, "RefProc"))
        {
          uint64_t v66 = v138;
          if (v138)
          {
            int v67 = v20[v21];
            if ((v67 & 0x8000) != 0) {
              goto LABEL_109;
            }
            v20[v21] = v67 | 0x8000;
            uint64_t v68 = sub_100013588(a1, v66, 0);
            *(void *)(v26 + 64) = v68;
            if (!v68) {
              goto LABEL_110;
            }
          }
          goto LABEL_99;
        }
        if (strcmp(v140, "Session")) {
          break;
        }
        uint64_t v69 = v138;
        if (v138)
        {
          int v70 = v20[v21];
          if ((v70 & 0x10000) != 0) {
            goto LABEL_109;
          }
          v20[v21] = v70 | 0x10000;
          uint64_t v71 = sub_100013588(a1, v69, 0);
          *(void *)(v26 + 72) = v71;
          if (!v71)
          {
LABEL_110:
            sub_100012144(a1, v26);
            free((void *)v26);
            int v74 = 0x40000000;
            goto LABEL_103;
          }
        }
LABEL_99:
        if (asl_msg_fetch() == -1) {
          goto LABEL_104;
        }
      }
      uint64_t v27 = sub_100013588(a1, v140, 0);
      if (!v27) {
        goto LABEL_110;
      }
      uint64_t v28 = v27;
      unsigned int v29 = *(_DWORD *)(v26 + 116);
      if (v29)
      {
        unsigned int v30 = 0;
        while (*(void *)(*(void *)(v26 + 80) + 8 * v30) != v27)
        {
          v30 += 2;
          if (v30 >= v29) {
            goto LABEL_36;
          }
        }
LABEL_109:
        sub_100012144(a1, v26);
        free((void *)v26);
        int v74 = 0;
        goto LABEL_103;
      }
LABEL_36:
      __s2 = (char *)sub_100013588(a1, v138, 0);
      int v31 = *(_DWORD *)(v26 + 116);
      if (v31) {
        uint64_t v32 = reallocf(*(void **)(v26 + 80), 8 * (v31 + 2));
      }
      else {
        uint64_t v32 = malloc_type_calloc(2uLL, 8uLL, 0x2004093837F09uLL);
      }
      *(void *)(v26 + 80) = v32;
      if (v32)
      {
        uint64_t v72 = *(unsigned int *)(v26 + 116);
        v32[v72] = v28;
        uint64_t v73 = *(void *)(v26 + 80);
        *(_DWORD *)(v26 + 116) = v72 + 2;
        *(void *)(v73 + 8 * (v72 + 1)) = __s2;
        goto LABEL_99;
      }
      sub_100012144(a1, v26);
      free((void *)v26);
      int v74 = 0x20000000;
LABEL_103:
      uint64_t v26 = 0;
      v20[v21] = v74;
LABEL_104:
      *((void *)v18 + v21) = v26;
      int v75 = v20[v21];
      if (v75 != 0x80000000)
      {
        if (v75 == 0x20000000)
        {
          if (v23)
          {
            uint64_t v88 = v23;
            char v89 = (void **)v18;
            do
            {
              char v90 = *v89++;
              sub_100012144(a1, (uint64_t)v90);
              free(v90);
              --v88;
            }
            while (v88);
          }
          free(v18);
          free(v20);
          return 9999;
        }
        int v22 = 1;
      }
      uint64_t v21 = ++v23;
      if (v16 <= v23)
      {
        int v134 = v22;
        a3 = v124;
        a8 = v122;
        goto LABEL_113;
      }
    }
  }
  int v126 = a6;
  unsigned int v128 = a7;
  int v134 = 0;
  uint64_t v20 = 0;
  int v18 = 0;
LABEL_113:
  unsigned int v76 = *(_DWORD *)(a1 + 28);
  if (!v76)
  {
LABEL_124:
    if (v18)
    {
      if (v16)
      {
        uint64_t v82 = 0;
        unsigned int v83 = 1;
        do
        {
          uint64_t v84 = (void *)*((void *)v18 + v82);
          sub_100012144(a1, (uint64_t)v84);
          free(v84);
          uint64_t v82 = v83;
          BOOL v85 = v16 > v83++;
        }
        while (v85);
      }
      free(v18);
      free(v20);
    }
    return 0;
  }
  int v77 = 0;
  unsigned int v78 = v76 - 1;
  while (1)
  {
    if (a8 < 0)
    {
      unsigned int v79 = (v78 + *(_DWORD *)(a1 + 32)) % v76;
      if (**(void **)(*(void *)(a1 + 8) + 8 * v79) - 1 < a5) {
        break;
      }
      goto LABEL_123;
    }
    unsigned int v79 = (v77 + *(_DWORD *)(a1 + 32)) % v76;
    unint64_t v80 = **(void **)(*(void *)(a1 + 8) + 8 * v79);
    if (v80 && v80 >= a5) {
      break;
    }
LABEL_123:
    ++v77;
    if (--v78 == -1) {
      goto LABEL_124;
    }
  }
  v135.__darwin_time_t tv_sec = 0;
  *(void *)&v135.__darwin_suseconds_t tv_usec = 0;
  if (v128)
  {
    if (gettimeofday(&v135, 0))
    {
      unsigned int v86 = 0;
      unint64_t v87 = 0;
      v135.__darwin_time_t tv_sec = 0;
      *(void *)&v135.__darwin_suseconds_t tv_usec = 0;
    }
    else
    {
      unint64_t v87 = v135.tv_sec + v128 / 0xF4240uLL;
      unsigned int v86 = v135.tv_usec + v128 % 0xF4240;
      if (v86 > 0xF4240)
      {
        v86 -= 1000000;
        v135.__darwin_suseconds_t tv_usec = v86;
        v135.__darwin_time_t tv_sec = ++v87;
      }
    }
  }
  else
  {
    unsigned int v86 = 0;
    unint64_t v87 = 0;
  }
  if (!*(_DWORD *)(a1 + 28))
  {
    int v132 = 0;
    goto LABEL_230;
  }
  __darwin_suseconds_t v121 = v86;
  int v123 = a8;
  __darwin_time_t v129 = v87;
  int v132 = 0;
  int v92 = 0;
  unsigned int v127 = v126 - 1;
  unsigned int v93 = v79;
  uint64_t v125 = a3;
LABEL_142:
  uint64_t v94 = v93;
  if (!**(void **)(*(void *)(a1 + 8) + 8 * v93)) {
    goto LABEL_218;
  }
  int v95 = asl_core_check_access();
  if (!a10 || v95)
  {
    if (v95) {
      goto LABEL_218;
    }
    uint64_t v96 = *(void *)(*(void *)(a1 + 8) + 8 * v94);
  }
  else
  {
    uint64_t v96 = *(void *)(*(void *)(a1 + 8) + 8 * v94);
    uint64_t v97 = *(void *)(v96 + 40);
    if (!v97 || strcmp(*(const char **)(v97 + 8), a10)) {
      goto LABEL_218;
    }
  }
  __int16 v98 = *(_WORD *)(v96 + 120) & 0x7FFF;
  *(_WORD *)(v96 + 120) = v98;
  *a4 = *(void *)v96;
  if (v134)
  {
    if (!v16) {
      goto LABEL_213;
    }
    size_t v99 = 0;
    int v100 = 0;
    while (1)
    {
      int v101 = v20[v99];
      if (v101)
      {
        if (v101 != 0x40000000)
        {
          if (v101 == 0x80000000) {
            goto LABEL_211;
          }
          uint64_t v102 = *(void *)(*(void *)(a1 + 8) + 8 * v94);
          if (v102)
          {
            uint64_t v103 = *((void *)v18 + v99);
            if (!v103) {
              goto LABEL_211;
            }
            if (((v101 & 1) == 0 || *(void *)v103 == *(void *)v102)
              && ((v101 & 2) == 0 || *(void *)(v103 + 8) == *(void *)(v102 + 8))
              && ((v101 & 4) == 0 || *(_DWORD *)(v103 + 88) == *(_DWORD *)(v102 + 88))
              && ((v101 & 8) == 0 || *(unsigned __int8 *)(v103 + 122) == *(unsigned __int8 *)(v102 + 122))
              && ((v101 & 0x10) == 0 || *(_DWORD *)(v103 + 92) == *(_DWORD *)(v102 + 92))
              && ((v101 & 0x20) == 0 || *(_DWORD *)(v103 + 96) == *(_DWORD *)(v102 + 96))
              && ((v101 & 0x40) == 0 || *(_DWORD *)(v103 + 100) == *(_DWORD *)(v102 + 100))
              && ((v101 & 0x80) == 0 || *(_DWORD *)(v103 + 104) == *(_DWORD *)(v102 + 104))
              && ((v101 & 0x100) == 0 || *(_DWORD *)(v103 + 108) == *(_DWORD *)(v102 + 108))
              && ((v101 & 0x200) == 0 || *(_DWORD *)(v103 + 112) == *(_DWORD *)(v102 + 112))
              && ((v101 & 0x400) == 0 || *(void *)(v103 + 24) == *(void *)(v102 + 24))
              && ((v101 & 0x800) == 0 || *(void *)(v103 + 32) == *(void *)(v102 + 32))
              && ((v101 & 0x1000) == 0 || *(void *)(v103 + 40) == *(void *)(v102 + 40))
              && ((v101 & 0x2000) == 0 || *(void *)(v103 + 48) == *(void *)(v102 + 48))
              && ((v101 & 0x4000) == 0 || *(void *)(v103 + 56) == *(void *)(v102 + 56))
              && ((v101 & 0x8000) == 0 || *(void *)(v103 + 64) == *(void *)(v102 + 64))
              && ((v101 & 0x10000) == 0 || *(void *)(v103 + 72) == *(void *)(v102 + 72)))
            {
              unsigned int v104 = *(_DWORD *)(v103 + 116);
              if (!v104) {
                goto LABEL_211;
              }
              unsigned int v105 = *(_DWORD *)(v102 + 116);
              if (v105)
              {
                unsigned int v106 = 0;
                uint64_t v107 = *(void *)(v103 + 80);
                uint64_t v108 = *(void *)(v102 + 80);
                while (1)
                {
                  unsigned int v109 = 1;
                  while (*(void *)(v107 + 8 * v106) != *(void *)(v108 + 8 * (v109 - 1)))
                  {
                    BOOL v110 = 0;
                    unsigned int v111 = v109 + 1;
                    v109 += 2;
                    if (v111 >= v105) {
                      goto LABEL_204;
                    }
                  }
                  if (*(void *)(v107 + 8 * (v106 | 1)) != *(void *)(v108 + 8 * v109)) {
                    break;
                  }
                  v106 += 2;
                  if (v106 >= v104) {
                    goto LABEL_211;
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        uint64_t v112 = *(void *)(*(void *)(a1 + 8) + 8 * v94);
        asl_msg_list_get_index();
        size_t v140 = 0;
        if (!sub_100012214(a1, v112, (uint64_t *)&v140))
        {
          BOOL v110 = asl_msg_cmp() != 0;
          asl_msg_release();
          goto LABEL_204;
        }
      }
      BOOL v110 = 0;
LABEL_204:
      size_t v99 = (v100 + 1);
      BOOL v113 = v16 > v99 && !v110;
      ++v100;
      if (!v113)
      {
        if (v110)
        {
LABEL_211:
          uint64_t v96 = *(void *)(*(void *)(a1 + 8) + 8 * v94);
          __int16 v98 = *(_WORD *)(v96 + 120);
          a3 = v125;
          a8 = v123;
          break;
        }
        a3 = v125;
        a8 = v123;
LABEL_213:
        if (v129 && !gettimeofday(&v136, 0) && (v136.tv_sec > v129 || v136.tv_sec == v129 && v136.tv_usec > v121)) {
          goto LABEL_230;
        }
LABEL_218:
        if (a8 < 0)
        {
          if (v94) {
            unsigned int v93 = v94 - 1;
          }
          else {
            unsigned int v93 = *(_DWORD *)(a1 + 28) - 1;
          }
        }
        else if ((v94 + 1) < *(_DWORD *)(a1 + 28))
        {
          unsigned int v93 = v94 + 1;
        }
        else
        {
          unsigned int v93 = 0;
        }
        if (v93 == *(_DWORD *)(a1 + 32)) {
          goto LABEL_230;
        }
        if (++v92 >= *(_DWORD *)(a1 + 28)) {
          goto LABEL_230;
        }
        goto LABEL_142;
      }
    }
  }
  *(_WORD *)(v96 + 120) = v98 | 0x8000;
  if (v127 >= ++v132) {
    goto LABEL_213;
  }
LABEL_230:
  if (v18)
  {
    if (v16)
    {
      uint64_t v114 = 0;
      unsigned int v115 = 1;
      do
      {
        size_t v116 = (void *)*((void *)v18 + v114);
        sub_100012144(a1, (uint64_t)v116);
        free(v116);
        uint64_t v114 = v115;
        BOOL v85 = v16 > v115++;
      }
      while (v85);
    }
    free(v18);
    free(v20);
  }
  *a3 = 0;
  if (!v132) {
    return 0;
  }
  uint64_t v117 = asl_msg_list_new();
  *a3 = v117;
  if (v117)
  {
    while (1)
    {
      uint64_t v118 = *(void *)(*(void *)(a1 + 8) + 8 * v79);
      int v119 = *(__int16 *)(v118 + 120);
      if (v119 < 0)
      {
        *(_WORD *)(v118 + 120) = v119 & 0x7FFF;
        uint64_t v91 = sub_100012214(a1, v118, &v137);
        if (v91)
        {
          asl_msg_list_release();
          *a3 = 0;
          return v91;
        }
        asl_msg_list_append();
        asl_msg_release();
        if (v132 == 1) {
          return 0;
        }
      }
      if (a8 < 0)
      {
        if (v79) {
          --v79;
        }
        else {
          unsigned int v79 = *(_DWORD *)(a1 + 28) - 1;
        }
      }
      else if (v79 + 1 < *(_DWORD *)(a1 + 28))
      {
        ++v79;
      }
      else
      {
        unsigned int v79 = 0;
      }
      if (v79 == *(_DWORD *)(a1 + 32)) {
        return 0;
      }
    }
  }
  return 9;
}

uint64_t sub_100013588(uint64_t a1, char *__s, int a3)
{
  if (!__s) {
    return 0;
  }
  unsigned int v6 = strlen(__s);
  unsigned int v7 = asl_core_string_hash();
  unsigned int v8 = sub_100013738(a1, v7);
  if (v8 < *(_DWORD *)(a1 + 24))
  {
    unsigned int v9 = *(void **)a1;
    while (1)
    {
      uint64_t v10 = v9[v8];
      if (*(_DWORD *)v10 != v7) {
        break;
      }
      if (!strcmp(__s, *(const char **)(v10 + 8)))
      {
        ++*(_DWORD *)(v10 + 4);
        return v10;
      }
      ++v8;
    }
  }
  if (!a3) {
    return 0;
  }
  uint64_t v11 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040466105CCuLL);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  *uint64_t v11 = v7;
  v11[1] = 1;
  uint64_t v13 = malloc_type_malloc(v6 + 1, 0xC797D749uLL);
  v12[1] = v13;
  if (!v13)
  {
LABEL_18:
    free(v12);
    return 0;
  }
  memcpy(v13, __s, v6);
  *(unsigned char *)(v12[1] + v6) = 0;
  uint64_t v14 = reallocf(*(void **)a1, 8 * (*(_DWORD *)(a1 + 24) + 1));
  *(void *)a1 = v14;
  if (!v14)
  {
    *(_DWORD *)(a1 + 24) = 0;
    goto LABEL_18;
  }
  uint64_t v15 = *(unsigned int *)(a1 + 24);
  if (v15 > v8)
  {
    uint64_t v16 = 8 * v15;
    uint64_t v17 = 8 * (v15 - 1);
    unsigned int v18 = *(_DWORD *)(a1 + 24);
    do
    {
      *(void *)(*(void *)a1 + v16) = *(void *)(*(void *)a1 + v17);
      v16 -= 8;
      v17 -= 8;
      --v18;
    }
    while (v8 < v18);
    uint64_t v14 = *(void **)a1;
  }
  uint64_t v19 = v6 + *(void *)(a1 + 48) + 17;
  v14[v8] = v12;
  *(void *)(a1 + 48) = v19;
  *(_DWORD *)(a1 + 24) = v15 + 1;
  return *(void *)(*(void *)a1 + 8 * v8);
}

uint64_t sub_100013738(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 24);
  if (!v2) {
    return *(unsigned int *)(a1 + 24);
  }
  unsigned int v3 = v2 - 1;
  if (v2 == 1) {
    return ***(_DWORD ***)a1 <= a2;
  }
  uint64_t v5 = *(_DWORD ***)a1;
  if (v3 < 2)
  {
    uint64_t result = 0;
    unsigned int v3 = 1;
LABEL_14:
    if (*v5[result] < a2)
    {
      if (*v5[v3] >= a2) {
        return v3;
      }
      else {
        return v2;
      }
    }
  }
  else
  {
    LODWORD(result) = 0;
    unsigned int v6 = v3 >> 1;
    while (1)
    {
      unsigned int v7 = *v5[v6];
      if (v7 == a2) {
        break;
      }
      if (v7 <= a2)
      {
        uint64_t result = v6;
      }
      else
      {
        unsigned int v3 = v6;
        uint64_t result = result;
      }
      unsigned int v6 = result + ((v3 - result) >> 1);
      if (v3 - result <= 1) {
        goto LABEL_14;
      }
    }
    LODWORD(result) = v6 + 1;
    unsigned int v8 = v5 - 1;
    for (uint64_t i = v6; i * 8; --i)
    {
      int v10 = *v8[i];
      uint64_t result = (result - 1);
      if (v10 != a2) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

void sub_100013808(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = *(_DWORD *)(a2 + 4);
    if (!v4 || (int v5 = v4 - 1, (*(_DWORD *)(a2 + 4) = v5) == 0))
    {
      unsigned int v6 = *(_DWORD *)a2;
      unsigned int v7 = sub_100013738(a1, *(_DWORD *)a2);
      if (**(_DWORD **)(*(void *)a1 + 8 * v7) == v6)
      {
        unint64_t v8 = v7 + 1;
        while (1)
        {
          unsigned int v9 = *(_DWORD **)(*(void *)a1 + 8 * v7);
          if (v9 == (_DWORD *)a2) {
            break;
          }
          if (*v9 == v6)
          {
            ++v7;
            ++v8;
            if (v7 < *(_DWORD *)(a1 + 24)) {
              continue;
            }
          }
          return;
        }
        unint64_t v10 = *(unsigned int *)(a1 + 24);
        if (v8 < v10)
        {
          do
            *(void *)(*(void *)a1 + 8 * v7++) = *(void *)(*(void *)a1 + 8 * v8++);
          while (v8 < v10);
        }
        uint64_t v11 = *(void **)(a2 + 8);
        if (v11) {
          uint64_t v12 = *(void *)(a1 + 48) - strlen(*(const char **)(a2 + 8)) - 17;
        }
        else {
          uint64_t v12 = *(void *)(a1 + 48) - 16;
        }
        *(void *)(a1 + 48) = v12;
        free(v11);
        free((void *)a2);
        uint64_t v13 = *(void **)a1;
        unsigned int v14 = *(_DWORD *)(a1 + 24) - 1;
        *(_DWORD *)(a1 + 24) = v14;
        if (v14)
        {
          uint64_t v15 = reallocf(v13, 8 * v14);
          *(void *)a1 = v15;
          if (!v15) {
            *(_DWORD *)(a1 + 24) = 0;
          }
        }
        else
        {
          free(v13);
          *(void *)a1 = 0;
        }
      }
    }
  }
}

xpc_object_t xpc_object_to_asl_msg(xpc_object_t object)
{
  xpc_object_t v1 = object;
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2000000000;
  uint64_t v7 = 0;
  if (object)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v5[3] = asl_msg_new();
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000;
      applier[2] = sub_100013A24;
      applier[3] = &unk_10001D490;
      applier[4] = &v4;
      xpc_dictionary_apply(v1, applier);
      xpc_object_t v1 = (xpc_object_t)v5[3];
    }
    else
    {
      xpc_object_t v1 = 0;
    }
  }
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100013A24(int a1, int a2, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_null) {
    goto LABEL_21;
  }
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_BOOL)
  {
    xpc_BOOL_get_value(object);
    goto LABEL_21;
  }
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_int64)
  {
    xpc_int64_get_value(object);
LABEL_18:
    snprintf(__str, 0x40uLL, "%lld");
    goto LABEL_21;
  }
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_uint64)
  {
    xpc_uint64_get_value(object);
    snprintf(__str, 0x40uLL, "%llu");
    goto LABEL_21;
  }
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_double)
  {
    xpc_double_get_value(object);
    snprintf(__str, 0x40uLL, "%f");
    goto LABEL_21;
  }
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_date)
  {
    xpc_date_get_value(object);
    goto LABEL_18;
  }
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_data)
  {
    xpc_data_get_length(object);
    xpc_data_get_bytes_ptr(object);
    int v5 = (void *)asl_core_encode_buffer();
    asl_msg_set_key_val_op();
    free(v5);
    return 1;
  }
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_string)
  {
    xpc_string_get_string_ptr(object);
  }
  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_uuid)
  {
    *(_OWORD *)__str = 0u;
    memset(v8, 0, sizeof(v8));
    bytes = xpc_uuid_get_bytes(object);
    uuid_unparse(bytes, __str);
  }
  else if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_fd {
         && xpc_get_type(object) != (xpc_type_t)&_xpc_type_shmem
  }
         && xpc_get_type(object) != (xpc_type_t)&_xpc_type_array
         && xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_get_type(object);
  }
LABEL_21:
  asl_msg_set_key_val_op();
  return 1;
}

xpc_object_t configuration_profile_to_asl_msg()
{
  uint64_t v0 = (void *)configuration_profile_copy_property_list();
  xpc_object_t v1 = xpc_object_to_asl_msg(v0);
  if (v0) {
    xpc_release(v0);
  }
  return v1;
}

char *explode(char *a1, char *__s)
{
  if (!a1) {
    return 0;
  }
  unsigned int v2 = a1;
  LOBYTE(v3) = *a1;
  if (!*a1) {
    return 0;
  }
  unsigned __int8 v5 = 0;
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = 0;
    while (1)
    {
      if (v5)
      {
        if (v3 == v5) {
          unsigned __int8 v5 = 0;
        }
        goto LABEL_16;
      }
      if (strchr(__s, (char)v3)) {
        break;
      }
      if (v3 == 34) {
        char v8 = 34;
      }
      else {
        char v8 = 0;
      }
      if (v3 == 39) {
        unsigned __int8 v5 = 39;
      }
      else {
        unsigned __int8 v5 = v8;
      }
LABEL_16:
      uint64_t v9 = v7 + 1;
      int v3 = v2[++v7];
      if (!v3)
      {
        uint64_t v10 = v9;
        uint64_t v7 = v9;
        goto LABEL_19;
      }
    }
    unsigned __int8 v5 = 0;
    uint64_t v10 = v7;
LABEL_19:
    uint64_t v11 = (const char *)malloc_type_malloc(v10 + 1, 0x9095E2FEuLL);
    if (!v11) {
      return 0;
    }
    uint64_t v12 = (char *)v11;
    if (v10)
    {
      uint64_t v13 = v10;
      unsigned int v14 = v2;
      uint64_t v15 = (char *)v11;
      do
      {
        char v16 = *v14++;
        *v15++ = v16;
        --v13;
      }
      while (v13);
    }
    v11[v7] = 0;
    uint64_t v6 = (char *)sub_100013F48(v11, v6);
    free(v12);
    uint64_t v17 = &v2[v10];
    if (!v2[v10]) {
      break;
    }
    int v3 = v2[v10 + 1];
    if (!v2[v10 + 1])
    {
      uint64_t v6 = (char *)sub_100013F48((const char *)&unk_100019287, v6);
      int v3 = v17[1];
    }
    unsigned int v2 = v17 + 1;
  }
  while (v3);
  return v6;
}

void *sub_100013F48(const char *a1, char *__ptr)
{
  unsigned int v2 = __ptr;
  if (a1)
  {
    if (!__ptr)
    {
      unsigned int v2 = malloc_type_malloc(0x10uLL, 0x10040436913F5uLL);
      if (!v2) {
        return v2;
      }
      char v8 = strdup(a1);
      *unsigned int v2 = v8;
      if (v8)
      {
        v2[1] = 0;
        return v2;
      }
      goto LABEL_11;
    }
    uint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)&__ptr[v4 * 8];
      ++v5;
      ++v4;
    }
    while (v6);
    unsigned int v2 = reallocf(__ptr, (v4 * 8 + 8) & 0x7FFFFFFF8);
    if (v2)
    {
      uint64_t v7 = strdup(a1);
      v2[v4 - 1] = v7;
      if (v7)
      {
        v2[v5] = 0;
        return v2;
      }
LABEL_11:
      free(v2);
      return 0;
    }
  }
  return v2;
}

void free_string_list(void **a1)
{
  if (a1)
  {
    unsigned int v2 = *a1;
    if (v2)
    {
      int v3 = a1 + 1;
      do
      {
        free(v2);
        uint64_t v4 = *v3++;
        unsigned int v2 = v4;
      }
      while (v4);
    }
    free(a1);
  }
}

unsigned char *get_line_from_file(FILE *a1)
{
  size_t __n = 0;
  xpc_object_t v1 = fgetln(a1, &__n);
  if (!v1 || !__n) {
    return 0;
  }
  unsigned int v2 = v1;
  int v3 = malloc_type_malloc(__n + 1, 0x729EE271uLL);
  uint64_t v4 = v3;
  if (v3)
  {
    memcpy(v3, v2, __n);
    size_t v5 = __n;
    if (v4[__n - 1] == 10) {
      size_t v5 = __n - 1;
    }
    v4[v5] = 0;
  }
  return v4;
}

unsigned char *next_word_from_string(unsigned __int8 **a1)
{
  if (!a1) {
    return 0;
  }
  xpc_object_t v1 = *a1;
  if (!*a1) {
    return 0;
  }
  int v2 = *v1;
  BOOL v3 = v2 == 39;
  uint64_t v4 = v2 == 39 ? v1 + 1 : *a1;
  BOOL v5 = *v4 == 34;
  uint64_t v6 = *v4 == 34 ? v4 + 1 : v4;
  int v7 = *v4 == 34 ? v3 + 1 : v2 == 39;
  int v8 = -(int)v1 - v7;
  uint64_t v9 = v6;
  while (1)
  {
    int64_t v10 = ((unint64_t)~v6 << 32) + ((void)v9 << 32);
    for (int i = v8 + v9++; ; i += 2)
    {
      int v12 = *(v9 - 1);
      if (v12 != 92) {
        break;
      }
      if (!*v9) {
        goto LABEL_30;
      }
      v9 += 2;
      v10 += 0x200000000;
    }
    if (!*(v9 - 1)) {
      break;
    }
    if (v12 == 39)
    {
      BOOL v3 = !v3;
    }
    else
    {
      if (v12 == 34) {
        BOOL v5 = !v5;
      }
      if (v12 == 32)
      {
        if (!v3 && !v5) {
          goto LABEL_30;
        }
      }
      else if (v12 == 9 && !v3 && !v5)
      {
        goto LABEL_30;
      }
    }
  }
  --v9;
LABEL_30:
  *a1 = v9;
  if (v2 == 34 || v2 == 39) {
    i -= v2 == v6[v10 >> 32];
  }
  if (!i) {
    return 0;
  }
  uint64_t v13 = malloc_type_malloc(i + 1, 0xCE9497B6uLL);
  unsigned int v14 = v13;
  if (v13)
  {
    memcpy(v13, v6, i);
    v14[i] = 0;
  }
  return v14;
}

uint64_t asl_out_dest_for_path(uint64_t a1, char *__s2)
{
  uint64_t v2 = 0;
  if (a1 && __s2)
  {
    uint64_t v4 = a1;
    while (1)
    {
      uint64_t v5 = *(void *)(v4 + 16);
      if (v5) {
        break;
      }
LABEL_10:
      uint64_t v4 = *(void *)(v4 + 24);
      if (!v4) {
        return 0;
      }
    }
    while (1)
    {
      if (*(_DWORD *)(v5 + 8) == 2)
      {
        uint64_t v2 = *(void *)(v5 + 24);
        if (v2)
        {
          uint64_t v6 = *(const char **)(v2 + 8);
          if (v6)
          {
            if (!strcmp(v6, __s2)) {
              break;
            }
          }
        }
      }
      uint64_t v5 = *(void *)(v5 + 40);
      if (!v5) {
        goto LABEL_10;
      }
    }
  }
  return v2;
}

uint64_t asl_out_mkpath(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a2 + 24);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(const char **)(v3 + 8);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  snprintf(__str, 0x400uLL, "%s", v4);
  if (*(_DWORD *)(a2 + 8) != 13)
  {
    uint64_t v6 = strrchr(__str, 47);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    char *v6 = 0;
  }
  memset(&v21, 0, sizeof(v21));
  if (stat(__str, &v21))
  {
    if (*__error() != 2) {
      return 0xFFFFFFFFLL;
    }
    int v7 = *(_DWORD *)(*(void *)(a2 + 24) + 72);
    uint64_t result = (uint64_t)explode(__str, "/");
    if (result)
    {
      uint64_t v9 = (void **)result;
      asl_string_new();
      if (v9[__str[0] == 47])
      {
        int64_t v10 = &v9[(__str[0] == 47) + 1];
        while (1)
        {
          memset(&v22, 0, sizeof(v22));
          asl_string_append_char_no_encoding();
          asl_string_append_no_encoding();
          uint64_t v11 = (char *)asl_string_bytes();
          memset(&v22, 0, sizeof(v22));
          if (lstat(v11, &v22)) {
            break;
          }
          int v17 = v22.st_mode & 0xF000;
          if (v17 == 40960)
          {
            if (!realpath_DARWIN_EXTSN(v11, v24)) {
              goto LABEL_39;
            }
            memset(&v22, 0, sizeof(v22));
            if (stat(v24, &v22)) {
              break;
            }
            int v17 = v22.st_mode & 0xF000;
          }
          if (v17 != 0x4000) {
            goto LABEL_39;
          }
LABEL_34:
          if (!*v10++) {
            goto LABEL_35;
          }
        }
        if (*__error() != 2 || (uint64_t v12 = asl_out_dest_for_path(a1, v11), v13 = v12, (v7 & 0x20) != 0) && !v12)
        {
LABEL_39:
          asl_string_release();
          free_string_list(v9);
          return 0xFFFFFFFFLL;
        }
        if (v12)
        {
          if (*(_WORD *)(v12 + 116) == 4096) {
            mode_t v14 = 493;
          }
          else {
            mode_t v14 = *(_WORD *)(v12 + 116);
          }
          mode_t v15 = umask(0);
          mkdir(v11, v14);
          umask(v15);
          if (*(_DWORD *)(v13 + 128)) {
            uid_t v16 = **(_DWORD **)(v13 + 120);
          }
          else {
            uid_t v16 = 0;
          }
          if (*(_DWORD *)(v13 + 144))
          {
            gid_t v19 = **(_DWORD **)(v13 + 136);
LABEL_33:
            chown(v11, v16, v19);
            goto LABEL_34;
          }
        }
        else
        {
          mode_t v18 = umask(0);
          mkdir(v11, 0x1EDu);
          umask(v18);
          uid_t v16 = 0;
        }
        gid_t v19 = 80;
        goto LABEL_33;
      }
LABEL_35:
      asl_string_release();
      free_string_list(v9);
      return 0;
    }
  }
  else if ((v21.st_mode & 0xF000) == 0x4000)
  {
    return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
  return result;
}

time_t asl_make_timestamp(time_t result, char a2, char *__str, size_t __size)
{
  time_t v38 = result;
  if (__str)
  {
    if ((a2 & 4) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d-%02d-%02dT%02d:%02d:%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 8) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d%02d%02dT%02d%02d%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 0x10) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v6) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v6 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v7 = 45;
      }
      else
      {
        uint64_t v7 = 43;
      }
      unint64_t v10 = v6 / 0xE10uLL;
      unsigned int v11 = v6 % 0xE10;
      unsigned __int16 v12 = v6 % 0xE10;
      uint64_t v13 = v12 / 0x3Cu;
      unsigned __int16 v14 = v12 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v12 % 0x3Cu)
      {
        uint64_t v32 = v7;
        unint64_t v34 = v10;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        gid_t v19 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u:%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v11 >= 0x3C)
      {
        unint64_t v35 = v10;
        uint64_t v36 = v12 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v7;
        uint64_t v29 = v37.tm_min;
        uint64_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u";
      }
      else
      {
        uint64_t v33 = v7;
        unint64_t v35 = v10;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        uint64_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u";
      }
    }
    else
    {
      if ((a2 & 0x20) == 0) {
        return snprintf(__str, __size, "%c%llu");
      }
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v8) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v8 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v9 = 45;
      }
      else
      {
        uint64_t v9 = 43;
      }
      unint64_t v21 = v8 / 0xE10uLL;
      unsigned int v22 = v8 % 0xE10;
      unsigned __int16 v23 = v8 % 0xE10;
      uint64_t v13 = v23 / 0x3Cu;
      unsigned __int16 v14 = v23 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v23 % 0x3Cu)
      {
        uint64_t v32 = v9;
        unint64_t v34 = v21;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        gid_t v19 = "%d%02d%02dT%02d%02d%02d%c%02u%02u%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v22 >= 0x3C)
      {
        unint64_t v35 = v21;
        uint64_t v36 = v23 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v9;
        uint64_t v29 = v37.tm_min;
        uint64_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u%02u";
      }
      else
      {
        uint64_t v33 = v9;
        unint64_t v35 = v21;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        uint64_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u";
      }
    }
    return snprintf(__str, __size, v20, v15, v16, tm_mday, tm_hour, v29, v31, v33, v35, v36);
  }
  return result;
}

uint64_t asl_dst_make_current_name(uint64_t result, int a2, char *a3, size_t a4)
{
  if (result && a3)
  {
    uint64_t v6 = result;
    int v7 = *(_DWORD *)(result + 72) | a2;
    time_t v8 = *(void *)(result + 176);
    if (!v8)
    {
      time_t v8 = time(0);
      *(void *)(v6 + 176) = v8;
    }
    asl_make_timestamp(v8, *(_DWORD *)(v6 + 64), __str, 0x20uLL);
    if ((v7 & 0x2000) != 0) {
      return snprintf(a3, a4, "%s.%s");
    }
    if ((v7 & 0x100) == 0) {
      return snprintf(a3, a4, "%s");
    }
    if (*(void *)v6 && (*(unsigned char *)(v6 + 67) & 0x40) != 0) {
      return snprintf(a3, a4, "%s/%s.%s.%s");
    }
    else {
      return snprintf(a3, a4, "%s.%s");
    }
  }
  return result;
}

uint64_t asl_check_option(uint64_t a1, char *__s)
{
  uint64_t v2 = 0;
  if (a1 && __s)
  {
    size_t v4 = strlen(__s);
    if (!v4) {
      return 0;
    }
    uint64_t val_for_key = (const char *)asl_msg_get_val_for_key();
    if (!val_for_key) {
      return 0;
    }
    uint64_t v6 = val_for_key;
    uint64_t v2 = *(unsigned __int8 *)val_for_key;
    if (*val_for_key)
    {
      while (1)
      {
LABEL_6:
        if ((int)v2 <= 31)
        {
          if (v2 != 9)
          {
            if (!v2) {
              return v2;
            }
LABEL_13:
            if (strncasecmp(v6, __s, v4)
              || ((v6 += v4, uint64_t v2 = *(unsigned __int8 *)v6, v2 <= 0x2C)
                ? (BOOL v8 = ((1 << v2) & 0x100100000201) == 0)
                : (BOOL v8 = 1),
                  v8))
            {
              while (1)
              {
                if ((int)v2 > 31)
                {
                  if (v2 == 32 || v2 == 44) {
                    goto LABEL_6;
                  }
                }
                else
                {
                  if (!v2) {
                    return v2;
                  }
                  if (v2 == 9) {
                    goto LABEL_6;
                  }
                }
                unsigned int v9 = *(unsigned __int8 *)++v6;
                uint64_t v2 = v9;
              }
            }
            return 1;
          }
        }
        else if (v2 != 44 && v2 != 32)
        {
          goto LABEL_13;
        }
        unsigned int v7 = *(unsigned __int8 *)++v6;
        uint64_t v2 = v7;
      }
    }
  }
  return v2;
}

void asl_out_dst_data_release(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 168);
    if (!v2 || (int v3 = v2 - 1, (*(_DWORD *)(a1 + 168) = v3) == 0))
    {
      free(*(void **)a1);
      free(*(void **)(a1 + 8));
      free(*(void **)(a1 + 16));
      free(*(void **)(a1 + 40));
      free(*(void **)(a1 + 48));
      free(*(void **)(a1 + 32));
      free(*(void **)(a1 + 24));
      free(*(void **)(a1 + 120));
      free(*(void **)(a1 + 136));
      free((void *)a1);
    }
  }
}

uint64_t asl_out_dst_data_retain(uint64_t result)
{
  if (result) {
    ++*(_DWORD *)(result + 168);
  }
  return result;
}

uint64_t asl_out_dst_set_access(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    uid_t v4 = *(_DWORD *)(a2 + 128);
    if (v4) {
      uid_t v4 = **(_DWORD **)(a2 + 120);
    }
    if (*(_DWORD *)(a2 + 144)) {
      gid_t v5 = **(_DWORD **)(a2 + 136);
    }
    else {
      gid_t v5 = 80;
    }
    fchown(a1, v4, v5);
    return a1;
  }
  return result;
}

uint64_t asl_out_dst_file_create_open(uint64_t a1, char **a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!*(void *)(a1 + 8)) {
    return 0xFFFFFFFFLL;
  }
  asl_dst_make_current_name(a1, 0, __s1, 0x400uLL);
  free(*(void **)(a1 + 16));
  uid_t v4 = strdup(__s1);
  *(void *)(a1 + 16) = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    *a2 = strdup(__s1);
  }
  memset(&v10, 0, sizeof(v10));
  if (!stat(__s1, &v10))
  {
    if ((v10.st_mode & 0xF000) == 0x8000)
    {
      uint64_t v7 = open(__s1, 2058, 0);
      if (!*(void *)(a1 + 176))
      {
        __darwin_time_t tv_sec = v10.st_birthtimespec.tv_sec;
        *(void *)(a1 + 176) = v10.st_birthtimespec.tv_sec;
        if (!tv_sec) {
          *(void *)(a1 + 176) = v10.st_mtimespec.tv_sec;
        }
      }
      *(void *)(a1 + 184) = v10.st_size;
      if ((~*(_DWORD *)(a1 + 72) & 0x300) == 0) {
        goto LABEL_18;
      }
      return v7;
    }
    return 0xFFFFFFFFLL;
  }
  if (*__error() != 2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = open(__s1, 2562, *(_WORD *)(a1 + 116) & 0x1B6);
  if ((v5 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  *(void *)(a1 + 176) = time(0);
  uint64_t v7 = asl_out_dst_set_access(v6, a1);
  if ((v7 & 0x80000000) != 0) {
    unlink(__s1);
  }
  if ((~*(_DWORD *)(a1 + 72) & 0x300) == 0)
  {
    unlink(*(const char **)(a1 + 8));
LABEL_18:
    symlink(__s1, *(const char **)(a1 + 8));
  }
  return v7;
}

void asl_out_module_free(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      free(*(void **)v1);
      int v3 = *(void **)(v1 + 16);
      if (v3)
      {
        do
        {
          uid_t v4 = (void *)*((void *)v3 + 5);
          uint64_t v5 = *((void *)v3 + 3);
          if (v5) {
            asl_out_dst_data_release(v5);
          }
          if (*(void *)v3) {
            asl_msg_release();
          }
          free(*((void **)v3 + 2));
          free(v3);
          int v3 = v4;
        }
        while (v4);
      }
      free((void *)v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

_DWORD *asl_out_module_new(const char *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x10300408DF105C4uLL);
  uint64_t result = 0;
  if (a1 && v2)
  {
    uid_t v4 = strdup(a1);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      v2[2] = 1;
      return v2;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return result;
}

void *asl_out_module_parse_line(uint64_t a1, unsigned __int8 *a2)
{
  while (1)
  {
    unsigned int v4 = *a2;
    if (v4 > 0x1F) {
      break;
    }
    if (v4 != 9) {
      return 0;
    }
LABEL_6:
    ++a2;
  }
  if (*a2 <= 0x29u)
  {
    if (v4 != 32) {
      return 0;
    }
    goto LABEL_6;
  }
  if (*a2 > 0x3Du)
  {
    if (v4 != 62)
    {
      if (v4 != 63 && v4 != 81) {
        return 0;
      }
LABEL_20:
      if (!a1) {
        return 0;
      }
      uint64_t v6 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
      if (!v6) {
        return v6;
      }
      unsigned int v9 = (char *)sub_100016A74((uint64_t)a2);
      if (!v9) {
        return 0;
      }
      stat v10 = v9;
      unsigned int v11 = strchr(v9, 32);
      if (v11 || (unsigned int v11 = strchr(v10, 9)) != 0)
      {
        char v12 = 0;
        *unsigned int v11 = 0;
      }
      else
      {
        char v12 = 1;
      }
      if (!strcasecmp(v10, "ignore"))
      {
        int v13 = 3;
      }
      else if (!strcasecmp(v10, "skip"))
      {
        int v13 = 4;
      }
      else if (!strcasecmp(v10, "claim"))
      {
        int v13 = 5;
      }
      else if (!strcasecmp(v10, "notify"))
      {
        int v13 = 6;
      }
      else if (!strcasecmp(v10, "file"))
      {
        int v13 = 14;
      }
      else if (!strcasecmp(v10, "asl_file"))
      {
        int v13 = 12;
      }
      else if (!strcasecmp(v10, "directory") {
             || !strcasecmp(v10, "dir")
      }
             || !strcasecmp(v10, "asl_directory")
             || !strcasecmp(v10, "asl_dir")
             || !strcasecmp(v10, "store_dir")
             || !strcasecmp(v10, "store_directory"))
      {
        int v13 = 13;
      }
      else if (!strcasecmp(v10, "control"))
      {
        int v13 = 16;
      }
      else if (!strcasecmp(v10, "save") || !strcasecmp(v10, "store"))
      {
        int v13 = 11;
      }
      else if (!strcasecmp(v10, "access"))
      {
        int v13 = 8;
      }
      else if (!strcasecmp(v10, "set"))
      {
        int v13 = 9;
      }
      else if (!strcasecmp(v10, "unset"))
      {
        int v13 = 10;
      }
      else
      {
        if (strcmp(*(const char **)a1, "com.apple.asl")) {
          goto LABEL_81;
        }
        if (strcasecmp(v10, "broadcast"))
        {
          if (!strcasecmp(v10, "forward"))
          {
            int v13 = 15;
            goto LABEL_80;
          }
LABEL_81:
          if (*((_DWORD *)v6 + 2))
          {
            if (v12) {
              goto LABEL_91;
            }
            for (int i = v11 + 1; ; ++i)
            {
              int v24 = *(i - 1);
              if (v24 != 32 && v24 != 9) {
                break;
              }
            }
            uint64_t v26 = sub_100016AEC(i);
            *((void *)v6 + 2) = v26;
            if (v26)
            {
LABEL_91:
              *(v10 - 1) = 0;
              if (*a2 == 42)
              {
                uint64_t v27 = asl_msg_new();
              }
              else
              {
                *a2 = 81;
                uint64_t v27 = asl_msg_from_string();
              }
              *(void *)uint64_t v6 = v27;
              if (v27)
              {
                if (*((_DWORD *)v6 + 2) != 11) {
                  goto LABEL_108;
                }
                uint64_t v28 = (unsigned __int8 *)*((void *)v6 + 2);
                if (v28)
                {
                  if (strncmp(*((const char **)v6 + 2), "/var/log/asl", 0xCuLL))
                  {
                    *((_DWORD *)v6 + 2) = 12;
                    goto LABEL_108;
                  }
                  uint64_t v31 = a1;
                  unsigned int v30 = v28;
                }
                else
                {
                  unsigned int v30 = "/var/log/asl";
                  uint64_t v31 = a1;
                }
                uint64_t v32 = sub_100015570(v31, v30, 493);
                if (v32) {
                  ++v32[42];
                }
                *((void *)v6 + 3) = v32;
LABEL_108:
                int v33 = *((_DWORD *)v6 + 2);
                if ((v33 - 12) > 2) {
                  goto LABEL_133;
                }
                if (v33 == 13) {
                  __int16 v34 = 493;
                }
                else {
                  __int16 v34 = 420;
                }
                unint64_t v35 = sub_100015570(a1, *((unsigned __int8 **)v6 + 2), v34);
                if (!v35)
                {
                  *((void *)v6 + 3) = 0;
                  *((_DWORD *)v6 + 2) = 0;
                  return v6;
                }
                uint64_t v36 = v35;
                ++v35[42];
                *((void *)v6 + 3) = v35;
                if (*((_WORD *)v35 + 58) == 4096) {
                  *((_WORD *)v35 + 58) = v34;
                }
                int v37 = *((_DWORD *)v6 + 2);
                if (v37 == 12)
                {
LABEL_121:
                  unsigned int v39 = v36[18] | 0x1000;
                }
                else
                {
                  if (v37 == 13)
                  {
                    unsigned int v40 = v35[18];
                    unsigned int v41 = v40 & 0xFFFFDFF7 | 0x2000;
                    if (!v35[16] && (v40 & 0x100) != 0) {
                      v35[16] |= 0x20u;
                    }
                  }
                  else
                  {
                    if (v37 == 14)
                    {
                      time_t v38 = (const char *)*((void *)v35 + 3);
                      if (v38 && !strcasecmp(v38, "asl"))
                      {
                        *((_DWORD *)v6 + 2) = 12;
                        goto LABEL_121;
                      }
LABEL_129:
                      if (!v36[32])
                      {
                        sub_100016B94(v36, "0");
                        uint64_t v36 = (unsigned int *)*((void *)v6 + 3);
                      }
                      if (!v36[36]) {
                        sub_100016C44(v36, "80");
                      }
LABEL_133:
                      uint64_t v42 = *(void *)(a1 + 16);
                      if (v42)
                      {
                        do
                        {
                          uint64_t v22 = v42;
                          uint64_t v42 = *(void *)(v42 + 40);
                        }
                        while (v42);
                        goto LABEL_135;
                      }
LABEL_136:
                      *(void *)(a1 + 16) = v6;
                      return v6;
                    }
                    unsigned int v41 = v35[18];
                  }
                  unsigned int v39 = v41 & 0xFFFFFFFB;
                }
                v36[18] = v39;
                goto LABEL_129;
              }
LABEL_99:
              free(*((void **)v6 + 2));
            }
          }
LABEL_100:
          free(v6);
          return 0;
        }
        int v13 = 7;
      }
LABEL_80:
      *((_DWORD *)v6 + 2) = v13;
      goto LABEL_81;
    }
    sub_100015570(a1, a2 + 1, 4096);
    return 0;
  }
  if (v4 == 42) {
    goto LABEL_20;
  }
  if (v4 != 61 || !a1) {
    return 0;
  }
  uint64_t v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  uint64_t v6 = v5;
  if (!v5) {
    return v6;
  }
  for (uint64_t j = (char *)(a2 + 1); ; ++j)
  {
    int v8 = *j;
    if (v8 != 39 && v8 != 32) {
      break;
    }
  }
  *((_DWORD *)v5 + 2) = 1;
  if (*j != 91)
  {
    int v17 = strchr((char *)a2, 91);
    if (!v17)
    {
      *((void *)v6 + 2) = sub_100016AEC(j);
      goto LABEL_76;
    }
    mode_t v18 = v17;
    if (!strncmp(v17, "[File ", 6uLL) || !strncmp(v18, "[File\t", 6uLL))
    {
      int v19 = 17;
    }
    else if (!strncmp(v18, "[Plist ", 7uLL) || !strncmp(v18, "[Plist\t", 7uLL))
    {
      int v19 = 18;
    }
    else
    {
      if (strncmp(v18, "[Profile ", 9uLL) && strncmp(v18, "[Profile\t", 9uLL)) {
        goto LABEL_74;
      }
      int v19 = 19;
    }
    *((_DWORD *)v6 + 2) = v19;
LABEL_74:
    *((unsigned char *)v18 - 1) = 0;
    *((void *)v6 + 2) = sub_100016AEC(j);
    *((_WORD *)v18 - 1) = 8273;
    goto LABEL_75;
  }
  unsigned __int16 v14 = (char *)sub_100016A74((uint64_t)a2);
  if (!v14) {
    goto LABEL_100;
  }
  uint64_t v15 = v14;
  *((void *)v6 + 2) = sub_100016AEC(v14);
  if (*(v15 - 1) == 93) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = -1;
  }
  v15[v16] = 0;
  *a2 = 81;
LABEL_75:
  uint64_t v20 = asl_msg_from_string();
  *(void *)uint64_t v6 = v20;
  if (!v20) {
    goto LABEL_99;
  }
LABEL_76:
  uint64_t v21 = *(void *)(a1 + 16);
  if (!v21) {
    goto LABEL_136;
  }
  do
  {
    uint64_t v22 = v21;
    uint64_t v21 = *(void *)(v21 + 40);
  }
  while (v21);
LABEL_135:
  *(void *)(v22 + 40) = v6;
  return v6;
}

unsigned int *sub_100015570(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  int v3 = 0;
  if (!a1 || !a2) {
    return v3;
  }
  while (1)
  {
    int v6 = *a2;
    if (v6 != 32 && v6 != 9) {
      break;
    }
    ++a2;
  }
  __s = 0;
  int v56 = a2;
  int v8 = next_word_from_string(&v56);
  __s = v8;
  if (!v8) {
    return 0;
  }
  uint64_t v54 = a1;
  unsigned int v9 = (void **)explode(v8, "/");
  uint64_t v10 = asl_string_new();
  BOOL v11 = 0;
  int v12 = 5;
  __int16 v53 = a3;
  if (v9 && v10)
  {
    int v13 = 5;
    while (1)
    {
      unsigned __int16 v14 = (char *)*v9;
      if (*v9) {
        break;
      }
      BOOL v11 = 0;
      int v15 = 0;
LABEL_33:
      free_string_list(v9);
      if (v15 != 1 || v11)
      {
        unsigned int v9 = 0;
        int v12 = v13;
        goto LABEL_40;
      }
      free(__s);
      __s = (char *)asl_string_release_return_bytes();
      uint64_t v20 = asl_string_new();
      uint64_t v21 = explode(__s, "/");
      unsigned int v9 = (void **)v21;
      int v12 = v13 - 1;
      if (v13 >= 2)
      {
        if (v21)
        {
          --v13;
          if (v20) {
            continue;
          }
        }
      }
      goto LABEL_40;
    }
    int v15 = 0;
    BOOL v11 = 0;
    unsigned int v16 = 1;
    int v17 = (const char **)v9;
    while (strncmp(v14, "$ENV(", 5uLL))
    {
      if (v16 == 1)
      {
        if (!*(unsigned char *)*v9) {
          goto LABEL_25;
        }
      }
      else
      {
        asl_string_append_char_no_encoding();
      }
      asl_string_append_no_encoding();
      if (!v11)
      {
LABEL_29:
        BOOL v11 = strcmp(*v17, "..") == 0;
        goto LABEL_30;
      }
LABEL_26:
      BOOL v11 = 1;
LABEL_30:
      int v17 = (const char **)&v9[v16];
      unsigned __int16 v14 = (char *)*v17;
      ++v16;
      if (!*v17) {
        goto LABEL_33;
      }
    }
    mode_t v18 = strchr(v14, 41);
    if (v18)
    {
      *mode_t v18 = 0;
      unsigned __int16 v14 = (char *)*v17;
    }
    int v19 = getenv(v14 + 5);
    if (v19)
    {
      if (*v19 != 47) {
        asl_string_append_char_no_encoding();
      }
      asl_string_append_no_encoding();
      int v15 = 1;
    }
LABEL_25:
    if (!v11) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
LABEL_40:
  free(__s);
  free_string_list(v9);
  if (v11 || !v12)
  {
    asl_string_release();
    return 0;
  }
  uint64_t v22 = asl_string_release_return_bytes();
  __s = (char *)v22;
  uint64_t v23 = v54;
  for (uint64_t i = *(void *)(v54 + 16); i; uint64_t i = *(void *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      int v3 = *(unsigned int **)(i + 24);
      if (v3)
      {
        uint64_t v25 = (const char *)*((void *)v3 + 1);
        if (v22 && v25)
        {
          if (*(unsigned char *)v22 != 47)
          {
            uint64_t v26 = strrchr(*((char **)v3 + 1), 47);
            if (v26) {
              uint64_t v25 = v26 + 1;
            }
          }
          if (!strcmp((const char *)v22, v25))
          {
LABEL_178:
            free((void *)v22);
            return v3;
          }
        }
        else if (!(v22 | (unint64_t)v25))
        {
          goto LABEL_178;
        }
      }
    }
  }
  if (*(unsigned char *)v22 == 47)
  {
    int v27 = 8;
    if (strncmp((const char *)v22, "/var/log/", 9uLL))
    {
      if (!strncmp((const char *)v22, "/Library/Logs/", 0xEuLL)) {
        int v27 = 8;
      }
      else {
        int v27 = 40;
      }
    }
  }
  else
  {
    if (!strcmp(*(const char **)v54, "com.apple.asl")) {
      asprintf(&__s, "%s/%s");
    }
    else {
      asprintf(&__s, "%s/module/%s/%s");
    }
    free((void *)v22);
    int v27 = 8;
  }
  uint64_t v28 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  uint64_t v29 = (unsigned int *)malloc_type_calloc(1uLL, 0xC8uLL, 0x10D00407E9428A6uLL);
  int v3 = v29;
  if (!v28 || !v29)
  {
    free(__s);
    free(v28);
    free(v3);
    return 0;
  }
  v29[42] = 1;
  unsigned int v30 = __s;
  *((void *)v29 + 1) = __s;
  uint64_t v31 = strrchr(v30, 47);
  if (v31)
  {
    uint64_t v32 = v31;
    *uint64_t v31 = 0;
    *(void *)int v3 = strdup(*((const char **)v3 + 1));
    *uint64_t v32 = 47;
    unsigned int v30 = __s;
  }
  *((_WORD *)v3 + 58) = v53;
  v3[28] = 604800;
  v3[18] = v27;
  int v33 = strrchr(v30, 47);
  if (v33) {
    __int16 v34 = v33 + 1;
  }
  else {
    __int16 v34 = v30;
  }
  unint64_t v35 = strrchr(v30, 46);
  if (v35)
  {
    uint64_t v36 = v35;
    *unint64_t v35 = 0;
    *((void *)v3 + 6) = strdup(v35 + 1);
    *((void *)v3 + 5) = strdup(v34);
    *uint64_t v36 = 46;
  }
  else
  {
    *((void *)v3 + 5) = strdup(v34);
  }
  time_t v38 = next_word_from_string(&v56);
  if (v38)
  {
    unsigned int v39 = v38;
    do
    {
      if (!strncasecmp(v39, "mode=", 5uLL))
      {
        *((_WORD *)v3 + 58) = strtol(v39 + 5, 0, 0);
      }
      else if (!strncasecmp(v39, "uid=", 4uLL))
      {
        sub_100016B94(v3, v39 + 4);
      }
      else if (!strncasecmp(v39, "gid=", 4uLL))
      {
        sub_100016C44(v3, v39 + 4);
      }
      else
      {
        if (!strncasecmp(v39, "fmt=", 4uLL))
        {
          unsigned int v41 = v39 + 4;
LABEL_109:
          *((void *)v3 + 3) = sub_100016CF4(v41);
          goto LABEL_124;
        }
        if (!strncasecmp(v39, "format=", 7uLL))
        {
          unsigned int v41 = v39 + 7;
          goto LABEL_109;
        }
        if (!strncasecmp(v39, "dest=", 5uLL))
        {
          uint64_t v42 = v39 + 5;
LABEL_112:
          *((void *)v3 + 4) = sub_100016AEC(v42);
          goto LABEL_124;
        }
        if (!strncasecmp(v39, "dst=", 4uLL))
        {
          uint64_t v42 = v39 + 4;
          goto LABEL_112;
        }
        if (!strncasecmp(v39, "coalesce=", 9uLL))
        {
          if (!strncasecmp(v39 + 9, "0", 1uLL) || !strncasecmp(v39 + 9, "off", 3uLL))
          {
            v3[18] &= ~8u;
            uint64_t v23 = v54;
          }
          else
          {
            uint64_t v23 = v54;
            if (!strncasecmp(v39 + 9, "false", 5uLL))
            {
              unsigned int v40 = v3[18] & 0xFFFFFFF7;
              goto LABEL_123;
            }
          }
        }
        else
        {
          if (!strncasecmp(v39, "compress", 8uLL))
          {
            unsigned int v40 = v3[18] | 0x10;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "extern", 6uLL))
          {
            unsigned int v40 = v3[18] | 0x40;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "truncate", 8uLL))
          {
            unsigned int v40 = v3[18] | 0x80;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "dir", 3uLL))
          {
            unsigned int v40 = v3[18] | 0x2000;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "soft", 4uLL))
          {
            unsigned int v40 = v3[18] | 0x800;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "file_max=", 9uLL))
          {
            *((void *)v3 + 19) = asl_core_str_to_size();
            goto LABEL_124;
          }
          if (!strncasecmp(v39, "all_max=", 8uLL))
          {
            *((void *)v3 + 20) = asl_core_str_to_size();
            goto LABEL_124;
          }
          if (!strncasecmp(v39, "style=", 6uLL) || !strncasecmp(v39, "rotate=", 7uLL))
          {
            uint64_t v43 = 6;
            if (*v39 == 114) {
              uint64_t v43 = 7;
            }
            if (sub_100016DD4((uint64_t)v3, &v39[v43])) {
              goto LABEL_124;
            }
LABEL_136:
            unsigned int v40 = v3[18] | 4;
LABEL_123:
            v3[18] = v40;
            goto LABEL_124;
          }
          if (!strncasecmp(v39, "rotate", 6uLL))
          {
            if (*((void *)v3 + 6)) {
              int v44 = 536870913;
            }
            else {
              int v44 = 268435457;
            }
            v3[16] = v44;
            goto LABEL_136;
          }
          if (!strncasecmp(v39, "crashlog", 8uLL))
          {
            unsigned int v40 = v3[18] & 0xFFFFFAF3 | 0x504;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "basestamp", 9uLL))
          {
            unsigned int v40 = v3[18] | 0x100;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "link", 4uLL) || !strncasecmp(v39, "symlink", 7uLL))
          {
            unsigned int v40 = v3[18] | 0x200;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "ttl", 3uLL))
          {
            uint64_t v45 = (char)v39[3];
            if (v45 == 61)
            {
              v3[28] = asl_core_str_to_time();
              uint64_t v23 = v54;
            }
            else
            {
              uint64_t v23 = v54;
              if ((v45 & 0xFFFFFFF8) == 0x30 && v39[4] == 61) {
                v3[(v45 - 48) + 20] = asl_core_str_to_time();
              }
            }
            goto LABEL_124;
          }
          uint64_t v23 = v54;
          if (!strncasecmp(v39, "size_only", 9uLL))
          {
            unsigned int v40 = v3[18] | 0x8000;
            goto LABEL_123;
          }
        }
      }
LABEL_124:
      free(v39);
      unsigned int v39 = next_word_from_string(&v56);
    }
    while (v39);
  }
  uint64_t v46 = (const char *)*((void *)v3 + 1);
  if (!strncasecmp(v46, "/Library/Logs/CrashReporter", 0x1BuLL)
    || !strncasecmp(v46, "/var/mobile/Library/Logs/CrashReporter", 0x26uLL)
    || !strncasecmp(v46, "/private/var/mobile/Library/Logs/CrashReporter", 0x2EuLL))
  {
    v3[18] = v3[18] & 0xFFFFFAF3 | 0x504;
  }
  unsigned int v47 = v3[28];
  for (uint64_t j = 20; j != 28; ++j)
  {
    unsigned int v49 = v3[j];
    if (v49 > v47)
    {
      v3[28] = v49;
      unsigned int v47 = v49;
    }
  }
  long long v50 = (char *)*((void *)v3 + 3);
  if (!v50)
  {
    long long v50 = strdup("std");
    *((void *)v3 + 3) = v50;
  }
  if (strcmp(v50, "std") && strcmp(v50, "bsd")) {
    v3[18] &= ~8u;
  }
  if (!strcmp(v50, "std") || !strcmp(v50, "bsd") || !strcmp(v50, "msg"))
  {
    unsigned int v51 = v3[18] | 0x4000;
    v3[18] = v51;
  }
  else
  {
    unsigned int v51 = v3[18];
  }
  if ((~v51 & 0x102) == 0)
  {
    unsigned int v51 = v51 & 0xFFFFFFFC | 1;
    v3[18] = v51;
  }
  if (!strcmp(v50, "raw")) {
    *((void *)v3 + 7) = "sec";
  }
  if (!strcmp(v46, "/var/log/asl"))
  {
    unsigned int v51 = 0x2000;
    v3[18] = 0x2000;
  }
  uint64_t v52 = *((void *)v3 + 19);
  if (!v52)
  {
    uint64_t v52 = *((void *)v3 + 20);
    *((void *)v3 + 19) = v52;
  }
  if ((v51 & 0x8000) != 0 && (!v52 || !*((void *)v3 + 20)))
  {
    v51 &= ~0x8000u;
    v3[18] = v51;
  }
  if ((~v51 & 0x8400) == 0) {
    v3[18] = v51 & 0xFFFF7FFF;
  }
  *((_DWORD *)v28 + 2) = 2;
  *((void *)v28 + 3) = v3;
  *((void *)v28 + 5) = *(void *)(v23 + 16);
  *(void *)(v23 + 16) = v28;
  return v3;
}

_DWORD *asl_out_module_init_from_file(const char *a1, FILE *a2)
{
  if (!a2) {
    return 0;
  }
  int v3 = asl_out_module_new(a1);
  if (v3)
  {
    line_from_file = get_line_from_file(a2);
    if (line_from_file)
    {
      uint64_t v5 = line_from_file;
      do
      {
        asl_out_module_parse_line((uint64_t)v3, v5);
        free(v5);
        uint64_t v5 = get_line_from_file(a2);
      }
      while (v5);
    }
  }
  return v3;
}

_DWORD *asl_out_module_init()
{
  *(void *)uint64_t v5 = 0;
  sub_1000161D8((DIR *)v5, "/usr/local/etc/asl", 2);
  sub_1000161D8((DIR *)v5, "/etc/asl", 0);
  uint64_t v0 = *(void *)v5;
  if (!sub_100016370(*(uint64_t *)v5, "com.apple.asl"))
  {
    uint64_t v2 = fopen("/etc/asl.conf", "r");
    if (v2)
    {
      int v3 = v2;
      unsigned int v4 = asl_out_module_init_from_file("com.apple.asl", v2);
      fclose(v3);
      uint64_t v0 = *(void *)v5;
      if (v4)
      {
        *((void *)v4 + 3) = *(void *)v5;
        return v4;
      }
    }
    else
    {
      return *(_DWORD **)v5;
    }
  }
  return (_DWORD *)v0;
}

DIR *sub_1000161D8(DIR *result, char *a2, int a3)
{
  if (result && a2)
  {
    p_dd_uint64_t fd = (uint64_t *)&result->__dd_fd;
    uint64_t v6 = *(void *)&result->__dd_fd;
    if (*(void *)&result->__dd_fd)
    {
      do
      {
        uint64_t v7 = (_DWORD *)v6;
        uint64_t v6 = *(void *)(v6 + 24);
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t result = opendir(a2);
    if (result)
    {
      int v8 = result;
      unsigned int v9 = "%s/%s";
      while (1)
      {
        uint64_t v10 = readdir(v8);
        if (!v10) {
          break;
        }
        d_name = v10->d_name;
        if (v10->d_name[0] != 46 && !sub_100016370(*p_dd_fd, d_name))
        {
          int v12 = v9;
          snprintf(__str, 0x400uLL, v9, a2, d_name);
          int v13 = fopen(__str, "r");
          if (v13 && (unsigned __int16 v14 = v13, v15 = asl_out_module_init_from_file(d_name, v13), fclose(v14), v15))
          {
            v15[2] |= a3;
            int v16 = strcmp(d_name, "com.apple.asl");
            uint64_t v17 = *p_dd_fd;
            if (v16)
            {
              if (v17) {
                *((void *)v7 + 3) = v15;
              }
              else {
                *p_dd_uint64_t fd = (uint64_t)v15;
              }
            }
            else
            {
              *((void *)v15 + 3) = v17;
              *p_dd_uint64_t fd = (uint64_t)v15;
              if (v7) {
                int v15 = v7;
              }
            }
          }
          else
          {
            int v15 = v7;
          }
          uint64_t v7 = v15;
          unsigned int v9 = v12;
        }
      }
      return (DIR *)closedir(v8);
    }
  }
  return result;
}

uint64_t sub_100016370(uint64_t a1, char *__s2)
{
  uint64_t result = 0;
  if (a1 && __s2)
  {
    while (!*(void *)a1 || strcmp(*(const char **)a1, __s2))
    {
      a1 = *(void *)(a1 + 24);
      if (!a1) {
        return 0;
      }
    }
    return a1;
  }
  return result;
}

void asl_out_module_print(FILE *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    while (1)
    {
      unsigned int v4 = (char *)asl_msg_to_string();
      fprintf(a1, "  %s", off_10001D4B0[*(unsigned int *)(v2 + 8)]);
      if (*(void *)v2) {
        fprintf(a1, " %s", v4);
      }
      if (*(void *)(v2 + 16)) {
        fprintf(a1, " %s", *(const char **)(v2 + 16));
      }
      if (*(_DWORD *)(v2 + 8) != 2) {
        goto LABEL_66;
      }
      uint64_t v5 = *(void *)(v2 + 24);
      if (v5) {
        break;
      }
      fwrite("  data: NULL", 0xCuLL, 1uLL, a1);
LABEL_66:
      fputc(10, a1);
      uint64_t v2 = *(void *)(v2 + 40);
      free(v4);
      if (!v2) {
        return;
      }
    }
    fprintf(a1, "%s\n", *(const char **)(v5 + 8));
    fprintf(a1, "    rules: %u\n", *(_DWORD *)(v5 + 168) - 1);
    uint64_t v6 = *(const char **)(v5 + 32);
    if (!v6) {
      uint64_t v6 = "(none)";
    }
    fprintf(a1, "    dest: %s\n", v6);
    uint64_t v7 = *(const char **)(v5 + 24);
    if (!v7) {
      uint64_t v7 = "std";
    }
    fprintf(a1, "    format: %s\n", v7);
    int v8 = *(const char **)(v5 + 56);
    if (!v8) {
      int v8 = "lcl";
    }
    fprintf(a1, "    time_format: %s\n", v8);
    fprintf(a1, "    flags: 0x%08x", *(_DWORD *)(v5 + 72));
    if (!*(_DWORD *)(v5 + 72))
    {
LABEL_34:
      fputc(10, a1);
      if ((*(unsigned char *)(v5 + 72) & 4) != 0)
      {
        fwrite("        rotatation style: ", 0x1AuLL, 1uLL, a1);
        int v11 = *(_DWORD *)(v5 + 64);
        if ((v11 & 0x10000000) != 0)
        {
          sub_100016A08(v11);
          fprintf(a1, "[base=%s].%s\n");
        }
        else if ((v11 & 0x20000000) != 0)
        {
          sub_100016A08(v11);
          fprintf(a1, "[base=%s].[ext=%s].%s\n");
        }
        else if ((v11 & 0x40000000) != 0)
        {
          sub_100016A08(v11);
          fprintf(a1, "[base=%s].%s.[ext=%s]\n");
        }
        else
        {
          fprintf(a1, "0x%08x\n");
        }
      }
      asl_core_time_to_str();
      fprintf(a1, "    ttl: %s\n", v17);
      unint64_t v12 = 0;
      do
      {
        int v13 = *(_DWORD *)(v5 + 80 + 4 * v12);
        if (v12 > 6) {
          break;
        }
        ++v12;
      }
      while (!v13);
      if (v13)
      {
        for (uint64_t i = 0; i != 8; ++i)
        {
          asl_core_time_to_str();
          fprintf(a1, " [%d %s]", i, v17);
        }
        fputc(10, a1);
      }
      fprintf(a1, "    mode: 0%o\n", *(unsigned __int16 *)(v5 + 116));
      fprintf(a1, "    file_max: %lu\n", *(void *)(v5 + 152));
      fprintf(a1, "    all_max: %lu\n", *(void *)(v5 + 160));
      fwrite("    uid:", 8uLL, 1uLL, a1);
      if (*(_DWORD *)(v5 + 128))
      {
        unint64_t v15 = 0;
        do
          fprintf(a1, " %d", *(_DWORD *)(*(void *)(v5 + 120) + 4 * v15++));
        while (v15 < *(unsigned int *)(v5 + 128));
      }
      fputc(10, a1);
      fwrite("    gid:", 8uLL, 1uLL, a1);
      if (*(_DWORD *)(v5 + 144))
      {
        unint64_t v16 = 0;
        do
          fprintf(a1, " %d", *(_DWORD *)(*(void *)(v5 + 136) + 4 * v16++));
        while (v16 < *(unsigned int *)(v5 + 144));
      }
      goto LABEL_66;
    }
    fputc(32, a1);
    int v9 = *(_DWORD *)(v5 + 72);
    if (v9)
    {
      fprintf(a1, "%cenabled", 40);
      int v9 = *(_DWORD *)(v5 + 72);
      uint64_t v10 = 32;
      if ((v9 & 0x800) == 0) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v10 = 40;
      if ((v9 & 0x800) == 0)
      {
LABEL_21:
        if ((v9 & 4) != 0)
        {
          fprintf(a1, "%crotate", v10);
          int v9 = *(_DWORD *)(v5 + 72);
          uint64_t v10 = 32;
          if ((v9 & 8) == 0)
          {
LABEL_23:
            if ((v9 & 0x10) == 0) {
              goto LABEL_24;
            }
            goto LABEL_41;
          }
        }
        else if ((v9 & 8) == 0)
        {
          goto LABEL_23;
        }
        fprintf(a1, "%ccoalesce", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x10) == 0)
        {
LABEL_24:
          if ((v9 & 0x100) == 0) {
            goto LABEL_25;
          }
          goto LABEL_42;
        }
LABEL_41:
        fprintf(a1, "%ccompress", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x100) == 0)
        {
LABEL_25:
          if ((v9 & 0x200) == 0) {
            goto LABEL_26;
          }
          goto LABEL_43;
        }
LABEL_42:
        fprintf(a1, "%cbasestamp", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x200) == 0)
        {
LABEL_26:
          if ((v9 & 0x20) == 0) {
            goto LABEL_27;
          }
          goto LABEL_44;
        }
LABEL_43:
        fprintf(a1, "%csymlink", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x20) == 0)
        {
LABEL_27:
          if ((v9 & 0x40) == 0) {
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_44:
        fprintf(a1, "%cnon-std_dir", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x40) == 0)
        {
LABEL_28:
          if ((v9 & 0x400) == 0) {
            goto LABEL_29;
          }
          goto LABEL_46;
        }
LABEL_45:
        fprintf(a1, "%cexternal", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x400) == 0)
        {
LABEL_29:
          if ((v9 & 0x1000) == 0) {
            goto LABEL_30;
          }
          goto LABEL_47;
        }
LABEL_46:
        fprintf(a1, "%ccrashlog", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x1000) == 0)
        {
LABEL_30:
          if ((v9 & 0x2000) == 0) {
            goto LABEL_31;
          }
          goto LABEL_48;
        }
LABEL_47:
        fprintf(a1, "%casl_file", v10);
        int v9 = *(_DWORD *)(v5 + 72);
        uint64_t v10 = 32;
        if ((v9 & 0x2000) == 0)
        {
LABEL_31:
          if ((v9 & 0x8000) == 0)
          {
LABEL_33:
            fputc(41, a1);
            goto LABEL_34;
          }
LABEL_32:
          fprintf(a1, "%csize_only", v10);
          goto LABEL_33;
        }
LABEL_48:
        fprintf(a1, "%casl_directory", v10);
        uint64_t v10 = 32;
        if ((*(_DWORD *)(v5 + 72) & 0x8000) == 0) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }
    fprintf(a1, "%csoft", v10);
    int v9 = *(_DWORD *)(v5 + 72);
    uint64_t v10 = 32;
    goto LABEL_21;
  }
}

const char *sub_100016A08(char a1)
{
  uint64_t v1 = "<sequence>";
  uint64_t v2 = "<utc>";
  int v3 = "<utc-basic>";
  unsigned int v4 = "<local>";
  uint64_t v5 = "<local-basic>";
  if ((a1 & 0x20) == 0) {
    uint64_t v5 = "<unknown>";
  }
  if ((a1 & 0x10) == 0) {
    unsigned int v4 = v5;
  }
  if ((a1 & 8) == 0) {
    int v3 = v4;
  }
  if ((a1 & 4) == 0) {
    uint64_t v2 = v3;
  }
  if ((a1 & 2) == 0) {
    uint64_t v1 = v2;
  }
  if (a1) {
    return "<seconds>";
  }
  else {
    return v1;
  }
}

uint64_t sub_100016A74(uint64_t result)
{
  if (result)
  {
    do
    {
      while (1)
      {
        int v2 = *(unsigned __int8 *)++result;
        int v1 = v2;
        if (v2 <= 31) {
          break;
        }
        if (v1 != 32)
        {
          if (v1 != 91) {
            return result;
          }
          do
          {
            int v3 = *(unsigned __int8 *)(result + 1);
            if (v3 == 92)
            {
              int v4 = *(unsigned __int8 *)(result + 2);
              BOOL v5 = v4 == 93;
              if (v4 == 93) {
                uint64_t v6 = 3;
              }
              else {
                uint64_t v6 = 2;
              }
              int v3 = *(unsigned __int8 *)(result + v6);
              if (v5) {
                result += 3;
              }
              else {
                result += 2;
              }
            }
            else
            {
              ++result;
            }
          }
          while (v3 != 93);
        }
      }
    }
    while (v1 == 9);
    if (!v1) {
      return 0;
    }
  }
  return result;
}

unsigned char *sub_100016AEC(char *__s)
{
  if (!__s) {
    return 0;
  }
  for (uint64_t i = __s; ; ++i)
  {
    int v2 = *(unsigned __int8 *)i;
    if (v2 != 32 && v2 != 9) {
      break;
    }
  }
  size_t v4 = strlen(i);
  if (!v4) {
    return 0;
  }
  size_t v5 = v4;
  while (1)
  {
    int v6 = i[v5 - 1];
    if (v6 != 32 && v6 != 9) {
      break;
    }
    if (!--v5) {
      return 0;
    }
  }
  uint64_t v10 = malloc_type_malloc(v5 + 1, 0xC690138uLL);
  int v8 = v10;
  if (v10)
  {
    memcpy(v10, i, v5);
    v8[v5] = 0;
  }
  return v8;
}

_DWORD *sub_100016B94(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_uid = atoi(a2);
    if (pw_uid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_uid = v4->pw_uid;
      }
      else {
        int pw_uid = 501;
      }
    }
    int v5 = v2[32];
    uint64_t result = (_DWORD *)*((void *)v2 + 15);
    if (v5)
    {
      uint64_t v6 = v2[32];
      uint64_t v7 = (int *)*((void *)v2 + 15);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_uid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4 * (v5 + 1));
      *((void *)v2 + 15) = result;
      if (result)
      {
        uint64_t v9 = v2[32];
        v2[32] = v9 + 1;
        result[v9] = pw_uid;
      }
      else
      {
        v2[32] = 0;
      }
    }
  }
  return result;
}

_DWORD *sub_100016C44(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_gid = atoi(a2);
    if (pw_gid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_gid = v4->pw_gid;
      }
      else {
        int pw_gid = 501;
      }
    }
    int v5 = v2[36];
    uint64_t result = (_DWORD *)*((void *)v2 + 17);
    if (v5)
    {
      uint64_t v6 = v2[36];
      uint64_t v7 = (int *)*((void *)v2 + 17);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_gid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4 * (v5 + 1));
      *((void *)v2 + 17) = result;
      if (result)
      {
        uint64_t v9 = v2[36];
        v2[36] = v9 + 1;
        result[v9] = pw_gid;
      }
      else
      {
        v2[36] = 0;
      }
    }
  }
  return result;
}

const char *sub_100016CF4(const char *result)
{
  if (!result) {
    return result;
  }
  int v1 = result;
  size_t v2 = strlen(result);
  size_t v3 = v2;
  if (v2 >= 2)
  {
    int v4 = *(unsigned __int8 *)v1;
    if (v4 != 39 && v4 != 34 || v1[v2 - 1] != v4)
    {
LABEL_8:
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      do
      {
        if (v1[v6] == 92) {
          ++v5;
        }
        ++v6;
      }
      while (v3 != v6);
      char v7 = 0;
      goto LABEL_14;
    }
    ++v1;
    size_t v3 = v2 - 2;
  }
  if (v3) {
    goto LABEL_8;
  }
  uint64_t v5 = 0;
  char v7 = 1;
LABEL_14:
  uint64_t result = (const char *)malloc_type_malloc(v3 - v5 + 1, 0x6785B7ABuLL);
  if (result)
  {
    uint64_t v8 = 0;
    if ((v7 & 1) == 0)
    {
      do
      {
        int v10 = *(unsigned __int8 *)v1++;
        char v9 = v10;
        if (v10 != 92) {
          result[v8++] = v9;
        }
        --v3;
      }
      while (v3);
    }
    result[v8] = 0;
  }
  return result;
}

uint64_t sub_100016DD4(uint64_t a1, const char *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (*a2 == 46)
  {
    int v4 = a2;
  }
  else
  {
    int v10 = *(const char **)(a1 + 40);
    if (!v10) {
      return 0xFFFFFFFFLL;
    }
    size_t v11 = strlen(*(const char **)(a1 + 40));
    if (strncmp(a2, v10, v11) || (int v4 = &a2[v11], a2[v11] != 46))
    {
      int v12 = sub_100016F80((uint64_t)a2);
      *(_DWORD *)(a1 + 64) = v12;
      if (v12)
      {
        int v13 = v12;
        uint64_t result = 0;
        if (*(void *)(a1 + 48)) {
          int v14 = 0x20000000;
        }
        else {
          int v14 = 0x10000000;
        }
        int v15 = v14 | v13;
        goto LABEL_26;
      }
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t v5 = v4 + 1;
  for (uint64_t i = v4 + 2; ; ++i)
  {
    unsigned int v7 = *((unsigned __int8 *)i - 1);
    if (v7 <= 0x1F)
    {
      if (*(i - 1)) {
        BOOL v8 = v7 == 9;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
LABEL_24:
        int v16 = sub_100016F80((uint64_t)v5);
        *(_DWORD *)(a1 + 64) = v16;
        if (!v16) {
          return 0xFFFFFFFFLL;
        }
        int v17 = v16;
        uint64_t result = 0;
        int v15 = v17 | 0x10000000;
        goto LABEL_26;
      }
      continue;
    }
    if (v7 == 32) {
      goto LABEL_24;
    }
    if (v7 == 46) {
      break;
    }
  }
  mode_t v18 = *(const char **)(a1 + 48);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  size_t v19 = strlen(*(const char **)(a1 + 48));
  if (strncmp(v5, v18, v19) || v5[v19] != 46)
  {
    if (!strncmp(i, v18, v19))
    {
      int v22 = sub_100016F80((uint64_t)v5);
      *(_DWORD *)(a1 + 64) = v22;
      if (v22)
      {
        int v23 = v22;
        uint64_t result = 0;
        int v15 = v23 | 0x40000000;
        goto LABEL_26;
      }
    }
    return 0xFFFFFFFFLL;
  }
  int v20 = sub_100016F80((uint64_t)i);
  *(_DWORD *)(a1 + 64) = v20;
  if (!v20) {
    return 0xFFFFFFFFLL;
  }
  int v21 = v20;
  uint64_t result = 0;
  int v15 = v21 | 0x20000000;
LABEL_26:
  *(_DWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_100016F80(uint64_t result)
{
  if (!result) {
    return result;
  }
  for (unint64_t i = 0; ; ++i)
  {
    int v2 = *(unsigned __int8 *)(result + i);
    if ((v2 - 97) >= 0x1A) {
      break;
    }
    if (i > 0xA) {
      goto LABEL_9;
    }
LABEL_8:
    *((unsigned char *)&v9 + i) = v2;
  }
  if (i <= 0xA && v2 == 45) {
    goto LABEL_8;
  }
LABEL_9:
  *((unsigned char *)&v9 + i) = 0;
  if (v9 == 6514035 || v9 == 0x73646E6F636573) {
    return 1;
  }
  if (!(v9 ^ 0x756C757A | BYTE4(v9)) || v9 == 6517877) {
    return 4;
  }
  if (v9 == 761492597 && WORD2(v9) == 98) {
    return 8;
  }
  if (v9 == 0x697361622D637475 && (unsigned __int16)v10 == 99) {
    return 8;
  }
  BOOL v5 = v9 == 1633906540 && WORD2(v9) == 108;
  if (v5 || v9 == 7103340) {
    return 16;
  }
  if (v9 == 0x622D6C61636F6CLL) {
    return 32;
  }
  if (v9 == 762078060 && WORD2(v9) == 98) {
    return 32;
  }
  if (v9 == 0x61622D6C61636F6CLL && v10 == 6515059) {
    return 32;
  }
  if (v9 == 0x697361622D6C636CLL && (unsigned __int16)v10 == 99) {
    return 32;
  }
  if ((unsigned __int16)v9 == 35 || v9 == 7431539) {
    return 2;
  }
  return 2 * ((v9 ^ 0x65636E6575716573 | v10) == 0);
}

uint64_t (*asl_ipc_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 123) >= 0xFFFFFFF7) {
    return _asl_ipc_subsystem[5 * (v1 - 114) + 5];
  }
  else {
    return 0;
  }
}

uint64_t sub_100017224(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_11;
  }
  int v4 = (_DWORD *)(a2 + 28);
  *(void *)(a2 + 32) = 0x11000000000000;
  BOOL v5 = (vm_address_t *)(a2 + 40);
  *(_DWORD *)(a2 + 48) = 16777473;
  int v6 = *(_DWORD *)(result + 12);
  vm_address_t v7 = *(void *)(result + 28);
  uint64_t v8 = *(unsigned int *)(result + 40);
  long long v9 = *(_OWORD *)(result + 92);
  v10[0] = *(_OWORD *)(result + 76);
  v10[1] = v9;
  uint64_t result = sub_10000D520(v6, v7, v8, v4, v5, (_DWORD *)(a2 + 64), (int *)(a2 + 68), v10);
  if (!result)
  {
    *(_DWORD *)(a2 + 52) = *(_DWORD *)(a2 + 64);
    *(NDR_record_t *)(a2 + 56) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 72;
    *(_DWORD *)(a2 + 24) = 2;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100017354(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(unsigned char *)(result + 39) == 1 && (uint64_t v9 = *(unsigned int *)(result + 40), v9 == *(_DWORD *)(result + 52)))
    {
      if (!*(_DWORD *)(result + 56) && *(_DWORD *)(result + 60) > 0x1Fu)
      {
        int v11 = *(_DWORD *)(result + 12);
        vm_address_t v12 = *(void *)(result + 28);
        long long v13 = *(_OWORD *)(result + 92);
        v14[0] = *(_OWORD *)(result + 76);
        v14[1] = v13;
        uint64_t result = sub_10000D1B4(v11, v12, v9, v14, a5, a6, a7, a8);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      int v10 = -309;
    }
    else
    {
      int v10 = -300;
    }
  }
  else
  {
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100017420(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      int v5 = *(_DWORD *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = sub_10000D940(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000174BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v9 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v10 = *(unsigned int *)(result + 12);
      uint64_t v11 = *(unsigned int *)(result + 32);
      long long v12 = *(_OWORD *)(result + 72);
      v13[0] = *(_OWORD *)(result + 56);
      v13[1] = v12;
      uint64_t result = sub_10000DC70(v10, v11, (uint64_t)v13, a4, a5, a6, a7, a8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100017558(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 72) || *(_DWORD *)(result + 76) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v4 = (void *)(a2 + 28);
  int v5 = *(_DWORD *)(result + 12);
  vm_address_t v6 = *(void *)(result + 28);
  vm_size_t v7 = *(unsigned int *)(result + 40);
  uint64_t v8 = *(void *)(result + 56);
  int v9 = *(_DWORD *)(result + 64);
  int v10 = *(_DWORD *)(result + 68);
  long long v11 = *(_OWORD *)(result + 108);
  v12[0] = *(_OWORD *)(result + 92);
  v12[1] = v11;
  uint64_t result = sub_10000C37C(v5, v6, v7, v8, v9, v10, v4, (_DWORD *)(a2 + 52), (void *)(a2 + 56), (int *)(a2 + 64), v12);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10001768C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 80)
  {
    int v3 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 80) || *(_DWORD *)(result + 84) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v4 = (void *)(a2 + 28);
  int v5 = *(_DWORD *)(result + 12);
  vm_address_t v6 = *(void *)(result + 28);
  vm_size_t v7 = *(unsigned int *)(result + 40);
  uint64_t v8 = *(void *)(result + 56);
  uint64_t v9 = *(void *)(result + 64);
  int v10 = *(_DWORD *)(result + 72);
  int v11 = *(_DWORD *)(result + 76);
  long long v12 = *(_OWORD *)(result + 116);
  v14[0] = *(_OWORD *)(result + 100);
  v14[1] = v12;
  *((void *)&v13 + 1) = a2 + 64;
  *(void *)&long long v13 = a2 + 56;
  uint64_t result = sub_10000D15C(v5, v6, v7, v8, v9, v10, v11, v4, (_DWORD *)(a2 + 52), v13, v14);
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t asl_ipc_server(_DWORD *a1, uint64_t a2)
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
  if ((v4 - 123) >= 0xFFFFFFF7
    && (int v5 = (void (*)(void))_asl_ipc_subsystem[5 * (v4 - 114) + 5]) != 0)
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

void sub_10001784C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  sub_100009A44("FATAL ERROR: mach_msg() send failed with status 0x%08x\n", a2, a3, a4, a5, a6, a7, a8, a2);
  snprintf(a1, 0x100uLL, "[Sender syslogd] [Level 1] [PID %u] [Facility syslog] [Message FATAL ERROR: mach_msg() send failed with status 0x%08x]", dword_10002237C, v8);
  sub_10000A6C8((uint64_t)a1);
  sleep(1u);
  abort();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t __strncat_chk()
{
  return ___strncat_chk();
}

uint64_t _os_nospin_lock_lock()
{
  return __os_nospin_lock_lock();
}

uint64_t _os_nospin_lock_unlock()
{
  return __os_nospin_lock_unlock();
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

uint64_t asl_core_check_access()
{
  return _asl_core_check_access();
}

uint64_t asl_core_encode_buffer()
{
  return _asl_core_encode_buffer();
}

uint64_t asl_core_error()
{
  return _asl_core_error();
}

uint64_t asl_core_htonq()
{
  return _asl_core_htonq();
}

uint64_t asl_core_new_msg_id()
{
  return _asl_core_new_msg_id();
}

uint64_t asl_core_ntohq()
{
  return _asl_core_ntohq();
}

uint64_t asl_core_parse_time()
{
  return _asl_core_parse_time();
}

uint64_t asl_core_str_to_size()
{
  return _asl_core_str_to_size();
}

uint64_t asl_core_str_to_time()
{
  return _asl_core_str_to_time();
}

uint64_t asl_core_string_hash()
{
  return _asl_core_string_hash();
}

uint64_t asl_core_time_to_str()
{
  return _asl_core_time_to_str();
}

uint64_t asl_file_close()
{
  return _asl_file_close();
}

uint64_t asl_file_open_write()
{
  return _asl_file_open_write();
}

uint64_t asl_file_read_set_position()
{
  return _asl_file_read_set_position();
}

uint64_t asl_file_save()
{
  return _asl_file_save();
}

uint64_t asl_filesystem_path()
{
  return _asl_filesystem_path();
}

uint64_t asl_format_message()
{
  return _asl_format_message();
}

uint64_t asl_msg_cmp()
{
  return _asl_msg_cmp();
}

uint64_t asl_msg_copy()
{
  return _asl_msg_copy();
}

uint64_t asl_msg_count()
{
  return _asl_msg_count();
}

uint64_t asl_msg_fetch()
{
  return _asl_msg_fetch();
}

uint64_t asl_msg_from_string()
{
  return _asl_msg_from_string();
}

uint64_t asl_msg_get_val_for_key()
{
  return _asl_msg_get_val_for_key();
}

uint64_t asl_msg_list_append()
{
  return _asl_msg_list_append();
}

uint64_t asl_msg_list_count()
{
  return _asl_msg_list_count();
}

uint64_t asl_msg_list_from_string()
{
  return _asl_msg_list_from_string();
}

uint64_t asl_msg_list_get_index()
{
  return _asl_msg_list_get_index();
}

uint64_t asl_msg_list_new()
{
  return _asl_msg_list_new();
}

uint64_t asl_msg_list_release()
{
  return _asl_msg_list_release();
}

uint64_t asl_msg_list_to_string()
{
  return _asl_msg_list_to_string();
}

uint64_t asl_msg_lookup()
{
  return _asl_msg_lookup();
}

uint64_t asl_msg_new()
{
  return _asl_msg_new();
}

uint64_t asl_msg_release()
{
  return _asl_msg_release();
}

uint64_t asl_msg_retain()
{
  return _asl_msg_retain();
}

uint64_t asl_msg_set_key_val()
{
  return _asl_msg_set_key_val();
}

uint64_t asl_msg_set_key_val_op()
{
  return _asl_msg_set_key_val_op();
}

uint64_t asl_msg_to_string()
{
  return _asl_msg_to_string();
}

uint64_t asl_store_close()
{
  return _asl_store_close();
}

uint64_t asl_store_max_file_size()
{
  return _asl_store_max_file_size();
}

uint64_t asl_store_open_aux()
{
  return _asl_store_open_aux();
}

uint64_t asl_store_open_write()
{
  return _asl_store_open_write();
}

uint64_t asl_store_release()
{
  return _asl_store_release();
}

uint64_t asl_store_save()
{
  return _asl_store_save();
}

uint64_t asl_store_statistics()
{
  return _asl_store_statistics();
}

uint64_t asl_string_append_char_no_encoding()
{
  return _asl_string_append_char_no_encoding();
}

uint64_t asl_string_append_no_encoding()
{
  return _asl_string_append_no_encoding();
}

uint64_t asl_string_bytes()
{
  return _asl_string_bytes();
}

uint64_t asl_string_new()
{
  return _asl_string_new();
}

uint64_t asl_string_release()
{
  return _asl_string_release();
}

uint64_t asl_string_release_return_bytes()
{
  return _asl_string_release_return_bytes();
}

uint64_t asl_syslog_faciliy_name_to_num()
{
  return _asl_syslog_faciliy_name_to_num();
}

uint64_t asl_syslog_faciliy_num_to_name()
{
  return _asl_syslog_faciliy_num_to_name();
}

uint64_t asl_trigger_aslmanager()
{
  return _asl_trigger_aslmanager();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

uint64_t atol(const char *a1)
{
  return _atol(a1);
}

uint64_t atoll(const char *a1)
{
  return _atoll(a1);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

uint64_t configuration_profile_copy_property_list()
{
  return _configuration_profile_copy_property_list();
}

uint64_t configuration_profile_create_notification_key()
{
  return _configuration_profile_create_notification_key();
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return _ctime_r(a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return _fgetln(a1, a2);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

uint64_t fileport_makeport()
{
  return _fileport_makeport();
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

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return _gai_strerror(a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

size_t launch_data_array_get_count(const launch_data_t larray)
{
  return _launch_data_array_get_count(larray);
}

launch_data_t launch_data_array_get_index(const launch_data_t larray, size_t idx)
{
  return _launch_data_array_get_index(larray, idx);
}

launch_data_t launch_data_dict_lookup(const launch_data_t ldict, const char *key)
{
  return _launch_data_dict_lookup(ldict, key);
}

void launch_data_free(launch_data_t ld)
{
}

int launch_data_get_fd(const launch_data_t ld)
{
  return _launch_data_get_fd(ld);
}

mach_port_t launch_data_get_machport(const launch_data_t ld)
{
  return _launch_data_get_machport(ld);
}

launch_data_t launch_data_new_string(const char *val)
{
  return _launch_data_new_string(val);
}

launch_data_t launch_msg(const launch_data_t request)
{
  return _launch_msg(request);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_move_member(ipc_space_t task, mach_port_name_t member, mach_port_name_t after)
{
  return _mach_port_move_member(task, member, after);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
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

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_check(int token, int *check)
{
  return _notify_check(token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_register_file_descriptor(const char *name, int *notify_fd, int flags, int *out_token)
{
  return _notify_register_file_descriptor(name, notify_fd, flags, out_token);
}

uint64_t notify_register_plain()
{
  return _notify_register_plain();
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

utmpx *__cdecl pututxline(const utmpx *a1)
{
  return _pututxline(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return _recvfrom(a1, a2, a3, a4, a5, a6);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
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

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return _task_name_for_pid(target_tport, pid, tn);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

voucher_mach_msg_state_t voucher_mach_msg_adopt(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_adopt(msg);
}

void voucher_mach_msg_revert(voucher_mach_msg_state_t state)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return _xpc_date_get_value(xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
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

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return _xpc_uuid_get_bytes(xuuid);
}