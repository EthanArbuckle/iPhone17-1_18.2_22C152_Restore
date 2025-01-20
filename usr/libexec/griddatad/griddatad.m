void sub_100002610(uint64_t a1)
{
  void *v2;
  void v3[4];
  id v4;

  v2 = +[_GDSBalancingAuthority loadRegistrations];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000026B4;
  v3[3] = &unk_100008308;
  v4 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

id sub_1000026B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setupLocationManagerForPath:a3 identifier:a2];
}

void sub_100002714(id a1)
{
  if (!qword_10000CE28)
  {
    qword_10000CE28 = objc_alloc_init(_GDBAManager);
    _objc_release_x1();
  }
}

void sub_100002D80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 authorizationStatus];
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 3)
  {
    if (v8)
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Location bundle %@ authorized for Carbon Awareness", (uint8_t *)&v12, 0xCu);
    }
    v9 = &__kCFBooleanTrue;
  }
  else
  {
    if (v8)
    {
      v10 = v7;
      v11 = +[NSNumber numberWithInt:v6];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Location bundle %@ authorization status: %@", (uint8_t *)&v12, 0x16u);
    }
    v9 = &__kCFBooleanFalse;
  }
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32));
}

void sub_100002F98(uint64_t a1)
{
  [*(id *)(a1 + 32) updateBAStatus];
  AnalyticsSendEventLazy();
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    char v51 = 0;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = sub_10000364C;
    v46 = sub_10000365C;
    id v47 = 0;
    v2 = *(void **)(*(void *)(a1 + 32) + 40);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100003664;
    v41[3] = &unk_100008420;
    v41[4] = &v42;
    v41[5] = &v48;
    [v2 enumerateKeysAndObjectsUsingBlock:v41];
    if (!*((unsigned char *)v49 + 24))
    {
      if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
        sub_100004D68();
      }
      AnalyticsSendEventLazy();
      v37 = +[NSMutableDictionary dictionary];
      v38 = *(void **)(*(void *)(a1 + 32) + 40);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000036D8;
      v39[3] = &unk_100008468;
      id v8 = v37;
      id v40 = v8;
      [v38 enumerateKeysAndObjectsUsingBlock:v39];
      +[_GDSBalancingAuthority saveBalancingAuthorityStatus:v8];
      v21 = v40;
      goto LABEL_37;
    }
    [(id)v43[5] coordinate];
    double v4 = v3;
    [(id)v43[5] coordinate];
    double v6 = v5;
    v7 = +[_GDSBalancingAuthority currentBalancingAuthority];
    id v8 = v7;
    if (v7)
    {
      if (([v7 latStart], v9 < v4) && (objc_msgSend(v8, "latEnd"), v4 < v10)
        || ([v8 latStart], v11 > v4) && (objc_msgSend(v8, "latEnd"), v4 > v12))
      {
        if (([v8 longStart], v13 < v6) && (objc_msgSend(v8, "longEnd"), v6 < v14)
          || ([v8 longStart], v15 > v6) && (objc_msgSend(v8, "longEnd"), v6 > v16))
        {
          v17 = [v8 lastUpdatedDate];
          [v17 timeIntervalSinceNow];
          BOOL v19 = v18 > -604800.0;

          if (v19)
          {
            v20 = *(NSObject **)(*(void *)(a1 + 32) + 8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Location still within current bounding box. Last update was less than 7 days ago. No need to update", buf, 2u);
            }
            AnalyticsSendEventLazy();
            goto LABEL_38;
          }
        }
      }
    }
    v21 = [*(id *)(a1 + 32) boundaryPolygons];
    v22 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Polygons returned %@", buf, 0xCu);
    }
    if (!v21
      || ([v21 allKeys],
          v23 = objc_claimAutoreleasedReturnValue(),
          BOOL v24 = [v23 count] == 0,
          v23,
          v24))
    {
      if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
        sub_100004D9C();
      }
      AnalyticsSendEventLazy();
      goto LABEL_37;
    }
    v25 = +[_GDBAResolver sharedInstance];
    [(id)v43[5] coordinate];
    double v27 = v26;
    [(id)v43[5] coordinate];
    v28 = [v25 balancingAuthorityForLatitude:v21 longitude:v27 polygons:];

    if (!v28)
    {
      AnalyticsSendEventLazy();
      id v8 = 0;
      goto LABEL_37;
    }
    v29 = [v28 identifier];
    v30 = +[NSString stringWithFormat:@"%@", v29];

    v31 = [v28 lastUpdatedDate];
    v32 = +[NSString stringWithFormat:@"%@", v31];

    v33 = [v28 name];
    v34 = v33;
    if (v33 && v30)
    {

      if (!v32)
      {
LABEL_30:
        +[_GDSBalancingAuthority saveBalancingAuthority:v28];

        id v8 = v28;
LABEL_37:

LABEL_38:
        _Block_object_dispose(&v42, 8);

        _Block_object_dispose(&v48, 8);
        return;
      }
      v52[0] = @"Name";
      v35 = [v28 name];
      v53[0] = v35;
      v53[1] = v30;
      v52[1] = @"Identifier";
      v52[2] = @"lastUpdatedDate";
      v53[2] = v32;
      v34 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];

      AnalyticsSendEventLazy();
      v36 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v34;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
    }

    goto LABEL_30;
  }
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
    sub_100004D34();
  }
  AnalyticsSendEventLazy();
}

void sub_1000035E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

NSDictionary *__cdecl sub_100003634(id a1)
{
  return (NSDictionary *)&off_1000089F8;
}

NSDictionary *__cdecl sub_100003640(id a1)
{
  return (NSDictionary *)&off_100008A20;
}

uint64_t sub_10000364C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000365C(uint64_t a1)
{
}

void sub_100003664(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = [a3 location];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

NSDictionary *__cdecl sub_1000036CC(id a1)
{
  return (NSDictionary *)&off_100008A48;
}

id sub_1000036D8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&__kCFBooleanFalse forKeyedSubscript:a2];
}

NSDictionary *__cdecl sub_1000036EC(id a1)
{
  return (NSDictionary *)&off_100008A70;
}

NSDictionary *__cdecl sub_1000036F8(id a1)
{
  return (NSDictionary *)&off_100008A98;
}

NSDictionary *__cdecl sub_100003704(id a1)
{
  return (NSDictionary *)&off_100008AC0;
}

NSDictionary *__cdecl sub_100003710(id a1)
{
  return (NSDictionary *)&off_100008AE8;
}

uint64_t sub_1000038F0(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received request for %@ with bundle %@!", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) setupLocationManagerForPath:*(void *)(a1 + 48) identifier:*(void *)(a1 + 40)];
  +[_GDSBalancingAuthority saveRegisteration:*(void *)(a1 + 40) bundlePath:*(void *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100003D20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003E3C(id a1)
{
  if (!qword_10000CE38)
  {
    qword_10000CE38 = objc_alloc_init(_GDBAResolver);
    _objc_release_x1();
  }
}

NSDictionary *__cdecl sub_1000048A8(id a1)
{
  return (NSDictionary *)&off_100008B10;
}

void sub_100004920()
{
  if (_os_feature_enabled_impl())
  {
    xpc_activity_register("com.apple.griddatad.daily", XPC_ACTIVITY_CHECK_IN, &stru_100008590);
  }
  else
  {
    xpc_activity_unregister("com.apple.griddatad.daily");
    _xpc_transaction_exit_clean();
  }
}

void sub_10000499C(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_activity_get_state(v2) && xpc_activity_get_state(v2) == 2)
  {
    uint64_t v3 = os_log_create("com.apple.griddatad", "main");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int v6 = "com.apple.griddatad.daily";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Running activity %s", (uint8_t *)&v5, 0xCu);
    }
    uint64_t v4 = +[_GDBAManager sharedInstance];
    [v4 updateBA];
  }
}

void start()
{
  v1 = os_log_create("com.apple.griddatad", "main");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting griddatad", buf, 2u);
  }
  _set_user_dir_suffix();
  id v2 = NSTemporaryDirectory();
  sub_100004920();
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004BF0;
  handler[3] = &unk_1000085B8;
  uint64_t v4 = v1;
  int v6 = v4;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Initializing com.apple.griddata service\n", buf, 2u);
  }
  +[_GDBAManager sharedInstance];

  CFRunLoopRun();
  exit(1);
}

void sub_100004BF0(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = string;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100004CA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"/var/db/GridData";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create directory at path %@ -- %@", (uint8_t *)&v2, 0x16u);
}

void sub_100004D34()
{
  sub_100003D3C();
  sub_100003D20((void *)&_mh_execute_header, v0, v1, "No location bundle registrations for BA fetch", v2, v3, v4, v5, v6);
}

void sub_100004D68()
{
  sub_100003D3C();
  sub_100003D20((void *)&_mh_execute_header, v0, v1, "Location not found. Bailing", v2, v3, v4, v5, v6);
}

void sub_100004D9C()
{
  sub_100003D3C();
  sub_100003D20((void *)&_mh_execute_header, v0, v1, "Error fetching Polygons", v2, v3, v4, v5, v6);
}

void sub_100004DD0(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Listener rejected new connection from PID %d (no entitlement)\n", (uint8_t *)v3, 8u);
}

void sub_100004E5C()
{
  sub_100003D3C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Listener received connection!", v1, 2u);
}

void sub_100004E9C(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to convert to GeoJSON %@", (uint8_t *)&v1, 0xCu);
}

void sub_100004F18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRunLoopRun(void)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return _CGPathContainsPoint(path, m, point, eoFill);
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MKMapPoint v3 = _MKMapPointForCoordinate(coordinate);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boundaryPolygons(void *a1, const char *a2, ...)
{
  return [a1 boundaryPolygons];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentBalancingAuthority(void *a1, const char *a2, ...)
{
  return [a1 currentBalancingAuthority];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fetchBalancingAuthorityPolygons(void *a1, const char *a2, ...)
{
  return [a1 fetchBalancingAuthorityPolygons];
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return [a1 geometry];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_lastUpdatedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdatedDate];
}

id objc_msgSend_latEnd(void *a1, const char *a2, ...)
{
  return [a1 latEnd];
}

id objc_msgSend_latStart(void *a1, const char *a2, ...)
{
  return [a1 latStart];
}

id objc_msgSend_loadBalancingAuthorityStatus(void *a1, const char *a2, ...)
{
  return [a1 loadBalancingAuthorityStatus];
}

id objc_msgSend_loadRegistrations(void *a1, const char *a2, ...)
{
  return [a1 loadRegistrations];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_longEnd(void *a1, const char *a2, ...)
{
  return [a1 longEnd];
}

id objc_msgSend_longStart(void *a1, const char *a2, ...)
{
  return [a1 longStart];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_polygons(void *a1, const char *a2, ...)
{
  return [a1 polygons];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_updateBA(void *a1, const char *a2, ...)
{
  return [a1 updateBA];
}

id objc_msgSend_updateBAStatus(void *a1, const char *a2, ...)
{
  return [a1 updateBAStatus];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:error:];
}