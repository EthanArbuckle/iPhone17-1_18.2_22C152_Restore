void sub_1000029E4(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  uint64_t vars8;

  v1 = dispatch_queue_create("com.apple.Diagnostics.airpodsObservationQueue", 0);
  v2 = (void *)qword_10001C658;
  qword_10001C658 = (uint64_t)v1;

  v3 = qword_10001C658;

  +[BluetoothManager setSharedInstanceQueue:v3];
}

void sub_100002A3C(uint64_t a1)
{
  id v2 = +[BluetoothManager sharedInstance];
  [*(id *)(a1 + 32) setBtManager:v2];
}

void sub_100002B34(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) btManager];
  if (!v2
    || (v3 = (void *)v2,
        [*(id *)(a1 + 32) btManager],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 available],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    v6 = [*(id *)(a1 + 32) btManagerAvailableSemaphore];
    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v6, v7);
  }
  [*(id *)(a1 + 32) _ensureInitialDevicesFetched];
  [*(id *)(a1 + 32) _updateHandlers];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) devices];
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
}

id sub_100002D04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) copy];
  id v3 = objc_retainBlock(v2);
  v4 = [*(id *)(a1 + 32) handlers];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  unsigned __int8 v5 = *(void **)(a1 + 32);

  return [v5 _beginObserving];
}

void sub_100002E30(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handlers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) handlers];
  id v4 = [v3 count];

  if (!v4)
  {
    unsigned __int8 v5 = *(void **)(a1 + 32);
    [v5 _endObserving];
  }
}

void sub_1000036BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000038C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100003DD8(uint64_t a1)
{
  if (NSClassFromString(@"DADeviceLocal"))
  {
    uint64_t v2 = objc_opt_new();
  }
  else
  {
    id v3 = (void *)MGCopyAnswer();
    v6 = [[DADeviceRepresentation alloc] initWithSerialNumber:v3 isLocal:1 attributes:&__NSDictionary0__struct];

    uint64_t v2 = (uint64_t)v6;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = (id)v2;
  unsigned __int8 v5 = +[NSSet setWithObject:v2];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void sub_100004228(id a1)
{
  qword_10001C660 = objc_alloc_init(DANvramUtil);

  _objc_release_x1();
}

void sub_1000047FC(id a1)
{
  id v1 = +[NSError errorWithDomain:@"com.apple.DiagnosticsSessionAvailibility" code:0 userInfo:0];
  +[DSAnalytics sendAnalyticsWithEvent:3 error:v1];
}

void sub_100004870(id a1)
{
  id v1 = +[NSError errorWithDomain:@"com.apple.DiagnosticsSessionAvailibility" code:0 userInfo:0];
  +[DSAnalytics sendAnalyticsWithEvent:4 error:v1];
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v3, &stru_100014678);
  dispatch_activate(v3);
  uint64_t v4 = objc_opt_new();
  unsigned __int8 v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

void sub_100004A50(id a1)
{
  id v1 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Received SIGTERM, exiting the process", v2, 2u);
  }

  exit(0);
}

void sub_100004F00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fetchDevices];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100005050(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) copy];
  id v3 = objc_retainBlock(v2);
  uint64_t v4 = [*(id *)(a1 + 32) handlers];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  unsigned __int8 v5 = *(void **)(a1 + 32);

  return [v5 _beginObserving];
}

void sub_10000517C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handlers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) handlers];
  id v4 = [v3 count];

  if (!v4)
  {
    unsigned __int8 v5 = *(void **)(a1 + 32);
    [v5 _endObserving];
  }
}

void sub_100005640(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) devices];
  id v12 = [v2 copy];

  id v3 = [*(id *)(a1 + 32) _fetchDevices];
  id v4 = [*(id *)(a1 + 32) devices];
  id v5 = [v4 mutableCopy];

  [v5 minusSet:v3];
  id v6 = [v3 mutableCopy];
  id v7 = [*(id *)(a1 + 32) devices];
  [v6 minusSet:v7];

  uint64_t v8 = [*(id *)(a1 + 32) devices];
  [v8 minusSet:v5];

  id v9 = [*(id *)(a1 + 32) devices];
  [v9 unionSet:v6];

  v10 = [*(id *)(a1 + 32) devices];
  unsigned __int8 v11 = [v12 isEqual:v10];

  if ((v11 & 1) == 0) {
    [*(id *)(a1 + 32) _updateHandlers];
  }
}

void sub_100005B90(id a1)
{
  qword_10001C670 = +[NSSet setWithObjects:@"Accessory.SmartBatteryCase", 0];

  _objc_release_x1();
}

void sub_10000609C(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  qword_10001C680 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_100006620(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id sub_100006634(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100006660(uint64_t a1)
{
}

void sub_100006668(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v4 = DiagnosticLogHandleForCategory();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking for Enhanced Logging Session response", buf, 2u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000067DC;
      v8[3] = &unk_100014718;
      uint64_t v6 = *(void *)(a1 + 32);
      v8[4] = WeakRetained;
      v8[5] = v6;
      [WeakRetained checkEnhancedLoggingStateWithReply:v8];
      xpc_transaction_exit_clean();
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No reply completion is present in dispatch block for checkAvailabilityWithReply", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Lost reference to self when entering dispatch block for checkAvailabilityWithReply", buf, 2u);
    }
  }
}

void sub_1000067DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DiagnosticLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending ELSResponse %@ in reply to checkAvailabilityWithReply", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No ELS response. Getting session ID", (uint8_t *)&v8, 2u);
    }

    uint64_t v6 = [*(id *)(a1 + 32) getSessionID];
    uint64_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session ID is %@, sending in reply to checkAvailabilityWithReply", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  }
}

uint64_t sub_100006A40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006B4C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serialNumbers];
  id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[ASTIdentity identityWithSerialNumber:*(void *)(*((void *)&v18 + 1) + 8 * (void)v8)];
        [v3 addObject:v9];

        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking for sessions with identities %@", buf, 0xCu);
  }

  double v11 = *(double *)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006D94;
  v14[3] = &unk_100014790;
  id v15 = v4;
  uint64_t v12 = *(void *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  char v17 = *(unsigned char *)(a1 + 64);
  id v13 = v4;
  +[ASTSession sessionExistsForIdentities:v3 ticketNumber:v12 timeout:v14 completion:v11];
}

void sub_100006D94(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000C994(a1, (uint64_t)v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(unsigned __int8 *)(a1 + 48);
    v10[0] = 67109120;
    v10[1] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Complete with check for session... exitWhenDone: %d", (uint8_t *)v10, 8u);
  }

  if (*(unsigned char *)(a1 + 48)) {
    xpc_transaction_exit_clean();
  }
}

void sub_1000072AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1000072E0(uint64_t a1, int a2)
{
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "checkAvailabilityWithTicketNumber finished. Success: %d", (uint8_t *)v6, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000073EC(id a1)
{
  byte_10001C690 = os_variant_has_internal_content();
}

uint64_t sub_1000074C0(uint64_t a1, void *a2)
{
  [a2 status];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_1000077DC(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007874;
  v4[3] = &unk_100014850;
  id v5 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100007874(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 state];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [v12 state];
    uint64_t v6 = [v5 serialNumber];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      int v8 = [v12 state];
      int v9 = [v8 serialNumber];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_6;
      }
      double v11 = *(void **)(a1 + 32);
      id v4 = [v12 state];
      id v5 = [v4 serialNumber];
      [v11 addObject:v5];
    }
  }
LABEL_6:
}

void sub_100008894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100008958(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008A1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008AE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008BA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008C68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008D2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100008E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008F58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000901C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000090E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000096C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1000099C8(uint64_t a1)
{
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  CFStringRef v6 = @"info";
  uint64_t v7 = v3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v4 userInfo:v5];
}

void sub_10000A5F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A6BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A864(uint64_t a1)
{
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_nanoRegistryDevicePaired:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:"_nanoRegistryDeviceUnpaired:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
}

id sub_10000A910(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDevicesWithSerialNumber:0];
}

void sub_10000A9D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) _createDeviceWithNanoDevice:v3];
    if (v4)
    {
      id v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v6 = [v4 state];
        uint64_t v7 = [v6 serialNumber];
        int v9 = 138412290;
        v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Nano device connected", (uint8_t *)&v9, 0xCu);
      }
      int v8 = [*(id *)(a1 + 40) devices];
      [v8 addObject:v4];

      [*(id *)(a1 + 40) _updateHandlers];
    }
  }
}

void sub_10000ABD4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) _createDeviceWithNanoDevice:v3];
    if (v4)
    {
      id v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v6 = [v4 state];
        uint64_t v7 = [v6 serialNumber];
        int v9 = 138412290;
        v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Nano device disconnected", (uint8_t *)&v9, 0xCu);
      }
      int v8 = [*(id *)(a1 + 40) devices];
      [v8 removeObject:v4];

      [*(id *)(a1 + 40) _updateHandlers];
    }
  }
}

void sub_10000AEA0(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];
}

void sub_10000AF80(uint64_t a1)
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getPairedDevices];

  uint64_t v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
  CFStringRef v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];

  if ([v6 count])
  {
    uint64_t v7 = [v3 arrayByAddingObjectsFromArray:v6];

    id v3 = (void *)v7;
  }
  v25 = v6;
  int v8 = [*(id *)(a1 + 32) devices];
  int v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v8 count]);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(a1 + 32) _createDeviceWithNanoDevice:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        id v16 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          char v17 = [v15 state];
          long long v18 = [v17 serialNumber];
          *(_DWORD *)buf = 138412290;
          v31 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] Nano device connected", buf, 0xCu);
        }
        [v9 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v12);
  }

  long long v19 = [*(id *)(a1 + 32) devices];
  id v20 = [v19 mutableCopy];

  [v20 minusSet:v9];
  id v21 = [v9 mutableCopy];
  v22 = [*(id *)(a1 + 32) devices];
  [v21 minusSet:v22];

  v23 = [*(id *)(a1 + 32) devices];
  [v23 minusSet:v20];

  v24 = [*(id *)(a1 + 32) devices];
  [v24 unionSet:v21];

  [*(id *)(a1 + 32) _updateHandlers];
}

void sub_10000B6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000B6C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "New devices: %@", (uint8_t *)&v7, 0xCu);
  }

  [WeakRetained setDevices:v3];
  CFStringRef v6 = [WeakRetained delegate];
  [v6 observerDidChangeDevices:WeakRetained];
}

void sub_10000B934(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000B958(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDevices:v4];
  id v5 = [WeakRetained delegate];
  [v5 observerDidChangeDevices:WeakRetained];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000BF80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C0E0(uint64_t a1)
{
  uint64_t v2 = +[NSMutableSet set];
  id v3 = dispatch_group_create();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = a1;
  id v4 = [*(id *)(a1 + 32) observers];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v8);
        dispatch_group_enter(v3);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10000C2AC;
        v11[3] = &unk_100014878;
        id v12 = v2;
        uint64_t v13 = v3;
        [v9 oneshotWithHandler:v11];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void))(*(void *)(v10 + 40) + 16))();
}

void sub_10000C2AC(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = *(void **)(a1 + 32);
  id v5 = [v6 allObjects];
  [v4 addObjectsFromArray:v5];

  objc_sync_exit(v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000C340(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C81C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No serial numbers are present for paired airpods device %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000C894(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add Bluetooth device: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000C90C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decorate Airpods device with UI. Tests requiring UI will fail.", v1, 2u);
}

void sub_10000C950(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to find entitlement", v1, 2u);
}

void sub_10000C994(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Session does not exist for serial numbers: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return _BYSetupAssistantHasCompletedInitialRun();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void dispatch_activate(dispatch_object_t object)
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

void exit(int a1)
{
}

void free(void *a1)
{
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

uint64_t xpc_transaction_interrupt_clean_exit()
{
  return _xpc_transaction_interrupt_clean_exit();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__accessoryIdentifiersToPromote(void *a1, const char *a2, ...)
{
  return [a1 _accessoryIdentifiersToPromote];
}

id objc_msgSend__beginObserving(void *a1, const char *a2, ...)
{
  return [a1 _beginObserving];
}

id objc_msgSend__endObserving(void *a1, const char *a2, ...)
{
  return [a1 _endObserving];
}

id objc_msgSend__ensureInitialDevicesFetched(void *a1, const char *a2, ...)
{
  return [a1 _ensureInitialDevicesFetched];
}

id objc_msgSend__fetchDevices(void *a1, const char *a2, ...)
{
  return [a1 _fetchDevices];
}

id objc_msgSend__forceDiscoverAllDevices(void *a1, const char *a2, ...)
{
  return [a1 _forceDiscoverAllDevices];
}

id objc_msgSend__purgeUnpairedDevices(void *a1, const char *a2, ...)
{
  return [a1 _purgeUnpairedDevices];
}

id objc_msgSend__sendChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendChangeNotification];
}

id objc_msgSend__sendChangeNotificationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _sendChangeNotificationIfNeeded];
}

id objc_msgSend__updateDevices(void *a1, const char *a2, ...)
{
  return [a1 _updateDevices];
}

id objc_msgSend__updateHandlers(void *a1, const char *a2, ...)
{
  return [a1 _updateHandlers];
}

id objc_msgSend__waitUntilFirstResponse(void *a1, const char *a2, ...)
{
  return [a1 _waitUntilFirstResponse];
}

id objc_msgSend_acceptableValueClasses(void *a1, const char *a2, ...)
{
  return [a1 acceptableValueClasses];
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return [a1 accessoryInfo];
}

id objc_msgSend_accessoryObservationQueue(void *a1, const char *a2, ...)
{
  return [a1 accessoryObservationQueue];
}

id objc_msgSend_accessoryRegistrationQueue(void *a1, const char *a2, ...)
{
  return [a1 accessoryRegistrationQueue];
}

id objc_msgSend_airpodsDevice(void *a1, const char *a2, ...)
{
  return [a1 airpodsDevice];
}

id objc_msgSend_airpodsRegistrationQueue(void *a1, const char *a2, ...)
{
  return [a1 airpodsRegistrationQueue];
}

id objc_msgSend_allDevices(void *a1, const char *a2, ...)
{
  return [a1 allDevices];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowCellularSizeThreshold(void *a1, const char *a2, ...)
{
  return [a1 allowCellularSizeThreshold];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_btManager(void *a1, const char *a2, ...)
{
  return [a1 btManager];
}

id objc_msgSend_btManagerAvailableSemaphore(void *a1, const char *a2, ...)
{
  return [a1 btManagerAvailableSemaphore];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_clearNextBootCheckerBoardPersistent(void *a1, const char *a2, ...)
{
  return [a1 clearNextBootCheckerBoardPersistent];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultObserverClasses(void *a1, const char *a2, ...)
{
  return [a1 defaultObserverClasses];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
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

id objc_msgSend_firstResponseLock(void *a1, const char *a2, ...)
{
  return [a1 firstResponseLock];
}

id objc_msgSend_firstResponseSent(void *a1, const char *a2, ...)
{
  return [a1 firstResponseSent];
}

id objc_msgSend_fullscreenPromptsEnabled(void *a1, const char *a2, ...)
{
  return [a1 fullscreenPromptsEnabled];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_getSessionID(void *a1, const char *a2, ...)
{
  return [a1 getSessionID];
}

id objc_msgSend_handlers(void *a1, const char *a2, ...)
{
  return [a1 handlers];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_history(void *a1, const char *a2, ...)
{
  return [a1 history];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_information(void *a1, const char *a2, ...)
{
  return [a1 information];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialDevicesFetched(void *a1, const char *a2, ...)
{
  return [a1 initialDevicesFetched];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return [a1 isAppleAudioDevice];
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return [a1 isCheckerBoardActive];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return [a1 isTemporaryPaired];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
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

id objc_msgSend_nanoObservationQueue(void *a1, const char *a2, ...)
{
  return [a1 nanoObservationQueue];
}

id objc_msgSend_nanoRegistrationQueue(void *a1, const char *a2, ...)
{
  return [a1 nanoRegistrationQueue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return [a1 paired];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_pairedDevicesSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 pairedDevicesSelectorBlock];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return [a1 productId];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serialNumbers(void *a1, const char *a2, ...)
{
  return [a1 serialNumbers];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sessionSettings(void *a1, const char *a2, ...)
{
  return [a1 sessionSettings];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_skipped(void *a1, const char *a2, ...)
{
  return [a1 skipped];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
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

id objc_msgSend_supportedDeviceAllowList(void *a1, const char *a2, ...)
{
  return [a1 supportedDeviceAllowList];
}

id objc_msgSend_testSuiteName(void *a1, const char *a2, ...)
{
  return [a1 testSuiteName];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_useSupportedDeviceAllowList(void *a1, const char *a2, ...)
{
  return [a1 useSupportedDeviceAllowList];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}