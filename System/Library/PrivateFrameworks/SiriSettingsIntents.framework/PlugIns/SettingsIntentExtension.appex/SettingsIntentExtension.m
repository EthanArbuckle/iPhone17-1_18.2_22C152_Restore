uint64_t sub_100003818()
{
  uint64_t result;

  sub_100003884();
  result = sub_100003BF0();
  qword_100008160 = result;
  return result;
}

unint64_t sub_100003884()
{
  unint64_t result = qword_100008120;
  if (!qword_100008120)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008120);
  }
  return result;
}

void sub_1000038C4(void *a1)
{
  sub_100003BD0();
  if (qword_100008118 != -1) {
    swift_once();
  }
  sub_100003BB0();
  sub_100003BE0();
  sub_100003B20(&qword_100008150);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100003D80;
  id v3 = a1;
  id v4 = [v3 description];
  uint64_t v5 = sub_100003BC0();
  uint64_t v7 = v6;

  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = sub_100003B64();
  *(void *)(v2 + 32) = v5;
  *(void *)(v2 + 40) = v7;
  sub_100003BB0();
  swift_bridgeObjectRelease();
  sub_100003C00();
  __break(1u);
}

id sub_100003A70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100003AC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

uint64_t sub_100003B20(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003B64()
{
  unint64_t result = qword_100008158;
  if (!qword_100008158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008158);
  }
  return result;
}

uint64_t sub_100003BB0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100003BC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003BD0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100003BE0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100003BF0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100003C00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}