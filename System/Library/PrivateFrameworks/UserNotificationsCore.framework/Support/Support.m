uint64_t sub_100001F60()
{
  return __set_user_dir_suffix("com.apple.usernotificationsd");
}

void sub_10000209C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000020B4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10000CAE8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000021F8;
    v3[4] = &unk_1000085E8;
    v3[5] = v3;
    long long v4 = off_1000085D0;
    uint64_t v5 = 0;
    qword_10000CAE8 = _sl_dlopen();
    if (!qword_10000CAE8)
    {
      abort_report_np();
LABEL_8:
      sub_100005AC8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("BBObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10000CAE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000021F8()
{
  uint64_t result = _sl_dlopen();
  qword_10000CAE8 = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v56 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v52);
  v51 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v55 = v7;
  __chkstk_darwin(v7);
  v53 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  __chkstk_darwin(v9);
  v50 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v46 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100001F60();
  nullsub_1(v19);
  UUID.init()();
  uint64_t v20 = UUID.uuidString.getter();
  unint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v24 = sub_10000365C(5, v20, v22, v23);
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  swift_bridgeObjectRelease();
  qword_10000CB70 = v24;
  *(void *)algn_10000CB78 = v26;
  qword_10000CB80 = v28;
  unk_10000CB88 = v30;
  static Logger.daemon.getter();
  v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v44[2] = v34;
    *(_DWORD *)v33 = 136315138;
    aBlock[0] = v34;
    v44[1] = v33 + 4;
    uint64_t v45 = v3;
    swift_bridgeObjectRetain();
    uint64_t v35 = static String._fromSubstring(_:)();
    unint64_t v37 = v36;
    swift_bridgeObjectRelease();
    uint64_t v57 = sub_100003004(v35, v37, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v3 = v45;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Starting usernotificationsd %s", v33, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v46 + 8))(v13, v47);
  sub_100003784(0, (unint64_t *)&qword_10000CA50);
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v50, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v49);
  v38 = v53;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_100003888(&qword_10000C8E8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000036F8((uint64_t *)&unk_10000CA60);
  sub_1000038D0((unint64_t *)&qword_10000C8F0, (uint64_t *)&unk_10000CA60);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  qword_10000CB90 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v39 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(15, v39);
  sub_100003784(0, &qword_10000C8F8);
  qword_10000CB98 = static OS_dispatch_source.makeSignalSource(signal:queue:)();
  swift_getObjectType();
  aBlock[4] = (uint64_t)sub_1000029B0;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100002BC0;
  aBlock[3] = (uint64_t)&unk_1000086D8;
  v40 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  v41 = v56;
  sub_100002C04();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v40);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v41, v3);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v55);
  swift_getObjectType();
  OS_dispatch_source.resume()();
  qword_10000CBA0 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceManager()) init];
  sub_100002CCC();
  CFRunLoopRun();
  return 0;
}

void sub_1000029B0()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v12 = v0;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v14 = v11;
    *(_DWORD *)uint64_t v6 = 136315138;
    v10[1] = v6 + 4;
    swift_bridgeObjectRetain();
    uint64_t v7 = static String._fromSubstring(_:)();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_100003004(v7, v9, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Termination complete %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v12);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  exit(0);
}

uint64_t sub_100002BC0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100002C04()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_100002CCC()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ServiceManager.activate()();
  if (UNCOneness())
  {
    id v4 = [self sharedInstance];
    if (v4)
    {
      os_log_type_t v5 = v4;
      unsigned int v6 = [v4 deviceClass];

      if (!v6)
      {
        uint64_t v7 = (void *)qword_10000CBA0;
        id v8 = objc_allocWithZone((Class)type metadata accessor for BulletinObserver());
        sub_100003C24(v7);
        uint64_t v10 = (uint64_t)v9;
        id v11 = v9;
        static Logger.daemon.getter();
        id v12 = v11;
        uint64_t v13 = Logger.logObject.getter();
        os_log_type_t v14 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = (uint8_t *)swift_slowAlloc();
          uint64_t v20 = swift_slowAlloc();
          uint64_t v21 = v10;
          uint64_t v22 = v20;
          uint64_t v19 = v15;
          *(_DWORD *)uint64_t v15 = 136446210;
          v18 = v15 + 4;
          id v12 = v12;
          sub_1000036F8(&qword_10000C908);
          uint64_t v16 = String.init<A>(describing:)();
          uint64_t v21 = sub_100003004(v16, v17, &v22);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "main: %{public}s", v19, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100002F74(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100002F7C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100002F90(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100002FC0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100002FD4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100002FE8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100002FF4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100003004(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000030D8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100003828((uint64_t)v12, *a3);
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
      sub_100003828((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000037D8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000030D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100003294(a5, a6);
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

uint64_t sub_100003294(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000332C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000350C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000350C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000332C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000034A4(v2, 0);
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

void *sub_1000034A4(uint64_t a1, uint64_t a2)
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
  sub_1000036F8(&qword_10000C900);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000350C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000036F8(&qword_10000C900);
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

uint64_t sub_10000365C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = String.index(_:offsetBy:limitedBy:)();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return String.subscript.getter(a1, a2, a3, a4);
}

uint64_t sub_1000036F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000373C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003784(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000037C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000037D0()
{
  return swift_release();
}

uint64_t sub_1000037D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003828(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003888(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000038D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000373C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_10000C928)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C928);
    }
  }
}

id sub_100003978()
{
  return sub_1000039C0(&OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___queue, 0xD00000000000002DLL, 0x8000000100006BA0);
}

id sub_10000399C()
{
  return sub_1000039C0(&OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___observerQueue, 0xD000000000000035, 0x8000000100006B60);
}

id sub_1000039C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3;
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  size_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  uint64_t v12 = *a1;
  uint64_t v13 = *(void **)(v3 + v12);
  if (v13)
  {
    id v14 = *(id *)(v3 + v12);
  }
  else
  {
    v19[2] = sub_100005764();
    static DispatchQoS.unspecified.getter();
    v19[3] = &_swiftEmptyArrayStorage;
    sub_100005A38(&qword_10000C8E8, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    v19[1] = a2;
    sub_1000036F8((uint64_t *)&unk_10000CA60);
    v19[0] = a3;
    sub_1000057A4();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v8);
    uint64_t v15 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    uint64_t v16 = *(void **)(v3 + v12);
    *(void *)(v7 + v12) = v15;
    id v14 = v15;

    uint64_t v13 = 0;
  }
  id v17 = v13;
  return v14;
}

void sub_100003C24(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_observer;
  *(void *)&v1[OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_observer] = 0;
  uint64_t v4 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_properties;
  *(void *)&v1[OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_properties] = 0;
  uint64_t v5 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___queue;
  *(void *)&v1[OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___queue] = 0;
  uint64_t v6 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___observerQueue;
  *(void *)&v1[OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___observerQueue] = 0;
  uint64_t v7 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_lock;
  sub_1000036F8(&qword_10000CA70);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 16) = 0;
  *(void *)&v1[v7] = v8;
  type metadata accessor for AlertCoordinatorBulletinObserver();
  uint64_t v9 = v1;
  id v10 = a1;
  uint64_t v11 = AlertCoordinatorBulletinObserver.__allocating_init(serviceManager:)();
  if (v11)
  {
    *(void *)&v9[OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_core] = v11;
    swift_retain();
    *(void *)&v1[v4] = ServiceManager.remoteNotificationsProperties.getter();

    swift_release();
    uint64_t v12 = (objc_class *)type metadata accessor for BulletinObserver();
    v22.receiver = v9;
    v22.super_class = v12;
    id v13 = objc_msgSendSuper2(&v22, "init");
    type metadata accessor for StateCaptureService();
    id v14 = v13;
    static StateCaptureService.shared.getter();
    v21[3] = v12;
    v21[4] = sub_100005A38(&qword_10000CA78, v15, (void (*)(uint64_t))type metadata accessor for BulletinObserver);
    v21[0] = v14;
    uint64_t v16 = (char *)v14;
    dispatch thunk of StateCaptureService.addItem(_:identifier:)();
    swift_release();
    sub_1000037D8((uint64_t)v21);
    sub_100003F20();
    if (*(void *)&v16[OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_properties])
    {
      swift_retain();
      dispatch thunk of RemoteNotificationsProperties.isActive.getter();
      uint64_t v17 = swift_release();
      uint64_t v18 = __chkstk_darwin(v17);
      __chkstk_darwin(v18);
      uint64_t v20 = v19 + 4;
      os_unfair_lock_lock(v19 + 4);
      sub_100005AB0();
      os_unfair_lock_unlock(v20);
      swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {

    swift_release();
    swift_release();
    type metadata accessor for BulletinObserver();
    swift_deallocPartialClassInstance();
  }
}

void sub_100003F20()
{
  withObservationTracking<A>(_:onChange:)();
  uint64_t v1 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_properties;
  if (*(void *)(v0 + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_properties))
  {
    swift_retain();
    char v2 = dispatch thunk of RemoteNotificationsProperties.isCapable.getter();
    uint64_t v3 = swift_release();
    if ((v2 & 1) == 0) {
      goto LABEL_6;
    }
    if (*(void *)(v0 + v1))
    {
      swift_retain();
      char v4 = dispatch thunk of RemoteNotificationsProperties.isEnabled.getter();
      uint64_t v3 = swift_release();
      if (v4)
      {
        uint64_t v5 = __chkstk_darwin(v3);
        __chkstk_darwin(v5);
        uint64_t v7 = v6 + 4;
        os_unfair_lock_lock(v6 + 4);
        sub_100005AB0();
LABEL_7:
        os_unfair_lock_unlock(v7);
        return;
      }
LABEL_6:
      uint64_t v8 = __chkstk_darwin(v3);
      __chkstk_darwin(v8);
      uint64_t v7 = v9 + 4;
      os_unfair_lock_lock(v9 + 4);
      sub_1000052D8();
      goto LABEL_7;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1000040EC(uint64_t result)
{
  if (*(void *)(result + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_properties))
  {
    swift_retain();
    dispatch thunk of RemoteNotificationsProperties.isActive.getter();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000413C()
{
  sub_1000036F8(&qword_10000CA20);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v3;
  sub_100004310((uint64_t)v1, (uint64_t)&unk_10000CA30, (uint64_t)v4);
  return swift_release();
}

uint64_t sub_100004254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return _swift_task_switch(sub_100004274, 0, 0);
}

uint64_t sub_100004274()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    sub_100003F20();
  }
  **(unsigned char **)(v0 + 40) = Strong == 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100004310(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100005614(a1);
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
  sub_1000036F8(&qword_10000CA48);
  return swift_task_create();
}

void sub_1000044BC(uint64_t a1)
{
  uint64_t v1 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_observer;
  if (!*(void *)(a1 + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_observer))
  {
    if (qword_10000C8E0 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_10000531C(v3, (uint64_t)qword_10000C930);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting observer...", v6, 2u);
      swift_slowDealloc();
    }

    id v7 = sub_100003978();
    id v8 = sub_10000399C();
    id v9 = [objc_allocWithZone((Class)NSProcessInfo) init];
    NSString v10 = [v9 processName];

    if (!v10)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v10 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    id v11 = [self gatewayWithQueue:v7 calloutQueue:v8 name:v10 priority:2];

    uint64_t v12 = *(void **)(a1 + v1);
    *(void *)(a1 + v1) = v11;

    id v13 = *(void **)(a1 + v1);
    if (v13)
    {
      [v13 setDelegate:a1];
      id v14 = *(void **)(a1 + v1);
      if (v14) {
        [v14 setObserverFeed:0x4000];
      }
    }
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Observer started.", v17, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000471C(uint64_t a1)
{
  uint64_t v1 = OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_observer;
  if (*(void *)(a1 + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_observer))
  {
    if (qword_10000C8E0 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_10000531C(v3, (uint64_t)qword_10000C930);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Stopping observer...", v6, 2u);
      swift_slowDealloc();
    }

    [*(id *)(a1 + v1) invalidate];
    id v7 = *(void **)(a1 + v1);
    *(void *)(a1 + v1) = 0;

    id v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      NSString v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Observer stopped.", v10, 2u);
      swift_slowDealloc();
    }
  }
}

id sub_1000049C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BulletinObserver();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BulletinObserver()
{
  return self;
}

void sub_100004AAC()
{
  objc_super v2 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_lock) + 16);
  if (os_unfair_lock_trylock(v2))
  {
    sub_100005174(&v8);
    if (v1) {
      goto LABEL_8;
    }
    os_unfair_lock_unlock(v2);
    int v3 = v8;
  }
  else
  {
    int v3 = 2;
  }
  sub_1000036F8(&qword_10000CA00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100006470;
  *(void *)(inited + 32) = 0x657669746361;
  *(void *)(inited + 40) = 0xE600000000000000;
  BOOL v5 = *(void *)(v0 + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_observer) != 0;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 48) = v5;
  *(void *)(inited + 88) = 0xD000000000000011;
  *(void *)(inited + 96) = 0x8000000100006B10;
  if (*(void *)(v0 + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver_properties))
  {
    uint64_t v6 = inited;
    swift_retain();
    char v7 = dispatch thunk of RemoteNotificationsProperties.isActive.getter();
    swift_release();
    *(void *)(v6 + 128) = &type metadata for Bool;
    *(void *)(v6 + 136) = &protocol witness table for Bool;
    *(unsigned char *)(v6 + 104) = v7 & 1;
    *(void *)(v6 + 144) = 0x64656B636F6CLL;
    *(void *)(v6 + 152) = 0xE600000000000000;
    *(void *)(v6 + 184) = &type metadata for Bool;
    *(void *)(v6 + 192) = &protocol witness table for Bool;
    *(unsigned char *)(v6 + 160) = v3 == 2;
    sub_100004C30(v6);
    return;
  }
  __break(1u);
LABEL_8:
  os_unfair_lock_unlock(v2);
  __break(1u);
}

unint64_t sub_100004C30(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000036F8(&qword_10000CA08);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  int v3 = (void *)v2;
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
    sub_100005180(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100004E24(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_1000051E8((uint64_t)&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
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

unint64_t sub_100004D60()
{
  return 0xD000000000000022;
}

void sub_100004D7C()
{
}

uint64_t sub_100004DA0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005354(v0, qword_10000C930);
  sub_10000531C(v0, (uint64_t)qword_10000C930);
  return Logger.init(subsystem:category:)();
}

unint64_t sub_100004E24(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100004E9C(a1, a2, v4);
}

unint64_t sub_100004E9C(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100004F80(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100005060;
  return v5(v2 + 32);
}

uint64_t sub_100005060()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

void sub_100005174(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100005180(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000036F8(&qword_10000CA10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000051E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000036F8(&qword_10000CA18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005250()
{
  return sub_1000040EC(*(void *)(v0 + 16));
}

uint64_t (*sub_100005258())()
{
  uint64_t v1 = *(void **)(v0 + 16);
  *(void *)(swift_allocObject() + 16) = v1;
  id v2 = v1;
  return sub_1000053F0;
}

void sub_1000052BC()
{
  sub_10000471C(*(void *)(v0 + 16));
}

uint64_t sub_1000052D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_100005300()
{
  sub_1000044BC(*(void *)(v0 + 16));
}

uint64_t sub_10000531C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005354(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000053B8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000053F0()
{
  return sub_10000413C();
}

uint64_t sub_1000053F8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005430()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005470(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005520;
  v5[5] = a1;
  v5[6] = v4;
  return _swift_task_switch(sub_100004274, 0, 0);
}

uint64_t sub_100005520()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005614(uint64_t a1)
{
  uint64_t v2 = sub_1000036F8(&qword_10000CA20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005674()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000056AC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005520;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000CA38 + dword_10000CA38);
  return v6(a1, v4);
}

unint64_t sub_100005764()
{
  unint64_t result = qword_10000CA50;
  if (!qword_10000CA50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CA50);
  }
  return result;
}

unint64_t sub_1000057A4()
{
  unint64_t result = qword_10000C8F0;
  if (!qword_10000C8F0)
  {
    sub_10000373C((uint64_t *)&unk_10000CA60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C8F0);
  }
  return result;
}

id sub_100005800(void *a1, int a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AlertCoordinatorContext();
  uint64_t v7 = *(void *)(v6 - 8);
  id result = (id)__chkstk_darwin(v6);
  char v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_6;
  }
  int v15 = a2;
  uint64_t v16 = a3;
  [a1 interruptionLevel];
  id result = [a1 section];
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  BOOL v11 = result;
  uint64_t v14 = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id result = [a1 publisherBulletinID];
  if (result)
  {
    uint64_t v12 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    AlertCoordinatorContext.init(sourceBundleIdentifier:notificationIdentifier:interruptionLevel:shouldPlayLightsAndSirens:)();
    swift_retain();
    dispatch thunk of AlertCoordinatorBulletinObserver.add(_:withReply:)();
    swift_release();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v14);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1000059D8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000059E8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005A20(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100005A38(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_100005A80()
{
}

void sub_100005A98()
{
}

uint64_t sub_100005AB0()
{
  return sub_1000052D8();
}

void sub_100005AC8()
{
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t withObservationTracking<A>(_:onChange:)()
{
  return withObservationTracking<A>(_:onChange:)();
}

uint64_t dispatch thunk of RemoteNotificationsProperties.isActive.getter()
{
  return dispatch thunk of RemoteNotificationsProperties.isActive.getter();
}

uint64_t dispatch thunk of RemoteNotificationsProperties.isCapable.getter()
{
  return dispatch thunk of RemoteNotificationsProperties.isCapable.getter();
}

uint64_t dispatch thunk of RemoteNotificationsProperties.isEnabled.getter()
{
  return dispatch thunk of RemoteNotificationsProperties.isEnabled.getter();
}

uint64_t ServiceManager.remoteNotificationsProperties.getter()
{
  return ServiceManager.remoteNotificationsProperties.getter();
}

Swift::Void __swiftcall ServiceManager.activate()()
{
}

uint64_t type metadata accessor for ServiceManager()
{
  return type metadata accessor for ServiceManager();
}

uint64_t static StateCaptureService.shared.getter()
{
  return static StateCaptureService.shared.getter();
}

uint64_t dispatch thunk of StateCaptureService.addItem(_:identifier:)()
{
  return dispatch thunk of StateCaptureService.addItem(_:identifier:)();
}

uint64_t type metadata accessor for StateCaptureService()
{
  return type metadata accessor for StateCaptureService();
}

uint64_t AlertCoordinatorContext.init(sourceBundleIdentifier:notificationIdentifier:interruptionLevel:shouldPlayLightsAndSirens:)()
{
  return AlertCoordinatorContext.init(sourceBundleIdentifier:notificationIdentifier:interruptionLevel:shouldPlayLightsAndSirens:)();
}

uint64_t type metadata accessor for AlertCoordinatorContext()
{
  return type metadata accessor for AlertCoordinatorContext();
}

uint64_t AlertCoordinatorBulletinObserver.__allocating_init(serviceManager:)()
{
  return AlertCoordinatorBulletinObserver.__allocating_init(serviceManager:)();
}

uint64_t dispatch thunk of AlertCoordinatorBulletinObserver.add(_:withReply:)()
{
  return dispatch thunk of AlertCoordinatorBulletinObserver.add(_:withReply:)();
}

uint64_t type metadata accessor for AlertCoordinatorBulletinObserver()
{
  return type metadata accessor for AlertCoordinatorBulletinObserver();
}

uint64_t static Logger.daemon.getter()
{
  return static Logger.daemon.getter();
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

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
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

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
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

Swift::Void __swiftcall OS_dispatch_source.resume()()
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

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

void CFRunLoopRun(void)
{
}

uint64_t UNCOneness()
{
  return _UNCOneness();
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

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void exit(int a1)
{
}

void free(void *a1)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return _os_unfair_lock_trylock(lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

id objc_msgSend_gatewayWithQueue_calloutQueue_name_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gatewayWithQueue:calloutQueue:name:priority:");
}