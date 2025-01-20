void sub_100004FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004FF8(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: remoteDevice: %@", buf, 0xCu);
  }

  v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: canceling: %i", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (v5 && (a3 & 1) == 0)
  {
    v10 = [WeakRetained dispatchQueue];
    remote_device_set_connected_callback();

    v11 = [v9 dispatchQueue];
    remote_device_set_disconnected_callback();
  }
}

void sub_100005204(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: device connected callback %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [[CBDRemoteDeviceConnection alloc] initWithRemoteDevice:v3];
  v6 = [*(id *)(a1 + 32) delegate];
  [v6 didConnectDeviceConnection:v5];
}

void sub_1000052F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: device disconnected callback %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [[CBDRemoteDeviceConnection alloc] initWithRemoteDevice:v3];
  v6 = [*(id *)(a1 + 32) delegate];
  [v6 didDisconnectDeviceConnection:v5];
}

uint64_t start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Hello, World! checkerboardd is alive!", v5, 2u);
  }
  v0 = objc_alloc_init(CBDMainController);
  v1 = (void *)qword_100016E68;
  qword_100016E68 = (uint64_t)v0;

  [(id)qword_100016E68 start];
  id v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0;
}

void sub_100006C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006C98(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
  objc_destroyWeak(&v4);
}

void sub_100006D4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006D64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = xpc_copy_description(v3);
  id v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote XPC Service: Server received message: %s", (uint8_t *)&v17, 0xCu);
  }

  free(v4);
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleEvent:v3];
  }
  else
  {
    uint64_t v7 = (uint64_t)type;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 32));
      [v8 _handleError:v3];
    }
    else
    {
      id v8 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10000B12C(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
}

void sub_1000071A8(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000B274((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }

    objc_end_catch();
    JUMPOUT(0x100007188);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007218(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC object decoded as: %@", (uint8_t *)&v13, 0xCu);
  }

  if (v3)
  {
    if ([v3 isMemberOfClass:objc_opt_class()]) {
      [v3 setConnection:*(void *)(a1 + 32)];
    }
    [*(id *)(a1 + 40) _dispatchReceivedMessage:v3 event:*(void *)(a1 + 48) client:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000B2E0(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void sub_10000749C(uint64_t a1)
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) delegate];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dispatching message to delegate; message = %@, delegate = %@",
      buf,
      0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 40) delegate];
  uint64_t v6 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007614;
  v10[3] = &unk_1000104B8;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  id v14 = *(id *)(a1 + 56);
  [v5 didReceiveRemoteXPCMessage:v7 completion:v10];
}

void sub_100007614(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) delegate];
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Delegate acknowledged message receipt; message = %@, delegate = %@, reply = %@",
      (uint8_t *)&v8,
      0x20u);
  }
  if (v3)
  {
    [*(id *)(a1 + 40) _sendReply:v3 event:*(void *)(a1 + 48) client:*(void *)(a1 + 56)];
  }
  else if ([*(id *)(a1 + 32) replyClass])
  {
    id v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B3BC(a1 + 32, a1);
    }
  }
}

void sub_10000799C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000079B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000079D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100007F4C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[NSString stringWithUTF8String:a2];
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    id v10 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_16:
    id v11 = v10;
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v6];

    goto LABEL_17;
  }
  xpc_type_t v8 = type;
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    id v10 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    id v10 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    id v10 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    id v10 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v5)];
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_uuid)
  {
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:xpc_uuid_get_bytes(v5)];
    goto LABEL_16;
  }
  uint64_t v9 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    xpc_type_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Property key [%@] with unhandled type [%@]: %@", (uint8_t *)&v13, 0x20u);
  }

LABEL_17:
  return 1;
}

void sub_100008ADC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) replyWithSuccess:a2 == 0 error:a2];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100008BF4(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CBLocalServiceClientInterface];
  id v2 = (void *)qword_100016E78;
  qword_100016E78 = v1;

  id v3 = (void *)qword_100016E78;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:"setProxyServer:completion:" argumentIndex:0 ofReply:0];
}

void sub_100008CF0(id a1)
{
  qword_100016E88 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CBLocalServiceServerInterface];

  _objc_release_x1();
}

void sub_1000094CC(id a1)
{
  uint64_t v1 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Local XPC connection interrupted.", v2, 2u);
  }
}

void sub_100009538(id a1)
{
  uint64_t v1 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Local XPC connection invalidated.", v2, 2u);
  }
}

void sub_100009780(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Local XPC - setProxyServer:completion: Can't get remote proxy object %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009A00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Local XPC - startDiagnostics: Can't get remote proxy object %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009FD4(uint64_t a1)
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connect to device: %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) hostDevice];

  if (v4)
  {
    int v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error: attempt to connect already-connected host device %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setHostDevice:*(void *)(a1 + 32)];
  }
}

void sub_10000A1B0(uint64_t a1)
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Disconnect to device: %@", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) hostDevice];
  unsigned int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) hostDevice];
    [v6 invalidate];

    [*(id *)(a1 + 40) setHostDevice:0];
  }
  else
  {
    int v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error: attempt to disconnect a different device %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

void sub_10000A9A0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) replyWithSuccess:a2 == 0 error:a2];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000B03C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized version while decoding message: %llu", (uint8_t *)&v2, 0xCu);
}

void sub_10000B0B4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Magic incorrect while decoding message: %s", (uint8_t *)&v2, 0xCu);
}

void sub_10000B12C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B198(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B1D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B208(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B274(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B2E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B318(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 delegate];
  sub_1000079D4((void *)&_mh_execute_header, v2, v3, "Received message, but delegate unable to receive it; message = %@, delegate = %@",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void sub_10000B3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = [*(id *)(a2 + 40) delegate];
  sub_1000079D4((void *)&_mh_execute_header, v2, v3, "Did not get a reply message from delegate, but message has a reply class. May be a bug in the delegate. message = %@, delegate = %@", v4, v5, v6, v7, 2u);
}

uint64_t CheckerBoardLogHandleForCategory()
{
  return _CheckerBoardLogHandleForCategory();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void free(void *a1)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t remote_device_browser_cancel()
{
  return _remote_device_browser_cancel();
}

uint64_t remote_device_copy_properties()
{
  return _remote_device_copy_properties();
}

uint64_t remote_device_copy_uuid()
{
  return _remote_device_copy_uuid();
}

uint64_t remote_device_get_name()
{
  return _remote_device_get_name();
}

uint64_t remote_device_set_connected_callback()
{
  return _remote_device_set_connected_callback();
}

uint64_t remote_device_set_disconnected_callback()
{
  return _remote_device_set_disconnected_callback();
}

uint64_t remote_device_start_browsing()
{
  return _remote_device_start_browsing();
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
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

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_copy_remote_address_string()
{
  return _xpc_remote_connection_copy_remote_address_string();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return _xpc_remote_connection_create_remote_service_listener();
}

uint64_t xpc_remote_connection_send_message()
{
  return _xpc_remote_connection_send_message();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

uint64_t xpc_remote_connection_set_local_service_version()
{
  return _xpc_remote_connection_set_local_service_version();
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

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_allowedClasses(void *a1, const char *a2, ...)
{
  return [a1 allowedClasses];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_browser(void *a1, const char *a2, ...)
{
  return [a1 browser];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_discovery(void *a1, const char *a2, ...)
{
  return [a1 discovery];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expectedRemoteMessageClasses(void *a1, const char *a2, ...)
{
  return [a1 expectedRemoteMessageClasses];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hostDevice(void *a1, const char *a2, ...)
{
  return [a1 hostDevice];
}

id objc_msgSend_hostDeviceSerialQueue(void *a1, const char *a2, ...)
{
  return [a1 hostDeviceSerialQueue];
}

id objc_msgSend_inReplyToUUID(void *a1, const char *a2, ...)
{
  return [a1 inReplyToUUID];
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return [a1 interruptionHandler];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_ip(void *a1, const char *a2, ...)
{
  return [a1 ip];
}

id objc_msgSend_ipGenerator(void *a1, const char *a2, ...)
{
  return [a1 ipGenerator];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localXPCServer(void *a1, const char *a2, ...)
{
  return [a1 localXPCServer];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_messageHandlers(void *a1, const char *a2, ...)
{
  return [a1 messageHandlers];
}

id objc_msgSend_messageQueue(void *a1, const char *a2, ...)
{
  return [a1 messageQueue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return [a1 osVersion];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_proxyReceiver(void *a1, const char *a2, ...)
{
  return [a1 proxyReceiver];
}

id objc_msgSend_remoteDevice(void *a1, const char *a2, ...)
{
  return [a1 remoteDevice];
}

id objc_msgSend_remoteXPCServer(void *a1, const char *a2, ...)
{
  return [a1 remoteXPCServer];
}

id objc_msgSend_replyClass(void *a1, const char *a2, ...)
{
  return [a1 replyClass];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serverInterface(void *a1, const char *a2, ...)
{
  return [a1 serverInterface];
}

id objc_msgSend_serviceQueue(void *a1, const char *a2, ...)
{
  return [a1 serviceQueue];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDiagnosticsReceiver(void *a1, const char *a2, ...)
{
  return [a1 startDiagnosticsReceiver];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}