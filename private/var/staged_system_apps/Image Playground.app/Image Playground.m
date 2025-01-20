id sub_100003868()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

void sub_1000038C4(uint64_t *a1@<X8>)
{
  uint64_t v14 = type metadata accessor for CreationViewStyle();
  uint64_t v2 = *(void *)(v14 - 8);
  __chkstk_darwin();
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ExecutionContext.GPClientIdentity();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ObservableDebugSettings();
  uint64_t v15 = static ObservableDebugSettings.shared.getter();
  State.init(wrappedValue:)();
  uint64_t v9 = v17;
  a1[1] = v16;
  a1[2] = v9;
  type metadata accessor for GenerativePlaygroundApp();
  type metadata accessor for AppDelegate();
  UIApplicationDelegateAdaptor.init(_:)();
  id v10 = [objc_allocWithZone((Class)type metadata accessor for AppleConnectAuthenticator()) init];
  v13[1] = [objc_allocWithZone((Class)GPAppleConnectTokenProvider) initWithAuthenticatingProtocol:v10];
  type metadata accessor for SessionUndoManager();
  swift_allocObject();
  v13[0] = SessionUndoManager.init(undoManager:)();
  type metadata accessor for ServicesFetcher();
  swift_allocObject();
  uint64_t v11 = ServicesFetcher.init()();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for ExecutionContext.GPClientIdentity.currentProcess(_:), v5);
  static ExecutionContext.setClientIdentity(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  static ObservableDebugSettings.shared.getter();
  swift_getKeyPath();
  uint64_t v16 = v11;
  swift_retain();
  ObservableDebugSettings.subscript.setter();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for CreationViewStyle.generativePlaygroundApp(_:), v14);
  type metadata accessor for PlaygroundHomeViewModel();
  swift_allocObject();
  uint64_t v12 = PlaygroundHomeViewModel.init(servicesFetcher:appleConnectTokenProvider:creationViewStyle:pickerMode:forceDarkMode:sessionUndoManager:)();

  *a1 = v12;
}

uint64_t sub_100003BB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v20[1] = a1;
  uint64_t v3 = *(void *)(type metadata accessor for GenerativePlaygroundApp() - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = sub_100004188(&qword_100010F40);
  v20[0] = *(void *)(v5 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004188(&qword_100010F48);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v20 - v13;
  sub_1000047F4(v2, (uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v16 = swift_allocObject();
  sub_100004960((uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  sub_100004188(&qword_100010F50);
  unint64_t v17 = sub_100004A34();
  v21 = &type metadata for AppWindowContentView;
  unint64_t v22 = v17;
  swift_getOpaqueTypeConformance2();
  WindowGroup.init(id:title:lazyContent:)();
  unint64_t v18 = sub_100004A88();
  Scene.extendedLaunchTestName(_:)();
  (*(void (**)(char *, uint64_t))(v20[0] + 8))(v7, v5);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v12, v8);
  v21 = (ValueMetadata *)v5;
  unint64_t v22 = v18;
  swift_getOpaqueTypeConformance2();
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

uint64_t sub_100003EF8()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for GenerativePlaygroundApp()
{
  uint64_t result = qword_100010EF8;
  if (!qword_100010EF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100004044()
{
  unint64_t result = qword_100010E90;
  if (!qword_100010E90)
  {
    type metadata accessor for GenerativePlaygroundApp();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010E90);
  }
  return result;
}

uint64_t *sub_10000409C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v10 = sub_100004188(&qword_100010E98);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_100004188(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000041CC(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100004188(&qword_100010E98);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_100004258(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v8 = sub_100004188(&qword_100010E98);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

void *sub_1000042FC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100004188(&qword_100010E98);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1000043C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_100004188(&qword_100010E98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_10000444C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100004188(&qword_100010E98);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_1000044FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004510);
}

uint64_t sub_100004510(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100004188(&qword_100010E98);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000045C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000045D8);
}

void *sub_1000045D8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100004188(&qword_100010E98);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100004684()
{
  sub_100004728();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100004728()
{
  if (!qword_100010F08)
  {
    type metadata accessor for AppDelegate();
    unint64_t v0 = type metadata accessor for UIApplicationDelegateAdaptor();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010F08);
    }
  }
}

uint64_t sub_100004780()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000479C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DebugSettings.servicesFetcher.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000047C8()
{
  return DebugSettings.servicesFetcher.setter();
}

uint64_t sub_1000047F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerativePlaygroundApp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004858()
{
  uint64_t v1 = (int *)(type metadata accessor for GenerativePlaygroundApp() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_100004188(&qword_100010E98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100004960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerativePlaygroundApp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000049C4()
{
  type metadata accessor for GenerativePlaygroundApp();

  return sub_100003EF8();
}

unint64_t sub_100004A34()
{
  unint64_t result = qword_100010F58;
  if (!qword_100010F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010F58);
  }
  return result;
}

unint64_t sub_100004A88()
{
  unint64_t result = qword_100010F60;
  if (!qword_100010F60)
  {
    sub_100004AE4(&qword_100010F40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010F60);
  }
  return result;
}

uint64_t sub_100004AE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004B2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.undoManager.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100004B58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004BB4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100004BE4()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[7] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[8] = v4;
  v1[9] = v3;
  return _swift_task_switch(sub_100004CE8, v4, v3);
}

uint64_t sub_100004CE8()
{
  static GPLog.authentication.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Fetching auth token", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[2];

  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v4, v5);
  uint64_t v9 = *(void *)(v7 + OBJC_IVAR____TtC16Image_Playground25AppleConnectAuthenticator_token + 8);
  if (v9)
  {
    uint64_t v10 = *(void *)(v7 + OBJC_IVAR____TtC16Image_Playground25AppleConnectAuthenticator_token);
    swift_bridgeObjectRetain();
    swift_release();
    static GPLog.authentication.getter();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Reusing cached authentication token", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v14 = v0[5];
    uint64_t v15 = v0[3];

    v8(v14, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v16(v10, v9);
  }
  else
  {
    unint64_t v18 = (void *)swift_task_alloc();
    v0[10] = v18;
    *unint64_t v18 = v0;
    v18[1] = sub_100004F48;
    return sub_10000517C();
  }
}

uint64_t sub_100004F48(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 88) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_100005104;
  }
  else
  {
    v6[12] = a2;
    v6[13] = a1;
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_10000507C;
  }
  return _swift_task_switch(v9, v7, v8);
}

uint64_t sub_10000507C()
{
  swift_release();
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_100005104()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000517C()
{
  v1[22] = v0;
  type metadata accessor for MainActor();
  v1[23] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[24] = v2;
  v1[25] = v3;
  return _swift_task_switch(sub_100005248, v2, v3);
}

uint64_t sub_100005248()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[26] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[27] = *(void *)(v2 + 64);
  uint64_t v3 = swift_task_alloc();
  static GPLog.authentication.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting Apple Connect authentication", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[28] = v7;
  v0[29] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v3, v1);
  swift_task_dealloc();
  if (ACAuthenticationRequest)
  {
    uint64_t v8 = v0[22];
    id v9 = [objc_allocWithZone((Class)ACAuthenticationRequest) init];
    v0[30] = v9;
    [v9 setAuthType:3];
    uint64_t v10 = *(void **)(v8 + OBJC_IVAR____TtC16Image_Playground25AppleConnectAuthenticator_context);
    v0[2] = v0;
    v0[7] = v0 + 19;
    v0[3] = sub_100005564;
    uint64_t v11 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100005AA0;
    v0[13] = &unk_10000CA10;
    v0[14] = v11;
    [v10 authenticateWithRequest:v9 completion:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    swift_release();
    sub_100006BD0();
    swift_allocError();
    *os_log_type_t v12 = xmmword_10000A5C0;
    swift_willThrow();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_100005564()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  uint64_t v2 = *(void *)(*(void *)v0 + 192);
  return _swift_task_switch(sub_100005698, v2, v1);
}

uint64_t sub_100005698()
{
  swift_release();
  uint64_t v1 = (void *)v0[19];
  id v2 = [v1 serviceTicket];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)v0[30];
    uint64_t v5 = v0[22];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    id v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC16Image_Playground25AppleConnectAuthenticator_token);
    *id v9 = v6;
    v9[1] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v10(v6, v8);
  }
  else
  {
    uint64_t v12 = swift_task_alloc();
    static GPLog.authentication.getter();
    uint64_t v13 = v1;
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      unint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      if ([v13 error])
      {
        uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
        v0[21] = v18;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        v0[20] = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v18 = 0;
      }
      *unint64_t v17 = v18;

      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to authenticate: %@", v16, 0xCu);
      sub_100004188(&qword_100011048);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v14 = v13;
    }
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[28];
    uint64_t v20 = v0[26];

    v19(v12, v20);
    swift_task_dealloc();
    id v21 = [v13 error];
    if (v21)
    {
      swift_getErrorValue();
      uint64_t v22 = v0[15];
      uint64_t v23 = v0[16];
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v25 = swift_task_alloc();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v25, v22, v23);

      id v21 = (id)Error.localizedDescription.getter();
      uint64_t v27 = v26;
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v23);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v27 = 0;
    }
    v28 = (void *)v0[30];
    sub_100006BD0();
    swift_allocError();
    void *v29 = v21;
    v29[1] = v27;
    swift_willThrow();

    v30 = (uint64_t (*)(void))v0[1];
    return v30();
  }
}

uint64_t sub_100005AA0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return _swift_continuation_resume(v2);
}

uint64_t sub_100005AF4(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return static String.localizedStringWithFormat(_:_:)();
  }
  sub_100004188(&qword_100011050);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A5D0;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100006ED8();
  uint64_t v6 = 0x6E776F6E6B6E75;
  if (a2) {
    uint64_t v6 = a1;
  }
  unint64_t v7 = 0xE700000000000000;
  if (a2) {
    unint64_t v7 = a2;
  }
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  sub_100006F20(a1, a2);
  uint64_t v2 = static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100005BFC()
{
  return sub_100005AF4(*v0, v0[1]);
}

uint64_t sub_100005C04()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100005C1C()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100005C34()
{
  return LocalizedError.helpAnchor.getter();
}

id sub_100005C5C()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC16Image_Playground25AppleConnectAuthenticator_token];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = OBJC_IVAR____TtC16Image_Playground25AppleConnectAuthenticator_context;
  id v4 = objc_allocWithZone((Class)ACMobileAuthenticationContext);
  uint64_t v5 = v0;
  id v6 = [v4 init];
  id v7 = objc_allocWithZone((Class)NSNumber);
  id v8 = v6;
  id v9 = [v7 initWithInteger:191000];
  [v8 setAppID:v9];

  [v8 setEnvironment:0];
  *(void *)&v0[v3] = v8;

  v11.receiver = v5;
  v11.super_class = ObjectType;
  return [super init];
}

uint64_t type metadata accessor for AppleConnectAuthenticator()
{
  return self;
}

uint64_t sub_100005DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  v6[4] = type metadata accessor for MainActor();
  v6[5] = static MainActor.shared.getter();
  id v7 = (void *)swift_task_alloc();
  v6[6] = v7;
  *id v7 = v6;
  v7[1] = sub_100005EAC;
  return sub_100004BE4();
}

uint64_t sub_100005EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 56) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v9 = v8;
    uint64_t v10 = sub_1000060C4;
  }
  else
  {
    *(void *)(v6 + 64) = a2;
    *(void *)(v6 + 72) = a1;
    uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v9 = v11;
    uint64_t v10 = sub_100006038;
  }
  return _swift_task_switch(v10, v7, v9);
}

uint64_t sub_100006038()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, void))v0[2];
  swift_release();
  v3(v2, v1, 0);
  swift_bridgeObjectRelease();
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000060C4()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void (*)(void, void, uint64_t))v0[2];
  swift_release();
  swift_errorRetain();
  v2(0, 0, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100006160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000068AC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void *initializeBufferWithCopyOfBuffer for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppleConnectAuthenticator.DAWToken()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppleConnectAuthenticator.DAWToken(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleConnectAuthenticator.DAWToken(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleConnectAuthenticator.DAWToken(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleConnectAuthenticator.DAWToken()
{
  return &type metadata for AppleConnectAuthenticator.DAWToken;
}

void sub_1000065D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    NSString v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, NSString))(a4 + 16))(a4, v6);
}

uint64_t sub_100006668()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000066A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000065D8(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1000066A8()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000066F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1000067B8;
  return sub_100005DFC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000067B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000068AC(uint64_t a1)
{
  uint64_t v2 = sub_100004188(&qword_100011008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000690C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000069E8;
  return v6(a1);
}

uint64_t sub_1000069E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006AE0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006B18(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000067B8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100011020 + dword_100011020);
  return v6(a1, v4);
}

unint64_t sub_100006BD0()
{
  unint64_t result = qword_100011040;
  if (!qword_100011040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011040);
  }
  return result;
}

unint64_t destroy for AppleConnectAuthenticator.AuthenticationError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *_s16Image_Playground25AppleConnectAuthenticatorC19AuthenticationErrorOwCP_0(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for AppleConnectAuthenticator.AuthenticationError(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  int v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for AppleConnectAuthenticator.AuthenticationError(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleConnectAuthenticator.AuthenticationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppleConnectAuthenticator.AuthenticationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_100006E70(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_100006E98(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleConnectAuthenticator.AuthenticationError()
{
  return &type metadata for AppleConnectAuthenticator.AuthenticationError;
}

unint64_t sub_100006ED8()
{
  unint64_t result = qword_100011058;
  if (!qword_100011058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011058);
  }
  return result;
}

uint64_t sub_100006F20(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

id sub_100006F3C(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void destroy for AppWindowContentView(uint64_t a1)
{
  swift_release();
  int v2 = *(void **)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);

  sub_100006F88(v2, v3);
}

void sub_100006F88(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t _s16Image_Playground20AppWindowContentViewVwCP_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 16);
  swift_retain();
  sub_100006F3C(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for AppWindowContentView(uint64_t a1, void *a2)
{
  int v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  char v4 = (void *)v2[1];
  LOBYTE(v2) = *((unsigned char *)v2 + 16);
  sub_100006F3C(v4, (char)v2);
  int v5 = *(void **)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = (_BYTE)v2;
  sub_100006F88(v5, v6);
  return a1;
}

__n128 initializeWithTake for AppWindowContentView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppWindowContentView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  char v4 = *(unsigned char *)(a2 + 16);
  int v5 = *(void **)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = v4;
  sub_100006F88(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppWindowContentView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppWindowContentView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppWindowContentView()
{
  return &type metadata for AppWindowContentView;
}

uint64_t sub_100007154()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007170@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v67 = a3;
  v66 = a2;
  uint64_t v69 = a4;
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v61 = v5;
  __chkstk_darwin(v5);
  v58 = &v47[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100004188(&qword_100011060);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v47[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for PlaygroundHomeView();
  uint64_t v53 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = &v47[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v55 = sub_100004188(&qword_100011068);
  uint64_t v54 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v14 = &v47[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_100004188(&qword_100011070) - 8;
  __chkstk_darwin(v50);
  v49 = &v47[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v52 = sub_100004188(&qword_100011078) - 8;
  __chkstk_darwin(v52);
  v51 = &v47[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = sub_100004188(&qword_100011080);
  __chkstk_darwin(v57);
  v56 = &v47[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v65 = sub_100004188(&qword_100011088);
  uint64_t v68 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  v59 = &v47[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_100004188(&qword_100011090);
  uint64_t v63 = *(void *)(v19 - 8);
  uint64_t v64 = v19;
  __chkstk_darwin(v19);
  v62 = &v47[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v70 = a1;
  swift_retain();
  PlaygroundHomeView.init(viewModel:)();
  uint64_t v21 = enum case for ColorScheme.dark(_:);
  unsigned int v48 = enum case for ColorScheme.dark(_:);
  uint64_t v22 = type metadata accessor for ColorScheme();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v23 + 104);
  v24(v9, v21, v22);
  uint64_t v25 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v23 + 56);
  v25(v9, 0, 1, v22);
  sub_100008774(&qword_100011098, (void (*)(uint64_t))&type metadata accessor for PlaygroundHomeView);
  View.dialogColorScheme(_:)();
  sub_1000087BC((uint64_t)v9, &qword_100011060);
  (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v12, v10);
  v24(v9, v48, v22);
  v25(v9, 0, 1, v22);
  uint64_t v26 = (uint64_t)v49;
  sub_100007C90((uint64_t)v9, (uint64_t)&v49[*(int *)(v50 + 44)], &qword_100011060);
  uint64_t v27 = v54;
  uint64_t v28 = v55;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v54 + 16))(v26, v14, v55);
  sub_1000087BC((uint64_t)v9, &qword_100011060);
  (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v14, v28);
  v29 = v58;
  static TaskPriority.userInitiated.getter();
  uint64_t v30 = (uint64_t)v51;
  uint64_t v31 = &v51[*(int *)(v52 + 44)];
  uint64_t v32 = type metadata accessor for _TaskModifier();
  uint64_t v34 = v60;
  uint64_t v33 = v61;
  (*(void (**)(char *, unsigned char *, uint64_t))(v60 + 16))(&v31[*(int *)(v32 + 20)], v29, v61);
  *(void *)uint64_t v31 = &unk_1000110A0;
  *((void *)v31 + 1) = 0;
  sub_100007C90(v26, v30, &qword_100011070);
  (*(void (**)(unsigned char *, uint64_t))(v34 + 8))(v29, v33);
  sub_1000087BC(v26, &qword_100011070);
  uint64_t v35 = swift_allocObject();
  v36 = v66;
  *(void *)(v35 + 16) = v70;
  *(void *)(v35 + 24) = v36;
  LOBYTE(v31) = v67 & 1;
  *(unsigned char *)(v35 + 32) = v67 & 1;
  v37 = v56;
  sub_100007C90(v30, (uint64_t)v56, &qword_100011078);
  uint64_t v38 = v57;
  v39 = (void (**)())&v37[*(int *)(v57 + 36)];
  *v39 = sub_100007C84;
  v39[1] = (void (*)())v35;
  v39[2] = 0;
  v39[3] = 0;
  swift_retain();
  sub_100006F3C(v36, (char)v31);
  sub_1000087BC(v30, &qword_100011078);
  sub_100008370((uint64_t)&off_10000C8C0);
  swift_arrayDestroy();
  sub_100004188(&qword_1000110A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000A5D0;
  *(void *)(inited + 32) = 42;
  *(void *)(inited + 40) = 0xE100000000000000;
  sub_100008370(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  unint64_t v41 = sub_100008514();
  v42 = v59;
  View.handlesExternalEvents(preferring:allowing:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000087BC((uint64_t)v37, &qword_100011080);
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v70;
  *(void *)(v43 + 24) = v36;
  *(unsigned char *)(v43 + 32) = (_BYTE)v31;
  swift_retain();
  sub_100006F3C(v36, (char)v31);
  uint64_t v71 = v38;
  unint64_t v72 = v41;
  swift_getOpaqueTypeConformance2();
  v44 = v62;
  uint64_t v45 = v65;
  View.onOpenURL(perform:)();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v68 + 8))(v42, v45);
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v63 + 32))(v69, v44, v64);
}

uint64_t sub_100007A40()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 56) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100007AD4, v2, v1);
}

uint64_t sub_100007AD4()
{
  swift_release();
  *(void *)(v0 + 40) = &type metadata for GPFeatures;
  unint64_t v1 = sub_1000088E4();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  sub_100008938(v0 + 16);
  if ((v2 & 1) == 0) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  char v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_100007BD4(uint64_t a1, void *a2, char a3)
{
  char v4 = a3 & 1;
  sub_100006F3C(a2, a3 & 1);
  uint64_t v5 = (objc_class *)sub_100007CF4(a2, v4);
  sub_100006F88(a2, v4);
  v7.value.super.isa = v5;
  PlaygroundHomeViewModel.setUndoManager(_:)(v7);
}

uint64_t sub_100007C58()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100007C74@<X0>(uint64_t a1@<X8>)
{
  return sub_100007170(*(void *)v1, *(void **)(v1 + 8), *(unsigned __int8 *)(v1 + 16), a1);
}

void sub_100007C84()
{
  sub_100007BD4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_100007C90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004188(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007CF4(void *a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  NSUndoManager_optional v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v14 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = static os_log_type_t.fault.getter();
    uint64_t v9 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      v16[1] = v11 + 4;
      sub_100004188(&qword_1000110E8);
      uint64_t v12 = _typeName(_:qualified:)();
      v16[2] = sub_100007F14(v12, v13, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_100006F88(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v17;
  }
  return (uint64_t)a1;
}

unint64_t sub_100007F14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_100007FE8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008884((uint64_t)v12, *a3);
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
      sub_100008884((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008938((uint64_t)v12);
  return v7;
}

unint64_t sub_100007FE8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_1000080E8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = _StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_1000080E8(uint64_t a1, unint64_t a2)
{
  char v2 = (char *)sub_100008180(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v2 = sub_100008284(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    char v2 = sub_100008284((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_100008180(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_10000821C(v2, 0);
      unint64_t result = (void *)_StringGuts.copyUTF8(into:)();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000821C(uint64_t a1, uint64_t a2)
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
  sub_100004188(&qword_1000110F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100008284(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100004188(&qword_1000110F0);
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
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

Swift::Int sub_100008370(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100004188(&qword_1000110E0);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_100008514()
{
  unint64_t result = qword_1000110B0;
  if (!qword_1000110B0)
  {
    sub_100004AE4(&qword_100011080);
    sub_100008590();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000110B0);
  }
  return result;
}

unint64_t sub_100008590()
{
  unint64_t result = qword_1000110B8;
  if (!qword_1000110B8)
  {
    sub_100004AE4(&qword_100011078);
    sub_10000863C();
    sub_100008774(&qword_1000110D8, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000110B8);
  }
  return result;
}

unint64_t sub_10000863C()
{
  unint64_t result = qword_1000110C0;
  if (!qword_1000110C0)
  {
    sub_100004AE4(&qword_100011070);
    type metadata accessor for PlaygroundHomeView();
    sub_100008774(&qword_100011098, (void (*)(uint64_t))&type metadata accessor for PlaygroundHomeView);
    swift_getOpaqueTypeConformance2();
    sub_100008718();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000110C0);
  }
  return result;
}

unint64_t sub_100008718()
{
  unint64_t result = qword_1000110C8;
  if (!qword_1000110C8)
  {
    sub_100004AE4(&qword_1000110D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000110C8);
  }
  return result;
}

uint64_t sub_100008774(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000087BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004188(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000881C()
{
  swift_release();
  sub_100006F88(*(id *)(v0 + 24), *(unsigned char *)(v0 + 32));

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_100008860()
{
  return PlaygroundHomeViewModel.openFile(at:)();
}

uint64_t sub_100008884(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000088E4()
{
  unint64_t result = qword_1000110F8;
  if (!qword_1000110F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000110F8);
  }
  return result;
}

uint64_t sub_100008938(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008988()
{
  return swift_getOpaqueTypeConformance2();
}

unsigned char *initializeBufferWithCopyOfBuffer for GPFeatures(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GPFeatures(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GPFeatures(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100008B84);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100008BAC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008BB4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GPFeatures()
{
  return &type metadata for GPFeatures;
}

unint64_t sub_100008BD4()
{
  unint64_t result = qword_100011100;
  if (!qword_100011100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011100);
  }
  return result;
}

BOOL sub_100008C28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100008C40()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100008C88()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100008CB4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

const char *sub_100008CF8()
{
  return "GenerativePlayground";
}

const char *sub_100008D0C()
{
  if (*v0) {
    return "Messages";
  }
  else {
    return "App";
  }
}

uint64_t sub_100008D3C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

Swift::Void __swiftcall PlaygroundHomeViewModel.setUndoManager(_:)(NSUndoManager_optional a1)
{
}

uint64_t PlaygroundHomeViewModel.init(servicesFetcher:appleConnectTokenProvider:creationViewStyle:pickerMode:forceDarkMode:sessionUndoManager:)()
{
  return PlaygroundHomeViewModel.init(servicesFetcher:appleConnectTokenProvider:creationViewStyle:pickerMode:forceDarkMode:sessionUndoManager:)();
}

uint64_t PlaygroundHomeViewModel.openFile(at:)()
{
  return PlaygroundHomeViewModel.openFile(at:)();
}

uint64_t type metadata accessor for PlaygroundHomeViewModel()
{
  return type metadata accessor for PlaygroundHomeViewModel();
}

uint64_t PlaygroundHomeView.init(viewModel:)()
{
  return PlaygroundHomeView.init(viewModel:)();
}

uint64_t type metadata accessor for PlaygroundHomeView()
{
  return type metadata accessor for PlaygroundHomeView();
}

uint64_t DebugSettings.servicesFetcher.getter()
{
  return DebugSettings.servicesFetcher.getter();
}

uint64_t DebugSettings.servicesFetcher.setter()
{
  return DebugSettings.servicesFetcher.setter();
}

uint64_t ServicesFetcher.init()()
{
  return ServicesFetcher.init()();
}

uint64_t type metadata accessor for ServicesFetcher()
{
  return type metadata accessor for ServicesFetcher();
}

uint64_t type metadata accessor for ExecutionContext.GPClientIdentity()
{
  return type metadata accessor for ExecutionContext.GPClientIdentity();
}

uint64_t static ExecutionContext.setClientIdentity(_:)()
{
  return static ExecutionContext.setClientIdentity(_:)();
}

uint64_t type metadata accessor for CreationViewStyle()
{
  return type metadata accessor for CreationViewStyle();
}

uint64_t SessionUndoManager.init(undoManager:)()
{
  return SessionUndoManager.init(undoManager:)();
}

uint64_t type metadata accessor for SessionUndoManager()
{
  return type metadata accessor for SessionUndoManager();
}

uint64_t ObservableDebugSettings.subscript.setter()
{
  return ObservableDebugSettings.subscript.setter();
}

uint64_t static ObservableDebugSettings.shared.getter()
{
  return static ObservableDebugSettings.shared.getter();
}

uint64_t type metadata accessor for ObservableDebugSettings()
{
  return type metadata accessor for ObservableDebugSettings();
}

uint64_t static GPLog.authentication.getter()
{
  return static GPLog.authentication.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t EnvironmentValues.undoManager.getter()
{
  return EnvironmentValues.undoManager.getter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t type metadata accessor for UIApplicationDelegateAdaptor()
{
  return type metadata accessor for UIApplicationDelegateAdaptor();
}

uint64_t UIApplicationDelegateAdaptor.init(_:)()
{
  return UIApplicationDelegateAdaptor.init(_:)();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t View.debugSettings(_:)()
{
  return View.debugSettings(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.dialogColorScheme(_:)()
{
  return View.dialogColorScheme(_:)();
}

uint64_t View.handlesExternalEvents(preferring:allowing:)()
{
  return View.handlesExternalEvents(preferring:allowing:)();
}

uint64_t View.onOpenURL(perform:)()
{
  return View.onOpenURL(perform:)();
}

uint64_t Scene.extendedLaunchTestName(_:)()
{
  return Scene.extendedLaunchTestName(_:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}