int main(int argc, const char **argv, const char **envp)
{
  id v3;

  v3 = objc_allocWithZone((Class)type metadata accessor for Server());
  qword_10004A358 = (uint64_t)sub_100015890(0);
  dispatch_main();
}

unint64_t sub_100005694(uint64_t a1)
{
  uint64_t v2 = sub_100005E64(&qword_100049688);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E64(&qword_100049690);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100006754(v12, (uint64_t)v5, &qword_100049688);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_100022EA0(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for SimpleType();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_100005894(uint64_t a1)
{
  uint64_t v2 = sub_100005E64(&qword_1000496C0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E64(&qword_1000496C8);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100006754(v12, (uint64_t)v5, &qword_1000496C0);
    unint64_t result = sub_100022F84((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for FeatureInfo(0);
    sub_1000067B8((uint64_t)v5, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, type metadata accessor for FeatureInfo);
    uint64_t v19 = v7[7];
    uint64_t v20 = type metadata accessor for FeatureState(0);
    unint64_t result = sub_1000067B8(v9, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, type metadata accessor for FeatureState);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_100005AC0(uint64_t a1)
{
  return sub_100005BFC(a1, &qword_1000496A8);
}

unint64_t sub_100005ACC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E64(&qword_1000496A0);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100022EA0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_100005BF0(uint64_t a1)
{
  return sub_100005BFC(a1, &qword_100049698);
}

unint64_t sub_100005BFC(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E64(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_100022EA0(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

uint64_t variable initialization expression of MobileAssetsHandler.downloadedCallback()
{
  return 0;
}

id variable initialization expression of MobileAssetsHandler.downloadOptions()
{
  id v0 = [objc_allocWithZone((Class)MADownloadOptions) init];
  [v0 setAllowsCellularAccess:1];
  [v0 setRequiresPowerPluggedIn:1];
  [v0 setCanUseLocalCacheServer:1];
  if (qword_100049620 != -1) {
    swift_once();
  }
  [v0 setTimeoutIntervalForResource:qword_100049838];
  return v0;
}

unint64_t variable initialization expression of MobileAssetsHandler.assetType()
{
  return 0xD000000000000024;
}

unint64_t variable initialization expression of MobileAssetsHandler.xpcActivityRefreshID()
{
  return 0xD000000000000028;
}

uint64_t variable initialization expression of SystemMonitor.currentFeatureStates()
{
  unint64_t v0 = sub_100005894((uint64_t)_swiftEmptyArrayStorage);
  sub_100005E64(&qword_100049648);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = v0;
  return result;
}

uint64_t sub_100005E64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of SystemMonitor.notificationQueue()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v0);
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  sub_1000060C8();
  static DispatchQoS.default.getter();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v1);
  v7[1] = _swiftEmptyArrayStorage;
  sub_100006234((unint64_t *)&unk_100049C10, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005E64(&qword_100049658);
  sub_100006108();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

unint64_t sub_1000060C8()
{
  unint64_t result = qword_100049650;
  if (!qword_100049650)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100049650);
  }
  return result;
}

unint64_t sub_100006108()
{
  unint64_t result = qword_100049C20;
  if (!qword_100049C20)
  {
    sub_100006164(&qword_100049658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100049C20);
  }
  return result;
}

uint64_t sub_100006164(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for AudioEventCategory(uint64_t a1)
{
}

void type metadata accessor for AudioServiceType(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_1000061EC()
{
  return sub_100006234(&qword_100049678, type metadata accessor for AudioEventCategory);
}

uint64_t sub_100006234(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10000627C(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100006288@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

_WORD *sub_100006298@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(unsigned char *)(a2 + 2) = 0;
  return result;
}

void sub_1000062A8(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

_DWORD *sub_1000062B4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_1000062C4(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_1000062D0()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006318()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006344()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_100006388()
{
  Swift::UInt16 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000063D0()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000063FC()
{
  Swift::UInt16 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL sub_100006440(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_100006454(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100006468(uint64_t a1)
{
  uint64_t v2 = sub_100005E64(&qword_1000496B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (Swift::UInt32 *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_100005E64(&qword_1000496B8);
    uint64_t v7 = (void *)static _DictionaryStorage.allocate(capacity:)();
    uint64_t v8 = (char *)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_100006754(v9, (uint64_t)v5, &qword_1000496B0);
      Swift::UInt32 v11 = *v5;
      unint64_t result = sub_100022F18(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v7[6] + 4 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for Message();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      void v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

unint64_t sub_100006630(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100005E64(&qword_100049680);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = *(unsigned __int16 *)(a1 + 36);
  uint64_t v6 = *(void *)(a1 + 40);
  unint64_t result = sub_100023198(v4 | (v5 << 32));
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v9 = (uint64_t *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = v3[6] + 8 * result;
    *(_DWORD *)uint64_t v10 = v4;
    *(_WORD *)(v10 + 4) = v5;
    *(void *)(v3[7] + 8 * result) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v14 = v9 + 2;
    uint64_t v4 = *((unsigned int *)v9 - 2);
    uint64_t v5 = *((unsigned __int16 *)v9 - 2);
    uint64_t v15 = *v9;
    swift_retain();
    unint64_t result = sub_100023198(v4 | (v5 << 32));
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100006754(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E64(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000067B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void type metadata accessor for MADownloadResult(uint64_t a1)
{
}

void type metadata accessor for AudioEventType(uint64_t a1)
{
}

void sub_100006848(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006890()
{
  return sub_100006234(&qword_1000496E0, type metadata accessor for AudioEventType);
}

void sub_1000068E8(uint64_t a1, void **a2)
{
  uint64_t v3 = type metadata accessor for TraceArgs();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TraceCode();
  uint64_t v59 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v15 = (void *)Strong;
    uint64_t v56 = v7;
    uint64_t v57 = v4;
    uint64_t v58 = v3;
    char v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      BOOL v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v18 = 134217984;
      v61[3] = (uint64_t)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "createSession() called. { reporterID=%lld }", v18, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v19 = (void *)((char *)v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
    swift_beginAccess();
    if (*(void *)(*v19 + 16) > 0x63uLL)
    {
      BOOL v22 = Logger.logObject.getter();
      os_log_type_t v32 = static os_log_type_t.fault.getter();
      if (!os_log_type_enabled(v22, v32))
      {
LABEL_17:
        swift_release();

        return;
      }
      v33 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v33 = 134217984;
      v61[0] = 100;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v22, v32, "Not creating session. Client has exceeded max number of sessions. { maxNumberOfSessions=%ld }", v33, 0xCu);
LABEL_16:
      swift_slowDealloc();
      goto LABEL_17;
    }
    static Double.now()();
    if (*(double *)((char *)v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v20) {
      double v20 = *(double *)((char *)v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)((char *)v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v20 + 30.0;
    swift_beginAccess();
    if (*(void *)(*v19 + 16) && (sub_100023154((uint64_t)a2), (v21 & 1) != 0))
    {
      swift_endAccess();
      swift_retain_n();
      BOOL v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = a2;
        uint64_t v25 = swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        uint64_t v60 = (uint64_t)v24;
        v61[0] = v26;
        *(_DWORD *)uint64_t v25 = 134218499;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v25 + 12) = 1024;
        LODWORD(v60) = *(_DWORD *)((char *)v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v25 + 18) = 2081;
        uint64_t v27 = v15[3];
        unint64_t v28 = v15[4];
        swift_bridgeObjectRetain();
        uint64_t v60 = sub_10002E344(v27, v28, v61);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "createSession skipped, session already exists. { reporterID=%lld, pid=%d, processName=%{private}s }", (uint8_t *)v25, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        goto LABEL_16;
      }
      swift_release_n();
    }
    else
    {
      v54 = v6;
      swift_endAccess();
      uint64_t v53 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      int v34 = *(_DWORD *)((char *)v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
      uint64_t v35 = v15[3];
      unint64_t v36 = v15[4];
      uint64_t v37 = v15[2];
      type metadata accessor for Session();
      swift_allocObject();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v38 = sub_1000289D4(a2, v34, v35, v36, v37, 0);
      swift_beginAccess();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v60 = *v19;
      uint64_t *v19 = 0x8000000000000000;
      sub_1000242E8(v38, (uint64_t)a2, isUniquelyReferenced_nonNull_native);
      uint64_t *v19 = v60;
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_retain_n();
      v40 = Logger.logObject.getter();
      os_log_type_t v41 = static os_log_type_t.debug.getter();
      BOOL v42 = os_log_type_enabled(v40, v41);
      uint64_t v55 = v38;
      if (v42)
      {
        uint64_t v43 = swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        uint64_t v60 = (uint64_t)a2;
        v61[0] = v44;
        *(_DWORD *)uint64_t v43 = 134218499;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v43 + 12) = 1024;
        LODWORD(v60) = *(_DWORD *)((char *)v15 + v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v43 + 18) = 2081;
        uint64_t v53 = (uint64_t)a2;
        uint64_t v45 = v15[3];
        unint64_t v46 = v15[4];
        swift_bridgeObjectRetain();
        uint64_t v60 = sub_10002E344(v45, v46, v61);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "Created session. { reporterID=%lld, pid=%d, processName=%{private}s }", (uint8_t *)v43, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }

      uint64_t v48 = v57;
      uint64_t v47 = v58;
      uint64_t v49 = v56;
      uint64_t v50 = v59;
      v51 = v54;
      (*(void (**)(char *, void, uint64_t))(v59 + 104))(v9, enum case for TraceCode.serverCreate(_:), v56);
      static Utilities.positiveReporterID(_:)();
      TraceArgs.init(arg1:arg2:arg3:arg4:)();
      static Trace.post(_:args:)();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v51, v47);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v9, v49);
      sub_10000C87C();
      swift_release();
      swift_release();
    }
  }
  else
  {
    static Logger.service.getter();
    v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "ClientServerInstance is gone. { action=createSession }", v31, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_1000071D4(__int16 a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)(*(void *)(v3 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = a2;
  *(_WORD *)(v15 + 32) = a1;
  aBlock[4] = sub_10000C6CC;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_1000459B8;
  char v16 = _Block_copy(aBlock);
  id v17 = v13;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v19[1] = _swiftEmptyArrayStorage;
  sub_10000C380();
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10000C3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void))(v10 + 8))(v12, v19[0]);
  swift_release();
  return swift_release();
}

void sub_1000074A0(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = Strong;
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 134217984;
      aBlock[0] = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "setServiceType() called. { reporterID=%lld }", v13, 0xCu);
      swift_slowDealloc();
    }

    static Double.now()();
    if (*(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v14) {
      double v14 = *(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v14 + 1.0;
    uint64_t v15 = sub_10000CE80(a2, 0, 0x6976726553746573, 0xEE00657079546563);
    if (v15)
    {
      uint64_t v16 = v15;
      int v17 = *(unsigned __int16 *)(v15 + 64);
      if (v17 == a3)
      {
        BOOL v18 = Logger.logObject.getter();
        os_log_type_t v19 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v18, v19))
        {
          uint64_t v20 = swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v20 = 136446466;
          uint64_t v21 = static Utilities.serviceTypeDescription(from:)();
          uint64_t v52 = sub_10002E344(v21, v22, aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v20 + 12) = 2048;
          uint64_t v52 = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          os_log_type_t v23 = "ServiceType did not change. { serviceType=%{public}s, reporterID=%lld }";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v18, v19, v23, (uint8_t *)v20, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      if (v17 == 0xFFFF)
      {
        sub_10002D6DC();
        *(_WORD *)(v16 + 64) = a3;
        BOOL v18 = Logger.logObject.getter();
        os_log_type_t v19 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v18, v19))
        {
          uint64_t v20 = swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v20 = 136446466;
          uint64_t v46 = static Utilities.serviceTypeDescription(from:)();
          uint64_t v52 = sub_10002E344(v46, v47, aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v20 + 12) = 2048;
          uint64_t v52 = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          os_log_type_t v23 = "Received serviceType for reporterID. { serviceType=%{public}s, reporterID=%lld }";
          goto LABEL_20;
        }
LABEL_21:
        swift_release();
        swift_release();

        return;
      }
      uint64_t v27 = *(NSObject **)(v15 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v16;
      *(unsigned char *)(v28 + 24) = 0;
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = sub_10000C7EC;
      *(void *)(v29 + 24) = v28;
      aBlock[4] = (uint64_t)sub_10000C7E8;
      aBlock[5] = v29;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000199D0;
      aBlock[3] = (uint64_t)&unk_100045A30;
      os_log_type_t v30 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      dispatch_sync(v27, v30);
      _Block_release(v30);
      LOBYTE(v27) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if (v27)
      {
        __break(1u);
        return;
      }
      uint64_t v31 = swift_retain();
      uint64_t v32 = sub_100032C28(v31);
      sub_10002D6DC();
      *(_WORD *)(v32 + 64) = a3;
      v33 = (uint64_t *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
      swift_beginAccess();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v52 = *v33;
      uint64_t *v33 = 0x8000000000000000;
      sub_1000242E8(v32, a2, isUniquelyReferenced_nonNull_native);
      uint64_t *v33 = v52;
      swift_bridgeObjectRelease();
      swift_endAccess();
      uint64_t v35 = static Utilities.serviceTypeDescription(from:)();
      unint64_t v37 = v36;
      uint64_t v38 = static Utilities.serviceTypeDescription(from:)();
      unint64_t v40 = v39;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      os_log_type_t v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.debug.getter();
      v51 = v41;
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = v38;
        uint64_t v44 = swift_slowAlloc();
        uint64_t v50 = swift_slowAlloc();
        aBlock[0] = v50;
        *(_DWORD *)uint64_t v44 = 136446722;
        uint64_t v49 = v35;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_10002E344(v43, v40, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v44 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_10002E344(v49, v37, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v44 + 22) = 2048;
        uint64_t v52 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v45 = v51;
        _os_log_impl((void *)&_mh_execute_header, v51, v42, "setServiceType() { serviceType=%{public}s, prevServiceType=%{public}s, reporterID=%lld }", (uint8_t *)v44, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_release();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_release();
        swift_release();
      }
    }
    swift_release();
  }
  else
  {
    static Logger.service.getter();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "ClientServerInstance is gone. { action=set:serviceType }", v26, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_100007D4C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = Strong;
    static Double.now()();
    if (*(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v11) {
      double v11 = *(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v11 + 1.0;
    os_log_type_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      double v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)double v14 = 134217984;
      uint64_t v22 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "getServiceName() called. { reporterID=%lld }", v14, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v15 = sub_10000CE80(a2, 0, 0x4E65636976726573, 0xEB00000000656D61);
    if (!v15 || (uint64_t v16 = *(unsigned __int16 *)(v15 + 64), swift_release(), v16 == 0xFFFF))
    {
      uint64_t v17 = static Utilities.generateError(with:code:)();
      uint64_t v16 = 0xFFFFLL;
    }
    else
    {
      uint64_t v17 = 0;
    }
    a3(v17, v16);
    swift_errorRelease();
    return swift_release();
  }
  else
  {
    static Logger.service.getter();
    os_log_type_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "ClientServerInstance is gone. { action=getServiceName }", v21, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_1000080E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v4 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_100008154(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  os_log_type_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v13 = *(void **)(*(void *)(v3 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = a2;
  v15[4] = a1;
  aBlock[4] = sub_10000C5B4;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_100045878;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v13;
  swift_retain();
  swift_bridgeObjectRetain();
  static DispatchQoS.unspecified.getter();
  v19[1] = _swiftEmptyArrayStorage;
  sub_10000C380();
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10000C3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void))(v10 + 8))(v12, v19[0]);
  swift_release();
  return swift_release();
}

void sub_100008428(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    static Double.now()();
    if (*(double *)(v8 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v9) {
      double v9 = *(double *)(v8 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)(v8 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v9 + 1.0;
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v12 = 134217984;
      aBlock[0] = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "setConfiguration() called. { reporterID=%lld }", v12, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v13 = Dictionary<>.asSimpleType()();
    if (v13)
    {
      uint64_t v14 = v13;
      swift_bridgeObjectRetain_n();
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 136380931;
        uint64_t v37 = v17 + 4;
        swift_bridgeObjectRetain();
        uint64_t v38 = (char *)&type metadata for Any + 8;
        uint64_t v18 = Dictionary.description.getter();
        unint64_t v20 = v19;
        swift_bridgeObjectRelease();
        uint64_t v40 = sub_10002E344(v18, v20, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2048;
        uint64_t v40 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Setting configuration { configuration=%{private}s, reporterID=%lld }", (uint8_t *)v17, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v31 = sub_10000CE80(a2, 0, 0x69666E6F43746573, 0xE900000000000067);
      if (v31)
      {
        uint64_t v32 = v31;
        v33 = *(NSObject **)(v31 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        uint64_t v34 = swift_allocObject();
        *(void *)(v34 + 16) = v32;
        *(void *)(v34 + 24) = v14;
        uint64_t v35 = swift_allocObject();
        *(void *)(v35 + 16) = sub_10000C600;
        *(void *)(v35 + 24) = v34;
        aBlock[4] = (uint64_t)sub_10000C7E8;
        aBlock[5] = v35;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1000199D0;
        aBlock[3] = (uint64_t)&unk_1000458F0;
        unint64_t v36 = _Block_copy(aBlock);
        swift_retain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_release();
        dispatch_sync(v33, v36);
        _Block_release(v36);
        LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        if ((v33 & 1) == 0) {
          return;
        }
        __break(1u);
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain_n();
      uint64_t v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 136380931;
        swift_bridgeObjectRetain();
        uint64_t v38 = (char *)&type metadata for Any + 8;
        uint64_t v27 = a2;
        uint64_t v28 = Dictionary.description.getter();
        unint64_t v30 = v29;
        swift_bridgeObjectRelease();
        uint64_t v40 = sub_10002E344(v28, v30, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v26 + 12) = 2048;
        uint64_t v40 = v27;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Error converting session configuration. { configuration=%{private}s, reporterID=%lld }", (uint8_t *)v26, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
      swift_release();
    }
  }
  else
  {
    static Logger.service.getter();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "ClientServerInstance is gone. { action=set:configuration }", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_100008B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void **)(*(void *)(v6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = v22;
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v23;
  v17[5] = a3;
  aBlock[4] = v24;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A18C;
  aBlock[3] = v25;
  unint64_t v19 = _Block_copy(aBlock);
  id v20 = v15;
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v27 = _swiftEmptyArrayStorage;
  sub_10000C380();
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10000C3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
  swift_release();
  return swift_release();
}

uint64_t sub_100008E40(uint64_t a1, uint64_t a2, void (*a3)(void, unint64_t))
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = Strong;
    static Double.now()();
    if (*(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v11) {
      double v11 = *(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v11 + 1.0;
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 134217984;
      uint64_t v24 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "validate() called. { reporterID=%lld }", v14, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v15 = sub_10000CE80(a2, 0, 0x65746164696C6176, 0xE800000000000000);
    sub_100005E64(&qword_100049708);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10003D860;
    *(void *)(inited + 32) = 0x726574726F706572;
    *(void *)(inited + 40) = 0xEA00000000004449;
    if (v15)
    {
      *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithLongLong:*(void *)(v15 + 16)];
      *(void *)(inited + 56) = 0x5465636976726573;
      *(void *)(inited + 64) = 0xEB00000000657079;
      uint64_t v17 = *(unsigned __int16 *)(v15 + 64);
    }
    else
    {
      *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithLongLong:0];
      *(void *)(inited + 56) = 0x5465636976726573;
      *(void *)(inited + 64) = 0xEB00000000657079;
      uint64_t v17 = 0xFFFFLL;
    }
    *(void *)(inited + 72) = [objc_allocWithZone((Class)NSNumber) initWithUnsignedShort:v17];
    unint64_t v22 = sub_100005AC0(inited);
    unint64_t v23 = sub_100013768(v22);
    swift_bridgeObjectRelease();
    a3(0, v23);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    static Logger.service.getter();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "ClientServerInstance is gone. { action=validate }", v20, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_1000092A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v4 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, void *, objc_class *))(a3 + 16))(a3, v4, isa);
}

uint64_t sub_100009340(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      double v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)double v11 = 134217984;
      uint64_t v17 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "startSession() called. { reporterID=%lld }", v11, 0xCu);
      swift_slowDealloc();
    }

    static Double.now()();
    if (*(double *)(v8 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v12) {
      double v12 = *(double *)(v8 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)(v8 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v12 + 5.0;
    if (sub_10000CE80(a2, 0, 0x7472617473, 0xE500000000000000))
    {
      sub_100026E2C();
      swift_release();
    }
    return swift_release();
  }
  else
  {
    static Logger.service.getter();
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "ClientServerInstance is gone. { action=startSession }", v16, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_1000095DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_retain();
  sub_10000A798(a3, a4, a5, a6);

  return swift_release();
}

uint64_t sub_10000964C(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int v22 = a3;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v24 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v14 = &v21[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  os_log_type_t v15 = *(void **)(*(void *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = a4;
  *(_DWORD *)(v17 + 32) = a2;
  *(_WORD *)(v17 + 36) = v22;
  *(void *)(v17 + 40) = a1;
  aBlock[4] = sub_10000C52C;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_100045760;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = v15;
  swift_retain();
  swift_bridgeObjectRetain();
  static DispatchQoS.unspecified.getter();
  uint64_t v25 = _swiftEmptyArrayStorage;
  sub_10000C380();
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10000C3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v18);

  (*(void (**)(unsigned char *, uint64_t))(v24 + 8))(v11, v9);
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v23);
  swift_release();
  return swift_release();
}

void sub_100009938(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v69 = a2;
  uint64_t v8 = sub_100005E64(&qword_100049700);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Message();
  uint64_t v62 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TraceArgs();
  uint64_t v67 = *(void *)(v14 - 8);
  uint64_t v68 = v14;
  __chkstk_darwin(v14);
  v65 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = type metadata accessor for TraceCode();
  uint64_t v64 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  v63 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v61 = a5;
    uint64_t v60 = Strong;
    uint64_t v22 = Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    BOOL v25 = os_log_type_enabled(v23, v24);
    int v57 = a3;
    int v58 = a4;
    uint64_t v59 = v22;
    if (v25)
    {
      uint64_t v26 = swift_slowAlloc();
      v54 = v10;
      uint64_t v27 = v26;
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134284035;
      uint64_t v70 = v69;
      uint64_t v71 = v28;
      uint64_t v56 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v27 + 12) = 2082;
      uint64_t v29 = static Utilities.eventCategoryDescription(from:)();
      uint64_t v55 = v13;
      uint64_t v70 = sub_10002E344(v29, v30, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 22) = 2082;
      uint64_t v10 = v54;
      uint64_t v31 = static Utilities.eventTypeDescription(from:)();
      uint64_t v70 = sub_10002E344(v31, v32, &v71);
      uint64_t v11 = v56;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v13 = v55;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "sendMessage() called. { reporterID=%{private}lld, category=%{public}s, type=%{public}s }", (uint8_t *)v27, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v33 = v60;
    static Double.now()();
    if (*(double *)(v33 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v34) {
      double v34 = *(double *)(v33 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)(v33 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v34 + 1.0;
    if (Dictionary<>.asSimpleType()())
    {
      uint64_t v35 = Logger.logObject.getter();
      os_log_type_t v36 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 134217984;
        uint64_t v71 = v69;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "sendMessage { reporterID=%lld }", v37, 0xCu);
        swift_slowDealloc();
      }

      unint64_t v39 = v63;
      uint64_t v38 = v64;
      uint64_t v40 = v66;
      (*(void (**)(char *, void, uint64_t))(v64 + 104))(v63, enum case for TraceCode.serverSendMessage(_:), v66);
      uint64_t v41 = v69;
      static Utilities.positiveReporterID(_:)();
      os_log_type_t v42 = v65;
      TraceArgs.init(arg1:arg2:arg3:arg4:)();
      static Trace.post(_:args:)();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v42, v68);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
      uint64_t v43 = type metadata accessor for Message.Metadata();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v10, 1, 1, v43);
      Message.init(category:type:content:metadata:)();
      if (sub_10000D2C8((uint64_t)v13, v41))
      {
        (*(void (**)(char *, uint64_t))(v62 + 8))(v13, v11);
        swift_release();
      }
      else
      {
        uint64_t v50 = Logger.logObject.getter();
        os_log_type_t v51 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v52 = 134217984;
          uint64_t v71 = v69;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Message not sent. { reporterID=%lld }", v52, 0xCu);
          swift_slowDealloc();
        }
        swift_release();

        (*(void (**)(char *, uint64_t))(v62 + 8))(v13, v11);
      }
    }
    else
    {
      unint64_t v47 = Logger.logObject.getter();
      os_log_type_t v48 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v49 = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Message cannot be converted to simple type. Aborting send.", v49, 2u);
        swift_slowDealloc();
      }
      swift_release();
    }
  }
  else
  {
    static Logger.service.getter();
    uint64_t v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "ClientServerInstance is gone. { action=send }", v46, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }
}

void sub_10000A1D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TraceArgs();
  uint64_t v38 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TraceCode();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v15 = Strong;
    uint64_t v37 = v3;
    uint64_t v36 = Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = a2;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 134217984;
      aBlock[0] = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "stopSession() called. { reporterID=%lld }", v19, 0xCu);
      a2 = v18;
      swift_slowDealloc();
    }

    static Double.now()();
    if (*(double *)(v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) > v20) {
      double v20 = *(double *)(v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
    }
    *(double *)(v15 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = v20 + 5.0;
    uint64_t v21 = sub_10000CE80(a2, 0, 1886352499, 0xE400000000000000);
    if (!v21) {
      goto LABEL_8;
    }
    uint64_t v22 = v21;
    uint64_t v35 = a2;
    uint64_t v23 = *(NSObject **)(v21 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_10000C4FC;
    *(void *)(v24 + 24) = v22;
    aBlock[4] = sub_10000C7E8;
    aBlock[5] = v24;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000199D0;
    aBlock[3] = &unk_100045710;
    BOOL v25 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    uint64_t v26 = v23;
    a2 = v35;
    dispatch_sync(v26, v25);
    _Block_release(v25);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release_n();
    swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
    }
    else
    {
LABEL_8:
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for TraceCode.serverStop(_:), v6);
      static Utilities.positiveReporterID(_:)();
      TraceArgs.init(arg1:arg2:arg3:arg4:)();
      static Trace.post(_:args:)();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v37);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v28, v29))
      {
        unint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v30 = 134217984;
        aBlock[0] = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Session stop signaled. { reporterID=%lld }", v30, 0xCu);
        swift_slowDealloc();
      }
      swift_release();
    }
  }
  else
  {
    static Logger.service.getter();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "ClientServerInstance is gone. { action=stopSession }", v33, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_10000A798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a4;
  uint64_t v6 = v4;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v22 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void **)(*(void *)(v6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = a1;
  aBlock[4] = a3;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A18C;
  aBlock[3] = v20;
  os_log_type_t v17 = _Block_copy(aBlock);
  id v18 = v14;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v23 = _swiftEmptyArrayStorage;
  sub_10000C380();
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10000C3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v21);
  swift_release();
  return swift_release();
}

uint64_t sub_10000AA54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TraceArgs();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TraceCode();
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v39 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v37 = v4;
    uint64_t v15 = Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v18 = 134217984;
      aBlock[0] = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "destroySession() called. { reporterID=%lld }", v18, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v19 = sub_10000CE80(a2, 0, 0x796F7274736564, 0xE700000000000000);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v35 = v15;
      uint64_t v36 = v3;
      char v21 = *(unsigned char *)(v19 + 66);
      uint64_t v22 = *(NSObject **)(v19 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v20;
      *(unsigned char *)(v23 + 24) = v21;
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = sub_10000C0CC;
      *(void *)(v24 + 24) = v23;
      aBlock[4] = sub_10000C0E8;
      aBlock[5] = v24;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000199D0;
      aBlock[3] = &unk_100045508;
      BOOL v25 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      dispatch_sync(v22, v25);
      _Block_release(v25);
      LOBYTE(v22) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      uint64_t result = swift_release();
      if (v22)
      {
        __break(1u);
        return result;
      }
      swift_beginAccess();
      sub_10000C108(a2);
      swift_endAccess();
      swift_release();
      uint64_t v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v27, v28))
      {
        os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v29 = 134217984;
        aBlock[0] = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Removing from session list. { reporterID=%lld }", v29, 0xCu);
        swift_slowDealloc();
      }

      uint64_t v31 = v38;
      uint64_t v30 = v39;
      (*(void (**)(char *, void, uint64_t))(v38 + 104))(v9, enum case for TraceCode.serverDestroy(_:), v39);
      static Utilities.positiveReporterID(_:)();
      TraceArgs.init(arg1:arg2:arg3:arg4:)();
      static Trace.post(_:args:)();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v36);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v30);
      sub_10000C87C();
      swift_release();
    }
    return swift_release();
  }
  else
  {
    static Logger.service.getter();
    os_log_type_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "ClientServerInstance is gone. { action=destroySession }", v34, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_10000B068(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v24 = a4;
  int v23 = a3;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = type metadata accessor for DispatchQoS();
  uint64_t v14 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v16 = &v22[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  os_log_type_t v17 = *(void **)(*(void *)(v6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v6;
  *(void *)(v18 + 24) = a1;
  *(_DWORD *)(v18 + 32) = a2;
  *(_WORD *)(v18 + 36) = v23;
  *(void *)(v18 + 40) = v24;
  *(void *)(v18 + 48) = a5;
  aBlock[4] = sub_10000C4E0;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_100045670;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v17;
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v26 = _swiftEmptyArrayStorage;
  sub_10000C380();
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10000C3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v19);

  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v25);
  return swift_release();
}

void sub_10000B328(uint64_t a1, uint64_t a2, int a3, __int16 a4, void (*a5)(id, void), uint64_t a6)
{
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    __int16 v36 = a4;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218498;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2082;
    uint64_t v13 = static Utilities.eventCategoryDescription(from:)();
    sub_10002E344(v13, v14, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 2082;
    uint64_t v15 = static Utilities.eventTypeDescription(from:)();
    sub_10002E344(v15, v16, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "requestMessage() called. { reporterID=%lld, category=%{public}s, type=%{public}s }", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a4 = v36;
    swift_slowDealloc();
  }

  if (sub_10000CE80(a2, 0, 0x4D74736575716572, 0xEE00656761737365))
  {
    os_log_type_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Registering callback until message arrives.", v19, 2u);
      swift_slowDealloc();
    }

    sub_100026F90((uint64_t)a5, a6, a3, a4);
    swift_release();
  }
  else
  {
    uint64_t v20 = a2;
    id v21 = [self mainBundle];
    v39._object = (void *)0xE000000000000000;
    v22._object = (void *)0x800000010003E6C0;
    v23._countAndFlagsBits = 0x2064696C61766E49;
    v23._object = (void *)0xEF6E6F6973736553;
    v22._countAndFlagsBits = 0xD000000000000016;
    v39._countAndFlagsBits = 0;
    Swift::String v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, (Swift::String_optional)0, (NSBundle)v21, v22, v39);

    sub_100005E64(&qword_1000496F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10003D870;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v26;
    *(Swift::String *)(inited + 48) = v24;
    unint64_t v27 = sub_100005ACC(inited);
    static Constants.machServiceName.getter();
    sub_100013E88(v27);
    swift_bridgeObjectRelease();
    id v28 = objc_allocWithZone((Class)NSError);
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v31 = [v28 initWithDomain:v29 code:-1 userInfo:isa];

    os_log_type_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 134217984;
      uint64_t v38 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "requestMessage(): Session does not exist. Returning nil. { reporterID=%lld }", v34, 0xCu);
      swift_slowDealloc();
    }

    id v35 = v31;
    a5(v31, 0);
  }
}

void sub_10000B8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v5 = (void *)_convertErrorToNSError(_:)();
    if (a2)
    {
LABEL_3:
      v6.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  v6.super.Class isa = 0;
LABEL_6:
  Class isa = v6.super.isa;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

uint64_t sub_10000B958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[0] = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v20[0] - 8);
  __chkstk_darwin(v20[0]);
  unint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void **)(*(void *)(v4 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = v4;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  aBlock[4] = sub_10000C48C;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_1000455F8;
  os_log_type_t v17 = _Block_copy(aBlock);
  id v18 = v15;
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v20[1] = _swiftEmptyArrayStorage;
  sub_10000C380();
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10000C3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, void))(v12 + 8))(v14, v20[0]);
  return swift_release();
}

void sub_10000BC00(uint64_t a1, uint64_t a2, void (*a3)(id, uint64_t, void))
{
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    char v24 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "getTailspinSessionID() called. { reporterID=%lld }", v7, 0xCu);
    swift_slowDealloc();
  }

  if (static Constants.unknownReporterID.getter() == a2)
  {
    id v8 = [self mainBundle];
    v25._object = (void *)0xE000000000000000;
    v9._object = (void *)0x800000010003E690;
    v10._countAndFlagsBits = 0x2064696C61766E49;
    v10._object = (void *)0xEF6E6F6973736553;
    v9._countAndFlagsBits = 0xD000000000000024;
    v25._countAndFlagsBits = 0;
    Swift::String v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v8, v9, v25);

    sub_100005E64(&qword_1000496F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10003D870;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v13;
    *(Swift::String *)(inited + 48) = v11;
    unint64_t v14 = sub_100005ACC(inited);
    static Constants.machServiceName.getter();
    sub_100013E88(v14);
    swift_bridgeObjectRelease();
    id v15 = objc_allocWithZone((Class)NSError);
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v18 = [v15 initWithDomain:v16 code:-1 userInfo:isa];

    id v19 = v18;
    a3(v18, 0, 0);
  }
  else
  {
    uint64_t v20 = static TailspinKeys.all.getter();
    uint64_t v21 = *(void *)(v20 + 16);
    if (v21)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = v20 + 40;
      while (1)
      {
        swift_bridgeObjectRetain();
        static DefaultsUtilities.reportingDomain.getter();
        static DefaultsUtilities.platformDefaultUserName.getter();
        static DefaultsUtilities.get<A>(key:applicationID:userName:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v24 == 2 || (v24 & 1) == 0) {
          break;
        }
        v22 += 16;
        if (!--v21)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_13;
        }
      }
      swift_bridgeObjectRelease_n();
      uint64_t v23 = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
LABEL_13:
      uint64_t v23 = 1;
    }
    a3(0, v23, 0);
  }
}

void sub_10000C018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t))(a4 + 16))(a4);
}

uint64_t sub_10000C094()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_10000C0CC()
{
  return sub_100029DC0(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_10000C0D8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C0E8()
{
  return sub_1000199A8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000C0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000C100()
{
  return swift_release();
}

uint64_t sub_10000C108(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_100023154(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = v3;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v1;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002554C();
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v5);
  sub_10002EA18(v5, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10000C1A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100022F84(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100025DF8();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = type metadata accessor for FeatureInfo(0);
    sub_10000C728(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = type metadata accessor for FeatureState(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_10000C784(v12 + *(void *)(v20 + 72) * v6, a2);
    sub_10002EDA4(v6, v9);
    *unint64_t v3 = v9;
    swift_bridgeObjectRelease();
    unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for FeatureState(0);
    unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_10000C340()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C378()
{
  return sub_10000AA54(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_10000C380()
{
  unint64_t result = qword_1000496E8;
  if (!qword_1000496E8)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000496E8);
  }
  return result;
}

unint64_t sub_10000C3D8()
{
  unint64_t result = qword_1000496F0;
  if (!qword_1000496F0)
  {
    sub_100006164((uint64_t *)&unk_100049BC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000496F0);
  }
  return result;
}

uint64_t sub_10000C434()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000C46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000C018(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_10000C474()
{
  return sub_10000C638((void (*)(void))&_swift_release);
}

void sub_10000C48C()
{
  sub_10000BC00(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(id, uint64_t, void))(v0 + 32));
}

void sub_10000C498(uint64_t a1, uint64_t a2)
{
  sub_10000B8AC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000C4A0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10000C4E0()
{
  sub_10000B328(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_DWORD *)(v0 + 32), *(_WORD *)(v0 + 36), *(void (**)(id, void))(v0 + 40), *(void *)(v0 + 48));
}

void sub_10000C4F4()
{
  sub_10000A1D0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10000C4FC()
{
}

uint64_t sub_10000C504()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C514()
{
  return sub_10000C638((void (*)(void))&_swift_bridgeObjectRelease);
}

void sub_10000C52C()
{
  sub_100009938(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_DWORD *)(v0 + 32), *(unsigned __int16 *)(v0 + 36), *(void *)(v0 + 40));
}

uint64_t sub_10000C540()
{
  return sub_100009340(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10000C548(uint64_t a1, uint64_t a2)
{
  sub_1000092A0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000C550()
{
  return sub_10000C638((void (*)(void))&_swift_release);
}

uint64_t sub_10000C568()
{
  return sub_100008E40(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void, unint64_t))(v0 + 32));
}

uint64_t sub_10000C574()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000C5B4()
{
  sub_100008428(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000C5C0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C600()
{
  return sub_10002A6B0(*(void *)(v0 + 16));
}

uint64_t sub_10000C608()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000C618(uint64_t a1, uint64_t a2)
{
  sub_1000080E8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000C620()
{
  return sub_10000C638((void (*)(void))&_swift_release);
}

uint64_t sub_10000C638(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 40));

  return _swift_deallocObject(v1, 48, 7);
}

uint64_t sub_10000C688()
{
  return sub_100007D4C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(uint64_t, uint64_t))(v0 + 32));
}

uint64_t sub_10000C694()
{
  swift_release();

  return _swift_deallocObject(v0, 34, 7);
}

void sub_10000C6CC()
{
  sub_1000074A0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_WORD *)(v0 + 32));
}

uint64_t sub_10000C6D8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C6E8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000C720()
{
  sub_1000068E8(*(void *)(v0 + 16), *(void ***)(v0 + 24));
}

uint64_t sub_10000C728(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FeatureInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000C87C()
{
  uint64_t v1 = type metadata accessor for DispatchPredicate();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (unint64_t *)((char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = v0;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  uint64_t v6 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  char v7 = *(void **)(v5 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *uint64_t v4 = v7;
  uint64_t v8 = enum case for DispatchPredicate.onQueue(_:);
  uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t))(v2 + 104);
  v9(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  id v10 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)();
  uint64_t v11 = *(void (**)(void *, uint64_t))(v2 + 8);
  v11(v4, v1);
  if ((v7 & 1) == 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v12 = *(void **)(v5 + v6);
  *uint64_t v4 = v12;
  v9(v4, v8, v1);
  id v13 = v12;
  char v14 = _dispatchPreconditionTest(_:)();
  v11(v4, v1);
  if ((v14 & 1) == 0)
  {
LABEL_32:
    __break(1u);
    return;
  }
  unint64_t v15 = v50 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID;
  swift_beginAccess();
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = sub_10000F3E4(v16);
  swift_bridgeObjectRelease();
  unint64_t v18 = v17[2];
  swift_retain();
  if (v18)
  {
    unint64_t v19 = 0;
    unint64_t v49 = v18 - 1;
    os_log_type_t v51 = _swiftEmptyArrayStorage;
    do
    {
      if (v19 <= v18) {
        unint64_t v20 = v18;
      }
      else {
        unint64_t v20 = v19;
      }
      unint64_t v21 = v19;
      while (1)
      {
        if (v20 == v21)
        {
          __break(1u);
          goto LABEL_31;
        }
        uint64_t v22 = v17[v21 + 4];
        uint64_t v23 = sub_10000CE80(v22, 0, 0x7669746341746567, 0xE900000000000065);
        if (v23)
        {
          int v24 = *(unsigned __int8 *)(v23 + 66);
          swift_release();
          if (v24 == 1) {
            break;
          }
        }
        if (v18 == ++v21) {
          goto LABEL_20;
        }
      }
      Swift::String v25 = v51;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v53 = v25;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_10002F240(0, v25[2] + 1, 1);
        Swift::String v25 = v53;
      }
      unint64_t v28 = v25[2];
      unint64_t v27 = v25[3];
      if (v28 >= v27 >> 1)
      {
        sub_10002F240(v27 > 1, v28 + 1, 1);
        Swift::String v25 = v53;
      }
      unint64_t v19 = v21 + 1;
      void v25[2] = v28 + 1;
      os_log_type_t v51 = v25;
      v25[v28 + 4] = v22;
    }
    while (v49 != v21);
  }
  else
  {
    os_log_type_t v51 = _swiftEmptyArrayStorage;
  }
LABEL_20:
  unint64_t v49 = v15;
  swift_release();
  swift_release();
  int64_t v29 = v51[2];
  if (v29)
  {
    uint64_t v53 = _swiftEmptyArrayStorage;
    sub_10002F220(0, v29, 0);
    uint64_t v30 = v51;
    uint64_t v31 = 0;
    os_log_type_t v32 = v53;
    do
    {
      uint64_t v52 = v30[v31 + 4];
      uint64_t v33 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v35 = v34;
      uint64_t v53 = v32;
      unint64_t v37 = v32[2];
      unint64_t v36 = v32[3];
      if (v37 >= v36 >> 1)
      {
        sub_10002F220(v36 > 1, v37 + 1, 1);
        os_log_type_t v32 = v53;
      }
      ++v31;
      v32[2] = v37 + 1;
      uint64_t v38 = &v32[2 * v37];
      v38[4] = v33;
      v38[5] = v35;
      uint64_t v30 = v51;
    }
    while (v29 != v31);
    swift_release();
  }
  else
  {
    swift_release();
    os_log_type_t v32 = _swiftEmptyArrayStorage;
  }
  uint64_t v53 = v32;
  sub_100005E64(&qword_100049800);
  sub_10000FA78(&qword_100049808, &qword_100049800);
  uint64_t v39 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v41 = v40;
  swift_bridgeObjectRelease();
  uint64_t v42 = v50;
  swift_retain_n();
  swift_bridgeObjectRetain();
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v53 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136381187;
    uint64_t v46 = *(void *)(v42 + 24);
    unint64_t v47 = *(void *)(v42 + 32);
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_10002E344(v46, v47, (uint64_t *)&v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2048;
    uint64_t v48 = *(void *)(*(void *)v49 + 16);
    swift_release();
    uint64_t v52 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    *(_WORD *)(v45 + 22) = 2081;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_10002E344(v39, v41, (uint64_t *)&v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Active reporting sessions. { clientProcessName=%{private}s, sessionCount=%ld, activeSessions=%{private}s }", (uint8_t *)v45, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release_n();
  }
}

uint64_t sub_10000CE80(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (uint64_t *)((char *)&v32[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v14 = *(void **)(*(void *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *id v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    uint64_t v17 = (uint64_t *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
    swift_beginAccess();
    uint64_t v18 = *v17;
    if (*(void *)(v18 + 16) && (unint64_t v19 = sub_100023154(a1), (v20 & 1) != 0))
    {
      uint64_t v21 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
      swift_endAccess();
      swift_retain();
    }
    else
    {
      swift_endAccess();
      if ((a2 & 1) != 0 || (uint64_t v22 = sub_10001AFB0(a1, v5)) == 0)
      {
        swift_bridgeObjectRetain_n();
        unint64_t v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = swift_slowAlloc();
          uint64_t v30 = swift_slowAlloc();
          uint64_t v31 = a1;
          v32[0] = v30;
          *(_DWORD *)uint64_t v29 = 134218243;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v29 + 12) = 2081;
          swift_bridgeObjectRetain();
          uint64_t v31 = sub_10002E344(a3, a4, v32);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Session not found. { reporterID=%lld, action=%{private}s }", (uint8_t *)v29, 0x16u);
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
      else
      {
        uint64_t v21 = v22;
        swift_bridgeObjectRetain_n();
        uint64_t v23 = Logger.logObject.getter();
        os_log_type_t v24 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = swift_slowAlloc();
          uint64_t v26 = swift_slowAlloc();
          uint64_t v31 = a1;
          v32[0] = v26;
          *(_DWORD *)uint64_t v25 = 134218243;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v25 + 12) = 2081;
          swift_bridgeObjectRetain();
          uint64_t v31 = sub_10002E344(a3, a4, v32);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Found session on another instance. { reporterID=%lld, action=%{private}s }", (uint8_t *)v25, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
      }
    }
    return v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Message.Metadata();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (uint64_t *)((char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v14 = *(void **)(*(void *)(v3 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *id v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    if (static Constants.unknownReporterID.getter() == a2)
    {
      char v17 = sub_10000DAA8(a1);
      return v17 & 1;
    }
    uint64_t v18 = sub_10000CE80(a2, 0, 0x737365636F7270, 0xE700000000000000);
    if (v18)
    {
      uint64_t v19 = v18;
      Message.metadata.getter();
      char v20 = Message.Metadata.isBroadcast.getter();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v20 & 1) == 0 || *(unsigned char *)(v19 + 66) == 1)
      {
        char v17 = sub_10000DE88(a1, v19);
        swift_release();
        return v17 & 1;
      }
      os_log_type_t v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 134217984;
        uint64_t v28 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Session is not started. Abandoning broadcast message. { reporterID=%lld }", v26, 0xCu);
        swift_slowDealloc();
      }

      swift_release();
    }
    else
    {
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 134217984;
        uint64_t v28 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Session not found! Abandoning message. { reporterID=%lld }", v23, 0xCu);
        swift_slowDealloc();
      }
    }
    char v17 = 0;
    return v17 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D680()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = *v2 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(*v2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(*v2 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v8) {
      goto LABEL_25;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_25;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_25;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v10);
        if (!v15)
        {
          int64_t v10 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_25;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v10);
          if (!v15)
          {
            int64_t v10 = v14 + 4;
            if (v14 + 4 >= v8) {
              goto LABEL_25;
            }
            unint64_t v15 = *(void *)(v4 + 8 * v10);
            if (!v15) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_5:
    Swift::Int64 v13 = *(void *)(*(void *)(v3 + 48) + 8 * v12);
    type metadata accessor for OsTransactionHandler();
    static OsTransactionHandler.shared.getter();
    OsTransactionHandler.sessionStopped(for:)(v13);
    uint64_t result = swift_release();
  }
  int64_t v16 = v14 + 5;
  if (v16 >= v8)
  {
LABEL_25:
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v17 = v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    uint64_t v18 = type metadata accessor for Logger();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
    swift_unknownObjectRelease();
    uint64_t v19 = v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate;
    uint64_t v20 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
    swift_bridgeObjectRelease();
    return v1;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_25;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10000D8F0()
{
  sub_10000D680();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10000D948()
{
  return type metadata accessor for ClientServerInstance();
}

uint64_t type metadata accessor for ClientServerInstance()
{
  uint64_t result = qword_100049738;
  if (!qword_100049738) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000D99C()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Date();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_10000DAA8(uint64_t a1)
{
  uint64_t v39 = a1;
  uint64_t v38 = type metadata accessor for Message.Metadata();
  uint64_t v2 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v8 = (uint64_t *)((char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = v1;
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  uint64_t v35 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  uint64_t v36 = v9;
  int64_t v10 = *(void **)(v9 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *int64_t v8 = v10;
  uint64_t v11 = enum case for DispatchPredicate.onQueue(_:);
  unint64_t v12 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 104);
  v12(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v13 = v10;
  LOBYTE(v10) = _dispatchPreconditionTest(_:)();
  int64_t v14 = *(uint64_t (**)(void *, uint64_t))(v6 + 8);
  uint64_t result = v14(v8, v5);
  if (v10)
  {
    Message.metadata.getter();
    char v16 = Message.Metadata.isBroadcast.getter();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v38);
    if ((v16 & 1) == 0)
    {
      uint64_t v27 = *(void *)(v37 + 16);
      uint64_t v41 = 0;
      memset(v40, 0, sizeof(v40));
      uint64_t v28 = v39;
      sub_10001486C(v27, v39, (uint64_t)v40, 1);
      __int16 v30 = v29;
      sub_10000F9B0((uint64_t)v40);
      swift_bridgeObjectRelease();
      if ((v30 & 0x100) != 0)
      {
        uint64_t v31 = Logger.logObject.getter();
        os_log_type_t v32 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v33 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "Discarding single message", v33, 2u);
          swift_slowDealloc();
        }

        char v26 = 0;
      }
      else if (v30)
      {
        sub_100017958(v28);
        char v26 = 1;
      }
      else
      {
        char v26 = 0;
      }
      return v26 & 1;
    }
    uint64_t v17 = v39;
    uint64_t v18 = *(void **)(v36 + v35);
    *int64_t v8 = v18;
    v12(v8, v11, v5);
    id v19 = v18;
    char v20 = _dispatchPreconditionTest(_:)();
    uint64_t result = v14(v8, v5);
    if (v20)
    {
      uint64_t v21 = v37;
      swift_beginAccess();
      uint64_t v22 = swift_bridgeObjectRetain();
      uint64_t v23 = sub_10000F3E4(v22);
      uint64_t v24 = swift_bridgeObjectRelease();
      __chkstk_darwin(v24);
      *(&v34 - 2) = v21;
      *(&v34 - 1) = v17;
      os_log_type_t v25 = sub_10000E7BC((void (*)(uint64_t *__return_ptr, uint64_t *))sub_10000FA10, (uint64_t)(&v34 - 4), (uint64_t)v23);
      swift_release();
      char v26 = sub_10000F0C4(1, (uint64_t)v25);
      swift_bridgeObjectRelease();
      return v26 & 1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000DE88(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  sub_100027268((uint64_t)v12);
  sub_10001486C(v5, a1, (uint64_t)v12, 0);
  LOWORD(v5) = v6;
  sub_10000F9B0((uint64_t)v12);
  uint64_t v7 = swift_bridgeObjectRelease();
  if ((v5 & 0x100) != 0)
  {
    swift_retain();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134217984;
      *(void *)unint64_t v12 = *(void *)(a2 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Discarding message { reporterID=%lld }", v11, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    return 0;
  }
  else
  {
    __chkstk_darwin(v7);
    OS_dispatch_queue.sync<A>(execute:)();
    return v12[0];
  }
}

uint64_t sub_10000E034()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v48 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v49 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v47 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  __int16 v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchPredicate();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  os_log_type_t v10 = (uint8_t **)((char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void *)&v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server];
  uint64_t v12 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  id v13 = *(void **)(v11 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *os_log_type_t v10 = v13;
  int64_t v14 = *(void (***)(char *, uint64_t))(v8 + 104);
  LODWORD(v53) = enum case for DispatchPredicate.onQueue(_:);
  v54 = (void *)(v8 + 104);
  uint64_t v52 = v14;
  ((void (*)(void *))v14)(v10);
  id v15 = v13;
  LOBYTE(v13) = _dispatchPreconditionTest(_:)();
  char v16 = *(uint64_t (**)(void *, uint64_t))(v8 + 8);
  int v58 = (void *)(v8 + 8);
  os_log_type_t v51 = v16;
  uint64_t result = v16(v10, v7);
  if ((v13 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v55 = v4;
  swift_retain_n();
  uint64_t v18 = Logger.logObject.getter();
  int v19 = static os_log_type_t.debug.getter();
  BOOL v20 = os_log_type_enabled(v18, (os_log_type_t)v19);
  uint64_t v56 = v12;
  uint64_t v57 = v11;
  if (v20)
  {
    LODWORD(v50) = v19;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    aBlock[0] = v46;
    *(_DWORD *)uint64_t v21 = 136380675;
    uint64_t v22 = *(void **)(v11 + v12);
    *os_log_type_t v10 = v22;
    ((void (*)(void *, void, uint64_t))v52)(v10, v53, v7);
    id v23 = v22;
    char v24 = _dispatchPreconditionTest(_:)();
    uint64_t result = v51(v10, v7);
    if ((v24 & 1) == 0)
    {
LABEL_14:
      __break(1u);
      return result;
    }
    uint64_t v45 = v21 + 4;
    swift_beginAccess();
    uint64_t v25 = swift_bridgeObjectRetain();
    sub_10000F3E4(v25);
    swift_bridgeObjectRelease();
    uint64_t v26 = Array.description.getter();
    uint64_t v27 = v2;
    unint64_t v29 = v28;
    swift_release();
    v61[4] = sub_10002E344(v26, v29, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    uint64_t v2 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v50, "destroyAllSessions() { sessionIDs=%{private}s }", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v12 = v56;
    uint64_t v11 = v57;
  }
  else
  {
    swift_release_n();
  }
  __int16 v30 = *(void **)(v11 + v12);
  *os_log_type_t v10 = v30;
  ((void (*)(void *, void, uint64_t))v52)(v10, v53, v7);
  id v31 = v30;
  LOBYTE(v30) = _dispatchPreconditionTest(_:)();
  uint64_t result = v51(v10, v7);
  if ((v30 & 1) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  swift_beginAccess();
  uint64_t v32 = swift_bridgeObjectRetain();
  uint64_t v33 = sub_10000F3E4(v32);
  swift_bridgeObjectRelease();
  int v58 = v33;
  uint64_t v34 = v33[2];
  if (v34)
  {
    v54 = v61;
    uint64_t v53 = (void (**)(char *, uint64_t))(v48 + 8);
    uint64_t v52 = (void (**)(char *, uint64_t))(v47 + 8);
    swift_retain();
    os_log_type_t v51 = (uint64_t (*)(void *, uint64_t))v1;
    uint64_t v35 = 0;
    uint64_t v36 = v49;
    uint64_t v37 = v6;
    uint64_t v50 = v34;
    do
    {
      uint64_t v38 = v58[v35++ + 4];
      uint64_t v39 = *(void **)(v57 + v56);
      uint64_t v40 = swift_allocObject();
      swift_weakInit();
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = v40;
      *(void *)(v41 + 24) = v38;
      v61[2] = sub_10000C378;
      v61[3] = v41;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      v61[0] = sub_10001A18C;
      v61[1] = &unk_100045AF8;
      uint64_t v42 = _Block_copy(aBlock);
      id v43 = v39;
      swift_retain();
      static DispatchQoS.unspecified.getter();
      uint64_t v59 = _swiftEmptyArrayStorage;
      sub_10000F95C((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100005E64((uint64_t *)&unk_100049BC0);
      sub_10000FA78((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v42);

      (*v53)(v36, v2);
      (*v52)(v37, v55);
      swift_release();
      uint64_t v44 = v50;
      swift_release();
    }
    while (v44 != v35);
    swift_release();
  }
  return swift_release();
}

void *sub_10000E7BC(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  __int16 v6 = _swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v17 = _swiftEmptyArrayStorage;
    sub_10002F260(0, v5, 0);
    __int16 v6 = _swiftEmptyArrayStorage;
    uint64_t v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      uint64_t v10 = *v9++;
      uint64_t v15 = v10;
      a1(&v16, &v15);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      char v11 = v16;
      uint64_t v17 = v6;
      unint64_t v13 = v6[2];
      unint64_t v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_10002F260(v12 > 1, v13 + 1, 1);
        __int16 v6 = v17;
      }
      v6[2] = v13 + 1;
      *((unsigned char *)v6 + v13 + 32) = v11;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_10000E8CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (uint64_t *)((char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  uint64_t v7 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  uint64_t v85 = v6;
  uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  void *v5 = v8;
  uint64_t v9 = enum case for DispatchPredicate.onQueue(_:);
  uint64_t v11 = v3 + 104;
  uint64_t v10 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 104);
  v10(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v12 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)();
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t))(v3 + 8);
  uint64_t v13 = v3 + 8;
  int64_t v14 = v15;
  uint64_t result = v15(v5, v2);
  if ((v8 & 1) == 0)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v17 = v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID;
  swift_beginAccess();
  uint64_t v79 = v17;
  uint64_t v18 = swift_bridgeObjectRetain();
  os_log_t v84 = (os_log_t)sub_10000F3E4(v18);
  swift_bridgeObjectRelease();
  uint64_t v86 = v7;
  int v19 = *(void **)(v85 + v7);
  void *v5 = v19;
  v80 = v10;
  v10(v5, v9, v2);
  id v20 = v19;
  LOBYTE(v19) = _dispatchPreconditionTest(_:)();
  uint64_t result = v14(v5, v2);
  v78 = v5;
  if ((v19 & 1) == 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v21 = v9;
  v81 = v14;
  uint64_t v82 = v11;
  uint64_t v76 = v13;
  uint64_t v77 = v2;
  os_log_t v22 = v84;
  Class isa = v84[2].isa;
  uint64_t v24 = v1;
  uint64_t result = swift_retain();
  if (isa)
  {
    unint64_t v25 = 0;
    v75 = (char *)isa - 1;
    uint64_t v26 = &_swiftEmptyArrayStorage;
    unsigned int v83 = v9;
    do
    {
      if (v25 <= (unint64_t)isa) {
        Class v27 = isa;
      }
      else {
        Class v27 = (Class)v25;
      }
      unint64_t v28 = v25;
      while (1)
      {
        if (v27 == (Class)v28)
        {
          __break(1u);
          goto LABEL_49;
        }
        uint64_t v29 = (uint64_t)v22[v28 + 4].isa;
        uint64_t result = sub_10000CE80(v29, 0, 0x7669746341746567, 0xE900000000000065);
        if (result)
        {
          int v30 = *(unsigned __int8 *)(result + 66);
          uint64_t result = swift_release();
          if (v30 == 1) {
            break;
          }
        }
        if (isa == (Class)++v28)
        {
          uint64_t v33 = v86;
          uint64_t v21 = v83;
          goto LABEL_21;
        }
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      v88 = v26;
      if ((result & 1) == 0)
      {
        uint64_t result = sub_10002F240(0, v26[2] + 1, 1);
        uint64_t v26 = v88;
      }
      unint64_t v32 = v26[2];
      unint64_t v31 = v26[3];
      if (v32 >= v31 >> 1)
      {
        uint64_t result = sub_10002F240(v31 > 1, v32 + 1, 1);
        uint64_t v26 = v88;
      }
      unint64_t v25 = v28 + 1;
      v26[2] = v32 + 1;
      v26[v32 + 4] = v29;
      uint64_t v33 = v86;
      uint64_t v21 = v83;
    }
    while (v75 != (char *)v28);
  }
  else
  {
    uint64_t v26 = &_swiftEmptyArrayStorage;
    uint64_t v33 = v86;
  }
LABEL_21:
  swift_release();
  swift_release();
  uint64_t v34 = v26[2];
  swift_release();
  if (v34) {
    return 0;
  }
  static Double.now()();
  if (*(double *)(v24 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) >= v35) {
    return 0;
  }
  swift_retain_n();
  uint64_t v36 = Logger.logObject.getter();
  int v37 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v36, (os_log_type_t)v37))
  {
    swift_release_n();

    return 1;
  }
  LODWORD(v75) = v37;
  os_log_t v84 = v36;
  uint64_t v38 = swift_slowAlloc();
  uint64_t v74 = swift_slowAlloc();
  v88 = (void *)v74;
  *(_DWORD *)uint64_t v38 = 136381443;
  uint64_t v39 = v33;
  uint64_t v40 = v21;
  uint64_t v41 = *(void *)(v24 + 24);
  unint64_t v42 = *(void *)(v24 + 32);
  swift_bridgeObjectRetain();
  uint64_t v87 = sub_10002E344(v41, v42, (uint64_t *)&v88);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  *(_WORD *)(v38 + 12) = 1024;
  LODWORD(v87) = *(_DWORD *)(v24 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_release();
  *(_WORD *)(v38 + 18) = 2048;
  id v43 = *(void **)(v85 + v39);
  uint64_t v45 = v77;
  uint64_t v44 = v78;
  void *v78 = v43;
  unsigned int v83 = v40;
  v80(v44, v40, v45);
  id v46 = v43;
  LOBYTE(v42) = _dispatchPreconditionTest(_:)();
  uint64_t result = v81(v44, v45);
  if ((v42 & 1) == 0)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  uint64_t v47 = swift_bridgeObjectRetain();
  uint64_t v48 = sub_10000F3E4(v47);
  swift_bridgeObjectRelease();
  uint64_t v49 = v48[2];
  swift_release();
  swift_release();
  uint64_t v87 = v49;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_release();
  uint64_t v50 = (uint8_t *)v38;
  *(_WORD *)(v38 + 28) = 2048;
  uint64_t v51 = v86;
  uint64_t v52 = *(void **)(v85 + v86);
  *uint64_t v44 = v52;
  uint64_t v53 = v83;
  v54 = v80;
  v80(v44, v83, v45);
  id v55 = v52;
  LOBYTE(v52) = _dispatchPreconditionTest(_:)();
  uint64_t result = v81(v44, v45);
  if ((v52 & 1) == 0)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  uint64_t v56 = swift_bridgeObjectRetain();
  uint64_t v57 = sub_10000F3E4(v56);
  swift_bridgeObjectRelease();
  int v58 = *(void **)(v85 + v51);
  *uint64_t v44 = v58;
  v54(v44, v53, v45);
  id v59 = v58;
  LOBYTE(v58) = _dispatchPreconditionTest(_:)();
  uint64_t result = v81(v44, v45);
  if (v58)
  {
    unint64_t v60 = v57[2];
    uint64_t result = swift_retain();
    uint64_t v61 = v50;
    if (v60)
    {
      unint64_t v62 = 0;
      uint64_t v86 = v60 - 1;
      v63 = &_swiftEmptyArrayStorage;
LABEL_29:
      if (v62 <= v60) {
        unint64_t v64 = v60;
      }
      else {
        unint64_t v64 = v62;
      }
      unint64_t v65 = v62;
      while (v64 != v65)
      {
        uint64_t v66 = v57[v65 + 4];
        uint64_t result = sub_10000CE80(v66, 0, 0x7669746341746567, 0xE900000000000065);
        if (result)
        {
          int v67 = *(unsigned __int8 *)(result + 66);
          uint64_t result = swift_release();
          if (v67 == 1)
          {
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v87 = (uint64_t)v63;
            if ((result & 1) == 0)
            {
              uint64_t result = sub_10002F240(0, v63[2] + 1, 1);
              v63 = (void *)v87;
            }
            unint64_t v69 = v63[2];
            unint64_t v68 = v63[3];
            unint64_t v70 = v69 + 1;
            if (v69 >= v68 >> 1)
            {
              uint64_t result = sub_10002F240(v68 > 1, v69 + 1, 1);
              unint64_t v70 = v69 + 1;
              v63 = (void *)v87;
            }
            unint64_t v62 = v65 + 1;
            v63[2] = v70;
            v63[v69 + 4] = v66;
            if (v86 != v65) {
              goto LABEL_29;
            }
            goto LABEL_47;
          }
        }
        if (v60 == ++v65) {
          goto LABEL_47;
        }
      }
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    v63 = &_swiftEmptyArrayStorage;
LABEL_47:
    swift_release();
    swift_release();
    uint64_t v72 = v63[2];
    swift_release();
    swift_release();
    uint64_t v87 = v72;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    os_log_t v73 = v84;
    _os_log_impl((void *)&_mh_execute_header, v84, (os_log_type_t)v75, "ClientServerInstance should be invalidated. { clientProcessName=%{private}s, pid=%d, sessionCount=%ld, activeSessions=%ld }", v61, 0x26u);
    uint64_t v71 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return v71;
  }
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_10000F0C4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return v2 & 1;
  }
  if (*(unsigned char *)(a2 + 32) == (result & 1)) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  uint64_t v3 = 33;
  while (1)
  {
    uint64_t v4 = v3 - 31;
    if (__OFADD__(v3 - 32, 1)) {
      break;
    }
    char v5 = *(unsigned char *)(a2 + v3) ^ result;
    if (v5)
    {
      ++v3;
      if (v4 != v2) {
        continue;
      }
    }
    LOBYTE(v2) = v5 ^ 1;
    return v2 & 1;
  }
  __break(1u);
  return result;
}

Swift::Int sub_10000F134()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(_DWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_10000F1B0()
{
  Hasher._combine(_:)(*(_DWORD *)(*v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000F220()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(_DWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_10000F298(uint64_t *a1, uint64_t *a2)
{
  return sub_10000F884(*a1, *a2);
}

uint64_t sub_10000F2A4()
{
  return sub_10000F95C(&qword_1000497F8, (void (*)(uint64_t))type metadata accessor for ClientServerInstance);
}

void *sub_10000F2EC(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100005E64(&qword_100049820);
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
    sub_10000F4CC((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_10000F3E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005E64(&qword_100049810);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  unint64_t v6 = sub_10000F6F0(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10000F9A4();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_10000F4CC(unint64_t a1, uint64_t a2, unint64_t a3)
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
        sub_10000FA78(&qword_100049830, &qword_100049828);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100005E64(&qword_100049828);
          id v12 = sub_10001ECB8(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
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
    type metadata accessor for Config();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10000F6F0(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000F884(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2
                                                                                                  + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid))
    return 0;
  if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t sub_10000F8D4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000F90C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F944(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000F954()
{
  return swift_release();
}

uint64_t sub_10000F95C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000F9A4()
{
  return swift_release();
}

uint64_t sub_10000F9B0(uint64_t a1)
{
  uint64_t v2 = sub_100005E64(&qword_100049818);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000FA10@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000D2C8(*(void *)(v2 + 24), *a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_10000FA5C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10002A89C(*(void *)(v1 + 24), a1);
}

uint64_t sub_10000FA78(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006164(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_10000FABC(void *a1)
{
  uint64_t v2 = v1;
  v1[2] = 0;
  v1[3] = 0;
  id v4 = [objc_allocWithZone((Class)MADownloadOptions) init];
  [v4 setAllowsCellularAccess:1];
  [v4 setRequiresPowerPluggedIn:1];
  [v4 setCanUseLocalCacheServer:1];
  if (qword_100049620 != -1) {
    swift_once();
  }
  [v4 setTimeoutIntervalForResource:qword_100049838];
  v2[4] = v4;
  v2[5] = 0xD000000000000024;
  v2[6] = 0x800000010003E580;
  v2[7] = 0xD000000000000028;
  v2[8] = 0x800000010003E5B0;
  static Logger.mobileAsset.getter();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "MobileAssetsHandler init", v7, 2u);
    swift_slowDealloc();
  }

  id v8 = [self sharedScheduler];
  swift_bridgeObjectRetain();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v13[4] = sub_1000130C8;
  v13[5] = v2;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10000FEE4;
  v13[3] = &unk_100045BE8;
  int64_t v10 = _Block_copy(v13);
  id v11 = a1;
  swift_retain();
  swift_release();
  [v8 registerForTaskWithIdentifier:v9 usingQueue:v11 launchHandler:v10];

  _Block_release(v10);
  return v2;
}

id sub_10000FD50(void *a1, uint64_t a2)
{
  swift_retain_n();
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 136380675;
    uint64_t v7 = *(void *)(a2 + 56);
    unint64_t v8 = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    sub_10002E344(v7, v8, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "ScheduledActivity { activity=%{private}s }", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  sub_100010950();
  return [a1 setTaskCompleted];
}

void sub_10000FEE4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

NSObject *sub_10000FF4C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v6 = objc_allocWithZone((Class)MAAssetQuery);
  swift_bridgeObjectRetain();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v8 = [v6 initWithType:v7];

  if (!v8)
  {
    unint64_t v8 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v12))
    {
      int64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v12, "Failed to create query", v13, 2u);
      swift_slowDealloc();
    }
    goto LABEL_20;
  }
  [v8 returnTypes:a1];
  [v8 setDoNotBlockBeforeFirstUnlock:1];
  if ([v8 queryMetaDataSync] == (id)5)
  {
    NSString v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v9, v10))
    {
LABEL_19:

LABEL_20:
      return 0;
    }
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Missing entitlement!", v11, 2u);
LABEL_17:
    swift_slowDealloc();
    goto LABEL_19;
  }
  id v14 = [v8 results];
  if (!v14)
  {
    swift_bridgeObjectRetain_n();
    NSString v9 = Logger.logObject.getter();
    LOBYTE(v19) = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, (os_log_type_t)v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)id v20 = 136380675;
      swift_bridgeObjectRetain();
      sub_10002E344(a2, a3, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      uint64_t v21 = "query.results is nil { errorNote=\"%{private}s\" }";
      goto LABEL_16;
    }
LABEL_18:
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }

  uint64_t result = [v8 results];
  if (result)
  {
    unint64_t v16 = result;
    sub_1000108B0();
    unint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v18) {
      return v8;
    }
    swift_bridgeObjectRetain_n();
    NSString v9 = Logger.logObject.getter();
    uint64_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, (os_log_type_t)v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)id v20 = 136380675;
      swift_bridgeObjectRetain();
      sub_10002E344(a2, a3, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      uint64_t v21 = "query.results.isEmpty! { errorNote=\"%{private}s\" }";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v9, (os_log_type_t)v19, v21, v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

Swift::String_optional __swiftcall MobileAssetsHandler.getMobileAssetsConfigPath()()
{
  uint64_t v0 = type metadata accessor for URL.DirectoryHint();
  unint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005E64(&qword_100049840);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  NSString v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  NSString v9 = (char *)&v41 - v8;
  uint64_t v10 = type metadata accessor for URL();
  p_ivar_lyt = *(void ***)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v41 - v15;
  unint64_t v17 = sub_10000FF4C(1, 0xD000000000000011, 0x800000010003E970);
  object = v17;
  if (!v17)
  {
    id countAndFlagsBits = 0;
    goto LABEL_26;
  }
  uint64_t v48 = v16;
  id countAndFlagsBits = [v17 results];

  if (!countAndFlagsBits)
  {
LABEL_25:
    object = 0;
    goto LABEL_26;
  }
  uint64_t v45 = v14;
  sub_1000108B0();
  unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v20 >> 62))
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  swift_bridgeObjectRetain();
  uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v21)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    id countAndFlagsBits = 0;
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v42 = v3;
  unint64_t v43 = v1;
  id v46 = p_ivar_lyt;
  uint64_t v47 = v10;
  uint64_t v44 = v0;
  unint64_t v1 = v20 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  uint64_t v10 = 4;
  p_ivar_lyt = &CLISignalHandler__classData.ivar_lyt;
  uint64_t v0 = (uint64_t)&CLISignalHandler__classData.ivar_lyt;
  while (1)
  {
    if (v1) {
      uint64_t v22 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      uint64_t v22 = (char *)*(id *)(v20 + 8 * v10);
    }
    uint64_t v3 = v22;
    uint64_t v23 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
    {
      __break(1u);
      goto LABEL_22;
    }
    if ([v22 wasLocal] && objc_msgSend(v3, "state") == (id)2) {
      break;
    }

    ++v10;
    if (v23 == v21)
    {
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v46[7])(v9, 1, 1, v47);
LABEL_19:
      sub_1000108F0((uint64_t)v9);
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease_n();
  id v24 = [v3 getLocalUrl];

  if (v24)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v25 = v46;
    uint64_t v26 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v46[7];
    Class v27 = v7;
    uint64_t v28 = 0;
  }
  else
  {
    unint64_t v25 = v46;
    uint64_t v26 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v46[7];
    Class v27 = v7;
    uint64_t v28 = 1;
  }
  uint64_t v29 = v47;
  v26(v27, v28, 1, v47);
  unint64_t v31 = v43;
  uint64_t v30 = v44;
  unint64_t v32 = v42;
  uint64_t v33 = v45;
  sub_100012DE4((uint64_t)v7, (uint64_t)v9);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v25[6])(v9, 1, v29) == 1) {
    goto LABEL_19;
  }
  uint64_t v34 = v48;
  ((void (*)(char *, char *, uint64_t))v25[4])(v48, v9, v29);
  type metadata accessor for Config();
  uint64_t v49 = static Config.distributedConfigName.getter();
  uint64_t v50 = v35;
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v32, enum case for URL.DirectoryHint.inferFromPath(_:), v30);
  sub_100012E4C();
  URL.appending<A>(component:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v30);
  swift_bridgeObjectRelease();
  Swift::String v36 = URL.path(percentEncoded:)(0);
  id countAndFlagsBits = (id)v36._countAndFlagsBits;
  object = v36._object;
  int v37 = (void (*)(char *, uint64_t))v25[1];
  v37(v33, v29);
  v37(v34, v29);
LABEL_26:
  uint64_t v38 = (uint64_t)countAndFlagsBits;
  uint64_t v39 = object;
  result.value._object = v39;
  result.value._id countAndFlagsBits = v38;
  return result;
}

unint64_t sub_1000108B0()
{
  unint64_t result = qword_100049848;
  if (!qword_100049848)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100049848);
  }
  return result;
}

uint64_t sub_1000108F0(uint64_t a1)
{
  uint64_t v2 = sub_100005E64(&qword_100049840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100010950()
{
  uint64_t v1 = v0;
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Updating assets.", v4, 2u);
    swift_slowDealloc();
  }

  swift_retain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v5, v6))
  {
    swift_release_n();
    goto LABEL_7;
  }
  NSString v7 = (uint8_t *)swift_slowAlloc();
  aBlock[0] = swift_slowAlloc();
  *(_DWORD *)NSString v7 = 136380675;
  id v8 = [*(id *)(v1 + 32) tightSummaryIncludingAdditional:1];
  if (v8)
  {
    NSString v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;

    sub_10002E344(v10, v12, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Options summary. { summary=%{private}s }", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_7:

    uint64_t v13 = self;
    NSString v14 = String._bridgeToObjectiveC()();
    uint64_t v15 = *(void *)(v1 + 32);
    aBlock[4] = (uint64_t)sub_100012FB8;
    aBlock[5] = v1;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_100012BE4;
    aBlock[3] = (uint64_t)&unk_100045B20;
    unint64_t v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v13 startCatalogDownload:v14 options:v15 then:v16];
    _Block_release(v16);

    return;
  }
  swift_release();
  __break(1u);
}

void sub_100010C20(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  v137 = (char *)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v147 = (char *)&v132 - v8;
  uint64_t v9 = sub_100005E64(&qword_100049840);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  v138 = (char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  v134 = (char *)&v132 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v133 = (char *)&v132 - v15;
  __chkstk_darwin(v14);
  v141 = (char *)&v132 - v16;
  unint64_t v17 = (char *)a2 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  v148 = v17;
  v149 = (void (**)(char *, char *, void))v4;
  if (v20)
  {
    uint64_t v21 = a1;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v158 = v21;
    aBlock = (_DWORD *)v23;
    *(_DWORD *)uint64_t v22 = 136380675;
    type metadata accessor for MADownloadResult(0);
    uint64_t v24 = String.init<A>(describing:)();
    uint64_t v158 = sub_10002E344(v24, v25, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v4 = (uint64_t)v149;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Got the download metadata { reply=%{private}s }", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v26 = a2;
  Class v27 = sub_10000FF4C(4, 0xD00000000000001CLL, 0x800000010003EA20);
  if (!v27) {
    return;
  }
  uint64_t v28 = v27;
  id v29 = [v27 results];
  if (!v29) {
    goto LABEL_71;
  }
  uint64_t v30 = v29;
  sub_1000108B0();
  unint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v132 = v28;
  if (v31 >> 62)
  {
LABEL_56:
    swift_bridgeObjectRetain();
    uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v33) {
      goto LABEL_7;
    }
LABEL_57:

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v33 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v33) {
    goto LABEL_57;
  }
LABEL_7:
  unint64_t v153 = v31 & 0xC000000000000001;
  p_aBlock = (uint64_t *)&aBlock;
  uint64_t v34 = (void (**)(char *, char *, void))(v5 + 32);
  v146 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v145 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v143 = (void (**)(char *, uint64_t))(v5 + 8);
  v135 = &v161;
  uint64_t v5 = 4;
  *(void *)&long long v32 = 136381187;
  long long v142 = v32;
  v140 = (char *)&type metadata for Any + 8;
  *(void *)&long long v32 = 136380675;
  long long v139 = v32;
  *(void *)&long long v32 = 136380931;
  long long v136 = v32;
  v150 = v26;
  unint64_t v144 = v31;
  v154 = v34;
  uint64_t v152 = v33;
  while (1)
  {
    uint64_t v37 = v5 - 4;
    if (v153)
    {
      id v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v39 = v5 - 3;
      if (__OFADD__(v37, 1)) {
        goto LABEL_55;
      }
    }
    else
    {
      id v38 = *(id *)(v31 + 8 * v5);
      uint64_t v39 = v5 - 3;
      if (__OFADD__(v37, 1))
      {
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
    }
    uint64_t v156 = v5;
    uint64_t v157 = v39;
    uint64_t v40 = v38;
    uint64_t v41 = Logger.logObject.getter();
    int v42 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v41, (os_log_type_t)v42))
    {

      goto LABEL_24;
    }
    LODWORD(v151) = v42;
    uint64_t v43 = swift_slowAlloc();
    uint64_t v44 = (_DWORD *)swift_slowAlloc();
    aBlock = v44;
    *(_DWORD *)uint64_t v43 = v142;
    id v45 = [v40 assetType:v132];
    if (!v45) {
      break;
    }
    id v46 = v45;
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v49 = v48;

    uint64_t v158 = sub_10002E344(v47, v49, (uint64_t *)&aBlock);
    uint64_t v34 = (void (**)(char *, char *, void))p_aBlock;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    uint64_t v4 = 2081;
    *(_WORD *)(v43 + 12) = 2081;
    id v50 = [v40 assetId];
    if (!v50) {
      goto LABEL_60;
    }
    uint64_t v51 = v50;
    uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v54 = v53;

    uint64_t v158 = sub_10002E344(v52, v54, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 22) = 2081;
    id v55 = [v40 assetServerUrl];
    if (!v55) {
      goto LABEL_61;
    }
    uint64_t v56 = v55;
    uint64_t v57 = v147;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v34 = v154;
    int v58 = v141;
    uint64_t v4 = (uint64_t)v149;
    (*v154)(v141, v57, v149);
    (*v146)(v58, 0, 1, v4);
    if ((*v145)(v58, 1, v4) == 1) {
      goto LABEL_62;
    }
    uint64_t v59 = URL.absoluteString.getter();
    unint64_t v61 = v60;
    (*v143)(v58, v4);
    uint64_t v158 = sub_10002E344(v59, v61, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v151, "Found asset to download. { assetType=%{private}s, assetId=%{private}s, url=%{private}s }", (uint8_t *)v43, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v26 = v150;
    unint64_t v31 = v144;
LABEL_24:
    static Double.now()();
    uint64_t v63 = v62;
    id v64 = [v40 state];
    if (v64 == (id)4)
    {
      swift_retain_n();
      v88 = Logger.logObject.getter();
      os_log_type_t v89 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v88, v89))
      {
        uint64_t v90 = swift_slowAlloc();
        aBlock = (_DWORD *)swift_slowAlloc();
        *(_DWORD *)uint64_t v90 = v139;
        unint64_t v91 = v31;
        uint64_t v93 = v26[5];
        unint64_t v92 = v26[6];
        swift_bridgeObjectRetain();
        uint64_t v94 = v93;
        unint64_t v31 = v91;
        *(void *)(v90 + 4) = sub_10002E344(v94, v92, (uint64_t *)&aBlock);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v88, v89, "Downloading { assetType=%{private}s }", (uint8_t *)v90, 0xCu);
        swift_arrayDestroy();
        uint64_t v34 = v154;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }

      goto LABEL_10;
    }
    if (v64 == (id)2)
    {
      uint64_t v44 = v40;
      v95 = Logger.logObject.getter();
      int v96 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v95, (os_log_type_t)v96))
      {
        LODWORD(v151) = v96;
        uint64_t v40 = (_DWORD *)swift_slowAlloc();
        aBlock = (_DWORD *)swift_slowAlloc();
        _DWORD *v40 = v139;
        id v97 = [v44 getLocalUrl];
        if (!v97) {
          goto LABEL_63;
        }
        v98 = v97;
        v99 = v147;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        v100 = *v34;
        v101 = v138;
        (*v34)(v138, v99, v4);
        (*v146)(v101, 0, 1, v4);
        if ((*v145)(v101, 1, v4) == 1) {
          goto LABEL_64;
        }
        v102 = v137;
        v100(v137, v101, v4);
        sub_100012FD8();
        uint64_t v103 = dispatch thunk of CustomStringConvertible.description.getter();
        unint64_t v105 = v104;
        (*v143)(v102, v4);
        *(void *)(v40 + 1) = sub_10002E344(v103, v105, (uint64_t *)&aBlock);

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v95, (os_log_type_t)v151, "Installed { assetType=%{private}s }", (uint8_t *)v40, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        unint64_t v31 = v144;
      }
      else
      {
      }
      uint64_t v35 = v152;
      uint64_t v36 = v156;
      uint64_t v26 = v150;
    }
    else
    {
      if (v64 != (id)1)
      {
        swift_retain_n();
        v106 = v40;
        v107 = Logger.logObject.getter();
        os_log_type_t v108 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v107, v108))
        {
          uint64_t v109 = swift_slowAlloc();
          aBlock = (_DWORD *)swift_slowAlloc();
          *(_DWORD *)uint64_t v109 = v136;
          unint64_t v110 = v31;
          v111 = v26;
          uint64_t v112 = v26[5];
          unint64_t v113 = v111[6];
          swift_bridgeObjectRetain();
          uint64_t v114 = v112;
          uint64_t v26 = v111;
          unint64_t v31 = v110;
          *(void *)(v109 + 4) = sub_10002E344(v114, v113, (uint64_t *)&aBlock);
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v109 + 12) = 2049;
          *(void *)(v109 + 14) = [v106 state];

          _os_log_impl((void *)&_mh_execute_header, v107, v108, "Unknown asset state { assetType=%{private}s, state=%{private}ld }", (uint8_t *)v109, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v4 = (uint64_t)v149;
          uint64_t v34 = v154;
          swift_slowDealloc();
        }
        else
        {
          swift_release_n();
        }
LABEL_10:
        uint64_t v35 = v152;
        uint64_t v36 = v156;
        goto LABEL_11;
      }
      unsigned int v65 = [v40 nonUserInitiatedDownloadsAllowed];
      uint64_t v66 = v40;
      uint64_t v44 = v66;
      if (v65)
      {
        uint64_t v40 = v66;
        int v67 = Logger.logObject.getter();
        os_log_type_t v68 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v67, v68))
        {
          os_log_t v151 = v67;
          uint64_t v69 = swift_slowAlloc();
          uint64_t v44 = (_DWORD *)swift_slowAlloc();
          aBlock = v44;
          *(_DWORD *)uint64_t v69 = v142;
          id v70 = [v40 assetType];
          if (!v70) {
            goto LABEL_65;
          }
          uint64_t v71 = v70;
          uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v74 = v73;

          uint64_t v158 = sub_10002E344(v72, v74, (uint64_t *)&aBlock);
          uint64_t v34 = (void (**)(char *, char *, void))p_aBlock;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          *(_WORD *)(v69 + 12) = 2081;
          id v75 = [v40 assetId];
          if (!v75) {
            goto LABEL_66;
          }
          uint64_t v76 = v75;
          uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v79 = v78;

          uint64_t v158 = sub_10002E344(v77, v79, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          *(_WORD *)(v69 + 22) = 2081;
          id v80 = [v40 assetServerUrl];
          if (!v80) {
            goto LABEL_67;
          }
          v81 = v80;
          uint64_t v82 = v147;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          unsigned int v83 = v133;
          uint64_t v34 = v149;
          (*v154)(v133, v82, v149);
          (*v146)(v83, 0, 1, (uint64_t)v34);
          if ((*v145)(v83, 1, (uint64_t)v34) == 1) {
            goto LABEL_68;
          }
          uint64_t v84 = URL.absoluteString.getter();
          unint64_t v86 = v85;
          (*v143)(v83, (uint64_t)v34);
          uint64_t v158 = sub_10002E344(v84, v86, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          os_log_t v87 = v151;
          _os_log_impl((void *)&_mh_execute_header, v151, v68, "Downloading asset. { assetType=%{private}s, assetId=%{private}s, url=%{private}s }", (uint8_t *)v69, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v26 = v150;
          unint64_t v31 = v144;
        }
        else
        {
        }
        v125 = (void *)swift_allocObject();
        v125[2] = v26;
        v125[3] = v63;
        v125[4] = v40;
        v163 = sub_100013070;
        v164 = v125;
        aBlock = _NSConcreteStackBlock;
        uint64_t v160 = 1107296256;
        v161 = sub_100012594;
        v162 = &unk_100045B70;
        v126 = _Block_copy(&aBlock);
        v127 = v40;
        swift_retain();
        swift_release();
        [v127 attachProgressCallBack:v126];
        _Block_release(v126);
        uint64_t v128 = v26[4];
        uint64_t v129 = swift_allocObject();
        *(void *)(v129 + 16) = v127;
        *(void *)(v129 + 24) = v26;
        v163 = sub_1000130C0;
        v164 = (void *)v129;
        aBlock = _NSConcreteStackBlock;
        uint64_t v160 = 1107296256;
        v161 = sub_100012BE4;
        v162 = &unk_100045BC0;
        v130 = _Block_copy(&aBlock);
        v131 = v127;
        swift_retain();
        swift_release();
        [v131 startDownload:v128 then:v130];

        _Block_release(v130);
        uint64_t v35 = v152;
        uint64_t v36 = v156;
        uint64_t v4 = (uint64_t)v149;
      }
      else
      {
        uint64_t v34 = (void (**)(char *, char *, void))v4;
        v115 = Logger.logObject.getter();
        os_log_type_t v116 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v115, v116))
        {
          uint64_t v117 = swift_slowAlloc();
          aBlock = (_DWORD *)swift_slowAlloc();
          *(_DWORD *)uint64_t v117 = v139;
          id v118 = [v44 assetServerUrl];
          if (!v118) {
            goto LABEL_69;
          }
          v119 = v118;
          v120 = v147;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          v121 = v134;
          (*v154)(v134, v120, v34);
          (*v146)(v121, 0, 1, (uint64_t)v34);
          if ((*v145)(v121, 1, (uint64_t)v34) == 1) {
            goto LABEL_70;
          }
          uint64_t v122 = URL.absoluteString.getter();
          unint64_t v124 = v123;
          (*v143)(v121, (uint64_t)v34);
          *(void *)(v117 + 4) = sub_10002E344(v122, v124, (uint64_t *)&aBlock);

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v115, v116, "Cannot download asset, as nonUserInitiatedDownloadsAllowed is false. { url=%{private}s }", (uint8_t *)v117, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          unint64_t v31 = v144;
        }
        else
        {
        }
        uint64_t v35 = v152;
        uint64_t v36 = v156;
        uint64_t v4 = (uint64_t)v34;
        uint64_t v26 = v150;
      }
      uint64_t v34 = v154;
    }
LABEL_11:
    uint64_t v5 = v36 + 1;
    if (v157 == v35) {
      goto LABEL_57;
    }
  }

  __break(1u);
LABEL_60:

  __break(1u);
LABEL_61:

  (*v146)(v141, 1, 1, (uint64_t)v149);
  __break(1u);
LABEL_62:

  __break(1u);
LABEL_63:

  (*v146)(v138, 1, 1, v4);
  __break(1u);
LABEL_64:

  __break(1u);
LABEL_65:

  __break(1u);
LABEL_66:

  __break(1u);
LABEL_67:

  (*v146)(v133, 1, 1, (uint64_t)v149);
  __break(1u);
LABEL_68:

  __break(1u);
LABEL_69:

  (*v146)(v134, 1, 1, (uint64_t)v34);
  __break(1u);
LABEL_70:

  __break(1u);
LABEL_71:
  __break(1u);
}

void sub_100012044(void *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E64(&qword_100049840);
  __chkstk_darwin();
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    unint64_t v31 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v31, v26))
    {
      Class v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Class v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v26, "Progress callback, but nil update object.", v27, 2u);
      swift_slowDealloc();
    }
    goto LABEL_13;
  }
  unint64_t v31 = a1;
  id v13 = a4;
  uint64_t v14 = Logger.logObject.getter();
  int v15 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v14, (os_log_type_t)v15))
  {

LABEL_13:
    uint64_t v28 = v31;

    return;
  }
  uint64_t v16 = swift_slowAlloc();
  uint64_t v17 = swift_slowAlloc();
  uint64_t v33 = v17;
  *(_DWORD *)uint64_t v16 = 134219011;
  static Double.now()();
  double v19 = v18 - a2;
  if ((~*(void *)&v19 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v19 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v19 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v29[1] = v17;
  int v30 = v15;
  id v32 = (id)(uint64_t)v19;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  LOWORD(v17) = 2048;
  *(_WORD *)(v16 + 12) = 2048;
  if (qword_100049620 != -1) {
LABEL_19:
  }
    swift_once();
  id v32 = (id)qword_100049838;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v16 + 22) = v17;
  id v32 = [v31 totalWritten];
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v16 + 32) = v17;
  id v20 = [v31 totalExpected];

  id v32 = v20;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  *(_WORD *)(v16 + 42) = 2081;
  id v21 = [v13 assetServerUrl];
  if (v21)
  {
    uint64_t v22 = v21;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v12, v10, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7) != 1)
    {
      uint64_t v23 = URL.absoluteString.getter();
      unint64_t v25 = v24;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
      id v32 = (id)sub_10002E344(v23, v25, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v30, "Progress callback. { runningTime=%ld, timeout=%ld, totalWritten=%lld, totalExpected=%lld, url=%{private}s }", (uint8_t *)v16, 0x34u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v12, 1, 1, v7);
    __break(1u);
  }

  __break(1u);
}

void sub_100012594(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100012600(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000129B0(a2);
  unint64_t v12 = v11;
  if (a1)
  {
    static Logger.mobileAsset.getter();
    swift_bridgeObjectRetain();
    id v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v26 = v24;
      *(_DWORD *)uint64_t v15 = 136380931;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_10002E344(v10, v12, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2081;
      uint64_t v25 = a1;
      type metadata accessor for MADownloadResult(0);
      uint64_t v16 = String.init<A>(describing:)();
      uint64_t v25 = sub_10002E344(v16, v17, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Download failed. { url=%{private}s, result=%{private}s }", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    swift_bridgeObjectRetain();
    double v18 = Logger.logObject.getter();
    uint64_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)id v20 = 136380675;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_10002E344(v10, v12, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v19, "Downloaded asset. Calling downloadedCallback. { url=%{private}s }", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v21 = *(void (**)(uint64_t))(a3 + 16);
    if (v21)
    {
      uint64_t v22 = swift_retain();
      v21(v22);
      sub_100012EA0((uint64_t)v21);
    }
  }
}

uint64_t sub_1000129B0(void *a1)
{
  sub_100005E64(&qword_100049840);
  ((void (*)(void))__chkstk_darwin)();
  os_log_type_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  id v11 = [a1 assetServerUrl];
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_5;
  }
  unint64_t v12 = v11;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_5:
    sub_1000108F0((uint64_t)v3);
    return 560753006;
  }
  v13(v10, v3, v4);
  uint64_t v14 = URL.absoluteString.getter();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v14;
}

uint64_t sub_100012BE4(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_100012C38()
{
  uint64_t result = static Double.minutes(_:)();
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18)
  {
    qword_100049838 = (uint64_t)v1;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t MobileAssetsHandler.deinit()
{
  sub_100012EA0(*(void *)(v0 + 16));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t MobileAssetsHandler.__deallocating_deinit()
{
  sub_100012EA0(*(void *)(v0 + 16));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100012DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E64(&qword_100049840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100012E4C()
{
  unint64_t result = qword_100049850;
  if (!qword_100049850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100049850);
  }
  return result;
}

uint64_t sub_100012EA0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100012EB0()
{
  return type metadata accessor for MobileAssetsHandler();
}

uint64_t type metadata accessor for MobileAssetsHandler()
{
  uint64_t result = qword_100049888;
  if (!qword_100049888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012F04()
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

void sub_100012FB8(uint64_t a1)
{
  sub_100010C20(a1, v1);
}

uint64_t sub_100012FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012FD0()
{
  return swift_release();
}

unint64_t sub_100012FD8()
{
  unint64_t result = qword_100049960;
  if (!qword_100049960)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100049960);
  }
  return result;
}

uint64_t sub_100013030()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100013070(void *a1)
{
  sub_100012044(a1, *(double *)(v1 + 24), *(void *)(v1 + 16), *(void **)(v1 + 32));
}

uint64_t sub_100013080()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000130C0(uint64_t a1)
{
  sub_100012600(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

id sub_1000130C8(void *a1)
{
  return sub_10000FD50(a1, v1);
}

uint64_t sub_1000130E8()
{
  uint64_t v1 = sub_100005E64(&qword_100049A80);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Keys();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
    sub_100005694((uint64_t)_swiftEmptyArrayStorage);
  }
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Keys.applicationName(_:), v4);
  Dictionary<>.subscript.getter();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = type metadata accessor for SimpleType();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v3, 1, v8) == 1)
  {
    sub_100013708((uint64_t)v3);
LABEL_9:
    uint64_t v10 = *(void *)(v0 + 16);
    swift_bridgeObjectRetain();
    return v10;
  }
  if ((*(unsigned int (**)(char *, uint64_t))(v9 + 88))(v3, v8) != enum case for SimpleType.string(_:))
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v3, v8);
    goto LABEL_9;
  }
  (*(void (**)(char *, uint64_t))(v9 + 96))(v3, v8);
  return *(void *)v3;
}

uint64_t sub_100013370()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_weakDestroy();

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for NonOwningSession()
{
  return self;
}

uint64_t sub_1000133DC()
{
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return 0xFFFFLL;
  }
  uint64_t v1 = *(unsigned __int16 *)(Strong + 64);
  swift_release();
  return v1;
}

uint64_t sub_10001341C(__int16 a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    sub_10002D6DC();
    *(_WORD *)(v3 + 64) = a1;
    return swift_release();
  }
  return result;
}

uint64_t (*sub_10001347C(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = *v1;
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    __int16 v4 = *(_WORD *)(Strong + 64);
    swift_release();
  }
  else
  {
    __int16 v4 = -1;
  }
  *(_WORD *)(a1 + 8) = v4;
  return sub_1000134EC;
}

uint64_t sub_1000134EC(uint64_t a1)
{
  __int16 v1 = *(_WORD *)(a1 + 8);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    sub_10002D6DC();
    *(_WORD *)(v3 + 64) = v1;
    return swift_release();
  }
  return result;
}

uint64_t sub_10001354C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100013580()
{
  return *(void *)(*(void *)v0 + 32);
}

uint64_t sub_10001358C()
{
  return *(unsigned __int8 *)(*(void *)v0 + 40);
}

uint64_t sub_100013598()
{
  return sub_1000130E8();
}

unint64_t sub_1000135BC()
{
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    swift_beginAccess();
    uint64_t v2 = *(void *)(v1 + 72);
    swift_bridgeObjectRetain();
    swift_release();
    return v2;
  }
  else
  {
    return sub_100005694((uint64_t)_swiftEmptyArrayStorage);
  }
}

uint64_t sub_100013648()
{
  return *(unsigned int *)(*(void *)v0 + 44);
}

uint64_t sub_100013654()
{
  return swift_retain();
}

uint64_t sub_100013660(unint64_t a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    char v3 = sub_1000273DC(a1);
    swift_release();
    return v3 & 1;
  }
  return result;
}

uint64_t sub_1000136AC(uint64_t a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000283B0(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_100013708(uint64_t a1)
{
  uint64_t v2 = sub_100005E64(&qword_100049A80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100013768(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005E64(&qword_100049A98);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v34 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v33 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v38;
  uint64_t v7 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = (char *)&type metadata for Any + 8;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v33) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v33) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v33) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v34 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v33) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v34 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v33)
          {
            unint64_t v21 = *(void *)(v34 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v33) {
                break;
              }
              unint64_t v21 = *(void *)(v34 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_10000F9A4();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = v18 | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v25 = *(void **)(*(void *)(v1 + 56) + 8 * v19);
    uint64_t v36 = *v24;
    uint64_t v37 = v24[1];
    sub_100015484();
    swift_bridgeObjectRetain();
    id v26 = v25;
    swift_dynamicCast();
    sub_100015424(v6, v7);
    sub_100015424(v7, v41);
    sub_100015424(v41, &v39);
    unint64_t result = sub_100022EA0(v36, v37);
    unint64_t v27 = result;
    if (v28)
    {
      unint64_t v35 = v5;
      id v11 = v7;
      uint64_t v12 = v6;
      uint64_t v13 = v1;
      int64_t v14 = i;
      uint64_t v15 = v10;
      uint64_t v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v16 = v36;
      v16[1] = v37;
      uint64_t v10 = v15;
      int64_t i = v14;
      uint64_t v1 = v13;
      uint64_t v6 = v12;
      uint64_t v7 = v11;
      unint64_t v5 = v35;
      unint64_t v17 = (_OWORD *)(v2[7] + 32 * v27);
      sub_100015434((uint64_t)v17);
      unint64_t result = (unint64_t)sub_100015424(&v39, v17);
      if (!v35) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v29 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v29 = v36;
    v29[1] = v37;
    unint64_t result = (unint64_t)sub_100015424(&v39, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v30 = v2[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_34;
    }
    v2[2] = v32;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v18 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100013AC0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005E64(&qword_100049A90);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
    unint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1000153C8(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100015424(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100015424(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100015424(v36, v37);
    sub_100015424(v37, &v33);
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
    uint64_t result = (uint64_t)sub_100015424(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_10000F9A4();
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

unint64_t sub_100013E88(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005E64(&qword_100049A98);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = (char *)&type metadata for Any + 8;
  unint64_t v11 = &type metadata for String;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_10000F9A4();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    unint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100015424(v6, v7);
    sub_100015424(v7, v40);
    sub_100015424(v40, &v38);
    unint64_t result = sub_100022EA0(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      unint64_t v12 = v7;
      int64_t v13 = v6;
      uint64_t v14 = v1;
      int64_t v15 = v11;
      int64_t v16 = v10;
      unint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *unint64_t v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      unint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_100015434((uint64_t)v18);
      unint64_t result = (unint64_t)sub_100015424(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *int64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_100015424(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void sub_1000141F4()
{
  qword_10004A390 = (uint64_t)&_swiftEmptySetSingleton;
  word_10004A398 = 0;
}

uint64_t static MessageRuleResult.__derived_struct_equals(_:_:)(uint64_t a1, __int16 a2, uint64_t a3, int a4)
{
  return sub_100014264(a1, a3) & (((a2 & 1) == 0) ^ a4) & (((a2 & 0x100) == 0) ^ ((unsigned __int16)(a4 & 0x100) >> 8));
}

uint64_t sub_100014264(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Config.WorkerConfigs();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  int64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  id v45 = (char *)&v34 - v10;
  uint64_t result = __chkstk_darwin(v9);
  int64_t v13 = (char *)&v34 - v12;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v14 = 0;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v36 = a1;
  uint64_t v37 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  int64_t v38 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v42 = v5 + 32;
  uint64_t v43 = a2 + 56;
  uint64_t v44 = v5 + 16;
  unint64_t v19 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v34 = v13;
  uint64_t v35 = v5;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v40 = (v18 - 1) & v18;
  int64_t v41 = v14;
  for (unint64_t i = __clz(__rbit64(v18)) | (v14 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v23 << 6))
  {
    uint64_t v25 = *(void *)(v5 + 72);
    char v26 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v26(v13, *(void *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v45, v13, v4);
    sub_1000154C4(&qword_100049AA8);
    uint64_t v27 = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v28 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v29 = v27 & ~v28;
    if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
    {
      (*v19)(v45, v4);
      return 0;
    }
    uint64_t v39 = (unint64_t)v19 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v30 = a2;
    uint64_t v31 = ~v28;
    while (1)
    {
      v26(v8, *(void *)(v30 + 48) + v29 * v25, v4);
      sub_1000154C4((unint64_t *)&unk_100049AB0);
      char v32 = dispatch thunk of static Equatable.== infix(_:_:)();
      int64_t v33 = *v19;
      (*v19)(v8, v4);
      if (v32) {
        break;
      }
      unint64_t v29 = (v29 + 1) & v31;
      if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        v33(v45, v4);
        return 0;
      }
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v45, v4);
    a2 = v30;
    uint64_t v5 = v35;
    a1 = v36;
    int64_t v13 = v34;
    unint64_t v18 = v40;
    int64_t v14 = v41;
    if (v40) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v21);
    int64_t v23 = v14 + 1;
    if (!v22)
    {
      int64_t v23 = v14 + 2;
      if (v14 + 2 >= v38) {
        return 1;
      }
      unint64_t v22 = *(void *)(v37 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = v14 + 3;
        if (v14 + 3 >= v38) {
          return 1;
        }
        unint64_t v22 = *(void *)(v37 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v14 + 4;
          if (v14 + 4 >= v38) {
            return 1;
          }
          unint64_t v22 = *(void *)(v37 + 8 * v23);
          if (!v22) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v40 = (v22 - 1) & v22;
    int64_t v41 = v23;
  }
  uint64_t v24 = v14 + 5;
  if (v14 + 5 >= v38) {
    return 1;
  }
  unint64_t v22 = *(void *)(v37 + 8 * v24);
  if (v22)
  {
    int64_t v23 = v14 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v23 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v23 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v23);
    ++v24;
    if (v22) {
      goto LABEL_24;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_100014680(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 9);
  int v4 = *(unsigned __int8 *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 9);
  return sub_100014264(*(void *)a1, *(void *)a2) & ~(v2 ^ v4) & ~(v3 ^ v5) & 1;
}

uint64_t destroy for MessageRuleResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s15audioanalyticsd17MessageRuleResultVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MessageRuleResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t initializeWithTake for MessageRuleResult(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for MessageRuleResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageRuleResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 10)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageRuleResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 10) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 10) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageRuleResult()
{
  return &type metadata for MessageRuleResult;
}

uint64_t sub_10001486C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v64 = a4;
  uint64_t v58 = type metadata accessor for Message.Metadata();
  uint64_t v6 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v57 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = type metadata accessor for Message();
  uint64_t v8 = *(void *)(v63 - 8);
  uint64_t v9 = __chkstk_darwin(v63);
  unint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v77 = (char *)&v55 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v55 - v14;
  uint64_t v16 = type metadata accessor for RouterConfig();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v62 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  int64_t v21 = (char *)&v55 - v20;
  uint64_t v22 = Config.routerConfigs.getter();
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    uint64_t v25 = *(void (**)(char *))(v17 + 16);
    uint64_t v24 = v17 + 16;
    v81 = v25;
    unint64_t v26 = (*(unsigned __int8 *)(v24 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 64);
    uint64_t v55 = v22;
    unint64_t v27 = v22 + v26;
    unint64_t v79 = (void (**)(char *, uint64_t))(v8 + 8);
    id v80 = (void (**)(char *, uint64_t))(v8 + 16);
    uint64_t v76 = (void (**)(char *, uint64_t))(v24 - 8);
    uint64_t v56 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v59 = *(void *)(v24 + 56);
    long long v78 = xmmword_10003D870;
    uint64_t v74 = a2;
    unint64_t v61 = v11;
    unint64_t v60 = v15;
    uint64_t v75 = v24;
    while (1)
    {
      uint64_t v70 = v23;
      unint64_t v69 = v27;
      v81(v21);
      sub_1000152B8(a3, (uint64_t)&v84);
      if (v85)
      {
        sub_100015384(&v84, v85);
        dispatch thunk of SessionProtocol.serviceType.getter();
        sub_100015434((uint64_t)&v84);
      }
      else
      {
        sub_10000F9B0((uint64_t)&v84);
      }
      sub_100005E64(&qword_100049A88);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = v78;
      *(void *)(v28 + 56) = v16;
      *(void *)(v28 + 64) = &protocol witness table for RouterConfig;
      unint64_t v29 = sub_100015320((uint64_t *)(v28 + 32));
      ((void (*)(uint64_t *, char *, uint64_t))v81)(v29, v21, v16);
      int v73 = static ConfigCommon.matches(audioServiceType:config:)();
      swift_bridgeObjectRelease();
      sub_1000152B8(a3, (uint64_t)&v84);
      if (v85)
      {
        sub_100015384(&v84, v85);
        dispatch thunk of SessionProtocol.clientProcessName.getter();
        sub_100015434((uint64_t)&v84);
      }
      else
      {
        sub_10000F9B0((uint64_t)&v84);
      }
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = v78;
      *(void *)(v30 + 56) = v16;
      *(void *)(v30 + 64) = &protocol witness table for RouterConfig;
      uint64_t v31 = sub_100015320((uint64_t *)(v30 + 32));
      ((void (*)(uint64_t *, char *, uint64_t))v81)(v31, v21, v16);
      int v66 = static ConfigCommon.matches(sessionProcessName:config:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000152B8(a3, (uint64_t)&v84);
      if (v85)
      {
        sub_100015384(&v84, v85);
        dispatch thunk of SessionProtocol.appName.getter();
        sub_100015434((uint64_t)&v84);
      }
      else
      {
        sub_10000F9B0((uint64_t)&v84);
      }
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = v78;
      *(void *)(v32 + 56) = v16;
      *(void *)(v32 + 64) = &protocol witness table for RouterConfig;
      int64_t v33 = sub_100015320((uint64_t *)(v32 + 32));
      ((void (*)(uint64_t *, char *, uint64_t))v81)(v33, v21, v16);
      int v65 = static ConfigCommon.matches(sessionAppName:config:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v34 = RouterConfig.audioEventType.getter();
      uint64_t v35 = *v80;
      uint64_t v36 = v63;
      (*v80)(v15, a2);
      if ((v34 & 0x10000) != 0) {
        int v34 = Message.type.getter();
      }
      int v72 = v34;
      uint64_t v37 = a3;
      int64_t v38 = *v79;
      (*v79)(v15, v36);
      int v71 = Message.type.getter();
      uint64_t v39 = RouterConfig.audioEventCategory.getter();
      uint64_t v40 = v77;
      ((void (*)(char *, uint64_t, uint64_t))v35)(v77, a2, v36);
      if ((v39 & 0x100000000) != 0)
      {
        int v41 = Message.category.getter();
        uint64_t v40 = v77;
        LODWORD(v39) = v41;
      }
      v38(v40, v36);
      int v68 = Message.category.getter();
      uint64_t v42 = RouterConfig.predicate.getter();
      if (v42)
      {
        uint64_t v43 = (void *)v42;
        uint64_t v44 = Message.flattenToAnyDictionary()();
        sub_100013AC0(v44);
        swift_bridgeObjectRelease();
        int v67 = static Predicate.evaluate(_:with:)();

        swift_bridgeObjectRelease();
      }
      else
      {
        int v67 = 1;
      }
      a3 = v37;
      sub_1000152B8(v37, (uint64_t)&v84);
      if (v64) {
        break;
      }
      sub_1000152B8((uint64_t)&v84, (uint64_t)v82);
      if (v83)
      {
        sub_100015384(v82, v83);
        char v46 = dispatch thunk of SessionProtocol.isSingleMessageSession.getter();
        sub_10000F9B0((uint64_t)&v84);
        sub_100015434((uint64_t)v82);
        uint64_t v47 = v62;
        ((void (*)(char *, char *, uint64_t))v81)(v62, v21, v16);
        a3 = v37;
        id v45 = v47;
        if (v46) {
          goto LABEL_24;
        }
        char v48 = 0;
      }
      else
      {
        sub_10000F9B0((uint64_t)&v84);
        sub_10000F9B0((uint64_t)v82);
        unint64_t v49 = v62;
        ((void (*)(char *, char *, uint64_t))v81)(v62, v21, v16);
        char v48 = 0;
        a3 = v37;
        id v45 = v49;
      }
LABEL_27:
      id v50 = *v76;
      (*v76)(v45, v16);
      uint64_t v51 = v61;
      ((void (*)(char *, uint64_t, uint64_t))v35)(v61, v74, v36);
      if (v48)
      {
        uint64_t v52 = v57;
        Message.metadata.getter();
        Message.Metadata.isBroadcast.getter();
        (*v56)(v52, v58);
        v38(v51, v36);
        if ((v73 & 1) != 0
          && (unsigned __int16)v72 == (unsigned __int16)v71
          && v39 == v68
          && ((v67 ^ 1) & 1) == 0
          && ((v66 ^ 1) & 1) == 0
          && ((v65 ^ 1) & 1) == 0)
        {
          goto LABEL_41;
        }
      }
      else
      {
        v38(v51, v36);
        if ((v73 & 1) != 0
          && (unsigned __int16)v72 == (unsigned __int16)v71
          && v39 == v68
          && ((v67 ^ 1) & 1) == 0
          && ((v66 ^ 1) & 1) == 0
          && ((v65 ^ 1) & 1) == 0)
        {
LABEL_41:
          swift_bridgeObjectRelease();
          uint64_t v53 = RouterConfig.workers.getter();
          RouterConfig.discard.getter();
          v50(v21, v16);
          return v53;
        }
      }
      v50(v21, v16);
      unint64_t v27 = v69 + v59;
      uint64_t v23 = v70 - 1;
      a2 = v74;
      uint64_t v15 = v60;
      if (v70 == 1) {
        goto LABEL_42;
      }
    }
    sub_10000F9B0((uint64_t)&v84);
    id v45 = v62;
    ((void (*)(char *, char *, uint64_t))v81)(v62, v21, v16);
LABEL_24:
    char v48 = RouterConfig.broadcast.getter();
    goto LABEL_27;
  }
LABEL_42:
  swift_bridgeObjectRelease();
  if (qword_100049628 != -1) {
    swift_once();
  }
  uint64_t v53 = qword_10004A390;
  swift_bridgeObjectRetain();
  return v53;
}

uint64_t sub_1000152B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E64(&qword_100049818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100015320(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *sub_100015384(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000153C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100015424(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100015434(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100015484()
{
  unint64_t result = qword_100049AA0;
  if (!qword_100049AA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100049AA0);
  }
  return result;
}

uint64_t sub_1000154C4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Config.WorkerConfigs();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100015508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100022F84(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a2 + 56);
    uint64_t v9 = type metadata accessor for FeatureState(0);
    uint64_t v16 = *(void *)(v9 - 8);
    sub_1000219D4(v8 + *(void *)(v16 + 72) * v7, a3, type metadata accessor for FeatureState);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    uint64_t v11 = a3;
    uint64_t v12 = 0;
    uint64_t v13 = v9;
  }
  else
  {
    uint64_t v14 = type metadata accessor for FeatureState(0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    uint64_t v13 = v14;
    uint64_t v11 = a3;
    uint64_t v12 = 1;
  }

  return v10(v11, v12, 1, v13);
}

uint64_t sub_100015630(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v3 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v3 = *(void *)(a1 + 16);
  }
  uint64_t result = (uint64_t)&_swiftEmptyArrayStorage;
  if (v3)
  {
    uint64_t v25 = &_swiftEmptyArrayStorage;
    sub_10002F2C0(0, v3 & ~(v3 >> 63), 0);
    if (v2)
    {
      uint64_t result = __CocoaSet.startIndex.getter();
      char v6 = 1;
    }
    else
    {
      uint64_t result = sub_10001FD60(a1);
      char v6 = v7 & 1;
    }
    uint64_t v22 = result;
    uint64_t v23 = v5;
    char v24 = v6;
    if (v3 < 0)
    {
      __break(1u);
LABEL_23:
      __break(1u);
    }
    else
    {
      do
      {
        while (1)
        {
          int64_t v14 = v22;
          uint64_t v13 = v23;
          char v15 = v24;
          uint64_t v16 = *(void *)(sub_10001FAD8(v22, v23, v24, a1)
                          + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation);
          swift_release();
          uint64_t v17 = v25;
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = sub_10002F2C0(0, v17[2] + 1, 1);
            uint64_t v17 = v25;
          }
          unint64_t v19 = v17[2];
          unint64_t v18 = v17[3];
          if (v19 >= v18 >> 1)
          {
            uint64_t result = sub_10002F2C0(v18 > 1, v19 + 1, 1);
            uint64_t v17 = v25;
          }
          v17[2] = v19 + 1;
          v17[v19 + 4] = v16;
          if (v2) {
            break;
          }
          int64_t v8 = sub_10001F9F4(v14, v13, v15, a1);
          uint64_t v10 = v9;
          char v12 = v11;
          sub_100021144(v14, v13, v15);
          uint64_t v22 = v8;
          uint64_t v23 = v10;
          char v24 = v12 & 1;
          if (!--v3) {
            goto LABEL_20;
          }
        }
        if ((v15 & 1) == 0) {
          goto LABEL_23;
        }
        if (__CocoaSet.Index.handleBitPattern.getter()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_100005E64(&qword_100049BE8);
        uint64_t v20 = (void (*)(char *, void))Set.Index._asCocoa.modify();
        __CocoaSet.formIndex(after:isUnique:)();
        v20(v21, 0);
        --v3;
      }
      while (v3);
LABEL_20:
      sub_100021144(v22, v23, v24);
      return (uint64_t)v25;
    }
  }
  return result;
}

void *sub_100015890(void *a1)
{
  unint64_t v104 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC15audioanalyticsd6Server_systemMonitor] = 0;
  uint64_t v103 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  uint64_t v105 = sub_100021200(0, (unint64_t *)&qword_100049650);
  uint64_t v2 = type metadata accessor for DispatchQoS();
  os_log_type_t v108 = *(char **)(*(void *)(v2 - 8) + 64);
  __chkstk_darwin(v2 - 8);
  unint64_t v107 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v102 = v1;
  static DispatchQoS.default.getter();
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  uint64_t v112 = *(void **)(*(void *)(v4 - 8) + 64);
  __chkstk_darwin(v4);
  unint64_t v101 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v113 = _swiftEmptyArrayStorage;
  uint64_t v111 = sub_1000211A8((unint64_t *)&unk_100049C10, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  uint64_t v110 = sub_100005E64(&qword_100049658);
  uint64_t v109 = sub_10002123C((unint64_t *)&qword_100049C20, &qword_100049658);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v98 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v6 = *(void *)(v98 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v98);
  uint64_t v99 = v7;
  unint64_t v106 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  id v97 = *(void (**)(char *, void))(v6 + 104);
  unsigned int v100 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v97((char *)&v95 - v106, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  uint64_t v9 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v1[v103] = v9;
  uint64_t v10 = OBJC_IVAR____TtC15audioanalyticsd6Server_mobileAssetsQueue;
  __chkstk_darwin(v9);
  uint64_t v11 = static DispatchQoS.background.getter();
  __chkstk_darwin(v11);
  unint64_t v113 = _swiftEmptyArrayStorage;
  uint64_t v12 = dispatch thunk of SetAlgebra.init<A>(_:)();
  __chkstk_darwin(v12);
  uint64_t v13 = v8;
  int64_t v14 = (void (*)(char *, void, uint64_t))v97;
  uint64_t v15 = v98;
  ((void (*)(char *, uint64_t, uint64_t))v97)((char *)&v95 - v106, v13, v98);
  uint64_t v16 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v103 = v10;
  uint64_t v17 = v102;
  *(void *)&v102[v10] = v16;
  *(void *)&v17[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances] = &_swiftEmptySetSingleton;
  *(void *)&v17[OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections] = &_swiftEmptySetSingleton;
  *(void *)&v17[OBJC_IVAR____TtC15audioanalyticsd6Server_activeReporterIDs] = &_swiftEmptySetSingleton;
  unint64_t v18 = v17;
  uint64_t v19 = OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue;
  __chkstk_darwin(v16);
  uint64_t v20 = static DispatchQoS.unspecified.getter();
  __chkstk_darwin(v20);
  unint64_t v113 = _swiftEmptyArrayStorage;
  uint64_t v21 = dispatch thunk of SetAlgebra.init<A>(_:)();
  __chkstk_darwin(v21);
  v14((char *)&v95 - v106, v100, v15);
  *(void *)&v18[v19] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v22 = OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorFrequency;
  static Double.seconds(_:)();
  *(void *)&v18[v22] = v23;
  char v24 = v18;
  static Logger.service.getter();
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Starting Server.", v27, 2u);
    swift_slowDealloc();
  }

  uint64_t v28 = v104;
  if (v104)
  {
    id v29 = v104;
  }
  else
  {
    static Constants.machServiceName.getter();
    id v30 = objc_allocWithZone((Class)NSXPCListener);
    NSString v31 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v29 = [v30 initWithMachServiceName:v31];
  }
  uint64_t v32 = v103;
  *(void *)&v24[OBJC_IVAR____TtC15audioanalyticsd6Server_listener] = v29;
  int64_t v33 = *(void **)&v24[v32];
  type metadata accessor for MobileAssetsHandler();
  swift_allocObject();
  id v34 = v33;
  id v35 = v28;
  uint64_t v112 = sub_10000FABC(v34);
  Swift::String_optional v36 = MobileAssetsHandler.getMobileAssetsConfigPath()();
  if (!v36.value._object)
  {
    uint64_t v37 = _swiftEmptyArrayStorage;
    if ((static DeviceUtilities.isInternalBuild.getter() & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  uint64_t v37 = sub_10002DD38(0, 1, 1, _swiftEmptyArrayStorage);
  unint64_t v39 = v37[2];
  unint64_t v38 = v37[3];
  if (v39 >= v38 >> 1) {
    uint64_t v37 = sub_10002DD38((void *)(v38 > 1), v39 + 1, 1, v37);
  }
  v37[2] = v39 + 1;
  *(Swift::String_optional *)&v37[2 * v39 + 4] = v36;
  if (static DeviceUtilities.isInternalBuild.getter())
  {
LABEL_12:
    type metadata accessor for Config();
    uint64_t v40 = static Config.assetConfigPath.getter();
    uint64_t v42 = v41;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v37 = sub_10002DD38(0, v37[2] + 1, 1, v37);
    }
    unint64_t v44 = v37[2];
    unint64_t v43 = v37[3];
    if (v44 >= v43 >> 1) {
      uint64_t v37 = sub_10002DD38((void *)(v43 > 1), v44 + 1, 1, v37);
    }
    v37[2] = v44 + 1;
    id v45 = &v37[2 * v44];
    v45[4] = v40;
    v45[5] = v42;
  }
LABEL_17:
  uint64_t v46 = swift_bridgeObjectRetain();
  uint64_t v47 = sub_100020118(v46);
  swift_bridgeObjectRelease();
  if (!v47)
  {
    uint64_t v88 = type metadata accessor for Logger();
    uint64_t v89 = *(void *)(v88 - 8);
    __chkstk_darwin(v88);
    unint64_t v91 = (char *)&v95 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0);
    static Logger.config.getter();
    unint64_t v92 = Logger.logObject.getter();
    uint64_t v93 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v92, (os_log_type_t)v93))
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v94 = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, (os_log_type_t)v93, "Failed to find a config! Exiting.", v94, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v89 + 8))(v91, v88);
    exit(-1);
  }
  swift_bridgeObjectRelease();
  uint64_t v48 = OBJC_IVAR____TtC15audioanalyticsd6Server_config;
  *(void *)&v24[OBJC_IVAR____TtC15audioanalyticsd6Server_config] = v47;
  type metadata accessor for Config();
  swift_retain();
  Config.sortableConfigVersion.getter();
  static Config.configVersion.setter();
  uint64_t v49 = qword_100049630;
  swift_retain();
  if (v49 != -1) {
    swift_once();
  }
  Config.updateNeededPreviousFields(workers:)((Swift::OpaquePointer)qword_10004A3A8);
  uint64_t v109 = v47;
  swift_release();
  id v50 = (void **)static Constants.unknownReporterID.getter();
  id v51 = [objc_allocWithZone((Class)NSProcessInfo) init];
  int v52 = [v51 processIdentifier];

  uint64_t v53 = *(void *)&v24[v48];
  type metadata accessor for Session();
  swift_allocObject();
  swift_retain();
  *(void *)&v24[OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession] = sub_1000289D4(v50, v52, 0xD000000000000014, 0x800000010003EC10, v53, 1);

  v114.receiver = v24;
  v114.super_class = ObjectType;
  id v54 = [super init];
  sub_100016630();
  swift_beginAccess();
  if (static SystemMonitor.shared)
  {
    id v55 = v54;
    swift_retain();
    swift_retain();
    sub_1000345E0();
    swift_release();
  }
  else
  {
    id v56 = v54;
    swift_retain();
  }
  type metadata accessor for SystemMonitor(0);
  uint64_t v57 = (void *)swift_allocObject();
  uint64_t v58 = (char *)v54;
  uint64_t v59 = swift_retain();
  static SystemMonitor.shared = (uint64_t)sub_10001EDF0(v59, v58, v57);
  swift_release();

  swift_release();
  type metadata accessor for TailspinWorker();
  swift_retain();
  static TailspinWorker.initialize(config:)();
  swift_release();
  if (&type metadata accessor for ABCManager) {
    BOOL v60 = &type metadata for ABCManager == 0;
  }
  else {
    BOOL v60 = 1;
  }
  if (!v60 && &nominal type descriptor for ABCManager != 0 && &metaclass for ABCManager != 0)
  {
    type metadata accessor for ABCManager();
    swift_retain();
    static ABCManager.initialize(config:)();
    swift_release();
  }
  uint64_t v110 = (uint64_t)v35;
  uint64_t v63 = *(void **)&v58[OBJC_IVAR____TtC15audioanalyticsd6Server_listener];
  [v63 setDelegate:v58];
  [v63 activate];
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = v58;
  int v65 = v112;
  uint64_t v66 = v112[2];
  v112[2] = sub_10002128C;
  v65[3] = v64;
  int v67 = v58;
  sub_100012EA0(v66);
  uint64_t v111 = (uint64_t)v67;
  os_log_type_t v108 = &v67[OBJC_IVAR____TtC15audioanalyticsd6Server_logger];
  int v68 = Logger.logObject.getter();
  os_log_type_t v69 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v70 = 0;
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "Server created", v70, 2u);
    swift_slowDealloc();
  }

  uint64_t v71 = type metadata accessor for ServerConfig();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(void *)(v72 + 64);
  __chkstk_darwin(v71);
  unint64_t v74 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0;
  Config.serverConfig.getter();
  char v75 = ServerConfig.monitorClientConnections.getter();
  uint64_t v76 = *(uint64_t (**)(char *, uint64_t))(v72 + 8);
  uint64_t v77 = v76((char *)&v95 - v74, v71);
  if (v75) {
    uint64_t v77 = sub_100016CA0();
  }
  __chkstk_darwin(v77);
  Config.serverConfig.getter();
  uint64_t v78 = ServerConfig.osTransactionTimeout.getter();
  char v80 = v79;
  v76((char *)&v95 - v74, v71);
  if (v80)
  {
    uint64_t v84 = Logger.logObject.getter();
    os_log_type_t v85 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v84, v85))
    {
      unint64_t v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v86 = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "No osTransactionTimeout found!", v86, 2u);
      swift_slowDealloc();
    }
    swift_release();

    uint64_t v83 = (void *)v110;
    uint64_t v82 = (void *)v111;
  }
  else
  {
    double v81 = *(double *)&v78;
    uint64_t v82 = (void *)v111;
    sub_100017054(v81);
    swift_release();
    uint64_t v83 = (void *)v110;
  }
  swift_release();

  return v82;
}

void sub_100016630()
{
  id v1 = [objc_allocWithZone((Class)CLISignalHandler) initWithSignal:15];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  v8[4] = sub_100021BA4;
  v8[5] = v2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1000195F0;
  v8[3] = &unk_100046258;
  uint64_t v3 = _Block_copy(v8);
  id v4 = v0;
  swift_release();
  [v1 setExecutionBlock:v3];
  _Block_release(v3);
  [v1 setEnabled:1];
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Listening for SIGTERM.", v7, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000167B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v33 = a2;
  uint64_t v34 = a1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  __chkstk_darwin(v4);
  unint64_t v39 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  __chkstk_darwin(v6);
  Swift::String_optional v36 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchTimeInterval();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (void *)((char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v35 = type metadata accessor for DispatchTime();
  uint64_t v12 = *(void *)(v35 - 8);
  uint64_t v13 = __chkstk_darwin(v35);
  uint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v32 - v16;
  unint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Scheduling server exit.", v20, 2u);
    swift_slowDealloc();
  }

  v32[1] = *(void *)&v3[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  static DispatchTime.now()();
  *uint64_t v11 = 1;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchTimeInterval.seconds(_:), v8);
  + infix(_:_:)();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v22 = v15;
  uint64_t v23 = v35;
  v21(v22, v35);
  char v24 = (void *)swift_allocObject();
  uint64_t v25 = v33;
  void v24[2] = v3;
  v24[3] = v25;
  v24[4] = v34;
  v24[5] = 1;
  aBlock[4] = sub_100021380;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_1000460D0;
  os_log_type_t v26 = _Block_copy(aBlock);
  unint64_t v27 = v3;
  uint64_t v28 = v36;
  static DispatchQoS.unspecified.getter();
  uint64_t v42 = &_swiftEmptyArrayStorage;
  sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
  id v29 = v39;
  uint64_t v30 = v41;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v29, v30);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v28, v38);
  v21(v17, v23);
  return swift_release();
}

uint64_t sub_100016CA0()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v22 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchTime();
  uint64_t v19 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v17 - v12;
  v17[1] = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue);
  static DispatchTime.now()();
  + infix(_:_:)();
  unint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1000212B8;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_100045FB8;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v23 = &_swiftEmptyArrayStorage;
  sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v21);
  v18(v13, v19);
  swift_release();
  return swift_release();
}

uint64_t sub_100017054(double a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v25 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchTime();
  uint64_t v22 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v20 - v14;
  v20[1] = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue);
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v13, v9);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(double *)(v17 + 24) = a1;
  aBlock[4] = sub_100021330;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_100046030;
  unint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  os_log_type_t v26 = &_swiftEmptyArrayStorage;
  sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
  v21(v15, v22);
  swift_release();
  return swift_release();
}

uint64_t sub_100017430(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v21 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v19 = *(void *)(v7 - 8);
  uint64_t v20 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Message();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  v18[1] = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15 + v14, (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  aBlock[4] = sub_100021B08;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_100046208;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v22 = _swiftEmptyArrayStorage;
  sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v20);
  swift_release();
  return swift_release();
}

void sub_1000177DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    sub_100017958(a2);
  }
  else
  {
    static Logger.service.getter();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Server is gone. {action=broadcast}", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_100017958(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v61 = a1;
  uint64_t v3 = type metadata accessor for Message();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v52 - v8;
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (uint64_t *)((char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  char v16 = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v16 & 1) == 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v18 = v4;
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v60 = v4 + 16;
  v59(v9, v61, v3);
  uint64_t v19 = (void (*)(void *, void))Message.metadata.modify();
  Message.Metadata.isBroadcast.setter();
  v19(aBlock, 0);
  uint64_t v20 = (uint64_t *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances);
  swift_beginAccess();
  uint64_t v21 = *v20;
  BOOL v22 = (*v20 & 0xC000000000000001) == 0;
  uint64_t v61 = v3;
  uint64_t v62 = v9;
  if (v22)
  {
    uint64_t v26 = -1 << *(unsigned char *)(v21 + 32);
    uint64_t v27 = *(void *)(v21 + 56);
    uint64_t v58 = v21 + 56;
    uint64_t v23 = ~v26;
    uint64_t v28 = -v26;
    if (v28 < 64) {
      uint64_t v29 = ~(-1 << v28);
    }
    else {
      uint64_t v29 = -1;
    }
    unint64_t v25 = v29 & v27;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v24 = 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for ClientServerInstance();
    sub_1000211A8((unint64_t *)&unk_100049C00, (void (*)(uint64_t))type metadata accessor for ClientServerInstance);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v21 = aBlock[10];
    uint64_t v58 = aBlock[11];
    uint64_t v23 = aBlock[12];
    uint64_t v24 = aBlock[13];
    unint64_t v25 = aBlock[14];
  }
  uint64_t v53 = v2;
  char v30 = 0;
  uint64_t v56 = v21 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v54 = v23;
  int64_t v57 = (unint64_t)(v23 + 64) >> 6;
  NSString v31 = (uint64_t (**)(char *, uint64_t))(v18 + 8);
  id v55 = (char *)&type metadata for Swift.AnyObject + 8;
  if (v21 < 0) {
    goto LABEL_11;
  }
  while (1)
  {
    if (v25)
    {
      uint64_t v32 = (v25 - 1) & v25;
      unint64_t v33 = __clz(__rbit64(v25)) | (v24 << 6);
      uint64_t v34 = v24;
      goto LABEL_28;
    }
    int64_t v37 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v37 >= v57) {
      goto LABEL_31;
    }
    unint64_t v38 = *(void *)(v58 + 8 * v37);
    uint64_t v34 = v24 + 1;
    if (!v38)
    {
      uint64_t v34 = v24 + 2;
      if (v24 + 2 >= v57) {
        goto LABEL_31;
      }
      unint64_t v38 = *(void *)(v58 + 8 * v34);
      if (!v38)
      {
        uint64_t v34 = v24 + 3;
        if (v24 + 3 >= v57) {
          goto LABEL_31;
        }
        unint64_t v38 = *(void *)(v58 + 8 * v34);
        if (!v38)
        {
          uint64_t v34 = v24 + 4;
          if (v24 + 4 >= v57) {
            goto LABEL_31;
          }
          unint64_t v38 = *(void *)(v58 + 8 * v34);
          if (!v38) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v32 = (v38 - 1) & v38;
    unint64_t v33 = __clz(__rbit64(v38)) + (v34 << 6);
LABEL_28:
    uint64_t v40 = *(void *)(*(void *)(v21 + 48) + 8 * v33);
    swift_retain();
    if (!v40) {
      goto LABEL_31;
    }
    while (1)
    {
      uint64_t v41 = v61;
      v59(v7, (uint64_t)v62, v61);
      uint64_t v42 = static Constants.unknownReporterID.getter();
      char v43 = sub_10000D2C8((uint64_t)v7, v42);
      swift_release();
      uint64_t result = (*v31)(v7, v41);
      v30 |= v43;
      uint64_t v24 = v34;
      unint64_t v25 = v32;
      if ((v21 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_11:
      uint64_t v35 = __CocoaSet.Iterator.next()();
      if (v35)
      {
        uint64_t v63 = v35;
        type metadata accessor for ClientServerInstance();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v36 = aBlock[0];
        swift_unknownObjectRelease();
        uint64_t v34 = v24;
        uint64_t v32 = v25;
        if (v36) {
          continue;
        }
      }
      goto LABEL_31;
    }
  }
  uint64_t v39 = v24 + 5;
  while (v57 != v39)
  {
    unint64_t v38 = *(void *)(v58 + 8 * v39++);
    if (v38)
    {
      uint64_t v34 = v39 - 1;
      goto LABEL_27;
    }
  }
LABEL_31:
  sub_10000F9A4();
  if (v30) {
    return (*v31)(v62, v61);
  }
  uint64_t v44 = *(void *)(v53 + OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession);
  sub_100026E2C();
  uint64_t v45 = v61;
  uint64_t v46 = ((uint64_t (*)(char *, char *, uint64_t))v59)(v7, v62, v61);
  uint64_t v47 = OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue;
  __chkstk_darwin(v46);
  *(&v52 - 2) = v44;
  *(&v52 - 1) = (uint64_t)v7;
  OS_dispatch_queue.sync<A>(execute:)();
  uint64_t v48 = *v31;
  (*v31)(v7, v45);
  uint64_t v49 = *(NSObject **)(v44 + v47);
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = sub_10000C4FC;
  *(void *)(v50 + 24) = v44;
  aBlock[4] = sub_100021BAC;
  aBlock[5] = v50;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_1000199D0;
  aBlock[3] = &unk_100045F68;
  id v51 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v49, v51);
  _Block_release(v51);
  LOBYTE(v49) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v49 & 1) == 0) {
    return v48(v62, v45);
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100018070(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v24 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (id *)((char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = *(void **)&v2[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v22 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    sub_10000E034();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v2;
    *(void *)(v16 + 24) = a1;
    aBlock[4] = sub_10002113C;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_10001A18C;
    aBlock[3] = &unk_100045EC8;
    uint64_t v17 = _Block_copy(aBlock);
    uint64_t v18 = v2;
    swift_retain();
    static DispatchQoS.unspecified.getter();
    unint64_t v25 = _swiftEmptyArrayStorage;
    sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005E64((uint64_t *)&unk_100049BC0);
    sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
    swift_release();
    uint64_t v19 = (uint64_t *)&v18[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances];
    swift_beginAccess();
    uint64_t v20 = *v19;
    swift_bridgeObjectRetain();
    char v21 = sub_100028728(a1, v20);
    swift_bridgeObjectRelease();
    return v21 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018458(uint64_t a1, uint64_t a2)
{
  return swift_release();
}

uint64_t sub_1000184BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for OsTransactionHandler();
  static OsTransactionHandler.shared.getter();
  Swift::Bool v7 = OsTransactionHandler.inactive()();
  swift_release();
  if (v7)
  {
LABEL_10:
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Exit requested, and no active transaction. Calling exit.", v15, 2u);
      swift_slowDealloc();
    }

    exit(0);
  }
  if (__OFSUB__(a3, a4))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  if (a3 - a4 <= a2)
  {
    if (v10)
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Exit requested, and timeout reached. Calling exit.", v16, 2u);
      swift_slowDealloc();
    }

    exit(0);
  }
  if (v10)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Exit requested, but active transactions. Will try again in 10 seconds.", v11, 2u);
    swift_slowDealloc();
  }

  if (__OFADD__(a2, a4)) {
    goto LABEL_9;
  }
  return sub_1000167B8(a3, a2 + a4);
}

void sub_1000186A4()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::Bool v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    os_log_type_t v9 = (void *)Strong;
    uint64_t v16 = *(void *)(Strong + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
    uint64_t v10 = swift_allocObject();
    uint64_t v15 = v1;
    uint64_t v17 = v4;
    uint64_t v11 = v10;
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1000212C0;
    aBlock[5] = v11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_10001A18C;
    aBlock[3] = &unk_100045FE0;
    uint64_t v12 = _Block_copy(aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v18 = &_swiftEmptyArrayStorage;
    sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005E64((uint64_t *)&unk_100049BC0);
    sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v3, v0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
    swift_release();
    uint64_t v13 = swift_release();
    sub_100016CA0(v13);
  }
}

uint64_t sub_1000189B0()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result) {
    return result;
  }
  v27[0] = &_swiftEmptyArrayStorage;
  unint64_t v25 = (void *)result;
  uint64_t v1 = result + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = __CocoaSet.makeIterator()();
    type metadata accessor for ClientServerInstance();
    sub_1000211A8((unint64_t *)&unk_100049C00, (void (*)(uint64_t))type metadata accessor for ClientServerInstance);
    Set.Iterator.init(_cocoa:)();
    uint64_t v2 = v27[4];
    uint64_t v3 = v27[5];
    uint64_t v4 = v27[6];
    int64_t v5 = v27[7];
    unint64_t v6 = v27[8];
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v3 = v2 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v2 + 56);
    swift_bridgeObjectRetain();
    int64_t v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  while (v2 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_37;
    }
    type metadata accessor for ClientServerInstance();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v14 = v26;
    swift_unknownObjectRelease();
    int64_t v13 = v5;
    uint64_t v11 = v6;
    if (!v26) {
      goto LABEL_37;
    }
LABEL_27:
    uint64_t v1 = v14;
    if (sub_10000E8CC())
    {
      swift_beginAccess();
      swift_retain();
      uint64_t v17 = swift_bridgeObjectRetain();
      sub_100020608(v17, v14);
      uint64_t v1 = v18;
      swift_bridgeObjectRelease();
      swift_release();
      if (v1)
      {
        id v19 = (id)v1;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v27[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        uint64_t v1 = (uint64_t)v27;
        specialized Array._endMutation()();
      }
    }
    swift_release();
    int64_t v5 = v13;
    unint64_t v6 = v11;
  }
  if (v6)
  {
    uint64_t v11 = (v6 - 1) & v6;
    unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
    int64_t v13 = v5;
    goto LABEL_26;
  }
  int64_t v13 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v13 >= v10) {
    goto LABEL_37;
  }
  unint64_t v15 = *(void *)(v3 + 8 * v13);
  if (v15)
  {
LABEL_25:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
LABEL_26:
    uint64_t v14 = *(void *)(*(void *)(v2 + 48) + 8 * v12);
    swift_retain();
    if (!v14) {
      goto LABEL_37;
    }
    goto LABEL_27;
  }
  int64_t v16 = v5 + 2;
  if (v5 + 2 >= v10) {
    goto LABEL_37;
  }
  unint64_t v15 = *(void *)(v3 + 8 * v16);
  if (v15) {
    goto LABEL_24;
  }
  int64_t v16 = v5 + 3;
  if (v5 + 3 >= v10) {
    goto LABEL_37;
  }
  unint64_t v15 = *(void *)(v3 + 8 * v16);
  if (v15)
  {
LABEL_24:
    int64_t v13 = v16;
    goto LABEL_25;
  }
  int64_t v13 = v5 + 4;
  if (v5 + 4 >= v10) {
    goto LABEL_37;
  }
  unint64_t v15 = *(void *)(v3 + 8 * v13);
  if (v15) {
    goto LABEL_25;
  }
  int64_t v20 = v5 + 5;
  while (v10 != v20)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v20++);
    if (v15)
    {
      int64_t v13 = v20 - 1;
      goto LABEL_25;
    }
  }
LABEL_37:
  uint64_t result = sub_10000F9A4();
  uint64_t v1 = v27[0];
  if (!(v27[0] >> 62))
  {
    uint64_t v21 = *(void *)((v27[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21) {
      goto LABEL_39;
    }
LABEL_47:

    return swift_bridgeObjectRelease();
  }
LABEL_46:
  swift_bridgeObjectRetain();
  uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_47;
  }
LABEL_39:
  if (v21 >= 1)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v23 = *(id *)(v1 + 8 * i + 32);
      }
      uint64_t v24 = v23;
      [v23 invalidate];
    }
    goto LABEL_47;
  }
  __break(1u);
  return result;
}

void sub_100018DF8(double a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  int64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v15 = (void *)Strong;
    uint64_t v27 = *(void *)(Strong + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v16;
    uint64_t v26 = v16;
    *(double *)(v17 + 24) = a1;
    aBlock[4] = sub_10002133C;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = sub_10001A18C;
    aBlock[3] = &unk_100046080;
    uint64_t v18 = _Block_copy(aBlock);
    uint64_t v25 = v6;
    id v19 = v18;
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v28 = &_swiftEmptyArrayStorage;
    sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005E64((uint64_t *)&unk_100049BC0);
    sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v19);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
    swift_release();
    uint64_t v20 = swift_release();
    sub_100017054(v20, a1);
  }
  else
  {
    static Logger.service.getter();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Server is gone. { action=osTransactionTimeout }", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

void sub_10001923C(double a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    type metadata accessor for OsTransactionHandler();
    static OsTransactionHandler.shared.getter();
    Swift::Bool v8 = OsTransactionHandler.inactive()();
    swift_release();
    if (!v8)
    {
      swift_beginAccess();
      uint64_t v9 = swift_bridgeObjectRetain();
      uint64_t v10 = sub_100015630(v9);
      swift_bridgeObjectRelease();
      uint64_t v11 = *(void *)(v10 + 16);
      if (v11)
      {
        double v12 = *(double *)(v10 + 32);
        uint64_t v13 = v11 - 1;
        if (v13)
        {
          uint64_t v14 = (double *)(v10 + 40);
          do
          {
            double v15 = *v14++;
            double v16 = v15;
            if (v12 < v15) {
              double v12 = v16;
            }
            --v13;
          }
          while (v13);
        }
        swift_bridgeObjectRelease();
        double v17 = v12 + a1;
        static Double.now()();
        if (v18 < v17)
        {
          id v19 = Logger.logObject.getter();
          os_log_type_t v20 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v19, v20))
          {
            uint64_t v21 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v21 = 134283521;
            static Double.now()();
            v26[1] = v17 - v22;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl((void *)&_mh_execute_header, v19, v20, "osTransaction timeout. { seconds=%{private}f }", v21, 0xCu);
            swift_slowDealloc();
          }

          return;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      static OsTransactionHandler.shared.getter();
      OsTransactionHandler.expire()();
      swift_release();
    }

    return;
  }
  static Logger.service.getter();
  id v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Server is gone. { action=osTransactionTimeout }", v25, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100019540()
{
  uint64_t v0 = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "Got SIGTERM. Should die within 2 seconds.", v2, 2u);
    swift_slowDealloc();
  }

  return sub_1000167B8(2, 0);
}

uint64_t sub_1000195F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_100019674()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_1000197BC()
{
  return type metadata accessor for Server();
}

uint64_t type metadata accessor for Server()
{
  uint64_t result = qword_100049B48;
  if (!qword_100049B48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100019810()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

void sub_1000198E8(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  swift_retain();
  sub_10001C7D8((uint64_t *)&v5, a2);
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  sub_10001C538(&v5, a3);
  swift_endAccess();
}

uint64_t sub_1000199A8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000199D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1000199F8(uint64_t a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v34 = a3;
  int v33 = a2;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    double v16 = (void *)result;
    uint64_t v28 = v7;
    uint64_t v29 = a5;
    uint64_t v30 = v12;
    uint64_t v31 = v11;
    uint64_t v32 = v8;
    swift_bridgeObjectRetain_n();
    double v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      aBlock[0] = v27;
      *(_DWORD *)uint64_t v19 = 67109379;
      int v20 = v33;
      LODWORD(v35) = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v19 + 8) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v21 = v34;
      uint64_t v35 = (void *)sub_10002E344(v34, a4, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "XPC connection was interrupted. { pid=%d, clientProcessName=%{private}s }", (uint8_t *)v19, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v21 = v34;
      int v20 = v33;
    }
    uint64_t v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = v29;
    *(void *)(v23 + 16) = v22;
    *(void *)(v23 + 24) = v24;
    *(_DWORD *)(v23 + 32) = v20;
    *(void *)(v23 + 40) = v21;
    *(void *)(v23 + 48) = a4;
    aBlock[4] = (uint64_t)sub_100021198;
    aBlock[5] = v23;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    uint64_t aBlock[2] = (uint64_t)sub_10001A18C;
    aBlock[3] = (uint64_t)&unk_100045F18;
    uint64_t v25 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v35 = _swiftEmptyArrayStorage;
    sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005E64((uint64_t *)&unk_100049BC0);
    sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
    uint64_t v26 = v28;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v25);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v26);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v31);

    swift_release();
    return swift_release();
  }
  return result;
}

void sub_100019EAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = (void *)Strong;
    if (sub_100018070(a2))
    {
    }
    else
    {
      swift_bridgeObjectRetain_n();
      os_log_type_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 67109379;
        LODWORD(v22) = a3;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v20 + 8) = 2081;
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_10002E344(a4, a5, &v23);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to remove client. { pid=%d, clientProcessName=%{private}s }", (uint8_t *)v20, 0x12u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    static Logger.service.getter();
    double v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      double v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Server is gone. { action=interruptionHandler }", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_10001A18C(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10001A1D0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, int a6)
{
  int v45 = a6;
  uint64_t v52 = a4;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  __chkstk_darwin(v9);
  uint64_t v48 = &v44[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v49 = type metadata accessor for DispatchQoS();
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v46 = &v44[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  double v15 = &v44[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  os_log_type_t v19 = &v44[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v21 = (void *)Strong;
    Date.init()();
    Date.timeIntervalSince(_:)();
    uint64_t v23 = v22;
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
    id v24 = a3;
    swift_bridgeObjectRetain_n();
    id v25 = v24;
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 67175171;
      unsigned int v29 = [v25 processIdentifier];

      LODWORD(v53) = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      *(_WORD *)(v28 + 8) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v53 = (void *)sub_10002E344(v52, a5, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 18) = 2049;
      uint64_t v53 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "XPC connection was invalidated. { pid=%{private}d, clientProcessName=%{private}s, uptimeSeconds=%{private}f }", (uint8_t *)v28, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    NSString v34 = String._bridgeToObjectiveC()();
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = a2;
    *(void *)(v35 + 24) = v23;
    uint64_t v58 = sub_10002108C;
    uint64_t v59 = v35;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v55 = 1107296256;
    uint64_t v56 = sub_10001AA60;
    int64_t v57 = &unk_100045E28;
    uint64_t v36 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v36);

    uint64_t v37 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = v37;
    *(void *)(v38 + 24) = a2;
    *(_DWORD *)(v38 + 32) = v45;
    *(void *)(v38 + 40) = v52;
    *(void *)(v38 + 48) = a5;
    *(void *)(v38 + 56) = v25;
    uint64_t v58 = sub_1000210E8;
    uint64_t v59 = v38;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v55 = 1107296256;
    uint64_t v56 = sub_10001A18C;
    int64_t v57 = &unk_100045E78;
    uint64_t v39 = _Block_copy(&aBlock);
    id v40 = v25;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v41 = v46;
    static DispatchQoS.unspecified.getter();
    uint64_t v53 = _swiftEmptyArrayStorage;
    sub_1000211A8((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005E64((uint64_t *)&unk_100049BC0);
    sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
    uint64_t v42 = v48;
    uint64_t v43 = v51;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v39);
    (*(void (**)(unsigned char *, uint64_t))(v50 + 8))(v42, v43);
    (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v41, v49);

    swift_release();
    return swift_release();
  }
  else
  {
    static Logger.service.getter();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Server is gone. { action=invalidationHandler }", v32, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(unsigned char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

unint64_t sub_10001A94C(double a1)
{
  sub_100005E64(&qword_100049BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003D860;
  *(void *)(inited + 32) = 0x4E737365636F7270;
  *(void *)(inited + 40) = 0xEB00000000656D61;
  id v3 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithString:v4];

  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = 0x73646E6F636573;
  *(void *)(inited + 64) = 0xE700000000000000;
  *(void *)(inited + 72) = [objc_allocWithZone((Class)NSNumber) initWithDouble:a1];
  return sub_100005BF0(inited);
}

Class sub_10001AA60(uint64_t a1)
{
  unint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100021200(0, &qword_100049BF0);
    v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

void sub_10001AAFC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, void *a6)
{
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v16 = (void *)Strong;
    if ((sub_100018070(a2) & 1) == 0)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        v28[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 67174915;
        LODWORD(v27) = a3;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v19 + 8) = 2081;
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_10002E344(a4, a5, v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to remove client. { pid=%{private}d, clientProcessName=%{private}s }", (uint8_t *)v19, 0x12u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    swift_beginAccess();
    uint64_t v23 = sub_10001E3C4(a6);
    swift_endAccess();
    if (!v23)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v23 = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = swift_slowAlloc();
        v28[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 67109379;
        LODWORD(v27) = a3;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v25 + 8) = 2081;
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_10002E344(a4, a5, v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to remove connection. { pid=%d, clientProcessName=%{private}s }", (uint8_t *)v25, 0x12u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    static Logger.service.getter();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Server is gone. { action=invalidationHandler }", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_10001AFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v75 = a1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  void *v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  id v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
LABEL_78:
    __break(1u);
LABEL_79:
    swift_release();
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    swift_release();
    __break(1u);
    goto LABEL_82;
  }
  uint64_t v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = *v10 & 0xC000000000000001;
  if (v12)
  {
    uint64_t v13 = __CocoaSet.startIndex.getter();
    uint64_t v15 = v14;
    char v16 = 1;
  }
  else
  {
    uint64_t v13 = sub_10001FD60(*v10);
    uint64_t v15 = v17;
    char v16 = v18 & 1;
  }
  int64_t v79 = v13;
  uint64_t v80 = v15;
  char v81 = v16;
  uint64_t v77 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v76 = v12;
  char v19 = v16;
  if (!v12) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v20 = __CocoaSet.endIndex.getter();
  if ((v19 & 1) == 0) {
    goto LABEL_84;
  }
  uint64_t v22 = v20;
  uint64_t v23 = v21;
  char v24 = static __CocoaSet.Index.== infix(_:_:)();
  sub_100021144(v22, v23, 1);
  if (v24)
  {
    char v19 = 1;
  }
  else
  {
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_10001FAD8(v13, v15, v19 & 1, v11);
      swift_bridgeObjectRelease();
      if (*(_DWORD *)(v25 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2 + v77))
      {
        swift_release();
        goto LABEL_27;
      }
      if (*(void *)(v25 + 24) == *(void *)(a2 + 24) && *(void *)(v25 + 32) == *(void *)(a2 + 32))
      {
        swift_release();
      }
      else
      {
        char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        if ((v26 & 1) == 0) {
          goto LABEL_27;
        }
      }
      unint64_t v27 = v76;
      if (v76)
      {
        if ((v16 & 1) == 0) {
          goto LABEL_87;
        }
        if (__CocoaSet.Index.handleBitPattern.getter()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_100005E64(&qword_100049BE8);
        int v33 = (void (*)(unsigned char *, void))Set.Index._asCocoa.modify();
        __CocoaSet.formIndex(after:isUnique:)();
        v33(v78, 0);
        char v16 = v81;
        uint64_t v13 = v79;
        uint64_t v15 = v80;
        char v19 = v81;
        if (v27) {
          goto LABEL_6;
        }
      }
      else
      {
        int64_t v28 = sub_10001F9F4(v13, v15, v19 & 1, v11);
        uint64_t v30 = v29;
        char v32 = v31;
        sub_100021144(v13, v15, v19 & 1);
        int64_t v79 = v28;
        uint64_t v80 = v30;
        char v81 = v32 & 1;
        uint64_t v15 = v30;
        uint64_t v13 = v28;
        char v19 = v32;
        if (v76) {
          goto LABEL_6;
        }
      }
LABEL_9:
      if (v19) {
        goto LABEL_84;
      }
      if (*(_DWORD *)(v11 + 36) != v15) {
        goto LABEL_77;
      }
    }
    while (v13 != 1 << *(unsigned char *)(v11 + 32));
    char v19 = 0;
  }
LABEL_27:
  unint64_t v34 = v76;
  unint64_t v73 = (unint64_t)"@\"NSDictionary\"8@?0";
  unint64_t v74 = 0x800000010003EC90;
LABEL_29:
  if (v34)
  {
    uint64_t v35 = __CocoaSet.endIndex.getter();
    if (v19)
    {
      uint64_t v37 = v35;
      uint64_t v38 = v36;
      char v39 = static __CocoaSet.Index.== infix(_:_:)();
      sub_100021144(v37, v38, 1);
      if (v39)
      {
        uint64_t v64 = __CocoaSet.endIndex.getter();
LABEL_65:
        uint64_t v66 = v64;
        uint64_t v67 = v65;
        char v68 = static __CocoaSet.Index.== infix(_:_:)();
        char v69 = 1;
        sub_100021144(v66, v67, 1);
        if (v68)
        {
LABEL_66:
          uint64_t v70 = 0;
LABEL_72:
          sub_100021144(v13, v15, v69);
          swift_bridgeObjectRelease();
          swift_release();
          return v70;
        }
        goto LABEL_71;
      }
      goto LABEL_36;
    }
LABEL_82:
    swift_release();
    __break(1u);
    goto LABEL_83;
  }
  if (v19) {
    goto LABEL_82;
  }
  int v40 = *(_DWORD *)(v11 + 36);
  if (v40 != v15)
  {
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (v13 == 1 << *(unsigned char *)(v11 + 32))
  {
LABEL_69:
    if (v40 == v15)
    {
      char v69 = 0;
      if (v13 == 1 << *(unsigned char *)(v11 + 32)) {
        goto LABEL_66;
      }
LABEL_71:
      sub_10001FAD8(v13, v15, v69, v11);
      uint64_t v70 = sub_10000CE80(v75, 1, 0xD000000000000011, v73 | 0x8000000000000000);
      swift_release();
      if (v70) {
        goto LABEL_72;
      }
      goto LABEL_85;
    }
    goto LABEL_80;
  }
LABEL_36:
  swift_bridgeObjectRetain();
  sub_10001FAD8(v13, v15, v19 & 1, v11);
  uint64_t v41 = sub_10000CE80(v75, 1, 0xD000000000000011, v74);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v41)
  {
    if (v34)
    {
      uint64_t v64 = __CocoaSet.endIndex.getter();
      if ((v19 & 1) == 0) {
        goto LABEL_86;
      }
      goto LABEL_65;
    }
    if (v19) {
      goto LABEL_86;
    }
    int v40 = *(_DWORD *)(v11 + 36);
    goto LABEL_69;
  }
  int64_t v79 = v13;
  uint64_t v80 = v15;
  char v81 = v19 & 1;
  if (v34)
  {
    uint64_t v42 = __CocoaSet.endIndex.getter();
    if (v19)
    {
      uint64_t v44 = v42;
      uint64_t v45 = v43;
      char v46 = static __CocoaSet.Index.== infix(_:_:)();
      sub_100021144(v44, v45, 1);
      if ((v46 & 1) == 0) {
        goto LABEL_46;
      }
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
  }
  else if ((v19 & 1) == 0)
  {
    if (*(_DWORD *)(v11 + 36) != v15) {
      goto LABEL_76;
    }
    if (v13 != 1 << *(unsigned char *)(v11 + 32))
    {
      while (1)
      {
LABEL_46:
        if (v34)
        {
          if ((v81 & 1) == 0) {
            goto LABEL_81;
          }
          if (__CocoaSet.Index.handleBitPattern.getter()) {
            swift_isUniquelyReferenced_nonNull_native();
          }
          sub_100005E64(&qword_100049BE8);
          uint64_t v54 = (void (*)(unsigned char *, void))Set.Index._asCocoa.modify();
          __CocoaSet.formIndex(after:isUnique:)();
          v54(v78, 0);
          char v55 = v81;
          uint64_t v56 = __CocoaSet.endIndex.getter();
          if ((v55 & 1) == 0) {
            goto LABEL_79;
          }
          uint64_t v58 = v56;
          uint64_t v59 = v57;
          char v60 = static __CocoaSet.Index.== infix(_:_:)();
          sub_100021144(v58, v59, 1);
          uint64_t v13 = v79;
          uint64_t v15 = v80;
          char v19 = v81;
          if (v60) {
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v47 = v79;
          uint64_t v48 = v80;
          char v49 = v81;
          uint64_t v13 = sub_10001F9F4(v79, v80, v81, v11);
          uint64_t v15 = v50;
          char v52 = v51;
          char v53 = v51 & 1;
          sub_100021144(v47, v48, v49);
          int64_t v79 = v13;
          uint64_t v80 = v15;
          char v81 = v53;
          unint64_t v34 = v76;
          if (v52) {
            goto LABEL_79;
          }
          if (*(_DWORD *)(v11 + 36) != v15)
          {
            __break(1u);
            goto LABEL_74;
          }
          char v19 = 0;
          if (v13 == 1 << *(unsigned char *)(v11 + 32)) {
            goto LABEL_29;
          }
        }
        swift_bridgeObjectRetain();
        uint64_t v61 = sub_10001FAD8(v13, v15, v19, v11);
        swift_bridgeObjectRelease();
        if (*(_DWORD *)(v61 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2 + v77))
        {
          swift_release();
          goto LABEL_29;
        }
        if (*(void *)(v61 + 24) == *(void *)(a2 + 24) && *(void *)(v61 + 32) == *(void *)(a2 + 32))
        {
          swift_release();
        }
        else
        {
          char v63 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_release();
          if ((v63 & 1) == 0) {
            goto LABEL_29;
          }
        }
      }
    }
    goto LABEL_74;
  }
LABEL_83:
  swift_release();
  __break(1u);
LABEL_84:
  swift_release();
  __break(1u);
LABEL_85:
  swift_release();
  __break(1u);
LABEL_86:
  swift_release();
  __break(1u);
LABEL_87:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_10001B7E0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100031FA8(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_10001B9A0(v6);
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10001B85C(uint64_t a1, uint64_t a2)
{
  return sub_10003A720(a2, a1);
}

Swift::Int sub_10001B86C()
{
  return sub_1000390F8();
}

uint64_t sub_10001B890@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100015508(a2, *a1, a3);
}

uint64_t sub_10001B8A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100005E64((uint64_t *)&unk_100049C30);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FeatureInfo(0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000219D4(a3, (uint64_t)v10, type metadata accessor for FeatureInfo);
  sub_10002196C(a1, (uint64_t)v7);
  return sub_100026C80((uint64_t)v7, (uint64_t)v10);
}

Swift::Int sub_10001B9A0(uint64_t *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      return sub_10001C0F8(0, v3, 1, v2);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_140;
  }
  Swift::Int v6 = result;
  uint64_t v88 = v2;
  if (v3 < 2)
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
    uint64_t v95 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v94 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
LABEL_99:
      int64_t v79 = v10;
      if (v13 >= 2)
      {
        uint64_t v80 = *v88;
        do
        {
          unint64_t v81 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_127;
          }
          if (!v80) {
            goto LABEL_139;
          }
          uint64_t v82 = v79;
          uint64_t v83 = *(void *)&v79[16 * v81 + 32];
          uint64_t v84 = *(void *)&v79[16 * v13 + 24];
          sub_10001C20C((char *)(v80 + 8 * v83), (char *)(v80 + 8 * *(void *)&v79[16 * v13 + 16]), v80 + 8 * v84, v94);
          if (v1) {
            break;
          }
          if (v84 < v83) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v82 = sub_100031654((uint64_t)v82);
          }
          if (v81 >= *((void *)v82 + 2)) {
            goto LABEL_129;
          }
          os_log_type_t v85 = &v82[16 * v81 + 32];
          *(void *)os_log_type_t v85 = v83;
          *((void *)v85 + 1) = v84;
          unint64_t v86 = *((void *)v82 + 2);
          if (v13 > v86) {
            goto LABEL_130;
          }
          memmove(&v82[16 * v13 + 16], &v82[16 * v13 + 32], 16 * (v86 - v13));
          int64_t v79 = v82;
          *((void *)v82 + 2) = v86 - 1;
          unint64_t v13 = v86 - 1;
        }
        while (v86 > 2);
      }
LABEL_96:
      swift_bridgeObjectRelease();
      *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v7 = v2;
    uint64_t v8 = v5 >> 1;
    type metadata accessor for Config();
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    uint64_t v2 = v7;
    uint64_t v94 = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v95 = v9;
  }
  Swift::Int v11 = 0;
  uint64_t v12 = *v2;
  uint64_t v90 = *v2 + 16;
  Swift::Int v91 = v6;
  uint64_t v89 = *v2 - 8;
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v92 = v3;
  uint64_t v93 = *v2;
  while (1)
  {
    Swift::Int v14 = v11++;
    if (v11 >= v3) {
      goto LABEL_31;
    }
    type metadata accessor for Config();
    sub_1000211A8(&qword_100049C48, (void (*)(uint64_t))&type metadata accessor for Config);
    int v15 = dispatch thunk of static Comparable.< infix(_:_:)();
    Swift::Int v11 = v14 + 2;
    if (v14 + 2 >= v3)
    {
LABEL_21:
      if ((v15 & 1) == 0) {
        goto LABEL_31;
      }
LABEL_24:
      if (v11 < v14) {
        goto LABEL_133;
      }
      if (v14 < v11)
      {
        uint64_t v17 = (uint64_t *)(v89 + 8 * v11);
        Swift::Int v18 = v11;
        Swift::Int v19 = v14;
        uint64_t v20 = (uint64_t *)(v12 + 8 * v14);
        while (1)
        {
          if (v19 != --v18)
          {
            if (!v12) {
              goto LABEL_138;
            }
            uint64_t v21 = *v20;
            *uint64_t v20 = *v17;
            *uint64_t v17 = v21;
          }
          ++v19;
          --v17;
          ++v20;
          if (v19 >= v18) {
            goto LABEL_31;
          }
        }
      }
      goto LABEL_31;
    }
    uint64_t v16 = v90 + 8 * v14;
    while (((v15 ^ dispatch thunk of static Comparable.< infix(_:_:)()) & 1) == 0)
    {
      ++v11;
      v16 += 8;
      if (v92 == v11)
      {
        Swift::Int v3 = v92;
        Swift::Int v11 = v92;
        goto LABEL_21;
      }
    }
    Swift::Int v3 = v92;
    if (v15) {
      goto LABEL_24;
    }
LABEL_31:
    if (v11 >= v3) {
      goto LABEL_48;
    }
    if (__OFSUB__(v11, v14)) {
      goto LABEL_131;
    }
    if (v11 - v14 >= v91) {
      goto LABEL_48;
    }
    if (__OFADD__(v14, v91)) {
      goto LABEL_134;
    }
    Swift::Int v22 = v14 + v91 >= v3 ? v3 : v14 + v91;
    if (v22 < v14) {
      break;
    }
    if (v11 != v22)
    {
      os_log_t v87 = v10;
      type metadata accessor for Config();
      sub_1000211A8(&qword_100049C48, (void (*)(uint64_t))&type metadata accessor for Config);
      uint64_t v23 = (uint64_t *)(v89 + 8 * v11);
      do
      {
        Swift::Int v24 = v14;
        Swift::Int v25 = v14;
        char v26 = v23;
        do
        {
          if ((dispatch thunk of static Comparable.< infix(_:_:)() & 1) == 0) {
            break;
          }
          if (!v12) {
            goto LABEL_136;
          }
          uint64_t v27 = *v26;
          *char v26 = v26[1];
          v26[1] = v27;
          --v26;
          ++v25;
        }
        while (v11 != v25);
        ++v11;
        ++v23;
        Swift::Int v14 = v24;
      }
      while (v11 != v22);
      Swift::Int v11 = v22;
      uint64_t v10 = v87;
    }
LABEL_48:
    if (v11 < v14) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_1000313D0(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v29 = *((void *)v10 + 2);
    unint64_t v28 = *((void *)v10 + 3);
    unint64_t v13 = v29 + 1;
    if (v29 >= v28 >> 1) {
      uint64_t v10 = sub_1000313D0((char *)(v28 > 1), v29 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v13;
    uint64_t v30 = v10 + 32;
    char v31 = &v10[16 * v29 + 32];
    *(void *)char v31 = v14;
    *((void *)v31 + 1) = v11;
    if (v29)
    {
      uint64_t v12 = v93;
      while (1)
      {
        unint64_t v32 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v37 = &v30[16 * v13];
          uint64_t v38 = *((void *)v37 - 8);
          uint64_t v39 = *((void *)v37 - 7);
          BOOL v43 = __OFSUB__(v39, v38);
          uint64_t v40 = v39 - v38;
          if (v43) {
            goto LABEL_115;
          }
          uint64_t v42 = *((void *)v37 - 6);
          uint64_t v41 = *((void *)v37 - 5);
          BOOL v43 = __OFSUB__(v41, v42);
          uint64_t v35 = v41 - v42;
          char v36 = v43;
          if (v43) {
            goto LABEL_116;
          }
          unint64_t v44 = v13 - 2;
          uint64_t v45 = &v30[16 * v13 - 32];
          uint64_t v47 = *(void *)v45;
          uint64_t v46 = *((void *)v45 + 1);
          BOOL v43 = __OFSUB__(v46, v47);
          uint64_t v48 = v46 - v47;
          if (v43) {
            goto LABEL_118;
          }
          BOOL v43 = __OFADD__(v35, v48);
          uint64_t v49 = v35 + v48;
          if (v43) {
            goto LABEL_121;
          }
          if (v49 >= v40)
          {
            uint64_t v67 = &v30[16 * v32];
            uint64_t v69 = *(void *)v67;
            uint64_t v68 = *((void *)v67 + 1);
            BOOL v43 = __OFSUB__(v68, v69);
            uint64_t v70 = v68 - v69;
            if (v43) {
              goto LABEL_125;
            }
            BOOL v60 = v35 < v70;
            goto LABEL_86;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v61 = *((void *)v10 + 4);
            uint64_t v62 = *((void *)v10 + 5);
            BOOL v43 = __OFSUB__(v62, v61);
            uint64_t v54 = v62 - v61;
            char v55 = v43;
            goto LABEL_80;
          }
          uint64_t v34 = *((void *)v10 + 4);
          uint64_t v33 = *((void *)v10 + 5);
          BOOL v43 = __OFSUB__(v33, v34);
          uint64_t v35 = v33 - v34;
          char v36 = v43;
        }
        if (v36) {
          goto LABEL_117;
        }
        unint64_t v44 = v13 - 2;
        uint64_t v50 = &v30[16 * v13 - 32];
        uint64_t v52 = *(void *)v50;
        uint64_t v51 = *((void *)v50 + 1);
        BOOL v53 = __OFSUB__(v51, v52);
        uint64_t v54 = v51 - v52;
        char v55 = v53;
        if (v53) {
          goto LABEL_120;
        }
        uint64_t v56 = &v30[16 * v32];
        uint64_t v58 = *(void *)v56;
        uint64_t v57 = *((void *)v56 + 1);
        BOOL v43 = __OFSUB__(v57, v58);
        uint64_t v59 = v57 - v58;
        if (v43) {
          goto LABEL_123;
        }
        if (__OFADD__(v54, v59)) {
          goto LABEL_124;
        }
        if (v54 + v59 >= v35)
        {
          BOOL v60 = v35 < v59;
LABEL_86:
          if (v60) {
            unint64_t v32 = v44;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v55) {
          goto LABEL_119;
        }
        char v63 = &v30[16 * v32];
        uint64_t v65 = *(void *)v63;
        uint64_t v64 = *((void *)v63 + 1);
        BOOL v43 = __OFSUB__(v64, v65);
        uint64_t v66 = v64 - v65;
        if (v43) {
          goto LABEL_122;
        }
        if (v66 < v54) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v71 = v32 - 1;
        if (v32 - 1 >= v13)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        if (!v12) {
          goto LABEL_137;
        }
        uint64_t v72 = v10;
        uint64_t v73 = v12;
        unint64_t v74 = &v30[16 * v71];
        uint64_t v75 = *(void *)v74;
        unint64_t v76 = &v30[16 * v32];
        uint64_t v77 = *((void *)v76 + 1);
        sub_10001C20C((char *)(v73 + 8 * *(void *)v74), (char *)(v73 + 8 * *(void *)v76), v73 + 8 * v77, v94);
        if (v1) {
          goto LABEL_96;
        }
        if (v77 < v75) {
          goto LABEL_112;
        }
        if (v32 > *((void *)v72 + 2)) {
          goto LABEL_113;
        }
        *(void *)unint64_t v74 = v75;
        *(void *)&v30[16 * v71 + 8] = v77;
        unint64_t v78 = *((void *)v72 + 2);
        if (v32 >= v78) {
          goto LABEL_114;
        }
        uint64_t v10 = v72;
        unint64_t v13 = v78 - 1;
        memmove(&v30[16 * v32], v76 + 16, 16 * (v78 - 1 - v32));
        *((void *)v72 + 2) = v78 - 1;
        BOOL v60 = v78 > 2;
        uint64_t v12 = v93;
        if (!v60) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
    uint64_t v12 = v93;
LABEL_14:
    Swift::Int v3 = v92;
    if (v11 >= v92) {
      goto LABEL_99;
    }
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001C0F8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    type metadata accessor for Config();
    sub_1000211A8(&qword_100049C48, (void (*)(uint64_t))&type metadata accessor for Config);
    uint64_t v8 = v7 + 8 * v4 - 8;
LABEL_5:
    uint64_t v9 = v6;
    uint64_t v10 = (uint64_t *)v8;
    while (1)
    {
      Swift::Int result = dispatch thunk of static Comparable.< infix(_:_:)();
      if ((result & 1) == 0)
      {
LABEL_4:
        ++v4;
        v8 += 8;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t v11 = *v10;
      *uint64_t v10 = v10[1];
      v10[1] = v11;
      --v10;
      if (v4 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C20C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v23 = __src;
  Swift::Int v22 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v16 = &v4[8 * v13];
      uint64_t v21 = v16;
      uint64_t v23 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        type metadata accessor for Config();
        sub_1000211A8(&qword_100049C48, (void (*)(uint64_t))&type metadata accessor for Config);
        uint64_t v17 = (char *)(a3 - 8);
        Swift::Int v18 = v6;
        while (1)
        {
          v18 -= 8;
          Swift::Int v19 = v17 + 8;
          if (dispatch thunk of static Comparable.< infix(_:_:)())
          {
            if (v19 != v6 || v17 >= v6) {
              *(void *)uint64_t v17 = *(void *)v18;
            }
            uint64_t v23 = v18;
            if (v18 <= v7) {
              goto LABEL_43;
            }
          }
          else
          {
            uint64_t v21 = v16 - 8;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(void *)uint64_t v17 = *((void *)v16 - 1);
            }
            Swift::Int v18 = v6;
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_43;
            }
          }
          v17 -= 8;
          uint64_t v6 = v18;
          if (v16 <= v4) {
            goto LABEL_43;
          }
        }
      }
      goto LABEL_43;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    Swift::Int v14 = &v4[8 * v10];
    uint64_t v21 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      type metadata accessor for Config();
      sub_1000211A8(&qword_100049C48, (void (*)(uint64_t))&type metadata accessor for Config);
      do
      {
        if (dispatch thunk of static Comparable.< infix(_:_:)())
        {
          int v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        else
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          Swift::Int v22 = v4;
          int v15 = v6;
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v23 = v7;
    }
LABEL_43:
    sub_1000314CC((void **)&v23, (const void **)&v22, &v21);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001C538(void *a1, void *a2)
{
  Swift::Int v3 = v2;
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

      sub_100021200(0, &qword_100049BD0);
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
    Swift::Int v22 = sub_10001CCD8(v7, result + 1);
    unint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10001D1D4();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10001D548((uint64_t)v8, v23);
    *Swift::Int v3 = (uint64_t)v23;
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
      sub_100021200(0, &qword_100049BD0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
    *Swift::Int v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10001D5CC((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *Swift::Int v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_10001C7D8(uint64_t *a1, uint64_t a2)
{
  Swift::Int v3 = v2;
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
    swift_retain();
    uint64_t v8 = __CocoaSet.member(for:)();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for ClientServerInstance();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v24;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10001CAA0(v7, result + 1);
    Swift::Int v26 = v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      swift_retain();
      sub_10001CED0();
      uint64_t v23 = v26;
    }
    else
    {
      uint64_t v23 = v22;
      swift_retain();
    }
    sub_10001D474(a2, v23);
    *Swift::Int v3 = v23;
  }
  else
  {
    Hasher.init(_seed:)();
    uint64_t v10 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    Hasher._combine(_:)(*(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Swift::Int v11 = Hasher._finalize()();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      uint64_t v14 = ~v12;
      uint64_t v15 = *(void *)(v6 + 48);
      int v16 = *(_DWORD *)(a2 + v10);
      uint64_t v17 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      do
      {
        uint64_t v18 = *(void *)(v15 + 8 * v13);
        if (*(_DWORD *)(v18 + v17) == v16)
        {
          BOOL v19 = *(void *)(v18 + 24) == *(void *)(a2 + 24) && *(void *)(v18 + 32) == *(void *)(a2 + 32);
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_release();
            swift_bridgeObjectRelease();
            *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v13);
            swift_retain();
            return 0;
          }
          uint64_t v17 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        }
        unint64_t v13 = (v13 + 1) & v14;
      }
      while (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    Swift::Int v21 = swift_retain();
    sub_10001D754(v21, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v25;
  }
  swift_bridgeObjectRelease();
  *a1 = a2;
  return 1;
}

Swift::Int sub_10001CAA0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005E64(&qword_100049BE0);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      type metadata accessor for ClientServerInstance();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10001CED0();
          uint64_t v2 = v14;
        }
        Hasher.init(_seed:)();
        Hasher._combine(_:)(*(_DWORD *)(v13 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        Swift::Int result = Hasher._finalize()();
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

Swift::Int sub_10001CCD8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005E64(&qword_100049BD8);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_100021200(0, &qword_100049BD0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10001D1D4();
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

uint64_t sub_10001CED0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005E64(&qword_100049BE0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v27 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        int64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v8) {
          goto LABEL_33;
        }
        unint64_t v16 = v27[v15];
        ++v11;
        if (!v16)
        {
          int64_t v11 = v15 + 1;
          if (v15 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v16 = v27[v11];
          if (!v16)
          {
            int64_t v11 = v15 + 2;
            if (v15 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v16 = v27[v11];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v27, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v27 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v27[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v11 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v27[v11];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(*(_DWORD *)(v18 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      uint64_t result = Hasher._finalize()();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v9 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_10001D1D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005E64(&qword_100049BD8);
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
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_10001D474(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._finalize()();
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

unint64_t sub_10001D548(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10001D5CC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10001D1D4();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10001DAC4();
      goto LABEL_14;
    }
    sub_10001DF44();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100021200(0, &qword_100049BD0);
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

Swift::Int sub_10001D754(Swift::Int result, unint64_t a2, char a3)
{
  Swift::Int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_10001CED0();
    }
    else
    {
      if (v7 > v6)
      {
        unint64_t result = (Swift::Int)sub_10001D918();
        goto LABEL_18;
      }
      sub_10001DC70();
    }
    uint64_t v8 = *v3;
    Hasher.init(_seed:)();
    uint64_t v9 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    Hasher._combine(_:)(*(_DWORD *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    unint64_t result = Hasher._finalize()();
    uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v10;
    uint64_t v11 = v8 + 56;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v12 = ~v10;
      unint64_t result = type metadata accessor for ClientServerInstance();
      uint64_t v13 = *(void *)(v8 + 48);
      int v14 = *(_DWORD *)(v5 + v9);
      uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      do
      {
        uint64_t v16 = *(void *)(v13 + 8 * a2);
        if (*(_DWORD *)(v16 + v15) == v14)
        {
          if (*(void *)(v16 + 24) == *(void *)(v5 + 24) && *(void *)(v16 + 32) == *(void *)(v5 + 32)) {
            goto LABEL_21;
          }
          unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if (result) {
            goto LABEL_21;
          }
          uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        }
        a2 = (a2 + 1) & v12;
      }
      while (((*(void *)(v11 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_18:
  uint64_t v18 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v18 + 48) + 8 * a2) = v5;
  uint64_t v19 = *(void *)(v18 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (v20)
  {
    __break(1u);
LABEL_21:
    unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    *(void *)(v18 + 16) = v21;
  }
  return result;
}

void *sub_10001D918()
{
  uint64_t v1 = v0;
  sub_100005E64(&qword_100049BE0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    unint64_t result = (void *)swift_retain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_10001DAC4()
{
  uint64_t v1 = v0;
  sub_100005E64(&qword_100049BD8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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

uint64_t sub_10001DC70()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005E64(&qword_100049BE0);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v26 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v26) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v26) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v26) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v11);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(*(_DWORD *)(v18 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    swift_retain();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v9 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v26)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10001DF44()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005E64(&qword_100049BD8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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

uint64_t sub_10001E1C0(uint64_t a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v3 < 0) {
      uint64_t v4 = *v1;
    }
    else {
      uint64_t v4 = v3 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    char v5 = __CocoaSet.contains(_:)();
    swift_release();
    if (v5)
    {
      uint64_t v6 = sub_10001E59C(v4, a1);
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  Hasher.init(_seed:)();
  Swift::UInt32 v7 = *(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  Hasher._combine(_:)(v7);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v10 = Hasher._finalize()();
  uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v3 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v13 = ~v11;
  uint64_t v14 = *(void *)(v3 + 48);
  uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    uint64_t v16 = *(void *)(v14 + 8 * v12);
    if (*(_DWORD *)(v16 + v15) == v7) {
      break;
    }
LABEL_9:
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v3 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_17;
    }
  }
  BOOL v17 = *(void *)(v16 + 24) == v8 && *(void *)(v16 + 32) == v9;
  if (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v20 = *v1;
  uint64_t v21 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_10001D918();
    uint64_t v20 = v21;
  }
  uint64_t v6 = *(void *)(*(void *)(v20 + 48) + 8 * v12);
  sub_10001E91C(v12);
  *uint64_t v1 = v21;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10001E3C4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = a1;
    char v6 = __CocoaSet.contains(_:)();

    if (v6)
    {
      uint64_t v7 = sub_10001E780();
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v8 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v9 = NSObject._rawHashValue(seed:)(v8);
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    goto LABEL_12;
  }
  sub_100021200(0, &qword_100049BD0);
  id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
  char v13 = static NSObject.== infix(_:_:)();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v10;
    do
    {
      unint64_t v11 = (v11 + 1) & v14;
      if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v16 = static NSObject.== infix(_:_:)();
    }
    while ((v16 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v2;
  uint64_t v20 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10001DAC4();
    uint64_t v18 = v20;
  }
  uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
  sub_10001EB14(v11);
  *uint64_t v2 = v20;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10001E59C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = __CocoaSet.count.getter();
  uint64_t v5 = swift_unknownObjectRetain();
  Swift::Int v6 = sub_10001CAA0(v5, v4);
  Swift::Int v21 = v6;
  Hasher.init(_seed:)();
  Swift::UInt32 v7 = *(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  Hasher._combine(_:)(v7);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  swift_retain();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v10 = Hasher._finalize()();
  uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v13 = ~v11;
  uint64_t v14 = *(void *)(v6 + 48);
  uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    uint64_t v16 = *(void *)(v14 + 8 * v12);
    if (*(_DWORD *)(v16 + v15) == v7) {
      break;
    }
LABEL_3:
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_20;
    }
  }
  BOOL v17 = *(void *)(v16 + 24) == v8 && *(void *)(v16 + 32) == v9;
  if (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_3;
  }
  swift_release();
  uint64_t v18 = *(void *)(*(void *)(v6 + 48) + 8 * v12);
  sub_10001E91C(v12);
  if (v7 == *(_DWORD *)(v18 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid))
  {
    BOOL v19 = v8 == *(void *)(v18 + 24) && v9 == *(void *)(v18 + 32);
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      *uint64_t v2 = v21;
      return v18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_20:
  swift_release();
  __break(1u);
LABEL_21:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_10001E780()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = __CocoaSet.count.getter();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_10001CCD8(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = NSObject._rawHashValue(seed:)(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_100021200(0, &qword_100049BD0);
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = static NSObject.== infix(_:_:)();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_10001EB14(v8);
      if (static NSObject.== infix(_:_:)())
      {
        *uint64_t v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = static NSObject.== infix(_:_:)();

        if (v13) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_10001E91C(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(*(void *)(v3 + 48) + 8 * v6);
        Hasher.init(_seed:)();
        Hasher._combine(_:)(*(_DWORD *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
        swift_retain();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        Swift::Int v11 = Hasher._finalize()();
        swift_release();
        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 < v9) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(v3 + 48);
          uint64_t v14 = (void *)(v13 + 8 * v2);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v14 >= v15 + 1))
          {
            *uint64_t v14 = *v15;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v16 = *(void *)(v3 + 16);
  BOOL v17 = __OFSUB__(v16, 1);
  uint64_t v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_10001EB14(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            BOOL v17 = (void *)(v16 + 8 * v2);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *BOOL v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void (*sub_10001ECB8(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001ED68(v6, a2, a3);
  return sub_10001ED20;
}

void sub_10001ED20(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_10001ED68(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_10001EDE8;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001EDE8()
{
  return swift_release();
}

void *sub_10001EDF0(uint64_t a1, void *a2, void *a3)
{
  id v92 = a2;
  uint64_t v74 = a1;
  uint64_t v4 = sub_100005E64((uint64_t *)&unk_100049C30);
  __chkstk_darwin(v4 - 8);
  uint64_t v87 = (uint64_t)v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  uint64_t v93 = *(void **)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v88 = (char *)v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for FeatureInfo(0);
  uint64_t v95 = *(void *)(v86 - 8);
  uint64_t v8 = __chkstk_darwin(v86);
  uint64_t v100 = (uint64_t)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v90 = (char *)v73 - v11;
  uint64_t v91 = v12;
  __chkstk_darwin(v10);
  uint64_t v89 = (uint64_t)v73 - v13;
  uint64_t v14 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v14);
  uint64_t v15 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v19 - 8);
  unint64_t v20 = sub_100005894((uint64_t)_swiftEmptyArrayStorage);
  sub_100005E64(&qword_100049648);
  uint64_t v21 = swift_allocObject();
  *(_DWORD *)(v21 + 24) = 0;
  *(void *)(v21 + 16) = v20;
  a3[2] = v21;
  uint64_t v101 = sub_100021200(0, (unint64_t *)&qword_100049650);
  static DispatchQoS.default.getter();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v15);
  aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
  sub_1000211A8((unint64_t *)&unk_100049C10, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005E64(&qword_100049658);
  sub_10002123C((unint64_t *)&qword_100049C20, &qword_100049658);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  a3[5] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static Logger.service.getter();
  unint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    char v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "SystemMonitor.init()", v24, 2u);
    swift_slowDealloc();
  }

  a3[4] = v74;
  swift_retain();
  unint64_t v25 = sub_10003A460();
  a3[3] = v25;
  uint64_t v26 = v25[2];
  v73[1] = v25;
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v94 = (char *)a3 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
    uint64_t v28 = *(unsigned __int8 *)(v95 + 80);
    uint64_t v29 = (v28 + 32) & ~v28;
    uint64_t v30 = (uint64_t)v25 + v29;
    uint64_t v99 = (void (**)(char *, uint64_t, uint64_t))(v93 + 2);
    uint64_t v98 = (uint64_t (**)(char *, uint64_t))(v93 + 11);
    int v97 = enum case for SystemMonitorConfig.MonitorType.defaults(_:);
    int v96 = enum case for SystemMonitorConfig.MonitorType.notify(_:);
    int v83 = enum case for SystemMonitorConfig.MonitorType.other(_:);
    unint64_t v78 = (void (**)(char *, uint64_t))(v93 + 1);
    uint64_t v82 = v28 | 7;
    uint64_t v84 = v29;
    unint64_t v81 = (v91 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v80 = v81 + 8;
    int64_t v79 = v103;
    uint64_t v95 = *(void *)(v95 + 72);
    swift_bridgeObjectRetain();
    *(void *)&long long v31 = 67109376;
    long long v77 = v31;
    *(void *)&long long v31 = 136380675;
    long long v76 = v31;
    uint64_t v75 = (char *)&type metadata for Any + 8;
    uint64_t v93 = a3;
    uint64_t v33 = v88;
    uint64_t v32 = v89;
    uint64_t v34 = (uint64_t)v90;
    uint64_t v35 = v27;
    uint64_t v85 = v6;
    while (1)
    {
      sub_1000219D4(v30, v32, type metadata accessor for FeatureInfo);
      (*v99)(v33, v32, v6);
      int v45 = (*v98)(v33, v6);
      if (v45 != v97 && v45 != v96)
      {
        if (v45 == v83)
        {
          sub_10000C728(v32);
        }
        else
        {
          sub_1000219D4(v32, v34, type metadata accessor for FeatureInfo);
          uint64_t v64 = Logger.logObject.getter();
          uint64_t v65 = v32;
          os_log_type_t v66 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v64, v66))
          {
            uint64_t v67 = swift_slowAlloc();
            uint64_t v101 = v35;
            uint64_t v68 = v67;
            aBlock[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v68 = v76;
            uint64_t v69 = SystemMonitorConfig.MonitorType.rawValue.getter();
            *(void *)(v68 + 4) = sub_10002E344(v69, v70, aBlock);
            swift_bridgeObjectRelease();
            sub_10000C728(v34);
            _os_log_impl((void *)&_mh_execute_header, v64, v66, "Encountered unknown monitorType. { monitorType=%{private}s }", (uint8_t *)v68, 0xCu);
            swift_arrayDestroy();
            a3 = v93;
            swift_slowDealloc();
            uint64_t v35 = v101;
            swift_slowDealloc();
          }
          else
          {
            sub_10000C728(v34);
          }

          sub_10000C728(v65);
          uint64_t v32 = v65;
          (*v78)(v33, v6);
        }
        goto LABEL_7;
      }
      uint64_t v101 = v35;
      uint64_t v47 = swift_allocObject();
      *(_DWORD *)(v47 + 16) = -1;
      uint64_t v48 = (void *)a3[5];
      uint64_t v49 = swift_allocObject();
      swift_weakInit();
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 24) = &off_100045C98;
      swift_unknownObjectWeakInit();
      uint64_t v51 = v32;
      uint64_t v52 = v100;
      sub_1000219D4(v51, v100, type metadata accessor for FeatureInfo);
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = v49;
      *(void *)(v53 + 24) = v50;
      sub_100021594(v52, v53 + v84);
      *(void *)(v53 + v81) = v47;
      v103[2] = sub_1000215F8;
      v103[3] = v53;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      v103[0] = sub_1000195F0;
      v103[1] = &unk_100046198;
      uint64_t v54 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      char v55 = v48;
      swift_retain();
      swift_release();
      uint64_t v56 = String.utf8CString.getter();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint32_t v57 = notify_register_dispatch((const char *)(v56 + 32), (int *)(v47 + 16), v55, v54);
      swift_endAccess();
      swift_release();
      _Block_release(v54);

      swift_retain();
      uint64_t v58 = Logger.logObject.getter();
      if (v57)
      {
        os_log_type_t v59 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v58, v59))
        {
          uint64_t v60 = swift_slowAlloc();
          *(_DWORD *)uint64_t v60 = v77;
          *(_DWORD *)(v60 + 4) = v57;
          *(_WORD *)(v60 + 8) = 1024;
          *(_DWORD *)(v60 + 10) = *(_DWORD *)(v47 + 16);
          swift_release();
          uint64_t v61 = v58;
          os_log_type_t v62 = v59;
          char v63 = "Notify setup result is not OK! { result=%u, token=%d }";
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v61, v62, v63, (uint8_t *)v60, 0xEu);
          swift_slowDealloc();
          goto LABEL_6;
        }
      }
      else
      {
        int v71 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v58, (os_log_type_t)v71))
        {
          uint64_t v60 = swift_slowAlloc();
          *(void *)uint64_t v60 = v77;
          *(_WORD *)(v60 + 8) = 1024;
          *(_DWORD *)(v60 + 10) = *(_DWORD *)(v47 + 16);
          swift_release();
          uint64_t v61 = v58;
          os_log_type_t v62 = v71;
          char v63 = "Notify setup result. { result=%u, token=%d }";
          goto LABEL_22;
        }
      }
      swift_release();
LABEL_6:
      char v36 = v93;
      uint64_t v33 = v88;

      uint64_t v37 = *(unsigned int *)(v47 + 16);
      LOBYTE(aBlock[0]) = 0;
      uint64_t v38 = v87;
      uint64_t v39 = v89;
      sub_100035A70(v89, v37, v87);
      uint64_t v40 = v100;
      uint64_t v41 = sub_1000219D4(v39, v100, type metadata accessor for FeatureInfo);
      __chkstk_darwin(v41);
      uint64_t v43 = v40;
      a3 = v36;
      sub_100021594(v43, (uint64_t)v73 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
      swift_getKeyPath();
      swift_retain();
      OSAllocatedUnfairLock<A>.assign<A>(_:newValue:)();
      swift_release();
      swift_release();
      uint64_t v44 = v38;
      uint64_t v32 = v39;
      sub_10002190C(v44);
      sub_10000C728(v39);
      swift_release();
      uint64_t v34 = (uint64_t)v90;
      uint64_t v6 = v85;
      uint64_t v35 = v101;
LABEL_7:
      v30 += v95;
      if (!--v35) {
        goto LABEL_26;
      }
    }
  }
  swift_bridgeObjectRetain();
LABEL_26:
  swift_release();

  swift_bridgeObjectRelease();
  return a3;
}

int64_t sub_10001F9F4(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001FAD8(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      type metadata accessor for ClientServerInstance();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v6 = v17;
      swift_unknownObjectRelease();
      return v6;
    }
    goto LABEL_28;
  }
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
    {
      __break(1u);
      goto LABEL_25;
    }
    if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0) {
      goto LABEL_26;
    }
    if (*(_DWORD *)(a4 + 36) == a2) {
      goto LABEL_22;
    }
    __break(1u);
  }
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    swift_release();
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  __CocoaSet.Index.element.getter();
  type metadata accessor for ClientServerInstance();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  Hasher.init(_seed:)();
  uint64_t v7 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  Hasher._combine(_:)(*(_DWORD *)(v17 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v5 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
  {
LABEL_29:
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  uint64_t v10 = ~v9;
  int v11 = *(_DWORD *)(v17 + v7);
  uint64_t v12 = *(void *)(a4 + 48);
  uint64_t v13 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    uint64_t v14 = *(void *)(v12 + 8 * v5);
    if (*(_DWORD *)(v14 + v13) == v11) {
      break;
    }
LABEL_13:
    unint64_t v5 = (v5 + 1) & v10;
    if (((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_27;
    }
  }
  BOOL v15 = *(void *)(v14 + 24) == *(void *)(v17 + 24) && *(void *)(v14 + 32) == *(void *)(v17 + 32);
  if (!v15 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v13 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_13;
  }
  swift_release();
LABEL_22:
  uint64_t v6 = *(void *)(*(void *)(a4 + 48) + 8 * v5);
  swift_retain();
  return v6;
}

uint64_t sub_10001FD60(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
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
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

void *sub_10001FDE8(int a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  BOOL v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  *(void *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID) = &_swiftEmptyDictionarySingleton;
  uint64_t v16 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation;
  static Double.now()();
  *(void *)((char *)a6 + v16) = v17;
  *(_DWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) = a1;
  a6[3] = a2;
  a6[4] = a3;
  uint64_t v18 = (void *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  *uint64_t v18 = a5;
  v18[1] = &off_100045C98;
  a6[2] = a4;
  swift_bridgeObjectRetain();
  id v19 = a5;
  swift_retain();
  Date.init()();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))((uint64_t)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate, v15, v12);
  swift_retain_n();
  swift_bridgeObjectRetain();
  unint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136380931;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_10002E344(a2, a3, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 1024;
    int v23 = *(_DWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
    swift_release();
    LODWORD(v25) = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "ClientServerInstance created. { processName=%{private}s, pid=%d", (uint8_t *)v22, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
    swift_release_n();
  }
  return a6;
}

uint64_t sub_100020118(uint64_t a1)
{
  uint64_t v25 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  unint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v28 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain_n();
      v8._id countAndFlagsBits = 1668179246;
      v8._object = (void *)0xE400000000000000;
      String.hasSuffix(_:)(v8);
      static DeviceUtilities.currentPlatform.getter();
      type metadata accessor for Config();
      swift_allocObject();
      uint64_t v9 = Config.init(configPath:allowUnknownFields:platform:encrypted:)();
      swift_bridgeObjectRelease();
      if (v9)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v7 += 16;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    unint64_t v5 = v28;
  }
  unint64_t v28 = v5;
  type metadata accessor for Config();
  static Config.defaultConfigPathEncrypted.getter();
  static DeviceUtilities.currentPlatform.getter();
  swift_allocObject();
  if (Config.init(configPath:allowUnknownFields:platform:encrypted:)())
  {
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_release();
    unint64_t v5 = v28;
  }
  if ((v5 & 0x8000000000000000) != 0 || (v5 & 0x4000000000000000) != 0)
  {
    unint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t)sub_10000F2EC(v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v27 = v10;
  sub_10001B7E0(&v27);
  swift_bridgeObjectRelease();
  uint64_t v11 = v27;
  if ((v27 & 0x8000000000000000) == 0 && (v27 & 0x4000000000000000) == 0)
  {
    uint64_t v12 = *(void *)(v27 + 16);
    if (v12) {
      goto LABEL_19;
    }
LABEL_30:
    swift_release();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_release();
  if (!v12) {
    goto LABEL_30;
  }
LABEL_19:
  unint64_t v13 = v12 - 1;
  if (__OFSUB__(v12, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((v11 & 0xC000000000000001) != 0)
  {
LABEL_33:
    uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_24;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 < *(void *)(v11 + 16))
  {
    uint64_t v14 = *(void *)(v11 + 8 * v13 + 32);
    swift_retain();
LABEL_24:
    swift_release();
    static Logger.config.getter();
    swift_retain_n();
    BOOL v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136380931;
      uint64_t v18 = Config.configPath.getter();
      uint64_t v26 = sub_10002E344(v18, v19, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2081;
      uint64_t v20 = Config.sortableConfigVersion.getter();
      uint64_t v26 = sub_10002E344(v20, v21, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Server.findConfig returning. { path=%{private}s, configVersion=%{private}s }", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v25);
    return v14;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_100020608(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100021200(0, &qword_100049BD0);
    sub_1000212C8();
    Set.Iterator.init(_cocoa:)();
    uint64_t v3 = v20;
    uint64_t v19 = v21;
    uint64_t v4 = v22;
    uint64_t v5 = v23;
    unint64_t v6 = v24;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v18 = (unint64_t)(v4 + 64) >> 6;
  if (v3 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v6)
  {
    uint64_t v10 = (v6 - 1) & v6;
    unint64_t v11 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v12 = v5;
    goto LABEL_29;
  }
  int64_t v14 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v14 < v18)
    {
      unint64_t v15 = *(void *)(v19 + 8 * v14);
      uint64_t v12 = v5 + 1;
      if (v15) {
        goto LABEL_28;
      }
      uint64_t v12 = v5 + 2;
      if (v5 + 2 >= v18) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v19 + 8 * v12);
      if (v15) {
        goto LABEL_28;
      }
      uint64_t v12 = v5 + 3;
      if (v5 + 3 >= v18) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v19 + 8 * v12);
      if (v15) {
        goto LABEL_28;
      }
      uint64_t v12 = v5 + 4;
      if (v5 + 4 >= v18) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v19 + 8 * v12);
      if (v15)
      {
LABEL_28:
        uint64_t v10 = (v15 - 1) & v15;
        unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
        id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v11);
        if (v13)
        {
          do
          {
            unsigned int v17 = [v13 processIdentifier];
            if (v17 == *(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid)) {
              break;
            }

            uint64_t v5 = v12;
            unint64_t v6 = v10;
            if ((v3 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!__CocoaSet.Iterator.next()()) {
              break;
            }
            sub_100021200(0, &qword_100049BD0);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v13 = v25;
            swift_unknownObjectRelease();
            uint64_t v12 = v5;
            uint64_t v10 = v6;
          }
          while (v25);
        }
        goto LABEL_33;
      }
      uint64_t v12 = v5 + 5;
      if (v5 + 5 < v18)
      {
        unint64_t v15 = *(void *)(v19 + 8 * v12);
        if (!v15)
        {
          uint64_t v16 = v5 + 6;
          while (v18 != v16)
          {
            unint64_t v15 = *(void *)(v19 + 8 * v16++);
            if (v15)
            {
              uint64_t v12 = v16 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_10000F9A4();
    return;
  }
  __break(1u);
}

uint64_t sub_1000208FC(void *a1)
{
  unsigned int v31 = [a1 processIdentifier];
  [a1 processIdentifier];
  uint64_t v3 = static Utilities.processName(for:)();
  if (!v4) {
    uint64_t v3 = static Constants.unknown.getter();
  }
  uint64_t v5 = v3;
  unint64_t v6 = v4;
  int v7 = [a1 processIdentifier];
  uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC15audioanalyticsd6Server_config];
  type metadata accessor for ClientServerInstance();
  uint64_t v9 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v10 = v1;
  unint64_t v11 = sub_10001FDE8(v7, v5, v6, v8, v10, v9);
  id v12 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP15audioanalyticsd14ServerProtocol_];
  [a1 setExportedInterface:v12];

  [a1 setExportedObject:v11];
  id v13 = *(NSObject **)&v10[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  int64_t v14 = (void *)swift_allocObject();
  v14[2] = v10;
  v14[3] = v11;
  v14[4] = a1;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_100020F00;
  *(void *)(v15 + 24) = v14;
  char v36 = sub_100020F1C;
  uint64_t v37 = v15;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_1000199D0;
  uint64_t v35 = &unk_100045D10;
  uint64_t v16 = v5;
  unsigned int v17 = _Block_copy(&aBlock);
  v10;
  swift_retain();
  id v18 = a1;
  swift_retain();
  swift_release();
  dispatch_sync(v13, v17);
  _Block_release(v17);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v13)
  {
    __break(1u);
  }
  else
  {
    uint64_t v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(_DWORD *)(v21 + 24) = v31;
    *(void *)(v21 + 32) = v16;
    *(void *)(v21 + 40) = v6;
    *(void *)(v21 + 48) = v11;
    char v36 = sub_100020FDC;
    uint64_t v37 = v21;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v33 = 1107296256;
    uint64_t v34 = sub_10001A18C;
    uint64_t v35 = &unk_100045D88;
    uint64_t v22 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    [v18 setInterruptionHandler:v22];
    _Block_release(v22);
    uint64_t v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v23;
    *(void *)(v24 + 24) = v11;
    *(void *)(v24 + 32) = v18;
    *(void *)(v24 + 40) = v16;
    *(void *)(v24 + 48) = v6;
    *(_DWORD *)(v24 + 56) = v31;
    char v36 = sub_100021040;
    uint64_t v37 = v24;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v33 = 1107296256;
    uint64_t v34 = sub_10001A18C;
    uint64_t v35 = &unk_100045DD8;
    uint64_t v25 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    id v26 = v18;
    swift_release();
    [v26 setInvalidationHandler:v25];
    _Block_release(v25);
    swift_bridgeObjectRetain();
    id v27 = v26;
    unint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 67174915;
      [v27 processIdentifier];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      *(_WORD *)(v30 + 8) = 2081;
      swift_bridgeObjectRetain();
      sub_10002E344(v16, v6, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "New connection. { pid=%{private}d, clientProcessName=%{private}s }", (uint8_t *)v30, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    [v27 activate];
    swift_release();
    swift_release();
    return 1;
  }
  return result;
}

uint64_t sub_100020EB8()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100020F00()
{
  sub_1000198E8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_100020F0C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100020F1C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100020F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100020F54()
{
  return swift_release();
}

uint64_t sub_100020F5C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020F94()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100020FDC()
{
  return sub_1000199F8(*(void *)(v0 + 16), *(_DWORD *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_100020FF0()
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 60, 7);
}

uint64_t sub_100021040()
{
  return sub_10001A1D0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(_DWORD *)(v0 + 56));
}

uint64_t sub_100021054()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10002108C()
{
  return sub_10001A94C(*(double *)(v0 + 24));
}

uint64_t sub_100021098()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000210E8()
{
  sub_10001AAFC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_DWORD *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 56));
}

uint64_t sub_1000210FC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002113C()
{
  return sub_100018458(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100021144(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100021150()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100021198()
{
  sub_100019EAC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_DWORD *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1000211A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000211F0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100021200(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10002123C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006164(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002128C()
{
  return sub_1000167B8(60, 0);
}

void sub_1000212B8()
{
}

uint64_t sub_1000212C0()
{
  return sub_1000189B0();
}

unint64_t sub_1000212C8()
{
  unint64_t result = qword_100049C28;
  if (!qword_100049C28)
  {
    sub_100021200(255, &qword_100049BD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100049C28);
  }
  return result;
}

void sub_100021330()
{
  sub_100018DF8(*(double *)(v0 + 24));
}

void sub_10002133C()
{
  sub_10001923C(*(double *)(v0 + 24));
}

uint64_t sub_100021348()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100021380()
{
  return sub_1000184BC(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_10002138C()
{
  return _swift_deallocObject(v0, 20, 7);
}

uint64_t sub_10002139C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000213D4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002140C()
{
  unint64_t v1 = (int *)(type metadata accessor for FeatureInfo(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = v6 + v1[11];
  uint64_t v9 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_100021594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000215F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for FeatureInfo(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000346D8(a1, v5, v6, v1 + v4, v7);
}

uint64_t sub_100021698()
{
  return sub_1000211A8(&qword_100049C40, (void (*)(uint64_t))type metadata accessor for FeatureInfo);
}

uint64_t sub_1000216E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100015508(a2, *a1, a3);
}

unint64_t sub_1000216F4()
{
  return (*(void *)(*(void *)(type metadata accessor for FeatureInfo(0) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t sub_100021764(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(v3 + 36);
  uint64_t v5 = type metadata accessor for SystemMonitorConfig.DataType();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_100021854(uint64_t a1, uint64_t a2)
{
  sub_1000219D4(a1, a2, type metadata accessor for FeatureInfo);

  return type metadata accessor for FeatureInfo(0);
}

uint64_t sub_100021894(uint64_t a1, uint64_t a2)
{
  return sub_10003A720(a2, a1);
}

Swift::Int sub_1000218A4()
{
  return sub_1000390F8();
}

uint64_t sub_1000218C8(uint64_t a1, uint64_t a2)
{
  type metadata accessor for FeatureInfo(0);

  return sub_100021594(a1, a2);
}

uint64_t sub_10002190C(uint64_t a1)
{
  uint64_t v2 = sub_100005E64((uint64_t *)&unk_100049C30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002196C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E64((uint64_t *)&unk_100049C30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000219D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100021A3C()
{
  uint64_t v1 = type metadata accessor for Message();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100021B08()
{
  uint64_t v1 = *(void *)(type metadata accessor for Message() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_1000177DC(v2, v3);
}

uint64_t sub_100021B6C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100021BA4()
{
  return sub_100019540();
}

uint64_t sub_100021C34()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.session.getter();
  swift_retain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    v16[2] = *(void *)(v1 + 24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "requestMessage(): Flushing all requests. { reporterID=%lld }", v8, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_1000228A0(v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = v10[2];
  if (v11)
  {
    swift_bridgeObjectRetain();
    id v12 = v10 + 5;
    do
    {
      id v13 = (void (*)(void *, uint64_t *))*(v12 - 1);
      uint64_t v15 = 0;
      v16[0] = 0;
      swift_retain();
      v13(v16, &v15);
      swift_release();
      v12 += 2;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021E50()
{
  sub_100021C34();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t _s16RetainedMessagesCMa()
{
  return self;
}

uint64_t sub_100021EB0(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v29 = *(void *)(v4 - 8);
  uint64_t v30 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Message();
  unint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v28 = (uint8_t *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v12 = (char *)&v27 - v11;
  id v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  unint64_t v31 = a1;
  v13((char *)&v27 - v11, a1, v7);
  LODWORD(a1) = Message.category.getter();
  unsigned __int16 v14 = Message.type.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  uint64_t v15 = v2;
  uint64_t v16 = sub_100022338(a1 | ((unint64_t)v14 << 32));
  unsigned int v17 = v16 + 2;
  swift_beginAccess();
  if (*((void *)v16[2].isa + 2))
  {
    unint64_t v8 = v31;
    static Logger.session.getter();
    swift_retain();
    id v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    uint64_t v7 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v2 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v2 = 134217984;
      v33[0] = *((void *)v15 + 3);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v7, "sendMesssage(): Stored message found callback. Calling callback. { reporterID=%lld }", v2, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    unint64_t isa = v8;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v30);
    swift_beginAccess();
    if (*((void *)v17->isa + 2))
    {
      id v26 = (void (*)(uint64_t *, uint64_t *))*((void *)v17->isa + 4);
      swift_retain();
      sub_1000263E4(0, 1);
      swift_endAccess();
      sub_100022B48();
      uint64_t v32 = Message.flattenToAnyDictionary()();
      v33[0] = 0;
      v26(v33, &v32);
      swift_bridgeObjectRelease();
      swift_release();
      return swift_release();
    }
    __break(1u);
  }
  else
  {
    uint64_t v2 = v28;
    v13((char *)v28, v31, v7);
    id v18 = v16 + 3;
    swift_beginAccess();
    unint64_t isa = (unint64_t)v16[3].isa;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16[3].unint64_t isa = (Class)isa;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_5;
    }
  }
  unint64_t isa = sub_10002E0DC(0, *(void *)(isa + 16) + 1, 1, isa);
  v18->unint64_t isa = (Class)isa;
LABEL_5:
  unint64_t v23 = *(void *)(isa + 16);
  unint64_t v22 = *(void *)(isa + 24);
  if (v23 >= v22 >> 1)
  {
    unint64_t isa = sub_10002E0DC(v22 > 1, v23 + 1, 1, isa);
    v18->unint64_t isa = (Class)isa;
  }
  *(void *)(isa + 16) = v23 + 1;
  (*(void (**)(unint64_t, uint8_t *, uint64_t))(v8 + 32))(isa+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v23, v2, v7);
  v24.unint64_t isa = v18->isa;
  swift_endAccess();
  if (*((void *)v24.isa + 2) < 0xBuLL) {
    return swift_release();
  }
  uint64_t result = swift_beginAccess();
  if (*((void *)v18->isa + 2))
  {
    sub_100026558(0, 1);
    swift_endAccess();
    return swift_release();
  }
  __break(1u);
  return result;
}

void *sub_100022338(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (*(void *)(v4 + 16) && (unint64_t v6 = sub_100023198(v5), (v7 & 1) != 0))
  {
    unint64_t v8 = *(void **)(*(void *)(v4 + 56) + 8 * v6);
    swift_endAccess();
    swift_retain();
  }
  else
  {
    swift_endAccess();
    uint64_t v9 = *(void *)(v2 + 24);
    _s16RetainedMessagesC12MessageQueueCMa();
    unint64_t v8 = (void *)swift_allocObject();
    v8[4] = v9;
    v8[2] = &_swiftEmptyArrayStorage;
    v8[3] = &_swiftEmptyArrayStorage;
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0x8000000000000000;
    sub_100024424((uint64_t)v8, v5, isUniquelyReferenced_nonNull_native);
    *(void *)(v2 + 16) = v12;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  return v8;
}

uint64_t sub_100022458(objc_class *a1, objc_class *a2, unsigned int a3, unsigned __int16 a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Message();
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v17 = sub_100022338(a3 | ((unint64_t)a4 << 32));
  id v18 = v17 + 3;
  swift_beginAccess();
  if (!*(void *)(v17[3] + 16))
  {
    os_log_type_t v19 = swift_allocObject();
    v19[2].unint64_t isa = a1;
    v19[3].unint64_t isa = a2;
    unint64_t v23 = (char **)(v17 + 2);
    swift_beginAccess();
    NSObject v24 = (char *)v17[2];
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    void v17[2] = v24;
    if (isUniquelyReferenced_nonNull_native)
    {
LABEL_5:
      unint64_t v27 = *((void *)v24 + 2);
      unint64_t v26 = *((void *)v24 + 3);
      if (v27 >= v26 >> 1)
      {
        NSObject v24 = sub_10002DFA0((char *)(v26 > 1), v27 + 1, 1, v24);
        *unint64_t v23 = v24;
      }
      *((void *)v24 + 2) = v27 + 1;
      unint64_t v28 = &v24[16 * v27];
      *((void *)v28 + 4) = sub_100026948;
      *((void *)v28 + 5) = v19;
      swift_endAccess();
      sub_100022B48();
      return swift_release();
    }
LABEL_15:
    NSObject v24 = sub_10002DFA0(0, *((void *)v24 + 2) + 1, 1, v24);
    *unint64_t v23 = v24;
    goto LABEL_5;
  }
  uint64_t v35 = a1;
  static Logger.session.getter();
  swift_retain();
  os_log_type_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v34 = a2;
  if (v21)
  {
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v22 = 134217984;
    uint64_t v38 = *(void *)(v5 + 24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "requestMessage(): Registered callback found message. Calling callback. { reporterID=%lld }", v22, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  uint64_t v30 = *(void (**)(char *, uint64_t))(v14 + 8);
  NSObject v24 = (char *)(v14 + 8);
  v30(v16, v13);
  swift_beginAccess();
  unint64_t v23 = (char **)v35;
  if (!*(void *)(*v18 + 16))
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v32 = v36;
  uint64_t v31 = v37;
  (*(void (**)(char *, unint64_t, uint64_t))(v36 + 16))(v12, *v18 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80)), v37);
  sub_100026558(0, 1);
  swift_endAccess();
  if (*(void *)(*v18 + 16) < 0xBuLL)
  {
LABEL_13:
    uint64_t v33 = Message.flattenToAnyDictionary()();
    ((void (*)(void, uint64_t))v23)(0, v33);
    swift_release();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v12, v31);
  }
  uint64_t result = swift_beginAccess();
  if (*(void *)(*v18 + 16))
  {
    sub_100026558(0, 1);
    swift_endAccess();
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void *sub_1000228A0(uint64_t a1)
{
  uint64_t v1 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = (void *)swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      int64_t v7 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_23;
      }
      uint64_t v10 = *(void *)(v1 + 8 * v7);
      if (!v10)
      {
        int64_t v7 = v9 + 2;
        if (v9 + 2 >= v5) {
          goto LABEL_23;
        }
        uint64_t v10 = *(void *)(v1 + 8 * v7);
        if (!v10)
        {
          int64_t v7 = v9 + 3;
          if (v9 + 3 >= v5) {
            goto LABEL_23;
          }
          uint64_t v10 = *(void *)(v1 + 8 * v7);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_5:
    swift_beginAccess();
    uint64_t v8 = swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_100026110(v8);
  }
  int64_t v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_23:
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v10 = *(void *)(v1 + 8 * v11);
  if (v10)
  {
    int64_t v7 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v7);
    ++v11;
    if (v10) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

Swift::Int sub_100022A2C()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  Swift::UInt16 v2 = *(_WORD *)(v0 + 4);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_100022A8C()
{
  Swift::UInt16 v1 = *(_WORD *)(v0 + 4);
  Hasher._combine(_:)(*(_DWORD *)v0);
  Hasher._combine(_:)(v1);
}

Swift::Int sub_100022ACC()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  Swift::UInt16 v2 = *(_WORD *)(v0 + 4);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_100022B28(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(unsigned __int16 *)(a1 + 4) == *(unsigned __int16 *)(a2 + 4);
}

uint64_t sub_100022B48()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + 16;
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 16) + 16) >= 0xBuLL)
  {
    uint64_t result = swift_beginAccess();
    if (*(void *)(*(void *)v6 + 16))
    {
      uint64_t v8 = *(void (**)(void *, uint64_t *))(*(void *)v6 + 32);
      swift_retain();
      sub_1000263E4(0, 1);
      swift_endAccess();
      static Logger.session.getter();
      swift_retain();
      int64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v9, v10))
      {
        int64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)int64_t v11 = 134217984;
        v14[0] = *(void *)(v1 + 32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "requestMessage(): Exceeded stored callback cache. Flushing oldest callback. { reporterID=%lld }", v11, 0xCu);
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v13 = 0;
      v14[0] = 0;
      v8(v14, &v13);
      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100022D70()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t _s16RetainedMessagesC12MessageQueueCMa()
{
  return self;
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwCP(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 6)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
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
  *(unsigned char *)(result + 6) = v3;
  return result;
}

ValueMetadata *_s16RetainedMessagesC16CategoryTypePairVMa()
{
  return &_s16RetainedMessagesC16CategoryTypePairVN;
}

unint64_t sub_100022E4C()
{
  unint64_t result = qword_100049E08;
  if (!qword_100049E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100049E08);
  }
  return result;
}

unint64_t sub_100022EA0(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100024F10(a1, a2, v4);
}

unint64_t sub_100022F18(Swift::UInt32 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();

  return sub_100024FF4(a1, v2);
}

unint64_t sub_100022F84(uint64_t a1)
{
  Hasher.init(_seed:)();
  type metadata accessor for SystemMonitorConfig.MonitorType();
  sub_100026978(&qword_100049E30, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)();
  type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  type metadata accessor for SystemMonitorConfig.DataType();
  sub_100026978(&qword_100049E38, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();

  return sub_100025090(a1, v2);
}

unint64_t sub_100023154(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return sub_10002542C(a1, v2);
}

unint64_t sub_100023198(unint64_t a1)
{
  unint64_t v2 = HIDWORD(a1);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Hasher._combine(_:)(v2);
  Swift::Int v3 = Hasher._finalize()();

  return sub_1000254C8(a1 & 0xFFFFFFFFFFFFLL, v3);
}

uint64_t sub_100023214(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_100005E64(&qword_100049E18);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    int64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  uint64_t *v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

uint64_t sub_1000234CC(uint64_t a1, int a2)
{
  Swift::Int v3 = v2;
  uint64_t v49 = type metadata accessor for SimpleType();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_100005E64(&qword_100049690);
  int v47 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  int v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    int64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          Swift::Int v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  Swift::Int v3 = v42;
  int64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *Swift::Int v3 = v9;
  return result;
}

uint64_t sub_1000238B4(uint64_t a1, char a2)
{
  uint64_t v4 = *v2;
  sub_100005E64(&qword_100049680);
  char v35 = a2;
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v6 = result;
  if (*(void *)(v4 + 16))
  {
    int64_t v7 = 0;
    unint64_t v34 = (void *)(v4 + 64);
    uint64_t v8 = 1 << *(unsigned char *)(v4 + 32);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = result + 64;
    while (1)
    {
      if (v10)
      {
        unint64_t v18 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v19 = v18 | (v7 << 6);
      }
      else
      {
        int64_t v20 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        uint64_t result = v4 + 64;
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v34[v20];
        ++v7;
        if (!v21)
        {
          int64_t v7 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v34[v7];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if (v35)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v4 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v4 + 16) = 0;
              }
              break;
            }
            unint64_t v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v7 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v7 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v34[v7];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v7 = v22;
          }
        }
LABEL_30:
        unint64_t v10 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v7 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(v4 + 48) + v27;
      Swift::UInt32 v29 = *(_DWORD *)v28;
      Swift::UInt16 v30 = *(_WORD *)(v28 + 4);
      uint64_t v31 = *(void *)(*(void *)(v4 + 56) + v27);
      if ((v35 & 1) == 0) {
        swift_retain();
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v29);
      Hasher._combine(_:)(v30);
      uint64_t result = Hasher._finalize()();
      uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v13 = result & ~v12;
      unint64_t v14 = v13 >> 6;
      if (((-1 << v13) & ~*(void *)(v11 + 8 * (v13 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v13) & ~*(void *)(v11 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v12) >> 6;
        do
        {
          if (++v14 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v14 == v24;
          if (v14 == v24) {
            unint64_t v14 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v11 + 8 * v14);
        }
        while (v26 == -1);
        unint64_t v15 = __clz(__rbit64(~v26)) + (v14 << 6);
      }
      *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      uint64_t v17 = *(void *)(v6 + 48) + v16;
      *(_DWORD *)uint64_t v17 = v29;
      *(_WORD *)(v17 + 4) = v30;
      *(void *)(*(void *)(v6 + 56) + v16) = v31;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v2 = v6;
  return result;
}

uint64_t sub_100023BB8(uint64_t a1, int a2)
{
  Swift::Int v3 = v2;
  uint64_t v43 = type metadata accessor for Message();
  uint64_t v5 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_100005E64(&qword_1000496B8);
  int v41 = a2;
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v9 = result;
  if (*(void *)(v7 + 16))
  {
    unint64_t v37 = v2;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)(v7 + 64);
    uint64_t v39 = (void *)(v7 + 64);
    uint64_t v12 = 1 << *(unsigned char *)(v7 + 32);
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v11;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v40 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    unint64_t v15 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v14)
      {
        unint64_t v18 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v19 = v18 | (v10 << 6);
      }
      else
      {
        int64_t v20 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v39;
        if (v20 >= v38) {
          goto LABEL_34;
        }
        unint64_t v21 = v39[v20];
        ++v10;
        if (!v21)
        {
          int64_t v10 = v20 + 1;
          if (v20 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v21 = v39[v10];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v38)
            {
LABEL_34:
              if ((v41 & 1) == 0)
              {
                uint64_t result = swift_release();
                Swift::Int v3 = v37;
                goto LABEL_41;
              }
              uint64_t v36 = 1 << *(unsigned char *)(v7 + 32);
              if (v36 >= 64) {
                bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v39 = -1 << v36;
              }
              Swift::Int v3 = v37;
              *(void *)(v7 + 16) = 0;
              break;
            }
            unint64_t v21 = v39[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v10 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_43;
                }
                if (v10 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v21 = v39[v10];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v10 = v22;
          }
        }
LABEL_21:
        unint64_t v14 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v10 << 6);
      }
      uint64_t v23 = *(void *)(v7 + 56);
      uint64_t v24 = v7;
      Swift::UInt32 v25 = *(_DWORD *)(*(void *)(v7 + 48) + 4 * v19);
      uint64_t v26 = v5;
      uint64_t v27 = *(void *)(v5 + 72);
      uint64_t v28 = v23 + v27 * v19;
      if (v41) {
        (*v15)(v42, v28, v43);
      }
      else {
        (*v40)(v42, v28, v43);
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v25);
      uint64_t result = Hasher._finalize()();
      uint64_t v29 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v17 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(void *)(v9 + 48) + 4 * v17) = v25;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v15)(*(void *)(v9 + 56) + v27 * v17, v42, v43);
      ++*(void *)(v9 + 16);
      uint64_t v5 = v26;
      uint64_t v7 = v24;
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *Swift::Int v3 = v9;
  return result;
}

uint64_t sub_100023F70(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = type metadata accessor for FeatureState(0);
  uint64_t v30 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FeatureInfo(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v2;
  sub_100005E64(&qword_1000496C8);
  char v13 = a2;
  unint64_t v31 = (void *)static _DictionaryStorage.resize(original:capacity:move:)();
  if (*(void *)(v12 + 16))
  {
    uint64_t v29 = v2;
    uint64_t v14 = 1 << *(unsigned char *)(v12 + 32);
    unint64_t v15 = (void *)(v12 + 64);
    uint64_t v16 = -1;
    if (v14 < 64) {
      uint64_t v16 = ~(-1 << v14);
    }
    unint64_t v17 = v16 & *(void *)(v12 + 64);
    int64_t v18 = (unint64_t)(v14 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v20 = 0;
    while (1)
    {
      if (v17)
      {
        unint64_t v21 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        unint64_t v22 = v21 | (v20 << 6);
      }
      else
      {
        int64_t v23 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v23 >= v18) {
          goto LABEL_23;
        }
        unint64_t v24 = v15[v23];
        ++v20;
        if (!v24)
        {
          int64_t v20 = v23 + 1;
          if (v23 + 1 >= v18) {
            goto LABEL_23;
          }
          unint64_t v24 = v15[v20];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v18)
            {
LABEL_23:
              swift_release();
              if ((v13 & 1) == 0)
              {
                uint64_t result = swift_release();
                Swift::Int v3 = v29;
                goto LABEL_30;
              }
              uint64_t v27 = 1 << *(unsigned char *)(v12 + 32);
              if (v27 >= 64) {
                bzero((void *)(v12 + 64), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *unint64_t v15 = -1 << v27;
              }
              Swift::Int v3 = v29;
              *(void *)(v12 + 16) = 0;
              break;
            }
            unint64_t v24 = v15[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v20 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_32;
                }
                if (v20 >= v18) {
                  goto LABEL_23;
                }
                unint64_t v24 = v15[v20];
                ++v25;
                if (v24) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v20 = v25;
          }
        }
LABEL_20:
        unint64_t v17 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v20 << 6);
      }
      uint64_t v26 = *(void *)(v12 + 48) + *(void *)(v9 + 72) * v22;
      if (v13)
      {
        sub_1000067B8(v26, (uint64_t)v11, type metadata accessor for FeatureInfo);
        sub_1000067B8(*(void *)(v12 + 56) + *(void *)(v30 + 72) * v22, (uint64_t)v7, type metadata accessor for FeatureState);
      }
      else
      {
        sub_1000219D4(v26, (uint64_t)v11, type metadata accessor for FeatureInfo);
        sub_1000219D4(*(void *)(v12 + 56) + *(void *)(v30 + 72) * v22, (uint64_t)v7, type metadata accessor for FeatureState);
      }
      uint64_t result = sub_1000249F4((uint64_t)v11, (uint64_t)v7, v31);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  *Swift::Int v3 = v31;
  return result;
}

uint64_t sub_1000242E8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100023154(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10002554C();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_100023214(result, a3 & 1);
  uint64_t result = sub_100023154(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t sub_100024424(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  uint64_t v8 = a2 & 0xFFFFFFFFFFFFLL;
  unint64_t v10 = sub_100023198(a2 & 0xFFFFFFFFFFFFLL);
  uint64_t v11 = v7[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v7[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      unint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1000259B4();
    goto LABEL_7;
  }
  sub_1000238B4(v13, a3 & 1);
  unint64_t v19 = sub_100023198(v8);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_15:
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  uint64_t v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:

  return sub_100024C74(v10, v8, a1, v16);
}

uint64_t sub_10002454C(uint64_t a1, Swift::UInt32 a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_100022F18(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100025B68();
      goto LABEL_7;
    }
    sub_100023BB8(v13, a3 & 1);
    unint64_t v24 = sub_100022F18(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for AudioEventCategory(0);
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = type metadata accessor for Message();
    uint64_t v19 = *(void *)(v18 - 8);
    char v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:

  return sub_100024CC8(v10, a2, a1, v16);
}

uint64_t sub_1000246B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100022EA0(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1000256F0();
      goto LABEL_7;
    }
    sub_1000234CC(v15, a4 & 1);
    unint64_t v26 = sub_100022EA0(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = type metadata accessor for SimpleType();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_100024D74(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100024834(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for FeatureInfo(0);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = (void *)*v3;
  unint64_t v13 = sub_100022F84(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 < v16 || (a3 & 1) == 0)
  {
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_100025DF8();
      goto LABEL_7;
    }
    sub_100023F70(v16, a3 & 1);
    unint64_t v23 = sub_100022F84(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      unint64_t v13 = v23;
      uint64_t v19 = *v4;
      if (v17) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1000219D4(a2, (uint64_t)v10, type metadata accessor for FeatureInfo);
      return sub_100024E24(v13, (uint64_t)v10, a1, v19);
    }
LABEL_15:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v19 = *v4;
  if ((v17 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v20 = v19[7];
  uint64_t v21 = v20 + *(void *)(*(void *)(type metadata accessor for FeatureState(0) - 8) + 72) * v13;

  return sub_1000269C0(a1, v21);
}

uint64_t sub_1000249F4(uint64_t a1, uint64_t a2, void *a3)
{
  Hasher.init(_seed:)();
  type metadata accessor for SystemMonitorConfig.MonitorType();
  sub_100026978(&qword_100049E30, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)();
  uint64_t v6 = type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  type metadata accessor for SystemMonitorConfig.DataType();
  sub_100026978(&qword_100049E38, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)();
  Hasher._finalize()();
  unint64_t v7 = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a3 + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v7;
  sub_1000067B8(a1, a3[6] + *(void *)(*(void *)(v6 - 8) + 72) * v7, type metadata accessor for FeatureInfo);
  uint64_t v8 = a3[7];
  uint64_t v9 = type metadata accessor for FeatureState(0);
  uint64_t result = sub_1000067B8(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * v7, type metadata accessor for FeatureState);
  ++a3[2];
  return result;
}

unint64_t sub_100024C74(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = a4[6] + 8 * result;
  *(_DWORD *)uint64_t v4 = a2;
  *(_WORD *)(v4 + 4) = WORD2(a2);
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

uint64_t sub_100024CC8(unint64_t a1, int a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_DWORD *)(a4[6] + 4 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for Message();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_100024D74(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for SimpleType();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_100024E24(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for FeatureInfo(0);
  sub_1000067B8(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, type metadata accessor for FeatureInfo);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for FeatureState(0);
  uint64_t result = sub_1000067B8(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, type metadata accessor for FeatureState);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

unint64_t sub_100024F10(uint64_t a1, uint64_t a2, uint64_t a3)
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100024FF4(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_100025090(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (int *)type metadata accessor for FeatureInfo(0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    return v10;
  }
  uint64_t v11 = *(void *)(v6 + 72);
  uint64_t v33 = ~v9;
  uint64_t v34 = v11;
  while (1)
  {
    sub_1000219D4(*(void *)(v2 + 48) + v34 * v10, (uint64_t)v8, type metadata accessor for FeatureInfo);
    type metadata accessor for SystemMonitorConfig.MonitorType();
    sub_100026978(&qword_100049E40, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (v37 == v35 && v38 == v36)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        goto LABEL_4;
      }
    }
    uint64_t v15 = v5[5];
    uint64_t v16 = *(void *)&v8[v15];
    uint64_t v17 = *(void *)&v8[v15 + 8];
    uint64_t v18 = (void *)(a1 + v15);
    BOOL v19 = v16 == *v18 && v17 == v18[1];
    if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v20 = v5[6];
    uint64_t v21 = *(void *)&v8[v20];
    uint64_t v22 = *(void *)&v8[v20 + 8];
    unint64_t v23 = (void *)(a1 + v20);
    if ((v21 != *v23 || v22 != v23[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v24 = v5[7];
    uint64_t v25 = *(void *)&v8[v24];
    uint64_t v26 = *(void *)&v8[v24 + 8];
    char v27 = (void *)(a1 + v24);
    if ((v25 != *v27 || v26 != v27[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v28 = v5[8];
    uint64_t v29 = *(void *)&v8[v28];
    uint64_t v30 = *(void *)&v8[v28 + 8];
    unint64_t v31 = (void *)(a1 + v28);
    if ((v29 != *v31 || v30 != v31[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_4;
    }
    type metadata accessor for SystemMonitorConfig.DataType();
    sub_100026978(&qword_100049E48, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (v37 == v35 && v38 == v36) {
      break;
    }
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_29;
    }
LABEL_4:
    sub_10000C728((uint64_t)v8);
    unint64_t v10 = (v10 + 1) & v33;
    if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      return v10;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_29:
  sub_10000C728((uint64_t)v8);
  return v10;
}

unint64_t sub_10002542C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1000254C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      if (__PAIR64__(*(unsigned __int16 *)(*(void *)(v2 + 48) + 8 * result + 4), *(_DWORD *)(*(void *)(v2 + 48) + 8 * result)) == __PAIR64__(WORD2(a1), a1))break; {
      unint64_t result = (result + 1) & v6;
      }
    }
    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

void *sub_10002554C()
{
  uint64_t v1 = v0;
  sub_100005E64(&qword_100049E18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000256F0()
{
  uint64_t v35 = type metadata accessor for SimpleType();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E64(&qword_100049690);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    unint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  unint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    unint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    int64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    unint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *unint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1000259B4()
{
  uint64_t v1 = v0;
  sub_100005E64(&qword_100049680);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    int v18 = *(_DWORD *)v17;
    LOWORD(v17) = *(_WORD *)(v17 + 4);
    uint64_t v19 = *(void *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    *(_DWORD *)uint64_t v20 = v18;
    *(_WORD *)(v20 + 4) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v19;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100025B68()
{
  uint64_t v1 = type metadata accessor for Message();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E64(&qword_1000496B8);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *int64_t v23 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * v15);
    unint64_t v18 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v18, v1);
    *(_DWORD *)(*(void *)(v7 + 48) + v16) = v17;
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v18, v4, v1);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_100025DF8()
{
  uint64_t v1 = type metadata accessor for FeatureState(0);
  uint64_t v28 = *(void *)(v1 - 8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for FeatureInfo(0);
  uint64_t v27 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E64(&qword_1000496C8);
  uint64_t v24 = v0;
  uint64_t v7 = *v0;
  uint64_t v8 = static _DictionaryStorage.copy(original:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *uint64_t v24 = v9;
    return result;
  }
  unint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    unint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 64);
  uint64_t v25 = v7 + 64;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v20 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v12);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v27 + 72) * v17;
    sub_1000219D4(*(void *)(v7 + 48) + v18, (uint64_t)v6, type metadata accessor for FeatureInfo);
    unint64_t v19 = *(void *)(v28 + 72) * v17;
    sub_1000219D4(*(void *)(v7 + 56) + v19, (uint64_t)v3, type metadata accessor for FeatureState);
    sub_1000067B8((uint64_t)v6, *(void *)(v9 + 48) + v18, type metadata accessor for FeatureInfo);
    unint64_t result = (void *)sub_1000067B8((uint64_t)v3, *(void *)(v9 + 56) + v19, type metadata accessor for FeatureState);
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_23;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100026110(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_10002DFA0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  sub_100005E64(&qword_100049E10);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_100026274(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t result = sub_10002DD18(result, v15, 1, v6);
    uint64_t v6 = result;
  }
  unint64_t v16 = &v6[16 * a1 + 32];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v17 = *((void *)v6 + 2);
  BOOL v18 = __OFSUB__(v17, a2);
  uint64_t v19 = v17 - a2;
  if (v18) {
    goto LABEL_26;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t result = v16 + 16;
    int64_t v20 = &v6[16 * a2 + 32];
    if (v16 + 16 != v20 || result >= &v20[16 * v19]) {
      uint64_t result = (char *)memmove(result, v20, 16 * v19);
    }
    uint64_t v21 = *((void *)v6 + 2);
    BOOL v18 = __OFADD__(v21, v10);
    uint64_t v22 = v21 + v10;
    if (!v18)
    {
      *((void *)v6 + 2) = v22;
LABEL_20:
      *(void *)unint64_t v16 = a3;
      *((void *)v16 + 1) = a4;
      *int64_t v4 = v6;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000263E4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  int64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    int64_t v4 = sub_10002DFA0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  sub_100005E64(&qword_100049E10);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = *((void *)v4 + 2);
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    unint64_t v16 = &v4[16 * a2 + 32];
    if (a1 != a2 || &v4[16 * a1 + 32] >= &v16[16 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[16 * a1 + 32], v16, 16 * v15);
    }
    uint64_t v17 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      *((void *)v4 + 2) = v18;
LABEL_20:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100026558(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_10002E0DC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100026740(uint64_t a1, uint64_t a2)
{
  return sub_100026780(a1, a2, (uint64_t (*)(void))sub_10002DE48, &qword_100049E20);
}

uint64_t sub_100026760(uint64_t a1, uint64_t a2)
{
  return sub_100026780(a1, a2, (uint64_t (*)(void))sub_10002DE5C, &qword_100049E28);
}

uint64_t sub_100026780(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t *a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v10 = a1 - a2;
  if (__OFSUB__(0, v9))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (__OFADD__(v7, v10))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v7 - v9 > *(void *)(v6 + 24) >> 1) {
    uint64_t v6 = a3();
  }
  sub_100005E64(a4);
  uint64_t result = swift_arrayDestroy();
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v14 = *(void *)(v6 + 16);
  BOOL v15 = __OFSUB__(v14, a2);
  uint64_t v16 = v14 - a2;
  if (v15) {
    goto LABEL_23;
  }
  if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = (const void *)(v6 + 32 + 40 * a2);
    if (a1 != a2 || v6 + 32 + 40 * a1 >= (unint64_t)v17 + 40 * v16) {
      uint64_t result = (uint64_t)memmove((void *)(v6 + 32 + 40 * a1), v17, 40 * v16);
    }
    uint64_t v18 = *(void *)(v6 + 16);
    BOOL v15 = __OFADD__(v18, v10);
    uint64_t v19 = v18 - v9;
    if (!v15)
    {
      *(void *)(v6 + 16) = v19;
LABEL_17:
      *unint64_t v4 = v6;
      return result;
    }
    goto LABEL_24;
  }
LABEL_25:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100026910()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026948(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_100026978(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000269C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100026A24(uint64_t a1, Swift::UInt32 a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005E64(&qword_100049FF0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Message();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_10003379C(a1, &qword_100049FF0);
    unint64_t v13 = sub_100022F18(a2);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_100025B68();
        uint64_t v17 = v21;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, v9);
      sub_10002EBB0(v15, v17);
      *uint64_t v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_10003379C((uint64_t)v8, &qword_100049FF0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_10002454C((uint64_t)v12, a2, v18);
    *uint64_t v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100026C80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005E64((uint64_t *)&unk_100049C30);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for FeatureState(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_10003379C(a1, (uint64_t *)&unk_100049C30);
    sub_10000C1A0(a2, (uint64_t)v8);
    sub_10000C728(a2);
    return sub_10003379C((uint64_t)v8, (uint64_t *)&unk_100049C30);
  }
  else
  {
    sub_10000C784(a1, (uint64_t)v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100024834((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16;
    swift_bridgeObjectRelease();
    return sub_10000C728(a2);
  }
}

uint64_t sub_100026E2C()
{
  type metadata accessor for OsTransactionHandler();
  static OsTransactionHandler.shared.getter();
  OsTransactionHandler.sessionStarted(for:)(*(void *)(v0 + 16));
  swift_release();
  uint64_t v1 = *(NSObject **)(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_100033720;
  *(void *)(v2 + 24) = v0;
  v5[4] = sub_10000C0E8;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1000199D0;
  v5[3] = &unk_100046490;
  uint64_t v3 = _Block_copy(v5);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100026F90(uint64_t a1, uint64_t a2, int a3, __int16 a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DispatchQoS();
  uint64_t v14 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(void *)(v5 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v5;
  *(void *)(v17 + 24) = a1;
  *(void *)(v17 + 32) = a2;
  *(_DWORD *)(v17 + 40) = a3;
  *(_WORD *)(v17 + 44) = a4;
  aBlock[4] = sub_100033664;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_1000463A0;
  char v18 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  BOOL v22 = _swiftEmptyArrayStorage;
  sub_10003385C((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v21);
  return swift_release();
}

uint64_t sub_100027268@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  sub_100006754(v1 + 96, (uint64_t)&v8, &qword_100049818);
  if (!v9)
  {
    sub_10003379C((uint64_t)&v8, &qword_100049818);
    uint64_t v3 = type metadata accessor for NonOwningSession();
    uint64_t v4 = swift_allocObject();
    swift_weakInit();
    uint64_t v5 = *(void *)(v1 + 40);
    *(void *)(v4 + 16) = *(void *)(v1 + 32);
    *(void *)(v4 + 24) = v5;
    *(void *)(v4 + 32) = *(void *)(v1 + 16);
    *(unsigned char *)(v4 + 40) = *(unsigned char *)(v1 + 24);
    *(_DWORD *)(v4 + 44) = *(_DWORD *)(v1 + 48);
    *(void *)(v4 + 48) = *(void *)(v1 + 56);
    swift_weakAssign();
    uint64_t v9 = v3;
    uint64_t v10 = sub_10003385C(&qword_10004A050, (void (*)(uint64_t))type metadata accessor for NonOwningSession);
    *(void *)&long long v8 = v4;
    sub_10003355C((uint64_t)&v8, (uint64_t)v7);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1000335C0((uint64_t)v7, v1 + 96, &qword_100049818);
    swift_endAccess();
  }
  return sub_100033388(&v8, a1);
}

uint64_t sub_1000273DC(unint64_t a1)
{
  unint64_t v99 = a1;
  uint64_t v105 = type metadata accessor for Config.WorkerConfigs();
  uint64_t v106 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  unint64_t v104 = (char *)&v91 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005E64(&qword_100049FF0);
  __chkstk_darwin(v3 - 8);
  uint64_t v93 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OperatingSystem();
  *(void *)&long long v101 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = type metadata accessor for Message.Metadata();
  uint64_t v97 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v94 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for Message();
  uint64_t v98 = *(void *)(v110 - 8);
  uint64_t v9 = __chkstk_darwin(v110);
  uint64_t v103 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v91 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v91 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  v102 = (char *)&v91 - v18;
  __chkstk_darwin(v17);
  unint64_t v113 = (char *)&v91 - v19;
  uint64_t v20 = type metadata accessor for DispatchPredicate();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (uint64_t *)((char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_super v114 = v1;
  uint64_t v24 = *(void **)((char *)v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v23 = v24;
  (*(void (**)(void *, void, uint64_t))(v21 + 104))(v23, enum case for DispatchPredicate.onQueue(_:), v20);
  id v25 = v24;
  char v26 = _dispatchPreconditionTest(_:)();
  uint64_t v28 = *(void (**)(void *, uint64_t))(v21 + 8);
  uint64_t v27 = v21 + 8;
  v28(v23, v20);
  if ((v26 & 1) == 0)
  {
    __break(1u);
LABEL_42:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v27 = OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled;
  if (*((unsigned char *)v114 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled)) {
    goto LABEL_5;
  }
  if (qword_100049638 != -1) {
    goto LABEL_42;
  }
LABEL_4:
  uint64_t v29 = v114;
  sub_10002A8E0(qword_10004A3B0);
  *((unsigned char *)v29 + v27) = 1;
LABEL_5:
  uint64_t v30 = (char *)v114 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
  swift_retain_n();
  uint64_t v109 = v30;
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 134218240;
    uint64_t v34 = v114;
    uint64_t v115 = v114[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v33 + 12) = 1024;
    int v35 = *((unsigned __int8 *)v34 + 24);
    swift_release();
    LODWORD(v115) = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Processing message. { reporterID=%lld, singleServerSession=%{BOOL}d }", (uint8_t *)v33, 0x12u);
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }
  uint64_t v36 = v99;
  uint64_t v37 = v110;

  uint64_t v38 = v114[7];
  sub_100027268((uint64_t)&v115);
  uint64_t v39 = sub_10001486C(v38, v36, (uint64_t)&v115, 0);
  int v41 = v40;
  sub_10003379C((uint64_t)&v115, &qword_100049818);
  int v96 = v41;
  if ((v41 & 0x100) == 0)
  {
    uint64_t v107 = v39;
    os_log_type_t v108 = v13;
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v98 + 16);
    uint64_t v112 = v98 + 16;
    uint64_t v111 = v42;
    v42(v113, (char *)v36, v37);
    sub_10002B5E4(v36);
    uint64_t v43 = (void (*)(uint64_t *, void))Message.metadata.modify();
    Message.Metadata.isRedundant.setter();
    v43(&v115, 0);
    uint64_t v44 = (void (*)(uint64_t *, void))Message.metadata.modify();
    Message.Metadata.isSessionStarted.setter();
    v44(&v115, 0);
    Message.appName.getter();
    if (!v45) {
      sub_10002BA68();
    }
    Message.appName.setter();
    uint64_t v46 = v94;
    Message.metadata.getter();
    char v47 = Message.Metadata.requiresSummaryDecoration.getter();
    uint64_t v48 = *(void (**)(char *, uint64_t))(v97 + 8);
    v97 += 8;
    id v92 = v48;
    v48(v46, v95);
    uint64_t v49 = v110;
    uint64_t v50 = v108;
    uint64_t v51 = v107;
    if (v47)
    {
      uint64_t v52 = v113;
      uint64_t v53 = (void (*)(uint64_t *, void))Message.metadata.modify();
      Message.Metadata.requiresSummaryDecoration.setter();
      v53(&v115, 0);
      uint64_t v49 = v110;
      swift_bridgeObjectRetain();
      uint64_t v51 = v107;
      uint64_t v54 = sub_10002BCE0(v107);
      swift_bridgeObjectRelease();
      v111(v16, v52, v49);
      uint64_t v55 = v54[2];
      if (v55)
      {
        uint64_t v56 = (uint64_t)(v54 + 4);
        uint32_t v57 = (void (**)(char *, uint64_t))(v101 + 8);
        swift_bridgeObjectRetain();
        do
        {
          sub_10003355C(v56, (uint64_t)&v115);
          sub_100015384(&v115, v116);
          static DeviceUtilities.currentOperatingSystem.getter();
          dispatch thunk of SummaryDecorator.addDecoratorData(_:operatingSystem:)();
          (*v57)(v7, v5);
          sub_100015434((uint64_t)&v115);
          v56 += 40;
          --v55;
        }
        while (v55);
        swift_bridgeObjectRelease();
        uint64_t v49 = v110;
        uint64_t v50 = v108;
        uint64_t v51 = v107;
      }
      uint64_t v58 = v98;
      os_log_type_t v59 = v102;
      (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v102, v16, v49);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v58 + 40))(v113, v59, v49);
    }
    uint64_t v60 = v114;
    swift_beginAccess();
    uint64_t v61 = v60[11];
    uint64_t v62 = *(void *)(v51 + 16);
    swift_bridgeObjectRetain();
    if (v62)
    {
      char v63 = sub_100032F00(v61, v51);
      swift_bridgeObjectRelease();
      uint64_t v61 = (uint64_t)v63;
    }
    swift_bridgeObjectRelease();
    uint64_t v70 = *(void *)(v61 + 16);
    if (v70)
    {
      uint64_t v91 = v61;
      uint64_t v71 = v61 + 32;
      swift_beginAccess();
      uint64_t v72 = (void (**)(char *, uint64_t))(v98 + 8);
      v102 = (char *)(v106 + 8);
      *(void *)&long long v73 = 136381187;
      long long v101 = v73;
      uint64_t v100 = (char *)&type metadata for Any + 8;
      do
      {
        sub_10003355C(v71, (uint64_t)&v115);
        sub_100015384(&v115, v116);
        v111(v50, v113, v49);
        dispatch thunk of WorkerProtocol.process(message:)();
        (*v72)(v50, v49);
        sub_100015434((uint64_t)&v115);
        v71 += 40;
        --v70;
      }
      while (v70);
    }
    swift_bridgeObjectRelease();
    unint64_t v74 = v99;
    if (Message.shouldRetain.getter())
    {
      sub_10002BF20();
      sub_100021EB0(v74);
      swift_release();
    }
    swift_beginAccess();
    uint64_t v75 = v94;
    Message.metadata.getter();
    char v76 = Message.Metadata.isRedundant.getter();
    v92(v75, v95);
    uint64_t result = swift_endAccess();
    if ((v76 & 1) == 0)
    {
      Swift::UInt32 v78 = Message.category.getter();
      uint64_t v79 = (uint64_t)v93;
      v111(v93, (char *)v74, v49);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v98 + 56))(v79, 0, 1, v49);
      unint64_t v80 = v114;
      swift_beginAccess();
      sub_100026A24(v79, v78);
      uint64_t result = swift_endAccess();
      uint64_t v81 = *(void *)((char *)v80 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
      BOOL v82 = __CFADD__(v81, 1);
      uint64_t v83 = v81 + 1;
      if (v82) {
        goto LABEL_44;
      }
      *(void *)((char *)v114 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique) = v83;
    }
    uint64_t v84 = *(void *)((char *)v114 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    BOOL v82 = __CFADD__(v84, 1);
    uint64_t v85 = v84 + 1;
    if (!v82)
    {
      uint64_t v86 = v113;
      uint64_t v87 = (uint64_t)v114;
      *(void *)((char *)v114 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages) = v85;
      (*(void (**)(char *, uint64_t))(v98 + 8))(v86, v49);
      uint64_t v88 = Message.content.getter();
      swift_retain();
      uint64_t v69 = sub_100032A6C(v88, v87);
      goto LABEL_34;
    }
    __break(1u);
LABEL_44:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v64 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v64, v65))
  {
    os_log_type_t v66 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v66 = 134217984;
    uint64_t v115 = v114[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "Discarding message. { reporterID=%lld }", v66, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  uint64_t v67 = Message.content.getter();
  uint64_t v68 = (uint64_t)v114;
  swift_retain();
  uint64_t v69 = sub_100032A6C(v67, v68);
LABEL_34:
  swift_release();
  if (*(void *)(v69 + 16))
  {
    uint64_t v89 = v114[10];
    if (v89)
    {
      swift_bridgeObjectRetain();
      uint64_t v90 = sub_10002A810(v69, v89);
      v114[10] = v90;
    }
    else
    {
      v114[10] = v69;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return (v96 & 0x100) == 0;
}

uint64_t sub_1000283B0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v19 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v17 = *(void *)(v6 - 8);
  uint64_t v18 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Message();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  v16[1] = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v1;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_10002DC9C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_10001A18C;
  aBlock[3] = &unk_100046350;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v20 = _swiftEmptyArrayStorage;
  sub_10003385C((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005E64((uint64_t *)&unk_100049BC0);
  sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v18);
  return swift_release();
}

uint64_t sub_100028728(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_retain();
    char v4 = __CocoaSet.contains(_:)();
    swift_release();
    return v4 & 1;
  }
  if (*(void *)(a2 + 16))
  {
    Hasher.init(_seed:)();
    Swift::UInt32 v6 = *(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
    Hasher._combine(_:)(v6);
    uint64_t v7 = *(void *)(a1 + 24);
    uint64_t v8 = *(void *)(a1 + 32);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Swift::Int v9 = Hasher._finalize()();
    uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v11 = v9 & ~v10;
    uint64_t v12 = a2 + 56;
    if ((*(void *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
    {
      uint64_t v13 = ~v10;
      uint64_t v14 = *(void *)(a2 + 48);
      uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      do
      {
        uint64_t v16 = *(void *)(v14 + 8 * v11);
        if (*(_DWORD *)(v16 + v15) == v6)
        {
          BOOL v17 = *(void *)(v16 + 24) == v7 && *(void *)(v16 + 32) == v8;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            return 1;
          }
          uint64_t v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        }
        unint64_t v11 = (v11 + 1) & v13;
      }
      while (((*(void *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
  }
  return 0;
}

uint64_t sub_10002889C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_1000289D4(void **a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7 = v6;
  int v55 = a6;
  uint64_t v52 = a3;
  unint64_t v53 = a4;
  LODWORD(v51) = a2;
  uint64_t v10 = type metadata accessor for Keys();
  uint64_t v49 = *(void *)(v10 - 8);
  uint64_t v50 = v10;
  __chkstk_darwin(v10);
  uint64_t v48 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v12);
  uint64_t v54 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v13 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  unint64_t v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v16 - 8);
  *(_WORD *)(v6 + 64) = -1;
  *(unsigned char *)(v6 + 66) = 0;
  *(void *)(v6 + 72) = sub_100005694((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v6 + 80) = 0;
  *(void *)(v6 + 88) = _swiftEmptyArrayStorage;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 128) = 0u;
  static Logger.session.getter();
  *(void *)(v6 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers) = _swiftEmptyArrayStorage;
  uint64_t v17 = v6 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
  uint64_t v18 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory;
  *(void *)(v7 + v19) = sub_100006468((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages) = 0;
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique) = 0;
  *(unsigned char *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) = 0;
  *(void *)(v7 + 16) = a1;
  *(_DWORD *)(v7 + 48) = v51;
  unint64_t v20 = v53;
  *(void *)(v7 + 32) = v52;
  *(void *)(v7 + 40) = v20;
  *(void *)(v7 + 56) = a5;
  LOBYTE(v20) = v55;
  *(unsigned char *)(v7 + 24) = v55;
  BOOL v21 = (v20 & 1) == 0;
  uint64_t v22 = 5;
  if (v21) {
    uint64_t v22 = 1;
  }
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime) = v22;
  unint64_t v23 = sub_1000060C8();
  uint64_t v52 = a5;
  unint64_t v53 = v23;
  uint64_t aBlock = 0;
  unint64_t v57 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(39);
  swift_bridgeObjectRelease();
  uint64_t aBlock = (void **)0xD000000000000025;
  unint64_t v57 = 0x800000010003F310;
  uint64_t v51 = a1;
  uint64_t v62 = a1;
  v24._id countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  static DispatchQoS.userInteractive.getter();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v54);
  uint64_t aBlock = (void **)_swiftEmptyArrayStorage;
  sub_10003385C((unint64_t *)&unk_100049C10, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005E64(&qword_100049658);
  sub_10002123C((unint64_t *)&qword_100049C20, &qword_100049658);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  *(void *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  if ((v55 & 1) == 0) {
    goto LABEL_6;
  }
  *(_WORD *)(v7 + 64) = 5;
  sub_100005E64(&qword_10004A088);
  id v25 = (int *)(sub_100005E64(&qword_100049688) - 8);
  unint64_t v26 = (*(unsigned __int8 *)(*(void *)v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v25 + 80);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_10003D870;
  uint64_t v28 = (uint64_t *)(v27 + v26);
  uint64_t v29 = (void *)(v27 + v26 + v25[14]);
  uint64_t v31 = v48;
  uint64_t v30 = v49;
  uint64_t v32 = v50;
  (*(void (**)(char *, void, uint64_t))(v49 + 104))(v48, enum case for Keys.applicationName(_:), v50);
  uint64_t v33 = Keys.rawValue.getter();
  uint64_t v35 = v34;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  *uint64_t v28 = v33;
  v28[1] = v35;
  void *v29 = 0x6E776F6E6B6E55;
  v29[1] = 0xE700000000000000;
  uint64_t v36 = enum case for SimpleType.string(_:);
  uint64_t v37 = type metadata accessor for SimpleType();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v29, v36, v37);
  unint64_t v38 = sub_100005694(v27);
  uint64_t v39 = *(NSObject **)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = v7;
  *(void *)(v40 + 24) = v38;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = sub_1000338A4;
  *(void *)(v41 + 24) = v40;
  uint64_t v60 = sub_10000C7E8;
  uint64_t v61 = v41;
  uint64_t aBlock = _NSConcreteStackBlock;
  unint64_t v57 = 1107296256;
  uint64_t v58 = sub_1000199D0;
  os_log_type_t v59 = &unk_100046580;
  uint64_t v42 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v39, v42);
  _Block_release(v42);
  LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t result = swift_release();
  if (v39)
  {
    __break(1u);
  }
  else
  {
LABEL_6:
    uint64_t v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 134217984;
      uint64_t aBlock = v51;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Created reporting session. { reporterID=%lld }", v46, 0xCu);
      swift_slowDealloc();
    }

    swift_release();
    return v7;
  }
  return result;
}

void sub_100029168()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TraceArgs();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TraceCode();
  uint64_t v29 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v28 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005E64(&qword_10004A070);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchPredicate();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v11);
  id v16 = v15;
  LOBYTE(v15) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  swift_retain();
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134217984;
    uint64_t v30 = *(void *)(v1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "startOnQueue() called. { reporterID=%lld }", v19, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  uint64_t v20 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
  uint64_t v21 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
  swift_beginAccess();
  sub_1000335C0((uint64_t)v10, v21, &qword_10004A070);
  swift_endAccess();
  if (*(unsigned char *)(v1 + 66) != 1)
  {
    *(unsigned char *)(v1 + 66) = 1;
    if (qword_100049640 == -1)
    {
LABEL_9:
      sub_10002A8E0(qword_10004A3B8);
      sub_10002BFA0();
      unint64_t v26 = v28;
      uint64_t v25 = v29;
      (*(void (**)(char *, void, uint64_t))(v29 + 104))(v28, enum case for TraceCode.sessionCreate(_:), v6);
      static Utilities.positiveReporterID(_:)();
      TraceArgs.init(arg1:arg2:arg3:arg4:)();
      static Trace.post(_:args:)();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v6);
      return;
    }
LABEL_13:
    swift_once();
    goto LABEL_9;
  }
  swift_retain();
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    Swift::String v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)Swift::String v24 = 134217984;
    uint64_t v30 = *(void *)(v1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Session already started. { reporterID=%lld }", v24, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }
}

void sub_10002969C()
{
}

void sub_1000296C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005E64(&qword_10004A070);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v43 - v6;
  uint64_t v8 = sub_100005E64(&qword_100049700);
  __chkstk_darwin(v8 - 8);
  uint64_t v46 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Message();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchPredicate();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  os_log_type_t v18 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v17 = v18;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  id v19 = v18;
  LOBYTE(v18) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  if (v18)
  {
    swift_retain_n();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (_DWORD *)swift_slowAlloc();
      uint64_t v44 = v5;
      uint64_t v45 = v10;
      os_log_type_t v23 = v22;
      *uint64_t v22 = 67174913;
      LODWORD(v48) = *(unsigned __int8 *)(v1 + 66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *((_WORD *)v23 + 4) = 2048;
      Swift::String v24 = v13;
      uint64_t v25 = v7;
      uint64_t v26 = *(void *)(v1 + 16);
      swift_release();
      uint64_t v48 = v26;
      uint64_t v7 = v25;
      uint64_t v13 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "signalStop() called. { isStarted=%{BOOL,private}d, reporterID=%lld }", (uint8_t *)v23, 0x12u);
      uint64_t v5 = v44;
      uint64_t v10 = v45;
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    if ((*(unsigned char *)(v1 + 24) & 1) == 0)
    {
      if (*(unsigned char *)(v1 + 66) == 1)
      {
        uint64_t v27 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
        uint64_t v28 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
        uint64_t v29 = *(void *)(v1 + 16);
        uint64_t v30 = *(void *)(v1 + 32);
        uint64_t v31 = *(void *)(v1 + 40);
        LOBYTE(v48) = 1;
        uint64_t v49 = v27;
        uint64_t v50 = v28;
        uint64_t v51 = v29;
        char v52 = 1;
        uint64_t v53 = v30;
        uint64_t v54 = v31;
        char v55 = 0;
        swift_bridgeObjectRetain();
        sub_1000338E0();
        swift_bridgeObjectRelease();
        uint64_t v32 = type metadata accessor for Message.Metadata();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v46, 1, 1, v32);
        Message.init(category:type:content:metadata:)();
        if ((sub_1000273DC((unint64_t)v13) & 1) == 0)
        {
          uint64_t v46 = v13;
          swift_retain();
          uint64_t v33 = Logger.logObject.getter();
          os_log_type_t v34 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v33, v34))
          {
            uint64_t v35 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v35 = 134217984;
            uint64_t v47 = v29;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "signalStop message dropped. { reporterID=%lld }", v35, 0xCu);
            swift_slowDealloc();
          }
          else
          {

            swift_release();
          }
          uint64_t v13 = v46;
        }
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      }
      else
      {
        swift_retain();
        uint64_t v36 = Logger.logObject.getter();
        os_log_type_t v37 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v36, v37))
        {
          unint64_t v38 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v38 = 134217984;
          uint64_t v48 = *(void *)(v1 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "Not sending stop message, because !isStarted. { reporterID=%lld }", v38, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          swift_release();
        }
      }
    }
    if (*(unsigned char *)(v1 + 66) == 1)
    {
      uint64_t v39 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
      swift_beginAccess();
      sub_100006754(v39, (uint64_t)v7, &qword_10004A070);
      uint64_t v40 = type metadata accessor for Date();
      uint64_t v41 = *(void *)(v40 - 8);
      int v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48))(v7, 1, v40);
      sub_10003379C((uint64_t)v7, &qword_10004A070);
      if (v42 == 1)
      {
        Date.init()();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v5, 0, 1, v40);
        swift_beginAccess();
        sub_1000335C0((uint64_t)v5, v39, &qword_10004A070);
        swift_endAccess();
        sub_10002C7CC();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100029DC0(uint64_t a1, int a2)
{
  return sub_100029DE8(a2);
}

uint64_t sub_100029DE8(int a1)
{
  uint64_t v2 = v1;
  int v58 = a1;
  uint64_t v3 = type metadata accessor for TraceArgs();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v62 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = type metadata accessor for TraceCode();
  uint64_t v61 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v60 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005E64(&qword_100049700);
  __chkstk_darwin(v7 - 8);
  uint64_t v54 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Message();
  uint64_t v55 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v59 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005E64(&qword_10004A070);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchPredicate();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char **)((char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  os_log_type_t v18 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *uint64_t v17 = v18;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  id v19 = v18;
  char v20 = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  if (v20)
  {
    swift_retain_n();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v57 = v4;
    if (v24)
    {
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 67174913;
      LODWORD(v65) = *(unsigned __int8 *)(v2 + 66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v25 + 8) = 2048;
      uint64_t v26 = v3;
      uint64_t v27 = *(void *)(v2 + 16);
      swift_release();
      uint64_t v65 = v27;
      uint64_t v3 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "stop() called. { isStarted=%{BOOL,private}d, reporterID=%lld }", (uint8_t *)v25, 0x12u);
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    uint64_t v28 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v13, 1, 1, v28);
    uint64_t v29 = v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
    swift_beginAccess();
    sub_1000335C0((uint64_t)v13, v29, &qword_10004A070);
    swift_endAccess();
    uint64_t v56 = OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages;
    uint64_t v30 = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    uint64_t v31 = OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique;
    uint64_t v32 = *(void *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
    Swift::Int64 v33 = *(void *)(v2 + 16);
    int v34 = *(unsigned __int8 *)(v2 + 66);
    uint64_t v35 = *(void *)(v2 + 32);
    uint64_t v36 = *(void *)(v2 + 40);
    LOBYTE(v65) = 2;
    uint64_t v66 = v30;
    uint64_t v67 = v32;
    Swift::Int64 v68 = v33;
    char v69 = v34;
    uint64_t v70 = v35;
    uint64_t v71 = v36;
    char v72 = v58 & 1;
    if (v34 == 1)
    {
      swift_bridgeObjectRetain();
      sub_1000338E0();
      swift_bridgeObjectRelease();
      uint64_t v37 = type metadata accessor for Message.Metadata();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v54, 1, 1, v37);
      unint64_t v38 = (unint64_t)v59;
      Message.init(category:type:content:metadata:)();
      if ((sub_1000273DC(v38) & 1) == 0)
      {
        uint64_t v39 = v9;
        swift_retain();
        uint64_t v40 = Logger.logObject.getter();
        os_log_type_t v41 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v40, v41))
        {
          int v42 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)int v42 = 134217984;
          Swift::Int64 v64 = v33;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "Stop message dropped. { reporterID=%lld }", v42, 0xCu);
          swift_slowDealloc();
        }
        else
        {

          swift_release();
        }
        uint64_t v9 = v39;
      }
      (*(void (**)(char *, uint64_t))(v55 + 8))(v59, v9);
    }
    else
    {
      swift_retain();
      uint64_t v43 = Logger.logObject.getter();
      os_log_type_t v44 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 134217984;
        Swift::Int64 v64 = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Not sending stop message, because !isStarted. { reporterID=%lld }", v45, 0xCu);
        swift_slowDealloc();
      }
      else
      {
        swift_release();
      }
    }
    swift_retain();
    uint64_t v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 134217984;
      Swift::Int64 v64 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Ending session. { reporterID=%lld }", v48, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }
    uint64_t v49 = v57;

    uint64_t v51 = v60;
    uint64_t v50 = v61;
    uint64_t v52 = v63;
    (*(void (**)(char *, void, uint64_t))(v61 + 104))(v60, enum case for TraceCode.sessionStop(_:), v63);
    static Utilities.positiveReporterID(_:)();
    uint64_t v53 = v62;
    TraceArgs.init(arg1:arg2:arg3:arg4:)();
    static Trace.post(_:args:)();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v53, v3);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
    sub_10002C390();
    *(unsigned char *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) = 0;
    *(void *)(v2 + v56) = 0;
    *(void *)(v2 + v31) = 0;
    *(unsigned char *)(v2 + 66) = 0;
    type metadata accessor for OsTransactionHandler();
    static OsTransactionHandler.shared.getter();
    OsTransactionHandler.sessionStopped(for:)(v33);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002A6B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(a1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  void *v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    swift_beginAccess();
    uint64_t v9 = *(void *)(a1 + 72);
    swift_bridgeObjectRetain();
    uint64_t v10 = swift_bridgeObjectRetain();
    *(void *)(a1 + 72) = sub_10002A810(v10, v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002A810(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_10003171C(a1, (uint64_t)sub_100031668, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_10002A89C@<X0>(unint64_t a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000273DC(a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_10002A8E0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v67 = type metadata accessor for Config.WorkerConfigs();
  __chkstk_darwin(v67);
  uint64_t v66 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v73 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
    uint64_t v70 = (void *)(v1 + 88);
    Swift::Int64 v64 = (void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
    int v72 = *(unsigned __int8 *)(v1 + 24);
    uint64_t v65 = (void (**)(char *, uint64_t))(v4 + 8);
    v62[0] = v76;
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    *(void *)&long long v8 = 136380931;
    long long v71 = v8;
    v62[1] = (char *)&type metadata for Any + 8;
    *(void *)&long long v8 = 136315394;
    long long v63 = v8;
    uint64_t v69 = a1;
    uint64_t v68 = v6;
    while (1)
    {
      long long v74 = *(_OWORD *)(a1 + 16 * v7 + 32);
      if (v72 && ((v9 = v74, swift_conformsToProtocol2()) ? (uint64_t v10 = v9) : (uint64_t v10 = 0), !v10))
      {
        swift_retain_n();
        uint64_t v17 = Logger.logObject.getter();
        os_log_type_t v43 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v17, v43))
        {
          uint64_t v44 = swift_slowAlloc();
          *(void *)&long long v80 = swift_slowAlloc();
          *(_DWORD *)uint64_t v44 = v71;
          long long v82 = v74;
          sub_100005E64(&qword_10004A058);
          uint64_t v45 = String.init<A>(describing:)();
          *(void *)(v44 + 4) = sub_10002E344(v45, v46, (uint64_t *)&v80);
          swift_bridgeObjectRelease();
          *(_WORD *)(v44 + 12) = 2048;
          uint64_t v47 = *(void *)(v2 + 16);
          swift_release();
          *(void *)(v44 + 14) = v47;
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v17, v43, "Skipping worker on singleMessageSession. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v44, 0x16u);
          goto LABEL_25;
        }
      }
      else
      {
        sub_100027268((uint64_t)&v78);
        uint64_t v11 = v74;
        uint64_t v12 = type metadata accessor for Optional();
        uint64_t v13 = *(void *)(v12 - 8);
        __chkstk_darwin(v12);
        uint64_t v15 = (char *)v62 - v14;
        dispatch thunk of WorkerProtocol.init(with:)();
        uint64_t v16 = *(void *)(v11 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, v11) != 1)
        {
          long long v81 = v74;
          os_log_type_t v23 = sub_100015320((uint64_t *)&v80);
          (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 32))(v23, v15, v11);
          sub_100033388(&v80, (uint64_t)&v82);
          sub_100015384(&v82, v83);
          if (dispatch thunk of WorkerProtocol.start()())
          {
            sub_10003355C((uint64_t)&v82, (uint64_t)&v80);
            BOOL v24 = (void **)v70;
            swift_beginAccess();
            uint64_t v25 = *v24;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *BOOL v24 = v25;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t v25 = sub_10002DE70(0, v25[2] + 1, 1, v25, &qword_10004A008, &qword_100049E20);
              *uint64_t v70 = v25;
            }
            unint64_t v28 = v25[2];
            unint64_t v27 = v25[3];
            if (v28 >= v27 >> 1)
            {
              uint64_t v25 = sub_10002DE70((void *)(v27 > 1), v28 + 1, 1, v25, &qword_10004A008, &qword_100049E20);
              *uint64_t v70 = v25;
            }
            void v25[2] = v28 + 1;
            sub_100033388(&v80, (uint64_t)&v25[5 * v28 + 4]);
            swift_endAccess();
            sub_10003355C((uint64_t)&v82, (uint64_t)&v78);
            sub_100005E64(&qword_100049E20);
            sub_100005E64(&qword_100049E28);
            if (swift_dynamicCast())
            {
              sub_100033388(v76, (uint64_t)&v80);
              sub_10003355C((uint64_t)&v82, (uint64_t)&v78);
              swift_retain_n();
              uint64_t v29 = Logger.logObject.getter();
              os_log_type_t v30 = static os_log_type_t.debug.getter();
              if (os_log_type_enabled(v29, v30))
              {
                uint64_t v31 = swift_slowAlloc();
                *(void *)&v76[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v31 = v71;
                *(void *)&long long v74 = v31 + 4;
                sub_100015384(&v78, v79);
                uint64_t v32 = v66;
                dispatch thunk of WorkerProtocol.workerConfig.getter();
                uint64_t v33 = Config.WorkerConfigs.rawValue.getter();
                unint64_t v35 = v34;
                (*v65)(v32, v67);
                uint64_t v75 = sub_10002E344(v33, v35, (uint64_t *)v76);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();
                sub_100015434((uint64_t)&v78);
                *(_WORD *)(v31 + 12) = 2048;
                uint64_t v36 = *(void *)(v2 + 16);
                swift_release();
                uint64_t v75 = v36;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_release();
                _os_log_impl((void *)&_mh_execute_header, v29, v30, "Adding decorator worker. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v31, 0x16u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {

                swift_release();
                sub_100015434((uint64_t)&v78);
                swift_release();
              }
              sub_10003355C((uint64_t)&v80, (uint64_t)&v78);
              uint64_t v48 = (void **)v64;
              swift_beginAccess();
              uint64_t v49 = *v48;
              char v50 = swift_isUniquelyReferenced_nonNull_native();
              *uint64_t v48 = v49;
              a1 = v69;
              if ((v50 & 1) == 0)
              {
                uint64_t v49 = sub_10002DE70(0, v49[2] + 1, 1, v49, &qword_10004A000, &qword_100049E28);
                *Swift::Int64 v64 = v49;
              }
              unint64_t v52 = v49[2];
              unint64_t v51 = v49[3];
              if (v52 >= v51 >> 1)
              {
                uint64_t v49 = sub_10002DE70((void *)(v51 > 1), v52 + 1, 1, v49, &qword_10004A000, &qword_100049E28);
                *Swift::Int64 v64 = v49;
              }
              v49[2] = v52 + 1;
              sub_100033388(&v78, (uint64_t)&v49[5 * v52 + 4]);
              swift_endAccess();
              sub_100015434((uint64_t)&v80);
            }
            else
            {
              uint64_t v77 = 0;
              memset(v76, 0, sizeof(v76));
              sub_10003379C((uint64_t)v76, &qword_100049FF8);
            }
            sub_10003355C((uint64_t)&v82, (uint64_t)&v80);
            swift_retain_n();
            uint64_t v53 = Logger.logObject.getter();
            os_log_type_t v54 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v53, v54))
            {
              uint64_t v55 = swift_slowAlloc();
              *(void *)&long long v78 = swift_slowAlloc();
              *(_DWORD *)uint64_t v55 = v63;
              sub_100015384(&v80, v81);
              uint64_t v56 = v66;
              dispatch thunk of WorkerProtocol.workerConfig.getter();
              uint64_t v57 = Config.WorkerConfigs.rawValue.getter();
              unint64_t v59 = v58;
              (*v65)(v56, v67);
              *(void *)(v55 + 4) = sub_10002E344(v57, v59, (uint64_t *)&v78);
              swift_bridgeObjectRelease();
              sub_100015434((uint64_t)&v80);
              *(_WORD *)(v55 + 12) = 2048;
              uint64_t v60 = *(void *)(v2 + 16);
              swift_release();
              *(void *)(v55 + 14) = v60;
              swift_release();
              _os_log_impl((void *)&_mh_execute_header, v53, v54, "Started worker. { worker=%s, reporterID=%lld }", (uint8_t *)v55, 0x16u);
              swift_arrayDestroy();
              a1 = v69;
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              swift_release();
              sub_100015434((uint64_t)&v80);
              swift_release();
            }
            uint64_t v6 = v68;
          }
          else
          {
            swift_retain_n();
            uint64_t v37 = Logger.logObject.getter();
            os_log_type_t v38 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v37, v38))
            {
              uint64_t v39 = swift_slowAlloc();
              *(void *)&long long v78 = swift_slowAlloc();
              *(_DWORD *)uint64_t v39 = v71;
              long long v80 = v74;
              sub_100005E64(&qword_10004A058);
              uint64_t v40 = String.init<A>(describing:)();
              *(void *)(v39 + 4) = sub_10002E344(v40, v41, (uint64_t *)&v78);
              swift_bridgeObjectRelease();
              *(_WORD *)(v39 + 12) = 2048;
              uint64_t v42 = *(void *)(v2 + 16);
              swift_release();
              *(void *)(v39 + 14) = v42;
              swift_release();
              _os_log_impl((void *)&_mh_execute_header, v37, v38, "Unable to start worker. Disabled for session lifetime. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v39, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              swift_release_n();
            }
          }
          sub_100015434((uint64_t)&v82);
          goto LABEL_4;
        }
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
        swift_retain_n();
        uint64_t v17 = Logger.logObject.getter();
        os_log_type_t v18 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = swift_slowAlloc();
          *(void *)&long long v80 = swift_slowAlloc();
          *(_DWORD *)uint64_t v19 = v71;
          long long v82 = v74;
          sub_100005E64(&qword_10004A058);
          uint64_t v20 = String.init<A>(describing:)();
          *(void *)(v19 + 4) = sub_10002E344(v20, v21, (uint64_t *)&v80);
          swift_bridgeObjectRelease();
          *(_WORD *)(v19 + 12) = 2048;
          uint64_t v22 = *(void *)(v2 + 16);
          swift_release();
          *(void *)(v19 + 14) = v22;
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unable to initialize worker. Disabled for session lifetime. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v19, 0x16u);
LABEL_25:
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          goto LABEL_4;
        }
      }

      swift_release_n();
LABEL_4:
      if (v6 == ++v7)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_beginAccess();
  sub_10002C314((void **)(v2 + 88), (uint64_t (*)(uint64_t))&Config.WorkerConfigs.messageProcessOrder.getter);
  return swift_endAccess();
}

uint64_t sub_10002B5E4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Message();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v33 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005E64(&qword_10004A040);
  __chkstk_darwin(v6);
  long long v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005E64(&qword_100049FF0);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v34 = (uint64_t)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v32 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v32 - v15;
  Swift::UInt32 v17 = Message.category.getter();
  os_log_type_t v18 = (uint64_t *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory);
  swift_beginAccess();
  uint64_t v19 = *v18;
  if (*(void *)(v19 + 16) && (unint64_t v20 = sub_100022F18(v17), (v21 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v16, *(void *)(v19 + 56) + *(void *)(v4 + 72) * v20, v3);
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v22(v16, 0, 1, v3);
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v22(v16, 1, 1, v3);
  }
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v14, a1, v3);
  v22(v14, 0, 1, v3);
  uint64_t v23 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_100006754((uint64_t)v16, (uint64_t)v8, &qword_100049FF0);
  sub_100006754((uint64_t)v14, v23, &qword_100049FF0);
  BOOL v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v24((uint64_t)v8, 1, v3) == 1)
  {
    sub_10003379C((uint64_t)v14, &qword_100049FF0);
    sub_10003379C((uint64_t)v16, &qword_100049FF0);
    int v25 = v24(v23, 1, v3);
    if (v25 == 1) {
      uint64_t v26 = &qword_100049FF0;
    }
    else {
      uint64_t v26 = &qword_10004A040;
    }
    if (v25 == 1) {
      char v27 = -1;
    }
    else {
      char v27 = 0;
    }
  }
  else
  {
    uint64_t v28 = v34;
    sub_100006754((uint64_t)v8, v34, &qword_100049FF0);
    if (v24(v23, 1, v3) == 1)
    {
      sub_10003379C((uint64_t)v14, &qword_100049FF0);
      sub_10003379C((uint64_t)v16, &qword_100049FF0);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v28, v3);
      char v27 = 0;
      uint64_t v26 = &qword_10004A040;
    }
    else
    {
      uint64_t v29 = v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v33, v23, v3);
      sub_10003385C(&qword_10004A048, (void (*)(uint64_t))&type metadata accessor for Message);
      char v27 = dispatch thunk of static Equatable.== infix(_:_:)();
      os_log_type_t v30 = *(void (**)(char *, uint64_t))(v4 + 8);
      v30(v29, v3);
      uint64_t v26 = &qword_100049FF0;
      sub_10003379C((uint64_t)v14, &qword_100049FF0);
      sub_10003379C((uint64_t)v16, &qword_100049FF0);
      v30((char *)v28, v3);
    }
  }
  sub_10003379C((uint64_t)v8, v26);
  return v27 & 1;
}

uint64_t sub_10002BA68()
{
  uint64_t v1 = sub_100005E64(&qword_100049A80);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (uint64_t *)((char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = type metadata accessor for Keys();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Keys.applicationName(_:), v4);
  swift_beginAccess();
  Dictionary<>.subscript.getter();
  uint64_t v8 = type metadata accessor for SimpleType();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(v3, 1, v8) == 1)
  {
    sub_10003379C((uint64_t)v3, &qword_100049A80);
LABEL_6:
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v10 = *(void *)(v0 + 32);
    swift_bridgeObjectRetain();
    return v10;
  }
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v9 + 88))(v3, v8) != enum case for SimpleType.string(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v3, v8);
    goto LABEL_6;
  }
  (*(void (**)(uint64_t *, uint64_t))(v9 + 96))(v3, v8);
  uint64_t v10 = *v3;
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

void *sub_10002BCE0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_10002D5A0(v2);
  swift_bridgeObjectRelease();
  if (a1 && *(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100032F00((uint64_t)v3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = v4;
  }
  uint64_t v5 = v3[2];
  if (v5)
  {
    uint64_t v6 = (uint64_t)(v3 + 4);
    swift_bridgeObjectRetain();
    uint64_t v7 = _swiftEmptyArrayStorage;
    do
    {
      sub_10003355C(v6, (uint64_t)v15);
      sub_10003355C((uint64_t)v15, (uint64_t)v14);
      sub_100005E64(&qword_100049E20);
      sub_100005E64(&qword_100049E28);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
      }
      sub_100015434((uint64_t)v15);
      if (*((void *)&v12 + 1))
      {
        sub_100033388(&v11, (uint64_t)v14);
        sub_100033388(v14, (uint64_t)&v11);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v7 = sub_10002DE70(0, v7[2] + 1, 1, v7, &qword_10004A000, &qword_100049E28);
        }
        unint64_t v9 = v7[2];
        unint64_t v8 = v7[3];
        if (v9 >= v8 >> 1) {
          uint64_t v7 = sub_10002DE70((void *)(v8 > 1), v9 + 1, 1, v7, &qword_10004A000, &qword_100049E28);
        }
        void v7[2] = v9 + 1;
        sub_100033388(&v11, (uint64_t)&v7[5 * v9 + 4]);
      }
      else
      {
        sub_10003379C((uint64_t)&v11, &qword_100049FF8);
      }
      v6 += 40;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return v7;
}

uint64_t sub_10002BF20()
{
  if (*(void *)(v0 + 136))
  {
    uint64_t v1 = *(void *)(v0 + 136);
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 16);
    _s16RetainedMessagesCMa();
    uint64_t v1 = swift_allocObject();
    *(void *)(v1 + 16) = sub_100006630((uint64_t)_swiftEmptyArrayStorage);
    *(void *)(v1 + 24) = v2;
    *(void *)(v0 + 136) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_10002BFA0()
{
  uint64_t v1 = sub_100005E64(&qword_100049700);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v22[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for Message();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = __chkstk_darwin(v4);
  unint64_t v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((*(unsigned char *)(v0 + 24) & 1) == 0)
  {
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
    long long v11 = *(void **)(v0 + 16);
    char v12 = *(unsigned char *)(v0 + 66);
    uint64_t v13 = *(void *)(v0 + 32);
    uint64_t v14 = *(void *)(v0 + 40);
    char v24 = 0;
    uint64_t v25 = v9;
    uint64_t v26 = v10;
    char v27 = v11;
    char v28 = v12;
    uint64_t v29 = v13;
    uint64_t v30 = v14;
    char v31 = 0;
    swift_bridgeObjectRetain();
    sub_1000338E0();
    swift_bridgeObjectRelease();
    uint64_t v15 = type metadata accessor for Message.Metadata();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v3, 1, 1, v15);
    Message.init(category:type:content:metadata:)();
    uint64_t v16 = *(void *)(v0 + 80);
    if (v16 && *(void *)(v16 + 16))
    {
      swift_bridgeObjectRetain();
      Config.neededPreviousFields.getter();
      Message.copyPrevious(fields:from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    if (static SystemMonitor.shared)
    {
      Swift::UInt32 v17 = *(os_unfair_lock_s **)(static SystemMonitor.shared + 16);
      swift_retain();
      swift_retain();
      os_unfair_lock_lock(v17 + 6);
      sub_100036D64(&v23);
      os_unfair_lock_unlock(v17 + 6);
      v18._rawValue = v23;
      swift_release();
      swift_release();
      Message.addToContent(from:)(v18);
      swift_bridgeObjectRelease();
    }
    if ((sub_1000273DC((unint64_t)v8) & 1) == 0)
    {
      swift_retain();
      uint64_t v19 = Logger.logObject.getter();
      os_log_type_t v20 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v19, v20))
      {
        char v21 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)char v21 = 134217984;
        uint64_t v23 = v11;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Start message dropped. { reporterID=%lld }", v21, 0xCu);
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
    }
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

Swift::Int sub_10002C314(void **a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_1000323C8(v4);
  }
  uint64_t v5 = v4[2];
  v7[0] = v4 + 4;
  v7[1] = v5;
  Swift::Int result = sub_100030008(v7, a2, a2);
  *a1 = v4;
  return result;
}

uint64_t sub_10002C390()
{
  uint64_t v1 = v0;
  uint64_t v34 = type metadata accessor for Config.WorkerConfigs();
  uint64_t v2 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v33 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t *)(v1 + 88);
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 88) + 16))
  {
    swift_beginAccess();
    sub_10002C314((void **)(v1 + 88), (uint64_t (*)(uint64_t))&Config.WorkerConfigs.stopOrder.getter);
    swift_endAccess();
    uint64_t v6 = *v4;
    uint64_t v7 = *(void *)(*v4 + 16);
    if (v7)
    {
      uint64_t v29 = (uint64_t *)(v1 + 88);
      uint64_t v8 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
      uint64_t v9 = v6 + 32;
      uint64_t v32 = (void (**)(char *, uint64_t))(v2 + 8);
      v28[1] = v6;
      swift_bridgeObjectRetain();
      *(void *)&long long v10 = 136315394;
      long long v31 = v10;
      uint64_t v30 = (char *)&type metadata for Any + 8;
      do
      {
        sub_10003355C(v9, (uint64_t)v39);
        sub_10003355C((uint64_t)v39, (uint64_t)v38);
        swift_retain_n();
        long long v11 = Logger.logObject.getter();
        os_log_type_t v12 = static os_log_type_t.debug.getter();
        int v13 = v12;
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v14 = swift_slowAlloc();
          uint64_t v36 = swift_slowAlloc();
          uint64_t v37 = v36;
          *(_DWORD *)uint64_t v14 = v31;
          sub_100015384(v38, v38[3]);
          uint64_t v15 = v8;
          uint64_t v16 = v1;
          Swift::UInt32 v17 = v33;
          int v35 = v13;
          dispatch thunk of WorkerProtocol.workerConfig.getter();
          uint64_t v18 = Config.WorkerConfigs.rawValue.getter();
          unint64_t v20 = v19;
          char v21 = v17;
          uint64_t v1 = v16;
          uint64_t v8 = v15;
          (*v32)(v21, v34);
          *(void *)(v14 + 4) = sub_10002E344(v18, v20, &v37);
          swift_bridgeObjectRelease();
          sub_100015434((uint64_t)v38);
          *(_WORD *)(v14 + 12) = 2048;
          uint64_t v22 = *(void *)(v1 + 16);
          swift_release();
          *(void *)(v14 + 14) = v22;
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v35, "Stopping worker { worker=%s, reporterID=%lld  }", (uint8_t *)v14, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_release();
          sub_100015434((uint64_t)v38);
          swift_release();
        }
        sub_100015384(v39, v39[3]);
        dispatch thunk of WorkerProtocol.stop()();
        sub_100015434((uint64_t)v39);
        v9 += 40;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      uint64_t v4 = v29;
    }
    swift_beginAccess();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = *v4;
    if (isUniquelyReferenced_nonNull_native)
    {
      sub_100026740(0, *(void *)(v24 + 16));
    }
    else
    {
      *uint64_t v4 = (uint64_t)sub_100031F28(0, *(void *)(v24 + 24) >> 1, &qword_10004A008);
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    uint64_t v25 = (uint64_t *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
    swift_beginAccess();
    int v26 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = *v25;
    if (v26)
    {
      sub_100026760(0, *(void *)(v27 + 16));
    }
    else
    {
      *uint64_t v25 = (uint64_t)sub_100031F28(0, *(void *)(v27 + 24) >> 1, &qword_10004A000);
      swift_bridgeObjectRelease();
    }
    return swift_endAccess();
  }
  return result;
}

void sub_10002C7CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  __chkstk_darwin(v2);
  unint64_t v41 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for DispatchQoS();
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v39 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchTimeInterval();
  uint64_t v35 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)((char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for DispatchTime();
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  long long v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  int v13 = (char *)&v34 - v12;
  uint64_t v14 = sub_100005E64(&qword_10004A070);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchPredicate();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v20 = (uint64_t *)((char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v21 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *unint64_t v20 = v21;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v20, enum case for DispatchPredicate.onQueue(_:), v17);
  id v36 = v21;
  LOBYTE(v21) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v18 + 8))(v20, v17);
  if (v21)
  {
    swift_retain();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 134217984;
      aBlock[0] = *(void *)(v1 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "enqueueStop() called. { reporterID=%lld }", v24, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    if (*(unsigned char *)(v1 + 66) == 1)
    {
      uint64_t v25 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
      swift_beginAccess();
      sub_100006754(v25, (uint64_t)v16, &qword_10004A070);
      uint64_t v26 = type metadata accessor for Date();
      LODWORD(v25) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v16, 1, v26);
      sub_10003379C((uint64_t)v16, &qword_10004A070);
      if (v25 != 1)
      {
        static DispatchTime.now()();
        void *v7 = *(void *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime);
        uint64_t v27 = v35;
        (*(void (**)(void *, void, uint64_t))(v35 + 104))(v7, enum case for DispatchTimeInterval.seconds(_:), v5);
        + infix(_:_:)();
        (*(void (**)(void *, uint64_t))(v27 + 8))(v7, v5);
        uint64_t v28 = v38;
        uint64_t v37 = *(void *)(v37 + 8);
        ((void (*)(char *, uint64_t))v37)(v11, v38);
        uint64_t v29 = swift_allocObject();
        swift_weakInit();
        aBlock[4] = sub_10003370C;
        aBlock[5] = v29;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        uint64_t aBlock[2] = sub_10001A18C;
        aBlock[3] = &unk_1000463F0;
        uint64_t v30 = _Block_copy(aBlock);
        swift_retain();
        long long v31 = v39;
        static DispatchQoS.unspecified.getter();
        uint64_t v45 = _swiftEmptyArrayStorage;
        sub_10003385C((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_100005E64((uint64_t *)&unk_100049BC0);
        sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
        uint64_t v32 = v41;
        uint64_t v33 = v44;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
        _Block_release(v30);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v33);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v42);
        ((void (*)(char *, uint64_t))v37)(v13, v28);
        swift_release();
        swift_release();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10002CED4()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v34 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DispatchQoS();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005E64(&qword_10004A070);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  long long v11 = (char *)&v31 - v10;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v17 = result;
    uint64_t v33 = v1;
    uint64_t v18 = result + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
    swift_beginAccess();
    sub_100006754(v18, (uint64_t)v11, &qword_10004A070);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      swift_release();
      return sub_10003379C((uint64_t)v11, &qword_10004A070);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
      Date.timeIntervalSinceNow.getter();
      double v20 = fabs(v19);
      double v21 = (double)*(uint64_t *)(v17 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime);
      swift_retain();
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.debug.getter();
      BOOL v24 = os_log_type_enabled(v22, v23);
      uint64_t v32 = v0;
      if (v20 <= v21)
      {
        if (v24)
        {
          uint64_t v26 = swift_slowAlloc();
          *(_DWORD *)uint64_t v26 = 134218240;
          double aBlock = v21 - v20;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v26 + 12) = 2048;
          double aBlock = *(double *)(v17 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "Not stopping session from timer. { remainingTime=%f, reporterID=%lld }", (uint8_t *)v26, 0x16u);
          swift_slowDealloc();
        }
        else
        {
          swift_release();
        }

        uint64_t v31 = *(void *)(v17 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        uint64_t v42 = sub_100033714;
        uint64_t v43 = v17;
        double aBlock = COERCE_DOUBLE(_NSConcreteStackBlock);
        uint64_t v39 = 1107296256;
        uint64_t v27 = &unk_100046418;
      }
      else
      {
        if (v24)
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v25 = 134217984;
          double aBlock = *(double *)(v17 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "Calling stop on session from timer. { reporterID=%lld }", v25, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          swift_release();
        }

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v9, 1, 1, v12);
        swift_beginAccess();
        sub_1000335C0((uint64_t)v9, v18, &qword_10004A070);
        swift_endAccess();
        uint64_t v31 = *(void *)(v17 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        uint64_t v42 = sub_100033718;
        uint64_t v43 = v17;
        double aBlock = COERCE_DOUBLE(_NSConcreteStackBlock);
        uint64_t v39 = 1107296256;
        uint64_t v27 = &unk_100046440;
      }
      uint64_t v40 = sub_10001A18C;
      unint64_t v41 = v27;
      uint64_t v28 = _Block_copy(&aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      uint64_t v37 = _swiftEmptyArrayStorage;
      sub_10003385C((unint64_t *)&qword_1000496E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100005E64((uint64_t *)&unk_100049BC0);
      sub_10002123C((unint64_t *)&qword_1000496F0, (uint64_t *)&unk_100049BC0);
      uint64_t v29 = v34;
      uint64_t v30 = v32;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v28);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v29, v30);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v36);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

void *sub_10002D5A0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
    sub_10002F2A0(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = _swiftEmptyArrayStorage;
    do
    {
      sub_10003355C(v4, (uint64_t)v8);
      sub_100005E64(&qword_100049E28);
      sub_100005E64(&qword_100049E20);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10002F2A0(0, v2[2] + 1, 1);
        uint64_t v2 = v10;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10002F2A0(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v10;
      }
      v2[2] = v6 + 1;
      sub_100033388(&v9, (uint64_t)&v2[5 * v6 + 4]);
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_10002D6DC()
{
  swift_retain_n();
  uint64_t v0 = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136380931;
    uint64_t v3 = static Utilities.serviceTypeDescription(from:)();
    sub_10002E344(v3, v4, &v5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 12) = 2048;
    swift_release();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "serviceType set. { serviceType=%{private}s, reporterID=%lld }", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_10002D874()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003379C(v0 + 96, &qword_100049818);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  sub_10003379C(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &qword_10004A070);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10002D960()
{
  sub_10002D874();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10002D9B8()
{
  return type metadata accessor for Session();
}

uint64_t type metadata accessor for Session()
{
  uint64_t result = qword_100049EC0;
  if (!qword_100049EC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002DA0C()
{
  type metadata accessor for Logger();
  if (v0 <= 0x3F)
  {
    sub_10002DB78();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10002DB78()
{
  if (!qword_100049ED0)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100049ED0);
    }
  }
}

uint64_t sub_10002DBD0()
{
  uint64_t v1 = type metadata accessor for Message();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002DC9C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Message() - 8);
  return sub_1000273DC(v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_10002DD00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002DD10()
{
  return swift_release();
}

char *sub_10002DD18(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10002DFC0(a1, a2, a3, a4, &qword_10004A068, (void (*)(void, int64_t, char *, char *))sub_1000324F4);
}

void *sub_10002DD38(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005E64(&qword_10004A078);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100032400(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10002DE48(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_10002DE70(a1, a2, a3, a4, &qword_10004A008, &qword_100049E20);
}

void *sub_10002DE5C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_10002DE70(a1, a2, a3, a4, &qword_10004A000, &qword_100049E28);
}

void *sub_10002DE70(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_100005E64(a5);
      uint64_t v13 = (void *)swift_allocObject();
      size_t v14 = j__malloc_size(v13);
      v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
      uint64_t v15 = v13 + 4;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4]) {
          memmove(v15, a4 + 4, 40 * v11);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = _swiftEmptyArrayStorage;
      uint64_t v15 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10003327C(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

char *sub_10002DFA0(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10002DFC0(a1, a2, a3, a4, &qword_10004A020, (void (*)(void, int64_t, char *, char *))sub_1000325E0);
}

char *sub_10002DFC0(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, void (*a6)(void, int64_t, char *, char *))
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = *((void *)a4 + 3);
  int64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v10 = a2;
    }
LABEL_8:
    int64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      int64_t v12 = *((void *)a4 + 2);
    }
    else {
      int64_t v12 = v10;
    }
    if (v12)
    {
      sub_100005E64(a5);
      uint64_t v13 = (char *)swift_allocObject();
      int64_t v14 = j__malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 17;
      }
      *((void *)v13 + 2) = v11;
      *((void *)v13 + 3) = 2 * (v15 >> 4);
      uint64_t v16 = v13 + 32;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v16 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[16 * v11 + 32]) {
          memmove(v16, a4 + 32, 16 * v11);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    a6(0, v11, v16, a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002E0DC(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_100005E64(&qword_10004A018);
  uint64_t v10 = *(void *)(type metadata accessor for Message() - 8);
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
  uint64_t v16 = *(void *)(type metadata accessor for Message() - 8);
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
    sub_1000333A0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10002E344(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002E418(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000153C8((uint64_t)v12, *a3);
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
      sub_1000153C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100015434((uint64_t)v12);
  return v7;
}

uint64_t sub_10002E418(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10002E5D4(a5, a6);
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

uint64_t sub_10002E5D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002E66C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002E8C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002E8C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002E66C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10002E7E4(v2, 0);
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

void *sub_10002E7E4(uint64_t a1, uint64_t a2)
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
  sub_100005E64(&qword_10004A010);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002E84C(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10002E8C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E64(&qword_10004A010);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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

unint64_t sub_10002EA18(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = static Hasher._hash(seed:_:)();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            size_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *size_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            uint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *uint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *unint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10002EBB0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Swift::UInt32 v9 = *(_DWORD *)(*(void *)(a2 + 48) + 4 * v6);
        Hasher.init(_seed:)();
        Hasher._combine(_:)(v9);
        uint64_t result = Hasher._finalize()();
        unint64_t v10 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        unint64_t v12 = (_DWORD *)(v11 + 4 * v3);
        unint64_t v13 = (_DWORD *)(v11 + 4 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *unint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for Message() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10002EDA4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureInfo(0);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v30 = a2;
    uint64_t v12 = ~v10;
    unint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      uint64_t v28 = v12;
      unint64_t v29 = (result + 1) & v12;
      uint64_t v13 = *(void *)(v5 + 72);
      while (1)
      {
        uint64_t v14 = v13;
        int64_t v15 = v13 * v11;
        sub_1000337F8(*(void *)(v30 + 48) + v13 * v11, (uint64_t)v8);
        Hasher.init(_seed:)();
        type metadata accessor for SystemMonitorConfig.MonitorType();
        sub_10003385C(&qword_100049E30, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType);
        dispatch thunk of Hashable.hash(into:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        type metadata accessor for SystemMonitorConfig.DataType();
        sub_10003385C(&qword_100049E38, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType);
        dispatch thunk of Hashable.hash(into:)();
        Swift::Int v16 = Hasher._finalize()();
        unint64_t result = sub_10000C728((uint64_t)v8);
        Swift::Int v17 = v16 & v12;
        if (a1 < (uint64_t)v29) {
          break;
        }
        if (v17 >= v29)
        {
          uint64_t v13 = v14;
          if (a1 < v17) {
            goto LABEL_6;
          }
          goto LABEL_13;
        }
LABEL_5:
        uint64_t v13 = v14;
LABEL_6:
        unint64_t v11 = (v11 + 1) & v12;
        if (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
          goto LABEL_23;
        }
      }
      uint64_t v13 = v14;
      if (v17 < v29 && a1 < v17) {
        goto LABEL_6;
      }
LABEL_13:
      uint64_t v18 = v30;
      if (v13 * a1 < v15 || *(void *)(v30 + 48) + v13 * a1 >= (unint64_t)(*(void *)(v30 + 48) + v15 + v13))
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v13 * a1 != v15)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v19 = *(void *)(v18 + 56);
      uint64_t v20 = *(void *)(*(void *)(type metadata accessor for FeatureState(0) - 8) + 72);
      int64_t v21 = v20 * a1;
      unint64_t result = v19 + v20 * a1;
      if (v20 * a1 >= (uint64_t)(v20 * v11) && result < v19 + v20 * v11 + v20)
      {
        a1 = v11;
        uint64_t v12 = v28;
        uint64_t v13 = v14;
        if (v21 != v20 * v11)
        {
          unint64_t result = swift_arrayInitWithTakeBackToFront();
          a1 = v11;
        }
        goto LABEL_6;
      }
      unint64_t result = swift_arrayInitWithTakeFrontToBack();
      a1 = v11;
      uint64_t v12 = v28;
      goto LABEL_5;
    }
LABEL_23:
    uint64_t v22 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << a1) - 1;
    a2 = v30;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << a1) - 1;
  }
  *uint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10002F200(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F300(a1, a2, a3, (void *)*v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_10002F220(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F540(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002F240(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F6AC(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002F260(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F80C(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002F280(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F95C(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002F2A0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002FABC(a1, a2, a3, (void *)*v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_10002F2C0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002FC60(a1, a2, a3, *v3);
  *int64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002F2E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002FDC0(a1, a2, a3, (void *)*v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_10002F300(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005E64(&qword_10004A098);
  uint64_t v10 = *(void *)(type metadata accessor for FeatureInfo(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for FeatureInfo(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  int64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002F540(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E64(&qword_10004A078);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
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

uint64_t sub_10002F6AC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E64(&qword_100049810);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002F80C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E64(&qword_10004A080);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002F95C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E64(&qword_10004A068);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002FABC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005E64(&qword_10004A008);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_100005E64(&qword_100049E20);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002FC60(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E64(&qword_10004A090);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002FDC0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005E64(&qword_10004A088);
  uint64_t v10 = *(void *)(sub_100005E64(&qword_100049688) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100005E64(&qword_100049688) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  int64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int sub_100030008(void *a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t))
{
  v134 = a3;
  long long v139 = a2;
  uint64_t v4 = v3;
  uint64_t v138 = type metadata accessor for Config.WorkerConfigs();
  uint64_t v6 = *(void *)(v138 - 8);
  uint64_t v7 = __chkstk_darwin(v138);
  v137 = (char *)&v122 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  long long v136 = (char *)&v122 - v9;
  Swift::Int v10 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v10);
  if (result >= v10)
  {
    if (v10 < 0) {
      goto LABEL_137;
    }
    if (v10) {
      return sub_100030B88(0, v10, 1, a1, v134);
    }
    return result;
  }
  if (v10 >= 0) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v10 + 1;
  }
  if (v10 < -1) {
    goto LABEL_145;
  }
  Swift::Int v13 = result;
  v132 = a1;
  if (v10 < 2)
  {
    uint64_t v16 = _swiftEmptyArrayStorage;
    v133 = (char *)&_swiftEmptyArrayStorage[4];
    if (v10 != 1)
    {
      unint64_t v19 = _swiftEmptyArrayStorage[2];
      uint64_t v18 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
      unint64_t v124 = v16;
      if (v19 >= 2)
      {
        uint64_t v115 = *a1;
        do
        {
          unint64_t v116 = v19 - 2;
          if (v19 < 2) {
            goto LABEL_132;
          }
          if (!v115) {
            goto LABEL_144;
          }
          uint64_t v117 = v4;
          uint64_t v118 = *(void *)&v18[16 * v116 + 32];
          uint64_t v119 = *(void *)&v18[16 * v19 + 24];
          sub_100030E2C((char *)(v115 + 40 * v118), (char *)(v115 + 40 * *(void *)&v18[16 * v19 + 16]), (char *)(v115 + 40 * v119), v133, v134);
          if (v117) {
            break;
          }
          if (v119 < v118) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v18 = sub_100031654((uint64_t)v18);
          }
          if (v116 >= *((void *)v18 + 2)) {
            goto LABEL_134;
          }
          v120 = &v18[16 * v116 + 32];
          *(void *)v120 = v118;
          *((void *)v120 + 1) = v119;
          unint64_t v121 = *((void *)v18 + 2);
          if (v19 > v121) {
            goto LABEL_135;
          }
          memmove(&v18[16 * v19 + 16], &v18[16 * v19 + 32], 16 * (v121 - v19));
          *((void *)v18 + 2) = v121 - 1;
          unint64_t v19 = v121 - 1;
          uint64_t v4 = 0;
        }
        while (v121 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      v124[2] = 0;
      return swift_bridgeObjectRelease();
    }
    unint64_t v124 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v14 = v12 >> 1;
    sub_100005E64(&qword_100049E20);
    uint64_t v15 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v15 + 16) = v14;
    a1 = v132;
    unint64_t v124 = (void *)v15;
    v133 = (char *)(v15 + 32);
  }
  Swift::Int v17 = 0;
  v135 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v126 = v13;
  while (1)
  {
    Swift::Int v20 = v17 + 1;
    Swift::Int v130 = v17;
    if (v17 + 1 < v10)
    {
      uint64_t v127 = *a1;
      uint64_t v21 = v127;
      sub_10003355C(v127 + 40 * v20, (uint64_t)&v146);
      sub_10003355C(v21 + 40 * v17, (uint64_t)v143);
      sub_100015384(&v146, v147);
      unint64_t v22 = v136;
      uint64_t v23 = dispatch thunk of WorkerProtocol.workerConfig.getter();
      uint64_t v24 = v139;
      LODWORD(v131) = v139(v23);
      Swift::Int v141 = v10;
      uint64_t v25 = *v135;
      BOOL v26 = v22;
      uint64_t v27 = v138;
      (*v135)(v26, v138);
      uint64_t v148 = v145;
      sub_100015384(v143, v144);
      uint64_t v28 = v137;
      uint64_t v29 = dispatch thunk of WorkerProtocol.workerConfig.getter();
      LODWORD(v129) = v24(v29);
      uint64_t v30 = v27;
      Swift::Int v17 = v130;
      uint64_t v128 = v25;
      v25(v28, v30);
      sub_100015434((uint64_t)v143);
      sub_100015434((uint64_t)&v146);
      Swift::Int v20 = v17 + 2;
      if (v17 + 2 >= v141)
      {
        Swift::Int v10 = v141;
      }
      else
      {
        uint64_t v123 = v4;
        v125 = v18;
        uint64_t v31 = v127 + 40 * v17 + 40;
        while (1)
        {
          Swift::Int v140 = v20;
          LODWORD(v148) = v131 < v129;
          sub_10003355C(v31 + 40, (uint64_t)&v146);
          sub_10003355C(v31, (uint64_t)v143);
          sub_100015384(&v146, v147);
          uint64_t v32 = v136;
          uint64_t v33 = dispatch thunk of WorkerProtocol.workerConfig.getter();
          uint64_t v34 = v139;
          LOBYTE(v142) = v139(v33);
          LODWORD(v142) = v142;
          uint64_t v35 = v32;
          uint64_t v36 = v138;
          uint64_t v37 = v128;
          v128(v35, v138);
          sub_100015384(v143, v144);
          uint64_t v38 = v137;
          uint64_t v39 = dispatch thunk of WorkerProtocol.workerConfig.getter();
          unsigned __int8 v40 = v34(v39);
          v37(v38, v36);
          int v41 = v142 >= v40;
          sub_100015434((uint64_t)v143);
          sub_100015434((uint64_t)&v146);
          if (v148 == v41) {
            break;
          }
          Swift::Int v20 = v140 + 1;
          v31 += 40;
          if (v141 == v140 + 1)
          {
            Swift::Int v10 = v141;
            Swift::Int v20 = v141;
            uint64_t v18 = v125;
            uint64_t v4 = v123;
            goto LABEL_24;
          }
        }
        uint64_t v18 = v125;
        uint64_t v4 = v123;
        Swift::Int v20 = v140;
        Swift::Int v10 = v141;
LABEL_24:
        Swift::Int v17 = v130;
      }
      a1 = v132;
      Swift::Int v13 = v126;
      if (v131 < v129)
      {
        if (v20 < v17) {
          goto LABEL_138;
        }
        if (v17 < v20) {
          break;
        }
      }
    }
    if (v20 < v10) {
      goto LABEL_35;
    }
LABEL_53:
    if (v20 < v17) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v18 = sub_1000313D0(0, *((void *)v18 + 2) + 1, 1, v18);
    }
    unint64_t v64 = *((void *)v18 + 2);
    unint64_t v63 = *((void *)v18 + 3);
    unint64_t v19 = v64 + 1;
    if (v64 >= v63 >> 1) {
      uint64_t v18 = sub_1000313D0((char *)(v63 > 1), v64 + 1, 1, v18);
    }
    *((void *)v18 + 2) = v19;
    uint64_t v65 = v18 + 32;
    uint64_t v66 = &v18[16 * v64 + 32];
    *(void *)uint64_t v66 = v17;
    *((void *)v66 + 1) = v20;
    Swift::Int v140 = v20;
    if (v64)
    {
      while (1)
      {
        unint64_t v67 = v19 - 1;
        if (v19 >= 4)
        {
          int v72 = &v65[16 * v19];
          uint64_t v73 = *((void *)v72 - 8);
          uint64_t v74 = *((void *)v72 - 7);
          BOOL v78 = __OFSUB__(v74, v73);
          uint64_t v75 = v74 - v73;
          if (v78) {
            goto LABEL_120;
          }
          uint64_t v77 = *((void *)v72 - 6);
          uint64_t v76 = *((void *)v72 - 5);
          BOOL v78 = __OFSUB__(v76, v77);
          uint64_t v70 = v76 - v77;
          char v71 = v78;
          if (v78) {
            goto LABEL_121;
          }
          unint64_t v79 = v19 - 2;
          long long v80 = &v65[16 * v19 - 32];
          uint64_t v82 = *(void *)v80;
          uint64_t v81 = *((void *)v80 + 1);
          BOOL v78 = __OFSUB__(v81, v82);
          uint64_t v83 = v81 - v82;
          if (v78) {
            goto LABEL_123;
          }
          BOOL v78 = __OFADD__(v70, v83);
          uint64_t v84 = v70 + v83;
          if (v78) {
            goto LABEL_126;
          }
          if (v84 >= v75)
          {
            v102 = &v65[16 * v67];
            uint64_t v104 = *(void *)v102;
            uint64_t v103 = *((void *)v102 + 1);
            BOOL v78 = __OFSUB__(v103, v104);
            uint64_t v105 = v103 - v104;
            if (v78) {
              goto LABEL_130;
            }
            BOOL v95 = v70 < v105;
            goto LABEL_90;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v96 = *((void *)v18 + 4);
            uint64_t v97 = *((void *)v18 + 5);
            BOOL v78 = __OFSUB__(v97, v96);
            uint64_t v89 = v97 - v96;
            char v90 = v78;
            goto LABEL_84;
          }
          uint64_t v69 = *((void *)v18 + 4);
          uint64_t v68 = *((void *)v18 + 5);
          BOOL v78 = __OFSUB__(v68, v69);
          uint64_t v70 = v68 - v69;
          char v71 = v78;
        }
        if (v71) {
          goto LABEL_122;
        }
        unint64_t v79 = v19 - 2;
        uint64_t v85 = &v65[16 * v19 - 32];
        uint64_t v87 = *(void *)v85;
        uint64_t v86 = *((void *)v85 + 1);
        BOOL v88 = __OFSUB__(v86, v87);
        uint64_t v89 = v86 - v87;
        char v90 = v88;
        if (v88) {
          goto LABEL_125;
        }
        uint64_t v91 = &v65[16 * v67];
        uint64_t v93 = *(void *)v91;
        uint64_t v92 = *((void *)v91 + 1);
        BOOL v78 = __OFSUB__(v92, v93);
        uint64_t v94 = v92 - v93;
        if (v78) {
          goto LABEL_128;
        }
        if (__OFADD__(v89, v94)) {
          goto LABEL_129;
        }
        if (v89 + v94 >= v70)
        {
          BOOL v95 = v70 < v94;
LABEL_90:
          if (v95) {
            unint64_t v67 = v79;
          }
          goto LABEL_92;
        }
LABEL_84:
        if (v90) {
          goto LABEL_124;
        }
        uint64_t v98 = &v65[16 * v67];
        uint64_t v100 = *(void *)v98;
        uint64_t v99 = *((void *)v98 + 1);
        BOOL v78 = __OFSUB__(v99, v100);
        uint64_t v101 = v99 - v100;
        if (v78) {
          goto LABEL_127;
        }
        if (v101 < v89) {
          goto LABEL_15;
        }
LABEL_92:
        unint64_t v106 = v67 - 1;
        if (v67 - 1 >= v19)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        uint64_t v107 = *a1;
        if (!*a1) {
          goto LABEL_142;
        }
        os_log_type_t v108 = v18;
        uint64_t v109 = &v65[16 * v106];
        uint64_t v110 = *(void *)v109;
        uint64_t v111 = v65;
        uint64_t v112 = &v65[16 * v67];
        uint64_t v113 = *((void *)v112 + 1);
        sub_100030E2C((char *)(v107 + 40 * *(void *)v109), (char *)(v107 + 40 * *(void *)v112), (char *)(v107 + 40 * v113), v133, v134);
        if (v4) {
          goto LABEL_113;
        }
        if (v113 < v110) {
          goto LABEL_117;
        }
        if (v67 > *((void *)v108 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v109 = v110;
        *(void *)&v111[16 * v106 + 8] = v113;
        unint64_t v114 = *((void *)v108 + 2);
        if (v67 >= v114) {
          goto LABEL_119;
        }
        uint64_t v18 = v108;
        unint64_t v19 = v114 - 1;
        memmove(v112, v112 + 16, 16 * (v114 - 1 - v67));
        uint64_t v65 = v111;
        *((void *)v108 + 2) = v114 - 1;
        a1 = v132;
        if (v114 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v19 = 1;
LABEL_15:
    Swift::Int v10 = a1[1];
    Swift::Int v17 = v140;
    Swift::Int v13 = v126;
    if (v140 >= v10)
    {
      uint64_t v16 = v124;
      goto LABEL_102;
    }
  }
  v125 = v18;
  uint64_t v42 = 40 * v20 - 40;
  Swift::Int v43 = v20;
  uint64_t v44 = 40 * v17;
  Swift::Int v45 = v17;
  do
  {
    if (v45 != --v43)
    {
      if (!v127) {
        goto LABEL_143;
      }
      uint64_t v46 = v127 + v44;
      uint64_t v47 = v127 + v42;
      sub_100033388((long long *)(v127 + v44), (uint64_t)&v146);
      uint64_t v48 = *(void *)(v47 + 32);
      long long v49 = *(_OWORD *)(v47 + 16);
      *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
      *(_OWORD *)(v46 + 16) = v49;
      *(void *)(v46 + 32) = v48;
      sub_100033388(&v146, v47);
    }
    ++v45;
    v42 -= 40;
    v44 += 40;
  }
  while (v45 < v43);
  uint64_t v18 = v125;
  a1 = v132;
  Swift::Int v13 = v126;
  Swift::Int v10 = v141;
  if (v20 >= v141) {
    goto LABEL_53;
  }
LABEL_35:
  if (__OFSUB__(v20, v17)) {
    goto LABEL_136;
  }
  if (v20 - v17 >= v13) {
    goto LABEL_53;
  }
  if (__OFADD__(v17, v13)) {
    goto LABEL_139;
  }
  if (v17 + v13 >= v10) {
    Swift::Int v50 = v10;
  }
  else {
    Swift::Int v50 = v17 + v13;
  }
  if (v50 >= v17)
  {
    if (v20 != v50)
    {
      v125 = v18;
      uint64_t v123 = v4;
      uint64_t v51 = 40 * v20 - 40;
      Swift::Int v129 = v50;
      do
      {
        Swift::Int v140 = v20;
        uint64_t v131 = v51;
        do
        {
          Swift::Int v141 = v17;
          uint64_t v52 = *a1 + v51;
          sub_10003355C(v52 + 40, (uint64_t)&v146);
          sub_10003355C(v52, (uint64_t)v143);
          sub_100015384(&v146, v147);
          uint64_t v53 = v136;
          uint64_t v54 = dispatch thunk of WorkerProtocol.workerConfig.getter();
          uint64_t v55 = v139;
          LOBYTE(v148) = v139(v54);
          LODWORD(v148) = v148;
          long long v142 = *v135;
          uint64_t v56 = v53;
          uint64_t v57 = v138;
          v142(v56, v138);
          sub_100015384(v143, v144);
          unint64_t v58 = v137;
          uint64_t v59 = dispatch thunk of WorkerProtocol.workerConfig.getter();
          LOBYTE(v52) = v55(v59);
          v142(v58, v57);
          sub_100015434((uint64_t)v143);
          sub_100015434((uint64_t)&v146);
          if (v148 >= v52) {
            break;
          }
          uint64_t v60 = *a1;
          if (!*a1) {
            goto LABEL_141;
          }
          uint64_t v61 = v60 + v51;
          sub_100033388((long long *)(v60 + v51 + 40), (uint64_t)&v146);
          long long v62 = *(_OWORD *)(v61 + 16);
          *(_OWORD *)(v61 + 40) = *(_OWORD *)v61;
          *(_OWORD *)(v61 + 56) = v62;
          *(void *)(v61 + 72) = *(void *)(v61 + 32);
          sub_100033388(&v146, v61);
          v51 -= 40;
          Swift::Int v17 = v141 + 1;
        }
        while (v140 != v141 + 1);
        Swift::Int v20 = v140 + 1;
        uint64_t v51 = v131 + 40;
        Swift::Int v17 = v130;
      }
      while (v140 + 1 != v129);
      Swift::Int v20 = v129;
      uint64_t v4 = v123;
      uint64_t v18 = v125;
    }
    goto LABEL_53;
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100030B88(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v36 = a5;
  uint64_t v29 = a1;
  uint64_t v35 = type metadata accessor for Config.WorkerConfigs();
  uint64_t v8 = __chkstk_darwin(v35);
  uint64_t v34 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v33 = &v27[-v12];
  uint64_t v37 = a3;
  uint64_t v28 = a2;
  if (a3 != a2)
  {
    uint64_t v31 = v11 + 8;
    uint64_t v32 = a4;
    uint64_t v13 = 40 * v37 - 40;
    uint64_t v14 = (void (**)(unsigned char *, uint64_t))(v11 + 8);
    uint64_t v15 = v35;
LABEL_5:
    uint64_t v38 = v29;
    uint64_t v30 = v13;
    while (1)
    {
      uint64_t v16 = *a4 + v13;
      sub_10003355C(v16 + 40, (uint64_t)&v40);
      sub_10003355C(v16, (uint64_t)v39);
      sub_100015384(&v40, v41);
      Swift::Int v17 = v33;
      uint64_t v18 = dispatch thunk of WorkerProtocol.workerConfig.getter();
      unint64_t v19 = v36;
      LOBYTE(v42) = v36(v18);
      unsigned int v42 = v42;
      Swift::Int v20 = *v14;
      (*v14)(v17, v15);
      sub_100015384(v39, v39[3]);
      uint64_t v21 = v34;
      uint64_t v22 = dispatch thunk of WorkerProtocol.workerConfig.getter();
      char v23 = v19(v22);
      a4 = v32;
      LOBYTE(v16) = v23;
      v20(v21, v15);
      sub_100015434((uint64_t)v39);
      uint64_t result = sub_100015434((uint64_t)&v40);
      if (v42 >= v16)
      {
LABEL_4:
        uint64_t v13 = v30 + 40;
        if (++v37 == v28) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v24 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v25 = v24 + v13;
      sub_100033388((long long *)(v24 + v13 + 40), (uint64_t)&v40);
      long long v26 = *(_OWORD *)(v25 + 16);
      *(_OWORD *)(v25 + 40) = *(_OWORD *)v25;
      *(_OWORD *)(v25 + 56) = v26;
      *(void *)(v25 + 72) = *(void *)(v25 + 32);
      uint64_t result = sub_100033388(&v40, v25);
      v13 -= 40;
      if (v37 == ++v38) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100030E2C(char *a1, char *a2, char *a3, char *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v68 = a5;
  uint64_t v67 = type metadata accessor for Config.WorkerConfigs();
  uint64_t v9 = *(void *)(v67 - 8);
  uint64_t v10 = __chkstk_darwin(v67);
  uint64_t v66 = &v57[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v65 = &v57[-v12];
  uint64_t v13 = a2 - a1;
  uint64_t v14 = (a2 - a1) / 40;
  unint64_t v63 = a3;
  uint64_t v15 = a3 - a2;
  uint64_t v16 = v15 / 40;
  uint64_t v75 = a1;
  uint64_t v74 = a4;
  if (v14 >= v15 / 40)
  {
    if (v15 < -39) {
      goto LABEL_43;
    }
    if (a4 != a2 || &a2[40 * v16] <= a4) {
      memmove(a4, a2, 40 * v16);
    }
    uint64_t v35 = &a4[40 * v16];
    unint64_t v73 = (unint64_t)v35;
    uint64_t v75 = a2;
    if (v15 < 40 || a1 >= a2) {
      goto LABEL_42;
    }
    unint64_t v58 = (void (**)(unsigned char *, uint64_t))(v9 + 8);
    uint64_t v36 = v63 - 40;
    uint64_t v60 = a4;
    uint64_t v59 = a1;
    while (1)
    {
      unint64_t v63 = a2;
      unint64_t v64 = v36 + 40;
      sub_10003355C((uint64_t)(v35 - 40), (uint64_t)v71);
      uint64_t v61 = a2 - 40;
      sub_10003355C((uint64_t)(a2 - 40), (uint64_t)v69);
      sub_100015384(v71, v72);
      uint64_t v37 = v65;
      uint64_t v38 = dispatch thunk of WorkerProtocol.workerConfig.getter();
      uint64_t v39 = v68;
      LOBYTE(v62) = v68(v38);
      LODWORD(v62) = v62;
      long long v40 = *v58;
      uint64_t v41 = v37;
      uint64_t v42 = v67;
      (*v58)(v41, v67);
      sub_100015384(v69, v70);
      Swift::Int v43 = v66;
      uint64_t v44 = dispatch thunk of WorkerProtocol.workerConfig.getter();
      unsigned __int8 v45 = v39(v44);
      v40(v43, v42);
      sub_100015434((uint64_t)v69);
      sub_100015434((uint64_t)v71);
      if (v62 >= v45)
      {
        uint64_t v46 = v63;
        unint64_t v49 = v73;
        uint64_t v35 = (char *)(v73 - 40);
        v73 -= 40;
        if ((unint64_t)v64 >= v49 && (unint64_t)v36 < v49)
        {
          Swift::Int v50 = v60;
          uint64_t v51 = v59;
          if (v64 != (char *)v49)
          {
            long long v52 = *(_OWORD *)v35;
            long long v53 = *((_OWORD *)v35 + 1);
            *((void *)v36 + 4) = *((void *)v35 + 4);
            *(_OWORD *)uint64_t v36 = v52;
            *((_OWORD *)v36 + 1) = v53;
          }
          goto LABEL_40;
        }
        long long v54 = *(_OWORD *)v35;
        long long v55 = *(_OWORD *)(v49 - 24);
        *((void *)v36 + 4) = *(void *)(v49 - 8);
        *(_OWORD *)uint64_t v36 = v54;
        *((_OWORD *)v36 + 1) = v55;
      }
      else
      {
        uint64_t v46 = v61;
        if (v64 != v63 || v36 >= v63)
        {
          long long v47 = *(_OWORD *)v61;
          long long v48 = *((_OWORD *)v61 + 1);
          *((void *)v36 + 4) = *((void *)v61 + 4);
          *(_OWORD *)uint64_t v36 = v47;
          *((_OWORD *)v36 + 1) = v48;
        }
        v75 -= 40;
        uint64_t v35 = (char *)v73;
      }
      Swift::Int v50 = v60;
      uint64_t v51 = v59;
LABEL_40:
      if (v35 > v50)
      {
        v36 -= 40;
        a2 = v46;
        if (v46 > v51) {
          continue;
        }
      }
      goto LABEL_42;
    }
  }
  if (v13 >= -39)
  {
    if (a4 != a1 || &a1[40 * v14] <= a4) {
      memmove(a4, a1, 40 * v14);
    }
    unint64_t v62 = (unint64_t)&a4[40 * v14];
    unint64_t v73 = v62;
    if (v13 >= 40 && a2 < v63)
    {
      uint64_t v61 = (char *)(v9 + 8);
      Swift::Int v17 = v68;
      uint64_t v18 = (void (**)(unsigned char *, uint64_t))(v9 + 8);
      unint64_t v19 = v66;
      do
      {
        sub_10003355C((uint64_t)a2, (uint64_t)v71);
        sub_10003355C((uint64_t)a4, (uint64_t)v69);
        sub_100015384(v71, v72);
        Swift::Int v20 = v65;
        uint64_t v21 = dispatch thunk of WorkerProtocol.workerConfig.getter();
        LOBYTE(v64) = v17(v21);
        LODWORD(v64) = v64;
        uint64_t v22 = a2;
        char v23 = *v18;
        uint64_t v24 = v20;
        uint64_t v25 = v67;
        (*v18)(v24, v67);
        sub_100015384(v69, v70);
        uint64_t v26 = dispatch thunk of WorkerProtocol.workerConfig.getter();
        unsigned __int8 v27 = v17(v26);
        v23(v19, v25);
        sub_100015434((uint64_t)v69);
        sub_100015434((uint64_t)v71);
        uint64_t v28 = v75;
        if (v64 >= v27)
        {
          uint64_t v32 = v74 + 40;
          if (v75 != v74 || v75 >= v32)
          {
            long long v33 = *(_OWORD *)v74;
            long long v34 = *((_OWORD *)v74 + 1);
            *((void *)v75 + 4) = *((void *)v74 + 4);
            *uint64_t v28 = v33;
            v28[1] = v34;
          }
          uint64_t v74 = v32;
          unint64_t v29 = (unint64_t)v22;
        }
        else
        {
          unint64_t v29 = (unint64_t)(v22 + 40);
          if (v75 >= v22 && (unint64_t)v75 < v29 && v75 == v22)
          {
            uint64_t v28 = v22;
          }
          else
          {
            long long v30 = *(_OWORD *)v22;
            long long v31 = *((_OWORD *)v22 + 1);
            *((void *)v75 + 4) = *((void *)v22 + 4);
            *uint64_t v28 = v30;
            v28[1] = v31;
          }
        }
        uint64_t v75 = (char *)v28 + 40;
        a4 = v74;
        if ((unint64_t)v74 >= v62) {
          break;
        }
        a2 = (char *)v29;
      }
      while (v29 < (unint64_t)v63);
    }
LABEL_42:
    sub_100031588((void **)&v75, (const void **)&v74, &v73);
    return 1;
  }
LABEL_43:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1000313D0(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005E64(&qword_10004A060);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1000314CC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_100031588(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -40)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
    {
      return (char *)memmove(result, v3, 40 * v6);
    }
  }
  return result;
}

char *sub_100031654(uint64_t a1)
{
  return sub_1000313D0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100031668@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (char *)a1 + *(int *)(sub_100005E64(&qword_10004A028) + 48);
  uint64_t v5 = (char *)a2 + *(int *)(sub_100005E64(&qword_100049688) + 48);
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = type metadata accessor for SimpleType();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v5, v4, v8);
  *a2 = v7;
  a2[1] = v6;

  return swift_bridgeObjectRetain();
}

uint64_t sub_10003171C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  long long v55 = a5;
  uint64_t v9 = type metadata accessor for SimpleType();
  uint64_t v45 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v44 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v43 - v12;
  uint64_t v14 = sub_100005E64(&qword_10004A030);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (void *)((char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v18 = ~v17;
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v20 = -v17;
  uint64_t v48 = a1;
  uint64_t v49 = a1 + 64;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  else {
    uint64_t v21 = -1;
  }
  uint64_t v50 = v18;
  uint64_t v51 = 0;
  uint64_t v52 = v21 & v19;
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  v43[2] = a1;
  swift_bridgeObjectRetain();
  v43[1] = a3;
  swift_retain();
  sub_100031FBC((uint64_t)v16);
  uint64_t v22 = sub_100005E64(&qword_100049688);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v16, 1, v22) == 1)
  {
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    sub_10000F9A4();
    return swift_release();
  }
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
  uint64_t v47 = v45 + 32;
  v43[5] = v45 + 8;
  v43[6] = v45 + 16;
  v43[4] = v45 + 40;
  while (1)
  {
    uint64_t v27 = *v16;
    uint64_t v26 = v16[1];
    uint64_t v28 = v13;
    v46(v13, (char *)v16 + *(int *)(v22 + 48), v9);
    uint64_t v29 = *v55;
    unint64_t v31 = sub_100022EA0(v27, v26);
    uint64_t v32 = *(void *)(v29 + 16);
    BOOL v33 = (v30 & 1) == 0;
    uint64_t v34 = v32 + v33;
    if (__OFADD__(v32, v33)) {
      break;
    }
    char v35 = v30;
    if (*(void *)(v29 + 24) >= v34)
    {
      if (a4)
      {
        if (v30) {
          goto LABEL_7;
        }
      }
      else
      {
        sub_1000256F0();
        if (v35) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      sub_1000234CC(v34, a4 & 1);
      unint64_t v36 = sub_100022EA0(v27, v26);
      if ((v35 & 1) != (v37 & 1)) {
        goto LABEL_22;
      }
      unint64_t v31 = v36;
      if (v35)
      {
LABEL_7:
        uint64_t v25 = v44;
        uint64_t v24 = v45;
        uint64_t v13 = v28;
        (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v44, v28, v9);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v9);
        swift_bridgeObjectRelease();
        (*(void (**)(unint64_t, char *, uint64_t))(v24 + 40))(*(void *)(*v55 + 56) + *(void *)(v24 + 72) * v31, v25, v9);
        goto LABEL_8;
      }
    }
    uint64_t v38 = (void *)*v55;
    *(void *)(*v55 + 8 * (v31 >> 6) + 64) |= 1 << v31;
    uint64_t v39 = (uint64_t *)(v38[6] + 16 * v31);
    *uint64_t v39 = v27;
    v39[1] = v26;
    uint64_t v13 = v28;
    v46((char *)(v38[7] + *(void *)(v45 + 72) * v31), v28, v9);
    uint64_t v40 = v38[2];
    BOOL v41 = __OFADD__(v40, 1);
    uint64_t v42 = v40 + 1;
    if (v41) {
      goto LABEL_21;
    }
    _OWORD v38[2] = v42;
LABEL_8:
    sub_100031FBC((uint64_t)v16);
    uint64_t v22 = sub_100005E64(&qword_100049688);
    a4 = 1;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v16, 1, v22) == 1) {
      goto LABEL_5;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_100031B6C(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for SimpleType();
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v52 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v49 = (char *)&v43 - v12;
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  uint64_t v48 = v11;
  sub_100005E64(&qword_100049690);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v14 = result;
  Swift::Int v43 = a1;
  uint64_t v44 = a2;
  if (a2 < 1) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = *a1;
  }
  uint64_t v16 = 0;
  uint64_t v46 = v50 + 32;
  uint64_t v47 = v50 + 16;
  uint64_t v17 = result + 64;
  uint64_t v18 = v48;
  uint64_t v45 = a4;
  while (1)
  {
    if (v15)
    {
      unint64_t v19 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      uint64_t v51 = v16;
      unint64_t v20 = v19 | (v16 << 6);
    }
    else
    {
      uint64_t v21 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        goto LABEL_40;
      }
      if (v21 >= v44) {
        return v14;
      }
      unint64_t v22 = v43[v21];
      uint64_t v23 = v16 + 1;
      if (!v22)
      {
        uint64_t v23 = v16 + 2;
        if (v16 + 2 >= v44) {
          return v14;
        }
        unint64_t v22 = v43[v23];
        if (!v22)
        {
          uint64_t v23 = v16 + 3;
          if (v16 + 3 >= v44) {
            return v14;
          }
          unint64_t v22 = v43[v23];
          if (!v22)
          {
            uint64_t v24 = v16 + 4;
            if (v16 + 4 >= v44) {
              return v14;
            }
            unint64_t v22 = v43[v24];
            if (!v22)
            {
              while (1)
              {
                uint64_t v23 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v23 >= v44) {
                  return v14;
                }
                unint64_t v22 = v43[v23];
                ++v24;
                if (v22) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v23 = v16 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v15 = (v22 - 1) & v22;
      uint64_t v51 = v23;
      unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
    }
    uint64_t v25 = a4[7];
    uint64_t v26 = (uint64_t *)(a4[6] + 16 * v20);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = v49;
    uint64_t v30 = v50;
    uint64_t v31 = *(void *)(v50 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v49, v25 + v31 * v20, v18);
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v52, v29, v18);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v36 = __clz(__rbit64((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v18 = v48;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v33) >> 6;
      uint64_t v18 = v48;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v39 = v35 == v38;
        if (v35 == v38) {
          unint64_t v35 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      unint64_t v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(void *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    BOOL v41 = (void *)(*(void *)(v14 + 48) + 16 * v36);
    *BOOL v41 = v27;
    v41[1] = v28;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(void *)(v14 + 56) + v36 * v31, v52, v18);
    ++*(void *)(v14 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v45;
    uint64_t v16 = v51;
    if (!a3) {
      return v14;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void *sub_100031F28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (a2 <= a1) {
    uint64_t v3 = a1;
  }
  else {
    uint64_t v3 = a2;
  }
  if (!v3) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005E64(a3);
  uint64_t v5 = (void *)swift_allocObject();
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * ((uint64_t)(v6 - 32) / 40);
  return v5;
}

uint64_t sub_100031FA8(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_100031FBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v2 = sub_100005E64(&qword_10004A028);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005E64(&qword_10004A038);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v42 - v10;
  uint64_t v13 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v15 = v1[2];
  int64_t v14 = v1[3];
  int64_t v16 = v14;
  unint64_t v17 = v1[4];
  uint64_t v42 = v5;
  if (v17)
  {
    uint64_t v45 = v9;
    int64_t v46 = v14;
    uint64_t v43 = v15;
    uint64_t v44 = v12;
    uint64_t v18 = v2;
    uint64_t v19 = (v17 - 1) & v17;
    unint64_t v20 = __clz(__rbit64(v17)) | (v14 << 6);
LABEL_3:
    uint64_t v21 = *(void *)(v13 + 56);
    unint64_t v22 = (uint64_t *)(*(void *)(v13 + 48) + 16 * v20);
    uint64_t v23 = v13;
    uint64_t v25 = *v22;
    uint64_t v24 = v22[1];
    uint64_t v26 = type metadata accessor for SimpleType();
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = v21 + *(void *)(v27 + 72) * v20;
    uint64_t v2 = v18;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(&v11[*(int *)(v18 + 48)], v28, v26);
    *(void *)uint64_t v11 = v25;
    *((void *)v11 + 1) = v24;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v11, 0, 1, v18);
    uint64_t v13 = v23;
    swift_bridgeObjectRetain();
    uint64_t v12 = v44;
    uint64_t v9 = v45;
    uint64_t v15 = v43;
    goto LABEL_25;
  }
  int64_t v29 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
LABEL_23:
    int64_t v16 = v10;
    goto LABEL_24;
  }
  int64_t v30 = (unint64_t)(v15 + 64) >> 6;
  if (v29 < v30)
  {
    unint64_t v31 = *(void *)(v12 + 8 * v29);
    if (v31)
    {
LABEL_7:
      uint64_t v43 = v15;
      uint64_t v44 = v12;
      uint64_t v45 = v9;
      int64_t v46 = v29;
      uint64_t v18 = v2;
      uint64_t v19 = (v31 - 1) & v31;
      unint64_t v20 = __clz(__rbit64(v31)) + (v29 << 6);
      goto LABEL_3;
    }
    int64_t v32 = v14 + 2;
    int64_t v16 = v14 + 1;
    if (v14 + 2 < v30)
    {
      unint64_t v31 = *(void *)(v12 + 8 * v32);
      if (v31)
      {
LABEL_10:
        int64_t v29 = v32;
        goto LABEL_7;
      }
      int64_t v16 = v14 + 2;
      if (v14 + 3 < v30)
      {
        unint64_t v31 = *(void *)(v12 + 8 * (v14 + 3));
        if (v31)
        {
          int64_t v29 = v14 + 3;
          goto LABEL_7;
        }
        int64_t v32 = v14 + 4;
        int64_t v16 = v14 + 3;
        if (v14 + 4 < v30)
        {
          unint64_t v31 = *(void *)(v12 + 8 * v32);
          if (v31) {
            goto LABEL_10;
          }
          int64_t v29 = v14 + 5;
          int64_t v16 = v14 + 4;
          if (v14 + 5 < v30)
          {
            unint64_t v31 = *(void *)(v12 + 8 * v29);
            if (v31) {
              goto LABEL_7;
            }
            int64_t v10 = v30 - 1;
            uint64_t v33 = v14 + 6;
            while (v30 != v33)
            {
              unint64_t v31 = *(void *)(v12 + 8 * v33++);
              if (v31)
              {
                int64_t v29 = v33 - 1;
                goto LABEL_7;
              }
            }
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  int64_t v46 = v16;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v11, 1, 1, v2);
  uint64_t v19 = 0;
LABEL_25:
  *uint64_t v1 = v13;
  v1[1] = v12;
  int64_t v34 = v46;
  v1[2] = v15;
  v1[3] = v34;
  v1[4] = v19;
  unint64_t v35 = (void (*)(uint64_t))v1[5];
  sub_1000334F8((uint64_t)v11, (uint64_t)v9, &qword_10004A038);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2) == 1)
  {
    uint64_t v36 = sub_100005E64(&qword_100049688);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v47, 1, 1, v36);
  }
  else
  {
    uint64_t v38 = (uint64_t)v9;
    uint64_t v39 = (uint64_t)v42;
    sub_1000334F8(v38, (uint64_t)v42, &qword_10004A028);
    uint64_t v40 = v47;
    v35(v39);
    sub_10003379C(v39, &qword_10004A028);
    uint64_t v41 = sub_100005E64(&qword_100049688);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 0, 1, v41);
  }
}

void *sub_1000323C8(void *a1)
{
  return sub_10002DE70(0, a1[2], 0, a1, &qword_10004A008, &qword_100049E20);
}

uint64_t sub_100032400(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

char *sub_1000324F4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000325E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100005E64(&qword_100049E10);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000326EC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a2;
  uint64_t v41 = a4;
  int64_t v30 = a1;
  uint64_t v40 = sub_100005E64(&qword_10004A028);
  __chkstk_darwin(v40);
  uint64_t v36 = (uint64_t *)((char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = type metadata accessor for SimpleType();
  uint64_t result = __chkstk_darwin(v39);
  char v37 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v7;
  int64_t v9 = 0;
  uint64_t v42 = (void *)a3;
  uint64_t v10 = *(void *)(a3 + 64);
  uint64_t v31 = 0;
  uint64_t v32 = a3 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  uint64_t v35 = v7 + 16;
  int64_t v33 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v34 = v7 + 8;
  uint64_t v14 = v7;
  uint64_t v15 = v36;
  int64_t v16 = v37;
  uint64_t v17 = v39;
  while (1)
  {
    if (v13)
    {
      uint64_t v43 = (v13 - 1) & v13;
      int64_t v44 = v9;
      unint64_t v18 = __clz(__rbit64(v13)) | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v24 >= v33) {
      return sub_100031B6C(v30, v29, v31, v42);
    }
    unint64_t v25 = *(void *)(v32 + 8 * v24);
    int64_t v26 = v9 + 1;
    if (!v25)
    {
      int64_t v26 = v9 + 2;
      if (v9 + 2 >= v33) {
        return sub_100031B6C(v30, v29, v31, v42);
      }
      unint64_t v25 = *(void *)(v32 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v9 + 3;
        if (v9 + 3 >= v33) {
          return sub_100031B6C(v30, v29, v31, v42);
        }
        unint64_t v25 = *(void *)(v32 + 8 * v26);
        if (!v25) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v43 = (v25 - 1) & v25;
    int64_t v44 = v26;
    unint64_t v18 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_5:
    uint64_t v19 = (uint64_t *)(v42[6] + 16 * v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    unint64_t v22 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v22(v16, v42[7] + *(void *)(v14 + 72) * v18, v17);
    *uint64_t v15 = v21;
    v15[1] = v20;
    v22((char *)v15 + *(int *)(v40 + 48), (unint64_t)v16, v17);
    swift_bridgeObjectRetain_n();
    uint64_t v23 = Config.neededPreviousFields.getter();
    LOBYTE(v21) = sub_10002889C(v21, v20, v23);
    swift_bridgeObjectRelease();
    sub_10003379C((uint64_t)v15, &qword_10004A028);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
    uint64_t result = swift_bridgeObjectRelease();
    int64_t v9 = v44;
    unint64_t v13 = v43;
    if (v21)
    {
      *(unint64_t *)((char *)v30 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      if (__OFADD__(v31++, 1))
      {
        __break(1u);
        return sub_100031B6C(v30, v29, v31, v42);
      }
    }
  }
  uint64_t v27 = v9 + 4;
  if (v9 + 4 >= v33) {
    return sub_100031B6C(v30, v29, v31, v42);
  }
  unint64_t v25 = *(void *)(v32 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v9 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v33) {
      return sub_100031B6C(v30, v29, v31, v42);
    }
    unint64_t v25 = *(void *)(v32 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100032A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v6 = *(unsigned char *)(a1 + 32);
  unsigned int v7 = v6 & 0x3F;
  unint64_t v8 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v9 = 8 * v8;
  uint64_t isStackAllocationSafe = swift_retain_n();
  if (v7 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    swift_retain();
    uint64_t v11 = sub_1000326EC((unint64_t *)((char *)&v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, a1, a2);
    swift_release();
    if (v3) {
      swift_willThrow();
    }
    swift_release_n();
  }
  else
  {
    uint64_t v12 = (void *)swift_slowAlloc();
    bzero(v12, v9);
    swift_retain();
    uint64_t v11 = sub_1000326EC((unint64_t *)v12, v8, a1, a2);
    swift_release();
    swift_slowDealloc();
    swift_release_n();
  }
  return v11;
}

uint64_t sub_100032C28(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v8 = swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000289D4(v2, v3, v4, v5, v6, v7);
  swift_beginAccess();
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(NSObject **)(v8 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10000C600;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_10000C7E8;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_1000199D0;
  aBlock[3] = &unk_100046508;
  unint64_t v13 = _Block_copy(aBlock);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_release();
  dispatch_sync(v10, v13);
  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t result = swift_release();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(a1 + 80))
    {
      swift_retain();
      uint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v16 = sub_100032A6C(v15, v8);
      swift_release();
      if (*(void *)(v16 + 16))
      {
        uint64_t v17 = *(void *)(v8 + 80);
        if (v17)
        {
          swift_bridgeObjectRetain();
          *(void *)(v8 + 80) = sub_10002A810(v16, v17);
        }
        else
        {
          *(void *)(v8 + 80) = v16;
        }
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
      swift_release();
    }
    return v8;
  }
  return result;
}

void *sub_100032F00(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Config.WorkerConfigs();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v34 = (char *)v26 - v10;
  uint64_t result = _swiftEmptyArrayStorage;
  uint64_t v38 = _swiftEmptyArrayStorage;
  uint64_t v29 = *(void *)(a1 + 16);
  if (v29)
  {
    v26[1] = v2;
    uint64_t v27 = v9;
    uint64_t v12 = 0;
    uint64_t v28 = a1 + 32;
    uint64_t v32 = a2 + 56;
    uint64_t v33 = a2;
    uint64_t v31 = v9 + 16;
    unint64_t v13 = (void (**)(char *, uint64_t))(v9 + 8);
    do
    {
      uint64_t v30 = v12;
      sub_10003355C(v28 + 40 * v12, (uint64_t)&v36);
      sub_100015384(&v36, v37);
      dispatch thunk of WorkerProtocol.workerConfig.getter();
      if (*(void *)(v33 + 16)
        && (sub_10003385C(&qword_100049AA8, (void (*)(uint64_t))&type metadata accessor for Config.WorkerConfigs), uint64_t v14 = dispatch thunk of Hashable._rawHashValue(seed:)(), v15 = v33, v16 = -1 << *(unsigned char *)(v33 + 32), v17 = v14 & ~v16, ((*(void *)(v32 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) != 0))
      {
        uint64_t v18 = ~v16;
        uint64_t v19 = *(void *)(v27 + 72);
        uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v27 + 16);
        while (1)
        {
          v20(v8, *(void *)(v15 + 48) + v19 * v17, v5);
          sub_10003385C((unint64_t *)&unk_100049AB0, (void (*)(uint64_t))&type metadata accessor for Config.WorkerConfigs);
          char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
          unint64_t v22 = *v13;
          (*v13)(v8, v5);
          if (v21) {
            break;
          }
          unint64_t v17 = (v17 + 1) & v18;
          uint64_t v15 = v33;
          if (((*(void *)(v32 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
            goto LABEL_3;
          }
        }
        v22(v34, v5);
        sub_100033388(&v36, (uint64_t)v35);
        uint64_t v23 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10002F2A0(0, v23[2] + 1, 1);
          uint64_t v23 = v38;
        }
        unint64_t v25 = v23[2];
        unint64_t v24 = v23[3];
        if (v25 >= v24 >> 1)
        {
          sub_10002F2A0(v24 > 1, v25 + 1, 1);
          uint64_t v23 = v38;
        }
        v23[2] = v25 + 1;
        sub_100033388(v35, (uint64_t)&v23[5 * v25 + 4]);
      }
      else
      {
LABEL_3:
        (*v13)(v34, v5);
        sub_100015434((uint64_t)&v36);
      }
      uint64_t v12 = v30 + 1;
    }
    while (v30 + 1 != v29);
    return v38;
  }
  return result;
}

uint64_t sub_10003327C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_100005E64(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100033388(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000333A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for Message() - 8);
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

uint64_t sub_1000334F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E64(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003355C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000335C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E64(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_100033624()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 46, 7);
}

uint64_t sub_100033664()
{
  uint64_t v1 = *(objc_class **)(v0 + 24);
  long long v2 = *(objc_class **)(v0 + 32);
  unsigned int v3 = *(_DWORD *)(v0 + 40);
  unsigned __int16 v4 = *(_WORD *)(v0 + 44);
  sub_10002BF20();
  sub_100022458(v1, v2, v3, v4);

  return swift_release();
}

uint64_t sub_1000336D4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003370C()
{
  return sub_10002CED4();
}

uint64_t sub_100033718()
{
  return sub_100029DE8(0);
}

uint64_t sub_100033724()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033738()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003374C()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003378C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003379C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005E64(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000337F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003385C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000338E0()
{
  uint64_t v1 = type metadata accessor for SimpleType();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v72 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v70 = (char *)&v70 - v5;
  uint64_t v6 = type metadata accessor for Keys();
  uint64_t v78 = *(void *)(v6 - 8);
  uint64_t v79 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v77 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v76 = (char *)&v70 - v9;
  sub_100005E64(&qword_10004A088);
  uint64_t v10 = sub_100005E64(&qword_100049688);
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 72);
  unint64_t v12 = (*(unsigned __int8 *)(*(void *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10003DD80;
  uint64_t v80 = v13;
  uint64_t v14 = (void *)(v13 + v12);
  *uint64_t v14 = 0x646F6874656DLL;
  v14[1] = 0xE600000000000000;
  int v15 = *v0;
  if (*v0)
  {
    if (v15 == 1)
    {
      uint64_t v16 = 0x735F6C616E676973;
      unint64_t v17 = 0xEB00000000706F74;
    }
    else
    {
      unint64_t v17 = 0xE400000000000000;
      uint64_t v16 = 1886352499;
    }
  }
  else
  {
    unint64_t v17 = 0xE500000000000000;
    uint64_t v16 = 0x7472617473;
  }
  uint64_t v18 = (void *)((char *)v14 + *(int *)(v10 + 48));
  *uint64_t v18 = v16;
  v18[1] = v17;
  uint64_t v71 = v2;
  uint64_t v20 = *(void (**)(void))(v2 + 104);
  uint64_t v19 = v2 + 104;
  unsigned int v75 = enum case for SimpleType.string(_:);
  uint64_t v84 = v20;
  v20();
  strcpy((char *)v87, "num_messages_");
  HIWORD(v87[1]) = -4864;
  unint64_t v21 = 0xE400000000000000;
  uint64_t v22 = 1886352499;
  if (v15 == 1)
  {
    uint64_t v22 = 0x735F6C616E676973;
    unint64_t v21 = 0xEB00000000706F74;
  }
  if (v15) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0x7472617473;
  }
  if (v15) {
    unint64_t v24 = v21;
  }
  else {
    unint64_t v24 = 0xE500000000000000;
  }
  uint64_t v85 = v11;
  uint64_t v86 = v10;
  unint64_t v25 = (void *)((char *)v14 + v11);
  int64_t v26 = (void *)((char *)v25 + *(int *)(v10 + 48));
  unint64_t v27 = v24;
  String.append(_:)(*(Swift::String *)&v23);
  swift_bridgeObjectRelease();
  uint64_t v28 = v87[1];
  *unint64_t v25 = v87[0];
  v25[1] = v28;
  uint64_t v82 = v0;
  *int64_t v26 = *((void *)v0 + 1);
  LODWORD(v83) = enum case for SimpleType.uint(_:);
  ((void (*)(void *))v84)(v26);
  v87[0] = 0;
  v87[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  v87[0] = 0xD000000000000014;
  v87[1] = 0x800000010003F340;
  unint64_t v29 = 0xE400000000000000;
  uint64_t v30 = 1886352499;
  if (v15 == 1)
  {
    uint64_t v30 = 0x735F6C616E676973;
    unint64_t v29 = 0xEB00000000706F74;
  }
  int v74 = v15;
  if (v15) {
    uint64_t v31 = v30;
  }
  else {
    uint64_t v31 = 0x7472617473;
  }
  if (v15) {
    unint64_t v32 = v29;
  }
  else {
    unint64_t v32 = 0xE500000000000000;
  }
  uint64_t v34 = v85;
  uint64_t v33 = v86;
  uint64_t v35 = (void *)((char *)v14 + 2 * v85);
  uint64_t v81 = v14;
  long long v36 = (void *)((char *)v35 + *(int *)(v86 + 48));
  unint64_t v37 = v32;
  String.append(_:)(*(Swift::String *)&v31);
  swift_bridgeObjectRelease();
  uint64_t v38 = v87[1];
  *uint64_t v35 = v87[0];
  v35[1] = v38;
  uint64_t v39 = v82;
  *long long v36 = *((void *)v82 + 2);
  ((void (*)(void *, void, uint64_t))v84)(v36, v83, v1);
  uint64_t v40 = (void *)((char *)v14 + 3 * v34);
  uint64_t v41 = (uint64_t *)((char *)v40 + *(int *)(v33 + 48));
  uint64_t v42 = v78;
  unint64_t v73 = *(void (**)(char *, void, uint64_t))(v78 + 104);
  uint64_t v43 = v76;
  uint64_t v83 = v19;
  uint64_t v44 = v79;
  v73(v76, enum case for Keys.reporterID(_:), v79);
  uint64_t v45 = Keys.rawValue.getter();
  uint64_t v47 = v46;
  uint64_t v78 = *(void *)(v42 + 8);
  ((void (*)(char *, uint64_t))v78)(v43, v44);
  uint64_t *v40 = v45;
  v40[1] = v47;
  *uint64_t v41 = *((void *)v39 + 3);
  uint64_t v48 = v84;
  ((void (*)(void *, void, uint64_t))v84)(v41, enum case for SimpleType.int(_:), v1);
  uint64_t v49 = (void *)((char *)v81 + 4 * v85);
  uint64_t v50 = (_OWORD *)((char *)v49 + *(int *)(v86 + 48));
  uint64_t v51 = v77;
  v73(v77, enum case for Keys.applicationName(_:), v44);
  uint64_t v52 = Keys.rawValue.getter();
  uint64_t v54 = v53;
  ((void (*)(char *, uint64_t))v78)(v51, v44);
  *uint64_t v49 = v52;
  v49[1] = v54;
  uint64_t v55 = (uint64_t)v82;
  *uint64_t v50 = *(_OWORD *)(v82 + 40);
  ((void (*)(_OWORD *, void, uint64_t))v48)(v50, v75, v1);
  strcpy((char *)v87, "running_at_");
  HIDWORD(v87[1]) = -352321536;
  uint64_t v56 = v55;
  if (v74)
  {
    if (v74 == 1)
    {
      uint64_t v57 = 0x735F6C616E676973;
      unint64_t v58 = (void *)0xEB00000000706F74;
    }
    else
    {
      unint64_t v58 = (void *)0xE400000000000000;
      uint64_t v57 = 1886352499;
    }
  }
  else
  {
    unint64_t v58 = (void *)0xE500000000000000;
    uint64_t v57 = 0x7472617473;
  }
  uint64_t v59 = (void *)((char *)v81 + 5 * v85);
  uint64_t v60 = (char *)v59 + *(int *)(v86 + 48);
  sub_10003400C(v56);
  v61._id countAndFlagsBits = v57;
  v61._object = v58;
  String.append(_:)(v61);
  swift_bridgeObjectRelease();
  uint64_t v62 = v87[1];
  *uint64_t v59 = v87[0];
  v59[1] = v62;
  *uint64_t v60 = *(unsigned char *)(v56 + 32);
  uint64_t v63 = enum case for SimpleType.BOOL(_:);
  ((void (*)(unsigned char *, void, uint64_t))v48)(v60, enum case for SimpleType.BOOL(_:), v1);
  unint64_t v64 = sub_100005694(v80);
  char v65 = *(unsigned char *)(v56 + 56);
  if (v65)
  {
    uint64_t v66 = v70;
    *uint64_t v70 = v65;
    ((void (*)(unsigned char *, uint64_t, uint64_t))v48)(v66, v63, v1);
    uint64_t v67 = (uint64_t)v72;
    (*(void (**)(char *, unsigned char *, uint64_t))(v71 + 32))(v72, v66, v1);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v87[0] = v64;
    sub_1000246B4(v67, 0xD000000000000014, 0x800000010003F360, isUniquelyReferenced_nonNull_native);
    unint64_t v64 = v87[0];
    swift_bridgeObjectRelease();
  }
  return v64;
}

uint64_t sub_10003400C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100034038(uint64_t a1)
{
  uint64_t v60 = sub_100005E64(&qword_10004A2C0);
  uint64_t v3 = __chkstk_darwin(v60);
  uint64_t v57 = (uint64_t)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v56 = (uint64_t)v46 - v6;
  __chkstk_darwin(v5);
  uint64_t v55 = (char *)v46 - v7;
  uint64_t v8 = sub_100005E64(&qword_100049688);
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v54 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a1 + 16);
  unint64_t v12 = _swiftEmptyArrayStorage;
  if (!v11) {
    return (uint64_t)v12;
  }
  v46[1] = v1;
  Swift::String v61 = _swiftEmptyArrayStorage;
  sub_10002F2E0(0, v11, 0);
  uint64_t result = sub_10003A3D8(a1);
  uint64_t v15 = result;
  uint64_t v16 = 0;
  uint64_t v17 = a1 + 64;
  uint64_t v47 = a1 + 80;
  int64_t v48 = v11;
  uint64_t v51 = v10;
  uint64_t v52 = a1;
  uint64_t v49 = v14;
  uint64_t v50 = a1 + 64;
  while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v20 = (unint64_t)v15 >> 6;
    if ((*(void *)(v17 + 8 * ((unint64_t)v15 >> 6)) & (1 << v15)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v14) {
      goto LABEL_26;
    }
    uint64_t v58 = v16;
    uint64_t v59 = 1 << v15;
    uint64_t v21 = (uint64_t)v55;
    uint64_t v22 = (uint64_t)&v55[*(int *)(v60 + 48)];
    uint64_t v23 = *(void *)(a1 + 48);
    unint64_t v24 = (int *)(type metadata accessor for FeatureInfo(0) - 8);
    sub_10003A9F4(v23 + *(void *)(*(void *)v24 + 72) * v15, v21, type metadata accessor for FeatureInfo);
    uint64_t v25 = *(void *)(a1 + 56);
    int64_t v26 = (int *)(type metadata accessor for FeatureState(0) - 8);
    sub_10003A9F4(v25 + *(void *)(*(void *)v26 + 72) * v15, v22, type metadata accessor for FeatureState);
    uint64_t v27 = v56;
    sub_10003A9F4(v21, v56, type metadata accessor for FeatureInfo);
    uint64_t v28 = v60;
    sub_10003A9F4(v22, v27 + *(int *)(v60 + 48), type metadata accessor for FeatureState);
    uint64_t v29 = v27;
    uint64_t v30 = v57;
    sub_1000334F8(v29, v57, &qword_10004A2C0);
    sub_10003379C(v21, &qword_10004A2C0);
    uint64_t v31 = v51;
    uint64_t v32 = v30 + *(int *)(v28 + 48);
    uint64_t v33 = (char *)v51 + *(int *)(v54 + 48);
    uint64_t v34 = (uint64_t *)(v30 + v24[7]);
    uint64_t v36 = *v34;
    uint64_t v35 = v34[1];
    uint64_t v37 = v32 + v26[7];
    uint64_t v38 = type metadata accessor for SimpleType();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16))(v33, v37, v38);
    void *v31 = v36;
    v31[1] = v35;
    swift_bridgeObjectRetain();
    sub_10003379C(v30, &qword_10004A2C0);
    unint64_t v12 = v61;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10002F2E0(0, v12[2] + 1, 1);
      unint64_t v12 = v61;
    }
    unint64_t v40 = v12[2];
    unint64_t v39 = v12[3];
    a1 = v52;
    if (v40 >= v39 >> 1)
    {
      sub_10002F2E0(v39 > 1, v40 + 1, 1);
      unint64_t v12 = v61;
    }
    v12[2] = v40 + 1;
    uint64_t result = sub_1000334F8((uint64_t)v31, (uint64_t)v12+ ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))+ *(void *)(v53 + 72) * v40, &qword_100049688);
    int64_t v18 = 1 << *(unsigned char *)(a1 + 32);
    if (v15 >= v18) {
      goto LABEL_27;
    }
    uint64_t v17 = v50;
    uint64_t v41 = *(void *)(v50 + 8 * v20);
    if ((v41 & v59) == 0) {
      goto LABEL_28;
    }
    LODWORD(v14) = v49;
    if (*(_DWORD *)(a1 + 36) != v49) {
      goto LABEL_29;
    }
    unint64_t v42 = v41 & (-2 << (v15 & 0x3F));
    if (v42)
    {
      int64_t v18 = __clz(__rbit64(v42)) | v15 & 0xFFFFFFFFFFFFFFC0;
      int64_t v19 = v48;
    }
    else
    {
      unint64_t v43 = v20 + 1;
      unint64_t v44 = (unint64_t)(v18 + 63) >> 6;
      int64_t v19 = v48;
      if (v20 + 1 < v44)
      {
        unint64_t v45 = *(void *)(v50 + 8 * v43);
        if (v45)
        {
LABEL_22:
          int64_t v18 = __clz(__rbit64(v45)) + (v43 << 6);
        }
        else
        {
          while (v44 - 2 != v20)
          {
            unint64_t v45 = *(void *)(v47 + 8 * v20++);
            if (v45)
            {
              unint64_t v43 = v20 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    uint64_t v16 = v58 + 1;
    uint64_t v15 = v18;
    if (v58 + 1 == v19) {
      return (uint64_t)v12;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t *SystemMonitor.shared.unsafeMutableAddressor()
{
  return &static SystemMonitor.shared;
}

uint64_t SystemMonitor.currentMessageContents.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock(v1 + 6);
  sub_100036D64(&v4);
  os_unfair_lock_unlock(v1 + 6);
  uint64_t v2 = v4;
  swift_release();
  return v2;
}

uint64_t static SystemMonitor.shared.getter()
{
  return swift_retain();
}

uint64_t sub_1000345E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "SystemMonitor.shutdown()", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(void *)(v1 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
  sub_10003ADB4((void *)(v5 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));

  return swift_release();
}

uint64_t sub_1000346D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v139 = a5;
  uint64_t v140 = a4;
  uint64_t v142 = a3;
  uint64_t v5 = sub_100005E64(&qword_100049700);
  __chkstk_darwin(v5 - 8);
  Swift::Int v129 = &v116[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v131 = type metadata accessor for Message();
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v128 = &v116[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v133 = sub_100005E64(&qword_10004A2C8);
  __chkstk_darwin(v133);
  v134 = &v116[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v135 = type metadata accessor for FeatureInfo(0);
  uint64_t v9 = *(void *)(*(void *)(v135 - 8) + 64);
  uint64_t v10 = __chkstk_darwin(v135);
  uint64_t v138 = &v116[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  unint64_t v12 = &v116[-v11];
  uint64_t v13 = sub_100005E64((uint64_t *)&unk_100049C30);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  Swift::Int v126 = &v116[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __chkstk_darwin(v14);
  v125 = &v116[-v17];
  uint64_t v18 = __chkstk_darwin(v16);
  long long v136 = &v116[-v19];
  uint64_t v20 = __chkstk_darwin(v18);
  v137 = &v116[-v21];
  __chkstk_darwin(v20);
  uint64_t v23 = &v116[-v22];
  uint64_t v24 = type metadata accessor for FeatureState(0);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = __chkstk_darwin(v24);
  unint64_t v124 = &v116[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v123 = &v116[-v29];
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v127 = &v116[-v31];
  uint64_t v32 = __chkstk_darwin(v30);
  v132 = &v116[-v33];
  uint64_t v34 = __chkstk_darwin(v32);
  v120 = &v116[-v35];
  uint64_t v36 = __chkstk_darwin(v34);
  unint64_t v121 = &v116[-v37];
  uint64_t v38 = __chkstk_darwin(v36);
  uint64_t v122 = &v116[-v39];
  __chkstk_darwin(v38);
  Swift::Int v141 = &v116[-v40];
  uint64_t v41 = type metadata accessor for Logger();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = __chkstk_darwin(v41);
  unint64_t v45 = &v116[-((v44 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v43);
  uint64_t v47 = &v116[-v46];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v49 = Strong;
    swift_beginAccess();
    uint64_t v50 = swift_unknownObjectWeakLoadStrong();
    if (v50)
    {
      uint64_t v142 = v50;
      uint64_t v51 = (unsigned int *)(v139 + 16);
      swift_beginAccess();
      uint64_t v52 = *v51;
      LOBYTE(v144) = 0;
      uint64_t v53 = v140;
      sub_100035A70(v140, v52, (uint64_t)v23);
      uint64_t v54 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v25 + 48);
      if (v54(v23, 1, v24) == 1)
      {
        sub_10003379C((uint64_t)v23, (uint64_t *)&unk_100049C30);
        sub_10003A9F4(v53, (uint64_t)v12, type metadata accessor for FeatureInfo);
        uint64_t v55 = Logger.logObject.getter();
        os_log_type_t v56 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v55, v56))
        {
          uint64_t v57 = (uint8_t *)swift_slowAlloc();
          uint64_t v58 = swift_slowAlloc();
          *(_DWORD *)uint64_t v57 = 136380675;
          uint64_t v144 = v58;
          uint64_t v59 = (uint64_t *)&v12[*(int *)(v135 + 28)];
          uint64_t v60 = *v59;
          unint64_t v61 = v59[1];
          swift_bridgeObjectRetain();
          uint64_t v143 = sub_10002E344(v60, v61, &v144);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          sub_10003AB10((uint64_t)v12, type metadata accessor for FeatureInfo);
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "No value found, even though we received a notification! { notification=%{private}s }", v57, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_release();

          return swift_unknownObjectRelease();
        }
        else
        {
          swift_release();

          swift_unknownObjectRelease();
          return sub_10003AB10((uint64_t)v12, type metadata accessor for FeatureInfo);
        }
      }
      uint64_t v69 = v25;
      uint64_t v70 = v141;
      sub_1000067B8((uint64_t)v23, (uint64_t)v141, type metadata accessor for FeatureState);
      uint64_t v71 = v137;
      sub_10003A9F4((uint64_t)v70, (uint64_t)v137, type metadata accessor for FeatureState);
      uint64_t v72 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v69 + 56);
      uint64_t v139 = v69 + 56;
      uint64_t v118 = v72;
      v72(v71, 0, 1, v24);
      uint64_t v119 = v49;
      unint64_t v73 = v138;
      uint64_t v74 = sub_10003A9F4(v53, (uint64_t)v138, type metadata accessor for FeatureInfo);
      __chkstk_darwin(v74);
      sub_1000067B8((uint64_t)v73, (uint64_t)&v116[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for FeatureInfo);
      swift_getKeyPath();
      swift_retain();
      unsigned int v75 = v136;
      OSAllocatedUnfairLock<A>.load<A>(_:)();
      swift_release();
      swift_release();
      uint64_t v76 = v134;
      uint64_t v77 = (uint64_t)&v134[*(int *)(v133 + 48)];
      sub_100006754((uint64_t)v71, (uint64_t)v134, (uint64_t *)&unk_100049C30);
      sub_100006754((uint64_t)v75, v77, (uint64_t *)&unk_100049C30);
      if (v54(v76, 1, v24) == 1)
      {
        sub_10003379C((uint64_t)v75, (uint64_t *)&unk_100049C30);
        sub_10003379C((uint64_t)v71, (uint64_t *)&unk_100049C30);
        if (v54((unsigned char *)v77, 1, v24) == 1)
        {
          sub_10003379C((uint64_t)v76, (uint64_t *)&unk_100049C30);
          uint64_t v78 = v141;
          goto LABEL_22;
        }
        uint64_t v80 = &qword_10004A2C8;
        uint64_t v81 = v119;
        uint64_t v78 = v141;
        uint64_t v82 = (uint64_t)v132;
      }
      else
      {
        uint64_t v79 = v125;
        sub_100006754((uint64_t)v76, (uint64_t)v125, (uint64_t *)&unk_100049C30);
        if (v54((unsigned char *)v77, 1, v24) == 1)
        {
          uint64_t v80 = &qword_10004A2C8;
          uint64_t v78 = v141;
        }
        else
        {
          uint64_t v133 = v24;
          uint64_t v83 = v122;
          sub_1000067B8(v77, (uint64_t)v122, type metadata accessor for FeatureState);
          char v84 = sub_10003A720((uint64_t)v79, (uint64_t)v83);
          uint64_t v85 = v121;
          sub_10003A9F4((uint64_t)v79, (uint64_t)v121, type metadata accessor for FeatureState);
          uint64_t v86 = v120;
          sub_10003A9F4((uint64_t)v83, (uint64_t)v120, type metadata accessor for FeatureState);
          uint64_t v78 = v141;
          if (v84)
          {
            uint64_t v87 = v133;
            int v117 = static SimpleType.== infix(_:_:)();
            sub_10003AB10((uint64_t)v86, type metadata accessor for FeatureState);
            uint64_t v88 = (uint64_t)v85;
            uint64_t v24 = v87;
            sub_10003AB10(v88, type metadata accessor for FeatureState);
            sub_10003AB10((uint64_t)v83, type metadata accessor for FeatureState);
            sub_10003379C((uint64_t)v136, (uint64_t *)&unk_100049C30);
            sub_10003379C((uint64_t)v137, (uint64_t *)&unk_100049C30);
            sub_10003AB10((uint64_t)v79, type metadata accessor for FeatureState);
            sub_10003379C((uint64_t)v76, (uint64_t *)&unk_100049C30);
            uint64_t v81 = v119;
            uint64_t v82 = (uint64_t)v132;
            if (v117)
            {
LABEL_22:
              uint64_t v89 = v123;
              sub_10003A9F4((uint64_t)v78, (uint64_t)v123, type metadata accessor for FeatureState);
              char v90 = v124;
              sub_10003A9F4((uint64_t)v78, (uint64_t)v124, type metadata accessor for FeatureState);
              uint64_t v91 = Logger.logObject.getter();
              os_log_type_t v92 = static os_log_type_t.debug.getter();
              if (os_log_type_enabled(v91, v92))
              {
                uint64_t v93 = swift_slowAlloc();
                uint64_t v144 = swift_slowAlloc();
                *(_DWORD *)uint64_t v93 = 136380931;
                uint64_t v94 = (uint64_t *)&v89[*(int *)(v135 + 20)];
                uint64_t v95 = (uint64_t)v89;
                uint64_t v96 = *v94;
                unint64_t v97 = v94[1];
                swift_bridgeObjectRetain();
                uint64_t v143 = sub_10002E344(v96, v97, &v144);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();
                sub_10003AB10(v95, type metadata accessor for FeatureState);
                *(_WORD *)(v93 + 12) = 2081;
                uint64_t v98 = v124;
                type metadata accessor for SimpleType();
                sub_10003A9AC(&qword_10004A2D0, (void (*)(uint64_t))&type metadata accessor for SimpleType);
                uint64_t v99 = dispatch thunk of CustomStringConvertible.description.getter();
                uint64_t v143 = sub_10002E344(v99, v100, &v144);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();
                sub_10003AB10((uint64_t)v98, type metadata accessor for FeatureState);
                _os_log_impl((void *)&_mh_execute_header, v91, v92, "Value did not change. { feature=%{private}s, value=%{private}s }", (uint8_t *)v93, 0x16u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
                swift_unknownObjectRelease();
                swift_release();

                return sub_10003AB10((uint64_t)v141, type metadata accessor for FeatureState);
              }
              else
              {
                swift_unknownObjectRelease();
                sub_10003AB10((uint64_t)v89, type metadata accessor for FeatureState);
                sub_10003AB10((uint64_t)v90, type metadata accessor for FeatureState);
                swift_release();

                return sub_10003AB10((uint64_t)v78, type metadata accessor for FeatureState);
              }
            }
            goto LABEL_28;
          }
          sub_10003AB10((uint64_t)v86, type metadata accessor for FeatureState);
          sub_10003AB10((uint64_t)v85, type metadata accessor for FeatureState);
          sub_10003AB10((uint64_t)v83, type metadata accessor for FeatureState);
          uint64_t v80 = (uint64_t *)&unk_100049C30;
          uint64_t v24 = v133;
        }
        uint64_t v82 = (uint64_t)v132;
        sub_10003379C((uint64_t)v136, (uint64_t *)&unk_100049C30);
        sub_10003379C((uint64_t)v137, (uint64_t *)&unk_100049C30);
        sub_10003AB10((uint64_t)v79, type metadata accessor for FeatureState);
        uint64_t v81 = v119;
      }
      sub_10003379C((uint64_t)v76, v80);
LABEL_28:
      uint64_t v101 = v138;
      uint64_t v102 = sub_10003A9F4(v53, (uint64_t)v138, type metadata accessor for FeatureInfo);
      __chkstk_darwin(v102);
      sub_1000067B8((uint64_t)v101, (uint64_t)&v116[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for FeatureInfo);
      swift_getKeyPath();
      uint64_t v103 = v126;
      sub_10003A9F4((uint64_t)v78, (uint64_t)v126, type metadata accessor for FeatureState);
      v118(v103, 0, 1, v24);
      swift_retain();
      OSAllocatedUnfairLock<A>.assign<A>(_:newValue:)();
      swift_release();
      swift_release();
      sub_10003379C((uint64_t)v103, (uint64_t *)&unk_100049C30);
      sub_10003A9F4((uint64_t)v78, v82, type metadata accessor for FeatureState);
      uint64_t v104 = v127;
      sub_10003A9F4((uint64_t)v78, (uint64_t)v127, type metadata accessor for FeatureState);
      uint64_t v105 = Logger.logObject.getter();
      os_log_type_t v106 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v105, v106))
      {
        uint64_t v107 = swift_slowAlloc();
        uint64_t v144 = swift_slowAlloc();
        *(_DWORD *)uint64_t v107 = 136380931;
        os_log_type_t v108 = (uint64_t *)(v82 + *(int *)(v135 + 20));
        uint64_t v109 = *v108;
        unint64_t v110 = v108[1];
        swift_bridgeObjectRetain();
        uint64_t v143 = sub_10002E344(v109, v110, &v144);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_10003AB10(v82, type metadata accessor for FeatureState);
        *(_WORD *)(v107 + 12) = 2081;
        type metadata accessor for SimpleType();
        sub_10003A9AC(&qword_10004A2D0, (void (*)(uint64_t))&type metadata accessor for SimpleType);
        uint64_t v111 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v143 = sub_10002E344(v111, v112, &v144);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v78 = v141;
        sub_10003AB10((uint64_t)v104, type metadata accessor for FeatureState);
        _os_log_impl((void *)&_mh_execute_header, v105, v106, "Broadcasting new value. { feature=%{private}s, value=%{private}s }", (uint8_t *)v107, 0x16u);
        swift_arrayDestroy();
        uint64_t v81 = v119;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        sub_10003AB10(v82, type metadata accessor for FeatureState);
        sub_10003AB10((uint64_t)v104, type metadata accessor for FeatureState);
      }
      uint64_t v113 = *(os_unfair_lock_s **)(v81 + 16);
      swift_retain();
      os_unfair_lock_lock(v113 + 6);
      sub_100036D64(&v144);
      os_unfair_lock_unlock(v113 + 6);
      swift_release();
      uint64_t v114 = type metadata accessor for Message.Metadata();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56))(v129, 1, 1, v114);
      uint64_t v115 = (uint64_t)v128;
      Message.init(category:type:content:metadata:)();
      sub_100017430(v115);
      swift_release();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v115, v131);
      return sub_10003AB10((uint64_t)v78, type metadata accessor for FeatureState);
    }
    static Logger.service.getter();
    uint64_t v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Somehow Server no longer exists!", v68, 2u);
      swift_slowDealloc();
    }

    swift_release();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v42 + 8))(v45, v41);
  }
  else
  {
    static Logger.service.getter();
    uint64_t v63 = Logger.logObject.getter();
    os_log_type_t v64 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v63, v64))
    {
      char v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v65 = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "Somehow SystemMonitor no longer exists!", v65, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(unsigned char *, uint64_t))(v42 + 8))(v47, v41);
  }
}

uint64_t sub_100035A70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v122 = a2;
  uint64_t v125 = a3;
  uint64_t v4 = type metadata accessor for FeatureInfo(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v119 = (uint64_t)&v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v121 = (uint64_t)&v116 - v8;
  __chkstk_darwin(v7);
  uint64_t v117 = (uint64_t)&v116 - v9;
  uint64_t v10 = type metadata accessor for SimpleType();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v123 = v10;
  uint64_t v124 = v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v118 = (double *)((char *)&v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __chkstk_darwin(v12);
  v120 = (uint64_t *)((char *)&v116 - v15);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v116 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (uint64_t *)((char *)&v116 - v19);
  uint64_t v21 = type metadata accessor for SystemMonitorConfig.DataType();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v116 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for SystemMonitorConfig.MonitorType();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v116 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v28, a1, v25);
  int v29 = (*(uint64_t (**)(char *, uint64_t))(v26 + 88))(v28, v25);
  if (v29 == enum case for SystemMonitorConfig.MonitorType.defaults(_:))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, a1 + *(int *)(v4 + 36), v21);
    int v30 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
    if (v30 == enum case for SystemMonitorConfig.DataType.string(_:))
    {
      static DefaultsUtilities.platformDefaultUserName.getter();
      static DefaultsUtilities.get<A>(key:applicationID:userName:)();
      swift_bridgeObjectRelease();
      uint64_t v31 = v128;
      if (v128)
      {
        uint64_t v32 = state64;
        uint64_t v33 = a1;
        uint64_t v34 = v125;
        sub_10003A9F4(v33, v125, type metadata accessor for FeatureInfo);
        uint64_t v35 = type metadata accessor for FeatureState(0);
        uint64_t v36 = (uint64_t *)(v34 + *(int *)(v35 + 20));
        *uint64_t v36 = v32;
        v36[1] = v31;
LABEL_58:
        (*(void (**)(void))(v124 + 104))();
LABEL_59:
        *(_DWORD *)(v34 + *(int *)(v35 + 24)) = -1;
        uint64_t v95 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56);
        uint64_t v96 = v34;
        return v95(v96, 0, 1, v35);
      }
LABEL_21:
      uint64_t v52 = v125;
      sub_10003A9F4(a1, v125, type metadata accessor for FeatureInfo);
      uint64_t v53 = type metadata accessor for FeatureState(0);
      uint64_t v54 = (void *)(v52 + *(int *)(v53 + 20));
      uint64_t v55 = (void *)(a1 + *(int *)(v4 + 32));
      uint64_t v56 = v55[1];
      void *v54 = *v55;
      v54[1] = v56;
      (*(void (**)(void))(v124 + 104))();
      *(_DWORD *)(v52 + *(int *)(v53 + 24)) = -1;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 0, 1, v53);
      return swift_bridgeObjectRetain();
    }
    if (v30 == enum case for SystemMonitorConfig.DataType.int(_:))
    {
      static DefaultsUtilities.platformDefaultUserName.getter();
      static DefaultsUtilities.get<A>(key:applicationID:userName:)();
      swift_bridgeObjectRelease();
      if ((v128 & 1) == 0)
      {
        uint64_t v74 = state64;
        uint64_t v75 = a1;
        uint64_t v34 = v125;
        sub_10003A9F4(v75, v125, type metadata accessor for FeatureInfo);
        uint64_t v35 = type metadata accessor for FeatureState(0);
        *(void *)(v34 + *(int *)(v35 + 20)) = v74;
        goto LABEL_58;
      }
      uint64_t v41 = v121;
      sub_10003A9F4(a1, v121, type metadata accessor for FeatureInfo);
      uint64_t v42 = (uint64_t *)(a1 + *(int *)(v4 + 32));
      uint64_t v43 = *v42;
      unint64_t v44 = v42[1];
      uint64_t v45 = HIBYTE(v44) & 0xF;
      uint64_t v46 = v43 & 0xFFFFFFFFFFFFLL;
      if ((v44 & 0x2000000000000000) != 0) {
        uint64_t v47 = HIBYTE(v44) & 0xF;
      }
      else {
        uint64_t v47 = v43 & 0xFFFFFFFFFFFFLL;
      }
      if (!v47)
      {
        uint64_t v106 = 0;
LABEL_84:
        uint64_t v107 = v120;
        uint64_t *v120 = v106;
        uint64_t v109 = v123;
        uint64_t v108 = v124;
        (*(void (**)(uint64_t *, void, uint64_t))(v124 + 104))(v107, enum case for SimpleType.int(_:), v123);
        uint64_t v83 = v125;
        sub_1000067B8(v41, v125, type metadata accessor for FeatureInfo);
        uint64_t v35 = type metadata accessor for FeatureState(0);
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(v108 + 32))(v83 + *(int *)(v35 + 20), v107, v109);
        goto LABEL_85;
      }
      if ((v44 & 0x1000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v49 = (uint64_t)sub_100039B28(v43, v44, 10);
        char v51 = v114;
        swift_bridgeObjectRelease();
LABEL_81:
        if (v51) {
          uint64_t v106 = 0;
        }
        else {
          uint64_t v106 = v49;
        }
        goto LABEL_84;
      }
      if ((v44 & 0x2000000000000000) == 0)
      {
        if ((v43 & 0x1000000000000000) != 0) {
          int64_t v48 = (unsigned __int8 *)((v44 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          int64_t v48 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
        }
        uint64_t v49 = (uint64_t)sub_100039C10(v48, v46, 10);
        char v51 = v50 & 1;
        goto LABEL_81;
      }
      uint64_t state64 = v43;
      uint64_t v128 = v44 & 0xFFFFFFFFFFFFFFLL;
      if (v43 == 43)
      {
        if (!v45) {
          goto LABEL_102;
        }
        if (v45 == 1 || (BYTE1(v43) - 48) > 9u) {
          goto LABEL_78;
        }
        uint64_t v49 = (BYTE1(v43) - 48);
        uint64_t v101 = v45 - 2;
        if (v101)
        {
          uint64_t v102 = (unsigned __int8 *)&state64 + 2;
          while (1)
          {
            unsigned int v103 = *v102 - 48;
            if (v103 > 9) {
              goto LABEL_78;
            }
            uint64_t v104 = 10 * v49;
            if ((unsigned __int128)(v49 * (__int128)10) >> 64 != (10 * v49) >> 63) {
              goto LABEL_78;
            }
            uint64_t v49 = v104 + v103;
            if (__OFADD__(v104, v103)) {
              goto LABEL_78;
            }
            char v51 = 0;
            ++v102;
            if (!--v101) {
              goto LABEL_81;
            }
          }
        }
      }
      else
      {
        if (v43 == 45)
        {
          if (v45)
          {
            if (v45 != 1 && (BYTE1(v43) - 48) <= 9u)
            {
              uint64_t v49 = -(uint64_t)(BYTE1(v43) - 48);
              uint64_t v89 = v45 - 2;
              if (v89)
              {
                char v90 = (unsigned __int8 *)&state64 + 2;
                while (1)
                {
                  unsigned int v91 = *v90 - 48;
                  if (v91 > 9) {
                    goto LABEL_78;
                  }
                  uint64_t v92 = 10 * v49;
                  if ((unsigned __int128)(v49 * (__int128)10) >> 64 != (10 * v49) >> 63) {
                    goto LABEL_78;
                  }
                  uint64_t v49 = v92 - v91;
                  if (__OFSUB__(v92, v91)) {
                    goto LABEL_78;
                  }
                  char v51 = 0;
                  ++v90;
                  if (!--v89) {
                    goto LABEL_81;
                  }
                }
              }
              goto LABEL_80;
            }
LABEL_78:
            uint64_t v49 = 0;
            char v51 = 1;
            goto LABEL_81;
          }
          __break(1u);
LABEL_102:
          __break(1u);
        }
        if (!v45 || (v43 - 48) > 9u) {
          goto LABEL_78;
        }
        uint64_t v49 = (v43 - 48);
        uint64_t v105 = v45 - 1;
        if (v105)
        {
          unint64_t v110 = (unsigned __int8 *)&state64 + 1;
          while (1)
          {
            unsigned int v111 = *v110 - 48;
            if (v111 > 9) {
              goto LABEL_78;
            }
            uint64_t v112 = 10 * v49;
            if ((unsigned __int128)(v49 * (__int128)10) >> 64 != (10 * v49) >> 63) {
              goto LABEL_78;
            }
            uint64_t v49 = v112 + v111;
            if (__OFADD__(v112, v111)) {
              goto LABEL_78;
            }
            char v51 = 0;
            ++v110;
            if (!--v105) {
              goto LABEL_81;
            }
          }
        }
      }
LABEL_80:
      char v51 = 0;
      goto LABEL_81;
    }
    if (v30 == enum case for SystemMonitorConfig.DataType.double(_:))
    {
      static DefaultsUtilities.platformDefaultUserName.getter();
      static DefaultsUtilities.get<A>(key:applicationID:userName:)();
      swift_bridgeObjectRelease();
      if (v128)
      {
        uint64_t v61 = v119;
        uint64_t v62 = sub_10003A9F4(a1, v119, type metadata accessor for FeatureInfo);
        uint64_t v63 = (uint64_t *)(a1 + *(int *)(v4 + 32));
        uint64_t v64 = *v63;
        uint64_t v65 = v63[1];
        double v126 = 0.0;
        uint64_t v66 = __chkstk_darwin(v62);
        *(&v116 - 2) = (uint64_t)&v126;
        if ((v65 & 0x1000000000000000) != 0 || !(v65 & 0x2000000000000000 | v64 & 0x1000000000000000))
        {
          swift_bridgeObjectRetain();
          _StringGuts._slowWithCString<A>(_:)();
          swift_bridgeObjectRelease();
          char v69 = state64;
        }
        else
        {
          __chkstk_darwin(v66);
          *(&v116 - 2) = (uint64_t)sub_10003AA5C;
          *(&v116 - 1) = (uint64_t)(&v116 - 4);
          if ((v65 & 0x2000000000000000) != 0)
          {
            uint64_t state64 = v64;
            uint64_t v128 = v65 & 0xFFFFFFFFFFFFFFLL;
            switch((char)v64)
            {
              case 0:
              case 9:
              case 10:
              case 11:
              case 12:
              case 13:
              case 32:
                swift_bridgeObjectRetain();
                char v69 = 0;
                uint64_t v34 = v125;
                break;
              default:
                swift_bridgeObjectRetain();
                uint64_t v113 = (unsigned char *)_swift_stdlib_strtod_clocale();
                uint64_t v34 = v125;
                if (v113) {
                  char v69 = *v113 == 0;
                }
                else {
                  char v69 = 0;
                }
                break;
            }
            swift_bridgeObjectRelease();
            goto LABEL_63;
          }
          if ((v64 & 0x1000000000000000) != 0)
          {
            uint64_t v67 = (v65 & 0xFFFFFFFFFFFFFFFLL) + 32;
            uint64_t v68 = v64 & 0xFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v67 = _StringObject.sharedUTF8.getter();
            uint64_t v68 = v115;
          }
          swift_bridgeObjectRetain();
          char v69 = sub_10003A378(v67, v68, (void (*)(uint64_t *__return_ptr))sub_10003AACC);
          swift_bridgeObjectRelease();
        }
        uint64_t v34 = v125;
LABEL_63:
        double v97 = v126;
        if ((v69 & 1) == 0) {
          double v97 = 0.0;
        }
        uint64_t v98 = v118;
        *uint64_t v118 = v97;
        uint64_t v100 = v123;
        uint64_t v99 = v124;
        (*(void (**)(double *, void, uint64_t))(v124 + 104))(v98, enum case for SimpleType.double(_:), v123);
        sub_1000067B8(v61, v34, type metadata accessor for FeatureInfo);
        uint64_t v35 = type metadata accessor for FeatureState(0);
        (*(void (**)(uint64_t, double *, uint64_t))(v99 + 32))(v34 + *(int *)(v35 + 20), v98, v100);
        goto LABEL_59;
      }
      uint64_t v84 = state64;
      uint64_t v83 = v125;
      sub_10003A9F4(a1, v125, type metadata accessor for FeatureInfo);
      uint64_t v35 = type metadata accessor for FeatureState(0);
      *(void *)(v83 + *(int *)(v35 + 20)) = v84;
      (*(void (**)(void))(v124 + 104))();
LABEL_85:
      *(_DWORD *)(v83 + *(int *)(v35 + 24)) = -1;
      uint64_t v95 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56);
      uint64_t v96 = v83;
      return v95(v96, 0, 1, v35);
    }
    if (v30 == enum case for SystemMonitorConfig.DataType.BOOL(_:))
    {
      static DefaultsUtilities.platformDefaultUserName.getter();
      static DefaultsUtilities.get<A>(key:applicationID:userName:)();
      swift_bridgeObjectRelease();
      if (state64 != 2)
      {
        char v93 = state64 & 1;
        uint64_t v94 = a1;
        uint64_t v34 = v125;
        sub_10003A9F4(v94, v125, type metadata accessor for FeatureInfo);
        uint64_t v35 = type metadata accessor for FeatureState(0);
        *(unsigned char *)(v34 + *(int *)(v35 + 20)) = v93;
        goto LABEL_58;
      }
      uint64_t v76 = (void *)(a1 + *(int *)(v4 + 32));
      uint64_t v77 = v76[1];
      *uint64_t v20 = *v76;
      v20[1] = v77;
      uint64_t v79 = v123;
      uint64_t v78 = v124;
      uint64_t v80 = *(void (**)(unsigned char *, void, uint64_t))(v124 + 104);
      v80(v20, enum case for SimpleType.string(_:), v123);
      uint64_t v81 = a1;
      uint64_t v82 = v117;
      sub_10003A9F4(v81, v117, type metadata accessor for FeatureInfo);
      swift_bridgeObjectRetain();
      LOBYTE(v77) = SimpleType.isTrue()();
      (*(void (**)(void *, uint64_t))(v78 + 8))(v20, v79);
      *uint64_t v18 = v77 & 1;
      v80(v18, enum case for SimpleType.BOOL(_:), v79);
      uint64_t v83 = v125;
      sub_1000067B8(v82, v125, type metadata accessor for FeatureInfo);
      uint64_t v35 = type metadata accessor for FeatureState(0);
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v78 + 32))(v83 + *(int *)(v35 + 20), v18, v79);
      goto LABEL_85;
    }
    uint64_t v85 = Logger.logObject.getter();
    os_log_type_t v86 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v85, v86))
    {
      uint64_t v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v87 = 0;
      _os_log_impl((void *)&_mh_execute_header, v85, v86, "Unknown featureInfo dataType received.", v87, 2u);
      swift_slowDealloc();
    }

    uint64_t v88 = type metadata accessor for FeatureState(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v125, 1, 1, v88);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  else if (v29 == enum case for SystemMonitorConfig.MonitorType.notify(_:))
  {
    int v37 = v122;
    if ((v122 & 0x100000000) == 0)
    {
      uint64_t state64 = 0;
      if (!notify_get_state(v122, &state64))
      {
        uint64_t v38 = v125;
        sub_10003A9F4(a1, v125, type metadata accessor for FeatureInfo);
        uint64_t v39 = type metadata accessor for FeatureState(0);
        *(unsigned char *)(v38 + *(int *)(v39 + 20)) = state64 == 1;
        (*(void (**)(void))(v124 + 104))();
        *(_DWORD *)(v38 + *(int *)(v39 + 24)) = v37;
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 0, 1, v39);
      }
      goto LABEL_21;
    }
    uint64_t v57 = Logger.logObject.getter();
    os_log_type_t v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "cachedToken is nil.", v59, 2u);
      swift_slowDealloc();
    }

    uint64_t v60 = type metadata accessor for FeatureState(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v125, 1, 1, v60);
  }
  else
  {
    if (v29 == enum case for SystemMonitorConfig.MonitorType.other(_:)) {
      goto LABEL_21;
    }
    uint64_t v70 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v72 = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Unknown featureInfo monitorType received.", v72, 2u);
      swift_slowDealloc();
    }

    uint64_t v73 = type metadata accessor for FeatureState(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v125, 1, 1, v73);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  }
}

uint64_t SystemMonitor.currentMessage.getter()
{
  uint64_t v1 = sub_100005E64(&qword_100049700);
  __chkstk_darwin(v1 - 8);
  os_log_type_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(os_unfair_lock_s **)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock(v4 + 6);
  sub_100036D64(&v8);
  os_unfair_lock_unlock(v4 + 6);
  swift_release();
  uint64_t v5 = type metadata accessor for Message.Metadata();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  return Message.init(category:type:content:metadata:)();
}

uint64_t sub_100036D64@<X0>(void *a1@<X8>)
{
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_100034038(v3);
  swift_bridgeObjectRelease();
  if (*(void *)(v4 + 16))
  {
    sub_100005E64(&qword_100049690);
    uint64_t v5 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v8 = v5;
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_1000395B8(v6, 1, &v8);
  if (v1)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *a1 = v8;
  }
  return result;
}

uint64_t sub_100036E40(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FeatureState(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v36 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v36 = a1;
  uint64_t v14 = *a1;
  uint64_t v15 = *(void *)(*a1 + 64);
  uint64_t v39 = *a1 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(v14 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  uint64_t v41 = a2 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  uint64_t v42 = v14;
  int64_t v40 = (unint64_t)(v16 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  *(void *)&long long v21 = 67240192;
  long long v37 = v21;
  uint64_t v38 = v5;
  while (1)
  {
    if (v18)
    {
      unint64_t v22 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      int64_t v43 = v20;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_24;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v40) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v39 + 8 * v24);
    int64_t v26 = v20 + 1;
    if (!v25)
    {
      int64_t v26 = v20 + 2;
      if (v20 + 2 >= v40) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v39 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v20 + 3;
        if (v20 + 3 >= v40) {
          goto LABEL_26;
        }
        unint64_t v25 = *(void *)(v39 + 8 * v26);
        if (!v25)
        {
          int64_t v26 = v20 + 4;
          if (v20 + 4 >= v40) {
            goto LABEL_26;
          }
          unint64_t v25 = *(void *)(v39 + 8 * v26);
          if (!v25) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v18 = (v25 - 1) & v25;
    int64_t v43 = v26;
    unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_24:
    sub_10003A9F4(*(void *)(v42 + 56) + *(void *)(v5 + 72) * v23, (uint64_t)v13, type metadata accessor for FeatureState);
    sub_1000067B8((uint64_t)v13, (uint64_t)v11, type metadata accessor for FeatureState);
    sub_10003A9F4((uint64_t)v11, (uint64_t)v8, type metadata accessor for FeatureState);
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = v37;
      uint64_t v31 = v13;
      uint64_t v32 = v11;
      uint64_t v33 = v4;
      int v34 = *(_DWORD *)&v8[*(int *)(v4 + 24)];
      sub_10003AB10((uint64_t)v8, type metadata accessor for FeatureState);
      *(_DWORD *)(v30 + 4) = v34;
      uint64_t v4 = v33;
      uint64_t v11 = v32;
      uint64_t v13 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "notify_cancel(%{public}d)", (uint8_t *)v30, 8u);
      uint64_t v5 = v38;
      swift_slowDealloc();
    }
    else
    {
      sub_10003AB10((uint64_t)v8, type metadata accessor for FeatureState);
    }
    int64_t v20 = v43;

    notify_cancel(*(_DWORD *)&v11[*(int *)(v4 + 24)]);
    uint64_t result = sub_10003AB10((uint64_t)v11, type metadata accessor for FeatureState);
  }
  uint64_t v27 = v20 + 5;
  if (v20 + 5 >= v40)
  {
LABEL_26:
    swift_release();
    uint64_t v35 = v36;
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v35 = &_swiftEmptyDictionarySingleton;
    return result;
  }
  unint64_t v25 = *(void *)(v39 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v20 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v40) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v39 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_23;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10003723C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = type metadata accessor for SystemMonitorConfig();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v40 - v8;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v46 = a1;
  v13(v9, a1, v3);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    int v42 = v16;
    unint64_t v18 = (uint8_t *)v17;
    uint64_t v43 = swift_slowAlloc();
    uint64_t v49 = v43;
    os_log_t v41 = v14;
    *(_DWORD *)unint64_t v18 = 136380675;
    int64_t v40 = v18 + 4;
    v13(v7, (uint64_t)v9, v3);
    uint64_t v19 = String.init<A>(describing:)();
    uint64_t v48 = sub_10002E344(v19, v20, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    uint64_t v14 = v41;
    _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v42, "SystemMonitor.buildFeatureInfos. { config=%{private}s }", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v45);
  uint64_t v21 = v47;
  SystemMonitorConfig.monitorType.getter();
  uint64_t v22 = SystemMonitorConfig.name.getter();
  uint64_t v44 = v23;
  uint64_t v45 = v22;
  uint64_t v24 = SystemMonitorConfig.domain.getter();
  uint64_t v26 = v25;
  uint64_t v27 = SystemMonitorConfig.notification.getter();
  uint64_t v29 = v28;
  uint64_t v30 = SystemMonitorConfig.defaultValue.getter();
  uint64_t v32 = v31;
  uint64_t v33 = (int *)type metadata accessor for FeatureInfo(0);
  uint64_t result = SystemMonitorConfig.dataType.getter();
  uint64_t v35 = (uint64_t *)(v21 + v33[5]);
  uint64_t v36 = v44;
  *uint64_t v35 = v45;
  v35[1] = v36;
  long long v37 = (uint64_t *)(v21 + v33[6]);
  *long long v37 = v24;
  v37[1] = v26;
  uint64_t v38 = (uint64_t *)(v21 + v33[7]);
  *uint64_t v38 = v27;
  v38[1] = v29;
  uint64_t v39 = (uint64_t *)(v21 + v33[8]);
  *uint64_t v39 = v30;
  v39[1] = v32;
  return result;
}

uint64_t SystemMonitor.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SystemMonitor.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100037700()
{
  return type metadata accessor for SystemMonitor(0);
}

uint64_t type metadata accessor for SystemMonitor(uint64_t a1)
{
  return sub_1000383D8(a1, qword_10004A0D0);
}

uint64_t sub_100037728()
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

uint64_t *sub_1000377E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v32 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v32 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SystemMonitorConfig.MonitorType();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for FeatureInfo(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = v8[6];
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    os_log_type_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v8[7];
    unint64_t v18 = (uint64_t *)((char *)a1 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *unint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v8[8];
    uint64_t v22 = (uint64_t *)((char *)a1 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v8[9];
    int v34 = (char *)a2 + v25;
    uint64_t v35 = (char *)a1 + v25;
    uint64_t v26 = type metadata accessor for SystemMonitorConfig.DataType();
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27(v35, v34, v26);
    uint64_t v28 = *(int *)(a3 + 20);
    uint64_t v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = type metadata accessor for SimpleType();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t type metadata accessor for FeatureInfo(uint64_t a1)
{
  return sub_1000383D8(a1, qword_10004A268);
}

uint64_t sub_1000379FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(v5 + 36);
  uint64_t v7 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 20);
  uint64_t v9 = type metadata accessor for SimpleType();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

uint64_t sub_100037B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  uint64_t v6 = (int *)type metadata accessor for FeatureInfo(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = v6[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = v6[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = v6[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = v6[9];
  uint64_t v32 = a1 + v23;
  uint64_t v24 = a2 + v23;
  uint64_t v25 = type metadata accessor for SystemMonitorConfig.DataType();
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26(v32, v24, v25);
  uint64_t v27 = *(int *)(a3 + 20);
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = type metadata accessor for SimpleType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100037CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for FeatureInfo(0);
  uint64_t v8 = v7[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  void *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = v7[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v7[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v7[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = v7[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = *(int *)(a3 + 20);
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = type metadata accessor for SimpleType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100037EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for FeatureInfo(0);
  *(_OWORD *)(a1 + v7[5]) = *(_OWORD *)(a2 + v7[5]);
  *(_OWORD *)(a1 + v7[6]) = *(_OWORD *)(a2 + v7[6]);
  *(_OWORD *)(a1 + v7[7]) = *(_OWORD *)(a2 + v7[7]);
  *(_OWORD *)(a1 + v7[8]) = *(_OWORD *)(a2 + v7[8]);
  uint64_t v8 = v7[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for SimpleType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100038004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for FeatureInfo(0);
  uint64_t v8 = v7[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  void *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = v7[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = v7[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  void *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = v7[8];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = v7[9];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  uint64_t v31 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 40))(v29, v30, v31);
  uint64_t v32 = *(int *)(a3 + 20);
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = type metadata accessor for SimpleType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 40))(v33, v34, v35);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100038194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000381A8);
}

uint64_t sub_1000381A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for FeatureInfo(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for SimpleType();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000382A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000382B4);
}

uint64_t sub_1000382B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for FeatureInfo(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for SimpleType();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for FeatureState(uint64_t a1)
{
  return sub_1000383D8(a1, qword_10004A1D0);
}

uint64_t sub_1000383D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100038410()
{
  uint64_t result = type metadata accessor for FeatureInfo(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SimpleType();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1000384E4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SystemMonitorConfig.MonitorType();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (uint64_t *)((char *)a1 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (uint64_t *)((char *)a1 + v17);
    uint64_t v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    uint64_t v25 = a3[9];
    uint64_t v26 = (char *)a2 + v25;
    uint64_t v27 = (char *)a1 + v25;
    *uint64_t v21 = v23;
    v21[1] = v24;
    uint64_t v28 = type metadata accessor for SystemMonitorConfig.DataType();
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v27, v26, v28);
  }
  return a1;
}

uint64_t sub_100038670(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 36);
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.DataType();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_100038758(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (void *)(a1 + v16);
  uint64_t v21 = (uint64_t *)(a2 + v16);
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  uint64_t v24 = a3[9];
  uint64_t v25 = a2 + v24;
  uint64_t v26 = a1 + v24;
  *uint64_t v20 = v22;
  v20[1] = v23;
  uint64_t v27 = type metadata accessor for SystemMonitorConfig.DataType();
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v26, v25, v27);
  return a1;
}

uint64_t sub_100038894(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[9];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  return a1;
}

uint64_t sub_1000389FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

uint64_t sub_100038ADC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = type metadata accessor for SystemMonitorConfig.DataType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  return a1;
}

uint64_t sub_100038C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100038C18);
}

uint64_t sub_100038C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SystemMonitorConfig.MonitorType();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for SystemMonitorConfig.DataType();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 36);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_100038D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100038D5C);
}

uint64_t sub_100038D5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SystemMonitorConfig.MonitorType();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for SystemMonitorConfig.DataType();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 36);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_100038E8C()
{
  uint64_t result = type metadata accessor for SystemMonitorConfig.MonitorType();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SystemMonitorConfig.DataType();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100038F64()
{
  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int sub_1000390F8()
{
  return Hasher._finalize()();
}

Swift::Int sub_1000392A4()
{
  return Hasher._finalize()();
}

uint64_t sub_100039440()
{
  return sub_10003A9AC(&qword_10004A2B0, (void (*)(uint64_t))type metadata accessor for FeatureInfo);
}

uint64_t sub_100039488(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __chkstk_darwin(a1);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v14 - v8;
  char v11 = sub_10003A720(v7, v10);
  sub_10003A9F4(a1, (uint64_t)v9, type metadata accessor for FeatureState);
  sub_10003A9F4(a2, (uint64_t)v6, type metadata accessor for FeatureState);
  if (v11) {
    char v12 = static SimpleType.== infix(_:_:)();
  }
  else {
    char v12 = 0;
  }
  sub_10003AB10((uint64_t)v6, type metadata accessor for FeatureState);
  sub_10003AB10((uint64_t)v9, type metadata accessor for FeatureState);
  return v12 & 1;
}

uint64_t sub_1000395B8(uint64_t a1, int a2, void *a3)
{
  uint64_t v7 = type metadata accessor for SimpleType();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005E64(&qword_100049688);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v15 = (uint64_t *)((char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    return swift_bridgeObjectRelease();
  }
  LODWORD(v64) = a2;
  uint64_t v60 = v3;
  uint64_t v61 = v16;
  uint64_t v17 = (char *)v15 + *(int *)(v12 + 48);
  unint64_t v59 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v18 = a1 + v59;
  uint64_t v66 = *(void *)(v13 + 72);
  uint64_t v63 = a1;
  swift_bridgeObjectRetain();
  sub_100006754(v18, (uint64_t)v15, &qword_100049688);
  uint64_t v62 = v8;
  uint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v21 = v15[1];
  uint64_t v72 = *v15;
  uint64_t v20 = v72;
  uint64_t v73 = v21;
  uint64_t v68 = v19;
  char v69 = v10;
  uint64_t v65 = v17;
  uint64_t v67 = v7;
  v19((unint64_t)v10, v17, v7);
  uint64_t v22 = (void *)*a3;
  unint64_t v24 = sub_100022EA0(v20, v21);
  uint64_t v25 = v22[2];
  BOOL v26 = (v23 & 1) == 0;
  uint64_t v27 = v25 + v26;
  if (__OFADD__(v25, v26)) {
    goto LABEL_23;
  }
  char v28 = v23;
  if (v22[3] >= v27)
  {
    if (v64)
    {
      if (v23) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_1000256F0();
      if (v28) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v33 = (void *)*a3;
    *(void *)(*a3 + 8 * (v24 >> 6) + 64) |= 1 << v24;
    uint64_t v34 = (uint64_t *)(v33[6] + 16 * v24);
    *uint64_t v34 = v20;
    v34[1] = v21;
    uint64_t v35 = v33[7];
    uint64_t v64 = *(void *)(v62 + 72);
    uint64_t v36 = v67;
    v68(v35 + v64 * v24, v69, v67);
    uint64_t v37 = v33[2];
    BOOL v38 = __OFADD__(v37, 1);
    uint64_t v39 = v37 + 1;
    if (v38)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v33[2] = v39;
    uint64_t v40 = v61 - 1;
    if (v61 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    uint64_t v41 = v63 + v66 + v59;
    while (1)
    {
      sub_100006754(v41, (uint64_t)v15, &qword_100049688);
      uint64_t v43 = v15[1];
      uint64_t v72 = *v15;
      uint64_t v42 = v72;
      uint64_t v73 = v43;
      v68((unint64_t)v69, v65, v36);
      uint64_t v44 = (void *)*a3;
      unint64_t v45 = sub_100022EA0(v42, v43);
      uint64_t v47 = v44[2];
      BOOL v48 = (v46 & 1) == 0;
      BOOL v38 = __OFADD__(v47, v48);
      uint64_t v49 = v47 + v48;
      if (v38) {
        break;
      }
      char v50 = v46;
      if (v44[3] < v49)
      {
        sub_1000234CC(v49, 1);
        unint64_t v45 = sub_100022EA0(v42, v43);
        if ((v50 & 1) != (v51 & 1)) {
          goto LABEL_25;
        }
      }
      if (v50) {
        goto LABEL_10;
      }
      uint64_t v52 = (void *)*a3;
      *(void *)(*a3 + 8 * (v45 >> 6) + 64) |= 1 << v45;
      uint64_t v53 = (uint64_t *)(v52[6] + 16 * v45);
      *uint64_t v53 = v42;
      v53[1] = v43;
      uint64_t v36 = v67;
      v68(v52[7] + v64 * v45, v69, v67);
      uint64_t v54 = v52[2];
      BOOL v38 = __OFADD__(v54, 1);
      uint64_t v55 = v54 + 1;
      if (v38) {
        goto LABEL_24;
      }
      v52[2] = v55;
      v41 += v66;
      if (!--v40) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1000234CC(v27, v64 & 1);
  unint64_t v29 = sub_100022EA0(v20, v21);
  if ((v28 & 1) == (v30 & 1))
  {
    unint64_t v24 = v29;
    if ((v28 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v32 = swift_allocError();
    swift_willThrow();
    uint64_t v74 = v32;
    swift_errorRetain();
    sub_100005E64(&qword_10004A2B8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v69, v67);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  uint64_t v70 = 0;
  unint64_t v71 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v56._object = (void *)0x800000010003F430;
  v56._id countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v56);
  _print_unlocked<A, B>(_:_:)();
  v57._id countAndFlagsBits = 39;
  v57._object = (void *)0xE100000000000000;
  String.append(_:)(v57);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned __int8 *sub_100039B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100039E8C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = sub_100039C10(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_100039C10(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100039E8C()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_100039F0C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100039F0C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10003A064(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10002E7E4(v9, 0),
          unint64_t v12 = sub_10003A164((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_10003A064(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_10002E84C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10002E84C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_10003A164(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_10002E84C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_10002E84C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10003A378(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t sub_10003A3D8(uint64_t a1)
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

void *sub_10003A460()
{
  uint64_t v0 = type metadata accessor for SystemMonitorConfig();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for FeatureInfo(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  unint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = Config.systemMonitorConfigs.getter();
  int64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    unint64_t v23 = _swiftEmptyArrayStorage;
    sub_10002F200(0, v9, 0);
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    uint64_t v10 = v1 + 16;
    uint64_t v12 = *(unsigned __int8 *)(v10 + 64);
    v18[1] = v8;
    uint64_t v13 = v8 + ((v12 + 32) & ~v12);
    uint64_t v19 = *(void *)(v10 + 56);
    char v20 = v11;
    uint64_t v21 = v10;
    uint64_t v22 = v0;
    do
    {
      v20(v3, v13, v0);
      sub_10003723C((uint64_t)v3, (uint64_t)v7);
      (*(void (**)(char *, uint64_t))(v10 - 8))(v3, v0);
      uint64_t v14 = v23;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10002F200(0, v14[2] + 1, 1);
        uint64_t v14 = v23;
      }
      unint64_t v16 = v14[2];
      unint64_t v15 = v14[3];
      if (v16 >= v15 >> 1)
      {
        sub_10002F200(v15 > 1, v16 + 1, 1);
        uint64_t v14 = v23;
      }
      long long v14[2] = v16 + 1;
      sub_1000067B8((uint64_t)v7, (uint64_t)v14+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v16, type metadata accessor for FeatureInfo);
      v13 += v19;
      --v9;
      uint64_t v0 = v22;
    }
    while (v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return v14;
}

uint64_t sub_10003A720(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SystemMonitorConfig.MonitorType();
  sub_10003A9AC(&qword_100049E40, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v29 == v27 && v30 == v28)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v6 = 0;
    if ((v5 & 1) == 0) {
      return v6 & 1;
    }
  }
  unint64_t v7 = (int *)type metadata accessor for FeatureInfo(0);
  uint64_t v8 = v7[5];
  uint64_t v9 = *(void *)(a1 + v8);
  uint64_t v10 = *(void *)(a1 + v8 + 8);
  uint64_t v11 = (void *)(a2 + v8);
  BOOL v12 = v9 == *v11 && v10 == v11[1];
  if (v12 || (char v6 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    uint64_t v13 = v7[6];
    uint64_t v14 = *(void *)(a1 + v13);
    uint64_t v15 = *(void *)(a1 + v13 + 8);
    unint64_t v16 = (void *)(a2 + v13);
    BOOL v17 = v14 == *v16 && v15 == v16[1];
    if (v17 || (char v6 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
    {
      if ((uint64_t v18 = v7[7],
            uint64_t v19 = *(void *)(a1 + v18),
            uint64_t v20 = *(void *)(a1 + v18 + 8),
            uint64_t v21 = (void *)(a2 + v18),
            v19 == *v21)
        && v20 == v21[1]
        || (char v6 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      {
        if ((uint64_t v22 = v7[8],
              uint64_t v23 = *(void *)(a1 + v22),
              uint64_t v24 = *(void *)(a1 + v22 + 8),
              uint64_t v25 = (void *)(a2 + v22),
              v23 == *v25)
          && v24 == v25[1]
          || (char v6 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
        {
          type metadata accessor for SystemMonitorConfig.DataType();
          sub_10003A9AC(&qword_100049E48, (void (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType);
          dispatch thunk of RawRepresentable.rawValue.getter();
          dispatch thunk of RawRepresentable.rawValue.getter();
          if (v29 == v27 && v30 == v28) {
            char v6 = 1;
          }
          else {
            char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  return v6 & 1;
}

uint64_t sub_10003A9AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003A9F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unsigned char *sub_10003AA5C@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (uint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_10003AACC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_10003AB10(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003AB70()
{
  return sub_10003A9AC(&qword_100049C40, (void (*)(uint64_t))type metadata accessor for FeatureInfo);
}

unint64_t sub_10003ABC0()
{
  return (*(void *)(*(void *)(type metadata accessor for FeatureInfo(0) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t sub_10003AC30(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SystemMonitorConfig.MonitorType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(v3 + 36);
  uint64_t v5 = type metadata accessor for SystemMonitorConfig.DataType();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10003AD20(uint64_t a1, uint64_t a2)
{
  sub_10003A9F4(a1, a2, type metadata accessor for FeatureInfo);

  return type metadata accessor for FeatureInfo(0);
}

uint64_t sub_10003AD68(uint64_t a1, uint64_t a2)
{
  return sub_1000067B8(a1, a2, type metadata accessor for FeatureInfo);
}

uint64_t sub_10003ADB4(void *a1)
{
  return sub_100036E40(a1, v1);
}

ValueMetadata *type metadata accessor for Workers()
{
  return &type metadata for Workers;
}

char *sub_10003ADE0()
{
  uint64_t result = sub_10003AE00();
  qword_10004A3A8 = (uint64_t)result;
  return result;
}

char *sub_10003AE00()
{
  sub_100005E64(&qword_10004A068);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003DEE0;
  uint64_t v1 = type metadata accessor for CoreAnalyticsWorker();
  uint64_t v2 = sub_10003B934(&qword_10004A2D8, (void (*)(uint64_t))&type metadata accessor for CoreAnalyticsWorker);
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  uint64_t v3 = type metadata accessor for RTCWorker();
  uint64_t v4 = sub_10003B934(&qword_10004A2E0, (void (*)(uint64_t))&type metadata accessor for RTCWorker);
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v4;
  uint64_t v5 = type metadata accessor for TailspinWorker();
  uint64_t v6 = sub_10003B934(&qword_10004A2E8, (void (*)(uint64_t))&type metadata accessor for TailspinWorker);
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 72) = v6;
  uint64_t v7 = type metadata accessor for SummaryDecoratorWorker();
  uint64_t v8 = sub_10003B934(&qword_10004A2F0, (void (*)(uint64_t))&type metadata accessor for SummaryDecoratorWorker);
  *(void *)(inited + 80) = v7;
  *(void *)(inited + 88) = v8;
  uint64_t v9 = type metadata accessor for SessionSummaryWorker();
  uint64_t v10 = sub_10003B934(&qword_10004A2F8, (void (*)(uint64_t))&type metadata accessor for SessionSummaryWorker);
  *(void *)(inited + 96) = v9;
  *(void *)(inited + 104) = v10;
  uint64_t v11 = type metadata accessor for DurationSummaryWorker();
  uint64_t v12 = sub_10003B934(&qword_10004A300, (void (*)(uint64_t))&type metadata accessor for DurationSummaryWorker);
  *(void *)(inited + 112) = v11;
  *(void *)(inited + 120) = v12;
  uint64_t v13 = type metadata accessor for DriverSnapshotWorker();
  uint64_t v14 = sub_10003B934(&qword_10004A308, (void (*)(uint64_t))&type metadata accessor for DriverSnapshotWorker);
  *(void *)(inited + 128) = v13;
  *(void *)(inited + 136) = v14;
  uint64_t v15 = type metadata accessor for PowerLogWorker();
  uint64_t v16 = sub_10003B934(&qword_10004A310, (void (*)(uint64_t))&type metadata accessor for PowerLogWorker);
  *(void *)(inited + 144) = v15;
  *(void *)(inited + 152) = v16;
  uint64_t v17 = type metadata accessor for AirPodWorker();
  uint64_t v18 = sub_10003B934(&qword_10004A318, (void (*)(uint64_t))&type metadata accessor for AirPodWorker);
  *(void *)(inited + 160) = v17;
  *(void *)(inited + 168) = v18;
  uint64_t v19 = type metadata accessor for AdaptiveVolumeWorker();
  uint64_t v20 = sub_10003B934(&qword_10004A320, (void (*)(uint64_t))&type metadata accessor for AdaptiveVolumeWorker);
  uint64_t v21 = sub_10002DD18((char *)1, 10, 1, (char *)inited);
  *((void *)v21 + 2) = 10;
  *((void *)v21 + 22) = v19;
  *((void *)v21 + 23) = v20;
  unint64_t v22 = *((void *)v21 + 3);
  if (v22 <= 0x15) {
    uint64_t v21 = sub_10002DD18((char *)(v22 > 1), 11, 1, v21);
  }
  uint64_t v23 = type metadata accessor for InferenceSummaryWorker();
  uint64_t v24 = sub_10003B934(&qword_10004A328, (void (*)(uint64_t))&type metadata accessor for InferenceSummaryWorker);
  *((void *)v21 + 2) = 11;
  *((void *)v21 + 24) = v23;
  *((void *)v21 + 25) = v24;
  uint64_t v76 = v21;
  if (&protocol conformance descriptor for JsonFileWorker) {
    BOOL v25 = &type metadata accessor for JsonFileWorker == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25
    && &type metadata for JsonFileWorker != 0
    && &nominal type descriptor for JsonFileWorker != 0
    && &metaclass for JsonFileWorker != 0)
  {
    uint64_t v29 = type metadata accessor for JsonFileWorker();
    uint64_t v30 = sub_10003B97C(&qword_10004A348, (void (*)(uint64_t))&type metadata accessor for JsonFileWorker);
    sub_100026274(0, 0, v29, v30);
    id v31 = [self processInfo];
    id v32 = [v31 environment];

    uint64_t v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v34 = static Constants.loadTestWorkerEnv.getter();
    if (*(void *)(v33 + 16) && (sub_100022EA0(v34, v35), (v36 & 1) != 0))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      NSString v37 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      unsigned __int8 v38 = [v37 BOOLValue];

      if (v38)
      {
        uint64_t v39 = v76;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v39 = sub_10002DD18(0, *((void *)v76 + 2) + 1, 1, v76);
        }
        unint64_t v41 = *((void *)v39 + 2);
        unint64_t v40 = *((void *)v39 + 3);
        if (v41 >= v40 >> 1) {
          uint64_t v39 = sub_10002DD18((char *)(v40 > 1), v41 + 1, 1, v39);
        }
        uint64_t v42 = type metadata accessor for TestWorker();
        uint64_t v43 = sub_10003B97C(&qword_10004A350, (void (*)(uint64_t))&type metadata accessor for TestWorker);
        *((void *)v39 + 2) = v41 + 1;
        uint64_t v44 = &v39[16 * v41];
        *((void *)v44 + 4) = v42;
        *((void *)v44 + 5) = v43;
        uint64_t v76 = v39;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  unint64_t v45 = v76;
  if (&protocol conformance descriptor for ABCWorker) {
    BOOL v46 = &type metadata accessor for ABCWorker == 0;
  }
  else {
    BOOL v46 = 1;
  }
  if (!v46
    && &type metadata for ABCWorker != 0
    && &nominal type descriptor for ABCWorker != 0
    && &metaclass for ABCWorker != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v45 = sub_10002DD18(0, *((void *)v76 + 2) + 1, 1, v76);
    }
    unint64_t v51 = *((void *)v45 + 2);
    unint64_t v50 = *((void *)v45 + 3);
    if (v51 >= v50 >> 1) {
      unint64_t v45 = sub_10002DD18((char *)(v50 > 1), v51 + 1, 1, v45);
    }
    uint64_t v52 = type metadata accessor for ABCWorker();
    uint64_t v53 = sub_10003B97C(&qword_10004A340, (void (*)(uint64_t))&type metadata accessor for ABCWorker);
    *((void *)v45 + 2) = v51 + 1;
    uint64_t v54 = &v45[16 * v51];
    *((void *)v54 + 4) = v52;
    *((void *)v54 + 5) = v53;
  }
  if (&protocol conformance descriptor for AudioCaptureNotificationsWorker) {
    BOOL v55 = &protocol conformance descriptor for AudioCaptureNotificationsWorker == 0;
  }
  else {
    BOOL v55 = 1;
  }
  if (!v55
    && &type metadata accessor for AudioCaptureNotificationsWorker != 0
    && &type metadata for AudioCaptureNotificationsWorker != 0
    && &nominal type descriptor for AudioCaptureNotificationsWorker != 0
    && &metaclass for AudioCaptureNotificationsWorker != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v45 = sub_10002DD18(0, *((void *)v45 + 2) + 1, 1, v45);
    }
    unint64_t v61 = *((void *)v45 + 2);
    unint64_t v60 = *((void *)v45 + 3);
    if (v61 >= v60 >> 1) {
      unint64_t v45 = sub_10002DD18((char *)(v60 > 1), v61 + 1, 1, v45);
    }
    uint64_t v62 = type metadata accessor for AudioCaptureNotificationsWorker();
    uint64_t v63 = sub_10003B97C(&qword_10004A338, (void (*)(uint64_t))&type metadata accessor for AudioCaptureNotificationsWorker);
    *((void *)v45 + 2) = v61 + 1;
    uint64_t v64 = &v45[16 * v61];
    *((void *)v64 + 4) = v62;
    *((void *)v64 + 5) = v63;
  }
  if (&protocol conformance descriptor for AudioCaptureLogsWorker) {
    BOOL v65 = &protocol conformance descriptor for AudioCaptureLogsWorker == 0;
  }
  else {
    BOOL v65 = 1;
  }
  if (!v65
    && &type metadata accessor for AudioCaptureLogsWorker != 0
    && &type metadata for AudioCaptureLogsWorker != 0
    && &nominal type descriptor for AudioCaptureLogsWorker != 0
    && &metaclass for AudioCaptureLogsWorker != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v45 = sub_10002DD18(0, *((void *)v45 + 2) + 1, 1, v45);
    }
    unint64_t v71 = *((void *)v45 + 2);
    unint64_t v70 = *((void *)v45 + 3);
    if (v71 >= v70 >> 1) {
      unint64_t v45 = sub_10002DD18((char *)(v70 > 1), v71 + 1, 1, v45);
    }
    uint64_t v72 = type metadata accessor for AudioCaptureLogsWorker();
    uint64_t v73 = sub_10003B97C(&qword_10004A330, (void (*)(uint64_t))&type metadata accessor for AudioCaptureLogsWorker);
    *((void *)v45 + 2) = v71 + 1;
    uint64_t v74 = &v45[16 * v71];
    *((void *)v74 + 4) = v72;
    *((void *)v74 + 5) = v73;
  }
  return v45;
}

void sub_10003B660()
{
  if (qword_100049630 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10004A3A8;
  uint64_t v1 = *(void *)(qword_10004A3A8 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v1; ++i)
    {
      long long v7 = *(_OWORD *)(v0 + 16 * i + 32);
      uint64_t v5 = *(void *)(v0 + 16 * i + 32);
      if (swift_conformsToProtocol2()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      if (v6)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10002F280(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v4 = _swiftEmptyArrayStorage[2];
        unint64_t v3 = _swiftEmptyArrayStorage[3];
        if (v4 >= v3 >> 1) {
          sub_10002F280(v3 > 1, v4 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v4 + 1;
        *(_OWORD *)&_swiftEmptyArrayStorage[2 * v4 + 4] = v7;
      }
    }
    swift_bridgeObjectRelease();
  }
  qword_10004A3B0 = (uint64_t)_swiftEmptyArrayStorage;
}

void sub_10003B7C8()
{
  if (qword_100049630 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10004A3A8;
  uint64_t v1 = *(void *)(qword_10004A3A8 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v1; ++i)
    {
      long long v8 = *(_OWORD *)(v0 + 16 * i + 32);
      uint64_t v6 = *(void *)(v0 + 16 * i + 32);
      if (swift_conformsToProtocol2()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      if (!v7)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10002F280(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        long long v3 = v8;
        unint64_t v5 = _swiftEmptyArrayStorage[2];
        unint64_t v4 = _swiftEmptyArrayStorage[3];
        if (v5 >= v4 >> 1)
        {
          sub_10002F280(v4 > 1, v5 + 1, 1);
          long long v3 = v8;
        }
        _swiftEmptyArrayStorage[2] = v5 + 1;
        *(_OWORD *)&_swiftEmptyArrayStorage[2 * v5 + 4] = v3;
      }
    }
    swift_bridgeObjectRelease();
  }
  qword_10004A3B8 = (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_10003B934(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003B97C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003BAE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_10003BC14(id a1)
{
  qword_10004ACC0 = objc_opt_new();

  _objc_release_x1();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._id countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._id countAndFlagsBits = v1;
  return result;
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static SimpleType.== infix(_:_:)()
{
  return static SimpleType.== infix(_:_:)();
}

Swift::Bool __swiftcall SimpleType.isTrue()()
{
  return SimpleType.isTrue()();
}

uint64_t type metadata accessor for SimpleType()
{
  return type metadata accessor for SimpleType();
}

uint64_t static ConfigCommon.matches(sessionAppName:config:)()
{
  return static ConfigCommon.matches(sessionAppName:config:)();
}

uint64_t static ConfigCommon.matches(audioServiceType:config:)()
{
  return static ConfigCommon.matches(audioServiceType:config:)();
}

uint64_t static ConfigCommon.matches(sessionProcessName:config:)()
{
  return static ConfigCommon.matches(sessionProcessName:config:)();
}

uint64_t RouterConfig.audioEventType.getter()
{
  return RouterConfig.audioEventType.getter();
}

uint64_t RouterConfig.audioEventCategory.getter()
{
  return RouterConfig.audioEventCategory.getter();
}

uint64_t RouterConfig.discard.getter()
{
  return RouterConfig.discard.getter();
}

uint64_t RouterConfig.workers.getter()
{
  return RouterConfig.workers.getter();
}

uint64_t RouterConfig.broadcast.getter()
{
  return RouterConfig.broadcast.getter();
}

uint64_t RouterConfig.predicate.getter()
{
  return RouterConfig.predicate.getter();
}

uint64_t type metadata accessor for RouterConfig()
{
  return type metadata accessor for RouterConfig();
}

uint64_t ServerConfig.osTransactionTimeout.getter()
{
  return ServerConfig.osTransactionTimeout.getter();
}

uint64_t ServerConfig.monitorClientConnections.getter()
{
  return ServerConfig.monitorClientConnections.getter();
}

uint64_t type metadata accessor for ServerConfig()
{
  return type metadata accessor for ServerConfig();
}

uint64_t dispatch thunk of WorkerProtocol.workerConfig.getter()
{
  return dispatch thunk of WorkerProtocol.workerConfig.getter();
}

uint64_t dispatch thunk of WorkerProtocol.stop()()
{
  return dispatch thunk of WorkerProtocol.stop()();
}

uint64_t dispatch thunk of WorkerProtocol.init(with:)()
{
  return dispatch thunk of WorkerProtocol.init(with:)();
}

uint64_t dispatch thunk of WorkerProtocol.start()()
{
  return dispatch thunk of WorkerProtocol.start()();
}

uint64_t dispatch thunk of WorkerProtocol.process(message:)()
{
  return dispatch thunk of WorkerProtocol.process(message:)();
}

uint64_t static DeviceUtilities.currentPlatform.getter()
{
  return static DeviceUtilities.currentPlatform.getter();
}

uint64_t static DeviceUtilities.isInternalBuild.getter()
{
  return static DeviceUtilities.isInternalBuild.getter();
}

uint64_t static DeviceUtilities.currentOperatingSystem.getter()
{
  return static DeviceUtilities.currentOperatingSystem.getter();
}

uint64_t type metadata accessor for OperatingSystem()
{
  return type metadata accessor for OperatingSystem();
}

uint64_t dispatch thunk of SessionProtocol.isSingleMessageSession.getter()
{
  return dispatch thunk of SessionProtocol.isSingleMessageSession.getter();
}

uint64_t dispatch thunk of SessionProtocol.serviceType.getter()
{
  return dispatch thunk of SessionProtocol.serviceType.getter();
}

uint64_t dispatch thunk of SessionProtocol.clientProcessName.getter()
{
  return dispatch thunk of SessionProtocol.clientProcessName.getter();
}

uint64_t dispatch thunk of SessionProtocol.appName.getter()
{
  return dispatch thunk of SessionProtocol.appName.getter();
}

uint64_t dispatch thunk of SummaryDecorator.addDecoratorData(_:operatingSystem:)()
{
  return dispatch thunk of SummaryDecorator.addDecoratorData(_:operatingSystem:)();
}

uint64_t static DefaultsUtilities.reportingDomain.getter()
{
  return static DefaultsUtilities.reportingDomain.getter();
}

uint64_t static DefaultsUtilities.platformDefaultUserName.getter()
{
  return static DefaultsUtilities.platformDefaultUserName.getter();
}

uint64_t static DefaultsUtilities.get<A>(key:applicationID:userName:)()
{
  return static DefaultsUtilities.get<A>(key:applicationID:userName:)();
}

uint64_t SystemMonitorConfig.MonitorType.rawValue.getter()
{
  return SystemMonitorConfig.MonitorType.rawValue.getter();
}

uint64_t type metadata accessor for SystemMonitorConfig.MonitorType()
{
  return type metadata accessor for SystemMonitorConfig.MonitorType();
}

uint64_t SystemMonitorConfig.monitorType.getter()
{
  return SystemMonitorConfig.monitorType.getter();
}

uint64_t SystemMonitorConfig.defaultValue.getter()
{
  return SystemMonitorConfig.defaultValue.getter();
}

uint64_t SystemMonitorConfig.notification.getter()
{
  return SystemMonitorConfig.notification.getter();
}

uint64_t SystemMonitorConfig.name.getter()
{
  return SystemMonitorConfig.name.getter();
}

uint64_t SystemMonitorConfig.domain.getter()
{
  return SystemMonitorConfig.domain.getter();
}

uint64_t type metadata accessor for SystemMonitorConfig.DataType()
{
  return type metadata accessor for SystemMonitorConfig.DataType();
}

uint64_t SystemMonitorConfig.dataType.getter()
{
  return SystemMonitorConfig.dataType.getter();
}

uint64_t type metadata accessor for SystemMonitorConfig()
{
  return type metadata accessor for SystemMonitorConfig();
}

Swift::Void __swiftcall OsTransactionHandler.sessionStarted(for:)(Swift::Int64 a1)
{
}

Swift::Void __swiftcall OsTransactionHandler.sessionStopped(for:)(Swift::Int64 a1)
{
}

Swift::Void __swiftcall OsTransactionHandler.expire()()
{
}

uint64_t static OsTransactionHandler.shared.getter()
{
  return static OsTransactionHandler.shared.getter();
}

Swift::Bool __swiftcall OsTransactionHandler.inactive()()
{
  return OsTransactionHandler.inactive()();
}

uint64_t type metadata accessor for OsTransactionHandler()
{
  return type metadata accessor for OsTransactionHandler();
}

uint64_t Keys.rawValue.getter()
{
  return Keys.rawValue.getter();
}

uint64_t type metadata accessor for Keys()
{
  return type metadata accessor for Keys();
}

uint64_t static Trace.post(_:args:)()
{
  return static Trace.post(_:args:)();
}

uint64_t static Config.distributedConfigName.getter()
{
  return static Config.distributedConfigName.getter();
}

uint64_t static Config.assetConfigPath.getter()
{
  return static Config.assetConfigPath.getter();
}

uint64_t Config.serverConfig.getter()
{
  return Config.serverConfig.getter();
}

uint64_t static Config.defaultConfigPathEncrypted.getter()
{
  return static Config.defaultConfigPathEncrypted.getter();
}

uint64_t Config.sortableConfigVersion.getter()
{
  return Config.sortableConfigVersion.getter();
}

uint64_t Config.init(configPath:allowUnknownFields:platform:encrypted:)()
{
  return Config.init(configPath:allowUnknownFields:platform:encrypted:)();
}

uint64_t Config.configPath.getter()
{
  return Config.configPath.getter();
}

uint64_t Config.WorkerConfigs.rawValue.getter()
{
  return Config.WorkerConfigs.rawValue.getter();
}

uint64_t type metadata accessor for Config.WorkerConfigs()
{
  return type metadata accessor for Config.WorkerConfigs();
}

uint64_t static Config.configVersion.setter()
{
  return static Config.configVersion.setter();
}

uint64_t Config.routerConfigs.getter()
{
  return Config.routerConfigs.getter();
}

uint64_t Config.neededPreviousFields.getter()
{
  return Config.neededPreviousFields.getter();
}

uint64_t Config.systemMonitorConfigs.getter()
{
  return Config.systemMonitorConfigs.getter();
}

Swift::Void __swiftcall Config.updateNeededPreviousFields(workers:)(Swift::OpaquePointer workers)
{
}

uint64_t type metadata accessor for Config()
{
  return type metadata accessor for Config();
}

Swift::Void __swiftcall Message.addToContent(from:)(Swift::OpaquePointer from)
{
}

uint64_t Message.copyPrevious(fields:from:)()
{
  return Message.copyPrevious(fields:from:)();
}

uint64_t Message.shouldRetain.getter()
{
  return Message.shouldRetain.getter();
}

uint64_t Message.flattenToAnyDictionary()()
{
  return Message.flattenToAnyDictionary()();
}

uint64_t Message.type.getter()
{
  return Message.type.getter();
}

uint64_t Message.appName.getter()
{
  return Message.appName.getter();
}

uint64_t Message.appName.setter()
{
  return Message.appName.setter();
}

uint64_t Message.content.getter()
{
  return Message.content.getter();
}

uint64_t Message.Metadata.isBroadcast.getter()
{
  return Message.Metadata.isBroadcast.getter();
}

uint64_t Message.Metadata.isBroadcast.setter()
{
  return Message.Metadata.isBroadcast.setter();
}

uint64_t Message.Metadata.isRedundant.getter()
{
  return Message.Metadata.isRedundant.getter();
}

uint64_t Message.Metadata.isRedundant.setter()
{
  return Message.Metadata.isRedundant.setter();
}

uint64_t Message.Metadata.isSessionStarted.setter()
{
  return Message.Metadata.isSessionStarted.setter();
}

uint64_t Message.Metadata.requiresSummaryDecoration.getter()
{
  return Message.Metadata.requiresSummaryDecoration.getter();
}

uint64_t Message.Metadata.requiresSummaryDecoration.setter()
{
  return Message.Metadata.requiresSummaryDecoration.setter();
}

uint64_t type metadata accessor for Message.Metadata()
{
  return type metadata accessor for Message.Metadata();
}

uint64_t Message.init(category:type:content:metadata:)()
{
  return Message.init(category:type:content:metadata:)();
}

uint64_t Message.category.getter()
{
  return Message.category.getter();
}

uint64_t Message.metadata.modify()
{
  return Message.metadata.modify();
}

uint64_t Message.metadata.getter()
{
  return Message.metadata.getter();
}

Swift::String __swiftcall Message.toString()()
{
  uint64_t v0 = Message.toString()();
  result._object = v1;
  result._id countAndFlagsBits = v0;
  return result;
}

uint64_t type metadata accessor for Message()
{
  return type metadata accessor for Message();
}

uint64_t static Constants.machServiceName.getter()
{
  return static Constants.machServiceName.getter();
}

uint64_t static Constants.loadTestWorkerEnv.getter()
{
  return static Constants.loadTestWorkerEnv.getter();
}

uint64_t static Constants.unknownReporterID.getter()
{
  return static Constants.unknownReporterID.getter();
}

uint64_t static Constants.unknown.getter()
{
  return static Constants.unknown.getter();
}

uint64_t static Predicate.evaluate(_:with:)()
{
  return static Predicate.evaluate(_:with:)();
}

uint64_t TraceArgs.init(arg1:arg2:arg3:arg4:)()
{
  return TraceArgs.init(arg1:arg2:arg3:arg4:)();
}

uint64_t type metadata accessor for TraceArgs()
{
  return type metadata accessor for TraceArgs();
}

uint64_t type metadata accessor for TraceCode()
{
  return type metadata accessor for TraceCode();
}

uint64_t static Utilities.processName(for:)()
{
  return static Utilities.processName(for:)();
}

uint64_t static Utilities.generateError(with:code:)()
{
  return static Utilities.generateError(with:code:)();
}

uint64_t static Utilities.positiveReporterID(_:)()
{
  return static Utilities.positiveReporterID(_:)();
}

uint64_t static Utilities.eventTypeDescription(from:)()
{
  return static Utilities.eventTypeDescription(from:)();
}

uint64_t static Utilities.serviceTypeDescription(from:)()
{
  return static Utilities.serviceTypeDescription(from:)();
}

uint64_t static Utilities.eventCategoryDescription(from:)()
{
  return static Utilities.eventCategoryDescription(from:)();
}

uint64_t type metadata accessor for CoreAnalyticsWorker()
{
  return type metadata accessor for CoreAnalyticsWorker();
}

uint64_t type metadata accessor for AirPodWorker()
{
  return type metadata accessor for AirPodWorker();
}

uint64_t static TailspinKeys.all.getter()
{
  return static TailspinKeys.all.getter();
}

uint64_t type metadata accessor for PowerLogWorker()
{
  return type metadata accessor for PowerLogWorker();
}

uint64_t static TailspinWorker.initialize(config:)()
{
  return static TailspinWorker.initialize(config:)();
}

uint64_t type metadata accessor for TailspinWorker()
{
  return type metadata accessor for TailspinWorker();
}

uint64_t type metadata accessor for AdaptiveVolumeWorker()
{
  return type metadata accessor for AdaptiveVolumeWorker();
}

uint64_t type metadata accessor for DriverSnapshotWorker()
{
  return type metadata accessor for DriverSnapshotWorker();
}

uint64_t type metadata accessor for SessionSummaryWorker()
{
  return type metadata accessor for SessionSummaryWorker();
}

uint64_t type metadata accessor for DurationSummaryWorker()
{
  return type metadata accessor for DurationSummaryWorker();
}

uint64_t type metadata accessor for InferenceSummaryWorker()
{
  return type metadata accessor for InferenceSummaryWorker();
}

uint64_t type metadata accessor for SummaryDecoratorWorker()
{
  return type metadata accessor for SummaryDecoratorWorker();
}

uint64_t type metadata accessor for RTCWorker()
{
  return type metadata accessor for RTCWorker();
}

uint64_t type metadata accessor for AudioCaptureLogsWorker()
{
  return type metadata accessor for AudioCaptureLogsWorker();
}

uint64_t type metadata accessor for AudioCaptureNotificationsWorker()
{
  return type metadata accessor for AudioCaptureNotificationsWorker();
}

uint64_t static ABCManager.initialize(config:)()
{
  return static ABCManager.initialize(config:)();
}

uint64_t type metadata accessor for ABCManager()
{
  return type metadata accessor for ABCManager();
}

uint64_t type metadata accessor for TestWorker()
{
  return type metadata accessor for TestWorker();
}

uint64_t type metadata accessor for JsonFileWorker()
{
  return type metadata accessor for JsonFileWorker();
}

uint64_t type metadata accessor for ABCWorker()
{
  return type metadata accessor for ABCWorker();
}

uint64_t OSAllocatedUnfairLock<A>.load<A>(_:)()
{
  return OSAllocatedUnfairLock<A>.load<A>(_:)();
}

uint64_t OSAllocatedUnfairLock<A>.assign<A>(_:newValue:)()
{
  return OSAllocatedUnfairLock<A>.assign<A>(_:newValue:)();
}

uint64_t static Logger.mobileAsset.getter()
{
  return static Logger.mobileAsset.getter();
}

uint64_t static Logger.config.getter()
{
  return static Logger.config.getter();
}

uint64_t static Logger.service.getter()
{
  return static Logger.service.getter();
}

uint64_t static Logger.session.getter()
{
  return static Logger.session.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t static DispatchQoS.default.getter()
{
  return static DispatchQoS.default.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
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

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary<>.subscript.getter()
{
  return Dictionary<>.subscript.getter();
}

uint64_t Dictionary<>.asSimpleType()()
{
  return Dictionary<>.asSimpleType()();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
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

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
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

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t static Double.now()()
{
  return static Double.now()();
}

uint64_t static Double.minutes(_:)()
{
  return static Double.minutes(_:)();
}

uint64_t static Double.seconds(_:)()
{
  return static Double.seconds(_:)();
}

uint64_t Set.Index._asCocoa.modify()
{
  return Set.Index._asCocoa.modify();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
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

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
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

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setExecutionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setExecutionBlock:];
}