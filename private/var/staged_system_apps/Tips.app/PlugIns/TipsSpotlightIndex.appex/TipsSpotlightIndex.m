void sub_100002DD4(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;
  uint64_t vars8;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100002EDC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = *(void *)(sub_100003898() - 8);
  uint64_t v5 = __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v14 = v5;
    swift_errorRetain();
    sub_100003888();
    sub_100003698(&qword_1000081A8);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_100003B50;
    swift_getErrorValue();
    uint64_t v9 = sub_100003908();
    uint64_t v11 = v10;
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 64) = sub_100003780();
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v11;
    sub_1000038C8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    uint64_t v5 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v14);
  }
  return a2(v5);
}

id sub_1000031C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IndexRequestHandler();
  [super dealloc];
}

uint64_t type metadata accessor for IndexRequestHandler()
{
  return self;
}

uint64_t sub_100003230()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100003268()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_100003278(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100003898();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003888();
  sub_1000038A8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  aBlock[4] = sub_10000384C;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100002DD4;
  aBlock[3] = &unk_1000042B0;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v9;
  swift_retain();
  swift_release();
  [v12 reindexAllSearchableItemsWithCompletionHandler:v11];
  _Block_release(v11);
}

void sub_100003430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v20 = a2;
  uint64_t v7 = sub_100003898();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003888();
  sub_100003698(&qword_1000081A8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100003B50;
  aBlock[0] = a1;
  sub_100003698(&qword_1000081B0);
  sub_1000036DC();
  uint64_t v12 = sub_1000038D8();
  uint64_t v14 = v13;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = sub_100003780();
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v14;
  sub_1000038B8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v15 = *(id *)(v4 + OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient);
  Class isa = sub_1000038E8().super.isa;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v20;
  *(void *)(v17 + 24) = a3;
  aBlock[4] = sub_1000037D4;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100002DD4;
  aBlock[3] = &unk_100004238;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v15 reindexSearchableItemsWithIdentifiers:isa completionHandler:v18];
  _Block_release(v18);
}

uint64_t sub_100003698(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000036DC()
{
  unint64_t result = qword_1000081B8;
  if (!qword_1000081B8)
  {
    sub_100003738(&qword_1000081B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000081B8);
  }
  return result;
}

uint64_t sub_100003738(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003780()
{
  unint64_t result = qword_1000081C0;
  if (!qword_1000081C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000081C0);
  }
  return result;
}

uint64_t sub_1000037D4(uint64_t a1)
{
  return sub_100002EDC(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_1000037FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000380C()
{
  return swift_release();
}

uint64_t sub_100003814()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000384C(uint64_t a1)
{
  return sub_100002EDC(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100003888()
{
  return static TipsLog.indexing.getter();
}

uint64_t sub_100003898()
{
  return type metadata accessor for TipsLog();
}

uint64_t sub_1000038A8()
{
  return logInfo(_:_:)();
}

uint64_t sub_1000038B8()
{
  return logInfo(_:_:_:)();
}

uint64_t sub_1000038C8()
{
  return logError(_:_:_:)();
}

uint64_t sub_1000038D8()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSArray sub_1000038E8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000038F8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003908()
{
  return Error.localizedDescription.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
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
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}