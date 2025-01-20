int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  __objc2_prot_list *v22;
  void *v23;
  __objc2_prot_list *v24;
  __objc2_prot_list *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  void *v33;
  void *v34;
  void *v35;
  void (__cdecl *v36)(int);
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  char *v50;
  char *v51;
  void v52[2];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t aBlock;
  uint64_t v65;
  uint64_t (*v66)();
  void *v67;
  uint64_t (*v68)();
  uint64_t v69;

  type metadata accessor for DispatchWorkItemFlags();
  sub_100007588();
  v61 = v4;
  v62 = v3;
  __chkstk_darwin(v3);
  v59 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = type metadata accessor for DispatchQoS();
  sub_100007588();
  v58 = v6;
  __chkstk_darwin(v7);
  v57 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OSSignpostID();
  sub_100007588();
  v53 = v10;
  v54 = v9;
  __chkstk_darwin(v9);
  v52[0] = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100025640 != -1) {
    swift_once();
  }
  v12 = type metadata accessor for Logger();
  v52[1] = sub_100006AA4(v12, (uint64_t)qword_1000262B8);
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "starting siriinferenced...", v15, 2u);
    sub_1000075A4();
  }

  v16 = type metadata accessor for Signpost();
  sub_100006ADC(v16, qword_100026220);
  v55 = v16;
  v17 = sub_100006AA4(v16, (uint64_t)qword_100026220);
  if (qword_100025628 != -1) {
    swift_once();
  }
  v18 = (id)qword_100026280;
  v56 = v17;
  sub_10000E988((uint64_t)"StartDaemon", 11, 2, v18, v17);
  sub_10000CCE0();
  if (qword_100025630 != -1) {
    swift_once();
  }
  sub_100006AA4(v12, (uint64_t)qword_100026288);
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    aBlock = swift_slowAlloc();
    *(_DWORD *)v21 = 136315138;
    v63 = sub_100006C2C(0xD000000000000022, 0x800000010001B5F0, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "starting %s XPC listener", v21, 0xCu);
    swift_arrayDestroy();
    sub_1000075A4();
    sub_1000075A4();
  }

  sub_100006BE8(0, &qword_100025650);
  qword_100026238 = (uint64_t)sub_1000067E4();
  v22 = &OS_xpc_object__prots;
  qword_100026240 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for SiriRemembersServiceDelegate()) init];
  v23 = (void *)qword_100026238;
  v24 = &OS_xpc_object__prots;
  [(id)qword_100026238 setDelegate:qword_100026240];
  v25 = &OS_xpc_object__prots;
  [v23 resume];
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    aBlock = swift_slowAlloc();
    *(_DWORD *)v28 = 136315138;
    v63 = sub_100006C2C(0xD000000000000018, 0x800000010001B5D0, &aBlock);
    v25 = &OS_xpc_object__prots;
    v24 = &OS_xpc_object__prots;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "starting %s XPC listener", v28, 0xCu);
    swift_arrayDestroy();
    v22 = &OS_xpc_object__prots;
    sub_1000075A4();
    sub_1000075A4();
  }

  qword_100026248 = (uint64_t)sub_1000067E4();
  qword_100026250 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for SiriInferenceServiceDelegate()) (SEL)v22[459].count];
  v29 = (void *)qword_100026248;
  objc_msgSend((id)qword_100026248, (SEL)v24[460].count, qword_100026250);
  [v29 (SEL)v25[461].count];
  v30 = Logger.logObject.getter();
  v31 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    aBlock = swift_slowAlloc();
    *(_DWORD *)v32 = 136315138;
    v63 = sub_100006C2C(0xD000000000000020, 0x800000010001B620, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "starting %s XPC listener", v32, 0xCu);
    swift_arrayDestroy();
    sub_1000075A4();
    sub_1000075A4();
  }

  qword_100026258 = (uint64_t)sub_1000067E4();
  qword_100026260 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for SiriSignalsServiceDelegate()) (SEL)v22[459].count];
  v33 = (void *)qword_100026258;
  objc_msgSend((id)qword_100026258, (SEL)v24[460].count, qword_100026260);
  [v33 (SEL)v25[461].count];
  type metadata accessor for BackgroundQueue();
  v34 = (void *)static BackgroundQueue.shared.getter();
  v68 = sub_100006858;
  v69 = 0;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_10000685C;
  v67 = &unk_100020F08;
  v35 = _Block_copy(&aBlock);
  [v34 addOperationWithBlock:v35];
  _Block_release(v35);

  v36 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(15, v36);
  v37 = Logger.logObject.getter();
  v38 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "starting BackgroundManager", v39, 2u);
    sub_1000075A4();
  }

  v40 = (id)qword_100026280;
  v41 = v52[0];
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  sub_100006B58(&qword_100025658);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_10001B0D0;
  v43 = StaticString.description.getter();
  v45 = v44;
  *(void *)(v42 + 56) = &type metadata for String;
  *(void *)(v42 + 64) = sub_100006B9C();
  *(void *)(v42 + 32) = v43;
  *(void *)(v42 + 40) = v45;
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  swift_bridgeObjectRelease();
  type metadata accessor for BackgroundManager();
  swift_allocObject();
  v46 = sub_1000096B4();
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v41, v54);

  qword_100026268 = (uint64_t)v46;
  sub_100006BE8(0, &qword_100025668);
  sub_100006BE8(0, (unint64_t *)&qword_100025670);
  v47 = (void *)static OS_dispatch_queue.main.getter();
  v48 = static OS_dispatch_source.makeSignalSource(signal:queue:)();

  qword_100026270 = v48;
  swift_getObjectType();
  v68 = sub_100006860;
  v69 = 0;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_10000685C;
  v67 = &unk_100020F30;
  v49 = _Block_copy(&aBlock);
  v50 = v57;
  static DispatchQoS.unspecified.getter();
  v51 = v59;
  sub_100006A24();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v49);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v51, v62);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v50, v60);
  swift_getObjectType();
  OS_dispatch_source.activate()();
  sub_10000CF28(qword_100026268);
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  dispatch_main();
}

id sub_1000067E4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithMachServiceName:v1];

  return v2;
}

uint64_t sub_100006860()
{
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006AA4(v0, (uint64_t)qword_1000262B8);
  NSString v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "got SIGTERM signal", v3, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for BackgroundQueue();
  v4 = (void *)static BackgroundQueue.shared.getter();
  [v4 cancelAllOperations];

  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "cancelled BackgroundQueue ops, calling xpc_transaction_exit_clean", v7, 2u);
    swift_slowDealloc();
  }

  return _xpc_transaction_exit_clean();
}

uint64_t sub_1000069E0(uint64_t a1)
{
  NSString v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100006A24()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100006AA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006ADC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006B40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006B50()
{
  return swift_release();
}

uint64_t sub_100006B58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006B9C()
{
  unint64_t result = qword_100025660;
  if (!qword_100025660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025660);
  }
  return result;
}

uint64_t sub_100006BE8(uint64_t a1, unint64_t *a2)
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

uint64_t variable initialization expression of SiriUIBiomeMonitor.bpsSink()
{
  return 0;
}

uint64_t sub_100006C2C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006D00(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006EA8((uint64_t)v12, *a3);
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
      sub_100006EA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006E58((uint64_t)v12);
  return v7;
}

uint64_t sub_100006D00(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100006F04((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = (uint64_t)sub_100006FDC(a5, a6);
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

uint64_t sub_100006E58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100006F04(char *__src, size_t __n, char *__dst)
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

void *sub_100006FDC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100007074(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007250(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007250((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100007074(uint64_t a1, unint64_t a2)
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
  unint64_t v3 = sub_1000071E8(v2, 0);
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

void *sub_1000071E8(uint64_t a1, uint64_t a2)
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
  sub_100006B58(&qword_100025678);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100007250(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100006B58(&qword_100025678);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100007400(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100007328(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100007328(char *__src, size_t __n, char *__dst)
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

char *sub_100007400(char *__src, size_t __len, char *__dst)
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

unint64_t sub_100007494()
{
  unint64_t result = qword_1000256E0;
  if (!qword_1000256E0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000256E0);
  }
  return result;
}

unint64_t sub_1000074E4()
{
  unint64_t result = qword_1000256F0;
  if (!qword_1000256F0)
  {
    sub_100007538(&qword_1000256E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000256F0);
  }
  return result;
}

uint64_t sub_100007538(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000075A4()
{
  return swift_slowDealloc();
}

uint64_t sub_1000075BC(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  *(void *)(v2 + 16) = 0;
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100006AA4(v6, (uint64_t)qword_100026288);
  int64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    int64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Initializing BiomeMonitorAppIntent", v9, 2u);
    swift_slowDealloc();
  }

  *(void *)(v3 + 24) = a2;
  swift_retain();
  sub_1000076FC(a1);
  uint64_t v11 = v10;

  swift_release();
  v12 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v11;

  return v3;
}

void sub_1000076FC(void *a1)
{
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_100007588();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_10000969C();
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  sub_10000968C();
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  sub_10000968C();
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100006AA4(v8, (uint64_t)qword_100026288);
  int64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Registering AppIntentBiomeMonitor", v11, 2u);
    swift_slowDealloc();
  }

  sub_100009310();
  static DispatchQoS.unspecified.getter();
  v19 = &_swiftEmptyArrayStorage;
  sub_100009350();
  sub_100006B58((uint64_t *)&unk_100025CF0);
  sub_1000093A0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v1, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  v12 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  id v13 = objc_allocWithZone((Class)BMBiomeScheduler);
  id v14 = sub_10001975C(0xD000000000000022, 0x800000010001BA00, v12);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  sub_100007A00((uint64_t)v14, a1, v15, &v19);
  if (v18)
  {
    __break(1u);
  }
  else
  {
    swift_release();
  }
}

void sub_100007A00(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, NSObject **a4@<X8>)
{
  id v8 = [self intent];
  id v9 = [v8 publisher];

  id v10 = [v9 subscribeOn:a1];
  v28 = sub_100007DB8;
  uint64_t v29 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256;
  v26 = sub_100018648;
  v27 = &unk_100020FD0;
  uint64_t v11 = _Block_copy(&aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  v28 = sub_10000945C;
  uint64_t v29 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256;
  v26 = sub_10000D730;
  v27 = &unk_100021020;
  id v13 = _Block_copy(&aBlock);
  id v14 = a2;
  swift_retain();
  swift_release();
  id v15 = [v10 sinkWithCompletion:v11 receiveInput:v13];
  _Block_release(v13);
  _Block_release(v11);

  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  sub_100006AA4(v16, (uint64_t)qword_100026288);
  swift_retain();
  v17 = v15;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    v21 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 138412546;
    v23 = v17;
    v22 = (void **)[v17 status];
    aBlock = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v21 = v22;

    *(_WORD *)(v20 + 12) = 2048;
    swift_beginAccess();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "AppIntentBiomeMonitor status=%@ fetchedEvents=%ld", (uint8_t *)v20, 0x16u);
    sub_100006B58(&qword_100025838);
    swift_arrayDestroy();
    v17 = v23;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
    uint64_t v18 = v17;
  }

  *a4 = v17;
}

void sub_100007DB8(void *a1)
{
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_100026288);
  id v8 = a1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BiomeMonitorAppIntent is done: %@", v5, 0xCu);
    sub_100006B58(&qword_100025838);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_100007F84(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a3 + 16);
  sub_10000808C(a1, a2, v5);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  aBlock[4] = sub_10000949C;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000685C;
  aBlock[3] = &unk_100021070;
  id v8 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  [a2 addOperationWithBlock:v8];
  _Block_release(v8);
}

void sub_10000808C(uint64_t a1, void *a2, void *a3)
{
  v61 = a3;
  uint64_t v5 = type metadata accessor for Date();
  __chkstk_darwin(v5 - 8);
  v60 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006B58(&qword_100025848);
  __chkstk_darwin(v7);
  id v9 = (uint64_t *)((char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_100006B58(&qword_100025850);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  id v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v63 = (uint64_t)&v56 - v14;
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v62 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v59 = (char *)&v56 - v19;
  swift_unknownObjectRetain();
  self;
  uint64_t v20 = swift_dynamicCastObjCClass();
  p_ivars = &AsyncBackgroundManager.BackgroundQueue.ivars;
  if (!v20)
  {
    swift_unknownObjectRelease();
    uint64_t v28 = a1;
    if (qword_100025630 != -1) {
      swift_once();
    }
    uint64_t v30 = type metadata accessor for Logger();
    sub_100006AA4(v30, (uint64_t)qword_100026288);
    v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      v65[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136446722;
      uint64_t v66 = sub_100006C2C(0xD00000000000005ELL, 0x800000010001BA60, v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v33 + 12) = 2082;
      uint64_t v66 = sub_100006C2C(0xD000000000000010, 0x800000010001BAC0, v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v33 + 22) = 2050;
      uint64_t v66 = 67;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld", (uint8_t *)v33, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100009508();
    uint64_t v27 = swift_allocError();
    swift_willThrow();
LABEL_15:
    uint64_t v29 = 0;
    goto LABEL_16;
  }
  v22 = (void *)v20;
  uint64_t v58 = a1;
  id v23 = objc_allocWithZone((Class)type metadata accessor for AppIntentProcessor());
  id v24 = v22;
  uint64_t v25 = (void *)AppIntentProcessor.init(event:)();
  v26 = a2;
  [a2 addOperation:v25];
  static SiriRemembersDB.defaultURL.getter();
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    id v56 = v24;
    id v57 = v25;
    uint64_t v34 = v62;
    uint64_t v35 = v63;
    v36 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v62 + 32);
    v36(v63, v9, v15);
    sub_100009554(v35, 0, 1, v15);
    sub_10000957C(v35, (uint64_t)v13);
    if (sub_1000095E4((uint64_t)v13, 1, v15) != 1)
    {
      v51 = v59;
      v36((uint64_t)v59, (uint64_t *)v13, v15);
      sub_10000960C(v35);
      id v52 = v56;
      Date.init()();
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v18, v51, v15);
      id v53 = objc_allocWithZone((Class)type metadata accessor for BiomeInteractionProcessor());
      v54 = (void *)BiomeInteractionProcessor.init(appIntentEvent:eventReceivedAt:databaseURL:)();
      [v26 addOperation:v54];

      (*(void (**)(char *, uint64_t))(v34 + 8))(v51, v15);
      v55 = v61;
      swift_beginAccess();
      if (__OFADD__(*v55, 1)) {
        __break(1u);
      }
      else {
        ++*v55;
      }
      return;
    }
    sub_10000960C((uint64_t)v13);
    p_ivars = &AsyncBackgroundManager.BackgroundQueue.ivars;
    if (qword_100025630 != -1) {
      swift_once();
    }
    uint64_t v37 = type metadata accessor for Logger();
    sub_100006AA4(v37, (uint64_t)qword_100026288);
    v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.error.getter();
    BOOL v40 = os_log_type_enabled(v38, v39);
    uint64_t v28 = v58;
    if (v40)
    {
      uint64_t v41 = swift_slowAlloc();
      v65[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136446722;
      uint64_t v66 = sub_100006C2C(0xD00000000000005ELL, 0x800000010001BA60, v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v41 + 12) = 2082;
      uint64_t v66 = sub_100006C2C(0xD000000000000010, 0x800000010001BAC0, v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v41 + 22) = 2050;
      uint64_t v66 = 83;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld", (uint8_t *)v41, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100009508();
    uint64_t v27 = swift_allocError();
    swift_willThrow();
    sub_10000960C(v63);

    goto LABEL_15;
  }
  uint64_t v27 = *v9;
  v65[0] = *v9;
  sub_100006B58(&qword_100025860);
  swift_willThrowTypedImpl();

  uint64_t v28 = v58;
  uint64_t v29 = v64;
  p_ivars = (__objc2_ivar_list **)(&AsyncBackgroundManager.BackgroundQueue + 48);
LABEL_16:
  if (p_ivars[198] != (__objc2_ivar_list *)-1) {
    swift_once();
  }
  uint64_t v42 = type metadata accessor for Logger();
  sub_100006AA4(v42, (uint64_t)qword_100026288);
  swift_unknownObjectRetain();
  swift_errorRetain();
  swift_unknownObjectRetain();
  swift_errorRetain();
  v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v64 = v29;
    v65[0] = v46;
    *(_DWORD *)uint64_t v45 = 136315394;
    uint64_t v66 = v28;
    swift_unknownObjectRetain();
    uint64_t v47 = String.init<A>(describing:)();
    uint64_t v66 = sub_100006C2C(v47, v48, v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    uint64_t v66 = v27;
    swift_errorRetain();
    sub_100006B58(&qword_100025860);
    uint64_t v49 = String.init<A>(describing:)();
    uint64_t v66 = sub_100006C2C(v49, v50, v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "cannot process AppIntent event:\nevent=%s\nerror=%s", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_unknownObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_100008A90()
{
  swift_unknownObjectRetain();
  self;
  uint64_t v0 = swift_dynamicCastObjCClass();
  if (!v0)
  {
    swift_unknownObjectRelease();
    if (qword_100025630 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100006AA4(v14, (uint64_t)qword_100026288);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136446722;
      sub_100006C2C(0xD00000000000005ELL, 0x800000010001BA60, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v16 + 12) = 2082;
      sub_100006C2C(0xD000000000000010, 0x800000010001BAC0, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v16 + 22) = 2050;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v19, v15, "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    goto LABEL_11;
  }
  uint64_t v19 = v0;
  uint64_t v1 = [v0 eventBody];
  if (!v1)
  {
LABEL_11:
    uint64_t v17 = v19;
    goto LABEL_13;
  }
  uint64_t v18 = v1;
  uint64_t v2 = sub_1000094A4(v1);
  if (v3)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    type metadata accessor for SignalRepository();
    static SignalRepository.shared.getter();
    sub_100006B58(&qword_100025840);
    uint64_t v6 = type metadata accessor for SignalCachingStrategyOption();
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = *(void *)(v7 + 72);
    unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_10001B100;
    uint64_t v11 = (uint64_t *)(v10 + v9);
    *uint64_t v11 = v4;
    v11[1] = v5;
    uint64_t v12 = *(void (**)(void))(v7 + 104);
    ((void (*)(uint64_t *, void, uint64_t))v12)(v11, enum case for SignalCachingStrategyOption.perAppIntentEvent(_:), v6);
    id v13 = (uint64_t *)((char *)v11 + v8);
    void *v13 = 0x6E65746E49707041;
    v13[1] = 0xE900000000000074;
    v12();
    sub_10000C6E8(v10);
    dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:userInteractive:)();

    swift_release();
    swift_bridgeObjectRelease();
    return;
  }

  uint64_t v17 = v18;
LABEL_13:
}

void sub_100008E7C()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_100007588();
  uint64_t v2 = v1;
  __chkstk_darwin();
  sub_10000968C();
  uint64_t v5 = v4 - v3;
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  sub_10000968C();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_10000969C();
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100006AA4(v6, (uint64_t)qword_100026288);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Deregistering AppIntentBiomeMonitor", v9, 2u);
    swift_slowDealloc();
  }

  sub_100009310();
  static DispatchQoS.unspecified.getter();
  aBlock = (void **)&_swiftEmptyArrayStorage;
  sub_100009350();
  sub_100006B58((uint64_t *)&unk_100025CF0);
  sub_1000093A0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t v10 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  id v11 = objc_allocWithZone((Class)BMBiomeScheduler);
  id v12 = sub_10001975C(0xD000000000000022, 0x800000010001BA00, v10);
  id v13 = objc_msgSend(self, "intent", &_swiftEmptyArrayStorage);
  id v14 = [v13 publisher];

  id v15 = [v14 subscribeOn:v12];
  id v23 = nullsub_1;
  uint64_t v24 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  v21 = sub_100018648;
  v22 = &unk_100020F58;
  uint64_t v16 = _Block_copy(&aBlock);
  id v23 = nullsub_1;
  uint64_t v24 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  v21 = sub_10000D730;
  v22 = &unk_100020F80;
  uint64_t v17 = _Block_copy(&aBlock);
  id v18 = [v15 sinkWithCompletion:v16 receiveInput:v17];
  _Block_release(v17);
  _Block_release(v16);

  [v18 cancel];
}

uint64_t sub_100009290()
{
  swift_release();
  return v0;
}

uint64_t sub_1000092B8()
{
  sub_100009290();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AppIntentBiomeMonitor()
{
  return self;
}

unint64_t sub_100009310()
{
  unint64_t result = qword_100025670;
  if (!qword_100025670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025670);
  }
  return result;
}

unint64_t sub_100009350()
{
  unint64_t result = qword_100025828;
  if (!qword_100025828)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025828);
  }
  return result;
}

unint64_t sub_1000093A0()
{
  unint64_t result = qword_100025830;
  if (!qword_100025830)
  {
    sub_100007538((uint64_t *)&unk_100025CF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025830);
  }
  return result;
}

uint64_t sub_1000093F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009404()
{
  return swift_release();
}

uint64_t sub_10000940C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000941C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000945C(uint64_t a1)
{
  sub_100007F84(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100009464()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000949C()
{
}

uint64_t sub_1000094A4(void *a1)
{
  id v1 = [a1 intentClass];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

unint64_t sub_100009508()
{
  unint64_t result = qword_100025858;
  if (!qword_100025858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025858);
  }
  return result;
}

uint64_t sub_100009554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000957C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B58(&qword_100025850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000095E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000960C(uint64_t a1)
{
  uint64_t v2 = sub_100006B58(&qword_100025850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1000096B4()
{
  v0[2] = 0;
  v0[3] = dispatch_semaphore_create(1);
  v0[4] = 0xD00000000000003ELL;
  v0[5] = 0x800000010001BD30;
  sub_1000096FC();
  return v0;
}

void sub_1000096FC()
{
  id v2 = *(id *)(v0 + 24);
  OS_dispatch_semaphore.wait()();
  char v1 = AFPreferencesAssistantEnabled() != 0;
  sub_100009A34(v1);
  OS_dispatch_semaphore.signal()();
}

void sub_100009768()
{
}

void sub_100009790()
{
}

void sub_1000097B8(const char *a1, uint64_t (*a2)(void), const char *a3)
{
  id v7 = *(id *)(v3 + 24);
  OS_dispatch_semaphore.wait()();
  sub_100009844(v3, a1, a2, a3);
  OS_dispatch_semaphore.signal()();
}

void sub_100009844(uint64_t a1, const char *a2, uint64_t (*a3)(void), const char *a4)
{
  if (*(void *)(a1 + 16))
  {
    if (qword_100025638 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100006AA4(v6, (uint64_t)qword_1000262A0);
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, a2, v9, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for BackgroundQueue();
    uint64_t v10 = (void *)static BackgroundQueue.shared.getter();
    id v11 = [objc_allocWithZone((Class)a3(0)) init];
    [v10 addOperation:v11];
  }
  else
  {
    if (qword_100025638 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100006AA4(v13, (uint64_t)qword_1000262A0);
    id v11 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v14, a4, v15, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100009A34(char a1)
{
  id v2 = v1;
  int v4 = a1 & 1;
  uint64_t v5 = sub_100006B58(&qword_100025848);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v2[2] == 0) != v4)
  {
    if (a1)
    {
      if (qword_100025638 != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      sub_100006AA4(v8, (uint64_t)qword_1000262A0);
      os_log_t v33 = (os_log_t)Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v33, v9)) {
        goto LABEL_18;
      }
      uint64_t v10 = (uint8_t *)sub_10000CAC4();
      *(_WORD *)uint64_t v10 = 0;
      id v11 = "Siri is already on. skipping.";
    }
    else
    {
      if (qword_100025638 != -1) {
        swift_once();
      }
      uint64_t v19 = type metadata accessor for Logger();
      sub_100006AA4(v19, (uint64_t)qword_1000262A0);
      os_log_t v33 = (os_log_t)Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v33, v9)) {
        goto LABEL_18;
      }
      uint64_t v10 = (uint8_t *)sub_10000CAC4();
      *(_WORD *)uint64_t v10 = 0;
      id v11 = "Siri is already off. skipping.";
    }
    _os_log_impl((void *)&_mh_execute_header, v33, v9, v11, v10, 2u);
    sub_1000075A4();
LABEL_18:
    os_log_t v20 = v33;

    return;
  }
  if (a1)
  {
    if (qword_100025638 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100006AA4(v12, (uint64_t)qword_1000262A0);
    uint64_t v13 = (void *)Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (sub_10000CAFC(v14))
    {
      id v15 = (_WORD *)sub_10000CAC4();
      sub_10000CB18(v15);
      sub_10000CADC((void *)&_mh_execute_header, v16, v17, "Siri is on. Enabling background tasks...");
      sub_1000075A4();
    }

    type metadata accessor for BackgroundManager.Inner();
    uint64_t v18 = swift_allocObject();
    sub_10000B72C();
    v2[2] = v18;
    swift_release();
    sub_100009EA8();
    sub_10000A084();
  }
  else
  {
    if (qword_100025638 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100006AA4(v21, (uint64_t)qword_1000262A0);
    v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)sub_10000CAC4();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Siri is off. Disabling background tasks and deleting data...", v24, 2u);
      sub_1000075A4();
    }

    uint64_t v25 = v2[2];
    if (v25 && *(void *)(v25 + 32))
    {
      type metadata accessor for RolloutsAnalyticsActivity();
      swift_retain();
      static RolloutsAnalyticsActivity.deregister(analyticsManager:)();
      swift_release();
    }
    v2[2] = 0;
    swift_release();
    type metadata accessor for AppIntentBiomeMonitor();
    sub_100008E7C();
    type metadata accessor for SiriUIBiomeMonitor();
    static SiriUIBiomeMonitor.deregister()();
    sub_10000A3E4(v2[4], v2[5]);
    sub_100009EA8();
    type metadata accessor for BackgroundQueue();
    v26 = (void *)static BackgroundQueue.shared.getter();
    dispatch thunk of BackgroundQueue.pause()();

    uint64_t v27 = (void *)Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.info.getter();
    if (sub_10000CB30(v28))
    {
      uint64_t v29 = (_WORD *)sub_10000CAC4();
      sub_10000CB18(v29);
      sub_10000CBAC((void *)&_mh_execute_header, v30, v31, "paused operations on the BackgroundQueue, deleting SiriRemembersDB and RunTimeDataDB");
      sub_1000075A4();
    }

    sub_10000A890();
    static SiriRemembersDB.defaultURL.getter();
    sub_10000AB50((uint64_t)v7);
    sub_10000C688((uint64_t)v7);
    static RunTimeDataDB.defaultURL.getter();
    sub_10000AB50((uint64_t)v7);
    sub_10000C688((uint64_t)v7);
  }
}

uint64_t sub_100009EA8()
{
  if (qword_100025638 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006AA4(v0, (uint64_t)qword_1000262A0);
  char v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "unregistering XPC activities", v3, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for ScrubOldRecords();
  static ScrubOldRecords.metricName.getter();
  StaticString.description.getter();
  static XPCActivity.unregister(name:)();
  swift_bridgeObjectRelease();
  type metadata accessor for ProcessUnstitchedIntents();
  static ProcessUnstitchedIntents.metricName.getter();
  StaticString.description.getter();
  static XPCActivity.unregister(name:)();
  swift_bridgeObjectRelease();
  type metadata accessor for HolidaysDBUpdater();
  static HolidaysDBUpdater.metricName.getter();
  StaticString.description.getter();
  static XPCActivity.unregister(name:)();
  swift_bridgeObjectRelease();
  static XPCActivity.unregister(name:)();
  static XPCActivity.unregister(name:)();
  static XPCActivity.unregister(name:)();
  static XPCActivity.unregister(name:)();
  type metadata accessor for ActivityHeartbeat();
  static ActivityHeartbeat.activityName.getter();
  static XPCActivity.unregister(name:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A084()
{
  uint64_t v0 = type metadata accessor for XPCActivity.RepeatInterval();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100025638 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006AA4(v4, (uint64_t)qword_1000262A0);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "registering XPC activities", v7, 2u);
    swift_slowDealloc();
  }

  static XPCActivity.registerFirstBoot()();
  static XPCActivity.registerDailySignalRefresh(refreshSignalCallback:)();
  static XPCActivity.registerHourlySignalRefresh(hourlySignalRefresh:)();
  static XPCActivity.registerDailyTaskSuccessEvaluation()();
  type metadata accessor for ScrubOldRecords();
  static ScrubOldRecords.metricName.getter();
  StaticString.description.getter();
  uint64_t v8 = enum case for XPCActivity.RepeatInterval.everyDay(_:);
  os_log_type_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v9(v3, enum case for XPCActivity.RepeatInterval.everyDay(_:), v0);
  static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v3, v0);
  type metadata accessor for ProcessUnstitchedIntents();
  static ProcessUnstitchedIntents.metricName.getter();
  StaticString.description.getter();
  v9(v3, v8, v0);
  static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)();
  swift_bridgeObjectRelease();
  v10(v3, v0);
  type metadata accessor for HolidaysDBUpdater();
  static HolidaysDBUpdater.metricName.getter();
  StaticString.description.getter();
  v9(v3, v8, v0);
  static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)();
  swift_bridgeObjectRelease();
  v10(v3, v0);
  static XPCActivity.registerRecurringAudioAppSignalsSync(audioAppSignalsSync:)();
  static ScrubInteractionStore.register()();
  static SiriRemembersBiomeEventBackfiller.register()();
  return static SiriSuggestionsBiomeEventBackFiller.register()();
}

void sub_10000A3E4(uint64_t a1, unint64_t a2)
{
  char v22 = 1;
  id v4 = [self defaultManager];
  NSString v5 = String._bridgeToObjectiveC()();
  unsigned int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v22];

  if (!v6) {
    goto LABEL_7;
  }
  NSString v7 = String._bridgeToObjectiveC()();
  id v23 = 0;
  unsigned int v8 = [v4 removeItemAtPath:v7 error:&v23];

  if (v8)
  {
    uint64_t v9 = qword_100025638;
    id v10 = v23;
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100006AA4(v11, (uint64_t)qword_1000262A0);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
      id v23 = (id)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v14 = 136446210;
      swift_bridgeObjectRetain();
      sub_100006C2C(a1, a2, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Deleted at location: %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_7:
      return;
    }

    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v15 = v23;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100025638 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_100006AA4(v16, (uint64_t)qword_1000262A0);
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      id v23 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136446466;
      swift_bridgeObjectRetain();
      sub_100006C2C(a1, a2, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 12) = 2082;
      swift_errorRetain();
      sub_100006B58(&qword_100025860);
      uint64_t v20 = String.init<A>(describing:)();
      sub_100006C2C(v20, v21, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "could not delete at\nlocation: %{public}s\nerror: %{public}s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

void sub_10000A890()
{
  static InteractionStore.delete()();
  if (qword_100025638 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006AA4(v0, (uint64_t)qword_1000262A0);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Succeed to delete the InteractionStore", v2, 2u);
    swift_slowDealloc();
  }
}

void sub_10000AB50(uint64_t a1)
{
  uint64_t v2 = sub_100006B58(&qword_100025848);
  uint64_t v3 = __chkstk_darwin(v2);
  NSString v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  unsigned int v8 = (char *)v35 - v7;
  __chkstk_darwin(v6);
  id v10 = (void *)((char *)v35 - v9);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v35 - v16;
  sub_10000CA14(a1, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = *v10;
    uint64_t v37 = *v10;
    sub_100006B58(&qword_100025860);
    swift_willThrowTypedImpl();
    if (qword_100025638 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100006AA4(v19, (uint64_t)qword_1000262A0);
    sub_10000CA14(a1, (uint64_t)v8);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446466;
      sub_10000CA14((uint64_t)v8, (uint64_t)v5);
      uint64_t v23 = String.init<A>(describing:)();
      uint64_t v36 = sub_100006C2C(v23, v24, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10000C688((uint64_t)v8);
      *(_WORD *)(v22 + 12) = 2082;
      uint64_t v36 = v18;
      swift_errorRetain();
      sub_100006B58(&qword_100025860);
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v36 = sub_100006C2C(v25, v26, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "could not delete URL\nurl=%{public}s\nerror=%{public}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      sub_10000C688((uint64_t)v8);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v17, v10, v11);
    sub_1000198A0();
    if (qword_100025638 != -1) {
      swift_once();
    }
    uint64_t v27 = type metadata accessor for Logger();
    sub_100006AA4(v27, (uint64_t)qword_1000262A0);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    os_log_type_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136446210;
      v35[0] = v30 + 4;
      sub_10000CA7C(&qword_100025CE8, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v36 = sub_100006C2C(v31, v32, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      os_log_t v33 = *(void (**)(char *, uint64_t))(v12 + 8);
      v33(v15, v11);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "deleted URL %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v33(v17, v11);
    }
    else
    {

      uint64_t v34 = *(void (**)(char *, uint64_t))(v12 + 8);
      v34(v15, v11);
      v34(v17, v11);
    }
  }
}

void sub_10000B148(uint64_t a1, unint64_t a2)
{
  if (*(void *)(v2 + 16))
  {
    type metadata accessor for BackgroundManager.Inner();
    sub_10000B190(a1, a2);
  }
}

void sub_10000B190(uint64_t a1, unint64_t a2)
{
  id v4 = [self appIntentsStream];
  if (!v4)
  {
    __break(1u);
    return;
  }
  NSString v5 = v4;
  id v6 = [v4 name];

  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  if (v7 == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_12:
    sub_10000B9C4();
    return;
  }
  if (qword_100025638 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100006AA4(v12, (uint64_t)qword_1000262A0);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)id v15 = 136446210;
    swift_bridgeObjectRetain();
    sub_100006C2C(a1, a2, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "_DKKnowledgeStorageDidTombstoneEvents noop. stream=%{public}s", v15, 0xCu);
    swift_arrayDestroy();
    sub_1000075A4();
    sub_1000075A4();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_10000B3C8()
{
  type metadata accessor for SignalRepository();
  static SignalRepository.shared.getter();
  sub_100006B58(&qword_100025840);
  uint64_t v0 = type metadata accessor for SignalCachingStrategyOption();
  uint64_t v1 = *(void *)(v0 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001B0D0;
  (*(void (**)(unint64_t, void, uint64_t))(v1 + 104))(v3 + v2, enum case for SignalCachingStrategyOption.perDay(_:), v0);
  sub_10000C6E8(v3);
  dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:userInteractive:)();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B4E8()
{
  type metadata accessor for SignalRepository();
  static SignalRepository.shared.getter();
  dispatch thunk of SignalRepository.hourlyPrewarm()();

  return swift_release();
}

uint64_t sub_10000B530(uint64_t a1)
{
  return sub_10000B588(a1, (uint64_t)&type metadata accessor for ScrubOldRecords, (uint64_t (*)(uint64_t))&ScrubOldRecords.init(activity:));
}

uint64_t sub_10000B55C(uint64_t a1)
{
  return sub_10000B588(a1, (uint64_t)&type metadata accessor for ProcessUnstitchedIntents, (uint64_t (*)(uint64_t))&ProcessUnstitchedIntents.init(activity:));
}

uint64_t sub_10000B588(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10000CB24();
  id v6 = objc_allocWithZone((Class)v5(v4));
  uint64_t v7 = swift_unknownObjectRetain();
  return a3(v7);
}

uint64_t sub_10000B5D8()
{
  return static HolidaysDBUpdater.xpcActivityOperation(activity:)();
}

uint64_t sub_10000B60C()
{
  uint64_t v0 = type metadata accessor for AudioAppSignalsSyncer.SyncTrigger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AudioAppSignalsSyncer();
  AudioAppSignalsSyncer.__allocating_init()();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for AudioAppSignalsSyncer.SyncTrigger.timer(_:), v0);
  dispatch thunk of AudioAppSignalsSyncer.syncAudioAppSignals(bypassMinSyncDuration:trigger:completion:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void *sub_10000B72C()
{
  uint64_t v1 = v0;
  v0[2] = 0;
  v0[3] = 0;
  v0[4] = 0;
  if (qword_100025638 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_1000262A0);
  uint64_t v3 = (void *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (sub_10000CB30(v4))
  {
    uint64_t v5 = (_WORD *)sub_10000CAC4();
    sub_10000CB18(v5);
    sub_10000CBAC((void *)&_mh_execute_header, v6, v7, "starting Biome monitors");
    sub_1000075A4();
  }

  uint64_t v8 = (void *)type metadata accessor for BackgroundQueue();
  uint64_t v9 = (void *)static BackgroundQueue.shared.getter();
  uint64_t v10 = type metadata accessor for SiriInferenceSuggestionsBridgeProvider();
  static SiriInferenceSuggestionsBridgeProvider.instance.getter();
  sub_10000CB24();
  type metadata accessor for AppIntentBiomeMonitor();
  swift_allocObject();
  v1[2] = sub_1000075BC(v9, v10);
  swift_release();
  static BackgroundQueue.shared.getter();
  sub_10000CB24();
  type metadata accessor for SiriUIBiomeMonitor();
  swift_allocObject();
  v1[3] = SiriUIBiomeMonitor.init(queue:)(v8);
  swift_release();
  type metadata accessor for SiriRolloutsMonitor();
  swift_allocObject();
  v1[4] = sub_1000174A4();
  swift_release();
  if (v1[4])
  {
    swift_retain();
    char v11 = (void *)static BackgroundQueue.shared.getter();
    sub_1000175B0(v11);
    swift_release();
  }
  sub_10000B9C4();
  static BackgroundQueue.shared.getter();
  sub_10000CB24();
  id v12 = [objc_allocWithZone((Class)type metadata accessor for FetchInteractions()) init];
  [v8 addOperation:v12];

  uint64_t v13 = (void *)Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (sub_10000CAFC(v14))
  {
    id v15 = (_WORD *)sub_10000CAC4();
    sub_10000CB18(v15);
    sub_10000CADC((void *)&_mh_execute_header, v16, v17, "Adding BiomeInteractionFetcher to BackgroundQueue");
    sub_1000075A4();
  }

  static BackgroundQueue.shared.getter();
  sub_10000CB24();
  id v18 = [objc_allocWithZone((Class)type metadata accessor for BiomeInteractionFetcher()) init];
  [v8 addOperation:v18];

  sub_10000BB58();
  uint64_t v19 = (void *)static BackgroundQueue.shared.getter();
  dispatch thunk of BackgroundQueue.resume()();

  return v1;
}

void sub_10000B9C4()
{
  if (qword_100025638 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006AA4(v0, (uint64_t)qword_1000262A0);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)sub_10000CAC4() = 0;
    sub_10000CB78((void *)&_mh_execute_header, v3, v4, "queuing post-tombstone privacy-related background tasks");
    sub_1000075A4();
  }

  type metadata accessor for BackgroundQueue();
  uint64_t v5 = (void *)static BackgroundQueue.shared.getter();
  id v6 = [objc_allocWithZone((Class)type metadata accessor for ScrubOldRecords()) init];
  [v5 addOperation:v6];

  uint64_t v7 = (void *)static BackgroundQueue.shared.getter();
  id v8 = [objc_allocWithZone((Class)type metadata accessor for ScrubDodMLRecords()) init];
  [v7 addOperation:v8];

  uint64_t v9 = (void *)static BackgroundQueue.shared.getter();
  id v10 = [objc_allocWithZone((Class)type metadata accessor for ScrubRuntimeDataRecords()) init];
  [v9 addOperation:v10];
}

void sub_10000BB58()
{
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006AA4(v0, (uint64_t)qword_100026288);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)sub_10000CAC4() = 0;
    sub_10000CB78((void *)&_mh_execute_header, v3, v4, "Starting Biome Listeners for SiriSignals");
    sub_1000075A4();
  }

  type metadata accessor for SignalRepository();
  static SignalRepository.shared.getter();
  dispatch thunk of SignalRepository.startBiomeListeners()();
  swift_release();
  static SignalRepository.shared.getter();
  dispatch thunk of SignalRepository.startAppInstallListener()();
  swift_release();
  type metadata accessor for BackgroundQueue();
  uint64_t v5 = (void *)static BackgroundQueue.shared.getter();
  v7[4] = sub_10000BCEC;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10000685C;
  v7[3] = &unk_100021118;
  id v6 = _Block_copy(v7);
  [v5 addOperationWithBlock:v6];
  _Block_release(v6);
}

void sub_10000BCEC()
{
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006AA4(v0, (uint64_t)qword_100026288);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Pre-warming all SiriSignals", v3, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for SignalRepository();
  static SignalRepository.shared.getter();
  dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:userInteractive:)();
  swift_release();
  oslog = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Done Pre-warming all SiriSignals", v5, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10000BE7C()
{
  uint64_t v1 = v0;
  if (qword_100025638 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  os_log_type_t v3 = sub_100006AA4(v2, (uint64_t)qword_1000262A0);
  os_log_type_t v4 = (void *)Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (sub_10000CAFC(v5))
  {
    id v6 = (_WORD *)sub_10000CAC4();
    sub_10000CB18(v6);
    sub_10000CADC((void *)&_mh_execute_header, v7, v8, "BackgroundManager.Inner beginning deinit");
    sub_1000075A4();
  }

  type metadata accessor for BackgroundQueue();
  uint64_t v9 = (void *)static BackgroundQueue.shared.getter();
  [v9 cancelAllOperations];

  id v10 = (void *)static BackgroundQueue.shared.getter();
  [v10 waitUntilAllOperationsAreFinished];

  char v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (sub_10000CB30(v12))
  {
    uint64_t v13 = (uint8_t *)sub_10000CAC4();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v3, "BackgroundManager.Inner finished deinit", v13, 2u);
    sub_1000075A4();
  }

  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000BFE0()
{
  sub_10000BE7C();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_10000C014()
{
  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000C044()
{
  sub_10000C014();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for BackgroundManager()
{
  return self;
}

uint64_t type metadata accessor for BackgroundManager.Inner()
{
  return self;
}

uint64_t sub_10000C0C0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC14siriinferenced22AsyncBackgroundManager15BackgroundQueue_queue;
  sub_100006B58(&qword_100025CC8);
  sub_10000CB64();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10000C158()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC14siriinferenced22AsyncBackgroundManager14QueueProcessor_stream;
  sub_100006B58(&qword_100025CC0);
  sub_10000CB64();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_10000C1CC()
{
  return v0;
}

uint64_t sub_10000C1D8()
{
  return sub_10000C1CC();
}

uint64_t sub_10000C1F4()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AsyncBackgroundManager()
{
  return self;
}

uint64_t sub_10000C250()
{
  return type metadata accessor for AsyncBackgroundManager.BackgroundQueue(0);
}

uint64_t type metadata accessor for AsyncBackgroundManager.BackgroundQueue(uint64_t a1)
{
  return sub_10000C34C(a1, (uint64_t *)&unk_100025B58);
}

void sub_10000C278()
{
  sub_10000C438(319, (unint64_t *)&unk_100025B68, (uint64_t (*)(void, ValueMetadata *))&type metadata accessor for AsyncStream.Continuation);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10000C324()
{
  return type metadata accessor for AsyncBackgroundManager.QueueProcessor(0);
}

uint64_t type metadata accessor for AsyncBackgroundManager.QueueProcessor(uint64_t a1)
{
  return sub_10000C34C(a1, (uint64_t *)&unk_100025C20);
}

uint64_t sub_10000C34C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C380()
{
  sub_10000C438(319, (unint64_t *)&unk_100025C30, (uint64_t (*)(void, ValueMetadata *))&type metadata accessor for AsyncStream);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000C438(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for AsyncBackgroundManager.BackgroundAction);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AsyncBackgroundManager.BackgroundAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AsyncBackgroundManager.BackgroundAction()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AsyncBackgroundManager.BackgroundAction(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AsyncBackgroundManager.BackgroundAction(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AsyncBackgroundManager.BackgroundAction(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for AsyncBackgroundManager.BackgroundAction(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncBackgroundManager.BackgroundAction(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AsyncBackgroundManager.BackgroundAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncBackgroundManager.BackgroundAction()
{
  return &type metadata for AsyncBackgroundManager.BackgroundAction;
}

uint64_t sub_10000C688(uint64_t a1)
{
  uint64_t v2 = sub_100006B58(&qword_100025848);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C6E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SignalCachingStrategyOption();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v34 = (char *)&v25 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }
  sub_100006B58(&qword_100025CD0);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v29 = *(void *)(a1 + 16);
  if (!v29)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (uint64_t)v8;
  }
  unint64_t v9 = 0;
  uint64_t v28 = a1 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
  uint64_t v32 = v30 + 16;
  uint64_t v33 = result + 56;
  id v10 = (void (**)(char *, uint64_t))(v30 + 8);
  uint64_t v26 = a1;
  uint64_t v27 = (uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v30 + 72);
    os_log_type_t v12 = *(void (**)(void))(v30 + 16);
    sub_10000CB98();
    v12();
    sub_10000CA7C(&qword_100025CD8, (void (*)(uint64_t))&type metadata accessor for SignalCachingStrategyOption);
    uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)() & ~(-1 << v8[32]);
    sub_10000CB4C();
    if ((v16 & v15) != 0)
    {
      unint64_t v31 = v9;
      uint64_t v18 = ~v17;
      while (1)
      {
        sub_10000CB98();
        v12();
        sub_10000CA7C(&qword_100025CE0, (void (*)(uint64_t))&type metadata accessor for SignalCachingStrategyOption);
        char v19 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v20 = *v10;
        (*v10)(v5, v2);
        if (v19) {
          break;
        }
        uint64_t v13 = (v13 + 1) & v18;
        sub_10000CB4C();
        if ((v15 & v16) == 0)
        {
          a1 = v26;
          unint64_t v9 = v31;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v20)(v34, v2);
      a1 = v26;
      unint64_t v9 = v31;
    }
    else
    {
LABEL_10:
      os_log_type_t v21 = v34;
      *(void *)(v33 + 8 * v14) = v16 | v15;
      uint64_t result = (*v27)(*((void *)v8 + 6) + v13 * v11, v21, v2);
      uint64_t v22 = *((void *)v8 + 2);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23) {
        goto LABEL_18;
      }
      *((void *)v8 + 2) = v24;
    }
    if (++v9 == v29) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10000C9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CA0C()
{
  return swift_release();
}

uint64_t sub_10000CA14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B58(&qword_100025848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CA7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000CAC4()
{
  return swift_slowAlloc();
}

void sub_10000CADC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL sub_10000CAFC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

_WORD *sub_10000CB18(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_10000CB24()
{
  return 0;
}

BOOL sub_10000CB30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_10000CB78(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_10000CBAC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void *Constants.remembersMachServiceName.unsafeMutableAddressor()
{
  return &static Constants.remembersMachServiceName;
}

void *Constants.bundleId.unsafeMutableAddressor()
{
  return &static Constants.bundleId;
}

void *Constants.signalsMachServiceName.unsafeMutableAddressor()
{
  return &static Constants.signalsMachServiceName;
}

void *Constants.subsystem.unsafeMutableAddressor()
{
  return &static Constants.subsystem;
}

unint64_t static Constants.subsystem.getter()
{
  return sub_10000CCD8(24);
}

unint64_t static Constants.bundleId.getter()
{
  return sub_10000CCD8(24);
}

unint64_t static Constants.signalsMachServiceName.getter()
{
  return sub_10000CCD8(32);
}

unint64_t static Constants.remembersMachServiceName.getter()
{
  return sub_10000CCD8(34);
}

void *Constants.coreDuetContextId.unsafeMutableAddressor()
{
  return &static Constants.coreDuetContextId;
}

unint64_t static Constants.coreDuetContextId.getter()
{
  return sub_10000CCD8(41);
}

void *Constants.suggestionsInferenceBridgeInstallPath.unsafeMutableAddressor()
{
  return &static Constants.suggestionsInferenceBridgeInstallPath;
}

unint64_t static Constants.suggestionsInferenceBridgeInstallPath.getter()
{
  return sub_10000CCD8(90);
}

void *Constants.siriTasksEvaluationPluginId.unsafeMutableAddressor()
{
  return &static Constants.siriTasksEvaluationPluginId;
}

unint64_t static Constants.siriTasksEvaluationPluginId.getter()
{
  return sub_10000CCD8(55);
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

unint64_t sub_10000CCD8(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t sub_10000CCE0()
{
  String.utf8CString.getter();
  int v0 = _set_user_dir_suffix();
  swift_release();
  if (!v0)
  {
    if (qword_100025640 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_100006AA4(v16, (uint64_t)qword_1000262B8);
    uint64_t v17 = (void *)Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (sub_10000E428(v18))
    {
      *(_WORD *)sub_10000CAC4() = 0;
      sub_10000CB78((void *)&_mh_execute_header, v19, v20, "Sandbox: _set_user_dir_suffix returned nil");
      sub_10000E40C();
    }

    char v15 = 3;
LABEL_22:
    static Exit.exit(_:)(v15);
  }
  uint64_t v1 = NSTemporaryDirectory();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    if (qword_100025640 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100006AA4(v21, (uint64_t)qword_1000262B8);
    uint64_t v22 = (void *)Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (sub_10000E428(v23))
    {
      *(_WORD *)sub_10000CAC4() = 0;
      sub_10000CB78((void *)&_mh_execute_header, v24, v25, "Unable to create temp directory");
      sub_10000E40C();
    }

    char v15 = 4;
    goto LABEL_22;
  }
  sub_10000DE48(65537);
  if (!v6 || (sub_1000199C4(), v8 = v7, swift_bridgeObjectRelease(), uint64_t result = swift_bridgeObjectRelease(), !v8))
  {
    if (qword_100025640 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100006AA4(v10, (uint64_t)qword_1000262B8);
    uint64_t v11 = (void *)Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (sub_10000E428(v12))
    {
      *(_WORD *)sub_10000CAC4() = 0;
      sub_10000CB78((void *)&_mh_execute_header, v13, v14, "Sandbox: confstr(_CS_DARWIN_USER_TEMP_DIR) failed");
      sub_10000E40C();
    }

    char v15 = 1;
    goto LABEL_22;
  }
  return result;
}

void sub_10000CF28(uint64_t a1)
{
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_1000262B8);
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)sub_10000CAC4();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "registering XPC notification handlers", v5, 2u);
    swift_slowDealloc();
  }

  if (qword_100025620 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_100026278;
  uint64_t v16 = sub_10000E000;
  uint64_t v17 = a1;
  os_log_type_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_10000D730;
  char v15 = &unk_1000211D0;
  uint64_t v7 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v6, v7);
  _Block_release(v7);
  uint64_t v8 = qword_100026278;
  uint64_t v16 = sub_10000E020;
  uint64_t v17 = a1;
  os_log_type_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_10000D730;
  char v15 = &unk_1000211F8;
  unint64_t v9 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v8, v9);
  _Block_release(v9);
  uint64_t v10 = qword_100026278;
  uint64_t v16 = sub_10000DB94;
  uint64_t v17 = 0;
  os_log_type_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_10000D730;
  char v15 = &unk_100021220;
  uint64_t v11 = _Block_copy(&v12);
  xpc_set_event_stream_handler("com.apple.xpc.activity", v10, v11);
  _Block_release(v11);
}

uint64_t sub_10000D1E4()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_10000968C();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5);
  sub_10000968C();
  uint64_t v6 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v6 - 8);
  sub_10000968C();
  sub_100009310();
  static DispatchQoS.userInitiated.getter();
  sub_100009350();
  sub_100006B58((uint64_t *)&unk_100025CF0);
  sub_1000093A0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  qword_100026278 = result;
  return result;
}

void sub_10000D3CC(void *a1)
{
  if (!xpc_dictionary_get_string(a1, _xpc_event_key_name)) {
    return;
  }
  uint64_t v1 = String.init(cString:)();
  unint64_t v3 = v2;
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006AA4(v4, (uint64_t)qword_1000262B8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_bridgeObjectRetain();
    sub_100006C2C(v1, v3, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "received XPC event from notifyd: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!kAFPreferencesDidChangeDarwinNotification)
  {
    __break(1u);
    return;
  }
  if (v1 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v3 == v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v10)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    sub_1000096FC();
    return;
  }
  if (v1 == 0xD000000000000029 && v3 == 0x800000010001BD90
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_100009768();
    return;
  }
  if (v1 == 0xD000000000000022 && v3 == 0x800000010001BA00)
  {
    swift_bridgeObjectRelease();
LABEL_24:
    sub_100009790();
    return;
  }
  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_24;
  }
  os_log_type_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "XPC event is unhandled", v14, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10000D730(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

const char *sub_10000D790(void *a1)
{
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_1000262B8);
  swift_unknownObjectRetain_n();
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_unknownObjectRetain();
    sub_100006B58(&qword_100025D00);
    uint64_t v6 = String.init<A>(describing:)();
    sub_100006C2C(v6, v7, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "received XPC event from distnoted: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t result = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (result)
  {
    string = xpc_dictionary_get_string(a1, "Object");
    uint64_t v10 = String.init(cString:)();
    uint64_t v12 = v11;
    if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
        if (v10 == 0xD00000000000002ELL && v12 == 0x800000010001BF10
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
          || v10 == 0xD000000000000030 && v12 == 0x800000010001BF40
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          type metadata accessor for SignalRepository();
          static SignalRepository.shared.getter();
          sub_100006B58(&qword_100025840);
          uint64_t v16 = *(void *)(type metadata accessor for SignalCachingStrategyOption() - 8);
          unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
          uint64_t v18 = swift_allocObject();
          *(_OWORD *)(v18 + 16) = xmmword_10001B0D0;
          uint64_t v19 = (uint64_t *)(v18 + v17);
          uint64_t *v19 = v10;
          v19[1] = v12;
          (*(void (**)(unint64_t, void))(v16 + 104))(v18 + v17, enum case for SignalCachingStrategyOption.perSystemNotification(_:));
          sub_10000C6E8(v18);
          dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:)();
          swift_release();
        }
        return (const char *)swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    if (string)
    {
      uint64_t v20 = String.init(cString:)();
      unint64_t v22 = v21;
    }
    else
    {
      uint64_t v20 = 0;
      unint64_t v22 = 0xE000000000000000;
    }
    sub_10000B148(v20, v22);
    return (const char *)swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10000DB94(void *a1)
{
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_1000262B8);
  swift_unknownObjectRetain_n();
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_unknownObjectRetain();
    sub_100006B58(&qword_100025D00);
    uint64_t v6 = String.init<A>(describing:)();
    sub_100006C2C(v6, v7, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "received XPC event from XPC activity: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  if (!xpc_dictionary_get_string(a1, _xpc_event_key_name)) {
    goto LABEL_11;
  }
  if (String.init(cString:)() == 0xD000000000000022 && v8 == 0x800000010001BEE0)
  {
    swift_bridgeObjectRelease();
    return;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_11:
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "xpc activity is unhandled", v12, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10000DE48(int a1)
{
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t v2 = __DataStorage.init(length:)();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    if (__DataStorage._bytes.getter())
    {
      uint64_t result = __DataStorage._offset.getter();
      if (__OFSUB__(0, result)) {
        goto LABEL_12;
      }
    }
    swift_allocObject();
    uint64_t v4 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
    swift_release();
    uint64_t v2 = v4;
  }
  uint64_t result = __DataStorage._bytes.getter();
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v5 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v6 = -result;
  if (__OFSUB__(0, result))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = __DataStorage._length.getter();
  if (v7 >= 1024) {
    size_t v8 = 1024;
  }
  else {
    size_t v8 = v7;
  }
  bzero((void *)(v5 + v6), v8);
  uint64_t v10 = 0x40000000000;
  unint64_t v11 = v2 | 0x4000000000000000;
  uint64_t v9 = sub_10000E028(&v10, a1);
  sub_10000E2C4(v10, v11);
  return v9;
}

uint64_t sub_10000DF9C@<X0>(char *a1@<X0>, int a2@<W2>, void *a3@<X8>)
{
  uint64_t result = confstr(a2, a1, 0x400uLL);
  if (result >= 1 && a1)
  {
    uint64_t result = String.init(cString:)();
    *a3 = result;
    a3[1] = v6;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return result;
}

void sub_10000E000(void *a1)
{
}

uint64_t sub_10000E008(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E018()
{
  return swift_release();
}

const char *sub_10000E020(void *a1)
{
  return sub_10000D790(a1);
}

uint64_t sub_10000E028(uint64_t *a1, int a2)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v8 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_10001B260;
      uint64_t v9 = v3 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_11;
      }
      if (v9 < (int)v3) {
        goto LABEL_16;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v3, __DataStorage._offset.getter())) {
        goto LABEL_17;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v11 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v8 = v11;
LABEL_11:
      if (v9 < (int)v3)
      {
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
      }
      uint64_t result = sub_10000E31C((int)v3, v3 >> 32, v8, a2);
      unint64_t v10 = v8 | 0x4000000000000000;
      *a1 = v3;
LABEL_13:
      a1[1] = v10;
      return result;
    case 2uLL:
      *(void *)&long long v12 = *a1;
      *((void *)&v12 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = sub_10000E31C(*(void *)(v12 + 16), *(void *)(v12 + 24), *((uint64_t *)&v12 + 1), a2);
      unint64_t v10 = *((void *)&v12 + 1) | 0x8000000000000000;
      *a1 = v12;
      goto LABEL_13;
    case 3uLL:
      *(void *)((char *)&v12 + 7) = 0;
      *(void *)&long long v12 = 0;
      return sub_10000E3C8((char *)&v12, 0, a2);
    default:
      *(void *)&long long v12 = *a1;
      WORD4(v12) = v2;
      BYTE10(v12) = BYTE2(v2);
      BYTE11(v12) = BYTE3(v2);
      BYTE12(v12) = BYTE4(v2);
      BYTE13(v12) = BYTE5(v2);
      BYTE14(v12) = BYTE6(v2);
      uint64_t result = sub_10000E3C8((char *)&v12, BYTE6(v2), a2);
      unint64_t v7 = DWORD2(v12) | ((unint64_t)BYTE12(v12) << 32) | ((unint64_t)BYTE13(v12) << 40) | ((unint64_t)BYTE14(v12) << 48);
      *a1 = v12;
      a1[1] = v7;
      return result;
  }
}

uint64_t sub_10000E2C4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000E31C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_9;
  }
  uint64_t v9 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v10 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (__OFSUB__(a2, a1))
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  __DataStorage._length.getter();
  uint64_t result = sub_10000DF9C((char *)(v9 + v10), a4, &v11);
  if (!v4) {
    return v11;
  }
  return result;
}

uint64_t sub_10000E3C8(char *a1, uint64_t a2, int a3)
{
  uint64_t result = sub_10000DF9C(a1, a3, &v5);
  if (!v3) {
    return v5;
  }
  return result;
}

uint64_t sub_10000E40C()
{
  return swift_slowDealloc();
}

BOOL sub_10000E428(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void static Exit.exit(_:)(char a1)
{
  LOBYTE(v1) = a1;
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_1000262B8);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    int v1 = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Exiting with reason: %d", v5, 8u);
    swift_slowDealloc();
  }
  else
  {

    int v1 = v1;
  }
  _exit(v1);
}

siriinferenced::ExitReason_optional __swiftcall ExitReason.init(rawValue:)(Swift::Int32 rawValue)
{
  if (rawValue >= 5) {
    LOBYTE(rawValue) = 5;
  }
  return (siriinferenced::ExitReason_optional)rawValue;
}

uint64_t ExitReason.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_10000E570(char *a1, char *a2)
{
  return sub_10000E584(*a1, *a2);
}

uint64_t sub_10000E57C()
{
  return 1;
}

BOOL sub_10000E584(char a1, char a2)
{
  return a1 == a2;
}

Swift::Int sub_10000E594()
{
  return sub_10000E59C(*v0);
}

Swift::Int sub_10000E59C(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

Swift::Int sub_10000E5E4()
{
  return Hasher._finalize()();
}

void sub_10000E620(uint64_t a1)
{
  sub_10000E648(a1, *v1);
}

uint64_t sub_10000E628()
{
  return String.hash(into:)();
}

void sub_10000E648(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000E670(uint64_t a1)
{
  return sub_10000E678(a1, *v1);
}

Swift::Int sub_10000E678(uint64_t a1, unsigned __int8 a2)
{
  return Hasher._finalize()();
}

Swift::Int sub_10000E6BC()
{
  return Hasher._finalize()();
}

siriinferenced::ExitReason_optional sub_10000E6F4@<W0>(Swift::Int32 *a1@<X0>, siriinferenced::ExitReason_optional *a2@<X8>)
{
  result.value = ExitReason.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_10000E720@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = ExitReason.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_10000E750()
{
  unint64_t result = qword_100025D08;
  if (!qword_100025D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025D08);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ExitReason(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExitReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExitReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x10000E900);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000E928(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000E930(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExitReason()
{
  return &type metadata for ExitReason;
}

ValueMetadata *type metadata accessor for Exit()
{
  return &type metadata for Exit;
}

uint64_t sub_10000E958()
{
  return String.hash(into:)();
}

void sub_10000E988(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for Signpost();
  uint64_t v11 = a5 + *(int *)(v10 + 20);
  *(void *)uint64_t v11 = a1;
  *(void *)(v11 + 8) = a2;
  *(unsigned char *)(v11 + 16) = a3;
  id v12 = a4;
  OSSignpostID.init(log:)();
  *(void *)(a5 + *(int *)(v10 + 24)) = v12;
  id v17 = v12;
  static os_signpost_type_t.begin.getter();
  sub_100006B58(&qword_100025658);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10001B0D0;
  uint64_t v14 = StaticString.description.getter();
  uint64_t v16 = v15;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = sub_100006B9C();
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v16;
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  swift_bridgeObjectRelease();
}

uint64_t sub_10000EAD0()
{
  sub_100006BE8(0, &qword_100025DA8);
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_100026280 = result;
  return result;
}

uint64_t Logger.asyncBackground(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v37 = type metadata accessor for DispatchWorkItemFlags();
  sub_100007588();
  uint64_t v40 = v2;
  __chkstk_darwin(v3);
  sub_10000968C();
  uint64_t v36 = v5 - v4;
  type metadata accessor for DispatchQoS();
  sub_100007588();
  uint64_t v38 = v7;
  uint64_t v39 = v6;
  __chkstk_darwin(v6);
  sub_10000968C();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for Logger();
  sub_100007588();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v16);
  uint64_t v17 = type metadata accessor for DispatchQoS.QoSClass();
  sub_100007588();
  uint64_t v19 = v18;
  __chkstk_darwin(v20);
  sub_10000968C();
  uint64_t v23 = v22 - v21;
  sub_100006BE8(0, (unint64_t *)&qword_100025670);
  (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v23, enum case for DispatchQoS.QoSClass.utility(_:), v17);
  uint64_t v24 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v17);
  (*(void (**)(char *, void, uint64_t))(v13 + 16))((char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v33[1], v11);
  unint64_t v25 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v26 + v25, (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  uint64_t v27 = (void *)(v26 + ((v15 + v25 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v28 = v35;
  void *v27 = v34;
  v27[1] = v28;
  aBlock[4] = sub_10000F100;
  aBlock[5] = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000685C;
  aBlock[3] = &unk_100021320;
  uint64_t v29 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v41 = &_swiftEmptyArrayStorage;
  sub_100007494();
  sub_100006B58(&qword_1000256E8);
  sub_1000074E4();
  uint64_t v31 = v36;
  uint64_t v30 = v37;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v29);

  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v31, v30);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v10, v39);
  return swift_release();
}

void sub_10000EEC0(uint64_t a1, uint64_t (*a2)(void))
{
  swift_retain_n();
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = a2();
    sub_100006C2C(v5, v6, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }
}

uint64_t sub_10000F058()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

void sub_10000F100()
{
  uint64_t v1 = *(void *)(type metadata accessor for Logger() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_10000EEC0(v0 + v2, v3);
}

uint64_t sub_10000F190(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000F1A0()
{
  return swift_release();
}

uint64_t *sub_10000F1A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for OSSignpostID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    v10[16] = v11[16];
    uint64_t v12 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v12;
    id v13 = v12;
  }
  return a1;
}

void sub_10000F290(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OSSignpostID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_10000F304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v11;
  id v12 = v11;
  return a1;
}

uint64_t sub_10000F39C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void **)(a2 + v10);
  id v12 = *(void **)(a1 + v10);
  *(void *)(a1 + v10) = v11;
  id v13 = v11;

  return a1;
}

uint64_t sub_10000F448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_10000F4DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OSSignpostID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);

  return a1;
}

uint64_t sub_10000F578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F58C);
}

uint64_t sub_10000F58C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for OSSignpostID();
  sub_10000F8E8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_1000095E4(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_10000F618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F62C);
}

void sub_10000F62C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for OSSignpostID();
  sub_10000F8E8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_100009554(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for Signpost()
{
  uint64_t result = qword_100025D68;
  if (!qword_100025D68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000F6FC()
{
  uint64_t result = type metadata accessor for OSSignpostID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000F7A0(uint64_t a1)
{
  return sub_10000F900(a1, qword_100026288);
}

uint64_t sub_10000F7AC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006ADC(v0, qword_1000262A0);
  sub_100006AA4(v0, (uint64_t)qword_1000262A0);
  if (qword_100025628 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100026280;
  return Logger.init(_:)();
}

uint64_t sub_10000F838(uint64_t a1)
{
  return sub_10000F900(a1, qword_1000262B8);
}

uint64_t sub_10000F844(uint64_t a1)
{
  return sub_10000F870(a1, qword_1000262D0);
}

uint64_t sub_10000F870(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100006ADC(v3, a2);
  sub_100006AA4(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000F900(uint64_t a1, uint64_t *a2)
{
  return sub_10000F870(a1, a2);
}

uint64_t sub_10000F914(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  sub_100007588();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_10001379C();
  uint64_t v8 = v6 - v7;
  __chkstk_darwin(v9);
  sub_10001364C();
  uint64_t v123 = v10;
  __chkstk_darwin(v11);
  id v13 = (char *)&v98 - v12;
  uint64_t v14 = sub_100006B58(&qword_100025ED8);
  __chkstk_darwin(v14 - 8);
  sub_10001379C();
  uint64_t v17 = v15 - v16;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v98 - v19;
  uint64_t v104 = type metadata accessor for Logger();
  sub_100007588();
  uint64_t v103 = v21;
  __chkstk_darwin(v22);
  sub_100013784();
  uint64_t v119 = v23;
  sub_1000135A0();
  Logger.init(subsystem:category:)();
  id v24 = [a1 matchingRecordSet];
  v105 = a1;
  id v25 = [a1 recipe];
  id v26 = [v25 recipeUserInfo];

  v102 = (long long *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000134BC(&qword_100025EE0, (void (*)(uint64_t))&type metadata accessor for UUID);
  id v106 = (id)Dictionary.init(dictionaryLiteral:)();
  id v120 = v24;
  id v27 = [v24 nativeRecordInfo];
  sub_100006B58(&qword_100025E38);
  uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v107 = v28 + 64;
  uint64_t v111 = v4;
  uint64_t v112 = v28;
  sub_100013514();
  unint64_t v32 = v31 & v30;
  uint64_t v34 = (void (**)(void))(v4 + 16);
  uint64_t v117 = v4 + 32;
  uint64_t v118 = 0;
  v116 = (void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v35 = (uint64_t)v20;
  int64_t v108 = (unint64_t)(v33 + 63) >> 6;
  int64_t v98 = v108 - 1;
  *(void *)&long long v36 = 136315138;
  long long v109 = v36;
  v114 = v20;
  uint64_t v115 = v17;
  v110 = v34;
  uint64_t v113 = v2;
  if (!v32) {
    goto LABEL_4;
  }
LABEL_2:
  uint64_t v121 = (v32 - 1) & v32;
  int64_t v122 = v29;
  unint64_t v37 = __clz(__rbit64(v32)) | (v29 << 6);
LABEL_3:
  uint64_t v38 = v112;
  sub_100013690();
  v39();
  uint64_t v40 = *(void *)(v38 + 56);
  uint64_t v41 = sub_100006B58(&qword_100025EE8);
  *(void *)(v17 + *(int *)(v41 + 48)) = *(void *)(v40 + 8 * v37);
  sub_100009554(v17, 0, 1, v41);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_10001345C(v17, v35, &qword_100025ED8);
    uint64_t v50 = sub_100006B58(&qword_100025EE8);
    if (sub_1000095E4(v35, 1, v50) == 1) {
      break;
    }
    swift_bridgeObjectRelease();
    sub_100013744();
    v51();
    id v52 = *v34;
    sub_100013690();
    v52();
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    id v124 = 0;
    id v54 = [v120 nativeRecordDataForRecordUUID:isa error:&v124];

    if (v54)
    {
      v99 = v13;
      id v63 = v124;
      uint64_t v100 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v101 = v64;

      id v65 = v106;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      id v124 = v65;
      sub_100012F00(v123);
      sub_1000137AC();
      Swift::Int v71 = v69 + v70;
      if (__OFADD__(v69, v70)) {
        goto LABEL_48;
      }
      unint64_t v72 = v67;
      char v73 = v68;
      sub_100006B58(&qword_100025EF0);
      Swift::Bool v74 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v71);
      id v13 = v99;
      v75 = v116;
      if (v74)
      {
        unint64_t v76 = sub_100012F00(v123);
        if ((v73 & 1) != (v77 & 1))
        {
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          return result;
        }
        unint64_t v72 = v76;
      }
      v78 = v124;
      id v106 = v124;
      if (v73)
      {
        uint64_t v79 = *((void *)v124 + 7) + 16 * v72;
        sub_10000E2C4(*(void *)v79, *(void *)(v79 + 8));
        uint64_t v80 = v101;
        *(void *)uint64_t v79 = v100;
        *(void *)(v79 + 8) = v80;
        uint64_t v34 = v110;
      }
      else
      {
        *((void *)v124 + (v72 >> 6) + 8) |= 1 << v72;
        uint64_t v34 = v110;
        sub_100013690();
        v52();
        v81 = (uint64_t *)(v78[7] + 16 * v72);
        uint64_t v82 = v101;
        uint64_t *v81 = v100;
        v81[1] = v82;
        uint64_t v83 = v78[2];
        BOOL v84 = __OFADD__(v83, 1);
        uint64_t v85 = v83 + 1;
        if (v84) {
          goto LABEL_49;
        }
        v78[2] = v85;
      }
      swift_bridgeObjectRelease();
      v86 = *v75;
      (*v75)(v123, v2);
      v86((uint64_t)v13, v2);
      uint64_t v17 = v115;
    }
    else
    {
      v55 = *v116;
      id v56 = v124;
      v55(v123, v2);
      _convertNSErrorToError(_:)();

      swift_willThrow();
      sub_100013690();
      v52();
      id v57 = Logger.logObject.getter();
      uint64_t v58 = v13;
      os_log_type_t v59 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v57, v59))
      {
        uint64_t v60 = swift_slowAlloc();
        id v124 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v60 = v109;
        uint64_t v61 = UUID.uuidString.getter();
        *(void *)(v60 + 4) = sub_100006C2C(v61, v62, (uint64_t *)&v124);
        swift_bridgeObjectRelease();
        v55(v8, v113);
        _os_log_impl((void *)&_mh_execute_header, v57, v59, "failure retrieving native record data for %s; skipping from collection",
          (uint8_t *)v60,
          0xCu);
        swift_arrayDestroy();
        uint64_t v2 = v113;
        swift_slowDealloc();
        uint64_t v34 = v110;
        swift_slowDealloc();
      }
      else
      {
        v55(v8, v2);
      }
      swift_errorRelease();

      v55((uint64_t)v58, v2);
      uint64_t v118 = 0;
      id v13 = v58;
      uint64_t v35 = (uint64_t)v114;
      uint64_t v17 = v115;
    }
    unint64_t v32 = v121;
    int64_t v29 = v122;
    if (v121) {
      goto LABEL_2;
    }
LABEL_4:
    int64_t v42 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
    }
    if (v42 >= v108)
    {
      int64_t v122 = v29;
      goto LABEL_9;
    }
    if (*(void *)(v107 + 8 * v42)) {
      goto LABEL_7;
    }
    if (v29 + 2 < v108)
    {
      if (*(void *)(v107 + 8 * (v29 + 2))) {
        goto LABEL_7;
      }
      if (v29 + 3 >= v108)
      {
        int64_t v122 = v29 + 2;
        goto LABEL_9;
      }
      if (*(void *)(v107 + 8 * (v29 + 3))) {
        goto LABEL_7;
      }
      uint64_t v87 = v29 + 4;
      if (v29 + 4 >= v108)
      {
        int64_t v122 = v29 + 3;
        goto LABEL_9;
      }
      if (*(void *)(v107 + 8 * v87))
      {
LABEL_7:
        sub_100013890();
        uint64_t v121 = v44;
        int64_t v122 = v43;
        unint64_t v37 = v45 + (v43 << 6);
        goto LABEL_3;
      }
      while (1)
      {
        int64_t v88 = v87 + 1;
        if (__OFADD__(v87, 1)) {
          goto LABEL_50;
        }
        if (v88 >= v108) {
          break;
        }
        ++v87;
        if (*(void *)(v107 + 8 * v88)) {
          goto LABEL_7;
        }
      }
      int64_t v42 = v98;
    }
    int64_t v122 = v42;
LABEL_9:
    sub_100006B58(&qword_100025EE8);
    uint64_t v46 = sub_1000138CC();
    sub_100009554(v46, v47, v48, v49);
    uint64_t v121 = 0;
  }
  swift_release();
  uint64_t v89 = v118;
  sub_100010334(v102, (uint64_t)v106);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v89)
  {
    v90 = (void *)_convertErrorToNSError(_:)();
    v91 = (void *)sub_100013800();
    [v91 v92];

    swift_errorRelease();
  }
  else
  {
    v90 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v93 = (void *)sub_100013800();
    [v93 v94];
  }
  uint64_t v95 = v104;
  uint64_t v96 = v103;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v96 + 8))(v119, v95);
}

uint64_t sub_100010334(long long *a1, uint64_t a2)
{
  uint64_t v303 = a2;
  uint64_t v3 = type metadata accessor for CustomSignalType();
  sub_100007588();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_1000138B8();
  sub_100013504();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v259 - v8;
  uint64_t v10 = sub_100006B58(&qword_100025E50);
  __chkstk_darwin(v10 - 8);
  sub_1000138A4();
  sub_1000137BC(v11);
  uint64_t v12 = type metadata accessor for CustomSignal();
  sub_100007588();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_1000138A4();
  sub_1000137BC(v16);
  uint64_t v304 = type metadata accessor for UUID();
  sub_100007588();
  uint64_t v302 = v17;
  __chkstk_darwin(v18);
  sub_10001379C();
  uint64_t v21 = v19 - v20;
  __chkstk_darwin(v22);
  sub_10001364C();
  sub_100013504();
  __chkstk_darwin(v23);
  sub_10001364C();
  sub_100013504();
  __chkstk_darwin(v24);
  sub_10001364C();
  sub_100013504();
  __chkstk_darwin(v25);
  sub_10001364C();
  sub_100013504();
  __chkstk_darwin(v26);
  sub_10001364C();
  sub_100013504();
  __chkstk_darwin(v27);
  int64_t v29 = (char *)v259 - v28;
  uint64_t v30 = sub_100006B58(&qword_100025E58);
  __chkstk_darwin(v30 - 8);
  sub_1000138B8();
  sub_100013504();
  __chkstk_darwin(v31);
  sub_10001364C();
  sub_100013504();
  __chkstk_darwin(v32);
  sub_10001364C();
  sub_100013504();
  __chkstk_darwin(v33);
  sub_1000137BC((uint64_t)v259 - v34);
  uint64_t v280 = type metadata accessor for Logger();
  sub_100007588();
  uint64_t v279 = v35;
  __chkstk_darwin(v36);
  sub_100013784();
  uint64_t v305 = v37;
  sub_1000135A0();
  Logger.init(subsystem:category:)();
  v278 = a1;
  sub_10001238C(1701667182, 0xE400000000000000, (uint64_t)a1, &v315);
  if (!*((void *)&v316 + 1))
  {
    sub_100012F98((uint64_t)&v315, &qword_100025E60);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  *(void *)&long long v295 = v12;
  a1 = (long long *)*((void *)&v312 + 1);
  if ((void)v312 != 0x536F747541736D73 || *((void *)&v312 + 1) != 0xEB00000000646E65)
  {
    char v39 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v39) {
      goto LABEL_69;
    }
LABEL_10:
    unint64_t v292 = v21;
    uint64_t v296 = sub_100006B58(&qword_100025E38);
    uint64_t v40 = Dictionary.init(dictionaryLiteral:)();
    sub_100013750(v40, (uint64_t)v314);
    uint64_t v289 = v41;
    sub_100013514();
    unint64_t v44 = v43 & v42;
    sub_1000136B8();
    uint64_t v306 = v45;
    v300 = (v46 + 32);
    v299 = (void (**)(void))(v46 + 8);
    uint64_t v294 = v47;
    *(void *)&long long v281 = v47 - 1;
    uint64_t v48 = 0;
    v283 = (void (**)(void))(swift_bridgeObjectRetain() + 104);
    *(void *)&long long v49 = 136315138;
    long long v295 = v49;
    v288 = (char *)&type metadata for Any + 8;
    unint64_t v286 = 0xD00000000000002ELL;
    unint64_t v285 = 0x800000010001BFA0;
    long long v284 = xmmword_10001B0D0;
    uint64_t v50 = v304;
    v51 = v293;
    uint64_t v52 = v301;
LABEL_11:
    uint64_t v53 = v298;
    if (v44)
    {
LABEL_12:
      unint64_t v54 = __clz(__rbit64(v44));
      uint64_t v55 = (v44 - 1) & v44;
      unint64_t v56 = v54 | (v48 << 6);
      goto LABEL_13;
    }
    while (1)
    {
      if (__OFADD__(v48, 1))
      {
        __break(1u);
LABEL_176:
        __break(1u);
LABEL_177:
        __break(1u);
LABEL_178:
        __break(1u);
LABEL_179:
        __break(1u);
      }
      sub_1000135EC();
      if (v63 == v64) {
        goto LABEL_23;
      }
      sub_1000136A0();
      if (v66) {
        goto LABEL_18;
      }
      if (v65 + 1 >= v294) {
        break;
      }
      unint64_t v66 = *(void *)(v289 + 8 * (v65 + 1));
      if (v66)
      {
        ++v65;
        goto LABEL_18;
      }
      if (v65 + 2 >= v294)
      {
        uint64_t v48 = v65 + 1;
        goto LABEL_23;
      }
      unint64_t v66 = *(void *)(v289 + 8 * (v65 + 2));
      if (v66)
      {
        v65 += 2;
        goto LABEL_18;
      }
      sub_1000135EC();
      if (v63 == v64)
      {
        uint64_t v48 = v105;
        goto LABEL_23;
      }
      sub_1000136A0();
      if (v66) {
        goto LABEL_18;
      }
      do
      {
        sub_1000135EC();
        if (v63 == v64)
        {
          uint64_t v48 = v281;
          goto LABEL_23;
        }
        unint64_t v66 = (unint64_t)v283[v48++];
      }
      while (!v66);
      uint64_t v65 = v48 + 4;
LABEL_18:
      uint64_t v55 = (v66 - 1) & v66;
      unint64_t v56 = __clz(__rbit64(v66)) + (v65 << 6);
      uint64_t v48 = v65;
LABEL_13:
      sub_1000135C8();
      sub_100013684();
      v57();
      uint64_t v58 = (uint64_t *)(*((void *)a1 + 7) + 16 * v56);
      uint64_t v59 = sub_100006B58(&qword_100025E68);
      uint64_t v60 = (uint64_t *)(v53 + *(int *)(v59 + 48));
      uint64_t v61 = *v58;
      unint64_t v62 = v58[1];
      uint64_t *v60 = v61;
      v60[1] = v62;
      sub_100009554(v53, 0, 1, v59);
      sub_100012DE8(v61, v62);
LABEL_24:
      sub_10001345C(v53, v52, &qword_100025E58);
      uint64_t v71 = sub_100006B58(&qword_100025E68);
      if (sub_1000095E4(v52, 1, v71) == 1)
      {
        swift_release();
        sub_1000135F8(&v315);
        if (*((void *)&v316 + 1))
        {
          swift_dynamicCast();
          sub_10001392C();
          if (v118 && (v312 & 1) != 0)
          {
            uint64_t v119 = swift_bridgeObjectRetain();
            uint64_t v120 = sub_100012A28(v119);
            if (&qword_100025E68)
            {
              swift_bridgeObjectRelease();
              uint64_t v121 = sub_100013588();
              os_log_type_t v122 = static os_log_type_t.error.getter();
              if (os_log_type_enabled((os_log_t)v121, v122))
              {
                *(_WORD *)sub_10000CAC4() = 0;
                sub_100013814((void *)&_mh_execute_header, v123, v124, "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_1000075A4();
              }

              sub_100012704(v48, &qword_100025E38);
              sub_1000138F4();
LABEL_169:
              swift_errorRelease();
            }
            else
            {
              uint64_t v121 = v120;
              swift_bridgeObjectRelease_n();
            }
LABEL_172:
            (*(void (**)(uint64_t, uint64_t))(v279 + 8))(v305, v280);
            return v121;
          }
        }
        else
        {
          sub_100012F98((uint64_t)&v315, &qword_100025E60);
          sub_10001392C();
        }
        sub_100012704(v48, &qword_100025E38);
        uint64_t v121 = v125;
LABEL_67:
        swift_bridgeObjectRelease();
        goto LABEL_172;
      }
      unint64_t v308 = v55;
      uint64_t v309 = v48;
      uint64_t v72 = *(void *)(v52 + *(int *)(v71 + 48) + 8);
      sub_100013744();
      v73();
      Swift::Bool v74 = self;
      uint64_t v307 = v72;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      *(void *)&long long v315 = 0;
      id v76 = [v74 JSONObjectWithData:isa options:0 error:&v315];

      if (v76)
      {
        id v77 = (id)v315;
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        if (swift_dynamicCast())
        {
          uint64_t v78 = v312;
          if (*(void *)(v312 + 16))
          {
            a1 = (long long *)v312;
            unint64_t v79 = sub_100012E88(0x79546C616E676973, 0xEA00000000006570);
            if (v80)
            {
              sub_100006EA8(*(void *)(v78 + 56) + 32 * v79, (uint64_t)&v315);
              swift_bridgeObjectRelease();
              sub_100012F98((uint64_t)&v315, &qword_100025E60);
              sub_1000136AC();
              v81 = v290;
              sub_100013684();
              v82();
              uint64_t v83 = sub_100013588();
              os_log_type_t v84 = static os_log_type_t.debug.getter();
              if (sub_100013728(v84))
              {
                uint64_t v85 = sub_1000136E8();
                uint64_t v86 = sub_1000136D0();
                sub_100013710(v86);
                uint64_t v87 = UUID.uuidString.getter();
                a1 = (long long *)v88;
                *(void *)(v85 + 4) = sub_100006C2C(v87, v88, (uint64_t *)&v315);
                swift_bridgeObjectRelease();
                sub_100013700();
                v51 = v293;
                sub_10001390C();
                ((void (*)(void))a1)();
                _os_log_impl((void *)&_mh_execute_header, v83, (os_log_type_t)v52, "Record %s looks like a CustomSignal, skipping", (uint8_t *)v85, 0xCu);
                swift_arrayDestroy();
                uint64_t v50 = v304;
                sub_1000075A4();
                sub_1000075A4();
              }
              else
              {
                sub_100013700();
                ((void (*)(char *, uint64_t))a1)(v81, v50);
              }
              sub_100013530();

              ((void (*)(NSObject *, uint64_t))a1)(v51, v50);
              goto LABEL_41;
            }
          }
          long long v315 = 0u;
          long long v316 = 0u;
          sub_100012F98((uint64_t)&v315, &qword_100025E60);
          id v106 = sub_100013588();
          os_log_type_t v107 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v106, v107))
          {
            int64_t v108 = (uint8_t *)sub_10000CAC4();
            *(_WORD *)int64_t v108 = 0;
            _os_log_impl((void *)&_mh_execute_header, v106, v107, "SiriInference dodML plugin ran succesfully", v108, 2u);
            sub_1000075A4();
          }

          sub_100012E40(24);
          swift_bridgeObjectRelease();
          v282 = (void (**)(void (**)(void), uint64_t))String._bridgeToObjectiveC()();
          sub_100006B58(&qword_100025E70);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = v284;
          *(void *)(inited + 32) = 0x656D6F6374756FLL;
          *(void *)(inited + 40) = 0xE700000000000000;
          sub_100006BE8(0, &qword_100025E78);
          *(void *)(inited + 48) = NSString.init(stringLiteral:)();
          sub_100006BE8(0, (unint64_t *)&qword_100025E80);
          Dictionary.init(dictionaryLiteral:)();
          Class v110 = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          uint64_t v111 = v282;
          AnalyticsSendEvent();

          uint64_t v112 = UUID.uuidString.getter();
          uint64_t v50 = v113;
          uint64_t v114 = v287;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v315 = v114;
          a1 = &v315;
          sub_100012FFC(v78, v112, v50, isUniquelyReferenced_nonNull_native, &qword_100025ED0);
          uint64_t v287 = v315;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100013530();
          uint64_t v116 = sub_100013628();
          v117(v116);
          uint64_t v48 = v309;
          unint64_t v44 = v308;
          goto LABEL_11;
        }
        sub_1000136AC();
        sub_100013684();
        v96();
        v97 = sub_100013588();
        os_log_type_t v98 = static os_log_type_t.debug.getter();
        if (sub_100013728(v98))
        {
          uint64_t v99 = sub_1000136E8();
          uint64_t v100 = sub_1000136D0();
          sub_100013710(v100);
          uint64_t v101 = UUID.uuidString.getter();
          a1 = (long long *)v102;
          *(void *)(v99 + 4) = sub_100006C2C(v101, v102, (uint64_t *)&v315);
          swift_bridgeObjectRelease();
          sub_100013700();
          sub_10001390C();
          ((void (*)(void))a1)();
          _os_log_impl((void *)&_mh_execute_header, v97, (os_log_type_t)v52, "Couldn't decode data for %s into a record, skipping", (uint8_t *)v99, 0xCu);
          swift_arrayDestroy();
          uint64_t v50 = v304;
          sub_1000075A4();
          uint64_t v53 = v298;
          sub_1000075A4();
          sub_100013530();

          ((void (*)(NSObject *, uint64_t))a1)(v51, v50);
        }
        else
        {
          sub_100013530();
          a1 = (long long *)v299;
          uint64_t v104 = *v299;
          sub_100013578();
          v104();

          ((void (*)(NSObject *, uint64_t))v104)(v51, v50);
        }
        uint64_t v52 = v301;
      }
      else
      {
        id v89 = (id)v315;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        sub_1000136AC();
        sub_100013684();
        v90();
        v91 = sub_100013588();
        os_log_type_t v92 = static os_log_type_t.error.getter();
        if (sub_100013728(v92))
        {
          uint64_t v93 = sub_1000136E8();
          *(void *)&long long v315 = sub_1000136D0();
          *(_DWORD *)uint64_t v93 = v295;
          uint64_t v94 = UUID.uuidString.getter();
          *(void *)(v93 + 4) = sub_100006C2C(v94, v95, (uint64_t *)&v315);
          swift_bridgeObjectRelease();
          a1 = (long long *)*v299;
          sub_100013658();
          ((void (*)(void))a1)();
          _os_log_impl((void *)&_mh_execute_header, v91, (os_log_type_t)v52, "Unable to decode record %s, skipping", (uint8_t *)v93, 0xCu);
          swift_arrayDestroy();
          v51 = v293;
          sub_1000075A4();
          uint64_t v50 = v304;
          sub_1000075A4();
          sub_100013530();
          swift_errorRelease();

          sub_100013658();
          ((void (*)(void))a1)();
        }
        else
        {
          sub_100013530();
          a1 = (long long *)v299;
          uint64_t v103 = *v299;
          sub_100013578();
          v103();
          swift_errorRelease();

          ((void (*)(NSObject *, uint64_t))v103)(v51, v50);
        }
        uint64_t v297 = 0;
LABEL_41:
        uint64_t v53 = v298;
        uint64_t v52 = v301;
      }
      uint64_t v48 = v309;
      unint64_t v44 = v308;
      if (v308) {
        goto LABEL_12;
      }
    }
    uint64_t v48 = v65;
LABEL_23:
    sub_100006B58(&qword_100025E68);
    uint64_t v67 = sub_1000138CC();
    sub_100009554(v67, v68, v69, v70);
    uint64_t v55 = 0;
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
LABEL_69:
  v290 = v9;
  type metadata accessor for JSONDecoder();
  v126 = swift_allocObject();
  uint64_t v301 = JSONDecoder.init()();
  sub_100006B58(&qword_100025E88);
  uint64_t v127 = Dictionary.init(dictionaryLiteral:)();
  sub_100013750(v127, (uint64_t)&v294);
  uint64_t v277 = v128;
  sub_100013514();
  unint64_t v131 = v130 & v129;
  sub_1000136B8();
  uint64_t v307 = v132;
  uint64_t v298 = (uint64_t)&v133[4];
  v293 = v133 + 1;
  unint64_t v286 = v14 + 32;
  LODWORD(v285) = enum case for CustomSignalType.messagesAutoSend(_:);
  *(void *)&long long v284 = v5 + 104;
  v283 = (void (**)(void))(v5 + 8);
  v282 = (void (**)(void (**)(void), uint64_t))(v14 + 8);
  uint64_t v291 = v134;
  uint64_t v262 = v134 - 1;
  uint64_t v263 = swift_bridgeObjectRetain() + 104;
  *(void *)&long long v135 = 136315138;
  long long v281 = v135;
  v267 = (char *)&type metadata for Any + 8;
  v264 = (char *)&type metadata for Swift.AnyObject + 8;
  v136 = (uint8_t *)v304;
  uint64_t v287 = v3;
  uint64_t v137 = v295;
  uint64_t v138 = v294;
  sub_100013920();
  v274 = v29;
  while (1)
  {
    while (1)
    {
      if (v131)
      {
        uint64_t v140 = v21;
        sub_1000137D8();
        unint64_t v308 = v131;
        uint64_t v309 = v141;
        uint64_t v143 = v142 | (v141 << 6);
LABEL_72:
        sub_1000135C8();
        sub_100013684();
        v144();
        v145 = (uint64_t *)((char *)v126[7].isa + 16 * v143);
        uint64_t v146 = sub_100006B58(&qword_100025E68);
        v147 = (uint64_t *)(v138 + *(int *)(v146 + 48));
        uint64_t v148 = *v145;
        unint64_t v149 = v145[1];
        uint64_t *v147 = v148;
        v147[1] = v149;
        sub_100009554(v138, 0, 1, v146);
        sub_100012DE8(v148, v149);
        v126 = v300;
        uint64_t v21 = v140;
        goto LABEL_80;
      }
      if (__OFADD__(v139, 1)) {
        goto LABEL_176;
      }
      sub_1000135EC();
      if (v63 != v64)
      {
        sub_1000136A0();
        v126 = v300;
        if (v152) {
          goto LABEL_77;
        }
        if (v151 + 1 >= v291)
        {
LABEL_161:
          uint64_t v309 = v151;
          goto LABEL_79;
        }
        if (*(void *)(v277 + 8 * (v151 + 1)))
        {
          uint64_t v140 = v21;
LABEL_78:
          sub_100013890();
          unint64_t v308 = v153;
          uint64_t v143 = v155 + (v154 << 6);
          uint64_t v309 = v154;
          goto LABEL_72;
        }
        if (v151 + 2 >= v291)
        {
          uint64_t v309 = v151 + 1;
        }
        else
        {
          if (*(void *)(v277 + 8 * (v151 + 2)))
          {
            uint64_t v140 = v21;
            goto LABEL_78;
          }
          sub_1000135EC();
          if (v63 != v64)
          {
            sub_1000136A0();
            if (v208)
            {
LABEL_77:
              uint64_t v140 = v21;
            }
            else
            {
              do
              {
                sub_1000135EC();
                if (v63 == v64)
                {
                  uint64_t v151 = v262;
                  goto LABEL_161;
                }
              }
              while (!*(void *)(v263 + 8 * v209));
              uint64_t v140 = v21;
            }
            goto LABEL_78;
          }
          uint64_t v309 = v207;
        }
      }
      else
      {
        uint64_t v309 = v150;
        v126 = v300;
      }
LABEL_79:
      uint64_t v156 = sub_100006B58(&qword_100025E68);
      sub_100009554(v138, 1, 1, v156);
      unint64_t v308 = 0;
LABEL_80:
      sub_10001345C(v138, (uint64_t)v126, &qword_100025E58);
      uint64_t v121 = sub_100006B58(&qword_100025E68);
      if (sub_1000095E4((uint64_t)v126, 1, v121) == 1)
      {
        swift_release();
        sub_1000135F8(&v312);
        if (v313)
        {
          int v251 = swift_dynamicCast();
          uint64_t v252 = v266;
          if (v251 && (v310 & 1) != 0)
          {
            uint64_t v253 = swift_bridgeObjectRetain();
            unint64_t v254 = sub_1000123F0(v253);
            swift_bridgeObjectRelease();
            sub_100012A28(v254);
            if (v21)
            {
              swift_bridgeObjectRelease();
              uint64_t v121 = sub_100013588();
              os_log_type_t v255 = static os_log_type_t.error.getter();
              if (os_log_type_enabled((os_log_t)v121, v255))
              {
                *(_WORD *)sub_10000CAC4() = 0;
                sub_100013814((void *)&_mh_execute_header, v256, v257, "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_1000075A4();
              }

              sub_100012704(v252, &qword_100025E88);
              sub_1000138F4();
              swift_release();
              goto LABEL_169;
            }
            sub_1000138F4();
            swift_release();
            goto LABEL_67;
          }
        }
        else
        {
          sub_100012F98((uint64_t)&v312, &qword_100025E60);
          uint64_t v252 = v266;
        }
        sub_100012704(v252, &qword_100025E88);
        sub_1000138F4();
        swift_release();
        goto LABEL_172;
      }
      v157 = (uint64_t *)((char *)v126 + *(int *)(v121 + 48));
      uint64_t v158 = *v157;
      unint64_t v159 = v157[1];
      sub_100013744();
      v160();
      sub_1000134BC(&qword_100025E90, (void (*)(uint64_t))&type metadata accessor for CustomSignal);
      uint64_t v161 = v296;
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      if (!v21) {
        break;
      }
      swift_errorRelease();
      sub_100009554(v161, 1, 1, v137);
      sub_100012F98(v161, &qword_100025E50);
      sub_1000136AC();
      sub_100013684();
      v162();
      v163 = sub_100013588();
      os_log_type_t v164 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v163, v164))
      {
        uint64_t v165 = sub_1000136E8();
        uint64_t v166 = sub_1000136D0();
        *(_DWORD *)uint64_t v165 = sub_1000138E0(v166).n128_u32[0];
        uint64_t v167 = UUID.uuidString.getter();
        *(void *)(v165 + 4) = sub_100006C2C(v167, v168, (uint64_t *)&v312);
        swift_bridgeObjectRelease();
        uint64_t v306 = v158;
        v126 = v293->isa;
        sub_100013658();
        ((void (*)(void))v126)();
        _os_log_impl((void *)&_mh_execute_header, v163, v164, "Unable to decode %s to CustomSignal, so not an SMS record", (uint8_t *)v165, 0xCu);
        swift_arrayDestroy();
        sub_1000075A4();
        v136 = (uint8_t *)v304;
        sub_1000075A4();
        sub_100013768();

        sub_100013658();
        ((void (*)(void))v126)();
      }
      else
      {
        sub_10000E2C4(v158, v159);
        v126 = v293;
        v187 = (void (*)(void))v293->isa;
        sub_100013578();
        v187();

        ((void (*)(char *, uint8_t *))v187)(v29, v136);
      }
      uint64_t v21 = 0;
      uint64_t v137 = v295;
      uint64_t v138 = v294;
LABEL_93:
      uint64_t v139 = v309;
      unint64_t v131 = v308;
    }
    uint64_t v306 = v158;
    unint64_t v292 = v159;
    uint64_t v297 = 0;
    sub_100009554(v161, 0, 1, v137);
    sub_100013744();
    v169();
    v170 = v290;
    CustomSignal.signalType.getter();
    sub_1000136AC();
    uint64_t v137 = (uint64_t)v288;
    uint64_t v171 = v287;
    v172(v288, v285, v287);
    sub_1000134BC(&qword_100025E98, (void (*)(uint64_t))&type metadata accessor for CustomSignalType);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if ((void)v312 == v310 && *((void *)&v312 + 1) == v311)
    {
      swift_bridgeObjectRelease_n();
      v188 = *v283;
      sub_100013658();
      v188();
      ((void (*)(char *, uint64_t))v188)(v170, v171);
    }
    else
    {
      char v174 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v175 = *v283;
      sub_100013658();
      v175();
      sub_100013658();
      v175();
      if ((v174 & 1) == 0)
      {
        sub_1000136AC();
        v176 = (uint8_t *)v304;
        sub_100013684();
        v177();
        uint64_t v21 = sub_100013588();
        os_log_type_t v178 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled((os_log_t)v21, v178))
        {
          uint64_t v137 = sub_1000136E8();
          uint64_t v179 = sub_1000136D0();
          *(_DWORD *)uint64_t v137 = sub_1000138E0(v179).n128_u32[0];
          uint64_t v180 = UUID.uuidString.getter();
          *(void *)(v137 + 4) = sub_100006C2C(v180, v181, (uint64_t *)&v312);
          swift_bridgeObjectRelease();
          v126 = v293;
          v182 = (void (*)(uint64_t))v293->isa;
          uint64_t v183 = sub_100013848();
          v182(v183);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, v178, "Record %s was not an SMS auto-send record, skipping", (uint8_t *)v137, 0xCu);
          swift_arrayDestroy();
          sub_1000075A4();
          sub_1000075A4();
          sub_10001385C();

          uint64_t v184 = sub_10001354C();
          v185(v184);
          int64_t v29 = v274;
          uint64_t v186 = sub_100013848();
          v182(v186);
          sub_100013920();
          v136 = v176;
        }
        else
        {
          sub_10001385C();

          v126 = v293;
          v136 = v176;
          v199 = v274;
          v200 = (void (*)(void))v293->isa;
          sub_100013578();
          v200();
          uint64_t v201 = sub_10001354C();
          v202(v201);
          sub_100013578();
          v200();
          sub_100013920();
          int64_t v29 = v199;
        }
        goto LABEL_93;
      }
    }
    uint64_t v137 = sub_100006BE8(0, &qword_100025EA0);
    uint64_t v189 = sub_100006BE8(0, &qword_100025E78);
    uint64_t v190 = sub_100006BE8(0, &qword_100025EA8);
    v136 = (uint8_t *)CustomSignal.item.getter();
    unint64_t v192 = v191;
    uint64_t v193 = v297;
    uint64_t v194 = static NSKeyedUnarchiver.unarchivedDictionary<A, B>(ofKeyClass:objectClass:from:)();
    if (!v193) {
      break;
    }
    swift_errorRelease();
    sub_10000E2C4((uint64_t)v136, v192);
    uint64_t v297 = 0;
    sub_100013834();
LABEL_98:
    v126 = sub_100013588();
    os_log_type_t v196 = static os_log_type_t.error.getter();
    uint64_t v21 = v196;
    if (os_log_type_enabled(v126, v196))
    {
      v136 = (uint8_t *)sub_10000CAC4();
      *(_WORD *)v136 = 0;
      _os_log_impl((void *)&_mh_execute_header, v126, (os_log_type_t)v21, "SiriInference dodML plugin tried to decode smsAutoSend record but failed - skipping", v136, 2u);
      sub_1000075A4();
    }
    sub_100013768();

LABEL_101:
    (*v282)(v299, v137);
    uint64_t v197 = sub_100013628();
    v198(v197);
    sub_100013920();
    uint64_t v139 = v309;
    unint64_t v131 = v308;
    uint64_t v138 = v294;
  }
  uint64_t v195 = v194;
  uint64_t v275 = v190;
  uint64_t v276 = v189;
  uint64_t v297 = 0;
  sub_10000E2C4((uint64_t)v136, v192);
  sub_100013834();
  if (!v195) {
    goto LABEL_98;
  }
  uint64_t v273 = Dictionary.init(dictionaryLiteral:)();
  if ((v195 & 0xC000000000000001) != 0)
  {
    uint64_t v203 = __CocoaDictionary.makeIterator()();
    uint64_t v261 = 0;
    uint64_t v204 = 0;
    id v270 = 0;
    unint64_t v205 = 0;
    unint64_t v206 = v203 | 0x8000000000000000;
  }
  else
  {
    sub_100013414(v195, &v315);
    uint64_t v261 = *((void *)&v315 + 1);
    unint64_t v206 = v315;
    id v270 = (id)*((void *)&v316 + 1);
    uint64_t v204 = v316;
    unint64_t v205 = v317;
  }
  v259[0] = v204;
  swift_bridgeObjectRetain();
  v259[2] = v206 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v260 = (unint64_t)(v204 + 64) >> 6;
  v259[1] = v195;
  unint64_t v210 = v206;
  unint64_t v265 = v206;
  id v211 = v270;
  while (2)
  {
    id v270 = v211;
    if ((v210 & 0x8000000000000000) != 0)
    {
      uint64_t v213 = __CocoaDictionary.Iterator.next()();
      if (!v213) {
        goto LABEL_160;
      }
      uint64_t v215 = v214;
      uint64_t v310 = v213;
      swift_unknownObjectRetain();
      id v269 = (id)v205;
      swift_dynamicCast();
      id v216 = (id)v312;
      swift_unknownObjectRelease();
      uint64_t v310 = v215;
      swift_unknownObjectRetain();
      uint64_t v217 = (uint64_t)v269;
      swift_dynamicCast();
      id v218 = (id)v312;
      swift_unknownObjectRelease();
      id v272 = v270;
      uint64_t v271 = v217;
    }
    else
    {
      if (v205)
      {
        uint64_t v271 = (v205 - 1) & v205;
        unint64_t v212 = __clz(__rbit64(v205)) | ((void)v211 << 6);
        id v272 = v211;
      }
      else
      {
        if (__OFADD__(v211, 1)) {
          goto LABEL_179;
        }
        sub_1000135EC();
        if (v63 == v64)
        {
LABEL_160:
          sub_100012FF4();
          swift_bridgeObjectRelease();
          uint64_t v21 = UUID.uuidString.getter();
          v136 = v248;
          uint64_t v249 = v266;
          char v250 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v312 = v249;
          v126 = &v312;
          sub_100012FFC(v273, v21, (uint64_t)v136, v250, &qword_100025EB8);
          uint64_t v266 = v312;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100013768();
          goto LABEL_101;
        }
        sub_1000136A0();
        uint64_t v221 = v220;
        if (!v219)
        {
          sub_100013664();
          if (v63 == v64) {
            goto LABEL_160;
          }
          sub_100013674();
          if (!v219)
          {
            sub_100013664();
            if (v63 == v64) {
              goto LABEL_160;
            }
            sub_100013674();
            if (!v219)
            {
              sub_100013664();
              if (v63 == v64) {
                goto LABEL_160;
              }
              sub_100013674();
              if (!v219)
              {
                sub_100013664();
                if (v63 == v64) {
                  goto LABEL_160;
                }
                sub_100013674();
                if (!v219)
                {
                  uint64_t v221 = v222 + 5;
                  if (v222 + 5 >= v260) {
                    goto LABEL_160;
                  }
                  unint64_t v219 = *(void *)(v261 + 8 * v221);
                  if (!v219)
                  {
                    do
                    {
                      sub_1000135EC();
                      if (v63 == v64) {
                        goto LABEL_160;
                      }
                      sub_1000136A0();
                      uint64_t v224 = v223 + 1;
                    }
                    while (!v219);
                    uint64_t v221 = v224 - 1;
                  }
                }
              }
            }
          }
        }
        uint64_t v271 = (v219 - 1) & v219;
        id v272 = (id)v221;
        unint64_t v212 = __clz(__rbit64(v219)) + (v221 << 6);
      }
      v225 = *(void **)(*(void *)(v210 + 56) + 8 * v212);
      id v216 = *(id *)(*(void *)(v210 + 48) + 8 * v212);
      id v218 = v225;
    }
    if (!v216) {
      goto LABEL_160;
    }
    id v268 = v216;
    uint64_t v226 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v228 = v227;
    id v270 = v218;
    id v269 = [v218 integerValue];
    uint64_t v229 = v273;
    char v230 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v312 = v229;
    uint64_t v231 = v226;
    sub_100012E88(v226, v228);
    sub_1000137AC();
    Swift::Int v236 = v234 + v235;
    if (__OFADD__(v234, v235)) {
      goto LABEL_177;
    }
    unint64_t v237 = v232;
    v238 = v233;
    sub_100006B58(&qword_100025EB0);
    Swift::Bool v239 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v230, v236);
    uint64_t v137 = v295;
    if (!v239)
    {
LABEL_155:
      uint64_t v242 = v312;
      uint64_t v273 = v312;
      if (v238)
      {
        sub_10001387C();
        sub_1000137EC();
        v243 = v270;
      }
      else
      {
        *(void *)(v312 + 8 * (v237 >> 6) + 64) |= 1 << v237;
        v244 = (uint64_t *)(*(void *)(v242 + 48) + 16 * v237);
        uint64_t *v244 = v231;
        v244[1] = v228;
        sub_10001387C();
        uint64_t v246 = *(void *)(v245 + 16);
        BOOL v64 = __OFADD__(v246, 1);
        uint64_t v247 = v246 + 1;
        v243 = v270;
        if (v64) {
          goto LABEL_178;
        }
        *(void *)(v245 + 16) = v247;
        swift_bridgeObjectRetain();
        sub_1000137EC();
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v211 = v238;
      unint64_t v205 = v271;
      unint64_t v210 = v265;
      continue;
    }
    break;
  }
  unint64_t v240 = sub_100012E88(v231, v228);
  if ((v238 & 1) == (v241 & 1))
  {
    unint64_t v237 = v240;
    goto LABEL_155;
  }
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

double sub_10001238C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_100012E88(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_100006EA8(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

unint64_t sub_1000123F0(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100006B58(&qword_100025EC0);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v33 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v8 = (uint64_t *)&unk_100025E88;
  uint64_t v9 = (uint64_t *)&unk_100025E38;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v10 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v11 = v10 | (v7 << 6);
      }
      else
      {
        int64_t v12 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_34;
        }
        if (v12 >= v32)
        {
LABEL_31:
          sub_100012FF4();
          return (unint64_t)v2;
        }
        unint64_t v13 = *(void *)(v33 + 8 * v12);
        int64_t v14 = v7 + 1;
        if (!v13)
        {
          int64_t v14 = v7 + 2;
          if (v7 + 2 >= v32) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v33 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v7 + 3;
            if (v7 + 3 >= v32) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v33 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v7 + 4;
              if (v7 + 4 >= v32) {
                goto LABEL_31;
              }
              unint64_t v13 = *(void *)(v33 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v7 + 5;
                if (v7 + 5 >= v32) {
                  goto LABEL_31;
                }
                unint64_t v13 = *(void *)(v33 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_35;
                    }
                    if (v14 >= v32) {
                      goto LABEL_31;
                    }
                    unint64_t v13 = *(void *)(v33 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v14 = v7 + 5;
              }
            }
          }
        }
LABEL_25:
        unint64_t v5 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v7 = v14;
      }
      uint64_t v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100006B58(v8);
      sub_100006B58(v9);
      swift_dynamicCast();
      unint64_t result = sub_100012E88(v18, v17);
      unint64_t v19 = result;
      if ((v20 & 1) == 0) {
        break;
      }
      unint64_t v21 = v5;
      uint64_t v22 = v1;
      int64_t v23 = v7;
      uint64_t v24 = v9;
      uint64_t v25 = v8;
      uint64_t v26 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v26 = v18;
      v26[1] = v17;
      uint64_t v8 = v25;
      uint64_t v9 = v24;
      int64_t v7 = v23;
      uint64_t v1 = v22;
      unint64_t v5 = v21;
      uint64_t v27 = v2[7];
      unint64_t result = swift_bridgeObjectRelease();
      *(void *)(v27 + 8 * v19) = v34;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v28 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v28 = v18;
    v28[1] = v17;
    *(void *)(v2[7] + 8 * result) = v34;
    uint64_t v29 = v2[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_33;
    }
    v2[2] = v31;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_100012704(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100006B58(&qword_100025EC8);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v36 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v35 = (unint64_t)(63 - v4) >> 6;
  int64_t v7 = &v41;
  uint64_t v8 = &v43;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  unint64_t v10 = (char *)&type metadata for Any + 8;
  while (1)
  {
    while (1)
    {
      if (v6)
      {
        sub_1000137D8();
        unint64_t v12 = v11 | (v9 << 6);
      }
      else
      {
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_38;
        }
        if (v13 >= v35)
        {
LABEL_35:
          sub_100012FF4();
          return;
        }
        unint64_t v14 = *(void *)(v36 + 8 * v13);
        int64_t v15 = v9 + 1;
        if (!v14)
        {
          sub_1000137CC();
          if (v16 == v17) {
            goto LABEL_35;
          }
          sub_100013940();
          if (!v14)
          {
            sub_1000137CC();
            if (v16 == v17) {
              goto LABEL_35;
            }
            sub_100013940();
            if (!v14)
            {
              sub_1000137CC();
              if (v16 == v17) {
                goto LABEL_35;
              }
              sub_100013940();
              if (!v14)
              {
                int64_t v19 = v18 + 4;
                if (v19 >= v35) {
                  goto LABEL_35;
                }
                unint64_t v14 = *(void *)(v36 + 8 * v19);
                if (!v14)
                {
                  while (!__OFADD__(v19, 1))
                  {
                    sub_1000137CC();
                    if (v16 == v17) {
                      goto LABEL_35;
                    }
                    sub_100013940();
                    int64_t v19 = v20 + 1;
                    if (v14) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                int64_t v15 = v19;
              }
            }
          }
        }
LABEL_29:
        uint64_t v6 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v9 = v15;
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v12);
      uint64_t v39 = *v21;
      uint64_t v40 = v21[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100006B58(a2);
      swift_dynamicCast();
      sub_10001344C(v7, v8);
      sub_10001344C(v8, v44);
      sub_10001344C(v44, &v42);
      unint64_t v22 = sub_100012E88(v39, v40);
      unint64_t v23 = v22;
      if ((v24 & 1) == 0) {
        break;
      }
      uint64_t v37 = v6;
      uint64_t v25 = v8;
      uint64_t v26 = v7;
      uint64_t v27 = v2;
      uint64_t v28 = v9;
      uint64_t v29 = v10;
      BOOL v30 = (uint64_t *)(v3[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *BOOL v30 = v39;
      v30[1] = v40;
      unint64_t v10 = v29;
      int64_t v9 = v28;
      uint64_t v2 = v27;
      int64_t v7 = v26;
      uint64_t v8 = v25;
      uint64_t v6 = v37;
      uint64_t v31 = (_OWORD *)(v3[7] + 32 * v23);
      sub_100006E58((uint64_t)v31);
      sub_10001344C(&v42, v31);
    }
    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    int64_t v32 = (uint64_t *)(v3[6] + 16 * v22);
    *int64_t v32 = v39;
    v32[1] = v40;
    sub_10001344C(&v42, (_OWORD *)(v3[7] + 32 * v22));
    uint64_t v33 = v3[2];
    BOOL v17 = __OFADD__(v33, 1);
    uint64_t v34 = v33 + 1;
    if (v17) {
      goto LABEL_37;
    }
    v3[2] = v34;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_100012A28(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100006B58(&qword_100025E40);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001B0D0;
    *(void *)(inited + 32) = 0x73736572706D6F63;
    *(void *)(inited + 40) = 0xEA00000000006465;
    Class v3 = sub_100012B30();
    if (v1)
    {
      swift_bridgeObjectRelease();
      *(void *)(inited + 16) = 0;
      swift_setDeallocating();
      return sub_100012D84();
    }
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v3;
    *(void *)(inited + 56) = v4;
  }
  return Dictionary.init(dictionaryLiteral:)();
}

Class sub_100012B30()
{
  uint64_t v0 = self;
  sub_100006B58(&qword_100025E38);
  v1.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  unint64_t v12 = 0;
  id v2 = [v0 dataWithJSONObject:v1.super.isa options:0 error:&v12];

  Class v3 = v12;
  if (v2)
  {
    unint64_t v12 = 0;
    uint64_t v4 = v3;
    id v5 = [v2 compressedDataUsingAlgorithm:3 error:&v12];
    v1.super.Class isa = v12;
    if (v5)
    {
      uint64_t v6 = v5;
      int64_t v7 = v12;
      id v8 = [v6 base64EncodedStringWithOptions:0];
      v1.super.Class isa = (Class)static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      unint64_t v10 = v12;
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }
  else
  {
    int64_t v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v1.super.isa;
}

id sub_100012CD4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100012D2C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceDodMLPlugin()
{
  return self;
}

uint64_t sub_100012D84()
{
  sub_100006B58(&qword_100025E48);
  swift_arrayDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_100012DE8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100012E40(Swift::Int a1)
{
  if (a1 < 16) {
    return 0;
  }
  _StringGuts.grow(_:)(a1);
  return 0;
}

unint64_t sub_100012E88(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100013170(a1, a2, v4);
}

unint64_t sub_100012F00(uint64_t a1)
{
  type metadata accessor for UUID();
  sub_1000134BC(&qword_100025EE0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100013254(a1, v2);
}

uint64_t sub_100012F98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006B58(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100012FF4()
{
  return swift_release();
}

uint64_t sub_100012FFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  int64_t v7 = v5;
  sub_100012E88(a2, a3);
  sub_1000137AC();
  Swift::Int v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v17 = v12;
  char v18 = v13;
  sub_100006B58(a5);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v16)) {
    goto LABEL_5;
  }
  unint64_t v19 = sub_100012E88(a2, a3);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v17 = v19;
LABEL_5:
  unint64_t v21 = *v7;
  if (v18)
  {
    uint64_t v22 = v21[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v22 + 8 * v17) = a1;
  }
  else
  {
    sub_100013128(v17, a2, a3, a1, v21);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_100013128(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  id v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_100013170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100013254(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1000134BC(&qword_100025EF8, (void (*)(uint64_t))&type metadata accessor for UUID);
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

uint64_t sub_100013414@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

_OWORD *sub_10001344C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001345C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100006B58(a3);
  sub_100013744();
  v4();
  return a2;
}

uint64_t sub_1000134BC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100013504()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_100013530()
{
  unint64_t v3 = *(void *)(v1 - 272);
  return sub_10000E2C4(v0, v3);
}

uint64_t sub_10001354C()
{
  return *(void *)(v0 - 336);
}

uint64_t sub_100013588()
{
  return Logger.logObject.getter();
}

unint64_t sub_1000135A0()
{
  return 0xD000000000000018;
}

double sub_1000135F8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 - 536);
  return sub_10001238C(0x73736572706D6F63, 0xEA00000000006465, v3, a1);
}

uint64_t sub_100013628()
{
  return v0;
}

uint64_t sub_1000136D0()
{
  return swift_slowAlloc();
}

uint64_t sub_1000136E8()
{
  return swift_slowAlloc();
}

__n128 sub_100013710(uint64_t a1)
{
  *(void *)(v2 - 144) = a1;
  __n128 result = *(__n128 *)(v2 - 384);
  *uint64_t v1 = result.n128_u32[0];
  return result;
}

BOOL sub_100013728(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100013750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = a1;
  return *(void *)(v2 - 304);
}

uint64_t sub_100013768()
{
  uint64_t v3 = *(void *)(v1 - 280);
  return sub_10000E2C4(v3, v0);
}

uint64_t sub_1000137BC@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_100013800()
{
  return *(void *)(v0 - 272);
}

void sub_100013814(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_100013848()
{
  return v0;
}

uint64_t sub_10001385C()
{
  uint64_t v2 = *(void *)(v0 - 280);
  unint64_t v3 = *(void *)(v0 - 408);
  return sub_10000E2C4(v2, v3);
}

void sub_10001387C()
{
  *(void *)(*(void *)(v0 + 56) + 8 * v1) = *(void *)(v2 - 624);
}

uint64_t sub_1000138CC()
{
  return v0;
}

__n128 sub_1000138E0(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return *(__n128 *)(v1 - 512);
}

uint64_t sub_1000138F4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001394C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (sub_1000095E4(a1, 1, v6) == 1)
  {
    sub_1000162A4(a1, &qword_100025F28);
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

uint64_t sub_100013ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags();
  sub_100007588();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  sub_10000968C();
  uint64_t v17 = v16 - v15;
  uint64_t v28 = type metadata accessor for DispatchQoS();
  sub_100007588();
  uint64_t v19 = v18;
  __chkstk_darwin(v20);
  sub_10000968C();
  uint64_t v23 = v22 - v21;
  if (qword_100025620 != -1) {
    swift_once();
  }
  char v24 = (void *)swift_allocObject();
  v24[2] = a1;
  v24[3] = a2;
  v24[4] = a3;
  v24[5] = a4;
  v24[6] = a5;
  v24[7] = a6;
  aBlock[4] = sub_100016190;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000685C;
  aBlock[3] = &unk_1000213C0;
  uint64_t v25 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  sub_10001625C((unint64_t *)&qword_1000256E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100006B58(&qword_1000256E8);
  sub_1000074E4();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v25);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v28);
  return swift_release();
}

void sub_100013D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(Class, void))
{
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v6 = type metadata accessor for SiriRemembersStore();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BackgroundQueue();
  uint64_t v10 = (void *)static BackgroundQueue.shared.getter();
  dispatch thunk of BackgroundQueue.pause()();

  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100006AA4(v11, (uint64_t)qword_1000262B8);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = v9;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "running SiriRemembers.__internal_searchV0", v14, 2u);
    unint64_t v9 = v22;
    swift_slowDealloc();
  }

  SiriRemembersStore.init()();
  uint64_t v15 = SiriRemembersStore.findEntities(query:type:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  uint64_t v25 = v15;
  sub_100006B58(&qword_100025F58);
  sub_1000161B8();
  uint64_t v17 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000E2C4(v17, v19);
  a5(isa, 0);
  swift_release();

  uint64_t v16 = (void *)static BackgroundQueue.shared.getter();
  dispatch thunk of BackgroundQueue.resume()();
}

void sub_100014194(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100014204()
{
  uint64_t v1 = type metadata accessor for CoreAnalyticsMetric();
  sub_100007588();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_10001637C();
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100006AA4(v5, (uint64_t)qword_1000262B8);
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_100016394((void *)&_mh_execute_header, v8, v9, "running accuracyLogging on daemon");
    swift_slowDealloc();
  }

  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  sub_10001625C(&qword_100025F50, (void (*)(uint64_t))&type metadata accessor for CoreAnalyticsMetric);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  sub_10000E2C4(v10, v12);
  CoreAnalyticsMetric.fullyQualifiedEventName.getter();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CoreAnalyticsMetric.eventPayload()();
  sub_100016108();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
  swift_release();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
}

void sub_100014528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(void, uint64_t))
{
  uint64_t v43 = a5;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v6 = type metadata accessor for UserDonator();
  uint64_t v39 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v37 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Donation();
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v36 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  long long v42 = (char *)v32 - v11;
  uint64_t v12 = type metadata accessor for InteractionStore();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v38 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v32 - v16;
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v33 = type metadata accessor for Logger();
  sub_100006AA4(v33, (uint64_t)qword_100026288);
  unint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "saving interaction to SiriRemembers InteractionStore", v20, 2u);
    swift_slowDealloc();
  }

  static InteractionStore.writable()();
  uint64_t v21 = v42;
  INInteraction.asDonation()();
  Donation.donate(_:)();
  v32[1] = a1;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v23 = v17;
  v22(v21, v41);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v13 + 8);
  v24(v23, v12);
  uint64_t v25 = v37;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v37, enum case for UserDonator.defaultUser(_:), v6);
  static InteractionStore.viewService(user:)();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v25, v6);
  uint64_t v26 = v36;
  INInteraction.asDonation()();
  uint64_t v27 = v38;
  Donation.donateToSiriRemembersView(_:)();
  v22(v26, v41);
  v24(v27, v12);
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v28, v29))
  {
    BOOL v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "saving interaction to legacy SiriRemembers", v30, 2u);
    swift_slowDealloc();
  }

  static SiriRemembersV1API.__saveInternal(interaction:databasePath:)();
  uint64_t v31 = v43;
  v43[2](v43, 1);
  _Block_release(v31);
}

void sub_100014DAC(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100006AA4(v5, (uint64_t)qword_1000262B8);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "running FetchInteractions", v8, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for BackgroundQueue();
  uint64_t v9 = (void *)static BackgroundQueue.shared.getter();
  id v10 = [objc_allocWithZone((Class)type metadata accessor for AppIntentBackfiller()) init];
  [v9 addOperation:v10];

  static SiriRemembersV1API.__backfillInternal(databasePath:)();
  a4[2](a4, 1);

  _Block_release(a4);
}

uint64_t sub_10001515C(uint64_t a1)
{
  sub_100006B58(&qword_100025848);
  sub_10001636C();
  __chkstk_darwin(v3);
  sub_10001637C();
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006AA4(v4, (uint64_t)qword_1000262B8);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_100016394((void *)&_mh_execute_header, v7, v8, "running DBManager.overrideForIntegrationTests");
    swift_slowDealloc();
  }

  type metadata accessor for URL();
  sub_10001636C();
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v1, a1);
  swift_storeEnumTagMultiPayload();
  return static SiriRemembersDB.defaultURL.setter();
}

void sub_1000153A0(uint64_t a1, void (**a2)(void))
{
  type metadata accessor for BackgroundQueue();
  uint64_t v3 = (void *)static BackgroundQueue.shared.getter();
  [v3 waitUntilAllOperationsAreFinished];

  a2[2](a2);

  _Block_release(a2);
}

uint64_t sub_10001546C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_100006B58(&qword_100025F28);
  __chkstk_darwin(v12 - 8);
  sub_10000968C();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for TaskPriority();
  sub_100009554(v15, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a1;
  v17[5] = a2;
  v17[6] = a3;
  v17[7] = a4;
  v17[8] = a5;
  v17[9] = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10001394C(v15, (uint64_t)&unk_100025F38, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_10001557C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v12;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  uint64_t v9 = type metadata accessor for UUID();
  v8[8] = v9;
  v8[9] = *(void *)(v9 - 8);
  v8[10] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001564C, 0, 0);
}

uint64_t sub_10001564C()
{
  uint64_t v1 = v0[4];
  type metadata accessor for SearchTermAppsRanker();
  v0[11] = static SearchTermAppsRanker.shared.getter();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, BOOL, uint64_t))((char *)&async function pointer to dispatch thunk of SearchTermAppsRanker.rank(searchTerm:maxResults:excludeAppBundleIds:)
                                                                                 + async function pointer to dispatch thunk of SearchTermAppsRanker.rank(searchTerm:maxResults:excludeAppBundleIds:));
  uint64_t v2 = (void *)swift_task_alloc();
  v0[12] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100015734;
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return v8(v3, v5, v6, v1 & ~(v1 >> 63), v1 < 1, v4);
}

uint64_t sub_100015734()
{
  sub_1000163C0();
  sub_100016344();
  uint64_t v1 = *v0;
  sub_10001635C();
  *uint64_t v2 = v1;
  *(void *)(v4 + 104) = v3;
  swift_task_dealloc();
  swift_release();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100015824, 0, 0);
}

uint64_t sub_100015824()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  (*(void (**)(void, uint64_t))(v0 + 48))(*(void *)(v0 + 104), v1);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  sub_1000163B4();
  return v4();
}

void sub_1000159C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v5 = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class, objc_class *))(a3 + 16))(a3, isa, v5);
}

uint64_t sub_100015A40()
{
  type metadata accessor for SearchTermAppsRankerDataCollector();
  static SearchTermAppsRankerDataCollector.shared.getter();
  dispatch thunk of SearchTermAppsRankerDataCollector.appSelectedForSearchTerm(rankEventId:selectedAppBundleId:numberOfAppsShown:)();

  return swift_release();
}

id sub_100015BCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceService();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100015C24()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceService()
{
  return self;
}

uint64_t sub_100015C7C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_100015CCC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100015DB8;
  return sub_10001557C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100015DB8()
{
  sub_1000163C0();
  sub_100016344();
  uint64_t v1 = *v0;
  sub_10001635C();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000163B4();
  return v3();
}

uint64_t sub_100015E78(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100015F54;
  return v6(a1);
}

uint64_t sub_100015F54()
{
  sub_1000163C0();
  sub_100016344();
  uint64_t v1 = *v0;
  sub_10001635C();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000163B4();
  return v3();
}

uint64_t sub_100016018()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016050(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100015DB8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100025F40 + dword_100025F40);
  return v6(a1, v4);
}

unint64_t sub_100016108()
{
  unint64_t result = qword_100025E80;
  if (!qword_100025E80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025E80);
  }
  return result;
}

uint64_t sub_100016148()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_100016190()
{
  sub_100013D5C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void (**)(Class, void))(v0 + 48));
}

uint64_t sub_1000161A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000161B0()
{
  return swift_release();
}

unint64_t sub_1000161B8()
{
  unint64_t result = qword_100025F60;
  if (!qword_100025F60)
  {
    sub_100007538(&qword_100025F58);
    sub_10001625C(&qword_100025F68, (void (*)(uint64_t))&type metadata accessor for SiriRemembersV1API.Entity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025F60);
  }
  return result;
}

uint64_t sub_10001625C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000162A4(uint64_t a1, uint64_t *a2)
{
  sub_100006B58(a2);
  sub_10001636C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1000162F8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100016330(uint64_t a1, uint64_t a2)
{
  sub_1000159C4(a1, a2, *(void *)(v2 + 16));
}

void sub_100016338(uint64_t a1, uint64_t a2)
{
  sub_100014194(a1, a2, *(void *)(v2 + 16));
}

void sub_100016394(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_1000163B4()
{
  return v0 + 8;
}

uint64_t sub_1000163CC(int a1, id a2)
{
  [a2 processIdentifier];
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a2 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_1000167D4((uint64_t)v21, (uint64_t)v22);
  if (v23)
  {
    if (swift_dynamicCast() & 1) != 0 && (v20)
    {
      id v5 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriInference25SiriInferenceXPCInterface_];
      [a2 setExportedInterface:v5];

      id v6 = [objc_allocWithZone((Class)type metadata accessor for SiriInferenceService()) init];
      [a2 setExportedObject:v6];

      [a2 resume];
      if (qword_100025640 != -1) {
        swift_once();
      }
      uint64_t v7 = type metadata accessor for Logger();
      sub_100006AA4(v7, (uint64_t)qword_1000262B8);
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v8, v9))
      {
        uint64_t v13 = 1;
        goto LABEL_18;
      }
      uint64_t v10 = (float *)swift_slowAlloc();
      sub_10001689C(v10, 1.5282e-36);
      sub_1000168C8((void *)&_mh_execute_header, v11, v12, "process [%{public}d] is connected to siriinferenced");
      uint64_t v13 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    sub_10001683C((uint64_t)v22);
  }
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100006AA4(v14, (uint64_t)qword_1000262B8);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v8, v15))
  {
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  uint64_t v16 = (float *)swift_slowAlloc();
  sub_10001689C(v16, 1.5282e-36);
  sub_1000168C8((void *)&_mh_execute_header, v17, v18, "process [%{public}d] is not entitled to call the Siri Inference SPI.\nAdd the proper entitlements and try again.");
  uint64_t v13 = 0;
LABEL_16:
  swift_slowDealloc();
LABEL_18:

  return v13;
}

id sub_100016724()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceServiceDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001677C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceServiceDelegate()
{
  return self;
}

uint64_t sub_1000167D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B58(&qword_100025E60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001683C(uint64_t a1)
{
  uint64_t v2 = sub_100006B58(&qword_100025E60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001689C(float *a1, float a2)
{
  *a1 = a2;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void sub_1000168C8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 8u);
}

void sub_1000168E8(uint64_t a1, uint64_t a2, void (**a3)(void, uint64_t))
{
  uint64_t v31 = a3;
  uint64_t v3 = type metadata accessor for UserDonator();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  __chkstk_darwin(v3);
  id v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for InteractionStore();
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  os_log_type_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t v12 = type metadata accessor for Donation();
  uint64_t v30 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100006AA4(v15, (uint64_t)qword_100026288);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "saving donation to InteractionStore", v18, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for ActivityHeartbeat();
  static ActivityHeartbeat.instance.getter();
  dispatch thunk of ActivityHeartbeat.keepAlive()();
  swift_release();
  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  sub_10001704C();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  swift_release();
  static InteractionStore.writable()();
  Donation.donate(_:)();
  Donation.userDonator.getter();
  static InteractionStore.viewService(user:)();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
  Donation.donateToSiriRemembersView(_:)();
  uint64_t v22 = v31;
  v31[2](v31, 1);
  sub_10000E2C4(v19, v21);
  uint64_t v23 = v29;
  uint64_t v24 = *(void (**)(char *, uint64_t))(v28 + 8);
  v24(v9, v29);
  v24(v11, v23);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v12);
  _Block_release(v22);
}

id sub_100016F9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersService();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100016FF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriRemembersService()
{
  return self;
}

unint64_t sub_10001704C()
{
  unint64_t result = qword_100026030;
  if (!qword_100026030)
  {
    type metadata accessor for Donation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026030);
  }
  return result;
}

uint64_t sub_10001709C(int a1, id a2)
{
  [a2 processIdentifier];
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a2 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_1000167D4((uint64_t)v21, (uint64_t)v22);
  if (v23)
  {
    if (swift_dynamicCast() & 1) != 0 && (v20)
    {
      id v5 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP13SiriRemembers25SiriRemembersXPCInterface_];
      [a2 setExportedInterface:v5];

      id v6 = [objc_allocWithZone((Class)type metadata accessor for SiriRemembersService()) init];
      [a2 setExportedObject:v6];

      [a2 resume];
      if (qword_100025640 != -1) {
        swift_once();
      }
      uint64_t v7 = type metadata accessor for Logger();
      sub_100006AA4(v7, (uint64_t)qword_1000262B8);
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v8, v9))
      {
        uint64_t v13 = 1;
        goto LABEL_18;
      }
      uint64_t v10 = (float *)swift_slowAlloc();
      sub_10001689C(v10, 1.5282e-36);
      sub_1000168C8((void *)&_mh_execute_header, v11, v12, "process [%{public}d] is connected to siriinferenced");
      uint64_t v13 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    sub_10001683C((uint64_t)v22);
  }
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100006AA4(v14, (uint64_t)qword_1000262B8);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v8, v15))
  {
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  uint64_t v16 = (float *)swift_slowAlloc();
  sub_10001689C(v16, 1.5282e-36);
  sub_1000168C8((void *)&_mh_execute_header, v17, v18, "process [%{public}d] is not entitled to call the Siri Inference SPI.\nAdd the proper entitlements and try again.");
  uint64_t v13 = 0;
LABEL_16:
  swift_slowDealloc();
LABEL_18:

  return v13;
}

id sub_1000173F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersServiceDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001744C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriRemembersServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriRemembersServiceDelegate()
{
  return self;
}

void *sub_1000174A4()
{
  uint64_t v1 = v0;
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_100026288);
  NSString v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Initializing SiriRolloutsMonitor", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = (objc_class *)type metadata accessor for ExperimentationAnalyticsManager();
  id v7 = [objc_allocWithZone(v6) init];
  v1[5] = v6;
  v1[6] = &protocol witness table for ExperimentationAnalyticsManager;
  v1[2] = v7;
  return v1;
}

void sub_1000175B0(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006AA4(v4, (uint64_t)qword_100026288);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Registering SiriRolloutsMonitor activity", v7, 2u);
    swift_slowDealloc();
  }

  sub_10001773C(v2 + 16, (uint64_t)v10);
  id v8 = objc_allocWithZone((Class)type metadata accessor for RolloutsAnalyticsActivity());
  os_log_type_t v9 = (void *)RolloutsAnalyticsActivity.init(analyticsManager:)();
  [a1 addOperation:v9];
}

uint64_t sub_1000176E0()
{
  sub_100006E58(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for SiriRolloutsMonitor()
{
  return self;
}

uint64_t sub_10001773C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000177A0(int a1, id a2)
{
  [a2 processIdentifier];
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [a2 valueForEntitlement:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v27, 0, sizeof(v27));
  }
  sub_1000167D4((uint64_t)v27, (uint64_t)v28);
  if (v29)
  {
    if (swift_dynamicCast() & 1) != 0 && (v26)
    {
      if (qword_100025638 != -1) {
        swift_once();
      }
      uint64_t v5 = type metadata accessor for Logger();
      sub_100006AA4(v5, (uint64_t)qword_1000262A0);
      os_log_type_t v6 = Logger.logObject.getter();
      os_log_type_t v7 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v6, v7))
      {
        id v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "made the connection", v8, 2u);
        swift_slowDealloc();
      }

      id v9 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP11SiriSignals23SiriSignalsXPCInterface_];
      [a2 setExportedInterface:v9];

      id v10 = [objc_allocWithZone((Class)type metadata accessor for SiriSignalsService()) init];
      [a2 setExportedObject:v10];

      [a2 resume];
      uint64_t v11 = Logger.logObject.getter();
      os_log_type_t v12 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "resumed the connection", v13, 2u);
        swift_slowDealloc();
      }

      if (qword_100025640 != -1) {
        swift_once();
      }
      sub_100006AA4(v5, (uint64_t)qword_1000262B8);
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v14, v15))
      {
        uint64_t v19 = 1;
        goto LABEL_24;
      }
      uint64_t v16 = (float *)swift_slowAlloc();
      sub_10001689C(v16, 1.5282e-36);
      sub_1000168C8((void *)&_mh_execute_header, v17, v18, "process [%{public}d] is connected to siriinferenced");
      uint64_t v19 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    sub_10001683C((uint64_t)v28);
  }
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  sub_100006AA4(v20, (uint64_t)qword_1000262B8);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v14, v21))
  {
    uint64_t v19 = 0;
    goto LABEL_24;
  }
  uint64_t v22 = (float *)swift_slowAlloc();
  sub_10001689C(v22, 1.5282e-36);
  sub_1000168C8((void *)&_mh_execute_header, v23, v24, "process [%{public}d] is not entitled to call the Siri Inference SPI.\nAdd the proper entitlements and try again.");
  uint64_t v19 = 0;
LABEL_22:
  swift_slowDealloc();
LABEL_24:

  return v19;
}

id sub_100017C20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSignalsServiceDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100017C78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSignalsServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriSignalsServiceDelegate()
{
  return self;
}

void sub_100017CD0()
{
  uint64_t v0 = type metadata accessor for OSSignpostID();
  __chkstk_darwin(v0);
  if (qword_100025628 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100026280;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  sub_100006B58(&qword_100025658);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001B0D0;
  uint64_t v3 = StaticString.description.getter();
  uint64_t v5 = v4;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = sub_100006B9C();
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v5;
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  swift_bridgeObjectRelease();
  sub_100017EE4();
  static os_signpost_type_t.end.getter();
  sub_100018628();
  uint64_t v6 = sub_100018610();
  v7(v6);
}

void sub_100017EE4()
{
  uint64_t v23 = type metadata accessor for DispatchTimeInterval();
  uint64_t v0 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v2 = (void *)((char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = type metadata accessor for DispatchTime();
  uint64_t v3 = *(void *)(v22 - 8);
  uint64_t v4 = __chkstk_darwin(v22);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)v21 - v7;
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  v21[1] = sub_100006AA4(v9, (uint64_t)qword_1000262B8);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "calling suggestions service bridge...", v12, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for SiriInferenceSuggestionsBridgeProvider();
  static SiriInferenceSuggestionsBridgeProvider.instance.getter();
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  *(void *)(swift_allocObject() + 16) = v13;
  uint64_t v14 = v13;
  static SiriInferenceSuggestionsBridgeProvider.getAsync(_:callback:)();
  swift_release();
  static DispatchTime.now()();
  *uint64_t v2 = 20;
  uint64_t v15 = v23;
  (*(void (**)(void *, void, uint64_t))(v0 + 104))(v2, enum case for DispatchTimeInterval.seconds(_:), v23);
  + infix(_:_:)();
  (*(void (**)(void *, uint64_t))(v0 + 8))(v2, v15);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v17 = v22;
  v16(v6, v22);
  OS_dispatch_semaphore.wait(timeout:)();
  v16(v8, v17);
  if (static DispatchTimeoutResult.== infix(_:_:)())
  {
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "The suggestions bridge did not return within 20 seconds. Carrying on anyway", v20, 2u);
      swift_slowDealloc();

      swift_release();
      return;
    }
  }
  swift_release();
}

uint64_t sub_1000182A8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_1000182C8, 0, 0);
}

uint64_t sub_1000182C8()
{
  sub_1000185CC(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  dispatch thunk of SiriInferenceSuggestionsBridge.startSiriSuggestionsService()();
  if (qword_100025640 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006AA4(v1, (uint64_t)qword_1000262B8);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "successfully called suggestions service bridge", v4, 2u);
    swift_slowDealloc();
  }

  OS_dispatch_semaphore.signal()();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100018404()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001843C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000184D8;
  return sub_1000182A8(a1, v4);
}

uint64_t sub_1000184D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_1000185CC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100018610()
{
  return v0;
}

uint64_t sub_100018628()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

void sub_100018648(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void static SiriUIBiomeMonitor.deregister()()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_100007588();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_10000968C();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v7);
  sub_10000968C();
  uint64_t v8 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v8 - 8);
  sub_10000968C();
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100006AA4(v9, (uint64_t)qword_100026288);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Deregistering SiriUIBiomeMonitor", v12, 2u);
    swift_slowDealloc();
  }

  sub_100009310();
  static DispatchQoS.unspecified.getter();
  aBlock = (void **)&_swiftEmptyArrayStorage;
  sub_100009350();
  sub_100006B58((uint64_t *)&unk_100025CF0);
  sub_1000093A0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  sub_100019888();
  OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  id v13 = objc_allocWithZone((Class)BMBiomeScheduler);
  unint64_t v14 = sub_10001986C();
  id v17 = sub_10001975C(v14, v15, v16);
  id v18 = objc_msgSend((id)BiomeLibrary(), "Siri", &_swiftEmptyArrayStorage);
  swift_unknownObjectRelease();
  id v19 = [v18 UI];
  swift_unknownObjectRelease();
  id v20 = [v19 DSLPublisher];

  id v21 = [v20 subscribeOn:v17];
  uint64_t v29 = nullsub_1;
  uint64_t v30 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_100018648;
  uint64_t v28 = &unk_100021460;
  uint64_t v22 = _Block_copy(&aBlock);
  uint64_t v29 = nullsub_1;
  uint64_t v30 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_10000D730;
  uint64_t v28 = &unk_100021488;
  uint64_t v23 = _Block_copy(&aBlock);
  id v24 = [v21 sinkWithCompletion:v22 receiveInput:v23];
  _Block_release(v23);
  _Block_release(v22);

  [v24 cancel];
}

uint64_t SiriUIBiomeMonitor.__allocating_init(queue:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  SiriUIBiomeMonitor.init(queue:)(a1);
  return v2;
}

uint64_t SiriUIBiomeMonitor.init(queue:)(void *a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 16) = 0;
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006AA4(v4, (uint64_t)qword_100026288);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Initializing SiriUIBiomeMonitor", v7, 2u);
    swift_slowDealloc();
  }

  id v8 = sub_100018C2C(a1);
  uint64_t v9 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = v8;

  return v2;
}

id sub_100018C2C(void *a1)
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_100007588();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_10000968C();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v8);
  sub_10000968C();
  uint64_t v9 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v9 - 8);
  sub_10000968C();
  if (qword_100025630 != -1) {
    swift_once();
  }
  uint64_t v40 = type metadata accessor for Logger();
  sub_100006AA4(v40, (uint64_t)qword_100026288);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Registering SiriUIBiomeMonitor", v12, 2u);
    sub_1000075A4();
  }

  sub_100009310();
  static DispatchQoS.unspecified.getter();
  aBlock = &_swiftEmptyArrayStorage;
  sub_100009350();
  sub_100006B58((uint64_t *)&unk_100025CF0);
  sub_1000093A0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  sub_100019888();
  OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  id v13 = objc_allocWithZone((Class)BMBiomeScheduler);
  unint64_t v14 = sub_10001986C();
  id v17 = sub_10001975C(v14, v15, v16);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  id v19 = [(id)BiomeLibrary() Siri];
  swift_unknownObjectRelease();
  id v20 = [v19 UI];
  swift_unknownObjectRelease();
  id v21 = [v20 DSLPublisher];

  id v22 = [v21 subscribeOn:v17];
  uint64_t v48 = sub_100019330;
  uint64_t v49 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_100018648;
  uint64_t v47 = &unk_1000214D8;
  uint64_t v23 = _Block_copy(&aBlock);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a1;
  *(void *)(v24 + 24) = v18;
  uint64_t v48 = sub_10001984C;
  uint64_t v49 = v24;
  aBlock = _NSConcreteStackBlock;
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_10000D730;
  uint64_t v47 = &unk_100021528;
  uint64_t v25 = _Block_copy(&aBlock);
  id v26 = a1;
  swift_retain();
  swift_release();
  id v27 = [v22 sinkWithCompletion:v23 receiveInput:v25];
  _Block_release(v25);
  _Block_release(v23);

  if (qword_100025648 != -1) {
    swift_once();
  }
  sub_100006AA4(v40, (uint64_t)qword_1000262D0);
  id v28 = v27;
  swift_retain_n();
  id v29 = v28;
  uint64_t v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v39 = (void *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315650;
    long long v42 = v17;
    id v33 = [v29 debugDescription];
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v36 = v35;

    aBlock = (void *)sub_100006C2C(v34, v36, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2112;
    id v37 = [v29 status];
    aBlock = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v39 = v37;

    *(_WORD *)(v32 + 22) = 2048;
    swift_beginAccess();
    swift_release();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Biome: Created Sink: %s, Sink Status: %@, Fetched Event Count: %ld", (uint8_t *)v32, 0x20u);
    sub_100006B58(&qword_100025838);
    swift_arrayDestroy();
    sub_1000075A4();
    swift_arrayDestroy();
    sub_1000075A4();
    sub_1000075A4();
    swift_release();
  }
  else
  {

    swift_release_n();
  }
  return v29;
}

void sub_100019330(void *a1)
{
  if (qword_100025648 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006AA4(v2, (uint64_t)qword_1000262D0);
  id v8 = a1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Biome: BiomeClientDaemon Completion: %@", v5, 0xCu);
    sub_100006B58(&qword_100025838);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_1000194FC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a3 + 16);
  sub_100019564(a1, a2, v5);
}

void sub_100019564(void *a1, void *a2, void *a3)
{
  if (([a1 respondsToSelector:"eventBody"] & 1) == 0)
  {
    __break(1u);
    return;
  }
  id v6 = [a1 eventBody];
  if (v6)
  {
    id v7 = v6;
    objc_allocWithZone((Class)type metadata accessor for BiomeSiriUIProcessor());
    id v8 = v7;
    uint64_t v9 = (void *)BiomeSiriUIProcessor.init(siriUIEvent:)();
    [a2 addOperation:v9];

    swift_beginAccess();
    if (!__OFADD__(*a3, 1))
    {
      ++*a3;
      return;
    }
    __break(1u);
    goto LABEL_10;
  }
  if (qword_100025648 != -1) {
LABEL_10:
  }
    swift_once();
  uint64_t v10 = type metadata accessor for Logger();
  sub_100006AA4(v10, (uint64_t)qword_1000262D0);
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Fail to derive proper BMSiriUI event", v13, 2u);
    swift_slowDealloc();
  }
}

uint64_t SiriUIBiomeMonitor.deinit()
{
  return v0;
}

uint64_t SiriUIBiomeMonitor.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

id sub_10001975C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithIdentifier:v5 targetQueue:a3];

  return v6;
}

uint64_t sub_1000197C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000197D0()
{
  return swift_release();
}

uint64_t type metadata accessor for SiriUIBiomeMonitor()
{
  return self;
}

uint64_t sub_1000197FC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001980C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001984C(void *a1)
{
  sub_1000194FC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_10001986C()
{
  return 0xD00000000000001FLL;
}

unint64_t sub_100019888()
{
  return 0xD00000000000001FLL;
}

void sub_1000198A0()
{
  id v0 = [self defaultManager];
  URL.path.getter();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned int v2 = [v0 fileExistsAtPath:v1];

  if (v2)
  {
    URL._bridgeToObjectiveC()(v3);
    NSString v5 = v4;
    id v9 = 0;
    unsigned int v6 = [v0 removeItemAtURL:v4 error:&v9];

    if (v6)
    {
      id v7 = v9;
    }
    else
    {
      id v8 = v9;
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }
}

uint64_t sub_1000199C4()
{
  uint64_t v0 = String.utf8CString.getter();
  NSString v1 = realpath_DARWIN_EXTSN((const char *)(v0 + 32), 0);
  swift_release();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = String.init(cString:)();
  swift_slowDealloc();
  return v2;
}

uint64_t getEnumTagSinglePayload for UnwrapError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for UnwrapError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100019B30);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100019B58()
{
  return 0;
}

ValueMetadata *type metadata accessor for UnwrapError()
{
  return &type metadata for UnwrapError;
}

BOOL sub_100019B70(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100020ED0, v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

uint64_t sub_100019BB8()
{
  return 0x6570706172776E75;
}

BOOL sub_100019BE8@<W0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_100019B70(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100019C20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100019BB8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100019C4C()
{
  unint64_t result = qword_100026218;
  if (!qword_100026218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026218);
  }
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
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

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
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

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t dispatch thunk of AudioAppSignalsSyncer.syncAudioAppSignals(bypassMinSyncDuration:trigger:completion:)()
{
  return dispatch thunk of AudioAppSignalsSyncer.syncAudioAppSignals(bypassMinSyncDuration:trigger:completion:)();
}

uint64_t type metadata accessor for AudioAppSignalsSyncer.SyncTrigger()
{
  return type metadata accessor for AudioAppSignalsSyncer.SyncTrigger();
}

uint64_t AudioAppSignalsSyncer.__allocating_init()()
{
  return AudioAppSignalsSyncer.__allocating_init()();
}

uint64_t type metadata accessor for AudioAppSignalsSyncer()
{
  return type metadata accessor for AudioAppSignalsSyncer();
}

uint64_t type metadata accessor for SiriSignalsService()
{
  return type metadata accessor for SiriSignalsService();
}

uint64_t dispatch thunk of SignalRepository.hourlyPrewarm()()
{
  return dispatch thunk of SignalRepository.hourlyPrewarm()();
}

uint64_t dispatch thunk of SignalRepository.startBiomeListeners()()
{
  return dispatch thunk of SignalRepository.startBiomeListeners()();
}

uint64_t dispatch thunk of SignalRepository.startAppInstallListener()()
{
  return dispatch thunk of SignalRepository.startAppInstallListener()();
}

uint64_t static SignalRepository.shared.getter()
{
  return static SignalRepository.shared.getter();
}

uint64_t dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:userInteractive:)()
{
  return dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:userInteractive:)();
}

uint64_t dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:)()
{
  return dispatch thunk of SignalRepository.prewarm(matchingCachingStrategy:)();
}

uint64_t type metadata accessor for SignalRepository()
{
  return type metadata accessor for SignalRepository();
}

uint64_t type metadata accessor for SignalCachingStrategyOption()
{
  return type metadata accessor for SignalCachingStrategyOption();
}

uint64_t BiomeSiriUIProcessor.init(siriUIEvent:)()
{
  return BiomeSiriUIProcessor.init(siriUIEvent:)();
}

uint64_t type metadata accessor for BiomeSiriUIProcessor()
{
  return type metadata accessor for BiomeSiriUIProcessor();
}

uint64_t static SiriRemembersDB.defaultURL.getter()
{
  return static SiriRemembersDB.defaultURL.getter();
}

uint64_t static SiriRemembersDB.defaultURL.setter()
{
  return static SiriRemembersDB.defaultURL.setter();
}

uint64_t SiriRemembersStore.findEntities(query:type:)()
{
  return SiriRemembersStore.findEntities(query:type:)();
}

uint64_t SiriRemembersStore.init()()
{
  return SiriRemembersStore.init()();
}

uint64_t type metadata accessor for SiriRemembersStore()
{
  return type metadata accessor for SiriRemembersStore();
}

uint64_t static SiriRemembersV1API.__saveInternal(interaction:databasePath:)()
{
  return static SiriRemembersV1API.__saveInternal(interaction:databasePath:)();
}

uint64_t static SiriRemembersV1API.__backfillInternal(databasePath:)()
{
  return static SiriRemembersV1API.__backfillInternal(databasePath:)();
}

uint64_t dispatch thunk of InferenceError.log()()
{
  return dispatch thunk of InferenceError.log()();
}

uint64_t type metadata accessor for InferenceError()
{
  return type metadata accessor for InferenceError();
}

uint64_t InferenceError.__allocating_init(_:file:function:line:)()
{
  return InferenceError.__allocating_init(_:file:function:line:)();
}

uint64_t dispatch thunk of SiriInferenceSuggestionsBridge.startSiriSuggestionsService()()
{
  return dispatch thunk of SiriInferenceSuggestionsBridge.startSiriSuggestionsService()();
}

uint64_t static SiriInferenceSuggestionsBridgeProvider.getAsync(_:callback:)()
{
  return static SiriInferenceSuggestionsBridgeProvider.getAsync(_:callback:)();
}

uint64_t static SiriInferenceSuggestionsBridgeProvider.instance.getter()
{
  return static SiriInferenceSuggestionsBridgeProvider.instance.getter();
}

uint64_t type metadata accessor for SiriInferenceSuggestionsBridgeProvider()
{
  return type metadata accessor for SiriInferenceSuggestionsBridgeProvider();
}

uint64_t static XPCActivity.unregister(name:)()
{
  return static XPCActivity.unregister(name:)();
}

uint64_t type metadata accessor for XPCActivity.RepeatInterval()
{
  return type metadata accessor for XPCActivity.RepeatInterval();
}

uint64_t static XPCActivity.registerFirstBoot()()
{
  return static XPCActivity.registerFirstBoot()();
}

uint64_t static XPCActivity.registerDailySignalRefresh(refreshSignalCallback:)()
{
  return static XPCActivity.registerDailySignalRefresh(refreshSignalCallback:)();
}

uint64_t static XPCActivity.registerHourlySignalRefresh(hourlySignalRefresh:)()
{
  return static XPCActivity.registerHourlySignalRefresh(hourlySignalRefresh:)();
}

uint64_t static XPCActivity.registerDailyTaskSuccessEvaluation()()
{
  return static XPCActivity.registerDailyTaskSuccessEvaluation()();
}

uint64_t static XPCActivity.registerRecurringAudioAppSignalsSync(audioAppSignalsSync:)()
{
  return static XPCActivity.registerRecurringAudioAppSignalsSync(audioAppSignalsSync:)();
}

uint64_t static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)()
{
  return static XPCActivity.register(name:repeatInterval:isPrivacyCritical:makeOperation:)();
}

uint64_t static RunTimeDataDB.defaultURL.getter()
{
  return static RunTimeDataDB.defaultURL.getter();
}

uint64_t dispatch thunk of BackgroundQueue.pause()()
{
  return dispatch thunk of BackgroundQueue.pause()();
}

uint64_t dispatch thunk of BackgroundQueue.resume()()
{
  return dispatch thunk of BackgroundQueue.resume()();
}

uint64_t static BackgroundQueue.shared.getter()
{
  return static BackgroundQueue.shared.getter();
}

uint64_t type metadata accessor for BackgroundQueue()
{
  return type metadata accessor for BackgroundQueue();
}

uint64_t static ScrubOldRecords.metricName.getter()
{
  return static ScrubOldRecords.metricName.getter();
}

uint64_t type metadata accessor for ScrubOldRecords()
{
  return type metadata accessor for ScrubOldRecords();
}

uint64_t type metadata accessor for FetchInteractions()
{
  return type metadata accessor for FetchInteractions();
}

uint64_t static HolidaysDBUpdater.metricName.getter()
{
  return static HolidaysDBUpdater.metricName.getter();
}

uint64_t static HolidaysDBUpdater.xpcActivityOperation(activity:)()
{
  return static HolidaysDBUpdater.xpcActivityOperation(activity:)();
}

uint64_t type metadata accessor for HolidaysDBUpdater()
{
  return type metadata accessor for HolidaysDBUpdater();
}

uint64_t type metadata accessor for ScrubDodMLRecords()
{
  return type metadata accessor for ScrubDodMLRecords();
}

uint64_t CoreAnalyticsMetric.eventPayload()()
{
  return CoreAnalyticsMetric.eventPayload()();
}

uint64_t CoreAnalyticsMetric.fullyQualifiedEventName.getter()
{
  return CoreAnalyticsMetric.fullyQualifiedEventName.getter();
}

uint64_t type metadata accessor for CoreAnalyticsMetric()
{
  return type metadata accessor for CoreAnalyticsMetric();
}

uint64_t static SearchTermAppsRanker.shared.getter()
{
  return static SearchTermAppsRanker.shared.getter();
}

uint64_t type metadata accessor for SearchTermAppsRanker()
{
  return type metadata accessor for SearchTermAppsRanker();
}

uint64_t type metadata accessor for BiomeInteractionFetcher()
{
  return type metadata accessor for BiomeInteractionFetcher();
}

uint64_t type metadata accessor for ScrubRuntimeDataRecords()
{
  return type metadata accessor for ScrubRuntimeDataRecords();
}

uint64_t static ProcessUnstitchedIntents.metricName.getter()
{
  return static ProcessUnstitchedIntents.metricName.getter();
}

uint64_t type metadata accessor for ProcessUnstitchedIntents()
{
  return type metadata accessor for ProcessUnstitchedIntents();
}

uint64_t BiomeInteractionProcessor.init(appIntentEvent:eventReceivedAt:databaseURL:)()
{
  return BiomeInteractionProcessor.init(appIntentEvent:eventReceivedAt:databaseURL:)();
}

uint64_t type metadata accessor for BiomeInteractionProcessor()
{
  return type metadata accessor for BiomeInteractionProcessor();
}

uint64_t static RolloutsAnalyticsActivity.deregister(analyticsManager:)()
{
  return static RolloutsAnalyticsActivity.deregister(analyticsManager:)();
}

uint64_t RolloutsAnalyticsActivity.init(analyticsManager:)()
{
  return RolloutsAnalyticsActivity.init(analyticsManager:)();
}

uint64_t type metadata accessor for RolloutsAnalyticsActivity()
{
  return type metadata accessor for RolloutsAnalyticsActivity();
}

uint64_t dispatch thunk of SearchTermAppsRankerDataCollector.appSelectedForSearchTerm(rankEventId:selectedAppBundleId:numberOfAppsShown:)()
{
  return dispatch thunk of SearchTermAppsRankerDataCollector.appSelectedForSearchTerm(rankEventId:selectedAppBundleId:numberOfAppsShown:)();
}

uint64_t static SearchTermAppsRankerDataCollector.shared.getter()
{
  return static SearchTermAppsRankerDataCollector.shared.getter();
}

uint64_t type metadata accessor for SearchTermAppsRankerDataCollector()
{
  return type metadata accessor for SearchTermAppsRankerDataCollector();
}

uint64_t static SiriSuggestionsBiomeEventBackFiller.register()()
{
  return static SiriSuggestionsBiomeEventBackFiller.register()();
}

uint64_t static SiriRemembersBiomeEventBackfiller.register()()
{
  return static SiriRemembersBiomeEventBackfiller.register()();
}

uint64_t type metadata accessor for UserDonator()
{
  return type metadata accessor for UserDonator();
}

uint64_t static InteractionStore.viewService(user:)()
{
  return static InteractionStore.viewService(user:)();
}

uint64_t static InteractionStore.delete()()
{
  return static InteractionStore.delete()();
}

uint64_t static InteractionStore.writable()()
{
  return static InteractionStore.writable()();
}

uint64_t type metadata accessor for InteractionStore()
{
  return type metadata accessor for InteractionStore();
}

uint64_t static ActivityHeartbeat.activityName.getter()
{
  return static ActivityHeartbeat.activityName.getter();
}

uint64_t static ActivityHeartbeat.instance.getter()
{
  return static ActivityHeartbeat.instance.getter();
}

uint64_t dispatch thunk of ActivityHeartbeat.keepAlive()()
{
  return dispatch thunk of ActivityHeartbeat.keepAlive()();
}

uint64_t type metadata accessor for ActivityHeartbeat()
{
  return type metadata accessor for ActivityHeartbeat();
}

uint64_t AppIntentProcessor.init(event:)()
{
  return AppIntentProcessor.init(event:)();
}

uint64_t type metadata accessor for AppIntentProcessor()
{
  return type metadata accessor for AppIntentProcessor();
}

uint64_t type metadata accessor for AppIntentBackfiller()
{
  return type metadata accessor for AppIntentBackfiller();
}

uint64_t static ScrubInteractionStore.register()()
{
  return static ScrubInteractionStore.register()();
}

uint64_t Donation.donateToSiriRemembersView(_:)()
{
  return Donation.donateToSiriRemembersView(_:)();
}

uint64_t Donation.userDonator.getter()
{
  return Donation.userDonator.getter();
}

uint64_t Donation.donate(_:)()
{
  return Donation.donate(_:)();
}

uint64_t type metadata accessor for Donation()
{
  return type metadata accessor for Donation();
}

uint64_t CustomSignal.signalType.getter()
{
  return CustomSignal.signalType.getter();
}

uint64_t CustomSignal.item.getter()
{
  return CustomSignal.item.getter();
}

uint64_t type metadata accessor for CustomSignal()
{
  return type metadata accessor for CustomSignal();
}

uint64_t type metadata accessor for CustomSignalType()
{
  return type metadata accessor for CustomSignalType();
}

uint64_t type metadata accessor for ExperimentationAnalyticsManager()
{
  return type metadata accessor for ExperimentationAnalyticsManager();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OSSignpostID.init(log:)()
{
  return OSSignpostID.init(log:)();
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

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
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

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
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

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
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

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t INInteraction.asDonation()()
{
  return INInteraction.asDonation()();
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

uint64_t static NSKeyedUnarchiver.unarchivedDictionary<A, B>(ofKeyClass:objectClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedDictionary<A, B>(ofKeyClass:objectClass:from:)();
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

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
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

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
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

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AFPreferencesAssistantEnabled()
{
  return _AFPreferencesAssistantEnabled();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
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

void _exit(int a1)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_main(void)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}