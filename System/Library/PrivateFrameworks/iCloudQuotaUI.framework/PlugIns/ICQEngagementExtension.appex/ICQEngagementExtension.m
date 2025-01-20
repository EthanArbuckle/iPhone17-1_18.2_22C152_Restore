void sub_100002C04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002C40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002C50(uint64_t a1)
{
}

void sub_100002C58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 commerceQuotaInfo];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [v5 bundleQuotaInfo];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v19 = 138412546;
      id v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      v16 = "Current iCloudStorageLevel: %@ appleOneStorageLevel %@";
      v17 = v13;
      uint32_t v18 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    }
  }
  else
  {
    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      v16 = "No premium offer return with error: %@";
      v17 = v13;
      uint32_t v18 = 12;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100002DD8(void *a1)
{
  v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  v4 = v3;
  id v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = +[NSNull null];
  }
  uint64_t v7 = v6;
  CFStringRef v21 = @"json-payload";
  v19[0] = @"response";
  v17[0] = @"icloudOriginalStorageLevel";
  uint64_t v8 = +[NSNull null];
  v18[0] = v8;
  v17[1] = @"appleOneOriginalStorageLevel";
  v9 = +[NSNull null];
  v18[1] = v9;
  v18[2] = v7;
  v17[2] = @"icloudCurrentStorageLevel";
  v17[3] = @"appleOneCurrentStorageLevel";
  v18[3] = v4;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v19[1] = @"error";
  v20[0] = v10;
  uint64_t v11 = +[NSNull null];
  v20[1] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v22 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Returning a fetchStorageLevel response to JS: %@ ", (uint8_t *)&v15, 0xCu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100003014(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 value];

    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v8 = [v5 value];

    if (v8)
    {
      v9 = [v5 value];
      uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 intValue]);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      v9 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = &off_1000043C8;
    }
  }
  v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v16 = 138412290;
    uint64_t v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Camera count: %@", (uint8_t *)&v16, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_10:
}

void sub_10000318C(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  v4 = v3;
  CFStringRef v16 = @"json-payload";
  id v13 = v3;
  v14[0] = @"response";
  CFStringRef v12 = @"cameraCount";
  id v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v14[1] = @"error";
  v15[0] = v5;
  id v6 = +[NSNull null];
  v15[1] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  uint64_t v17 = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Returning a fetchCameraCount response to JS: %@", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003344()
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _ICQGetLogSystem()
{
  return __ICQGetLogSystem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_bundleQuotaInfo(void *a1, const char *a2, ...)
{
  return [a1 bundleQuotaInfo];
}

id objc_msgSend_commerceQuotaInfo(void *a1, const char *a2, ...)
{
  return [a1 commerceQuotaInfo];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_sharedOfferManager(void *a1, const char *a2, ...)
{
  return [a1 sharedOfferManager];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}