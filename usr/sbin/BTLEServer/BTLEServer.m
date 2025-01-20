void sub_100005B34(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100005BAC()
{
  return v0;
}

void sub_100005BB8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100005BD8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t sub_100005BF8()
{
  return v0;
}

void sub_100005D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006188(id a1)
{
  qword_1000CCFC8 = objc_opt_new();

  _objc_release_x1();
}

void sub_100006E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000075D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C890(a1, v5, v4);
    }
  }
}

void sub_1000079E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007A10(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = (id)qword_1000CD178;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = [WeakRetained peripheral];
    v9 = [v8 name];
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    if (a2) {
      v11 = "OK";
    }
    else {
      v11 = "FAILED - ";
    }
    if (a2)
    {
      v12 = &stru_1000B2890;
    }
    else
    {
      v12 = [v5 userInfo];
    }
    int v13 = 138413058;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2082;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished data collection on “%@” for %@: %{public}s%@", (uint8_t *)&v13, 0x2Au);
    if ((a2 & 1) == 0) {
  }
    }
}

void sub_1000083A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100008860(uint64_t a1)
{
  sub_1000088B0();
  Class result = objc_getClass("HKQuantityType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CCFD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000088B0()
{
  if (!qword_1000CCFE0) {
    qword_1000CCFE0 = _sl_dlopen();
  }
}

uint64_t sub_100008980()
{
  uint64_t result = _sl_dlopen();
  qword_1000CCFE0 = result;
  return result;
}

Class sub_1000089F4(uint64_t a1)
{
  sub_1000088B0();
  Class result = objc_getClass("HKQuantity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CCFE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100008A44(uint64_t a1)
{
  sub_1000088B0();
  Class result = objc_getClass("HKQuantityDatum");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CCFF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100008A94(uint64_t a1)
{
  sub_1000088B0();
  Class result = objc_getClass("HKDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CCFF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100009520(void *a1)
{
  v2 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006CBD4(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return [a1 notifyDidStop];
}

void sub_1000097B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000097DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v29 = WeakRetained;
    if (byte_1000CD170)
    {
      [WeakRetained instanceID];
      kdebug_trace();
      id WeakRetained = v29;
    }
    uint64_t v3 = [WeakRetained groupInit];
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v4 = [v29 groupStart];
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v5 = [v29 deviceManagement];

    if (v5)
    {
      uint64_t v6 = [v29 deviceManagement];
      uint64_t v7 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    uint64_t v8 = [v29 touch];

    if (v8)
    {
      uint64_t v9 = [v29 touch];
      uint64_t v10 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    v11 = [v29 buttons];

    if (v11)
    {
      v12 = [v29 buttons];
      int v13 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    v14 = [v29 inertial];

    if (v14)
    {
      __int16 v15 = [v29 inertial];
      v16 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    __int16 v17 = [v29 infrared];

    if (v17)
    {
      v18 = [v29 infrared];
      __int16 v19 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    v20 = [v29 audio];

    if (v20)
    {
      v21 = [v29 audio];
      v22 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    v23 = [v29 radio];

    if (v23)
    {
      v24 = [v29 radio];
      v25 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    v26 = [v29 proximity];

    if (v26)
    {
      v27 = [v29 proximity];
      v28 = [v29 queue];
      IOHIDUserDeviceUnscheduleFromDispatchQueue();
    }
    [v29 clearAppleMultitouchDeviceNotification];
    [v29 clearDeviceManagementNotification];
    [v29 clearButtonInterestNotification];
    if ([v29 notificationPort])
    {
      IONotificationPortDestroy((IONotificationPortRef)[v29 notificationPort]);
      [v29 setNotificationPort:0];
    }
    [v29 setQueue:0];
    id WeakRetained = v29;
    if (byte_1000CD170)
    {
      [*(id *)(a1 + 32) instanceID];
      kdebug_trace();
      id WeakRetained = v29;
    }
  }
}

void sub_10000A07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000A090(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  v2 = [*(id *)(a1 + 32) properties];
  uint64_t v3 = +[HIDAppleSiriRemoteDevice getButtonsHIDReportDescriptor:](HIDAppleSiriRemoteDevice, "getButtonsHIDReportDescriptor:", [*(id *)(a1 + 32) productID]);
  id v20 = +[HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:2 hidDescriptor:v3 extendedData:0];

  uint64_t v4 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setButtons:v4];

  uint64_t v5 = [*(id *)(a1 + 32) buttons];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) buttons];
    uint64_t v7 = IOHIDUserDeviceCopyService();

    if (v7)
    {
      if (!IOServiceAddInterestNotification((IONotificationPortRef)[*(id *)(a1 + 32) notificationPort], v7, "IOGeneralInterest", (IOServiceInterestCallback)sub_10000A3A0, *(void **)(a1 + 32), (io_object_t *)(*(void *)(a1 + 32) + 60))) {
      IOObjectRelease(v7);
      }
    }
    uint64_t v8 = [*(id *)(a1 + 32) buttons];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v9 = [*(id *)(a1 + 32) buttons];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v10 = [*(id *)(a1 + 32) buttons];
    v11 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  v12 = +[DoAPAudioRelayHub instance];
  int v13 = [*(id *)(a1 + 32) peripheral];
  v14 = [v13 identifier];
  __int16 v15 = [v14 UUIDString];
  v16 = [*(id *)(a1 + 32) properties];
  __int16 v17 = [v12 relayWithIdentifier:v15 deviceType:1 properties:v16 codecType:0];
  [*(id *)(a1 + 32) setDoapAudioRelay:v17];

  v18 = *(void **)(a1 + 32);
  __int16 v19 = [v18 doapAudioRelay];
  [v19 setDelegate:v18];

  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

void *sub_10000A3A0(void *a1, const char *a2, int a3)
{
  if (a3 == -536870608) {
    return [a1 verifyButtonDriverOpenedByEventSystem:a2];
  }
  return a1;
}

id sub_10000A3BC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_10000A3D8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000A3F4(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  v2 = (IONotificationPort *)[*(id *)(a1 + 32) notificationPort];
  CFDictionaryRef v3 = IOServiceMatching("AppleMultitouchDevice");
  if (!IOServiceAddMatchingNotification(v2, "IOServiceFirstMatch", v3, (IOServiceMatchingCallback)sub_10000A648, *(void **)(a1 + 32), (io_iterator_t *)(*(void *)(a1 + 32) + 52))&& [*(id *)(a1 + 32) amdNotification])
  {
    while (IOIteratorNext((io_iterator_t)[*(id *)(a1 + 32) amdNotification]))
      ;
  }
  uint64_t v4 = [*(id *)(a1 + 32) properties];
  uint64_t v5 = +[HIDAppleSiriRemoteDevice getTouchHIDReportDescriptor];
  id v13 = +[HIDAppleSiriRemoteDevice properties:v4 locationIdOffset:1 hidDescriptor:v5 extendedData:0];

  uint64_t v6 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setTouch:v6];

  uint64_t v7 = [*(id *)(a1 + 32) touch];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) touch];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v9 = [*(id *)(a1 + 32) touch];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v10 = [*(id *)(a1 + 32) touch];
    v11 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  v12 = [*(id *)(a1 + 32) groupTouch];
  dispatch_group_leave(v12);

  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

void sub_10000A648(void *a1, uint64_t a2)
{
  id v3 = a1;
  [v3 appleMultitouchDeviceArrived:a2];
  [v3 clearAppleMultitouchDeviceNotification];
}

id sub_10000A69C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:241];
}

id sub_10000A6B8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:241];
}

void sub_10000A6D4(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  v2 = (IONotificationPort *)[*(id *)(a1 + 32) notificationPort];
  CFDictionaryRef v3 = IOServiceMatching("AppleEmbeddedBluetoothDeviceManagement");
  if (!IOServiceAddMatchingNotification(v2, "IOServiceFirstMatch", v3, (IOServiceMatchingCallback)sub_10000A92C, *(void **)(a1 + 32), (io_iterator_t *)(*(void *)(a1 + 32) + 56))&& [*(id *)(a1 + 32) deviceMgtNotification])
  {
    while (IOIteratorNext((io_iterator_t)[*(id *)(a1 + 32) deviceMgtNotification]))
      ;
  }
  uint64_t v4 = [*(id *)(a1 + 32) properties];
  uint64_t v5 = +[HIDAppleSiriRemoteDevice getDeviceManagementHIDReportDescriptor];
  id v13 = +[HIDAppleSiriRemoteDevice properties:v4 locationIdOffset:0 hidDescriptor:v5 extendedData:&off_1000B7B80];

  uint64_t v6 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setDeviceManagement:v6];

  uint64_t v7 = [*(id *)(a1 + 32) deviceManagement];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) deviceManagement];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v9 = [*(id *)(a1 + 32) deviceManagement];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v10 = [*(id *)(a1 + 32) deviceManagement];
    v11 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  v12 = [*(id *)(a1 + 32) groupDeviceManagement];
  dispatch_group_leave(v12);

  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

void sub_10000A92C(void *a1, uint64_t a2)
{
  id v3 = a1;
  [v3 deviceMgtDriverArrived:a2];
  [v3 clearDeviceManagementNotification];
}

id sub_10000A980(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_10000A99C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000A9B8(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  v2 = [*(id *)(a1 + 32) properties];
  id v3 = +[HIDAppleSiriRemoteDevice getInertialHIDReportDescriptor];
  id v11 = +[HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:3 hidDescriptor:v3 extendedData:0];

  uint64_t v4 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setInertial:v4];

  uint64_t v5 = [*(id *)(a1 + 32) inertial];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) inertial];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v7 = [*(id *)(a1 + 32) inertial];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v8 = [*(id *)(a1 + 32) inertial];
    uint64_t v9 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  uint64_t v10 = [*(id *)(a1 + 32) groupInertial];
  dispatch_group_leave(v10);

  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

id sub_10000ABA0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_10000ABBC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000ABD8(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  v2 = [*(id *)(a1 + 32) properties];
  id v3 = +[HIDAppleSiriRemoteDevice getProximityHIDReportDescriptor];
  id v11 = +[HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:7 hidDescriptor:v3 extendedData:0];

  uint64_t v4 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setProximity:v4];

  uint64_t v5 = [*(id *)(a1 + 32) proximity];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) proximity];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v7 = [*(id *)(a1 + 32) proximity];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v8 = [*(id *)(a1 + 32) proximity];
    uint64_t v9 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  uint64_t v10 = [*(id *)(a1 + 32) groupProximity];
  dispatch_group_leave(v10);

  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

id sub_10000ADC0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_10000ADDC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000ADF8(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  if ([*(id *)(a1 + 32) productID] == 614
    || [*(id *)(a1 + 32) productID] == 621)
  {
    id v3 = [*(id *)(a1 + 32) sentHostReadyReport];
    dispatch_semaphore_wait(v3, v2);
  }
  uint64_t v4 = [*(id *)(a1 + 32) gotDeviceExtendedInfoReport];
  dispatch_semaphore_wait(v4, v2);

  uint64_t v5 = [*(id *)(a1 + 32) groupInit];
  uint64_t v6 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AFE8;
  block[3] = &unk_1000B1268;
  block[4] = *(void *)(a1 + 32);
  dispatch_group_async(v5, v6, block);

  uint64_t v7 = [*(id *)(a1 + 32) groupInit];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B1F0;
  v10[3] = &unk_1000B1268;
  v10[4] = *(void *)(a1 + 32);
  dispatch_group_async(v7, v6, v10);

  uint64_t v8 = [*(id *)(a1 + 32) groupInit];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B3F8;
  v9[3] = &unk_1000B1268;
  v9[4] = *(void *)(a1 + 32);
  dispatch_group_async(v8, v6, v9);
}

void sub_10000AFE8(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  dispatch_time_t v2 = [*(id *)(a1 + 32) properties];
  id v3 = +[HIDAppleSiriRemoteDevice getInfraredHIDReportDescriptor];
  id v10 = +[HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:4 hidDescriptor:v3 extendedData:0];

  uint64_t v4 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setInfrared:v4];

  uint64_t v5 = [*(id *)(a1 + 32) infrared];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) infrared];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v7 = [*(id *)(a1 + 32) infrared];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v8 = [*(id *)(a1 + 32) infrared];
    uint64_t v9 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

id sub_10000B1B8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_10000B1D4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000B1F0(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  dispatch_time_t v2 = [*(id *)(a1 + 32) properties];
  id v3 = +[HIDAppleSiriRemoteDevice getAudioHIDReportDescriptor];
  id v10 = +[HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:5 hidDescriptor:v3 extendedData:0];

  uint64_t v4 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setAudio:v4];

  uint64_t v5 = [*(id *)(a1 + 32) audio];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) audio];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v7 = [*(id *)(a1 + 32) audio];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v8 = [*(id *)(a1 + 32) audio];
    uint64_t v9 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

id sub_10000B3C0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_10000B3DC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000B3F8(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  dispatch_time_t v2 = [*(id *)(a1 + 32) properties];
  id v3 = +[HIDAppleSiriRemoteDevice getRadioHIDReportDescriptor];
  id v10 = +[HIDAppleSiriRemoteDevice properties:v2 locationIdOffset:6 hidDescriptor:v3 extendedData:0];

  uint64_t v4 = (void *)IOHIDUserDeviceCreateWithOptions();
  [*(id *)(a1 + 32) setRadio:v4];

  uint64_t v5 = [*(id *)(a1 + 32) radio];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) radio];
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();

    uint64_t v7 = [*(id *)(a1 + 32) radio];
    IOHIDUserDeviceRegisterSetReportCallback();

    uint64_t v8 = [*(id *)(a1 + 32) radio];
    uint64_t v9 = [*(id *)(a1 + 32) queue];
    IOHIDUserDeviceScheduleWithDispatchQueue();
  }
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

id sub_10000B5C8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

id sub_10000B5E4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2 keyholeID:240];
}

void sub_10000B600(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if (byte_1000CD170)
    {
      [WeakRetained instanceID];
      kdebug_trace();
    }
    char v7 = -81;
    unsigned int v3 = [v2 setReport:&v7 reportLength:1 reportID:175 reportType:2 keyholeID:240];
    if (v3)
    {
      int v4 = v3;
      uint64_t v5 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_10006CDB4(v4, v5);
      }
    }
    uint64_t v6 = [v2 sentHostReadyReport];
    dispatch_semaphore_signal(v6);

    if (byte_1000CD170)
    {
      [v2 instanceID];
      kdebug_trace();
    }
  }
}

void sub_10000B71C(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) groupInit];
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)HIDAppleSiriRemoteDevice;
  [super notifyDidStart];
  [*(id *)(a1 + 32) logHwFwVersions];
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  unsigned int v3 = [*(id *)(a1 + 32) queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B830;
  v4[3] = &unk_1000B1290;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_10000B81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000B830(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained notifyDesiredConnectionParametersDidChange];
    id WeakRetained = v2;
  }
}

void sub_10000BD54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C240(uint64_t a1)
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v2 = [v4 objectForKey:@"SleepPeripheralLatency"];

  if (v2) {
    uint64_t v3 = (uint64_t)[v4 integerForKey:@"SleepPeripheralLatency"];
  }
  else {
    uint64_t v3 = 199;
  }
  if ([*(id *)(a1 + 32) latency] != v3)
  {
    [*(id *)(a1 + 32) setLatency:v3];
    [*(id *)(a1 + 32) notifyDesiredConnectionParametersDidChange];
  }
}

void sub_10000C3A0(uint64_t a1)
{
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v2 = [v4 objectForKey:@"NormalPeripheralLatency"];

  if (v2) {
    uint64_t v3 = (uint64_t)[v4 integerForKey:@"NormalPeripheralLatency"];
  }
  else {
    uint64_t v3 = 80;
  }
  if ([*(id *)(a1 + 32) latency] != v3)
  {
    [*(id *)(a1 + 32) setLatency:v3];
    [*(id *)(a1 + 32) notifyDesiredConnectionParametersDidChange];
  }
  if (byte_1000CD170)
  {
    [*(id *)(a1 + 32) instanceID];
    kdebug_trace();
  }
}

id sub_10000C56C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) latency];
  if (result)
  {
    [*(id *)(a1 + 32) setLatency:0];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 notifyDesiredConnectionParametersDidChange];
  }
  return result;
}

id sub_10000C7C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"buttons";
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_10000CA58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000CBB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"proximity";
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_10000D6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D6E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D6F0(uint64_t a1)
{
}

id sub_10000D6F8(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

id sub_10000D708(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

id sub_10000D89C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"inertial";
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_10000DB9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_10000DBBC(id a1)
{
  return (NSDictionary *)&off_1000B7C40;
}

id sub_10000DBC8(uint64_t a1)
{
  CFStringRef v4 = @"audio";
  uint64_t v1 = [*(id *)(a1 + 32) description];
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_10000F184(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10000F198(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t v5 = 512;
    if ([*(id *)(a1 + 32) productID] == 614) {
      uint64_t v3 = 207;
    }
    else {
      uint64_t v3 = 188;
    }
    if (![WeakRetained getReport:&v6 reportLength:&v5 reportID:v3 reportType:2 keyholeID:240])[WeakRetained handleDeviceManagementData:&v6 dataLength:v5]; {
    long long v36 = 0u;
    }
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t v5 = 512;
    if ([*(id *)(a1 + 32) productID] == 614) {
      uint64_t v4 = 206;
    }
    else {
      uint64_t v4 = 187;
    }
    if (![WeakRetained getReport:&v6 reportLength:&v5 reportID:v4 reportType:2 keyholeID:240])[WeakRetained handleDeviceManagementData:&v6 dataLength:v5]; {
  }
    }
}

void sub_10000F4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000F50C(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained doapAudioStart];
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    intptr_t v7 = dispatch_semaphore_wait(v5, v6);

    if (v7)
    {
      long long v8 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006D5B0(v8);
      }
      long long v9 = +[NSString stringWithFormat:@"Timed out after %lld seconds waiting to start Siri", 10];
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      long long v19 = v9;
      long long v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      long long v11 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870186 userInfo:v10];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v12 = v4;
      objc_sync_enter(v12);
      id v13 = objc_alloc_init((Class)NSMutableArray);
      [v12 setAudioBuffer:v13];

      objc_sync_exit(v12);
    }
    else
    {
      long long v14 = [v4 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F778;
      block[3] = &unk_1000B1348;
      objc_copyWeak(&v17, v2);
      id v16 = *(id *)(a1 + 32);
      dispatch_async(v14, block);

      objc_destroyWeak(&v17);
    }
  }
}

void sub_10000F75C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F778(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    [v4 setDoapAudioStop:v5];

    objc_sync_exit(v4);
    __int16 v22 = 408;
    id v21 = 0;
    unsigned int v6 = [v4 setReport:&v22 reportLength:2 reportID:152 reportType:2 keyholeID:240 error:&v21];
    id v7 = v21;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006D630();
      }
      id v8 = v4;
      objc_sync_enter(v8);
      [v8 setDoapAudioStop:0];
      id v9 = objc_alloc_init((Class)NSMutableArray);
      [v8 setAudioBuffer:v9];

      objc_sync_exit(v8);
      long long v10 = [v8 doapAudioStart];
      dispatch_semaphore_signal(v10);
    }
    else
    {
      long long v10 = v4;
      objc_sync_enter(v10);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v11 = [v10 audioBuffer];
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        do
        {
          long long v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v14);
            id v16 = [v10 doapAudioRelay];
            [v16 sendAudioFrame:v15];

            long long v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v12);
      }

      [v10 setAudioBuffer:0];
      objc_sync_exit(v10);
    }
  }
}

void sub_10000F9DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000FFF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained waitForSiriAudioToStop:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_100010224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100010240(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v11 = 152;
    id v10 = 0;
    unsigned int v4 = [WeakRetained setReport:&v11 reportLength:2 reportID:152 reportType:2 keyholeID:240 error:&v10];
    id v5 = v10;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006D6F0();
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      unsigned int v6 = [v3 doapAudioStart];
      dispatch_semaphore_signal(v6);

      id v7 = v3;
      objc_sync_enter(v7);
      id v8 = objc_alloc_init((Class)NSMutableArray);
      [v7 setAudioBuffer:v8];

      objc_sync_exit(v7);
    }
    else
    {
      id v9 = +[NSDate date];
      [v3 setLastAudioDate:v9];

      [v3 waitForSiriAudioToStop:*(void *)(a1 + 32)];
    }
  }
}

void sub_100010394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010A30(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100010A4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100010AA4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_100010AC4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

BOOL sub_100010AE4()
{
  return MGGetSInt32Answer() == 4;
}

BOOL sub_100010B10()
{
  return MGGetSInt32Answer() == 6;
}

BOOL sub_100010B3C()
{
  return MGGetSInt32Answer() == 1;
}

BOOL sub_100010B68()
{
  return MGGetSInt32Answer() == 9;
}

void sub_100010B94()
{
  uint64_t v0 = +[NSNotificationCenter defaultCenter];
  id v1 = [v0 addObserverForName:NSUserDefaultsDidChangeNotification object:0 queue:0 usingBlock:&stru_1000B1388];

  sub_100010C04();
}

void sub_100010C04()
{
  uint64_t v0 = +[NSUserDefaults standardUserDefaults];
  id v1 = [v0 objectForKey:@"EnableSignposts"];

  byte_1000CD170 = [v1 BOOLValue];
}

void sub_100010CCC(id a1)
{
  if (sub_100010B10() || sub_100010B3C() || sub_100010B68())
  {
    qword_1000CD020 = objc_alloc_init(EndpointManager);
    _objc_release_x1();
  }
}

id sub_100011F98(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2];
}

id sub_100011FB0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2];
}

void sub_100013154(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DA38(a1, v5, v4);
    }
  }
}

void sub_100013714(id a1, NSNumber *a2, HIDKeyholeUserDevice *a3, BOOL *a4)
{
  id v4 = a3;
  [(HIDKeyholeUserDevice *)v4 setGetReportKeyholeID:240];
  [(HIDKeyholeUserDevice *)v4 setUseKeyholeOnGet:1];
}

void sub_100014044(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100017DF8(id a1)
{
  id v1 = objc_alloc_init(GenericSiriRemoteListener);
  id v2 = (void *)qword_1000CD030;
  qword_1000CD030 = (uint64_t)v1;

  id v3 = (void *)qword_1000CD030;
  if (qword_1000CD030)
  {
    _[v3 setUpHidHandlers];
  }
  else
  {
    id v4 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006E2D8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void sub_100017FE8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 dataValue];
  [v3 handleAudioData:v4];
}

void sub_100018040(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (!a3)
  {
    id v16 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Destroying doapAudioRelay for GenericSiriRemote device %@", (uint8_t *)&v19, 0xCu);
    }
    long long v17 = *(void **)(a1 + 32);
    uint64_t v6 = (id *)(a1 + 32);
    long long v18 = [v17 doapAudioRelay];
    [v18 invalidate];

    [*v6 setDoapAudioRelay:0];
    uint64_t v12 = 4;
    goto LABEL_9;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v6 = (id *)(a1 + 32);
  uint64_t v8 = [v7 doapAudioRelay];

  if (!v8)
  {
    uint64_t v9 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating doapAudioRelay for GenericSiriRemote device %@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v10 = +[DoAPAudioRelayHub instance];
    uint64_t v11 = [v5 propertyForKey:@"PhysicalDeviceUniqueID"];
    uint64_t v12 = 2;
    uint64_t v13 = [v10 relayWithIdentifier:v11 deviceType:2 properties:0 codecType:7];
    [*v6 setDoapAudioRelay:v13];

    id v14 = *v6;
    uint64_t v15 = [*v6 doapAudioRelay];
    [v15 setDelegate:v14];

LABEL_9:
    [*v6 setState:v12];
  }
}

void sub_100018604(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001861C(uint64_t a1)
{
  CFStringRef v4 = @"audio";
  id v1 = [*(id *)(a1 + 32) description];
  id v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_1000186C4(id a1)
{
  return (NSDictionary *)&off_1000B7CE0;
}

void sub_10001885C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) doapAudioStart];
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  intptr_t v4 = dispatch_semaphore_wait(v2, v3);

  if (v4)
  {
    id v5 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006D5B0(v5);
    }
    uint64_t v6 = +[NSString stringWithFormat:@"Timed out after %lld seconds waiting to start Siri", 10];
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    uint64_t v15 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v8 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870186 userInfo:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    id v10 = objc_alloc_init((Class)NSMutableArray);
    [*(id *)(a1 + 32) setAudioBuffer:v10];

    objc_sync_exit(v9);
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018AA8;
    block[3] = &unk_1000B1640;
    void block[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v11, block);
  }
}

void sub_100018A8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100018AA8(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  [*(id *)(a1 + 32) setDoapAudioStop:v2];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  intptr_t v4 = [*(id *)(a1 + 32) audioBuffer];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [*(id *)(a1 + 32) doapAudioRelay];
        [v9 sendAudioFrame:v8];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v10 = [*(id *)(a1 + 32) audioBuffer];
  [v10 removeAllObjects];

  [*(id *)(a1 + 32) setAudioBuffer:0];
  objc_sync_exit(v3);
}

void sub_100018C34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000191CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000191F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForSiriAudioToStop:*(void *)(a1 + 40)];
}

id sub_1000193A0(uint64_t a1)
{
  dispatch_semaphore_t v2 = +[NSDate date];
  [*(id *)(a1 + 32) setLastAudioDate:v2];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 waitForSiriAudioToStop:v4];
}

void sub_100019568(id a1)
{
  qword_1000CD040 = objc_alloc_init(PolicyManager);

  _objc_release_x1();
}

void sub_10001A3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10001DDD0(uint64_t a1)
{
  if (!qword_1000CD058) {
    qword_1000CD058 = _sl_dlopen();
  }
  Class result = objc_getClass("HKDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CD050 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001DED0()
{
  uint64_t result = _sl_dlopen();
  qword_1000CD058 = result;
  return result;
}

uint64_t sub_10001DF90()
{
  return v0;
}

void sub_10001DF9C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id sub_10001E910(uint64_t a1, void *a2)
{
  return _[a2 start:*(void *)(*(void *)(a1 + 32) + 88)];
}

id sub_10001E9C4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 48), v2)) {
    [*(id *)(a1 + 32) sendAnalyticsEvent:@"com.apple.Multitouch.PencilHostReadyTimeout" withPayload:&off_1000B7D08];
  }
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)HIDApplePencilDevice;
  return [super notifyDidStart];
}

id sub_10001EACC(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HIDApplePencilDevice;
  return [super notifyDidStop];
}

id sub_10001EF1C(uint64_t a1, void *a2)
{
  id result = (id)kdebug_trace();
  if (a2)
  {
    return _[a2 mtWillPowerOn];
  }
  return result;
}

void sub_10001F050(id a1, HIDKeyholeUserDevice *a2, unint64_t a3, BOOL *a4)
{
}

id sub_10001F438(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1000242FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void sub_10002431C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_100024870(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 1) {
    [*(id *)(a1 + 32) setState:2];
  }
  id v2 = [*(id *)(a1 + 32) service];
  [v2 hidDeviceDidStart];
}

void sub_100024950(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:4];
  id v2 = [*(id *)(a1 + 32) service];
  [v2 hidDeviceDidStop];
}

void sub_100024A20(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) service];
  [v1 hidDeviceDesiredConnectionParametersDidChange];
}

void sub_10002523C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) firstObject];
  [v2 respondToRequest:v3 withResult:*(void *)(a1 + 56)];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) firstObject];
    uint64_t v6 = [v7 central];
    [v5 updateDataSource:v4 central:v6];
  }
}

void sub_100025CDC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) data];
  id v3 = [*(id *)(a1 + 32) notificationSourceCharacteristic];
  [v2 updateValue:v4 forCharacteristic:v3 onSubscribedCentrals:*(void *)(a1 + 48)];
}

id sub_100026308(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondToRequest:*(void *)(a1 + 40) withResult:3];
}

id sub_100026318(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleWriteRequests:*(void *)(a1 + 40)];
}

void sub_100026660(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeCentrals];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_1000266B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasTag:@"ANCSAuthorized"])
  {
    id v2 = [*(id *)(a1 + 40) activeCentrals];
    [v2 addObject:*(void *)(a1 + 32)];

    id v3 = [*(id *)(a1 + 40) alertMap];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002679C;
    v6[3] = &unk_1000B17A0;
    char v8 = 5;
    int8x16_t v5 = *(int8x16_t *)(a1 + 32);
    id v4 = (id)v5.i64[0];
    int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void sub_10002679C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v5 = a3;
  uint64_t v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 updateNotificationSource:0 notification:v5 sourceFlags:v3 centrals:v7];
}

void sub_100026A20(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeCentrals];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_100026B30(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) activeCentrals];
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v2) {
    [v3 addObject:v5];
  }
  else {
    [v3 removeObject:v5];
  }

  uint64_t v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned char *)(a1 + 48)) {
      CFStringRef v8 = @"adding";
    }
    else {
      CFStringRef v8 = @"removing";
    }
    uint64_t v11 = a1 + 32;
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(v11 + 8);
    long long v12 = v6;
    long long v13 = [v9 activeCentrals];
    int v14 = 138413058;
    uint64_t v15 = v10;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    __int16 v20 = 2048;
    id v21 = [v13 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Central %@ ancsAuthorization changed to %d. Active centrals after %@ %ld", (uint8_t *)&v14, 0x26u);
  }
}

uint64_t start(int a1, char *const *a2)
{
  signal(15, (void (__cdecl *)(int))1);
  _set_user_dir_suffix();
  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler_f(v4, (dispatch_function_t)sub_100027C18);
  dispatch_resume(v4);
  char v5 = 0;
  do
  {
    char v6 = v5;
    int v7 = getopt(a1, a2, "c");
    char v5 = 1;
  }
  while (v7 == 99);
  if (v7 == -1)
  {
    uint64_t v8 = optind;
    sub_100036740("BTLEServer");
    sub_100010B94();
    if (v6)
    {
      id v9 = +[NSMutableArray array];
      if (a1 != v8)
      {
        int v10 = v8 - a1;
        uint64_t v11 = &a2[v8];
        do
        {
          uint64_t v12 = (uint64_t)*v11++;
          long long v13 = +[NSString stringWithUTF8String:v12];
          id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
          [v9 addObject:v14];
        }
        while (!__CFADD__(v10++, 1));
      }
      __int16 v16 = +[ConnectionManager instance];
      [v16 connectAlways:v9];
    }
    else
    {
      id v18 = +[BTLEXpcServer instance];
      id v19 = +[DoAPAudioRelayHub instance];
      id v20 = +[GenericSiriRemoteListener instance];
      id v21 = +[LoggingManager instance];
      if (!sub_100010AE4())
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100027C78, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
    }
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000B18A8);

    if (+[FitnessDeviceManager shouldRestartCollecting])
    {
      long long v23 = +[FitnessDeviceManager instance];
      [v23 registerWithHealthKit:1];

      long long v24 = +[FitnessDeviceManager instance];
      [v24 loadCollectionState];
    }
    long long v25 = +[NSRunLoop currentRunLoop];
    [v25 run];

    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }

  return v17;
}

void sub_100027C18()
{
  uint64_t v0 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "SIGTERM received, exiting", v1, 2u);
  }
  exit(0);
}

void sub_100027C78()
{
  uint64_t v0 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

void sub_100027CD8(id a1, OS_xpc_object *a2)
{
  int v2 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a2, _xpc_event_key_name)];
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006F8C4((uint64_t)v2, v3);
  }
  if (([@"HKHealthDaemonActiveDataCollectionWillStartNotification" isEqualToString:v2] & 1) != 0|| objc_msgSend(@"BTSettingsHRMConnectedNotification", "isEqualToString:", v2))
  {
    id v4 = [@"HKHealthDaemonActiveDataCollectionWillStartNotification" isEqualToString:v2];
    char v5 = +[FitnessDeviceManager instance];
    [v5 registerWithHealthKit:v4];
  }
}

void sub_100027E0C(id a1)
{
  qword_1000CD060 = objc_alloc_init(CattManager);

  _objc_release_x1();
}

void sub_100029628(id a1, NSNumber *a2, HIDKeyholeUserDevice *a3, BOOL *a4)
{
  id v4 = a3;
  [(HIDKeyholeUserDevice *)v4 setGetReportKeyholeID:240];
  [(HIDKeyholeUserDevice *)v4 setUseKeyholeOnGet:1];
}

id sub_1000298F8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleEvent:a2];
}

uint64_t sub_100029E8C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = objc_alloc((Class)NSUUID);
  bytes = xpc_uuid_get_bytes(v4);

  id v7 = [v5 initWithUUIDBytes:bytes];
  [v3 addObject:v7];

  return 1;
}

void sub_10002BB2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002BB4C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[NSString stringWithUTF8String:a2];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(a1[4] + 8) + 24);
  id v9 = *(void **)(v7 + 8 * v8);
  *(void *)(v7 + 8 * v8) = v6;

  uint64_t v10 = sub_10002BBF8(v5);

  uint64_t v11 = a1[6];
  uint64_t v12 = *(void *)(*(void *)(a1[4] + 8) + 24);
  long long v13 = *(void **)(v11 + 8 * v12);
  *(void *)(v11 + 8 * v12) = v10;

  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  return 1;
}

__CFString *sub_10002BBF8(void *a1)
{
  id v1 = a1;
  xpc_type_t type = xpc_get_type(v1);
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    id v4 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v1)];
LABEL_26:
    uint64_t v3 = v4;
    goto LABEL_27;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v1)];
    goto LABEL_26;
  }
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL value = xpc_BOOL_get_value(v1);
    uint64_t v6 = &__kCFBooleanFalse;
    if (value) {
      uint64_t v6 = &__kCFBooleanTrue;
    }
    id v4 = v6;
    goto LABEL_26;
  }
  if (type != (xpc_type_t)&_xpc_type_string)
  {
    if (type == (xpc_type_t)&_xpc_type_data)
    {
      id v10 = objc_alloc((Class)NSData);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      id v4 = (__CFString *)[v10 initWithBytes:bytes_ptr length:xpc_data_get_length(v1)];
    }
    else if (type == (xpc_type_t)&_xpc_type_uuid)
    {
      id v4 = (__CFString *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:xpc_uuid_get_bytes(v1)];
    }
    else if (type == (xpc_type_t)&_xpc_type_array)
    {
      sub_10002C374(v1);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      sub_10002C4C4(v1);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (type == (xpc_type_t)&_xpc_type_fd)
    {
      id v4 = +[NSNumber numberWithInt:xpc_fd_dup(v1)];
    }
    else
    {
      if (type != (xpc_type_t)&_xpc_type_double)
      {
        NSLog(@"Unknown XPC type: %p", type);
        uint64_t v3 = 0;
        goto LABEL_27;
      }
      id v4 = +[NSNumber numberWithDouble:xpc_double_get_value(v1)];
    }
    goto LABEL_26;
  }
  uint64_t v7 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v1)];
  uint64_t v8 = (void *)v7;
  id v9 = &stru_1000B2890;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  uint64_t v3 = v9;

LABEL_27:

  return v3;
}

id sub_10002C374(void *a1)
{
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  size_t v3 = 8 * count;
  __chkstk_darwin();
  bzero((char *)applier - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10002C6AC;
  applier[3] = &unk_1000B19D0;
  applier[4] = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_array_apply(v1, applier);
  id v4 = [objc_alloc((Class)NSArray) initWithObjects:(char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0) count:count];
  if (count)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v4;
}

id sub_10002C4C4(void *a1)
{
  id v1 = a1;
  size_t count = xpc_dictionary_get_count(v1);
  uint64_t v3 = 8 * count;
  __chkstk_darwin();
  id v4 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * count);
  __chkstk_darwin();
  bzero(v4, 8 * count);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10002C6F0;
  applier[3] = &unk_1000B19B0;
  applier[4] = v10;
  void applier[5] = v4;
  applier[6] = v4;
  xpc_dictionary_apply(v1, applier);
  id v5 = [objc_alloc((Class)NSDictionary) initWithObjects:v4 forKeys:v4 count:count];
  _Block_object_dispose(v10, 8);
  if (count)
  {
    uint64_t v6 = 8 * count;
    do
    {

      v6 -= 8;
    }
    while (v6);
    uint64_t v7 = v4 - 8;
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v5;
}

void sub_10002C68C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002C6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10002BBF8(a3);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 8 * a2);
  *(void *)(v6 + 8 * a2) = v5;

  return 1;
}

uint64_t sub_10002C6F0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[NSString stringWithUTF8String:a2];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(a1[4] + 8) + 24);
  id v9 = *(void **)(v7 + 8 * v8);
  *(void *)(v7 + 8 * v8) = v6;

  uint64_t v10 = sub_10002BBF8(v5);

  uint64_t v11 = a1[6];
  uint64_t v12 = *(void *)(*(void *)(a1[4] + 8) + 24);
  long long v13 = *(void **)(v11 + 8 * v12);
  *(void *)(v11 + 8 * v12) = v10;

  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  return 1;
}

void sub_10002C7A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_10002C9CC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleServerEvent:a2];
}

void sub_10002CA2C(id a1)
{
  qword_1000CD078 = objc_alloc_init(DoAPAudioRelayHub);

  _objc_release_x1();
}

void sub_10002D104(id a1, OS_xpc_object *a2)
{
  int v2 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Event handler fired for previously torn down siri XPC connection", v3, 2u);
  }
}

id sub_10002D16C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleConnectionEvent:a2];
}

void sub_10002D178(id a1, OS_xpc_object *a2)
{
  int v2 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Event handler fired for previously torn down sound sensor XPC connection", v3, 2u);
  }
}

id sub_10002D1E0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleConnectionEvent:a2];
}

void sub_10002E854(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002E870(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002FCD8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init((Class)NSKeyedArchiver);
    [v4 encodeObject:v3 forKey:@"kMsgArgError"];

    CFStringRef v7 = @"kMsgArgError";
    id v5 = [v4 encodedData];
    uint64_t v8 = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 32) sendMsg:"TransportDidStart" args:v6];
}

void sub_10002FE38(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init((Class)NSKeyedArchiver);
    [v4 encodeObject:v3 forKey:@"kMsgArgError"];

    CFStringRef v7 = @"kMsgArgError";
    id v5 = [v4 encodedData];
    uint64_t v8 = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 32) sendMsg:"TransportDidStop" args:v6];
}

void sub_100030288(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id sub_1000303E0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleServerEvent:a2];
}

void sub_100030440(id a1)
{
  qword_1000CD088 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000304E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100030708(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleConnectionEvent:a2];
}

void sub_100030EC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100030EE4(uint64_t a1)
{
  uint64_t v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"logRetrievalComplete" selector:0 userInfo:0 repeats:420.0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = +[UARPServiceUARPControllerManager instance];
  [v5 startTapToRadar];
}

BOOL sub_100031340(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000709EC(v6, v5, v4);
    }
  }

  return 1;
}

void sub_100031510(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031618(id a1)
{
  qword_1000CD098 = objc_alloc_init(ConnectionManager);

  _objc_release_x1();
}

id sub_100034228(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [v4 isEqual:v6];

  return v7;
}

void sub_100034D24(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a4;
  id v9 = [v4 outputStream];
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = [v6 length];

  [v9 write:v7 maxLength:v8];
}

void sub_100034DB4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a4;
  id v9 = [v4 outputStream];
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = [v6 length];

  [v9 write:v7 maxLength:v8];
}

id sub_1000361B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnectPeripheral:*(void *)(a1 + 40) force:0];
}

id sub_100036328(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnectPeripheral:*(void *)(a1 + 40) force:1];
}

id sub_10003647C(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnectPeripheral:*(void *)(a1 + 40) force:0];
}

uint64_t sub_100036740(char *category)
{
  qword_1000CD178 = (uint64_t)os_log_create("com.apple.bluetooth", category);

  return _objc_release_x1();
}

void sub_10003A484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003A49C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003A4AC(uint64_t a1)
{
}

void sub_10003A4B4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v8 = [a2 UUID];
  unsigned int v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_10003A710(id a1, CBService *a2, ClientService *a3, BOOL *a4)
{
}

void sub_10003A854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A86C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isStarted] & 1) == 0)
  {
    id v7 = [v6 priority];
    if (v7 >= [*(id *)(a1 + 32) startPriority])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      id v8 = [v6 priority];
      if (v8 == [*(id *)(a1 + 32) startPriority])
      {
        unsigned int v9 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v9;
          uint64_t v11 = [v5 UUID];
          uint64_t v12 = [*(id *)(a1 + 32) peripheral];
          long long v13 = [v12 name];
          int v15 = 138412546;
          __int16 v16 = v11;
          __int16 v17 = 2112;
          id v18 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting service \"%@\" on peripheral \"%@\"", (uint8_t *)&v15, 0x16u);
        }
        id v14 = [*(id *)(a1 + 32) startingClientServices];
        [v14 addObject:v6];

        [v6 start];
      }
    }
  }
}

void sub_10003AD9C(id a1, CBService *a2, ClientService *a3, BOOL *a4)
{
}

void sub_10003B2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

id sub_10003B2EC(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id result = [a3 isPrimary];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_10003C084(id a1)
{
  qword_1000CD0B0 = (uint64_t)objc_alloc_init((Class)SDRDiagnosticReporter);

  _objc_release_x1();
}

void sub_10003C0C0(id a1, NSDictionary *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Response from DiagnosticReporter - %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10003E518(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 setIsValid:0];
  id v5 = *(void **)(a1 + 32);
  id v6 = +[NSError errorWithDomain:CBErrorDomain code:3 userInfo:0];
  [v5 signalCommandCondition:v4 error:v6];
}

void sub_10003E874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003E894(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [v2 systemMonitor];
  [v2 screenStateChanged:[v1 screenOn]];
}

uint64_t sub_100040244(uint64_t a1)
{
  io_connect_t v2 = [*(id *)(a1 + 32) pmService];
  intptr_t v3 = *(void *)(a1 + 40);

  return IOAllowPowerChange(v2, v3);
}

void sub_100040618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100040630(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if (![a3 type] && (objc_msgSend(v7, "isNotifying") & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_100040838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004085C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004086C(uint64_t a1)
{
}

void sub_100040874(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = a3;
  if (*(_DWORD *)(a1 + 40) == [v8 ID]
    && *(_DWORD *)(a1 + 44) == [v8 type])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100040BA8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100040F84(uint64_t a1)
{
  io_connect_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained lock];
  [v4 lock];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 state];

  id v7 = objc_loadWeakRetained(v2);
  unsigned int v8 = [v7 pending];

  id v9 = objc_loadWeakRetained(v2);
  [v9 setPending:0];

  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = [v10 lock];
  [v11 unlock];

  if (v8)
  {
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v12 chargerStateChanged:v6];
  }
}

void sub_10004149C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained pairingInfoCompleted];
}

void sub_100043C14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100046B10()
{
  return v0;
}

void sub_100046B20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100046B94(id a1)
{
  if (!sub_100010AE4())
  {
    qword_1000CD0D8 = objc_alloc_init(ServerServiceManager);
    _objc_release_x1();
  }
}

void sub_100046F98(id a1, CBMutableService *a2, ServerService *a3, BOOL *a4)
{
}

id sub_1000474CC(uint64_t a1, uint64_t a2, void *a3)
{
  return _[a3 peripheralManagerDidUpdateState:*(void *)(a1 + 32)];
}

void sub_100047E68(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = [a2 UUID];
  id v6 = [v5 UUIDString];
  unsigned int v7 = [v6 isEqualToString:CBUUIDAppleNotificationCenterServiceString];

  if (v7) {
    [v8 peripheralManager:*(void *)(a1 + 32) central:*(void *)(a1 + 40) didUpdateANCSAuthorization:*(unsigned __int8 *)(a1 + 48)];
  }
}

void sub_100048560(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
  io_connect_t v2 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stop DoAPSoundSensorRemoteDevice - Queue is clean", v7, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

id sub_1000489D8(uint64_t a1)
{
  io_connect_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    [v1 codec];
    uint64_t v3 = v5;
  }
  else
  {
    uint64_t v3 = 0;
  }
  return [v2 selectCodec:v3];
}

id sub_100048A28(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DoAPSoundSensorRemoteDevice;
  return [super notifyDidStart];
}

void sub_100048D18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000492D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000492EC(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) doapAudioStop];

  if (!v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    [*(id *)(a1 + 32) setDoapAudioStop:v3];
  }
  id v4 = *(void **)(a1 + 32);

  return _[v4 waitForSoundSensorAudioToStop:&stru_1000B2038];
}

void sub_100049C7C(id a1, NSNumber *a2, HIDKeyholeUserDevice *a3, BOOL *a4)
{
  id v4 = a3;
  [(HIDKeyholeUserDevice *)v4 setGetReportKeyholeID:240];
  [(HIDKeyholeUserDevice *)v4 setUseKeyholeOnGet:1];
}

id sub_10004AA0C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) stictionCollectionGate];
}

id sub_10004AA14(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimer:0];
}

id sub_10004B36C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) authCompleted:1];
}

id sub_10004B4A8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) authCompleted:0];
}

void sub_10004BF24(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x14u);
}

void sub_10004BF5C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10004BF68(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10004C394(id a1)
{
  qword_1000CD0E8 = objc_alloc_init(BTLEXpcServer);

  _objc_release_x1();
}

id sub_10004CC20(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleEvent:a2];
}

void sub_10004D72C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DA38(a1, v5, v4);
    }
  }
}

void sub_10004DCF4(id a1)
{
  qword_1000CD100 = objc_alloc_init(FitnessDeviceManager);

  _objc_release_x1();
}

id sub_10004E7A0(uint64_t a1, void *a2)
{
  return _[a2 handleDevicePairingChangeCallback];
}

id sub_10004E7A8(uint64_t a1, void *a2)
{
  return _[a2 handlePeripheralStatusChangeCallback];
}

void sub_10004EADC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004EC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004EE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100050240(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v23 = a3;
  if (v23)
  {
    id v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073F28(v6);
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([*(id *)(a1 + 32) shouldConnectDevice:v11])
          {
            id v12 = *(void **)(a1 + 32);
            long long v13 = [v11 identifier];
            unsigned int v14 = [v12 isPeripheralConnected:v13];

            int v15 = (void *)qword_1000CD178;
            BOOL v16 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
            if (v14)
            {
              if (v16)
              {
                __int16 v17 = v15;
                id v18 = [v11 name];
                *(_DWORD *)buf = 138412290;
                long long v29 = v18;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Tagged device “%@” is already connected", buf, 0xCu);
              }
            }
            else
            {
              if (v16)
              {
                id v19 = v15;
                id v20 = [v11 name];
                *(_DWORD *)buf = 138412290;
                long long v29 = v20;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Connect tagged device “%@”", buf, 0xCu);
              }
              id v21 = *(void **)(a1 + 32);
              __int16 v22 = [v11 identifier];
              [v21 connectPeripheral:v22];
            }
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v8);
    }
  }
}

void sub_100050790(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073FB8(v7);
    }
  }
  else
  {
    uint64_t v28 = a1;
    id v8 = objc_opt_new();
    uint64_t v9 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v5;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v16 = [v15 name:v28];
          __int16 v17 = (void *)v16;
          if (v16) {
            CFStringRef v18 = (const __CFString *)v16;
          }
          else {
            CFStringRef v18 = @"(loading)";
          }
          [v8 addObject:v18];

          id v19 = [v15 identifier];
          [v9 addObject:v19];
        }
        id v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v12);
    }

    id v20 = (void *)qword_1000CD178;
    uint64_t v21 = v28;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = v20;
      unsigned int v23 = [v10 count];
      *(_DWORD *)buf = 67109378;
      unsigned int v35 = v23;
      __int16 v36 = 2112;
      long long v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found %d peripherals with custom property “Fitness”: %@", buf, 0x12u);
    }
    long long v24 = *(void **)(v28 + 32);
    id v25 = [v9 copy:v28];
    [v24 updatePairedDevices:v25];

    long long v26 = [*(id *)(v21 + 32) requestedQuantityTypes];
    if ([v26 count])
    {
      unsigned int v27 = [*(id *)(v21 + 32) workoutInSession];

      if (v27) {
        [*(id *)(v21 + 32) connectTaggedDevices];
      }
    }
    else
    {
    }
    id v5 = v29;
  }
}

void sub_10005124C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v27 = a3;
  if (v27)
  {
    id v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100074048(v6);
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      id v10 = (os_log_t *)&qword_1000CD178;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v13 = +[ConnectionManager instance];
          unsigned int v14 = [v12 identifier];
          int v15 = [v13 peripheralForIdentifier:v14];

          if (v15
            && [v15 state] != (id)2
            && ([*(id *)(a1 + 32) shouldConnectDevice:v15] & 1) == 0)
          {
            os_log_t v16 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v17 = v16;
              CFStringRef v18 = [v15 identifier];
              uint64_t v19 = [v15 name];
              id v20 = v5;
              uint64_t v21 = a1;
              __int16 v22 = v10;
              unsigned int v23 = (void *)v19;
              *(_DWORD *)buf = 138412546;
              CFStringRef v24 = @"(loading)";
              if (v19) {
                CFStringRef v24 = (const __CFString *)v19;
              }
              long long v33 = v18;
              __int16 v34 = 2112;
              CFStringRef v35 = v24;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DISCONNECTING %@ “%@”", buf, 0x16u);

              id v10 = v22;
              a1 = v21;
              id v5 = v20;
            }
            id v25 = +[ConnectionManager instance];
            long long v26 = [v15 identifier];
            [v25 cancelPeripheralConnectionForConnectOnceIdentifier:v26];
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v8);
    }
  }
}

void sub_100052A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100052BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100052BD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopHeartRateScanTimer];
}

void sub_100052DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100052DE0(id a1, NSError *a2)
{
  objc_super v2 = a2;
  if (v2)
  {
    dispatch_semaphore_t v3 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100074288(v3);
    }
  }
}

void sub_100052EF4(id a1, NSError *a2)
{
  objc_super v2 = a2;
  if (v2)
  {
    dispatch_semaphore_t v3 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000743A8(v3);
    }
  }
}

void sub_100053380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000533A4(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100053488;
  v5[3] = &unk_1000B2178;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v9);
}

void sub_100053488(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v23 = a1;
  id obj = *(id *)(a1 + 32);
  id v3 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v8 = (void *)WeakRetained[3];
        id v9 = [v7 identifier];
        __int16 v36 = v9;
        id v10 = +[NSArray arrayWithObjects:&v36 count:1];
        id v11 = [v8 retrievePeripheralsWithIdentifiers:v10];
        id v12 = [v11 firstObject];

        if (v12)
        {
          [v12 tag:HKQuantityTypeIdentifierHeartRate];
          [v12 setCustomProperty:@"Fitness" value:@"1"];
          uint64_t v13 = (void *)WeakRetained[4];
          unsigned int v14 = [v7 identifier];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000537D4;
          v25[3] = &unk_1000B2150;
          v25[4] = v7;
          id v26 = v12;
          id v27 = WeakRetained;
          [v13 getEnabledStatusForPeripheral:v14 withCompletion:v25];
        }
        else
        {
          int v15 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100074438(v34, v15, v7, &v35);
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v4);
  }

  id v16 = [*(id *)(v23 + 40) mutableCopy];
  [v16 setObject:@"1" forKey:@"HRM_MIGRATION_COMPLETE"];
  __int16 v17 = *(void **)(v23 + 48);
  id v18 = [v16 copy];
  [v17 setPersistentDomain:v18 forName:@"com.apple.BTLEServer"];

  uint64_t v19 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = *(void **)(v23 + 32);
    uint64_t v21 = v19;
    id v22 = [v20 count];
    *(_DWORD *)buf = 134217984;
    id v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "HRM migration complete. Migrated %lu devices", buf, 0xCu);
  }
}

void sub_1000537D4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000744D4(a1, v6);
    }
    id v7 = *(void **)(a1 + 40);
    CFStringRef v8 = @"1";
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    if (a2) {
      CFStringRef v8 = @"1";
    }
    else {
      CFStringRef v8 = @"0";
    }
  }
  [v7 setCustomProperty:@"UpdateHealth" value:v8];
  [*(id *)(*(void *)(a1 + 48) + 32) removeHealthServicePairing:withCompletion:];
  if ([*(id *)(*(void *)(a1 + 48) + 72) count]) {
    [*(id *)(a1 + 48) updateScan];
  }
}

void sub_1000538F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10007457C(a1, v5);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    CFStringRef v8 = [v6 identifier];
    id v9 = [v8 UUIDString];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully migrated HRM device from HK to BT for identifier %@", (uint8_t *)&v10, 0xCu);
  }
}

Class sub_100053BD8(uint64_t a1)
{
  sub_100053C28();
  Class result = objc_getClass("HKActiveDataCollectionObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CD110 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100053C28()
{
  if (!qword_1000CD118) {
    qword_1000CD118 = _sl_dlopen();
  }
}

uint64_t sub_100053CF8()
{
  uint64_t result = _sl_dlopen();
  qword_1000CD118 = result;
  return result;
}

Class sub_100053D6C(uint64_t a1)
{
  sub_100053C28();
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CD120 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100053DBC(uint64_t a1)
{
  sub_100053C28();
  Class result = objc_getClass("HKDataCollector");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CD128 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100053E0C(uint64_t a1)
{
  sub_100053C28();
  Class result = objc_getClass("HKUnit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CD130 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100053E5C(uint64_t a1)
{
  if (!qword_1000CD140) {
    qword_1000CD140 = _sl_dlopen();
  }
  Class result = objc_getClass("AAAudioRoutingControl");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000CD138 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100053F5C()
{
  uint64_t result = _sl_dlopen();
  qword_1000CD140 = result;
  return result;
}

void sub_100053FE8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1000540D0(id a1)
{
  uint64_t v1 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Creating UARPServiceUARPControllerManager", v4, 2u);
  }
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_1000CD148;
  qword_1000CD148 = v2;
}

void sub_100054B98(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uuid];
  id v3 = [v2 uarpServiceForAccessoryUuid:v4];
  [v3 sendData:*(void *)(a1 + 48)];
}

void sub_1000554A4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_100055B70(uint64_t a1, void *a2)
{
  return _[a2 significantTimeChange];
}

void sub_100056538(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stop DoAPSiriRemoteDevice - Queue is clean", v7, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

id sub_1000569F4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    [v1 codec];
    uint64_t v3 = v5;
  }
  else
  {
    uint64_t v3 = 0;
  }
  return [v2 selectCodec:v3];
}

id sub_100056A44(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DoAPSiriRemoteDevice;
  return [super notifyDidStart];
}

void sub_100056D34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100057014(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && ([v3 error], unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    if ([*(id *)(a1 + 32) state] == 2)
    {
      id v9 = (id)qword_1000CD178;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) peripheral];
        id v11 = [v10 identifier];
        id v12 = [v11 UUIDString];
        int v17 = 138477827;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DoAPSiri - activateSiri: SiriActivation success for ID %{private}@ received while Active", (uint8_t *)&v17, 0xCu);
      }
    }
    else if ([*(id *)(a1 + 32) state] == 3)
    {
      uint64_t v13 = (id)qword_1000CD178;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = [*(id *)(a1 + 32) peripheral];
        int v15 = [v14 identifier];
        id v16 = [v15 UUIDString];
        int v17 = 138477827;
        id v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "DoAPSiri - activateSiri: SiriActivation succeeded for ID %{private}@", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) doapStateSet:4];
    }
    objc_sync_exit(v8);
  }
  else
  {
    id v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100074DA4(v6, v4);
    }
    if ([*(id *)(a1 + 32) state] == 5)
    {
      id v7 = [*(id *)(a1 + 32) doapAudioStart];
      dispatch_semaphore_signal(v7);
    }
    [*(id *)(a1 + 32) stopStreaming:6];
    [*(id *)(a1 + 32) clearState];
  }
}

void sub_100057274(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005742C(id a1, AFSiriActivationResult *a2)
{
  objc_super v2 = a2;
  id v3 = [(AFSiriActivationResult *)v2 error];

  id v4 = qword_1000CD178;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100074E44(v4, v2);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriCancellation success", v5, 2u);
  }
}

void sub_10005788C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000578A0(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) doapAudioStop];

  if (!v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    [*(id *)(a1 + 32) setDoapAudioStop:v3];
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 waitForSiriAudioToStop:&stru_1000B22A0];
}

void sub_100057FE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005802C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  unsigned __int8 v5 = qword_1000CD178;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriMyriad Score accepted", v6, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_100075014();
  }
}

void sub_1000580D0(id a1, AFSiriActivationResult *a2)
{
  objc_super v2 = a2;
  BOOL v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned __int8 v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Button Press and Hold complete: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10005817C(id a1, AFSiriActivationResult *a2)
{
  objc_super v2 = a2;
  BOOL v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned __int8 v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Button Release complete: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100058344(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) doapAudioStart];
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  intptr_t v4 = dispatch_semaphore_wait(v2, v3);

  if (v4)
  {
    unsigned __int8 v5 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000750B4(v5, v6, v7);
    }
    id v8 = +[NSString stringWithFormat:@"Timed out after %lld seconds waiting to start Siri", 10];
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id v20 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v10 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870186 userInfo:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    id v12 = [*(id *)(a1 + 32) audioBuffer];
    [v12 removeAllObjects];

    objc_sync_exit(v11);
    uint64_t v13 = [*(id *)(a1 + 32) doapAudioStart];
    dispatch_semaphore_signal(v13);

    id v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    [*(id *)(a1 + 32) doapStateSet:2];
    objc_sync_exit(v14);

    [*(id *)(a1 + 32) clearState];
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(NSObject **)(v15 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000585C8;
    block[3] = &unk_1000B1640;
    void block[4] = v15;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(v16, block);
  }
}

void sub_1000585A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000585C8(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  dispatch_time_t v3 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setDoapAudioStop:v2];

  intptr_t v4 = *(unsigned char **)(a1 + 32);
  if (v4[56] || v4[57])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    unsigned __int8 v5 = [*(id *)(a1 + 32) audioBuffer];

    if (v5)
    {
      id v6 = *v3;
      objc_sync_enter(v6);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v7 = [*v3 audioBuffer];
      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v25;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            id v12 = [*v3 doapAudioRelay];
            [v12 sendAudioFrame:v11];
          }
          id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v8);
      }

      uint64_t v13 = [*v3 audioBuffer];
      [v13 removeAllObjects];

      objc_sync_exit(v6);
    }
    id v14 = *v3;
    objc_sync_enter(v14);
    [*v3 doapStateSet:5];
    objc_sync_exit(v14);
  }
  else
  {
    unsigned int v15 = [v4 startStreaming];
    if (v15)
    {
      signed int v16 = v15;
      int v17 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10007512C((void **)(a1 + 32), v17);
      }
      id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Fail to send DoAP StartStream message - device state(%d)", [*v3 state]);
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      long long v30 = v18;
      NSErrorUserInfoKey v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v14 = +[NSError errorWithDomain:NSMachErrorDomain code:v16 userInfo:v19];

      [*v3 setDoapAudioStop:0];
      id v20 = [*v3 doapAudioStart];
      dispatch_semaphore_signal(v20);
    }
    else
    {
      id v14 = 0;
    }
    uint64_t v21 = [*v3 audioBuffer];

    if (v21)
    {
      id v22 = *v3;
      objc_sync_enter(v22);
      uint64_t v23 = [*v3 audioBuffer];
      [v23 removeAllObjects];

      objc_sync_exit(v22);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100058908(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100058EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100058EE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForSiriAudioToStop:*(void *)(a1 + 40)];
}

void sub_100059010(uint64_t a1)
{
  dispatch_semaphore_t v2 = (void **)(a1 + 32);
  unsigned int v3 = [*(id *)(a1 + 32) state];
  intptr_t v4 = *v2;
  if (v3 == 5)
  {
    unsigned int v5 = [v4 stopStreaming:0];
    if (v5)
    {
      signed int v6 = v5;
      uint64_t v7 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10007525C(v2, v7);
      }
      id v8 = (id *)(a1 + 32);
      uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Fail to send DoAP StopStream message - device state(%d)", [*(id *)(a1 + 32) state]);
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      id v22 = v9;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v11 = +[NSError errorWithDomain:NSMachErrorDomain code:v6 userInfo:v10];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v12 = [*(id *)(a1 + 32) doapAudioStart];
      dispatch_semaphore_signal(v12);

      id v13 = *v8;
      objc_sync_enter(v13);
      id v14 = [*v8 audioBuffer];
      [v14 removeAllObjects];

      objc_sync_exit(v13);
    }
    else
    {
      int v17 = +[NSDate date];
      [*(id *)(a1 + 32) setLastAudioDate:v17];

      id v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      [v18 waitForSiriAudioToStop:v19];
    }
  }
  else if ([v4 state] == 4)
  {
    [*(id *)(a1 + 32) stopStreaming:6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    unsigned int v15 = [*(id *)(a1 + 32) audioBuffer];
    [v15 removeAllObjects];

    objc_sync_exit(obj);
  }
  else
  {
    signed int v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v16();
  }
}

void sub_10005931C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1000595DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_1000595F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10005B024(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10005B520(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 showsInNotificationCenter])
        {
          uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 64);
          uint64_t v10 = [v8 sectionID];
          [v9 requestNoticesBulletinsForSectionID:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

id sub_10005B644(uint64_t a1)
{
  return _[*(id *)(a1 + 32) callStatusChanged];
}

id sub_10005B64C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) callHistoryChanged:1];
}

id sub_10005B658(uint64_t a1)
{
  return _[*(id *)(a1 + 32) voicemailsChanged:1];
}

void sub_10005B774(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bbObserver];
  [v1 invalidate];
}

id sub_10005B7B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:0];
}

void sub_10005C8F0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 tuIncomingCallAlerts];
  id v7 = [v5 objectForKey:v4];

  [*(id *)(a1 + 32) removeAlert:v7];
  uint64_t v6 = [*(id *)(a1 + 32) tuIncomingCallAlerts];
  [v6 removeObjectForKey:v4];
}

void sub_10005C990(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ANCIncomingCallAlert alloc];
  id v5 = [*(id *)(a1 + 32) tuCallCenter];
  id v7 = [(ANCIncomingCallAlert *)v4 initWithCall:v3 callCenter:v5];

  uint64_t v6 = [*(id *)(a1 + 32) tuIncomingCallAlerts];
  [v6 setObject:v7 forKey:v3];

  [*(id *)(a1 + 32) addAlert:v7 isPreExisting:0];
}

void sub_10005CA4C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 tuActiveCallAlerts];
  id v7 = [v5 objectForKey:v4];

  [*(id *)(a1 + 32) removeAlert:v7];
  uint64_t v6 = [*(id *)(a1 + 32) tuActiveCallAlerts];
  [v6 removeObjectForKey:v4];
}

void sub_10005CAEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ANCActiveCallAlert alloc];
  id v5 = [*(id *)(a1 + 32) tuCallCenter];
  id v7 = [(ANCActiveCallAlert *)v4 initWithCall:v3 callCenter:v5];

  uint64_t v6 = [*(id *)(a1 + 32) tuActiveCallAlerts];
  [v6 setObject:v7 forKey:v3];

  [*(id *)(a1 + 32) addAlert:v7 isPreExisting:0];
}

id sub_10005CD40(uint64_t a1)
{
  return _[*(id *)(a1 + 32) callHistoryChanged:0];
}

void sub_10005CF28(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 chMissedCallAlerts];
  uint64_t v6 = [v4 uniqueId];
  id v9 = [v5 objectForKeyedSubscript:v6];

  [*(id *)(a1 + 32) removeAlert:v9];
  id v7 = [*(id *)(a1 + 32) chMissedCallAlerts];
  id v8 = [v4 uniqueId];

  [v7 removeObjectForKey:v8];
}

void sub_10005CFF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ANCMissedCallAlert alloc];
  id v5 = [*(id *)(a1 + 32) chManager];
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  id v9 = [(ANCMissedCallAlert *)v4 initWithRecentCall:v3 manager:v5 queue:v6];

  id v7 = [*(id *)(a1 + 32) chMissedCallAlerts];
  id v8 = [v3 uniqueId];

  [v7 setObject:v9 forKeyedSubscript:v8];
  [*(id *)(a1 + 32) addAlert:v9 isPreExisting:*(unsigned __int8 *)(a1 + 40)];
}

id sub_10005D174(uint64_t a1)
{
  return _[*(id *)(a1 + 32) voicemailsChanged:0];
}

BOOL sub_10005D298(id a1, VMVoicemail *a2)
{
  dispatch_semaphore_t v2 = a2;
  if (([(VMVoicemail *)v2 isBlocked] & 1) != 0
    || ([(VMVoicemail *)v2 isDeleted] & 1) != 0
    || ([(VMVoicemail *)v2 isTrashed] & 1) != 0)
  {
    unsigned __int8 v3 = 0;
  }
  else
  {
    unsigned __int8 v3 = [(VMVoicemail *)v2 isUnread];
  }

  return v3;
}

void sub_10005D2F8(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 vvVoicemailAlerts];
  id v7 = [v5 objectForKey:v4];

  [*(id *)(a1 + 32) removeAlert:v7];
  uint64_t v6 = [*(id *)(a1 + 32) vvVoicemailAlerts];
  [v6 removeObjectForKey:v4];
}

void sub_10005D398(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ANCVoicemailAlert alloc];
  id v5 = [*(id *)(a1 + 32) vvManager];
  uint64_t v6 = [*(id *)(a1 + 32) lazyContactStore];
  id v7 = [*(id *)(a1 + 32) queue];
  id v9 = [(ANCVoicemailAlert *)v4 initWithVoicemail:v3 manager:v5 contactStore:v6 queue:v7];

  id v8 = [*(id *)(a1 + 32) vvVoicemailAlerts];
  [v8 setObject:v9 forKey:v3];

  [*(id *)(a1 + 32) addAlert:v9 isPreExisting:*(unsigned __int8 *)(a1 + 40)];
}

void sub_1000613C4(uint64_t a1)
{
  id v3 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 40)];
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) powerSourceDetails];
  [v2 setObject:v3 forKeyedSubscript:@"Current Capacity"];
}

void sub_1000615F4(uint64_t a1)
{
  unsigned int v2 = *(unsigned char *)(a1 + 40) & 3;
  if (v2 >= 2)
  {
    if (v2 == 2)
    {
      id v4 = [*(id *)(a1 + 32) powerSourceDetails];
      id v3 = v4;
      id v5 = &__kCFBooleanFalse;
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) powerSourceDetails];
      id v3 = v4;
      id v5 = &__kCFBooleanTrue;
    }
    [v4 setObject:v5 forKeyedSubscript:@"Is Present"];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) powerSourceDetails];
    [v3 removeObjectForKey:@"Is Present"];
  }

  unsigned int v6 = (*(unsigned __int8 *)(a1 + 40) >> 2) & 3;
  if (v6 >= 2)
  {
    if (v6 == 2)
    {
      id v8 = [*(id *)(a1 + 32) powerSourceDetails];
      id v7 = v8;
      CFStringRef v9 = @"AC Power";
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) powerSourceDetails];
      id v7 = v8;
      CFStringRef v9 = @"Battery Power";
    }
    [v8 setObject:v9 forKeyedSubscript:@"Power Source State"];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) powerSourceDetails];
    [v7 removeObjectForKey:@"Power Source State"];
  }

  unsigned int v10 = (*(unsigned __int8 *)(a1 + 40) >> 4) & 3;
  if (v10 >= 2)
  {
    if (v10 == 2)
    {
      long long v11 = [*(id *)(a1 + 32) powerSourceDetails];
      long long v12 = &__kCFBooleanFalse;
    }
    else
    {
      long long v11 = [*(id *)(a1 + 32) powerSourceDetails];
      long long v12 = &__kCFBooleanTrue;
    }
    id v13 = v11;
    [v11 setObject:v12 forKeyedSubscript:@"Is Charging"];
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) powerSourceDetails];
    [v13 removeObjectForKey:@"Is Charging"];
  }
}

id sub_10006251C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) batteryLevelDidChange];
}

void sub_100062918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100062984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100062B38(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if ([*(id *)(a1 + 32) state] == 1) {
    [*(id *)(a1 + 32) doapStateSet:2];
  }
  objc_sync_exit(v2);

  id v3 = [*(id *)(a1 + 32) service];
  [v3 doapDeviceDidStart];
}

void sub_100062BC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100062C48(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) doapStateSet:8];
  objc_sync_exit(v2);

  id v3 = [*(id *)(a1 + 32) service];
  [v3 doapDeviceDidStop];
}

void sub_100062CC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100062F10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100063080(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100063724(id a1)
{
  qword_1000CD160 = (uint64_t)objc_alloc_init((Class)HKHealthStore);

  _objc_release_x1();
}

void sub_100063D24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100075FF0(a1, v5, v4);
    }
  }
}

void sub_10006473C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DA38(a1, v5, v4);
    }
  }
}

void sub_100067738(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100076648(a1, v5, v4);
    }
  }
}

void sub_100067A8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100076648(a1, v5, v4);
    }
  }
}

void sub_100068834(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id sub_10006892C(void *a1, const char *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5)
{
  return [a1 getReport:a4 reportLength:a5 reportID:a3 reportType:a2];
}

id sub_100068944(void *a1, const char *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5)
{
  return [a1 setReport:a4 reportLength:a5 reportID:a3 reportType:a2];
}

void sub_100068E98(uint64_t a1, const void *a2)
{
  [*(id *)(a1 + 32) supportedCommandsDidChange:a2];

  CFRelease(a2);
}

id sub_100068ED8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) applicationDidChange:a2];
}

id sub_100068EE4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) playbackStateDidChange:a2];
}

id sub_100068EF0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) infoDidChange:a2];
}

void sub_100069F30(uint64_t a1, const void *a2)
{
  [*(id *)(a1 + 32) supportedCommandsDidChange:a2];

  CFRelease(a2);
}

id sub_100069FE4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) applicationDidChange:a2];
}

id sub_10006A064(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) playbackStateDidChange:a2];
}

id sub_10006A0EC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) infoDidChange:a2];
}

void sub_10006BE4C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Eu);
}

double sub_10006BE6C()
{
  return (double)v0 * 0.0009765625;
}

void sub_10006BE80(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "UDS reigster new user failed for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);
}

void sub_10006BF28(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "UDS consent procedure failed for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);
}

void sub_10006BFD0(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "UDS delete user data failed for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);
}

void sub_10006C078(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B80();
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "UDS CP Op timeout for peripheral \"%{private, mask.hash}@\" pendingOpCode %d", v5, 0x1Cu);
}

void sub_10006C13C()
{
  sub_100005C04();
  id v2 = v1;
  id v3 = [(id)sub_100005BF8() peripheral];
  id v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "UDS characteristic discovery failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_10006C1E4()
{
  sub_100005C04();
  id v2 = v1;
  id v3 = [(id)sub_100005BF8() peripheral];
  id v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "UDS characteristic update value failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_10006C28C()
{
  sub_100005C04();
  id v2 = v1;
  id v3 = [(id)sub_100005BF8() peripheral];
  id v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "UDS characteristic subscription failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_10006C334(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BF8() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005BD8((void *)&_mh_execute_header, v5, v6, "UDS CP invalid response value received from peripheral \"%{private, mask.hash}@\": invalid responseVal %d", v7, v8, v9, v10, v11);
}

void sub_10006C3EC()
{
  sub_100005C04();
  id v2 = v1;
  id v3 = [(id)sub_100005BF8() peripheral];
  id v4 = [v3 name];
  sub_100005B80();
  sub_100005BD8((void *)&_mh_execute_header, v5, v6, "UDS CP response for peripheral \"%{private, mask.hash}@\": OpCode %u not supported", v7, v8, v9, v10, v11);
}

void sub_10006C498(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": respValue parse failed", v7, v8, v9, v10, v11);
}

void sub_10006C540(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": requestedOpCode parse failed", v7, v8, v9, v10, v11);
}

void sub_10006C5E8()
{
  sub_100005C04();
  id v2 = v1;
  id v3 = [(id)sub_100005BF8() peripheral];
  id v4 = [v3 name];
  sub_100005B80();
  sub_100005BD8((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": invalid opCode %d", v7, v8, v9, v10, v11);
}

void sub_10006C694(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": opCode parse failed", v7, v8, v9, v10, v11);
}

void sub_10006C73C(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Unexpected User CP response for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);
}

void sub_10006C7E4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 identifier];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "createDatum for qty:%@ failed to soft link HKQuantity or HKQuantityDatum class", (uint8_t *)&v5, 0xCu);
}

void sub_10006C890(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v7 = [v5 name];
  uint64_t v8 = [*(id *)(a1 + 40) identifier];
  uint64_t v9 = [a3 userInfo];
  int v10 = 138412802;
  uint8_t v11 = v7;
  __int16 v12 = 2112;
  id v13 = v8;
  __int16 v14 = 2112;
  unsigned int v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "InsertDatums failed for “%@” - %@: %@", (uint8_t *)&v10, 0x20u);
}

void sub_10006C984(void *a1, void *a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = [a2 peripheral];
  uint64_t v7 = [v6 name];
  int v8 = 138412546;
  uint64_t v9 = v7;
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to create data collector for device “%@” quantity type %@", (uint8_t *)&v8, 0x16u);
}

void sub_10006CA54(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "createHKDevice called with null device", v1, 2u);
}

void sub_10006CA98(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 peripheral];
  int v5 = [v4 name];
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Could not create HKDevice for %@, could not soft load HKDevice class", (uint8_t *)&v6, 0xCu);
}

void sub_10006CB5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006CBD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006CC4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006CCC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006CD3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006CDB4(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 175;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "error 0x%08X with set feature reportID 0x%02x", (uint8_t *)v2, 0xEu);
}

void sub_10006CE3C(void *a1, void *a2)
{
  id v3 = a1;
  [a2 instanceID];
  sub_100010A98();
  sub_100010AA4((void *)&_mh_execute_header, v4, v5, "match for instance ID %u", v6, v7, v8, v9, v10);
}

void sub_10006CEC4(uint8_t *a1, void *a2, void *a3, unsigned int *a4)
{
  uint64_t v7 = a2;
  unsigned int v8 = [a3 instanceID];
  *(_DWORD *)a1 = 67109120;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Matched device management driver. Set Bond Management for instance ID %u", a1, 8u);
}

void sub_10006CF3C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Matched AppleMultitouchDevice", buf, 2u);
}

void sub_10006CF7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006CFF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D06C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D0E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D15C(void *a1, void *a2)
{
  id v3 = a1;
  [a2 buttonData];
  sub_100010A98();
  sub_100010AA4((void *)&_mh_execute_header, v4, v5, "Button 0x%04X", v6, v7, v8, v9, v10);
}

void sub_10006D1E8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Dropped multitouch data: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10006D268()
{
  sub_100010A88();
  sub_100010A4C((void *)&_mh_execute_header, v0, v1, "Dropped multitouch packet with kMTStage_BreakTouch for pathID %u", v2, v3, v4, v5, v6);
}

void sub_10006D2D0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 productID];
  sub_100010A98();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Input report for unknown productID 0x%02x", v4, 8u);
}

void sub_10006D368()
{
  sub_100010A98();
  sub_100010A4C((void *)&_mh_execute_header, v0, v1, "Unknown input report ID 0x%02x", v2, v3, v4, v5, v6);
}

void sub_10006D3D0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  sub_100010AC4((void *)&_mh_execute_header, a2, a3, "Invalid report ID 0x%02X expecting 0x%02X", 67109376, v3);
}

void sub_10006D44C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D4C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D53C()
{
  sub_100010A88();
  LOWORD(v3) = 1024;
  HIWORD(v3) = v0;
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "Invalid input report ID 0x%02X descriptor 0x%02X: both audio and inertial data present in descriptor", v2, v3);
}

void sub_10006D5B0(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 10;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out after %lld seconds waiting to start Siri", (uint8_t *)&v1, 0xCu);
}

void sub_10006D630()
{
  sub_100010A68();
  int v2 = 1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to start Siri: error 0x%08X with set feature reportID 0x%02X payload 0x%02X", v1, 0x14u);
}

void sub_10006D6AC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Stopping Siri session immediately.", v1, 2u);
}

void sub_10006D6F0()
{
  sub_100010A68();
  int v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to stop Siri: error 0x%08X with set feature reportID 0x%02X payload 0x%02X", v1, 0x14u);
}

void sub_10006D768(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to register endpoint \"%@\" with error %@", (uint8_t *)&v3, 0x16u);
}

void sub_10006D7F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to find endpoint for new pipe %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006D868(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to find endpoint for disconnected pipe %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006D8E0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  __int16 v5 = [v4 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v6, v7, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed.", v8, v9, v10, v11, v12);
}

void sub_10006D98C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  __int16 v5 = [v4 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v6, v7, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type.", v8, v9, v10, v11, v12);
}

void sub_10006DA38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  __int16 v5 = a2;
  uint64_t v6 = [v4 peripheral];
  uint64_t v7 = [v6 name];
  uint64_t v8 = [a3 userInfo];
  int v9 = 141558531;
  uint64_t v10 = 1752392040;
  __int16 v11 = 2113;
  uint8_t v12 = v7;
  __int16 v13 = 2114;
  __int16 v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Save sample for peripheral \"%{private, mask.hash}@\" failed : %{public}@", (uint8_t *)&v9, 0x20u);
}

void sub_10006DB30(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  __int16 v5 = [v4 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v6, v7, "Value for peripheral \"%{private, mask.hash}@\" parse failed", v8, v9, v10, v11, v12);
}

void sub_10006DBDC(void *a1, void *a2, unsigned __int16 *a3)
{
  __int16 v5 = a1;
  uint64_t v6 = [a2 peripheral];
  uint64_t v7 = [v6 name];
  int v8 = *a3;
  int v9 = 141558531;
  uint64_t v10 = 1752392040;
  __int16 v11 = 2113;
  uint8_t v12 = v7;
  __int16 v13 = 1024;
  int v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unit for peripheral \"%{private, mask.hash}@\": invalid unit %d", (uint8_t *)&v9, 0x1Cu);
}

void sub_10006DCC4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create device management interface", v2, v3, v4, v5, v6);
}

void sub_10006DCF8()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create touch interface", v2, v3, v4, v5, v6);
}

void sub_10006DD2C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create motion interface", v2, v3, v4, v5, v6);
}

void sub_10006DD60()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create haptics interface", v2, v3, v4, v5, v6);
}

void sub_10006DD94()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create firmware upgrade interface", v2, v3, v4, v5, v6);
}

void sub_10006DDC8()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create force interface", v2, v3, v4, v5, v6);
}

void sub_10006DDFC(void *a1, void *a2, char a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 loggingIdentifier];
  int v7 = 138412546;
  int v8 = v6;
  __int16 v9 = 1024;
  int v10 = a3 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ unexpectedly receiving authentication status: success=%{BOOL}d", (uint8_t *)&v7, 0x12u);
}

void sub_10006DEC0(os_log_t log)
{
  v1[0] = 67109376;
  v1[1] = 255;
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received reportID 0x%x on interface %u that collides with host generated report", (uint8_t *)v1, 0xEu);
}

void sub_10006DF4C()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Dev management Pipe connected", v1, 2u);
}

void sub_10006DF8C()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Dev management Pipe disconnected", v1, 2u);
}

void sub_10006DFCC()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Received 'connect classic device' message without a device address", v2, v3, v4, v5, v6);
}

void sub_10006E000()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Received 'disconnect classic device' message without a device address", v2, v3, v4, v5, v6);
}

void sub_10006E034()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Received 'classic device unexpected disconnection' message without a device address", v2, v3, v4, v5, v6);
}

void sub_10006E068()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'version info request' message", v2, v3, v4, v5, v6);
}

void sub_10006E09C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'version info response' message", v2, v3, v4, v5, v6);
}

void sub_10006E0D0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Received 'classic pair state request' message without a device address", v2, v3, v4, v5, v6);
}

void sub_10006E104()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'classic pair state response' message", v2, v3, v4, v5, v6);
}

void sub_10006E138()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'store classic link key request' message", v2, v3, v4, v5, v6);
}

void sub_10006E16C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'store classic link key response' message", v2, v3, v4, v5, v6);
}

void sub_10006E1A0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'store classic device settings' message", v2, v3, v4, v5, v6);
}

void sub_10006E1D4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'notifiy primary bud side' message", v2, v3, v4, v5, v6);
}

void sub_10006E208()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Received 'LEA easy pair request' message without a device address", v2, v3, v4, v5, v6);
}

void sub_10006E23C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'LEA easy pair response' message", v2, v3, v4, v5, v6);
}

void sub_10006E270()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'LEA store bonding info request' message", v2, v3, v4, v5, v6);
}

void sub_10006E2A4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'LEA store bonding info response' message", v2, v3, v4, v5, v6);
}

void sub_10006E2D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006E310(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "GenericSiriRemote dropping Audio frame as length : %ld is not sufficient", (uint8_t *)&v2, 0xCu);
}

void sub_10006E388(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006E3C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006E3F8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "activeHIDDeviceCount: %lu -> %lu", (uint8_t *)&v3, 0x16u);
}

void sub_10006E480(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  int v10 = [v4 name];
  sub_10001DF68();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x20u);
}

void sub_10006E558(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create HKDevice for %@, could not soft load HKDevice class", (uint8_t *)&v2, 0xCu);
}

void sub_10006E5D0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 peripheral];
  __int16 v5 = [v4 name];
  int v6 = 138412290;
  os_log_type_t v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "DeviceInformation update for %@ - No combo device to update", (uint8_t *)&v6, 0xCu);
}

void sub_10006E690(void *a1, void *a2, void *a3)
{
  id v6 = a1;
  os_log_type_t v7 = [(id)sub_10001DF90() name];
  int v8 = [a3 peripheral];
  __int16 v9 = [v8 identifier];
  int v10 = [v9 UUIDString];
  int v17 = [a2 userInfo];
  sub_10001DF9C((void *)&_mh_execute_header, v11, v12, "RECEIVED DEVICE INFO UPDATE NOTIFICATION - name:%@ device UUID:%@ notification userinfo:%@", v13, v14, v15, v16, 2u);
}

void sub_10006E794(void *a1, void *a2)
{
  id v4 = a1;
  __int16 v5 = [(id)sub_10001DF90() peripheral];
  id v6 = [v5 name];
  os_log_type_t v7 = [a2 cyclingPowerSensorLocationCharacteristic];
  int v8 = [v7 value];
  int v9 = 138412802;
  int v10 = v6;
  __int16 v11 = 2048;
  id v12 = [v8 length];
  __int16 v13 = 2048;
  uint64_t v14 = 1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Cycling Power Sensor Location Characteristic data length does not follow spec for %@, %lu bytes instead of %lu expected", (uint8_t *)&v9, 0x20u);
}

void sub_10006E898(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 peripheral];
  __int16 v5 = [v4 name];
  sub_10001DF78();
  sub_10001DF68();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x1Cu);
}

void sub_10006E960()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Could not create cycling speed HKQuantityType", v2, v3, v4, v5, v6);
}

void sub_10006E994()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Could not create cycling cadence HKQuantityType", v2, v3, v4, v5, v6);
}

void sub_10006E9C8()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Cadence data available but not requested", v2, v3, v4, v5, v6);
}

void sub_10006E9FC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  uint64_t v5 = [v4 name];
  sub_10001DF78();
  sub_10001DF68();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x12u);
}

void sub_10006EAB4(void *a1, void *a2, id *a3)
{
  id v6 = a1;
  os_log_t v7 = [(id)sub_10001DF90() peripheral];
  os_log_type_t v8 = [v7 name];
  int v9 = [*a3 quantity];
  [v9 _value];
  int v10 = [a2 sensorLocationSideString];
  sub_10001DF44();
  __int16 v13 = v11;
  CFStringRef v14 = @"no matching datum";
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed qty:%f (%{public}@) (held, %{public}@)", v12, 0x2Au);
}

void sub_10006EBC0(void *a1, void *a2, id *a3)
{
  id v6 = a1;
  os_log_t v7 = [(id)sub_10001DF90() peripheral];
  os_log_type_t v8 = [v7 name];
  int v9 = [*a3 quantity];
  [v9 _value];
  int v10 = [a2 sensorLocationSideString];
  sub_10001DF44();
  sub_10001DF9C((void *)&_mh_execute_header, v11, v12, "“%@” READ CP Measurement POWER distributed qty:%f (%{public}@) (held, other reading is too old to match)", v13, v14, v15, v16, v17);
}

void sub_10006ECAC()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing Power Control Point characteristic", v2, v3, v4, v5, v6);
}

void sub_10006ECE0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing Power Feature characteristic", v2, v3, v4, v5, v6);
}

void sub_10006ED14()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing Power Vector characteristic", v2, v3, v4, v5, v6);
}

void sub_10006ED48()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing Power Measurement characteristic", v2, v3, v4, v5, v6);
}

void sub_10006ED7C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create device mgnt interface", v2, v3, v4, v5, v6);
}

void sub_10006EDB0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create inertial interface", v2, v3, v4, v5, v6);
}

void sub_10006EDE4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create radio interface", v2, v3, v4, v5, v6);
}

void sub_10006EE18()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create force interface", v2, v3, v4, v5, v6);
}

void sub_10006EE4C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create force input report set", v2, v3, v4, v5, v6);
}

void sub_10006EE80()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create HID queue", v2, v3, v4, v5, v6);
}

void sub_10006EEB4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create semaphore", v2, v3, v4, v5, v6);
}

void sub_10006EEE8()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create notify queue", v2, v3, v4, v5, v6);
}

void sub_10006EF1C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v4, v5, "UDS consent failed for peripheral \"%{private, mask.hash}@\"", v6, v7, v8, v9, v10);
}

void sub_10006EFAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006EFE4()
{
  sub_100005C04();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100024290();
  sub_10002431C((void *)&_mh_execute_header, v5, v6, "Read property “%@” from \"%{private, mask.hash}@\" = “%@” and can't convert it to a number", v7, v8, v9, v10, v11);
}

void sub_10006F094(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006F0CC()
{
  sub_100005C04();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100024290();
  sub_10002431C((void *)&_mh_execute_header, v5, v6, "Read property \"%{public}@\" from \"%{private, mask.hash}@\" = \"%@\" and can't convert it to a number", v7, v8, v9, v10, v11);
}

void sub_10006F17C()
{
  sub_100005C04();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "Subscription characteristic failed for peripheral\"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_10006F224()
{
  sub_100005C04();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "Write characteristic failed for peripheral\"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_10006F2CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006F304(char a1, unsigned __int16 *a2, os_log_t log)
{
  uint64_t v3 = "stored";
  int v4 = *a2;
  if (a1) {
    uint64_t v3 = "live";
  }
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing observation type in %s health observation, flags: %u", (uint8_t *)&v5, 0x12u);
}

void sub_10006F3A8()
{
  sub_100005C04();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  int v4 = [v3 name];
  sub_1000242C8();
  sub_1000242FC((void *)&_mh_execute_header, v5, v6, "RACP response for peripheral \"%{private, mask.hash}@\": invalid opCode %d, expected opCode %d", v7, v8, v9, v10, v11);
}

void sub_10006F468(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  int v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "RACP response for peripheral \"%{private, mask.hash}@\": opCode parse failed", v7, v8, v9, v10, v11);
}

void sub_10006F510(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  int v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Request retrieve stored observation for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);
}

void sub_10006F5B8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  int v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Request retrieve last stored observation for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);
}

void sub_10006F660(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  int v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Request delete stored observation for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);
}

void sub_10006F708(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  int v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "GHS connection idle timeout for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);
}

void sub_10006F7B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received malformed command: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006F828(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 central];
  uint64_t v9 = [v8 identifier];
  *(_DWORD *)a1 = 138543362;
  *a4 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unauthorized central %{public}@ requested info via ANCS, rejecting.", a1, 0xCu);
}

void sub_10006F8C4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received event %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006F93C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create wake interface", v2, v3, v4, v5, v6);
}

void sub_10006F970()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create firmware upgrade interface", v2, v3, v4, v5, v6);
}

void sub_10006F9A4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create force interface", v2, v3, v4, v5, v6);
}

void sub_10006F9D8()
{
  sub_10002C79C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "XPC client connection: %@", v1, 0xCu);
}

void sub_10006FA4C()
{
  sub_10002C79C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "XPC error: %@", v1, 0xCu);
}

void sub_10006FAC0()
{
  sub_10002C79C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unexpected XPC event: %@", v1, 0xCu);
}

void sub_10006FB34(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 connection];
  sub_10002C79C();
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "XPC client disconnection: %@", v7, v8, v9, v10, v11);
}

void sub_10006FBC8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  sub_10002C79C();
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "Received XPC message: %@", v7, v8, v9, v10, v11);
}

void sub_10006FC5C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 UUIDString];
  [v4 UTF8String];
  sub_10002C79C();
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "handleUARPAACPTransportChangeMsg received from buds for UUID: %s", v7, v8, v9, v10, v11);
}

void sub_10006FCF8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 UUIDString];
  [v4 UTF8String];
  sub_10002C79C();
  __int16 v7 = 2048;
  uint64_t v8 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "handleUARPDataOverAACPMsg got data, uuid: %s length: %lu", v6, 0x16u);
}

void sub_10006FDC0()
{
  sub_10002C79C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Sending XPC message: %@", v1, 0xCu);
}

void sub_10006FE34()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "Unexpected Siri XPC server event: %@", v2, v3, v4, v5, v6);
}

void sub_10006FE9C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 siriXpcConnection];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "DoAPAudioRelayHub previous Siri XPC connection still exists (%p). Tear that down.", v7, v8, v9, v10, v11);
}

void sub_10006FF30(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 soundSensorXpcConnection];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "DoAPAudioRelayHub previous Sound Sensor XPC connection still exists (%p). Tear that down.", v7, v8, v9, v10, v11);
}

void sub_10006FFC4()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub unexpected applicationID %s", v2, v3, v4, v5, v6);
}

void sub_10007002C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No application ID. Good bye.", v2, v3, v4, v5, v6);
}

void sub_100070060()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Not an entitled process. Good bye.", v2, v3, v4, v5, v6);
}

void sub_100070094()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub XPC connection interrupted", v2, v3, v4, v5, v6);
}

void sub_1000700C8()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub XPC connection termination imminent", v2, v3, v4, v5, v6);
}

void sub_1000700FC()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub XPC connection code signing requirement", v2, v3, v4, v5, v6);
}

void sub_100070130()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub Unknown XPC connection error: %@", v2, v3, v4, v5, v6);
}

void sub_100070198()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "Unexpected DoAPAudioRelayHub XPC connection event: %@", v2, v3, v4, v5, v6);
}

void sub_100070200()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "handleMsg: No entitlements. Good bye.", v2, v3, v4, v5, v6);
}

void sub_100070234()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "handleMsg: No application ID. Good bye.", v2, v3, v4, v5, v6);
}

void sub_100070268()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No XPC connection for Siri Client", v2, v3, v4, v5, v6);
}

void sub_10007029C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No XPC connection for Sound Sensor Client", v2, v3, v4, v5, v6);
}

void sub_1000702D0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No XPC Connection to send Check-In reply msg", v2, v3, v4, v5, v6);
}

void sub_100070304()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "DoAPAudioRelayHub - Received StartStreamMsg from AVVC", v1, 2u);
}

void sub_100070344()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "DoAPAudioRelayHub - Received StopStreamMsg from AVVC", v1, 2u);
}

void sub_100070384()
{
  sub_10002C79C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "DoAPAudioRelayHub - Remove DoAPAudioRelay %@", v1, 0xCu);
}

void sub_1000703F8(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  uint8_t v6 = [(id)sub_100005BF8() peripheral];
  uint64_t v7 = [v6 name];
  int v8 = 141558531;
  uint64_t v9 = 1752392040;
  __int16 v10 = 2113;
  uint8_t v11 = v7;
  __int16 v12 = 1024;
  int v13 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "ETS characteristic invalid time sync source received from peripheral \"%{private, mask.hash}@\": invalid type %d", (uint8_t *)&v8, 0x1Cu);
}

void sub_1000704D8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "ETS characteristic discovery failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_100070584(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "ETS characteristic update value failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_100070630(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B54();
  sub_100005BB8((void *)&_mh_execute_header, v5, v6, "ETS characteristic subscription failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);
}

void sub_1000706DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070714(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007074C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100070784()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "LoggingManager - Unexpected XPC server event: %@", v2, v3, v4, v5, v6);
}

void sub_1000707EC()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "LoggingManager - XPC connection error: %@", v2, v3, v4, v5, v6);
}

void sub_100070854()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "LoggingManager - Unexpected XPC connection event: %@", v2, v3, v4, v5, v6);
}

void sub_1000708BC()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "LoggingManager - Unexpected XPC message: %s", v2, v3, v4, v5, v6);
}

void sub_100070924(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "LoggingManager - handleLogRetrievalRequest Invalid args", v1, 2u);
}

void sub_100070968(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 path];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "LoggingManager - Ignoring %@", a1, 0xCu);
}

void sub_1000709EC(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 localizedDescription];
  uint64_t v7 = [a3 path];
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint8_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "logRetrievalComplete - Failed to enumerate. Error: %@, Path: %@", (uint8_t *)&v8, 0x16u);
}

void sub_100070AC0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 name];
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "Ignore peripheral \"%@\" disconnection event", v7, v8, v9, v10, 2u);
}

void sub_100070B58(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 name];
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "Connection timed out for peripheral \"%@\"...", v7, v8, v9, v10, 2u);
}

void sub_100070BF0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Not tracking an Mfi peripheral", v1, 2u);
}

void sub_100070C34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Properties did change : %@", (uint8_t *)&v2, 0xCu);
}

void sub_100070CAC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "data with size %ld read : %@", (uint8_t *)&v3, 0x16u);
}

void sub_100070D34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to remove pipe \"%@\" as we weren't tracking it", (uint8_t *)&v2, 0xCu);
}

void sub_100070DAC(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 pipe];
  __int16 v5 = [v4 output];
  uint64_t v6 = [v5 streamError];
  uint64_t v7 = [v6 localizedDescription];
  int v8 = 138412290;
  uint64_t v9 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Encountered stream error while sending data: %@", (uint8_t *)&v8, 0xCu);
}

void sub_100070E94(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  int v8 = [a3 description];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to deserialize JSON message: %@", a1, 0xCu);
}

void sub_100070F18(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 pipe];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Received unexpected end of input stream on pipe %@", (uint8_t *)&v5, 0xCu);
}

void sub_100070FC0(void *a1, void *a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = [a2 name];
  int v7 = 138412546;
  int v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error discovering services on peripheral \"%@\": %@", (uint8_t *)&v7, 0x16u);
}

void sub_100071084(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000710F0(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 30;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%u consecutive timestamp errors detected. Muting further logs", (uint8_t *)v1, 8u);
}

void sub_100071170(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000711DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071254(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get any matched services (error=0x%X)", (uint8_t *)v2, 8u);
}

void sub_1000712CC()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No timestamp sync driver exists.", v2, v3, v4, v5, v6);
}

void sub_100071300()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No <Timestamp Sync Period> key found", v2, v3, v4, v5, v6);
}

void sub_100071334()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No <Timestamp Sync Count> key found", v2, v3, v4, v5, v6);
}

void sub_100071368()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "No <Last Timestamp Sync> key found", v2, v3, v4, v5, v6);
}

void sub_10007139C(int *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Timestamp not received in %lluus (period %ums). Checking if timestamp sync is disabled.", (uint8_t *)&v4, 0x12u);
}

void sub_100071428()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Last BT tsync unreliable. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_10007145C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 UUID];
  uint8_t v6 = [*(id *)(a1 + 40) name];
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Service \"%@\" has timed out on peripheral \"%@\"", (uint8_t *)&v7, 0x16u);
}

void sub_100071530()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Error creating HID device", v2, v3, v4, v5, v6);
}

void sub_100071564(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000715D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007163C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Not creating HID device as the link is not encrypted", v2, v3, v4, v5, v6);
}

void sub_100071670()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing hid information characteristic", v2, v3, v4, v5, v6);
}

void sub_1000716A4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing report characteristics", v2, v3, v4, v5, v6);
}

void sub_1000716D8()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing report map characteristic", v2, v3, v4, v5, v6);
}

void sub_10007170C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint8_t v6 = [a3 reportTypeToString:[a2 type]];
  [a2 ID];
  sub_100040B90();
  sub_100040BA8((void *)&_mh_execute_header, v7, v8, "Did set %@ report for ID #%u", v9, v10, v11, v12, v13);
}

void sub_1000717C0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint8_t v6 = [a3 reportTypeToString:[a2 type]];
  [a2 ID];
  sub_100040B90();
  sub_100040BA8((void *)&_mh_execute_header, v7, v8, "Started notifications on %@ report for ID #%u", v9, v10, v11, v12, v13);
}

void sub_100071874()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing report reference descriptor", v2, v3, v4, v5, v6);
}

void sub_1000718A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071914()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Entering suspend mode", v1, 2u);
}

void sub_100071954()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Exiting suspend mode", v1, 2u);
}

void sub_100071994(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find %@ report characteristic for ID #%u", buf, 0x12u);
}

void sub_1000719FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071A34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071A6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100071AA4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing Body Sensor Location characteristic", v1, 2u);
}

void sub_100071AE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing Heart Rate Measurement characteristic", v1, 2u);
}

void sub_100071B2C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint8_t v6 = [a2 UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [a3 debugDescription];
  sub_100043BFC();
  sub_100043C14((void *)&_mh_execute_header, v9, v10, "Error discovering characteristics for service %@: %@", v11, v12, v13, v14, v15);
}

void sub_100071BF0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint8_t v6 = [a2 UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [a3 debugDescription];
  sub_100043BFC();
  sub_100043C14((void *)&_mh_execute_header, v9, v10, "Error reading HRM characteristic %@: %@", v11, v12, v13, v14, v15);
}

void sub_100071CB4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint8_t v6 = [a2 UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [a3 debugDescription];
  sub_100043BFC();
  sub_100043C14((void *)&_mh_execute_header, v9, v10, "Error setting notify state for HRM characteristic %@: %@", v11, v12, v13, v14, v15);
}

void sub_100071D78(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 length];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "HRM packet too small: %lu bytes", (uint8_t *)&v4, 0xCu);
}

void sub_100071E14(unsigned __int16 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Heart rate measurement: %d", (uint8_t *)v3, 8u);
}

void sub_100071E90()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDSampleFrequency (2nd byte) - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100071EF8()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDSampleFrequency - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100071F60()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDChannel - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100071FC8()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDAllocMethod - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100072030(unsigned __int8 a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a1;
  sub_100010AC4((void *)&_mh_execute_header, a2, a3, "kDoAPCodecAttributeIDBitrate - Read length (%u) exceeded data length (%u)", 67109376, v3);
}

void sub_1000720B0()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDBlocks - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100072118()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDSubbands - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100072180()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDMinBitpool - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_1000721E8()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDMaxBitpool - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100072250()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDObjectType - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_1000722B8()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDVBR - Read length (%u) exceeded data length (%u)", v2, v3);
}

void sub_100072320()
{
  sub_100046AF0();
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "Read length (%u) exceeded data length (%u). Could not get value length.", v2, v3);
}

void sub_100072388(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error creating DoAP device", buf, 2u);
}

void sub_1000723C8(unsigned __int8 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "DoAP Number of stream client %u", (uint8_t *)v2, 8u);
}

void sub_100072444()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAP Missing SupportedCodecs characteristic", v2, v3, v4, v5, v6);
}

void sub_100072478()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAP Missing SelectedCodec characteristic", v2, v3, v4, v5, v6);
}

void sub_1000724AC()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAP Missing StartStreaming characteristic", v2, v3, v4, v5, v6);
}

void sub_1000724E0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAP Missing StopStreaming characteristic", v2, v3, v4, v5, v6);
}

void sub_100072514()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAP Missing SendData characteristic", v2, v3, v4, v5, v6);
}

void sub_100072548()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAP Missing EventIndicatior characteristic", v2, v3, v4, v5, v6);
}

void sub_10007257C(void *a1, void *a2)
{
  id v3 = a1;
  [a2 UUID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [[(id)sub_100046B10() uuidToString:];
  sub_100046B20((void *)&_mh_execute_header, v5, v6, "DoAP Started notifications on %@ characteristic", v7, v8, v9, v10, 2u);
}

void sub_100072630(void *a1, void *a2)
{
  id v3 = a1;
  [a2 UUID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [sub_100046B10() uuidToString:];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "DoAP Missing CCCD for %@ chracteristic", (uint8_t *)&v5, 0xCu);
}

void sub_1000726F4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 UUID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [sub_100046B10() uuidToString];
  sub_100046B20((void *)&_mh_execute_header, v5, v6, "DoAP Found CCCD for %@ chracteristic", v7, v8, v9, v10, 2u);
}

void sub_1000727A8()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "DoAPService writeData", v1, 2u);
}

void sub_1000727E8()
{
  sub_100010A98();
  sub_100010A4C((void *)&_mh_execute_header, v0, v1, "DoAP StopStreaming length(%d) is too short", v2, v3, v4, v5, v6);
}

void sub_100072850()
{
  sub_100010A98();
  sub_100010A4C((void *)&_mh_execute_header, v0, v1, "DoAP Received data is too short %d", v2, v3, v4, v5, v6);
}

void sub_1000728B8(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 2);
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "DoAP Receive data, packet#[%d] payload length %d", (uint8_t *)v4, 0xEu);
}

void sub_100072944()
{
  sub_100010A98();
  LOWORD(v3) = 1024;
  HIWORD(v3) = v0;
  sub_100010AC4((void *)&_mh_execute_header, v0, v1, "DoAP Received payload length(%d) is different to sent length(%d)", v2, v3);
}

void sub_1000729B8()
{
  sub_100010A98();
  sub_100010A4C((void *)&_mh_execute_header, v0, v1, "DoAP EventIndicator length(%d) is too short", v2, v3, v4, v5, v6);
}

void sub_100072A20()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Invalid DoAP characteristic", v2, v3, v4, v5, v6);
}

void sub_100072A54(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 characteristic];
  uint64_t v7 = [v6 UUID];
  uint64_t v8 = [a2 value];
  int v9 = 134218498;
  uint64_t v10 = a3;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Responding with result %ld to request on characteristic \"%@\": %@", (uint8_t *)&v9, 0x20u);
}

void sub_100072B48(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 pendingUpdates];
  [v4 count];
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "Queued update, %lu pending", v7, v8, v9, v10, 0);
}

void sub_100072BE4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 UUID];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating value on characteristic \"%@\": %@", (uint8_t *)&v7, 0x16u);
}

void sub_100072CA4(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 central];
  int v7 = [a3 nameForCentral:v6];
  uint64_t v8 = [a2 characteristic];
  __int16 v9 = [v8 UUID];
  int v10 = 138412546;
  __int16 v11 = v7;
  __int16 v12 = 2112;
  __int16 v13 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Central \"%@\" sent a read request on characteristic \"%@\"", (uint8_t *)&v10, 0x16u);
}

void sub_100072DA8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 pendingUpdates];
  [v4 count];
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "Ready to send updates, %lu pending", v7, v8, v9, v10, 0);
}

void sub_100072E44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100072E7C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100072EE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100072F54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100072F8C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100072FF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100073030()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create device mgnt interface", v2, v3, v4, v5, v6);
}

void sub_100073064()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to create touch interface", v2, v3, v4, v5, v6);
}

void sub_100073098(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 8;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid super packet header: %u bytes length < %u", (uint8_t *)v2, 0xEu);
}

void sub_100073120()
{
  sub_10004BF88();
  int v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Invalid super packet payload: %u bytes length < %u", v2, 0xEu);
}

void sub_1000731A0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "handleInputReportData: 0.1C excess charge data = %u", (uint8_t *)v2, 8u);
}

void sub_100073218(void *a1, void *a2)
{
  int v3 = a1;
  id v4 = [a2 description];
  int v5 = 136315138;
  id v6 = [v4 UTF8String];
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "piconetClockNotification: %s", (uint8_t *)&v5, 0xCu);
}

void sub_1000732C8()
{
  sub_10004BF5C(__stack_chk_guard);
  sub_10004BF44();
  sub_10004BF68((void *)&_mh_execute_header, v0, v1, "Failed to retrieve charge state, result: %d, length: %ld", v2, v3);
}

void sub_100073330()
{
  sub_10004BF5C(__stack_chk_guard);
  sub_10004BF08();
  sub_10004BF24((void *)&_mh_execute_header, v0, v1, "chargeStateCollection: retrieve report 0x%02x, uint64_t result = 0x%08x, length = %d", 67109632, v2, v3);
}

void sub_1000733A0()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Start stiction collection timer", v1, 2u);
}

void sub_1000733E0()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Stop stiction collection timer", v1, 2u);
}

void sub_100073420(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "stictionCollectionGate: stictionCollection uint64_t result = 0x%08x", (uint8_t *)v2, 8u);
}

void sub_100073498(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A30((void *)&_mh_execute_header, a1, a3, "stictionCollectionGate: delta_time = %lf", a5, a6, a7, a8, 0);
}

void sub_100073508(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A30((void *)&_mh_execute_header, a1, a3, "stictionCollectionGate: get timestamp of stiction collection = %lf", a5, a6, a7, a8, 0);
}

void sub_100073578()
{
  sub_10004BF5C(__stack_chk_guard);
  sub_10004BF08();
  sub_10004BF24((void *)&_mh_execute_header, v0, v1, "stictionCollection: retrieve report 0x%02x, uint64_t result = 0x%08x, length = %d", 67109632, v2, v3);
}

void sub_1000735E8()
{
  sub_10004BF5C(__stack_chk_guard);
  sub_10004BF08();
  sub_10004BF24((void *)&_mh_execute_header, v0, v1, "stictionCollection: retrieve report 0x%02x, uint64_t result = 0x%08x, length = %d", 67109632, v2, v3);
}

void sub_100073658()
{
  sub_10004BF88();
  int v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "stictionCollection: set      report 0x%02x, uint64_t result = 0x%08x", v2, 0xEu);
}

void sub_1000736D8()
{
  sub_10004BF5C(__stack_chk_guard);
  sub_10004BF44();
  sub_10004BF68((void *)&_mh_execute_header, v0, v1, "OOB Query failed with ret=%x, length=%ld", v2, v3);
}

void sub_100073740(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A30((void *)&_mh_execute_header, a2, a3, "OOB Query returned %@", a5, a6, a7, a8, 2u);
}

void sub_1000737AC()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Could not create CoreAccessory connection", v2, v3, v4, v5, v6);
}

void sub_1000737E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Bluetooth is restricted", v1, 2u);
}

void sub_100073824(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 UUID];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error publishing service \"%@\": %@", (uint8_t *)&v7, 0x16u);
}

void sub_1000738E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "XPC server error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10007395C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected XPC server event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000739D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC client does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_100073A18(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed.", v7, v8, v9, v10, v11);
}

void sub_100073AC0(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type.", v7, v8, v9, v10, v11);
}

void sub_100073B68(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  uint64_t v5 = [v4 name];
  sub_100005B14();
  sub_100005BD8((void *)&_mh_execute_header, v6, v7, "Observation type for peripheral \"%{private, mask.hash}@\" not supported : %d", v8, v9, v10, v11, v12);
}

void sub_100073C24(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", v7, v8, v9, v10, v11);
}

void sub_100073CCC(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Peripheral \"%{private, mask.hash}@\" observation value parse failed", v7, v8, v9, v10, v11);
}

void sub_100073D74(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  uint8_t v11 = [v4 name];
  sub_100005BD8((void *)&_mh_execute_header, v5, v6, "Unit for peripheral \"%{private, mask.hash}@\": invalid unit %d", v7, v8, v9, v10, 3u);
}

void sub_100073E4C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "registerWithHealthKit - Missing HealthKit framework", v2, v3, v4, v5, v6);
}

void sub_100073E80()
{
  sub_100014060();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "registerWithHealthKit - Fitness callback already registered with HealthKit", v1, 2u);
}

void sub_100073EC0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing HealthKit framework", v2, v3, v4, v5, v6);
}

void sub_100073EF4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Received END WORKOUT call from HealthKit while not in workout. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_100073F28(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() debugDescription];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v4, v5, "Error retrieving tagged peripherals: %@", v6, v7, v8, v9, v10);
}

void sub_100073FB8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() debugDescription];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v4, v5, "Error retrieving peripherals with fitness custom property: %@", v6, v7, v8, v9, v10);
}

void sub_100074048(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() debugDescription];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v4, v5, "Error retrieving peripherals with Fitness custom property: %@", v6, v7, v8, v9, v10);
}

void sub_1000740D8()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "connectPeripheral: uuid was NULL", v2, v3, v4, v5, v6);
}

void sub_10007410C()
{
  sub_100053FD0();
  sub_100053FE8((void *)&_mh_execute_header, v0, v1, "Register qty %@ for service UUID %@");
}

void sub_100074174()
{
  sub_100053FD0();
  sub_100053FE8((void *)&_mh_execute_header, v0, v1, "Register unit %@ for qty %@");
}

void sub_1000741DC()
{
  sub_100053FD0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not register unit %@ for qty %@ - could not soft link HealthKit classes", v1, 0x16u);
}

void sub_100074254()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failed to load AudioAccessoryServices", v2, v3, v4, v5, v6);
}

void sub_100074288(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() description];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v4, v5, "Error activating audio routing control: %@", v6, v7, v8, v9, v10);
}

void sub_100074318(char a1, NSObject *a2)
{
  CFStringRef v2 = @"stopping";
  if (a1) {
    CFStringRef v2 = @"starting";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Notify SmartRouting HRM session state changed: %@ collection", (uint8_t *)&v3, 0xCu);
}

void sub_1000743A8(void *a1)
{
  id v2 = a1;
  int v3 = [(id)sub_100005BAC() description];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v4, v5, "Error notifying HRM session state changed: %@", v6, v7, v8, v9, v10);
}

void sub_100074438(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 identifier];
  uint64_t v9 = [v8 UUIDString];
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to migrate HealthKit HRM with identifier %@. CBPeripheral does not exist", a1, 0xCu);
}

void sub_1000744D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_100005BAC() identifier];
  uint64_t v5 = [v4 UUIDString];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v6, v7, "Failed to get HKHealthService enabled status during HRM migration for identifier %@", v8, v9, v10, v11, v12);
}

void sub_10007457C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_100005BAC() identifier];
  uint64_t v5 = [v4 UUIDString];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v6, v7, "Failed to remove HKHealthService pairing during HRM migration for identifier %@", v8, v9, v10, v11, v12);
}

void sub_100074624()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "accessoryReachable failed! uarpAccessory:%@", v2, v3, v4, v5, v6);
}

void sub_10007468C()
{
  sub_10002C79C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "addAccessory failed! uarpAccessory:%@ uarpAssetID:%@", v2, 0x16u);
}

void sub_100074710(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100074748()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "removeAccessory failed! uarpAccessory:%@", v2, v3, v4, v5, v6);
}

void sub_1000747B0()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "accessoryUnreachable failed! uarpAccessory:%@", v2, v3, v4, v5, v6);
}

void sub_100074818()
{
  sub_10002C79C();
  sub_10002E854((void *)&_mh_execute_header, v0, v1, "Error creating bluetooth UARP logs directory:%@", v2, v3, v4, v5, v6);
}

void sub_100074880(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 UUIDString];
  [v4 UTF8String];
  sub_10002C79C();
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "addUARPTransportDict: adding UUID: %s", v7, v8, v9, v10, v11);
}

void sub_10007491C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 UUIDString];
  [v4 UTF8String];
  sub_10002C79C();
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "getAndRemoveFromUARPTransportDict: did not find anything for UUID: %s", v7, v8, v9, v10, v11);
}

void sub_1000749B8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 UUIDString];
  [v4 UTF8String];
  sub_10002C79C();
  sub_10002C7A8((void *)&_mh_execute_header, v5, v6, "getAndRemoveFromUARPTransportDict: got for UUID: %s", v7, v8, v9, v10, v11);
}

void sub_100074A54(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = [a2 UUIDString];
  [v6 UTF8String];
  [a3 length];
  sub_1000554A4((void *)&_mh_execute_header, v7, v8, "relayAACPUARP - accessory UUID:%s msgLength:%lu", v9, v10, v11, v12, 2u);
}

void sub_100074B18(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 length];
  sub_1000554A4((void *)&_mh_execute_header, v5, v6, "sendMessageToAccessory - accessory:%@ msgLength:%lu", v7, v8, v9, v10, 2u);
}

void sub_100074BBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100074BF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100074C2C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAP Siri remote device doesn't have proper codec", v2, v3, v4, v5, v6);
}

void sub_100074C60()
{
  sub_100010A98();
  sub_1000595DC((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Send startStreaming failed %u", v2);
}

void sub_100074CCC()
{
  sub_100010A98();
  sub_1000595DC((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Send eventIndicator failed %u", v2);
}

void sub_100074D38()
{
  sub_10002C79C();
  sub_1000595F4((void *)&_mh_execute_header, v0, v1, "DoAPSiri - activateSiri: Invalid Siri Activation event %tu", v2);
}

void sub_100074DA4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  sub_10002C79C();
  sub_1000595F4((void *)&_mh_execute_header, v3, v5, "DoAPSiri - activateSiri: SiriActivation failed: %@", v6);
}

void sub_100074E44(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  sub_10002C79C();
  sub_1000595F4((void *)&_mh_execute_header, v3, v5, "DoAPSiri - SiriCancellation failed with error:%@", v6);
}

void sub_100074EE0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPSiri - handleAudioData: XPC connection lost", v2, v3, v4, v5, v6);
}

void sub_100074F14()
{
  sub_100010A98();
  sub_1000595DC((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Invalid DoAP Siri Event type (%u)", v2);
}

void sub_100074F80(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 state];
  sub_100010A98();
  sub_1000595DC((void *)&_mh_execute_header, v3, v4, "DoAPSiri - Doap state %d mismatch for Button Event", v5);
}

void sub_100075014()
{
  sub_10002C79C();
  sub_1000595F4((void *)&_mh_execute_header, v0, v1, "DoAPSiri - SiriMyriad Score rejected: %@", v2);
}

void sub_100075080()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPSiri - No valid remote device, ignore DoAPSiri AudioStart request", v2, v3, v4, v5, v6);
}

void sub_1000750B4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = 10;
  sub_1000595F4((void *)&_mh_execute_header, a1, a3, "DoAPSiri - Timed out after %lld seconds waiting to start Siri", (uint8_t *)&v3);
}

void sub_10007512C(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  int v3 = a2;
  [v2 state];
  sub_100010A98();
  sub_1000595DC((void *)&_mh_execute_header, v3, v4, "DoAPSiri - Fail to send DoAP StartStream message - device state(%d)", v5);
}

void sub_1000751C0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPSiri - No valid remote device, skip DoAPSiri AudioToStop", v2, v3, v4, v5, v6);
}

void sub_1000751F4()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Stopping Siri session immediately.", v2, v3, v4, v5, v6);
}

void sub_100075228()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "DoAPSiri - No valid remote device, ignore DoAPSiri AudioStop request", v2, v3, v4, v5, v6);
}

void sub_10007525C(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  [v2 state];
  sub_100010A98();
  sub_1000595DC((void *)&_mh_execute_header, v3, v4, "DoAPSiri - Fail to send DoAP StopStream message - device state(%d)", v5);
}

void sub_1000752F0(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ignoring request to add ellipsis as there is insufficient space. bufferMaxLength = %lu", (uint8_t *)&v2, 0xCu);
}

void sub_100075368(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  uint64_t v5 = [v4 name];
  uint8_t v6 = [a2 versionCharacteristic];
  uint64_t v7 = [v6 value];
  sub_10005B014();
  sub_10005B024((void *)&_mh_execute_header, v8, v9, "Invalid version for peripheral \"%@\": %@", v10, v11, v12, v13, 2u);
}

void sub_100075448()
{
  sub_100005C04();
  id v4 = v3;
  uint64_t v5 = [(id)sub_100005BF8() peripheral];
  uint8_t v6 = [v5 name];
  CFDictionaryGetValue((CFDictionaryRef)[v1 authInfo], v0);
  sub_10005B014();
  sub_1000554A4((void *)&_mh_execute_header, v7, v8, "Issuing challenge for peripheral \"%@\": %@", v9, v10, v11, v12, 2u);
}

void sub_100075510(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "Certificate invalid for peripheral \"%@\"", v7, v8, v9, v10, v11);
}

void sub_1000755B8()
{
  sub_100005C04();
  id v4 = v3;
  uint64_t v5 = [(id)sub_100005BF8() peripheral];
  uint64_t v6 = [v5 name];
  CFDictionaryGetValue((CFDictionaryRef)[v1 authInfo], v0);
  sub_10005B014();
  sub_1000554A4((void *)&_mh_execute_header, v7, v8, "Read certificate for peripheral \"%@\": %@", v9, v10, v11, v12, 2u);
}

void sub_100075680()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Failure to read the auth version", v2, v3, v4, v5, v6);
}

void sub_1000756B4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received notification that the response is ready for peripheral \"%@\"", v5, 0xCu);
}

void sub_10007576C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "Challenge response invalid for peripheral \"%@\"", v7, v8, v9, v10, v11);
}

void sub_100075814()
{
  sub_100005C04();
  id v4 = v3;
  uint64_t v5 = [(id)sub_100005BF8() peripheral];
  uint64_t v6 = [v5 name];
  CFDictionaryGetValue((CFDictionaryRef)[v1 authInfo], v0);
  sub_10005B014();
  sub_1000554A4((void *)&_mh_execute_header, v7, v8, "Read response for peripheral \"%@\": %@", v9, v10, v11, v12, 2u);
}

void sub_1000758DC(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  id v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "Still no response notification, attempting a last ditch read on peripheral \"%@\"", v7, v8, v9, v10, v11);
}

void sub_100075984(void *a1, void *a2)
{
  id v4 = a1;
  [a2 authStateString];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)sub_100005BF8() peripheral];
  uint64_t v6 = [v5 name];
  sub_10005B014();
  sub_10005B024((void *)&_mh_execute_header, v7, v8, "Authentication has timed out (%@) on peripheral \"%@\"", v9, v10, v11, v12, 2u);
}

void sub_100075A48()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing challenge characteristics", v2, v3, v4, v5, v6);
}

void sub_100075A7C()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing certificate characteristics", v2, v3, v4, v5, v6);
}

void sub_100075AB0()
{
  sub_100014060();
  sub_100014044((void *)&_mh_execute_header, v0, v1, "Missing version characteristic", v2, v3, v4, v5, v6);
}

void sub_100075AE4()
{
  sub_100005C04();
  id v3 = v2;
  uint64_t v4 = [(id)sub_100005BF8() peripheral];
  uint64_t v5 = [v4 name];
  sub_10002C79C();
  __int16 v7 = 2112;
  uint64_t v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to read challenge response for peripheral \"%@\": %@", v6, 0x16u);
}

void sub_100075BA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error encountered resolving behavior via DND. Defaulting isSilent to NO. error=%@", (uint8_t *)&v2, 0xCu);
}

void sub_100075C20(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 recentCall];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Unable to create a TUCallProvider for call %@", (uint8_t *)&v5, 0xCu);
}

void sub_100075CC8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing battery level characteristic", v1, 2u);
}

void sub_100075D0C(void *a1, void *a2, int a3)
{
  int v5 = a1;
  uint8_t v6 = [a2 peripheral];
  __int16 v7 = [v6 name];
  int v8 = 138412546;
  uint64_t v9 = v7;
  __int16 v10 = 1024;
  int v11 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to update the power source for peripheral \"%@\": 0x%X", (uint8_t *)&v8, 0x12u);
}

void sub_100075DDC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "DoAP eventIndicator write value - Invalid event type(0x%02x)", (uint8_t *)v2, 8u);
}

void sub_100075E54(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "eventIndicator for SoundSensorClient not implemented yet", v1, 2u);
}

void sub_100075E98(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  int v5 = [v4 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v6, v7, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported device type.", v8, v9, v10, v11, v12);
}

void sub_100075F44(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  int v5 = [v4 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v6, v7, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported device type.", v8, v9, v10, v11, v12);
}

void sub_100075FF0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  int v5 = a2;
  uint64_t v6 = [v4 peripheral];
  uint64_t v7 = [v6 name];
  uint64_t v8 = [a3 userInfo];
  int v9 = 141558531;
  uint64_t v10 = 1752392040;
  __int16 v11 = 2113;
  uint8_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request authorization to share sample types for peripheral \"%{private, mask.hash}@\" failed : %{public}@", (uint8_t *)&v9, 0x20u);
}

void sub_1000760E8(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100064C38();
  sub_100005BD8((void *)&_mh_execute_header, v5, v6, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type %d.", v7, v8, v9, v10, v11);
}

void sub_100076194(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v5, v6, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);
}

void sub_10007623C(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100064C38();
  sub_100005BD8((void *)&_mh_execute_header, v5, v6, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type %d.", v7, v8, v9, v10, v11);
}

void sub_1000762E8(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BF8() peripheral];
  uint64_t v4 = [v3 name];
  sub_100005B80();
  sub_100005BD8((void *)&_mh_execute_header, v5, v6, "Unit for peripheral \"%{private, mask.hash}@\": invalid unit %d", v7, v8, v9, v10, v11);
}

void sub_100076398(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100076404(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100076470(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported UARP accessory!", v1, 2u);
}

void sub_1000764B4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "peripheral:didUpdateNotificationStateForCharacteristic: loggingSuperbinaryURL %@", (uint8_t *)&v3, 0xCu);
}

void sub_100076530(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007659C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  uint64_t v5 = [v4 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v6, v7, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type.", v8, v9, v10, v11, v12);
}

void sub_100076648(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 peripheral];
  uint64_t v7 = [v6 name];
  uint64_t v8 = [a3 userInfo];
  sub_100068808();
  sub_100068834((void *)&_mh_execute_header, v9, v10, "Save sample for peripheral \"%{private, mask.hash}@\" failed : %{public}@", v11, v12, v13, v14, v15);
}

void sub_10007670C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported observation type in live/stored health observation", buf, 2u);
}

void sub_10007674C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported observation class type, only numeric type are supported for compound observation", buf, 2u);
}

void sub_10007678C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  id v5 = [v4 name];
  sub_100005B14();
  sub_100005B34((void *)&_mh_execute_header, v6, v7, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", v8, v9, v10, v11, v12);
}

void sub_100076838(void *a1, void *a2, unsigned __int16 *a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 peripheral];
  uint64_t v7 = [v6 name];
  int v8 = *a3;
  int v9 = 141558531;
  uint64_t v10 = 1752392040;
  __int16 v11 = 2113;
  uint8_t v12 = v7;
  __int16 v13 = 1024;
  int v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unit for peripheral \"%{private, mask.hash}@\": heart rate invalid unit %d", (uint8_t *)&v9, 0x1Cu);
}

void sub_100076920(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 peripheral];
  uint64_t v7 = [v6 name];
  int v8 = 138412802;
  CFStringRef v9 = @"wheelCircumferenceMM";
  __int16 v10 = 2112;
  __int16 v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Read property “%@” from “%@” = “%@” and can't convert it to a number", (uint8_t *)&v8, 0x20u);
}

void sub_100076A00(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "“%@” Could not create cycling cadence HKQuantityType", v7, v8, v9, v10, v11);
}

void sub_100076AA8(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "“%@” cadence data available but not requested", v7, v8, v9, v10, v11);
}

void sub_100076B50(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  uint64_t v5 = [v4 name];
  sub_10006BE6C();
  sub_10006BE10();
  sub_10006BE4C((void *)&_mh_execute_header, v6, v7, "“%@” READ CSC Measurement CADENCE, CrankRev:%d (0x%04X) last Crank Event Time:%d (0x%04X) (%f in sec)", v8, v9, v10, v11, v12);
}

void sub_100076C0C(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "“%@” Could not create cycling speed HKQuantityType", v7, v8, v9, v10, v11);
}

void sub_100076CB4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 peripheral];
  uint64_t v5 = [v4 name];
  sub_10006BE6C();
  sub_10006BE10();
  sub_10006BE4C((void *)&_mh_execute_header, v6, v7, "“%@” READ CSC Measurement SPEED, CumWheelRev:%d (0x%08X) last Wheel Event Time:%d (0x%04X) (%f in sec)", v8, v9, v10, v11, v12);
}

void sub_100076D70(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "updatedControlPointCharacteristicValue - “%@”", v5, 0xCu);
}

void sub_100076E28(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "“%@” - Missing Cadence & Speed Control Point characteristic", v7, v8, v9, v10, v11);
}

void sub_100076ED0(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "“%@” - Missing Cadence & Speed Feature characteristic", v7, v8, v9, v10, v11);
}

void sub_100076F78(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100005BAC() peripheral];
  uint64_t v4 = [v3 name];
  sub_10002C79C();
  sub_10002E870((void *)&_mh_execute_header, v5, v6, "“%@” - Missing Cadence & Speed Measurement characteristic", v7, v8, v9, v10, v11);
}

uint64_t AFSiriActivationBluetoothDeviceButtonPress()
{
  return _AFSiriActivationBluetoothDeviceButtonPress();
}

uint64_t AFSiriActivationBluetoothDeviceButtonRelease()
{
  return _AFSiriActivationBluetoothDeviceButtonRelease();
}

uint64_t AFSiriActivationBluetoothDeviceDoubleTap()
{
  return _AFSiriActivationBluetoothDeviceDoubleTap();
}

uint64_t AFSiriActivationBluetoothDeviceVoice()
{
  return _AFSiriActivationBluetoothDeviceVoice();
}

uint64_t AFSiriActivationHearstBoron()
{
  return _AFSiriActivationHearstBoron();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return _CFNotificationCenterGetDistributedCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

uint64_t DNDStringFromInterruptionSuppression()
{
  return _DNDStringFromInterruptionSuppression();
}

uint64_t GetCertClass()
{
  return _GetCertClass();
}

uint64_t GetRandomDigest()
{
  return _GetRandomDigest();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

uint64_t IOHIDUserDeviceCopyService()
{
  return _IOHIDUserDeviceCopyService();
}

uint64_t IOHIDUserDeviceCreateWithOptions()
{
  return _IOHIDUserDeviceCreateWithOptions();
}

IOReturn IOHIDUserDeviceHandleReportWithTimeStamp(IOHIDUserDeviceRef device, uint64_t timestamp, const uint8_t *report, CFIndex reportLength)
{
  return _IOHIDUserDeviceHandleReportWithTimeStamp(device, timestamp, report, reportLength);
}

uint64_t IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback()
{
  return _IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();
}

uint64_t IOHIDUserDeviceRegisterSetReportCallback()
{
  return _IOHIDUserDeviceRegisterSetReportCallback();
}

uint64_t IOHIDUserDeviceScheduleWithDispatchQueue()
{
  return _IOHIDUserDeviceScheduleWithDispatchQueue();
}

uint64_t IOHIDUserDeviceUnscheduleFromDispatchQueue()
{
  return _IOHIDUserDeviceUnscheduleFromDispatchQueue();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

uint64_t IOPSCreatePowerSource()
{
  return _IOPSCreatePowerSource();
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

uint64_t IOPSReleasePowerSource()
{
  return _IOPSReleasePowerSource();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return _IOPSSetPowerSourceDetails();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t IapAuthCertSerial()
{
  return _IapAuthCertSerial();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return _MRMediaRemoteCommandInfoCopyValueForKey();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return _MRMediaRemoteCommandInfoGetCommand();
}

uint64_t MRMediaRemoteCommandInfoGetIntegerValueForKey()
{
  return _MRMediaRemoteCommandInfoGetIntegerValueForKey();
}

uint64_t MRMediaRemoteCopySupportedCommands()
{
  return _MRMediaRemoteCopySupportedCommands();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationDisplayID()
{
  return _MRMediaRemoteGetNowPlayingApplicationDisplayID();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return _MRMediaRemoteGetNowPlayingApplicationPlaybackState();
}

uint64_t MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork()
{
  return _MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return _MRMediaRemoteRegisterForNowPlayingNotifications();
}

uint64_t MRMediaRemoteSendCommand()
{
  return _MRMediaRemoteSendCommand();
}

uint64_t MRMediaRemoteSetWantsSupportedCommandsChangedNotifications()
{
  return _MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return _MRMediaRemoteUnregisterForNowPlayingNotifications();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TUFormattedPhoneNumber()
{
  return _TUFormattedPhoneNumber();
}

uint64_t TUHomeCountryCode()
{
  return _TUHomeCountryCode();
}

uint64_t UARPFirmwareApplicationStatusToString()
{
  return _UARPFirmwareApplicationStatusToString();
}

uint64_t UARPFirmwareStagingCompletionStatusToString()
{
  return _UARPFirmwareStagingCompletionStatusToString();
}

uint64_t VerifyCertAuthority()
{
  return _VerifyCertAuthority();
}

uint64_t VerifyCertSerialNumber()
{
  return _VerifyCertSerialNumber();
}

uint64_t VerifyNonceSigned()
{
  return _VerifyNonceSigned();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  return ___exp10(a1);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return _class_copyPropertyList(cls, outCount);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl property_getName(objc_property_t property)
{
  return _property_getName(property);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return _pthread_getschedparam(a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return _pthread_setschedparam(a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return _xpc_dictionary_expects_reply();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return _xpc_dictionary_get_count(xdict);
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

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return _xpc_fd_dup(xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
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

id objc_msgSend_EventIndicatorCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 EventIndicatorCharacteristic];
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return _[a1 ID];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:x0 options:x1 error:x2];
}

id objc_msgSend_L2CAPChannels(void *a1, const char *a2, ...)
{
  return _[a1 L2CAPChannels];
}

id objc_msgSend_SelectedCodecCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 SelectedCodecCharacteristic];
}

id objc_msgSend_SendDataCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 SendDataCharacteristic];
}

id objc_msgSend_StartStreamingCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 StartStreamingCharacteristic];
}

id objc_msgSend_StopStreamingCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 StopStreamingCharacteristic];
}

id objc_msgSend_SupportedCodecsCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 SupportedCodecsCharacteristic];
}

id objc_msgSend_UID(void *a1, const char *a2, ...)
{
  return _[a1 UID];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8DataWithMaxLength_ellipsis_isTruncated_(void *a1, const char *a2, ...)
{
  return [a1 UTF8DataWithMaxLength:x0 ellipsis:x1 isTruncated:x2];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return [a1 UUIDWithString:];
}

id objc_msgSend__alwaysCollectQuantityTypes(void *a1, const char *a2, ...)
{
  return _[a1 _alwaysCollectQuantityTypes];
}

id objc_msgSend__appIdentifierForTUCallProvider_(void *a1, const char *a2, ...)
{
  return [a1 _appIdentifierForTUCallProvider:];
}

id objc_msgSend__createPacket_payloadOffset_payloadLength_payload_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createPacket:payloadOffset:payloadLength:payload:");
}

id objc_msgSend__createUARPLogPath(void *a1, const char *a2, ...)
{
  return _[a1 _createUARPLogPath];
}

id objc_msgSend__extractHeader_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_extractHeader:");
}

id objc_msgSend__extractPayload_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_extractPayload:");
}

id objc_msgSend__getUARPLogPath(void *a1, const char *a2, ...)
{
  return _[a1 _getUARPLogPath];
}

id objc_msgSend__isFitnessClassicDevice(void *a1, const char *a2, ...)
{
  return _[a1 _isFitnessClassicDevice];
}

id objc_msgSend__packetizeData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_packetizeData:");
}

id objc_msgSend__parseRecvdData_(void *a1, const char *a2, ...)
{
  return [a1 _parseRecvdData:];
}

id objc_msgSend__prepareForFirmwareDownload(void *a1, const char *a2, ...)
{
  return _[a1 _prepareForFirmwareDownload];
}

id objc_msgSend__setFirmwareVersion_(void *a1, const char *a2, ...)
{
  return [a1 _setFirmwareVersion:];
}

id objc_msgSend__setHardwareVersion_(void *a1, const char *a2, ...)
{
  return [a1 _setHardwareVersion:];
}

id objc_msgSend__setManufacturer_(void *a1, const char *a2, ...)
{
  return [a1 _setManufacturer:];
}

id objc_msgSend__setModel_(void *a1, const char *a2, ...)
{
  return [a1 _setModel:];
}

id objc_msgSend__unit(void *a1, const char *a2, ...)
{
  return _[a1 _unit];
}

id objc_msgSend__updateHealthEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _updateHealthEnabled];
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return _[a1 _value];
}

id objc_msgSend_accessoryCategoryCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 accessoryCategoryCharacteristic];
}

id objc_msgSend_accessoryReachable_(void *a1, const char *a2, ...)
{
  return [a1 accessoryReachable:];
}

id objc_msgSend_accessoryUnreachable_(void *a1, const char *a2, ...)
{
  return [a1 accessoryUnreachable:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateHIDPolicy(void *a1, const char *a2, ...)
{
  return _[a1 activateHIDPolicy];
}

id objc_msgSend_activateSiri_(void *a1, const char *a2, ...)
{
  return [a1 activateSiri:];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 activateWithCompletion:];
}

id objc_msgSend_activeCentrals(void *a1, const char *a2, ...)
{
  return _[a1 activeCentrals];
}

id objc_msgSend_activeHIDDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 activeHIDDeviceCount];
}

id objc_msgSend_activeHIDDeviceCountDidChange_(void *a1, const char *a2, ...)
{
  return [a1 activeHIDDeviceCountDidChange:];
}

id objc_msgSend_addAccessory_assetID_(void *a1, const char *a2, ...)
{
  return [a1 addAccessory:assetID];
}

id objc_msgSend_addAlert_isPreExisting_(void *a1, const char *a2, ...)
{
  return [a1 addAlert:isPreExisting:];
}

id objc_msgSend_addCodec_(void *a1, const char *a2, ...)
{
  return [a1 addCodec:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addPipe_(void *a1, const char *a2, ...)
{
  return [a1 addPipe:];
}

id objc_msgSend_addService_(void *a1, const char *a2, ...)
{
  return [a1 addService:];
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:forMode:];
}

id objc_msgSend_addUARPTransportDict_UARPAACPSupported_(void *a1, const char *a2, ...)
{
  return [a1 addUARPTransportDict:UARPAACPSupported:];
}

id objc_msgSend_alert(void *a1, const char *a2, ...)
{
  return _[a1 alert];
}

id objc_msgSend_alertAdded_isPreExisting_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "alertAdded:isPreExisting:");
}

id objc_msgSend_alertMap(void *a1, const char *a2, ...)
{
  return _[a1 alertMap];
}

id objc_msgSend_alertModified_(void *a1, const char *a2, ...)
{
  return [a1 alertModified:];
}

id objc_msgSend_alertRemoved_(void *a1, const char *a2, ...)
{
  return [a1 alertRemoved:];
}

id objc_msgSend_alertSource(void *a1, const char *a2, ...)
{
  return _[a1 alertSource];
}

id objc_msgSend_alerts(void *a1, const char *a2, ...)
{
  return _[a1 alerts];
}

id objc_msgSend_alertsForCategoryID_(void *a1, const char *a2, ...)
{
  return [a1 alertsForCategoryID:];
}

id objc_msgSend_allInputReportsReady(void *a1, const char *a2, ...)
{
  return _[a1 allInputReportsReady];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocHIDQueue(void *a1, const char *a2, ...)
{
  return _[a1 allocHIDQueue];
}

id objc_msgSend_allocQueue(void *a1, const char *a2, ...)
{
  return _[a1 allocQueue];
}

id objc_msgSend_allowInRestrictedMode_(void *a1, const char *a2, ...)
{
  return [a1 allowInRestrictedMode:];
}

id objc_msgSend_alwaysCollectQuantityTypes(void *a1, const char *a2, ...)
{
  return _[a1 alwaysCollectQuantityTypes];
}

id objc_msgSend_amdNotification(void *a1, const char *a2, ...)
{
  return _[a1 amdNotification];
}

id objc_msgSend_analyzeConnectionError_peripheral_info_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "analyzeConnectionError:peripheral:info:");
}

id objc_msgSend_analyzeError_(void *a1, const char *a2, ...)
{
  return [a1 analyzeError:];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return [a1 andPredicateWithSubpredicates:];
}

id objc_msgSend_answerCall_(void *a1, const char *a2, ...)
{
  return [a1 answerCall:];
}

id objc_msgSend_appAttributeIDToString_(void *a1, const char *a2, ...)
{
  return [a1 appAttributeIDToString:];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 appIdentifier];
}

id objc_msgSend_appIdentifierToCategoryCache(void *a1, const char *a2, ...)
{
  return _[a1 appIdentifierToCategoryCache];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:x0 length:x1];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_appleMultitouchDeviceArrived_(void *a1, const char *a2, ...)
{
  return [a1 appleMultitouchDeviceArrived:];
}

id objc_msgSend_applicationIDIsSiri_(void *a1, const char *a2, ...)
{
  return [a1 applicationIDIsSiri:];
}

id objc_msgSend_applicationIDIsSoundSensor_(void *a1, const char *a2, ...)
{
  return [a1 applicationIDIsSoundSensor:];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationProxyForIdentifier:];
}

id objc_msgSend_applyInverseTimestampOffset_(void *a1, const char *a2, ...)
{
  return [a1 applyInverseTimestampOffset:];
}

id objc_msgSend_applyStagedFirmwareOnAccessoryList_withUserIntent_(void *a1, const char *a2, ...)
{
  return [a1 applyStagedFirmwareOnAccessoryList:withUserIntent:];
}

id objc_msgSend_applyTimestampOffset_precise_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "applyTimestampOffset:precise:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_assetSolicitationComplete(void *a1, const char *a2, ...)
{
  return _[a1 assetSolicitationComplete];
}

id objc_msgSend_attributeIDToString_entityID_(void *a1, const char *a2, ...)
{
  return [a1 attributeIDToString:entityID];
}

id objc_msgSend_attributeIDsDidChange_entityID_(void *a1, const char *a2, ...)
{
  return [a1 attributeIDsDidChange:x0 entityID:x1];
}

id objc_msgSend_audio(void *a1, const char *a2, ...)
{
  return _[a1 audio];
}

id objc_msgSend_audioAndVideoCallsWithStatus_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "audioAndVideoCallsWithStatus:");
}

id objc_msgSend_audioBuffer(void *a1, const char *a2, ...)
{
  return _[a1 audioBuffer];
}

id objc_msgSend_audioRoutingControl(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingControl];
}

id objc_msgSend_authInProgress(void *a1, const char *a2, ...)
{
  return _[a1 authInProgress];
}

id objc_msgSend_authInfo(void *a1, const char *a2, ...)
{
  return _[a1 authInfo];
}

id objc_msgSend_authState(void *a1, const char *a2, ...)
{
  return _[a1 authState];
}

id objc_msgSend_authStateString(void *a1, const char *a2, ...)
{
  return _[a1 authStateString];
}

id objc_msgSend_authTimer(void *a1, const char *a2, ...)
{
  return _[a1 authTimer];
}

id objc_msgSend_authenticationDidFail(void *a1, const char *a2, ...)
{
  return _[a1 authenticationDidFail];
}

id objc_msgSend_authenticationDidSucceed(void *a1, const char *a2, ...)
{
  return _[a1 authenticationDidSucceed];
}

id objc_msgSend_batteryLevelCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelCharacteristic];
}

id objc_msgSend_batteryLevelValue(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevelValue];
}

id objc_msgSend_batteryPowerStateCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 batteryPowerStateCharacteristic];
}

id objc_msgSend_batteryPowerStateString_(void *a1, const char *a2, ...)
{
  return [a1 batteryPowerStateString:];
}

id objc_msgSend_bbBulletinAlerts(void *a1, const char *a2, ...)
{
  return _[a1 bbBulletinAlerts];
}

id objc_msgSend_bbObserver(void *a1, const char *a2, ...)
{
  return _[a1 bbObserver];
}

id objc_msgSend_behaviorResolutionService(void *a1, const char *a2, ...)
{
  return _[a1 behaviorResolutionService];
}

id objc_msgSend_bodySensorLocationCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 bodySensorLocationCharacteristic];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_btClockMask(void *a1, const char *a2, ...)
{
  return _[a1 btClockMask];
}

id objc_msgSend_btSyncPeriod(void *a1, const char *a2, ...)
{
  return _[a1 btSyncPeriod];
}

id objc_msgSend_bulletin(void *a1, const char *a2, ...)
{
  return _[a1 bulletin];
}

id objc_msgSend_bulletinID(void *a1, const char *a2, ...)
{
  return _[a1 bulletinID];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleContainerURL];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_buttonData(void *a1, const char *a2, ...)
{
  return _[a1 buttonData];
}

id objc_msgSend_buttonInterestNotification(void *a1, const char *a2, ...)
{
  return _[a1 buttonInterestNotification];
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _[a1 buttons];
}

id objc_msgSend_byteOrder(void *a1, const char *a2, ...)
{
  return _[a1 byteOrder];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedButtonsAndTimestamps(void *a1, const char *a2, ...)
{
  return _[a1 cachedButtonsAndTimestamps];
}

id objc_msgSend_calculateTimestampDifference_current_threshold_compensation_errorHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "calculateTimestampDifference:current:threshold:compensation:errorHandler:");
}

id objc_msgSend_call(void *a1, const char *a2, ...)
{
  return _[a1 call];
}

id objc_msgSend_callCenter(void *a1, const char *a2, ...)
{
  return _[a1 callCenter];
}

id objc_msgSend_callCenterWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 callCenterWithQueue:];
}

id objc_msgSend_callbackDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 callbackDestinationID];
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _[a1 callerId];
}

id objc_msgSend_callerIdLabel(void *a1, const char *a2, ...)
{
  return _[a1 callerIdLabel];
}

id objc_msgSend_callerNameForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 callerNameForDisplay];
}

id objc_msgSend_callsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return [a1 callsWithPredicate:x0 limit:x1 offset:x2 batchSize:x3];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelNextDSTTransitionTimer(void *a1, const char *a2, ...)
{
  return _[a1 cancelNextDSTTransitionTimer];
}

id objc_msgSend_cancelPeripheralConnection_force_(void *a1, const char *a2, ...)
{
  return [a1 cancelPeripheralConnection:force:];
}

id objc_msgSend_cancelPeripheralConnection_options_(void *a1, const char *a2, ...)
{
  return [a1 cancelPeripheralConnection:options:];
}

id objc_msgSend_cancelPeripheralConnectionForConnectOnceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cancelPeripheralConnectionForConnectOnceIdentifier:];
}

id objc_msgSend_cancelSiri(void *a1, const char *a2, ...)
{
  return _[a1 cancelSiri];
}

id objc_msgSend_cancelStaleConnectionRequests(void *a1, const char *a2, ...)
{
  return _[a1 cancelStaleConnectionRequests];
}

id objc_msgSend_cancelStream(void *a1, const char *a2, ...)
{
  return _[a1 cancelStream];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_categoryID(void *a1, const char *a2, ...)
{
  return _[a1 categoryID];
}

id objc_msgSend_categoryIDForAppIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 categoryIDForAppIdentifier:];
}

id objc_msgSend_categoryIDForGenreID_(void *a1, const char *a2, ...)
{
  return [a1 categoryIDForGenreID:];
}

id objc_msgSend_categoryIDToString_(void *a1, const char *a2, ...)
{
  return [a1 categoryIDToString:];
}

id objc_msgSend_cattPeripheral(void *a1, const char *a2, ...)
{
  return _[a1 cattPeripheral];
}

id objc_msgSend_central(void *a1, const char *a2, ...)
{
  return _[a1 central];
}

id objc_msgSend_centralManager(void *a1, const char *a2, ...)
{
  return _[a1 centralManager];
}

id objc_msgSend_centralManagerStateString(void *a1, const char *a2, ...)
{
  return _[a1 centralManagerStateString];
}

id objc_msgSend_centrals(void *a1, const char *a2, ...)
{
  return _[a1 centrals];
}

id objc_msgSend_certificate1Characteristic(void *a1, const char *a2, ...)
{
  return _[a1 certificate1Characteristic];
}

id objc_msgSend_certificate2Characteristic(void *a1, const char *a2, ...)
{
  return _[a1 certificate2Characteristic];
}

id objc_msgSend_certificateSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 certificateSerialNumber];
}

id objc_msgSend_chManager(void *a1, const char *a2, ...)
{
  return _[a1 chManager];
}

id objc_msgSend_chMissedCallAlerts(void *a1, const char *a2, ...)
{
  return _[a1 chMissedCallAlerts];
}

id objc_msgSend_chUnreadMissedCalls(void *a1, const char *a2, ...)
{
  return _[a1 chUnreadMissedCalls];
}

id objc_msgSend_challengeResponseCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 challengeResponseCharacteristic];
}

id objc_msgSend_changeState_(void *a1, const char *a2, ...)
{
  return [a1 changeState:];
}

id objc_msgSend_changeVolumeBy_forCategory_(void *a1, const char *a2, ...)
{
  return [a1 changeVolumeBy:forCategory:];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characteristic(void *a1, const char *a2, ...)
{
  return _[a1 characteristic];
}

id objc_msgSend_characteristicForReportID_reportType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "characteristicForReportID:reportType:");
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return _[a1 characteristics];
}

id objc_msgSend_chargeStateCollection_(void *a1, const char *a2, ...)
{
  return [a1 chargeStateCollection:];
}

id objc_msgSend_chargerStateChanged_(void *a1, const char *a2, ...)
{
  return [a1 chargerStateChanged:];
}

id objc_msgSend_checkAndLogHostInputReportCollision_reportID_(void *a1, const char *a2, ...)
{
  return [a1 checkAndLogHostInputReportCollision:reportID];
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return [a1 classNamed:];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_clearAppleMultitouchDeviceNotification(void *a1, const char *a2, ...)
{
  return _[a1 clearAppleMultitouchDeviceNotification];
}

id objc_msgSend_clearBulletins_inSection_(void *a1, const char *a2, ...)
{
  return [a1 clearBulletins:inSection:];
}

id objc_msgSend_clearButtonInterestNotification(void *a1, const char *a2, ...)
{
  return _[a1 clearButtonInterestNotification];
}

id objc_msgSend_clearDeviceManagementNotification(void *a1, const char *a2, ...)
{
  return _[a1 clearDeviceManagementNotification];
}

id objc_msgSend_clearEvent(void *a1, const char *a2, ...)
{
  return _[a1 clearEvent];
}

id objc_msgSend_clearState(void *a1, const char *a2, ...)
{
  return _[a1 clearState];
}

id objc_msgSend_clearable(void *a1, const char *a2, ...)
{
  return _[a1 clearable];
}

id objc_msgSend_clientService_desiresConnectionParameters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "clientService:desiresConnectionParameters:");
}

id objc_msgSend_clientServiceDidStart_(void *a1, const char *a2, ...)
{
  return [a1 clientServiceDidStart:];
}

id objc_msgSend_clientServiceForUUID_(void *a1, const char *a2, ...)
{
  return [a1 clientServiceForUUID:];
}

id objc_msgSend_clientServiceManagerMap(void *a1, const char *a2, ...)
{
  return _[a1 clientServiceManagerMap];
}

id objc_msgSend_clientServiceMap(void *a1, const char *a2, ...)
{
  return _[a1 clientServiceMap];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_codec(void *a1, const char *a2, ...)
{
  return _[a1 codec];
}

id objc_msgSend_codecList(void *a1, const char *a2, ...)
{
  return _[a1 codecList];
}

id objc_msgSend_codecs(void *a1, const char *a2, ...)
{
  return _[a1 codecs];
}

id objc_msgSend_collectData_(void *a1, const char *a2, ...)
{
  return [a1 collectData:];
}

id objc_msgSend_collectDataForQuantityTypeIdentifiers_isWorkout_(void *a1, const char *a2, ...)
{
  return [a1 collectDataForQuantityTypeIdentifiers:isWorkout:];
}

id objc_msgSend_collectDataForQuantityTypes_isWorkout_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "collectDataForQuantityTypes:isWorkout:");
}

id objc_msgSend_combineCurrentArray_withNewArray_maxCount_objectRemoved_objectAdded_(void *a1, const char *a2, ...)
{
  return [a1 combineCurrentArray:x0 withNewArray:x1 maxCount:x2 objectRemoved:x3 objectAdded:x4];
}

id objc_msgSend_comboHKDevice(void *a1, const char *a2, ...)
{
  return _[a1 comboHKDevice];
}

id objc_msgSend_commandCondition(void *a1, const char *a2, ...)
{
  return _[a1 commandCondition];
}

id objc_msgSend_commandError(void *a1, const char *a2, ...)
{
  return _[a1 commandError];
}

id objc_msgSend_commandPending(void *a1, const char *a2, ...)
{
  return _[a1 commandPending];
}

id objc_msgSend_commandValue(void *a1, const char *a2, ...)
{
  return _[a1 commandValue];
}

id objc_msgSend_communicationContext(void *a1, const char *a2, ...)
{
  return _[a1 communicationContext];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_connectAlways_(void *a1, const char *a2, ...)
{
  return [a1 connectAlways:];
}

id objc_msgSend_connectAlwaysIdentifiersMap(void *a1, const char *a2, ...)
{
  return _[a1 connectAlwaysIdentifiersMap];
}

id objc_msgSend_connectDevice_quickDisconnectEnabled_(void *a1, const char *a2, ...)
{
  return [a1 connectDevice:quickDisconnectEnabled:];
}

id objc_msgSend_connectOnce_(void *a1, const char *a2, ...)
{
  return [a1 connectOnce:];
}

id objc_msgSend_connectOnce_connectionTimeoutEnabled_(void *a1, const char *a2, ...)
{
  return [a1 connectOnce:x0 connectionTimeoutEnabled:x1];
}

id objc_msgSend_connectOnceIdentifiersMap(void *a1, const char *a2, ...)
{
  return _[a1 connectOnceIdentifiersMap];
}

id objc_msgSend_connectOnceNoTimeoutIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 connectOnceNoTimeoutIdentifiers];
}

id objc_msgSend_connectPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 connectPeripheral:];
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return [a1 connectPeripheral:options:];
}

id objc_msgSend_connectStateStr_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "connectStateStr:");
}

id objc_msgSend_connectTaggedDevices(void *a1, const char *a2, ...)
{
  return _[a1 connectTaggedDevices];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionAssertion(void *a1, const char *a2, ...)
{
  return _[a1 connectionAssertion];
}

id objc_msgSend_connectionIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 connectionIdleTimer];
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return _[a1 connectionUUID];
}

id objc_msgSend_consentForUserIndex_withConsentCode_(void *a1, const char *a2, ...)
{
  return [a1 consentForUserIndex:withConsentCode:];
}

id objc_msgSend_consolidatedDataForRequests_(void *a1, const char *a2, ...)
{
  return [a1 consolidatedDataForRequests:];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_contactUsingContactStore_withKeysToFetch_(void *a1, const char *a2, ...)
{
  return [a1 contactUsingContactStore:withKeysToFetch:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_contentPreviewSetting(void *a1, const char *a2, ...)
{
  return _[a1 contentPreviewSetting];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtPath:x0 error:x1];
}

id objc_msgSend_controlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 controlPointCharacteristic];
}

id objc_msgSend_controlPointTimer(void *a1, const char *a2, ...)
{
  return _[a1 controlPointTimer];
}

id objc_msgSend_convertBTClockToMicrosec_(void *a1, const char *a2, ...)
{
  return [a1 convertBTClockToMicrosec:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_correlationTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 correlationTypeForIdentifier:];
}

id objc_msgSend_correlationWithType_startDate_endDate_objects_device_metadata_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "correlationWithType:startDate:endDate:objects:device:metadata:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return _[a1 countUnit];
}

id objc_msgSend_createConnectionWithType_andIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 createConnectionWithType:andIdentifier:];
}

id objc_msgSend_createDataCollectorForQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 createDataCollectorForQuantityType:];
}

id objc_msgSend_createDatum_start_end_quantityType_(void *a1, const char *a2, ...)
{
  return [a1 createDatum:x0 start:x1 end:x2 quantityType:x3];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDistributedHKDeviceWithSecondary_(void *a1, const char *a2, ...)
{
  return [a1 createDistributedHKDeviceWithSecondary:];
}

id objc_msgSend_createDoAPDevice(void *a1, const char *a2, ...)
{
  return _[a1 createDoAPDevice];
}

id objc_msgSend_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:");
}

id objc_msgSend_createGHSDeviceIfReady(void *a1, const char *a2, ...)
{
  return _[a1 createGHSDeviceIfReady];
}

id objc_msgSend_createHIDDeviceIfEverythingReady(void *a1, const char *a2, ...)
{
  return _[a1 createHIDDeviceIfEverythingReady];
}

id objc_msgSend_createHKDataCollectorForHKQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 createHKDataCollectorForHKQuantityType:];
}

id objc_msgSend_createHKDevice(void *a1, const char *a2, ...)
{
  return _[a1 createHKDevice];
}

id objc_msgSend_createReportInfo_(void *a1, const char *a2, ...)
{
  return [a1 createReportInfo:];
}

id objc_msgSend_createServices(void *a1, const char *a2, ...)
{
  return _[a1 createServices];
}

id objc_msgSend_csControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 csControlPointCharacteristic];
}

id objc_msgSend_csFeatureCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 csFeatureCharacteristic];
}

id objc_msgSend_csMeasurementCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 csMeasurementCharacteristic];
}

id objc_msgSend_currentAttributeValueForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "currentAttributeValueForAttributeID:entityID:");
}

id objc_msgSend_currentDstOffset(void *a1, const char *a2, ...)
{
  return _[a1 currentDstOffset];
}

id objc_msgSend_currentElapsedTimeCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 currentElapsedTimeCharacteristic];
}

id objc_msgSend_currentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 currentIdentifier];
}

id objc_msgSend_currentInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentInfo];
}

id objc_msgSend_currentPlaybackState(void *a1, const char *a2, ...)
{
  return _[a1 currentPlaybackState];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentSettings(void *a1, const char *a2, ...)
{
  return _[a1 currentSettings];
}

id objc_msgSend_currentSupportedCommands(void *a1, const char *a2, ...)
{
  return _[a1 currentSupportedCommands];
}

id objc_msgSend_currentTimeCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 currentTimeCharacteristic];
}

id objc_msgSend_currentTimeDidChange(void *a1, const char *a2, ...)
{
  return _[a1 currentTimeDidChange];
}

id objc_msgSend_currentTimeValue(void *a1, const char *a2, ...)
{
  return _[a1 currentTimeValue];
}

id objc_msgSend_currentTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 currentTimeZone];
}

id objc_msgSend_customProperty_(void *a1, const char *a2, ...)
{
  return [a1 customProperty:];
}

id objc_msgSend_cyclingPowerControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 cyclingPowerControlPointCharacteristic];
}

id objc_msgSend_cyclingPowerFeatureCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 cyclingPowerFeatureCharacteristic];
}

id objc_msgSend_cyclingPowerMeasurementCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 cyclingPowerMeasurementCharacteristic];
}

id objc_msgSend_cyclingPowerSensorLocationCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 cyclingPowerSensorLocationCharacteristic];
}

id objc_msgSend_cyclingPowerVectorCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 cyclingPowerVectorCharacteristic];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataSourceCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 dataSourceCharacteristic];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataValue(void *a1, const char *a2, ...)
{
  return _[a1 dataValue];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return [a1 dataWithData:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0 options:x1 error:x2];
}

id objc_msgSend_databaseChangeIncrementCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 databaseChangeIncrementCharacteristic];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return _[a1 dateInterval];
}

id objc_msgSend_dateWithElapsedTimeData_(void *a1, const char *a2, ...)
{
  return [a1 dateWithElapsedTimeData:];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeInterval:x0 sinceDate:x1];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_daylightSavingTimeOffset(void *a1, const char *a2, ...)
{
  return _[a1 daylightSavingTimeOffset];
}

id objc_msgSend_deactivateHIDPolicy(void *a1, const char *a2, ...)
{
  return _[a1 deactivateHIDPolicy];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_debugLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 debugLoggingEnabled];
}

id objc_msgSend_decOpportunisticConnection(void *a1, const char *a2, ...)
{
  return _[a1 decOpportunisticConnection];
}

id objc_msgSend_decomposeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 decomposeToURL:error];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultPlaybackRate(void *a1, const char *a2, ...)
{
  return _[a1 defaultPlaybackRate];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_demultiplexInputReport_reportLength_reportID_(void *a1, const char *a2, ...)
{
  return [a1 demultiplexInputReport:reportLength:reportID:];
}

id objc_msgSend_denylistedIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 denylistedIdentifiers];
}

id objc_msgSend_deregisterForPowerManagementEvents(void *a1, const char *a2, ...)
{
  return _[a1 deregisterForPowerManagementEvents];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeysForStyle:];
}

id objc_msgSend_descriptors(void *a1, const char *a2, ...)
{
  return _[a1 descriptors];
}

id objc_msgSend_desiredConnectionParameters(void *a1, const char *a2, ...)
{
  return _[a1 desiredConnectionParameters];
}

id objc_msgSend_destroyConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 destroyConnectionWithUUID:];
}

id objc_msgSend_destroyDoAPDevice(void *a1, const char *a2, ...)
{
  return _[a1 destroyDoAPDevice];
}

id objc_msgSend_destroyHIDDevice(void *a1, const char *a2, ...)
{
  return _[a1 destroyHIDDevice];
}

id objc_msgSend_destroyServices(void *a1, const char *a2, ...)
{
  return _[a1 destroyServices];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceManagement(void *a1, const char *a2, ...)
{
  return _[a1 deviceManagement];
}

id objc_msgSend_deviceManagementEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 deviceManagementEndpoint];
}

id objc_msgSend_deviceMgntUserDevice(void *a1, const char *a2, ...)
{
  return _[a1 deviceMgntUserDevice];
}

id objc_msgSend_deviceMgtDriverArrived_(void *a1, const char *a2, ...)
{
  return [a1 deviceMgtDriverArrived:];
}

id objc_msgSend_deviceMgtNotification(void *a1, const char *a2, ...)
{
  return _[a1 deviceMgtNotification];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dialWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 dialWithRequest:];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfFile:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didUpdateBodySensorLocation_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateBodySensorLocation:];
}

id objc_msgSend_didUpdateHeartRateMeasurement_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateHeartRateMeasurement:];
}

id objc_msgSend_disconnectCall_(void *a1, const char *a2, ...)
{
  return [a1 disconnectCall:];
}

id objc_msgSend_disconnectDevice_(void *a1, const char *a2, ...)
{
  return [a1 disconnectDevice:];
}

id objc_msgSend_disconnectDevicesWithoutRunningService(void *a1, const char *a2, ...)
{
  return _[a1 disconnectDevicesWithoutRunningService];
}

id objc_msgSend_disconnectPeripheral_force_(void *a1, const char *a2, ...)
{
  return [a1 disconnectPeripheral:force:];
}

id objc_msgSend_discoverCharacteristics_forService_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "discoverCharacteristics:forService:");
}

id objc_msgSend_discoverDescriptorsForCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 discoverDescriptorsForCharacteristic:];
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return [a1 discoverServices:];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayNameForAppIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 displayNameForAppIdentifier:];
}

id objc_msgSend_doapAudioDidStop_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "doapAudioDidStop:");
}

id objc_msgSend_doapAudioRelay(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioRelay];
}

id objc_msgSend_doapAudioRelays(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioRelays];
}

id objc_msgSend_doapAudioStart(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioStart];
}

id objc_msgSend_doapAudioStop(void *a1, const char *a2, ...)
{
  return _[a1 doapAudioStop];
}

id objc_msgSend_doapAudioWillStart_(void *a1, const char *a2, ...)
{
  return [a1 doapAudioWillStart:];
}

id objc_msgSend_doapDeviceDidStart(void *a1, const char *a2, ...)
{
  return _[a1 doapDeviceDidStart];
}

id objc_msgSend_doapDeviceDidStop(void *a1, const char *a2, ...)
{
  return _[a1 doapDeviceDidStop];
}

id objc_msgSend_doapDeviceWithCodecs_streamID_(void *a1, const char *a2, ...)
{
  return [a1 doapDeviceWithCodecs:x0 streamID:x1];
}

id objc_msgSend_doapDevices(void *a1, const char *a2, ...)
{
  return _[a1 doapDevices];
}

id objc_msgSend_doapStateNameFor_(void *a1, const char *a2, ...)
{
  return [a1 doapStateNameFor:];
}

id objc_msgSend_doapStateSet_(void *a1, const char *a2, ...)
{
  return [a1 doapStateSet:];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 doubleForKey:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadAvailableFirmwareUpdate_assetID_withUserIntent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "downloadAvailableFirmwareUpdate:assetID:withUserIntent:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endpointForPipe_(void *a1, const char *a2, ...)
{
  return [a1 endpointForPipe:];
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return _[a1 endpointUUID];
}

id objc_msgSend_entityAttributeCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 entityAttributeCharacteristic];
}

id objc_msgSend_entityUpdateCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 entityUpdateCharacteristic];
}

id objc_msgSend_entityUpdateFlagsToString_(void *a1, const char *a2, ...)
{
  return [a1 entityUpdateFlagsToString:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtURL:x0, x1, x2, x3];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:x0 code:x1 userInfo:x2];
}

id objc_msgSend_eventFlagsToString_(void *a1, const char *a2, ...)
{
  return [a1 eventFlagsToString:];
}

id objc_msgSend_eventIDToString_(void *a1, const char *a2, ...)
{
  return [a1 eventIDToString:];
}

id objc_msgSend_eventIndicator_(void *a1, const char *a2, ...)
{
  return [a1 eventIndicator:];
}

id objc_msgSend_eventIndicator_eventValue_(void *a1, const char *a2, ...)
{
  return [a1 eventIndicator:eventValue:];
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return _[a1 eventQueue];
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 exchangeObjectAtIndex:withObjectAtIndex:];
}

id objc_msgSend_extractBatteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 extractBatteryLevel];
}

id objc_msgSend_extractBatteryPowerState(void *a1, const char *a2, ...)
{
  return _[a1 extractBatteryPowerState];
}

id objc_msgSend_extractButtonDataFromReport_buttonIndex_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractButtonDataFromReport:buttonIndex:");
}

id objc_msgSend_extractControlPointResponse(void *a1, const char *a2, ...)
{
  return _[a1 extractControlPointResponse];
}

id objc_msgSend_extractDatabaseChangeIncrement(void *a1, const char *a2, ...)
{
  return _[a1 extractDatabaseChangeIncrement];
}

id objc_msgSend_extractGHSControlPointResponse(void *a1, const char *a2, ...)
{
  return _[a1 extractGHSControlPointResponse];
}

id objc_msgSend_extractHealthObservationBloodGlucoseWithStream_observationType_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractHealthObservationBloodGlucoseWithStream:observationType:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBloodPressureStatusWithStream_timestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractHealthObservationBloodPressureStatusWithStream:timestamp:")
}

id objc_msgSend_extractHealthObservationBloodPressureWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return [a1 extractHealthObservationBloodPressureWithStream:x0 timestamp:x1 isLive:x2];
}

id objc_msgSend_extractHealthObservationBodyHeightWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractHealthObservationBodyHeightWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBodyMassIndexWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractHealthObservationBodyMassIndexWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBodyMassWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractHealthObservationBodyMassWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBodySegmentFromData_isLive_(void *a1, const char *a2, ...)
{
  return [a1 extractHealthObservationBodySegmentFromData:isLive:];
}

id objc_msgSend_extractHealthObservationBodyTemperatureWithStream_observationType_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return [a1 extractHealthObservationBodyTemperatureWithStream:x0 observationType:x1 timestamp:x2 isLive:x3];
}

id objc_msgSend_extractHealthObservationHeartRateWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractHealthObservationHeartRateWithStream:timestamp:isLive:")];
}

id objc_msgSend_extractHealthSensorFeatures(void *a1, const char *a2, ...)
{
  return _[a1 extractHealthSensorFeatures];
}

id objc_msgSend_extractIDs(void *a1, const char *a2, ...)
{
  return _[a1 extractIDs];
}

id objc_msgSend_extractLiveHealthObservation(void *a1, const char *a2, ...)
{
  return _[a1 extractLiveHealthObservation];
}

id objc_msgSend_extractObservationScheduleChanged(void *a1, const char *a2, ...)
{
  return _[a1 extractObservationScheduleChanged];
}

id objc_msgSend_extractRACPResponse(void *a1, const char *a2, ...)
{
  return _[a1 extractRACPResponse];
}

id objc_msgSend_extractRegisteredUserData(void *a1, const char *a2, ...)
{
  return _[a1 extractRegisteredUserData];
}

id objc_msgSend_extractStoredHealthObservation(void *a1, const char *a2, ...)
{
  return _[a1 extractStoredHealthObservation];
}

id objc_msgSend_extractTime(void *a1, const char *a2, ...)
{
  return _[a1 extractTime];
}

id objc_msgSend_extractUserIndex(void *a1, const char *a2, ...)
{
  return _[a1 extractUserIndex];
}

id objc_msgSend_featuresCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 featuresCharacteristic];
}

id objc_msgSend_featuresReadComplete(void *a1, const char *a2, ...)
{
  return _[a1 featuresReadComplete];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:x0 isDirectory:x1];
}

id objc_msgSend_filterCriteria(void *a1, const char *a2, ...)
{
  return _[a1 filterCriteria];
}

id objc_msgSend_findMatchingDistributedFitnessService_(void *a1, const char *a2, ...)
{
  return [a1 findMatchingDistributedFitnessService:];
}

id objc_msgSend_finishCollectionForQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 finishCollectionForQuantityType:];
}

id objc_msgSend_finishWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 finishWithCompletion:];
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return _[a1 firmwareRevision];
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return _[a1 firmwareVersion];
}

id objc_msgSend_firstButton(void *a1, const char *a2, ...)
{
  return _[a1 firstButton];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstPartyAppIdentifierToCategoryMap(void *a1, const char *a2, ...)
{
  return _[a1 firstPartyAppIdentifierToCategoryMap];
}

id objc_msgSend_firstSampleTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 firstSampleTimestamp];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceInputReportSet(void *a1, const char *a2, ...)
{
  return _[a1 forceInputReportSet];
}

id objc_msgSend_forceUserDevice(void *a1, const char *a2, ...)
{
  return _[a1 forceUserDevice];
}

id objc_msgSend_fwRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 fwRevisionCharacteristic];
}

id objc_msgSend_genreIDForGenre_(void *a1, const char *a2, ...)
{
  return [a1 genreIDForGenre:];
}

id objc_msgSend_getAndRemoveFromUARPTransportDict_(void *a1, const char *a2, ...)
{
  return [a1 getAndRemoveFromUARPTransportDict:];
}

id objc_msgSend_getAudioHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getAudioHIDReportDescriptor];
}

id objc_msgSend_getButtonsHIDReportDescriptor_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getButtonsHIDReportDescriptor:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:x0 length:x1];
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:x0 maxLength:x1 usedLength:x2 encoding:x3 options:x4 range:x5 remainingRange:x6];
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:x0 range:x1];
}

id objc_msgSend_getConnectedPeripheralUUIDsCollecting_andIdle_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getConnectedPeripheralUUIDsCollecting:andIdle:")];
}

id objc_msgSend_getDebugLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 getDebugLoggingEnabled];
}

id objc_msgSend_getDescriptionForResponseValue_(void *a1, const char *a2, ...)
{
  return [a1 getDescriptionForResponseValue:];
}

id objc_msgSend_getDescriptionForTimeSyncSourceType_(void *a1, const char *a2, ...)
{
  return [a1 getDescriptionForTimeSyncSourceType:];
}

id objc_msgSend_getDeviceManagementHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getDeviceManagementHIDReportDescriptor];
}

id objc_msgSend_getEnabledStatusForPeripheral_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 getEnabledStatusForPeripheral:withCompletion:];
}

id objc_msgSend_getInertialHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getInertialHIDReportDescriptor];
}

id objc_msgSend_getInfraredHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getInfraredHIDReportDescriptor];
}

id objc_msgSend_getProximityHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getProximityHIDReportDescriptor];
}

id objc_msgSend_getRadioHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getRadioHIDReportDescriptor];
}

id objc_msgSend_getReport_reportLength_reportID_reportType_(void *a1, const char *a2, ...)
{
  return [a1 getReport:reportLength:reportID:reportType:];
}

id objc_msgSend_getReport_reportLength_reportID_reportType_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 getReport:reportLength:reportID:reportType:keyholeID:];
}

id objc_msgSend_getReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return [a1 getReportData:reportID:reportType:error:];
}

id objc_msgSend_getReportKeyholeID(void *a1, const char *a2, ...)
{
  return _[a1 getReportKeyholeID];
}

id objc_msgSend_getRequestedTags(void *a1, const char *a2, ...)
{
  return _[a1 getRequestedTags];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSectionInfoWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 getSectionInfoWithCompletion:];
}

id objc_msgSend_getTouchHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 getTouchHIDReportDescriptor];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_getVolume_forCategory_(void *a1, const char *a2, ...)
{
  return [a1 getVolume:forCategory:];
}

id objc_msgSend_ghsControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 ghsControlPointCharacteristic];
}

id objc_msgSend_ghsDevice(void *a1, const char *a2, ...)
{
  return _[a1 ghsDevice];
}

id objc_msgSend_ghsDeviceProperties(void *a1, const char *a2, ...)
{
  return _[a1 ghsDeviceProperties];
}

id objc_msgSend_ghsDeviceWithProperties_(void *a1, const char *a2, ...)
{
  return [a1 ghsDeviceWithProperties:];
}

id objc_msgSend_gotDeviceExtendedInfoReport(void *a1, const char *a2, ...)
{
  return _[a1 gotDeviceExtendedInfoReport];
}

id objc_msgSend_groupDeviceManagement(void *a1, const char *a2, ...)
{
  return _[a1 groupDeviceManagement];
}

id objc_msgSend_groupInertial(void *a1, const char *a2, ...)
{
  return _[a1 groupInertial];
}

id objc_msgSend_groupInit(void *a1, const char *a2, ...)
{
  return _[a1 groupInit];
}

id objc_msgSend_groupProximity(void *a1, const char *a2, ...)
{
  return _[a1 groupProximity];
}

id objc_msgSend_groupStart(void *a1, const char *a2, ...)
{
  return _[a1 groupStart];
}

id objc_msgSend_groupTouch(void *a1, const char *a2, ...)
{
  return _[a1 groupTouch];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleAnalyticsData_data_length_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleAnalyticsData:data:length:");
}

id objc_msgSend_handleAudioData_(void *a1, const char *a2, ...)
{
  return [a1 handleAudioData:];
}

id objc_msgSend_handleAudioData_dataLength_(void *a1, const char *a2, ...)
{
  return [a1 handleAudioData:dataLength:];
}

id objc_msgSend_handleButtonData(void *a1, const char *a2, ...)
{
  return _[a1 handleButtonData];
}

id objc_msgSend_handleCheckInMsg_applicationID_(void *a1, const char *a2, ...)
{
  return [a1 handleCheckInMsg:x0 applicationID:x1];
}

id objc_msgSend_handleConnection_(void *a1, const char *a2, ...)
{
  return [a1 handleConnection:];
}

id objc_msgSend_handleControlPointWrite_responseData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleControlPointWrite:responseData:");
}

id objc_msgSend_handleDeviceManagementData_dataLength_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleDeviceManagementData:dataLength:");
}

id objc_msgSend_handleDisconnection(void *a1, const char *a2, ...)
{
  return _[a1 handleDisconnection];
}

id objc_msgSend_handleDisconnection_(void *a1, const char *a2, ...)
{
  return [a1 handleDisconnection:];
}

id objc_msgSend_handleEntityAttributeRead_(void *a1, const char *a2, ...)
{
  return [a1 handleEntityAttributeRead:];
}

id objc_msgSend_handleEntityAttributeWrite_(void *a1, const char *a2, ...)
{
  return [a1 handleEntityAttributeWrite:];
}

id objc_msgSend_handleEntityUpdateWrite_action_(void *a1, const char *a2, ...)
{
  return [a1 handleEntityUpdateWrite:action:];
}

id objc_msgSend_handleEventIndicator_eventValue_(void *a1, const char *a2, ...)
{
  return [a1 handleEventIndicator:eventIndicator eventValue:eventValue];
}

id objc_msgSend_handleGetAppAttributesCommand_responseData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleGetAppAttributesCommand:responseData:");
}

id objc_msgSend_handleGetNotificationAttributesCommand_responseData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleGetNotificationAttributesCommand:responseData:");
}

id objc_msgSend_handleInertialData(void *a1, const char *a2, ...)
{
  return _[a1 handleInertialData];
}

id objc_msgSend_handleInputData_targetDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleInputData:targetDevice:");
}

id objc_msgSend_handleInputReport_reportLength_(void *a1, const char *a2, ...)
{
  return [a1 handleInputReport:reportLength:];
}

id objc_msgSend_handleInputReport_reportLength_timestamp_(void *a1, const char *a2, ...)
{
  return [a1 handleInputReport:reportLength:timestamp:];
}

id objc_msgSend_handleInputReportData_reportID_timestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleInputReportData:reportID:timestamp:");
}

id objc_msgSend_handleInputReportDataV1_reportID_(void *a1, const char *a2, ...)
{
  return [a1 handleInputReportDataV1:reportID:];
}

id objc_msgSend_handleInputReportDataV2_reportID_(void *a1, const char *a2, ...)
{
  return [a1 handleInputReportDataV2:reportID:];
}

id objc_msgSend_handleLiveHealthObservationsData_observationClassType_observationType_userID_observationID_timestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleLiveHealthObservationsData:observationClassType:observationType:userID:observationID:timestamp:");
}

id objc_msgSend_handleLogRetrievalRequest_(void *a1, const char *a2, ...)
{
  return [a1 handleLogRetrievalRequest:];
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return [a1 handleMsg:];
}

id objc_msgSend_handlePerformNotificationActionCommand_(void *a1, const char *a2, ...)
{
  return [a1 handlePerformNotificationActionCommand:];
}

id objc_msgSend_handlePowerManagementNotification_notificationID_(void *a1, const char *a2, ...)
{
  return [a1 handlePowerManagementNotification:notificationID:];
}

id objc_msgSend_handleProximityData(void *a1, const char *a2, ...)
{
  return _[a1 handleProximityData];
}

id objc_msgSend_handleRemoteCommandWrite_(void *a1, const char *a2, ...)
{
  return [a1 handleRemoteCommandWrite:];
}

id objc_msgSend_handleResetStream(void *a1, const char *a2, ...)
{
  return _[a1 handleResetStream];
}

id objc_msgSend_handleStartStream(void *a1, const char *a2, ...)
{
  return _[a1 handleStartStream];
}

id objc_msgSend_handleStartStreaming(void *a1, const char *a2, ...)
{
  return _[a1 handleStartStreaming];
}

id objc_msgSend_handleStopStream(void *a1, const char *a2, ...)
{
  return _[a1 handleStopStream];
}

id objc_msgSend_handleStopStreaming_(void *a1, const char *a2, ...)
{
  return [a1 handleStopStreaming:];
}

id objc_msgSend_handleStoredHealthObservationsData_observationClassType_observationType_userID_observationID_timestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleStoredHealthObservationsData:observationClassType:observationType:userID:observationID:timestamp:");
}

id objc_msgSend_handleTouchData(void *a1, const char *a2, ...)
{
  return _[a1 handleTouchData];
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _[a1 handleType];
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 handleWithDestinationID:];
}

id objc_msgSend_handleXpcDisconnection_(void *a1, const char *a2, ...)
{
  return [a1 handleXpcDisconnection:];
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return _[a1 hardwareRevision];
}

id objc_msgSend_hardwareVersion(void *a1, const char *a2, ...)
{
  return _[a1 hardwareVersion];
}

id objc_msgSend_hasExtraContent(void *a1, const char *a2, ...)
{
  return _[a1 hasExtraContent];
}

id objc_msgSend_hasIDs(void *a1, const char *a2, ...)
{
  return _[a1 hasIDs];
}

id objc_msgSend_hasNegativeAction(void *a1, const char *a2, ...)
{
  return _[a1 hasNegativeAction];
}

id objc_msgSend_hasPositiveAction(void *a1, const char *a2, ...)
{
  return _[a1 hasPositiveAction];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasTag_(void *a1, const char *a2, ...)
{
  return [a1 hasTag:];
}

id objc_msgSend_hasWirelessCharging(void *a1, const char *a2, ...)
{
  return _[a1 hasWirelessCharging];
}

id objc_msgSend_healthDataSyncBloodGlucose_unit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return [a1 healthDataSyncBloodGlucose:unit:startTime:endTime:];
}

id objc_msgSend_healthDataSyncBloodPressuresWithSystolicBP_systolicBPUnit_diastolicBP_diastolicBPUnit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "healthDataSyncBloodPressuresWithSystolicBP:systolicBPUnit:diastolicBP:diastolicBPUnit:startTime:endTime:");
}

id objc_msgSend_healthDataSyncBodyMeasurement_measurementType_unit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:");
}

id objc_msgSend_healthDataSyncBodyTemperature_unit_startTime_endTime_sensorLocType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "healthDataSyncBodyTemperature:unit:startTime:endTime:sensorLocType:");
}

id objc_msgSend_healthDataSyncHeartRate_unit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return [a1 healthDataSyncHeartRate:unit:startTime:endTime:];
}

id objc_msgSend_healthPeripheralsWithFilter_handler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "healthPeripheralsWithFilter:handler:")];
}

id objc_msgSend_heartRateMeasurementCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 heartRateMeasurementCharacteristic];
}

id objc_msgSend_heartRateScanDidTimeOut(void *a1, const char *a2, ...)
{
  return _[a1 heartRateScanDidTimeOut];
}

id objc_msgSend_heartRateScanTimer(void *a1, const char *a2, ...)
{
  return _[a1 heartRateScanTimer];
}

id objc_msgSend_hidControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 hidControlPointCharacteristic];
}

id objc_msgSend_hidDevice(void *a1, const char *a2, ...)
{
  return _[a1 hidDevice];
}

id objc_msgSend_hidDeviceDesiredConnectionParametersDidChange(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceDesiredConnectionParametersDidChange];
}

id objc_msgSend_hidDeviceDidStart(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceDidStart];
}

id objc_msgSend_hidDeviceDidStop(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceDidStop];
}

id objc_msgSend_hidDeviceProperties(void *a1, const char *a2, ...)
{
  return _[a1 hidDeviceProperties];
}

id objc_msgSend_hidDeviceWithProperties_reports_(void *a1, const char *a2, ...)
{
  return [a1 hidDeviceWithProperties:x0, x1];
}

id objc_msgSend_hidInformationCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 hidInformationCharacteristic];
}

id objc_msgSend_hidProperties(void *a1, const char *a2, ...)
{
  return _[a1 hidProperties];
}

id objc_msgSend_hkDataCollectors(void *a1, const char *a2, ...)
{
  return _[a1 hkDataCollectors];
}

id objc_msgSend_hkDevice(void *a1, const char *a2, ...)
{
  return _[a1 hkDevice];
}

id objc_msgSend_hkHealthStore(void *a1, const char *a2, ...)
{
  return _[a1 hkHealthStore];
}

id objc_msgSend_hkQuantityType(void *a1, const char *a2, ...)
{
  return _[a1 hkQuantityType];
}

id objc_msgSend_hkQuantityTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 hkQuantityTypeForIdentifier:];
}

id objc_msgSend_hkQuantityTypesCollecting(void *a1, const char *a2, ...)
{
  return _[a1 hkQuantityTypesCollecting];
}

id objc_msgSend_hkStore(void *a1, const char *a2, ...)
{
  return _[a1 hkStore];
}

id objc_msgSend_hkUnitForHKQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 hkUnitForHKQuantityType:];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_hrmSessionStateChanged_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "hrmSessionStateChanged:completion:");
}

id objc_msgSend_hub(void *a1, const char *a2, ...)
{
  return _[a1 hub];
}

id objc_msgSend_hwRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 hwRevisionCharacteristic];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierForConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 identifierForConnectionWithUUID:];
}

id objc_msgSend_ignoresQuietMode(void *a1, const char *a2, ...)
{
  return _[a1 ignoresQuietMode];
}

id objc_msgSend_incOpportunisticConnection(void *a1, const char *a2, ...)
{
  return _[a1 incOpportunisticConnection];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectPassingTest:];
}

id objc_msgSend_inertial(void *a1, const char *a2, ...)
{
  return _[a1 inertial];
}

id objc_msgSend_inertialData(void *a1, const char *a2, ...)
{
  return _[a1 inertialData];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _[a1 info];
}

id objc_msgSend_infrared(void *a1, const char *a2, ...)
{
  return _[a1 infrared];
}

id objc_msgSend_initWithBtClockMask_(void *a1, const char *a2, ...)
{
  return [a1 initWithBtClockMask:];
}

id objc_msgSend_initWithBulletin_observer_categoryID_(void *a1, const char *a2, ...)
{
  return [a1 initWithBulletin:observer:categoryID:];
}

id objc_msgSend_initWithByteOrder_(void *a1, const char *a2, ...)
{
  return [a1 initWithByteOrder:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:x0 length:x1];
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:x0 length:x1 encoding:x2];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithCall_callCenter_(void *a1, const char *a2, ...)
{
  return [a1 initWithCall:callCenter:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCodecs_streamID_(void *a1, const char *a2, ...)
{
  return [a1 initWithCodecs:streamID:];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDelegate_pipe_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:x0 pipe:x1];
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:x0 queue:x1];
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:x0 queue:x1 options:x2];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [[a1 initWithFireDate:x0 interval:x1 target:x2 selector:x3 userInfo:x4 repeats:x5];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithHardwareID_uuid_(void *a1, const char *a2, ...)
{
  return [a1 initWithHardwareID:uuid];
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:];
}

id objc_msgSend_initWithHealthStore_bundleIdentifier_quantityType_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:x0 bundleIdentifier:x1 quantityType:x2];
}

id objc_msgSend_initWithID_(void *a1, const char *a2, ...)
{
  return [a1 initWithID:];
}

id objc_msgSend_initWithID_type_(void *a1, const char *a2, ...)
{
  return [a1 initWithID:type:];
}

id objc_msgSend_initWithIdentifier_dateInterval_quantity_resumeContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 dateInterval:x1 quantity:x2 resumeContext:x3];
}

id objc_msgSend_initWithIdentifier_deviceType_properties_codecType_hub_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:a2 deviceType:a3 properties:a4 codecType:a5 hub:a6];
}

id objc_msgSend_initWithLocationType_remoteURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocationType:remoteURL:];
}

id objc_msgSend_initWithManager_peripheral_service_(void *a1, const char *a2, ...)
{
  return [a1 initWithManager:a2 peripheral:a3 service:a4];
}

id objc_msgSend_initWithName_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 manufacturer:x1 model:x2 hardwareVersion:x3 firmwareVersion:x4 softwareVersion:x5 localIdentifier:x6 UDIDeviceIdentifier:x7];
}

id objc_msgSend_initWithName_options_queue_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:options:queue:delegate:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:forKeys:count:];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 initWithPeripheral:];
}

id objc_msgSend_initWithProperties_healthStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithProperties:healthStore:];
}

id objc_msgSend_initWithProperties_hidDescriptor_keyholeID_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithProperties:x0 hidDescriptor:x1 keyholeID:x2 delegate:x3];
}

id objc_msgSend_initWithProperties_reports_(void *a1, const char *a2, ...)
{
  return [a1 initWithProperties:reports:];
}

id objc_msgSend_initWithProperties_reports_loggingIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithProperties:x0 reports:x1 loggingIdentifier:x2];
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithRecentCall_manager_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecentCall:manager:queue:];
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartDate:x0 endDate:x1];
}

id objc_msgSend_initWithSubType_(void *a1, const char *a2, ...)
{
  return [a1 initWithSubType:];
}

id objc_msgSend_initWithType_primary_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:primary:];
}

id objc_msgSend_initWithType_priority_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:priority:];
}

id objc_msgSend_initWithType_properties_value_permissions_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:x0 properties:x1 value:x2 permissions:x3];
}

id objc_msgSend_initWithUID_alert_(void *a1, const char *a2, ...)
{
  return [a1 initWithUID:alert:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 initWithUTF8String:];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithValue_byteOrder_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:x0 byteOrder:x1];
}

id objc_msgSend_initWithValue_characteristic_centrals_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:v1 characteristic:v2 centrals:v3];
}

id objc_msgSend_initWithVendorIDSource_vendorID_productID_productVersion_(void *a1, const char *a2, ...)
{
  return [a1 initWithVendorIDSource:vendorID:productID:productVersion:];
}

id objc_msgSend_initWithVoicemail_manager_contactStore_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithVoicemail:x0 manager:x1 contactStore:x2 queue:x3];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _[a1 input];
}

id objc_msgSend_inputReportTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 inputReportTimestamp];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return _[a1 inputStream];
}

id objc_msgSend_inputStreamWithData_(void *a1, const char *a2, ...)
{
  return [a1 inputStreamWithData:];
}

id objc_msgSend_inputStreamWithData_byteOrder_(void *a1, const char *a2, ...)
{
  return [a1 inputStreamWithData:x0 byteOrder:x1];
}

id objc_msgSend_insertDatums_device_metadata_completion_(void *a1, const char *a2, ...)
{
  return [a1 insertDatums:x0 device:x1 metadata:x2 completion:x3];
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _[a1 instance];
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return _[a1 instanceID];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:];
}

id objc_msgSend_interruptionLevel(void *a1, const char *a2, ...)
{
  return _[a1 interruptionLevel];
}

id objc_msgSend_interruptionSuppression(void *a1, const char *a2, ...)
{
  return _[a1 interruptionSuppression];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invocationForNotifyAttributeIDs_entityID_central_(void *a1, const char *a2, ...)
{
  return [a1 invocationForNotifyAttributeIDs:entityID:central:];
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return [a1 invocationWithMethodSignature:];
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_iopsNotifyPercentChangeToken(void *a1, const char *a2, ...)
{
  return _[a1 iopsNotifyPercentChangeToken];
}

id objc_msgSend_isAccessoryCategoryPencil_(void *a1, const char *a2, ...)
{
  return [a1 isAccessoryCategoryPencil:];
}

id objc_msgSend_isAlertSilent_(void *a1, const char *a2, ...)
{
  return [a1 isAlertSilent:];
}

id objc_msgSend_isAlwaysConnecting_(void *a1, const char *a2, ...)
{
  return [a1 isAlwaysConnecting:];
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isBlocked];
}

id objc_msgSend_isCollectingHKQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 isCollectingHKQuantityType:];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _[a1 isDeleted];
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return _[a1 isDirty];
}

id objc_msgSend_isDistributed(void *a1, const char *a2, ...)
{
  return _[a1 isDistributed];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSet:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isEventIndicatorNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEventIndicatorNotificationEnabled];
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isFitnessClassicDevice(void *a1, const char *a2, ...)
{
  return _[a1 isFitnessClassicDevice];
}

id objc_msgSend_isHKQuantityRequested_(void *a1, const char *a2, ...)
{
  return [a1 isHKQuantityRequested:];
}

id objc_msgSend_isHealthDataAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isHealthDataAvailable];
}

id objc_msgSend_isHubConnected(void *a1, const char *a2, ...)
{
  return _[a1 isHubConnected];
}

id objc_msgSend_isImportant(void *a1, const char *a2, ...)
{
  return _[a1 isImportant];
}

id objc_msgSend_isLinkEncrypted(void *a1, const char *a2, ...)
{
  return _[a1 isLinkEncrypted];
}

id objc_msgSend_isLoading(void *a1, const char *a2, ...)
{
  return _[a1 isLoading];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _[a1 isMuted];
}

id objc_msgSend_isNotifying(void *a1, const char *a2, ...)
{
  return _[a1 isNotifying];
}

id objc_msgSend_isPeripheralConnected_(void *a1, const char *a2, ...)
{
  return [a1 isPeripheralConnected:];
}

id objc_msgSend_isPowerManagementBasedOnDisplayState(void *a1, const char *a2, ...)
{
  return _[a1 isPowerManagementBasedOnDisplayState];
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return _[a1 isPrimary];
}

id objc_msgSend_isRegisteredForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return [a1 isRegisteredForAttributeID:entityID];
}

id objc_msgSend_isSendDataNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSendDataNotificationEnabled];
}

id objc_msgSend_isSendingData(void *a1, const char *a2, ...)
{
  return _[a1 isSendingData];
}

id objc_msgSend_isSensorLocationLeft(void *a1, const char *a2, ...)
{
  return _[a1 isSensorLocationLeft];
}

id objc_msgSend_isSensorLocationRight(void *a1, const char *a2, ...)
{
  return _[a1 isSensorLocationRight];
}

id objc_msgSend_isSilent(void *a1, const char *a2, ...)
{
  return _[a1 isSilent];
}

id objc_msgSend_isSpecialSectionID_(void *a1, const char *a2, ...)
{
  return [a1 isSpecialSectionID:];
}

id objc_msgSend_isStartStreamingNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isStartStreamingNotificationEnabled];
}

id objc_msgSend_isStarted(void *a1, const char *a2, ...)
{
  return _[a1 isStarted];
}

id objc_msgSend_isStopStreamingNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isStopStreamingNotificationEnabled];
}

id objc_msgSend_isSupportingService_(void *a1, const char *a2, ...)
{
  return [a1 isSupportingService:];
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 isTelephonyProvider];
}

id objc_msgSend_isTimestampSyncEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isTimestampSyncEnabled];
}

id objc_msgSend_isTrashed(void *a1, const char *a2, ...)
{
  return _[a1 isTrashed];
}

id objc_msgSend_isUnread(void *a1, const char *a2, ...)
{
  return _[a1 isUnread];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isXpcConnectedForDeviceType_(void *a1, const char *a2, ...)
{
  return [a1 isXpcConnectedForDeviceType:];
}

id objc_msgSend_issueChallenge(void *a1, const char *a2, ...)
{
  return _[a1 issueChallenge];
}

id objc_msgSend_keyholeID(void *a1, const char *a2, ...)
{
  return _[a1 keyholeID];
}

id objc_msgSend_knownQuantityTypes(void *a1, const char *a2, ...)
{
  return _[a1 knownQuantityTypes];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_lastAudioDate(void *a1, const char *a2, ...)
{
  return _[a1 lastAudioDate];
}

id objc_msgSend_lastDistributedDatum(void *a1, const char *a2, ...)
{
  return _[a1 lastDistributedDatum];
}

id objc_msgSend_lastKnownAttributeValue(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownAttributeValue];
}

id objc_msgSend_lastKnownAttributeValueForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return [a1 lastKnownAttributeValueForAttributeID:entityID:];
}

id objc_msgSend_lastKnownSupportedCommands(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownSupportedCommands];
}

id objc_msgSend_latency(void *a1, const char *a2, ...)
{
  return _[a1 latency];
}

id objc_msgSend_latestSampleTimestampWithinSeconds_(void *a1, const char *a2, ...)
{
  return [a1 latestSampleTimestampWithinSeconds:];
}

id objc_msgSend_launchServer(void *a1, const char *a2, ...)
{
  return _[a1 launchServer];
}

id objc_msgSend_lazyContactStore(void *a1, const char *a2, ...)
{
  return _[a1 lazyContactStore];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_linkIdleTimeout(void *a1, const char *a2, ...)
{
  return _[a1 linkIdleTimeout];
}

id objc_msgSend_liveObservationCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 liveObservationCharacteristic];
}

id objc_msgSend_loadCollectionState(void *a1, const char *a2, ...)
{
  return _[a1 loadCollectionState];
}

id objc_msgSend_loadedAttributeID(void *a1, const char *a2, ...)
{
  return _[a1 loadedAttributeID];
}

id objc_msgSend_loadedEntityID(void *a1, const char *a2, ...)
{
  return _[a1 loadedEntityID];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localIdentifier];
}

id objc_msgSend_localTimeInformationCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 localTimeInformationCharacteristic];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedLabel(void *a1, const char *a2, ...)
{
  return _[a1 localizedLabel];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringForLabel_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForLabel:];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logBlock_(void *a1, const char *a2, ...)
{
  return [a1 logBlock:];
}

id objc_msgSend_logHwFwVersions(void *a1, const char *a2, ...)
{
  return _[a1 logHwFwVersions];
}

id objc_msgSend_loggingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 loggingIdentifier];
}

id objc_msgSend_machTimeToMicrosec_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "machTimeToMicrosec:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return _[a1 manufacturer];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return _[a1 manufacturerName];
}

id objc_msgSend_manufacturerNameCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 manufacturerNameCharacteristic];
}

id objc_msgSend_markAllCallsAsReadWithPredicate_(void *a1, const char *a2, ...)
{
  return [a1 markAllCallsAsReadWithPredicate:];
}

id objc_msgSend_markFitnessTaskEnabled_(void *a1, const char *a2, ...)
{
  return [a1 markFitnessTaskEnabled:];
}

id objc_msgSend_matchInstanceIDInHidEventDriver_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "matchInstanceIDInHidEventDriver:");
}

id objc_msgSend_matchesDistributedService_(void *a1, const char *a2, ...)
{
  return [a1 matchesDistributedService:];
}

id objc_msgSend_maxCELength(void *a1, const char *a2, ...)
{
  return _[a1 maxCELength];
}

id objc_msgSend_maxDeferment(void *a1, const char *a2, ...)
{
  return _[a1 maxDeferment];
}

id objc_msgSend_maxInterval(void *a1, const char *a2, ...)
{
  return _[a1 maxInterval];
}

id objc_msgSend_maxPayloadSize(void *a1, const char *a2, ...)
{
  return _[a1 maxPayloadSize];
}

id objc_msgSend_maxPeripheralLatency(void *a1, const char *a2, ...)
{
  return _[a1 maxPeripheralLatency];
}

id objc_msgSend_maxReportRetry(void *a1, const char *a2, ...)
{
  return _[a1 maxReportRetry];
}

id objc_msgSend_maximumUpdateValueLength(void *a1, const char *a2, ...)
{
  return _[a1 maximumUpdateValueLength];
}

id objc_msgSend_maximumWriteValueLengthForType_(void *a1, const char *a2, ...)
{
  return [a1 maximumWriteValueLengthForType:];
}

id objc_msgSend_maybeQueryOOBPAndSendStatus(void *a1, const char *a2, ...)
{
  return _[a1 maybeQueryOOBPAndSendStatus];
}

id objc_msgSend_mediaInfoDidChange(void *a1, const char *a2, ...)
{
  return _[a1 mediaInfoDidChange];
}

id objc_msgSend_mediaPlayerDidChange(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlayerDidChange];
}

id objc_msgSend_mediaStateDidChange(void *a1, const char *a2, ...)
{
  return _[a1 mediaStateDidChange];
}

id objc_msgSend_mediaVolumeDidChange(void *a1, const char *a2, ...)
{
  return _[a1 mediaVolumeDidChange];
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return [a1 member:];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return [a1 methodSignatureForSelector:];
}

id objc_msgSend_mfiAuthChannel(void *a1, const char *a2, ...)
{
  return _[a1 mfiAuthChannel];
}

id objc_msgSend_mfiPeripheral(void *a1, const char *a2, ...)
{
  return _[a1 mfiPeripheral];
}

id objc_msgSend_microsecToMachTime_(void *a1, const char *a2, ...)
{
  return [a1 microsecToMachTime:];
}

id objc_msgSend_migrateHKPairedHealthDevices(void *a1, const char *a2, ...)
{
  return _[a1 migrateHKPairedHealthDevices];
}

id objc_msgSend_minCELength(void *a1, const char *a2, ...)
{
  return _[a1 minCELength];
}

id objc_msgSend_minInterval(void *a1, const char *a2, ...)
{
  return _[a1 minInterval];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_mobileBluetoothBundle(void *a1, const char *a2, ...)
{
  return _[a1 mobileBluetoothBundle];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return _[a1 modelNumber];
}

id objc_msgSend_modelNumberCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 modelNumberCharacteristic];
}

id objc_msgSend_modifyAlert_(void *a1, const char *a2, ...)
{
  return [a1 modifyAlert:];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return _[a1 month];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 moveItemAtURL:toURL:error:];
}

id objc_msgSend_msgIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 msgIdentifier];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameForCentral_(void *a1, const char *a2, ...)
{
  return [a1 nameForCentral:];
}

id objc_msgSend_nanosecond(void *a1, const char *a2, ...)
{
  return _[a1 nanosecond];
}

id objc_msgSend_negativeActionLabel(void *a1, const char *a2, ...)
{
  return _[a1 negativeActionLabel];
}

id objc_msgSend_newDeviceMgntDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newDeviceMgntDevice:keyholeID:];
}

id objc_msgSend_newForceDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newForceDevice:keyholeID:];
}

id objc_msgSend_newFwUpgradeDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newFwUpgradeDevice:keyholeID:];
}

id objc_msgSend_newHapticsDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newHapticsDevice:keyholeID:];
}

id objc_msgSend_newInertialSensorDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newInertialSensorDevice:keyholeID:];
}

id objc_msgSend_newMotionDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newMotionDevice:keyholeID:];
}

id objc_msgSend_newRadioDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newRadioDevice:keyholeID:];
}

id objc_msgSend_newTouchDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newTouchDevice:keyholeID:];
}

id objc_msgSend_newUserDevice_descriptor_descriptorLength_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newUserDevice:x0 descriptor:x1 descriptorLength:x2 keyholeID:x3];
}

id objc_msgSend_newUserDevices_(void *a1, const char *a2, ...)
{
  return [a1 newUserDevices:];
}

id objc_msgSend_newWakeDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 newWakeDevice:keyholeID:];
}

id objc_msgSend_nextDSTTransitionTimer(void *a1, const char *a2, ...)
{
  return _[a1 nextDSTTransitionTimer];
}

id objc_msgSend_nextDaylightSavingTimeTransition(void *a1, const char *a2, ...)
{
  return _[a1 nextDaylightSavingTimeTransition];
}

id objc_msgSend_notANumber(void *a1, const char *a2, ...)
{
  return _[a1 notANumber];
}

id objc_msgSend_notifiableAttributeIDs_entityID_(void *a1, const char *a2, ...)
{
  return [a1 notifiableAttributeIDs:entityID];
}

id objc_msgSend_notificationAttributeIDToString_(void *a1, const char *a2, ...)
{
  return [a1 notificationAttributeIDToString:];
}

id objc_msgSend_notificationForAlert_(void *a1, const char *a2, ...)
{
  return [a1 notificationForAlert:];
}

id objc_msgSend_notificationForUID_(void *a1, const char *a2, ...)
{
  return [a1 notificationForUID:];
}

id objc_msgSend_notificationPort(void *a1, const char *a2, ...)
{
  return _[a1 notificationPort];
}

id objc_msgSend_notificationSourceCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 notificationSourceCharacteristic];
}

id objc_msgSend_notifyAttributeIDs_entityID_central_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "notifyAttributeIDs:entityID:central:");
}

id objc_msgSend_notifyAttributeValue_attributeID_entityID_central_(void *a1, const char *a2, ...)
{
  return [a1 notifyAttributeValue:attributeID:entityID:central:];
}

id objc_msgSend_notifyDesiredConnectionParametersDidChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyDesiredConnectionParametersDidChange];
}

id objc_msgSend_notifyDidStart(void *a1, const char *a2, ...)
{
  return _[a1 notifyDidStart];
}

id objc_msgSend_notifyDidStartIfEverythingReady(void *a1, const char *a2, ...)
{
  return _[a1 notifyDidStartIfEverythingReady];
}

id objc_msgSend_notifyDidStop(void *a1, const char *a2, ...)
{
  return _[a1 notifyDidStop];
}

id objc_msgSend_notifyDownstreamOnChargerState_(void *a1, const char *a2, ...)
{
  return [a1 notifyDownstreamOnChargerState:];
}

id objc_msgSend_notifyListeners_(void *a1, const char *a2, ...)
{
  return [a1 notifyListeners:];
}

id objc_msgSend_notifyPencilOnChargerState_(void *a1, const char *a2, ...)
{
  return [a1 notifyPencilOnChargerState:];
}

id objc_msgSend_notifyPrimaryBudSide_device_(void *a1, const char *a2, ...)
{
  return [a1 notifyPrimaryBudSide:device];
}

id objc_msgSend_notifySupportedCommands_central_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "notifySupportedCommands:central:");
}

id objc_msgSend_notifySupportedCommandsValue_central_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "notifySupportedCommandsValue:central:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return [a1 numberFromString:];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedShort:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_observationScheduleChangedCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 observationScheduleChangedCharacteristic];
}

id objc_msgSend_obtainTimestampFromDriver_count_period_(void *a1, const char *a2, ...)
{
  return [a1 obtainTimestampFromDriver:x0 count:x1 period:x2];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return _[a1 offset];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openL2CAPChannel_(void *a1, const char *a2, ...)
{
  return [a1 openL2CAPChannel:];
}

id objc_msgSend_opportunisticRefCount(void *a1, const char *a2, ...)
{
  return _[a1 opportunisticRefCount];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return _[a1 output];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return _[a1 outputStream];
}

id objc_msgSend_outputStreamWithByteOrder_(void *a1, const char *a2, ...)
{
  return [a1 outputStreamWithByteOrder:];
}

id objc_msgSend_pairedFitnessDeviceUUIDS(void *a1, const char *a2, ...)
{
  return _[a1 pairedFitnessDeviceUUIDS];
}

id objc_msgSend_pairingInfoCompleted(void *a1, const char *a2, ...)
{
  return _[a1 pairingInfoCompleted];
}

id objc_msgSend_pairingTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 pairingTimestamp];
}

id objc_msgSend_parseTLVCodecList_dataLength_streamID_(void *a1, const char *a2, ...)
{
  return [a1 parseTLVCodecList:dataLength:streamID:];
}

id objc_msgSend_parseTLVCodecValue_dataLength_codecStruct_(void *a1, const char *a2, ...)
{
  return [a1 parseTLVCodecValue:dataLength:codecStruct:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathIDs(void *a1, const char *a2, ...)
{
  return _[a1 pathIDs];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _[a1 peer];
}

id objc_msgSend_pending(void *a1, const char *a2, ...)
{
  return _[a1 pending];
}

id objc_msgSend_pendingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 pendingUpdates];
}

id objc_msgSend_performMFiAuth_(void *a1, const char *a2, ...)
{
  return [a1 performMFiAuth:];
}

id objc_msgSend_performNegativeAction(void *a1, const char *a2, ...)
{
  return _[a1 performNegativeAction];
}

id objc_msgSend_performPositiveAction(void *a1, const char *a2, ...)
{
  return _[a1 performPositiveAction];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return _[a1 peripheral];
}

id objc_msgSend_peripheral_didDiscoverCharacteristicsForService_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheral:didDiscoverCharacteristicsForService:error:");
}

id objc_msgSend_peripheral_didDiscoverDescriptorsForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheral:didDiscoverDescriptorsForCharacteristic:error:");
}

id objc_msgSend_peripheral_didDiscoverServices_(void *a1, const char *a2, ...)
{
  return [a1 peripheral:didDiscoverServices:];
}

id objc_msgSend_peripheral_didModifyServices_(void *a1, const char *a2, ...)
{
  return [a1 peripheral:didModifyServices:];
}

id objc_msgSend_peripheral_didUpdateNotificationStateForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheral:didUpdateNotificationStateForCharacteristic:error:");
}

id objc_msgSend_peripheral_didUpdateValueForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheral:didUpdateValueForCharacteristic:error:");
}

id objc_msgSend_peripheral_didUpdateValueForDescriptor_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheral:didUpdateValueForDescriptor:error:");
}

id objc_msgSend_peripheral_didWriteValueForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return [a1 peripheral:didWriteValueForCharacteristic:error:];
}

id objc_msgSend_peripheralForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 peripheralForIdentifier:];
}

id objc_msgSend_peripheralManager(void *a1, const char *a2, ...)
{
  return _[a1 peripheralManager];
}

id objc_msgSend_peripheralManager_central_didSubscribeToCharacteristic_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheralManager:central:didSubscribeToCharacteristic:");
}

id objc_msgSend_peripheralManager_central_didUnsubscribeFromCharacteristic_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheralManager:central:didUnsubscribeFromCharacteristic:");
}

id objc_msgSend_peripheralManager_central_didUpdateANCSAuthorization_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheralManager:central:didUpdateANCSAuthorization:");
}

id objc_msgSend_peripheralManager_didAddService_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peripheralManager:didAddService:error:");
}

id objc_msgSend_peripheralManager_didReceiveReadRequest_(void *a1, const char *a2, ...)
{
  return [a1 peripheralManager:didReceiveReadRequest:];
}

id objc_msgSend_peripheralManager_didReceiveWriteRequests_(void *a1, const char *a2, ...)
{
  return [a1 peripheralManager:didReceiveWriteRequests:];
}

id objc_msgSend_peripheralManagerStateString(void *a1, const char *a2, ...)
{
  return _[a1 peripheralManagerStateString];
}

id objc_msgSend_peripherals(void *a1, const char *a2, ...)
{
  return _[a1 peripherals];
}

id objc_msgSend_persistanceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 persistanceAssertion];
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return [a1 persistentDomainForName:];
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberWithStringValue:];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return _[a1 pipe];
}

id objc_msgSend_pipe_didReceiveMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "pipe:didReceiveMessage:");
}

id objc_msgSend_pipeManager(void *a1, const char *a2, ...)
{
  return _[a1 pipeManager];
}

id objc_msgSend_pipes(void *a1, const char *a2, ...)
{
  return _[a1 pipes];
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return _[a1 playbackRate];
}

id objc_msgSend_playerBundleID(void *a1, const char *a2, ...)
{
  return _[a1 playerBundleID];
}

id objc_msgSend_playerElapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 playerElapsedTime];
}

id objc_msgSend_playerName(void *a1, const char *a2, ...)
{
  return _[a1 playerName];
}

id objc_msgSend_playerPlaybackRate(void *a1, const char *a2, ...)
{
  return _[a1 playerPlaybackRate];
}

id objc_msgSend_playerPlaybackState(void *a1, const char *a2, ...)
{
  return _[a1 playerPlaybackState];
}

id objc_msgSend_playerVolume(void *a1, const char *a2, ...)
{
  return _[a1 playerVolume];
}

id objc_msgSend_pmIsSuspended(void *a1, const char *a2, ...)
{
  return _[a1 pmIsSuspended];
}

id objc_msgSend_pmNotificationPort(void *a1, const char *a2, ...)
{
  return _[a1 pmNotificationPort];
}

id objc_msgSend_pmService(void *a1, const char *a2, ...)
{
  return _[a1 pmService];
}

id objc_msgSend_pnpIDCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 pnpIDCharacteristic];
}

id objc_msgSend_positiveActionLabel(void *a1, const char *a2, ...)
{
  return _[a1 positiveActionLabel];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_powerBalanceForValue_otherService_otherValue_(void *a1, const char *a2, ...)
{
  return [a1 powerBalanceForValue:x0 otherService:x1 otherValue:x2];
}

id objc_msgSend_powerSourceDetails(void *a1, const char *a2, ...)
{
  return _[a1 powerSourceDetails];
}

id objc_msgSend_powerSourceID(void *a1, const char *a2, ...)
{
  return _[a1 powerSourceID];
}

id objc_msgSend_predicateForCallsWithStatus_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCallsWithStatus:];
}

id objc_msgSend_predicateForCallsWithStatusRead_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "predicateForCallsWithStatusRead:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_preferredInterval(void *a1, const char *a2, ...)
{
  return _[a1 preferredInterval];
}

id objc_msgSend_preferredIntervalForCommand_(void *a1, const char *a2, ...)
{
  return [a1 preferredIntervalForCommand:];
}

id objc_msgSend_preferredPeripheralLatency(void *a1, const char *a2, ...)
{
  return _[a1 preferredPeripheralLatency];
}

id objc_msgSend_primaryAttachmentType(void *a1, const char *a2, ...)
{
  return _[a1 primaryAttachmentType];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_processIncomingData_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 processIncomingData:forEndpointWithUUID:];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processTimestampSync_phase_(void *a1, const char *a2, ...)
{
  return [a1 processTimestampSync:phase:];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _[a1 productID];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_properties_locationIdOffset_hidDescriptor_extendedData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend a1 properties:locationIdOffset:hidDescriptor:extendedData:];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 propertyForKey:];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 providerForRecentCall:];
}

id objc_msgSend_proximity(void *a1, const char *a2, ...)
{
  return _[a1 proximity];
}

id objc_msgSend_proximityData(void *a1, const char *a2, ...)
{
  return _[a1 proximityData];
}

id objc_msgSend_publicationDate(void *a1, const char *a2, ...)
{
  return _[a1 publicationDate];
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return _[a1 publish];
}

id objc_msgSend_publishConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 publishConnectionWithUUID:];
}

id objc_msgSend_publishProperties(void *a1, const char *a2, ...)
{
  return _[a1 publishProperties];
}

id objc_msgSend_publisherMatchID(void *a1, const char *a2, ...)
{
  return _[a1 publisherMatchID];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return _[a1 quantity];
}

id objc_msgSend_quantitySampleWithType_quantity_startDate_endDate_device_metadata_(void *a1, const char *a2, ...)
{
  return [a1 quantitySampleWithType:x0 quantity:x1 startDate:x2 endDate:x3 device:x4 metadata:x5];
}

id objc_msgSend_quantityTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 quantityTypeForIdentifier:];
}

id objc_msgSend_quantityWithUnit_doubleValue_(void *a1, const char *a2, ...)
{
  return [a1 quantityWithUnit:x0 doubleValue:x1];
}

id objc_msgSend_queryCompleteForAccessory_hwFusingType_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "queryCompleteForAccessory:hwFusingType:error:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueCount(void *a1, const char *a2, ...)
{
  return _[a1 queueCount];
}

id objc_msgSend_queueIndex(void *a1, const char *a2, ...)
{
  return _[a1 queueIndex];
}

id objc_msgSend_queueRepeatMode(void *a1, const char *a2, ...)
{
  return _[a1 queueRepeatMode];
}

id objc_msgSend_queueShuffleMode(void *a1, const char *a2, ...)
{
  return _[a1 queueShuffleMode];
}

id objc_msgSend_racpCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 racpCharacteristic];
}

id objc_msgSend_radio(void *a1, const char *a2, ...)
{
  return _[a1 radio];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:format:];
}

id objc_msgSend_read_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 read:x0 maxLength:x1];
}

id objc_msgSend_readBytesFromNSData_into_startingAt_length_info_(void *a1, const char *a2, ...)
{
  return [a1 readBytesFromNSData:x0 into:x1 startingAt:x2 length:x3 info:x4];
}

id objc_msgSend_readCurrentTime(void *a1, const char *a2, ...)
{
  return _[a1 readCurrentTime];
}

id objc_msgSend_readIEEEFloat_(void *a1, const char *a2, ...)
{
  return [a1 readIEEEFloat:];
}

id objc_msgSend_readLocalTimeInformation(void *a1, const char *a2, ...)
{
  return _[a1 readLocalTimeInformation];
}

id objc_msgSend_readNumBytes_toData_(void *a1, const char *a2, ...)
{
  return [a1 readNumBytes:x0 toData:x1];
}

id objc_msgSend_readReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return [a1 readReportData:x0 reportID:x1 reportType:x2 error:x3];
}

id objc_msgSend_readString_(void *a1, const char *a2, ...)
{
  return [a1 readString:];
}

id objc_msgSend_readUint16_(void *a1, const char *a2, ...)
{
  return [a1 readUint16:];
}

id objc_msgSend_readUint32_(void *a1, const char *a2, ...)
{
  return [a1 readUint32:];
}

id objc_msgSend_readUint48_(void *a1, const char *a2, ...)
{
  return [a1 readUint48:];
}

id objc_msgSend_readUint8_(void *a1, const char *a2, ...)
{
  return [a1 readUint8:];
}

id objc_msgSend_readValueForCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 readValueForCharacteristic:];
}

id objc_msgSend_readValueForDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 readValueForDescriptor:];
}

id objc_msgSend_readWheelSize(void *a1, const char *a2, ...)
{
  return _[a1 readWheelSize];
}

id objc_msgSend_receiveMessage_length_(void *a1, const char *a2, ...)
{
  return [a1 receiveMessage:length:];
}

id objc_msgSend_receivedMessage(void *a1, const char *a2, ...)
{
  return _[a1 receivedMessage];
}

id objc_msgSend_recentCall(void *a1, const char *a2, ...)
{
  return _[a1 recentCall];
}

id objc_msgSend_recordDatum_forType_(void *a1, const char *a2, ...)
{
  return [a1 recordDatum:forType:];
}

id objc_msgSend_recordDatum_start_end_quantityType_(void *a1, const char *a2, ...)
{
  return [a1 recordDatum:x0 start:x1 end:x2 quantityType:x3];
}

id objc_msgSend_recvDataFromAccessory_data_error_(void *a1, const char *a2, ...)
{
  return [a1 recvDataFromAccessory:data:error:];
}

id objc_msgSend_recvDataMessage(void *a1, const char *a2, ...)
{
  return _[a1 recvDataMessage];
}

id objc_msgSend_recvDataOverAACP_(void *a1, const char *a2, ...)
{
  return [a1 recvDataOverAACP:];
}

id objc_msgSend_refreshConnectionAssertion(void *a1, const char *a2, ...)
{
  return _[a1 refreshConnectionAssertion];
}

id objc_msgSend_refreshPeripherals(void *a1, const char *a2, ...)
{
  return _[a1 refreshPeripherals];
}

id objc_msgSend_refreshPersistanceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 refreshPersistanceAssertion];
}

id objc_msgSend_refreshUpdateHealthEnabledStatus(void *a1, const char *a2, ...)
{
  return _[a1 refreshUpdateHealthEnabledStatus];
}

id objc_msgSend_registerEndpoint_type_priority_(void *a1, const char *a2, ...)
{
  return [a1 registerEndpoint:type:priority:];
}

id objc_msgSend_registerFitnessService_(void *a1, const char *a2, ...)
{
  return [a1 registerFitnessService:];
}

id objc_msgSend_registerForAVNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForAVNotifications];
}

id objc_msgSend_registerForConnectionEventsWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 registerForConnectionEventsWithOptions:];
}

id objc_msgSend_registerForPowerManagementEvents(void *a1, const char *a2, ...)
{
  return _[a1 registerForPowerManagementEvents];
}

id objc_msgSend_registerNewUser(void *a1, const char *a2, ...)
{
  return _[a1 registerNewUser];
}

id objc_msgSend_registerServices(void *a1, const char *a2, ...)
{
  return _[a1 registerServices];
}

id objc_msgSend_registerUARPService_withUARPAccessory_withUARPAssetID_(void *a1, const char *a2, ...)
{
  return [a1 registerUARPService:withUARPAccessory:withUARPAssetID:];
}

id objc_msgSend_registerWithHealthKit_(void *a1, const char *a2, ...)
{
  return [a1 registerWithHealthKit:];
}

id objc_msgSend_registeredServices(void *a1, const char *a2, ...)
{
  return _[a1 registeredServices];
}

id objc_msgSend_registeredUserCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 registeredUserCharacteristic];
}

id objc_msgSend_registrationForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return [a1 registrationForAttributeID:entityID:];
}

id objc_msgSend_registrations(void *a1, const char *a2, ...)
{
  return _[a1 registrations];
}

id objc_msgSend_relayAACPUARP_uarpMsg_error_(void *a1, const char *a2, ...)
{
  return [a1 relayAACPUARP:uarpMsg:error:];
}

id objc_msgSend_relayForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 relayForIdentifier:];
}

id objc_msgSend_relayWithIdentifier_deviceType_properties_codecType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "relayWithIdentifier:deviceType:properties:codecType:");
}

id objc_msgSend_remoteCommandCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 remoteCommandCharacteristic];
}

id objc_msgSend_remoteCommandIDToString_(void *a1, const char *a2, ...)
{
  return [a1 remoteCommandIDToString:];
}

id objc_msgSend_removeAccessory_(void *a1, const char *a2, ...)
{
  return [a1 removeAccessory:];
}

id objc_msgSend_removeAlert_(void *a1, const char *a2, ...)
{
  return [a1 removeAlert:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFitnessServicesForPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 removeFitnessServicesForPeripheral:];
}

id objc_msgSend_removeFromRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 removeFromRunLoop:forMode:];
}

id objc_msgSend_removeHealthServicePairing_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 removeHealthServicePairing:withCompletion:];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeOpportunisticConnection_(void *a1, const char *a2, ...)
{
  return [a1 removeOpportunisticConnection:];
}

id objc_msgSend_removePipe_(void *a1, const char *a2, ...)
{
  return [a1 removePipe:];
}

id objc_msgSend_removeService_(void *a1, const char *a2, ...)
{
  return [a1 removeService:];
}

id objc_msgSend_reportFailure_(void *a1, const char *a2, ...)
{
  return [a1 reportFailure:];
}

id objc_msgSend_reportMapCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 reportMapCharacteristic];
}

id objc_msgSend_reportSuccess(void *a1, const char *a2, ...)
{
  return _[a1 reportSuccess];
}

id objc_msgSend_reportTypeToString_(void *a1, const char *a2, ...)
{
  return [a1 reportTypeToString:];
}

id objc_msgSend_reportsHaveMultipleReportIDs_(void *a1, const char *a2, ...)
{
  return [a1 reportsHaveMultipleReportIDs:];
}

id objc_msgSend_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion_(void *a1, const char *a2, ...)
{
  return [a1 requestAuthorizationToShareTypes:readTypes:shouldPrompt:completion:];
}

id objc_msgSend_requestLeaEasyPair_deviceIdentifier_deviceTags_(void *a1, const char *a2, ...)
{
  return [a1 requestLeaEasyPair:deviceIdentifier:deviceTags:];
}

id objc_msgSend_requestLeaStoreBondingInfo_rand_ltk_irk_name_device_(void *a1, const char *a2, ...)
{
  return [a1 requestLeaStoreBondingInfo:rand:ltk:irk:name:device:];
}

id objc_msgSend_requestNoticesBulletinsForSectionID_(void *a1, const char *a2, ...)
{
  return [a1 requestNoticesBulletinsForSectionID:];
}

id objc_msgSend_requestPairStateForDevice_(void *a1, const char *a2, ...)
{
  return [a1 requestPairStateForDevice:];
}

id objc_msgSend_requestStoreLinkKey_name_device_(void *a1, const char *a2, ...)
{
  return [a1 requestStoreLinkKey:x0 name:x1 device:x2];
}

id objc_msgSend_requestStoreLinkKeyExtended_name_device_deviceServiceMask_classOfDevice_(void *a1, const char *a2, ...)
{
  return [a1 requestStoreLinkKeyExtended:x0 name:x1 device:x2 deviceServiceMask:x3 classOfDevice:x4];
}

id objc_msgSend_requestVersionInfo_cloudAccount_(void *a1, const char *a2, ...)
{
  return [a1 requestVersionInfo:cloudAccount];
}

id objc_msgSend_requestedQuantityTypes(void *a1, const char *a2, ...)
{
  return _[a1 requestedQuantityTypes];
}

id objc_msgSend_requestedServices(void *a1, const char *a2, ...)
{
  return _[a1 requestedServices];
}

id objc_msgSend_requestedUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 requestedUUIDs];
}

id objc_msgSend_requireServicesAndMFi_(void *a1, const char *a2, ...)
{
  return [a1 requireServicesAndMFi:];
}

id objc_msgSend_resetSystemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 resetSystemTimeZone];
}

id objc_msgSend_resolveBehaviorForEventDetails_error_(void *a1, const char *a2, ...)
{
  return [a1 resolveBehaviorForEventDetails:error];
}

id objc_msgSend_respondToLeaEasyPair_device_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "respondToLeaEasyPair:device:");
}

id objc_msgSend_respondToLeaStoreBondingInfo_device_(void *a1, const char *a2, ...)
{
  return [a1 respondToLeaStoreBondingInfo:device:];
}

id objc_msgSend_respondToPairState_device_(void *a1, const char *a2, ...)
{
  return [a1 respondToPairState:device:];
}

id objc_msgSend_respondToRequest_withResult_(void *a1, const char *a2, ...)
{
  return [a1 respondToRequest:withResult:];
}

id objc_msgSend_respondToStoreLinkKey_device_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "respondToStoreLinkKey:device:");
}

id objc_msgSend_respondVersionInfo_cloudAccount_easyPairingStatus_(void *a1, const char *a2, ...)
{
  return [a1 respondVersionInfo:x0 cloudAccount:x1 easyPairingStatus:x2];
}

id objc_msgSend_responseForAppAttributeID_appIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 responseForAppAttributeID:appIdentifier:];
}

id objc_msgSend_responseForAttributeID_maxLength_attribute_(void *a1, const char *a2, ...)
{
  return [a1 responseForAttributeID:maxLength:attribute:];
}

id objc_msgSend_responseForNotificationAttributeID_maxLength_notification_(void *a1, const char *a2, ...)
{
  return [a1 responseForNotificationAttributeID:maxLength:notification:];
}

id objc_msgSend_restrictedMode(void *a1, const char *a2, ...)
{
  return _[a1 restrictedMode];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return _[a1 retainArguments];
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_(void *a1, const char *a2, ...)
{
  return [a1 retrieveConnectedPeripheralsWithServices:];
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_allowAll_(void *a1, const char *a2, ...)
{
  return [a1 retrieveConnectedPeripheralsWithServices:allowAll:];
}

id objc_msgSend_retrieveLastStoredObservation(void *a1, const char *a2, ...)
{
  return _[a1 retrieveLastStoredObservation];
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return _[a1 retrievePairedPeers];
}

id objc_msgSend_retrievePairingInfoForPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 retrievePairingInfoForPeripheral:];
}

id objc_msgSend_retrievePeripheralsWithCustomProperties_completion_(void *a1, const char *a2, ...)
{
  return [a1 retrievePeripheralsWithCustomProperties:completion:];
}

id objc_msgSend_retrievePeripheralsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 retrievePeripheralsWithIdentifiers:];
}

id objc_msgSend_retrievePeripheralsWithTags_completion_(void *a1, const char *a2, ...)
{
  return [a1 retrievePeripheralsWithTags:];
}

id objc_msgSend_retrieveStoredObservationsAfterRecordNumber_(void *a1, const char *a2, ...)
{
  return [a1 retrieveStoredObservationsAfterRecordNumber:];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveObjects_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 saveObjects:withCompletion:];
}

id objc_msgSend_scalablePipeManagerStateString(void *a1, const char *a2, ...)
{
  return _[a1 scalablePipeManagerStateString];
}

id objc_msgSend_scheduleInRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 scheduleInRunLoop:forMode:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:repeats:block:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:x0 target:x1 selector:x2 userInfo:x3 repeats:x4];
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return _[a1 screenOn];
}

id objc_msgSend_screenStateChanged_(void *a1, const char *a2, ...)
{
  return [a1 screenStateChanged:];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _[a1 secondsFromGMT];
}

id objc_msgSend_sectionID(void *a1, const char *a2, ...)
{
  return _[a1 sectionID];
}

id objc_msgSend_selectCodec_(void *a1, const char *a2, ...)
{
  return [a1 selectCodec:];
}

id objc_msgSend_sendANCSNotificationSourceRegisteredMsg_(void *a1, const char *a2, ...)
{
  return [a1 sendANCSNotificationSourceRegisteredMsg];
}

id objc_msgSend_sendAnalyticsEvent_withPayload_(void *a1, const char *a2, ...)
{
  return [a1 sendAnalyticsEvent:withPayload:];
}

id objc_msgSend_sendAudioFrame_(void *a1, const char *a2, ...)
{
  return [a1 sendAudioFrame:];
}

id objc_msgSend_sendButtonDataToUserDevice_withTimestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendButtonDataToUserDevice:withTimestamp:");
}

id objc_msgSend_sendCommand_(void *a1, const char *a2, ...)
{
  return [a1 sendCommand:];
}

id objc_msgSend_sendData_(void *a1, const char *a2, ...)
{
  return [a1 sendData:];
}

id objc_msgSend_sendDevMgmtPipeConnectedMsg_(void *a1, const char *a2, ...)
{
  return [a1 sendDevMgmtPipeConnectedMsg:];
}

id objc_msgSend_sendDevMgmtPipeDisconnectedMsg_(void *a1, const char *a2, ...)
{
  return [a1 sendDevMgmtPipeDisconnectedMsg:];
}

id objc_msgSend_sendDuplicateReadingsAsZero(void *a1, const char *a2, ...)
{
  return _[a1 sendDuplicateReadingsAsZero];
}

id objc_msgSend_sendEnableBTSyncMsg_forPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendEnableBTSyncMsg:forPeer:");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:];
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return [a1 sendMsg:args:];
}

id objc_msgSend_sendMsgIfCheckedIn_args_forClient_(void *a1, const char *a2, ...)
{
  return [a1 sendMsgIfCheckedIn:args:forClient:];
}

id objc_msgSend_sendNextQueuedMessage(void *a1, const char *a2, ...)
{
  return _[a1 sendNextQueuedMessage];
}

id objc_msgSend_sendOutputReportData_reportID_reportType_(void *a1, const char *a2, ...)
{
  return [a1 sendOutputReportData:x0 reportID:x1 reportType:x2];
}

id objc_msgSend_sendSetConnectionParametersMsg_forPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendSetConnectionParametersMsg:forPeer:");
}

id objc_msgSend_sendZeroForDuplicates(void *a1, const char *a2, ...)
{
  return _[a1 sendZeroForDuplicates];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _[a1 sender];
}

id objc_msgSend_senderDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 senderDestinationID];
}

id objc_msgSend_sensorLocationSideString(void *a1, const char *a2, ...)
{
  return _[a1 sensorLocationSideString];
}

id objc_msgSend_sensorLocationString(void *a1, const char *a2, ...)
{
  return _[a1 sensorLocationString];
}

id objc_msgSend_sentHostReadyReport(void *a1, const char *a2, ...)
{
  return _[a1 sentHostReadyReport];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serialNumberCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberCharacteristic];
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return _[a1 serverConnection];
}

id objc_msgSend_serverServiceMap(void *a1, const char *a2, ...)
{
  return _[a1 serverServiceMap];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceForClientIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 serviceForClientIdentifier:];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _[a1 services];
}

id objc_msgSend_servicesForHKQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 servicesForHKQuantityType:];
}

id objc_msgSend_sessionForCentral_(void *a1, const char *a2, ...)
{
  return [a1 sessionForCentral:];
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return _[a1 sessions];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessoryCategoryCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryCategoryCharacteristic:];
}

id objc_msgSend_setAccessoryInfo_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryInfo:forEndpointWithUUID:];
}

id objc_msgSend_setActiveCentrals_(void *a1, const char *a2, ...)
{
  return [a1 setActiveCentrals:];
}

id objc_msgSend_setActiveHIDDeviceCount_(void *a1, const char *a2, ...)
{
  return [a1 setActiveHIDDeviceCount:];
}

id objc_msgSend_setAlertMap_(void *a1, const char *a2, ...)
{
  return [a1 setAlertMap:];
}

id objc_msgSend_setAlertSource_(void *a1, const char *a2, ...)
{
  return [a1 setAlertSource:];
}

id objc_msgSend_setArgument_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 setArgument:atIndex:];
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttribute:forKey:error:];
}

id objc_msgSend_setAudio_(void *a1, const char *a2, ...)
{
  return [a1 setAudio:];
}

id objc_msgSend_setAudioBuffer_(void *a1, const char *a2, ...)
{
  return [a1 setAudioBuffer:];
}

id objc_msgSend_setAudioRoutingControl_(void *a1, const char *a2, ...)
{
  return [a1 setAudioRoutingControl:];
}

id objc_msgSend_setAuthInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setAuthInProgress:];
}

id objc_msgSend_setAuthState_(void *a1, const char *a2, ...)
{
  return [a1 setAuthState:];
}

id objc_msgSend_setAuthTimer_(void *a1, const char *a2, ...)
{
  return [a1 setAuthTimer:];
}

id objc_msgSend_setAutoDownloadAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setAutoDownloadAllowed:];
}

id objc_msgSend_setBTAuthState_(void *a1, const char *a2, ...)
{
  return [a1 setBTAuthState:];
}

id objc_msgSend_setBatteryLevelCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryLevelCharacteristic:];
}

id objc_msgSend_setBatteryPowerStateCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryPowerStateCharacteristic:];
}

id objc_msgSend_setBodySensorLocationCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setBodySensorLocationCharacteristic:];
}

id objc_msgSend_setBtSyncPeriod_(void *a1, const char *a2, ...)
{
  return [a1 setBtSyncPeriod:];
}

id objc_msgSend_setBulletin_(void *a1, const char *a2, ...)
{
  return [a1 setBulletin:];
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBundleIdentifier:];
}

id objc_msgSend_setButtonData_(void *a1, const char *a2, ...)
{
  return [a1 setButtonData:];
}

id objc_msgSend_setButtons_(void *a1, const char *a2, ...)
{
  return [a1 setButtons:];
}

id objc_msgSend_setCachedButtonsAndTimestamps_(void *a1, const char *a2, ...)
{
  return [a1 setCachedButtonsAndTimestamps:];
}

id objc_msgSend_setCertificate1Characteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCertificate1Characteristic:];
}

id objc_msgSend_setCertificate2Characteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCertificate2Characteristic:];
}

id objc_msgSend_setChallengeResponseCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setChallengeResponseCharacteristic:];
}

id objc_msgSend_setCharacteristics_(void *a1, const char *a2, ...)
{
  return [a1 setCharacteristics:];
}

id objc_msgSend_setChargingConnParamDefaults(void *a1, const char *a2, ...)
{
  return _[a1 setChargingConnParamDefaults];
}

id objc_msgSend_setCodec_(void *a1, const char *a2, ...)
{
  return [a1 setCodec:];
}

id objc_msgSend_setComboHKDevice_(void *a1, const char *a2, ...)
{
  return [a1 setComboHKDevice:];
}

id objc_msgSend_setCommandError_(void *a1, const char *a2, ...)
{
  return [a1 setCommandError:];
}

id objc_msgSend_setCommandPending_(void *a1, const char *a2, ...)
{
  return [a1 setCommandPending:];
}

id objc_msgSend_setCommandValue_(void *a1, const char *a2, ...)
{
  return [a1 setCommandValue:];
}

id objc_msgSend_setConnectAlwaysIdentifiersMap_(void *a1, const char *a2, ...)
{
  return [a1 setConnectAlwaysIdentifiersMap:];
}

id objc_msgSend_setConnectionAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionAssertion:];
}

id objc_msgSend_setConnectionAuthenticated_state_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionAuthenticated:state:];
}

id objc_msgSend_setConnectionIdleTimer_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionIdleTimer:];
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionUUID:];
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return [a1 setContactStore:];
}

id objc_msgSend_setControlPointTimer_(void *a1, const char *a2, ...)
{
  return [a1 setControlPointTimer:];
}

id objc_msgSend_setCsControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCsControlPointCharacteristic:];
}

id objc_msgSend_setCsFeatureCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCsFeatureCharacteristic:];
}

id objc_msgSend_setCsMeasurementCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCsMeasurementCharacteristic:];
}

id objc_msgSend_setCurrentElapsedTimeCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentElapsedTimeCharacteristic:];
}

id objc_msgSend_setCurrentIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentIdentifier:];
}

id objc_msgSend_setCurrentInfo_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentInfo:];
}

id objc_msgSend_setCurrentPlaybackState_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPlaybackState:];
}

id objc_msgSend_setCurrentSettings_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSettings:];
}

id objc_msgSend_setCurrentSupportedCommands_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSupportedCommands:];
}

id objc_msgSend_setCustomProperty_value_(void *a1, const char *a2, ...)
{
  return [a1 setCustomProperty:value:];
}

id objc_msgSend_setCyclingPowerControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCyclingPowerControlPointCharacteristic:];
}

id objc_msgSend_setCyclingPowerFeatureCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCyclingPowerFeatureCharacteristic:];
}

id objc_msgSend_setCyclingPowerMeasurementCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCyclingPowerMeasurementCharacteristic:];
}

id objc_msgSend_setCyclingPowerSensorLocationCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCyclingPowerSensorLocationCharacteristic:];
}

id objc_msgSend_setCyclingPowerVectorCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setCyclingPowerVectorCharacteristic:];
}

id objc_msgSend_setDatabaseChangeIncrementCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setDatabaseChangeIncrementCharacteristic:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDebugLoggingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDebugLoggingEnabled:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDenylistedIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setDenylistedIdentifiers:];
}

id objc_msgSend_setDesiredConnectionLatency_forPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredConnectionLatency:forPeripheral:];
}

id objc_msgSend_setDeviceManagement_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceManagement:];
}

id objc_msgSend_setDeviceManagementEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceManagementEndpoint:];
}

id objc_msgSend_setDeviceMatching_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceMatching:];
}

id objc_msgSend_setDeviceNotificationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceNotificationHandler:];
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchQueue:];
}

id objc_msgSend_setDoapAudioRelay_(void *a1, const char *a2, ...)
{
  return [a1 setDoapAudioRelay:];
}

id objc_msgSend_setDoapAudioStop_(void *a1, const char *a2, ...)
{
  return [a1 setDoapAudioStop:];
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDouble:forKey:];
}

id objc_msgSend_setEndpointUUID_(void *a1, const char *a2, ...)
{
  return [a1 setEndpointUUID:];
}

id objc_msgSend_setEventIndicatorCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setEventIndicatorCharacteristic:];
}

id objc_msgSend_setFeaturesCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setFeaturesCharacteristic:];
}

id objc_msgSend_setFilterCriteria_(void *a1, const char *a2, ...)
{
  return [a1 setFilterCriteria:];
}

id objc_msgSend_setFirstButton_(void *a1, const char *a2, ...)
{
  return [a1 setFirstButton:];
}

id objc_msgSend_setFwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setFwRevisionCharacteristic:];
}

id objc_msgSend_setGetReportKeyholeID_(void *a1, const char *a2, ...)
{
  return [a1 setGetReportKeyholeID:];
}

id objc_msgSend_setGhsControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setGhsControlPointCharacteristic:];
}

id objc_msgSend_setGhsDevice_(void *a1, const char *a2, ...)
{
  return [a1 setGhsDevice:];
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return [a1 setHandle:];
}

id objc_msgSend_setHeartRateMeasurementCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setHeartRateMeasurementCharacteristic:];
}

id objc_msgSend_setHeartRateScanDidTimeOut_(void *a1, const char *a2, ...)
{
  return [a1 setHeartRateScanDidTimeOut:];
}

id objc_msgSend_setHeartRateScanTimer_(void *a1, const char *a2, ...)
{
  return [a1 setHeartRateScanTimer:];
}

id objc_msgSend_setHidControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setHidControlPointCharacteristic:];
}

id objc_msgSend_setHidDevice_(void *a1, const char *a2, ...)
{
  return [a1 setHidDevice:];
}

id objc_msgSend_setHidInformationCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setHidInformationCharacteristic:];
}

id objc_msgSend_setHighPriorityLink_burstTime_(void *a1, const char *a2, ...)
{
  return [a1 setHighPriorityLink:burstTime:];
}

id objc_msgSend_setHighPriorityStream_duration_(void *a1, const char *a2, ...)
{
  return [a1 setHighPriorityStream:duration:];
}

id objc_msgSend_setHkDataCollectors_(void *a1, const char *a2, ...)
{
  return [a1 setHkDataCollectors:];
}

id objc_msgSend_setHkDatumBuffers_(void *a1, const char *a2, ...)
{
  return [a1 setHkDatumBuffers:];
}

id objc_msgSend_setHkDevice_(void *a1, const char *a2, ...)
{
  return [a1 setHkDevice:];
}

id objc_msgSend_setHkQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 setHkQuantityType:];
}

id objc_msgSend_setHkStore_(void *a1, const char *a2, ...)
{
  return [a1 setHkStore:];
}

id objc_msgSend_setHwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setHwRevisionCharacteristic:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setInertial_(void *a1, const char *a2, ...)
{
  return [a1 setInertial:];
}

id objc_msgSend_setInfo_(void *a1, const char *a2, ...)
{
  return [a1 setInfo:];
}

id objc_msgSend_setInfrared_(void *a1, const char *a2, ...)
{
  return [a1 setInfrared:];
}

id objc_msgSend_setInputElementHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInputElementHandler:];
}

id objc_msgSend_setInputElementMatching_(void *a1, const char *a2, ...)
{
  return [a1 setInputElementMatching:];
}

id objc_msgSend_setInputReportTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setInputReportTimestamp:];
}

id objc_msgSend_setIopsNotifyPercentChangeToken_(void *a1, const char *a2, ...)
{
  return [a1 setIopsNotifyPercentChangeToken:];
}

id objc_msgSend_setIsDirty_(void *a1, const char *a2, ...)
{
  return [a1 setIsDirty:];
}

id objc_msgSend_setIsEventIndicatorNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsEventIndicatorNotificationEnabled:];
}

id objc_msgSend_setIsPrimary_(void *a1, const char *a2, ...)
{
  return [a1 setIsPrimary:];
}

id objc_msgSend_setIsSendDataNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsSendDataNotificationEnabled:];
}

id objc_msgSend_setIsSendingData_(void *a1, const char *a2, ...)
{
  return [a1 setIsSendingData:];
}

id objc_msgSend_setIsStartStreamingNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsStartStreamingNotificationEnabled:];
}

id objc_msgSend_setIsStarted_(void *a1, const char *a2, ...)
{
  return [a1 setIsStarted:];
}

id objc_msgSend_setIsStopStreamingNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsStopStreamingNotificationEnabled:];
}

id objc_msgSend_setIsStreaming_(void *a1, const char *a2, ...)
{
  return [a1 setIsStreaming:];
}

id objc_msgSend_setIsValid_(void *a1, const char *a2, ...)
{
  return [a1 setIsValid:];
}

id objc_msgSend_setKnownQuantityTypes_(void *a1, const char *a2, ...)
{
  return [a1 setKnownQuantityTypes:];
}

id objc_msgSend_setLastAudioDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastAudioDate:];
}

id objc_msgSend_setLastDistributedDatum_(void *a1, const char *a2, ...)
{
  return [a1 setLastDistributedDatum:];
}

id objc_msgSend_setLastKnownAttributeValue_(void *a1, const char *a2, ...)
{
  return [a1 setLastKnownAttributeValue:];
}

id objc_msgSend_setLastKnownAttributeValue_attributeID_entityID_(void *a1, const char *a2, ...)
{
  return [a1 setLastKnownAttributeValue:x0 attributeID:x1 entityID:x2];
}

id objc_msgSend_setLastKnownSupportedCommands_(void *a1, const char *a2, ...)
{
  return [a1 setLastKnownSupportedCommands:];
}

id objc_msgSend_setLatency_(void *a1, const char *a2, ...)
{
  return [a1 setLatency:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setLiveObservationCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setLiveObservationCharacteristic:];
}

id objc_msgSend_setLoadedAttributeID_(void *a1, const char *a2, ...)
{
  return [a1 setLoadedAttributeID:];
}

id objc_msgSend_setLoadedEntityID_(void *a1, const char *a2, ...)
{
  return [a1 setLoadedEntityID:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setManufacturerNameCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setManufacturerNameCharacteristic:];
}

id objc_msgSend_setMaxCELength_(void *a1, const char *a2, ...)
{
  return [a1 setMaxCELength:];
}

id objc_msgSend_setMaxDeferment_(void *a1, const char *a2, ...)
{
  return [a1 setMaxDeferment:];
}

id objc_msgSend_setMaxInterval_(void *a1, const char *a2, ...)
{
  return [a1 setMaxInterval:];
}

id objc_msgSend_setMaxPayloadSize_(void *a1, const char *a2, ...)
{
  return [a1 setMaxPayloadSize:];
}

id objc_msgSend_setMaxPeripheralLatency_(void *a1, const char *a2, ...)
{
  return [a1 setMaxPeripheralLatency:];
}

id objc_msgSend_setMfiAuthChannel_(void *a1, const char *a2, ...)
{
  return [a1 setMfiAuthChannel:];
}

id objc_msgSend_setMfiPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 setMfiPeripheral:];
}

id objc_msgSend_setMfiVoucher_(void *a1, const char *a2, ...)
{
  return [a1 setMfiVoucher:];
}

id objc_msgSend_setMinCELength_(void *a1, const char *a2, ...)
{
  return [a1 setMinCELength:];
}

id objc_msgSend_setMinInterval_(void *a1, const char *a2, ...)
{
  return [a1 setMinInterval:];
}

id objc_msgSend_setModelNumberCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setModelNumberCharacteristic:];
}

id objc_msgSend_setNextDSTTransitionTimer_(void *a1, const char *a2, ...)
{
  return [a1 setNextDSTTransitionTimer:];
}

id objc_msgSend_setNormalConnParamDefaults(void *a1, const char *a2, ...)
{
  return _[a1 setNormalConnParamDefaults];
}

id objc_msgSend_setNormalPeripheralLatency(void *a1, const char *a2, ...)
{
  return _[a1 setNormalPeripheralLatency];
}

id objc_msgSend_setNotificationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationEnabled:];
}

id objc_msgSend_setNotificationPort_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationPort:];
}

id objc_msgSend_setNotify_forCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setNotify:forCharacteristic:];
}

id objc_msgSend_setNotifyValue_forCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setNotifyValue:forCharacteristic:];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return [a1 setNumberStyle:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObservationScheduleChangedCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setObservationScheduleChangedCharacteristic:];
}

id objc_msgSend_setObserverFeed_(void *a1, const char *a2, ...)
{
  return [a1 setObserverFeed:];
}

id objc_msgSend_setOffset_(void *a1, const char *a2, ...)
{
  return [a1 setOffset:];
}

id objc_msgSend_setOpportunisticConnection_(void *a1, const char *a2, ...)
{
  return [a1 setOpportunisticConnection:];
}

id objc_msgSend_setOpportunisticConnection_forAccessoryUUID_(void *a1, const char *a2, ...)
{
  return [a1 setOpportunisticConnection:forAccessoryUUID:];
}

id objc_msgSend_setOpportunisticRefCount_(void *a1, const char *a2, ...)
{
  return [a1 setOpportunisticRefCount:];
}

id objc_msgSend_setPairedFitnessDeviceUUIDS_(void *a1, const char *a2, ...)
{
  return [a1 setPairedFitnessDeviceUUIDS:];
}

id objc_msgSend_setPairingData_(void *a1, const char *a2, ...)
{
  return [a1 setPairingData:];
}

id objc_msgSend_setPeerChannel_(void *a1, const char *a2, ...)
{
  return [a1 setPeerChannel:];
}

id objc_msgSend_setPending_(void *a1, const char *a2, ...)
{
  return [a1 setPending:];
}

id objc_msgSend_setPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 setPeripheral:];
}

id objc_msgSend_setPeripherals_(void *a1, const char *a2, ...)
{
  return [a1 setPeripherals:];
}

id objc_msgSend_setPersist_(void *a1, const char *a2, ...)
{
  return [a1 setPersist:];
}

id objc_msgSend_setPersistanceAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setPersistanceAssertion:];
}

id objc_msgSend_setPersistentDomain_forName_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentDomain:forName:];
}

id objc_msgSend_setPmIsSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setPmIsSuspended:];
}

id objc_msgSend_setPmNotifier_(void *a1, const char *a2, ...)
{
  return [a1 setPmNotifier:];
}

id objc_msgSend_setPmService_(void *a1, const char *a2, ...)
{
  return [a1 setPmService:];
}

id objc_msgSend_setPnpIDCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setPnpIDCharacteristic:];
}

id objc_msgSend_setPowerSourceDetails_(void *a1, const char *a2, ...)
{
  return [a1 setPowerSourceDetails:];
}

id objc_msgSend_setPreferredInterval_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredInterval:];
}

id objc_msgSend_setPreferredPeripheralLatency_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredPeripheralLatency:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProperty_value_forConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 setProperty:value:forConnectionWithUUID:];
}

id objc_msgSend_setProperty_value_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 setProperty:value:forEndpointWithUUID:];
}

id objc_msgSend_setProximity_(void *a1, const char *a2, ...)
{
  return [a1 setProximity:];
}

id objc_msgSend_setProximityData_(void *a1, const char *a2, ...)
{
  return [a1 setProximityData:];
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return [a1 setQueue:];
}

id objc_msgSend_setRacpCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setRacpCharacteristic:];
}

id objc_msgSend_setRadio_(void *a1, const char *a2, ...)
{
  return [a1 setRadio:];
}

id objc_msgSend_setReceivedMessage_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedMessage:];
}

id objc_msgSend_setRecvDataMessage_(void *a1, const char *a2, ...)
{
  return [a1 setRecvDataMessage:];
}

id objc_msgSend_setRegisteredAttributeIDs_entityID_(void *a1, const char *a2, ...)
{
  return [a1 setRegisteredAttributeIDs:entityID];
}

id objc_msgSend_setRegisteredServices_(void *a1, const char *a2, ...)
{
  return [a1 setRegisteredServices:];
}

id objc_msgSend_setRegisteredUserCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setRegisteredUserCharacteristic:];
}

id objc_msgSend_setReport_reportLength_reportID_reportType_(void *a1, const char *a2, ...)
{
  return [a1 setReport:reportLength:reportID:reportType:];
}

id objc_msgSend_setReport_reportLength_reportID_reportType_keyholeID_(void *a1, const char *a2, ...)
{
  return [a1 setReport:reportLength:reportID:reportType:keyholeID:];
}

id objc_msgSend_setReport_reportLength_reportID_reportType_keyholeID_error_(void *a1, const char *a2, ...)
{
  return [a1 setReport:reportLength:reportID:reportType:keyholeID:error:];
}

id objc_msgSend_setReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return [a1 setReportData:reportData reportID:reportID reportType:reportType error:error];
}

id objc_msgSend_setReportMapCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setReportMapCharacteristic:];
}

id objc_msgSend_setRequestedQuantityTypes_(void *a1, const char *a2, ...)
{
  return [a1 setRequestedQuantityTypes:];
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setScreenOnChangedHandler:];
}

id objc_msgSend_setSelectedCodecCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedCodecCharacteristic:];
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return [a1 setSelector:];
}

id objc_msgSend_setSendDataCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSendDataCharacteristic:];
}

id objc_msgSend_setSender_(void *a1, const char *a2, ...)
{
  return [a1 setSender:];
}

id objc_msgSend_setSerialNumberCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSerialNumberCharacteristic:];
}

id objc_msgSend_setServerConnection_(void *a1, const char *a2, ...)
{
  return [a1 setServerConnection:];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return [a1 setService:];
}

id objc_msgSend_setServiceUUID_forQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 setServiceUUID:forQuantityType:];
}

id objc_msgSend_setServiceUUIDForSupportedHKQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 setServiceUUIDForSupportedHKQuantityType:];
}

id objc_msgSend_setSessions_(void *a1, const char *a2, ...)
{
  return [a1 setSessions:];
}

id objc_msgSend_setShouldPersist_(void *a1, const char *a2, ...)
{
  return [a1 setShouldPersist:];
}

id objc_msgSend_setSilent_(void *a1, const char *a2, ...)
{
  return [a1 setSilent:];
}

id objc_msgSend_setSiriXpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 setSiriXpcConnection:];
}

id objc_msgSend_setSoundSensorXpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 setSoundSensorXpcConnection:];
}

id objc_msgSend_setStartPriority_(void *a1, const char *a2, ...)
{
  return [a1 setStartPriority:];
}

id objc_msgSend_setStartStreamingCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setStartStreamingCharacteristic:];
}

id objc_msgSend_setStartTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setStartTimeout:];
}

id objc_msgSend_setStartTimer_(void *a1, const char *a2, ...)
{
  return [a1 setStartTimer:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStopStreamingCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setStopStreamingCharacteristic:];
}

id objc_msgSend_setStoredObservationCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setStoredObservationCharacteristic:];
}

id objc_msgSend_setSupportedCodecsCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSupportedCodecsCharacteristic:];
}

id objc_msgSend_setSwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setSwRevisionCharacteristic:];
}

id objc_msgSend_setSystemMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setSystemMonitor:];
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setThreadIdentifier:];
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setTimeout:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTouch_(void *a1, const char *a2, ...)
{
  return [a1 setTouch:];
}

id objc_msgSend_setTryCount_(void *a1, const char *a2, ...)
{
  return [a1 setTryCount:];
}

id objc_msgSend_setTxDataQueue_(void *a1, const char *a2, ...)
{
  return [a1 setTxDataQueue:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUarpAccessory_(void *a1, const char *a2, ...)
{
  return [a1 setUarpAccessory:];
}

id objc_msgSend_setUarpAssetID_(void *a1, const char *a2, ...)
{
  return [a1 setUarpAssetID:];
}

id objc_msgSend_setUarpDataControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setUarpDataControlPointCharacteristic:];
}

id objc_msgSend_setUarpOverAACP_(void *a1, const char *a2, ...)
{
  return [a1 setUarpOverAACP:];
}

id objc_msgSend_setUdiForMedicalDevicesCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setUdiForMedicalDevicesCharacteristic:];
}

id objc_msgSend_setUidGenerator_(void *a1, const char *a2, ...)
{
  return [a1 setUidGenerator:];
}

id objc_msgSend_setUidMap_(void *a1, const char *a2, ...)
{
  return [a1 setUidMap:];
}

id objc_msgSend_setUnit_forQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 setUnit:forQuantityType:];
}

id objc_msgSend_setUnitForSupportedHKQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 setUnitForSupportedHKQuantityType:];
}

id objc_msgSend_setUrgency_(void *a1, const char *a2, ...)
{
  return [a1 setUrgency:];
}

id objc_msgSend_setUseKeyholeOnGet_(void *a1, const char *a2, ...)
{
  return [a1 setUseKeyholeOnGet:];
}

id objc_msgSend_setUserControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setUserControlPointCharacteristic:];
}

id objc_msgSend_setUserDevices_(void *a1, const char *a2, ...)
{
  return [a1 setUserDevices:];
}

id objc_msgSend_setUserIndexCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setUserIndexCharacteristic:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVersionCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 setVersionCharacteristic:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWorkoutInSession_(void *a1, const char *a2, ...)
{
  return [a1 setWorkoutInSession:];
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 setXpcConnection:];
}

id objc_msgSend_set_alwaysCollectQuantityTypes_(void *a1, const char *a2, ...)
{
  return [a1 set_alwaysCollectQuantityTypes:];
}

id objc_msgSend_set_isFitnessClassicDevice_(void *a1, const char *a2, ...)
{
  return [a1 set_isFitnessClassicDevice:];
}

id objc_msgSend_set_updateHealthEnabled_(void *a1, const char *a2, ...)
{
  return [a1 set_updateHealthEnabled:];
}

id objc_msgSend_setupAudioRoutingControl(void *a1, const char *a2, ...)
{
  return _[a1 setupAudioRoutingControl];
}

id objc_msgSend_setupNextDSTTransitionTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupNextDSTTransitionTimer];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _[a1 sharedClient];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return _[a1 sharedPairingAgent];
}

id objc_msgSend_shouldCollectFromDevice_(void *a1, const char *a2, ...)
{
  return [a1 shouldCollectFromDevice:];
}

id objc_msgSend_shouldConnectDevice_(void *a1, const char *a2, ...)
{
  return [a1 shouldConnectDevice:];
}

id objc_msgSend_shouldForwardFitnessService_quantityType_(void *a1, const char *a2, ...)
{
  return [a1 shouldForwardFitnessService:quantityType:];
}

id objc_msgSend_shouldPersist(void *a1, const char *a2, ...)
{
  return _[a1 shouldPersist];
}

id objc_msgSend_shouldRestartCollecting(void *a1, const char *a2, ...)
{
  return _[a1 shouldRestartCollecting];
}

id objc_msgSend_showsInNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 showsInNotificationCenter];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_signalCommandCondition_error_(void *a1, const char *a2, ...)
{
  return [a1 signalCommandCondition:error:];
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:")
}

id objc_msgSend_silent(void *a1, const char *a2, ...)
{
  return _[a1 silent];
}

id objc_msgSend_siriXpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 siriXpcConnection];
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:reply:");
}

id objc_msgSend_softwareRevision(void *a1, const char *a2, ...)
{
  return _[a1 softwareRevision];
}

id objc_msgSend_soundSensorXpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 soundSensorXpcConnection];
}

id objc_msgSend_stageFirmwareUpdateOnAccessoryList_withUserIntent_(void *a1, const char *a2, ...)
{
  return [a1 stageFirmwareUpdateOnAccessoryList:withUserIntent:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startClientServices(void *a1, const char *a2, ...)
{
  return _[a1 startClientServices];
}

id objc_msgSend_startCollectionTimer(void *a1, const char *a2, ...)
{
  return _[a1 startCollectionTimer];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startLiveHealthObservation(void *a1, const char *a2, ...)
{
  return _[a1 startLiveHealthObservation];
}

id objc_msgSend_startNotifications(void *a1, const char *a2, ...)
{
  return _[a1 startNotifications];
}

id objc_msgSend_startPersonalizationHelperService_entitlement_(void *a1, const char *a2, ...)
{
  return [a1 startPersonalizationHelperService:entitlement];
}

id objc_msgSend_startPriority(void *a1, const char *a2, ...)
{
  return _[a1 startPriority];
}

id objc_msgSend_startStream_(void *a1, const char *a2, ...)
{
  return [a1 startStream:];
}

id objc_msgSend_startStreaming(void *a1, const char *a2, ...)
{
  return _[a1 startStreaming];
}

id objc_msgSend_startStreaming_(void *a1, const char *a2, ...)
{
  return [a1 startStreaming:];
}

id objc_msgSend_startTapToRadar(void *a1, const char *a2, ...)
{
  return _[a1 startTapToRadar];
}

id objc_msgSend_startTapToRadar_(void *a1, const char *a2, ...)
{
  return [a1 startTapToRadar:];
}

id objc_msgSend_startTimeout(void *a1, const char *a2, ...)
{
  return _[a1 startTimeout];
}

id objc_msgSend_startTimer(void *a1, const char *a2, ...)
{
  return _[a1 startTimer];
}

id objc_msgSend_startingClientServices(void *a1, const char *a2, ...)
{
  return _[a1 startingClientServices];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateToStr_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stateToStr:");
}

id objc_msgSend_stictionCollection(void *a1, const char *a2, ...)
{
  return _[a1 stictionCollection];
}

id objc_msgSend_stictionCollectionRestartTimer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stictionCollectionRestartTimer:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopCollectionTimer(void *a1, const char *a2, ...)
{
  return _[a1 stopCollectionTimer];
}

id objc_msgSend_stopHeartRateScanTimer(void *a1, const char *a2, ...)
{
  return _[a1 stopHeartRateScanTimer];
}

id objc_msgSend_stopNotifications(void *a1, const char *a2, ...)
{
  return _[a1 stopNotifications];
}

id objc_msgSend_stopStream_(void *a1, const char *a2, ...)
{
  return [a1 stopStream:];
}

id objc_msgSend_stopStreaming_(void *a1, const char *a2, ...)
{
  return [a1 stopStreaming:];
}

id objc_msgSend_stopTapToRadar(void *a1, const char *a2, ...)
{
  return _[a1 stopTapToRadar];
}

id objc_msgSend_storeCollectionState(void *a1, const char *a2, ...)
{
  return _[a1 storeCollectionState];
}

id objc_msgSend_storeDatumsForQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 storeDatumsForQuantityType:];
}

id objc_msgSend_storeDatumsForQuantityType_usingHKDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "storeDatumsForQuantityType:usingHKDevice:");
}

id objc_msgSend_storeDeviceSettings_inEarEnable_doubleTapMode_deviceSettings_deviceName_device_(void *a1, const char *a2, ...)
{
  return [a1 storeDeviceSettings:x0 inEarEnable:x1 doubleTapMode:x2 deviceSettings:x3 deviceName:x4 device:x5];
}

id objc_msgSend_storedObservationCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 storedObservationCharacteristic];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return _[a1 stream];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _[a1 streamError];
}

id objc_msgSend_streamID(void *a1, const char *a2, ...)
{
  return _[a1 streamID];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:];
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return [a1 stringFromContact:style:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subdataWithRange:];
}

id objc_msgSend_subscribeForQuantityTypes_(void *a1, const char *a2, ...)
{
  return [a1 subscribeForQuantityTypes:];
}

id objc_msgSend_subscribedCentrals(void *a1, const char *a2, ...)
{
  return _[a1 subscribedCentrals];
}

id objc_msgSend_subscriptionCount(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionCount];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_substringWithValidUnicode(void *a1, const char *a2, ...)
{
  return _[a1 substringWithValidUnicode];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_supportedCommands(void *a1, const char *a2, ...)
{
  return _[a1 supportedCommands];
}

id objc_msgSend_supportedCommandsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 supportedCommandsDidChange];
}

id objc_msgSend_supportedCommandsDidChange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "supportedCommandsDidChange:");
}

id objc_msgSend_supportedQuantityTypesForServiceUUID_(void *a1, const char *a2, ...)
{
  return [a1 supportedQuantityTypesForServiceUUID:];
}

id objc_msgSend_supportsHKQuantityType_(void *a1, const char *a2, ...)
{
  return [a1 supportsHKQuantityType:];
}

id objc_msgSend_swRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 swRevisionCharacteristic];
}

id objc_msgSend_systemLocale(void *a1, const char *a2, ...)
{
  return _[a1 systemLocale];
}

id objc_msgSend_systemMonitor(void *a1, const char *a2, ...)
{
  return _[a1 systemMonitor];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_tag_(void *a1, const char *a2, ...)
{
  return [a1 tag:];
}

id objc_msgSend_tapToRadarIsOngoing(void *a1, const char *a2, ...)
{
  return _[a1 tapToRadarIsOngoing];
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 telephonyProvider];
}

id objc_msgSend_threadID(void *a1, const char *a2, ...)
{
  return _[a1 threadID];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timestampSync(void *a1, const char *a2, ...)
{
  return _[a1 timestampSync];
}

id objc_msgSend_timestampSyncIsValid_hostTimestamp_btSyncTimestampUs_(void *a1, const char *a2, ...)
{
  return [a1 timestampSyncIsValid:x0 hostTimestamp:x1 btSyncTimestampUs:x2];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _[a1 touch];
}

id objc_msgSend_touchData(void *a1, const char *a2, ...)
{
  return _[a1 touchData];
}

id objc_msgSend_trackAlbum(void *a1, const char *a2, ...)
{
  return _[a1 trackAlbum];
}

id objc_msgSend_trackArtist(void *a1, const char *a2, ...)
{
  return _[a1 trackArtist];
}

id objc_msgSend_trackDuration(void *a1, const char *a2, ...)
{
  return _[a1 trackDuration];
}

id objc_msgSend_trackTitle(void *a1, const char *a2, ...)
{
  return _[a1 trackTitle];
}

id objc_msgSend_trashVoicemail_(void *a1, const char *a2, ...)
{
  return [a1 trashVoicemail:];
}

id objc_msgSend_tryCount(void *a1, const char *a2, ...)
{
  return _[a1 tryCount];
}

id objc_msgSend_tuActiveCallAlerts(void *a1, const char *a2, ...)
{
  return _[a1 tuActiveCallAlerts];
}

id objc_msgSend_tuActiveCalls(void *a1, const char *a2, ...)
{
  return _[a1 tuActiveCalls];
}

id objc_msgSend_tuCallCenter(void *a1, const char *a2, ...)
{
  return _[a1 tuCallCenter];
}

id objc_msgSend_tuIncomingCallAlerts(void *a1, const char *a2, ...)
{
  return _[a1 tuIncomingCallAlerts];
}

id objc_msgSend_tuIncomingCalls(void *a1, const char *a2, ...)
{
  return _[a1 tuIncomingCalls];
}

id objc_msgSend_txDataQueue(void *a1, const char *a2, ...)
{
  return _[a1 txDataQueue];
}

id objc_msgSend_txMessageQueue(void *a1, const char *a2, ...)
{
  return _[a1 txMessageQueue];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uarpAACPTransportAvailability(void *a1, const char *a2, ...)
{
  return _[a1 uarpAACPTransportAvailability];
}

id objc_msgSend_uarpAccessory(void *a1, const char *a2, ...)
{
  return _[a1 uarpAccessory];
}

id objc_msgSend_uarpAssetID(void *a1, const char *a2, ...)
{
  return _[a1 uarpAssetID];
}

id objc_msgSend_uarpController(void *a1, const char *a2, ...)
{
  return _[a1 uarpController];
}

id objc_msgSend_uarpDataControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 uarpDataControlPointCharacteristic];
}

id objc_msgSend_uarpLogPath(void *a1, const char *a2, ...)
{
  return _[a1 uarpLogPath];
}

id objc_msgSend_uarpOverAACP(void *a1, const char *a2, ...)
{
  return _[a1 uarpOverAACP];
}

id objc_msgSend_uarpServiceForAccessoryUuid_(void *a1, const char *a2, ...)
{
  return [a1 uarpServiceForAccessoryUuid:];
}

id objc_msgSend_udiForMedicalDevices(void *a1, const char *a2, ...)
{
  return _[a1 udiForMedicalDevices];
}

id objc_msgSend_udiForMedicalDevicesCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 udiForMedicalDevicesCharacteristic];
}

id objc_msgSend_uidGenerator(void *a1, const char *a2, ...)
{
  return _[a1 uidGenerator];
}

id objc_msgSend_uidMap(void *a1, const char *a2, ...)
{
  return _[a1 uidMap];
}

id objc_msgSend_unexpectedDisconnection_(void *a1, const char *a2, ...)
{
  return [a1 unexpectedDisconnection:];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _[a1 uniqueId];
}

id objc_msgSend_unitFromString_(void *a1, const char *a2, ...)
{
  return [a1 unitFromString:];
}

id objc_msgSend_unitString(void *a1, const char *a2, ...)
{
  return _[a1 unitString];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unpublishProperties(void *a1, const char *a2, ...)
{
  return _[a1 unpublishProperties];
}

id objc_msgSend_unregisterAllEndpoints(void *a1, const char *a2, ...)
{
  return _[a1 unregisterAllEndpoints];
}

id objc_msgSend_unregisterForAVNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForAVNotifications];
}

id objc_msgSend_unregisterUARPService_withUARPAccessory_(void *a1, const char *a2, ...)
{
  return [a1 unregisterUARPService:withUARPAccessory:];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedShortValue];
}

id objc_msgSend_updateAvailabilityStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateAvailabilityStatus];
}

id objc_msgSend_updateComboString_withValue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateComboString:withValue:")];
}

id objc_msgSend_updateDNDEventDetails_(void *a1, const char *a2, ...)
{
  return [a1 updateDNDEventDetails:];
}

id objc_msgSend_updateDataSource_central_(void *a1, const char *a2, ...)
{
  return [a1 updateDataSource:central:];
}

id objc_msgSend_updateForSensorLocation(void *a1, const char *a2, ...)
{
  return _[a1 updateForSensorLocation];
}

id objc_msgSend_updateNotificationSource_notification_sourceFlags_(void *a1, const char *a2, ...)
{
  return [a1 updateNotificationSource:x0 notification:x1 sourceFlags:x2];
}

id objc_msgSend_updateNotificationSource_notification_sourceFlags_centrals_(void *a1, const char *a2, ...)
{
  return [a1 updateNotificationSource:x0 notification:x1 sourceFlags:x2 centrals:x3];
}

id objc_msgSend_updatePairedDevices_(void *a1, const char *a2, ...)
{
  return [a1 updatePairedDevices:];
}

id objc_msgSend_updatePeripheral_options_(void *a1, const char *a2, ...)
{
  return [a1 updatePeripheral:options:];
}

id objc_msgSend_updatePowerSource_(void *a1, const char *a2, ...)
{
  return [a1 updatePowerSource:];
}

id objc_msgSend_updateRequestedQuantityTypes_(void *a1, const char *a2, ...)
{
  return [a1 updateRequestedQuantityTypes:];
}

id objc_msgSend_updateScan(void *a1, const char *a2, ...)
{
  return _[a1 updateScan];
}

id objc_msgSend_updateValue_forCharacteristic_onSubscribedCentrals_(void *a1, const char *a2, ...)
{
  return [a1 updateValue:x0 forCharacteristic:x1 onSubscribedCentrals:x2];
}

id objc_msgSend_updateWithValue_characteristic_centrals_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateWithValue:characteristic:centrals:");
}

id objc_msgSend_updateZeroDuplicateValues(void *a1, const char *a2, ...)
{
  return _[a1 updateZeroDuplicateValues];
}

id objc_msgSend_updatedCadenceMeasurementValue_at_(void *a1, const char *a2, ...)
{
  return [a1 updatedCadenceMeasurementValue:x0 at:x1];
}

id objc_msgSend_updatedCadenceMeasurementValueForRevolutions_andCrankEventTime_timeStamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updatedCadenceMeasurementValueForRevolutions:andCrankEventTime:timeStamp:");
}

id objc_msgSend_updatedControlPointCharacteristicValue(void *a1, const char *a2, ...)
{
  return _[a1 updatedControlPointCharacteristicValue];
}

id objc_msgSend_updatedFeatureCharacteristicValue(void *a1, const char *a2, ...)
{
  return _[a1 updatedFeatureCharacteristicValue];
}

id objc_msgSend_updatedMeasurementCharacteristicValue_at_(void *a1, const char *a2, ...)
{
  return [a1 updatedMeasurementCharacteristicValue:at:];
}

id objc_msgSend_updatedPowerMeasurementValue_timeStamp_(void *a1, const char *a2, ...)
{
  return [a1 updatedPowerMeasurementValue:x0 timeStamp:x1];
}

id objc_msgSend_updatedSensorLocationCharacteristicValue(void *a1, const char *a2, ...)
{
  return _[a1 updatedSensorLocationCharacteristicValue];
}

id objc_msgSend_updatedSpeedMeasurementValue_at_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updatedSpeedMeasurementValue:at:");
}

id objc_msgSend_updatedSpeedMeasurementValueForRevolutions_andWheelEventTime_timeStamp_(void *a1, const char *a2, ...)
{
  return [a1 updatedSpeedMeasurementValueForRevolutions:andWheelEventTime:timeStamp:];
}

id objc_msgSend_updatedVectorCharacteristicValue(void *a1, const char *a2, ...)
{
  return _[a1 updatedVectorCharacteristicValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_useKeyholeOnGet(void *a1, const char *a2, ...)
{
  return _[a1 useKeyholeOnGet];
}

id objc_msgSend_userControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 userControlPointCharacteristic];
}

id objc_msgSend_userDevices(void *a1, const char *a2, ...)
{
  return _[a1 userDevices];
}

id objc_msgSend_userIndexCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 userIndexCharacteristic];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_uuidToString_(void *a1, const char *a2, ...)
{
  return [a1 uuidToString:];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 valueTimestamp];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _[a1 vendorID];
}

id objc_msgSend_vendorIDSource(void *a1, const char *a2, ...)
{
  return _[a1 vendorIDSource];
}

id objc_msgSend_vendorIDSourceString(void *a1, const char *a2, ...)
{
  return _[a1 vendorIDSourceString];
}

id objc_msgSend_verifyButtonDriverOpenedByEventSystem_(void *a1, const char *a2, ...)
{
  return [a1 verifyButtonDriverOpenedByEventSystem:];
}

id objc_msgSend_verifyCertificateIsUnique(void *a1, const char *a2, ...)
{
  return _[a1 verifyCertificateIsUnique];
}

id objc_msgSend_verifyChallenge(void *a1, const char *a2, ...)
{
  return _[a1 verifyChallenge];
}

id objc_msgSend_versionCharacteristic(void *a1, const char *a2, ...)
{
  return _[a1 versionCharacteristic];
}

id objc_msgSend_voicemail(void *a1, const char *a2, ...)
{
  return _[a1 voicemail];
}

id objc_msgSend_voicemailsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 voicemailsPassingTest:];
}

id objc_msgSend_volumeDidChangeForCategory_(void *a1, const char *a2, ...)
{
  return [a1 volumeDidChangeForCategory:];
}

id objc_msgSend_vvManager(void *a1, const char *a2, ...)
{
  return _[a1 vvManager];
}

id objc_msgSend_vvUnreadVoicemails(void *a1, const char *a2, ...)
{
  return _[a1 vvUnreadVoicemails];
}

id objc_msgSend_vvVoicemailAlerts(void *a1, const char *a2, ...)
{
  return _[a1 vvVoicemailAlerts];
}

id objc_msgSend_waitForSiriAudioToStop_(void *a1, const char *a2, ...)
{
  return [a1 waitForSiriAudioToStop:];
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return [a1 waitUntilDate:];
}

id objc_msgSend_wasPairedAfter_(void *a1, const char *a2, ...)
{
  return [a1 wasPairedAfter:];
}

id objc_msgSend_wasUUIDRequestedForLogRetrieval_(void *a1, const char *a2, ...)
{
  return [a1 wasUUIDRequestedForLogRetrieval:];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return _[a1 weekday];
}

id objc_msgSend_workoutInSession(void *a1, const char *a2, ...)
{
  return _[a1 workoutInSession];
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 write:x0 maxLength:x1];
}

id objc_msgSend_writeBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 writeBytes:x0 length:x1];
}

id objc_msgSend_writeControlPointCommand_(void *a1, const char *a2, ...)
{
  return [a1 writeControlPointCommand:];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return [a1 writeData:];
}

id objc_msgSend_writeData_forCharacteristic_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeData:forCharacteristic:withResponse:");
}

id objc_msgSend_writeReportData_reportID_reportType_withResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeReportData:reportID:reportType:withResponse:error:");
}

id objc_msgSend_writeString_(void *a1, const char *a2, ...)
{
  return [a1 writeString:];
}

id objc_msgSend_writeUint16_(void *a1, const char *a2, ...)
{
  return [a1 writeUint16:];
}

id objc_msgSend_writeUint32_(void *a1, const char *a2, ...)
{
  return [a1 writeUint32:];
}

id objc_msgSend_writeUint8_(void *a1, const char *a2, ...)
{
  return [a1 writeUint8:];
}

id objc_msgSend_writeValue_forCharacteristic_type_(void *a1, const char *a2, ...)
{
  return [a1 writeValue:forCharacteristic:type:];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return _[a1 xpcServer];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return _[a1 year];
}