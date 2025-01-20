id sub_100002760@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  void *v2;
  void *v3;
  uint64_t ObjectType;
  id result;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t vars8;
  Swift::String v14;

  v3 = v2;
  v12 = v3;
  ObjectType = swift_getObjectType();
  self;
  if (swift_dynamicCastObjCClass())
  {
    a2[3] = ObjectType;
    *a2 = v12;
    return v12;
  }
  else
  {
    sub_1000035B8(25);
    swift_bridgeObjectRelease();
    v8 = [a1 description];
    v9 = sub_100003568();
    v11 = v10;

    v14._countAndFlagsBits = v9;
    v14._object = v11;
    sub_100003588(v14);
    swift_bridgeObjectRelease();
    result = (id)sub_1000035D8();
    __break(1u);
  }
  return result;
}

void sub_100002920()
{
  id v1 = [v0 mediaItems];
  if (v1)
  {
    v2 = v1;
    unint64_t v3 = sub_100003484();
    unint64_t v4 = sub_1000035A8();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_1000035E8();
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      if ((v4 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_1000035C8();
      }
      else
      {
        if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_34;
        }
        id v5 = *(id *)(v4 + 32);
      }
      v6 = v5;
      swift_bridgeObjectRelease();
      id v7 = [v6 identifier];
      if (!v7)
      {

        goto LABEL_20;
      }
      v8 = v7;
      sub_100003568();

      if (sub_100002F5C())
      {
        swift_bridgeObjectRelease();

        id v9 = [v0 mediaItems];
        if (!v9) {
          return;
        }
        unint64_t v3 = sub_1000035A8();

        if (!(v3 >> 62))
        {
          if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_12;
          }
          goto LABEL_35;
        }
LABEL_34:
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_1000035E8();
        swift_bridgeObjectRelease();
        if (v20)
        {
LABEL_12:
          if ((v3 & 0xC000000000000001) != 0)
          {
            id v10 = (id)sub_1000035C8();
          }
          else
          {
            if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return;
            }
            id v10 = *(id *)(v3 + 32);
          }
          v11 = v10;
          swift_bridgeObjectRelease();
          id v12 = [v11 title];

          if (!v12) {
            return;
          }
LABEL_25:
          sub_100003568();

          return;
        }
LABEL_35:
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_20:
  id v13 = [v0 mediaContainer];
  v14 = v13;
  if (!v13) {
    return;
  }
  id v15 = [v13 identifier];
  if (!v15)
  {

    return;
  }
  v16 = v15;
  sub_100003568();

  if ((sub_100002F5C() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();

  id v17 = [v0 mediaContainer];
  v18 = v17;
  if (v17)
  {
    id v12 = [v17 title];

    if (v12) {
      goto LABEL_25;
    }
  }
}

unint64_t sub_100002C58(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000033C8(&qword_100008610);
  uint64_t v2 = sub_1000035F8();
  unint64_t v3 = (void *)v2;
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
    sub_10000340C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000030C4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100003474(&v17, (_OWORD *)(v3[7] + 32 * result));
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

id sub_100002F00()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super dealloc];
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

uint64_t sub_100002F5C()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_100003598();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_100003598();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_100003618();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_100003598();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_100003598();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1000030C4(uint64_t a1, uint64_t a2)
{
  sub_100003628();
  sub_100003578();
  Swift::Int v4 = sub_100003638();

  return sub_10000313C(a1, a2, v4);
}

unint64_t sub_10000313C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    BOOL v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100003618() & 1) == 0)
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
      while (!v14 && (sub_100003618() & 1) == 0);
    }
  }
  return v6;
}

void sub_100003220(uint64_t a1, uint64_t a2)
{
  sub_100002920();
  if (v4)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    id v7 = [objc_allocWithZone((Class)INPlayMediaIntentResponse) initWithCode:1 userActivity:0];
    sub_1000033C8(&qword_100008608);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100003850;
    *(void *)(inited + 32) = sub_100003568();
    *(void *)(inited + 40) = v9;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v5;
    *(void *)(inited + 56) = v6;
    *(void *)(inited + 80) = sub_100003568();
    *(void *)(inited + 88) = v10;
    *(void *)(inited + 120) = &type metadata for UInt;
    *(void *)(inited + 96) = 2;
    sub_100002C58(inited);
    Class isa = sub_100003558().super.isa;
    swift_bridgeObjectRelease();
    [v7 setNowPlayingInfo:isa];

    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v7);
  }
  else
  {
    id v12 = [objc_allocWithZone((Class)INPlayMediaIntentResponse) initWithCode:6 userActivity:0];
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v12);
  }
}

uint64_t sub_1000033C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000340C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C8(&qword_100008618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100003474(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100003484()
{
  unint64_t result = qword_100008620;
  if (!qword_100008620)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008620);
  }
  return result;
}

void *sub_1000034C4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100003508(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

NSDictionary sub_100003558()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100003568()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003578()
{
  return String.hash(into:)();
}

void sub_100003588(Swift::String a1)
{
}

uint64_t sub_100003598()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

uint64_t sub_1000035A8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_1000035B8(Swift::Int a1)
{
}

uint64_t sub_1000035C8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000035D8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000035E8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000035F8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100003608()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100003618()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100003628()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100003638()
{
  return Hasher._finalize()();
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
  return [super a2];
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}