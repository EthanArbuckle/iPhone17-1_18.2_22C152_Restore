uint64_t start()
{
  id v0;
  CRRepairSession *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v0 = [objc_alloc((Class)ASTRepairSessionProvider) initWithServiceName:@"com.apple.corerepair.diagnostics-controller" entitlements:&off_100060588];
  v1 = [[CRRepairSession alloc] initWithDelegate:v0];
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "corerepaird has started!", buf, 2u);
  }

  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.corerepair"];
  if (!v7)
  {
    v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cannot create listener", v19, 2u);
    }
  }
  [v7 setDelegate:v4];
  [v7 resume];
  v9 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.corerepair.intentControl"];
  if (!v9)
  {
    v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot create listener", v18, 2u);
    }
  }
  [v9 setDelegate:v5];
  [v9 resume];
  v11 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.corerepair.preflightControl"];
  if (!v11)
  {
    v12 = handleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cannot create listener", v17, 2u);
    }
  }
  [v11 setDelegate:v6];
  [v11 resume];
  if (objc_opt_class())
  {
    [v0 setReceiver:v1];
    [v0 startListening];
  }
  else
  {
    v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ASTRepairSessionProvider is not linked on current platform", v16, 2u);
    }
  }
  v14 = +[NSRunLoop currentRunLoop];
  [v14 run];

  return 0;
}

id sub_1000052D4(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  unint64_t v6 = a3;
  v7 = (void *)v6;
  if (a1)
  {
    if (v5 | v6)
    {
      v8 = +[NSMutableDictionary dictionary];
      if (v5)
      {
        v9 = handleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10003D828(v5, v9);
        }

        [v8 setObject:v5 forKeyedSubscript:NSLocalizedDescriptionKey];
      }
      if (v7) {
        [v8 setObject:v7 forKeyedSubscript:NSUnderlyingErrorKey];
      }
      a1 = +[NSError errorWithDomain:CRErrorDomain code:a1 userInfo:v8];
    }
    else
    {
      a1 = +[NSError errorWithDomain:CRErrorDomain code:a1 userInfo:0];
    }
  }

  return a1;
}

void sub_100005DB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100005DDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_10000804C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000805C(uint64_t a1)
{
}

void sub_100008064(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    id v9 = a3;
    uint64_t v10 = [v9 allHeaderFields];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    unsigned int v13 = [v9 statusCode];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v7;
  id v19 = v7;

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v8;
  id v18 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000831C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008338(uint64_t a1, void *a2)
{
  id v3 = [a2 rangeAtIndex:1];
  [*(id *)(a1 + 32) substringWithRange:v3, v4];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v6 options:1];
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

void sub_1000085F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000933C(id a1)
{
  qword_10006E8B8 = objc_alloc_init(CRCFactoryHelper);

  _objc_release_x1();
}

void sub_10000A21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = a1;
    __int16 v7 = 2080;
    uint64_t v8 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }
}

void sub_10000AD6C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000AE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = (id)objc_opt_new();
  [v8 vcrtSign:a1 outSignature:a2 outDeviceNonce:a3 outError:a4];
}

void sub_10000AE98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = (id)objc_opt_new();
  [v8 bcrtSign:a1 outSignature:a2 outDeviceNonce:a3 outError:a4];
}

void sub_10000AF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = (id)objc_opt_new();
  [v8 tcrtSign:a1 outSignature:a2 outDeviceNonce:a3 outError:a4];
}

void sub_10000AF80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = (id)objc_opt_new();
  [v8 prpcSign:a1 outSignature:a2 outDeviceNonce:a3 outError:a4];
}

void sub_10000B088(id a1)
{
  qword_10006E8C8 = objc_alloc_init(CoreRepairHelper);

  _objc_release_x1();
}

void sub_10000BB94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C8B0(uint64_t a1, int a2, xpc_object_t xint)
{
  int64_t value = xpc_int64_get_value(xint);
  if (value == 37 || value == 17)
  {
    int v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003EA4C();
    }
  }
  else if (value)
  {
    uint64_t v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003E9D8();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

void sub_10000CA34(id a1)
{
  qword_10006E8E0 = (uint64_t)dlopen("/usr/lib/system/libxpc.dylib", 2);
}

void sub_10000CAF0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000D08C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) testSequencer];
  [v1 start];
}

void sub_10000D650(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) testSequencer];
  [v2 handleResult:*(void *)(a1 + 40)];
}

void sub_10000FB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_10000FB60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FB70(uint64_t a1)
{
}

void sub_10000FB78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "answer %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;
}

void sub_10000FC44(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "answer %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;
}

void *sub_100012E2C(uint64_t a1)
{
  id v2 = calloc(8uLL, 1uLL);
  id v3 = v2;
  if (v2)
  {
    *id v2 = 0;
    if (a1)
    {
      if (sub_10001482C((uint64_t)v2))
      {
        memset_s(v3, 8uLL, 0, 8uLL);
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

void *sub_100012EB0(int a1, int a2)
{
  switch(a1)
  {
    case 1:
      id v2 = (void **)&off_10006E1E8;
      goto LABEL_28;
    case 2:
      id v2 = (void **)&off_10006E1D8;
      goto LABEL_28;
    case 3:
      id v2 = (void **)&off_10006E1E0;
      goto LABEL_28;
    case 4:
      id v2 = (void **)&off_10006E1F0;
      goto LABEL_28;
    case 5:
      id v2 = (void **)&off_10006E1C8;
      goto LABEL_28;
    case 6:
      id v2 = (void **)&off_10006E270;
      goto LABEL_28;
    case 7:
      id v2 = (void **)&off_10006E268;
      goto LABEL_28;
    case 8:
      id v4 = (void **)&off_10006E280;
      goto LABEL_30;
    case 9:
      id v4 = (void **)&off_10006E288;
      goto LABEL_30;
    case 10:
      id v2 = (void **)&off_10006E298;
      goto LABEL_28;
    case 11:
      id v2 = (void **)&off_10006E2A0;
      goto LABEL_28;
    case 12:
      id v2 = (void **)&off_10006E2A8;
      goto LABEL_28;
    case 13:
      id v2 = (void **)&off_10006E2B0;
      goto LABEL_28;
    case 14:
      id v2 = (void **)&off_10006E2B8;
      goto LABEL_28;
    case 15:
      id v2 = (void **)&off_10006E278;
      goto LABEL_28;
    case 16:
      id v4 = (void **)&off_10006E228;
      goto LABEL_30;
    case 17:
      id v2 = (void **)&off_10006E238;
      goto LABEL_28;
    case 18:
      id v4 = (void **)&off_10006E240;
      goto LABEL_30;
    case 19:
      int v5 = off_10006E250;
      BOOL v6 = a2 == 3;
      goto LABEL_31;
    case 20:
      id v4 = (void **)&off_10006E258;
      goto LABEL_30;
    case 21:
      id v2 = (void **)&off_10006E260;
      goto LABEL_28;
    case 22:
      id v4 = (void **)&off_10006E248;
      goto LABEL_30;
    case 23:
      id v4 = (void **)&off_10006E230;
      goto LABEL_30;
    case 24:
      id v2 = (void **)&off_10006E2C0;
      goto LABEL_28;
    case 25:
      id v2 = (void **)&off_10006E2C8;
LABEL_28:
      int v5 = *v2;
      BOOL v6 = a2 == 2;
      goto LABEL_31;
    case 26:
      id v4 = (void **)&off_10006E290;
LABEL_30:
      int v5 = *v4;
      BOOL v6 = a2 == 1;
LABEL_31:
      if (v6) {
        result = v5;
      }
      else {
        result = 0;
      }
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_1000130A0(void *a1, int a2, uint64_t *a3)
{
  uint64_t v5 = 3758097090;
  BOOL v6 = (unsigned __int8 *)sub_100012EB0(a2, 1);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    if (!sub_10001460C(a1, v6) && (!a3 || !sub_100014E04(a1, v7, *a3))) {
      return 0;
    }
  }
  return v5;
}

uint64_t sub_10001311C(void ***a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    id v3 = *a1;
    if (*a1)
    {
      *a1 = 0;
      sub_10001458C(v3);
      memset_s(v3, 8uLL, 0, 8uLL);
      free(v3);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100013180(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, void ***a6)
{
  uint64_t v11 = 3758097090;
  v12 = off_10006E210;
  unsigned int v13 = (void **)calloc(8uLL, 1uLL);
  *unsigned int v13 = 0;
  sub_100014C84(v13, (uint64_t)off_10006E1B8, (uint64_t)v12);
  v25 = 0;
  size_t v26 = 0;
  v23 = 0;
  rsize_t v24 = 0;
  if (!a6) {
    goto LABEL_14;
  }
  uint64_t v14 = calloc(0x50uLL, 1uLL);
  v22 = v14;
  if (!v14)
  {
    uint64_t v11 = 3758604298;
    goto LABEL_14;
  }
  v15 = (void **)v14;
  memset_s(v14, 0x50uLL, 0, 0x50uLL);
  if (a4 && sub_10001482C((uint64_t)v13)
    || sub_100014E04(v13, (uint64_t)off_10006E1C0, a2)
    || sub_100014E04(v13, (uint64_t)off_10006E200, a3)
    || sub_100014944(v13, &v25, &v26))
  {
LABEL_17:
    sub_1000133B0((uint64_t *)&v22);
    goto LABEL_14;
  }
  uint64_t v16 = sub_10001352C();
  if (v16)
  {
    uint64_t v11 = v16;
    goto LABEL_17;
  }
  v17 = (char *)v23;
  rsize_t v18 = v24;
  void *v15 = v23;
  v15[1] = (void *)v18;
  *((_DWORD *)v15 + 10) = a1;
  v15[2] = &v17[v18];
  v20 = 0;
  uint64_t v21 = 0;
  if (sub_1000143D4((uint64_t)off_10006E208, &v20, &v21)) {
    v15[4] = v20;
  }
  if (sub_1000143D4((uint64_t)off_10006E1D8, &v20, &v21)) {
    v15[3] = v20;
  }
  uint64_t v11 = 0;
  *a6 = v15;
  v23 = 0;
  rsize_t v24 = 0;
LABEL_14:
  sub_10001458C(v13);
  memset_s(v13, 8uLL, 0, 8uLL);
  free(v13);
  memset_s(v25, v26, 0, v26);
  free(v25);
  memset_s(v23, v24, 0, v24);
  free(v23);
  return v11;
}

uint64_t sub_1000133B0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*a1) {
    return 3758097090;
  }
  *a1 = 0;
  if (*(void *)v1)
  {
    memset_s(*(void **)v1, *(void *)(v1 + 8), 0, *(void *)(v1 + 8));
    free(*(void **)v1);
  }
  id v2 = *(void **)(v1 + 48);
  if (v2)
  {
    memset_s(v2, *(void *)(v1 + 56), 0, *(void *)(v1 + 56));
    free(*(void **)(v1 + 48));
  }
  id v3 = *(void **)(v1 + 64);
  if (v3)
  {
    memset_s(v3, *(void *)(v1 + 72), 0, *(void *)(v1 + 72));
    free(*(void **)(v1 + 64));
  }
  memset_s((void *)v1, 0x50uLL, 0, 0x50uLL);
  free((void *)v1);
  return 0;
}

uint64_t sub_100013464(int a1, const void *a2, size_t a3, uint64_t *a4)
{
  uint64_t v4 = 3758097090;
  if (a2)
  {
    if (a3)
    {
      if (sub_100014294((uint64_t)a2) == a3)
      {
        uint64_t v4 = 3758604298;
        id v9 = calloc(0x50uLL, 1uLL);
        v12 = v9;
        if (v9)
        {
          uint64_t v10 = (uint64_t)v9;
          memset_s(v9, 0x50uLL, 0, 0x50uLL);
          *(_DWORD *)(v10 + 40) = a1;
          if (sub_10001370C(v10, a2, a3))
          {
            sub_1000133B0((uint64_t *)&v12);
          }
          else
          {
            uint64_t v4 = 0;
            *a4 = v10;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t sub_10001352C()
{
  int v0 = __chkstk_darwin();
  id v2 = v1;
  uint64_t v4 = v3;
  size_t v6 = v5;
  int v8 = v7;
  int v9 = v0;
  mach_port_t v10 = sub_100014014();
  if (v10)
  {
    if (v8)
    {
      mach_port_t v11 = v10;
      uint64_t v12 = 3758097090;
      if (sub_100014294((uint64_t)v8) == v6)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        uint64_t input = v9;
        uint64_t v12 = IOConnectCallMethod(v11, 0x2Bu, &input, 1u, v8, v6, 0, 0, __src, &__count);
        if (!v12 && v4 && v2)
        {
          unsigned int v13 = calloc(__count, 1uLL);
          *uint64_t v4 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            uint64_t v12 = 0;
            *id v2 = __count;
          }
          else
          {
            uint64_t v12 = 3758097085;
          }
        }
      }
    }
    else
    {
      uint64_t v12 = 3758097090;
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_operation", ":", 457, "", 0, "", "");
    uint64_t v12 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v12;
}

uint64_t sub_10001370C(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (!sub_1000143D4((uint64_t)off_10006E208, &v8, &v9)) {
    return 3758097090;
  }
  if (*(void *)a1)
  {
    memset_s(*(void **)a1, *(void *)(a1 + 8), 0, *(void *)(a1 + 8));
    free(*(void **)a1);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  size_t v6 = calloc(a3, 1uLL);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = a3;
  if (!v6) {
    return 3758604298;
  }
  memcpy(v6, a2, a3);
  *(void *)(a1 + 16) = *(void *)a1 + *(void *)(a1 + 8);
  if (sub_1000143D4((uint64_t)off_10006E208, &v8, &v9)) {
    *(void *)(a1 + 32) = v8;
  }
  if ((sub_1000143D4((uint64_t)off_10006E1D8, &v8, &v9) & 1) != 0
    || (uint64_t result = sub_1000143D4((uint64_t)off_10006E1D0, &v8, &v9), result))
  {
    uint64_t result = 0;
    *(void *)(a1 + 24) = v8;
  }
  return result;
}

uint64_t sub_100013844(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = 3758604298;
  if (a1
    && (!*(void *)(a1 + 48) || !sub_10001482C((uint64_t)a2))
    && (!a3 || !sub_10001482C((uint64_t)a2)))
  {
    sub_10001460C(a2, (unsigned __int8 *)off_10006E1D8);
    return 0;
  }
  return v3;
}

uint64_t sub_1000138D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = 3758097090;
  uint64_t v8 = off_10006E218;
  uint64_t v9 = (void **)calloc(8uLL, 1uLL);
  void *v9 = 0;
  sub_100014C84(v9, (uint64_t)off_10006E1B8, (uint64_t)v8);
  __s = 0;
  rsize_t __n = 0;
  if (!sub_100013844((uint64_t)a1, v9, a2))
  {
    sub_10001460C(v9, (unsigned __int8 *)off_10006E1C8);
    sub_10001460C(v9, (unsigned __int8 *)off_10006E208);
    if (!sub_100014C94(v9, (uint64_t)off_10006E1C8, a4)
      && !sub_100014B14(v9, (uint64_t)off_10006E208, *a1, a1[2])
      && !sub_100014944(v9, &__s, &__n))
    {
      uint64_t v7 = sub_10001352C();
    }
  }
  sub_10001458C(v9);
  memset_s(v9, 8uLL, 0, 8uLL);
  free(v9);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t sub_100013A54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7 = a7;
  *(void *)&long long v20 = a6;
  *((void *)&v20 + 1) = a6 + a7;
  int v19 = 0;
  uint64_t v18 = 0;
  sub_10001451C(&v20, 4, &v19, &v18);
  if ((v10 & 1) == 0)
  {
    uint64_t v18 = a6;
    int v19 = v7;
  }
  uint64_t v11 = 3758097090;
  int v12 = sub_100013C64((uint64_t)a1);
  if ((v12 - 4) < 2)
  {
    char v16 = 0;
    goto LABEL_8;
  }
  if ((v12 - 7) < 2)
  {
    char v16 = 0;
    if (ccec_cp_384())
    {
LABEL_9:
      __chkstk_darwin();
      bzero((char *)&v15 - v13, v13);
      uint64_t v17 = 0;
      if (sub_100013CC4(a1, &v17) && !ccec_import_pub() && !ccec_verify())
      {
        if (!v16) {
          return 3758604294;
        }
        return 0;
      }
      return v11;
    }
LABEL_8:
    ccec_cp_256();
    goto LABEL_9;
  }
  if (v12 == 3)
  {
    uint64_t v17 = 0;
    if (sub_100013CC4(a1, &v17))
    {
      if (v17 == 32 && v18 && v19 == 64)
      {
        ccsha512_di();
        if (cced25519_verify()) {
          return 3758604294;
        }
        return 0;
      }
    }
  }
  return v11;
}

uint64_t sub_100013C64(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t result = sub_1000143D4((uint64_t)off_10006E200, &v2, &v3);
  if (result) {
    return sub_1000144B0();
  }
  return result;
}

uint64_t sub_100013CC4(void *a1, void *a2)
{
  unsigned int v16 = 0;
  uint64_t v15 = 0;
  if (!a1[4]) {
    return 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (sub_1000143D4((uint64_t)off_10006E1F8, &v13, &v14))
  {
    *(void *)&long long v12 = v13;
    *((void *)&v12 + 1) = v13 + v14;
    sub_10001451C(&v12, 4, &v16, &v15);
  }
  int v4 = sub_100013C64((uint64_t)a1);
  if ((v4 - 7) < 2)
  {
    uint64_t v5 = ccec_cp_384();
    goto LABEL_9;
  }
  if ((v4 - 4) <= 1)
  {
    uint64_t v5 = ccec_cp_256();
LABEL_9:
    if (v5 && v16 == (unint64_t)(j__cczp_bitlen() + 7) >> 3)
    {
      if (v15 && !a1[8])
      {
        __chkstk_darwin();
        bzero((char *)&v11 - v7, v7);
        ccec_compact_import_pub();
        size_t v8 = (2 * sub_100014204()) | 1;
        uint64_t v9 = calloc(v8, 1uLL);
        a1[8] = v9;
        a1[9] = v8;
        if (v9) {
          ccec_export_pub();
        }
        cc_clear();
      }
      uint64_t v10 = a1[9];
      uint64_t v15 = a1[8];
      unsigned int v16 = v10;
    }
  }
  *a2 = v16;
  return v15;
}

uint64_t sub_100013E9C(uint64_t *a1, void *a2)
{
  uint64_t result = *a1;
  *a2 = a1[1];
  return result;
}

uint64_t sub_100013EA8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100013EC8(a1, (uint64_t)off_10006E220, a2, a3, a4, a5);
}

uint64_t sub_100013EC8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = 3758097090;
  long long v12 = (void **)calloc(8uLL, 1uLL);
  void *v12 = 0;
  sub_100014C84(v12, (uint64_t)off_10006E1B8, a2);
  __s = 0;
  rsize_t __n = 0;
  if (a1)
  {
    if (a5)
    {
      if (a6)
      {
        if (!sub_100013844((uint64_t)a1, v12, a3))
        {
          sub_10001460C(v12, (unsigned __int8 *)off_10006E208);
          if (!sub_100014B14(v12, (uint64_t)off_10006E208, *a1, a1[2])
            && !sub_100014944(v12, &__s, &__n))
          {
            uint64_t v11 = sub_10001352C();
          }
        }
      }
    }
  }
  sub_10001458C(v12);
  memset_s(v12, 8uLL, 0, 8uLL);
  free(v12);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v11;
}

uint64_t sub_100014014()
{
  if (qword_10006E8F0 != -1) {
    dispatch_once(&qword_10006E8F0, &stru_100058D78);
  }
  dispatch_sync((dispatch_queue_t)qword_10006E8F8, &stru_100058D38);
  uint64_t result = dword_10006E8E8;
  if (!dword_10006E8E8)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_10006E8E8;
  }
  return result;
}

void sub_1000140A0(id a1)
{
  if (!dword_10006E8E8) {
    dword_10006E8E8 = sub_10001410C("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_1000140E0(id a1)
{
  qword_10006E8F8 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_10001410C(char *path, const char *a2)
{
  kern_return_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  io_service_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (v4 = v3, uint64_t v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    size_t v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      size_t v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  uint64_t result = connect;
  if (connect)
  {
    uint64_t v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    uint64_t result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

unint64_t sub_100014204()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

BOOL sub_100014228(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5 = sub_100014294((uint64_t)a1);
  return v5 == sub_100014294((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t sub_100014294(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len()) {
    return a1 - a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000142FC()
{
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result) {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000143D4(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    sub_1000142FC();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL sub_10001444C(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v8 = sub_100014228(*(const void **)a5, *(void *)a5 + *(unsigned __int8 *)(*(void *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(unsigned char *)(a5 + 24) = 1;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t sub_1000144B0()
{
  return 0;
}

double sub_10001451C(long long *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  long long v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    double result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t sub_10001458C(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    uint64_t v2 = *a1;
    if (!*a1) {
      break;
    }
    io_service_t v3 = (void *)*((void *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((void *)v2 + 2), 0, *((void *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_10001460C(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (void **)a1;
  uint64_t result = (uint64_t)sub_1000146A8(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (i = *v2; i != (void *)result; i = (void *)*i)
      uint64_t v2 = (void **)i;
    *uint64_t v2 = *(void **)result;
    size_t v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(void *)(v4 + 16), 0, *(void *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

void *sub_1000146A8(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      size_t v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && sub_100014228(a2, (uint64_t)&a2[a2[1] + 2], v5)) {
        break;
      }
      uint64_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_10001472C(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t sub_10001482C(uint64_t a1)
{
  if (a1) {
    return sub_1000142FC() - 1;
  }
  else {
    return 4294967285;
  }
}

uint64_t sub_100014874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  long long v8 = (unsigned __int8 *)sub_10001472C(a1);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (!sub_10001460C(a5, v8) && !sub_100014B14(a5, v9, a3, a3 + a4)) {
      return 1;
    }
  }
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t sub_100014944(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        size_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          do
          {
            v10 += v7[2];
            size_t v7 = (void *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (rsize_t v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            uint64_t v13 = v12;
            uint64_t v14 = (void *)*a1;
            if (*a1)
            {
              uint64_t v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                uint64_t v14 = (void *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10001501C);
            size_t v16 = ccder_sizeof();
            uint64_t v17 = (char *)calloc(v16, 1uLL);
            uint64_t v18 = v17;
            if (v17)
            {
              v25 = v17;
              size_t v26 = &v17[v16];
              unint64_t v19 = v8 - 1;
              uint64_t v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                uint64_t v22 = v20 - 16;
                char v23 = ccder_blob_encode_body();
                uint64_t v20 = v22;
                if ((v23 & 1) == 0) {
                  goto LABEL_16;
                }
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                uint64_t v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              uint64_t v3 = 0;
              *a2 = v18;
              *a3 = v16;
              uint64_t v18 = 0;
            }
            else
            {
              uint64_t v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_100014B14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (sub_100014294(a3) <= (unint64_t)(a4 - a3))
    {
      size_t v6 = ccder_sizeof();
      size_t v7 = (char *)calloc(v6, 1uLL);
      if (!v7) {
        return 4294967279;
      }
      unint64_t v8 = v7;
      size_t v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        int v9 = ccder_blob_encode_body();
        uint64_t v10 = v16;
        if (!v9) {
          uint64_t v10 = 0;
        }
        uint64_t v17 = v10;
        int v11 = ccder_blob_encode_tl();
        long long v12 = v17;
        if (!v11) {
          long long v12 = 0;
        }
        if (v12 && v12 == v8)
        {
          uint64_t v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t result = 0;
            v15[1] = v8;
            v15[2] = v6;
            void *v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_100014C84(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100014B14(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_100014C94(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    size_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      size_t v7 = v6;
      uint64_t v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      int v9 = v15;
      if (!v8) {
        int v9 = 0;
      }
      size_t v16 = v9;
      int v10 = ccder_blob_encode_tl();
      int v11 = v16;
      if (!v10) {
        int v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (uint64_t v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        uint64_t v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *uint64_t v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_100014E04(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unint64_t v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    uint64_t v10 = 8;
  }
  else
  {
    uint64_t v6 = 9;
    uint64_t v7 = 48;
    uint64_t v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      uint64_t v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if (v5 != v9)
      {
        uint64_t v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    uint64_t v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v8;
    }
  }
  uint64_t v25 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v12 = ccder_sizeof();
    uint64_t v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = v10;
      do
      {
        *((unsigned char *)&v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      char v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl()) {
        goto LABEL_30;
      }
      int v16 = ccder_blob_encode_body();
      uint64_t v17 = v23;
      if (!v16) {
        uint64_t v17 = 0;
      }
      rsize_t v24 = v17;
      int v18 = ccder_blob_encode_tl();
      unint64_t v19 = v24;
      if (!v18) {
        unint64_t v19 = 0;
      }
      BOOL v20 = v19 && v19 == v14;
      if (v20 && (uint64_t v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        uint64_t v22 = v21;
        uint64_t result = 0;
        v22[1] = v14;
        v22[2] = v12;
        void *v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_10001501C(const void **a1, void **a2)
{
  unint64_t v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  int v2 = memcmp(v5, __s2, 0);
  if (v2 > 0) {
    return 1;
  }
  else {
    return ((v2 < 0) << 31 >> 31);
  }
}

uint64_t verifyFDRData(const char *a1, size_t a2)
{
  if (qword_10006E908 != -1) {
    dispatch_once(&qword_10006E908, &stru_100058D98);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v4 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int v18 = a1;
    __int16 v19 = 2048;
    size_t v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      size_t v12 = __osLogPearlLib;
    }
    else {
      size_t v12 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    int v18 = "data";
    __int16 v19 = 2048;
    size_t v20 = 0;
    __int16 v21 = 2080;
    uint64_t v22 = "";
    __int16 v23 = 2080;
    rsize_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      size_t v12 = __osLogPearlLib;
    }
    else {
      size_t v12 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    int v18 = "dataLength > 0";
    __int16 v19 = 2048;
    size_t v20 = 0;
    __int16 v21 = 2080;
    uint64_t v22 = "";
    __int16 v23 = 2080;
    rsize_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 180;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    uint64_t v5 = 258;
    goto LABEL_12;
  }
  uint64_t v5 = sub_100015730();
  if (v5)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      uint64_t v13 = __osLogPearlLib;
    }
    else {
      uint64_t v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      int v18 = "err == 0 ";
      __int16 v19 = 2048;
      size_t v20 = (int)v5;
      __int16 v21 = 2080;
      uint64_t v22 = "";
      __int16 v23 = 2080;
      rsize_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v25 = 1024;
      int v26 = 183;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v6 = sub_1000159F0(dword_10006E900, 10, 0, a1, a2, 0, 0);
    if (v6)
    {
      uint64_t v14 = v6;
      size_t v15 = (int)v6;
      fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (qword_10006E908 != -1) {
        dispatch_once(&qword_10006E908, &stru_100058D98);
      }
      if (__osLogPearlLib) {
        int v16 = __osLogPearlLib;
      }
      else {
        int v16 = &_os_log_default;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        int v18 = "err == 0 ";
        __int16 v19 = 2048;
        size_t v20 = v15;
        __int16 v21 = 2080;
        uint64_t v22 = "";
        __int16 v23 = 2080;
        rsize_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v25 = 1024;
        int v26 = 186;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v5 = v14;
    }
  }
LABEL_12:
  if (dword_10006E900)
  {
    IOServiceClose(dword_10006E900);
    dword_10006E900 = 0;
  }
  if (v5)
  {
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v7 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v5;
      uint64_t v8 = v7;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v10 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      uint64_t v8 = v10;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v5;
}

uint64_t sub_100015730()
{
  CFDictionaryRef v0 = IOServiceMatching("ApplePearlSEPDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    io_object_t v2 = MatchingService;
    uint64_t v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_10006E900);
    if (v3)
    {
      fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_10006E908 != -1) {
        dispatch_once(&qword_10006E908, &stru_100058D98);
      }
      if (__osLogPearlLib) {
        uint64_t v6 = __osLogPearlLib;
      }
      else {
        uint64_t v6 = &_os_log_default;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v8 = "err == 0 ";
        __int16 v9 = 2048;
        uint64_t v10 = (int)v3;
        __int16 v11 = 2080;
        size_t v12 = "";
        __int16 v13 = 2080;
        uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v15 = 1024;
        int v16 = 129;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v2);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    uint64_t v3 = 3758097084;
    if (__osLogPearlLib) {
      uint64_t v5 = __osLogPearlLib;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = "service";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      size_t v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v15 = 1024;
      int v16 = 126;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

uint64_t sub_1000159F0(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, void *a7)
{
  size_t v14 = a5 + 8;
  __int16 v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    int v16 = v15;
    _WORD *v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
    v15[3] = a3;
    if (a5) {
      memmove(v15 + 4, a4, a5);
    }
    if (a7)
    {
      *(void *)outputStructCnt = *a7;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(void *)outputStructCnt;
    }
    else
    {
      *(void *)outputStructCnt = 0;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(void *)&outputStructCnt[4] = "cmd";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      rsize_t v24 = "";
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v27 = 1024;
      int v28 = 99;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t decompressReferenceFrames(const void *a1, size_t a2, uint64_t a3)
{
  size_t v123 = 0;
  *(_OWORD *)__str = 0u;
  long long v131 = 0u;
  if (!a1 || !a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v99 = __osLogPearlLib;
    }
    else {
      v99 = &_os_log_default;
    }
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v99 = __osLogPearlLib;
    }
    else {
      v99 = &_os_log_default;
    }
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "systemRootPath";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 310;
LABEL_190:
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    uint64_t v12 = 258;
LABEL_263:
    p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CoreRepairPreflightProtocol + 40);
    goto LABEL_124;
  }
  uint64_t v6 = sub_100015730();
  if (v6)
  {
    uint64_t v12 = v6;
    uint64_t v100 = (int)v6;
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v101 = __osLogPearlLib;
    }
    else {
      v101 = &_os_log_default;
    }
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = v100;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 313;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  uint64_t v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v102 = __osLogPearlLib;
    }
    else {
      v102 = &_os_log_default;
    }
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "fdrInput";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 317;
    goto LABEL_221;
  }
  uint64_t v8 = v7;
  *(_DWORD *)uint64_t v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  uint64_t v9 = sub_1000159F0(dword_10006E900, 36, 0, v8, a2 + 9, 0, 0);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v103 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v104 = __osLogPearlLib;
    }
    else {
      v104 = &_os_log_default;
    }
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = v103;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 327;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  size_t v123 = 52;
  uint64_t v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v102 = __osLogPearlLib;
    }
    else {
      v102 = &_os_log_default;
    }
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "dataInfo";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 334;
LABEL_221:
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    uint64_t v12 = 260;
    goto LABEL_263;
  }
  __int16 v11 = v10;
  uint64_t v12 = sub_1000159F0(dword_10006E900, 45, 0, 0, 0, v10, &v123);
  if (v12)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v105 = __osLogPearlLib;
    }
    else {
      v105 = &_os_log_default;
    }
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = (int)v12;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 338;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(__stderrp, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (qword_10006E908 != -1) {
    dispatch_once(&qword_10006E908, &stru_100058D98);
  }
  if (__osLogPearlLib) {
    __int16 v13 = __osLogPearlLib;
  }
  else {
    __int16 v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v127 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v106 = __osLogPearlLib;
    }
    else {
      v106 = &_os_log_default;
    }
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "dataInfo->setCount > 0";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = 0;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 342;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 259;
    goto LABEL_262;
  }
  __int16 v15 = +[NSString stringWithFormat:@"%s%s", a3, "/System/Library/Pearl/ReferenceFrames"];
  int v16 = __stderrp;
  if (!v15)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v107 = __osLogPearlLib;
    }
    else {
      v107 = &_os_log_default;
    }
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "path";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = 0;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 345;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 261;
    goto LABEL_262;
  }
  uint64_t v17 = v15;
  fprintf(v16, "ReferenceFramesPath: %s\n", [(NSString *)v17 UTF8String]);
  if (qword_10006E908 != -1) {
    dispatch_once(&qword_10006E908, &stru_100058D98);
  }
  if (__osLogPearlLib) {
    int v18 = __osLogPearlLib;
  }
  else {
    int v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = v17;
    size_t v20 = v18;
    __int16 v21 = [(NSString *)v19 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)v127 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);
  }
  uint64_t v22 = +[NSFileManager defaultManager];
  unsigned int v23 = [(NSFileManager *)v22 fileExistsAtPath:v17];

  if (v23)
  {
    rsize_t v24 = +[NSFileManager defaultManager];
    unsigned int v25 = [(NSFileManager *)v24 removeItemAtPath:v17 error:0];

    if ((v25 & 1) == 0)
    {
      uint64_t v12 = v25 ^ 1;
      fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (qword_10006E908 != -1) {
        dispatch_once(&qword_10006E908, &stru_100058D98);
      }
      if (__osLogPearlLib) {
        v108 = __osLogPearlLib;
      }
      else {
        v108 = &_os_log_default;
      }
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v127 = "err == 0 ";
        *(_WORD *)&v127[8] = 2048;
        uint64_t v128 = v12;
        *(_WORD *)v129 = 2080;
        *(void *)&v129[2] = "";
        *(_WORD *)&v129[10] = 2080;
        *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v129[20] = 1024;
        *(_DWORD *)&v129[22] = 353;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      int v26 = __osLogPearlLib;
    }
    else {
      int v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v127 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  __int16 v27 = +[NSFileManager defaultManager];
  unsigned __int8 v28 = [(NSFileManager *)v27 fileExistsAtPath:v17];

  if (v28) {
    goto LABEL_37;
  }
  NSFileAttributeKey v124 = NSFilePosixPermissions;
  v125 = &off_100060870;
  v29 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
  v30 = +[NSFileManager defaultManager];
  uint64_t v12 = [(NSFileManager *)v30 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:v29 error:0] ^ 1;

  if (v12)
  {
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v109 = __osLogPearlLib;
    }
    else {
      v109 = &_os_log_default;
    }
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = v12;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 362;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    uint64_t v31 = 0;
    v119 = 0;
    v120 = 0;
    v114 = 0;
    v32 = 0;
    v33 = 0;
    id v116 = 0;
    v34 = 0;
    p_opt_inst_meths = &OBJC_PROTOCOL___CoreRepairPreflightProtocol.opt_inst_meths;
    v110 = v11;
    while (1)
    {
      v36 = &v11[3 * v31];
      int v37 = v36[1];
      v115 = (unsigned int *)(++v36 + 1);
      v117 = v36;
      v113 = (unsigned int *)(v36 + 2);
      fprintf(__stderrp, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v31, v37, v36[1], v36[2]);
      if (qword_10006E908 != -1) {
        dispatch_once(&qword_10006E908, &stru_100058D98);
      }
      int v121 = v31;
      if (__osLogPearlLib) {
        v38 = __osLogPearlLib;
      }
      else {
        v38 = &_os_log_default;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = *v117;
        unsigned int v40 = *v115;
        int v41 = *v113;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v127 = v31;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v39;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v40;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      uint64_t v42 = *v117;
      if (v42 <= 3) {
        v114 = off_100058DB8[v42];
      }
      id v43 = +[NSMutableDictionary dictionary];

      if (!v43)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        v93 = v32;
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        if (__osLogPearlLib) {
          v94 = __osLogPearlLib;
        }
        else {
          v94 = &_os_log_default;
        }
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "setDictionary";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 383;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        __int16 v11 = v110;
        v77 = v119;
        v32 = v93;
        v76 = v33;
        goto LABEL_79;
      }
      uint64_t v111 = v31;
      id v116 = v43;
      [v43 setObject:&off_100060888 forKeyedSubscript:@"FormatDR"];
      v44 = +[NSString stringWithFormat:@"%@/reference-%@.plist", v17, v114];

      if (!v44)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        v77 = v119;
        v95 = v32;
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        if (__osLogPearlLib) {
          v96 = __osLogPearlLib;
        }
        else {
          v96 = &_os_log_default;
        }
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "dictFileName";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 388;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        v76 = (NSString *)v43;
        __int16 v11 = v110;
        v32 = v95;
        goto LABEL_79;
      }
      v112 = v44;
      if (*v115) {
        break;
      }
LABEL_68:
      unsigned __int8 v69 = [v116 writeToFile:v112 atomically:0];
      v70 = __stderrp;
      if ((v69 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        v97 = v32;
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        v77 = v119;
        if (__osLogPearlLib) {
          v98 = __osLogPearlLib;
        }
        else {
          v98 = &_os_log_default;
        }
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 1;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 438;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        uint64_t v12 = 1;
        __int16 v11 = v110;
        v32 = v97;
        v76 = v112;
        goto LABEL_79;
      }
      v33 = v112;
      fprintf(v70, "Reference set dictionary written to %s\n", [(NSString *)v33 UTF8String]);
      if (qword_10006E908 != -1) {
        dispatch_once(&qword_10006E908, &stru_100058D98);
      }
      __int16 v11 = v110;
      if (__osLogPearlLib) {
        v71 = __osLogPearlLib;
      }
      else {
        v71 = &_os_log_default;
      }
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = v33;
        v73 = v71;
        v74 = [(NSString *)v72 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)v127 = v74;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);
      }
      uint64_t v31 = v111 + 1;
      if (v111 + 1 >= (unint64_t)*v110)
      {

        uint64_t v12 = 0;
        v76 = v33;
        v77 = v119;
LABEL_79:

        v75 = v120;
        goto LABEL_80;
      }
    }
    unsigned int v45 = 0;
    while (1)
    {
      v122[0] = v121;
      v122[1] = v45;
      size_t v123 = *v113 + 524;
      v46 = (unsigned int *)calloc(v123, 1uLL);
      if (!v46) {
        break;
      }
      v47 = v46;
      uint64_t v48 = sub_1000159F0(*((_DWORD *)p_opt_inst_meths + 576), 46, 0, v122, 8uLL, v46, &v123);
      if (v48)
      {
        uint64_t v12 = v48;
        v81 = v34;
        uint64_t v82 = (int)v48;
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v48, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        v118 = v32;
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        if (__osLogPearlLib) {
          v83 = __osLogPearlLib;
        }
        else {
          v83 = &_os_log_default;
        }
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = v82;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 403;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v47) - 32) <= 0xFFFFFFE0)
      {
        v81 = v34;
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        v118 = v32;
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        if (__osLogPearlLib) {
          v84 = __osLogPearlLib;
        }
        else {
          v84 = &_os_log_default;
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 406;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
LABEL_104:
        v85 = v110;
        v50 = v81;
LABEL_121:
        v53 = v120;
LABEL_122:
        free(v85);
        free(v47);

        v78 = v119;
        goto LABEL_123;
      }
      v49 = +[NSString stringWithUTF8String:__str];

      if (!v49)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        v118 = v32;
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        v85 = v110;
        if (__osLogPearlLib) {
          v86 = __osLogPearlLib;
        }
        else {
          v86 = &_os_log_default;
        }
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "tempString";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 409;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v50 = 0;
        uint64_t v12 = 261;
        p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CoreRepairPreflightProtocol + 40);
        goto LABEL_121;
      }
      v50 = v49;
      v51 = +[NSString stringWithFormat:@"reference-%@__T_%@.bin", v114, v49];

      if (!v51)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        v85 = v110;
        if (__osLogPearlLib) {
          v87 = __osLogPearlLib;
        }
        else {
          v87 = &_os_log_default;
        }
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "refFileName";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 412;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v118 = 0;
        uint64_t v12 = 261;
        goto LABEL_121;
      }
      v52 = v51;
      v53 = +[NSString stringWithFormat:@"%@/%@", v17, v51];

      v118 = v52;
      if (!v53)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        if (__osLogPearlLib) {
          v90 = __osLogPearlLib;
        }
        else {
          v90 = &_os_log_default;
        }
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "refPath";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 415;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v53 = 0;
        uint64_t v12 = 261;
        v85 = v110;
        goto LABEL_122;
      }
      v54 = v17;
      [v116 setObject:v52 forKeyedSubscript:v50];
      v55 = +[NSData dataWithBytesNoCopy:v47 + 3 length:v47[2] freeWhenDone:0];

      if (!v55)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        uint64_t v17 = v54;
        if (__osLogPearlLib) {
          v91 = __osLogPearlLib;
        }
        else {
          v91 = &_os_log_default;
        }
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "refFrameData";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 423;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v119 = 0;
        uint64_t v12 = 261;
        v85 = v110;
        goto LABEL_122;
      }
      v56 = v50;
      v119 = v55;
      unsigned __int8 v57 = [(NSData *)v55 writeToFile:v53 atomically:0];
      v58 = __stderrp;
      if ((v57 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (qword_10006E908 != -1) {
          dispatch_once(&qword_10006E908, &stru_100058D98);
        }
        uint64_t v17 = v54;
        if (__osLogPearlLib) {
          v92 = __osLogPearlLib;
        }
        else {
          v92 = &_os_log_default;
        }
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v12 = 1;
          uint64_t v128 = 1;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 426;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          uint64_t v12 = 1;
        }
        v85 = v110;
        goto LABEL_122;
      }
      double v59 = *(double *)v47;
      unsigned int v60 = v47[2];
      int v61 = *v117;
      v120 = v53;
      fprintf(v58, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v121, v45, v60, v61, v59, [(NSString *)v120 UTF8String]);
      if (qword_10006E908 != -1) {
        dispatch_once(&qword_10006E908, &stru_100058D98);
      }
      if (__osLogPearlLib) {
        v62 = __osLogPearlLib;
      }
      else {
        v62 = &_os_log_default;
      }
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v63 = v47[2];
        int v64 = *v117;
        double v65 = *(double *)v47;
        v66 = v120;
        v67 = v62;
        v68 = [(NSString *)v66 UTF8String];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v127 = v121;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v45;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v63;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v64;
        *(_WORD *)&v129[4] = 2048;
        *(double *)&v129[6] = v65;
        p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CoreRepairPreflightProtocol + 40);
        *(_WORD *)&v129[14] = 2080;
        *(void *)&v129[16] = v68;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);
      }
      free(v47);
      ++v45;
      uint64_t v17 = v54;
      v34 = v56;
      v32 = v118;
      if (v45 >= *v115) {
        goto LABEL_68;
      }
    }
    fprintf(__stderrp, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    v79 = v32;
    if (qword_10006E908 != -1) {
      dispatch_once(&qword_10006E908, &stru_100058D98);
    }
    if (__osLogPearlLib) {
      v80 = __osLogPearlLib;
    }
    else {
      v80 = &_os_log_default;
    }
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "refFrame";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = 0;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 400;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v110);

    uint64_t v12 = 260;
  }
  else
  {
    v75 = 0;
    v32 = 0;
    v34 = 0;
    v77 = 0;
    uint64_t v12 = 0;
    p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CoreRepairPreflightProtocol + 40);
LABEL_80:
    free(v11);

    v78 = v77;
LABEL_123:
  }
LABEL_124:
  io_connect_t v88 = *((_DWORD *)p_opt_inst_meths + 576);
  if (v88)
  {
    IOServiceClose(v88);
    *((_DWORD *)p_opt_inst_meths + 576) = 0;
  }
  return v12;
}

void sub_100017DF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  io_object_t v2 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v1;

  uint64_t v3 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017E7C();
    }
    uint64_t v3 = (void *)__osLogPearlLib;
  }

  objc_storeStrong((id *)&__osLogPearlLibTrace, v3);
}

void sub_100017E7C()
{
  *(_WORD *)CFDictionaryRef v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

uint64_t AMAuthInstallCreate(const __CFAllocator *a1)
{
  pthread_once(&stru_10006E2D0, (void (*)(void))sub_1000189A8);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable || (CFURLRef cf = CFURLCreateWithString(a1, @"https://gs.apple.com:443/", 0)) == 0)
  {
    uint64_t v11 = 0;
    CFURLRef cf = 0;
LABEL_21:
    CFURLRef v19 = 0;
LABEL_23:
    CFURLRef v18 = 0;
LABEL_25:
    CFMutableDictionaryRef v17 = 0;
    CFMutableDictionaryRef v2 = 0;
LABEL_26:
    CFMutableDictionaryRef v3 = 0;
LABEL_27:
    CFMutableDictionaryRef v4 = 0;
LABEL_28:
    CFMutableDictionaryRef v5 = 0;
LABEL_29:
    CFMutableDictionaryRef v6 = 0;
LABEL_30:
    CFMutableDictionaryRef v7 = 0;
LABEL_31:
    CFMutableDictionaryRef v8 = 0;
LABEL_32:
    CFMutableDictionaryRef v9 = 0;
    goto LABEL_18;
  }
  CFURLRef v19 = CFURLCreateWithString(a1, @"http://vega-dr.apple.com:8080/vegads/fuser", 0);
  if (!v19)
  {
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  CFURLRef v18 = CFURLCreateWithString(a1, @"http://treecko-dr.apple.com:8080/TREECKO/controller", 0);
  if (!v18)
  {
    uint64_t v11 = 0;
    goto LABEL_23;
  }
  CFMutableDictionaryRef v17 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v17)
  {
    uint64_t v11 = 0;
    goto LABEL_25;
  }
  CFMutableDictionaryRef v2 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v2)
  {
    uint64_t v11 = 0;
    goto LABEL_26;
  }
  CFMutableDictionaryRef v3 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v3)
  {
    uint64_t v11 = 0;
    goto LABEL_27;
  }
  CFMutableDictionaryRef v4 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v4)
  {
    uint64_t v11 = 0;
    goto LABEL_28;
  }
  CFMutableDictionaryRef v5 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v5)
  {
    uint64_t v11 = 0;
    goto LABEL_29;
  }
  CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v6)
  {
    uint64_t v11 = 0;
    goto LABEL_30;
  }
  CFMutableDictionaryRef v7 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_31;
  }
  CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v8)
  {
    uint64_t v11 = 0;
    goto LABEL_32;
  }
  CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v9)
  {
    uint64_t Instance = _CFRuntimeCreateInstance();
    uint64_t v11 = Instance;
    if (Instance)
    {
      *(_OWORD *)(Instance + 496) = 0u;
      *(_OWORD *)(Instance + 512) = 0u;
      *(_OWORD *)(Instance + 464) = 0u;
      *(_OWORD *)(Instance + 480) = 0u;
      *(_OWORD *)(Instance + 432) = 0u;
      *(_OWORD *)(Instance + 448) = 0u;
      *(_OWORD *)(Instance + 400) = 0u;
      *(_OWORD *)(Instance + 416) = 0u;
      *(_OWORD *)(Instance + 368) = 0u;
      *(_OWORD *)(Instance + 384) = 0u;
      *(_OWORD *)(Instance + 336) = 0u;
      *(_OWORD *)(Instance + 352) = 0u;
      *(_OWORD *)(Instance + 304) = 0u;
      *(_OWORD *)(Instance + 320) = 0u;
      *(_OWORD *)(Instance + 272) = 0u;
      *(_OWORD *)(Instance + 288) = 0u;
      *(_OWORD *)(Instance + 240) = 0u;
      *(_OWORD *)(Instance + 256) = 0u;
      *(_OWORD *)(Instance + 208) = 0u;
      *(_OWORD *)(Instance + 224) = 0u;
      *(_OWORD *)(Instance + 176) = 0u;
      *(_OWORD *)(Instance + 192) = 0u;
      *(_OWORD *)(Instance + 144) = 0u;
      *(_OWORD *)(Instance + 160) = 0u;
      *(_OWORD *)(Instance + 112) = 0u;
      *(_OWORD *)(Instance + 128) = 0u;
      *(_OWORD *)(Instance + 80) = 0u;
      *(_OWORD *)(Instance + 96) = 0u;
      *(_OWORD *)(Instance + 48) = 0u;
      *(_OWORD *)(Instance + 64) = 0u;
      *(_OWORD *)(Instance + 16) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(unsigned char *)(Instance + 520) = 0;
      *(_WORD *)(Instance + 57) = 257;
      *(void *)(Instance + 72) = CFRetain(cf);
      *(_DWORD *)(v11 + 80) = 3;
      *(void *)(v11 + 352) = CFRetain(Mutable);
      *(void *)(v11 + 376) = CFRetain(v17);
      *(void *)(v11 + 384) = CFRetain(v2);
      *(void *)(v11 + 416) = CFRetain(v3);
      *(void *)(v11 + 160) = CFRetain(v19);
      *(void *)(v11 + 296) = CFRetain(v18);
      *(void *)(v11 + 88) = @"ApImg4Ticket";
      *(void *)(v11 + 200) = CFRetain(v4);
      *(void *)(v11 + 208) = CFRetain(v5);
      *(void *)(v11 + 216) = CFRetain(v6);
      uint64_t v12 = calloc(1uLL, 0x30uLL);
      *(void *)(v11 + 128) = v12;
      if (v12)
      {
        CFTypeRef v13 = CFRetain(v7);
        uint64_t v14 = *(void *)(v11 + 128);
        *(void *)uint64_t v14 = v13;
        *(void *)(v14 + 40) = 0;
        *(_OWORD *)(v14 + 24) = 0u;
        *(_OWORD *)(v14 + 8) = 0u;
        *(void *)(v11 + 496) = 0;
        *(unsigned char *)(v11 + 504) = 0;
        *(void *)(v11 + 440) = sub_1000184C4;
        *(void *)(v11 + 448) = sub_1000184CC;
        *(void *)(v11 + 456) = CFRetain(v8);
        *(void *)(v11 + 464) = CFRetain(v9);
        *(void *)(v11 + 488) = 0;
        *(void *)(v11 + 512) = 0;
        *(void *)(v11 + 360) = AMAuthInstallLockCreate();
      }
      else
      {
        sub_100018378(v11);
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_18:
  SafeRelease(Mutable);
  SafeRelease(cf);
  SafeRelease(v19);
  SafeRelease(v18);
  SafeRelease(v17);
  SafeRelease(v2);
  SafeRelease(v3);
  SafeRelease(0);
  SafeRelease(v4);
  SafeRelease(v5);
  SafeRelease(v6);
  SafeRelease(v7);
  SafeRelease(v8);
  SafeRelease(v9);
  return v11;
}

double sub_100018378(uint64_t a1)
{
  if (!a1) {
    sub_10003EE84();
  }
  if (!*(unsigned char *)(a1 + 520))
  {
    *(unsigned char *)(a1 + 520) = 1;
    AMAuthInstallApFinalize(a1);
    AMAuthInstallBasebandFinalize(a1, v2, v3, v4, v5, v6, v7, v8);
    AMAuthInstallBundleFinalize(a1);
    SafeRelease(*(CFTypeRef *)(a1 + 120));
    SafeRelease(*(CFTypeRef *)(a1 + 376));
    SafeRelease(*(CFTypeRef *)(a1 + 384));
    SafeRelease(*(CFTypeRef *)(a1 + 416));
    SafeRelease(*(CFTypeRef *)(a1 + 336));
    SafeRelease(*(CFTypeRef *)(a1 + 96));
    SafeRelease(*(CFTypeRef *)(a1 + 72));
    SafeRelease(*(CFTypeRef *)(a1 + 88));
    SafeRelease(*(CFTypeRef *)(a1 + 64));
    SafeRelease(*(CFTypeRef *)(a1 + 352));
    SafeRelease(*(CFTypeRef *)(a1 + 296));
    SafeRelease(*(CFTypeRef *)(a1 + 312));
    SafeRelease(*(CFTypeRef *)(a1 + 320));
    SafeRelease(*(CFTypeRef *)(a1 + 424));
    SafeRelease(*(CFTypeRef *)(a1 + 456));
    SafeRelease(*(CFTypeRef *)(a1 + 464));
    SafeRelease(*(CFTypeRef *)(a1 + 472));
    SafeRelease(*(CFTypeRef *)(a1 + 480));
    SafeRelease(*(CFTypeRef *)(a1 + 496));
    SafeRelease(*(CFTypeRef *)(a1 + 40));
    SafeRelease(*(CFTypeRef *)(a1 + 512));
    SafeRelease(*(CFTypeRef *)(a1 + 360));
    SafeRelease(*(CFTypeRef *)(a1 + 488));
    double result = 0.0;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
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
  }
  return result;
}

uint64_t sub_1000184C4()
{
  return 1;
}

uint64_t sub_1000184CC()
{
  return 1;
}

CFStringRef AMAuthInstallGetLocalizedStatusString(CFDictionaryRef *cf, int a2)
{
  int valuePtr = a2;
  if (a2 > 98)
  {
    switch(a2)
    {
      case 3500:
        CFStringRef Value = @"The signing server returned an internal error";
        break;
      case 3501:
        CFStringRef Value = @"You must authorize with the signing server before making this request";
        break;
      case 3502:
      case 3505:
      case 3506:
        goto LABEL_34;
      case 3503:
        CFStringRef Value = @"You are not authorized to make this request. Please check your device or credentials";
        break;
      case 3504:
        CFStringRef Value = @"The signing server could not find the resource requested";
        break;
      case 3507:
        CFStringRef Value = @"You must authorize with a proxy server before making this request";
        break;
      default:
        if (a2 == 99)
        {
          CFStringRef Value = @"Generic";
        }
        else if (a2 == 3194)
        {
          CFStringRef Value = @"Declined to authorize this image on this device for this user.";
        }
        else
        {
LABEL_34:
          CFStringRef Value = &stru_10005A7F8;
          if (cf)
          {
            if ((a2 - 3100) <= 0x383)
            {
              CFAllocatorRef v4 = CFGetAllocator(cf);
              CFNumberRef v5 = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
              if (v5)
              {
                CFNumberRef v6 = v5;
                CFStringRef Value = (const __CFString *)CFDictionaryGetValue(cf[44], v5);
                CFRelease(v6);
                if (!Value) {
                  AMAuthInstallLog(7, (uint64_t)"AMAuthInstallGetLocalizedStatusString", (uint64_t)"no cached text for tss error code %d", v7, v8, v9, v10, v11, valuePtr);
                }
              }
            }
          }
        }
        break;
    }
  }
  else
  {
    CFStringRef Value = @"No error";
    switch(a2)
    {
      case 0:
        return Value;
      case 1:
        CFStringRef Value = @"Bad parameter";
        break;
      case 2:
        CFStringRef Value = @"Allocation error";
        break;
      case 3:
        CFStringRef Value = @"Conversion error";
        break;
      case 4:
        CFStringRef Value = @"File error";
        break;
      case 5:
        CFStringRef Value = @"Hash error";
        break;
      case 6:
        CFStringRef Value = @"Crypto error";
        break;
      case 7:
        CFStringRef Value = @"Bad build identity";
        break;
      case 8:
        CFStringRef Value = @"Entry not found";
        break;
      case 9:
        CFStringRef Value = @"Invalid img3 object";
        break;
      case 10:
        CFStringRef Value = @"Invalid bbfw object";
        break;
      case 11:
        CFStringRef Value = @"Server not reachable";
        break;
      case 12:
        CFStringRef Value = @"Server timed out";
        break;
      case 13:
        CFStringRef Value = @"Unimplemented";
        break;
      case 14:
        CFStringRef Value = @"Internal error";
        break;
      case 15:
        CFStringRef Value = @"Invalid bbfw file";
        break;
      case 16:
        CFStringRef Value = @"Network error";
        break;
      case 17:
        CFStringRef Value = @"Bad response";
        break;
      case 18:
        CFStringRef Value = @"Fusing failed";
        break;
      case 19:
        CFStringRef Value = @"Baseband provisioning failed";
        break;
      case 20:
        CFStringRef Value = @"AppleConnect not found";
        break;
      case 21:
        CFStringRef Value = @"AppleConnect user canceled";
        break;
      case 22:
        CFStringRef Value = @"AppleConnect bad credentials";
        break;
      default:
        goto LABEL_34;
    }
  }
  return Value;
}

uint64_t AMAuthInstallSetSigningServerURL(uint64_t a1, const void *a2)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    CFNumberRef v5 = *(const void **)(a1 + 72);
    if (v5 == a2)
    {
      return 0;
    }
    else
    {
      SafeRelease(v5);
      CFTypeRef v6 = CFRetain(a2);
      uint64_t result = 0;
      *(void *)(a1 + 72) = v6;
    }
  }
  return result;
}

uint64_t AMAuthInstallSetSOCKSProxyInformation(uint64_t a1, const void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (a3)
    {
      if (a1)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          uint64_t v12 = Mutable;
          CFDictionarySetValue(Mutable, @"SOCKSProxy", a2);
          CFDictionarySetValue(v12, @"SOCKSPort", a3);
          AMAuthInstallSetSOCKSProxyDict(a1, v12, v13, v14, v15, v16, v17, v18);
          CFRelease(v12);
          return 0;
        }
        size_t v20 = "Created proxy dictionary is NULL";
      }
      else
      {
        size_t v20 = "amai is NULL";
      }
    }
    else
    {
      size_t v20 = "SOCKS proxy port is NULL";
    }
  }
  else
  {
    size_t v20 = "SOCKS proxy host is NULL";
  }
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallSetSOCKSProxyInformation", (uint64_t)v20, a4, a5, a6, a7, a8, v21);
  return 99;
}

uint64_t AMAuthInstallSetSOCKSProxyDict(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!cf)
  {
    uint64_t v13 = "SOCKS proxy dict is NULL";
LABEL_8:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallSetSOCKSProxyDict", (uint64_t)v13, a4, a5, a6, a7, a8, v14);
    return 99;
  }
  if (!a1)
  {
    uint64_t v13 = "amai is NULL";
    goto LABEL_8;
  }
  uint64_t v10 = *(const void **)(a1 + 488);
  if (v10) {
    CFRelease(v10);
  }
  CFTypeRef v11 = CFRetain(cf);
  uint64_t result = 0;
  *(void *)(a1 + 488) = v11;
  return result;
}

uint64_t sub_1000189A8()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_10006E910 = result;
  return result;
}

CFStringRef sub_1000189D0(uint64_t a1, const __CFDictionary *a2)
{
  if (!a1) {
    sub_10003EEB0();
  }
  CFAllocatorRef v4 = AMAuthInstallApCopyDescription(a1);
  CFNumberRef v5 = AMAuthInstallBasebandCopyDescription(a1);
  CFAllocatorRef v6 = CFGetAllocator((CFTypeRef)a1);
  uint64_t v7 = *(void *)(a1 + 72);
  if (*(void *)(a1 + 64)) {
    CFStringRef v8 = *(const __CFString **)(a1 + 64);
  }
  else {
    CFStringRef v8 = @"default";
  }
  if (*(unsigned char *)(a1 + 56)) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if (*(void *)(a1 + 104)) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  CFStringRef LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
  uint64_t PlatformInfoString = AMAuthInstallPlatformGetPlatformInfoString();
  CFStringRef v13 = CFStringCreateWithFormat(v6, a2, @"<AMAuthInstall %p>{ap=%@, bp=%@, UserAuth=%@, iTunes=%@, server=\"%@\", locale=%@, version=\"%@\", platform=%@}", a1, v4, v5, v10, v9, v7, v8, LibraryVersionString, PlatformInfoString);
  SafeRelease(v4);
  SafeRelease(v5);
  return v13;
}

CFStringRef sub_100018ACC(uint64_t a1)
{
  return sub_1000189D0(a1, 0);
}

uint64_t AMAuthInstallApSupportsLocalSigning(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    uint64_t v11 = *(void *)(a1 + 16);
    if (v11)
    {
      if (*(unsigned char *)(v11 + 96))
      {
        char v12 = AMAuthInstallApImg4SupportsLocalSigning(a1);
LABEL_8:
        char v13 = v12;
        uint64_t result = 0;
        *a2 = v13;
        return result;
      }
    }
    else
    {
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApIsImg4", (uint64_t)"%s: apParameters is NULL", a4, a5, a6, a7, a8, (char)"AMAuthInstallApIsImg4");
    }
    char v12 = AMAuthInstallApImg3SupportsLocalSigning();
    goto LABEL_8;
  }
  return result;
}

uint64_t AMAuthInstallApSupportsGlobalSigning(uint64_t a1, BOOL *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    uint64_t v11 = *(void *)(a1 + 16);
    if (v11)
    {
      if (*(unsigned char *)(v11 + 96))
      {
        BOOL v12 = AMAuthInstallApImg4SupportsGlobalSigning(a1);
        uint64_t result = 0;
        *a2 = v12;
        return result;
      }
    }
    else
    {
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApIsImg4", (uint64_t)"%s: apParameters is NULL", a4, a5, a6, a7, a8, (char)"AMAuthInstallApIsImg4");
    }
    return 13;
  }
  return result;
}

__CFString *AMAuthInstallApCopyDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(v2, 64);
  CFStringAppend(Mutable, @"(");
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    CFNumberRef v5 = "YES";
    if (*(unsigned char *)(a1 + 57)) {
      CFAllocatorRef v6 = "YES";
    }
    else {
      CFAllocatorRef v6 = "NO";
    }
    if (*(unsigned char *)(v4 + 20)) {
      uint64_t v7 = "YES";
    }
    else {
      uint64_t v7 = "NO";
    }
    if (*(unsigned char *)(v4 + 81)) {
      CFStringRef v8 = "YES";
    }
    else {
      CFStringRef v8 = "NO";
    }
    if (*(unsigned char *)(v4 + 72)) {
      CFStringRef v9 = "YES";
    }
    else {
      CFStringRef v9 = "NO";
    }
    if (*(unsigned char *)(v4 + 82)) {
      CFStringRef v10 = "YES";
    }
    else {
      CFStringRef v10 = "NO";
    }
    if (*(unsigned char *)(v4 + 96)) {
      uint64_t v11 = "YES";
    }
    else {
      uint64_t v11 = "NO";
    }
    if (*(void *)(v4 + 120)) {
      BOOL v12 = "YES";
    }
    else {
      BOOL v12 = "NO";
    }
    if (!*(void *)(v4 + 128)) {
      CFNumberRef v5 = "NO";
    }
    CFStringAppendFormat(Mutable, 0, @"personalize=%s %@ ecid=0x%llx, chipid=0x%x, boardid=0x%x, secDom=%d, isProduction=%s, EPRO=%s, isSecure=%s, ESEC=%s, img4=%s, demotionPolicy=%@, managedBaaCert=%s, slowRollBaaCert=%s, dpoc=%@", v6, *(void *)(v4 + 104), *(void *)v4, *(unsigned int *)(v4 + 8), *(unsigned int *)(v4 + 12), *(unsigned int *)(v4 + 16), v7, v8, v9, v10, v11, *(void *)(v4 + 88), v12, v5, *(void *)(v4 + 192));
    uint64_t v13 = *(void *)(a1 + 16);
    if (*(void *)(v13 + 24))
    {
      CFAllocatorRef v14 = CFGetAllocator((CFTypeRef)a1);
      uint64_t v15 = _CopyHexStringFromData(v14, *(CFDataRef *)(*(void *)(a1 + 16) + 24));
      CFStringAppendFormat(Mutable, 0, @", nonce=0x%@", v15);
      CFRelease(v15);
      uint64_t v13 = *(void *)(a1 + 16);
    }
    if (*(void *)(v13 + 48))
    {
      CFAllocatorRef v16 = CFGetAllocator((CFTypeRef)a1);
      uint64_t v17 = _CopyHexStringFromData(v16, *(CFDataRef *)(*(void *)(a1 + 16) + 48));
      CFStringAppendFormat(Mutable, 0, @", sepNonce=0x%@", v17);
      CFRelease(v17);
    }
  }
  CFStringAppend(Mutable, @""));
  return Mutable;
}

void AMAuthInstallApFinalize(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    SafeRelease(*(CFTypeRef *)(v2 + 24));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 32));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 48));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 56));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 88));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 104));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 120));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 128));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 136));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 160));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 168));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 176));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 184));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 16) + 192));
    SafeFree(*(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
  }
  SafeRelease(*(CFTypeRef *)(a1 + 24));
  *(void *)(a1 + 24) = 0;
}

uint64_t AMAuthInstallApRemoveInfoDict(const __CFAllocator *a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  CFDictionaryRef v3 = 0;
  uint64_t v4 = 1;
  if (theDict)
  {
    CFAllocatorRef v6 = 0;
    uint64_t v7 = 0;
    if (a3)
    {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, theDict);
      CFDictionaryRef v3 = MutableCopy;
      if (MutableCopy)
      {
        CFIndex Count = CFDictionaryGetCount(MutableCopy);
        CFAllocatorRef v6 = (const void **)malloc(8 * Count);
        CFStringRef v10 = (const void **)malloc(8 * Count);
        uint64_t v7 = v10;
        uint64_t v4 = 2;
        if (v6 && v10)
        {
          CFDictionaryGetKeysAndValues(v3, v6, v10);
          if (Count < 1)
          {
LABEL_14:
            uint64_t v4 = 0;
            *a3 = CFRetain(v3);
          }
          else
          {
            uint64_t v11 = 0;
            while (v6[v11])
            {
              BOOL v12 = v7[v11];
              if (!v12) {
                break;
              }
              CFTypeID v13 = CFGetTypeID(v12);
              if (v13 == CFDictionaryGetTypeID() && CFDictionaryGetValue((CFDictionaryRef)v7[v11], @"Info")) {
                CFDictionaryRemoveValue((CFMutableDictionaryRef)v7[v11], @"Info");
              }
              if (Count == ++v11) {
                goto LABEL_14;
              }
            }
            uint64_t v4 = 1;
          }
        }
      }
      else
      {
        CFAllocatorRef v6 = 0;
        uint64_t v7 = 0;
        uint64_t v4 = 2;
      }
    }
  }
  else
  {
    CFAllocatorRef v6 = 0;
    uint64_t v7 = 0;
  }
  SafeRelease(v3);
  SafeFree(v6);
  SafeFree(v7);
  return v4;
}

uint64_t AMAuthInstallApCreatePersonalizedResponse(uint64_t a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  int v6 = CFDictionaryContainsKey(theDict, @"Ap,LocalPolicy");
  CFTypeID v13 = 0;
  __int16 v63 = 0;
  CFTypeRef v61 = 0;
  int64_t value = 0;
  uint64_t v14 = 1;
  if (a1 && theDict && a3)
  {
    int v15 = v6;
    if (AMAuthInstallApSupportsLocalSigning(a1, (unsigned char *)&v63 + 1, v7, v8, v9, v10, v11, v12)) {
      goto LABEL_30;
    }
    uint64_t v22 = AMAuthInstallApSupportsGlobalSigning(a1, (BOOL *)&v63, v16, v17, v18, v19, v20, v21);
    if (v22 != 13)
    {
      uint64_t v14 = v22;
      if (v22) {
        goto LABEL_30;
      }
    }
    uint64_t v28 = *(void *)(a1 + 16);
    if (v28)
    {
      BOOL v29 = *(unsigned char *)(v28 + 78) != 0;
      if (HIBYTE(v63) && *(unsigned char *)(v28 + 78))
      {
        AMAuthInstallLog(6, (uint64_t)"_AMAuthInstallApCreatePersonalizedResponseInternal", (uint64_t)"Forcing server signing\n", v23, v24, v25, v26, v27, LocalizedStatusString);
        LOBYTE(v29) = 1;
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v29 = 0;
    }
    if (HIBYTE(v63) && !v29)
    {
      v30 = (unsigned char *)(a1 + 505);
      if (!*(unsigned char *)(a1 + 505)) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
LABEL_16:
    if (!v15 || !*(unsigned char *)(a1 + 505))
    {
      if ((_BYTE)v63) {
        char v39 = v29;
      }
      else {
        char v39 = 1;
      }
      if ((v39 & 1) == 0)
      {
        uint64_t v48 = (void *)CFRetain(*(CFTypeRef *)(a1 + 40));
        int64_t value = v48;
        if (v48)
        {
          v49 = v48;
          CFAllocatorRef v50 = CFGetAllocator((CFTypeRef)a1);
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v50, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFTypeID v13 = Mutable;
          if (Mutable)
          {
            CFDictionaryAddValue(Mutable, *(const void **)(a1 + 88), v49);
            *a3 = CFRetain(v13);
            AMAuthInstallLog(6, (uint64_t)"_AMAuthInstallApCreatePersonalizedResponseInternal", (uint64_t)"Using global signing", v52, v53, v54, v55, v56, LocalizedStatusString);
            uint64_t v14 = 0;
            goto LABEL_31;
          }
          goto LABEL_46;
        }
        v58 = "global ticketData is NULL";
LABEL_45:
        AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApCreatePersonalizedResponseInternal", (uint64_t)v58, v32, v33, v34, v35, v36, LocalizedStatusString);
        CFTypeID v13 = 0;
        goto LABEL_46;
      }
      CFAllocatorRef v40 = CFGetAllocator((CFTypeRef)a1);
      uint64_t v41 = AMAuthInstallApRemoveInfoDict(v40, theDict, &v61);
      if (v41)
      {
        uint64_t v14 = v41;
        double v59 = "could not remove info dicts from request";
      }
      else
      {
        uint64_t v14 = AMAuthInstallRequestSendSync(a1, v61, a3);
        if (!v14) {
          goto LABEL_30;
        }
        char LocalizedStatusString = AMAuthInstallGetLocalizedStatusString((CFDictionaryRef *)a1, v14);
        double v59 = "server request error: %@";
      }
      AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApCreatePersonalizedResponseInternal", (uint64_t)v59, v42, v43, v44, v45, v46, LocalizedStatusString);
      goto LABEL_30;
    }
    v30 = (unsigned char *)(a1 + 505);
    uint64_t v28 = *(void *)(a1 + 16);
LABEL_19:
    *(_DWORD *)(v28 + 68) = 1;
    *(_DWORD *)(v28 + 112) = 384;
LABEL_20:
    uint64_t SignedManifest = AMAuthInstallApImg4LocalCreateSignedManifest((void *)a1, theDict, 0, 0, 0, (CFTypeRef *)&value, v26, v27);
    if (!SignedManifest)
    {
      if (value)
      {
        CFAllocatorRef v37 = CFGetAllocator((CFTypeRef)a1);
        v38 = CFDictionaryCreateMutable(v37, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFTypeID v13 = v38;
        if (v38)
        {
          CFDictionaryAddValue(v38, *(const void **)(a1 + 88), value);
          uint64_t v14 = 0;
          *a3 = CFRetain(v13);
          goto LABEL_31;
        }
LABEL_46:
        uint64_t v14 = 2;
        goto LABEL_31;
      }
      v58 = "ticketData is NULL";
      goto LABEL_45;
    }
    uint64_t v14 = SignedManifest;
    if (*v30) {
      unsigned __int8 v57 = "hacktivated";
    }
    else {
      unsigned __int8 v57 = "local";
    }
    AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApCreatePersonalizedResponseInternal", (uint64_t)"failed to create a %s Img4 ticket", v32, v33, v34, v35, v36, (char)v57);
LABEL_30:
    CFTypeID v13 = 0;
  }
LABEL_31:
  SafeRelease(v13);
  SafeRelease(value);
  SafeRelease(v61);
  return v14;
}

uint64_t AMAuthInstallApImg3SupportsLocalSigning()
{
  return 0;
}

CFStringRef AMAuthInstallApImg4GetTypeForEntryName(CFStringRef theString1)
{
  uint64_t v2 = 0;
  while (CFStringCompare(theString1, off_100058E50[v2], 0))
  {
    v2 += 2;
    if (v2 == 200)
    {
      CFDictionaryRef v3 = 0;
      goto LABEL_6;
    }
  }
  CFDictionaryRef v3 = off_100058E50[v2 + 1];
LABEL_6:
  if (v3) {
    return v3;
  }
  else {
    return theString1;
  }
}

BOOL AMAuthInstallApImg4SupportsLocalSigning(uint64_t a1)
{
  BOOL result = 0;
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 16);
    if (v1)
    {
      if (*(unsigned char *)(v1 + 76)) {
        return 1;
      }
    }
  }
  return result;
}

BOOL AMAuthInstallApImg4SupportsGlobalSigning(uint64_t a1)
{
  return a1 && *(void *)(a1 + 40);
}

uint64_t AMAuthInstallApImg4GetTagAsInteger(CFStringRef theString)
{
  unsigned int v4 = 0;
  if (!theString) {
    return 0xFFFFFFFFLL;
  }
  for (CFIndex i = 0; i != 4; ++i)
  {
    if (i == CFStringGetLength(theString)) {
      break;
    }
    *((unsigned char *)&v4 + i) = CFStringGetCharacterAtIndex(theString, i);
  }
  return bswap32(v4);
}

uint64_t AMAuthInstallApImg4AddInteger32Property(uint64_t a1, const __CFString *a2, const __CFNumber *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int valuePtr = 0;
  if (!a1 || !a2 || !a3 || !DEREncoderCreate()) {
    goto LABEL_18;
  }
  int CString = CFStringGetCString(a2, buffer, 256, 0x8000100u);
  if (CString)
  {
    strlen(buffer);
    if (DEREncoderAddData())
    {
      char v29 = (char)a2;
      uint64_t v28 = "failed to add %@ string";
      goto LABEL_17;
    }
  }
  if (!CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr))
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger32Property", (uint64_t)"%s: invalid datatype", v16, v17, v18, v19, v20, (char)"AMAuthInstallApImg4AddInteger32Property");
    if (CString)
    {
      uint64_t v26 = 1;
      goto LABEL_11;
    }
LABEL_18:
    uint64_t v26 = 3;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger32Property", (uint64_t)"%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddInteger32Property");
    goto LABEL_11;
  }
  if (DEREncoderAddUInt32())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger32Property", (uint64_t)"failed to add %@ value", v21, v22, v23, v24, v25, (char)a2);
    goto LABEL_18;
  }
  AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder())
  {
    uint64_t v28 = "failed to sequence tag";
LABEL_17:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger32Property", (uint64_t)v28, v11, v12, v13, v14, v15, v29);
    goto LABEL_18;
  }
  uint64_t v26 = 0;
LABEL_11:
  DEREncoderDestroy();
  return v26;
}

uint64_t AMAuthInstallApImg4AddInteger64Property(uint64_t a1, const __CFString *a2, const __CFNumber *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t valuePtr = 0;
  if (!a1 || !a2 || !a3 || !DEREncoderCreate()) {
    goto LABEL_18;
  }
  int CString = CFStringGetCString(a2, buffer, 256, 0x8000100u);
  if (CString)
  {
    strlen(buffer);
    if (DEREncoderAddData())
    {
      char v29 = (char)a2;
      uint64_t v28 = "failed to add %@ string";
      goto LABEL_17;
    }
  }
  if (!CFNumberGetValue(a3, kCFNumberSInt64Type, &valuePtr))
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger64Property", (uint64_t)"%s: invalid datatype", v16, v17, v18, v19, v20, (char)"AMAuthInstallApImg4AddInteger64Property");
    if (CString)
    {
      uint64_t v26 = 1;
      goto LABEL_11;
    }
LABEL_18:
    uint64_t v26 = 3;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger64Property", (uint64_t)"%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddInteger64Property");
    goto LABEL_11;
  }
  if (DEREncoderAddUInt64())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger64Property", (uint64_t)"failed to add %@ value", v21, v22, v23, v24, v25, (char)a2);
    goto LABEL_18;
  }
  AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder())
  {
    uint64_t v28 = "failed to sequence tag";
LABEL_17:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddInteger64Property", (uint64_t)v28, v11, v12, v13, v14, v15, v29);
    goto LABEL_18;
  }
  uint64_t v26 = 0;
LABEL_11:
  DEREncoderDestroy();
  return v26;
}

uint64_t AMAuthInstallApImg4AddBooleanProperty(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !DEREncoderCreate()) {
    goto LABEL_14;
  }
  if (CFStringGetCString(a2, buffer, 256, 0x8000100u))
  {
    strlen(buffer);
    if (DEREncoderAddData())
    {
      char v22 = (char)a2;
      uint64_t v21 = "failed to add %@ string";
      goto LABEL_13;
    }
  }
  if (DEREncoderAddData())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddBooleanProperty", (uint64_t)"%s: failed to add data", v14, v15, v16, v17, v18, (char)"AMAuthInstallApImg4AddBooleanProperty");
LABEL_14:
    uint64_t v19 = 3;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddBooleanProperty", (uint64_t)"%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddBooleanProperty");
    goto LABEL_9;
  }
  AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder())
  {
    uint64_t v21 = "failed to sequence tag";
LABEL_13:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddBooleanProperty", (uint64_t)v21, v9, v10, v11, v12, v13, v22);
    goto LABEL_14;
  }
  uint64_t v19 = 0;
LABEL_9:
  DEREncoderDestroy();
  return v19;
}

uint64_t AMAuthInstallApImg4AddDataProperty(uint64_t a1, const __CFString *a2, const __CFData *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !a3 || !DEREncoderCreate()) {
    goto LABEL_15;
  }
  if (CFStringGetCString(a2, buffer, 256, 0x8000100u))
  {
    strlen(buffer);
    if (DEREncoderAddData())
    {
      char v23 = (char)a2;
      char v22 = "failed to add %@ string";
      goto LABEL_14;
    }
  }
  CFDataGetBytePtr(a3);
  CFDataGetLength(a3);
  if (DEREncoderAddData())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddDataProperty", (uint64_t)"failed to add %@ data", v15, v16, v17, v18, v19, (char)a2);
LABEL_15:
    uint64_t v20 = 3;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddDataProperty", (uint64_t)"%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddDataProperty");
    goto LABEL_10;
  }
  AMAuthInstallApImg4GetTagAsInteger(a2);
  if (DEREncoderAddPrivateFromEncoder())
  {
    char v22 = "failed to sequence tag";
LABEL_14:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddDataProperty", (uint64_t)v22, v10, v11, v12, v13, v14, v23);
    goto LABEL_15;
  }
  uint64_t v20 = 0;
LABEL_10:
  DEREncoderDestroy();
  return v20;
}

uint64_t AMAuthInstallApImg4AddDictionaryProperty(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !a3 || !DEREncoderCreate()) {
    goto LABEL_15;
  }
  if (CFStringGetCString(a3, buffer, 256, 0x8000100u))
  {
    strlen(buffer);
    if (DEREncoderAddData())
    {
      char v17 = (char)a3;
      uint64_t v16 = "failed to add %@ string";
      goto LABEL_14;
    }
  }
  if (DEREncoderAddSetFromEncoder())
  {
    uint64_t v16 = "failed to add set";
LABEL_14:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddDictionaryProperty", (uint64_t)v16, v9, v10, v11, v12, v13, v17);
LABEL_15:
    uint64_t v14 = 3;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4AddDictionaryProperty", (uint64_t)"%s failed to create DER file", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4AddDictionaryProperty");
    goto LABEL_10;
  }
  AMAuthInstallApImg4GetTagAsInteger(a3);
  if (DEREncoderAddPrivateFromEncoder())
  {
    uint64_t v16 = "failed to add private";
    goto LABEL_14;
  }
  uint64_t v14 = 0;
LABEL_10:
  DEREncoderDestroy();
  return v14;
}

uint64_t AMAuthInstallApImg4LocalCreateManifestBody(uint64_t a1, CFTypeRef a2, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !a3)
  {
    uint64_t v165 = 3;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateManifestBody", (uint64_t)"%s DER operation failed", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4LocalCreateManifestBody");
    if (!a3)
    {
      CFNumberRef v18 = 0;
      goto LABEL_68;
    }
    CFNumberRef v18 = 0;
LABEL_85:
    SafeRelease(*a3);
    uint64_t v165 = 3;
    goto LABEL_68;
  }
  AMAuthInstallDebugWriteObject((char *)a1, a2, @"tss-request", 2);
  uint64_t v16 = DEREncoderCreate();
  if (!v16)
  {
    CFNumberRef v18 = 0;
    goto LABEL_84;
  }
  CFAllocatorRef v17 = CFGetAllocator((CFTypeRef)a1);
  CFNumberRef v18 = CFNumberCreate(v17, kCFNumberIntType, (const void *)(*(void *)(a1 + 16) + 68));
  if (!v18) {
    goto LABEL_84;
  }
  if (AMAuthInstallApImg4AddInteger32Property(v16, @"CEPO", v18, v11, v12, v13, v14, v15)) {
    goto LABEL_84;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApChipID");
  if (Value)
  {
    CFNumberRef v20 = Value;
    CFTypeID v21 = CFGetTypeID(Value);
    if (v21 == CFNumberGetTypeID())
    {
      if (AMAuthInstallApImg4AddInteger32Property(v16, @"CHIP", v20, v22, v23, v24, v25, v26)) {
        goto LABEL_84;
      }
    }
  }
  CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApBoardID");
  if (v27)
  {
    CFNumberRef v28 = v27;
    CFTypeID v29 = CFGetTypeID(v27);
    if (v29 == CFNumberGetTypeID())
    {
      if (AMAuthInstallApImg4AddInteger32Property(v16, @"BORD", v28, v30, v31, v32, v33, v34)) {
        goto LABEL_84;
      }
    }
  }
  CFNumberRef v35 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApECID");
  if (v35 && (v36 = v35, CFTypeID v37 = CFGetTypeID(v35), v37 == CFNumberGetTypeID()))
  {
    if (AMAuthInstallApImg4AddInteger64Property(v16, @"ECID", v36, v38, v39, v40, v41, v42))
    {
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateManifestBody", (uint64_t)"failed to add ApEcid", v43, v44, v45, v46, v47, v168);
      goto LABEL_84;
    }
    char v48 = 1;
  }
  else
  {
    char v48 = 0;
  }
  CFNumberRef v49 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApSecurityDomain");
  if (v49)
  {
    CFNumberRef v50 = v49;
    CFTypeID v51 = CFGetTypeID(v49);
    if (v51 == CFNumberGetTypeID())
    {
      uint64_t v57 = AMAuthInstallApImg4AddInteger32Property(v16, @"SDOM", v50, v52, v53, v54, v55, v56);
      if (v57) {
        goto LABEL_69;
      }
    }
  }
  CFBooleanRef v58 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApProductionMode");
  uint64_t v66 = 0;
  if (v58)
  {
    CFBooleanRef v64 = v58;
    CFTypeID v65 = CFGetTypeID(v58);
    if (v65 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v64)) {
        uint64_t v66 = 1;
      }
    }
  }
  uint64_t v57 = AMAuthInstallApImg4AddBooleanProperty(v16, @"CPRO", v66, v59, v60, v61, v62, v63);
  if (v57) {
    goto LABEL_69;
  }
  CFBooleanRef v67 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApSecurityMode");
  uint64_t v75 = 0;
  if (v67)
  {
    CFBooleanRef v73 = v67;
    CFTypeID v74 = CFGetTypeID(v67);
    if (v74 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v73)) {
        uint64_t v75 = 1;
      }
    }
  }
  uint64_t v57 = AMAuthInstallApImg4AddBooleanProperty(v16, @"CSEC", v75, v68, v69, v70, v71, v72);
  if (v57) {
    goto LABEL_69;
  }
  CFDataRef v76 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApLocalNonceHash");
  if (v76)
  {
    CFDataRef v77 = v76;
    CFTypeID v78 = CFGetTypeID(v76);
    if (v78 == CFDataGetTypeID())
    {
      uint64_t v57 = AMAuthInstallApImg4AddDataProperty(v16, @"LNCH", v77, v79, v80, v81, v82, v83);
      if (v57) {
        goto LABEL_69;
      }
    }
  }
  CFDataRef v84 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApNonce");
  if (v84)
  {
    CFDataRef v85 = v84;
    CFTypeID v86 = CFGetTypeID(v84);
    if (v86 == CFDataGetTypeID())
    {
      uint64_t v57 = AMAuthInstallApImg4AddDataProperty(v16, @"BNCH", v85, v87, v88, v89, v90, v91);
      if (v57) {
        goto LABEL_69;
      }
    }
  }
  CFDataRef v92 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"SepNonce");
  if (v92)
  {
    CFDataRef v93 = v92;
    CFTypeID v94 = CFGetTypeID(v92);
    if (v94 == CFDataGetTypeID())
    {
      uint64_t v57 = AMAuthInstallApImg4AddDataProperty(v16, @"snon", v93, v95, v96, v97, v98, v99);
      if (v57) {
        goto LABEL_69;
      }
    }
  }
  CFBooleanRef v100 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, @"ApAllowMixAndMatch");
  if (v100)
  {
    CFBooleanRef v101 = v100;
    CFTypeID v102 = CFGetTypeID(v100);
    if (v102 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v101))
      {
        uint64_t v57 = AMAuthInstallApImg4AddBooleanProperty(v16, @"AMNM", 1, v103, v104, v105, v106, v107);
        if (v57) {
          goto LABEL_69;
        }
      }
    }
  }
  CFDataRef v108 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"Ap,NextStageIM4MHash");
  if (v108)
  {
    CFDataRef v109 = v108;
    CFTypeID v110 = CFGetTypeID(v108);
    if (v110 == CFDataGetTypeID())
    {
      uint64_t v57 = AMAuthInstallApImg4AddDataProperty(v16, @"nsih", v109, v111, v112, v113, v114, v115);
      if (v57) {
        goto LABEL_69;
      }
    }
  }
  CFDataRef v116 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"Ap,RecoveryOSPolicyNonceHash");
  if (v116)
  {
    CFDataRef v117 = v116;
    CFTypeID v118 = CFGetTypeID(v116);
    if (v118 == CFDataGetTypeID())
    {
      uint64_t v57 = AMAuthInstallApImg4AddDataProperty(v16, @"ronh", v117, v119, v120, v121, v122, v123);
      if (v57) {
        goto LABEL_69;
      }
    }
  }
  CFDataRef v124 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"Ap,VolumeUUID");
  if (v124)
  {
    CFDataRef v125 = v124;
    CFTypeID v126 = CFGetTypeID(v124);
    if (v126 == CFDataGetTypeID())
    {
      uint64_t v57 = AMAuthInstallApImg4AddDataProperty(v16, @"vuid", v125, v127, v128, v129, v130, v131);
      if (v57) {
        goto LABEL_69;
      }
    }
  }
  CFBooleanRef v132 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a2, @"Ap,LocalBoot");
  if (v132)
  {
    CFBooleanRef v133 = v132;
    CFTypeID v134 = CFGetTypeID(v132);
    if (v134 == CFBooleanGetTypeID())
    {
      uint64_t v135 = CFBooleanGetValue(v133);
      uint64_t v57 = AMAuthInstallApImg4AddBooleanProperty(v16, @"lobo", v135, v136, v137, v138, v139, v140);
      if (v57)
      {
LABEL_69:
        uint64_t v165 = v57;
        goto LABEL_79;
      }
    }
  }
  uint64_t v141 = DEREncoderCreate();
  if (!v141) {
    goto LABEL_74;
  }
  uint64_t v142 = AMAuthInstallApImg4AddDictionaryProperty(v16, v141, @"MANP", v11, v12, v13, v14, v15);
  if (v142)
  {
    uint64_t v165 = v142;
    goto LABEL_79;
  }
  CFAllocatorRef v143 = CFGetAllocator((CFTypeRef)a1);
  uint64_t v149 = AMAuthInstallApImg4LocalAddImages(v143, (CFDictionaryRef)a2, v141, v144, v145, v146, v147, v148);
  if (v149)
  {
    uint64_t v165 = v149;
    v167 = "failed to add img objects to the manifest body";
LABEL_78:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateManifestBody", (uint64_t)v167, v150, v151, v152, v153, v154, v168);
    goto LABEL_79;
  }
  uint64_t v155 = DEREncoderCreate();
  if (!v155)
  {
LABEL_74:
    uint64_t v165 = 2;
    goto LABEL_79;
  }
  uint64_t v156 = AMAuthInstallApImg4AddDictionaryProperty(v141, v155, @"MANB", v11, v12, v13, v14, v15);
  if (v156)
  {
    uint64_t v165 = v156;
    v167 = "failed to create the signed section";
    goto LABEL_78;
  }
  if (!DEREncoderCreate()) {
    goto LABEL_74;
  }
  uint64_t v157 = DEREncoderAddSetFromEncoder();
  if (v157)
  {
    uint64_t v165 = v157;
LABEL_79:
    if (v48) {
      goto LABEL_68;
    }
    goto LABEL_84;
  }
  if (DEREncoderCreateEncodedBuffer())
  {
LABEL_84:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateManifestBody", (uint64_t)"%s DER operation failed", v11, v12, v13, v14, v15, (char)"AMAuthInstallApImg4LocalCreateManifestBody");
    goto LABEL_85;
  }
  CFAllocatorRef v158 = CFGetAllocator((CFTypeRef)a1);
  CFDataRef v159 = CFDataCreate(v158, 0, 0);
  *a3 = v159;
  if (v159)
  {
    uint64_t v165 = 0;
  }
  else
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateManifestBody", (uint64_t)"failed to create manifest data", v160, v161, v162, v163, v164, v168);
    uint64_t v165 = 2;
  }
LABEL_68:
  SafeFree(0);
  DEREncoderDestroy();
  DEREncoderDestroy();
  DEREncoderDestroy();
  DEREncoderDestroy();
  SafeRelease(v18);
  return v165;
}

uint64_t AMAuthInstallApImg4LocalAddImages(const __CFAllocator *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!theDict)
  {
    CFNumberRef v35 = "requestDict cannot be NULL";
LABEL_23:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImages", (uint64_t)v35, a4, a5, a6, a7, a8, v36);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    CFArrayRef Mutable = 0;
LABEL_24:
    uint64_t v33 = 1;
    goto LABEL_18;
  }
  if (!a3)
  {
    CFNumberRef v35 = "dstEncoder cannot be NULL";
    goto LABEL_23;
  }
  CFIndex Count = CFDictionaryGetCount(theDict);
  uint64_t v12 = (const void **)malloc(8 * Count);
  uint64_t v13 = (const void **)malloc(8 * Count);
  CFDictionaryGetKeysAndValues(theDict, v12, v13);
  CFArrayRef Mutable = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    uint64_t v33 = 2;
    goto LABEL_18;
  }
  if (Count >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      CFStringRef v16 = (const __CFString *)v12[v15];
      if (!v16) {
        goto LABEL_24;
      }
      CFAllocatorRef v17 = v13[v15];
      CFTypeID v18 = CFGetTypeID(v12[v15]);
      if (v18 != CFStringGetTypeID() || v17 == 0) {
        goto LABEL_24;
      }
      CFTypeID v20 = CFGetTypeID(v17);
      if (v20 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryGetValue((CFDictionaryRef)v17, @"Digest"))
        {
          v37.length = CFArrayGetCount(Mutable);
          v37.location = 0;
          if (CFArrayGetFirstIndexOfValue(Mutable, v37, v16) == -1)
          {
            CFArrayAppendValue(Mutable, v16);
            CFStringRef TypeForEntryName = AMAuthInstallApImg4GetTypeForEntryName(v16);
            if (!TypeForEntryName)
            {
              AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImages", (uint64_t)"did not find a matching tag for requestTag %@", v22, v23, v24, v25, v26, (char)v16);
              goto LABEL_24;
            }
            uint64_t v27 = AMAuthInstallApImg4LocalAddImageProperties((uint64_t)TypeForEntryName, a3, TypeForEntryName, (const __CFDictionary *)v17, v23, v24, v25, v26);
            if (v27)
            {
              uint64_t v33 = v27;
              AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImages", (uint64_t)"failed to add %@ image to the ticket body", v28, v29, v30, v31, v32, (char)v16);
              goto LABEL_18;
            }
          }
        }
      }
    }
    while (Count != ++v15);
  }
  uint64_t v33 = 0;
LABEL_18:
  SafeFree(v12);
  SafeFree(v13);
  SafeRelease(Mutable);
  return v33;
}

CFDataRef AMAuthInstallApImg4LocalCreateEncodedTag(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedTag", (uint64_t)"%s: tagStr is NULL", a4, a5, a6, a7, a8, (char)"AMAuthInstallApImg4LocalCreateEncodedTag");
    goto LABEL_8;
  }
  char v8 = (char)a1;
  if (!CFStringGetCString(a1, &length[4], 256, 0x8000100u))
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedTag", (uint64_t)"%s: cannot convert tagStr", v9, v10, v11, v12, v13, (char)"AMAuthInstallApImg4LocalCreateEncodedTag");
    goto LABEL_8;
  }
  if (!DEREncoderCreate())
  {
LABEL_8:
    SafeRelease(0);
    CFDataRef v24 = 0;
    goto LABEL_9;
  }
  strlen(&length[4]);
  if (DEREncoderAddData())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedTag", (uint64_t)"failed to add %@ string", v14, v15, v16, v17, v18, v8);
    goto LABEL_8;
  }
  if (DEREncoderCreateEncodedBuffer())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedTag", (uint64_t)"%s: failed to create buffer", v19, v20, v21, v22, v23, (char)"AMAuthInstallApImg4LocalCreateEncodedTag");
    goto LABEL_8;
  }
  CFDataRef v24 = CFDataCreate(0, 0, 0);
LABEL_9:
  SafeFree(0);
  DEREncoderDestroy();
  return v24;
}

CFDataRef AMAuthInstallApImg4LocalCreateEncodedVersion()
{
  if (!DEREncoderCreate()) {
    goto LABEL_9;
  }
  if (DEREncoderAddUInt32())
  {
    uint64_t v7 = "failed to add manifest version";
LABEL_8:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedVersion", (uint64_t)v7, v0, v1, v2, v3, v4, (char)v8);
LABEL_9:
    SafeRelease(0);
    CFDataRef v5 = 0;
    goto LABEL_5;
  }
  if (DEREncoderCreateEncodedBuffer())
  {
    char v8 = "AMAuthInstallApImg4LocalCreateEncodedVersion";
    uint64_t v7 = "%s: failed to create buffer";
    goto LABEL_8;
  }
  CFDataRef v5 = CFDataCreate(0, 0, 0);
LABEL_5:
  SafeFree(0);
  DEREncoderDestroy();
  return v5;
}

CFDataRef AMAuthInstallApImg4LocalCreateEncodedData(const __CFData *a1)
{
  if (!DEREncoderCreate()) {
    goto LABEL_8;
  }
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  if (DEREncoderAddData())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedData", (uint64_t)"%s: failed to encode data", v2, v3, v4, v5, v6, (char)"AMAuthInstallApImg4LocalCreateEncodedData");
LABEL_8:
    SafeRelease(0);
    CFDataRef v12 = 0;
    goto LABEL_5;
  }
  if (DEREncoderCreateEncodedBuffer())
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedData", (uint64_t)"%s: failed to create buffer", v7, v8, v9, v10, v11, (char)"AMAuthInstallApImg4LocalCreateEncodedData");
    goto LABEL_8;
  }
  CFDataRef v12 = CFDataCreate(0, 0, 0);
LABEL_5:
  SafeFree(0);
  DEREncoderDestroy();
  return v12;
}

uint64_t _AMAuthInstallApImg4LocalCreateSignedManifest(void *a1, const void *a2, const void *a3, const void *a4, const void *a5, CFTypeRef *a6, uint64_t a7, uint64_t a8)
{
  LODWORD(length) = 0;
  CFTypeRef v90 = 0;
  CFDataRef theData = 0;
  CFDataRef v89 = 0;
  if (!a1 || !a2 || !a6)
  {
    uint64_t v48 = 3;
    AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)"%s failed to create DER file", (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
    CFDataRef v58 = 0;
    CFDataRef v39 = 0;
    CFDataRef v30 = 0;
    CFArrayRef Mutable = 0;
    if (!a6) {
      goto LABEL_26;
    }
    goto LABEL_43;
  }
  int v10 = a7;
  CFAllocatorRef v15 = CFGetAllocator(a1);
  CFArrayRef Mutable = CFDataCreateMutable(v15, 0);
  if (!Mutable)
  {
    CFDataRef v30 = 0;
LABEL_48:
    CFDataRef v39 = 0;
    goto LABEL_41;
  }
  CFDataRef EncodedTag = AMAuthInstallApImg4LocalCreateEncodedTag(@"IM4M", v16, v17, v18, v19, v20, v21, v22);
  CFDataRef v30 = EncodedTag;
  if (!EncodedTag)
  {
    AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)"%s failed to encode tag", v25, v26, v27, v28, v29, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
    goto LABEL_48;
  }
  BytePtr = CFDataGetBytePtr(EncodedTag);
  CFIndex v32 = CFDataGetLength(v30);
  CFDataAppendBytes(Mutable, BytePtr, v32);
  CFDataRef EncodedVersion = AMAuthInstallApImg4LocalCreateEncodedVersion();
  CFDataRef v39 = EncodedVersion;
  if (!EncodedVersion)
  {
    AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)"%s failed to encode version", v34, v35, v36, v37, v38, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
    goto LABEL_41;
  }
  uint64_t v40 = CFDataGetBytePtr(EncodedVersion);
  CFIndex v41 = CFDataGetLength(v39);
  CFDataAppendBytes(Mutable, v40, v41);
  if (a3)
  {
    CFDataRef v47 = (const __CFData *)CFRetain(a3);
    CFDataRef theData = v47;
    uint64_t v48 = 99;
    if (v47) {
      goto LABEL_9;
    }
LABEL_13:
    uint64_t v59 = "manifest not found";
LABEL_40:
    AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)v59, v18, v19, v20, v21, v22, v87);
    goto LABEL_41;
  }
  if (AMAuthInstallApImg4LocalCreateManifestBody((uint64_t)a1, a2, (CFTypeRef *)&theData, v42, v43, v44, v45, v46))
  {
    uint64_t v59 = "failed to create unsigned manifest";
    goto LABEL_40;
  }
  uint64_t v48 = 0;
  CFDataRef v47 = theData;
  if (!theData) {
    goto LABEL_13;
  }
LABEL_9:
  CFNumberRef v49 = CFDataGetBytePtr(v47);
  CFIndex v50 = CFDataGetLength(theData);
  CFDataAppendBytes(Mutable, v49, v50);
  if (!v10)
  {
    if (!AMAuthInstallApImg4LocalRegisterKeys((uint64_t)a1, v51, v52, v53, v54, v55, v56, v57))
    {
      if (a4)
      {
        CFTypeRef v60 = CFRetain(a4);
        CFTypeRef v90 = v60;
        if (v60)
        {
          CFDataRef EncodedData = AMAuthInstallApImg4LocalCreateEncodedData((const __CFData *)v60);
          CFDataRef v58 = EncodedData;
          if (EncodedData)
          {
            CFBooleanRef v67 = CFDataGetBytePtr(EncodedData);
            CFIndex v68 = CFDataGetLength(v58);
            CFDataAppendBytes(Mutable, v67, v68);
            if (a5)
            {
              CFDataRef v69 = (const __CFData *)CFRetain(a5);
              CFDataRef v89 = v69;
              if (v69)
              {
LABEL_20:
                uint64_t v75 = CFDataGetBytePtr(v69);
                CFIndex v76 = CFDataGetLength(v89);
                CFDataAppendBytes(Mutable, v75, v76);
                uint64_t v48 = 0;
                goto LABEL_21;
              }
            }
            else
            {
              if (AMAuthInstallApImg4LocalCreateEncodedCertificateChain((uint64_t)a1, (CFTypeRef *)&v89))
              {
                CFTypeID v86 = "failed to add certificate";
                goto LABEL_53;
              }
              CFDataRef v69 = v89;
              if (v89) {
                goto LABEL_20;
              }
            }
            CFTypeID v86 = "certificate not found";
LABEL_53:
            AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)v86, v70, v71, v72, v73, v74, v87);
            goto LABEL_42;
          }
          AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)"%s failed to encode signature", v62, v63, v64, v65, v66, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
LABEL_42:
          AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)"%s failed to create DER file", v18, v19, v20, v21, v22, (char)"_AMAuthInstallApImg4LocalCreateSignedManifest");
LABEL_43:
          SafeRelease(*a6);
          *a6 = 0;
          uint64_t v48 = 3;
          goto LABEL_26;
        }
        goto LABEL_38;
      }
      int v85 = *(_DWORD *)(a1[2] + 112);
      if (v85 == 384)
      {
        CFDataGetBytePtr(theData);
        CFDataGetLength(theData);
        if (AMAuthInstallCryptoCreateRsaSignature_SHA384()) {
          goto LABEL_41;
        }
        goto LABEL_38;
      }
      if (v85 != 256)
      {
        if (v85 != 1)
        {
          int v87 = *(_DWORD *)(a1[2] + 112);
          uint64_t v59 = "Unsupported digest type: %d";
          goto LABEL_40;
        }
        CFDataGetBytePtr(theData);
        CFDataGetLength(theData);
        if (AMAuthInstallCryptoCreateRsaSignature()) {
          goto LABEL_41;
        }
        goto LABEL_38;
      }
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
      if (!AMAuthInstallCryptoCreateRsaSignature_SHA256())
      {
LABEL_38:
        uint64_t v59 = "signature not found";
        goto LABEL_40;
      }
    }
LABEL_41:
    CFDataRef v58 = 0;
    goto LABEL_42;
  }
  CFDataRef v58 = 0;
LABEL_21:
  if (!DEREncoderCreate()) {
    goto LABEL_42;
  }
  CFDataGetBytePtr(Mutable);
  CFDataGetLength(Mutable);
  if (DEREncoderAddData() || DEREncoderCreateEncodedBuffer()) {
    goto LABEL_42;
  }
  CFAllocatorRef v77 = CFGetAllocator(a1);
  CFDataRef v78 = CFDataCreate(v77, 0, length);
  *a6 = v78;
  if (!v78)
  {
    AMAuthInstallLog(3, (uint64_t)"_AMAuthInstallApImg4LocalCreateSignedManifest", (uint64_t)"failed to create manifest data", v79, v80, v81, v82, v83, v87);
    uint64_t v48 = 2;
  }
LABEL_26:
  SafeRelease(Mutable);
  SafeRelease(v30);
  SafeRelease(v39);
  SafeRelease(theData);
  SafeRelease(v90);
  SafeRelease(v58);
  SafeRelease(v89);
  SafeFree(0);
  DEREncoderDestroy();
  return v48;
}

uint64_t AMAuthInstallApImg4LocalRegisterKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 1;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v8 + 20))
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalRegisterKeys", (uint64_t)"local signing is not available for production fused devices.", a4, a5, a6, a7, a8, v26);
    return 14;
  }
  if (!*(void *)(a1 + 392))
  {
    if (*(unsigned char *)(v8 + 72) || *(_DWORD *)(v8 + 16))
    {
      if (*(unsigned char *)(v8 + 73))
      {
        int v10 = *(_DWORD *)(v8 + 8);
        if (v10 == 32784)
        {
          CFStringRef v11 = @"ap.ticket.insec.rsa4k.key.private";
        }
        else
        {
          if (v10 != 35168)
          {
            AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalRegisterKeys", (uint64_t)"unrecognized chipid: 0x%08X", a4, a5, a6, a7, a8, v10);
            return 1;
          }
          CFStringRef v11 = @"ap.ticket.insec.rsa1k.key.private";
        }
      }
      else
      {
        CFStringRef v11 = @"ap.ticket.dev.key.private";
        if (*(unsigned char *)(a1 + 505)) {
          CFStringRef v11 = @"ap.ticket.localpolicy.hacktivation.key.private";
        }
      }
    }
    else
    {
      CFStringRef v11 = @"ap.ticket.unfused.key.private";
    }
    *(void *)(a1 + 392) = v11;
  }
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 376), @"ap.ticket.dev.key.private")) {
    return 0;
  }
  int v28 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  int v27 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  int v12 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  int v13 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  int v14 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  int v15 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  int v16 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  int v17 = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  int v18 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  int v19 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  int v20 = AMAuthInstallCryptoRegisterCertFromPEMBuffer();
  uint64_t result = AMAuthInstallCryptoRegisterKeysFromPEMBuffer();
  if ((!v28 || !v27 || !v15 || !v17 || !result) && (!v12 || !v13 || !v14 || !v16 || !v18 || !v19 || !v20))
  {
    AMAuthInstallLog(6, (uint64_t)"AMAuthInstallApImg4LocalRegisterKeys", (uint64_t)"ap local signing keys available", v21, v22, v23, v24, v25, v26);
    return 0;
  }
  return result;
}

uint64_t AMAuthInstallApImg4LocalCreateEncodedCertificateChain(uint64_t a1, CFTypeRef *a2)
{
  if (!a1 || !a2)
  {
    CFArrayRef Mutable = 0;
    uint64_t v12 = 1;
    if (!a2) {
      goto LABEL_18;
    }
    goto LABEL_6;
  }
  CFAllocatorRef v4 = CFGetAllocator((CFTypeRef)a1);
  CFArrayRef Mutable = CFDataCreateMutable(v4, 0);
  if (!Mutable)
  {
    uint64_t v12 = 2;
    goto LABEL_6;
  }
  uint64_t v11 = *(void *)(a1 + 16);
  if (!*(unsigned char *)(v11 + 20))
  {
    if (!*(void *)(a1 + 400))
    {
      if (*(unsigned char *)(a1 + 505))
      {
        CFStringRef v13 = @"ap.ticket.localpolicy.hacktivation.leaf.cert";
      }
      else if (*(unsigned char *)(v11 + 72) || *(_DWORD *)(v11 + 16))
      {
        if (*(unsigned char *)(v11 + 73))
        {
          int v24 = *(_DWORD *)(v11 + 8);
          switch(v24)
          {
            case 32770:
              CFStringRef v13 = @"ap.ticket.8002.insec.cert";
              break;
            case 35168:
              if (!*(void *)(a1 + 408)) {
                *(void *)(a1 + 408) = @"ap.ticket.ca.cert";
              }
              uint64_t CertData = AMAuthInstallCryptoGetCertData();
              if (CertData) {
                goto LABEL_45;
              }
              BytePtr = CFDataGetBytePtr(0);
              CFIndex Length = CFDataGetLength(0);
              CFDataAppendBytes(Mutable, BytePtr, Length);
              CFStringRef v13 = @"ap.ticket.8960.insec.cert";
              break;
            case 32784:
              CFStringRef v13 = @"ap.ticket.8010.insec.cert";
              break;
            default:
              AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedCertificateChain", (uint64_t)"unrecognized chipid: 0x%08X", v5, v6, v7, v8, v9, v24);
              goto LABEL_38;
          }
        }
        else
        {
          CFStringRef v13 = @"ap.ticket.8960.dev.cert";
        }
      }
      else
      {
        CFStringRef v13 = @"ap.ticket.8960.unfused.cert";
      }
      *(void *)(a1 + 400) = v13;
    }
    if (!*(unsigned char *)(a1 + 505))
    {
      uint64_t v14 = *(void *)(a1 + 16);
      if (!*(unsigned char *)(v14 + 77))
      {
        int v25 = *(_DWORD *)(v14 + 8);
        if (v25 != 32770 && v25 != 35168 && v25 != 32784)
        {
          AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedCertificateChain", (uint64_t)"chipid: 0x%08X unsupported for img4 local signing", v5, v6, v7, v8, v9, v25);
LABEL_38:
          uint64_t v12 = 1;
          goto LABEL_6;
        }
      }
    }
    uint64_t CertData = AMAuthInstallCryptoGetCertData();
    if (!CertData)
    {
      int v16 = CFDataGetBytePtr(0);
      CFIndex v17 = CFDataGetLength(0);
      CFDataAppendBytes(Mutable, v16, v17);
      if (DEREncoderCreate())
      {
        CFDataGetBytePtr(Mutable);
        CFDataGetLength(Mutable);
        if (DEREncoderAddData())
        {
          uint64_t v12 = 3;
          goto LABEL_6;
        }
        if (!DEREncoderCreateEncodedBuffer())
        {
          uint64_t v12 = 0;
          *a2 = CFDataCreate(0, 0, 0);
          goto LABEL_18;
        }
        AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedCertificateChain", (uint64_t)"%s: failed to create buffer", v18, v19, v20, v21, v22, (char)"AMAuthInstallApImg4LocalCreateEncodedCertificateChain");
      }
      uint64_t v12 = 0;
      goto LABEL_18;
    }
LABEL_45:
    uint64_t v12 = CertData;
    goto LABEL_6;
  }
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalCreateEncodedCertificateChain", (uint64_t)"local signing is not available for production fused devices.", v5, v6, v7, v8, v9, v28);
  uint64_t v12 = 14;
LABEL_6:
  SafeRelease(*a2);
LABEL_18:
  SafeRelease(Mutable);
  SafeFree(0);
  DEREncoderDestroy();
  return v12;
}

uint64_t AMAuthInstallApImg4LocalCreateSignedManifest(void *a1, const void *a2, const void *a3, const void *a4, const void *a5, CFTypeRef *a6, uint64_t a7, uint64_t a8)
{
  return _AMAuthInstallApImg4LocalCreateSignedManifest(a1, a2, a3, a4, a5, a6, 0, a8);
}

uint64_t AMAuthInstallApImg4LocalAddImageProperties(uint64_t a1, uint64_t a2, const __CFString *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2)
  {
    uint64_t v104 = "toEncoder cannot be NULL";
LABEL_28:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)v104, (uint64_t)a4, a5, a6, a7, a8, v105);
    uint64_t v25 = 1;
    goto LABEL_24;
  }
  if (!a3)
  {
    uint64_t v104 = "imageTag cannot be NULL";
    goto LABEL_28;
  }
  if (!a4)
  {
    uint64_t v104 = "requestDict cannot be NULL";
    goto LABEL_28;
  }
  uint64_t v11 = DEREncoderCreate();
  if (!v11)
  {
    uint64_t v25 = 2;
    goto LABEL_24;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a4, @"Digest");
  if (Value)
  {
    CFDataRef v13 = Value;
    if (CFDataGetLength(Value) < 1)
    {
      AMAuthInstallLog(6, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"'%@' has zero length digest - skipping digest", v14, v15, v16, v17, v18, (char)a3);
    }
    else
    {
      uint64_t v19 = AMAuthInstallApImg4AddDataProperty(v11, @"DGST", v13, v14, v15, v16, v17, v18);
      if (v19)
      {
        uint64_t v25 = v19;
        AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"failed to add Digest property for '%@'", v20, v21, v22, v23, v24, (char)a3);
        goto LABEL_24;
      }
    }
  }
  CFBooleanRef v26 = (const __CFBoolean *)CFDictionaryGetValue(a4, @"Trusted");
  if (v26
    && (uint64_t v27 = CFBooleanGetValue(v26),
        uint64_t v33 = AMAuthInstallApImg4AddBooleanProperty(v11, @"EKEY", v27, v28, v29, v30, v31, v32),
        v33))
  {
    uint64_t v25 = v33;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"failed to add EKEY property for '%@'", v34, v35, v36, v37, v38, (char)a3);
  }
  else
  {
    CFBooleanRef v39 = (const __CFBoolean *)CFDictionaryGetValue(a4, @"DPRO");
    if (v39
      && (uint64_t v40 = CFBooleanGetValue(v39),
          uint64_t v46 = AMAuthInstallApImg4AddBooleanProperty(v11, @"DPRO", v40, v41, v42, v43, v44, v45),
          v46))
    {
      uint64_t v25 = v46;
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"failed to add DPRO property for '%@'", v47, v48, v49, v50, v51, (char)a3);
    }
    else
    {
      CFBooleanRef v52 = (const __CFBoolean *)CFDictionaryGetValue(a4, @"DSEC");
      if (v52
        && (uint64_t v53 = CFBooleanGetValue(v52),
            uint64_t v59 = AMAuthInstallApImg4AddBooleanProperty(v11, @"DSEC", v53, v54, v55, v56, v57, v58),
            v59))
      {
        uint64_t v25 = v59;
        AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"failed to add DSEC property for '%@'", v60, v61, v62, v63, v64, (char)a3);
      }
      else
      {
        CFBooleanRef v65 = (const __CFBoolean *)CFDictionaryGetValue(a4, @"ESEC");
        if (v65
          && (uint64_t v66 = CFBooleanGetValue(v65),
              uint64_t v72 = AMAuthInstallApImg4AddBooleanProperty(v11, @"ESEC", v66, v67, v68, v69, v70, v71),
              v72))
        {
          uint64_t v25 = v72;
          AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"failed to add ESEC property for '%@'", v73, v74, v75, v76, v77, (char)a3);
        }
        else
        {
          CFBooleanRef v78 = (const __CFBoolean *)CFDictionaryGetValue(a4, @"EPRO");
          if (v78
            && (uint64_t v79 = CFBooleanGetValue(v78),
                uint64_t v85 = AMAuthInstallApImg4AddBooleanProperty(v11, @"EPRO", v79, v80, v81, v82, v83, v84),
                v85))
          {
            uint64_t v25 = v85;
            AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"failed to add EPRO property for '%@'", v86, v87, v88, v89, v90, (char)a3);
          }
          else
          {
            CFDataRef v91 = (const __CFData *)CFDictionaryGetValue(a4, @"TBMDigests");
            if (v91
              && (uint64_t v97 = AMAuthInstallApImg4AddDataProperty(v11, @"tbms", v91, v92, v93, v94, v95, v96), v97))
            {
              uint64_t v25 = v97;
              AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"failed to add %@ property for '%@'", v92, v93, v94, v95, v96, (char)@"tbms");
            }
            else
            {
              uint64_t v25 = AMAuthInstallApImg4AddDictionaryProperty(v11, a2, a3, v92, v93, v94, v95, v96);
              if (v25) {
                AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4LocalAddImageProperties", (uint64_t)"AMAuthInstallApImg4LocalAddDictionaryProperty failed for '%@'", v98, v99, v100, v101, v102, (char)a3);
              }
            }
          }
        }
      }
    }
  }
LABEL_24:
  DEREncoderDestroy();
  return v25;
}

void _AMAuthInstallBasebandParametersFinalize(CFTypeRef *a1)
{
  if (a1)
  {
    SafeRelease(a1[2]);
    SafeRelease(a1[3]);
    SafeRelease(a1[4]);
    SafeRelease(a1[5]);
    SafeRelease(a1[8]);
    SafeRelease(a1[9]);
    SafeRelease(a1[13]);
    SafeRelease(a1[14]);
    SafeRelease(a1[15]);
    SafeRelease(a1[16]);
    SafeRelease(a1[17]);
    SafeRelease(a1[18]);
    SafeRelease(a1[19]);
    SafeRelease(a1[21]);
    free(a1);
  }
}

__CFString *AMAuthInstallBasebandCopyDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  CFArrayRef Mutable = CFStringCreateMutable(v2, 256);
  CFStringAppend(Mutable, @"(");
  if (*(unsigned char *)(a1 + 58)) {
    CFAllocatorRef v4 = "YES";
  }
  else {
    CFAllocatorRef v4 = "NO";
  }
  CFStringAppendFormat(Mutable, 0, @"personalize=%s", v4);
  if (*(void *)(a1 + 48))
  {
    CFStringAppendFormat(Mutable, 0, @", ");
    if (*(void *)(*(void *)(a1 + 48) + 16))
    {
      CFAllocatorRef v5 = CFGetAllocator((CFTypeRef)a1);
      uint64_t v6 = _CopyHexStringFromData(v5, *(CFDataRef *)(*(void *)(a1 + 48) + 16));
      if (v6)
      {
        uint64_t v7 = v6;
        CFStringAppendFormat(Mutable, 0, @"snum=0x%@, ", v6);
        CFRelease(v7);
      }
    }
    CFStringAppendFormat(Mutable, 0, @"chipid=0x%x, certid=0x%x", *(unsigned int *)(*(void *)(a1 + 48) + 4), *(unsigned int *)(*(void *)(a1 + 48) + 8));
    if (*(void *)(*(void *)(a1 + 48) + 24))
    {
      CFAllocatorRef v8 = CFGetAllocator((CFTypeRef)a1);
      uint64_t v9 = _CopyHexStringFromData(v8, *(CFDataRef *)(*(void *)(a1 + 48) + 24));
      if (v9)
      {
        int v10 = v9;
        CFStringAppendFormat(Mutable, 0, @", nonce=0x%@", v9);
        CFRelease(v10);
      }
    }
  }
  CFStringAppend(Mutable, @""));
  return Mutable;
}

uint64_t AMAuthInstallBasebandLocalSetSigningParameters(void *cf, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6)
{
  if (cf)
  {
    if (a2 && a3 && a4 || (uint64_t v12 = 1, !a2) && !a3 && !a4 && !a5 && !a6)
    {
      CFDataRef v13 = (void *)*((void *)cf + 46);
      if (v13)
      {
        AMAuthInstallReleaseRsaKeyData(*v13);
        SafeRelease(*(CFTypeRef *)(*((void *)cf + 46) + 8));
        SafeRelease(*(CFTypeRef *)(*((void *)cf + 46) + 16));
        SafeRelease(*(CFTypeRef *)(*((void *)cf + 46) + 24));
        SafeRelease(*(CFTypeRef *)(*((void *)cf + 46) + 32));
        free(*((void **)cf + 46));
        *((void *)cf + 46) = 0;
      }
      if (a2)
      {
        CFGetAllocator(cf);
        uint64_t v14 = AMAuthInstallCopyRsaKeyDataForKey();
        if (v14)
        {
          uint64_t v12 = v14;
          char LocalizedStatusString = AMAuthInstallGetLocalizedStatusString((CFDictionaryRef *)cf, v14);
          AMAuthInstallLog(3, (uint64_t)"AMAuthInstallBasebandLocalSetSigningParameters", (uint64_t)"bad local signing key: %@", v16, v17, v18, v19, v20, LocalizedStatusString);
        }
        else
        {
          uint64_t v21 = calloc(1uLL, 0x28uLL);
          *((void *)cf + 46) = v21;
          if (v21)
          {
            **((void **)cf + 46) = CFRetain(0);
            *(void *)(*((void *)cf + 46) + 8) = CFRetain(a3);
            *(void *)(*((void *)cf + 46) + 16) = CFRetain(a4);
            *(void *)(*((void *)cf + 46) + 32) = CFRetain(a6);
            uint64_t v12 = 0;
            *(void *)(*((void *)cf + 46) + 24) = SafeRetain(a5);
          }
          else
          {
            uint64_t v12 = 2;
          }
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
  SafeRelease(0);
  SafeRelease(0);
  return v12;
}

void AMAuthInstallBasebandFinalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 176))
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallBasebandFinalize", (uint64_t)"*********************************", a4, a5, a6, a7, a8, v20);
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallBasebandFinalize", (uint64_t)"* unacknowledged fusing program *", v9, v10, v11, v12, v13, v21);
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallBasebandFinalize", (uint64_t)"*********************************", v14, v15, v16, v17, v18, v22);
  }
  _AMAuthInstallBasebandParametersFinalize(*(CFTypeRef **)(a1 + 48));
  AMAuthInstallBasebandLocalSetSigningParameters((void *)a1, 0, 0, 0, 0, 0);
  SafeRelease(*(CFTypeRef *)(a1 + 160));
  SafeRelease(*(CFTypeRef *)(a1 + 168));
  SafeRelease(*(CFTypeRef *)(a1 + 176));
  SafeRelease(*(CFTypeRef *)(a1 + 192));
  SafeRelease(*(CFTypeRef *)(a1 + 200));
  SafeRelease(*(CFTypeRef *)(a1 + 208));
  SafeRelease(*(CFTypeRef *)(a1 + 216));
  SafeRelease(*(CFTypeRef *)(a1 + 136));
  SafeRelease(*(CFTypeRef *)(a1 + 240));
  SafeRelease(*(CFTypeRef *)(a1 + 264));
  SafeRelease(*(CFTypeRef *)(a1 + 248));
  SafeRelease(*(CFTypeRef *)(a1 + 232));
  SafeRelease(*(CFTypeRef *)(a1 + 272));
  uint64_t v19 = *(const void **)(a1 + 280);

  SafeRelease(v19);
}

void AMAuthInstallBundleFinalize(uint64_t a1)
{
  uint64_t v1 = *(CFTypeRef **)(a1 + 128);
  if (v1)
  {
    SafeRelease(*v1);
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 128) + 8));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 128) + 16));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 128) + 24));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 128) + 32));
    SafeRelease(*(CFTypeRef *)(*(void *)(a1 + 128) + 40));
    SafeFree(*(void **)(a1 + 128));
    *(void *)(a1 + 128) = 0;
  }
}

uint64_t AMAuthInstallCopyRsaKeyDataForKey()
{
  return 13;
}

uint64_t AMAuthInstallCryptoRegisterKeysFromPEMBuffer()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateRsaSignature()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateRsaSignature_SHA256()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateRsaSignature_SHA384()
{
  return 13;
}

uint64_t AMAuthInstallCryptoCreateDigestForData(const __CFAllocator *a1, const __CFData *a2, CFTypeRef *a3)
{
  memset(&v12, 0, sizeof(v12));
  CFArrayRef Mutable = CFDataCreateMutable(a1, 20);
  uint64_t v6 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, 20);
    CC_SHA1_Init(&v12);
    BytePtr = CFDataGetBytePtr(a2);
    CC_LONG Length = CFDataGetLength(a2);
    CC_SHA1_Update(&v12, BytePtr, Length);
    MutableBytePtr = CFDataGetMutableBytePtr(v6);
    CC_SHA1_Final(MutableBytePtr, &v12);
    uint64_t v10 = 0;
    *a3 = CFRetain(v6);
  }
  else
  {
    uint64_t v10 = 2;
  }
  SafeRelease(v6);
  return v10;
}

uint64_t AMAuthInstallCryptoGetCertData()
{
  return 13;
}

uint64_t AMAuthInstallCryptoRegisterCertFromPEMBuffer()
{
  return 13;
}

uint64_t AMAuthInstallHttpMessageSendSyncNew(CFAllocatorRef allocator, int a2, int a3, int a4, CFDictionaryRef theDict, double a6)
{
  double valuePtr = a6;
  if (theDict)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(allocator, Count, theDict);
    if (CFDictionaryContainsKey(MutableCopy, kAMSupportHttpOptionSocksProxySettings)) {
      AMAuthInstallLog(7, (uint64_t)"AMAuthInstallHttpMessageSendSyncNew", (uint64_t)"Options dictionary contains proxy information. Will attempt to use a proxy.", v10, v11, v12, v13, v14, v33);
    }
    if (CFDictionaryContainsKey(MutableCopy, kAMSupportHttpOptionTrustedServerCAs)) {
      AMAuthInstallLog(7, (uint64_t)"AMAuthInstallHttpMessageSendSyncNew", (uint64_t)"Options dictionary contains trusted server CAs. Will authenticate SSL against CAs.", v15, v16, v17, v18, v19, v33);
    }
  }
  else
  {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(allocator, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  if (!MutableCopy)
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallHttpMessageSendSyncNew", (uint64_t)"CFDictionaryCreateMutable failed to allocate", v15, v16, v17, v18, v19, v33);
LABEL_13:
    uint64_t v32 = 2;
    goto LABEL_10;
  }
  CFNumberRef v25 = CFNumberCreate(allocator, kCFNumberDoubleType, &valuePtr);
  if (!v25)
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallHttpMessageSendSyncNew", (uint64_t)"timeout failed to allocate", v20, v21, v22, v23, v24, v33);
    goto LABEL_13;
  }
  CFDictionarySetValue(MutableCopy, kAMSupportHttpOptionTimeout, v25);
  AMSupportHttpSendSync();
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallHttpMessageSendSyncNew", (uint64_t)"HTTP request provided no response data", v27, v28, v29, v30, v31, v33);
  uint64_t v32 = 16;
LABEL_10:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v32;
}

uint64_t AMAuthInstallLockCreate()
{
  pthread_once(&stru_10006E2E0, (void (*)(void))sub_10001BFB4);
  uint64_t result = _CFRuntimeCreateInstance();
  if (result) {
    *(_DWORD *)(result + 16) = 0;
  }
  return result;
}

uint64_t sub_10001BFB4()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_10006E918 = result;
  return result;
}

void (*AMAuthInstallLogSetHandler(void (*result)(int a1, uint64_t a2)))(int a1, uint64_t a2)
{
  if (result) {
    uint64_t v1 = result;
  }
  else {
    uint64_t v1 = sub_10001C000;
  }
  off_10006E2F0 = (uint64_t (*)(void, void))v1;
  return result;
}

void sub_10001C000(int a1, uint64_t a2)
{
  if (qword_10006E928 != -1) {
    dispatch_once(&qword_10006E928, &stru_100059510);
  }
  if (a1 <= 2)
  {
    if (os_log_type_enabled((os_log_t)qword_10006E920, OS_LOG_TYPE_FAULT)) {
      sub_10003EEDC();
    }
    return;
  }
  if (a1 == 3)
  {
    if (os_log_type_enabled((os_log_t)qword_10006E920, OS_LOG_TYPE_ERROR)) {
      sub_10003EF50();
    }
    return;
  }
  if (a1 <= 5)
  {
    uint64_t v4 = qword_10006E920;
    if (!os_log_type_enabled((os_log_t)qword_10006E920, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v9 = 136446210;
    uint64_t v10 = a2;
    CFAllocatorRef v5 = v4;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s", (uint8_t *)&v9, 0xCu);
    return;
  }
  if (a1 == 6)
  {
    uint64_t v7 = qword_10006E920;
    if (!os_log_type_enabled((os_log_t)qword_10006E920, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v9 = 136446210;
    uint64_t v10 = a2;
    CFAllocatorRef v5 = v7;
    os_log_type_t v6 = OS_LOG_TYPE_INFO;
    goto LABEL_15;
  }
  BOOL v8 = os_log_type_enabled((os_log_t)qword_10006E920, OS_LOG_TYPE_DEBUG);
  if (a1 > 7)
  {
    if (v8) {
      sub_10003F038();
    }
  }
  else if (v8)
  {
    sub_10003EFC4();
  }
}

void AMAuthInstallLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = __chkstk_darwin();
  uint64_t v12 = v11;
  uint64_t v13 = v9;
  uint64_t v14 = "";
  if (v10) {
    uint64_t v14 = v10;
  }
  unsigned int v15 = snprintf(__str, 0x1000uLL, "%s: ", v14);
  CFStringRef v16 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, v12, 0x8000100u, kCFAllocatorNull);
  if (!v16)
  {
    CFStringRef v18 = 0;
    goto LABEL_9;
  }
  CFStringRef v17 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v16, &a9);
  CFStringRef v18 = v17;
  if (!v17)
  {
LABEL_9:
    CFBooleanRef v26 = 0;
    CFNumberRef v25 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = v15;
  unsigned int v20 = 4096 - v15;
  unsigned int Length = CFStringGetLength(v17);
  unsigned int v22 = Length;
  if (4096 - v15 < Length && (uint64_t v23 = (char *)malloc(v15 + Length + 1)) != 0)
  {
    uint64_t v24 = v23;
    unsigned int v20 = v22 + 1;
    memcpy(v23, __str, v15);
    CFNumberRef v25 = v24;
  }
  else
  {
    CFNumberRef v25 = 0;
    uint64_t v24 = __str;
  }
  if (CFStringGetCString(v18, &v24[v19], v20, 0x8000100u)) {
    CFBooleanRef v26 = v24;
  }
  else {
    CFBooleanRef v26 = 0;
  }
LABEL_14:
  if (v26) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = "failed to format log message";
  }
  off_10006E2F0(v13, v27);
  SafeRelease(v16);
  SafeRelease(v18);
  SafeFree(v25);
}

uint64_t AMAuthInstallDebugWriteObject(char *cf, CFTypeRef a2, uint64_t a3, int a4)
{
  CFTypeRef cfa = 0;
  if (!cf) {
    goto LABEL_19;
  }
  if ((*((_DWORD *)cf + 86) & a4) == 0)
  {
    uint64_t v14 = 0;
LABEL_12:
    CFDataRef Data = 0;
    goto LABEL_20;
  }
  if (!*((void *)cf + 42))
  {
    CFAllocatorRef v21 = CFGetAllocator(cf);
    uint64_t v22 = AMAuthInstallSupportCopyURLToNewTempDirectory(v21, "amai-debug.XXXXXX", cf + 336);
    if (v22)
    {
      uint64_t v14 = v22;
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallDebugWriteObject", (uint64_t)"failed to create debug output directory", v23, v24, v25, v26, v27, v42);
      goto LABEL_12;
    }
  }
  CFTypeID v7 = CFGetTypeID(a2);
  if (v7 == CFDataGetTypeID())
  {
    CFDataRef Data = (const __CFData *)CFRetain(a2);
    uint64_t v9 = "";
    if (Data) {
      goto LABEL_6;
    }
LABEL_16:
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  CFTypeID v28 = CFGetTypeID(a2);
  if (v28 != CFDictionaryGetTypeID())
  {
    CFTypeID v29 = CFGetTypeID(a2);
    if (v29 != CFArrayGetTypeID())
    {
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallDebugWriteObject", (uint64_t)"can't prepare data for output to file", v30, v31, v32, v33, v34, v42);
      AMAuthInstallLog(7, (uint64_t)"AMAuthInstallDebugWriteObject", (uint64_t)"%@", v36, v37, v38, v39, v40, (char)a2);
LABEL_19:
      CFDataRef Data = 0;
      uint64_t v14 = 1;
      goto LABEL_20;
    }
  }
  CFAllocatorRef v35 = CFGetAllocator(cf);
  CFDataRef Data = CFPropertyListCreateData(v35, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
  uint64_t v9 = ".plist";
  if (!Data) {
    goto LABEL_16;
  }
LABEL_6:
  CFAllocatorRef v10 = CFGetAllocator(cf);
  CFStringRef v11 = CFStringCreateWithFormat(v10, 0, @"%@%s", a3, v9);
  if (v11)
  {
    CFStringRef v12 = v11;
    CFAllocatorRef v13 = CFGetAllocator(cf);
    uint64_t v14 = AMAuthInstallSupportCopyURLWithAppendedComponent(v13, *((const void **)cf + 42), v12, 0, (CFURLRef *)&cfa);
    CFRelease(v12);
    if (!v14)
    {
      CFAllocatorRef v15 = CFGetAllocator(cf);
      uint64_t v14 = AMAuthInstallSupportWriteDataToFileURL(v15, Data, (const __CFURL *)cfa, 0);
      AMAuthInstallLog(7, (uint64_t)"AMAuthInstallDebugWriteObject", (uint64_t)"debug object written: %@", v16, v17, v18, v19, v20, (char)cfa);
    }
  }
  else
  {
    uint64_t v14 = 2;
  }
LABEL_20:
  SafeRelease(Data);
  SafeRelease(cfa);
  return v14;
}

void sub_10001C5B8(id a1)
{
  qword_10006E920 = (uint64_t)os_log_create("com.apple.libauthinstall", "AMAuthInstallLog");
}

uint64_t AMAuthInstallPlatformRemoveFile(const __CFURL *a1)
{
  char v1 = (char)a1;
  if (!CFURLGetFileSystemRepresentation(a1, 1u, (UInt8 *)buffer, 1024)) {
    return 3;
  }
  uint64_t result = remove(buffer, v2);
  if (result)
  {
    uint64_t v4 = __error();
    char v5 = strerror(*v4);
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallPlatformRemoveFile", (uint64_t)"failed to file: %s", v6, v7, v8, v9, v10, v5);
    AMAuthInstallLog(7, (uint64_t)"AMAuthInstallPlatformRemoveFile", (uint64_t)"url=%@, path=%s", v11, v12, v13, v14, v15, v1);
    return 4;
  }
  return result;
}

uint64_t AMAuthInstallPlatformCopyURLToNewTempDirectory(const __CFAllocator *a1, const char *a2, CFURLRef *a3)
{
  uint64_t result = 1;
  if (a2 && a3)
  {
    char v6 = (char)a2;
    snprintf(__str, 0x400uLL, "/tmp/%s", a2);
    if (mkdtemp(__str))
    {
      size_t v7 = strlen(__str);
      CFURLRef v8 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)__str, v7, 1u);
      if (v8)
      {
        CFURLRef v9 = v8;
        uint64_t result = 0;
        *a3 = v9;
      }
      else
      {
        unlink(__str);
        return 2;
      }
    }
    else
    {
      uint64_t v10 = __error();
      char v11 = strerror(*v10);
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallPlatformCopyURLToNewTempDirectory", (uint64_t)"failed to create tmp dir: %s", v12, v13, v14, v15, v16, v11);
      AMAuthInstallLog(8, (uint64_t)"AMAuthInstallPlatformCopyURLToNewTempDirectory", (uint64_t)"tmp dir template: %s", v17, v18, v19, v20, v21, v6);
      return 4;
    }
  }
  return result;
}

uint64_t AMAuthInstallPlatformWriteBufferToNativeFilePath(char *a1, int a2, char *a3)
{
  int v6 = open(a3, 1537, 420);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    if (a2 < 1)
    {
LABEL_6:
      close(v7);
      return 0;
    }
    int v8 = 0;
    int v9 = a2;
    while (1)
    {
      int v10 = write(v7, a1, v9);
      if (v10 <= 0) {
        break;
      }
      a1 += v10;
      v9 -= v10;
      v8 += v10;
      if (v8 >= a2) {
        goto LABEL_6;
      }
    }
    close(v7);
    unlink(a3);
  }
  uint64_t v12 = __error();
  char v13 = strerror(*v12);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallPlatformWriteBufferToNativeFilePath", (uint64_t)"failed to open file for writing: %s", v14, v15, v16, v17, v18, v13);
  AMAuthInstallLog(7, (uint64_t)"AMAuthInstallPlatformWriteBufferToNativeFilePath", (uint64_t)"path: %s", v19, v20, v21, v22, v23, (char)a3);
  return 4;
}

uint64_t AMAuthInstallPlatformWriteDataToFileURL(const __CFData *a1, CFURLRef url)
{
  if (!CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024)) {
    return 3;
  }
  BytePtr = (char *)CFDataGetBytePtr(a1);
  int Length = CFDataGetLength(a1);
  return AMAuthInstallPlatformWriteBufferToNativeFilePath(BytePtr, Length, (char *)buffer);
}

uint64_t AMAuthInstallPlatformCopyURLWithAppendedComponent(const __CFAllocator *a1, CFTypeRef cf, const __CFString *a3, Boolean a4, CFURLRef *a5)
{
  if (!cf) {
    return 1;
  }
  CFTypeID v10 = CFGetTypeID(cf);
  CFTypeID v11 = CFURLGetTypeID();
  uint64_t result = 1;
  if (a5 && a3 && v10 == v11)
  {
    CFURLRef v13 = CFURLCreateCopyAppendingPathComponent(a1, (CFURLRef)cf, a3, a4);
    if (v13)
    {
      CFURLRef v14 = v13;
      uint64_t result = 0;
      *a5 = v14;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t AMAuthInstallPlatformFileURLExists(const __CFURL *a1, BOOL *a2)
{
  uint64_t v2 = 1;
  if (a1 && a2)
  {
    memset(&v6, 0, sizeof(v6));
    if (CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
    {
      int v4 = stat((const char *)buffer, &v6);
      uint64_t v2 = 0;
      *a2 = v4 == 0;
    }
    else
    {
      return 3;
    }
  }
  return v2;
}

CFStringRef sub_10001CACC()
{
  qword_10006E930 = (uint64_t)CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/tmp", kCFURLPOSIXPathStyle, 1u);
  if (!qword_10006E930) {
    sub_10003F0AC();
  }
  size_t v1 = 32;
  CFStringRef result = (const __CFString *)sysctlbyname("kern.osversion", v3, &v1, 0, 0);
  if (!result)
  {
    size_t v1 = 32;
    if (!sysctlbyname("hw.product", v2, &v1, 0, 0)
      || (CFStringRef result = (const __CFString *)sysctlbyname("hw.machine", v2, &v1, 0, 0), !result))
    {
      CFStringRef result = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"mac/%s/%s", v3, v2);
      if (result) {
        goto LABEL_6;
      }
    }
  }
  if (!qword_10006E938)
  {
    CFStringRef result = @"???";
LABEL_6:
    qword_10006E938 = (uint64_t)result;
  }
  return result;
}

uint64_t AMAuthInstallPlatformGetPlatformInfoString()
{
  return qword_10006E938;
}

CFStringRef AMAuthInstallPlatformGetSimplePlatformInfoString()
{
  return @"iOS";
}

uint64_t AMAuthInstallRequestSendSyncWithHeader(uint64_t a1, const void *a2, uint64_t a3, CFTypeRef *a4)
{
  CFTypeRef v133 = 0;
  CFTypeRef cf = 0;
  uint64_t v132 = 0;
  CFAllocatorRef v8 = CFGetAllocator((CFTypeRef)a1);
  uint64_t v9 = 2;
  DeepCopy = (__CFDictionary *)CFPropertyListCreateDeepCopy(v8, a2, 2uLL);
  CFMutableDictionaryRef theDict = DeepCopy;
  if (!DeepCopy) {
    goto LABEL_28;
  }
  uint64_t v16 = *(const void **)(a1 + 64);
  if (v16) {
    CFDictionarySetValue(DeepCopy, @"@Locality", v16);
  }
  uint64_t v17 = (const void **)(a1 + 120);
  CFDataRef v18 = *(const __CFData **)(a1 + 120);
  CFDataRef v19 = v18;
  if (!v18)
  {
    if (!*(void *)(a1 + 104))
    {
      AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"SSO function returned NULL and no SSO token was provided, SSO disabled.", v11, v12, v13, v14, v15, v126);
      goto LABEL_15;
    }
    AMAuthInstallLog(5, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"using SSO.", v11, v12, v13, v14, v15, v126);
    CFDataRef v19 = (const __CFData *)*v17;
    if (!*v17)
    {
      uint64_t v25 = *(uint64_t (**)(uint64_t, CFAllocatorRef, uint64_t, uint64_t *))(a1 + 104);
      CFAllocatorRef v26 = CFGetAllocator((CFTypeRef)a1);
      uint64_t v27 = v25(a1, v26, a1 + 120, &v132);
      if (v27)
      {
        uint64_t v9 = v27;
        AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"failed to create sso data %@", v28, v29, v30, v31, v32, v132);
        goto LABEL_13;
      }
      CFDataRef v19 = (const __CFData *)*v17;
      if (!*v17)
      {
        AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"SSO failed to authenticate.", v28, v29, v30, v31, v32, v126);
        CFDataRef Data = 0;
        uint64_t v34 = 0;
        uint64_t v9 = 22;
        goto LABEL_29;
      }
    }
  }
  AMAuthInstallCryptoCreateDigestForData(kCFAllocatorDefault, v19, &cf);
  if (cf)
  {
    AMAuthInstallLog(7, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"AuthUserId Hash: %@", v20, v21, v22, v23, v24, (char)cf);
    CFRelease(cf);
  }
  CFDictionarySetValue(theDict, @"AuthUserId", *v17);
  if (!v18)
  {
    SafeRelease(*v17);
    const void *v17 = 0;
  }
LABEL_15:
  uint64_t v35 = *(void *)(a1 + 16);
  if (!v35) {
    goto LABEL_21;
  }
  if (*(void *)(v35 + 144))
  {
    uint64_t context = a1;
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
    if (MutableCopy)
    {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_10001D280, &context);
      SafeRelease(theDict);
      CFMutableDictionaryRef theDict = MutableCopy;
      uint64_t v35 = *(void *)(a1 + 16);
      if (!v35) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"fullrequest copy allocation failure", v36, v37, v38, v39, v40, v126);
    uint64_t v9 = 0;
LABEL_13:
    CFDataRef Data = 0;
    uint64_t v34 = 0;
    goto LABEL_29;
  }
LABEL_19:
  CFDictionaryRef v41 = *(const __CFDictionary **)(v35 + 136);
  if (v41) {
    CFDictionaryApplyFunction(v41, (CFDictionaryApplierFunction)sub_10001D420, theDict);
  }
LABEL_21:
  char v42 = theDict;
  Simpleuint64_t PlatformInfoString = AMAuthInstallPlatformGetSimplePlatformInfoString();
  CFDictionarySetValue(v42, @"@HostPlatformInfo", SimplePlatformInfoString);
  uint64_t v44 = theDict;
  CFStringRef LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
  CFDictionarySetValue(v44, @"@VersionInfo", LibraryVersionString);
  uint64_t v46 = *(void *)(a1 + 16);
  if (!v46 || !*(unsigned char *)(v46 + 116)) {
    CFDictionarySetValue(theDict, @"@BBTicket", kCFBooleanTrue);
  }
  uint64_t v47 = *(const void **)(a1 + 96);
  if (v47) {
    CFDictionarySetValue(theDict, @"@UUID", v47);
  }
  uint64_t v48 = AMAuthInstallVinylRemoveFirmwareLoaderVersionTag((const void *)a1, &theDict);
  if (v48)
  {
    uint64_t v9 = v48;
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"AMAuthInstallVinylRemoveFirmwareLoaderVersionTag %d", v49, v50, v51, v52, v53, v48);
LABEL_28:
    CFDataRef Data = 0;
    uint64_t v34 = 0;
    goto LABEL_29;
  }
  uint64_t v9 = 2;
  AMAuthInstallDebugWriteObject((char *)a1, theDict, @"tss-request", 2);
  session = tss_create_session(&stru_10005A7F8, *(const void **)(a1 + 72));
  uint64_t v34 = (uint64_t)session;
  if (!session)
  {
    CFDataRef Data = 0;
    goto LABEL_29;
  }
  CFRelease((CFTypeRef)session[3]);
  *(void *)(v34 + 24) = CFRetain(theDict);
  *(_DWORD *)(v34 + 16) = *(_DWORD *)(a1 + 80);
  *(void *)(v34 + 80) = *(void *)(a1 + 488);
  *(void *)(v34 + 88) = *(void *)(a1 + 512);
  *(void *)(v34 + 32) = a3;
  unsigned int v70 = tss_submit(v34, v63, v64, v65, v66, v67, v68, v69);
  int v76 = v70;
  if (!v70)
  {
    uint64_t v9 = 0;
    goto LABEL_52;
  }
  if (v70 <= 0x2710)
  {
    uint64_t v77 = *(const void **)(v34 + 72);
    if (v77)
    {
      uint64_t v9 = v70 + 3100;
      LODWORD(context) = v70 + 3100;
      if (v70 < 0x384)
      {
        CFAllocatorRef v78 = CFGetAllocator((CFTypeRef)a1);
        CFNumberRef v84 = CFNumberCreate(v78, kCFNumberIntType, &context);
        if (v84)
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 352), v84, v77);
          AMAuthInstallLog(7, (uint64_t)"kAMAuthInstallRequestCacheLocalizedTssError", (uint64_t)"cached server error text: (%d) %@", v85, v86, v87, v88, v89, context);
        }
        else
        {
          AMAuthInstallLog(3, (uint64_t)"kAMAuthInstallRequestCacheLocalizedTssError", (uint64_t)"failed to cache server error text: (%d) %@", v79, v80, v81, v82, v83, context);
        }
        SafeRelease(v84);
        goto LABEL_51;
      }
      AMAuthInstallLog(3, (uint64_t)"kAMAuthInstallRequestCacheLocalizedTssError", (uint64_t)"tss error code out of bounds (%d)", v71, v72, v73, v74, v75, v70 + 28);
    }
  }
  SafeRelease(0);
  if (v76 > 9999)
  {
    if ((v76 - 10000) > 0xC) {
      uint64_t v9 = 14;
    }
    else {
      uint64_t v9 = dword_1000511B8[v76 - 10000];
    }
  }
  else
  {
    uint64_t v9 = (v76 + 3100);
  }
LABEL_51:
  char LocalizedStatusString = AMAuthInstallGetLocalizedStatusString((CFDictionaryRef *)a1, v9);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"failed tss submission: %@", v91, v92, v93, v94, v95, LocalizedStatusString);
LABEL_52:
  CFAllocatorRef v96 = CFGetAllocator((CFTypeRef)a1);
  CFDataRef Data = CFPropertyListCreateData(v96, theDict, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    CFAllocatorRef v97 = CFGetAllocator((CFTypeRef)a1);
    int v103 = AMAuthInstallSupportBase64Encode(v97, Data, &v133, v98, v99, v100, v101, v102);
    if (v76)
    {
      if (!v103)
      {
        AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"failed tss request:<<<<<<<<<<\n%@", v104, v105, v106, v107, v108, (char)v133);
        AMAuthInstallLog(3, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"failed tss request:>>>>>>>>>>", v109, v110, v111, v112, v113, v127);
      }
    }
    else
    {
      if (!v103)
      {
        AMAuthInstallLog(8, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"successful tss request:<<<<<<<<<<\n%@", v104, v105, v106, v107, v108, (char)v133);
        AMAuthInstallLog(8, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"successful tss request:>>>>>>>>>>", v114, v115, v116, v117, v118, v128);
      }
      CFDataRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v34 + 40), @"@ServerVersion");
      CFStringRef v125 = @"unavailable";
      if (Value) {
        LOBYTE(v125) = (_BYTE)Value;
      }
      AMAuthInstallLog(5, (uint64_t)"AMAuthInstallRequestSendSyncWithHeader", (uint64_t)"received tss response (server version: %@)", v120, v121, v122, v123, v124, (char)v125);
      AMAuthInstallDebugWriteObject((char *)a1, *(CFTypeRef *)(v34 + 40), @"tss-response", 2);
      uint64_t v9 = 0;
      if (a4) {
        *a4 = CFRetain(*(CFTypeRef *)(v34 + 40));
      }
    }
  }
LABEL_29:
  SafeRelease(0);
  SafeRelease(0);
  SafeRelease(theDict);
  SafeRelease(0);
  SafeRelease(Data);
  SafeRelease(v133);
  SafeRelease(0);
  if (v34) {
    tss_close_session((void *)v34, v54, v55, v56, v57, v58, v59, v60);
  }
  return v9;
}

void sub_10001D280(const __CFString *a1, const void *a2, CFMutableDictionaryRef *a3)
{
  CFDictionaryRef MutableCopy = (__CFString *)kCFAllocatorDefault;
  CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@,", *(void *)(*((void *)*a3 + 2) + 144));
  uint64_t v18 = *((void *)*a3 + 11);
  CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"@%@");
  if (v13 && (CFDictionaryRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, a1)) != 0)
  {
    if (CFStringHasPrefix(a1, @"Ap,"))
    {
      uint64_t v14 = MutableCopy;
      v15.location = 0;
      v15.CFIndex length = 3;
LABEL_7:
      CFStringReplace(v14, v15, v7);
      uint64_t v16 = a3[1];
      CFStringRef v17 = MutableCopy;
LABEL_8:
      CFDictionarySetValue(v16, v17, a2);
      CFDictionaryRemoveValue(a3[1], a1);
      goto LABEL_9;
    }
    if (CFStringHasPrefix(a1, @"Ap"))
    {
      uint64_t v14 = MutableCopy;
      v15.location = 0;
      v15.CFIndex length = 2;
      goto LABEL_7;
    }
    if (CFEqual(a1, @"@ApImg4Ticket"))
    {
      uint64_t v16 = a3[1];
      CFStringRef v17 = v13;
      goto LABEL_8;
    }
  }
  else
  {
    AMAuthInstallLog(3, (uint64_t)"_ApplyTagPrefix", (uint64_t)"Failed allocation", v8, v9, v10, v11, v12, v18);
  }
LABEL_9:
  SafeRelease(v7);
  SafeRelease(v13);

  SafeRelease(MutableCopy);
}

void sub_10001D420(void *key, const void *a2, CFDictionaryRef theDict)
{
  if (CFDictionaryContainsKey(theDict, key))
  {
    CFDataRef Value = CFDictionaryGetValue(theDict, key);
    CFDictionarySetValue(theDict, a2, Value);
    CFDictionaryRemoveValue(theDict, key);
  }
}

uint64_t AMAuthInstallRequestSendSync(uint64_t a1, const void *a2, CFTypeRef *a3)
{
  return AMAuthInstallRequestSendSyncWithHeader(a1, a2, 0, a3);
}

void SafeRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

CFTypeRef SafeRetain(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void SafeFree(void *a1)
{
  if (a1) {
    free(a1);
  }
}

const char *_CopyHexStringFromData(const __CFAllocator *a1, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  unsigned int Length = CFDataGetLength(theData);
  CFStringRef result = (const char *)calloc(1uLL, (2 * Length) | 1);
  if (result)
  {
    CFStringRef v7 = (char *)result;
    if (Length)
    {
      uint64_t v8 = 0;
      do
      {
        unsigned int v9 = *BytePtr++;
        result[v8] = a0123456789abcd[(unint64_t)v9 >> 4];
        result[(v8 + 1)] = a0123456789abcd[v9 & 0xF];
        v8 += 2;
      }
      while (2 * Length != v8);
    }
    CFStringRef v10 = CFStringCreateWithCString(a1, result, 0x8000100u);
    free(v7);
    return (const char *)v10;
  }
  return result;
}

uint64_t AMAuthInstallSupportRemoveFile(const __CFURL *a1)
{
  BOOL v3 = 0;
  uint64_t result = AMAuthInstallPlatformFileURLExists(a1, &v3);
  if (!result)
  {
    if (!v3) {
      return 0;
    }
    uint64_t result = AMAuthInstallPlatformRemoveFile(a1);
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t AMAuthInstallSupportCopyURLWithAppendedComponent(const __CFAllocator *a1, const void *a2, const __CFString *a3, Boolean a4, CFURLRef *a5)
{
  if (a2 && a3 && a5) {
    return AMAuthInstallPlatformCopyURLWithAppendedComponent(a1, a2, a3, a4, a5);
  }
  else {
    return 1;
  }
}

uint64_t AMAuthInstallSupportCopyPreserveFileURL(const __CFAllocator *a1, CFTypeRef cf, CFTypeRef *a3, int a4)
{
  uint64_t v4 = 1;
  char v20 = 1;
  if (cf && a3)
  {
    CFURLRef v7 = (const __CFURL *)CFRetain(cf);
    CFTypeRef v8 = CFRetain(cf);
    CFStringRef v9 = 0;
    CFMutableStringRef Mutable = 0;
    CFStringRef v11 = 0;
    uint64_t v12 = 1;
    while (1)
    {
      uint64_t v13 = AMAuthInstallPlatformFileURLExists(v7, (BOOL *)&v20);
      if (v13)
      {
        uint64_t v4 = v13;
        goto LABEL_25;
      }
      if (!v20) {
        goto LABEL_21;
      }
      if (v11) {
        CFRelease(v11);
      }
      CFStringRef v11 = CFStringCreateWithFormat(a1, 0, @"~%d", v12);
      if (!v11) {
        goto LABEL_38;
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v9) {
        CFRelease(v9);
      }
      CFMutableStringRef Mutable = CFStringCreateMutable(a1, 0);
      if (!Mutable) {
        break;
      }
      CFStringRef v9 = CFURLCopyFileSystemPath((CFURLRef)cf, kCFURLPOSIXPathStyle);
      if (!v9) {
        goto LABEL_38;
      }
      CFStringAppend(Mutable, v9);
      CFStringAppend(Mutable, v11);
      if (v8) {
        CFRelease(v8);
      }
      CFTypeRef v8 = CFRetain(v7);
      CFRelease(v7);
      CFURLRef v14 = CFURLCreateWithFileSystemPath(a1, Mutable, kCFURLPOSIXPathStyle, 0);
      if (!v14)
      {
        uint64_t v4 = 2;
LABEL_28:
        CFRelease(v11);
        goto LABEL_29;
      }
      CFURLRef v7 = v14;
      if (v20)
      {
        BOOL v15 = v12 > 0x1E;
        uint64_t v12 = (v12 + 1);
        if (!v15) {
          continue;
        }
      }
LABEL_21:
      if (a4) {
        CFURLRef v16 = v7;
      }
      else {
        CFURLRef v16 = (const __CFURL *)v8;
      }
      uint64_t v4 = 0;
      *a3 = CFRetain(v16);
      goto LABEL_25;
    }
    CFStringRef v9 = 0;
LABEL_38:
    uint64_t v4 = 2;
LABEL_25:
    if (v7) {
      CFRelease(v7);
    }
    if (v11) {
      goto LABEL_28;
    }
LABEL_29:
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (v8) {
      CFRelease(v8);
    }
  }
  return v4;
}

CFStringRef AMAuthInstallSupportGetLibraryVersionString()
{
  return @"libauthinstall_device-1033.60.13";
}

uint64_t AMAuthInstallSupportBase64Encode(const __CFAllocator *a1, CFDataRef theData, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!theData)
  {
    uint64_t v29 = "value == NULL";
LABEL_11:
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallSupportBase64Encode", (uint64_t)v29, a4, a5, a6, a7, a8, v31);
    return 1;
  }
  if (!CFDataGetLength(theData))
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallSupportBase64Encode", (uint64_t)"value length == 0: '%@'", a4, a5, a6, a7, a8, (char)theData);
    return 1;
  }
  if (!a3)
  {
    uint64_t v29 = "outEncodedValue == NULL";
    goto LABEL_11;
  }
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(theData);
  unsigned int Length = CFDataGetLength(theData);
  uint64_t v13 = b64encode(BytePtr, Length);
  if (v13)
  {
    CFDataRef v19 = (UInt8 *)v13;
    int v20 = strlen(v13);
    if (v20)
    {
      CFStringRef v26 = CFStringCreateWithBytes(a1, v19, v20, 0x8000100u, 0);
      if (v26)
      {
        CFStringRef v27 = v26;
        *a3 = CFRetain(v26);
        free(v19);
        CFRelease(v27);
        return 0;
      }
      uint64_t v30 = "encodedValue == NULL: '%@'";
    }
    else
    {
      uint64_t v30 = "encodedLength == 0: '%@'";
    }
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallSupportBase64Encode", (uint64_t)v30, v21, v22, v23, v24, v25, (char)theData);
    free(v19);
  }
  else
  {
    AMAuthInstallLog(3, (uint64_t)"AMAuthInstallSupportBase64Encode", (uint64_t)"encodedBuffer == NULL: '%@'", v14, v15, v16, v17, v18, (char)theData);
  }
  return 99;
}

uint64_t AMAuthInstallSupportWriteDataToFileURL(const __CFAllocator *a1, const __CFData *a2, const __CFURL *cf, int a4)
{
  CFTypeRef cfa = 0;
  uint64_t v4 = 1;
  if (!a2 || !cf) {
    return v4;
  }
  if (a4)
  {
    uint64_t v7 = AMAuthInstallSupportRemoveFile(cf);
    if (v7)
    {
LABEL_12:
      uint64_t v4 = v7;
      goto LABEL_13;
    }
    CFURLRef v8 = 0;
LABEL_8:
    if (v8) {
      CFURLRef v15 = v8;
    }
    else {
      CFURLRef v15 = cf;
    }
    uint64_t v7 = AMAuthInstallPlatformWriteDataToFileURL(a2, v15);
    goto LABEL_12;
  }
  uint64_t v9 = AMAuthInstallSupportCopyPreserveFileURL(a1, cf, &cfa, 1);
  if (!v9)
  {
    CFURLRef v8 = (const __CFURL *)cfa;
    goto LABEL_8;
  }
  uint64_t v4 = v9;
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallSupportWriteDataToFileURL", (uint64_t)"AMAuthInstallSupportCopyPreserveFileURL failed.", v10, v11, v12, v13, v14, v17);
LABEL_13:
  if (cfa) {
    CFRelease(cfa);
  }
  return v4;
}

uint64_t AMAuthInstallVinylRemoveFirmwareLoaderVersionTag(const void *a1, CFDictionaryRef *a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 1;
  if (a1 && a2)
  {
    if (*a2)
    {
      CFAllocatorRef v5 = CFGetAllocator(a1);
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v5, 0, *a2);
      uint64_t v2 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionaryRemoveValue(MutableCopy, @"EUICCFirmwareLoaderVersion");
        SafeRelease(*a2);
        uint64_t v3 = 0;
        *a2 = (CFDictionaryRef)CFRetain(v2);
      }
      else
      {
        uint64_t v3 = 2;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  SafeRelease(v2);
  return v3;
}

unint64_t b64_ntop(unsigned __int8 *a1, unint64_t a2, unsigned char *a3, unint64_t a4)
{
  *a3 = 0;
  if (a2 >= 3)
  {
    unint64_t v5 = 0;
    while (1)
    {
      unint64_t result = v5 + 4;
      if (v5 + 4 > a4) {
        goto LABEL_16;
      }
      unint64_t v7 = a1[2];
      unint64_t v8 = a1[1];
      unsigned int v9 = *a1;
      a1 += 3;
      a2 -= 3;
      uint64_t v10 = &a3[v5];
      *uint64_t v10 = aAbcdefghijklmn[(unint64_t)v9 >> 2];
      v10[1] = aAbcdefghijklmn[(v8 >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v9 & 3))];
      v10[2] = aAbcdefghijklmn[(v7 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v8 & 0xF))];
      v10[3] = aAbcdefghijklmn[v7 & 0x3F];
      unint64_t v5 = result;
      if (a2 <= 2)
      {
        if (a2) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
  }
  unint64_t result = 0;
  if (a2)
  {
LABEL_8:
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    unsigned __int8 v18 = 0;
    __int16 v17 = 0;
    do
    {
      *((unsigned char *)&v17 + v12) = a1[v11++];
      uint64_t v12 = v11;
    }
    while (a2 > v11);
    if (result + 4 > a4) {
      goto LABEL_16;
    }
    char v13 = HIBYTE(v17);
    unint64_t v14 = ((unint64_t)HIBYTE(v17) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v17 & 3));
    a3[result] = aAbcdefghijklmn[(unint64_t)v17 >> 2];
    unint64_t v15 = v18;
    a3[result | 1] = aAbcdefghijklmn[v14];
    char v16 = 61;
    if (a2 != 1) {
      char v16 = aAbcdefghijklmn[(v15 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v13 & 0xF))];
    }
    a3[result | 2] = v16;
    a3[result | 3] = 61;
    result += 4;
  }
LABEL_14:
  if (result < a4)
  {
    a3[result] = 0;
    return result;
  }
LABEL_16:
  a3[a4 - 1] = 0;
  *a3 = 0;
  return 0xFFFFFFFFLL;
}

unsigned char *b64encode(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t v2 = 0;
  if (a1 && (int)a2 >= 1)
  {
    unsigned int v5 = a2 / 3;
    if (a2 != 3 * (a2 / 3)) {
      ++v5;
    }
    size_t v6 = (4 * v5) | 1;
    uint64_t v2 = malloc(v6);
    if (v2) {
      b64_ntop(a1, a2, v2, v6);
    }
  }
  return v2;
}

CFStringRef tss_lookup_error(int a1)
{
  size_t v1 = off_10006E310;
  if (off_10006E310)
  {
    if (tss_err_map == a1) {
      return CFStringCreateWithCString(kCFAllocatorDefault, v1, 0x8000100u);
    }
    for (CFIndex i = (const char **)&off_10006E320; ; i += 2)
    {
      size_t v1 = *i;
      if (!*i) {
        break;
      }
      int v3 = *((_DWORD *)i - 2);
      if (v3 == a1) {
        return CFStringCreateWithCString(kCFAllocatorDefault, v1, 0x8000100u);
      }
    }
  }
  return @"Unknown";
}

void *tss_create_session(const void *a1, const void *a2)
{
  uint64_t v4 = malloc(0x60uLL);
  uint64_t v10 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  v4[4] = 0u;
  v4[5] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  *uint64_t v4 = 0u;
  v4[1] = 0u;
  if (!a2)
  {
    char v13 = "signingServerURL is NULL";
    goto LABEL_10;
  }
  CFTypeID v11 = CFGetTypeID(a2);
  if (v11 != CFURLGetTypeID())
  {
    char v13 = "signingServerURL is malformed";
    goto LABEL_10;
  }
  v10[1] = CFRetain(a2);
  *((_WORD *)v10 + 10) = 256;
  if (a1) {
    CFRetain(a1);
  }
  *uint64_t v10 = a1;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v10[3] = Mutable;
  if (!Mutable)
  {
LABEL_7:
    char v13 = "out of memory";
LABEL_10:
    AMAuthInstallLog(3, (uint64_t)"tss_create_session", (uint64_t)v13, v5, v6, v7, v8, v9, v15);
    free(v10);
    return 0;
  }
  return v10;
}

uint64_t tss_close_session(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = tss_reset_session((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v9) {
    free(a1);
  }
  return v9;
}

uint64_t tss_reset_session(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(const void **)a1;
    if (v9) {
      CFRelease(v9);
    }
    uint64_t v10 = *(const void **)(a1 + 24);
    if (v10) {
      CFRelease(v10);
    }
    CFTypeID v11 = *(const void **)(a1 + 40);
    if (v11) {
      CFRelease(v11);
    }
    uint64_t v12 = *(const void **)(a1 + 8);
    if (v12) {
      CFRelease(v12);
    }
    char v13 = *(const void **)(a1 + 72);
    if (v13)
    {
      CFRelease(v13);
      *(void *)(a1 + 72) = 0;
    }
    unint64_t v14 = *(void **)(a1 + 56);
    if (v14) {
      free(v14);
    }
    uint64_t result = 0;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    AMAuthInstallLog(3, (uint64_t)"tss_reset_session", (uint64_t)"NULL session", a4, a5, a6, a7, a8, v16);
    return 10009;
  }
  return result;
}

uint64_t tss_submit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    AMAuthInstallLog(3, (uint64_t)"tss_submit", (uint64_t)"NULL session", a4, a5, a6, a7, a8, v19);
    return 10009;
  }
  if (!*(void *)(a1 + 24))
  {
    AMAuthInstallLog(3, (uint64_t)"tss_submit", (uint64_t)"NULL request in session", a4, a5, a6, a7, a8, v19);
    uint64_t v15 = 10008;
    CFStringRef v16 = (const __CFString *)a1;
    int v17 = 10008;
LABEL_10:
    sub_10001DFC0(v16, v17);
    return v15;
  }
  if (!*(void *)(a1 + 48))
  {
    sub_10001E008();
    return *(unsigned int *)(a1 + 64);
  }
  uint64_t v9 = (pthread_t *)malloc(8uLL);
  *(void *)(a1 + 56) = v9;
  if (!v9)
  {
    AMAuthInstallLog(3, (uint64_t)"tss_submit_non_block", (uint64_t)"out of memory", v10, v11, v12, v13, v14, v19);
    uint64_t v15 = 10006;
    CFStringRef v16 = (const __CFString *)a1;
    int v17 = 10006;
    goto LABEL_10;
  }
  pthread_create(v9, 0, (void *(__cdecl *)(void *))sub_10001E008, (void *)a1);
  return 0;
}

CFStringRef sub_10001DFC0(const __CFString *result, int a2)
{
  if (result)
  {
    CFStringRef v3 = result;
    LODWORD(result[2].isa) = a2;
    info = (const void *)result[2].info;
    if (info) {
      CFRelease(info);
    }
    uint64_t result = tss_lookup_error(a2);
    v3[2].info = (uint64_t)result;
  }
  return result;
}

uint64_t sub_10001E008()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v6 = v0;
  if (v0)
  {
    if (*(_DWORD *)(v0 + 16) <= 1u) {
      unsigned int v7 = 1;
    }
    else {
      unsigned int v7 = *(_DWORD *)(v0 + 16);
    }
  }
  else
  {
    unsigned int v7 = 1;
  }
  unsigned int v8 = 0;
  CFAllocatorRef v9 = kCFAllocatorDefault;
  key = (void *)_kCFSystemVersionBuildVersionKey;
  do
  {
    AMAuthInstallLog(6, (uint64_t)"tss_submit_job_with_retry", (uint64_t)"TSS Connection attempt %d of %d.  (Will retry if TSS_ERR_SERVER_NOT_REACHABLE.)", v1, v2, v3, v4, v5, ++v8);
    CFErrorRef error = 0;
    bzero(v209, 0x19000uLL);
    if (!*(void *)(v6 + 8))
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"no server URL", v10, v11, v12, v13, v14, v173);
      int v71 = 10008;
LABEL_25:
      sub_10001DFC0((const __CFString *)v6, v71);
      CFURLRef v28 = 0;
      Request = 0;
      CFStringRef v72 = 0;
      CFStringRef v35 = 0;
      CFDictionaryRef v73 = 0;
      uint64_t v50 = 0;
      *(_DWORD *)(v6 + 64) = v71;
      goto LABEL_36;
    }
    CFDataRef v15 = CFPropertyListCreateData(v9, *(CFPropertyListRef *)(v6 + 24), kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (!v15)
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"CFPropertyListCreateXMLData failed %@", v16, v17, v18, v19, v20, (char)error);
      int v71 = 10036;
      goto LABEL_25;
    }
    CFDataRef v21 = v15;
    char Length = CFDataGetLength(v15);
    CFURLRef v28 = CFURLCreateWithString(v9, @"TSS/controller?action=2", *(CFURLRef *)(v6 + 8));
    if (!v28)
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"CFURLCreateCopyAppendingPathComponent() failed", v23, v24, v25, v26, v27, v173);
      int v74 = 10041;
      sub_10001DFC0((const __CFString *)v6, 10041);
      Request = 0;
LABEL_28:
      CFStringRef v72 = 0;
      CFStringRef v35 = 0;
      uint64_t v50 = 0;
LABEL_35:
      *(_DWORD *)(v6 + 64) = v74;
      CFRelease(v21);
      CFDictionaryRef v73 = 0;
      goto LABEL_36;
    }
    Request = CFHTTPMessageCreateRequest(v9, @"POST", v28, kCFHTTPVersion1_1);
    if (!Request)
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"CFHTTPMessageCreateRequest failed", v29, v30, v31, v32, v33, v173);
      int v74 = 10041;
      sub_10001DFC0((const __CFString *)v6, 10041);
      goto LABEL_28;
    }
    char v174 = Length;
    CFStringRef v35 = CFStringCreateWithFormat(v9, 0, @"%d");
    CFHTTPMessageSetHeaderFieldValue(Request, @"Proxy-Connection", @"Keep-Alive");
    CFHTTPMessageSetHeaderFieldValue(Request, @"Pragma", @"no-cache");
    CFHTTPMessageSetHeaderFieldValue(Request, @"Content-Type", @"text/xml; charset=\"utf-8\"");
    CFHTTPMessageSetHeaderFieldValue(Request, @"Content-Length", v35);
    CFDictionaryRef v36 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v36)
    {
      CFDictionaryRef v42 = v36;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v36, key);
      CFHTTPMessageSetHeaderFieldValue(Request, @"X-OS-Version", Value);
      CFRelease(v42);
    }
    if (*(void *)(v6 + 32))
    {
      AMAuthInstallLog(7, (uint64_t)"tss_submit_job", (uint64_t)"Attempting to add additional entries to HTTP header", v37, v38, v39, v40, v41, v174);
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v6 + 32), (CFDictionaryApplierFunction)sub_10001EB18, Request);
      AMAuthInstallLog(7, (uint64_t)"tss_submit_job", (uint64_t)"Done adding additional fields to HTTP header", v44, v45, v46, v47, v48, v175);
    }
    CFHTTPMessageSetBody(Request, v21);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v9, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v50 = Mutable;
    uint64_t v51 = *(const void **)(v6 + 80);
    if (v51)
    {
      CFDictionaryAddValue(Mutable, @"SocksProxySettings", v51);
      AMAuthInstallLog(7, (uint64_t)"tss_submit_job", (uint64_t)"Found a SOCKS proxy setting. Will attempt to use it.", v52, v53, v54, v55, v56, v174);
    }
    uint64_t v57 = *(const void **)(v6 + 88);
    if (v57)
    {
      CFDictionaryAddValue(v50, @"TrustedServerCAs", v57);
      AMAuthInstallLog(7, (uint64_t)"tss_submit_job", (uint64_t)"Found a trusted server CA. Will attempt to use it.", v58, v59, v60, v61, v62, v174);
    }
    theData[0] = 0;
    CFStringRef v63 = CFURLCopyScheme(*(CFURLRef *)(v6 + 8));
    if (!v63)
    {
      unsigned int v70 = "Invalid scheme in url";
      goto LABEL_32;
    }
    CFStringRef v69 = v63;
    *(_DWORD *)__s = 10000;
    if (CFStringCompare(v63, @"https", 1uLL) && CFStringCompare(v69, @"http", 1uLL))
    {
      CFRelease(v69);
      unsigned int v70 = "unsupported URL scheme";
LABEL_32:
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)v70, v64, v65, v66, v67, v68, v174);
      int v74 = 10008;
      CFStringRef v80 = (const __CFString *)v6;
      int v81 = 10008;
      goto LABEL_33;
    }
    CFRelease(v69);
    if (AMAuthInstallHttpMessageSendSyncNew(v9, (int)Request, (int)theData, (int)__s, v50, 300.0))
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"failed to send http request", v75, v76, v77, v78, v79, v174);
      int v74 = 10002;
      CFStringRef v80 = (const __CFString *)v6;
      int v81 = 10002;
LABEL_33:
      sub_10001DFC0(v80, v81);
LABEL_34:
      CFStringRef v72 = @"Content-Length";
      goto LABEL_35;
    }
    int v74 = *(_DWORD *)__s;
    if (*(_DWORD *)__s != 200)
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"SendHttpRequest failed %d", v75, v76, v77, v78, v79, __s[0]);
      if (*(_DWORD *)__s == -1) {
        int v74 = 10002;
      }
      CFStringRef v88 = (const __CFString *)v6;
      int v89 = v74;
      goto LABEL_62;
    }
    if ((unint64_t)CFDataGetLength(theData[0]) > 0x19000)
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"Response too large", v83, v84, v85, v86, v87, v174);
      int v74 = 10052;
      CFStringRef v88 = (const __CFString *)v6;
      int v89 = 10052;
LABEL_62:
      sub_10001DFC0(v88, v89);
      CFRelease(theData[0]);
      goto LABEL_34;
    }
    CFDataGetBytePtr(theData[0]);
    CFDataGetLength(theData[0]);
    __memcpy_chk();
    int v90 = CFDataGetLength(theData[0]);
    CFRelease(theData[0]);
    int v96 = v90;
    *(void *)v207 = 0;
    *(_OWORD *)__s = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    int v180 = v90;
    if (v90 < 1)
    {
      int v100 = 0;
      v184 = 0;
      CFTypeRef cf = 0;
      v183 = 0;
      goto LABEL_101;
    }
    CFAllocatorRef v97 = 0;
    uint64_t v98 = 0;
    uint64_t v99 = 0;
    int v100 = 0;
    uint64_t v101 = v209;
    do
    {
      if (v99)
      {
        if (v98) {
          goto LABEL_67;
        }
      }
      else if (v100 + 7 >= v96)
      {
        uint64_t v99 = 0;
        if (v98) {
          goto LABEL_67;
        }
      }
      else
      {
        v181 = v97;
        v185 = v98;
        if (!strncmp(v101, "STATUS", 6uLL))
        {
          uint64_t v102 = 0;
          uint64_t v99 = v101 + 7;
          CFAllocatorRef v97 = v181;
          do
          {
            int v103 = v101[v102 + 7];
            if (v103 == 38) {
              break;
            }
            v207[v102++] = v103;
          }
          while (v102 != 8);
          v207[7] = 0;
          int v96 = v180;
        }
        else
        {
          uint64_t v99 = 0;
          int v96 = v180;
          CFAllocatorRef v97 = v181;
        }
        uint64_t v98 = v185;
        if (v185)
        {
LABEL_67:
          if (v97) {
            goto LABEL_98;
          }
          goto LABEL_68;
        }
      }
      if (v100 + 8 >= v96)
      {
        uint64_t v98 = 0;
        if (v97) {
          goto LABEL_98;
        }
      }
      else
      {
        CFTypeRef cfa = v99;
        v182 = v97;
        if (!strncmp(v101, "MESSAGE", 7uLL))
        {
          uint64_t v104 = 0;
          uint64_t v98 = v101 + 8;
          CFAllocatorRef v97 = v182;
          uint64_t v99 = cfa;
          do
          {
            int v105 = v101[v104 + 8];
            if (v105 == 10) {
              break;
            }
            if (v105 == 38) {
              break;
            }
            __s[v104++] = v105;
          }
          while (v104 != 256);
          HIBYTE(v206) = 0;
          int v96 = v180;
          if (v182) {
            goto LABEL_98;
          }
        }
        else
        {
          uint64_t v98 = 0;
          int v96 = v180;
          CFAllocatorRef v97 = v182;
          uint64_t v99 = cfa;
          if (v182) {
            goto LABEL_98;
          }
        }
      }
LABEL_68:
      if (v100 + 15 >= v96)
      {
        CFAllocatorRef v97 = 0;
      }
      else
      {
        v184 = v98;
        CFTypeRef cf = v99;
        if (!strncmp(v101, "REQUEST_STRING", 0xEuLL))
        {
          CFAllocatorRef v97 = v101 + 15;
          uint64_t v99 = cf;
          if (cf)
          {
            int v96 = v180;
            uint64_t v98 = v184;
            if (v184)
            {
              v183 = v101 + 15;
              goto LABEL_101;
            }
          }
          else
          {
            int v96 = v180;
            uint64_t v98 = v184;
          }
        }
        else
        {
          CFAllocatorRef v97 = 0;
          int v96 = v180;
          uint64_t v98 = v184;
          uint64_t v99 = cf;
        }
      }
LABEL_98:
      ++v101;
      ++v100;
    }
    while (v100 != v96);
    v183 = v97;
    v184 = v98;
    int v100 = v96;
    CFTypeRef cf = v99;
LABEL_101:
    AMAuthInstallLog(8, (uint64_t)"tss_submit_job", (uint64_t)"----Begin request", v91, v92, v93, v94, v95, v174);
    AMAuthInstallLog(8, (uint64_t)"tss_submit_job", (uint64_t)"%@", v106, v107, v108, v109, v110, *(void *)(v6 + 24));
    AMAuthInstallLog(8, (uint64_t)"tss_submit_job", (uint64_t)"----End request", v111, v112, v113, v114, v115, v176);
    AMAuthInstallLog(8, (uint64_t)"tss_submit_job", (uint64_t)"----Begin response", v116, v117, v118, v119, v120, v177);
    AMAuthInstallLog(8, (uint64_t)"tss_submit_job", (uint64_t)"%s", v121, v122, v123, v124, v125, (char)v209);
    AMAuthInstallLog(8, (uint64_t)"tss_submit_job", (uint64_t)"----End response", v126, v127, v128, v129, v130, v178);
    if (!cf || !v184)
    {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"invalid response", v131, v132, v133, v134, v135, v179);
      int v142 = 10052;
      CFStringRef v151 = (const __CFString *)v6;
      int v152 = 10052;
      goto LABEL_109;
    }
    int v136 = atoi(v207);
    if (!v136)
    {
      if (v183)
      {
        __memcpy_chk();
        CFDataRef v153 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)theData, v180 - v100 - 15);
        if (v153)
        {
          CFDataRef v159 = v153;
          if (error) {
            CFRelease(error);
          }
          CFDataRef cfb = v159;
          CFDictionaryRef v73 = (const __CFDictionary *)CFPropertyListCreateWithData(kCFAllocatorDefault, v159, 0, 0, &error);
          if (v73)
          {
            CFDictionaryRef Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, v73);
            *(void *)(v6 + 40) = Copy;
            if (Copy)
            {
              int v171 = 0;
LABEL_124:
              *(_DWORD *)(v6 + 64) = v171;
              CFRelease(v21);
              CFRelease(cfb);
              goto LABEL_111;
            }
            AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"CFDictionaryCreateCopy failed", v166, v167, v168, v169, v170, v179);
            int v171 = 10056;
          }
          else
          {
            AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"CFPropertyListCreateFromXMLData failed (%@)", v160, v161, v162, v163, v164, (char)error);
            int v171 = 10055;
          }
          sub_10001DFC0((const __CFString *)v6, v171);
          goto LABEL_124;
        }
        AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"CFDataCreate failed", v154, v155, v156, v157, v158, v179);
        int v142 = 10054;
        CFStringRef v151 = (const __CFString *)v6;
        int v152 = 10054;
      }
      else
      {
        AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"no data in response", v137, v138, v139, v140, v141, v179);
        int v142 = 10053;
        CFStringRef v151 = (const __CFString *)v6;
        int v152 = 10053;
      }
LABEL_109:
      sub_10001DFC0(v151, v152);
      goto LABEL_110;
    }
    int v142 = v136;
    AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"error from server=%d (%s)", v137, v138, v139, v140, v141, v136);
    CFAllocatorRef v143 = *(const void **)(v6 + 72);
    if (v143) {
      CFRelease(v143);
    }
    size_t v144 = strlen(__s);
    CFStringRef v145 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)__s, v144, 0x8000100u, 0);
    *(void *)(v6 + 72) = v145;
    if (!v145) {
      AMAuthInstallLog(3, (uint64_t)"tss_submit_job", (uint64_t)"Server message failed to convert: %d", v146, v147, v148, v149, v150, v142);
    }
LABEL_110:
    *(_DWORD *)(v6 + 64) = v142;
    CFRelease(v21);
    CFDictionaryRef v73 = 0;
LABEL_111:
    CFStringRef v72 = @"Content-Length";
LABEL_36:
    if (error) {
      CFRelease(error);
    }
    if (v28) {
      CFRelease(v28);
    }
    if (Request) {
      CFRelease(Request);
    }
    if (v72) {
      CFRelease(v72);
    }
    if (v35) {
      CFRelease(v35);
    }
    CFAllocatorRef v9 = kCFAllocatorDefault;
    if (v73) {
      CFRelease(v73);
    }
    if (v50) {
      CFRelease(v50);
    }
    uint64_t v82 = *(void (**)(uint64_t))(v6 + 48);
    if (v82) {
      v82(v6);
    }
  }
  while (v6 && v8 < v7 && *(_DWORD *)(v6 + 64) == 10002);
  return 0;
}

void sub_10001EB18(const __CFString *a1, const __CFString *a2, __CFHTTPMessage *a3)
{
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
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
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)uint64_t v11 = 0u;
  long long v12 = 0u;
  CFStringGetCString(a1, buffer, 511, 0x8000100u);
  CFStringGetCString(a2, v11, 511, 0x8000100u);
  AMAuthInstallLog(7, (uint64_t)"_AMAuthInstallUpdateHTTPHeaderWithEntry", (uint64_t)"Appending {%s : %s} to http header", v6, v7, v8, v9, v10, (char)buffer);
  CFHTTPMessageSetHeaderFieldValue(a3, a1, a2);
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  uint64_t result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t uarpNtohll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpNtohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpNtohs(unsigned int a1)
{
  return __rev16(a1);
}

BOOL sub_10001F688(NSError *self, SEL a2)
{
  uint64_t v3 = [(NSError *)self domain];
  if ([v3 isEqualToString:NSPOSIXErrorDomain]) {
    BOOL v4 = (id)[(NSError *)self code] == (id)17;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

id UARPPersonalizationTSSRequestWithSigningServer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = sub_10001FAB0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100020100();
  }

  id v6 = sub_10001FB04(v3, v4, 0);
  uint64_t v7 = sub_10001FAB0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      sub_1000200CC();
    }

    id v9 = v6;
  }
  else
  {
    if (v8) {
      sub_100020098();
    }
  }

  return v6;
}

id sub_10001FAB0()
{
  if (qword_10006E940 != -1) {
    dispatch_once(&qword_10006E940, &stru_100059640);
  }
  uint64_t v0 = (void *)qword_10006E948;

  return v0;
}

id sub_10001FB04(void *a1, void *a2, int a3)
{
  CFDictionaryRef v5 = a1;
  id v6 = a2;
  uint64_t v7 = sub_10001FAB0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    CFTypeRef v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "UARP: TSS request to signing server %{public}@", buf, 0xCu);
  }

  AMAuthInstallLogSetHandler((void (*)(int, uint64_t))sub_10001FFD4);
  uint64_t v8 = AMAuthInstallCreate(kCFAllocatorDefault);
  if (!v8)
  {
    long long v13 = sub_10001FAB0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100020168();
    }

    goto LABEL_11;
  }
  id v9 = (const void *)v8;
  int v10 = AMAuthInstallSetSigningServerURL(v8, v6);
  uint64_t v11 = sub_10001FAB0();
  long long v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100020214();
    }

    CFRelease(v9);
LABEL_11:
    long long v14 = 0;
    goto LABEL_32;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (a3) {
      CFStringRef v15 = @" <AppleConnect>";
    }
    else {
      CFStringRef v15 = @" ";
    }
    *(_DWORD *)buf = 138543618;
    CFTypeRef v25 = v6;
    __int16 v26 = 2114;
    CFStringRef v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "UARP: TSS Request %{public}@%{public}@ is ", buf, 0x16u);
  }

  long long v16 = sub_10001FAB0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    CFTypeRef v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
  }

  CFTypeRef v23 = 0;
  int v17 = AMAuthInstallApCreatePersonalizedResponse((uint64_t)v9, v5, &v23);
  long long v18 = sub_10001FAB0();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    if (a3) {
      CFStringRef v19 = @" <AppleConnect>";
    }
    else {
      CFStringRef v19 = @" ";
    }
    *(_DWORD *)buf = 138543618;
    CFTypeRef v25 = v6;
    __int16 v26 = 2114;
    CFStringRef v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "UARP: TSS Response %{public}@%{public}@ is ", buf, 0x16u);
  }

  long long v20 = sub_10001FAB0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    CFTypeRef v25 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
  }

  if (v17)
  {
    long long v21 = sub_10001FAB0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002019C(v17, v21);
    }

    long long v14 = 0;
  }
  else
  {
    long long v14 = (void *)v23;
  }
  CFRelease(v9);
LABEL_32:

  return v14;
}

id UARPPersonalizationTSSRequestWithSigningServerSSO(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFDictionaryRef v5 = sub_10001FAB0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10002027C();
  }

  id v6 = sub_10001FB04(v3, v4, 1);
  if (!v6)
  {
    uint64_t v7 = sub_10001FAB0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100020248();
    }
  }

  return v6;
}

void sub_10001FF8C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  uint64_t v2 = (void *)qword_10006E948;
  qword_10006E948 = (uint64_t)v1;
}

void sub_10001FFD4(uint64_t a1, uint64_t a2)
{
  id v3 = sub_10001FAB0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    uint64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UARP: Personalization Message >> %{public}s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100020098()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed customer path / auth listed", v2, v3, v4, v5, v6);
}

void sub_1000200CC()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request passed customer path / auth listed", v2, v3, v4, v5, v6);
}

void sub_100020100()
{
  sub_100020080();
  sub_10000CAF0((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with options %{public}@");
}

void sub_100020168()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "UARP: Failed to create authinstall reference", v2, v3, v4, v5, v6);
}

void sub_10002019C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "UARP: Failed personalization response, CFErrorRef error = %u", (uint8_t *)v2, 8u);
}

void sub_100020214()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "UARP: Failed to set signing server", v2, v3, v4, v5, v6);
}

void sub_100020248()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed sso modes", v2, v3, v4, v5, v6);
}

void sub_10002027C()
{
  sub_100020080();
  sub_10000CAF0((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with SSO and options %{public}@");
}

void sub_10002039C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000214C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000229E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027120(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained superbinary:*(void *)(a1 + 32) logString:*(void *)(a1 + 40)];
}

id sub_10002716C(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)(a2 + 32);
  uint64_t v4 = *(void **)(a2 + 40);

  return v4;
}

void sub_1000271A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
}

void sub_10002A7E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002CFB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D9D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10002DD98(NSFileHandle *self, SEL a2, const void *a3, unint64_t a4)
{
  uint64_t v5 = +[NSData dataWithBytes:a3 length:a4];
  LOBYTE(self) = [(NSFileHandle *)self uarpWriteData:v5 error:0];

  return (char)self;
}

void sub_10002F768(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002F7B4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10002F7E8()
{
  int v2 = 136315650;
  sub_10002F788();
  sub_10002F7B4((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
}

void sub_10002F85C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F8D4(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = a1[2];
  int v5 = a1[3];
  int v6 = 136316162;
  uint64_t v7 = "-[FTABFileBackDeploy parseFileData]";
  __int16 v8 = 1024;
  int v9 = v2;
  __int16 v10 = 1024;
  int v11 = v3;
  __int16 v12 = 1024;
  int v13 = v4;
  __int16 v14 = 1024;
  int v15 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: File tag parse error (%02x %02x %02x %02x)", (uint8_t *)&v6, 0x24u);
}

void sub_10002F988()
{
  sub_10002F7D4();
  sub_10002F7A4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
}

void sub_10002FA0C()
{
  v1[0] = 136315650;
  sub_10002F7D4();
  __int16 v2 = 2048;
  uint64_t v3 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Error parsing file offset list (offset=%u, length=%lu)", (uint8_t *)v1, 0x1Cu);
}

void sub_10002FA9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002FB14()
{
  sub_10002F7A4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Cu);
}

void sub_10002FBF4()
{
  int v2 = 136315650;
  sub_10002F788();
  sub_10002F7B4((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
}

void sub_10002FC68()
{
  sub_10000CAE4();
  sub_10002F7A4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void sub_10002FCE4(void *a1)
{
  id v1 = [a1 path];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Unable to create file at %@", v4, v5, v6, v7, v8);
}

void sub_10002FD70(void *a1)
{
  id v1 = [a1 path];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Unable to delete file at %@", v4, v5, v6, v7, v8);
}

void sub_10002FDFC(void *a1)
{
  id v1 = [a1 tag];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Failed to write '%@'", v4, v5, v6, v7, v8);
}

void sub_10002FE88(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to write manifest", v1, 2u);
}

void sub_10002FECC(void *a1)
{
  id v1 = [a1 tag];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Failed to write '%@' header", v4, v5, v6, v7, v8);
}

void sub_10002FF58(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to write FTAB header", v1, 2u);
}

void sub_10002FF9C(void *a1)
{
  id v1 = [a1 absoluteString];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Failed to open file handle for writing to '%@'", v4, v5, v6, v7, v8);
}

void sub_100030028()
{
  sub_10000CAE4();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "Unable to locate subfile with tag '%@'", v2, v3, v4, v5, v6);
}

void sub_100031F0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032458(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032D08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100033134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100034244(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = +[UARPTLVPersonalizationRequiredBackDeploy metaDataTableEntry];
  [v1 addObject:v2];

  id v3 = +[UARPTLVPersonalizationPayloadTagBackDeploy metaDataTableEntry];
  [v1 addObject:v3];

  id v4 = +[UARPTLVPersonalizationSuperBinaryAssetIDBackDeploy metaDataTableEntry];
  [v1 addObject:v4];

  id v5 = +[UARPTLVPersonalizationManifestPrefixBackDeploy metaDataTableEntry];
  [v1 addObject:v5];

  id v6 = +[UARPTLVPersonalizationBoardIDBackDeploy metaDataTableEntry];
  [v1 addObject:v6];

  id v7 = +[UARPTLVPersonalizationChipIDBackDeploy metaDataTableEntry];
  [v1 addObject:v7];

  id v8 = +[UARPTLVPersonalizationECIDBackDeploy metaDataTableEntry];
  [v1 addObject:v8];

  id v9 = +[UARPTLVPersonalizationECIDDataBackDeploy metaDataTableEntry];
  [v1 addObject:v9];

  id v10 = +[UARPTLVPersonalizationNonceBackDeploy metaDataTableEntry];
  [v1 addObject:v10];

  id v11 = +[UARPTLVPersonalizationNonceHashBackDeploy metaDataTableEntry];
  [v1 addObject:v11];

  id v12 = +[UARPTLVPersonalizationSecurityDomainBackDeploy metaDataTableEntry];
  [v1 addObject:v12];

  id v13 = +[UARPTLVPersonalizationSecurityModeBackDeploy metaDataTableEntry];
  [v1 addObject:v13];

  id v14 = +[UARPTLVPersonalizationProductionModeBackDeploy metaDataTableEntry];
  [v1 addObject:v14];

  id v15 = +[UARPTLVPersonalizationChipEpochBackDeploy metaDataTableEntry];
  [v1 addObject:v15];

  id v16 = +[UARPTLVPersonalizationEnableMixMatchBackDeploy metaDataTableEntry];
  [v1 addObject:v16];

  id v17 = +[UARPTLVPersonalizationSuperBinaryPayloadIndexBackDeploy metaDataTableEntry];
  [v1 addObject:v17];

  id v18 = +[UARPTLVPersonalizationChipRevisionBackDeploy metaDataTableEntry];
  [v1 addObject:v18];

  id v19 = +[UARPTLVPersonalizationFTABSubfileTagBackDeploy metaDataTableEntry];
  [v1 addObject:v19];

  id v20 = +[UARPTLVPersonalizationFTABSubfileLongnameBackDeploy metaDataTableEntry];
  [v1 addObject:v20];

  id v21 = +[UARPTLVPersonalizationFTABSubfileDigestBackDeploy metaDataTableEntry];
  [v1 addObject:v21];

  id v22 = +[UARPTLVPersonalizationFTABSubfileHashAlgorithmBackDeploy metaDataTableEntry];
  [v1 addObject:v22];

  id v23 = +[UARPTLVPersonalizationFTABSubfileESECBackDeploy metaDataTableEntry];
  [v1 addObject:v23];

  id v24 = +[UARPTLVPersonalizationFTABSubfileEPROBackDeploy metaDataTableEntry];
  [v1 addObject:v24];

  id v25 = +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy metaDataTableEntry];
  [v1 addObject:v25];

  id v26 = +[UARPTLVPersonalizationSoCLiveNonceBackDeploy metaDataTableEntry];
  [v1 addObject:v26];

  id v27 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy metaDataTableEntry];
  [v1 addObject:v27];

  id v28 = +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy metaDataTableEntry];
  [v1 addObject:v28];

  id v29 = +[UARPTLVPersonalizationLogicalUnitNumberBackDeploy metaDataTableEntry];
  [v1 addObject:v29];

  id v30 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy metaDataTableEntry];
  [v1 addObject:v30];

  id v31 = +[UARPTLVHostPersonalizationRequiredBackDeploy metaDataTableEntry];
  [v1 addObject:v31];

  id v32 = +[UARPTLVRequiredPersonalizationOptionBackDeploy metaDataTableEntry];
  [v1 addObject:v32];

  id v33 = +[UARPTLVPersonalizationFTABPayloadBackDeploy metaDataTableEntry];
  [v1 addObject:v33];

  id v34 = +[UARPTLVPersonalizedManifestBackDeploy metaDataTableEntry];
  [v1 addObject:v34];

  id v35 = +[UARPTLVPersonalizationLifeBackDeploy metaDataTableEntry];
  [v1 addObject:v35];

  id v36 = +[UARPTLVPersonalizationProvisioningBackDeploy metaDataTableEntry];
  [v1 addObject:v36];

  id v37 = +[UARPTLVPersonalizationManifestEpochBackDeploy metaDataTableEntry];
  [v1 addObject:v37];

  id v38 = +[UARPTLVPersonalizationManifestSuffixBackDeploy metaDataTableEntry];
  [v1 addObject:v38];

  long long v39 = +[NSArray arrayWithArray:v1];
  long long v40 = (void *)qword_10006E950;
  qword_10006E950 = (uint64_t)v39;
}

id FormatHex(uint64_t a1, unint64_t a2, int a3)
{
  id v6 = +[NSMutableString stringWithCapacity:0];
  id v7 = v6;
  char v43 = 0;
  uint64_t v42 = 0;
  if (a3) {
    CFStringRef v8 = @"00000000  ";
  }
  else {
    CFStringRef v8 = @"0000  ";
  }
  [v6 appendFormat:v8];
  if (a2)
  {
    unint64_t v9 = 0;
    id v10 = "%s %s\n%04x  ";
    if (a3) {
      id v10 = "%s %s\n%08x  ";
    }
    __format = (char *)v10;
    do
    {
      if (v9)
      {
        unint64_t v11 = v9 & 0xF;
        if ((v9 & 0xF) == 0)
        {
          char v41 = 0;
          uint64_t v40 = *(void *)(v9 + a1 - 16);
          do
          {
            int v12 = *((char *)&v40 + v11);
            if (v12 < 32 || v12 == 127 || *((unsigned char *)&v40 + v11) == 32) {
              *((unsigned char *)&v40 + v11) = 46;
            }
            ++v11;
          }
          while (v11 != 8);
          uint64_t v13 = 0;
          char v39 = 0;
          uint64_t v38 = *(void *)(v9 + a1 - 8);
          do
          {
            int v14 = *((char *)&v38 + v13);
            if (v14 < 32 || v14 == 127 || *((unsigned char *)&v38 + v13) == 32) {
              *((unsigned char *)&v38 + v13) = 46;
            }
            ++v13;
          }
          while (v13 != 8);
          snprintf(__str, 0x20uLL, __format, &v40, &v38, v9);
          [v7 appendFormat:@"%s", __str];
        }
      }
      if (v9 + 8 >= a2)
      {
        [v7 appendFormat:@"%02x ", *(unsigned __int8 *)(a1 + v9++)];
      }
      else
      {
        uint64_t v15 = *(unsigned __int8 *)(a1 + v9);
        uint64_t v16 = *(unsigned __int8 *)(a1 + v9 + 1);
        if ((((_BYTE)v9 + 8) & 0xF) != 0) {
          snprintf(__str, 0x20uLL, "%02x %02x %02x %02x %02x %02x %02x %02x  ", v15, v16);
        }
        else {
          snprintf(__str, 0x20uLL, "%02x %02x %02x %02x %02x %02x %02x %02x    ", v15, v16);
        }
        [v7 appendFormat:@"%s", __str];
        v9 += 8;
      }
    }
    while (v9 < a2);
    uint64_t v17 = 16;
    if ((a2 & 0xF) != 0) {
      uint64_t v17 = a2 & 0xF;
    }
    if (a2 <= 0xF) {
      unint64_t v18 = a2;
    }
    else {
      unint64_t v18 = v17;
    }
    if (a2 >= 0x10 && (a2 & 0xF) == 0)
    {
      [v7 appendString:@"   "];
      uint64_t v19 = 0;
      uint64_t v42 = *(void *)(v9 + a1 - 16);
      do
      {
        int v20 = *((char *)&v42 + v19);
        if (v20 < 32 || v20 == 127 || *((unsigned char *)&v42 + v19) == 32) {
          *((unsigned char *)&v42 + v19) = 46;
        }
        ++v19;
      }
      while (v19 != 8);
      id v21 = +[NSString stringWithUTF8String:&v42];
      [v7 appendString:v21];

      [v7 appendString:@" "];
      uint64_t v22 = 0;
      uint64_t v42 = *(void *)(v9 + a1 - 8);
      do
      {
        int v23 = *((char *)&v42 + v22);
        if (v23 < 32 || v23 == 127 || *((unsigned char *)&v42 + v22) == 32) {
          *((unsigned char *)&v42 + v22) = 46;
        }
        ++v22;
      }
      while (v22 != 8);
LABEL_77:
      id v34 = +[NSString stringWithUTF8String:&v42];
      [v7 appendString:v34];

      goto LABEL_78;
    }
  }
  else
  {
    unint64_t v18 = 0;
    unint64_t v9 = 0;
  }
  uint64_t v24 = 3;
  if (v18 < 9) {
    uint64_t v24 = 4;
  }
  unint64_t v25 = 3 * (16 - v18) + v24;
  do
  {
    [v7 appendString:@" "];
    --v25;
  }
  while (v25);
  unint64_t v26 = v18 - 8;
  if (v18 >= 8)
  {
    uint64_t v29 = 0;
    uint64_t v42 = *(void *)(a1 + v9 - v18);
    do
    {
      int v30 = *((char *)&v42 + v29);
      if (v30 < 32 || v30 == 127 || *((unsigned char *)&v42 + v29) == 32) {
        *((unsigned char *)&v42 + v29) = 46;
      }
      ++v29;
    }
    while (v29 != 8);
  }
  else
  {
    __memcpy_chk();
    *((unsigned char *)&v42 + v18) = 0;
    if (v18)
    {
      uint64_t v27 = 0;
      do
      {
        int v28 = *((char *)&v42 + v27);
        if (v28 < 32 || v28 == 127 || *((unsigned char *)&v42 + v27) == 32) {
          *((unsigned char *)&v42 + v27) = 46;
        }
        ++v27;
      }
      while (v27 < v18);
    }
    unint64_t v26 = 0;
  }
  id v31 = +[NSString stringWithUTF8String:&v42];
  [v7 appendString:v31];

  if (v26)
  {
    [v7 appendString:@" "];
    __memcpy_chk();
    uint64_t v32 = 0;
    *((unsigned char *)&v42 + v26) = 0;
    do
    {
      int v33 = *((char *)&v42 + v32);
      if (v33 < 32 || v33 == 127 || *((unsigned char *)&v42 + v32) == 32) {
        *((unsigned char *)&v42 + v32) = 46;
      }
      ++v32;
    }
    while (v26 > v32);
    goto LABEL_77;
  }
LABEL_78:

  return v7;
}

void sub_100039A10()
{
  int v2 = 136315650;
  sub_10002F788();
  sub_10002F7B4((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
}

void sub_100039A84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039AFC(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = a1[2];
  int v5 = a1[3];
  int v6 = 136316162;
  id v7 = "-[FTABFile parseFileData]";
  __int16 v8 = 1024;
  int v9 = v2;
  __int16 v10 = 1024;
  int v11 = v3;
  __int16 v12 = 1024;
  int v13 = v4;
  __int16 v14 = 1024;
  int v15 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: File tag parse error (%02x %02x %02x %02x)", (uint8_t *)&v6, 0x24u);
}

void sub_100039BB0()
{
  sub_10002F7D4();
  sub_10002F7A4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
}

void sub_100039C34()
{
  v1[0] = 136315650;
  sub_10002F7D4();
  __int16 v2 = 2048;
  uint64_t v3 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Error parsing file offset list (offset=%u, length=%lu)", (uint8_t *)v1, 0x1Cu);
}

void sub_100039CC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039D3C()
{
  sub_10002F7A4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Cu);
}

void sub_100039E1C()
{
  int v2 = 136315650;
  sub_10002F788();
  sub_10002F7B4((void *)&_mh_execute_header, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
}

void sub_100039E90(void *a1)
{
  os_log_t v1 = [a1 path];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Unable to create file at %@", v4, v5, v6, v7, v8);
}

void sub_100039F14(void *a1)
{
  os_log_t v1 = [a1 path];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Unable to delete file at %@", v4, v5, v6, v7, v8);
}

void sub_100039F98(void *a1)
{
  os_log_t v1 = [a1 tag];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Failed to write '%@'", v4, v5, v6, v7, v8);
}

void sub_10003A01C(void *a1)
{
  os_log_t v1 = [a1 tag];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Failed to write '%@' header", v4, v5, v6, v7, v8);
}

void sub_10003A0A0(void *a1)
{
  os_log_t v1 = [a1 absoluteString];
  sub_10000CAE4();
  sub_10002F768((void *)&_mh_execute_header, v2, v3, "Failed to open file handle for writing to '%@'", v4, v5, v6, v7, v8);
}

uint64_t lzvn_decode_buffer(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (a3 <= a3 + a4 - 8) {
      __asm { BR              X17 }
    }
    __asm { BTI             j }
    return 0;
  }
  else
  {
    __asm { BTI             j }
    return 0;
  }
}

int32x4_t **lz4_encode_2gb(int32x4_t **result, uint64_t a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int32x4_t v7 = vdupq_n_s32(0xFFFFFFFF);
  uint8_t v8 = *result;
  int v9 = *a3;
  uint64_t v10 = (uint64_t)(*result)[-8].i64 + a2;
  if (v10 < (uint64_t)*result) {
    goto LABEL_92;
  }
  uint64_t v11 = (uint64_t)&v9[a5 - 128];
  if (v11 >= (uint64_t)v9)
  {
    do
    {
      __int16 v12 = v9;
      int v13 = &v9[-a4];
      while (1)
      {
        unint64_t v14 = *v12;
        int v15 = (int *)(a6 + 8 * ((-1640531535 * *v12) >> 20));
        int v16 = *v15;
        int v17 = v15[1];
        int *v15 = (int)v13;
        v15[1] = v14;
        unint64_t v18 = v14 >> 8;
        uint64_t v19 = (int *)(a6 + 8 * ((-1640531535 * (v14 >> 8)) >> 20));
        int v20 = *v19;
        int v21 = v19[1];
        *uint64_t v19 = v13 + 1;
        v19[1] = v14 >> 8;
        if (v14 == v17)
        {
          uint64_t v22 = (v13 - v16);
          if (v22 < 0x10000 && v22 != 0) {
            break;
          }
        }
        __int16 v12 = (void *)((char *)v12 + 1);
        uint64_t v24 = v13 + 1;
        unint64_t v25 = v14 >> 16;
        unint64_t v26 = (int *)(a6 + 8 * ((-1640531535 * v25) >> 20));
        int v27 = *v26;
        int v28 = v26[1];
        *unint64_t v26 = v24 + 1;
        v26[1] = v25;
        if (v18 == v21)
        {
          uint64_t v22 = (v24 - v20);
          if (v22 < 0x10000 && v24 != v20) {
            break;
          }
        }
        __int16 v12 = (void *)((char *)v12 + 1);
        int v30 = v24 + 1;
        unint64_t v31 = v25 >> 8;
        uint64_t v32 = (int *)(a6 + 8 * ((-1640531535 * (v25 >> 8)) >> 20));
        int v33 = *v32;
        int v34 = v32[1];
        int *v32 = v30 + 1;
        v32[1] = v25 >> 8;
        if (v25 == v28)
        {
          uint64_t v22 = (v30 - v27);
          if (v22 < 0x10000 && v30 != v27) {
            break;
          }
        }
        __int16 v12 = (void *)((char *)v12 + 1);
        id v36 = v30 + 1;
        unint64_t v37 = v25 >> 16;
        uint64_t v38 = (int *)(a6 + 8 * ((-1640531535 * v37) >> 20));
        int v39 = *v38;
        int v40 = v38[1];
        int *v38 = v36 + 1;
        v38[1] = v37;
        if (v31 == v34)
        {
          uint64_t v22 = (v36 - v33);
          if (v22 < 0x10000 && v36 != v33) {
            break;
          }
        }
        __int16 v12 = (void *)((char *)v12 + 1);
        uint64_t v42 = v36 + 1;
        if (v37 == v40)
        {
          uint64_t v22 = (v42 - v39);
          if (v22 < 0x10000 && v42 != v39) {
            break;
          }
        }
        __int16 v12 = (void *)((char *)v12 + 1);
        int v13 = v42 + 1;
        if ((unint64_t)v12 >= v11) {
          goto LABEL_74;
        }
      }
      long long v44 = (char *)v12 + 4;
      long long v45 = (void *)((char *)v12 - v22 + 4);
      while (1)
      {
        uint64_t v47 = *(void *)v44;
        v44 += 8;
        uint64_t v46 = v47;
        uint64_t v49 = *v45++;
        uint64_t v48 = v49;
        if (v46 != v49) {
          break;
        }
        if ((unint64_t)v44 >= v11) {
          goto LABEL_38;
        }
      }
      long long v44 = &v44[(__clz(__rbit64(v46 ^ v48)) >> 3) - 8];
LABEL_38:
      long long v50 = (char *)v12 - v22;
      while (1)
      {
        BOOL v51 = (uint64_t)v12 <= (uint64_t)v9 || (uint64_t)v50 <= a4;
        if (v51) {
          break;
        }
        int v53 = *((unsigned __int8 *)v12 - 1);
        __int16 v12 = (void *)((char *)v12 - 1);
        int v52 = v53;
        int v54 = *--v50;
        if (v52 != v54)
        {
          __int16 v12 = (void *)((char *)v12 + 1);
          break;
        }
      }
      unint64_t v55 = v44 - (char *)v12 - 4;
      uint64_t v56 = (char *)v12 - v9;
      unint64_t v57 = (char *)v12 - v9 + 3;
      unint64_t v58 = v10 - (void)v8 - v57;
      if (v10 - (uint64_t)v8 < v57) {
        goto LABEL_92;
      }
      __int8 v59 = (v55 & 0xF) + 16 * v56;
      long long v60 = (int32x4_t *)&v8->i8[1];
      if ((unint64_t)v56 >= 0xF)
      {
        v59 |= 0xF0u;
        unint64_t v61 = v56 - 15;
        BOOL v62 = v58-- != 0;
        if (!v62) {
          goto LABEL_92;
        }
        if (v61 >= 0xFF)
        {
          unint64_t v63 = v61 / 0xFFuLL;
          BOOL v62 = v58 >= v63;
          v58 -= v63;
          if (!v62) {
            goto LABEL_92;
          }
          LOBYTE(v61) = v61 + v63;
          do
          {
            *v60++ = v7;
            BOOL v51 = v63 > 0x10;
            v63 -= 16;
          }
          while (v51);
          long long v60 = (int32x4_t *)((char *)v60 + v63);
        }
        v60->i8[0] = v61;
        long long v60 = (int32x4_t *)((char *)v60 + 1);
      }
      do
      {
        int32x4_t v64 = *(int32x4_t *)v9;
        v9 += 16;
        *v60++ = v64;
        BOOL v51 = v56 <= 16;
        v56 -= 16;
      }
      while (!v51);
      long long v65 = (__int16 *)((char *)v60->i16 + v56);
      *long long v65 = v22;
      long long v66 = (int32x4_t *)(v65 + 1);
      if (v55 >= 0xF)
      {
        v59 |= 0xFu;
        unint64_t v67 = v44 - (char *)v12 - 19;
        BOOL v62 = v58 != 0;
        unint64_t v68 = v58 - 1;
        if (!v62) {
          goto LABEL_92;
        }
        if (v67 >= 0xFF)
        {
          unint64_t v69 = v67 / 0xFFuLL;
          if (v68 < v69) {
            goto LABEL_92;
          }
          LOBYTE(v67) = v67 + v69;
          do
          {
            *v66++ = v7;
            BOOL v51 = v69 > 0x10;
            v69 -= 16;
          }
          while (v51);
          long long v66 = (int32x4_t *)((char *)v66 + v69);
        }
        v66->i8[0] = v67;
        long long v66 = (int32x4_t *)((char *)v66 + 1);
      }
      v8->i8[0] = v59;
      uint8_t v8 = v66;
      int v9 = v44;
    }
    while ((uint64_t)v44 < v11 && (uint64_t)v66 < v10);
  }
LABEL_74:
  if (a7) {
    goto LABEL_92;
  }
  long long v71 = (char *)(v11 + 128);
  uint64_t v72 = v71 - v9;
  if (v71 == v9) {
    goto LABEL_92;
  }
  uint64_t v73 = v10 + 128 - (void)v8 - 1;
  BOOL v51 = v73 <= v72;
  uint64_t v74 = v73 - v72;
  if (v51) {
    goto LABEL_92;
  }
  if (v72 < 15)
  {
    v8->i8[0] = 16 * v72;
    uint8_t v8 = (int32x4_t *)((char *)v8 + 1);
    do
    {
LABEL_91:
      __int8 v81 = *v9++;
      v8->i8[0] = v81;
      uint8_t v8 = (int32x4_t *)((char *)v8 + 1);
    }
    while (v9 < v71);
    goto LABEL_92;
  }
  uint64_t v75 = v74 - 1;
  if (v75 >= 0)
  {
    v8->i8[0] = -16;
    uint64_t v76 = (int32x4_t *)&v8->i8[1];
    unsigned int v77 = v72 - 15;
    if ((unint64_t)(v72 - 15) >= 0xFF)
    {
      int64_t v78 = v77 / 0xFFuLL;
      if (v75 - v78 < 0)
      {
        uint8_t v8 = (int32x4_t *)((char *)v76 - 1);
        goto LABEL_92;
      }
      LOBYTE(v77) = v77 + v78;
      do
      {
        *v76++ = v7;
        BOOL v51 = v78 <= 16;
        v78 -= 16;
      }
      while (!v51);
      uint64_t v76 = (int32x4_t *)((char *)v76 + v78);
    }
    v76->i8[0] = v77;
    uint8_t v8 = (int32x4_t *)&v76->i8[1];
    uint64_t v79 = (unint64_t)v72 >> 4;
    if (!((unint64_t)v72 >> 4)) {
      goto LABEL_91;
    }
    do
    {
      int32x4_t v80 = *(int32x4_t *)v9;
      v9 += 16;
      *v8++ = v80;
      BOOL v51 = v79-- <= 1;
    }
    while (!v51);
    if (v9 < v71) {
      goto LABEL_91;
    }
  }
LABEL_92:
  const char *result = v8;
  *a3 = v9;
  return result;
}

uint64_t lz4_decode_asm(int8x16_t **a1, unint64_t a2, unint64_t a3, unsigned __int8 **a4, unint64_t a5)
{
  uint64_t v5 = *a4;
  uint64_t v6 = *a1;
  while (1)
  {
    int32x4_t v7 = v6;
    uint8_t v8 = v5;
    if ((unint64_t)v5 >= a5 || (unint64_t)v6 >= a3) {
      break;
    }
    unsigned int v10 = *v5;
    int v9 = v5 + 1;
    unint64_t v11 = (unint64_t)v10 >> 4;
    unint64_t v12 = (v10 & 0xF) + 4;
    if (v11 > 0xE)
    {
      while ((unint64_t)v9 < a5)
      {
        unsigned int v13 = *(unsigned __int8 *)v9;
        int v9 = (_OWORD *)((char *)v9 + 1);
        v11 += v13;
        if (v13 != 255)
        {
          unint64_t v14 = (int8x16_t *)v9;
          int v15 = v6;
          int v16 = (unsigned __int16 *)((char *)v9 + v11);
          int v17 = (int8x16_t *)((char *)v6 + v11);
          if ((unint64_t)v16 < a5 && (unint64_t)v17 < a3)
          {
            int8x16_t v19 = *v14;
            int8x16_t v20 = v14[1];
            unint64_t v18 = v14 + 2;
            int8x16_t *v15 = v19;
            v15[1] = v20;
            int v21 = v15 + 2;
            do
            {
              int8x16_t v22 = *v18;
              int8x16_t v23 = v18[1];
              v18 += 2;
              *int v21 = v22;
              v21[1] = v23;
              v21 += 2;
            }
            while (v17 > v21);
            goto LABEL_13;
          }
          goto LABEL_36;
        }
      }
      break;
    }
    *uint64_t v6 = *(int8x16_t *)v9;
    int v16 = (unsigned __int16 *)((char *)v9 + v11);
    int v17 = (int8x16_t *)((char *)v6 + v11);
LABEL_13:
    if ((unint64_t)v16 >= a5) {
      break;
    }
    unsigned int v25 = *v16;
    uint64_t v5 = (unsigned __int8 *)(v16 + 1);
    unint64_t v24 = v25;
    if (!v25 || (unint64_t v26 = (int8x16_t *)((char *)v17 - v24), (unint64_t)v17 - v24 < a2))
    {
      uint64_t v47 = -1;
      goto LABEL_37;
    }
    int v27 = v17;
    uint64_t v6 = (int8x16_t *)((char *)v17 + v12);
    if (v12 == 19)
    {
      while ((unint64_t)v5 < a5)
      {
        unsigned int v28 = *v5++;
        uint64_t v6 = (int8x16_t *)((char *)v6 + v28);
        if (v28 != 255)
        {
          if ((unint64_t)v6 >= a3) {
            goto LABEL_36;
          }
          goto LABEL_24;
        }
      }
      break;
    }
    if (v12 > 0x10)
    {
LABEL_24:
      if (v24 > 0x1F)
      {
        int8x16_t v36 = *v26;
        id v35 = v26 + 1;
        *int v27 = v36;
        unint64_t v37 = v27 + 1;
        do
        {
          int8x16_t v38 = *v35;
          int8x16_t v39 = v35[1];
          v35 += 2;
          *unint64_t v37 = v38;
          v37[1] = v39;
          v37 += 2;
        }
        while (v6 > v37);
      }
      else if (v24 > 0xF)
      {
        int8x16_t v41 = *v26;
        int v40 = v26 + 1;
        *int v27 = v41;
        uint64_t v42 = v27 + 1;
        do
        {
          int8x16_t v44 = *v40;
          char v43 = v40 + 1;
          *uint64_t v42 = v44;
          long long v45 = v42 + 1;
          int8x16_t v46 = *v43;
          int v40 = v43 + 1;
          *long long v45 = v46;
          uint64_t v42 = v45 + 1;
        }
        while (v6 > v42);
      }
      else
      {
        uint64_t v29 = (int8x16_t *)&qword_10003D040[4 * v24];
        int8x16_t v30 = vqtbl1q_s8(*v26, *v29);
        int8x16_t v31 = vqtbl1q_s8(*v26, v29[1]);
        uint64_t v32 = *((unsigned __int8 *)qword_10003D240 + v24);
        *int v27 = v30;
        v27[1] = v31;
        int v33 = (int8x16_t *)((char *)v27 + v32);
        do
        {
          int8x16_t *v33 = v30;
          v33[1] = v31;
          int v34 = (int8x16_t *)((char *)v33 + v32);
          int8x16_t *v34 = v30;
          v34[1] = v31;
          int v33 = (int8x16_t *)((char *)v34 + v32);
        }
        while (v6 > v33);
      }
    }
    else if (v24 <= 0xF)
    {
      *int v27 = vqtbl1q_s8(*v26, *(int8x16_t *)&qword_10003D040[4 * v24]);
    }
    else
    {
      *int v27 = *v26;
    }
  }
LABEL_36:
  uint64_t v47 = 0;
LABEL_37:
  *a4 = v8;
  *a1 = v7;
  return v47;
}

uint64_t lzfse_decode_lmd(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 24);
  uint64_t v2 = (uint64_t *)(*(void *)a1 + *(int *)(a1 + 120));
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(unsigned int *)(a1 + 112);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  unint64_t v6 = *(unsigned int *)(a1 + 88);
  unint64_t v7 = *(unsigned int *)(a1 + 92);
  unint64_t v8 = *(unsigned int *)(a1 + 96);
  unint64_t v9 = *(unsigned __int16 *)(a1 + 124);
  unint64_t v10 = *(unsigned __int16 *)(a1 + 126);
  unint64_t v11 = *(unsigned __int16 *)(a1 + 128);
  uint64_t v12 = *(void *)(a1 + 40) - (void)v1 - 32;
  unsigned int v13 = *(char **)(a1 + 80);
  if (v6 | v7) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 72))
  {
    while (1)
    {
      uint64_t v2 = (uint64_t *)((char *)v2 - ((unint64_t)(63 - v4) >> 3));
      if ((unint64_t)v2 < *(void *)(a1 + 8)) {
        return -3;
      }
      uint64_t v3 = *v2;
      unint64_t v14 = (unsigned __int8 *)(a1 + 136 + 8 * v9);
      uint64_t v15 = *v14;
      uint64_t v16 = v4 + ((63 - v4) & 0xFFFFFFFFFFFFFFF8) - v15;
      unint64_t v17 = (unint64_t)*v2 >> v16;
      unint64_t v18 = v17 & ~(-1 << v15);
      LOBYTE(v15) = v14[1];
      unint64_t v9 = (v18 >> v15) + *((unsigned __int16 *)v14 + 1);
      unint64_t v6 = (v17 & ~(-1 << v15)) + *((unsigned int *)v14 + 1);
      int8x16_t v19 = (unsigned __int8 *)(a1 + 648 + 8 * v10);
      uint64_t v20 = *v19;
      uint64_t v21 = v16 - v20;
      unint64_t v22 = (unint64_t)*v2 >> v21;
      unint64_t v23 = v22 & ~(-1 << v20);
      LOBYTE(v20) = v19[1];
      unint64_t v10 = (v23 >> v20) + *((unsigned __int16 *)v19 + 1);
      unint64_t v7 = (v22 & ~(-1 << v20)) + *((unsigned int *)v19 + 1);
      unint64_t v24 = (unsigned __int8 *)(a1 + 1160 + 8 * v11);
      uint64_t v25 = *v24;
      uint64_t v4 = v21 - v25;
      unint64_t v26 = (unint64_t)*v2 >> v4;
      unint64_t v27 = v26 & ~(-1 << v25);
      LOBYTE(v25) = v24[1];
      unint64_t v11 = (v27 >> v25) + *((unsigned __int16 *)v24 + 1);
      uint64_t v28 = (v26 & ~(-1 << v25)) + *((unsigned int *)v24 + 1);
      if (v28) {
        unint64_t v8 = v28;
      }
      --v5;
LABEL_7:
      if (v8 > (unint64_t)v1 + v6 - *(void *)(a1 + 32)
        || a1 + *(unsigned int *)(a1 + 7304) + 7308 < (uint64_t)&v13[v6])
      {
        return -3;
      }
      BOOL v29 = v12 < (uint64_t)(v6 + v7);
      v12 -= v6 + v7;
      if (v29)
      {
        uint64_t v40 = v12 + v6 + v7 + 32;
        if (v6)
        {
          do
          {
            BOOL v41 = v40-- != 0;
            if (!v41) {
              goto LABEL_30;
            }
            char v42 = *v13++;
            *(unsigned char *)os_log_t v1 = v42;
            os_log_t v1 = (void *)((char *)v1 + 1);
          }
          while (--v6);
        }
        if (v7)
        {
          char v43 = (char *)v1 - v8;
          while (1)
          {
            BOOL v41 = v40-- != 0;
            if (!v41) {
              break;
            }
            char v44 = *v43++;
            *(unsigned char *)os_log_t v1 = v44;
            os_log_t v1 = (void *)((char *)v1 + 1);
            if (!--v7) {
              goto LABEL_28;
            }
          }
LABEL_30:
          *(void *)(a1 + 24) = v1;
          *(void *)(a1 + 120) = (char *)v2 - *(void *)a1;
          *(void *)(a1 + 104) = v3;
          *(_DWORD *)(a1 + 112) = v4;
          *(_DWORD *)(a1 + 72) = v5;
          *(_DWORD *)(a1 + 88) = v6;
          *(_DWORD *)(a1 + 92) = v7;
          *(_DWORD *)(a1 + 96) = v8;
          *(_WORD *)(a1 + 124) = v9;
          *(_WORD *)(a1 + 126) = v10;
          *(_WORD *)(a1 + 128) = v11;
          *(void *)(a1 + 80) = v13;
          return -2;
        }
LABEL_28:
        uint64_t v12 = v40 - 32;
        if (!v5) {
          goto LABEL_29;
        }
      }
      else
      {
        do
        {
          uint64_t v30 = *(void *)v13;
          uint64_t v31 = *((void *)v13 + 1);
          v13 += 16;
          *os_log_t v1 = v30;
          v1[1] = v31;
          v1 += 2;
          BOOL v29 = v6 > 0x10;
          v6 -= 16;
        }
        while (v29);
        uint64_t v32 = (int8x16_t *)((char *)v1 + v6);
        v13 += v6;
        int v33 = (int8x16_t *)((char *)v32 - v8);
        if (v8 < 0x10)
        {
          int8x16_t v36 = (int8x16_t *)((char *)&unk_100051230 + 32 * v8);
          unint64_t v37 = byte_100051430[v8];
          int8x16_t v38 = vqtbl1q_s8(*v33, *v36);
          int8x16_t v39 = vqtbl1q_s8(*v33, v36[1]);
          do
          {
            int8x16_t *v32 = v38;
            v32[1] = v39;
            uint64_t v32 = (int8x16_t *)((char *)v32 + v37);
            BOOL v29 = v7 > v37;
            v7 -= v37;
          }
          while (v29);
          os_log_t v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5) {
            goto LABEL_29;
          }
        }
        else
        {
          do
          {
            uint64_t v34 = v33->i64[0];
            uint64_t v35 = v33->i64[1];
            ++v33;
            v32->i64[0] = v34;
            v32->i64[1] = v35;
            ++v32;
            BOOL v29 = v7 > 0x10;
            v7 -= 16;
          }
          while (v29);
          os_log_t v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5) {
            goto LABEL_29;
          }
        }
      }
    }
  }
  else
  {
LABEL_29:
    *(void *)(a1 + 24) = v1;
    return 0;
  }
}

uint64_t lzfse_decode_literals(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, unint64_t a6, double a7)
{
  uint64_t v7 = LOWORD(a7);
  uint64_t v8 = WORD1(a7);
  uint64_t v9 = WORD2(a7);
  uint64_t v10 = HIWORD(a7);
  unint64_t v12 = *(void *)a4;
  int v13 = *(_DWORD *)(a4 + 8);
  unint64_t v14 = *a5;
  while (1)
  {
    unsigned int v15 = *(_DWORD *)(a2 + 4 * v7);
    unsigned int v16 = *(_DWORD *)(a2 + 4 * v8);
    unsigned int v17 = *(_DWORD *)(a2 + 4 * v9);
    unsigned int v18 = *(_DWORD *)(a2 + 4 * v10);
    *a1++ = (v16 & 0xFF00)
          + ((unsigned __int16)(v15 & 0xFF00) >> 8)
          + (((v18 & 0xFF00) + ((unsigned __int16)(v17 & 0xFF00) >> 8)) << 16);
    unint64_t v19 = (63 - v13) & 0xFFFFFFF8;
    if (((63 - v13) & 0xFFFFFFF8) != 0) {
      break;
    }
LABEL_5:
    uint64_t v20 = v13 - v15;
    uint64_t v21 = v20 - v16;
    unint64_t v22 = v12 >> (v13 - v15);
    unint64_t v23 = v12 & qword_10003D620[v20];
    uint64_t v24 = v21 - v17;
    uint64_t v7 = v22 + HIWORD(v15);
    unint64_t v25 = v23 >> (v20 - v16);
    unint64_t v26 = v23 & qword_10003D620[v21];
    int v13 = v24 - v18;
    uint64_t v8 = v25 + HIWORD(v16);
    unint64_t v27 = v26 >> (v21 - v17);
    unint64_t v28 = v26 & qword_10003D620[v24];
    uint64_t v9 = v27 + HIWORD(v17);
    unint64_t v29 = v28 >> (v24 - v18);
    unint64_t v12 = v28 & qword_10003D620[v13];
    uint64_t v10 = v29 + HIWORD(v18);
    BOOL v30 = a3 <= 4;
    a3 -= 4;
    if (v30)
    {
      *(void *)a4 = v12;
      *(_DWORD *)(a4 + 8) = v13;
      *a5 = v14;
      return 0;
    }
  }
  unint64_t v14 = (void *)((char *)v14 - (v19 >> 3));
  if ((unint64_t)v14 >= a6)
  {
    v13 += v19;
    unint64_t v12 = (v12 << v19) | *v14 & qword_10003D620[v19];
    goto LABEL_5;
  }
  return -3;
}

void sub_10003D828(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_10003D8A0()
{
  sub_100005DD0();
  sub_100005DB4((void *)&_mh_execute_header, v0, v1, "aks_sik_attest failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003D908()
{
  sub_100005DD0();
  sub_100005DB4((void *)&_mh_execute_header, v0, v1, "aks_ref_key_sign failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003D970(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D9A8()
{
  sub_100005DD0();
  sub_100005DB4((void *)&_mh_execute_header, v0, v1, "aks_ref_key_verify_sig failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003DA10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DA48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DA80()
{
  sub_100005DD0();
  sub_100005DB4((void *)&_mh_execute_header, v0, v1, "aks_ref_key_create failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003DAE8()
{
  sub_100005DD0();
  sub_100005DB4((void *)&_mh_execute_header, v0, v1, "aks_params_get_der failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003DB50()
{
  sub_100005DD0();
  sub_100005DB4((void *)&_mh_execute_header, v0, v1, "aks_params_set_number failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003DBB8()
{
  sub_100005DD0();
  sub_100005DB4((void *)&_mh_execute_header, v0, v1, "aks_ref_key_create_with_blob failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003DC20(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DC8C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported strong component", buf, 2u);
}

void sub_10003DCCC()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Missing key blob", v2, v3, v4, v5, v6);
}

void sub_10003DD00()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Empty payload", v2, v3, v4, v5, v6);
}

void sub_10003DD34()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Create RIK failed", v2, v3, v4, v5, v6);
}

void sub_10003DD68()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Get digest failed", v2, v3, v4, v5, v6);
}

void sub_10003DD9C()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Missing RIK", v2, v3, v4, v5, v6);
}

void sub_10003DDD0()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Failed to get attestation", v2, v3, v4, v5, v6);
}

void sub_10003DE04()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Failed to get pub key", v2, v3, v4, v5, v6);
}

void sub_10003DE38(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DEA4()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Empty request", v2, v3, v4, v5, v6);
}

void sub_10003DED8()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Empty configuration", v2, v3, v4, v5, v6);
}

void sub_10003DF0C()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Empty session", v2, v3, v4, v5, v6);
}

void sub_10003DF40()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "No baa certs found", v2, v3, v4, v5, v6);
}

void sub_10003DF74()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "No User-Agent", v2, v3, v4, v5, v6);
}

void sub_10003DFA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E014()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Failed to find version info", v2, v3, v4, v5, v6);
}

void sub_10003E048(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"/var/hardware/Pearl";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to delete directory %@, error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10003E0D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E140(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E1AC()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Get osBootHash failed", v2, v3, v4, v5, v6);
}

void sub_10003E1E0()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Get prebootPath failed", v2, v3, v4, v5, v6);
}

void sub_10003E214()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Get customAMAuthInstallRef failed", v2, v3, v4, v5, v6);
}

void sub_10003E248()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Create optionsDict failed", v2, v3, v4, v5, v6);
}

void sub_10003E27C()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Create updaterOptions failed", v2, v3, v4, v5, v6);
}

void sub_10003E2B0()
{
  sub_10000AD6C(__stack_chk_guard);
  sub_10000AD60();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "Failed to create SavageUpdater: %@", v2, v3, v4, v5, v6);
}

void sub_10003E318()
{
  sub_10000AD6C(__stack_chk_guard);
  sub_10000AD60();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "SavageUpdaterExecCommand failed: %@", v2, v3, v4, v5, v6);
}

void sub_10003E380()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Get Brunor ticket failed", v2, v3, v4, v5, v6);
}

void sub_10003E3B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E420()
{
  sub_10000AD6C(__stack_chk_guard);
  sub_10000AD60();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "SavageUpdater failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_10003E488()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Get Yonkers ticket failed", v2, v3, v4, v5, v6);
}

void sub_10003E4BC()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Failed to enable SSO", v2, v3, v4, v5, v6);
}

void sub_10003E4F0()
{
  sub_10000AD6C(__stack_chk_guard);
  sub_10000AD60();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "Failed to get local psd3, error: %@", v2, v3, v4, v5, v6);
}

void sub_10003E558(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to verify psd3, pearlStatus: %d", (uint8_t *)v2, 8u);
}

void sub_10003E5D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to setup FS for repair", v1, 2u);
}

void sub_10003E614(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E680(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E6EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E758(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to setup alternative FDR path", v1, 2u);
}

void sub_10003E79C()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Invalid action", v2, v3, v4, v5, v6);
}

void sub_10003E7D0()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Invalid daemon label", v2, v3, v4, v5, v6);
}

void sub_10003E804()
{
  sub_10000CAE4();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "Missing entitlement for controlling daemon %@", v2, v3, v4, v5, v6);
}

void sub_10003E86C()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Invalid domain name", v2, v3, v4, v5, v6);
}

void sub_10003E8A0()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Invalid preference key", v2, v3, v4, v5, v6);
}

void sub_10003E8D4()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Invalid preference value", v2, v3, v4, v5, v6);
}

void sub_10003E908()
{
  sub_10000CAE4();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "Missing entitlement for accessing defaults of domain %@", v2, v3, v4, v5, v6);
}

void sub_10003E970()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Failed to find libxpc API", v2, v3, v4, v5, v6);
}

void sub_10003E9A4()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Unsupported action", v2, v3, v4, v5, v6);
}

void sub_10003E9D8()
{
  sub_10000CAE4();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_10000CAF0((void *)&_mh_execute_header, v0, v1, "%s: error %lld", v2, v3);
}

void sub_10003EA4C()
{
  sub_10000CAE4();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_10000CAF0((void *)&_mh_execute_header, v1, v2, "%s service already %s", v3, v4);
}

void sub_10003EADC()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "dlopen failed", v2, v3, v4, v5, v6);
}

void sub_10003EB10()
{
  sub_10000CAE4();
  sub_1000085F4((void *)&_mh_execute_header, v0, v1, "dlsym(%s) failed", v2, v3, v4, v5, v6);
}

void sub_10003EB78(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to read asset %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10003EC2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get delta components: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003ECA4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SSR not supported", v1, 2u);
}

void sub_10003ECE8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 statusCode];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "8262 failed with statusCode: %@, continue to run the following testIDs", (uint8_t *)&v4, 0xCu);
}

void sub_10003ED80()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Test sequencer is already running", v2, v3, v4, v5, v6);
}

void sub_10003EDB4()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "No running test found", v2, v3, v4, v5, v6);
}

void sub_10003EDE8()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "No test result", v2, v3, v4, v5, v6);
}

void sub_10003EE1C()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Invalid test result", v2, v3, v4, v5, v6);
}

void sub_10003EE50()
{
  sub_1000085E8();
  sub_100005DDC((void *)&_mh_execute_header, v0, v1, "Test result is not for the running test", v2, v3, v4, v5, v6);
}

void sub_10003EE84()
{
  __assert_rtn("_AMAuthInstallFinalize", "AMAuthInstall.c", 686, "type != NULL");
}

void sub_10003EEB0()
{
  __assert_rtn("_AMAuthInstallCopyFormattingDescription", "AMAuthInstall.c", 741, "type != NULL");
}

void sub_10003EEDC()
{
  sub_10000CAE4();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%{public}s", v1, 0xCu);
}

void sub_10003EF50()
{
  sub_10000CAE4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s", v1, 0xCu);
}

void sub_10003EFC4()
{
  sub_10000CAE4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%{public}s", v1, 0xCu);
}

void sub_10003F038()
{
  sub_10000CAE4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s", v1, 0xCu);
}

void sub_10003F0AC()
{
  __assert_rtn("_AMAuthInstallPlatformTempDirURLInitialize", "AMAuthInstallPlatform.c", 714, "_tempDirURL != NULL");
}

uint64_t AMFDRRegisterModuleChallengeCallback()
{
  return _AMFDRRegisterModuleChallengeCallback();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return _AMFDRSealingManifestCopyLocalDataForClass();
}

uint64_t AMFDRSealingMapCopyAssemblyIdentifierForClass()
{
  return _AMFDRSealingMapCopyAssemblyIdentifierForClass();
}

uint64_t AMSupportHttpSendSync()
{
  return _AMSupportHttpSendSync();
}

uint64_t AMSupportSafeRelease()
{
  return _AMSupportSafeRelease();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA384_Final(md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA384_Init(c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA384_Update(c, data, len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA512_Final(md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA512_Init(c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA512_Update(c, data, len);
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

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
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

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
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

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return _CFHTTPMessageCreateRequest(alloc, requestMethod, url, httpVersion);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
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

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
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

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return _CFURLCopyScheme(anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return _CFURLGetTypeID();
}

uint64_t DEREncoderAddData()
{
  return _DEREncoderAddData();
}

uint64_t DEREncoderAddPrivateFromEncoder()
{
  return _DEREncoderAddPrivateFromEncoder();
}

uint64_t DEREncoderAddSetFromEncoder()
{
  return _DEREncoderAddSetFromEncoder();
}

uint64_t DEREncoderAddUInt32()
{
  return _DEREncoderAddUInt32();
}

uint64_t DEREncoderAddUInt64()
{
  return _DEREncoderAddUInt64();
}

uint64_t DEREncoderCreate()
{
  return _DEREncoderCreate();
}

uint64_t DEREncoderCreateEncodedBuffer()
{
  return _DEREncoderCreateEncodedBuffer();
}

uint64_t DEREncoderDestroy()
{
  return _DEREncoderDestroy();
}

uint64_t DeviceIdentityCreateClientCertificateRequest()
{
  return _DeviceIdentityCreateClientCertificateRequest();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SavageUpdaterCreate()
{
  return _SavageUpdaterCreate();
}

uint64_t SavageUpdaterExecCommand()
{
  return _SavageUpdaterExecCommand();
}

uint64_t SavageUpdaterIsDone()
{
  return _SavageUpdaterIsDone();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

uint64_t cc_clear()
{
  return _cc_clear();
}

uint64_t ccder_blob_decode_len()
{
  return _ccder_blob_decode_len();
}

uint64_t ccder_blob_decode_range()
{
  return _ccder_blob_decode_range();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return _ccder_blob_decode_sequence_tl();
}

uint64_t ccder_blob_decode_tag()
{
  return _ccder_blob_decode_tag();
}

uint64_t ccder_blob_decode_tl()
{
  return _ccder_blob_decode_tl();
}

uint64_t ccder_blob_encode_body()
{
  return _ccder_blob_encode_body();
}

uint64_t ccder_blob_encode_tl()
{
  return _ccder_blob_encode_tl();
}

uint64_t ccder_decode_tl()
{
  return _ccder_decode_tl();
}

uint64_t ccder_sizeof()
{
  return _ccder_sizeof();
}

uint64_t ccec_compact_import_pub()
{
  return _ccec_compact_import_pub();
}

uint64_t ccec_cp_256()
{
  return _ccec_cp_256();
}

uint64_t ccec_cp_384()
{
  return _ccec_cp_384();
}

uint64_t ccec_export_pub()
{
  return _ccec_export_pub();
}

uint64_t ccec_import_pub()
{
  return _ccec_import_pub();
}

uint64_t ccec_verify()
{
  return _ccec_verify();
}

uint64_t cced25519_verify()
{
  return _cced25519_verify();
}

uint64_t ccsha512_di()
{
  return _ccsha512_di();
}

uint64_t cczp_bitlen()
{
  return _cczp_bitlen();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

fstab *__cdecl getfsfile(const char *a1)
{
  return _getfsfile(a1);
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
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

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
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

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

id objc_msgSend_PrCL(void *a1, const char *a2, ...)
{
  return [a1 PrCL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__componentNameSuffix(void *a1, const char *a2, ...)
{
  return [a1 _componentNameSuffix];
}

id objc_msgSend__propertyNameSuffix(void *a1, const char *a2, ...)
{
  return [a1 _propertyNameSuffix];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHTTPHeaderFields];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return [a1 asDictionary];
}

id objc_msgSend_attestationBlob(void *a1, const char *a2, ...)
{
  return [a1 attestationBlob];
}

id objc_msgSend_boardID(void *a1, const char *a2, ...)
{
  return [a1 boardID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootNonce(void *a1, const char *a2, ...)
{
  return [a1 bootNonce];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_byteString(void *a1, const char *a2, ...)
{
  return [a1 byteString];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_char1(void *a1, const char *a2, ...)
{
  return [a1 char1];
}

id objc_msgSend_char2(void *a1, const char *a2, ...)
{
  return [a1 char2];
}

id objc_msgSend_char3(void *a1, const char *a2, ...)
{
  return [a1 char3];
}

id objc_msgSend_char4(void *a1, const char *a2, ...)
{
  return [a1 char4];
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return [a1 chipID];
}

id objc_msgSend_cleanupFileSystemForRepair(void *a1, const char *a2, ...)
{
  return [a1 cleanupFileSystemForRepair];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configureDataWriteDestination(void *a1, const char *a2, ...)
{
  return [a1 configureDataWriteDestination];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_create(void *a1, const char *a2, ...)
{
  return [a1 create];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataLength(void *a1, const char *a2, ...)
{
  return [a1 dataLength];
}

id objc_msgSend_dataPointer(void *a1, const char *a2, ...)
{
  return [a1 dataPointer];
}

id objc_msgSend_decompressPearlFrames(void *a1, const char *a2, ...)
{
  return [a1 decompressPearlFrames];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceSupportsRepairBootIntent(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsRepairBootIntent];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return [a1 digest];
}

id objc_msgSend_doRetry(void *a1, const char *a2, ...)
{
  return [a1 doRetry];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dumpString(void *a1, const char *a2, ...)
{
  return [a1 dumpString];
}

id objc_msgSend_ecID(void *a1, const char *a2, ...)
{
  return [a1 ecID];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_expandSuperBinary(void *a1, const char *a2, ...)
{
  return [a1 expandSuperBinary];
}

id objc_msgSend_expandTLVs(void *a1, const char *a2, ...)
{
  return [a1 expandTLVs];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_factoryServiceOn(void *a1, const char *a2, ...)
{
  return [a1 factoryServiceOn];
}

id objc_msgSend_generatePersonalizedSuperBinary(void *a1, const char *a2, ...)
{
  return [a1 generatePersonalizedSuperBinary];
}

id objc_msgSend_generateRequestDictionary(void *a1, const char *a2, ...)
{
  return [a1 generateRequestDictionary];
}

id objc_msgSend_generateTLV(void *a1, const char *a2, ...)
{
  return [a1 generateTLV];
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return [a1 generation];
}

id objc_msgSend_getDefaultAMAuthInstallRef(void *a1, const char *a2, ...)
{
  return [a1 getDefaultAMAuthInstallRef];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hasMesa(void *a1, const char *a2, ...)
{
  return [a1 hasMesa];
}

id objc_msgSend_hasMesaDelta(void *a1, const char *a2, ...)
{
  return [a1 hasMesaDelta];
}

id objc_msgSend_initFile(void *a1, const char *a2, ...)
{
  return [a1 initFile];
}

id objc_msgSend_initTestSequence(void *a1, const char *a2, ...)
{
  return [a1 initTestSequence];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFileExistsError(void *a1, const char *a2, ...)
{
  return [a1 isFileExistsError];
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return [a1 isRequired];
}

id objc_msgSend_isSSRBootIntentSet(void *a1, const char *a2, ...)
{
  return [a1 isSSRBootIntentSet];
}

id objc_msgSend_keyBlob(void *a1, const char *a2, ...)
{
  return [a1 keyBlob];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastRunTestId(void *a1, const char *a2, ...)
{
  return [a1 lastRunTestId];
}

id objc_msgSend_lastRunTestIndex(void *a1, const char *a2, ...)
{
  return [a1 lastRunTestIndex];
}

id objc_msgSend_lastTestStatusCode(void *a1, const char *a2, ...)
{
  return [a1 lastTestStatusCode];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_life(void *a1, const char *a2, ...)
{
  return [a1 life];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longname(void *a1, const char *a2, ...)
{
  return [a1 longname];
}

id objc_msgSend_magic(void *a1, const char *a2, ...)
{
  return [a1 magic];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return [a1 majorVersion];
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return [a1 manifest];
}

id objc_msgSend_manifestEpoch(void *a1, const char *a2, ...)
{
  return [a1 manifestEpoch];
}

id objc_msgSend_manifestSuffix(void *a1, const char *a2, ...)
{
  return [a1 manifestSuffix];
}

id objc_msgSend_measurements(void *a1, const char *a2, ...)
{
  return [a1 measurements];
}

id objc_msgSend_metaDataTable(void *a1, const char *a2, ...)
{
  return [a1 metaDataTable];
}

id objc_msgSend_metaDataTableEntry(void *a1, const char *a2, ...)
{
  return [a1 metaDataTableEntry];
}

id objc_msgSend_minorVersion(void *a1, const char *a2, ...)
{
  return [a1 minorVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsHostPersonalization(void *a1, const char *a2, ...)
{
  return [a1 needsHostPersonalization];
}

id objc_msgSend_nonce(void *a1, const char *a2, ...)
{
  return [a1 nonce];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_overrides(void *a1, const char *a2, ...)
{
  return [a1 overrides];
}

id objc_msgSend_partSPC(void *a1, const char *a2, ...)
{
  return [a1 partSPC];
}

id objc_msgSend_patchItems(void *a1, const char *a2, ...)
{
  return [a1 patchItems];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payloadData(void *a1, const char *a2, ...)
{
  return [a1 payloadData];
}

id objc_msgSend_personalizedData(void *a1, const char *a2, ...)
{
  return [a1 personalizedData];
}

id objc_msgSend_personalizedMetaData(void *a1, const char *a2, ...)
{
  return [a1 personalizedMetaData];
}

id objc_msgSend_prefixNeedsLogicalUnitNumber(void *a1, const char *a2, ...)
{
  return [a1 prefixNeedsLogicalUnitNumber];
}

id objc_msgSend_processTLVsForPersonalization(void *a1, const char *a2, ...)
{
  return [a1 processTLVsForPersonalization];
}

id objc_msgSend_productionMode(void *a1, const char *a2, ...)
{
  return [a1 productionMode];
}

id objc_msgSend_provisioning(void *a1, const char *a2, ...)
{
  return [a1 provisioning];
}

id objc_msgSend_pubKeyBlob(void *a1, const char *a2, ...)
{
  return [a1 pubKeyBlob];
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return [a1 purge];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_releaseVersion(void *a1, const char *a2, ...)
{
  return [a1 releaseVersion];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requiredTSSOptions(void *a1, const char *a2, ...)
{
  return [a1 requiredTSSOptions];
}

id objc_msgSend_resultData(void *a1, const char *a2, ...)
{
  return [a1 resultData];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rik(void *a1, const char *a2, ...)
{
  return [a1 rik];
}

id objc_msgSend_rk(void *a1, const char *a2, ...)
{
  return [a1 rk];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runningSemaphore(void *a1, const char *a2, ...)
{
  return [a1 runningSemaphore];
}

id objc_msgSend_securityDomain(void *a1, const char *a2, ...)
{
  return [a1 securityDomain];
}

id objc_msgSend_securityMode(void *a1, const char *a2, ...)
{
  return [a1 securityMode];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_setupFileSystemForRepair(void *a1, const char *a2, ...)
{
  return [a1 setupFileSystemForRepair];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSingleton(void *a1, const char *a2, ...)
{
  return [a1 sharedSingleton];
}

id objc_msgSend_shouldPersonalizeWithSSOByDefault(void *a1, const char *a2, ...)
{
  return [a1 shouldPersonalizeWithSSOByDefault];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return [a1 started];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_subfiles(void *a1, const char *a2, ...)
{
  return [a1 subfiles];
}

id objc_msgSend_suffixNeedsLogicalUnitNumber(void *a1, const char *a2, ...)
{
  return [a1 suffixNeedsLogicalUnitNumber];
}

id objc_msgSend_suiteId(void *a1, const char *a2, ...)
{
  return [a1 suiteId];
}

id objc_msgSend_suiteResult(void *a1, const char *a2, ...)
{
  return [a1 suiteResult];
}

id objc_msgSend_supportHarvestPearl(void *a1, const char *a2, ...)
{
  return [a1 supportHarvestPearl];
}

id objc_msgSend_supportLiDAR(void *a1, const char *a2, ...)
{
  return [a1 supportLiDAR];
}

id objc_msgSend_supportPeCoNet(void *a1, const char *a2, ...)
{
  return [a1 supportPeCoNet];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_testContext(void *a1, const char *a2, ...)
{
  return [a1 testContext];
}

id objc_msgSend_testId(void *a1, const char *a2, ...)
{
  return [a1 testId];
}

id objc_msgSend_testSequence(void *a1, const char *a2, ...)
{
  return [a1 testSequence];
}

id objc_msgSend_testSequencer(void *a1, const char *a2, ...)
{
  return [a1 testSequencer];
}

id objc_msgSend_testSequencerQueue(void *a1, const char *a2, ...)
{
  return [a1 testSequencerQueue];
}

id objc_msgSend_ticketName(void *a1, const char *a2, ...)
{
  return [a1 ticketName];
}

id objc_msgSend_ticketNeedsLogicalUnitNumber(void *a1, const char *a2, ...)
{
  return [a1 ticketNeedsLogicalUnitNumber];
}

id objc_msgSend_ticketPrefix(void *a1, const char *a2, ...)
{
  return [a1 ticketPrefix];
}

id objc_msgSend_tlvType(void *a1, const char *a2, ...)
{
  return [a1 tlvType];
}

id objc_msgSend_tlvValue(void *a1, const char *a2, ...)
{
  return [a1 tlvValue];
}

id objc_msgSend_tlvs(void *a1, const char *a2, ...)
{
  return [a1 tlvs];
}

id objc_msgSend_trusted(void *a1, const char *a2, ...)
{
  return [a1 trusted];
}

id objc_msgSend_tssOption(void *a1, const char *a2, ...)
{
  return [a1 tssOption];
}

id objc_msgSend_tssRequest(void *a1, const char *a2, ...)
{
  return [a1 tssRequest];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateBrunorDATFirmware(void *a1, const char *a2, ...)
{
  return [a1 updateBrunorDATFirmware];
}

id objc_msgSend_updateSavageDATFirmware(void *a1, const char *a2, ...)
{
  return [a1 updateSavageDATFirmware];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return [a1 valid];
}

id objc_msgSend_verifyPSD3(void *a1, const char *a2, ...)
{
  return [a1 verifyPSD3];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_warnings(void *a1, const char *a2, ...)
{
  return [a1 warnings];
}

id objc_msgSend_writeToData(void *a1, const char *a2, ...)
{
  return [a1 writeToData];
}

id objc_msgSend_writeToDestination(void *a1, const char *a2, ...)
{
  return [a1 writeToDestination];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:error:];
}