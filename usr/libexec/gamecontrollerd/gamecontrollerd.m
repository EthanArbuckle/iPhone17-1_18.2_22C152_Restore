id sub_100002B3C(uint64_t a1, int a2)
{
  void *v4;
  unint64_t v5;
  CFStringRef v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        v6 = &stru_10000C660;
      }
      else {
        v6 = @":";
      }
      v7 = +[NSString stringWithFormat:@"%02x%@", *(unsigned __int8 *)(a1 + (v5 - 2)), v6];
      [v4 appendString:v7];

      --v5;
    }
    while (v5 > 1);
  }
  v8 = +[NSString stringWithString:v4];
  v9 = [v8 uppercaseString];

  return v9;
}

uint64_t sub_100002C44()
{
  if (qword_100011F18 != -1) {
    dispatch_once(&qword_100011F18, &stru_10000C318);
  }
  return byte_100011F20;
}

void sub_100002C88(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
  byte_100011F20 = [v1 BOOLForKey:@"GCPartnersEnable"];
  v2 = sub_1000065DC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = byte_100011F20;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v3, 8u);
  }
}

void sub_100003150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_100003198(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained setInterruptionHandler:0];
    [v7 setInvalidationHandler:0];
    id v3 = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
      objc_sync_enter(v5);
      [v5 removeObject:v7];
      objc_sync_exit(v5);

      id v6 = *(id *)(*(void *)(a1 + 32) + 16);
      objc_sync_enter(v6);
      [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v7];
      objc_sync_exit(v6);
    }
    id WeakRetained = v7;
  }
}

void sub_100003268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000034A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setInterruptionHandler:0];
    [v2 setInvalidationHandler:0];
    id WeakRetained = v2;
  }
}

void sub_10000382C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000039D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003D10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28)
{
  objc_sync_exit(v28);
  _Unwind_Resume(a1);
}

void sub_100004E88(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:0 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100004EF0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:1 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100004F58(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:2 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100004FC0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:3 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005028(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:4 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005090(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:5 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000050F8(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:6 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005160(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:7 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000051C8(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:8 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005230(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:9 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005298(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:10 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005300(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:11 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005368(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:12 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000053D0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:13 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005438(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:14 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000054A0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:15 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005508(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:16 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005570(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:17 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000055D8(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:18 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005640(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:19 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000056A8(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:28 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005710(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:29 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005778(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:27 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000057E0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:26 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005848(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:25 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000058B0(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(a1 + 40);
  [v4 gravity];
  float v8 = v7;
  [v4 gravity];
  float v10 = v9;
  [v4 gravity];
  *(float *)&double v11 = v11;
  *(float *)&double v12 = v8;
  *(float *)&double v13 = v10;
  [WeakRetained controllerWithUDID:v6 setArrayValue:20 forElement:*(unsigned __int8 *)(a1 + 48) forward:v12 v13 v11 0.0];

  id v14 = objc_loadWeakRetained(v3);
  uint64_t v15 = *(void *)(a1 + 40);
  [v4 userAcceleration];
  float v17 = v16;
  [v4 userAcceleration];
  float v19 = v18;
  [v4 userAcceleration];
  *(float *)&double v20 = v20;
  *(float *)&double v21 = v17;
  *(float *)&double v22 = v19;
  [v14 controllerWithUDID:v15 setArrayValue:21 forElement:*(unsigned __int8 *)(a1 + 48) forward:v21, v22, v20, 0.0];

  id v23 = objc_loadWeakRetained(v3);
  uint64_t v24 = *(void *)(a1 + 40);
  [v4 attitude];
  float v26 = v25;
  [v4 attitude];
  float v28 = v27;
  [v4 attitude];
  float v30 = v29;
  [v4 attitude];
  *(float *)&double v31 = v31;
  *(float *)&double v32 = v26;
  *(float *)&double v33 = v28;
  *(float *)&double v34 = v30;
  [v23 controllerWithUDID:v24 setArrayValue:22 forElement:*(unsigned __int8 *)(a1 + 48) forward:v32, v33, v34, v31];

  id v45 = objc_loadWeakRetained(v3);
  uint64_t v35 = *(void *)(a1 + 40);
  [v4 rotationRate];
  float v37 = v36;
  [v4 rotationRate];
  float v39 = v38;
  [v4 rotationRate];
  double v41 = v40;

  *(float *)&double v42 = v41;
  *(float *)&double v43 = v37;
  *(float *)&double v44 = v39;
  [v45 controllerWithUDID:v35 setArrayValue:23 forElement:*(unsigned __int8 *)(a1 + 48) forward:v43, v44, v42, 0.0];
}

void sub_100005A88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(v2) = 1.0;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:24 forElement:*(unsigned __int8 *)(a1 + 48) forward:v2];
}

void sub_100005CF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005FD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000061C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100006238()
{
  if (qword_100011F30 != -1) {
    dispatch_once(&qword_100011F30, &stru_10000C460);
  }
  return byte_100011F28;
}

void sub_10000627C(id a1)
{
  byte_100011F28 = os_variant_has_internal_diagnostics();
}

id sub_1000062A4()
{
  if (qword_100011F40 != -1) {
    dispatch_once(&qword_100011F40, &stru_10000C480);
  }
  v0 = (void *)qword_100011F38;

  return v0;
}

void sub_1000062F8(id a1)
{
  qword_100011F38 = (uint64_t)os_log_create("com.apple.GameController", "default");

  _objc_release_x1();
}

id sub_10000633C()
{
  if (qword_100011F50 != -1) {
    dispatch_once(&qword_100011F50, &stru_10000C4A0);
  }
  v0 = (void *)qword_100011F48;

  return v0;
}

void sub_100006390(id a1)
{
  qword_100011F48 = (uint64_t)os_log_create("com.apple.GameController", "monitor");

  _objc_release_x1();
}

id sub_1000063D4()
{
  if (qword_100011F60 != -1) {
    dispatch_once(&qword_100011F60, &stru_10000C4C0);
  }
  v0 = (void *)qword_100011F58;

  return v0;
}

void sub_100006428(id a1)
{
  qword_100011F58 = (uint64_t)os_log_create("com.apple.GameController", "init");

  _objc_release_x1();
}

id sub_10000646C()
{
  if (qword_100011F70 != -1) {
    dispatch_once(&qword_100011F70, &stru_10000C4E0);
  }
  v0 = (void *)qword_100011F68;

  return v0;
}

void sub_1000064C0(id a1)
{
  qword_100011F68 = (uint64_t)os_log_create("com.apple.GameController", "analytics");

  _objc_release_x1();
}

id sub_100006504()
{
  if (qword_100011F80 != -1) {
    dispatch_once(&qword_100011F80, &stru_10000C500);
  }
  v0 = (void *)qword_100011F78;

  return v0;
}

void sub_100006558(id a1)
{
  qword_100011F78 = (uint64_t)os_log_create("com.apple.GameController.Daemon", "default");

  _objc_release_x1();
}

uint64_t sub_10000659C(char *category)
{
  qword_100011F88 = (uint64_t)os_log_create("com.apple.GameController.HID", category);

  return _objc_release_x1();
}

id sub_1000065DC()
{
  if (qword_100011F90 != -1) {
    dispatch_once(&qword_100011F90, &stru_10000C520);
  }
  v0 = (void *)qword_100011F88;

  return v0;
}

void sub_100006630(id a1)
{
  if (!qword_100011F88) {
    objc_storeStrong((id *)&qword_100011F88, &_os_log_default);
  }
}

id sub_100006654()
{
  if (qword_100011FA0 != -1) {
    dispatch_once(&qword_100011FA0, &stru_10000C540);
  }
  v0 = (void *)qword_100011F98;

  return v0;
}

void sub_1000066A8(id a1)
{
  qword_100011F98 = (uint64_t)os_log_create("com.apple.GameController.Settings", "default");

  _objc_release_x1();
}

id sub_1000066EC()
{
  if (qword_100011FB0 != -1) {
    dispatch_once(&qword_100011FB0, &stru_10000C560);
  }
  v0 = (void *)qword_100011FA8;

  return v0;
}

void sub_100006740(id a1)
{
  qword_100011FA8 = (uint64_t)os_log_create("com.apple.GameController.Haptics", "default");

  _objc_release_x1();
}

id sub_100006784()
{
  if (qword_100011FC0 != -1) {
    dispatch_once(&qword_100011FC0, &stru_10000C580);
  }
  v0 = (void *)qword_100011FB8;

  return v0;
}

void sub_1000067D8(id a1)
{
  qword_100011FB8 = (uint64_t)os_log_create("com.apple.gamecontroller", "Signposts");

  _objc_release_x1();
}

id sub_10000681C()
{
  if (qword_100011FD0 != -1) {
    dispatch_once(&qword_100011FD0, &stru_10000C5A0);
  }
  v0 = (void *)qword_100011FC8;

  return v0;
}

void sub_100006870(id a1)
{
  qword_100011FC8 = (uint64_t)os_log_create("com.apple.runtime-issues", "GameController");

  _objc_release_x1();
}

uint64_t start()
{
  _set_user_dir_suffix();
  if (os_variant_allows_internal_security_policies())
  {
    float v8 = +[NSFileManager defaultManager];
    unsigned int v9 = [v8 fileExistsAtPath:@"/tmp/gamecontrollerd_prevent_startup"];

    if (v9)
    {
      do
      {
        if (sub_100006238())
        {
          double v12 = sub_100006504();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deferring startup...", buf, 2u);
          }
        }
        sleep(1u);
        float v10 = +[NSFileManager defaultManager];
        unsigned __int8 v11 = [v10 fileExistsAtPath:@"/tmp/gamecontrollerd_prevent_startup"];
      }
      while ((v11 & 1) != 0);
    }
  }
  if (sub_100006238())
  {
    double v13 = sub_100006504();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Running...", v16, 2u);
    }
  }
  +[GameControllerDaemon run];
  id v1 = objc_alloc_init(GCDGameControllerDaemonDelegate);
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  id v3 = (void *)qword_100011FD8;
  qword_100011FD8 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100011FD8, &stru_10000C5C0);
  dispatch_resume((dispatch_object_t)qword_100011FD8);
  do
  {
    id v5 = +[NSRunLoop currentRunLoop];
    uint64_t v6 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
    [v5 runUntilDate:v6];
  }
  while ([(GCDGameControllerDaemonDelegate *)v1 shouldKeepRunning]);
  if (sub_100006238())
  {
    id v14 = sub_100006504();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Stopping...", v15, 2u);
    }
  }
  return 0;
}

void sub_100006B48(id a1)
{
}

void sub_100006C2C(id a1)
{
  qword_100011FE0 = [[GameControllerDaemon alloc] _init];

  _objc_release_x1();
}

void sub_100006EC8(id a1, OS_xpc_object *a2)
{
  dispatch_source_t v2 = a2;
  if (sub_100006238())
  {
    id v3 = sub_1000062A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100007F78((uint64_t)v2, v3);
    }
  }
}

void sub_100007290(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007468(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000075C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007D6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007F78(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "XPC Event Stream 'com.apple.iokit.match.gamecontroller' event: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t GCBundleWithPID()
{
  return _GCBundleWithPID();
}

uint64_t GCLookupSetFallbackProvider()
{
  return _GCLookupSetFallbackProvider();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t analytics_send_event()
{
  return _analytics_send_event();
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__start(void *a1, const char *a2, ...)
{
  return [a1 _start];
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return [a1 attitude];
}

id objc_msgSend_buttonA(void *a1, const char *a2, ...)
{
  return [a1 buttonA];
}

id objc_msgSend_buttonB(void *a1, const char *a2, ...)
{
  return [a1 buttonB];
}

id objc_msgSend_buttonHome(void *a1, const char *a2, ...)
{
  return [a1 buttonHome];
}

id objc_msgSend_buttonMenu(void *a1, const char *a2, ...)
{
  return [a1 buttonMenu];
}

id objc_msgSend_buttonOptions(void *a1, const char *a2, ...)
{
  return [a1 buttonOptions];
}

id objc_msgSend_buttonX(void *a1, const char *a2, ...)
{
  return [a1 buttonX];
}

id objc_msgSend_buttonY(void *a1, const char *a2, ...)
{
  return [a1 buttonY];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deviceHash(void *a1, const char *a2, ...)
{
  return [a1 deviceHash];
}

id objc_msgSend_down(void *a1, const char *a2, ...)
{
  return [a1 down];
}

id objc_msgSend_dpad(void *a1, const char *a2, ...)
{
  return [a1 dpad];
}

id objc_msgSend_extendedGamepad(void *a1, const char *a2, ...)
{
  return [a1 extendedGamepad];
}

id objc_msgSend_gamepad(void *a1, const char *a2, ...)
{
  return [a1 gamepad];
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return [a1 gravity];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isATVRemote(void *a1, const char *a2, ...)
{
  return [a1 isATVRemote];
}

id objc_msgSend_left(void *a1, const char *a2, ...)
{
  return [a1 left];
}

id objc_msgSend_leftShoulder(void *a1, const char *a2, ...)
{
  return [a1 leftShoulder];
}

id objc_msgSend_leftThumbstick(void *a1, const char *a2, ...)
{
  return [a1 leftThumbstick];
}

id objc_msgSend_leftThumbstickButton(void *a1, const char *a2, ...)
{
  return [a1 leftThumbstickButton];
}

id objc_msgSend_leftTrigger(void *a1, const char *a2, ...)
{
  return [a1 leftTrigger];
}

id objc_msgSend_motion(void *a1, const char *a2, ...)
{
  return [a1 motion];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_refreshClientTransaction(void *a1, const char *a2, ...)
{
  return [a1 refreshClientTransaction];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_right(void *a1, const char *a2, ...)
{
  return [a1 right];
}

id objc_msgSend_rightShoulder(void *a1, const char *a2, ...)
{
  return [a1 rightShoulder];
}

id objc_msgSend_rightThumbstick(void *a1, const char *a2, ...)
{
  return [a1 rightThumbstick];
}

id objc_msgSend_rightThumbstickButton(void *a1, const char *a2, ...)
{
  return [a1 rightThumbstickButton];
}

id objc_msgSend_rightTrigger(void *a1, const char *a2, ...)
{
  return [a1 rightTrigger];
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return [a1 rotationRate];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldKeepRunning(void *a1, const char *a2, ...)
{
  return [a1 shouldKeepRunning];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_up(void *a1, const char *a2, ...)
{
  return [a1 up];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userAcceleration(void *a1, const char *a2, ...)
{
  return [a1 userAcceleration];
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return [a1 userIdentifier];
}