uint64_t sub_1000057E8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_100007874(v0, qword_100010F80);
  sub_100005868(v0, (uint64_t)qword_100010F80);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100005868(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL sub_1000058A0(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000058B4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000058FC()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100005928()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *sub_10000596C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void sub_10000599C(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_1000059A8()
{
  unint64_t result = qword_100010B88;
  if (!qword_100010B88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010B88);
  }
  return result;
}

unint64_t sub_100005A80(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000065AC(&qword_100010BE0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (void *)v2;
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
    sub_10000769C(v6, (uint64_t)v15);
    unint64_t result = sub_1000065F0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100007704(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_100005BB0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  if (!a1) {
    return a2(1);
  }
  swift_errorRetain();
  if (qword_100010DE0 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005868(v3, (uint64_t)qword_100010F80);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    v7 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315650;
    sub_100005F54(0xD00000000000002BLL, 0x800000010000AC00, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v6 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v6 + 22) = 2112;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v7 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s: %ld: launch error %@", (uint8_t *)v6, 0x20u);
    sub_1000065AC(&qword_100010B90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  a2(0);
  return swift_errorRelease();
}

void sub_100005E54(uint64_t a1, void *a2, void *a3)
{
  os_log_type_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_100005F20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NFWindowSceneEventLauncher();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005F54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006028(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007814((uint64_t)v12, *a3);
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
      sub_100007814((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000077C4((uint64_t)v12);
  return v7;
}

uint64_t sub_100006028(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000061E4(a5, a6);
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

uint64_t sub_1000061E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000627C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000645C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000645C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000627C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000063F4(v2, 0);
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

void *sub_1000063F4(uint64_t a1, uint64_t a2)
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
  sub_1000065AC(&qword_100010BF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000645C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000065AC(&qword_100010BF0);
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
  BOOL v13 = a4 + 32;
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

uint64_t sub_1000065AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000065F0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100006634(a1, v4);
}

unint64_t sub_100006634(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100007714(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100007770((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_1000066FC(uint64_t a1, uint64_t a2, void *a3, void (**a4)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a4;
  _Block_copy(a4);
  id v7 = (id)SBSCreateOpenApplicationService();
  if (v7)
  {
    int64_t v8 = v7;
    sub_1000065AC(&qword_100010BC8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000A8A0;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    AnyHashable.init<A>(_:)();
    sub_1000065AC(&qword_100010BD0);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_10000A8B0;
    *(void *)(v10 + 32) = a3;
    uint64_t v19 = v10;
    specialized Array._endMutation()();
    uint64_t v11 = v19;
    *(void *)(inited + 96) = sub_1000065AC(&qword_100010BD8);
    *(void *)(inited + 72) = v11;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v12 = a3;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 168) = &type metadata for Bool;
    *(unsigned char *)(inited + 144) = 1;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v13;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 240) = &type metadata for Int;
    *(void *)(inited + 216) = 3;
    sub_100005A80(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(self, "optionsWithDictionary:", isa, v19, v20);

    NSString v16 = String._bridgeToObjectiveC()();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = sub_100007628;
    *(void *)(v17 + 24) = v6;
    v23 = sub_100007678;
    uint64_t v24 = v17;
    uint64_t v19 = (uint64_t)_NSConcreteStackBlock;
    uint64_t v20 = 1107296256;
    v21 = sub_100005E54;
    v22 = &unk_10000C638;
    v18 = _Block_copy(&v19);
    swift_retain();
    swift_release();
    [v8 openApplication:v16 withOptions:v15 completion:v18];
    _Block_release(v18);
    swift_release();
  }
  else
  {
    a4[2](a4, 0);
    swift_release();
  }
}

void sub_100006A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(void, void))
{
  uint64_t v38 = a2;
  uint64_t v9 = type metadata accessor for OSSignpostID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  id v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059A8();
  _Block_copy(a5);
  _Block_copy(a5);
  uint64_t v13 = OS_os_log.init(subsystem:category:)();
  if (!a4)
  {
    uint64_t v21 = type metadata accessor for NFCWindowSceneEvent();
    v39 = &v36;
    uint64_t v15 = *(void *)(v21 - 8);
    __chkstk_darwin();
    v18 = (char *)&v36 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a3 == 1)
    {
      v33 = *(void (**)(char *, void, uint64_t))(v15 + 104);
      uint64_t v37 = v22;
      v33(v18, enum case for NFCWindowSceneEvent.readerDetected(_:), v22);
      static os_signpost_type_t.event.getter();
      static OSSignpostID.exclusive.getter();
      uint64_t v20 = (void *)v13;
    }
    else
    {
      if (a3 != 2)
      {
        a5[2](a5, 0);
        v27 = (void *)v13;
        if (qword_100010DE0 != -1) {
          swift_once();
        }
        uint64_t v35 = type metadata accessor for Logger();
        sub_100005868(v35, (uint64_t)qword_100010F80);
        v29 = Logger.logObject.getter();
        os_log_type_t v30 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v29, v30)) {
          goto LABEL_22;
        }
        uint64_t v31 = swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        *(_DWORD *)uint64_t v31 = 136315394;
        uint64_t v40 = sub_100005F54(0xD000000000000032, 0x800000010000AA60, &v41);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v31 + 12) = 2048;
        uint64_t v32 = 78;
        goto LABEL_21;
      }
      uint64_t v24 = *(void (**)(char *, void, uint64_t))(v15 + 104);
      uint64_t v37 = v22;
      v24(v18, enum case for NFCWindowSceneEvent.presentation(_:), v22);
      static os_signpost_type_t.event.getter();
      static OSSignpostID.exclusive.getter();
      uint64_t v20 = (void *)v13;
    }
    os_signpost(_:dso:log:name:signpostID:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v26 = NFCWindowSceneEvent.asBSAction()();
    goto LABEL_16;
  }
  uint64_t v14 = type metadata accessor for CredentialSessionWindowSceneEvent();
  v39 = &v36;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 == 1)
  {
    v25 = *(void (**)(char *, void, uint64_t))(v15 + 104);
    uint64_t v37 = v16;
    v25(v18, enum case for CredentialSessionWindowSceneEvent.readerDetected(_:), v16);
    static os_signpost_type_t.event.getter();
    static OSSignpostID.exclusive.getter();
    uint64_t v20 = (void *)v13;
    goto LABEL_9;
  }
  if (a3 != 2)
  {
    a5[2](a5, 0);
    v27 = (void *)v13;
    if (qword_100010DE0 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100005868(v28, (uint64_t)qword_100010F80);
    v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v29, v30)) {
      goto LABEL_22;
    }
    uint64_t v31 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315394;
    uint64_t v40 = sub_100005F54(0xD000000000000032, 0x800000010000AA60, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v31 + 12) = 2048;
    uint64_t v32 = 50;
LABEL_21:
    uint64_t v40 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s: %ld: Unexpected event value", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v19 = *(void (**)(char *, void, uint64_t))(v15 + 104);
  uint64_t v37 = v16;
  v19(v18, enum case for CredentialSessionWindowSceneEvent.presentation(_:), v16);
  static os_signpost_type_t.event.getter();
  static OSSignpostID.exclusive.getter();
  uint64_t v20 = (void *)v13;
LABEL_9:
  os_signpost(_:dso:log:name:signpostID:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v26 = CredentialSessionWindowSceneEvent.asBSAction()();
LABEL_16:
  v34 = (void *)v26;
  _Block_copy(a5);
  sub_1000066FC(a1, v38, v34, a5);
  _Block_release(a5);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v37);
LABEL_23:
  _Block_release(a5);
  _Block_release(a5);
}

uint64_t type metadata accessor for NFWindowSceneEventLauncher()
{
  return self;
}

unint64_t sub_10000758C()
{
  unint64_t result = qword_100010B98;
  if (!qword_100010B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B98);
  }
  return result;
}

ValueMetadata *type metadata accessor for NFWindowSceneEventLauncherDomain()
{
  return &type metadata for NFWindowSceneEventLauncherDomain;
}

uint64_t sub_1000075F0()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007628(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100007640()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007678(uint64_t a1, uint64_t a2)
{
  return sub_100005BB0(a2, *(uint64_t (**)(uint64_t))(v2 + 16));
}

uint64_t sub_100007684(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007694()
{
  return swift_release();
}

uint64_t sub_10000769C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000065AC(&qword_100010BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100007704(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100007714(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007770(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000077C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007814(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100007874(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100007A40(id a1)
{
  qword_100010F70 = objc_alloc_init(NFServiceCoreNFCUI);
  _objc_release_x1();
}

void sub_10000801C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,id a30,char a31)
{
}

uint64_t sub_100008080(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008090(uint64_t a1)
{
}

void sub_100008098(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    Name = sel_getName(*(SEL *)(a1 + 64));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i Invalidation handler received with error %@ using context %@", v11, ClassName, Name, 88, v3, *(void *)(a1 + 32));
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v16 = sel_getName(*(SEL *)(a1 + 64));
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67110402;
    int v26 = v14;
    __int16 v27 = 2082;
    uint64_t v28 = v15;
    __int16 v29 = 2082;
    os_log_type_t v30 = v16;
    __int16 v31 = 1024;
    int v32 = 88;
    __int16 v33 = 2112;
    id v34 = v3;
    __int16 v35 = 2112;
    uint64_t v36 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidation handler received with error %@ using context %@", buf, 0x36u);
  }

  if (v3 && [v3 code] == (id)-6723)
  {
    v18 = [v3 debugDescription];
    id v19 = [v18 containsString:@"User dismissed"];
  }
  else
  {
    id v19 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16));
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v21 = *(void **)(v20 + 8);
  *(void *)(v20 + 8) = 0;

  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 40) = 0;
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 48) = 0;
  uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v23 = *(void **)(v22 + 24);
  *(void *)(v22 + 24) = 0;

  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 32) = 0;
  *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 20) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16));
  id v24 = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained sendInvalidationNotification:v24 error:v3 userCanceled:v19];
}

void sub_100008378(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setInvalidationHandler:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100009964(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000997C(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = *(void (**)(uint64_t, void, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0, 0);
  }
  else
  {
    NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
    CFStringRef v8 = @"Launch error";
    id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    uint64_t v6 = +[NSError errorWithDomain:@"NFUIService" code:3 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v6);
  }
}

uint64_t NFCWindowSceneEvent.asBSAction()()
{
  return NFCWindowSceneEvent.asBSAction()();
}

uint64_t type metadata accessor for NFCWindowSceneEvent()
{
  return type metadata accessor for NFCWindowSceneEvent();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
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

uint64_t CredentialSessionWindowSceneEvent.asBSAction()()
{
  return CredentialSessionWindowSceneEvent.asBSAction()();
}

uint64_t type metadata accessor for CredentialSessionWindowSceneEvent()
{
  return type metadata accessor for CredentialSessionWindowSceneEvent();
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

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t NFLogGetLogger()
{
  return _NFLogGetLogger();
}

uint64_t NFSharedLogGetLogger()
{
  return _NFSharedLogGetLogger();
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

BOOL class_isMetaClass(Class cls)
{
  return _class_isMetaClass(cls);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
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

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

id objc_msgSend_NF_numberForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NF_numberForKey:");
}

id objc_msgSend_NF_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NF_stringForKey:");
}

id objc_msgSend_activate_context_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate:context:withCompletion:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _[a1 instance];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_launchBundleWithIdentifier_reason_domain_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchBundleWithIdentifier:reason:domain:completion:");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_nfcTagScannedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nfcTagScannedCount:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_sendInvalidationNotification_error_userCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendInvalidationNotification:error:userCanceled:");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_serviceNotificationReceived_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceNotificationReceived:error:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
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

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setOperationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationMode:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setUIMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUIMode:");
}

id objc_msgSend_setUIOperationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUIOperationMode:");
}

id objc_msgSend_tagCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tagCount:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}