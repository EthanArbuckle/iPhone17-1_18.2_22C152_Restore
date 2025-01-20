void sub_100004EE4(id a1)
{
  uint64_t vars8;

  qword_100021260 = [[NADApplicationStore alloc] initWithURL:0];

  _objc_release_x1();
}

void sub_1000050C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000050D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000050E8(uint64_t a1)
{
}

void sub_1000050F0(uint64_t a1, uint64_t a2)
{
  id v6 = +[NSURL fileURLWithPath:a2];
  uint64_t v3 = [v6 URLByAppendingPathComponent:@"NanoAppRegistry"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100005508(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = nar_workspace_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000F5E0((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }

    objc_end_catch();
    JUMPOUT(0x10000540CLL);
  }
  _Unwind_Resume(exception_object);
}

NSString *__cdecl sub_100005574(id a1, NARApplication *a2)
{
  return (NSString *)[(NARApplication *)a2 applicationIdentifier];
}

id sub_10000557C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained stateDataWithHints:a2];

  return v4;
}

void sub_1000059A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000059C0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _allApplicationsIncludingHidden:*(unsigned __int8 *)(a1 + 48)];

  return _objc_release_x1();
}

id *sub_100005AC0(id *result)
{
  v1 = result;
  if (result[5])
  {
    result = [result[4] _allApplicationsIncludingHidden:*((unsigned __int8 *)result + 64)];
    *(void *)v1[5] = result;
  }
  if (v1[6])
  {
    result = [v1[4] UUID];
    *(void *)v1[6] = result;
  }
  if (v1[7])
  {
    result = [v1[4] sequenceNumber];
    *(void *)v1[7] = result;
  }
  return result;
}

void sub_10000676C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) applicationStore];
  [v1 removeAllEntities];
}

void sub_100006864(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationStore];
  [v2 insertApplication:*(void *)(a1 + 40)];
}

void sub_10000696C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationStore];
  [v2 removeApplicationWithBundleIdentifier:*(void *)(a1 + 40)];
}

void sub_100006A98(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationStore];
  [v2 setSequenceNumber:*(void *)(a1 + 40) UUID:*(void *)(a1 + 48)];
}

void sub_100006C70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL sub_100007940(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        v12 = objc_alloc_init(NARPBApplicationWrapper);
        objc_storeStrong((id *)(a1 + 8), v12);
        if (!PBReaderPlaceMark() || (sub_10000D550((uint64_t)v12, a2) & 1) == 0) {
          goto LABEL_28;
        }
LABEL_24:
        PBReaderRecallMark();

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    v12 = objc_alloc_init(NARPBWorkspaceMetadata);
    objc_storeStrong((id *)(a1 + 16), v12);
    if (!PBReaderPlaceMark() || (sub_100009A14((uint64_t)v12, a2) & 1) == 0)
    {
LABEL_28:

      return 0;
    }
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100008440(id a1, NADApplicationStoreTransaction *a2)
{
}

id sub_1000092CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairedSyncCoordinator];
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = @"Did not start an SYSession in time";
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  char v4 = +[NSError errorWithDomain:@"NARSyncErrorDomain" code:-1 userInfo:v3];
  [v2 syncDidFailWithError:v4];

  return objc_msgSend(*(id *)(a1 + 32), "lock_cancelWatchdogTimer");
}

id sub_100009488(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lock_cancelWatchdogTimer");
}

void sub_10000956C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock_cancelWatchdogTimer");
  id v2 = [*(id *)(a1 + 32) pairedSyncWatchdogQueue];
  uint64_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v2);

  dispatch_time_t v4 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100009670;
  handler[3] = &unk_100018598;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler(v3, handler);
  [*(id *)(a1 + 32) setPairedSyncWatchdogTimer:v3];
  dispatch_resume(v3);
}

id sub_100009670(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairedSyncWatchdogTimerFired];
}

void sub_10000981C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100009834(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_100009A14(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = PBReaderReadString();
      v18 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 24) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_10000A214(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 12) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            v18 = &OBJC_IVAR___NARPBApplicationStateWrapper__isRestricted;
            goto LABEL_37;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            break;
          }
          v12 += 7;
          BOOL v17 = v13++ > 8;
          if (v17)
          {
            uint64_t v14 = 0;
            v18 = &OBJC_IVAR___NARPBApplicationStateWrapper__isRestricted;
            goto LABEL_40;
          }
        }
        v18 = &OBJC_IVAR___NARPBApplicationStateWrapper__isRestricted;
LABEL_38:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_40:
        *(unsigned char *)(a1 + *v18) = v14 != 0;
        goto LABEL_41;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_41:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    char v19 = 0;
    unsigned int v20 = 0;
    uint64_t v14 = 0;
    *(unsigned char *)(a1 + 12) |= 1u;
    while (1)
    {
      unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
      v14 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0)
      {
        v18 = &OBJC_IVAR___NARPBApplicationStateWrapper__isRemovedSystemApp;
        goto LABEL_38;
      }
      v19 += 7;
      BOOL v17 = v20++ > 8;
      if (v17)
      {
        uint64_t v14 = 0;
        v18 = &OBJC_IVAR___NARPBApplicationStateWrapper__isRemovedSystemApp;
        goto LABEL_40;
      }
    }
    v18 = &OBJC_IVAR___NARPBApplicationStateWrapper__isRemovedSystemApp;
LABEL_37:
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_10000B7FC(void *a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v12 = v6 >> 3;
      if ((v6 >> 3) == 3)
      {
        uint64_t v14 = PBReaderReadString();
        if (v14) {
          [a1 addLocalizedValue:v14];
        }
        goto LABEL_25;
      }
      if (v12 == 2) {
        break;
      }
      if (v12 == 1)
      {
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = (void *)a1[2];
        a1[2] = v13;
LABEL_25:

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v14 = PBReaderReadString();
    if (v14) {
      [a1 addKey:v14];
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10000C31C(uint64_t a1)
{
  qword_100021270 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000C51C(uint64_t a1)
{
  id v2 = nar_workspace_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000FF7C(v2);
  }

  uint64_t v3 = [[NADSyncController alloc] initWithApplicationStore:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;
}

void sub_10000C5A8(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  uint64_t v3 = nar_workspace_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    unint64_t v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received XPC event %@", (uint8_t *)&v6, 0xCu);
  }

  string = xpc_dictionary_get_string(v2, "Notification");
  if (string)
  {
    unsigned int v5 = +[NSString stringWithUTF8String:string];
    [v5 isEqual:NRPairedDeviceRegistryDeviceDidPairDarwinNotification];
  }
}

id sub_10000C828(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NARApplication);
  uint64_t v3 = [v1 sparsePlistData];

  if (v3)
  {
    uint64_t v4 = [v1 sparsePlistData];
    unsigned int v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:0];

    [v2 setInfoPlist:v5];
  }
  int v6 = [v2 infoPlist];

  if (v6)
  {
    unint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v1 infoPlistLocalizationsCount]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v31 = v1;
    char v8 = [v1 infoPlistLocalizations];
    id v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v13 localizedValuesCount])
          {
            id v14 = [v13 localizedValuesCount];
            if (v14 == [v13 keysCount])
            {
              unint64_t v15 = [v13 localization];

              if (v15)
              {
                char v16 = [v13 localizedValues];
                BOOL v17 = [v13 keys];
                v18 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17];

                char v19 = [v13 localization];
                [v7 setObject:v18 forKeyedSubscript:v19];
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v10);
    }

    [v2 setLocalizedStrings:v7];
    id v1 = v31;
    id v20 = [v31 iTunesPlistKeysCount];
    if (v20 == [v31 iTunesPlistValuesCount])
    {
      unint64_t v21 = +[NSMutableDictionary dictionary];
      char v22 = [v31 iTunesPlistKeys];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10000CC74;
      v32[3] = &unk_1000186F0;
      id v33 = v31;
      id v34 = v21;
      id v23 = v21;
      [v22 enumerateObjectsUsingBlock:v32];

      [v2 setITunesPlistStrings:v23];
    }
    objc_msgSend(v2, "setSequenceNumber:", objc_msgSend(v31, "sequenceNumber"));
    v24 = [v31 launchServicesBundleType];
    [v2 setLaunchServicesBundleType:v24];

    v25 = [v31 appTags];
    [v2 setAppTags:v25];

    v26 = [v31 appState];
    id v27 = objc_msgSend(objc_alloc((Class)NARApplicationState), "initWithRestricted:removedSystemApp:", objc_msgSend(v26, "isRestricted"), objc_msgSend(v26, "isRemovedSystemApp"));
    [v2 setAppState:v27];

    if ([v31 hasSupportsForegroundApplication]) {
      uint64_t v28 = (uint64_t)[v31 supportsForegroundApplication];
    }
    else {
      uint64_t v28 = 1;
    }
    [v2 setSupportsForegroundApplication:v28];
    id v29 = v2;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

void sub_10000CC74(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 iTunesPlistValues];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v6];
}

uint64_t sub_10000D550(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 88) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_59;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_61;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_59:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_61:
        uint64_t v31 = 80;
        goto LABEL_66;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 72;
        goto LABEL_42;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 64;
        goto LABEL_42;
      case 4u:
        char v19 = objc_alloc_init(NARPBLocalizationInfo);
        [(id)a1 addInfoPlistLocalizations:v19];
        if (!PBReaderPlaceMark() || !sub_10000B7FC(v19, a2)) {
          goto LABEL_73;
        }
        goto LABEL_47;
      case 5u:
        PBReaderReadString();
        char v19 = (NARPBLocalizationInfo *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [(id)a1 addITunesPlistKeys:v19];
        }
        goto LABEL_50;
      case 6u:
        PBReaderReadString();
        char v19 = (NARPBLocalizationInfo *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [(id)a1 addITunesPlistValues:v19];
        }
        goto LABEL_50;
      case 7u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 88) |= 1u;
        while (2)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v14 |= (unint64_t)(v23 & 0x7F) << v20;
            if (v23 < 0)
            {
              v20 += 7;
              BOOL v9 = v21++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_65:
        uint64_t v31 = 56;
LABEL_66:
        *(_DWORD *)(a1 + v31) = v14;
        goto LABEL_71;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
LABEL_42:
        v24 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_71;
      case 0xBu:
        char v19 = objc_alloc_init(NARPBApplicationStateWrapper);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && sub_10000A214((uint64_t)v19, a2))
        {
LABEL_47:
          PBReaderRecallMark();
LABEL_50:

LABEL_71:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_73:

        return 0;
      case 0xCu:
        PBReaderReadString();
        char v19 = (NARPBLocalizationInfo *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [(id)a1 addAppTags:v19];
        }
        goto LABEL_50;
      case 0xDu:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 88) |= 4u;
        while (2)
        {
          unint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v29 == -1 || v29 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              BOOL v9 = v27++ >= 9;
              if (v9)
              {
                uint64_t v28 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v28 = 0;
        }
LABEL_70:
        *(unsigned char *)(a1 + 84) = v28 != 0;
        goto LABEL_71;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_71;
    }
  }
}

uint64_t start()
{
  id v1 = +[NADaemon sharedDaemon];
  [v1 setup];

  id v2 = +[NADaemon sharedDaemon];
  [v2 start];

  uint64_t v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0;
}

void sub_10000F574(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F5E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F64C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F6B8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "session: %@ didEndWithError: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000F740(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "syncSession: %@ rollbackChangesWithError:", (uint8_t *)&v2, 0xCu);
}

void sub_10000F7B8()
{
  sub_100009804();
  sub_100009834((void *)&_mh_execute_header, v0, (uint64_t)v0, "NARApplicationWorkspace has no applications; UUID %@ and sequenceNumber %@. Resetting store and requesting full sync.",
    v1);
}

void sub_10000F828()
{
  sub_100009804();
  sub_100009834((void *)&_mh_execute_header, v0, (uint64_t)v0, "NARApplicationWorkspace has application but has UUID %@ and sequenceNumber %@.  Requesting full sync since both must be non-nil.", v1);
}

void sub_10000F898(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10000981C((void *)&_mh_execute_header, a2, a3, "Service failed to resume: %@", (uint8_t *)&v3);
}

void sub_10000F908(void *a1, void *a2, NSObject *a3)
{
  __int16 v5 = [a1 identifier];
  uint64_t v6 = [a2 syncSession];
  unint64_t v7 = [v6 session];
  char v8 = [v7 identifier];
  int v10 = 138412546;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  unsigned int v13 = v8;
  sub_100009834((void *)&_mh_execute_header, a3, v9, "NADSyncController received startSession with id %@ while already in a session for %@.", (uint8_t *)&v10);
}

void sub_10000F9EC(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10000981C((void *)&_mh_execute_header, a2, a3, "Not starting sync session with error: %@", (uint8_t *)&v4);
}

void sub_10000FA60(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "service ended nil session", v1, 2u);
}

void sub_10000FAA4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  int v5 = 138412290;
  uint64_t v6 = v3;
  sub_10000981C((void *)&_mh_execute_header, a2, v4, "service ended session %@ but we don't have a sync session", (uint8_t *)&v5);
}

void sub_10000FB34(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 session];
  uint64_t v4 = [v3 identifier];
  int v6 = 138412290;
  unint64_t v7 = v4;
  sub_10000981C((void *)&_mh_execute_header, a2, v5, "NADSyncController session ended, but syncSession %@ is incomplete", (uint8_t *)&v6);
}

void sub_10000FBDC(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 identifier];
  int v6 = [a2 session];
  unint64_t v7 = [v6 identifier];
  int v9 = 138412546;
  int v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v7;
  sub_100009834((void *)&_mh_execute_header, a3, v8, "service endded session %@ but doesn't match our current sync session %@", (uint8_t *)&v9);
}

void sub_10000FCA8(void *a1, NSObject *a2)
{
  uint64_t v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a1 completedUnitCount]);
  uint64_t v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a1 totalUnitCount]);
  [a1 fractionCompleted];
  int v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  int v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sync session progress updated: %@/%@; %@",
    (uint8_t *)&v7,
    0x20u);
}

void sub_10000FDC0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PairedSync watchdog timer fired", v1, 2u);
}

void sub_10000FE04(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error removing application at directory: %@ - %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000FE8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error resetting application directory.  Couldn't delete - %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FF04(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error creating application directory: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FF7C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Starting sync controller", v1, 2u);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t NARWorkspaceServiceInterface()
{
  return _NARWorkspaceServiceInterface();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t nar_sync_log()
{
  return _nar_sync_log();
}

uint64_t nar_workspace_log()
{
  return _nar_workspace_log();
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

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createDirectoryIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createDirectoryIfNeeded];
}

id objc_msgSend__flushCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 _flushCommandQueue];
}

id objc_msgSend__loadEntitiesFromDisk(void *a1, const char *a2, ...)
{
  return [a1 _loadEntitiesFromDisk];
}

id objc_msgSend__resetStores(void *a1, const char *a2, ...)
{
  return [a1 _resetStores];
}

id objc_msgSend__storeMetadataURL(void *a1, const char *a2, ...)
{
  return [a1 _storeMetadataURL];
}

id objc_msgSend__writeStoreMetadata(void *a1, const char *a2, ...)
{
  return [a1 _writeStoreMetadata];
}

id objc_msgSend_activeSyncSession(void *a1, const char *a2, ...)
{
  return [a1 activeSyncSession];
}

id objc_msgSend_allEntities(void *a1, const char *a2, ...)
{
  return [a1 allEntities];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_appTags(void *a1, const char *a2, ...)
{
  return [a1 appTags];
}

id objc_msgSend_appTagsCount(void *a1, const char *a2, ...)
{
  return [a1 appTagsCount];
}

id objc_msgSend_applicationDirectory(void *a1, const char *a2, ...)
{
  return [a1 applicationDirectory];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationSerializer(void *a1, const char *a2, ...)
{
  return [a1 applicationSerializer];
}

id objc_msgSend_applicationStore(void *a1, const char *a2, ...)
{
  return [a1 applicationStore];
}

id objc_msgSend_applicationWrapper(void *a1, const char *a2, ...)
{
  return [a1 applicationWrapper];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelWatchdogTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelWatchdogTimer];
}

id objc_msgSend_clearAppTags(void *a1, const char *a2, ...)
{
  return [a1 clearAppTags];
}

id objc_msgSend_clearITunesPlistKeys(void *a1, const char *a2, ...)
{
  return [a1 clearITunesPlistKeys];
}

id objc_msgSend_clearITunesPlistValues(void *a1, const char *a2, ...)
{
  return [a1 clearITunesPlistValues];
}

id objc_msgSend_clearInfoPlistLocalizations(void *a1, const char *a2, ...)
{
  return [a1 clearInfoPlistLocalizations];
}

id objc_msgSend_clearKeys(void *a1, const char *a2, ...)
{
  return [a1 clearKeys];
}

id objc_msgSend_clearLocalizedValues(void *a1, const char *a2, ...)
{
  return [a1 clearLocalizedValues];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commandQueue(void *a1, const char *a2, ...)
{
  return [a1 commandQueue];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultURL(void *a1, const char *a2, ...)
{
  return [a1 defaultURL];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_destinationURL(void *a1, const char *a2, ...)
{
  return [a1 destinationURL];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return [a1 directory];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_entityClass(void *a1, const char *a2, ...)
{
  return [a1 entityClass];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_hasSupportsForegroundApplication(void *a1, const char *a2, ...)
{
  return [a1 hasSupportsForegroundApplication];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iTunesPlistKeys(void *a1, const char *a2, ...)
{
  return [a1 iTunesPlistKeys];
}

id objc_msgSend_iTunesPlistKeysCount(void *a1, const char *a2, ...)
{
  return [a1 iTunesPlistKeysCount];
}

id objc_msgSend_iTunesPlistValues(void *a1, const char *a2, ...)
{
  return [a1 iTunesPlistValues];
}

id objc_msgSend_iTunesPlistValuesCount(void *a1, const char *a2, ...)
{
  return [a1 iTunesPlistValuesCount];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoPlist(void *a1, const char *a2, ...)
{
  return [a1 infoPlist];
}

id objc_msgSend_infoPlistLocalizations(void *a1, const char *a2, ...)
{
  return [a1 infoPlistLocalizations];
}

id objc_msgSend_infoPlistLocalizationsCount(void *a1, const char *a2, ...)
{
  return [a1 infoPlistLocalizationsCount];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isFinalized(void *a1, const char *a2, ...)
{
  return [a1 isFinalized];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isRemovedSystemApp(void *a1, const char *a2, ...)
{
  return [a1 isRemovedSystemApp];
}

id objc_msgSend_isResetSync(void *a1, const char *a2, ...)
{
  return [a1 isResetSync];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return [a1 isRestricted];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_keysCount(void *a1, const char *a2, ...)
{
  return [a1 keysCount];
}

id objc_msgSend_launchServicesBundleType(void *a1, const char *a2, ...)
{
  return [a1 launchServicesBundleType];
}

id objc_msgSend_legacyDefaultURL(void *a1, const char *a2, ...)
{
  return [a1 legacyDefaultURL];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localization(void *a1, const char *a2, ...)
{
  return [a1 localization];
}

id objc_msgSend_localizedValues(void *a1, const char *a2, ...)
{
  return [a1 localizedValues];
}

id objc_msgSend_localizedValuesCount(void *a1, const char *a2, ...)
{
  return [a1 localizedValuesCount];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_migrate(void *a1, const char *a2, ...)
{
  return [a1 migrate];
}

id objc_msgSend_migrateFixedLibraryPathIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 migrateFixedLibraryPathIfNeeded];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_objectIdentifier(void *a1, const char *a2, ...)
{
  return [a1 objectIdentifier];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return [a1 pairedDevice];
}

id objc_msgSend_pairedSyncCoordinator(void *a1, const char *a2, ...)
{
  return [a1 pairedSyncCoordinator];
}

id objc_msgSend_pairedSyncWatchdogQueue(void *a1, const char *a2, ...)
{
  return [a1 pairedSyncWatchdogQueue];
}

id objc_msgSend_pairedSyncWatchdogTimer(void *a1, const char *a2, ...)
{
  return [a1 pairedSyncWatchdogTimer];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_parentApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 parentApplicationBundleIdentifier];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_registerForLaunchEvents(void *a1, const char *a2, ...)
{
  return [a1 registerForLaunchEvents];
}

id objc_msgSend_removeAllEntities(void *a1, const char *a2, ...)
{
  return [a1 removeAllEntities];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return [a1 rollback];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduleWatchdogTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleWatchdogTimer];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 sequenceNumber];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionMetadata(void *a1, const char *a2, ...)
{
  return [a1 sessionMetadata];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsResetSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetSync];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return [a1 sourceURL];
}

id objc_msgSend_sparsePlistData(void *a1, const char *a2, ...)
{
  return [a1 sparsePlistData];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startSyncControllerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 startSyncControllerIfNeeded];
}

id objc_msgSend_supportsForegroundApplication(void *a1, const char *a2, ...)
{
  return [a1 supportsForegroundApplication];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncRestriction(void *a1, const char *a2, ...)
{
  return [a1 syncRestriction];
}

id objc_msgSend_syncSession(void *a1, const char *a2, ...)
{
  return [a1 syncSession];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_timerLock(void *a1, const char *a2, ...)
{
  return [a1 timerLock];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_uUID(void *a1, const char *a2, ...)
{
  return [a1 uUID];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_workspaceMetadata(void *a1, const char *a2, ...)
{
  return [a1 workspaceMetadata];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}