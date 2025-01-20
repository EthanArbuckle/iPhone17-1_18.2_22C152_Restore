void sub_100002270(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;

  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Syncing Device State: %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = [*(id *)(a1 + 40) messenger];
  v5 = *(void *)(a1 + 32);
  v6 = [*(id *)(a1 + 40) destination];
  [v4 sendMessage:@"deviceState" data:v5 toDestination:v6 forceLocalDelivery:1 expectsResponse:0 response:&stru_1000185A0];
}

void sub_10000237C(id a1, BOOL a2, NSError *a3, NSString *a4, DAIDSMessageObject *a5)
{
  BOOL v5 = a2;
  v6 = DiagnosticLogHandleForCategory();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Synced device state.", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000D2B4(v7);
  }
}

uint64_t start()
{
  id v1 = +[DDMain sharedInstance];
  v2 = objc_alloc_init(DDXPCServiceDelegate);
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.iosdiagnosticsd"];
  [v3 setDelegate:v2];
  [v3 resume];
  v4 = +[NSRunLoop currentRunLoop];
  [v4 run];

  return 0;
}

void sub_100002FD0(id a1)
{
  qword_100022898 = objc_alloc_init(DADeviceConnectionConfigurator);

  _objc_release_x1();
}

void sub_1000034D8(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  qword_1000228A8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_100003A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003AC8(id *a1)
{
  uint64_t v2 = +[DDMain sharedInstance];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v2 removeConnection:WeakRetained];

  id v4 = objc_loadWeakRetained(a1);
  uint64_t v5 = [v4 serviceName];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"com.apple.iosdiagnosticsd";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  v8 = v7;

  id v9 = +[NSError errorWithDomain:v8 code:0 userInfo:0];

  +[DSAnalytics sendAnalyticsWithEvent:3 error:v9];
}

void sub_100003BB8(id *a1)
{
  uint64_t v2 = +[DDMain sharedInstance];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v2 removeConnection:WeakRetained];

  id v4 = objc_loadWeakRetained(a1);
  uint64_t v5 = [v4 serviceName];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"com.apple.iosdiagnosticsd";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  v8 = v7;

  id v9 = +[NSError errorWithDomain:v8 code:0 userInfo:0];

  +[DSAnalytics sendAnalyticsWithEvent:4 error:v9];
}

void sub_100003DA4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000D4A0();
  }

  +[DSAnalytics sendAnalyticsWithEvent:5 error:v2];
}

void sub_100003EF0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000D520();
  }

  +[DSAnalytics sendAnalyticsWithEvent:5 error:v2];
}

void sub_100004090(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) receiver];
  [v2 receiveMessage:*(void *)(a1 + 40) data:*(void *)(a1 + 48) fromDestination:*(void *)(a1 + 56) expectsResponse:*(unsigned __int8 *)(a1 + 72) response:*(void *)(a1 + 64)];
}

void sub_1000043A8(id a1)
{
  id v1 = +[NSError errorWithDomain:@"com.apple.iosdiagnosticsd" code:0 userInfo:0];
  +[DSAnalytics sendAnalyticsWithEvent:3 error:v1];
}

void sub_10000441C(id a1)
{
  id v1 = +[NSError errorWithDomain:@"com.apple.iosdiagnosticsd" code:0 userInfo:0];
  +[DSAnalytics sendAnalyticsWithEvent:4 error:v1];
}

void sub_1000044E4(id a1)
{
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  qword_1000228B8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v12, v11, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_100004800(id a1)
{
  qword_1000228C8 = objc_alloc_init(DDMain);

  _objc_release_x1();
}

void sub_1000048BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004998(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004A84(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) unionSet:a2];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

void sub_100004F70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004F8C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000D5A0((uint64_t)v2, v3);
  }

  +[DSAnalytics sendAnalyticsWithEvent:5 error:v2];
}

void sub_100005614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005660(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005670(uint64_t a1)
{
}

void sub_100005678(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    [*(id *)(a1 + 32) purgeSecurityKey];
    objc_msgSend(*(id *)(a1 + 32), "setDeviceIdentityKey:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "referenceKey"));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005CBC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf, int a14, __int16 a15, __int16 a16, void *a17)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    v18 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [v17 name];
      v20 = [v17 reason];
      v21 = [v17 userInfo];
      v22 = [v21 description];
      LODWORD(buf) = 138412802;
      *(void *)((char *)&buf + 4) = v19;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v20;
      a16 = 2112;
      a17 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Exception raised while taking SHA256 of file: %@: %@ (%@)", (uint8_t *)&buf, 0x20u);
    }
    objc_end_catch();
    JUMPOUT(0x100005C6CLL);
  }
  _Unwind_Resume(a1);
}

void sub_100006418(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000064FC;
  v6[3] = &unk_1000188A8;
  uint64_t v9 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  id v7 = *(id *)(a1 + 32);
  [v2 issueClientCertificateWithCompletionOnQueue:0 withOptions:v3 completion:v6];
}

void sub_1000064FC(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (!a2)
  {
    v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000DA18();
    }

    v14 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v15 = a4;
    goto LABEL_9;
  }
  uint64_t v10 = [v8 certificates];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [v8 certificates];
    if ([v12 count] == (id)2)
    {
      id v13 = [v8 referenceKey];

      if (v13)
      {
        v14 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v15 = a3;
LABEL_9:
        objc_storeStrong(v14, v15);
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  id v17 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10000D9E4();
  }

LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100006690()
{
  if (!qword_1000228D8) {
    qword_1000228D8 = _sl_dlopen();
  }
  return qword_1000228D8;
}

uint64_t sub_100006760()
{
  uint64_t result = _sl_dlopen();
  qword_1000228D8 = result;
  return result;
}

void sub_1000067D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000067FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006884(id a1)
{
  qword_1000228E0 = objc_alloc_init(DAPlatform_iOS_NonUI);

  _objc_release_x1();
}

void sub_100006B74(id a1)
{
  id v1 = objc_alloc_init((Class)MIBUClient);
  id v9 = 0;
  unsigned int v2 = [v1 isInBoxUpdateMode:&v9];
  id v3 = v9;
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "In-box update mode is active.", v8, 2u);
    }

    byte_1000228F0 = 1;
  }
  else if (v3)
  {
    id v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000DA80(v4, v6);
    }
  }
}

void sub_100008210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000082D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008398(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000845C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008520(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000085E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000086A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000874C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100008810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000088D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008998(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008A5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008CF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008DDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100009344(uint64_t a1)
{
  unsigned int v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  CFStringRef v6 = @"info";
  uint64_t v7 = v3;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v4 userInfo:v5];
}

void sub_10000AB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B06C()
{
  if (!qword_100022900) {
    qword_100022900 = _sl_dlopen();
  }
  return qword_100022900;
}

uint64_t sub_10000B13C()
{
  uint64_t result = _sl_dlopen();
  qword_100022900 = result;
  return result;
}

Class sub_10000B1B0(uint64_t a1)
{
  sub_10000B208();
  Class result = objc_getClass("NRDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100022908 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000DB3C();
    return (Class)sub_10000B208();
  }
  return result;
}

uint64_t sub_10000B208()
{
  uint64_t v0 = sub_10000B06C();
  if (!v0)
  {
    unsigned int v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_10000B264()
{
  if (!qword_100022910) {
    qword_100022910 = _sl_dlopen();
  }
  return qword_100022910;
}

uint64_t sub_10000B334()
{
  uint64_t result = _sl_dlopen();
  qword_100022910 = result;
  return result;
}

Class sub_10000B3A8(uint64_t a1)
{
  if (!sub_10000B264())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("SFDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100022918 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = sub_10000DB64();
    return (Class)sub_10000B438(v4);
  }
  return result;
}

void *sub_10000B438(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10000B208();
  Class result = dlsym(v2, "NRDevicePropertyIsPaired");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100022920 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

DDIDSService *sub_10000B488(uint64_t a1)
{
  sub_10000B208();
  Class result = (DDIDSService *)objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100022928 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (DDIDSService *)sub_10000DB8C();
    return [(DDIDSService *)v3 initWithServiceType:v5];
  }
  return result;
}

void sub_10000BE0C(uint64_t a1)
{
  [*(id *)(a1 + 32) setIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 48) messageStorage];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_10000C5CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [DDIDSOutgoingMessage alloc];
  id v8 = [*(id *)(a1 + 32) destination];
  id v9 = [(DDIDSOutgoingMessage *)v7 initWithDestination:v8 message:v6 data:v5];

  uint64_t v10 = [*(id *)(a1 + 40) outgoingResponseIdentifier];
  [(DDIDSOutgoingMessage *)v9 setPeerResponseIdentifier:v10];

  uint64_t v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(DDIDSOutgoingMessage *)v9 peerResponseIdentifier];
    uint64_t v13 = *(void *)(a1 + 48);
    int v14 = 138412802;
    v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] > Responding to message: %@, with message: %@", (uint8_t *)&v14, 0x20u);
  }
  [*(id *)(a1 + 56) _sendIDSMessage:v9];
}

void sub_10000CB30(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000D110(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D1E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D2B4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to sync device state", v1, 2u);
}

void sub_10000D2F8(void *a1, NSObject *a2)
{
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: could not archive object [%@]", (uint8_t *)&v4, 0xCu);
}

void sub_10000D390(void *a1, void *a2, NSObject *a3)
{
  id v5 = [a1 objectForKeyedSubscript:@"class"];
  id v6 = [a2 localizedDescription];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error: could not unarchive object of type %@, Reason: [%@]", (uint8_t *)&v7, 0x16u);
}

void sub_10000D45C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create CFUserNotificationRef!", v1, 2u);
}

void sub_10000D4A0()
{
  v1[0] = 136315394;
  sub_100004708();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)v1, 0x16u);
}

void sub_10000D520()
{
  v1[0] = 136315394;
  sub_100004708();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)v1, 0x16u);
}

void sub_10000D5A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get remote object proxy with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000D618()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "Failed to get a certificate from CoreRepair. Falling back to attestation blob", v2, v3, v4, v5, v6);
}

void sub_10000D64C()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "Timed out waiting for certificate from CRCAttestationManager", v2, v3, v4, v5, v6);
}

void sub_10000D680()
{
  sub_100006818();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unrecognized auth info certificate type %ld", v1, 0xCu);
}

void sub_10000D6F4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D768()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "Cannot sign payload, as no security key exists.", v2, v3, v4, v5, v6);
}

void sub_10000D79C()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "Could not generate SHA256 digest for payload.", v2, v3, v4, v5, v6);
}

void sub_10000D7D0()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "Cannot sign file, as no security key exists.", v2, v3, v4, v5, v6);
}

void sub_10000D804(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 path];
  sub_100006818();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create file handle from file at path = %@.", v4, 0xCu);
}

void sub_10000D898()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "Could not generate SHA256 digest for file.", v2, v3, v4, v5, v6);
}

void sub_10000D8CC()
{
  sub_100006818();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "requestAttestationBlobWithOptions failed with error: %@", v1, 0xCu);
}

void sub_10000D940(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D9B0()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "Cannot get attestation certificate because CoreRepairCore is not available on this device", v2, v3, v4, v5, v6);
}

void sub_10000D9E4()
{
  sub_1000067F0();
  sub_1000067D4((void *)&_mh_execute_header, v0, v1, "CRCAttestationManager returned an invalid certificate", v2, v3, v4, v5, v6);
}

void sub_10000DA18()
{
  sub_100006818();
  sub_1000067FC((void *)&_mh_execute_header, v0, v1, "CRCAttestationManager was unable to get BAA/CAA certs: %@", v2, v3, v4, v5, v6);
}

void sub_10000DA80(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get in-box update mode status with error: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_10000DB18()
{
  return sub_10000DB3C();
}

uint64_t sub_10000DB3C()
{
  uint64_t v0 = abort_report_np();
  return sub_10000DB64(v0);
}

uint64_t sub_10000DB64()
{
  uint64_t v0 = abort_report_np();
  return sub_10000DB8C(v0);
}

uint64_t sub_10000DB8C()
{
  uint64_t v0 = abort_report_np();
  return sub_10000DBB4(v0);
}

void sub_10000DBB4(void *a1)
{
  uint64_t v1 = [a1 identifier];
  sub_10000CB18();
  sub_10000CB30((void *)&_mh_execute_header, v2, v3, "[%@] Retrying IDS message: %@", v4, v5, v6, v7, v8);
}

void sub_10000DC44(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 identifier];
  int v7 = 138412802;
  uint8_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "[%@] Retries exhausted to send IDS message: %@, error: %@", (uint8_t *)&v7, 0x20u);
}

void sub_10000DD00(void *a1)
{
  uint64_t v1 = [a1 outgoingResponseIdentifier];
  sub_10000CB18();
  sub_10000CB30((void *)&_mh_execute_header, v2, v3, "[%@] Incoming message from invalid destination: %@", v4, v5, v6, v7, v8);
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

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t DeviceIdentityCopyAttestationDictionary()
{
  return _DeviceIdentityCopyAttestationDictionary();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t IDSCopyForDevice()
{
  return _IDSCopyForDevice();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_SOCKSProxyPort(void *a1, const char *a2, ...)
{
  return [a1 SOCKSProxyPort];
}

id objc_msgSend_SOCKSProxyServer(void *a1, const char *a2, ...)
{
  return [a1 SOCKSProxyServer];
}

id objc_msgSend__createXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 _createXPCConnection];
}

id objc_msgSend__dequeueTest(void *a1, const char *a2, ...)
{
  return [a1 _dequeueTest];
}

id objc_msgSend__isDeviceLocked(void *a1, const char *a2, ...)
{
  return [a1 _isDeviceLocked];
}

id objc_msgSend__sendChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendChangeNotification];
}

id objc_msgSend__sendChangeNotificationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _sendChangeNotificationIfNeeded];
}

id objc_msgSend__tickleTestQueue(void *a1, const char *a2, ...)
{
  return [a1 _tickleTestQueue];
}

id objc_msgSend_acceptableValueClasses(void *a1, const char *a2, ...)
{
  return [a1 acceptableValueClasses];
}

id objc_msgSend_allowCellularSizeThreshold(void *a1, const char *a2, ...)
{
  return [a1 allowCellularSizeThreshold];
}

id objc_msgSend_allowedDataClasses(void *a1, const char *a2, ...)
{
  return [a1 allowedDataClasses];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return [a1 bleDevice];
}

id objc_msgSend_bluetoothID(void *a1, const char *a2, ...)
{
  return [a1 bluetoothID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_certifcateType(void *a1, const char *a2, ...)
{
  return [a1 certifcateType];
}

id objc_msgSend_certificates(void *a1, const char *a2, ...)
{
  return [a1 certificates];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completionMap(void *a1, const char *a2, ...)
{
  return [a1 completionMap];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentEnvironment];
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

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_deviceIdentityCert(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentityCert];
}

id objc_msgSend_deviceIdentityKey(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentityKey];
}

id objc_msgSend_deviceIdentityPublicKeyDigest(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentityPublicKeyDigest];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_diagnosticEventID(void *a1, const char *a2, ...)
{
  return [a1 diagnosticEventID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dimDisplay(void *a1, const char *a2, ...)
{
  return [a1 dimDisplay];
}

id objc_msgSend_displayDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 displayDeviceIdentifier];
}

id objc_msgSend_durationRemaining(void *a1, const char *a2, ...)
{
  return [a1 durationRemaining];
}

id objc_msgSend_enclosureColor(void *a1, const char *a2, ...)
{
  return [a1 enclosureColor];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return [a1 errors];
}

id objc_msgSend_expectsPeerResponse(void *a1, const char *a2, ...)
{
  return [a1 expectsPeerResponse];
}

id objc_msgSend_expectsResponse(void *a1, const char *a2, ...)
{
  return [a1 expectsResponse];
}

id objc_msgSend_extra(void *a1, const char *a2, ...)
{
  return [a1 extra];
}

id objc_msgSend_fullscreenPromptsEnabled(void *a1, const char *a2, ...)
{
  return [a1 fullscreenPromptsEnabled];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hideSceneStatusBar(void *a1, const char *a2, ...)
{
  return [a1 hideSceneStatusBar];
}

id objc_msgSend_history(void *a1, const char *a2, ...)
{
  return [a1 history];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idle(void *a1, const char *a2, ...)
{
  return [a1 idle];
}

id objc_msgSend_idsDestination(void *a1, const char *a2, ...)
{
  return [a1 idsDestination];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return [a1 isCheckerBoardActive];
}

id objc_msgSend_isDeviceLocked(void *a1, const char *a2, ...)
{
  return [a1 isDeviceLocked];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return [a1 isLocallyPaired];
}

id objc_msgSend_isSSRBootIntentSet(void *a1, const char *a2, ...)
{
  return [a1 isSSRBootIntentSet];
}

id objc_msgSend_isSessionModeOveridden(void *a1, const char *a2, ...)
{
  return [a1 isSessionModeOveridden];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localReceiver(void *a1, const char *a2, ...)
{
  return [a1 localReceiver];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locallyPaired(void *a1, const char *a2, ...)
{
  return [a1 locallyPaired];
}

id objc_msgSend_mapTableWithWeakToStrongObjects(void *a1, const char *a2, ...)
{
  return [a1 mapTableWithWeakToStrongObjects];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageReceiverQueue(void *a1, const char *a2, ...)
{
  return [a1 messageReceiverQueue];
}

id objc_msgSend_messageStorage(void *a1, const char *a2, ...)
{
  return [a1 messageStorage];
}

id objc_msgSend_messenger(void *a1, const char *a2, ...)
{
  return [a1 messenger];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return [a1 nsuuid];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_original(void *a1, const char *a2, ...)
{
  return [a1 original];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairedService(void *a1, const char *a2, ...)
{
  return [a1 pairedService];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_peerResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 peerResponseIdentifier];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_proxyServer(void *a1, const char *a2, ...)
{
  return [a1 proxyServer];
}

id objc_msgSend_purgeSecurityKey(void *a1, const char *a2, ...)
{
  return [a1 purgeSecurityKey];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return [a1 receiver];
}

id objc_msgSend_referenceKey(void *a1, const char *a2, ...)
{
  return [a1 referenceKey];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeTests(void *a1, const char *a2, ...)
{
  return [a1 resumeTests];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return [a1 retryCount];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_sessionSettings(void *a1, const char *a2, ...)
{
  return [a1 sessionSettings];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showSceneStatusBar(void *a1, const char *a2, ...)
{
  return [a1 showSceneStatusBar];
}

id objc_msgSend_skipped(void *a1, const char *a2, ...)
{
  return [a1 skipped];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_suiteDescription(void *a1, const char *a2, ...)
{
  return [a1 suiteDescription];
}

id objc_msgSend_suiteID(void *a1, const char *a2, ...)
{
  return [a1 suiteID];
}

id objc_msgSend_suiteName(void *a1, const char *a2, ...)
{
  return [a1 suiteName];
}

id objc_msgSend_suitesAvailable(void *a1, const char *a2, ...)
{
  return [a1 suitesAvailable];
}

id objc_msgSend_suspendTests(void *a1, const char *a2, ...)
{
  return [a1 suspendTests];
}

id objc_msgSend_suspended(void *a1, const char *a2, ...)
{
  return [a1 suspended];
}

id objc_msgSend_testQueue(void *a1, const char *a2, ...)
{
  return [a1 testQueue];
}

id objc_msgSend_testSuiteName(void *a1, const char *a2, ...)
{
  return [a1 testSuiteName];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_undimDisplay(void *a1, const char *a2, ...)
{
  return [a1 undimDisplay];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return [a1 uniqueIDOverride];
}

id objc_msgSend_uploadStatus(void *a1, const char *a2, ...)
{
  return [a1 uploadStatus];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}