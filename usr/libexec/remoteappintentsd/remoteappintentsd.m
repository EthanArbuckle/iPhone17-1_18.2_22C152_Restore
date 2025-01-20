int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for RemoteAppIntentsDaemon();
  swift_allocObject();
  sub_100005574();
}

uint64_t type metadata accessor for RemoteAppIntentsDaemon()
{
  return self;
}

void sub_100005574()
{
  sub_100007F60();
  type metadata accessor for UUID();
  sub_100006228(&qword_100010860);
  sub_100007EE4(&qword_100010868, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v1 = Dictionary.init(dictionaryLiteral:)();
  *(_DWORD *)(v0 + 16) = 0;
  *(void *)(v0 + 32) = 0;
  v2 = (id *)(v0 + 32);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = &_swiftEmptyArrayStorage;
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100006C30(v3, (uint64_t)qword_100010BF0);
  v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315138;
    uint64_t v7 = _typeName(_:qualified:)();
    sub_100006C94(v7, v8, &v17);
    v2 = (id *)(v0 + 32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s: hello, world.", v6, 0xCu);
    swift_arrayDestroy();
    sub_100007F48();
    sub_100007F48();
  }

  _set_user_dir_suffix();
  static RemoteFileStore.MaintenanceTask.register()();
  type metadata accessor for RapportWakeHandler();
  swift_allocObject();
  swift_retain();
  *(void *)(v0 + 40) = sub_1000089DC((uint64_t)&unk_100010880, v0);
  swift_release();
  v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)v11 = 136315138;
    uint64_t v12 = _typeName(_:qualified:)();
    sub_100006C94(v12, v13, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s: waiting for initial Rapport event", v11, 0xCu);
    swift_arrayDestroy();
    sub_100007F48();
    sub_100007F48();
  }

  id v14 = [objc_allocWithZone((Class)type metadata accessor for AppNotificationEventListenerDelegate()) init];
  id v15 = *v2;
  id *v2 = v14;

  if (*v2)
  {
    id v16 = *v2;
    sub_100007FB4();
  }
  sub_1000059F4();
  dispatch_main();
}

uint64_t sub_100005910(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100005930, 0, 0);
}

uint64_t sub_100005930()
{
  type metadata accessor for RemoteAppIntentsListener();
  swift_allocObject();
  RemoteAppIntentsListener.init()();
  sub_100007EE4(&qword_1000108A8, v1, (void (*)(uint64_t))type metadata accessor for RemoteAppIntentsDaemon);
  RemoteAppIntentsListener.start(transactionDelegate:)();
  swift_release();
  v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000059F4()
{
  sub_100007F60();
  uint64_t v2 = v1;
  uint64_t v17 = type metadata accessor for DispatchWorkItemFlags();
  sub_100007F2C();
  uint64_t v4 = v3;
  __chkstk_darwin();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DispatchQoS();
  sub_100007F2C();
  uint64_t v8 = v7;
  __chkstk_darwin();
  os_log_type_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(31, v11);
  sub_100007D78();
  static OS_dispatch_source.makeSignalSource(signal:queue:)();
  swift_getObjectType();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v2;
  aBlock[4] = sub_100007E28;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000609C;
  aBlock[3] = &unk_10000C660;
  id v14 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  sub_1000060E0();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v16);
  swift_release();
  swift_release();
  OS_dispatch_source.activate()();
  swift_beginAccess();
  swift_unknownObjectRetain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  sub_100006C68(*(void *)((*(void *)(v0 + 48) & 0xFFFFFFFFFFFFFF8) + 0x10));
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  return swift_unknownObjectRelease();
}

uint64_t sub_100005C98()
{
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006C30(v0, (uint64_t)qword_100010BF0);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    v7[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v4 = _typeName(_:qualified:)();
    sub_100006C94(v4, v5, v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s received SIGUSR2, dumping state", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  type metadata accessor for AppNotificationEventRegistry();
  static AppNotificationEventRegistry.dumpState()();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100005E5C();
    return swift_release();
  }
  return result;
}

void sub_100005E5C()
{
  os_unfair_lock_lock(v0 + 4);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v0 + 4);
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006C30(v1, (uint64_t)qword_100010BF0);
  swift_bridgeObjectRetain_n();
  os_log_type_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    type metadata accessor for UUID();
    swift_bridgeObjectRetain();
    sub_100006228(&qword_100010860);
    sub_100007EE4(&qword_100010868, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v5 = Dictionary.Keys.description.getter();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    sub_100006C94(v5, v7, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Long running transactions: %s", v4, 0xCu);
    swift_arrayDestroy();
    sub_100007F48();
    sub_100007F48();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_10000609C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000060E0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100006194()
{
  sub_100007B94(v0 + 16);

  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000061CC()
{
  sub_100006194();

  return _swift_deallocClassInstance(v0, 56, 7);
}

char *sub_100006200()
{
  if (&swift_runtimeSupportsNoncopyableTypes) {
    return (char *)sub_100006228(&qword_1000107E0);
  }
  else {
    return (char *)&type metadata for () + 8;
  }
}

uint64_t sub_100006228(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000626C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  sub_100007F2C();
  uint64_t v4 = v3;
  __chkstk_darwin();
  sub_100007FA0();
  uint64_t v30 = v5;
  __chkstk_darwin();
  unint64_t v7 = (char *)&v26 - v6;
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100006C30(v8, (uint64_t)qword_100010BF0);
  v29 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v29(v7, a1, v2);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v28 = v4;
    uint64_t v12 = v11;
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v13 = static Instrumentation.currentActivityId.getter();
    uint64_t v27 = a1;
    uint64_t v32 = sub_100006C94(v13, v14, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    sub_100007EE4(&qword_100010848, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v32 = sub_100006C94(v15, v16, &v33);
    a1 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t))(v28 + 8);
    uint64_t v18 = sub_100007F78();
    v17(v18);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%sLong running operation %s will start, requesting transaction", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    sub_100007F48();
    sub_100007F48();
  }
  else
  {
    uint64_t v17 = *(void (**)(uint64_t))(v4 + 8);
    ((void (*)(char *, uint64_t))v17)(v7, v2);
  }

  uint64_t v33 = 0;
  unint64_t v34 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  uint64_t v33 = 0xD00000000000001CLL;
  unint64_t v34 = 0x800000010000ABC0;
  v19._countAndFlagsBits = UUID.uuidString.getter();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v20 = os_transaction_create();
  swift_release();
  uint64_t v21 = v30;
  v29((char *)v30, a1, v2);
  v22 = v31;
  v23 = v31 + 4;
  os_unfair_lock_lock(v31 + 4);
  sub_100006604((uint64_t)&v22[6], v21, v20);
  os_unfair_lock_unlock(v23);
  swift_unknownObjectRelease();
  uint64_t v24 = sub_100007F78();
  return ((uint64_t (*)(uint64_t))v17)(v24);
}

uint64_t sub_100006604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  if (a3)
  {
    uint64_t v9 = swift_unknownObjectRetain();
    sub_1000078CC(v9, (uint64_t)v8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    sub_1000076AC((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_unknownObjectRelease();
  }
}

void sub_100006744(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  sub_100007F2C();
  uint64_t v5 = v4;
  ((void (*)(void))__chkstk_darwin)();
  sub_100007FA0();
  uint64_t v41 = v6;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v38 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v38 - v10;
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = sub_100006C30(v12, (uint64_t)qword_100010BF0);
  unint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  uint64_t v44 = a1;
  v42 = v14;
  v14((uint64_t)v11, a1, v3);
  uint64_t v40 = v13;
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v45 = v3;
    uint64_t v18 = v17;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v47 = v39;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v19 = static Instrumentation.currentActivityId.getter();
    uint64_t v46 = sub_100006C94(v19, v20, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v1 = (void (*)(uint64_t, uint64_t))(v18 + 14);
    sub_100007EE4(&qword_100010848, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v46 = sub_100006C94(v21, v22, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_100007F8C();
    ((void (*)(uint64_t, uint64_t))(v18 + 14))(v23, v45);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%sLong running operation %s completed, released transaction", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    sub_100007F48();
    uint64_t v3 = v45;
    sub_100007F48();
  }
  else
  {
    uint64_t v24 = sub_100007F8C();
    v1(v24, v3);
  }

  uint64_t v25 = v44;
  uint64_t v26 = v42;
  v42((uint64_t)v9, v44, v3);
  uint64_t v27 = v43 + 4;
  os_unfair_lock_lock(v43 + 4);
  uint64_t v28 = sub_1000076AC((uint64_t)v9);
  os_unfair_lock_unlock(v27);
  v1((uint64_t)v9, v3);
  if (v28)
  {
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v29 = v41;
    v26(v41, v25, v3);
    uint64_t v30 = v3;
    v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v47 = v45;
      *(_DWORD *)uint64_t v33 = 136315394;
      uint64_t v34 = static Instrumentation.currentActivityId.getter();
      uint64_t v46 = sub_100006C94(v34, v35, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      sub_100007EE4(&qword_100010848, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v36 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v46 = sub_100006C94(v36, v37, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v1(v29, v30);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "%sNo transaction found for operation %s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      sub_100007F48();
      sub_100007F48();
    }
    else
    {
      v1(v29, v30);
    }
  }
}

uint64_t sub_100006C30(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006C68(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v2 > 1);
  }
  return result;
}

uint64_t sub_100006C94(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006D68(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000786C((uint64_t)v12, *a3);
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
      sub_10000786C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000781C((uint64_t)v12);
  return v7;
}

uint64_t sub_100006D68(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100006EC0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100006F98(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_100006EC0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100006F98(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_100007030(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_10000720C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_10000720C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100007030(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_1000071A4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_1000071A4(uint64_t a1, uint64_t a2)
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
  sub_100006228(&qword_100010850);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000720C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006228(&qword_100010850);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1000073BC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000072E4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1000072E4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1000073BC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_10000744C(uint64_t a1)
{
  type metadata accessor for UUID();
  sub_100007EE4(&qword_100010868, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_1000074E8(a1, v2);
}

unint64_t sub_1000074E8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    size_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100007EE4(&qword_100010870, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_1000076AC(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_10000744C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v7 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  Swift::Int v8 = *(void *)(v7 + 24);
  sub_100006228(&qword_100010858);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v8);
  uint64_t v9 = *(void *)(v13 + 48);
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * v4, v10);
  uint64_t v11 = *(void *)(*(void *)(v13 + 56) + 8 * v4);
  sub_100006228(&qword_100010860);
  sub_100007EE4(&qword_100010868, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  _NativeDictionary._delete(at:)();
  uint64_t *v2 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10000781C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000786C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000078CC(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  sub_10000794C(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t *v2 = v7;

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000794C(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_10000744C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_100006228(&qword_100010858);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_10000744C(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_10:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  unint64_t v22 = *v4;
  if (v19)
  {
    uint64_t v23 = v22[7];
    uint64_t result = swift_unknownObjectRelease();
    *(void *)(v23 + 8 * v18) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_100007ADC(v18, (uint64_t)v11, a1, v22);
  }
  return result;
}

uint64_t sub_100007ADC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_100007B94(uint64_t a1)
{
  uint64_t v2 = sub_100006228(&qword_1000107E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007BF4()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_100007C84;
  return sub_100005910(v0);
}

uint64_t sub_100007C84()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100007D78()
{
  unint64_t result = qword_100010888;
  if (!qword_100010888)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010888);
  }
  return result;
}

uint64_t sub_100007DB8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007DF0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007E28()
{
  return sub_100005C98();
}

uint64_t sub_100007E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007E40()
{
  return swift_release();
}

unint64_t sub_100007E48()
{
  unint64_t result = qword_1000108A0;
  if (!qword_1000108A0)
  {
    sub_100007E9C(&qword_100010898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108A0);
  }
  return result;
}

uint64_t sub_100007E9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007EE4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100007F48()
{
  return swift_slowDealloc();
}

uint64_t sub_100007F78()
{
  return v0;
}

uint64_t sub_100007F8C()
{
  return v0;
}

void sub_100007FB4()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  sub_100006228(&qword_100010A00);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10000A7A0;
  *(void *)(v2 + 32) = 0xD00000000000001BLL;
  *(void *)(v2 + 40) = 0x800000010000ABE0;
  *(void *)(v2 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v2 + 56) = v3;
  uint64_t v14 = v2;
  sub_100006228(&qword_100010A08);
  sub_10000879C();
  uint64_t v4 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100006C30(v7, (uint64_t)qword_100010BF0);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = _typeName(_:qualified:)();
    sub_100006C94(v11, v12, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_100006C94(v4, v6, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s: Starting Event Listener: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    sub_100007F48();
    sub_100007F48();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1000087F0();
  id v13 = sub_100008274();
  [v13 setDelegate:v1];
  [v13 resume];
}

id sub_100008274()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithMachServiceName:v1];

  return v2;
}

uint64_t sub_1000082E8(uint64_t a1, void *a2)
{
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a2 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_1000086D4((uint64_t)v13, (uint64_t)v14);
  if (v14[3])
  {
    if swift_dynamicCast() && (v12)
    {
      id v5 = (id)LNAppNotificationEventListenerXPCInterface();
      [a2 setExportedInterface:v5];

      type metadata accessor for AppNotificationEventRegistry();
      [a2 setExportedObject:static AppNotificationEventRegistry.shared.getter()];
      swift_release();
      [a2 resume];
      return 1;
    }
  }
  else
  {
    sub_10000873C((uint64_t)v14);
  }
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100006C30(v7, (uint64_t)qword_100010BF0);
  id v8 = a2;
  os_log_type_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v14[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109378;
    LODWORD(v13[0]) = [v8 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v11 + 8) = 2080;
    *(void *)&v13[0] = sub_100006C94(0xD00000000000002CLL, 0x800000010000AC70, v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Process with PID %d attempting access to app event registry - requires entitlement: %s", (uint8_t *)v11, 0x12u);
    swift_arrayDestroy();
    sub_100007F48();
    sub_100007F48();
  }
  else
  {
  }
  return 0;
}

id sub_100008618()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

id sub_100008674()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for AppNotificationEventListenerDelegate()
{
  return self;
}

uint64_t sub_1000086D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006228(&qword_1000109F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000873C(uint64_t a1)
{
  uint64_t v2 = sub_100006228(&qword_1000109F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000879C()
{
  unint64_t result = qword_100010A10;
  if (!qword_100010A10)
  {
    sub_100007E9C(&qword_100010A08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A10);
  }
  return result;
}

unint64_t sub_1000087F0()
{
  unint64_t result = qword_100010A18;
  if (!qword_100010A18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010A18);
  }
  return result;
}

uint64_t sub_100008830()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000088A4(v0, qword_100010BF0);
  sub_100006C30(v0, (uint64_t)qword_100010BF0);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_1000088A4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100008908(int a1)
{
  unint64_t v1 = 0xD000000000000011;
  if (!a1) {
    return 0xD000000000000015;
  }
  unint64_t v2 = 0xD00000000000001ALL;
  unint64_t v3 = 0x4E574F4E4B4E55;
  if (a1 == 25) {
    unint64_t v3 = 0xD000000000000018;
  }
  if (a1 != 33) {
    unint64_t v2 = v3;
  }
  if (a1 == 21) {
    unint64_t v2 = 0xD000000000000011;
  }
  if (a1 != 17) {
    unint64_t v1 = v2;
  }
  if (a1 == 9) {
    return 0xD000000000000014;
  }
  else {
    return v1;
  }
}

uint64_t sub_1000089DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_100009E44();
  uint64_t v8 = v7 - v6;
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  sub_100009E44();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_100009E44();
  sub_1000097A4();
  static DispatchQoS.userInitiated.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000097E4();
  sub_100006228(&qword_100010AD0);
  sub_100009834();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v8, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v4);
  os_log_type_t v9 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v3 + 16) = v9;
  os_log_type_t v10 = (void *)swift_allocObject();
  v10[2] = v3;
  v10[3] = a1;
  v10[4] = a2;
  aBlock[4] = sub_1000098C8;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000096E8;
  aBlock[3] = &unk_10000C6B0;
  uint64_t v11 = _Block_copy(aBlock);
  char v12 = v9;
  swift_retain();
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.rapport.matching", v12, v11);
  swift_release();
  _Block_release(v11);

  return v3;
}

const char *sub_100008CA0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100006228(&qword_100010AE0);
  __chkstk_darwin();
  os_log_type_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  id v13 = (uint64_t *)((char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(void **)(a2 + 16);
  *id v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  char v16 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v16 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  unint64_t result = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (!result) {
    return result;
  }
  uint64_t v28 = a3;
  if (qword_1000106C0 != -1) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v18 = type metadata accessor for Logger();
  sub_100006C30(v18, (uint64_t)qword_100010BF0);
  char v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    char v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v27 = a4;
    uint64_t v30 = v22;
    *(_DWORD *)char v21 = 136315138;
    uint64_t v23 = String.init(cString:)();
    uint64_t v29 = sub_100006C94(v23, v24, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Received Rapport wake event for: %s", v21, 0xCu);
    swift_arrayDestroy();
    a4 = v27;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v25 = type metadata accessor for TaskPriority();
  sub_1000098EC((uint64_t)v9, 1, 1, v25);
  uint64_t v26 = (void *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = v28;
  v26[5] = a4;
  v26[6] = a2;
  v26[7] = a1;
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  sub_100009580((uint64_t)v9, (uint64_t)&unk_100010B50, (uint64_t)v26);
  return (const char *)swift_release();
}

uint64_t sub_100008FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  uint64_t v7[3] = a4;
  v7[4] = a5;
  return _swift_task_switch(sub_10000901C, 0, 0);
}

uint64_t sub_10000901C()
{
  uint64_t v12 = v0;
  qos_class_t v1 = qos_class_self();
  if (qword_1000106C0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006C30(v2, (uint64_t)qword_100010BF0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    unint64_t v6 = sub_100008908(v1);
    v0[2] = sub_100006C94(v6, v7, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Bootstrapping listener with QoS class: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v10 = (uint64_t (*)(void))(v0[3] + *(int *)v0[3]);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[7] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10000924C;
  return v10();
}

uint64_t sub_10000924C()
{
  sub_100009E38();
  sub_100009E10();
  uint64_t v1 = *v0;
  sub_100009E28();
  void *v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100009318, 0, 0);
}

uint64_t sub_100009318()
{
  sub_100009E38();
  sub_100009370(*(void **)(v0 + 48));
  sub_100009E54();
  return v1();
}

void sub_100009370(void *a1)
{
  if (xpc_dictionary_get_string(a1, _xpc_event_key_name) && xpc_dictionary_get_BOOL(a1, "replyRequired"))
  {
    if (xpc_dictionary_create_reply(a1))
    {
      xpc_dictionary_send_reply();
      swift_unknownObjectRelease();
    }
    else
    {
      if (qword_1000106C0 != -1) {
        swift_once();
      }
      uint64_t v2 = type metadata accessor for Logger();
      sub_100006C30(v2, (uint64_t)qword_100010BF0);
      oslog = Logger.logObject.getter();
      os_log_type_t v3 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(oslog, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = swift_slowAlloc();
        *(_DWORD *)uint64_t v4 = 136315138;
        uint64_t v5 = String.init(cString:)();
        sub_100006C94(v5, v6, &v8);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Failed to reply to Rapport wake event: %s", v4, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
    }
  }
}

uint64_t sub_100009580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (sub_100009C98(a1, 1, v6) == 1)
  {
    sub_100009CC0(a1);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000096E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_100009748()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for RapportWakeHandler()
{
  return self;
}

unint64_t sub_1000097A4()
{
  unint64_t result = qword_100010AC0;
  if (!qword_100010AC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010AC0);
  }
  return result;
}

unint64_t sub_1000097E4()
{
  unint64_t result = qword_100010AC8;
  if (!qword_100010AC8)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AC8);
  }
  return result;
}

unint64_t sub_100009834()
{
  unint64_t result = qword_100010AD8;
  if (!qword_100010AD8)
  {
    sub_100007E9C(&qword_100010AD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AD8);
  }
  return result;
}

uint64_t sub_100009888()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

const char *sub_1000098C8(void *a1)
{
  return sub_100008CA0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1000098D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000098E4()
{
  return swift_release();
}

uint64_t sub_1000098EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100009914()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100009964(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_100009A38;
  return sub_100008FF8(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_100009A38()
{
  sub_100009E38();
  sub_100009E10();
  uint64_t v1 = *v0;
  sub_100009E28();
  void *v2 = v1;
  swift_task_dealloc();
  sub_100009E54();
  return v3();
}

uint64_t sub_100009AF8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100009BD4;
  return v6(a1);
}

uint64_t sub_100009BD4()
{
  sub_100009E38();
  sub_100009E10();
  uint64_t v1 = *v0;
  sub_100009E28();
  void *v2 = v1;
  swift_task_dealloc();
  sub_100009E54();
  return v3();
}

uint64_t sub_100009C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100009CC0(uint64_t a1)
{
  uint64_t v2 = sub_100006228(&qword_100010AE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009D20()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009D58(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100009A38;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100010B58 + dword_100010B58);
  return v6(a1, v4);
}

uint64_t sub_100009E54()
{
  return v0 + 8;
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t RemoteAppIntentsListener.start(transactionDelegate:)()
{
  return RemoteAppIntentsListener.start(transactionDelegate:)();
}

uint64_t RemoteAppIntentsListener.init()()
{
  return RemoteAppIntentsListener.init()();
}

uint64_t type metadata accessor for RemoteAppIntentsListener()
{
  return type metadata accessor for RemoteAppIntentsListener();
}

uint64_t static AppNotificationEventRegistry.shared.getter()
{
  return static AppNotificationEventRegistry.shared.getter();
}

uint64_t static AppNotificationEventRegistry.dumpState()()
{
  return static AppNotificationEventRegistry.dumpState()();
}

uint64_t type metadata accessor for AppNotificationEventRegistry()
{
  return type metadata accessor for AppNotificationEventRegistry();
}

uint64_t static Instrumentation.currentActivityId.getter()
{
  return static Instrumentation.currentActivityId.getter();
}

uint64_t static RemoteFileStore.MaintenanceTask.register()()
{
  return static RemoteFileStore.MaintenanceTask.register()();
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

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
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

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
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

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
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

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
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

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t LNAppNotificationEventListenerXPCInterface()
{
  return _LNAppNotificationEventListenerXPCInterface();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_main(void)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}