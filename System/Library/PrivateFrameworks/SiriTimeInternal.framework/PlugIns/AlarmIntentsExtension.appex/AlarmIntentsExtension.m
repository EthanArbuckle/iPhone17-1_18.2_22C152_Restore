uint64_t sub_100003744()
{
  uint64_t v0;

  v0 = sub_100003C50();
  sub_100003BBC(v0, qword_100008150);
  sub_100003B00(v0, (uint64_t)qword_100008150);
  return sub_100003C30();
}

unint64_t sub_100003790@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_100008148 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100003C50();
  sub_100003B00(v4, (uint64_t)qword_100008150);
  id v5 = a1;
  v6 = sub_100003C40();
  os_log_type_t v7 = sub_100003C60();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (void *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    id v10 = v5;
    sub_100003C70();
    void *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Alarm extension received intent: %@", v8, 0xCu);
    sub_100003B78(&qword_100008140);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = sub_100003C20();
  unint64_t result = sub_100003B38();
  a2[3] = result;
  *a2 = v11;
  return result;
}

id sub_100003A14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *sub_100003A6C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100003AB0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003B00(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100003B38()
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

uint64_t sub_100003B78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100003BBC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003C20()
{
  return static AlarmIntentHandlerUtils.selectIntentHandlers(from:)();
}

uint64_t sub_100003C30()
{
  return static SiriTimeLog.alarmExtension.getter();
}

uint64_t sub_100003C40()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003C50()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003C60()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100003C70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100003C80()
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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