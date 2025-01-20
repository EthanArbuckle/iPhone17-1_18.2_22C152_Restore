void sub_1000034A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000034C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = CarDNDWDLogging();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10006ED1C(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_10006ECA0(a1, v5);
  }
}

void sub_100003710(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000037F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000380C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) dismissAlert:v3];
  }
}

void sub_10000433C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100004358(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_10000439C(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t sub_1000044D4()
{
  return objc_opt_isKindOfClass() & 1;
}

void sub_1000045BC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_100004B74(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  SInt32 v2 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C34;
  block[3] = &unk_1000BD138;
  SInt32 v7 = v2;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  CFOptionFlags v6 = responseFlags;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100004C34(uint64_t a1)
{
  SInt32 v2 = [*(id *)(a1 + 32) alertDismissTimer];
  unsigned int v3 = [v2 isValid];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) alertDismissTimer];
    [v4 invalidate];

    [*(id *)(a1 + 32) setAlertDismissTimer:0];
  }
  if ([*(id *)(a1 + 32) requiresUnlockedDevice]) {
    char v5 = [*(id *)(a1 + 32) _isDeviceUnlocked] ^ 1;
  }
  else {
    char v5 = 0;
  }
  unsigned int v6 = [*(id *)(a1 + 32) alertAutoDismissed];
  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  if ((v6 & 1) == 0 && (v5 & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 56) || (uint64_t v8 = *(void *)(a1 + 48) & 3, v8 == 3)) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = qword_10008CDF8[v8];
    }
  }
  [*(id *)(a1 + 32) _setAlert:0];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7);
  }
  v10 = *(void **)(a1 + 32);

  return [v10 setAlertAutoDismissed:0];
}

id sub_100004D44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dismissAlert];
  unsigned int v3 = *(void **)(a1 + 32);

  return [v3 setAlertAutoDismissed:v2];
}

id sub_100005578(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10006EFD0();
  }

  return [*(id *)(a1 + 32) _start];
}

id sub_10000563C(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10006F004();
  }

  return [*(id *)(a1 + 32) _stop];
}

void sub_1000058C8(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006188;
  block[3] = &unk_1000BD1B0;
  id v4 = a2;
  id v2 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100006188(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeDidChangeSignificantly];
}

void sub_100006190(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000061B8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100008CA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A6D8;
  v9[3] = &unk_1000BD1F8;
  v9[4] = a1;
  id v4 = +[NSPredicate predicateWithBlock:v9];
  char v5 = [v3 filteredArrayUsingPredicate:v4];
  id v6 = [v5 count];

  if (!v6) {
    id v7 = v3;
  }
  else {
LABEL_4:
  }
    id v7 = 0;

  return v7;
}

id sub_100008DA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = [v6 allKeys];
    uint64_t v8 = sub_100008CA0(a1, v7);

    if (v8)
    {
      uint64_t v9 = [v6 allValues];
      sub_100008CA0(a2, v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10) {
        id v10 = v6;
      }
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

void sub_100009A60(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKey:@"name"];
  uint64_t v8 = [a1[4] _matchingKeychainItemForIdentifier:v5 inKeychainItems:a1[5]];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 objectForKey:kSecValueData];
    v11 = [v9 objectForKey:kSecAttrGeneric];
    v12 = v11;
    v20 = v7;
    if (v11)
    {
      unsigned int v23 = 0;
      [v11 getBytes:&v23 length:4];
      uint64_t v13 = bswap32(v23);
      unsigned int v23 = v13;
      if ((unint64_t)[v12 length] < 5)
      {
        uint64_t v14 = 0;
      }
      else
      {
        unsigned int v22 = 0;
        [v12 getBytes:&v22 range:4];
        uint64_t v14 = bswap32(v22);
      }
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v13 = 0;
    }
    [a1[5] removeObject:v9, v20];
    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
    if (v15)
    {
      v16 = (void *)v10;
      v17 = [objc_alloc((Class)CRVehicle) initWithIdentifier:v15 certificateSerial:v10];
      v18 = v17;
      if (!v17)
      {
        v19 = CarGeneralLogging();
        id v7 = v21;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10006F764();
        }

        goto LABEL_19;
      }
      [v17 setPairingStatus:v13];
      if (v14)
      {
        [v18 setSupportsEnhancedIntegration:1];
        [v18 setEnhancedIntegrationStatus:v14];
      }
      [(id)objc_opt_class() _applyPreferencesAttributes:v6 toVehicle:v18];
      [a1[6] addObject:v18];
    }
    else
    {
      v16 = (void *)v10;
      v18 = CarGeneralLogging();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10006F6EC((uint64_t)v5, v18);
      }
    }
    id v7 = v21;
LABEL_19:

    goto LABEL_20;
  }
  [(id)objc_opt_class() _cleanupPreferencesForIncompleteVehicleIdentifier:v5 name:v7];
LABEL_20:
}

void sub_100009EAC(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateCachedVehicles];
  id v2 = [*(id *)(a1 + 32) allStoredVehicles];
  id v3 = [v2 count];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) observers];
    [v4 vehicleStoreDidBecomeAvailable:*(void *)(a1 + 32)];

    id v5 = objc_opt_class();
    [v5 postPairingsDidChangeNotification];
  }
}

void sub_10000A5E4()
{
}

BOOL sub_10000A6D8()
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

void sub_10000A704(id a1)
{
}

void sub_10000A728(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000A778(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10000A798(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000AE98(id a1)
{
  qword_1000E3838 = objc_alloc_init(CRDictationService);

  _objc_release_x1();
}

void sub_10000AFE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B4DC(void *a1)
{
  id v2 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = a1[7] + 1;
    if (v3 >= 6)
    {
      uint64_t v4 = +[NSString stringWithFormat:@"Unknown (%ld)", a1[7]];
    }
    else
    {
      uint64_t v4 = off_1000BD370[v3];
    }
    id v5 = (void *)a1[4];
    id v6 = v4;
    uint64_t v7 = [v5 transcription];
    uint64_t v8 = (void *)v7;
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    else {
      CFStringRef v9 = @"(no result)";
    }
    uint64_t v10 = a1[5];

    *(_DWORD *)buf = 138412803;
    uint64_t v13 = v4;
    __int16 v14 = 2113;
    CFStringRef v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dictation state: (%@) %{private}@ (error: %{public}@)", buf, 0x20u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

Class sub_10000C210(uint64_t a1)
{
  if (!sub_10000C2A0())
  {
    unint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("AFDictationConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000E3848 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10006F844();
    return (Class)sub_10000C2A0();
  }
  return result;
}

uint64_t sub_10000C2A0()
{
  if (!qword_1000E3850) {
    qword_1000E3850 = _sl_dlopen();
  }
  return qword_1000E3850;
}

uint64_t sub_10000C370()
{
  uint64_t result = _sl_dlopen();
  qword_1000E3850 = result;
  return result;
}

void sub_10000C724(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) channel];
  if (v2)
  {

    goto LABEL_3;
  }
  uint64_t v8 = [*(id *)(a1 + 32) channel];
  CFStringRef v9 = [v8 outputStream];
  if ([v9 streamStatus] == (id)2)
  {
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) channel];
    v11 = [v10 outputStream];
    id v12 = [v11 streamStatus];

    if (v12 != (id)4)
    {
LABEL_3:
      unint64_t v3 = [*(id *)(a1 + 32) channel];
      uint64_t v4 = [v3 outputStream];
      uint64_t v5 = (uint64_t)[v4 write:[*(id *)(a1 + 40) bytes] maxLength:[*(id *)(a1 + 40) length]];

      uint64_t v6 = [*(id *)(a1 + 32) channelDelegate];
      __int16 v14 = (void *)v6;
      if (v5 >= 1 && (v7 = [*(id *)(a1 + 40) length], uint64_t v6 = (uint64_t)v14, (id)v5 == v7))
      {
        if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v14 bluetoothLEChannel:*(void *)(a1 + 32) didSendData:*(void *)(a1 + 40)];
        }
      }
      else if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v14 bluetoothLEChannel:*(void *)(a1 + 32) didFailToSendData:*(void *)(a1 + 40)];
      }
      _objc_release_x4();
      return;
    }
  }
  uint64_t v13 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10006F86C();
  }
}

void sub_10000C9AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) channel];
  unint64_t v3 = [v2 inputStream];
  if ([v3 streamStatus] == (id)2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) channel];
    uint64_t v5 = [v4 outputStream];
    id v6 = [v5 streamStatus];

    if (v6 == (id)2)
    {
      unsigned int v7 = [*(id *)(a1 + 32) isOpen];
      uint64_t v8 = sub_10005C6FC(2uLL);
      CFStringRef v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          __int16 v17 = 0;
          uint64_t v10 = "L2CAP channel already opened";
          v11 = (uint8_t *)&v17;
          id v12 = v9;
          os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v12, v13, v10, v11, 2u);
          goto LABEL_10;
        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "L2CAP channel opened", v16, 2u);
        }

        [*(id *)(a1 + 32) setOpen:1];
        __int16 v14 = [*(id *)(a1 + 32) service];
        CFStringRef v9 = [v14 serviceDelegate];

        if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          CFStringRef v15 = [*(id *)(a1 + 32) service];
          [v9 bluetoothLEService:v15 didOpenChannel:*(void *)(a1 + 32)];
        }
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  CFStringRef v9 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v10 = "waiting for both streams to open";
    v11 = buf;
    id v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_9;
  }
LABEL_10:
}

void sub_10000CC50(uint64_t a1)
{
  id v2 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10006F8A0();
  }

  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) channel];
  uint64_t v5 = [v4 inputStream];
  LODWORD(v3) = [v3 isEqual:v5];

  if (v3)
  {
    *(void *)&long long v6 = 138412290;
    long long v12 = v6;
    do
    {
      uint64_t v7 = (uint64_t)[*(id *)(a1 + 32) read:v15 maxLength:1024, v12];
      if (v7 < 1) {
        break;
      }
      uint64_t v8 = v7;
      id v9 = [objc_alloc((Class)NSData) initWithBytes:v15 length:v7];
      uint64_t v10 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v12;
        id v14 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "received data %@", buf, 0xCu);
      }

      v11 = [*(id *)(a1 + 40) channelDelegate];
      if (v11)
      {
        if (objc_opt_respondsToSelector()) {
          [v11 bluetoothLEChannel:*(void *)(a1 + 40) didReceiveData:v9];
        }
      }
    }
    while (v8 == 1024);
  }
}

id sub_10000CEDC(uint64_t a1)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v2 = (id *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) channel];
  uint64_t v5 = [v4 inputStream];
  LODWORD(v3) = [v3 isEqual:v5];

  if (v3)
  {
    long long v6 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006F8E0(v2, v6);
    }
LABEL_7:

    return [*(id *)(a1 + 40) _serviceQueue_handleChannelClosed];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) channel];
  id v9 = [v8 outputStream];
  LODWORD(v7) = [v7 isEqual:v9];

  if (v7)
  {
    long long v6 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006F974(v2, v6);
    }
    goto LABEL_7;
  }
  return [*(id *)(a1 + 40) _serviceQueue_handleChannelClosed];
}

id sub_10000D0A8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) channel];
  uint64_t v4 = [v3 inputStream];
  LODWORD(v2) = [v2 isEqual:v4];

  if (v2)
  {
    uint64_t v5 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = [*(id *)(a1 + 32) streamError];
      *(_DWORD *)long long v12 = 138412290;
      *(void *)&v12[4] = v6;
      uint64_t v7 = "L2CAP input stream closed: %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v12, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) channel];
  uint64_t v10 = [v9 outputStream];
  LODWORD(v8) = [v8 isEqual:v10];

  if (v8)
  {
    uint64_t v5 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = [*(id *)(a1 + 32) streamError];
      *(_DWORD *)long long v12 = 138412290;
      *(void *)&v12[4] = v6;
      uint64_t v7 = "L2CAP output stream closed: %@";
      goto LABEL_7;
    }
LABEL_8:
  }
  return [*(id *)(a1 + 40) _serviceQueue_handleChannelClosed:*(_OWORD *)v12];
}

void sub_10000D7C8(uint64_t a1)
{
  id v2 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = [*(id *)(a1 + 32) serviceUUID];
    uint64_t v4 = [v3 UUIDString];
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "starting discovery for service %@", buf, 0xCu);
  }
  uint64_t v5 = objc_alloc_init(CARBluetoothLEConnectionState);
  [*(id *)(a1 + 32) setCurrentConnectionState:v5];
  long long v6 = [*(id *)(a1 + 32) peripheral];
  uint64_t v7 = [*(id *)(a1 + 32) serviceUUID];
  id v9 = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v6 discoverServices:v8];
}

void sub_10000DA38(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v2 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10006FA08(v1, v2, v3);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) currentConnectionState];
    unsigned int v6 = [v5 discoveredService];

    if (v6)
    {
      id v2 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [*(id *)(a1 + 48) services];
        *(_DWORD *)buf = 138412290;
        v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "didDiscoverServices but already discovered desired service. All discovered services: %@", buf, 0xCu);
      }
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v2 = [*(id *)(a1 + 48) services];
      id v8 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v2);
            }
            long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            os_log_type_t v13 = sub_10005C6FC(2uLL);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v12;
              _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "discovered service %@", buf, 0xCu);
            }

            id v14 = [*(id *)(a1 + 40) serviceUUID];
            CFStringRef v15 = [v12 UUID];
            unsigned int v16 = [v14 isEqual:v15];

            if (v16)
            {
              __int16 v17 = sub_10005C6FC(2uLL);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "discovered the service, starting characteristic discovery", buf, 2u);
              }

              v18 = [*(id *)(a1 + 40) currentConnectionState];
              [v18 setDiscoveredService:1];

              v19 = [*(id *)(a1 + 40) peripheral];
              v20 = [*(id *)(a1 + 40) psmCharacteristicUUID];
              v26 = v20;
              v21 = +[NSArray arrayWithObjects:&v26 count:1];
              [v19 discoverCharacteristics:v21 forService:v12];

              goto LABEL_4;
            }
          }
          id v9 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_4:
}

void sub_10000DE3C(id *a1)
{
  id v2 = [a1[4] serviceUUID];
  uint64_t v3 = [a1[5] UUID];
  unsigned __int8 v4 = [v2 isEqual:v3];

  if (v4)
  {
    uint64_t v5 = [a1[4] currentConnectionState];
    unsigned int v6 = [v5 discoveredPSMCharacteristic];

    if (v6)
    {
      uint64_t v7 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [a1[5] characteristics];
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didDiscoverCharacteristicsForService but already discovered desired characteristic. All discovered characteristics: %@", buf, 0xCu);
      }
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v7 = [a1[5] characteristics];
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        id v11 = v9;
        uint64_t v12 = *(void *)v23;
        *(void *)&long long v10 = 138412290;
        long long v21 = v10;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v7);
            }
            id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            CFStringRef v15 = [v14 UUID:v21];
            unsigned int v16 = sub_10005C6FC(2uLL);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v21;
              v28 = v15;
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "discovered characteristic %@", buf, 0xCu);
            }

            __int16 v17 = [a1[4] psmCharacteristicUUID];
            unsigned int v18 = [v17 isEqual:v15];

            if (v18)
            {
              v19 = sub_10005C6FC(2uLL);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "found L2CAP characteristic, attempting to read PSM value", buf, 2u);
              }

              v20 = [a1[4] currentConnectionState];
              [v20 setDiscoveredPSMCharacteristic:1];

              [a1[6] setNotifyValue:1 forCharacteristic:v14];
              [a1[6] readValueForCharacteristic:v14];
            }
          }
          id v11 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v7 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didDiscoverCharacteristicsForService on a different service than desired", buf, 2u);
    }
  }
}

void sub_10000E244(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceUUID];
  uint64_t v3 = [*(id *)(a1 + 40) service];
  unsigned __int8 v4 = [v3 UUID];
  unsigned int v5 = [v2 isEqual:v4];

  if (v5)
  {
    unsigned int v6 = [*(id *)(a1 + 32) psmCharacteristicUUID];
    uint64_t v7 = [*(id *)(a1 + 40) UUID];
    unsigned __int8 v8 = [v6 isEqual:v7];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) currentConnectionState];
      long long v10 = [v9 PSM];

      if (v10)
      {
        id v11 = sub_10005C6FC(2uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [*(id *)(a1 + 32) currentConnectionState];
          os_log_type_t v13 = [v12 PSM];
          *(_DWORD *)buf = 138412290;
          long long v24 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "already attempting to open channel with PSM: %@", buf, 0xCu);
        }
      }
      else
      {
        unsigned int v16 = [*(id *)(a1 + 40) value];
        id v11 = v16;
        if (v16)
        {
          unsigned __int16 v22 = 0;
          [v16 getBytes:&v22 length:2];
          uint64_t v17 = bswap32(v22) >> 16;
          unsigned int v18 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v24) = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "PSM value is %hu", buf, 8u);
          }

          v19 = [*(id *)(a1 + 32) currentConnectionState];
          v20 = +[NSNumber numberWithUnsignedShort:v17];
          [v19 setPSM:v20];

          long long v21 = [*(id *)(a1 + 32) peripheral];
          [v21 openL2CAPChannel:v17];
        }
        else
        {
          long long v21 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10006FA7C();
          }
        }
      }
    }
    else
    {
      id v11 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v14 = *(void **)(a1 + 40);
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        long long v24 = v14;
        __int16 v25 = 2112;
        uint64_t v26 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ignoring didUpdateValueForCharacteristic: %@, error: %@", buf, 0x16u);
      }
    }
  }
}

void sub_10000E61C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 48) currentConnectionState];
    uint64_t v3 = v2;
    if (v2)
    {
      unsigned __int8 v4 = [v2 serviceChannel];

      if (v4)
      {
        sub_10005C6FC(2uLL);
        unsigned int v5 = (CARBluetoothLEChannel *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          uint64_t v7 = [v3 serviceChannel];
          unsigned __int8 v8 = [v7 channel];
          int v19 = 138412546;
          uint64_t v20 = v6;
          __int16 v21 = 2112;
          unsigned __int16 v22 = v8;
          _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "ignoring didOpenL2CAPChannel for channel %@, already opened channel %@", (uint8_t *)&v19, 0x16u);
        }
      }
      else
      {
        uint64_t v10 = [v3 PSM];
        if (v10
          && (id v11 = (void *)v10,
              [v3 PSM],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              unsigned int v13 = [v12 unsignedShortValue],
              unsigned int v14 = [*(id *)(a1 + 32) PSM],
              v12,
              v11,
              v13 == v14))
        {
          uint64_t v15 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = *(void *)(a1 + 32);
            int v19 = 138412290;
            uint64_t v20 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "opening L2CAP channel %@", (uint8_t *)&v19, 0xCu);
          }

          unsigned int v5 = [[CARBluetoothLEChannel alloc] initWithService:*(void *)(a1 + 48) channel:*(void *)(a1 + 32)];
          uint64_t v17 = [*(id *)(a1 + 48) currentConnectionState];
          [v17 setServiceChannel:v5];
        }
        else
        {
          sub_10005C6FC(2uLL);
          unsigned int v5 = (CARBluetoothLEChannel *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v18 = [*(id *)(a1 + 32) PSM];
            int v19 = 67109120;
            LODWORD(v20) = v18;
            _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "ignoring didOpenL2CAPChannel for unknown PSM %hu", (uint8_t *)&v19, 8u);
          }
        }
      }
    }
    else
    {
      sub_10005C6FC(2uLL);
      unsigned int v5 = (CARBluetoothLEChannel *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
        sub_10006FB24();
      }
    }
  }
  else
  {
    uint64_t v3 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10006FAB0(a1, v3, v9);
    }
  }
}

void sub_10000E9C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000E9DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000F4E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000105C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000105E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000105F8(uint64_t a1)
{
}

void sub_100010600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  objc_opt_class();
  id v7 = v6;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = sub_10005C6FC(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v13 = 138477827;
    uint64_t v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "fetched digital car info: %{private}@", (uint8_t *)&v13, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100010B24(uint64_t a1, void *a2, const __CFString *a3)
{
  id v5 = a2;
  CFComparisonResult v4 = CFStringCompare(kCMVehicleConnectedNotification, a3, 0);
  if (v4 == kCFCompareEqualTo || CFEqual(kCMVehicleDisconnectedNotification, a3)) {
    [v5 setConnected:v4 == kCFCompareEqualTo];
  }
  [v5 _checkVehicleState];
}

id sub_100010BBC(uint64_t a1, void *a2)
{
  return [a2 _checkVehicleState];
}

void sub_100010BC4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 delegate];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isInLostMode]);
  id v7 = CarDNDWDLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device lost state is currently: %@", buf, 0xCu);
  }

  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000115CC;
    block[3] = &unk_1000BD3D0;
    id v9 = v5;
    id v10 = v4;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_1000115CC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) BOOLValue];

  return [v1 stateMachine:v2 receivedFMDMode:v3];
}

void sub_1000117F8(id a1)
{
  uint64_t v1 = CarCertificationOverrideLogging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "certification override service connection interrupted", v2, 2u);
  }
}

void sub_100011860(id a1)
{
  uint64_t v1 = CarCertificationOverrideLogging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "certification override service connection invalidated", v2, 2u);
  }
}

BOOL sub_100011BBC(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void sub_100011DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001312C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000131C8;
  v5[3] = &unk_1000BD3A8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_1000131C8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activelyMonitoringGeofences])
  {
    if (![*(id *)(a1 + 32) _shouldCreateGeofences]) {
      return;
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v2 = *(id *)(a1 + 40);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(a1 + 32);
          id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * i) locationOfInterest:v9];
          [v7 _createGeofenceForLOI:v8];
        }
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v2 = CarDNDWDLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cancelling geofences for predicted locations - no longer actively monitoring.", buf, 2u);
    }
  }
}

void sub_1000134B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013554;
  v5[3] = &unk_1000BD3A8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100013554(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activelyMonitoringGeofences])
  {
    if (![*(id *)(a1 + 32) _shouldCreateGeofences]) {
      return;
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v2 = *(id *)(a1 + 40);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          id v8 = CarDNDWDLogging();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating fence for home", buf, 2u);
          }

          [*(id *)(a1 + 32) _createGeofenceForLOI:v7];
        }
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v2 = CarDNDWDLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cancelling geofences for home location - no longer actively monitoring.", buf, 2u);
    }
  }
}

void sub_100013704(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000137A0;
  v5[3] = &unk_1000BD3A8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_1000137A0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activelyMonitoringGeofences])
  {
    if (![*(id *)(a1 + 32) _shouldCreateGeofences]) {
      return;
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v2 = *(id *)(a1 + 40);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          id v8 = CarDNDWDLogging();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating fence for work", buf, 2u);
          }

          [*(id *)(a1 + 32) _createGeofenceForLOI:v7];
        }
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v2 = CarDNDWDLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cancelling geofences for work location - no longer actively monitoring.", buf, 2u);
    }
  }
}

id sub_1000139C4(uint64_t a1)
{
  [*(id *)(a1 + 32) setLocationServicesEnabled:CRAutomaticDNDLocationServicesEnabled()];
  if ([*(id *)(a1 + 32) activelyMonitoringGeofences]
    && ([*(id *)(a1 + 32) locationServicesEnabled] & 1) == 0)
  {
    id v4 = CarDNDWDLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deactivating geofences since location services are now disabled", buf, 2u);
    }

    return [*(id *)(a1 + 32) stopMonitoringLOIs];
  }
  else
  {
    id result = [*(id *)(a1 + 32) isDNDActive];
    if (result)
    {
      id result = [*(id *)(a1 + 32) locationServicesEnabled];
      if (result)
      {
        id v3 = CarDNDWDLogging();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v5 = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating geofences since location services are now enabled", v5, 2u);
        }

        return [*(id *)(a1 + 32) beginMonitoringLOIsWithStartingLocationGeofence:[*(id *)(a1 + 32) shouldCreateGeofenceAroundStart]];
      }
    }
  }
  return result;
}

void sub_100013B78(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    uint64_t v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v6 = "Received location update, but nil location";
      uint64_t v7 = (uint8_t *)&v14;
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  if (([*(id *)(a1 + 40) activelyMonitoringGeofences] & 1) == 0)
  {
    uint64_t v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Received location update, but no longer monitoring";
      uint64_t v7 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v2 = [*(id *)(a1 + 32) timestamp];
  [v2 timeIntervalSinceNow];
  double v4 = fabs(v3);

  if (v4 > 30.0)
  {
    uint64_t v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v6 = "Received location update, but age is too old";
      uint64_t v7 = (uint8_t *)&v12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 40) shouldCreateGeofenceAroundStart]
    && ([*(id *)(a1 + 40) didCreateGeofenceAroundStart] & 1) == 0)
  {
    id v8 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) coordinate];
    long long v9 = [v8 _addCoordinatesToMonitoredRegion:@"Start Identifier" identifier:100 radius:100];
    [v9 setRegionState:1];
    [*(id *)(a1 + 40) setDidCreateGeofenceAroundStart:1];
    [*(id *)(a1 + 40) setIsCurrentlyInsideGeofence:1];
    long long v10 = CarDNDWDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating start geofence around received location", v11, 2u);
    }

    [*(id *)(a1 + 40) _postNotificationForGeofence];
  }
  [*(id *)(a1 + 40) _createGeofencesAroundPredictedLocationsFromLocation:*(void *)(a1 + 32)];
}

id sub_100013FA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState:1 forRegion:*(void *)(a1 + 40)];
}

id sub_100014114(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState:2 forRegion:*(void *)(a1 + 40)];
}

id sub_100014274(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState:*(void *)(a1 + 48) forRegion:*(void *)(a1 + 40)];
}

Class sub_100014578(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000E3860)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000146BC;
    v4[4] = &unk_1000BD350;
    v4[5] = v4;
    long long v5 = off_1000BD4E8;
    uint64_t v6 = 0;
    qword_1000E3860 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1000E3860)
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
    Class result = objc_getClass("RTRoutineManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_100070284();
LABEL_8:
    free(v2);
  }
  qword_1000E3858 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000146BC()
{
  uint64_t result = _sl_dlopen();
  qword_1000E3860 = result;
  return result;
}

void sub_100014730(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000148A4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong(WeakRetained + 1, *(id *)(a1 + 32));
  double v3 = [WeakRetained delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v3 shouldPresentHeadUnitPairingPromptSession:WeakRetained];
    if (*(void *)(a1 + 40))
    {
      id v5 = v4;
      uint64_t v6 = CarPairingLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v7 = @"NO";
        if (v5) {
          CFStringRef v7 = @"YES";
        }
        int v11 = 138543362;
        CFStringRef v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "wantsToPresentHeadUnitPairingPrompt: %{public}@", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v8 = *(void *)(a1 + 40);
      long long v9 = +[NSNumber numberWithBool:v5];
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, 0);
    }
  }
}

void sub_100014B40(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  objc_storeStrong(WeakRetained + 1, a1[4]);
  double v3 = [WeakRetained delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100014C48;
    v5[3] = &unk_1000BD530;
    id v6 = a1[5];
    [WeakRetained setPairingPromptCompletion:v5];
    [v3 presentHeadUnitPairingForPromptSession:WeakRetained];
  }
  else
  {
    id v4 = a1[5];
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

void sub_100014C48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = CarPairingLogging();
  CFStringRef v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "presentHeadUnitPairingPrompt completed", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100070334((uint64_t)v5, v7);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

void sub_100014E38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = *(void **)(a1 + 32);
  id v4 = [WeakRetained keyIdentifier];
  LOBYTE(v3) = [v3 isEqualToString:v4];

  if ((v3 & 1) == 0)
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10007043C(v5);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
    }
  }
  CFStringRef v7 = [WeakRetained delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v7 handleHeadUnitPairingPromptSession:WeakRetained receivedResponse:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      long long v9 = *(void (**)(void))(v8 + 16);
LABEL_12:
      v9();
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      long long v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_12;
    }
  }
}

void sub_100015160(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_100015184(id *a1, char a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015250;
  v4[3] = &unk_1000BD558;
  objc_copyWeak(&v7, a1 + 6);
  char v8 = a2;
  id v5 = a1[4];
  id v6 = a1[5];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v7);
}

void sub_100015250(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = CarPairingLogging();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "prox card can be presented", v8, 2u);
    }

    [WeakRetained _launchRemoteAlertWithUserInfo:*(void *)(a1 + 32) errorHandler:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100070480(v5);
    }

    id v6 = [WeakRetained sharingClient];
    [v6 invalidate];

    [WeakRetained setSharingClient:0];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

void sub_1000154AC(id a1)
{
  uint64_t v1 = CarPairingLogging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "CarPlaySetup did activate.", v2, 2u);
  }
}

id sub_100015588(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CarPlaySetup did deactivate.", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000156C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = *(void **)(a1 + 32);
  int v3 = (uint64_t *)(a1 + 32);
  id v5 = [v4 domain];
  unsigned int v6 = [v5 isEqualToString:SBSRemoteAlertHandleInvalidationErrorDomain];

  if (!v6)
  {
    long long v9 = CarPairingLogging();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
LABEL_8:
    sub_1000704C4(v3, v9);
    goto LABEL_9;
  }
  unint64_t v7 = (unint64_t)[(id)*v3 code] & 0xFFFFFFFFFFFFFFFELL;
  char v8 = CarPairingLogging();
  long long v9 = v8;
  if (v7 != 4)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)*v3 code]);
    int v13 = 138412290;
    __int16 v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CarPlaySetup alert handle invalidated with code %@", (uint8_t *)&v13, 0xCu);
  }
LABEL_9:

  uint64_t v11 = [WeakRetained currentErrorHandler];
  CFStringRef v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, *v3);
  }
  [WeakRetained invalidate];
}

id sub_100015BC8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) channelIsOpen])
  {
    uint64_t v2 = [*(id *)(a1 + 32) channel];
    [v2 closeChannel];

    [*(id *)(a1 + 32) setChannelIsOpen:0];
  }
  [*(id *)(a1 + 32) setCurrentAcceptCompletion:0];
  int v3 = [*(id *)(a1 + 32) channel];
  [v3 setChannelDelegate:0];

  [*(id *)(a1 + 32) _internalQueue_signalChunkQueue];
  id v4 = *(void **)(a1 + 32);

  return [v4 setInternalQueueOutstandingSendCount:0];
}

uint64_t sub_100015F24(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) internalQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = sub_10005C6FC(4uLL);
  unsigned int v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "completed file transfer for cluster theme version %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1000705C4();
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t sub_1000161DC(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) internalQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = sub_10005C6FC(4uLL);
  unsigned int v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "completed file transfer for log archive %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100070630();
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100016540(id *a1)
{
  uint64_t v2 = +[NSFileManager defaultManager];
  int v3 = [a1[4] path];
  id v47 = 0;
  id v4 = [v2 attributesOfItemAtPath:v3 error:&v47];
  id v5 = v47;

  if (v4)
  {
    id v6 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
    uint64_t v7 = [v4 objectForKey:NSFileSize];
    id v8 = [v7 unsignedLongLongValue];

    [v6 setTotalUnitCount:v8];
    [a1[5] addChild:v6 withPendingUnitCount:1];
    int v9 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "started tracking file transfer progress: %@", (uint8_t *)&buf, 0xCu);
    }

    id v10 = a1[4];
    id v46 = v5;
    uint64_t v11 = +[NSFileHandle fileHandleForReadingFromURL:v10 error:&v46];
    id v26 = v46;

    if (v11)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v51 = 0x2020000000;
      char v52 = 0;
      id v12 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
      [v12 setTotalUnitCount:1];
      [a1[5] addChild:v12 withPendingUnitCount:1];
      int v13 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v48 = 138412290;
        id v49 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "started tracking file acknowledgment progress: %@", v48, 0xCu);
      }

      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100016AF4;
      v40[3] = &unk_1000BD618;
      id v14 = a1[6];
      id v41 = a1[7];
      id v15 = v12;
      id v42 = v15;
      id v43 = a1[5];
      p_long long buf = &buf;
      id v44 = a1[9];
      [v14 setCurrentAcceptCompletion:v40];
      uint64_t v16 = +[NSUUID UUID];
      uint64_t v17 = [v16 UUIDString];

      unsigned int v18 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v48 = 138412290;
        id v49 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "starting file transfer session %@", v48, 0xCu);
      }

      unint64_t v19 = (unint64_t)[a1[6] _internalQueue_chunkSizeForTransferWithPriority:[a1[6] isPriority]];
      uint64_t v20 = [a1[6] chunkQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100016C18;
      block[3] = &unk_1000BD6B8;
      id v28 = a1[7];
      id v35 = a1[9];
      id v29 = a1[8];
      id v30 = v17;
      id v31 = a1[6];
      v36 = &buf;
      unint64_t v37 = ((unint64_t)v8 + v19 - 1) / v19;
      id v32 = v11;
      unint64_t v38 = v19;
      id v33 = a1[4];
      id v34 = v6;
      id v39 = v8;
      id v21 = v17;
      dispatch_async(v20, block);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      long long v24 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100070704();
      }

      __int16 v25 = (void (**)(id, void))a1[9];
      if (v25) {
        v25[2](v25, 0);
      }
    }

    id v5 = v26;
  }
  else
  {
    unsigned __int16 v22 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10007069C();
    }

    long long v23 = (void (**)(id, void))a1[9];
    if (v23) {
      v23[2](v23, 0);
    }
  }
}

void sub_100016AC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016AF4(uint64_t a1, uint64_t a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  [*(id *)(a1 + 40) setCompletedUnitCount:1];
  id v4 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "completed tracking acceptance progress: %@", (uint8_t *)&v8, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    id v6 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007076C();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100016C18(uint64_t a1)
{
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100017638;
  v47[3] = &unk_1000BD668;
  id v48 = *(id *)(a1 + 32);
  id v49 = *(id *)(a1 + 88);
  id v44 = objc_retainBlock(v47);
  +[NSDate timeIntervalSinceReferenceDate];
  double v3 = v2;
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:*(void *)(a1 + 40)];
  [v5 setObject:&off_1000C6040 forKey:];
  [v5 setObject:*(void *)(a1 + 48) forKey:];
  id v6 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
  [v5 setObject:v6 forKey:@"chunkCount"];

  *(_DWORD *)v60 = 0;
  Data = (void *)OPACKEncoderCreateData();
  int v8 = sub_10005C6FC(4uLL);
  uint64_t v9 = v8;
  if (!Data)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000707A0((int *)v60, v9);
    }
    goto LABEL_44;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    buf.count[0] = 138412290;
    *(void *)&buf.count[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "sending header %@", (uint8_t *)&buf, 0xCu);
  }

  if ((objc_msgSend(*(id *)(a1 + 56), "_chunkQueue_blockingSendChannelMessage:", Data) & 1) == 0)
  {
    uint64_t v9 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10007081C();
    }
LABEL_44:

    ((void (*)(void))v44[2])();
    goto LABEL_54;
  }

  memset(&buf, 0, sizeof(buf));
  CC_SHA256_Init(&buf);
  if (*(void *)(a1 + 104))
  {
    unint64_t v10 = 0;
    while (1)
    {
      *(void *)v60 = 0;
      *(void *)&v60[8] = v60;
      *(void *)&v60[16] = 0x2020000000;
      char v61 = 0;
      id v12 = *(NSObject **)(a1 + 32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000176DC;
      block[3] = &unk_1000BD690;
      void block[4] = *(void *)(a1 + 96);
      void block[5] = v60;
      dispatch_sync(v12, block);
      if (!*(unsigned char *)(*(void *)&v60[8] + 24)) {
        break;
      }
      int v13 = 1;
LABEL_37:
      _Block_object_dispose(v60, 8);
      if (v13) {
        goto LABEL_54;
      }
      if (++v10 >= *(void *)(a1 + 104)) {
        goto LABEL_45;
      }
    }
    id v14 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)md = 134217984;
      unint64_t v55 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "reading file chunk %lu", md, 0xCu);
    }

    id v15 = *(void **)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 112);
    id v45 = 0;
    uint64_t v17 = [v15 readDataUpToLength:v16 error:&v45];
    id v43 = v45;
    if (!v17)
    {
      id v30 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(a1 + 72);
        *(_DWORD *)md = 134218498;
        unint64_t v55 = v10;
        __int16 v56 = 2112;
        uint64_t v57 = v33;
        __int16 v58 = 2112;
        id v59 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "failed to read file chunk %lu of %@: %@", md, 0x20u);
      }

      ((void (*)(void))v44[2])();
      int v13 = 1;
      goto LABEL_36;
    }
    id v18 = objc_alloc((Class)NSMutableDictionary);
    v52[0] = @"messageType";
    v52[1] = @"sessionID";
    uint64_t v19 = *(void *)(a1 + 48);
    v53[0] = &off_1000C6058;
    v53[1] = v19;
    v52[2] = @"chunkIndex";
    uint64_t v20 = +[NSNumber numberWithUnsignedInteger:v10];
    v52[3] = @"data";
    v53[2] = v20;
    v53[3] = v17;
    id v21 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4];
    id v22 = [v18 initWithDictionary:v21];

    id v23 = v17;
    CC_SHA256_Update(&buf, [v23 bytes], (CC_LONG)[v23 length]);
    if (v10 >= *(void *)(a1 + 104) - 1)
    {
      CC_SHA256_Final(md, &buf);
      id v24 = objc_alloc_init((Class)NSMutableString);
      for (uint64_t i = 0; i != 32; ++i)
        [v24 appendFormat:@"%02x", md[i]];
      id v26 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v50 = 138412290;
        id v51 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "file checksum: %@\n", v50, 0xCu);
      }

      [v22 setObject:v24 forKey:@"checksum"];
    }
    *(_DWORD *)v50 = 0;
    v27 = (void *)OPACKEncoderCreateData();
    if (v27)
    {
      id v28 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)md = 134217984;
        unint64_t v55 = v10;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "initiating send for file chunk %lu", md, 0xCu);
      }

      if (objc_msgSend(*(id *)(a1 + 56), "_chunkQueue_blockingSendChannelMessage:", v27))
      {
        id v29 = sub_10005C6FC(4uLL);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)md = 134217984;
          unint64_t v55 = v10;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "send in progress for file chunk %lu", md, 0xCu);
        }

        [*(id *)(a1 + 80) setCompletedUnitCount:[*(id *)(a1 + 80) completedUnitCount] + (void)objc_msgSend(v23, "length")];
        int v13 = 0;
        goto LABEL_35;
      }
      id v32 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)md = 134217984;
        unint64_t v55 = v10;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "failed to send file transfer chunk %lu", md, 0xCu);
      }

      ((void (*)(void))v44[2])();
    }
    else
    {
      id v31 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)md = 67109120;
        LODWORD(v55) = *(_DWORD *)v50;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "failed to encode file transfer payload message: %d", md, 8u);
      }

      ((void (*)(void))v44[2])();
    }
    int v13 = 1;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
LABEL_45:
  +[NSDate timeIntervalSinceReferenceDate];
  double v35 = 0.0;
  if (v34 - v3 > 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v35 = v36 - v3;
  }
  unint64_t v37 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = *(void *)(a1 + 120);
    *(_DWORD *)v60 = 134218240;
    *(void *)&v60[4] = v38;
    *(_WORD *)&v60[12] = 2048;
    *(double *)&v60[14] = v35;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "sent file of size %llu bytes in %f seconds", v60, 0x16u);
  }

  id v39 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = *(void *)(a1 + 48);
    *(_DWORD *)v60 = 138412290;
    *(void *)&v60[4] = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "completed sending for file transfer session %@", v60, 0xCu);
  }

  [*(id *)(a1 + 80) setCompletedUnitCount:[*(id *)(a1 + 80) totalUnitCount]];
  id v41 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = *(void *)(a1 + 48);
    *(_DWORD *)v60 = 138412290;
    *(void *)&v60[4] = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "waiting on acceptance message for file transfer session %@", v60, 0xCu);
  }

LABEL_54:
}

void sub_1000175E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100017638(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000176C0;
  block[3] = &unk_1000BD640;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t sub_1000176C0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_1000176DC(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    double v2 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "file transfer is canceled, stopping", v3, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_1000179C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000179EC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) channelIsOpen])
  {
    double v2 = [*(id *)(a1 + 32) channel];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 sendChannelMessage:*(void *)(a1 + 40)];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 32) setInternalQueueOutstandingSendCount:*(char *)(a1 + 32) + 1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (unint64_t)[*(id *)(a1 + 32) internalQueueOutstandingSendCount] > 2;
    }
    else
    {
      id v4 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100070884();
      }
    }
  }
  else
  {
    id v3 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000708B8();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

id sub_100017AF0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  double v2 = (char *)[v1 internalQueueOutstandingSendCount] - 1;

  return [v1 setInternalQueueOutstandingSendCount:v2];
}

id sub_100017DF0(uint64_t a1)
{
  double v2 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000709C4();
  }

  return [*(id *)(a1 + 32) _internalQueue_signalChunkQueue];
}

void sub_100017F28(uint64_t a1)
{
  objc_opt_class();
  id v2 = (id)OPACKDecodeData();
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    objc_opt_class();
    id v4 = [v3 objectForKey:@"messageType"];
    if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }

    if (v5)
    {
      switch((unint64_t)[v5 unsignedIntegerValue])
      {
        case 1uLL:
          id v6 = sub_10005C6FC(4uLL);
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          goto LABEL_13;
        case 2uLL:
          id v6 = sub_10005C6FC(4uLL);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
LABEL_13:
          }
            sub_100070B6C();
          goto LABEL_25;
        case 3uLL:
          id v6 = sub_10005C6FC(4uLL);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            sub_100070BA0();
          }
          goto LABEL_25;
        case 4uLL:
          id v6 = sub_10005C6FC(4uLL);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            sub_100070BD4();
          }
LABEL_25:

          break;
        case 5uLL:
          [*(id *)(a1 + 40) _internalQueue_handleFileAcceptMessage:v3];
          break;
        default:
          break;
      }
    }
    else
    {
      uint64_t v7 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100070B04();
      }
    }
  }
  else
  {
    id v5 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100070A7C();
    }
  }
}

id sub_100018210(uint64_t a1)
{
  id v2 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "closed file data connection", v4, 2u);
  }

  [*(id *)(a1 + 32) setChannelIsOpen:0];
  return [*(id *)(a1 + 32) _internalQueue_signalChunkQueue];
}

void sub_10001835C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001839C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000185A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000185BC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained[5] currentSession];
  [WeakRetained _worker_queue_setSession:v1];
}

void sub_100018700(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100018714(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  id v3 = v5;
  if (v5 && ([v3 isEqual:WeakRetained[3]] & 1) == 0)
  {
    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100070C08();
    }

    objc_storeStrong(WeakRetained + 3, *v4);
    uint64_t v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setURL:*v4 forKey:@"CRCarPlayCapabilitiesPlistPathKey"];

    [WeakRetained _worker_queue_runStateMachineIfPossible];
  }
}

void sub_100018B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018BA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018BB0(uint64_t a1)
{
}

void sub_100018BB8(uint64_t a1)
{
}

void sub_100018E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100018E50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _worker_queue_reloadSessionIfNeeded];
  [WeakRetained _worker_queue_setSession:v2];

  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100070CF4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_100018F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100018FB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _worker_queue_reloadSessionIfNeeded];
  [WeakRetained _worker_queue_setSession:v2];

  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100070D6C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_100019100(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100019114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100070DE4();
  }

  [WeakRetained _worker_queue_setSession:*(void *)(a1 + 32)];
  [WeakRetained reconcileCapabilities];
}

void sub_10001926C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100019280(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100070E5C();
  }

  [WeakRetained setLastLookupIdentifer:0];
  [WeakRetained _worker_queue_setSession:0];
}

void sub_1000193DC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000193F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) copy];
  id v3 = (void *)WeakRetained[4];
  WeakRetained[4] = v2;

  [WeakRetained reconcileCapabilities];
}

void sub_1000195EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019608(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[CRCarPlayCapabilitiesManager resolveCapabilitiesForSession:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: car carpabilities from state machine: %@, error: %@", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v9 = +[CRCarPlayCapabilities capabilitiesIdentifier];
  [WeakRetained setLastLookupIdentifer:v9];

  [WeakRetained setCarCapabilities:v5];
}

void sub_100019A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019A8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained lastLookupIdentifer];
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = [WeakRetained lookupCompletionHandlers];
    id v5 = [v4 count];

    if (v5)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = [WeakRetained lookupCompletionHandlers];
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            __int16 v12 = CarGeneralLogging();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CC_SHA256_CTX buf = 136315138;
              uint64_t v20 = "-[CRCarPlayCapabilitiesManager persistCarCapabilitiesIfNeeded]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Invoking lookupFinishedCompletion callback", buf, 0xCu);
            }

            id v13 = [WeakRetained lastLookupIdentifer];
            __int16 v14 = [WeakRetained carCapabilities];
            (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v13, v14);
          }
          id v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }
        while (v8);
      }

      [WeakRetained setLookupCompletionHandlers:0];
    }
  }
}

void sub_100019D38(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100019D4C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained stateMachine];
  id v3 = [v2 carCapabilities];
  unsigned __int8 v4 = [v3 disabledFeature];

  id v5 = +[CARPrototypePref nowPlayingAlbumArt];
  id v6 = [v5 value];

  if (v6)
  {
    id v7 = +[CARPrototypePref nowPlayingAlbumArt];
    id v8 = [v7 value];
    id v9 = [v8 integerValue];

    if (v9 == (id)-1)
    {
      __int16 v12 = [WeakRetained stateMachine];
      id v13 = [v12 carCapabilities];
      id v9 = [v13 nowPlayingAlbumArtMode];

      uint64_t v11 = CarGeneralLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1000710AC();
      }
      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = (uint64_t)v9 > 0;
      uint64_t v11 = CarGeneralLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100071120();
      }
    }

    __int16 v14 = [WeakRetained carCapabilities];
    id v15 = [v14 nowPlayingAlbumArtMode];

    if (v15 != v9)
    {
      long long v16 = [WeakRetained carCapabilities];
      [v16 setNowPlayingAlbumArtMode:v9];
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  long long v17 = [WeakRetained carCapabilities];
  id v18 = [v17 nowPlayingAlbumArtMode];

  if (!v18)
  {
    uint64_t v19 = +[CARPrototypePref nowPlayingAlbumArt];
    uint64_t v20 = [v19 defaultValue];
    id v21 = [v20 integerValue];

    id v22 = [WeakRetained carCapabilities];
    id v23 = [v22 nowPlayingAlbumArtMode];

    if (v23 != v21)
    {
      id v24 = CarGeneralLogging();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_100071034(v24, v25, v26, v27, v28, v29, v30, v31);
      }

      id v32 = [WeakRetained carCapabilities];
      [v32 setNowPlayingAlbumArtMode:v21];
    }
  }
  uint64_t v33 = [WeakRetained vehicleStore];
  double v34 = [WeakRetained MFiCertificateSerialNumber];
  double v35 = [v33 vehicleForCertificateSerial:v34];

  if (!v10)
  {
    if ((v4 & 1) == 0 && v35)
    {
      double v36 = (char *)[v35 albumArtUserPreference];
      unint64_t v37 = [WeakRetained carCapabilities];
      uint64_t v38 = v37;
      if ((unint64_t)(v36 - 1) > 1)
      {
        [v35 setAlbumArtUserPreference:[v37 nowPlayingAlbumArtMode]];

        id v39 = [v33 saveVehicle:v35];
      }
      else
      {
        [v37 setNowPlayingAlbumArtMode:v36];
      }
    }
    uint64_t v40 = +[GEOCountryConfiguration sharedConfiguration];
    id v41 = [v40 countryCode];

    if (!v41)
    {
      uint64_t v42 = +[NSLocale currentLocale];
      id v41 = [v42 objectForKey:NSLocaleCountryCode];
    }
    id v43 = +[NSSet setWithArray:&off_1000C71D8];
    unsigned int v44 = [v43 containsObject:v41];
    id v45 = CarGeneralLogging();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);
    if (v44)
    {
      if (v46) {
        sub_100070F4C();
      }

      id v47 = [WeakRetained carCapabilities];
      [v47 setNowPlayingAlbumArtMode:1];

      id v45 = [WeakRetained carCapabilities];
      [v45 setDisabledFeature:(unint64_t)[v45 disabledFeature] | 1];
    }
    else if (v46)
    {
      sub_100070FC0();
    }
  }
  id v48 = CarGeneralLogging();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    id v49 = [WeakRetained carCapabilities];
    int v62 = 136315394;
    v63 = "-[CRCarPlayCapabilitiesManager reconcileCapabilities]_block_invoke";
    __int16 v64 = 2048;
    id v65 = [v49 nowPlayingAlbumArtMode];
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s: CarCapabilities final album art value: %ld", (uint8_t *)&v62, 0x16u);
  }
  v50 = [WeakRetained[2] configuration];
  id v51 = [v50 defaultUserInterfaceStyle];

  if (v51 != (id)-1)
  {
    char v52 = [WeakRetained carCapabilities];
    [v52 setUserInterfaceStyle:v51];
  }
  v53 = +[CARPrototypePref interfaceStyle];
  v54 = [v53 value];

  if (v54)
  {
    unint64_t v55 = +[CARPrototypePref interfaceStyle];
    __int16 v56 = [v55 value];
    id v57 = [v56 integerValue];

    __int16 v58 = CarGeneralLogging();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      int v62 = 136315394;
      v63 = "-[CRCarPlayCapabilitiesManager reconcileCapabilities]_block_invoke";
      __int16 v64 = 2048;
      id v65 = v57;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: CarCapabilities interfaceStyle CARPrototypePref.interfaceStyle=%ld", (uint8_t *)&v62, 0x16u);
    }

    id v59 = [WeakRetained carCapabilities];
    id v60 = [v59 userInterfaceStyle];

    if (v60 != v57)
    {
      char v61 = [WeakRetained carCapabilities];
      [v61 setUserInterfaceStyle:v57];
    }
  }
  [WeakRetained persistCarCapabilitiesIfNeeded];
}

void sub_10001A42C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10001A440(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [WeakRetained lastLookupIdentifer];

    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      unsigned __int8 v4 = [WeakRetained lastLookupIdentifer];
      id v5 = [WeakRetained carCapabilities];
      (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

      [WeakRetained persistCarCapabilitiesIfNeeded];
    }
    else
    {
      id v6 = [WeakRetained lookupCompletionHandlers];

      if (!v6)
      {
        id v7 = objc_opt_new();
        [WeakRetained setLookupCompletionHandlers:v7];
      }
      id v8 = [WeakRetained lookupCompletionHandlers];
      id v9 = objc_retainBlock(*(id *)(a1 + 32));
      [v8 addObject:v9];

      [WeakRetained _worker_queue_runStateMachineIfPossible];
    }
  }
}

void sub_10001A6A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10001A6D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001A8A0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000711D8((uint64_t)v2, v3);
  }
}

void sub_10001A9BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "presenter is ready", v5, 2u);
  }

  unsigned __int8 v4 = [WeakRetained sessionDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 presenterSessionDidBecomeReady:WeakRetained];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001AB58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "presenter did dismiss", v6, 2u);
  }

  uint64_t v4 = [WeakRetained dismissHandler];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  [WeakRetained setDismissHandler:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001AD44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001AD54(uint64_t a1)
{
}

void sub_10001AD5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained assetProgress];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = CarPairingLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "returning asset progress to presenter: %@", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10001AF30(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AFD0;
  v5[3] = &unk_1000BD870;
  id v6 = *(id *)(a1 + 48);
  [a2 presentBluetoothConfirmationPromptForVehicleName:v3 numericCode:v4 responseHandler:v5];
}

void sub_10001AFD0(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B058;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001B058(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for Bluetooth confirmation prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001B1D4(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001B260;
  v3[3] = &unk_1000BD870;
  id v4 = *(id *)(a1 + 32);
  [a2 presentBluetoothContactsSyncPromptWithResponseHandler:v3];
}

void sub_10001B260(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B2E8;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001B2E8(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for Bluetooth contacts sync prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001B494(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B534;
  v5[3] = &unk_1000BD640;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 presentBluetoothFailedPromptForVehicleName:v4 isTimeout:v3 responseHandler:v5];
}

void sub_10001B534(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B5B8;
  block[3] = &unk_1000BD640;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001B5B8(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for Bluetooth failed prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001B680(id a1, CRSetupPromptPresenterService *a2)
{
}

void sub_10001B754(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B7E4;
  v4[3] = &unk_1000BD870;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 presentAllowWhileLockedPromptForVehicleName:v3 responseHandler:v4];
}

void sub_10001B7E4(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B86C;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001B86C(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for allow while locked prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001B9FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001BA9C;
  v5[3] = &unk_1000BD870;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [a2 presentConnectPromptWithBluetoothOnlyOption:v3 wirelessEnablement:v4 responseHandler:v5];
}

void sub_10001BA9C(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BB24;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001BB24(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for connect prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001BCB4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001BD54;
  v5[3] = &unk_1000BD870;
  id v6 = *(id *)(a1 + 32);
  [a2 presentUseWirelessPromptWithWirelessEnablement:v3 declineVariant:v4 responseHandler:v5];
}

void sub_10001BD54(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BDDC;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001BDDC(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for use wireless prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001BF80(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C010;
  v4[3] = &unk_1000BD870;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 presentEnhancedIntegrationPromptForVehicleName:v3 responseHandler:v4];
}

void sub_10001C010(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001C098;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001C098(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for enhanced integration prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001C228(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C2C8;
  v5[3] = &unk_1000BD870;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [a2 presentAssetSupportingConnectPromptWithBluetoothOnlyOption:v3 wirelessEnablement:v4 responseHandler:v5];
}

void sub_10001C2C8(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001C350;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001C350(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for connect prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001C4E0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C580;
  v5[3] = &unk_1000BD870;
  id v6 = *(id *)(a1 + 32);
  [a2 presentAssetSupportingUseWirelessPromptWithWirelessEnablement:v3 declineVariant:v4 responseHandler:v5];
}

void sub_10001C580(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001C608;
  v2[3] = &unk_1000BD848;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_10001C608(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v5 = 138543362;
    CFStringRef v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received response for use wireless prompt: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10001C87C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001C920;
  v6[3] = &unk_1000BD9F0;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 presentAssetProgressPromptForVehicleName:v4 cancelHandler:v6];
}

void sub_10001C920(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C9BC;
  block[3] = &unk_1000BD9C8;
  id v4 = *(id *)(a1 + 40);
  char v7 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10001C9BC(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received cancellation from asset progress prompt", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 48));
  }
  return [*(id *)(a1 + 32) _cleanupAssetProgress];
}

void sub_10001CC90(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CD20;
  v4[3] = &unk_1000BD640;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 presentAssetReadyPromptForVehicleName:v3 confirmationHandler:v4];
}

void sub_10001CD20(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CDA4;
  block[3] = &unk_1000BD640;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001CDA4(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received confirmation from asset ready prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001CEF0(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CF80;
  v4[3] = &unk_1000BD640;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 presentAssetReadySoonPromptForVehicleName:v3 confirmationHandler:v4];
}

void sub_10001CF80(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D004;
  block[3] = &unk_1000BD640;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001D004(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received confirmation from asset ready soon prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001D11C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetProgress];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) objectForKey:NSKeyValueChangeOldKey];
    [v3 doubleValue];
    uint64_t v5 = v4;
    [v2 fractionCompleted];
    uint64_t v7 = v6;
    int v8 = CarPairingLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134349312;
      uint64_t v10 = v5;
      __int16 v11 = 2050;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updating asset progress from %{public}f to %{public}f", (uint8_t *)&v9, 0x16u);
    }

    if ([v2 isFinished]) {
      [*(id *)(a1 + 32) _handleAssetProgressFinished];
    }
  }
  else
  {
    uint64_t v3 = CarPairingLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100071250(v3);
    }
  }
}

void sub_10001D354(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D3F4;
  v5[3] = &unk_1000BD640;
  id v6 = *(id *)(a1 + 48);
  [a2 presentSetupCarKeysPromptForVehicleName:v3 carKeyInfo:v4 cancelHandler:v5];
}

void sub_10001D3F4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D478;
  block[3] = &unk_1000BD640;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001D478(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received cancel for setup car keys prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001DB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001DB54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001DB64(uint64_t a1)
{
}

id sub_10001DB6C(uint64_t a1)
{
  id v2 = [CRWirelessPairingServiceSession alloc];
  uint64_t v3 = [*(id *)(a1 + 32) bluetoothManager];
  uint64_t v4 = [*(id *)(a1 + 32) carPlayPreferences];
  uint64_t v5 = [(CRWirelessPairingServiceSession *)v2 initWithBluetoothManager:v3 preferences:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDelegate:*(void *)(a1 + 32)];
  int v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v8 setCurrentPairingSession:v9];
}

void sub_10001DC1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CC_SHA256_CTX buf = 138412290;
    id v10 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing service connection interrupted: %@", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DD44;
  v6[3] = &unk_1000BD3A8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = WeakRetained;
  uint64_t v8 = v4;
  id v5 = WeakRetained;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_10001DD44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) exportedObject];
  uint64_t v3 = [*(id *)(a1 + 40) currentPairingSession];
  unsigned int v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100071310();
    }

    [*(id *)(a1 + 40) setCurrentPairingSession:0];
  }
}

void sub_10001DDDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CC_SHA256_CTX buf = 138412290;
    id v10 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing service connection invalidated: %@", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DF04;
  v6[3] = &unk_1000BD3A8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = WeakRetained;
  uint64_t v8 = v4;
  id v5 = WeakRetained;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_10001DF04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) exportedObject];
  uint64_t v3 = [*(id *)(a1 + 40) currentPairingSession];
  unsigned int v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100071310();
    }

    [*(id *)(a1 + 40) setCurrentPairingSession:0];
  }
}

void sub_10001E224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001E264(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HUP prompt service connection interrupted: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10001E318(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HUP prompt service connection invalidated: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10001EE28(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10001F168(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001F180(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24) || !*(void *)(a1 + 32))
  {
    uint64_t v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000715E8(v6);
    }
  }
  else
  {
    *(unsigned char *)(v5 + 24) = 1;
    id v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10007166C();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001F240(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v1 + 24) && *(void *)(a1 + 32))
  {
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v2 = CarGeneralLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      id v4 = "-[CRCarPlayAppServiceAgent requestCarCapabilitiesStatus:withReply:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: request timed out", (uint8_t *)&v3, 0xCu);
    }
  }
}

void sub_10001F594(uint64_t a1, uint64_t a2)
{
  id v4 = CarGeneralLogging();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000716EC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets catalog downloaded", v13, 2u);
    }

    [*(id *)(a1 + 32) _queryForUpdatedAsset];
  }
}

void sub_10001F758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10001F76C(uint64_t a1)
{
  id v2 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.CarExperienceAssets"];
  [v2 returnTypes:2];
  [v2 setDoNotBlockBeforeFirstUnlock:1];
  id v3 = [v2 queryMetaDataSync];
  id v4 = [v2 results];
  uint64_t v5 = +[NSPredicate predicateWithBlock:&stru_1000BDAD0];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  uint64_t v7 = +[MAAsset cr_highestContentVersionAssetInAssets:v6];
  if (v3)
  {
    if (v3 == (id)2)
    {
      uint64_t v8 = CarGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CC_SHA256_CTX buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets catalog not present", buf, 2u);
      }

      if (v7) {
        [*(id *)(a1 + 32) _reloadWithAsset:v7];
      }
      uint64_t v9 = 0;
LABEL_27:
      [*(id *)(a1 + 32) _requestAssetCatalogDownload:v28, v29, v30, v31, v32];
      goto LABEL_28;
    }
    uint64_t v19 = CarGeneralLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100071724((uint64_t)v3, v19);
    }

    uint64_t v9 = +[NSError errorWithDomain:@"com.apple.carkit.app" code:1 userInfo:0];
  }
  else
  {
    uint64_t v10 = [v2 lastFetchDate];
    uint64_t v11 = +[NSDate date];
    uint64_t v12 = +[CARAnalytics calendarUnitsOfType:128 fromDate:v10 toDate:v11];

    if (v12 >= 259201)
    {
      id v13 = CarGeneralLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CC_SHA256_CTX buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets catalog out of date", buf, 2u);
      }
    }
    if (v7) {
      [*(id *)(a1 + 32) _reloadWithAsset:v7];
    }
    id v14 = [v4 count];
    id v15 = CarGeneralLogging();
    long long v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CC_SHA256_CTX buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets asset exists but is not downloaded, requesting download", buf, 2u);
      }

      long long v17 = +[MAAsset cr_highestContentVersionAssetInAssets:v4];
      if ([v17 state] == (id)1)
      {
        id v18 = objc_alloc_init((Class)MADownloadOptions);
        [v18 setAllowsCellularAccess:1];
        uint64_t v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        uint64_t v30 = sub_10001FBC4;
        uint64_t v31 = &unk_1000BDAF8;
        uint64_t v32 = *(void *)(a1 + 32);
        id v33 = v17;
        [v33 startDownload:v18 then:&v28];
      }
      uint64_t v9 = 0;
      if (v12 > 259200) {
        goto LABEL_27;
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000717A8(v16, v20, v21, v22, v23, v24, v25, v26);
      }

      uint64_t v9 = +[NSError errorWithDomain:@"com.apple.carkit.app" code:1 userInfo:0];
      if (v12 >= 259201) {
        goto LABEL_27;
      }
    }
  }
LABEL_28:
  id v27 = *(id *)(a1 + 32);
  objc_sync_enter(v27);
  [*(id *)(a1 + 32) setAssetQueryInProgress:0];
  objc_sync_exit(v27);
}

void sub_10001FB60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10001FB74(id a1, MAAsset *a2, NSDictionary *a3)
{
  id v3 = a2;
  BOOL v4 = [(MAAsset *)v3 state] == (id)2 || [(MAAsset *)v3 state] == (id)6;

  return v4;
}

void sub_10001FBC4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = CarGeneralLogging();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets asset download failed", v6, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)CC_SHA256_CTX buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets asset download successful", buf, 2u);
    }

    [*(id *)(a1 + 32) _reloadWithAsset:*(void *)(a1 + 40)];
  }
}

void sub_100020C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020C28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100020C38(uint64_t a1)
{
}

uint64_t sub_100020C40(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) saveVehicle:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_100020E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100020E58(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) removeVehicle:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100020FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100020FFC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    BOOL v5 = [*(id *)(a1 + 32) vehicleStore];
    uint64_t v6 = [v5 allStoredVehicles];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void sub_100021120(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, [a2 count] != 0, v5);
}

void sub_1000213C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100021400(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) vehicleStore];
    uint64_t v6 = [v5 vehicleForBluetoothAddress:*(void *)(a1 + 40)];

    if (v6
      && ([*(id *)(a1 + 32) _dismissReconnectionEnableWiFiAlertExceptForVehicle:v6],
          [v6 isPaired]))
    {
      uint64_t v7 = [v6 carplayWiFiUUID];
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v10 = [*(id *)(a1 + 32) wifiManager];
        unsigned int v11 = [v10 hasCredentialsForCarPlayUUID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

        if (v11)
        {
          kdebug_trace();
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) postInCarNotificationForVehicle:v6];
          uint64_t v12 = [*(id *)(a1 + 32) wifiManager];
          unsigned __int8 v13 = [v12 isPowered];

          if (v13)
          {
LABEL_21:

            return;
          }
          id v14 = [*(id *)(a1 + 32) bluetoothManager];
          id v15 = [v14 connectedServicesCountForBluetoothAddress:*(void *)(a1 + 40)];

          uint64_t v16 = [*(id *)(a1 + 32) serviceCountDuringAlertForBluetoothAddress];
          uint64_t v17 = [v16 objectForKey:*(void *)(a1 + 40)];

          uint64_t v18 = CarGeneralLogging();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = *(void **)(a1 + 40);
            uint64_t v20 = +[NSNumber numberWithUnsignedInteger:v15];
            *(_DWORD *)CC_SHA256_CTX buf = 138413058;
            uint64_t v30 = v19;
            __int16 v31 = 2112;
            uint64_t v32 = v6;
            __int16 v33 = 2112;
            double v34 = v20;
            __int16 v35 = 2112;
            double v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "WiFi disabled for %@ (%@) with current services count %@, previous services count %@", buf, 0x2Au);
          }
          if (!v17 || v15 <= [v17 unsignedIntegerValue])
          {
            uint64_t v21 = [*(id *)(a1 + 32) _presentedReconnectionEnableWiFiAlertForVehicle:v6];

            if (v21)
            {
              uint64_t v22 = CarGeneralLogging();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CC_SHA256_CTX buf = 138412290;
                uint64_t v30 = v6;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Existing enable WiFi alert for %@, cancelling presentation", buf, 0xCu);
              }
            }
            else
            {
              [*(id *)(a1 + 32) _presentReconnectionEnableWiFiAlertForVehicle:v6];
            }
          }
          uint64_t v26 = [*(id *)(a1 + 32) serviceCountDuringAlertForBluetoothAddress];
          id v27 = +[NSNumber numberWithUnsignedInteger:v15];
          [v26 setObject:v27 forKey:*(void *)(a1 + 40)];

LABEL_20:
          goto LABEL_21;
        }
      }
      uint64_t v17 = CarGeneralLogging();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      uint64_t v25 = *(void **)(a1 + 40);
      *(_DWORD *)CC_SHA256_CTX buf = 138412290;
      uint64_t v30 = v25;
      uint64_t v24 = "skipping fast-reconnection with %@, no Wi-Fi credentials";
    }
    else
    {
      uint64_t v17 = CarGeneralLogging();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      uint64_t v23 = *(void **)(a1 + 40);
      *(_DWORD *)CC_SHA256_CTX buf = 138412290;
      uint64_t v30 = v23;
      uint64_t v24 = "skipping fast-reconnection with %@, not a known & enabled CarPlay vehicle";
    }
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
    goto LABEL_20;
  }
}

void sub_1000218BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000218D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) vehicleStore];
  id v4 = [v2 vehicleForBluetoothAddress:*(void *)(a1 + 40)];

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 32) _dismissReconnectionEnableWiFiAlertForVehicle:v4];
  }
  uint64_t v3 = [*(id *)(a1 + 32) serviceCountDuringAlertForBluetoothAddress];
  [v3 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100021AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100021B18(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) pairedVehiclesConnectedOnBluetooth];
    uint64_t v6 = [v5 anyObject];
    uint64_t v7 = v6;
    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v8 = [v6 carplayWiFiUUID];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    unsigned int v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)CC_SHA256_CTX buf = 67109120;
      int v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "isBluetoothInCar %i", buf, 8u);
    }
  }
}

void sub_100021DA0(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)CC_SHA256_CTX buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "handleBluetoothClassicPairingCompletedForDeviceAddress: %@ name: %@", buf, 0x16u);
  }

  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v5 _isRestricted:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v8 = [objc_alloc((Class)CRVehicle) initWithIdentifier:0 certificateSerial:0];
    [v8 setBluetoothAddress:*(void *)(a1 + 32)];
    [v8 setVehicleName:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v9 = [*(id *)(a1 + 48) preferencesManager];
      uint64_t v10 = [v9 isCarPlaySetupEnabled];
      unsigned int v11 = [v10 BOOLValue];

      if (v11) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = 2;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    [v8 setPairingStatus:v12];
    unsigned __int8 v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CC_SHA256_CTX buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving vehicle %@ from new BT Classic pairing.", buf, 0xCu);
    }

    id v14 = [*(id *)(a1 + 48) saveVehicle:v8];
    (*(void (**)(void, BOOL, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v14 != 0, 0);
  }
}

void sub_1000220A0(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)CC_SHA256_CTX buf = 138412546;
    uint64_t v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "startBluetoothLEPairingForIdentifier: %@ name: %@", buf, 0x16u);
  }

  id v5 = *(void **)(a1 + 48);
  id v15 = 0;
  unsigned int v6 = [v5 _isRestricted:&v15];
  id v7 = v15;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v8 = *(void **)(a1 + 48);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100022298;
    v12[3] = &unk_1000BDC38;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    [v8 setCurrentBluetoothPairingCompletion:v12];
    uint64_t v9 = objc_alloc_init(CRPairingPromptFlowController);
    [(CRPairingPromptFlowController *)v9 setPromptDelegate:*(void *)(a1 + 48)];
    [*(id *)(a1 + 48) setCurrentPromptFlowController:v9];
    [(CRPairingPromptFlowController *)v9 handleBluetoothPairingStartedForDeviceIdentifier:*(void *)(a1 + 32) showBluetoothOnlyOption:0];
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(a1 + 32)];
    unsigned int v11 = [*(id *)(a1 + 48) messagingConnector];
    [v11 pairWithBluetoothLEIdentifier:v10 deviceName:*(void *)(a1 + 40)];
  }
}

void sub_100022298(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v9 = (uint64_t *)(a1 + 32);
  unsigned __int8 v10 = [*(id *)(a1 + 32) isEqual:v7];
  unsigned int v11 = CarPairingLogging();
  uint64_t v12 = v11;
  if (v10)
  {
    BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v13)
      {
        uint64_t v14 = *v9;
        int v20 = 141558275;
        uint64_t v21 = 1752392040;
        __int16 v22 = 2113;
        uint64_t v23 = v14;
        id v15 = "pairing succeeded for %{private, mask.hash}@";
        uint64_t v16 = v12;
        uint32_t v17 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
      }
    }
    else if (v13)
    {
      uint64_t v18 = *v9;
      int v20 = 141558531;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2113;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v8;
      id v15 = "pairing failed for %{private, mask.hash}@, error: %@";
      uint64_t v16 = v12;
      uint32_t v17 = 32;
      goto LABEL_10;
    }

    (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, v8, v19);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100071958();
  }

LABEL_12:
}

void sub_100022548(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)CC_SHA256_CTX buf = 141558275;
    uint64_t v21 = 1752392040;
    __int16 v22 = 2113;
    uint64_t v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "startBluetoothClassicPairingForDeviceAddress: %{private, mask.hash}@", buf, 0x16u);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    id v4 = 0;
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v19 = 0;
    unsigned int v6 = [v5 _isRestricted:&v19];
    id v4 = v19;
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_15;
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000227BC;
  v16[3] = &unk_1000BDC38;
  id v7 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 56);
  [v7 setCurrentBluetoothPairingCompletion:v16];
  id v8 = [*(id *)(a1 + 40) vehicleStore];
  uint64_t v9 = [v8 vehicleForBluetoothAddress:*(void *)(a1 + 32)];

  if (v9)
  {
    unsigned __int8 v10 = CarPairingLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000719C0();
    }

    [v9 setBluetoothAddress:0];
    [*(id *)(a1 + 40) removeVehicle:v9];
  }
  unsigned int v11 = objc_alloc_init(CRPairingPromptFlowController);
  [(CRPairingPromptFlowController *)v11 setPromptDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setCurrentPromptFlowController:v11];
  [(CRPairingPromptFlowController *)v11 handleBluetoothPairingStartedForDeviceIdentifier:*(void *)(a1 + 32) showBluetoothOnlyOption:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v12 = *(void *)(a1 + 48);
  BOOL v13 = [*(id *)(a1 + 40) bluetoothManager];
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(a1 + 32);
  if (v12) {
    [v13 confirmPairingWithBluetoothAddress:v15 numericCode:*(void *)(a1 + 48)];
  }
  else {
    [v13 pairWithBluetoothAddress:v15];
  }

LABEL_15:
}

void sub_1000227BC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v9 = (uint64_t *)(a1 + 32);
  unsigned __int8 v10 = [*(id *)(a1 + 32) isEqual:v7];
  unsigned int v11 = CarPairingLogging();
  uint64_t v12 = v11;
  if (v10)
  {
    BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v13)
      {
        uint64_t v14 = *v9;
        int v20 = 141558275;
        uint64_t v21 = 1752392040;
        __int16 v22 = 2113;
        uint64_t v23 = v14;
        uint64_t v15 = "pairing succeeded for %{private, mask.hash}@";
        uint64_t v16 = v12;
        uint32_t v17 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
      }
    }
    else if (v13)
    {
      uint64_t v18 = *v9;
      int v20 = 141558531;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2113;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v8;
      uint64_t v15 = "pairing failed for %{private, mask.hash}@, error: %@";
      uint64_t v16 = v12;
      uint32_t v17 = 32;
      goto LABEL_10;
    }

    (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, v8, v19);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100071958();
  }

LABEL_12:
}

void sub_100022A40(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CarPlay connection request startSessionProperties: %@", (uint8_t *)&buf, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    id v4 = *(void **)(a1 + 40);
    id v72 = 0;
    unsigned int v5 = [v4 _isRestricted:&v72];
    id v55 = v72;
    if (v5)
    {
      unsigned int v6 = CarGeneralLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100071A5C();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v8 = [*(id *)(a1 + 40) messagingConnector];
      v54 = [v8 vehicleAccessoryForiAPConnectionIdentifier:*(unsigned int *)(a1 + 56)];

      if (!v54)
      {
        uint64_t v9 = CarGeneralLogging();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100071A90();
        }

        uint64_t v10 = *(void *)(a1 + 48);
        unsigned int v11 = +[NSError errorWithDomain:@"com.apple.carkit" code:3 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
      }
      v53 = +[NSSet setWithObjects:@"SSID_STR", @"password", @"CHANNEL", 0];
      id v51 = [v53 setByAddingObject:@"securityType"];
      char v52 = [*(id *)(a1 + 32) cr_dictionaryWithValuesForPresentKeys:v51];
      uint64_t v68 = 0;
      v69 = &v68;
      uint64_t v70 = 0x2020000000;
      char v71 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v76 = 0x3032000000;
      v77 = sub_100020C28;
      v78 = sub_100020C38;
      id v79 = 0;
      uint64_t v62 = 0;
      v63 = &v62;
      uint64_t v64 = 0x3032000000;
      id v65 = sub_100020C28;
      v66 = sub_100020C38;
      id v67 = 0;
      uint64_t v12 = [v52 allKeys];
      BOOL v13 = +[NSSet setWithArray:v12];
      unsigned int v14 = [v53 isSubsetOfSet:v13];

      if (v14)
      {
        uint64_t v15 = *(void **)(a1 + 40);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10002340C;
        v56[3] = &unk_1000BDCD8;
        id v59 = &v68;
        id v60 = &v62;
        v56[4] = v15;
        id v57 = v52;
        id v58 = v54;
        p_long long buf = &buf;
        [v15 _findWirelessPairedVehicleForMessagingVehicle:v58 result:v56];
      }
      else
      {
        uint64_t v16 = CarGeneralLogging();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v73 = 138412290;
          v74 = v52;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Start session without Wi-Fi credentials: %@", v73, 0xCu);
        }
      }
      uint32_t v17 = +[NSMutableSet setWithObjects:@"wiredIPAddresses", @"port", @"deviceID", @"publicKey", @"sourceVersion", 0];
      uint64_t v18 = v17;
      if (*((unsigned char *)v69 + 24)) {
        [v17 addObject:@"wirelessIPAddresses"];
      }
      [v18 addObject:@"supportsMutualAuth"];
      uint64_t v19 = [*(id *)(a1 + 32) cr_dictionaryWithValuesForPresentKeys:v18];
      id v20 = [v19 mutableCopy];

      uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
      if (v21) {
        [v20 setObject:v21 forKey:@"carplayWiFiUUID"];
      }
      __int16 v22 = CRLocalizedStringForKey();
      [v20 setObject:v22 forKey:@"displayName"];

      uint64_t v23 = [v54 certificateSerialNumber];
      if (v23) {
        [v20 setObject:v23 forKey:@"authenticationCertificateSerial"];
      }
      __int16 v24 = (void *)v63[5];
      if (v24) {
        goto LABEL_66;
      }
      id v25 = [*(id *)(a1 + 40) vehicleStore];
      uint64_t v26 = [v54 certificateSerialNumber];
      uint64_t v27 = [v25 vehicleForCertificateSerial:v26];
      uint64_t v28 = (void *)v63[5];
      v63[5] = v27;

      __int16 v24 = (void *)v63[5];
      if (v24)
      {
LABEL_66:
        uint64_t v29 = [v24 identifier];
        BOOL v30 = v29 == 0;

        if (!v30)
        {
          __int16 v31 = [(id)v63[5] identifier];
          [v20 setObject:v31 forKey:@"pairedVehicleIdentifier"];
        }
      }
      id v32 = [*(id *)(a1 + 40) carPlaySimulatorActive];
      id v33 = [objc_alloc((Class)CARSessionRequestHost) initWithHostProperties:v20];
      [v33 setWiredCarPlaySimulator:v32];
      [*(id *)(a1 + 40) _mainQueue_startSessionForHost:v33 reply:*(void *)(a1 + 48)];
      double v34 = [*(id *)(a1 + 40) featuresAvailabilityAgent];
      unint64_t v35 = (unint64_t)[v34 deviceSupportedCarPlayFeatures];

      uint64_t v36 = CRCarPlayFeaturesAllFerriteFeatures();
      if ((v36 & v35) == CRCarPlayFeaturesAllFerriteFeatures())
      {
        objc_opt_class();
        id v37 = [*(id *)(a1 + 32) objectForKey:@"clusterAssetIdentifer"];
        if (v37 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v38 = v37;
        }
        else {
          id v38 = 0;
        }

        objc_opt_class();
        id v39 = [*(id *)(a1 + 32) objectForKey:@"clusterAssetVersion"];
        if (v39 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v50 = v39;
        }
        else {
          id v50 = 0;
        }

        objc_opt_class();
        id v40 = [*(id *)(a1 + 32) objectForKey:@"SDKVersion"];
        if (v40 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v41 = v40;
        }
        else {
          id v41 = 0;
        }

        if (v38 && [v38 length] && v50 && v41 && objc_msgSend(v41, "length"))
        {
          uint64_t v42 = CarGeneralLogging();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v73 = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "start session message has asset information", v73, 2u);
          }

          if (v32)
          {
            id v43 = (void *)v63[5];
            if (!v43)
            {
              unsigned int v44 = CarPairingLogging();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v73 = 0;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "creating a pairing for a simulated asset-supporting session", v73, 2u);
              }

              uint64_t v45 = +[CRVehicle vehicleForMessagingVehicle:v54];
              BOOL v46 = (void *)v63[5];
              v63[5] = v45;

              id v43 = (void *)v63[5];
            }
            if (![v43 pairingStatus])
            {
              id v47 = CarPairingLogging();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v73 = 0;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "accepting the pairing for a simulated asset-supporting session", v73, 2u);
              }

              [(id)v63[5] setPairingStatus:2];
            }
            uint64_t v48 = [*(id *)(a1 + 40) saveVehicle:v63[5]];
            id v49 = (void *)v63[5];
            v63[5] = v48;
          }
          [*(id *)(a1 + 40) _mainQueue_updateClusterAssetIdentifier:v38 assetVersion:v50 sdkVersion:v41 forVehicle:v63[5]];
        }
      }
      _Block_object_dispose(&v62, 8);

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v68, 8);
    }
  }
  else
  {
    id v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100071A28();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10002339C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v36 - 160), 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_10002340C(void *a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
    unsigned int v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100023588;
    v10[3] = &unk_1000BDCB0;
    uint64_t v12 = a1[9];
    unsigned int v11 = v4;
    [v5 _saveWiFiCredentials:v6 fromMessagingVehicle:v7 forWirelessPairedVehicle:v11 result:v10];
    id v8 = v11;
  }
  else
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(id)a1[6] vehicleName];
      *(_DWORD *)long long buf = 138412290;
      unsigned int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "not saving WiFi credentials, not a wireless paired vehicle: %@", buf, 0xCu);
    }
  }
}

void sub_100023588(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100071AFC();
    }

    uint64_t v9 = [*(id *)(a1 + 32) carplayWiFiUUID];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void sub_100023814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100023838(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    unsigned int v5 = [*(id *)(a1 + 32) messagingConnector];
    id v6 = [v5 connectedVehicles];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [v6 allObjects];
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v12 transportType] == (id)1
            && [v12 supportsUSBCarPlay]
            && ([v12 supportsCarPlayConnectionRequest] & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_15;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

void sub_100023B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100023B48(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v3 + 40);
    unsigned int v4 = [v2 _isRestricted:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
    if (v4)
    {
      unsigned int v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v6;
        id v7 = "wantsCarPlayControlAdvertisingForWiFiUUID:%@ CarPlay restricted";
        id v8 = v5;
        uint32_t v9 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unsigned int v5 = [*(id *)(a1 + 40) pairedVehiclesConnectedOnBluetooth];
    id v10 = [v5 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (!v10) {
      goto LABEL_25;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
LABEL_10:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v5);
      }
      long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
      if (!v14) {
        goto LABEL_20;
      }
      long long v15 = *(void **)(a1 + 32);
      long long v16 = [*(id *)(*((void *)&v21 + 1) + 8 * v13) carplayWiFiUUID];
      if (([v15 isEqualToString:v16] & 1) == 0) {
        break;
      }
      unsigned int v17 = [v14 requiresBonjour];

      if (!v17) {
        goto LABEL_20;
      }
      uint64_t v18 = CarGeneralLogging();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "wantsCarPlayControlAdvertisingForWiFiUUID: yes", buf, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_23:
      if (v11 == (id)++v13)
      {
        id v11 = [v5 countByEnumeratingWithState:&v21 objects:v30 count:16];
        if (!v11) {
          goto LABEL_25;
        }
        goto LABEL_10;
      }
    }

LABEL_20:
    uint64_t v19 = CarGeneralLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "wantsCarPlayControlAdvertisingForWiFiUUID:%@ didn't match criteria for vehicle %@", buf, 0x16u);
    }

    goto LABEL_23;
  }
  unsigned int v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    id v7 = "wantsCarPlayControlAdvertisingForWiFiUUID: nil UUID";
    id v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_7;
  }
LABEL_25:
}

void sub_100024024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_100024054(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000240D0;
  v5[3] = &unk_1000BDD50;
  long long v6 = *(_OWORD *)(a1 + 48);
  return [v2 _saveWiFiCredentials:v1 forAccessoryConnectionIdentifier:v3 result:v5];
}

void sub_1000240D0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    long long v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    long long v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  uint32_t v9 = *v6;
  *long long v6 = v8;
}

void sub_1000242B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000242D4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else if (*(void *)(a1 + 40))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [*(id *)(a1 + 32) vehicleStore];
    long long v6 = [v5 allStoredVehicles];

    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = *(void **)(a1 + 40);
          uint64_t v13 = [v11 carplayWiFiUUID];
          if ([v12 isEqualToString:v13])
          {
            unsigned int v14 = [v11 isPaired];

            if (v14)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }
LABEL_15:
  }
}

void sub_1000245D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000245FC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4 || !*(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [*(id *)(a1 + 32) vehicleStore];
    long long v6 = [v5 allStoredVehicles];

    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = *(void **)(a1 + 40);
          uint64_t v13 = [v11 certificateSerialNumber];
          LODWORD(v12) = [v12 isEqualToData:v13];

          if (v12)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _isVehicleActionable:v11];
            goto LABEL_14;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

void sub_1000248F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100024918(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0 && *(void *)(a1 + 40))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [*(id *)(a1 + 32) vehicleStore];
    long long v6 = [v5 allStoredVehicles];

    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = *(void **)(a1 + 40);
          uint64_t v13 = [v11 certificateSerialNumber];
          LODWORD(v12) = [v12 isEqualToData:v13];

          if (v12)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v11 isPaired];
            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

void sub_100024BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100024C20(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 _isRestricted:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0 && *(void *)(a1 + 40))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [*(id *)(a1 + 32) vehicleStore];
    long long v6 = [v5 allStoredVehicles];

    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = *(void **)(a1 + 40);
          uint64_t v13 = [v11 certificateSerialNumber];
          LODWORD(v12) = [v12 isEqualToData:v13];

          if (v12)
          {
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v11 enhancedIntegrationStatus];
            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

id sub_100024E48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCarPlayAllowedDidChange];
}

void sub_100024FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025004(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featuresAvailabilityAgent];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 deviceSupportedCarPlayFeatures];
}

void sub_1000251B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000251D0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featuresAvailabilityAgent];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 disablesCarPlayFeatures:*(void *)(a1 + 56) forVehicleIdentifier:*(void *)(a1 + 40)];
}

void sub_100025370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002538C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featuresAvailabilityAgent];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 setCarPlayFeatures:*(void *)(a1 + 56) disabled:*(unsigned __int8 *)(a1 + 64) forVehicleIdentifier:*(void *)(a1 + 40)];
}

void sub_100025590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000255B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featuresAvailabilityAgent];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 supportedCarPlayFeaturesForCertificateSerial:*(void *)(a1 + 40)];
}

void sub_1000257C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000257E4(uint64_t a1)
{
  id v2 = +[CRCertificationOverridesServiceAgent nextSessionOverrideAirPlayFeatureStrings];
  if (v2)
  {
    uint64_t v3 = CarCertificationOverrideLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "one-time applying certification override feature strings: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v2);
    +[CRCertificationOverridesServiceAgent setNextSessionOverrideAirPlayFeatureStrings:0];
  }
  else
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) featuresAvailabilityAgent];
    [v4 supportedCarPlayFeaturesForVehicleIdentifier:*(void *)(a1 + 40)];

    uint64_t v5 = CRCarPlayFeaturesAsAirPlayFeatures();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_100025A40(uint64_t a1)
{
  id v2 = +[NSMutableString string];
  uint64_t v3 = +[EAAccessoryManager sharedAccessoryManager];
  unsigned __int8 v4 = [v3 connectedAccessories];

  uint64_t v5 = [*(id *)(a1 + 32) messagingConnector];
  uint64_t v6 = [v5 connectedVehicles];

  uint64_t v45 = v4;
  id v7 = [v4 count];
  unint64_t v43 = (unint64_t)v7;
  if ((unint64_t)v7 < 2)
  {
    if (v7 == (id)1) {
      [v2 appendFormat:@"%ld accessory connected:\n\n"];
    }
  }
  else
  {
    [v2 appendFormat:@"%ld accessories connected:\n\n", v7];
  }
  unsigned int v44 = v2;
  id v51 = +[NSMutableArray array];
  int v8 = [*(id *)(a1 + 32) vehicleStore];
  id v50 = [v8 allStoredVehicles];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = 0;
    uint64_t v47 = *(void *)v59;
    id v49 = 0;
    do
    {
      uint64_t v13 = 0;
      long long v14 = v11;
      long long v15 = v12;
      do
      {
        if (*(void *)v59 != v47) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v13);
        long long v17 = [v16 radarDescription];
        uint64_t v12 = [v16 analyticsDescription];

        uint64_t v18 = a1;
        uint64_t v19 = [*(id *)(a1 + 32) vehicleMatchingMessagingVehicle:v16 inVehicles:v50];
        uint64_t v20 = [v19 internalNotes];
        id v21 = [v20 length];

        if (v21)
        {
          long long v22 = [v19 internalNotes];
          uint64_t v23 = [v17 stringByAppendingFormat:@"Notes: %@\n", v22];

          long long v17 = (void *)v23;
        }
        if (CRIsInternalInstall())
        {
          uint64_t v24 = [v19 assetDescription];

          id v49 = (void *)v24;
        }
        id v11 = [v19 wallpaperDescription];

        if ([v16 supportsCarPlayConnectionRequest])
        {
          uint64_t v25 = 1;
        }
        else
        {
          uint64_t v26 = [v19 supportsStartSessionRequest];
          uint64_t v25 = (uint64_t)[v26 BOOLValue];
        }
        a1 = v18;
        [v51 addObject:v17];

        uint64_t v13 = (char *)v13 + 1;
        long long v14 = v11;
        long long v15 = v12;
      }
      while (v10 != v13);
      id v10 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v10);
  }
  else
  {
    id v49 = 0;
    id v11 = 0;
    uint64_t v25 = 0;
    uint64_t v12 = 0;
  }

  uint64_t v27 = [v51 componentsJoinedByString:@"\n"];
  [v44 appendString:v27];

  if (v43 > (unint64_t)[obj count])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v28 = v45;
    id v29 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v30; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if (([v33 supportsCarPlay] & 1) == 0)
          {
            double v34 = [*(id *)(a1 + 32) accessoryRadarDescription:v33];
            [v44 appendString:v34];
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v30);
    }
  }
  unint64_t v35 = [*(id *)(a1 + 32) loggingChannelManager];
  uint64_t v36 = [v35 currentLoggingFileReceiver];

  id v37 = CarGeneralLogging();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    sub_100071CE8();
  }

  id v38 = +[CRDiagnosticsService sharedInstance];
  [v38 setSessionStatus:*(void *)(*(void *)(a1 + 32) + 88)];
  uint64_t v39 = a1;
  uint64_t v40 = *(void *)(a1 + 40);
  uint64_t v41 = *(void *)(a1 + 48);
  uint64_t v42 = *(void *)(v39 + 64);
  uint64_t v48 = *(void *)(v39 + 56);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100025F90;
  v52[3] = &unk_1000BD640;
  id v53 = *(id *)(v39 + 72);
  [v38 collectDiagnosticsWithDeviceScreenshotURL:v40 carScreenshotURL:v41 attachmentURLs:v48 accessoryDetails:v12 accessoryDescription:v44 supportsStartSession:v25 activeBundleIdentifier:v42 wallpaperDescription:v11 assetDescription:v49 loggingFileReceiver:v36 completionHandler:v52];
}

uint64_t sub_100025F90(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000261FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100026328(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentPromptFlowController];
  if (v2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100026490;
    v9[3] = &unk_1000BDE68;
    uint64_t v3 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 64);
    [v3 setCurrentBluetoothConfirmationHandler:v9];
    unsigned __int8 v4 = CarPairingLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "showing numeric confirmation in pairing prompt flow", v8, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 48) stringValue];
    uint64_t v6 = [*(id *)(a1 + 40) UUIDString];
    [v2 handleBluetoothPairingConfirmationRequestForDeviceIdentifier:v6 vehicleName:*(void *)(a1 + 56) numericCode:v5];

    id v7 = v10;
  }
  else
  {
    id v7 = CarPairingLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100071D50();
    }
  }
}

void sub_100026490(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v7 = [*(id *)(a1 + 32) UUIDString];
  unsigned __int8 v8 = [v7 isEqual:v5];

  id v9 = CarPairingLogging();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      CFStringRef v12 = @"confirmed";
      uint64_t v15 = 1752392040;
      int v14 = 141558531;
      if (!v6) {
        CFStringRef v12 = @"declined";
      }
      __int16 v16 = 2113;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      CFStringRef v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "pairing for %{private, mask.hash}@ was %{public}@", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v6, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100071D84();
    }
  }
}

void sub_1000266F8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentPromptFlowController];
  uint64_t v3 = CarPairingLogging();
  unsigned __int8 v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "showing BLE pairing failure in pairing prompt flow", v5, 2u);
    }

    unsigned __int8 v4 = [*(id *)(a1 + 40) UUIDString];
    [v2 handleBluetoothPairingFailedForDeviceIdentifier:v4 vehicleName:*(void *)(a1 + 48) isTimeout:0];
    [*(id *)(a1 + 32) _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:v4 success:0 error:*(void *)(a1 + 56)];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_100071DEC();
  }
}

void sub_100026874(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) UUIDString];
  [*(id *)(a1 + 40) _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:v2 success:1 error:0];
}

void sub_10002696C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSSet setWithObject:*(void *)(a1 + 40)];
  [v2 handleDidConnectMessagingToVehicles:v3];

  unsigned __int8 v4 = [*(id *)(a1 + 40) analyticsDescription];
  id v13 = +[NSMutableDictionary dictionaryWithDictionary:v4];

  id v5 = [v13 objectForKeyedSubscript:@"modelName"];
  [v13 setObject:v5 forKeyedSubscript:@"iAPModel"];

  id v6 = [v13 objectForKeyedSubscript:@"manufacturer"];
  [v13 setObject:v6 forKeyedSubscript:@"iAPManufacturer"];

  [v13 removeObjectForKey:@"modelName"];
  [v13 removeObjectForKey:@"manufacturer"];
  id v7 = (char *)[*(id *)(a1 + 40) transportType];
  if ((unint64_t)(v7 - 1) > 3) {
    CFStringRef v8 = @"unknown";
  }
  else {
    CFStringRef v8 = *(&off_1000BE210 + (void)(v7 - 1));
  }
  [v13 setObject:v8 forKeyedSubscript:CARTransport];
  uint64_t v9 = CARCarKitVehicleInformationEvent;
  id v10 = +[NSDate date];
  uint64_t v11 = +[CARConnectionEvent eventWithName:v9 type:4 date:v10 payload:v13];

  CFStringRef v12 = [*(id *)(a1 + 32) connectionTimeServiceAgent];
  [v12 recordConnectionEvent:v11 completion:&stru_1000BDEF8];
}

void sub_100026B3C(id a1, BOOL a2, NSError *a3)
{
  unsigned __int8 v4 = a3;
  if (!a2)
  {
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100071E20(v4, v5);
    }
  }
}

void sub_100026C30(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSSet setWithObject:*(void *)(a1 + 40)];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026CF8;
  v5[3] = &unk_1000BDF20;
  void v5[4] = *(void *)(a1 + 32);
  [v2 enumerateStoredVehiclesForMessagingVehicles:v3 usingBlock:v5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARSessionAccessoryUpdatedNotification, 0, 0, 1u);
}

id *sub_100026CF8(id *result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (id *)[result[4] updateStoredVehicle:a3 usingMessagingVehicle:a2];
  }
  return result;
}

void sub_100026FA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v23 = a3;
  if (v5)
  {
    *(void *)&long long v30 = 0;
    *((void *)&v30 + 1) = &v30;
    uint64_t v31 = 0x3032000000;
    id v32 = sub_100020C28;
    id v33 = sub_100020C38;
    id v34 = 0;
    id v7 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100027344;
    v27[3] = &unk_1000BDCB0;
    id v29 = &v30;
    id v9 = v5;
    id v28 = v9;
    [v7 _saveWiFiCredentials:v6 fromMessagingVehicle:v8 forWirelessPairedVehicle:v9 result:v27];
    long long v22 = CRLocalizedStringForKey();
    id v10 = [*(id *)(a1 + 32) certificateSerialNumber];
    uint64_t v11 = [v9 identifier];
    id v12 = objc_alloc((Class)CARSessionRequestHost);
    id v13 = [v12 initWithDisplayName:v22 authenticationCertificateSerial:v10 pairedVehicleIdentifier:v11 wiFiUUID:*(void *)(*((void *)&v30 + 1) + 40) bleStartSessionMessage:*(void *)(a1 + 56)];
    int v14 = *(void **)(a1 + 40);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000273F4;
    v25[3] = &unk_1000BDF48;
    id v15 = v13;
    id v26 = v15;
    [v14 _mainQueue_startSessionForHost:v15 reply:v25];
    __int16 v16 = [*(id *)(a1 + 56) assetIdentifier];
    uint64_t v17 = [*(id *)(a1 + 56) assetVersion];
    __int16 v18 = [*(id *)(a1 + 56) sdkVersion];
    if (v16 && [v16 length] && v17 && v18 && objc_msgSend(v18, "length"))
    {
      CFStringRef v19 = CarGeneralLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "start session message has asset information", buf, 2u);
      }

      [*(id *)(a1 + 40) _mainQueue_updateClusterAssetIdentifier:v16 assetVersion:v17 sdkVersion:v18 forVehicle:v9];
    }

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v20 = CarGeneralLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [*(id *)(a1 + 32) vehicleName];
      LODWORD(v30) = 138412290;
      *(void *)((char *)&v30 + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "not handling CarPlayStartSession, not a wireless paired vehicle: %@", (uint8_t *)&v30, 0xCu);
    }
  }
}

void sub_100027304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027344(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    uint64_t v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100071AFC();
    }

    uint64_t v9 = [*(id *)(a1 + 32) carplayWiFiUUID];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void sub_1000273F4(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100071EE0();
    }
  }
}

id sub_1000274F8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentPromptFlowController];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) currentPromptFlowController];
    [v3 handleDisconnectedMessagingVehicle:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) _dismissApprovalAlertForMessagingVehicle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _dismissPairingAlertForMessagingVehicle:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 _dismissEnhancedIntegrationAlertForMessagingVehicle:v5];
}

id sub_1000276F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCarPlayAllowedDidChange];
}

void sub_100027A24(uint64_t a1)
{
  [*(id *)(a1 + 32) handleAnyMessagingConnectionsToVehicles];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 pairedVehiclesConnectedOnBluetooth];
  [v2 attemptConnectionWithVehicles:v3];
}

uint64_t sub_100027F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

id sub_100028214(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 certificateSerialNumber];
  uint64_t v5 = [v3 certificateSerialNumber];

  id v6 = [v4 isEqualToData:v5];
  return v6;
}

void sub_100028350(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) _saveWiFiCredentials:*(void *)(a1 + 40) fromMessagingVehicle:v7 forWirelessPairedVehicle:a2 result:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v7 vehicleName];
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring WiFi credentials for vehicle %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v8);
    }
  }
}

void sub_100028954(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000720EC();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

void sub_100028E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002921C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 updateStoredVehicle:v5 usingMessagingVehicle:v7];
    [*(id *)(a1 + 32) _sendCarPlayAvailabilityForMessagingVehicle:v7 storedVehicle:v5];
    [*(id *)(a1 + 32) _sendDeviceIdentifiersForMessagingVehicle:v7 pairingStatus:[v5 pairingStatus]];
    if ([v5 isPaired]) {
      [*(id *)(a1 + 32) _requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:v7];
    }
    if ([*(id *)(a1 + 32) _shouldPromptEnhancedIntegrationForStoredVehicle:v5 messagingVehicle:v7])[*(id *)(a1 + 32) _presentEnhancedIntegrationAlertForMessagingVehicle:v7]; {
  }
    }
  else
  {
    [v6 _sendCarPlayAvailabilityForMessagingVehicle:v7 storedVehicle:0];
  }
  [*(id *)(a1 + 32) _presentApprovalIfNecessaryForMessagingVehicle:v7 storedVehicle:v5];
}

id sub_100029998(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 identifier];
    uint64_t v9 = [v8 UUIDString];
    uint64_t v10 = [v6 identifier];
    uint64_t v11 = [v10 UUIDString];
    int v17 = 138412546;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Merging incomplete pairing %@ into pairing %@", (uint8_t *)&v17, 0x16u);
  }
  [v6 mergeAttributesFromVehicle:v5];
  if (([v6 isEqual:v5] & 1) == 0)
  {
    int v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v5 identifier];
      int v14 = [v13 UUIDString];
      int v17 = 138412290;
      __int16 v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing incomplete pairing %@", (uint8_t *)&v17, 0xCu);
    }
    id v15 = [*(id *)(a1 + 32) vehicleStore];
    [v15 removeVehicle:v5];
  }

  return v6;
}

BOOL sub_10002A6B4(id a1, CRMessagingServiceVehicleRepresenting *a2, NSDictionary *a3)
{
  id v3 = [(CRMessagingServiceVehicleRepresenting *)a2 transportType];
  return v3 == (id)2 || v3 == (id)4;
}

void sub_10002AA98(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "waiting on vehicle policy monitor observers", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) monitoringService];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002ABA4;
  v8[3] = &unk_1000BE0A0;
  id v6 = v4;
  char v12 = *(unsigned char *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  uint64_t v11 = *(void *)(a1 + 48);
  [v3 handleUpdatedVehicle:v6 enabled:v5 completion:v8];
}

void sub_10002ABA4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002AC44;
  v2[3] = &unk_1000BE0A0;
  id v3 = *(id *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_10002AC44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) carplayWiFiUUID];
  if (!v2)
  {
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_6;
    }
LABEL_5:
    long long v4 = *(void **)(a1 + 40);
    char v5 = +[NSSet setWithObject:*(void *)(a1 + 32)];
    [v4 attemptConnectionWithVehicles:v5];

    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_5;
  }
  id v3 = [*(id *)(a1 + 40) sessionRequestClient];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002AD70;
  v8[3] = &unk_1000BE078;
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v2;
  id v10 = *(id *)(a1 + 32);
  [v3 prepareForRemovingWiFiUUID:v9 completion:v8];

LABEL_6:
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_10002AD70(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AE18;
  block[3] = &unk_1000BD3D0;
  id v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10002AE18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wifiManager];
  unsigned __int8 v3 = [v2 removeNetworkCredentialsForCarPlayUUID:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100072340(a1, v4);
    }
  }
}

void sub_10002B140(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "waiting on vehicle policy monitor observers", buf, 2u);
  }

  unsigned __int8 v3 = [*(id *)(a1 + 32) monitoringService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B254;
  v7[3] = &unk_1000BE0C8;
  uint64_t v4 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  [v3 handleUpdatedVehicle:v4 enabled:0 completion:v7];
}

void sub_10002B254(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002B300;
  v5[3] = &unk_1000BE0C8;
  id v2 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_10002B300(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionRequestClient];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B3DC;
  v6[3] = &unk_1000BE078;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  [v2 prepareForRemovingWiFiUUID:v7 completion:v6];

  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_10002B3DC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B484;
  block[3] = &unk_1000BD3D0;
  id v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10002B484(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wifiManager];
  unsigned __int8 v3 = [v2 removeNetworkCredentialsForCarPlayUUID:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100072340(a1, v4);
    }
  }
}

void sub_10002C33C(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002C3E8;
  v5[3] = &unk_1000BD1B0;
  id v6 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 setDismissHandler:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10002C3E8(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "prompt presenter dismissed, canceling prompt flow", v4, 2u);
  }

  return [*(id *)(a1 + 32) cancel];
}

void sub_10002C45C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100072478();
  }

  [*(id *)(a1 + 32) cancel];
}

void sub_10002DDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_10002DE00(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Presented approval alert", v7, 2u);
  }

  uint64_t v3 = os_transaction_create();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) outstandingApprovalAlerts];
  [v6 addObject:*(void *)(a1 + 40)];
}

void sub_10002DEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) outstandingApprovalAlerts];
  [v4 removeObject:*(void *)(a1 + 40)];

  switch(a2)
  {
    case 2:
      id v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "approval alert cancelled", buf, 2u);
      }

      id v6 = [*(id *)(a1 + 32) vehicleStore];
      unsigned int v7 = [v6 removeVehicle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

      id v8 = CarGeneralLogging();
      id v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Temporary vehicle removed.", v24, 2u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        sub_1000726FC();
      }

      goto LABEL_34;
    case 0:
      uint64_t v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v23 = 0;
        uint64_t v11 = 2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "approval alert accepted", v23, 2u);
      }
      else
      {
        uint64_t v11 = 2;
      }
LABEL_19:

      goto LABEL_20;
    case 1:
      uint64_t v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "approval alert declined", v22, 2u);
      }
      uint64_t v11 = 1;
      goto LABEL_19;
  }
  uint64_t v11 = 0;
LABEL_20:
  if ([*(id *)(a1 + 48) transportType] == (id)2) {
    [*(id *)(a1 + 32) _sendDeviceIdentifiersForMessagingVehicle:*(void *)(a1 + 48) pairingStatus:v11];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPairingStatus:v11];
  uint64_t v12 = [*(id *)(a1 + 32) saveVehicle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if ([*(id *)(a1 + 48) transportType] == (id)2
    || [*(id *)(a1 + 48) transportType] == (id)4)
  {
    [*(id *)(a1 + 32) _sendCarPlayAvailabilityForMessagingVehicle:*(void *)(a1 + 48) storedVehicle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  if (!a2)
  {
    id v15 = [*(id *)(a1 + 32) preferencesManager];
    __int16 v16 = [v15 isCarPlaySetupEnabled];
    unsigned __int8 v17 = [v16 BOOLValue];

    if ((v17 & 1) == 0)
    {
      if ([*(id *)(a1 + 48) transportType] == (id)1
        && [*(id *)(a1 + 48) supportsWiredBluetoothPairing]
        && [*(id *)(a1 + 48) supportsWirelessCarPlay])
      {
        [*(id *)(a1 + 32) _presentWiredBluetoothPairingAlertForMessagingVehicle:*(void *)(a1 + 48) storedVehicle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      }
      if ([*(id *)(a1 + 32) _shouldPromptEnhancedIntegrationForStoredVehicle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) messagingVehicle:*(void *)(a1 + 48)])
      {
        __int16 v18 = [*(id *)(a1 + 32) preferencesManager];
        __int16 v19 = [v18 isCarPlaySetupEnabled];

        if (!v19) {
          [*(id *)(a1 + 32) _presentEnhancedIntegrationAlertForMessagingVehicle:*(void *)(a1 + 48)];
        }
      }
    }
  }
LABEL_34:
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;
}

void sub_10002EABC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10002EADC(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Presented Wired BT pairing alert", v7, 2u);
  }

  uint64_t v3 = os_transaction_create();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) outstandingPairingAlerts];
  [v6 addObject:*(void *)(a1 + 40)];
}

void sub_10002EB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) outstandingPairingAlerts];
  [v4 removeObject:*(void *)(a1 + 40)];

  if (a2)
  {
    if (a2 == 2)
    {
      id v6 = CarGeneralLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert cancelled", v15, 2u);
      }
      goto LABEL_17;
    }
    if (a2 == 1)
    {
      id v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert declined", buf, 2u);
      }

      if (*(void *)(a1 + 72) == 1)
      {
        id v6 = [(id)objc_opt_class() _pairingIdentifierForMessagingVehicle:*(void *)(a1 + 48)];
        [(id)objc_opt_class() _incrementPairingDeclineCountForIdentifier:v6];
LABEL_17:
      }
    }
  }
  else
  {
    unsigned int v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert accepted", v14, 2u);
    }

    id v8 = [*(id *)(a1 + 32) bluetoothManager];
    unsigned __int8 v9 = [v8 isPowered];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Wired BT powering on", v13, 2u);
      }

      [*(id *)(a1 + 32) setBTPowerMessagingVehicle:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) setBTPowerStoredVehicle:*(void *)(a1 + 56)];
      id v6 = [*(id *)(a1 + 32) bluetoothManager];
      [v6 setPowered:1];
      goto LABEL_17;
    }
    [*(id *)(a1 + 32) _beginWiredPairingWithMessagingVehicle:*(void *)(a1 + 48) storedVehicle:*(void *)(a1 + 56)];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

void sub_10002EFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_10002EFD8(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = +[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:");
    uint64_t v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      __int16 v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "wired pairing address: %@", (uint8_t *)&v17, 0xCu);
    }

    if (v3)
    {
      id v5 = *(id *)(a1 + 32);
      if (!v5)
      {
        id v5 = +[CRVehicle vehicleForMessagingVehicle:*(void *)(a1 + 40)];
        [v5 setPairingStatus:2];
      }
      [v5 setBluetoothAddress:v3];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      id v7 = [WeakRetained saveVehicle:v5];

      id v8 = [*(id *)(a1 + 48) _wirelessPairingAnalyticsDescriptionForMessagingVehicle:*(void *)(a1 + 40) storedVehicle:v5];
      unsigned __int8 v9 = +[CARAnalytics sharedInstance];
      [v9 userCreatedWirelessPairingWithSource:@"OOB" payload:v8];
    }
    else
    {
      id v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(NSObject **)(a1 + 32);
        int v17 = 138412290;
        __int16 v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "vehicle did not have a Bluetooth address after pairing: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(NSObject **)(a1 + 32);
      int v17 = 138412290;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed to complete Bluetooth pairing with %@", (uint8_t *)&v17, 0xCu);
    }
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  int v14 = (id *)(a1 + 64);
  id v15 = objc_loadWeakRetained(v14);
  [v15 setBTPowerStoredVehicle:0];

  id v16 = objc_loadWeakRetained(v14);
  [v16 setBTPowerMessagingVehicle:0];
}

void sub_10002F660(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10002F678(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Presented enable Wi-Fi alert", v7, 2u);
  }

  uint64_t v3 = os_transaction_create();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) outstandingEnableWiFiAlerts];
  [v6 addObject:*(void *)(a1 + 40)];
}

void sub_10002F720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) outstandingEnableWiFiAlerts];
  [v4 removeObject:*(void *)(a1 + 40)];

  if (a2)
  {
    if (a2 == 2)
    {
      id v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v6 = "Enable Wi-Fi alert cancelled";
        id v7 = buf;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (a2 == 1)
    {
      id v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        id v6 = "Enable Wi-Fi alert declined";
        id v7 = (uint8_t *)&v14;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enable Wi-Fi alert accepted, turning on Wi-Fi", v12, 2u);
    }

    unsigned __int8 v9 = [*(id *)(a1 + 32) wifiManager];
    [v9 setPowered:1];

    [*(id *)(a1 + 32) postInCarNotificationForVehicle:*(void *)(a1 + 48)];
  }
LABEL_13:
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void sub_10003023C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100030254(uint64_t a1)
{
  uint64_t v2 = os_transaction_create();
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) outstandingEnhancedIntegrationAlerts];
  [v5 addObject:*(void *)(a1 + 40)];
}

void sub_1000302C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) outstandingEnhancedIntegrationAlerts];
  [v4 removeObject:*(void *)(a1 + 40)];

  switch(a2)
  {
    case 0:
      unsigned __int8 v9 = CarGeneralLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert accepted", v13, 2u);
      }

      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = 2;
      goto LABEL_10;
    case 2:
      uint64_t v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert cancelled", v14, 2u);
      }

      break;
    case 1:
      id v5 = CarGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert declined", buf, 2u);
      }

      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = 1;
LABEL_10:
      [v6 _enhancedIntegrationUpdatedForMessagingVehicle:v7 status:v8];
      break;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

void sub_1000308E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100030904(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v8 = [*(id *)(a1 + 32) isEqual:v5];
  unsigned __int8 v9 = CarPairingLogging();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"confirmed";
      uint64_t v14 = 1752392040;
      int v13 = 141558531;
      if (!v6) {
        CFStringRef v11 = @"declined";
      }
      __int16 v15 = 2113;
      id v16 = v5;
      __int16 v17 = 2114;
      CFStringRef v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "pairing for %{private, mask.hash}@ was %{public}@", (uint8_t *)&v13, 0x20u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, v6, 0);
    }
    if (!v6) {
      [WeakRetained _invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:*(void *)(a1 + 32) success:0 error:0];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000727D4();
    }
  }
}

void sub_100030CE8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = CarGeneralLogging();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessPairingCreatedEvent connection event", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100072870(v4, v6);
  }
}

void *sub_10003140C(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_1000E3870)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_10003154C;
    void v5[4] = &unk_1000BD350;
    void v5[5] = v5;
    long long v6 = off_1000BE1F8;
    uint64_t v7 = 0;
    qword_1000E3870 = _sl_dlopen();
    BOOL v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_1000E3870;
    if (qword_1000E3870)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      BOOL v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_1000E3870;
LABEL_5:
  uint64_t result = dlsym(v2, "kAPEndpointProperty_EndpointInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000E3868 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10003154C()
{
  uint64_t result = _sl_dlopen();
  qword_1000E3870 = result;
  return result;
}

void sub_100031600(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

void sub_100031620(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100031654(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_100031B94()
{
  v2[0] = &off_1000C6070;
  v3[0] = objc_opt_class();
  v2[1] = &off_1000C6088;
  v3[1] = objc_opt_class();
  v2[2] = &off_1000C60A0;
  v3[2] = objc_opt_class();
  v0 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];

  return v0;
}

id sub_100032500(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_1000344DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100034DA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100034DC4(uint64_t a1)
{
  [*(id *)(a1 + 32) initializeStateMachine];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setSession:v3];
}

void sub_100035288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a35);
  _Unwind_Resume(a1);
}

int64_t sub_100035324(id a1, CUStateEvent *a2)
{
  id v2 = a2;
  uint64_t v3 = [(CUStateEvent *)v2 name];
  if (([v3 isEqualToString:@"Start"] & 1) != 0
    || ([v3 isEqualToString:@"Reset"] & 1) != 0
    || ([v3 isEqualToString:@"Fail"] & 1) != 0
    || [v3 isEqualToString:@"Finish"])
  {
  }
  else
  {

    uint64_t v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100073448(v2);
    }
  }

  return 1;
}

uint64_t sub_1000353E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [v3 name];
  if ([v5 isEqualToString:@"Start"])
  {
    uint64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"Reset"])
  {
    uint64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"Fail"])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"Finish"])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = -1;
  }

  uint64_t v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000734D8(v3);
  }

  if ((unint64_t)(v6 - 1) < 2)
  {
    [WeakRetained _ignoreEvent:v6];
  }
  else
  {
    if (v6 == 3)
    {
      [*(id *)(a1 + 32) performEnterReadyState];
      goto LABEL_19;
    }
    if (!v6)
    {
      [WeakRetained _transitionToState:1 forEvent:0];
LABEL_19:
      uint64_t v8 = 2;
      goto LABEL_20;
    }
  }
  uint64_t v8 = 1;
LABEL_20:

  return v8;
}

uint64_t sub_100035534(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[CUStateEvent enterState];

  if (v5 == v3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = [v3 name];
    if ([v6 isEqualToString:@"Start"])
    {
      uint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"Reset"])
    {
      uint64_t v7 = 3;
    }
    else if ([v6 isEqualToString:@"Fail"])
    {
      uint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"Finish"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  uint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100073568();
  }

  switch(v7)
  {
    case 0:
      [WeakRetained performLoadingPlistData:0];
      goto LABEL_22;
    case 1:
      uint64_t v9 = 2;
      uint64_t v10 = WeakRetained;
      uint64_t v11 = 2;
      uint64_t v12 = 1;
      goto LABEL_20;
    case 2:
      uint64_t v9 = 2;
      uint64_t v10 = WeakRetained;
      uint64_t v11 = 3;
      uint64_t v12 = 2;
LABEL_20:
      [v10 _transitionToState:v11 forEvent:v12];
      break;
    case 3:
      [WeakRetained _transitionToState:0 forEvent:3];
LABEL_22:
      uint64_t v9 = 2;
      break;
    default:
      uint64_t v9 = 1;
      break;
  }

  return v9;
}

uint64_t sub_1000356EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = +[CUStateEvent enterState];

  if (v5 == v3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = [v3 name];
    if ([v6 isEqualToString:@"Start"])
    {
      uint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"Reset"])
    {
      uint64_t v7 = 3;
    }
    else if ([v6 isEqualToString:@"Fail"])
    {
      uint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"Finish"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  uint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000735F8();
  }

  if ((unint64_t)(v7 - 1) < 2)
  {
    uint64_t v9 = WeakRetained;
    uint64_t v10 = 3;
    uint64_t v11 = v7;
LABEL_21:
    [v9 _transitionToState:v10 forEvent:v11];
    goto LABEL_22;
  }
  if (v7 == 3)
  {
    uint64_t v9 = WeakRetained;
    uint64_t v10 = 0;
    uint64_t v11 = 3;
    goto LABEL_21;
  }
  if (v7)
  {
    uint64_t v12 = 1;
    goto LABEL_24;
  }
  [*(id *)(a1 + 32) performLookup:0];
LABEL_22:
  uint64_t v12 = 2;
LABEL_24:

  return v12;
}

uint64_t sub_10003586C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = +[CUStateEvent enterState];

  if (v5 == v3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = [v3 name];
    if ([v6 isEqualToString:@"Start"])
    {
      uint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"Reset"])
    {
      uint64_t v7 = 3;
    }
    else if ([v6 isEqualToString:@"Fail"])
    {
      uint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"Finish"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  uint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100073688();
  }

  uint64_t v9 = 2;
  switch(v7)
  {
    case -1:
      uint64_t v9 = 1;
      break;
    case 0:
      [*(id *)(a1 + 32) performDoneCaptureResult];
      goto LABEL_20;
    case 1:
      [*(id *)(a1 + 32) performPostResponseAndReleaseData];
      goto LABEL_20;
    case 3:
      [WeakRetained _transitionToState:0 forEvent:3];
LABEL_20:
      uint64_t v9 = 2;
      break;
    default:
      break;
  }

  return v9;
}

void sub_100035F24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100035F38(uint64_t a1)
{
  id v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000739D0(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) session];
  uint64_t v12 = [*(id *)(a1 + 40) plistURL];
  int v13 = [*(id *)(a1 + 40) responseBlock];
  [v10 lookupCarcapabilitiesForSession:v11 plistURL:v12 completionHandler:v13];
}

void sub_10003664C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (sub_1000366B0(a2, *(void **)(a1 + 32))) {
    [*(id *)(a1 + 40) addObjectsFromArray:v5];
  }
}

unint64_t sub_1000366B0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = [v3 localizedCaseInsensitiveCompare:v4];
    unint64_t v6 = v5 == 0;
    if (v4 && v3 && v5)
    {
      if ((unint64_t)[v3 length] >= 3 && objc_msgSend(v3, "hasPrefix:", @"*")) {
        unsigned int v7 = [v3 hasSuffix:@"*"] ^ 1;
      }
      else {
        unsigned int v7 = 1;
      }
      if ((unint64_t)[v4 length] >= 3 && objc_msgSend(v4, "hasPrefix:", @"*")) {
        unsigned int v11 = [v4 hasSuffix:@"*"] ^ 1;
      }
      else {
        unsigned int v11 = 1;
      }
      if (((v7 | v11 ^ 1) & 1) == 0)
      {
        uint64_t v12 = [v3 substringWithRange:1, [v3 length] - 2];
        int v13 = v4;
        goto LABEL_25;
      }
      if (((v11 | v7 ^ 1) & 1) == 0)
      {
        uint64_t v12 = [v4 substringWithRange:1, (char *)[v4 length] - 2];
        int v13 = v3;
LABEL_25:
        unint64_t v6 = (unint64_t)[v13 localizedCaseInsensitiveContainsString:v12];
      }
    }
  }
  else
  {
    uint64_t v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v4;
      }
      else {
        id v9 = v3;
      }
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Invalid plist data, expecting a string: %@", (uint8_t *)&v14, 0xCu);
    }

    unint64_t v6 = 0;
  }

  return v6;
}

void sub_100036BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036BF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100036C04(uint64_t a1)
{
}

void sub_100036C0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v3];
  if (v5)
  {
    unint64_t v6 = +[NSMutableSet setWithArray:v5];
    [v4 unionSet:v6];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        int v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
        uint64_t v15 = 0;
        if ([*(id *)(a1 + 32) _vehicleSatisfiesConfiguration:v13 propertyHits:&v15])
        {
          uint64_t v14 = v15;
          if (v15 > v10)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v13);
            uint64_t v10 = v14;
          }
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void sub_1000373A0(id a1)
{
  uint64_t v1 = (void *)qword_1000E3880;
  qword_1000E3880 = (uint64_t)&off_1000C71F0;
}

void sub_1000374F8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_1000377E8(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) |= *(void *)(result + 40);
  return result;
}

uint64_t sub_10003794C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) &= ~*(void *)(result + 40);
  return result;
}

uint64_t sub_100037A40(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

void sub_100037B10(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) &= 0xFFFFFFFFFFFFFFE4;
  id v1 = [*(id *)(a1 + 32) preferences];
  [v1 setDisableTimerTimestamp:0];
}

void sub_100037DF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100038318(uint64_t a1, uint64_t a2)
{
  if (!a2 && *(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setPowered:1];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t sub_10003875C(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v3 = objc_alloc_init(CRWiFiCarManager);
    [(CRWiFiCarManager *)v3 setPowered:1];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_100038A74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100038A90(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _mainQueue_performWithPromptPresenter:*(void *)(a1 + 32) isUILocked:a2 errorHandler:*(void *)(a1 + 40)];
}

void sub_100038D70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100038DA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained performWithPromptPresenter:*(void *)(a1 + 32) errorHandler:*(void *)(a1 + 40)];
}

void sub_100038DF0(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unint64_t v6 = CarPairingLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100073BC8();
  }

  [WeakRetained _mainQueue_unblockSessionQueue];
  id v7 = [WeakRetained setupLauncher];
  [v7 invalidate];

  [WeakRetained setSetupLauncher:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100038EA0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038F48;
  block[3] = &unk_1000BE490;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100038F48(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentPresenterSession];
  if (!v2)
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100073BFC();
    }

    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = *(void (**)(void))(v3 + 16);
LABEL_7:
    v4();
  }
}

void sub_100039180(uint64_t a1)
{
  int v2 = SBSGetScreenLockStatus();
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    *(_DWORD *)long long buf = 138543362;
    CFStringRef v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "ui locked: %{public}@", buf, 0xCu);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000392C4;
  v5[3] = &unk_1000BD848;
  id v6 = *(id *)(a1 + 32);
  BOOL v7 = v2 != 0;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

uint64_t sub_1000392C4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

intptr_t sub_1000393F4(uint64_t a1)
{
  int v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100073C3C();
  }

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_1000395F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003960C(uint64_t a1, uint64_t a2)
{
  CFStringRef v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlay Setup lockscreen alert dismiss with response: %lu", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLockscreenAlert:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void sub_100039B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100039B84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100039B94(uint64_t a1)
{
}

id sub_100039B9C(void *a1)
{
  int v2 = objc_alloc_init(CRSetupPromptPresenterSession);
  uint64_t v3 = *(void *)(a1[6] + 8);
  CFStringRef v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setSessionDelegate:a1[4]];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setConnection:a1[5]];
  id v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);

  return [v5 setCurrentPresenterSession:v6];
}

void sub_100039C20(uint64_t a1)
{
  int v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_DWORD *)long long buf = 138412290;
    id v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setup prompt service connection interrupted: %@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039D38;
  block[3] = &unk_1000BD1B0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100039D38(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentPresenterSession:0];
}

void sub_100039D44(uint64_t a1)
{
  int v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_DWORD *)long long buf = 138412290;
    id v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setup prompt service connection invalidated: %@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039E5C;
  block[3] = &unk_1000BD1B0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100039E5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentPresenterSession:0];
}

void sub_10003A2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003A300(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CFStringRef v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = [v6 length];

  [WeakRetained _sendData:v7 length:v8];
}

id sub_10003A38C()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_1000E3888;
  uint64_t v7 = qword_1000E3888;
  if (!qword_1000E3888)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003B804;
    void v3[3] = &unk_1000BD318;
    void v3[4] = &v4;
    sub_10003B804((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10003A458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A58C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003A5A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleReads];
}

void sub_10003A9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003AA24(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setRxpcConnection:v3];

  uint64_t v4 = [WeakRetained rxpcConnection];

  if (v4)
  {
    [WeakRetained _setupACCTransportClient];
    [WeakRetained _setupXPCEventHandler];
    id v5 = [WeakRetained rxpcConnection];
    xpc_remote_connection_activate();
  }
}

void sub_10003AAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLockdownConnection:a2 info:a3];
}

void sub_10003ADD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003ADF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[NSString stringWithCString:xpc_copy_description(v3) encoding:4];
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"Connection Invalid.";
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v11 = 0;
    }
    else if (v3 == &_xpc_error_termination_imminent)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Termination Imminent.";
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v11 = 1;
    }
    else
    {
      if (v3 != &_xpc_error_connection_interrupted) {
        goto LABEL_18;
      }
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"Connection Interrupted.";
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v11 = 2;
    }
    uint64_t v12 = +[NSError errorWithDomain:@"com.apple.carkit.CRCarKitIAPServiceAgent" code:v11 userInfo:v10];

    if (v12)
    {
      int v13 = CarGeneralLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100073F30();
      }

LABEL_20:
      [WeakRetained _closeXPCConnection];
      goto LABEL_21;
    }
LABEL_18:
    uint64_t v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100073EC8();
    }
    goto LABEL_20;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    size_t v14 = 0;
    data = xpc_dictionary_get_data(v3, "payload", &v14);
    if (v14)
    {
      uint64_t v7 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data);
      id v8 = [sub_10003A38C() sharedClient];
      CFStringRef v9 = [WeakRetained endpointUUID];
      [v8 processIncomingData:v7 forEndpointWithUUID:v9];
    }
    else
    {
      uint64_t v7 = CarGeneralLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100073F98();
      }
    }
  }
LABEL_21:
}

void sub_10003B2B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10003B2DC(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  os_unfair_lock_lock(WeakRetained + 2);
  if ([(os_unfair_lock_s *)WeakRetained lock_lockdownConnection]) {
    lockdown_get_buffered_read_size();
  }
  os_unfair_lock_unlock(WeakRetained + 2);
}

Class sub_10003B804(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000E3890)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10003B948;
    void v4[4] = &unk_1000BD350;
    v4[5] = v4;
    long long v5 = off_1000BE550;
    uint64_t v6 = 0;
    qword_1000E3890 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1000E3890)
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
    Class result = objc_getClass("ACCTransportClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_100074094();
LABEL_8:
    free(v2);
  }
  qword_1000E3888 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10003B948()
{
  uint64_t result = _sl_dlopen();
  qword_1000E3890 = result;
  return result;
}

void sub_10003BAEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) configuration];
  unsigned int v4 = [v3 supportsLogTransfer];

  if (v4)
  {
    long long v5 = sub_10005C6FC(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "session connected, setting up the logging file receiver", v8, 2u);
    }

    uint64_t v6 = [[CRLoggingFileReceiver alloc] initWithSession:*(void *)(a1 + 32)];
    uint64_t v7 = (void *)WeakRetained[1];
    WeakRetained[1] = v6;
  }
}

void sub_10003BC58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained currentLoggingFileReceiver];

  if (v2)
  {
    id v3 = sub_10005C6FC(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "session disconnected, removing the logging file receiver", v6, 2u);
    }

    unsigned int v4 = [WeakRetained currentLoggingFileReceiver];
    [v4 invalidate];

    long long v5 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

void sub_10003C190(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Saved log archive from vehicle at %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 40) setTransaction:0];
  uint64_t v4 = [*(id *)(a1 + 40) currentCompletion];
  long long v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void sub_10003CA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003CEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
}

void sub_10003CF48(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000741A8(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeConnection:v4];
}

void sub_10003CFC4(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10007422C(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeConnection:v4];
}

void sub_10003D174(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing owners for connection: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) _work_queue_removeNavigationOwnerForConnection:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) observers];
  [v4 removeObject:*(void *)(a1 + 32)];
}

id sub_10003D3BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _work_queue_updateOwnershipToiOSIfNecessary];
}

void sub_10003D504(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];
}

id sub_10003D630(uint64_t a1)
{
  return [*(id *)(a1 + 32) _work_queue_navigationOwnershipChangedFromCar];
}

id sub_10003D730(uint64_t a1)
{
  return [*(id *)(a1 + 32) _work_queue_addNavigationIdentifer:*(void *)(a1 + 40) supportsAccNav:*(unsigned __int8 *)(a1 + 56) forConnection:*(void *)(a1 + 48)];
}

void sub_10003D808(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

id sub_10003D93C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _work_queue_removeOwnerWithIdentifier:*(void *)(a1 + 40) forConnection:*(void *)(a1 + 48)];
}

void sub_10003DAD0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) owners];
  id v5 = [v2 lastObject];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v5 identifier];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void sub_10003DC0C(uint64_t a1)
{
  [*(id *)(a1 + 32) _work_queue_activeNavigationIdentifiers];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10003DD78(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 connection];
  if ([v3 processIdentifier] != *(_DWORD *)(a1 + 48))
  {

LABEL_8:
    uint64_t v7 = v8;
    goto LABEL_9;
  }
  id v4 = *(void **)(a1 + 32);
  if (!v4)
  {

    goto LABEL_7;
  }
  id v5 = [v8 identifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  uint64_t v7 = v8;
  if (v6)
  {
LABEL_7:
    [*(id *)(a1 + 40) addObject:v8];
    goto LABEL_8;
  }
LABEL_9:
}

void sub_10003E3D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 remoteObjectProxy];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CRCarPlayNavigationOwnerClient]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    unsigned int v6 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation owner observer: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [v5 activeNavigationIdentifiersChangedTo:*(void *)(a1 + 32)];
  }
  id v7 = [v3 remoteObjectProxy];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___CRNavigationClient]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    uint64_t v9 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation observer: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [v8 activeNavigationIdentifiersChangedTo:*(void *)(a1 + 32)];
    uint64_t v10 = [*(id *)(a1 + 40) accNavProvider];
    uint64_t v11 = [v10 activeComponents];
    [v8 didUpdateActiveComponents:v11];
  }
}

void sub_10003ED2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Informing navigation observer: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [v3 remoteObjectProxy];
  [v5 activeNavigationIdentifiersChangedTo:*(void *)(a1 + 32)];
}

void sub_10003EFA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 connection];
  id v5 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v3 identifier];
    id v7 = [v3 connection];
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 1024;
    unsigned int v12 = [v7 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[navigationOwnershipChangedFromCar] Informing navigation owner: %{public}@(%d)", (uint8_t *)&v9, 0x12u);
  }
  id v8 = [v4 remoteObjectProxy];
  [v8 navigationOwnershipChangedTo:*(void *)(a1 + 32)];
}

void sub_10003F2D4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

void sub_10003FB4C(uint64_t a1)
{
  id v2 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) owners];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v16 = v3;
    __int16 v17 = 2114;
    CFStringRef v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "activeComponents=%{public}@ owners=%{public}@", buf, 0x16u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [*(id *)(a1 + 40) owners];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 40) _work_queue_updateActiveComponents:forOwner:*(void *)(a1 + 32) *(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

Class sub_10003FEC8(uint64_t a1)
{
  sub_10003FF20();
  Class result = objc_getClass("CRAccNavProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000E3898 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100074478();
    return (Class)sub_10003FF20();
  }
  return result;
}

uint64_t sub_10003FF20()
{
  v3[0] = 0;
  if (!qword_1000E38A0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    void v3[3] = sub_100040020;
    void v3[4] = &unk_1000BD350;
    void v3[5] = v3;
    long long v4 = off_1000BE678;
    uint64_t v5 = 0;
    qword_1000E38A0 = _sl_dlopen();
  }
  uint64_t v0 = qword_1000E38A0;
  id v1 = (void *)v3[0];
  if (!qword_1000E38A0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100040020()
{
  uint64_t result = _sl_dlopen();
  qword_1000E38A0 = result;
  return result;
}

void *sub_100040094(uint64_t a1)
{
  id v2 = (void *)sub_10003FF20();
  uint64_t result = dlsym(v2, "CRNavigationServiceInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000E38A8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000400E4(uint64_t a1)
{
  id v2 = (void *)sub_10003FF20();
  uint64_t result = dlsym(v2, "CRNavigationClientInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000E38B0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000417EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100041854(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041910;
  v5[3] = &unk_1000BD5C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100041910(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _presentNextStepAfterResponse:*(void *)(a1 + 32)];
}

void sub_100041BA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100041BBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100041CB0;
  v6[3] = &unk_1000BD580;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 presentBluetoothConfirmationPromptForVehicleName:v4 numericCode:v5 responseHandler:v6];

  objc_destroyWeak(&v9);
}

void sub_100041C9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100041CB0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (a2) {
      CFStringRef v6 = @"YES";
    }
    int v11 = 138543362;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth confirmation prompt received response: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = +[NSNumber numberWithBool:a2];
  [WeakRetained setBluetoothConfirmed:v7];

  if (!a2 || ([WeakRetained showBluetoothOnlyOption] & 1) == 0)
  {
    id v8 = [WeakRetained promptDelegate];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 pairingPromptFlow:WeakRetained receivedBluetoothConfirmationResponse:a2 forDeviceIdentifier:*(void *)(a1 + 32)];
    }
  }
  [WeakRetained setNumericCode:0];
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_100041F38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100041F54(id *a1, void *a2)
{
  id v3 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100042034;
  v4[3] = &unk_1000BD580;
  objc_copyWeak(&v7, a1 + 6);
  id v5 = a1[4];
  id v6 = a1[5];
  [v3 presentBluetoothContactsSyncPromptWithResponseHandler:v4];

  objc_destroyWeak(&v7);
}

void sub_100042020(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100042034(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (a2) {
      CFStringRef v6 = @"YES";
    }
    int v12 = 138543362;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth contacts sync prompt received response: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [WeakRetained promptDelegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 pairingPromptFlow:WeakRetained receivedBluetoothContactsSyncResponse:a2 forDeviceIdentifier:*(void *)(a1 + 32)];
  }
  if ([WeakRetained showBluetoothOnlyOption])
  {
    id v8 = [WeakRetained bluetoothConfirmed];
    unsigned int v9 = [v8 BOOLValue];

    if (v7)
    {
      if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v7 pairingPromptFlow:WeakRetained receivedBluetoothConfirmationResponse:1 forDeviceIdentifier:*(void *)(a1 + 32)];
      }
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  int v11 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

void sub_1000422B8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042358;
  v5[3] = &unk_1000BD640;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 presentBluetoothFailedPromptForVehicleName:v4 isTimeout:v3 responseHandler:v5];
}

uint64_t sub_100042358(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Bluetooth failed prompt received response", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004245C(id a1, CRPairingPromptPresenting *a2)
{
}

void sub_100042558(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100042574(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042648;
  v5[3] = &unk_1000BE778;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  [v3 presentAllowWhileLockedPromptForVehicleName:v4 responseHandler:v5];

  objc_destroyWeak(&v7);
}

void sub_100042634(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100042648(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (a2) {
      CFStringRef v6 = @"YES";
    }
    int v11 = 138543362;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "allow while locked prompt received response: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = +[NSNumber numberWithBool:a2];
  [WeakRetained setPairingAccepted:v7];

  id v8 = [WeakRetained promptDelegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 pairingPromptFlow:WeakRetained receivedAllowWhileLockedResponse:a2];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_100042AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100042B08(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100042C0C;
  v8[3] = &unk_1000BE7C8;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  __int16 v11 = *(_WORD *)(a1 + 72);
  id v9 = *(id *)(a1 + 40);
  uint64_t v4 = objc_retainBlock(v8);
  unsigned int v5 = [*(id *)(a1 + 32) _supportsThemeAssets];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  if (v5) {
    [v3 presentAssetSupportingUseWirelessPromptWithWirelessEnablement:v6 declineVariant:v7 responseHandler:v4];
  }
  else {
    [v3 presentUseWirelessPromptWithWirelessEnablement:v6 declineVariant:v7 responseHandler:v4];
  }

  objc_destroyWeak(&v10);
}

void sub_100042BF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100042C0C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (a2) {
      CFStringRef v6 = @"YES";
    }
    int v10 = 138543362;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "use wireless prompt received response: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if ((a2 & 1) == 0) {
    [WeakRetained _incrementOutOfBandPairingDeclineCount];
  }
  uint64_t v7 = [WeakRetained promptDelegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 pairingPromptFlow:WeakRetained receivedUseWirelessResponse:a2 turnOnBluetooth:*(unsigned __int8 *)(a1 + 48) turnOnWiFi:*(unsigned __int8 *)(a1 + 49)];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void sub_100042EB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_100042ED0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100042FE0;
  v8[3] = &unk_1000BE818;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  char v11 = *(unsigned char *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  uint64_t v4 = objc_retainBlock(v8);
  unsigned int v5 = [*(id *)(a1 + 32) _supportsThemeAssets];
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = *(unsigned char *)(a1 + 65) != 0;
  if (v5) {
    [v3 presentAssetSupportingConnectPromptWithBluetoothOnlyOption:v7 wirelessEnablement:v6 responseHandler:v4];
  }
  else {
    [v3 presentConnectPromptWithBluetoothOnlyOption:v7 wirelessEnablement:v6 responseHandler:v4];
  }

  objc_destroyWeak(&v10);
}

void sub_100042FCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100042FE0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (a2) {
      CFStringRef v6 = @"YES";
    }
    int v11 = 138543362;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connect CarPlay prompt received response: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  BOOL v7 = +[NSNumber numberWithBool:a2];
  [WeakRetained setPairingAccepted:v7];

  uint64_t v8 = [WeakRetained promptDelegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 pairingPromptFlow:WeakRetained receivedConnectCarPlayResponse:a2 turnOnWiFi:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_1000432A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1000432C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000433D0;
  v8[3] = &unk_1000BE818;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  char v11 = *(unsigned char *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  uint64_t v4 = objc_retainBlock(v8);
  unsigned int v5 = [*(id *)(a1 + 32) _supportsThemeAssets];
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = *(unsigned char *)(a1 + 65) != 0;
  if (v5) {
    [v3 presentAssetSupportingConnectPromptWithBluetoothOnlyOption:v7 wirelessEnablement:v6 responseHandler:v4];
  }
  else {
    [v3 presentConnectPromptWithBluetoothOnlyOption:v7 wirelessEnablement:v6 responseHandler:v4];
  }

  objc_destroyWeak(&v10);
}

void sub_1000433BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000433D0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (a2) {
      CFStringRef v6 = @"YES";
    }
    int v15 = 138543362;
    CFStringRef v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connect CarPlay from car key prompt received response: %{public}@", (uint8_t *)&v15, 0xCu);
  }

  BOOL v7 = +[NSNumber numberWithBool:a2];
  [WeakRetained setPairingAccepted:v7];

  uint64_t v8 = [WeakRetained promptDelegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = [WeakRetained vehicleName];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [WeakRetained bluetoothDeviceIdentifier];
    }
    CFStringRef v12 = v11;

    [v8 pairingPromptFlow:WeakRetained receivedConnectCarPlayFromCarKeyResponse:a2 vehicleName:v12 turnOnWiFi:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t v13 = *(void *)(a1 + 32);
  size_t v14 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
}

void sub_10004367C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100043698(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004376C;
  v5[3] = &unk_1000BE778;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  [v3 presentEnhancedIntegrationPromptForVehicleName:v4 responseHandler:v5];

  objc_destroyWeak(&v7);
}

void sub_100043758(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10004376C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (a2) {
      CFStringRef v6 = @"YES";
    }
    int v10 = 138543362;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enhanced integrated prompt received response: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [WeakRetained promptDelegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 pairingPromptFlow:WeakRetained receivedEnhancedIntegrationResponse:a2];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void sub_100043A10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100043A2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100043B68;
  v9[3] = &unk_1000BD640;
  id v10 = *(id *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043BEC;
  v6[3] = &unk_1000BE778;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  [v3 presentAssetProgressForVehicleName:v4 progress:v5 completionHandler:v9 cancelHandler:v6];

  objc_destroyWeak(&v8);
}

void sub_100043B54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100043B68(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "asset progress prompt completed", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100043BEC(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = CarPairingLogging();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "asset progress prompt: ready soon.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "asset progress prompt: canceled", v7, 2u);
    }

    [WeakRetained _cancelWithRequiredStepsRemaining:1];
  }
}

void sub_100043D94(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043E24;
  v4[3] = &unk_1000BD640;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 presentAssetReadyForVehicleName:v3 confirmationHandler:v4];
}

uint64_t sub_100043E24(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "asset ready prompt was confirmed", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100043F68(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043FF8;
  v4[3] = &unk_1000BD640;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 presentAssetReadySoonForVehicleName:v3 confirmationHandler:v4];
}

uint64_t sub_100043FF8(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "asset ready soon prompt was confirmed", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100044164(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100044204;
  v5[3] = &unk_1000BD640;
  id v6 = *(id *)(a1 + 48);
  [a2 presentSetupCarKeysPromptForVehicleName:v3 carKeyInfo:v4 cancelHandler:v5];
}

uint64_t sub_100044204(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "setup car keys prompt was canceled", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100044A38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "initializeForVehicleAddress: %@ keyIdentifier: %@", (uint8_t *)&v6, 0x16u);
  }

  [WeakRetained setBluetoothAddress:*(void *)(a1 + 32)];
  [WeakRetained setKeyIdentifier:*(void *)(a1 + 40)];
  [WeakRetained setActive:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100044C18(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = CarPairingLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 48);
    *(_DWORD *)long long buf = 134217984;
    long long v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "requestPairingForIntent: %lu", buf, 0xCu);
  }

  [WeakRetained setIntent:*(void *)(a1 + 48)];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000450EC;
  v26[3] = &unk_1000BE958;
  objc_copyWeak(&v28, v2);
  id v27 = *(id *)(a1 + 32);
  int v6 = objc_retainBlock(v26);
  if ([WeakRetained isPairingAvailable])
  {
    uint64_t v7 = [WeakRetained bluetoothAddress];
    unsigned __int8 v8 = [WeakRetained isActive];
    if (v7) {
      unsigned __int8 v9 = v8;
    }
    else {
      unsigned __int8 v9 = 0;
    }
    if ((v9 & 1) == 0)
    {
      uint64_t v13 = CarPairingLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000745D8();
      }

      ((void (*)(void *, uint64_t, void))v6[2])(v6, 5, 0);
      goto LABEL_33;
    }
    id v10 = +[CRBluetoothManager addressStringForData:v7];
    if (+[CRBluetoothManager hasPairingWithAddress:v10])
    {
      CFStringRef v11 = CarPairingLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138477827;
        long long v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "cannot start pairing, already paired with %{private}@", buf, 0xCu);
      }

      ((void (*)(void *, uint64_t, void))v6[2])(v6, 1, 0);
      goto LABEL_32;
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000451E8;
    v22[3] = &unk_1000BE418;
    objc_copyWeak(&v25, v2);
    id v23 = v6;
    id v24 = *(id *)(a1 + 32);
    [WeakRetained setPromptResponseHandler:v22];
    size_t v14 = CarPairingLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "pairing request setup, waiting on user prompt response", buf, 2u);
    }

    int v15 = [WeakRetained carPlayPreferences];
    CFStringRef v16 = [v15 isCCCHeadUnitPairingOverrideEnabled];

    if (!v16 || ![v16 BOOLValue])
    {
LABEL_31:

      objc_destroyWeak(&v25);
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    __int16 v17 = [WeakRetained carPlayPreferences];
    CFStringRef v18 = [v17 shouldAlwaysAcceptCCCHeadUnitPairing];

    if (!v18)
    {
LABEL_30:

      goto LABEL_31;
    }
    id v19 = [v18 BOOLValue];
    if (v19)
    {
      CFStringRef v20 = CarPairingLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v21 = "accepting head unit pairing due to preview preference";
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
      }
    }
    else
    {
      CFStringRef v20 = CarPairingLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v21 = "declining head unit pairing due to preview preference";
        goto LABEL_28;
      }
    }

    [WeakRetained handlePairingPromptResponse:v19];
    goto LABEL_30;
  }
  CFStringRef v12 = CarPairingLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10007460C();
  }

  ((void (*)(void *, uint64_t, void))v6[2])(v6, 2, 0);
LABEL_34:

  objc_destroyWeak(&v28);
}

void sub_100045088(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000450EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setActive:0];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, void, void, void, void, void, id))(v7 + 16))(v7, a2, 0, 0, 0, 0, 0, v5);
    unsigned __int8 v8 = +[CARAnalytics sharedInstance];
    unsigned __int8 v9 = v8;
    uint64_t v10 = a2 ? 4 : 3;
    [v8 setCarKeyPairingResult:v10];

    if (a2 == 5)
    {
      CFStringRef v11 = CarPairingLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failed CCC head unit pairing", v12, 2u);
      }
    }
  }
}

void sub_1000451E8(id *a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100045350;
    v8[3] = &unk_1000BE980;
    id v9 = a1[5];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000454AC;
    v6[3] = &unk_1000BD640;
    id v7 = a1[4];
    [WeakRetained _mainQueue_requestLocalOOBDataWithCompletion:v8 errorHandler:v6];
  }
  else
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "declining head unit pairing", buf, 2u);
    }

    (*((void (**)(void))a1[4] + 2))();
  }
}

void sub_100045350(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  CFStringRef v16 = CarPairingLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v18 = 138478851;
    id v19 = v11;
    __int16 v20 = 2113;
    id v21 = v12;
    __int16 v22 = 2113;
    id v23 = v13;
    __int16 v24 = 2113;
    id v25 = v14;
    __int16 v26 = 2113;
    id v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "replying with this address: %{private}@, c192: %{private}@ r192: %{private}@ c256: %{private}@ r256: %{private}@", (uint8_t *)&v18, 0x34u);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, void, id, id, id, id, id, void))(v17 + 16))(v17, 0, v11, v12, v13, v14, v15, 0);
  }
}

uint64_t sub_1000454AC(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100074640();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100045674(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = a1[4];
    id v5 = a1[5];
    id v6 = a1[6];
    id v7 = a1[7];
    *(_DWORD *)long long buf = 138413058;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "setupVehicleDataC192: %@ r192: %@ c256: %@ r256: %@", buf, 0x2Au);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004580C;
  v8[3] = &unk_1000BEA20;
  void v8[4] = WeakRetained;
  id v13 = a1[8];
  id v9 = a1[4];
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[7];
  [WeakRetained _mainQueue_performWithPairingAgent:v8];
}

void sub_10004580C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100045AFC;
  v21[3] = &unk_1000BE9D0;
  v21[4] = *(void *)(a1 + 32);
  id v22 = *(id *)(a1 + 72);
  id v6 = objc_retainBlock(v21);
  if ([*(id *)(a1 + 32) isActive]
    && ([*(id *)(a1 + 32) bluetoothAddress],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [*(id *)(a1 + 32) _remoteDeviceFromSession:a3];
    if (v8)
    {
      id v9 = v8;
      if (BTPairingAgentClearOOBDataForDevice())
      {
        id v10 = CarPairingLogging();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100074710();
        }
      }
      else
      {
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        id v11 = *(void **)(a1 + 40);
        if (v11) {
          [v11 bytes];
        }
        id v12 = *(void **)(a1 + 48);
        if (v12) {
          [v12 bytes];
        }
        id v13 = *(void **)(a1 + 56);
        if (v13) {
          [v13 bytes];
        }
        id v14 = *(void **)(a1 + 64);
        if (v14) {
          [v14 bytes];
        }
        if (!BTPairingAgentSetOOBDataForDevice())
        {
          id v15 = *(void **)(a1 + 32);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100045BE8;
          v16[3] = &unk_1000BE9F8;
          id v17 = v6;
          uint64_t v18 = a2;
          id v19 = v9;
          int v20 = 0;
          [v15 _mainQueue_connectDevice:v9 session:a3 completion:v16];

          goto LABEL_10;
        }
        id v10 = CarPairingLogging();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000746A8();
        }
      }
    }
    else
    {
      id v10 = CarPairingLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100074674();
      }
    }
  }
  else
  {
    id v10 = CarPairingLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000745D8();
    }
  }

  ((void (*)(void *, uint64_t, void))v6[2])(v6, 5, 0);
LABEL_10:
}

void sub_100045AFC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setActive:0];
  [*(id *)(a1 + 32) _mainQueue_delegateDidFinishWithResult:a2 error:v5];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    id v7 = +[CARAnalytics sharedInstance];
    id v8 = v7;
    uint64_t v9 = a2 ? 4 : 3;
    [v7 setCarKeyPairingResult:v9];

    if (a2 == 5)
    {
      id v10 = CarPairingLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed CCC head unit pairing", v11, 2u);
      }
    }
  }
}

void sub_100045BE8(uint64_t a1, int a2)
{
  id v4 = CarPairingLogging();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pairing completed successfully", buf, 2u);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pairing completed with failure", v17, 2u);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
  int v7 = BTPairingAgentClearOOBDataForDevice();
  id v8 = CarPairingLogging();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100074778(a1, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cleared OOB data", v16, 2u);
  }
}

void sub_100045DD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = [WeakRetained isActive];
  uint64_t v3 = CarPairingLogging();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cancelPairing, canceling active session", buf, 2u);
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100045F00;
    v5[3] = &unk_1000BEA70;
    void v5[4] = WeakRetained;
    [WeakRetained _mainQueue_performWithPairingAgent:v5];
    [WeakRetained _mainQueue_delegateDidFinishWithResult:4 error:0];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "skipping cancelPairing, no active session", buf, 2u);
    }
  }
}

id sub_100045F00(uint64_t a1)
{
  int v2 = BTPairingAgentCancelPairing();
  uint64_t v3 = CarPairingLogging();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000748B8();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "successfully canceled BT pairing", buf, 2u);
  }

  BOOL v5 = [*(id *)(a1 + 32) bluetoothAddress];

  if (v5)
  {
    __int16 v14 = 0;
    int v13 = 0;
    uint64_t v6 = [*(id *)(a1 + 32) bluetoothAddress];
    [v6 getBytes:&v13 length:6];

    *(void *)long long buf = 0;
    if (BTDeviceFromAddress())
    {
      int v7 = CarPairingLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100074850();
      }
    }
    else
    {
      int v8 = BTPairingAgentClearOOBDataForDevice();
      uint64_t v9 = CarPairingLogging();
      int v7 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000747E8();
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cleared OOB data", v11, 2u);
      }
    }
  }
  return [*(id *)(a1 + 32) setActive:0];
}

void sub_1000465AC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id sub_1000465C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v7 = CarPairingLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67240192;
    v9[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BT session event: %{public}i", (uint8_t *)v9, 8u);
  }

  return [a4 _mainQueue_handleEvent:a2 forSession:a1];
}

void sub_100046684(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004672C;
  void v2[3] = &unk_1000BD7B8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

  objc_destroyWeak(&v4);
}

uint64_t sub_10004672C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, WeakRetained[1]);
    }
  }

  return _objc_release_x1();
}

void sub_10004682C(uint64_t a1)
{
  int v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100074AC0();
  }

  uint64_t v3 = [*(id *)(a1 + 32) waitingOnSession];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100046994(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046A0C;
  block[3] = &unk_1000BD1B0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100046A0C(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(void *)(v2 + 16))
  {
    uint64_t v3 = CarPairingLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100074B5C();
    }

    BTPairingAgentStop();
    uint64_t result = BTPairingAgentDestroy();
    *(void *)(*(void *)(v1 + 32) + 16) = 0;
    uint64_t v2 = *(void *)(v1 + 32);
  }
  if (*(void *)(v2 + 8))
  {
    id v4 = CarPairingLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100074B28();
    }

    BTServiceRemoveCallbacks();
    uint64_t result = BTSessionDetachWithQueue();
    *(void *)(*(void *)(v1 + 32) + _Block_object_dispose(&location, 8) = 0;
  }
  return result;
}

void sub_100046AE4(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *a6)
{
  if (a3 == 1)
  {
    if (a4 == 12)
    {
      uint64_t v10 = CarPairingLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 67240192;
        int v12 = a2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "disconnected BT service %{public}i", (uint8_t *)&v11, 8u);
      }
    }
  }
  else if (!a3 && a4 == 11)
  {
    uint64_t v9 = CarPairingLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 67240192;
      int v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "connected BT service %{public}i", (uint8_t *)&v11, 8u);
    }

    [a6 _mainQueue_handleDidConnectDevice:a1 service:a2];
  }
}

id sub_100046D84(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100074C2C();
  }

  return [*(id *)(a1 + 32) setSessionDetachHandler:0];
}

void sub_100046EB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100046ECC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      BOOL v5 = (char *)(WeakRetained + 2);
      if (!WeakRetained[2])
      {
        if (BTPairingAgentCreate())
        {
          uint64_t v9 = CarPairingLogging();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_100074C60();
          }
        }
      }
    }
    (*(void (**)(void, void, uint64_t, char *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v8[2], a2, v5, v6, v7);
  }
}

void sub_100046FA4(uint64_t a1, int a2)
{
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67240192;
    v4[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BT pairing event: %{public}i", (uint8_t *)v4, 8u);
  }
}

id sub_100047048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return [a6 _mainQueue_handleLocalOOBDataC192:r192:c256:r256:a2, a3, a4, a5];
}

void sub_10004715C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100047178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (a2 && WeakRetained)
  {
    int v8 = [WeakRetained _localDeviceAddressFromSession:a3];
    if (v8)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000472B8;
      v12[3] = &unk_1000BEAC0;
      id v14 = *(id *)(a1 + 40);
      id v13 = v8;
      [v7 setLocalOOBDataHandler:v12];
      BTPairingAgentGetLocalOOBData();
    }
    else
    {
      uint64_t v10 = CarPairingLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100074C94();
      }

      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        (*(void (**)(void))(v11 + 16))();
      }
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
}

uint64_t sub_1000472B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, *(void *)(a1 + 32), a2, a3, a4, a5);
  }
  return result;
}

void sub_100047730(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_100047754(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained connectionTimer];

  if (v4)
  {
    BOOL v5 = [WeakRetained connectionTimer];
    [v5 invalidate];

    [WeakRetained setConnectionTimer:0];
  }
  BTServiceRemoveCallbacks();
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
}

uint64_t sub_100047810(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connected BT using OOB pairing data", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100047890(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100074D98();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100047978(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bluetoothAddress];
  if (v2)
  {
    uint64_t v3 = +[CRBluetoothManager addressStringForData:v2];
    uint64_t v4 = [*(id *)(a1 + 32) _addressStringForDevice:*(void *)(a1 + 40)];
    BOOL v5 = (void *)v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      if ([v3 isEqualToString:v4])
      {
        int v7 = [*(id *)(a1 + 32) _intendedServiceMask];
        int v12 = 0;
        if (BTDeviceGetConnectedServices())
        {
          int v8 = CarPairingLogging();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            sub_100074E58();
          }
        }
        else
        {
          uint64_t v10 = CarPairingLogging();
          int v8 = v10;
          if ((v12 & v7) != 0)
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138478083;
              id v14 = v5;
              __int16 v15 = 1024;
              LODWORD(v16) = v12;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "bluetooth connected to %{private}@ with services: %i", buf, 0x12u);
            }

            uint64_t v11 = [*(id *)(a1 + 32) bluetoothConnectedHandler];
            int v8 = v11;
            if (v11) {
              (*(void (**)(uint64_t))(v11 + 16))(v11);
            }
          }
          else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            sub_100074DCC(&v12, v7, v8);
          }
        }
      }
      else
      {
        uint64_t v9 = CarPairingLogging();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138478083;
          id v14 = v5;
          __int16 v15 = 2113;
          __int16 v16 = v3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "connected address %{private}@ doesn't match expected address %{private}@", buf, 0x16u);
        }
      }
    }
  }
}

void sub_100047E58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100047F44(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049344;
  block[3] = &unk_1000BD1B0;
  id v4 = a2;
  id v2 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10004807C(id a1)
{
  qword_1000E38B8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRCarPlayDNDService];

  _objc_release_x1();
}

void sub_100048494(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000484B0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _createDrivingActivityModeIfNeeded:1];
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setActivatedByUserAction:*(unsigned __int8 *)(a1 + 48)];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000485D8;
  v6[3] = &unk_1000BE818;
  char v9 = v5;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  [v4 _setDNDActive:v5 trigger:1 withStartingGeofence:0 completion:v6];

  objc_destroyWeak(&v8);
}

void sub_1000485C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000485D8(uint64_t a1, int a2)
{
  char v2 = a2;
  id v4 = (unsigned __int8 *)(a1 + 48);
  if (*(unsigned __int8 *)(a1 + 48) == a2)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
  else
  {
    BOOL v6 = CarDNDWDLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100074F70(v4, v2, v6);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100048704;
    v8[3] = &unk_1000BD870;
    id v9 = *(id *)(a1 + 32);
    [WeakRetained _setDNDActive:0 trigger:1 withStartingGeofence:0 completion:v8];
  }
}

uint64_t sub_100048704(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000487DC(uint64_t a1)
{
  id v7 = +[CARDNDManager sharedManager];
  char v2 = [*(id *)(a1 + 32) status];
  [v2 setAutomaticDNDTriggeringMethod:0];

  id v3 = [*(id *)(a1 + 32) status];
  [v3 setHasAdjustedTriggerMethod:0];

  id v4 = [*(id *)(a1 + 32) status];
  [v4 setActivateWithCarPlay:0];

  uint64_t v5 = [*(id *)(a1 + 32) status];
  [v5 setHasMigratedToDriving:0];

  BOOL v6 = [v7 assertionTrap];
  [v6 releaseAllAssertions];

  [v7 setLastKnownReportTime:0.0];
  [v7 _cancelUserDisabledTimer];
}

uint64_t sub_100048E74(uint64_t a1, unint64_t a2)
{
  id v4 = +[CARAnalytics sharedInstance];
  uint64_t v5 = v4;
  if (a2 > 4) {
    CFStringRef v6 = @"Unknown";
  }
  else {
    CFStringRef v6 = off_1000BEC50[a2];
  }
  unint64_t v7 = *(void *)(a1 + 40);
  if (v7 > 4) {
    CFStringRef v8 = @"Unknown";
  }
  else {
    CFStringRef v8 = off_1000BEC50[v7];
  }
  [v4 userChangedAutoReplyFromAudience:v6 toAudience:v8 messageChanged:0];

  CFStringRef v9 = (const __CFString *)CARDNDAutoReplyAudience;
  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  CFPreferencesSetAppValue(v9, v10, CRPreferencesAutomaticDNDDomain);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDAutoReplyAudienceChangedNotification, 0, 0, 1u);
  int v12 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v12();
}

void sub_100049100(id a1, unint64_t a2, NSError *a3)
{
  id v4 = +[CARAnalytics sharedInstance];
  if (a2 > 4) {
    CFStringRef v5 = @"Unknown";
  }
  else {
    CFStringRef v5 = off_1000BEC78[a2];
  }
  id v6 = v4;
  [v4 userChangedAutoReplyFromAudience:v5 toAudience:v5 messageChanged:1];
}

void sub_100049344(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 status];
  [v1 _triggerModeChanged:[v2 automaticDNDTriggeringMethod] mechanism:@"Settings"];
}

id sub_1000496CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mainQueue_updateAssetRequests];
}

void sub_10004A060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void sub_10004A08C(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A144;
  block[3] = &unk_1000BECA8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_10004A144(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = CarThemeAssetsLogging();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "asset version %@ file send completed", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = 2;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100075180(a1, v5, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v7 = 3;
  }

  [WeakRetained setCurrentSessionTransferStatus:v7];
  [WeakRetained _mainQueue_invalidateFileSenderSession];
}

void sub_10004A5A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000751F0();
  }

  uint64_t v8 = [*(id *)(a1 + 32) assetDownloader];
  [v8 removeAssetsBeforeVersion:v6];
}

id sub_10004AFA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mainQueue_handleVehiclesChanged];
}

id sub_10004B04C(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAssetProgressForVehicleIdentifier:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _mainQueue_handleVehiclesChanged];
}

id sub_10004B100(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentSessionTransferStatus:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _mainQueue_evaluateAssetTransferIfConnected];
}

void sub_10004B1D8(uint64_t a1)
{
  [*(id *)(a1 + 32) _mainQueue_invalidateFileSenderSession];
  [*(id *)(a1 + 32) setCurrentSessionTransferStatus:0];
  id v2 = [[*(id *)(a1 + 32) _mainQueue_vehicleForSession:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = v2;
    int v3 = [v2 identifier];
    [*(id *)(a1 + 32) _removeAssetProgressForVehicleIdentifier:v3];
    [*(id *)(a1 + 32) _mainQueue_hintDownloadForVehicle:v4];

    id v2 = v4;
  }
}

void sub_10004B34C(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [*(id *)(a1 + 32) _vehiclesForAssetRequest:*(void *)(a1 + 40)];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&long long v4 = 138412546;
    long long v12 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [*(id *)(a1 + 32) _assetProgressForVehicle:v8, v12];
        [v9 addChild:*(void *)(a1 + 48) withPendingUnitCount:1];
        uint64_t v10 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v12;
          uint64_t v18 = v8;
          __int16 v19 = 2112;
          int v20 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "attempting download for vehicle %@, overall progress is now: %@", buf, 0x16u);
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [*(id *)(a1 + 32) libraryAgent];
  [v11 notifyAttemptingDownloadForAssetVersion:*(void *)(a1 + 56)];
}

void sub_10004B5C0(uint64_t a1)
{
  id v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "failed download for asset %{public}@", (uint8_t *)&v5, 0xCu);
  }

  long long v4 = [*(id *)(a1 + 40) libraryAgent];
  [v4 notifyFailedDownloadForAssetVersion:*(void *)(a1 + 32) error:*(void *)(a1 + 48)];
}

void sub_10004B74C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) version];
  uint64_t v3 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = *(NSObject **)(a1 + 32);
    int v5 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    id v37 = v4;
    __int16 v38 = 2114;
    uint64_t v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "hasAsset: %{public}@ forAssetRequest: %{public}@", buf, 0x16u);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [*(id *)(a1 + 48) _vehiclesForAssetRequest:*(void *)(a1 + 40)];
  id v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v32;
    *(void *)&long long v7 = 138543362;
    long long v29 = v7;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = obj;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v11);
        }
        long long v12 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v10);
        long long v13 = [*(id *)(a1 + 48) _assetVersionForVehicle:v12 v29];
        long long v14 = v13;
        if (v13 && [v13 compare:v2] == (id)-1)
        {
          long long v16 = [*(id *)(a1 + 48) _stagedAssetVersionForVehicle:v12];
          long long v15 = v16;
          if (!v16) {
            goto LABEL_21;
          }
          if ([v16 compare:v2] == (id)-1)
          {
            uint64_t v18 = [*(id *)(a1 + 48) sessionStatus];
            __int16 v19 = [v18 currentSession];

            if (v19)
            {
              int v20 = CarThemeAssetsLogging();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = v29;
                id v37 = v15;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ignoring next cluster asset, already have staged asset version: %{public}@ and currently connected", buf, 0xCu);
              }
            }
            else
            {
LABEL_21:
              id v21 = CarThemeAssetsLogging();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                id v22 = *(NSObject **)(a1 + 32);
                *(_DWORD *)long long buf = v29;
                id v37 = v22;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "staging asset %{public}@", buf, 0xCu);
              }

              uint64_t v23 = [v2 iOSContentVersion];
              [v12 setStagedClusterAssetiOSContentVersion:v23];

              uint64_t v24 = [v2 accessoryContentVersion];
              [v12 setStagedClusterAssetVersion:v24];

              id v25 = [*(id *)(a1 + 32) baseURL];
              [v12 setStagedClusterAssetURL:v25];

              __int16 v26 = [*(id *)(a1 + 48) vehicleStore];
              id v27 = [v26 saveVehicle:v12];

              [*(id *)(a1 + 48) _mainQueue_evaluateAssetTransferIfConnected];
            }
            uint64_t v11 = obj;
            goto LABEL_25;
          }
          id v17 = CarThemeAssetsLogging();
          uint64_t v11 = obj;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v29;
            id v37 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ignoring next cluster asset, already have staged asset version: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          long long v15 = CarThemeAssetsLogging();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543618;
            id v37 = v2;
            __int16 v38 = 2114;
            uint64_t v39 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "not staging asset version %{public}@ for vehicle with equal or newer asset version: %{public}@", buf, 0x16u);
          }
        }
LABEL_25:

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  id v28 = [*(id *)(a1 + 48) libraryAgent];
  [v28 notifyCompletedDownloadOfAsset:*(void *)(a1 + 32)];
}

void sub_10004BC38(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) _vehicleForVehicleIdentifier:*(void *)(a1 + 40)];
  long long v4 = v3;
  if (v3)
  {
    int v5 = [v3 clusterAssetIdentifier];
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) _assetRequestForVehicle:v4];
      if (v6)
      {
        long long v7 = [*(id *)(a1 + 32) assetDownloader];
        id v8 = [v7 assetRequests];
        unsigned __int8 v9 = [v8 containsObject:v6];

        if ((v9 & 1) == 0)
        {
          uint64_t v10 = CarThemeAssetsLogging();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v32 = v6;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "asset requested before vehicle ever connected, tracking asset request for download anyway: %@", buf, 0xCu);
          }

          [*(id *)(a1 + 32) _mainQueue_updateAssetRequests];
        }
      }
      uint64_t v11 = [*(id *)(a1 + 32) _assetVersionForVehicle:v4];
      uint64_t v12 = [v4 clusterAssetURL];
      long long v13 = (void *)v12;
      long long v30 = (void *)v6;
      if (v11 && v12)
      {
        id v14 = [objc_alloc((Class)CARThemeAsset) initWithBaseURL:v12 version:v11];
      }
      else
      {
        uint64_t v23 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v32 = (uint64_t)v4;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "vehicle doesn't have an applied asset yet: %@", buf, 0xCu);
        }

        id v14 = 0;
      }
      uint64_t v24 = [*(id *)(a1 + 32) _stagedAssetVersionForVehicle:v4];
      uint64_t v25 = [v4 stagedClusterAssetURL];
      __int16 v26 = (void *)v25;
      if (v24 && v25)
      {
        id v27 = [objc_alloc((Class)CARThemeAsset) initWithBaseURL:v25 version:v24];
      }
      else
      {
        id v28 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v32 = (uint64_t)v4;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "vehicle doesn't have a staged asset: %@", buf, 0xCu);
        }

        id v27 = 0;
      }
      long long v29 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v32 = (uint64_t)v14;
        __int16 v33 = 2114;
        id v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "replying with active asset %{public}@, staged asset: %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v22 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v32 = (uint64_t)v4;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "vehicle doesn't have an asset ID: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    long long v15 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100075344(v2, v15, v16, v17, v18, v19, v20, v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10004C0DC(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) _vehicleForVehicleIdentifier:*(void *)(a1 + 40)];
  long long v4 = CarThemeAssetsLogging();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v20 = 138543362;
      uint64_t v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "staging override asset %{public}@", (uint8_t *)&v20, 0xCu);
    }

    int v5 = [*(id *)(a1 + 48) version];
    long long v7 = [v5 iOSContentVersion];
    [v3 setStagedClusterAssetiOSContentVersion:v7];

    id v8 = [v5 accessoryContentVersion];
    [v3 setStagedClusterAssetVersion:v8];

    unsigned __int8 v9 = [*(id *)(a1 + 48) baseURL];
    [v3 setStagedClusterAssetURL:v9];

    uint64_t v10 = [*(id *)(a1 + 32) vehicleStore];
    id v11 = [v10 saveVehicle:v3];

    uint64_t v12 = [*(id *)(a1 + 32) _assetProgressForVehicle:v3];
    id v13 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
    [v13 setTotalUnitCount:1];
    [v13 setCompletedUnitCount:1];
    [v12 addChild:v13 withPendingUnitCount:1];
    [*(id *)(a1 + 32) _mainQueue_handleVehiclesChanged];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100075344(v2, v5, v14, v15, v16, v17, v18, v19);
  }
}

id sub_10004C3B4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  id v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t sub_10004C5D8(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 clusterAssetIdentifier];
  if (v4 && [a1[4] isEqualToString:v4])
  {
    int v5 = [v3 SDKVersion];
    if (v5 && objc_msgSend(a1[5], "cr_buildVersionCompare:", v5) != (id)1)
    {
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v6 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        long long v7 = [a1[6] maximumSDKVersion];
        int v10 = 138543618;
        id v11 = v7;
        __int16 v12 = 2112;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "asset from a request with SDK version %{public}@ cannot apply to vehicle with older SDK version: %@", (uint8_t *)&v10, 0x16u);
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_10004CF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_10004CF84(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Monitoring service connection interrupted or invalidated; removing connection.",
        buf,
        2u);
    }

    id v5 = objc_loadWeakRetained(v2);
    uint64_t v6 = [v5 connectionsQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004D09C;
    v7[3] = &unk_1000BD5C8;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    v7[4] = v5;
    dispatch_sync(v6, v7);

    objc_destroyWeak(&v8);
  }
}

uint64_t sub_10004D09C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) _removeConnection:WeakRetained];
  }

  return _objc_release_x1();
}

void sub_10004D450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004D47C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _addConnection:*(void *)(a1 + 32) forCertificateSerial:*(void *)(a1 + 40)];
}

void sub_10004DA40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004DA78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004DA88(uint64_t a1)
{
}

void sub_10004DA90(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) connections];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10004DAF4(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000753B4((uint64_t)v2, v3);
  }
}

void sub_10004DB48(uint64_t a1)
{
}

void sub_10004DB50(uint64_t a1)
{
}

uint64_t sub_10004DB58(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v2, v3);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

int64_t sub_10004DE2C(id a1, MAAsset *a2, MAAsset *a3)
{
  return [(MAAsset *)a2 cr_contentVersionCompare:a3];
}

void sub_10004E22C(id a1)
{
  qword_1000E38C8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRCarPlayConnectionTimeService];

  _objc_release_x1();
}

uint64_t sub_10004E30C(uint64_t a1)
{
  [*(id *)(a1 + 32) eraseConnectionData];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_10004E3F0(uint64_t a1)
{
  uint64_t v39 = [*(id *)(a1 + 32) sortedConnectionEvents];
  uint64_t v1 = [v39 valueForKeyPath:@"@distinctUnionOfObjects.identifier"];
  uint64_t v40 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v1;
  id v41 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v61;
    uint64_t v54 = CARBluetoothWirelessIAPProfileConnectionAttempt;
    uint64_t v50 = CARBluetoothWirelessIAPProfileConnectionSuccess;
    uint64_t v55 = CARCarKitVehicleInformationEvent;
    uint64_t v49 = CARCarKitAttemptingConnectionEvent;
    uint64_t v48 = CARCarKitTransportEvent;
    uint64_t v47 = CARWiFiBasicAssociationCompleted;
    uint64_t v46 = CARWiFiWPAHSCompleted;
    uint64_t v45 = CARWiFiDHCPCompleted;
    uint64_t v44 = CARAirPlayEndpointSelected;
    uint64_t v42 = CARCarKitConnectionSessionEndEvent;
    uint64_t v37 = CARAirPlayCarSentStatistics;
    uint64_t v35 = CARAirPlayConnectionTimeInfo;
    uint64_t v34 = CARiAPConnectionStart;
    uint64_t v33 = CARiAPAuthStarted;
    uint64_t v32 = CARiAPAuthComplete;
    uint64_t v31 = CARiAPNCMStart;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v61 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v60 + 1) + 8 * v2);
        id v51 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v52 = v3;
        id v4 = +[NSPredicate predicateWithFormat:@"identifier = %@", v3];
        id v5 = [v39 filteredArrayUsingPredicate:v4];

        uint64_t v6 = CarConnectionTimeLogging();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = [v5 count];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v65 = v52;
          __int16 v66 = 2048;
          id v67 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Number of fetched events for session identifier %@ : %lu", buf, 0x16u);
        }

        id v8 = objc_opt_new();
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v53 = v5;
        id v9 = [v53 countByEnumeratingWithState:&v56 objects:v70 count:16];
        uint64_t v43 = v2;
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v57 != v12) {
                objc_enumerationMutation(v53);
              }
              id v14 = [objc_alloc((Class)CARConnectionEvent) initWithDictionary:*(void *)(*((void *)&v56 + 1) + 8 * i)];
              uint64_t v15 = CarConnectionTimeLogging();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v16 = [v14 eventName];
                uint64_t v17 = [v14 eventDate];
                *(_DWORD *)long long buf = 138412802;
                uint64_t v65 = v52;
                __int16 v66 = 2112;
                id v67 = v16;
                __int16 v68 = 2112;
                v69 = v17;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetched event for session identifier %@ : %@ with date : %@", buf, 0x20u);
              }
              id v18 = [v14 eventName];
              if ([v18 isEqualToString:v54])
              {
                uint64_t v19 = 1;
              }
              else if ([v18 isEqualToString:v50])
              {
                uint64_t v19 = 2;
              }
              else if ([v18 isEqualToString:v55])
              {
                uint64_t v19 = 4;
              }
              else if ([v18 isEqualToString:v49])
              {
                uint64_t v19 = 8;
              }
              else if ([v18 isEqualToString:v48])
              {
                uint64_t v19 = 16;
              }
              else if ([v18 isEqualToString:v47])
              {
                uint64_t v19 = 32;
              }
              else if ([v18 isEqualToString:v46])
              {
                uint64_t v19 = 64;
              }
              else if ([v18 isEqualToString:v45])
              {
                uint64_t v19 = 128;
              }
              else if ([v18 isEqualToString:v44])
              {
                uint64_t v19 = 256;
              }
              else if ([v18 isEqualToString:v42])
              {
                uint64_t v19 = 512;
              }
              else if ([v18 isEqualToString:v37])
              {
                uint64_t v19 = 1024;
              }
              else if ([v18 isEqualToString:v35])
              {
                uint64_t v19 = 2048;
              }
              else if ([v18 isEqualToString:v34])
              {
                uint64_t v19 = 4096;
              }
              else if ([v18 isEqualToString:v33])
              {
                uint64_t v19 = 0x2000;
              }
              else if ([v18 isEqualToString:v32])
              {
                uint64_t v19 = 0x4000;
              }
              else if ([v18 isEqualToString:v31])
              {
                uint64_t v19 = 0x8000;
              }
              else
              {
                uint64_t v19 = 0;
              }

              int v20 = [v14 eventName];
              unsigned int v21 = [v20 isEqualToString:v55];

              if (v21)
              {
                id v22 = [v14 payload];
                id v23 = [v22 mutableCopy];

                id v8 = v23;
              }
              else
              {
                [v51 addObject:v14];
              }
              v11 |= v19;
            }
            id v10 = [v53 countByEnumeratingWithState:&v56 objects:v70 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v11 = 0;
        }

        uint64_t v24 = +[NSNumber numberWithUnsignedInteger:v11];
        uint64_t v25 = [v24 stringValue];
        [v8 setObject:v25 forKeyedSubscript:@"finalEventName"];

        id v26 = [objc_alloc((Class)NSUUID) initWithUUIDString:v52];
        id v27 = [objc_alloc((Class)CARConnectionSession) initWithEvents:v51 sessionIdentifier:v26 vehicleInformation:v8];
        [v40 insertObject:v27 atIndex:0];

        uint64_t v2 = v43 + 1;
      }
      while ((id)(v43 + 1) != v41);
      id v41 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
    }
    while (v41);
  }

  id v28 = [v40 sortedArrayUsingComparator:&stru_1000BEE88];
  uint64_t v29 = *(void *)(a1 + 40);
  if (v29) {
    (*(void (**)(uint64_t, void *, void))(v29 + 16))(v29, v28, 0);
  }
}

int64_t sub_10004EB34(id a1, CARConnectionSession *a2, CARConnectionSession *a3)
{
  id v4 = a3;
  id v5 = [(CARConnectionSession *)a2 events];
  uint64_t v6 = [v5 firstObject];
  id v7 = [v6 eventDate];

  id v8 = [(CARConnectionSession *)v4 events];

  id v9 = [v8 firstObject];
  id v10 = [v9 eventDate];

  id v11 = [v10 compare:v7];
  return (int64_t)v11;
}

int64_t sub_10004EDE0(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = CAREventTimestamp;
  id v5 = a3;
  uint64_t v6 = [(NSDictionary *)a2 objectForKey:v4];
  id v7 = [(NSDictionary *)v5 objectForKey:v4];

  id v8 = [v7 compare:v6];
  return (int64_t)v8;
}

void sub_10004EF28(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sortedConnectionEvents];
  id v3 = [v2 mutableCopy];

  if ([*(id *)(a1 + 40) eventType] != (id)1
    || ([*(id *)(a1 + 32) sessionStatus],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 currentSession],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    uint64_t v17 = [*(id *)(a1 + 40) eventName];
    if ([v17 isEqualToString:@"CARConnectionEventSessionDetails"])
    {
      id v18 = [*(id *)(a1 + 32) sessionUUIDString];

      if (!v18)
      {
        uint64_t v19 = [v3 firstObject];
        id obj = [v19 valueForKey:CAREventTimestamp];

        int v20 = [v3 firstObject];
        unsigned int v21 = [v20 valueForKey:CAREventName];

        id v22 = [v3 firstObject];
        id v23 = [v22 valueForKey:CAREventIdentifier];

        if (v21 && [v21 isEqualToString:@"CARSessionDidDisconnectEvent"] && obj)
        {
          uint64_t v24 = [*(id *)(a1 + 40) eventDate];
          [v24 timeIntervalSinceDate:obj];
          if (round(v25) <= 5.0)
          {

            if (v23)
            {
              uint64_t v39 = CarConnectionTimeLogging();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeSessionDidDisconnectEvent occurred before session details could be added. Applying the previous session ID to this event.", buf, 2u);
              }

              [*(id *)(a1 + 32) setSessionUUIDString:v23];
              [*(id *)(a1 + 32) _addConnectionData:*(void *)(a1 + 40) toReconnectArray:v3];
              [*(id *)(a1 + 32) setSessionUUIDString:0];
              uint64_t v40 = *(void *)(a1 + 48);
              if (v40) {
                (*(void (**)(uint64_t, uint64_t, void))(v40 + 16))(v40, 1, 0);
              }

              goto LABEL_75;
            }
          }
          else
          {
          }
        }

        goto LABEL_45;
      }
    }
    else
    {
    }
    if (![v3 count]) {
      goto LABEL_45;
    }
    id v26 = [v3 firstObject];
    id v27 = [v26 valueForKey:CAREventTimestamp];

    if (v27)
    {
      id v28 = [*(id *)(a1 + 40) eventDate];
      [v28 timeIntervalSinceDate:v27];
      if (round(v29) > 180.0)
      {
        long long v30 = [*(id *)(a1 + 40) eventName];
        if (![v30 isEqualToString:@"CARConnectionEventSessionDetails"])
        {
          uint64_t v35 = [*(id *)(a1 + 40) eventName];
          unsigned __int8 v36 = [v35 isEqualToString:@"CARSessionDidDisconnectEvent"];

          if ((v36 & 1) == 0)
          {
            uint64_t v37 = CarConnectionTimeLogging();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v38 = [*(id *)(a1 + 40) eventName];
              *(_DWORD *)long long buf = 138412290;
              id v77 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Observed %@ more than 3 minutes since the previous event. Resetting SessionUUID.", buf, 0xCu);
            }
            [*(id *)(a1 + 32) setSessionUUIDString:0];
            [*(id *)(a1 + 32) setWasPairing:0];
          }
          goto LABEL_29;
        }
      }
    }
LABEL_29:

    goto LABEL_45;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v69 = v3;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v73;
    uint64_t v9 = CAREventName;
    uint64_t v10 = CARCarKitConnectionSessionEndEvent;
    uint64_t v70 = CAREventIdentifier;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v73 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v72 + 1) + 8 * v11);
      id v13 = [v12 objectForKey:v9];
      if ([v13 isEqualToString:v10])
      {
        id v14 = [v12 objectForKey:v70];
        uint64_t v15 = [*(id *)(a1 + 32) sessionUUIDString];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          uint64_t v31 = CarConnectionTimeLogging();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [*(id *)(a1 + 40) eventName];
            *(_DWORD *)long long buf = 138412290;
            id v77 = v33;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Observed %@ inside of a session, skipping record.", buf, 0xCu);
          }
          uint64_t v34 = *(void *)(a1 + 48);
          id v3 = v69;
          if (v34) {
            goto LABEL_74;
          }
          goto LABEL_75;
        }
      }
      else
      {
      }
      if (v7 == (id)++v11)
      {
        id v7 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  id v3 = v69;
LABEL_45:
  uint64_t v41 = [*(id *)(a1 + 32) sessionUUIDString];
  uint64_t v42 = [*(id *)(a1 + 40) eventName];
  uint64_t v43 = v42;
  id obj = (id)v41;
  if (v41)
  {
    unsigned int v44 = [v42 isEqualToString:CARBluetoothWirelessIAPProfileConnectionAttempt];

    if (!v44)
    {
LABEL_60:
      id v53 = [*(id *)(a1 + 40) eventName];
      unsigned int v54 = [v53 isEqualToString:CARCarKitWirelessPairingCreatedEvent];

      if (v54) {
        [*(id *)(a1 + 32) setWasPairing:1];
      }
      uint64_t v55 = [*(id *)(a1 + 40) eventName];
      unsigned int v56 = [v55 isEqualToString:CARAirPlayConnectionTimeInfo];

      if (v56)
      {
        long long v57 = [*(id *)(a1 + 40) payload];
        long long v58 = [v57 valueForKey:@"AP_SIGNPOST_ENDPOINTSELECTED"];
        [v58 doubleValue];
        double v60 = v59;

        if (v60 == 0.0)
        {
          long long v61 = CarConnectionTimeLogging();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Unable to extract the time of AirPlay Endpoint Selected Event", buf, 2u);
          }
        }
        else
        {
          long long v61 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v60];
          long long v62 = +[CARConnectionEvent eventWithName:CARAirPlayEndpointSelected type:3 date:v61 payload:0];
          [*(id *)(a1 + 32) _addConnectionData:v62 toReconnectArray:v3];
        }
        long long v63 = [*(id *)(a1 + 40) payload];
        uint64_t v64 = [v63 valueForKey:@"AP_SIGNPOST_CAR_SENT_STATISTICS"];
        [v64 doubleValue];
        double v66 = v65;

        if (v66 == 0.0)
        {
          id v67 = CarConnectionTimeLogging();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Unable to extract the time of AirPlay Car Sent Statistics Event", buf, 2u);
          }
        }
        else
        {
          id v67 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v66];
          __int16 v68 = +[CARConnectionEvent eventWithName:CARAirPlayCarSentStatistics type:3 date:v67 payload:0];
          [*(id *)(a1 + 32) _addConnectionData:v68 toReconnectArray:v3];
        }
      }
      [*(id *)(a1 + 32) _addConnectionData:*(void *)(a1 + 40) toReconnectArray:v3];
      goto LABEL_73;
    }
    if ([*(id *)(a1 + 32) wasPairing])
    {
      uint64_t v45 = CarConnectionTimeLogging();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v46 = (uint64_t)obj;
        id v77 = obj;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Detected user was previously pairing to CarPlay and we already have a sessionUUID. No new session UUID required. %@", buf, 0xCu);
      }
      else
      {
        uint64_t v46 = (uint64_t)obj;
      }
LABEL_59:

      id obj = (id)v46;
      goto LABEL_60;
    }
LABEL_56:
    id v51 = objc_alloc_init((Class)NSUUID);
    uint64_t v46 = [v51 UUIDString];

    [*(id *)(a1 + 32) setSessionUUIDString:v46];
    uint64_t v45 = CarConnectionTimeLogging();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v52 = [*(id *)(a1 + 40) eventName];
      *(_DWORD *)long long buf = 138412546;
      id v77 = v52;
      __int16 v78 = 2112;
      uint64_t v79 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Expected BluetoothConnectionStarted Event, observed %@. Creating new SessionUUID: %@", buf, 0x16u);
    }
    goto LABEL_59;
  }
  if ([v42 isEqualToString:@"EndpointAvailable"])
  {
  }
  else
  {
    uint64_t v47 = [*(id *)(a1 + 40) eventName];
    unsigned int v48 = [v47 isEqualToString:@"EndpointActivated"];

    if (!v48) {
      goto LABEL_56;
    }
  }
  uint64_t v49 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = [*(id *)(a1 + 40) eventName];
    *(_DWORD *)long long buf = 138412290;
    id v77 = v50;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Observed %@ Outside of a session, skipping record.", buf, 0xCu);
  }
  id obj = 0;
LABEL_73:
  uint64_t v34 = *(void *)(a1 + 48);
  if (v34) {
LABEL_74:
  }
    (*(void (**)(uint64_t, uint64_t, void))(v34 + 16))(v34, 1, 0);
LABEL_75:
}

id sub_10004FA24(uint64_t a1)
{
  uint64_t v2 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Session disconnected and duration details recorded. Session identifier can be cleared, if any.", v4, 2u);
  }

  return [*(id *)(a1 + 32) setSessionUUIDString:0];
}

BOOL sub_10004FF24(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:CAREventTimestamp];
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = [v3 compare:*(void *)(a1 + 32)] == (id)1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_100051748(id a1)
{
  qword_1000E38D8 = objc_alloc_init(CRDiagnosticsService);

  _objc_release_x1();
}

void sub_1000522D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052384;
  block[3] = &unk_1000BD3D0;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100052384(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentDiagnosticsData];
  unsigned int v3 = [v2 isCAFToolTreeCompletionCalled];

  uint64_t v4 = CarDiagnosticsLogging();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CAFTool tree already completed? Ignoring...", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attaching CAFTool tree output...", v7, 2u);
    }

    id v6 = [*(id *)(a1 + 32) currentDiagnosticsData];
    [v6 setIsCAFToolTreeCompletionCalled:1];

    [*(id *)(a1 + 40) addTextAttachment:*(void *)(a1 + 48) asFilename:@"CAFToolTree.txt"];
  }
}

void sub_100052478(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) supportsVehicleData];
  unsigned int v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    _DWORD v9[2] = sub_1000525AC;
    v9[3] = &unk_1000BEF80;
    void v9[4] = v3;
    id v10 = *(id *)(a1 + 48);
    char v12 = *(unsigned char *)(a1 + 64);
    id v11 = *(id *)(a1 + 56);
    [v3 _mainQueue_displayFetchingVehicleLogsBannerWithCompletion:v9];

    uint64_t v4 = v10;
  }
  else
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005265C;
    v7[3] = &unk_1000BD640;
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    [v3 _mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:v6 isInternal:v5 completion:v7];
    uint64_t v4 = v8;
  }
}

void sub_1000525AC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  _DWORD v4[2] = sub_10005264C;
  v4[3] = &unk_1000BD640;
  id v5 = *(id *)(a1 + 48);
  [v1 _mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:v2 isInternal:v3 completion:v4];
}

uint64_t sub_10005264C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10005265C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10005266C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000529E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_100052A90;
  v9[3] = &unk_1000BD3A8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, v7, v8);
}

void sub_100052A90(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = CarDiagnosticsLogging();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 32) localizedDescription];
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Error creating draft - %@", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 40) _mainQueue_displayDraftErrorBanner];
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Successfully created draft", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_100052D60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to query initial Focus state: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setFocusModeDescription:@"None"];
  }
  else
  {
    uint64_t v7 = [a2 activeModeConfiguration];
    int v8 = [v7 mode];

    uint64_t v9 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received updated focus state %@", buf, 0xCu);
    }

    __int16 v10 = [v8 modeIdentifier];
    id v11 = [v10 length];

    if (v11)
    {
      char v12 = [v8 name];
      if (v12)
      {
        id v13 = [v8 name];
      }
      else
      {
        id v13 = @"Unspecified";
      }
      [v8 semanticType];
      id v14 = DNDModeSemanticTypeToString();
      uint64_t v15 = [v8 modeIdentifier];
      unsigned int v16 = +[NSString stringWithFormat:@"%@ (%@ - %@)", v13, v14, v15];
      [*(id *)(a1 + 32) setFocusModeDescription:v16];

      if (v12) {
    }
      }
    else
    {
      [*(id *)(a1 + 32) setFocusModeDescription:@"None"];
    }
  }
}

void sub_100053068(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053110;
  block[3] = &unk_1000BED20;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100053110(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000531B0;
  void v3[3] = &unk_1000BF020;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _mainQueue_presentDictationBannerWithCompletion:v3];
}

void sub_1000531B0(uint64_t a1, void *a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_100053270;
  v9[3] = &unk_1000BD3A8;
  id v3 = a2;
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v4, v5, v6, v7);
  }
}

id *sub_100053270(id *result)
{
  if (result[4]) {
    return (id *)[result[5] setTranscription:];
  }
  return result;
}

void sub_10005335C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000534C8;
  v16[3] = &unk_1000BF098;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v17 = v8;
  uint64_t v18 = v9;
  char v22 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v20 = v6;
  id v21 = v10;
  id v19 = v5;
  id v11 = v6;
  id v12 = v5;
  [v7 _mainQueue_gatherVehicleLogsWithCompletion:v16];
  id v13 = [*(id *)(a1 + 32) diagnosticsSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053610;
  block[3] = &unk_1000BD1B0;
  id v15 = *(id *)(a1 + 40);
  dispatch_async(v13, block);
}

void sub_1000534C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v3) {
    [*(id *)(a1 + 32) addAttachment:v3];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000535C8;
  v10[3] = &unk_1000BF070;
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v13 = v7;
  void v10[4] = v8;
  id v11 = v9;
  id v12 = *(id *)(a1 + 56);
  [v4 _mainQueue_performSysdiagnoseIncludingData:v5 isInternal:v6 completion:v10];
}

id sub_1000535C8(void *a1)
{
  (*(void (**)(void))(a1[7] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 _backgroundQueue_finishDiagnosticsOperationSemaphore:v3 transaction:v4];
}

void sub_100053610(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) date];
  +[CRDiagnosticsData removeDiagnosticsFoldersBeforeTime:v1];
}

void sub_100053844(id *a1)
{
  uint64_t v2 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "finished waiting on previous diagnostics", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000539AC;
  block[3] = &unk_1000BF0E8;
  id v9 = a1[6];
  id v7 = a1[4];
  id v8 = a1[5];
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v3 = a1[4];
  dispatch_time_t v4 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    uint64_t v5 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "timed out waiting on previous diagnostics", buf, 2u);
    }
  }
}

uint64_t sub_1000539AC(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100053BE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100053E84(uint64_t a1, void *a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_100053F34;
  v9[3] = &unk_1000BD3A8;
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v5, v6, v7);
  }
}

id sub_100053F34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = CarDiagnosticsLogging();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 32) localizedDescription];
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Error creating draft - %@", (uint8_t *)&v9, 0x16u);
    }
    return [*(id *)(a1 + 40) _mainQueue_displayDraftErrorBanner];
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Successfully created draft", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) setPendingDrafts:((char *)[*(id *)(a1 + 40) pendingDrafts] + 1)];
    return [*(id *)(a1 + 40) _mainQueue_displayDraftCountBanner];
  }
}

void sub_100054074(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100075798(a1, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

int64_t sub_100054180(id a1, AFAccount *a2, AFAccount *a3)
{
  if ([(AFAccount *)a3 isActive]) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t sub_100054330(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100054484(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) currentDiagnosticsData];
  id v2 = *(id *)(a1 + 40);
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 type];
    [v3 coordinate];
    uint64_t v6 = v5;
    [v3 coordinate];
    uint64_t v8 = v7;
    if ((v4 - 1) > 0xA) {
      CFStringRef v9 = @"Unknown";
    }
    else {
      CFStringRef v9 = *(&off_1000BF308 + (int)v4 - 1);
    }
    if (+[CRDiagnosticsService _accessorySupportsLocationDeadReckoning])
    {
      CFStringRef v11 = @"Yes";
    }
    else
    {
      CFStringRef v11 = @"No";
    }
    id v12 = [v3 timestamp];
    id v13 = CRStringForDate();
    uint64_t v10 = +[NSString stringWithFormat:@"Coordinates: (%f, %f)\nSource: %d (%@) [Dead Reckoning: %@]\nTime: %@", v6, v8, v4, v9, v11, v13];
  }
  else
  {
    uint64_t v10 = @"No location information";
  }

  [v14 setLocationDescription:v10];
}

void sub_1000546DC(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) currentDiagnosticsData];
  id v2 = [*(id *)(a1 + 40) firstObject];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 type];
    [v3 coordinate];
    uint64_t v6 = v5;
    [v3 coordinate];
    uint64_t v8 = v7;
    if ((v4 - 1) > 0xA) {
      CFStringRef v9 = @"Unknown";
    }
    else {
      CFStringRef v9 = *(&off_1000BF308 + (int)v4 - 1);
    }
    if (+[CRDiagnosticsService _accessorySupportsLocationDeadReckoning])
    {
      CFStringRef v11 = @"Yes";
    }
    else
    {
      CFStringRef v11 = @"No";
    }
    id v12 = [v3 timestamp];
    id v13 = CRStringForDate();
    uint64_t v10 = +[NSString stringWithFormat:@"Coordinates: (%f, %f)\nSource: %d (%@) [Dead Reckoning: %@]\nTime: %@", v6, v8, v4, v9, v11, v13];
  }
  else
  {
    uint64_t v10 = @"No location information";
  }
  [v14 setLocationDescription:v10];
}

id sub_100054B9C(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _beginDictationWithCompletion:v4];
  }
  else
  {
    uint64_t v5 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dictation dismissed", v7, 2u);
    }

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100054C48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100054C5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100054D40(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054E20;
  block[3] = &unk_1000BF208;
  uint64_t v18 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v7;
  id v17 = v10;
  id v11 = v7;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100054E20(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
LABEL_2:
    id v2 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v3 = *(void *)(a1 + 64) + 1;
      if (v3 >= 6)
      {
        uint64_t v4 = +[NSString stringWithFormat:@"Unknown (%ld)", *(void *)(a1 + 64)];
      }
      else
      {
        uint64_t v4 = *(&off_1000BF360 + v3);
      }
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dictation failed: state %@, error %@", buf, 0x16u);
    }
    if (*(void *)(a1 + 64) == -1)
    {
      id v8 = [@"Dictation Error. " stringByAppendingString:@"Please make sure you have Dictation enabled."];
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) localizedDescription];
      id v8 = [@"Dictation Error. " stringByAppendingString:v7];
    }
    uint64_t v9 = *(void **)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100055118;
    v17[3] = &unk_1000BE3D8;
    id v18 = *(id *)(a1 + 56);
    [v9 _mainQueue_presentCarAlertWithTitle:v8 dismissTime:v17 completion:10.0];

    goto LABEL_15;
  }
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5 == 4)
  {
    id v8 = [*(id *)(a1 + 48) transcription];
    id v10 = [v8 length];
    id v11 = CarDiagnosticsLogging();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)long long buf = 138477827;
        id v20 = v8;
        id v13 = "Dictation transcribed: %{private}@";
        id v14 = v11;
        uint32_t v15 = 12;
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else if (v12)
    {
      *(_WORD *)long long buf = 0;
      id v13 = "Dictation stopped without transcription.";
      id v14 = v11;
      uint32_t v15 = 2;
      goto LABEL_25;
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_15:

    return;
  }
  if (v5 != 1)
  {
    if (v5 != -1) {
      return;
    }
    goto LABEL_2;
  }
  id v16 = *(void **)(a1 + 40);

  [v16 _mainQueue_presentCarAlertWithTitle:@"Dictation in Progress. Tap to Stop" dismissTime:&stru_1000BF1E0 completion:0.0];
}

uint64_t sub_100055118(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005512C(id a1, unint64_t a2)
{
  id v2 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stopping dictation.", v4, 2u);
  }

  unint64_t v3 = +[CRDictationService sharedInstance];
  [v3 stopRecording];
}

void sub_100055200(id a1)
{
  id v1 = +[NSMutableDictionary dictionaryWithObject:&off_1000C60D0 forKey:kAudioServicesPlaySystemSoundOptionFlagsKey];
  [v1 setObject:&off_1000C72A8 forKey:kAudioServicesPlaySystemSoundOptionVibrationPatternKey];
  id v2 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Initiating vibrate for sysdiagnose", v4, 2u);
  }

  id v3 = [v1 copy];
  AudioServicesPlaySystemSoundWithOptions();
}

id sub_100055974(uint64_t a1, void *a2)
{
  id v3 = [a2 lowercaseString];
  uint64_t v4 = +[NSCharacterSet whitespaceCharacterSet];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  }
  else
  {
    id v7 = +[NSCharacterSet whitespaceCharacterSet];
    id v8 = [v5 componentsSeparatedByCharactersInSet:v7];

    if ((unint64_t)[v8 count] < 2
      || (uint64_t v9 = (char *)[v8 count], v10 = v9 - 1, v9 == (char *)1))
    {
LABEL_7:
      uint64_t v6 = 0;
    }
    else
    {
      while (1)
      {
        id v11 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v10);
        BOOL v12 = [v8 objectsAtIndexes:v11];
        id v13 = [v12 componentsJoinedByString:@" "];

        if ([*(id *)(a1 + 32) containsObject:v13]) {
          break;
        }

        if (!--v10) {
          goto LABEL_7;
        }
      }
      uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
    }
  }

  return v6;
}

void sub_100056058(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSTask);
  [v2 setLaunchPath:@"/usr/local/bin/CAFTool"];
  [v2 setArguments:&off_1000C7220];
  id v3 = +[NSPipe pipe];
  [v2 setStandardOutput:v3];

  id v4 = objc_alloc_init((Class)NSMutableData);
  uint64_t v5 = [v2 standardOutput];
  uint64_t v6 = [v5 fileHandleForReading];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000562DC;
  v19[3] = &unk_1000BF2A0;
  id v7 = v4;
  id v20 = v7;
  [v6 setReadabilityHandler:v19];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100056334;
  v16[3] = &unk_1000BF2C8;
  id v8 = v7;
  id v17 = v8;
  id v18 = *(id *)(a1 + 32);
  [v2 setTerminationHandler:v16];
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000565F4;
  block[3] = &unk_1000BD668;
  id v14 = v2;
  id v15 = *(id *)(a1 + 32);
  id v10 = v2;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  id v11 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CAFTool tree task launched", v12, 2u);
  }

  [v10 launch];
  [v10 waitUntilExit];
}

void sub_1000562DC(uint64_t a1, void *a2)
{
  id v3 = [a2 availableData];
  [*(id *)(a1 + 32) appendData:v3];
}

void sub_100056334(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CAFTool tree termination handler called", (uint8_t *)&v15, 2u);
  }

  if ([v3 terminationStatus])
  {
    uint64_t v5 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 terminationStatus]);
      id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 terminationReason]);
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CAFTool exited with status %@ reason %@", (uint8_t *)&v15, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = [v3 standardOutput];
    dispatch_time_t v9 = [v8 fileHandleForReading];
    [v9 setReadabilityHandler:0];

    id v10 = [objc_alloc((Class)NSString) initWithData:*(void *)(a1 + 32) encoding:4];
    id v11 = +[NSRegularExpression regularExpressionWithPattern:@"(?:\\x{1B}[@-_]|[\\x{80}-\\x{9F}])[0-?]*[ -/]*[@-~]" options:1 error:0];
    BOOL v12 = [v11 stringByReplacingMatchesInString:v10 options:0 range:[v10 length] withTemplate:[v10 length]];
    id v13 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 length]);
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CAFTool received output with length %@", (uint8_t *)&v15, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_1000565F4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isRunning];
  if (result)
  {
    [*(id *)(a1 + 32) terminate];
    id v3 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CAFTool tree task terminated", v4, 2u);
    }

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return result;
}

id sub_10005763C(uint64_t a1)
{
  id v2 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Session disconnect", v4, 2u);
  }

  [*(id *)(a1 + 32) setInitialDiagnosticsBannerPresented:0];
  [*(id *)(a1 + 32) setPendingDrafts:0];
  return [*(id *)(a1 + 32) setLoggingFileReceiver:0];
}

void sub_10005785C(id a1)
{
  id v1 = (void *)qword_1000E38E8;
  qword_1000E38E8 = (uint64_t)&off_1000C72F8;
}

void sub_100057EEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarDNDWDLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 eventBody];
    uint64_t v6 = [v5 semanticModeIdentifier];
    id v7 = [v3 eventBody];
    id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 starting]);
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    BOOL v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Store sink event received for mode %@ starting %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _drivingModeChanged:v3];
}

void sub_100058158(uint64_t a1)
{
  id v2 = objc_alloc_init(CARDNDGeofencingObserver);
  [(CARDNDGeofencingObserver *)v2 setDelegate:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 12_Block_object_dispose(&location, 8) = v2;
}

void sub_100058234(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preferences];
  unsigned int v3 = [v2 shouldActivateWithCarPlay];

  if (v3)
  {
    if ((CRIsTestContext() & 1) != 0
      || ([*(id *)(a1 + 32) _hasDrivingActivityMode] & 1) != 0)
    {
      id v4 = CarDNDWDLogging();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay session started, engaging Driving from preferences.", buf, 2u);
      }

      uint64_t v5 = +[CARAnalytics sharedInstance];
      [v5 DNDStartedWithTrigger:3 vehicleHints:[*(id *)(a1 + 32) lastKnownVehicularHints]];

      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = 1;
LABEL_14:
      [v6 _setDNDActive:v7 trigger:3 completion:0];
      return;
    }
    __int16 v11 = CarDNDWDLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring CarPlay Driving activation request; no driving mode available.",
        v15,
        2u);
    }
  }
  else
  {
    unsigned int v8 = [*(id *)(a1 + 32) activatedByUserAction];
    int v9 = CarDNDWDLogging();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (v10)
      {
        *(_WORD *)BOOL v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CarPlay session started, disabling Driving from preferences.", v12, 2u);
      }

      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = 0;
      goto LABEL_14;
    }
    if (v10)
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CarPlay session started; leaving Driving as-is because of user activation.",
        v13,
        2u);
    }
  }
}

id sub_100058698(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDNDActive:0 trigger:3 completion:0];
}

id sub_1000586AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDNDActive:0 trigger:3 completion:0];
}

id sub_100058870(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processVehicleState:*(void *)(a1 + 40)];
}

void sub_100058AB8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isDNDValid];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 == v2)
  {
    id v4 = CarDNDWDLogging();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = [*(id *)(a1 + 40) activeAssertionsDebugString];
        int v9 = 138412290;
        BOOL v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Driving temporarily disabled due to %@", (uint8_t *)&v9, 0xCu);
      }
      if ([*(id *)(a1 + 40) hasAssertion:2]) {
        uint64_t v7 = 4;
      }
      else {
        uint64_t v7 = 0;
      }
      [*(id *)(a1 + 32) _setDNDActive:0 trigger:v7 completion:0];
    }
    else
    {
      if (v5)
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Driving re-enabled after last temporary assertion released.", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    unsigned int v8 = CarDNDWDLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Driving assertion trap toggled, but no action needed.", (uint8_t *)&v9, 2u);
    }

    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) _drivingModeEnded];
    }
  }
}

void sub_100058D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100058D5C(uint64_t a1, int a2)
{
  char v2 = a2;
  id v4 = (unsigned __int8 *)(a1 + 52);
  if (*(unsigned __int8 *)(a1 + 52) == a2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      uint64_t v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
  else
  {
    uint64_t v7 = CarDNDWDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10007589C(v4, v2, v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setDNDActive:0 trigger:*(unsigned int *)(a1 + 48) withStartingGeofence:0 completion:*(void *)(a1 + 32)];
  }
}

uint64_t sub_1000590E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000590FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000596D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000596F8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v5 = +[CARAnalytics sharedInstance];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 DNDEndedWithTrigger:2 vehicleHints:[WeakRetained lastKnownVehicularHints] context:0];
  }
}

void sub_10005A010(id a1, int64_t a2)
{
  switch(a2)
  {
    case 0:
      uint64_t v2 = CarDNDWDLogging();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "User indicated passenger.", buf, 2u);
      }

      int v3 = +[CARAnalytics sharedInstance];
      id v4 = v3;
      CFStringRef v5 = @"Passenger";
      goto LABEL_14;
    case 1:
      uint64_t v6 = CarDNDWDLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User indicated pulled over.", v12, 2u);
      }

      int v3 = +[CARAnalytics sharedInstance];
      id v4 = v3;
      CFStringRef v5 = @"Pulled Over";
      goto LABEL_14;
    case 2:
      uint64_t v7 = CarDNDWDLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User indicated incorrect vehicle detection.", v11, 2u);
      }

      int v3 = +[CARAnalytics sharedInstance];
      id v4 = v3;
      CFStringRef v5 = @"Incorrect Detection (Radar)";
      goto LABEL_14;
    case 3:
      unsigned int v8 = CarDNDWDLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User indicated other.", v10, 2u);
      }

      int v3 = +[CARAnalytics sharedInstance];
      id v4 = v3;
      CFStringRef v5 = @"Other";
LABEL_14:
      [v3 userIndicatedNotDrivingWithReason:v5];
      break;
    default:
      id v4 = CarDNDWDLogging();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User indicated unknown not driving reason.", v9, 2u);
      }
      break;
  }
}

void sub_10005A74C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) preferences];
  [v1 setHasMigratedToDriving:1];
}

void sub_10005B27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10005B2D0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInAirplaneMode];
}

BOOL sub_10005B32C(uint64_t a1)
{
  BOOL result = +[CRBluetoothManager hasPairingSupportingCarPlayWithAddress:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_10005B72C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableDNDUntilEndOfDrive];
}

void sub_10005B94C(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_1000E3900;
  qword_1000E3900 = (uint64_t)v1;

  [(id)qword_1000E3900 setTimeStyle:1];
  [(id)qword_1000E3900 setDateStyle:1];
  id v3 = +[NSLocale currentLocale];
  [(id)qword_1000E3900 setLocale:v3];
}

void sub_10005B9D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id sub_10005BE84(uint64_t a1)
{
  return [*(id *)(a1 + 32) startWaitingForConnection];
}

void sub_10005BE8C(id a1, BOOL a2, NSError *a3)
{
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Recording startedConnectionAttemptOnTransport", v4, 2u);
  }
}

id sub_10005BF9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopWaitingForConnection];
}

void sub_10005C03C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configuration];
  id v3 = [v2 transportType];

  id v4 = +[CARAnalytics sharedInstance];
  [v4 reconnectEndedOnTransport:v3];

  if (v3 == (id)3)
  {
    CFStringRef v5 = *(void **)(a1 + 40);
    [v5 stopWaitingForConnection];
  }
}

void sub_10005C164(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configuration];
  id v3 = [v2 transportType];

  if (v3 == (id)3)
  {
    id v4 = [*(id *)(a1 + 40) messagingConnector];
    CFStringRef v5 = [*(id *)(a1 + 32) MFiCertificateSerialNumber];
    id v35 = [v4 vehicleAccessoryForCertificateSerial:v5];

    uint64_t v6 = [*(id *)(a1 + 32) configuration];
    uint64_t v7 = [v35 analyticsDescription];
    unsigned int v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

    uint64_t v9 = [*(id *)(a1 + 32) sourceVersion];
    BOOL v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = @"Unknown";
    }
    [v8 setObject:v11 forKeyedSubscript:@"SourceVersion"];

    uint64_t v12 = [v6 vehicleFirmwareVersion];
    id v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = @"Unknown";
    }
    [v8 setObject:v14 forKeyedSubscript:@"vehicleFirmwareVersion"];

    uint64_t v15 = [v6 vehicleHardwareVersion];
    id v16 = (void *)v15;
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    else {
      CFStringRef v17 = @"Unknown";
    }
    [v8 setObject:v17 forKeyedSubscript:@"vehicleHardwareVersion"];

    uint64_t v18 = [v6 vehicleManufacturer];
    id v19 = (void *)v18;
    if (v18) {
      CFStringRef v20 = (const __CFString *)v18;
    }
    else {
      CFStringRef v20 = @"Unknown";
    }
    [v8 setObject:v20 forKeyedSubscript:@"vehicleManufacturer"];

    uint64_t v21 = [v6 vehicleModelName];
    uint64_t v22 = (void *)v21;
    if (v21) {
      CFStringRef v23 = (const __CFString *)v21;
    }
    else {
      CFStringRef v23 = @"Unknown";
    }
    [v8 setObject:v23 forKeyedSubscript:@"vehicleModel"];

    uint64_t v24 = [v6 PPID];
    double v25 = (void *)v24;
    if (v24) {
      CFStringRef v26 = (const __CFString *)v24;
    }
    else {
      CFStringRef v26 = @"Unknown";
    }
    [v8 setObject:v26 forKeyedSubscript:@"ppid"];

    id v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 supportsVehicleData]);
    [v8 setObject:v27 forKeyedSubscript:@"nextGenCarPlaySession"];

    id v28 = [*(id *)(a1 + 40) storedVehicleProvider];
    double v29 = [v28 storedVehicleForSession:*(void *)(a1 + 32)];

    if (v29)
    {
      long long v30 = [v29 supportsStartSessionRequest];
      if ([v30 BOOLValue]) {
        CFStringRef v31 = @"StartSession";
      }
      else {
        CFStringRef v31 = @"Bonjour";
      }
      [v8 setObject:v31 forKeyedSubscript:@"sessionType"];

      if ([v29 supportsBluetoothLE]) {
        CFStringRef v32 = @"BLE";
      }
      else {
        CFStringRef v32 = @"BT Classic";
      }
      [v8 setObject:v32 forKeyedSubscript:@"bluetoothType"];
    }
    uint64_t v33 = +[CARAnalytics sharedInstance];
    [v33 wirelessSessionEndedWithPayload:v8];

    uint64_t v34 = +[CARAnalytics sharedInstance];
    [v34 setWifiChannel:0];

    [*(id *)(a1 + 40) stopWaitingForConnection];
  }
  else
  {
    id v35 = +[CARAnalytics sharedInstance];
    [v35 wiredSessionEnded];
  }
}

id sub_10005C6FC(unint64_t a1)
{
  if (a1 >= 6) {
    sub_100075B34();
  }
  if (qword_1000E3940 != -1) {
    dispatch_once(&qword_1000E3940, &stru_1000BF520);
  }
  id v2 = (void *)qword_1000E3910[a1];

  return v2;
}

void sub_10005C76C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.carkitd", "Default");
  id v2 = (void *)qword_1000E3910[0];
  qword_1000E3910[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.carkitd", "NavigationOwnership");
  id v4 = (void *)qword_1000E3918;
  qword_1000E3918 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.carkitd", "BluetoothService");
  uint64_t v6 = (void *)qword_1000E3920;
  qword_1000E3920 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.carkitd", "ClusterControl");
  unsigned int v8 = (void *)qword_1000E3928;
  qword_1000E3928 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.carkitd", "FileTransfer");
  BOOL v10 = (void *)qword_1000E3930;
  qword_1000E3930 = (uint64_t)v9;

  qword_1000E3938 = (uint64_t)os_log_create("com.apple.carkitd", "StatisticsStream");

  _objc_release_x1();
}

uint64_t start()
{
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_10005CFB8;
  v55[4] = sub_10005CFC8;
  id v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_10005CFB8;
  void v53[4] = sub_10005CFC8;
  id v54 = 0;
  os_log_t v1 = CarGeneralLogging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "carkitd launching", buf, 2u);
  }
  context = v0;

  uint64_t v39 = objc_alloc_init(CRBluetoothManager);
  id v38 = objc_alloc_init((Class)CRCarPlayPreferences);
  id v2 = [objc_alloc((Class)CARSessionStatus) initWithOptions:12];
  uint64_t v24 = [[CRSessionSilentModeManager alloc] initWithSessionStatus:v2];
  uint64_t v22 = [[CRNightModeFallbackManager alloc] initWithSessionStatus:v2];
  unsigned int v44 = objc_alloc_init(CRVehicleStore);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10005CFD0, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v43 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.reconnectiontime.service"];
  id v4 = [CARConnectionTimeServiceAgent alloc];
  os_log_t v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v42 = [(CARConnectionTimeServiceAgent *)v4 initWithUserDefaults:v5 sessionStatus:v2];

  [v43 setDelegate:v42];
  [v43 resume];
  id v41 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.service"];
  uint64_t v6 = [[CRCarKitServiceAgent alloc] initWithVehicleStore:v44 sessionStatus:v2 bluetoothManager:v39 preferences:v38 connectionTimeServiceAgent:v42];
  [v41 setDelegate:v6];
  [v41 resume];
  CFStringRef v20 = [[CRCarKitIAPRemoteServiceAgent alloc] initWithDelegate:v6];
  id v40 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.monitoring.service"];
  uint64_t v37 = objc_alloc_init(CRCarKitMonitoringServiceAgent);
  [v40 setDelegate:v37];
  [v40 resume];
  [(CRCarKitServiceAgent *)v6 setMonitoringService:v37];
  id v36 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.app.service"];
  os_log_t v7 = [[CRCarPlayAppServiceAgent alloc] initWithSessionStatus:v2 vehicleStore:v44];
  [v36 setDelegate:v7];
  [v36 resume];
  id v35 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.navowners.service"];
  uint64_t v34 = [[CRCarPlayNavigationServiceAgent alloc] initWithSessionStatus:v2];
  [v35 setDelegate:v34];
  [v35 resume];
  id v33 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.theme-asset-library"];
  id v8 = objc_alloc_init((Class)CARThemeAssetLibraryAgent);
  [v33 setDelegate:v8];
  CFStringRef v32 = [[CRThemeAssetLibrarian alloc] initWithLibraryAgent:v8 vehicleStore:v44 sessionStatus:v2];
  [v8 setDelegate:v32];
  [(CRCarKitServiceAgent *)v6 setVehicleAssetManager:v32];
  [v33 resume];
  id v31 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.navigation.service"];
  [v31 setDelegate:v34];
  [v31 resume];
  id v30 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.setupPromptDirector.service"];
  double v29 = objc_alloc_init(CRSetupPromptDirectorAgent);
  [v30 setDelegate:v29];
  [(CRCarKitServiceAgent *)v6 setSetupPromptDirector:v29];
  [v30 resume];
  id v28 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.pairing.service"];
  os_log_t v9 = [[CRWirelessPairingServiceAgent alloc] initWithBluetoothManager:v39 preferences:v38 vehicleStore:v44];
  [v28 setDelegate:v9];
  [(CRWirelessPairingServiceAgent *)v9 setPresenter:v6];
  [(CRCarKitServiceAgent *)v6 setHeadUnitPairingDelegate:v9];
  [v28 resume];
  id v10 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.headUnitPairingPrompt.service"];
  [v10 setDelegate:v9];
  [v10 resume];
  id v11 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.certificationOverrides.service"];
  uint64_t v12 = objc_alloc_init(CRCertificationOverridesServiceAgent);
  [v11 setDelegate:v12];
  [v11 resume];
  id v13 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005D03C;
  handler[3] = &unk_1000BF548;
  CFStringRef v14 = v7;
  id v51 = v14;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  if (+[CRVehicleStoreAvailability isVehicleStoreAvailable])
  {
    [(CRCarKitServiceAgent *)v6 handleAnyMessagingConnectionsToVehicles];
  }
  else
  {
    +[CRVehicleStoreAvailability registerForAvailabilityEvent];
  }
  uint64_t v15 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D1C4;
  block[3] = &unk_1000BDD28;
  id v16 = v44;
  uint64_t v46 = v16;
  id v17 = v2;
  id v47 = v17;
  unsigned int v48 = v55;
  uint64_t v49 = v53;
  dispatch_async(v15, block);

  uint64_t v18 = +[NSRunLoop mainRunLoop];
  [v18 run];

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);

  return 0;
}

void sub_10005CF90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005CFB8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005CFC8(uint64_t a1)
{
}

uint64_t sub_10005CFD0()
{
  uint64_t v0 = CarGeneralLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "system language changed, exiting", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void sub_10005D03C(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
  {
    id v4 = +[NSString stringWithUTF8String:string];
    os_log_t v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling %@ notification", (uint8_t *)&v9, 0xCu);
    }

    if (([v4 isEqualToString:@"com.apple.carkit.carplay-attached"] & 1) == 0)
    {
      uint64_t v6 = +[CRVehicleStoreAvailability notifydEventName];
      unsigned int v7 = [v4 isEqualToString:v6];

      if (v7)
      {
        +[CRVehicleStoreAvailability handleAvailabilityEvent];
      }
      else if ([v4 isEqualToString:@"com.apple.vehiclePolicy.DNDMode"])
      {
        id v8 = +[CARDNDManager sharedManager];
        [v8 _checkVehicleState];
      }
      else if ([v4 isEqualToString:@"com.apple.carkit.capabilities-changed"])
      {
        [*(id *)(a1 + 32) requestCarCapabilitiesUpdate];
      }
    }
  }
}

id sub_10005D1C4(void *a1)
{
  +[CARDNDManager setupSharedManagerWithVehicleStore:a1[4] sessionStatus:a1[5]];
  id v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.carkit.dnd.service"];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  os_log_t v5 = [[CARDNDServiceAgent alloc] initWithVehicleStore:a1[4]];
  uint64_t v6 = *(void *)(a1[7] + 8);
  unsigned int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setDelegate:*(void *)(*(void *)(a1[7] + 8) + 40)];
  id v8 = *(void **)(*(void *)(a1[6] + 8) + 40);

  return [v8 resume];
}

void sub_10005D4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005D4D0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) service];
  id v2 = [v3 activeChannel];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_10005D5F0(uint64_t a1)
{
  unsigned __int16 v2 = (unsigned __int16)[(id)objc_opt_class() identifier];
  id v3 = [*(id *)(a1 + 32) dictionaryRepresentation];
  id v4 = [*(id *)(a1 + 40) plistMessenger];
  id v12 = 0;
  os_log_t v5 = [v4 dataForMessageWithIdentifier:v2 contents:v3 error:&v12];
  id v6 = v12;

  if (v5)
  {
    unsigned int v7 = [*(id *)(a1 + 40) service];
    id v8 = [v7 activeChannel];

    if (v8)
    {
      [v8 sendData:v5];
      int v9 = [*(id *)(a1 + 40) activeMessagesForDatas];
      [v9 setObject:*(void *)(a1 + 32) forKey:v5];
    }
    else
    {
      id v11 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "no active channel", buf, 2u);
      }

      [*(id *)(a1 + 40) _queue_handleFailedToSendMessage:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v10 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to encode message contents: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _queue_handleFailedToSendMessage:*(void *)(a1 + 32)];
  }
}

void sub_10005D9E0(uint64_t a1)
{
  unsigned __int16 v2 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 32) messageClassesForIdentifiers];
  id v4 = (objc_class *)[v3 objectForKey:v2];

  if (v4
    && ([(objc_class *)v4 conformsToProtocol:&OBJC_PROTOCOL___CARCarPlayServiceMessage] & 1) != 0)
  {
    os_log_t v5 = (uint64_t *)(a1 + 40);
    id v6 = [[v4 alloc] initWithDictionaryRepresentation:*(void *)(a1 + 40)];
    if (v6)
    {
      unsigned int v7 = [*(id *)(a1 + 32) serviceDelegate];
      if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v7 carPlayService:*(void *)(a1 + 32) didReceiveMessage:v6];
      }
    }
    else
    {
      id v10 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100075BF4(v5, v10);
      }
    }
  }
  else
  {
    id v6 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int16 *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 40);
      v11[0] = 67109378;
      v11[1] = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "unknown message ID: %hu: %@", (uint8_t *)v11, 0x12u);
    }
  }
}

void sub_10005DC3C(uint64_t a1)
{
  unsigned __int16 v2 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "did open BLE service channel: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setChannelDelegate:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 40) serviceDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 carPlayServiceDidActivate:*(void *)(a1 + 40)];
  }
}

void sub_10005DDDC(uint64_t a1)
{
  unsigned __int16 v2 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "did close BLE service channel: %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [*(id *)(a1 + 40) activeMessagesForDatas];
  int v5 = [v4 allKeys];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(a1 + 40);
        id v11 = [v10 _queue_popMessageForData:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v10 _queue_handleFailedToSendMessage:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  __int16 v12 = [*(id *)(a1 + 40) serviceDelegate];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 carPlayServiceDidDeactivate:*(void *)(a1 + 40)];
  }
}

void sub_10005E050(uint64_t a1)
{
  unsigned __int16 v2 = [*(id *)(a1 + 32) _queue_popMessageForData:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = [*(id *)(a1 + 32) serviceDelegate];
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v3 carPlayService:*(void *)(a1 + 32) didSendMessage:v4];
    }

    unsigned __int16 v2 = v4;
  }
}

uint64_t sub_10005E194(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _queue_popMessageForData:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(a1 + 32) _queue_handleFailedToSendMessage:v2];
  }

  return _objc_release_x1();
}

void sub_10005E2AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) plistMessenger];
  [v2 handleReceivedData:*(void *)(a1 + 40)];
}

id sub_10005F5CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 address];
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    id v5 = [v3 isServiceSupported:0x40000];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id sub_10005F70C(uint64_t a1, void *a2)
{
  id v3 = [a2 address];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10005FA08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v5)
  {
    unsigned int v7 = [v5 BOOLValue];
    uint64_t v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"NO";
      uint64_t v10 = *(void *)(a1 + 48);
      int v13 = 138543875;
      if (v7) {
        CFStringRef v9 = @"YES";
      }
      CFStringRef v14 = v9;
      __int16 v15 = 2160;
      uint64_t v16 = 1752392040;
      __int16 v17 = 2113;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "received numeric comparison confirmation response %{public}@ for device %{private, mask.hash}@", (uint8_t *)&v13, 0x20u);
    }

    id v11 = +[BluetoothManager sharedInstance];
    [v11 acceptSSP:v7 ^ 1 forDevice:*(void *)(a1 + 40)];
  }
  else
  {
    __int16 v12 = CarPairingLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100075E30((uint64_t)v6, v12);
    }

    [*(id *)(a1 + 32) _pairingFailedForDevice:*(void *)(a1 + 40) didTimeout:0];
  }
}

void sub_100060B38(uint64_t a1)
{
  id v2 = CarSilentModeLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Ringer switch toggled", v4, 2u);
  }

  [*(id *)(a1 + 32) setLastModeChangeByCarkitd:0];
  [*(id *)(a1 + 32) setShouldResetMuteState:0];
  id v3 = [*(id *)(a1 + 32) muteStatus];
  [*(id *)(a1 + 32) setShouldResetToMuted:[v3 isDeviceSilentModeOn]];
}

void sub_100060C84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained muteStatus];
  id v2 = [v1 getCarPlaySilentModePreference];

  [WeakRetained setLastModeChangeByCarkitd:1];
  if (v2)
  {
    CFStringRef v3 = @"Unmuted";
    if (v2 == (id)1) {
      CFStringRef v3 = @"Muted";
    }
    id v4 = +[NSString stringWithFormat:@"CarPlay Silent Mode Panel changed during session. %@", v3];
    [WeakRetained matchDeviceSilentModeToCarPlaySilentModeWithReason:v4];
  }
  else
  {
    [WeakRetained setShouldResetMuteState:0];
    id v4 = [WeakRetained muteStatus];
    [v4 setDeviceSilentMode:objc_msgSend(WeakRetained, "shouldResetToMuted") reason:@"Mirroring last non-CarPlay silent mode set"];
  }
}

BOOL sub_100060F04(id a1, MAAsset *a2, NSDictionary *a3)
{
  CFStringRef v3 = a2;
  BOOL v4 = [(MAAsset *)v3 state] == (id)2 || [(MAAsset *)v3 state] == (id)6;

  return v4;
}

void sub_100061534(uint64_t a1)
{
  id v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "setting tracked theme assets to: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 16);
  if (v5)
  {
    if ([v5 isEqual:*(void *)(a1 + 32)]) {
      return;
    }
    uint64_t v4 = *(void *)(a1 + 40);
  }
  objc_storeStrong((id *)(v4 + 16), *(id *)(a1 + 32));
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) _assetQueue_removeUnusedAssets];
    id v6 = *(void **)(a1 + 40);
    unsigned int v7 = [v6 assetRequests];
    [v6 _assetQueue_queryUpdatedAssetsForRequests:v7];
  }
}

void sub_1000616EC(uint64_t a1)
{
  id v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v15 = 138412290;
    uint64_t v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "received download hint for asset request %@", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) assetRequests];
  uint64_t v5 = a1 + 32;
  unsigned int v6 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v6)
  {
    unsigned int v7 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100075F40(v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    CFStringRef v14 = *(void **)(a1 + 40);
    unsigned int v7 = +[NSSet setWithObject:*(void *)(a1 + 32)];
    [v14 _assetQueue_queryUpdatedAssetsForRequests:v7];
  }
}

id sub_1000618C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assetQueue_removeAssetsBeforeVersion:*(void *)(a1 + 40)];
}

void sub_1000619D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = [*(id *)(a1 + 32) assetQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061A98;
  block[3] = &unk_1000BD4C8;
  id v9 = v5;
  uint64_t v10 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v6, block);
}

void sub_100061A98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = CarThemeAssetsLogging();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100075FB0(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "theme assets catalog downloaded", v12, 2u);
    }

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v4 = [v11 assetRequests];
    [v11 _assetQueue_queryUpdatedAssetsForRequests:v4];
  }
}

void sub_100061EA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

id *sub_100061ECC(id *result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (id *)[result[4] _assetQueue_notifyObserverOfAsset:a3 forAssetRequest:a2];
  }
  return result;
}

void sub_100061EE0(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 assetIdentifier];
  if (v8) {
    [a1[4] _assetQueue_notifyObserverOfAsset:v8 forAssetRequest:v7];
  }
  if (v9)
  {
    unsigned __int8 v11 = [a1[5] containsObject:v7];
    uint64_t v12 = CarThemeAssetsLogging();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "theme asset exists for %@ but is not downloaded, requesting download", buf, 0xCu);
      }

      uint64_t v12 = [v9 cr_assetVersion];
      if (v12)
      {
        id v14 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
        [a1[4] _assetQueue_notifyObserverOfDownloadAttemptForAssetRequest:v7 version:v12 progress:v14];
        id v15 = objc_alloc_init((Class)MADownloadOptions);
        [v15 setAllowsCellularAccess:1];
        [v15 setDiscretionary:0];
        [v15 setAllowsExpensiveAccess:1];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100062298;
        v28[3] = &unk_1000BF658;
        id v16 = v14;
        id v29 = v16;
        [v9 attachProgressCallBack:v28];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100062388;
        v21[3] = &unk_1000BF6A8;
        v21[4] = a1[4];
        objc_copyWeak(&v27, a1 + 6);
        __int16 v17 = v16;
        uint64_t v22 = v17;
        id v18 = v9;
        id v23 = v18;
        id v24 = v7;
        double v25 = v12;
        id v19 = v10;
        id v26 = v19;
        [v18 startDownload:v15 completionWithError:v21];
        CFStringRef v20 = [a1[4] assetQueue_currentlyDownloadingAssets];
        [v20 setObject:v18 forKey:v19];

        objc_destroyWeak(&v27);
      }
      else
      {
        __int16 v17 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100076178(v9);
        }
      }
    }
    else if (v13)
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "newer theme asset exists for %@ but will download at another time", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100076110();
    }
  }
}

void sub_100062278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

id sub_100062298(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 totalExpected];
  id v5 = [v3 totalWritten];

  uint64_t v6 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349312;
    id v9 = v5;
    __int16 v10 = 2050;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "asset download progress: %{public}llu of %{public}llu bytes", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setTotalUnitCount:v4];
  return [*(id *)(a1 + 32) setCompletedUnitCount:v5];
}

void sub_100062388(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1[4] assetQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000624C4;
  v8[3] = &unk_1000BF680;
  objc_copyWeak(v15, a1 + 10);
  v15[1] = a2;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = v5;
  id v13 = a1[8];
  id v14 = a1[9];
  id v7 = v5;
  dispatch_async(v6, v8);

  objc_destroyWeak(v15);
}

void sub_1000624C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (*(void *)(a1 + 88))
  {
    id v3 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100076200(a1, v3, v4, v5, v6, v7, v8, v9);
    }

    [WeakRetained _assetQueue_notifyObserverOfFailedDownloadForAssetRequest:*(void *)(a1 + 48) version:*(void *)(a1 + 64) error:*(void *)(a1 + 56)];
  }
  else
  {
    [*(id *)(a1 + 32) setCompletedUnitCount:[*(id *)(a1 + 32) totalUnitCount]];
    id v10 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "theme asset download successful", v12, 2u);
    }

    [WeakRetained _assetQueue_notifyObserverOfAsset:*(void *)(a1 + 40) forAssetRequest:*(void *)(a1 + 48)];
  }
  id v11 = [WeakRetained assetQueue_currentlyDownloadingAssets];
  [v11 removeObjectForKey:*(void *)(a1 + 72)];
}

uint64_t sub_100062BE8(uint64_t a1, void *a2)
{
  id v3 = [a2 cr_assetVersion];
  uint64_t v4 = [v3 identifier];

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [*(id *)(a1 + 32) assetRequests];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) assetIdentifier];
          unsigned __int8 v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            uint64_t v12 = 0;
            goto LABEL_12;
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v12 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

BOOL sub_100062E8C(uint64_t a1, void *a2)
{
  id v3 = [a2 cr_assetVersion];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == (id)-1;

  return v4;
}

uint64_t sub_1000636E0(uint64_t a1)
{
  qword_1000E3948 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100063FDC(id a1, BOOL a2, NSError *a3)
{
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessReconnectStarted connection event", v4, 2u);
  }
}

void sub_1000642B0(id a1, BOOL a2, NSError *a3)
{
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent _wirelessReconnectEnded connection event", v4, 2u);
  }
}

void sub_1000643C0(id a1, BOOL a2, NSError *a3)
{
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent _wirelessReconnectEnded connection event", v4, 2u);
  }
}

void sub_100064688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000646A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v125 = a3;
  uint64_t v129 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v128 = v5;
  if (![v5 count]) {
    goto LABEL_123;
  }
  v127 = [v5 firstObject];
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v127 events];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Number of events in the lastSession: %lu", (uint8_t *)&buf, 0xCu);
  }
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectionBTTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectioniAPTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectionWifiTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectionAirPlayTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectionCarkitTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectionTotalTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectioniAPOverBluetoothTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectioniAPOverWiFiTime"];
  [*(id *)(a1 + 32) setObject:@"Unknown" forKeyedSubscript:@"reconnectioniAPOverUSBTime"];
  if (!v127)
  {
    uint64_t v22 = CarGeneralLogging();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No available session for wireless reconnect calculations - exiting.", (uint8_t *)&buf, 2u);
    }

    [WeakRetained sendEvent:8 withDictionary:*(void *)(a1 + 32)];
    goto LABEL_122;
  }
  v123 = +[NSSet setWithObject:&off_1000C66E8];
  [v127 allEventsOfTypes:v123];
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v154 objects:v168 count:16];
  BOOL v9 = v8 != 0;
  if (!v8)
  {
    v137 = 0;
    id v10 = 0;
    id v23 = obj;
    goto LABEL_25;
  }
  id v10 = 0;
  v137 = 0;
  uint64_t v11 = *(void *)v155;
  uint64_t v12 = CARBluetoothWirelessIAPProfileConnectionAttempt;
  uint64_t v13 = CARBluetoothWirelessIAPProfileConnectionSuccess;
  do
  {
    for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v155 != v11) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v154 + 1) + 8 * i);
      long long v16 = [v15 eventName];
      if ([v16 isEqualToString:v12])
      {
        uint64_t v17 = [v15 eventDate];
        id v18 = v137;
        v137 = (void *)v17;
      }
      else
      {
        if (![v16 isEqualToString:v13]) {
          goto LABEL_15;
        }
        uint64_t v19 = [v15 eventDate];
        id v18 = v10;
        id v10 = (void *)v19;
      }

LABEL_15:
    }
    id v8 = [obj countByEnumeratingWithState:&v154 objects:v168 count:16];
  }
  while (v8);

  BOOL v20 = v137 != 0;
  if (!v137) {
    goto LABEL_26;
  }
  uint64_t v21 = v10;
  if (v10)
  {
    if ([v137 compare:v10] != (id)-1)
    {
      BOOL v20 = 1;
      goto LABEL_26;
    }
    [v10 timeIntervalSinceDate:v137];
    double v93 = v92;
    v94 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v95 = [v94 stringValue];
    [*(id *)(v129 + 32) setObject:v95 forKeyedSubscript:@"reconnectionBTTime"];

    id v23 = CarGeneralLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v96 = +[NSNumber numberWithDouble:v93];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v96;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Bluetooth reconnection time: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_25:

    BOOL v20 = v9;
LABEL_26:
    uint64_t v21 = v10;
  }
  v121 = v21;
  BOOL v122 = v20;
  if (qword_1000E3968 != -1) {
    dispatch_once(&qword_1000E3968, &stru_1000BF778);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v166 = 0x2020000000;
  uint64_t v167 = 0;
  id v24 = (void *)qword_1000E3958;
  v150[0] = _NSConcreteStackBlock;
  v150[1] = 3221225472;
  v150[2] = sub_100065940;
  v150[3] = &unk_1000BF7A0;
  id v124 = v127;
  id v151 = v124;
  p_long long buf = &buf;
  id v152 = *(id *)(v129 + 32);
  [v24 enumerateObjectsUsingBlock:v150];
  if (*(double *)(*((void *)&buf + 1) + 24) > 0.0)
  {
    double v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v26 = [v25 stringValue];
    [*(id *)(v129 + 32) setObject:v26 forKeyedSubscript:@"reconnectioniAPTime"];
  }
  v120 = +[NSSet setWithObject:&off_1000C6790];
  [v124 allEventsOfTypes:];
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  v134 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [v134 countByEnumeratingWithState:&v146 objects:v164 count:16];
  if (!v27)
  {
    v136 = 0;
    v131 = 0;
    id v41 = v134;
    goto LABEL_49;
  }
  v131 = 0;
  v136 = 0;
  uint64_t v28 = *(void *)v147;
  uint64_t v29 = CARAirPlayEndpointSelected;
  uint64_t v30 = CARAirPlayCarSentStatistics;
  while (2)
  {
    uint64_t v31 = 0;
    while (2)
    {
      if (*(void *)v147 != v28) {
        objc_enumerationMutation(v134);
      }
      CFStringRef v32 = *(void **)(*((void *)&v146 + 1) + 8 * v31);
      id v33 = [v32 eventName];
      if ([v33 isEqualToString:v29])
      {
        uint64_t v34 = [v32 eventDate];
        id v35 = v136;
        v136 = (void *)v34;
        goto LABEL_40;
      }
      if ([v33 isEqualToString:v30])
      {
        uint64_t v36 = [v32 eventDate];
        id v35 = v131;
        v131 = (void *)v36;
LABEL_40:
      }
      if (v27 != (id)++v31) {
        continue;
      }
      break;
    }
    id v27 = [v134 countByEnumeratingWithState:&v146 objects:v164 count:16];
    if (v27) {
      continue;
    }
    break;
  }

  if (v136 && v131 && objc_msgSend(v136, "compare:") == (id)-1)
  {
    [v131 timeIntervalSinceDate:v136];
    double v38 = v37;
    uint64_t v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v40 = [v39 stringValue];
    [*(id *)(v129 + 32) setObject:v40 forKeyedSubscript:@"reconnectionAirPlayTime"];

    id v41 = CarGeneralLogging();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = +[NSNumber numberWithDouble:v38];
      *(_DWORD *)v159 = 138412290;
      v160 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "AirPlay reconnection time: %@", v159, 0xCu);
    }
LABEL_49:
  }
  v119 = +[NSSet setWithObject:&off_1000C67A8];
  [v124 allEventsOfTypes:];
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  v133 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = [v133 countByEnumeratingWithState:&v142 objects:v163 count:16];
  BOOL v117 = v43 != 0;
  if (!v43)
  {
    unsigned int v44 = 0;
    v130 = 0;
    long long v58 = v133;
    goto LABEL_72;
  }
  v130 = 0;
  unsigned int v44 = 0;
  uint64_t v45 = *(void *)v143;
  uint64_t v46 = CARCarKitAttemptingConnectionEvent;
  uint64_t v47 = CARCarKitConnectionSessionEndEvent;
  uint64_t v48 = CARCarKitWirelessPairingCreatedEvent;
  while (2)
  {
    uint64_t v49 = 0;
    while (2)
    {
      if (*(void *)v143 != v45) {
        objc_enumerationMutation(v133);
      }
      uint64_t v50 = *(void **)(*((void *)&v142 + 1) + 8 * v49);
      id v51 = [v50 eventName];
      if ([v51 isEqualToString:v46])
      {
        [v50 eventDate];
        unsigned int v44 = v52 = v44;
        goto LABEL_65;
      }
      if ([v51 isEqualToString:v47])
      {
        [v50 eventDate];
        v130 = uint64_t v52 = v130;
        goto LABEL_65;
      }
      if ([v51 isEqualToString:v48])
      {
        [*(id *)(v129 + 32) setObject:@"true" forKeyedSubscript:@"wasPairing"];
        uint64_t v52 = CarGeneralLogging();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v159 = 0;
          id v53 = v52;
          id v54 = "CARAnalytics: CARCarKitWirelessPairingCreatedEvent discovered. Marking this event as a first time pairing experience.";
          uint32_t v55 = 2;
          goto LABEL_64;
        }
      }
      else
      {
        uint64_t v52 = CarGeneralLogging();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v159 = 138412546;
          v160 = v50;
          __int16 v161 = 2112;
          v162 = v51;
          id v53 = v52;
          id v54 = "CARAnalytics: Unknown CarKit Event name discovered in allCarKitEvents: %@ : %@";
          uint32_t v55 = 22;
LABEL_64:
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, v54, v159, v55);
        }
      }
LABEL_65:

      if (v43 != (id)++v49) {
        continue;
      }
      break;
    }
    id v43 = [v133 countByEnumeratingWithState:&v142 objects:v163 count:16];
    if (v43) {
      continue;
    }
    break;
  }

  BOOL v56 = v44 != 0;
  BOOL v57 = v130 != 0;
  if (v44 && v130)
  {
    if (-[NSObject compare:](v44, "compare:") != (id)-1)
    {
      BOOL v57 = 1;
      BOOL v56 = 1;
      goto LABEL_73;
    }
    [v130 timeIntervalSinceDate:v44];
    double v98 = v97;
    v99 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v100 = [v99 stringValue];
    [*(id *)(v129 + 32) setObject:v100 forKeyedSubscript:@"reconnectionCarkitTime"];

    long long v58 = CarGeneralLogging();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v101 = +[NSNumber numberWithDouble:v98];
      *(_DWORD *)v159 = 138412290;
      v160 = v101;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "CarKit reconnection time: %@", v159, 0xCu);
    }
LABEL_72:

    BOOL v57 = v117;
    BOOL v56 = v117;
  }
LABEL_73:
  uint64_t v59 = +[NSSet setWithObject:&off_1000C67C0];
  [v124 allEventsOfTypes:v59];
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  v132 = (id)objc_claimAutoreleasedReturnValue();
  id v60 = [v132 countByEnumeratingWithState:&v138 objects:v158 count:16];
  BOOL v118 = v57;
  v116 = (void *)v59;
  if (!v60)
  {
    long long v61 = 0;
    long long v75 = v132;
    goto LABEL_92;
  }
  BOOL v115 = v56;
  long long v61 = 0;
  uint64_t v62 = *(void *)v139;
  uint64_t v63 = CARWiFiWPAHSCompleted;
  do
  {
    for (j = 0; j != v60; j = (char *)j + 1)
    {
      if (*(void *)v139 != v62) {
        objc_enumerationMutation(v132);
      }
      double v65 = *(void **)(*((void *)&v138 + 1) + 8 * (void)j);
      double v66 = [v65 eventName];
      if ([v66 isEqualToString:v63])
      {
        if (!v61
          || ([v65 eventDate],
              id v67 = objc_claimAutoreleasedReturnValue(),
              BOOL v68 = [v67 compare:v61] == (id)-1,
              v67,
              v68))
        {
          uint64_t v69 = [v65 eventDate];

          long long v61 = (void *)v69;
        }
      }
    }
    id v60 = [v132 countByEnumeratingWithState:&v138 objects:v158 count:16];
  }
  while (v60);

  if (v61) {
    BOOL v70 = v115;
  }
  else {
    BOOL v70 = 0;
  }
  if (v70 && [v44 compare:v61] == (id)-1)
  {
    [v61 timeIntervalSinceDate:v44];
    double v72 = v71;
    long long v73 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    long long v74 = [v73 stringValue];
    [*(id *)(v129 + 32) setObject:v74 forKeyedSubscript:@"reconnectionWifiTime"];

    long long v75 = CarGeneralLogging();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v76 = +[NSNumber numberWithDouble:v72];
      *(_DWORD *)v159 = 138412290;
      v160 = v76;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Wi-Fi reconnection time: %@", v159, 0xCu);
    }
LABEL_92:
  }
  if (v122 && v118 && [v137 compare:v130] == (id)-1)
  {
    [v130 timeIntervalSinceDate:v137];
    double v78 = v77;
    uint64_t v79 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v80 = [v79 stringValue];
    [*(id *)(v129 + 32) setObject:v80 forKeyedSubscript:@"reconnectionTotalTime"];

    v81 = CarGeneralLogging();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      v82 = +[NSNumber numberWithDouble:v78];
      *(_DWORD *)v159 = 138412290;
      v160 = v82;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Total reconnection time: %@", v159, 0xCu);
    }
    if (CRIsInternalInstall())
    {
      v83 = +[CARPrototypePref allowAutomaticConnectionDurationTTR];
      unsigned int v84 = [v83 internalSettingsState];

      if (v84)
      {
        v85 = +[CARPrototypePref wirelessConnectionDurationTTRThreshold];
        v86 = [v85 internalSettingsValue];

        [v86 doubleValue];
        if (v78 > v87)
        {
          if (v87 <= 7.0)
          {
            v89 = CarGeneralLogging();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v159 = 0;
              _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Reconnection time exceeded user-default threshold but the user-default value is lower than CarPlay spec requirement. No radar draft necessary.", v159, 2u);
            }
          }
          else
          {
            v88 = CarGeneralLogging();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v159 = 0;
              _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Reconnection time exceeded user-defined threshold. Preparing TTR Draft.", v159, 2u);
            }

            v89 = objc_alloc_init((Class)NSDateComponentsFormatter);
            [v89 setAllowedUnits:192];
            [v89 setZeroFormattingBehavior:0x10000];
            v90 = [v89 stringFromTimeInterval:v78];
            v91 = +[NSString stringWithFormat:@"Total Reconnection Time: %@", v90];
            [WeakRetained _prepareConnectionTTRDraftWithConnectionSession:v124 withAdditionalDescription:v91 completionHandler:&stru_1000BF7C0];
          }
        }
      }
    }
  }
  [WeakRetained sendEvent:8 withDictionary:*(void *)(v129 + 32)];
  v102 = CarGeneralLogging();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v159 = 0;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessSessionEndedWithPayload event", v159, 2u);
  }

  if ((unint64_t)[v128 count] >= 2)
  {
    v103 = [v128 objectAtIndexedSubscript:1];
    v104 = [v103 vehicleInformation];
    id v105 = [v104 mutableCopy];
    v106 = v105;
    if (v105) {
      id v107 = v105;
    }
    else {
      id v107 = (id)objc_opt_new();
    }
    v108 = v107;

    v109 = [v103 events];
    BOOL v110 = [v109 count] == 0;

    if (!v110)
    {
      v111 = [v103 events];
      v112 = [v111 firstObject];
      v113 = [v112 eventDate];
      v114 = [v113 description];
      [v108 setObject:v114 forKeyedSubscript:@"finalEventTime"];
    }
    [WeakRetained sendEvent:7 withDictionary:v108];
  }
  _Block_object_dispose(&buf, 8);

LABEL_122:
LABEL_123:
}

void sub_100065820(_Unwind_Exception *a1)
{
}

void sub_1000658F0(id a1)
{
  uint64_t v1 = (void *)qword_1000E3958;
  qword_1000E3958 = (uint64_t)&off_1000C7250;

  uint64_t v2 = (void *)qword_1000E3960;
  qword_1000E3960 = (uint64_t)&off_1000C7268;
}

void sub_100065940(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSSet setWithObject:v5];
  id v7 = [*(id *)(a1 + 32) allEventsOfTypes:v6];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v8)
  {
    uint64_t v11 = 0;
    id v10 = 0;
    goto LABEL_24;
  }
  id v9 = v8;
  uint64_t v31 = a1;
  uint64_t v32 = a3;
  id v33 = v6;
  id v34 = v5;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v36;
  uint64_t v13 = CARiAPConnectionStart;
  uint64_t v14 = CARiAPAuthComplete;
  do
  {
    for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v36 != v12) {
        objc_enumerationMutation(v7);
      }
      long long v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      uint64_t v17 = [v16 eventName:v31];
      if ([v17 isEqualToString:v13])
      {
        uint64_t v18 = [v16 eventDate];
        uint64_t v19 = v11;
        uint64_t v11 = (void *)v18;
      }
      else
      {
        if (![v17 isEqualToString:v14]) {
          goto LABEL_11;
        }
        uint64_t v20 = [v16 eventDate];
        uint64_t v19 = v10;
        id v10 = (void *)v20;
      }

LABEL_11:
    }
    id v9 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  }
  while (v9);
  if (v11)
  {
    id v6 = v33;
    id v5 = v34;
    if (v10 && [v11 compare:v10] == (id)-1)
    {
      [v10 timeIntervalSinceDate:v11];
      double v22 = v21;
      *(double *)(*(void *)(*(void *)(v31 + 48) + 8) + 24) = v21
                                                                   + *(double *)(*(void *)(*(void *)(v31 + 48) + 8)
                                                                               + 24);
      id v23 = +[NSNumber numberWithDouble:v21];
      id v24 = [v23 stringValue];
      double v25 = *(void **)(v31 + 40);
      id v26 = [(id)qword_1000E3960 objectAtIndexedSubscript:v32];
      id v27 = [v26 unsignedIntegerValue];
      if ((unint64_t)v27 > 0xA) {
        CFStringRef v28 = @"Unknown";
      }
      else {
        CFStringRef v28 = *(&off_1000BF880 + (void)v27);
      }
      [v25 setObject:v24 forKeyedSubscript:v28];

      uint64_t v29 = CarGeneralLogging();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = +[NSNumber numberWithDouble:v22];
        *(_DWORD *)long long buf = 138412290;
        id v40 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "iAP reconnection time: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v6 = v33;
    id v5 = v34;
  }
LABEL_24:
}

void sub_100065C48(id a1)
{
  uint64_t v1 = CarGeneralLogging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "TTR Draft prepared for user.", v2, 2u);
  }
}

void sub_100065D58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100065D74(uint64_t a1, void *a2)
{
  id v16 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((unint64_t)[v16 count] >= 2)
  {
    BOOL v4 = [v16 objectAtIndexedSubscript:1];
    id v5 = [v4 vehicleInformation];
    id v6 = [v5 mutableCopy];
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    id v9 = v8;

    id v10 = [v4 events];
    id v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = [v4 events];
      uint64_t v13 = [v12 firstObject];
      uint64_t v14 = [v13 eventDate];
      long long v15 = [v14 description];
      [v9 setObject:v15 forKeyedSubscript:@"finalEventTime"];
    }
    [WeakRetained sendEvent:7 withDictionary:v9];
  }
}

void sub_100066050(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  BOOL v4 = a3;
  id v5 = CarGeneralLogging();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessPairingCreatedEvent connection event", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1000762F4(v4);
  }
}

uint64_t sub_10006665C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

int64_t sub_100066964(id a1, MAAsset *a2, MAAsset *a3)
{
  return [(MAAsset *)a2 cr_themeAsset_versionCompare:a3];
}

uint64_t sub_100066B64(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 cr_themeAsset_assetIdentifier];
  if (!v4 || ![*(id *)(a1 + 32) isEqualToString:v4])
  {
    uint64_t v14 = 0;
    goto LABEL_30;
  }
  if (*(void *)(a1 + 40))
  {
    id v5 = [v3 cr_themeAsset_minimumSDKVersion];
    id v6 = v5;
    if (v5)
    {
      id v7 = [(char *)[v5 cr_buildVersionCompare:*(void *)(a1 + 40)] + 1];
      id v8 = CarThemeAssetsLogging();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if ((unint64_t)v7 > 1)
      {
        if (v9)
        {
          uint64_t v22 = *(void *)(a1 + 40);
          int v29 = 138412802;
          id v30 = v3;
          __int16 v31 = 2112;
          uint64_t v32 = v6;
          __int16 v33 = 2112;
          uint64_t v34 = v22;
          double v21 = "ignoring asset %@, the minimum SDK version of %@ is not valid for SDK: %@";
          goto LABEL_21;
        }
LABEL_22:
        uint64_t v14 = 0;
LABEL_29:

        goto LABEL_30;
      }
      if (!v9) {
        goto LABEL_12;
      }
      id v10 = *(void **)(a1 + 40);
      int v29 = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      uint64_t v32 = v10;
      id v11 = "asset's minimum SDK version of %@ is valid for SDK: %@";
      uint64_t v12 = v8;
      uint32_t v13 = 22;
    }
    else
    {
      id v8 = CarThemeAssetsLogging();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      long long v15 = *(void **)(a1 + 40);
      int v29 = 138412290;
      id v30 = v15;
      id v11 = "asset does not have a minimum SDK version, assuming it works with SDK: %@";
      uint64_t v12 = v8;
      uint32_t v13 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v29, v13);
    goto LABEL_12;
  }
LABEL_13:
  if (*(void *)(a1 + 48))
  {
    id v16 = [v3 cr_themeAsset_minimumCompatibilityVersion];
    id v6 = v16;
    if (v16)
    {
      id v17 = [v16 unsignedIntegerValue];
      id v18 = [*(id *)(a1 + 48) unsignedIntegerValue];
      id v8 = CarThemeAssetsLogging();
      BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v17 > v18)
      {
        if (v19)
        {
          uint64_t v20 = *(void *)(a1 + 48);
          int v29 = 138412802;
          id v30 = v3;
          __int16 v31 = 2112;
          uint64_t v32 = v6;
          __int16 v33 = 2112;
          uint64_t v34 = v20;
          double v21 = "ignoring asset %@, the minimum compatibility version of %@ is not valid for supported compatibility version: %@";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v29, 0x20u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (v19)
      {
        id v27 = *(void **)(a1 + 48);
        int v29 = 138412546;
        id v30 = v6;
        __int16 v31 = 2112;
        uint64_t v32 = v27;
        id v24 = "asset's minimum compatibility version of %@ is valid for supported compatibility version: %@";
        double v25 = v8;
        uint32_t v26 = 22;
        goto LABEL_27;
      }
    }
    else
    {
      id v8 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = *(void **)(a1 + 48);
        int v29 = 138412290;
        id v30 = v23;
        id v24 = "asset does not have a minimum compatibility version, assuming it works with compatibility version: %@";
        double v25 = v8;
        uint32_t v26 = 12;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v29, v26);
      }
    }
    uint64_t v14 = 1;
    goto LABEL_29;
  }
  uint64_t v14 = 1;
LABEL_30:

  return v14;
}

void sub_10006717C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) receiveBuffer];
  if (v2)
  {
    id v3 = (char *)[*(id *)(a1 + 40) length];
    id v4 = [v2 length];
    if (__CFADD__(v4, v3) || &v3[(void)v4] > (char *)0x100000)
    {
      id v6 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100076664();
      }

      id v5 = +[NSData data];
      [v2 setData:v5];
      goto LABEL_10;
    }
    [v2 appendData:*(void *)(a1 + 40)];
    if ((unint64_t)[v2 length] <= 6)
    {
      id v5 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100076698();
      }
LABEL_10:

      goto LABEL_33;
    }
    unsigned __int16 v23 = 0;
    [v2 getBytes:&v23 range:0];
    unsigned int v7 = v23;
    unsigned int v22 = 0;
    [v2 getBytes:&v22 range:2, 4];
    unsigned int v8 = v22;
    id v9 = [v2 length];
    unint64_t v10 = (unint64_t)v9 - 6;
    if ((unint64_t)v9 >= 6)
    {
      unint64_t v13 = bswap32(v8);
      if (v10 < v13)
      {
        uint64_t v12 = sub_10005C6FC(2uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_10007670C();
        }
        goto LABEL_32;
      }
      if (v10 <= v13)
      {
        if (v10 != v13) {
          goto LABEL_33;
        }
        uint64_t v12 = [v2 subdataWithRange:6, v10];
        int v21 = 0;
        uint64_t v14 = objc_opt_class();
        long long v15 = (void *)OPACKDecodeData();
        id v16 = sub_100032500(v14, v15);

        id v17 = sub_10005C6FC(2uLL);
        id v18 = v17;
        if (v16)
        {
          uint64_t v19 = bswap32(v7) >> 16;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 67109378;
            int v25 = v19;
            __int16 v26 = 2112;
            id v27 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "received message { id: %hu, contents: %@ }", buf, 0x12u);
          }

          id v18 = [*(id *)(a1 + 32) messageReceiver];
          if (v18 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v18 propertyListMessenger:*(void *)(a1 + 32) didReceiveMessageWithIdentifier:v19 contents:v16];
          }
          uint64_t v20 = +[NSData data];
          [v2 setData:v20];
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          sub_1000767EC(&v21, v18);
        }

LABEL_32:
        goto LABEL_33;
      }
      id v11 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100076784();
      }
    }
    else
    {
      id v11 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000766D8();
      }
    }

    uint64_t v12 = +[NSData data];
    [v2 setData:v12];
    goto LABEL_32;
  }
LABEL_33:
}

void sub_100067A30(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "wifid crashed, re-attaching", v4, 2u);
  }

  [v2 _updateWiFiDevice];
  [v2 _powerStateDidChange];
}

void sub_100067AB4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "wifi device attached, updating", v5, 2u);
  }

  [v3 _updateWiFiDevice];
}

void sub_100067B30(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wifi power state changed.", v5, 2u);
  }

  [v2 _powerStateDidChange];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CRWiFiPowerChangedNotification" object:v2];
}

void sub_100067F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100067F2C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (v6)
  {
    id v9 = v6;
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8 && (*(unsigned int (**)(uint64_t, id))(v8 + 16))(v8, v7))
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
      CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
      *a4 = 1;
    }
    CFRelease(v7);
    id v6 = v9;
  }
}

id sub_10006806C(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _uuidForNetwork:a2];
  id v4 = [*(id *)(a1 + 40) isEqualToString:v3];

  return v4;
}

id sub_100068154(uint64_t a1)
{
  id v2 = WiFiNetworkGetSSID();
  if (WiFiNetworkIsCarPlay()) {
    id v3 = [*(id *)(a1 + 32) isEqualToString:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_1000692F0(uint64_t a1)
{
  v10[0] = @"messageType";
  v10[1] = @"request";
  v11[0] = &off_1000C6838;
  v11[1] = &off_1000C6850;
  id v2 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  int v9 = 0;
  Data = (void *)OPACKEncoderCreateData();
  if (Data)
  {
    if ([*(id *)(a1 + 32) channelIsOpen])
    {
      id v4 = [*(id *)(a1 + 32) channel];
      unsigned __int8 v5 = [v4 sendChannelMessage:Data];

      id v6 = sub_10005C6FC(4uLL);
      id v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sent request for log archive", v8, 2u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        sub_100076918();
      }
    }
    else
    {
      id v7 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10007694C();
      }
    }
  }
  else
  {
    id v7 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000768AC();
    }
  }
}

void sub_10006953C(uint64_t a1)
{
  v11[0] = @"messageType";
  v11[1] = @"request";
  v12[0] = &off_1000C6838;
  v12[1] = &off_1000C6868;
  void v11[2] = @"interval";
  id v2 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v12[2] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  int v10 = 0;
  Data = (void *)OPACKEncoderCreateData();
  if (Data)
  {
    if ([*(id *)(a1 + 32) channelIsOpen])
    {
      unsigned __int8 v5 = [*(id *)(a1 + 32) channel];
      unsigned __int8 v6 = [v5 sendChannelMessage:Data];

      id v7 = sub_10005C6FC(4uLL);
      uint64_t v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sent request for start statistics", v9, 2u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        sub_1000769EC();
      }
    }
    else
    {
      uint64_t v8 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100076A20();
      }
    }
  }
  else
  {
    uint64_t v8 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100076980();
    }
  }
}

id sub_1000697B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) channel];
  [v2 setChannelDelegate:0];

  id result = [*(id *)(a1 + 32) channelIsOpen];
  if (result)
  {
    id v4 = [*(id *)(a1 + 32) channel];
    [v4 closeChannel];

    unsigned __int8 v5 = *(void **)(a1 + 32);
    return [v5 setChannelIsOpen:0];
  }
  return result;
}

void sub_1000698EC(uint64_t a1)
{
  int v15 = 0;
  objc_opt_class();
  uint64_t v2 = a1 + 32;
  id v3 = (id)OPACKDecodeData();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    objc_opt_class();
    id v5 = [v4 objectForKey:@"messageType"];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      unsigned __int8 v6 = v5;
    }
    else {
      unsigned __int8 v6 = 0;
    }

    if (v6)
    {
      switch((unint64_t)[v6 unsignedIntegerValue])
      {
        case 1uLL:
          [*(id *)(a1 + 40) _fileQueue_handleFileHeaderMessage:v4];
          break;
        case 2uLL:
          [*(id *)(a1 + 40) _fileQueue_handleFilePayloadMessage:v4];
          break;
        case 3uLL:
          uint64_t v14 = sub_10005C6FC(4uLL);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100076B44();
          }
          goto LABEL_24;
        case 4uLL:
          [*(id *)(a1 + 40) _fileQueue_handleStreamPayloadMessage:v4];
          break;
        case 5uLL:
          uint64_t v14 = sub_10005C6FC(4uLL);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100076B78();
          }
LABEL_24:

          break;
        default:
          break;
      }
    }
    else
    {
      id v7 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100076AD4(v2, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  else
  {
    unsigned __int8 v6 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100076A54((void *)(a1 + 32), &v15, v6);
    }
  }
}

id sub_100069BA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChannelIsOpen:0];
}

void sub_10006B430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006B484(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _mainQueue_handleDidDiscoverDevice:v3];
}

void sub_10006B4E0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10005C6FC(2uLL);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100077194();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    sub_100077150(v4);
  }
}

void sub_10006B7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006B810(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _pairWithBluetoothIdentifier:*(void *)(a1 + 32) deviceName:*(void *)(a1 + 40)];
}

void sub_10006BA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006BA80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _connectWithBluetoothIdentifier:*(void *)(a1 + 32) completion:0];
}

void sub_10006C128(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];
  unsigned int v10 = [v9 isEqual:*(void *)(a1 + 32)];

  if (v10)
  {
    uint64_t v11 = sub_10005C6FC(2uLL);
    uint64_t v12 = v11;
    if (a3)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v16 = 141558275;
        uint64_t v17 = 1752392040;
        __int16 v18 = 2113;
        uint64_t v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "starting BLE pairing to %{private, mask.hash}@", (uint8_t *)&v16, 0x16u);
      }

      uint64_t v14 = [*(id *)(a1 + 40) centralManager];
      int v15 = [v14 sharedPairingAgent];
      [v15 pairPeer:v7];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100077344((void *)(a1 + 32), (uint64_t)v8, v12);
      }

      [*(id *)(a1 + 40) _finishedCurrentPairing];
    }
  }
}

void sub_10006C684(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    uint64_t v9 = [[CARBluetoothCarPlayService alloc] initWithPeripheral:v7];
    [(CARBluetoothCarPlayService *)v9 setServiceDelegate:*(void *)(a1 + 32)];
    unsigned int v10 = [*(id *)(a1 + 32) servicesForBluetoothIdentifiers];
    uint64_t v11 = [v7 identifier];
    [v10 setObject:v9 forKey:v11];
  }
  else
  {
    uint64_t v12 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000774A4();
    }
  }
}

void sub_10006D088(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(2uLL);
  if (os_signpost_enabled(v2))
  {
    LOWORD(v5) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OpenedChannel", (const char *)&unk_1000B1267, (uint8_t *)&v5, 2u);
  }

  id v3 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "activated service: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10006D220(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "sent message: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10006D360(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000775DC(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_10006D478(void *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 4);
  id v3 = [(id)objc_opt_class() identifier];
  if (v3 == (id)3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = a1[4];
      uint64_t v7 = (void *)a1[5];
      uint64_t v9 = a1[6];
      [v7 _handleStartSessionMessage:v8 fromService:v9];
    }
  }
  else if (v3 == (id)1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = a1[4];
      uint64_t v4 = (void *)a1[5];
      uint64_t v6 = a1[6];
      [v4 _handleIdentificationMessage:v5 fromService:v6];
    }
  }
  else
  {
    unsigned int v10 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007764C(v2, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void sub_10006D608(uint64_t a1)
{
  uint64_t v2 = sub_10005C6FC(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "disconnected service: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) _vehicleForService:*(void *)(a1 + 32)];
  if (v4) {
    [*(id *)(a1 + 40) _removeConnectedVehicle:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 32) peripheral];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [*(id *)(a1 + 40) servicesForBluetoothIdentifiers];
  [v7 removeObjectForKey:v6];
}

void sub_10006E77C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v5)
  {
    id v7 = [v5 BOOLValue];
    int v8 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      CFStringRef v10 = @"declined";
      uint64_t v20 = 1752392040;
      *(_DWORD *)long long buf = 141558531;
      if (v7) {
        CFStringRef v10 = @"confirmed";
      }
      __int16 v21 = 2113;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      CFStringRef v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "pairing for %{private, mask.hash}@ was %{public}@", buf, 0x20u);
    }

    uint64_t v11 = [*(id *)(a1 + 40) centralManager];
    uint64_t v12 = [v11 sharedPairingAgent];
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v17 = CBPairingAgentPairingDataPasskeyKey;
    uint64_t v18 = v14;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v12 respondToPairingRequest:v13 type:v15 accept:v7 data:v16];
  }
  else
  {
    uint64_t v11 = sub_10005C6FC(2uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100077918();
    }
  }
}

void sub_10006EC80(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10006ECA0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Successfully requested bulletin %@", (uint8_t *)&v3, 0xCu);
}

void sub_10006ED1C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_1000045BC((void *)&_mh_execute_header, a2, a3, "Error presenting bulletin %@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006ED98(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "No known presented bulletin matching identifier %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006EE10(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_1000045BC((void *)&_mh_execute_header, a2, a3, "No matching action for %{public}@ on bulletin %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006EE88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to open URL to save file: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006EF00(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create save file", v1, 2u);
}

void sub_10006EF44()
{
  uint64_t v0 = NSStringFromBOOL();
  sub_1000061B8((void *)&_mh_execute_header, v1, v2, "[NightModeFallback] Posting notification with night mode: %@", v3, v4, v5, v6, 2u);
}

void sub_10006EFD0()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Starting location based night mode", v2, v3, v4, v5, v6);
}

void sub_10006F004()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Observed session disconnect, invalidating", v2, v3, v4, v5, v6);
}

void sub_10006F038(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[NightModeFallback] Failed to get a location with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006F0B0()
{
  uint64_t v0 = NSStringFromBOOL();
  sub_1000061B8((void *)&_mh_execute_header, v1, v2, "[NightModeFallback] Initial fallback night mode value: %@", v3, v4, v5, v6, 2u);
}

void sub_10006F13C()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Starting fallback", v2, v3, v4, v5, v6);
}

void sub_10006F170()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Scheduling update because of sunset or sunrise event timer", v2, v3, v4, v5, v6);
}

void sub_10006F1A4()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Scheduling timer for next night mode change", v2, v3, v4, v5, v6);
}

void sub_10006F1D8()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Horizontal accuracy is negative, ignoring location update", v2, v3, v4, v5, v6);
}

void sub_10006F20C()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Updating fallback night mode", v2, v3, v4, v5, v6);
}

void sub_10006F240()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] No previous location", v2, v3, v4, v5, v6);
}

void sub_10006F274()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Distance change between previous location is less than 3km", v2, v3, v4, v5, v6);
}

void sub_10006F2A8()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Comparing against previous location", v2, v3, v4, v5, v6);
}

void sub_10006F2DC()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Significant time change, resetting", v2, v3, v4, v5, v6);
}

void sub_10006F310()
{
  sub_10000A760();
  sub_10000A778((void *)&_mh_execute_header, v0, v1, "Failed to create a keychain item: %@ error: %i");
}

void sub_10006F378()
{
  sub_10000A760();
  sub_10000A778((void *)&_mh_execute_header, v0, v1, "Failed to update a keychain item: %@  error: %i");
}

void sub_10006F3E0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to save unpaired vehicle storage", v1, 2u);
}

void sub_10006F424(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 vehicleName];
  sub_10000A748();
  sub_10000A798((void *)&_mh_execute_header, v3, v4, "Failed to save vehicle preferences: %@ %@", v5, v6, v7, v8, v9);
}

void sub_10006F4B8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 vehicleName];
  sub_10000A748();
  sub_10000A798((void *)&_mh_execute_header, v3, v4, "Failed to remove vehicle preferences: %@ %@", v5, v6, v7, v8, v9);
}

void sub_10006F54C()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "Failed to cleaned up preferences for missing keychain item %@ (%@)");
}

void sub_10006F5B4()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "No matching keychain item for %@ (%@)");
}

void sub_10006F61C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "vehicle to remove is nil", v1, 2u);
}

void sub_10006F660(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "using cache with %lu vehicles", (uint8_t *)&v3, 0xCu);
}

void sub_10006F6EC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create vehicle identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006F764()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "Failed to reconstruct vehicle with %@ (%@)");
}

void sub_10006F7CC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to get first unlock status, error: %i", (uint8_t *)v2, 8u);
}

uint64_t sub_10006F844()
{
  uint64_t v0 = abort_report_np();
  return sub_10006F86C(v0);
}

void sub_10006F86C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "attempting to send data before L2CAP channel is open", v2, v3, v4, v5, v6);
}

void sub_10006F8A0()
{
  sub_1000061AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "_handleHasBytesAvailableOnStream", v1, 2u);
}

void sub_10006F8E0(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 streamError];
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_10000E9DC((void *)&_mh_execute_header, a2, v4, "L2CAP input stream error: %@", (uint8_t *)&v5);
}

void sub_10006F974(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 streamError];
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_10000E9DC((void *)&_mh_execute_header, a2, v4, "L2CAP output stream error: %@", (uint8_t *)&v5);
}

void sub_10006FA08(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10000E9DC((void *)&_mh_execute_header, a2, a3, "failed to discover services: %@", (uint8_t *)&v4);
}

void sub_10006FA7C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no PSM value for L2CAP characteristic", v2, v3, v4, v5, v6);
}

void sub_10006FAB0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10000E9DC((void *)&_mh_execute_header, a2, a3, "failed to connect L2CAP channel, error: %@", (uint8_t *)&v4);
}

void sub_10006FB24()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "ignoring didOpenL2CAPChannel, no active connection attempt", v2, v3, v4, v5, v6);
}

void sub_10006FB58(void *a1)
{
  uint64_t v1 = [a1 UUIDString];
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "disablesCarPlayFeatures: no vehicle for id %@", v4, v5, v6, v7, 2u);
}

void sub_10006FBE0()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "out-of-band pairing is only supported for iAP connections", v2, v3, v4, v5, v6);
}

void sub_10006FC14()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "Wi-Fi credentials request is only supported for iAP connections", v2, v3, v4, v5, v6);
}

void sub_10006FC48()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "sending device transport identifiers is only supported for iAP connections", v2, v3, v4, v5, v6);
}

void sub_10006FC7C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "timed out waiting on CoreAccessories", v2, v3, v4, v5, v6);
}

void sub_10006FCB0(void *a1, NSObject *a2)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  unsigned int v6 = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "certification override service connection is not entitled: %@: process: %i", (uint8_t *)&v3, 0x12u);
}

void sub_10006FD4C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "non-string objects in array: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006FDC4()
{
  sub_100014768();
  int v2 = [v1 region];
  [v2 center];
  uint64_t v3 = [v0 region];
  [v3 center];
  sub_100014750();
  sub_100014730((void *)&_mh_execute_header, v4, v5, "Currently in region with lat/long: {%f, %f}", v6, v7, v8, v9, v10);
}

void sub_10006FE78(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating geofence around lat/long: {%f, %f}", (uint8_t *)&v3, 0x16u);
}

void sub_10006FF00()
{
  sub_100014768();
  int v2 = [v1 location];
  [v2 latitude];
  int v3 = [v0 location];
  [v3 longitude];
  sub_100014774();
  sub_100014730((void *)&_mh_execute_header, v4, v5, "Not creating geofence around {%f, %f} since we're at our maximum geofence count.", v6, v7, v8, v9, v10);
}

void sub_10006FFB4()
{
  sub_100014768();
  int v2 = [v1 location];
  [v2 latitude];
  int v3 = [v0 location];
  [v3 longitude];
  sub_100014774();
  sub_100014730((void *)&_mh_execute_header, v4, v5, "Geofence already exists around lat/long: {%f, %f}", v6, v7, v8, v9, v10);
}

void sub_100070068()
{
  sub_100014768();
  [v1 center];
  [v0 center];
  sub_100014750();
  sub_100014730((void *)&_mh_execute_header, v2, v3, "Begin monitoring for lat/long: {%f, %f}", v4, v5, v6, v7, v8);
}

void sub_1000700F4()
{
  sub_100014768();
  [v1 center];
  [v0 center];
  sub_100014750();
  sub_100014730((void *)&_mh_execute_header, v2, v3, "Entered region for lat/long: {%f, %f}", v4, v5, v6, v7, v8);
}

void sub_100070180()
{
  sub_100014768();
  [v1 center];
  [v0 center];
  sub_100014750();
  sub_100014730((void *)&_mh_execute_header, v2, v3, "Exited region for lat/long: {%f, %f}", v4, v5, v6, v7, v8);
}

void sub_10007020C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Location manager failed for Geofencing: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_100070284()
{
  os_log_t v0 = abort_report_np();
  return sub_1000702AC(v0);
}

void sub_1000702AC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "wantsToPresentHeadUnitPairingPrompt", v1, 2u);
}

void sub_1000702F0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "presentHeadUnitPairingPrompt", v1, 2u);
}

void sub_100070334(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "presentHeadUnitPairingPrompt completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000703AC(char a1, NSObject *a2)
{
  CFStringRef v2 = @"NO";
  if (a1) {
    CFStringRef v2 = @"YES";
  }
  int v3 = 138543362;
  CFStringRef v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "handleReceivedResponse: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10007043C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "keyIdentifier mismatch", v1, 2u);
}

void sub_100070480(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "prox card can't be presented due to current UI state", v1, 2u);
}

void sub_1000704C4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CarPlaySetup did invalidate with error %@", (uint8_t *)&v3, 0xCu);
}

void sub_100070540(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "CRSetupLauncher invalidate", v1, 2u);
}

void sub_100070584()
{
  sub_1000061AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "invalidating file sender", v1, 2u);
}

void sub_1000705C4()
{
  sub_100018390();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed file transfer for cluster theme version %@", v2, v3, v4, v5, v6);
}

void sub_100070630()
{
  sub_100018390();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed file transfer for log archive %@", v2, v3, v4, v5, v6);
}

void sub_10007069C()
{
  sub_10001839C(__stack_chk_guard);
  sub_100018378();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "failed to find file %@: %@");
}

void sub_100070704()
{
  sub_10001839C(__stack_chk_guard);
  sub_100018378();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "failed to read file %@: %@");
}

void sub_10007076C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "received file transfer accept with failure status, canceling transfer", v2, v3, v4, v5, v6);
}

void sub_1000707A0(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to encode file transfer header: %d", (uint8_t *)v3, 8u);
}

void sub_10007081C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to send file transfer header", v2, v3, v4, v5, v6);
}

void sub_100070850()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "timed out sending file transfer message", v2, v3, v4, v5, v6);
}

void sub_100070884()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to send file transfer message", v2, v3, v4, v5, v6);
}

void sub_1000708B8()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to send file transfer message, channel is closed", v2, v3, v4, v5, v6);
}

void sub_1000708EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070958(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000709C4()
{
  sub_1000061AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "sent file data chunk", v1, 2u);
}

void sub_100070A04(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "received file data reply: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100070A7C()
{
  sub_10001839C(__stack_chk_guard);
  sub_100018390();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "failed to parse file message: %@, error: %d", v2, 0x12u);
}

void sub_100070B04()
{
  sub_10001839C(__stack_chk_guard);
  sub_100018390();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no message type in file channel message: %@", v2, v3, v4, v5, v6);
}

void sub_100070B6C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "file sender can't receive files", v2, v3, v4, v5, v6);
}

void sub_100070BA0()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "file sender can't receive file requests", v2, v3, v4, v5, v6);
}

void sub_100070BD4()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "file sender can't receive streams", v2, v3, v4, v5, v6);
}

void sub_100070C08()
{
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: car carpabilities: new plist %@", v2, v3, v4, v5, 2u);
}

void sub_100070C80()
{
  sub_10001A6C0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: received session %@", v2, v3, v4, v5, 2u);
}

void sub_100070CF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070D6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070DE4()
{
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void sub_100070E5C()
{
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void sub_100070ED4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070F4C()
{
  sub_10001A6C0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities countryCode %@ album art forbidden", v2, v3, v4, v5, 2u);
}

void sub_100070FC0()
{
  sub_10001A6C0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities countryCode %@ album art allowed", v2, v3, v4, v5, 2u);
}

void sub_100071034(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000710AC()
{
  sub_10001A704();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities using plist album art value: %ld", v2, v3, v4, v5, 2u);
}

void sub_100071120()
{
  sub_10001A704();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities using internal setting album art value: %ld", v2, v3, v4, v5, 2u);
}

void sub_100071194(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "CRSetupPromptPresenterSession invalidate", v1, 2u);
}

void sub_1000711D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error calling setup prompt presenter service: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100071250(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "coudn't update asset progress", v1, 2u);
}

void sub_100071294(void *a1)
{
  [a1 processIdentifier];
  sub_10001EE10();
  sub_10001EE28((void *)&_mh_execute_header, v1, v2, "pairing service connection is not entitled: %@: process: %i", v3, v4, v5, v6, v7);
}

void sub_100071310()
{
  sub_1000061AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "clearing current pairing session", v1, 2u);
}

void sub_100071350(void *a1)
{
  [a1 processIdentifier];
  sub_10001EE10();
  sub_10001EE28((void *)&_mh_execute_header, v1, v2, "HUP prompt service connection is not entitled: %@: process: %i", v3, v4, v5, v6, v7);
}

void sub_1000713CC()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "not presenting head unit pairing prompt, pairing is not available", v2, v3, v4, v5, v6);
}

void sub_100071400()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no BT address for current pairing session", v2, v3, v4, v5, v6);
}

void sub_100071434(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to save vehicle for head unit pairing: %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000714B0()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no matching BT address for current pairing session", v2, v3, v4, v5, v6);
}

void sub_1000714E4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[CRCarPlayAppServiceAgent requestCarCapabilitiesUpdate]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void sub_100071568()
{
  v1[0] = 136315394;
  sub_10001A6C0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: request with options %@", (uint8_t *)v1, 0x16u);
}

void sub_1000715E8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[CRCarPlayAppServiceAgent requestCarCapabilitiesStatus:withReply:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: request reply returned late, dropped", (uint8_t *)&v1, 0xCu);
}

void sub_10007166C()
{
  v1[0] = 136315394;
  sub_10001A6C0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: request replied successfully %@", (uint8_t *)v1, 0x16u);
}

void sub_1000716EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071724(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to query for CarPlay MobileAssets asset: %@, queryResult: %ld", (uint8_t *)&v2, 0x16u);
}

void sub_1000717A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000717E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071818(void *a1, NSObject *a2)
{
  v3[0] = 67109378;
  v3[1] = [a1 processIdentifier];
  __int16 v4 = 2112;
  CFStringRef v5 = @"com.apple.private.carkit.app";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void sub_1000718B8(void *a1, NSObject *a2)
{
  v3[0] = 67109378;
  v3[1] = [a1 processIdentifier];
  __int16 v4 = 2112;
  CFStringRef v5 = @"com.apple.private.carkit";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void sub_100071958()
{
  sub_100031654(__stack_chk_guard);
  sub_1000315C0();
  sub_100031600((void *)&_mh_execute_header, v0, v1, "pairing completion address %{private, mask.hash}@ didn't match expected addresses %{private, mask.hash}@");
}

void sub_1000719C0()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "starting a new Bluetooth pairing but there was an existing vehicle, removing: %@", v2, v3, v4, v5, v6);
}

void sub_100071A28()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no startSessionProperties", v2, v3, v4, v5, v6);
}

void sub_100071A5C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "not handling StartSession, CarPlay is restricted", v2, v3, v4, v5, v6);
}

void sub_100071A90()
{
  sub_100018390();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Failed to find a connected accessory with connection ID: %lu", v2, v3, v4, v5, v6);
}

void sub_100071AFC()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed to save WiFi credentials: %@", v2, v3, v4, v5, v6);
}

void sub_100071B64()
{
  sub_10001839C(__stack_chk_guard);
  sub_100018390();
  sub_10001A6D4((void *)&_mh_execute_header, v0, v1, "deviceSupportedCarPlayFeatures %{public}lu", v2, v3, v4, v5, v6);
}

void sub_100071BD0()
{
  sub_10001839C(__stack_chk_guard);
  if (*(unsigned char *)(v2 + 24)) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  *(_DWORD *)uint64_t v4 = 134349314;
  *(void *)&void v4[4] = v0;
  *(_WORD *)&v4[12] = 2114;
  *(void *)&v4[14] = v3;
  sub_100031620((void *)&_mh_execute_header, v0, v1, "disablesCarPlayFeatures %{public}lu: %{public}@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16]);
}

void sub_100071C64()
{
  sub_10001839C(__stack_chk_guard);
  sub_100018390();
  sub_10001A6D4((void *)&_mh_execute_header, v0, v1, "setCarPlayFeaturesDisabled was successful: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100071CE8()
{
  sub_1000315F4();
  sub_10001A6D4((void *)&_mh_execute_header, v0, v1, "diagnostics request is using logging file receiver: %@", v2, v3, v4, v5, v6);
}

void sub_100071D50()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "BLE numeric confirmation required but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
}

void sub_100071D84()
{
  sub_100031654(__stack_chk_guard);
  sub_1000315C0();
  sub_100031600((void *)&_mh_execute_header, v0, v1, "pairing confirmation device identifier %{private, mask.hash}@ didn't match expected identifier %{private, mask.hash}@");
}

void sub_100071DEC()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "BLE pairing failed but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
}

void sub_100071E20(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  sub_1000315F4();
  sub_10000E9DC((void *)&_mh_execute_header, a2, v4, "Error recording CARCarKitVehicleInformationEvent %@", v5);
}

void sub_100071EAC()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no startSessionMessage", v2, v3, v4, v5, v6);
}

void sub_100071EE0()
{
  sub_100018378();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "failed start session for host: %@ error: %@", v1, 0x16u);
}

void sub_100071F5C()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Failed to find a connected accessory with connection ID: %lu", v2, v3, v4, v5, v6);
}

void sub_100071FC4()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Failed to update vehicle %@", v2, v3, v4, v5, v6);
}

void sub_10007202C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "not posting in-car notification, WiFi credentials were not received while Bluetooth connected", v2, v3, v4, v5, v6);
}

void sub_100072060(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  sub_1000315F4();
  sub_10000E9DC((void *)&_mh_execute_header, a2, v4, "Failed to save WiFi credentials for vehicle %@", v5);
}

void sub_1000720EC()
{
  sub_100018378();
  sub_100031620((void *)&_mh_execute_header, v0, v1, "startSessionWithHost replied with success: %@, error: %@");
}

void sub_10007216C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "need to update vehicle asset but asset manager is nil", v2, v3, v4, v5, v6);
}

void sub_1000721A0()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed to get an active carplay endpoint for %@", v2, v3, v4, v5, v6);
}

uint64_t sub_100072208()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10007222C(v0);
}

void sub_10007222C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to get endpoint value for info response, error: %i", (uint8_t *)v2, 8u);
}

void sub_1000722A4()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "attempted to save a nil vehicle", v2, v3, v4, v5, v6);
}

void sub_1000722D8()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Failed to save vehicle %@", v2, v3, v4, v5, v6);
}

void sub_100072340(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 48) identifier];
  sub_1000315F4();
  sub_10000E9DC((void *)&_mh_execute_header, a2, v4, "Failed to remove WiFi credentials for vehicle %@", v5);
}

void sub_1000723D0()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "vehicle to remove is nil", v2, v3, v4, v5, v6);
}

void sub_100072404()
{
  sub_1000315F4();
  sub_100031620((void *)&_mh_execute_header, v0, v1, "_sendDeviceIdentifiersForMessagingVehicle %@ pairingStatus %lu");
}

void sub_100072478()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed to present setup prompt, error: %@", v2, v3, v4, v5, v6);
}

void sub_1000724E0()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "canceling setup prompt flow: unable to remove temporary vehicle %@", v2, v3, v4, v5, v6);
}

void sub_100072548()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no bluetooth confirmation handler", v2, v3, v4, v5, v6);
}

void sub_10007257C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "head unit pairing completed but no pairing flow controller", v2, v3, v4, v5, v6);
}

void sub_1000725B0()
{
  sub_100031640();
  sub_100031600((void *)&_mh_execute_header, v0, v1, "head unit pairing address %{private, mask.hash}@ didn't match expected addresses %{private, mask.hash}@");
}

void sub_100072638()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no setup flow to show head unit pairing error", v2, v3, v4, v5, v6);
}

void sub_10007266C()
{
  sub_100031640();
  __int16 v4 = 2113;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "head unit pairing failed for %{private, mask.hash}@, error: %@", v3, 0x20u);
}

void sub_1000726FC()
{
  sub_10001839C(__stack_chk_guard);
  sub_100018390();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Unable to remove temporary vehicle %@", v2, v3, v4, v5, v6);
}

void sub_10007276C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to get a vehicle for OOB decline count", v2, v3, v4, v5, v6);
}

void sub_1000727A0()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "BT numeric confirmation required but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
}

void sub_1000727D4()
{
  sub_100031654(__stack_chk_guard);
  sub_1000315C0();
  sub_100031600((void *)&_mh_execute_header, v0, v1, "pairing confirmation address %{private, mask.hash}@ didn't match expected addresses %{private, mask.hash}@");
}

void sub_10007283C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "BT pairing failure but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
}

void sub_100072870(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000315F4();
  sub_10000E9DC((void *)&_mh_execute_header, a2, v4, "CARAnalytics: unable to send wirelessPairingCreatedEvent connection event. Error: %@", v5);
}

void sub_1000728FC()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "failed to save signature to %@: %@");
}

void sub_100072964()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "failed to save certificate to %@: %@");
}

void sub_1000729CC()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "failed to save accessory additions to %@: %@");
}

void sub_100072A34()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072AA8()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072B1C()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072B90()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072C04()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072C78()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072CEC()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072D60()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072DD4()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072E48()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072EBC()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072F30()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100072FA4()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100073018()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_10007308C()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100073100()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_100073174()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_1000731E8()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_10007325C()
{
  sub_10001A6C0();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
}

void sub_1000732D0()
{
  sub_10001A6C0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: Created new state machine %@", v2, v3, v4, v5, 2u);
}

void sub_100073344(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000733BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100073448(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_10001A6C0();
  sub_100014730((void *)&_mh_execute_header, v2, v3, "%s: root fall through for inEvent %@", v4, v5, v6, v7, 2u);
}

void sub_1000734D8(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_10001A6C0();
  sub_100014730((void *)&_mh_execute_header, v2, v3, "%s: readyState event block inEvent %@", v4, v5, v6, v7, 2u);
}

void sub_100073568()
{
  sub_1000374F8(__stack_chk_guard);
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: loadingState event block inEvent %@", v2, v3, v4, v5, 2u);
}

void sub_1000735F8()
{
  sub_1000374F8(__stack_chk_guard);
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: searchingState event block inEvent %@", v2, v3, v4, v5, 2u);
}

void sub_100073688()
{
  sub_1000374F8(__stack_chk_guard);
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: doneState event block inEvent %@", v2, v3, v4, v5, 2u);
}

void sub_100073718()
{
  sub_1000374F8(__stack_chk_guard);
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: event = %@", v2, v3, v4, v5, 2u);
}

void sub_1000737A8()
{
  sub_10001A6C0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: moving to state %@", v2, v3, v4, v5, 2u);
}

void sub_10007381C()
{
  sub_1000374F8(__stack_chk_guard);
  sub_10001A6F0();
  sub_10001A6A4((void *)&_mh_execute_header, v0, v1, "%s: state = %@", v2, v3, v4, v5, 2u);
}

void sub_1000738AC(id *a1, uint64_t a2, NSObject *a3)
{
  [*a1 indexOfObject:a2];
  v5[0] = 136315650;
  sub_10001A704();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: keyAtIndex (%ld) = %@", (uint8_t *)v5, 0x20u);
}

void sub_100073958(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000739D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100073A48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100073AC0(uint64_t a1)
{
  [*(id *)(a1 + 64) count];
  sub_10001A704();
  sub_100014730((void *)&_mh_execute_header, v1, v2, "%s: %ld candidates", v3, v4, v5, v6, 2u);
}

void sub_100073B48()
{
  v1[0] = 136315394;
  sub_10001A6C0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Car Capabilities plist key %@ is not allowlisted", (uint8_t *)v1, 0x16u);
}

void sub_100073BC8()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "failed to launch CarPlaySetup", v2, v3, v4, v5, v6);
}

void sub_100073BFC()
{
  sub_1000061AC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "cannot perform prompt presenter action, no session", v1, 2u);
}

void sub_100073C3C()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "blocking setup prompt queue", v2, v3, v4, v5, v6);
}

void sub_100073C70()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "unblocking setup prompt queue", v2, v3, v4, v5, v6);
}

void sub_100073CA4(void *a1, NSObject *a2)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  unsigned int v6 = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "setup prompt service connection is not entitled: %@: process: %i", (uint8_t *)&v3, 0x12u);
}

void sub_100073D40()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "lockdown_recv returned error: %zi, canceling dispatch source and removing lockdown connection", v2, v3, v4, v5, v6);
}

void sub_100073DA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100073DE0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to start lockdown service listener: %i", (uint8_t *)v2, 8u);
}

void sub_100073E58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100073E90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100073EC8()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Closing connection, received unknown RemoteXPC error: %@", v2, v3, v4, v5, v6);
}

void sub_100073F30()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Closing connection, received RemoteXPC error: %@", v2, v3, v4, v5, v6);
}

void sub_100073F98()
{
  sub_1000315F4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "No data for dictionary key 'payload', %@", v1, 0xCu);
}

void sub_10007400C(void *a1, NSObject *a2)
{
  [a1 lock_lockdownConnection];
  sub_1000315F4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get socket for lockdown connection: %@", v3, 0xCu);
}

uint64_t sub_100074094()
{
  uint64_t v0 = abort_report_np();
  return sub_1000740BC(v0);
}

void sub_1000740BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "no \"CommStats\" entry in %@", (uint8_t *)&v2, 0xCu);
}

void sub_100074134()
{
  sub_1000315F4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Receiving unknown connection: %{public}@", v1, 0xCu);
}

void sub_1000741A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_1000315F4();
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "Connection interrupted: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10007422C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_1000315F4();
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "Connection invalidated: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000742B0(uint64_t a1, void *a2)
{
  [a2 processIdentifier];
  sub_10001EE10();
  sub_10001EE28((void *)&_mh_execute_header, v2, v3, "[addNavigationIdentifer] Error adding navigation owner for %{public}@(%d). It is already in owner list", v4, v5, v6, v7, v8);
}

void sub_100074330(uint64_t a1, void *a2)
{
  [a2 processIdentifier];
  sub_10001EE10();
  sub_10001EE28((void *)&_mh_execute_header, v2, v3, "[addNavigationIdentifer] Error adding navigation owner %{public}@(%d) is already in owner list", v4, v5, v6, v7, v8);
}

void sub_1000743B0()
{
  sub_1000315F4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Unable to remove owner %{public}@ %{public}@", v2, 0x16u);
}

void sub_100074434(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[updateOwnershipToiOSIfNecessary] Attempting to update ownership to iOS but no CarPlay session is available", v1, 2u);
}

uint64_t sub_100074478()
{
  uint64_t v0 = abort_report_np();
  return sub_1000744A0(v0);
}

void sub_1000744A0()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "received Bluetooth confirmation request for a device other than the existing prompt flow device", v2, v3, v4, v5, v6);
}

void sub_1000744D4()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "received Bluetooth failed for a device other than the existing prompt flow device", v2, v3, v4, v5, v6);
}

void sub_100074508()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "cannot present initial step", v2, v3, v4, v5, v6);
}

void sub_10007453C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "timed out waiting on messaging vehicle, will dismiss prompt flow", v2, v3, v4, v5, v6);
}

void sub_100074570()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "CRWirelessPairingSession invalidate", v2, v3, v4, v5, v6);
}

void sub_1000745A4()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "CarPlay is not allowed", v2, v3, v4, v5, v6);
}

void sub_1000745D8()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "cannot start pairing, not an active pairing session", v2, v3, v4, v5, v6);
}

void sub_10007460C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "cannot start pairing, pairing is not available", v2, v3, v4, v5, v6);
}

void sub_100074640()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "carkitd failure during pairing", v2, v3, v4, v5, v6);
}

void sub_100074674()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "cannot start pairing, failed to initialize remote device", v2, v3, v4, v5, v6);
}

void sub_1000746A8()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "cannot start pairing, failed to setOOBData: %i", v2, v3, v4, v5, v6);
}

void sub_100074710()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "cannot start pairing, failed to clearOOBData: %i", v2, v3, v4, v5, v6);
}

void sub_100074778(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000747E8()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to clearOOBData: %i", v2, v3, v4, v5, v6);
}

void sub_100074850()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to initialize bluetooth address: %i", v2, v3, v4, v5, v6);
}

void sub_1000748B8()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to cancel BT pairing: %i", v2, v3, v4, v5, v6);
}

void sub_100074920()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to get default local device", v2, v3, v4, v5, v6);
}

void sub_100074954()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to get local device address data %d", v2, v3, v4, v5, v6);
}

void sub_1000749BC()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to get local device address string %d", v2, v3, v4, v5, v6);
}

void sub_100074A24()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to initialize device from bluetooth address: %i", v2, v3, v4, v5, v6);
}

void sub_100074A8C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to create a BTSession", v2, v3, v4, v5, v6);
}

void sub_100074AC0()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "blocking session queue", v2, v3, v4, v5, v6);
}

void sub_100074AF4()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "unblocking session queue", v2, v3, v4, v5, v6);
}

void sub_100074B28()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "starting BTSessionDetach", v2, v3, v4, v5, v6);
}

void sub_100074B5C()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "starting BTPairingAgentDestroy", v2, v3, v4, v5, v6);
}

void sub_100074B90()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "BTSession attached", v2, v3, v4, v5, v6);
}

void sub_100074BC4()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "invoking session detach handler", v2, v3, v4, v5, v6);
}

void sub_100074BF8()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "BTSession detached", v2, v3, v4, v5, v6);
}

void sub_100074C2C()
{
  sub_1000061AC();
  sub_100006190((void *)&_mh_execute_header, v0, v1, "clearing session detach handler", v2, v3, v4, v5, v6);
}

void sub_100074C60()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to create a BTPairingAgent", v2, v3, v4, v5, v6);
}

void sub_100074C94()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to get local device address", v2, v3, v4, v5, v6);
}

void sub_100074CC8()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to connect services after starting OOB pairing: %i", v2, v3, v4, v5, v6);
}

void sub_100074D30()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to add BT callbacks, result %i", v2, v3, v4, v5, v6);
}

void sub_100074D98()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "timed out trying to connect BT using OOB pairing data", v2, v3, v4, v5, v6);
}

void sub_100074DCC(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "connected services %i doesn't match expect service mask %i", (uint8_t *)v4, 0xEu);
}

void sub_100074E58()
{
  sub_100047E74();
  sub_100047E58((void *)&_mh_execute_header, v0, v1, "failed to get connected services, result: %i", v2, v3, v4, v5, v6);
}

void sub_100074EC0(void *a1, NSObject *a2)
{
  v3[0] = 67109634;
  v3[1] = [a1 processIdentifier];
  __int16 v4 = 2112;
  CFStringRef v5 = @"com.apple.private.carkit.app";
  __int16 v6 = 2112;
  CFStringRef v7 = @"com.apple.private.carkit.dnd";
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Process %i has neither the %@ nor %@ entitlements", (uint8_t *)v3, 0x1Cu);
}

void sub_100074F70(unsigned __int8 *a1, char a2, NSObject *a3)
{
  CFStringRef v5 = +[NSNumber numberWithBool:*a1];
  __int16 v6 = +[NSNumber numberWithBool:a2 & 1];
  int v7 = 138543618;
  uint8_t v8 = v5;
  __int16 v9 = 2114;
  uint8_t v10 = v6;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Asked for Driving %{public}@, received %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100075048()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to find CarPlayAssetUI.framework", v2, v3, v4, v5, v6);
}

void sub_10007507C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no MaximumAssetCompatibilityVersion in CarPlayAssetUI.framework", v2, v3, v4, v5, v6);
}

void sub_1000750B0()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no certificate serial for session %@", v2, v3, v4, v5, v6);
}

void sub_100075118()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "staged asset version %{public}@ does not have a corresponding asset URL", v2, v3, v4, v5, v6);
}

void sub_100075180(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000751F0()
{
  sub_1000315F4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "cleaning up any assets for id %{public}@ older than version: %{public}@", v2, 0x16u);
}

void sub_100075274()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "Ignoring asset version, unpaired vehicle", v2, v3, v4, v5, v6);
}

void sub_1000752A8()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "staged asset is older than current asset, do we have a valid current asset anymore?", v2, v3, v4, v5, v6);
}

void sub_1000752DC()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "reconnected without applying asset accessory content version %{public}@", v2, v3, v4, v5, v6);
}

void sub_100075344(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000753B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to connect to monitoring client service %@", (uint8_t *)&v2, 0xCu);
}

void sub_10007542C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error creating logging folder: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000754A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error reading contents of logging folder: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10007551C()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "failed to mark %@ as purgeable: %@");
}

void sub_100075584()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no attachment URL", v2, v3, v4, v5, v6);
}

void sub_1000755B8()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no attachment filename", v2, v3, v4, v5, v6);
}

void sub_1000755EC()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "Failed to move diagnostic attachment %@: %@");
}

void sub_100075654()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "Failed to fetch attributes %@: %@");
}

void sub_1000756BC()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no text or filename", v2, v3, v4, v5, v6);
}

void sub_1000756F0()
{
  sub_10000A710();
  sub_10000A728((void *)&_mh_execute_header, v0, v1, "Failed to write text file diagnostic attachment %@: %@");
}

void sub_100075758()
{
  sub_1000061AC();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "CarPlay diagnostics gathering started", v1, 2u);
}

void sub_100075798(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "sysdiagnose failed when gathering CarPlay diagnostics, error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100075834()
{
  sub_1000315F4();
  sub_10005B9D8((void *)&_mh_execute_header, v0, v1, "Failed to fetch current Driving state: %@", v2, v3, v4, v5, v6);
}

void sub_10007589C(unsigned __int8 *a1, char a2, NSObject *a3)
{
  uint64_t v5 = +[NSNumber numberWithBool:*a1];
  uint8_t v6 = +[NSNumber numberWithBool:a2 & 1];
  int v7 = 138543618;
  uint8_t v8 = v5;
  __int16 v9 = 2114;
  uint8_t v10 = v6;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Asked for DNDWD %{public}@, received %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100075974()
{
  sub_1000315F4();
  sub_10005B9D8((void *)&_mh_execute_header, v0, v1, "Failed to retrieve driving mode configuration with %@", v2, v3, v4, v5, v6);
}

void sub_1000759DC()
{
  sub_1000315F4();
  sub_10005B9D8((void *)&_mh_execute_header, v0, v1, "Failed to create driving activity mode: %@", v2, v3, v4, v5, v6);
}

void sub_100075A44()
{
  sub_1000315F4();
  sub_10005B9D8((void *)&_mh_execute_header, v0, v1, "Unable to create DND mode configuration: %@", v2, v3, v4, v5, v6);
}

void sub_100075AAC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "assertion manager timed out", v1, 2u);
}

void sub_100075AF0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "assertion manager timed out but there is an active session", v1, 2u);
}

void sub_100075B34()
{
}

void sub_100075B60(uint64_t a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = (unsigned __int16)[(id)objc_opt_class() identifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to send message with ID: %hu", (uint8_t *)v3, 8u);
}

void sub_100075BF4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "invalid message contents: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100075C70(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "BTDeviceAddressToString(%@) failed with error %d.", (uint8_t *)&v3, 0x12u);
}

void sub_100075CF8()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "failed to find device for address %{private, mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_100075D60()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "failed to find the device (%{private, mask.hash}@) to unpair", v2, v3, v4, v5, v6);
}

void sub_100075DC8()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "failed to find the device (%{private, mask.hash}@) to update contacts sync settings", v2, v3, v4, v5, v6);
}

void sub_100075E30(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to get a numeric comparison confirmation response: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100075EA8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 name];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unsupported pairing style %@", (uint8_t *)&v4, 0xCu);
}

void sub_100075F40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100075FB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100076020()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Failed to query for theme asset: queryResult: %ld", v2, v3, v4, v5, v6);
}

void sub_100076088(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "theme assets catalog not present", v1, 2u);
}

void sub_1000760CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "theme assets catalog out of date", v1, 2u);
}

void sub_100076110()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "Failed to find theme asset for %@", v2, v3, v4, v5, v6);
}

void sub_100076178(void *a1)
{
  uint64_t v1 = [a1 attributes];
  sub_1000315F4();
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "downloadable asset doesn't have appropriate attributes: %@", v4, v5, v6, v7, v8);
}

void sub_100076200(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100076270(void *a1)
{
  uint64_t v1 = [a1 attributes];
  sub_1000315F4();
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "cannot use asset: %@", v4, v5, v6, v7, v8);
}

void sub_1000762F4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000315F4();
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "CARAnalytics: unable to send wirelessPairingCreatedEvent connection event. Error: %@", v4, v5, v6, v7, v8);
}

void sub_100076378()
{
  sub_1000315F4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Sending CA event %@", v1, 0xCu);
}

void sub_1000763EC(uint64_t a1)
{
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:a1];
  sub_1000315F4();
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "Unknown analytics event: %@", v4, v5, v6, v7, v8);
}

void sub_10007647C(uint64_t a1)
{
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:a1];
  sub_1000315F4();
  sub_10000F4E8((void *)&_mh_execute_header, v2, v3, "Unsupported calendar unit type: %@", v4, v5, v6, v7, v8);
}

void sub_10007650C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100076544(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007657C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000765B4(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = *a1;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a2;
  sub_10000A778((void *)&_mh_execute_header, a2, a3, "failed to encode message, error: %d, contents: %@", v3, (void)v4, WORD4(v4));
}

void sub_100076630()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "message to encode is greater than maximum message size", v2, v3, v4, v5, v6);
}

void sub_100076664()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "exceeded max message buffer size!", v2, v3, v4, v5, v6);
}

void sub_100076698()
{
  sub_1000061AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "waiting on the rest of the header", v1, 2u);
}

void sub_1000766D8()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "incorrect header size", v2, v3, v4, v5, v6);
}

void sub_10007670C()
{
  sub_10000A760();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "have %lu bytes for message of size %u", v1, 0x12u);
}

void sub_100076784()
{
  sub_10000A760();
  sub_10000A778((void *)&_mh_execute_header, v0, v1, "buffer of size %lu bytes exceeded expected message size %u", v2, v3);
}

void sub_1000767EC(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to decode message: %d", (uint8_t *)v3, 8u);
}

void sub_100076868(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No WiFi device found; no WiFi until a device is attached.",
    v1,
    2u);
}

void sub_1000768AC()
{
  sub_10006AE40();
  sub_10000A778((void *)&_mh_execute_header, v0, v1, "failed to encode log archive request: %@, error: %d");
}

void sub_100076918()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to request log archive", v2, v3, v4, v5, v6);
}

void sub_10007694C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to request log archive, channel is not open", v2, v3, v4, v5, v6);
}

void sub_100076980()
{
  sub_10006AE40();
  sub_10000A778((void *)&_mh_execute_header, v0, v1, "failed to encode start statistics request: %@, error: %d");
}

void sub_1000769EC()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to request start statistics", v2, v3, v4, v5, v6);
}

void sub_100076A20()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to request start statistics, channel is not open", v2, v3, v4, v5, v6);
}

void sub_100076A54(void *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = *a1;
  *(_WORD *)&uint8_t v3[12] = 1024;
  *(_DWORD *)&v3[14] = *a2;
  sub_10000A778((void *)&_mh_execute_header, (uint64_t)a2, a3, "failed to parse file message: %@, error %d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_100076AD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100076B44()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "file receiver can't accept file requests", v2, v3, v4, v5, v6);
}

void sub_100076B78()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "file receiver can't receive file accepts", v2, v3, v4, v5, v6);
}

void sub_100076BAC()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no payload type in file header message: %@", v2, v3, v4, v5, v6);
}

void sub_100076C14()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no session ID in file message: %@", v2, v3, v4, v5, v6);
}

void sub_100076C7C()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no chunk count in file header message: %@", v2, v3, v4, v5, v6);
}

void sub_100076CE4()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no chunk data or chunk index in file payload message: %@", v2, v3, v4, v5, v6);
}

void sub_100076D4C()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no payload type in stream payload message: %@", v2, v3, v4, v5, v6);
}

void sub_100076DB4()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "no statistics dictionary in message: %@", v2, v3, v4, v5, v6);
}

void sub_100076E1C()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "payload type %@ is not a streaming payload type", v2, v3, v4, v5, v6);
}

void sub_100076E84()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no version in theme asset message", v2, v3, v4, v5, v6);
}

void sub_100076EB8()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "no URL to save the file", v2, v3, v4, v5, v6);
}

void sub_100076EEC()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "cannot receive theme asset, failed to setup %@", v2, v3, v4, v5, v6);
}

void sub_100076F54()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to determine URL to save the file", v2, v3, v4, v5, v6);
}

void sub_100076F88()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to create folder to save the log archive file", v2, v3, v4, v5, v6);
}

void sub_100076FBC()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to determine URL to save the log archive file", v2, v3, v4, v5, v6);
}

void sub_100076FF0()
{
  sub_10006AE40();
  sub_10000A778((void *)&_mh_execute_header, v0, v1, "failed to encode file accept message: %@ error: %d");
}

void sub_10007705C()
{
  sub_1000061AC();
  sub_10000E9C0((void *)&_mh_execute_header, v0, v1, "failed to send file accept message, channel is not open", v2, v3, v4, v5, v6);
}

void sub_100077090(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "updating BLE devices for discovery to: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10007710C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "already tracking all currently paired BLE devices for discovery", v1, 2u);
}

void sub_100077150(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "setup BLE CBDiscovery", v1, 2u);
}

void sub_100077194()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed to setup BLE CBDisccovery: %@", v2, v3, v4, v5, v6);
}

void sub_1000771FC()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "couldn't remove %{private, mask.hash}@, not a paired BT peripheral", v2, v3, v4, v5, v6);
}

void sub_100077264()
{
  sub_10006EC54();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "retrieved peripherals %@ for identifier %{private, mask.hash}@", v1, 0x20u);
}

void sub_1000772DC()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed to find vehicle for service: %@, may not be identified yet", v2, v3, v4, v5, v6);
}

void sub_100077344(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 141558531;
  *(void *)&void v3[4] = 1752392040;
  *(_WORD *)&uint8_t v3[12] = 2113;
  *(void *)&v3[14] = *a1;
  *(_WORD *)&v3[22] = 2112;
  sub_10006EC80((void *)&_mh_execute_header, a2, a3, "failed to start BLE pairing, couldn't connect to %{private, mask.hash}@, error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void sub_1000773D4()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "couldn't connect to %{private, mask.hash}@, not a known BT peripheral", v2, v3, v4, v5, v6);
}

void sub_10007743C()
{
  sub_10006EC54();
  sub_10006EC80((void *)&_mh_execute_header, v0, v1, "attempting to connect to %@ when already connected using service: %{private, mask.hash}@, resetting");
}

void sub_1000774A4()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed to connect to periperal to start CarPlay service: %@", v2, v3, v4, v5, v6);
}

void sub_10007750C()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "cannot get peripheral for discovered device: %{private, mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_100077574()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "discovered device not paired: %{private, mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_1000775DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007764C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000776BC()
{
  sub_10006036C();
  sub_1000344DC((void *)&_mh_execute_header, v0, v1, "couldn't find peripheral for paired peer %{private, mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_100077724(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 identifier];
  sub_10006036C();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "fail to BLE pair with %{private, mask.hash}@, error: %@", v6, 0x20u);
}

void sub_1000777D0(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 identifier];
  uint8_t v6 = [a2 pairingPeripheralIdentifier];
  int v7 = 141558787;
  uint64_t v8 = 1752392040;
  __int16 v9 = 2113;
  uint8_t v10 = v5;
  __int16 v11 = 2160;
  uint64_t v12 = 1752392040;
  __int16 v13 = 2113;
  uint64_t v14 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "peerDidFailToCompletePairing %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", (uint8_t *)&v7, 0x2Au);
}

void sub_1000778B0()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "incorrect pairing type: %li", v2, v3, v4, v5, v6);
}

void sub_100077918()
{
  sub_1000315F4();
  sub_10001835C((void *)&_mh_execute_header, v0, v1, "failed to confirm pairing: %@", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return _AudioServicesPlaySystemSoundWithOptions();
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceAddressToString()
{
  return _BTDeviceAddressToString();
}

uint64_t BTDeviceConnectServices()
{
  return _BTDeviceConnectServices();
}

uint64_t BTDeviceFromAddress()
{
  return _BTDeviceFromAddress();
}

uint64_t BTDeviceGetAddressString()
{
  return _BTDeviceGetAddressString();
}

uint64_t BTDeviceGetConnectedServices()
{
  return _BTDeviceGetConnectedServices();
}

uint64_t BTLocalDeviceGetAddressString()
{
  return _BTLocalDeviceGetAddressString();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTPairingAgentCancelPairing()
{
  return _BTPairingAgentCancelPairing();
}

uint64_t BTPairingAgentClearOOBDataForDevice()
{
  return _BTPairingAgentClearOOBDataForDevice();
}

uint64_t BTPairingAgentCreate()
{
  return _BTPairingAgentCreate();
}

uint64_t BTPairingAgentDestroy()
{
  return _BTPairingAgentDestroy();
}

uint64_t BTPairingAgentGetLocalOOBData()
{
  return _BTPairingAgentGetLocalOOBData();
}

uint64_t BTPairingAgentSetOOBDataForDevice()
{
  return _BTPairingAgentSetOOBDataForDevice();
}

uint64_t BTPairingAgentStop()
{
  return _BTPairingAgentStop();
}

uint64_t BTServiceAddCallbacks()
{
  return _BTServiceAddCallbacks();
}

uint64_t BTServiceRemoveCallbacks()
{
  return _BTServiceRemoveCallbacks();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t CARStringFromVoiceTriggerMode()
{
  return _CARStringFromVoiceTriggerMode();
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

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CLGetAccessoryTypeBitSet()
{
  return _CLGetAccessoryTypeBitSet();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

uint64_t CRAutomaticDNDLocationBundle()
{
  return _CRAutomaticDNDLocationBundle();
}

uint64_t CRAutomaticDNDLocationServicesEnabled()
{
  return _CRAutomaticDNDLocationServicesEnabled();
}

uint64_t CRCarPlayFeaturesAllFerriteFeatures()
{
  return _CRCarPlayFeaturesAllFerriteFeatures();
}

uint64_t CRCarPlayFeaturesAsAirPlayFeatures()
{
  return _CRCarPlayFeaturesAsAirPlayFeatures();
}

uint64_t CRCarPlayFeaturesName()
{
  return _CRCarPlayFeaturesName();
}

uint64_t CRCarPlayNavigationOwnerClientInterface()
{
  return _CRCarPlayNavigationOwnerClientInterface();
}

uint64_t CRCarPlayNavigationOwnersServiceInterface()
{
  return _CRCarPlayNavigationOwnersServiceInterface();
}

uint64_t CRDeviceSupportsAutomaticDNDMotionTrigger()
{
  return _CRDeviceSupportsAutomaticDNDMotionTrigger();
}

uint64_t CRDeviceSupportsDNDWhileDriving()
{
  return _CRDeviceSupportsDNDWhileDriving();
}

uint64_t CREdgeInsetsFromRect()
{
  return _CREdgeInsetsFromRect();
}

uint64_t CRFormattedBuildAndDeviceIdentifier()
{
  return _CRFormattedBuildAndDeviceIdentifier();
}

uint64_t CRFrameworkBundle()
{
  return _CRFrameworkBundle();
}

uint64_t CRIsInternalInstall()
{
  return _CRIsInternalInstall();
}

uint64_t CRIsTestContext()
{
  return _CRIsTestContext();
}

uint64_t CRLocalizedStringForKey()
{
  return _CRLocalizedStringForKey();
}

uint64_t CRLocalizedWiFiVariantKeyForKey()
{
  return _CRLocalizedWiFiVariantKeyForKey();
}

uint64_t CRRectRHDFlip()
{
  return _CRRectRHDFlip();
}

uint64_t CRStringForDate()
{
  return _CRStringForDate();
}

uint64_t CRURLEncodedString()
{
  return _CRURLEncodedString();
}

uint64_t CarCertificationOverrideLogging()
{
  return _CarCertificationOverrideLogging();
}

uint64_t CarConnectionTimeLogging()
{
  return _CarConnectionTimeLogging();
}

uint64_t CarDNDWDLogging()
{
  return _CarDNDWDLogging();
}

uint64_t CarDiagnosticsLogging()
{
  return _CarDiagnosticsLogging();
}

uint64_t CarGeneralLogging()
{
  return _CarGeneralLogging();
}

uint64_t CarPairingLogging()
{
  return _CarPairingLogging();
}

uint64_t CarSilentModeLogging()
{
  return _CarSilentModeLogging();
}

uint64_t CarThemeAssetsLogging()
{
  return _CarThemeAssetsLogging();
}

uint64_t DNDModeSemanticTypeToString()
{
  return _DNDModeSemanticTypeToString();
}

uint64_t FigEndpointCopyActiveCarPlayEndpoint()
{
  return _FigEndpointCopyActiveCarPlayEndpoint();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return _FigEndpointGetCMBaseObject();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MobileWiFiContainsRadio()
{
  return _MobileWiFiContainsRadio();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRect NSRectFromString(NSString *aString)
{
  return _NSRectFromString(aString);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return _NSStringFromSize(aSize);
}

uint64_t OPACKDecodeData()
{
  return _OPACKDecodeData();
}

uint64_t OPACKEncoderCreateData()
{
  return _OPACKEncoderCreateData();
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

uint64_t WiFiDeviceClientGetPower()
{
  return _WiFiDeviceClientGetPower();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return _WiFiDeviceClientRegisterPowerCallback();
}

uint64_t WiFiManagerClientAddNetwork()
{
  return _WiFiManagerClientAddNetwork();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return _WiFiManagerClientCopyNetworks();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return _WiFiManagerClientRegisterDeviceAttachmentCallback();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return _WiFiManagerClientRegisterServerRestartCallback();
}

uint64_t WiFiManagerClientRemoveNetworkWithReason()
{
  return _WiFiManagerClientRemoveNetworkWithReason();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientSetInCarState()
{
  return _WiFiManagerClientSetInCarState();
}

uint64_t WiFiManagerClientSetPower()
{
  return _WiFiManagerClientSetPower();
}

uint64_t WiFiManagerClientUpdateNetwork()
{
  return _WiFiManagerClientUpdateNetwork();
}

uint64_t WiFiNetworkCopyPassword()
{
  return _WiFiNetworkCopyPassword();
}

uint64_t WiFiNetworkCreate()
{
  return _WiFiNetworkCreate();
}

uint64_t WiFiNetworkGetChannel()
{
  return _WiFiNetworkGetChannel();
}

uint64_t WiFiNetworkGetProperty()
{
  return _WiFiNetworkGetProperty();
}

uint64_t WiFiNetworkGetSSID()
{
  return _WiFiNetworkGetSSID();
}

uint64_t WiFiNetworkGetType()
{
  return _WiFiNetworkGetType();
}

uint64_t WiFiNetworkIsCarPlay()
{
  return _WiFiNetworkIsCarPlay();
}

uint64_t WiFiNetworkRemovePassword()
{
  return _WiFiNetworkRemovePassword();
}

uint64_t WiFiNetworkSetPasswordSyncable()
{
  return _WiFiNetworkSetPasswordSyncable();
}

uint64_t WiFiNetworkSetProperty()
{
  return _WiFiNetworkSetProperty();
}

uint64_t WiFiNetworkSetSAE()
{
  return _WiFiNetworkSetSAE();
}

uint64_t WiFiNetworkSetWPA()
{
  return _WiFiNetworkSetWPA();
}

uint64_t WiFiNetworkSupportsWPA2()
{
  return _WiFiNetworkSupportsWPA2();
}

uint64_t WiFiNetworkSupportsWPA3()
{
  return _WiFiNetworkSupportsWPA3();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_buffered_read_size()
{
  return _lockdown_get_buffered_read_size();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_get_description()
{
  return _os_transaction_get_description();
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

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_cancel()
{
  return _xpc_remote_connection_cancel();
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

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_BTPowerMessagingVehicle(void *a1, const char *a2, ...)
{
  return [a1 BTPowerMessagingVehicle];
}

id objc_msgSend_BTPowerStoredVehicle(void *a1, const char *a2, ...)
{
  return [a1 BTPowerStoredVehicle];
}

id objc_msgSend_CARDNDQueue(void *a1, const char *a2, ...)
{
  return [a1 CARDNDQueue];
}

id objc_msgSend_ComputedMode(void *a1, const char *a2, ...)
{
  return [a1 ComputedMode];
}

id objc_msgSend_DSLPublisher(void *a1, const char *a2, ...)
{
  return [a1 DSLPublisher];
}

id objc_msgSend_DoNotDisturbWhileDriving(void *a1, const char *a2, ...)
{
  return [a1 DoNotDisturbWhileDriving];
}

id objc_msgSend_MFiCertificateSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 MFiCertificateSerialNumber];
}

id objc_msgSend_PPID(void *a1, const char *a2, ...)
{
  return [a1 PPID];
}

id objc_msgSend_PSM(void *a1, const char *a2, ...)
{
  return [a1 PSM];
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return [a1 SDKVersion];
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return [a1 SSID];
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

id objc_msgSend_UserFocus(void *a1, const char *a2, ...)
{
  return [a1 UserFocus];
}

id objc_msgSend__CARConnectionServiceInterface(void *a1, const char *a2, ...)
{
  return [a1 _CARConnectionServiceInterface];
}

id objc_msgSend__DNDServiceInterface(void *a1, const char *a2, ...)
{
  return [a1 _DNDServiceInterface];
}

id objc_msgSend__INFOResponseURL(void *a1, const char *a2, ...)
{
  return [a1 _INFOResponseURL];
}

id objc_msgSend__accessorySupportsLocationDeadReckoning(void *a1, const char *a2, ...)
{
  return [a1 _accessorySupportsLocationDeadReckoning];
}

id objc_msgSend__alertContents(void *a1, const char *a2, ...)
{
  return [a1 _alertContents];
}

id objc_msgSend__allPreferencesPairings(void *a1, const char *a2, ...)
{
  return [a1 _allPreferencesPairings];
}

id objc_msgSend__allUnpairedVehicleStorage(void *a1, const char *a2, ...)
{
  return [a1 _allUnpairedVehicleStorage];
}

id objc_msgSend__assetArchiveURL(void *a1, const char *a2, ...)
{
  return [a1 _assetArchiveURL];
}

id objc_msgSend__beginIdleExitTransaction(void *a1, const char *a2, ...)
{
  return [a1 _beginIdleExitTransaction];
}

id objc_msgSend__cancelUserDisabledTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelUserDisabledTimer];
}

id objc_msgSend__carKeyInfo(void *a1, const char *a2, ...)
{
  return [a1 _carKeyInfo];
}

id objc_msgSend__carPlayLogsFolderURL(void *a1, const char *a2, ...)
{
  return [a1 _carPlayLogsFolderURL];
}

id objc_msgSend__checkVehicleState(void *a1, const char *a2, ...)
{
  return [a1 _checkVehicleState];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__cleanupACCTransport(void *a1, const char *a2, ...)
{
  return [a1 _cleanupACCTransport];
}

id objc_msgSend__cleanupAssetProgress(void *a1, const char *a2, ...)
{
  return [a1 _cleanupAssetProgress];
}

id objc_msgSend__closeFile(void *a1, const char *a2, ...)
{
  return [a1 _closeFile];
}

id objc_msgSend__closeXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 _closeXPCConnection];
}

id objc_msgSend__createGeofencesAroundHomeAndWork(void *a1, const char *a2, ...)
{
  return [a1 _createGeofencesAroundHomeAndWork];
}

id objc_msgSend__currentSiriAccount(void *a1, const char *a2, ...)
{
  return [a1 _currentSiriAccount];
}

id objc_msgSend__currentlyConnectedVehicleSupportsMixableAudio(void *a1, const char *a2, ...)
{
  return [a1 _currentlyConnectedVehicleSupportsMixableAudio];
}

id objc_msgSend__denylistPreference(void *a1, const char *a2, ...)
{
  return [a1 _denylistPreference];
}

id objc_msgSend__detachObservers(void *a1, const char *a2, ...)
{
  return [a1 _detachObservers];
}

id objc_msgSend__disableDNDUntilEndOfDrive(void *a1, const char *a2, ...)
{
  return [a1 _disableDNDUntilEndOfDrive];
}

id objc_msgSend__discoverService(void *a1, const char *a2, ...)
{
  return [a1 _discoverService];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__dismissApprovalAlerts(void *a1, const char *a2, ...)
{
  return [a1 _dismissApprovalAlerts];
}

id objc_msgSend__dismissEnhancedIntegrationAlerts(void *a1, const char *a2, ...)
{
  return [a1 _dismissEnhancedIntegrationAlerts];
}

id objc_msgSend__dismissPairingAlerts(void *a1, const char *a2, ...)
{
  return [a1 _dismissPairingAlerts];
}

id objc_msgSend__drivingModeEnded(void *a1, const char *a2, ...)
{
  return [a1 _drivingModeEnded];
}

id objc_msgSend__endIdleExitTransaction(void *a1, const char *a2, ...)
{
  return [a1 _endIdleExitTransaction];
}

id objc_msgSend__finishIfPossible(void *a1, const char *a2, ...)
{
  return [a1 _finishIfPossible];
}

id objc_msgSend__finishedCurrentPairing(void *a1, const char *a2, ...)
{
  return [a1 _finishedCurrentPairing];
}

id objc_msgSend__handleAssetProgressFinished(void *a1, const char *a2, ...)
{
  return [a1 _handleAssetProgressFinished];
}

id objc_msgSend__handleChannelOpened(void *a1, const char *a2, ...)
{
  return [a1 _handleChannelOpened];
}

id objc_msgSend__handleConfigurationUpdated(void *a1, const char *a2, ...)
{
  return [a1 _handleConfigurationUpdated];
}

id objc_msgSend__handleReads(void *a1, const char *a2, ...)
{
  return [a1 _handleReads];
}

id objc_msgSend__hasDrivingActivityMode(void *a1, const char *a2, ...)
{
  return [a1 _hasDrivingActivityMode];
}

id objc_msgSend__hasExistingBluetoothPairing(void *a1, const char *a2, ...)
{
  return [a1 _hasExistingBluetoothPairing];
}

id objc_msgSend__incrementOutOfBandPairingDeclineCount(void *a1, const char *a2, ...)
{
  return [a1 _incrementOutOfBandPairingDeclineCount];
}

id objc_msgSend__intendedServiceMask(void *a1, const char *a2, ...)
{
  return [a1 _intendedServiceMask];
}

id objc_msgSend__internalText(void *a1, const char *a2, ...)
{
  return [a1 _internalText];
}

id objc_msgSend__invalidateCachedVehicles(void *a1, const char *a2, ...)
{
  return [a1 _invalidateCachedVehicles];
}

id objc_msgSend__isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return [a1 _isDeviceUnlocked];
}

id objc_msgSend__isMessagingBluetoothConnected(void *a1, const char *a2, ...)
{
  return [a1 _isMessagingBluetoothConnected];
}

id objc_msgSend__itemClassKeychainAttributes(void *a1, const char *a2, ...)
{
  return [a1 _itemClassKeychainAttributes];
}

id objc_msgSend__keychainItemAttributesForAllVehicles(void *a1, const char *a2, ...)
{
  return [a1 _keychainItemAttributesForAllVehicles];
}

id objc_msgSend__migrateToDrivingActivityModeIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _migrateToDrivingActivityModeIfNeeded];
}

id objc_msgSend__needsBluetoothTurnedOn(void *a1, const char *a2, ...)
{
  return [a1 _needsBluetoothTurnedOn];
}

id objc_msgSend__needsWiFiTurnedOn(void *a1, const char *a2, ...)
{
  return [a1 _needsWiFiTurnedOn];
}

id objc_msgSend__nextNightModeChangeDate(void *a1, const char *a2, ...)
{
  return [a1 _nextNightModeChangeDate];
}

id objc_msgSend__openFile(void *a1, const char *a2, ...)
{
  return [a1 _openFile];
}

id objc_msgSend__outOfBandPairingDeclineCount(void *a1, const char *a2, ...)
{
  return [a1 _outOfBandPairingDeclineCount];
}

id objc_msgSend__pairedBLEIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _pairedBLEIdentifiers];
}

id objc_msgSend__performVibrate(void *a1, const char *a2, ...)
{
  return [a1 _performVibrate];
}

id objc_msgSend__postNotificationForGeofence(void *a1, const char *a2, ...)
{
  return [a1 _postNotificationForGeofence];
}

id objc_msgSend__powerStateDidChange(void *a1, const char *a2, ...)
{
  return [a1 _powerStateDidChange];
}

id objc_msgSend__presentWaitingPrompt(void *a1, const char *a2, ...)
{
  return [a1 _presentWaitingPrompt];
}

id objc_msgSend__queryForUpdatedAsset(void *a1, const char *a2, ...)
{
  return [a1 _queryForUpdatedAsset];
}

id objc_msgSend__requestAssetCatalogDownload(void *a1, const char *a2, ...)
{
  return [a1 _requestAssetCatalogDownload];
}

id objc_msgSend__scheduleVehicleQuery(void *a1, const char *a2, ...)
{
  return [a1 _scheduleVehicleQuery];
}

id objc_msgSend__setupACCTransportClient(void *a1, const char *a2, ...)
{
  return [a1 _setupACCTransportClient];
}

id objc_msgSend__setupXPCEventHandler(void *a1, const char *a2, ...)
{
  return [a1 _setupXPCEventHandler];
}

id objc_msgSend__shouldCreateGeofences(void *a1, const char *a2, ...)
{
  return [a1 _shouldCreateGeofences];
}

id objc_msgSend__shouldScheduleTimerForNextNightModeChange(void *a1, const char *a2, ...)
{
  return [a1 _shouldScheduleTimerForNextNightModeChange];
}

id objc_msgSend__start(void *a1, const char *a2, ...)
{
  return [a1 _start];
}

id objc_msgSend__startListeners(void *a1, const char *a2, ...)
{
  return [a1 _startListeners];
}

id objc_msgSend__startWaitingOnMessagingVehicleTimer(void *a1, const char *a2, ...)
{
  return [a1 _startWaitingOnMessagingVehicleTimer];
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return [a1 _stop];
}

id objc_msgSend__stopWaitingOnMessagingVehicleTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopWaitingOnMessagingVehicleTimer];
}

id objc_msgSend__supportedCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 _supportedCompatibilityVersion];
}

id objc_msgSend__supportsCarKeys(void *a1, const char *a2, ...)
{
  return [a1 _supportsCarKeys];
}

id objc_msgSend__supportsEnhancedIntegration(void *a1, const char *a2, ...)
{
  return [a1 _supportsEnhancedIntegration];
}

id objc_msgSend__supportsOutOfBandPairing(void *a1, const char *a2, ...)
{
  return [a1 _supportsOutOfBandPairing];
}

id objc_msgSend__supportsThemeAssets(void *a1, const char *a2, ...)
{
  return [a1 _supportsThemeAssets];
}

id objc_msgSend__supportsUSB(void *a1, const char *a2, ...)
{
  return [a1 _supportsUSB];
}

id objc_msgSend__updateDiscoverer(void *a1, const char *a2, ...)
{
  return [a1 _updateDiscoverer];
}

id objc_msgSend__updateNightMode(void *a1, const char *a2, ...)
{
  return [a1 _updateNightMode];
}

id objc_msgSend__updateUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 _updateUnlockedSinceBoot];
}

id objc_msgSend__updateWiFiDevice(void *a1, const char *a2, ...)
{
  return [a1 _updateWiFiDevice];
}

id objc_msgSend__usbSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 _usbSerialNumber];
}

id objc_msgSend_accNavProvider(void *a1, const char *a2, ...)
{
  return [a1 accNavProvider];
}

id objc_msgSend_accessoryAdditionsData(void *a1, const char *a2, ...)
{
  return [a1 accessoryAdditionsData];
}

id objc_msgSend_accessoryContentVersion(void *a1, const char *a2, ...)
{
  return [a1 accessoryContentVersion];
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return [a1 accessoryManager];
}

id objc_msgSend_accessoryProtocols(void *a1, const char *a2, ...)
{
  return [a1 accessoryProtocols];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return [a1 actionHandler];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_actionPendingPowerOn(void *a1, const char *a2, ...)
{
  return [a1 actionPendingPowerOn];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activatedByUserAction(void *a1, const char *a2, ...)
{
  return [a1 activatedByUserAction];
}

id objc_msgSend_activeAssertions(void *a1, const char *a2, ...)
{
  return [a1 activeAssertions];
}

id objc_msgSend_activeAssertionsDebugString(void *a1, const char *a2, ...)
{
  return [a1 activeAssertionsDebugString];
}

id objc_msgSend_activeBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activeBundleIdentifier];
}

id objc_msgSend_activeChannel(void *a1, const char *a2, ...)
{
  return [a1 activeChannel];
}

id objc_msgSend_activeComponents(void *a1, const char *a2, ...)
{
  return [a1 activeComponents];
}

id objc_msgSend_activeMessagesForDatas(void *a1, const char *a2, ...)
{
  return [a1 activeMessagesForDatas];
}

id objc_msgSend_activeModeConfiguration(void *a1, const char *a2, ...)
{
  return [a1 activeModeConfiguration];
}

id objc_msgSend_activeModeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activeModeIdentifier];
}

id objc_msgSend_activePeripheral(void *a1, const char *a2, ...)
{
  return [a1 activePeripheral];
}

id objc_msgSend_activelyMonitoringGeofences(void *a1, const char *a2, ...)
{
  return [a1 activelyMonitoringGeofences];
}

id objc_msgSend_additionalDescription(void *a1, const char *a2, ...)
{
  return [a1 additionalDescription];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_albumArtUserPreference(void *a1, const char *a2, ...)
{
  return [a1 albumArtUserPreference];
}

id objc_msgSend_alertAcceptButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 alertAcceptButtonTitle];
}

id objc_msgSend_alertAutoDismissed(void *a1, const char *a2, ...)
{
  return [a1 alertAutoDismissed];
}

id objc_msgSend_alertDeclineButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 alertDeclineButtonTitle];
}

id objc_msgSend_alertDismissTimer(void *a1, const char *a2, ...)
{
  return [a1 alertDismissTimer];
}

id objc_msgSend_alertDismissal(void *a1, const char *a2, ...)
{
  return [a1 alertDismissal];
}

id objc_msgSend_alertManager(void *a1, const char *a2, ...)
{
  return [a1 alertManager];
}

id objc_msgSend_alertMessage(void *a1, const char *a2, ...)
{
  return [a1 alertMessage];
}

id objc_msgSend_alertOtherButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 alertOtherButtonTitle];
}

id objc_msgSend_alertTitle(void *a1, const char *a2, ...)
{
  return [a1 alertTitle];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allStoredVehicles(void *a1, const char *a2, ...)
{
  return [a1 allStoredVehicles];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowAutomaticConnectionDurationTTR(void *a1, const char *a2, ...)
{
  return [a1 allowAutomaticConnectionDurationTTR];
}

id objc_msgSend_allowInCar(void *a1, const char *a2, ...)
{
  return [a1 allowInCar];
}

id objc_msgSend_allowSessionDurationRecordingEvents(void *a1, const char *a2, ...)
{
  return [a1 allowSessionDurationRecordingEvents];
}

id objc_msgSend_allowUnlimitedConnectionEvents(void *a1, const char *a2, ...)
{
  return [a1 allowUnlimitedConnectionEvents];
}

id objc_msgSend_almanac(void *a1, const char *a2, ...)
{
  return [a1 almanac];
}

id objc_msgSend_analyticsDescription(void *a1, const char *a2, ...)
{
  return [a1 analyticsDescription];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appearanceModePreference(void *a1, const char *a2, ...)
{
  return [a1 appearanceModePreference];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return [a1 asDictionary];
}

id objc_msgSend_assertionTrap(void *a1, const char *a2, ...)
{
  return [a1 assertionTrap];
}

id objc_msgSend_assetArchiveWriter(void *a1, const char *a2, ...)
{
  return [a1 assetArchiveWriter];
}

id objc_msgSend_assetDescription(void *a1, const char *a2, ...)
{
  return [a1 assetDescription];
}

id objc_msgSend_assetDownloader(void *a1, const char *a2, ...)
{
  return [a1 assetDownloader];
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifier];
}

id objc_msgSend_assetProgress(void *a1, const char *a2, ...)
{
  return [a1 assetProgress];
}

id objc_msgSend_assetProgressForVehicleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 assetProgressForVehicleIdentifiers];
}

id objc_msgSend_assetQueryInProgress(void *a1, const char *a2, ...)
{
  return [a1 assetQueryInProgress];
}

id objc_msgSend_assetQueue(void *a1, const char *a2, ...)
{
  return [a1 assetQueue];
}

id objc_msgSend_assetRequests(void *a1, const char *a2, ...)
{
  return [a1 assetRequests];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return [a1 assetURL];
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return [a1 assetVersion];
}

id objc_msgSend_assetsArchiveURL(void *a1, const char *a2, ...)
{
  return [a1 assetsArchiveURL];
}

id objc_msgSend_attachmentURLs(void *a1, const char *a2, ...)
{
  return [a1 attachmentURLs];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_authenticationSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 authenticationSerialNumber];
}

id objc_msgSend_automaticDNDTriggeringMethod(void *a1, const char *a2, ...)
{
  return [a1 automaticDNDTriggeringMethod];
}

id objc_msgSend_availableData(void *a1, const char *a2, ...)
{
  return [a1 availableData];
}

id objc_msgSend_baseFolderURL(void *a1, const char *a2, ...)
{
  return [a1 baseFolderURL];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return [a1 bluetoothAddress];
}

id objc_msgSend_bluetoothConfirmed(void *a1, const char *a2, ...)
{
  return [a1 bluetoothConfirmed];
}

id objc_msgSend_bluetoothConnectedHandler(void *a1, const char *a2, ...)
{
  return [a1 bluetoothConnectedHandler];
}

id objc_msgSend_bluetoothDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bluetoothDeviceIdentifier];
}

id objc_msgSend_bluetoothFailureReason(void *a1, const char *a2, ...)
{
  return [a1 bluetoothFailureReason];
}

id objc_msgSend_bluetoothManager(void *a1, const char *a2, ...)
{
  return [a1 bluetoothManager];
}

id objc_msgSend_boldTextPreference(void *a1, const char *a2, ...)
{
  return [a1 boldTextPreference];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedCarPlayAllowedChangeValue(void *a1, const char *a2, ...)
{
  return [a1 cachedCarPlayAllowedChangeValue];
}

id objc_msgSend_cachedVehicles(void *a1, const char *a2, ...)
{
  return [a1 cachedVehicles];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadSync];
}

id objc_msgSend_cancelRequests(void *a1, const char *a2, ...)
{
  return [a1 cancelRequests];
}

id objc_msgSend_capabilitiesIdentifier(void *a1, const char *a2, ...)
{
  return [a1 capabilitiesIdentifier];
}

id objc_msgSend_carCapabilities(void *a1, const char *a2, ...)
{
  return [a1 carCapabilities];
}

id objc_msgSend_carCapabilitiesURL(void *a1, const char *a2, ...)
{
  return [a1 carCapabilitiesURL];
}

id objc_msgSend_carKeyPairingResult(void *a1, const char *a2, ...)
{
  return [a1 carKeyPairingResult];
}

id objc_msgSend_carPlayPreferences(void *a1, const char *a2, ...)
{
  return [a1 carPlayPreferences];
}

id objc_msgSend_carPlaySimulatorActive(void *a1, const char *a2, ...)
{
  return [a1 carPlaySimulatorActive];
}

id objc_msgSend_carplayWiFiUUID(void *a1, const char *a2, ...)
{
  return [a1 carplayWiFiUUID];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centralManager(void *a1, const char *a2, ...)
{
  return [a1 centralManager];
}

id objc_msgSend_certificateData(void *a1, const char *a2, ...)
{
  return [a1 certificateData];
}

id objc_msgSend_certificateSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 certificateSerialNumber];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_channelDelegate(void *a1, const char *a2, ...)
{
  return [a1 channelDelegate];
}

id objc_msgSend_channelIsOpen(void *a1, const char *a2, ...)
{
  return [a1 channelIsOpen];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return [a1 characteristics];
}

id objc_msgSend_chunkCount(void *a1, const char *a2, ...)
{
  return [a1 chunkCount];
}

id objc_msgSend_chunkQueue(void *a1, const char *a2, ...)
{
  return [a1 chunkQueue];
}

id objc_msgSend_chunkQueueSendSlots(void *a1, const char *a2, ...)
{
  return [a1 chunkQueueSendSlots];
}

id objc_msgSend_closeChannel(void *a1, const char *a2, ...)
{
  return [a1 closeChannel];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_clusterAssetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clusterAssetIdentifier];
}

id objc_msgSend_clusterAssetURL(void *a1, const char *a2, ...)
{
  return [a1 clusterAssetURL];
}

id objc_msgSend_clusterAssetVersion(void *a1, const char *a2, ...)
{
  return [a1 clusterAssetVersion];
}

id objc_msgSend_clusterAssetiOSContentVersion(void *a1, const char *a2, ...)
{
  return [a1 clusterAssetiOSContentVersion];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_colorFilterIntensityPreference(void *a1, const char *a2, ...)
{
  return [a1 colorFilterIntensityPreference];
}

id objc_msgSend_colorFilterPreference(void *a1, const char *a2, ...)
{
  return [a1 colorFilterPreference];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_connectedBluetoothAddresses(void *a1, const char *a2, ...)
{
  return [a1 connectedBluetoothAddresses];
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return [a1 connectedDevices];
}

id objc_msgSend_connectedServicesCount(void *a1, const char *a2, ...)
{
  return [a1 connectedServicesCount];
}

id objc_msgSend_connectedVehicleAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedVehicleAccessories];
}

id objc_msgSend_connectedVehicles(void *a1, const char *a2, ...)
{
  return [a1 connectedVehicles];
}

id objc_msgSend_connectingDevices(void *a1, const char *a2, ...)
{
  return [a1 connectingDevices];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionTimeServiceAgent(void *a1, const char *a2, ...)
{
  return [a1 connectionTimeServiceAgent];
}

id objc_msgSend_connectionTimer(void *a1, const char *a2, ...)
{
  return [a1 connectionTimer];
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return [a1 connectionUUID];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_connectionsQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionsQueue];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreAccessoriesEndpointUUID(void *a1, const char *a2, ...)
{
  return [a1 coreAccessoriesEndpointUUID];
}

id objc_msgSend_coreAccessoriesManager(void *a1, const char *a2, ...)
{
  return [a1 coreAccessoriesManager];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentAcceptCompletion(void *a1, const char *a2, ...)
{
  return [a1 currentAcceptCompletion];
}

id objc_msgSend_currentBluetoothConfirmationHandler(void *a1, const char *a2, ...)
{
  return [a1 currentBluetoothConfirmationHandler];
}

id objc_msgSend_currentBluetoothPairingCompletion(void *a1, const char *a2, ...)
{
  return [a1 currentBluetoothPairingCompletion];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentChunkIndex(void *a1, const char *a2, ...)
{
  return [a1 currentChunkIndex];
}

id objc_msgSend_currentCompletion(void *a1, const char *a2, ...)
{
  return [a1 currentCompletion];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentConnectionCompletion(void *a1, const char *a2, ...)
{
  return [a1 currentConnectionCompletion];
}

id objc_msgSend_currentConnectionState(void *a1, const char *a2, ...)
{
  return [a1 currentConnectionState];
}

id objc_msgSend_currentDiagnosticsData(void *a1, const char *a2, ...)
{
  return [a1 currentDiagnosticsData];
}

id objc_msgSend_currentErrorHandler(void *a1, const char *a2, ...)
{
  return [a1 currentErrorHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return [a1 currentLocation];
}

id objc_msgSend_currentLoggingFileReceiver(void *a1, const char *a2, ...)
{
  return [a1 currentLoggingFileReceiver];
}

id objc_msgSend_currentPairingSession(void *a1, const char *a2, ...)
{
  return [a1 currentPairingSession];
}

id objc_msgSend_currentPresenterSession(void *a1, const char *a2, ...)
{
  return [a1 currentPresenterSession];
}

id objc_msgSend_currentPromptFlowController(void *a1, const char *a2, ...)
{
  return [a1 currentPromptFlowController];
}

id objc_msgSend_currentPromptSession(void *a1, const char *a2, ...)
{
  return [a1 currentPromptSession];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_currentSessionTransferStatus(void *a1, const char *a2, ...)
{
  return [a1 currentSessionTransferStatus];
}

id objc_msgSend_currentStep(void *a1, const char *a2, ...)
{
  return [a1 currentStep];
}

id objc_msgSend_currentlyInRegion(void *a1, const char *a2, ...)
{
  return [a1 currentlyInRegion];
}

id objc_msgSend_dashboardRoundedCorners(void *a1, const char *a2, ...)
{
  return [a1 dashboardRoundedCorners];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_declineType(void *a1, const char *a2, ...)
{
  return [a1 declineType];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 defaultUserInterfaceStyle];
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return [a1 defaultValue];
}

id objc_msgSend_delayedTasks(void *a1, const char *a2, ...)
{
  return [a1 delayedTasks];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionForAvailableInteractionModels(void *a1, const char *a2, ...)
{
  return [a1 descriptionForAvailableInteractionModels];
}

id objc_msgSend_descriptionForLimitableUserInterfaces(void *a1, const char *a2, ...)
{
  return [a1 descriptionForLimitableUserInterfaces];
}

id objc_msgSend_descriptionForPrimaryInteractionModel(void *a1, const char *a2, ...)
{
  return [a1 descriptionForPrimaryInteractionModel];
}

id objc_msgSend_descriptionForTransportType(void *a1, const char *a2, ...)
{
  return [a1 descriptionForTransportType];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_deviceId(void *a1, const char *a2, ...)
{
  return [a1 deviceId];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_deviceSupportedCarPlayFeatures(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportedCarPlayFeatures];
}

id objc_msgSend_diagnosticsSerialQueue(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsSerialQueue];
}

id objc_msgSend_dictationAvailable(void *a1, const char *a2, ...)
{
  return [a1 dictationAvailable];
}

id objc_msgSend_dictationConnection(void *a1, const char *a2, ...)
{
  return [a1 dictationConnection];
}

id objc_msgSend_dictationEnabled(void *a1, const char *a2, ...)
{
  return [a1 dictationEnabled];
}

id objc_msgSend_dictationEnabledInKeyboardSettings(void *a1, const char *a2, ...)
{
  return [a1 dictationEnabledInKeyboardSettings];
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 dictationIsEnabled];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didCreateGeofenceAroundStart(void *a1, const char *a2, ...)
{
  return [a1 didCreateGeofenceAroundStart];
}

id objc_msgSend_digitalCarKeyInformation(void *a1, const char *a2, ...)
{
  return [a1 digitalCarKeyInformation];
}

id objc_msgSend_disableTimerTimestamp(void *a1, const char *a2, ...)
{
  return [a1 disableTimerTimestamp];
}

id objc_msgSend_disabledFeature(void *a1, const char *a2, ...)
{
  return [a1 disabledFeature];
}

id objc_msgSend_disabledFeaturesPreference(void *a1, const char *a2, ...)
{
  return [a1 disabledFeaturesPreference];
}

id objc_msgSend_discoveredPSMCharacteristic(void *a1, const char *a2, ...)
{
  return [a1 discoveredPSMCharacteristic];
}

id objc_msgSend_discoveredService(void *a1, const char *a2, ...)
{
  return [a1 discoveredService];
}

id objc_msgSend_dismissAlert(void *a1, const char *a2, ...)
{
  return [a1 dismissAlert];
}

id objc_msgSend_dismissHandler(void *a1, const char *a2, ...)
{
  return [a1 dismissHandler];
}

id objc_msgSend_dismissOnUnlock(void *a1, const char *a2, ...)
{
  return [a1 dismissOnUnlock];
}

id objc_msgSend_dismissPromptPresenter(void *a1, const char *a2, ...)
{
  return [a1 dismissPromptPresenter];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayThemeData(void *a1, const char *a2, ...)
{
  return [a1 displayThemeData];
}

id objc_msgSend_displaysTransitionControl(void *a1, const char *a2, ...)
{
  return [a1 displaysTransitionControl];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadObserver(void *a1, const char *a2, ...)
{
  return [a1 downloadObserver];
}

id objc_msgSend_driveStartTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 driveStartTimeInterval];
}

id objc_msgSend_drivingStream(void *a1, const char *a2, ...)
{
  return [a1 drivingStream];
}

id objc_msgSend_electronicTollCollectionAvailable(void *a1, const char *a2, ...)
{
  return [a1 electronicTollCollectionAvailable];
}

id objc_msgSend_endpointIdentifier(void *a1, const char *a2, ...)
{
  return [a1 endpointIdentifier];
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return [a1 endpointUUID];
}

id objc_msgSend_enhancedIntegrationStatus(void *a1, const char *a2, ...)
{
  return [a1 enhancedIntegrationStatus];
}

id objc_msgSend_enterState(void *a1, const char *a2, ...)
{
  return [a1 enterState];
}

id objc_msgSend_eraseConnectionData(void *a1, const char *a2, ...)
{
  return [a1 eraseConnectionData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_eventDate(void *a1, const char *a2, ...)
{
  return [a1 eventDate];
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return [a1 eventName];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_exitConfirmationOverride(void *a1, const char *a2, ...)
{
  return [a1 exitConfirmationOverride];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_featuresAvailabilityAgent(void *a1, const char *a2, ...)
{
  return [a1 featuresAvailabilityAgent];
}

id objc_msgSend_fetchCarCapabilities(void *a1, const char *a2, ...)
{
  return [a1 fetchCarCapabilities];
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return [a1 fileHandle];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReading];
}

id objc_msgSend_fileQueue(void *a1, const char *a2, ...)
{
  return [a1 fileQueue];
}

id objc_msgSend_fileReceiver(void *a1, const char *a2, ...)
{
  return [a1 fileReceiver];
}

id objc_msgSend_fileSenderSession(void *a1, const char *a2, ...)
{
  return [a1 fileSenderSession];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_finishedWelcome(void *a1, const char *a2, ...)
{
  return [a1 finishedWelcome];
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevision];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_focusModeDescription(void *a1, const char *a2, ...)
{
  return [a1 focusModeDescription];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_geofencingObserver(void *a1, const char *a2, ...)
{
  return [a1 geofencingObserver];
}

id objc_msgSend_getCarPlaySilentModePreference(void *a1, const char *a2, ...)
{
  return [a1 getCarPlaySilentModePreference];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_handleAnyMessagingConnectionsToVehicles(void *a1, const char *a2, ...)
{
  return [a1 handleAnyMessagingConnectionsToVehicles];
}

id objc_msgSend_handleAvailabilityEvent(void *a1, const char *a2, ...)
{
  return [a1 handleAvailabilityEvent];
}

id objc_msgSend_handleCarKeyInitiatedPairingFailed(void *a1, const char *a2, ...)
{
  return [a1 handleCarKeyInitiatedPairingFailed];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return [a1 hardwareRevision];
}

id objc_msgSend_hasAccessory(void *a1, const char *a2, ...)
{
  return [a1 hasAccessory];
}

id objc_msgSend_hasAdjustedTriggerMethod(void *a1, const char *a2, ...)
{
  return [a1 hasAdjustedTriggerMethod];
}

id objc_msgSend_hasAllChunks(void *a1, const char *a2, ...)
{
  return [a1 hasAllChunks];
}

id objc_msgSend_hasGaugeClusterScreen(void *a1, const char *a2, ...)
{
  return [a1 hasGaugeClusterScreen];
}

id objc_msgSend_hasMigratedToDriving(void *a1, const char *a2, ...)
{
  return [a1 hasMigratedToDriving];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headUnitPairingDelegate(void *a1, const char *a2, ...)
{
  return [a1 headUnitPairingDelegate];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_iOSContentVersion(void *a1, const char *a2, ...)
{
  return [a1 iOSContentVersion];
}

id objc_msgSend_iconImagePath(void *a1, const char *a2, ...)
{
  return [a1 iconImagePath];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiersToDiscover(void *a1, const char *a2, ...)
{
  return [a1 identifiersToDiscover];
}

id objc_msgSend_idleExitTransaction(void *a1, const char *a2, ...)
{
  return [a1 idleExitTransaction];
}

id objc_msgSend_illegalCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 illegalCharacterSet];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_infoResponse(void *a1, const char *a2, ...)
{
  return [a1 infoResponse];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialTimerLocation(void *a1, const char *a2, ...)
{
  return [a1 initialTimerLocation];
}

id objc_msgSend_initializeStateMachine(void *a1, const char *a2, ...)
{
  return [a1 initializeStateMachine];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return [a1 inputStream];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_interfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 interfaceStyle];
}

id objc_msgSend_internalNotes(void *a1, const char *a2, ...)
{
  return [a1 internalNotes];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_internalQueueOutstandingSendCount(void *a1, const char *a2, ...)
{
  return [a1 internalQueueOutstandingSendCount];
}

id objc_msgSend_internalSettingsState(void *a1, const char *a2, ...)
{
  return [a1 internalSettingsState];
}

id objc_msgSend_internalSettingsValue(void *a1, const char *a2, ...)
{
  return [a1 internalSettingsValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference];
}

id objc_msgSend_isAutomaticDNDInternalForceOverrideEnabledPreference(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticDNDInternalForceOverrideEnabledPreference];
}

id objc_msgSend_isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference];
}

id objc_msgSend_isAutomaticDNDInternalShowUserAlertsEnabledPreference(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticDNDInternalShowUserAlertsEnabledPreference];
}

id objc_msgSend_isCAFToolTreeCompletionCalled(void *a1, const char *a2, ...)
{
  return [a1 isCAFToolTreeCompletionCalled];
}

id objc_msgSend_isCCCHeadUnitPairingOverrideEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCCCHeadUnitPairingOverrideEnabled];
}

id objc_msgSend_isCarPlayAllowed(void *a1, const char *a2, ...)
{
  return [a1 isCarPlayAllowed];
}

id objc_msgSend_isCarPlaySetupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCarPlaySetupEnabled];
}

id objc_msgSend_isCarPlayThemeSupportEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCarPlayThemeSupportEnabled];
}

id objc_msgSend_isConnectedToSystem(void *a1, const char *a2, ...)
{
  return [a1 isConnectedToSystem];
}

id objc_msgSend_isCurrentlyDriving(void *a1, const char *a2, ...)
{
  return [a1 isCurrentlyDriving];
}

id objc_msgSend_isCurrentlyInGeofencedRegion(void *a1, const char *a2, ...)
{
  return [a1 isCurrentlyInGeofencedRegion];
}

id objc_msgSend_isCurrentlyInsideGeofence(void *a1, const char *a2, ...)
{
  return [a1 isCurrentlyInsideGeofence];
}

id objc_msgSend_isDNDActive(void *a1, const char *a2, ...)
{
  return [a1 isDNDActive];
}

id objc_msgSend_isDNDValid(void *a1, const char *a2, ...)
{
  return [a1 isDNDValid];
}

id objc_msgSend_isDayLight(void *a1, const char *a2, ...)
{
  return [a1 isDayLight];
}

id objc_msgSend_isDeviceSilentModeOn(void *a1, const char *a2, ...)
{
  return [a1 isDeviceSilentModeOn];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isInAirplaneMode(void *a1, const char *a2, ...)
{
  return [a1 isInAirplaneMode];
}

id objc_msgSend_isInLostMode(void *a1, const char *a2, ...)
{
  return [a1 isInLostMode];
}

id objc_msgSend_isManagedLostModeActive(void *a1, const char *a2, ...)
{
  return [a1 isManagedLostModeActive];
}

id objc_msgSend_isMapsActive(void *a1, const char *a2, ...)
{
  return [a1 isMapsActive];
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return [a1 isOpen];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPairingAvailable(void *a1, const char *a2, ...)
{
  return [a1 isPairingAvailable];
}

id objc_msgSend_isPowered(void *a1, const char *a2, ...)
{
  return [a1 isPowered];
}

id objc_msgSend_isPriority(void *a1, const char *a2, ...)
{
  return [a1 isPriority];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return [a1 isReady];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isSiriBargeInDisabled(void *a1, const char *a2, ...)
{
  return [a1 isSiriBargeInDisabled];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVehicleDataSession(void *a1, const char *a2, ...)
{
  return [a1 isVehicleDataSession];
}

id objc_msgSend_isVehicleStoreAvailable(void *a1, const char *a2, ...)
{
  return [a1 isVehicleStoreAvailable];
}

id objc_msgSend_keyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 keyIdentifier];
}

id objc_msgSend_lastConfiguration(void *a1, const char *a2, ...)
{
  return [a1 lastConfiguration];
}

id objc_msgSend_lastConnectedDate(void *a1, const char *a2, ...)
{
  return [a1 lastConnectedDate];
}

id objc_msgSend_lastFetchDate(void *a1, const char *a2, ...)
{
  return [a1 lastFetchDate];
}

id objc_msgSend_lastKnownReportTime(void *a1, const char *a2, ...)
{
  return [a1 lastKnownReportTime];
}

id objc_msgSend_lastKnownVehicularHints(void *a1, const char *a2, ...)
{
  return [a1 lastKnownVehicularHints];
}

id objc_msgSend_lastKnownVehicularState(void *a1, const char *a2, ...)
{
  return [a1 lastKnownVehicularState];
}

id objc_msgSend_lastLookupIdentifer(void *a1, const char *a2, ...)
{
  return [a1 lastLookupIdentifer];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSession(void *a1, const char *a2, ...)
{
  return [a1 lastSession];
}

id objc_msgSend_lastStartSessionDeviceID(void *a1, const char *a2, ...)
{
  return [a1 lastStartSessionDeviceID];
}

id objc_msgSend_latestInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 latestInterfaceStyle];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return [a1 launch];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryAgent(void *a1, const char *a2, ...)
{
  return [a1 libraryAgent];
}

id objc_msgSend_limitUserInterfaces(void *a1, const char *a2, ...)
{
  return [a1 limitUserInterfaces];
}

id objc_msgSend_localOOBDataHandler(void *a1, const char *a2, ...)
{
  return [a1 localOOBDataHandler];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationDescription(void *a1, const char *a2, ...)
{
  return [a1 locationDescription];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_locationOfInterest(void *a1, const char *a2, ...)
{
  return [a1 locationOfInterest];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServicesEnabled];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockdownQueue(void *a1, const char *a2, ...)
{
  return [a1 lockdownQueue];
}

id objc_msgSend_lockdownSource(void *a1, const char *a2, ...)
{
  return [a1 lockdownSource];
}

id objc_msgSend_lockscreenAlert(void *a1, const char *a2, ...)
{
  return [a1 lockscreenAlert];
}

id objc_msgSend_lockscreenMessage(void *a1, const char *a2, ...)
{
  return [a1 lockscreenMessage];
}

id objc_msgSend_lockscreenTitle(void *a1, const char *a2, ...)
{
  return [a1 lockscreenTitle];
}

id objc_msgSend_logArchiveReceiver(void *a1, const char *a2, ...)
{
  return [a1 logArchiveReceiver];
}

id objc_msgSend_logArchiveWritersForSessionIDs(void *a1, const char *a2, ...)
{
  return [a1 logArchiveWritersForSessionIDs];
}

id objc_msgSend_loggingChannelManager(void *a1, const char *a2, ...)
{
  return [a1 loggingChannelManager];
}

id objc_msgSend_loggingFileReceiver(void *a1, const char *a2, ...)
{
  return [a1 loggingFileReceiver];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_lookupCompletionHandlers(void *a1, const char *a2, ...)
{
  return [a1 lookupCompletionHandlers];
}

id objc_msgSend_lostModeIsActive(void *a1, const char *a2, ...)
{
  return [a1 lostModeIsActive];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return [a1 manufacturer];
}

id objc_msgSend_manufacturerIconLabel(void *a1, const char *a2, ...)
{
  return [a1 manufacturerIconLabel];
}

id objc_msgSend_manufacturerIconVisible(void *a1, const char *a2, ...)
{
  return [a1 manufacturerIconVisible];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return [a1 manufacturerName];
}

id objc_msgSend_mapsAppearancePreference(void *a1, const char *a2, ...)
{
  return [a1 mapsAppearancePreference];
}

id objc_msgSend_maxFramesPerSecond(void *a1, const char *a2, ...)
{
  return [a1 maxFramesPerSecond];
}

id objc_msgSend_maximumCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 maximumCompatibilityVersion];
}

id objc_msgSend_maximumConcurrentNavigationOwners(void *a1, const char *a2, ...)
{
  return [a1 maximumConcurrentNavigationOwners];
}

id objc_msgSend_maximumSDKVersion(void *a1, const char *a2, ...)
{
  return [a1 maximumSDKVersion];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageClassesForIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 messageClassesForIdentifiers];
}

id objc_msgSend_messageReceiver(void *a1, const char *a2, ...)
{
  return [a1 messageReceiver];
}

id objc_msgSend_messagingConnector(void *a1, const char *a2, ...)
{
  return [a1 messagingConnector];
}

id objc_msgSend_messagingVehicle(void *a1, const char *a2, ...)
{
  return [a1 messagingVehicle];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modeIdentifier];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return [a1 modelName];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_monitoredRegions(void *a1, const char *a2, ...)
{
  return [a1 monitoredRegions];
}

id objc_msgSend_monitoringService(void *a1, const char *a2, ...)
{
  return [a1 monitoringService];
}

id objc_msgSend_mostRecentTriggerMethodChange(void *a1, const char *a2, ...)
{
  return [a1 mostRecentTriggerMethodChange];
}

id objc_msgSend_mostRecentVehicleConnection(void *a1, const char *a2, ...)
{
  return [a1 mostRecentVehicleConnection];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_muteStatus(void *a1, const char *a2, ...)
{
  return [a1 muteStatus];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationOwner(void *a1, const char *a2, ...)
{
  return [a1 navigationOwner];
}

id objc_msgSend_nextMetadataKey(void *a1, const char *a2, ...)
{
  return [a1 nextMetadataKey];
}

id objc_msgSend_nextNightModeChangeTimer(void *a1, const char *a2, ...)
{
  return [a1 nextNightModeChangeTimer];
}

id objc_msgSend_nextSessionOverrideAirPlayFeatureStrings(void *a1, const char *a2, ...)
{
  return [a1 nextSessionOverrideAirPlayFeatureStrings];
}

id objc_msgSend_nextSunrise(void *a1, const char *a2, ...)
{
  return [a1 nextSunrise];
}

id objc_msgSend_nextSunset(void *a1, const char *a2, ...)
{
  return [a1 nextSunset];
}

id objc_msgSend_nightMode(void *a1, const char *a2, ...)
{
  return [a1 nightMode];
}

id objc_msgSend_nightModeSupported(void *a1, const char *a2, ...)
{
  return [a1 nightModeSupported];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationCategory(void *a1, const char *a2, ...)
{
  return [a1 notificationCategory];
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return [a1 notificationCenter];
}

id objc_msgSend_notificationRequest(void *a1, const char *a2, ...)
{
  return [a1 notificationRequest];
}

id objc_msgSend_notifydEventName(void *a1, const char *a2, ...)
{
  return [a1 notifydEventName];
}

id objc_msgSend_nowPlayingAlbumArt(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingAlbumArt];
}

id objc_msgSend_nowPlayingAlbumArtMode(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingAlbumArtMode];
}

id objc_msgSend_numericCode(void *a1, const char *a2, ...)
{
  return [a1 numericCode];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_observesVehicularReports(void *a1, const char *a2, ...)
{
  return [a1 observesVehicularReports];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_openChannel(void *a1, const char *a2, ...)
{
  return [a1 openChannel];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return [a1 outputStream];
}

id objc_msgSend_outstandingApprovalAlerts(void *a1, const char *a2, ...)
{
  return [a1 outstandingApprovalAlerts];
}

id objc_msgSend_outstandingEnableWiFiAlerts(void *a1, const char *a2, ...)
{
  return [a1 outstandingEnableWiFiAlerts];
}

id objc_msgSend_outstandingEnhancedIntegrationAlerts(void *a1, const char *a2, ...)
{
  return [a1 outstandingEnhancedIntegrationAlerts];
}

id objc_msgSend_outstandingPairingAlerts(void *a1, const char *a2, ...)
{
  return [a1 outstandingPairingAlerts];
}

id objc_msgSend_owners(void *a1, const char *a2, ...)
{
  return [a1 owners];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_pairedVehiclesConnectedOnBluetooth(void *a1, const char *a2, ...)
{
  return [a1 pairedVehiclesConnectedOnBluetooth];
}

id objc_msgSend_pairingAccepted(void *a1, const char *a2, ...)
{
  return [a1 pairingAccepted];
}

id objc_msgSend_pairingDelegate(void *a1, const char *a2, ...)
{
  return [a1 pairingDelegate];
}

id objc_msgSend_pairingPeripheralIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pairingPeripheralIdentifier];
}

id objc_msgSend_pairingPeripheralName(void *a1, const char *a2, ...)
{
  return [a1 pairingPeripheralName];
}

id objc_msgSend_pairingPromptCompletion(void *a1, const char *a2, ...)
{
  return [a1 pairingPromptCompletion];
}

id objc_msgSend_pairingStatus(void *a1, const char *a2, ...)
{
  return [a1 pairingStatus];
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return [a1 passphrase];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_pendingDrafts(void *a1, const char *a2, ...)
{
  return [a1 pendingDrafts];
}

id objc_msgSend_performDoneCaptureResult(void *a1, const char *a2, ...)
{
  return [a1 performDoneCaptureResult];
}

id objc_msgSend_performEnterReadyState(void *a1, const char *a2, ...)
{
  return [a1 performEnterReadyState];
}

id objc_msgSend_performPostResponseAndReleaseData(void *a1, const char *a2, ...)
{
  return [a1 performPostResponseAndReleaseData];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return [a1 peripheral];
}

id objc_msgSend_persistCapabilitiesToGlobalDomain(void *a1, const char *a2, ...)
{
  return [a1 persistCapabilitiesToGlobalDomain];
}

id objc_msgSend_persistCarCapabilitiesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 persistCarCapabilitiesIfNeeded];
}

id objc_msgSend_persisted(void *a1, const char *a2, ...)
{
  return [a1 persisted];
}

id objc_msgSend_physicalSize(void *a1, const char *a2, ...)
{
  return [a1 physicalSize];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return [a1 pipe];
}

id objc_msgSend_pixelSize(void *a1, const char *a2, ...)
{
  return [a1 pixelSize];
}

id objc_msgSend_plistMessenger(void *a1, const char *a2, ...)
{
  return [a1 plistMessenger];
}

id objc_msgSend_plistURL(void *a1, const char *a2, ...)
{
  return [a1 plistURL];
}

id objc_msgSend_plistVersion(void *a1, const char *a2, ...)
{
  return [a1 plistVersion];
}

id objc_msgSend_popFirstObject(void *a1, const char *a2, ...)
{
  return [a1 popFirstObject];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_postPairingsDidChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 postPairingsDidChangeNotification];
}

id objc_msgSend_powered(void *a1, const char *a2, ...)
{
  return [a1 powered];
}

id objc_msgSend_ppid(void *a1, const char *a2, ...)
{
  return [a1 ppid];
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return [a1 preferences];
}

id objc_msgSend_preferencesManager(void *a1, const char *a2, ...)
{
  return [a1 preferencesManager];
}

id objc_msgSend_presentedBulletins(void *a1, const char *a2, ...)
{
  return [a1 presentedBulletins];
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return [a1 presenter];
}

id objc_msgSend_previousWallpaperIdentifier(void *a1, const char *a2, ...)
{
  return [a1 previousWallpaperIdentifier];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processTransaction(void *a1, const char *a2, ...)
{
  return [a1 processTransaction];
}

id objc_msgSend_processingTimer(void *a1, const char *a2, ...)
{
  return [a1 processingTimer];
}

id objc_msgSend_progressPromptCompletion(void *a1, const char *a2, ...)
{
  return [a1 progressPromptCompletion];
}

id objc_msgSend_promptDelegate(void *a1, const char *a2, ...)
{
  return [a1 promptDelegate];
}

id objc_msgSend_promptResponseHandler(void *a1, const char *a2, ...)
{
  return [a1 promptResponseHandler];
}

id objc_msgSend_psmCharacteristicUUID(void *a1, const char *a2, ...)
{
  return [a1 psmCharacteristicUUID];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return [a1 publicKey];
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return [a1 purgeSync];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_radarDescription(void *a1, const char *a2, ...)
{
  return [a1 radarDescription];
}

id objc_msgSend_receiveBuffer(void *a1, const char *a2, ...)
{
  return [a1 receiveBuffer];
}

id objc_msgSend_receiveQueue(void *a1, const char *a2, ...)
{
  return [a1 receiveQueue];
}

id objc_msgSend_reconcileCapabilities(void *a1, const char *a2, ...)
{
  return [a1 reconcileCapabilities];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_regionState(void *a1, const char *a2, ...)
{
  return [a1 regionState];
}

id objc_msgSend_registerForAvailabilityEvent(void *a1, const char *a2, ...)
{
  return [a1 registerForAvailabilityEvent];
}

id objc_msgSend_releaseAllAssertions(void *a1, const char *a2, ...)
{
  return [a1 releaseAllAssertions];
}

id objc_msgSend_releaseAllTemporaryAssertions(void *a1, const char *a2, ...)
{
  return [a1 releaseAllTemporaryAssertions];
}

id objc_msgSend_releaseTurnByTurnOwnership(void *a1, const char *a2, ...)
{
  return [a1 releaseTurnByTurnOwnership];
}

id objc_msgSend_remoteAlert(void *a1, const char *a2, ...)
{
  return [a1 remoteAlert];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remoteProgressCompletion(void *a1, const char *a2, ...)
{
  return [a1 remoteProgressCompletion];
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return [a1 removeAllDeliveredNotifications];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeSpaceAfter(void *a1, const char *a2, ...)
{
  return [a1 removeSpaceAfter];
}

id objc_msgSend_removeSpaceBefore(void *a1, const char *a2, ...)
{
  return [a1 removeSpaceBefore];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestCarCapabilitiesUpdate(void *a1, const char *a2, ...)
{
  return [a1 requestCarCapabilitiesUpdate];
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return [a1 requestLocation];
}

id objc_msgSend_requestLogArchive(void *a1, const char *a2, ...)
{
  return [a1 requestLogArchive];
}

id objc_msgSend_requestTurnByTurnOwnership(void *a1, const char *a2, ...)
{
  return [a1 requestTurnByTurnOwnership];
}

id objc_msgSend_requestWiFiCredentials(void *a1, const char *a2, ...)
{
  return [a1 requestWiFiCredentials];
}

id objc_msgSend_requiresBonjour(void *a1, const char *a2, ...)
{
  return [a1 requiresBonjour];
}

id objc_msgSend_requiresUnlockedDevice(void *a1, const char *a2, ...)
{
  return [a1 requiresUnlockedDevice];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetActiveComponents(void *a1, const char *a2, ...)
{
  return [a1 resetActiveComponents];
}

id objc_msgSend_responseBlock(void *a1, const char *a2, ...)
{
  return [a1 responseBlock];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightHandDrive(void *a1, const char *a2, ...)
{
  return [a1 rightHandDrive];
}

id objc_msgSend_routineManager(void *a1, const char *a2, ...)
{
  return [a1 routineManager];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_rxpcConnection(void *a1, const char *a2, ...)
{
  return [a1 rxpcConnection];
}

id objc_msgSend_rxpcListener(void *a1, const char *a2, ...)
{
  return [a1 rxpcListener];
}

id objc_msgSend_rxpcQueue(void *a1, const char *a2, ...)
{
  return [a1 rxpcQueue];
}

id objc_msgSend_safeFrame(void *a1, const char *a2, ...)
{
  return [a1 safeFrame];
}

id objc_msgSend_screenType(void *a1, const char *a2, ...)
{
  return [a1 screenType];
}

id objc_msgSend_screens(void *a1, const char *a2, ...)
{
  return [a1 screens];
}

id objc_msgSend_sdkVersion(void *a1, const char *a2, ...)
{
  return [a1 sdkVersion];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return [a1 securityType];
}

id objc_msgSend_semanticModeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 semanticModeIdentifier];
}

id objc_msgSend_semanticType(void *a1, const char *a2, ...)
{
  return [a1 semanticType];
}

id objc_msgSend_sendDeviceTransportIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 sendDeviceTransportIdentifiers];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceChannel(void *a1, const char *a2, ...)
{
  return [a1 serviceChannel];
}

id objc_msgSend_serviceConnector(void *a1, const char *a2, ...)
{
  return [a1 serviceConnector];
}

id objc_msgSend_serviceCountDuringAlertForBluetoothAddress(void *a1, const char *a2, ...)
{
  return [a1 serviceCountDuringAlertForBluetoothAddress];
}

id objc_msgSend_serviceDelegate(void *a1, const char *a2, ...)
{
  return [a1 serviceDelegate];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceUUID(void *a1, const char *a2, ...)
{
  return [a1 serviceUUID];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_servicesForBluetoothIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 servicesForBluetoothIdentifiers];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionDelegate(void *a1, const char *a2, ...)
{
  return [a1 sessionDelegate];
}

id objc_msgSend_sessionDetachHandler(void *a1, const char *a2, ...)
{
  return [a1 sessionDetachHandler];
}

id objc_msgSend_sessionQueue(void *a1, const char *a2, ...)
{
  return [a1 sessionQueue];
}

id objc_msgSend_sessionRequestClient(void *a1, const char *a2, ...)
{
  return [a1 sessionRequestClient];
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return [a1 sessionStatus];
}

id objc_msgSend_sessionUUIDString(void *a1, const char *a2, ...)
{
  return [a1 sessionUUIDString];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setupLauncher(void *a1, const char *a2, ...)
{
  return [a1 setupLauncher];
}

id objc_msgSend_setupObservers(void *a1, const char *a2, ...)
{
  return [a1 setupObservers];
}

id objc_msgSend_setupPromptDirector(void *a1, const char *a2, ...)
{
  return [a1 setupPromptDirector];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return [a1 sharedPairingAgent];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharingClient(void *a1, const char *a2, ...)
{
  return [a1 sharingClient];
}

id objc_msgSend_shouldActivateWithCarPlay(void *a1, const char *a2, ...)
{
  return [a1 shouldActivateWithCarPlay];
}

id objc_msgSend_shouldAlwaysAcceptCCCHeadUnitPairing(void *a1, const char *a2, ...)
{
  return [a1 shouldAlwaysAcceptCCCHeadUnitPairing];
}

id objc_msgSend_shouldCreateGeofenceAroundStart(void *a1, const char *a2, ...)
{
  return [a1 shouldCreateGeofenceAroundStart];
}

id objc_msgSend_shouldEnableBluetooth(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableBluetooth];
}

id objc_msgSend_shouldEnableWiFi(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableWiFi];
}

id objc_msgSend_shouldRecordAnalyticsEvents(void *a1, const char *a2, ...)
{
  return [a1 shouldRecordAnalyticsEvents];
}

id objc_msgSend_shouldResetToMuted(void *a1, const char *a2, ...)
{
  return [a1 shouldResetToMuted];
}

id objc_msgSend_shouldTriggerSysdiagnose(void *a1, const char *a2, ...)
{
  return [a1 shouldTriggerSysdiagnose];
}

id objc_msgSend_showBluetoothOnlyOption(void *a1, const char *a2, ...)
{
  return [a1 showBluetoothOnlyOption];
}

id objc_msgSend_showsInternalAlerts(void *a1, const char *a2, ...)
{
  return [a1 showsInternalAlerts];
}

id objc_msgSend_signatureData(void *a1, const char *a2, ...)
{
  return [a1 signatureData];
}

id objc_msgSend_siriAccount(void *a1, const char *a2, ...)
{
  return [a1 siriAccount];
}

id objc_msgSend_sortedConnectionEvents(void *a1, const char *a2, ...)
{
  return [a1 sortedConnectionEvents];
}

id objc_msgSend_soundRecognitionPreference(void *a1, const char *a2, ...)
{
  return [a1 soundRecognitionPreference];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceVersion(void *a1, const char *a2, ...)
{
  return [a1 sourceVersion];
}

id objc_msgSend_stagedClusterAssetURL(void *a1, const char *a2, ...)
{
  return [a1 stagedClusterAssetURL];
}

id objc_msgSend_stagedClusterAssetVersion(void *a1, const char *a2, ...)
{
  return [a1 stagedClusterAssetVersion];
}

id objc_msgSend_stagedClusterAssetiOSContentVersion(void *a1, const char *a2, ...)
{
  return [a1 stagedClusterAssetiOSContentVersion];
}

id objc_msgSend_standardOutput(void *a1, const char *a2, ...)
{
  return [a1 standardOutput];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAdvertisingCarPlayControlForUSB(void *a1, const char *a2, ...)
{
  return [a1 startAdvertisingCarPlayControlForUSB];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringSignificantLocationChanges];
}

id objc_msgSend_startTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 startTimeoutTimer];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_startedFromCarKey(void *a1, const char *a2, ...)
{
  return [a1 startedFromCarKey];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return [a1 starting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return [a1 stateMachine];
}

id objc_msgSend_statisticsReceiver(void *a1, const char *a2, ...)
{
  return [a1 statisticsReceiver];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopMonitoringLOIs(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringLOIs];
}

id objc_msgSend_stopMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringSignificantLocationChanges];
}

id objc_msgSend_stopRecording(void *a1, const char *a2, ...)
{
  return [a1 stopRecording];
}

id objc_msgSend_stopTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 stopTimeoutTimer];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_stopWaitingForConnection(void *a1, const char *a2, ...)
{
  return [a1 stopWaitingForConnection];
}

id objc_msgSend_storedVehicleProvider(void *a1, const char *a2, ...)
{
  return [a1 storedVehicleProvider];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return [a1 streamError];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return [a1 streamStatus];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_sunrise(void *a1, const char *a2, ...)
{
  return [a1 sunrise];
}

id objc_msgSend_sunset(void *a1, const char *a2, ...)
{
  return [a1 sunset];
}

id objc_msgSend_supportsACBack(void *a1, const char *a2, ...)
{
  return [a1 supportsACBack];
}

id objc_msgSend_supportsAccNav(void *a1, const char *a2, ...)
{
  return [a1 supportsAccNav];
}

id objc_msgSend_supportsBluetoothLE(void *a1, const char *a2, ...)
{
  return [a1 supportsBluetoothLE];
}

id objc_msgSend_supportsCarPlay(void *a1, const char *a2, ...)
{
  return [a1 supportsCarPlay];
}

id objc_msgSend_supportsCarPlayConnectionRequest(void *a1, const char *a2, ...)
{
  return [a1 supportsCarPlayConnectionRequest];
}

id objc_msgSend_supportsElectronicTollCollection(void *a1, const char *a2, ...)
{
  return [a1 supportsElectronicTollCollection];
}

id objc_msgSend_supportsEnhancedIntegration(void *a1, const char *a2, ...)
{
  return [a1 supportsEnhancedIntegration];
}

id objc_msgSend_supportsHighFidelityTouch(void *a1, const char *a2, ...)
{
  return [a1 supportsHighFidelityTouch];
}

id objc_msgSend_supportsLogTransfer(void *a1, const char *a2, ...)
{
  return [a1 supportsLogTransfer];
}

id objc_msgSend_supportsMixableAudio(void *a1, const char *a2, ...)
{
  return [a1 supportsMixableAudio];
}

id objc_msgSend_supportsSiriMixable(void *a1, const char *a2, ...)
{
  return [a1 supportsSiriMixable];
}

id objc_msgSend_supportsSiriZLL(void *a1, const char *a2, ...)
{
  return [a1 supportsSiriZLL];
}

id objc_msgSend_supportsSiriZLLButton(void *a1, const char *a2, ...)
{
  return [a1 supportsSiriZLLButton];
}

id objc_msgSend_supportsStartSessionRequest(void *a1, const char *a2, ...)
{
  return [a1 supportsStartSessionRequest];
}

id objc_msgSend_supportsThemeAssets(void *a1, const char *a2, ...)
{
  return [a1 supportsThemeAssets];
}

id objc_msgSend_supportsUSBCarPlay(void *a1, const char *a2, ...)
{
  return [a1 supportsUSBCarPlay];
}

id objc_msgSend_supportsVehicleData(void *a1, const char *a2, ...)
{
  return [a1 supportsVehicleData];
}

id objc_msgSend_supportsWiredBluetoothPairing(void *a1, const char *a2, ...)
{
  return [a1 supportsWiredBluetoothPairing];
}

id objc_msgSend_supportsWiredCarPlay(void *a1, const char *a2, ...)
{
  return [a1 supportsWiredCarPlay];
}

id objc_msgSend_supportsWiredToWirelessPairing(void *a1, const char *a2, ...)
{
  return [a1 supportsWiredToWirelessPairing];
}

id objc_msgSend_supportsWirelessCarPlay(void *a1, const char *a2, ...)
{
  return [a1 supportsWirelessCarPlay];
}

id objc_msgSend_syncSettings(void *a1, const char *a2, ...)
{
  return [a1 syncSettings];
}

id objc_msgSend_systemNightMode(void *a1, const char *a2, ...)
{
  return [a1 systemNightMode];
}

id objc_msgSend_tearDownObservers(void *a1, const char *a2, ...)
{
  return [a1 tearDownObservers];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_terminationReason(void *a1, const char *a2, ...)
{
  return [a1 terminationReason];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return [a1 terminationStatus];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_themeAssetReceiver(void *a1, const char *a2, ...)
{
  return [a1 themeAssetReceiver];
}

id objc_msgSend_themeAssetsAvailable(void *a1, const char *a2, ...)
{
  return [a1 themeAssetsAvailable];
}

id objc_msgSend_themeWritersForSessionIDs(void *a1, const char *a2, ...)
{
  return [a1 themeWritersForSessionIDs];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRange(void *a1, const char *a2, ...)
{
  return [a1 timeRange];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_transcription(void *a1, const char *a2, ...)
{
  return [a1 transcription];
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return [a1 transportType];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unpair(void *a1, const char *a2, ...)
{
  return [a1 unpair];
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

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateReason(void *a1, const char *a2, ...)
{
  return [a1 updateReason];
}

id objc_msgSend_updateSource(void *a1, const char *a2, ...)
{
  return [a1 updateSource];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_usbIdentifier(void *a1, const char *a2, ...)
{
  return [a1 usbIdentifier];
}

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return [a1 userDefaults];
}

id objc_msgSend_userDisableTimer(void *a1, const char *a2, ...)
{
  return [a1 userDisableTimer];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vehicle(void *a1, const char *a2, ...)
{
  return [a1 vehicle];
}

id objc_msgSend_vehicleAssetManager(void *a1, const char *a2, ...)
{
  return [a1 vehicleAssetManager];
}

id objc_msgSend_vehicleFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 vehicleFirmwareVersion];
}

id objc_msgSend_vehicleHardwareVersion(void *a1, const char *a2, ...)
{
  return [a1 vehicleHardwareVersion];
}

id objc_msgSend_vehicleInformation(void *a1, const char *a2, ...)
{
  return [a1 vehicleInformation];
}

id objc_msgSend_vehicleManufacturer(void *a1, const char *a2, ...)
{
  return [a1 vehicleManufacturer];
}

id objc_msgSend_vehicleModelName(void *a1, const char *a2, ...)
{
  return [a1 vehicleModelName];
}

id objc_msgSend_vehicleName(void *a1, const char *a2, ...)
{
  return [a1 vehicleName];
}

id objc_msgSend_vehicleOperatorState(void *a1, const char *a2, ...)
{
  return [a1 vehicleOperatorState];
}

id objc_msgSend_vehicleSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 vehicleSerialNumber];
}

id objc_msgSend_vehicleState(void *a1, const char *a2, ...)
{
  return [a1 vehicleState];
}

id objc_msgSend_vehicleStateCheckTimer(void *a1, const char *a2, ...)
{
  return [a1 vehicleStateCheckTimer];
}

id objc_msgSend_vehicleStateClass(void *a1, const char *a2, ...)
{
  return [a1 vehicleStateClass];
}

id objc_msgSend_vehicleStateDebugDescription(void *a1, const char *a2, ...)
{
  return [a1 vehicleStateDebugDescription];
}

id objc_msgSend_vehicleStore(void *a1, const char *a2, ...)
{
  return [a1 vehicleStore];
}

id objc_msgSend_vehicleSupportsDestinationSharing(void *a1, const char *a2, ...)
{
  return [a1 vehicleSupportsDestinationSharing];
}

id objc_msgSend_vehicleSupportsStartSession(void *a1, const char *a2, ...)
{
  return [a1 vehicleSupportsStartSession];
}

id objc_msgSend_vehiclesForBluetoothIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 vehiclesForBluetoothIdentifiers];
}

id objc_msgSend_vehicularHints(void *a1, const char *a2, ...)
{
  return [a1 vehicularHints];
}

id objc_msgSend_vehicularOperatorState(void *a1, const char *a2, ...)
{
  return [a1 vehicularOperatorState];
}

id objc_msgSend_vehicularState(void *a1, const char *a2, ...)
{
  return [a1 vehicularState];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_viewAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 viewAreaInsets];
}

id objc_msgSend_viewAreas(void *a1, const char *a2, ...)
{
  return [a1 viewAreas];
}

id objc_msgSend_visibleFrame(void *a1, const char *a2, ...)
{
  return [a1 visibleFrame];
}

id objc_msgSend_voiceControlPreference(void *a1, const char *a2, ...)
{
  return [a1 voiceControlPreference];
}

id objc_msgSend_voiceTriggerMode(void *a1, const char *a2, ...)
{
  return [a1 voiceTriggerMode];
}

id objc_msgSend_waitForSessionInitialization(void *a1, const char *a2, ...)
{
  return [a1 waitForSessionInitialization];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return [a1 waitUntilExit];
}

id objc_msgSend_waitingOnMessagingVehicleTimeout(void *a1, const char *a2, ...)
{
  return [a1 waitingOnMessagingVehicleTimeout];
}

id objc_msgSend_waitingOnMessagingVehicleTimer(void *a1, const char *a2, ...)
{
  return [a1 waitingOnMessagingVehicleTimer];
}

id objc_msgSend_waitingOnSession(void *a1, const char *a2, ...)
{
  return [a1 waitingOnSession];
}

id objc_msgSend_wallpaperDescription(void *a1, const char *a2, ...)
{
  return [a1 wallpaperDescription];
}

id objc_msgSend_wallpaperIdentifier(void *a1, const char *a2, ...)
{
  return [a1 wallpaperIdentifier];
}

id objc_msgSend_wasPairing(void *a1, const char *a2, ...)
{
  return [a1 wasPairing];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_wiFiManager(void *a1, const char *a2, ...)
{
  return [a1 wiFiManager];
}

id objc_msgSend_wifiChannel(void *a1, const char *a2, ...)
{
  return [a1 wifiChannel];
}

id objc_msgSend_wifiManager(void *a1, const char *a2, ...)
{
  return [a1 wifiManager];
}

id objc_msgSend_wiredAvailable(void *a1, const char *a2, ...)
{
  return [a1 wiredAvailable];
}

id objc_msgSend_wiredIPs(void *a1, const char *a2, ...)
{
  return [a1 wiredIPs];
}

id objc_msgSend_wiredSessionEnded(void *a1, const char *a2, ...)
{
  return [a1 wiredSessionEnded];
}

id objc_msgSend_wirelessAvailable(void *a1, const char *a2, ...)
{
  return [a1 wirelessAvailable];
}

id objc_msgSend_wirelessConnectionDurationTTRThreshold(void *a1, const char *a2, ...)
{
  return [a1 wirelessConnectionDurationTTRThreshold];
}

id objc_msgSend_wirelessIPs(void *a1, const char *a2, ...)
{
  return [a1 wirelessIPs];
}

id objc_msgSend_wirelessReconnectCancelled(void *a1, const char *a2, ...)
{
  return [a1 wirelessReconnectCancelled];
}

id objc_msgSend_wirelessReconnectEndDate(void *a1, const char *a2, ...)
{
  return [a1 wirelessReconnectEndDate];
}

id objc_msgSend_wirelessReconnectStartDate(void *a1, const char *a2, ...)
{
  return [a1 wirelessReconnectStartDate];
}

id objc_msgSend_wirelessReconnectStarted(void *a1, const char *a2, ...)
{
  return [a1 wirelessReconnectStarted];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_workerQueue(void *a1, const char *a2, ...)
{
  return [a1 workerQueue];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:x0 options:x1 error:x2];
}