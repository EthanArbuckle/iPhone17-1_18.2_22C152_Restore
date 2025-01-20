uint64_t sub_10000275C()
{
  uint64_t result;

  sub_1000027C0();
  result = sub_100003770();
  qword_100008170 = result;
  return result;
}

unint64_t sub_1000027C0()
{
  unint64_t result = qword_100008138;
  if (!qword_100008138)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008138);
  }
  return result;
}

uint64_t sub_100002800()
{
  sub_1000036F0();
  uint64_t result = sub_1000036E0();
  qword_100008178 = result;
  return result;
}

id sub_100002834@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_100003720();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100008130 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100002D5C(v4, (uint64_t)qword_100008180);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  v10 = sub_100003710();
  os_log_type_t v11 = sub_100003760();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v22 = (uint64_t)a2;
    v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)v12 = 136315138;
    v20 = v12;
    id v13 = objc_msgSend(v9, "typeName", v12 + 4);
    uint64_t v14 = sub_100003740();
    unint64_t v16 = v15;

    a2 = (void *)v22;
    uint64_t v23 = sub_100002D94(v14, v16, &v24);
    sub_100003780();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Returning handler for intent %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100003700();
  if (swift_dynamicCastClass())
  {
    if (qword_100008128 != -1) {
      swift_once();
    }
    uint64_t v22 = qword_100008178;
    a2[3] = sub_1000036F0();
    v17 = (void *)v22;
    *a2 = v22;
    return v17;
  }
  else
  {
    id result = (id)sub_1000037D0();
    __break(1u);
  }
  return result;
}

id sub_100002C14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100002C6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *sub_100002CC8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100002D0C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100002D5C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002D94(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002E68(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000354C((uint64_t)v12, *a3);
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
      sub_10000354C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100002D0C(v12);
  return v7;
}

uint64_t sub_100002E68(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100002FC0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100003790();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100003098(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1000037B0();
    if (!v8)
    {
      uint64_t result = sub_1000037C0();
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

void *sub_100002FC0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000037E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100003098(uint64_t a1, unint64_t a2)
{
  objc_super v2 = sub_100003130(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_10000330C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_10000330C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100003130(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100003750();
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
  unint64_t v3 = sub_1000032A4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1000037A0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_1000037E0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_1000037C0();
  __break(1u);
  return result;
}

void *sub_1000032A4(uint64_t a1, uint64_t a2)
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
  sub_1000035A8(&qword_100008168);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000330C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000035A8(&qword_100008168);
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
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1000034BC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000033E4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1000033E4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000037E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1000034BC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1000037E0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_10000354C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000035A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000035F0()
{
  uint64_t v0 = sub_100003720();
  sub_10000367C(v0, qword_100008180);
  sub_100002D5C(v0, (uint64_t)qword_100008180);
  if (qword_100008120 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100008170;
  return sub_100003730();
}

uint64_t *sub_10000367C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000036E0()
{
  return static LaunchAppIntentHandler.handlerForIntentExtension()();
}

uint64_t sub_1000036F0()
{
  return type metadata accessor for LaunchAppIntentHandler();
}

uint64_t sub_100003700()
{
  return type metadata accessor for LaunchAppIntent();
}

uint64_t sub_100003710()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003720()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003730()
{
  return Logger.init(_:)();
}

uint64_t sub_100003740()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100003750()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100003760()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100003770()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100003780()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100003790()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000037A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000037B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000037C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000037D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000037E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000037F0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
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