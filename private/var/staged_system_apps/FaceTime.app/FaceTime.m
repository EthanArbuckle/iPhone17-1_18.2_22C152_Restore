uint64_t type metadata accessor for SpringBoardOrientationObserverWrapper()
{
  return self;
}

uint64_t sub_100006DC0(uint64_t a1)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate;
  swift_beginAccess();
  sub_10001B130(a1, v3);
  return swift_endAccess();
}

uint64_t type metadata accessor for RecentCallDetailControllerFactory()
{
  return self;
}

unint64_t sub_100007000()
{
  unint64_t result = (unint64_t)[*(id *)(v0 + 32) currentDeviceOrientation];
  if (result >= 7) {
    return 1;
  }
  return result;
}

id sub_10000702C(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

id sub_1000070E8(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = &v3[OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v3[OBJC_IVAR___FTRecentsContainerViewController_recentsList] = 0;
  *(void *)&v3[OBJC_IVAR___FTRecentsContainerViewController_content] = 0;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for RecentsContainerViewController();
  [super initWithNibName:v6 bundle:a3];

  return v7;
}

void sub_1000071FC(id a1)
{
  int v4 = 0;
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswerWithError();
  if (v1)
  {
    CFBooleanRef v2 = v1;
    byte_1000BBF30 = CFBooleanGetValue(v1) != 0;
    CFRelease(v2);
  }
  else
  {
    uint64_t v3 = sub_100012C68();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10006A38C(v3);
    }
  }
}

id sub_1000072C4(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t type metadata accessor for RecentsContainerViewController()
{
  return self;
}

id sub_100007388(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t sub_1000073E4()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000748C()
{
  return swift_getGenericMetadata();
}

id sub_1000074BC(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

void *sub_100007518(uint64_t a1, uint64_t a2)
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
  sub_100017E2C((uint64_t *)&unk_1000BBA48);
  int v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000075F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate;
  swift_beginAccess();
  sub_10001B198(v1, (uint64_t)v4);
  if (!v5) {
    return sub_100017EC0((uint64_t)v4, (uint64_t *)&unk_1000BB490);
  }
  sub_10001B0CC((uint64_t)v4, (uint64_t)v3);
  sub_100017EC0((uint64_t)v4, (uint64_t *)&unk_1000BB490);
  sub_10001A4B0(v3, v3[3]);
  dispatch thunk of RecentCallProviderDelegate.recentCallsDidChange()();
  return sub_10001A53C((uint64_t)v3);
}

uint64_t type metadata accessor for AccelerometerOrientationMonitorWrapper()
{
  return self;
}

uint64_t sub_100007758(char a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(v1 + 16) = a1 & 1;
  sub_10000D7AC();

  return swift_release();
}

void sub_100007C28(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  sub_10001ACD4(a1);
  sub_10000C128(v6);
  id v7 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController);
  uint64_t v8 = *v5;
  if (*v5)
  {
    uint64_t v9 = v5[1];
    aBlock[4] = v8;
    aBlock[5] = v9;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100058308;
    aBlock[3] = &unk_1000A2F68;
    v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v10 = 0;
  }
  [v7 setPresentScreenTimeShield:v10];
  _Block_release(v10);
}

uint64_t sub_100007DBC()
{
  if (*(unsigned char *)(v0 + 20) == 1)
  {
    LODWORD(out_token) = -1;
    uint64_t v1 = String.utf8CString.getter();
    uint32_t v2 = notify_register_check((const char *)(v1 + 32), (int *)&out_token);
    swift_release();
    if (v2)
    {
      if (*(unsigned char *)(v0 + 20)) {
        return *(void *)(v0 + 40);
      }
    }
    else
    {
      *(_DWORD *)(v0 + 16) = out_token;
      *(unsigned char *)(v0 + 20) = 0;
    }
  }
  int v4 = *(_DWORD *)(v0 + 16);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v0 + 48))(v0 + 40);
  notify_get_state(v4, (uint64_t *)&v6);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(v0 + 64))(&out_token, v6);
  if (v8) {
    p_uint64_t out_token = (uint64_t *)(v0 + 40);
  }
  else {
    p_uint64_t out_token = &out_token;
  }
  return *p_out_token;
}

uint64_t sub_100007EC0(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_100007EC8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100007F30(id a1)
{
  v4[0] = CNContactPhoneNumbersKey;
  v4[1] = CNContactEmailAddressesKey;
  uint64_t v1 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v4[2] = v1;
  v4[3] = CNContactSocialProfilesKey;
  uint64_t v2 = +[NSArray arrayWithObjects:v4 count:4];
  uint64_t v3 = (void *)qword_1000BC1F8;
  qword_1000BC1F8 = v2;
}

void *sub_1000081F4()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000BA6F0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100011408(v0, (uint64_t)qword_1000BADF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  type metadata accessor for SpringBoardOrientationObserver();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = (void *)(v5 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_onOrientationLock);
  *uint64_t v6 = nullsub_1;
  v6[1] = 0;
  *(void *)(v5 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver____lazy_storage___cfObserver) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_logger, v3, v0);
  type metadata accessor for SpringBoardOrientationObserverWrapper();
  uint64_t result = (void *)swift_allocObject();
  result[3] = 0x6F42676E69727053;
  result[4] = 0xEB00000000647261;
  result[5] = nullsub_1;
  result[6] = 0;
  result[2] = v5;
  qword_1000BAE08 = (uint64_t)result;
  return result;
}

uint64_t sub_1000084F0()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for OrientationMonitorComposer()
{
  return self;
}

uint64_t sub_100008700(char a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v3 = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(v1 + 40) = a1 & 1;
  sub_100008AC8(v3);

  return swift_release();
}

uint64_t sub_1000087B8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

Class sub_1000088F0(uint64_t a1)
{
  unint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_1000175C8(0, &qword_1000BAFA0);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

uint64_t start(int a1, char **a2)
{
  id v5 = +[FTApplicationServices sharedInstance];
  +[TUVideoDeviceController prewarm];
  uint64_t v6 = UIApplicationMain(a1, a2, 0, 0);
  return v6;
}

uint64_t sub_100008A04(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(v1 + *(void *)(*(void *)v1 + 168)) = a1;
  sub_10000BCCC();

  return swift_release();
}

void sub_100008AC8(char a1)
{
  uint64_t v2 = v1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (*(unsigned char *)(v1 + 40) == (a1 & 1))
  {
    swift_release();
  }
  else
  {
    swift_retain_n();
    NSDictionary v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 67109378;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      swift_release();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      *(_WORD *)(v6 + 8) = 2080;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v7 = sub_100064CFC();
      swift_release();
      swift_release();
      uint64_t v8 = v7 - 1;
      unint64_t v9 = 0xE800000000000000;
      uint64_t v10 = 0x7469617274726F70;
      switch(v8)
      {
        case 0:
          break;
        case 1:
          unint64_t v9 = 0x8000000100081810;
          uint64_t v10 = 0xD000000000000012;
          break;
        case 2:
          unint64_t v9 = 0xED00007466654C65;
          goto LABEL_21;
        case 3:
          unint64_t v9 = 0xEE00746867695265;
LABEL_21:
          uint64_t v10 = 0x70616373646E616CLL;
          break;
        case 4:
          unint64_t v9 = 0xE600000000000000;
          uint64_t v10 = 0x705565636166;
          break;
        case 5:
          uint64_t v10 = 0x6E776F4465636166;
          break;
        default:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x6E776F6E6B6E75;
          break;
      }
      sub_10001AFF8(v10, v9, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "set orientation locked: %{BOOL}d to orientation: %s", (uint8_t *)v6, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      if (*(unsigned char *)(v2 + 40)) {
        goto LABEL_25;
      }
    }
    else
    {

      swift_release_n();
      if (*(unsigned char *)(v1 + 40))
      {
LABEL_25:
        swift_release();
        return;
      }
    }
    id v11 = [self defaultCenter];
    if (qword_1000BA748 != -1) {
      swift_once();
    }
    uint64_t v12 = qword_1000BD560;
    unint64_t v13 = sub_100064DA0();
    sub_100064204(v13);
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v11 postNotificationName:v12 object:0 userInfo:isa];
    swift_release();
  }
}

uint64_t sub_100008F8C()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  return v1;
}

uint64_t sub_10000901C()
{
  if (*(unsigned char *)(v0 + 20) == 1)
  {
    out_token[0] = -1;
    uint64_t v1 = String.utf8CString.getter();
    uint32_t v2 = notify_register_check((const char *)(v1 + 32), out_token);
    swift_release();
    if (v2)
    {
      if (*(unsigned char *)(v0 + 20)) {
        return *(unsigned __int8 *)(v0 + 40);
      }
    }
    else
    {
      *(_DWORD *)(v0 + 16) = out_token[0];
      *(unsigned char *)(v0 + 20) = 0;
    }
  }
  int v4 = *(_DWORD *)(v0 + 16);
  *(void *)uint64_t out_token = (*(uint64_t (**)(uint64_t))(v0 + 48))(v0 + 40);
  notify_get_state(v4, (uint64_t *)out_token);
  (*(void (**)(uint64_t *__return_ptr, void))(v0 + 64))(&v6, *(void *)out_token);
  if (v6 == 2) {
    return *(unsigned __int8 *)(v0 + 40);
  }
  else {
    return v6 & 1;
  }
}

uint64_t sub_100009124@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

uint64_t sub_100009134(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t sub_10000913C(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(v1 + 24) = a1;
  sub_10000D248();

  return swift_release();
}

uint64_t sub_100009238()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100010718(v0, qword_1000BB6F0);
  uint64_t v1 = sub_100011408(v0, (uint64_t)qword_1000BB6F0);
  if (qword_1000BA718 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100011408(v0, (uint64_t)qword_1000BD4D0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_1000096F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000099AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000099C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = swift_retain();
  uint64_t v6 = a4(v5);
  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_100009C0C(uint64_t a1, uint64_t a2, char a3)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_100007758(a3);
  swift_release();

  return swift_release();
}

void sub_100009E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A1A8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

uint64_t sub_10000A484()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000BA6F0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100011408(v0, (uint64_t)qword_1000BADF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  if (qword_1000BA6F8 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_1000BAE08;
  type metadata accessor for AccelerometerOrientationMonitorWrapper();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10007E040;
  *(void *)(v6 + 32) = 0xED0000726574656DLL;
  *(void *)(v6 + 40) = nullsub_1;
  *(void *)(v6 + 48) = 0;
  swift_retain();
  sub_10000B28C();
  swift_release();
  sub_100017E2C(&qword_1000BAE70);
  swift_allocObject();
  uint64_t v7 = sub_10000B738((uint64_t)v3, v5, v6);
  swift_release();
  uint64_t result = swift_release();
  qword_1000BAE10 = v7;
  return result;
}

void sub_10000A660(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PhoneRootViewController);
  [UIApp setRootViewController:v2];

  id v5 = [UIApp rootViewController];
  uint64_t v3 = [v5 view];
  uint64_t v4 = [v3 window];

  if (!v4) {
    [*(id *)(*(void *)(a1 + 32) + 16) setRootViewController:v5];
  }
  [*(id *)(a1 + 32) _initializeUI];
  [*(id *)(a1 + 32) setIsUIInitialized:1];
  [*(id *)(*(void *)(a1 + 32) + 16) makeKeyAndVisible];
}

char *sub_10000A900(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate];
  *uint64_t v3 = 0u;
  v3[1] = 0u;
  v3[2] = 0u;
  uint64_t v4 = &v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield];
  *uint64_t v4 = 0;
  v4[1] = 0;
  *(void *)&v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController] = a1;
  v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls] = 0;
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for RecentCallProvider();
  id v5 = a1;
  uint64_t v6 = (char *)[super init];
  uint64_t v7 = *(void **)&v6[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController];
  sub_1000175C8(0, (unint64_t *)&unk_1000BB4D0);
  uint64_t v8 = v6;
  id v9 = v7;
  uint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
  [v9 addDelegate:v8 queue:v10];

  return v8;
}

uint64_t sub_10000AA0C()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017E2C(&qword_1000BAE78);
  swift_initStaticObject();
  char v0 = sub_10000901C();
  swift_release();
  swift_release();
  return v0 & 1;
}

uint64_t sub_10000ACA8()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017E2C(&qword_1000BAE80);
  swift_initStaticObject();
  uint64_t v0 = sub_100007DBC();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_10000ADB4(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_10000AFD0(char a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped);
  swift_unknownObjectRetain();
  swift_release();
  [v3 setOrientationEventsEnabled:a1 & 1];
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_10000B208(char a1)
{
  [(id)sub_10000B28C()[4] setOrientationEventsEnabled:a1 & 1];
  swift_release();
  [(id)sub_10000B28C()[4] setPassiveOrientationEvents:(a1 & 1) == 0];

  return swift_release();
}

void *sub_10000B28C()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void **)(v0 + 16);
  }
  else
  {
    uint64_t v2 = v0;
    uint64_t v3 = swift_allocObject();
    swift_weakInit();
    type metadata accessor for OrientationMonitorAccelerometer();
    swift_allocObject();
    uint64_t v1 = sub_10000BFC0((uint64_t)sub_10004CBF8, v3);
    *(void *)(v2 + 16) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_10000B738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  *(unsigned char *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0;
  *(unsigned char *)(v4 + 40) = 0;
  *(void *)(v4 + *(void *)(*(void *)v4 + 168)) = 0;
  uint64_t v8 = v4 + qword_1000BBAB8;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  *(void *)(v4 + *(void *)(*(void *)v4 + 152)) = a2;
  id v11 = (uint64_t *)(v4 + *(void *)(*(void *)v4 + 160));
  *id v11 = a3;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  uint64_t v13 = *v11;
  *(void *)(v13 + 40) = sub_100051308;
  *(void *)(v13 + 48) = v12;
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  swift_retain();
  sub_10000B94C((uint64_t)sub_100051310, v14);
  swift_endAccess();
  swift_release();
  sub_100010150();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v4;
}

uint64_t sub_10000B94C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v2[5] = a1;
  v2[6] = a2;
  swift_retain();
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = v2[2];
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  uint64_t v7 = (uint64_t (**)(uint64_t, char))(v5
                                              + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_onOrientationLock);
  *uint64_t v7 = sub_10006A14C;
  v7[1] = (uint64_t (*)(uint64_t, char))v6;
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void sub_10000BAC8()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  if (v2)
  {
    id v3 = objc_allocWithZone((Class)PHFrecentNavigationController);
    id v4 = v2;
    id v5 = [v3 initWithRootViewController:v4];
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v6 = *(void **)(v1 + OBJC_IVAR___FTRecentsContainerViewController_content);
    *(void *)(v1 + OBJC_IVAR___FTRecentsContainerViewController_content) = v5;
    id v8 = v5;
    sub_10000CD64(v6);
    swift_release();

    swift_release();
  }
  else
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v7 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_content);
    id v8 = v7;
    *(void *)(v0 + OBJC_IVAR___FTRecentsContainerViewController_content) = 0;
    sub_10000CD64(v7);
    swift_release();
    swift_release();
  }
}

uint64_t sub_10000BCCC()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)((char *)v0 + *(void *)(*v0 + 168));
  if ((unint64_t)(v1 - 1) <= 3)
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v0[4] = v1;
    swift_release();
  }

  return swift_release();
}

void *sub_10000BFC0(uint64_t a1, uint64_t a2)
{
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = [objc_allocWithZone((Class)BKSAccelerometer) init];
  v2[5] = 0;
  uint64_t v5 = v2[2];
  v2[2] = a1;
  v2[3] = a2;
  sub_10001ACD4(a1);
  sub_10000C128(v5);
  uint64_t v6 = (void *)v2[4];
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  id v8 = (objc_class *)type metadata accessor for AccelerometerDelegate();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  uint64_t v10 = (uint64_t (**)(uint64_t))&v9[OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_onOrientationChange];
  void *v10 = sub_10005A1F4;
  v10[1] = (uint64_t (*)(uint64_t))v7;
  *(void *)&v9[OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_accelerometer] = v6;
  v16.receiver = v9;
  v16.super_class = v8;
  id v11 = v6;
  swift_retain_n();
  [super init];
  id v13 = v12;
  [v11 setDelegate:v13];

  swift_release();
  sub_10000C128(a1);
  swift_release();
  uint64_t v14 = (void *)v2[5];
  v2[5] = v12;

  return v2;
}

uint64_t sub_10000C128(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10000C308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100017E2C((uint64_t *)&unk_1000BBD70);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10007E150;
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_10001AC80();
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  *(void *)(v6 + 96) = sub_100017E2C(&qword_1000BAF90);
  *(void *)(v6 + 104) = sub_10001AC24();
  *(void *)(v6 + 72) = a3;
  sub_1000175C8(0, (unint64_t *)&qword_1000BA8E8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  NSString v8 = String._bridgeToObjectiveC()();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  v11[4] = sub_10001AF88;
  v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1000088F0;
  v11[3] = &unk_1000A2D70;
  uint64_t v10 = _Block_copy(v11);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v10);
}

uint64_t sub_10000C570(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  if ((unint64_t)(a1 - 1) >= 4) {
    return a2;
  }
  else {
    return a1;
  }
}

void sub_10000C610()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for RecentsContainerViewController();
  [super viewWillLayoutSubviews];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___FTRecentsContainerViewController_content];
  id v3 = v2;
  swift_release();
  if (v2)
  {
    id v4 = [v3 view];

    if (v4)
    {
      id v5 = [v1 view];
      if (v5)
      {
        uint64_t v6 = v5;
        [v5 bounds];
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;

        [v4 setFrame:v8, v10, v12, v14];
        swift_release();

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_10000C8C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v31 = *(void *)(*v0 + 80);
  uint64_t v3 = *(void *)(v31 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v28 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v29 = (char *)&v26 - v7;
  uint64_t v9 = *(void *)(v8 + 88);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v6);
  double v12 = (char *)&v26 - v11;
  type metadata accessor for MainActor();
  uint64_t v30 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = (uint64_t)v0 + *(void *)(*v0 + 160);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  swift_release();
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)(v2 + 104) + 40))(v9);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_10000913C(v14);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v15 = (uint64_t)v1 + *(void *)(*v1 + 152);
  swift_beginAccess();
  uint64_t v16 = v3;
  v17 = v29;
  uint64_t v18 = v31;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v27(v29, v15, v31);
  swift_release();
  uint64_t v19 = *(void *)(v2 + 96);
  char v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 48))(v18, v19);
  v21 = *(void (**)(char *, uint64_t))(v16 + 8);
  v29 = (char *)(v16 + 8);
  v21(v17, v18);
  if (v20)
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v22 = v28;
    uint64_t v23 = v31;
    v27(v28, v15, v31);
    swift_release();
    uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 40))(v23, v19);
    v21(v22, v23);
    sub_100008A04(v24);
    sub_100008700(1);
  }
  return swift_release();
}

void sub_10000CD64(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1000175C8(0, (unint64_t *)&unk_1000BB4D0);
  *uint64_t v7 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  swift_release();
  char v8 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (!a1) {
    goto LABEL_9;
  }
  id v9 = a1;
  [v9 willMoveToParentViewController:0];
  id v10 = [v9 view];
  if (!v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v11 = v10;
  [v10 removeFromSuperview];

  [v9 removeFromParentViewController];
LABEL_9:
  double v12 = *(void **)&v2[OBJC_IVAR___FTRecentsContainerViewController_content];
  if (v12)
  {
    id v13 = v12;
    [v2 addChildViewController:v13];
    id v14 = [v2 view];
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = [v13 view];
      if (v16)
      {
        v17 = v16;
        [v15 addSubview:v16];

        [v13 didMoveToParentViewController:v2];
        swift_release();

        return;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  swift_release();
}

uint64_t sub_10000D248()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v1 = *(unsigned char *)(v0 + 40);
  swift_release();
  if ((v1 & 1) == 0)
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v2 = *(void *)(v0 + 24);
    swift_release();
    if ((unint64_t)(v2 - 1) <= 3)
    {
      uint64_t v3 = *(void *)(v0 + 24);
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(void *)(v0 + 32) = v3;
      swift_release();
    }
  }

  return swift_release();
}

uint64_t sub_10000D58C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  if (CGAffineTransformIsIdentity(&v6)) {
    [*(id *)(a1 + 32) setHidden:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t sub_10000D7AC()
{
  uint64_t v1 = *v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    swift_release();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "setOrientationEventsEnabled: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v5 = *((unsigned __int8 *)v0 + 16);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  (*(void (**)(uint64_t, void))(*(void *)(v1 + 104) + 56))(v5, *(void *)(v1 + 88));
  swift_endAccess();
  swift_release();
  if (*((unsigned char *)v0 + 16) == 1) {
    sub_10000C8C4();
  }
  return swift_release();
}

void sub_10000E6B4(uint64_t a1)
{
  +[TUCallCapabilities initializeCachedValues];
  id v2 = objc_alloc_init((Class)TUCallProviderManager);
  [*(id *)(a1 + 32) setCallProviderManager:v2];
  os_log_type_t v3 = +[CNContactStore contactStore];
  [*(id *)(a1 + 32) setContactStore:v3];

  uint64_t v4 = +[CNContactStore suggestedContactStore];
  [*(id *)(a1 + 32) setSuggestedContactStore:v4];

  id v5 = objc_alloc_init((Class)TUCallDirectoryMetadataCacheDataProvider);
  v14[0] = v5;
  id v6 = objc_alloc_init((Class)TUMapsMetadataCacheDataProvider);
  v14[1] = v6;
  id v7 = objc_alloc_init((Class)TUSuggestionsMetadataCacheDataProvider);
  v14[2] = v7;
  id v8 = objc_alloc_init((Class)TUGeoLocationMetadataCacheDataProvider);
  v14[3] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:4];

  id v10 = [objc_alloc((Class)TUMetadataCache) initWithDataProviders:v9];
  [*(id *)(a1 + 32) setMetadataCache:v10];

  if (+[PHDevice isGeminiCapable])
  {
    uint64_t v11 = [v2 telephonyProvider];
    double v12 = [v11 identifier];
    id v13 = [v2 providerWithIdentifier:v12];
  }
  [*(id *)(a1 + 32) setInitializationBlockQueued:0];
}

void sub_10000E88C(char a1)
{
  id v2 = v1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v1[40] == (a1 & 1))
  {
    swift_release();
  }
  else
  {
    swift_retain_n();
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 67109378;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      swift_release();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      *(_WORD *)(v6 + 8) = 2080;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v7 = *(void *)&v1[*(void *)(*(void *)v1 + 168)];
      swift_release();
      swift_release();
      swift_release();
      unint64_t v8 = 0xE800000000000000;
      uint64_t v9 = 0x7469617274726F70;
      switch(v7)
      {
        case 1:
          break;
        case 2:
          unint64_t v8 = 0x8000000100081810;
          uint64_t v9 = 0xD000000000000012;
          break;
        case 3:
          unint64_t v8 = 0xED00007466654C65;
          goto LABEL_20;
        case 4:
          unint64_t v8 = 0xEE00746867695265;
LABEL_20:
          uint64_t v9 = 0x70616373646E616CLL;
          break;
        case 5:
          unint64_t v8 = 0xE600000000000000;
          uint64_t v9 = 0x705565636166;
          break;
        case 6:
          uint64_t v9 = 0x6E776F4465636166;
          break;
        default:
          unint64_t v8 = 0xE700000000000000;
          uint64_t v9 = 0x6E776F6E6B6E75;
          break;
      }
      sub_10001AFF8(v9, v8, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "set orientation locked: %{BOOL}d to orientation: %s", (uint8_t *)v6, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    if (v2[40] == 1)
    {
      swift_release();
    }
    else
    {
      id v10 = [self defaultCenter];
      if (qword_1000BA748 != -1) {
        swift_once();
      }
      uint64_t v11 = qword_1000BD560;
      unint64_t v12 = sub_100050094();
      sub_100064204(v12);
      swift_bridgeObjectRelease();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v10 postNotificationName:v11 object:0 userInfo:isa];
      swift_release();
    }
  }
}

uint64_t sub_10000EDAC(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  uint64_t v7 = a4();
  swift_release();

  return v7;
}

id sub_10000EE64(uint64_t a1, SEL *a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped);
  swift_unknownObjectRetain();
  swift_release();
  id v5 = [v4 *a2];
  swift_release();
  swift_unknownObjectRelease();
  return v5;
}

void *sub_10000EF8C()
{
  uint64_t v1 = *v0;
  id v2 = [*(id *)((char *)*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController) recentCalls];
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  os_log_type_t v3 = v2;
  sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v5 = v1;
  id v6 = sub_100015FEC(v4, v5);
  swift_bridgeObjectRelease();

  return v6;
}

void sub_10000F7C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchContactFormatter];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) fetchNumberFormatter];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v5;

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v8;

  [*(id *)(a1 + 32) updateRecentCalls];
  [*(id *)(a1 + 32) setUnreadCallCount:[*(id *)(*(void *)(a1 + 32) + 24) unreadCallCount]];
  uint64_t v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleCNContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleIDSServiceAvailabilityDidChangeNotification:" name:IDSServiceAvailabilityDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleNSCurrentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUCallHistoryControllerRecentCallsDidChangeNotification:" name:TUCallHistoryControllerRecentCallsDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:" name:TUCallHistoryControllerUnreadCallCountDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUMetadataCacheDidFinishUpdatingNotification:" name:TUMetadataCacheDidFinishUpdatingNotification object:*(void *)(*(void *)(a1 + 32) + 104)];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationSignificantTimeChangeNotification:" name:UIApplicationSignificantTimeChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (qword_1000BC1E8 != -1) {
    dispatch_once(&qword_1000BC1E8, &stru_1000A24B0);
  }
  unint64_t v12 = (const char *)qword_1000BC1F0;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = (int *)(v13 + 16);
  uint64_t v15 = *(NSObject **)(v13 + 48);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100032DE8;
  handler[3] = &unk_1000A2300;
  objc_copyWeak(&v18, &location);
  id v17 = *(id *)(a1 + 32);
  notify_register_dispatch(v12, v14, v15, handler);
  [*(id *)(a1 + 32) setInitializationBlockQueued:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void sub_10000FA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL sub_10000FCA8()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  id v2 = v1;
  swift_release();
  swift_release();
  if (v1) {

  }
  return v1 != 0;
}

void sub_10000FDC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Registration dismissed but faceTimeRootViewController is not visible.", v1, 2u);
}

id sub_10000FEA8()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_1000BA700 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1000BAE10;
  swift_retain();
  swift_release();
  uint64_t v1 = (objc_class *)type metadata accessor for PHOrientationMonitor_OBJC();
  id v2 = (char *)objc_allocWithZone(v1);
  *(void *)&v2[OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped] = v0;
  v5.receiver = v2;
  v5.super_class = v1;
  [super init];
  swift_release();
  return v3;
}

uint64_t type metadata accessor for PHOrientationMonitor_OBJC()
{
  return self;
}

uint64_t sub_100010150()
{
  uint64_t v1 = (unsigned char *)v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  swift_retain();
  swift_release();
  sub_10000B28C();
  unint64_t v2 = sub_100007000();
  swift_release();
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(v0 + 24) = v2;
  sub_10000D248();
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  swift_retain();
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017E2C(&qword_1000BAE78);
  swift_initStaticObject();
  char v3 = sub_10000901C();
  swift_release();
  swift_release();
  swift_release();
  if (v3)
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_retain();
    swift_release();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_100017E2C(&qword_1000BAE80);
    swift_initStaticObject();
    uint64_t v4 = sub_100007DBC();
    swift_release();
    swift_release();
    swift_release();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(void *)&v1[*(void *)(*(void *)v1 + 168)] = v4;
    sub_10000BCCC();
    swift_release();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    char v5 = v1[40];
    v1[40] = 1;
    sub_10000E88C(v5);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1000106A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100010718(v3, a2);
  sub_100011408(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_100010718(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_100010950(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  a4();
  swift_release();
}

void sub_100010A38()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = OBJC_IVAR___FTRecentsContainerViewController_recentsList;
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  swift_release();
  if (v3)
  {
    if (qword_1000BA708 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100011408(v4, (uint64_t)qword_1000BB6F0);
    oslog = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v5, "Already showing RecentsListViewController", v6, 2u);
      swift_slowDealloc();
    }
    goto LABEL_25;
  }
  if (qword_1000BA708 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100011408(v7, (uint64_t)qword_1000BB6F0);
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Showing RecentsListViewController", v10, 2u);
    swift_slowDealloc();
  }

  oslog = [self sharedApplication];
  self;
  uint64_t v11 = (void *)swift_dynamicCastObjCClassUnconditional();
  type metadata accessor for RecentsListItemViewHelper();
  [v11 shouldUseCompactHorizontalLayout];
  static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.setter();
  id v12 = [v11 recentsController];
  if (!v12)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v13 = v12;
  id v14 = objc_allocWithZone((Class)type metadata accessor for RecentCallProvider());
  sub_10000A900(v13);
  sub_10001103C(&qword_1000BB7E0, (void (*)(uint64_t))type metadata accessor for RecentCallProvider);
  sub_10001103C(&qword_1000BB7E8, (void (*)(uint64_t))type metadata accessor for RecentCallProvider);
  id v15 = [v11 recentsController];
  if (!v15)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  id v16 = v15;
  type metadata accessor for RecentCallDetailControllerFactory();
  uint64_t v17 = swift_allocObject();
  id v18 = [objc_allocWithZone((Class)TUFeatureFlags) init];
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = v18;
  sub_10001103C((unint64_t *)&unk_1000BB7F0, (void (*)(uint64_t))type metadata accessor for RecentCallDetailControllerFactory);
  id v19 = [v11 recentsController];
  if (!v19)
  {
LABEL_31:
    __break(1u);
    return;
  }
  char v20 = v19;
  id v21 = [v19 contactStore];

  id v22 = objc_allocWithZone((Class)type metadata accessor for RecentsListViewController());
  uint64_t v23 = (void *)RecentsListViewController.init(recentCallProvider:detailControllerFactory:contactStore:)();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v24 = *(void **)(v1 + v2);
  *(void *)(v1 + v2) = v23;
  id v25 = v23;

  sub_10000BAC8();
  swift_release();

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v26 = *(void **)(v1 + v2);
  id v27 = v26;
  swift_release();
  if (v26)
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_10001ACD4(*(void *)(v1 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield));
    swift_release();
    dispatch thunk of RecentsListViewController.presentScreenTimeShield.setter();
    swift_release();

    goto LABEL_26;
  }
LABEL_25:
  swift_release();
LABEL_26:
}

uint64_t sub_10001103C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for RecentCallProvider()
{
  return self;
}

id sub_100011274(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  if (!v4)
  {
    os_log_type_t v5 = +[NSBundle mainBundle];
    uint64_t v4 = [v5 bundleIdentifier];
  }
  if ([(__CFString *)v3 length] && [(__CFString *)v4 length]) {
    id v6 = (void *)CFPreferencesCopyValue(v3, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
  else {
    id v6 = 0;
  }

  return v6;
}

id sub_100011338(void *a1)
{
  return sub_100011274(a1, 0);
}

uint64_t sub_100011340()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100010718(v0, qword_1000BADF0);
  uint64_t v1 = sub_100011408(v0, (uint64_t)qword_1000BADF0);
  if (qword_1000BA710 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100011408(v0, (uint64_t)qword_1000BD4B8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100011408(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_100012C68()
{
  if (qword_1000BBFD0 != -1) {
    dispatch_once(&qword_1000BBFD0, &stru_1000A2070);
  }
  uint64_t v0 = (void *)qword_1000BBFC8;

  return v0;
}

void sub_100012E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100012E5C(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

void sub_100013AB8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactsByHandleForRecentCall:*(void *)(a1 + 40) keyDescriptors:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    os_log_type_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v2 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v12 = [v2 objectForKeyedSubscript:v11];
          uint64_t v13 = [v12 firstObject];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v13 forKeyedSubscript:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

void sub_100014024()
{
}

void sub_100014048()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "recentCalls"));
  if (!v1) {
    return;
  }
  sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_4;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    if (((unint64_t)&_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_25;
  }
LABEL_4:
  if (v3 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    id v6 = v5;
    id v7 = [v5 serviceProvider];
    if (!v7)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_7:

      swift_bridgeObjectRelease();
      continue;
    }
    id v8 = v7;
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (!v11) {
      goto LABEL_7;
    }
    if (v9 == v12 && v11 == v13)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {

        continue;
      }
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)&_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_29:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    goto LABEL_27;
  }
LABEL_26:
  if (((unint64_t)&_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_29;
  }
LABEL_27:
  swift_release();
}

id sub_100015940(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 length]) {
    goto LABEL_6;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 1)
  {
    id v5 = TUBundle();
    id v6 = [v5 localizedStringForKey:@"%@_AND_ONE_OTHER" value:&stru_1000A3488 table:@"TelephonyUtilities"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (v4 >= 2)
  {
    id v8 = TUBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"%@_AND_%@_OTHERS" value:&stru_1000A3488 table:@"TelephonyUtilities"];
    uint64_t v10 = [*(id *)(a1 + 32) numberFormatter];
    uint64_t v11 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
    uint64_t v12 = [v10 stringFromNumber:v11];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v3, v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v7 = v3;
  }
LABEL_7:

  return v7;
}

void *sub_100015FEC(unint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100017E2C((uint64_t *)&unk_1000BB4A0);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for RecentsCallItem();
  uint64_t v35 = *(void *)(v46 - 8);
  uint64_t v9 = __chkstk_darwin(v46);
  v41 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v34 = (char *)&v34 - v11;
  unint64_t v42 = a1;
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v12 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v12; uint64_t v12 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v43 = v3;
    v39 = *(char **)&a2[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController];
    unint64_t v40 = v42 & 0xC000000000000001;
    v37 = (id *)(v35 + 32);
    v38 = (unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
    uint64_t v13 = &_swiftEmptyArrayStorage;
    uint64_t v14 = 4;
    uint64_t v36 = v12;
    while (1)
    {
      uint64_t v3 = v14 - 4;
      id v15 = v40 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v42 + 8 * v14);
      long long v16 = v15;
      if (__OFADD__(v3, 1)) {
        break;
      }
      v44 = v13;
      uint64_t v45 = v14 - 3;
      a2 = v39;
      id v17 = [v39 itemForRecentCall:v15];
      sub_100017E2C(&qword_1000BAD60);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      id v19 = [a2 contactByHandleForRecentCall:v16 keyDescriptors:isa];

      if (v19)
      {
        a2 = (char *)&unk_1000BB4B0;
        sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
        sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
        sub_100017E70((unint64_t *)&qword_1000BBD80, (unint64_t *)&unk_1000BB4B0);
        uint64_t v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
      }
      else
      {
        uint64_t v20 = 0;
      }
      id v21 = [v16 validRemoteParticipantHandles:v34];
      if (v21)
      {
        id v22 = v21;
        a2 = (char *)&unk_1000BB4B0;
        sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
        sub_100017E70((unint64_t *)&qword_1000BBD80, (unint64_t *)&unk_1000BB4B0);
        uint64_t v23 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

        swift_bridgeObjectRetain();
        id v24 = v16;
        uint64_t v25 = v43;
        sub_1000170D0(v23, v20, v24);
        id v27 = v26;
        uint64_t v43 = v25;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        id v27 = &_swiftEmptyArrayStorage;
      }
      uint64_t v28 = v36;
      uint64_t v13 = v44;
      sub_10001760C(v16, v17, (uint64_t)v27, (uint64_t)v8);

      swift_bridgeObjectRelease();
      if ((*v38)(v8, 1, v46) == 1)
      {
        sub_100017EC0((uint64_t)v8, (uint64_t *)&unk_1000BB4A0);
      }
      else
      {
        a2 = (char *)*v37;
        v29 = v34;
        uint64_t v30 = v46;
        ((void (*)(char *, char *, uint64_t))*v37)(v34, v8, v46);
        ((void (*)(char *, char *, uint64_t))a2)(v41, v29, v30);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v13 = (void *)sub_100016CCC(0, v13[2] + 1, 1, (unint64_t)v13, &qword_1000BB4C0, (uint64_t (*)(void))&type metadata accessor for RecentsCallItem, (uint64_t (*)(void))&type metadata accessor for RecentsCallItem);
        }
        unint64_t v32 = v13[2];
        unint64_t v31 = v13[3];
        if (v32 >= v31 >> 1) {
          uint64_t v13 = (void *)sub_100016CCC(v31 > 1, v32 + 1, 1, (unint64_t)v13, &qword_1000BB4C0, (uint64_t (*)(void))&type metadata accessor for RecentsCallItem, (uint64_t (*)(void))&type metadata accessor for RecentsCallItem);
        }
        v13[2] = v32 + 1;
        ((void (*)(char *, char *, uint64_t))a2)((char *)v13+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v32, v41, v46);
      }
      ++v14;
      if (v45 == v28)
      {
        swift_bridgeObjectRelease();
        return v13;
      }
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100016548(uint64_t a1)
{
  uint64_t v68 = type metadata accessor for RecentsCallHandleType();
  uint64_t v2 = *(void *)(v68 - 8);
  uint64_t v3 = __chkstk_darwin(v68);
  v67 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v66 = (char *)&v45 - v5;
  uint64_t v6 = sub_100017E2C(&qword_1000BAF48);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for RecentsCallHandle();
  uint64_t v50 = *(void *)(v70 - 8);
  uint64_t v9 = __chkstk_darwin(v70);
  v49 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v46 = (char *)&v45 - v11;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_100017E70((unint64_t *)&qword_1000BBD80, (unint64_t *)&unk_1000BB4B0);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    a1 = v72;
    uint64_t v57 = v73;
    uint64_t v13 = v74;
    uint64_t v14 = v75;
    unint64_t v15 = v76;
  }
  else
  {
    uint64_t v16 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v57 = a1 + 56;
    uint64_t v13 = ~v16;
    uint64_t v18 = -v16;
    if (v18 < 64) {
      uint64_t v19 = ~(-1 << v18);
    }
    else {
      uint64_t v19 = -1;
    }
    unint64_t v15 = v19 & v17;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v14 = 0;
  }
  uint64_t v55 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v47 = v13;
  int64_t v56 = (unint64_t)(v13 + 64) >> 6;
  int v53 = enum case for RecentsCallHandleType.emailAddress(_:);
  v65 = (void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  unsigned int v59 = enum case for RecentsCallHandleType.phoneNumber(_:);
  int v52 = enum case for RecentsCallHandleType.generic(_:);
  unsigned int v58 = enum case for RecentsCallHandleType.unknown(_:);
  v63 = (void (**)(char *, uint64_t))(v2 + 8);
  v64 = (void (**)(char *, char *, uint64_t))(v2 + 16);
  v61 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48);
  v62 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56);
  v51 = &_swiftEmptyArrayStorage;
  v48 = (void (**)(char *, uint64_t, uint64_t))(v50 + 32);
  v54 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v69 = a1;
  v60 = v8;
  uint64_t v20 = v68;
LABEL_8:
  uint64_t v21 = v14;
  if (a1 < 0)
  {
    while (1)
    {
      uint64_t v24 = __CocoaSet.Iterator.next()();
      if (!v24) {
        goto LABEL_45;
      }
      uint64_t v71 = v24;
      sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v25 = v77;
      swift_unknownObjectRelease();
      uint64_t v14 = v21;
      uint64_t v22 = v15;
      if (!v25) {
        goto LABEL_45;
      }
LABEL_31:
      id v29 = [v25 type];
      if (v29 == (id)3) {
        break;
      }
      uint64_t v30 = v59;
      if (v29 != (id)2)
      {
        uint64_t v30 = v58;
        if (v29 == (id)1)
        {
          unint64_t v31 = (char *)&v78;
LABEL_36:
          uint64_t v30 = *((unsigned int *)v31 - 64);
        }
      }
      unint64_t v32 = v66;
      (*v65)(v66, v30, v20);
      (*v64)(v67, v32, v20);
      id v33 = [v25 value];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v34 = (uint64_t)v60;
      RecentsCallHandle.init(type:value:)();
      uint64_t v35 = v34;
      (*v63)(v32, v20);
      uint64_t v36 = v34;
      uint64_t v37 = v70;
      (*v62)(v36, 0, 1, v70);

      if ((*v61)(v35, 1, v37) != 1)
      {
        v38 = *v48;
        v39 = v46;
        uint64_t v40 = v70;
        (*v48)(v46, v35, v70);
        v38(v49, (uint64_t)v39, v40);
        unint64_t v41 = (unint64_t)v51;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v41 = sub_1000170AC(0, *(void *)(v41 + 16) + 1, 1, v41);
        }
        unint64_t v43 = *(void *)(v41 + 16);
        unint64_t v42 = *(void *)(v41 + 24);
        if (v43 >= v42 >> 1) {
          unint64_t v41 = sub_1000170AC(v42 > 1, v43 + 1, 1, v41);
        }
        *(void *)(v41 + 16) = v43 + 1;
        unint64_t v44 = (*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
        v51 = (void *)v41;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v38)(v41 + v44 + *(void *)(v50 + 72) * v43, v49, v70);
        a1 = v69;
        unint64_t v15 = v22;
        goto LABEL_8;
      }
      uint64_t result = sub_100017EC0(v35, &qword_1000BAF48);
      uint64_t v21 = v14;
      unint64_t v15 = v22;
      a1 = v69;
      if ((v69 & 0x8000000000000000) == 0) {
        goto LABEL_9;
      }
    }
    unint64_t v31 = (char *)&v78 + 4;
    goto LABEL_36;
  }
LABEL_9:
  if (v15)
  {
    uint64_t v22 = (v15 - 1) & v15;
    unint64_t v23 = __clz(__rbit64(v15)) | (v21 << 6);
    uint64_t v14 = v21;
    goto LABEL_30;
  }
  int64_t v26 = v21 + 1;
  if (!__OFADD__(v21, 1))
  {
    if (v26 < v56)
    {
      unint64_t v27 = *(void *)(v57 + 8 * v26);
      uint64_t v14 = v21 + 1;
      if (v27) {
        goto LABEL_29;
      }
      uint64_t v14 = v21 + 2;
      if (v21 + 2 >= v56) {
        goto LABEL_45;
      }
      unint64_t v27 = *(void *)(v57 + 8 * v14);
      if (v27) {
        goto LABEL_29;
      }
      uint64_t v14 = v21 + 3;
      if (v21 + 3 >= v56) {
        goto LABEL_45;
      }
      unint64_t v27 = *(void *)(v57 + 8 * v14);
      if (v27) {
        goto LABEL_29;
      }
      uint64_t v14 = v21 + 4;
      if (v21 + 4 >= v56) {
        goto LABEL_45;
      }
      unint64_t v27 = *(void *)(v57 + 8 * v14);
      if (v27)
      {
LABEL_29:
        uint64_t v22 = (v27 - 1) & v27;
        unint64_t v23 = __clz(__rbit64(v27)) + (v14 << 6);
LABEL_30:
        id v25 = *(id *)(*(void *)(a1 + 48) + 8 * v23);
        if (v25) {
          goto LABEL_31;
        }
        goto LABEL_45;
      }
      uint64_t v14 = v21 + 5;
      if (v21 + 5 < v56)
      {
        unint64_t v27 = *(void *)(v57 + 8 * v14);
        if (!v27)
        {
          uint64_t v28 = v21 + 6;
          while (v56 != v28)
          {
            unint64_t v27 = *(void *)(v57 + 8 * v28++);
            if (v27)
            {
              uint64_t v14 = v28 - 1;
              a1 = v69;
              goto LABEL_29;
            }
          }
          goto LABEL_45;
        }
        goto LABEL_29;
      }
    }
LABEL_45:
    sub_100017604();
    return (uint64_t)v51;
  }
  __break(1u);
  return result;
}

uint64_t sub_100016CCC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100017E2C(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100016F50(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_100016F50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000170AC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100016CCC(a1, a2, a3, a4, &qword_1000BB4C8, (uint64_t (*)(void))&type metadata accessor for RecentsCallHandle, (uint64_t (*)(void))&type metadata accessor for RecentsCallHandle);
}

void sub_1000170D0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_100017E70((unint64_t *)&qword_1000BBD80, (unint64_t *)&unk_1000BB4B0);
    Set.Iterator.init(_cocoa:)();
    uint64_t v4 = v32;
    uint64_t v28 = v33;
    uint64_t v5 = v34;
    uint64_t v6 = v35;
    unint64_t v7 = v36;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v28 = a1 + 56;
    uint64_t v9 = ~v8;
    uint64_t v10 = -v8;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v7 = v11 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v5 = v9;
    uint64_t v6 = 0;
  }
  int64_t v27 = (unint64_t)(v5 + 64) >> 6;
  if ((v4 & 0x8000000000000000) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  if (!__CocoaSet.Iterator.next()()) {
    goto LABEL_50;
  }
  sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v12 = v31;
  swift_unknownObjectRelease();
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  if (!v31) {
    goto LABEL_50;
  }
  while (1)
  {
    if (a2)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v19 = v12;
        if (!__CocoaDictionary.lookup(_:)()) {
          goto LABEL_41;
        }
        sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();

        if (v31) {
          goto LABEL_40;
        }
      }
      else if (*(void *)(a2 + 16))
      {
        unint64_t v20 = sub_1000592EC((uint64_t)v12);
        if ((v21 & 1) == 0)
        {
LABEL_41:

          goto LABEL_42;
        }
        id v22 = *(id *)(*(void *)(a2 + 56) + 8 * v20);

        if (v22)
        {
LABEL_40:
          unint64_t v30 = v14;
          goto LABEL_46;
        }
      }
    }
LABEL_42:
    id v23 = [v12 tuHandle];
    if (!v23)
    {

      uint64_t v6 = v13;
      unint64_t v7 = v14;
      if (v4 < 0) {
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    id v24 = v23;
    unint64_t v30 = v14;
    NSString v25 = [a3 isoCountryCode];
    if (v25)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      NSString v25 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    id v26 = [self contactForHandle:v24 isoCountryCode:v25 metadataCache:0];

    id v12 = v24;
LABEL_46:

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    uint64_t v6 = v13;
    unint64_t v7 = v30;
    if (v4 < 0) {
      goto LABEL_10;
    }
LABEL_13:
    if (!v7) {
      break;
    }
    uint64_t v14 = (v7 - 1) & v7;
    unint64_t v15 = __clz(__rbit64(v7)) | (v6 << 6);
    uint64_t v13 = v6;
LABEL_31:
    id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v15);
    if (!v12) {
      goto LABEL_50;
    }
  }
  int64_t v16 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    return;
  }
  if (v16 >= v27) {
    goto LABEL_50;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v16);
  uint64_t v13 = v6 + 1;
  if (v17) {
    goto LABEL_30;
  }
  uint64_t v13 = v6 + 2;
  if (v6 + 2 >= v27) {
    goto LABEL_50;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v13);
  if (v17) {
    goto LABEL_30;
  }
  uint64_t v13 = v6 + 3;
  if (v6 + 3 >= v27) {
    goto LABEL_50;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v13);
  if (v17) {
    goto LABEL_30;
  }
  uint64_t v13 = v6 + 4;
  if (v6 + 4 >= v27) {
    goto LABEL_50;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v13);
  if (v17) {
    goto LABEL_30;
  }
  uint64_t v13 = v6 + 5;
  if (v6 + 5 >= v27) {
    goto LABEL_50;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v13);
  if (v17)
  {
LABEL_30:
    uint64_t v14 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
    goto LABEL_31;
  }
  uint64_t v18 = v6 + 6;
  while (v27 != v18)
  {
    unint64_t v17 = *(void *)(v28 + 8 * v18++);
    if (v17)
    {
      uint64_t v13 = v18 - 1;
      goto LABEL_30;
    }
  }
LABEL_50:
  sub_100017604();
}

uint64_t sub_1000175C8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100017604()
{
  return swift_release();
}

uint64_t sub_10001760C@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v91 = a4;
  uint64_t v92 = a3;
  uint64_t v6 = sub_100017E2C(&qword_1000BAF10);
  __chkstk_darwin(v6 - 8);
  v90 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100017E2C(&qword_1000BAF18);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for RecentCallRecentItemMetadata();
  uint64_t v87 = *(void *)(v89 - 8);
  uint64_t v11 = __chkstk_darwin(v89);
  v88 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v86 = (char *)&v76 - v13;
  uint64_t v14 = sub_100017E2C(&qword_1000BAF20);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  unint64_t v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  unint64_t v20 = (char *)&v76 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  id v23 = (char *)&v76 - v22;
  __chkstk_darwin(v21);
  NSString v25 = (char *)&v76 - v24;
  uint64_t v26 = sub_100017E2C(&qword_1000BAF28);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  uint64_t v93 = (uint64_t)&v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  unint64_t v31 = (char *)&v76 - v30;
  __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v76 - v32;
  id v34 = [a1 uniqueId];
  uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v84 = v36;
  uint64_t v85 = v35;

  id v37 = [a1 date];
  if (v37)
  {
    v38 = v37;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v39 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v31, 0, 1, v39);
  }
  else
  {
    uint64_t v40 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v31, 1, 1, v40);
  }
  sub_100017F80((uint64_t)v31, (uint64_t)v33, &qword_1000BAF28);
  id v41 = [a2 localizedTitle];
  if (v41)
  {
    unint64_t v42 = v41;
    uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v82 = v44;
    uint64_t v83 = v43;
  }
  else
  {
    uint64_t v82 = 0;
    uint64_t v83 = 0;
  }
  id v45 = [a2 localizedSubtitle];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v80 = v48;
    uint64_t v81 = v47;
  }
  else
  {
    uint64_t v80 = 0;
    uint64_t v81 = 0;
  }
  id v49 = [a2 localizedSenderIdentityTitle];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v78 = v52;
    uint64_t v79 = v51;
  }
  else
  {
    uint64_t v78 = 0;
    uint64_t v79 = 0;
  }
  id v53 = [a2 localizedCount];
  if (v53)
  {
    v54 = v53;
    uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v76 = v56;
    uint64_t v77 = v55;
  }
  else
  {
    uint64_t v76 = 0;
    uint64_t v77 = 0;
  }
  id v57 = [a1 conversationID:v76, v77];
  if (v57)
  {
    unsigned int v58 = v57;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v59 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v23, 0, 1, v59);
  }
  else
  {
    uint64_t v60 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v23, 1, 1, v60);
  }
  sub_100017F80((uint64_t)v23, (uint64_t)v25, &qword_1000BAF20);
  id v61 = [a1 validRemoteParticipantHandles];
  if (v61)
  {
    v62 = v61;
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_100017E70((unint64_t *)&qword_1000BBD80, (unint64_t *)&unk_1000BB4B0);
    uint64_t v63 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v64 = sub_100016548(v63);
    swift_bridgeObjectRelease();
    sub_100018004(v64);
    swift_bridgeObjectRelease();
  }
  sub_100017F1C((uint64_t)v33, v93, &qword_1000BAF28);
  [a1 mediaType];
  [a1 countOfExcludedHandles];
  id v65 = [a1 participantGroupUUID];
  if (v65)
  {
    v66 = v65;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v67 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v20, 0, 1, v67);
  }
  else
  {
    uint64_t v68 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v20, 1, 1, v68);
  }
  uint64_t v69 = type metadata accessor for ConversationLink();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v10, 1, 1, v69);
  sub_100017F1C((uint64_t)v25, (uint64_t)v17, &qword_1000BAF20);
  id v70 = a1;
  uint64_t v71 = v86;
  RecentCallRecentItemMetadata.init(uniqueId:date:recentCall:mediaType:remoteParticipantHandles:countOfExcludedHandles:groupUUID:conversationLink:conversationID:)();
  uint64_t v72 = v87;
  uint64_t v73 = v89;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v88, v71, v89);
  uint64_t v74 = type metadata accessor for RecentsCallItemType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v90, 1, 1, v74);
  swift_bridgeObjectRetain();
  RecentsCallItem.init(recentsCallMetadata:contacts:title:subtitle:forcedSubtitle:senderIdentity:occurrenceCount:applicationIcon:type:)();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
  sub_100017EC0((uint64_t)v25, &qword_1000BAF20);
  return sub_100017EC0((uint64_t)v33, &qword_1000BAF28);
}

uint64_t sub_100017E2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100017E70(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000175C8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100017EC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100017E2C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100017F1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100017E2C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017F80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100017E2C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100018004(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RecentsCallHandle();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_10001818C(&qword_1000BAF30);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_1000181D0((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_10001818C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for RecentsCallHandle();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000181D0(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for RecentsCallHandle();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_10001818C(&qword_1000BAF30);
  swift_bridgeObjectRetain();
  id v34 = a2;
  uint64_t v11 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      uint64_t v21 = v14;
      v14(v9, v20, v6);
      sub_10001818C(&qword_1000BAF38);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)();
      id v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      uint64_t v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    NSString v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1000184CC((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1000184CC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = type metadata accessor for RecentsCallHandle();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1000518F0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_100052184();
      goto LABEL_12;
    }
    sub_1000525D4();
  }
  uint64_t v12 = *v3;
  sub_10001818C(&qword_1000BAF30);
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    unint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_10001818C(&qword_1000BAF38);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_1000189C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019890(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemCache];
  uint64_t v2 = [*(id *)(a1 + 40) uniqueId];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001A0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001A288(uint64_t a1)
{
  return _[*(id *)(a1 + 32) logRecentsScrollingEvent:*(void *)(a1 + 40)];
}

id sub_10001A294(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls) = 1;
  return [*(id *)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController) continuousScrollingReachedIndexPath:a1];
}

uint64_t sub_10001A2F4()
{
  return *(unsigned __int8 *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls);
}

id sub_10001A3F8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setContentViewNormalPosition];
}

uint64_t type metadata accessor for PHCFNotifyObserver()
{
  return sub_10000748C();
}

uint64_t sub_10001A438()
{
  return swift_release();
}

uint64_t sub_10001A440()
{
  return swift_release();
}

uint64_t sub_10001A448()
{
  return swift_release();
}

uint64_t sub_10001A450()
{
  return swift_release();
}

uint64_t sub_10001A458()
{
  return swift_release();
}

uint64_t sub_10001A460(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A470(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A480(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A490(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

void *sub_10001A4B0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001A4F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001A53C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_10001A58C(id a1)
{
  uint64_t v1 = (uint64_t *)CUTWeakLinkSymbol();
  if (v1) {
    qword_1000BC1F0 = *v1;
  }
}

void sub_10001A5C4(id a1)
{
  qword_1000BBFC8 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id sub_10001A608(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartedLoadingOlderCalls:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateRecentCalls];
}

id sub_10001A648(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeCalls:*(void *)(a1 + 48)];
}

id sub_10001A658(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecentCalls];
}

void sub_10001A660(id a1)
{
  +[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", [UIApp backdropStyle]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 blurRadius];
  byte_1000BC258 = v1 > 0.0;
}

id sub_10001A6D8(uint64_t a1)
{
  [*(id *)(a1 + 32) fadeInAnimated:*(unsigned __int8 *)(a1 + 56)];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return _[v2 updateVideoViewControllerWithOrientationMonitor:v3];
}

id sub_10001A718(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_10001A724(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 markRecentCallsAsRead];
}

uint64_t sub_10001A768(uint64_t a1)
{
  qword_1000BC1C8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_10001A7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10001A7FC(uint64_t a1, unint64_t a2)
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
      uint64_t v3 = sub_100007518(v2, 0);
      if (v2 < 0) {
        break;
      }
      uint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001A974(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001A7FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100063ADC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100063ADC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_10001AA0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001A974(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

void sub_10001ABC8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
}

unint64_t sub_10001AC24()
{
  unint64_t result = qword_1000BAF98;
  if (!qword_1000BAF98)
  {
    sub_10001A4F4(&qword_1000BAF90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BAF98);
  }
  return result;
}

unint64_t sub_10001AC80()
{
  unint64_t result = qword_1000BB4E0;
  if (!qword_1000BB4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB4E0);
  }
  return result;
}

uint64_t sub_10001ACD4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_10001ACE4()
{
  sub_10000B28C();
  unint64_t v0 = sub_100007000();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for OrientationMonitorAccelerometer()
{
  return self;
}

uint64_t type metadata accessor for SpringBoardOrientationObserver()
{
  uint64_t result = qword_1000BBB88;
  if (!qword_1000BBB88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_10001ADCC()
{
  return sub_10000EE64(67, (SEL *)&selRef_lastValidInterfaceOrientation);
}

id sub_10001ADF8()
{
  return sub_10000EE64(59, (SEL *)&selRef_deviceOrientation);
}

uint64_t variable initialization expression of ClarityUISceneDelegate.window()
{
  return 0;
}

uint64_t type metadata accessor for AccelerometerDelegate()
{
  return self;
}

void sub_10001AE74()
{
  *(unsigned char *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls) = 0;
}

id sub_10001AE88()
{
  return [*(id *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController) markRecentCallsAsRead];
}

uint64_t sub_10001AEA4(uint64_t a1, uint64_t a2)
{
  sub_100007C28(a1, a2);

  return sub_10000C128(a1);
}

uint64_t type metadata accessor for OrientationMonitor()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10001AF08(uint64_t a1, uint64_t a2)
{
  return sub_1000099C4(a1, a2, 33, (uint64_t (*)(uint64_t))sub_100008F8C);
}

uint64_t type metadata accessor for MPAnalyticsLogger()
{
  return self;
}

uint64_t sub_10001AF88()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10001AF90(uint64_t a1)
{
  return sub_1000106A4(a1, qword_1000BD4D0);
}

uint64_t sub_10001AFC4(uint64_t a1)
{
  return sub_1000106A4(a1, qword_1000BD4B8);
}

uint64_t sub_10001AFF8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001AA0C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001A7A0((uint64_t)v12, *a3);
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
      sub_10001A7A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001A53C((uint64_t)v12);
  return v7;
}

uint64_t sub_10001B0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001B130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C((uint64_t *)&unk_1000BB490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C((uint64_t *)&unk_1000BB490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10001BBB0(id a1)
{
  qword_1000BBF20 = objc_alloc_init(PHDevice);

  _objc_release_x1();
}

id sub_10001BCDC(uint64_t a1)
{
  id v2 = objc_alloc((Class)RadiosPreferences);
  uint64_t v3 = [*(id *)(a1 + 32) dispatchQueue];
  id v4 = [v2 initWithQueue:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 32) fetchCellularRadioEnabled];
  id result = [*(id *)(a1 + 32) fetchRingerSwitchEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = (_BYTE)result;
  return result;
}

void sub_10001BE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001BEB0(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void sub_10001BF5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BFEC;
    block[3] = &unk_1000A1D50;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10001BFEC(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHDeviceCellularRadioEnabledDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_10001C10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C124(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

void sub_10001C1D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(unsigned char *)(v1 + 9) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C260;
    block[3] = &unk_1000A1D50;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10001C260(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHDeviceRingerSwitchDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_10001C3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C3EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001C3FC(uint64_t a1)
{
}

void sub_10001C404(uint64_t a1)
{
}

void sub_10001C558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C57C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRingerSwitchEnabled:[WeakRetained fetchRingerSwitchEnabled]];
}

void sub_10001DA3C(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() badge];
  uint64_t v4 = v3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DAEC;
  block[3] = &unk_1000A1DF0;
  id v6 = *(id *)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10001DAEC(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  sub_10003D7B4(a1[5], a1[6]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setBadgeValue:v2];
}

id sub_10001E7AC()
{
  if (qword_1000BBF48 != -1) {
    dispatch_once(&qword_1000BBF48, &stru_1000A1E38);
  }
  unint64_t v0 = (void *)qword_1000BBF40;

  return v0;
}

void sub_10001E800(id a1)
{
  qword_1000BBF40 = CUTWeakLinkClass();
  if (!qword_1000BBF40)
  {
    uint64_t v1 = sub_100012C68();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTUIConversationViewController; RTTUI may have failed to link.",
        v2,
        2u);
    }
  }
}

id sub_10001E888()
{
  if (qword_1000BBF58 != -1) {
    dispatch_once(&qword_1000BBF58, &stru_1000A1E58);
  }
  unint64_t v0 = (void *)qword_1000BBF50;

  return v0;
}

void sub_10001E8DC(id a1)
{
  qword_1000BBF50 = CUTWeakLinkClass();
  if (!qword_1000BBF50)
  {
    uint64_t v1 = sub_100012C68();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTUIUtilities; RTTUI.framework may have failed to link.",
        v2,
        2u);
    }
  }
}

UIFont *__cdecl sub_10001F698(UIFont *self, SEL a2)
{
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_1000A5EC8;
  v11[1] = &off_1000A5EE0;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v12 = v3;
  uint64_t v4 = +[NSArray arrayWithObjects:&v12 count:1];
  uint64_t v14 = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v6 = [(UIFont *)self fontDescriptor];
  id v7 = [v6 fontDescriptorByAddingAttributes:v5];

  uint64_t v8 = +[UIFont fontWithDescriptor:v7 size:0.0];

  return (UIFont *)v8;
}

void sub_1000208A0(id a1)
{
  uint64_t v1 = sub_100012C68();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "prewarming InCallService...", buf, 2u);
  }

  id v2 = objc_alloc_init((Class)CUTWeakLinkClass());
  uint64_t v3 = TUBundleIdentifierInCallServiceApplication;
  if ([v2 pidForApplication:TUBundleIdentifierInCallServiceApplication] == -1)
  {
    [v2 openApplication:v3 options:&__NSDictionary0__struct withResult:&stru_1000A1ED0];
  }
  else
  {
    uint64_t v4 = sub_100012C68();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InCallService is already running...", v5, 2u);
    }
  }
}

void sub_1000209A8(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = sub_100012C68();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10006A44C(v2, v3);
    }
  }
}

id sub_10002126C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) dialVoicemail];
}

void sub_100021504(id a1)
{
  uint64_t v1 = +[UIDevice currentDevice];
  unint64_t v2 = (unint64_t)[v1 userInterfaceIdiom];

  if ((v2 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v3 = 1024.0;
  }
  else {
    double v3 = 480.0;
  }
  uint64_t v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;

  byte_1000BBF6C = v6 > v3;
}

void sub_1000216C0(id a1)
{
  id v1 = +[UIDevice currentDevice];
  qword_1000BBF78 = (uint64_t)[v1 _graphicsQuality];
}

void sub_100023160(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 setNeedsLayout];
}

void sub_100023854(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:29 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  id v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  id v3 = (void *)qword_1000BBF88;
  qword_1000BBF88 = v2;
}

void sub_100023950(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:29 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  id v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  id v3 = (void *)qword_1000BBF90;
  qword_1000BBF90 = v2;
}

void sub_100023A4C(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:37 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  id v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  id v3 = (void *)qword_1000BBF98;
  qword_1000BBF98 = v2;
}

void sub_100023B48(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:36 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  id v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  id v3 = (void *)qword_1000BBFA0;
  qword_1000BBFA0 = v2;
}

void sub_1000259B4(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    IOHIDEventSystemClientUnscheduleFromDispatchQueue();
    uint64_t v2 = *(const void **)(a1 + 40);
    CFRelease(v2);
  }
}

id sub_100025A8C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) HIDEventSystemClient];
  if (!result)
  {
    id result = (id)IOHIDEventSystemClientCreate();
    if (result)
    {
      id v3 = result;
      v5[0] = @"DeviceUsagePage";
      v5[1] = @"DeviceUsage";
      v6[0] = &off_1000A5F10;
      v6[1] = &off_1000A5F28;
      +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
      IOHIDEventSystemClientSetMatching();
      IOHIDEventSystemClientRegisterEventBlock();
      id v4 = [*(id *)(a1 + 32) dispatchQueue];
      IOHIDEventSystemClientScheduleWithDispatchQueue();

      return [*(id *)(a1 + 32) setHIDEventSystemClient:v3];
    }
  }
  return result;
}

void sub_100025B9C(id a1, void *a2, void *a3, void *a4, __IOHIDEvent *a5)
{
  if (a2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = a2;
      BOOL v8 = IOHIDEventGetType() == 3;
      uint64_t v9 = v10;
      if (v8)
      {
        [v10 handleKeyboardEvent:a5];
        uint64_t v9 = v10;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
}

id sub_100025CC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHIDEventSystemClient:0];
}

void sub_1000274A8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nameAndLabelLabel];
  [v1 setAlpha:1.0];
}

void sub_1000274F0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nameAndLabelLabel];
  [v1 setAlpha:0.0];
}

void sub_100027538(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) nameAndLabelLabel];
  [v2 setAttributedText:v1];
}

id sub_100027654(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    unsigned int v2 = [v1 characterAtIndex:0];
    if (v2 == 59 || v2 == 44)
    {
      uint64_t v3 = [v1 substringFromIndex:1];

      id v1 = (id)v3;
    }
  }
  id v4 = TUNetworkCountryCode();

  if (v4)
  {
    uint64_t v5 = TUNetworkCountryCode();
    double v6 = UIFormattedPhoneNumberFromStringWithCountry();
  }
  else
  {
    double v6 = UIFormattedPhoneNumberFromString();
  }

  return v6;
}

uint64_t sub_100027724(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)CUTWeakLinkClass() sharedInstance];
  id v5 = objc_alloc_init((Class)RadiosPreferences);
  unsigned int v6 = [v5 airplaneMode];

  if (!v6)
  {
    uint64_t v10 = 1;
    goto LABEL_21;
  }
  if (v3)
  {
    id v7 = +[TUCallCapabilities senderIdentityCapabilitiesWithUUID:v3];
    BOOL v8 = v7;
    if (a1 == 1) {
      unsigned __int8 v9 = [v7 canAttemptEmergencyCallsWithoutCellularConnection];
    }
    else {
      unsigned __int8 v9 = [v7 canAttemptTelephonyCallsWithoutCellularConnection];
    }
    unsigned __int8 v11 = v9;

    if (v11)
    {
LABEL_11:
      uint64_t v10 = 1;
      if ([v4 networkReachable]) {
        goto LABEL_21;
      }
      goto LABEL_12;
    }
  }
  else if (a1 == 1)
  {
    if (+[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnection])goto LABEL_11; {
  }
    }
  else if (+[TUCallCapabilities canAttemptTelephonyCallsWithoutCellularConnection])
  {
    goto LABEL_11;
  }
  LODWORD(v10) = 0;
LABEL_12:
  uint64_t v12 = sub_100012C68();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      CFStringRef v13 = @"NO";
    }
    else {
      CFStringRef v13 = @"YES";
    }
    if ([v4 networkReachable]) {
      CFStringRef v14 = @"NO";
    }
    else {
      CFStringRef v14 = @"YES";
    }
    int v16 = 138412546;
    CFStringRef v17 = v13;
    __int16 v18 = 2112;
    CFStringRef v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Aborting telephony call, the device is in airplane mode and, cannot make telephony calls while in airplane mode (%@) or is not connected to an active Wi-Fi network (%@).", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v10 = 0;
LABEL_21:

  return v10;
}

id sub_1000278E0()
{
  id v0 = objc_alloc_init((Class)RadiosPreferences);
  id v1 = [v0 airplaneMode];

  return v1;
}

void sub_100027DFC(uint64_t a1)
{
  unsigned int v2 = +[NSNotificationCenter defaultCenter];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027EAC;
  v4[3] = &unk_1000A2090;
  void v4[4] = *(void *)(a1 + 32);
  id v3 = [v2 addObserverForName:TUCallCapabilitiesThumperCallingChangedNotification object:0 queue:0 usingBlock:v4];
}

id sub_100027EAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeHasShownPromptDefaultIfNecessary];
}

void sub_100027EB4(id a1, IMUserNotification *a2)
{
  id v2 = [(IMUserNotification *)a2 response];
  id v3 = sub_100012C68();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User tapped Not Now on the Thumper Available Alert in FaceTime", v5, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User tapped Turn On on the Thumper Available Alert in FaceTime", buf, 2u);
    }

    +[TUCallCapabilities requestPinFromPrimaryDevice];
  }
}

uint64_t sub_10002800C(uint64_t a1)
{
  qword_1000BBFE0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100029568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) _accessibilityHigherContrastTintColorForColor:a2];
  BOOL v8 = *(void **)(a1 + 40);
  NSAttributedStringKey v10 = NSForegroundColorAttributeName;
  unsigned __int8 v11 = v7;
  unsigned __int8 v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v8 setAttributes:v9 range:a3, a4];
}

void sub_10002A2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002A320(id a1)
{
  uint64_t v1 = +[NSHashTable weakObjectsHashTable];
  id v2 = (void *)qword_1000BC000;
  qword_1000BC000 = v1;

  qword_1000BC008 = +[NSMapTable weakToStrongObjectsMapTable];

  _objc_release_x1();
}

uint64_t sub_10002A380(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002A390(uint64_t a1)
{
}

void sub_10002A398(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (!a2 || v5)
  {
    NSAttributedStringKey v10 = sub_100012C68();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006A5D4();
    }
  }
  else
  {
    uint64_t v7 = [a2 firstObject];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned __int8 v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10002A4D0(uint64_t a1)
{
  qword_1000BC018 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10002A664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002A6D0(id a1)
{
  qword_1000BC028 = (uint64_t)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];

  _objc_release_x1();
}

void sub_10002AD68(id a1)
{
  id v5 = objc_alloc_init((Class)TUCallProviderManager);
  uint64_t v1 = [v5 telephonyProvider];
  id v2 = [v1 identifier];
  uint64_t v3 = [v5 providerWithIdentifier:v2];
  BOOL v4 = (void *)qword_1000BC040;
  qword_1000BC040 = v3;
}

void sub_10002AE44(id a1)
{
  qword_1000BC048 = (uint64_t)objc_alloc_init((Class)FBSOrientationObserver);

  _objc_release_x1();
}

void sub_10002B39C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isSpringBoardLocked];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setSpringBoardLocked:v3 != 0];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"PHLockScreenStatusChangedNotification" object:*(void *)(a1 + 32)];
  }
}

void *sub_10002B430(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000BC060)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_10002B558;
    void v4[4] = &unk_1000A20B0;
    void v4[5] = v4;
    long long v5 = off_1000A2208;
    uint64_t v6 = 0;
    qword_1000BC060 = _sl_dlopen();
  }
  unsigned int v2 = (void *)qword_1000BC060;
  if (!qword_1000BC060) {
    sub_10006A854(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  id result = dlsym(v2, "SBSGetScreenLockStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000BC058 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10002B558()
{
  uint64_t result = _sl_dlopen();
  qword_1000BC060 = result;
  return result;
}

void sub_10002B5CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10002F07C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) registrationDelegate];
  [v2 registrationViewSignInPhoneAccount:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setSigningIn:1];
  [*(id *)(a1 + 32) setActivationFailed:0];
  int v3 = *(void **)(a1 + 32);

  return _[v3 _setContinueButtonTouched:0];
}

void sub_10002F0E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    long long v5 = sub_100012C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006A990((uint64_t)v4, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100030AE8(uint64_t a1)
{
  from = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  BOOL v2 = v1 == 0;

  if (v2)
  {
    uint64_t v6 = sub_100012C68();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because MPRecentsContactHeaderViewController was deallocated before starting", buf, 2u);
    }
  }
  else
  {
    CFStringRef v17 = +[NSMutableDictionary dictionary];
    id v3 = objc_loadWeakRetained(&to);
    id v4 = [v3 recentCall];
    long long v5 = [v4 callOccurrences];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      uint64_t v9 = kCHCallOccurrenceUniqueIdKey;
      do
      {
        NSAttributedStringKey v10 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v11 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v10) objectForKeyedSubscript:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            CFStringRef v13 = [*(id *)(a1 + 40) sharedUtilityProvider];
            CFStringRef v14 = [v13 conversationForCallUID:v12];

            if (v14) {
              [v17 setObject:v14 forKeyedSubscript:v12];
            }
          }
          NSAttributedStringKey v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030DE0;
    block[3] = &unk_1000A2250;
    objc_copyWeak(&v21, from);
    id v20 = v17;
    id v15 = v17;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v21);
  }

  objc_destroyWeak(&to);
}

void sub_100030DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_100030DE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setRttConversations:*(void *)(a1 + 32)];
    id v4 = sub_100012C68();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully finished loadRTTConversations", buf, 2u);
    }

    long long v5 = sub_100012C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading conversation list", v8, 2u);
    }

    uint64_t v6 = [v3 detailsView];
    [v6 reloadCallOccurences];
  }
  else
  {
    uint64_t v6 = sub_100012C68();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because MPRecentsContactHeaderViewController was deallocated when trying to write rttConversations", v7, 2u);
    }
  }
}

void sub_1000311CC(id a1)
{
  id v1 = +[CADisplay mainDisplay];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  if (v3 >= v5) {
    double v6 = v3;
  }
  else {
    double v6 = v5;
  }
  int v7 = (int)v6;
  uint64_t v8 = MGGetProductType();
  if (v7 == 1136) {
    goto LABEL_5;
  }
  if (v8 <= 2795618602)
  {
    if (v8 > 851437780)
    {
      if (v8 <= 2688879998)
      {
        if (v8 != 851437781)
        {
          if (v8 != 1169082144) {
            goto LABEL_23;
          }
          goto LABEL_42;
        }
LABEL_32:
        BOOL v11 = v7 == 2556;
        goto LABEL_45;
      }
      if (v8 != 2688879999)
      {
        if (v8 != 2793418701) {
          goto LABEL_23;
        }
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v8 == 133314240) {
      goto LABEL_32;
    }
    if (v8 != 330877086)
    {
      uint64_t v10 = 574536383;
LABEL_22:
      if (v8 != v10) {
        goto LABEL_23;
      }
LABEL_33:
      BOOL v12 = v7 == 2796;
      goto LABEL_34;
    }
    BOOL v12 = v7 == 2868;
LABEL_34:
    uint64_t v9 = 14;
    if (!v12) {
      uint64_t v9 = 15;
    }
    goto LABEL_47;
  }
  if (v8 <= 3001488777)
  {
    if (v8 == 2795618603)
    {
      BOOL v11 = v7 == 2622;
LABEL_45:
      uint64_t v9 = 9;
      if (v11) {
        uint64_t v9 = 12;
      }
      goto LABEL_47;
    }
    if (v8 == 2940697645) {
      goto LABEL_32;
    }
    uint64_t v10 = 2941181571;
    goto LABEL_22;
  }
  if (v8 <= 3885279869)
  {
    if (v8 == 3001488778)
    {
LABEL_42:
      BOOL v11 = v7 == 2532;
      goto LABEL_45;
    }
    uint64_t v10 = 3825599860;
    goto LABEL_22;
  }
  if (v8 == 4201643249)
  {
    BOOL v12 = v7 == 2778;
    goto LABEL_34;
  }
  if (v8 == 3885279870)
  {
    uint64_t v9 = 9;
    if (v7 == 2436) {
      uint64_t v9 = 10;
    }
    goto LABEL_47;
  }
LABEL_23:
  if (v7 > 2271)
  {
    if (v7 > 2531)
    {
      if (v7 > 2731)
      {
        if (v7 == 2732 || v7 == 2752)
        {
          uint64_t v9 = 7;
          goto LABEL_47;
        }
        if (v7 == 2778)
        {
          uint64_t v9 = 14;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v7 == 2532)
      {
        uint64_t v9 = 12;
        goto LABEL_47;
      }
      if (v7 != 2688) {
        goto LABEL_48;
      }
LABEL_74:
      uint64_t v9 = 5;
      goto LABEL_47;
    }
    if (v7 > 2387)
    {
      if (v7 != 2388)
      {
        if (v7 != 2436) {
          goto LABEL_48;
        }
        goto LABEL_77;
      }
    }
    else
    {
      if (v7 == 2272)
      {
LABEL_5:
        uint64_t v9 = 0;
LABEL_47:
        qword_1000BC068 = v9;
        goto LABEL_48;
      }
      if (v7 != 2360) {
        goto LABEL_48;
      }
    }
    uint64_t v9 = 8;
    goto LABEL_47;
  }
  uint64_t v9 = 2;
  if (v7 > 2000)
  {
    if (v7 > 2078)
    {
      switch(v7)
      {
        case 2079:
          uint64_t v9 = 9;
          break;
        case 2208:
          uint64_t v9 = 6;
          break;
        case 2224:
          uint64_t v9 = 3;
          break;
        default:
          goto LABEL_48;
      }
      goto LABEL_47;
    }
    if (v7 != 2001)
    {
      if (v7 == 2048) {
        goto LABEL_47;
      }
      goto LABEL_48;
    }
LABEL_79:
    uint64_t v9 = 1;
    goto LABEL_47;
  }
  if (v7 > 1623)
  {
    if (v7 != 1624)
    {
      if (v7 != 1792) {
        goto LABEL_48;
      }
      goto LABEL_74;
    }
LABEL_77:
    uint64_t v9 = 4;
    goto LABEL_47;
  }
  if (v7 == 1024) {
    goto LABEL_47;
  }
  if (v7 == 1334) {
    goto LABEL_79;
  }
LABEL_48:
  CFStringRef v13 = sub_100012C68();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    uint64_t v15 = qword_1000BC068;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Determined screen size to be %ld for screenHeight: %d", (uint8_t *)&v14, 0x12u);
  }
}

char *sub_100031610(uint64_t a1)
{
  uint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 0xE) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = qword_10007D680[(void)(result - 1)];
  }
  qword_1000BA040 = v2;
  return result;
}

unint64_t sub_1000316E4(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xE) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_10007D6F8[result];
  }
  qword_1000BC080 = v2;
  return result;
}

unint64_t sub_1000317B4(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xF) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_10007D770[result];
  }
  qword_1000BC090 = v2;
  return result;
}

char *sub_100031884(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 7) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_10007D7F0[(void)(result - 1)];
  }
  qword_1000BC0A0 = v2;
  return result;
}

id sub_100031964(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  byte_1000BC0B0 = result == 0;
  return result;
}

char *sub_100031A20(uint64_t a1)
{
  id result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 5) > 9) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = qword_10007D830[(void)(result - 5)];
  }
  qword_1000BA048 = v2;
  return result;
}

unint64_t sub_100031B00(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  byte_1000BC0C8 = (result < 0xF) & (0x5060u >> result);
  return result;
}

unint64_t sub_100031BD4(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  byte_1000BC0D8 = (result < 0xF) & (0x5060u >> result);
  return result;
}

unint64_t sub_100031EE0(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xE) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_10007D8B0[result];
  }
  qword_1000BC0E8 = v2;
  return result;
}

char *sub_100031FB0(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 0xE) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = qword_10007D928[(void)(result - 1)];
  }
  qword_1000BA050 = v2;
  return result;
}

unint64_t sub_100032084(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldUseExplicitLayoutDimensions])
  {
    unint64_t result = (unint64_t)[*(id *)(a1 + 32) yOffsetForDialerLCDViewForDxDevices];
  }
  else
  {
    unint64_t result = +[PHUIConfiguration screenSize];
    if (result > 7) {
      uint64_t v3 = 0x4061000000000000;
    }
    else {
      uint64_t v3 = qword_10007D9A0[result];
    }
  }
  qword_1000BC100 = v3;
  return result;
}

double sub_1000321BC(uint64_t a1)
{
  [*(id *)(a1 + 32) yOffsetForDialerLCDView];
  double v3 = v2;
  [*(id *)(a1 + 32) yParticipantsViewAdjustmentForKeypad];
  double result = v3 + v4;
  qword_1000BC110 = *(void *)&result;
  return result;
}

void sub_100032248(id a1)
{
  if (!+[PHUIConfiguration screenSize]) {
    qword_1000BC120 = 0x4046800000000000;
  }
}

id sub_100032358(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  uint64_t v2 = 1;
  if (result == (id)7) {
    uint64_t v2 = 2;
  }
  if (result == (id)6) {
    uint64_t v2 = 0;
  }
  qword_1000BC130 = v2;
  return result;
}

unint64_t sub_100032420(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 8) {
    uint64_t v2 = 0x4055900000000000;
  }
  else {
    uint64_t v2 = qword_10007DA10[result];
  }
  qword_1000BA058 = v2;
  return result;
}

char *sub_1000324F4(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  double v2 = 13.0;
  if ((unint64_t)(result - 4) <= 0xA) {
    double v2 = dbl_10007DA58[(void)(result - 4)];
  }
  qword_1000BA060 = *(void *)&v2;
  return result;
}

id sub_1000325C4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  BOOL v2 = result == (id)9 || result == (id)4;
  double v3 = 0.0;
  if (v2) {
    double v3 = 2.5;
  }
  qword_1000BC150 = *(void *)&v3;
  return result;
}

id sub_10003268C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  double v2 = 4.0;
  if (result == (id)4) {
    double v2 = 17.0;
  }
  qword_1000BC160 = *(void *)&v2;
  return result;
}

char *sub_100032754(uint64_t a1)
{
  id result = (char *)[*(id *)(a1 + 32) screenSize];
  double v2 = 1.0;
  if ((unint64_t)(result - 1) <= 0xE) {
    double v2 = dbl_10007DAB0[(void)(result - 1)];
  }
  qword_1000BA068 = *(void *)&v2;
  return result;
}

unint64_t sub_100032860(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  byte_1000BC178 = (result < 9) & (0x18Cu >> result);
  return result;
}

id sub_100032934(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  byte_1000BC188 = result == (id)7;
  return result;
}

id sub_1000329FC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  byte_1000BC198 = result == (id)6;
  return result;
}

id sub_100032AB8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  byte_1000BC1A8 = result == 0;
  return result;
}

void sub_100032B54(id a1)
{
  unint64_t v1 = +[PHUIConfiguration inCallControlSpacing];
  if (v1 <= 6) {
    byte_1000BC1B8 = (7u >> v1) & 1;
  }
}

void sub_100032DE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = sub_100012C68();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_1000BC1E8 != -1) {
        dispatch_once(&qword_1000BC1E8, &stru_1000A24B0);
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = qword_1000BC1F0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling %s by fetching metadata for recent calls", buf, 0xCu);
    }

    double v4 = [*(id *)(a1 + 32) recentCalls];
    if ([v4 count])
    {
      double v5 = [*(id *)(a1 + 32) serialQueue];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      void v6[2] = sub_100032F7C;
      v6[3] = &unk_1000A1E18;
      id v7 = *(id *)(a1 + 32);
      id v8 = v4;
      dispatch_async(v5, v6);
    }
  }
}

id sub_100032F7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchMetadataForRecentCalls:*(void *)(a1 + 40)];
}

uint64_t sub_10003304C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003305C(uint64_t a1)
{
}

uint64_t sub_1000330A0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) contactForHandle:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_100033244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003325C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) callHistoryController];
  id v3 = [v2 coalescingStrategy];

  if (v3 == (id)2)
  {
    double v4 = (id *)&kCHCoalescingStrategyCollapseIfEqual;
  }
  else
  {
    if (v3 != (id)1) {
      return;
    }
    double v4 = (id *)&kCHCoalescingStrategyRecents;
  }
  id v5 = *v4;
  if (v5)
  {
    id v9 = v5;
    uint64_t v6 = [*(id *)(a1 + 40) coalescedCallWithCall:*(void *)(a1 + 48) usingStrategy:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void sub_1000333B4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 deleteAllRecentCalls];
}

void sub_1000334AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryController];
  [v2 deleteRecentCalls:*(void *)(a1 + 40)];
}

void sub_100033588(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 markRecentAudioCallsAsRead];
}

void sub_100033788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000337A0(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) contactsByHandleForRecentCall:*(void *)(a1 + 40) keyDescriptors:*(void *)(a1 + 48)];
  id v2 = [v7 allValues];
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100033948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100033960(uint64_t a1)
{
  id v2 = sub_100012C68();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to create a dial request for recent call %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) callProviderManager];
  uint64_t v5 = [v4 dialRequestForRecentCall:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = [*(id *)(a1 + 32) validRemoteParticipantHandles];
    id v9 = [v8 anyObject];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 40) contactForHandle:v9];
      BOOL v11 = [v10 identifier];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setContactIdentifier:v11];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOriginatingUIType:8];
  }
  else
  {
    id v9 = sub_100012C68();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006AA4C((uint64_t *)(a1 + 32), v9);
    }
  }
}

void sub_100033C3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_100012C68();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006AAC8(a1, (uint64_t)v3, v4);
    }
  }
}

id sub_1000344F4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didUpdateCalls:*(void *)(a1 + 48)];
}

id sub_100034504(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeCalls:*(void *)(*(void *)(a1 + 48) + 112)];
}

id sub_100034518(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didCompleteFetchingCalls:*(void *)(a1 + 48)];
}

id sub_1000346E0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeUnreadCallCount:*(void *)(a1 + 48)];
}

id sub_1000348A4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsControllerDidChangeMessages:*(void *)(a1 + 40)];
}

void sub_100034FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100034FE8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = +[CNContactViewController descriptorForRequiredKeys];
  id v9 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  uint64_t v6 = [v2 fetchUnifiedContactForID:v3 withDescriptors:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_10003536C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featureFlags];
  unsigned int v3 = [v2 phoneRecentsAvatarsEnabled];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) serialQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100035438;
    v7[3] = &unk_1000A1E18;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(v4, v7);
  }
}

void sub_100035438(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v8 = [v7 uniqueId];
          uint64_t v9 = [*(id *)(a1 + 40) itemCache];
          uint64_t v10 = [v9 objectForKeyedSubscript:v8];
          id v11 = [v10 mutableCopy];

          if (v11)
          {
            int v12 = [*(id *)(a1 + 40) localizedSubtitleForRecentCall:v7];
            [v11 setLocalizedSubtitle:v12];

            id v13 = [v11 copy];
            int v14 = [*(id *)(a1 + 40) itemCache];
            [v14 setObject:v13 forKeyedSubscript:v8];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v4);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
    [*(id *)(a1 + 40) notifyDelegatesRecentsController:*(void *)(a1 + 40) didUpdateCalls:*(void *)(a1 + 32)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
  }
}

void sub_100035994(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) recentCalls];
  if ([v6 count])
  {
    id v2 = [*(id *)(a1 + 32) contactCache];
    [v2 removeAllObjects];

    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 recentCalls];
    [v3 fetchContactsForRecentCalls:v4];

    uint64_t v5 = [*(id *)(a1 + 32) itemCache];
    [v5 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v6];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

id sub_100035BE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecentCalls];
}

void sub_100035D50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchContactFormatter];
  [*(id *)(a1 + 32) setContactFormatter:v2];

  id v3 = [*(id *)(a1 + 32) fetchNumberFormatter];
  [*(id *)(a1 + 32) setNumberFormatter:v3];

  id v8 = [*(id *)(a1 + 32) recentCalls];
  if ([v8 count])
  {
    id v4 = [*(id *)(a1 + 32) itemCache];
    [v4 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v8];
    uint64_t v5 = [*(id *)(a1 + 32) featureFlags];
    unsigned int v6 = [v5 phoneRecentsAvatarsEnabled];

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    uint64_t v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 notifyDelegatesRecentsController:v7 didUpdateCalls:v8];
    }
    else {
      [v7 notifyDelegatesRecentsController:v7 didChangeCalls:v8];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

void sub_100036154(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentCalls];
  if ([v2 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = v2;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v9 = [v8 uniqueId];
          uint64_t v10 = [*(id *)(a1 + 32) itemCache];
          id v11 = [v10 objectForKeyedSubscript:v9];
          id v12 = [v11 mutableCopy];

          if (v12)
          {
            id v13 = [*(id *)(a1 + 32) localizedSubtitleForRecentCall:v8];
            [v12 setLocalizedSubtitle:v13];

            id v14 = [v12 copy];
            long long v15 = [*(id *)(a1 + 32) itemCache];
            [v15 setObject:v14 forKeyedSubscript:v9];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    id v2 = v16;
  }
}

void sub_1000364A0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recentCalls];
  if ([v3 count])
  {
    id v2 = [*(id *)(a1 + 32) itemCache];
    [v2 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v3];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

void sub_100036AEC(uint64_t a1)
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"UNKNOWN_LABEL" value:&stru_1000A3488 table:@"PHRecents"];
  id v4 = (void *)qword_1000BC1D8;
  qword_1000BC1D8 = v3;

  id v5 = [*(id *)(a1 + 32) featureFlags];
  LODWORD(v2) = [v5 callHistorySearchEnabled];

  if (v2)
  {
    TUBundle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v8 localizedStringForKey:@"UNKNOWN_LABEL" value:&stru_1000A3488 table:@"TelephonyUtilities"];
    uint64_t v7 = (void *)qword_1000BC1D8;
    qword_1000BC1D8 = v6;
  }
}

id sub_100036FCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_10003766C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:*(void *)(a1 + 40)];
}

void sub_100037820(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) localVideoView];
  [v1 setAlpha:1.0];
}

id sub_1000386EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 handle];
  id v8 = [v7 value];

  if ([v8 length])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v6 UUID];
    LODWORD(v9) = [v9 isEmergencyNumberForDigits:v8 senderIdentityUUID:v10];

    if (v9) {
      [v5 setDialType:1];
    }
  }
  if ([v5 dialType] == (id)1
    && [*(id *)(a1 + 40) canMakeEmergencyCallForSenderIdentity:v6])
  {
    id v11 = v6;
    id v12 = sub_100012C68();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating emergency dial request %@ to use sender identity %@", (uint8_t *)&v16, 0x16u);
    }

    id v13 = [v11 UUID];
    [v5 setLocalSenderIdentityUUID:v13];

    id v14 = [v11 accountUUID];
    [v5 setLocalSenderIdentityAccountUUID:v14];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void sub_1000396A0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) tableViewModel];
  id v2 = [*(id *)(a1 + 32) unknownContacts];
  [v3 blockContacts:v2];
}

void sub_1000398EC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) tableViewModel];
  id v2 = [*(id *)(a1 + 32) unknownContacts];
  [v3 blockContacts:v2];
}

void sub_100039C90(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 80);
  id v2 = [v1 recentCall];
  [v1 reportWithRecentCall:v2];
}

void sub_10003A19C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 setNeedsLayout];
}

void sub_10003A340(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  uint64_t v4 = *(void *)(a1 + 40);
  id v3 = +[NSArray arrayWithObjects:&v4 count:1];
  [v2 reconfigureRowsAtIndexPaths:v3];
}

uint64_t sub_10003A834(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = qword_1000BC208;
  qword_1000BC208 = (uint64_t)v1;

  return _objc_release_x1(v1, v2);
}

uint64_t sub_10003A8A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003A8B8(uint64_t a1)
{
}

uint64_t sub_10003A8C0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

uint64_t sub_10003AA10(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

uint64_t sub_10003AA64(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

uint64_t sub_10003AAB8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

void sub_10003B218(id a1, NSNotification *a2)
{
  uint64_t v2 = (void *)qword_1000BC228;
  qword_1000BC228 = 0;

  id v3 = (void *)qword_1000BC230;
  qword_1000BC230 = 0;

  uint64_t v4 = (void *)qword_1000BC240;
  qword_1000BC240 = 0;

  id v5 = (void *)qword_1000BC238;
  qword_1000BC238 = 0;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000A2620);
}

void sub_10003B28C(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"PHRecentCallDetailsViewFormattersDidChangeNotification" object:0];
}

void sub_10003D254(id *a1)
{
  uint64_t v2 = a1 + 5;
  objc_copyWeak(&to, a1 + 5);
  id v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    uint64_t v4 = [a1[6] sharedUtilityProvider];
    id v5 = [a1[4] UUIDString];
    id v6 = [v4 conversationForCallUID:v5];

    if (v6)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D3EC;
      block[3] = &unk_1000A2648;
      objc_copyWeak(&v10, v2);
      id v6 = v6;
      id v8 = v6;
      id v9 = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v10);
    }
  }
  else
  {
    id v6 = sub_100012C68();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated before starting", buf, 2u);
    }
  }

  objc_destroyWeak(&to);
}

void sub_10003D3D4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10003D3EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setConversation:*(void *)(a1 + 32)];
    uint64_t v4 = sub_100012C68();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully finished fetchRTTConversationForCallUUID", v8, 2u);
    }

    id v5 = +[NSNotificationCenter defaultCenter];
    CFStringRef v9 = @"MPVoicemailRTTTranscriptDidLoadCallIDKey";
    id v6 = [*(id *)(a1 + 40) UUIDString];
    id v10 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"MPVoicemailRTTTranscriptDidLoadNotification" object:0 userInfo:v7];
  }
  else
  {
    id v5 = sub_100012C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated when trying to write conversation", v8, 2u);
    }
  }
}

__CFString *sub_10003D7B4(char a1, unint64_t a2)
{
  uint64_t v2 = (__CFString *)a2;
  if (a2 >= 0x7FFFFFFF)
  {
    uint64_t v4 = sub_100012C68();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v12 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Found unexpected badge count (%llu). Defaulting to zero.", buf, 0xCu);
    }

    if (a1)
    {
      uint64_t v2 = 0;
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v2 = @" ";
    goto LABEL_12;
  }
  if ((a1 & 1) == 0)
  {
    if (a2)
    {
      id v5 = [(id)objc_opt_class() sharedNumberFormatter];
      id v6 = +[NSNumber numberWithUnsignedLongLong:v2];
      uint64_t v7 = [v5 stringFromNumber:v6];

      uint64_t v2 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@+", v7];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (a2)
  {
    id v8 = [(id)objc_opt_class() sharedNumberFormatter];
    CFStringRef v9 = +[NSNumber numberWithUnsignedLongLong:v2];
    uint64_t v2 = [v8 stringFromNumber:v9];
  }
LABEL_12:

  return v2;
}

void sub_10003D970(void *a1, void *a2)
{
}

void sub_10003D978(void *a1, void *a2, void *a3)
{
  key = a1;
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = +[NSBundle mainBundle];
    id v6 = [v7 bundleIdentifier];
  }
  if ([(__CFString *)key length] && [(__CFString *)v6 length])
  {
    CFPreferencesSetValue(key, v5, v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
}

id sub_10003EE54(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003EED8;
  v2[3] = &unk_1000A1D50;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.150000006];
}

void sub_10003EED8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contactLabel];
  [v1 setAlpha:1.0];
}

void sub_10003EF20(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addContactButton];
  [v1 setAlpha:0.0];
}

id sub_10003EF68(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003EFEC;
  v2[3] = &unk_1000A1D50;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.150000006];
}

void sub_10003EFEC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addContactButton];
  [v1 setAlpha:1.0];
}

void sub_10003F034(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contactLabel];
  [v1 setAlpha:0.0];
}

void sub_10003F07C(uint64_t a1)
{
  double v2 = 0.0;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(void *)(a1 + 40)) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  uint64_t v4 = [*(id *)(a1 + 32) contactLabel];
  [v4 setAlpha:v3];

  if (*(unsigned char *)(a1 + 48))
  {
    if (*(void *)(a1 + 40)) {
      double v2 = 0.0;
    }
    else {
      double v2 = 1.0;
    }
  }
  id v5 = [*(id *)(a1 + 32) addContactButton];
  [v5 setAlpha:v2];

  id v6 = [*(id *)(a1 + 32) delegate];
  id v8 = v6;
  double v7 = 1.0;
  if (!*(unsigned char *)(a1 + 49)) {
    double v7 = 0.0;
  }
  [v6 setDeleteButtonAlpha:v7];
}

void sub_100040E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100040E28(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:1];
}

uint64_t sub_100040E70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100040E80(uint64_t a1)
{
}

id sub_100040E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _handleRegistrarCompletion:a2 errorAlertController:a3];
}

void sub_1000412FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100041314(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setSigningIn:0];

  double v3 = [*(id *)(a1 + 32) completionBlock];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) completionBlock];
    v4[2](v4, 0);
  }
}

void sub_1000413B4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:1];
}

id sub_1000413FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _handleRegistrarCompletion:a2 errorAlertController:a3];
}

void sub_10004140C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:0];
}

void sub_1000415C0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:0];
}

void sub_1000418FC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = +[IMAccountController sharedInstance];
    [v6 activateAccount:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) registerAccount];
  }
  else
  {
    double v7 = sub_100012C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Registration enable failed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_100042180(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setSigningIn:0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 setActivationFailed:1];
}

void sub_1000422DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100043658(uint64_t a1, int a2)
{
  if (a2 && !*(unsigned char *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) contentUnavailableView];
    id v3 = [*(id *)(a1 + 32) tableView];
    [v4 setHidden:1];
    [v3 setBackgroundView:0];
    [v3 setSeparatorStyle:1];
  }
}

void sub_1000436F8(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) contentUnavailableView];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) tableView];
    [v4 setHidden:0];
    [v4 setAlpha:1.0];
    [v3 setBackgroundView:v4];
    [v3 setSeparatorStyle:0];
  }
  else
  {
    [v4 setAlpha:0.0];
  }
}

uint64_t sub_100043FB8(uint64_t a1)
{
  [*(id *)(a1 + 32) setReloadingData:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_100045058(id a1)
{
  v4[0] = @"group-facetime-participant-join";
  v4[1] = @"group-facetime-moments-request";
  v4[2] = @"group-facetime-let-me-in-request-pre-conversation";
  id v1 = +[NSArray arrayWithObjects:v4 count:3];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_1000BC268;
  qword_1000BC268 = v2;
}

void sub_100045264(id a1, NSNotification *a2)
{
  uint64_t v2 = (void *)qword_1000BC288;
  qword_1000BC288 = 0;

  id v3 = (void *)qword_1000BC290;
  qword_1000BC290 = 0;

  id v4 = (void *)qword_1000BC298;
  qword_1000BC298 = 0;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000A27E0);
}

void sub_1000452C8(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"PHRecentHeaderViewFormattersDidChangeNotification" object:0];
}

id sub_1000467A8(double a1)
{
  if (a1 < 0.0)
  {
    uint64_t v2 = +[NSString stringWithFormat:@"Negative time interval passed into PHRecentsPersonHeaderViewStringForTimeInterval"];
    NSLog(@"** TUCAssertion failure: %@", v2);

    if (_TUAssertShouldCrashApplication())
    {
      id v3 = +[NSAssertionHandler currentHandler];
      id v4 = +[NSString stringWithUTF8String:"NSString *PHRecentsPersonHeaderViewStringForTimeInterval(NSTimeInterval)"];
      [v3 handleFailureInFunction:v4 file:@"PHRecentsHeaderView.m" lineNumber:347 description:@"Negative time interval passed into PHRecentsPersonHeaderViewStringForTimeInterval"];
    }
  }
  unsigned int v5 = (int)a1 & ~((int)a1 >> 31);
  id v6 = [(id)objc_opt_class() sharedNumberFormatter];
  if (v5 > 0x3B)
  {
    if (v5 > 0xE0F)
    {
      if (v5 % 0xE10 > 0x3B)
      {
        signed int v15 = v5 % 0xE10;
        double v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
        int v8 = [v6 stringFromNumber:v7];
        int v16 = +[NSBundle mainBundle];
        id v10 = v16;
        if (v5 - 7200 >= 0xFFFFF1F0) {
          CFStringRef v17 = @"HOUR_UNIT";
        }
        else {
          CFStringRef v17 = @"HOUR_UNIT_PLURAL";
        }
        id v12 = [v16 localizedStringForKey:v17 value:&stru_1000A3488 table:@"Recents"];
        __int16 v18 = +[NSNumber numberWithInt:(v15 / 60)];
        id v19 = [v6 stringFromNumber:v18];
        unsigned int v20 = v15 - 120;
        id v21 = +[NSBundle mainBundle];
        long long v22 = v21;
        if (v20 >= 0xFFFFFFC4) {
          CFStringRef v23 = @"MINUTE_UNIT";
        }
        else {
          CFStringRef v23 = @"MINUTE_UNIT_PLURAL";
        }
        long long v24 = [v21 localizedStringForKey:v23 value:&stru_1000A3488 table:@"Recents"];
        id v13 = +[NSString stringWithFormat:@"%@ %@ %@ %@", v8, v12, v19, v24];

        goto LABEL_17;
      }
      double v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      int v8 = [v6 stringFromNumber:v7];
      uint64_t v9 = +[NSBundle mainBundle];
      id v10 = v9;
      if (v5 - 7200 >= 0xFFFFF1F0) {
        CFStringRef v11 = @"HOUR_UNIT";
      }
      else {
        CFStringRef v11 = @"HOUR_UNIT_PLURAL";
      }
    }
    else
    {
      double v7 = +[NSNumber numberWithInt:(unsigned __int16)((int)a1 & ~(unsigned __int16)((int)a1 >> 31)) / 0x3Cu];
      int v8 = [v6 stringFromNumber:v7];
      uint64_t v9 = +[NSBundle mainBundle];
      id v10 = v9;
      if (v5 <= 0x77) {
        CFStringRef v11 = @"MINUTE_UNIT";
      }
      else {
        CFStringRef v11 = @"MINUTE_UNIT_PLURAL";
      }
    }
  }
  else
  {
    double v7 = +[NSNumber numberWithInt:(int)a1 & ~((int)a1 >> 31)];
    int v8 = [v6 stringFromNumber:v7];
    uint64_t v9 = +[NSBundle mainBundle];
    id v10 = v9;
    if (v5 == 1) {
      CFStringRef v11 = @"SECOND_UNIT";
    }
    else {
      CFStringRef v11 = @"SECOND_UNIT_PLURAL";
    }
  }
  id v12 = [v9 localizedStringForKey:v11 value:&stru_1000A3488 table:@"Recents"];
  id v13 = +[NSString stringWithFormat:@"%@ %@", v8, v12];
LABEL_17:

  return v13;
}

id sub_100046CF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureProperPositionForContentView];
}

id sub_100047008(uint64_t a1)
{
  return _[*(id *)(a1 + 32) updateVideoViewControllerWithOrientationMonitor:*(void *)(a1 + 40)];
}

void sub_100047394(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) contentView];
  unsigned int v5 = v4;
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  if (!CGAffineTransformIsIdentity(&v7)) {
    [v5 setHidden:1];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
}

id sub_10004742C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContentViewHiddenPosition];
}

id sub_100047644(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) viewDidAppear:*(unsigned __int8 *)(a1 + 40)];
}

id sub_100047660(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_10004782C(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);

  return [v2 viewDidDisappear:v3];
}

id sub_100047878(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_100047C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100047C78(uint64_t a1, char a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2)
  {
    [WeakRetained[10] showContent];
    if ([v4[2] isViewLoaded])
    {
      [v4[2] viewWillDisappear:1];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100047DDC;
      v8[3] = &unk_1000A1D50;
      v8[4] = v4;
      unsigned int v5 = objc_retainBlock(v8);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100047EC4;
      v7[3] = &unk_1000A2698;
      void v7[4] = v4;
      uint64_t v6 = objc_retainBlock(v7);
      +[UIView animateWithDuration:0 delay:v5 options:v6 animations:0.400000006 completion:0.0500000007];
    }
    else
    {
      [v4 _destroyFirstRunController];
    }
  }
  else
  {
    [WeakRetained _constrainRegistrationView];
  }
}

void sub_100047DDC(uint64_t a1)
{
  id v11 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  [v11 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  [*(id *)(*(void *)(a1 + 32) + 8) bounds];
  [v11 setFrame:v3, v8, v5, v7];
  if ([UIApp userInterfaceStyle] == 1)
  {
    uint64_t v9 = [*(id *)(a1 + 32) baseViewController];
    id v10 = [v9 view];
    [v10 setAlpha:1.0];
  }
}

id sub_100047EC4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) viewDidDisappear:1];
  double v2 = *(void **)(a1 + 32);

  return [v2 _destroyFirstRunController];
}

void sub_100049250(id a1)
{
  id v1 = sub_100012C68();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Finished test", v2, 2u);
  }
}

void sub_10004945C(uint64_t a1)
{
  double v2 = sub_100012C68();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32) + 1;
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished test %ld", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100049508(uint64_t a1)
{
  double v2 = sub_100012C68();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished test %ld", (uint8_t *)&v4, 0xCu);
  }
}

id sub_10004A144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addAttribute:NSForegroundColorAttributeName value:*(void *)(a1 + 40) range:a2];
}

uint64_t sub_10004B044(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a1;
  sub_10004C830(v6, a4);

  return swift_bridgeObjectRelease();
}

id sub_10004B0C8(void *a1)
{
  uint64_t v2 = v1;
  sub_1000175C8(0, (unint64_t *)&qword_1000BA8E8);
  id v4 = a1;
  uint64_t v5 = static OS_os_log.default.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    double v8 = (void *)swift_slowAlloc();
    *(_DWORD *)id v7 = 138412290;
    id v9 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *double v8 = v4;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "calling from contactsViewModel %@", v7, 0xCu);
    sub_100017E2C((uint64_t *)&unk_1000BA8F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return [*(id *)(v2 + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_reportSpammer) reportSpamWithCall:v4];
}

void *sub_10004B2D8()
{
  uint64_t v1 = OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall;
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall), "initiator"));
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 formattedPhoneNumber];

    if (v4) {
      goto LABEL_5;
    }
  }
  id v5 = [*(id *)(v0 + v1) initiator];
  os_log_type_t v6 = v5;
  if (v5)
  {
    id v4 = [v5 value];

LABEL_5:
    os_log_type_t v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return v6;
}

id sub_10004B3DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

id sub_10004B460()
{
  id v1 = [v0 phoneNumbers];
  sub_100017E2C(&qword_1000BA8D8);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v29 = v0;
  if (v2 >> 62) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(v2 + 8 * v4);
      os_log_type_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 value];
      id v9 = [v8 digits];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v10 = (id)TUHomeCountryCode();
      if (v10)
      {
        id v11 = v10;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v13 = v12;
      }
      else
      {
        uint64_t v13 = 0;
      }
      NSString v14 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      if (v13)
      {
        NSString v15 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v15 = 0;
      }
      id v16 = [objc_allocWithZone((Class)TUPhoneNumber) initWithDigits:v14 countryCode:v15];

      if (v16)
      {
        id result = [self sharedPrivacyManager];
        if (!result) {
          goto LABEL_34;
        }
        __int16 v18 = result;
        [result setBlockIncomingCommunication:0 forPhoneNumber:v16];
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease_n();
  id v19 = [v29 emailAddresses];
  unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v20 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    if (v21) {
      goto LABEL_22;
    }
    return (id)swift_bridgeObjectRelease_n();
  }
  uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v21) {
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_22:
  long long v22 = self;
  for (uint64_t i = 4; ; ++i)
  {
    if ((v20 & 0xC000000000000001) != 0) {
      id v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v24 = *(id *)(v20 + 8 * i);
    }
    long long v25 = v24;
    uint64_t v26 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    id result = [v22 sharedPrivacyManager];
    if (!result) {
      break;
    }
    uint64_t v27 = result;
    id v28 = [v25 value];
    [v27 setBlockIncomingCommunication:0 forEmailAddress:v28];

    if (v26 == v21) {
      return (id)swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

id sub_10004B838()
{
  if (qword_1000BA728 != -1) {
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v1 = type metadata accessor for Logger();
    sub_100011408(v1, (uint64_t)qword_1000BD500);
    id v2 = v0;
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    id v5 = &selRef_invitationPreferencesForRecentCall;
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315394;
      id v7 = [v2 phoneNumbers];
      sub_100017E2C(&qword_1000BA8D8);
      static Array._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100017E2C(&qword_1000BA8E0);
      uint64_t v8 = String.init<A>(reflecting:)();
      sub_10001AFF8(v8, v9, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2080;
      id v10 = [v2 emailAddresses];
      static Array._unconditionallyBridgeFromObjectiveC(_:)();

      id v5 = &selRef_invitationPreferencesForRecentCall;
      uint64_t v11 = String.init<A>(reflecting:)();
      sub_10001AFF8(v11, v12, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Block: blocking phoneNumbers %s \n\n emailAddreses: %s", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v13 = [v2 v5[219]];
    sub_100017E2C(&qword_1000BA8D8);
    unint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v40 = v2;
    if (v14 >> 62) {
      break;
    }
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v15) {
      goto LABEL_25;
    }
LABEL_7:
    uint64_t v16 = 4;
    while (1)
    {
      id v17 = (v14 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
          : *(id *)(v14 + 8 * v16);
      __int16 v18 = v17;
      uint64_t v0 = (void *)(v16 - 3);
      if (__OFADD__(v16 - 4, 1)) {
        break;
      }
      id v19 = [v17 value];
      id v20 = [v19 digits];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v21 = (id)TUHomeCountryCode();
      if (v21)
      {
        long long v22 = v21;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v24 = v23;
      }
      else
      {
        uint64_t v24 = 0;
      }
      NSString v25 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      if (v24)
      {
        NSString v26 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v26 = 0;
      }
      id v27 = [objc_allocWithZone((Class)TUPhoneNumber) initWithDigits:v25 countryCode:v26];

      if (v27)
      {
        id result = [self sharedPrivacyManager];
        if (!result) {
          goto LABEL_39;
        }
        id v29 = result;
        [result setBlockIncomingCommunication:1 forPhoneNumber:v27];
      }
      ++v16;
      if (v0 == (void *)v15) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_23:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  if (v15) {
    goto LABEL_7;
  }
LABEL_25:
  swift_bridgeObjectRelease_n();
  id v30 = [v40 emailAddresses];
  unint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v31 >> 62)
  {
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
    if (!v32) {
      return (id)swift_bridgeObjectRelease_n();
    }
LABEL_27:
    uint64_t v33 = self;
    for (uint64_t i = 4; ; ++i)
    {
      if ((v31 & 0xC000000000000001) != 0) {
        id v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v35 = *(id *)(v31 + 8 * i);
      }
      uint64_t v36 = v35;
      uint64_t v37 = i - 3;
      if (__OFADD__(i - 4, 1))
      {
        __break(1u);
        goto LABEL_36;
      }
      id result = [v33 sharedPrivacyManager];
      if (!result) {
        break;
      }
      v38 = result;
      id v39 = [v36 value];
      [v38 setBlockIncomingCommunication:1 forEmailAddress:v39];

      if (v37 == v32) {
        return (id)swift_bridgeObjectRelease_n();
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
  }
  else
  {
    uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v32) {
      goto LABEL_27;
    }
    return (id)swift_bridgeObjectRelease_n();
  }
  return result;
}

id sub_10004BE5C()
{
  id v1 = [v0 phoneNumbers];
  sub_100017E2C(&qword_1000BA8D8);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_22;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    id v30 = v0;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(v2 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v0 = (void *)(v4 - 3);
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v7 = [v5 value];
      id v8 = [v7 digits];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v9 = (id)TUHomeCountryCode();
      if (v9)
      {
        id v10 = v9;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v12 = v11;
      }
      else
      {
        uint64_t v12 = 0;
      }
      NSString v13 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      if (v12)
      {
        NSString v14 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v14 = 0;
      }
      id v15 = [objc_allocWithZone((Class)TUPhoneNumber) initWithDigits:v13 countryCode:v14];

      if (v15)
      {
        id result = [self sharedPrivacyManager];
        if (!result) {
          goto LABEL_41;
        }
        id v17 = result;
        unsigned int v18 = [result isIncomingCommunicationBlockedForPhoneNumber:v15];

        if (!v18)
        {
          uint64_t v19 = 0;
LABEL_20:
          uint64_t v0 = v30;
          goto LABEL_24;
        }
      }
      ++v4;
      if (v0 == (void *)v3)
      {
        uint64_t v19 = 1;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
  }
  uint64_t v19 = 1;
LABEL_24:
  swift_bridgeObjectRelease_n();
  id v20 = [v0 emailAddresses];
  unint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v21 >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
    if (v22) {
      goto LABEL_26;
    }
LABEL_36:
    swift_bridgeObjectRelease_n();
    return (id)v19;
  }
  uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v22) {
    goto LABEL_36;
  }
LABEL_26:
  unsigned int v31 = v19;
  uint64_t v23 = self;
  uint64_t v24 = 4;
  while (1)
  {
    if ((v21 & 0xC000000000000001) != 0) {
      id v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v25 = *(id *)(v21 + 8 * v24);
    }
    NSString v26 = v25;
    uint64_t v19 = v24 - 3;
    if (__OFADD__(v24 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    id result = [v23 sharedPrivacyManager];
    if (!result) {
      break;
    }
    id v27 = result;
    id v28 = [v26 value];
    unsigned int v29 = [v27 isIncomingCommunicationBlockedForEmailAddress:v28];

    if (!v29)
    {
      uint64_t v19 = 0;
      goto LABEL_36;
    }
    ++v24;
    if (v19 == v22)
    {
      uint64_t v19 = v31;
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

id sub_10004C268(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

id sub_10004C2E8()
{
  if ([v0 type] != (id)2) {
    return 0;
  }
  id result = [v0 value];
  if (result)
  {
    unint64_t v2 = result;
    uint64_t v3 = (void *)PNCopyBestGuessCountryCodeForNumber();

    if (!v3) {
      return 0;
    }
    id result = [v0 value];
    if (result)
    {
      id v4 = result;
      uint64_t v5 = (void *)CFPhoneNumberCreate();

      if (v5)
      {
        uint64_t String = CFPhoneNumberCreateString();
        if (String)
        {
          NSString v7 = (void *)String;
          uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

          return (id)v8;
        }
      }
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ContactsReportAndBlockTableViewModel()
{
  return self;
}

void type metadata accessor for VMTranscriptConfidenceRating(uint64_t a1)
{
}

uint64_t sub_10004C420(uint64_t a1, uint64_t a2)
{
  return sub_10004C698(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10004C438(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10004C4B0(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10004C530@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10004C574@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10004C5BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10004C5E8(uint64_t a1)
{
  uint64_t v2 = sub_10004C988(&qword_1000BA920);
  uint64_t v3 = sub_10004C988(&qword_1000BA928);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10004C680(uint64_t a1, uint64_t a2)
{
  return sub_10004C698(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10004C698(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10004C6DC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10004C730()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10004C7A4()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10004C830(unint64_t a1, SEL *a2)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v7 = *(id *)(a1 + 8 * i + 32);
    }
    uint64_t v8 = v7;
    [v7 *a2];
  }
LABEL_10:

  return swift_bridgeObjectRelease();
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
}

uint64_t sub_10004C920()
{
  return sub_10004C988(&qword_1000BA908);
}

uint64_t sub_10004C954()
{
  return sub_10004C988(&qword_1000BA910);
}

uint64_t sub_10004C988(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UIContentSizeCategory(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004C9CC()
{
  return sub_10004C988(&qword_1000BA918);
}

unint64_t UIDeviceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  unint64_t result = 0x7469617274726F70;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
    case 3:
      unint64_t result = 0x70616373646E616CLL;
      break;
    case 4:
      unint64_t result = 0x705565636166;
      break;
    case 5:
      unint64_t result = 0x6E776F4465636166;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_10004CAEC()
{
  return UIDeviceOrientation.description.getter(*v0);
}

uint64_t sub_10004CAF4(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void (**)(uint64_t))(result + 40);
    swift_retain();
    swift_release();
    v3(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_10004CB78()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_10004CBC0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004CBF8(uint64_t a1)
{
  return sub_10004CAF4(a1);
}

uint64_t sub_10004CC00()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue_serial.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  sub_10004D0B8();
  static DispatchQoS.userInteractive.getter();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_10004D0F8(&qword_1000BAC80, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes);
  sub_100017E2C(&qword_1000BAC88);
  sub_10004D140();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  uint64_t result = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
  qword_1000BD4A0 = result;
  return result;
}

uint64_t sub_10004CE58()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for VoicemailActor()
{
  return self;
}

uint64_t sub_10004CE8C()
{
  if (qword_1000BA6E0 != -1) {
    swift_once();
  }
  return OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()();
}

uint64_t sub_10004CEE4()
{
  return swift_initStaticObject();
}

uint64_t sub_10004CEF4()
{
  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

id sub_10004CF3C()
{
  if (qword_1000BA6E0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1000BD4A0;
  qword_1000BD4A8 = qword_1000BD4A0;

  return v0;
}

id sub_10004CFC4(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;

  return v5;
}

id sub_10004D014()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return [super dealloc];
}

uint64_t type metadata accessor for VoicemailQueueManager()
{
  return self;
}

uint64_t sub_10004D070(uint64_t a1, uint64_t a2)
{
  return sub_10004D0F8(&qword_1000BAC70, a2, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
}

unint64_t sub_10004D0B8()
{
  unint64_t result = qword_1000BAC78;
  if (!qword_1000BAC78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000BAC78);
  }
  return result;
}

uint64_t sub_10004D0F8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10004D140()
{
  unint64_t result = qword_1000BAC90;
  if (!qword_1000BAC90)
  {
    sub_10001A4F4(&qword_1000BAC88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BAC90);
  }
  return result;
}

id sub_10004D388()
{
  return sub_10004E124(type metadata accessor for VisualTranscriptionMessage);
}

uint64_t type metadata accessor for VisualTranscriptionMessage()
{
  return self;
}

id sub_10004D6D4(char *a1, uint64_t a2, SEL *a3)
{
  uint64_t v4 = *(void **)&a1[OBJC_IVAR___MPVisualMessage_vmMessage];
  uint64_t v5 = a1;
  id v6 = [v4 *a3];
  if (v6)
  {
    id v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v8 = 0;
  }

  return v8;
}

id sub_10004DC7C(char *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void))
{
  *(void *)&a1[*a4] = a3;
  v8.receiver = a1;
  v8.super_class = (Class)a5();
  id v6 = a3;
  return [super init];
}

uint64_t sub_10004DCF0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v12 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_10004E190(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v3 = v12;
      do
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        sub_100017E2C(&qword_1000BAD60);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10004E190(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_10004E190(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v12;
        }
        ++v5;
        v3[2] = v7 + 1;
        sub_10004E1B0(v11, &v3[4 * v7 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      unint64_t v8 = a1 + 32;
      uint64_t v3 = v12;
      do
      {
        swift_unknownObjectRetain();
        sub_100017E2C(&qword_1000BAD60);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10004E190(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v10 = v3[2];
        unint64_t v9 = v3[3];
        if (v10 >= v9 >> 1)
        {
          sub_10004E190(v9 > 1, v10 + 1, 1);
          uint64_t v3 = v12;
        }
        v3[2] = v10 + 1;
        sub_10004E1B0(v11, &v3[4 * v10 + 4]);
        v8 += 8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_10004E10C()
{
  return sub_10004E124(type metadata accessor for VisualMessage);
}

id sub_10004E124(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  [super dealloc];
}

uint64_t type metadata accessor for VisualMessage()
{
  return self;
}

uint64_t sub_10004E190(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10004E1C0(a1, a2, a3, *v3);
  *objc_super v3 = (char *)result;
  return result;
}

_OWORD *sub_10004E1B0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10004E1C0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100017E2C(&qword_1000BAD68);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  NSString v13 = v10 + 32;
  NSString v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10004E330(void *a1)
{
  long long v2 = v1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_1000BA740 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100011408(v4, (uint64_t)qword_1000BD538);
  swift_unknownObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)int64_t v7 = 136315138;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v59 = (uint64_t)a1;
    uint64_t v9 = sub_10005E790((uint64_t)&v59, ObjectType);
    unint64_t v11 = v10;
    swift_release();
    uint64_t v59 = sub_10001AFF8(v9, v11, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "showScreenTimeShield for %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v12 = swift_getObjectType();
  id v13 = [a1 bundleIdentifier];
  if (v13)
  {
    NSString v14 = v13;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v15 = [v1 lockoutViewController];
    if (v15) {
      sub_10004ECD8(0);
    }
    id v16 = [a1 sanitizedHandles];
    uint64_t v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_100068D10(v17);
    swift_bridgeObjectRelease();
    id v18 = [self sharedInstance];
    id v19 = [v18 contactStore];

    id v20 = [a1 contactNamesByHandleWithContactsDataSource:v19];
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_release();
    Class v23 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v24 = [self lockoutViewControllerWithBundleIdentifier:v21 contactsHandles:isa contactNameByHandle:v23];

    [v24 setViewControllerDelegate:v2];
    [v24 setOkButtonAction:1];
    id v25 = v24;
    [v2 setLockoutViewController:v25];
    id v26 = [v25 view];

    if (!v26)
    {
      sub_10004ECD8(0);
      swift_release();

      return;
    }
    [v26 setAlpha:0.0];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v2 addChildViewController:v25];
    id v27 = [v2 view];
    if (v27)
    {
      id v28 = v27;
      [v27 addSubview:v26];

      sub_100017E2C(&qword_1000BADE0);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_10007E030;
      id v30 = [v26 topAnchor];
      id v31 = [v2 view];
      if (v31)
      {
        uint64_t v32 = v31;
        id v33 = [v31 topAnchor];

        id v34 = [v30 constraintEqualToAnchor:v33];
        *(void *)(v29 + 32) = v34;
        id v35 = [v26 bottomAnchor];
        id v36 = [v2 view];
        if (v36)
        {
          uint64_t v37 = v36;
          id v38 = [v36 bottomAnchor];

          id v39 = [v35 constraintEqualToAnchor:v38];
          *(void *)(v29 + 40) = v39;
          id v40 = [v26 leadingAnchor];
          id v41 = [v2 detailsViewController];
          if (v41)
          {
            unint64_t v42 = v41;
            id v43 = [v41 view];

            if (v43)
            {
              id v44 = [v43 trailingAnchor];

              id v45 = [v40 constraintEqualToAnchor:v44];
              *(void *)(v29 + 48) = v45;
              id v46 = [v26 trailingAnchor];
              id v47 = [v2 view];
              if (v47)
              {
                uint64_t v48 = v47;
                id v49 = self;
                id v50 = [v48 trailingAnchor];

                id v51 = [v46 constraintEqualToAnchor:v50];
                *(void *)(v29 + 56) = v51;
                uint64_t v60 = v29;
                specialized Array._endMutation()();
                sub_10004FA64();
                Class v52 = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease();
                [v49 activateConstraints:v52];

                sub_10004EEBC(1, 1, 0, 0);
                swift_release();

                return;
              }
              goto LABEL_32;
            }
LABEL_31:
            __break(1u);
LABEL_32:
            __break(1u);
            return;
          }
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
  swift_unknownObjectRetain_n();
  id v53 = Logger.logObject.getter();
  os_log_type_t v54 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)uint64_t v55 = 136315138;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v59 = (uint64_t)a1;
    uint64_t v56 = sub_10005E790((uint64_t)&v59, v12);
    unint64_t v58 = v57;
    swift_release();
    uint64_t v59 = sub_10001AFF8(v56, v58, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "Could not find bundle identifier for TUFilteredRequest %s", v55, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {
    swift_release();

    swift_unknownObjectRelease_n();
  }
}

uint64_t sub_10004ECD8(char a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = [v1 lockoutViewController];

  if (v3)
  {
    if (qword_1000BA740 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100011408(v4, (uint64_t)qword_1000BD538);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      int64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "removeScreenTimeShield", v7, 2u);
      swift_slowDealloc();
    }

    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_10004EEBC(0, a1 & 1, (uint64_t)sub_10004FBA8, v8);
    swift_release();
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10004EEBC(char a1, char a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  char v10 = a1 & 1;
  *(unsigned char *)(v9 + 24) = v10;
  if (a2)
  {
    unint64_t v11 = self;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_10004FB14;
    *(void *)(v12 + 24) = v9;
    uint64_t v22 = sub_10004FB58;
    uint64_t v23 = v12;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    id v20 = sub_10004F5B8;
    NSString v21 = &unk_1000A2BC8;
    id v13 = _Block_copy(&v18);
    swift_retain();
    swift_release();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    *(void *)(v14 + 24) = a4;
    uint64_t v22 = sub_10004FBA0;
    uint64_t v23 = v14;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    id v20 = sub_10004F6B8;
    NSString v21 = &unk_1000A2C18;
    id v15 = _Block_copy(&v18);
    sub_10001ACD4(a3);
    swift_release();
    [v11 animateWithDuration:v13 animations:v15 completion:0.2];
    swift_release();
    _Block_release(v15);
    _Block_release(v13);
    return swift_release();
  }
  else
  {
    uint64_t v17 = swift_retain();
    sub_10004F3D0(v17, v10);
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_10004F268()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong lockoutViewController];
    if (v2)
    {
      id v3 = v2;
      id v4 = [v2 view];

      if (v4)
      {
        [v4 removeFromSuperview];

        id v5 = [v1 lockoutViewController];
        if (v5)
        {
          os_log_type_t v6 = v5;
          [v5 removeFromParentViewController];

          [v1 setLockoutViewController:0];
          swift_release();

          return;
        }
        goto LABEL_12;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_12:
    __break(1u);
    return;
  }
  swift_release();
}

void sub_10004F3D0(uint64_t a1, char a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    swift_release();
    return;
  }
  id v4 = Strong;
  id v5 = [Strong lockoutViewController];
  if (!v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  os_log_type_t v6 = v5;
  id v7 = [v5 view];

  if (!v7)
  {
LABEL_12:
    __break(1u);
    return;
  }
  double v8 = 0.0;
  if (a2) {
    double v8 = 1.0;
  }
  [v7 setAlpha:v8];
  swift_release();
}

uint64_t sub_10004F508(void (*a1)(uint64_t))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  a1(isCurrentExecutor);

  return swift_release();
}

uint64_t sub_10004F5B8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10004F5FC(char a1, void (*a2)(uint64_t))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  if ((a1 & 1) != 0 && a2) {
    a2(isCurrentExecutor);
  }

  return swift_release();
}

uint64_t sub_10004F6B8(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t PhoneRootViewController.lockoutViewControllerDidFinishDismissing(_:)()
{
  type metadata accessor for MainActor();
  uint64_t v3 = v0;
  return sub_10004F844((uint64_t)sub_10004F828, (uint64_t)&v2);
}

uint64_t sub_10004F780()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_10004ECD8(1);
  return swift_release();
}

uint64_t sub_10004F828()
{
  return sub_10004F780();
}

uint64_t sub_10004F844(uint64_t a1, uint64_t a2)
{
  static MainActor.shared.getter();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_10004FBC0();
  if (v2) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    _StringGuts.grow(_:)(66);
    v8._object = (void *)0x8000000100081B30;
    v8._countAndFlagsBits = 0xD00000000000003FLL;
    String.append(_:)(v8);
    v9._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    v10._countAndFlagsBits = 46;
    v10._object = (void *)0xE100000000000000;
    String.append(_:)(v10);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

unint64_t sub_10004FA64()
{
  unint64_t result = qword_1000BADE8;
  if (!qword_1000BADE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000BADE8);
  }
  return result;
}

uint64_t sub_10004FAA4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004FADC()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

void sub_10004FB14()
{
  sub_10004F3D0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_10004FB20()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004FB58()
{
  return sub_10004F508(*(void (**)(uint64_t))(v0 + 16));
}

uint64_t sub_10004FB60()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004FBA0(char a1)
{
  return sub_10004F5FC(a1, *(void (**)(uint64_t))(v1 + 16));
}

void sub_10004FBA8()
{
}

uint64_t sub_10004FBB0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004FBC0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10004FBE8()
{
  return sub_10004F828();
}

id sub_10004FC08()
{
  return sub_10004FEB0(type metadata accessor for OrientationMonitorComposer);
}

id sub_10004FC3C()
{
  return sub_10000EE64(63, (SEL *)&selRef_interfaceOrientation);
}

id sub_10004FCF0()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped);
  swift_unknownObjectRetain();
  swift_release();
  id v2 = [v1 orientationEventsEnabled];
  swift_release();
  swift_unknownObjectRelease();
  return v2;
}

id sub_10004FE98()
{
  return sub_10004FEB0(type metadata accessor for PHOrientationMonitor_OBJC);
}

id sub_10004FEB0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_10004FEE8()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v1 = v0[40];
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  char isCurrentExecutor = swift_task_isCurrentExecutor();
  if (v1 == 1)
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_super v3 = &v0[*(void *)(*(void *)v0 + 168)];
  }
  else
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_super v3 = v0 + 32;
  }
  uint64_t v4 = *(void *)v3;
  swift_release();
  swift_release();
  return v4;
}

unint64_t sub_100050094()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017E2C(qword_1000BAE88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10007E050;
  *(void *)(inited + 32) = 0xD00000000000001FLL;
  *(void *)(inited + 40) = 0x8000000100081CF0;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 56) = 0xD000000000000023;
  *(void *)(inited + 64) = 0x8000000100081D10;
  sub_10004FEE8();
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0xD000000000000020;
  *(void *)(inited + 88) = 0x8000000100081D40;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  *(NSNumber *)(inited + 96) = Int._bridgeToObjectiveC()();
  unint64_t v1 = sub_1000640E8(inited);
  swift_release();
  return v1;
}

void sub_100050290(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(void *)(v3 + 24) = a1;
    sub_10000D248();
    swift_release();
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315394;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      sub_10001AFF8(0xD00000000000001FLL, 0x8000000100081D70, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v6 + 12) = 2080;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      unint64_t v7 = 0xE800000000000000;
      uint64_t v8 = 0x7469617274726F70;
      switch(a1)
      {
        case 1:
          break;
        case 2:
          unint64_t v7 = 0x8000000100081810;
          uint64_t v8 = 0xD000000000000012;
          break;
        case 3:
          unint64_t v7 = 0xED00007466654C65;
          goto LABEL_17;
        case 4:
          unint64_t v7 = 0xEE00746867695265;
LABEL_17:
          uint64_t v8 = 0x70616373646E616CLL;
          break;
        case 5:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x705565636166;
          break;
        case 6:
          uint64_t v8 = 0x6E776F4465636166;
          break;
        default:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x6E776F6E6B6E75;
          break;
      }
      sub_10001AFF8(v8, v7, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "posting %s for orientation: %s", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    id v9 = [self defaultCenter];
    if (qword_1000BA748 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_1000BD560;
    unint64_t v11 = sub_100050094();
    sub_100064204(v11);
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v9 postNotificationName:v10 object:0 userInfo:isa];
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_100050788(char a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (unsigned char *)Strong;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    char isCurrentExecutor = swift_task_isCurrentExecutor();
    if (a1)
    {
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      char v13 = v3[40];
      v3[40] = 0;
    }
    else
    {
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_beginAccess();
      swift_retain();
      swift_release();
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_100017E2C(&qword_1000BAE80);
      swift_initStaticObject();
      unint64_t v5 = sub_100007DBC();
      swift_release();
      swift_release();
      swift_release();
      id v6 = [self currentDevice];
      id v7 = [v6 userInterfaceIdiom];

      if (v7 == (id)1)
      {
        uint64_t v8 = Logger.logObject.getter();
        os_log_type_t v9 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v8, v9))
        {
          uint64_t v10 = (uint8_t *)swift_slowAlloc();
          v23[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v10 = 136315138;
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_release();
          uint64_t v11 = 0x7469617274726F70;
          unint64_t v12 = 0xE800000000000000;
          switch(v5)
          {
            case 1uLL:
              break;
            case 2uLL:
              unint64_t v12 = 0x8000000100081810;
              uint64_t v11 = 0xD000000000000012;
              break;
            case 3uLL:
              uint64_t v11 = 0x70616373646E616CLL;
              unint64_t v12 = 0xED00007466654C65;
              break;
            case 4uLL:
              uint64_t v11 = 0x70616373646E616CLL;
              unint64_t v12 = 0xEE00746867695265;
              break;
            case 5uLL:
              unint64_t v12 = 0xE600000000000000;
              uint64_t v11 = 0x705565636166;
              break;
            case 6uLL:
              uint64_t v11 = 0x6E776F4465636166;
              break;
            default:
              unint64_t v12 = 0xE700000000000000;
              uint64_t v11 = 0x6E776F6E6B6E75;
              break;
          }
          sub_10001AFF8(v11, v12, v23);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "SpringBoardOrientationLockChangedNotification: SpringBoard is locked to %s", v10, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
      }
      else
      {
        swift_retain_n();
        uint64_t v14 = Logger.logObject.getter();
        os_log_type_t v15 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v16 = swift_slowAlloc();
          v23[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v16 = 136315394;
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_release();
          unint64_t v17 = 0xE800000000000000;
          uint64_t v18 = 0x7469617274726F70;
          switch(v5)
          {
            case 1uLL:
              break;
            case 2uLL:
              unint64_t v17 = 0x8000000100081810;
              uint64_t v18 = 0xD000000000000012;
              break;
            case 3uLL:
              uint64_t v18 = 0x70616373646E616CLL;
              unint64_t v17 = 0xED00007466654C65;
              break;
            case 4uLL:
              uint64_t v18 = 0x70616373646E616CLL;
              unint64_t v17 = 0xEE00746867695265;
              break;
            case 5uLL:
              unint64_t v17 = 0xE600000000000000;
              uint64_t v18 = 0x705565636166;
              break;
            case 6uLL:
              uint64_t v18 = 0x6E776F4465636166;
              break;
            default:
              unint64_t v17 = 0xE700000000000000;
              uint64_t v18 = 0x6E776F6E6B6E75;
              break;
          }
          sub_10001AFF8(v18, v17, v23);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v16 + 12) = 2080;
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_beginAccess();
          swift_retain();
          swift_release();
          sub_10000B28C();
          unint64_t v19 = sub_100007000();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          unint64_t v20 = 0xE800000000000000;
          uint64_t v21 = 0x7469617274726F70;
          switch(v19)
          {
            case 1uLL:
              break;
            case 2uLL:
              unint64_t v20 = 0x8000000100081810;
              uint64_t v21 = 0xD000000000000012;
              break;
            case 3uLL:
              uint64_t v21 = 0x70616373646E616CLL;
              unint64_t v20 = 0xED00007466654C65;
              break;
            case 4uLL:
              uint64_t v21 = 0x70616373646E616CLL;
              unint64_t v20 = 0xEE00746867695265;
              break;
            case 5uLL:
              unint64_t v20 = 0xE600000000000000;
              uint64_t v21 = 0x705565636166;
              break;
            case 6uLL:
              uint64_t v21 = 0x6E776F4465636166;
              break;
            default:
              unint64_t v20 = 0xE700000000000000;
              uint64_t v21 = 0x6E776F6E6B6E75;
              break;
          }
          sub_10001AFF8(v21, v20, v23);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "SpringBoardOrientationLockChangedNotification: SpringBoard is locked to %s, but using %s", (uint8_t *)v16, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_release_n();
        }
        static MainActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_beginAccess();
        swift_retain();
        swift_release();
        sub_10000B28C();
        unint64_t v5 = sub_100007000();
        swift_release();
        swift_release();
      }
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(void *)&v3[*(void *)(*(void *)v3 + 168)] = v5;
      sub_10000BCCC();
      swift_release();
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      char v13 = v3[40];
      v3[40] = 1;
    }
    sub_10000E88C(v13);
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1000512D0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100051308(uint64_t a1)
{
}

uint64_t sub_100051310(char a1)
{
  return sub_100050788(a1 & 1);
}

uint64_t *sub_10005131C()
{
  uint64_t v1 = *v0;
  if ((*((unsigned char *)v0 + 20) & 1) == 0) {
    notify_cancel(*((_DWORD *)v0 + 4));
  }
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 104));
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_100051400()
{
  sub_10005131C();

  return swift_deallocClassInstance();
}

uint64_t sub_100051458(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1000175C8(0, &qword_1000BAF50);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_1000516F8(v7, result + 1);
    id v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100051CD8();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100051F78((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_1000175C8(0, &qword_1000BAF50);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100051FFC((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_1000516F8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100017E2C(&qword_1000BAF58);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_1000175C8(0, &qword_1000BAF50);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100051CD8();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_1000518F0()
{
  uint64_t v1 = v0;
  uint64_t v42 = type metadata accessor for RecentsCallHandle();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  id v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_100017E2C(&qword_1000BAF40);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    id v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      id v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_10001818C(&qword_1000BAF30);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_100051CD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100017E2C(&qword_1000BAF58);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_100051F78(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100051FFC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100051CD8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100052428();
      goto LABEL_14;
    }
    sub_100052970();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1000175C8(0, &qword_1000BAF50);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_100052184()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RecentsCallHandle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017E2C(&qword_1000BAF40);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  unint64_t v22 = v1;
  unint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    unint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

id sub_100052428()
{
  uint64_t v1 = v0;
  sub_100017E2C(&qword_1000BAF58);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000525D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RecentsCallHandle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100017E2C(&qword_1000BAF40);
  uint64_t v7 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_10001818C(&qword_1000BAF30);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100052970()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100017E2C(&qword_1000BAF58);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100052BEC(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  sub_1000175C8(0, &qword_1000BAF50);
  sub_100017E70(&qword_1000BB460, &qword_1000BAF50);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        sub_100051458(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_100051458(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

id sub_100052F88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MPAnalyticsLogger();
  return [super dealloc];
}

uint64_t sub_100052FBC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100052FFC()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocClassInstance();
}

uint64_t sub_100053034()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else
  {
    sub_100017E2C(&qword_1000BB100);
    uint64_t v1 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    *(void *)(v0 + 16) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_1000530BC()
{
  uint64_t v0 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v2 = sub_100053034();
  CFNotificationCenterRemoveEveryObserver(v0, &v2);

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PHCFNotificationCenterObserver()
{
  return self;
}

uint64_t sub_100053180()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PHCFNotificationCenterObserver.ObserverKey()
{
  return sub_10000748C();
}

unint64_t sub_1000531DC(uint64_t a1, char a2)
{
  unint64_t result = 0xD000000000000025;
  switch(a2)
  {
    case 1:
      _StringGuts.grow(_:)(43);
      swift_bridgeObjectRelease();
      unint64_t v5 = 0xD000000000000028;
      goto LABEL_5;
    case 2:
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      unint64_t v5 = 0xD000000000000027;
LABEL_5:
      sub_100017E2C(&qword_1000BB108);
      goto LABEL_6;
    case 3:
      return result;
    default:
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      unint64_t v5 = 0xD000000000000027;
      type metadata accessor for MessageID(0);
LABEL_6:
      v3._countAndFlagsBits = Array.description.getter();
      String.append(_:)(v3);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = 41;
      v4._object = (void *)0xE100000000000000;
      String.append(_:)(v4);
      return v5;
  }
}

unint64_t sub_100053344()
{
  return sub_1000531DC(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t initializeBufferWithCopyOfBuffer for VoicemailManagerMessageChanges(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VoicemailManagerMessageChanges()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for VoicemailManagerMessageChanges(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for VoicemailManagerMessageChanges(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for VoicemailManagerMessageChanges(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VoicemailManagerMessageChanges(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VoicemailManagerMessageChanges(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1000534B0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1000534C8(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)unint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for VoicemailManagerMessageChanges()
{
  return &type metadata for VoicemailManagerMessageChanges;
}

uint64_t sub_1000534F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/ConversationKit.framework/ConversationKit", 256);
  if (!v6)
  {
    if (qword_1000BA738 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100011408(v2, (uint64_t)qword_1000BD520);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      v23[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v17 = 136315138;
      uint64_t result = (uint64_t)dlerror();
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v18 = String.init(cString:)();
      id v24 = (id)sub_10001AFF8(v18, v19, v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to load ConversationKit.framework:%s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
LABEL_19:
    uint64_t result = AnyView.init<A>(_:)();
    *a1 = result;
    return result;
  }
  uint64_t v7 = (uint64_t (*)(void))dlsym(v6, "clarityUIRootView_generic");
  if (!v7)
  {
    if (qword_1000BA738 != -1) {
      swift_once();
    }
    sub_100011408(v2, (uint64_t)qword_1000BD520);
    id v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "No function clarityUIRootView_generic in ConversationKit.", v22, 2u);
      swift_slowDealloc();
    }

    goto LABEL_19;
  }
  unint64_t v8 = v7;
  if (qword_1000BA738 != -1) {
    swift_once();
  }
  sub_100011408(v2, (uint64_t)qword_1000BD520);
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Successfully soft linked ConversationKit!", v11, 2u);
    swift_slowDealloc();
  }

  id v24 = (id)v8();
  sub_100017E2C((uint64_t *)&unk_1000BB1A0);
  swift_dynamicCast();
  int64_t v12 = sub_10001A4B0(v23, v23[3]);
  *a1 = sub_100053924((uint64_t)v12);
  return sub_10001A53C((uint64_t)v23);
}

uint64_t sub_100053924(uint64_t a1)
{
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return AnyView.init<A>(_:)();
}

void *ClarityUISceneDelegate.window.getter()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  swift_release();
  return v2;
}

void ClarityUISceneDelegate.window.setter(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = (void **)(v1 + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  swift_release();
}

uint64_t (*ClarityUISceneDelegate.window.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return sub_100053FC0;
}

uint64_t sub_100053FC0()
{
  swift_endAccess();

  return swift_release();
}

id ClarityUISceneDelegate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id ClarityUISceneDelegate.init()()
{
  *(void *)&v0[OBJC_IVAR___CNKClarityUISceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return [super init];
}

uint64_t type metadata accessor for ClarityUISceneDelegate()
{
  return self;
}

id ClarityUISceneDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return [super dealloc];
}

ValueMetadata *_s8ProviderVMa()
{
  return &_s8ProviderVN;
}

uint64_t sub_1000541A0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10009BE70, 1);
}

void *sub_1000541BC()
{
  return &protocol witness table for AnyView;
}

uint64_t sub_1000541C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v27 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & v2;
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  id v9 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v8 << 6);
      goto LABEL_22;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v12 >= v6) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        goto LABEL_30;
      }
      unint64_t v13 = *(void *)(v27 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v6) {
          goto LABEL_30;
        }
        unint64_t v13 = *(void *)(v27 + 8 * v8);
        if (!v13)
        {
          int64_t v8 = v12 + 3;
          if (v12 + 3 >= v6) {
            goto LABEL_30;
          }
          unint64_t v13 = *(void *)(v27 + 8 * v8);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_21:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_22:
    sub_1000545A4(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v25);
    v23[0] = v25[0];
    v23[1] = v25[1];
    uint64_t v24 = v26;
    sub_1000545A4((uint64_t)v23, (uint64_t)v20);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
    }
    uint64_t result = sub_100054600((uint64_t)v23);
    uint64_t v15 = v22;
    if (v22)
    {
      uint64_t v16 = v21;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100058F54(0, *((void *)v9 + 2) + 1, 1, v9);
        id v9 = (char *)result;
      }
      unint64_t v18 = *((void *)v9 + 2);
      unint64_t v17 = *((void *)v9 + 3);
      if (v18 >= v17 >> 1)
      {
        uint64_t result = (uint64_t)sub_100058F54((char *)(v17 > 1), v18 + 1, 1, v9);
        id v9 = (char *)result;
      }
      *((void *)v9 + 2) = v18 + 1;
      unint64_t v19 = &v9[16 * v18];
      *((void *)v19 + 4) = v16;
      *((void *)v19 + 5) = v15;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v6)
  {
LABEL_30:
    swift_release();
    return (uint64_t)v9;
  }
  unint64_t v13 = *(void *)(v27 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_21;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SearchUtilities()
{
  return self;
}

uint64_t sub_1000545A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100054600(uint64_t a1)
{
  return a1;
}

char *sub_100054654(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v36 = type metadata accessor for IndexSet();
  int64_t v6 = *(char **)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v34 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100017E2C(&qword_1000BB238);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = HIBYTE(a3) & 0xF;
  uint64_t v37 = a2;
  unint64_t v38 = a3;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v11 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    id v12 = [a1 phoneNumbers];
    sub_100017E2C(&qword_1000BA8D8);
    unint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v13 >> 62) {
      goto LABEL_19;
    }
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v14)
    {
      unint64_t v35 = v13 & 0xC000000000000001;
      uint64_t v15 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      uint64_t v32 = (uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
      uint64_t v33 = (void (**)(char *, char *, uint64_t))(v6 + 32);
      uint64_t v16 = 4;
      while (1)
      {
        unint64_t v17 = v35
            ? (char *)specialized _ArrayBuffer._getElementSlowPath(_:)()
            : (char *)*(id *)(v13 + 8 * v16);
        int64_t v6 = v17;
        uint64_t v18 = v16 - 3;
        if (__OFADD__(v16 - 4, 1)) {
          break;
        }
        unint64_t v19 = v13;
        id v20 = [v17 value];
        id v21 = [v20 formattedInternationalStringValue];

        if (!v21)
        {
          id v22 = [v6 value];
          id v21 = [v22 stringValue];
        }
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        NSString v23 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        NSString v24 = String._bridgeToObjectiveC()();
        id v25 = [v23 indexSetToHighlightDigitsInText:v24];

        if (v25)
        {
          uint64_t v26 = v34;
          static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v27 = v26;
          uint64_t v28 = v36;
          (*v33)(v10, v27, v36);
          (*v15)(v10, 0, 1, v28);
          int v29 = (*v32)(v10, 1, v28);
          unint64_t v13 = v19;
          if (v29 != 1)
          {
            sub_100054A10((uint64_t)v10);
            swift_bridgeObjectRelease();
            return v6;
          }
        }
        else
        {
          (*v15)(v10, 1, 1, v36);
          unint64_t v13 = v19;
        }

        sub_100054A10((uint64_t)v10);
        ++v16;
        if (v18 == v14) {
          goto LABEL_20;
        }
      }
      __break(1u);
LABEL_19:
      swift_bridgeObjectRetain();
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
LABEL_20:
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_100054A10(uint64_t a1)
{
  uint64_t v2 = sub_100017E2C(&qword_1000BB238);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100054B80()
{
  id v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  [v0 setAutomaticallyUpdatesBackgroundConfiguration:0];
  v7[3] = type metadata accessor for UIListContentConfiguration();
  void v7[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  uint64_t v2 = sub_100055694(v7);
  sub_100054FE8((uint64_t)v2);
  UITableViewCell.contentConfiguration.setter();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self systemImageNamed:v3];

  id v5 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4];
  id v6 = [self systemRedColor];
  [v5 setTintColor:v6];

  [v1 setAccessoryView:v5];
  swift_release();
}

uint64_t sub_100054FE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100017E2C(&qword_1000BB288);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v13[-v7];
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = v1 + OBJC_IVAR___PHReportTableViewCell____lazy_storage___cellContentConfiguration;
  swift_beginAccess();
  sub_1000556F8(v9, (uint64_t)v8);
  uint64_t v10 = type metadata accessor for UIListContentConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_100055760((uint64_t)v8);
    sub_10005521C();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
    swift_beginAccess();
    sub_1000557C0((uint64_t)v6, v9);
    swift_endAccess();
  }
  else
  {
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  return swift_release();
}

uint64_t sub_10005521C()
{
  uint64_t v0 = sub_100017E2C(&qword_1000BB290);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = type metadata accessor for UIBackgroundConfiguration();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  UITableViewCell.defaultContentConfiguration()();
  static UIBackgroundConfiguration.listCell()();
  uint64_t v7 = self;
  id v8 = [v7 whiteColor];
  UIBackgroundConfiguration.backgroundColor.setter();
  uint64_t v9 = self;
  id v10 = [self effectWithStyle:8];
  id v11 = [v9 _effectForBlurEffect:v10 vibrancyStyle:112];

  UIBackgroundConfiguration.visualEffect.setter();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v2, v6, v3);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  UITableViewCell.backgroundConfiguration.setter();
  id v12 = [self mainBundle];
  v21._object = (void *)0xE000000000000000;
  v13._object = (void *)0x8000000100082460;
  v13._countAndFlagsBits = 0xD00000000000002ALL;
  v14.value._countAndFlagsBits = 0x746E656365524850;
  v14.value._object = (void *)0xE900000000000073;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v21._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v21);

  UIListContentConfiguration.text.setter();
  id v16 = [v7 systemRedColor];
  unint64_t v17 = (void (*)(unsigned char *, void))UIListContentConfiguration.textProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v17(v20, 0);
  uint64_t v18 = (void (*)(unsigned char *, void))UIListContentConfiguration.textProperties.modify();
  UIListContentConfiguration.TextProperties.adjustsFontForContentSizeCategory.setter();
  v18(v20, 0);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100055558()
{
  return type metadata accessor for ReportTableViewCell();
}

uint64_t type metadata accessor for ReportTableViewCell()
{
  uint64_t result = qword_1000BB270;
  if (!qword_1000BB270) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000555AC()
{
  sub_10005563C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10005563C()
{
  if (!qword_1000BB280)
  {
    type metadata accessor for UIListContentConfiguration();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000BB280);
    }
  }
}

uint64_t *sub_100055694(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000556F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C(&qword_1000BB288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100055760(uint64_t a1)
{
  uint64_t v2 = sub_100017E2C(&qword_1000BB288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000557C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C(&qword_1000BB288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100055828(id a1, SEL a2, id a3)
{
  sub_10005589C();
  id v4 = a3;
  swift_retain();
  ReportSpamManager.reportFaceTimeCallSpam<A>(call:)();

  swift_release();
}

unint64_t sub_10005589C()
{
  unint64_t result = qword_1000BB7D0;
  if (!qword_1000BB7D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000BB7D0);
  }
  return result;
}

unint64_t sub_1000558E4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000579E8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

BOOL sub_100055918(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10005592C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100055974()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000559A0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t *sub_1000559E4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void sub_100055A00(void *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_100055A0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v6);
  id v8 = (Swift::UInt *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)();
  sub_100057984(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v5, v8, v2);
    Hasher._combine(_:)(1uLL);
    sub_100056F6C(&qword_1000BB398, (void (*)(uint64_t))&type metadata accessor for UUID);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    Swift::UInt v9 = *v8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v9);
  }
  return Hasher._finalize()();
}

BOOL sub_100055BE8(uint64_t a1, uint64_t a2)
{
  return (sub_1000572B8(a2, a1) & 1) == 0;
}

BOOL sub_100055C14(uint64_t a1, uint64_t a2)
{
  return (sub_1000572B8(a1, a2) & 1) == 0;
}

uint64_t sub_100055C34(uint64_t a1, uint64_t a2)
{
  return sub_1000572B8(a2, a1);
}

void sub_100055C48()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (Swift::UInt *)((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100057984(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v2 + 32))(v5, v7, v1);
    Hasher._combine(_:)(1uLL);
    sub_100056F6C(&qword_1000BB398, (void (*)(uint64_t))&type metadata accessor for UUID);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    Swift::UInt v8 = *v7;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v8);
  }
}

Swift::Int sub_100055E04()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  Swift::UInt v8 = (Swift::UInt *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)();
  sub_100057984(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v6, v8, v2);
    Hasher._combine(_:)(1uLL);
    sub_100056F6C(&qword_1000BB398, (void (*)(uint64_t))&type metadata accessor for UUID);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    Swift::UInt v9 = *v8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v9);
  }
  return Hasher._finalize()();
}

uint64_t sub_10005604C()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100057984(v0 + OBJC_IVAR___MPMessageID_value, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, void *, uint64_t))(v2 + 32))(v4, v7, v1);
    uint64_t v8 = UUID.uuidString.getter();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    v10[1] = *v7;
    return dispatch thunk of CustomStringConvertible.description.getter();
  }
  return v8;
}

uint64_t sub_100056624()
{
  return type metadata accessor for MessageID(0);
}

uint64_t type metadata accessor for MessageID(uint64_t a1)
{
  return sub_1000566FC(a1, (uint64_t *)&unk_1000BB2C0);
}

uint64_t sub_10005664C()
{
  uint64_t result = type metadata accessor for MessageID.Value(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for MessageID.Value(uint64_t a1)
{
  return sub_1000566FC(a1, qword_1000BB340);
}

uint64_t sub_1000566FC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100056774(uint64_t a1)
{
  swift_getObjectType();
  sub_1000579F8(a1, (uint64_t)v6);
  if (!v7)
  {
    sub_100017EC0((uint64_t)v6, &qword_1000BB3A0);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v3 = 0;
    return v3 & 1;
  }
  char v3 = sub_100057024((uint64_t)v5 + OBJC_IVAR___MPMessageID_value, v1 + OBJC_IVAR___MPMessageID_value);

  return v3 & 1;
}

ValueMetadata *type metadata accessor for MessageFolder()
{
  return &type metadata for MessageFolder;
}

uint64_t *sub_1000568B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for UUID();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t sub_1000569B0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = type metadata accessor for UUID();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_100056A2C(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for UUID();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_100056AE4(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100056BAC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for UUID();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100056BAC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100056C08(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for UUID();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_100056CC0(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100056BAC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for UUID();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100056D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100056DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100056DDC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100056DEC()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_100056E84()
{
  return sub_100056F6C(&qword_1000BB378, (void (*)(uint64_t))type metadata accessor for MessageID.Value);
}

unint64_t sub_100056ED0()
{
  unint64_t result = qword_1000BB380;
  if (!qword_1000BB380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB380);
  }
  return result;
}

uint64_t sub_100056F24()
{
  return sub_100056F6C(&qword_1000BB388, (void (*)(uint64_t))type metadata accessor for MessageID);
}

uint64_t sub_100056F6C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100056FB4(uint64_t *a1, uint64_t *a2)
{
  return sub_1000576A0(*a1, *a2);
}

BOOL sub_100056FC0(uint64_t *a1, uint64_t *a2)
{
  return (sub_1000576A0(*a2, *a1) & 1) == 0;
}

BOOL sub_100056FEC(uint64_t *a1, uint64_t *a2)
{
  return (sub_1000576A0(*a1, *a2) & 1) == 0;
}

uint64_t sub_100057014(uint64_t *a1, uint64_t *a2)
{
  return sub_1000576A0(*a2, *a1);
}

uint64_t sub_100057024(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MessageID.Value(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  Swift::String v13 = (uint64_t *)((char *)&v22 - v12);
  uint64_t v14 = sub_100017E2C(&qword_1000BB390);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  unint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_100057984(a1, (uint64_t)v17);
  sub_100057984(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_100057984((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v19 = *v13 == *(void *)v18;
      goto LABEL_6;
    }
LABEL_8:
    sub_100017EC0((uint64_t)v17, &qword_1000BB390);
    char v19 = 0;
    return v19 & 1;
  }
  sub_100057984((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  char v19 = static UUID.== infix(_:_:)();
  id v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
LABEL_6:
  sub_100056BAC((uint64_t)v17);
  return v19 & 1;
}

uint64_t sub_1000572B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v38 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v39 = (char *)&v37 - v7;
  uint64_t v8 = type metadata accessor for MessageID.Value(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  unint64_t v17 = (char *)&v37 - v16;
  __chkstk_darwin(v15);
  char v19 = (unint64_t *)((char *)&v37 - v18);
  uint64_t v20 = sub_100017E2C(&qword_1000BB390);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  NSString v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v24 = &v23[*(int *)(v21 + 56)];
  sub_100057984(a1, (uint64_t)v23);
  uint64_t v42 = a2;
  sub_100057984(a2, (uint64_t)v24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100057984((uint64_t)v23, (uint64_t)v17);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = v39;
      uint64_t v25 = v40;
      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
      uint64_t v28 = v41;
      v27(v39, v17, v41);
      int v29 = v38;
      v27(v38, v24, v28);
      if (static UUID.== infix(_:_:)())
      {
        unint64_t v30 = *(void (**)(char *, uint64_t))(v25 + 8);
        v30(v29, v28);
        v30(v26, v28);
LABEL_7:
        sub_100056BAC((uint64_t)v23);
        char v32 = 0;
        return v32 & 1;
      }
      char v32 = static UUID.< infix(_:_:)();
      unint64_t v35 = *(void (**)(char *, uint64_t))(v25 + 8);
      v35(v29, v28);
      v35(v26, v28);
LABEL_18:
      sub_100056BAC((uint64_t)v23);
      return v32 & 1;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v41);
  }
  else
  {
    sub_100057984((uint64_t)v23, (uint64_t)v19);
    unint64_t v31 = *v19;
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      if (v31 == *(void *)v24) {
        goto LABEL_7;
      }
      char v32 = v31 < *(void *)v24;
      goto LABEL_18;
    }
  }
  sub_100057984(a1, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100056BAC((uint64_t)v14);
    unint64_t v33 = 1;
  }
  else
  {
    unint64_t v33 = 0;
  }
  sub_100057984(v42, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100056BAC((uint64_t)v11);
    unint64_t v34 = 1;
  }
  else
  {
    unint64_t v34 = 0;
  }
  char v32 = v33 < v34;
  sub_100017EC0((uint64_t)v23, &qword_1000BB390);
  return v32 & 1;
}

uint64_t sub_1000576A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = type metadata accessor for MessageID.Value(0);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v28 - v15;
  uint64_t v17 = sub_100017E2C(&qword_1000BB390);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1 + OBJC_IVAR___MPMessageID_value;
  uint64_t v22 = a2 + OBJC_IVAR___MPMessageID_value;
  NSString v23 = &v20[*(int *)(v18 + 56)];
  sub_100057984(v21, (uint64_t)v20);
  sub_100057984(v22, (uint64_t)v23);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100057984((uint64_t)v20, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      NSString v24 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v24(v10, v16, v4);
      v24(v8, v23, v4);
      char v25 = static UUID.< infix(_:_:)();
      uint64_t v26 = *(void (**)(char *, uint64_t))(v5 + 8);
      v26(v8, v4);
      v26(v10, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
      sub_100056BAC((uint64_t)v23);
      char v25 = 1;
    }
  }
  else
  {
    sub_100057984((uint64_t)v20, (uint64_t)v14);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100056BAC((uint64_t)v23);
      char v25 = 0;
    }
    else
    {
      char v25 = *v14 < *(void *)v23;
    }
  }
  sub_100056BAC((uint64_t)v20);
  return v25 & 1;
}

uint64_t sub_100057984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000579E8(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

uint64_t sub_1000579F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C(&qword_1000BB3A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

unint64_t sub_100057A74()
{
  unint64_t result = qword_1000BB3A8;
  if (!qword_1000BB3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB3A8);
  }
  return result;
}

void *sub_100057AD4(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000175C8(0, &qword_1000BB468);
    sub_100017E70((unint64_t *)&unk_1000BB470, &qword_1000BB468);
    unint64_t result = (void *)Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v20;
    uint64_t v18 = v21;
    uint64_t v3 = v22;
    uint64_t v4 = v23;
    unint64_t v5 = v24;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v18 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    unint64_t result = (void *)swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      uint64_t v12 = v4;
      goto LABEL_29;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v9) {
      goto LABEL_34;
    }
    unint64_t v15 = *(void *)(v18 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v9) {
        goto LABEL_34;
      }
      unint64_t v15 = *(void *)(v18 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v9) {
          goto LABEL_34;
        }
        unint64_t v15 = *(void *)(v18 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v9) {
            goto LABEL_34;
          }
          unint64_t v15 = *(void *)(v18 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v9) {
              goto LABEL_34;
            }
            unint64_t v15 = *(void *)(v18 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v4 + 6;
              while (v9 != v16)
              {
                unint64_t v15 = *(void *)(v18 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_34:
              sub_100017604();
              return &_swiftEmptyArrayStorage;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v1 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_34;
    }
    while (1)
    {
      id v17 = [self contactForHandle:v13 isoCountryCode:0 metadataCache:0];

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      unint64_t result = (void *)specialized Array._endMutation()();
      uint64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        sub_1000175C8(0, &qword_1000BB468);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v19;
        swift_unknownObjectRelease();
        uint64_t v12 = v4;
        uint64_t v10 = v5;
        if (v19) {
          continue;
        }
      }
      goto LABEL_34;
    }
  }
  __break(1u);
  return result;
}

void *sub_100057E1C(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000175C8(0, &qword_1000BAF50);
    sub_100017E70(&qword_1000BB460, &qword_1000BAF50);
    unint64_t result = (void *)Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v23;
    uint64_t v21 = v24;
    uint64_t v3 = v25;
    int64_t v4 = v26;
    unint64_t v5 = v27;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v21 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    unint64_t result = (void *)swift_bridgeObjectRetain();
    int64_t v4 = 0;
  }
  uint64_t v19 = v3;
  int64_t v20 = (unint64_t)(v3 + 64) >> 6;
  if ((v1 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
  while (__CocoaSet.Iterator.next()())
  {
    sub_1000175C8(0, &qword_1000BAF50);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v9 = v22;
    swift_unknownObjectRelease();
    int64_t v10 = v4;
    uint64_t v11 = v5;
    if (!v22) {
      break;
    }
    while (1)
    {
      id v15 = [v9 handles:v19];
      sub_1000175C8(0, &qword_1000BB468);
      sub_100017E70((unint64_t *)&unk_1000BB470, &qword_1000BB468);
      uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      id v17 = sub_100057AD4(v16);
      swift_bridgeObjectRelease();
      unint64_t result = (void *)sub_100059064((unint64_t)v17);
      int64_t v4 = v10;
      unint64_t v5 = v11;
      if (v1 < 0) {
        break;
      }
LABEL_11:
      if (v5)
      {
        uint64_t v11 = (v5 - 1) & v5;
        unint64_t v12 = __clz(__rbit64(v5)) | (v4 << 6);
        int64_t v10 = v4;
      }
      else
      {
        int64_t v10 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return result;
        }
        if (v10 >= v20) {
          goto LABEL_33;
        }
        unint64_t v13 = *(void *)(v21 + 8 * v10);
        if (!v13)
        {
          int64_t v14 = v4 + 2;
          if (v4 + 2 >= v20) {
            goto LABEL_33;
          }
          unint64_t v13 = *(void *)(v21 + 8 * v14);
          if (v13) {
            goto LABEL_22;
          }
          int64_t v14 = v4 + 3;
          if (v4 + 3 >= v20) {
            goto LABEL_33;
          }
          unint64_t v13 = *(void *)(v21 + 8 * v14);
          if (v13) {
            goto LABEL_22;
          }
          int64_t v14 = v4 + 4;
          if (v4 + 4 >= v20) {
            goto LABEL_33;
          }
          unint64_t v13 = *(void *)(v21 + 8 * v14);
          if (v13)
          {
LABEL_22:
            int64_t v10 = v14;
          }
          else
          {
            int64_t v10 = v4 + 5;
            if (v4 + 5 >= v20) {
              goto LABEL_33;
            }
            unint64_t v13 = *(void *)(v21 + 8 * v10);
            if (!v13)
            {
              int64_t v18 = v4 + 6;
              while (v20 != v18)
              {
                unint64_t v13 = *(void *)(v21 + 8 * v18++);
                if (v13)
                {
                  int64_t v10 = v18 - 1;
                  goto LABEL_23;
                }
              }
              goto LABEL_33;
            }
          }
        }
LABEL_23:
        uint64_t v11 = (v13 - 1) & v13;
        unint64_t v12 = __clz(__rbit64(v13)) + (v10 << 6);
      }
      id v9 = *(id *)(*(void *)(v1 + 48) + 8 * v12);
      if (!v9) {
        goto LABEL_33;
      }
    }
  }
LABEL_33:
  sub_100017604();
  return &_swiftEmptyArrayStorage;
}

void (*sub_1000581A0(void *a1))(void ****a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield;
  v3[6] = v1;
  v3[7] = v4;
  swift_beginAccess();
  return sub_10005820C;
}

void sub_10005820C(void ****a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[6];
    unint64_t v5 = (void ***)((char *)v3[7] + (void)v4);
    uint64_t v6 = *(void **)((char *)v4 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController);
    if (*v5)
    {
      uint64_t v7 = v5[1];
      void v3[4] = *v5;
      v3[5] = v7;
      *uint64_t v3 = _NSConcreteStackBlock;
      v3[1] = (void **)1107296256;
      v3[2] = (void **)sub_100058308;
      v3[3] = (void **)&unk_1000A2F90;
      uint64_t v8 = _Block_copy(v3);
      swift_retain();
      swift_release();
    }
    else
    {
      uint64_t v8 = 0;
    }
    [v6 setPresentScreenTimeShield:v8];
    _Block_release(v8);
  }

  free(v3);
}

uint64_t sub_100058308(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_100058368(uint64_t a1)
{
  uint64_t v2 = v1;
  if ((RecentsCallItem.isRecentCall.getter() & 1) == 0) {
    goto LABEL_5;
  }
  id v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                             + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "recentCalls"));
  if (!v4) {
    goto LABEL_5;
  }
  unint64_t v5 = v4;
  sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  __chkstk_darwin(v7);
  _OWORD v11[2] = a1;
  uint64_t v8 = sub_100066C68(sub_100059E90, (uint64_t)v11, v6);
  swift_bridgeObjectRelease();
  if (v8)
  {
    sub_100058490(v8);
  }
  else
  {
LABEL_5:
    uint64_t v9 = RecentsCallItem.handleForMailCallback.getter();
    if (!v9) {
      return;
    }
    uint64_t v8 = (void *)v9;
    char v10 = RecentsCallItem.hasAudioMessage.getter();
    sub_100058598((uint64_t)v8, v10 & 1);
  }
}

id sub_100058490(void *a1)
{
  id v3 = [a1 remoteParticipantHandles];
  if (v3
    && ((id v4 = v3,
         sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0),
         sub_100017E70((unint64_t *)&qword_1000BBD80, (unint64_t *)&unk_1000BB4B0),
         uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)(),
         v4,
         (v5 & 0xC000000000000001) == 0)
      ? (uint64_t v6 = *(void *)(v5 + 16))
      : (uint64_t v6 = __CocoaSet.count.getter()),
        swift_bridgeObjectRelease(),
        v6 > 1))
  {
    uint64_t v7 = &selRef_performJoinRequestForRecentCall_;
  }
  else
  {
    uint64_t v7 = &selRef_performDialRequestForRecentCall_;
  }
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController);
  uint64_t v9 = *v7;

  return [v8 v9:a1];
}

void sub_100058598(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  sub_100017E2C(&qword_1000BADE0);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10007E5C0;
  *(void *)(inited + 32) = [objc_allocWithZone((Class)TUConversationMember) initWithHandle:a1];
  specialized Array._endMutation()();
  sub_100052BEC(inited);
  swift_bridgeObjectRelease();
  id v7 = objc_allocWithZone((Class)TUJoinConversationRequest);
  sub_1000175C8(0, &qword_1000BAF50);
  sub_100017E70(&qword_1000BB460, &qword_1000BAF50);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithRemoteMembers:isa];

  if (a2) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  [v9 setAvMode:v10 inited];
  [v9 setVideoEnabled:(a2 & 1) == 0];
  [v9 setOriginatingUIType:14];
  id v11 = [self invitationPreferencesForRecentCall];
  sub_1000175C8(0, &qword_1000BB4F0);
  sub_100017E70(&qword_1000BB4F8, &qword_1000BB4F0);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();

  Class v12 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v9 setInvitationPreferences:v12];

  unint64_t v13 = (void (**)(void))(v3 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield);
  swift_beginAccess();
  int64_t v14 = *v13;
  if (!*v13) {
    goto LABEL_8;
  }
  id v15 = self;
  swift_retain();
  id v16 = [v15 sharedInstance];
  id v17 = [v16 callFilterController];

  LODWORD(v16) = [v17 shouldRestrictJoinConversationRequest:v9 performSynchronously:1];
  if (!v16)
  {
    sub_10000C128((uint64_t)v14);
LABEL_8:
    id v18 = [self sharedInstance];
    [v18 launchAppForJoinRequest:v9];

    goto LABEL_9;
  }
  id v18 = v9;
  v14();

  sub_10000C128((uint64_t)v14);
LABEL_9:
}

id sub_1000588B8()
{
  uint64_t v1 = v0;
  if (qword_1000BA718 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100011408(v2, (uint64_t)qword_1000BD4D0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Deleting all recent calls (PHRecentsController)", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController);

  return [v6 deleteAllRecentCalls];
}

void sub_1000589B8(uint64_t a1)
{
  uint64_t v3 = v1;
  unint64_t v4 = (unint64_t)sub_100059A94(a1, (uint64_t)v3);

  if (qword_1000BA718 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100011408(v5, (uint64_t)qword_1000BD4D0);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "filtered recent calls. deleting recent calls %ld", v8, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v9 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController];
  sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v9 deleteRecentCalls:isa];
}

id sub_100058BD8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecentCallProvider();
  return [super dealloc];
}

uint64_t sub_100058C74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate;
  swift_beginAccess();
  return sub_10001B198(v3, a1);
}

uint64_t (*sub_100058CCC())()
{
  return j__swift_endAccess;
}

uint64_t sub_100058D30()
{
  uint64_t v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_10001ACD4(*v1);
  return v2;
}

void (*sub_100058D90(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000581A0(v2);
  return sub_100058DEC;
}

void sub_100058DEC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void *sub_100058E34(void *a1)
{
  id v1 = [a1 mergedRemoteMembers];
  sub_1000175C8(0, &qword_1000BAF50);
  sub_100017E70(&qword_1000BB460, &qword_1000BAF50);
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = sub_100057E1C(v2);
  swift_bridgeObjectRelease();
  return v3;
}

void sub_100058EE4(uint64_t a1)
{
}

id sub_100058F08()
{
  return sub_1000588B8();
}

void sub_100058F2C(uint64_t a1)
{
}

char *sub_100058F54(char *result, int64_t a2, char a3, char *a4)
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
      sub_100017E2C((uint64_t *)&unk_1000BB500);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_1000599A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100059064(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000595F8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

unint64_t sub_100059230(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100059330(a1, a2, v4);
}

unint64_t sub_1000592A8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100059414(a1, v4);
}

unint64_t sub_1000592EC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000594DC(a1, v4);
}

unint64_t sub_100059330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100059414(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000545A4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100054600((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000594DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_1000595F8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000598BC();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100017E2C(&qword_1000BB480);
          uint64_t v12 = sub_10005980C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*sub_10005980C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100059918(v6, a2, a3);
  return sub_100059874;
}

void sub_100059874(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_1000598BC()
{
  unint64_t result = qword_1000BB488;
  if (!qword_1000BB488)
  {
    sub_10001A4F4(&qword_1000BB480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB488);
  }
  return result;
}

void (*sub_100059918(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100059998;
  }
  __break(1u);
  return result;
}

void sub_100059998(id *a1)
{
}

uint64_t sub_1000599A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_100059A94(uint64_t a1, uint64_t a2)
{
  id result = &_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    type metadata accessor for RecentsCallItem();
    uint64_t v28 = OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v27 = v4;
    while (1)
    {
      uint64_t v30 = v5;
      if ((RecentsCallItem.isRecentCall.getter() & 1) == 0) {
        goto LABEL_30;
      }
      id v8 = [*(id *)(a2 + v28) recentCalls];
      if (!v8) {
        goto LABEL_30;
      }
      uint64_t v9 = v8;
      sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
      unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
        if (!v11)
        {
LABEL_29:
          swift_bridgeObjectRelease_n();
          uint64_t v4 = v27;
LABEL_30:
          if (qword_1000BA730 != -1) {
            swift_once();
          }
          sub_100017E2C((uint64_t *)&unk_1000BBD70);
          uint64_t v24 = swift_allocObject();
          *(_OWORD *)(v24 + 16) = xmmword_10007E140;
          RecentsCallItem.callUniqueId.getter();
          if (v25)
          {
            uint64_t v7 = String.init<A>(reflecting:)();
            unint64_t v6 = v26;
          }
          else
          {
            unint64_t v6 = 0xE300000000000000;
            uint64_t v7 = 7104878;
          }
          *(void *)(v24 + 56) = &type metadata for String;
          *(void *)(v24 + 64) = sub_10001AC80();
          *(void *)(v24 + 32) = v7;
          *(void *)(v24 + 40) = v6;
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();
          swift_bridgeObjectRelease();
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v11) {
          goto LABEL_29;
        }
      }
      unint64_t v32 = v10;
      unint64_t v33 = v10 & 0xC000000000000001;
      uint64_t v12 = 4;
      uint64_t v31 = v11;
      while (1)
      {
        if (v33) {
          id result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id result = *(id *)(v10 + 8 * v12);
        }
        BOOL v13 = result;
        uint64_t v14 = v12 - 3;
        if (__OFADD__(v12 - 4, 1))
        {
          __break(1u);
          return result;
        }
        uint64_t v15 = RecentsCallItem.callUniqueId.getter();
        uint64_t v17 = v16;
        id v18 = [v13 uniqueId];
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v21 = v20;

        if (!v17)
        {

          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
        if (v15 == v19 && v17 == v21) {
          break;
        }
        char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v23) {
          goto LABEL_25;
        }

LABEL_12:
        ++v12;
        unint64_t v10 = v32;
        if (v14 == v31) {
          goto LABEL_29;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_25:
      swift_bridgeObjectRelease();
      uint64_t v4 = v27;
      swift_bridgeObjectRelease();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
LABEL_5:
      uint64_t v5 = v30 + 1;
      if (v30 + 1 == v4)
      {
        swift_bridgeObjectRelease();
        return &_swiftEmptyArrayStorage;
      }
    }
  }
  return result;
}

uint64_t sub_100059E90(void **a1)
{
  return sub_10005EC00(a1) & 1;
}

uint64_t sub_100059EB8(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void (**)(uint64_t))(result + 16);
    sub_10001ACD4((uint64_t)v3);
    uint64_t result = swift_release();
    if (v3)
    {
      v3(a1);
      return sub_10000C128((uint64_t)v3);
    }
  }
  return result;
}

uint64_t sub_100059F44()
{
  uint64_t v1 = *(void **)(v0 + 32);
  [v1 setOrientationEventsEnabled:0];
  [v1 setPassiveOrientationEvents:1];
  [v1 setDelegate:0];
  sub_10000C128(*(void *)(v0 + 16));

  return swift_deallocClassInstance();
}

id sub_100059FD4()
{
  [*(id *)&v0[OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_accelerometer] setDelegate:0];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccelerometerDelegate();
  return [super dealloc];
}

uint64_t sub_10005A180(unint64_t a1)
{
  if (a1 >= 7) {
    a1 = 1;
  }
  return (*(uint64_t (**)(unint64_t))(v1
                                                     + OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_onOrientationChange))(a1);
}

uint64_t sub_10005A1BC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005A1F4(uint64_t a1)
{
  return sub_100059EB8(a1);
}

uint64_t type metadata accessor for FTPreferences()
{
  return self;
}

void sub_10005A5F8()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    sub_10001ACD4(*(void *)(v0 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield));
    dispatch thunk of RecentsListViewController.presentScreenTimeShield.setter();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_10005A76C()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_1000BA708 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100011408(v2, (uint64_t)qword_1000BB6F0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Destroying RecentsListViewController", v5, 2u);
    swift_slowDealloc();
  }

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v6 = *(void **)(v1 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  *(void *)(v1 + OBJC_IVAR___FTRecentsContainerViewController_recentsList) = 0;

  sub_10000BAC8();
  swift_release();

  return swift_release();
}

void sub_10005A954(uint64_t a1, void *a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  id v7 = v5;
  swift_release();
  if (v5)
  {
    v6._countAndFlagsBits = a1;
    v6._object = a2;
    RecentsListViewController.showLinkDetailViewController(for:)(v6);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

void sub_10005AADC()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    RecentsListViewController.showVideoPlayerForMessage(withUUID:bypassSafety:)();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

void sub_10005AD8C()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v13 = [v2 predicateForCallsWithUniqueID:v3];

  id v4 = [objc_allocWithZone((Class)CHManager) init];
  id v5 = [v4 callsWithPredicate:v13 limit:0 offset:0 batchSize:0];

  sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_5;
    }
LABEL_17:
    swift_release();

    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_17;
  }
LABEL_5:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v7 = *(id *)(v6 + 32);
  }
  id v8 = v7;
  swift_bridgeObjectRelease();
  id v9 = v8;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v10 = *(void **)(v1 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  id v11 = v10;
  swift_release();
  if (v10)
  {
    RecentsListViewController.presentDetailsView(for:)();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_10005B074(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  id v10 = a1;
  a5(v7, v9);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10005B214()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    uint64_t v3 = dispatch thunk of RecentsListViewController.collectionView.getter();
    swift_release();
  }
  else
  {
    swift_release();
    return 0;
  }
  return v3;
}

id sub_10005B420()
{
  return sub_10005B79C(type metadata accessor for RecentsContainerViewController);
}

id sub_10005B784()
{
  return sub_10005B79C(type metadata accessor for RemoteRecentsContainerViewController);
}

id sub_10005B79C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteRecentsContainerViewController()
{
  return self;
}

uint64_t sub_10005B7F8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005B830()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void *sub_10005B844@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_10005B874(uint64_t a1)
{
  if (*(void *)(a1 + OBJC_IVAR___PHDialerContactResultButtonView_type) > 1uLL)
  {
    uint64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  else
  {
    uint64_t v1 = self;
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = [v1 __systemImageNamedSwift:v2];

    id v4 = [objc_allocWithZone((Class)UIImageView) initWithImage:v3];
    LODWORD(v5) = 1148846080;
    [v4 setContentCompressionResistancePriority:0 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [v4 setContentHuggingPriority:0 forAxis:v6];
    id v7 = [self dynamicLabelColor];
    [v4 setTintColor:v7];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = v4;
    [v8 setContentMode:4];

    return (uint64_t)v8;
  }
  return result;
}

id sub_10005BAE4()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel;
  NSString v2 = *(void **)(v0 + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel);
  }
  else
  {
    id v4 = sub_10005BCD8();
    double v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    NSString v2 = 0;
  }
  id v6 = v2;
  swift_release();
  return v3;
}

id sub_10005BCD8()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v1 = self;
  id v2 = v0;
  id v3 = [v1 clearColor];
  [v2 setBackgroundColor:v3];

  id v4 = [self systemFontOfSize:18.0];
  id v5 = [v4 withCaseSensitiveAttribute];

  [v2 setFont:v5];
  [v2 setAdjustsFontForContentSizeCategory:0];
  return v2;
}

id sub_10005BDEC()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel;
  id v2 = *(void **)(v0 + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_10005BEC0(v0);
    id v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_10005E5A8(v4);
  }
  sub_10005E5B8(v2);
  swift_release();
  return v3;
}

id sub_10005BEC0(uint64_t a1)
{
  if (*(void *)(a1 + OBJC_IVAR___PHDialerContactResultButtonView_type)) {
    return 0;
  }
  id v2 = [objc_allocWithZone((Class)UILabel) init];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = self;
  id v1 = v2;
  id v4 = [v3 clearColor];
  [v1 setBackgroundColor:v4];

  id v5 = [self systemFontOfSize:18.0];
  id v6 = [v5 withCaseSensitiveAttribute];

  [v1 setFont:v6];
  [v1 setAdjustsFontForContentSizeCategory:0];
  return v1;
}

id sub_10005BFEC(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = *a2;
  id v7 = *(void **)(v3 + v6);
  if (v7)
  {
    id v8 = *(id *)(v3 + v6);
  }
  else
  {
    uint64_t v9 = (void *)a3(v3);
    id v10 = *(void **)(v3 + v6);
    *(void *)(v3 + v6) = v9;
    id v8 = v9;

    id v7 = 0;
  }
  id v11 = v7;
  swift_release();
  return v8;
}

id sub_10005C0D0(void *a1)
{
  sub_100017E2C(&qword_1000BADE0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10007E7A0;
  *(void *)(v2 + 32) = sub_10005BFEC(24, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10005B874);
  *(void *)(v2 + 40) = sub_10005BAE4();
  specialized Array._endMutation()();
  id v3 = objc_allocWithZone((Class)UIStackView);
  sub_1000175C8(0, &qword_1000BB888);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithArrangedSubviews:isa];

  [v5 setAxis:0];
  [v5 setSpacing:0.0];
  [v5 setAlignment:3];
  [v5 setDistribution:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = sub_10005BFEC(24, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10005B874);
  [v5 setCustomSpacing:v6 afterView:8.0];

  [a1 addSubview:v5];
  return v5;
}

id sub_10005C288(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding;
  id v6 = self;
  id v7 = v2;
  [v6 horizontalPadding];
  *(void *)&v2[v5] = v8;
  *(void *)&v7[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView] = 0;
  *(void *)&v7[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel] = 0;
  *(void *)&v7[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel] = 1;
  Logger.init(subsystem:category:)();
  *(void *)&v7[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView] = 0;
  *(void *)&v7[OBJC_IVAR___PHDialerContactResultButtonView_type] = a1;

  v21.receiver = v7;
  v21.super_class = ObjectType;
  [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v10 = self;
  id v11 = v9;
  id v12 = [v10 clearColor];
  [v11 setBackgroundColor:v12];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = sub_10005BDEC();
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = sub_10005BFEC(66, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10005C0D0);
    [v15 addArrangedSubview:v14];
  }
  sub_10005C5BC();
  id v16 = [v11 traitCollection];
  id v17 = [v16 preferredContentSizeCategory];

  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v18 = sub_10005BFEC(24, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10005B874);
  [v18 setHidden:UIContentSizeCategory.isAccessibilityCategory.getter() & 1];

  swift_release();
  id v19 = [self defaultCenter];
  [v19 addObserver:v11 selector:"handleContentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  return v11;
}

void sub_10005C5BC()
{
  id v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017E2C(&qword_1000BADE0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10007E7B0;
  id v3 = sub_10005BFEC(66, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10005C0D0);
  id v4 = [v3 leadingAnchor];

  id v5 = [v1 leadingAnchor];
  uint64_t v6 = OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding;
  id v7 = [v4 constraintEqualToAnchor:v5 constant:*(double *)&v1[OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding]];

  *(void *)(v2 + 32) = v7;
  id v8 = sub_10005BFEC(66, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10005C0D0);
  id v9 = [v8 trailingAnchor];

  id v10 = [v1 trailingAnchor];
  id v11 = [v9 constraintLessThanOrEqualToAnchor:v10 constant:-*(double *)&v1[v6]];

  *(void *)(v2 + 40) = v11;
  id v12 = sub_10005BFEC(66, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10005C0D0);
  id v13 = [v12 topAnchor];

  id v14 = [v1 topAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];

  *(void *)(v2 + 48) = v15;
  id v16 = sub_10005BFEC(66, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10005C0D0);
  id v17 = [v16 bottomAnchor];

  id v18 = [v1 bottomAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];

  *(void *)(v2 + 56) = v19;
  id v20 = sub_10005BFEC(66, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10005C0D0);
  id v21 = [v20 heightAnchor];

  id v22 = [v21 constraintEqualToConstant:22.0];
  *(void *)(v2 + 64) = v22;
  id v23 = sub_10005BFEC(24, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10005B874);
  id v24 = [v23 widthAnchor];

  id v25 = [v24 constraintGreaterThanOrEqualToConstant:27.0];
  *(void *)(v2 + 72) = v25;
  specialized Array._endMutation()();
  unint64_t v26 = self;
  sub_1000175C8(0, (unint64_t *)&qword_1000BADE8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v26 activateConstraints:isa];
  swift_release();
}

void sub_10005CB54(float a1, float a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = sub_10005BAE4();
  *(float *)&double v5 = a1;
  [v4 setContentCompressionResistancePriority:0 forAxis:v5];

  id v6 = sub_10005BDEC();
  if (v6)
  {
    id v8 = v6;
    *(float *)&double v7 = a2;
    [v6 setContentCompressionResistancePriority:0 forAxis:v7];
    swift_release();
  }
  else
  {
    swift_release();
  }
}

void sub_10005CCA8(void *a1, float a2, float a3)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  sub_10005CB54(a2, a3);
  swift_release();
}

uint64_t sub_10005CF00(void *a1, uint64_t a2, uint64_t a3)
{
  v44[1] = a2;
  uint64_t v45 = a3;
  uint64_t v4 = type metadata accessor for PersonNameComponents();
  uint64_t v46 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v6 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100017E2C(&qword_1000BB880);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  id v10 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  id v13 = (char *)v44 - v12;
  __chkstk_darwin(v11);
  id v15 = (char *)v44 - v14;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v16 = sub_10005BFEC(66, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10005C0D0);
  [v16 layoutIfNeeded];

  id v17 = sub_10005BDEC();
  if (v17)
  {
    id v18 = v17;
    [v17 sizeThatFits:0.0, 0.0];
    double v20 = v19;
    [v18 frame];
    double Width = CGRectGetWidth(v48);

    if (Width < v20)
    {
      id v22 = [objc_allocWithZone((Class)NSPersonNameComponentsFormatter) init];
      NSString v23 = [a1 string];
      if (!v23)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v23 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      id v24 = [v22 personNameComponentsFromString:v23];

      if (v24)
      {
        static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v25 = v46;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v13, 0, 1, v4);
      }
      else
      {
        uint64_t v25 = v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v13, 1, 1, v4);
      }
      sub_10005E5C8((uint64_t)v13, (uint64_t)v15);
      [v22 setStyle:1];
      sub_100017F1C((uint64_t)v15, (uint64_t)v10, &qword_1000BB880);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v4) == 1)
      {
        sub_100017EC0((uint64_t)v15, &qword_1000BB880);

        uint64_t v27 = (uint64_t)v10;
LABEL_23:
        sub_100017EC0(v27, &qword_1000BB880);
        return swift_release();
      }
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v6, v10, v4);
      uint64_t v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "DialerContactResultButtonView: Using Short name as the number is being truncated", v30, 2u);
        swift_slowDealloc();
      }

      Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
      id v32 = [v22 stringFromPersonNameComponents:isa];

      NSString v33 = v32;
      NSString v34 = v32;
      if (v32)
      {
        if (v45)
        {
LABEL_19:
          id v35 = v32;

          id v36 = sub_10005BAE4();
          NSString v37 = String._bridgeToObjectiveC()();
          id v38 = [v34 attributedStringToHighlightText:v37 style:1];

          [v36 setAttributedText:v38];
LABEL_22:

          (*(void (**)(char *, uint64_t))(v46 + 8))(v6, v4);
          uint64_t v27 = (uint64_t)v15;
          goto LABEL_23;
        }
      }
      else
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v34 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v33 = String._bridgeToObjectiveC()();
        uint64_t v39 = v45;
        swift_bridgeObjectRelease();
        if (v39) {
          goto LABEL_19;
        }
      }
      id v40 = v32;

      id v41 = sub_10005BAE4();
      NSString v42 = String._bridgeToObjectiveC()();
      id v43 = [v33 attributedStringToHighlightText:v42];

      [v41 setAttributedText:v43];
      goto LABEL_22;
    }
  }

  return swift_release();
}

void sub_10005D4EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a5)
  {
    float v10 = 750.0;
    float v11 = 1000.0;
  }
  else
  {
    float v10 = 1000.0;
    float v11 = 750.0;
  }
  sub_10005CB54(v10, v11);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v12 = sub_10005BAE4();
  [v12 setAttributedText:a1];

  id v13 = sub_10005BDEC();
  [v13 setAttributedText:a2];
  swift_release();

  if (a1)
  {
    id v14 = a1;
    sub_10005CF00(v14, a3, a4);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

void sub_10005D810(uint64_t a1)
{
  uint64_t v2 = sub_100017E2C(&qword_1000BB878);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017F1C(a1, (uint64_t)v4, &qword_1000BB878);
  uint64_t v5 = type metadata accessor for Notification();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100017EC0((uint64_t)v4, &qword_1000BB878);
LABEL_9:
    long long v15 = 0u;
    long long v16 = 0u;
LABEL_10:
    sub_100017EC0((uint64_t)&v15, &qword_1000BB3A0);
LABEL_11:
    swift_release();
    return;
  }
  uint64_t v7 = Notification.userInfo.getter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  if (!v7) {
    goto LABEL_9;
  }
  v13[1] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13[2] = v8;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v7 + 16) && (unint64_t v9 = sub_1000592A8((uint64_t)v14), (v10 & 1) != 0))
  {
    sub_10001A7A0(*(void *)(v7 + 56) + 32 * v9, (uint64_t)&v15);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100054600((uint64_t)v14);
  if (!*((void *)&v16 + 1)) {
    goto LABEL_10;
  }
  type metadata accessor for UIContentSizeCategory(0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  float v11 = (void *)v14[0];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v12 = sub_10005BFEC(24, &OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10005B874);
  [v12 setHidden:UIContentSizeCategory.isAccessibilityCategory.getter() & 1];
  swift_release();

  swift_release();
}

uint64_t sub_10005DF94()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = sub_10005BAE4();
  id v1 = [v0 attributedText];

  if (v1)
  {
    id v2 = [v1 string];

    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;
  }
  else
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t v3 = 0;
    uint64_t v5 = (void *)0xE000000000000000;
  }
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  id v7 = sub_10005BDEC();
  if (v7
    && (v8 = v7, id v9 = [v7 attributedText], v8, v9))
  {
    id v10 = [v9 string];

    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v13 = v12;
  }
  else
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t v11 = 0;
    id v13 = (void *)0xE000000000000000;
  }
  v14._countAndFlagsBits = v11;
  v14._object = v13;
  String.append(_:)(v14);
  swift_release();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10005E434()
{
  return type metadata accessor for DialerContactResultButtonView();
}

uint64_t type metadata accessor for DialerContactResultButtonView()
{
  uint64_t result = qword_1000BB860;
  if (!qword_1000BB860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10005E488()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DialerContactResultButtonType()
{
  return &type metadata for DialerContactResultButtonType;
}

unint64_t sub_10005E554()
{
  unint64_t result = qword_1000BB870;
  if (!qword_1000BB870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB870);
  }
  return result;
}

void sub_10005E5A8(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_10005E5B8(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_10005E5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C(&qword_1000BB880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005E630()
{
  uint64_t v1 = OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding;
  [self horizontalPadding];
  *(void *)&v0[v1] = v2;
  *(void *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView] = 0;
  *(void *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel] = 0;
  *(void *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel] = 1;
  Logger.init(subsystem:category:)();
  *(void *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView] = 0;

  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10005E790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = *(void *)(a2 - 8);
  uint64_t v10 = __chkstk_darwin(v6);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  Swift::String v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return 7104878;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v8, a2);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, a2);
    uint64_t v15 = String.init<A>(reflecting:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, a2);
  }
  return v15;
}

uint64_t sub_10005E9B4(uint64_t a1)
{
  return sub_1000106A4(a1, qword_1000BD4E8);
}

uint64_t sub_10005E9E8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100010718(v0, qword_1000BD500);
  sub_100011408(v0, (uint64_t)qword_1000BD500);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10005EA64()
{
  sub_10005EAC4();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_1000BD518 = result;
  return result;
}

unint64_t sub_10005EAC4()
{
  unint64_t result = qword_1000BA8E8;
  if (!qword_1000BA8E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000BA8E8);
  }
  return result;
}

uint64_t sub_10005EB04()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100010718(v0, qword_1000BD520);
  sub_100011408(v0, (uint64_t)qword_1000BD520);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10005EB80()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100010718(v0, qword_1000BD538);
  sub_100011408(v0, (uint64_t)qword_1000BD538);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10005EC00(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = RecentsCallItem.callUniqueId.getter();
  uint64_t v4 = v3;
  id v5 = [v1 uniqueId];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  if (v4)
  {
    if (v2 == v6 && v4 == v8) {
      char v10 = 1;
    }
    else {
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = 0;
  }
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_10005ECC4(void *a1)
{
  sub_100017E2C(&qword_1000BAD60);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v4 = [v1 contactByHandleForRecentCall:a1 keyDescriptors:isa];

  if (v4)
  {
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
    sub_10005EEE4();
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [a1 validRemoteParticipantHandles];
  if (!v6)
  {
    swift_bridgeObjectRelease();
    unint64_t v11 = (unint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_6;
    }
LABEL_9:
    sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
    swift_bridgeObjectRetain();
    uint64_t v12 = _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v7 = v6;
  sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
  sub_10005EEE4();
  uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  id v9 = a1;
  sub_10005EF4C(v8, v5, v9);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();

  if (v11 >> 62) {
    goto LABEL_9;
  }
LABEL_6:
  swift_bridgeObjectRetain();
  dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
  sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
  uint64_t v12 = v11;
LABEL_7:
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_10005EEE4()
{
  unint64_t result = qword_1000BBD80;
  if (!qword_1000BBD80)
  {
    sub_1000175C8(255, (unint64_t *)&unk_1000BB4B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BBD80);
  }
  return result;
}

void sub_10005EF4C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_10005EEE4();
    Set.Iterator.init(_cocoa:)();
    uint64_t v4 = v30;
    uint64_t v27 = v31;
    uint64_t v5 = v32;
    int64_t v6 = v33;
    unint64_t v7 = v34;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v27 = a1 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v6 = 0;
  }
  int64_t v26 = (unint64_t)(v5 + 64) >> 6;
  while (v4 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_51;
    }
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v14 = v29;
    swift_unknownObjectRelease();
    int64_t v13 = v6;
    uint64_t v11 = v7;
    if (!v29) {
      goto LABEL_51;
    }
LABEL_28:
    if (!a2) {
      goto LABEL_38;
    }
    if ((a2 & 0xC000000000000001) != 0)
    {
      id v17 = v14;
      if (!__CocoaDictionary.lookup(_:)()) {
        goto LABEL_37;
      }
      sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v18 = v29;
      swift_unknownObjectRelease();
    }
    else
    {
      if (!*(void *)(a2 + 16)) {
        goto LABEL_38;
      }
      unint64_t v19 = sub_1000592EC((uint64_t)v14);
      if ((v20 & 1) == 0)
      {
LABEL_37:

        goto LABEL_38;
      }
      id v18 = *(id *)(*(void *)(a2 + 56) + 8 * v19);
    }

    if (v18) {
      goto LABEL_8;
    }
LABEL_38:
    id v21 = [v14 tuHandle];
    if (!v21)
    {
LABEL_8:

      goto LABEL_9;
    }
    id v22 = v21;
    NSString v23 = [a3 isoCountryCode];
    if (v23)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      NSString v23 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    id v24 = [self contactForHandle:v22 isoCountryCode:v23 metadataCache:0];

    int64_t v6 = v13;
    unint64_t v7 = v11;
    if (v24)
    {
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
LABEL_9:
      int64_t v6 = v13;
      unint64_t v7 = v11;
    }
  }
  if (v7)
  {
    uint64_t v11 = (v7 - 1) & v7;
    unint64_t v12 = __clz(__rbit64(v7)) | (v6 << 6);
    int64_t v13 = v6;
LABEL_27:
    id v14 = *(id *)(*(void *)(v4 + 48) + 8 * v12);
    if (!v14) {
      goto LABEL_51;
    }
    goto LABEL_28;
  }
  int64_t v13 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v13 >= v26) {
      goto LABEL_51;
    }
    unint64_t v15 = *(void *)(v27 + 8 * v13);
    if (!v15)
    {
      int64_t v16 = v6 + 2;
      if (v6 + 2 >= v26) {
        goto LABEL_51;
      }
      unint64_t v15 = *(void *)(v27 + 8 * v16);
      if (v15) {
        goto LABEL_25;
      }
      int64_t v16 = v6 + 3;
      if (v6 + 3 >= v26) {
        goto LABEL_51;
      }
      unint64_t v15 = *(void *)(v27 + 8 * v16);
      if (v15) {
        goto LABEL_25;
      }
      int64_t v16 = v6 + 4;
      if (v6 + 4 >= v26) {
        goto LABEL_51;
      }
      unint64_t v15 = *(void *)(v27 + 8 * v16);
      if (v15)
      {
LABEL_25:
        int64_t v13 = v16;
      }
      else
      {
        int64_t v13 = v6 + 5;
        if (v6 + 5 >= v26) {
          goto LABEL_51;
        }
        unint64_t v15 = *(void *)(v27 + 8 * v13);
        if (!v15)
        {
          int64_t v25 = v6 + 6;
          while (v26 != v25)
          {
            unint64_t v15 = *(void *)(v27 + 8 * v25++);
            if (v15)
            {
              int64_t v13 = v25 - 1;
              goto LABEL_26;
            }
          }
LABEL_51:
          sub_100017604();
          return;
        }
      }
    }
LABEL_26:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_27;
  }
  __break(1u);
}

uint64_t sub_10005F5B8()
{
  return type metadata accessor for FTTranscriptionMessage(0);
}

uint64_t type metadata accessor for FTTranscriptionMessage(uint64_t a1)
{
  return sub_1000566FC(a1, (uint64_t *)&unk_1000BB8C0);
}

uint64_t sub_10005F5E0()
{
  uint64_t result = type metadata accessor for Transcript();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

BOOL sub_10005F7C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10005F7D8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10005F820()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10005F84C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10005FC60()
{
  LOWORD(result) = dispatch thunk of Message.messageType.getter();
  if ((unsigned __int16)result < 3u) {
    return (unsigned __int16)result;
  }
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  dispatch thunk of Message.messageType.getter();
  MessageType.rawValue.getter();
  v1._countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_10005FE48(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);
  uint64_t v7 = v6;
  swift_release();
  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

uint64_t sub_10005FED4(SEL *a1)
{
  if (dispatch thunk of Message.isFromUnknown.getter()) {
    return 0;
  }
  dispatch thunk of Message.from.getter();
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 normalizedHandleWithDestinationID:v3];

  if (!v4) {
    return 0;
  }
  id v5 = [v4 *a1];
  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v7;
}

uint64_t sub_10005FFF4(SEL *a1)
{
  dispatch thunk of Message.recipient.getter();
  if (!v2) {
    return 0;
  }
  NSString v3 = self;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [v3 normalizedHandleWithDestinationID:v4];

  if (!v5) {
    return 0;
  }
  id v6 = [v5 *a1];
  if (!v6)
  {

    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v8;
}

uint64_t sub_100060150()
{
  if (*(unsigned char *)(v0 + 32) != 1) {
    return *(void *)(v0 + 24);
  }
  int v1 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
  uint64_t v2 = 1;
  if (v1 == 2) {
    uint64_t v2 = 2;
  }
  if (v1 == 1) {
    uint64_t result = 3;
  }
  else {
    uint64_t result = v2;
  }
  *(void *)(v0 + 24) = result;
  *(unsigned char *)(v0 + 32) = 0;
  return result;
}

uint64_t sub_1000601E8()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty) == 1)
  {
    return sub_100060150();
  }
  else
  {
    int v2 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
    uint64_t v3 = 1;
    if (v2 == 2) {
      uint64_t v3 = 2;
    }
    if (v2 == 1) {
      return 3;
    }
    else {
      return v3;
    }
  }
}

uint64_t sub_100060274()
{
  int v1 = *(unsigned __int8 *)(v0 + 33);
  if (v1 == 2)
  {
    char v2 = dispatch thunk of Message.isRead.getter();
    *(unsigned char *)(v0 + 33) = v2 & 1;
  }
  else
  {
    char v2 = v1 & 1;
  }
  return v2 & 1;
}

void sub_100060454()
{
  uint64_t v1 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100017E2C((uint64_t *)&unk_1000BB958);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1000606F4() == 2
    && (dispatch thunk of Message.isRTT.getter() & 1) != 0
    && TUCallScreeningRTTEnabled())
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript) == 1 && sub_1000608EC())
    {
      self;
      uint64_t v7 = (void *)swift_dynamicCastObjCClass();
      if (v7)
      {
        id v8 = [v7 conversation];
        swift_unknownObjectRelease();
        if (v8)
        {
          id v9 = [v8 utterances];

          if (v9)
          {
            [v9 count];
          }
          else
          {
            __break(1u);
          }
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    int v10 = sub_1000606F4();
    if (v10)
    {
      if (v10 == 1) {
        return;
      }
      sub_10006095C((uint64_t)v6);
      uint64_t v14 = type metadata accessor for Transcript();
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v6, 1, v14);
      unint64_t v12 = (uint64_t *)&unk_1000BB958;
      uint64_t v13 = (uint64_t)v6;
    }
    else
    {
      sub_1000612A0(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v3);
      uint64_t v11 = type metadata accessor for URL();
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v3, 1, v11);
      unint64_t v12 = (uint64_t *)&unk_1000BAD70;
      uint64_t v13 = (uint64_t)v3;
    }
    sub_100017EC0(v13, v12);
  }
}

uint64_t sub_1000606F4()
{
  unsigned __int16 v0 = dispatch thunk of Message.messageType.getter();
  if (v0 < 3u) {
    return 0x10002u >> (8 * v0);
  }
  if (qword_1000BA720 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100011408(v2, (uint64_t)qword_1000BD4E8);
  swift_retain_n();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    dispatch thunk of Message.messageType.getter();
    uint64_t v6 = String.init<A>(describing:)();
    sub_10001AFF8(v6, v7, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unexpected Message type %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  return 0;
}

uint64_t sub_1000608EC()
{
  uint64_t v1 = OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript);
  uint64_t v3 = v2;
  if (v2 == 1)
  {
    uint64_t v3 = (uint64_t)sub_100061BB8(v0);
    uint64_t v4 = *(void *)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    swift_unknownObjectRetain();
    sub_100063C2C(v4);
  }
  sub_100063C3C(v2);
  return v3;
}

uint64_t sub_10006095C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100017E2C(&qword_1000BBA68);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptData;
  swift_beginAccess();
  sub_100017F1C(v9, (uint64_t)v8, &qword_1000BBA68);
  uint64_t v10 = sub_100017E2C((uint64_t *)&unk_1000BB958);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_100017F80((uint64_t)v8, a1, (uint64_t *)&unk_1000BB958);
  }
  sub_100017EC0((uint64_t)v8, &qword_1000BBA68);
  dispatch thunk of Message.transcript.getter();
  sub_100017F1C(a1, (uint64_t)v6, (uint64_t *)&unk_1000BB958);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_100063CA4((uint64_t)v6, v9, &qword_1000BBA68);
  return swift_endAccess();
}

uint64_t sub_100060C08()
{
  int v1 = *(unsigned __int8 *)(v0 + 34);
  if (v1 != 2) {
    return v1 & 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(v0 + 34) = 0;
  return result;
}

uint64_t sub_100060D80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_100017E2C(&qword_1000BBA70);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = v1 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___dataURL;
  swift_beginAccess();
  sub_100017F1C(v16, (uint64_t)v15, &qword_1000BBA70);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3) == 1)
  {
    sub_100017EC0((uint64_t)v15, &qword_1000BBA70);
    id v17 = (void *)dispatch thunk of Message.sandboxMessageFile.getter();
    id v18 = (void *)dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter();

    if (v18)
    {
      uint64_t v28 = a1;
      uint64_t v19 = type metadata accessor for URL();
      uint64_t v27 = *(void *)(v19 - 8);
      char v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
      v20(v7, 1, 1, v19);
      sub_100063D08(&qword_1000BBA78, (void (*)(uint64_t))&type metadata accessor for URL);
      dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();

      id v21 = v20;
      uint64_t v22 = v27;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v7, 1, v19) == 1)
      {
        NSString v23 = v9;
        uint64_t v24 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v9, v7, v19);
        NSString v23 = v9;
        uint64_t v24 = 0;
      }
      v21(v23, v24, 1, v19);
      a1 = v28;
    }
    else
    {
      uint64_t v25 = type metadata accessor for URL();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v9, 1, 1, v25);
    }
    sub_100017F1C((uint64_t)v9, (uint64_t)v13, (uint64_t *)&unk_1000BAD70);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
    swift_beginAccess();
    sub_100063CA4((uint64_t)v13, v16, &qword_1000BBA70);
    swift_endAccess();
  }
  else
  {
    uint64_t v9 = v15;
  }
  return sub_100017F80((uint64_t)v9, a1, (uint64_t *)&unk_1000BAD70);
}

uint64_t sub_1000612A0@<X0>(void *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v6 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = sub_100017E2C(&qword_1000BBA70);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v18 = (char *)&v32 - v17;
  uint64_t v19 = v3 + *a1;
  swift_beginAccess();
  sub_100017F1C(v19, (uint64_t)v18, &qword_1000BBA70);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v18, 1, v6) == 1)
  {
    uint64_t v20 = sub_100017EC0((uint64_t)v18, &qword_1000BBA70);
    uint64_t v21 = a2(v20);
    if (v21
      && (uint64_t v22 = (void *)v21,
          NSString v23 = (void *)dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter(),
          v22,
          v23))
    {
      uint64_t v24 = type metadata accessor for URL();
      uint64_t v25 = *(void *)(v24 - 8);
      uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
      v32(v10, 1, 1, v24);
      sub_100063D08(&qword_1000BBA78, (void (*)(uint64_t))&type metadata accessor for URL);
      dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();

      int v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v24);
      uint64_t v27 = v33;
      if (v26 == 1)
      {
        uint64_t v28 = v12;
        uint64_t v29 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v12, v10, v24);
        uint64_t v28 = v12;
        uint64_t v29 = 0;
      }
      v32(v28, v29, 1, v24);
    }
    else
    {
      uint64_t v30 = type metadata accessor for URL();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v12, 1, 1, v30);
      uint64_t v27 = v33;
    }
    sub_100017F1C((uint64_t)v12, (uint64_t)v16, (uint64_t *)&unk_1000BAD70);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
    swift_beginAccess();
    sub_100063CA4((uint64_t)v16, v19, &qword_1000BBA70);
    swift_endAccess();
  }
  else
  {
    uint64_t v12 = v18;
    uint64_t v27 = v33;
  }
  return sub_100017F80((uint64_t)v12, v27, (uint64_t *)&unk_1000BAD70);
}

uint64_t sub_10006168C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_100017E2C(&qword_1000BBA70);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  sub_100017F80((uint64_t)v13, (uint64_t)v9, (uint64_t *)&unk_1000BAD70);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  uint64_t v16 = a1 + *a4;
  swift_beginAccess();
  swift_retain();
  sub_100063CA4((uint64_t)v9, v16, &qword_1000BBA70);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1000618B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  LOBYTE(a3) = a3(v4);
  swift_release();
  return a3 & 1;
}

uint64_t sub_100061914(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  LOBYTE(a3) = a3(v4);
  swift_release();
  return a3 & 1;
}

id sub_100061954()
{
  uint64_t v0 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100060D80((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_100017EC0((uint64_t)v2, (uint64_t *)&unk_1000BAD70);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    id v8 = [self defaultManager];
    URL.path.getter();
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v7 = [v8 fileExistsAtPath:v9];

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v7;
}

id sub_100061BB8(uint64_t a1)
{
  uint64_t v2 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  uint64_t v3 = __chkstk_darwin(v2);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v41 - v4;
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v46 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100017E2C((uint64_t *)&unk_1000BB958);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Transcript();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  id v44 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v43 = (char *)&v41 - v15;
  uint64_t v16 = type metadata accessor for UUID();
  uint64_t v42 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = a1;
  int v19 = sub_1000606F4();
  if (!v19)
  {
    uint64_t v24 = v8;
    sub_1000612A0(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v5);
    uint64_t v25 = v46;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v5, 1, v6) == 1)
    {
      sub_100017EC0((uint64_t)v5, (uint64_t *)&unk_1000BAD70);
      id v20 = 0;
      uint64_t v21 = v47;
      goto LABEL_13;
    }
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v8, v5, v6);
    uint64_t v33 = Data.init(contentsOf:options:)();
    unint64_t v35 = v34;
    sub_1000175C8(0, &qword_1000BBA58);
    sub_1000175C8(0, &qword_1000BBA60);
    uint64_t v36 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    uint64_t v21 = v47;
    uint64_t v38 = v36;
    if (v36)
    {
      uint64_t v39 = (objc_class *)type metadata accessor for VisualTranscriptionMessage();
      id v40 = (char *)objc_allocWithZone(v39);
      *(void *)&v40[OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript] = v38;
      v49.receiver = v40;
      v49.super_class = v39;
      id v20 = [super init];
      sub_100063C4C(v33, v35);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v6);
    sub_100063C4C(v33, v35);
    goto LABEL_12;
  }
  id v20 = 0;
  uint64_t v21 = v47;
  if (v19 != 1)
  {
    if ((dispatch thunk of Message.isRTT.getter() & 1) != 0 && TUCallScreeningRTTEnabled())
    {
      dispatch thunk of Message.callUUID.getter();
      id v22 = objc_allocWithZone((Class)MPRTTTranscriptionMessage);
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      id v20 = [v22 initWithCallUUID:isa];

      (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v16);
      goto LABEL_13;
    }
    sub_10006095C((uint64_t)v11);
    uint64_t v26 = v45;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v11, 1, v12) != 1)
    {
      uint64_t v27 = v43;
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v43, v11, v12);
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
      uint64_t v29 = v44;
      v28(v44, v27, v12);
      uint64_t v30 = (objc_class *)type metadata accessor for FTTranscriptionMessage(0);
      uint64_t v31 = (char *)objc_allocWithZone(v30);
      *(void *)&v31[OBJC_IVAR____TtC8FaceTime22FTTranscriptionMessage_confidenceRating] = 0;
      *(void *)&v31[OBJC_IVAR____TtC8FaceTime22FTTranscriptionMessage_confidence] = 0x3FF0000000000000;
      v28(&v31[OBJC_IVAR____TtC8FaceTime22FTTranscriptionMessage_transcriptData], v29, v12);
      v48.receiver = v31;
      v48.super_class = v30;
      id v20 = [super init];
      uint64_t v32 = *(void (**)(char *, uint64_t))(v26 + 8);
      v32(v29, v12);
      v32(v27, v12);
      goto LABEL_13;
    }
    sub_100017EC0((uint64_t)v11, (uint64_t *)&unk_1000BB958);
LABEL_12:
    id v20 = 0;
  }
LABEL_13:
  *(unsigned char *)(v21 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript) = 1;
  return v20;
}

uint64_t sub_100062458()
{
  sub_100017EC0(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___dataURL, &qword_1000BBA70);
  sub_100017EC0(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___thumbnailURL, &qword_1000BBA70);
  sub_100017EC0(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, &qword_1000BBA70);
  sub_100017EC0(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptData, &qword_1000BBA68);
  sub_100063C2C(*(void *)(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript));

  return swift_deallocClassInstance();
}

uint64_t sub_100062528()
{
  return type metadata accessor for FTMessage(0);
}

uint64_t type metadata accessor for FTMessage(uint64_t a1)
{
  return sub_1000566FC(a1, (uint64_t *)&unk_1000BB930);
}

void sub_100062550()
{
  sub_100062674(319, (unint64_t *)&unk_1000BB940, (uint64_t *)&unk_1000BAD70);
  if (v0 <= 0x3F)
  {
    sub_100062674(319, &qword_1000BB950, (uint64_t *)&unk_1000BB958);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100062674(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_10001A4F4(a3);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

BOOL sub_1000626C4(double a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty))
  {
    if ((sub_100060274() & 1) == 0) {
      goto LABEL_3;
    }
    return 0;
  }
  if (dispatch thunk of Message.isRead.getter()) {
    return 0;
  }
LABEL_3:
  if (a1 > 5.0) {
    return 1;
  }
  dispatch thunk of Message.duration.getter();
  return v4 / 3.0 < a1;
}

id sub_100062794(void *a1)
{
  if (dispatch thunk of Message.isFromUnknown.getter()) {
    return 0;
  }
  dispatch thunk of Message.from.getter();
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 normalizedHandleWithDestinationID:v3];

  if (!v4) {
    return 0;
  }
  id v5 = [v4 normalizedValue];
  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10) {
    return 0;
  }
  dispatch thunk of Message.from.getter();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  sub_100017E2C(&qword_1000BAD60);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v13 = [a1 contactForDestinationId:v11 keysToFetch:isa];

  return v13;
}

uint64_t sub_100062990(void *a1)
{
  uint64_t v2 = dispatch thunk of Message.from.getter();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  sub_100017E2C(&qword_1000BADE0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10007E5C0;
  uint64_t v7 = self;
  *(void *)(v6 + 32) = [v7 descriptorForRequiredKeysForStyle:0];
  specialized Array._endMutation()();
  id v8 = sub_100062794(a1);
  swift_bridgeObjectRelease();
  if (!v8) {
    return sub_100062B10();
  }
  if (([v8 isSuggested] & 1) == 0)
  {
    id v10 = [v7 stringFromContact:v8 style:0];
    if (v10)
    {
      NSString v11 = v10;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      return v9;
    }

    return 0;
  }
  uint64_t v9 = sub_100062B10();

  return v9;
}

uint64_t sub_100062B10()
{
  unint64_t v0 = self;
  dispatch thunk of Message.from.getter();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 normalizedHandleWithDestinationID:v1];

  if (!v2) {
    return 0;
  }
  id v3 = [v2 normalizedValue];
  id v4 = [v2 isoCountryCode];
  id v5 = (id)TUFormattedPhoneNumber();

  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v6;
}

uint64_t sub_100062CA8()
{
  uint64_t v154 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  __chkstk_darwin(v154);
  uint64_t v153 = (uint64_t)v146 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v151 = *(void *)(v2 - 8);
  uint64_t v152 = v2;
  __chkstk_darwin(v2);
  v150 = (char *)v146 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_100017E2C(&qword_1000BAF20);
  __chkstk_darwin(v149);
  v147 = (char *)v146 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v146 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSString v11 = (char *)v146 - v10;
  uint64_t v158 = 0;
  unint64_t v159 = 0xE000000000000000;
  _StringGuts.grow(_:)(699);
  v12._countAndFlagsBits = 0xD00000000000001ALL;
  uint64_t v148 = 0xD00000000000001ALL;
  v12._object = (void *)0x8000000100082F90;
  String.append(_:)(v12);
  id v13 = *(id *)(v0 + 16);
  id v14 = [v13 description];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  v18._countAndFlagsBits = v15;
  v18._object = v17;
  String.append(_:)(v18);

  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 0x3A6469202020200ALL;
  v19._object = (void *)0xE900000000000020;
  String.append(_:)(v19);
  dispatch thunk of Message.recordUUID.getter();
  id v20 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v20(v9, v11, v5);
  uint64_t v21 = (objc_class *)type metadata accessor for MessageID(0);
  id v22 = (char *)objc_allocWithZone(v21);
  v20(&v22[OBJC_IVAR___MPMessageID_value], v9, v5);
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v157.receiver = v22;
  v157.super_class = v21;
  id v23 = [super init];
  uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24(v9, v5);
  v24(v11, v5);
  id v25 = [v23 description];
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;

  v29._countAndFlagsBits = v26;
  v29._object = v28;
  String.append(_:)(v29);

  swift_bridgeObjectRelease();
  v30._countAndFlagsBits = 0x6F7270202020200ALL;
  v30._object = (void *)0xEF203A7265646976;
  String.append(_:)(v30);
  v31._countAndFlagsBits = dispatch thunk of Message.provider.getter();
  String.append(_:)(v31);
  swift_bridgeObjectRelease();
  v32._countAndFlagsBits = 0x6C6163202020200ALL;
  v32._object = (void *)0xEF203A444955556CLL;
  String.append(_:)(v32);
  uint64_t v33 = v147;
  dispatch thunk of Message.callUUID.getter();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v33, 0, 1, v5);
  uint64_t v34 = v146[1];
  v35._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v35);
  swift_bridgeObjectRelease();
  v36._countAndFlagsBits = 0xD000000000000012;
  v36._object = (void *)0x8000000100082FB0;
  String.append(_:)(v36);
  uint64_t v155 = sub_10005FC60();
  _print_unlocked<A, B>(_:_:)();
  v37._object = (void *)0x8000000100082FD0;
  v37._countAndFlagsBits = v148;
  String.append(_:)(v37);
  uint64_t v155 = sub_10005FED4((SEL *)&selRef_normalizedValue);
  uint64_t v156 = v38;
  sub_100017E2C(&qword_1000BBA30);
  v39._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v39);
  swift_bridgeObjectRelease();
  v40._countAndFlagsBits = 0xD00000000000001BLL;
  v40._object = (void *)0x8000000100082FF0;
  String.append(_:)(v40);
  uint64_t v155 = sub_10005FED4((SEL *)&selRef_isoCountryCode);
  uint64_t v156 = v41;
  v42._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  v43._object = (void *)0x8000000100083010;
  v43._countAndFlagsBits = 0xD00000000000001CLL;
  String.append(_:)(v43);
  uint64_t v155 = sub_10005FFF4((SEL *)&selRef_normalizedValue);
  uint64_t v156 = v44;
  v45._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v45);
  swift_bridgeObjectRelease();
  v46._countAndFlagsBits = 0xD00000000000001DLL;
  v46._object = (void *)0x8000000100083030;
  String.append(_:)(v46);
  uint64_t v155 = sub_10005FFF4((SEL *)&selRef_isoCountryCode);
  uint64_t v156 = v47;
  v48._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v48);
  swift_bridgeObjectRelease();
  v49._object = (void *)0x8000000100083050;
  v49._countAndFlagsBits = 0xD00000000000001CLL;
  String.append(_:)(v49);
  char v50 = dispatch thunk of Message.isFromUnknown.getter();
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  if ((v50 & 1) == 0) {
    uint64_t v51 = dispatch thunk of Message.from.getter();
  }
  uint64_t v155 = v51;
  uint64_t v156 = v52;
  v53._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v53);
  swift_bridgeObjectRelease();
  v54._countAndFlagsBits = 0xD000000000000012;
  v54._object = (void *)0x8000000100083070;
  String.append(_:)(v54);
  uint64_t v155 = sub_100060150();
  _print_unlocked<A, B>(_:_:)();
  v55._countAndFlagsBits = 0x6C6F66202020200ALL;
  v55._object = (void *)0xED0000203A726564;
  String.append(_:)(v55);
  uint64_t v56 = OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty;
  if (*(unsigned char *)(v34 + OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty) == 1)
  {
    uint64_t v57 = *(void *)(v34 + 24);
  }
  else
  {
    int v58 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
    uint64_t v59 = 1;
    if (v58 == 2) {
      uint64_t v59 = 2;
    }
    BOOL v62 = v58 == 1;
    uint64_t v57 = 3;
    if (!v62) {
      uint64_t v57 = v59;
    }
  }
  uint64_t v155 = v57;
  _print_unlocked<A, B>(_:_:)();
  v60._object = (void *)0x8000000100083090;
  v60._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v60);
  char v61 = sub_100060274();
  BOOL v62 = (v61 & 1) == 0;
  if (v61) {
    uint64_t v63 = 1702195828;
  }
  else {
    uint64_t v63 = 0x65736C6166;
  }
  if (v62) {
    unint64_t v64 = 0xE500000000000000;
  }
  else {
    unint64_t v64 = 0xE400000000000000;
  }
  unint64_t v65 = v64;
  String.append(_:)(*(Swift::String *)&v63);
  swift_bridgeObjectRelease();
  v66._countAndFlagsBits = 0x616572202020200ALL;
  v66._object = (void *)0xEB00000000203A64;
  String.append(_:)(v66);
  int v67 = *(unsigned __int8 *)(v34 + v56);
  uint64_t v149 = v56;
  if (v67 == 1) {
    char v68 = *(unsigned char *)(v34 + 33) & 1;
  }
  else {
    char v68 = dispatch thunk of Message.isRead.getter();
  }
  BOOL v69 = (v68 & 1) == 0;
  if (v68) {
    uint64_t v70 = 1702195828;
  }
  else {
    uint64_t v70 = 0x65736C6166;
  }
  if (v69) {
    unint64_t v71 = 0xE500000000000000;
  }
  else {
    unint64_t v71 = 0xE400000000000000;
  }
  unint64_t v72 = v71;
  String.append(_:)(*(Swift::String *)&v70);
  swift_bridgeObjectRelease();
  v73._object = (void *)0xEB00000000203A65;
  v73._countAndFlagsBits = 0x746164202020200ALL;
  String.append(_:)(v73);
  uint64_t v74 = v150;
  dispatch thunk of Message.dateCreated.getter();
  sub_100063D08(&qword_1000BBA38, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v75 = v152;
  v76._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v76);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v151 + 8))(v74, v75);
  v77._countAndFlagsBits = 0xD00000000000001FLL;
  v77._object = (void *)0x80000001000830B0;
  String.append(_:)(v77);
  sub_100060454();
  BOOL v79 = (v78 & 1) == 0;
  if (v78) {
    uint64_t v80 = 1702195828;
  }
  else {
    uint64_t v80 = 0x65736C6166;
  }
  if (v79) {
    unint64_t v81 = 0xE500000000000000;
  }
  else {
    unint64_t v81 = 0xE400000000000000;
  }
  unint64_t v82 = v81;
  String.append(_:)(*(Swift::String *)&v80);
  swift_bridgeObjectRelease();
  v83._countAndFlagsBits = 0x727564202020200ALL;
  v83._object = (void *)0xEF203A6E6F697461;
  String.append(_:)(v83);
  dispatch thunk of Message.duration.getter();
  Double.write<A>(to:)();
  v84._countAndFlagsBits = 0xD00000000000001BLL;
  v84._object = (void *)0x80000001000830D0;
  String.append(_:)(v84);
  v85._countAndFlagsBits = 0x65736C6166;
  v85._object = (void *)0xE500000000000000;
  String.append(_:)(v85);
  v86._countAndFlagsBits = 0xD000000000000015;
  v86._object = (void *)0x80000001000830F0;
  String.append(_:)(v86);
  v87._countAndFlagsBits = 0x65736C6166;
  v87._object = (void *)0xE500000000000000;
  String.append(_:)(v87);
  v88._countAndFlagsBits = 0xD00000000000001DLL;
  v88._object = (void *)0x8000000100083110;
  String.append(_:)(v88);
  dispatch thunk of Message.transcriptionStatus.getter();
  int v89 = (unsigned __int16)TranscriptionStatus.rawValue.getter();
  unsigned __int16 v90 = TranscriptionStatus.rawValue.getter();
  BOOL v91 = v89 == v90;
  if (v89 == v90) {
    uint64_t v92 = 0x65736C6166;
  }
  else {
    uint64_t v92 = 1702195828;
  }
  if (v91) {
    unint64_t v93 = 0xE500000000000000;
  }
  else {
    unint64_t v93 = 0xE400000000000000;
  }
  unint64_t v94 = v93;
  String.append(_:)(*(Swift::String *)&v92);
  swift_bridgeObjectRelease();
  v95._object = (void *)0x8000000100083130;
  v95._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v95);
  dispatch thunk of Message.mailboxType.getter();
  int v96 = (unsigned __int16)MailboxType.rawValue.getter();
  unsigned __int16 v97 = MailboxType.rawValue.getter();
  BOOL v98 = v96 == v97;
  if (v96 == v97) {
    uint64_t v99 = 1702195828;
  }
  else {
    uint64_t v99 = 0x65736C6166;
  }
  if (v98) {
    unint64_t v100 = 0xE400000000000000;
  }
  else {
    unint64_t v100 = 0xE500000000000000;
  }
  unint64_t v101 = v100;
  String.append(_:)(*(Swift::String *)&v99);
  swift_bridgeObjectRelease();
  v102._object = (void *)0x8000000100083150;
  v102._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v102);
  char v103 = sub_100060C08();
  BOOL v104 = (v103 & 1) == 0;
  if (v103) {
    uint64_t v105 = 1702195828;
  }
  else {
    uint64_t v105 = 0x65736C6166;
  }
  if (v104) {
    unint64_t v106 = 0xE500000000000000;
  }
  else {
    unint64_t v106 = 0xE400000000000000;
  }
  unint64_t v107 = v106;
  String.append(_:)(*(Swift::String *)&v105);
  swift_bridgeObjectRelease();
  v108._countAndFlagsBits = 0xD000000000000012;
  v108._object = (void *)0x8000000100083170;
  String.append(_:)(v108);
  char v109 = dispatch thunk of Message.isSensitive.getter();
  BOOL v110 = (v109 & 1) == 0;
  if (v109) {
    uint64_t v111 = 1702195828;
  }
  else {
    uint64_t v111 = 0x65736C6166;
  }
  if (v110) {
    unint64_t v112 = 0xE500000000000000;
  }
  else {
    unint64_t v112 = 0xE400000000000000;
  }
  unint64_t v113 = v112;
  String.append(_:)(*(Swift::String *)&v111);
  swift_bridgeObjectRelease();
  v114._countAndFlagsBits = 0x746164202020200ALL;
  v114._object = (void *)0xEE00203A4C525561;
  String.append(_:)(v114);
  uint64_t v115 = v153;
  sub_100060D80(v153);
  v116._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v116);
  swift_bridgeObjectRelease();
  v117._countAndFlagsBits = 0xD000000000000013;
  v117._object = (void *)0x8000000100083190;
  String.append(_:)(v117);
  sub_1000612A0(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, v115);
  v118._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v118);
  swift_bridgeObjectRelease();
  v119._object = (void *)0x80000001000831B0;
  v119._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v119);
  sub_1000612A0(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, v115);
  v120._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v120);
  swift_bridgeObjectRelease();
  v121._countAndFlagsBits = 0x527369202020200ALL;
  v121._object = (void *)0xEC000000203A5454;
  String.append(_:)(v121);
  char v122 = dispatch thunk of Message.isRTT.getter();
  BOOL v123 = (v122 & 1) == 0;
  if (v122) {
    uint64_t v124 = 1702195828;
  }
  else {
    uint64_t v124 = 0x65736C6166;
  }
  if (v123) {
    unint64_t v125 = 0xE500000000000000;
  }
  else {
    unint64_t v125 = 0xE400000000000000;
  }
  unint64_t v126 = v125;
  String.append(_:)(*(Swift::String *)&v124);
  swift_bridgeObjectRelease();
  v127._countAndFlagsBits = 0xD000000000000016;
  v127._object = (void *)0x80000001000831D0;
  String.append(_:)(v127);
  unsigned __int8 v128 = sub_100061954();
  BOOL v129 = (v128 & 1) == 0;
  if (v128) {
    uint64_t v130 = 1702195828;
  }
  else {
    uint64_t v130 = 0x65736C6166;
  }
  if (v129) {
    unint64_t v131 = 0xE500000000000000;
  }
  else {
    unint64_t v131 = 0xE400000000000000;
  }
  unint64_t v132 = v131;
  String.append(_:)(*(Swift::String *)&v130);
  swift_bridgeObjectRelease();
  v133._countAndFlagsBits = 0xD000000000000011;
  v133._object = (void *)0x80000001000831F0;
  String.append(_:)(v133);
  uint64_t v155 = sub_1000608EC();
  sub_100017E2C(&qword_1000BBA40);
  v134._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v134);
  swift_bridgeObjectRelease();
  v135._countAndFlagsBits = 0xD000000000000018;
  v135._object = (void *)0x8000000100083210;
  String.append(_:)(v135);
  if (*(unsigned char *)(v34 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript)) {
    uint64_t v136 = 1702195828;
  }
  else {
    uint64_t v136 = 0x65736C6166;
  }
  if (*(unsigned char *)(v34 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript)) {
    unint64_t v137 = 0xE400000000000000;
  }
  else {
    unint64_t v137 = 0xE500000000000000;
  }
  unint64_t v138 = v137;
  String.append(_:)(*(Swift::String *)&v136);
  swift_bridgeObjectRelease();
  v139._countAndFlagsBits = 0x447369202020200ALL;
  v139._object = (void *)0xEE00203A79747269;
  String.append(_:)(v139);
  if (*(unsigned char *)(v34 + v149)) {
    uint64_t v140 = 1702195828;
  }
  else {
    uint64_t v140 = 0x65736C6166;
  }
  if (*(unsigned char *)(v34 + v149)) {
    unint64_t v141 = 0xE400000000000000;
  }
  else {
    unint64_t v141 = 0xE500000000000000;
  }
  unint64_t v142 = v141;
  String.append(_:)(*(Swift::String *)&v140);
  swift_bridgeObjectRelease();
  v143._object = (void *)0x8000000100083230;
  v143._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v143);
  LOBYTE(v155) = sub_1000606F4();
  _print_unlocked<A, B>(_:_:)();
  v144._countAndFlagsBits = 0x202020202020200ALL;
  v144._object = (void *)0xEA00000000002920;
  String.append(_:)(v144);
  return v158;
}

uint64_t sub_100063AB8()
{
  return sub_100062CA8();
}

uint64_t sub_100063ADC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100017E2C((uint64_t *)&unk_1000BBA48);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  Swift::String v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100063C2C(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100063C3C(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_100063C4C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100063CA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100017E2C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_100063D08(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *initializeBufferWithCopyOfBuffer for FTMessageSource(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FTMessageSource(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FTMessageSource(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100063EBCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_100063EE4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FTMessageSource()
{
  return &type metadata for FTMessageSource;
}

unint64_t sub_100063F00()
{
  unint64_t result = qword_1000BBA80;
  if (!qword_1000BBA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BBA80);
  }
  return result;
}

id sub_100064054()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OrientationMonitorKeys();
  return [super dealloc];
}

uint64_t type metadata accessor for OrientationMonitorKeys()
{
  return self;
}

NSString sub_1000640B0()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000BD560 = (uint64_t)result;
  return result;
}

unint64_t sub_1000640E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100017E2C(&qword_1000BBB40);
  objc_super v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    BOOL v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100059230(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    size_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *size_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

uint64_t sub_100064204(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100017E2C(&qword_1000BBB48);
    objc_super v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    Swift::String v19 = *(void **)(*(void *)(a1 + 56) + 8 * v12);
    *(void *)&v37[0] = *v17;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    v19;
    swift_dynamicCast();
    sub_1000650B4();
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10004E1B0(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10004E1B0(v36, v37);
    sub_10004E1B0(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_10004E1B0(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_100017604();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_1000645B8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100017E2C(&qword_1000BBB50);
    objc_super v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_100017604();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    int64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_100059230(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      BOOL v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *BOOL v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    char v23 = (uint64_t *)(v2[6] + 16 * v20);
    *char v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_10006485C()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  char v0 = sub_100064908();
  swift_release();
  swift_release();
  return v0 & 1;
}

uint64_t sub_100064908()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  swift_release();
  return v1;
}

uint64_t sub_100064998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_10000913C(a3);
  swift_release();

  return swift_release();
}

uint64_t sub_100064A58(uint64_t a1, uint64_t a2)
{
  return sub_1000099C4(a1, a2, 42, (uint64_t (*)(uint64_t))sub_100064A74);
}

uint64_t sub_100064A74()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v1 = *(unsigned __int8 *)(v0 + 40);
  swift_release();
  if (v1 == 1)
  {
    uint64_t v2 = sub_100064CFC();
  }
  else
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v2 = *(void *)(v0 + 32);
    swift_release();
  }
  swift_release();
  return v2;
}

uint64_t sub_100064BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 32) = a3;
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_100064CFC()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + *(void *)(*(void *)v0 + 168));
  swift_release();
  return v1;
}

unint64_t sub_100064DA0()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017E2C(qword_1000BAE88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10007E050;
  *(void *)(inited + 32) = 0xD00000000000001FLL;
  *(void *)(inited + 40) = 0x8000000100081CF0;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 56) = 0xD000000000000023;
  *(void *)(inited + 64) = 0x8000000100081D10;
  sub_100064A74();
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0xD000000000000020;
  *(void *)(inited + 88) = 0x8000000100081D40;
  sub_100008F8C();
  *(NSNumber *)(inited + 96) = Int._bridgeToObjectiveC()();
  unint64_t v1 = sub_1000640E8(inited);
  swift_release();
  return v1;
}

uint64_t *sub_100064F44()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (uint64_t)v0 + qword_1000BBAB8;
  uint64_t v3 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 152));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 160));
  return v0;
}

uint64_t sub_10006505C()
{
  sub_100064F44();

  return swift_deallocClassInstance();
}

unint64_t sub_1000650B4()
{
  unint64_t result = qword_1000BAF88;
  if (!qword_1000BAF88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000BAF88);
  }
  return result;
}

uint64_t sub_1000650F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_1000651B8()
{
  return type metadata accessor for SpringBoardOrientationObserver();
}

uint64_t getEnumTagSinglePayload for SpringBoardOrientationObserver.OrientationStatus(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SpringBoardOrientationObserver.OrientationStatus(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_100065210(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10006522C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SpringBoardOrientationObserver.OrientationStatus()
{
  return &type metadata for SpringBoardOrientationObserver.OrientationStatus;
}

uint64_t sub_1000654D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100017E2C(&qword_1000BB288);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v13[-v7];
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = v1 + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration;
  swift_beginAccess();
  sub_1000556F8(v9, (uint64_t)v8);
  uint64_t v10 = type metadata accessor for UIListContentConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_100055760((uint64_t)v8);
    sub_10006570C();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
    swift_beginAccess();
    sub_1000557C0((uint64_t)v6, v9);
    swift_endAccess();
  }
  else
  {
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  return swift_release();
}

uint64_t sub_10006570C()
{
  uint64_t v0 = sub_100017E2C(&qword_1000BB290);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = type metadata accessor for UIBackgroundConfiguration();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  UITableViewCell.defaultContentConfiguration()();
  static UIBackgroundConfiguration.listCell()();
  uint64_t v7 = self;
  id v8 = [v7 whiteColor];
  UIBackgroundConfiguration.backgroundColor.setter();
  uint64_t v9 = self;
  id v10 = [self effectWithStyle:8];
  id v11 = [v9 _effectForBlurEffect:v10 vibrancyStyle:112];

  UIBackgroundConfiguration.visualEffect.setter();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v2, v6, v3);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  UITableViewCell.backgroundConfiguration.setter();
  id v12 = [self mainBundle];
  v21._object = (void *)0xE000000000000000;
  v13._object = (void *)0x80000001000837E0;
  v13._countAndFlagsBits = 0xD000000000000025;
  v14.value._countAndFlagsBits = 0x746E656365524850;
  v14.value._object = (void *)0xE900000000000073;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v21._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v21);

  UIListContentConfiguration.text.setter();
  id v16 = [v7 systemRedColor];
  uint64_t v17 = (void (*)(unsigned char *, void))UIListContentConfiguration.textProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v17(v20, 0);
  uint64_t v18 = (void (*)(unsigned char *, void))UIListContentConfiguration.textProperties.modify();
  UIListContentConfiguration.TextProperties.adjustsFontForContentSizeCategory.setter();
  v18(v20, 0);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

id sub_100065A38()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView);
  }
  else
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [self systemImageNamed:v4];

    id v6 = [objc_allocWithZone((Class)UIImageView) initWithImage:v5];
    id v7 = [self systemBlackColor];
    [v6 setTintColor:v7];

    id v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  swift_release();
  return v3;
}

id sub_100065BAC()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView);
  }
  else
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [self systemImageNamed:v4];

    id v6 = [objc_allocWithZone((Class)UIImageView) initWithImage:v5];
    id v7 = [self systemRedColor];
    [v6 setTintColor:v7];

    id v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  swift_release();
  return v3;
}

void sub_100065D24(uint64_t a1, int a2, uint64_t a3)
{
  NSString v4 = v3;
  int v63 = a2;
  uint64_t v7 = sub_100017E2C(&qword_1000BB288);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for UIListContentConfiguration();
  uint64_t v62 = *(void *)(v64 - 8);
  uint64_t v10 = __chkstk_darwin(v64);
  uint64_t v59 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  Swift::String_optional v14 = (char *)&v58 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v58 - v16;
  __chkstk_darwin(v15);
  id v19 = (char *)&v58 - v18;
  type metadata accessor for MainActor();
  uint64_t v60 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v20 = self;
  Swift::String v21 = &selRef_systemWhiteColor;
  if (a3 != 2) {
    Swift::String v21 = &selRef_systemBlackColor;
  }
  id v61 = [v20 *v21];
  if (a1 == 1)
  {
    id v22 = [self mainBundle];
    if (v63)
    {
      unint64_t v23 = 0xD00000000000002BLL;
      unint64_t v56 = 0xE000000000000000;
      uint64_t v24 = "REPORT_BLOCK_FACETIME_ALERT_UNBLOCK_UNKNOWN";
    }
    else
    {
      unint64_t v23 = 0xD000000000000029;
      unint64_t v56 = 0xE000000000000000;
      uint64_t v24 = "REPORT_BLOCK_FACETIME_ALERT_BLOCK_UNKNOWN";
    }
    unint64_t v28 = (unint64_t)(v24 - 32) | 0x8000000000000000;
    v29.value._countAndFlagsBits = 0x746E656365524850;
    v29.value._object = (void *)0xE900000000000073;
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    uint64_t v31 = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v23, v29, (NSBundle)v22, v30, *(Swift::String *)(&v56 - 1));

    sub_1000654D8((uint64_t)v14);
    UIListContentConfiguration.text.setter();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v32 = v62;
    long long v33 = *(void (**)(char *, char *, uint64_t))(v62 + 32);
    uint64_t v34 = v64;
    v33(v9, v14, v64);
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v32 + 56);
    uint64_t v62 = v32 + 56;
    int v58 = v35;
    ((void (*)(char *, void, uint64_t, uint64_t))v35)(v9, 0, 1, v34);
    uint64_t v36 = (uint64_t)v4 + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration;
    swift_beginAccess();
    sub_1000557C0((uint64_t)v9, v36);
    swift_endAccess();
    swift_release();
    if (v63) {
      id v37 = v61;
    }
    else {
      id v38 = [self systemRedColor];
    }
    sub_1000654D8((uint64_t)v59);
    Swift::String v39 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v39(v65, 0);
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v40 = v64;
    v33(v9, v59, v64);
    ((void (*)(char *, void, uint64_t, uint64_t))v58)(v9, 0, 1, v40);
  }
  else
  {
    if (a1)
    {
      v65[0] = a1;
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      return;
    }
    id v25 = [self mainBundle];
    if (v63)
    {
      unint64_t v26 = 0xD000000000000027;
      unint64_t v57 = 0xE000000000000000;
      unint64_t v27 = 0x8000000100083810;
    }
    else
    {
      unint64_t v57 = 0xE000000000000000;
      unint64_t v27 = 0x80000001000837E0;
      unint64_t v26 = 0xD000000000000025;
    }
    v41.value._countAndFlagsBits = 0x746E656365524850;
    v41.value._object = (void *)0xE900000000000073;
    v42._countAndFlagsBits = 0;
    v42._object = (void *)0xE000000000000000;
    uint64_t v43 = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v26, v41, (NSBundle)v25, v42, *(Swift::String *)(&v57 - 1));

    sub_1000654D8((uint64_t)v19);
    UIListContentConfiguration.text.setter();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v44 = v62;
    uint64_t v45 = v64;
    int v58 = *(void (**)(char *, char *, uint64_t))(v62 + 32);
    v58(v9, v19, v64);
    Swift::String v46 = *(char **)(v44 + 56);
    uint64_t v62 = v44 + 56;
    uint64_t v59 = v46;
    ((void (*)(char *, void, uint64_t, uint64_t))v46)(v9, 0, 1, v45);
    uint64_t v36 = (uint64_t)v4 + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration;
    swift_beginAccess();
    sub_1000557C0((uint64_t)v9, v36);
    swift_endAccess();
    swift_release();
    if (v63) {
      id v47 = v61;
    }
    else {
      id v48 = [self systemRedColor];
    }
    sub_1000654D8((uint64_t)v17);
    Swift::String v49 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v49(v65, 0);
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v50 = v64;
    v58(v9, v17, v64);
    ((void (*)(char *, void, uint64_t, uint64_t))v59)(v9, 0, 1, v50);
  }
  swift_beginAccess();
  sub_1000557C0((uint64_t)v9, v36);
  swift_endAccess();
  swift_release();
  id v51 = v61;
  if (v63)
  {
    id v52 = sub_100065A38();
    id v53 = v51;
  }
  else
  {
    id v52 = sub_100065BAC();
    id v53 = [self systemRedColor];
  }
  Swift::String v54 = v53;
  [v52 setTintColor:v53];

  [v4 setAccessoryView:v52];
  v65[3] = v64;
  v65[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  Swift::String v55 = sub_100055694(v65);
  sub_1000654D8((uint64_t)v55);
  UITableViewCell.contentConfiguration.setter();
  swift_release();
}

uint64_t sub_1000666D8()
{
  return type metadata accessor for BlockTableViewCell();
}

uint64_t type metadata accessor for BlockTableViewCell()
{
  uint64_t result = qword_1000BBC60;
  if (!qword_1000BBC60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10006672C()
{
  sub_10005563C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

id sub_1000667C8()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_bridgeObjectRelease();
  uint64_t v2 = &v0[OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration];
  uint64_t v3 = type metadata accessor for UIListContentConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)&v0[OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView] = 0;
  *(void *)&v0[OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView] = 0;
  NSString v4 = String._bridgeToObjectiveC()();
  v11.receiver = v0;
  v11.super_class = ObjectType;
  id v5 = [super initWithStyle:0 reuseIdentifier:v4];

  type metadata accessor for MainActor();
  id v6 = v5;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10[3] = v3;
  v10[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  uint64_t v7 = sub_100055694(v10);
  sub_1000654D8((uint64_t)v7);
  UITableViewCell.contentConfiguration.setter();
  id v8 = sub_100065BAC();
  [v6 setAccessoryView:v8];

  swift_release();
  return v6;
}

uint64_t sub_100066980()
{
  uint64_t v1 = &v0[OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration];
  uint64_t v2 = type metadata accessor for UIListContentConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(void *)&v0[OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView] = 0;
  *(void *)&v0[OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView] = 0;

  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for BlockTableViewCell.BlockFlow()
{
  return &type metadata for BlockTableViewCell.BlockFlow;
}

unint64_t sub_100066AC0()
{
  unint64_t result = qword_1000BBC70;
  if (!qword_1000BBC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BBC70);
  }
  return result;
}

uint64_t sub_100066B14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  id v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void *sub_100066BDC(uint64_t a1)
{
  uint64_t result = (void *)sub_100069400(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (void *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_100069488(&v5, (uint64_t)result, v3, 0, a1);
  }
}

void *sub_100066C68(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a3 + 8 * v7);
      id v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100066D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = [*(id *)(v3 + 16) recentCalls];
  if (!v7) {
    goto LABEL_6;
  }
  id v8 = v7;
  sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
  unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  __chkstk_darwin(v10);
  v14[2] = a1;
  char v11 = sub_100066C68(sub_100059E90, (uint64_t)v14, v9);
  swift_bridgeObjectRelease();
  if (v11)
  {
    RecentsCallItem.title.getter();
    uint64_t v12 = (uint64_t)sub_10006989C(v11, a2, a3);
    swift_release();

    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    uint64_t v12 = sub_100068008(a1);
    swift_release();
  }
  return v12;
}

id sub_100066F38(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = *(void **)(v3 + 16);
  sub_100017E2C(&qword_1000BADE0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10007E5C0;
  sub_1000175C8(0, (unint64_t *)&unk_1000BBD90);
  *(void *)(v7 + 32) = [(id)swift_getObjCClassFromMetadata() descriptorForRequiredKeys];
  aBlock[0] = v7;
  specialized Array._endMutation()();
  sub_100017E2C(&qword_1000BAD60);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v9 = [v6 contactByHandleForRecentCall:a1 keyDescriptors:isa];

  if (v9)
  {
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
    sub_10005EEE4();
    uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [a1 validRemoteParticipantHandles:a3];
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_10005EEE4();
    uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    id v14 = a1;
    sub_1000170D0(v13, v10, v14);
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    if (!(v16 >> 62)) {
      goto LABEL_8;
    }
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v31 < 1) {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v16 = (unint64_t)&_swiftEmptyArrayStorage;
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62) {
    goto LABEL_17;
  }
LABEL_8:
  if (*(uint64_t *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
  {
LABEL_18:
    swift_release();
LABEL_19:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_9:
  id v17 = [a1 validRemoteParticipantHandles];
  if (!v17) {
    goto LABEL_18;
  }
  uint64_t v18 = v17;
  sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
  sub_10005EEE4();
  uint64_t v19 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v19 & 0xC000000000000001) != 0)
  {
    if (__CocoaSet.count.getter() >= 1) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
  if (*(uint64_t *)(v19 + 16) < 1)
  {
LABEL_21:
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
LABEL_12:
  sub_100068DF8(v19);
  swift_bridgeObjectRelease();
  id v20 = objc_allocWithZone((Class)PHContactsTableViewController);
  sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
  Class v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  Class v22 = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  id v23 = [v20 initWithContactArray:v21 contactHandles:v22];

  [v23 setEdgesForExtendedLayout:0];
  id result = [v23 tableView];
  if (result)
  {
    id v25 = result;
    unint64_t v26 = self;
    id v27 = [v26 clearColor];
    [v25 setBackgroundColor:v27];

    id result = [v23 tableView];
    if (result)
    {
      unint64_t v28 = result;
      id v29 = [v26 systemGrayColor];
      [v28 setSeparatorColor:v29];

      if (a2)
      {
        aBlock[4] = a2;
        aBlock[5] = v33;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000674B8;
        aBlock[3] = &unk_1000A3270;
        Swift::String v30 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
      }
      else
      {
        Swift::String v30 = 0;
      }
      [v23 setCustomInfoButtonAction:v30];
      _Block_release(v30);
      swift_release();
      return v23;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1000674B8(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = *(void (**)(void *, id, double, double, double, double))(a1 + 32);
  swift_retain();
  id v15 = a2;
  id v14 = a3;
  v13(a2, v14, a4, a5, a6, a7);
  swift_release();
}

id sub_10006756C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v58 = a3;
  uint64_t v6 = type metadata accessor for ReportSpamManager.IDSServiceType();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  uint64_t v10 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v11 = *(void **)(v3 + 16);
  uint64_t v61 = sub_100017E2C(&qword_1000BADE0);
  uint64_t v12 = swift_allocObject();
  long long v60 = xmmword_10007E5C0;
  *(_OWORD *)(v12 + 16) = xmmword_10007E5C0;
  sub_1000175C8(0, (unint64_t *)&unk_1000BBD90);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  *(void *)(v12 + 32) = [ObjCClassFromMetadata descriptorForRequiredKeys];
  aBlock[0] = v12;
  specialized Array._endMutation()();
  sub_100017E2C(&qword_1000BAD60);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v62 = v11;
  id v15 = [v11 contactByHandleForRecentCall:a1 keyDescriptors:isa];

  uint64_t v59 = a2;
  uint64_t v64 = v7;
  uint64_t v65 = v6;
  int v63 = v9;
  if (v15)
  {
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
    sub_10005EEE4();
    uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [a1 validRemoteParticipantHandles];
  if (v17)
  {
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_10005EEE4();
    uint64_t v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    uint64_t v19 = v10;
    id v20 = a1;
    sub_1000170D0(v18, v16, v20);
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    uint64_t v10 = v19;
    if (!(v22 >> 62)) {
      goto LABEL_8;
    }
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v23 < 1) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v22 = (unint64_t)&_swiftEmptyArrayStorage;
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v23 < 1)
  {
LABEL_16:
    swift_release();
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_9:
  id v24 = [a1 validRemoteParticipantHandles];
  if (!v24) {
    goto LABEL_16;
  }
  id v25 = v24;
  sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
  sub_10005EEE4();
  uint64_t v26 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v26 & 0xC000000000000001) != 0)
  {
    if (__CocoaSet.count.getter() >= 1) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  if (*(uint64_t *)(v26 + 16) < 1)
  {
LABEL_19:
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
LABEL_12:
  v57[1] = v10;
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = v60;
  *(void *)(v27 + 32) = [ObjCClassFromMetadata descriptorForRequiredKeys];
  aBlock[0] = v27;
  specialized Array._endMutation()();
  unint64_t v28 = sub_10005ECC4(a1);
  swift_bridgeObjectRelease();
  id v29 = [a1 initiator];
  if (v29)
  {
    Swift::String v30 = v29;
    id v31 = [v29 value];

    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v34 = v33;

    swift_bridgeObjectRetain();
    char v35 = sub_10006951C(v28, v32, v34);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v35 = 0;
  }
  type metadata accessor for ReportSpamManager();
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v63, enum case for ReportSpamManager.IDSServiceType.facetimeCall(_:), v65);
  uint64_t v37 = ReportSpamManager.__allocating_init(idsServiceType:)();
  if (v28 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  BOOL v39 = v38 == v23;
  BOOL v40 = v38 > 0;
  Swift::String_optional v41 = (objc_class *)type metadata accessor for ContactsReportAndBlockTableViewModel();
  Swift::String v42 = objc_allocWithZone(v41);
  v42[OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll] = v39;
  v42[OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator] = v35 & 1;
  v42[OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown] = v40;
  *(void *)&v42[OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall] = a1;
  *(void *)&v42[OBJC_IVAR___PHContactsReportAndBlockTableViewModel_reportSpammer] = v37;
  v67.receiver = v42;
  v67.super_class = v41;
  id v43 = a1;
  swift_retain();
  id v44 = [super init];
  sub_100068DF8(v26);
  swift_bridgeObjectRelease();
  id v45 = objc_allocWithZone((Class)PHContactsAndBlockTableViewController);
  sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
  id v46 = v44;
  Class v47 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  Class v48 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  Class v49 = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  id v36 = [v45 initWithContactArray:v47 unknownContacts:v48 contactHandles:v49 tableViewModel:v46];

  [v36 setEdgesForExtendedLayout:0];
  id result = [v36 tableView];
  if (result)
  {
    id v51 = result;
    id v52 = self;
    id v53 = [v52 clearColor];
    [v51 setBackgroundColor:v53];

    id result = [v36 tableView];
    if (result)
    {
      Swift::String v54 = result;
      id v55 = [v52 systemGrayColor];
      [v54 setSeparatorColor:v55];

      if (v59)
      {
        aBlock[4] = v59;
        aBlock[5] = v58;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000674B8;
        aBlock[3] = &unk_1000A3248;
        unint64_t v56 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
      }
      else
      {
        unint64_t v56 = 0;
      }
      [v36 setCustomInfoButtonAction:v56];
      _Block_release(v56);
      swift_release();
      swift_release();

      return v36;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100067DD0(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = [self contactViewControllerForRecentCall:a1 recentsController:*(void *)(v1 + 16)];
  if (!v3)
  {
    swift_release();
    return v3;
  }
  char v4 = self;
  id v5 = v3;
  if (objc_msgSend(v4, "headerViewWithFrame:recentCall:", a1, 0.0, 0.0, 0.0, 0.0))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  sub_100069FAC((uint64_t)v12, (uint64_t)v13);
  if (!v14)
  {
    sub_100017EC0((uint64_t)v13, &qword_1000BB3A0);
    goto LABEL_12;
  }
  sub_1000175C8(0, (unint64_t *)&unk_1000BBDC0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = v11;
LABEL_13:
  [v5 setContactHeaderView:v6];

  [v5 setContactHeaderViewController:0];
  id v7 = v5;
  sub_100069798((uint64_t)[a1 handleType]);
  if (v8)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  [v7 setPrimaryPropertyKey:v9];
  swift_release();

  return v3;
}

uint64_t sub_100068008(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RecentsCallItem();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v57 - v7;
  uint64_t v9 = sub_100017E2C((uint64_t *)&unk_1000BB4A0);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v57 - v13;
  type metadata accessor for MainActor();
  uint64_t v59 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v15 = sub_100068860();
  if (!v15)
  {
    if (qword_1000BA730 != -1) {
      swift_once();
    }
    uint64_t v58 = qword_1000BD518;
    sub_100017E2C((uint64_t *)&unk_1000BBD70);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_10007E140;
    unint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v21(v14, a1, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v14, 0, 1, v2);
    sub_100069F44((uint64_t)v14, (uint64_t)v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1)
    {
      sub_100017EC0((uint64_t)v12, (uint64_t *)&unk_1000BB4A0);
      unint64_t v22 = 0xE300000000000000;
      uint64_t v23 = 7104878;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v12, v2);
      v21(v6, (uint64_t)v8, v2);
      uint64_t v23 = String.init<A>(reflecting:)();
      unint64_t v22 = v24;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
    sub_100017EC0((uint64_t)v14, (uint64_t *)&unk_1000BB4A0);
    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = sub_10001AC80();
    *(void *)(v20 + 32) = v23;
    *(void *)(v20 + 40) = v22;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v16 = v15;
  sub_100017E2C(&qword_1000BADE0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10007E5C0;
  sub_1000175C8(0, (unint64_t *)&unk_1000BBD90);
  *(void *)(v17 + 32) = [(id)swift_getObjCClassFromMetadata() descriptorForRequiredKeys];
  uint64_t v60 = v17;
  specialized Array._endMutation()();
  id v18 = [v16 type];
  if (v18 == (id)1)
  {
    uint64_t v19 = (id *)&CNContactSocialProfilesKey;
  }
  else if (v18 == (id)2)
  {
    uint64_t v19 = (id *)&CNContactPhoneNumbersKey;
  }
  else
  {
    if (v18 != (id)3) {
      goto LABEL_19;
    }
    uint64_t v19 = (id *)&CNContactEmailAddressesKey;
  }
  id v26 = *v19;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
LABEL_19:
  id v27 = [self sharedInstance];
  id v28 = [v27 contactStore];

  sub_100017E2C((uint64_t *)&unk_1000BB500);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_10007E140;
  id v30 = [v16 value];
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v33 = v32;

  *(void *)(v29 + 32) = v31;
  *(void *)(v29 + 40) = v33;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_100017E2C(&qword_1000BAD60);
  Class v35 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v36 = [v28 contactsByContactHandleForContactHandles:isa keyDescriptors:v35];

  sub_100017E2C(&qword_1000BB480);
  uint64_t v37 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100066BDC(v37);
  uint64_t v39 = v38;
  unint64_t v41 = v40;
  swift_bridgeObjectRelease();
  if (!v39)
  {
LABEL_28:
    id v46 = v16;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_1000175C8(0, (unint64_t *)&unk_1000BBDB0);
    id v44 = (void *)CNMutableContact.init(handle:)();
    swift_release();
    goto LABEL_31;
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!(v41 >> 62))
  {
    if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v45 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v45)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
LABEL_22:
  if ((v41 & 0xC000000000000001) != 0)
  {
    id v43 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_25;
  }
  if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v43 = *(id *)(v41 + 32);
LABEL_25:
    id v44 = v43;
    swift_bridgeObjectRelease();
LABEL_31:
    unsigned int v47 = [v44 hasBeenPersisted];
    Class v48 = self;
    if (v47)
    {
      id v49 = [v48 viewControllerForContact:v44];
      [v49 setShouldShowLinkedContacts:1];
    }
    else
    {
      id v49 = [v48 viewControllerForUnknownContact:v44];
    }
    [v49 setContactHeaderViewController:0];
    id v50 = v49;
    [v50 setActions:[v50 actions] | 0x80];

    id v51 = *(void **)(v58 + 16);
    id v52 = v50;
    id v53 = [v51 suggestedContactStore];
    [v52 setContactStore:v53];

    id v25 = v52;
    Swift::String v54 = (char *)[v16 type];
    if ((unint64_t)(v54 - 1) >= 3) {
      Swift::String v54 = 0;
    }
    sub_100069798((uint64_t)v54);
    if (v55)
    {
      NSString v56 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v56 = 0;
    }
    [v25 setPrimaryPropertyKey:v56];
    swift_release();

    return (uint64_t)v25;
  }
  __break(1u);
  return result;
}

id sub_100068860()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RecentsCallItemType();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RecentCallRecentItemMetadata();
  uint64_t v24 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for RecentsCallItem();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = RecentsCallItem.hasVideoMessage.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v1, v9);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    char v14 = RecentsCallItem.hasAudioMessage.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if ((v14 & 1) == 0) {
      return 0;
    }
  }
  RecentsCallItem.type.getter();
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  BOOL v17 = v15 == enum case for RecentsCallItemType.recent(_:)
     || v15 == enum case for RecentsCallItemType.ongoing(_:)
     || v15 == enum case for RecentsCallItemType.link(_:);
  if (v17
    || (v15 != enum case for RecentsCallItemType.videoMessage(_:)
      ? (BOOL v18 = v15 == enum case for RecentsCallItemType.audioMessage(_:))
      : (BOOL v18 = 1),
        !v18))
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
  uint64_t v19 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v8, v5, v6);
  uint64_t v20 = (void *)RecentCallRecentItemMetadata.messageIndicatorViewModel.getter();
  id v21 = [v20 fromHandle];

  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  return v21;
}

uint64_t sub_100068BA0()
{
  return swift_deallocClassInstance();
}

uint64_t sub_100068BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100066D90(a1, a2, a3);
}

id sub_100068C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100068C24(a1, a2, a3, 33, (SEL *)&selRef_viewControllerForContact_);
}

id sub_100068C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100068C24(a1, a2, a3, 37, (SEL *)&selRef_viewControllerForUnknownContact_);
}

id sub_100068C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  [self *a5:a1];
  swift_release();
  return v7;
}

id sub_100068CE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10006989C(a1, a4, a5);
}

void *sub_100068D10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100017E2C((uint64_t *)&unk_1000BB500);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100068EF4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100017604();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_100068DF8(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = __CocoaSet.count.getter();
    if (v2) {
      goto LABEL_3;
    }
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = &_swiftEmptyArrayStorage;
  }
  else
  {
    sub_100017E2C(&qword_1000BADE0);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = j__malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1000690F4(&v8, v3 + 4, v2, a1);
  uint64_t result = (void *)sub_100017604();
  if (v6 == (void *)v2) {
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100068EF4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_1000690F4(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
    sub_10005EEE4();
    uint64_t result = (void *)Set.Iterator.init(_cocoa:)();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_45;
      }
      sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      unint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    unint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_100069400(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *sub_100069488(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    *uint64_t result = *(void *)(*(void *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10006951C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v7 = v5 & 0xC000000000000001;
    uint64_t v8 = 0;
    uint64_t v22 = v5 + 32;
    type metadata accessor for MainActor();
    uint64_t v21 = v5;
    unint64_t v19 = v5 & 0xC000000000000001;
    uint64_t v20 = v6;
    while (1)
    {
      id v9 = v7 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v22 + 8 * v8);
      id v23 = v9;
      if (__OFADD__(v8++, 1)) {
        break;
      }
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v11 = [v23 handles:v19, v20];
      uint64_t v12 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v13 = v12[2];
      if (v13)
      {
        BOOL v14 = v12[4] == a2 && v12[5] == a3;
        if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_29:
          swift_bridgeObjectRelease();

          swift_release();
          swift_bridgeObjectRelease();
          return 1;
        }
        if (v13 != 1)
        {
          unint64_t v15 = v12 + 7;
          uint64_t v5 = 1;
          while (1)
          {
            uint64_t v16 = v5 + 1;
            if (__OFADD__(v5, 1)) {
              break;
            }
            BOOL v17 = *(v15 - 1) == a2 && *v15 == a3;
            if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              goto LABEL_29;
            }
            v15 += 2;
            ++v5;
            if (v16 == v13)
            {
              swift_release();
              swift_bridgeObjectRelease();
              uint64_t v5 = v21;
              unint64_t v7 = v19;
              uint64_t v6 = v20;
              goto LABEL_18;
            }
          }
          __break(1u);
          break;
        }
      }
      swift_release();
      swift_bridgeObjectRelease();
LABEL_18:

      if (v8 == v6) {
        goto LABEL_34;
      }
    }
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
  }
LABEL_34:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100069798(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  switch(a1)
  {
    case 2:
    case 3:
      uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      swift_release();
      break;
    default:
      swift_release();
      uint64_t v2 = 0;
      break;
  }
  return v2;
}

id sub_10006989C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = [a1 remoteParticipantHandles];
  if (!v8)
  {
    if (qword_1000BA730 != -1) {
      swift_once();
    }
    sub_100017E2C((uint64_t *)&unk_1000BBD70);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_10007E140;
    sub_1000175C8(0, (unint64_t *)&qword_1000BB7D0);
    id v13 = a1;
    uint64_t v14 = String.init<A>(reflecting:)();
    uint64_t v16 = v15;
    *(void *)(v12 + 56) = &type metadata for String;
    *(void *)(v12 + 64) = sub_10001AC80();
    *(void *)(v12 + 32) = v14;
    *(void *)(v12 + 40) = v16;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  id v9 = v8;
  uint64_t v44 = a2;
  sub_1000175C8(0, (unint64_t *)&unk_1000BB4B0);
  sub_10005EEE4();
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v10 & 0xC000000000000001) != 0) {
    uint64_t v11 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v11 = *(void *)(v10 + 16);
  }
  swift_bridgeObjectRelease();
  if (v11 < 2)
  {
    id v22 = sub_100067DD0(a1);
LABEL_14:
    id v23 = v22;
    swift_release();
    return v23;
  }
  unsigned int v41 = [a1 callStatus];
  BOOL v17 = *(void **)(v4 + 16);
  sub_100017E2C(&qword_1000BADE0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10007E5C0;
  sub_1000175C8(0, (unint64_t *)&unk_1000BBD90);
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  *(void *)(v18 + 32) = [ObjCClassFromMetadata descriptorForRequiredKeys];
  specialized Array._endMutation()();
  sub_100017E2C(&qword_1000BAD60);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v20 = [v17 contactByHandleForRecentCall:a1 keyDescriptors:isa];

  if (v20)
  {
    sub_1000175C8(0, (unint64_t *)&unk_1000BBDA0);
    uint64_t v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v25 = a3;
  uint64_t v43 = v4;
  id v26 = [a1 validRemoteParticipantHandles];
  if (!v26)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v31 = (unint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_18;
    }
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v27 = v26;
  uint64_t v28 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  id v29 = a1;
  sub_1000170D0(v28, v21, v29);
  unint64_t v31 = v30;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();

  if (v31 >> 62) {
    goto LABEL_24;
  }
LABEL_18:
  uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_19:
  swift_bridgeObjectRelease();
  if (v32 >= 1)
  {
    id v33 = [a1 validRemoteParticipantHandles];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v36 = (v35 & 0xC000000000000001) != 0 ? __CocoaSet.count.getter() : *(void *)(v35 + 16);
      swift_bridgeObjectRelease();
      if (v36 >= 1)
      {
        uint64_t v37 = swift_allocObject();
        *(_OWORD *)(v37 + 16) = xmmword_10007E5C0;
        *(void *)(v37 + 32) = [ObjCClassFromMetadata descriptorForRequiredKeys];
        specialized Array._endMutation()();
        unint64_t v38 = sub_10005ECC4(a1);
        swift_bridgeObjectRelease();
        if (![*(id *)(v43 + 24) unknownInitiatorReportEnabled]) {
          goto LABEL_39;
        }
        int v39 = kCHCallStatusIncoming;
        static MainActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        if ((v39 & v41) != 0)
        {
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          if (v38 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v40 = _CocoaArrayWrapper.endIndex.getter();
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v40 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_release();
          }
          swift_bridgeObjectRelease();
          if (v40)
          {
            id v22 = sub_10006756C(a1, v44, v25);
            goto LABEL_14;
          }
        }
        else
        {
LABEL_39:
          swift_bridgeObjectRelease();
        }
        id v22 = sub_100066F38(a1, v44, v25);
        goto LABEL_14;
      }
    }
  }
  swift_release();
  return 0;
}

uint64_t sub_100069F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C((uint64_t *)&unk_1000BB4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100069FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017E2C(&qword_1000BB3A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10006A01C(uint64_t a1, char a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void (**)(void))(Strong + 40);
    swift_retain();
    swift_release();
    v4(a2 & 1);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_10006A114()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10006A14C(uint64_t a1, char a2)
{
  return sub_10006A01C(a1, a2 & 1);
}

uint64_t getEnumTagSinglePayload for OrientationMonitorLockedStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OrientationMonitorLockedStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10006A2B4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_10006A2DC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OrientationMonitorLockedStatus()
{
  return &type metadata for OrientationMonitorLockedStatus;
}

unint64_t sub_10006A2FC()
{
  unint64_t result = qword_1000BBE80;
  if (!qword_1000BBE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BBE80);
  }
  return result;
}

BOOL sub_10006A350(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10006A38C(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy", v1, 2u);
}

void sub_10006A3D0(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy, mobileGestaltErrorCode: %d", (uint8_t *)v3, 8u);
}

void sub_10006A44C(void *a1, NSObject *a2)
{
  int v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error launching InCallService: %@", (uint8_t *)&v4, 0xCu);
}

void sub_10006A4E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not initiate a voicemail call due to a nil URL from the dial request (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_10006A55C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not initiate a voicemail call due to an invalid dial request (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_10006A5D4()
{
  sub_10002B5E8();
  sub_10002B5CC((void *)&_mh_execute_header, v0, v1, "Error retrieving extensions: %@", v2, v3, v4, v5, v6);
}

void sub_10006A63C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Boolean PHSBSGetScreenLockStatus(Boolean *)"];
  [v0 handleFailureInFunction:v1 file:@"PHInCallUIUtilities.m" lineNumber:28 description:@"%s" dlerror()];

  __break(1u);
}

void sub_10006A6B4()
{
  sub_10002B5E8();
  sub_10002B5CC((void *)&_mh_execute_header, v0, v1, "Received subscriptionInfo: %@ with no subscriptions", v2, v3, v4, v5, v6);
}

void sub_10006A71C()
{
  sub_10002B5E8();
  sub_10002B5CC((void *)&_mh_execute_header, v0, v1, "Received error: %@ while querying -getSubscriptionInfoWithError", v2, v3, v4, v5, v6);
}

void sub_10006A784()
{
  sub_10002B5E8();
  sub_10002B5CC((void *)&_mh_execute_header, v0, v1, "ShowExplicitCallTransferButton: received subscriptionInfo: %@ with no subscriptions", v2, v3, v4, v5, v6);
}

void sub_10006A7EC()
{
  sub_10002B5E8();
  sub_10002B5CC((void *)&_mh_execute_header, v0, v1, "ShowExplicitCallTransferButton: received error: %@ while querying -getSubscriptionInfoWithError", v2, v3, v4, v5, v6);
}

void sub_10006A854(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"PHInCallUIUtilities.m" lineNumber:27 description:@"%s" *a1];

  __break(1u);
}

void sub_10006A8D4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type of scene: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006A94C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "-[CHRecentCall handleType] returned a value of CHHandleTypeUnknown", v1, 2u);
}

void sub_10006A990(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not enable data usage. error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006AA08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No rttConversation found", v1, 2u);
}

void sub_10006AA4C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a dial request for the recent call (%@).", (uint8_t *)&v3, 0xCu);
}

void sub_10006AAC8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error initiating dial request %@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10006AB54(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch unified contact for identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006ABCC(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v6 = [a1 localizedName];
  uint64_t v7 = [a1 supportedHandleTypes];
  int v8 = 134218498;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not create a dial request due to an invalid handle type (%zd). For call provider %@, the supported handle types are (%@).", (uint8_t *)&v8, 0x20u);
}

void sub_10006AC9C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User activity does not contains a user info dictionary.", v1, 2u);
}

void sub_10006ACE0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User activity is missing the required key TUCallUserActivityProviderIdentifierKey.", v1, 2u);
}

void sub_10006AD24(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retrieve a call provider for the specified identifier %@.", (uint8_t *)&v2, 0xCu);
}

void sub_10006AD9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006AE14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006AE80()
{
  sub_1000422F8();
  sub_1000422DC((void *)&_mh_execute_header, v0, v1, "Registering", v2, v3, v4, v5, v6);
}

void sub_10006AEB4()
{
  sub_1000422F8();
  sub_1000422DC((void *)&_mh_execute_header, v0, v1, "AKTapToSignInViewController results had username+password", v2, v3, v4, v5, v6);
}

void sub_10006AEE8()
{
  sub_1000422F8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Authentication handler: Missing either username or password", v1, 2u);
}

void sub_10006AF28()
{
  sub_1000422F8();
  sub_1000422DC((void *)&_mh_execute_header, v0, v1, "AKTapToSignInViewController obtained results", v2, v3, v4, v5, v6);
}

void sub_10006AF5C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not authenticate: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006AFD4()
{
  sub_1000422F8();
  sub_1000422DC((void *)&_mh_execute_header, v0, v1, "AKTapToSignInViewController callback", v2, v3, v4, v5, v6);
}

void sub_10006B008()
{
  sub_1000422F8();
  sub_1000422DC((void *)&_mh_execute_header, v0, v1, "Success! Calling completion block", v2, v3, v4, v5, v6);
}

void sub_10006B03C()
{
  sub_1000422F8();
  sub_1000422DC((void *)&_mh_execute_header, v0, v1, "Failure. showing error alert", v2, v3, v4, v5, v6);
}

void sub_10006B070()
{
  sub_1000422F8();
  sub_1000422DC((void *)&_mh_execute_header, v0, v1, "Handling registration callback", v2, v3, v4, v5, v6);
}

void sub_10006B0A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a CNPhoneNumber for the specified telephone number (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_10006B11C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to parse message UUID from URL: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006B194(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to parse message uniqueID from URL: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006B20C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006B278(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10006B2E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  os_log_t v0 = (objc_class *)PersonNameComponents._bridgeToObjectiveC()();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return type metadata accessor for PersonNameComponents();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID.< infix(_:_:)()
{
  return static UUID.< infix(_:_:)();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static IndexSet._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

uint64_t static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.setter()
{
  return static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.setter();
}

uint64_t type metadata accessor for RecentsListItemViewHelper()
{
  return type metadata accessor for RecentsListItemViewHelper();
}

uint64_t RecentCallRecentItemMetadata.messageIndicatorViewModel.getter()
{
  return RecentCallRecentItemMetadata.messageIndicatorViewModel.getter();
}

uint64_t RecentCallRecentItemMetadata.init(uniqueId:date:recentCall:mediaType:remoteParticipantHandles:countOfExcludedHandles:groupUUID:conversationLink:conversationID:)()
{
  return RecentCallRecentItemMetadata.init(uniqueId:date:recentCall:mediaType:remoteParticipantHandles:countOfExcludedHandles:groupUUID:conversationLink:conversationID:)();
}

uint64_t type metadata accessor for RecentCallRecentItemMetadata()
{
  return type metadata accessor for RecentCallRecentItemMetadata();
}

uint64_t type metadata accessor for ConversationLink()
{
  return type metadata accessor for ConversationLink();
}

uint64_t RecentsCallItem.init(recentsCallMetadata:contacts:title:subtitle:forcedSubtitle:senderIdentity:occurrenceCount:applicationIcon:type:)()
{
  return RecentsCallItem.init(recentsCallMetadata:contacts:title:subtitle:forcedSubtitle:senderIdentity:occurrenceCount:applicationIcon:type:)();
}

uint64_t RecentsCallItem.isRecentCall.getter()
{
  return RecentsCallItem.isRecentCall.getter();
}

uint64_t RecentsCallItem.callUniqueId.getter()
{
  return RecentsCallItem.callUniqueId.getter();
}

uint64_t RecentsCallItem.hasAudioMessage.getter()
{
  return RecentsCallItem.hasAudioMessage.getter();
}

uint64_t RecentsCallItem.hasVideoMessage.getter()
{
  return RecentsCallItem.hasVideoMessage.getter();
}

uint64_t RecentsCallItem.handleForMailCallback.getter()
{
  return RecentsCallItem.handleForMailCallback.getter();
}

uint64_t RecentsCallItem.type.getter()
{
  return RecentsCallItem.type.getter();
}

uint64_t RecentsCallItem.title.getter()
{
  return RecentsCallItem.title.getter();
}

uint64_t type metadata accessor for RecentsCallItem()
{
  return type metadata accessor for RecentsCallItem();
}

uint64_t RecentsCallHandle.init(type:value:)()
{
  return RecentsCallHandle.init(type:value:)();
}

uint64_t type metadata accessor for RecentsCallHandle()
{
  return type metadata accessor for RecentsCallHandle();
}

uint64_t ReportSpamManager.reportFaceTimeCallSpam<A>(call:)()
{
  return ReportSpamManager.reportFaceTimeCallSpam<A>(call:)();
}

uint64_t type metadata accessor for ReportSpamManager.IDSServiceType()
{
  return type metadata accessor for ReportSpamManager.IDSServiceType();
}

uint64_t ReportSpamManager.__allocating_init(idsServiceType:)()
{
  return ReportSpamManager.__allocating_init(idsServiceType:)();
}

uint64_t type metadata accessor for ReportSpamManager()
{
  return type metadata accessor for ReportSpamManager();
}

uint64_t type metadata accessor for RecentsCallItemType()
{
  return type metadata accessor for RecentsCallItemType();
}

uint64_t RecentsControllable.recentCallsCount.getter()
{
  return RecentsControllable.recentCallsCount.getter();
}

uint64_t type metadata accessor for RecentsCallHandleType()
{
  return type metadata accessor for RecentsCallHandleType();
}

uint64_t dispatch thunk of RecentsListViewController.collectionView.getter()
{
  return dispatch thunk of RecentsListViewController.collectionView.getter();
}

uint64_t RecentsListViewController.presentDetailsView(for:)()
{
  return RecentsListViewController.presentDetailsView(for:)();
}

Swift::Void __swiftcall RecentsListViewController.showLinkDetailViewController(for:)(Swift::String a1)
{
}

uint64_t RecentsListViewController.init(recentCallProvider:detailControllerFactory:contactStore:)()
{
  return RecentsListViewController.init(recentCallProvider:detailControllerFactory:contactStore:)();
}

uint64_t dispatch thunk of RecentsListViewController.presentScreenTimeShield.setter()
{
  return dispatch thunk of RecentsListViewController.presentScreenTimeShield.setter();
}

uint64_t RecentsListViewController.showVideoPlayerForMessage(withUUID:bypassSafety:)()
{
  return RecentsListViewController.showVideoPlayerForMessage(withUUID:bypassSafety:)();
}

uint64_t type metadata accessor for RecentsListViewController()
{
  return type metadata accessor for RecentsListViewController();
}

uint64_t dispatch thunk of RecentCallProviderDelegate.recentCallsDidChange()()
{
  return dispatch thunk of RecentCallProviderDelegate.recentCallsDidChange()();
}

uint64_t dispatch thunk of Message.sandboxMessageFile.getter()
{
  return dispatch thunk of Message.sandboxMessageFile.getter();
}

uint64_t dispatch thunk of Message.recordUUID.getter()
{
  return dispatch thunk of Message.recordUUID.getter();
}

uint64_t dispatch thunk of Message.transcript.getter()
{
  return dispatch thunk of Message.transcript.getter();
}

uint64_t dispatch thunk of Message.dateCreated.getter()
{
  return dispatch thunk of Message.dateCreated.getter();
}

uint64_t dispatch thunk of Message.isSensitive.getter()
{
  return dispatch thunk of Message.isSensitive.getter();
}

uint64_t dispatch thunk of Message.mailboxType.getter()
{
  return dispatch thunk of Message.mailboxType.getter();
}

uint64_t dispatch thunk of Message.messageType.getter()
{
  return dispatch thunk of Message.messageType.getter();
}

uint64_t dispatch thunk of Message.isFromUnknown.getter()
{
  return dispatch thunk of Message.isFromUnknown.getter();
}

uint64_t dispatch thunk of Message.transcriptionStatus.getter()
{
  return dispatch thunk of Message.transcriptionStatus.getter();
}

uint64_t dispatch thunk of Message.from.getter()
{
  return dispatch thunk of Message.from.getter();
}

uint64_t dispatch thunk of Message.isRTT.getter()
{
  return dispatch thunk of Message.isRTT.getter();
}

uint64_t dispatch thunk of Message.isRead.getter()
{
  return dispatch thunk of Message.isRead.getter();
}

uint64_t dispatch thunk of Message.callUUID.getter()
{
  return dispatch thunk of Message.callUUID.getter();
}

uint64_t dispatch thunk of Message.duration.getter()
{
  return dispatch thunk of Message.duration.getter();
}

uint64_t dispatch thunk of Message.provider.getter()
{
  return dispatch thunk of Message.provider.getter();
}

uint64_t dispatch thunk of Message.recipient.getter()
{
  return dispatch thunk of Message.recipient.getter();
}

uint64_t MessageType.rawValue.getter()
{
  return MessageType.rawValue.getter();
}

uint64_t Transcript.text.getter()
{
  return Transcript.text.getter();
}

uint64_t type metadata accessor for Transcript()
{
  return type metadata accessor for Transcript();
}

uint64_t MailboxType.rawValue.getter()
{
  return MailboxType.rawValue.getter();
}

uint64_t dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter()
{
  return dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter();
}

uint64_t TranscriptionStatus.rawValue.getter()
{
  return TranscriptionStatus.rawValue.getter();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t UIBackgroundConfiguration.visualEffect.setter()
{
  return UIBackgroundConfiguration.visualEffect.setter();
}

uint64_t UIBackgroundConfiguration.backgroundColor.setter()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t static UIBackgroundConfiguration.listCell()()
{
  return static UIBackgroundConfiguration.listCell()();
}

uint64_t type metadata accessor for UIBackgroundConfiguration()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t UIListContentConfiguration.TextProperties.adjustsFontForContentSizeCategory.setter()
{
  return UIListContentConfiguration.TextProperties.adjustsFontForContentSizeCategory.setter();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t UIListContentConfiguration.textProperties.modify()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t UITableViewCell.backgroundConfiguration.setter()
{
  return UITableViewCell.backgroundConfiguration.setter();
}

uint64_t UITableViewCell.defaultContentConfiguration()()
{
  return UITableViewCell.defaultContentConfiguration()();
}

uint64_t CNMutableContact.init(handle:)()
{
  return CNMutableContact.init(handle:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t UIContentSizeCategory.isAccessibilityCategory.getter()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()()
{
  return OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t ABAddressBookSetAutorotationEnabled()
{
  return _ABAddressBookSetAutorotationEnabled();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t CFPhoneNumberCreate()
{
  return _CFPhoneNumberCreate();
}

uint64_t CFPhoneNumberCreateString()
{
  return _CFPhoneNumberCreateString();
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

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return _CGAffineTransformIsIdentity(t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return _CGColorSpaceCreateDeviceGray();
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return _CGGradientCreateWithColorComponents(space, components, locations, count);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CTTelephonyCenterGetDefault()
{
  return _CTTelephonyCenterGetDefault();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return _CTTelephonyCenterRemoveObserver();
}

uint64_t CUTWeakLinkClass()
{
  return _CUTWeakLinkClass();
}

uint64_t CUTWeakLinkSymbol()
{
  return _CUTWeakLinkSymbol();
}

uint64_t IDSRegistrationControlEnableRegistrationType()
{
  return _IDSRegistrationControlEnableRegistrationType();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return _IOHIDEventSystemClientCreate();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return _IOHIDEventSystemClientRegisterEventBlock();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return _IOHIDEventSystemClientScheduleWithDispatchQueue();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return _IOHIDEventSystemClientSetMatching();
}

uint64_t IOHIDEventSystemClientUnscheduleFromDispatchQueue()
{
  return _IOHIDEventSystemClientUnscheduleFromDispatchQueue();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return _PNCopyBestGuessCountryCodeForNumber();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return _PNCreateFormattedStringWithCountry();
}

uint64_t TUAddLocalNSObserver()
{
  return _TUAddLocalNSObserver();
}

uint64_t TUBundle()
{
  return _TUBundle();
}

uint64_t TUCallPhoneAppHistoryActivityType()
{
  return _TUCallPhoneAppHistoryActivityType();
}

uint64_t TUCallScreeningRTTEnabled()
{
  return _TUCallScreeningRTTEnabled();
}

uint64_t TUCountryCodeForIncomingCall()
{
  return _TUCountryCodeForIncomingCall();
}

uint64_t TUDefaultAppsEnabled()
{
  return _TUDefaultAppsEnabled();
}

uint64_t TUFormattedPhoneNumber()
{
  return _TUFormattedPhoneNumber();
}

uint64_t TUHomeCountryCode()
{
  return _TUHomeCountryCode();
}

uint64_t TUNetworkCountryCode()
{
  return _TUNetworkCountryCode();
}

uint64_t TUNumberToDial()
{
  return _TUNumberToDial();
}

uint64_t TUPreferredFaceTimeBundleIdentifier()
{
  return _TUPreferredFaceTimeBundleIdentifier();
}

uint64_t TUStringKeyForNetworkAndProduct()
{
  return _TUStringKeyForNetworkAndProduct();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIFormattedPhoneNumberFromString()
{
  return _UIFormattedPhoneNumberFromString();
}

uint64_t UIFormattedPhoneNumberFromStringWithCountry()
{
  return _UIFormattedPhoneNumberFromStringWithCountry();
}

uint64_t UIFormattedPhoneStringByRemovingFromEnd()
{
  return _UIFormattedPhoneStringByRemovingFromEnd();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
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

uint64_t _PNCopyFormattedNumberSuggestionForDigitsWithCountry()
{
  return __PNCopyFormattedNumberSuggestionForDigitsWithCountry();
}

uint64_t _TUAssertShouldCrashApplication()
{
  return __TUAssertShouldCrashApplication();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t ttyLocString()
{
  return _ttyLocString();
}

double u_getNumericValue(UChar32 c)
{
  return _u_getNumericValue(c);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGFloatValue(void *a1, const char *a2, ...)
{
  return _[a1 CGFloatValue];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_HIDEventSystemClient(void *a1, const char *a2, ...)
{
  return _[a1 HIDEventSystemClient];
}

id objc_msgSend_TTYActionImage(void *a1, const char *a2, ...)
{
  return _[a1 TTYActionImage];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _[a1 URLContexts];
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

id objc_msgSend__accessibilityHigherContrastTintColorForColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColor:");
}

id objc_msgSend__accessibilitySetInterfaceStyleIntent_(void *a1, const char *a2, ...)
{
  return [a1 _accessibilitySetInterfaceStyleIntent:];
}

id objc_msgSend__applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:");
}

id objc_msgSend__applyAutoRotationCorrectionForOrientation_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:");
}

id objc_msgSend__applyPreviewMSROptimizationTransformsForOrientation_(void *a1, const char *a2, ...)
{
  return [a1 _applyPreviewMSROptimizationTransformsForOrientation:];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 _baselineOffsetFromBottom];
}

id objc_msgSend__bodyLeading(void *a1, const char *a2, ...)
{
  return _[a1 _bodyLeading];
}

id objc_msgSend__buildView(void *a1, const char *a2, ...)
{
  return _[a1 _buildView];
}

id objc_msgSend__carScreen(void *a1, const char *a2, ...)
{
  return _[a1 _carScreen];
}

id objc_msgSend__constrainRegistrationView(void *a1, const char *a2, ...)
{
  return _[a1 _constrainRegistrationView];
}

id objc_msgSend__contentViewWidthForApplicationBoundsSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentViewWidthForApplicationBoundsSize:");
}

id objc_msgSend__createWindowFromScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createWindowFromScene:");
}

id objc_msgSend__currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 _currentTraitCollection];
}

id objc_msgSend__destroyFirstRunController(void *a1, const char *a2, ...)
{
  return _[a1 _destroyFirstRunController];
}

id objc_msgSend__deviceSpecificImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSpecificImageNamed:");
}

id objc_msgSend__dissociateVideoLayers(void *a1, const char *a2, ...)
{
  return _[a1 _dissociateVideoLayers];
}

id objc_msgSend__effectCopyingFromCaptureGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectCopyingFromCaptureGroup:");
}

id objc_msgSend__encodedDialerStringSkippingUnmappedCharacters_(void *a1, const char *a2, ...)
{
  return [a1 _encodedDialerStringSkippingUnmappedCharacters:];
}

id objc_msgSend__ensureLocalVideoWillBecomeVisible(void *a1, const char *a2, ...)
{
  return _[a1 _ensureLocalVideoWillBecomeVisible];
}

id objc_msgSend__ensureProperPositionForContentView(void *a1, const char *a2, ...)
{
  return _[a1 _ensureProperPositionForContentView];
}

id objc_msgSend__ensureVideoLayersExist(void *a1, const char *a2, ...)
{
  return _[a1 _ensureVideoLayersExist];
}

id objc_msgSend__faceTimeInvitationExists(void *a1, const char *a2, ...)
{
  return _[a1 _faceTimeInvitationExists];
}

id objc_msgSend__fadeInLocalVideo(void *a1, const char *a2, ...)
{
  return _[a1 _fadeInLocalVideo];
}

id objc_msgSend__fetchScrollView(void *a1, const char *a2, ...)
{
  return _[a1 _fetchScrollView];
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return [a1 _flatImageWithColor:];
}

id objc_msgSend__ftFailedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ftFailedTest:");
}

id objc_msgSend__ftStartedTest_(void *a1, const char *a2, ...)
{
  return [a1 _ftStartedTest:];
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return _[a1 _graphicsQuality];
}

id objc_msgSend__inProgressRegisteringNonPhoneAccount(void *a1, const char *a2, ...)
{
  return _[a1 _inProgressRegisteringNonPhoneAccount];
}

id objc_msgSend__initWithFrame_recentCall_(void *a1, const char *a2, ...)
{
  return [a1 _initWithFrame:recentCall:];
}

id objc_msgSend__initializeUI(void *a1, const char *a2, ...)
{
  return _[a1 _initializeUI];
}

id objc_msgSend__intents_extensionMatchingAttributesForIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intents_extensionMatchingAttributesForIntents:");
}

id objc_msgSend__isAnimatingScroll(void *a1, const char *a2, ...)
{
  return _[a1 _isAnimatingScroll];
}

id objc_msgSend__isAnimatingZoom(void *a1, const char *a2, ...)
{
  return _[a1 _isAnimatingZoom];
}

id objc_msgSend__isBlurUI(void *a1, const char *a2, ...)
{
  return _[a1 _isBlurUI];
}

id objc_msgSend__isValidFaceTimeOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidFaceTimeOrientation:");
}

id objc_msgSend__keypadImage(void *a1, const char *a2, ...)
{
  return _[a1 _keypadImage];
}

id objc_msgSend__makeCalloutVisible_(void *a1, const char *a2, ...)
{
  return [a1 _makeCalloutVisible:];
}

id objc_msgSend__performScrollTest_iterations_delta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:");
}

id objc_msgSend__phImageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 _phImageNamed:inBundle:compatibleWithTraitCollection:];
}

id objc_msgSend__previewMSROptimizationCompensationForOrientation_withTransform_withBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_previewMSROptimizationCompensationForOrientation:withTransform:withBounds:");
}

id objc_msgSend__primitiveSetNavigationControllerContentInsetAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_primitiveSetNavigationControllerContentInsetAdjustment:");
}

id objc_msgSend__primitiveSetNavigationControllerContentOffsetAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_primitiveSetNavigationControllerContentOffsetAdjustment:");
}

id objc_msgSend__removeHasShownPromptDefaultIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _removeHasShownPromptDefaultIfNecessary];
}

id objc_msgSend__requestMakeCutCopyPasteCalloutVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestMakeCutCopyPasteCalloutVisible:");
}

id objc_msgSend__resetCurrentViewController(void *a1, const char *a2, ...)
{
  return _[a1 _resetCurrentViewController];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 _rootSheetPresentationController];
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 _scaledValueForValue:];
}

id objc_msgSend__scene(void *a1, const char *a2, ...)
{
  return _[a1 _scene];
}

id objc_msgSend__screen(void *a1, const char *a2, ...)
{
  return _[a1 _screen];
}

id objc_msgSend__setCaptureView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCaptureView:");
}

id objc_msgSend__setClipUnderlapWhileTransitioning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setClipUnderlapWhileTransitioning:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 _setCornerRadius:];
}

id objc_msgSend__setDefaultTopNavBarTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDefaultTopNavBarTintColor:");
}

id objc_msgSend__setGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGroupName:");
}

id objc_msgSend__setHidesShadow_(void *a1, const char *a2, ...)
{
  return [a1 _setHidesShadow:];
}

id objc_msgSend__setInternalTitle_(void *a1, const char *a2, ...)
{
  return [a1 _setInternalTitle:];
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return [a1 _setShouldScaleDownBehindDescendantSheets:];
}

id objc_msgSend__setupVideoLayers(void *a1, const char *a2, ...)
{
  return _[a1 _setupVideoLayers];
}

id objc_msgSend__sharedDetailDisclosureImage(void *a1, const char *a2, ...)
{
  return _[a1 _sharedDetailDisclosureImage];
}

id objc_msgSend__sharedTTYDirectImage(void *a1, const char *a2, ...)
{
  return _[a1 _sharedTTYDirectImage];
}

id objc_msgSend__sharedTTYRelayImage(void *a1, const char *a2, ...)
{
  return _[a1 _sharedTTYRelayImage];
}

id objc_msgSend__shouldShowAuthKitSignIn(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowAuthKitSignIn];
}

id objc_msgSend__startListeningForKeyboardNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _startListeningForKeyboardNotifications];
}

id objc_msgSend__stopListeningToKeyboardNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _stopListeningToKeyboardNotifications];
}

id objc_msgSend__thinSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 _thinSystemFontOfSize:];
}

id objc_msgSend__tuVideoDeviceOrientationForDeviceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 _tuVideoDeviceOrientationForDeviceOrientation];
}

id objc_msgSend__updateLayout(void *a1, const char *a2, ...)
{
  return _[a1 _updateLayout];
}

id objc_msgSend__updateLocalPreviewStatusBarGradient(void *a1, const char *a2, ...)
{
  return _[a1 _updateLocalPreviewStatusBarGradient];
}

id objc_msgSend__updateLocalVideoOrientationAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocalVideoOrientationAnimated:");
}

id objc_msgSend__updateRootViewController(void *a1, const char *a2, ...)
{
  return _[a1 _updateRootViewController];
}

id objc_msgSend__updateTextColor(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextColor];
}

id objc_msgSend__userHasAlreadyBeenPrompted(void *a1, const char *a2, ...)
{
  return _[a1 _userHasAlreadyBeenPrompted];
}

id objc_msgSend__verifiedCheckmarkImage(void *a1, const char *a2, ...)
{
  return _[a1 _verifiedCheckmarkImage];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryAppleAccount];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accountUUID(void *a1, const char *a2, ...)
{
  return _[a1 accountUUID];
}

id objc_msgSend_accountsForService_(void *a1, const char *a2, ...)
{
  return [a1 accountsForService:];
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return _[a1 actionButton];
}

id objc_msgSend_actionButtonImage(void *a1, const char *a2, ...)
{
  return _[a1 actionButtonImage];
}

id objc_msgSend_actionButtonImageForActionType_(void *a1, const char *a2, ...)
{
  return [a1 actionButtonImageForActionType:];
}

id objc_msgSend_actionButtonTappedHandler(void *a1, const char *a2, ...)
{
  return _[a1 actionButtonTappedHandler];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _[a1 actions];
}

id objc_msgSend_activateAccount_(void *a1, const char *a2, ...)
{
  return [a1 activateAccount:];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return _[a1 activationState];
}

id objc_msgSend_activeConversationForCall_(void *a1, const char *a2, ...)
{
  return [a1 activeConversationForCall:];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_activeVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 activeVideoCall];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttribute:value:range:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return [a1 addConstraint:];
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return [a1 addConstraints:];
}

id objc_msgSend_addContactButton(void *a1, const char *a2, ...)
{
  return _[a1 addContactButton];
}

id objc_msgSend_addContactButtonContentInsetConstant(void *a1, const char *a2, ...)
{
  return _[a1 addContactButtonContentInsetConstant];
}

id objc_msgSend_addContactButtonTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 addContactButtonTopConstraint];
}

id objc_msgSend_addContactButtonTopConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 addContactButtonTopConstraintConstant];
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:queue:];
}

id objc_msgSend_addDurationAndDataSubview(void *a1, const char *a2, ...)
{
  return _[a1 addDurationAndDataSubview];
}

id objc_msgSend_addEmergencyItemsSubview(void *a1, const char *a2, ...)
{
  return _[a1 addEmergencyItemsSubview];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return [a1 addIndex:];
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 addLayoutGuide:];
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return [a1 addListenerID:capabilities:];
}

id objc_msgSend_addListenerID_forService_(void *a1, const char *a2, ...)
{
  return [a1 addListenerID:forService:];
}

id objc_msgSend_addNotificationObservers(void *a1, const char *a2, ...)
{
  return _[a1 addNotificationObservers];
}

id objc_msgSend_addNumberFontSize(void *a1, const char *a2, ...)
{
  return _[a1 addNumberFontSize];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addRTTInfo(void *a1, const char *a2, ...)
{
  return _[a1 addRTTInfo];
}

id objc_msgSend_addScreenSharingTypeSubview(void *a1, const char *a2, ...)
{
  return _[a1 addScreenSharingTypeSubview];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_addUserNotification_listener_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addUserNotification:listener:completionHandler:];
}

id objc_msgSend_addVerifiedBadge(void *a1, const char *a2, ...)
{
  return _[a1 addVerifiedBadge];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 airplaneMode];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
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

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowedNotificationCategories(void *a1, const char *a2, ...)
{
  return _[a1 allowedNotificationCategories];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alwaysShowLocalVideo(void *a1, const char *a2, ...)
{
  return _[a1 alwaysShowLocalVideo];
}

id objc_msgSend_ambientHorizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 ambientHorizontalSizeClass];
}

id objc_msgSend_ambientVerticalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 ambientVerticalSizeClass];
}

id objc_msgSend_analyticsLogger(void *a1, const char *a2, ...)
{
  return _[a1 analyticsLogger];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateAlongsideTransition:];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:animations:];
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:animations:completion:];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return _[a1 animation];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_appendPath_(void *a1, const char *a2, ...)
{
  return [a1 appendPath:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_appleAccountRebrandEnabled(void *a1, const char *a2, ...)
{
  return _[a1 appleAccountRebrandEnabled];
}

id objc_msgSend_applicationOpenURL_(void *a1, const char *a2, ...)
{
  return [a1 applicationOpenURL:];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_applicationTintColor(void *a1, const char *a2, ...)
{
  return _[a1 applicationTintColor];
}

id objc_msgSend_applicationsForUserActivityType_(void *a1, const char *a2, ...)
{
  return [a1 applicationsForUserActivityType:];
}

id objc_msgSend_applyLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 applyLayoutConstraints];
}

id objc_msgSend_areKeysAvailable_(void *a1, const char *a2, ...)
{
  return [a1 areKeysAvailable:];
}

id objc_msgSend_areUnknownContactsBlocked(void *a1, const char *a2, ...)
{
  return _[a1 areUnknownContactsBlocked];
}

id objc_msgSend_arrangedSubviewInColumnAtIndex_rowAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviewInColumnAtIndex:rowAtIndex:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_associateLocalVideoLayers(void *a1, const char *a2, ...)
{
  return _[a1 associateLocalVideoLayers];
}

id objc_msgSend_attributedStringForName_label_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringForName:label:];
}

id objc_msgSend_attributedStringToHighlightText_primaryColour_secondaryColour_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringToHighlightText:primaryColour:secondaryColour:];
}

id objc_msgSend_attributedStringToHighlightText_primaryColour_secondaryColour_style_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringToHighlightText:primaryColour:secondaryColour:style:];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _[a1 attributedText];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_autoresizingMask(void *a1, const char *a2, ...)
{
  return _[a1 autoresizingMask];
}

id objc_msgSend_availabilityForListenerID_forService_(void *a1, const char *a2, ...)
{
  return [a1 availabilityForListenerID:forService:];
}

id objc_msgSend_availableKeyDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 availableKeyDescriptor];
}

id objc_msgSend_avatarLayoutGuideLeadingAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 avatarLayoutGuideLeadingAnchorLayoutConstraintConstant];
}

id objc_msgSend_avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return [a1 avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:];
}

id objc_msgSend_avatarLayoutGuideWidthAnchorLayoutConstraintConstant_(void *a1, const char *a2, ...)
{
  return [a1 avatarLayoutGuideWidthAnchorLayoutConstraintConstant];
}

id objc_msgSend_avatarViewController(void *a1, const char *a2, ...)
{
  return _[a1 avatarViewController];
}

id objc_msgSend_avatarViewControllerSettings(void *a1, const char *a2, ...)
{
  return _[a1 avatarViewControllerSettings];
}

id objc_msgSend_backdropStyle(void *a1, const char *a2, ...)
{
  return _[a1 backdropStyle];
}

id objc_msgSend_backdropView(void *a1, const char *a2, ...)
{
  return _[a1 backdropView];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_badge(void *a1, const char *a2, ...)
{
  return _[a1 badge];
}

id objc_msgSend_baseViewController(void *a1, const char *a2, ...)
{
  return _[a1 baseViewController];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return _[a1 beginningOfDocument];
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRoundedRect:cornerRadius:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blockContacts_(void *a1, const char *a2, ...)
{
  return [a1 blockContacts:];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return _[a1 blockUntilConnected];
}

id objc_msgSend_blockedByExtension(void *a1, const char *a2, ...)
{
  return _[a1 blockedByExtension];
}

id objc_msgSend_blurRadius(void *a1, const char *a2, ...)
{
  return _[a1 blurRadius];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_BOOLForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:defaultValue:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boostQualityOfService(void *a1, const char *a2, ...)
{
  return _[a1 boostQualityOfService];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bottommostLabel(void *a1, const char *a2, ...)
{
  return _[a1 bottommostLabel];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_cachedIsUsingIPadExternalCamera(void *a1, const char *a2, ...)
{
  return _[a1 cachedIsUsingIPadExternalCamera];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_callDirectoryIdentityType(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryIdentityType];
}

id objc_msgSend_callDirectoryManagerIdentificationEntriesChangedNotificationToken(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryManagerIdentificationEntriesChangedNotificationToken];
}

id objc_msgSend_callFilterController(void *a1, const char *a2, ...)
{
  return _[a1 callFilterController];
}

id objc_msgSend_callHistoryController(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryController];
}

id objc_msgSend_callHistoryControllerCallHistoryFetchLimit(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryControllerCallHistoryFetchLimit];
}

id objc_msgSend_callHistoryControllerOptions(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryControllerOptions];
}

id objc_msgSend_callHistorySearchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 callHistorySearchEnabled];
}

id objc_msgSend_callOccurrences(void *a1, const char *a2, ...)
{
  return _[a1 callOccurrences];
}

id objc_msgSend_callProviderCache(void *a1, const char *a2, ...)
{
  return _[a1 callProviderCache];
}

id objc_msgSend_callProviderIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 callProviderIdentifier];
}

id objc_msgSend_callProviderManager(void *a1, const char *a2, ...)
{
  return _[a1 callProviderManager];
}

id objc_msgSend_callService(void *a1, const char *a2, ...)
{
  return _[a1 callService];
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _[a1 callStatus];
}

id objc_msgSend_callType(void *a1, const char *a2, ...)
{
  return _[a1 callType];
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return _[a1 callUUID];
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _[a1 callerId];
}

id objc_msgSend_callerIdForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 callerIdForDisplay];
}

id objc_msgSend_callerIdIsBlocked(void *a1, const char *a2, ...)
{
  return _[a1 callerIdIsBlocked];
}

id objc_msgSend_callerNameForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 callerNameForDisplay];
}

id objc_msgSend_canAttemptEmergencyCallsWithoutCellularConnection(void *a1, const char *a2, ...)
{
  return _[a1 canAttemptEmergencyCallsWithoutCellularConnection];
}

id objc_msgSend_canAttemptEmergencyCallsWithoutCellularConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:];
}

id objc_msgSend_canAttemptTelephonyCallsWithoutCellularConnection(void *a1, const char *a2, ...)
{
  return _[a1 canAttemptTelephonyCallsWithoutCellularConnection];
}

id objc_msgSend_canBecomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 canBecomeFirstResponder];
}

id objc_msgSend_canExceedUnifyingThreshold(void *a1, const char *a2, ...)
{
  return _[a1 canExceedUnifyingThreshold];
}

id objc_msgSend_canLoadOlderRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 canLoadOlderRecentCalls];
}

id objc_msgSend_canMakeEmergencyCallForSenderIdentity_(void *a1, const char *a2, ...)
{
  return [a1 canMakeEmergencyCallForSenderIdentity:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:nil selector:nil object:nil];
}

id objc_msgSend_cancelSearchFetchOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelSearchFetchOperations];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _[a1 capHeight];
}

id objc_msgSend_captureGroup(void *a1, const char *a2, ...)
{
  return _[a1 captureGroup];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 categoryIdentifier];
}

id objc_msgSend_cellClassForCachedCellHeight(void *a1, const char *a2, ...)
{
  return _[a1 cellClassForCachedCellHeight];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForRowAtIndexPath:];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return [a1 characterIsMember:];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_coalescedCallWithCall_usingStrategy_(void *a1, const char *a2, ...)
{
  return [a1 coalescedCallWithCall:usingStrategy:];
}

id objc_msgSend_coalescingStrategy(void *a1, const char *a2, ...)
{
  return _[a1 coalescingStrategy];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_colorForDodge(void *a1, const char *a2, ...)
{
  return _[a1 colorForDodge];
}

id objc_msgSend_colorForLuminance(void *a1, const char *a2, ...)
{
  return _[a1 colorForLuminance];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_columnAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 columnAtIndex:];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return _[a1 commonInit];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_compose(void *a1, const char *a2, ...)
{
  return _[a1 compose];
}

id objc_msgSend_configureForImage_(void *a1, const char *a2, ...)
{
  return [a1 configureForImage:];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:];
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:];
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_priority_(void *a1, const char *a2, ...)
{
  return [a1 constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:];
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return [a1 constraintsWithVisualFormat:options:metrics:views:];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_contactArray(void *a1, const char *a2, ...)
{
  return _[a1 contactArray];
}

id objc_msgSend_contactAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 contactAtIndex:];
}

id objc_msgSend_contactCache(void *a1, const char *a2, ...)
{
  return _[a1 contactCache];
}

id objc_msgSend_contactForHandle_(void *a1, const char *a2, ...)
{
  return [a1 contactForHandle:];
}

id objc_msgSend_contactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 contactForHandle:isoCountryCode:metadataCache:];
}

id objc_msgSend_contactForRecentCall_keyDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 contactForRecentCall:keyDescriptors:];
}

id objc_msgSend_contactForRecentCall_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 contactForRecentCall:metadataCache:];
}

id objc_msgSend_contactFormatter(void *a1, const char *a2, ...)
{
  return _[a1 contactFormatter];
}

id objc_msgSend_contactHandles(void *a1, const char *a2, ...)
{
  return _[a1 contactHandles];
}

id objc_msgSend_contactHandlesForHandle_(void *a1, const char *a2, ...)
{
  return [a1 contactHandlesForHandle:];
}

id objc_msgSend_contactHandlesForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 contactHandlesForRecentCalls:];
}

id objc_msgSend_contactLabel(void *a1, const char *a2, ...)
{
  return _[a1 contactLabel];
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return _[a1 contactRelations];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_contactType(void *a1, const char *a2, ...)
{
  return _[a1 contactType];
}

id objc_msgSend_contactViewControllerForRecentCall_contact_recentsController_(void *a1, const char *a2, ...)
{
  return [a1 contactViewControllerForRecentCall:contact:recentsController:];
}

id objc_msgSend_contactsByHandleForRecentCall_keyDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 contactsByHandleForRecentCall:keyDescriptors:];
}

id objc_msgSend_contactsForHandles_keyDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 contactsForHandles:keyDescriptors:];
}

id objc_msgSend_contactsForHandles_keyDescriptors_alwaysUnifyLabeledValues_(void *a1, const char *a2, ...)
{
  return [a1 contactsForHandles:keyDescriptors:alwaysUnifyLabeledValues:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 contentUnavailable];
}

id objc_msgSend_contentUnavailableView(void *a1, const char *a2, ...)
{
  return _[a1 contentUnavailableView];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentViewAnimationsFadeInsteadOfMove(void *a1, const char *a2, ...)
{
  return _[a1 contentViewAnimationsFadeInsteadOfMove];
}

id objc_msgSend_contentViewCanRotate(void *a1, const char *a2, ...)
{
  return _[a1 contentViewCanRotate];
}

id objc_msgSend_contentViewOffscreenEdge(void *a1, const char *a2, ...)
{
  return _[a1 contentViewOffscreenEdge];
}

id objc_msgSend_contentViewSizeForFaceTime(void *a1, const char *a2, ...)
{
  return _[a1 contentViewSizeForFaceTime];
}

id objc_msgSend_continueButton(void *a1, const char *a2, ...)
{
  return _[a1 continueButton];
}

id objc_msgSend_continueHandoffEligibleConversation(void *a1, const char *a2, ...)
{
  return _[a1 continueHandoffEligibleConversation];
}

id objc_msgSend_continueRegistrationForAccount_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 continueRegistrationForAccount:completionBlock:];
}

id objc_msgSend_conversationForCallUID_(void *a1, const char *a2, ...)
{
  return [a1 conversationForCallUID:];
}

id objc_msgSend_conversationHandoffEnabled(void *a1, const char *a2, ...)
{
  return _[a1 conversationHandoffEnabled];
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:toView:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCarrierBundleValue_keyHierarchy_bundleType_error_(void *a1, const char *a2, ...)
{
  return [a1 copyCarrierBundleValue:keyHierarchy:bundleType:error:];
}

id objc_msgSend_copyCarrierBundleValueWithDefault_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleValueWithDefault:key:bundleType:error:");
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_countOfExcludedHandles(void *a1, const char *a2, ...)
{
  return _[a1 countOfExcludedHandles];
}

id objc_msgSend_createFaceTimeFirstRunViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 createFaceTimeFirstRunViewIfNeeded];
}

id objc_msgSend_createRingImageWithSize_strokeWidth_color_(void *a1, const char *a2, ...)
{
  return [a1 createRingImageWithSize:strokeWidth:color:];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentCycleStringIndex(void *a1, const char *a2, ...)
{
  return _[a1 currentCycleStringIndex];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentInputDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentInputDevice];
}

id objc_msgSend_currentInputIsExternal(void *a1, const char *a2, ...)
{
  return _[a1 currentInputIsExternal];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return _[a1 currentLayout];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationCenter];
}

id objc_msgSend_currentTabViewType(void *a1, const char *a2, ...)
{
  return _[a1 currentTabViewType];
}

id objc_msgSend_customInfoButtonAction(void *a1, const char *a2, ...)
{
  return _[a1 customInfoButtonAction];
}

id objc_msgSend_cycleStrings(void *a1, const char *a2, ...)
{
  return _[a1 cycleStrings];
}

id objc_msgSend_cycleTimer(void *a1, const char *a2, ...)
{
  return _[a1 cycleTimer];
}

id objc_msgSend_dataSourcePrefetchingOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 dataSourcePrefetchingOperationQueue];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return _[a1 defaultAction];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultPNGName(void *a1, const char *a2, ...)
{
  return _[a1 defaultPNGName];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return _[a1 defaultSettings];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateToQueue(void *a1, const char *a2, ...)
{
  return _[a1 delegateToQueue];
}

id objc_msgSend_deleteAllRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllRecentCalls];
}

id objc_msgSend_deleteBackward(void *a1, const char *a2, ...)
{
  return _[a1 deleteBackward];
}

id objc_msgSend_deleteCharacter(void *a1, const char *a2, ...)
{
  return _[a1 deleteCharacter];
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return [a1 deleteCharactersInRange:];
}

id objc_msgSend_deleteRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecentCalls];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return _[a1 descriptorForRequiredKeys];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeysForStyle:];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailsView(void *a1, const char *a2, ...)
{
  return _[a1 detailsView];
}

id objc_msgSend_detailsViewController(void *a1, const char *a2, ...)
{
  return _[a1 detailsViewController];
}

id objc_msgSend_deviceIsFrontFacingOrExternal_(void *a1, const char *a2, ...)
{
  return [a1 deviceIsFrontFacingOrExternal];
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 deviceOrientation];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dialRequestForCallProvider_handle_(void *a1, const char *a2, ...)
{
  return [a1 dialRequestForCallProvider:handle:];
}

id objc_msgSend_dialRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 dialRequestForRecentCall:];
}

id objc_msgSend_dialType(void *a1, const char *a2, ...)
{
  return _[a1 dialType];
}

id objc_msgSend_dialerField_stringWasPasted_(void *a1, const char *a2, ...)
{
  return [a1 dialerField:stringWasPasted:];
}

id objc_msgSend_dialerLCDFieldTextDidChange_(void *a1, const char *a2, ...)
{
  return [a1 dialerLCDFieldTextDidChange:];
}

id objc_msgSend_dialerType(void *a1, const char *a2, ...)
{
  return _[a1 dialerType];
}

id objc_msgSend_dialerView_stringWasPasted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialerView:stringWasPasted:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didDeferStartCameraAction(void *a1, const char *a2, ...)
{
  return _[a1 didDeferStartCameraAction];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_disableAnimation(void *a1, const char *a2, ...)
{
  return _[a1 disableAnimation];
}

id objc_msgSend_disabledOverlayView(void *a1, const char *a2, ...)
{
  return _[a1 disabledOverlayView];
}

id objc_msgSend_disconnectedReason(void *a1, const char *a2, ...)
{
  return _[a1 disconnectedReason];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_displayUIAnimated_(void *a1, const char *a2, ...)
{
  return [a1 displayUIAnimated:];
}

id objc_msgSend_displayedCalls(void *a1, const char *a2, ...)
{
  return _[a1 displayedCalls];
}

id objc_msgSend_displayedLabel(void *a1, const char *a2, ...)
{
  return _[a1 displayedLabel];
}

id objc_msgSend_displayedName(void *a1, const char *a2, ...)
{
  return _[a1 displayedName];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_durationAndDataLabel(void *a1, const char *a2, ...)
{
  return _[a1 durationAndDataLabel];
}

id objc_msgSend_durationAndDataText(void *a1, const char *a2, ...)
{
  return _[a1 durationAndDataText];
}

id objc_msgSend_dynamicLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicLabelColor];
}

id objc_msgSend_dynamicSecondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicSecondaryLabelColor];
}

id objc_msgSend_dynamicTertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicTertiaryLabelColor];
}

id objc_msgSend_effectForBlurEffect_style_(void *a1, const char *a2, ...)
{
  return [a1 effectForBlurEffect:style:];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 effectWithStyle:];
}

id objc_msgSend_effectiveBaselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 effectiveBaselineOffsetFromBottom];
}

id objc_msgSend_effectiveBaselineOffsetFromContentBottom(void *a1, const char *a2, ...)
{
  return _[a1 effectiveBaselineOffsetFromContentBottom];
}

id objc_msgSend_effectiveFirstBaselineOffsetFromContentTop(void *a1, const char *a2, ...)
{
  return _[a1 effectiveFirstBaselineOffsetFromContentTop];
}

id objc_msgSend_effectiveFirstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 effectiveFirstBaselineOffsetFromTop];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 emailAddresses];
}

id objc_msgSend_emergencyItemLabelText_(void *a1, const char *a2, ...)
{
  return [a1 emergencyItemLabelText:];
}

id objc_msgSend_emergencyItemsText(void *a1, const char *a2, ...)
{
  return _[a1 emergencyItemsText];
}

id objc_msgSend_enableAnimation(void *a1, const char *a2, ...)
{
  return _[a1 enableAnimation];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return [a1 endEditing:];
}

id objc_msgSend_endOfDocument(void *a1, const char *a2, ...)
{
  return _[a1 endOfDocument];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_enumerateRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRangesUsingBlock:");
}

id objc_msgSend_errorAlertMessage(void *a1, const char *a2, ...)
{
  return _[a1 errorAlertMessage];
}

id objc_msgSend_errorAlertTitle(void *a1, const char *a2, ...)
{
  return _[a1 errorAlertTitle];
}

id objc_msgSend_errorLabel(void *a1, const char *a2, ...)
{
  return _[a1 errorLabel];
}

id objc_msgSend_escapedPatternForString_(void *a1, const char *a2, ...)
{
  return [a1 escapedPatternForString:];
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeFetchRequest:error:];
}

id objc_msgSend_extensionsWithMatchingAttributes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsWithMatchingAttributes:completion:");
}

id objc_msgSend_faceTimeAudioIsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeAudioIsAvailable];
}

id objc_msgSend_faceTimeContainerViewController(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeContainerViewController];
}

id objc_msgSend_faceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeProvider];
}

id objc_msgSend_faceTimeVideoIsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeVideoIsAvailable];
}

id objc_msgSend_facetimeService(void *a1, const char *a2, ...)
{
  return _[a1 facetimeService];
}

id objc_msgSend_fadeInAnimated_(void *a1, const char *a2, ...)
{
  return [a1 fadeInAnimated:];
}

id objc_msgSend_fadeOutAnimated_(void *a1, const char *a2, ...)
{
  return [a1 fadeOutAnimated:];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_favoritesAudioGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 favoritesAudioGlyphImage];
}

id objc_msgSend_favoritesMailGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 favoritesMailGlyphImage];
}

id objc_msgSend_favoritesMessageGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 favoritesMessageGlyphImage];
}

id objc_msgSend_favoritesTTYDirectGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 favoritesTTYDirectGlyphImage];
}

id objc_msgSend_favoritesTTYRelayGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 favoritesTTYRelayGlyphImage];
}

id objc_msgSend_favoritesVideoGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 favoritesVideoGlyphImage];
}

id objc_msgSend_fbsOrientationObserver(void *a1, const char *a2, ...)
{
  return _[a1 fbsOrientationObserver];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_fetchCallProviderForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 fetchCallProviderForRecentCall:];
}

id objc_msgSend_fetchCellularRadioEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fetchCellularRadioEnabled];
}

id objc_msgSend_fetchContactFormatter(void *a1, const char *a2, ...)
{
  return _[a1 fetchContactFormatter];
}

id objc_msgSend_fetchContactsForHandles_(void *a1, const char *a2, ...)
{
  return [a1 fetchContactsForHandles:];
}

id objc_msgSend_fetchContactsForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 fetchContactsForRecentCalls:];
}

id objc_msgSend_fetchImageForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 fetchImageForRecentCall];
}

id objc_msgSend_fetchMetadataForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 fetchMetadataForRecentCalls];
}

id objc_msgSend_fetchMutableItemForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 fetchMutableItemForRecentCall];
}

id objc_msgSend_fetchMutableItemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMutableItemForRecentCall:numberOfOccurences:");
}

id objc_msgSend_fetchNumberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 fetchNumberFormatter];
}

id objc_msgSend_fetchRTTConversationForCallUUID_(void *a1, const char *a2, ...)
{
  return [a1 fetchRTTConversationForCallUUID:];
}

id objc_msgSend_fetchRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 fetchRecentCalls];
}

id objc_msgSend_fetchRingerSwitchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fetchRingerSwitchEnabled];
}

id objc_msgSend_fetchUnifiedContactForID_withDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 fetchUnifiedContactForID:withDescriptors:];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return [a1 filterWithType:];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _[a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorByAddingAttributes:];
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return _[a1 fontName];
}

id objc_msgSend_fontSize(void *a1, const char *a2, ...)
{
  return _[a1 fontSize];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:];
}

id objc_msgSend_foregroundView(void *a1, const char *a2, ...)
{
  return _[a1 foregroundView];
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return [a1 formUnionWithCharacterSet:];
}

id objc_msgSend_formattedInitiatorValue(void *a1, const char *a2, ...)
{
  return _[a1 formattedInitiatorValue];
}

id objc_msgSend_formattedNameForHandle_countryCode_(void *a1, const char *a2, ...)
{
  return [a1 formattedNameForHandle:countryCode:];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return [a1 functionWithName:];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return _[a1 generalPasteboard];
}

id objc_msgSend_generateDetailsView(void *a1, const char *a2, ...)
{
  return _[a1 generateDetailsView];
}

id objc_msgSend_generateNumberLabelHorizontalConstraints(void *a1, const char *a2, ...)
{
  return _[a1 generateNumberLabelHorizontalConstraints];
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return [a1 getSubscriptionInfoWithError:];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _[a1 gridView];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _[a1 groupName];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 handleAtIndex:];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInFunction:file:lineNumber:description:];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForCHRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 handleForCHRecentCall];
}

id objc_msgSend_handleKeyboardEvent_(void *a1, const char *a2, ...)
{
  return [a1 handleKeyboardEvent:];
}

id objc_msgSend_handleRecentsDetailsViewURL_(void *a1, const char *a2, ...)
{
  return [a1 handleRecentsDetailsViewURL:];
}

id objc_msgSend_handleShortcutItem_(void *a1, const char *a2, ...)
{
  return [a1 handleShortcutItem:];
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _[a1 handleType];
}

id objc_msgSend_handleURL_(void *a1, const char *a2, ...)
{
  return [a1 handleURL:];
}

id objc_msgSend_handleUserActivityContinuation_(void *a1, const char *a2, ...)
{
  return [a1 handleUserActivityContinuation:];
}

id objc_msgSend_handleVideoMessagePlaybackURL_(void *a1, const char *a2, ...)
{
  return [a1 handleVideoMessagePlaybackURL:];
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 handleWithDestinationID:];
}

id objc_msgSend_handleWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return [a1 handleWithDictionaryRepresentation:];
}

id objc_msgSend_handsetDialerSize(void *a1, const char *a2, ...)
{
  return _[a1 handsetDialerSize];
}

id objc_msgSend_handsetDialerSpacing(void *a1, const char *a2, ...)
{
  return _[a1 handsetDialerSpacing];
}

id objc_msgSend_hasBeenPersisted(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenPersisted];
}

id objc_msgSend_hasEnhancedVoicemail(void *a1, const char *a2, ...)
{
  return _[a1 hasEnhancedVoicemail];
}

id objc_msgSend_hasMultipleSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 hasMultipleSenderIdentities];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasRecentsListViewController(void *a1, const char *a2, ...)
{
  return _[a1 hasRecentsListViewController];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headerLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 headerLayoutGuide];
}

id objc_msgSend_headerViewNumberOfCallsToShow(void *a1, const char *a2, ...)
{
  return _[a1 headerViewNumberOfCallsToShow];
}

id objc_msgSend_headerViewShowsAllRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 headerViewShowsAllRecentCalls];
}

id objc_msgSend_hideContent(void *a1, const char *a2, ...)
{
  return _[a1 hideContent];
}

id objc_msgSend_hideDetailsViewController(void *a1, const char *a2, ...)
{
  return _[a1 hideDetailsViewController];
}

id objc_msgSend_highlightKeyAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 highlightKeyAtIndex:];
}

id objc_msgSend_highlightPropertyWithKey_identifier_important_(void *a1, const char *a2, ...)
{
  return [a1 highlightPropertyWithKey:identifier:important:];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityExtension(void *a1, const char *a2, ...)
{
  return _[a1 identityExtension];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageForActionType_(void *a1, const char *a2, ...)
{
  return [a1 imageForActionType:];
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:compatibleWithTraitCollection:];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageOrientation];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:scale:orientation:];
}

id objc_msgSend_inCall(void *a1, const char *a2, ...)
{
  return _[a1 inCall];
}

id objc_msgSend_inCallBottomBarSpacing(void *a1, const char *a2, ...)
{
  return _[a1 inCallBottomBarSpacing];
}

id objc_msgSend_inCallControlSpacing(void *a1, const char *a2, ...)
{
  return _[a1 inCallControlSpacing];
}

id objc_msgSend_incomingVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 incomingVideoCall];
}

id objc_msgSend_increaseCallHistoryEnabled(void *a1, const char *a2, ...)
{
  return _[a1 increaseCallHistoryEnabled];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForRow:inSection:];
}

id objc_msgSend_indexSetToHighlightDigitsInText_(void *a1, const char *a2, ...)
{
  return [a1 indexSetToHighlightDigitsInText:];
}

id objc_msgSend_initWithArrangedSubviewRows_(void *a1, const char *a2, ...)
{
  return [a1 initWithArrangedSubviewRows:];
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return [a1 initWithArrangedSubviews:];
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 initWithAttributedString:];
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleType:];
}

id objc_msgSend_initWithCGFloat_(void *a1, const char *a2, ...)
{
  return [a1 initWithCGFloat:];
}

id objc_msgSend_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithCallHistoryController:callHistoryController callProviderManager:callProviderManager contactStore:contactStore suggestedContactStore:suggestedContactStore metadataCache:metadataCache];
}

id objc_msgSend_initWithCallProviderManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithCallProviderManager:];
}

id objc_msgSend_initWithDataProviders_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProviders:];
}

id objc_msgSend_initWithDestinationID_isoCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 initWithDestinationID:isoCountryCode:];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffect:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_callUUID_ttyType_timeLabel_statusLabel_durationAndDataText_emergencyItemsText_verified_screenSharingTypeText_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:callUUID:ttyType:timeLabel:statusLabel:durationAndDataText:emergencyItemsText:verified:screenSharingTypeText:];
}

id objc_msgSend_initWithFrame_privateStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:privateStyle:];
}

id objc_msgSend_initWithFrame_recentCall_occurrenceDate_status_duration_type_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:recentCall:occurrenceDate:status:duration:type:];
}

id objc_msgSend_initWithFrame_recentCall_occurrenceDate_status_duration_type_dataUsage_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:recentCall:occurrenceDate:status:duration:type:dataUsage:];
}

id objc_msgSend_initWithFrame_title_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:title:];
}

id objc_msgSend_initWithHandles_(void *a1, const char *a2, ...)
{
  return [a1 initWithHandles:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeysToFetch:];
}

id objc_msgSend_initWithMetadataCache_callProviderManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetadataCache:callProviderManager:];
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithRemoteMembers_(void *a1, const char *a2, ...)
{
  return [a1 initWithRemoteMembers:];
}

id objc_msgSend_initWithServiceType_presentationViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithServiceType:presentationViewController:];
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return [a1 initWithSettings:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:reuseIdentifier:];
}

id objc_msgSend_initWithTabBarSystemItem_tag_(void *a1, const char *a2, ...)
{
  return [a1 initWithTabBarSystemItem:tag:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:scrollView:completionHandler:];
}

id objc_msgSend_initWithTitle_frame_theme_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:frame:theme:];
}

id objc_msgSend_initWithTitle_image_selectedImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:selectedImage:];
}

id objc_msgSend_initWithType_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:value:];
}

id objc_msgSend_initWithUrlString_username_userIdentifier_service_(void *a1, const char *a2, ...)
{
  return [a1 initWithUrlString:username:userIdentifier:service:];
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_initializeCachedValues(void *a1, const char *a2, ...)
{
  return _[a1 initializeCachedValues];
}

id objc_msgSend_initializeIconAndTitle_(void *a1, const char *a2, ...)
{
  return [a1 initializeIconAndTitle:];
}

id objc_msgSend_inputDevices(void *a1, const char *a2, ...)
{
  return _[a1 inputDevices];
}

id objc_msgSend_insertColumnAtIndex_withArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertColumnAtIndex:withArrangedSubviews:");
}

id objc_msgSend_insertSublayer_below_(void *a1, const char *a2, ...)
{
  return [a1 insertSublayer:below:];
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:atIndex:];
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:below:];
}

id objc_msgSend_instantMessageAddresses(void *a1, const char *a2, ...)
{
  return _[a1 instantMessageAddresses];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_interfaceOrientationForDeviceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientationForDeviceOrientation:];
}

id objc_msgSend_intrinsicContentHeight(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentHeight];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_invitationPreferencesForRecentCall(void *a1, const char *a2, ...)
{
  return _[a1 invitationPreferencesForRecentCall];
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isBlocked];
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return _[a1 isConnecting];
}

id objc_msgSend_isContentViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isContentViewLoaded];
}

id objc_msgSend_isConversation(void *a1, const char *a2, ...)
{
  return _[a1 isConversation];
}

id objc_msgSend_isDecelerating(void *a1, const char *a2, ...)
{
  return _[a1 isDecelerating];
}

id objc_msgSend_isDeviceCapableOfFaceTimeAudio(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceCapableOfFaceTimeAudio];
}

id objc_msgSend_isDeviceCapableOfFaceTimeVideo(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceCapableOfFaceTimeVideo];
}

id objc_msgSend_isDeviceCapableOfTelephonyCalls(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceCapableOfTelephonyCalls];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _[a1 isDragging];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEmergencyNumberForDigits_senderIdentityUUID_(void *a1, const char *a2, ...)
{
  return [a1 isEmergencyNumberForDigits:senderIdentityUUID:];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isEmpty];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFaceTimeAppVideoMessagePlaybackURL(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeAppVideoMessagePlaybackURL];
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isFaceTimeRecentsDetailsViewURL(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeRecentsDetailsViewURL];
}

id objc_msgSend_isGeminiCapable(void *a1, const char *a2, ...)
{
  return _[a1 isGeminiCapable];
}

id objc_msgSend_isHostedInRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 isHostedInRemoteViewController];
}

id objc_msgSend_isIncoming(void *a1, const char *a2, ...)
{
  return _[a1 isIncoming];
}

id objc_msgSend_isInitializationBlockQueued(void *a1, const char *a2, ...)
{
  return _[a1 isInitializationBlockQueued];
}

id objc_msgSend_isJunk(void *a1, const char *a2, ...)
{
  return _[a1 isJunk];
}

id objc_msgSend_isKeyAvailable_(void *a1, const char *a2, ...)
{
  return [a1 isKeyAvailable:];
}

id objc_msgSend_isLikePhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 isLikePhoneNumber:];
}

id objc_msgSend_isLocalizedSubtitleUnknown_(void *a1, const char *a2, ...)
{
  return [a1 isLocalizedSubtitleUnknown:];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _[a1 isMe];
}

id objc_msgSend_isMenuVisible(void *a1, const char *a2, ...)
{
  return _[a1 isMenuVisible];
}

id objc_msgSend_isNumeric(void *a1, const char *a2, ...)
{
  return _[a1 isNumeric];
}

id objc_msgSend_isOneToOneModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isOneToOneModeEnabled];
}

id objc_msgSend_isPreferredContentSizeCategoryAccessible(void *a1, const char *a2, ...)
{
  return _[a1 isPreferredContentSizeCategoryAccessible];
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return _[a1 isRead];
}

id objc_msgSend_isReadyForPreview(void *a1, const char *a2, ...)
{
  return _[a1 isReadyForPreview];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRecapAvailable];
}

id objc_msgSend_isReloadingData(void *a1, const char *a2, ...)
{
  return _[a1 isReloadingData];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return _[a1 isSimHidden];
}

id objc_msgSend_isSpringBoardLocked(void *a1, const char *a2, ...)
{
  return _[a1 isSpringBoardLocked];
}

id objc_msgSend_isSpringBoardPasscodeLocked(void *a1, const char *a2, ...)
{
  return _[a1 isSpringBoardPasscodeLocked];
}

id objc_msgSend_isStatusBarHidden(void *a1, const char *a2, ...)
{
  return _[a1 isStatusBarHidden];
}

id objc_msgSend_isSuggested(void *a1, const char *a2, ...)
{
  return _[a1 isSuggested];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isSuspended];
}

id objc_msgSend_isSuspendedEventsOnly(void *a1, const char *a2, ...)
{
  return _[a1 isSuspendedEventsOnly];
}

id objc_msgSend_isSystemItem(void *a1, const char *a2, ...)
{
  return _[a1 isSystemItem];
}

id objc_msgSend_isSystemProvider(void *a1, const char *a2, ...)
{
  return _[a1 isSystemProvider];
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 isTelephonyProvider];
}

id objc_msgSend_isThumperCallingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isThumperCallingEnabled];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _[a1 isTracking];
}

id objc_msgSend_isTranscription(void *a1, const char *a2, ...)
{
  return _[a1 isTranscription];
}

id objc_msgSend_isUIInitialized(void *a1, const char *a2, ...)
{
  return _[a1 isUIInitialized];
}

id objc_msgSend_isUsingIPadExternalCamera(void *a1, const char *a2, ...)
{
  return _[a1 isUsingIPadExternalCamera];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _[a1 isVideo];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isZoomBouncing(void *a1, const char *a2, ...)
{
  return _[a1 isZoomBouncing];
}

id objc_msgSend_isZooming(void *a1, const char *a2, ...)
{
  return _[a1 isZooming];
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCode];
}

id objc_msgSend_itemCache(void *a1, const char *a2, ...)
{
  return _[a1 itemCache];
}

id objc_msgSend_itemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return [a1 itemForRecentCall:numberOfOccurences:];
}

id objc_msgSend_joinConversationRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 joinConversationRequestForRecentCall];
}

id objc_msgSend_junkIdentificationCategory(void *a1, const char *a2, ...)
{
  return _[a1 junkIdentificationCategory];
}

id objc_msgSend_keyIndex(void *a1, const char *a2, ...)
{
  return _[a1 keyIndex];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return _[a1 labelID];
}

id objc_msgSend_labeledValueForEmailAddress_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueForEmailAddress:];
}

id objc_msgSend_labeledValueForPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueForPhoneNumber:];
}

id objc_msgSend_labeledValueForSocialProfileWithUsername_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueForSocialProfileWithUsername:];
}

id objc_msgSend_labeledValueWithLabel_value_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueWithLabel:value:];
}

id objc_msgSend_largeTitleDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 largeTitleDisplayMode];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastValidInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 lastValidInterfaceOrientation];
}

id objc_msgSend_launchAppForDialRequest_completion_(void *a1, const char *a2, ...)
{
  return [a1 launchAppForDialRequest:completion:];
}

id objc_msgSend_launchAppForJoinRequest_(void *a1, const char *a2, ...)
{
  return [a1 launchAppForJoinRequest];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIsLocked_(void *a1, const char *a2, ...)
{
  return [a1 layoutIsLocked:];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return _[a1 layoutSubviews];
}

id objc_msgSend_layoutTextField(void *a1, const char *a2, ...)
{
  return _[a1 layoutTextField];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_learnMoreButton(void *a1, const char *a2, ...)
{
  return _[a1 learnMoreButton];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 linkWithBundleIdentifier:];
}

id objc_msgSend_listCellConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 listCellConfiguration];
}

id objc_msgSend_loadLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 loadLayoutConstraints];
}

id objc_msgSend_loadOlderCallsIfNecessaryForRemainingRowCount_(void *a1, const char *a2, ...)
{
  return [a1 loadOlderCallsIfNecessaryForRemainingRowCount:];
}

id objc_msgSend_loadOlderRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 loadOlderRecentCalls];
}

id objc_msgSend_loadRTTConversations(void *a1, const char *a2, ...)
{
  return _[a1 loadRTTConversations];
}

id objc_msgSend_loadRootViewAndContentViews(void *a1, const char *a2, ...)
{
  return _[a1 loadRootViewAndContentViews];
}

id objc_msgSend_loadSubviews(void *a1, const char *a2, ...)
{
  return _[a1 loadSubviews];
}

id objc_msgSend_localFrontLayer(void *a1, const char *a2, ...)
{
  return _[a1 localFrontLayer];
}

id objc_msgSend_localParticipantUUID(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantUUID];
}

id objc_msgSend_localSenderIdentityAccountUUID(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentityAccountUUID];
}

id objc_msgSend_localSenderIdentityUUID(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentityUUID];
}

id objc_msgSend_localVideoView(void *a1, const char *a2, ...)
{
  return _[a1 localVideoView];
}

id objc_msgSend_localVideoViewController(void *a1, const char *a2, ...)
{
  return _[a1 localVideoViewController];
}

id objc_msgSend_localizedBlockedByExtensionName(void *a1, const char *a2, ...)
{
  return _[a1 localizedBlockedByExtensionName];
}

id objc_msgSend_localizedCount(void *a1, const char *a2, ...)
{
  return _[a1 localizedCount];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedDisplayStringForLabel_propertyName_(void *a1, const char *a2, ...)
{
  return [a1 localizedDisplayStringForLabel:propertyName:];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedSenderIdentityTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedSenderIdentityTitle];
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_localizedSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedSubtitle];
}

id objc_msgSend_localizedSubtitleCache(void *a1, const char *a2, ...)
{
  return _[a1 localizedSubtitleCache];
}

id objc_msgSend_localizedSubtitleForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitleForRecentCall];
}

id objc_msgSend_localizedSubtitleForRecentCall_handle_contact_(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitleForRecentCall:handle:contact:];
}

id objc_msgSend_localizedSubtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitleForRecentEmergencyCall];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_localizedValidHandlesTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedValidHandlesTitle];
}

id objc_msgSend_logEvent_withCoreAnalyticsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logEvent:withCoreAnalyticsDictionary:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mailActionImage(void *a1, const char *a2, ...)
{
  return _[a1 mailActionImage];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_mainNumberLabel(void *a1, const char *a2, ...)
{
  return _[a1 mainNumberLabel];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeInterfaceOrientationFrom_whenFailing_(void *a1, const char *a2, ...)
{
  return [a1 makeInterfaceOrientationFrom:whenFailing:];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:];
}

id objc_msgSend_markRecentAudioCallsAsRead(void *a1, const char *a2, ...)
{
  return _[a1 markRecentAudioCallsAsRead];
}

id objc_msgSend_markRecentCallsAsRead(void *a1, const char *a2, ...)
{
  return _[a1 markRecentCallsAsRead];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_messagesActionImage(void *a1, const char *a2, ...)
{
  return _[a1 messagesActionImage];
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _[a1 metadataCache];
}

id objc_msgSend_metadataDestinationIDsForCHRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 metadataDestinationIDsForCHRecentCall:];
}

id objc_msgSend_metadataDestinationIDsForCHRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 metadataDestinationIDsForCHRecentCalls:];
}

id objc_msgSend_metadataForDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 metadataForDestinationID:];
}

id objc_msgSend_metadataForProvider_(void *a1, const char *a2, ...)
{
  return [a1 metadataForProvider:];
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return [a1 methodForSelector:];
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 metricsForTextStyle:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameAndLabelFontSize(void *a1, const char *a2, ...)
{
  return _[a1 nameAndLabelFontSize];
}

id objc_msgSend_nameAndLabelLabel(void *a1, const char *a2, ...)
{
  return _[a1 nameAndLabelLabel];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_needsManualInCallSounds(void *a1, const char *a2, ...)
{
  return _[a1 needsManualInCallSounds];
}

id objc_msgSend_needsReloadData(void *a1, const char *a2, ...)
{
  return _[a1 needsReloadData];
}

id objc_msgSend_networkReachable(void *a1, const char *a2, ...)
{
  return _[a1 networkReachable];
}

id objc_msgSend_networkUnavailableAlertControllerWithCallProvider_dialType_senderIdentityUUID_(void *a1, const char *a2, ...)
{
  return [a1 networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:];
}

id objc_msgSend_newAddContactButton(void *a1, const char *a2, ...)
{
  return _[a1 newAddContactButton];
}

id objc_msgSend_newSummaryViewForRecentCall_occurrenceDate_status_duration_type_dataUsage_(void *a1, const char *a2, ...)
{
  return [a1 newSummaryViewForRecentCall:occurrenceDate:status:duration:type:dataUsage:];
}

id objc_msgSend_newWithTestName_parameters_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWithTestName:parameters:completionHandler:");
}

id objc_msgSend_newestSuggestedContactForDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 newestSuggestedContactForDestinationID:];
}

id objc_msgSend_nextFocusedItem(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedItem];
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedValue];
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 notificationCenter];
}

id objc_msgSend_notificationEvent(void *a1, const char *a2, ...)
{
  return _[a1 notificationEvent];
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeCalls_(void *a1, const char *a2, ...)
{
  return [a1 notifyDelegatesRecentsController:didChangeCalls:];
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeUnreadCallCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didChangeUnreadCallCount:");
}

id objc_msgSend_notifyDelegatesRecentsController_didCompleteFetchingCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didCompleteFetchingCalls:");
}

id objc_msgSend_notifyDelegatesRecentsController_didUpdateCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didUpdateCalls:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return [a1 numberForKey:defaultValue:];
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 numberFormatter];
}

id objc_msgSend_numberLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 numberLabelFont];
}

id objc_msgSend_numberLabelHorizontalConstraints(void *a1, const char *a2, ...)
{
  return _[a1 numberLabelHorizontalConstraints];
}

id objc_msgSend_numberLabelMinimumFontSize(void *a1, const char *a2, ...)
{
  return _[a1 numberLabelMinimumFontSize];
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _[a1 numberOfColumns];
}

id objc_msgSend_numberOfOccurrences(void *a1, const char *a2, ...)
{
  return _[a1 numberOfOccurrences];
}

id objc_msgSend_numberTextField(void *a1, const char *a2, ...)
{
  return _[a1 numberTextField];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithCGFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithCGFloat:];
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

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openApplication_options_withResult_(void *a1, const char *a2, ...)
{
  return [a1 openApplication:options:withResult:];
}

id objc_msgSend_openURL_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:withCompletionHandler:];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orderFront_(void *a1, const char *a2, ...)
{
  return [a1 orderFront:];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return _[a1 origin];
}

id objc_msgSend_originalAuthKitViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 originalAuthKitViewHeight];
}

id objc_msgSend_outgoingLocalParticipantUUID(void *a1, const char *a2, ...)
{
  return _[a1 outgoingLocalParticipantUUID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_pauseCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 pauseCharacterSet];
}

id objc_msgSend_performDialRequest_(void *a1, const char *a2, ...)
{
  return [a1 performDialRequest:];
}

id objc_msgSend_performNetworkAccessFlowIfAllowed_ignoreForeground_completion_(void *a1, const char *a2, ...)
{
  return [a1 performNetworkAccessFlowIfAllowed:ignoreForeground:completion:];
}

id objc_msgSend_performScrollTestWithName_options_(void *a1, const char *a2, ...)
{
  return [a1 performScrollTestWithName:options:];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:];
}

id objc_msgSend_performSynchronousBlock_(void *a1, const char *a2, ...)
{
  return [a1 performSynchronousBlock:];
}

id objc_msgSend_performTapActionCancelForHighlightedKey(void *a1, const char *a2, ...)
{
  return _[a1 performTapActionCancelForHighlightedKey];
}

id objc_msgSend_performTestWithName_options_(void *a1, const char *a2, ...)
{
  return [a1 performTestWithName:options:];
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return [a1 performWithoutAnimation:];
}

id objc_msgSend_phCarPlayImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 phCarPlayImageNamed:];
}

id objc_msgSend_phPathForImageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return [a1 phPathForImageNamed:inBundle:];
}

id objc_msgSend_phPreferredBoldFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 phPreferredBoldFontForTextStyle:];
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 phPreferredFontDescriptorForTextStyle:];
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:");
}

id objc_msgSend_phPreferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 phPreferredFontForTextStyle:];
}

id objc_msgSend_ph_supportsLocalParticipantBadge(void *a1, const char *a2, ...)
{
  return [a1 ph_supportsLocalParticipantBadge];
}

id objc_msgSend_phoneKit_isAuthorized(void *a1, const char *a2, ...)
{
  return [a1 phoneKit_isAuthorized];
}

id objc_msgSend_phoneNumberWithDigits_countryCode_(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberWithDigits:countryCode:];
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberWithStringValue:];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_phoneRecentsAvatarsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 phoneRecentsAvatarsEnabled];
}

id objc_msgSend_pidForApplication_(void *a1, const char *a2, ...)
{
  return [a1 pidForApplication:];
}

id objc_msgSend_pillView(void *a1, const char *a2, ...)
{
  return _[a1 pillView];
}

id objc_msgSend_pillViewTopOffset(void *a1, const char *a2, ...)
{
  return _[a1 pillViewTopOffset];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_populateCachesForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 populateCachesForRecentCalls:];
}

id objc_msgSend_populateItemCacheForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 populateItemCacheForRecentCalls:];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_positionFromPosition_offset_(void *a1, const char *a2, ...)
{
  return [a1 positionFromPosition:offset:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return _[a1 postalAddresses];
}

id objc_msgSend_predicateForContactsMatchingHandleStrings_(void *a1, const char *a2, ...)
{
  return [a1 predicateForContactsMatchingHandleStrings];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_preferencesValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 preferencesValueForKey:];
}

id objc_msgSend_preferencesValueForKey_domain_(void *a1, const char *a2, ...)
{
  return [a1 preferencesValueForKey:domain:];
}

id objc_msgSend_preferredCaption1BoldFont(void *a1, const char *a2, ...)
{
  return _[a1 preferredCaption1BoldFont];
}

id objc_msgSend_preferredCaption1Font(void *a1, const char *a2, ...)
{
  return _[a1 preferredCaption1Font];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredSubheadline1Font(void *a1, const char *a2, ...)
{
  return _[a1 preferredSubheadline1Font];
}

id objc_msgSend_prepareForSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 prepareForSnapshot];
}

id objc_msgSend_presentConversationForUUID_(void *a1, const char *a2, ...)
{
  return [a1 presentConversationForUUID:];
}

id objc_msgSend_presentRecentsDetailsViewFor_(void *a1, const char *a2, ...)
{
  return [a1 presentRecentsDetailsViewFor:];
}

id objc_msgSend_presentScreenTimeShield(void *a1, const char *a2, ...)
{
  return _[a1 presentScreenTimeShield];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_previewMSROptimizationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 previewMSROptimizationEnabled];
}

id objc_msgSend_previousTextSuggestion(void *a1, const char *a2, ...)
{
  return _[a1 previousTextSuggestion];
}

id objc_msgSend_prewarm(void *a1, const char *a2, ...)
{
  return _[a1 prewarm];
}

id objc_msgSend_prioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedSenderIdentities];
}

id objc_msgSend_privacyLinkView(void *a1, const char *a2, ...)
{
  return _[a1 privacyLinkView];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 providerForRecentCall:];
}

id objc_msgSend_providerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 providerWithIdentifier:];
}

id objc_msgSend_providerWithService_video_(void *a1, const char *a2, ...)
{
  return [a1 providerWithService:video:];
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return _[a1 providers];
}

id objc_msgSend_pseudonymForLinkDetailsView(void *a1, const char *a2, ...)
{
  return _[a1 pseudonymForLinkDetailsView];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushViewController:animated:];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:];
}

id objc_msgSend_rangeOfCharacterFromSet_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:options:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:];
}

id objc_msgSend_rangeToHighlightText_(void *a1, const char *a2, ...)
{
  return [a1 rangeToHighlightText:];
}

id objc_msgSend_recentCall(void *a1, const char *a2, ...)
{
  return _[a1 recentCall];
}

id objc_msgSend_recentCallTTYType(void *a1, const char *a2, ...)
{
  return _[a1 recentCallTTYType];
}

id objc_msgSend_recentCalls(void *a1, const char *a2, ...)
{
  return _[a1 recentCalls];
}

id objc_msgSend_recentCallsChangedFromCachedRecentCalls_callHistoryControllerRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallsChangedFromCachedRecentCalls:callHistoryControllerRecentCalls:");
}

id objc_msgSend_recentsAudioCallImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsAudioCallImage];
}

id objc_msgSend_recentsCallTapTargetsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 recentsCallTapTargetsEnabled];
}

id objc_msgSend_recentsOutgoingAudioCallGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsOutgoingAudioCallGlyphImage];
}

id objc_msgSend_recentsOutgoingVideoCallGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsOutgoingVideoCallGlyphImage];
}

id objc_msgSend_recentsTTYDirectGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsTTYDirectGlyphImage];
}

id objc_msgSend_recentsTTYRelayGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsTTYRelayGlyphImage];
}

id objc_msgSend_recentsUniqueID(void *a1, const char *a2, ...)
{
  return _[a1 recentsUniqueID];
}

id objc_msgSend_recentsVideoCallImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsVideoCallImage];
}

id objc_msgSend_reconfigureRowsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return [a1 reconfigureRowsAtIndexPaths:];
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 rectForRowAtIndexPath:];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_reformatText(void *a1, const char *a2, ...)
{
  return _[a1 reformatText];
}

id objc_msgSend_registerAccount(void *a1, const char *a2, ...)
{
  return _[a1 registerAccount];
}

id objc_msgSend_registerAccountWithUsername_password_service_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 registerAccountWithUsername:password:service:completionBlock:];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellReuseIdentifier:];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return [a1 registerDefaults:];
}

id objc_msgSend_registerForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForRingerStateNotifications];
}

id objc_msgSend_registerForTraitChanges_withAction_(void *a1, const char *a2, ...)
{
  return [a1 registerForTraitChanges:withAction:];
}

id objc_msgSend_registrationDelegate(void *a1, const char *a2, ...)
{
  return _[a1 registrationDelegate];
}

id objc_msgSend_registrationStatus(void *a1, const char *a2, ...)
{
  return _[a1 registrationStatus];
}

id objc_msgSend_registrationTimeout(void *a1, const char *a2, ...)
{
  return _[a1 registrationTimeout];
}

id objc_msgSend_registrationViewSignInPhoneAccount_(void *a1, const char *a2, ...)
{
  return [a1 registrationViewSignInPhoneAccount:];
}

id objc_msgSend_reloadCallOccurences(void *a1, const char *a2, ...)
{
  return _[a1 reloadCallOccurences];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 reloadRowsAtIndexPaths:withRowAnimation:];
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandles];
}

id objc_msgSend_remoteViewControllerLCDOffset(void *a1, const char *a2, ...)
{
  return _[a1 remoteViewControllerLCDOffset];
}

id objc_msgSend_removeAllIndexes(void *a1, const char *a2, ...)
{
  return _[a1 removeAllIndexes];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeColumnAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeColumnAtIndex:];
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return [a1 removeConstraints:];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeListenerID_forService_(void *a1, const char *a2, ...)
{
  return [a1 removeListenerID:forService:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_replaceArrangedSubview_inColumnAtIndex_rowAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 replaceArrangedSubview:inColumnAtIndex:rowAtIndex:];
}

id objc_msgSend_replaceRange_withText_(void *a1, const char *a2, ...)
{
  return [a1 replaceRange:withText:];
}

id objc_msgSend_reportAndBlockSection(void *a1, const char *a2, ...)
{
  return _[a1 reportAndBlockSection];
}

id objc_msgSend_reportWithRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 reportWithRecentCall:];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestPinFromPrimaryDevice(void *a1, const char *a2, ...)
{
  return _[a1 requestPinFromPrimaryDevice];
}

id objc_msgSend_requiresSmallScreenConfig(void *a1, const char *a2, ...)
{
  return _[a1 requiresSmallScreenConfig];
}

id objc_msgSend_resetViewController(void *a1, const char *a2, ...)
{
  return _[a1 resetViewController];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifier];
}

id objc_msgSend_ringCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 ringCornerRadius];
}

id objc_msgSend_ringImageForDodge(void *a1, const char *a2, ...)
{
  return _[a1 ringImageForDodge];
}

id objc_msgSend_ringImageForLuminance(void *a1, const char *a2, ...)
{
  return _[a1 ringImageForLuminance];
}

id objc_msgSend_ringSize(void *a1, const char *a2, ...)
{
  return _[a1 ringSize];
}

id objc_msgSend_ringStroke(void *a1, const char *a2, ...)
{
  return _[a1 ringStroke];
}

id objc_msgSend_ringerStateNotifyToken(void *a1, const char *a2, ...)
{
  return _[a1 ringerStateNotifyToken];
}

id objc_msgSend_rootView(void *a1, const char *a2, ...)
{
  return _[a1 rootView];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_rootViewLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 rootViewLayoutMargins];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowHeightCache(void *a1, const char *a2, ...)
{
  return _[a1 rowHeightCache];
}

id objc_msgSend_rttConversationForUUID_(void *a1, const char *a2, ...)
{
  return [a1 rttConversationForUUID:];
}

id objc_msgSend_rttConversations(void *a1, const char *a2, ...)
{
  return _[a1 rttConversations];
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithParameters:];
}

id objc_msgSend_sanitizedString(void *a1, const char *a2, ...)
{
  return _[a1 sanitizedString];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 scaledValueForValue:];
}

id objc_msgSend_scene_continueUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 scene:continueUserActivity:];
}

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return [a1 scene:openURLContexts:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_screenSharingLabel(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingLabel];
}

id objc_msgSend_screenSharingType(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingType];
}

id objc_msgSend_screenSharingTypeText(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingTypeText];
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return _[a1 screenSize];
}

id objc_msgSend_scrollTestsWithCount_forScrollView_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollTestsWithCount:forScrollView:name:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_selectedSenderIdentity(void *a1, const char *a2, ...)
{
  return _[a1 selectedSenderIdentity];
}

id objc_msgSend_selectedTextRange(void *a1, const char *a2, ...)
{
  return _[a1 selectedTextRange];
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectedViewController];
}

id objc_msgSend_selectionRange(void *a1, const char *a2, ...)
{
  return _[a1 selectionRange];
}

id objc_msgSend_sendMessageIntentExtension(void *a1, const char *a2, ...)
{
  return _[a1 sendMessageIntentExtension];
}

id objc_msgSend_senderIdentityCapabilitiesWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityCapabilitiesWithUUID:];
}

id objc_msgSend_senderIdentityForAccountUUID_(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityForAccountUUID:];
}

id objc_msgSend_senderIdentityMenuForDialerField_selectedSenderIdentity_(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityMenuForDialerField:selectedSenderIdentity:];
}

id objc_msgSend_senderIdentityMenuForDialerView_selectedSenderIdentity_(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityMenuForDialerView:selectedSenderIdentity:];
}

id objc_msgSend_separatorInsetForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 separatorInsetForContentSizeCategory:];
}

id objc_msgSend_sequenceWithItems_loops_(void *a1, const char *a2, ...)
{
  return [a1 sequenceWithItems:loops:];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialQueue];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return _[a1 serviceProvider];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryType:];
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryView:];
}

id objc_msgSend_setActionButton_(void *a1, const char *a2, ...)
{
  return [a1 setActionButton:];
}

id objc_msgSend_setActionButtonImage_(void *a1, const char *a2, ...)
{
  return [a1 setActionButtonImage:];
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return [a1 setActions:];
}

id objc_msgSend_setActivationFailed_(void *a1, const char *a2, ...)
{
  return [a1 setActivationFailed:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setAddContactButton_(void *a1, const char *a2, ...)
{
  return [a1 setAddContactButton:];
}

id objc_msgSend_setAddContactButtonTopConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setAddContactButtonTopConstraint:];
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontForContentSizeCategory:];
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontSizeToFitWidth:];
}

id objc_msgSend_setAdjustsImageSizeForAccessibilityContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsImageSizeForAccessibilityContentSizeCategory:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAlignment_forView_inAxis_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:forView:inAxis:];
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedPressTypes:];
}

id objc_msgSend_setAllowsActions_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsActions:];
}

id objc_msgSend_setAllowsEditing_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsEditing:];
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsGroupBlending:];
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsGroupOpacity:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAlternateName_(void *a1, const char *a2, ...)
{
  return [a1 setAlternateName:];
}

id objc_msgSend_setAnalyticsLogger_(void *a1, const char *a2, ...)
{
  return [a1 setAnalyticsLogger:];
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationsEnabled:];
}

id objc_msgSend_setArrowDirection_(void *a1, const char *a2, ...)
{
  return [a1 setArrowDirection:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAttributedTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedTitle:forState:];
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:range:];
}

id objc_msgSend_setAuthKitSignInView_(void *a1, const char *a2, ...)
{
  return [a1 setAuthKitSignInView:];
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizesSubviews:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setAvatarViewController_(void *a1, const char *a2, ...)
{
  return [a1 setAvatarViewController:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundConfiguration:];
}

id objc_msgSend_setBackgroundEffects_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundEffects:];
}

id objc_msgSend_setBackgroundImage_forBarPosition_barMetrics_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundImage:forBarPosition:barMetrics:];
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundView:];
}

id objc_msgSend_setBadgeText_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeText:];
}

id objc_msgSend_setBadgeValue_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeValue:];
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBarStyle:];
}

id objc_msgSend_setBaselineRelativeArrangement_(void *a1, const char *a2, ...)
{
  return [a1 setBaselineRelativeArrangement:];
}

id objc_msgSend_setBottommostLabel_(void *a1, const char *a2, ...)
{
  return [a1 setBottommostLabel:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setCachedCellHeight_(void *a1, const char *a2, ...)
{
  return [a1 setCachedCellHeight:];
}

id objc_msgSend_setCachedIsUsingIPadExternalCamera_(void *a1, const char *a2, ...)
{
  return [a1 setCachedIsUsingIPadExternalCamera];
}

id objc_msgSend_setCallProviderManager_(void *a1, const char *a2, ...)
{
  return [a1 setCallProviderManager:];
}

id objc_msgSend_setCallerID_(void *a1, const char *a2, ...)
{
  return [a1 setCallerID:];
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return [a1 setCenter:];
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return [a1 setColor:];
}

id objc_msgSend_setColumnSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setColumnSpacing:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return [a1 setCompositingFilter:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setContactFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setContactFormatter:];
}

id objc_msgSend_setContactHeaderViewController_(void *a1, const char *a2, ...)
{
  return [a1 setContactHeaderViewController:];
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setContactIdentifier:];
}

id objc_msgSend_setContactLabel_(void *a1, const char *a2, ...)
{
  return [a1 setContactLabel:];
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return [a1 setContactStore:];
}

id objc_msgSend_setContactType_(void *a1, const char *a2, ...)
{
  return [a1 setContactType:];
}

id objc_msgSend_setContacts_(void *a1, const char *a2, ...)
{
  return [a1 setContacts:];
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentCompressionResistancePriority:forAxis:];
}

id objc_msgSend_setContentEdgeInsets_(void *a1, const char *a2, ...)
{
  return [a1 setContentEdgeInsets:];
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentHuggingPriority:forAxis:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:];
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:animated:];
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setContentSize:];
}

id objc_msgSend_setContentUnavailable_(void *a1, const char *a2, ...)
{
  return [a1 setContentUnavailable:];
}

id objc_msgSend_setContentUnavailableView_(void *a1, const char *a2, ...)
{
  return [a1 setContentUnavailableView:];
}

id objc_msgSend_setContentUnavailableViewTitle_(void *a1, const char *a2, ...)
{
  return [a1 setContentUnavailableViewTitle:];
}

id objc_msgSend_setContentViewHiddenPosition(void *a1, const char *a2, ...)
{
  return _[a1 setContentViewHiddenPosition];
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return [a1 setContents:];
}

id objc_msgSend_setContentsGravity_(void *a1, const char *a2, ...)
{
  return [a1 setContentsGravity:];
}

id objc_msgSend_setContentsIsSingleValue_(void *a1, const char *a2, ...)
{
  return [a1 setContentsIsSingleValue:];
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return [a1 setContext:];
}

id objc_msgSend_setConversation_(void *a1, const char *a2, ...)
{
  return [a1 setConversation:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCurrentCycleStringIndex_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentCycleStringIndex:];
}

id objc_msgSend_setCurrentInputDevice_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentInputDevice:];
}

id objc_msgSend_setCurrentVideoOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentVideoOrientation:];
}

id objc_msgSend_setCustomBaselineOffsetFromBottom_(void *a1, const char *a2, ...)
{
  return [a1 setCustomBaselineOffsetFromBottom:];
}

id objc_msgSend_setCustomFirstBaselineOffsetFromTop_(void *a1, const char *a2, ...)
{
  return [a1 setCustomFirstBaselineOffsetFromTop:];
}

id objc_msgSend_setCycleTimer_(void *a1, const char *a2, ...)
{
  return [a1 setCycleTimer:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDateLabels_(void *a1, const char *a2, ...)
{
  return [a1 setDateLabels:];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDateStyle:];
}

id objc_msgSend_setDefinesPresentationContext_(void *a1, const char *a2, ...)
{
  return [a1 setDefinesPresentationContext:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeleteButtonAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setDeleteButtonAlpha:];
}

id objc_msgSend_setDetailsView_(void *a1, const char *a2, ...)
{
  return [a1 setDetailsView:];
}

id objc_msgSend_setDialType_(void *a1, const char *a2, ...)
{
  return [a1 setDialType:];
}

id objc_msgSend_setDialerType_(void *a1, const char *a2, ...)
{
  return [a1 setDialerType:];
}

id objc_msgSend_setDidDeferStartCameraAction_(void *a1, const char *a2, ...)
{
  return [a1 setDidDeferStartCameraAction:];
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setDirectionalLayoutMargins:];
}

id objc_msgSend_setDisabledOverlayView_(void *a1, const char *a2, ...)
{
  return [a1 setDisabledOverlayView:];
}

id objc_msgSend_setDisplayedLabel_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayedLabel:];
}

id objc_msgSend_setDisplayedName_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayedName:];
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return [a1 setDoesRelativeDateFormatting:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return [a1 setEdgesForExtendedLayout:];
}

id objc_msgSend_setEmailAddresses_(void *a1, const char *a2, ...)
{
  return [a1 setEmailAddresses:];
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return [a1 setFamilyName:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return [a1 setFontSize:];
}

id objc_msgSend_setForegroundView_(void *a1, const char *a2, ...)
{
  return [a1 setForegroundView:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return [a1 setGivenName:];
}

id objc_msgSend_setGroupName_(void *a1, const char *a2, ...)
{
  return [a1 setGroupName:];
}

id objc_msgSend_setHIDEventSystemClient_(void *a1, const char *a2, ...)
{
  return [a1 setHIDEventSystemClient:];
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return [a1 setHandle:];
}

id objc_msgSend_setHeaderLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 setHeaderLayoutGuide:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setInitializationBlockQueued_(void *a1, const char *a2, ...)
{
  return [a1 setInitializationBlockQueued:];
}

id objc_msgSend_setIntrinsicContentHeight_(void *a1, const char *a2, ...)
{
  return [a1 setIntrinsicContentHeight:];
}

id objc_msgSend_setInvitationPreferences_(void *a1, const char *a2, ...)
{
  return [a1 setInvitationPreferences:];
}

id objc_msgSend_setIsUIInitialized_(void *a1, const char *a2, ...)
{
  return [a1 setIsUIInitialized:];
}

id objc_msgSend_setKeyIndex_(void *a1, const char *a2, ...)
{
  return [a1 setKeyIndex:];
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setLargeTitleDisplayMode:];
}

id objc_msgSend_setLayoutMarginsRelativeArrangement_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMarginsRelativeArrangement:];
}

id objc_msgSend_setLcdViewTextFieldDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setLcdViewTextFieldDelegate:];
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setLocalFrontLayer_(void *a1, const char *a2, ...)
{
  return [a1 setLocalFrontLayer:];
}

id objc_msgSend_setLocalSenderIdentityAccountUUID_(void *a1, const char *a2, ...)
{
  return [a1 setLocalSenderIdentityAccountUUID:];
}

id objc_msgSend_setLocalSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return [a1 setLocalSenderIdentityUUID:];
}

id objc_msgSend_setLocalizedCount_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedCount];
}

id objc_msgSend_setLocalizedSenderIdentityTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedSenderIdentityTitle:];
}

id objc_msgSend_setLocalizedSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedSubtitle:];
}

id objc_msgSend_setLocalizedTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedTitle:];
}

id objc_msgSend_setLocalizedValidHandlesTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedValidHandlesTitle:];
}

id objc_msgSend_setMainNumberLabel_(void *a1, const char *a2, ...)
{
  return [a1 setMainNumberLabel:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setMaximumLayoutSize_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumLayoutSize:];
}

id objc_msgSend_setMenuVisible_animated_(void *a1, const char *a2, ...)
{
  return [a1 setMenuVisible:animated:];
}

id objc_msgSend_setMetadataCache_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataCache:];
}

id objc_msgSend_setMinimumFontSize_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumFontSize:];
}

id objc_msgSend_setMinimumLayoutSize_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLayoutSize:];
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumPressDuration:];
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumScaleFactor:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNameAndLabelLabel_(void *a1, const char *a2, ...)
{
  return [a1 setNameAndLabelLabel:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setNonEditingLinebreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setNonEditingLinebreakMode:];
}

id objc_msgSend_setNotificationCenter_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationCenter:];
}

id objc_msgSend_setNumber_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setNumber:forKey:];
}

id objc_msgSend_setNumberFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setNumberFormatter:];
}

id objc_msgSend_setNumberLabelHorizontalConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setNumberLabelHorizontalConstraints:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberOfTapsRequired_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfTapsRequired:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObjectViewControllerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setObjectViewControllerDelegate:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOrganizationName_(void *a1, const char *a2, ...)
{
  return [a1 setOrganizationName:];
}

id objc_msgSend_setOrientationEventsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setOrientationEventsEnabled:];
}

id objc_msgSend_setOriginatingUIType_(void *a1, const char *a2, ...)
{
  return [a1 setOriginatingUIType:];
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideUserInterfaceStyle:];
}

id objc_msgSend_setPhoneNumbers_(void *a1, const char *a2, ...)
{
  return [a1 setPhoneNumbers:];
}

id objc_msgSend_setPreFetchingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPreFetchingPredicate:];
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPredicate:];
}

id objc_msgSend_setPreferencesValue_forKey_domain_(void *a1, const char *a2, ...)
{
  return [a1 setPreferencesValue:forKey:domain:];
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersLargeTitles:];
}

id objc_msgSend_setPrefetchDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setPrefetchDataSource:];
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return [a1 setPresentingViewController:];
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setPreservesSuperviewLayoutMargins:];
}

id objc_msgSend_setPreviousTextSuggestion_(void *a1, const char *a2, ...)
{
  return [a1 setPreviousTextSuggestion:];
}

id objc_msgSend_setPrivacyLinkView_(void *a1, const char *a2, ...)
{
  return [a1 setPrivacyLinkView:];
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return [a1 setProvider:];
}

id objc_msgSend_setReceivesMemoryWarnings_(void *a1, const char *a2, ...)
{
  return [a1 setReceivesMemoryWarnings:];
}

id objc_msgSend_setRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 setRecentCall:];
}

id objc_msgSend_setRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 setRecentCalls:];
}

id objc_msgSend_setRegistrationDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setRegistrationDelegate:];
}

id objc_msgSend_setRegistrationTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setRegistrationTimeout:];
}

id objc_msgSend_setReloadingData_(void *a1, const char *a2, ...)
{
  return [a1 setReloadingData:];
}

id objc_msgSend_setRenderMode_(void *a1, const char *a2, ...)
{
  return [a1 setRenderMode:];
}

id objc_msgSend_setReportAndBlockSection_(void *a1, const char *a2, ...)
{
  return [a1 setReportAndBlockSection:];
}

id objc_msgSend_setRepresentedApplicationBundle_(void *a1, const char *a2, ...)
{
  return [a1 setRepresentedApplicationBundle:];
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:];
}

id objc_msgSend_setRingerSwitchEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setRingerSwitchEnabled:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setRowSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setRowSpacing:];
}

id objc_msgSend_setRttConversations_(void *a1, const char *a2, ...)
{
  return [a1 setRttConversations:];
}

id objc_msgSend_setSelectedSenderIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedSenderIdentity:];
}

id objc_msgSend_setSelectedTextRange_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedTextRange:];
}

id objc_msgSend_setSelectionRange_(void *a1, const char *a2, ...)
{
  return [a1 setSelectionRange:];
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorInset:];
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorStyle:];
}

id objc_msgSend_setShortcutItem_(void *a1, const char *a2, ...)
{
  return [a1 setShortcutItem:];
}

id objc_msgSend_setShouldFlick_(void *a1, const char *a2, ...)
{
  return [a1 setShouldFlick:];
}

id objc_msgSend_setShouldShowLinkedContacts_(void *a1, const char *a2, ...)
{
  return [a1 setShouldShowLinkedContacts:];
}

id objc_msgSend_setShowsAuthKitUI_(void *a1, const char *a2, ...)
{
  return [a1 setShowsAuthKitUI:];
}

id objc_msgSend_setSigningIn_(void *a1, const char *a2, ...)
{
  return [a1 setSigningIn:];
}

id objc_msgSend_setSocialProfiles_(void *a1, const char *a2, ...)
{
  return [a1 setSocialProfiles:];
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSpacing:];
}

id objc_msgSend_setSpringBoardLocked_(void *a1, const char *a2, ...)
{
  return [a1 setSpringBoardLocked:];
}

id objc_msgSend_setStandardAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setStandardAppearance:];
}

id objc_msgSend_setStartedLoadingOlderCalls_(void *a1, const char *a2, ...)
{
  return [a1 setStartedLoadingOlderCalls:];
}

id objc_msgSend_setStatusBarOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setStatusBarOrientation:];
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return [a1 setString:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSuggestedContactStore_(void *a1, const char *a2, ...)
{
  return [a1 setSuggestedContactStore:];
}

id objc_msgSend_setSummaries_(void *a1, const char *a2, ...)
{
  return [a1 setSummaries:];
}

id objc_msgSend_setTabBarItem_(void *a1, const char *a2, ...)
{
  return [a1 setTabBarItem:];
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return [a1 setTableFooterView:];
}

id objc_msgSend_setTableViewModel_(void *a1, const char *a2, ...)
{
  return [a1 setTableViewModel:];
}

id objc_msgSend_setTargetRect_inView_(void *a1, const char *a2, ...)
{
  return [a1 setTargetRect:inView:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setText_needsFormat_(void *a1, const char *a2, ...)
{
  return [a1 setText:needsFormat:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setThreeDTouchEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setThreeDTouchEnabled:];
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setTimeStyle:];
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return [a1 setTimingFunction:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitleColor:forState:];
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return [a1 setTitleView:];
}

id objc_msgSend_setTopmostLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTopmostLabel:];
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return [a1 setTransform];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return [a1 setTranslucent:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUnreadCallCount_(void *a1, const char *a2, ...)
{
  return [a1 setUnreadCallCount:];
}

id objc_msgSend_setUpBlurredBackground(void *a1, const char *a2, ...)
{
  return _[a1 setUpBlurredBackground];
}

id objc_msgSend_setUpReportAndBlockSection(void *a1, const char *a2, ...)
{
  return _[a1 setUpReportAndBlockSection];
}

id objc_msgSend_setUpTableView(void *a1, const char *a2, ...)
{
  return _[a1 setUpTableView];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return [a1 setUsername:];
}

id objc_msgSend_setUsesBrandedCallHeaderFormat_(void *a1, const char *a2, ...)
{
  return [a1 setUsesBrandedCallHeaderFormat:];
}

id objc_msgSend_setUsesDarkMode_(void *a1, const char *a2, ...)
{
  return [a1 setUsesDarkMode:];
}

id objc_msgSend_setUsesEvenOddFillRule_(void *a1, const char *a2, ...)
{
  return [a1 setUsesEvenOddFillRule:];
}

id objc_msgSend_setUsesNotificationCenter_(void *a1, const char *a2, ...)
{
  return [a1 setUsesNotificationCenter:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVerified_(void *a1, const char *a2, ...)
{
  return [a1 setVerified:];
}

id objc_msgSend_setVerticalAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setVerticalAlignment:];
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return [a1 setVideo:];
}

id objc_msgSend_setVideoEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setVideoEnabled:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setVisualEffect_(void *a1, const char *a2, ...)
{
  return [a1 setVisualEffect:];
}

id objc_msgSend_setWaitingForLocalVideoFirstFrame_(void *a1, const char *a2, ...)
{
  return [a1 setWaitingForLocalVideoFirstFrame:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setWithCapacity:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return [a1 settingsForPrivateStyle:];
}

id objc_msgSend_setupContentViewFullSize(void *a1, const char *a2, ...)
{
  return _[a1 setupContentViewFullSize];
}

id objc_msgSend_setupContentViewSidebar(void *a1, const char *a2, ...)
{
  return _[a1 setupContentViewSidebar];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedMenuController(void *a1, const char *a2, ...)
{
  return _[a1 sharedMenuController];
}

id objc_msgSend_sharedMonitorForDisplayType_(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitorForDisplayType:];
}

id objc_msgSend_sharedNumberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 sharedNumberFormatter];
}

id objc_msgSend_sharedUtilityProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedUtilityProvider];
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 shortcutItem];
}

id objc_msgSend_shouldDeferStartCameraAction(void *a1, const char *a2, ...)
{
  return _[a1 shouldDeferStartCameraAction];
}

id objc_msgSend_shouldDisableEdgeClip(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisableEdgeClip];
}

id objc_msgSend_shouldInsertStringAtCurrentPosition_deletingPreviousCharacter_(void *a1, const char *a2, ...)
{
  return [a1 shouldInsertStringAtCurrentPosition:deletingPreviousCharacter:];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return _[a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldNavigationControllerPresentLargeTitles(void *a1, const char *a2, ...)
{
  return _[a1 shouldNavigationControllerPresentLargeTitles];
}

id objc_msgSend_shouldRestrictDialRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return [a1 shouldRestrictDialRequest:performSynchronously:];
}

id objc_msgSend_shouldRestrictJoinConversationRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return [a1 shouldRestrictJoinConversationRequest:performSynchronously:];
}

id objc_msgSend_shouldShowAutomaticTelephonyCallFallback(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowAutomaticTelephonyCallFallback];
}

id objc_msgSend_shouldShowBlockAll(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowBlockAll];
}

id objc_msgSend_shouldShowBlockUnknown(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowBlockUnknown];
}

id objc_msgSend_shouldShowRegistration(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowRegistration];
}

id objc_msgSend_shouldShowReportInitiator(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowReportInitiator];
}

id objc_msgSend_shouldSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 shouldSnapshot];
}

id objc_msgSend_shouldUseExplicitLayoutDimensions(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseExplicitLayoutDimensions];
}

id objc_msgSend_showBlockAllAlert(void *a1, const char *a2, ...)
{
  return _[a1 showBlockAllAlert];
}

id objc_msgSend_showBlockUnknownAlert(void *a1, const char *a2, ...)
{
  return _[a1 showBlockUnknownAlert];
}

id objc_msgSend_showContent(void *a1, const char *a2, ...)
{
  return _[a1 showContent];
}

id objc_msgSend_showContentViewAnimated_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 showContentViewAnimated:completionBlock:];
}

id objc_msgSend_showDetailsViewController(void *a1, const char *a2, ...)
{
  return _[a1 showDetailsViewController];
}

id objc_msgSend_showFaceTimeFirstRunViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 showFaceTimeFirstRunViewIfNeeded];
}

id objc_msgSend_showLinkDetailViewControllerForPseudonym_(void *a1, const char *a2, ...)
{
  return [a1 showLinkDetailViewControllerForPseudonym:];
}

id objc_msgSend_showName_label_animated_(void *a1, const char *a2, ...)
{
  return [a1 showName:label:animated:];
}

id objc_msgSend_showReportAlert(void *a1, const char *a2, ...)
{
  return _[a1 showReportAlert];
}

id objc_msgSend_showThumperAvailableDialogIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 showThumperAvailableDialogIfNecessary];
}

id objc_msgSend_showVideoPlayerForMessageWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showVideoPlayerForMessageWithUUID:");
}

id objc_msgSend_showsAuthKitUI(void *a1, const char *a2, ...)
{
  return _[a1 showsAuthKitUI];
}

id objc_msgSend_showsCallsFromService_(void *a1, const char *a2, ...)
{
  return [a1 showsCallsFromService:];
}

id objc_msgSend_showsFaceTimeAudio(void *a1, const char *a2, ...)
{
  return _[a1 showsFaceTimeAudio];
}

id objc_msgSend_showsFaceTimeAudioRecents(void *a1, const char *a2, ...)
{
  return _[a1 showsFaceTimeAudioRecents];
}

id objc_msgSend_showsFaceTimeVideo(void *a1, const char *a2, ...)
{
  return _[a1 showsFaceTimeVideo];
}

id objc_msgSend_showsFaceTimeVideoRecents(void *a1, const char *a2, ...)
{
  return _[a1 showsFaceTimeVideoRecents];
}

id objc_msgSend_showsLocalPreviewStatusBarGradient(void *a1, const char *a2, ...)
{
  return _[a1 showsLocalPreviewStatusBarGradient];
}

id objc_msgSend_showsTelephonyCalls(void *a1, const char *a2, ...)
{
  return _[a1 showsTelephonyCalls];
}

id objc_msgSend_showsTelephonyRecents(void *a1, const char *a2, ...)
{
  return _[a1 showsTelephonyRecents];
}

id objc_msgSend_showsThirdPartyRecents(void *a1, const char *a2, ...)
{
  return _[a1 showsThirdPartyRecents];
}

id objc_msgSend_signingInLabel(void *a1, const char *a2, ...)
{
  return _[a1 signingInLabel];
}

id objc_msgSend_signingInSpinner(void *a1, const char *a2, ...)
{
  return _[a1 signingInSpinner];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_socialProfiles(void *a1, const char *a2, ...)
{
  return _[a1 socialProfiles];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingDescriptors:];
}

id objc_msgSend_spacingBetweenNumberBaselineAndNameBaseline(void *a1, const char *a2, ...)
{
  return _[a1 spacingBetweenNumberBaselineAndNameBaseline];
}

id objc_msgSend_specialDialerCharacters(void *a1, const char *a2, ...)
{
  return _[a1 specialDialerCharacters];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_starAndOctothorpeCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 starAndOctothorpeCharacterSet];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startPreview(void *a1, const char *a2, ...)
{
  return _[a1 startPreview];
}

id objc_msgSend_startPreviewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 startPreviewIfNeeded];
}

id objc_msgSend_startedLoadingOlderCalls(void *a1, const char *a2, ...)
{
  return _[a1 startedLoadingOlderCalls];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateForNotifyToken_(void *a1, const char *a2, ...)
{
  return [a1 stateForNotifyToken:];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusBarFrame(void *a1, const char *a2, ...)
{
  return _[a1 statusBarFrame];
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return _[a1 statusBarOrientation];
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return _[a1 statusLabel];
}

id objc_msgSend_statusText(void *a1, const char *a2, ...)
{
  return _[a1 statusText];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopPreview(void *a1, const char *a2, ...)
{
  return _[a1 stopPreview];
}

id objc_msgSend_storeWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 storeWithOptions:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByRemovingCharactersFromSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingCharactersFromSet:];
}

id objc_msgSend_stringByRemovingDiatrics(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingDiatrics];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringByTrimmingLastCharacter(void *a1, const char *a2, ...)
{
  return _[a1 stringByTrimmingLastCharacter];
}

id objc_msgSend_stringForDataUsage_(void *a1, const char *a2, ...)
{
  return [a1 stringForDataUsage:];
}

id objc_msgSend_stringForTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 stringForTimeInterval:];
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return [a1 stringFromByteCount:countStyle:];
}

id objc_msgSend_stringFromContact_(void *a1, const char *a2, ...)
{
  return [a1 stringFromContact:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromIOHIDUsage_(void *a1, const char *a2, ...)
{
  return [a1 stringFromIOHIDUsage:];
}

id objc_msgSend_stringFromIOHIDUsagePage_(void *a1, const char *a2, ...)
{
  return [a1 stringFromIOHIDUsagePage:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return _[a1 subscriptions];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_subtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return [a1 subtitleForRecentEmergencyCall];
}

id objc_msgSend_subtitleImageView(void *a1, const char *a2, ...)
{
  return _[a1 subtitleImageView];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabel];
}

id objc_msgSend_subtitleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabelFirstBaselineLayoutConstraintConstant];
}

id objc_msgSend_subtitleLabelLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabelLastBaselineLayoutConstraintConstant];
}

id objc_msgSend_subtitleLabelLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabelLeadingLayoutConstraintConstant];
}

id objc_msgSend_subtitleLabelTextColor(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabelTextColor];
}

id objc_msgSend_subtitleProvider(void *a1, const char *a2, ...)
{
  return _[a1 subtitleProvider];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_suggestedContactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 suggestedContactForHandle:isoCountryCode:metadataCache:];
}

id objc_msgSend_suggestedContactStore(void *a1, const char *a2, ...)
{
  return _[a1 suggestedContactStore];
}

id objc_msgSend_suggestionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 suggestionsEnabled];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supplementalVerbiageLabel(void *a1, const char *a2, ...)
{
  return _[a1 supplementalVerbiageLabel];
}

id objc_msgSend_supportedHandleTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedHandleTypes];
}

id objc_msgSend_supportsAutoRotation(void *a1, const char *a2, ...)
{
  return _[a1 supportsAutoRotation];
}

id objc_msgSend_supportsHandleType_(void *a1, const char *a2, ...)
{
  return [a1 supportsHandleType:];
}

id objc_msgSend_supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsPrimaryCalling];
}

id objc_msgSend_supportsSendMessageIntent(void *a1, const char *a2, ...)
{
  return _[a1 supportsSendMessageIntent];
}

id objc_msgSend_supportsThumperCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsThumperCalling];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return [a1 systemLayoutSizeFittingSize:];
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_systemPreferredCamera(void *a1, const char *a2, ...)
{
  return _[a1 systemPreferredCamera];
}

id objc_msgSend_tabBarCanSlide(void *a1, const char *a2, ...)
{
  return _[a1 tabBarCanSlide];
}

id objc_msgSend_tabBarFillsScreen(void *a1, const char *a2, ...)
{
  return _[a1 tabBarFillsScreen];
}

id objc_msgSend_tabBarIconImage(void *a1, const char *a2, ...)
{
  return _[a1 tabBarIconImage];
}

id objc_msgSend_tabBarIconName(void *a1, const char *a2, ...)
{
  return _[a1 tabBarIconName];
}

id objc_msgSend_tabBarItem(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItem];
}

id objc_msgSend_tabBarItemImage(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItemImage];
}

id objc_msgSend_tabBarItemSelectedImage(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItemSelectedImage];
}

id objc_msgSend_tabBarItemTitle(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItemTitle];
}

id objc_msgSend_tabBarSystemItem(void *a1, const char *a2, ...)
{
  return _[a1 tabBarSystemItem];
}

id objc_msgSend_tabBarSystemItemTag(void *a1, const char *a2, ...)
{
  return _[a1 tabBarSystemItemTag];
}

id objc_msgSend_tabBarSystemItemTitle(void *a1, const char *a2, ...)
{
  return _[a1 tabBarSystemItemTitle];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableViewCanPerformReloadData_(void *a1, const char *a2, ...)
{
  return [a1 tableViewCanPerformReloadData:];
}

id objc_msgSend_tableViewModel(void *a1, const char *a2, ...)
{
  return _[a1 tableViewModel];
}

id objc_msgSend_tapTargets(void *a1, const char *a2, ...)
{
  return _[a1 tapTargets];
}

id objc_msgSend_telephonyCallingIsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 telephonyCallingIsAvailable];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return _[a1 telephonyClient];
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 telephonyProvider];
}

id objc_msgSend_telephonyUIBodyShortEmphasizedFont(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUIBodyShortEmphasizedFont];
}

id objc_msgSend_telephonyUIBodyShortFont(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUIBodyShortFont];
}

id objc_msgSend_telephonyUISubheadlineShortFont(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUISubheadlineShortFont];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textField_didUpdateString_(void *a1, const char *a2, ...)
{
  return [a1 textField:didUpdateString:];
}

id objc_msgSend_textInRange_(void *a1, const char *a2, ...)
{
  return [a1 textInRange:];
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return _[a1 textInputTraits];
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return [a1 textRangeFromPosition:toPosition:];
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return _[a1 timeFormatter];
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return _[a1 timeLabel];
}

id objc_msgSend_timeText(void *a1, const char *a2, ...)
{
  return _[a1 timeText];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelFirstBaselineLayoutConstraintConstant];
}

id objc_msgSend_titleLabelLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelLastBaselineLayoutConstraintConstant];
}

id objc_msgSend_titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return [a1 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:];
}

id objc_msgSend_titleLabelLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelLeadingLayoutConstraintConstant];
}

id objc_msgSend_titleLabelTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelTrailingLayoutConstraintConstant];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_topmostLabel(void *a1, const char *a2, ...)
{
  return _[a1 topmostLabel];
}

id objc_msgSend_tpImageForSymbolType_textStyle_scale_isStaticSize_(void *a1, const char *a2, ...)
{
  return [a1 tpImageForSymbolType:textStyle:scale:isStaticSize:];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_ttyType(void *a1, const char *a2, ...)
{
  return _[a1 ttyType];
}

id objc_msgSend_tuHandle(void *a1, const char *a2, ...)
{
  return _[a1 tuHandle];
}

id objc_msgSend_tu_dynamicIdentifier(void *a1, const char *a2, ...)
{
  return [a1 tu_dynamicIdentifier];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unblockWithContacts_(void *a1, const char *a2, ...)
{
  return [a1 unblockWithContacts:];
}

id objc_msgSend_unformattedNumber(void *a1, const char *a2, ...)
{
  return _[a1 unformattedNumber];
}

id objc_msgSend_unformattedNumberInLatin(void *a1, const char *a2, ...)
{
  return _[a1 unformattedNumberInLatin];
}

id objc_msgSend_unicodeDirectionalCharactersSet(void *a1, const char *a2, ...)
{
  return _[a1 unicodeDirectionalCharactersSet];
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return [a1 unifiedContactWithIdentifier:keysToFetch:error:];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _[a1 uniqueId];
}

id objc_msgSend_unknownContacts(void *a1, const char *a2, ...)
{
  return _[a1 unknownContacts];
}

id objc_msgSend_unknownInitiatorReportEnabled(void *a1, const char *a2, ...)
{
  return _[a1 unknownInitiatorReportEnabled];
}

id objc_msgSend_unknownLabel(void *a1, const char *a2, ...)
{
  return _[a1 unknownLabel];
}

id objc_msgSend_unreadCallCount(void *a1, const char *a2, ...)
{
  return _[a1 unreadCallCount];
}

id objc_msgSend_unregisterForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForRingerStateNotifications];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAddAndDeleteButtonForText_name_animated_(void *a1, const char *a2, ...)
{
  return [a1 updateAddAndDeleteButtonForText:name:animated:];
}

id objc_msgSend_updateAddAndDeleteButtonForText_name_label_suggestion_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAddAndDeleteButtonForText:name:label:suggestion:animated:");
}

id objc_msgSend_updateCacheWithDestinationIDs_(void *a1, const char *a2, ...)
{
  return [a1 updateCacheWithDestinationIDs:];
}

id objc_msgSend_updateCacheWithDestinationIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateCacheWithDestinationIDs:completion:];
}

id objc_msgSend_updateCellOfFlow_isBlocked_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellOfFlow:isBlocked:style:");
}

id objc_msgSend_updateFontsAndLayoutMetrics(void *a1, const char *a2, ...)
{
  return _[a1 updateFontsAndLayoutMetrics];
}

id objc_msgSend_updateFontsLayoutMetricsAndSeparatorInset(void *a1, const char *a2, ...)
{
  return _[a1 updateFontsLayoutMetricsAndSeparatorInset];
}

id objc_msgSend_updateRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 updateRecentCalls];
}

id objc_msgSend_updateRootView(void *a1, const char *a2, ...)
{
  return _[a1 updateRootView];
}

id objc_msgSend_updateTitleDisplayModeIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 updateTitleDisplayModeIfNeeded:];
}

id objc_msgSend_updateViewControllerForOrientation_(void *a1, const char *a2, ...)
{
  return [a1 updateViewControllerForOrientation:];
}

id objc_msgSend_urlAddresses(void *a1, const char *a2, ...)
{
  return _[a1 urlAddresses];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _[a1 userActivities];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(void *a1, const char *a2, ...)
{
  return [a1 userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_usesUnifiedInterface(void *a1, const char *a2, ...)
{
  return _[a1 usesUnifiedInterface];
}

id objc_msgSend_utterances(void *a1, const char *a2, ...)
{
  return _[a1 utterances];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_validRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 validRemoteParticipantHandles];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_verbiageLabel(void *a1, const char *a2, ...)
{
  return _[a1 verbiageLabel];
}

id objc_msgSend_verificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 verificationStatus];
}

id objc_msgSend_verified(void *a1, const char *a2, ...)
{
  return _[a1 verified];
}

id objc_msgSend_videoDeviceController(void *a1, const char *a2, ...)
{
  return _[a1 videoDeviceController];
}

id objc_msgSend_videoMessageUUID(void *a1, const char *a2, ...)
{
  return _[a1 videoMessageUUID];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerForContact_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForContact:];
}

id objc_msgSend_viewControllerForConversation_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForConversation:];
}

id objc_msgSend_viewControllerForUnknownContact_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForUnknownContact:];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_viewDidAppear_(void *a1, const char *a2, ...)
{
  return [a1 viewDidAppear:];
}

id objc_msgSend_viewDidDisappear_(void *a1, const char *a2, ...)
{
  return [a1 viewDidDisappear:];
}

id objc_msgSend_viewWillAppear_(void *a1, const char *a2, ...)
{
  return [a1 viewWillAppear:];
}

id objc_msgSend_viewWillDisappear_(void *a1, const char *a2, ...)
{
  return [a1 viewWillDisappear:];
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return _[a1 visibleViewController];
}

id objc_msgSend_voicemailMessageUUID(void *a1, const char *a2, ...)
{
  return _[a1 voicemailMessageUUID];
}

id objc_msgSend_waitingForActivationLabel(void *a1, const char *a2, ...)
{
  return _[a1 waitingForActivationLabel];
}

id objc_msgSend_waitingForLocalVideoFirstFrame(void *a1, const char *a2, ...)
{
  return _[a1 waitingForLocalVideoFirstFrame];
}

id objc_msgSend_warmInCallServiceIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 warmInCallServiceIfNecessary];
}

id objc_msgSend_wasEmergencyCall(void *a1, const char *a2, ...)
{
  return _[a1 wasEmergencyCall];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_withCaseSensitiveAttribute(void *a1, const char *a2, ...)
{
  return _[a1 withCaseSensitiveAttribute];
}

id objc_msgSend_wombatWisdomEnabled(void *a1, const char *a2, ...)
{
  return _[a1 wombatWisdomEnabled];
}

id objc_msgSend_yOffsetForDialerLCDView(void *a1, const char *a2, ...)
{
  return _[a1 yOffsetForDialerLCDView];
}

id objc_msgSend_yOffsetForDialerLCDViewForDxDevices(void *a1, const char *a2, ...)
{
  return _[a1 yOffsetForDialerLCDViewForDxDevices];
}

id objc_msgSend_yParticipantsViewAdjustmentForKeypad(void *a1, const char *a2, ...)
{
  return _[a1 yParticipantsViewAdjustmentForKeypad];
}