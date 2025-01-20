void sub_2B0C(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  void v4[5];
  void applier[5];
  void v6[3];
  char v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v1 = *(_DWORD *)(a1 + 36);
  if ((v1 - 1) >= 2)
  {
    if (v1 == 4)
    {
      v3 = *(void **)(a1 + 16);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_46C8;
      v4[3] = &unk_8760;
      v4[4] = v6;
      xpc_dictionary_apply(v3, v4);
    }
    else if (v1 == 3)
    {
      v2 = *(void **)(a1 + 16);
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_2C6C;
      applier[3] = &unk_8738;
      applier[4] = v6;
      xpc_array_apply(v2, applier);
    }
    xpc_event_provider_token_set_state();
  }
  _Block_object_dispose(v6, 8);
}

void sub_2C50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_2C6C(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr && (v5 = opendir(string_ptr)) != 0)
  {
    v6 = v5;
    memset(&v12, 0, 512);
    v11 = 0;
    char v7 = 0;
    if (!readdir_r(v5, &v12, &v11))
    {
      v8 = v11;
      if (v11)
      {
        while (1)
        {
          d_name = v8->d_name;
          if (strcmp(v8->d_name, "."))
          {
            if (strcmp(d_name, "..")) {
              break;
            }
          }
          char v7 = 0;
          if (!readdir_r(v6, &v12, &v11))
          {
            v8 = v11;
            if (v11) {
              continue;
            }
          }
          goto LABEL_12;
        }
        char v7 = 1;
      }
    }
LABEL_12:
    closedir(v6);
  }
  else
  {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

id sub_3498(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [a2 _handleStream:a1 numEvents:a3 eventPaths:a4 eventFlags:a5 eventIds:a6];
}

void sub_34B4(uint64_t a1)
{
  switch(*(_DWORD *)(*(void *)(a1 + 32) + 36))
  {
    case 1:
      xpc_event_provider_token_fire();
    case 2:
      xpc_event_provider_token_set_state();
    case 3:
    case 4:
      uint64_t v1 = *(void *)(a1 + 32);
      sub_2B0C(v1);
      break;
    default:
      return;
  }
}

void init_fsevents_matching(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.fsevents.matching", "All");
  v3 = (void *)qword_9010;
  qword_9010 = (uint64_t)v2;

  v4 = [FSEventStreamMultiplexer alloc];
  v5 = [(FSEventStreamMultiplexer *)v4 initWithLogHandle:qword_9010];
  v6 = (void *)qword_8FF0;
  qword_8FF0 = (uint64_t)v5;

  [(id)qword_8FF0 setEventStreamCreateFlags:0];
  char v7 = [FSEventStreamMultiplexer alloc];
  v8 = [(FSEventStreamMultiplexer *)v7 initWithLogHandle:qword_9010];
  v9 = (void *)qword_8FF8;
  qword_8FF8 = (uint64_t)v8;

  [(id)qword_8FF8 setEventStreamCreateFlags:16];
  v10 = [FSEventStreamMultiplexer alloc];
  v11 = [(FSEventStreamMultiplexer *)v10 initWithLogHandle:qword_9010];
  dirent v12 = (void *)qword_9000;
  qword_9000 = (uint64_t)v11;

  [(id)qword_9000 setEventStreamCreateFlags:4];
  v13 = [FSEventStreamMultiplexer alloc];
  v14 = [(FSEventStreamMultiplexer *)v13 initWithLogHandle:qword_9010];
  v15 = (void *)qword_9008;
  qword_9008 = (uint64_t)v14;

  [(id)qword_9008 setEventStreamCreateFlags:20];
  qword_9018 = a1;
  xpc_event_provider_create();
}

void sub_372C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a1 == 1)
  {
    if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_dictionary) {
      _os_assumes_log();
    }
    v10 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A004000311DD6uLL);
    v10[1] = a2;
    v11 = qword_9010;
    if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a2;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Client token: %llu", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v12 = 0;
    while (1)
    {
      v13 = xpc_dictionary_get_value(v6, (&off_83A8)[v12]);
      v14 = v13;
      if (v13) {
        break;
      }
      v12 += 2;
      if (v12 == 8) {
        goto LABEL_37;
      }
    }
    *((_DWORD *)v10 + 9) = (&off_83A8)[v12 + 1];
    id v15 = v13;
    *((unsigned char *)v10 + 40) = 0;
    xpc_type_t type = xpc_get_type(v15);
    if (type == (xpc_type_t)&_xpc_type_string)
    {
      xpc_object_t v22 = sub_4080(v15);
      objects[0] = v22;
      if (v22)
      {
        string_ptr = xpc_string_get_string_ptr(v22);
        if (sub_4108(string_ptr))
        {
          v24 = qword_9010;
          if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = string_ptr;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "use_watchroot(%s)", (uint8_t *)&buf, 0xCu);
          }
          *((unsigned char *)v10 + 40) = 1;
        }
        v18 = xpc_array_create(objects, 1uLL);

        goto LABEL_36;
      }
    }
    else
    {
      if (type == (xpc_type_t)&_xpc_type_array)
      {
        xpc_object_t v25 = xpc_array_create(0, 0);
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v50 = sub_4198;
        v51 = &unk_83F0;
        v53 = v10 + 5;
        v18 = v25;
        v52 = v18;
        xpc_array_apply(v15, &buf);
        if (!xpc_array_get_count(v18))
        {

          v18 = 0;
        }
        goto LABEL_35;
      }
      if (type == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v50 = sub_4294;
        v51 = &unk_8418;
        v53 = v10 + 5;
        v18 = v17;
        v52 = v18;
        xpc_dictionary_apply(v15, &buf);
        if (!xpc_dictionary_get_count(v18))
        {

          v18 = 0;
        }
LABEL_35:

        goto LABEL_36;
      }
    }
    v18 = 0;
LABEL_36:

    v26 = (void *)v10[2];
    v10[2] = v18;

LABEL_37:
    if (!v10[2])
    {
      free(v10);
LABEL_61:

      goto LABEL_62;
    }
    sub_2B0C((uint64_t)v10);
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0;
    xpc_type_t v27 = xpc_get_type((xpc_object_t)v10[2]);
    if (v27 == (xpc_type_t)&_xpc_type_string)
    {
      v30 = (uint64_t *)malloc_type_malloc(8uLL, 0x6004044C4A2DFuLL);
      v31 = xpc_string_get_string_ptr((xpc_object_t)v10[2]);
      uint64_t *v30 = (uint64_t)CFStringCreateWithCString(kCFAllocatorDefault, v31, 0x8000100u);
      size_t count = 1;
    }
    else if (v27 == (xpc_type_t)&_xpc_type_array)
    {
      size_t count = xpc_array_get_count((xpc_object_t)v10[2]);
      v30 = (uint64_t *)malloc_type_malloc(8 * count, 0x6004044C4A2DFuLL);
      v33 = (void *)v10[2];
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v50 = sub_4764;
      v51 = &unk_8780;
      v52 = v30;
      xpc_array_apply(v33, &buf);
    }
    else
    {
      if (v27 != (xpc_type_t)&_xpc_type_dictionary)
      {
        id v28 = 0;
        id v29 = 0;
LABEL_60:

        _Block_object_dispose(&v45, 8);
        void *v10 = qword_9028;
        qword_9028 = (uint64_t)v10;
        goto LABEL_61;
      }
      size_t count = xpc_dictionary_get_count((xpc_object_t)v10[2]);
      v30 = (uint64_t *)malloc_type_malloc(8 * count, 0x6004044C4A2DFuLL);
      v46[3] = 0;
      v34 = (void *)v10[2];
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v50 = sub_47C4;
      v51 = &unk_87A8;
      v52 = &v45;
      v53 = v30;
      xpc_dictionary_apply(v34, &buf);
    }
    id v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"token=%llu", v10[1]);
    CFArrayRef v35 = CFArrayCreate(kCFAllocatorDefault, (const void **)v30, count, &kCFTypeArrayCallBacks);
    v46[3] = 0;
    if (count)
    {
      for (unint64_t i = 0; i < count; v46[3] = i)
      {
        CFRelease((CFTypeRef)v30[i]);
        unint64_t i = v46[3] + 1;
      }
    }
    free(v30);
    int v37 = *((_DWORD *)v10 + 9);
    BOOL v38 = v37 == 3;
    if (v37 == 3) {
      v39 = &qword_8FF0;
    }
    else {
      v39 = &qword_8FF8;
    }
    v40 = &qword_9000;
    if (!v38) {
      v40 = &qword_9008;
    }
    if (*((unsigned char *)v10 + 40)) {
      v41 = (id *)v40;
    }
    else {
      v41 = (id *)v39;
    }
    id v42 = *v41;
    id v29 = *v41;
    objects[0] = _NSConcreteStackBlock;
    objects[1] = (xpc_object_t)3221225472;
    objects[2] = sub_34B4;
    objects[3] = &unk_87C8;
    objects[4] = v10;
    unsigned int v43 = [v29 registerClient:v28 ofPaths:v35 withCallback:objects];
    *((_DWORD *)v10 + 8) = v43;
    if ((v43 & 0x80000000) == 0) {
      objc_storeStrong((id *)v10 + 3, v42);
    }
    CFRelease(v35);
    goto LABEL_60;
  }
  if (a1 == 2)
  {
    char v7 = &qword_9028;
    v8 = &qword_9028;
    while (1)
    {
      v8 = (uint64_t *)*v8;
      if (!v8) {
        break;
      }
      if (v8[1] == a2)
      {
        for (j = (uint64_t *)qword_9028; j != v8; j = (uint64_t *)*j)
          char v7 = j;
        *char v7 = *v8;
        v19 = (void *)v8[3];
        if (v19)
        {
          [v19 unregisterClient:*((unsigned int *)v8 + 8)];
          v20 = (void *)v8[3];
          v8[3] = 0;

          *((_DWORD *)v8 + 8) = -1;
        }
        v21 = (void *)v8[2];
        v8[2] = 0;

        free(v8);
        break;
      }
    }
  }
LABEL_62:
}

void sub_3E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

os_state_data_s *__cdecl sub_3E40(id a1, os_state_hints_s *a2)
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (a2->var2 != 3)
  {
    v8 = 0;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v4 = [(id)qword_8FF0 summary];
  [v3 addObject:v4];

  id v5 = [(id)qword_8FF8 summary];
  [v3 addObject:v5];

  v6 = [(id)qword_9000 summary];
  [v3 addObject:v6];

  char v7 = [(id)qword_9008 summary];
  [v3 addObject:v7];

  v8 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:0];
  v9 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)[v8 length] + 200, 0xF549F7CuLL);
  __strlcpy_chk();
  v9->var0 = 1;
  v9->var1.var1 = [v8 length];
  objc_msgSend(v8, "getBytes:length:", v9->var4, objc_msgSend(v8, "length"));
  v10 = (void *)qword_9010;
  if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    int v14 = 134217984;
    id v15 = [v8 length];
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "fsevents.matching state size: %lu bytes", (uint8_t *)&v14, 0xCu);
  }
  if ((unint64_t)[v8 length] > 0x8000)
  {
    uint64_t v12 = (void *)qword_9010;
    if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_ERROR)) {
      sub_57EC(v12, v8);
    }
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

xpc_object_t sub_4080(void *a1)
{
  id v1 = a1;
  string_ptr = xpc_string_get_string_ptr(v1);
  if (!string_ptr) {
    goto LABEL_5;
  }
  char v7 = 0;
  id v3 = sub_4428(string_ptr, &v7);
  if (!v7)
  {
    xpc_object_t v5 = v1;
    goto LABEL_7;
  }
  v4 = v3;
  if (v3)
  {
    xpc_object_t v5 = xpc_string_create(v3);
    free(v4);
  }
  else
  {
LABEL_5:
    xpc_object_t v5 = 0;
  }
LABEL_7:

  return v5;
}

BOOL sub_4108(const char *a1)
{
  BOOL v2 = 0;
  for (unint64_t i = 0; i != 83; ++i)
  {
    size_t v4 = strlen(off_8498[i]);
    if (!strncmp(a1, off_8498[i], v4) && !strchr((char *)&a1[v4], 47)) {
      break;
    }
    BOOL v2 = i > 0x51;
  }
  return v2;
}

uint64_t sub_4198(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v4 = sub_4080(a3);
  xpc_object_t v5 = v4;
  if (v4)
  {
    if (!**(unsigned char **)(a1 + 40))
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (sub_4108(string_ptr))
      {
        char v7 = qword_9010;
        if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315138;
          v10 = string_ptr;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "use_watchroot[%s]", (uint8_t *)&v9, 0xCu);
        }
        **(unsigned char **)(a1 + 40) = 1;
      }
    }
    xpc_array_set_value(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, v5);
  }

  return 1;
}

uint64_t sub_4294(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (a2)
    {
      LOBYTE(v11) = 0;
      char v7 = sub_4428(a2, &v11);
      if ((_BYTE)v11)
      {
        v8 = v7;
        a2 = v7;
        if (!v7) {
          goto LABEL_15;
        }
      }
      else
      {
        v8 = 0;
      }
      if (!**(unsigned char **)(a1 + 40) && sub_4108(a2))
      {
        int v9 = qword_9010;
        if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          uint64_t v12 = a2;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "use_watchroot{%s}", (uint8_t *)&v11, 0xCu);
        }
        **(unsigned char **)(a1 + 40) = 1;
      }
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, v5);
      free(v8);
    }
  }
  else
  {
    v6 = qword_9010;
    if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = a2;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Ignoring path: %s", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_15:

  return 1;
}

char *sub_4428(const char *a1, unsigned char *a2)
{
  int v9 = 0;
  *a2 = 0;
  if (qword_9030 != -1) {
    dispatch_once(&qword_9030, &stru_8458);
  }
  int v4 = *a1;
  if (v4 != 126)
  {
    if (v4 != 47)
    {
      *a2 = 1;
      goto LABEL_17;
    }
    if (!strncmp(a1 + 1, "var/", 4uLL))
    {
      *a2 = 1;
      id v5 = (const char *)qword_9038;
    }
    else
    {
      if (strncmp(a1 + 1, "etc/", 4uLL)) {
        goto LABEL_17;
      }
      *a2 = 1;
      id v5 = (const char *)qword_9040;
    }
    v6 = a1 + 5;
    goto LABEL_16;
  }
  *a2 = 1;
  if (qword_9048 != -1) {
    dispatch_once(&qword_9048, &stru_8478);
  }
  id v5 = (const char *)qword_9050;
  if (qword_9050 && a1[1] == 47)
  {
    v6 = a1 + 2;
LABEL_16:
    asprintf(&v9, "%s/%s", v5, v6);
  }
LABEL_17:
  result = v9;
  if (!v9)
  {
    if (*a2)
    {
      v8 = qword_9010;
      if (os_log_type_enabled((os_log_t)qword_9010, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        int v11 = a1;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Ignoring path: %s", buf, 0xCu);
      }
      return v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_4600(id a1)
{
  qword_9038 = (uint64_t)realpath_DARWIN_EXTSN("/var/", 0);
  qword_9040 = (uint64_t)realpath_DARWIN_EXTSN("/etc/", 0);
}

void sub_4644(id a1)
{
}

BOOL sub_46C8(uint64_t a1, const char *a2, void *a3)
{
  memset(&v8, 0, sizeof(v8));
  id v5 = a3;
  BOOL v6 = stat(a2, &v8) != 0;
  LOBYTE(a2) = xpc_BOOL_get_value(v5);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6 ^ a2;
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t sub_4764(uint64_t a1, uint64_t a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  *(void *)(*(void *)(a1 + 32) + 8 * a2) = CFStringCreateWithCString(kCFAllocatorDefault, string_ptr, 0x8000100u);
  return 1;
}

uint64_t sub_47C4(uint64_t a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  *(void *)(v4 + 8 * v6) = v3;
  return 1;
}

void sub_4B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4B84(uint64_t a1)
{
  BOOL v2 = -[FSEventStreamMultiplexerClient initWithID:name:callback:]([FSEventStreamMultiplexerClient alloc], "initWithID:name:callback:", [*(id *)(a1 + 32) nextAvailableID], *(void *)(a1 + 40), *(void *)(a1 + 56));
  if (v2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = *(id *)(a1 + 48);
    id v4 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v4)
    {
      id v5 = v4;
      char v22 = 0;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v10 = [*(id *)(a1 + 32) pathToClientsMap];
          int v11 = [v10 objectForKeyedSubscript:v8];

          if (!v11)
          {
            id v12 = objc_alloc_init((Class)NSMutableSet);
            v13 = [*(id *)(a1 + 32) pathToClientsMap];
            [v13 setObject:v12 forKeyedSubscript:v8];

            char v22 = 1;
          }
          int v14 = [*(id *)(a1 + 32) pathToClientsMap];
          id v15 = [v14 objectForKeyedSubscript:v8];
          [v15 addObject:v2];
        }
        id v5 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v5);
    }
    else
    {
      char v22 = 0;
    }

    xpc_object_t v17 = [*(id *)(a1 + 32) clients];
    v18 = [(FSEventStreamMultiplexerClient *)v2 clientID];
    [v17 setObject:v2 forKeyedSubscript:v18];

    v19 = [(FSEventStreamMultiplexerClient *)v2 clientID];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v19 intValue];

    objc_msgSend(*(id *)(a1 + 32), "setNextAvailableID:", objc_msgSend(*(id *)(a1 + 32), "nextAvailableID") + 1);
    if (v22) {
      [*(id *)(a1 + 32) _refreshStream];
    }
    v16 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v20 = [(FSEventStreamMultiplexerClient *)v2 name];
      uint64_t v21 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543618;
      id v28 = v20;
      __int16 v29 = 2114;
      uint64_t v30 = v21;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Client '%{public}@' registered for paths %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v16 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_5888();
    }
  }
}

void sub_4F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4F70(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) pathToClientsMap];
  id v3 = [v2 mutableCopy];

  id v4 = [*(id *)(a1 + 32) clients];
  id v5 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v21 = a1;
    char v7 = [*(id *)(a1 + 32) pathToClientsMap];
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          int v14 = [v3 objectForKeyedSubscript:v13];
          [v14 removeObject:v6];

          id v15 = [v3 objectForKeyedSubscript:v13];
          id v16 = [v15 count];

          if (!v16)
          {
            [v3 removeObjectForKey:v13];
            char v10 = 1;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v9);
    }
    else
    {
      char v10 = 0;
    }

    xpc_object_t v17 = [*(id *)(v21 + 32) logHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v6 name];
      *(_DWORD *)long long buf = 138543362;
      xpc_type_t v27 = v18;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Client '%{public}@' unregistered", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(v21 + 32) + 40), v3);
    v19 = [*(id *)(v21 + 32) clients];
    v20 = +[NSNumber numberWithInt:*(unsigned int *)(v21 + 48)];
    [v19 removeObjectForKey:v20];

    if (v10) {
      [*(id *)(v21 + 32) _refreshStream];
    }
    *(unsigned char *)(*(void *)(*(void *)(v21 + 40) + 8) + 24) = 1;
  }
}

void sub_5784(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_57AC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_57EC(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 length];
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "fsevents.matching state is too large to report (%lu bytes)", (uint8_t *)&v4, 0xCu);
}

void sub_5888()
{
  sub_57A0();
  sub_5784(&dword_0, v0, v1, "Failed to allocate client.", v2, v3, v4, v5, v6);
}

void sub_58BC()
{
  sub_57A0();
  sub_5784(&dword_0, v0, v1, "Failed to create dictionary.", v2, v3, v4, v5, v6);
}

void sub_58F0()
{
  sub_57A0();
  sub_5784(&dword_0, v0, v1, "Failed to resolve watched paths.", v2, v3, v4, v5, v6);
}

void sub_5924()
{
  sub_57A0();
  sub_5784(&dword_0, v0, v1, "Unexpected number of resolved paths.", v2, v3, v4, v5, v6);
}

void sub_5958(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Received invalid path from FSEvents.", buf, 2u);
}

void sub_5998(void *a1)
{
  [a1 eventStreamCreateFlags];
  sub_57AC(&dword_0, v1, v2, "Failed to create FSEventStream[flags=0x%08x].", v3, v4, v5, v6, 0);
}

void sub_5A14(void *a1)
{
  [a1 eventStreamCreateFlags];
  sub_57AC(&dword_0, v1, v2, "Failed to start FSEventStream[flags=0x%08x].", v3, v4, v5, v6, 0);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFArrayRef FSEventStreamCopyPathsBeingWatched(ConstFSEventStreamRef streamRef)
{
  return _FSEventStreamCopyPathsBeingWatched(streamRef);
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return _FSEventStreamCreate(allocator, callback, context, pathsToWatch, sinceWhen, latency, flags);
}

FSEventStreamEventId FSEventStreamGetLatestEventId(ConstFSEventStreamRef streamRef)
{
  return _FSEventStreamGetLatestEventId(streamRef);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return _FSEventStreamStart(streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
}

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  return _FSEventsGetCurrentEventId();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t vproc_swap_string()
{
  return _vproc_swap_string();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return _xpc_dictionary_get_count(xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
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

void xpc_event_provider_token_set_state()
{
  while (1)
    ;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend__copyResolvedPathToClientsMap(void *a1, const char *a2, ...)
{
  return [a1 _copyResolvedPathToClientsMap];
}

id objc_msgSend__refreshStream(void *a1, const char *a2, ...)
{
  return [a1 _refreshStream];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return [a1 clientID];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_eventStream(void *a1, const char *a2, ...)
{
  return [a1 eventStream];
}

id objc_msgSend_eventStreamCreateFlags(void *a1, const char *a2, ...)
{
  return [a1 eventStreamCreateFlags];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return [a1 logHandle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextAvailableID(void *a1, const char *a2, ...)
{
  return [a1 nextAvailableID];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathToClientsMap(void *a1, const char *a2, ...)
{
  return [a1 pathToClientsMap];
}

id objc_msgSend_pathsWatched(void *a1, const char *a2, ...)
{
  return [a1 pathsWatched];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_streamState(void *a1, const char *a2, ...)
{
  return [a1 streamState];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}