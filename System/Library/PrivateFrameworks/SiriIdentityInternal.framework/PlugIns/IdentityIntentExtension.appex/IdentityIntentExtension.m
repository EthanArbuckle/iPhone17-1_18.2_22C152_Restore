uint64_t sub_100003554()
{
  uint64_t result;

  sub_100003BC0();
  result = sub_100003BB0();
  qword_100008150 = result;
  return result;
}

id sub_100003588@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v3 = sub_100003BF0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v20 - v8;
  if (qword_100008120 != -1) {
    swift_once();
  }
  sub_100003A80(v3, (uint64_t)qword_100008158);
  v10 = *(void (**)(void))(v4 + 16);
  sub_100003AB8();
  v10();
  v11 = sub_100003BD0();
  os_log_type_t v12 = sub_100003C00();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v20 = v7;
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Returning handler for intent", v13, 2u);
    v7 = v20;
    swift_slowDealloc();
  }

  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v9, v3);
  sub_100003BA0();
  if (swift_dynamicCastClass())
  {
    sub_100003AB8();
    v10();
    v15 = sub_100003BD0();
    os_log_type_t v16 = sub_100003C00();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Intent is SwitchProfileIntent. Returning switchProfileHandler", v17, 2u);
      swift_slowDealloc();
    }

    v14(v7, v3);
    if (qword_100008118 != -1) {
      swift_once();
    }
    uint64_t v21 = qword_100008150;
    a2[3] = sub_100003BC0();
    v18 = (void *)v21;
    *a2 = v21;
    return v18;
  }
  else
  {
    id result = (id)sub_100003C10();
    __break(1u);
  }
  return result;
}

id sub_100003938()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100003990()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *sub_1000039EC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100003A30(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003A80(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003ACC()
{
  uint64_t v0 = sub_100003BF0();
  sub_100003B3C(v0, qword_100008158);
  sub_100003A80(v0, (uint64_t)qword_100008158);
  return sub_100003BE0();
}

uint64_t *sub_100003B3C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003BA0()
{
  return type metadata accessor for SwitchProfileIntent();
}

uint64_t sub_100003BB0()
{
  return static SwitchProfileIntentHandler.handlerForIntentExtension()();
}

uint64_t sub_100003BC0()
{
  return type metadata accessor for SwitchProfileIntentHandler();
}

uint64_t sub_100003BD0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003BE0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003BF0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003C00()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100003C10()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100003C20()
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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