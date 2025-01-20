uint64_t start()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _TtC9stickersd14StickersDaemon *v5;
  void *v6;
  void handler[4];
  NSObject *v9;
  uint8_t buf[16];

  v1 = os_log_create("com.apple.stickersd", "lifetime");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "stickersd launching", buf, 2u);
  }
  signal(15, (void (__cdecl *)(int))1);
  v2 = dispatch_get_global_queue(21, 0);
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v2);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000234C;
  handler[3] = &unk_100014970;
  v9 = v1;
  v4 = v1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_activate(v3);
  v5 = objc_alloc_init(_TtC9stickersd14StickersDaemon);
  v6 = +[NSRunLoop mainRunLoop];
  [(StickersDaemon *)v5 runOn:v6];

  return 0;
}

uint64_t sub_10000234C(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM received - will exit when clean", v3, 2u);
  }
  return xpc_transaction_exit_clean();
}

uint64_t sub_1000023B0(uint64_t a1)
{
  return sub_100002458(a1, qword_100019810);
}

uint64_t sub_100002434(uint64_t a1)
{
  return sub_100002458(a1, qword_100019828);
}

uint64_t sub_100002458(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100002C5C(v3, a2);
  sub_100002CC0(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

id sub_1000024D0()
{
  uint64_t v1 = OBJC_IVAR____TtCCV9stickersd33StickersLaunchStateManagerService8Delegate6Worker____lazy_storage___launchStateManager;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtCCV9stickersd33StickersLaunchStateManagerService8Delegate6Worker____lazy_storage___launchStateManager);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtCCV9stickersd33StickersLaunchStateManagerService8Delegate6Worker____lazy_storage___launchStateManager);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for LaunchStateManager()) init];
    v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100002888()
{
  return sub_100002908(type metadata accessor for StickersLaunchStateManagerService.Delegate.Worker);
}

id sub_1000028F0()
{
  return sub_100002908(type metadata accessor for StickersLaunchStateManagerService.Delegate);
}

id sub_100002908(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t static LaunchStateManagerServiceError.__derived_enum_equals(_:_:)()
{
  return 1;
}

void LaunchStateManagerServiceError.hash(into:)()
{
}

Swift::Int LaunchStateManagerServiceError.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int sub_1000029B4()
{
  return Hasher._finalize()();
}

unint64_t LaunchStateManagerServiceError.errorDescription.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_100002A24()
{
  unint64_t result = qword_100019270;
  if (!qword_100019270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019270);
  }
  return result;
}

unint64_t sub_100002A7C()
{
  unint64_t result = qword_100019278;
  if (!qword_100019278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019278);
  }
  return result;
}

uint64_t type metadata accessor for StickersLaunchStateManagerService.Delegate()
{
  return self;
}

uint64_t type metadata accessor for StickersLaunchStateManagerService.Delegate.Worker()
{
  return self;
}

uint64_t getEnumTagSinglePayload for LaunchStateManagerServiceError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for LaunchStateManagerServiceError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100002C18);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100002C40()
{
  return 0;
}

ValueMetadata *type metadata accessor for LaunchStateManagerServiceError()
{
  return &type metadata for LaunchStateManagerServiceError;
}

uint64_t *sub_100002C5C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100002CC0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002CF8(void *a1)
{
  LODWORD(v32) = [a1 processIdentifier];
  uint64_t v2 = dispatch thunk of CustomStringConvertible.description.getter();
  unint64_t v4 = v3;
  if (qword_100019240 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100002CC0(v5, (uint64_t)qword_100019810);
  swift_bridgeObjectRetain_n();
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v32 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    id v31 = (id)sub_10000CCB0(v2, v4, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Client %s has requested a connection to the LaunchStateManager service", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v9 = [self currentEnvironment];
  id v10 = [v9 entitlementVerifier];

  [a1 auditToken];
  long long v29 = v33;
  long long v30 = v32;
  NSString v11 = String._bridgeToObjectiveC()();
  id v31 = 0;
  long long v32 = v30;
  long long v33 = v29;
  unsigned int v12 = [v10 auditToken:&v32 hasBooleanEntitlement:v11 error:&v31];
  swift_unknownObjectRelease();

  if (v31)
  {
    id v13 = v31;
    swift_bridgeObjectRelease();
    swift_willThrow();
    id v14 = v13;
    v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (void *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      id v19 = v14;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v32 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v18 = v20;

      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Error checking entitlement: %@", v17, 0xCu);
      sub_1000039CC((uint64_t *)&unk_100019340);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  BOOL v23 = os_log_type_enabled(v21, v22);
  if (!v12)
  {
    if (v23)
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v32 = swift_slowAlloc();
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      id v31 = (id)sub_10000CCB0(v2, v4, (uint64_t *)&v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Denying connection from %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v32 = swift_slowAlloc();
    *(_DWORD *)v24 = 136315138;
    swift_bridgeObjectRetain();
    id v31 = (id)sub_10000CCB0(v2, v4, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Accepting connection from %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v26 = (void *)static LaunchStateManagerAPI.xpcInterface.getter();
  [a1 setExportedInterface:v26];

  id v27 = [objc_allocWithZone((Class)type metadata accessor for StickersLaunchStateManagerService.Delegate.Worker()) init];
  [a1 setExportedObject:v27];

  [a1 resume];
  return 1;
}

uint64_t sub_100003374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v21[2] = a5;
  sub_1000039CC(&qword_100019338);
  ((void (*)(void))__chkstk_darwin)();
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for StickerSectionType();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)v21 - v14;
  swift_bridgeObjectRetain();
  StickerSectionType.init(rawValue:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100003A10((uint64_t)v8);
    sub_100002A7C();
    swift_allocError();
    os_log_type_t v16 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a6 + 16))(a6, v16);

    return swift_errorRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    id v18 = objc_allocWithZone((Class)type metadata accessor for LaunchConfiguration());
    swift_bridgeObjectRetain();
    id v19 = (void *)LaunchConfiguration.init(sectionType:identifier:)();
    id v20 = sub_1000024D0();
    dispatch thunk of LaunchStateManager.updateConfiguration(with:)();

    (*(void (**)(uint64_t, void))(a6 + 16))(a6, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
}

void sub_1000037E0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (qword_100019248 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100002CC0(v6, (uint64_t)qword_100019828);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000CCB0(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "uppercasing %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  String.uppercased()();
  NSString v10 = String._bridgeToObjectiveC()();
  (*(void (**)(uint64_t, NSString))(a3 + 16))(a3, v10);
  swift_bridgeObjectRelease();
}

uint64_t sub_1000039CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003A10(uint64_t a1)
{
  uint64_t v2 = sub_1000039CC(&qword_100019338);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeBufferWithCopyOfBuffer for StickersLaunchStateManagerService(void *a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for StickersLaunchStateManagerService(id *a1)
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for StickersLaunchStateManagerService(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

__n128 initializeWithTake for StickersLaunchStateManagerService(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

id *assignWithTake for StickersLaunchStateManagerService(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StickersLaunchStateManagerService(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StickersLaunchStateManagerService(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StickersLaunchStateManagerService()
{
  return &type metadata for StickersLaunchStateManagerService;
}

void sub_100003C24(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100003C88(uint64_t a1)
{
  return sub_100002458(a1, qword_100019840);
}

uint64_t sub_100003CB0()
{
  uint64_t v0 = type metadata accessor for StickerStore();
  uint64_t result = static StickerStore.createAPIStore()();
  qword_100019870 = v0;
  unk_100019878 = &protocol witness table for StickerStore;
  qword_100019880 = (uint64_t)&protocol witness table for StickerStore;
  qword_100019858 = result;
  return result;
}

id sub_100003DA0()
{
  return sub_1000063B0(type metadata accessor for StickersAPIService.Delegate);
}

uint64_t type metadata accessor for StickersAPIService.Delegate()
{
  return self;
}

uint64_t sub_100003DDC(uint64_t a1)
{
  return sub_100002458(a1, qword_100019888);
}

void sub_100003F2C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v41 = a4;
  uint64_t v5 = sub_1000039CC(&qword_100019438);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Request = type metadata accessor for Sticker.FetchRequest();
  uint64_t v9 = *(void *)(Request - 8);
  __chkstk_darwin(Request);
  v36 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for XPCCoder();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v38 = v11;
  uint64_t v39 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019260 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v40 = sub_100002CC0(v15, (uint64_t)qword_100019888);
  os_log_type_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    v35 = v7;
    *(_WORD *)id v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "BEGIN count(for:)", v18, 2u);
    uint64_t v7 = v35;
    swift_slowDealloc();
  }

  XPCCoder.init()();
  sub_1000065FC();
  XPCCoder.decode<A>(_:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, Request) == 1)
  {
    sub_1000066A0((uint64_t)v7);
    uint64_t v19 = type metadata accessor for XPCDataMapperError();
    sub_100006700(&qword_100019428, (void (*)(uint64_t))&type metadata accessor for XPCDataMapperError);
    uint64_t v20 = swift_allocError();
    void *v21 = 0x74736575716572;
    v21[1] = 0xE700000000000000;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, enum case for XPCDataMapperError.parameterDecoding(_:), v19);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v38);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = (void *)swift_slowAlloc();
      *(_DWORD *)v24 = 138412290;
      swift_errorRetain();
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v42 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v25 = v26;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Error handling count(for:): %@", v24, 0xCu);
      sub_1000039CC((uint64_t *)&unk_100019340);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_errorRetain();
    a3(0, v20);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    long long v30 = v36;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v36, v7, Request);
    sub_10000641C((void *)(v37 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store), *(void *)(v37 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store + 24));
    uint64_t v31 = dispatch thunk of StickerStoreProtocol.count(for:)();
    long long v32 = (void (**)(char *, uint64_t))(v9 + 8);
    long long v33 = (void (**)(char *, uint64_t))(v39 + 8);
    a3(v31, 0);
    (*v32)(v30, Request);
    (*v33)(v14, v38);
  }
  id v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v27, v28))
  {
    long long v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "END   count(for:)", v29, 2u);
    swift_slowDealloc();
  }
}

void sub_1000045E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_100004658(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, unint64_t, uint64_t), uint64_t a4)
{
  uint64_t v46 = a4;
  uint64_t v5 = type metadata accessor for StickerSequence();
  uint64_t v41 = *(void *)(v5 - 8);
  uint64_t v42 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v40 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v44 = (char *)&v39 - v8;
  uint64_t v9 = sub_1000039CC(&qword_100019438);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Request = type metadata accessor for Sticker.FetchRequest();
  uint64_t v12 = *(void *)(Request - 8);
  __chkstk_darwin(Request);
  v45 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for XPCCoder();
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v48 = v14;
  __chkstk_darwin(v14);
  os_log_type_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019260 != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v50 = sub_100002CC0(v17, (uint64_t)qword_100019888);
  id v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "BEGIN fetch(_:)", v20, 2u);
    swift_slowDealloc();
  }

  XPCCoder.init()();
  sub_1000065FC();
  XPCCoder.decode<A>(_:)();
  uint64_t v21 = Request;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, Request) == 1)
  {
    sub_1000066A0((uint64_t)v11);
    uint64_t v22 = type metadata accessor for XPCDataMapperError();
    sub_100006700(&qword_100019428, (void (*)(uint64_t))&type metadata accessor for XPCDataMapperError);
    uint64_t v23 = swift_allocError();
    void *v24 = 0x74736575716572;
    v24[1] = 0xE700000000000000;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, enum case for XPCDataMapperError.parameterDecoding(_:), v22);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v48);
    swift_errorRetain();
    swift_errorRetain();
    v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)id v27 = 138412290;
      swift_errorRetain();
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v51 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v28 = v29;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Error handling fetch(_:): %@", v27, 0xCu);
      sub_1000039CC((uint64_t *)&unk_100019340);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_errorRetain();
    a3(0, 0xF000000000000000, v23);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v45, v11, v21);
    sub_10000641C((void *)(v43 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store), *(void *)(v43 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store + 24));
    long long v33 = v44;
    dispatch thunk of StickerStoreProtocol.stickers(_:)();
    uint64_t v34 = v33;
    uint64_t v35 = v41;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v40, v34, v42);
    sub_100006700(&qword_100019450, (void (*)(uint64_t))&type metadata accessor for StickerSequence);
    uint64_t v51 = dispatch thunk of Sequence._copyToContiguousArray()();
    sub_1000039CC(&qword_100019458);
    sub_100006748();
    uint64_t v36 = XPCCoder.encode<A>(_:)();
    unint64_t v38 = v37;
    swift_release();
    sub_10000654C(v36, v38);
    a3(v36, v38, 0);
    sub_1000065A4(v36, v38);
    sub_1000065A4(v36, v38);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v42);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v45, Request);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v48);
  }
  long long v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v30, v31))
  {
    long long v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "END   fetch(_:)", v32, 2u);
    swift_slowDealloc();
  }
}

void sub_100004F60(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, unint64_t, uint64_t), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v31 = a4;
  long long v32 = a3;
  uint64_t v6 = type metadata accessor for XPCCoder();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019260 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100002CC0(v10, (uint64_t)qword_100019888);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "BEGIN addSticker(_:)", v13, 2u);
    swift_slowDealloc();
  }

  XPCCoder.init()();
  sub_1000039CC(&qword_100019410);
  sub_100006460();
  XPCCoder.decode<A>(_:)();
  v25 = v33;
  if (v33)
  {
    sub_10000641C((void *)(v5 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store), *(void *)(v5 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store + 24));
    id v30 = (id)dispatch thunk of StickerStoreProtocolInternal._internal_only_addSticker(_:)();
    id v33 = v30;
    type metadata accessor for Sticker();
    sub_100006700(&qword_100019430, (void (*)(uint64_t))&type metadata accessor for Sticker);
    uint64_t v26 = XPCCoder.encode<A>(_:)();
    unint64_t v28 = v27;
    sub_10000654C(v26, v27);
    v32(v26, v28, 0);
    sub_1000065A4(v26, v28);

    sub_1000065A4(v26, v28);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    uint64_t v14 = type metadata accessor for XPCDataMapperError();
    sub_100006700(&qword_100019428, (void (*)(uint64_t))&type metadata accessor for XPCDataMapperError);
    uint64_t v15 = swift_allocError();
    *os_log_type_t v16 = 0x72656B63697473;
    v16[1] = 0xE700000000000000;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, enum case for XPCDataMapperError.parameterDecoding(_:), v14);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v19 = 138412290;
      swift_errorRetain();
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      id v33 = (id)v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v20 = v21;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Error handling addSticker(_:): %@", v19, 0xCu);
      sub_1000039CC((uint64_t *)&unk_100019340);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_errorRetain();
    v32(0, 0xF000000000000000, v15);
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "END   addSticker(_:)", v24, 2u);
    swift_slowDealloc();
  }
}

void sub_1000055E8(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = v2;
  if (qword_100019260 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100002CC0(v5, (uint64_t)qword_100019888);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BEGIN removeStickers(identifiers:)", v8, 2u);
    swift_slowDealloc();
  }

  sub_10000641C((void *)(v3 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store), *(void *)(v3 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store + 24));
  dispatch thunk of StickerStoreProtocolInternal._internal_only_removeStickers(identifiers:)();
  a2(0);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "END   removeStickers(identifiers:)", v11, 2u);
    swift_slowDealloc();
  }
}

void sub_1000059C4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
}

void sub_100005A28(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
}

void sub_100005A58(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, const char *a5, void (*a6)(void *, uint64_t, uint64_t), const char *a7, const char *a8)
{
  unint64_t v37 = a8;
  unint64_t v38 = a7;
  uint64_t v11 = v8;
  uint64_t v39 = a4;
  uint64_t v40 = a3;
  uint64_t v12 = type metadata accessor for XPCCoder();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019260 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v41 = sub_100002CC0(v16, (uint64_t)qword_100019888);
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, a5, v19, 2u);
    swift_slowDealloc();
  }

  XPCCoder.init()();
  sub_1000039CC(&qword_100019410);
  sub_100006460();
  XPCCoder.decode<A>(_:)();
  long long v32 = v42;
  if (v42)
  {
    id v33 = (void *)(v11 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store);
    uint64_t v34 = *(void *)(v11 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store + 24);
    uint64_t v35 = v33[5];
    sub_10000641C(v33, v34);
    a6(v32, v34, v35);
    v40(0);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    uint64_t v20 = type metadata accessor for XPCDataMapperError();
    sub_100006700(&qword_100019428, (void (*)(uint64_t))&type metadata accessor for XPCDataMapperError);
    uint64_t v21 = swift_allocError();
    *uint64_t v22 = 0x72656B63697473;
    v22[1] = 0xE700000000000000;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, enum case for XPCDataMapperError.parameterDecoding(_:), v20);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)v25 = 138412290;
      swift_errorRetain();
      uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v42 = (void *)v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v26 = v27;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, v37, v25, 0xCu);
      sub_1000039CC((uint64_t *)&unk_100019340);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    unint64_t v28 = v40;

    swift_errorRetain();
    v28(v21);
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, v38, v31, 2u);
    swift_slowDealloc();
  }
}

void sub_100005F98(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a3;
  id v17 = a1;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v11;
  a7(v13, v15, a6, v16);
  swift_release();
  sub_1000065A4(v13, v15);
}

void sub_100006074()
{
  uint64_t v1 = v0;
  if (qword_100019260 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100002CC0(v2, (uint64_t)qword_100019888);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BEGIN reindexAllStickers()", v5, 2u);
    swift_slowDealloc();
  }

  sub_10000641C((void *)(v1 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store), *(void *)(v1 + OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store + 24));
  dispatch thunk of StickerStoreProtocol.reindexAllStickers()();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "END reindexAllStickers()", v8, 2u);
    swift_slowDealloc();
  }
}

id sub_100006398()
{
  return sub_1000063B0(type metadata accessor for StickersAPIService.Worker);
}

id sub_1000063B0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for StickersAPIService.Worker()
{
  return self;
}

void *sub_10000641C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100006460()
{
  unint64_t result = qword_100019418;
  if (!qword_100019418)
  {
    sub_100006504(&qword_100019410);
    sub_100006700(&qword_100019420, (void (*)(uint64_t))&type metadata accessor for Sticker);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019418);
  }
  return result;
}

uint64_t sub_100006504(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000654C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000065A4(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000065FC()
{
  unint64_t result = qword_100019440;
  if (!qword_100019440)
  {
    sub_100006504(&qword_100019438);
    sub_100006700(&qword_100019448, (void (*)(uint64_t))&type metadata accessor for Sticker.FetchRequest);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019440);
  }
  return result;
}

uint64_t sub_1000066A0(uint64_t a1)
{
  uint64_t v2 = sub_1000039CC(&qword_100019438);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006700(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100006748()
{
  unint64_t result = qword_100019460;
  if (!qword_100019460)
  {
    sub_100006504(&qword_100019458);
    sub_100006700(&qword_100019430, (void (*)(uint64_t))&type metadata accessor for Sticker);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019460);
  }
  return result;
}

uint64_t sub_1000067EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100006824(uint64_t a1)
{
  sub_100003C24(a1, *(void *)(v1 + 16));
}

void sub_10000682C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100009F9C(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_100006834(uint64_t a1, uint64_t a2)
{
  sub_1000045E8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000683C(void *a1)
{
  LODWORD(v32) = [a1 processIdentifier];
  uint64_t v2 = dispatch thunk of CustomStringConvertible.description.getter();
  unint64_t v4 = v3;
  if (qword_100019250 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100002CC0(v5, (uint64_t)qword_100019840);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    id v31 = (id)sub_10000CCB0(v2, v4, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Client %s has requested a connection to the API service", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v9 = [self currentEnvironment];
  id v10 = [v9 entitlementVerifier];

  [a1 auditToken];
  long long v29 = v33;
  long long v30 = v32;
  NSString v11 = String._bridgeToObjectiveC()();
  id v31 = 0;
  long long v32 = v30;
  long long v33 = v29;
  unsigned int v12 = [v10 auditToken:&v32 hasBooleanEntitlement:v11 error:&v31];
  swift_unknownObjectRelease();

  if (v31)
  {
    id v13 = v31;
    swift_bridgeObjectRelease();
    swift_willThrow();
    id v14 = v13;
    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)id v17 = 138412290;
      id v19 = v14;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v32 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v18 = v20;

      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Error checking entitlement: %@", v17, 0xCu);
      sub_1000039CC((uint64_t *)&unk_100019340);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  BOOL v23 = os_log_type_enabled(v21, v22);
  if (!v12)
  {
    if (v23)
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v32 = swift_slowAlloc();
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      id v31 = (id)sub_10000CCB0(v2, v4, (uint64_t *)&v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Denying connection from %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  if (v23)
  {
    os_log_type_t v24 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v32 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v24 = 136315138;
    swift_bridgeObjectRetain();
    id v31 = (id)sub_10000CCB0(v2, v4, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Accepting connection from %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v26 = (void *)static RemoteStickersAPI.xpcInterface.getter();
  [a1 setExportedInterface:v26];

  id v27 = [objc_allocWithZone((Class)type metadata accessor for StickersAPIService.Worker()) init];
  [a1 setExportedObject:v27];

  [a1 resume];
  return 1;
}

void sub_100006EB8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (qword_100019260 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100002CC0(v6, (uint64_t)qword_100019888);
  swift_bridgeObjectRetain_n();
  os_log_type_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)id v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000CCB0(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "uppercasing %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  String.uppercased()();
  NSString v10 = String._bridgeToObjectiveC()();
  (*(void (**)(uint64_t, NSString))(a3 + 16))(a3, v10);
  swift_bridgeObjectRelease();
}

uint64_t sub_1000070A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100007108(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_100007120(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for StickersAPIService()
{
  return &type metadata for StickersAPIService;
}

void sub_10000719C(void *a1)
{
  uid_t v2 = getuid();
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(oslog, v3);
  if (v2 == 501)
  {
    if (v4)
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Starting XPC services", v5, 2u);
      swift_slowDealloc();
    }

    sub_100007360();
    sub_100007B6C();
    sub_10000762C();
    sub_1000078BC();
    sub_100007E38(a1);
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Waiting for first unlock to start services", v6, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100007360()
{
  uint64_t v1 = v0;
  uid_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    BOOL v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Starting Stickers API service", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = objc_allocWithZone((Class)NSXPCListener);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 initWithMachServiceName:v6];

  id v8 = [objc_allocWithZone((Class)type metadata accessor for StickersAPIService.Delegate()) init];
  [v7 setDelegate:v8];
  if (qword_100019250 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100002CC0(v9, (uint64_t)qword_100019840);
  NSString v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    unsigned int v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Starting API service", v12, 2u);
    swift_slowDealloc();
  }

  [v7 resume];
  id v13 = (char **)(v1 + OBJC_IVAR____TtC9stickersd14StickersDaemon_services);
  swift_beginAccess();
  id v14 = *v13;
  id v15 = v7;
  id v16 = v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *id v13 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v14 = sub_10000C924(0, *((void *)v14 + 2) + 1, 1, v14);
    *id v13 = v14;
  }
  unint64_t v19 = *((void *)v14 + 2);
  unint64_t v18 = *((void *)v14 + 3);
  if (v19 >= v18 >> 1)
  {
    id v14 = sub_10000C924((char *)(v18 > 1), v19 + 1, 1, v14);
    *id v13 = v14;
  }
  uint64_t v21 = &type metadata for StickersAPIService;
  os_log_type_t v22 = &off_100014CB8;
  *(void *)&long long v20 = v15;
  *((void *)&v20 + 1) = v16;
  *((void *)v14 + 2) = v19 + 1;
  sub_1000081BC(&v20, (uint64_t)&v14[40 * v19 + 32]);
  swift_endAccess();
}

uint64_t sub_10000762C()
{
  uint64_t v1 = v0;
  uid_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    BOOL v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Starting Stickers Analytics service", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = type metadata accessor for StickersAnalyticsService();
  if (qword_100019258 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_100019870;
  uint64_t v7 = unk_100019878;
  id v8 = sub_10000641C(qword_100019858, qword_100019870);
  uint64_t v23 = v6;
  os_log_type_t v24 = (_UNKNOWN **)v7;
  uint64_t v9 = sub_1000081D4((uint64_t *)&v22);
  NSString v10 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
  uint64_t v11 = v10(v9, v8, v6);
  __chkstk_darwin(v11);
  id v13 = (uint64_t *)&v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10(v13, v9, v6);
  uint64_t v14 = sub_100009EA4((uint64_t)v13, v5, v6, v7);
  sub_100007120((uint64_t)&v22);
  sub_1000099B8();
  id v15 = (char **)(v1 + OBJC_IVAR____TtC9stickersd14StickersDaemon_services);
  swift_beginAccess();
  id v16 = *v15;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  NSObject *v15 = v16;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v16 = sub_10000C924(0, *((void *)v16 + 2) + 1, 1, v16);
    NSObject *v15 = v16;
  }
  unint64_t v19 = *((void *)v16 + 2);
  unint64_t v18 = *((void *)v16 + 3);
  if (v19 >= v18 >> 1)
  {
    id v16 = sub_10000C924((char *)(v18 > 1), v19 + 1, 1, v16);
    NSObject *v15 = v16;
  }
  uint64_t v23 = v5;
  os_log_type_t v24 = &off_100014CC0;
  *(void *)&long long v22 = v14;
  *((void *)v16 + 2) = v19 + 1;
  sub_1000081BC(&v22, (uint64_t)&v16[40 * v19 + 32]);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1000078BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for StickerIndexingClient(0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v21 - v6;
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    NSString v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Starting Stickers Indexing Client", v10, 2u);
    swift_slowDealloc();
  }

  if (qword_100019258 != -1) {
    swift_once();
  }
  long long v21 = *(_OWORD *)&qword_100019870;
  uint64_t v11 = qword_100019870;
  uint64_t v12 = sub_10000641C(qword_100019858, qword_100019870);
  long long v23 = v21;
  id v13 = sub_1000081D4((uint64_t *)&v22);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v13, v12, v11);
  sub_10000A034((uint64_t)&v22, (uint64_t)v7);
  sub_10000A158();
  sub_100008238((uint64_t)v7, (uint64_t)v5);
  uint64_t v14 = (char **)(v1 + OBJC_IVAR____TtC9stickersd14StickersDaemon_services);
  swift_beginAccess();
  id v15 = *v14;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v14 = v15;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v15 = sub_10000C924(0, *((void *)v15 + 2) + 1, 1, v15);
    *uint64_t v14 = v15;
  }
  unint64_t v18 = *((void *)v15 + 2);
  unint64_t v17 = *((void *)v15 + 3);
  if (v18 >= v17 >> 1)
  {
    id v15 = sub_10000C924((char *)(v17 > 1), v18 + 1, 1, v15);
    *uint64_t v14 = v15;
  }
  *(void *)&long long v23 = v2;
  *((void *)&v23 + 1) = &off_100014EC0;
  unint64_t v19 = sub_1000081D4((uint64_t *)&v22);
  sub_100008238((uint64_t)v5, (uint64_t)v19);
  *((void *)v15 + 2) = v18 + 1;
  sub_1000081BC(&v22, (uint64_t)&v15[40 * v18 + 32]);
  sub_10000829C((uint64_t)v5);
  swift_endAccess();
  return sub_10000829C((uint64_t)v7);
}

void sub_100007B6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Starting Stickers Extension Launch Manager Service", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = objc_allocWithZone((Class)NSXPCListener);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 initWithMachServiceName:v6];

  id v8 = [objc_allocWithZone((Class)type metadata accessor for StickersLaunchStateManagerService.Delegate()) init];
  [v7 setDelegate:v8];
  if (qword_100019240 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100002CC0(v9, (uint64_t)qword_100019810);
  NSString v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Starting LaunchStateManager service", v12, 2u);
    swift_slowDealloc();
  }

  [v7 resume];
  id v13 = (char **)(v1 + OBJC_IVAR____TtC9stickersd14StickersDaemon_services);
  swift_beginAccess();
  uint64_t v14 = *v13;
  id v15 = v7;
  id v16 = v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *id v13 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v14 = sub_10000C924(0, *((void *)v14 + 2) + 1, 1, v14);
    *id v13 = v14;
  }
  unint64_t v19 = *((void *)v14 + 2);
  unint64_t v18 = *((void *)v14 + 3);
  if (v19 >= v18 >> 1)
  {
    uint64_t v14 = sub_10000C924((char *)(v18 > 1), v19 + 1, 1, v14);
    *id v13 = v14;
  }
  long long v21 = &type metadata for StickersLaunchStateManagerService;
  long long v22 = &off_100014B40;
  *(void *)&long long v20 = v15;
  *((void *)&v20 + 1) = v16;
  *((void *)v14 + 2) = v19 + 1;
  sub_1000081BC(&v20, (uint64_t)&v14[40 * v19 + 32]);
  swift_endAccess();
}

void sub_100007E38(void *a1)
{
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "stickersd standing by", v4, 2u);
    swift_slowDealloc();
  }

  [a1 run];
  oslog = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    NSString v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "stickersd exiting", v6, 2u);
    swift_slowDealloc();
  }
}

id sub_100008014()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickersDaemon();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000080CC()
{
  return type metadata accessor for StickersDaemon();
}

uint64_t type metadata accessor for StickersDaemon()
{
  uint64_t result = qword_1000194A8;
  if (!qword_1000194A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100008120()
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

uint64_t sub_1000081BC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *sub_1000081D4(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100008238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StickerIndexingClient(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000829C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StickerIndexingClient(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000082F8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100002C5C(v0, qword_1000194B8);
  sub_100002CC0(v0, (uint64_t)qword_1000194B8);
  return Logger.init(subsystem:category:)();
}

void static StickersAnalyticsProcessor.sendOncePerDayAnalytics(store:)(void *a1)
{
  uint64_t v2 = type metadata accessor for Sticker.URIType();
  long long v3 = *(char **)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  NSString v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v80 = (char *)&v67 - v7;
  uint64_t v8 = type metadata accessor for Sticker.StickerType();
  unint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v98 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v97 = (char *)&v67 - v12;
  if (qword_100019268 != -1) {
LABEL_82:
  }
    swift_once();
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v86 = sub_100002CC0(v13, (uint64_t)qword_1000194B8);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    id v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Calculating metrics", v16, 2u);
    swift_slowDealloc();
  }

  id v17 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = [v17 initWithSuiteName:v18];

  if (v19)
  {
    id v20 = v19;
    NSString v21 = String._bridgeToObjectiveC()();
    unsigned int v84 = [v20 BOOLForKey:v21];
  }
  else
  {
    unsigned int v84 = 1;
  }
  unint64_t v22 = sub_10000930C(a1);
  unint64_t v24 = v22;
  if (v22 >> 62)
  {
    unint64_t v62 = v22;
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t v24 = v62;
    if (v25) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v25 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v25)
    {
LABEL_9:
      if (v25 < 1)
      {
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
        JUMPOUT(0x100008F9CLL);
      }
      v77 = v6;
      uint64_t v78 = v2;
      Swift::Int v76 = 0;
      Swift::Int v79 = 0;
      Swift::Int v81 = 0;
      Swift::Int v90 = 0;
      Swift::Int v91 = 0;
      Swift::Int v88 = 0;
      Swift::Int v89 = 0;
      Swift::Int v87 = 0;
      Swift::Int v83 = 0;
      uint64_t v2 = 0;
      uint64_t v92 = 0;
      unint64_t v96 = v24 & 0xC000000000000001;
      unsigned int v95 = enum case for Sticker.StickerType.recent(_:);
      v94 = (void (**)(char *, void, uint64_t))(v9 + 104);
      NSString v6 = (char *)(v9 + 8);
      v75 = (void (**)(char *, char *, uint64_t))(v3 + 32);
      v74 = (uint64_t (**)(char *, uint64_t))(v3 + 88);
      int v73 = enum case for Sticker.URIType.memoji(_:);
      int v70 = enum case for Sticker.URIType.emoji(_:);
      int v69 = enum case for Sticker.URIType.thirdParty(_:);
      v68 = (void (**)(char *, uint64_t))(v3 + 8);
      v72 = (void (**)(char *, uint64_t))(v3 + 96);
      *(void *)&long long v23 = 138412290;
      long long v82 = v23;
      unint64_t v85 = v24;
      uint64_t v93 = v25;
      while (1)
      {
        unint64_t v9 = v24;
        if (v96) {
          id v27 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v27 = (char *)*(id *)(v24 + 8 * v2 + 32);
        }
        long long v3 = v27;
        unint64_t v28 = v97;
        Sticker.type.getter();
        long long v29 = v98;
        (*v94)(v98, v95, v8);
        sub_100009970(&qword_1000194D0, (void (*)(uint64_t))&type metadata accessor for Sticker.StickerType);
        dispatch thunk of RawRepresentable.rawValue.getter();
        dispatch thunk of RawRepresentable.rawValue.getter();
        a1 = v99;
        long long v30 = v100;
        id v31 = *(void (**)(char *, uint64_t))v6;
        (*(void (**)(char *, uint64_t))v6)(v29, v8);
        v31(v28, v8);
        switch(dispatch thunk of Sticker.effect.getter())
        {
          case -1:
            uint64_t v32 = v92;
            long long v33 = (void *)dispatch thunk of Sticker.preferredRepresentation.getter();
            if (v32)
            {
              swift_errorRetain();
              swift_errorRetain();
              uint64_t v34 = Logger.logObject.getter();
              os_log_type_t v35 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v34, v35))
              {
                uint64_t v36 = swift_slowAlloc();
                unint64_t v37 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v36 = v82;
                swift_errorRetain();
                uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
                *(void *)(v36 + 4) = v38;
                *unint64_t v37 = v38;
                swift_errorRelease();
                swift_errorRelease();
                _os_log_impl((void *)&_mh_execute_header, v34, v35, "Error calculating sticker metrics %@", (uint8_t *)v36, 0xCu);
                sub_1000039CC((uint64_t *)&unk_100019340);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                swift_errorRelease();
              }
              else
              {

                swift_errorRelease();
                swift_errorRelease();
                swift_errorRelease();
              }
              uint64_t v92 = 0;
              goto LABEL_58;
            }
            uint64_t v40 = v33;
            uint64_t v92 = 0;
            if (!v33)
            {
              static Sticker.Representation.Role.animatedVariant.getter();
LABEL_50:
              swift_bridgeObjectRelease();
              goto LABEL_51;
            }
            id v41 = v33;
            uint64_t v42 = dispatch thunk of Sticker.Representation.role.getter();
            uint64_t v44 = v43;
            id v71 = v41;

            uint64_t v45 = static Sticker.Representation.Role.animatedVariant.getter();
            if (!v44) {
              goto LABEL_50;
            }
            if (v42 == v45 && v44 == v46)
            {

              swift_bridgeObjectRelease_n();
LABEL_64:
              unint64_t v24 = v85;
              uint64_t v26 = v93;
              if (v30 != a1)
              {
                BOOL v39 = __OFADD__(v83++, 1);
                if (v39) {
                  goto LABEL_89;
                }
              }
              goto LABEL_14;
            }
            char v52 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v52)
            {

              goto LABEL_64;
            }
LABEL_51:
            dispatch thunk of Sticker.externalURI.getter();
            if (!v47)
            {

LABEL_58:
              unint64_t v24 = v85;
              uint64_t v26 = v93;
              goto LABEL_14;
            }
            type metadata accessor for Sticker();
            uint64_t v48 = v80;
            dispatch thunk of static Sticker.classify(uri:)();
            swift_bridgeObjectRelease();

            v49 = v77;
            uint64_t v50 = v78;
            (*v75)(v77, v48, v78);
            int v51 = (*v74)(v49, v50);
            if (v51 == v73)
            {
              (*v72)(v49, v50);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v30 == a1) {
                goto LABEL_58;
              }
              BOOL v39 = __OFADD__(v81++, 1);
              unint64_t v24 = v85;
              uint64_t v26 = v93;
              if (v39) {
                goto LABEL_90;
              }
            }
            else if (v51 == v70)
            {
              (*v72)(v77, v78);
              swift_bridgeObjectRelease();
              unint64_t v24 = v85;
              if (v30 == a1)
              {
                uint64_t v26 = v93;
              }
              else
              {
                BOOL v39 = __OFADD__(v79++, 1);
                uint64_t v26 = v93;
                if (v39) {
                  goto LABEL_91;
                }
              }
            }
            else
            {
              if (v51 != v69)
              {
                (*v68)(v77, v78);
                goto LABEL_58;
              }
              (*v72)(v77, v78);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v30 == a1) {
                goto LABEL_58;
              }
              BOOL v39 = __OFADD__(v76++, 1);
              unint64_t v24 = v85;
              uint64_t v26 = v93;
              if (v39) {
                goto LABEL_92;
              }
            }
LABEL_14:
            if (v26 == ++v2)
            {
              swift_bridgeObjectRelease();
              Swift::Int v53 = v76;
              Swift::Int v54 = v79;
              Swift::Int v55 = v81;
              Swift::Int v56 = v83;
              Swift::Int v58 = v90;
              Swift::Int v57 = v91;
              Swift::Int v60 = v88;
              Swift::Int v59 = v89;
              Swift::Int v61 = v87;
              goto LABEL_85;
            }
            break;
          case 0:

            if (v30 == a1) {
              goto LABEL_12;
            }
            BOOL v39 = __OFADD__(v87++, 1);
            uint64_t v26 = v93;
            if (!v39) {
              goto LABEL_13;
            }
            __break(1u);
LABEL_78:
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
            goto LABEL_82;
          case 1:

            if (v30 == a1) {
              goto LABEL_12;
            }
            BOOL v39 = __OFADD__(v89++, 1);
            uint64_t v26 = v93;
            if (!v39) {
              goto LABEL_13;
            }
            goto LABEL_78;
          case 2:

            if (v30 == a1) {
              goto LABEL_12;
            }
            BOOL v39 = __OFADD__(v88++, 1);
            uint64_t v26 = v93;
            if (!v39) {
              goto LABEL_13;
            }
            goto LABEL_79;
          case 3:

            if (v30 == a1) {
              goto LABEL_12;
            }
            BOOL v39 = __OFADD__(v90++, 1);
            uint64_t v26 = v93;
            if (!v39) {
              goto LABEL_13;
            }
            goto LABEL_80;
          case 4:

            if (v30 == a1) {
              goto LABEL_12;
            }
            BOOL v39 = __OFADD__(v91++, 1);
            uint64_t v26 = v93;
            if (!v39) {
              goto LABEL_13;
            }
            goto LABEL_81;
          default:

LABEL_12:
            uint64_t v26 = v93;
LABEL_13:
            unint64_t v24 = v9;
            goto LABEL_14;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  Swift::Int v53 = 0;
  Swift::Int v54 = 0;
  Swift::Int v55 = 0;
  Swift::Int v57 = 0;
  Swift::Int v58 = 0;
  Swift::Int v60 = 0;
  Swift::Int v59 = 0;
  Swift::Int v61 = 0;
  Swift::Int v56 = 0;
LABEL_85:
  Swift::Bool v63 = v84;
  sub_1000097A0(0, v61, v84);
  sub_1000097A0(1, v60, v63);
  sub_1000097A0(2, v59, v63);
  sub_1000097A0(3, v58, v63);
  sub_1000097A0(4, v57, v63);
  sub_1000097A0(5, v56, v63);
  sub_1000097A0(6, v55, v63);
  sub_1000097A0(7, v54, v63);
  sub_1000097A0(8, v53, v63);
  v64 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v64, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v66 = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "Sending metrics complete", v66, 2u);
    swift_slowDealloc();
  }
}

unint64_t sub_100008FB4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000039CC(&qword_100019518);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1000091B0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
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

id StickersAnalyticsProcessor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id StickersAnalyticsProcessor.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickersAnalyticsProcessor();
  return objc_msgSendSuper2(&v2, "init");
}

id StickersAnalyticsProcessor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickersAnalyticsProcessor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_1000091B0(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_100009228(a1, a2, v4);
}

unint64_t sub_100009228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
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

uint64_t sub_10000930C(void *a1)
{
  uint64_t v2 = type metadata accessor for StickerSequence();
  __chkstk_darwin(v2);
  uint64_t v3 = type metadata accessor for Sticker.FetchRequest.RepresentationSpecifier();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000039CC(&qword_100019520);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Request = type metadata accessor for Sticker.FetchRequest();
  uint64_t v11 = *(void *)(Request - 8);
  __chkstk_darwin(Request);
  BOOL v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Sticker.StickerType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Sticker.FetchRequest.RepresentationSpecifier.preferred(_:), v3);
  Sticker.FetchRequest.init(type:predicate:representations:sortDescriptors:offset:limit:batchSize:)();
  sub_10000641C(a1, a1[3]);
  dispatch thunk of StickerStoreProtocol.stickers(_:)();
  sub_100009970(&qword_100019450, (void (*)(uint64_t))&type metadata accessor for StickerSequence);
  uint64_t v15 = dispatch thunk of Sequence._copyToContiguousArray()();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, Request);
  return v15;
}

void sub_1000097A0(Swift::Int a1, Swift::Int a2, Swift::Bool a3)
{
  sub_1000039CC(&qword_100019500);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100010A00;
  *(void *)(inited + 32) = 0x7954746365666665;
  *(void *)(inited + 40) = 0xEA00000000006570;
  sub_100009934(0, &qword_100019508);
  *(NSNumber *)(inited + 48) = NSNumber.init(integerLiteral:)(a1);
  *(void *)(inited + 56) = 0xD000000000000011;
  *(void *)(inited + 64) = 0x8000000100011130;
  *(NSNumber *)(inited + 72) = NSNumber.init(integerLiteral:)(a2);
  *(void *)(inited + 80) = 0xD00000000000001CLL;
  *(void *)(inited + 88) = 0x8000000100011150;
  *(NSNumber *)(inited + 96) = NSNumber.init(BOOLeanLiteral:)(a3);
  sub_100008FB4(inited);
  NSString v7 = String._bridgeToObjectiveC()();
  sub_100009934(0, &qword_100019510);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

uint64_t type metadata accessor for StickersAnalyticsProcessor()
{
  return self;
}

uint64_t sub_100009934(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009970(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1000099B8()
{
  uint64_t v0 = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "launching com.apple.stickers.analytics", v2, 2u);
    swift_slowDealloc();
  }

  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  v6[4] = sub_100009E84;
  v6[5] = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100009C3C;
  v6[3] = &unk_100014CF0;
  uint64_t v4 = _Block_copy(v6);
  swift_release();
  uint64_t v5 = String.utf8CString.getter();
  xpc_activity_register((const char *)(v5 + 32), XPC_ACTIVITY_CHECK_IN, v4);
  swift_release();
  _Block_release(v4);
}

uint64_t sub_100009B38(_xpc_activity_s *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    if (xpc_activity_get_state(a1) == 2)
    {
      uint64_t v4 = Logger.logObject.getter();
      os_log_type_t v5 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v4, v5))
      {
        unint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "running com.apple.stickers.analytics", v6, 2u);
        swift_slowDealloc();
      }

      type metadata accessor for StickersAnalyticsProcessor();
      static StickersAnalyticsProcessor.sendOncePerDayAnalytics(store:)((void *)(v3
                                                                                 + OBJC_IVAR____TtC9stickersd24StickersAnalyticsService_store));
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_100009C3C(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_100009C9C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9stickersd24StickersAnalyticsService_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_100007120(v0 + OBJC_IVAR____TtC9stickersd24StickersAnalyticsService_store);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100009D54()
{
  return type metadata accessor for StickersAnalyticsService();
}

uint64_t type metadata accessor for StickersAnalyticsService()
{
  uint64_t result = qword_100019550;
  if (!qword_100019550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009DA8()
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

uint64_t sub_100009E4C()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009E84(_xpc_activity_s *a1)
{
  return sub_100009B38(a1);
}

uint64_t sub_100009E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009E9C()
{
  return swift_release();
}

uint64_t sub_100009EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  unint64_t v6 = sub_1000081D4((uint64_t *)&v9);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(v6, a1, a3);
  type metadata accessor for StickersAnalyticsService();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0xD00000000000001CLL;
  *(void *)(v7 + 24) = 0x8000000100011210;
  Logger.init(subsystem:category:)();
  sub_1000081BC(&v9, v7 + OBJC_IVAR____TtC9stickersd24StickersAnalyticsService_store);
  return v7;
}

void sub_100009F9C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

uint64_t sub_10000A034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  Logger.init(subsystem:category:)();
  sub_10000F138(a1, (uint64_t)v9);
  uint64_t v4 = (objc_class *)type metadata accessor for StickerIndexingClient.Provider(0);
  id v5 = objc_allocWithZone(v4);
  Logger.init(subsystem:category:)();
  sub_10000F138((uint64_t)v9, (uint64_t)v5 + OBJC_IVAR____TtCV9stickersd21StickerIndexingClient8Provider_store);

  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, "init");
  sub_100007120((uint64_t)v9);
  sub_100007120(a1);
  uint64_t result = type metadata accessor for StickerIndexingClient(0);
  *(void *)(a2 + *(int *)(result + 20)) = v6;
  return result;
}

void sub_10000A158()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    objc_super v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Will register as SpotlightDaemonClient", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  NSString v9 = String._bridgeToObjectiveC()();
  type metadata accessor for StickerIndexingClient(0);
  SpotlightDaemonClientRegister();
}

uint64_t sub_10000A320(uint64_t a1)
{
  uint64_t v73 = a1;
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v60 = *(void *)(v1 - 8);
  uint64_t v61 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  Swift::Int v59 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v62 = (char *)&v59 - v4;
  uint64_t v68 = type metadata accessor for StickerSequenceIterator();
  uint64_t v63 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  os_log_type_t v65 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for StickerSequence();
  uint64_t v66 = *(void *)(v6 - 8);
  uint64_t v67 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  v64 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v59 - v9;
  uint64_t v11 = type metadata accessor for Sticker.FetchRequest.RepresentationSpecifier();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (uint64_t *)((char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v59 - v16;
  uint64_t v18 = sub_1000039CC(&qword_100019520);
  __chkstk_darwin(v18 - 8);
  id v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Request = type metadata accessor for Sticker.FetchRequest();
  uint64_t v69 = *(void *)(Request - 8);
  uint64_t v70 = Request;
  __chkstk_darwin(Request);
  long long v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for Sticker.StickerType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v20, 1, 1, v24);
  uint64_t v25 = *(void (**)(char *, void, uint64_t))(v12 + 104);
  v25(v17, enum case for Sticker.FetchRequest.RepresentationSpecifier.preferred(_:), v11);
  Sticker.FetchRequest.init(type:predicate:representations:sortDescriptors:offset:limit:batchSize:)();
  sub_1000039CC(&qword_1000196B8);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_100010AB0;
  sub_100009934(0, &qword_1000196C0);
  *(void *)(v26 + 56) = &type metadata for String;
  *(void *)(v26 + 64) = sub_10000E914();
  *(void *)(v26 + 32) = 0x696669746E656469;
  *(void *)(v26 + 40) = 0xEA00000000007265;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  *(void *)(v26 + 96) = sub_100009934(0, &qword_1000196D0);
  *(void *)(v26 + 104) = sub_10000E968();
  *(void *)(v26 + 72) = isa;
  unint64_t v28 = v71;
  uint64_t *v15 = NSPredicate.init(format:_:)();
  v25((char *)v15, enum case for Sticker.FetchRequest.RepresentationSpecifier.where(_:), v11);
  Sticker.FetchRequest.representations.setter();
  Sticker.FetchRequest.limit.setter();
  sub_10000641C(&v28[OBJC_IVAR____TtCV9stickersd21StickerIndexingClient8Provider_store], *(void *)&v28[OBJC_IVAR____TtCV9stickersd21StickerIndexingClient8Provider_store + 24]);
  long long v29 = v72;
  dispatch thunk of StickerStoreProtocol.stickers(_:)();
  if (v29)
  {
    uint64_t v31 = v69;
    uint64_t v30 = v70;
LABEL_3:
    (*(void (**)(char *, uint64_t))(v31 + 8))(v23, v30);
    return v30;
  }
  uint64_t v33 = v63;
  uint64_t v34 = v73;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v64, v10, v67);
  sub_10000E9D0(&qword_100019450, (void (*)(uint64_t))&type metadata accessor for StickerSequence);
  dispatch thunk of Sequence.makeIterator()();
  sub_10000E9D0(&qword_1000196E0, (void (*)(uint64_t))&type metadata accessor for StickerSequenceIterator);
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v35 = v75;
  if (!v75)
  {
    v72 = v23;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v65, v68);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v10, v67);
    uint64_t v43 = v59;
    uint64_t v42 = v60;
    uint64_t v44 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v59, v34, v61);
    uint64_t v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 136315138;
      uint64_t v73 = (uint64_t)(v47 + 4);
      sub_10000E9D0(&qword_1000196E8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v48 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v74 = sub_10000CCB0(v48, v49, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Could not locate sticker with representation with identifier %s", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
    }
    uint64_t v31 = v69;
    uint64_t v30 = v70;
    long long v23 = v72;
    sub_10000C20C();
    swift_allocError();
    *uint64_t v50 = 3;
    swift_willThrow();
    goto LABEL_3;
  }
  (*(void (**)(char *, uint64_t))(v33 + 8))(v65, v68);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v10, v67);
  uint64_t v36 = (void *)v35;
  unint64_t v37 = dispatch thunk of Sticker.representations.getter();
  unint64_t v38 = v37;
  if (!(v37 >> 62))
  {
    uint64_t result = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v39 = v62;
    if (result) {
      goto LABEL_8;
    }
LABEL_17:
    v72 = v23;
    swift_bridgeObjectRelease();
    uint64_t v52 = v60;
    uint64_t v51 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v39, v34, v61);
    Swift::Int v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      Swift::Int v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      uint64_t v75 = v73;
      *(_DWORD *)Swift::Int v55 = 136315138;
      id v71 = v55 + 4;
      sub_10000E9D0(&qword_1000196E8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v56 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v74 = sub_10000CCB0(v56, v57, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v51);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Could not locate sticker representation with identifier %s", v55, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v51);
    }
    uint64_t v31 = v69;
    uint64_t v30 = v70;
    long long v23 = v72;
    sub_10000C20C();
    swift_allocError();
    *Swift::Int v58 = 3;
    swift_willThrow();

    goto LABEL_3;
  }
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  BOOL v39 = v62;
  if (!result) {
    goto LABEL_17;
  }
LABEL_8:
  if ((v38 & 0xC000000000000001) != 0)
  {
    id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_11;
  }
  if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v40 = *(id *)(v38 + 32);
LABEL_11:
    id v41 = v40;
    swift_bridgeObjectRelease();
    uint64_t v30 = dispatch thunk of Sticker.Representation.data.getter();

    (*(void (**)(char *, uint64_t))(v69 + 8))(v23, v70);
    return v30;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000AE48(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, void *aBlock, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *))
{
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;
  _Block_copy(v10);
  id v23 = a1;
  a9(v11, v13, v14, v16, v17, v19, v20, v22, v23, v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000AF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[9] = a4;
  v5[10] = v4;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  return _swift_task_switch(sub_10000AF9C, 0, 0);
}

uint64_t sub_10000AF9C()
{
  uint64_t v13 = v0;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  BOOL v3 = os_log_type_enabled(v1, v2);
  unint64_t v4 = v0[9];
  if (v3)
  {
    unint64_t v5 = v0[7];
    uint64_t v11 = v0[8];
    uint64_t v6 = v0[6];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_bridgeObjectRetain();
    v0[2] = sub_10000CCB0(v6, v5, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[2] = sub_10000CCB0(v11, v4, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Asked to reindex all items for bundle id: %s, protection class: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v8 = (void (*)(void *, void))static StickerReindexer.shared.modify();
  StickerReindexer.reindexStickers(with:)((Swift::OpaquePointer)&_swiftEmptyArrayStorage);
  v8(v0 + 2, 0);
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000B364(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v4[4] = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v4[5] = v10;
  id v12 = a4;
  uint64_t v13 = (void *)swift_task_alloc();
  v4[6] = v13;
  *uint64_t v13 = v4;
  v13[1] = sub_10000B474;
  v13[9] = v11;
  v13[10] = v12;
  v13[7] = v8;
  v13[8] = v9;
  v13[6] = v6;
  return _swift_task_switch(sub_10000AF9C, 0, 0);
}

uint64_t sub_10000B474()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  os_log_type_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  BOOL v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10000B5EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[13] = a5;
  v6[14] = v5;
  v6[11] = a3;
  v6[12] = a4;
  v6[9] = a1;
  v6[10] = a2;
  sub_1000039CC(&qword_1000196A0);
  v6[15] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v6[16] = v7;
  v6[17] = *(void *)(v7 - 8);
  v6[18] = swift_task_alloc();
  v6[19] = swift_task_alloc();
  return _swift_task_switch(sub_10000B6F4, 0, 0);
}

uint64_t sub_10000B6F4()
{
  unint64_t v37 = v0;
  uint64_t v1 = v0 + 9;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = v0[11];
    unint64_t v32 = v0[13];
    uint64_t v33 = v0[12];
    uint64_t v31 = v0[10];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v6 = Array.description.getter();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    v0[6] = sub_10000CCB0(v6, v8, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[7] = sub_10000CCB0(v31, v4, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v5 + 22) = 2080;
    uint64_t v1 = v0 + 9;
    swift_bridgeObjectRetain();
    v0[8] = sub_10000CCB0(v33, v32, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Asked to reindex items for identifiers: %s, bundle id: %s, protection class: %s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v9 = *(void *)(*v1 + 16);
  if (v9)
  {
    uint64_t v34 = v1;
    uint64_t v10 = v0[17];
    uint64_t v11 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    *(void *)type = v10;
    id v12 = (void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
    uint64_t v13 = swift_bridgeObjectRetain() + 40;
    uint64_t v14 = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v16 = v0[15];
      uint64_t v15 = v0[16];
      swift_bridgeObjectRetain();
      UUID.init(uuidString:)();
      swift_bridgeObjectRelease();
      if ((*v11)(v16, 1, v15) == 1)
      {
        sub_10000F070(v0[15], &qword_1000196A0);
      }
      else
      {
        uint64_t v18 = v0[18];
        uint64_t v17 = v0[19];
        uint64_t v19 = v0[16];
        uint64_t v20 = *v12;
        (*v12)(v17, v0[15], v19);
        v20(v18, v17, v19);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v14 = (void *)sub_10000CA48(0, v14[2] + 1, 1, (unint64_t)v14);
        }
        unint64_t v22 = v14[2];
        unint64_t v21 = v14[3];
        if (v22 >= v21 >> 1) {
          uint64_t v14 = (void *)sub_10000CA48(v21 > 1, v22 + 1, 1, (unint64_t)v14);
        }
        uint64_t v23 = v0[18];
        uint64_t v24 = v0[16];
        v14[2] = v22 + 1;
        v20((uint64_t)v14+ ((*(unsigned __int8 *)(*(void *)type + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)type + 80))+ *(void *)(*(void *)type + 72) * v22, v23, v24);
      }
      v13 += 16;
      --v9;
    }
    while (v9);
    uint64_t v1 = v34;
    swift_bridgeObjectRelease();
    if (v14[2]) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v14 = _swiftEmptyArrayStorage;
    if (_swiftEmptyArrayStorage[2])
    {
LABEL_15:
      uint64_t v25 = (void (*)(void *, void))static StickerReindexer.shared.modify();
      StickerReindexer.reindexStickers(with:)((Swift::OpaquePointer)v14);
      swift_bridgeObjectRelease();
      v25(v1 - 7, 0);
      goto LABEL_20;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v26, v27))
  {
    unint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "List of identifiers is empty — nothing to do", v28, 2u);
    swift_slowDealloc();
  }

LABEL_20:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t sub_10000BDAC(int a1, int a2, int a3, void *aBlock, void *a5)
{
  v5[2] = a5;
  v5[3] = _Block_copy(aBlock);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5[4] = v7;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  v5[5] = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  v5[6] = v12;
  a5;
  uint64_t v14 = (void *)swift_task_alloc();
  v5[7] = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_10000BED0;
  return sub_10000B5EC(v7, v8, v10, v11, v13);
}

uint64_t sub_10000BED0()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  os_log_type_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  os_log_type_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

id sub_10000C09C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerIndexingClient.Provider(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C148()
{
  return type metadata accessor for StickerIndexingClient.Provider(0);
}

uint64_t type metadata accessor for StickerIndexingClient.Provider(uint64_t a1)
{
  return sub_10000F100(a1, (uint64_t *)&unk_100019678);
}

uint64_t sub_10000C170()
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

unint64_t sub_10000C20C()
{
  unint64_t result = qword_100019698;
  if (!qword_100019698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019698);
  }
  return result;
}

BOOL sub_10000C260(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000C274()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000C2BC()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000C2E8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_10000C32C(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x726F707075736E55;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6E756F6620746F4ELL;
      break;
    case 4:
      unint64_t result = 0x6961766120746F4ELL;
      break;
    default:
      unint64_t result = 0x6C706D6920746F4ELL;
      break;
  }
  return result;
}

unint64_t sub_10000C404()
{
  return sub_10000C32C(*v0);
}

uint64_t sub_10000C40C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *unint64_t v4 = v3;
  v4[1] = sub_10000F92C;
  return v6();
}

uint64_t sub_10000C4D8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10000F92C;
  return v7();
}

uint64_t sub_10000C5A4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000F070(a1, &qword_1000196F0);
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

uint64_t sub_10000C750(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000C82C;
  return v6(a1);
}

uint64_t sub_10000C82C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  Swift::UInt v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_10000C924(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000039CC(&qword_100019768);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000D368(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000CA48(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000039CC(&qword_1000196B0);
  uint64_t v10 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000E7BC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10000CCB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000CD84(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D308((uint64_t)v12, *a3);
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
      sub_10000D308((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007120((uint64_t)v12);
  return v7;
}

uint64_t sub_10000CD84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000CF40(a5, a6);
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

uint64_t sub_10000CF40(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000CFD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000D1B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000D1B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000CFD8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000D150(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
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

void *sub_10000D150(uint64_t a1, uint64_t a2)
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
  sub_1000039CC(&qword_1000196A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000D1B8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000039CC(&qword_1000196A8);
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
  uint64_t v13 = a4 + 32;
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

uint64_t sub_10000D308(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D368(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_1000039CC(&qword_100019770);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000D478(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v100 = a7;
  uint64_t v101 = a1;
  uint64_t v102 = a3;
  uint64_t v105 = a10;
  uint64_t v15 = sub_1000039CC(&qword_1000196A0);
  __chkstk_darwin(v15 - 8);
  v104 = (char *)&v93 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = type metadata accessor for UUID();
  uint64_t v17 = *(void *)(v109 - 8);
  uint64_t v18 = __chkstk_darwin(v109);
  v97 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  unint64_t v21 = (char *)&v93 - v20;
  uint64_t v22 = sub_1000039CC(&qword_100019758);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v93 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for URL();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v106 = v25;
  uint64_t v107 = v26;
  uint64_t v27 = __chkstk_darwin(v25);
  unsigned int v95 = (char *)&v93 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v103 = (char *)&v93 - v29;
  uint64_t v98 = a9;
  uint64_t v30 = a9 + OBJC_IVAR____TtCV9stickersd21StickerIndexingClient8Provider_logger;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v108 = v30;
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v99 = a5;
    uint64_t v34 = v33;
    uint64_t v93 = swift_slowAlloc();
    v110[0] = v93;
    *(_DWORD *)uint64_t v34 = 136315906;
    unint64_t v96 = v21;
    swift_bridgeObjectRetain();
    uint64_t v111 = sub_10000CCB0(v99, a6, v110);
    uint64_t v94 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v111 = sub_10000CCB0(v100, a8, v110);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v111 = sub_10000CCB0(v101, a2, v110);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v111 = sub_10000CCB0(v102, a4, v110);
    uint64_t v17 = v94;
    unint64_t v21 = v96;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Asked to provider data for item: %s, type: %s, bundle id: %s, protection class: %s", (uint8_t *)v34, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    a5 = v99;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  URL.init(string:)();
  uint64_t v36 = v106;
  uint64_t v35 = v107;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v107 + 48))(v24, 1, v106) == 1)
  {
    sub_10000F070((uint64_t)v24, &qword_100019758);
LABEL_14:
    uint64_t v48 = (uint64_t)v104;
    UUID.init(uuidString:)();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v48, 1, v109) == 1)
    {
      sub_10000F070(v48, &qword_1000196A0);
      swift_bridgeObjectRetain_n();
      unint64_t v49 = Logger.logObject.getter();
      os_log_type_t v50 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = (uint8_t *)swift_slowAlloc();
        v110[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v51 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v111 = sub_10000CCB0(a5, a6, v110);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Cannot create sticker identifier from '%s'", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_10000C20C();
      swift_allocError();
      *unint64_t v62 = 2;
      swift_willThrow();
      goto LABEL_28;
    }
    uint64_t v52 = v48;
    uint64_t v53 = v109;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v21, v52, v109);
    os_log_type_t v54 = v97;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v97, v21, v53);
    Swift::Int v55 = Logger.logObject.getter();
    os_log_type_t v56 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      unint64_t v96 = v21;
      Swift::Int v58 = (uint8_t *)v57;
      v110[0] = swift_slowAlloc();
      *(_DWORD *)Swift::Int v58 = 136315138;
      sub_10000E9D0(&qword_1000196E8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v59 = v109;
      uint64_t v60 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v111 = sub_10000CCB0(v60, v61, v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v47 = *(void (**)(char *, uint64_t))(v17 + 8);
      v47(v54, v59);
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Identifier %s looks like a UUID; interpreting as a sticker representation",
        v58,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      unint64_t v21 = v96;
      swift_slowDealloc();
    }
    else
    {

      uint64_t v47 = *(void (**)(char *, uint64_t))(v17 + 8);
      v47(v54, v109);
    }
    uint64_t v63 = v21;
    uint64_t v64 = sub_10000A320((uint64_t)v21);
    unint64_t v66 = v65;
    sub_10000654C(v64, v65);
    uint64_t v67 = Logger.logObject.getter();
    uint64_t v68 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v67, (os_log_type_t)v68))
    {
      uint64_t v94 = v17;
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 134217984;
      uint64_t v70 = v69;
      uint64_t v71 = 0;
      switch(v66 >> 62)
      {
        case 1uLL:
          LODWORD(v71) = HIDWORD(v64) - v64;
          if (__OFSUB__(HIDWORD(v64), v64))
          {
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
            JUMPOUT(0x10000E348);
          }
          uint64_t v71 = (int)v71;
LABEL_37:
          v110[0] = v71;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          sub_1000065A4(v64, v66);
          _os_log_impl((void *)&_mh_execute_header, v67, (os_log_type_t)v68, "Providing %ld bytes", v70, 0xCu);
          swift_slowDealloc();

          break;
        case 2uLL:
          uint64_t v85 = *(void *)(v64 + 16);
          uint64_t v84 = *(void *)(v64 + 24);
          BOOL v86 = __OFSUB__(v84, v85);
          uint64_t v71 = v84 - v85;
          if (!v86) {
            goto LABEL_37;
          }
          goto LABEL_47;
        case 3uLL:
          goto LABEL_37;
        default:
          uint64_t v71 = BYTE6(v66);
          goto LABEL_37;
      }
    }
    else
    {

      sub_1000065A4(v64, v66);
    }
    sub_10000654C(v64, v66);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, Class, void))(v105 + 16))(v105, isa, 0);

    sub_1000065A4(v64, v66);
    sub_1000065A4(v64, v66);
    Swift::Int v88 = v63;
    uint64_t v89 = v109;
    return ((uint64_t (*)(char *, uint64_t))v47)(v88, v89);
  }
  unint64_t v37 = v103;
  (*(void (**)(void))(v35 + 32))();
  uint64_t v38 = URL.scheme.getter();
  if (!v39) {
    goto LABEL_13;
  }
  if (v38 != 0x616465726F632D78 || v39 != 0xEA00000000006174)
  {
    char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_11;
    }
LABEL_13:
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v36);
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
LABEL_11:
  id v41 = v95;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v95, v37, v36);
  uint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    v110[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 136315138;
    sub_10000E9D0(&qword_100019760, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v45 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v111 = sub_10000CCB0(v45, v46, v110);
    unint64_t v37 = v103;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void (**)(char *, uint64_t))(v35 + 8);
    v47(v41, v36);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "Identifier %s looks like a managed objectID", v44, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v47 = *(void (**)(char *, uint64_t))(v35 + 8);
    v47(v41, v36);
  }
  v72 = (void (*)(uint64_t *, void))static StickerReindexer.shared.modify();
  uint64_t v73 = StickerReindexer.dataForManagedRepresentation(uri:)();
  unint64_t v75 = v74;
  v72(v110, 0);
  if (v75 >> 60 == 15)
  {
    sub_10000C20C();
    swift_allocError();
    *Swift::Int v76 = 3;
    swift_willThrow();
    v47(v37, v36);
LABEL_28:
    swift_errorRetain();
    v77 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, void *))(v105 + 16))(v105, 0, v77);

    swift_errorRelease();
    return swift_errorRelease();
  }
  sub_10000654C(v73, v75);
  Swift::Int v79 = Logger.logObject.getter();
  os_log_type_t v80 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v79, v80))
  {
    Swift::Int v81 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)Swift::Int v81 = 134217984;
    long long v82 = v81;
    uint64_t v83 = 0;
    unint64_t v37 = v103;
    switch(v75 >> 62)
    {
      case 1uLL:
        LODWORD(v83) = HIDWORD(v73) - v73;
        if (__OFSUB__(HIDWORD(v73), v73)) {
          goto LABEL_48;
        }
        uint64_t v83 = (int)v83;
LABEL_42:
        v110[0] = v83;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        sub_10000F0CC(v73, v75);
        _os_log_impl((void *)&_mh_execute_header, v79, v80, "Providing %ld bytes", v82, 0xCu);
        swift_slowDealloc();

        break;
      case 2uLL:
        uint64_t v91 = *(void *)(v73 + 16);
        uint64_t v90 = *(void *)(v73 + 24);
        BOOL v86 = __OFSUB__(v90, v91);
        uint64_t v83 = v90 - v91;
        if (!v86) {
          goto LABEL_42;
        }
        goto LABEL_49;
      case 3uLL:
        goto LABEL_42;
      default:
        uint64_t v83 = BYTE6(v75);
        goto LABEL_42;
    }
  }
  else
  {

    sub_10000F0CC(v73, v75);
  }
  sub_10000654C(v73, v75);
  Class v92 = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class, void))(v105 + 16))(v105, v92, 0);

  sub_10000F0CC(v73, v75);
  sub_10000F0CC(v73, v75);
  Swift::Int v88 = v37;
  uint64_t v89 = v36;
  return ((uint64_t (*)(char *, uint64_t))v47)(v88, v89);
}

uint64_t sub_10000E368(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v39 = a3;
  uint64_t v40 = a5;
  uint64_t v38 = a1;
  uint64_t v15 = a10;
  uint64_t v16 = sub_1000039CC(&qword_100019758);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  id v41 = (char *)&v34 - v20;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v37 = a10;
    uint64_t v24 = v23;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v43 = v36;
    *(_DWORD *)uint64_t v24 = 136315906;
    uint64_t v35 = a7;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_10000CCB0(v38, a2, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_10000CCB0(v39, a4, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_10000CCB0(v40, a6, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_10000CCB0(v35, a8, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Asked to provider file url for bundle id: %s, protection class: %s, itemIdentifier: %s, typeIdentifier: %s", (uint8_t *)v24, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v15 = v37;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v25 = type metadata accessor for URL();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v41, 1, 1, v25);
  sub_10000C20C();
  swift_allocError();
  *uint64_t v28 = 1;
  sub_10000F008(v27, (uint64_t)v19);
  uint64_t v30 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v19, 1, v25) != 1)
  {
    URL._bridgeToObjectiveC()(v29);
    uint64_t v30 = v31;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v25);
  }
  os_log_type_t v32 = (void *)_convertErrorToNSError(_:)();
  (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v30, v32);

  swift_errorRelease();
  return sub_10000F070(v27, &qword_100019758);
}

uint64_t sub_10000E7BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for UUID() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10000E914()
{
  unint64_t result = qword_1000196C8;
  if (!qword_1000196C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000196C8);
  }
  return result;
}

unint64_t sub_10000E968()
{
  unint64_t result = qword_1000196D8;
  if (!qword_1000196D8)
  {
    sub_100009934(255, &qword_1000196D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000196D8);
  }
  return result;
}

uint64_t sub_10000E9D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000EA18()
{
  _Block_release(*(const void **)(v0 + 40));
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000EA70()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  unint64_t v5 = (void *)v0[5];
  unint64_t v6 = (void *)v0[6];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *int64_t v7 = v1;
  v7[1] = sub_10000EB38;
  uint64_t v8 = (uint64_t (*)(int, int, int, void *, void *))((char *)&dword_1000196F8 + dword_1000196F8);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_10000EB38()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000EC30()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10000F92C;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100019708 + dword_100019708);
  return v6(v2, v3, v4);
}

uint64_t sub_10000ECF4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *int64_t v7 = v2;
  v7[1] = sub_10000F92C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100019718 + dword_100019718);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000EDC0()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EDF8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000EB38;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100019728 + dword_100019728);
  return v6(a1, v4);
}

uint64_t sub_10000EEB0()
{
  _Block_release(*(const void **)(v0 + 32));
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000EF00()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unint64_t v6 = v1;
  v6[1] = sub_10000F92C;
  int64_t v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_100019738 + dword_100019738);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000EFC8()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000F008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000039CC(&qword_100019758);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F070(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000039CC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000F0CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000065A4(a1, a2);
  }
  return a1;
}

uint64_t type metadata accessor for StickerIndexingClient(uint64_t a1)
{
  return sub_10000F100(a1, qword_1000197D0);
}

uint64_t sub_10000F100(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000F138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for SpotlightDaemonClientError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpotlightDaemonClientError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SpotlightDaemonClientError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x10000F304);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000F32C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000F334(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SpotlightDaemonClientError()
{
  return &type metadata for SpotlightDaemonClientError;
}

uint64_t *sub_10000F34C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Logger();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void sub_10000F41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_10000F490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_10000F510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t sub_10000F598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000F614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_10000F698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F6AC);
}

uint64_t sub_10000F6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000F76C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F780);
}

uint64_t sub_10000F780(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10000F83C()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10000F8D8()
{
  unint64_t result = qword_100019808;
  if (!qword_100019808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019808);
  }
  return result;
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

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
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

uint64_t static RemoteStickersAPI.xpcInterface.getter()
{
  return static RemoteStickersAPI.xpcInterface.getter();
}

uint64_t static StickerStore.createAPIStore()()
{
  return static StickerStore.createAPIStore()();
}

uint64_t type metadata accessor for StickerStore()
{
  return type metadata accessor for StickerStore();
}

uint64_t type metadata accessor for StickerSequence()
{
  return type metadata accessor for StickerSequence();
}

Swift::Void __swiftcall StickerReindexer.reindexStickers(with:)(Swift::OpaquePointer with)
{
}

uint64_t StickerReindexer.dataForManagedRepresentation(uri:)()
{
  return StickerReindexer.dataForManagedRepresentation(uri:)();
}

uint64_t static StickerReindexer.shared.modify()
{
  return static StickerReindexer.shared.modify();
}

uint64_t dispatch thunk of LaunchStateManager.launchConfiguration.getter()
{
  return dispatch thunk of LaunchStateManager.launchConfiguration.getter();
}

uint64_t dispatch thunk of LaunchStateManager.updateConfiguration(with:)()
{
  return dispatch thunk of LaunchStateManager.updateConfiguration(with:)();
}

uint64_t type metadata accessor for LaunchStateManager()
{
  return type metadata accessor for LaunchStateManager();
}

uint64_t StickerSectionType.init(rawValue:)()
{
  return StickerSectionType.init(rawValue:)();
}

uint64_t StickerSectionType.rawValue.getter()
{
  return StickerSectionType.rawValue.getter();
}

uint64_t type metadata accessor for StickerSectionType()
{
  return type metadata accessor for StickerSectionType();
}

uint64_t type metadata accessor for XPCDataMapperError()
{
  return type metadata accessor for XPCDataMapperError();
}

uint64_t LaunchConfiguration.identifier.getter()
{
  return LaunchConfiguration.identifier.getter();
}

uint64_t LaunchConfiguration.init(sectionType:identifier:)()
{
  return LaunchConfiguration.init(sectionType:identifier:)();
}

uint64_t LaunchConfiguration.sectionType.getter()
{
  return LaunchConfiguration.sectionType.getter();
}

uint64_t type metadata accessor for LaunchConfiguration()
{
  return type metadata accessor for LaunchConfiguration();
}

uint64_t dispatch thunk of StickerStoreProtocol.reindexAllStickers()()
{
  return dispatch thunk of StickerStoreProtocol.reindexAllStickers()();
}

uint64_t dispatch thunk of StickerStoreProtocol.count(for:)()
{
  return dispatch thunk of StickerStoreProtocol.count(for:)();
}

uint64_t dispatch thunk of StickerStoreProtocol.stickers(_:)()
{
  return dispatch thunk of StickerStoreProtocol.stickers(_:)();
}

uint64_t static LaunchStateManagerAPI.xpcInterface.getter()
{
  return static LaunchStateManagerAPI.xpcInterface.getter();
}

uint64_t type metadata accessor for StickerSequenceIterator()
{
  return type metadata accessor for StickerSequenceIterator();
}

uint64_t dispatch thunk of StickerStoreProtocolInternal._internal_only_addSticker(_:)()
{
  return dispatch thunk of StickerStoreProtocolInternal._internal_only_addSticker(_:)();
}

uint64_t dispatch thunk of StickerStoreProtocolInternal._internal_only_removeStickers(identifiers:)()
{
  return dispatch thunk of StickerStoreProtocolInternal._internal_only_removeStickers(identifiers:)();
}

uint64_t type metadata accessor for Sticker.StickerType()
{
  return type metadata accessor for Sticker.StickerType();
}

uint64_t dispatch thunk of Sticker.externalURI.getter()
{
  return dispatch thunk of Sticker.externalURI.getter();
}

uint64_t Sticker.FetchRequest.representations.setter()
{
  return Sticker.FetchRequest.representations.setter();
}

uint64_t type metadata accessor for Sticker.FetchRequest.RepresentationSpecifier()
{
  return type metadata accessor for Sticker.FetchRequest.RepresentationSpecifier();
}

uint64_t Sticker.FetchRequest.init(type:predicate:representations:sortDescriptors:offset:limit:batchSize:)()
{
  return Sticker.FetchRequest.init(type:predicate:representations:sortDescriptors:offset:limit:batchSize:)();
}

uint64_t Sticker.FetchRequest.limit.setter()
{
  return Sticker.FetchRequest.limit.setter();
}

uint64_t type metadata accessor for Sticker.FetchRequest()
{
  return type metadata accessor for Sticker.FetchRequest();
}

uint64_t static Sticker.Representation.Role.animatedVariant.getter()
{
  return static Sticker.Representation.Role.animatedVariant.getter();
}

uint64_t dispatch thunk of Sticker.Representation.data.getter()
{
  return dispatch thunk of Sticker.Representation.data.getter();
}

uint64_t dispatch thunk of Sticker.Representation.role.getter()
{
  return dispatch thunk of Sticker.Representation.role.getter();
}

uint64_t dispatch thunk of Sticker.representations.getter()
{
  return dispatch thunk of Sticker.representations.getter();
}

uint64_t dispatch thunk of Sticker.preferredRepresentation.getter()
{
  return dispatch thunk of Sticker.preferredRepresentation.getter();
}

uint64_t Sticker.type.getter()
{
  return Sticker.type.getter();
}

uint64_t dispatch thunk of Sticker.effect.getter()
{
  return dispatch thunk of Sticker.effect.getter();
}

uint64_t type metadata accessor for Sticker.URIType()
{
  return type metadata accessor for Sticker.URIType();
}

uint64_t dispatch thunk of static Sticker.classify(uri:)()
{
  return dispatch thunk of static Sticker.classify(uri:)();
}

uint64_t type metadata accessor for Sticker()
{
  return type metadata accessor for Sticker();
}

uint64_t XPCCoder.decode<A>(_:)()
{
  return XPCCoder.decode<A>(_:)();
}

uint64_t XPCCoder.encode<A>(_:)()
{
  return XPCCoder.encode<A>(_:)();
}

uint64_t XPCCoder.init()()
{
  return XPCCoder.init()();
}

uint64_t type metadata accessor for XPCCoder()
{
  return type metadata accessor for XPCCoder();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t dispatch thunk of Sequence._copyToContiguousArray()()
{
  return dispatch thunk of Sequence._copyToContiguousArray()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
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

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t SpotlightDaemonClientRegister()
{
  return _SpotlightDaemonClientRegister();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uid_t getuid(void)
{
  return _getuid();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_runOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runOn:");
}