uint64_t start()
{
  void *v0;
  id v1;
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v6[16];

  if ((_set_user_dir_suffix() & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100033CD8();
  }
  v1 = NSTemporaryDirectory();
  v2 = sub_100031A80();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "mediasetupd launching", v6, 2u);
  }

  v3 = +[MSDManager sharedInstance];
  v4 = +[NSRunLoop mainRunLoop];
  [v4 run];

  return 0;
}

void sub_100002484(uint64_t a1)
{
  id v5 = +[MSDCloudManager sharedManager];
  v2 = +[MSDHomeManager sharedManager];
  id v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithCloudDataManager:v5 homeManager:v2];
  v4 = (void *)qword_100056728;
  qword_100056728 = (uint64_t)v3;
}

void sub_1000026DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFStringRef MSDDataRefreshReasonToString(unint64_t a1)
{
  if (a1 > 9) {
    return @"Unknown";
  }
  else {
    return off_10004C908[a1];
  }
}

void sub_100002724(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    LOBYTE(v6[3]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v6 + 2);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
    }
  }
}

void sub_1000029A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Hit error when trying to fetch subscription %@", (uint8_t *)&v15, 0xCu);
    }

    if (([v6 CKErrorHasErrorCode:3] & 1) != 0
      || ([v6 CKErrorHasErrorCode:4] & 1) != 0
      || [v6 isErrorFatal])
    {
      uint64_t v8 = *(void *)(a1 + 48);
      if (v8) {
        (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
      }
    }
    else
    {
      [*(id *)(a1 + 40) _addSubscriptionWithIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
  }
  else
  {
    v9 = [v5 objectForKey:*(void *)(a1 + 32)];
    v10 = sub_100031A80();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v12 = *(void **)(a1 + 32);
        int v15 = 138412290;
        id v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There exists a subscription for %@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v13 = *(void *)(a1 + 48);
      if (v13) {
        (*(void (**)(uint64_t, uint64_t, void))(v13 + 16))(v13, 1, 0);
      }
    }
    else
    {
      if (v11)
      {
        v14 = *(void **)(a1 + 32);
        int v15 = 138412290;
        id v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding subscription for %@", (uint8_t *)&v15, 0xCu);
      }

      [*(id *)(a1 + 40) _addSubscriptionWithIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
  }
}

void sub_100002DD0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 count];
  v9 = sub_100031A80();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138477827;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Subscription saved %{private}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_100002F64((uint64_t)v7, v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, BOOL, id))(v11 + 16))(v11, v6 != 0, v7);
  }
}

void sub_100002F20(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to add subscription, nil CKSubscription object", v1, 2u);
}

void sub_100002F64(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to save Subscription, %{private}@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_10000309C()
{
  qword_100056740 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_100003B00()
{
  qword_100056750 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100003BD0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003BF8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create NSData object, %@", (uint8_t *)&v2, 0xCu);
}

void sub_100003C70()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Key/value for defaults cannot be nil", v2, v3, v4, v5, v6);
}

void sub_100003CA4()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Cannot Delete object with Nil key", v2, v3, v4, v5, v6);
}

void sub_100003CD8()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Cannot retrieve value of nil key", v2, v3, v4, v5, v6);
}

void sub_100003D0C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error unarchiving object for key %@, %@", (uint8_t *)&v3, 0x16u);
}

void sub_100004250(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004288(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000042C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004558(uint64_t a1)
{
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = +[CADisplay mainDisplay];
    WeakRetained[2] = (double)(unint64_t)[v1 pointScale];
  }
}

void sub_100004C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004CA8(uint64_t a1)
{
}

void sub_100004CB0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!v6 || v7)
  {
    uint64_t v9 = sub_100031A80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000054C4();
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100004F24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [a3 statusCode];
  if (!v7 || v8)
  {
    id v13 = sub_100031A80();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000552C();
    }

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      int v12 = *(void (**)(void))(v14 + 16);
      goto LABEL_13;
    }
  }
  else
  {
    if (v9 == (id)200)
    {
      uint64_t v10 = sub_100031A80();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully fetched data from URL", v15, 2u);
      }
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      int v12 = *(void (**)(void))(v11 + 16);
LABEL_13:
      v12();
    }
  }
}

void sub_100005264(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000528C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000052C4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error retrieving NSCachesDirectory URL, %{private}@", v2, v3, v4, v5, v6);
}

void sub_10000532C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005364(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000539C(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*a1 path];
  sub_100005280();
  __int16 v7 = 2113;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error creating directory for icon file path: %{private}@, %{private}@", v6, 0x16u);
}

void sub_10000544C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000054C4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error fetching data from URL %@", v2, v3, v4, v5, v6);
}

void sub_10000552C()
{
  sub_100005280();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Received error from server %@, status code %ld", v2, 0x16u);
}

void sub_1000055B0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error deleting file %{private}@", v2, v3, v4, v5, v6);
}

void sub_100005618()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "File does not exist at path %{private}@", v2, v3, v4, v5, v6);
}

id sub_100005C7C(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [(MSDDefaultsInfo *)v2 service];
  uint64_t v4 = [v3 serviceID];
  uint64_t v5 = [v4 UUIDString];
  if ([v5 isEqualToString:kAppleMusicServiceIdentifier])
  {

    uint8_t v6 = 0;
LABEL_5:

    goto LABEL_7;
  }
  __int16 v7 = [(MSDDefaultsInfo *)v2 recordType];
  unsigned int v8 = [v7 isEqualToString:MSServiceAccountRecordType];

  if (v8)
  {
    uint64_t v3 = [(MSDDefaultsInfo *)v2 service];
    uint8_t v6 = [v3 serviceID];
    goto LABEL_5;
  }
  uint8_t v6 = 0;
LABEL_7:

  return v6;
}

id sub_100005D70(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [(MSDDefaultsInfo *)v2 service];
  uint64_t v4 = [v3 serviceID];
  uint64_t v5 = [v4 UUIDString];
  if ([v5 isEqualToString:kAppleMusicServiceIdentifier])
  {

    uint8_t v6 = 0;
LABEL_5:

    goto LABEL_7;
  }
  __int16 v7 = [(MSDDefaultsInfo *)v2 recordType];
  unsigned int v8 = [v7 isEqualToString:MSServiceAccountRecordType];

  if (v8)
  {
    uint64_t v3 = [(MSDDefaultsInfo *)v2 service];
    uint8_t v6 = [v3 serviceID];
    goto LABEL_5;
  }
  uint8_t v6 = 0;
LABEL_7:

  return v6;
}

uint64_t sub_100005E64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    uint64_t v5 = [v3 service];
    uint8_t v6 = [v5 serviceID];
    __int16 v7 = [*(id *)(a1 + 32) service];
    unsigned int v8 = [v7 serviceID];
    if ([v6 isEqual:v8])
    {
      uint64_t v9 = [v3 service];
      unsigned int v10 = [v9 updateListeningHistoryEnabled];
      uint64_t v11 = [*(id *)(a1 + 32) service];
      uint64_t v12 = v10 ^ [v11 updateListeningHistoryEnabled];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_100005F78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];
  id v11 = [v2 copy];

  id v3 = [*(id *)(a1 + 32) service];
  uint64_t v4 = [v3 serviceID];
  uint64_t v5 = [v4 UUIDString];
  uint8_t v6 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v5];

  __int16 v7 = [*(id *)(a1 + 32) homeID];
  unsigned int v8 = [*(id *)(a1 + 32) homeUserID];
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  uint64_t v9 = +[MSServiceUpdatedHandler shared];
  unsigned int v10 = [*(id *)(a1 + 32) homeUserID];
  [v9 mediaServiceChanged:v11 homeUserID:v10];
}

void sub_100006158(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006288;
  v10[3] = &unk_10004CA98;
  id v5 = v3;
  id v11 = v5;
  uint8_t v6 = [v4 na_firstObjectPassingTest:v10];
  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006324;
    v8[3] = &unk_10004CAC0;
    id v9 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

id sub_100006288(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = [v3 service];
    uint8_t v6 = [v5 serviceID];
    id v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_100006324(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];
  id v11 = [v2 copy];

  id v3 = [*(id *)(a1 + 32) service];
  uint64_t v4 = [v3 serviceID];
  id v5 = [v4 UUIDString];
  uint8_t v6 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v5];

  id v7 = [*(id *)(a1 + 32) homeID];
  unsigned int v8 = [*(id *)(a1 + 32) homeUserID];
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  id v9 = +[MSServiceUpdatedHandler shared];
  unsigned int v10 = [*(id *)(a1 + 32) homeUserID];
  [v9 mediaServiceChanged:v11 homeUserID:v10];
}

void sub_100006504(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006634;
  v10[3] = &unk_10004CA98;
  id v5 = v3;
  id v11 = v5;
  uint8_t v6 = [v4 na_firstObjectPassingTest:v10];
  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000066D0;
    v8[3] = &unk_10004CAC0;
    id v9 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

id sub_100006634(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = [v3 service];
    uint8_t v6 = [v5 serviceID];
    id v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_1000066D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];
  id v11 = [v2 copy];

  id v3 = [*(id *)(a1 + 32) service];
  uint64_t v4 = [v3 serviceID];
  id v5 = [v4 UUIDString];
  uint8_t v6 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v5];

  id v7 = [*(id *)(a1 + 32) homeID];
  unsigned int v8 = [*(id *)(a1 + 32) homeUserID];
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  id v9 = +[MSServiceUpdatedHandler shared];
  unsigned int v10 = [*(id *)(a1 + 32) homeUserID];
  [v9 mediaServiceRemoved:v11 homeUserID:v10];
}

id sub_100006A64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = [v3 homeUserID];
    id v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id sub_100006AE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = [v3 homeUserID];
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      id v6 = [v3 service];
      id v7 = [v6 serviceID];
      id v8 = [v7 isEqual:*(void *)(a1 + 40)];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_100006BAC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];
  id v11 = [v2 copy];

  id v3 = [*(id *)(a1 + 32) service];
  uint64_t v4 = [v3 serviceID];
  id v5 = [v4 UUIDString];
  id v6 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v5];

  id v7 = [*(id *)(a1 + 32) homeID];
  id v8 = [*(id *)(a1 + 32) homeUserID];
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  id v9 = +[MSServiceUpdatedHandler shared];
  unsigned int v10 = [*(id *)(a1 + 32) homeUserID];
  [v9 defaultMediaServiceUpdated:v11 homeUserID:v10];
}

id sub_100006F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) stopwatch];
  [v4 stop];

  id v5 = [*(id *)(a1 + 32) stopwatch];
  [v5 toggleLock:1];

  [*(id *)(a1 + 32) setDidSucceed:a2];
  uint64_t v6 = *(void *)(a1 + 32);

  return +[MSAnalytics sendServiceEvent:v6];
}

void sub_100006FD0(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v28 = a3;
  if (v28)
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000D8A8();
    }
  }
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100007588;
  v56[3] = &unk_10004CB60;
  id v57 = *(id *)(a1 + 32);
  v30 = [v29 na_firstObjectPassingTest:v56];
  if (v30)
  {
    v32 = objc_alloc_init(MSDFetchCKDataOptions);
    [(MSDFetchCKDataOptions *)v32 setCreateNewZoneIfMissing:0];
    [(MSDFetchCKDataOptions *)v32 setUserInitiatedRequest:0];
    uint64_t v6 = dispatch_group_create();
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = sub_1000075FC;
    v54[4] = sub_10000760C;
    id v55 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    char v53 = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = *(id *)(a1 + 40);
    id v7 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v49;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v49 != v8) {
            objc_enumerationMutation(obj);
          }
          unsigned int v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          dispatch_group_enter(v6);
          id v11 = [v10 homeID];
          uint64_t v12 = [v11 UUIDString];

          id v13 = [v10 homeUserID];
          uint64_t v14 = [v13 UUIDString];

          int v15 = *(void **)(a1 + 48);
          id v16 = [*(id *)(a1 + 32) bundleIdentifier];
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100007614;
          v39[3] = &unk_10004CBB0;
          v46 = v54;
          v47 = v52;
          v40 = v6;
          id v41 = *(id *)(a1 + 32);
          id v17 = v12;
          id v42 = v17;
          id v18 = v14;
          uint64_t v19 = *(void *)(a1 + 48);
          id v43 = v18;
          uint64_t v44 = v19;
          v45 = v32;
          [v15 fetchRecordZoneFor:v17 user:v18 withOptions:v45 withAttribution:v16 completion:v39];
        }
        id v7 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v7);
    }

    v20 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007AA0;
    block[3] = &unk_10004CC00;
    id v21 = *(id *)(a1 + 64);
    v37 = v52;
    uint64_t v22 = *(void *)(a1 + 48);
    v23 = *(void **)(a1 + 56);
    id v35 = v21;
    block[4] = v22;
    id v34 = v23;
    id v36 = *(id *)(a1 + 72);
    v38 = v54;
    dispatch_group_notify(v6, v20, block);

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(v54, 8);

    goto LABEL_18;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  v24 = [*(id *)(a1 + 32) serviceID];
  v32 = +[NSString stringWithFormat:@"Failed to retrieve publicInfo for service %@", v24];

  v25 = sub_100031A80();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_10000D840();
  }

  uint64_t v26 = *(void *)(a1 + 72);
  if (v26)
  {
    uint64_t v59 = MSUserInfoErrorStringKey;
    v60 = v32;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    v27 = +[NSError errorWithDomain:MSErrorDomain code:7 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v27);

LABEL_18:
  }
}

void sub_10000754C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

id sub_100007588(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceID];
  uint64_t v4 = [*(id *)(a1 + 32) serviceID];
  id v5 = [v4 UUIDString];
  id v6 = [v3 isEqualToString:v5];

  return v6;
}

uint64_t sub_1000075FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000760C(uint64_t a1)
{
}

void sub_100007614(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) serviceID];
    id v9 = [v8 UUIDString];
    uint64_t v10 = MSServiceAccountRecordType;
    id v11 = [v5 zoneID];
    uint64_t v12 = +[CKRecord createRecordWithName:v9 recordType:v10 recordZone:v11];

    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v34[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v34[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v15 = *(void *)(a1 + 56);
    v35[0] = v13;
    v35[1] = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v12 populateCKRecordInfo:v14 userInfo:v16 recordType:v10];

    if (v12)
    {
      id v17 = *(void **)(a1 + 64);
      v33 = v12;
      id v18 = +[NSArray arrayWithObjects:&v33 count:1];
      uint64_t v19 = [*(id *)(a1 + 40) bundleIdentifier];
      uint64_t v20 = *(void *)(a1 + 72);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000078F0;
      v26[3] = &unk_10004CB88;
      id v27 = *(id *)(a1 + 56);
      id v21 = *(id *)(a1 + 48);
      int8x16_t v32 = vextq_s8(*(int8x16_t *)(a1 + 80), *(int8x16_t *)(a1 + 80), 8uLL);
      uint64_t v22 = *(void *)(a1 + 64);
      id v28 = v21;
      uint64_t v29 = v22;
      id v30 = v5;
      id v31 = *(id *)(a1 + 32);
      [v17 modifyCKRecordWithRecordsToSave:v18 recordIDSToDelete:0 missingManateeIdentity:0 withAttribution:v19 withOptions:v20 completion:v26];
    }
    else
    {
      uint64_t v23 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:0];
      uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void sub_1000078F0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [a2 firstObject];
  uint64_t v8 = sub_100031A80();
  id v9 = v8;
  if (v6 || !v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000D944();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
    id v13 = v6;
    id v9 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v17 = 136315651;
    id v18 = "-[CKDatabase(MediaService) addMediaService:usingSetupBundles:transaction:completion:]_block_invoke_2";
    __int16 v19 = 2113;
    uint64_t v20 = v10;
    __int16 v21 = 2113;
    uint64_t v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Successfully saved record for user: %{private}@ home: %{private}@", (uint8_t *)&v17, 0x20u);
  }

  if ([v6 CKErrorHasErrorCode:112])
  {
    uint64_t v14 = sub_100031A80();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000D910();
    }

    uint64_t v15 = *(void **)(a1 + 48);
    id v16 = [*(id *)(a1 + 56) zoneID];
    [v15 handleCKErrorMissingManateeIdentity:v16 homeUserID:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t sub_100007AA0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v2 = objc_opt_new();
    [v2 setUserInitiatedRequest:1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100007BA8;
    v5[3] = &unk_10004CBD8;
    id v3 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v3 refreshDatabase:0 completion:v5];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
  return result;
}

void sub_100007BA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000D9C0();
    }
  }
  [*(id *)(a1 + 32) releaseTransaction];
}

void sub_100007E50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v7);
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v5 zoneID];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100007F84;
    v13[3] = &unk_10004CC50;
    id v16 = *(id *)(a1 + 56);
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    [v8 fetchAllRecordsForRecordZoneID:v9 userInfo:v10 withOptions:v11 completion:v13];
  }
}

void sub_100007F84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    uint64_t v44 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10000843C;
    v58[3] = &unk_10004CA98;
    id v59 = *(id *)(a1 + 32);
    id v45 = v5;
    uint64_t v8 = [v5 na_filter:v58];
    v46 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v9 = v8;
    id v53 = [v9 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (!v53) {
      goto LABEL_18;
    }
    uint64_t v10 = *(void *)v55;
    uint64_t v11 = MSDefaultServiceRecordType;
    uint64_t v51 = kCKDatabaseAccessUserInfoHomeIDKey;
    uint64_t v52 = MSPlaceholderRecordType;
    uint64_t v47 = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v48 = *(void *)v55;
    uint64_t v49 = MSDefaultServiceRecordType;
    uint64_t v50 = a1;
    while (1)
    {
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v14 = [v13 recordType:v44];
        if (([v14 isEqualToString:v11] & 1) == 0)
        {
          id v15 = [v13 recordType];
          unsigned __int8 v16 = [v15 isEqualToString:v52];

          if (v16) {
            continue;
          }
          id v14 = [v13 homeID];
          id v17 = [v14 UUIDString];
          id v18 = [*(id *)(a1 + 40) objectForKey:v51];
          if ([v17 isEqualToString:v18])
          {
            [v13 homeUserID];
            v20 = id v19 = v9;
            __int16 v21 = [v20 UUIDString];
            uint64_t v22 = [*(id *)(a1 + 40) objectForKey:v47];
            unsigned int v23 = [v21 isEqualToString:v22];

            a1 = v50;
            uint64_t v11 = v49;

            id v9 = v19;
            uint64_t v10 = v48;

            if (!v23) {
              continue;
            }
            uint64_t v24 = [v13 service];
            v25 = [v24 serviceID];
            uint64_t v26 = [v25 UUIDString];
            id v14 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v26];

            uint64_t v11 = v49;
            id v27 = [v13 service];
            id v17 = [v27 copy];

            id v28 = [v13 homeID];
            uint64_t v29 = [v13 homeUserID];
            [v17 populateMediaService:v14 homeID:v28 homeUserID:v29];

            a1 = v50;
            [v46 na_safeAddObject:v17];
          }
          else
          {
          }
        }
      }
      id v53 = [v9 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (!v53)
      {
LABEL_18:

        if ([v46 count])
        {
          uint64_t v30 = *(void *)(a1 + 48);
          id v7 = v44;
          id v5 = v45;
          if (v30) {
            (*(void (**)(uint64_t, void *, void))(v30 + 16))(v30, v46, 0);
          }
        }
        else
        {
          int8x16_t v32 = sub_100031A80();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10000DA5C(v32, v33, v34, v35, v36, v37, v38, v39);
          }

          uint64_t v40 = *(void *)(a1 + 48);
          id v7 = v44;
          id v5 = v45;
          if (v40)
          {
            uint64_t v41 = MSErrorDomain;
            uint64_t v60 = MSUserInfoErrorStringKey;
            CFStringRef v61 = @"Fetched records but couldn't create valid service objects";
            id v42 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
            id v43 = +[NSError errorWithDomain:v41 code:2 userInfo:v42];
            (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v43);
          }
        }

        goto LABEL_28;
      }
    }
  }
  uint64_t v31 = *(void *)(a1 + 48);
  if (v31) {
    (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, 0, v7);
  }
LABEL_28:
}

id sub_10000843C(uint64_t a1, void *a2)
{
  id v3 = [a2 recordZoneName];
  uint64_t v4 = [*(id *)(a1 + 32) zoneID];
  id v5 = [v4 zoneName];
  id v6 = [v3 isEqualToString:v5];

  return v6;
}

void sub_100008728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v16 = *(void *)(a1 + 48);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v7);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v9 = objc_alloc((Class)CKRecordID);
    uint64_t v10 = MSDefaultServiceRecordName;
    uint64_t v11 = [v5 zoneID];
    id v12 = [v9 initWithRecordName:v10 zoneID:v11];

    id v13 = [*(id *)(a1 + 32) serviceID];
    id v14 = [v13 UUIDString];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000088C4;
    v17[3] = &unk_10004CCA0;
    uint64_t v15 = *(void *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    [WeakRetained _updateDefaultService:v12 serviceID:v14 userInfo:v15 completion:v17];
  }
}

uint64_t sub_1000088C4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100008A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008A44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6 || ([v6 CKErrorHasErrorCode:11] & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v9 = [v5 copy];
    if (!v9)
    {
      id v10 = objc_alloc((Class)CKRecord);
      id v9 = [v10 initWithRecordType:MSDefaultServiceRecordType recordID:*(void *)(a1 + 32)];
      uint64_t v11 = MSHomeParticipantHomeUserIdentifier;
      id v12 = [*(id *)(a1 + 40) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
      [v9 setRecordFieldForKey:v11 value:v12];
    }
    [v9 setRecordFieldForKey:MediaServiceIdentifier value:*(void *)(a1 + 48)];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008C90;
    v16[3] = &unk_10004CCF0;
    id v19 = *(id *)(a1 + 56);
    v16[4] = WeakRetained;
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    [WeakRetained saveRecord:v9 completionHandler:v16];

    id v13 = v19;
    goto LABEL_7;
  }
  id v14 = sub_100031A80();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10000DB08(a1, (uint64_t)v7, v14);
  }

  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([v7 CKErrorHasErrorCode:112])
  {
    id v9 = [*(id *)(a1 + 32) zoneID];
    id v13 = [*(id *)(a1 + 40) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    [WeakRetained handleCKErrorMissingManateeIdentity:v9 homeUserID:v13];
LABEL_7:
  }
}

void sub_100008C90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  uint64_t v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000DB94();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 recordID];
    int v14 = 138412290;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully updated default service %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v5 != 0, v6);
  }
  if ([v6 CKErrorHasErrorCode:112])
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) zoneID];
    id v13 = [*(id *)(a1 + 48) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    [v11 handleCKErrorMissingManateeIdentity:v12 homeUserID:v13];
  }
}

void sub_1000090C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000090F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v7);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v9 = [v5 zoneID];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009234;
    v13[3] = &unk_10004CD40;
    id v14 = *(id *)(a1 + 48);
    id v15 = v5;
    id v16 = *(id *)(a1 + 56);
    [WeakRetained fetchAllRecordsForRecordZoneID:v9 userInfo:v10 withOptions:v11 completion:v13];
  }
}

void sub_100009234(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000095B8;
  v30[3] = &unk_10004CB10;
  id v31 = *(id *)(a1 + 32);
  id v32 = *(id *)(a1 + 40);
  id v6 = a2;
  id v7 = [v6 na_firstObjectPassingTest:v30];
  uint64_t v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 service];
    uint64_t v10 = [v9 serviceID];
    *(_DWORD *)buf = 138477827;
    uint64_t v36 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found default service record in cached info, serviceID: %{private}@", buf, 0xCu);
  }
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_1000096AC;
  id v28 = &unk_10004CA98;
  id v11 = v7;
  id v29 = v11;
  uint64_t v12 = [v6 na_firstObjectPassingTest:&v25];

  if (v12)
  {
    id v13 = [v12 service];
    id v14 = [v13 copy];

    id v15 = [v14 serviceID];
    id v16 = [v15 UUIDString];
    id v17 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v16];

    id v18 = [v12 homeID];
    id v19 = [v12 homeUserID];
    [v14 populateMediaService:v17 homeID:v18 homeUserID:v19];

    uint64_t v20 = *(void *)(a1 + 48);
    if (v20) {
      (*(void (**)(uint64_t, id, id))(v20 + 16))(v20, v14, v5);
    }
    goto LABEL_10;
  }
  id v14 = +[NSString stringWithFormat:@"Failed to find default service for user %@", *(void *)(a1 + 32), v25, v26, v27, v28];
  __int16 v21 = sub_100031A80();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10000D840();
  }

  uint64_t v22 = *(void *)(a1 + 48);
  if (v22)
  {
    uint64_t v23 = MSErrorDomain;
    uint64_t v33 = MSUserInfoErrorStringKey;
    id v34 = v14;
    id v17 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v24 = +[NSError errorWithDomain:v23 code:2 userInfo:v17];
    (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v24);

LABEL_10:
  }
}

id sub_1000095B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = [v3 homeUserID];
    id v6 = [v5 UUIDString];
    if ([v6 isEqualToString:*(void *)(a1 + 32)])
    {
      id v7 = [v3 recordZoneName];
      uint64_t v8 = [*(id *)(a1 + 40) zoneID];
      id v9 = [v8 zoneName];
      id v10 = [v7 isEqualToString:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id sub_1000096AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = [v3 service];
    id v6 = [v5 serviceID];
    id v7 = [*(id *)(a1 + 32) service];
    uint64_t v8 = [v7 serviceID];
    if ([v6 isEqual:v8])
    {
      id v9 = [v3 homeUserID];
      id v10 = [*(id *)(a1 + 32) homeUserID];
      if ([v9 isEqual:v10])
      {
        [v3 recordZoneName];
        id v11 = v15 = v9;
        uint64_t v12 = [*(id *)(a1 + 32) recordZoneName];
        id v13 = [v11 isEqualToString:v12];

        id v9 = v15;
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id sub_100009B64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) stopwatch];
  [v4 stop];

  id v5 = [*(id *)(a1 + 32) stopwatch];
  [v5 toggleLock:1];

  [*(id *)(a1 + 32) setDidSucceed:a2];
  uint64_t v6 = *(void *)(a1 + 32);

  return +[MSAnalytics sendServiceEvent:v6];
}

void sub_100009BEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v14 = *(void *)(a1 + 72);
    if (v14) {
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v7);
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v5 zoneID];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100009D60;
    v15[3] = &unk_10004CE08;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 40);
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    id v18 = v12;
    uint64_t v19 = v13;
    [v8 fetchAllRecordsForRecordZoneID:v9 userInfo:v10 withOptions:v11 completion:v15];
  }
}

void sub_100009D60(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10000A358;
    v50[3] = &unk_10004CD90;
    id v51 = a1[4];
    id v52 = a1[5];
    id v53 = a1[6];
    uint64_t v8 = [v5 na_firstObjectPassingTest:v50];
    if (v8)
    {
      id v9 = objc_alloc((Class)CKRecordID);
      uint64_t v10 = [v8 recordName];
      uint64_t v11 = [a1[6] zoneID];
      id v12 = [v9 initWithRecordName:v10 zoneID:v11];

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10000A4E0;
      v48[3] = &unk_10004CA98;
      id v49 = a1[5];
      uint64_t v13 = [v5 na_firstObjectPassingTest:v48];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10000A5A0;
      v44[3] = &unk_10004CDB8;
      id v46 = a1[8];
      id v14 = v12;
      id v45 = v14;
      id v47 = a1[9];
      id v15 = objc_retainBlock(v44);
      uint64_t v37 = v13;
      id v16 = [v13 service];
      id v17 = [v16 serviceID];
      uint64_t v36 = v8;
      id v18 = [v8 service];
      uint64_t v19 = [v18 serviceID];
      LODWORD(v11) = [v17 isEqual:v19];

      if (v11)
      {
        id v20 = sub_100031A80();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "User is removing Default service. Updating Default service to apple music", buf, 2u);
        }

        id v21 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:kAppleMusicServiceIdentifier];
        id v22 = objc_alloc((Class)CKRecordID);
        uint64_t v23 = MSDefaultServiceRecordName;
        uint64_t v24 = [a1[6] zoneID];
        id v25 = [v22 initWithRecordName:v23 zoneID:v24];

        uint64_t v26 = sub_100031A80();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v21 serviceID];
          *(_DWORD *)buf = 136315394;
          long long v55 = "-[CKDatabase(MediaService) removeMediaService:withUserInfo:completion:]_block_invoke";
          __int16 v56 = 2112;
          long long v57 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s Updating Default service to %@", buf, 0x16u);
        }
        id v28 = a1[7];
        id v29 = [v21 serviceID];
        id v30 = a1[5];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10000A688;
        v38[3] = &unk_10004CDE0;
        v38[4] = a1[7];
        id v39 = v14;
        uint64_t v41 = v15;
        id v40 = a1[4];
        id v42 = a1[8];
        id v43 = a1[9];
        [v28 _updateDefaultService:v25 serviceID:v29 userInfo:v30 completion:v38];
      }
      else
      {
        [a1[7] _deleteRecord:v14 completion:v15];
      }

      uint64_t v35 = v49;
      uint64_t v8 = v36;
    }
    else
    {
      id v32 = sub_100031A80();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10000DBFC();
      }

      (*((void (**)(void))a1[8] + 2))();
      uint64_t v33 = (void (**)(id, void, void *))a1[9];
      if (!v33) {
        goto LABEL_19;
      }
      uint64_t v34 = MSErrorDomain;
      uint64_t v58 = MSUserInfoErrorStringKey;
      CFStringRef v59 = @"Failed to remove service, no record found";
      id v14 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      uint64_t v35 = +[NSError errorWithDomain:v34 code:2 userInfo:v14];
      v33[2](v33, 0, v35);
    }

LABEL_19:
    goto LABEL_20;
  }
  (*((void (**)(void))a1[8] + 2))();
  id v31 = (void (**)(id, void, void *))a1[9];
  if (v31) {
    v31[2](v31, 0, v7);
  }
LABEL_20:
}

id sub_10000A358(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = [v3 service];
    id v6 = [v5 serviceID];
    id v7 = [a1[4] serviceID];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [v3 homeUserID];
      id v9 = [v8 UUIDString];
      uint64_t v10 = [a1[5] objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
      if ([v9 isEqualToString:v10])
      {
        [v3 recordZoneName];
        uint64_t v11 = v16 = v9;
        [a1[6] zoneID];
        id v12 = v17 = v8;
        uint64_t v13 = [v12 zoneName];
        id v14 = [v11 isEqualToString:v13];

        uint64_t v8 = v17;
        id v9 = v16;
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

id sub_10000A4E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = [v3 homeUserID];
    id v6 = [v5 UUIDString];
    id v7 = [*(id *)(a1 + 32) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    id v8 = [v6 isEqualToString:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_10000A5A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = a2;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v7 = sub_100031A80();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully removed service", v16, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10000DC30(a1, v8, v9, v10, v11, v12, v13, v14);
  }

  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v5);
  }
}

void sub_10000A688(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _deleteRecord:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }
  else
  {
    int v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 48) serviceID];
      int v9 = 138477827;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to update default service, not removing service (%{private}@)", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v8 = *(void *)(a1 + 72);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
    }
  }
}

uint64_t sub_10000A900(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000AB84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v7);
    }
  }
  else
  {
    id v8 = objc_alloc((Class)CKRecordID);
    int v9 = [*(id *)(a1 + 32) serviceID];
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = [v5 zoneID];
    id v12 = [v8 initWithRecordName:v10 zoneID:v11];

    uint64_t v13 = *(void **)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000AD10;
    v17[3] = &unk_10004CE80;
    id v21 = *(id *)(a1 + 64);
    uint64_t v14 = *(void **)(a1 + 48);
    void v17[4] = *(void *)(a1 + 40);
    id v18 = v12;
    id v19 = v14;
    id v20 = *(id *)(a1 + 56);
    id v15 = v12;
    [v13 fetchRecordWithID:v15 completionHandler:v17];
  }
}

void sub_10000AD10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = *(void **)(a1 + 56);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000AF1C;
    v23[3] = &unk_10004CE58;
    id v9 = v5;
    id v24 = v9;
    id v25 = *(id *)(a1 + 64);
    [v8 enumerateKeysAndObjectsUsingBlock:v23];
    uint64_t v10 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000B0E0;
    v19[3] = &unk_10004CCF0;
    id v11 = *(id *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(a1 + 40);
    id v22 = v11;
    v19[4] = v12;
    id v20 = v13;
    id v21 = *(id *)(a1 + 48);
    [v10 saveRecord:v9 completionHandler:v19];

    uint64_t v14 = v24;
LABEL_10:

    goto LABEL_11;
  }
  id v15 = sub_100031A80();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10000DCD4();
  }

  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v7);
  }
  if ([v7 CKErrorHasErrorCode:112])
  {
    id v17 = *(void **)(a1 + 32);
    uint64_t v14 = [*(id *)(a1 + 40) zoneID];
    id v18 = [*(id *)(a1 + 48) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    [v17 handleCKErrorMissingManateeIdentity:v14 homeUserID:v18];

    goto LABEL_10;
  }
LABEL_11:
}

void sub_10000AF1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 integerValue];
  id v7 = sub_100031A80();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unsupported propertyType %lu", buf, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v10 = MSErrorDomain;
      uint64_t v13 = MSUserInfoErrorStringKey;
      CFStringRef v14 = @"Unsupported property type passed";
      id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v12 = +[NSError errorWithDomain:v10 code:1 userInfo:v11];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = [v5 BOOLValue];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating Listening history enabled : %d", buf, 8u);
    }

    [*(id *)(a1 + 32) setRecordFieldForKey:MediaServiceUpdateListeningHistory value:v5];
  }
}

void sub_10000B0E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    BOOL v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000DD3C();
    }
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, BOOL, void *))(v9 + 16))(v9, v5 != 0, v7);
  }
  if ([v7 CKErrorHasErrorCode:112])
  {
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) zoneID];
    uint64_t v12 = [*(id *)(a1 + 48) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    [v10 handleCKErrorMissingManateeIdentity:v11 homeUserID:v12];
  }
}

void sub_10000B3B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ([v6 CKErrorHasErrorCode:112] && CKErrorIsCode())
    {
      BOOL v8 = [v7 userInfo];
      uint64_t v9 = [v8 objectForKey:CKPartialErrorsByItemIDKey];

      uint64_t v10 = [v9 allKeys];
      id v11 = sub_100031A80();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Zones with Manatee Identity Lost %@", buf, 0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000B5B4;
      v16[3] = &unk_10004CED0;
      uint64_t v12 = *(void **)(a1 + 40);
      v16[4] = *(void *)(a1 + 32);
      id v17 = v12;
      [v10 enumerateObjectsUsingBlock:v16];
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13) {
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v7);
    }
  }
  else
  {
    CFStringRef v14 = [v5 allValues];
    id v15 = [v14 ms_objectsPassingTest:&stru_10004CF10];

    [*(id *)(a1 + 32) _serviceConfigInfoFor:v15 homeUserIDS:*(void *)(a1 + 40) serviceID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

id sub_10000B5B4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCKErrorMissingManateeIdentity:a2 homeUserIDS:*(void *)(a1 + 40)];
}

BOOL sub_10000B5C4(id a1, CKRecordZone *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = [(CKRecordZone *)a2 zoneID];
  id v5 = [v4 zoneName];
  char v6 = [v5 isEqualToString:CKRecordZoneDefaultName] ^ 1;

  return v6;
}

void sub_10000BA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_10000BABC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
LABEL_8:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_12;
  }
  BOOL v8 = [v5 recordFieldForKey:MSHomeParticipantHomeUserIdentifier];
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
  unsigned __int8 v10 = [*(id *)(a1 + 32) containsObject:v9];
  id v11 = sub_100031A80();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 48);
      int v18 = 138412546;
      id v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully fetched record for homeUser: %@ matching serviceID: %@", (uint8_t *)&v18, 0x16u);
    }

    id v14 = objc_alloc((Class)NSUUID);
    id v15 = [v5 recordFieldForKey:MSHomeParticipantHomeIdentifier];
    id v16 = [v14 initWithUUIDString:v15];

    id v17 = [v5 createMediaServiceObjectFromRecord];
    [v17 populateMediaService:*(void *)(a1 + 56) homeID:v16 homeUserID:v9];
    [*(id *)(a1 + 64) na_safeSetObject:v17 forKey:v9];

    goto LABEL_8;
  }
  if (v12)
  {
    int v18 = 138412290;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User did not request info for %@", (uint8_t *)&v18, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_12:
}

uint64_t sub_10000BCE0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

void sub_10000BFA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v14 = sub_100031A80();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000DE1C();
    }

    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v7);
    }
  }
  else
  {
    BOOL v8 = objc_opt_new();
    id v9 = *(void **)(a1 + 32);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C1D4;
    v18[3] = &unk_10004CFB0;
    id v10 = v8;
    id v19 = v10;
    id v20 = v5;
    [v9 enumerateObjectsUsingBlock:v18];
    id v11 = sub_100031A80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to remove services %@", buf, 0xCu);
    }

    BOOL v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C284;
    v16[3] = &unk_10004C988;
    id v17 = *(id *)(a1 + 56);
    [v12 modifyCKRecordWithRecordsToSave:0 recordIDSToDelete:v10 missingManateeIdentity:0 withAttribution:0 withOptions:v13 completion:v16];
  }
}

void sub_10000C1D4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_alloc((Class)CKRecordID);
  id v8 = [v4 UUIDString];

  id v6 = [*(id *)(a1 + 40) zoneID];
  id v7 = [v5 initWithRecordName:v8 zoneID:v6];
  [v3 na_safeAddObject:v7];
}

void sub_10000C284(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed services %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v6 != 0, v7);
  }
}

void sub_10000C660(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v7);
    }
  }
  else
  {
    id v8 = objc_alloc((Class)CKRecordID);
    uint64_t v9 = [*(id *)(a1 + 32) serviceID];
    int v10 = [v9 UUIDString];
    id v11 = [v5 zoneID];
    id v12 = [v8 initWithRecordName:v10 zoneID:v11];

    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000C7DC;
    v19[3] = &unk_10004CCF0;
    id v23 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = *(void **)(a1 + 48);
    id v20 = v15;
    uint64_t v21 = v16;
    id v22 = v17;
    [v13 fetchRecordWithID:v12 withOptions:v14 completion:v19];
  }
}

void sub_10000C7DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    uint64_t v16 = sub_100031A80();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000DEB0();
    }

    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v6);
    }
  }
  else
  {
    id v7 = [a2 copy];
    id v8 = [*(id *)(a1 + 32) authConfiguration];
    uint64_t v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

    int v10 = [*(id *)(a1 + 32) authCredential];
    id v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];

    if (v11) {
      [v7 setRecordFieldForKey:MediaServiceAuthCredential value:v11];
    }
    if (v9) {
      [v7 setRecordFieldForKey:MediaServiceAuthConfiguration value:v9];
    }
    uint64_t v12 = MediaServiceAuthFatalError;
    uint64_t v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) authFatalError]);
    [v7 setRecordFieldForKey:v12 value:v13];

    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C9F4;
    v18[3] = &unk_10004D018;
    void v18[4] = v14;
    id v19 = *(id *)(a1 + 56);
    [v14 saveRecord:v7 withOptions:v15 completion:v18];
  }
}

void sub_10000C9F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000DF2C();
    }
  }
  else
  {
    [*(id *)(a1 + 32) refreshDatabase:0 completion:&stru_10004CFF0];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v5 != 0, v6);
  }
}

void sub_10000CAA0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100031A80();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      uint64_t v9 = v2;
      id v5 = "Error updating caches after saving authInfo %@";
      id v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "Successfully updated caches after saving authInfo";
    id v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

void sub_10000CE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10000CE8C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000DFA8();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000CF98;
    v7[3] = &unk_10004D040;
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v8 = *(id *)(a1 + 32);
    +[MSAuthTokenProvider validateConfigurationResourceForMediaService:v6 networkActivity:0 completion:v7];
  }
}

void sub_10000CF98(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000E010();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000D01C(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_1000075FC;
    v29[4] = sub_10000760C;
    id v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = sub_1000075FC;
    v27[4] = sub_10000760C;
    id v28 = 0;
    id v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v6 = [*(id *)(a1 + 48) UUIDString];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000D2F8;
    v21[3] = &unk_10004D0B8;
    id v25 = v29;
    uint32_t v7 = v3;
    id v22 = v7;
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    id v23 = v8;
    uint64_t v24 = v9;
    uint64_t v26 = v27;
    [v4 fetchRecordZoneFor:v5 user:v6 withOptions:0 completion:v21];

    int v10 = dispatch_get_global_queue(33, 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000D538;
    v13[3] = &unk_10004D128;
    id v19 = v27;
    id v20 = v29;
    id v18 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    id v16 = v11;
    uint64_t v17 = v12;
    dispatch_group_notify(v7, v10, v13);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
  }
}

void sub_10000D2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10000D2F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint32_t v7 = v6;
  if (!v5 || v6)
  {
    id v14 = sub_100031A80();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000E078();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id v8 = objc_alloc((Class)CKRecordID);
    uint64_t v9 = [*(id *)(a1 + 40) serviceID];
    int v10 = [v9 UUIDString];
    id v11 = [v5 zoneID];
    id v12 = [v8 initWithRecordName:v10 zoneID:v11];

    uint64_t v13 = *(void **)(a1 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000D480;
    v15[3] = &unk_10004D090;
    long long v17 = *(_OWORD *)(a1 + 56);
    id v16 = *(id *)(a1 + 32);
    [v13 fetchRecordWithID:v12 withOptions:0 completion:v15];
  }
}

void sub_10000D480(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint32_t v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000E0E0();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000D538(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    BOOL v2 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  id v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Successfully fetched old user info, switching account info", buf, 2u);
  }

  v13[0] = kCKDatabaseAccessUserInfoHomeIDKey;
  id v4 = [*(id *)(a1 + 32) UUIDString];
  v14[0] = v4;
  v13[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
  id v5 = [*(id *)(a1 + 40) UUIDString];
  v14[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) populateCKRecordInfo:*(void *)(a1 + 48) userInfo:v6 recordType:MSServiceAccountRecordType];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D71C;
  v10[3] = &unk_10004D100;
  id v8 = *(void **)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  void v10[4] = *(void *)(a1 + 56);
  id v11 = v9;
  [v8 saveRecord:v7 withOptions:0 completion:v10];
}

id sub_10000D71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!a3)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 refreshDatabase:0 completion:&stru_10004D0D8];
  }
  return result;
}

void sub_10000D784(id a1, NSError *a2)
{
  BOOL v2 = a2;
  id v3 = sub_100031A80();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000E148();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully updated local caches post user account switch", v5, 2u);
  }
}

void sub_10000D818(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000D840()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_10000D8A8()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to add service. Error while fetching media services from public db: %@", v2, v3, v4, v5, v6);
}

void sub_10000D910()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Encountered CKError Manatee Missing identity when trying to add a service", v2, v3, v4, v5, v6);
}

void sub_10000D944()
{
  sub_10000D834();
  sub_10000D818((void *)&_mh_execute_header, v0, v1, "%s Failed to save record %{private}@", v2, v3, v4, v5, 3u);
}

void sub_10000D9C0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to sync cache after adding new service:, %@", v2, v3, v4, v5, v6);
}

void sub_10000DA28()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to fetch services, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
}

void sub_10000DA5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DAD4()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to update default service, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
}

void sub_10000DB08(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch record with ID %@, %@", (uint8_t *)&v4, 0x16u);
}

void sub_10000DB94()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to update default service record", v2, v3, v4, v5, v6);
}

void sub_10000DBC8()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to fetch default media service, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
}

void sub_10000DBFC()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to remove service, no record found", v2, v3, v4, v5, v6);
}

void sub_10000DC30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DCA0()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to updateProperty, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
}

void sub_10000DCD4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch record %{private}@", v2, v3, v4, v5, v6);
}

void sub_10000DD3C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving record in updateProperty %{private}@", v2, v3, v4, v5, v6);
}

void sub_10000DDA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DE1C()
{
  int v3 = 136315651;
  uint64_t v4 = "-[CKDatabase(MediaService) removeMediaServices:withUserInfo:completion:]_block_invoke";
  sub_10000D834();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s Fetched recordZone %{private}@, error %{private}@", (uint8_t *)&v3, 0x20u);
}

void sub_10000DEB0()
{
  sub_10000D834();
  sub_10000D818((void *)&_mh_execute_header, v0, v1, "%s Error fetching record, %@", v2, v3, v4, v5, 2u);
}

void sub_10000DF2C()
{
  sub_10000D834();
  sub_10000D818((void *)&_mh_execute_header, v0, v1, "%s Error saving record, %@", v2, v3, v4, v5, 2u);
}

void sub_10000DFA8()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error fetching auth tokens, %@", v2, v3, v4, v5, v6);
}

void sub_10000E010()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error validating config info, %@", v2, v3, v4, v5, v6);
}

void sub_10000E078()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error fetching recordZone info %@", v2, v3, v4, v5, v6);
}

void sub_10000E0E0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error fetching CKRecord info %@", v2, v3, v4, v5, v6);
}

void sub_10000E148()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error updating local caches post user account switch, %@", v2, v3, v4, v5, v6);
}

uint64_t sub_10000E250(uint64_t a1)
{
  qword_100056760 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000E3FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000E47C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000E6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000E6CC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isHomeKitReady];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _noteHomesStillLoading];
  }
  return result;
}

void sub_10000E804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000E81C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isHomeKitReady];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _noteHomesStillLoading];
  }
  return result;
}

void sub_10000E954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000E96C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isHomeKitReady];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _noteHomesStillLoading];
  }
  return result;
}

void sub_10000EAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EB00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000EB10(uint64_t a1)
{
}

void sub_10000EB18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentHome];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 32) queuedAwaitingCurrentHome];
    id v5 = objc_retainBlock(*(id *)(a1 + 40));
    [v6 addObject:v5];
  }
}

void sub_10000EC94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100031A80();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100010310();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138477827;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully registered to accept shared for CloudKitContainer %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

void sub_10000EF40(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = sub_100031A80();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully finished refresh after home was added", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100010378();
  }
}

void sub_10000F6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F6C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 26)) {
    BOOL v3 = *(unsigned char *)(v2 + 25) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Detected first start up. Finishing initialization steps and refreshing CloudKit.", (uint8_t *)&v12, 2u);
    }

    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 40) homes];
      int v12 = 138477827;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Homes Loaded: %{private}@", (uint8_t *)&v12, 0xCu);
    }
    int v7 = MSDSignpostFacility();
    uint64_t v8 = v7;
    os_signpost_id_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = [*(id *)(a1 + 40) homes];
      id v11 = [v10 count];
      int v12 = 134349056;
      id v13 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "LookupHomes", "LookupFinishedWithCount=%{signpost.description:attribute,public}lu", (uint8_t *)&v12, 0xCu);
    }
  }
}

uint64_t sub_10000F890(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 26) = 0;
  return result;
}

void sub_10000F89C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a3;
  uint64_t v4 = sub_100031A80();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000103E0();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully refreshed data after HomeKit initialization", v6, 2u);
  }
}

void sub_10000FA40(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = sub_100031A80();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully finished refresh after MultiUserEnablement status changed", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100010448();
  }
}

void sub_10000FC44(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  int v7 = v6;
  if (!a3 || v6)
  {
    id v11 = sub_100031A80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000104B0();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v7);
    }
  }
  else
  {
    uint64_t v8 = [a3 dataUsingEncoding:4];
    id v9 = [objc_alloc((Class)HMUserCloudShareClientInfo) initWithAccountAuthToken:v8];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, id, void))(v10 + 16))(v10, 1, v9, 0);
    }
  }
}

id sub_10000FDB4(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

void sub_10000FE6C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = sub_100031A80();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully finished refresh after home was removed", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100010518();
  }
}

void sub_1000101F8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 currentHome];
  [v1 homeManager:v2 didHomeKitSyncComplete:v3];
}

void sub_100010310()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error registering CloudKit containers %{private}@", v2, v3, v4, v5, v6);
}

void sub_100010378()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error refreshing DB after home was added, %{private}@", v2, v3, v4, v5, v6);
}

void sub_1000103E0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to refresh after HomeKit initialized, %{private}@", v2, v3, v4, v5, v6);
}

void sub_100010448()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error refreshing DB after MultiUserEnablement status changed, %{private}@", v2, v3, v4, v5, v6);
}

void sub_1000104B0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to accept invitation, %{private}@", v2, v3, v4, v5, v6);
}

void sub_100010518()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error refreshing DB after home was removed, %{private}@", v2, v3, v4, v5, v6);
}

void sub_1000108A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000109A0;
    v9[3] = &unk_10004D338;
    uint8_t v6 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v6 acceptShareWithShareMetadata:a2 completion:v9];
  }
  else
  {
    int v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000119C0();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v5);
    }
  }
}

void sub_1000109A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint8_t v6 = +[NSUUID UUID];
    int v7 = [v6 UUIDString];

    uint64_t v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138477827;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CKShareAcceptance token %{private}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void *, void))(v9 + 16))(v9, 1, v7, 0);
    }
  }
  else
  {
    id v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100011A28();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v5);
    }
  }
}

void sub_100010E74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    unsigned int v14 = [v6 CKErrorHasErrorCode:11];
    id v15 = sub_100031A80();
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Share has underlying error of CKErrorUnknownItem", (uint8_t *)&v21, 2u);
      }

      [*(id *)(a1 + 40) _saveRecordAndShare:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100011B3C(a1, (uint64_t)v7, v16);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 recordID];
      int v21 = 138477827;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched record %{private}@", (uint8_t *)&v21, 0xCu);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v5;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    int v12 = [v11 participants];
    id v13 = [v12 count];

    if ((unint64_t)v13 >= 2)
    {
      if (v13 == (id)2)
      {
        [*(id *)(a1 + 40) _handleMultiplePeopleOnShare:v11 completion:*(void *)(a1 + 48)];
      }
      else
      {
        long long v17 = sub_100031A80();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100011BEC();
        }

        uint64_t v19 = *(void *)(a1 + 48);
        if (v19)
        {
          id v20 = +[NSError errorWithDomain:CKErrorDomain code:29 userInfo:0];
          (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 40) shareRecordWithOwner:v11 completion:*(void *)(a1 + 48)];
    }
  }
}

void sub_1000112EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_100031A80();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138477827;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully established share with owner %{private}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100011D00();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_1000116B0(id a1, CKShareParticipant *a2)
{
  return (id)[(CKShareParticipant *)a2 role] != (id)1;
}

void sub_1000117C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_100031A80();
  uint64_t v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100011DD0();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v5 recordID];
      int v13 = 138477827;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully saved Share %{private}@", (uint8_t *)&v13, 0xCu);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v5;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    int v12 = sub_100031A80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138477827;
      id v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Now using share... %{private}@", (uint8_t *)&v13, 0xCu);
    }

    [*(id *)(a1 + 32) shareRecordWithOwner:v11 completion:*(void *)(a1 + 40)];
  }
}

void sub_10001198C()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to initialize MSDHomeCloudShare", v2, v3, v4, v5, v6);
}

void sub_1000119C0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error in fetching meta data %{private}@", v2, v3, v4, v5, v6);
}

void sub_100011A28()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error in Accepting CKShare %{private}@", v2, v3, v4, v5, v6);
}

void sub_100011A90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011B08()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "ShareableRecord is not of expected type", v2, v3, v4, v5, v6);
}

void sub_100011B3C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) recordID];
  sub_100005280();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error fetching CKShare %{private}@, error %@", v6, 0x16u);
}

void sub_100011BEC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Unexpected number of participants on share: %lu", v2, v3, v4, v5, v6);
}

void sub_100011C54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011CCC()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to establish link with owner, NIL CKShare", v2, v3, v4, v5, v6);
}

void sub_100011D00()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to establish share with owner %@", v2, v3, v4, v5, v6);
}

void sub_100011D68()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to check participant status - nil CKShare", v2, v3, v4, v5, v6);
}

void sub_100011D9C()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to find someone with CKParticipantRole : User", v2, v3, v4, v5, v6);
}

void sub_100011DD0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving record %@", v2, v3, v4, v5, v6);
}

id MSDSignpostFacility()
{
  if (qword_100056770 != -1) {
    dispatch_once(&qword_100056770, &stru_10004D430);
  }
  __int16 v0 = (void *)qword_100056768;

  return v0;
}

void sub_1000124A8(id a1)
{
  qword_100056768 = (uint64_t)os_log_create("com.apple.mediasetupd.signposts", "signposts");

  _objc_release_x1();
}

os_signpost_id_t MSDGenerateSignpostID()
{
  __int16 v0 = MSDSignpostFacility();
  os_signpost_id_t v1 = os_signpost_id_generate(v0);

  return v1;
}

uint64_t sub_100012D60(uint64_t a1)
{
  qword_100056778 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100012FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012FEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performStartup];
}

void sub_100013334(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_100013350(uint64_t a1, xpc_object_t xdict)
{
  string = (char *)xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string) {
    string = (char *)[objc_alloc((Class)NSString) initWithUTF8String:string];
  }
  uint64_t v4 = sub_100031A80();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138477827;
    id v16 = string;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received Darwin Notification %{private}@", (uint8_t *)&v15, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![string isEqualToString:kHomeMultiUserStatusChangedNotification])
  {
    if (![string isEqualToString:kHomeUserCloudShareChangedNotification]) {
      goto LABEL_15;
    }
    __int16 v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Previously registered to accept shares, should receive HomeKit callback on this one", (uint8_t *)&v15, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!WeakRetained)
  {
    __int16 v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100018760(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_14;
  }
  uint8_t v6 = (void *)WeakRetained[6];
  if (v6) {
    [v6 trigger];
  }
LABEL_15:
}

void sub_1000136EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013714(id a1)
{
  os_signpost_id_t v1 = sub_100031A80();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection to CUCoalescer invalidated", v2, 2u);
  }
}

void sub_10001377C(uint64_t a1)
{
  uint64_t v2 = sub_100031A80();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting action handler on CUCoalescer", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleRefreshTask];
}

void sub_1000137FC(uint64_t a1)
{
}

void sub_1000138FC(id a1)
{
  id v1 = +[MSDDataController sharedInstance];
  [v1 refreshDataForReason:5 completion:&stru_10004D4B8];
}

void sub_100013950(id a1, BOOL a2, NSError *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = sub_100031A80();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000187D8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully refreshed data after HomeMUStatusChanged", v6, 2u);
  }
}

void sub_100013BAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = sub_100031A80();
  __int16 v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully saved public DB info", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1000188A8();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100013CD0(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 1;
  return result;
}

void sub_100013DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013E1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100014048;
  v20[3] = &unk_10004D508;
  v20[4] = &v21;
  [v3 setExpirationHandler:v20];
  if (!*((unsigned char *)v22 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      if (*((unsigned char *)WeakRetained + 16))
      {
        uint64_t v14 = +[MSDPublicDBManager shared];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10001405C;
        v16[3] = &unk_10004D4E0;
        id v17 = v3;
        [v14 syncDataWithCloudKit:v16];

        goto LABEL_13;
      }
      int v15 = sub_100031A80();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "HomeKit not ready, deferring publicDB refresh", buf, 2u);
      }
    }
    [v3 setTaskCompleted];
    goto LABEL_13;
  }
  id v19 = 0;
  unsigned __int8 v4 = [v3 setTaskExpiredWithRetryAfter:&v19 error:300.0];
  id v5 = v19;
  if ((v4 & 1) == 0)
  {
    uint8_t v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100018910((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }

    [v3 setTaskCompleted];
  }
LABEL_13:

  _Block_object_dispose(&v21, 8);
}

void sub_100014020(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014048(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_10001405C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduled background sync finished, error: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_100014484(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100018A38();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138477827;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Services configured on account %{private}@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = [v6 translateCKErrorToMSError];
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
  }
}

void sub_1000147C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100018AA0();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138477827;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Services configured on account in cache %{private}@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = [v6 translateCKErrorToMSError];
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
  }
}

void sub_100014BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100014BC8(id a1, MSSetupBundle *a2)
{
  return [(MSSetupBundle *)a2 homeID];
}

void sub_100014BD0(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100018C2C();
    }

    (*((void (**)(void))a1[7] + 2))();
    [a1[4] releaseTransaction];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    if (WeakRetained)
    {
      id v6 = a1[5];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100014E14;
      v19[3] = &unk_10004D5E8;
      id v23 = a1[7];
      id v20 = a1[4];
      id v21 = a1[5];
      id v22 = a1[6];
      +[MSAuthTokenProvider validateConfigurationResourceForMediaService:v6 networkActivity:0 completion:v19];

      id v7 = v23;
    }
    else
    {
      uint64_t v8 = sub_100031A80();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100018BB4(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      id v16 = (void (**)(id, void, void *))a1[7];
      uint64_t v17 = MSErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"Nil self";
      id v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v18 = +[NSError errorWithDomain:v17 code:1 userInfo:v7];
      v16[2](v16, 0, v18);
    }
  }
}

void sub_100014E14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100018C94();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) releaseTransaction];
  }
  else
  {
    id v5 = +[MSDDataController sharedInstance];
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100014F64;
    v9[3] = &unk_10004D5C0;
    id v10 = v6;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 56);
    [v5 addMediaService:v10 usingSetupBundles:v7 transaction:v8 completion:v9];
  }
}

void sub_100014F64(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100031A80();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100018CFC(a1, (uint64_t)v5, v7);
    }

    [*(id *)(a1 + 40) releaseTransaction];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) serviceID];
      int v11 = 138477827;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully added service %{private}@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [v5 translateCKErrorToMSError];
  (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, a2, v10);
}

void sub_1000154B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100031A80();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100018E24();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) serviceID];
      int v13 = 138477827;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed service %{private}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) serviceID];
    id v10 = [v7 UUIDString];
    [v9 _clearCachedIconImage:v10];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11)
  {
    id v12 = [v5 translateCKErrorToMSError];
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, a2, v12);
  }
}

void sub_1000158E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100018F04();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = [v5 translateCKErrorToMSError];
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, a2, v8);
  }
}

void sub_100015C18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_100031A80();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100018FE4();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 serviceID];
    int v12 = 136315395;
    int v13 = "-[MSDManager getDefaultMediaService:homeUserID:completion:]_block_invoke";
    __int16 v14 = 2113;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Fetched Default Service (%{private}@)", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = [v6 translateCKErrorToMSError];
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v11);
  }
}

void sub_100016114(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000190C4();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = [v5 translateCKErrorToMSError];
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, a2, v8);
  }
}

void sub_1000163DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000191A4();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    uint64_t v9 = [v6 translateCKErrorToMSError];
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);
  }
}

void sub_10001664C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138477827;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error fetching publicDB info for %{private}@", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100016D38(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v7 = [a2 allObjects];
    int v6 = +[NSArray arrayWithArray:v7];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
  }
}

void sub_100017028(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100031A80();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error switching account info, %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    int v6 = [*(id *)(a1 + 32) serviceID];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully switched account info for %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v3 translateCKErrorToMSError];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void sub_100017988(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000179DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000179EC(uint64_t a1)
{
}

void sub_1000179F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100019274();
    }
  }
  id v8 = [v5 mutableCopy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100017FA4(id a1, MSPublicDBInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc((Class)NSUUID);
  id v4 = [(MSPublicDBInfo *)v2 serviceID];

  id v5 = [v3 initWithUUIDString:v4];

  return v5;
}

id sub_100018020(id a1, MSPublicDBInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc((Class)NSUUID);
  id v4 = [(MSPublicDBInfo *)v2 serviceID];

  id v5 = [v3 initWithUUIDString:v4];

  return v5;
}

id sub_10001809C(id a1, NSDictionary *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc((Class)NSUUID);
  id v4 = [(NSDictionary *)v2 objectForKey:MediaServiceIdentifier];

  id v5 = [v3 initWithUUIDString:v4];

  return v5;
}

void sub_100018124(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully deleted remanent services on account", buf, 2u);
    }

    if ([*(id *)(a1 + 32) count])
    {
      id v8 = [*(id *)(a1 + 40) mutableCopy];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000183C0;
      v19[3] = &unk_10004D7C8;
      uint64_t v9 = *(void **)(a1 + 40);
      id v20 = *(id *)(a1 + 48);
      id v21 = v8;
      id v10 = v8;
      [v9 enumerateObjectsUsingBlock:v19];
      uint64_t v11 = +[MSDDefaultsManager sharedManager];
      [v11 setObjectWithCustomClass:v10 forDefault:@"publicDBData"];
    }
    else
    {
      id v16 = sub_100031A80();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "There are no valid MediaService Developer profiles installed on device, clearing defaults", buf, 2u);
      }

      id v10 = +[MSDDefaultsManager sharedManager];
      [v10 clearDeveloperDefaults];
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100018468;
    v18[3] = &unk_10004CAE8;
    uint64_t v17 = *(void **)(a1 + 48);
    void v18[4] = *(void *)(a1 + 56);
    [v17 enumerateObjectsUsingBlock:v18];
  }
  else
  {
    unsigned __int8 v12 = [v5 CKErrorHasErrorCode:11];
    int v13 = sub_100031A80();
    __int16 v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100019388(a1, (uint64_t)v6, v14);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "There are no valid MediaService Developer profiles installed on device, clearing defaults", buf, 2u);
      }

      uint64_t v15 = +[MSDDefaultsManager sharedManager];
      [v15 clearDeveloperDefaults];
    }
  }
}

void sub_1000183C0(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = objc_alloc((Class)NSUUID);
  id v5 = [v7 serviceID];
  id v6 = [v4 initWithUUIDString:v5];
  LODWORD(v3) = [v3 na_safeContainsObject:v6];

  if (v3) {
    [*(id *)(a1 + 40) removeObjectIdenticalTo:v7];
  }
}

void sub_100018468(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUIDString];
  [v2 _clearCachedIconImage:v3];
}

id sub_100018548(uint64_t a1)
{
  [*(id *)(a1 + 32) _markHomeKitInitialized];
  uint64_t v2 = sub_100031A80();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refreshing public DB info in cache after startup", buf, 2u);
  }

  [*(id *)(a1 + 32) _savePublicDBInfoInDefaults];
  id v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Syncing any installed developer profiles", v7, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) syncStatusOfInstalledProfiles];
  id v4 = sub_100031A80();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finishing setup for multi-user", v6, 2u);
  }

  [*(id *)(a1 + 32) _setupMultiUser];
  return [*(id *)(a1 + 32) _initializeCoalescerObject];
}

void sub_100018760(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000187D8()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to refresh data after HomeMUStatusChanged, %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018840()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "We waited for %lu sec for the CKPublicDB to be updated, Unknown error occurred, using values in cache", v2, v3, v4, v5, v6);
}

void sub_1000188A8()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving public DB info %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018910(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001898C()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Error removing cached service icon", v2, v3, v4, v5, v6);
}

void sub_1000189C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018A38()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch services %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018AA0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch services from cache: %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018B08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018B80()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to setup service. No home information provided", v2, v3, v4, v5, v6);
}

void sub_100018BB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018C2C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error fetching authentication tokens %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018C94()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to validate configuration resource: %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018CFC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) serviceID];
  sub_100005280();
  __int16 v7 = 2113;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error adding service %{private}@ to home: %{private}@", v6, 0x16u);
}

void sub_100018DAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018E24()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to remove service from home %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018E8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018F04()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to update default media service %{private}@", v2, v3, v4, v5, v6);
}

void sub_100018F6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018FE4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch default service %{private}@", v2, v3, v4, v5, v6);
}

void sub_10001904C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000190C4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to updated service property %{private}@", v2, v3, v4, v5, v6);
}

void sub_10001912C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000191A4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch service config info %{private}@", v2, v3, v4, v5, v6);
}

void sub_10001920C()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Error: No cached PublicData present on device", v2, v3, v4, v5, v6);
}

void sub_100019240()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Error: Semaphore timed out: Failed to fetch updated publicInfo", v2, v3, v4, v5, v6);
}

void sub_100019274()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error fetching PublicData %@", v2, v3, v4, v5, v6);
}

void sub_1000192DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019354()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "The user and home identifiers is unknown, failed to remove dev profile accounts", v2, v3, v4, v5, v6);
}

void sub_100019388(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2113;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error deleting service %{private}@ from account %{private}@", (uint8_t *)&v4, 0x16u);
}

void sub_100019784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000197D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000197E4(uint64_t a1)
{
}

void sub_1000197EC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      uint64_t v9 = sub_100031A80();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001A1C0((uint64_t)WeakRetained, (uint64_t)v7, v9);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    os_unfair_lock_unlock(WeakRetained + 2);
  }
}

void sub_100019CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_100019D34(id a1)
{
  qword_100056788 = [[MSDExpireCache alloc] initWithExpiration:60.0];

  _objc_release_x1();
}

void sub_100019D7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001A2C8((uint64_t)v6, v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [WeakRetained _accountHasLocalPlayableContent:*(void *)(a1 + 32)];

    uint64_t v9 = sub_100031A80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        CFStringRef v10 = @"has";
      }
      else {
        CFStringRef v10 = @"does not have";
      }
      int v21 = 138412290;
      CFStringRef v22 = v10;
      uint64_t v11 = "The account %@ localPlaybackContent";
      unsigned __int8 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v15 = [v5 subscriptionStatus];
    int v16 = [v15 capabilities] & 1;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v16;
    uint64_t v9 = sub_100031A80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v21 = 67109120;
      LODWORD(v22) = v16;
      uint64_t v11 = "Fetched Subscription Status %d";
      unsigned __int8 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v21, v14);
    }
  }

  uint64_t v17 = MSDSignpostFacility();
  id v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 64);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    NSStringFromBOOL();
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v21 = 138543362;
    CFStringRef v22 = v20;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v19, "CheckSubscriptionStatus", "LookupFinishedWithStatus=%{signpost.description:attribute,public}@", (uint8_t *)&v21, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001A138(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Nil homeUserIdentifier provided", v1, 2u);
}

void sub_10001A17C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Nil homeIdentifier provided", v1, 2u);
}

void sub_10001A1C0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error fetching iTunes account for HomeIdentifier %@, %@", (uint8_t *)&v4, 0x16u);
}

void sub_10001A24C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch iTunes Account associated with user %{private}@", (uint8_t *)&v3, 0xCu);
}

void sub_10001A2C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to determine SubscriptionStatus %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001AD2C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v19 = a1;
    __int16 v6 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned __int8 v12 = [v11 service];
          id v13 = [v12 copy];

          uint32_t v14 = [v13 serviceID];
          uint64_t v15 = [v14 UUIDString];
          int v16 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v15];

          uint64_t v17 = [v11 homeID];
          id v18 = [v11 homeUserID];
          [v13 populateMediaService:v16 homeID:v17 homeUserID:v18];

          [v6 addObject:v13];
        }
        id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(v19 + 32) + 16))();
  }
}

uint64_t sub_10001B2A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  unsigned int v5 = [v4 isEqualToString:MSServiceAccountRecordType];

  if (v5
    && ([v3 homeUserID],
        __int16 v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)],
        v6,
        v7))
  {
    if (*(void *)(a1 + 40))
    {
      id v8 = [v3 service];
      uint64_t v9 = [v8 serviceID];
      CFStringRef v10 = [v9 UUIDString];
      uint64_t v11 = [*(id *)(a1 + 40) serviceID];
      uint64_t v12 = (uint64_t)[v10 isEqualToString:v11];
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_10001B3A0(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"Failed to remove services, NIL identifiers passed";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void sub_10001B664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B690(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) != 0)
  {
    id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 48));
    unsigned int v7 = WeakRetained;
    if (WeakRetained)
    {
      if (WeakRetained[2] == 0.0)
      {
        [WeakRetained _performDataRefresh:*(void *)(a1 + 40)];
        goto LABEL_18;
      }
      [WeakRetained refreshDataAfterDelay];
      uint64_t v8 = *(void *)(a1 + 40);
      if (!v8)
      {
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v9 = *(void (**)(void))(v8 + 16);
    }
    else
    {
      uint64_t v12 = sub_100031A80();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100020240(v12, v13, v14, v15, v16, v17, v18, v19);
      }

      uint64_t v20 = *(void *)(a1 + 40);
      if (!v20) {
        goto LABEL_18;
      }
      uint64_t v9 = *(void (**)(void))(v20 + 16);
    }
    v9();
    goto LABEL_18;
  }
  CFStringRef v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CloudKit is not available...returning...", v21, 2u);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v5);
  }
  [(id)objc_opt_class() clearLastRefreshTSForHomes];
LABEL_19:
}

BOOL sub_10001BB0C(id a1, HMHome *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = a2;
  if (([(HMHome *)v4 hasAccessoryTypeHomePod] & 1) != 0
    || ([(HMHome *)v4 isMultiUserEnabled] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    __int16 v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138477827;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{private}@ HomeMUEnabled = NO AND User does not have any HomePods in configured.", (uint8_t *)&v8, 0xCu);
    }

    BOOL v5 = 0;
  }

  return v5;
}

void sub_10001BBDC(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001BD0C;
    v8[3] = &unk_10004D930;
    void v8[4] = v3;
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v3 _deleteZombieRecordZonesIfAnyInHomes:v4 completion:v8];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      __int16 v6 = +[NSError errorWithDomain:MSCloudKitErrorDomain code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
    unsigned int v7 = objc_opt_class();
    [v7 clearLastRefreshTSForHomes];
  }
}

void sub_10001BD0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3 || ([v3 CKErrorHasErrorCode:11] & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000202B8();
  }

  if ([v4 isErrorFatal])
  {
    __int16 v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      uint64_t v17 = "-[MSDDataRefresh _performDataRefresh:]_block_invoke";
      __int16 v18 = 2113;
      uint64_t v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Fatal error %{private}@", buf, 0x16u);
    }

    [(id)objc_opt_class() clearLastRefreshTSForHomes];
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v4);
    }
  }
  else
  {
LABEL_10:
    int v8 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001BEE0;
    v11[3] = &unk_10004D908;
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    id v15 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    [v8 _refreshDatabases:v11];
  }
}

void sub_10001BEE0(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isErrorFatal])
  {
    uint64_t v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      int v9 = 136315395;
      uint64_t v10 = "-[MSDDataRefresh _performDataRefresh:]_block_invoke";
      __int16 v11 = 2113;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Fatal error %{private}@", (uint8_t *)&v9, 0x16u);
    }

    [(id)objc_opt_class() clearLastRefreshTSForHomes];
    uint64_t v6 = a1[7];
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
LABEL_10:
      v7();
    }
  }
  else
  {
    if (!v3) {
      [(id)objc_opt_class() cacheLastRefreshforHomes:a1[6]];
    }
    uint64_t v8 = a1[7];
    if (v8)
    {
      uint64_t v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_10;
    }
  }
}

void sub_10001C350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_10001C384(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 isErrorFatal];
    uint64_t v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100020320();
    }
  }
  else
  {
    uint64_t v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138477827;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully Validated Service Configuration Info %{private}@", (uint8_t *)&v7, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10001C490(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0);
  }
  return result;
}

id sub_10001C6B8(id a1, HMHome *a2)
{
  CFStringRef v2 = [(HMHome *)a2 currentUser];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

void sub_10001C708(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v29 = v5;
  id v30 = v6;
  if (v5 && !v6)
  {
    group = dispatch_group_create();
    *(void *)&long long v53 = 0;
    *((void *)&v53 + 1) = &v53;
    uint64_t v54 = 0x3032000000;
    long long v55 = sub_10001CC80;
    __int16 v56 = sub_10001CC90;
    id v57 = 0;
    int v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      uint64_t v50 = "-[MSDDataRefresh _deleteZombieRecordZonesIfAnyInHomes:completion:]_block_invoke";
      __int16 v51 = 2112;
      uint64_t v52 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s User is part of homes %@", buf, 0x16u);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v9 = [v5 allValues];
    id v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v42;
      uint64_t v31 = MSPlaceholderRecordName;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v14 = [v13 zoneID];
          id v15 = [v14 zoneName];
          unsigned __int8 v16 = [v15 isEqualToString:CKRecordZoneDefaultName];

          if ((v16 & 1) == 0)
          {
            dispatch_group_enter(group);
            id v17 = objc_alloc((Class)CKRecordID);
            __int16 v18 = [v13 zoneID];
            id v19 = [v17 initWithRecordName:v31 zoneID:v18];

            uint64_t v20 = *(void **)(a1 + 32);
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_10001CC98;
            v36[3] = &unk_10004DA38;
            uint64_t v21 = *(void *)(a1 + 56);
            v36[4] = v13;
            v36[5] = v21;
            id v40 = &v53;
            uint64_t v37 = group;
            id v38 = *(id *)(a1 + 48);
            id v22 = v19;
            id v39 = v22;
            [v20 fetchRecordWithID:v22 completionHandler:v36];
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v10);
    }

    long long v23 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D128;
    block[3] = &unk_10004D980;
    id v34 = *(id *)(a1 + 64);
    uint64_t v35 = &v53;
    dispatch_group_notify(group, v23, block);

    _Block_object_dispose(&v53, 8);
LABEL_24:

    goto LABEL_25;
  }
  long long v24 = sub_100031A80();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_1000203C0();
  }

  uint64_t v25 = *(void *)(a1 + 64);
  if (v25) {
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v30);
  }
  if ([v30 CKErrorHasErrorCode:112] && CKErrorIsCode())
  {
    uint64_t v26 = [v30 userInfo];
    group = [v26 objectForKey:CKPartialErrorsByItemIDKey];

    id v27 = [group allKeys];
    id v28 = sub_100031A80();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v53) = 138412290;
      *(void *)((char *)&v53 + 4) = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Zones with ManateeIdentity Lost %@", (uint8_t *)&v53, 0xCu);
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10001CC70;
    v45[3] = &unk_10004CED0;
    id v46 = *(id *)(a1 + 32);
    id v47 = *(id *)(a1 + 40);
    [v27 enumerateObjectsUsingBlock:v45];

    goto LABEL_24;
  }
LABEL_25:
}

void sub_10001CC40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_10001CC70(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCKErrorMissingManateeIdentity:a2 homeUserIDS:*(void *)(a1 + 40)];
}

uint64_t sub_10001CC80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001CC90(uint64_t a1)
{
}

void sub_10001CC98(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v6 && !v7)
  {
    id v9 = objc_alloc((Class)NSUUID);
    id v10 = [v6 recordFieldForKey:MSHomeParticipantHomeIdentifier];
    id v11 = [v9 initWithUUIDString:v10];

    if (v11
      && (uint64_t v12 = *(void **)(a1 + 56),
          v26[0] = _NSConcreteStackBlock,
          v26[1] = 3221225472,
          v26[2] = sub_10001D080,
          v26[3] = &unk_10004DA10,
          id v3 = &v27,
          id v27 = v11,
          (objc_msgSend(v12, "ms_anyPassingTest:", v26) & 1) != 0))
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    }
    else
    {
      id v19 = sub_100031A80();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [*(id *)(a1 + 64) recordName];
        *(_DWORD *)buf = 138477827;
        id v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Detected Zombie recordZone %{private}@", buf, 0xCu);
      }
      uint64_t v21 = *(void **)(a1 + 40);
      id v22 = [*(id *)(a1 + 32) zoneID];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10001D0C4;
      v23[3] = &unk_10004D9E8;
      uint64_t v25 = *(void *)(a1 + 72);
      id v24 = *(id *)(a1 + 48);
      [v21 _deleteRecordZone:v22 completion:v23];

      if (!v11) {
        goto LABEL_17;
      }
    }

LABEL_17:
    goto LABEL_18;
  }
  unsigned int v13 = [v7 CKErrorHasErrorCode:11];
  id v14 = sub_100031A80();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = [*(id *)(a1 + 32) zoneID];
      *(_DWORD *)buf = 138477827;
      id v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Possibly a zombie recordZone, deleting %{private}@", buf, 0xCu);
    }
    id v17 = *(void **)(a1 + 40);
    __int16 v18 = [*(id *)(a1 + 32) zoneID];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001D01C;
    v28[3] = &unk_10004D9E8;
    uint64_t v30 = *(void *)(a1 + 72);
    id v29 = *(id *)(a1 + 48);
    [v17 _deleteRecordZone:v18 completion:v28];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100020428();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
LABEL_18:
}

void sub_10001D01C(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_10001D080(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_10001D0C4(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10001D128(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void sub_10001D23C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100031A80();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100020490(a1, (uint64_t)v5, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138477827;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully Zombie deleted recordZone %{private}@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

void sub_10001D528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10001D54C(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if ([v4 isErrorFatal])
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100020538();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001D5E8(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    id v5 = +[CKContainer MSDCloudKitContainer];
    id v6 = [v5 sharedCloudDatabase];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_10001D79C;
    v14[3] = &unk_10004DAB0;
    int8x16_t v16 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    uint64_t v15 = v4;
    id v7 = v4;
    [v6 refreshDatabase:0 completion:v14];

    uint64_t v8 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D84C;
    block[3] = &unk_10004D980;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = v9;
    uint64_t v13 = v10;
    dispatch_group_notify(v7, v8, block);
  }
}

void sub_10001D79C(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if ([v4 isErrorFatal])
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000205B0();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10001D84C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

id sub_10001D9D4(id a1, HMHome *a2)
{
  uint64_t v2 = [(HMHome *)a2 uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

void sub_10001DB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10001DBB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001DC40;
    v3[3] = &unk_10004DB20;
    v3[4] = WeakRetained;
    [WeakRetained _performDataRefresh:v3];
  }
}

void sub_10001DC40(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100031A80();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002066C(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = MSDDataRefreshReasonToString(*(void *)(*(void *)(a1 + 32) + 8));
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated data after %@", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10001DEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001DF14(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = kAppleMusicApplicationIdentifier;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001E080;
    v10[3] = &unk_10004DB48;
    id v13 = a1[5];
    objc_copyWeak(&v14, a1 + 6);
    id v11 = v5;
    id v12 = a1[4];
    +[MSDPublicDBManager getPublicInfoForServiceName:v7 completion:v10];

    objc_destroyWeak(&v14);
  }
  else
  {
    int v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100020718();
    }

    id v9 = (void (**)(id, id))a1[5];
    if (v9) {
      v9[2](v9, v6);
    }
  }
}

void sub_10001E06C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001E080(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _checkDataSanity:*(void *)(a1 + 32) publicDBInfo:v3 home:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_7:

    goto LABEL_8;
  }
  id v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100020780(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    id WeakRetained = +[NSError errorWithDomain:MSErrorDomain code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, WeakRetained);
    goto LABEL_7;
  }
LABEL_8:
}

void sub_10001E42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001E458(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6
    || (id v7 = objc_loadWeakRetained((id *)(a1 + 80)),
        unsigned __int8 v8 = [v7 _shouldProceedWithExecution:v6],
        v7,
        (v8 & 1) != 0))
  {
    uint64_t v9 = [v5 objectForKey:*(void *)(a1 + 32)];
    uint64_t v10 = [v5 objectForKey:*(void *)(a1 + 40)];
    uint64_t v11 = MediaServiceIdentifier;
    uint64_t v12 = [v9 recordFieldForKey:MediaServiceIdentifier];
    uint64_t v13 = [v10 recordFieldForKey:v11];
    id v14 = (void *)v13;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (v12)
      {
        if (v13)
        {
LABEL_22:

          goto LABEL_23;
        }
        int8x16_t v16 = sub_100031A80();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "User missing default service record, defaulting to Apple Music", buf, 2u);
        }

        id v17 = (id *)(a1 + 80);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
        uint64_t v20 = *(void *)(a1 + 48);
        id v19 = (id *)(a1 + 48);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10001E7D8;
        v28[3] = &unk_10004DB98;
        id v31 = v19[3];
        objc_copyWeak(&v32, v17);
        id v29 = v9;
        id v30 = *v19;
        [WeakRetained _updateDefaultService:v20 record:v29 completion:v28];

        objc_destroyWeak(&v32);
        id v21 = v31;
      }
      else
      {
        uint64_t v26 = sub_100031A80();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "User missing Apple Music record, creating a new one", buf, 2u);
        }

        id v21 = objc_loadWeakRetained((id *)(a1 + 80));
        id v27 = [*(id *)(a1 + 56) zoneID];
        [v21 _createAndSaveAppleMusicRecord:v27 publicDBInfo:*(void *)(a1 + 64) home:*(void *)(a1 + 48) completion:*(void *)(a1 + 72)];
      }
    }
    else
    {
      id v22 = sub_100031A80();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v10 recordFieldForKey:MSHomeParticipantHomeUserIdentifier];
        *(_DWORD *)buf = 138477827;
        id v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "User's (%{private}@) Apple Music and Default Service are configured correctly", buf, 0xCu);
      }
      id v21 = objc_loadWeakRetained((id *)(a1 + 80));
      [v21 _shareThisRecordIfApplicable:v9 home:*(void *)(a1 + 48) completion:*(void *)(a1 + 72)];
    }

    goto LABEL_22;
  }
  uint64_t v25 = *(void *)(a1 + 72);
  if (v25) {
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v6);
  }
LABEL_23:
}

void sub_10001E7BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E7D8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _shareThisRecordIfApplicable:*(void *)(a1 + 32) home:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }

  return _objc_release_x1();
}

void sub_10001EBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001EC20(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  unsigned __int8 v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000208DC();
    }

    uint64_t v11 = (void (**)(id, id))a1[5];
    if (v11) {
      v11[2](v11, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Now updating default Service to AppleMusic..", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001EDE0;
    v12[3] = &unk_10004DB98;
    id v10 = a1[4];
    id v15 = a1[5];
    objc_copyWeak(&v16, a1 + 6);
    id v13 = v5;
    id v14 = a1[4];
    [WeakRetained _updateDefaultService:v10 record:v13 completion:v12];

    objc_destroyWeak(&v16);
  }
}

void sub_10001EDCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001EDE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138477827;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error creating default service for user %{private}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _shareThisRecordIfApplicable:*(void *)(a1 + 32) home:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void sub_10001F108(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  int v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) currentUser];
      id v10 = [v9 uniqueIdentifier];
      int v12 = 138477827;
      id v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully shared data with owner for participant %{private}@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000209BC();
  }

  if ([v6 isErrorFatal])
  {
    int v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100020944();
    }
LABEL_9:
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
  }
}

void sub_10001F4DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  int v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100020A24();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully updated default service", v10, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v5 != 0, v6);
  }
}

void sub_10001F744(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100020A8C();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully saved AppleMusic record", v10, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

void sub_10001F910(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = objc_alloc((Class)NSString);
    uint64_t v9 = [v5 clientInfo];
    id v10 = [v9 accountAuthToken];
    id v11 = [v8 initWithData:v10 encoding:4];

    if (v11) {
      goto LABEL_11;
    }
    int v12 = sub_100031A80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100020AF4(v12);
    }
  }
  else if (v6)
  {
    id v13 = sub_100031A80();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138477827;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received Nil HMHomeCloudShareResponse, error %{private}@", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(a1 + 32) _handleCKShareError:v7 home:*(void *)(a1 + 40)];
  }
  id v11 = 0;
LABEL_11:
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v11, v7);
  }
}

id sub_10001FC1C(id a1, HMHome *a2)
{
  uint64_t v2 = [(HMHome *)a2 uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

void sub_10001FFEC(id a1, id a2)
{
  uint64_t v2 = (void (**)(id, uint64_t))a2;
  id v3 = [[MSDDataRefresh alloc] initWithReason:8];
  [(MSDDataRefresh *)v3 performRefreshWithCompletion:&stru_10004DCE0];
  v2[2](v2, 1);
}

void sub_10002006C(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_100031A80();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100020B38();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully synched data with CloudKit", v9, 2u);
    }

    id v6 = +[MSDDefaultsManager sharedManager];
    id v7 = [v6 dictionaryRepresentation];
    id v5 = [v7 allKeys];

    id v8 = [v5 ms_objectsPassingTest:&stru_10004DD20];
    [v8 enumerateObjectsUsingBlock:&stru_10004DD60];
  }
}

BOOL sub_100020168(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  return [(NSString *)a2 rangeOfString:@"CKShareErrorRetryCount", a4] != (id)0x7FFFFFFFFFFFFFFFLL;
}

void sub_100020198(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = +[MSDDefaultsManager sharedManager];
  [v5 setObject:&off_10004F970 forDefault:v4];
}

void sub_100020228(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100020240(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000202B8()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Encountered error when deleting recordZones %{private}@", v2, v3, v4, v5, v6);
}

void sub_100020320()
{
  sub_100005280();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_100020228((void *)&_mh_execute_header, v1, (uint64_t)v1, "Error creating service config block %{private}@, Error is Fatal %@", v2);
}

void sub_1000203C0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch all recordZones, %@", v2, v3, v4, v5, v6);
}

void sub_100020428()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch recordID %{private}@", v2, v3, v4, v5, v6);
}

void sub_100020490(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) zoneName];
  sub_100005280();
  __int16 v8 = 2113;
  uint64_t v9 = a2;
  sub_100020228((void *)&_mh_execute_header, a3, v6, "Failed to Zombie delete record zoneID %{private}@, error %{private}@", v7);
}

void sub_100020538()
{
  v2[0] = 136315395;
  sub_100020214();
  sub_100020228((void *)&_mh_execute_header, v0, v1, "%s Fatal error ... %{private}@", (uint8_t *)v2);
}

void sub_1000205B0()
{
  v2[0] = 136315395;
  sub_100020214();
  sub_100020228((void *)&_mh_execute_header, v0, v1, "%s Fatal error ... %{private}@", (uint8_t *)v2);
}

void sub_100020628(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received fatal error, clearing values....", v1, 2u);
}

void sub_10002066C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = MSDDataRefreshReasonToString(*(void *)(*(void *)(a1 + 32) + 8));
  sub_100005280();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  sub_100020228((void *)&_mh_execute_header, a3, v6, "Error refreshing data after %@, %@", v7);
}

void sub_100020718()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch record zone %{private}@", v2, v3, v4, v5, v6);
}

void sub_100020780(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000207FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020874()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch record, %{private}@", v2, v3, v4, v5, v6);
}

void sub_1000208DC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving config information into CloudKit record, %{private}@", v2, v3, v4, v5, v6);
}

void sub_100020944()
{
  v2[0] = 136315395;
  sub_100020214();
  sub_100020228((void *)&_mh_execute_header, v0, v1, "%s Fatal error ...%{private}@ ", (uint8_t *)v2);
}

void sub_1000209BC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error creating share for record %{private}@", v2, v3, v4, v5, v6);
}

void sub_100020A24()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving default record %{private}@", v2, v3, v4, v5, v6);
}

void sub_100020A8C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to save Apple music record %{private}@", v2, v3, v4, v5, v6);
}

void sub_100020AF4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Generated Nil token from accountAuthToken", v1, 2u);
}

void sub_100020B38()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Encountered error when trying to sync data %{private}@", v2, v3, v4, v5, v6);
}

uint64_t sub_100020E00(uint64_t a1)
{
  qword_100056798 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100020FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_100020FCC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = sub_100031A80();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 || (a2 & 1) == 0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      double v24 = *(double *)&v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to add subscription to database %@", buf, 0xCu);
    }

    if ([v5 CKErrorHasErrorCode:15])
    {
      uint64_t v9 = sub_100031A80();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000224D0();
      }

      WeakRetained[1] = 3;
    }
    else if (([v5 CKErrorHasErrorCode:6] & 1) != 0 {
           || [v5 CKErrorHasErrorCode:7])
    }
    {
      id v10 = [v5 userInfo];
      id v11 = [v10 objectForKey:CKErrorRetryAfterKey];
      [v11 doubleValue];
      double v13 = v12;

      uint64_t v14 = sub_100031A80();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CloudKit asked us to re-try after %f", buf, 0xCu);
      }

      unint64_t v15 = WeakRetained[1] + 1;
      WeakRetained[1] = v15;
      if (v15 <= 2)
      {
        double v16 = v13 + 1.0;
        uint64_t v17 = sub_100031A80();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Retrying...add subscription to database", buf, 2u);
        }

        dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
        id v19 = dispatch_get_global_queue(0, 0);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000212F8;
        v20[3] = &unk_10004DD88;
        objc_copyWeak(&v21, (id *)(a1 + 32));
        objc_copyWeak(&v22, (id *)(a1 + 40));
        dispatch_after(v18, v19, v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&v21);
      }
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully added database subscription", buf, 2u);
    }
  }
}

void sub_1000212F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addSubscriptionForDatabase:v2];
}

void sub_10002148C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    BOOL v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  if (![v5 accountStatus])
  {
    BOOL v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  if ([v5 accountStatus] == (id)1 && objc_msgSend(v5, "supportsDeviceToDeviceEncryption"))
  {
    BOOL v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_12:
    v8();
    goto LABEL_13;
  }
  uint64_t v9 = sub_100031A80();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v5 accountStatus];
    id v10 = CKStringFromAccountStatus();
    int v13 = 138412290;
    uint64_t v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Current account state %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = +[NSError errorWithDomain:CKErrorDomain code:6 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

LABEL_13:
}

void sub_1000218BC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = sub_100031A80();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100022624();
    }
  }
}

void sub_100021914(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = sub_100031A80();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002268C();
    }
  }
}

void sub_100021A30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100021A54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = sub_100031A80();
    id v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002275C();
      }

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100021D90;
      v30[3] = &unk_10004CAC0;
      void v30[4] = WeakRetained;
      uint64_t v11 = (void ***)v30;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = [v5 supportsDeviceToDeviceEncryption];
        [v5 accountStatus];
        uint64_t v14 = CKStringFromAccountStatus();
        *(_DWORD *)buf = 138412802;
        id v32 = v5;
        __int16 v33 = 1024;
        unsigned int v34 = v13;
        __int16 v35 = 2112;
        uint64_t v36 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetched accountInfo %@ : Status of encryption: %d AccountStatus: %@", buf, 0x1Cu);
      }
      id v15 = [v5 accountStatus];
      if (v15 == (id)3)
      {
        [WeakRetained _handleAccountStatusUnsupported];
      }
      else if (v15 == (id)1)
      {
        if ([v5 supportsDeviceToDeviceEncryption])
        {
          double v16 = WeakRetained[4];
          block = _NSConcreteStackBlock;
          uint64_t v25 = 3221225472;
          uint64_t v26 = sub_100021D9C;
          id v27 = &unk_10004DE40;
          objc_copyWeak(&v29, v7);
          id v28 = v5;
          dispatch_async(v16, &block);

          objc_destroyWeak(&v29);
        }
        else
        {
          uint64_t v17 = sub_100031A80();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_100022728();
          }

          dispatch_time_t v18 = +[MSDDefaultsManager sharedManager];
          [v18 setObject:&__kCFBooleanFalse forDefault:@"CKAccountSupportsManatee"];

          [WeakRetained setAccountInfo:0];
        }
      }
      id v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      id v21 = sub_100021DEC;
      id v22 = &unk_10004CAC0;
      long long v23 = WeakRetained;
      uint64_t v11 = &v19;
    }
    [WeakRetained _withAccountCheckLock:v11 v19 v20 v21 v22 v23 block v25 v26 v27];
  }
  else
  {
    double v12 = sub_100031A80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000226F4();
    }
  }
}

uint64_t sub_100021D90(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

void sub_100021D9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDeviceSupportsEncryption:*(void *)(a1 + 32)];
}

uint64_t sub_100021DEC(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

void sub_10002200C(id a1, BOOL a2, NSError *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = sub_100031A80();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000227F8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully refreshed data after CKAccountInfo changed", v6, 2u);
  }
}

void sub_1000221EC(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = 0;
    BOOL v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100022304;
    v6[3] = &unk_10004DEB0;
    v6[4] = WeakRetained;
    v6[5] = &v7;
    [WeakRetained _withAccountCheckLock:v6];
    if (*((unsigned char *)v8 + 24))
    {
      id v4 = objc_loadWeakRetained(v1);
      [v4 _checkAccountStatus];
    }
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000226F4();
    }
  }
}

void sub_1000222EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022304(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void sub_1000223F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100022410(void *a1)
{
  [a1 databaseScope];
  uint64_t v1 = CKDatabaseScopeString();
  sub_100005280();
  sub_1000223F0((void *)&_mh_execute_header, v2, v3, "Error adding subscription, unsupported database %@", v4, v5, v6, v7, v8);
}

void sub_10002249C()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Unsupported database scope, failed to add subscription", v2, v3, v4, v5, v6);
}

void sub_1000224D0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Received CKError: CKErrorServerRejectedRequest %@", v2, v3, v4, v5, v6);
}

void sub_100022538(void *a1)
{
  uint64_t v1 = [a1 userInfo];
  sub_100005280();
  sub_1000223F0((void *)&_mh_execute_header, v2, v3, "Failed to create CkNotification from APSIncomingMessage %@", v4, v5, v6, v7, v8);
}

void sub_1000225BC()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "CKNotification not of type databaseNotification", v2, v3, v4, v5, v6);
}

void sub_1000225F0()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "** Error! Data in publicDatabase changed! **", v2, v3, v4, v5, v6);
}

void sub_100022624()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error synching contents on PrivateDB %{private}@", v2, v3, v4, v5, v6);
}

void sub_10002268C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error synching contents on SharedDB %{private}@", v2, v3, v4, v5, v6);
}

void sub_1000226F4()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to check CloudKit account status; missing self",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100022728()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "*** Device does not support Encryption ***", v2, v3, v4, v5, v6);
}

void sub_10002275C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetchAccountInfo %@", v2, v3, v4, v5, v6);
}

void sub_1000227C4()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "User does not have valid credentials on account, skipping", v2, v3, v4, v5, v6);
}

void sub_1000227F8()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to refresh data after CKAccountInfo changed %@", v2, v3, v4, v5, v6);
}

uint64_t sub_1000229D4(uint64_t a1)
{
  qword_1000567A8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100022B34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)WeakRetained[1];
    if (v4)
    {
      [v4 shutdown];
      uint64_t v5 = (void *)v3[1];
      v3[1] = 0;
    }
    uint8_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [*(id *)(a1 + 40) _determinePushEnvironment];
    }
    uint64_t v9 = v7;
    id v10 = objc_alloc_init((Class)NSMutableArray);
    [v10 addObject:kAPSTopic];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v11 = [*(id *)(a1 + 40) consumers];
    id v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v16 shouldEnablePushTopic])
          {
            uint64_t v17 = [v16 pushTopic];
            [v10 addObject:v17];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v13);
    }

    dispatch_time_t v18 = sub_100031A80();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Starting APS connection env - %@, topics %@", buf, 0x16u);
    }

    id v19 = objc_alloc((Class)APSConnection);
    id v20 = [v19 initWithEnvironmentName:v9 namedDelegatePort:kAPSDelegatePort queue:v3[3]];
    [v20 _setEnabledTopics:v10];
    [v20 setDelegate:*(void *)(a1 + 40)];
    id v21 = sub_100031A80();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = [v20 isConnected];
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "ApplePushService Connection Status %d", buf, 8u);
    }

    long long v23 = (void *)v3[1];
    v3[1] = v20;
    id v24 = v20;

    uint64_t v25 = (void *)v3[2];
    v3[2] = v9;
    uint8_t v8 = v9;
  }
  else
  {
    uint8_t v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100023324(v8);
    }
  }
}

void sub_100023324(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDPushService _statConnectionWithEnvironment:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Nil StrongSelf", (uint8_t *)&v1, 0xCu);
}

void sub_1000233A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching server preferred push env, %@", (uint8_t *)&v2, 0xCu);
}

void sub_100023674(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create os_transaction, Nil transactionID passed", v1, 2u);
}

void sub_1000242FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000245A0((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100024368(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000243E0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get publicInfo after re-try", v1, 2u);
}

void sub_100024424(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 recordType];
  int v4 = 138477827;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized record type %{private}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000244BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000245A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000246AC()
{
  id v5 = (id)objc_opt_new();
  [v5 setUseZoneWidePCS:1];
  id v0 = objc_alloc((Class)CKContainerID);
  int v1 = [(id)objc_opt_class() MSDCloudKitContainerID];
  id v2 = [v0 initWithContainerIdentifier:v1 environment:1];

  id v3 = [objc_alloc((Class)CKContainer) initWithContainerID:v2 options:v5];
  int v4 = (void *)qword_1000567B8;
  qword_1000567B8 = (uint64_t)v3;
}

void sub_100024818()
{
  id v0 = objc_alloc((Class)CKContainerID);
  int v1 = [(id)objc_opt_class() MSDPublicCloudKitContainerID];
  id v4 = [v0 initWithContainerIdentifier:v1 environment:1];

  id v2 = [objc_alloc((Class)CKContainer) initWithContainerID:v4];
  id v3 = (void *)qword_1000567C8;
  qword_1000567C8 = (uint64_t)v2;
}

void sub_100024AF4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100024FDC((uint64_t)v9, v10);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v8, v9);
  }
}

void sub_100024E88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100025098((uint64_t)v9, v10);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v8, v9);
  }
}

void sub_100024F30(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138477827;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "fetchShareMetadataCompletionBlock, any errors %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100024FDC(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error accepting shares %{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_100025054(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Nil share URL", v1, 2u);
}

void sub_100025098(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching share meta data %{private}@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1000251B0()
{
  qword_1000567D8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_1000253AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100025480(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100028614();
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 48) _getMatchingObjectForServiceName:v5 serviceName:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void sub_1000255F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100028614();
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 48) _getMatchingObjectForServiceID:v5 serviceID:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void sub_100025768(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100028614();
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 48) _getMatchingObjectForBundleID:v5 bundleID:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void sub_100026578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose((const void *)(v50 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_10002662C(uint64_t a1)
{
  int v2 = *(unsigned char **)(a1 + 32);
  if (v2[24])
  {
    if (*(void *)(a1 + 40))
    {
      id v4 = [v2 queuedPendingRequests];
      id v3 = objc_retainBlock(*(id *)(a1 + 40));
      [v4 addObject:v3];
    }
  }
  else
  {
    v2[24] = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t sub_1000266C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000266D8(uint64_t a1)
{
}

void sub_1000266E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100031A80();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138477827;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Public] Deleted RecordID %{private}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) na_safeAddObject:v3];
}

void sub_1000267AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = sub_100031A80();
  uint64_t v11 = v10;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100028778();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138477827;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Public] Adding record - %{private}@", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) na_safeAddObject:v8];
  }
}

void sub_1000268D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    int v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished sync with public db", buf, 2u);
    }

    id v6 = *(void **)(a1 + 32);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    void v34[2] = sub_100026DF4;
    v34[3] = &unk_10004E030;
    uint64_t v7 = *(void *)(a1 + 48);
    v34[5] = v6;
    v34[6] = v7;
    v34[4] = WeakRetained;
    [v6 _withLock:v34];
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v8) {
      id v8 = v3;
    }
    id v9 = v8;
    if (!v9)
    {
      uint64_t v11 = sub_100031A80();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Public] Returning information stored in defaults", buf, 2u);
      }

      WeakRetained[4] = 0;
      int v12 = +[MSDDefaultsManager sharedManager];
      id v13 = [v12 objectForDefaultWithCustomClass:@"publicDBData"];

      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v13, 0);
      }
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      double v16 = WeakRetained;
      uint64_t v17 = v13;
      id v18 = 0;
      goto LABEL_24;
    }
    if (CKErrorIsCode())
    {
      uint64_t v10 = sub_100031A80();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Public] Change token expired clearing cached data and fetching data again", buf, 2u);
      }

      [WeakRetained _clearAllDefaultsData];
      [WeakRetained syncDataWithCloudKit:&stru_10004E070];
      goto LABEL_21;
    }
    if ((CKErrorIsCode() & 1) != 0 || CKErrorIsCode())
    {
      id v19 = sub_100031A80();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        double v36 = *(double *)&v9;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Public] Received cloud zone deletion error: %{private}@", buf, 0xCu);
      }

      [WeakRetained _clearAllDefaultsData];
      goto LABEL_21;
    }
    if ((CKErrorIsCode() & 1) != 0 || CKErrorIsCode())
    {
      unsigned int v22 = [v9 userInfo];
      long long v23 = [v22 objectForKey:CKErrorRetryAfterKey];
      [v23 doubleValue];
      double v25 = v24;

      long long v26 = sub_100031A80();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received rate limited error by the server, re-trying after %f", buf, 0xCu);
      }

      if (WeakRetained[4] < 2uLL)
      {
        dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0));
        long long v28 = dispatch_get_global_queue(0, 0);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100026ED0;
        v33[3] = &unk_10004CAC0;
        v33[4] = WeakRetained;
        dispatch_after(v27, v28, v33);

LABEL_21:
        id v20 = +[MSDDefaultsManager sharedManager];
        id v13 = [v20 objectForDefaultWithCustomClass:@"publicDBData"];

        uint64_t v21 = *(void *)(a1 + 40);
        if (v21) {
          (*(void (**)(uint64_t, void *, id))(v21 + 16))(v21, v13, v9);
        }
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        double v16 = WeakRetained;
        uint64_t v17 = v13;
        id v18 = v9;
LABEL_24:
        [v16 executePendingRequests:v15 forPublicDBInfo:v17 error:v18];

        goto LABEL_25;
      }
      long long v29 = sub_100031A80();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v30 = "Retry failed, skipping publicDb Update";
        id v31 = v29;
        uint32_t v32 = 2;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      }
    }
    else
    {
      long long v29 = sub_100031A80();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        double v36 = *(double *)&v9;
        id v30 = "[Public] Some other error occurred %{private}@";
        id v31 = v29;
        uint32_t v32 = 12;
        goto LABEL_36;
      }
    }

    goto LABEL_21;
  }
LABEL_25:
}

void sub_100026DF4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  int v2 = [*(id *)(a1 + 40) queuedPendingRequests];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 40) queuedPendingRequests];
  [v6 removeAllObjects];
}

void sub_100026E78(id a1, NSArray *a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000287EC();
    }
  }
}

id sub_100026ED0(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 32);
  int v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026F50;
  v3[3] = &unk_10004D4E0;
  v3[4] = v1;
  return [v1 syncDataWithCloudKit:v3];
}

void sub_100026F50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  if (v4)
  {
    int v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100028854();
    }
  }
}

void sub_100026FB4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  int v12 = sub_100031A80();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v9 zoneName];
    *(_DWORD *)buf = 138478083;
    id v31 = v10;
    __int16 v32 = 2113;
    id v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Public] Fetched all changes, ChangeToken: %{private}@, RecordZoneName: %{private}@", buf, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a6);
  if (v11)
  {
    uint64_t v14 = sub_100031A80();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100028924();
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    double v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;

    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;
  }
  else if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] {
         || [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  }
  {
    id v19 = *(void **)(a1 + 32);
    id v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
    id v21 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
    id v29 = 0;
    unsigned int v22 = [v19 _handleRecordsChanged:v20 deletedRecordIDS:v21 error:&v29];
    id v23 = v29;

    if (v23 || ![v22 count])
    {
      double v24 = sub_100031A80();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000288BC();
      }
    }
    else
    {
      double v25 = +[MSDDefaultsManager sharedManager];
      [v25 setObjectWithCustomClass:v22 forDefault:@"publicDBData"];

      long long v26 = *(void **)(a1 + 32);
      dispatch_time_t v27 = [v9 zoneName];
      [v26 _updateDefaultsWithChangeToken:v27 serverChangeToken:v10];

      notify_post((const char *)[kMediaSetupServicesChanged UTF8String]);
      [*(id *)(a1 + 32) _updateLastRefreshTS];
    }
  }
  else
  {
    long long v28 = sub_100031A80();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "PublicDB records didn't change since last check", buf, 2u);
    }

    [*(id *)(a1 + 32) _updateLastRefreshTS];
  }
}

NSCopying *__cdecl sub_1000276BC(id a1, MSPublicDBInfo *a2)
{
  return (NSCopying *)[(MSPublicDBInfo *)a2 recordName];
}

id sub_100027A3C(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceID];
  id v4 = [*(id *)(a1 + 32) serviceID];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_100027FD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000289CC();
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v7);
  }
}

id sub_100028118(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceID];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_10002820C(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIDS];
  id v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

id sub_100028300(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceName];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100028428(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5));
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_1000285F4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100028614()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch updated public DB values %@", v2, v3, v4, v5, v6);
}

void sub_10002867C()
{
  sub_100005280();
  sub_1000285F4((void *)&_mh_execute_header, v0, v1, "[Public] Failed to create MSPublicDBInfo object with serviceName %{private}@ service ID: %{private}@");
}

void sub_1000286F0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[Public] Failed to fetch PublicDB Info, Nil RecordZoneID", v1, 2u);
}

void sub_100028734(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch PublicDb Info, Nil FetchRecordZoneChangesConfiguration obj", v1, 2u);
}

void sub_100028778()
{
  sub_100005280();
  sub_1000285F4((void *)&_mh_execute_header, v0, v1, "[Public] Error fetching record changes, recordID %@ error %@");
}

void sub_1000287EC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch publicDB Data again, %{private}@", v2, v3, v4, v5, v6);
}

void sub_100028854()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch data from PublicDB again after CKThrottle, %@", v2, v3, v4, v5, v6);
}

void sub_1000288BC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Processing resulted in Nil publicInfo : Skipping update %@", v2, v3, v4, v5, v6);
}

void sub_100028924()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "[Public] Encountered error while fetching changes, %@", v2, v3, v4, v5, v6);
}

void sub_10002898C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create PublicDB object", buf, 2u);
}

void sub_1000289CC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to fetch updated values of PublicDBInfo, %@", v2, v3, v4, v5, v6);
}

void MSDUpdateCKOperationForAttribution(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting applicationBundleIdentifierOverrideForNetworkAttribution to %@ for operation %@", (uint8_t *)&v7, 0x16u);
    }

    uint8_t v6 = objc_opt_new();
    [v6 setApplicationBundleIdentifierOverrideForNetworkAttribution:v4];
    [v3 setConfiguration:v6];
  }
}

void sub_100028E70(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) databaseScope];
    __int16 v9 = CKDatabaseScopeString();
    int v17 = 138412290;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] Fetched changes for Database", (uint8_t *)&v17, 0xCu);
  }
  if (v7)
  {
    id v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100030CA0(a1, (uint64_t)v7, v10);
    }

    uint64_t v11 = *(void *)(a1 + 64);
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
    }
  }
  else
  {
    if (v6)
    {
      int v12 = [*(id *)(a1 + 32) _handleRecordZonesChanged:*(void *)(a1 + 40) deletedRecordZones:*(void *)(a1 + 48)];
      id v13 = sub_100031A80();
      uint64_t v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100030C14((id *)(a1 + 32));
        }
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 32) databaseScope];
          uint64_t v15 = CKDatabaseScopeString();
          int v17 = 138412290;
          id v18 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Updating ServerChangeToken for DatabaseOperation", (uint8_t *)&v17, 0xCu);
        }
        uint64_t v14 = +[MSDDefaultsManager sharedManager];
        [v14 setObjectWithCustomClass:v6 forDefault:*(void *)(a1 + 56)];
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v12);
    }
  }
}

id sub_100029098(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) na_safeAddObject:a2];
}

id sub_1000290A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) na_safeAddObject:a2];
}

void sub_100029404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100029440(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    uint64_t v15 = sub_100031A80();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v5 allValues];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetched RecordZones %@", buf, 0xCu);
    }
    int v17 = [v5 allValues];
    id v18 = [v17 copy];

    id v19 = objc_opt_new();
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v72 = sub_100029E08;
    v73 = sub_100029E18;
    id v74 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100029E20;
    v58[3] = &unk_10004E1F8;
    void v58[4] = WeakRetained;
    v62 = buf;
    id v59 = *(id *)(a1 + 48);
    id v60 = *(id *)(a1 + 40);
    id v20 = v19;
    id v61 = v20;
    int v12 = [v18 ms_objectsPassingTest:v58];

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v21 = *(void *)(a1 + 72);
      if (v21) {
        (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
      }
      goto LABEL_44;
    }
    unsigned int v22 = sub_100031A80();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 138477827;
      id v68 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Filtered zoneResult %{private}@", v67, 0xCu);
    }

    id v23 = [v12 firstObject];
    if ([WeakRetained databaseScope] == (id)2 && (unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      double v24 = sub_100031A80();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v67 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "There are duplicate recordZones found with the same account, selecting the one created first", v67, 2u);
      }

      double v25 = [v20 allKeys];
      uint64_t v48 = [v25 sortedArrayUsingSelector:"compare:"];

      long long v26 = sub_100031A80();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        log = v26;
        id v47 = [v48 firstObject];
        id v46 = [v20 objectForKey:v47];
        id v45 = [v46 zoneID];
        id v27 = [v45 zoneName];
        long long v28 = [v48 firstObject];
        *(_DWORD *)v67 = 138478083;
        id v68 = v27;
        __int16 v69 = 2112;
        v70 = v28;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "First zone was created at: %{private}@ created at %@", v67, 0x16u);

        long long v26 = log;
      }

      id v29 = [v48 firstObject];
      uint64_t v30 = [v20 objectForKey:v29];

      id v31 = [v48 firstObject];
      [v20 removeObjectForKey:v31];

      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10002A098;
      v56[3] = &unk_10004E240;
      void v56[4] = WeakRetained;
      id v57 = *(id *)(a1 + 56);
      [v20 enumerateKeysAndObjectsUsingBlock:v56];

      id v23 = (void *)v30;
    }
    if (v23)
    {
      __int16 v32 = sub_100031A80();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 138477827;
        id v68 = v23;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Successfully fetched record zone %{private}@", v67, 0xCu);
      }

      id v33 = [v23 zoneID];
      [WeakRetained _updateUserInfoToRecordZoneIDMap:v33 userID:*(void *)(a1 + 40)];

      uint64_t v34 = *(void *)(a1 + 72);
      if (v34) {
        (*(void (**)(uint64_t, void *, void))(v34 + 16))(v34, v23, 0);
      }
      goto LABEL_43;
    }
    if ([WeakRetained databaseScope] == (id)2)
    {
      if ([*(id *)(a1 + 56) createNewZoneIfMissing])
      {
        __int16 v35 = +[NSUUID UUID];
        id v36 = [v35 UUIDString];

        id v49 = [objc_alloc((Class)CKRecordZone) initWithZoneName:v36];
        uint64_t v37 = sub_100031A80();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v67 = 138477827;
          id v68 = v49;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Saving Record Zone  %{private}@", v67, 0xCu);
        }

        uint64_t v38 = *(void *)(a1 + 56);
        uint64_t v39 = *(void *)(a1 + 64);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10002A158;
        v50[3] = &unk_10004CEA8;
        id v55 = *(id *)(a1 + 72);
        id v51 = *(id *)(a1 + 48);
        id v52 = *(id *)(a1 + 40);
        long long v53 = WeakRetained;
        id v40 = v49;
        id v54 = v40;
        [WeakRetained _saveRecordZone:v40 withAttribution:v39 andOptions:v38 completion:v50];
      }
      else
      {
        uint64_t v43 = *(void *)(a1 + 72);
        if (!v43)
        {
LABEL_43:

LABEL_44:
          _Block_object_dispose(buf, 8);

LABEL_45:
          goto LABEL_46;
        }
        uint64_t v65 = MSUserInfoErrorStringKey;
        CFStringRef v66 = @"No matching zone found and did not create a new one";
        id v36 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        id v40 = +[NSError errorWithDomain:MSErrorDomain code:3 userInfo:v36];
        (*(void (**)(uint64_t, void, id))(v43 + 16))(v43, 0, v40);
      }
    }
    else
    {
      long long v41 = sub_100031A80();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v67 = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Zone is missing, but we dont have enough permissions to create", v67, 2u);
      }

      uint64_t v42 = *(void *)(a1 + 72);
      if (!v42) {
        goto LABEL_43;
      }
      id v36 = [objc_alloc((Class)NSError) initWithDomain:CKErrorDomain code:12 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v42 + 16))(v42, 0, v36);
    }

    goto LABEL_43;
  }
  id v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100030D40((uint64_t)v6, v7, v8);
  }

  uint64_t v9 = *(void *)(a1 + 72);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
  if ([v6 CKErrorHasErrorCode:112] && CKErrorIsCode())
  {
    id v10 = [v6 userInfo];
    id WeakRetained = [v10 objectForKey:CKPartialErrorsByItemIDKey];

    int v12 = [WeakRetained allKeys];
    id v13 = sub_100031A80();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CKDatabase(MSDCloudDatabase) fetchRecordZoneFor:user:withOptions:withAttribution:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Zones with ManateeIdentity Lost %@", buf, 0x16u);
    }

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100029DF8;
    v63[3] = &unk_10004CED0;
    uint64_t v14 = *(void **)(a1 + 40);
    v63[4] = *(void *)(a1 + 32);
    id v64 = v14;
    [v12 enumerateObjectsUsingBlock:v63];

    goto LABEL_45;
  }
LABEL_46:
}

void sub_100029DAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100029DF8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCKErrorMissingManateeIdentity:a2 homeUserID:*(void *)(a1 + 40)];
}

uint64_t sub_100029E08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100029E18(uint64_t a1)
{
}

uint64_t sub_100029E20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 zoneID];
  id v5 = [v4 zoneName];
  unsigned __int8 v6 = [v5 isEqualToString:CKRecordZoneDefaultName];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v3 zoneID];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v10 + 40);
    uint64_t v11 = [v8 _fetchPlaceholderRecordData:v9 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      int v12 = sub_100031A80();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100030DC4(a1 + 64, v12, v13, v14, v15, v16, v17, v18);
      }
      uint64_t v7 = 0;
    }
    else
    {
      int v12 = [v11 objectForKey:MSHomeParticipantHomeIdentifier];
      id v19 = [v11 objectForKey:MSHomeParticipantHomeUserIdentifier];
      id v20 = [v11 objectForKey:@"PlaceholderRecordCreationDate"];
      uint64_t v21 = sub_100031A80();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = [v3 zoneID];
        id v23 = [v22 zoneName];
        *(_DWORD *)buf = 138478083;
        id v27 = v23;
        __int16 v28 = 2113;
        id v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Placeholder Record for %{private}@ %{private}@", buf, 0x16u);
      }
      if ([v12 isEqualToString:*(void *)(a1 + 40)])
      {
        uint64_t v7 = (uint64_t)[v19 isEqualToString:*(void *)(a1 + 48)];
        if (v7 && v20)
        {
          [*(id *)(a1 + 56) na_safeSetObject:v3 forKey:v20];
          uint64_t v7 = 1;
        }
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
  }

  return v7;
}

void sub_10002A098(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [a3 zoneID];
  [v4 deleteRecordZone:v5 withOptions:*(void *)(a1 + 40) completion:&stru_10004E218];
}

void sub_10002A100(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_100031A80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100030E3C();
    }
  }
}

void sub_10002A158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100030EA4();
    }

    uint64_t v8 = *(void *)(a1 + 64);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    uint64_t v9 = MSPlaceholderRecordName;
    uint64_t v10 = MSPlaceholderRecordType;
    uint64_t v11 = [v5 zoneID];
    int v12 = +[CKRecord createRecordWithName:v9 recordType:v10 recordZone:v11];

    [v12 setRecordFieldForKey:MSHomeParticipantHomeIdentifier value:*(void *)(a1 + 32)];
    [v12 setRecordFieldForKey:MSHomeParticipantHomeUserIdentifier value:*(void *)(a1 + 40)];
    uint64_t v13 = sub_100031A80();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138478083;
      uint64_t v22 = v14;
      __int16 v23 = 2113;
      uint64_t v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to save PlaceHolder record with HomeID: %{private}@, HomeUserID : %{private}@", buf, 0x16u);
    }

    uint64_t v16 = *(void **)(a1 + 48);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A3A8;
    v17[3] = &unk_10004E290;
    void v17[4] = v16;
    id v18 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 64);
    id v19 = v5;
    [v16 saveRecord:v12 completionHandler:v17];
  }
}

void sub_10002A3A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100031A80();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100030F0C();
    }

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) zoneID];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002A548;
    v11[3] = &unk_10004E268;
    id v13 = *(id *)(a1 + 56);
    id v12 = v4;
    [v7 deleteRecordZone:v8 withOptions:0 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 48) zoneID];
      *(_DWORD *)buf = 138477827;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully saved record to Zone %{private}@", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, *(void *)(a1 + 48), 0);
    }
  }
}

void sub_10002A548(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100030F74();
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, *(void *)(a1 + 32));
  }
}

void sub_10002A91C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100030FDC();
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, BOOL, id))(v11 + 16))(v11, v8 != 0, v9);
  }
}

void sub_10002AB68(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a3;
    id v7 = [a2 objectForKey:v5];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

uint64_t sub_10002ADB8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002B368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v52 - 248), 8);
  _Block_object_dispose((const void *)(v52 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_10002B3CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10002BABC;
  v45[3] = &unk_10004CB38;
  id v46 = *(id *)(a1 + 32);
  id v4 = objc_retainBlock(v45);
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v5) {
    uint64_t v5 = v3;
  }
  id v6 = v5;
  if (!v6)
  {
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) na_filter:&stru_10004E320];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 40) _checkShareStatusIfApplicable:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v10);
    }
    id v13 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) na_filter:&stru_10004E340];
    id v14 = [v13 mutableCopy];

    if ([v14 count] || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "count"))
    {
      uint64_t v15 = [*(id *)(a1 + 40) _handleChangedRecords:v14 andDeletedRecordIDS:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
      uint64_t v16 = +[MSDDefaultsManager sharedManager];
      uint64_t v17 = [v16 objectForDefaultWithCustomClass:*(void *)(a1 + 64)];

      id v40 = [v17 na_map:&stru_10004E360];
      id v18 = sub_100031A80();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        uint64_t v48 = v40;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Services stored in defaults %{private}@", buf, 0xCu);
      }

      if (v15 && [v15 count])
      {
        [*(id *)(a1 + 40) _notifyObserversDataChanged:v15 cachedData:v17];
        [*(id *)(a1 + 40) _attemptToRecordServiceRequestLapse:v15 fromRecords:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
        id v19 = +[MSDDefaultsManager sharedManager];
        [v19 setObjectWithCustomClass:v15 forDefault:*(void *)(a1 + 64)];

        id v20 = +[MSDDefaultsManager sharedManager];
        uint64_t v21 = [v20 objectForDefaultWithCustomClass:*(void *)(a1 + 64)];

        uint64_t v39 = [v21 na_map:&stru_10004E380];
        uint64_t v22 = sub_100031A80();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v48 = v39;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Services stored in defaults after update %{private}@", buf, 0xCu);
        }

        [*(id *)(a1 + 40) _updateServerChangeTokenMap:*(void *)(a1 + 48) serverChangeToken:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
        ((void (*)(void *, uint64_t))v4[2])(v4, 1);
        uint64_t v23 = *(void *)(a1 + 72);
        if (v23) {
          (*(void (**)(uint64_t, void *, void))(v23 + 16))(v23, v15, 0);
        }
      }
      else
      {
        __int16 v28 = sub_100031A80();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_100031124();
        }

        ((void (*)(void *, void))v4[2])(v4, 0);
        uint64_t v29 = *(void *)(a1 + 72);
        if (v29)
        {
          uint64_t v30 = +[NSError errorWithDomain:MSErrorDomain code:7 userInfo:0];
          (*(void (**)(uint64_t, void *, void *))(v29 + 16))(v29, v17, v30);
        }
      }
    }
    else
    {
      ((void (*)(void *, uint64_t))v4[2])(v4, 1);
      id v36 = +[MSDDefaultsManager sharedManager];
      uint64_t v15 = [v36 objectForDefaultWithCustomClass:*(void *)(a1 + 64)];

      uint64_t v37 = *(void *)(a1 + 72);
      if (v37) {
        (*(void (**)(uint64_t, void *, void))(v37 + 16))(v37, v15, 0);
      }
    }

    goto LABEL_36;
  }
  if (!CKErrorIsCode())
  {
    if ([v6 code] == (id)112)
    {
      uint64_t v24 = sub_100031A80();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10003118C();
      }

      double v25 = *(void **)(a1 + 40);
      uint64_t v26 = *(void *)(a1 + 48);
      id v27 = [*(id *)(a1 + 56) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
      [v25 handleCKErrorMissingManateeIdentity:v26 homeUserID:v27];

      goto LABEL_41;
    }
    if (CKErrorIsCode())
    {
      id v31 = sub_100031A80();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1000311C0(a1);
      }

      __int16 v32 = *(void **)(a1 + 40);
      uint64_t v50 = *(void *)(a1 + 48);
      id v33 = +[NSArray arrayWithObjects:&v50 count:1];
      [v32 _purgeDeletedZonesFromDefaults:v33];

      goto LABEL_41;
    }
    if ((CKErrorIsCode() & 1) == 0 && !CKErrorIsCode())
    {
      uint64_t v38 = sub_100031A80();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100031248();
      }

      goto LABEL_41;
    }
    uint64_t v34 = +[MSDDefaultsManager sharedManager];
    id v8 = [v34 objectForDefaultWithCustomClass:*(void *)(a1 + 64)];

    uint64_t v35 = *(void *)(a1 + 72);
    if (v35) {
      (*(void (**)(uint64_t, void *, void))(v35 + 16))(v35, v8, 0);
    }
    ((void (*)(void *, void))v4[2])(v4, 0);
LABEL_36:

    goto LABEL_43;
  }
  id v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100031158();
  }

  [*(id *)(a1 + 40) _handleCKErrorChangeTokenExpired:*(void *)(a1 + 48) userInfo:*(void *)(a1 + 56)];
LABEL_41:
  if (*(void *)(a1 + 72))
  {
    ((void (*)(void *, void))v4[2])(v4, 0);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
LABEL_43:
}

id sub_10002BABC(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) stopwatch];
  [v4 stop];

  uint64_t v5 = [*(id *)(a1 + 32) stopwatch];
  [v5 toggleLock:1];

  [*(id *)(a1 + 32) setDidSucceed:a2];
  uint64_t v6 = *(void *)(a1 + 32);

  return +[MSAnalytics sendServiceEvent:v6];
}

BOOL sub_10002BB44(id a1, CKRecord *a2)
{
  uint64_t v2 = [(CKRecord *)a2 recordID];
  id v3 = [v2 recordName];
  unsigned __int8 v4 = [v3 isEqualToString:CKRecordNameZoneWideShare];

  return v4;
}

BOOL sub_10002BBA4(id a1, CKRecord *a2)
{
  uint64_t v2 = a2;
  id v3 = [(CKRecord *)v2 recordType];
  if ([v3 isEqualToString:MSServiceAccountRecordType])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    uint64_t v5 = [(CKRecord *)v2 recordType];
    unsigned __int8 v4 = [v5 isEqualToString:MSDefaultServiceRecordType];
  }
  return v4;
}

id sub_10002BC2C(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = [(MSDDefaultsInfo *)v2 recordName];
  unsigned __int8 v4 = [(MSDDefaultsInfo *)v2 recordZoneName];

  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

id sub_10002BCC0(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = [(MSDDefaultsInfo *)v2 recordName];
  unsigned __int8 v4 = [(MSDDefaultsInfo *)v2 recordZoneName];

  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

void sub_10002BD54(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  id v12 = sub_100031A80();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138478083;
    id v25 = v9;
    __int16 v26 = 2113;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetch Records Completion: recordZoneID %{private}@ serverChangeToken %{private}@", (uint8_t *)&v24, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a6);
  id v13 = sub_100031A80();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) databaseScope];
    id v14 = CKDatabaseScopeString();
    int v24 = 138412802;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] Fetched all records for recordZoneID %@, serverChangeToken %@", (uint8_t *)&v24, 0x20u);
  }
  if (v11)
  {
    uint64_t v15 = sub_100031A80();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000312B0();
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
  else
  {
    uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
    id v21 = v10;
    id v19 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v21;
  }

  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]
    && ![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    uint64_t v22 = sub_100031A80();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) databaseScope];
      uint64_t v23 = CKDatabaseScopeString();
      int v24 = 138412290;
      id v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ database did not change since last check", (uint8_t *)&v24, 0xCu);
    }
  }
}

void sub_10002BFD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) databaseScope];
    id v8 = CKDatabaseScopeString();
    int v9 = 138412803;
    id v10 = v8;
    __int16 v11 = 2113;
    id v12 = v5;
    __int16 v13 = 2113;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Deleted RecordID %{private}@ and type %{private}@", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) na_safeAddObject:v5];
}

void sub_10002C0E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100031A80();
  __int16 v11 = v10;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) databaseScope];
      __int16 v13 = CKDatabaseScopeString();
      int v14 = 138412802;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%@] Error fetching record changes for recordID %@, error %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) databaseScope];
      id v12 = CKDatabaseScopeString();
      int v14 = 138412547;
      uint64_t v15 = v12;
      __int16 v16 = 2113;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] Adding recordID %{private}@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) na_safeAddObject:v8];
  }
}

void sub_10002C4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10002C520(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031318(a1, (uint64_t)v5, v6);
    }

    if ([v5 CKErrorHasErrorCode:112]) {
      [*(id *)(a1 + 40) handleCKErrorMissingManateeIdentity:*(void *)(a1 + 32) homeUserID:0];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id sub_10002CAF4(id a1, CKRecordZoneID *a2)
{
  return [(CKRecordZoneID *)a2 zoneName];
}

id sub_10002CAFC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 recordZoneName];
  id v4 = [v2 containsObject:v3];

  return v4;
}

id sub_10002CB44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

void sub_10002CBA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002CC64;
  v9[3] = &unk_10004E4D8;
  id v8 = v6;
  id v10 = v8;
  if (objc_msgSend(v7, "na_any:", v9)) {
    [*(id *)(a1 + 40) na_safeAddObject:v5];
  }
}

id sub_10002CC64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 ownerName];
  id v5 = [*(id *)(a1 + 32) ownerName];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [v3 zoneName];
    id v7 = [*(id *)(a1 + 32) zoneName];
    id v8 = [v6 isEqualToString:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_10002CF5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000313B4((uint64_t)v9, v10, v11);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    __int16 v13 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v9);
  }
}

NSCopying *__cdecl sub_10002D3C4(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = [(MSDDefaultsInfo *)v2 recordName];
  id v4 = [(MSDDefaultsInfo *)v2 recordZoneName];

  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSCopying *)v5;
}

id sub_10002D9F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recordType];
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = [v3 homeUserID];
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      id v6 = [v3 recordZoneName];
      id v7 = [*(id *)(a1 + 40) recordZoneName];
      id v8 = [v6 isEqualToString:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id sub_10002DAC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recordType];
  unsigned __int8 v5 = [v4 isEqualToString:MSDefaultServiceRecordType];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [v3 service];
    id v8 = [v7 serviceID];
    id v9 = [*(id *)(a1 + 32) service];
    id v10 = [v9 serviceID];
    if ([v8 isEqual:v10])
    {
      uint64_t v11 = [v3 homeID];
      uint64_t v12 = [*(id *)(a1 + 32) homeID];
      if ([v11 isEqual:v12])
      {
        __int16 v13 = [v3 homeUserID];
        int v14 = [*(id *)(a1 + 32) homeUserID];
        if ([v13 isEqual:v14])
        {
          [v3 recordZoneName];
          uint64_t v15 = v18 = v14;
          [*(id *)(a1 + 32) recordZoneName];
          __int16 v16 = v19 = v13;
          id v6 = [v15 isEqualToString:v16];

          __int16 v13 = v19;
          int v14 = v18;
        }
        else
        {
          id v6 = 0;
        }
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

void sub_10002DE30(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = a4;
    id v7 = [a2 firstObject];
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
  }
}

uint64_t sub_10002E090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 != 0, a4);
  }
  return result;
}

void sub_10002E308(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Encountered error when modifying record %@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v7, v8, v9);
  }
}

void sub_10002E608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002E62C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000315A4();
    }
  }
  else
  {
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v9 = MSHomeParticipantHomeIdentifier;
    id v10 = [v5 recordFieldForKey:MSHomeParticipantHomeIdentifier];
    [v8 na_safeSetObject:v10 forKey:v9];

    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v12 = MSHomeParticipantHomeUserIdentifier;
    id v13 = [v5 recordFieldForKey:MSHomeParticipantHomeUserIdentifier];
    [v11 na_safeSetObject:v13 forKey:v12];

    int v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v15 = [v5 creationDate];
    [v14 na_safeSetObject:v15 forKey:@"PlaceholderRecordCreationDate"];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002E994(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 zoneName];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
    [v9 setPreviousServerChangeToken:v10];
    [*(id *)(a1 + 40) na_safeSetObject:v9 forKey:*(void *)(a1 + 32)];
  }
}

id sub_10002ED68(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAllRecordsForRecordZoneID:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48) withOptions:0 completion:0];
}

void sub_10002EF6C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = sub_100031A80();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003173C();
    }
  }
}

id sub_10002EFC4(uint64_t a1, void *a2)
{
  id v3 = [a2 recordZoneName];
  uint64_t v4 = [*(id *)(a1 + 32) zoneName];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10002F26C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did handle Manatee loss on SharedDatabase %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10002F48C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100031A80();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000317A4(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) databaseScope];
    id v7 = CKDatabaseScopeString();
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Successfully deleted share after Manatee Loss detected", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v4);
  }
}

void sub_10002F6C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100031A80();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100031844();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) databaseScope];
      id v7 = CKDatabaseScopeString();
      uint64_t v8 = [*(id *)(a1 + 40) zoneName];
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Successfully deleted recordZone(%@)", buf, 0x16u);
    }
    int v9 = +[MSDDefaultsManager sharedManager];
    id v6 = [v9 objectForDefaultWithCustomClass:@"privateDatabaseData"];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002F9C4;
    v20[3] = &unk_10004CA98;
    id v21 = *(id *)(a1 + 40);
    id v10 = [v6 na_filter:v20];
    if ([v10 count])
    {
      id v11 = objc_alloc((Class)CKRecordZone);
      uint64_t v12 = +[NSUUID UUID];
      id v13 = [v12 UUIDString];
      int v14 = [v11 initWithZoneName:v13];

      uint64_t v15 = *(void **)(a1 + 32);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10002FA28;
      v17[3] = &unk_10004E5F8;
      void v17[4] = v15;
      id v18 = v10;
      id v19 = *(id *)(a1 + 40);
      [v15 _saveRecordZone:v14 withAttribution:0 andOptions:0 completion:v17];
    }
    else
    {
      int v14 = sub_100031A80();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = [*(id *)(a1 + 40) zoneName];
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No cached Info associated with Zone %@", buf, 0xCu);
      }
    }
  }
}

id sub_10002F9C4(uint64_t a1, void *a2)
{
  id v3 = [a2 recordZoneName];
  id v4 = [*(id *)(a1 + 32) zoneName];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10002FA28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100031A80();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully saved new zone %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _populateRecordZoneWithCachedInfo:v5 cachedInfo:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000318AC();
    }
  }
  int v9 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 48);
  id v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [v9 _purgeDeletedZonesFromDefaults:v10];
}

BOOL sub_1000301B8(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = [(MSDDefaultsInfo *)a2 recordType];
  unsigned __int8 v3 = [v2 isEqualToString:MSServiceAccountRecordType];

  return v3;
}

void sub_100030200(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031948();
    }
  }
  id v11 = [v7 count];
  if (v11 == [*(id *)(a1 + 32) count])
  {
    uint64_t v12 = sub_100031A80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully saved records after manatee loss", v13, 2u);
    }
  }
}

BOOL sub_100030540(id a1, CKShareParticipant *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = (id)[(CKShareParticipant *)v2 role] != (id)1
    && [(CKShareParticipant *)v2 invitationTokenStatus] == (id)3;

  return v3;
}

void sub_100030590(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000319B0();
    }
  }
  else
  {
    objc_opt_class();
    id v6 = *(id *)(a1 + 32);
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = +[MSDHomeManager sharedManager];
    id v10 = [v9 currentHome];
    id v11 = +[MSDHomeCloudShareCreate cloudShareForHome:v10];

    [v11 shareRecordWithOwner:v8 completion:&stru_10004E6E8];
  }
}

void sub_100030698(id a1, HMHomeCloudShareResponse *a2, NSError *a3)
{
  BOOL v3 = a3;
  id v4 = sub_100031A80();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100031A18();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully established share after manatee loss", v6, 2u);
  }
}

id sub_100030B4C(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 service];
  id v4 = [v3 serviceID];
  id v5 = [v4 UUIDString];
  id v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

BOOL sub_100030BB8(id a1, CKRecord *a2)
{
  uint64_t v2 = [(CKRecord *)a2 recordFieldForKey:MediaServiceIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

void sub_100030C14(id *a1)
{
  [*a1 databaseScope];
  uint64_t v1 = CKDatabaseScopeString();
  sub_100005280();
  sub_1000223F0((void *)&_mh_execute_header, v2, v3, "[%@] Error fetching recordZone changes, skipping server token update", v4, v5, v6, v7, v8);
}

void sub_100030CA0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  [*(id *)(a1 + 32) databaseScope];
  uint64_t v4 = CKDatabaseScopeString();
  sub_100030BFC();
  sub_100020228((void *)&_mh_execute_header, a3, v5, "[%@] Encountered error when fetching changes for database %@, skipping cachedData update", v6);
}

void sub_100030D40(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[CKDatabase(MSDCloudDatabase) fetchRecordZoneFor:user:withOptions:withAttribution:completion:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  sub_100020228((void *)&_mh_execute_header, a2, a3, "%s Error fetching record zones, %@", (uint8_t *)&v3);
}

void sub_100030DC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030E3C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error deleting duplicate recordZones %@", v2, v3, v4, v5, v6);
}

void sub_100030EA4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving recordZone %@", v2, v3, v4, v5, v6);
}

void sub_100030F0C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving Placeholder Record %@", v2, v3, v4, v5, v6);
}

void sub_100030F74()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error deleting orphaned record, %@", v2, v3, v4, v5, v6);
}

void sub_100030FDC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to delete record zone, %@", v2, v3, v4, v5, v6);
}

void sub_100031044()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to fetch records - NIL CKRecordID", v2, v3, v4, v5, v6);
}

void sub_100031078()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to fetch records - NIL CKRecordIDS", v2, v3, v4, v5, v6);
}

void sub_1000310AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031124()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to update the device cache after finding updated records. Returning from items from cache.", v2, v3, v4, v5, v6);
}

void sub_100031158()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "CloudKit Server Change tokens expired", v2, v3, v4, v5, v6);
}

void sub_10003118C()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Encountered CloudKit Error Missing Manatee Identity", v2, v3, v4, v5, v6);
}

void sub_1000311C0(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) zoneName];
  sub_100005280();
  sub_1000223F0((void *)&_mh_execute_header, v2, v3, "Encountered RecordZoneNotFound Error, purging local cached copy (recordZoneName : %{private}@)", v4, v5, v6, v7, v8);
}

void sub_100031248()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Unknown CloudKit Error occurred %@", v2, v3, v4, v5, v6);
}

void sub_1000312B0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error fetching records %{private}@", v2, v3, v4, v5, v6);
}

void sub_100031318(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[CKDatabase(MSDCloudDatabase) _handleRecordZonesChanged:deletedRecordZones:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Error updating records for recordZoneID %@, %@", (uint8_t *)&v4, 0x20u);
}

void sub_1000313B4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315395;
  int v4 = "-[CKDatabase(MSDCloudDatabase) _saveRecordZone:withAttribution:andOptions:completion:]_block_invoke";
  __int16 v5 = 2113;
  uint64_t v6 = a1;
  sub_100020228((void *)&_mh_execute_header, a2, a3, "%s Failed to save recordZone, %{private}@", (uint8_t *)&v3);
}

void sub_100031438(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 recordID];
  __int16 v8 = [v7 recordName];
  *(_DWORD *)a1 = 138477827;
  *a3 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Failed to create MediaService object from record %{private}@", a1, 0xCu);
}

void sub_1000314C8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create MSDDefaultsInfo object", buf, 2u);
}

void sub_100031508()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to save record - NIL CKRecord", v2, v3, v4, v5, v6);
}

void sub_10003153C()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to modify records, no records specified", v2, v3, v4, v5, v6);
}

void sub_100031570()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Error: Semaphore timed out !! Placeholder recordData", v2, v3, v4, v5, v6);
}

void sub_1000315A4()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Could not find record with Name: PlaceholderRecordName %{private}@", v2, v3, v4, v5, v6);
}

void sub_10003160C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031684()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Failed to handle CKError Missing Manatee Identity - NIL recordZoneID", v2, v3, v4, v5, v6);
}

void sub_1000316B8(void *a1)
{
  uint64_t v1 = [a1 zoneName];
  sub_100005280();
  sub_1000223F0((void *)&_mh_execute_header, v2, v3, "No cached Info associated with Zone %@", v4, v5, v6, v7, v8);
}

void sub_10003173C()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error deleting share while recovering from Manatee loss %@", v2, v3, v4, v5, v6);
}

void sub_1000317A4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  [*(id *)(a1 + 32) databaseScope];
  uint64_t v4 = CKDatabaseScopeString();
  sub_100030BFC();
  sub_100020228((void *)&_mh_execute_header, a3, v5, "[%@] Error deleting Manatee share, %@", v6);
}

void sub_100031844()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error deleting recordZone, %@", v2, v3, v4, v5, v6);
}

void sub_1000318AC()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error creating new zone after Manatee key loss, %@", v2, v3, v4, v5, v6);
}

void sub_100031914()
{
  sub_100003BEC();
  sub_100003BD0((void *)&_mh_execute_header, v0, v1, "Error creating records from cached info", v2, v3, v4, v5, v6);
}

void sub_100031948()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Failed to save records after manatee loss, %@", v2, v3, v4, v5, v6);
}

void sub_1000319B0()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Error saving modified share, %@", v2, v3, v4, v5, v6);
}

void sub_100031A18()
{
  sub_100005280();
  sub_100005264((void *)&_mh_execute_header, v0, v1, "Received error while trying to setup share again after manatee loss %@", v2, v3, v4, v5, v6);
}

id sub_100031A80()
{
  if (qword_1000567F0 != -1) {
    dispatch_once(&qword_1000567F0, &stru_10004E750);
  }
  uint64_t v0 = (void *)qword_1000567E8;

  return v0;
}

void sub_100031AD4(id a1)
{
  qword_1000567E8 = (uint64_t)os_log_create("com.apple.mediasetupd", "log");

  _objc_release_x1();
}

void sub_100031B6C(id a1)
{
  qword_100056800 = (uint64_t)dispatch_queue_create("Logging Queue", 0);

  _objc_release_x1();
}

void sub_100031D04(id a1, NSString *a2, NSDictionary *a3)
{
}

void sub_100031DCC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (*(double *)(a1 + 40) >= 3600.0) {
    double v4 = *(double *)(a1 + 40);
  }
  else {
    double v4 = 3600.0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031EF4;
  v8[3] = &unk_10004E7D8;
  objc_copyWeak(&v9, v2);
  uint64_t v5 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v8 block:v4];
  id v6 = WeakRetained[2];
  WeakRetained[2] = (id)v5;

  [WeakRetained[1] timeIntervalSinceNow];
  if (*(double *)(a1 + 40) < -v7) {
    [WeakRetained[2] fire];
  }
  objc_destroyWeak(&v9);
}

void sub_100031EDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100031EF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fileMetrics];
}

uint64_t sub_100032018(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = objc_retainBlock(*(id *)(a1 + 40));

  return _objc_release_x1();
}

void sub_10003241C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint8_t v8 = [v5 objectForKeyedSubscript:v7];
  [v8 doubleValue];
  double v10 = v9;
  id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  double v12 = v10 * (double)(unint64_t)[v11 unsignedIntegerValue];

  [v6 doubleValue];
  double v14 = v13;

  uint64_t v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
  __int16 v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v15 unsignedIntegerValue] + 1);
  [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v7];

  id v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
  double v18 = (v12 + v14) / (double)(unint64_t)[v17 unsignedIntegerValue];

  id v19 = +[NSNumber numberWithDouble:v18];
  [*(id *)(a1 + 56) setObject:v19 forKeyedSubscript:v7];
}

void sub_100032578(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint8_t v8 = [v5 objectForKeyedSubscript:v7];
  double v9 = (char *)[v8 unsignedIntegerValue];

  id v10 = [v6 unsignedIntegerValue];
  id v11 = +[NSNumber numberWithUnsignedInteger:&v9[(void)v10]];
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];
}

void sub_100032638(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_100032750(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;

  id v6 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v7;

  uint64_t v10 = objc_opt_new();
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  double v13 = [*(id *)(a1 + 32) performanceLog];

  if (v13)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000328F8;
    v19[3] = &unk_10004E8C8;
    void v19[4] = *(void *)(a1 + 32);
    [v2 enumerateKeysAndObjectsUsingBlock:v19];
  }
  double v14 = [*(id *)(a1 + 32) occuranceLog];

  if (v14)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100032AC0;
    v18[3] = &unk_10004E8C8;
    void v18[4] = *(void *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v18];
  }
  uint64_t v15 = +[NSDate date];
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 8);
  *(void *)(v16 + 8) = v15;

  [*(id *)(a1 + 32) _saveAnalyticsData];
}

void sub_1000328F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = +[NSMutableDictionary dictionary];
  double v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_100032A24;
  uint64_t v16 = &unk_10004E878;
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v7;
  id v8 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:&v13];

  double v9 = [[*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6, v13, v14, v15, v16, v17];

  [v8 setValuesForKeysWithDictionary:v9];
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[7];
  double v12 = [v10 performanceLog];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v8);
}

void sub_100032A24(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:v8];
  if (!v7) {
    id v7 = v8;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_100032AC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NSMutableDictionary dictionary];
  double v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_100032BEC;
  uint64_t v16 = &unk_10004E878;
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v7;
  id v8 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:&v13];

  double v9 = [[*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6, v13, v14, v15, v16, v17];

  [v8 setValuesForKeysWithDictionary:v9];
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[7];
  double v12 = [v10 occuranceLog];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v8);
}

void sub_100032BEC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:v8];
  if (!v7) {
    id v7 = v8;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_100032E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100032EB4(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_10003347C(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 8) count]
    && ([*(id *)(a1 + 40) isEqualToString:@"Start"] & 1) == 0)
  {
    NSLog(@"Warning: CMSLoggerSession should start with kMSLoggingEventTypeStart. We have %@. It will be insert for you %s", *(void *)(a1 + 40), "-[CMSLoggingSession recordEvent:occuredAt:]_block_invoke");
    id v2 = [[MSLoggingEvent alloc] initForEventType:@"Start" atTimestamp:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:v2];
  }
  id v3 = [[MSLoggingEvent alloc] initForEventType:*(void *)(a1 + 40) atTimestamp:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v3];
}

void sub_100033A34(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) eventDurations];
  id v2 = [*(id *)(a1 + 32) eventOccurance];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained _sumbitFromSessionType:*(void *)(*(void *)(a1 + 32) + 24) withMetadata:*(void *)(*(void *)(a1 + 32) + 32) withEventDurations:v4 withEventOccurance:v2];
}

void sub_100033CD8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "_set_user_dir_suffix failed!", v0, 2u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t CKDatabaseScopeString()
{
  return _CKDatabaseScopeString();
}

uint64_t CKErrorIsCode()
{
  return _CKErrorIsCode();
}

uint64_t CKStringFromAccountStatus()
{
  return _CKStringFromAccountStatus();
}

uint64_t CKStringFromParticipantAcceptanceStatus()
{
  return _CKStringFromParticipantAcceptanceStatus();
}

uint64_t CKStringFromParticipantInvitationTokenStatus()
{
  return _CKStringFromParticipantInvitationTokenStatus();
}

uint64_t CKStringFromParticipantPermission()
{
  return _CKStringFromParticipantPermission();
}

uint64_t HMHomeManagerStatusToString()
{
  return _HMHomeManagerStatusToString();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_MSDCloudKitContainer(void *a1, const char *a2, ...)
{
  return [a1 MSDCloudKitContainer];
}

id objc_msgSend_MSDCloudKitContainerID(void *a1, const char *a2, ...)
{
  return [a1 MSDCloudKitContainerID];
}

id objc_msgSend_MSDPublicCloudKitContainer(void *a1, const char *a2, ...)
{
  return [a1 MSDPublicCloudKitContainer];
}

id objc_msgSend_MSDPublicCloudKitContainerID(void *a1, const char *a2, ...)
{
  return [a1 MSDPublicCloudKitContainerID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__LoggingQueue(void *a1, const char *a2, ...)
{
  return [a1 _LoggingQueue];
}

id objc_msgSend__attemptToLoadPublicInfoAgain(void *a1, const char *a2, ...)
{
  return [a1 _attemptToLoadPublicInfoAgain];
}

id objc_msgSend__checkAccountStatus(void *a1, const char *a2, ...)
{
  return [a1 _checkAccountStatus];
}

id objc_msgSend__clearAllDefaultsData(void *a1, const char *a2, ...)
{
  return [a1 _clearAllDefaultsData];
}

id objc_msgSend__determinePushEnvironment(void *a1, const char *a2, ...)
{
  return [a1 _determinePushEnvironment];
}

id objc_msgSend__endSession(void *a1, const char *a2, ...)
{
  return [a1 _endSession];
}

id objc_msgSend__fetchImageFromInternetURL(void *a1, const char *a2, ...)
{
  return [a1 _fetchImageFromInternetURL];
}

id objc_msgSend__fileMetrics(void *a1, const char *a2, ...)
{
  return [a1 _fileMetrics];
}

id objc_msgSend__getOperationConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _getOperationConfiguration];
}

id objc_msgSend__handleAccountStatusUnsupported(void *a1, const char *a2, ...)
{
  return [a1 _handleAccountStatusUnsupported];
}

id objc_msgSend__handleHomeKitFinishedInitialization(void *a1, const char *a2, ...)
{
  return [a1 _handleHomeKitFinishedInitialization];
}

id objc_msgSend__hasItems(void *a1, const char *a2, ...)
{
  return [a1 _hasItems];
}

id objc_msgSend__homeWasRemoved(void *a1, const char *a2, ...)
{
  return [a1 _homeWasRemoved];
}

id objc_msgSend__initializeBackgroundActivityTask(void *a1, const char *a2, ...)
{
  return [a1 _initializeBackgroundActivityTask];
}

id objc_msgSend__initializeCoalescerObject(void *a1, const char *a2, ...)
{
  return [a1 _initializeCoalescerObject];
}

id objc_msgSend__loadAnalyticsData(void *a1, const char *a2, ...)
{
  return [a1 _loadAnalyticsData];
}

id objc_msgSend__loggerStorage(void *a1, const char *a2, ...)
{
  return [a1 _loggerStorage];
}

id objc_msgSend__markHomeKitInitialized(void *a1, const char *a2, ...)
{
  return [a1 _markHomeKitInitialized];
}

id objc_msgSend__performStartup(void *a1, const char *a2, ...)
{
  return [a1 _performStartup];
}

id objc_msgSend__returnGenericAppIcon(void *a1, const char *a2, ...)
{
  return [a1 _returnGenericAppIcon];
}

id objc_msgSend__saveAnalyticsData(void *a1, const char *a2, ...)
{
  return [a1 _saveAnalyticsData];
}

id objc_msgSend__savePublicDBInfoInDefaults(void *a1, const char *a2, ...)
{
  return [a1 _savePublicDBInfoInDefaults];
}

id objc_msgSend__scheduleRefreshTask(void *a1, const char *a2, ...)
{
  return [a1 _scheduleRefreshTask];
}

id objc_msgSend__setupMultiUser(void *a1, const char *a2, ...)
{
  return [a1 _setupMultiUser];
}

id objc_msgSend__setupNotifications(void *a1, const char *a2, ...)
{
  return [a1 _setupNotifications];
}

id objc_msgSend__updateLastRefreshTS(void *a1, const char *a2, ...)
{
  return [a1 _updateLastRefreshTS];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return [a1 acceptanceStatus];
}

id objc_msgSend_accountAuthToken(void *a1, const char *a2, ...)
{
  return [a1 accountAuthToken];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return [a1 accountName];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_allHomes(void *a1, const char *a2, ...)
{
  return [a1 allHomes];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_authConfiguration(void *a1, const char *a2, ...)
{
  return [a1 authConfiguration];
}

id objc_msgSend_authCredential(void *a1, const char *a2, ...)
{
  return [a1 authCredential];
}

id objc_msgSend_authFatalError(void *a1, const char *a2, ...)
{
  return [a1 authFatalError];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIDS(void *a1, const char *a2, ...)
{
  return [a1 bundleIDS];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_clearDeveloperDefaults(void *a1, const char *a2, ...)
{
  return [a1 clearDeveloperDefaults];
}

id objc_msgSend_clearLastRefreshTSForHomes(void *a1, const char *a2, ...)
{
  return [a1 clearLastRefreshTSForHomes];
}

id objc_msgSend_clearPrivateAndSharedLocalData(void *a1, const char *a2, ...)
{
  return [a1 clearPrivateAndSharedLocalData];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return [a1 clientInfo];
}

id objc_msgSend_cloudManager(void *a1, const char *a2, ...)
{
  return [a1 cloudManager];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configURL(void *a1, const char *a2, ...)
{
  return [a1 configURL];
}

id objc_msgSend_configurationPublicKey(void *a1, const char *a2, ...)
{
  return [a1 configurationPublicKey];
}

id objc_msgSend_consumers(void *a1, const char *a2, ...)
{
  return [a1 consumers];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createMediaServiceObjectFromRecord(void *a1, const char *a2, ...)
{
  return [a1 createMediaServiceObjectFromRecord];
}

id objc_msgSend_createNewZoneIfMissing(void *a1, const char *a2, ...)
{
  return [a1 createNewZoneIfMissing];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_creationTime(void *a1, const char *a2, ...)
{
  return [a1 creationTime];
}

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return [a1 currentAccessory];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHome(void *a1, const char *a2, ...)
{
  return [a1 currentHome];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_databaseScope(void *a1, const char *a2, ...)
{
  return [a1 databaseScope];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_developerProfilesCount(void *a1, const char *a2, ...)
{
  return [a1 developerProfilesCount];
}

id objc_msgSend_deviceCanManageMultiUser(void *a1, const char *a2, ...)
{
  return [a1 deviceCanManageMultiUser];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return [a1 encryptedValues];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_eventDurations(void *a1, const char *a2, ...)
{
  return [a1 eventDurations];
}

id objc_msgSend_eventOccurance(void *a1, const char *a2, ...)
{
  return [a1 eventOccurance];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return [a1 expiration];
}

id objc_msgSend_fetchAllRecordZonesOperation(void *a1, const char *a2, ...)
{
  return [a1 fetchAllRecordZonesOperation];
}

id objc_msgSend_fetchInstalledMediaSetupProfilesManagedDefaults(void *a1, const char *a2, ...)
{
  return [a1 fetchInstalledMediaSetupProfilesManagedDefaults];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return [a1 fire];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fromUser(void *a1, const char *a2, ...)
{
  return [a1 fromUser];
}

id objc_msgSend_genericApplicationIcon(void *a1, const char *a2, ...)
{
  return [a1 genericApplicationIcon];
}

id objc_msgSend_getCachedPublicInfo(void *a1, const char *a2, ...)
{
  return [a1 getCachedPublicInfo];
}

id objc_msgSend_getLocalCachedImageURL(void *a1, const char *a2, ...)
{
  return [a1 getLocalCachedImageURL];
}

id objc_msgSend_hasAccessoryTypeHomePod(void *a1, const char *a2, ...)
{
  return [a1 hasAccessoryTypeHomePod];
}

id objc_msgSend_hasValidCredentials(void *a1, const char *a2, ...)
{
  return [a1 hasValidCredentials];
}

id objc_msgSend_homeID(void *a1, const char *a2, ...)
{
  return [a1 homeID];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return [a1 homeManager];
}

id objc_msgSend_homeUserID(void *a1, const char *a2, ...)
{
  return [a1 homeUserID];
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return [a1 homes];
}

id objc_msgSend_iTunesAccountName(void *a1, const char *a2, ...)
{
  return [a1 iTunesAccountName];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invitationTokenStatus(void *a1, const char *a2, ...)
{
  return [a1 invitationTokenStatus];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isCurrentUserHomeOwner(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUserHomeOwner];
}

id objc_msgSend_isCurrentUserRestrictedGuest(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUserRestrictedGuest];
}

id objc_msgSend_isDeveloperProfileLoaded(void *a1, const char *a2, ...)
{
  return [a1 isDeveloperProfileLoaded];
}

id objc_msgSend_isDeviceAppleTV(void *a1, const char *a2, ...)
{
  return [a1 isDeviceAppleTV];
}

id objc_msgSend_isDeviceAudioAccessory(void *a1, const char *a2, ...)
{
  return [a1 isDeviceAudioAccessory];
}

id objc_msgSend_isErrorFatal(void *a1, const char *a2, ...)
{
  return [a1 isErrorFatal];
}

id objc_msgSend_isHomeKitReady(void *a1, const char *a2, ...)
{
  return [a1 isHomeKitReady];
}

id objc_msgSend_isMultiUserEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMultiUserEnabled];
}

id objc_msgSend_isServiceRemovable(void *a1, const char *a2, ...)
{
  return [a1 isServiceRemovable];
}

id objc_msgSend_isWaitingForHomesToLoad(void *a1, const char *a2, ...)
{
  return [a1 isWaitingForHomesToLoad];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_occuranceLog(void *a1, const char *a2, ...)
{
  return [a1 occuranceLog];
}

id objc_msgSend_operationConfiguration(void *a1, const char *a2, ...)
{
  return [a1 operationConfiguration];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return [a1 ownerName];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return [a1 payloads];
}

id objc_msgSend_performanceLog(void *a1, const char *a2, ...)
{
  return [a1 performanceLog];
}

id objc_msgSend_permission(void *a1, const char *a2, ...)
{
  return [a1 permission];
}

id objc_msgSend_pointScale(void *a1, const char *a2, ...)
{
  return [a1 pointScale];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_processChangesInServices(void *a1, const char *a2, ...)
{
  return [a1 processChangesInServices];
}

id objc_msgSend_profilesEverInstalled(void *a1, const char *a2, ...)
{
  return [a1 profilesEverInstalled];
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 publicCloudDatabase];
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return [a1 pushTopic];
}

id objc_msgSend_queuedAwaitingCurrentHome(void *a1, const char *a2, ...)
{
  return [a1 queuedAwaitingCurrentHome];
}

id objc_msgSend_queuedPendingRequests(void *a1, const char *a2, ...)
{
  return [a1 queuedPendingRequests];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return [a1 recordType];
}

id objc_msgSend_recordZoneName(void *a1, const char *a2, ...)
{
  return [a1 recordZoneName];
}

id objc_msgSend_refreshDataAfterDelay(void *a1, const char *a2, ...)
{
  return [a1 refreshDataAfterDelay];
}

id objc_msgSend_releaseTransaction(void *a1, const char *a2, ...)
{
  return [a1 releaseTransaction];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeCachedIconImage(void *a1, const char *a2, ...)
{
  return [a1 removeCachedIconImage];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceID(void *a1, const char *a2, ...)
{
  return [a1 serviceID];
}

id objc_msgSend_serviceIconPath(void *a1, const char *a2, ...)
{
  return [a1 serviceIconPath];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_shareToken(void *a1, const char *a2, ...)
{
  return [a1 shareToken];
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return [a1 shareURL];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudDatabase];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedStatusController(void *a1, const char *a2, ...)
{
  return [a1 sharedStatusController];
}

id objc_msgSend_shouldEnablePushTopic(void *a1, const char *a2, ...)
{
  return [a1 shouldEnablePushTopic];
}

id objc_msgSend_shouldUseCloudKit(void *a1, const char *a2, ...)
{
  return [a1 shouldUseCloudKit];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_songsQuery(void *a1, const char *a2, ...)
{
  return [a1 songsQuery];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startupQueue(void *a1, const char *a2, ...)
{
  return [a1 startupQueue];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopwatch(void *a1, const char *a2, ...)
{
  return [a1 stopwatch];
}

id objc_msgSend_subscriptionStatus(void *a1, const char *a2, ...)
{
  return [a1 subscriptionStatus];
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return [a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_syncStatusOfInstalledProfiles(void *a1, const char *a2, ...)
{
  return [a1 syncStatusOfInstalledProfiles];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_timeInterval(void *a1, const char *a2, ...)
{
  return [a1 timeInterval];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_translateCKErrorToMSError(void *a1, const char *a2, ...)
{
  return [a1 translateCKErrorToMSError];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return [a1 trigger];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateListeningHistoryEnabled(void *a1, const char *a2, ...)
{
  return [a1 updateListeningHistoryEnabled];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userCloudShareManager(void *a1, const char *a2, ...)
{
  return [a1 userCloudShareManager];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInitiatedRequest(void *a1, const char *a2, ...)
{
  return [a1 userInitiatedRequest];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}