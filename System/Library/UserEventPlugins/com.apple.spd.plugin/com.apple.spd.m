void sub_3FF8(uint64_t a1, char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  if (qword_C780 != -1) {
    dispatch_once(&qword_C780, &stru_C3B8);
  }
  if (off_C778) {
    off_C778(a1, a2, va);
  }
  else {
    vsyslog(a1, a2, va);
  }
}

void sub_4084(id a1)
{
  off_C778 = (uint64_t (*)(void, void, void))dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_bsd_alt_log");
}

uint64_t sub_40B0()
{
  if (qword_C790 != -1) {
    dispatch_once(&qword_C790, &stru_C3F8);
  }
  return qword_C788;
}

void sub_40F4(id a1)
{
  qword_C788 = (uint64_t)os_log_create("com.apple.network.spd", (const char *)&unk_A741);
}

void spd_dump_cached_state()
{
  *(_OWORD *)v43 = 0u;
  memset(v44, 0, sizeof(v44));
  v0 = sub_40B0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_INFO, "", buf, 2u);
  }
  v1 = sub_40B0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "\tCurrent default route reachability state:", buf, 2u);
  }
  v2 = sub_40B0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = "true";
    if (!qword_C798) {
      v3 = "false";
    }
    if (byte_C7A0) {
      v4 = "reachable";
    }
    else {
      v4 = "not reachable";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)v40 = v3;
    *(_WORD *)&v40[8] = 2080;
    *(void *)&v40[10] = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "\t\tMonitoring IPv4: %s, State: %s", buf, 0x16u);
  }
  v5 = sub_40B0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "true";
    if (!qword_C7A8) {
      v6 = "false";
    }
    if (byte_C7B0) {
      v7 = "reachable";
    }
    else {
      v7 = "not reachable";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)v40 = v6;
    *(_WORD *)&v40[8] = 2080;
    *(void *)&v40[10] = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "\t\tMonitoring IPv6: %s, State: %s", buf, 0x16u);
  }
  v8 = sub_40B0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "", buf, 2u);
  }
  v9 = sub_40B0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "\tCurrent clients spd is holding sockets for:", buf, 2u);
  }
  v10 = sub_40B0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "\t-------------------------------------------", buf, 2u);
  }
  uint64_t v11 = qword_C7B8;
  if (qword_C7B8)
  {
    int v12 = 0;
    while (1)
    {
      if (*(unsigned char *)(v11 + 64))
      {
        ++v12;
      }
      else
      {
        v13 = sub_40B0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v14 = *(_DWORD *)(v11 + 24);
          if ((*(unsigned char *)(v11 + 64) & 2) != 0) {
            v15 = "true";
          }
          else {
            v15 = "false";
          }
          if ((*(unsigned char *)(v11 + 64) & 4) != 0) {
            v16 = "true";
          }
          else {
            v16 = "false";
          }
          *(_DWORD *)buf = 136315906;
          *(void *)v40 = v11 + 48;
          *(_WORD *)&v40[8] = 1024;
          *(_DWORD *)&v40[10] = v14;
          *(_WORD *)&v40[14] = 2080;
          *(void *)&v40[16] = v15;
          __int16 v41 = 2080;
          v42 = v16;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "\tClient %s.%d, checked in socket before: %s, wakeup allowed: %s", buf, 0x26u);
        }
        v17 = *(uint64_t **)(v11 + 16);
        if (v17)
        {
          int v38 = v12;
          int v18 = 0;
          while (1)
          {
            int v19 = *((_DWORD *)v17 + 30);
            v20 = 0;
            switch(v19)
            {
              case 0:
                v20 = "LOCAL";
                break;
              case 1:
                v20 = "WWAN";
                break;
              case 2:
                v20 = "WiFi";
                break;
              case 3:
                break;
              case 4:
                v20 = "LOOPBACK";
                break;
              default:
                v21 = "UNKNOWN";
                if (v19 != 255) {
                  v21 = 0;
                }
                if (v19 == 128) {
                  v20 = "GENERIC";
                }
                else {
                  v20 = v21;
                }
                break;
            }
            int v22 = *((unsigned __int8 *)v17 + 45);
            if (v22 == 30)
            {
              v23 = (char *)v17 + 52;
              int v24 = 30;
            }
            else
            {
              if (v22 != 2) {
                goto LABEL_53;
              }
              v23 = v17 + 6;
              int v24 = 2;
            }
            if (!inet_ntop(v24, v23, v43, 0x2Eu)) {
LABEL_53:
            }
              __strlcpy_chk();
            v25 = sub_40B0();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = "ON";
              if (!v17[12]) {
                v26 = "OFF";
              }
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v40 = v18;
              *(_WORD *)&v40[4] = 2080;
              *(void *)&v40[6] = v43;
              *(_WORD *)&v40[14] = 2080;
              *(void *)&v40[16] = v20;
              __int16 v41 = 2080;
              v42 = v26;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "      socket[%d]      %s : %s : %s", buf, 0x26u);
            }
            ++v18;
            v17 = (uint64_t *)*v17;
            if (!v17)
            {
              int v12 = v38;
              break;
            }
          }
        }
      }
      uint64_t v11 = *(void *)v11;
      if (!v11) {
        goto LABEL_66;
      }
    }
  }
  v27 = sub_40B0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "\tNONE", buf, 2u);
  }
  int v12 = 0;
LABEL_66:
  v28 = sub_40B0();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "", buf, 2u);
  }
  v29 = sub_40B0();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "\tCurrent clients spd is notifying of wakeup:", buf, 2u);
  }
  v30 = sub_40B0();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "\t-------------------------------------------", buf, 2u);
  }
  v31 = sub_40B0();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v32)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "\tsession client(s)", buf, 2u);
    }
    for (uint64_t i = qword_C7B8; i; uint64_t i = *(void *)i)
    {
      if (*(unsigned char *)(i + 64))
      {
        v34 = sub_40B0();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          int v35 = *(_DWORD *)(i + 24);
          *(_DWORD *)buf = 136315394;
          *(void *)v40 = i + 48;
          *(_WORD *)&v40[8] = 1024;
          *(_DWORD *)&v40[10] = v35;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "\t[name=%s, PID=%d]", buf, 0x12u);
        }
      }
    }
  }
  else if (v32)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "\tNONE", buf, 2u);
  }
  v36 = sub_40B0();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "\t-------------------------------------------", buf, 2u);
  }
  v37 = sub_40B0();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "", buf, 2u);
  }
}

void spd_handle_wifi_device_attach()
{
}

void sub_48C8(id a1)
{
  if (qword_C7C8)
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2000000000;
    char v8 = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_4AFC;
    v4[3] = &unk_C460;
    v4[4] = &v5;
    sub_4A30((uint64_t)v4);
    byte_C7D0 = *((unsigned char *)v6 + 24);
    v1 = sub_40B0();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      if (byte_C7D0) {
        v2 = "DOES";
      }
      else {
        v2 = "DOES NOT";
      }
      *(_DWORD *)buf = 136315138;
      v10 = v2;
      _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "Upon WiFi callback: this device %s support WoW", buf, 0xCu);
    }
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    v3 = sub_40B0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_89BC();
    }
  }
}

intptr_t sub_4A30(uint64_t a1)
{
  if (qword_C808 != -1) {
    dispatch_once(&qword_C808, &stru_C608);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_7604;
  block[3] = &unk_C630;
  block[4] = a1;
  CFRunLoopPerformBlock((CFRunLoopRef)qword_C818, kCFRunLoopCommonModes, block);
  CFRunLoopWakeUp((CFRunLoopRef)qword_C818);
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_C810, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_4AFC(uint64_t a1)
{
  uint64_t result = WiFiManagerClientGetWoWCapability();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

void spd_cleanup_all_client_sockets(uint64_t a1)
{
  if (a1)
  {
    v2 = *(_DWORD **)(a1 + 16);
    if (v2)
    {
      do
      {
        v3 = *(_DWORD **)v2;
        spd_cleanup_client_socket(a1, v2);
        v2 = v3;
      }
      while (v3);
    }
  }
}

void spd_cleanup_client_socket(uint64_t a1, _DWORD *a2)
{
  if (a1 && a2)
  {
    spd_stop_dispatch_events(a1, (uint64_t)a2);
    if (a2[30] == 2 && byte_C7D0 != 0 && !--qword_C7D8)
    {
      uint64_t v5 = sub_40B0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Turning WoW OFF", (uint8_t *)v11, 2u);
      }
      sub_4A30((uint64_t)&stru_C4A0);
    }
    v6 = (const void *)*((void *)a2 + 16);
    if (v6) {
      CFRelease(v6);
    }
    close(a2[18]);
    uint64_t v7 = sub_40B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = a2[18];
      int v9 = *(_DWORD *)(a1 + 24);
      v11[0] = 67109376;
      v11[1] = v8;
      __int16 v12 = 1024;
      int v13 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Successfully checked out socket [FD=%d] for client [PID=%d]", (uint8_t *)v11, 0xEu);
    }
    uint64_t v10 = *(void *)a2;
    if (*(void *)a2) {
      *(void *)(v10 + 8) = *((void *)a2 + 1);
    }
    **((void **)a2 + 1) = v10;
    free(a2);
  }
}

uint64_t spd_stop_dispatch_events(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4;
  if (a1 && a2)
  {
    uint64_t v5 = sub_40B0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *(_DWORD *)(a1 + 24);
      int v7 = *(_DWORD *)(a2 + 72);
      v10[0] = 67109376;
      v10[1] = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Stopping to monitor socket events for client [PID=%d] and socket [FD=%d]", (uint8_t *)v10, 0xEu);
    }
    int v8 = *(NSObject **)(a2 + 96);
    if (v8)
    {
      dispatch_source_cancel(v8);
      dispatch_release(*(dispatch_object_t *)(a2 + 96));
      *(void *)(a2 + 96) = 0;
    }
    int v9 = *(NSObject **)(a2 + 104);
    if (v9)
    {
      dispatch_source_cancel(v9);
      dispatch_release(*(dispatch_object_t *)(a2 + 104));
      *(void *)(a2 + 104) = 0;
    }
    if (*(void *)(a2 + 112))
    {
      spd_cancel_reachability(a2);
      CFRelease(*(CFTypeRef *)(a2 + 112));
      uint64_t result = 0;
      *(void *)(a2 + 112) = 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_4E14(id a1)
{
  WiFiManagerClientSetWoWState();

  WiFiManagerClientSetType();
}

uint64_t spd_client_add(uint64_t result)
{
  if (result)
  {
    v1 = (void *)result;
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)result);
    int v3 = pid;
    v4 = &qword_C7B8;
    while (1)
    {
      v4 = (uint64_t *)*v4;
      if (!v4) {
        break;
      }
      if (*((_DWORD *)v4 + 6) == pid)
      {
        uint64_t v5 = sub_40B0();
        uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
        if (result)
        {
          int v6 = "???";
          uint64_t v7 = v4[4];
          if (v4[5]) {
            int v6 = (const char *)v4[5];
          }
          int v8 = *((_DWORD *)v4 + 6);
          LODWORD(v21[0]) = 136315906;
          *(void *)((char *)v21 + 4) = v6;
          WORD6(v21[0]) = 1024;
          *(_DWORD *)((char *)v21 + 14) = v8;
          WORD1(v21[1]) = 2048;
          *(void *)((char *)&v21[1] + 4) = v7;
          WORD6(v21[1]) = 2048;
          *(void *)((char *)&v21[1] + 14) = v1;
          _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "existing client %s [%d], %p->%p", (uint8_t *)v21, 0x26u);
          return 0;
        }
        return result;
      }
    }
    uint64_t result = (uint64_t)malloc_type_calloc(1uLL, 0x48uLL, 0x10B004081547AA1uLL);
    if (result)
    {
      uint64_t v9 = result;
      *(_DWORD *)(result + 24) = v3;
      *(void *)(result + 32) = v1;
      if (sub_51A4()) {
        char v10 = 4;
      }
      else {
        char v10 = 0;
      }
      *(unsigned char *)(v9 + 64) = *(unsigned char *)(v9 + 64) & 0xFB | v10;
      xpc_connection_get_audit_token();
      memset(&token, 0, sizeof(token));
      __int16 v11 = SecTaskCreateWithAuditToken(0, &token);
      int v12 = v11;
      if (v11)
      {
        CFStringRef v13 = SecTaskCopySigningIdentifier(v11, 0);
        CFRelease(v12);
        if (v13)
        {
          CFIndex v14 = CFStringGetLength(v13) + 1;
          int v12 = malloc_type_malloc(v14, 0xAC1D6229uLL);
          if (!CFStringGetCString(v13, (char *)v12, v14, 0x8000100u))
          {
            free(v12);
            int v12 = 0;
          }
          CFRelease(v13);
        }
        else
        {
          int v12 = 0;
        }
      }
      *(void *)(v9 + 40) = v12;
      xpc_retain(v1);
      *(unsigned char *)(v9 + 48) = 0;
      memset(v21, 0, sizeof(v21));
      if (proc_pidinfo(v3, 13, 1uLL, v21, 64) == 64) {
        __strlcpy_chk();
      }
      uint64_t v15 = qword_C7B8;
      *(void *)uint64_t v9 = qword_C7B8;
      if (v15) {
        *(void *)(v15 + 8) = v9;
      }
      qword_C7B8 = v9;
      *(void *)(v9 + 8) = &qword_C7B8;
      v16 = sub_40B0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(const char **)(v9 + 40);
        if (!v17) {
          v17 = "???";
        }
        unsigned int v18 = *(_DWORD *)(v9 + 24);
        char v19 = *(unsigned char *)(v9 + 64);
        token.val[0] = 136315650;
        if ((v19 & 4) != 0) {
          v20 = "true";
        }
        else {
          v20 = "false";
        }
        *(void *)&token.val[1] = v17;
        LOWORD(token.val[3]) = 1024;
        *(unsigned int *)((char *)&token.val[3] + 2) = v18;
        HIWORD(token.val[4]) = 2080;
        *(void *)&token.val[5] = v20;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "adding client %s [%d], wakeup allowed: %s", (uint8_t *)&token, 0x1Cu);
      }
      return 1;
    }
  }
  return result;
}

uint64_t *spd_client_find_by_pid(int a1)
{
  uint64_t result = &qword_C7B8;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && *((_DWORD *)result + 6) != a1);
  return result;
}

BOOL sub_51A4()
{
  v0 = (void *)xpc_connection_copy_entitlement_value();
  if (!v0) {
    return 0;
  }
  v1 = v0;
  if (xpc_get_type(v0) != (xpc_type_t)&_xpc_type_BOOL) {
    return 0;
  }

  return xpc_BOOL_get_value(v1);
}

uint64_t spd_cleanup_client(uint64_t a1)
{
  if (!a1)
  {
    CFStringRef v13 = sub_40B0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Request cleanup of NULL client", (uint8_t *)&v14, 2u);
    }
    return 5;
  }
  v2 = *(_DWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      int v3 = *(_DWORD **)v2;
      spd_cleanup_client_socket(a1, v2);
      v2 = v3;
    }
    while (v3);
    if (*(void *)(a1 + 16))
    {
      v4 = sub_40B0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_89F0(a1, v4, v5);
      }
      return 5;
    }
  }
  int v6 = sub_40B0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *(_DWORD *)(a1 + 24);
    uint64_t v8 = *(void *)(a1 + 32);
    int v14 = 134218496;
    uint64_t v15 = a1;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "cleaned up client %p with pid %d, connection %p", (uint8_t *)&v14, 0x1Cu);
  }
  uint64_t v9 = *(_xpc_connection_s **)(a1 + 32);
  if (v9)
  {
    xpc_connection_cancel(v9);
    xpc_release(*(xpc_object_t *)(a1 + 32));
    *(void *)(a1 + 32) = 0;
  }
  char v10 = *(void **)(a1 + 40);
  if (v10) {
    free(v10);
  }
  uint64_t v11 = *(void *)a1;
  if (*(void *)a1) {
    *(void *)(v11 + 8) = *(void *)(a1 + 8);
  }
  **(void **)(a1 + 8) = v11;
  free((void *)a1);
  return 0;
}

uint64_t spd_log_event(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 40)) {
      uint64_t v5 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v5 = a1 + 48;
    }
    int v6 = sub_40B0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = a2;
      __int16 v14 = 2080;
      uint64_t v15 = a1 + 48;
      __int16 v16 = 2080;
      uint64_t v17 = v7;
      __int16 v18 = 1024;
      int v19 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Logging event %s for client [name: %s, bundle ID: %s, PID=%d]", buf, 0x26u);
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s.%s", a2, v5);
    if (v9)
    {
      CFStringRef v10 = v9;
      uint64_t v11 = sub_40B0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_8A70(v10);
      }
      ADClientAddValueForScalarKey();
      CFRelease(v10);
      return 0;
    }
    else
    {
      return 6;
    }
  }
  return result;
}

uint64_t spd_notify_client_sessions_of_wake(uint64_t a1)
{
  int64_t v2 = *(int *)(a1 + 24);
  if ((*(unsigned char *)(a1 + 64) & 4) == 0)
  {
    int v3 = sub_40B0();
    uint64_t result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_8B0C();
    return 0;
  }
  spd_log_event(a1, (uint64_t)"com.apple.spd.app_resume");
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    int v6 = v5;
    xpc_dictionary_set_int64(v5, "msg_type", 50);
    xpc_dictionary_set_int64(v6, "pid", v2);
    uint64_t v7 = qword_C7B8;
    if (!qword_C7B8) {
      goto LABEL_19;
    }
    char v8 = 0;
    do
    {
      while ((*(unsigned char *)(v7 + 64) & 1) != 0)
      {
        CFStringRef v9 = sub_40B0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          CFStringRef v10 = *(const char **)(v7 + 40);
          if (!v10) {
            CFStringRef v10 = "???";
          }
          int v11 = *(_DWORD *)(v7 + 24);
          int v12 = *(const char **)(a1 + 40);
          if (!v12) {
            int v12 = "???";
          }
          int v13 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)buf = 136315906;
          __int16 v16 = v10;
          __int16 v17 = 1024;
          int v18 = v11;
          __int16 v19 = 2080;
          v20 = v12;
          __int16 v21 = 1024;
          int v22 = v13;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Notifying %s [%d] to wake up %s [%d]", buf, 0x22u);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(v7 + 32), v6);
        uint64_t v7 = *(void *)v7;
        char v8 = 1;
        if (!v7) {
          goto LABEL_21;
        }
      }
      uint64_t v7 = *(void *)v7;
    }
    while (v7);
    if ((v8 & 1) == 0)
    {
LABEL_19:
      __int16 v14 = sub_40B0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_8B80();
      }
    }
LABEL_21:
    xpc_release(v6);
    return 0;
  }
  return 6;
}

uint64_t spd_start_dispatch_events(_DWORD *a1, uint64_t a2)
{
  uint64_t v2 = 4;
  if (!a1 || !a2) {
    return v2;
  }
  xpc_object_t v5 = sub_40B0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = a1[6];
    int v7 = *(_DWORD *)(a2 + 72);
    *(_DWORD *)buf = 67109376;
    int v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Starting to monitor socket events for client [PID=%d] and socket [FD=%d]", buf, 0xEu);
  }
  if (*(void *)(a2 + 96))
  {
    char v8 = sub_40B0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_8DB0();
    }
  }
  else
  {
    CFStringRef v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, *(int *)(a2 + 72), 0, (dispatch_queue_t)qword_C7C0);
    *(void *)(a2 + 96) = v9;
    if (v9)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_59D8;
      handler[3] = &unk_C4C0;
      handler[4] = a1;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume(*(dispatch_object_t *)(a2 + 96));
      if (spd_setup_reachability(a1, a2))
      {
        CFStringRef v10 = sub_40B0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_8D48();
        }
      }
      uint64_t v2 = 0;
      goto LABEL_14;
    }
    int v13 = sub_40B0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_8CE0();
    }
  }
  uint64_t v2 = 5;
LABEL_14:
  if (*(void *)(a2 + 104))
  {
    int v11 = sub_40B0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8C70();
    }
  }
  else
  {
    int v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_sock, *(int *)(a2 + 72), 0x100uLL, (dispatch_queue_t)qword_C7C0);
    *(void *)(a2 + 104) = v12;
    if (v12)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 0x40000000;
      v16[2] = sub_5D30;
      v16[3] = &unk_C4E0;
      v16[4] = a1;
      v16[5] = a2;
      dispatch_source_set_event_handler(v12, v16);
      dispatch_resume(*(dispatch_object_t *)(a2 + 104));
      return 0;
    }
    else
    {
      __int16 v14 = sub_40B0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_8C08();
      }
    }
  }
  return v2;
}

uint64_t sub_59D8(uint64_t a1)
{
  uint64_t v2 = sub_40B0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 24);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Data available for client [PID=%d], waking...", (uint8_t *)v5, 8u);
  }
  spd_notify_client_sessions_of_wake(*(void *)(a1 + 32));
  return spd_stop_all_dispatch_events(*(void *)(a1 + 32));
}

uint64_t spd_stop_all_dispatch_events(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
  LODWORD(v3) = 0;
  do
  {
    if (spd_stop_dispatch_events(a1, (uint64_t)v2)) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = v3;
    }
    uint64_t v2 = (void *)*v2;
  }
  while (v2);
  return v3;
}

uint64_t spd_setup_reachability(void *a1, uint64_t a2)
{
  v15.version = 0;
  memset(&v15.retain, 0, 24);
  v15.info = a1;
  if (!a1 || !a2)
  {
    int v7 = sub_40B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (a2) {
        int v11 = *(_DWORD *)(a2 + 72);
      }
      else {
        int v11 = -1;
      }
      *(_DWORD *)buf = 134218240;
      __int16 v17 = a1;
      __int16 v18 = 1024;
      int v19 = v11;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "NULL object(s) passed in for setting up reachability client [ADDR=%p] socket [FD=%d]", buf, 0x12u);
    }
    return 5;
  }
  int v4 = *(_DWORD *)(a2 + 120);
  if (v4 && v4 != 255)
  {
    if (*(void *)(a2 + 112))
    {
      char v8 = sub_40B0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_8F64((uint64_t)a1, v8);
      }
    }
    else
    {
      CFStringRef v9 = SCNetworkReachabilityCreateWithAddressPair(kCFAllocatorDefault, (const sockaddr *)(a2 + 16), (const sockaddr *)(a2 + 44));
      if (v9)
      {
        CFStringRef v10 = v9;
        if (SCNetworkReachabilitySetCallback(v9, (SCNetworkReachabilityCallBack)spd_reachability_callback, &v15))
        {
          if (SCNetworkReachabilitySetDispatchQueue(v10, (dispatch_queue_t)qword_C7C0))
          {
            uint64_t result = 0;
            *(void *)(a2 + 112) = v10;
            return result;
          }
          __int16 v14 = sub_40B0();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_8EF8();
          }
        }
        else
        {
          int v13 = sub_40B0();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_8E8C();
          }
        }
        if (!*(void *)(a2 + 112)) {
          CFRelease(v10);
        }
      }
      else
      {
        int v12 = sub_40B0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_8E20();
        }
      }
    }
    return 5;
  }
  xpc_object_t v5 = sub_40B0();
  uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (result)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Socket isn't AF_NET or AF_NET6 so we can't setup reachability", buf, 2u);
    return 0;
  }
  return result;
}

void sub_5D30(uint64_t a1)
{
  uint64_t v2 = sub_40B0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 24);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "TCP KeepAlive received for client [PID=%d]", (uint8_t *)v5, 8u);
  }
  spd_log_event(*(void *)(a1 + 32), (uint64_t)"com.apple.spd.tcp_keepalive");
  int v4 = *(NSObject **)(*(void *)(a1 + 40) + 104);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 40) + 104));
    *(void *)(*(void *)(a1 + 40) + 104) = 0;
  }
}

uint64_t spd_cancel_reachability(uint64_t a1)
{
  if (a1)
  {
    if (SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(a1 + 112), 0) == 1) {
      return 0;
    }
    int v3 = sub_40B0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_9024();
    }
  }
  else
  {
    uint64_t v2 = sub_40B0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_8FF0();
    }
  }
  return 5;
}

uint64_t spd_start_all_dispatch_events(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
  LODWORD(v3) = 0;
  do
  {
    if (spd_start_dispatch_events((_DWORD *)a1, (uint64_t)v2)) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = v3;
    }
    uint64_t v2 = (void *)*v2;
  }
  while (v2);
  return v3;
}

uint64_t spd_vet_socket(uint64_t a1)
{
  unsigned int v45 = 0;
  *(void *)cStr = 0;
  uint64_t v53 = 0;
  CFStringRef theString1 = 0;
  if (!a1) {
    return 4;
  }
  *(void *)v43 = 0;
  uint64_t v3 = (int *)(a1 + 72);
  int v2 = *(_DWORD *)(a1 + 72);
  char v42 = 0;
  v3[12] = 255;
  socklen_t v44 = 28;
  if (getsockname(v2, (sockaddr *)(v3 - 14), &v44))
  {
    int v4 = sub_40B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_9258((uint64_t)v3, v4);
    }
    return 46;
  }
  socklen_t v44 = 28;
  if (getpeername(*(_DWORD *)(a1 + 72), (sockaddr *)(a1 + 44), &v44))
  {
    int v6 = sub_40B0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_91CC((uint64_t)v3, v6);
    }
    return 46;
  }
  int v8 = *(unsigned __int8 *)(a1 + 17);
  if (v8 == 30)
  {
    if (*(unsigned char *)(a1 + 45) != 30)
    {
LABEL_14:
      uint64_t v5 = 0;
      *(_DWORD *)(a1 + 120) = 0;
      return v5;
    }
  }
  else if (v8 != 2 || *(unsigned char *)(a1 + 45) != 2)
  {
    goto LABEL_14;
  }
  v43[1] = 4;
  if (v8 == 30) {
    int v9 = 41;
  }
  else {
    int v9 = 0;
  }
  if (getsockopt(*v3, v9, 9696, &v45, &v43[1]))
  {
    CFStringRef v10 = sub_40B0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_9164();
    }
    return 46;
  }
  if (!v45 || !if_indextoname(v45, cStr))
  {
    __int16 v17 = sub_40B0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_9090();
    }
    return 46;
  }
  CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x600u);
  if (v11)
  {
    CFStringRef v12 = v11;
    if (CFEqual(@"lo0", v11))
    {
      uint64_t v5 = 0;
      *(_DWORD *)(a1 + 120) = 4;
      goto LABEL_57;
    }
    uint64_t v37 = 0;
    int v38 = &v37;
    uint64_t v39 = 0x2000000000;
    uint64_t v40 = 0;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 0x40000000;
    v36[2] = sub_6414;
    v36[3] = &unk_C508;
    v36[4] = &v37;
    v36[5] = v12;
    sub_4A30((uint64_t)v36);
    uint64_t v13 = v38[3];
    if (v13)
    {
      if (byte_C7D0)
      {
        if (!qword_C7D8++)
        {
          SCNetworkReachabilityContext v15 = sub_40B0();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Turning WoW ON", buf, 2u);
          }
          sub_4A30((uint64_t)&stru_C548);
          uint64_t v13 = v38[3];
        }
      }
      uint64_t v5 = 0;
      *(void *)(a1 + 128) = v13;
      int v16 = 2;
      goto LABEL_33;
    }
    unint64_t PacketContextActiveByServiceType = _CTServerConnectionGetPacketContextActiveByServiceType();
    int v26 = PacketContextActiveByServiceType;
    unint64_t v27 = HIDWORD(PacketContextActiveByServiceType);
    if (HIDWORD(PacketContextActiveByServiceType) || (v43[0] & 0x80000000) != 0)
    {
      v31 = sub_40B0();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      *(_DWORD *)buf = 67109632;
      int v47 = v27;
      __int16 v48 = 1024;
      int v49 = v26;
      __int16 v50 = 1024;
      socklen_t v51 = v43[0];
      BOOL v32 = "CT acquire packet context failed, error=%d domain=%d pdp=%d";
    }
    else
    {
      unint64_t v28 = _CTServerConnectionCopyPacketContextInterfaceName();
      int v29 = v28;
      unint64_t v30 = HIDWORD(v28);
      if (HIDWORD(v28) || !theString1)
      {
        v31 = sub_40B0();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        *(_DWORD *)buf = 67109632;
        int v47 = v30;
        __int16 v48 = 1024;
        int v49 = v29;
        __int16 v50 = 1024;
        socklen_t v51 = v43[0];
        BOOL v32 = "CT acquire interface failed, error=%d domain=%d pdp=%d";
      }
      else
      {
        if (CFStringCompare(theString1, v12, 0))
        {
          if (*(_DWORD *)(a1 + 120) == 255)
          {
            uint64_t v5 = 0;
            int v16 = 128;
LABEL_33:
            *(_DWORD *)(a1 + 120) = v16;
LABEL_56:
            _Block_object_dispose(&v37, 8);
LABEL_57:
            CFRelease(v12);
            if (theString1) {
              CFRelease(theString1);
            }
            return v5;
          }
          goto LABEL_55;
        }
        unint64_t v33 = _CTServerConnectionPacketContextAssertionCreate();
        int v34 = v33;
        unint64_t v35 = HIDWORD(v33);
        if (!HIDWORD(v33) && *(void *)(a1 + 128))
        {
          uint64_t v5 = 0;
          int v16 = 1;
          goto LABEL_33;
        }
        v31 = sub_40B0();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
LABEL_55:
          uint64_t v5 = 5;
          goto LABEL_56;
        }
        *(_DWORD *)buf = 67109632;
        int v47 = v35;
        __int16 v48 = 1024;
        int v49 = v34;
        __int16 v50 = 1024;
        socklen_t v51 = v43[0];
        BOOL v32 = "CT assertion failed, error=%d domain=%d pdp=%d";
      }
    }
    _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x14u);
    goto LABEL_55;
  }
  __int16 v18 = sub_40B0();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_90F8((uint64_t)cStr, v18, v19, v20, v21, v22, v23, v24);
  }
  return 6;
}

CFTypeRef sub_6414(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WiFiManagerClientGetDevice();
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

void sub_647C(id a1)
{
  WiFiManagerClientSetWoWState();

  WiFiManagerClientSetType();
}

void spd_reachability_callback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    int v4 = sub_40B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(a3 + 24);
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Reachability notifications fired for client [PID=%d]", (uint8_t *)v7, 8u);
    }
    spd_notify_client_sessions_of_wake(a3);
    for (uint64_t i = *(void **)(a3 + 16); i; uint64_t i = (void *)*i)
      spd_stop_dispatch_events(a3, (uint64_t)i);
  }
}

uint64_t spd_checkin_socket(_xpc_connection_s *a1, int a2, unsigned __int8 *a3)
{
  int v31 = 0;
  uint64_t pid = xpc_connection_get_pid(a1);
  uint64_t v6 = pid;
  memset(&v30, 0, sizeof(v30));
  if (a3)
  {
    int v7 = &qword_C7B8;
    do
    {
      int v7 = (uint64_t *)*v7;
      if (!v7) {
        return 4;
      }
    }
    while (*((_DWORD *)v7 + 6) != pid);
    int v8 = v7 + 2;
    int v9 = v7 + 2;
    while (1)
    {
      int v9 = (uint64_t *)*v9;
      if (!v9) {
        break;
      }
      if (!uuid_compare((const unsigned __int8 *)v9 + 76, a3)) {
        return 0;
      }
    }
    if (a2 == -1)
    {
      __int16 v14 = sub_40B0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_934C();
      }
      return 5;
    }
    if (fstat(a2, &v30))
    {
      uint64_t v13 = sub_40B0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_9500();
      }
      return 5;
    }
    if ((v30.st_mode & 0xF000) != 0xC000)
    {
      uint64_t v20 = sub_40B0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = *((_DWORD *)v7 + 6);
        *(_DWORD *)buf = 67109120;
        int v33 = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Descriptor is not a socket, client [PID=%d]", buf, 8u);
      }
      return 5;
    }
    uuid_clear(a3);
    SCNetworkReachabilityContext v15 = (int *)malloc_type_calloc(1uLL, 0x88uLL, 0x10E004033DDB314uLL);
    if (v15)
    {
      uint64_t v16 = (uint64_t)v15;
      v15[18] = a2;
      __int16 v17 = v15 + 18;
      uint64_t v18 = spd_vet_socket((uint64_t)v15);
      if (v18)
      {
        uint64_t v10 = v18;
        if (v18 != 46)
        {
          uint64_t v23 = sub_40B0();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            sub_93B4();
            if (!v10) {
              return v10;
            }
          }
          else if (!v10)
          {
            return v10;
          }
          goto LABEL_40;
        }
        uint64_t v19 = sub_40B0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_9498();
        }
      }
      else
      {
        if (!*(_DWORD *)(v16 + 120))
        {
          uint64_t v24 = sub_40B0();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            int v33 = v6;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Client process [PID=%d] attempting to checkin non-AF_NET[6?] socket", buf, 8u);
          }
          uint64_t v10 = 4;
          goto LABEL_40;
        }
        if (!setsockopt(*v17, 0xFFFF, 4352, &v31, 4u))
        {
          uuid_generate_random((unsigned __int8 *)(v16 + 76));
          uuid_copy(a3, (const unsigned __int8 *)(v16 + 76));
          uint64_t v25 = *v8;
          *(void *)uint64_t v16 = *v8;
          if (v25) {
            *(void *)(v25 + 8) = v16;
          }
          _DWORD v7[2] = v16;
          *(void *)(v16 + 8) = v8;
          *((unsigned char *)v7 + 64) |= 2u;
          int v26 = sub_40B0();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            int v27 = *v17;
            int v28 = *((_DWORD *)v7 + 6);
            int v29 = (const char *)v7[5];
            if (!v29) {
              int v29 = "<NULL>";
            }
            *(_DWORD *)buf = 67109634;
            int v33 = v27;
            __int16 v34 = 1024;
            int v35 = v28;
            __int16 v36 = 2080;
            uint64_t v37 = v29;
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Successfully checked in socket [FD=%d] for client [PID=%d] with BundleID: %s", buf, 0x18u);
          }
          return 0;
        }
        uint64_t v22 = sub_40B0();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_941C(v17, v6, v22);
        }
      }
      uint64_t v10 = 46;
LABEL_40:
      close(a2);
      free((void *)v16);
      return v10;
    }
    close(a2);
    return 6;
  }
  else
  {
    CFStringRef v11 = sub_40B0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_92E4();
    }
    return 4;
  }
}

uint64_t spd_checkout_socket(_xpc_connection_s *a1, const unsigned __int8 *a2)
{
  pid_t pid = xpc_connection_get_pid(a1);
  int v4 = &qword_C7B8;
  while (1)
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if (*((_DWORD *)v4 + 6) == pid)
    {
      int v5 = v4 + 2;
      while (1)
      {
        int v5 = (uint64_t *)*v5;
        if (!v5) {
          break;
        }
        if (!uuid_compare((const unsigned __int8 *)v5 + 76, a2))
        {
          spd_cleanup_client_socket((uint64_t)v4, v5);
          return 0;
        }
      }
      return 29;
    }
  }
  return 29;
}

uint64_t spd_checkout_all_sockets(_xpc_connection_s *a1)
{
  pid_t pid = xpc_connection_get_pid(a1);
  int v2 = &qword_C7B8;
  do
  {
    int v2 = (uint64_t *)*v2;
    if (!v2) {
      return 29;
    }
  }
  while (*((_DWORD *)v2 + 6) != pid);
  uint64_t v3 = (_DWORD *)v2[2];
  if (v3)
  {
    do
    {
      int v4 = *(_DWORD **)v3;
      spd_cleanup_client_socket((uint64_t)v2, v3);
      uint64_t v3 = v4;
    }
    while (v4);
  }
  return 5;
}

uint64_t spd_start_monitoring_socket(_xpc_connection_s *a1, const unsigned __int8 *a2)
{
  pid_t pid = xpc_connection_get_pid(a1);
  int v4 = &qword_C7B8;
  do
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      return 29;
    }
  }
  while (*((_DWORD *)v4 + 6) != pid);
  uint64_t v5 = (uint64_t)(v4 + 2);
  do
  {
    uint64_t v5 = *(void *)v5;
    if (!v5) {
      return 4;
    }
  }
  while (uuid_compare((const unsigned __int8 *)(v5 + 76), a2));

  return spd_start_dispatch_events(v4, v5);
}

uint64_t spd_stop_monitoring_socket(_xpc_connection_s *a1, const unsigned __int8 *a2)
{
  pid_t pid = xpc_connection_get_pid(a1);
  int v4 = &qword_C7B8;
  do
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      return 29;
    }
  }
  while (*((_DWORD *)v4 + 6) != pid);
  uint64_t v5 = (uint64_t)(v4 + 2);
  do
  {
    uint64_t v5 = *(void *)v5;
    if (!v5) {
      return 4;
    }
  }
  while (uuid_compare((const unsigned __int8 *)(v5 + 76), a2));

  return spd_stop_dispatch_events((uint64_t)v4, v5);
}

uint64_t spd_start_monitoring_all_sockets_for_pid(_xpc_connection_s *a1, int a2)
{
  if (xpc_connection_get_pid(a1) == a2 || sub_51A4())
  {
    return spd_start_monitoring_all_sockets_for_pid_priv(a2);
  }
  else
  {
    int v4 = sub_40B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_9568();
    }
    return 5;
  }
}

uint64_t spd_start_monitoring_all_sockets_for_pid_priv(int a1)
{
  v1 = &qword_C7B8;
  do
  {
    v1 = (uint64_t *)*v1;
    if (!v1) {
      return 29;
    }
  }
  while (*((_DWORD *)v1 + 6) != a1);
  int v2 = (void *)v1[2];
  if (!v2) {
    return 0;
  }
  LODWORD(v3) = 0;
  do
  {
    if (spd_start_dispatch_events(v1, (uint64_t)v2)) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = v3;
    }
    int v2 = (void *)*v2;
  }
  while (v2);
  return v3;
}

uint64_t spd_stop_monitoring_all_sockets_for_pid(_xpc_connection_s *a1, int a2)
{
  if (xpc_connection_get_pid(a1) == a2 || sub_51A4())
  {
    return spd_stop_monitoring_all_sockets_for_pid_priv(a2);
  }
  else
  {
    int v4 = sub_40B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_95DC();
    }
    return 5;
  }
}

uint64_t spd_stop_monitoring_all_sockets_for_pid_priv(int a1)
{
  v1 = &qword_C7B8;
  do
  {
    v1 = (uint64_t *)*v1;
    if (!v1) {
      return 29;
    }
  }
  while (*((_DWORD *)v1 + 6) != a1);
  int v2 = (void *)v1[2];
  if (!v2) {
    return 0;
  }
  LODWORD(v3) = 0;
  do
  {
    if (spd_stop_dispatch_events((uint64_t)v1, (uint64_t)v2)) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = v3;
    }
    int v2 = (void *)*v2;
  }
  while (v2);
  return v3;
}

void init_spd_plugin(uint64_t a1)
{
  int v2 = sub_40B0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "init_spd_plugin start", buf, 2u);
  }
  if (a1 && !qword_C7E8)
  {
    uint64_t v3 = malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
    qword_C7E8 = (uint64_t)v3;
    if (v3)
    {
      void *v3 = a1;
      xpc_event_provider_create();
    }
    int v4 = sub_40B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_9650();
    }
  }
}

void sub_6F28(int64_t a1, uint64_t a2, void *a3)
{
  if (a1 != 1)
  {
    if (a1 == 2)
    {
      uint64_t v6 = sub_40B0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_96B8();
      }
    }
    else
    {
      __int16 v14 = sub_40B0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134218496;
        int64_t v21 = a1;
        __int16 v22 = 2048;
        uint64_t v23 = a2;
        __int16 v24 = 2048;
        uint64_t v25 = a3;
        _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "spd_event_callback unhandled action: %ld, token: %llu, event: %p", (uint8_t *)&v20, 0x20u);
      }
    }
    return;
  }
  int v7 = sub_40B0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    sub_98B0();
    if (!a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  int64_t int64 = xpc_dictionary_get_int64(a3, "pid");
  int64_t v9 = xpc_dictionary_get_int64(a3, "msg_type");
  uint64_t v10 = sub_40B0();
  CFStringRef v11 = v10;
  if (v9 != 1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_9828(int64, v9, v11);
    }
    return;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v20 = 134218240;
    int64_t v21 = int64;
    __int16 v22 = 2048;
    uint64_t v23 = a2;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "ADD event from pid %lld, spd_msg_type_init, token %llu", (uint8_t *)&v20, 0x16u);
  }
  if (qword_C7C0)
  {
    CFStringRef v12 = (_xpc_connection_s *)qword_C820;
    if (qword_C820) {
      goto LABEL_23;
    }
    uint64_t v13 = xpc_connection_create(0, (dispatch_queue_t)qword_C7C0);
    qword_C820 = (uint64_t)v13;
    if (v13)
    {
      xpc_connection_set_event_handler(v13, &stru_C670);
      xpc_connection_resume((xpc_connection_t)qword_C820);
      CFStringRef v12 = (_xpc_connection_s *)qword_C820;
      goto LABEL_23;
    }
    SCNetworkReachabilityContext v15 = sub_40B0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_97F4();
    }
  }
  CFStringRef v12 = 0;
LABEL_23:
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  __int16 v17 = v16;
  if (v16 && v12)
  {
    xpc_dictionary_set_connection(v16, "connection", v12);
    uint64_t v18 = sub_40B0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_9768();
    }
    xpc_event_provider_token_fire();
  }
  uint64_t v19 = sub_40B0();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    sub_9734();
    if (!v17) {
      return;
    }
  }
  else if (!v17)
  {
    return;
  }
  xpc_release(v17);
}

uint64_t spd_init_state(uint64_t a1)
{
  qword_C7C0 = a1;
  if (!a1)
  {
    int v7 = sub_40B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_992C();
    }
    return 0;
  }
  qword_C7E0 = _CTServerConnectionCreateWithIdentifier();
  if (!qword_C7E0)
  {
    int v8 = sub_40B0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_9960();
    }
    return 0;
  }
  qword_C7C8 = WiFiManagerClientCreate();
  if (!qword_C7C8)
  {
    int64_t v9 = sub_40B0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_9994();
    }
    return 0;
  }
  byte_C7D0 = WiFiManagerClientGetWoWCapability() != 0;
  v1 = sub_40B0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    if (byte_C7D0) {
      int v2 = "DOES";
    }
    else {
      int v2 = "DOES NOT";
    }
    *(_DWORD *)&v14.sa_len = 136315138;
    *(void *)&v14.sa_data[2] = v2;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "On launch: this device %s support WoW", &v14.sa_len, 0xCu);
  }
  if (byte_C7D0)
  {
    uint64_t v3 = sub_40B0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)&v14.sa_len = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Setting initial WoW state to OFF", &v14.sa_len, 2u);
    }
    WiFiManagerClientSetWoWState();
    WiFiManagerClientSetType();
  }
  *(void *)&v14.sa_len = _NSConcreteStackBlock;
  *(void *)&v14.sa_data[6] = 0x40000000;
  SCNetworkReachabilityContext v15 = sub_816C;
  xpc_object_t v16 = &unk_C6B8;
  uint64_t v17 = qword_C7C8;
  if (qword_C828 != -1) {
    dispatch_once(&qword_C828, &v14);
  }
  if (!qword_C818)
  {
    uint64_t v10 = sub_40B0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_99C8();
    }
    return 0;
  }
  int v4 = qword_C7F0;
  if (qword_C7F0
    || (int v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1DuLL, 0, (dispatch_queue_t)qword_C7C0), (qword_C7F0 = (uint64_t)v4) != 0))
  {
    dispatch_source_set_event_handler(v4, &stru_C588);
    dispatch_resume((dispatch_object_t)qword_C7F0);
    signal(29, (void (__cdecl *)(int))((char *)&dword_0 + 1));
  }
  else
  {
    CFStringRef v12 = sub_40B0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_9A30();
    }
  }
  *(void *)&v14.sa_data[6] = 0;
  LODWORD(v16) = 0;
  SCNetworkReachabilityContext v15 = 0;
  *(void *)&v14.sa_len = 528;
  qword_C798 = (uint64_t)sub_8310(&v14);
  *(void *)&v14.sa_data[6] = 0;
  SCNetworkReachabilityContext v15 = 0;
  LODWORD(v16) = 0;
  *(void *)&v14.sa_len = 7708;
  qword_C7A8 = (uint64_t)sub_8310(&v14);
  sub_84A8(1);
  uint64_t v5 = qword_C7F8;
  if (qword_C7F8
    || (uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, (dispatch_queue_t)qword_C7C0), (qword_C7F8 = (uint64_t)v5) != 0))
  {
    dispatch_source_set_event_handler(v5, &stru_C5C8);
    dispatch_resume((dispatch_object_t)qword_C7F8);
    uint64_t v6 = 1;
    signal(31, (void (__cdecl *)(int))((char *)&dword_0 + 1));
  }
  else
  {
    uint64_t v13 = sub_40B0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_99FC();
    }
    return 1;
  }
  return v6;
}

void sub_75C8(id a1)
{
  byte_C800 = (byte_C800 & 1) == 0;
}

void sub_75E0(id a1)
{
  qword_C810 = (uint64_t)dispatch_semaphore_create(0);
}

intptr_t sub_7604(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v1 = qword_C810;

  return dispatch_semaphore_signal(v1);
}

void sub_7640(id a1, void *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v3 = xpc_copy_description(a2);
    int v4 = sub_40B0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sub_9ADC((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
      if (!v3)
      {
LABEL_5:
        if (qword_C820)
        {
          xpc_connection_cancel((xpc_connection_t)qword_C820);
          xpc_release((xpc_object_t)qword_C820);
          qword_C820 = 0;
        }
        return;
      }
    }
    else if (!v3)
    {
      goto LABEL_5;
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2000000000;
  __int16 v22 = a2;
  pid_t pid = xpc_connection_get_pid((xpc_connection_t)a2);
  char v12 = spd_client_add(v20[3]);
  uint64_t v13 = sub_40B0();
  sockaddr v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = v20[3];
      *(_DWORD *)buf = 134218496;
      uint64_t v24 = qword_C820;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      __int16 v27 = 1024;
      pid_t v28 = pid;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "listener %p got peer %p (pid %d)", buf, 0x1Cu);
    }
    xpc_connection_set_target_queue((xpc_connection_t)v20[3], (dispatch_queue_t)qword_C7C0);
    xpc_object_t v16 = (_xpc_connection_s *)v20[3];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 0x40000000;
    v17[2] = sub_7878;
    v17[3] = &unk_C698;
    v17[4] = &v19;
    pid_t v18 = pid;
    xpc_connection_set_event_handler(v16, v17);
    xpc_connection_resume((xpc_connection_t)v20[3]);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_9A64();
    }
    xpc_connection_cancel((xpc_connection_t)v20[3]);
  }
  _Block_object_dispose(&v19, 8);
}

void sub_7878(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(_xpc_connection_s **)(v5 + 24);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (!v6) {
      return;
    }
    xpc_type_t v8 = xpc_get_type(*(xpc_object_t *)(v5 + 24));
    if (!object || v8 != (xpc_type_t)&_xpc_type_connection || xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
      return;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    pid_t pid = xpc_connection_get_pid(v6);
    CFStringRef v11 = &qword_C7B8;
    do
      CFStringRef v11 = (uint64_t *)*v11;
    while (v11 && *((_DWORD *)v11 + 6) != pid);
    uuid = xpc_dictionary_get_uuid(object, "uuid");
    int int64 = xpc_dictionary_get_int64(object, "pid");
    BOOL v14 = xpc_dictionary_get_BOOL(object, "legacy");
    BOOL v15 = xpc_dictionary_get_BOOL(object, "modern");
    if (!v11)
    {
      __int16 v36 = sub_40B0();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_9B58(v6);
      }
      xpc_connection_cancel(v6);
      return;
    }
    BOOL v16 = v15;
    int v17 = v11[8] & 4;
    if ((v11[8] & 4) == 0 && v14)
    {
      uint64_t v19 = sub_40B0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = (const char *)v11[5];
        if (!v20) {
          int v20 = "???";
        }
        *(_DWORD *)v66 = 136315138;
        *(void *)&v66[4] = v20;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "allowing wakeup for %s, was linked against old SDK", v66, 0xCu);
      }
      *((unsigned char *)v11 + 64) |= 4u;
      int v17 = 1;
    }
    if (v17) {
      BOOL v21 = v16;
    }
    else {
      BOOL v21 = 0;
    }
    if (v21)
    {
      __int16 v22 = sub_40B0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = (const char *)v11[5];
        if (!v23) {
          uint64_t v23 = "???";
        }
        *(_DWORD *)v66 = 136315138;
        *(void *)&v66[4] = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "blocking %s linked against modern SDK, use Local Push Connectivity instead", v66, 0xCu);
      }
      *((unsigned char *)v11 + 64) &= ~4u;
    }
    int64_t v24 = xpc_dictionary_get_int64(object, "msg_type");
    if (v24 <= 29)
    {
      if (v24 <= 19)
      {
        if (v24 == 10)
        {
          v52 = sub_40B0();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            uint64_t v53 = (const char *)v11[5];
            if (!v53) {
              uint64_t v53 = "???";
            }
            int v54 = *((_DWORD *)v11 + 6);
            *(_DWORD *)v66 = 136315394;
            *(void *)&v66[4] = v53;
            *(_WORD *)&v66[12] = 1024;
            *(_DWORD *)&v66[14] = v54;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_notification_register", v66, 0x12u);
          }
          unsigned int v40 = 0;
          char v41 = *((unsigned char *)v11 + 64) | 1;
        }
        else
        {
          if (v24 != 11) {
            goto LABEL_104;
          }
          uint64_t v37 = sub_40B0();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            int v38 = (const char *)v11[5];
            if (!v38) {
              int v38 = "???";
            }
            int v39 = *((_DWORD *)v11 + 6);
            *(_DWORD *)v66 = 136315394;
            *(void *)&v66[4] = v38;
            *(_WORD *)&v66[12] = 1024;
            *(_DWORD *)&v66[14] = v39;
            _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_notification_deregister", v66, 0x12u);
          }
          unsigned int v40 = 0;
          char v41 = v11[8] & 0xFE;
        }
        *((unsigned char *)v11 + 64) = v41;
        goto LABEL_102;
      }
      if (v24 == 20)
      {
        v55 = sub_40B0();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = (const char *)v11[5];
          if (!v56) {
            v56 = "???";
          }
          int v57 = *((_DWORD *)v11 + 6);
          *(_DWORD *)v66 = 136315650;
          *(void *)&v66[4] = v56;
          *(_WORD *)&v66[12] = 1024;
          *(_DWORD *)&v66[14] = v57;
          __int16 v67 = 1024;
          int v68 = int64;
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_socket_monitor_pid: %d", v66, 0x18u);
        }
        unsigned int started = spd_start_monitoring_all_sockets_for_pid(v6, int64);
        goto LABEL_101;
      }
      if (v24 == 21)
      {
        char v42 = sub_40B0();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = (const char *)v11[5];
          if (!v43) {
            v43 = "???";
          }
          int v44 = *((_DWORD *)v11 + 6);
          *(_DWORD *)v66 = 136315650;
          *(void *)&v66[4] = v43;
          *(_WORD *)&v66[12] = 1024;
          *(_DWORD *)&v66[14] = v44;
          __int16 v67 = 1024;
          int v68 = int64;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_socket_monitor_pid_stop: %d", v66, 0x18u);
        }
        unsigned int started = spd_stop_monitoring_all_sockets_for_pid(v6, int64);
        goto LABEL_101;
      }
    }
    else if (v24 <= 39)
    {
      if (v24 == 30)
      {
        v61 = sub_40B0();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = "???";
          if (v11[5]) {
            v62 = (const char *)v11[5];
          }
          int v63 = *((_DWORD *)v11 + 6);
          *(_DWORD *)v66 = 136315906;
          *(void *)&v66[4] = v62;
          *(_WORD *)&v66[12] = 1024;
          *(_DWORD *)&v66[14] = v63;
          __int16 v67 = 1040;
          int v68 = 16;
          __int16 v69 = 2096;
          v70 = uuid;
          _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_socket_monitor: %{uuid_t}.16P", v66, 0x22u);
        }
        unsigned int started = spd_start_monitoring_socket(v6, uuid);
        goto LABEL_101;
      }
      if (v24 == 31)
      {
        unsigned int v45 = sub_40B0();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = "???";
          if (v11[5]) {
            v46 = (const char *)v11[5];
          }
          int v47 = *((_DWORD *)v11 + 6);
          *(_DWORD *)v66 = 136315906;
          *(void *)&v66[4] = v46;
          *(_WORD *)&v66[12] = 1024;
          *(_DWORD *)&v66[14] = v47;
          __int16 v67 = 1040;
          int v68 = 16;
          __int16 v69 = 2096;
          v70 = uuid;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_socket_monitor_stop: %{uuid_t}.16P", v66, 0x22u);
        }
        unsigned int started = spd_stop_monitoring_socket(v6, uuid);
        goto LABEL_101;
      }
    }
    else
    {
      switch(v24)
      {
        case '(':
          __int16 v48 = sub_40B0();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            int v49 = (const char *)v11[5];
            if (!v49) {
              int v49 = "???";
            }
            int v50 = *((_DWORD *)v11 + 6);
            *(_DWORD *)v66 = 136315394;
            *(void *)&v66[4] = v49;
            *(_WORD *)&v66[12] = 1024;
            *(_DWORD *)&v66[14] = v50;
            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_socket_checkin", v66, 0x12u);
          }
          if ((v11[8] & 4) != 0)
          {
            *(void *)v66 = 0;
            *(void *)&v66[8] = 0;
            if (uuid && !uuid_is_null(uuid)) {
              uuid_copy(v66, uuid);
            }
            else {
              uuid_clear(v66);
            }
            int v65 = xpc_dictionary_dup_fd(object, "socket");
            unsigned int v40 = spd_checkin_socket(v6, v65, v66);
            if (reply) {
              xpc_dictionary_set_uuid(reply, "uuid", v66);
            }
          }
          else
          {
            socklen_t v51 = sub_40B0();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
              sub_9C6C(v6);
            }
            unsigned int v40 = 33;
          }
          goto LABEL_102;
        case ')':
          v58 = sub_40B0();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            v59 = "???";
            if (v11[5]) {
              v59 = (const char *)v11[5];
            }
            int v60 = *((_DWORD *)v11 + 6);
            *(_DWORD *)v66 = 136315906;
            *(void *)&v66[4] = v59;
            *(_WORD *)&v66[12] = 1024;
            *(_DWORD *)&v66[14] = v60;
            __int16 v67 = 1040;
            int v68 = 16;
            __int16 v69 = 2096;
            v70 = uuid;
            _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_socket_checkout: %{uuid_t}.16P", v66, 0x22u);
          }
          unsigned int started = spd_checkout_socket(v6, uuid);
          goto LABEL_101;
        case '*':
          __int16 v25 = sub_40B0();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = (const char *)v11[5];
            if (!v26) {
              uint64_t v26 = "???";
            }
            int v27 = *((_DWORD *)v11 + 6);
            *(_DWORD *)v66 = 136315394;
            *(void *)&v66[4] = v26;
            *(_WORD *)&v66[12] = 1024;
            *(_DWORD *)&v66[14] = v27;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%s [%d] spd_msg_type_socket_checkout_all", v66, 0x12u);
          }
          unsigned int started = spd_checkout_all_sockets(v6);
LABEL_101:
          unsigned int v40 = started;
LABEL_102:
          if (reply)
          {
            xpc_dictionary_set_int64(reply, "result", v40);
            xpc_connection_send_message(v6, reply);
            xpc_release(reply);
          }
          return;
      }
    }
LABEL_104:
    v64 = sub_40B0();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_9BD0();
    }
    unsigned int v40 = 5;
    goto LABEL_102;
  }
  if (v6)
  {
    uint64_t v7 = &qword_C7B8;
    while (1)
    {
      uint64_t v7 = (uint64_t *)*v7;
      if (!v7) {
        break;
      }
      if (*((_DWORD *)v7 + 6) == *(_DWORD *)(a1 + 40))
      {
        spd_cleanup_client((uint64_t)v7);
        goto LABEL_45;
      }
    }
    int v29 = sub_40B0();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_9CE4(a1 + 32, v29, v30, v31, v32, v33, v34, v35);
    }
LABEL_45:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

intptr_t sub_816C(uint64_t a1)
{
  pthread_t v3 = 0;
  memset(&v4, 0, sizeof(v4));
  qword_C830 = (uint64_t)dispatch_semaphore_create(0);
  pthread_attr_init(&v4);
  pthread_attr_setdetachstate(&v4, 2);
  pthread_create(&v3, &v4, (void *(__cdecl *)(void *))sub_8228, *(void **)(a1 + 32));
  pthread_attr_destroy(&v4);
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_C830, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_8228(uint64_t a1)
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  pthread_t v3 = sub_40B0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_9E74((uint64_t)Current, a1, v3);
  }
  qword_C818 = (uint64_t)Current;
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_C830);
  WiFiManagerClientRegisterDeviceAttachmentCallback();
  WiFiManagerClientScheduleWithRunLoop();
  pthread_attr_t v4 = sub_40B0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_9DE8();
  }
  CFRunLoopRun();
  uint64_t v5 = sub_40B0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_9D5C();
  }
  return 0;
}

const __SCNetworkReachability *sub_8310(sockaddr *address)
{
  if (!address || ((v2 = address->sa_family, v2 != 2) ? (BOOL v3 = v2 == 30) : (BOOL v3 = 1), !v3))
  {
    uint64_t v7 = sub_40B0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (address) {
        int sa_family = address->sa_family;
      }
      else {
        int sa_family = 0;
      }
      v12[0] = 67109120;
      v12[1] = sa_family;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Invalid sockaddr or address family %d", (uint8_t *)v12, 8u);
    }
    return 0;
  }
  pthread_attr_t v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, address);
  if (!v4)
  {
    uint64_t v9 = sub_40B0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_9F54();
    }
    return 0;
  }
  uint64_t v5 = v4;
  if (!SCNetworkReachabilitySetCallback(v4, (SCNetworkReachabilityCallBack)sub_86A4, 0))
  {
    uint64_t v10 = sub_40B0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_9FC0();
    }
    goto LABEL_19;
  }
  if (!SCNetworkReachabilitySetDispatchQueue(v5, (dispatch_queue_t)qword_C7C0))
  {
    uint64_t v6 = sub_40B0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_A02C();
    }
LABEL_19:
    CFRelease(v5);
    return 0;
  }
  return v5;
}

void sub_84A8(char a1)
{
  int v2 = byte_C7A0;
  int v3 = byte_C7B0;
  SCNetworkReachabilityFlags flags = 0;
  if (qword_C798 && SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)qword_C798, &flags))
  {
    byte_C7A0 = (flags & 2) != 0;
    BOOL v4 = ((flags >> 1) & 1) != v2;
  }
  else
  {
    BOOL v4 = 0;
  }
  if (qword_C7A8)
  {
    if (SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)qword_C7A8, &flags))
    {
      byte_C7B0 = (flags & 2) != 0;
      if (((flags >> 1) & 1) != v3) {
        BOOL v4 = 1;
      }
    }
  }
  uint64_t v5 = sub_40B0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = "reachable";
    if (v2) {
      uint64_t v7 = "reachable";
    }
    else {
      uint64_t v7 = "not reachable";
    }
    if (byte_C7A0) {
      xpc_type_t v8 = "reachable";
    }
    else {
      xpc_type_t v8 = "not reachable";
    }
    *(_DWORD *)buf = 136315906;
    BOOL v14 = v7;
    if (v3) {
      uint64_t v9 = "reachable";
    }
    else {
      uint64_t v9 = "not reachable";
    }
    __int16 v15 = 2080;
    BOOL v16 = v8;
    if (!byte_C7B0) {
      uint64_t v6 = "not reachable";
    }
    __int16 v17 = 2080;
    pid_t v18 = v9;
    __int16 v19 = 2080;
    int v20 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "IPv4: %s->%s, IPv6: %s->%s", buf, 0x2Au);
  }
  if (v4 && (a1 & 1) == 0 && byte_C7A0 | byte_C7B0)
  {
    uint64_t v10 = sub_40B0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Transitioning from Not Reachable -> Reachable. Waking up all VoIP clients", buf, 2u);
    }
    for (uint64_t i = qword_C7B8; i; uint64_t i = *(void *)i)
    {
      if ((*(unsigned char *)(i + 64) & 3) == 2) {
        spd_notify_client_sessions_of_wake(i);
      }
    }
  }
}

void sub_86A4()
{
  if (!dword_C838++)
  {
    dispatch_time_t v1 = dispatch_time(0, 300000000);
    int v2 = qword_C7C0;
    dispatch_after(v1, v2, &stru_C6F8);
  }
}

void sub_8704(id a1)
{
  dispatch_time_t v1 = sub_40B0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2[0] = 67109120;
    v2[1] = dword_C838;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "Accumulating %d change(s)", (uint8_t *)v2, 8u);
  }
  dword_C838 = 0;
  sub_84A8(0);
}

void sub_87B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_87CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_8800(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_8880(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_8898(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_8910(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_8920(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_895C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x26u);
}

void sub_897C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

void sub_899C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_89BC()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "WiFiCallback fired but global WiFiManagerClient is NULL", v2, v3, v4, v5, v6);
}

void sub_89F0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 24);
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  sub_8880(&dword_0, a2, a3, "Unable to clean up client [ADDR=%p][PID=%d]", (uint8_t *)&v4);
}

void sub_8A70(const __CFString *a1)
{
  CFStringGetCStringPtr(a1, 0x600u);
  sub_8838();
  sub_8898(&dword_0, v1, v2, "%s:%d Logging to AggD key: %s", v3, v4, v5, v6, 2u);
}

void sub_8B0C()
{
  sub_88E0();
  sub_8880(&dword_0, v0, (uint64_t)v0, "Client %s.%d is not allowed to be woken up", v1);
}

void sub_8B80()
{
  sub_88F8();
  sub_8880(&dword_0, v0, (uint64_t)v0, "Need to wake client %s [%d] but no one is listening (SpringBoard?)", v1);
}

void sub_8C08()
{
  sub_8910(__stack_chk_guard);
  sub_87E8();
  sub_8800(&dword_0, v0, v1, "Unable to set TCP KeepAlive dispatch event for client [PID=%d] and socket [FD=%d]", v2, v3);
}

void sub_8C70()
{
  sub_87E8();
  sub_8800(&dword_0, v0, v1, "Attempting to re-register TCP KeepAlive dispatch event for client [PID=%d] and socket [FD=%d]", v2, v3);
}

void sub_8CE0()
{
  sub_8910(__stack_chk_guard);
  sub_87E8();
  sub_8800(&dword_0, v0, v1, "Unable to set dispatch events for client [PID=%d] and socket [FD=%d]", v2, v3);
}

void sub_8D48()
{
  sub_8910(__stack_chk_guard);
  sub_87E8();
  sub_8800(&dword_0, v0, v1, "Unable to register for reachability notifications for client [PID=%d] and socket [FD=%d]", v2, v3);
}

void sub_8DB0()
{
  sub_87E8();
  sub_8800(&dword_0, v0, v1, "Attempting to re-register dispatch socket events for client [PID=%d] and socket [FD=%d]", v2, v3);
}

void sub_8E20()
{
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "SC address pair failure for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_8E8C()
{
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "SC setting callback failure for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_8EF8()
{
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "SC scheduling with Run Loop failure for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_8F64(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = __error();
  strerror(*v3);
  sub_8848();
  sub_8880(&dword_0, a2, v4, "Not re-registering reachability because of weird state for client [PID=%d]: %s", v5);
}

void sub_8FF0()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "NULL object passed in for canceling reachability", v2, v3, v4, v5, v6);
}

void sub_9024()
{
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "SC setting dispatch queue failure for socket [FD=%d]", v2, v3, v4, v5, v6);
}

void sub_9090()
{
  sub_8950();
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "Unable to get interface name for client socket [FD=%d]", v2, v3, v4, v5, v6);
}

void sub_90F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_9164()
{
  sub_8950();
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "getsockopt() failed for client socket [FD=%d]", v2, v3, v4, v5, v6);
}

void sub_91CC(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = __error();
  strerror(*v3);
  sub_8848();
  sub_8880(&dword_0, a2, v4, "getpeername failure for client socket [FD=%d]: %s", v5);
}

void sub_9258(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = __error();
  strerror(*v3);
  sub_8848();
  sub_8880(&dword_0, a2, v4, "getsockname failure for client socket [FD=%d]: %s", v5);
}

void sub_92E4()
{
  sub_88D4();
  sub_87B0(&dword_0, v0, v1, "Invalid socket address for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_934C()
{
  sub_8950();
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "fileport_makefd failed for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_93B4()
{
  sub_88D4();
  sub_87B0(&dword_0, v0, v1, "Unable to vet socket for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_941C(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *a1;
  sub_8800(&dword_0, a2, a3, "Client process [PID=%d] cannot stop socket [FD=%d] from being defunct", 67109376, v3);
}

void sub_9498()
{
  sub_88D4();
  sub_87B0(&dword_0, v0, v1, "Unable to check-in unsupported socket for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_9500()
{
  sub_8950();
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "fstat check failed on descriptor for client [PID=%d]", v2, v3, v4, v5, v6);
}

void sub_9568()
{
  sub_8860();
  sub_897C(&dword_0, v0, v1, "[PID=%d] attempting to make call to start monitoring sockets for client [PID=%d] without \"%s\" entitlement", v2, v3, "com.apple.spd.anypidmonitoring");
}

void sub_95DC()
{
  sub_8860();
  sub_897C(&dword_0, v0, v1, "[PID=%d] attempting to make call to stop monitoring sockets for client [PID=%d] without \"%s\" entitlement", v2, v3, "com.apple.spd.anypidmonitoring");
}

void sub_9650()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "calloc failed", v2, v3, v4, v5, v6);
}

void sub_9684()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "init_spd_plugin failed", v2, v3, v4, v5, v6);
}

void sub_96B8()
{
  LODWORD(v2) = 136315906;
  sub_8838();
  sub_88B8();
  sub_895C(&dword_0, v0, v1, "%s:%d REMOVE event: %p, token %lld", v2, v3, v4, v5);
}

void sub_9734()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "xpc_dictionary_create or spd_get_listener_connection failed", v2, v3, v4, v5, v6);
}

void sub_9768()
{
  v1[0] = 136315394;
  sub_8838();
  *(_DWORD *)((char *)&v1[3] + 2) = 1903;
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s:%d xpc_event_provider_token_fire", (uint8_t *)v1, 0x12u);
}

void sub_97F4()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "xpc_connection_create failed", v2, v3, v4, v5, v6);
}

void sub_9828(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "unrecognized msg from pid %lld: %lld", (uint8_t *)&v3, 0x16u);
}

void sub_98B0()
{
  LODWORD(v2) = 136315906;
  sub_8838();
  sub_88B8();
  sub_895C(&dword_0, v0, v1, "%s:%d ADD event: %p, token %lld", v2, v3, v4, v5);
}

void sub_992C()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "No main queue", v2, v3, v4, v5, v6);
}

void sub_9960()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "Initial interface with CT failed", v2, v3, v4, v5, v6);
}

void sub_9994()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "Initial interface with WiFiManager failed", v2, v3, v4, v5, v6);
}

void sub_99C8()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "Initial runloop set-up failed", v2, v3, v4, v5, v6);
}

void sub_99FC()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "dispatch_source_create() for DISPATCH_SOURCE_TYPE_SIGNAL:SIGUSR2 failed. We cannot 'up' the verbosity if needed.", v2, v3, v4, v5, v6);
}

void sub_9A30()
{
  sub_8820();
  sub_87CC(&dword_0, v0, v1, "dispatch_source_create() for DISPATCH_SOURCE_TYPE_SIGNAL:SIGUSR1 failed. We cannot dump state if needed.", v2, v3, v4, v5, v6);
}

void sub_9A64()
{
  sub_88E0();
  sub_8880(&dword_0, v0, (uint64_t)v0, "spd_client_add failed for connection %p from pid %d", v1);
}

void sub_9ADC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_9B58(_xpc_connection_s *a1)
{
  xpc_connection_get_pid(a1);
  sub_88D4();
  sub_899C(&dword_0, v1, v2, "no client found for PID %d", v3, v4, v5, v6, v7);
}

void sub_9BD0()
{
  sub_88F8();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "%s [%d] unknown msg type %lld", v2, 0x1Cu);
}

void sub_9C6C(_xpc_connection_s *a1)
{
  xpc_connection_get_pid(a1);
  sub_88D4();
  sub_899C(&dword_0, v1, v2, "preventing socket checkin for pid %d, client wakeup not allowed", v3, v4, v5, v6, v7);
}

void sub_9CE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_9D5C()
{
  pthread_self();
  sub_8838();
  sub_893C();
  sub_8898(&dword_0, v0, v1, "%s:%d Thread %p CFRunLoopRun returning. Bug!", v2, v3, v4, v5, 2u);
}

void sub_9DE8()
{
  pthread_self();
  sub_8838();
  sub_893C();
  sub_8898(&dword_0, v0, v1, "%s:%d Thread %p Calling CFRunLoopRun", v2, v3, v4, v5, 2u);
}

void sub_9E74(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6 = 136316418;
  uint8_t v7 = "spd_wifi_runloop_thread";
  __int16 v8 = 1024;
  int v9 = 329;
  __int16 v10 = 2048;
  pthread_t v11 = pthread_self();
  __int16 v12 = 2048;
  uint64_t v13 = qword_C818;
  __int16 v14 = 2048;
  uint64_t v15 = a1;
  __int16 v16 = 2048;
  uint64_t v17 = a2;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "%s:%d Thread %p setting gWiFiRunLoop from %p to %p for WiFiManagerClientRef %p", (uint8_t *)&v6, 0x3Au);
}

void sub_9F54()
{
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "SC address failure for address family %d", v2, v3, v4, v5, v6);
}

void sub_9FC0()
{
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "SC setting callback failure for address family %d", v2, v3, v4, v5, v6);
}

void sub_A02C()
{
  sub_882C();
  sub_87B0(&dword_0, v0, v1, "SC setting dispatch queue failure for address family %d", v2, v3, v4, v5, v6);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddressPair(CFAllocatorRef allocator, const sockaddr *localAddress, const sockaddr *remoteAddress)
{
  return _SCNetworkReachabilityCreateWithAddressPair(allocator, localAddress, remoteAddress);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return _SCNetworkReachabilitySetCallback(target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return _SCNetworkReachabilitySetDispatchQueue(target, queue);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetDevice()
{
  return _WiFiManagerClientGetDevice();
}

uint64_t WiFiManagerClientGetWoWCapability()
{
  return _WiFiManagerClientGetWoWCapability();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return _WiFiManagerClientRegisterDeviceAttachmentCallback();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientSetType()
{
  return _WiFiManagerClientSetType();
}

uint64_t WiFiManagerClientSetWoWState()
{
  return _WiFiManagerClientSetWoWState();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCopyPacketContextInterfaceName()
{
  return __CTServerConnectionCopyPacketContextInterfaceName();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionGetPacketContextActiveByServiceType()
{
  return __CTServerConnectionGetPacketContextActiveByServiceType();
}

uint64_t _CTServerConnectionPacketContextAssertionCreate()
{
  return __CTServerConnectionPacketContextAssertionCreate();
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

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
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

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}