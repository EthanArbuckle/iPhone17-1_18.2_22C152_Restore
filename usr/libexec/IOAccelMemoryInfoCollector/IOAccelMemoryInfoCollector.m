void *sub_10000203C(void *a1)
{
  sub_100002498(a1);
  return a1;
}

uint64_t sub_100002064(uint64_t a1)
{
  return a1;
}

void start()
{
  mach_service = xpc_connection_create_mach_service("com.apple.gpumemd.client", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000041A0);
  xpc_connection_resume(mach_service);
  v1 = xpc_connection_create_mach_service("com.apple.gpumemd.source", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler(v1, &stru_1000041E0);
  xpc_connection_resume(v1);
  dispatch_main();
}

void sub_100002104(id a1, void *a2)
{
  sub_1000022A0("client listener event handler called", a2);
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    syslog(5, "client_listener error: %s", string);
    return;
  }
  xpc_connection_get_audit_token();
  audit_token_t token = handler;
  v3 = SecTaskCreateWithAuditToken(0, &token);
  if (v3)
  {
    v4 = v3;
    CFErrorRef error = 0;
    CFTypeRef v5 = SecTaskCopyValueForEntitlement(v3, @"com.apple.private.ioaccelmemoryinfo", &error);
    if (error) {
      CFRelease(error);
    }
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(v5);
      if (v6 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue((CFBooleanRef)v5);
        CFRelease(v5);
        CFRelease(v4);
        if (Value)
        {
          pid_t pid = xpc_connection_get_pid((xpc_connection_t)a2);
          *(void *)handler.val = _NSConcreteStackBlock;
          *(void *)&handler.val[2] = 0x40000000;
          *(void *)&handler.val[4] = sub_1000024FC;
          *(void *)&handler.val[6] = &unk_100004200;
          v13 = a2;
          pid_t v14 = pid;
          xpc_connection_set_event_handler((xpc_connection_t)a2, &handler);
          xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)&_dispatch_main_q);
          xpc_connection_resume((xpc_connection_t)a2);
          return;
        }
        goto LABEL_12;
      }
      CFRelease(v5);
    }
    CFRelease(v4);
  }
LABEL_12:
  xpc_connection_cancel((xpc_connection_t)a2);
}

void sub_1000022A0(const char *a1, xpc_object_t object)
{
  v3 = xpc_copy_description(object);
  syslog(7, "%s: %s", a1, v3);

  free(v3);
}

void sub_1000022FC(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    syslog(5, "source_listener error: %s", string);
  }
  else
  {
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)a2);
    pid_t v12 = pid;
    syslog(7, "registering new source connection %p for pid %d", a2, pid);
    uint64_t v4 = qword_100008020;
    if (!qword_100008020) {
      goto LABEL_12;
    }
    CFTypeRef v5 = &qword_100008020;
    do
    {
      pid_t v6 = *(_DWORD *)(v4 + 32);
      BOOL v7 = v6 < pid;
      if (v6 >= pid) {
        v8 = (uint64_t *)v4;
      }
      else {
        v8 = (uint64_t *)(v4 + 8);
      }
      if (!v7) {
        CFTypeRef v5 = (uint64_t *)v4;
      }
      uint64_t v4 = *v8;
    }
    while (*v8);
    if (v5 != &qword_100008020 && pid >= *((_DWORD *)v5 + 8))
    {
      syslog(7, "redundant checkin for PID %d, ignoring", pid);
      xpc_connection_cancel((xpc_connection_t)a2);
    }
    else
    {
LABEL_12:
      xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)&_dispatch_main_q);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_100002CFC;
      handler[3] = &unk_100004280;
      handler[4] = a2;
      pid_t v11 = pid;
      xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
      xpc_retain(a2);
      xpc_connection_resume((xpc_connection_t)a2);
      v13 = &v12;
      sub_10000324C((uint64_t **)&qword_100008018, &v12, (uint64_t)&unk_100003940, &v13)[5] = (uint64_t *)a2;
    }
  }
}

void *sub_100002498(void *result)
{
  if (result[2])
  {
    v1 = result;
    result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void sub_1000024FC(uint64_t a1, void *a2)
{
  sub_1000022A0("client connection event handler called", a2);
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "TargetProcess");
    if (value)
    {
      CFTypeRef v5 = value;
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
      {
        xpc_uint64_get_value(v5);
        operator new();
      }
      sub_100003608();
    }
    sub_1000035DC();
  }
  pid_t v6 = *(const void **)(a1 + 32);
  string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
  syslog(7, "client connection %p error delivered: %s", v6, string);
  for (i = (uint64_t *)qword_100008008; i != &qword_100008000; i = (uint64_t *)i[1])
  {
    v9 = (xpc_object_t *)i[2];
    if (v9[1] == *(xpc_object_t *)(a1 + 32))
    {
      syslog(7, "%s: deleting outstanding request %p", "void register_new_client(xpc_connection_t)_block_invoke", v9);
      uint64_t v10 = *i;
      *(void *)(v10 + 8) = i[1];
      *(void *)i[1] = v10;
      --qword_100008010;
      operator delete(i);
      sub_100002A54(v9);
    }
  }
  syslog(7, "%s: %zu outstanding requests left", "void register_new_client(xpc_connection_t)_block_invoke", qword_100008010);
}

void sub_100002744()
{
  v0 = (uint64_t *)qword_100008008;
  v1 = &qword_100008000;
  if ((uint64_t *)qword_100008008 != &qword_100008000)
  {
    uint64_t v2 = 0;
    uint64_t v3 = &qword_100008000;
    uint64_t v4 = &qword_100008020;
    CFTypeRef v5 = "%s: request %p timed out (now %f, last progress %f)";
    while (1)
    {
      pid_t v6 = (_DWORD *)v0[2];
      if (*((unsigned char *)v6 + 25)) {
        break;
      }
      uint64_t v7 = v3[4];
      if (!v7) {
        goto LABEL_31;
      }
      int v8 = *v6;
      v9 = v4;
      do
      {
        int v10 = *(_DWORD *)(v7 + 32);
        BOOL v11 = v10 < v8;
        if (v10 >= v8) {
          pid_t v12 = (uint64_t *)v7;
        }
        else {
          pid_t v12 = (uint64_t *)(v7 + 8);
        }
        if (!v11) {
          v9 = (uint64_t *)v7;
        }
        uint64_t v7 = *v12;
      }
      while (*v12);
      if (v9 != v4 && v8 >= *((_DWORD *)v9 + 8))
      {
        v16 = v1;
        uint64_t v17 = v2;
        v18 = v4;
        v19 = v5;
        v20 = v3;
        v21 = (_xpc_connection_s *)v9[5];
        syslog(7, "%s: request %p sending message to source pid %d for client pid %d", "void process_outstanding_requests()", v6, *v6, v6[1]);
        xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v22, "MemoryListRequest", 1);
        int32x2_t v23 = *(int32x2_t *)v6;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 0x40000000;
        handler[2] = sub_100002AC4;
        handler[3] = &unk_100004220;
        handler[4] = vrev64_s32(v23);
        v24 = v21;
        uint64_t v3 = v20;
        CFTypeRef v5 = v19;
        uint64_t v4 = v18;
        uint64_t v2 = v17;
        v1 = v16;
        xpc_connection_send_message_with_reply(v24, v22, (dispatch_queue_t)&_dispatch_main_q, handler);
        xpc_release(v22);
        *((unsigned char *)v6 + 25) = 1;
      }
      else
      {
LABEL_31:
        if (*((unsigned char *)v6 + 24)) {
          break;
        }
        syslog(7, "%s: request %p did not find a connection to source pid %d sending check-in broadcast", "void process_outstanding_requests()", (const void *)v0[2], *v6);
        if ((v2 & 1) == 0) {
          notify_post("com.apple.gpumemd.check_in_request");
        }
        uint64_t v2 = 1;
        *((unsigned char *)v6 + 24) = 1;
      }
      *((double *)v6 + 4) = sub_100002C9C();
LABEL_22:
      v0 = (uint64_t *)v0[1];
      if (v0 == &qword_100008000) {
        goto LABEL_23;
      }
    }
    if (sub_100002C9C() - *((double *)v6 + 4) > 1.0)
    {
      double v13 = sub_100002C9C();
      syslog(5, v5, "void process_outstanding_requests()", v6, *(void *)&v13, *((void *)v6 + 4));
      uint64_t v14 = *v0;
      *(void *)(v14 + 8) = v0[1];
      *(void *)v0[1] = v14;
      --v1[2];
      operator delete(v0);
      xpc_dictionary_set_BOOL(*((xpc_object_t *)v6 + 2), "Timeout", 1);
      remote_connection = xpc_dictionary_get_remote_connection(*((xpc_object_t *)v6 + 2));
      xpc_connection_send_message(remote_connection, *((xpc_object_t *)v6 + 2));
      xpc_release(*((xpc_object_t *)v6 + 1));
      xpc_release(*((xpc_object_t *)v6 + 2));
      operator delete();
    }
    goto LABEL_22;
  }
LABEL_23:
  if (v1[2]) {
    BOOL v25 = byte_100008030 == 0;
  }
  else {
    BOOL v25 = 0;
  }
  if (v25)
  {
    dispatch_time_t v26 = dispatch_time(0, 250000000);
    dispatch_after(v26, (dispatch_queue_t)&_dispatch_main_q, &stru_100004260);
    byte_100008030 = 1;
  }
}

void sub_100002A54(xpc_object_t *a1)
{
  syslog(7, "deallocating request %p", a1);
  xpc_release(a1[1]);
  xpc_release(a1[2]);

  operator delete();
}

void sub_100002AC4(uint64_t a1, xpc_object_t object)
{
  int v3 = *(_DWORD *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 36);
  xpc_type_t type = xpc_get_type(object);
  remote_connection = xpc_dictionary_get_remote_connection(object);
  uint64_t v7 = remote_connection;
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(object, _xpc_error_key_description);
    syslog(5, "source connection %p reply error: %s", v7, string);
    xpc_object_t value = 0;
LABEL_3:
    int v10 = 0;
    goto LABEL_7;
  }
  if (xpc_connection_get_pid(remote_connection) != v4) {
    sub_100003634();
  }
  xpc_object_t value = xpc_dictionary_get_value(object, "Payload");
  xpc_connection_t v11 = xpc_dictionary_get_remote_connection(object);
  if (!value)
  {
    syslog(5, "source connection %p reply error: Payload missing", v11);
    goto LABEL_3;
  }
  syslog(7, "source connection %p reply received", v11);
  int v10 = 1;
LABEL_7:
  for (i = (uint64_t *)qword_100008008; i != &qword_100008000; i = (uint64_t *)i[1])
  {
    double v13 = (_DWORD *)i[2];
    if (v13[1] == v3 && *v13 == v4)
    {
      if (v10)
      {
        syslog(7, "completing request %p, sending reply for source %d to client %d", v13, v4, v3);
        xpc_dictionary_set_value(*((xpc_object_t *)v13 + 2), "Payload", value);
        xpc_connection_send_message(*((xpc_connection_t *)v13 + 1), *((xpc_object_t *)v13 + 2));
      }
      else
      {
        syslog(7, "discarding request %p for source %d to client %d", v13, v4, v3);
      }
      uint64_t v14 = *i;
      *(void *)(v14 + 8) = i[1];
      *(void *)i[1] = v14;
      --qword_100008010;
      operator delete(i);
      sub_100002A54((xpc_object_t *)v13);
    }
  }
}

double sub_100002C9C()
{
  if (mach_timebase_info(&info)) {
    sub_100003660();
  }
  uint64_t v0 = mach_absolute_time();
  LODWORD(v1) = info.numer;
  LODWORD(v2) = info.denom;
  return (double)v0 * (double)v1 / (double)v2 / 1000000000.0;
}

void sub_100002CF0(id a1)
{
  byte_100008030 = 0;
  sub_100002744();
}

void sub_100002CFC(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    syslog(5, "source connection %p error received", *(const void **)(a1 + 32));
    sub_100002DD8((uint64_t)&qword_100008018, (int *)(a1 + 40));
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    int v4 = *(void **)(a1 + 32);
    xpc_release(v4);
  }
  else if (xpc_dictionary_get_BOOL(object, "CheckIn"))
  {
    syslog(7, "source connection %p for pid %d checked in");
  }
  else
  {
    syslog(5, "unexpected message from source connection %p");
  }
}

uint64_t sub_100002DD8(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  int v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    int v5 = *(_DWORD *)(v2 + 32);
    BOOL v6 = v5 < v3;
    if (v5 >= v3) {
      uint64_t v7 = (uint64_t *)v2;
    }
    else {
      uint64_t v7 = (uint64_t *)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32)) {
    return 0;
  }
  sub_100002E54((uint64_t **)a1, (uint64_t *)v4);
  operator delete((void *)v4);
  return 1;
}

uint64_t *sub_100002E54(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      int v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_100002EC8(v6, a2);
  return v3;
}

uint64_t *sub_100002EC8(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      int v3 = a2;
      goto LABEL_7;
    }
    do
    {
      int v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      double v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t **sub_10000324C(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  BOOL v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        BOOL v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      BOOL v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    sub_100003310(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_100003310(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_100003368(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_100003368(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), int v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            uint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *int v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_100003500(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100003500(a1, *a2);
    sub_100003500(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t sub_100003554()
{
  qword_100008000 = (uint64_t)&qword_100008000;
  qword_100008008 = (uint64_t)&qword_100008000;
  qword_100008010 = 0;
  __cxa_atexit((void (*)(void *))sub_10000203C, &qword_100008000, (void *)&_mh_execute_header);
  qword_100008028 = 0;
  qword_100008020 = 0;
  qword_100008018 = (uint64_t)&qword_100008020;

  return __cxa_atexit((void (*)(void *))sub_100002064, &qword_100008018, (void *)&_mh_execute_header);
}

void sub_1000035DC()
{
  __assert_rtn("register_new_client_block_invoke", "IOAccelMemoryInfoCollector.cpp", 273, "target_pid_obj != NULL");
}

void sub_100003608()
{
  __assert_rtn("register_new_client_block_invoke", "IOAccelMemoryInfoCollector.cpp", 274, "xpc_get_type(target_pid_obj) == XPC_TYPE_UINT64");
}

void sub_100003634()
{
  __assert_rtn("handle_source_reply", "IOAccelMemoryInfoCollector.cpp", 119, "source_pid == xpc_connection_get_pid(xpc_dictionary_get_remote_connection(reply))");
}

void sub_100003660()
{
  __assert_rtn("current_time", "IOAccelMemoryInfoCollector.cpp", 85, "r == KERN_SUCCESS");
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

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

void syslog(int a1, const char *a2, ...)
{
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

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
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

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}