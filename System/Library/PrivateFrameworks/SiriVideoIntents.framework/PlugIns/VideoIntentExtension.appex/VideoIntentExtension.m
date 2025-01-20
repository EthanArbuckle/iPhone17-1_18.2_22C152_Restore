uint64_t sub_1000032B4()
{
  uint64_t result;

  sub_100003AE0();
  result = sub_100003AD0();
  qword_100008170 = result;
  return result;
}

uint64_t sub_1000032E8()
{
  sub_100003B30();
  uint64_t result = sub_100003B20();
  qword_100008178 = result;
  return result;
}

uint64_t sub_10000331C()
{
  sub_100003B50();
  uint64_t result = sub_100003B40();
  qword_100008180 = result;
  return result;
}

uint64_t sub_100003350@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100003BA0();
  sub_100003920();
  uint64_t v4 = v3;
  __chkstk_darwin();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100003B80();
  sub_100003920();
  uint64_t v9 = v8;
  __chkstk_darwin();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003BD0();
  if (qword_100008130 != -1) {
    swift_once();
  }
  sub_100003B70();
  sub_100003B60();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
  if (qword_100008138 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000038E8(v2, (uint64_t)qword_100008190);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v12, v2);
  v13 = sub_100003B90();
  os_log_type_t v14 = sub_100003BC0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Returning handler for intent", v15, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  sub_100003AF0();
  if (swift_dynamicCastClass())
  {
    if (qword_100008118 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_100003AE0();
    v17 = &qword_100008170;
  }
  else
  {
    sub_100003B00();
    if (swift_dynamicCastClass())
    {
      if (qword_100008120 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_100003B30();
      v17 = &qword_100008178;
    }
    else
    {
      sub_100003B10();
      if (!swift_dynamicCastClass())
      {
        sub_100003BF0();
        __break(1u);
        return _objc_retain_x1();
      }
      if (qword_100008128 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_100003B50();
      v17 = &qword_100008180;
    }
  }
  uint64_t v18 = *v17;
  a1[3] = v16;
  *a1 = v18;
  return _objc_retain_x1();
}

id sub_1000037A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000037F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *sub_100003854(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100003898(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000038E8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000393C()
{
  sub_1000039A0();
  uint64_t result = sub_100003BE0();
  qword_100008188 = result;
  return result;
}

unint64_t sub_1000039A0()
{
  unint64_t result = qword_100008168;
  if (!qword_100008168)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008168);
  }
  return result;
}

uint64_t sub_1000039E0()
{
  uint64_t v0 = sub_100003BA0();
  sub_100003A6C(v0, qword_100008190);
  sub_1000038E8(v0, (uint64_t)qword_100008190);
  if (qword_100008130 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100008188;
  return sub_100003BB0();
}

uint64_t *sub_100003A6C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003AD0()
{
  return static PlayVideoIntentHandler.handlerForIntentExtension()();
}

uint64_t sub_100003AE0()
{
  return type metadata accessor for PlayVideoIntentHandler();
}

uint64_t sub_100003AF0()
{
  return type metadata accessor for PlayVideoIntent();
}

uint64_t sub_100003B00()
{
  return type metadata accessor for PlayLiveServiceIntent();
}

uint64_t sub_100003B10()
{
  return type metadata accessor for WatchSportsEventIntent();
}

uint64_t sub_100003B20()
{
  return PlayLiveServiceIntentHandler.__allocating_init()();
}

uint64_t sub_100003B30()
{
  return type metadata accessor for PlayLiveServiceIntentHandler();
}

uint64_t sub_100003B40()
{
  return WatchSportsEventIntentHandler.__allocating_init()();
}

uint64_t sub_100003B50()
{
  return type metadata accessor for WatchSportsEventIntentHandler();
}

uint64_t sub_100003B60()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_100003B70()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_100003B80()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100003B90()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003BA0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003BB0()
{
  return Logger.init(_:)();
}

uint64_t sub_100003BC0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100003BD0()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_100003BE0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100003BF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100003C00()
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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