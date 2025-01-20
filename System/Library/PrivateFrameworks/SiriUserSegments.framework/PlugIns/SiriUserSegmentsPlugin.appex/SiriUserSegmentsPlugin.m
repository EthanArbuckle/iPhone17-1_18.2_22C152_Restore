id SiriUserSegmentsPlugin.perform(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  Class isa;
  uint64_t v9;

  v1 = sub_1000039B0();
  v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (id)sub_1000039A0();
  sub_100003990();
  if (!v0)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    sub_100003364((uint64_t)&_swiftEmptyArrayStorage);
    v6 = objc_allocWithZone((Class)MLRTaskResult);
    isa = sub_1000039C0().super.isa;
    swift_bridgeObjectRelease();
    v5 = [v6 initWithJSONResult:isa unprivatizedVector:0];
  }
  return v5;
}

unint64_t sub_100003364(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003768(&qword_1000084E8);
  uint64_t v2 = sub_1000039E0();
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
    sub_100003824(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000037AC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000388C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

id SiriUserSegmentsPlugin.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id SiriUserSegmentsPlugin.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriUserSegmentsPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for SiriUserSegmentsPlugin()
{
  return self;
}

id SiriUserSegmentsPlugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriUserSegmentsPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100003768(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000037AC(uint64_t a1, uint64_t a2)
{
  sub_100003A00();
  sub_1000039D0();
  Swift::Int v4 = sub_100003A10();
  return sub_10000389C(a1, a2, v4);
}

uint64_t sub_100003824(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003768((uint64_t *)&unk_1000084F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000388C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000389C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000039F0() & 1) == 0)
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
      while (!v14 && (sub_1000039F0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100003980()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100003990()
{
  return static SegmentationTask.perform()();
}

uint64_t sub_1000039A0()
{
  return type metadata accessor for SegmentationTask();
}

uint64_t sub_1000039B0()
{
  return type metadata accessor for SegmentationTaskResult();
}

NSDictionary sub_1000039C0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000039D0()
{
  return String.hash(into:)();
}

uint64_t sub_1000039E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000039F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100003A00()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100003A10()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}