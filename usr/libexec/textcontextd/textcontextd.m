int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (qword_100010CF0 != -1) {
    swift_once();
  }
  qword_100010F60 = qword_100010F70;
  v3 = qword_100010CF8;
  v4 = (id)qword_100010F70;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_100010F78;
  qword_100010F68 = qword_100010F78;
  v6 = self;
  v7 = v5;
  v8 = [v6 mainRunLoop];
  [v8 run];

  return 0;
}

void type metadata accessor for CFBoolean()
{
  if (!qword_100010D00)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010D00);
    }
  }
}

id sub_100005880()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ATRawAssortmentServer()) init];
  qword_100010F70 = (uint64_t)result;
  return result;
}

char *sub_1000058B0()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  uint64_t v5 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_serviceHandler;
  id v6 = objc_allocWithZone((Class)type metadata accessor for ATRawAssortmentServiceHandler());
  v7 = v0;
  *(void *)&v0[v5] = [v6 init];
  uint64_t v8 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_interface;
  *(void *)&v7[v8] = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP9Archetype30ATRawAssortmentServiceProtocol_];
  sub_10000609C();
  static DispatchQoS.default.getter();
  v21 = &_swiftEmptyArrayStorage;
  sub_1000060DC();
  sub_100006134(&qword_100010D68);
  sub_100006178();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)&v7[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_dispatchQueue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  ATRawAssortmentServiceName.getter();
  id v9 = objc_allocWithZone((Class)NSXPCListener);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithMachServiceName:v10];

  *(void *)&v7[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener] = v11;
  v12 = (objc_class *)type metadata accessor for ATRawAssortmentServer();
  v20.receiver = v7;
  v20.super_class = v12;
  v13 = (char *)[super init];
  uint64_t v14 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener;
  v15 = *(void **)&v13[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener];
  v16 = v13;
  [v15 setDelegate:v16];
  [*(id *)&v13[v14] _setQueue:*(void *)&v16[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_dispatchQueue]];
  id v17 = *(id *)&v13[v14];
  [v17 resume];

  return v16;
}

id sub_100005C24()
{
  uint64_t v1 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener;
  [*(id *)&v0[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener] setDelegate:0];
  [*(id *)&v0[v1] invalidate];
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ATRawAssortmentServer();
  [super dealloc];
}

uint64_t type metadata accessor for ATRawAssortmentServer()
{
  return self;
}

uint64_t sub_100005DFC(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)&token - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 auditToken];
  SecTaskRef v7 = SecTaskCreateWithAuditToken(0, &token);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = (__CFString *)String._bridgeToObjectiveC()();
    CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, v9, 0);

    if (v10)
    {
      CFTypeID v11 = CFGetTypeID(v10);
      if (v11 == CFBooleanGetTypeID())
      {
        type metadata accessor for CFBoolean();
        swift_unknownObjectRetain();
        CFBooleanRef v12 = (const __CFBoolean *)swift_dynamicCastUnknownClassUnconditional();
        int Value = CFBooleanGetValue(v12);

        swift_unknownObjectRelease();
        if (Value)
        {
          [a1 setExportedInterface:*(void *)(v1 + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_interface)];
          [a1 setExportedObject:*(void *)(v1 + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_serviceHandler)];
          [a1 _setQueue:*(void *)(v1 + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_dispatchQueue)];
          [a1 resume];
          return 1;
        }
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {
    }
  }
  Logger.init()();
  v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "ATRawAssortmentServer is denying connection because client is missing entitlement", v17, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

unint64_t sub_10000609C()
{
  unint64_t result = qword_100010D58;
  if (!qword_100010D58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010D58);
  }
  return result;
}

unint64_t sub_1000060DC()
{
  unint64_t result = qword_100010D60;
  if (!qword_100010D60)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010D60);
  }
  return result;
}

uint64_t sub_100006134(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006178()
{
  unint64_t result = qword_100010D70;
  if (!qword_100010D70)
  {
    sub_1000061D4(&qword_100010D68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010D70);
  }
  return result;
}

uint64_t sub_1000061D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id ATRawAssortmentServiceHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t sub_100006254(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10000634C(uint64_t a1, NSString a2, uint64_t a3)
{
  if (a2) {
    a2 = String._bridgeToObjectiveC()();
  }
  id v4 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_1000063AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  uint64_t v22 = a3;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v27 = *(void *)(v8 - 8);
  __chkstk_darwin();
  CFTypeRef v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v25 = *(void *)(v11 - 8);
  uint64_t v26 = v11;
  __chkstk_darwin();
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a1;
  sub_100006134(&qword_100010E20);
  sub_100007268(&qword_100010E28, &qword_100010E20);
  uint64_t v14 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v16 = v15;
  sub_10000609C();
  id v17 = (void *)static OS_dispatch_queue.main.getter();
  v18 = (void *)swift_allocObject();
  v18[2] = a2;
  uint64_t v19 = v23;
  v18[3] = v22;
  v18[4] = v14;
  v18[5] = v16;
  aBlock[4] = v19;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006254;
  aBlock[3] = v24;
  objc_super v20 = _Block_copy(aBlock);
  sub_1000071BC(a2);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000071CC();
  sub_100006134(&qword_100010E10);
  sub_100007268(&qword_100010E18, &qword_100010E10);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v13, v26);
}

uint64_t sub_100006774(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    id v6 = (void (*)(uint64_t, uint64_t))result;
    swift_retain();
    v6(a3, a4);
    return sub_100007150((uint64_t)v6);
  }
  return result;
}

id ATRawAssortmentServiceHandler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATRawAssortmentServiceHandler();
  return [super init];
}

id ATRawAssortmentServiceHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATRawAssortmentServiceHandler();
  return [super dealloc];
}

uint64_t _s12textcontextd29ATRawAssortmentServiceHandlerC19spotlightItemTitles_010completionE0ySi_ySSSgcSgtF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init()();
  CFTypeRef v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Retrieving item titles from spotlight", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = [objc_allocWithZone((Class)type metadata accessor for ArchetypeRawAssortment()) init];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))((swift_isaMask & *v13) + 0x58);
  sub_1000071BC(a2);
  v15(a1, sub_1000072F4, v14);

  return swift_release();
}

uint64_t _s12textcontextd29ATRawAssortmentServiceHandlerC24spotlightEmailAttributes_010completionE0ySi_ySSSgcSgtF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init()();
  CFTypeRef v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Retrieving email attributes from spotlight", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = [objc_allocWithZone((Class)type metadata accessor for ArchetypeRawAssortment()) init];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))((swift_isaMask & *v13) + 0x60);
  sub_1000071BC(a2);
  v15(a1, sub_100007228, v14);

  return swift_release();
}

uint64_t _s12textcontextd29ATRawAssortmentServiceHandlerC4text10onScreenAXyySSSgcSg_tF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = a2;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v28 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v27 = v6;
  __chkstk_darwin();
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init()();
  v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Retrieving text on-screen using accessibility", v15, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v16 = [objc_allocWithZone((Class)type metadata accessor for ArchetypeRawAssortment()) init];
  uint64_t v17 = (*(uint64_t (**)(void))((swift_isaMask & *v16) + 0x68))();
  uint64_t v19 = v18;
  sub_10000609C();
  objc_super v20 = (void *)static OS_dispatch_queue.main.getter();
  v21 = (void *)swift_allocObject();
  uint64_t v22 = v25;
  v21[2] = a1;
  v21[3] = v22;
  v21[4] = v17;
  v21[5] = v19;
  aBlock[4] = sub_1000073A4;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006254;
  aBlock[3] = &unk_10000C698;
  uint64_t v23 = _Block_copy(aBlock);
  sub_1000071BC(a1);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000071CC();
  sub_100006134(&qword_100010E10);
  sub_100007268(&qword_100010E18, &qword_100010E10);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v8, v27);
}

uint64_t type metadata accessor for ATRawAssortmentServiceHandler()
{
  return self;
}

uint64_t sub_100007150(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007160()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007198(uint64_t a1, void *a2)
{
  sub_10000634C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000071A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000071B4()
{
  return swift_release();
}

uint64_t sub_1000071BC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_1000071CC()
{
  unint64_t result = qword_100010E08;
  if (!qword_100010E08)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010E08);
  }
  return result;
}

uint64_t sub_100007228(uint64_t a1)
{
  return sub_1000063AC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_10000C6F8, (uint64_t)sub_1000073A4, (uint64_t)&unk_10000C710);
}

uint64_t sub_100007268(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061D4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000072B4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000072F4(uint64_t a1)
{
  return sub_1000063AC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_10000C770, (uint64_t)sub_100007380, (uint64_t)&unk_10000C788);
}

uint64_t sub_100007338()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100007380()
{
  return sub_100006774(v0[2], v0[3], v0[4], v0[5]);
}

id sub_1000073C0()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ATPersonalizationServer()) init];
  qword_100010F78 = (uint64_t)result;
  return result;
}

char *sub_1000073F0()
{
  uint64_t v1 = v0;
  ATPersonalizationServiceName.getter();
  id v2 = objc_allocWithZone((Class)NSXPCListener);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithMachServiceName:v3];

  *(void *)&v1[OBJC_IVAR____TtC12textcontextd23ATPersonalizationServer_listener] = v4;
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for ATPersonalizationServer();
  uint64_t v5 = (char *)[super init];
  uint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC12textcontextd23ATPersonalizationServer_listener];
  uint64_t v7 = v5;
  [v6 setDelegate:v7];
  id v8 = v6;
  [v8 resume];

  return v7;
}

uint64_t sub_1000076DC(char a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  uint64_t v6 = (uint64_t (*)(char))((char *)&dword_100010F50 + dword_100010F50);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  void *v4 = v2;
  v4[1] = sub_100007790;
  return v6(a1);
}

uint64_t sub_100007790(void *a1)
{
  NSString v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_1000078BC@<X0>(uint64_t *a1@<X8>)
{
  id v1 = objc_allocWithZone((Class)type metadata accessor for ATPlayedMediaItem());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = ATPlayedMediaItem.init(title:artist:album:link:bundleID:mediaType:playTime:)();
  *a1 = result;
  return result;
}

uint64_t sub_100007C38(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *aBlock, void *a6)
{
  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  v6[4] = v12;
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100010F28 + dword_100010F28);
  id v14 = a6;
  uint64_t v15 = (void *)swift_task_alloc();
  v6[5] = v15;
  void *v15 = v6;
  v15[1] = sub_100007D44;
  return v17(a1, a2, a3, v11, v13);
}

uint64_t sub_100007D44(void *a1)
{
  NSString v3 = *(void (***)(void, void))(*v1 + 24);
  id v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_100008028(int a1, void *aBlock, void *a3)
{
  v3[5] = a3;
  v3[6] = _Block_copy(aBlock);
  v3[7] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3[8] = v5;
  id v6 = a3;
  return _swift_task_switch(sub_1000080B4, 0, 0);
}

uint64_t sub_1000080B4()
{
  id v1 = objc_allocWithZone((Class)type metadata accessor for ATLocationRetriever());
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)ATLocationRetriever.init(effectiveBundleIdentifier:)();
  *(void *)(v0 + 72) = v2;
  (*(void (**)(void))((swift_isaMask & *v2) + 0x80))();
  uint64_t v5 = (uint64_t (*)(void))(*(void *)((swift_isaMask & *v2) + 0x98) + **(int **)((swift_isaMask & *v2) + 0x98));
  NSString v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v3;
  *NSString v3 = v0;
  v3[1] = sub_100008220;
  return v5();
}

uint64_t sub_100008220(uint64_t a1, uint64_t a2)
{
  NSString v3 = (void *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = a2;
  v3[11] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100008328, 0, 0);
}

uint64_t sub_100008328()
{
  id v1 = *(void **)(v0 + 72);
  uint64_t v2 = *(void (***)(void, void))(v0 + 48);

  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  ((void (**)(void, NSString))v2)[2](v2, v3);

  _Block_release(v2);
  id v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id sub_100008408()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATPersonalizationServer();
  return [super dealloc];
}

uint64_t type metadata accessor for ATPersonalizationServer()
{
  return self;
}

uint64_t sub_100008470()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000084B8()
{
  uint64_t v2 = v0[2];
  NSString v3 = (void *)v0[3];
  id v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100009F5C;
  uint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100010EC8 + dword_100010EC8);
  return v6(v2, v3, v4);
}

uint64_t sub_10000856C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000857C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100009F5C;
  return v6();
}

uint64_t sub_10000864C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100009F5C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100010ED8 + dword_100010ED8);
  return v6(v2, v3, v4);
}

uint64_t sub_10000870C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100009F5C;
  return v7();
}

uint64_t sub_1000087DC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100009F5C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100010EE8 + dword_100010EE8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000088A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100008A4C(a1);
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

uint64_t sub_100008A4C(uint64_t a1)
{
  uint64_t v2 = sub_100006134(&qword_100010EC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008AAC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100008B88;
  return v6(a1);
}

uint64_t sub_100008B88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100008C80()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008CB8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008D70;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100010EF8 + dword_100010EF8);
  return v6(a1, v4);
}

uint64_t sub_100008D70()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100008E64()
{
  _Block_release(*(const void **)(v0 + 48));

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100008EAC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = (void *)v0[6];
  uint64_t v6 = (void *)v0[7];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_100008D70;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int, void *, void *))((char *)&dword_100010F08
                                                                              + dword_100010F08);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_100008F88(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&token - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 auditToken];
  SecTaskRef v7 = SecTaskCreateWithAuditToken(0, &token);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (__CFString *)String._bridgeToObjectiveC()();
    CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, v9, 0);

    if (v10)
    {
      CFTypeID v11 = CFGetTypeID(v10);
      if (v11 == CFBooleanGetTypeID())
      {
        type metadata accessor for CFBoolean();
        swift_unknownObjectRetain();
        CFBooleanRef v12 = (const __CFBoolean *)swift_dynamicCastUnknownClassUnconditional();
        int Value = CFBooleanGetValue(v12);

        swift_unknownObjectRelease();
        if (Value)
        {
          id v14 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP9Archetype24ATPersonalizationService_];
          [a1 setExportedInterface:v14];

          [a1 setExportedObject:v1];
          [a1 resume];
          return 1;
        }
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {
    }
  }
  Logger.init()();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "ATPersonalizationServer is denying connection because client is missing entitlement", v18, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

uint64_t sub_100009230(char a1)
{
  *(unsigned char *)(v1 + 88) = a1;
  uint64_t v2 = type metadata accessor for ATSpotlightDataRecord();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = *(void *)(v2 - 8);
  *(void *)(v1 + 32) = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Date();
  *(void *)(v1 + 40) = v3;
  *(void *)(v1 + 48) = *(void *)(v3 - 8);
  *(void *)(v1 + 56) = swift_task_alloc();
  return _swift_task_switch(sub_10000934C, 0, 0);
}

uint64_t sub_10000934C()
{
  type metadata accessor for ATSpotlightCalendarRetriever();
  swift_allocObject();
  uint64_t v1 = ATSpotlightCalendarRetriever.init()();
  *(void *)(v0 + 64) = v1;
  Date.init()();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v1 + 216)
                                                         + **(int **)(*(void *)v1 + 216));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100009488;
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 88);
  return v6(v3, v4, 100);
}

uint64_t sub_100009488(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 56);
  uint64_t v3 = *(void *)(*(void *)v1 + 48);
  uint64_t v4 = *(void *)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 80) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_1000095E8, 0, 0);
}

uint64_t sub_1000095E8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[3];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    do
    {
      sub_100009E9C(v4, v0[4]);
      uint64_t v6 = v0[4];
      objc_allocWithZone((Class)type metadata accessor for ATCalendarEvent());
      swift_bridgeObjectRetain();
      ATCalendarEvent.init(eventTitle:)();
      sub_100009F00(v6);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v4 += v5;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  id v7 = objc_allocWithZone((Class)type metadata accessor for ATArrayOfCalendarEvents());
  uint64_t v8 = ATArrayOfCalendarEvents.init(calendarEvents:)();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v8);
}

uint64_t sub_1000097C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return _swift_task_switch(sub_1000097F0, 0, 0);
}

uint64_t sub_1000097F0()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  type metadata accessor for ATBiomeDataRetriever();
  v0[9] = swift_initStackObject();
  BOOL v3 = v2 == 1735290739 && v1 == 0xE400000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v4 = &off_10000C500;
  }
  else if (v0[7] == 0x74736163646F70 && v0[8] == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    uint64_t v4 = &off_10000C528;
  }
  else if (v0[7] == 0x6F6F626F69647561 && v0[8] == 0xE90000000000006BLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    uint64_t v4 = &off_10000C550;
  }
  else
  {
    uint64_t v4 = &off_10000C578;
    if ((v0[7] != 0x54724F6569766F6DLL || v0[8] != 0xED0000776F685356)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v4 = &off_10000C5A0;
    }
  }
  v0[10] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100009A24;
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v8 = v0[4];
  return ATBiomeDataRetriever.getTopPlayedMedia(k:start:end:mediaTypesOfInterest:maxNumRecordsToFetch:)(v8, v6, v7, v4, 1000);
}

uint64_t sub_100009A24(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100009B44, 0, 0);
}

uint64_t sub_100009B44()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v3 = (void *)(v1 + 136);
    do
    {
      uint64_t v4 = *(v3 - 2);
      char v5 = *((unsigned char *)v3 - 8);
      uint64_t v6 = *v3;
      v12[1] = *(v3 - 13);
      long long v7 = *((_OWORD *)v3 - 5);
      long long v13 = *((_OWORD *)v3 - 6);
      long long v14 = v7;
      long long v8 = *((_OWORD *)v3 - 3);
      long long v15 = *((_OWORD *)v3 - 4);
      long long v16 = v8;
      long long v17 = *((_OWORD *)v3 - 2);
      uint64_t v18 = v4;
      char v19 = v5;
      uint64_t v20 = v6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1000078BC(v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v3 += 14;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  objc_allocWithZone((Class)type metadata accessor for ATArrayOfPlayedMediaItems());
  uint64_t v9 = ATArrayOfPlayedMediaItems.init(playedMediaItems:)();
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v10(v9);
}

uint64_t sub_100009D60()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100009DA0()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100009F5C;
  char v5 = (uint64_t (*)(char, void *))((char *)&dword_100010F30 + dword_100010F30);
  return v5(v2, v3);
}

uint64_t sub_100009E5C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100009E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009F00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for ArchetypeRawAssortment()
{
  return type metadata accessor for ArchetypeRawAssortment();
}

uint64_t ATLocationRetriever.init(effectiveBundleIdentifier:)()
{
  return ATLocationRetriever.init(effectiveBundleIdentifier:)();
}

uint64_t type metadata accessor for ATLocationRetriever()
{
  return type metadata accessor for ATLocationRetriever();
}

uint64_t type metadata accessor for ATBiomeDataRetriever()
{
  return type metadata accessor for ATBiomeDataRetriever();
}

uint64_t type metadata accessor for ATSpotlightDataRecord()
{
  return type metadata accessor for ATSpotlightDataRecord();
}

uint64_t ATSpotlightCalendarRetriever.init()()
{
  return ATSpotlightCalendarRetriever.init()();
}

uint64_t type metadata accessor for ATSpotlightCalendarRetriever()
{
  return type metadata accessor for ATSpotlightCalendarRetriever();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.default.getter()
{
  return static DispatchQoS.default.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t ATCalendarEvent.init(eventTitle:)()
{
  return ATCalendarEvent.init(eventTitle:)();
}

uint64_t type metadata accessor for ATCalendarEvent()
{
  return type metadata accessor for ATCalendarEvent();
}

uint64_t ATPlayedMediaItem.init(title:artist:album:link:bundleID:mediaType:playTime:)()
{
  return ATPlayedMediaItem.init(title:artist:album:link:bundleID:mediaType:playTime:)();
}

uint64_t type metadata accessor for ATPlayedMediaItem()
{
  return type metadata accessor for ATPlayedMediaItem();
}

uint64_t ATArrayOfCalendarEvents.init(calendarEvents:)()
{
  return ATArrayOfCalendarEvents.init(calendarEvents:)();
}

uint64_t type metadata accessor for ATArrayOfCalendarEvents()
{
  return type metadata accessor for ATArrayOfCalendarEvents();
}

uint64_t ATArrayOfPlayedMediaItems.init(playedMediaItems:)()
{
  return ATArrayOfPlayedMediaItems.init(playedMediaItems:)();
}

uint64_t type metadata accessor for ATArrayOfPlayedMediaItems()
{
  return type metadata accessor for ATArrayOfPlayedMediaItems();
}

uint64_t ATRawAssortmentServiceName.getter()
{
  return ATRawAssortmentServiceName.getter();
}

uint64_t ATPersonalizationServiceName.getter()
{
  return ATPersonalizationServiceName.getter();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return _swift_dynamicCastUnknownClassUnconditional();
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