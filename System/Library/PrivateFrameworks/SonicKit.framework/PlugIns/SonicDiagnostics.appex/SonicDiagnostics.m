id sub_1000026E8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id result;
  NSURL *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  void (*v24)(uint64_t);
  void v25[2];

  v1 = v0;
  sub_100003908();
  __chkstk_darwin();
  v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100003A80();
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = [self defaultManager];
  sub_100003AF0();

  sub_100003960((uint64_t)v3, 0, 1, v4);
  if (sub_1000039E8((uint64_t)v3, 1, v4) == 1)
  {
    sub_100003988((uint64_t)v3, (uint64_t (*)(void))sub_100003908);
    return &_swiftEmptyArrayStorage;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  sub_100003A70(v11);
  v13 = v12;
  v14 = [v1 filesInDir:v12 matchingPattern:0 excludingPattern:0];

  if (!v14 || (v15 = sub_100003AE0(), v14, v16 = sub_1000029EC(v15), swift_bridgeObjectRelease(), !v16))
  {
    v23 = sub_100003A58();
    v24(v23);
    return &_swiftEmptyArrayStorage;
  }
  v17 = v16[2];
  v9 = &_swiftEmptyArrayStorage;
  if (!v17)
  {
LABEL_12:
    v21 = sub_100003A58();
    v22(v21);
    swift_bridgeObjectRelease();
    return v9;
  }
  v25[0] = &_swiftEmptyArrayStorage;
  sub_100003B40();
  v18 = v16 + 5;
  while (1)
  {
    v19 = *(v18 - 1);
    v20 = *v18;
    objc_allocWithZone((Class)DEAttachmentItem);
    swift_bridgeObjectRetain_n();
    result = sub_1000032E8(v19, v20);
    if (!result) {
      break;
    }
    v18 += 2;
    swift_bridgeObjectRelease();
    sub_100003B20();
    sub_100003B50();
    sub_100003B60();
    sub_100003B30();
    if (!--v17)
    {
      v9 = (void *)v25[0];
      goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

void *sub_1000029EC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  v12 = &_swiftEmptyArrayStorage;
  sub_10000334C(0, v2, 0);
  v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_100003640(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000334C(0, v3[2] + 1, 1);
        v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_10000334C((char *)(v5 > 1), v6 + 1, 1);
        v3 = v12;
      }
      v3[2] = v6 + 1;
      v7 = (char *)&v3[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

id sub_100002B34()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100002B90()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SonicDiagnosticsExtension()
{
  return self;
}

char *sub_100002BEC(uint64_t a1)
{
  if (!a1 || !sub_100002C78(a1))
  {
    sub_100003AA0();
    swift_bridgeObjectRelease();
  }
  id v1 = sub_1000026E8();
  swift_bridgeObjectRelease();
  objc_super v2 = sub_10000304C((unint64_t)v1);
  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_100002C78(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003288();
    objc_super v2 = (void *)sub_100003B80();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  sub_1000035AC(a1, v41);
  uint64_t v3 = v41[0];
  uint64_t v4 = v41[3];
  int64_t v29 = (unint64_t)(v41[2] + 64) >> 6;
  uint64_t v30 = v41[1];
  unint64_t v5 = v41[4];
  unint64_t v6 = &__src[40];
  v7 = &__dst[40];
  v8 = &v35;
  uint64_t v9 = &v37;
  unint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v31 = (v5 - 1) & v5;
  int64_t v32 = v4;
  for (unint64_t i = __clz(__rbit64(v5)) | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    sub_1000035E4(*(void *)(v3 + 48) + 40 * i, (uint64_t)__src);
    sub_100003640(*(void *)(v3 + 56) + 32 * i, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    sub_1000035E4((uint64_t)__dst, (uint64_t)v34);
    if (!swift_dynamicCast())
    {
      sub_100003988((uint64_t)__dst, (uint64_t (*)(void))sub_10000369C);
      swift_bridgeObjectRelease();
      sub_100003700();
      swift_release();
      return 0;
    }
    sub_100003640((uint64_t)v7, (uint64_t)v34);
    sub_100003988((uint64_t)__dst, (uint64_t (*)(void))sub_10000369C);
    sub_100003708(v34, v8);
    long long v36 = v33;
    sub_100003708(v8, v9);
    long long v16 = v36;
    sub_100003708(v9, v38);
    sub_100003708(v38, &v36);
    unint64_t result = sub_100003718(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      v19 = v9;
      v20 = v8;
      v21 = v7;
      uint64_t v22 = v3;
      v23 = v6;
      v24 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      _OWORD *v24 = v16;
      unint64_t v6 = v23;
      uint64_t v3 = v22;
      v7 = v21;
      v8 = v20;
      uint64_t v9 = v19;
      v25 = (_OWORD *)(v2[7] + 32 * v17);
      sub_100003790((uint64_t)v25);
      unint64_t result = (unint64_t)sub_100003708(&v36, v25);
      goto LABEL_28;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_100003708(&v36, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v26 = v2[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_34;
    }
    v2[2] = v28;
LABEL_28:
    unint64_t v5 = v31;
    uint64_t v4 = v32;
    if (v31) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_35;
    }
    if (v12 >= v29) {
      goto LABEL_31;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v12);
    int64_t v14 = v4 + 1;
    if (!v13)
    {
      int64_t v14 = v4 + 2;
      if (v4 + 2 >= v29) {
        goto LABEL_31;
      }
      unint64_t v13 = *(void *)(v30 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v4 + 3;
        if (v4 + 3 >= v29) {
          goto LABEL_31;
        }
        unint64_t v13 = *(void *)(v30 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v4 + 4;
          if (v4 + 4 >= v29) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v30 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v4 + 5;
            if (v4 + 5 >= v29) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v30 + 8 * v14);
            if (!v13)
            {
              int64_t v15 = v4 + 6;
              while (v15 < v29)
              {
                unint64_t v13 = *(void *)(v30 + 8 * v15++);
                if (v13)
                {
                  int64_t v14 = v15 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_100003700();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    uint64_t v31 = (v13 - 1) & v13;
    int64_t v32 = v14;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

char *sub_10000304C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100003B70();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v10 = &_swiftEmptyArrayStorage;
  unint64_t result = sub_10000336C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        sub_100003B10();
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      sub_1000038C4();
      swift_dynamicCast();
      uint64_t v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000336C(0, v3[2] + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_10000336C((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v10;
      }
      v3[2] = v8 + 1;
      sub_100003708(&v9, &v3[4 * v8 + 4]);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

void sub_100003288()
{
  if (!qword_100008150)
  {
    unint64_t v0 = sub_100003B90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100008150);
    }
  }
}

id sub_1000032E8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_100003AB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithPath:v3];

  return v4;
}

char *sub_10000334C(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000338C(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_10000336C(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100003498(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_10000338C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003A10(0, &qword_100008178);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_100003498(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003A10(0, &qword_100008168);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12) {
      memmove(v12, v13, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_1000035AC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_1000035E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100003640(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_10000369C()
{
  if (!qword_100008158)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100008158);
    }
  }
}

uint64_t sub_100003700()
{
  return swift_release();
}

_OWORD *sub_100003708(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100003718(uint64_t a1, uint64_t a2)
{
  sub_100003BC0();
  sub_100003AC0();
  Swift::Int v4 = sub_100003BD0();
  return sub_1000037E0(a1, a2, v4);
}

uint64_t sub_100003790(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000037E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100003BB0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100003BB0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000038C4()
{
  unint64_t result = qword_100008160;
  if (!qword_100008160)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008160);
  }
  return result;
}

void sub_100003908()
{
  if (!qword_100008170)
  {
    sub_100003A80();
    unint64_t v0 = sub_100003B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100008170);
    }
  }
}

uint64_t sub_100003960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100003988(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000039E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_100003A10(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_100003BA0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_100003A58()
{
  return v0;
}

void sub_100003A70(NSURL *retstr@<X8>)
{
}

uint64_t sub_100003A80()
{
  return type metadata accessor for URL();
}

uint64_t sub_100003A90()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003AA0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_100003AB0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100003AC0()
{
  return String.hash(into:)();
}

NSArray sub_100003AD0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100003AE0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003AF0()
{
  return NSFileManager.sonicContainerURL.getter();
}

uint64_t sub_100003B00()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100003B10()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100003B20()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100003B30()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100003B40()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100003B50()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100003B60()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100003B70()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100003B80()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100003B90()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t sub_100003BA0()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_100003BB0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100003BC0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100003BD0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}