void sub_1800(uint64_t a1)
{
  int v2;
  NSObject *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  unsigned int v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  unsigned int v26;
  int v27;
  id v28;
  __int16 v29;
  unsigned int v30;

  v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v3 = *(NSObject **)(a1 + 32);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v12 = *(void **)(a1 + 40);
      v13 = v3;
      v14 = [v12 name];
      v15 = [v14 UTF8String];
      v16 = [*(id *)(a1 + 40) pid];
      v27 = 136315394;
      v28 = v15;
      v29 = 1024;
      v30 = v16;
      _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "%s (%d) is visibile", (uint8_t *)&v27, 0x12u);
    }
    v5 = (void *)qword_45D8;
    v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 40) pid]);
    [v5 addObject:v6];
  }
  else
  {
    if (v4)
    {
      v22 = *(void **)(a1 + 40);
      v23 = v3;
      v24 = [v22 name];
      v25 = [v24 UTF8String];
      v26 = [*(id *)(a1 + 40) pid];
      v27 = 136315394;
      v28 = v25;
      v29 = 1024;
      v30 = v26;
      _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "%s (%d) is not visibile", (uint8_t *)&v27, 0x12u);
    }
    v7 = (void *)qword_45D8;
    v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 40) pid]);
    [v7 removeObject:v6];
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(void **)(a1 + 40);
      v18 = v8;
      v19 = [v17 name];
      v20 = [v19 UTF8String];
      v21 = [*(id *)(a1 + 40) pid];
      v27 = 136315394;
      v28 = v20;
      v29 = 1024;
      v30 = v21;
      _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%s (%d) took media assertion", (uint8_t *)&v27, 0x12u);
    }
    v9 = (void *)qword_45D0;
    v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 40) pid]);
    [v9 addObject:v10];
  }
  else
  {
    v11 = (void *)qword_45D0;
    v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 40) pid]);
    [v11 removeObject:v10];
  }
}

void sub_1B08(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 40);
    v8 = v6;
    id v9 = [v7 name];
    id v10 = [v9 UTF8String];
    unsigned int v11 = [*(id *)(a1 + 40) pid];
    int v12 = 136315650;
    id v13 = v10;
    __int16 v14 = 1024;
    unsigned int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%s (%d) has endowment: %@", (uint8_t *)&v12, 0x1Cu);
  }
  if ([*(id *)(a1 + 48) containsObject:v5])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void sub_1C3C(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  unsigned int v6 = [v5 type];
  v7 = *(NSObject **)(a1 + 32);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6 == 3)
  {
    if (v8)
    {
      id v13 = *(void **)(a1 + 40);
      __int16 v14 = v7;
      id v15 = [v13 name];
      id v16 = [v15 UTF8String];
      unsigned int v17 = [*(id *)(a1 + 40) pid];
      v18 = [v5 description];
      int v25 = 136315906;
      id v26 = v16;
      __int16 v27 = 1024;
      unsigned int v28 = v17;
      __int16 v29 = 2112;
      v30 = v18;
      __int16 v31 = 2048;
      id v32 = [v5 reason];
      _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "%s (%d) took legacy assertion: %@ (%llu)", (uint8_t *)&v25, 0x26u);
    }
    id v9 = *(void **)(a1 + 48);
    id v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 reason]);
    LOBYTE(v9) = [v9 containsObject:v10];

    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_10;
  }
  if (v8)
  {
    v19 = *(void **)(a1 + 40);
    v20 = v7;
    id v21 = [v19 name];
    id v22 = [v21 UTF8String];
    unsigned int v23 = [*(id *)(a1 + 40) pid];
    v24 = [v5 description];
    int v25 = 136316162;
    id v26 = v22;
    __int16 v27 = 1024;
    unsigned int v28 = v23;
    __int16 v29 = 2112;
    v30 = v24;
    __int16 v31 = 2048;
    id v32 = [v5 reason];
    __int16 v33 = 1024;
    unsigned int v34 = [v5 type];
    _os_log_debug_impl(&dword_0, v20, OS_LOG_TYPE_DEBUG, "%s (%d) took other assertion: %@ (%llu) (%u)", (uint8_t *)&v25, 0x2Cu);
  }
  unsigned int v11 = *(void **)(a1 + 56);
  int v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 reason]);
  LODWORD(v11) = [v11 containsObject:v12];

  if (v11) {
    goto LABEL_9;
  }
LABEL_10:
}

void sub_1EFC(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  id v10 = [v9 state];
  unsigned int v11 = [v10 endowmentNamespaces];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1B08;
  v29[3] = &unk_42F0;
  id v30 = a1[4];
  id v12 = v8;
  id v31 = v12;
  id v32 = a1[5];
  __int16 v33 = v34;
  [v11 enumerateObjectsUsingBlock:v29];

  id v13 = [v9 state];
  __int16 v14 = [v13 assertions];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1C3C;
  v23[3] = &unk_4318;
  id v24 = a1[4];
  id v15 = v12;
  id v25 = v15;
  id v26 = a1[6];
  unsigned int v28 = v36;
  id v27 = a1[7];
  [v14 enumerateObjectsUsingBlock:v23];

  id v16 = qword_45C8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1800;
  block[3] = &unk_4340;
  id v21 = v34;
  id v19 = a1[4];
  id v20 = v15;
  id v22 = v36;
  id v17 = v15;
  dispatch_async(v16, block);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

void sub_21A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void CleanPidSet(void *a1)
{
  id v1 = a1;
  v2 = qword_45C8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2260;
  block[3] = &unk_4260;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

void sub_2260(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copy];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_22FC;
  v3[3] = &unk_4238;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

void sub_22FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (kill((pid_t)[v3 intValue], 0) && *__error() == 3) {
    [*(id *)(a1 + 32) removeObject:v3];
  }
}

void CleanupPidSets()
{
  CleanPidSet((void *)qword_45D0);
  v0 = (void *)qword_45D8;

  CleanPidSet(v0);
}

void HandleJetsamEvent()
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = sub_2508;
  void v3[4] = sub_2518;
  id v4 = 0;
  v1[0] = 0;
  v1[1] = v1;
  v1[2] = 0x3032000000;
  v1[3] = sub_2508;
  v1[4] = sub_2518;
  id v2 = 0;
  v0[0] = _NSConcreteStackBlock;
  v0[1] = 3221225472;
  v0[2] = sub_2520;
  v0[3] = &unk_4288;
  v0[4] = v3;
  v0[5] = v1;
  dispatch_sync((dispatch_queue_t)qword_45C8, v0);
  WriteJetsamMemoryReport();
  CleanPidSet((void *)qword_45D0);
  CleanPidSet((void *)qword_45D8);
  _Block_object_dispose(v1, 8);

  _Block_object_dispose(v3, 8);
}

void sub_24E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2508(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2518(uint64_t a1)
{
}

uint64_t sub_2520(uint64_t a1)
{
  id v2 = [(id)qword_45D0 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)qword_45D8 copy];

  return _objc_release_x1();
}

void MonitorAssertions()
{
  if (qword_45E0 != -1) {
    dispatch_once(&qword_45E0, &stru_42C8);
  }
}

void sub_25B4(id a1)
{
  id v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.MemoryMonitor.RBMonitor", v1);
  uint64_t v3 = (void *)qword_45C8;
  qword_45C8 = (uint64_t)v2;

  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = (void *)qword_45D0;
  qword_45D0 = (uint64_t)v4;

  id v6 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v7 = (void *)qword_45D8;
  qword_45D8 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.MemoryMonitor", "RBMonitor");
  id v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_4598, &off_45B0, 0);
  id v10 = objc_alloc_init((Class)NSSet);
  id v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"com.apple.frontboard.visibility", 0);
  if (objc_opt_class())
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2788;
    v14[3] = &unk_4390;
    id v15 = v11;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    uint64_t v12 = +[RBSProcessMonitor monitorWithConfiguration:v14];
    id v13 = (void *)qword_45E8;
    qword_45E8 = v12;
  }
}

void sub_2788(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(NSClassFromString(&cfstr_Rbsprocessever.isa));
  id v5 = +[RBSProcessPredicate predicateMatching:v4];

  id v6 = objc_alloc_init((Class)RBSProcessStateDescriptor);
  [v6 setValues:24];
  uint64_t v7 = [a1[4] allObjects];
  [v6 setEndowmentNamespaces:v7];

  __int16 v14 = v5;
  os_log_t v8 = +[NSArray arrayWithObjects:&v14 count:1];
  [v3 setPredicates:v8];

  [v3 setStateDescriptor:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1EFC;
  v9[3] = &unk_4368;
  id v10 = a1[5];
  id v11 = a1[4];
  id v12 = a1[6];
  id v13 = a1[7];
  [v3 setUpdateHandler:v9];
}

uint64_t init_memory_monitor()
{
  pthread_t v4 = 0;
  memset(&v5, 0, sizeof(v5));
  v0 = os_log_create("com.apple.MemoryMonitor", "plugin");
  log_handle = (uint64_t)v0;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "memory monitor plugin initialized", v3, 2u);
  }
  pthread_attr_init(&v5);
  pthread_attr_setdetachstate(&v5, 2);
  if (pthread_create(&v4, &v5, (void *(__cdecl *)(void *))sub_2A80, 0))
  {
    id v1 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v3 = 0;
      _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "error creating memory monitor thread", v3, 2u);
    }
  }
  return pthread_attr_destroy(&v5);
}

uint64_t sub_2A80(uint64_t a1)
{
  int v22 = 0;
  uint64_t v21 = 0;
  CFSocketContext context = off_43B0;
  int v2 = socket(32, 3, 1);
  if (v2 == -1)
  {
    os_log_t v8 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      id v9 = __error();
      id v10 = strerror(*v9);
      *(_DWORD *)buf = 136315138;
      id v24 = v10;
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "could not open event socket, socket() failed: %s", buf, 0xCu);
    }
    goto LABEL_10;
  }
  int v3 = v2;
  uint64_t v21 = 0x300000001;
  int v22 = 3;
  if (ioctl(v2, 0x800C6502uLL, &v21))
  {
    pthread_t v4 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      pthread_attr_t v5 = __error();
      id v6 = strerror(*v5);
      *(_DWORD *)buf = 136315138;
      id v24 = v6;
      uint64_t v7 = "could not establish event filter, ioctl() failed: %s";
LABEL_19:
      _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, v7, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  int v19 = 1;
  if (ioctl(v3, 0x8004667EuLL, &v19))
  {
    pthread_t v4 = log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      id v17 = __error();
      id v18 = strerror(*v17);
      *(_DWORD *)buf = 136315138;
      id v24 = v18;
      uint64_t v7 = "could not set non-blocking io, ioctl() failed: %s";
      goto LABEL_19;
    }
LABEL_9:
    close(v3);
LABEL_10:
    id v11 = log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR)) {
      return a1;
    }
    *(_WORD *)buf = 0;
    id v16 = "memory monitor disabled";
LABEL_17:
    _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    return a1;
  }
  id v13 = CFSocketCreateWithNative(0, v3, 1uLL, (CFSocketCallBack)sub_2D68, &context);
  RunLoopSource = CFSocketCreateRunLoopSource(0, v13, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  if (qword_45E0 != -1) {
    dispatch_once(&qword_45E0, &stru_42C8);
  }
  CFRelease(RunLoopSource);
  CFRelease(v13);
  CFRunLoopRun();
  id v11 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v16 = "memory monitor thread returning";
    goto LABEL_17;
  }
  return a1;
}

void sub_2D68(__CFSocket *a1)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  ssize_t v3 = recv(Native, v12, 0x20uLL, 0);
  if (v3 != -1)
  {
    if (v3 < v12[0])
    {
      pthread_t v4 = log_handle;
      if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "missed SYSPROTO_EVENT event, buffer not big enough", (uint8_t *)&v10, 2u);
      }
      return;
    }
    if (v12[1] == 1)
    {
      if (v12[2] == 3)
      {
        if (v12[3] == 3)
        {
          if (v12[5] == 2)
          {
            id v6 = log_handle;
            if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v10) = 0;
              _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "kernel jetsam snapshot note received", (uint8_t *)&v10, 2u);
            }
            HandleJetsamEvent();
            return;
          }
          uint64_t v7 = @"Unknown event code";
        }
        else
        {
          uint64_t v7 = @"New Apple System subclass";
        }
      }
      else
      {
        uint64_t v7 = @"New (Apple) class";
      }
    }
    else
    {
      uint64_t v7 = @"New vendor";
    }
    sub_2F84((uint64_t)v7, v12);
    return;
  }
  pthread_attr_t v5 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
  {
    os_log_t v8 = __error();
    id v9 = strerror(*v8);
    int v10 = 136315138;
    id v11 = v9;
    _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "recv() failed: %s", (uint8_t *)&v10, 0xCu);
    pthread_attr_t v5 = log_handle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v10) = 0;
    _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "memory monitor disabled", (uint8_t *)&v10, 2u);
  }
  CFSocketInvalidate(a1);
}

void sub_2F84(uint64_t a1, unsigned int *a2)
{
  pthread_t v4 = log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)id v17 = a1;
    _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%@ event:", buf, 0xCu);
    pthread_t v4 = log_handle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v10 = *a2;
    unsigned int v11 = a2[1];
    unsigned int v12 = a2[2];
    unsigned int v13 = a2[3];
    unsigned int v14 = a2[4];
    unsigned int v15 = a2[5];
    *(_DWORD *)buf = 67110400;
    *(_DWORD *)id v17 = v10;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v14;
    __int16 v18 = 1024;
    unsigned int v19 = v11;
    __int16 v20 = 1024;
    unsigned int v21 = v12;
    __int16 v22 = 1024;
    unsigned int v23 = v13;
    __int16 v24 = 1024;
    unsigned int v25 = v15;
    _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Event size=%d, id=%d, vendor=%d, class=%d, subclass=%d, code=%d", buf, 0x26u);
  }
  unsigned int v5 = *a2;
  if (*a2 >= 0x19)
  {
    int v6 = 0;
    uint64_t v7 = log_handle;
    uint64_t v8 = 6;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v9 = a2[v8];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v17 = v6;
        *(_WORD *)&v17[4] = 1024;
        *(_DWORD *)&v17[6] = v9;
        _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "Event data[%2d] = %08x", buf, 0xEu);
        uint64_t v7 = log_handle;
        unsigned int v5 = *a2;
      }
      ++v6;
      ++v8;
    }
    while ((v8 * 4) < v5);
  }
}

CFStringRef sub_316C()
{
  return CFStringCreateWithFormat(0, 0, @"<kernel event socket>");
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return _CFSocketCreateRunLoopSource(allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return _CFSocketCreateWithNative(allocator, sock, callBackTypes, callout, context);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return _CFSocketGetNative(s);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t WriteJetsamMemoryReport()
{
  return _WriteJetsamMemoryReport();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return [a1 assertions];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}