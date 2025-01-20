id DatabaseManager.__allocating_init()()
{
  objc_class *v0;
  id v1;
  uint64_t vars8;

  v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id DatabaseManager.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

id DatabaseManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_100005664(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005738(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006478((uint64_t)v12, *a3);
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
      sub_100006478((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006428((uint64_t)v12);
  return v7;
}

uint64_t sub_100005738(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100007320();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000058F4(a5, a6);
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
  uint64_t v8 = sub_100007340();
  if (!v8)
  {
    sub_100007350();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007360();
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

uint64_t sub_1000058F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000598C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005B68(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005B68(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000598C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005B04(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100007330();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007350();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000072C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007360();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007350();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005B04(uint64_t a1, uint64_t a2)
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
  sub_1000064D4();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005B68(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000064D4();
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
  uint64_t result = sub_100007360();
  __break(1u);
  return result;
}

uint64_t sub_100005CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = a1;
  uint64_t v3 = sub_100007220();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  __chkstk_darwin();
  v26 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007280();
  uint64_t v24 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  __chkstk_darwin();
  v22 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100007240();
  uint64_t v7 = *(void *)(v21 - 8);
  __chkstk_darwin();
  int64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007250();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100007260();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  v17 = (uint64_t *)((char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = sub_100007290();
  void *v17 = v23;
  v17[1] = a2;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, enum case for Database.Location.path(_:), v14);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Database.JournalingMode.wal(_:), v10);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Database.RecoveryMode.throw(_:), v21);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v22, enum case for Database.CacheSize.default(_:), v25);
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v26, enum case for Database.VacuumMode.none(_:), v28);
  swift_bridgeObjectRetain();
  char v30 = 0;
  uint64_t v18 = v29;
  uint64_t result = sub_100007270();
  if (!v18)
  {
    sub_100007230();
    return swift_release();
  }
  return result;
}

uint64_t _s25StocksDiagnosticExtension15DatabaseManagerC10checkpointyyF_0()
{
  if (qword_10000C3C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100007210();
  sub_100006398(v0, (uint64_t)qword_10000C430);
  v1 = sub_1000071F0();
  os_log_type_t v2 = sub_100007300();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Performing checkpoint operation on databases", v3, 2u);
    swift_slowDealloc();
  }

  uint64_t v4 = sub_1000071B0();
  sub_100005CB4(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_1000071A0();
  sub_100005CB4(v6, v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_100007190();
  sub_100005CB4(v8, v9);

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for DatabaseManager()
{
  return self;
}

uint64_t sub_100006398(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1000063D0()
{
  unint64_t result = qword_10000C3F0;
  if (!qword_10000C3F0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C3F0);
  }
  return result;
}

uint64_t sub_100006428(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006478(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000064D4()
{
  if (!qword_10000C3F8)
  {
    unint64_t v0 = sub_100007370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C3F8);
    }
  }
}

uint64_t sub_100006530()
{
  uint64_t v0 = sub_100007210();
  sub_1000065B0(v0, qword_10000C430);
  sub_100006398(v0, (uint64_t)qword_10000C430);
  return sub_100007200();
}

uint64_t *sub_1000065B0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000066A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100007180();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007160();
  uint64_t v6 = sub_100007170();
  uint64_t v8 = v7;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  return result;
}

unint64_t *sub_1000067A4(void (*a1)(void *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v5)
  {
    v19 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000069D8(0, v5, 0);
    uint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v8 = (uint64_t *)(a3 + 40);
    while (1)
    {
      uint64_t v9 = *v8;
      v17[0] = *(v8 - 1);
      v17[1] = v9;
      swift_bridgeObjectRetain();
      a1(v18, v17);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      unint64_t v11 = v18[0];
      unint64_t v10 = v18[1];
      v19 = v6;
      unint64_t v13 = v6[2];
      unint64_t v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_1000069D8(v12 > 1, v13 + 1, 1);
        uint64_t v6 = v19;
      }
      v8 += 2;
      v6[2] = v13 + 1;
      uint64_t v14 = &v6[2 * v13];
      v14[4] = v11;
      v14[5] = v10;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

char *sub_1000068CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000070D8();
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100006E14(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000069D8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000069F8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000069F8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_1000070D8();
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100007360();
  __break(1u);
  return result;
}

unint64_t *sub_100006B60()
{
  uint64_t v0 = sub_100007180();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  unint64_t v6 = &v18[-v5];
  sub_1000071E0();
  sub_1000071D0();
  sub_1000071C0();
  swift_release();
  sub_100007160();
  int64_t v7 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  id v8 = [self defaultManager];
  sub_100007170();
  NSString v9 = sub_1000072A0();
  swift_bridgeObjectRelease();
  id v19 = 0;
  id v10 = [v8 contentsOfDirectoryAtPath:v9 error:&v19];

  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = sub_1000072E0();
    id v13 = v11;

    __chkstk_darwin(v14);
    *(void *)&v18[-16] = v6;
    uint64_t v15 = sub_1000067A4((void (*)(void *__return_ptr, void *))sub_100007130, (uint64_t)&v18[-32], v12);
    v7(v6, v0);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = v19;
    sub_100007150();

    swift_willThrow();
    swift_errorRelease();
    v7(v6, v0);
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  return v15;
}

uint64_t sub_100006E14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100007360();
  __break(1u);
  return result;
}

char *_s25StocksDiagnosticExtension0B12FileProviderC5filesSaySSGyF_0()
{
  uint64_t v3 = sub_100006B60();
  uint64_t v4 = sub_1000071B0();
  uint64_t v6 = v5;
  uint64_t v7 = sub_1000071A0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_100007190();
  int64_t v12 = v3[2];
  int64_t v13 = v12 + 3;
  if (__OFADD__(v12, 3))
  {
    __break(1u);
LABEL_15:
    uint64_t v2 = sub_1000068CC((char *)(v1 > 1), v12, 1, v2);
    goto LABEL_9;
  }
  uint64_t v0 = v11;
  uint64_t v23 = v10;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (uint64_t v2 = (char *)v3, v13 > (uint64_t)(v3[3] >> 1)))
  {
    if (v12 <= v13) {
      int64_t v15 = v12 + 3;
    }
    else {
      int64_t v15 = v12;
    }
    uint64_t v2 = sub_1000068CC(isUniquelyReferenced_nonNull_native, v15, 1, (char *)v3);
  }
  int64_t v13 = *((void *)v2 + 2);
  unint64_t v1 = *((void *)v2 + 3);
  int64_t v12 = v13 + 1;
  swift_bridgeObjectRetain();
  if (v13 >= v1 >> 1) {
    goto LABEL_15;
  }
LABEL_9:
  *((void *)v2 + 2) = v12;
  id v16 = &v2[16 * v13];
  *((void *)v16 + 4) = v4;
  *((void *)v16 + 5) = v6;
  unint64_t v17 = *((void *)v2 + 3);
  swift_bridgeObjectRetain();
  if (v12 >= v17 >> 1) {
    uint64_t v2 = sub_1000068CC((char *)(v17 > 1), v13 + 2, 1, v2);
  }
  *((void *)v2 + 2) = v13 + 2;
  uint64_t v18 = &v2[16 * v12];
  *((void *)v18 + 4) = v7;
  *((void *)v18 + 5) = v9;
  unint64_t v20 = *((void *)v2 + 2);
  unint64_t v19 = *((void *)v2 + 3);
  swift_bridgeObjectRetain();
  if (v20 >= v19 >> 1) {
    uint64_t v2 = sub_1000068CC((char *)(v19 > 1), v20 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v20 + 1;
  uint64_t v21 = &v2[16 * v20];
  *((void *)v21 + 4) = v23;
  *((void *)v21 + 5) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for DiagnosticFileProvider()
{
  return self;
}

void sub_1000070D8()
{
  if (!qword_10000C428)
  {
    unint64_t v0 = sub_100007370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C428);
    }
  }
}

uint64_t sub_100007130@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000066A8(a1);
}

uint64_t sub_100007150()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100007160()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100007170()
{
  return URL.path.getter();
}

uint64_t sub_100007180()
{
  return type metadata accessor for URL();
}

uint64_t sub_100007190()
{
  return static Caches.Charts.location.getter();
}

uint64_t sub_1000071A0()
{
  return static Caches.Shared.location.getter();
}

uint64_t sub_1000071B0()
{
  return static Caches.Default.location.getter();
}

uint64_t sub_1000071C0()
{
  return AppGroup.containerURL.getter();
}

uint64_t sub_1000071D0()
{
  return static AppGroup.stocks.getter();
}

uint64_t sub_1000071E0()
{
  return type metadata accessor for AppGroup();
}

uint64_t sub_1000071F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007200()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100007210()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007220()
{
  return type metadata accessor for Database.VacuumMode();
}

void sub_100007230()
{
}

uint64_t sub_100007240()
{
  return type metadata accessor for Database.RecoveryMode();
}

uint64_t sub_100007250()
{
  return type metadata accessor for Database.JournalingMode();
}

uint64_t sub_100007260()
{
  return type metadata accessor for Database.Location();
}

uint64_t sub_100007270()
{
  return Database.__allocating_init(location:journalingMode:recoveryMode:cacheSize:vacuumMode:shouldTakeRBAssertion:busyTimeout:)();
}

uint64_t sub_100007280()
{
  return type metadata accessor for Database.CacheSize();
}

uint64_t sub_100007290()
{
  return type metadata accessor for Database();
}

NSString sub_1000072A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000072B0()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_1000072C0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000072D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000072E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000072F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007300()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100007310()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007320()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100007330()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007340()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007350()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007360()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007370()
{
  return type metadata accessor for _ContiguousArrayStorage();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return [a1 attachmentWithPath:];
}

id objc_msgSend_checkpoint(void *a1, const char *a2, ...)
{
  return _[a1 checkpoint];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_databaseManager(void *a1, const char *a2, ...)
{
  return _[a1 databaseManager];
}

id objc_msgSend_fileProvider(void *a1, const char *a2, ...)
{
  return _[a1 fileProvider];
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return _[a1 files];
}