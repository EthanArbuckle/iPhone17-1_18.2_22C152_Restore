void sub_10000496C(id a1)
{
  os_log_t v1;
  void *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000049D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100004A3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100004AA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100004B0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100004B28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004DE8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100004FB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000052E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100005314(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000537C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000053E4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) suppressLogging] & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058A00);
    }
    v2 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting session thread...", v4, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _listenToCommand];
}

void sub_10000549C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000566C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000056D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000598C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000059F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100005B54(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100005CF4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100005E94(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000603C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006288(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000657C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  objc_destroyWeak(v20);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v21 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_1000065AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000065BC(uint64_t a1)
{
}

void sub_1000065C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000662C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006694(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058BA8);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DB64();
    }
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    v22 = *(void **)(v20 + 40);
    uint64_t v21 = (void **)(v20 + 40);
    v35 = v22;
    sub_1000102B8(&v35, 83886080, v6, @"Failed to start session", v16, v17, v18, v19, (uint64_t)v34);
    v23 = v35;
    goto LABEL_26;
  }
  [v5 setDelegate:WeakRetained];
  [WeakRetained setSession:v5];
  if (([*(id *)(a1 + 32) suppressLogging] & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058BC8);
    }
    uint64_t v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v37 = 360;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting session timeout to %ds...", buf, 8u);
    }
  }
  uint64_t v9 = [WeakRetained session];
  [v9 setSessionTimeLimit:360.0];

  if (([*(id *)(a1 + 32) suppressLogging] & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058BE8);
    }
    uint64_t v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting Card Emulation ...", buf, 2u);
    }
  }
  v11 = [WeakRetained session];
  uint64_t v12 = [v11 startEmulation];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058C08);
    }
    v24 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DAE8(a1 + 48, v24, v25);
    }
    uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
    v31 = *(void **)(v30 + 40);
    uint64_t v21 = (void **)(v30 + 40);
    sub_1000102B8(&v34, 83886082, v31, @"Cannot start emulation", v26, v27, v28, v29, (uint64_t)v31);
    v23 = v34;
LABEL_26:
    id v32 = v23;
    v33 = *v21;
    *uint64_t v21 = v32;
  }
  [WeakRetained _hceSessionDidStart:v5 error:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, void))(v15 + 16))(v15, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

void sub_100006A04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006A6C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006AD4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006B3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006DB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006E18(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100006E80(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 session];
  if (v1) {
    [v2 _hceSessionDidEnd:v3];
  }
  else {
    [v2 hceSessionDidEndUnexpectedly:v3];
  }
}

void sub_100007818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_100007854(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000078BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007924(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000798C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000079F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007A90(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007AF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007B60(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007BC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007C30(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007C98(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007D00(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007D68(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100007DD0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100008398(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100008400(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100008468(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000084D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100008538(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000085A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100008714(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100009250(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000092DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000952C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009544(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009554(uint64_t a1)
{
}

void sub_10000955C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000095BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000099A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100009E74(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100009EDC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100009F44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A598(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A600(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A668(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A6D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A738(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A7A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A808(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A870(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A9DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000AC80(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000AF14(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000AF7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000AFE4(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000591C8);
    }
    BOOL v3 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E0E8((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_10000B068(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000B4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak((id *)(v28 - 136));
  _Unwind_Resume(a1);
}

void sub_10000B520(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000B588(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000B5F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B6CC;
  block[3] = &unk_100059270;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v7 = v3;
  uint64_t v9 = *(void *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
}

void sub_10000B6CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059228);
    }
    uint64_t v19 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E154(v3, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    [WeakRetained setHeartbeatConnectionSem:v4];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) doubleValue];
    [WeakRetained setHeartbeatPeriod:];
    id v5 = [WeakRetained session];
    [v5 setSuppressLogging:1];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) doubleValue];
    int64_t v7 = (uint64_t)(v6 * 1000000000.0);
    do
    {
      dispatch_time_t v8 = dispatch_time(0, v7);
      uint64_t v9 = [WeakRetained heartbeatConnectionSem];
      intptr_t v10 = dispatch_semaphore_wait(v9, v8);
    }
    while (!v10);
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059248);
    }
    id v11 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Heartbeat disconnected!", buf, 2u);
    }
    [WeakRetained _restartSessionAfter:1 forceTerminate:0 andCompletion:0.0];
    [WeakRetained setHeartbeatConnectionSem:0];
    [WeakRetained setHeartbeatPeriod:0.0];
    id v12 = [WeakRetained session];
    [v12 setSuppressLogging:0];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = [*(id *)(a1 + 40) observers];
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v18 didStopHeartbeat];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v15);
    }
  }
}

void sub_10000B9BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000BA24(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000BB4C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000BC90(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000BFC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000C030(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000C098(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000C204(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000C534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C55C(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  [*(id *)(a1 + 32) _stopSessionRestartTimer];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059378);
    }
    uint64_t v7 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E244((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (([*(id *)(a1 + 32) _isHeartbeatMode] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) session];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v6 + 40);
    [v5 startListening:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000C66C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000C6D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000C73C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000C8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10000C8B8(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) _stopSessionRestartTimer];
  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v3 = [v2 session];
    id v13 = 0;
    [v3 endHCESession:&v13];
    id v4 = v13;

    if (v4) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = [v2 session];
    [v5 stopListening];
  }
  uint64_t v6 = [v2 session];
  id v12 = 0;
  [v6 waitForTermination:&v12];
  id v4 = v12;

  if (v4) {
    goto LABEL_15;
  }
  if (*(double *)(a1 + 56) > 0.0)
  {
    if (![v2 terminated])
    {
      double v7 = *(double *)(a1 + 56);
      id v11 = 0;
      [v2 _startSessionRestartTimer:&v11 error:v7];
      id v4 = v11;
      goto LABEL_15;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059400);
    }
    uint64_t v8 = (id)qword_10006C950;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      sub_10003E2B0(v9, (uint64_t)v14, v8);
    }
  }
  id v4 = 0;
LABEL_15:
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);
  }

  objc_sync_exit(v2);
}

void sub_10000CA84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CAA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000CBC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionRestartTimer];
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained _isHeartbeatMode] & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059448);
    }
    uint64_t v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v13 = 134217984;
      uint64_t v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting Session Restart Timer with interval %lf ...", (uint8_t *)&v13, 0xCu);
    }
  }
  double v6 = *(double *)(a1 + 48);
  uint64_t v7 = +[NSDate date];
  uint64_t v8 = +[NSDate dateWithTimeInterval:v7 sinceDate:v6];

  id v9 = [objc_alloc((Class)PCPersistentTimer) initWithFireDate:v8 serviceIdentifier:@"com.apple.mibu_nfc_timer" target:WeakRetained selector:"_restartSession:" userInfo:0];
  [WeakRetained setSessionRestartTimer:v9];

  uint64_t v10 = [WeakRetained sessionRestartTimer];
  [v10 setMinimumEarlyFireProportion:1.0];

  id v11 = [WeakRetained sessionRestartTimer];
  id v12 = +[NSRunLoop mainRunLoop];
  [v11 scheduleInRunLoop:v12];

  objc_sync_exit(v2);
}

void sub_10000CDBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CDDC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000CF48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CF5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000D0A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000D1C8(uint64_t a1)
{
  id obj = [*(id *)(a1 + 32) nfcInactivityTimer];
  objc_sync_enter(obj);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = +[NSDate date];
  uint64_t v5 = +[NSDate dateWithTimeInterval:v4 sinceDate:v3];

  id v6 = [objc_alloc((Class)PCPersistentTimer) initWithFireDate:v5 serviceIdentifier:@"com.apple.mibu_nfc_inactivity_timer" target:WeakRetained selector:"_nfcInactivityTimeoutHandler:" userInfo:0];
  [WeakRetained setNfcInactivityTimer:v6];

  uint64_t v7 = [WeakRetained nfcInactivityTimer];
  [v7 setMinimumEarlyFireProportion:1.0];

  uint64_t v8 = [WeakRetained nfcInactivityTimer];
  uint64_t v9 = +[NSRunLoop mainRunLoop];
  [v8 scheduleInRunLoop:v9];

  objc_sync_exit(obj);
}

void sub_10000D310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000D418(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000D550(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000D74C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000D7B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000D98C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000E208(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000E270(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000E854(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000E8BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000EAFC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000EB64(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000EE38(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000EEA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000EF08(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000F0C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000F678(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000F6E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000F748(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000F7B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000F818(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000FB9C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000FC04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000FC6C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000FED4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000FF3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000FFA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001015C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000101C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100010290(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000102B8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id v12 = a4;
    id v13 = a3;
    id v14 = [objc_alloc((Class)NSMutableString) initWithFormat:v12 arguments:&a9];

    id v15 = sub_100010368(a2, v13, v14);

    *a1 = v15;
  }
}

id sub_100010368(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v5) {
    [v8 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  uint64_t v9 = +[NSError errorWithDomain:@"com.apple.MobileInBoxUpdater.ErrorDomain" code:a1 userInfo:v8];

  return v9;
}

void sub_100010484(id a1)
{
  qword_10006C888 = objc_alloc_init(MIBUOperationFactory);

  _objc_release_x1();
}

void sub_1000105E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10003E834();
  }
}

void sub_10001072C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10003E834();
  }
}

uint64_t sub_100010C1C(unsigned int a1, uint64_t a2, int a3, unsigned int *a4)
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059990);
  }
  id v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)&uint8_t buf[4] = HIBYTE(a1);
    __int16 v28 = 1024;
    unsigned int v29 = HIWORD(a1);
    __int16 v30 = 1024;
    unsigned int v31 = a1 >> 8;
    __int16 v32 = 1024;
    unsigned int v33 = a1;
    __int16 v34 = 1024;
    int v35 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Verifying tag: %c%c%c%c of type: 0x%x...", buf, 0x20u);
  }
  if (!a4) {
    return 22;
  }
  if (a1 == 1162037572 && !a3)
  {
    *(void *)buf = 0;
    uint64_t v8 = (void *)MGCopyAnswer();
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_1000599B0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003EAC8();
      }
    }
    else
    {
      id v10 = *(id *)buf;
      id v11 = [v8 longLongValue];
      *a4 = *a4 & 0xFFFFFFFE | (v10 == v11);
      if (v10 != v11)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_1000599D0);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003EA3C();
        }
      }
    }
    goto LABEL_38;
  }
  if (a1 == 1128810832 && !a3)
  {
    *(void *)buf = 0;
    uint64_t v8 = (void *)MGCopyAnswer();
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_1000599F0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003EB88();
      }
    }
    else
    {
      id v12 = *(id *)buf;
      id v13 = [v8 longLongValue];
      *a4 = *a4 & 0xFFFFFFFD | (2 * (v12 == v13));
      if (v12 != v13)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059A10);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003EAFC();
        }
      }
    }
    goto LABEL_38;
  }
  if (a1 == 1112494660 && !a3)
  {
    *(void *)buf = 0;
    uint64_t v8 = (void *)MGCopyAnswer();
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059A30);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003EC48();
      }
    }
    else
    {
      id v14 = *(id *)buf;
      id v15 = [v8 longLongValue];
      *a4 = *a4 & 0xFFFFFFFB | (4 * (v14 == v15));
      if (v14 != v15)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059A50);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003EBBC();
        }
      }
    }
    goto LABEL_38;
  }
  if (a1 == 1396985677 && !a3)
  {
    *(void *)buf = 0;
    uint64_t v8 = (void *)MGCopyAnswer();
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059A70);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003ED08();
      }
    }
    else
    {
      id v16 = *(id *)buf;
      id v17 = [v8 longLongValue];
      *a4 = *a4 & 0xFFFFFFF7 | (8 * (v16 == v17));
      if (v16 != v17)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059A90);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003EC7C();
        }
      }
    }
    goto LABEL_38;
  }
  if (a1 == 1129337423 && !a3)
  {
    buf[0] = 0;
    int v19 = MGGetBoolAnswer();
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyBoolean();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059AB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003EDB0();
      }
    }
    else
    {
      BOOL v20 = buf[0] == v19;
      *a4 = *a4 & 0xFFFFFFEF | (16 * v20);
      if (!v20)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059AD0);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003ED3C();
        }
      }
    }
    return PropertyInteger64;
  }
  if (a1 == 1129530691 && !a3)
  {
    buf[0] = 0;
    int v21 = MGGetBoolAnswer();
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyBoolean();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059AF0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003EE58();
      }
    }
    else
    {
      BOOL v20 = buf[0] == v21;
      *a4 = *a4 & 0xFFFFFFDF | (32 * v20);
      if (!v20)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059B10);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003EDE4();
        }
      }
    }
    return PropertyInteger64;
  }
  if (a1 == 1112425288 && !a3)
  {
    *(void *)buf = 0;
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyData();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059B30);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003EF78();
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059B50);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003EF08();
      }
    }
LABEL_121:
    uint64_t v8 = 0;
LABEL_38:

    return PropertyInteger64;
  }
  if (a1 == 1936617326 && !a3)
  {
    *(void *)buf = 0;
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyData();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059B90);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003F098();
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059BB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003F028();
      }
    }
    goto LABEL_121;
  }
  if (a1 == 1701405301 && !a3)
  {
    *(void *)buf = 0;
    uint64_t PropertyInteger64 = Img4DecodeGetPropertyData();
    if (PropertyInteger64)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059BF0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003F144();
      }
      uint64_t v8 = 0;
      id v22 = 0;
    }
    else
    {
      uint64_t v8 = +[NSData dataWithBytes:*(void *)buf length:0];
      id v22 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
      unsigned int v23 = [v22 isEqualToString:@"1"];
      if (v23) {
        int v24 = 256;
      }
      else {
        int v24 = 0;
      }
      *a4 = *a4 & 0xFFFFFEFF | v24;
      if ((v23 & 1) == 0)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059C10);
        }
        uint64_t v25 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003F0CC((uint64_t)v22, v25);
        }
      }
    }

    goto LABEL_38;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059C30);
  }
  long long v26 = qword_10006C950;
  uint64_t PropertyInteger64 = 0;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)&uint8_t buf[4] = HIBYTE(a1);
    __int16 v28 = 1024;
    unsigned int v29 = HIWORD(a1);
    __int16 v30 = 1024;
    unsigned int v31 = a1 >> 8;
    __int16 v32 = 1024;
    unsigned int v33 = a1;
    __int16 v34 = 1024;
    int v35 = a3;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Ignoring tag: %c%c%c%c of type: 0x%x...", buf, 0x20u);
    return 0;
  }
  return PropertyInteger64;
}

void sub_1000117E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011848(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000118B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011918(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011980(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011AF4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011C3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011CA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011D0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011D74(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011DDC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011E44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011EAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011F14(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011F7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100011FE4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001204C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000120B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001211C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012184(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000121EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012254(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000122BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012324(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001238C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000123F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001245C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000124C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012544(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000125BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

id sub_1000125D4()
{
  return [v0 longLongValue];
}

void sub_100012738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012A88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Block_object_dispose((const void *)(v2 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012AA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012AB8(uint64_t a1)
{
}

void sub_100012AC0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012B28(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v9 + 40);
  sub_1000102B8(&obj, 3221225472, 0, @"Failed to instantiate DADiagnosticsLauncher", a5, a6, a7, a8, v11);
  objc_storeStrong((id *)(v9 + 40), obj);
  uint64_t v10 = [*(id *)(a1 + 32) delegate];
  [v10 appDidLaunchWithError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_100012C10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012C78(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012CE0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) diagsLauncher];
  [v1 launchDiagnostics];
}

void sub_100012F28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012F50(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100012FB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100013164(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001343C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000134A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

Class sub_100013598(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10006C8B0)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000136DC;
    v4[4] = &unk_100059E00;
    v4[5] = v4;
    long long v5 = off_100059DE8;
    uint64_t v6 = 0;
    qword_10006C8B0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_10006C8B0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("DADiagnosticsLauncher");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_10003F1E8();
LABEL_8:
    free(v2);
  }
  qword_10006C8A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000136DC()
{
  uint64_t result = _sl_dlopen();
  qword_10006C8B0 = result;
  return result;
}

void sub_1000137A4(id a1)
{
  qword_10006C8B8 = objc_alloc_init(MIBUTestPreferences);

  _objc_release_x1();
}

void sub_1000140E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10003E834();
  }
}

void sub_1000143B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001441C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001477C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000147E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100014C60(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100014CC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100015074(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000150DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000155EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100015654(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000156BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000158A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100015910(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100015BB4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100015CF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000160F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016128(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016138(uint64_t a1)
{
}

void sub_100016140(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000161A8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  id v14 = a4;
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  uint64_t v12 = *(void *)(a1[6] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
}

void sub_10001625C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000163D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000165FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100016664(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100016850(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000168B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100016BCC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100016C34(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100016C9C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100016D04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

id sub_100016F68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resume];
}

id sub_100016FF8(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _terminateNow];
}

void sub_10001788C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000178F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001795C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000179C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018010(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018078(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000180E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018148(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000181B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018218(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018280(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000182E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018350(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000183B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001867C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000186E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000187FC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10001881C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100018838(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100018B30(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018B98(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100018C00(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) diagController];
  [v1 start];
}

id sub_100018E4C(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A408);
  }
  uint64_t v2 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 error];
    uint64_t v6 = +[NSString stringWithFormat:@"Encountered error when launching diagnostics app: %@", v5];
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  return [*(id *)(a1 + 32) _operationDone];
}

void sub_100018FA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100019008(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

id sub_100019124(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A470);
  }
  uint64_t v2 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 error];
    uint64_t v6 = +[NSString stringWithFormat:@"Diagnostics app finished with error: %@", v5];
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  return [*(id *)(a1 + 32) _operationDone];
}

void sub_100019278(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001959C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100019604(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001966C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100019BBC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100019BD0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100019C38(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100019CA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100019D08(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100019D70(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained manager];
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019E50;
  v6[3] = &unk_10005A578;
  objc_copyWeak(&v7, v2);
  [v4 scanForUpdates:v5 withScanResults:v6];

  objc_destroyWeak(&v7);
}

void sub_100019E3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100019E50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _proccessScanResults:v6 andError:v5];
}

void sub_10001A130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

uint64_t sub_10001A170(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A180(uint64_t a1)
{
}

void sub_10001A188(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001A1F0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A5E0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F8C4();
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v10 + 40);
    sub_1000102B8(&obj, 67108867, v5, @"Failed to start SU Download", v6, v7, v8, v9, v12);
    objc_storeStrong((id *)(v10 + 40), obj);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _softwareUpdateCompleteWithError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
}

void sub_10001A2E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001A3F8(uint64_t a1)
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A628);
  }
  uint64_t v2 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggering software update install ...", v6, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) setCancelled:0];
  WeakRetained[2] = 1025;
  id v4 = objc_alloc_init((Class)SUInstallOptions);
  [v4 setSkipActivationCheck:1];
  uint64_t v5 = [WeakRetained manager];
  [v5 installUpdateWithInstallOptions:v4 withResult:&stru_10005A668];
}

void sub_10001A4FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001A564(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A688);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F92C();
    }
  }
}

void sub_10001A5EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001A848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A85C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001A8C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001A92C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001A9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001AAC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001AC28(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001AD88(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001B04C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001B0B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001B20C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001B36C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001B48C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  uint64_t v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001B5AC(uint64_t a1)
{
  [*(id *)(a1 + 32) terminate];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 updateDidFinishWithError:*(void *)(a1 + 40)];
}

void sub_10001B780(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001BA1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001BD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001BDB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001BE20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A868);
  }
  uint64_t v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancel SU download returned error: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A888);
  }
  uint64_t v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Purging software update download...", buf, 2u);
  }
  uint64_t v8 = [WeakRetained manager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C0D0;
  v11[3] = &unk_10005A910;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v10;
  [v8 purgeDownloadWithOptions:v9 withResult:v11];
}

void sub_10001C000(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C068(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C0D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A8A8);
  }
  uint64_t v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Purging SU download returned error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A8C8);
  }
  uint64_t v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating SU client...", (uint8_t *)&v9, 2u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) manager];
  [v7 invalidate];

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A8E8);
  }
  uint64_t v8 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SU client invalidated", (uint8_t *)&v9, 2u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001C29C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C304(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C36C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C3D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C43C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C4A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C8A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001C964(id a1)
{
  qword_10006C8D0 = objc_alloc_init(MIBUMainController);

  _objc_release_x1();
}

void sub_10001CA28(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) _start:*(void *)(a1 + 40)];
  objc_sync_exit(obj);
}

void sub_10001CA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001CBA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CBBC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001CDEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CE5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D060(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D088(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001D290(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D2B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001D318(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001D6E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D718(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001D780(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001D8DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D8FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001DAA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001DAC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001DF70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001DF98(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001E000(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001E068(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001E0D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001E138(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001E1A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001E94C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001E9B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001EA1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001EA84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001EAEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001EB54(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001ED14(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopIdleTimer];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005ACA0);
  }
  id v2 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    [v3 idleTimeInterval];
    int v17 = 134217984;
    uint64_t v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting Idle timer with %lfs timeout...", (uint8_t *)&v17, 0xCu);
  }
  [*(id *)(a1 + 32) idleTimeInterval];
  double v7 = v6;
  uint64_t v8 = +[NSDate date];
  uint64_t v9 = +[NSDate dateWithTimeInterval:v8 sinceDate:v7];

  id v10 = objc_alloc((Class)PCPersistentTimer);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v13 = [v10 initWithFireDate:v9 serviceIdentifier:@"com.apple.mobileinboxupdater.inactivitytimer" target:v11 selector:"handleIdleTimer:" userInfo:v12];
  [*(id *)(a1 + 32) setIdleTimer:v13];

  id v14 = [*(id *)(a1 + 32) idleTimer];
  [v14 setMinimumEarlyFireProportion:1.0];

  uint64_t v15 = [*(id *)(a1 + 32) idleTimer];
  uint64_t v16 = +[NSRunLoop mainRunLoop];
  [v15 scheduleInRunLoop:v16];
}

void sub_10001EF1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F054(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F188(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F294(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F4F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F558(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F5C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F7AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F814(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001F9F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001FA58(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10001FDD4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10003E834();
  }
}

void sub_10001FE3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10003E834();
  }
}

void sub_100020020(id a1)
{
  qword_10006C8E0 = objc_alloc_init(MIBUDeviceController);

  _objc_release_x1();
}

void sub_100020208(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000204C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002052C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000206F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100020948(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000209B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100020B1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100020EE8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100020F50(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100020FB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000210F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100021390(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000213F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100021460(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000214C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000216A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100021708(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100021770(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100021934(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002199C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100021A04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100021B44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002214C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022168(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022938(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000229A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022A08(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022A70(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022AD8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022B40(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022BA8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022C10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022E10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022E78(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100022EE0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100023004(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100023280(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100023600(id a1)
{
  qword_10006C908 = objc_alloc_init(MIBUWiFiHelper);

  _objc_release_x1();
}

void sub_100023910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_sync_exit(v21);
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100023950(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100023960(uint64_t a1)
{
}

void sub_100023968(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000239D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = *(void *)(v1 + 8);
  id obj = *(id *)(v3 + 40);
  [v2 _retryWiFiConnection:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

void sub_100023B08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023B1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100023C40(uint64_t a1, nw_path_t path)
{
  nw_path_status_t status = nw_path_get_status(path);
  uint64_t v4 = [*(id *)(a1 + 32) connectionSem];

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B368);
  }
  uint64_t v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = status == nw_path_status_satisfied;
    __int16 v9 = 1024;
    BOOL v10 = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got Network update event: Network Available = %{BOOL}d; isConnecting = %{BOOL}d",
      (uint8_t *)v8,
      0xEu);
  }
  if (v4)
  {
    if (status == nw_path_status_satisfied)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B388);
      }
      uint64_t v6 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connected to internet!", (uint8_t *)v8, 2u);
      }
      uint64_t v7 = [*(id *)(a1 + 32) connectionSem];
      dispatch_semaphore_signal(v7);
    }
  }
  else if (status != nw_path_status_satisfied)
  {
    [*(id *)(a1 + 32) _dispatchRetryOperation];
  }
}

void sub_100023DF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100023E58(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_100024098(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024100(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) networkMonitor];

  if (v2)
  {
    uint64_t v4 = 0;
    *(void *)&long long v3 = 134217984;
    long long v15 = v3;
    while (1)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B410);
      }
      uint64_t v5 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting wifi connection retry...", buf, 2u);
      }
      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v16 = v4;
      [v6 _retryWiFiConnection:&v16 v15];
      id v7 = v16;

      if (!v7) {
        break;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B430);
      }
      uint64_t v8 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v10 = v8;
        [v9 globalRetryInterval];
        *(_DWORD *)buf = v15;
        uint64_t v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Waiting for %lfs to try wifi connection again...", buf, 0xCu);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) globalRetryInterval];
      sleep(v12);
      id v13 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) networkMonitor];

      uint64_t v4 = v7;
      if (!v13) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    id v7 = 0;
LABEL_15:
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B3F0);
    }
    id v14 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Network monitoring cancelled; stop retrying wifi connection",
        buf,
        2u);
    }
  }
}

void sub_100024374(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000243DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024444(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002466C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000246D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002482C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002484C(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  if (nw_path_get_status(*(nw_path_t *)(a1 + 32)) == nw_path_status_satisfied
    && nw_interface_get_type(v3) == nw_interface_type_wifi)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  return 1;
}

void sub_100024A74(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024ADC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024B44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024ED8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024F40(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100024FA8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100025010(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

id sub_1000253BC(uint64_t a1, void *a2)
{
  id result = [a2 type];
  if (result == (id)10)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B598);
    }
    uint64_t v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wifi interface is now initialized. Should be safe to proceed..", v5, 2u);
    }
    [*(id *)(a1 + 32) lock];
    [*(id *)(a1 + 32) signal];
    return [*(id *)(a1 + 32) unlock];
  }
  return result;
}

void sub_10002547C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000254E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002554C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000255B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002561C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002586C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000258D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100025EC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100025F30(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100025F98(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100026000(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100026068(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000260D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002669C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1000266E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100026750(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  id v14 = a4;
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  uint64_t v12 = *(void *)(a1[6] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
}

void sub_100026804(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002686C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100026C48(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100026CB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100026D6C(id a1)
{
  qword_10006C910 = objc_alloc_init(MIBUXPCListener);

  _objc_release_x1();
}

void sub_100026EBC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100027240(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000272A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100027310(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000276A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

uint64_t sub_1000276EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000276FC(uint64_t a1)
{
}

void sub_100027704(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002776C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
  if (v10)
  {
    if (WeakRetained)
    {
      uint64_t v11 = [WeakRetained _serializeValue:v10 forTag:v7];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendData:v11];
LABEL_5:

        goto LABEL_6;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B908);
      }
      int v21 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_1000407D8(v21, v7, (uint64_t)v10);
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B8E8);
      }
      id v13 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_1000407A0(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    *a4 = 1;
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = 0;
    goto LABEL_5;
  }
LABEL_6:
}

void sub_100027900(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100027968(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002800C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028074(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000280DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028144(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000281AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028214(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002827C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028600(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028668(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

id sub_1000286F0(id a1)
{
  return a1;
}

void sub_10002871C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t sub_10002873C()
{
  return objc_opt_class();
}

uint64_t sub_100028754()
{
  return objc_opt_class();
}

id sub_10002876C()
{
  return [v0 charValue];
}

void sub_100028948(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028B14(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028B7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028E44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100028EAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002911C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100029184(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000291EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100029820(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100029888(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100029F5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100029FC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A02C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A094(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A0FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A164(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A1CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A234(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A29C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A304(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A440(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A660(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A6C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002A9B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002AA1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002AA84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002ACA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002AD0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002AE48(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B174(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B1DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B244(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B2AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B3B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B5F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B65C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002B6C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BA24(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BA8C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BAF4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BB5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BBC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BDE8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BE50(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BEB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002BFC0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002C220(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002C288(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002C2F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002C408(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002C428(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10002C450()
{
  return [v0 doubleValue];
}

void sub_10002C4BC(id a1)
{
  v3[0] = &off_100060570;
  v3[1] = &off_1000605A0;
  v4[0] = &off_100060588;
  v4[1] = &off_100060588;
  v3[2] = &off_1000605B8;
  v3[3] = &off_1000605D0;
  v4[2] = &off_100060588;
  v4[3] = &off_1000605E8;
  v3[4] = &off_1000605E8;
  v4[4] = &off_100060570;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  id v2 = (void *)qword_10006C920;
  qword_10006C920 = v1;
}

void sub_10002C5CC(id a1)
{
  v3[0] = &off_100060570;
  v3[1] = &off_1000605A0;
  v4[0] = &off_100060600;
  v4[1] = &off_100060570;
  v3[2] = &off_1000605D0;
  v3[3] = &off_1000605E8;
  v4[2] = &off_100060570;
  v4[3] = &off_100060570;
  v3[4] = &off_100060600;
  void v3[5] = &off_100060618;
  v4[4] = &off_100060570;
  void v4[5] = &off_100060618;
  v3[6] = &off_1000605B8;
  v3[7] = &off_100060588;
  void v4[6] = &off_1000605E8;
  v4[7] = &off_1000605E8;
  v3[8] = &off_100060630;
  v3[9] = &off_100060648;
  v4[8] = &off_100060618;
  v4[9] = &off_1000605A0;
  v3[10] = &off_100060660;
  v3[11] = &off_100060678;
  v4[10] = &off_100060570;
  v4[11] = &off_100060600;
  v3[12] = &off_100060690;
  v3[13] = &off_1000606A8;
  v4[12] = &off_100060600;
  v4[13] = &off_1000605D0;
  v3[14] = &off_1000606C0;
  v3[15] = &off_1000606D8;
  v4[14] = &off_100060600;
  v4[15] = &off_1000605A0;
  v3[16] = &off_1000606F0;
  v3[17] = &off_100060708;
  uint8_t v4[16] = &off_1000605A0;
  v4[17] = &off_1000605D0;
  v3[18] = &off_100060720;
  v3[19] = &off_100060738;
  v4[18] = &off_1000605A0;
  v4[19] = &off_1000605A0;
  v3[20] = &off_100060750;
  v3[21] = &off_100060768;
  v4[20] = &off_100060618;
  v4[21] = &off_1000605D0;
  v3[22] = &off_100060780;
  v3[23] = &off_100060798;
  v4[22] = &off_1000605A0;
  v4[23] = &off_1000605A0;
  v3[24] = &off_1000607B0;
  v3[25] = &off_1000607C8;
  v4[24] = &off_100060600;
  v4[25] = &off_100060600;
  v3[26] = &off_1000607E0;
  v3[27] = &off_1000607F8;
  v4[26] = &off_100060600;
  v4[27] = &off_1000605D0;
  v3[28] = &off_100060810;
  v3[29] = &off_100060828;
  v4[28] = &off_100060570;
  v4[29] = &off_100060600;
  v3[30] = &off_100060840;
  v3[31] = &off_100060858;
  v4[30] = &off_100060600;
  v4[31] = &off_1000605E8;
  v3[32] = &off_100060870;
  v3[33] = &off_100060888;
  v4[32] = &off_100060618;
  v4[33] = &off_100060618;
  v3[34] = &off_1000608A0;
  v3[35] = &off_1000608B8;
  v4[34] = &off_100060618;
  v4[35] = &off_100060618;
  v3[36] = &off_1000608D0;
  v3[37] = &off_1000608E8;
  v4[36] = &off_100060618;
  v4[37] = &off_100060618;
  v3[38] = &off_100060900;
  v3[39] = &off_100060918;
  v4[38] = &off_100060618;
  v4[39] = &off_100060618;
  v3[40] = &off_100060930;
  v3[41] = &off_100060948;
  v4[40] = &off_1000605E8;
  v4[41] = &off_100060618;
  v3[42] = &off_100060960;
  v3[43] = &off_100060978;
  v4[42] = &off_100060618;
  v4[43] = &off_1000605B8;
  v3[44] = &off_100060990;
  v3[45] = &off_1000609A8;
  v4[44] = &off_100060600;
  v4[45] = &off_1000605B8;
  v3[46] = &off_1000609C0;
  v3[47] = &off_1000609D8;
  v4[46] = &off_1000605B8;
  v4[47] = &off_1000605B8;
  v3[48] = &off_1000609F0;
  v3[49] = &off_100060A08;
  v4[48] = &off_100060570;
  v4[49] = &off_100060570;
  v3[50] = &off_100060A20;
  v3[51] = &off_100060A38;
  v4[50] = &off_100060570;
  v4[51] = &off_1000605B8;
  v3[52] = &off_100060A50;
  v3[53] = &off_100060A68;
  v4[52] = &off_1000605B8;
  v4[53] = &off_100060600;
  v3[54] = &off_100060A80;
  v3[55] = &off_100060A98;
  v4[54] = &off_100060600;
  v4[55] = &off_100060600;
  v3[56] = &off_100060AB0;
  v3[57] = &off_100060AC8;
  v4[56] = &off_100060600;
  v4[57] = &off_100060570;
  v3[58] = &off_100060AE0;
  v3[59] = &off_100060AF8;
  v4[58] = &off_1000605E8;
  v4[59] = &off_1000605A0;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:60];
  id v2 = (void *)qword_10006C930;
  qword_10006C930 = v1;
}

void sub_10002C9DC(id a1)
{
  v3[0] = &off_100060570;
  v3[1] = &off_100060618;
  v4[0] = &off_100060678;
  v4[1] = &off_1000607C8;
  v3[2] = &off_100060630;
  v3[3] = &off_100060678;
  v4[2] = &off_100060B10;
  v4[3] = &off_100060B28;
  v3[4] = &off_100060690;
  void v3[5] = &off_1000606C0;
  v4[4] = &off_100060B40;
  void v4[5] = &off_1000606D8;
  v3[6] = &off_100060750;
  v3[7] = &off_1000607B0;
  void v4[6] = &off_100060738;
  v4[7] = &off_1000606D8;
  v3[8] = &off_1000607C8;
  v3[9] = &off_1000607E0;
  v4[8] = &off_1000606D8;
  v4[9] = &off_1000606D8;
  v3[10] = &off_100060828;
  v3[11] = &off_100060840;
  v4[10] = &off_100060B28;
  v4[11] = &off_100060B40;
  v3[12] = &off_100060870;
  v3[13] = &off_100060888;
  v4[12] = &off_100060588;
  v4[13] = &off_100060588;
  v3[14] = &off_1000608A0;
  v3[15] = &off_1000608B8;
  v4[14] = &off_100060588;
  v4[15] = &off_100060588;
  v3[16] = &off_1000608D0;
  v3[17] = &off_1000608E8;
  uint8_t v4[16] = &off_100060588;
  v4[17] = &off_100060588;
  v3[18] = &off_100060900;
  v3[19] = &off_100060918;
  v4[18] = &off_100060588;
  v4[19] = &off_100060588;
  v3[20] = &off_100060948;
  v3[21] = &off_100060960;
  v4[20] = &off_100060588;
  v4[21] = &off_100060588;
  v3[22] = &off_100060990;
  v3[23] = &off_100060A68;
  v4[22] = &off_100060990;
  v4[23] = &off_100060990;
  v3[24] = &off_100060A80;
  v3[25] = &off_100060A98;
  v4[24] = &off_1000607C8;
  v4[25] = &off_100060990;
  v3[26] = &off_100060AB0;
  v4[26] = &off_100060990;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:27];
  id v2 = (void *)qword_10006C940;
  qword_10006C940 = v1;
}

uint64_t start()
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C178);
  }
  uint64_t v1 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "inboxupdaterd started", buf, 2u);
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C198);
  }
  id v2 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Running Daemon...", v11, 2u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10005C1F8);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C1B8);
  }
  BOOL v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering notifications...", v10, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10002D0BC, @"com.apple.mobile.lockdown.activation_state", 0, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10002D0BC, @"com.apple.springboard.lockstate", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C1D8);
  }
  uint64_t v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting XPC listener...", v9, 2u);
  }
  uint64_t v6 = +[MIBUXPCListener sharedInstance];
  [v6 start];

  uint64_t v7 = +[NSRunLoop currentRunLoop];
  [v7 run];

  return 0;
}

void sub_10002CF84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002CFEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002D054(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002D0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C3B8);
  }
  uint64_t v4 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received notification: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10005C1F8);
}

void sub_10002D1A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002D208(id a1)
{
  os_log_t v1 = +[MIBUDeviceController sharedInstance];
  unsigned int v2 = [v1 isIPad];

  if (v2)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C218);
    }
    BOOL v3 = qword_10006C950;
    if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = "Device is iPad, disable daemon";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
LABEL_17:
    uint64_t v7 = 0;
    goto LABEL_18;
  }
  if (!+[MIBUCertHelper SUCertPresent])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C238);
    }
    BOOL v3 = qword_10006C950;
    if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v4 = "Factory SU certificate does not exist, disable daemon";
    goto LABEL_16;
  }
  uint64_t v5 = +[MIBUDeviceController sharedInstance];
  id v34 = 0;
  unsigned int v6 = [v5 isActivated:&v34];
  uint64_t v7 = (char *)v34;

  if (v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C258);
    }
    uint64_t v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Device activated; deleting factory SU certificate & disable daemon";
LABEL_48:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  int v21 = +[MIBUDeviceController sharedInstance];
  unsigned int v22 = [v21 isInitialBuddySetupComplete];

  if (v22)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C278);
    }
    uint64_t v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Initial Setup completed, deleting factory SU certificate & disable daemon";
      goto LABEL_48;
    }
LABEL_18:
    if (os_variant_has_internal_content())
    {
      uint64_t v10 = +[MIBUTestPreferences sharedInstance];
      unsigned int v11 = [v10 skipDaemonDisable];

      if (v11)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005C2F8);
        }
        uint64_t v12 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Skipping daemon disable", buf, 2u);
        }
      }
      id v13 = +[MIBUTestPreferences sharedInstance];
      unsigned int v14 = [v13 skipCertDeletion];

      if (v14)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005C318);
        }
        uint64_t v15 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping cert deletion", buf, 2u);
        }
        if (v11)
        {
          uint64_t v16 = 0;
          uint64_t v17 = v7;
          goto LABEL_59;
        }
        uint64_t v17 = v7;
LABEL_50:
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005C378);
        }
        unsigned int v23 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "com.apple.inboxupdaterd";
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Disabling daemon %s", buf, 0xCu);
        }
        SMJobSetEnabled();
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005C398);
        }
        int v24 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v36 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SMJobSetEnabled returned error: %{public}@", buf, 0xCu);
        }
LABEL_58:
        uint64_t v16 = 0;
        goto LABEL_59;
      }
      char v18 = v11 ^ 1;
    }
    else
    {
      char v18 = 1;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C338);
    }
    uint64_t v19 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Deleting Factory SU certificate...", buf, 2u);
    }
    unsigned int v31 = v7;
    +[MIBUCertHelper deleteSUCert:&v31];
    uint64_t v17 = v31;

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C358);
    }
    uint64_t v20 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Factory SU certificate deletion done with error: %{public}@", buf, 0xCu);
    }
    if ((v18 & 1) == 0) {
      goto LABEL_58;
    }
    goto LABEL_50;
  }
  uint64_t v16 = +[MIBUMainController sharedInstance];
  uint64_t v25 = +[MIBUDeviceController sharedInstance];
  unsigned int v26 = [v25 isOnLockScreen];

  if (v26)
  {
    if ([v16 running])
    {
      uint64_t v17 = v7;
      goto LABEL_74;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C298);
    }
    uint64_t v29 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Starting main controller ...", buf, 2u);
    }
    unsigned int v33 = v7;
    __int16 v28 = (id *)&v33;
    [v16 start:&v33];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C2B8);
    }
    long long v27 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cleaning up main controller...", buf, 2u);
    }
    __int16 v32 = v7;
    __int16 v28 = (id *)&v32;
    [v16 cleanup:&v32];
  }
  uint64_t v17 = (char *)*v28;

LABEL_74:
  if (v17)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C2D8);
    }
    __int16 v30 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041B00((uint64_t)v17, v30);
    }
  }
LABEL_59:
}

void sub_10002D9EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DA54(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DABC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DB24(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DB8C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DBF4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DC5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DCC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DD2C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DD94(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DDFC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DE64(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DECC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002DF34(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002E428(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002E490(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002EE3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002EEA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002EF0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002EF74(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002EFDC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002F044(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002F0AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002F114(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002F17C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002F1E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002F24C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002F2B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002FCD4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002FD3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002FDA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002FE0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002FE74(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10002FEDC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100030124(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10003018C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10003057C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) latestUpdate];
  unsigned int v2 = [v6 productBuildVersion];
  [*(id *)(a1 + 40) setTargetBuildVersion:v2];

  BOOL v3 = [v6 productVersion];
  [*(id *)(a1 + 40) setTargetOSVersion:v3];

  uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 downloadSize]);
  [*(id *)(a1 + 40) setTargetSUBundleSize:v4];

  uint64_t v5 = [*(id *)(a1 + 40) suController];
  [v5 download:v6];
}

id sub_1000306DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToState:2 error:0];
}

void sub_1000307A0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 40) productBuildVersion];
  [*(id *)(a1 + 32) setTargetBuildVersion:v2];

  BOOL v3 = [*(id *)(a1 + 32) currentBuildVersion];
  +[MIBUDefaultPreferences setObject:v3 forKey:@"PreviousOSVersion"];

  uint64_t v4 = [*(id *)(a1 + 32) targetBuildVersion];
  +[MIBUDefaultPreferences setObject:v4 forKey:@"TargetOSVersion"];

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C698);
  }
  uint64_t v5 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = v5;
    uint64_t v8 = +[MIBUDefaultPreferences dictionaryRepresentation];
    uint64_t v9 = +[NSString stringWithFormat:@"Saved defaults %@", v8];
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
}

void sub_100030958(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

id sub_100030A74(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C6B8);
  }
  unsigned int v2 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 error];
    uint64_t v6 = +[NSString stringWithFormat:@"Software update finished with error: %@", v5];
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  return [*(id *)(a1 + 32) _transitionToState:4 error:0];
}

void sub_100030BD0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  unsigned int v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100030D10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) code];
  if (!*(void *)(a1 + 40))
  {
    uint64_t v3 = (uint64_t)v2;
    uint64_t v5 = *(void **)(a1 + 48);
    uint64_t v4 = (id *)(a1 + 48);
    if ([v5 state] == (id)2)
    {
      if (v3)
      {
        if (v3 == 8)
        {
          id v6 = *v4;
          [v6 _transitionToState:3 error:0];
        }
        else
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005C6D8);
          }
          uint64_t v8 = (void *)qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = *v4;
            uint64_t v10 = v8;
            int v11 = 138412802;
            id v12 = v9;
            __int16 v13 = 2048;
            uint64_t v14 = v3;
            __int16 v15 = 2048;
            id v16 = [v9 state];
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Received command %ld at state %ld; resetting install timer...",
              (uint8_t *)&v11,
              0x20u);
          }
          [*v4 _startInstallTimer];
        }
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005C6F8);
      }
      uint64_t v7 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEBUG)) {
        sub_100041F14(v4, v7, v3);
      }
    }
  }
}

void sub_100030EF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100030F58(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100031048(uint64_t a1)
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C740);
  }
  id v2 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = +[NSString stringWithFormat:@"Install timer fired!"];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v3;
    __int16 v22 = 2114;
    unsigned int v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v6 = (id *)(a1 + 32);
  if ([v7 state] == (id)2)
  {
    id v19 = 0;
    sub_1000102B8(&v19, 67108870, 0, @"Software update pending install timed out", v8, v9, v10, v11, v18);
    id v12 = v19;
    __int16 v13 = [*v6 delegate];
    uint64_t v14 = [v13 nfcController];
    [v14 terminate:0];

    __int16 v15 = (void *)*((void *)*v6 + 5);
    *((void *)*v6 + 5) = v12;
    id v16 = v12;

    [*v6 _transitionToState:4 error:0];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C760);
    }
    uint64_t v17 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041FD0(v6, v17);
    }
  }
}

void sub_10003124C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000312B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000319E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_100031A3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100031AA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100031B0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100031B74(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100031BDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = [WeakRetained suController];
  [v1 start];
}

void sub_100031C34(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(33, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031CE4;
  block[3] = &unk_10005C808;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void sub_100031CE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = [WeakRetained suController];
  [v1 install];
}

void sub_100031D3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100031DA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100031F5C(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopInstallTimer];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C890);
  }
  id v2 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    [v3 idleTimeInterval];
    uint64_t v6 = +[NSString stringWithFormat:@"Starting install timer with %lfs timeout...", v5];
    *(_DWORD *)buf = 138543618;
    id v16 = v3;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) idleTimeInterval];
  double v8 = v7;
  uint64_t v9 = +[NSDate date];
  uint64_t v10 = +[NSDate dateWithTimeInterval:v9 sinceDate:v8];

  id v11 = [objc_alloc((Class)PCPersistentTimer) initWithFireDate:v10 serviceIdentifier:@"com.apple.mobileinboxupdater.postsutimer" target:*(void *)(a1 + 32) selector:"handleInstallTimer:" userInfo:0];
  [*(id *)(a1 + 32) setInstallTimer:v11];

  id v12 = [*(id *)(a1 + 32) installTimer];
  [v12 setMinimumEarlyFireProportion:1.0];

  __int16 v13 = [*(id *)(a1 + 32) installTimer];
  uint64_t v14 = +[NSRunLoop mainRunLoop];
  [v13 scheduleInRunLoop:v14];
}

void sub_100032168(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10003231C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100032660(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000326C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100032730(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

uint64_t sub_1000329B0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_1000329D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100032E04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100032E6C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100032ED4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100033568(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000335D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100033638(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000336A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100033708(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_100033770(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000337D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileinboxupdater", "device");
  id v2 = (void *)qword_10006C950;
  qword_10006C950 = (uint64_t)v1;

  if (!qword_10006C950)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10003DA3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if (result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if (result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if (result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if (result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if (result) {
              return result;
            }
            uint64_t v3 = 0x1000000000;
          }
          else
          {
            uint64_t v3 = 0x800000000;
          }
        }
        else
        {
          uint64_t v3 = 0x400000000;
        }
      }
      else
      {
        uint64_t v3 = 8;
      }
    }
    else
    {
      uint64_t v3 = 3840;
    }
    *(void *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6)) {
      goto LABEL_3;
    }
    time_t v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6)) {
          *(void *)(a1 + 240) |= 0x1000000000uLL;
        }
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(unsigned char *)(v3 + 17)) {
      double result = sub_100034C3C((void *)v3, a2);
    }
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0) {
    goto LABEL_15;
  }
  double result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if (result) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(unsigned char *)(v3 + 16))
  {
    if (*(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!result
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !result)
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(unsigned char *)(v3 + 16) && *(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }
  return result;
}

uint64_t sub_100034C3C(void *a1, uint64_t a2)
{
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw((uint64_t)&dword_10005DB40[v2 / 4 + 2], *(const void **)a1, *(void *)(a1 + 8));
    if (!result) {
      break;
    }
    v2 += 32;
    if (v2 == 160) {
      return 0;
    }
  }
  if (v2 <= ~(unint64_t)dword_10005DB40) {
    return &dword_10005DB40[v2 / 4];
  }
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0;
  while (dword_10005DB40[v1 / 4] != result)
  {
    v1 += 32;
    if (v1 == 160) {
      return 0;
    }
  }
  if (v1 <= ~(unint64_t)dword_10005DB40) {
    return &dword_10005DB40[v1 / 4];
  }
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    uint64_t v6 = &CTOidSha1;
    uint64_t v4 = 5;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    uint64_t v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    uint64_t v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    uint64_t v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    uint64_t v6 = &CTOidSha384;
    goto LABEL_18;
  }
  uint64_t v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL)) {
      return 0;
    }
    uint64_t v6 = &CTOidSha512;
    goto LABEL_18;
  }
  uint64_t v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0;
  char v23 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!result
              || (unint64_t result = sub_100035188((uint64_t)&off_10005DC30, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), result))
            {
              unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v21 = a5[9];
              unint64_t v22 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0;
                    }
                    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v26 = -21846;
                    char v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0;
                          }
                          unint64_t result = __chkstk_darwin(v14);
                          id v16 = (unint64_t *)((char *)&v20 - v15);
                          unint64_t v17 = 0;
                          *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            id v19 = &v16[v17 / 8];
                            *(_OWORD *)id v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *id v16 = v11;
                            if (ccrsa_import_pub()) {
                              return 0;
                            }
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs()) {
                              return v23 != 0;
                            }
                            unint64_t result = 0;
                            char v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_100035188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0;
  BOOL v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3)) {
      break;
    }
    BOOL v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0;
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = sub_100035188((uint64_t)&off_10005DCB0, a5 + 24, a5 + 56), result))
            {
              uint64_t result = sub_100035474((int **)(a5 + 72));
              if (result)
              {
                uint64_t v8 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  uint64_t v9 = 24 * v8;
                  BOOL v10 = __CFADD__(v9, 16);
                  unint64_t v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    uint64_t result = __chkstk_darwin(result);
                    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
                    unint64_t v15 = 0;
                    do
                    {
                      id v16 = &v14[v15 / 8];
                      *id v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      uint64_t *v14 = result;
                      if (v12 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite()) {
                                return HIBYTE(v17) != 0;
                              }
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100035474(int **a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(void *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793) {
      return _ccec_cp_256();
    }
    return 0;
  }
  uint64_t v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497) {
    return _ccec_cp_384();
  }
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0;
  }
  return _ccec_cp_521();
}

uint64_t compressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  int v6 = (void *)sub_100035474(a2);
  if (!v6) {
    return 655366;
  }
  BOOL v7 = v6;
  uint64_t v8 = *v6;
  if (*v6 >> 61 || !is_mul_ok(8 * v8, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  uint64_t v9 = 24 * v8;
  BOOL v10 = __CFADD__(v9, 16);
  unint64_t v11 = v9 + 16;
  if (v10 || v11 >= 0xFFFFFFFFFFFFFFF0) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = __chkstk_darwin();
  unint64_t v15 = (uint64_t *)((char *)&v18 - v13);
  unint64_t v16 = 0;
  do
  {
    uint64_t v17 = &v15[v16 / 8];
    *uint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    v17[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 += 16;
  }
  while (v13 != v16);
  if (v14 < 0x10) {
    goto LABEL_21;
  }
  *unint64_t v15 = v7;
  if (v13 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t result = ccec_import_pub();
  if (!result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub();
      }
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  int v6 = (uint64_t *)sub_100035474(a2);
  if (!v6) {
    return 655366;
  }
  uint64_t v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v8 = 24 * v7;
  BOOL v9 = __CFADD__(v8, 16);
  unint64_t v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  unint64_t result = __chkstk_darwin();
  unint64_t v14 = (unint64_t *)((char *)&v18 - v12);
  unint64_t v15 = 0;
  do
  {
    unint64_t v16 = &v14[v15 / 8];
    *unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10) {
    goto LABEL_24;
  }
  unint64_t *v14 = result;
  if (v12 >= 1)
  {
    uint64_t v17 = ccec_compressed_x962_import_pub();
    if (!v17)
    {
      unint64_t result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = 393220;
          }
          ccec_export_pub();
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(unsigned __int8 *a1, uint64_t a2, unint64_t *a3, char a4)
{
  __int16 v28 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v29 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  __int16 v28 = a1;
  uint64_t v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = sub_100035EC4(&v28, 0x2000000000000010, (unsigned char *)&v27 + 1, &v26);
  uint64_t result = 65537;
  if (v7)
  {
    char v24 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v25 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    char v24 = v28;
    unint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (compare_octet_string_raw((uint64_t)&off_10005DD30, v24, v26)) {
        return 65539;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      if (!sub_100035EC4(&v24, 0xA000000000000000, &v27, &v26)) {
        return 65540;
      }
      unint64_t v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      char v23 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      char v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((sub_100035EC4(&v22, 0x2000000000000010, (unsigned char *)&v31 + 1, v30) & 1) == 0) {
        return 131073;
      }
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080;
      if (&v22[v30[0]] != v23) {
        return 131082;
      }
      unint64_t v10 = a3 + 11;
      if (!ccder_blob_decode_uint64()) {
        return 131074;
      }
      uint64_t result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!sub_100037AB0(&v22, 0x2000000000000011, 0, 125)) {
          return 131075;
        }
        unsigned __int8 v35 = 0;
        size_t v34 = 0;
        if ((sub_100035EC4(&v22, 0x2000000000000010, &v35, &v34) & 1) == 0) {
          return 131076;
        }
        __int16 v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        unsigned int v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        __int16 v32 = v22;
        unsigned int v33 = &v22[v34];
        if (!ccder_blob_decode_tl()) {
          return 131077;
        }
        if (v33 < v32 || v34 > v33 - v32) {
          goto LABEL_112;
        }
        if (compare_octet_string_raw((uint64_t)&off_10005DD40, v32, v34)) {
          return 131078;
        }
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        unint64_t v11 = &v32[v34];
        if (v32 > &v32[v34] || v11 > v33) {
          goto LABEL_112;
        }
        v32 += v34;
        int v12 = v35;
        if (v11 != v33 || v35)
        {
          unsigned __int8 v40 = 0;
          v38 = v33;
          unint64_t v39 = 0;
          int v37 = v11;
          if (sub_100035EC4(&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
              if (&v37[v39] != v33) {
                return v9;
              }
            }
            if (v37 > v38) {
              goto LABEL_112;
            }
            __int16 v32 = v37;
            unsigned int v33 = v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            if (v40 && !sub_100035EC4(&v32, 0x2000000000000004, &v36, &v39)) {
              return 131079;
            }
            unint64_t v41 = 0;
            if (!ccder_blob_decode_tl()) {
              return 131090;
            }
            uint64_t v17 = v32;
            uint64_t v18 = v33;
            if (v33 < v32) {
              goto LABEL_112;
            }
            unint64_t v19 = v41;
            if (v41 > v33 - v32) {
              goto LABEL_112;
            }
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            uint64_t v20 = &v17[v19];
            if (v20 > v18 || v17 > v20) {
              goto LABEL_112;
            }
            __int16 v32 = v20;
            if ((sub_100035F64((unint64_t *)&v32, v36) & 1) == 0) {
              return 131089;
            }
          }
          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }
          if ((sub_100035F64((unint64_t *)&v32, v16 != 0) & 1) == 0) {
            return 131088;
          }
          unint64_t v11 = v32;
        }
        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        if ((sub_100035F64((unint64_t *)&v22, v12 != 0) & 1) == 0) {
          return 131081;
        }
        int v37 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        v38 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        int v37 = v22;
        v38 = v23;
        if ((sub_100035EC4(&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          unint64_t v13 = v22;
          unint64_t v15 = v23;
          goto LABEL_86;
        }
        __int16 v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        unsigned int v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          __int16 v32 = v37;
          unsigned int v33 = &v37[v30[0]];
          if (!sub_100037814(&v32, a3[1], *a3, a3 + 3, a3 + 2)) {
            return 131085;
          }
          if (!sub_100035F64((unint64_t *)&v32, v31)) {
            return 131086;
          }
          unint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            unint64_t v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            char v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              int v37 = v13;
              v38 = v15;
              if (sub_100037AB0(&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                char v23 = v38;
              }
              if (!sub_100037AB0(&v22, 0x2000000000000011, (unsigned __int8 **)&v30[1], 125)) {
                return 131083;
              }
              if (v30[2] >= v30[1])
              {
                unint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((sub_100035F64((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0) {
                    return 131084;
                  }
                  if (!sub_100035F64((unint64_t *)&v22, v27)) {
                    return 65541;
                  }
                  if (v22 <= v25 && v24 <= v22)
                  {
                    char v24 = v22;
                    if (sub_100035F64((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543;
                      }
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t sub_100035EC4(unsigned __int8 **a1, uint64_t a2, unsigned char *a3, unint64_t *a4)
{
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL) {
      return sub_100037640(a1, a3, a4);
    }
  }
  return result;
}

uint64_t sub_100035F64(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  unint64_t v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1]) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(unsigned __int8 *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, long long *))
{
  v84 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v85 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  v84 = *(unsigned __int8 **)(a1 + 40);
  v85 = (unsigned __int8 *)(v4 + v3);
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }
  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((sub_100035EC4(&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }
    v69 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    v70 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > &v84[v72] || &v84[v72] > v85) {
      goto LABEL_92;
    }
    v69 = v84;
    v70 = &v84[v72];
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }
    uint64_t v9 = v69;
    int v8 = v70;
    v67 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    v67 = v69;
    unint64_t v68 = (unint64_t)v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl()) {
      break;
    }
    unint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&long long v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > &v10[v72] || &v10[v72] > v70) {
      goto LABEL_92;
    }
    v69 = &v10[v72];
    if (!ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }
    v63 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    v64 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&long long v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > &v63[v72] || &v63[v72] > v64) {
        goto LABEL_92;
      }
      v69 = &v63[v72];
      v70 = v64;
    }
    else
    {
      *((void *)&v75 + 1) = 0;
      *(void *)&long long v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&long long v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    int v12 = &v69[v72];
    if (v69 > &v69[v72] || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (sub_100037AB0(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      v69 = v63;
      v70 = v64;
    }
    if ((sub_100035F64((unint64_t *)&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      unint64_t v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if (result != 327710)
        {
          if (result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176 * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              unsigned int v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176 * v29);
                    unint64_t v37 = v35 + 176 * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0) {
                      goto LABEL_92;
                    }
                    long long v40 = v73;
                    long long v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    _OWORD *v36 = v40;
                    long long v42 = v76;
                    long long v43 = v77;
                    long long v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    long long v45 = v80;
                    long long v46 = v81;
                    long long v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60)) {
                goto LABEL_93;
              }
              uint64_t v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0) {
                goto LABEL_92;
              }
              long long v21 = v73;
              long long v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              _OWORD *v20 = v21;
              long long v23 = v76;
              long long v24 = v77;
              long long v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              long long v26 = v80;
              long long v27 = v81;
              long long v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }
    if (v69 == v85)
    {
      if (v60) {
        return 0;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0;
        v51 = *(_OWORD **)(a1 + 56);
        long long v52 = v73;
        long long v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        _OWORD *v51 = v52;
        long long v54 = v76;
        long long v55 = v77;
        long long v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        long long v57 = v80;
        long long v58 = v81;
        long long v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v67;
    unint64_t v11 = (unsigned __int8 *)v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    v69 = v10;
    v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v65;
    unint64_t v11 = v66;
    goto LABEL_17;
  }
  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3)
  {
    if (*(void *)a3 != 1) {
      return 524289;
    }
    uint64_t v8 = 524293;
    if (!ccder_blob_decode_tl()) {
      return 524290;
    }
    if (!ccder_blob_decode_tl()) {
      return 524291;
    }
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl()) {
          return 524292;
        }
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            uint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              uint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(void *)(a2 + 88) == 1) {
    return 524298;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl())
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }
  uint64_t v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295;
  }
  uint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a3 + 24;
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  uint64_t v9 = v8;
  memset(v86, 0, sizeof(v86));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      unint64_t v10 = v86;
      uint64_t v13 = ccdigest();
      unint64_t v11 = *v9;
      if (*v9 >= 0x41) {
        goto LABEL_180;
      }
      goto LABEL_16;
    }
    if (!v10) {
      goto LABEL_144;
    }
  }
  if (*v8 != v11)
  {
LABEL_144:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40) {
    goto LABEL_180;
  }
  uint64_t v13 = __memcpy_chk();
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v15 = (void *)(a3 + 128);
  uint64_t v16 = *(void *)(a3 + 48);
  if (!v16) {
    goto LABEL_159;
  }
  uint64_t v71 = a1;
  long long v79 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v80 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = *(void *)(a3 + 40);
  if (__CFADD__(v17, v16)) {
    goto LABEL_181;
  }
  unint64_t v18 = v17 + v16;
  if (v17 > v18)
  {
LABEL_180:
    __break(0x5519u);
    goto LABEL_181;
  }
  long long v79 = *(char **)(a3 + 40);
  unint64_t v80 = v18;
  unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 < v18)
  {
    int v19 = 0;
    uint64_t v74 = 0x2000000000000010;
    unsigned int v70 = 262146;
    unsigned int v73 = 262147;
    unsigned int v72 = 262148;
    do
    {
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = 262145;
        goto LABEL_176;
      }
      if (__CFADD__(v79, v78)) {
        goto LABEL_181;
      }
      unint64_t v20 = &v79[v78];
      long long v77 = (char *)0xAAAAAAAAAAAAAAAALL;
      long long v76 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (v79 > &v79[v78] || (unint64_t)v20 > v80) {
        goto LABEL_180;
      }
      long long v76 = v79;
      long long v77 = &v79[v78];
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = v70;
        goto LABEL_176;
      }
      long long v22 = v76;
      if (__CFADD__(v76, v78)) {
        goto LABEL_181;
      }
      if (v76 > &v76[v78] || &v76[v78] > v77) {
        goto LABEL_180;
      }
      v76 += v78;
      if (v78 != 9) {
        goto LABEL_147;
      }
      if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 3)
      {
        if (v19) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v33 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v33)
        {
          if (sub_100037BEC(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 1u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 4)
      {
        if ((v19 & 2) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v36 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v36)
        {
          if (sub_100037CA4((uint64_t)&v76, v34, v35, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 2u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 2)
      {
        if ((v19 & 0x10) != 0) {
          goto LABEL_149;
        }
        unint64_t v83 = 0xAAAAAAAAAAAAAAAALL;
        int v37 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v37)
        {
          BOOL v38 = v76;
          unint64_t v39 = v77;
          if (v76 >= v77)
          {
LABEL_111:
            if (v38 == v39) {
              uint64_t result = 0;
            }
            else {
              uint64_t result = 262155;
            }
          }
          else
          {
            while (1)
            {
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262157;
                goto LABEL_134;
              }
              memset(v84, 170, 16);
              if (__CFADD__(v76, v83)) {
                goto LABEL_181;
              }
              if (v76 > &v76[v83] || &v76[v83] > v77) {
                goto LABEL_180;
              }
              *(void *)v84 = v76;
              *(void *)&v84[8] = &v76[v83];
              if ((ccder_blob_decode_tl() & 1) == 0)
              {
                uint64_t result = 262151;
                goto LABEL_134;
              }
              long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              if (*(void *)&v84[8] < *(void *)v84 || v83 > *(void *)&v84[8] - *(void *)v84) {
                goto LABEL_180;
              }
              long long v81 = *(unsigned char **)v84;
              long long v82 = (unsigned char *)v83;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              if (*(void *)v84 > *(void *)v84 + v83 || *(void *)v84 + v83 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262152;
                goto LABEL_134;
              }
              uint64_t v41 = *(void *)v84;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              unint64_t v42 = *(void *)v84 + v83;
              if (*(void *)v84 > *(void *)v84 + v83) {
                goto LABEL_180;
              }
              uint64_t v43 = *(void *)&v84[8];
              if (v42 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (v42 != *(void *)&v84[8]) {
                break;
              }
              long long v44 = find_digest((uint64_t)&v81);
              if (v44)
              {
                unsigned int v45 = *v44;
                if (*v44 > *(_DWORD *)(a3 + 104))
                {
                  unsigned int v46 = *(_DWORD *)(v71 + 8);
                  if (!v46 || v45 <= v46)
                  {
                    *(_DWORD *)(a3 + 104) = v45;
                    unint64_t v47 = v83;
                    if (v83 > v43 - v41) {
                      goto LABEL_180;
                    }
                    *(void *)(a3 + 112) = v41;
                    *(void *)(a3 + 120) = v47;
                  }
                }
              }
              BOOL v38 = *(char **)v84;
              unint64_t v39 = v77;
              if (*(void *)v84 > (unint64_t)v77 || (unint64_t)v76 > *(void *)v84) {
                goto LABEL_180;
              }
              long long v76 = *(char **)v84;
              if (*(void *)v84 >= (unint64_t)v77) {
                goto LABEL_111;
              }
            }
            uint64_t result = 262153;
          }
        }
LABEL_134:
        v19 |= 0x10u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 5)
      {
        if ((v19 & 4) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v48 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v48)
        {
          if (sub_100037D9C((unint64_t *)&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 4u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 1)
      {
        if ((v19 & 8) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v51 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v51)
        {
          if (sub_100037E6C((unint64_t *)&v76, v49, v50, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 8u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 52)
      {
        if ((v19 & 0x20) != 0)
        {
LABEL_149:
          uint64_t result = 262149;
          goto LABEL_176;
        }
        v19 |= 0x20u;
      }
      else
      {
        uint64_t v29 = *(void *)v22;
        int v30 = v22[8];
        if (v29 != 0x9010DF78648862ALL || v30 != 15)
        {
LABEL_147:
          uint64_t result = 262150;
          goto LABEL_176;
        }
        if ((v19 & 0x40) != 0) {
          goto LABEL_149;
        }
        *(void *)v84 = 0xAAAAAAAAAAAAAAAALL;
        int v32 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v32)
        {
          if (sub_100037F24(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 0x40u;
        if (result) {
          goto LABEL_176;
        }
      }
      if ((unint64_t)v20 > v80 || v79 > v20) {
        goto LABEL_180;
      }
      long long v79 = v20;
    }
    while ((unint64_t)v20 < v80);
    if ((~v19 & 3) == 0)
    {
      uint64_t v53 = ccder_sizeof_tag();
      uint64_t v54 = ccder_sizeof_len();
      BOOL v55 = __CFADD__(v53, v54);
      unint64_t v56 = v53 + v54;
      if (v55) {
        goto LABEL_182;
      }
      if (v56 > 0x14)
      {
        uint64_t result = 327689;
        goto LABEL_176;
      }
      memset(v84, 170, sizeof(v84));
      long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v84, v56))
      {
        if (&v84[v56] <= (unsigned char *)&v85 && v84 <= &v84[v56])
        {
          long long v81 = v84;
          long long v82 = &v84[v56];
          uint64_t v57 = ccder_blob_encode_tl();
          if (!v57)
          {
            uint64_t result = 327688;
            goto LABEL_176;
          }
          unint64_t v58 = v9[1];
          BOOL v55 = __CFADD__(v58, 8);
          unint64_t v59 = v58 + 8;
          if (!v55)
          {
            unint64_t v60 = v9[2];
            BOOL v55 = __CFADD__(v59, v60);
            unint64_t v61 = v59 + v60;
            if (!v55)
            {
              BOOL v55 = __CFADD__(v61, 4);
              unint64_t v62 = v61 + 4;
              if (!v55 && v62 < 0xFFFFFFFFFFFFFFF8)
              {
                __chkstk_darwin(v57);
                v64 = (char *)&v69 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
                memset(v64, 170, ((v65 - 9) & 0xFFFFFFFFFFFFFFF8) + 8);
                ccdigest_init();
                ccdigest_update();
                ccdigest_update();
                uint64_t v13 = ((uint64_t (*)(unint64_t *, char *, _OWORD *))v9[7])(v9, v64, v86);
LABEL_159:
                uint64_t result = CMSBuildPath(v13, (uint64_t)a2, a3);
                switch((int)result)
                {
                  case 524293:
                  case 524295:
                    *(_DWORD *)(a3 + 168) = result;
                    return 0;
                  case 524294:
                    goto LABEL_176;
                  case 524296:
                    if (*(_DWORD *)(a3 + 168) != 458753) {
                      goto LABEL_167;
                    }
                    int v66 = 524296;
LABEL_166:
                    *(_DWORD *)(a3 + 168) = v66;
LABEL_167:
                    unint64_t v67 = *v9;
                    if (*v9 > 0x40) {
                      goto LABEL_180;
                    }
                    v75[0] = v86;
                    v75[1] = v67;
                    uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v75, v6);
                    if (!result || result == 655648 || result == 655632)
                    {
                      int v68 = *(_DWORD *)(a3 + 168);
                      if (!v68 || v68 == 458753 || v68 == 327681) {
                        *(_DWORD *)(a3 + 168) = result;
                      }
                      uint64_t result = 0;
                    }
                    break;
                  case 524297:
                    int v66 = 524297;
                    goto LABEL_166;
                  default:
                    if (result) {
                      goto LABEL_176;
                    }
                    goto LABEL_167;
                }
                goto LABEL_176;
              }
            }
          }
LABEL_182:
          __break(0x5500u);
          JUMPOUT(0x1000372C8);
        }
        goto LABEL_180;
      }
LABEL_181:
      __break(0x5513u);
    }
  }
  uint64_t result = 262156;
LABEL_176:
  if ((_OWORD *)*v15 == v86)
  {
    *unint64_t v15 = 0;
    *(void *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  return sub_100037398(a1, a2, a3, a4, a5, a6, a7, &v8, &v9);
}

uint64_t sub_100037398(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  long long v27 = v19;
  *(void *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if (result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0) {
    return result;
  }
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, long long *))validateSignerInfoAndChain);
  if (!result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  return sub_100037398(a1, a2, a3, a4, a5, &v6, &v7, &v8, &v9);
}

uint64_t CMSVerifyAndReturnSignedData(unsigned __int8 *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  return sub_100037398(a1, a2, 0, 0, a5, &v6, &v7, a3, a4);
}

uint64_t sub_100037640(unsigned __int8 **a1, unsigned char *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v4 = (unint64_t)a1[1];
  if ((unint64_t)v3 >= v4) {
    return 0;
  }
  if (v3 == (unsigned __int8 *)-1)
  {
LABEL_42:
    __break(0x5513u);
    JUMPOUT(0x100037804);
  }
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
    goto LABEL_42;
  }
  *a1 = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (void)v5) < 1) {
          return 0;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        uint64_t v9 = v3 + 2;
        if (v5 > v9 || (unint64_t)v9 > v4) {
          goto LABEL_41;
        }
        *a1 = v9;
        unint64_t v7 = *v5;
        uint64_t v5 = v9;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (void)v5) < 2) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = (unint64_t)v3[1] << 8;
        uint64_t v12 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (void)v5) < 3) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v12 = v3[3];
LABEL_40:
        unint64_t v7 = v11 | v12;
        *a1 = v10;
        uint64_t v5 = v10;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7) {
    return 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t sub_100037814(unsigned __int8 **a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  int v30 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *a1;
  unint64_t v6 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  int v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = (unint64_t)v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    long long v27 = (unint64_t **)(a4 + 1);
    long long v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!ccder_blob_decode_tag()) {
        return 0;
      }
      if (!v32) {
        goto LABEL_8;
      }
      if (!sub_100037640(&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010) {
        return 0;
      }
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25) {
        goto LABEL_44;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *unint64_t v17 = v15;
        *long long v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        unint64_t *v23 = *a4;
        int v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        long long v20 = v27;
        if (!v7) {
          long long v20 = v19;
        }
        char *v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, (unint64_t *)&v30, 0, 0)) {
        return 0;
      }
      if (v6 < (unint64_t)v5) {
        goto LABEL_43;
      }
      long long v21 = v30;
      long long v22 = (unsigned __int8 *)(v30 - v5);
      if (v30 - v5 > v6 - (unint64_t)v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if ((unint64_t)v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = (unsigned __int8 *)v6;
      ++v12;
      if ((unint64_t)v21 < v6)
      {
        v15 += 304;
        uint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }
      goto LABEL_8;
    }
  }
}

uint64_t sub_100037AB0(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3, int a4)
{
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = sub_100037640(a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = sub_100037AB0(a1, 0, 0, (char)(a4 - 1));
        if (!result) {
          return result;
        }
        return (sub_100035F64((unint64_t *)a1, 1) & 1) != 0;
      }
      return 0;
    }
    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = &v11[v13];
    if (v11 <= &v11[v13] && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_100037BEC(char **a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if ((unint64_t)*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v3 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (v3 <= v3 - 0x5555555555555556) {
        return compare_octet_string_raw((uint64_t)&off_10005DD40, v3, 0xAAAAAAAAAAAAAAAALL) == 0;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_100037CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*(void *)a1 >= 0x5555555555555556uLL)
    {
      __break(0x5513u);
    }
    else if (*(void *)a1 - 0x5555555555555556 == *(void *)(a1 + 8))
    {
      uint64_t result = (uint64_t)find_digest(a4 + 24);
      if (result)
      {
        if (*(void *)(a4 + 136) != 0xAAAAAAAAAAAAAAAALL
          || *(void *)(*(uint64_t (**)(void))(result + 24))() != 0xAAAAAAAAAAAAAAAALL
          || memcmp(*(const void **)(a4 + 128), *(const void **)a1, 0xAAAAAAAAAAAAAAAALL))
        {
          *(_DWORD *)(a4 + 168) = 458754;
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100037D9C(unint64_t *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_10;
  }
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    goto LABEL_7;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v3 = v4;
  if (v4 > v5) {
LABEL_10:
  }
    __break(0x5519u);
  *a1 = v4;
  a1[1] = v5;
LABEL_7:
  if (v3 < 0x5555555555555556) {
    return v3 - 0x5555555555555556 == a1[1];
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100037E6C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v7 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (*(_DWORD *)(a4 + 104)) {
        return 1;
      }
      if (v7 <= v7 - 0x5555555555555556)
      {
        *(void *)(a4 + 112) = v7;
        *(void *)(a4 + 120) = 0xAAAAAAAAAAAAAAAALL;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_100037F24(void *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 >= 0x5555555555555556uLL) {
      __break(0x5513u);
    }
    else {
      return *a1 - 0x5555555555555556 == a1[1];
    }
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if (ccder_blob_decode_tl()) {
    return 0;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      unint64_t v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v11 = *a1;
    unint64_t v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v11;
      if (v16 < v11) {
        goto LABEL_42;
      }
      *a3 = v11;
      a3[1] = 0;
      int v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v12 = *a1;
    unint64_t v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v12;
      if (v17 < v12) {
        goto LABEL_42;
      }
      *a3 = v12;
      a3[1] = 0;
      int v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v13 = *a1;
    unint64_t v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v13;
      if (v18 < v13) {
        goto LABEL_42;
      }
      *a3 = v13;
      a3[1] = 0;
      int v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v14 = *a1;
    unint64_t v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v14;
      if (v19 < v14) {
        goto LABEL_42;
      }
      *a3 = v14;
      a3[1] = 0;
      int v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v15 = *a1;
    unint64_t v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v15;
      if (v20 < v15) {
        goto LABEL_42;
      }
      *a3 = v15;
      a3[1] = 0;
      int v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      int v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      *unint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!result)
  {
    uint64_t result = 720914;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return sub_100038964(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&unk_10005DDA0, 2);
}

uint64_t sub_100038964(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  uint64_t result = (uint64_t)memset(__b, 170, sizeof(__b));
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if (result) {
    return result;
  }
  uint64_t result = 327690;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  long long v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  uint64_t *v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if (result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  long long v24 = oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, (uint64_t)v24, v23 + 16, v23 + 40);
  if (result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0) {
      goto LABEL_35;
    }
    if (compare_octet_string_raw(v23 + 248, a9, a10)) {
      return 590085;
    }
  }
  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0;
  }
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if (result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  uint64_t result = sub_1000398A4((uint64_t)v27, a7, a8);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return sub_100038964(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&unk_10005DDA0, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return sub_100038964(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&unk_10005DDD8, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, unsigned char *a9, uint64_t a10, BOOL *a11)
{
  return sub_100038964(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&unk_10005DE10, 0x10000000000);
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, long long *a11)
{
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if (result) {
    return result;
  }
  if (v35 != v36) {
    return 327690;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    long long v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      long long v21 = &v38[1];
    }
    *long long v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    long long v31 = *a11;
    v32[0] = *((unsigned char *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(long long *)((char *)a11 + 24);
      long long v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }
    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      long long v27 = oidForPubKeyLength();
    }
    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        uint64_t result = 0;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      long long v22 = (unsigned char *)v38[2];
      while (v22[265])
      {
        long long v22 = (unsigned char *)*((void *)v22 + 34);
        if (!v22)
        {
          long long v22 = (unsigned char *)v38[2];
          break;
        }
      }
    }
    else
    {
      long long v22 = 0;
    }
  }
  else
  {
    long long v22 = v39;
  }
  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, &xmmword_10005DE48);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, &xmmword_10005DE80);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, &xmmword_10005DEB8);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, &xmmword_10005DEB8);
}

uint64_t CTEvaluatePragueSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_100051BC0;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_100051BD0;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13) {
          return 327704;
        }
        unint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0;
          uint64_t v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6) {
              return 327705;
            }
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
            if ((unint64_t)--v16 < v4) {
              goto LABEL_23;
            }
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1) {
    goto LABEL_41;
  }
  unint64_t v9 = (unsigned char *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0;
    uint64_t v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4) {
          continue;
        }
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  uint64_t v10 = 0;
LABEL_23:
  if (v10 == a2) {
    return 0;
  }
  else {
    return 589829;
  }
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 327702;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(void, int *, uint64_t))sub_10003936C, (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }
  return v3;
}

uint64_t sub_10003936C(uint64_t result, void *a2, unint64_t a3)
{
  if (result != 2) {
    return 1;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  if (&v4[v5] == (char *)-1) {
    goto LABEL_50;
  }
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if (result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1;
        }
        unint64_t v14 = (unsigned char *)*a2;
        if (*(unsigned char *)*a2 != 42) {
          return 1;
        }
        if (v14 != (unsigned char *)-1)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL) {
              uint64_t v16 = (uint64_t)v14;
            }
            uint64_t v17 = -v16;
            uint64_t v18 = 2;
            uint64_t result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1;
                }
                size_t v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }
                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!result) {
                    goto LABEL_48;
                  }
                }
                if (v11 != 46) {
                  return 1;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18) {
                return result;
              }
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      uint64_t result = 0;
      *(unsigned char *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  unint64_t v20 = 0xAAAAAAAA00AAAA01;
  unint64_t v21 = &null_octet;
  long long v19 = xmmword_100051BE0;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  long long v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!result)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3)) {
    return 0;
  }
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKTestRootSKID)) {
    return compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKProdRootSKID) == 0;
  }
  return 2;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0, 0, 0, 0, &xmmword_10005DEF0), result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, (uint64_t)&unk_1000518E0, 97, 0, 0, &xmmword_10005DEF0);
      }
    }
  }
  return result;
}

uint64_t sub_1000398A4(uint64_t result, unsigned char *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6) {
        continue;
      }
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1) {
    goto LABEL_31;
  }
  unint64_t v8 = v7 + 1;
  int v3 = 327693;
  uint64_t result = 327693;
  if ((unint64_t)(v7 + 1) >= v6) {
    return result;
  }
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (void)v8)) {
    goto LABEL_31;
  }
  if (v6 - (void)v8 != 2 * a3) {
    return (v3 + 1);
  }
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  BOOL v9 = v7 + 2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3]) {
      return result;
    }
    int v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8) {
      goto LABEL_34;
    }
    size_t v12 = &asciiNibbleToByte[*v11];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v12 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v12 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    if (v11 < v7) {
      goto LABEL_34;
    }
    unint64_t v14 = &asciiNibbleToByte[*v9];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v14 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v14 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    unsigned int v15 = *v12;
    uint64_t result = 327695;
    if (v15 > 0xF) {
      return result;
    }
    unsigned int v16 = *v14;
    if (v16 > 0xF) {
      return result;
    }
    if (v10 < a2) {
      goto LABEL_34;
    }
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9) {
      goto LABEL_31;
    }
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!sub_10003A3B0(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (sub_10003A4C8() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0 || (sub_10003A598(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0) {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (sub_10003A668(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (sub_10003A790(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (sub_10003A854(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (sub_10003A964(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!sub_10003AA38((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = sub_10003AAC4((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_10003A3B0(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t sub_10003A4C8()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t sub_10003A598(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = sub_10003A3B0(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_10003A668(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003A790(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_10003A854(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t sub_10003A964(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_10003AA38(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10003AAC4(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return sub_10003CC60(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)sub_10003CE84((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return sub_10003C9F0((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return sub_10003CAD4();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return sub_10003C630((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = sub_10003A3B0((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return sub_10003C76C((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return sub_10003C904((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }

  return sub_10003CD30((unint64_t *)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (!ccder_blob_decode_tl()) {
    return v10;
  }
  if (!ccder_blob_decode_tl()) {
    return 655363;
  }
  if (v14 >= 0x5555555555555556) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl()) {
    return 655362;
  }
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  unint64_t v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  if (!ccder_blob_decode_bitstring()) {
    return 655364;
  }
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15) {
    return 0;
  }
  else {
    return 655365;
  }
}

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = 327691;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, void *a3, uint64_t a4)
{
  long long v16 = 0uLL;
  long long v15 = 0uLL;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v7 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v16, (unint64_t *)&v15, &v13);
  if (v7) {
    return v7;
  }
  uint64_t v7 = 655632;
  int v9 = compare_octet_string((uint64_t)&v16, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string((uint64_t)&v16, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return 655617;
    }
  }
  unint64_t v12 = v10;
  if (((a1 & 1) == 0 || compare_octet_string_raw(a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw(a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw(a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw(a4, &CTOidSha512, 9uLL)))
  {
    return v7;
  }
  uint64_t result = v13;
  if ((v14 || !v13) && (a3[1] || !*a3))
  {
    if (v12(v13)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10[2] = v6;
  v10[3] = v6;
  v10[0] = v6;
  v10[1] = v6;
  v9[0] = v10;
  v9[1] = 64;
  v8[0] = 0;
  v8[1] = 0;
  uint64_t result = sub_10003BB84(a3, a4, (uint64_t)v9, v8);
  if (!result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v9, (uint64_t)v8);
  }
  return result;
}

uint64_t sub_10003BB84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if (result) {
    return 656640;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[2] = v7;
  v16[3] = v7;
  v16[0] = v7;
  v16[1] = v7;
  uint64_t v14 = v16;
  uint64_t v15 = 64;
  long long v13 = 0uLL;
  uint64_t v8 = sub_10003BB84(a4, a5, (uint64_t)&v14, &v13);
  if (v8) {
    return v8;
  }
  uint64_t v8 = 655617;
  int v9 = compare_octet_string(a2, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string(a2, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return v8;
    }
  }
  uint64_t result = *a1;
  if ((a1[1] || !result) && (!v14 || v15))
  {
    if (v10(result)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0;
    }
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0) {
      break;
    }
    if ((a2(v9[0], &v9[1], a3) & 1) == 0) {
      return 0;
    }
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  uint64_t v6 = 720901;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20) {
        return 720898;
      }
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl()) {
          return 720899;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        if (!ccder_blob_decode_tl()) {
          return 720900;
        }
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(unsigned char *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
              if (!ccder_blob_decode_tl()) {
                return v6;
              }
            }
          }
          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }
        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }
      if (v2 != v7) {
        return 720903;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4) {
    return 720904;
  }
  if (a2[1] && *a2) {
    return 0;
  }
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0;
  time_t v5 = 0;
  time_t v6 = 0;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, &v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return sub_10003C50C(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return sub_10003C50C(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0);

  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  uint64_t v1 = 720906;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6)) {
        return 720907;
      }
      if (ccder_blob_decode_Time(v6)) {
        return 0;
      }
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_10003C50C(const char **a1, time_t *a2)
{
  uint64_t v2 = 720909;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF) {
    return v2;
  }
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }
  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  int v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(void)*a1]) {
      return 720910;
    }
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911;
    }
    uint64_t v2 = 0;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL sub_10003C630(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t sub_10003C76C(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003C904(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003C9F0(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003CAD4()
{
  return 0;
}

uint64_t sub_10003CC60(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= (unint64_t)&_mh_execute_header;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t sub_10003CD30(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *sub_10003CE84(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if (result) {
        return result;
      }
      if (v10)
      {
        if ((unint64_t)v16 < a2) {
          goto LABEL_30;
        }
        if ((unint64_t)(v14 + 4) > v11) {
          goto LABEL_30;
        }
        unint64_t v17 = (void *)*v13;
        void *v14 = 0;
        v14[1] = v17;
        if (v14 != (void *)272 && (unint64_t)v16 >= v11) {
          goto LABEL_30;
        }
        *unint64_t v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }
      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }
      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
    if (*(void *)(i + 192) && !compare_octet_string(a2, i + 184)) {
      break;
    }
  }
  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      uint64_t v2 = (void *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if (result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (sub_10003D20C(v10, 1)) {
            return 0;
          }
          uint64_t v15 = sub_10003D2A4(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (v15) {
            return 0;
          }
          else {
            return v16;
          }
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }
      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0;
      if (!v14) {
        return result;
      }
    }
    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }
    return 524297;
  }
  return result;
}

uint64_t sub_10003D20C(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!result) {
        return v7;
      }
      if (!--v3) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_10003D2A4(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!result) {
        return v5;
      }
      if (!--v1) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208)) {
          return 327701;
        }
        uint64_t v8 = *v6;
      }
    }
  }
  if (v8)
  {
    unint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }
      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(unsigned char *)(a3 + 16))
      {
        uint64_t v20 = sub_10003D20C(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t v20 = sub_10003D2A4(v8 + 168);
      }
      unint64_t v14 = v20;
      v33 |= v20 != 0;
      unint64_t v15 = v20 + 304;
      if (v20) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(unsigned char *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(unsigned char *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }
        if ((*(unsigned char *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }
      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }
      if (*(unsigned char *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        if (compare_octet_string(v8 + 168, v14 + 184)) {
          return v12 | 0x9000Au;
        }
      }
      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(unsigned char *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }
          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40);
        if (result) {
          return result;
        }
      }
      unint64_t v21 = v11 + 1;
      if (v11 == -1) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }
  unint64_t v21 = 0;
  uint64_t v13 = -1;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if (v8)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(void *)a3 != v22) {
      return (v22 << 8) | 0x90006u;
    }
  }
  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(unsigned char *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184;
    if (v8) {
      uint64_t v27 = 168;
    }
    uint64_t v28 = sub_10003D20C(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40))
    {
      goto LABEL_87;
    }
    int v26 = 589836;
    return v24 | v26;
  }
  int v24 = v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(unsigned char *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, sizeof(v35));
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), v25 + 16, v25 + 40))goto LABEL_72; {
  }
    }
  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }
LABEL_87:
  uint64_t result = 0;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

void sub_10003D844(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10003D8B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10003D91C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10003D988(uint64_t a1, void *a2, const __CFArray *a3)
{
  uint64_t v5 = a2;
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  CFIndex Count = CFArrayGetCount(a3);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to read temp key: %{public}@; %lu matching sensors",
    (uint8_t *)&v6,
    0x16u);
}

void sub_10003DA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DA78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DAB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DAE8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_100008714((void *)&_mh_execute_header, a2, a3, "Cannot start card emulation; error: %{public}@", (uint8_t *)&v4);
}

void sub_10003DB64()
{
  sub_100008740();
  sub_100008714((void *)&_mh_execute_header, v0, v1, "Failed to start HCE session: %{public}@", v2);
}

void sub_10003DBD0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_100008714((void *)&_mh_execute_header, a2, a3, "HCE listening thread failed to stop card emulation; error: %{public}@",
    (uint8_t *)&v4);
}

void sub_10003DC48()
{
  sub_10000872C();
  _DWORD *v0 = 138412290;
  *uint64_t v1 = v2;
  sub_100008714((void *)&_mh_execute_header, v4, (uint64_t)v1, "Failed to send APDU response: %@", v3);
}

void sub_10003DC88(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 138543362;
  *a2 = 0;
  sub_100008714((void *)&_mh_execute_header, a3, (uint64_t)a3, "Fatal error: response data is %{public}@; returning 0x6A88",
    a1);
}

void sub_10003DCC8()
{
  sub_10000872C();
  _DWORD *v0 = 138543362;
  *uint64_t v1 = v2;
  sub_100008714((void *)&_mh_execute_header, v4, (uint64_t)v1, "Failed to read packet with error: %{public}@", v3);
}

void sub_10003DD08()
{
  sub_100008740();
  sub_100008714((void *)&_mh_execute_header, v0, v1, "Failed to parse APDU command:%{public}@; format invalid", v2);
}

void sub_10003DD74(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 code];
  sub_100008740();
  sub_100008714((void *)&_mh_execute_header, v3, v4, "APDU command %ld rejected", v5);
}

void sub_10003DE04(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 code];
  sub_100008740();
  sub_100008714((void *)&_mh_execute_header, v3, v4, "Failed to serialize response data to command %ld", v5);
}

void sub_10003DE94(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 60;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NFC termination wait timed out after %ds", (uint8_t *)v1, 8u);
}

void sub_10003DF14(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 code];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unrecognized cmd: %ld, rejecting...", (uint8_t *)&v4, 0xCu);
}

void sub_10003DFB0()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to fetch device ecid", v2, v3, v4, v5, v6);
}

void sub_10003DFE4()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to fetch device boardID", v2, v3, v4, v5, v6);
}

void sub_10003E018()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to fetch device chipID", v2, v3, v4, v5, v6);
}

void sub_10003E04C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to fetch security domain", v2, v3, v4, v5, v6);
}

void sub_10003E080()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to fetch device apNonce", v2, v3, v4, v5, v6);
}

void sub_10003E0B4()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to fetch device sepNonce", v2, v3, v4, v5, v6);
}

void sub_10003E0E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10003E154(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10003E1C4(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 60;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NFC start wait timed out after %ds", (uint8_t *)v1, 8u);
}

void sub_10003E244(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E2B0(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ already terminated, not starting session restart timer", (uint8_t *)a2, 0xCu);
}

void sub_10003E31C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to serialize response error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_10003E3C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E3FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E434(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E46C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to read SMC key: %{public}@; no open SMC connection",
    (uint8_t *)&v2,
    0xCu);
}

void sub_10003E4E4(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 1024;
  int v8 = 120;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Key %{public}@ has size %d which exceeds maximum expected size of %d", (uint8_t *)&v3, 0x18u);
}

void sub_10003E578(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  __int16 v7 = 1024;
  int v8 = 32;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to write key: %{public}@; data %{public}@ exceeds maximum allowed length: %d",
    (uint8_t *)&v3,
    0x1Cu);
}

void sub_10003E610(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "AppleSMC";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to find matching io service to %s", (uint8_t *)&v1, 0xCu);
}

void sub_10003E694()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to open service port to SMC; ret: %d", v2, v3, v4, v5, v6);
}

void sub_10003E6FC()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to send user client open command to SMC; ret: %d",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10003E764()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to close service port to SMC; ret: %d", v2, v3, v4, v5, v6);
}

void sub_10003E7CC()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to send user client close command to SMC; ret: %d",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10003E834()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os_log_t", v0, 2u);
}

void sub_10003E87C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown op code %lu", (uint8_t *)&v2, 0xCu);
}

void sub_10003E8F4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E964(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E9D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void sub_10003EA3C()
{
  sub_1000125B0();
  id v2 = v1;
  sub_1000125D4();
  sub_10001252C();
  sub_100012544((void *)&_mh_execute_header, v3, v4, "ECID verification failed; expected: %llx; ECID %llx",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void sub_10003EAC8()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse ECID tag", v2, v3, v4, v5, v6);
}

void sub_10003EAFC()
{
  sub_1000125B0();
  id v2 = v1;
  sub_1000125D4();
  sub_10001252C();
  sub_100012544((void *)&_mh_execute_header, v3, v4, "CHIP verification failed; expected: %llx; CHIP %llx",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void sub_10003EB88()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse CHIP tag", v2, v3, v4, v5, v6);
}

void sub_10003EBBC()
{
  sub_1000125B0();
  id v2 = v1;
  sub_1000125D4();
  sub_10001252C();
  sub_100012544((void *)&_mh_execute_header, v3, v4, "BORD verification failed; expected: %llx; BORD %llx",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void sub_10003EC48()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse BORD tag", v2, v3, v4, v5, v6);
}

void sub_10003EC7C()
{
  sub_1000125B0();
  id v2 = v1;
  sub_1000125D4();
  sub_10001252C();
  sub_100012544((void *)&_mh_execute_header, v3, v4, "SDOM verification failed; expected: %llx; SDOM %llx",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void sub_10003ED08()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse SDOM tag", v2, v3, v4, v5, v6);
}

void sub_10003ED3C()
{
  sub_100012598();
  sub_1000125BC((void *)&_mh_execute_header, v0, (uint64_t)v0, "CPRO verification failed; expected: %d; CPRO %d", v1);
}

void sub_10003EDB0()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse CPRO tag", v2, v3, v4, v5, v6);
}

void sub_10003EDE4()
{
  sub_100012598();
  sub_1000125BC((void *)&_mh_execute_header, v0, (uint64_t)v0, "CSEC verification failed; expected: %d; CSEC %d", v1);
}

void sub_10003EE58()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse CSEC tag", v2, v3, v4, v5, v6);
}

void sub_10003EE8C()
{
  sub_100012580();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "BNCH verification failed; expected: %{public}@; BHCH: %{public}@",
    v1,
    0x16u);
}

void sub_10003EF08()
{
  sub_100012564();
  sub_1000125BC((void *)&_mh_execute_header, v0, v1, "Parsed BNCH tag size : %u is not of expected size %d", v2);
}

void sub_10003EF78()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse BNCH tag", v2, v3, v4, v5, v6);
}

void sub_10003EFAC()
{
  sub_100012580();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "SNON verification failed; expected: %{public}@; SNON: %{public}@",
    v1,
    0x16u);
}

void sub_10003F028()
{
  sub_100012564();
  sub_1000125BC((void *)&_mh_execute_header, v0, v1, "Parsed snon tag size : %u is not of expected size %d", v2);
}

void sub_10003F098()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse snon tag", v2, v3, v4, v5, v6);
}

void sub_10003F0CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "eibu verification failed; expected: 1; eibu %{public}@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_10003F144()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to parse eibu tag", v2, v3, v4, v5, v6);
}

void sub_10003F178(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F1B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_10003F1E8()
{
  uint64_t v0 = abort_report_np();
  return sub_10003F210(v0);
}

void sub_10003F210(void *a1)
{
  uint64_t v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to synchronize with CFPreferences.", (uint8_t *)&v3, 0xCu);
}

void sub_10003F2B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003F330(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Certificate file %{public}@ does not exist", (uint8_t *)&v2, 0xCu);
}

void sub_10003F3A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F3E0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client does not have entitlement %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003F458(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client entitlement %@ value is FALSE", (uint8_t *)&v2, 0xCu);
}

void sub_10003F4D0(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Client entitlement %@ does not have expected %@ value", (uint8_t *)&v5, 0x16u);
}

void sub_10003F594(void *a1, void *a2)
{
  id v3 = a1;
  [a2 charValue];
  sub_100018838((void *)&_mh_execute_header, v4, v5, "Tag 0x%X is not recognized", v6, v7, v8, v9, 0);
}

void sub_10003F620(void *a1, void *a2)
{
  id v3 = a1;
  [a2 unsignedIntValue];
  sub_100018838((void *)&_mh_execute_header, v4, v5, "Unrecognized deserialization data type: 0x%X", v6, v7, v8, v9, 0);
}

void sub_10003F6AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F718()
{
  sub_1000187C8();
  sub_10001881C((void *)&_mh_execute_header, v0, v1, "Len of num to convert %u cannot be greater than %lu", v2, v3, v4, v5, v6);
}

void sub_10003F780()
{
  sub_1000187E4();
  sub_1000187FC((void *)&_mh_execute_header, v0, v1, "Data %{public}@ does not have expected len %u");
}

void sub_10003F7E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F854(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F88C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F8C4()
{
  sub_100008740();
  sub_100004B28((void *)&_mh_execute_header, v0, v1, "Failed to start software update download; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10003F92C()
{
  sub_100008740();
  sub_100004B28((void *)&_mh_execute_header, v0, v1, "Failed to start software update install; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10003F994()
{
  sub_100008740();
  sub_100004B28((void *)&_mh_execute_header, v0, v1, "Failed software update download; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10003F9FC()
{
  sub_100008740();
  sub_100004B28((void *)&_mh_execute_header, v0, v1, "Unknown software update phase string: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003FA64()
{
  sub_100008740();
  sub_100004B28((void *)&_mh_execute_header, v0, v1, "Failed software update install; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10003FACC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003FB04(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 180;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Waiting for SU purge timed out after %ds", (uint8_t *)v1, 8u);
}

void sub_10003FB84(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cmd: %@ is not allowed at state: %lu, rejecting...", buf, 0x16u);
}

void sub_10003FBDC(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpectedly received didStopHeartbeat delegate in state :%ld", buf, 0xCu);
}

void sub_10003FC24(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 state];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unrecognized state: %lu; fatal error",
    (uint8_t *)&v4,
    0xCu);
}

void sub_10003FCC0(void *a1, void *a2)
{
  id v3 = a1;
  [a2 state];
  sub_10001FC24();
  sub_100012544((void *)&_mh_execute_header, v4, v5, "Unrecognized device state %lu; cannot transition to %lu",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_10003FD54(void *a1, void *a2)
{
  id v3 = a1;
  [a2 state];
  sub_10001FC24();
  sub_100012544((void *)&_mh_execute_header, v4, v5, "Not allowed to transition from state %lu to state %lu", v6, v7, v8, v9, v10);
}

void sub_10003FDE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003FE20(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "+[MIBUDefaultPreferences setObject:forKey:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - Failed to set value %{public}@ for key %{public}@", (uint8_t *)&v3, 0x20u);
}

void sub_10003FEB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve device activation state with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003FF30()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to get percent battery remaining: 0x%X", v2, v3, v4, v5, v6);
}

void sub_10003FF98()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to open smc service", v2, v3, v4, v5, v6);
}

void sub_10003FFCC()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to set charge limit: %u", v2, v3, v4, v5, v6);
}

void sub_100040034()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to register for charge limit: %u", v2, v3, v4, v5, v6);
}

void sub_10004009C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to disable Carrier Mode.No charge token present from Enabling Carrier Mode. Can't cancel token", v2, v3, v4, v5, v6);
}

void sub_1000400D0()
{
  sub_1000102AC();
  sub_100010290((void *)&_mh_execute_header, v0, v1, "Failed to cancel token: %u", v2, v3, v4, v5, v6);
}

void sub_100040138(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to read %{public}@ key with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000401C0()
{
  sub_1000187E4();
  sub_1000187FC((void *)&_mh_execute_header, v0, v1, "Failed notify_cancel for %s; status =0x%X", v2, v3);
}

void sub_100040228()
{
  sub_1000187E4();
  sub_1000187FC((void *)&_mh_execute_header, v0, v1, "Failed notify_get_state for %s; status=x%X", v2, v3);
}

void sub_100040290()
{
  sub_1000187E4();
  sub_1000187FC((void *)&_mh_execute_header, v0, v1, "Failed notify_register_check for %s; status=0x%X", v2, v3);
}

void sub_1000402F8(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ is currently monitoring network connection", (uint8_t *)a2, 0xCu);
}

void sub_100040364(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_1000403D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10004043C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 localRetryLimit];
  sub_1000269B0();
  sub_100012544((void *)&_mh_execute_header, v5, v6, "Failed to find matching ssid %{public}@ after %ld scan attempts.", v7, v8, v9, v10, v11);
}

void sub_1000404D0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 localRetryLimit];
  sub_1000269B0();
  sub_100012544((void *)&_mh_execute_header, v5, v6, "Failed to associate to ssid %{public}@ after %ld attempts", v7, v8, v9, v10, v11);
}

void sub_100040564(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_1000405D0(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 30;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No network connection after %ds", (uint8_t *)v1, 8u);
}

void sub_100040650(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040688(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "String %{public}@ is of invalid length=%ld", (uint8_t *)&v3, 0x16u);
}

void sub_100040710(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040748(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Serialization tag list size %lu != data list size %lu", buf, 0x16u);
}

void sub_1000407A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000407D8(void *a1, void *a2, uint64_t a3)
{
  __int16 v5 = a1;
  v6[0] = 67109378;
  v6[1] = [a2 charValue];
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to serialize tag 0x%X with value %{public}@, skip serialization", (uint8_t *)v6, 0x12u);
}

void sub_10004088C(void *a1, void *a2)
{
  int v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 unsignedIntValue];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unrecognized serialization data type: 0x%X", (uint8_t *)v4, 8u);
}

void sub_100040928()
{
  sub_100028784();
  id v3 = v2;
  sub_10002876C();
  id v4 = (id)sub_100028754();
  __int16 v5 = (void *)sub_10002873C();
  id v6 = sub_1000286F0(v5);
  sub_10002871C((void *)&_mh_execute_header, v7, v8, "Tag 0x%X - class %{public}@ != %{public}@", v9, v10, v11, v12, v13);
}

void sub_1000409DC()
{
  sub_100028784();
  id v3 = v2;
  sub_10002876C();
  id v4 = (id)sub_100028754();
  __int16 v5 = (void *)sub_10002873C();
  id v6 = sub_1000286F0(v5);
  sub_10002871C((void *)&_mh_execute_header, v7, v8, "Tag 0x%X - class %{public}@ != %{public}@", v9, v10, v11, v12, v13);
}

void sub_100040A90()
{
  sub_100028784();
  id v3 = v2;
  sub_10002876C();
  id v4 = (id)sub_100028754();
  __int16 v5 = (void *)sub_10002873C();
  id v6 = sub_1000286F0(v5);
  sub_10002871C((void *)&_mh_execute_header, v7, v8, "Tag 0x%X - class %{public}@ != %{public}@", v9, v10, v11, v12, v13);
}

void sub_100040B44(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to serialize error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100040BBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040BF4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = [a2 error];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to serialize responseerror: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100040C9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040CD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040D0C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to serialize protocol version", v2, v3, v4, v5, v6);
}

void sub_100040D40()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize payload for Select command", v2, v3, v4, v5, v6);
}

void sub_100040D74()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize protocol version", v2, v3, v4, v5, v6);
}

void sub_100040DA8()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize response error", v2, v3, v4, v5, v6);
}

void sub_100040DDC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_100008714((void *)&_mh_execute_header, a2, a3, "Unrecognized command code %ld; failed to initialize command object",
    (uint8_t *)&v3);
}

void sub_100040E4C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_100008714((void *)&_mh_execute_header, a2, a3, "Failed to serialize payload dictionary for command: %ld", (uint8_t *)&v4);
}

void sub_100040EC0(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  sub_10002C408((void *)&_mh_execute_header, v4, v5, "APDU too short; length = %lu", v6, v7, v8, v9, 0);
}

void sub_100040F4C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize SU Start command", v2, v3, v4, v5, v6);
}

void sub_100040F80()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize RetryAfter command", v2, v3, v4, v5, v6);
}

void sub_100040FB4()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize Heartbeat command", v2, v3, v4, v5, v6);
}

void sub_100040FE8()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize ConfigureNFC command", v2, v3, v4, v5, v6);
}

void sub_10004101C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize startDiag command", v2, v3, v4, v5, v6);
}

void sub_100041050()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Only handling APDU command with Le=0x00", v2, v3, v4, v5, v6);
}

void sub_100041084(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  sub_10002C408((void *)&_mh_execute_header, v4, v5, "APDU has 3 byte Lc field but length = %lu", v6, v7, v8, v9, 0);
}

void sub_100041110(unsigned __int16 a1, void *a2, void *a3)
{
  int v4 = a1;
  uint64_t v5 = a2;
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 2048;
  id v8 = [a3 length];
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "APDU has Lc=%d; but APDU has length=%lu",
    (uint8_t *)v6,
    0x12u);
}

void sub_1000411C4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unsupported APDU CLA %x", (uint8_t *)v2, 8u);
}

void sub_10004123C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"RetryAfter";
  sub_100008714((void *)&_mh_execute_header, a1, a3, "Failed retry after cmd serialization; no %{public}@ key",
    (uint8_t *)&v3);
}

void sub_1000412B8()
{
  sub_10002C3F4();
  sub_10002C428((void *)&_mh_execute_header, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004132C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"HeartbeatPeriod";
  sub_100008714((void *)&_mh_execute_header, a1, a3, "Failed heartbeat cmd serialization; no %{public}@ key",
    (uint8_t *)&v3);
}

void sub_1000413A8()
{
  sub_10002C3F4();
  sub_10002C428((void *)&_mh_execute_header, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004141C()
{
  sub_10002C3F4();
  sub_10002C428((void *)&_mh_execute_header, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100041490(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"NFCInactivityTimeout";
  sub_100008714((void *)&_mh_execute_header, a1, a3, "Failed configureNFC cmd serialization; no %{public}@ key",
    (uint8_t *)&v3);
}

void sub_10004150C()
{
  sub_10002C3F4();
  sub_10002C428((void *)&_mh_execute_header, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100041580(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"TimeStamp";
  sub_100008714((void *)&_mh_execute_header, a1, a3, "Failed start tatsu ticket payload serialization; payload does not have %{public}@ key",
    (uint8_t *)&v3);
}

void sub_1000415FC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"TatsuTicket";
  sub_100008714((void *)&_mh_execute_header, a1, a3, "Failed start tatsu ticket payload serialization; payload does not have %{public}@ key",
    (uint8_t *)&v3);
}

void sub_100041678()
{
  sub_10002C3F4();
  sub_10002C428((void *)&_mh_execute_header, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000416EC()
{
  sub_10002C3F4();
  sub_10002C428((void *)&_mh_execute_header, v0, v1, "Failed to serialize %{public}@ key with data: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100041760()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize time from RetryAfter APDU", v2, v3, v4, v5, v6);
}

void sub_100041794(void *a1)
{
  id v2 = a1;
  sub_10002C450();
  sub_10002C444();
  sub_10002C408((void *)&_mh_execute_header, v3, v4, "Invalid RetryAfter time %lfs", v5, v6, v7, v8, v9);
}

void sub_100041814()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize heartbeat period from Heartbeat APDU", v2, v3, v4, v5, v6);
}

void sub_100041848(void *a1)
{
  id v2 = a1;
  sub_10002C450();
  sub_10002C444();
  sub_10002C408((void *)&_mh_execute_header, v3, v4, "Invalid heartbeat period %lfs", v5, v6, v7, v8, v9);
}

void sub_1000418C8()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize heartbeat timeout from Heartbeat APDU", v2, v3, v4, v5, v6);
}

void sub_1000418FC(void *a1)
{
  id v2 = a1;
  sub_10002C450();
  sub_10002C444();
  sub_10002C408((void *)&_mh_execute_header, v3, v4, "Invalid heartbeat timeout %lfs", v5, v6, v7, v8, v9);
}

void sub_10004197C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize configureNFC command", v2, v3, v4, v5, v6);
}

void sub_1000419B0()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize nfcInactivity timeout from configureNFC APDU", v2, v3, v4, v5, v6);
}

void sub_1000419E4(void *a1)
{
  id v2 = a1;
  sub_10002C450();
  sub_10002C444();
  sub_10002C408((void *)&_mh_execute_header, v3, v4, "Invalid nfcInactivity timeout %lfs", v5, v6, v7, v8, v9);
}

void sub_100041A64()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize command", v2, v3, v4, v5, v6);
}

void sub_100041A98()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize tatsu ticket from command", v2, v3, v4, v5, v6);
}

void sub_100041ACC()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize timestamp from command APDU", v2, v3, v4, v5, v6);
}

void sub_100041B00(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed main controller operation; error: %{public}@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_100041B78()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to serialize serial number & nonce", v2, v3, v4, v5, v6);
}

void sub_100041BAC()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize payload for DeviceInfo command", v2, v3, v4, v5, v6);
}

void sub_100041BE0()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize serial number", v2, v3, v4, v5, v6);
}

void sub_100041C14()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize ecid", v2, v3, v4, v5, v6);
}

void sub_100041C48()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize board ID", v2, v3, v4, v5, v6);
}

void sub_100041C7C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize chip ID", v2, v3, v4, v5, v6);
}

void sub_100041CB0()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize security domain", v2, v3, v4, v5, v6);
}

void sub_100041CE4()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize ap nonce", v2, v3, v4, v5, v6);
}

void sub_100041D18()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize production mode", v2, v3, v4, v5, v6);
}

void sub_100041D4C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize security mode", v2, v3, v4, v5, v6);
}

void sub_100041D80()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize UID mode", v2, v3, v4, v5, v6);
}

void sub_100041DB4()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize sikaFuse", v2, v3, v4, v5, v6);
}

void sub_100041DE8()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize response error", v2, v3, v4, v5, v6);
}

void sub_100041E1C(void *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = [a1 currentBuildVersion];
  uint64_t v5 = [a1 targetBuildVersion];
  uint8_t v6 = +[NSString stringWithFormat:@"Current build version %@ != %@, update failed", v4, v5];
  int v8 = 138543618;
  uint8_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  sub_1000329D8((void *)&_mh_execute_header, v3, v7, "%{public}@: %{public}@", (uint8_t *)&v8);
}

void sub_100041F14(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  int v6 = 138543874;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = a3;
  __int16 v10 = 2048;
  id v11 = [v4 state];
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@: no-op for cmd %lu at state %lu", (uint8_t *)&v6, 0x20u);
}

void sub_100041FD0(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"current state is %lu (expected %lu); ignoring install timer",
    [v2 state],
  uint64_t v4 = 2);
  int v6 = 138543618;
  uint64_t v7 = v2;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  sub_1000329D8((void *)&_mh_execute_header, v3, v5, "%{public}@: %{public}@", (uint8_t *)&v6);
}

void sub_1000420A4()
{
  sub_1000329C8();
  sub_1000329B0(v1, v2, v3, 5.8382e-34);
  sub_1000329D8((void *)&_mh_execute_header, v6, v4, "%{public}@: %{public}@", v5);
}

void sub_1000420EC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 status];
  uint64_t v5 = [v4 operationError];
  sub_10002C408((void *)&_mh_execute_header, v6, v7, "Failed to serialize operation error: %{public}@", v8, v9, v10, v11, 2u);
}

void sub_10004219C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 error];
  sub_10002C408((void *)&_mh_execute_header, v5, v6, "Failed to serialize response error: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_100042234()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to serialize device status, serial number, and nonce", v2, v3, v4, v5, v6);
}

void sub_100042268()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize payload for StatusUpdate command", v2, v3, v4, v5, v6);
}

void sub_10004229C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize state", v2, v3, v4, v5, v6);
}

void sub_1000422D0()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize operation", v2, v3, v4, v5, v6);
}

void sub_100042304()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize os version", v2, v3, v4, v5, v6);
}

void sub_100042338()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize battery level", v2, v3, v4, v5, v6);
}

void sub_10004236C()
{
  sub_10000DB60();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Failed to deserialize operation error", v2, v3, v4, v5, v6);
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return _BYSetupAssistantHasCompletedInitialRun();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return _IOHIDEventSystemClientCopyServices(client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return _IOHIDEventSystemClientCreate();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return _IOHIDEventSystemClientSetMatching();
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return _IOHIDServiceClientCopyEvent();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

uint64_t IOPSLimitBatteryLevel()
{
  return _IOPSLimitBatteryLevel();
}

uint64_t IOPSLimitBatteryLevelCancel()
{
  return _IOPSLimitBatteryLevelCancel();
}

uint64_t IOPSLimitBatteryLevelRegister()
{
  return _IOPSLimitBatteryLevelRegister();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
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

uint64_t Img4DecodeGetPropertyBoolean()
{
  return _Img4DecodeGetPropertyBoolean();
}

uint64_t Img4DecodeGetPropertyData()
{
  return _Img4DecodeGetPropertyData();
}

uint64_t Img4DecodeGetPropertyInteger64()
{
  return _Img4DecodeGetPropertyInteger64();
}

uint64_t Img4DecodeInitManifest()
{
  return _Img4DecodeInitManifest();
}

uint64_t Img4DecodePerformManifestTrustEvaluationWithCallbacks()
{
  return _Img4DecodePerformManifestTrustEvaluationWithCallbacks();
}

uint64_t MAEGetActivationStateWithError()
{
  return _MAEGetActivationStateWithError();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBGetScreenLockStatus()
{
  return _SBGetScreenLockStatus();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return _SBSSpringBoardBlockableServerPort();
}

uint64_t SMJobSetEnabled()
{
  return _SMJobSetEnabled();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return _SecKeyCreateWithData(keyData, attributes, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return __CFCopySupplementalVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccder_blob_decode_bitstring()
{
  return _ccder_blob_decode_bitstring();
}

uint64_t ccder_blob_decode_tag()
{
  return _ccder_blob_decode_tag();
}

uint64_t ccder_blob_decode_tl()
{
  return _ccder_blob_decode_tl();
}

uint64_t ccder_blob_decode_uint64()
{
  return _ccder_blob_decode_uint64();
}

uint64_t ccder_blob_encode_tl()
{
  return _ccder_blob_encode_tl();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return _ccder_decode_rsa_pub_n();
}

uint64_t ccder_sizeof_len()
{
  return _ccder_sizeof_len();
}

uint64_t ccder_sizeof_tag()
{
  return _ccder_sizeof_tag();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccdigest_init()
{
  return _ccdigest_init();
}

uint64_t ccdigest_update()
{
  return _ccdigest_update();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return _ccec_compressed_x962_export_pub();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return _ccec_compressed_x962_export_pub_size();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return _ccec_compressed_x962_import_pub();
}

uint64_t ccec_export_pub()
{
  return _ccec_export_pub();
}

uint64_t ccec_import_pub()
{
  return _ccec_import_pub();
}

uint64_t ccec_keysize_is_supported()
{
  return _ccec_keysize_is_supported();
}

uint64_t ccec_verify()
{
  return _ccec_verify();
}

uint64_t ccec_verify_composite()
{
  return _ccec_verify_composite();
}

uint64_t ccec_x963_import_pub_size()
{
  return _ccec_x963_import_pub_size();
}

uint64_t ccrsa_import_pub()
{
  return _ccrsa_import_pub();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return _ccrsa_verify_pkcs1v15_allowshortsigs();
}

uint64_t ccsha1_di()
{
  return _ccsha1_di();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

uint64_t ccsha384_di()
{
  return _ccsha384_di();
}

uint64_t cczp_bitlen()
{
  return _cczp_bitlen();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

double difftime(time_t a1, time_t a2)
{
  return _difftime(a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void free(void *a1)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return _nw_interface_get_type(interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

int settimeofday(const timeval *a1, const timezone *a2)
{
  return _settimeofday(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return _strptime(a1, a2, a3);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

time_t timegm(tm *const a1)
{
  return _timegm(a1);
}

id objc_msgSend_BSSID(void *a1, const char *a2, ...)
{
  return [a1 BSSID];
}

id objc_msgSend_EAPProfile(void *a1, const char *a2, ...)
{
  return [a1 EAPProfile];
}

id objc_msgSend_IPv4Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv4Addresses];
}

id objc_msgSend_IPv6Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv6Addresses];
}

id objc_msgSend_MACAddress(void *a1, const char *a2, ...)
{
  return [a1 MACAddress];
}

id objc_msgSend_MCSIndex(void *a1, const char *a2, ...)
{
  return [a1 MCSIndex];
}

id objc_msgSend_PHYMode(void *a1, const char *a2, ...)
{
  return [a1 PHYMode];
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return [a1 RSSI];
}

id objc_msgSend_SUCertPresent(void *a1, const char *a2, ...)
{
  return [a1 SUCertPresent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__acquirePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquirePowerAssertion];
}

id objc_msgSend__acquireTransaction(void *a1, const char *a2, ...)
{
  return [a1 _acquireTransaction];
}

id objc_msgSend__batteryVirtualTemperature(void *a1, const char *a2, ...)
{
  return [a1 _batteryVirtualTemperature];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__deserializeConfigureNFC(void *a1, const char *a2, ...)
{
  return [a1 _deserializeConfigureNFC];
}

id objc_msgSend__deserializeHeartbeat(void *a1, const char *a2, ...)
{
  return [a1 _deserializeHeartbeat];
}

id objc_msgSend__deserializeRetryAfter(void *a1, const char *a2, ...)
{
  return [a1 _deserializeRetryAfter];
}

id objc_msgSend__deserializeStartDiag(void *a1, const char *a2, ...)
{
  return [a1 _deserializeStartDiag];
}

id objc_msgSend__deserializeStartUpdate(void *a1, const char *a2, ...)
{
  return [a1 _deserializeStartUpdate];
}

id objc_msgSend__deserializeTatsuPayload(void *a1, const char *a2, ...)
{
  return [a1 _deserializeTatsuPayload];
}

id objc_msgSend__dispatchRetryOperation(void *a1, const char *a2, ...)
{
  return [a1 _dispatchRetryOperation];
}

id objc_msgSend__getDispatchTable(void *a1, const char *a2, ...)
{
  return [a1 _getDispatchTable];
}

id objc_msgSend__getPhaseTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 _getPhaseTranslationTable];
}

id objc_msgSend__getStateTransitionTable(void *a1, const char *a2, ...)
{
  return [a1 _getStateTransitionTable];
}

id objc_msgSend__initNetworkMonitor(void *a1, const char *a2, ...)
{
  return [a1 _initNetworkMonitor];
}

id objc_msgSend__initSUClient(void *a1, const char *a2, ...)
{
  return [a1 _initSUClient];
}

id objc_msgSend__isD5x(void *a1, const char *a2, ...)
{
  return [a1 _isD5x];
}

id objc_msgSend__isHeartbeatMode(void *a1, const char *a2, ...)
{
  return [a1 _isHeartbeatMode];
}

id objc_msgSend__isN104(void *a1, const char *a2, ...)
{
  return [a1 _isN104];
}

id objc_msgSend__isWiFiConnected(void *a1, const char *a2, ...)
{
  return [a1 _isWiFiConnected];
}

id objc_msgSend__listenToCommand(void *a1, const char *a2, ...)
{
  return [a1 _listenToCommand];
}

id objc_msgSend__operationDone(void *a1, const char *a2, ...)
{
  return [a1 _operationDone];
}

id objc_msgSend__purgeSoftwareUpdate(void *a1, const char *a2, ...)
{
  return [a1 _purgeSoftwareUpdate];
}

id objc_msgSend__releasePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releasePowerAssertion];
}

id objc_msgSend__releaseTransaction(void *a1, const char *a2, ...)
{
  return [a1 _releaseTransaction];
}

id objc_msgSend__resetNFCInactivityTimer(void *a1, const char *a2, ...)
{
  return [a1 _resetNFCInactivityTimer];
}

id objc_msgSend__serializeConfigureNFC(void *a1, const char *a2, ...)
{
  return [a1 _serializeConfigureNFC];
}

id objc_msgSend__serializeHeartbeat(void *a1, const char *a2, ...)
{
  return [a1 _serializeHeartbeat];
}

id objc_msgSend__serializeRetryAfter(void *a1, const char *a2, ...)
{
  return [a1 _serializeRetryAfter];
}

id objc_msgSend__serializeStartDiag(void *a1, const char *a2, ...)
{
  return [a1 _serializeStartDiag];
}

id objc_msgSend__serializeStartUpdate(void *a1, const char *a2, ...)
{
  return [a1 _serializeStartUpdate];
}

id objc_msgSend__smcHelper(void *a1, const char *a2, ...)
{
  return [a1 _smcHelper];
}

id objc_msgSend__startInstallTimer(void *a1, const char *a2, ...)
{
  return [a1 _startInstallTimer];
}

id objc_msgSend__stopIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopIdleTimer];
}

id objc_msgSend__stopInstallTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopInstallTimer];
}

id objc_msgSend__stopNFCInactivityTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopNFCInactivityTimer];
}

id objc_msgSend__stopSessionRestartTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopSessionRestartTimer];
}

id objc_msgSend__thermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 _thermalPressureLevel];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_apNonce(void *a1, const char *a2, ...)
{
  return [a1 apNonce];
}

id objc_msgSend_band(void *a1, const char *a2, ...)
{
  return [a1 band];
}

id objc_msgSend_batteryDetails(void *a1, const char *a2, ...)
{
  return [a1 batteryDetails];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return [a1 batteryLevel];
}

id objc_msgSend_batteryLimitToken(void *a1, const char *a2, ...)
{
  return [a1 batteryLimitToken];
}

id objc_msgSend_boardID(void *a1, const char *a2, ...)
{
  return [a1 boardID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return [a1 cancelled];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_channelBand(void *a1, const char *a2, ...)
{
  return [a1 channelBand];
}

id objc_msgSend_channelWidth(void *a1, const char *a2, ...)
{
  return [a1 channelWidth];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return [a1 chipID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionSem(void *a1, const char *a2, ...)
{
  return [a1 connectionSem];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 currentBuildVersion];
}

id objc_msgSend_currentOperationCode(void *a1, const char *a2, ...)
{
  return [a1 currentOperationCode];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
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

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_deserialize(void *a1, const char *a2, ...)
{
  return [a1 deserialize];
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return [a1 details];
}

id objc_msgSend_deviceDelegate(void *a1, const char *a2, ...)
{
  return [a1 deviceDelegate];
}

id objc_msgSend_deviceStatus(void *a1, const char *a2, ...)
{
  return [a1 deviceStatus];
}

id objc_msgSend_diagController(void *a1, const char *a2, ...)
{
  return [a1 diagController];
}

id objc_msgSend_diagsLauncher(void *a1, const char *a2, ...)
{
  return [a1 diagsLauncher];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didStopHeartbeat(void *a1, const char *a2, ...)
{
  return [a1 didStopHeartbeat];
}

id objc_msgSend_disableCarrierMode(void *a1, const char *a2, ...)
{
  return [a1 disableCarrierMode];
}

id objc_msgSend_dispatchTable(void *a1, const char *a2, ...)
{
  return [a1 dispatchTable];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return [a1 downloadSize];
}

id objc_msgSend_ecid(void *a1, const char *a2, ...)
{
  return [a1 ecid];
}

id objc_msgSend_enableCarrierMode(void *a1, const char *a2, ...)
{
  return [a1 enableCarrierMode];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_factorySUCertExist(void *a1, const char *a2, ...)
{
  return [a1 factorySUCertExist];
}

id objc_msgSend_factorySUCertPath(void *a1, const char *a2, ...)
{
  return [a1 factorySUCertPath];
}

id objc_msgSend_factorySUKeyIsSEP(void *a1, const char *a2, ...)
{
  return [a1 factorySUKeyIsSEP];
}

id objc_msgSend_factorySUKeyPath(void *a1, const char *a2, ...)
{
  return [a1 factorySUKeyPath];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forcePurge(void *a1, const char *a2, ...)
{
  return [a1 forcePurge];
}

id objc_msgSend_getBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 getBatteryLevel];
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return [a1 getHwSupport];
}

id objc_msgSend_globalRetryInterval(void *a1, const char *a2, ...)
{
  return [a1 globalRetryInterval];
}

id objc_msgSend_heartbeatConnectionSem(void *a1, const char *a2, ...)
{
  return [a1 heartbeatConnectionSem];
}

id objc_msgSend_heartbeatPeriod(void *a1, const char *a2, ...)
{
  return [a1 heartbeatPeriod];
}

id objc_msgSend_iPV4Address(void *a1, const char *a2, ...)
{
  return [a1 iPV4Address];
}

id objc_msgSend_iPV6Address(void *a1, const char *a2, ...)
{
  return [a1 iPV6Address];
}

id objc_msgSend_idleTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 idleTimeInterval];
}

id objc_msgSend_idleTimer(void *a1, const char *a2, ...)
{
  return [a1 idleTimer];
}

id objc_msgSend_inBoxUpdateMode(void *a1, const char *a2, ...)
{
  return [a1 inBoxUpdateMode];
}

id objc_msgSend_inProgress(void *a1, const char *a2, ...)
{
  return [a1 inProgress];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialBuddySetupComplete(void *a1, const char *a2, ...)
{
  return [a1 initialBuddySetupComplete];
}

id objc_msgSend_install(void *a1, const char *a2, ...)
{
  return [a1 install];
}

id objc_msgSend_installTimer(void *a1, const char *a2, ...)
{
  return [a1 installTimer];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActivated(void *a1, const char *a2, ...)
{
  return [a1 isActivated];
}

id objc_msgSend_isEAP(void *a1, const char *a2, ...)
{
  return [a1 isEAP];
}

id objc_msgSend_isIPad(void *a1, const char *a2, ...)
{
  return [a1 isIPad];
}

id objc_msgSend_isInBoxUpdateMode(void *a1, const char *a2, ...)
{
  return [a1 isInBoxUpdateMode];
}

id objc_msgSend_isInDiagnosticMode(void *a1, const char *a2, ...)
{
  return [a1 isInDiagnosticMode];
}

id objc_msgSend_isInitialBuddySetupComplete(void *a1, const char *a2, ...)
{
  return [a1 isInitialBuddySetupComplete];
}

id objc_msgSend_isNFCConfigured(void *a1, const char *a2, ...)
{
  return [a1 isNFCConfigured];
}

id objc_msgSend_isOnLockScreen(void *a1, const char *a2, ...)
{
  return [a1 isOnLockScreen];
}

id objc_msgSend_iseTrustCertName(void *a1, const char *a2, ...)
{
  return [a1 iseTrustCertName];
}

id objc_msgSend_iseTrustCertPaths(void *a1, const char *a2, ...)
{
  return [a1 iseTrustCertPaths];
}

id objc_msgSend_knownNetworkProfile(void *a1, const char *a2, ...)
{
  return [a1 knownNetworkProfile];
}

id objc_msgSend_latestUpdate(void *a1, const char *a2, ...)
{
  return [a1 latestUpdate];
}

id objc_msgSend_launchDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 launchDiagnostics];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localRetryDelay(void *a1, const char *a2, ...)
{
  return [a1 localRetryDelay];
}

id objc_msgSend_localRetryLimit(void *a1, const char *a2, ...)
{
  return [a1 localRetryLimit];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutablePayload(void *a1, const char *a2, ...)
{
  return [a1 mutablePayload];
}

id objc_msgSend_networkInfo(void *a1, const char *a2, ...)
{
  return [a1 networkInfo];
}

id objc_msgSend_networkMonitor(void *a1, const char *a2, ...)
{
  return [a1 networkMonitor];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_nfcActivityDidTimeout(void *a1, const char *a2, ...)
{
  return [a1 nfcActivityDidTimeout];
}

id objc_msgSend_nfcController(void *a1, const char *a2, ...)
{
  return [a1 nfcController];
}

id objc_msgSend_nfcIdleTime(void *a1, const char *a2, ...)
{
  return [a1 nfcIdleTime];
}

id objc_msgSend_nfcInactivityTimeout(void *a1, const char *a2, ...)
{
  return [a1 nfcInactivityTimeout];
}

id objc_msgSend_nfcInactivityTimer(void *a1, const char *a2, ...)
{
  return [a1 nfcInactivityTimer];
}

id objc_msgSend_noise(void *a1, const char *a2, ...)
{
  return [a1 noise];
}

id objc_msgSend_normalizedPercentComplete(void *a1, const char *a2, ...)
{
  return [a1 normalizedPercentComplete];
}

id objc_msgSend_numberOfSpatialStreams(void *a1, const char *a2, ...)
{
  return [a1 numberOfSpatialStreams];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_opCode(void *a1, const char *a2, ...)
{
  return [a1 opCode];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return [a1 operation];
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return [a1 operationCount];
}

id objc_msgSend_operationDetails(void *a1, const char *a2, ...)
{
  return [a1 operationDetails];
}

id objc_msgSend_operationError(void *a1, const char *a2, ...)
{
  return [a1 operationError];
}

id objc_msgSend_operationFactory(void *a1, const char *a2, ...)
{
  return [a1 operationFactory];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return [a1 osVersion];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_pendingAPDU(void *a1, const char *a2, ...)
{
  return [a1 pendingAPDU];
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return [a1 percentComplete];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_phaseTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 phaseTranslationTable];
}

id objc_msgSend_pos(void *a1, const char *a2, ...)
{
  return [a1 pos];
}

id objc_msgSend_powerAssertionID(void *a1, const char *a2, ...)
{
  return [a1 powerAssertionID];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_productionMode(void *a1, const char *a2, ...)
{
  return [a1 productionMode];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return [a1 protocolVersion];
}

id objc_msgSend_queryNetworkInfo(void *a1, const char *a2, ...)
{
  return [a1 queryNetworkInfo];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rejected(void *a1, const char *a2, ...)
{
  return [a1 rejected];
}

id objc_msgSend_removePowerLog(void *a1, const char *a2, ...)
{
  return [a1 removePowerLog];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return [a1 running];
}

id objc_msgSend_saveOpCode(void *a1, const char *a2, ...)
{
  return [a1 saveOpCode];
}

id objc_msgSend_securityDomain(void *a1, const char *a2, ...)
{
  return [a1 securityDomain];
}

id objc_msgSend_securityMode(void *a1, const char *a2, ...)
{
  return [a1 securityMode];
}

id objc_msgSend_sepNonce(void *a1, const char *a2, ...)
{
  return [a1 sepNonce];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return [a1 serialize];
}

id objc_msgSend_serializedData(void *a1, const char *a2, ...)
{
  return [a1 serializedData];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionLock(void *a1, const char *a2, ...)
{
  return [a1 sessionLock];
}

id objc_msgSend_sessionRestartTimer(void *a1, const char *a2, ...)
{
  return [a1 sessionRestartTimer];
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return [a1 sessionState];
}

id objc_msgSend_setShelfLifeMode(void *a1, const char *a2, ...)
{
  return [a1 setShelfLifeMode];
}

id objc_msgSend_sharedHardwareManagerWithNoUI(void *a1, const char *a2, ...)
{
  return [a1 sharedHardwareManagerWithNoUI];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_shutDownReady(void *a1, const char *a2, ...)
{
  return [a1 shutDownReady];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_sikaFuse(void *a1, const char *a2, ...)
{
  return [a1 sikaFuse];
}

id objc_msgSend_sikaFuseExists(void *a1, const char *a2, ...)
{
  return [a1 sikaFuseExists];
}

id objc_msgSend_skipCertDeletion(void *a1, const char *a2, ...)
{
  return [a1 skipCertDeletion];
}

id objc_msgSend_skipDaemonDisable(void *a1, const char *a2, ...)
{
  return [a1 skipDaemonDisable];
}

id objc_msgSend_skipWiFiAssociation(void *a1, const char *a2, ...)
{
  return [a1 skipWiFiAssociation];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startEmulation(void *a1, const char *a2, ...)
{
  return [a1 startEmulation];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateTransitionTable(void *a1, const char *a2, ...)
{
  return [a1 stateTransitionTable];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopEmulation(void *a1, const char *a2, ...)
{
  return [a1 stopEmulation];
}

id objc_msgSend_stopListening(void *a1, const char *a2, ...)
{
  return [a1 stopListening];
}

id objc_msgSend_stopMonitor(void *a1, const char *a2, ...)
{
  return [a1 stopMonitor];
}

id objc_msgSend_suController(void *a1, const char *a2, ...)
{
  return [a1 suController];
}

id objc_msgSend_suDelegateQueue(void *a1, const char *a2, ...)
{
  return [a1 suDelegateQueue];
}

id objc_msgSend_suppressLogging(void *a1, const char *a2, ...)
{
  return [a1 suppressLogging];
}

id objc_msgSend_syncQueue(void *a1, const char *a2, ...)
{
  return [a1 syncQueue];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tagLengthMapping(void *a1, const char *a2, ...)
{
  return [a1 tagLengthMapping];
}

id objc_msgSend_tagTypeMapping(void *a1, const char *a2, ...)
{
  return [a1 tagTypeMapping];
}

id objc_msgSend_tagValDict(void *a1, const char *a2, ...)
{
  return [a1 tagValDict];
}

id objc_msgSend_targetBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 targetBuildVersion];
}

id objc_msgSend_targetOSVersion(void *a1, const char *a2, ...)
{
  return [a1 targetOSVersion];
}

id objc_msgSend_targetSUBundleSize(void *a1, const char *a2, ...)
{
  return [a1 targetSUBundleSize];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_terminateNow(void *a1, const char *a2, ...)
{
  return [a1 terminateNow];
}

id objc_msgSend_terminated(void *a1, const char *a2, ...)
{
  return [a1 terminated];
}

id objc_msgSend_thermalDetails(void *a1, const char *a2, ...)
{
  return [a1 thermalDetails];
}

id objc_msgSend_timeRemaining(void *a1, const char *a2, ...)
{
  return [a1 timeRemaining];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeLengthMapping(void *a1, const char *a2, ...)
{
  return [a1 typeLengthMapping];
}

id objc_msgSend_uidMode(void *a1, const char *a2, ...)
{
  return [a1 uidMode];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_useLiveTatsu(void *a1, const char *a2, ...)
{
  return [a1 useLiveTatsu];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_wifiHelper(void *a1, const char *a2, ...)
{
  return [a1 wifiHelper];
}

id objc_msgSend_wifiInterface(void *a1, const char *a2, ...)
{
  return [a1 wifiInterface];
}

id objc_msgSend_wifiRetryQueue(void *a1, const char *a2, ...)
{
  return [a1 wifiRetryQueue];
}

id objc_msgSend_wifiSSID(void *a1, const char *a2, ...)
{
  return [a1 wifiSSID];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}