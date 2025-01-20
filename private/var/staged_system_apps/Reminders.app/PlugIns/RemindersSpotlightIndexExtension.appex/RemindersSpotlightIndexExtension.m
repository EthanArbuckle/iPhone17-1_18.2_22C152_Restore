uint64_t sub_100002D14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = sub_100006978();
  sub_100006664(v0, qword_10000C368);
  v1 = sub_1000064A0(v0, (uint64_t)qword_10000C368);
  if (qword_10000C380 != -1) {
    swift_once();
  }
  v2 = sub_1000064A0(v0, (uint64_t)qword_10000C448);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t TTRSIEIndexRequestHandler.searchableIndex(_:reindexAllSearchableItemsWithAcknowledgementHandler:)(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  sub_100006A48();
  sub_100003050(&qword_10000C388);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100006F80;
  *(void *)(v6 + 56) = sub_1000064D8(0, &qword_10000C390);
  *(void *)(v6 + 64) = sub_100003094();
  *(void *)(v6 + 32) = a1;
  sub_1000064D8(0, &qword_10000C3A0);
  id v7 = a1;
  v8 = (void *)sub_100006A88();
  sub_100006958();
  swift_bridgeObjectRelease();

  id v9 = [self weakSharedInstance];
  NSString v10 = sub_100006998();
  v19 = sub_1000030FC;
  uint64_t v20 = 0;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  v17 = sub_10000310C;
  v18 = &unk_100008568;
  v11 = _Block_copy(&v15);
  id v12 = [v9 syncIndexingPerformerWithReason:v10 errorHandler:v11];
  _Block_release(v11);

  if (!v12) {
    return a2();
  }
  v19 = (void (*)())a2;
  uint64_t v20 = a3;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  v17 = sub_10000318C;
  v18 = &unk_100008590;
  v13 = _Block_copy(&v15);
  swift_retain();
  swift_release();
  [v12 reindexAllSearchableItemsWithAcknowledgementHandler:v13];
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_100003050(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003094()
{
  unint64_t result = qword_10000C398;
  if (!qword_10000C398)
  {
    sub_1000064D8(255, &qword_10000C390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C398);
  }
  return result;
}

void sub_1000030FC()
{
}

void sub_10000310C(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100003174(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003184()
{
  return swift_release();
}

uint64_t sub_10000318C(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void TTRSIEIndexRequestHandler.searchableIndex(_:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:)(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  sub_100003050(&qword_10000C388);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100006F90;
  *(void *)(v8 + 56) = sub_1000064D8(0, &qword_10000C390);
  *(void *)(v8 + 64) = sub_100003094();
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 96) = sub_100003050(&qword_10000C3A8);
  *(void *)(v8 + 104) = sub_100003514();
  *(void *)(v8 + 72) = a2;
  sub_1000064D8(0, &qword_10000C3A0);
  id v9 = a1;
  swift_bridgeObjectRetain();
  NSString v10 = (void *)sub_100006A88();
  sub_100006A68();
  sub_100006958();
  swift_bridgeObjectRelease();

  id v11 = [self weakSharedInstance];
  NSString v12 = sub_100006998();
  v21 = sub_1000035B8;
  uint64_t v22 = 0;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 1107296256;
  v19 = sub_10000310C;
  uint64_t v20 = &unk_1000085B8;
  v13 = _Block_copy(&v17);
  id v14 = [v11 syncIndexingPerformerWithReason:v12 errorHandler:v13];
  _Block_release(v13);

  if (v14)
  {
    Class isa = sub_100006A18().super.isa;
    v21 = a3;
    uint64_t v22 = a4;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 1107296256;
    v19 = sub_10000318C;
    uint64_t v20 = &unk_1000085E0;
    uint64_t v16 = _Block_copy(&v17);
    swift_retain();
    swift_release();
    [v14 reindexSearchableItemsWithIdentifiers:isa acknowledgementHandler:v16];
    _Block_release(v16);
    swift_unknownObjectRelease();
  }
  else
  {
    a3();
  }
}

unint64_t sub_100003514()
{
  unint64_t result = qword_10000C3B0;
  if (!qword_10000C3B0)
  {
    sub_100003570(&qword_10000C3A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C3B0);
  }
  return result;
}

uint64_t sub_100003570(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000035B8()
{
}

void sub_1000035C8()
{
  sub_100006A58();
  sub_100003050(&qword_10000C388);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100006F80;
  swift_getErrorValue();
  uint64_t v1 = sub_100006B08();
  uint64_t v3 = v2;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_1000066C8();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  sub_1000064D8(0, &qword_10000C3A0);
  id v4 = (void *)sub_100006A88();
  sub_100006958();
  swift_bridgeObjectRelease();
}

uint64_t TTRSIEIndexRequestHandler.data(for:itemIdentifier:typeIdentifier:)(void *a1, NSObject *a2, NSObject *a3, uint64_t a4, unint64_t a5)
{
  return sub_1000055BC(a1, a2, a3, a4, a5);
}

id TTRSIEIndexRequestHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id TTRSIEIndexRequestHandler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSIEIndexRequestHandler();
  return [super init];
}

id TTRSIEIndexRequestHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSIEIndexRequestHandler();
  [super dealloc];
}

uint64_t sub_100003990(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100003A64(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006604((uint64_t)v12, *a3);
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
      sub_100006604((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000065B4((uint64_t)v12);
  return v7;
}

uint64_t sub_100003A64(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100006AA8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100003C20(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100006AC8();
  if (!v8)
  {
    sub_100006AD8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006AE8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100003C20(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100003CB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100003E98(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100003E98(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100003CB8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100003E30(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006AB8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006AD8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006A08();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006AE8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006AD8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100003E30(uint64_t a1, uint64_t a2)
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
  sub_100003050(&qword_10000C410);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100003E98(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003050(&qword_10000C410);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100006AE8();
  __break(1u);
  return result;
}

uint64_t sub_100003FE8(void *a1, void (**a2)(void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  sub_100006A48();
  sub_100003050(&qword_10000C388);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006F80;
  *(void *)(v5 + 56) = sub_1000064D8(0, &qword_10000C390);
  *(void *)(v5 + 64) = sub_100003094();
  *(void *)(v5 + 32) = a1;
  sub_1000064D8(0, &qword_10000C3A0);
  id v6 = a1;
  int64_t v7 = (void *)sub_100006A88();
  sub_100006958();
  swift_bridgeObjectRelease();

  id v8 = [self weakSharedInstance];
  NSString v9 = sub_100006998();
  uint64_t v18 = sub_1000030FC;
  uint64_t v19 = 0;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_10000310C;
  v17 = &unk_1000086A8;
  uint64_t v10 = _Block_copy(&v14);
  id v11 = [v8 syncIndexingPerformerWithReason:v9 errorHandler:v10];
  _Block_release(v10);

  if (v11)
  {
    uint64_t v18 = sub_10000671C;
    uint64_t v19 = v4;
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 1107296256;
    uint64_t v16 = sub_10000318C;
    v17 = &unk_1000086D0;
    uint64_t v12 = _Block_copy(&v14);
    swift_retain();
    swift_release();
    [v11 reindexAllSearchableItemsWithAcknowledgementHandler:v12];
    _Block_release(v12);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    a2[2](a2);
    return swift_release();
  }
}

void sub_1000042A0(void *a1, uint64_t a2, void (**a3)(void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  sub_100003050(&qword_10000C388);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100006F90;
  *(void *)(v7 + 56) = sub_1000064D8(0, &qword_10000C390);
  *(void *)(v7 + 64) = sub_100003094();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 96) = sub_100003050(&qword_10000C3A8);
  *(void *)(v7 + 104) = sub_100003514();
  *(void *)(v7 + 72) = a2;
  sub_1000064D8(0, &qword_10000C3A0);
  _Block_copy(a3);
  id v8 = a1;
  swift_bridgeObjectRetain();
  NSString v9 = (void *)sub_100006A88();
  sub_100006A68();
  sub_100006958();
  swift_bridgeObjectRelease();

  id v10 = [self weakSharedInstance];
  NSString v11 = sub_100006998();
  uint64_t v20 = sub_1000035B8;
  uint64_t v21 = 0;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_10000310C;
  uint64_t v19 = &unk_100008630;
  uint64_t v12 = _Block_copy(&v16);
  id v13 = [v10 syncIndexingPerformerWithReason:v11 errorHandler:v12];
  _Block_release(v12);

  if (v13)
  {
    Class isa = sub_100006A18().super.isa;
    uint64_t v20 = sub_100006490;
    uint64_t v21 = v6;
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 1107296256;
    uint64_t v18 = sub_10000318C;
    uint64_t v19 = &unk_100008658;
    uint64_t v15 = _Block_copy(&v16);
    swift_retain();
    swift_release();
    [v13 reindexSearchableItemsWithIdentifiers:isa acknowledgementHandler:v15];
    _Block_release(v15);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    a3[2](a3);
    swift_release();
  }
}

NSObject *sub_1000045A0(NSObject *a1, NSObject *a2)
{
  v99 = a2;
  os_log_t v102 = a1;
  uint64_t v98 = sub_1000068E8();
  uint64_t v96 = *(void *)(v98 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v94 = (char *)&v89 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = (void *)sub_100006978();
  uint64_t v97 = *(v101 - 1);
  ((void (*)(void))__chkstk_darwin)();
  v95 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003050(&qword_10000C400);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v89 - v7;
  uint64_t v9 = sub_100006908();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v89 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000068B8();
  sub_100003050(&qword_10000C408);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100006F80;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for REMSearchableItemAttributeName.itemType(_:), v9);
  uint64_t v14 = sub_1000068F8();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v16;
  uint64_t v17 = v100;
  unint64_t v18 = (unint64_t)v99;
  uint64_t v19 = sub_1000068A8();
  v100 = v20;
  if (v17)
  {
    swift_bridgeObjectRelease();
    if (qword_10000C360 != -1) {
      swift_once();
    }
    sub_1000064A0((uint64_t)v101, (uint64_t)qword_10000C368);
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_100006968();
    os_log_type_t v22 = sub_100006A58();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      id v104 = (id)swift_slowAlloc();
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v103 = sub_100003990((uint64_t)v102, v18, (uint64_t *)&v104);
      sub_100006A98();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "TTRSIEIndexRequestHandler: Error occured when querying spotlight for item identifier {itemIdentifier: %s}", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_24:
    swift_willThrow();
    return v21;
  }
  v24 = v19;
  v90 = v6;
  uint64_t v25 = v98;
  swift_bridgeObjectRelease();
  if (!v24)
  {
    if (qword_10000C360 != -1) {
      swift_once();
    }
    sub_1000064A0((uint64_t)v101, (uint64_t)qword_10000C368);
    swift_bridgeObjectRetain_n();
    v43 = sub_100006968();
    os_log_type_t v44 = sub_100006A58();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      id v104 = (id)swift_slowAlloc();
      *(_DWORD *)v45 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v103 = sub_100003990((uint64_t)v102, v18, (uint64_t *)&v104);
      sub_100006A98();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "TTRSIEIndexRequestHandler: Spotlight item identifier does not exist {itemIdentifier: %s}", v45, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v21 = self;
    NSString v53 = sub_100006998();
    [v21 invalidParameterErrorWithDescription:v53];

    goto LABEL_24;
  }
  v93 = v24;
  v92 = v24;
  v26 = v8;
  v91 = v100;
  sub_100006A78();
  uint64_t v27 = v96;
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v96 + 48);
  int v29 = v28(v26, 1, v25);
  uint64_t v30 = v97;
  if (v29 != 1)
  {
    int v46 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v26, v25);
    if (v46 == enum case for REMSearchableItemType.reminder(_:))
    {
      v47 = [objc_allocWithZone((Class)REMStore) init];
      id v104 = 0;
      v48 = v92;
      v49 = [v47 fetchReminderWithObjectID:v92 error:&v104];
      id v50 = v104;
      if (v49)
      {
        uint64_t v21 = v49;
        v51 = v48;
        v52 = v91;
LABEL_29:
        id v56 = v50;
        sub_100006514(v93, v100);

        return v21;
      }
      id v66 = v104;
      sub_100006878();

      swift_willThrow();
      if (qword_10000C360 != -1) {
        swift_once();
      }
      sub_1000064A0((uint64_t)v101, (uint64_t)qword_10000C368);
      unint64_t v67 = v18;
      swift_bridgeObjectRetain();
      v68 = v48;
      swift_errorRetain();
      swift_bridgeObjectRetain();
      v69 = v68;
      swift_errorRetain();
      v70 = sub_100006968();
      os_log_type_t v71 = sub_100006A58();
      int v72 = v71;
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v73 = swift_slowAlloc();
        v74 = (void *)swift_slowAlloc();
        v101 = (void *)swift_slowAlloc();
        id v104 = v101;
        *(_DWORD *)uint64_t v73 = 136315650;
        LODWORD(v98) = v72;
        swift_bridgeObjectRetain();
        uint64_t v103 = sub_100003990((uint64_t)v102, v67, (uint64_t *)&v104);
        sub_100006A98();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v73 + 12) = 2112;
        uint64_t v103 = (uint64_t)v69;
        v75 = v69;
        sub_100006A98();
        os_log_t v102 = v70;
        uint64_t v21 = v93;
        void *v74 = v93;

        *(_WORD *)(v73 + 22) = 2080;
        swift_getErrorValue();
        uint64_t v76 = sub_100006B18();
        uint64_t v103 = sub_100003990(v76, v77, (uint64_t *)&v104);
        sub_100006A98();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        v78 = "TTRSIEIndexRequestHandler: Error fetching reminder {spotlightItemIdentifier: %s, objectID: %@, error: %s}";
LABEL_42:
        os_log_t v88 = v102;
        _os_log_impl((void *)&_mh_execute_header, v102, (os_log_type_t)v98, v78, (uint8_t *)v73, 0x20u);
        sub_100003050(&qword_10000C3E8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

LABEL_44:
        swift_willThrow();
        sub_100006514(v21, v100);

        return v21;
      }
    }
    else
    {
      if (v46 != enum case for REMSearchableItemType.list(_:))
      {
        (*(void (**)(char *, uint64_t))(v96 + 8))(v26, v25);
        goto LABEL_8;
      }
      v51 = [objc_allocWithZone((Class)REMStore) init];
      id v104 = 0;
      v52 = v92;
      v55 = [v51 fetchListWithObjectID:v92 error:&v104];
      id v50 = v104;
      if (v55)
      {
        uint64_t v21 = v55;
        v47 = v91;
        goto LABEL_29;
      }
      id v79 = v104;
      sub_100006878();

      swift_willThrow();
      if (qword_10000C360 != -1) {
        swift_once();
      }
      sub_1000064A0((uint64_t)v101, (uint64_t)qword_10000C368);
      unint64_t v80 = v18;
      swift_bridgeObjectRetain();
      v81 = v52;
      swift_errorRetain();
      swift_bridgeObjectRetain();
      v69 = v81;
      swift_errorRetain();
      v70 = sub_100006968();
      os_log_type_t v82 = sub_100006A58();
      int v83 = v82;
      if (os_log_type_enabled(v70, v82))
      {
        uint64_t v73 = swift_slowAlloc();
        v84 = (void *)swift_slowAlloc();
        v101 = (void *)swift_slowAlloc();
        id v104 = v101;
        *(_DWORD *)uint64_t v73 = 136315650;
        LODWORD(v98) = v83;
        swift_bridgeObjectRetain();
        uint64_t v103 = sub_100003990((uint64_t)v102, v80, (uint64_t *)&v104);
        sub_100006A98();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v73 + 12) = 2112;
        uint64_t v103 = (uint64_t)v69;
        v85 = v69;
        sub_100006A98();
        os_log_t v102 = v70;
        uint64_t v21 = v93;
        void *v84 = v93;

        *(_WORD *)(v73 + 22) = 2080;
        swift_getErrorValue();
        uint64_t v86 = sub_100006B18();
        uint64_t v103 = sub_100003990(v86, v87, (uint64_t *)&v104);
        sub_100006A98();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        v78 = "TTRSIEIndexRequestHandler: Error fetching list {spotlightItemIdentifier: %s, objectID: %@, error: %s}";
        goto LABEL_42;
      }
    }

    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();

    uint64_t v21 = v93;
    goto LABEL_44;
  }
LABEL_8:
  if (qword_10000C360 != -1) {
    swift_once();
  }
  v31 = v101;
  uint64_t v32 = sub_1000064A0((uint64_t)v101, (uint64_t)qword_10000C368);
  v33 = v95;
  (*(void (**)(char *, uint64_t, void *))(v30 + 16))(v95, v32, v31);
  v34 = v91;
  v35 = sub_100006968();
  LODWORD(v102) = sub_100006A58();
  BOOL v36 = os_log_type_enabled(v35, (os_log_type_t)v102);
  v37 = v94;
  if (v36)
  {
    v91 = v35;
    uint64_t v38 = swift_slowAlloc();
    id v104 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 136315394;
    uint64_t v39 = (uint64_t)v90;
    v99 = v34;
    sub_100006A78();
    uint64_t v40 = v25;
    if (v28((char *)v39, 1, v25))
    {
      sub_100006554(v39);
      unint64_t v41 = 0xE300000000000000;
      uint64_t v42 = 7104878;
    }
    else
    {
      uint64_t v57 = v96;
      (*(void (**)(char *, uint64_t, uint64_t))(v96 + 16))(v37, v39, v40);
      sub_100006554(v39);
      uint64_t v58 = v40;
      uint64_t v42 = sub_1000068D8();
      unint64_t v41 = v59;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v37, v58);
    }
    v60 = v95;
    uint64_t v103 = sub_100003990(v42, v41, (uint64_t *)&v104);
    sub_100006A98();
    v34 = v99;

    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v61 = sub_1000069A8();
    uint64_t v103 = sub_100003990(v61, v62, (uint64_t *)&v104);
    sub_100006A98();
    swift_bridgeObjectRelease();
    v63 = v91;
    _os_log_impl((void *)&_mh_execute_header, v91, (os_log_type_t)v102, "TTRSIEIndexRequestHandler: Item type does not support exporting to data type {itemType: %s, dataTypeIdentifier: %s}", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void *))(v97 + 8))(v60, v101);
  }
  else
  {

    (*(void (**)(char *, void *))(v30 + 8))(v33, v31);
  }
  v64 = v92;
  uint64_t v21 = self;
  NSString v65 = sub_100006998();
  [v21 invalidParameterErrorWithDescription:v65];

  swift_willThrow();
  sub_100006514(v93, v100);

  return v21;
}

uint64_t sub_1000055BC(void *a1, NSObject *a2, NSObject *a3, uint64_t a4, unint64_t a5)
{
  v99 = a3;
  unint64_t v100 = a5;
  uint64_t v97 = a2;
  uint64_t v98 = a4;
  uint64_t v6 = sub_1000069E8();
  uint64_t v93 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v92 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006948();
  uint64_t v95 = *(void *)(v8 - 8);
  uint64_t v96 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  v91 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v85 - v11;
  if (qword_10000C360 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100006978();
  uint64_t v14 = sub_1000064A0(v13, (uint64_t)qword_10000C368);
  id v15 = a1;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v16 = v15;
  uint64_t v90 = v14;
  uint64_t v17 = sub_100006968();
  os_log_type_t v18 = sub_100006A68();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v89 = v6;
    uint64_t v21 = v20;
    os_log_type_t v22 = (void *)swift_slowAlloc();
    uint64_t v87 = swift_slowAlloc();
    v101[0] = v87;
    *(_DWORD *)uint64_t v21 = 138412802;
    int v86 = v19;
    uint64_t v102 = (uint64_t)v16;
    id v23 = v16;
    os_log_t v88 = v12;
    id v24 = v23;
    uint64_t v26 = v98;
    uint64_t v25 = v99;
    os_log_t v85 = v17;
    uint64_t v27 = v97;
    sub_100006A98();
    *os_log_type_t v22 = v16;

    unint64_t v28 = v100;
    uint64_t v12 = v88;
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v102 = sub_100003990((uint64_t)v27, (unint64_t)v25, v101);
    sub_100006A98();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v102 = sub_100003990(v26, v28, v101);
    sub_100006A98();
    swift_bridgeObjectRelease_n();
    os_log_t v29 = v85;
    _os_log_impl((void *)&_mh_execute_header, v85, (os_log_type_t)v86, "TTRSIEIndexRequestHandler: Generating data representation of an item {searchableIndex: %@, itemIdentifier: %s, typeIdentifier, %s}", (uint8_t *)v21, 0x20u);
    sub_100003050(&qword_10000C3E8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v89;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  sub_100006928();
  uint64_t v30 = sub_100006918();
  uint64_t v32 = v31;
  v33 = *(void (**)(char *, uint64_t))(v95 + 8);
  v33(v12, v96);
  if (v30 == v98 && v32 == v100)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v30 = sub_100006AF8();
  swift_bridgeObjectRelease();
  if (v30)
  {
LABEL_10:
    uint64_t v34 = v94;
    v35 = sub_1000045A0(v97, v99);
    if (!v34)
    {
      BOOL v36 = v35;
      swift_getObjectType();
      sub_1000068C8();
      v37 = v92;
      sub_1000069C8();
      uint64_t v30 = sub_1000069B8();
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v93 + 8))(v37, v6);
      if (v39 >> 60 == 15)
      {
        swift_unknownObjectRetain();
        uint64_t v40 = sub_100006968();
        os_log_type_t v41 = sub_100006A58();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)swift_slowAlloc();
          v43 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v42 = 138412290;
          id v44 = [v36 remObjectID];
          v101[0] = (uint64_t)v44;
          sub_100006A98();
          void *v43 = v44;
          swift_unknownObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "TTRSIEIndexRequestHandler: Couldn't encode description string to UTF-8 {objectID: %@}", v42, 0xCu);
          sub_100003050(&qword_10000C3E8);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

LABEL_24:
          uint64_t v58 = self;
          uint64_t v30 = (uint64_t)sub_100006998();
          [v58 internalErrorWithDebugDescription:v30];

          swift_willThrow();
          swift_unknownObjectRelease();
          return v30;
        }
        goto LABEL_23;
      }
LABEL_22:
      swift_unknownObjectRelease();
      return v30;
    }
    return v30;
  }
  uint64_t v30 = (uint64_t)v91;
  sub_100006938();
  uint64_t v45 = sub_100006918();
  uint64_t v47 = v46;
  v33((char *)v30, v96);
  if (v45 == v98 && v47 == v100)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = sub_100006AF8();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      if (sub_1000069A8() == v98 && v60 == v100)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v30 = sub_100006AF8();
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v73 = sub_100006968();
          os_log_type_t v74 = sub_100006A58();
          if (os_log_type_enabled(v73, v74))
          {
            v75 = (uint8_t *)swift_slowAlloc();
            v101[0] = swift_slowAlloc();
            *(_DWORD *)v75 = 136315138;
            unint64_t v76 = v100;
            swift_bridgeObjectRetain();
            uint64_t v102 = sub_100003990(v98, v76, v101);
            sub_100006A98();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v73, v74, "TTRSIEIndexRequestHandler: Unsupported typeIdentifier {typeIdentifier: %s}", v75, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          unint64_t v77 = self;
          uint64_t v30 = (uint64_t)sub_100006998();
          [v77 invalidParameterErrorWithDescription:v30];

          swift_willThrow();
          return v30;
        }
      }
      uint64_t v61 = v94;
      unint64_t v62 = sub_1000045A0(v97, v99);
      if (v61) {
        return v30;
      }
      v64 = v62;
      uint64_t v65 = v63;
      self;
      uint64_t v66 = swift_dynamicCastObjCClass();
      if (v66)
      {
        uint64_t v67 = v66;
        v68 = self;
        sub_100003050(&qword_10000C3F0);
        uint64_t v69 = swift_allocObject();
        *(_OWORD *)(v69 + 16) = xmmword_100006FA0;
        *(void *)(v69 + 32) = v67;
        v101[0] = v69;
        sub_100006A38();
        sub_1000064D8(0, &qword_10000C3F8);
        swift_unknownObjectRetain_n();
        Class isa = sub_100006A18().super.isa;
        swift_bridgeObjectRelease();
        id v71 = [v68 exportICSCalendarFromReminders:isa];

        id v72 = (id)REMiCalendarDataFromICSCalendar();
        uint64_t v30 = sub_100006898();
        swift_unknownObjectRelease_n();

        return v30;
      }
      swift_unknownObjectRetain_n();
      v78 = sub_100006968();
      os_log_type_t v79 = sub_100006A58();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = swift_slowAlloc();
        v81 = (void *)swift_slowAlloc();
        uint64_t v102 = swift_slowAlloc();
        *(_DWORD *)uint64_t v80 = 138412546;
        id v82 = [v64 remObjectID];
        v101[0] = (uint64_t)v82;
        sub_100006A98();
        void *v81 = v82;
        *(_WORD *)(v80 + 12) = 2080;
        v101[0] = swift_getObjectType();
        v101[1] = v65;
        sub_100003050(&qword_10000C3E0);
        uint64_t v83 = sub_1000069F8();
        v101[0] = sub_100003990(v83, v84, &v102);
        sub_100006A98();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v78, v79, "TTRSIEIndexRequestHandler: Unsupported type of REMSearchableItem for exporting to ICS data {objectID: %@, type: %s}", (uint8_t *)v80, 0x16u);
        sub_100003050(&qword_10000C3E8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
      goto LABEL_24;
    }
  }
  uint64_t v48 = v94;
  v49 = sub_1000045A0(v97, v99);
  if (!v48)
  {
    id v50 = v49;
    swift_getObjectType();
    sub_1000068C8();
    v51 = v92;
    sub_1000069D8();
    uint64_t v30 = sub_1000069B8();
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v51, v6);
    if (v53 >> 60 == 15)
    {
      swift_unknownObjectRetain();
      uint64_t v40 = sub_100006968();
      os_log_type_t v54 = sub_100006A58();
      if (os_log_type_enabled(v40, v54))
      {
        v55 = (uint8_t *)swift_slowAlloc();
        id v56 = (void *)swift_slowAlloc();
        *(_DWORD *)v55 = 138412290;
        id v57 = [v50 remObjectID];
        v101[0] = (uint64_t)v57;
        sub_100006A98();
        *id v56 = v57;
        swift_unknownObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v40, v54, "TTRSIEIndexRequestHandler: Couldn't encode description string to UTF-16 {objectID: %@}", v55, 0xCu);
        sub_100003050(&qword_10000C3E8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        goto LABEL_24;
      }
LABEL_23:

      swift_unknownObjectRelease();
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  return v30;
}

uint64_t type metadata accessor for TTRSIEIndexRequestHandler()
{
  return self;
}

uint64_t sub_100006400(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006458()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006490()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000064A0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000064D8(uint64_t a1, unint64_t *a2)
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

void sub_100006514(void *a1, void *a2)
{
  if (a1)
  {
  }
}

uint64_t sub_100006554(uint64_t a1)
{
  uint64_t v2 = sub_100003050(&qword_10000C400);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000065B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006604(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100006664(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000066C8()
{
  unint64_t result = qword_10000C418;
  if (!qword_10000C418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C418);
  }
  return result;
}

id sub_10000679C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for TTRISIEIndexRequestHandler()
{
  return self;
}

uint64_t sub_1000067F8()
{
  uint64_t v0 = sub_100006978();
  sub_100006664(v0, qword_10000C448);
  sub_1000064A0(v0, (uint64_t)qword_10000C448);
  id v1 = [self search];
  return sub_100006988();
}

uint64_t sub_100006868()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006878()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_100006888()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100006898()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000068A8()
{
  return static TTRSearchResultCollector.result(spotlightItemIdentifier:attributesToFetch:)();
}

uint64_t sub_1000068B8()
{
  return type metadata accessor for TTRSearchResultCollector();
}

uint64_t sub_1000068C8()
{
  return dispatch thunk of REMSearchableItem.displayString.getter();
}

uint64_t sub_1000068D8()
{
  return REMSearchableItemType.entityName.getter();
}

uint64_t sub_1000068E8()
{
  return type metadata accessor for REMSearchableItemType();
}

uint64_t sub_1000068F8()
{
  return REMSearchableItemAttributeName.rawValue.getter();
}

uint64_t sub_100006908()
{
  return type metadata accessor for REMSearchableItemAttributeName();
}

uint64_t sub_100006918()
{
  return UTType.identifier.getter();
}

uint64_t sub_100006928()
{
  return static UTType.utf8PlainText.getter();
}

uint64_t sub_100006938()
{
  return static UTType.utf16PlainText.getter();
}

uint64_t sub_100006948()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100006958()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_100006968()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006978()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006988()
{
  return Logger.init(_:)();
}

NSString sub_100006998()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000069A8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000069B8()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_1000069C8()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000069D8()
{
  return static String.Encoding.utf16.getter();
}

uint64_t sub_1000069E8()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000069F8()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_100006A08()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100006A18()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006A28()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006A38()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006A48()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006A58()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006A68()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006A78()
{
  return CSSearchableItemAttributeSet.rem_itemType.getter();
}

uint64_t sub_100006A88()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100006A98()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006AA8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006AB8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006AC8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006AD8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006AE8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006AF8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006B08()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100006B18()
{
  return Error.rem_errorDescription.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t REMiCalendarDataFromICSCalendar()
{
  return _REMiCalendarDataFromICSCalendar();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}