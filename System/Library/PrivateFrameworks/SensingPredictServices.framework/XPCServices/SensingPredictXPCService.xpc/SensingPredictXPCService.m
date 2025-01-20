uint64_t sub_100005690(uint64_t a1)
{
  uint64_t vars8;

  qword_10001A528 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_100005894(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

id sub_100005998(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setNoiseLevel:");
}

id sub_100005A14(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

id sub_100006664(uint64_t a1)
{
  if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/SensingPredictBundle.bundle" delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  [*(id *)(a1 + 32) _startMonitoringVisits];
  v8 = *(void **)(a1 + 32);

  return _[v8 _requestPlaceInference];
}

void sub_1000067BC(uint64_t a1)
{
  if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _stopPollingForLocationCategory];
  [*(id *)(a1 + 32) _stopMonitoringVisits];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

void sub_100006E18(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  id v8 = [v4 firstObject];

  uint64_t v5 = [v8 _loiIdentifier];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v7 = [v8 _loiIdentifier];
    [v6 _updateLocationCategoryWithBestPlaceInferenceIdentifier:v7];
  }
  else
  {
    if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [*(id *)(a1 + 32) _startPollingForLocationCategory];
  }
}

id sub_1000071D0(uint64_t a1)
{
  if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize()))
  {
    id v4 = +[NSDate now];
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _stopPollingForLocationCategory];
}

id sub_100007278(uint64_t a1)
{
  if (dword_10001A0E8 <= 30 && (dword_10001A0E8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = +[NSDate now];
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007368;
  v6[3] = &unk_1000146F0;
  v6[4] = v2;
  return objc_msgSend(v3, "_fetchPlaceInferencesWithFidelityPolicy:handler:", 0, v6, v5);
}

void sub_100007368(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24);
    v7 = [v5 placemark];
    id v8 = [v7 _geoMapItemHandle];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000745C;
    v9[3] = &unk_100014740;
    v9[4] = *(void *)(a1 + 32);
    [v6 resolveMapItemFromHandle:v8 completionHandler:v9];
  }
}

void sub_10000745C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000074F8;
  v7[3] = &unk_100014718;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_1000074F8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _poiCategory];
  id v4 = [v2 _getLocationCategoryFromGEOPOI:v3];

  id result = [*(id *)(a1 + 32) _updateLocationCategory:v4];
  if (v4)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 _stopPollingForLocationCategory];
  }
  return result;
}

void sub_1000077EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007888;
  v7[3] = &unk_100014718;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_100007888(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_getLocationCategoryFromRTLocationOfInterestType:", objc_msgSend(*(id *)(a1 + 40), "type"));
  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) mapItem];
    uint64_t v5 = [v4 category];
    id v2 = [v3 _getLocationCategoryFromGEOPOI:v5];
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 _updateLocationCategory:v2];
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v4 = +[SPXPCService sharedInstance];
  uint64_t v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

id sub_100007E00(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

void sub_100007EE4(id a1, unsigned __int8 a2)
{
  uint64_t v2 = a2;
  id v3 = +[SPXPCService sharedInstance];
  [v3 locationCategoryChanged:v2];

  id v4 = +[SPXPCService sharedInstance];
  [v4 contextEventUpdated:v2 fusedState:(v2 - 6) < 4];
}

void sub_100007FE4(id a1, unsigned int a2)
{
  if (dword_10001A218 <= 30 && (dword_10001A218 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

id sub_100008128(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

uint64_t sub_10000827C(uint64_t a1)
{
  qword_10001A540 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_1000083C4(uint64_t a1)
{
  if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 _prefsChanged];
}

id sub_100008614(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

id sub_100008DD8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _updateContextEventSignal];
}

id sub_100008E64(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _updateLocationCategory];
}

void sub_1000093EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009424(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009434(uint64_t a1)
{
}

uint64_t sub_10000943C(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_10001A288 <= 90 && (dword_10001A288 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id result = *(void *)(v1 + 32);
    if (result)
    {
      uint64_t v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

void sub_100009714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009750(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    if (dword_10001A288 <= 90)
    {
      if (dword_10001A288 != -1) {
        return LogPrintF();
      }
      id result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

unint64_t sub_100009AE0()
{
  sub_100009F74(&qword_10001A508);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000FF30;
  *(void *)(inited + 32) = 0x6469766F72504F49;
  *(void *)(inited + 40) = 0xEF7373616C437265;
  *(void *)(inited + 48) = 0x7665444449484F49;
  *(void *)(inited + 56) = 0xEB00000000656369;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0xD000000000000010;
  *(void *)(inited + 88) = 0x8000000100013420;
  *(_DWORD *)(inited + 96) = 65333;
  *(void *)(inited + 120) = &type metadata for Int32;
  strcpy((char *)(inited + 128), "PrimaryUsage");
  *(void *)(inited + 168) = &type metadata for Int;
  *(unsigned char *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(void *)(inited + 144) = 1;
  unint64_t result = sub_100009BD8(inited);
  qword_10001A550 = result;
  return result;
}

unint64_t sub_100009BD8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009F74(&qword_10001A510);
  uint64_t v2 = sub_10000E5C0();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10000E0EC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000DD28(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000E154(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t variable initialization expression of SPAudioAccessoryDeviceHIDClient.SPHIDManagerQueue()
{
  sub_10000E510();
  __chkstk_darwin();
  uint64_t v0 = sub_10000E520();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E4A0();
  __chkstk_darwin();
  sub_100009F34();
  sub_10000E490();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  v5[1] = &_swiftEmptyArrayStorage;
  sub_10000D640(&qword_10001A420, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100009F74(&qword_10001A428);
  sub_10000D688(&qword_10001A430, &qword_10001A428);
  sub_10000E580();
  return sub_10000E540();
}

unint64_t sub_100009F34()
{
  unint64_t result = qword_10001A418;
  if (!qword_10001A418)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001A418);
  }
  return result;
}

uint64_t sub_100009F74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009FB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id variable initialization expression of SPAudioAccessoryDeviceHIDClient.hidManager()
{
  id v0 = objc_allocWithZone((Class)HIDManager);

  return [v0 initWithOptions:8];
}

uint64_t variable initialization expression of SPAudioAccessoryDeviceHIDClient.numActiveSessions()
{
  return 0;
}

IONotificationPortRef variable initialization expression of SPAudioAccessoryDeviceHIDClient.notificationPointer()
{
  return IONotificationPortCreate(kIOMainPortDefault);
}

uint64_t variable initialization expression of SPAudioAccessoryDeviceHIDClient.iter()
{
  return 0;
}

uint64_t variable initialization expression of SPAudioAccessoryDeviceHIDClient.cancelHIDTeardown()
{
  return 1;
}

uint64_t variable initialization expression of SPAudioAccessoryDeviceHIDClient.activeAppName()
{
  return 0;
}

void *variable initialization expression of SPAudioAccessoryDeviceHIDClient.activeSessionInfo()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of SPAudioAccessoryDeviceHIDClient.noiseLevelCallback()
{
  return 0;
}

id sub_10000A088()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for SPAudioAccessoryDeviceHIDClient()) init];
  qword_10001A570 = (uint64_t)result;
  return result;
}

id SPAudioAccessoryDeviceHIDClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t *sub_10000A0EC()
{
  if (qword_10001A558 != -1) {
    swift_once();
  }
  return &qword_10001A570;
}

id sub_10000A138()
{
  if (qword_10001A558 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_10001A570;

  return v0;
}

void *SPAudioAccessoryDeviceHIDClient.init()()
{
  sub_10000E510();
  __chkstk_darwin();
  uint64_t v1 = sub_10000E520();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E4A0();
  __chkstk_darwin();
  uint64_t v18 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_SPHIDManagerQueue;
  sub_100009F34();
  uint64_t v5 = v0;
  sub_10000E490();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v1);
  v20 = &_swiftEmptyArrayStorage;
  sub_10000D640(&qword_10001A420, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100009F74(&qword_10001A428);
  sub_10000D688(&qword_10001A430, &qword_10001A428);
  sub_10000E580();
  *(void *)(v17[1] + v18) = sub_10000E540();
  uint64_t v6 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidManager;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)HIDManager) initWithOptions:8];
  *(void *)&v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidDevice] = 0;
  uint64_t v7 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_notificationPointer;
  *(void *)&v5[v7] = IONotificationPortCreate(kIOMainPortDefault);
  *(_DWORD *)&v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_iter] = 0;
  *(_DWORD *)&v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_currentMatchedService] = 0;
  uint64_t v8 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_cancelHIDTeardown;
  v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_cancelHIDTeardown] = 1;
  uint64_t v9 = &v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_reportString];
  *uint64_t v9 = 0;
  v9[1] = 0xE000000000000000;
  *(void *)&v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_numActiveSessions] = 0;
  *(void *)&v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeSessionInfo] = &_swiftEmptyArrayStorage;
  char v10 = &v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeAppName];
  *char v10 = 0;
  v10[1] = 0xE000000000000000;
  v11 = &v5[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_noiseLevelCallback];
  void *v11 = 0;
  v11[1] = 0;
  v5[v8] = 1;

  uint64_t v12 = (objc_class *)type metadata accessor for SPAudioAccessoryDeviceHIDClient();
  v19.receiver = v5;
  v19.super_class = v12;
  BOOL v13 = objc_msgSendSuper2(&v19, "init");
  uint64_t v14 = *(void (**)(void))((swift_isaMask & *v13) + 0x1A8);
  uint64_t v15 = v13;
  v14();

  return v15;
}

uint64_t type metadata accessor for SPAudioAccessoryDeviceHIDClient()
{
  return self;
}

uint64_t sub_10000A5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)(v2 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_noiseLevelCallback);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_noiseLevelCallback);
  *uint64_t v3 = a1;
  v3[1] = a2;
  sub_10000A624(a1);

  return sub_10000A634(v4);
}

uint64_t sub_10000A624(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000A634(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000A6CC()
{
  sub_10000E500();
  uint64_t v1 = sub_10000E2E4();
  id v2 = (id)*v1;
  sub_10000E460();

  uint64_t v3 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_notificationPointer;
  if (!*(void *)((char *)v0
                  + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_notificationPointer))
  {
    uint64_t v4 = IONotificationPortCreate(kIOMainPortDefault);
    *(void *)((char *)v0 + v3) = v4;
    IONotificationPortSetDispatchQueue(v4, *(dispatch_queue_t *)((char *)v0+ OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_SPHIDManagerQueue));
  }
  sub_10000E500();
  id v5 = (id)*v1;
  sub_10000E460();

  uint64_t v6 = *(IONotificationPort **)((char *)v0 + v3);
  if (qword_10001A548 != -1) {
    swift_once();
  }
  CFDictionaryRef isa = sub_10000E4B0().super.isa;
  uint64_t v8 = (io_iterator_t *)((char *)v0 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_iter);
  swift_beginAccess();
  IOServiceAddMatchingNotification(v6, "IOServiceMatched", isa, (IOServiceMatchingCallback)sub_10000A908, v0, v8);
  swift_endAccess();
  sub_10000E500();
  id v9 = (id)*v1;
  sub_10000E460();

  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x1B0))(*v8);
}

void sub_10000A908(char *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = &a1[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_iter];
    uint64_t v4 = a1;
    swift_beginAccess();
    *(_DWORD *)uint64_t v3 = a2;
    (*(void (**)(uint64_t))((swift_isaMask & *(void *)v4) + 0x1B0))(a2);
  }
}

uint64_t sub_10000A9C4(io_iterator_t a1)
{
  sub_10000E500();
  uint64_t v3 = sub_10000E2E4();
  id v4 = (id)*v3;
  sub_10000E460();

  uint64_t result = IOIteratorNext(a1);
  if (result)
  {
    io_registry_entry_t v6 = result;
    uint64_t v7 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_currentMatchedService;
    while (1)
    {
      uint64_t entryID = 0;
      IORegistryEntryGetRegistryEntryID(v6, &entryID);
      CFMutableDictionaryRef v8 = IORegistryEntryIDMatching(entryID);
      if (!v8) {
        break;
      }
      CFDictionaryRef v9 = v8;
      uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v9);
      if (MatchingService)
      {
        uint64_t v11 = MatchingService;
        if (*(_DWORD *)((char *)v1 + v7) == MatchingService)
        {

          return IOObjectRelease(v6);
        }
        sub_10000E500();
        id v12 = (id)*v3;
        sub_10000E460();

        uint64_t v13 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x1B8))(v11);
        if (v13)
        {
          uint64_t v14 = *(void **)((char *)v1
                         + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidDevice);
          *(void *)((char *)v1 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidDevice) = v13;

          *(_DWORD *)((char *)v1 + v7) = v11;
          return IOObjectRelease(v6);
        }
      }

      IOObjectRelease(v6);
      uint64_t result = IOIteratorNext(a1);
      io_registry_entry_t v6 = result;
      if (!result) {
        return result;
      }
    }
    os_log_type_t v15 = sub_10000E500();
    id v16 = (id)*v3;
    os_log_type_t v17 = v15;
    if (os_log_type_enabled((os_log_t)*v3, v15))
    {
      uint64_t v18 = v16;
      objc_super v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)objc_super v19 = 134217984;
      swift_beginAccess();
      sub_10000E560();
      _os_log_impl((void *)&_mh_execute_header, v18, v17, "Couldn't find IO Registry Entry ID. { regID=%llu }", v19, 0xCu);
      swift_slowDealloc();
    }
    return IOObjectRelease(v6);
  }
  return result;
}

id sub_10000AC88(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)HIDDevice) initWithService:a1];
  os_log_type_t v3 = sub_10000E500();
  id v4 = (os_log_t *)sub_10000E2E4();
  os_log_t v5 = *v4;
  if (v2)
  {
    io_registry_entry_t v6 = (id *)v4;
    if (os_log_type_enabled(*v4, v3))
    {
      id v7 = v2;
      log = v5;
      CFMutableDictionaryRef v8 = (uint8_t *)swift_slowAlloc();
      CFDictionaryRef v9 = (void *)swift_slowAlloc();
      *(_DWORD *)CFMutableDictionaryRef v8 = 138477827;
      id aBlock = (uint64_t)v7;
      id v10 = v7;
      sub_10000E560();
      *CFDictionaryRef v9 = v2;

      _os_log_impl((void *)&_mh_execute_header, log, v3, "Created HID device. { hidDevice=%{private}@ }", v8, 0xCu);
      sub_100009F74((uint64_t *)&unk_10001A498);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    uint64_t v11 = swift_allocObject();
    *(unsigned char *)(v11 + 16) = 1;
    *(_DWORD *)(v11 + 17) = 200;
    id v12 = (void *)swift_allocObject();
    v12[2] = v2;
    v12[3] = v11;
    v12[4] = v1;
    v39 = sub_10000CDA8;
    v40 = v12;
    id aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v36 = 1107296256;
    v37 = sub_10000B264;
    v38 = &unk_1000149B0;
    uint64_t v13 = _Block_copy(&aBlock);
    id v14 = v2;
    swift_retain();
    os_log_type_t v15 = v1;
    swift_release();
    [v14 setInputReportHandler:v13];
    _Block_release(v13);
    v39 = sub_10000B32C;
    v40 = 0;
    id aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v36 = 1107296256;
    v37 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, void *))sub_10000B3A8;
    v38 = &unk_1000149D8;
    id v16 = _Block_copy(&aBlock);
    [v14 setCancelHandler:v16];
    _Block_release(v16);
    sub_10000E500();
    id v17 = *v6;
    sub_10000E460();

    [v14 setDispatchQueue:*(void *)&v15[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_SPHIDManagerQueue]];
    [v14 activate];
    [v14 open];
    sub_10000E500();
    id v18 = *v6;
    sub_10000E460();

    swift_beginAccess();
    uint64_t v19 = *(unsigned __int8 *)(v11 + 16);
    uint64_t v34 = 0;
    unsigned int v20 = [v14 setReport:v11 + 16 reportLength:5 withIdentifier:v19 forType:2 error:&v34];
    v21 = (void *)v34;
    swift_endAccess();
    if (v20)
    {
      id v22 = v21;
LABEL_10:
      swift_release();
      return v2;
    }
    id v24 = v21;
    sub_10000E3F0();

    swift_willThrow();
    os_log_type_t v25 = sub_10000E500();
    v26 = *v6;
    os_log_type_t v27 = v25;
    if (!os_log_type_enabled(v26, v25))
    {
      swift_errorRelease();
      goto LABEL_10;
    }
    swift_errorRetain();
    swift_errorRetain();
    v28 = v26;
    v29 = (uint8_t *)swift_slowAlloc();
    id aBlock = swift_slowAlloc();
    *(_DWORD *)v29 = 136380675;
    swift_getErrorValue();
    uint64_t v30 = sub_10000E5F0();
    uint64_t v34 = sub_10000C6F8(v30, v31, &aBlock);
    sub_10000E560();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, v27, "Error attempting to set report { %{private}s }", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
    swift_release();
  }
  else
  {
    v23 = v5;
    sub_10000E460();

    return 0;
  }
  return v2;
}

uint64_t sub_10000B264(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v11 = *(void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  id v12 = a2;
  id v13 = a6;
  uint64_t v14 = sub_10000E420();
  unint64_t v16 = v15;

  v11(v12, a3, a4, a5, v14, v16);
  sub_10000E03C(v14, v16);

  return swift_release();
}

void sub_10000B32C()
{
  sub_10000E500();
  id v0 = (id)*sub_10000E2E4();
  sub_10000E460();
}

void sub_10000B3AC()
{
  uint64_t v1 = v0;
  LOBYTE(v18) = 1;
  *(_DWORD *)((char *)&v18 + 1) = 0;
  sub_10000E500();
  id v2 = sub_10000E2E4();
  id v3 = (id)*v2;
  sub_10000E460();

  uint64_t v4 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidDevice;
  os_log_t v5 = *(void **)(v1 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidDevice);
  if (v5)
  {
    id v19 = 0;
    if ([v5 setReport:&v18 reportLength:5 withIdentifier:1 forType:2 error:&v19])
    {
      id v6 = v19;
    }
    else
    {
      id v7 = v19;
      sub_10000E3F0();

      swift_willThrow();
      os_log_type_t v8 = sub_10000E500();
      CFDictionaryRef v9 = *v2;
      os_log_type_t v10 = v8;
      if (os_log_type_enabled(v9, v8))
      {
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v11 = v9;
        id v12 = (uint8_t *)swift_slowAlloc();
        id v19 = (id)swift_slowAlloc();
        *(_DWORD *)id v12 = 136380675;
        swift_getErrorValue();
        uint64_t v13 = sub_10000E5F0();
        uint64_t v18 = sub_10000C6F8(v13, v14, (uint64_t *)&v19);
        sub_10000E560();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v11, v10, "Error attempting to turn off packet streaming. { %{private}s }", v12, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
      }
    }
  }
  objc_msgSend(*(id *)(v1 + v4), "cancel", v18);
  [*(id *)(v1 + v4) close];
  unint64_t v15 = *(void **)(v1 + v4);
  *(void *)(v1 + v4) = 0;

  *(_DWORD *)(v1 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_currentMatchedService) = 0;
  uint64_t v16 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_notificationPointer;
  id v17 = *(IONotificationPort **)(v1
                               + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_notificationPointer);
  if (v17)
  {
    IONotificationPortDestroy(v17);
    *(void *)(v1 + v16) = 0;
  }
}

void sub_10000B66C()
{
  uint64_t v1 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_cancelHIDTeardown;
  int v2 = *((unsigned __int8 *)v0
       + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_cancelHIDTeardown);
  sub_10000E500();
  id v3 = (id)*sub_10000E2E4();
  if (v2 == 1)
  {
    sub_10000E460();
  }
  else
  {
    sub_10000E460();

    (*(void (**)(void))((swift_isaMask & *v0) + 0x1C0))();
    *((unsigned char *)v0 + v1) = 1;
  }
}

uint64_t sub_10000B790(unint64_t a1)
{
  uint64_t v3 = sub_10000E450();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = *(void (**)(uint64_t, float))(v1
                                             + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_noiseLevelCallback);
  if (v7)
  {
    uint64_t v8 = swift_retain();
    v7(v8, (float)BYTE2(a1));
    sub_10000A634((uint64_t)v7);
  }
  unint64_t v9 = a1 >> 16;
  unint64_t v10 = HIBYTE(a1);
  unint64_t v11 = HIDWORD(a1);
  id v12 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v12 setDateStyle:1];
  [v12 setTimeStyle:3];
  sub_10000E440();
  Class isa = sub_10000E430().super.isa;
  id v14 = [v12 stringFromDate:isa];

  uint64_t v15 = sub_10000E4C0();
  uint64_t v17 = v16;

  sub_100009F74(&qword_10001A4A0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10000FF40;
  *(void *)(v18 + 56) = &type metadata for String;
  *(void *)(v18 + 64) = sub_10000D2B8();
  *(void *)(v18 + 32) = v15;
  *(void *)(v18 + 40) = v17;
  *(void *)(v18 + 96) = &type metadata for UInt8;
  *(void *)(v18 + 104) = &protocol witness table for UInt8;
  *(unsigned char *)(v18 + 72) = v9;
  *(void *)(v18 + 136) = &type metadata for UInt8;
  *(void *)(v18 + 144) = &protocol witness table for UInt8;
  *(unsigned char *)(v18 + 112) = v11;
  *(void *)(v18 + 176) = &type metadata for UInt8;
  *(void *)(v18 + 184) = &protocol witness table for UInt8;
  *(unsigned char *)(v18 + 152) = v10;
  uint64_t v19 = sub_10000E4D0();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v19;
}

void sub_10000B9E0(void *a1)
{
  uint64_t v3 = (char *)v1 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeSessionInfo;
  swift_beginAccess();
  if (*(void *)(*(void *)v3 + 16))
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    unsigned __int16 v14 = 0;
    uint64_t v13 = 0;
    [a1 getBytes:&v11 length:26];
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))((swift_isaMask & *v1) + 0x1D0))(v11, v12, v13, v14);
    unint64_t v6 = v5;
    os_log_type_t v7 = sub_10000E500();
    uint64_t v8 = *sub_10000E2E4();
    if (os_log_type_enabled(v8, v7))
    {
      unint64_t v9 = v8;
      swift_bridgeObjectRetain();
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)unint64_t v10 = 136380675;
      swift_bridgeObjectRetain();
      sub_10000C6F8(v4, v6, &v15);
      sub_10000E560();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v7, "HID report { SPHIDReportString=%{private}s }", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_10000BC14(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000E470();
  uint64_t v18 = *(void *)(v5 - 8);
  __chkstk_darwin();
  os_log_type_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000E4A0();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin();
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E500();
  id v11 = (id)*sub_10000E2E4();
  sub_10000E460();

  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v2;
  v12[3] = a1;
  v12[4] = a2;
  aBlock[4] = sub_10000D310;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B3A8;
  aBlock[3] = &unk_100014A28;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v2;
  swift_bridgeObjectRetain();
  sub_10000E480();
  uint64_t v19 = &_swiftEmptyArrayStorage;
  sub_10000D640(&qword_10001A4B0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100009F74(&qword_10001A4B8);
  sub_10000D688(&qword_10001A4C0, &qword_10001A4B8);
  sub_10000E580();
  sub_10000E530();
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v17);
  return swift_release();
}

uint64_t sub_10000BF18(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10000BF74(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000E470();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000E4A0();
  uint64_t v9 = *(void *)(v19 - 8);
  __chkstk_darwin();
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E500();
  uint64_t v18 = sub_10000E2E4();
  id v12 = (id)*v18;
  sub_10000E460();

  uint64_t v17 = *(void *)&v2[OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_SPHIDManagerQueue];
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_10000D71C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B3A8;
  aBlock[3] = &unk_100014A78;
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = v2;
  swift_bridgeObjectRetain();
  sub_10000E480();
  unsigned int v20 = &_swiftEmptyArrayStorage;
  sub_10000D640(&qword_10001A4B0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100009F74(&qword_10001A4B8);
  sub_10000D688(&qword_10001A4C0, &qword_10001A4B8);
  sub_10000E580();
  sub_10000E530();
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  swift_release();
  sub_10000E500();
  id v16 = (id)*v18;
  sub_10000E460();
}

uint64_t sub_10000C2C0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_10000E5E0() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_10000E5E0();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

uint64_t sub_10000C3A8(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_10000DE84((uint64_t)v3);
  }
  unint64_t v4 = *((void *)v3 + 2);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      BOOL v7 = &v3[16 * a1];
      uint64_t v8 = *((void *)v7 + 4);
      memmove(v7 + 32, v7 + 48, 16 * v6);
      *((void *)v3 + 2) = v5;
      *uint64_t v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_10000E5D0();
  __break(1u);
  return result;
}

uint64_t sub_10000C4A0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_10000E4C0();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

id SPAudioAccessoryDeviceHIDClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SPAudioAccessoryDeviceHIDClient();
  return objc_msgSendSuper2(&v2, "dealloc");
}

char *sub_10000C5E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100009F74(&qword_10001A4F8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      char v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      char v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000DE98(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C6F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000C7CC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000DFE0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000DFE0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000DF90((uint64_t)v12);
  return v7;
}

uint64_t sub_10000C7CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_10000E570();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000C988(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_10000E5A0();
  if (!v8)
  {
    sub_10000E5B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000E5D0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000C988(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000CA20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000CC00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000CC00(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000CA20(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000CB98(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000E590();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000E5B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000E4F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000E5D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000E5B0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000CB98(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100009F74(&qword_10001A500);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000CC00(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100009F74(&qword_10001A500);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  char v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10000E5D0();
  __break(1u);
  return result;
}

uint64_t sub_10000CD50()
{
  return _swift_deallocObject(v0, 21, 7);
}

uint64_t sub_10000CD60()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000CDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  size_t v11 = (void *)v6[2];
  uint64_t v10 = v6[3];
  uint64_t v12 = (void *)v6[4];
  os_log_type_t v13 = sub_10000E500();
  id v14 = (os_log_t *)sub_10000E2E4();
  os_log_t v15 = *v14;
  if (os_log_type_enabled(*v14, v13))
  {
    id v16 = v15;
    uint64_t v17 = v14;
    uint64_t v18 = v11;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134217984;
    uint64_t v43 = a4;
    sub_10000E560();
    _os_log_impl((void *)&_mh_execute_header, v16, v13, "Received report. { reporterID=%ld }", v19, 0xCu);
    size_t v11 = v18;
    id v14 = v17;
    swift_slowDealloc();
  }
  if (a4 != 2)
  {
    v32.super.Class isa = sub_10000E410().super.isa;
    (*(void (**)(void))((swift_isaMask & *v12) + 0x1D8))();
LABEL_13:

    return;
  }
  unsigned int v20 = (unsigned __int8 *)(v10 + 16);
  os_log_type_t v21 = sub_10000E500();
  os_log_t v22 = *v14;
  os_log_type_t v23 = v21;
  if (os_log_type_enabled(*v14, v21))
  {
    sub_10000E094(a5, a6);
    sub_10000E094(a5, a6);
    log = v22;
    id v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)id v24 = 136315138;
    sub_10000E094(a5, a6);
    uint64_t v25 = sub_10000E400();
    unint64_t v27 = v26;
    sub_10000E03C(a5, a6);
    v42 = (void *)sub_10000C6F8(v25, v27, &v43);
    sub_10000E560();
    swift_bridgeObjectRelease();
    sub_10000E03C(a5, a6);
    sub_10000E03C(a5, a6);
    _os_log_impl((void *)&_mh_execute_header, log, v23, "setReportInputHandler report contents { report=%s }", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  sub_10000E500();
  v28 = *v14;
  sub_10000E460();

  swift_beginAccess();
  uint64_t v29 = *v20;
  v42 = 0;
  unsigned int v30 = [v11 setReport:v20 reportLength:5 withIdentifier:v29 forType:2 error:&v42];
  id v41 = v42;
  swift_endAccess();
  if (!v30)
  {
    id v33 = v41;
    sub_10000E3F0();

    swift_willThrow();
    os_log_type_t v34 = sub_10000E500();
    v35 = *v14;
    os_log_type_t v36 = v34;
    if (!os_log_type_enabled(v35, v34))
    {
      swift_errorRelease();
      return;
    }
    swift_errorRetain();
    swift_errorRetain();
    v32.super.Class isa = (Class)v35;
    v37 = (uint8_t *)swift_slowAlloc();
    v42 = (void *)swift_slowAlloc();
    *(_DWORD *)v37 = 136380675;
    swift_getErrorValue();
    uint64_t v38 = sub_10000E5F0();
    sub_10000C6F8(v38, v39, (uint64_t *)&v42);
    sub_10000E560();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32.super.isa, v36, "Error attempting to set report. { error=%{private}s }", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
    goto LABEL_13;
  }

  id v31 = v41;
}

uint64_t sub_10000D2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D2B0()
{
  return swift_release();
}

unint64_t sub_10000D2B8()
{
  unint64_t result = qword_10001A4A8;
  if (!qword_10001A4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A4A8);
  }
  return result;
}

uint64_t sub_10000D310()
{
  uint64_t v4 = v1;
  size_t v5 = *(void **)(v1 + 16);
  uint64_t v6 = *(void *)((char *)v5
                 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_numActiveSessions);
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7)
  {
    __break(1u);
LABEL_15:
    uint64_t v2 = sub_10000C5E8(0, *((void *)v2 + 2) + 1, 1, v2);
    *size_t v5 = v2;
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)(v4 + 24);
  uint64_t v9 = *(void *)(v4 + 32);
  *(void *)((char *)v5 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_numActiveSessions) = v8;
  if (v8 == 1)
  {
    if ((*((unsigned char *)v5 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_cancelHIDTeardown) & 1) == 0) {
      *((unsigned char *)v5 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_cancelHIDTeardown) = 1;
    }
    if (*(void *)((char *)v5 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidDevice))
    {
      size_t v11 = (unsigned int *)((char *)v5
                           + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_iter);
      swift_beginAccess();
      (*(void (**)(void))((swift_isaMask & *v5) + 0x1B0))(*v11);
    }
    else
    {
      (*(void (**)(void))((swift_isaMask & *v5) + 0x1A8))();
    }
  }
  uint64_t v12 = (void *)((char *)v5 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeAppName);
  *uint64_t v12 = v10;
  v12[1] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_log_type_t v13 = sub_10000E500();
  id v14 = *sub_10000E2E4();
  if (os_log_type_enabled(v14, v13))
  {
    id v24 = v5;
    os_log_t v15 = v14;
    id v16 = (uint8_t *)swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    *(_DWORD *)id v16 = 136380675;
    uint64_t v17 = *v12;
    unint64_t v18 = v12[1];
    swift_bridgeObjectRetain();
    sub_10000C6F8(v17, v18, v25);
    sub_10000E560();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v15, v13, "Starting session. { appName=%{private}s }", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v3 = *v12;
  uint64_t v0 = v12[1];
  size_t v5 = (void *)((char *)v5
                + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeSessionInfo);
  swift_beginAccess();
  uint64_t v2 = (char *)*v5;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *size_t v5 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  unint64_t v21 = *((void *)v2 + 2);
  unint64_t v20 = *((void *)v2 + 3);
  if (v21 >= v20 >> 1)
  {
    uint64_t v2 = sub_10000C5E8((char *)(v20 > 1), v21 + 1, 1, v2);
    *size_t v5 = v2;
  }
  *((void *)v2 + 2) = v21 + 1;
  os_log_t v22 = &v2[16 * v21];
  *((void *)v22 + 4) = v3;
  *((void *)v22 + 5) = v0;
  return swift_endAccess();
}

uint64_t sub_10000D640(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D688(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009FB8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D6DC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000D71C()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = *(void *)((char *)v1
                 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_numActiveSessions);
  BOOL v3 = __OFSUB__(v2, 1);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v0[3];
    unint64_t v5 = v0[4];
    uint64_t v37 = OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_numActiveSessions;
    *(void *)((char *)v1
              + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_numActiveSessions) = v4;
    os_log_type_t v7 = sub_10000E500();
    uint64_t v8 = (os_log_t *)sub_10000E2E4();
    os_log_t v9 = *v8;
    if (os_log_type_enabled(*v8, v7))
    {
      swift_bridgeObjectRetain_n();
      v35 = v1;
      log = v9;
      uint64_t v10 = swift_slowAlloc();
      v40[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136380931;
      swift_bridgeObjectRetain();
      v38[0] = sub_10000C6F8(v6, v5, v40);
      sub_10000E560();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v10 + 12) = 2048;
      uint64_t v11 = *(void *)((char *)v1 + v37);

      v38[0] = v11;
      sub_10000E560();

      _os_log_impl((void *)&_mh_execute_header, log, v7, "Stopping session. { appName=%{private}s, numActiveSessions=%ld }", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    uint64_t v12 = (void **)((char *)v1
                    + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeSessionInfo);
    swift_beginAccess();
    uint64_t v13 = sub_10000C2C0(v6, v5, *v12);
    if (v14)
    {
      os_log_type_t v30 = sub_10000E500();
      id v31 = *v8;
      os_log_type_t v32 = v30;
      if (os_log_type_enabled(v31, v30))
      {
        swift_bridgeObjectRetain_n();
        id v33 = v31;
        os_log_type_t v34 = (uint8_t *)swift_slowAlloc();
        v38[0] = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v34 = 136380675;
        swift_bridgeObjectRetain();
        uint64_t v39 = sub_10000C6F8(v6, v5, v38);
        sub_10000E560();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v33, v32, "Couldn't find appName in sessionInfo. { appName=%{private}s }", v34, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
    }
    else
    {
      unint64_t v15 = v13;
      swift_beginAccess();
      sub_10000C3A8(v15);
      swift_endAccess();
      swift_bridgeObjectRelease();
      uint64_t v16 = (*v12)[2];
      if (v16)
      {
        uint64_t v17 = (uint64_t)&(*v12)[2 * v16];
        uint64_t v19 = *(void *)(v17 + 16);
        uint64_t v18 = *(void *)(v17 + 24);
        unint64_t v20 = (void *)((char *)v1
                       + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeAppName);
        void *v20 = v19;
        v20[1] = v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      os_log_type_t v21 = sub_10000E500();
      os_log_t v22 = *v8;
      os_log_type_t v23 = v21;
      if (os_log_type_enabled(*v8, v21))
      {
        id v24 = v1;
        uint64_t v25 = v22;
        unint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        *(_DWORD *)unint64_t v26 = 136380675;
        v38[0] = v27;
        uint64_t v28 = *(void *)((char *)v24
                        + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeAppName);
        unint64_t v29 = *(void *)((char *)v24
                        + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_activeAppName
                        + 8);
        swift_bridgeObjectRetain();
        uint64_t v39 = sub_10000C6F8(v28, v29, v38);
        sub_10000E560();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v25, v23, "Updated activeAppName. { activeAppName=%{private}s }", v26, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      if (!*(void *)((char *)v1 + v37))
      {
        *((unsigned char *)v1 + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_cancelHIDTeardown) = 0;
        (*(void (**)(void))((swift_isaMask & *v1) + 0x1C8))();
      }
    }
  }
}

uint64_t sub_10000DC24(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t sub_10000DC3C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000DC5C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 5) = v3;
  return result;
}

void type metadata accessor for SPHIDReport()
{
  if (!qword_10001A4F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001A4F0);
    }
  }
}

uint64_t sub_10000DCE0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DD18()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_10000DD28(uint64_t a1, uint64_t a2)
{
  sub_10000E600();
  sub_10000E4E0();
  Swift::Int v4 = sub_10000E610();

  return sub_10000DDA0(a1, a2, v4);
}

unint64_t sub_10000DDA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000E5E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10000E5E0() & 1) == 0);
    }
  }
  return v6;
}

char *sub_10000DE84(uint64_t a1)
{
  return sub_10000C5E8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000DE98(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10000E5D0();
  __break(1u);
  return result;
}

uint64_t sub_10000DF90(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000DFE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000E03C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10000E094(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10000E0EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009F74(&qword_10001A518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000E154(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10000E164()
{
}

void *sub_10000E190()
{
  return &unk_100014BD0;
}

unint64_t sub_10000E19C()
{
  return 0xD000000000000018;
}

uint64_t sub_10000E1B8()
{
  sub_10000E3B0();
  uint64_t result = sub_10000E550();
  qword_10001A578 = result;
  return result;
}

uint64_t *sub_10000E20C()
{
  if (qword_10001A560 != -1) {
    swift_once();
  }
  return &qword_10001A578;
}

id sub_10000E258()
{
  return sub_10000E354(&qword_10001A560, (void **)&qword_10001A578);
}

uint64_t sub_10000E27C()
{
  sub_10000E3B0();
  uint64_t result = sub_10000E550();
  qword_10001A580 = result;
  return result;
}

uint64_t *sub_10000E2E4()
{
  if (qword_10001A568 != -1) {
    swift_once();
  }
  return &qword_10001A580;
}

id sub_10000E330()
{
  return sub_10000E354(&qword_10001A568, (void **)&qword_10001A580);
}

id sub_10000E354(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

unint64_t sub_10000E3B0()
{
  unint64_t result = qword_10001A520;
  if (!qword_10001A520)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001A520);
  }
  return result;
}

uint64_t sub_10000E3F0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000E400()
{
  return Data.description.getter();
}

NSData sub_10000E410()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000E420()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate sub_10000E430()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10000E440()
{
  return Date.init()();
}

uint64_t sub_10000E450()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000E460()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10000E470()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10000E480()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10000E490()
{
  return static DispatchQoS.utility.getter();
}

uint64_t sub_10000E4A0()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_10000E4B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000E4C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000E4D0()
{
  return String.init(format:_:)();
}

uint64_t sub_10000E4E0()
{
  return String.hash(into:)();
}

Swift::Int sub_10000E4F0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000E500()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000E510()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10000E520()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10000E530()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10000E540()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10000E550()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10000E560()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000E570()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000E580()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10000E590()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000E5A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000E5B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000E5C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000E5D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000E5E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000E5F0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000E600()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000E610()
{
  return Hasher._finalize()();
}

uint64_t CFPrefs_GetInt64()
{
  return _CFPrefs_GetInt64();
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

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t NSErrorF()
{
  return _NSErrorF();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_MarkSessionStartWithAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MarkSessionStartWithAppName:");
}

id objc_msgSend_MarkSessionStopWithAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MarkSessionStopWithAppName:");
}

id objc_msgSend_ReceiveNoiseLevelWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ReceiveNoiseLevelWithBlock:");
}

id objc_msgSend__contextEngineShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _contextEngineShouldRun];
}

id objc_msgSend__ensureLocationMonitoringStarted(void *a1, const char *a2, ...)
{
  return _[a1 _ensureLocationMonitoringStarted];
}

id objc_msgSend__ensureLocationMonitoringStopped(void *a1, const char *a2, ...)
{
  return _[a1 _ensureLocationMonitoringStopped];
}

id objc_msgSend__entitledAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitledAndReturnError:");
}

id objc_msgSend__fetchPlaceInferencesWithFidelityPolicy_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPlaceInferencesWithFidelityPolicy:handler:");
}

id objc_msgSend__geoMapItemHandle(void *a1, const char *a2, ...)
{
  return _[a1 _geoMapItemHandle];
}

id objc_msgSend__getLocationCategoryFromGEOPOI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getLocationCategoryFromGEOPOI:");
}

id objc_msgSend__getLocationCategoryFromRTLocationOfInterestType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getLocationCategoryFromRTLocationOfInterestType:");
}

id objc_msgSend__loiIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _loiIdentifier];
}

id objc_msgSend__placeInference(void *a1, const char *a2, ...)
{
  return _[a1 _placeInference];
}

id objc_msgSend__poiCategory(void *a1, const char *a2, ...)
{
  return _[a1 _poiCategory];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__startMonitoringVisits(void *a1, const char *a2, ...)
{
  return _[a1 _startMonitoringVisits];
}

id objc_msgSend__startPollingForLocationCategory(void *a1, const char *a2, ...)
{
  return _[a1 _startPollingForLocationCategory];
}

id objc_msgSend__stopMonitoringVisits(void *a1, const char *a2, ...)
{
  return _[a1 _stopMonitoringVisits];
}

id objc_msgSend__stopPollingForLocationCategory(void *a1, const char *a2, ...)
{
  return _[a1 _stopPollingForLocationCategory];
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateLocationCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocationCategory:");
}

id objc_msgSend__updateLocationCategoryWithBestPlaceInferenceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocationCategoryWithBestPlaceInferenceIdentifier:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrivalDate(void *a1, const char *a2, ...)
{
  return _[a1 arrivalDate];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return _[a1 callback];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_contextChangeFlags(void *a1, const char *a2, ...)
{
  return _[a1 contextChangeFlags];
}

id objc_msgSend_contextEventUpdated_fusedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextEventUpdated:fusedState:");
}

id objc_msgSend_contextMonitorContextChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextMonitorContextChanged:");
}

id objc_msgSend_contextMonitorReportContextSignalUpdated_contextFusedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextMonitorReportContextSignalUpdated:contextFusedState:");
}

id objc_msgSend_contextMonitorReportLocationChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextMonitorReportLocationChanged:");
}

id objc_msgSend_contextSignalUpdated_fusedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextSignalUpdated:fusedState:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cuValueForEntitlementNoCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cuValueForEntitlementNoCache:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_fetchLocationOfInterestWithIdentifier_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocationOfInterestWithIdentifier:withHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundlePath:delegate:onQueue:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_locationCategory(void *a1, const char *a2, ...)
{
  return _[a1 locationCategory];
}

id objc_msgSend_locationCategoryChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationCategoryChanged:");
}

id objc_msgSend_mapItem(void *a1, const char *a2, ...)
{
  return _[a1 mapItem];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _[a1 placemark];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resolveMapItemFromHandle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveMapItemFromHandle:completionHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_scheduleLocationCategoryUpdate(void *a1, const char *a2, ...)
{
  return _[a1 scheduleLocationCategoryUpdate];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_setCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallback:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setContextChangeFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextChangeFlags:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLocationCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationCategory:");
}

id objc_msgSend_setLocationCategoryChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationCategoryChangedHandler:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSoundType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoundType:");
}

id objc_msgSend_setXpcCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcCnx:");
}

id objc_msgSend_setXpcService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcService:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedSoundSensorModule(void *a1, const char *a2, ...)
{
  return _[a1 sharedSoundSensorModule];
}

id objc_msgSend_soundType(void *a1, const char *a2, ...)
{
  return _[a1 soundType];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopMonitoringVisits(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringVisits];
}

id objc_msgSend_subscribeToNoiseLevelForClient_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToNoiseLevelForClient:callback:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unsubscribeFromNoiseLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsubscribeFromNoiseLevel:");
}

id objc_msgSend_xpcCnx(void *a1, const char *a2, ...)
{
  return _[a1 xpcCnx];
}

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnectionInvalidated];
}