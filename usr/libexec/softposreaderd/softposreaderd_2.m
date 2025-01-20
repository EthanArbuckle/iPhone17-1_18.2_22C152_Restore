uint64_t sub_100147F30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001DF8E0);
  v1 = sub_100003E78(v0, (uint64_t)qword_1001DF8E0);
  if (qword_1001D9240 != -1) {
    swift_once();
  }
  v2 = sub_100003E78(v0, (uint64_t)qword_1001E0FE0);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *sub_100147FF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  sub_1000EE43C(a1, a2, __src);
  if (v5)
  {
    swift_bridgeObjectRelease();
    swift_errorRetain();
    sub_10002A974(2015, 0, 0, v5);
    swift_errorRelease();
    swift_willThrow();
    return (void *)swift_errorRelease();
  }
  memcpy(__dst, __src, sizeof(__dst));
  v23[0] = __src[11];
  v23[1] = __src[12];
  v23[2] = __src[13];
  v23[3] = __src[14];
  __src[21] = __src[7];
  __src[22] = __src[8];
  long long v21 = __src[9];
  long long v22 = __src[10];
  __src[17] = __src[3];
  __src[18] = __src[4];
  __src[19] = __src[5];
  __src[20] = __src[6];
  sub_100147B0C((uint64_t)v23, (uint64_t)v24);
  memcpy(v19, __src, sizeof(v19));
  sub_100147B0C((uint64_t)v24, (uint64_t)v25);
  if (!v25[1])
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  long long v10 = v21;
  swift_bridgeObjectRetain();
  sub_100068C50((uint64_t)__src);
  sub_10002A408((uint64_t)v24);
  if (String.count.getter() != 36)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100062020((uint64_t)__src);
    sub_10002A434((uint64_t)v24);
    goto LABEL_13;
  }
  sub_100117604();
  uint64_t v11 = String.count.getter();
  swift_bridgeObjectRelease();
  if (v11 != 32)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (!*((void *)&v10 + 1))
  {
LABEL_12:
    swift_bridgeObjectRelease();
    sub_100062020((uint64_t)__src);
    goto LABEL_13;
  }
  if (v10 == __PAIR128__(a4, a3))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100062020((uint64_t)__src);
LABEL_19:
    result = memcpy(a5, __dst, 0x110uLL);
    a5[17] = xmmword_10018E560;
    return result;
  }
  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100062020((uint64_t)__src);
  if (v16) {
    goto LABEL_19;
  }
LABEL_13:
  if (qword_1001D9398 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100003E78(v12, (uint64_t)qword_1001DF8E0);
  v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "tpid bad format or supplied seid not matching jwt seid", v15, 2u);
    swift_slowDealloc();
  }

  sub_10002A974(2011, 0, 0, 0);
  swift_willThrow();
  memcpy(v17, v19, sizeof(v17));
  return (void *)sub_100062020((uint64_t)v17);
}

uint64_t sub_100148354()
{
  unint64_t v0 = UUID.uuid.getter();
  int v1 = v0 >> 4;
  unsigned int v2 = v1 - 1;
  if (v1 == 4) {
    unsigned int v3 = (v0 >> 31) & 1;
  }
  else {
    unsigned int v3 = 2;
  }
  if (v2 >= 3) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t StorageSetting.description.getter(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3)
  {
    uint64_t v3 = 0x7261726F706D6574;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v3 = 0x6E6F697461636F6CLL;
LABEL_5:
    uint64_t v6 = v3;
    String.append(_:)(*(Swift::String *)&a1);
    return v6;
  }
  if (a1 ^ 1 | a2) {
    uint64_t v5 = 0x656C6974616C6F76;
  }
  else {
    uint64_t v5 = 0x7261726F706D6574;
  }
  if (a1 | a2) {
    return v5;
  }
  else {
    return 0x3A746C7561666564;
  }
}

uint64_t sub_100148480(uint64_t a1, uint64_t a2)
{
  return _s9SPREngine14StorageSettingO21__derived_enum_equalsySbAC_ACtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_10014849C()
{
  return StorageSetting.description.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t _s9SPREngine14StorageSettingO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if (a3 == 1)
    {
      if (a6 == 1)
      {
        if (a1 == a4 && a2 == a5) {
          return 1;
        }
        return _stringCompareWithSmolCheck(_:_:expecting:)();
      }
    }
    else if (a1 | a2)
    {
      if (a1 ^ 1 | a2)
      {
        if (a6 == 2 && a4 == 2 && !a5) {
          return 1;
        }
      }
      else if (a6 == 2 && a4 == 1 && !a5)
      {
        return 1;
      }
    }
    else if (a6 == 2 && !(a5 | a4))
    {
      return 1;
    }
  }
  else if (!a6)
  {
    if (a1 == a4 && a2 == a5) {
      return 1;
    }
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  return 0;
}

uint64_t destroy for StorageSetting(uint64_t a1)
{
  return sub_10000E260(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s9SPREngine14StorageSettingOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100101284(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for StorageSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100101284(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000E260(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for StorageSetting(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000E260(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageSetting(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StorageSetting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100148710(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100148728(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StorageSetting()
{
  return &type metadata for StorageSetting;
}

uint64_t sub_100148750(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v7 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (a1 == a5 && a2 == a6 && !(a3 >> 16) && v7 == a4 >> 16) {
    return 1;
  }
  else {
    return _stringCompareInternal(_:_:_:_:expecting:)() & 1;
  }
}

unint64_t sub_1001487BC(uint64_t a1, unint64_t a2)
{
  sub_1000A361C(58, 0xE100000000000000, a1, a2);
  if (v4)
  {
    unint64_t v5 = Substring.init(_:)();
    unint64_t v7 = v13;
    uint64_t v9 = v14;
    uint64_t v11 = v15;
    unint64_t result = 15;
  }
  else
  {
    unint64_t v5 = String.subscript.getter();
    unint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    unint64_t result = String.index(after:)();
  }
  uint64_t v16 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v16 >= result >> 14)
  {
    unint64_t v17 = String.subscript.getter();
    unint64_t v19 = v18;
    uint64_t v33 = v11;
    uint64_t v20 = swift_bridgeObjectRelease();
    unint64_t v31 = 47;
    unint64_t v32 = 0xE100000000000000;
    __chkstk_darwin(v20, v21);
    v30[2] = &v31;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_10009394C(0x7FFFFFFFFFFFFFFFLL, 1, sub_1000EC354, (uint64_t)v30, v17, v19);
    uint64_t v23 = v33;
    swift_bridgeObjectRelease();
    if (sub_100148750(0x746C7561666564, 0xE700000000000000, v5, v7, v9, v23))
    {
      swift_bridgeObjectRelease();
LABEL_9:
      swift_bridgeObjectRelease();
      return 0;
    }
    if (sub_100148750(0x7261726F706D6574, 0xE900000000000079, v5, v7, v9, v23))
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = *(void *)(v22 + 16);
      if (v24 != 1)
      {
        if (!v24)
        {
          swift_bridgeObjectRelease();
          return 1;
        }
        swift_bridgeObjectRelease();
        uint64_t v26 = 0xD000000000000016;
        v27 = "invalid temporary name";
LABEL_22:
        v28 = (void *)((unint64_t)(v27 - 32) | 0x8000000000000000);
LABEL_24:
        sub_100029F68(7001, v26, v28, 0);
        swift_willThrow();
        return v23;
      }
    }
    else
    {
      if (sub_100148750(0x656C6974616C6F76, 0xE800000000000000, v5, v7, v9, v23))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 2;
      }
      if ((sub_100148750(0x6E6F697461636F6CLL, 0xE800000000000000, v5, v7, v9, v23) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        unint64_t v31 = 0;
        unint64_t v32 = 0xE000000000000000;
        _StringGuts.grow(_:)(22);
        swift_bridgeObjectRelease();
        unint64_t v31 = 0xD000000000000014;
        unint64_t v32 = 0x800000010019C290;
        v29._countAndFlagsBits = static String._fromSubstring(_:)();
        String.append(_:)(v29);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v26 = v31;
        v28 = (void *)v32;
        goto LABEL_24;
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void *)(v22 + 16);
      if (v25 != 1)
      {
        if (!v25) {
          goto LABEL_9;
        }
        swift_bridgeObjectRelease();
        uint64_t v26 = 0xD000000000000015;
        v27 = "invalid location name";
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v23 = static String._fromSubstring(_:)();
    swift_bridgeObjectRelease();
    return v23;
  }
  __break(1u);
  return result;
}

uint64_t sub_100148C34(uint64_t a1)
{
  uint64_t v3 = sub_100003EB0((uint64_t *)&unk_1001DD410);
  __chkstk_darwin(v3 - 8, v4);
  unint64_t v6 = (uint64_t *)((char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 24))
  {
    unint64_t v6 = 0;
LABEL_16:
    sub_10005F4F8(a1, &qword_1001DD3F0);
    return (uint64_t)v6;
  }
  sub_10013945C(a1, (uint64_t)&v21);
  if (v23)
  {
    int v12 = swift_dynamicCast();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(v6, v12 ^ 1u, 1, v7);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      (*(void (**)(char *, uint64_t *, uint64_t))(v8 + 32))(v11, v6, v7);
      unint64_t v6 = (uint64_t *)v11;
      uint64_t v13 = URL.absoluteString.getter();
      unint64_t v15 = sub_1001487BC(v13, v14);
      if (!v1) {
        unint64_t v6 = (uint64_t *)v15;
      }
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      goto LABEL_16;
    }
  }
  else
  {
    sub_10005F4F8((uint64_t)&v21, &qword_1001DD3F0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  sub_10005F4F8((uint64_t)v6, (uint64_t *)&unk_1001DD410);
  sub_10013945C(a1, (uint64_t)&v21);
  if (v23)
  {
    if (swift_dynamicCast())
    {
      unint64_t v16 = sub_1001487BC(v19, (unint64_t)v20);
      if (!v1) {
        unint64_t v6 = (uint64_t *)v16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    sub_10005F4F8((uint64_t)&v21, &qword_1001DD3F0);
  }
  uint64_t v21 = 0;
  uint64_t v22 = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(27);
  uint64_t v19 = v21;
  uint64_t v20 = v22;
  v17._object = (void *)0x800000010019C270;
  unint64_t v6 = &v19;
  v17._countAndFlagsBits = 0xD000000000000019;
  String.append(_:)(v17);
  uint64_t result = sub_10013945C(a1, (uint64_t)&v21);
  if (v23)
  {
    _print_unlocked<A, B>(_:_:)();
    sub_100006520((uint64_t)&v21);
    sub_100029F68(7001, v19, v20, 0);
    swift_willThrow();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_100148FBC()
{
  uint64_t v1 = v0;
  if (qword_1001D9410 != -1) {
    swift_once();
  }
  uint64_t v2 = static GlobalState.shared;
  [*(id *)(static GlobalState.shared + 72) lock];
  while (*(uint64_t *)(v2 + 96) > 0 || *(unsigned char *)(v2 + 80) == 1)
    [*(id *)(v2 + 72) wait];
  uint64_t v3 = *(void *)(v2 + 88);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  *(void *)(v2 + 88) = v5;
  [*(id *)(v2 + 72) unlock];
  if (*(unsigned char *)(v2 + 32))
  {
    unsigned int v6 = 0;
    double v7 = -INFINITY;
  }
  else
  {
    double v7 = *(double *)(v2 + 24);
    unsigned int v6 = *(_DWORD *)(v2 + 16);
  }
  [*(id *)(v2 + 72) lock];
  uint64_t v8 = *(void *)(v2 + 88);
  BOOL v4 = __OFSUB__(v8, 1);
  uint64_t v9 = v8 - 1;
  if (v4) {
    goto LABEL_49;
  }
  *(void *)(v2 + 88) = v9;
  if (!v9) {
    [*(id *)(v2 + 72) broadcast];
  }
  [*(id *)(v2 + 72) unlock];
  unsigned int v10 = *(_DWORD *)(v1 + 48);
  if (v6 < v10 || v10 >= v6 && v7 < *(double *)(v1 + 56)) {
    return 1;
  }
  [*(id *)(v2 + 72) lock];
  if (*(uint64_t *)(v2 + 96) > 0 || *(unsigned char *)(v2 + 80) == 1)
  {
    do
    {
      do
        [*(id *)(v2 + 72) wait];
      while (*(uint64_t *)(v2 + 96) > 0);
    }
    while ((*(unsigned char *)(v2 + 80) & 1) != 0);
  }
  uint64_t v12 = *(void *)(v2 + 88);
  BOOL v4 = __OFADD__(v12, 1);
  uint64_t v13 = v12 + 1;
  if (v4) {
    goto LABEL_50;
  }
  *(void *)(v2 + 88) = v13;
  [*(id *)(v2 + 72) unlock];
  if (*(unsigned char *)(v2 + 56)) {
    unsigned int v14 = 0;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v2 + 52);
  }
  [*(id *)(v2 + 72) lock];
  uint64_t v15 = *(void *)(v2 + 88);
  BOOL v4 = __OFSUB__(v15, 1);
  uint64_t v16 = v15 - 1;
  if (v4) {
    goto LABEL_51;
  }
  *(void *)(v2 + 88) = v16;
  if (!v16) {
    [*(id *)(v2 + 72) broadcast];
  }
  [*(id *)(v2 + 72) unlock];
  TMGetKernelMonotonicClock();
  if (v14 < v6 || v6 >= v14 && v17 < v7)
  {
    if (qword_1001D93A0 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100003E78(v18, (uint64_t)qword_1001DF8F8);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "corrupt timestamp stored in device", v21, 2u);
      swift_slowDealloc();
    }

    uint64_t v22 = static GlobalState.shared;
    uint64_t result = (uint64_t)[*(id *)(static GlobalState.shared + 72) lock];
    uint64_t v23 = *(void *)(v22 + 96);
    BOOL v4 = __OFADD__(v23, 1);
    uint64_t v24 = v23 + 1;
    if (v4)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v22 + 96) = v24;
      while (*(uint64_t *)(v22 + 88) > 0 || *(unsigned char *)(v22 + 80) == 1)
        uint64_t result = (uint64_t)[*(id *)(v22 + 72) wait];
      uint64_t v25 = *(void *)(v22 + 96);
      BOOL v4 = __OFSUB__(v25, 1);
      uint64_t v26 = v25 - 1;
      if (!v4)
      {
        *(void *)(v22 + 96) = v26;
        *(unsigned char *)(v22 + 80) = 1;
        [*(id *)(v22 + 72) unlock];
        *(void *)(v22 + 16) = 0;
        *(void *)(v22 + 24) = 0;
        *(unsigned char *)(v22 + 32) = 1;
        sub_1001661D8();
        [*(id *)(v22 + 72) lock];
        *(unsigned char *)(v22 + 80) = 0;
        [*(id *)(v22 + 72) broadcast];
        [*(id *)(v22 + 72) unlock];
        goto LABEL_43;
      }
    }
    __break(1u);
    return result;
  }
LABEL_43:
  if (qword_1001D93A0 != -1) {
LABEL_52:
  }
    swift_once();
  uint64_t v27 = type metadata accessor for Logger();
  sub_100003E78(v27, (uint64_t)qword_1001DF8F8);
  swift_retain_n();
  v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315394;
    uint64_t v31 = sub_1001655D0();
    sub_100005EB8(v31, v32, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v33 = sub_1001655D0();
    sub_100005EB8(v33, v34, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "certificate timestamp(%s) is less than last MFD timestamp(%s)", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  return 0;
}

void sub_100149510()
{
  uint64_t v1 = v0;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  SESKeyDelete();

  *(unsigned char *)(v1 + 88) = 1;
}

uint64_t sub_10014971C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (qword_1001D9318 != -1) {
    swift_once();
  }
  uint64_t v8 = *(void *)(v3 + 80);
  id v9 = (id)qword_1001E1150;
  sub_100004B04((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(void *)&long long v17 = 0;
  id v11 = [v9 evaluateAccessControl:v8 operation:3 options:isa error:&v17];

  if (!v11)
  {
    id v15 = (id)v17;
    uint64_t v16 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    sub_10002A180(10003, 0x617461446E676973, (void *)0xE800000000000000, v16);
    swift_errorRelease();
    swift_willThrow();
    return swift_errorRelease();
  }
  id v12 = (id)v17;

  long long v17 = xmmword_10018A340;
  swift_retain();
  sub_1000065D0(a1, a2);
  char v13 = sub_10004ABDC(a3, v3, a1, a2, (uint64_t *)&v17);
  sub_100006628(a1, a2);
  uint64_t result = swift_release();
  if (v4) {
    return sub_10000BF70(v17, *((unint64_t *)&v17 + 1));
  }
  if ((v13 & 1) == 0)
  {
    sub_10002A180(10999, 0xD00000000000002BLL, (void *)0x800000010019C400, 0);
    swift_willThrow();
    return sub_10000BF70(v17, *((unint64_t *)&v17 + 1));
  }
  if (*((void *)&v17 + 1) >> 60 != 15) {
    return v17;
  }
  __break(1u);
  return result;
}

uint64_t sub_100149984(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (qword_1001D9318 != -1) {
    swift_once();
  }
  uint64_t v8 = *(void *)(v3 + 80);
  id v9 = (id)qword_1001E1150;
  sub_100004B04((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(void *)&long long v17 = 0;
  id v11 = [v9 evaluateAccessControl:v8 operation:3 options:isa error:&v17];

  if (!v11)
  {
    id v15 = (id)v17;
    uint64_t v16 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    sub_10002A180(10003, 0x656769446E676973, (void *)0xEA00000000007473, v16);
    swift_errorRelease();
    swift_willThrow();
    return swift_errorRelease();
  }
  id v12 = (id)v17;

  long long v17 = xmmword_10018A340;
  swift_retain();
  sub_1000065D0(a1, a2);
  char v13 = sub_10004B8FC(a3, v3, a1, a2, (uint64_t *)&v17);
  sub_100006628(a1, a2);
  uint64_t result = swift_release();
  if (v4) {
    return sub_10000BF70(v17, *((unint64_t *)&v17 + 1));
  }
  if ((v13 & 1) == 0)
  {
    sub_10002A180(10999, 0xD000000000000038, (void *)0x800000010019C380, 0);
    swift_willThrow();
    return sub_10000BF70(v17, *((unint64_t *)&v17 + 1));
  }
  if (*((void *)&v17 + 1) >> 60 != 15) {
    return v17;
  }
  __break(1u);
  return result;
}

uint64_t sub_100149BF0()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(90);
  v2._countAndFlagsBits = 32;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 60;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0xD000000000000014;
  v6._object = (void *)0x800000010019C430;
  String.append(_:)(v6);
  type metadata accessor for SecAccessControl(0);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 0x6F6C4279656B202CLL;
  v7._object = (void *)0xEB00000000203A62;
  String.append(_:)(v7);
  Swift::String v8 = Data.hexString()();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x203A6661656C202CLL;
  v9._object = (void *)0xE800000000000000;
  String.append(_:)(v9);
  uint64_t v10 = v0[3];
  unint64_t v11 = v1[4];
  sub_1000065D0(v1[3], v11);
  Swift::String v12 = Data.base64EncodedString(options:)(0);
  sub_100006628(v10, v11);
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 0xD000000000000011;
  v13._object = (void *)0x800000010019C450;
  String.append(_:)(v13);
  uint64_t v14 = v1[5];
  int64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain();
    sub_10014B9C4(0, v15, 0);
    uint64_t v16 = (unint64_t *)(v14 + 40);
    do
    {
      uint64_t v17 = *(v16 - 1);
      unint64_t v18 = *v16;
      sub_1000065D0(v17, *v16);
      Swift::String v19 = Data.base64EncodedString(options:)(0);
      v20._countAndFlagsBits = 44;
      v20._object = (void *)0xE100000000000000;
      String.append(_:)(v20);
      sub_100006628(v17, v18);
      unint64_t v22 = _swiftEmptyArrayStorage[2];
      unint64_t v21 = _swiftEmptyArrayStorage[3];
      if (v22 >= v21 >> 1) {
        sub_10014B9C4(v21 > 1, v22 + 1, 1);
      }
      v16 += 2;
      _swiftEmptyArrayStorage[2] = v22 + 1;
      *(Swift::String *)&_swiftEmptyArrayStorage[2 * v22 + 4] = v19;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  v23._countAndFlagsBits = Array.description.getter();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24._object = (void *)0x800000010019C470;
  v24._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v24);
  v25._countAndFlagsBits = sub_1001655D0();
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 32044;
  v26._object = (void *)0xE200000000000000;
  String.append(_:)(v26);
  return 0;
}

uint64_t sub_100149F60()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001DF8F8);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001DF8F8);
  if (qword_1001D9268 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1058);
  Swift::String v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10014A028()
{
  sub_100003EB0((uint64_t *)&unk_1001DA520);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10018CD20;
  *(void *)(v0 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 88) = v4;
  *(void *)(v0 + 96) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 104) = v5;
  *(void *)(v0 + 112) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 120) = v6;
  *(void *)(v0 + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 136) = v7;
  *(void *)(v0 + 144) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 152) = v8;
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 160) = result;
  *(void *)(v0 + 168) = v10;
  qword_1001E1200 = v0;
  return result;
}

void sub_10014A128()
{
  SecAccessControlRef v0 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly, 0x40000001uLL, 0);
  if (v0)
  {
    uint64_t v1 = v0;
    sub_100104D90((uint64_t)&off_1001C55A0);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    SecAccessControlSetConstraints();

    qword_1001E1208 = (uint64_t)v1;
  }
  else
  {
    __break(1u);
  }
}

void sub_10014A1D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
}

void sub_10014A258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
}

void sub_10014A2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(uint64_t, id, Class, Class, __CFString *, Class, id *), uint64_t a7, uint64_t a8)
{
  id v39 = 0;
  id v11 = [self embeddedSecureElementWithError:&v39];
  if (v11)
  {
    Swift::String v12 = v11;
    id v13 = v39;
    id v14 = [v12 serialNumber];

    if (v14)
    {
      v15.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
      v16.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
      uint64_t v17 = qword_1001D9318;
      unint64_t v18 = (id)kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
      if (v17 != -1) {
        swift_once();
      }
      id v19 = [qword_1001E1150 externalizedContext:a7, a8];
      if (v19)
      {
        Swift::String v20 = v19;
        uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v23 = v22;

        Class isa = Data._bridgeToObjectiveC()().super.isa;
        sub_100006628(v21, v23);
        id v39 = 0;
        id v25 = (id)a6(a1, v14, v15.super.isa, v16.super.isa, v18, isa, &v39);

        id v26 = v39;
        uint64_t v27 = v26;
        if (v25)
        {
          uint64_t v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v30 = v29;

          uint64_t v31 = *a5;
          unint64_t v32 = a5[1];
          *a5 = v28;
          a5[1] = v30;
          sub_10000BF70(v31, v32);
        }
        else
        {
          id v34 = v26;
          sub_10002A180(10004, v35, v36, (uint64_t)v27);

          swift_willThrow();
        }
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      sub_10002A180(10004, 0xD000000000000016, (void *)0x800000010019C3C0, 0);
      swift_willThrow();
    }
  }
  else
  {
    id v33 = v39;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t sub_10014A57C()
{
  uint64_t result = 0x6F43737365636361;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x626F6C4279656BLL;
      break;
    case 2:
      uint64_t result = 0x6369666974726563;
      break;
    case 3:
      uint64_t result = 0x73656D695479656BLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10014A628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10014D570(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10014A650(uint64_t a1)
{
  unint64_t v2 = sub_10014DED0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014A68C(uint64_t a1)
{
  unint64_t v2 = sub_10014DED0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10014A6C8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003EB0(&qword_1001DFA10);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  Swift::String v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_10014DED0();
  uint64_t v10 = v3;
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t result = SecAccessControlCopyData();
  if (result)
  {
    Swift::String v12 = (void *)result;
    uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;

    uint64_t v23 = v13;
    unint64_t v24 = v15;
    char v25 = 0;
    sub_1000F13EC();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    else
    {
      uint64_t v21 = v10;
      uint64_t v22 = v6;
      uint64_t v17 = *(void *)(v10 + 64);
      unint64_t v16 = *(void *)(v10 + 72);
      uint64_t v23 = v17;
      unint64_t v24 = v16;
      char v25 = 1;
      sub_1000065D0(v17, v16);
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      sub_100006628(v17, v16);
      uint64_t v18 = *(void *)(v21 + 24);
      unint64_t v19 = *(void *)(v21 + 32);
      uint64_t v23 = v18;
      unint64_t v24 = v19;
      char v25 = 2;
      sub_1000065D0(v18, v19);
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      sub_100006628(v18, v19);
      unint64_t v20 = *(void *)(v21 + 56);
      LODWORD(v23) = *(_DWORD *)(v21 + 48);
      unint64_t v24 = v20;
      char v25 = 3;
      sub_10014DF78();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v5);
    }
    return sub_100006628(v13, v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10014A9C0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    Swift::String v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_10014AA88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a2 + 64);
    for (i = (uint64_t *)(a1 + 64); ; i += 5)
    {
      uint64_t v5 = *(i - 2);
      uint64_t v6 = *(i - 1);
      uint64_t v7 = *i;
      uint64_t v8 = *(v3 - 2);
      uint64_t v9 = *(v3 - 1);
      uint64_t v10 = *v3;
      BOOL v11 = *(i - 4) == *(v3 - 4) && *(i - 3) == *(v3 - 3);
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      if (v5 == v8 && v6 == v9)
      {
        if (v7 != v10) {
          return 0;
        }
      }
      else
      {
        char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0;
        if ((v13 & 1) == 0 || v7 != v10) {
          return result;
        }
      }
      v3 += 5;
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_10014AB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (unint64_t *)(a1 + 40);
    uint64_t v4 = (unint64_t *)(a2 + 40);
    while (1)
    {
      uint64_t v6 = *(v3 - 1);
      unint64_t v5 = *v3;
      uint64_t v8 = *(v4 - 1);
      unint64_t v7 = *v4;
      unint64_t v9 = *v3 >> 62;
      v3 += 2;
      v4 += 2;
      uint64_t v10 = 0;
      switch(v9)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v6), v6))
          {
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
          }
          uint64_t v10 = HIDWORD(v6) - (int)v6;
LABEL_13:
          sub_1000065D0(v6, v5);
          break;
        case 2uLL:
          uint64_t v12 = *(void *)(v6 + 16);
          uint64_t v11 = *(void *)(v6 + 24);
          uint64_t v10 = v11 - v12;
          if (!__OFSUB__(v11, v12)) {
            goto LABEL_13;
          }
          goto LABEL_124;
        case 3uLL:
          break;
        default:
          uint64_t v10 = BYTE6(v5);
          break;
      }
      unint64_t v13 = v7 >> 62;
      switch(v7 >> 62)
      {
        case 1uLL:
          LODWORD(v14) = HIDWORD(v8) - v8;
          if (__OFSUB__(HIDWORD(v8), v8)) {
            goto LABEL_125;
          }
          uint64_t v14 = (int)v14;
LABEL_19:
          if (v10 != v14) {
            goto LABEL_121;
          }
          if (v10 < 1)
          {
LABEL_6:
            sub_100006628(v6, v5);
          }
          else
          {
            switch((int)v9)
            {
              case 1:
                v76 = v3;
                if ((int)v6 > v6 >> 32) {
                  goto LABEL_127;
                }
                sub_1000065D0(v8, v7);
                uint64_t v23 = (char *)__DataStorage._bytes.getter();
                if (!v23) {
                  goto LABEL_33;
                }
                uint64_t v24 = __DataStorage._offset.getter();
                if (__OFSUB__((int)v6, v24)) {
                  goto LABEL_129;
                }
                v23 += (int)v6 - v24;
LABEL_33:
                __DataStorage._length.getter();
                if (!v13)
                {
                  __s1[0] = v8;
                  LOWORD(__s1[1]) = v7;
                  BYTE2(__s1[1]) = BYTE2(v7);
                  BYTE3(__s1[1]) = BYTE3(v7);
                  BYTE4(__s1[1]) = BYTE4(v7);
                  BYTE5(__s1[1]) = BYTE5(v7);
                  if (!v23) {
                    goto LABEL_157;
                  }
                  size_t v41 = BYTE6(v7);
                  v40 = __s1;
                  id v39 = v23;
LABEL_103:
                  int v29 = memcmp(v39, v40, v41);
                  goto LABEL_104;
                }
                if (v13 == 1)
                {
                  if (v8 >> 32 < (int)v8) {
                    goto LABEL_138;
                  }
                  swift_retain();
                  char v25 = (char *)__DataStorage._bytes.getter();
                  if (v25)
                  {
                    uint64_t v26 = __DataStorage._offset.getter();
                    if (__OFSUB__((int)v8, v26)) {
                      goto LABEL_145;
                    }
                    v25 += (int)v8 - v26;
                  }
                  uint64_t v27 = __DataStorage._length.getter();
                  if (v27 >= (v8 >> 32) - (int)v8) {
                    size_t v28 = (v8 >> 32) - (int)v8;
                  }
                  else {
                    size_t v28 = v27;
                  }
                  if (!v23) {
                    goto LABEL_147;
                  }
                  if (!v25) {
                    goto LABEL_148;
                  }
                  int v29 = memcmp(v23, v25, v28);
                  sub_100006628(v8, v7);
                  goto LABEL_72;
                }
                uint64_t v67 = *(void *)(v8 + 16);
                v74 = *(char **)(v8 + 24);
                swift_retain();
                swift_retain();
                uint64_t v68 = __DataStorage._bytes.getter();
                if (v68)
                {
                  uint64_t v69 = __DataStorage._offset.getter();
                  if (__OFSUB__(v67, v69)) {
                    goto LABEL_144;
                  }
                  v68 += v67 - v69;
                }
                if (__OFSUB__(v74, v67)) {
                  goto LABEL_139;
                }
                uint64_t v70 = __DataStorage._length.getter();
                if (v70 >= (uint64_t)&v74[-v67]) {
                  v71 = &v74[-v67];
                }
                else {
                  v71 = (char *)v70;
                }
                v56 = v23;
                uint64_t v3 = v76;
                if (!v23) {
                  goto LABEL_158;
                }
                if (!v68) {
                  goto LABEL_159;
                }
                size_t v55 = (size_t)v71;
                v57 = (const void *)v68;
LABEL_116:
                int v58 = memcmp(v56, v57, v55);
                swift_release();
                goto LABEL_117;
              case 2:
                v77 = v3;
                uint64_t v30 = *(void *)(v6 + 16);
                sub_1000065D0(v8, v7);
                swift_retain();
                swift_retain();
                uint64_t v31 = __DataStorage._bytes.getter();
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = __DataStorage._offset.getter();
                  if (__OFSUB__(v30, v33)) {
                    goto LABEL_128;
                  }
                  v73 = (void *)(v32 + v30 - v33);
                }
                else
                {
                  v73 = 0;
                }
                __DataStorage._length.getter();
                uint64_t v3 = v77;
                if (v13)
                {
                  if (v13 == 1)
                  {
                    if (v8 >> 32 < (int)v8) {
                      goto LABEL_134;
                    }
                    swift_retain();
                    v42 = (char *)__DataStorage._bytes.getter();
                    if (v42)
                    {
                      uint64_t v43 = __DataStorage._offset.getter();
                      if (__OFSUB__((int)v8, v43)) {
                        goto LABEL_143;
                      }
                      v42 += (int)v8 - v43;
                    }
                    uint64_t v44 = __DataStorage._length.getter();
                    if (v44 >= (v8 >> 32) - (int)v8) {
                      size_t v45 = (v8 >> 32) - (int)v8;
                    }
                    else {
                      size_t v45 = v44;
                    }
                    if (!v73) {
                      goto LABEL_150;
                    }
                    uint64_t v3 = v77;
                    if (!v42) {
                      goto LABEL_151;
                    }
                    int v29 = memcmp(v73, v42, v45);
                    sub_100006628(v8, v7);
                    swift_release();
                    swift_release();
LABEL_72:
                    sub_100006628(v8, v7);
LABEL_104:
                    sub_100006628(v6, v5);
                    if (v29) {
                      return 0;
                    }
                  }
                  else
                  {
                    uint64_t v60 = *(void *)(v8 + 16);
                    uint64_t v59 = *(void *)(v8 + 24);
                    swift_retain();
                    swift_retain();
                    v61 = (char *)__DataStorage._bytes.getter();
                    if (v61)
                    {
                      uint64_t v62 = __DataStorage._offset.getter();
                      if (__OFSUB__(v60, v62)) {
                        goto LABEL_142;
                      }
                      v61 += v60 - v62;
                    }
                    BOOL v17 = __OFSUB__(v59, v60);
                    int64_t v63 = v59 - v60;
                    if (v17) {
                      goto LABEL_137;
                    }
                    uint64_t v64 = __DataStorage._length.getter();
                    if (v64 >= v63) {
                      size_t v65 = v63;
                    }
                    else {
                      size_t v65 = v64;
                    }
                    uint64_t v3 = v77;
                    if (!v73) {
                      goto LABEL_155;
                    }
                    if (!v61) {
                      goto LABEL_156;
                    }
                    int v66 = memcmp(v73, v61, v65);
                    swift_release();
                    swift_release();
                    swift_release();
                    swift_release();
                    sub_100006628(v8, v7);
                    sub_100006628(v6, v5);
                    if (v66) {
                      return 0;
                    }
                  }
                }
                else
                {
                  __s1[0] = v8;
                  LOWORD(__s1[1]) = v7;
                  BYTE2(__s1[1]) = BYTE2(v7);
                  BYTE3(__s1[1]) = BYTE3(v7);
                  BYTE4(__s1[1]) = BYTE4(v7);
                  BYTE5(__s1[1]) = BYTE5(v7);
                  if (!v73) {
                    goto LABEL_154;
                  }
                  int v58 = memcmp(v73, __s1, BYTE6(v7));
                  swift_release();
LABEL_117:
                  swift_release();
                  sub_100006628(v8, v7);
                  sub_100006628(v6, v5);
                  if (v58) {
                    return 0;
                  }
                }
                break;
              case 3:
                memset(__s1, 0, 14);
                if (!v13) {
                  goto LABEL_58;
                }
                v75 = v3;
                if (v13 == 1)
                {
                  uint64_t v18 = (v8 >> 32) - (int)v8;
                  if (v8 >> 32 < (int)v8) {
                    goto LABEL_131;
                  }
                  sub_1000065D0(v8, v7);
                  uint64_t v34 = __DataStorage._bytes.getter();
                  if (!v34) {
                    goto LABEL_149;
                  }
                  uint64_t v20 = v34;
                  uint64_t v35 = __DataStorage._offset.getter();
                  uint64_t v22 = (int)v8 - v35;
                  if (__OFSUB__((int)v8, v35)) {
                    goto LABEL_133;
                  }
LABEL_53:
                  uint64_t v36 = __DataStorage._length.getter();
                  if (v36 >= v18) {
                    size_t v37 = v18;
                  }
                  else {
                    size_t v37 = v36;
                  }
                  int v38 = memcmp(__s1, (const void *)(v20 + v22), v37);
                  sub_100006628(v8, v7);
                  sub_100006628(v6, v5);
                  uint64_t v3 = v75;
                  if (v38) {
                    return 0;
                  }
                  break;
                }
                uint64_t v52 = *(void *)(v8 + 16);
                uint64_t v53 = *(void *)(v8 + 24);
                sub_1000065D0(v8, v7);
                swift_retain();
                swift_retain();
                uint64_t v48 = __DataStorage._bytes.getter();
                if (v48)
                {
                  uint64_t v54 = __DataStorage._offset.getter();
                  if (__OFSUB__(v52, v54)) {
                    goto LABEL_141;
                  }
                  v48 += v52 - v54;
                }
                BOOL v17 = __OFSUB__(v53, v52);
                int64_t v50 = v53 - v52;
                if (v17) {
                  goto LABEL_136;
                }
                uint64_t v51 = __DataStorage._length.getter();
                uint64_t v3 = v75;
                if (!v48) {
                  goto LABEL_153;
                }
LABEL_84:
                if (v51 >= v50) {
                  size_t v55 = v50;
                }
                else {
                  size_t v55 = v51;
                }
                v56 = __s1;
                v57 = (const void *)v48;
                goto LABEL_116;
              default:
                __s1[0] = v6;
                LOWORD(__s1[1]) = v5;
                BYTE2(__s1[1]) = BYTE2(v5);
                BYTE3(__s1[1]) = BYTE3(v5);
                BYTE4(__s1[1]) = BYTE4(v5);
                BYTE5(__s1[1]) = BYTE5(v5);
                if (!v13)
                {
LABEL_58:
                  uint64_t v78 = v8;
                  __int16 v79 = v7;
                  char v80 = BYTE2(v7);
                  char v81 = BYTE3(v7);
                  char v82 = BYTE4(v7);
                  char v83 = BYTE5(v7);
                  sub_1000065D0(v8, v7);
                  id v39 = __s1;
                  v40 = &v78;
                  size_t v41 = BYTE6(v7);
                  goto LABEL_103;
                }
                v75 = v3;
                if (v13 == 1)
                {
                  uint64_t v18 = (v8 >> 32) - (int)v8;
                  if (v8 >> 32 < (int)v8) {
                    goto LABEL_130;
                  }
                  sub_1000065D0(v8, v7);
                  uint64_t v19 = __DataStorage._bytes.getter();
                  if (!v19)
                  {
                    __DataStorage._length.getter();
                    __break(1u);
LABEL_147:
                    __break(1u);
LABEL_148:
                    __break(1u);
LABEL_149:
                    __DataStorage._length.getter();
                    __break(1u);
LABEL_150:
                    __break(1u);
LABEL_151:
                    __break(1u);
LABEL_152:
                    __break(1u);
LABEL_153:
                    __break(1u);
LABEL_154:
                    __break(1u);
LABEL_155:
                    __break(1u);
LABEL_156:
                    __break(1u);
LABEL_157:
                    __break(1u);
LABEL_158:
                    __break(1u);
LABEL_159:
                    __break(1u);
                    JUMPOUT(0x10014B4B4);
                  }
                  uint64_t v20 = v19;
                  uint64_t v21 = __DataStorage._offset.getter();
                  uint64_t v22 = (int)v8 - v21;
                  if (__OFSUB__((int)v8, v21)) {
                    goto LABEL_132;
                  }
                  goto LABEL_53;
                }
                uint64_t v46 = *(void *)(v8 + 16);
                uint64_t v47 = *(void *)(v8 + 24);
                sub_1000065D0(v8, v7);
                swift_retain();
                swift_retain();
                uint64_t v48 = __DataStorage._bytes.getter();
                if (v48)
                {
                  uint64_t v49 = __DataStorage._offset.getter();
                  if (__OFSUB__(v46, v49)) {
                    goto LABEL_140;
                  }
                  v48 += v46 - v49;
                }
                BOOL v17 = __OFSUB__(v47, v46);
                int64_t v50 = v47 - v46;
                if (v17) {
                  goto LABEL_135;
                }
                uint64_t v51 = __DataStorage._length.getter();
                uint64_t v3 = v75;
                if (!v48) {
                  goto LABEL_152;
                }
                goto LABEL_84;
            }
          }
          if (!--v2) {
            return 1;
          }
          break;
        case 2uLL:
          uint64_t v16 = *(void *)(v8 + 16);
          uint64_t v15 = *(void *)(v8 + 24);
          BOOL v17 = __OFSUB__(v15, v16);
          uint64_t v14 = v15 - v16;
          if (!v17) {
            goto LABEL_19;
          }
          goto LABEL_126;
        case 3uLL:
          if (!v10) {
            goto LABEL_6;
          }
          sub_1000065D0(v8, v7);
LABEL_121:
          sub_100006628(v6, v5);
          return 0;
        default:
          uint64_t v14 = BYTE6(v7);
          goto LABEL_19;
      }
    }
  }
  return 1;
}

uint64_t sub_10014B4E4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = (void *)((unint64_t)a2 >> 62);
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v5 == v23) {
      goto LABEL_5;
    }
    return 0;
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    return 0;
  }
LABEL_5:
  if (!v5) {
    return 1;
  }
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  if (v4) {
    uint64_t v8 = v7;
  }
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v10 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  if (v6) {
    uint64_t v10 = v9;
  }
  if (v8 == v10) {
    return 1;
  }
  if (v5 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  unint64_t v25 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_42:
    uint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_19;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_44;
  }
  uint64_t result = (uint64_t)*(id *)(a1 + 32);
LABEL_19:
  uint64_t v6 = (void *)result;
  unint64_t v24 = a2 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_44:
    id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_22:
    unint64_t v13 = v12;
    type metadata accessor for SecCertificate(0);
    sub_10014E1D8(&qword_1001DFA60, 255, type metadata accessor for SecCertificate);
    char v14 = static _CFObject.== infix(_:_:)();

    if (v14)
    {
      uint64_t v15 = 1 - v5;
      for (uint64_t i = 5; ; ++i)
      {
        uint64_t v5 = v15 + i == 5;
        if (v15 + i == 5) {
          break;
        }
        unint64_t v20 = i - 4;
        if (v25)
        {
          id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v20 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_40:
            __break(1u);
            goto LABEL_41;
          }
          id v21 = *(id *)(a1 + 8 * i);
        }
        uint64_t v22 = v21;
        if (v24)
        {
          id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v20 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_40;
          }
          id v17 = *(id *)(a2 + 8 * i);
        }
        uint64_t v18 = v17;
        char v19 = static _CFObject.== infix(_:_:)();

        if ((v19 & 1) == 0) {
          return v5;
        }
      }
      return v5;
    }
    return 0;
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void sub_10014B7A0()
{
  sub_100006628(v0[3], v0[4]);
  swift_bridgeObjectRelease();
  sub_100006628(v0[8], v0[9]);
  uint64_t v1 = (void *)v0[10];
}

uint64_t sub_10014B7E0()
{
  sub_100006628(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_bridgeObjectRelease();
  sub_100006628(*(void *)(v0 + 64), *(void *)(v0 + 72));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SESSigningIdentity()
{
  return self;
}

uint64_t sub_10014B854()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  sub_1000065D0(v1, *(void *)(*(void *)v0 + 32));
  return v1;
}

uint64_t sub_10014B88C()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_10014B898(uint64_t *a1, uint64_t *a2)
{
  return sub_10014CA30(*a1, *a2);
}

uint64_t sub_10014B8A4()
{
  return sub_100149BF0();
}

void sub_10014B8C8(void *a1@<X0>, void *a2@<X8>)
{
  sub_10014D780(a1);
  if (!v2) {
    *a2 = v4;
  }
}

uint64_t sub_10014B8F4(void *a1)
{
  return sub_10014A6C8(a1);
}

uint64_t sub_10014B918(void *a1, uint64_t a2)
{
  a1[1] = sub_10014E1D8(&qword_1001DA178, a2, (void (*)(uint64_t))type metadata accessor for SESSigningIdentity);
  a1[2] = sub_10014E1D8(&qword_1001DA160, v3, (void (*)(uint64_t))type metadata accessor for SESSigningIdentity);
  uint64_t result = sub_10014E1D8(&qword_1001DF9F0, v4, (void (*)(uint64_t))type metadata accessor for SESSigningIdentity);
  a1[3] = result;
  return result;
}

uint64_t sub_10014B9C4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10014BADC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10014B9E4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10014BC48(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10014BA04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10014BDB4(a1, a2, a3, (void *)*v3, &qword_1001DFA40, (uint64_t (*)(void))&type metadata accessor for Date);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10014BA40(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10014BDB4(a1, a2, a3, (void *)*v3, &qword_1001DFA20, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10014BA7C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10014BFFC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10014BA9C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10014C1A4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10014BABC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10014C34C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10014BADC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003EB0((uint64_t *)&unk_1001DA520);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10014BC48(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003EB0(&qword_1001D9AF0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10014BDB4(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100003EB0(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  id v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  unint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10014BFFC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003EB0(&qword_1001DA140);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 48 * v8) {
      memmove(v10 + 4, a4 + 4, 48 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 48 * v8 || v12 >= v13 + 48 * v8)
  {
    sub_100003EB0(&qword_1001D8770);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10014C1A4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003EB0(&qword_1001DFA28);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 48 * v8) {
      memmove(v10 + 4, a4 + 4, 48 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 48 * v8 || v12 >= v13 + 48 * v8)
  {
    sub_100003EB0(&qword_1001DFA30);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10014C34C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003EB0(&qword_1001DFA38);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10014C4AC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003EB0(&qword_1001DD6E0);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    memcpy(v13, v14, v15);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10014C608(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_100161604((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_10014C6E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  sub_100161604(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_10014C798(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x10014CA00);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_1000065D0(a3, a4);
                  sub_1000065D0(a1, a2);
                  char v17 = sub_10014C6E0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_100006628(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_1000065D0(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_10014C6E0(v21, v22, v20, a3, a4);
                  sub_100006628(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_1000065D0(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1000065D0(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_10014C608(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_100006628(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

BOOL sub_10014CA30(uint64_t a1, uint64_t a2)
{
  if ((sub_10014C798(*(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a2 + 64), *(void *)(a2 + 72)) & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  unint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a2 + 24);
  unint64_t v7 = *(void *)(a2 + 32);
  sub_1000065D0(v4, v5);
  sub_1000065D0(v6, v7);
  char v8 = sub_10014C798(v4, v5, v6, v7);
  sub_100006628(v6, v7);
  sub_100006628(v4, v5);
  if ((v8 & 1) == 0) {
    return 0;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v11 = sub_10014AB7C(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v11 & 1) != 0 && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48) && *(double *)(a1 + 56) == *(double *)(a2 + 56);
}

uint64_t sub_10014CB38(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, double a8)
{
  *(unsigned char *)(v8 + 88) = 0;
  *(void *)(v8 + 72) = a3;
  *(void *)(v8 + 80) = a1;
  *(void *)(v8 + 64) = a2;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 40) = a6;
  *(_DWORD *)(v8 + 48) = a7;
  *(double *)(v8 + 56) = a8;
  swift_beginAccess();
  id v14 = a1;
  sub_1000065D0(a2, a3);
  sub_1000065D0(a4, a5);
  unint64_t v15 = atomic_fetch_add_explicit(&qword_1001E11F0, 1uLL, memory_order_relaxed) + 1;
  swift_endAccess();
  *(void *)(v8 + 16) = v15;
  return v8;
}

uint64_t sub_10014CBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  unint64_t v7 = v6;
  if (qword_1001D9318 != -1) {
    swift_once();
  }
  uint64_t v70 = 0;
  unsigned int v11 = [(id)qword_1001E1150 canEvaluatePolicy:2 error:&v70];
  uint64_t v12 = (uint64_t)v70;
  if (v11)
  {
    uint64_t v68 = a5;
    unint64_t v69 = a6;
    uint64_t v13 = v70;
    id v14 = (id)SESKeyCreate();
    unint64_t v15 = (unint64_t)v70;
    uint64_t v16 = v70;

    uint64_t v67 = (void *)a3;
    if (!v14)
    {
      if (qword_1001D93A0 == -1) {
        goto LABEL_25;
      }
      goto LABEL_49;
    }
    while (1)
    {
      a3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v7 = v17;

      sub_1000065D0(a3, v7);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_100006628(a3, v7);
      NSString v19 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      Class v20 = Data._bridgeToObjectiveC()().super.isa;
      Class v21 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      Class v22 = Int._bridgeToObjectiveC()().super.super.isa;
      uint64_t v70 = v16;
      id v23 = (id)SESKeyAttestWithSEBAA();

      uint64_t v24 = (uint64_t)v70;
      unint64_t v25 = v70;

      if (!v23) {
        break;
      }
      uint64_t v16 = v25;
      uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v27;

      sub_1000065D0(a3, v7);
      if (qword_1001D9410 != -1) {
        swift_once();
      }
      uint64_t v28 = static GlobalState.shared;
      [*(id *)(static GlobalState.shared + 72) lock:v62];
      while (*(uint64_t *)(v28 + 96) > 0 || *(unsigned char *)(v28 + 80) == 1)
        [*(id *)(v28 + 72) wait];
      uint64_t v29 = *(void *)(v28 + 88);
      BOOL v30 = __OFADD__(v29, 1);
      uint64_t v31 = v29 + 1;
      if (v30)
      {
        __break(1u);
      }
      else
      {
        *(void *)(v28 + 88) = v31;
        [*(id *)(v28 + 72) unlock];
        if (*(unsigned char *)(v28 + 56)) {
          int v32 = 0;
        }
        else {
          int v32 = *(_DWORD *)(v28 + 52);
        }
        [*(id *)(v28 + 72) lock];
        uint64_t v33 = *(void *)(v28 + 88);
        BOOL v30 = __OFSUB__(v33, 1);
        uint64_t v34 = v33 - 1;
        if (!v30)
        {
          *(void *)(v28 + 88) = v34;
          if (!v34) {
            [*(id *)(v28 + 72) broadcast];
          }
          [*(id *)(v28 + 72) unlock];
          TMGetKernelMonotonicClock();
          double v36 = v35;
          type metadata accessor for SESSigningIdentity();
          swift_allocObject();
          uint64_t v37 = sub_10014CB38(v67, a3, v7, v26, v15, (uint64_t)_swiftEmptyArrayStorage, v32, v36);
          sub_100006628(v26, v15);
          sub_10000BF70(a3, v7);

          sub_100006628(v68, v69);
          sub_10000BF70(a3, v7);

          return v37;
        }
      }
      __break(1u);
LABEL_49:
      swift_once();
LABEL_25:
      uint64_t v41 = type metadata accessor for Logger();
      sub_100003E78(v41, (uint64_t)qword_1001DF8F8);
      v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "keyBlob nil from SESKeyCreate", v44, 2u);
        swift_slowDealloc();
      }

      if (v16)
      {
        uint64_t v64 = v16;
        size_t v45 = v16;
        uint64_t v46 = Logger.logObject.getter();
        os_log_type_t v47 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = (uint8_t *)swift_slowAlloc();
          int64_t v63 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v48 = 138412290;
          uint64_t v62 = v48 + 4;
          uint64_t v70 = v45;
          size_t v45 = v45;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *int64_t v63 = v15;

          _os_log_impl((void *)&_mh_execute_header, v46, v47, "Error from SESKeyCreate: %@", v48, 0xCu);
          sub_100003EB0((uint64_t *)&unk_1001DA540);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          uint64_t v46 = v45;
        }

        a3 = (uint64_t)v67;
        uint64_t v16 = v64;
      }
      v57 = Logger.logObject.getter();
      os_log_type_t v58 = static os_log_type_t.default.getter();
      uint64_t v37 = v58;
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v59 = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, (os_log_type_t)v37, "Restore SE pairing and retry", v59, 2u);
        swift_slowDealloc();
      }

      sub_1000AE8E4();
      if (v7)
      {
        sub_100006628(v68, v69);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
      uint64_t v70 = v16;
      id v14 = (id)SESKeyCreate();
      uint64_t v37 = v70;

      if (!v14)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v61 = (id)v37;
        sub_10002A180(10001, 0, 0, v37);

        swift_willThrow();
        sub_100006628(v68, v69);

        goto LABEL_21;
      }
      uint64_t v16 = v37;
    }
    sub_1000065D0(a3, v7);
    Class v49 = Data._bridgeToObjectiveC()().super.isa;
    sub_10000BF70(a3, v7);
    uint64_t v70 = 0;
    SESKeyDelete();

    id v39 = v70;
    if (v70)
    {
      int v66 = v25;
      uint64_t v50 = qword_1001D93A0;
      uint64_t v51 = v70;
      if (v50 != -1) {
        swift_once();
      }
      uint64_t v52 = type metadata accessor for Logger();
      sub_100003E78(v52, (uint64_t)qword_1001DF8F8);
      uint64_t v53 = v51;
      uint64_t v54 = Logger.logObject.getter();
      os_log_type_t v55 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        size_t v65 = (void *)swift_slowAlloc();
        *(_DWORD *)v56 = 138412290;
        uint64_t v70 = v53;
        uint64_t v53 = v53;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *size_t v65 = v39;

        _os_log_impl((void *)&_mh_execute_header, v54, v55, "Failed to delete SES key (init): %@", v56, 0xCu);
        sub_100003EB0((uint64_t *)&unk_1001DA540);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v54 = v53;
      }
      unint64_t v25 = v66;
    }
    uint64_t v60 = v25;
    uint64_t v37 = sub_10002A180(10002, 0, 0, v24);

    swift_willThrow();
    sub_100006628(v68, v69);

    sub_10000BF70(a3, v7);
  }
  else
  {
    int v38 = v70;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v37 = v38;
    sub_10002A180(10003, 0xD000000000000014, (void *)0x800000010019C4B0, v12);

    swift_willThrow();
    sub_100006628(a5, a6);

LABEL_21:
    id v39 = (id)a3;
  }

  return v37;
}

uint64_t sub_10014D570(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F43737365636361 && a2 == 0xED00006C6F72746ELL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x626F6C4279656BLL && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6369666974726563 && a2 == 0xEB00000000657461 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73656D695479656BLL && a2 == 0xEC000000706D6174)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

void sub_10014D780(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DecodingError();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v46 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v8);
  unint64_t v48 = (unint64_t)&v39 - v9;
  uint64_t v10 = sub_100003EB0(&qword_1001DF9F8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  id v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_10014DED0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    uint64_t v45 = v11;
    LOBYTE(v50) = 0;
    sub_1000F12F0();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    unint64_t v20 = v53;
    uint64_t v55 = 0;
    uint64_t v44 = v52;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    Class v22 = (void *)SecAccessControlCreateFromData();

    if (v22)
    {
      os_log_type_t v43 = v22;
      LOBYTE(v50) = 3;
      sub_10014DF24();
      KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
      if (v54)
      {
        if (qword_1001D9410 != -1) {
          swift_once();
        }
        uint64_t v26 = static GlobalState.shared;
        [*(id *)(static GlobalState.shared + 72) lock];
        while (*(uint64_t *)(v26 + 96) > 0 || *(unsigned char *)(v26 + 80) == 1)
          [*(id *)(v26 + 72) wait];
        uint64_t v27 = *(void *)(v26 + 88);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
        }
        else
        {
          *(void *)(v26 + 88) = v29;
          [*(id *)(v26 + 72) unlock];
          int v30 = *(_DWORD *)(v26 + 52);
          if (*(unsigned char *)(v26 + 56)) {
            int v30 = 0;
          }
          int v42 = v30;
          [*(id *)(v26 + 72) lock];
          uint64_t v31 = *(void *)(v26 + 88);
          BOOL v28 = __OFSUB__(v31, 1);
          uint64_t v32 = v31 - 1;
          if (!v28)
          {
            *(void *)(v26 + 88) = v32;
            if (!v32) {
              [*(id *)(v26 + 72) broadcast];
            }
            [*(id *)(v26 + 72) unlock];
            TMGetKernelMonotonicClock();
            double v34 = v33;
            goto LABEL_25;
          }
        }
        __break(1u);
      }
      double v34 = *(double *)&v53;
      int v42 = v52;
LABEL_25:
      LOBYTE(v50) = 1;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      unint64_t v40 = v53;
      uint64_t v41 = v52;
      char v49 = 2;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      unint64_t v35 = v51;
      uint64_t v47 = v50;
      unint64_t v48 = v20;
      type metadata accessor for SESSigningIdentity();
      swift_allocObject();
      unint64_t v36 = v40;
      uint64_t v37 = v41;
      uint64_t v38 = v47;
      sub_10014CB38(v43, v41, v40, v47, v35, (uint64_t)_swiftEmptyArrayStorage, v42, v34);
      sub_100006628(v38, v35);
      sub_100006628(v37, v36);

      sub_100006628(v44, v48);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v10);
      sub_100006520((uint64_t)a1);
      return;
    }
    uint64_t v23 = v55;
    if (!v55)
    {
      __break(1u);
      return;
    }
    type metadata accessor for CFError(0);
    sub_10014E1D8((unint64_t *)&qword_1001DE058, 255, type metadata accessor for CFError);
    uint64_t v24 = swift_allocError();
    *unint64_t v25 = v23;
    uint64_t v2 = sub_10002A180(10005, 0x6320737365636361, (void *)0xEE006C6F72746E6FLL, v24);
    swift_errorRelease();
    swift_willThrow();
    sub_100006628(v44, v20);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v10);
  }
  unint64_t v15 = v48;
  uint64_t v52 = v2;
  swift_errorRetain();
  sub_100003EB0((uint64_t *)&unk_1001DD380);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    unint64_t v17 = v46;
    uint64_t v16 = v47;
    (*(void (**)(char *, unint64_t, uint64_t))(v47 + 32))(v46, v15, v4);
    uint64_t v18 = swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 16))(v19, v17, v4);
    sub_10002A180(10005, 0xD000000000000010, (void *)0x800000010019C490, v18);
    swift_errorRelease();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v4);
  }
  swift_errorRelease();
  sub_100006520((uint64_t)a1);
}

unint64_t sub_10014DED0()
{
  unint64_t result = qword_1001DFA00;
  if (!qword_1001DFA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DFA00);
  }
  return result;
}

unint64_t sub_10014DF24()
{
  unint64_t result = qword_1001DFA08;
  if (!qword_1001DFA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DFA08);
  }
  return result;
}

unint64_t sub_10014DF78()
{
  unint64_t result = qword_1001DFA18;
  if (!qword_1001DFA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DFA18);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SESSigningIdentity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    void *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10014E098);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SESSigningIdentity.CodingKeys()
{
  return &type metadata for SESSigningIdentity.CodingKeys;
}

unint64_t sub_10014E0D4()
{
  unint64_t result = qword_1001DFA48;
  if (!qword_1001DFA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DFA48);
  }
  return result;
}

unint64_t sub_10014E12C()
{
  unint64_t result = qword_1001DFA50;
  if (!qword_1001DFA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DFA50);
  }
  return result;
}

unint64_t sub_10014E184()
{
  unint64_t result = qword_1001DFA58;
  if (!qword_1001DFA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DFA58);
  }
  return result;
}

uint64_t sub_10014E1D8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10014E220()
{
  unint64_t v0 = sub_100106AE4(&off_1001C3160);
  sub_100003EB0(&qword_1001DFA68);
  uint64_t result = swift_arrayDestroy();
  qword_1001E1210 = v0;
  return result;
}

uint64_t sub_10014E278(uint64_t *a1)
{
  return _sSC17SPRDepotErrorCodeLeV9SPREngineE9errorName4codeSSSoAAV_tFZ_0(*a1);
}

uint64_t _sSC17SPRDepotErrorCodeLeV9SPREngineE9errorName4codeSSSoAAV_tFZ_0(uint64_t a1)
{
  if (qword_1001D93B8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1001E1210;
  if (*(void *)(qword_1001E1210 + 16) && (uint64_t v3 = sub_100161878(a1), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void *)(*(void *)(v2 + 56) + 16 * v3);
    swift_bridgeObjectRetain();
  }
  else
  {
    v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    return 0x727245746F706544;
  }
  return v5;
}

unint64_t sub_10014E368(uint64_t a1)
{
  unint64_t result = sub_10014E390();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10014E390()
{
  unint64_t result = qword_1001D97E8;
  if (!qword_1001D97E8)
  {
    type metadata accessor for DepotError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001D97E8);
  }
  return result;
}

uint64_t type metadata accessor for MPOCOfflineMonitorBackend()
{
  return self;
}

void *sub_10014E40C@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_1000EE43C(0xD0000000000001CALL, 0x800000010019C500, __src);
  if (!v1)
  {
    memcpy(__dst, __src, sizeof(__dst));
    unint64_t result = (void *)BitString.init(data:unusedBits:)(__dst);
    uint64_t v4 = __src[13];
    if ((__src[13] & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      sub_1000621B0((uint64_t)__dst, (uint64_t)v6);
      v6[34] = v4;
      LOBYTE(v6[35]) = 0;
      v6[36] = 0;
      return memcpy(a1, v6, 0x128uLL);
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for MPOCMonitorBatch(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for MPOCMonitorBatch()
{
  return swift_release();
}

void *assignWithCopy for MPOCMonitorBatch(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for MPOCMonitorBatch(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for MPOCMonitorBatch()
{
  return &type metadata for MPOCMonitorBatch;
}

ValueMetadata *type metadata accessor for MPOCMonitorLoggerError()
{
  return &type metadata for MPOCMonitorLoggerError;
}

uint64_t sub_10014E5A0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001DFB28);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001DFB28);
  if (qword_1001D9258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1028);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10014E668()
{
  uint64_t v0 = type metadata accessor for String.Encoding();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter();
  uint64_t v5 = String.data(using:allowLossyConversion:)();
  unint64_t v7 = v6;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  if (v7 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_1001E1218 = v5;
    unk_1001E1220 = v7;
  }
  return result;
}

uint64_t sub_10014E780@<X0>(char a1@<W0>, void *a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = v4[12];
  char v8 = *(unsigned char *)(*sub_100006788(v4 + 2, v4[5]) + OBJC_IVAR____TtC9SPREngine11Environment_isStorageTemporary);
  uint64_t v9 = (objc_class *)type metadata accessor for CoreDataWrapper();
  id v10 = objc_allocWithZone(v9);
  swift_retain();
  id v11 = sub_10015DE90(0x676E6967676F4CLL, 0xE700000000000000, v7, v8, a1);
  swift_release();
  v14[3] = v9;
  v14[4] = &off_1001CC1E0;
  v14[0] = v11;
  id v12 = v11;
  sub_10014E894(v14);
  if (v3)
  {

    return sub_100006520((uint64_t)v14);
  }
  else
  {
    uint64_t result = sub_100006520((uint64_t)v14);
    a2[3] = v9;
    a2[4] = &off_1001CC1E0;
    *a2 = v12;
  }
  return result;
}

uint64_t sub_10014E894(void *a1)
{
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  char v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006788((void *)(v1 + 56), *(void *)(v1 + 80));
  uint64_t v10 = sub_100093280(*(void *)(*v9 + 16), *(void *)(*v9 + 24), *(void *)(*v9 + 32));
  id v12 = v11;
  static String.Encoding.utf8.getter();
  uint64_t v13 = String.data(using:allowLossyConversion:)();
  unint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (v15 >> 60 == 15)
  {
    uint64_t v40 = 0;
    uint64_t v41 = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v40 = 0xD00000000000002CLL;
    uint64_t v41 = (void *)0x800000010019C720;
    v16._countAndFlagsBits = v10;
    v16._object = v12;
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    sub_100029D50(6002, v40, v41, 0);
    return swift_willThrow();
  }
  uint64_t v42 = v13;
  uint64_t v19 = a1[3];
  uint64_t v18 = a1[4];
  sub_100006788(a1, v19);
  if (qword_1001D93C8 != -1) {
    swift_once();
  }
  uint64_t v20 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 32))(qword_1001E1218, unk_1001E1220, v19, v18);
  if (v2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = v20;
    unint64_t v28 = v21;
    static String.Encoding.utf8.getter();
    uint64_t v29 = String.init(data:encoding:)();
    if (v30)
    {
      if (v29 == v10 && v30 == v12)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v39 = v28;
        char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0)
        {
          uint64_t v34 = a1[3];
          uint64_t v35 = a1[4];
          sub_100006788(a1, v34);
          (*(void (**)(uint64_t, uint64_t))(v35 + 64))(v34, v35);
          uint64_t v36 = a1[3];
          uint64_t v37 = a1[4];
          sub_100006788(a1, v36);
          (*(void (**)(uint64_t, void, uint64_t, unint64_t, uint64_t, uint64_t))(v37 + 40))(qword_1001E1218, unk_1001E1220, v42, v15, v36, v37);
        }
        unint64_t v28 = v39;
      }
      sub_100006628(v27, v28);
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    uint64_t v40 = 0;
    uint64_t v41 = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(47);
    swift_bridgeObjectRelease();
    uint64_t v40 = 0xD00000000000002DLL;
    uint64_t v41 = (void *)0x800000010019C750;
    Swift::String v33 = Data.hexString()();
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
    sub_100029D50(6002, v40, v41, 0);
    swift_willThrow();
    sub_100006628(v27, v28);
  }
  _s3__C4CodeOMa_8(0);
  uint64_t v40 = 6000;
  swift_errorRetain();
  sub_10006212C();
  char v22 = static _ErrorCodeProtocol.~= infix(_:_:)();
  swift_errorRelease();
  if ((v22 & 1) == 0)
  {
LABEL_20:
    uint64_t v26 = v42;
    return sub_10000BF70(v26, v15);
  }
  swift_errorRelease();
  uint64_t v23 = a1[3];
  uint64_t v24 = a1[4];
  sub_100006788(a1, v23);
  uint64_t v25 = v42;
  (*(void (**)(uint64_t, void, uint64_t, unint64_t, uint64_t, uint64_t))(v24 + 40))(qword_1001E1218, unk_1001E1220, v42, v15, v23, v24);
  uint64_t v26 = v25;
  return sub_10000BF70(v26, v15);
}

uint64_t sub_10014ED20()
{
  sub_100006520(v0 + 16);
  sub_100006520(v0 + 56);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PersistenceFactory()
{
  return self;
}

uint64_t sub_10014ED8C@<X0>(char a1@<W0>, void *a2@<X8>)
{
  return sub_10014E780(a1, a2);
}

uint64_t sub_10014EDB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v51 = a4;
  uint64_t v53 = a3;
  uint64_t v52 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v52 - 8);
  __chkstk_darwin(v52, v7);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for URLResourceValues();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  unint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for Environment();
  uint64_t v59 = &off_1001C8D80;
  v57[0] = a1;
  v56[3] = type metadata accessor for SystemInfo();
  v56[4] = &off_1001CB4C8;
  v56[0] = a2;
  if (qword_1001D93C0 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = sub_100003E78(v15, (uint64_t)qword_1001DFB28);
  unint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.debug.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v50 = v16;
  if (v19)
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    id v55 = (id)swift_slowAlloc();
    char v49 = v14;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v54 = sub_100005EB8(0xD00000000000002DLL, 0x800000010019C780, (uint64_t *)&v55);
    unint64_t v14 = v49;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "PersistenceFactory.%s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v21 = v51;
  sub_100009300((uint64_t)v57, v51 + 16);
  sub_100009300((uint64_t)v56, v21 + 56);
  *(void *)(v21 + 96) = v53;
  char v22 = self;
  swift_retain();
  id v23 = [v22 defaultManager];
  uint64_t v24 = (NSURL **)sub_100006788(v57, v58);
  URL._bridgeToObjectiveC()(*v24);
  uint64_t v26 = v25;
  id v55 = 0;
  unsigned int v27 = [v23 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:&v55];

  if (v27)
  {
    id v28 = v55;
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Storage folder created", v31, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    id v32 = v55;
    uint64_t v33 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v46 = v11;
      uint64_t v36 = swift_slowAlloc();
      char v49 = v14;
      uint64_t v37 = (uint8_t *)v36;
      id v55 = (id)swift_slowAlloc();
      uint64_t v47 = v10;
      uint64_t v48 = v6;
      *(_DWORD *)uint64_t v37 = 136315138;
      uint64_t v54 = v33;
      swift_errorRetain();
      sub_100003EB0((uint64_t *)&unk_1001DD380);
      uint64_t v38 = String.init<A>(describing:)();
      uint64_t v54 = sub_100005EB8(v38, v39, (uint64_t *)&v55);
      uint64_t v10 = v47;
      uint64_t v6 = v48;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v11 = v46;
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Unable to create storage folder: %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      unint64_t v14 = v49;
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  URLResourceValues.init()();
  URLResourceValues.isExcludedFromBackup.setter();
  uint64_t v40 = sub_100006788(v57, v58);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, *v40 + OBJC_IVAR____TtC9SPREngine11Environment_storageURL, v52);
  URL.setResourceValues(_:)();
  uint64_t v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v41, v42))
  {
    os_log_type_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v43 = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Storage folder excluded from backup", v43, 2u);
    swift_slowDealloc();
  }

  swift_release();
  sub_100006520((uint64_t)v56);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v52);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_100006520((uint64_t)v57);
  return v51;
}

uint64_t sub_10014F658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = type metadata accessor for Environment();
  char v22 = &off_1001C8D80;
  v20[0] = a1;
  uint64_t v18 = type metadata accessor for SystemInfo();
  BOOL v19 = &off_1001CB4C8;
  v17[0] = a2;
  type metadata accessor for PersistenceFactory();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_10001F1A0((uint64_t)v20, v21);
  __chkstk_darwin(v7, v7);
  uint64_t v9 = (void *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_10001F1A0((uint64_t)v17, v18);
  __chkstk_darwin(v11, v11);
  uint64_t v13 = (void *)((char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = sub_10014EDB0(*v9, *v13, a3, v6);
  sub_100006520((uint64_t)v17);
  sub_100006520((uint64_t)v20);
  return v15;
}

uint64_t sub_10014F838()
{
  sub_1000FAFAC((uint64_t)v14);
  if (v0)
  {
    swift_release();
  }
  else
  {
    sub_1000FB4F0((uint64_t)v12);
    uint64_t v3 = sub_1000FF468();
    uint64_t v4 = sub_10001F1A0((uint64_t)v14, v15);
    __chkstk_darwin(v4, v4);
    uint64_t v6 = (uint64_t *)&v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = sub_10001F1A0((uint64_t)v12, v13);
    __chkstk_darwin(v8, v8);
    uint64_t v10 = (uint64_t *)&v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v11 + 16))(v10);
    uint64_t v1 = sub_10014F658(*v6, *v10, v3);
    sub_100006520((uint64_t)v12);
    sub_100006520((uint64_t)v14);
    swift_release();
  }
  return v1;
}

uint64_t sub_10014FA58()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001DFC18);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001DFC18);
  if (qword_1001D9280 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E10A0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10014FB20()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001DFC30);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001DFC30);
  if (qword_1001D9268 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1058);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

unint64_t sub_10014FBE8()
{
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[2];
  uint64_t v2 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x203A656C6F72202CLL;
  v4._object = (void *)0xE800000000000000;
  String.append(_:)(v4);
  uint64_t v6 = v0[5];
  uint64_t v5 = (void *)v0[6];
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v6;
  v7._object = v5;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 41;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 0xD000000000000011;
}

uint64_t sub_10014FCC8()
{
  uint64_t v1 = v0;
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100003E78(v2, (uint64_t)qword_1001DFC30);
  Swift::String v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_100005EB8(0x656E676953414142, 0xE900000000000072, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s deinit", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_retain();
  dispatch thunk of DispatchWorkItem.cancel()();
  swift_release();
  uint64_t v6 = *(void *)(v1 + 88);
  uint64_t v7 = *(void *)(v1 + 96);
  sub_100006788((void *)(v1 + 64), v6);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7)) {
    sub_100152464();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100006520(v1 + 64);
  sub_100006520(v1 + 104);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006520(v1 + 184);
  sub_100006520(v1 + 224);
  sub_100006520(v1 + 264);
  swift_release();
  sub_100006520(v1 + 312);
  swift_release();
  return v1;
}

uint64_t sub_10014FF1C()
{
  sub_10014FCC8();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BAASigner()
{
  return self;
}

void sub_10014FF74(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t (*a6)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v9 = v7;
  uint64_t v11 = a4;
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12)
  {
    uint64_t v14 = *(void *)(v12 + 24);
    unint64_t v15 = *(void *)(v12 + 32);
    swift_retain();
    sub_1000065D0(v14, v15);
    char v16 = sub_1001540F0();
    sub_100006628(v14, v15);
    if (v16)
    {
      uint64_t v11 = a4;
      uint64_t v17 = a6(a2, a3, a4);
      if (!v7)
      {
        *a7 = v17;
        a7[1] = v18;
        a7[2] = v12;
        return;
      }
      type metadata accessor for Code(0);
      swift_errorRetain();
      sub_100156EAC(&qword_1001D87C8, type metadata accessor for Code);
      char v19 = static _ErrorCodeProtocol.~= infix(_:_:)();
      swift_errorRelease();
      if ((v19 & 1) == 0 || (a5 & 1) == 0)
      {
        swift_release();
        return;
      }
      swift_errorRelease();
      if (qword_1001D93D8 != -1) {
        swift_once();
      }
      uint64_t v20 = type metadata accessor for Logger();
      sub_100003E78(v20, (uint64_t)qword_1001DFC30);
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        id v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Recoverable signature failure", v23, 2u);
        uint64_t v11 = a4;
        swift_slowDealloc();
      }

      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v11 = a4;
    }
    sub_100152464();
    swift_release();
  }
  if (a5)
  {
    sub_100150E50();
    if (!v9)
    {
      uint64_t v25 = v24;
      uint64_t v26 = a6(a2, a3, v11);
      uint64_t v28 = v27;
      sub_100151D7C((uint64_t)v25);
      sub_100152928(v25);
      *a7 = v26;
      a7[1] = v28;
      a7[2] = (uint64_t)v25;
    }
  }
  else
  {
    sub_10002A180(10006, 0, 0, 0);
    swift_willThrow();
  }
}

void sub_100150270(void *a1@<X0>, BOOL *a2@<X8>, double a3@<D0>)
{
  uint64_t v7 = sub_100003EB0(&qword_1001D9AE8);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v13 = __chkstk_darwin(v11, v12);
  unint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v13, v16);
  uint64_t v20 = a1[7];
  if (v20)
  {
    uint64_t v46 = v19;
    uint64_t v47 = (char *)&v44 - v18;
    uint64_t v45 = v17;
    uint64_t v48 = a2;
    type metadata accessor for SecCertificate(0);
    uint64_t v21 = *(void *)(v20 + 24);
    unint64_t v22 = *(void *)(v20 + 32);
    swift_retain();
    sub_1000065D0(v21, v22);
    SecCertificateRef v23 = static SecCertificateRef.parse(derRepresentation:)();
    sub_100006628(v21, v22);
    if (v23)
    {
      uint64_t v24 = a1[36];
      uint64_t v25 = a1[37];
      sub_100006788(a1 + 33, v24);
      (*(void (**)(SecCertificateRef, uint64_t, uint64_t))(v25 + 8))(v23, v24, v25);
      if (v3)
      {
        uint64_t v47 = (char *)v23;
        if (qword_1001D93D8 != -1) {
          swift_once();
        }
        uint64_t v26 = type metadata accessor for Logger();
        sub_100003E78(v26, (uint64_t)qword_1001DFC30);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)swift_slowAlloc();
          uint64_t v50 = swift_slowAlloc();
          *(_DWORD *)uint64_t v29 = 136315138;
          uint64_t v49 = v3;
          swift_errorRetain();
          sub_100003EB0((uint64_t *)&unk_1001DD380);
          uint64_t v30 = String.init<A>(describing:)();
          uint64_t v49 = sub_100005EB8(v30, v31, &v50);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Certificate verification failed: %s", v29, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_release();
          swift_errorRelease();
        }
        else
        {

          swift_release();
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();
        }
        BOOL v32 = 0;
      }
      else
      {
        SecCertificateNotValidAfter();
        uint64_t v33 = v47;
        Date.init(timeIntervalSinceReferenceDate:)();
        sub_100006788(a1 + 28, a1[31]);
        sub_1000238E4((uint64_t)v10);
        uint64_t v34 = v45;
        uint64_t v35 = v46;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v10, 1, v45) == 1)
        {
          uint64_t v36 = v34;
          sub_10001EEA8((uint64_t)v10);
          if (qword_1001D93D8 != -1) {
            swift_once();
          }
          uint64_t v37 = type metadata accessor for Logger();
          sub_100003E78(v37, (uint64_t)qword_1001DFC30);
          uint64_t v38 = Logger.logObject.getter();
          os_log_type_t v39 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v40 = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "Could not calculate secure now", v40, 2u);
            uint64_t v35 = v46;
            swift_slowDealloc();
          }

          swift_release();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v47, v36);
          BOOL v32 = 0;
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v15, v10, v34);
          Date.timeIntervalSince(_:)();
          double v42 = v41;

          swift_release();
          os_log_type_t v43 = *(void (**)(char *, uint64_t))(v35 + 8);
          v43(v15, v34);
          v43(v33, v34);
          BOOL v32 = v42 > a3;
        }
      }
      a2 = v48;
    }
    else
    {
      swift_release();
      BOOL v32 = 0;
      a2 = v48;
    }
  }
  else
  {
    BOOL v32 = 0;
  }
  *a2 = v32;
}

void sub_100150808(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100003EB0(&qword_1001D9AE8);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  unint64_t v31 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100003E78(v12, (uint64_t)qword_1001DFC30);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v28 = v8;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v29 = v9;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = v1;
    uint64_t v33 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v32 = sub_100005EB8(0x656E676953414142, 0xE900000000000072, &v33);
    uint64_t v8 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s.renewImmediately()", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = v30;
    swift_slowDealloc();
    uint64_t v9 = v29;
    swift_slowDealloc();
  }

  uint64_t v18 = a1[7];
  if (v18)
  {
    sub_100006788(a1 + 28, a1[31]);
    swift_retain();
    sub_1000238E4((uint64_t)v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      uint64_t v25 = v31;
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v31, v7, v8);
      sub_100152D5C(*(void *)(v18 + 16), v25, 0);
      swift_release();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v25, v8);
      return;
    }
    swift_release();
    sub_10001EEA8((uint64_t)v7);
  }
  sub_100150E50();
  if (v2)
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)unint64_t v22 = 136315138;
      swift_getErrorValue();
      uint64_t v23 = Error.localizedDescription.getter();
      uint64_t v32 = sub_100005EB8(v23, v24, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error creating identity: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    uint64_t v26 = (uint64_t *)v19;
    sub_100151D7C(v19);
    sub_100152928(v26);
    swift_release();
  }
}

void sub_100150E50()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for UUID();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = sub_100003E78(v7, (uint64_t)qword_1001DFC30);
  swift_retain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  v59[2] = v8;
  uint64_t v60 = v1;
  id v61 = v6;
  if (v11)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    v63[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    v59[1] = v12 + 4;
    swift_retain();
    unint64_t v13 = sub_10014FBE8();
    unint64_t v15 = v14;
    swift_release();
    uint64_t v62 = sub_100005EB8(v13, v15, v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s.createIdentity()", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v16 = *(void *)(v2 + 160);
  uint64_t v17 = *(void *)(v2 + 360);
  uint64_t v18 = (void **)*(id *)(v2 + 152);
  swift_bridgeObjectRetain();
  UUID.init()();
  if (qword_1001D9410 != -1) {
    swift_once();
  }
  uint64_t v19 = static GlobalState.shared;
  [*(id *)(static GlobalState.shared + 72) lock];
  while (*(uint64_t *)(v19 + 96) > 0 || *(unsigned char *)(v19 + 80) == 1)
    [*(id *)(v19 + 72) wait];
  uint64_t v20 = *(void *)(v19 + 88);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  *(void *)(v19 + 88) = v22;
  [*(id *)(v19 + 72) unlock];
  if (*(unsigned char *)(v19 + 56)) {
    int v23 = 0;
  }
  else {
    int v23 = *(_DWORD *)(v19 + 52);
  }
  [*(id *)(v19 + 72) lock];
  uint64_t v24 = *(void *)(v19 + 88);
  BOOL v21 = __OFSUB__(v24, 1);
  uint64_t v25 = v24 - 1;
  if (v21) {
    goto LABEL_32;
  }
  *(void *)(v19 + 88) = v25;
  if (!v25) {
    [*(id *)(v19 + 72) broadcast];
  }
  [*(id *)(v19 + 72) unlock];
  TMGetKernelMonotonicClock();
  double v27 = v26;
  uint64_t v28 = static Data.randomBytes(count:)(0x10uLL);
  uint64_t v29 = (uint64_t)v60;
  unint64_t v31 = sub_10016AEA4((uint64_t)v61, v23, v18, v16, v28, v30, v17, v27);
  uint64_t v32 = v31;
  if (!v29)
  {
    uint64_t isa = (uint64_t)v31[3].isa;
    unint64_t v46 = (unint64_t)v31[4].isa;
    sub_1000065D0(isa, v46);
    sub_100154444(isa, v46);
    sub_100006628(isa, v46);
    uint64_t v47 = *(void *)(v2 + 128);
    id v61 = *(char **)(v2 + 136);
    uint64_t v60 = sub_100006788((void *)(v2 + 104), v47);
    sub_100003EB0(&qword_1001D9B20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1001861D0;
    *(void *)(inited + 32) = 1701605234;
    *(void *)(inited + 40) = 0xE400000000000000;
    uint64_t v49 = *(void *)(v2 + 32);
    *(void *)(inited + 72) = &type metadata for Int;
    *(void *)(inited + 80) = &protocol witness table for Int;
    *(void *)(inited + 48) = v49;
    *(void *)(inited + 88) = 0x747365676964;
    *(void *)(inited + 96) = 0xE600000000000000;
    uint64_t v50 = (uint64_t)v32[3].isa;
    unint64_t v51 = (unint64_t)v32[4].isa;
    swift_retain();
    sub_1000065D0(v50, v51);
    uint64_t v52 = Data.sha256Digest.getter(v50, v51);
    unint64_t v54 = v53;
    sub_100006628(v50, v51);
    Swift::String v55 = Data.base64EncodedString(options:)(0);
    sub_100006628(v52, v54);
    swift_release();
    *(void *)(inited + 128) = &type metadata for String;
    *(void *)(inited + 136) = &protocol witness table for String;
    *(Swift::String *)(inited + 104) = v55;
    unint64_t v56 = sub_100104AF4(inited);
    sub_100136224(8, v56, v47, (uint64_t)v61);
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v33 = *(void *)(v2 + 128);
  uint64_t v34 = *(void *)(v2 + 136);
  sub_100006788((void *)(v2 + 104), v33);
  sub_100003EB0(&qword_1001D9B20);
  uint64_t v35 = swift_initStackObject();
  *(_OWORD *)(v35 + 16) = xmmword_1001861D0;
  *(void *)(v35 + 32) = 1701605234;
  *(void *)(v35 + 40) = 0xE400000000000000;
  uint64_t v36 = *(void *)(v2 + 32);
  *(void *)(v35 + 72) = &type metadata for Int;
  *(void *)(v35 + 80) = &protocol witness table for Int;
  *(void *)(v35 + 48) = v36;
  *(void *)(v35 + 88) = 0x726F727265;
  *(void *)(v35 + 96) = 0xE500000000000000;
  v63[0] = v29;
  swift_errorRetain();
  sub_100003EB0((uint64_t *)&unk_1001DD380);
  uint64_t v37 = String.init<A>(describing:)();
  *(void *)(v35 + 128) = &type metadata for String;
  *(void *)(v35 + 136) = &protocol witness table for String;
  *(void *)(v35 + 104) = v37;
  *(void *)(v35 + 112) = v38;
  unint64_t v39 = sub_100104AF4(v35);
  sub_100136224(10, v39, v33, v34);
  swift_bridgeObjectRelease();
  v63[0] = v29;
  swift_errorRetain();
  type metadata accessor for SecurityError(0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_30;
  }
  uint64_t v40 = v62;
  sub_100156EAC((unint64_t *)&qword_1001D87E8, type metadata accessor for SecurityError);
  _BridgedStoredNSError.code.getter();
  if (v63[0] != 10002)
  {

LABEL_30:
    swift_willThrow();
    return;
  }
  double v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v41, v42))
  {
    os_log_type_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v43 = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "BAA certificate creation failed, increase validity for next attempt", v43, 2u);
    swift_slowDealloc();
    uint64_t v44 = v40;
  }
  else
  {
    uint64_t v44 = v41;
    double v41 = v40;
  }

  uint64_t v57 = *(void *)(v2 + 360);
  BOOL v21 = __OFADD__(v57, 86400);
  uint64_t v58 = v57 + 86400;
  if (!v21)
  {
    if (v58 <= 600000) {
      *(void *)(v2 + 360) = v58;
    }
    goto LABEL_30;
  }
LABEL_33:
  __break(1u);
}

uint64_t sub_10015155C()
{
  uint64_t v1 = v0;
  uint64_t v30 = type metadata accessor for String.Encoding();
  uint64_t v2 = *(void *)(v30 - 8);
  __chkstk_darwin(v30, v3);
  uint64_t v29 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = sub_100003E78(v5, (uint64_t)qword_1001DFC30);
  swift_retain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  BOOL v9 = os_log_type_enabled(v7, v8);
  v26[3] = v6;
  uint64_t v28 = v2;
  if (v9)
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    v31[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v10 = 136315138;
    swift_retain();
    unint64_t v11 = sub_10014FBE8();
    unint64_t v13 = v12;
    swift_release();
    uint64_t v32 = sub_100005EB8(v11, v13, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s.loadIdentity()", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v14 = v1[11];
  uint64_t v27 = v1[12];
  v26[1] = v1 + 8;
  sub_100006788(v1 + 8, v14);
  uint64_t v15 = v1[3];
  v26[0] = v1[2];
  v31[0] = v26[0];
  v31[1] = v15;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 58;
  v16._object = (void *)0xE100000000000000;
  String.append(_:)(v16);
  uint64_t v17 = v1[5];
  uint64_t v18 = (void *)v1[6];
  swift_bridgeObjectRetain();
  v26[2] = v17;
  v19._countAndFlagsBits = v17;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  uint64_t v20 = v29;
  static String.Encoding.utf8.getter();
  uint64_t v21 = String.data(using:allowLossyConversion:)();
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void *)(v28 + 8);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v20, v30);
  if (v23 >> 60 == 15)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    uint64_t v25 = sub_100003EB0(&qword_1001DFEB0);
    sub_100156B30();
    sub_1000D52CC(v21, v23, v14, v25, v27);
    sub_10000BF70(v21, v23);
    return v32;
  }
  return result;
}

uint64_t sub_100151D7C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  os_log_type_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = (void *)type metadata accessor for JSONEncoder.OutputFormatting();
  uint64_t v58 = *(v59 - 1);
  __chkstk_darwin(v59, v9);
  unint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100003E78(v12, (uint64_t)qword_1001DFC30);
  swift_retain_n();
  swift_retain_n();
  unint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v57 = (void *)v4;
  uint64_t v56 = v5;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    Swift::String v55 = v8;
    uint64_t v17 = v16;
    uint64_t v54 = swift_slowAlloc();
    v61[0] = v54;
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_retain();
    unint64_t v18 = sub_10014FBE8();
    unint64_t v20 = v19;
    swift_release();
    uint64_t v62 = sub_100005EB8(v18, v20, v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v21 = v2;
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v22 = sub_100169378();
    uint64_t v62 = sub_100005EB8(v22, v23, v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s.saveIdentity(identity: %s)", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    os_log_type_t v8 = v55;
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
    uint64_t v21 = v1;
    swift_release_n();
  }
  type metadata accessor for JSONEncoder();
  v61[0] = a1;
  type metadata accessor for BAASigningIdentity();
  sub_100156EAC(&qword_1001DFEA8, (void (*)(uint64_t))type metadata accessor for BAASigningIdentity);
  default argument 1 of static JSONEncoder.encodeClean<A>(_:outputFormatting:)();
  unint64_t v24 = v60;
  static JSONEncoder.encodeClean<A>(_:outputFormatting:)((uint64_t)v61, (uint64_t)v11);
  if (v24) {
    return (*(uint64_t (**)(char *, void *))(v58 + 8))(v11, v59);
  }
  uint64_t v28 = v25;
  unint64_t v60 = v26;
  Swift::String v55 = (char *)a1;
  (*(void (**)(char *, void *))(v58 + 8))(v11, v59);
  uint64_t v29 = v21;
  uint64_t v30 = v21 + 8;
  uint64_t v31 = v21[11];
  uint64_t v32 = v29[12];
  sub_100006788(v30, v31);
  uint64_t v33 = v29[3];
  v61[0] = v29[2];
  v61[1] = v33;
  swift_bridgeObjectRetain();
  v34._countAndFlagsBits = 58;
  v34._object = (void *)0xE100000000000000;
  String.append(_:)(v34);
  uint64_t v59 = v29;
  uint64_t v36 = v29[5];
  uint64_t v35 = (void *)v29[6];
  swift_bridgeObjectRetain();
  v37._countAndFlagsBits = v36;
  v37._object = v35;
  String.append(_:)(v37);
  swift_bridgeObjectRelease();
  static String.Encoding.utf8.getter();
  uint64_t v38 = v8;
  uint64_t v39 = String.data(using:allowLossyConversion:)();
  unint64_t v41 = v40;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, void *))(v56 + 8))(v38, v57);
  if (v41 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v32 + 40))(v39, v41, v28, v60, v31, v32);
    sub_10000BF70(v39, v41);
    os_log_type_t v42 = v59;
    uint64_t v43 = v59[16];
    uint64_t v58 = v59[17];
    uint64_t v57 = sub_100006788(v59 + 13, v43);
    sub_100003EB0(&qword_1001D9B20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1001861D0;
    *(void *)(inited + 32) = 1701605234;
    *(void *)(inited + 40) = 0xE400000000000000;
    uint64_t v45 = v42[4];
    *(void *)(inited + 72) = &type metadata for Int;
    *(void *)(inited + 80) = &protocol witness table for Int;
    *(void *)(inited + 48) = v45;
    *(void *)(inited + 88) = 0x747365676964;
    *(void *)(inited + 96) = 0xE600000000000000;
    unint64_t v46 = v55;
    uint64_t v56 = v28;
    uint64_t v47 = *((void *)v55 + 3);
    unint64_t v48 = *((void *)v55 + 4);
    swift_retain();
    sub_1000065D0(v47, v48);
    uint64_t v49 = Data.sha256Digest.getter(v47, v48);
    unint64_t v51 = v50;
    sub_100006628(v47, v48);
    Swift::String v52 = Data.base64EncodedString(options:)(0);
    sub_100006628(v49, v51);
    swift_release();
    *(void *)(inited + 128) = &type metadata for String;
    *(void *)(inited + 136) = &protocol witness table for String;
    *(Swift::String *)(inited + 104) = v52;
    unint64_t v53 = sub_100104AF4(inited);
    sub_100136224(9, v53, v43, v58);
    sub_100006628(v56, v60);
    swift_bridgeObjectRelease();
    v42[7] = v46;
    swift_retain();
    return swift_release();
  }
  return result;
}

void sub_100152464()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for String.Encoding();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = sub_100003E78(v6, (uint64_t)qword_1001DFC30);
  swift_retain_n();
  v24[1] = v7;
  os_log_type_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    v28[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_retain();
    unint64_t v11 = sub_10014FBE8();
    unint64_t v13 = v12;
    swift_release();
    uint64_t v27 = sub_100005EB8(v11, v13, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s.deleteIdentity()", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (!v1[7]) {
      return;
    }
  }
  else
  {

    swift_release_n();
    if (!v1[7]) {
      return;
    }
  }
  uint64_t v14 = v1[11];
  uint64_t v15 = v1[12];
  sub_100006788(v1 + 8, v14);
  uint64_t v16 = v1[3];
  v28[0] = v1[2];
  v28[1] = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = 58;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  uint64_t v18 = v1[5];
  unint64_t v19 = (void *)v1[6];
  swift_bridgeObjectRetain();
  v20._countAndFlagsBits = v18;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  static String.Encoding.utf8.getter();
  uint64_t v21 = String.data(using:allowLossyConversion:)();
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v26);
  if (v23 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v15 + 48))(v21, v23, v14, v15);
    sub_10000BF70(v21, v23);
    sub_100168628();
    swift_release();
    v1[7] = 0;
    swift_release();
  }
}

void sub_100152928(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  os_log_type_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = sub_100003E78(v9, (uint64_t)qword_1001DFC30);
  swift_retain();
  uint64_t v31 = v10;
  unint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = a1;
    uint64_t v28 = v14;
    uint64_t v33 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v29 = v8;
    uint64_t v32 = sub_100005EB8(0x656E676953414142, 0xE900000000000072, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v15 = v5;
    uint64_t v16 = v4;
    uint64_t v18 = *(void *)(v2 + 40);
    unint64_t v17 = *(void *)(v2 + 48);
    swift_bridgeObjectRetain();
    uint64_t v19 = v18;
    uint64_t v4 = v16;
    uint64_t v5 = v15;
    uint64_t v32 = sub_100005EB8(v19, v17, &v33);
    os_log_type_t v8 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "scheduleRenewal of %s for %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    a1 = v30;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  type metadata accessor for SecCertificate(0);
  uint64_t v20 = a1[3];
  unint64_t v21 = a1[4];
  sub_1000065D0(v20, v21);
  SecCertificateRef v22 = static SecCertificateRef.parse(derRepresentation:)();
  sub_100006628(v20, v21);
  if (v22)
  {
    SecCertificateNotValidAfter();
    Date.init(timeIntervalSinceReferenceDate:)();
    sub_100152D5C(a1[2], v8, 0);

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    swift_retain_n();
    unint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v26 = sub_100169378();
      uint64_t v32 = sub_100005EB8(v26, v27, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Invalid X.509 format (BAA). Not renewing: %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_100152D5C(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v100 = a3;
  uint64_t v7 = type metadata accessor for DispatchTime();
  uint64_t v105 = *(void *)(v7 - 8);
  uint64_t v106 = v7;
  uint64_t v9 = __chkstk_darwin(v7, v8);
  v103 = &v90[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9, v11);
  v104 = &v90[-v12];
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags();
  __chkstk_darwin(v13 - 8, v14);
  v101 = &v90[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_100003EB0(&qword_1001D9AE8);
  __chkstk_darwin(v16 - 8, v17);
  v111 = &v90[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v22 = __chkstk_darwin(v19, v21);
  v99 = &v90[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = __chkstk_darwin(v22, v24);
  v96 = &v90[-v26];
  uint64_t v28 = __chkstk_darwin(v25, v27);
  v97 = &v90[-v29];
  uint64_t v31 = __chkstk_darwin(v28, v30);
  uint64_t v33 = &v90[-v32];
  uint64_t v98 = v34;
  __chkstk_darwin(v31, v35);
  Swift::String v37 = &v90[-v36];
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v38 = type metadata accessor for Logger();
  uint64_t v39 = sub_100003E78(v38, (uint64_t)qword_1001DFC30);
  v107 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v20 + 16);
  uint64_t v108 = v20 + 16;
  v107(v37, a2, v19);
  uint64_t v109 = v39;
  unint64_t v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.info.getter();
  BOOL v42 = os_log_type_enabled(v40, v41);
  v110 = v33;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v102 = a1;
    uint64_t v44 = v43;
    v94 = (void (*)(unsigned char *, unsigned char *, uint64_t))swift_slowAlloc();
    aBlock[0] = (uint64_t)v94;
    *(_DWORD *)uint64_t v44 = 136315394;
    uint64_t v112 = sub_100005EB8(0x656E676953414142, 0xE900000000000072, aBlock);
    v95 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v44 + 12) = 2080;
    sub_100156EAC((unint64_t *)&qword_1001D9B08, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v45 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v112 = sub_100005EB8(v45, v46, aBlock);
    uint64_t v4 = v95;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v47 = v37;
    unint64_t v48 = *(void **)(v20 + 8);
    ((void (*)(unsigned char *, uint64_t))v48)(v47, v19);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s.scheduleRenewal using expirationDate: %s", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    uint64_t v33 = v110;
    swift_slowDealloc();
    a1 = v102;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v49 = v37;
    unint64_t v48 = *(void **)(v20 + 8);
    ((void (*)(unsigned char *, uint64_t))v48)(v49, v19);
  }

  sub_100006788(v4 + 28, v4[31]);
  unint64_t v50 = v111;
  sub_1000238E4((uint64_t)v111);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v20 + 48))(v50, 1, v19) == 1)
  {
    sub_10001EEA8((uint64_t)v50);
    unint64_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      unint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v53 = 134217984;
      aBlock[0] = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Aborting identity #%lld renewal. Could not calculate secure now", v53, 0xCu);
      swift_slowDealloc();
    }

    return;
  }
  v94 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v20 + 32);
  v94(v33, v50, v19);
  Date.timeIntervalSince(_:)();
  if ((~*(void *)&v54 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v54 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v54 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    return;
  }
  v93 = v4 + 28;
  v111 = a2;
  uint64_t v55 = 86400;
  v95 = v48;
  if ((uint64_t)v54 <= 86400 && (uint64_t v55 = (uint64_t)v54, (uint64_t)v54 < 301))
  {
    swift_retain();
    v72 = Logger.logObject.getter();
    os_log_type_t v73 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      uint64_t v102 = a1;
      aBlock[0] = v75;
      uint64_t v109 = v20;
      *(_DWORD *)v74 = 136315138;
      v97 = v74 + 4;
      uint64_t v76 = v4[5];
      unint64_t v77 = v4[6];
      swift_bridgeObjectRetain();
      uint64_t v112 = sub_100005EB8(v76, v77, aBlock);
      uint64_t v20 = v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Certificate for %s will be renewed immediately", v74, 0xCu);
      swift_arrayDestroy();
      a1 = v102;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    uint64_t v58 = 0;
  }
  else
  {
    uint64_t v92 = v20 + 32;
    uint64_t v112 = 300;
    uint64_t v113 = v55;
    swift_beginAccess();
    sub_10001F1A0((uint64_t)(v4 + 23), v4[26]);
    sub_100006AD0();
    static FixedWidthInteger.random<A>(in:using:)();
    swift_endAccess();
    uint64_t v56 = v97;
    Date.addingTimeInterval(_:)();
    Date.timeIntervalSince(_:)();
    uint64_t v58 = v57;
    uint64_t v59 = v96;
    v107(v96, v56, v19);
    swift_retain_n();
    unint64_t v60 = Logger.logObject.getter();
    os_log_type_t v61 = static os_log_type_t.info.getter();
    int v62 = v61;
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v63 = swift_slowAlloc();
      int v91 = v62;
      uint64_t v64 = v63;
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v64 = 136315650;
      uint64_t v102 = a1;
      uint64_t v109 = v20;
      uint64_t v65 = v19;
      uint64_t v66 = v4[5];
      unint64_t v67 = v4[6];
      swift_bridgeObjectRetain();
      uint64_t v112 = sub_100005EB8(v66, v67, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v64 + 12) = 2080;
      sub_100156EAC((unint64_t *)&qword_1001D9B08, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v68 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v112 = sub_100005EB8(v68, v69, aBlock);
      uint64_t v19 = v65;
      uint64_t v20 = v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v70 = v59;
      v71 = (void (*)(unsigned char *, uint64_t))v95;
      ((void (*)(unsigned char *, uint64_t))v95)(v70, v19);
      *(_WORD *)(v64 + 22) = 2048;
      uint64_t v112 = v58;
      a1 = v102;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v60, (os_log_type_t)v91, "Certificate for %s will be renewed on %s (in %f seconds)", (uint8_t *)v64, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v71(v56, v19);
    }
    else
    {

      ((void (*)(unsigned char *, uint64_t))v48)(v59, v19);
      swift_release_n();
      ((void (*)(unsigned char *, uint64_t))v48)(v56, v19);
    }
  }
  swift_retain();
  dispatch thunk of DispatchWorkItem.cancel()();
  swift_release();
  static DispatchWorkItemFlags.barrier.getter();
  uint64_t v78 = swift_allocObject();
  swift_weakInit();
  __int16 v79 = v99;
  v107(v99, v111, v19);
  unint64_t v80 = (*(unsigned __int8 *)(v20 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  char v81 = (void *)swift_allocObject();
  v81[2] = v78;
  v81[3] = a1;
  v81[4] = v58;
  v81[5] = v100;
  v94((unsigned char *)v81 + v80, v79, v19);
  aBlock[4] = (uint64_t)sub_100156AAC;
  aBlock[5] = (uint64_t)v81;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000048D8;
  aBlock[3] = (uint64_t)&unk_1001CBF98;
  _Block_copy(aBlock);
  type metadata accessor for DispatchWorkItem();
  swift_allocObject();
  swift_retain();
  uint64_t v82 = DispatchWorkItem.init(flags:block:)();
  swift_release();
  swift_release();
  v4[44] = v82;
  swift_release();
  uint64_t v84 = v4[31];
  uint64_t v83 = v4[32];
  sub_100006788(v93, v84);
  v85 = v103;
  (*(void (**)(uint64_t))(*(void *)(v83 + 8) + 16))(v84);
  v86 = v104;
  + infix(_:_:)();
  v87 = *(void (**)(unsigned char *, uint64_t))(v105 + 8);
  v88 = v85;
  uint64_t v89 = v106;
  v87(v88, v106);
  swift_retain();
  OS_dispatch_queue.asyncAfter(deadline:execute:)();
  swift_release();
  v87(v86, v89);
  ((void (*)(unsigned char *, uint64_t))v95)(v110, v19);
}

void sub_100153AC8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void *)(Strong + 56);
    if (v4 && *(void *)(v4 + 16) == a2)
    {
      if (qword_1001D93D8 != -1) {
        swift_once();
      }
      uint64_t v5 = type metadata accessor for Logger();
      sub_100003E78(v5, (uint64_t)qword_1001DFC30);
      uint64_t v6 = Logger.logObject.getter();
      os_log_type_t v7 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 134218240;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v8 + 12) = 2048;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "renew identity #%lld after %fs", (uint8_t *)v8, 0x16u);
        swift_slowDealloc();
      }

      sub_100152464();
      sub_100150E50();
      uint64_t v10 = v9;
      sub_100151D7C(v9);
      sub_100152928(v10);
      swift_release();
      swift_release();
      return;
    }
    swift_release();
  }
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100003E78(v11, (uint64_t)qword_1001DFC30);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "identity mismatch, abort renewal", v14, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1001540F0()
{
  type metadata accessor for SecCertificate(0);
  SecCertificateRef v1 = static SecCertificateRef.parse(derRepresentation:)();
  if (v1)
  {
    SecCertificateRef v2 = v1;
    if (!sub_10002905C())
    {
      uint64_t v7 = v0[36];
      uint64_t v8 = v0[37];
      sub_100006788(v0 + 33, v7);
      (*(void (**)(SecCertificateRef, uint64_t, uint64_t))(v8 + 8))(v2, v7, v8);

      return 1;
    }
    swift_willThrow();
  }
  else
  {
    if (qword_1001D93D8 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100003E78(v3, (uint64_t)qword_1001DFC30);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Invalid X.509 format (BAA)", v6, 2u);
      swift_slowDealloc();
    }

    sub_10002A180(10005, 0, 0, 0);
    swift_willThrow();
  }
  if (qword_1001D93D8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100003E78(v9, (uint64_t)qword_1001DFC30);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_errorRetain();
    sub_100003EB0((uint64_t *)&unk_1001DD380);
    uint64_t v13 = String.init<A>(describing:)();
    sub_100005EB8(v13, v14, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Certificate verification failed: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  return 0;
}

uint64_t sub_100154444(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  v97 = _swiftEmptyArrayStorage;
  type metadata accessor for SecCertificate(0);
  uint64_t v6 = static SecCertificateRef.parse(derRepresentation:)();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = SecCertificateCopyKey(v6);
    if (v8)
    {
      uint64_t v9 = v8;
      if (!SecKeyIsAlgorithmSupported(v8, kSecKeyOperationTypeVerify, kSecKeyAlgorithmECDSASignatureMessageX962SHA1))
      {
        sub_10002A180(10005, 0xD00000000000001CLL, (void *)0x8000000100194210, 0);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (v97[2] >= v97[3] >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
    else
    {
      sub_10002A180(10005, 0x696C627570206F4ELL, (void *)0xED000079656B2063, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (v97[2] >= v97[3] >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    os_log_type_t v11 = (void *)sub_10002905C();
    if (v11)
    {
      id v12 = v11;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (v97[2] >= v97[3] >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    uint64_t v13 = (void *)sub_100155740();
    if (v13)
    {
      id v14 = v13;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (v97[2] >= v97[3] >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    uint64_t v15 = (void *)sub_100155960();
    if (v15)
    {
      id v16 = v15;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (v97[2] >= v97[3] >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    sub_1000AD688((uint64_t)&v89);
    uint64_t v17 = v95;
    char v18 = v96;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v18)
    {
      uint64_t v19 = 0xD00000000000001DLL;
      uint64_t v20 = (void *)0x80000001001940A0;
      uint64_t v21 = 10005;
    }
    else
    {
      if (!v17) {
        goto LABEL_35;
      }
      uint64_t v89 = 0;
      v90 = (void *)0xE000000000000000;
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      uint64_t v89 = 0xD000000000000028;
      v90 = (void *)0x800000010019CA10;
      v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v22);
      swift_bridgeObjectRelease();
      uint64_t v19 = v89;
      uint64_t v20 = v90;
      uint64_t v21 = 10010;
    }
    sub_10002A180(v21, v19, v20, 0);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (v97[2] >= v97[3] >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
LABEL_35:
    sub_1000ACE30(&v89);
    uint64_t v24 = v89;
    uint64_t v23 = v90;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v23)
    {
      sub_1000ACE30(&v89);
      uint64_t v25 = v91;
      uint64_t v26 = v92;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v26)
      {
        uint64_t v86 = v25;
        uint64_t v88 = a1;
        sub_1000ACE30(&v89);
        uint64_t v27 = v93;
        uint64_t v28 = v94;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v28)
        {
          unint64_t v87 = a2;
          uint64_t v29 = *(void *)(v3 + 168);
          uint64_t v30 = *(void **)(v3 + 176);
          if (v27 == v29 && v28 == v30 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v89 = 0;
            v90 = (void *)0xE000000000000000;
            _StringGuts.grow(_:)(32);
            swift_bridgeObjectRelease();
            uint64_t v89 = 0xD000000000000015;
            v90 = (void *)0x80000001001941F0;
            v62._countAndFlagsBits = v27;
            v62._object = v28;
            String.append(_:)(v62);
            swift_bridgeObjectRelease();
            v63._countAndFlagsBits = 0x203A6469657320;
            v63._object = (void *)0xE700000000000000;
            String.append(_:)(v63);
            swift_bridgeObjectRetain();
            v64._countAndFlagsBits = v29;
            v64._object = v30;
            String.append(_:)(v64);
            swift_bridgeObjectRelease();
            sub_10002A180(10010, v89, v90, 0);
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            if (v97[2] >= v97[3] >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            }
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
          }
          sub_1000ADD28(&v89);
          uint64_t v65 = v90;
          uint64_t v85 = v89;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v65)
          {
            sub_1000ADD28(&v89);
            uint64_t v83 = v91;
            uint64_t v66 = v92;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v84 = v66;
            if (v66)
            {
              uint64_t v82 = v24;
              sub_1000ADD28(&v89);
              uint64_t v67 = v93;
              uint64_t v68 = v94;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v68)
              {
                uint64_t v69 = v67;
                if (v67 == v29 && v68 == v30)
                {
                  swift_bridgeObjectRelease();
                  a2 = v87;
                  uint64_t v70 = v82;
                }
                else
                {
                  uint64_t v70 = v82;
                  if (_stringCompareWithSmolCheck(_:_:expecting:)())
                  {
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    uint64_t v89 = 0;
                    v90 = (void *)0xE000000000000000;
                    _StringGuts.grow(_:)(31);
                    swift_bridgeObjectRelease();
                    uint64_t v89 = 0xD000000000000014;
                    v90 = (void *)0x800000010019C9B0;
                    v71._countAndFlagsBits = v69;
                    v71._object = v68;
                    String.append(_:)(v71);
                    swift_bridgeObjectRelease();
                    v72._countAndFlagsBits = 0x203A6469657320;
                    v72._object = (void *)0xE700000000000000;
                    String.append(_:)(v72);
                    swift_bridgeObjectRetain();
                    v73._countAndFlagsBits = v29;
                    v73._object = v30;
                    String.append(_:)(v73);
                    swift_bridgeObjectRelease();
                    sub_10002A180(10010, v89, v90, 0);
                    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                    if (v97[2] >= v97[3] >> 1) {
                      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                    }
                    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                    specialized Array._endMutation()();
                  }
                  a2 = v87;
                }
                uint64_t v74 = v86;
                if (v70 == v85 && v23 == v65 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  a1 = v88;
                }
                else
                {
                  uint64_t v89 = 0;
                  v90 = (void *)0xE000000000000000;
                  _StringGuts.grow(_:)(32);
                  swift_bridgeObjectRelease();
                  uint64_t v89 = 0xD000000000000015;
                  v90 = (void *)0x800000010019C9D0;
                  v75._countAndFlagsBits = v70;
                  v75._object = v23;
                  String.append(_:)(v75);
                  swift_bridgeObjectRelease();
                  v76._countAndFlagsBits = 0x203A616162202CLL;
                  v76._object = (void *)0xE700000000000000;
                  String.append(_:)(v76);
                  v77._countAndFlagsBits = v85;
                  v77._object = v65;
                  String.append(_:)(v77);
                  swift_bridgeObjectRelease();
                  sub_10002A180(10010, v89, v90, 0);
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                  if (v97[2] >= v97[3] >> 1) {
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                  }
                  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                  specialized Array._endMutation()();
                  a1 = v88;
                  uint64_t v74 = v86;
                }
                if (v74 == v83 && v26 == v84)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  goto LABEL_48;
                }
                char v78 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if (v78)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_48;
                }
                uint64_t v89 = 0;
                v90 = (void *)0xE000000000000000;
                _StringGuts.grow(_:)(32);
                swift_bridgeObjectRelease();
                uint64_t v89 = 0xD000000000000015;
                v90 = (void *)0x800000010019C9F0;
                v79._countAndFlagsBits = v74;
                v79._object = v26;
                String.append(_:)(v79);
                v80._countAndFlagsBits = 0x203A616162202CLL;
                v80._object = (void *)0xE700000000000000;
                String.append(_:)(v80);
                v81._countAndFlagsBits = v74;
                v81._object = v26;
                String.append(_:)(v81);
                swift_bridgeObjectRelease();
                uint64_t v31 = v89;
                uint64_t v32 = v90;
                uint64_t v33 = 10010;
                goto LABEL_45;
              }
              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10002A180(10005, 0xD00000000000001DLL, (void *)0x800000010019C990, 0);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (v97[2] >= v97[3] >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          a2 = v87;
          a1 = v88;
LABEL_48:
          uint64_t v34 = sub_1000AD2A0();
          if (v35 & 1) != 0 || (uint64_t v36 = v34, sub_1000AD2A0(), (v38))
          {
            uint64_t v44 = 0xD00000000000001ALL;
            uint64_t v45 = (void *)0x8000000100194180;
            uint64_t v46 = 10005;
          }
          else
          {
            uint64_t v39 = v37;
            if (v36)
            {
              uint64_t v89 = 0;
              v90 = (void *)0xE000000000000000;
              _StringGuts.grow(_:)(49);
              swift_bridgeObjectRelease();
              uint64_t v89 = 0xD000000000000022;
              v90 = (void *)0x80000001001941A0;
              v40._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
              String.append(_:)(v40);
              swift_bridgeObjectRelease();
              v41._countAndFlagsBits = 0x746365707865202CLL;
              v41._object = (void *)0xED000030203A6465;
              String.append(_:)(v41);
              sub_10002A180(10010, v89, v90, 0);
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (v97[2] >= v97[3] >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
            if (v39 == 1)
            {
LABEL_60:
              sub_1000AE19C((uint64_t)&v89);
              if ((v90 & 1) != 0
                || (uint64_t v47 = v89, sub_1000AE19C((uint64_t)&v89), (v92 & 1) != 0)
                || (uint64_t v48 = v91, sub_1000AE19C((uint64_t)&v89), (v94 & 1) != 0))
              {
                uint64_t v49 = 0xD00000000000001BLL;
                unint64_t v50 = (void *)0x800000010019C8F0;
                uint64_t v51 = 10005;
              }
              else
              {
                unint64_t v52 = a2;
                uint64_t v53 = v93;
                if (v47 != 1)
                {
                  uint64_t v89 = 0;
                  v90 = (void *)0xE000000000000000;
                  _StringGuts.grow(_:)(39);
                  swift_bridgeObjectRelease();
                  uint64_t v89 = 0xD000000000000018;
                  v90 = (void *)0x800000010019C910;
                  v54._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                  String.append(_:)(v54);
                  swift_bridgeObjectRelease();
                  v55._countAndFlagsBits = 0x746365707865202CLL;
                  v55._object = (void *)0xED000031203A6465;
                  String.append(_:)(v55);
                  sub_10002A180(10010, v89, v90, 0);
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                  if (v97[2] >= v97[3] >> 1) {
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                  }
                  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                  specialized Array._endMutation()();
                }
                if (v48 != 1)
                {
                  uint64_t v89 = 0;
                  v90 = (void *)0xE000000000000000;
                  _StringGuts.grow(_:)(47);
                  swift_bridgeObjectRelease();
                  uint64_t v89 = 0xD000000000000020;
                  v90 = (void *)0x800000010019C930;
                  v56._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                  String.append(_:)(v56);
                  swift_bridgeObjectRelease();
                  v57._countAndFlagsBits = 0x746365707865202CLL;
                  v57._object = (void *)0xED000031203A6465;
                  String.append(_:)(v57);
                  sub_10002A180(10010, v89, v90, 0);
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                  if (v97[2] >= v97[3] >> 1) {
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                  }
                  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                  specialized Array._endMutation()();
                }
                BOOL v58 = v53 == 1;
                a2 = v52;
                if (v58) {
                  goto LABEL_67;
                }
                uint64_t v89 = 0;
                v90 = (void *)0xE000000000000000;
                _StringGuts.grow(_:)(60);
                v59._countAndFlagsBits = 0xD00000000000002DLL;
                v59._object = (void *)0x800000010019C960;
                String.append(_:)(v59);
                v60._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
                String.append(_:)(v60);
                swift_bridgeObjectRelease();
                v61._countAndFlagsBits = 0x746365707865202CLL;
                v61._object = (void *)0xED000031203A6465;
                String.append(_:)(v61);
                uint64_t v49 = v89;
                unint64_t v50 = v90;
                uint64_t v51 = 10010;
              }
              sub_10002A180(v51, v49, v50, 0);
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (v97[2] >= v97[3] >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
LABEL_67:

              sub_100155480((uint64_t)&v97, v3, a1, a2);
              return swift_bridgeObjectRelease();
            }
            uint64_t v89 = 0;
            v90 = (void *)0xE000000000000000;
            _StringGuts.grow(_:)(44);
            swift_bridgeObjectRelease();
            uint64_t v89 = 0xD00000000000001DLL;
            v90 = (void *)0x80000001001941D0;
            v42._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
            String.append(_:)(v42);
            swift_bridgeObjectRelease();
            v43._countAndFlagsBits = 0x746365707865202CLL;
            v43._object = (void *)0xED000031203A6465;
            String.append(_:)(v43);
            uint64_t v44 = v89;
            uint64_t v45 = v90;
            uint64_t v46 = 10010;
          }
          sub_10002A180(v46, v44, v45, 0);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (v97[2] >= v97[3] >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          goto LABEL_60;
        }
        swift_bridgeObjectRelease();
        a1 = v88;
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v31 = 0xD00000000000001ELL;
    uint64_t v32 = (void *)0x8000000100194160;
    uint64_t v33 = 10005;
LABEL_45:
    sub_10002A180(v33, v31, v32, 0);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (v97[2] >= v97[3] >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    goto LABEL_48;
  }
  sub_10002A180(10005, 0xD00000000000001ALL, (void *)0x800000010019C8D0, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (v97[2] >= v97[3] >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  sub_100155480((uint64_t)&v97, v2, a1, a2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100155480(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (*(void *)(*(void *)result + 16))
  {
    uint64_t v7 = result;
    sub_100009300(a2 + 104, (uint64_t)v26);
    uint64_t v8 = v27;
    uint64_t v9 = v28;
    sub_100006788(v26, v27);
    sub_100003EB0(&qword_1001D9B20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100189B70;
    *(void *)(inited + 32) = 1701605234;
    *(void *)(inited + 40) = 0xE400000000000000;
    uint64_t v11 = *(void *)(a2 + 32);
    *(void *)(inited + 72) = &type metadata for Int;
    *(void *)(inited + 80) = &protocol witness table for Int;
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 88) = 0x747365676964;
    *(void *)(inited + 96) = 0xE600000000000000;
    uint64_t v12 = Data.sha256Digest.getter(a3, a4);
    uint64_t v14 = v13;
    *(void *)(inited + 128) = &type metadata for Data;
    unint64_t v15 = sub_10002B604();
    *(void *)(inited + 104) = v12;
    *(void *)(inited + 112) = v14;
    *(void *)(inited + 136) = v15;
    *(void *)(inited + 144) = 0x73726F727265;
    uint64_t v25 = (void *)inited;
    *(void *)(inited + 152) = 0xE600000000000000;
    int64_t v16 = *(void *)(*(void *)v7 + 16);
    if (v16)
    {
      swift_bridgeObjectRetain();
      sub_10014B9C4(0, v16, 0);
      type metadata accessor for SecurityError(0);
      uint64_t v17 = 0;
      do
      {
        _print_unlocked<A, B>(_:_:)();
        unint64_t v19 = _swiftEmptyArrayStorage[2];
        unint64_t v18 = _swiftEmptyArrayStorage[3];
        if (v19 >= v18 >> 1) {
          sub_10014B9C4(v18 > 1, v19 + 1, 1);
        }
        ++v17;
        _swiftEmptyArrayStorage[2] = v19 + 1;
        uint64_t v20 = (char *)&_swiftEmptyArrayStorage[2 * v19];
        *((void *)v20 + 4) = 0;
        *((void *)v20 + 5) = 0xE000000000000000;
      }
      while (v16 != v17);
      swift_bridgeObjectRelease();
    }
    sub_100003EB0((uint64_t *)&unk_1001DA570);
    sub_100038F5C((unint64_t *)&qword_1001DD3B0, (uint64_t *)&unk_1001DA570);
    uint64_t v21 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v25[23] = &type metadata for String;
    v25[24] = &protocol witness table for String;
    v25[20] = v21;
    v25[21] = v23;
    unint64_t v24 = sub_100104AF4((uint64_t)v25);
    sub_100136224(41, v24, v8, v9);
    swift_bridgeObjectRelease();
    return sub_100006520((uint64_t)v26);
  }
  return result;
}

uint64_t sub_100155740()
{
  sub_1000AD688((uint64_t)&v24);
  uint64_t v1 = v26;
  uint64_t v2 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v19 = 0xD00000000000001FLL;
    uint64_t v20 = (void *)0x800000010019C850;
LABEL_13:
    uint64_t v21 = 10005;
    return sub_10002A180(v21, v19, v20, 0);
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100094E08(v1, (unint64_t)v2);
  if (v6)
  {
    unint64_t v24 = 0;
    unint64_t v25 = 0xE000000000000000;
    _StringGuts.grow(_:)(36);
    swift_bridgeObjectRelease();
    unint64_t v24 = 0xD000000000000022;
    unint64_t v25 = 0x800000010019C870;
    v22._countAndFlagsBits = v1;
    v22._object = v2;
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    uint64_t v19 = v24;
    uint64_t v20 = (void *)v25;
    goto LABEL_13;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_100006788((void *)(v0 + 312), *(void *)(v0 + 336));
  if (v7 == *(void *)(*v10 + 16) && v8 == *(void *)(*v10 + 24) && v9 == *(void *)(*v10 + 32)) {
    return 0;
  }
  unint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  _StringGuts.grow(_:)(71);
  v13._countAndFlagsBits = 0xD00000000000002ELL;
  v13._object = (void *)0x800000010019C8A0;
  String.append(_:)(v13);
  v14._countAndFlagsBits = sub_100093280(v7, v8, v9);
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._object = (void *)0x8000000100194120;
  v15._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v15);
  int64_t v16 = sub_100006788((void *)(v0 + 312), *(void *)(v0 + 336));
  v17._countAndFlagsBits = sub_100093280(*(void *)(*v16 + 16), *(void *)(*v16 + 24), *(void *)(*v16 + 32));
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 46;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  uint64_t v19 = v24;
  uint64_t v20 = (void *)v25;
  uint64_t v21 = 10010;
  return sub_10002A180(v21, v19, v20, 0);
}

uint64_t sub_100155960()
{
  sub_1000AD688((uint64_t)&v24);
  uint64_t v1 = v26;
  uint64_t v2 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v19 = 0xD00000000000001FLL;
    uint64_t v20 = (void *)0x800000010019C7D0;
LABEL_13:
    uint64_t v21 = 10005;
    return sub_10002A180(v21, v19, v20, 0);
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100094E08(v1, (unint64_t)v2);
  if (v6)
  {
    unint64_t v24 = 0;
    unint64_t v25 = 0xE000000000000000;
    _StringGuts.grow(_:)(36);
    swift_bridgeObjectRelease();
    unint64_t v24 = 0xD000000000000022;
    unint64_t v25 = 0x800000010019C7F0;
    v22._countAndFlagsBits = v1;
    v22._object = v2;
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    uint64_t v19 = v24;
    uint64_t v20 = (void *)v25;
    goto LABEL_13;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_100006788((void *)(v0 + 312), *(void *)(v0 + 336));
  if (v7 == *(void *)(*v10 + 16) && v8 == *(void *)(*v10 + 24) && v9 == *(void *)(*v10 + 32)) {
    return 0;
  }
  unint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  _StringGuts.grow(_:)(71);
  v13._countAndFlagsBits = 0xD00000000000002ELL;
  v13._object = (void *)0x800000010019C820;
  String.append(_:)(v13);
  v14._countAndFlagsBits = sub_100093280(v7, v8, v9);
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._object = (void *)0x8000000100194120;
  v15._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v15);
  int64_t v16 = sub_100006788((void *)(v0 + 312), *(void *)(v0 + 336));
  v17._countAndFlagsBits = sub_100093280(*(void *)(*v16 + 16), *(void *)(*v16 + 24), *(void *)(*v16 + 32));
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 46;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  uint64_t v19 = v24;
  uint64_t v20 = (void *)v25;
  uint64_t v21 = 10010;
  return sub_10002A180(v21, v19, v20, 0);
}

uint64_t sub_100155B80(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100155BD8(a1, a2, a3, a4, a5, a6, a7, (uint64_t)sub_100156954);
}

uint64_t sub_100155BAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100155BD8(a1, a2, a3, a4, a5, a6, a7, (uint64_t)sub_100156038);
}

uint64_t sub_100155BD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v21[0] = a1;
  v21[1] = a8;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  Swift::String v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DispatchWorkItemFlags.barrier.getter();
  uint64_t v22 = v8;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = a5;
  char v26 = a4;
  sub_100003EB0(&qword_1001DFEA0);
  uint64_t v18 = v29;
  OS_dispatch_queue.sync<A>(flags:execute:)();
  uint64_t v19 = (uint64_t (**)(char *, uint64_t))(v14 + 8);
  if (v18) {
    return (*v19)(v17, v13);
  }
  (*v19)(v17, v13);
  uint64_t result = v27;
  *(void *)v21[0] = v28;
  return result;
}

uint64_t sub_100155D44(double a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static DispatchWorkItemFlags.barrier.getter();
  uint64_t v10 = v1;
  double v11 = a1;
  OS_dispatch_queue.sync<A>(flags:execute:)();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  return v12;
}

uint64_t sub_100155E60()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static DispatchWorkItemFlags.barrier.getter();
  uint64_t v9 = v0;
  uint64_t v10 = v1;
  OS_dispatch_queue.sync<A>(flags:execute:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_100155F90()
{
  return sub_10014FBE8();
}

uint64_t sub_100155FB4()
{
  return sub_100156EAC(&qword_1001DFE58, (void (*)(uint64_t))type metadata accessor for BAASigningIdentity);
}

void sub_100155FFC()
{
  sub_100150808(*(void **)(v0 + 16));
}

void sub_100156018(BOOL *a1@<X8>)
{
  sub_100150270(*(void **)(v1 + 16), a1, *(double *)(v1 + 24));
}

void sub_100156038(uint64_t *a1@<X8>)
{
}

void *sub_100156064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20 = type metadata accessor for DispatchWorkItemFlags();
  __chkstk_darwin(v20, v21);
  v47[3] = a18;
  v47[4] = a19;
  uint64_t v22 = sub_10008CDF4(v47);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a18 - 8) + 32))(v22, a7, a18);
  uint64_t v45 = &type metadata for SystemRandomNumberGenerator;
  uint64_t v46 = &protocol witness table for SystemRandomNumberGenerator;
  v43[3] = type metadata accessor for SystemInfo();
  v43[4] = &off_1001CB4C8;
  v43[0] = a10;
  v42[3] = type metadata accessor for DefaultSecureTimeKeeper();
  v42[4] = &off_1001C84C8;
  aBlock[5] = 0;
  v42[0] = a11;
  a17[7] = 0;
  aBlock[4] = BitString.init(data:unusedBits:);
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000048D8;
  aBlock[3] = &unk_1001CBFC0;
  _Block_copy(aBlock);
  sub_100156EAC((unint64_t *)&qword_1001DD360, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100003EB0((uint64_t *)&unk_1001DA510);
  sub_100038F5C((unint64_t *)&qword_1001DD370, (uint64_t *)&unk_1001DA510);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  type metadata accessor for DispatchWorkItem();
  swift_allocObject();
  a17[44] = DispatchWorkItem.init(flags:block:)();
  a17[45] = 600000;
  a17[2] = a1;
  a17[3] = a2;
  a17[4] = a3;
  a17[5] = a4;
  a17[6] = a5;
  sub_100009300(a6, (uint64_t)(a17 + 8));
  sub_100009300((uint64_t)v47, (uint64_t)(a17 + 13));
  sub_100009300(a8, (uint64_t)(a17 + 33));
  a17[38] = a9;
  sub_100009300((uint64_t)v43, (uint64_t)(a17 + 39));
  sub_100009300((uint64_t)v42, (uint64_t)(a17 + 28));
  a17[18] = a14;
  a17[19] = a15;
  a17[20] = a16;
  a17[21] = a12;
  a17[22] = a13;
  sub_100009300((uint64_t)v44, (uint64_t)(a17 + 23));
  swift_retain();
  id v23 = a14;
  id v24 = a15;
  uint64_t v25 = sub_10015155C();
  if (!v25) {
    goto LABEL_5;
  }
  char v26 = (uint64_t *)v25;
  uint64_t v27 = *(void *)(v25 + 24);
  unint64_t v28 = *(void *)(v25 + 32);
  sub_1000065D0(v27, v28);
  char v29 = sub_1001540F0();
  sub_100006628(v27, v28);
  if ((v29 & 1) == 0)
  {
    sub_100152464();
    swift_release();
LABEL_5:
    char v38 = v23;
    sub_100150E50();
    uint64_t v31 = (uint64_t *)v30;
    sub_100151D7C(v30);
    sub_100152928(v31);
    swift_release();

    swift_release();
    goto LABEL_6;
  }
  a17[7] = v26;
  swift_retain();
  swift_release();
  sub_100152928(v26);
  swift_release();
  swift_release();

LABEL_6:
  sub_100006520((uint64_t)v44);
  sub_100006520((uint64_t)v42);
  sub_100006520((uint64_t)v43);
  sub_100006520(a8);
  sub_100006520((uint64_t)v47);
  sub_100006520(a6);
  return a17;
}

void sub_100156954(uint64_t *a1@<X8>)
{
}

void sub_100156980(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X0>, uint64_t *a2@<X8>)
{
  sub_10014FF74(*(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(unsigned char *)(v2 + 48), a1, a2);
}

uint64_t sub_1001569A8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001569E0()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100156AAC()
{
  type metadata accessor for Date();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);

  sub_100153AC8(v1, v2);
}

uint64_t sub_100156B18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100156B28()
{
  return swift_release();
}

unint64_t sub_100156B30()
{
  unint64_t result = qword_1001DFEB8;
  if (!qword_1001DFEB8)
  {
    sub_100003EF4(&qword_1001DFEB0);
    sub_100156EAC(&qword_1001DFEC0, (void (*)(uint64_t))type metadata accessor for BAASigningIdentity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DFEB8);
  }
  return result;
}

void *sub_100156BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, long long a12, long long a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v43 = a8;
  uint64_t v34 = a7;
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  long long v35 = a13;
  long long v36 = a12;
  uint64_t v16 = *(void *)(a15 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for SystemInfo();
  v47[3] = v19;
  v47[4] = &off_1001CB4C8;
  v47[0] = a10;
  uint64_t v45 = type metadata accessor for DefaultSecureTimeKeeper();
  uint64_t v46 = &off_1001C84C8;
  v44[0] = a11;
  type metadata accessor for BAASigner();
  uint64_t v20 = (void *)swift_allocObject();
  uint64_t v21 = sub_10001F1A0((uint64_t)v47, v19);
  __chkstk_darwin(v21, v21);
  id v23 = (uint64_t *)((char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = sub_10001F1A0((uint64_t)v44, v45);
  __chkstk_darwin(v25, v25);
  uint64_t v27 = (uint64_t *)((char *)&v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v28 + 16))(v27);
  uint64_t v29 = *v23;
  uint64_t v30 = *v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v34, a15);
  uint64_t v31 = sub_100156064(v37, v38, v39, v40, v41, v42, (uint64_t)v18, v43, a9, v29, v30, v36, *((uint64_t *)&v36 + 1), (void *)v35, *((void **)&v35 + 1), a14, v20, a15, a16);
  sub_100006520((uint64_t)v44);
  sub_100006520((uint64_t)v47);
  return v31;
}

uint64_t sub_100156EAC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for CertificateTrustVerifier(uint64_t a1)
{
  sub_100006520(a1);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CertificateTrustVerifier(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for CertificateTrustVerifier(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  return a1;
}

uint64_t *sub_100157028(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        double v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          void *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for CertificateTrustVerifier(uint64_t a1, uint64_t a2)
{
  sub_100006520(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_unknownObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for CertificateTrustVerifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CertificateTrustVerifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CertificateTrustVerifier()
{
  return &type metadata for CertificateTrustVerifier;
}

uint64_t destroy for CertificateTimeVerifier(uint64_t a1)
{
  return sub_100006520(a1 + 8);
}

uint64_t initializeWithCopy for CertificateTimeVerifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 8, a2 + 8);
  return a1;
}

void *assignWithCopy for CertificateTimeVerifier(void *a1, void *a2)
{
  *a1 = *a2;
  sub_100157028(a1 + 1, a2 + 1);
  return a1;
}

uint64_t assignWithTake for CertificateTimeVerifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  sub_100006520(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CertificateTimeVerifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CertificateTimeVerifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CertificateTimeVerifier()
{
  return &type metadata for CertificateTimeVerifier;
}

uint64_t sub_1001574EC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001DFEC8);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001DFEC8);
  if (qword_1001D9268 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1058);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_1001575B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100003EB0(&qword_1001D9AE8);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = (void *)(v0 + 8);
  sub_100006788((void *)(v0 + 8), *(void *)(v0 + 32));
  sub_1000238E4((uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_10001EEA8((uint64_t)v5);
    if (qword_1001D93E0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100003E78(v12, (uint64_t)qword_1001DFEC8);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = v6;
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "CertificateTimeVerifier using wall time to verify certificate", v15, 2u);
      uint64_t v6 = v36;
      swift_slowDealloc();
    }

    uint64_t v17 = *(void *)(v1 + 32);
    uint64_t v16 = *(void *)(v1 + 40);
    sub_100006788(v11, v17);
    (*(void (**)(uint64_t))(*(void *)(v16 + 8) + 8))(v17);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
  }
  SecCertificateNotValidBefore();
  double v19 = v18;
  Date.timeIntervalSinceReferenceDate.getter();
  double v21 = v19 - v20;
  if (v21 > 5.0)
  {
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    _StringGuts.grow(_:)(16);
    Double.write<A>(to:)();
    v22._countAndFlagsBits = 0x73646E6F63657320;
    v22._object = (void *)0xEE00796C72616520;
    String.append(_:)(v22);
    uint64_t v23 = v37;
    uint64_t v24 = (void *)v38;
    uint64_t v25 = 10011;
LABEL_21:
    sub_10002A180(v25, v23, v24, 0);
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  if (v21 > 0.0)
  {
    if (qword_1001D93E0 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_100003E78(v26, (uint64_t)qword_1001DFEC8);
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v36 = v6;
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 134217984;
      uint64_t v6 = v36;
      uint64_t v37 = *(void *)&v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Certificate valid with allowed drift: %f", v29, 0xCu);
      swift_slowDealloc();
    }
  }
  SecCertificateNotValidAfter();
  double v31 = v30;
  Date.timeIntervalSinceReferenceDate.getter();
  double v33 = v31 - v32;
  if (v33 < 0.0)
  {
    uint64_t v25 = 10012;
LABEL_20:
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    goto LABEL_21;
  }
  if (v33 < *(double *)v1)
  {
    uint64_t v25 = 10014;
    goto LABEL_20;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

void sub_100157A34(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      sub_1001575B4();
      if (v1)
      {
        swift_bridgeObjectRelease_n();

        return;
      }

      ++v4;
      if (v7 == v3) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain_n();
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
}

uint64_t sub_100157B3C()
{
  return sub_1001575B4();
}

void sub_100157B54(unint64_t a1)
{
}

void sub_100157B6C(unint64_t a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_100003EB0(&qword_1001D9AE8);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v16);
  Swift::String v63 = (char *)&v61 - v17;
  unint64_t v65 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v62 = v10;
  uint64_t v64 = v11;
  if (v18 != 1) {
    goto LABEL_14;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_7:
    uint64_t v2 = v19;
    AuthorityKeyID = (void *)SecCertificateGetAuthorityKeyID();
    if (!AuthorityKeyID)
    {

      goto LABEL_14;
    }
    uint64_t v21 = qword_1001D93E8;
    id v3 = AuthorityKeyID;
    if (v21 == -1) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v19 = *(id *)(a1 + 32);
    goto LABEL_7;
  }
  __break(1u);
LABEL_52:
  swift_once();
LABEL_9:
  id v22 = v3;
  unint64_t v23 = swift_bridgeObjectRetain();
  uint64_t v24 = sub_1001585AC(v23);

  swift_bridgeObjectRelease();
  if (v24)
  {
    id v25 = v24;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
LABEL_14:
  SecTrustRef trust = 0;
  type metadata accessor for SecCertificate(0);
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  OSStatus v27 = SecTrustCreateWithCertificates(isa, *(CFTypeRef *)(v4 + 40), &trust);

  os_log_type_t v28 = trust;
  if (v27 || !trust)
  {
    swift_bridgeObjectRelease();
    sub_1000F37C0(v27, 0);
    swift_willThrow();
    goto LABEL_21;
  }
  os_log_type_t v28 = trust;
  CFArrayRef v29 = Array._bridgeToObjectiveC()().super.isa;
  OSStatus v30 = SecTrustSetAnchorCertificates(v28, v29);

  if (v30)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    sub_1000F37C0(v30, 0);
    swift_willThrow();

LABEL_21:
    return;
  }
  OSStatus v31 = SecTrustSetAnchorCertificatesOnly(v28, 0);
  if (v31)
  {
    OSStatus v30 = v31;
    goto LABEL_19;
  }
  sub_100006788((void *)v4, *(void *)(v4 + 24));
  sub_1000238E4((uint64_t)v9);
  uint64_t v32 = v64;
  uint64_t v33 = v62;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v9, 1, v62) == 1)
  {
    sub_10001EEA8((uint64_t)v9);
    if (qword_1001D93E0 != -1) {
      swift_once();
    }
    uint64_t v34 = type metadata accessor for Logger();
    sub_100003E78(v34, (uint64_t)qword_1001DFEC8);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "CertificateTrustVerifier using wall time to verify certificate", v37, 2u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v39 = *(void *)(v4 + 24);
    uint64_t v40 = *(void *)(v4 + 32);
    sub_100006788((void *)v4, v39);
    unint64_t v38 = v63;
    (*(void (**)(uint64_t))(*(void *)(v40 + 8) + 8))(v39);
    uint64_t v32 = v64;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v38 = v63;
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v63, v9, v33);
  }
  static Date.+ infix(_:_:)();
  CFDateRef v41 = Date._bridgeToObjectiveC()().super.isa;
  uint64_t v42 = *(void (**)(char *, uint64_t))(v32 + 8);
  v42(v15, v33);
  uint64_t v43 = v32 + 8;
  OSStatus v44 = SecTrustSetVerifyDate(v28, v41);

  uint64_t v45 = v38;
  if (v44)
  {
    sub_1000F37C0(v44, 0);
    swift_willThrow();

    v42(v38, v33);
LABEL_48:
    os_log_type_t v28 = trust;
    goto LABEL_21;
  }
  CFErrorRef error = 0;
  if (!SecTrustEvaluateWithError(v28, &error))
  {
    uint64_t v64 = v43;
    CFErrorRef v46 = error;
    if (!error)
    {
      uint64_t v53 = 0;
LABEL_46:
      Swift::String v60 = v46;
      sub_10002A180(10997, 0, 0, v53);
      swift_errorRelease();
      swift_willThrow();

      v42(v45, v33);
      goto LABEL_47;
    }
    uint64_t v47 = error;
    CFStringRef v48 = (id)CFErrorGetDomain(v47);
    if (v48)
    {
      uint64_t v49 = (void *)v48;
      if (kCFErrorDomainOSStatus)
      {
        type metadata accessor for CFString(0);
        sub_100158744(&qword_1001DFEE0, type metadata accessor for CFString);
        unint64_t v50 = (id)kCFErrorDomainOSStatus;
        id v51 = v49;
        uint64_t v33 = v62;
        char v52 = static _CFObject.== infix(_:_:)();

        uint64_t v49 = v47;
        if ((v52 & 1) == 0) {
          goto LABEL_45;
        }
LABEL_41:
        CFIndex Code = CFErrorGetCode(v47);
        if (Code < (uint64_t)0xFFFFFFFF80000000)
        {
          __break(1u);
        }
        else
        {
          OSStatus v55 = Code;
          if (Code <= 0x7FFFFFFF)
          {
            type metadata accessor for CFError(0);
            sub_100158744((unint64_t *)&qword_1001DE058, type metadata accessor for CFError);
            uint64_t v56 = swift_allocError();
            void *v57 = v47;
            BOOL v58 = v47;
            sub_1000F37C0(v55, v56);
            swift_errorRelease();
            swift_willThrow();

            v42(v63, v62);
LABEL_47:

            goto LABEL_48;
          }
        }
        __break(1u);
      }
    }
    else
    {
      uint64_t v49 = v47;
      if (!kCFErrorDomainOSStatus) {
        goto LABEL_41;
      }
    }
LABEL_45:

    type metadata accessor for CFError(0);
    sub_100158744((unint64_t *)&qword_1001DE058, type metadata accessor for CFError);
    uint64_t v53 = swift_allocError();
    *Swift::String v59 = v47;
    uint64_t v45 = v63;
    goto LABEL_46;
  }
  v42(v38, v33);
}

uint64_t sub_1001583C8()
{
  sub_100003EB0((uint64_t *)&unk_1001DA5A0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100189E80;
  type metadata accessor for SecCertificate(0);
  uint64_t result = (uint64_t)static SecCertificateRef.parse(base64Encoded:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  *(void *)(v0 + 32) = result;
  uint64_t result = (uint64_t)static SecCertificateRef.parse(base64Encoded:)();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(void *)(v0 + 40) = result;
  uint64_t result = (uint64_t)static SecCertificateRef.parse(base64Encoded:)();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  *(void *)(v0 + 48) = result;
  uint64_t result = (uint64_t)static SecCertificateRef.parse(base64Encoded:)();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *(void *)(v0 + 56) = result;
  uint64_t result = (uint64_t)static SecCertificateRef.parse(base64Encoded:)();
  if (result)
  {
    *(void *)(v0 + 64) = result;
    uint64_t result = specialized Array._endMutation()();
    qword_1001E1228 = v0;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100158500(void *a1)
{
  sub_100003EB0((uint64_t *)&unk_1001DA5A0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100189F80;
  *(void *)(v2 + 32) = a1;
  unint64_t v5 = v2;
  specialized Array._endMutation()();
  id v3 = a1;
  sub_100157B6C(v5);
  return swift_bridgeObjectRelease();
}

void sub_100158594(unint64_t a1)
{
}

void *sub_1001585AC(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v3);
      unint64_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      uint64_t SubjectKeyID = SecCertificateGetSubjectKeyID();
      if (SubjectKeyID)
      {
        uint64_t v8 = (void *)SubjectKeyID;
        type metadata accessor for CFData(0);
        sub_100158744(&qword_1001DFEE8, type metadata accessor for CFData);
        id v9 = v8;
        LOBYTE(v8) = static _CFObject.== infix(_:_:)();

        if (v8)
        {
          swift_bridgeObjectRelease();
          return v5;
        }
      }

      ++v3;
      if (v6 == v2) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100158744(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_10015878C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  double v20 = a1;
  uint64_t v21 = a2;
  uint64_t v6 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = _swiftEmptyArrayStorage;
  if (v11)
  {
    id v22 = _swiftEmptyArrayStorage;
    sub_10014BA40(0, v11, 0);
    uint64_t v12 = v22;
    unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v13 = a3 + v19;
    uint64_t v14 = *(void *)(v7 + 72);
    while (1)
    {
      v20(v13);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      id v22 = v12;
      unint64_t v16 = v12[2];
      unint64_t v15 = v12[3];
      if (v16 >= v15 >> 1)
      {
        sub_10014BA40(v15 > 1, v16 + 1, 1);
        uint64_t v12 = v22;
      }
      v12[2] = v16 + 1;
      sub_10015B140((uint64_t)v10, (uint64_t)v12 + v19 + v16 * v14);
      v13 += v14;
      if (!--v11) {
        return v12;
      }
    }
    swift_release();
  }
  return v12;
}

uint64_t sub_100158920()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001DFEF0);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001DFEF0);
  if (qword_1001D9258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1028);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_1001589E8()
{
  type metadata accessor for UUID();
  sub_10015C4F8(&qword_1001E0020, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
  v1._uint64_t countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  uint64_t v2 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  if (*(unsigned char *)(v0 + *(int *)(v2 + 20))) {
    uint64_t v3 = 0x657669746361;
  }
  else {
    uint64_t v3 = 0x6576697463616E69;
  }
  object = (void *)0xE800000000000000;
  if (*(unsigned char *)(v0 + *(int *)(v2 + 20))) {
    unint64_t v5 = 0xE600000000000000;
  }
  else {
    unint64_t v5 = 0xE800000000000000;
  }
  unint64_t v6 = v5;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease();
  v7._uint64_t countAndFlagsBits = 8236;
  v7._object = (void *)0xE200000000000000;
  String.append(_:)(v7);
  if (*(void *)(v0 + *(int *)(v2 + 24) + 8))
  {
    Swift::String v9 = String.redactedToken()();
    uint64_t countAndFlagsBits = v9._countAndFlagsBits;
    object = v9._object;
  }
  else
  {
    uint64_t countAndFlagsBits = 0x6E656B6F74206F6ELL;
  }
  uint64_t v10 = object;
  String.append(_:)(*(Swift::String *)&countAndFlagsBits);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100158B30(void *a1)
{
  uint64_t v3 = sub_100003EB0(&qword_1001E0118);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  Swift::String v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100006788(a1, a1[3]);
  sub_10015C4A4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[15] = 0;
  type metadata accessor for UUID();
  sub_10015C4F8(&qword_1001DD7E8, (void (*)(uint64_t))&type metadata accessor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
    v9[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v9[13] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_100158D18@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v25 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v26 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100003EB0(&qword_1001E0128);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  uint64_t v11 = __chkstk_darwin(v9, v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t *)&v13[*(int *)(v11 + 24)];
  *uint64_t v14 = 0;
  v14[1] = 0;
  sub_100006788(a1, a1[3]);
  sub_10015C4A4();
  uint64_t v15 = (uint64_t)v28;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v15)
  {
    sub_100006520((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = v25;
    char v31 = 0;
    sub_10015C4F8(&qword_1001DD7D8, (void (*)(uint64_t))&type metadata accessor for UUID);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    os_log_type_t v28 = v13;
    v17(v13, v26, v3);
    char v30 = 1;
    v28[*(int *)(v9 + 20)] = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    char v29 = 2;
    uint64_t v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v20 = v19;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v27);
    swift_bridgeObjectRelease();
    *uint64_t v14 = v18;
    v14[1] = v20;
    uint64_t v21 = (uint64_t)v28;
    sub_10015B05C((uint64_t)v28, v23);
    sub_100006520((uint64_t)a1);
    return sub_10015B0C0(v21);
  }
}

uint64_t sub_10015909C()
{
  unint64_t v1 = 0x6576697463417369;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x64697074666173;
  }
}

uint64_t sub_1001590FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10015C74C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100159124(uint64_t a1)
{
  unint64_t v2 = sub_10015C4A4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100159160(uint64_t a1)
{
  unint64_t v2 = sub_10015C4A4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10015919C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100158D18(a1, a2);
}

uint64_t sub_1001591B4(void *a1)
{
  return sub_100158B30(a1);
}

uint64_t sub_1001591D0()
{
  unint64_t v1 = v0;
  unint64_t v2 = v0 + 4;
  uint64_t v3 = v0[7];
  uint64_t v4 = v1[8];
  sub_100006788(v2, v3);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = sub_100003EB0(&qword_1001E0028);
  sub_10015B778(&qword_1001E0040, &qword_1001E0048);
  sub_1000D52CC(v5, v6, v3, v7, v4);
  uint64_t v8 = v17;
  if (qword_1001D93F0 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100003E78(v9, (uint64_t)qword_1001DFEF0);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
    swift_bridgeObjectRetain();
    uint64_t v13 = Array.description.getter();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_100005EB8(v13, v15, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "SAF candidate list from persistence: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v1[9] = v8;
  return swift_bridgeObjectRelease();
}

void sub_10015950C()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  sub_100006788(v0 + 4, v3);
  uint64_t v5 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v14 = v1;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_100003EB0(&qword_1001E0028);
  sub_10015B778(&qword_1001E0030, &qword_1001E0038);
  sub_1000D5134(v5, v4, (uint64_t)&v14, v3, v6, v2);
  if (qword_1001D93F0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100003E78(v7, (uint64_t)qword_1001DFEF0);
  swift_bridgeObjectRetain();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
    swift_bridgeObjectRetain();
    uint64_t v11 = Array.description.getter();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    sub_100005EB8(v11, v13, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Updated stored SAF candidate list: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_100159908(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v17 = 0;
  uint64_t v8 = *(void *)(v1 + 72);
  uint64_t v15 = a1;
  uint64_t v16 = &v17;
  swift_bridgeObjectRetain();
  unint64_t v9 = (unint64_t)sub_10015878C((void (*)(uint64_t))sub_10015B758, (uint64_t)v14, v8);
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v7, a1, v10);
    v7[*(int *)(v3 + 20)] = 1;
    uint64_t v11 = &v7[*(int *)(v3 + 24)];
    *uint64_t v11 = 0;
    v11[1] = 0;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v9 = sub_10015A9F0(0, *(void *)(v9 + 16) + 1, 1, v9, &qword_1001DFA20, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate);
    }
    unint64_t v13 = *(void *)(v9 + 16);
    unint64_t v12 = *(void *)(v9 + 24);
    if (v13 >= v12 >> 1) {
      unint64_t v9 = sub_10015A9F0(v12 > 1, v13 + 1, 1, v9, &qword_1001DFA20, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate);
    }
    *(void *)(v9 + 16) = v13 + 1;
    sub_10015B140((uint64_t)v7, v9+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v13);
  }
  *(void *)(v1 + 72) = v9;
  swift_bridgeObjectRelease();
  sub_10015950C();
}

uint64_t sub_100159B58@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X2>, uint64_t a3@<X8>)
{
  char v6 = static UUID.== infix(_:_:)();
  uint64_t result = sub_10015B05C(a1, a3);
  if (v6)
  {
    uint64_t result = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
    *(unsigned char *)(a3 + *(int *)(result + 20)) = 1;
    *a2 = 1;
  }
  return result;
}

uint64_t sub_100159BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4 = static UUID.== infix(_:_:)();
  uint64_t result = sub_10015B05C(a1, a2);
  if (v4)
  {
    uint64_t result = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
    *(unsigned char *)(a2 + *(int *)(result + 20)) = 0;
  }
  return result;
}

void sub_100159C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v23 = 0;
  uint64_t v12 = *(void *)(v3 + 72);
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  id v22 = &v23;
  swift_bridgeObjectRetain();
  unint64_t v13 = (unint64_t)sub_10015878C((void (*)(uint64_t))sub_10015B11C, (uint64_t)v18, v12);
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0)
  {
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v11, a1, v14);
    v11[*(int *)(v7 + 20)] = 0;
    uint64_t v15 = &v11[*(int *)(v7 + 24)];
    void *v15 = a2;
    v15[1] = a3;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v13 = sub_10015A9F0(0, *(void *)(v13 + 16) + 1, 1, v13, &qword_1001DFA20, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate);
    }
    unint64_t v17 = *(void *)(v13 + 16);
    unint64_t v16 = *(void *)(v13 + 24);
    if (v17 >= v16 >> 1) {
      unint64_t v13 = sub_10015A9F0(v16 > 1, v17 + 1, 1, v13, &qword_1001DFA20, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate, (uint64_t (*)(void))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate);
    }
    *(void *)(v13 + 16) = v17 + 1;
    sub_10015B140((uint64_t)v11, v13+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v17);
  }
  *(void *)(v3 + 72) = v13;
  swift_bridgeObjectRelease();
  sub_10015950C();
}

uint64_t sub_100159E8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, unsigned char *a4@<X4>, uint64_t a5@<X8>)
{
  char v10 = static UUID.== infix(_:_:)();
  uint64_t result = sub_10015B05C(a1, a5);
  if (v10)
  {
    uint64_t v12 = (void *)(a5
                   + *(int *)(type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate() + 24));
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v12 = a2;
    v12[1] = a3;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_100159F24()
{
  uint64_t v1 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  uint64_t v3 = __chkstk_darwin(v1, v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v6);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = *(void *)(v0 + 72);
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v10 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v13 = *(void *)(v7 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_10015B05C(v12, (uint64_t)v9);
    if (static UUID.== infix(_:_:)()) {
      break;
    }
    sub_10015B0C0((uint64_t)v9);
    v12 += v13;
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_1001D93F0 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100003E78(v15, (uint64_t)qword_1001DFEF0);
  sub_10015B05C((uint64_t)v9, (uint64_t)v5);
  unint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v35 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    type metadata accessor for UUID();
    sub_10015C4F8(&qword_1001E0020, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v33 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v34 = v20;
    v21._uint64_t countAndFlagsBits = 8236;
    v21._object = (void *)0xE200000000000000;
    String.append(_:)(v21);
    if (v5[*(int *)(v1 + 20)]) {
      uint64_t v22 = 0x657669746361;
    }
    else {
      uint64_t v22 = 0x6576697463616E69;
    }
    object = (void *)0xE800000000000000;
    if (v5[*(int *)(v1 + 20)]) {
      unint64_t v24 = 0xE600000000000000;
    }
    else {
      unint64_t v24 = 0xE800000000000000;
    }
    unint64_t v25 = v24;
    String.append(_:)(*(Swift::String *)&v22);
    swift_bridgeObjectRelease();
    v26._uint64_t countAndFlagsBits = 8236;
    v26._object = (void *)0xE200000000000000;
    String.append(_:)(v26);
    uint64_t v27 = *(void *)&v5[*(int *)(v1 + 24) + 8];
    uint64_t v32 = v19;
    if (v27)
    {
      Swift::String v29 = String.redactedToken()();
      uint64_t countAndFlagsBits = v29._countAndFlagsBits;
      object = v29._object;
    }
    else
    {
      uint64_t countAndFlagsBits = 0x6E656B6F74206F6ELL;
    }
    char v30 = object;
    String.append(_:)(*(Swift::String *)&countAndFlagsBits);
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_100005EB8(v33, v34, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10015B0C0((uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "found %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10015B0C0((uint64_t)v5);
  }

  uint64_t v14 = *(void *)&v9[*(int *)(v1 + 24)];
  swift_bridgeObjectRetain();
  sub_10015B0C0((uint64_t)v9);
  return v14;
}

uint64_t sub_10015A2E8()
{
  sub_100006628(*(void *)(v0 + 16), *(void *)(v0 + 24));
  sub_100006520(v0 + 32);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StoreAndForwardSelector()
{
  return self;
}

void *sub_10015A354(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100003EB0(&qword_1001D9AF0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10015B1A4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10015A464(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10015A7A0(a1, a2, a3, a4, &qword_1001DFA38);
}

char *sub_10015A470(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003EB0(&qword_1001E0050);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10015B484(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10015A580(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100003EB0(&qword_1001E0058);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10015B578(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10015A690(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_10015A69C(a1, a2, a3, a4, &qword_1001D8778);
}

void *sub_10015A69C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  int64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v8 = a2;
    }
LABEL_8:
    int64_t v9 = a4[2];
    if (v8 <= v9) {
      int64_t v10 = a4[2];
    }
    else {
      int64_t v10 = v8;
    }
    if (v10)
    {
      sub_100003EB0(a5);
      int64_t v11 = (void *)swift_allocObject();
      size_t v12 = j__malloc_size(v11);
      v11[2] = v9;
      v11[3] = 2 * v12 - 64;
      uint64_t v13 = v11 + 4;
      if (v6)
      {
LABEL_13:
        if (v11 != a4 || v13 >= (void *)((char *)a4 + v9 + 32)) {
          memmove(v13, a4 + 4, v9);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10015BB50(0, v9, (char *)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10015A794(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10015A7A0(a1, a2, a3, a4, &qword_1001E0078);
}

char *sub_10015A7A0(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = *((void *)a4 + 3);
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = *((void *)a4 + 2);
    if (v8 <= v9) {
      uint64_t v10 = *((void *)a4 + 2);
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      sub_100003EB0(a5);
      int64_t v11 = (char *)swift_allocObject();
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      *((void *)v11 + 2) = v9;
      *((void *)v11 + 3) = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 32;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[8 * v9 + 32]) {
          memmove(v14, a4 + 32, 8 * v9);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10015B66C(0, v9, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10015A8AC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10015A9F0(a1, a2, a3, a4, &qword_1001E0070, (uint64_t (*)(void))&type metadata accessor for DispatchTime, (uint64_t (*)(void))&type metadata accessor for DispatchTime);
}

void *sub_10015A8E0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100003EB0((uint64_t *)&unk_1001DA520);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10015B298(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10015A9F0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100003EB0(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10015B9F4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_10015AC70(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100003EB0(&qword_1001E0060);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10015B80C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10015AD80(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100003EB0(&qword_1001DCF68);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 88);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[11 * v8 + 4]) {
          memmove(v12, a4 + 4, 88 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10015B900(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10015AEAC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100003EB0(&qword_1001E0068);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10015B38C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10015AFD0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10015A9F0(a1, a2, a3, a4, &qword_1001DCF48, (uint64_t (*)(void))type metadata accessor for KernelTokenHostConfigurationMapping, (uint64_t (*)(void))type metadata accessor for KernelTokenHostConfigurationMapping);
}

void *sub_10015B004(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_10015A69C(a1, a2, a3, a4, &qword_1001DBAC0);
}

uint64_t type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate()
{
  uint64_t result = qword_1001E00D8;
  if (!qword_1001E00D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10015B05C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10015B0C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10015B11C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100159E8C(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned char **)(v2 + 40), a2);
}

uint64_t sub_10015B140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10015B1A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10015B298(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10015B38C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10015B484(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10015B578(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10015B66C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10015B758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100159B58(a1, *(unsigned char **)(v2 + 24), a2);
}

uint64_t sub_10015B778(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003EF4(&qword_1001E0028);
    sub_10015C4F8(a2, (void (*)(uint64_t))type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10015B80C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10015B900(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 88 * a1 + 32;
    unint64_t v6 = a3 + 88 * v4;
    if (v5 >= v6 || v5 + 88 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10015B9F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10015BB50(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10015BC38(void *a1)
{
  if (qword_1001D93F0 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100003E78(v3, (uint64_t)qword_1001DFEF0);
  size_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 136315138;
    *(void *)&long long v12 = sub_100005EB8(0x7065642874696E69, 0xEC000000293A746FLL, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "StoreAndForwardSelector.%s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = a1;
  sub_1000F7B54((uint64_t)v13);
  if (v1)
  {
    swift_release();
  }
  else
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    sub_100006788(v13, v14);
    sub_100021C74(v8, v9);
    type metadata accessor for StoreAndForwardSelector();
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = sub_100114E24(0xD000000000000017, 0x800000010018EAC0);
    v7[3] = v10;
    sub_10001F1F0(&v12, (uint64_t)(v7 + 4));
    v7[9] = &_swiftEmptyArrayStorage;
    swift_retain();
    sub_1001591D0();
    swift_release();
    swift_release();
    sub_100006520((uint64_t)v13);
  }
  return v7;
}

void *sub_10015BEA4(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10015BF84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10015BFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10015C08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10015C134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_10015C1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10015C24C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10015C260);
}

uint64_t sub_10015C260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_10015C330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10015C344);
}

uint64_t sub_10015C344(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t sub_10015C404()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10015C4A4()
{
  unint64_t result = qword_1001E0120;
  if (!qword_1001E0120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0120);
  }
  return result;
}

uint64_t sub_10015C4F8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    char *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10015C60CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys()
{
  return &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys;
}

unint64_t sub_10015C648()
{
  unint64_t result = qword_1001E0130;
  if (!qword_1001E0130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0130);
  }
  return result;
}

unint64_t sub_10015C6A0()
{
  unint64_t result = qword_1001E0138;
  if (!qword_1001E0138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0138);
  }
  return result;
}

unint64_t sub_10015C6F8()
{
  unint64_t result = qword_1001E0140;
  if (!qword_1001E0140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0140);
  }
  return result;
}

uint64_t sub_10015C74C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64697074666173 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6576697463417369 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010019BF60)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_10015C8A0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001E0148);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001E0148);
  if (qword_1001D9258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1028);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10015C968(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 != a1 >> 32) {
        goto LABEL_3;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(a1 + 16) == *(void *)(a1 + 24)) {
        goto LABEL_8;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((a2 & 0xFF000000000000) != 0)
      {
LABEL_3:
        __chkstk_darwin(a1, a2);
        uint64_t result = sub_10015D98C();
        if (!v2) {
          return v4;
        }
      }
      else
      {
LABEL_8:
        sub_100029D50(6001, 0, 0, 0);
        return swift_willThrow();
      }
      return result;
  }
}

void sub_10015CA6C(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v7 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v7 - 8, v8);
  sub_10015DF78();
  if (!v3)
  {
    unint64_t v10 = v9;
    id v11 = [v9 storedValue];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      *a3 = v13;
      a3[1] = v15;
    }
    else
    {
      if (qword_1001D93F8 != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      sub_100003E78(v16, (uint64_t)qword_1001E0148);
      sub_1000065D0(a1, a2);
      sub_1000065D0(a1, a2);
      unint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v17, v18))
      {
        size_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        *(_DWORD *)size_t v19 = 136315138;
        static String.Encoding.utf8.getter();
        uint64_t countAndFlagsBits = String.init(data:encoding:)();
        if (!object)
        {
          Swift::String v22 = Data.hexString()();
          object = v22._object;
          uint64_t countAndFlagsBits = v22._countAndFlagsBits;
        }
        sub_100005EB8(countAndFlagsBits, (unint64_t)object, &v23);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100006628(a1, a2);
        sub_100006628(a1, a2);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "CoreDataWrapper: Failed to retrieve data for key: \"%s\"", v19, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100006628(a1, a2);
        sub_100006628(a1, a2);
      }

      sub_100029D50(6002, 0, 0, 0);
      swift_willThrow();
    }
  }
}

uint64_t sub_10015CD30(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 6001;
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 != a1 >> 32) {
        goto LABEL_3;
      }
      goto LABEL_9;
    case 2uLL:
      if (*(void *)(a1 + 16) == *(void *)(a1 + 24)) {
        goto LABEL_9;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_14;
    default:
      if ((a2 & 0xFF000000000000) != 0)
      {
LABEL_3:
        uint64_t v4 = 6003;
        switch(a4 >> 62)
        {
          case 1uLL:
            if ((int)a3 != a3 >> 32) {
              goto LABEL_5;
            }
            goto LABEL_13;
          case 2uLL:
            if (*(void *)(a3 + 16) == *(void *)(a3 + 24)) {
              goto LABEL_13;
            }
            goto LABEL_5;
          case 3uLL:
            break;
          default:
            if ((a4 & 0xFF000000000000) != 0)
            {
LABEL_5:
              __chkstk_darwin(a1, a2);
              return sub_10015DB20();
            }
LABEL_13:
            uint64_t v4 = 6003;
            break;
        }
      }
      else
      {
LABEL_9:
        uint64_t v4 = 6001;
      }
LABEL_14:
      sub_100029D50(v4, 0, 0, 0);
      return swift_willThrow();
  }
}

void sub_10015CE98(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context);
  sub_10015DF78();
  if (v3)
  {
    _s3__C4CodeOMa_8(0);
    uint64_t v24 = 6000;
    swift_errorRetain();
    sub_10006212C();
    char v11 = static _ErrorCodeProtocol.~= infix(_:_:)();
    swift_errorRelease();
    if ((v11 & 1) == 0) {
      return;
    }
    swift_errorRelease();
    if (qword_1001D93F8 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100003E78(v12, (uint64_t)qword_1001E0148);
    sub_1000065D0(a2, a3);
    sub_1000065D0(a2, a3);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      static String.Encoding.utf8.getter();
      uint64_t countAndFlagsBits = String.init(data:encoding:)();
      if (!object)
      {
        Swift::String v18 = Data.hexString()();
        object = v18._object;
        uint64_t countAndFlagsBits = v18._countAndFlagsBits;
      }
      sub_100005EB8(countAndFlagsBits, (unint64_t)object, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100006628(a2, a3);
      sub_100006628(a2, a3);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "CoreDataWrapper: Insert data for key: \"%s\"", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100006628(a2, a3);
      sub_100006628(a2, a3);
    }
    type metadata accessor for Logging();
    id v21 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithContext:v9];
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    [v21 setStoredKey:isa];

    Class v23 = Data._bridgeToObjectiveC()().super.isa;
    [v21 setStoredValue:v23];

    [v21 setWillBeRemovedAfterUpdate:*(unsigned __int8 *)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_willBeRemovedAfterUpdate)];
  }
  else
  {
    size_t v19 = v10;
    Class v20 = Data._bridgeToObjectiveC()().super.isa;
    [v19 setStoredValue:v20];
  }
  sub_10015E1D8(v9);
}

uint64_t sub_10015D240(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 != a1 >> 32) {
        goto LABEL_3;
      }
      goto LABEL_7;
    case 2uLL:
      if (*(void *)(a1 + 16) == *(void *)(a1 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_7;
    default:
      if ((a2 & 0xFF000000000000) != 0)
      {
LABEL_3:
        __chkstk_darwin(a1, a2);
        return sub_10015DB20();
      }
      else
      {
LABEL_7:
        sub_100029D50(6001, 0, 0, 0);
        return swift_willThrow();
      }
  }
}

void sub_10015D334(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context);
  sub_10015DF78();
  if (v3)
  {
    _s3__C4CodeOMa_8(0);
    uint64_t v20 = 6000;
    swift_errorRetain();
    sub_10006212C();
    char v11 = static _ErrorCodeProtocol.~= infix(_:_:)();
    swift_errorRelease();
    if (v11)
    {
      swift_errorRelease();
      if (qword_1001D93F8 != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      sub_100003E78(v12, (uint64_t)qword_1001E0148);
      sub_1000065D0(a2, a3);
      sub_1000065D0(a2, a3);
      uint64_t v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 136315138;
        static String.Encoding.utf8.getter();
        uint64_t countAndFlagsBits = String.init(data:encoding:)();
        if (!object)
        {
          Swift::String v18 = Data.hexString()();
          object = v18._object;
          uint64_t countAndFlagsBits = v18._countAndFlagsBits;
        }
        sub_100005EB8(countAndFlagsBits, (unint64_t)object, &v20);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100006628(a2, a3);
        sub_100006628(a2, a3);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "CoreDataWrapper: key:\n\"%s\" does not exist, cannot delete", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100006628(a2, a3);
        sub_100006628(a2, a3);
      }
    }
  }
  else
  {
    size_t v19 = v10;
    [v9 deleteObject:v10];

    sub_10015E1D8(v9);
  }
}

void sub_10015D610()
{
  sub_10015DB20();
  if (!v0)
  {
    if (qword_1001D93F8 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100003E78(v1, (uint64_t)qword_1001E0148);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "CoreDataWrapper: deleted after update", v4, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10015D71C(uint64_t a1)
{
  id v3 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v3 initWithEntityName:v4];

  sub_100006680(0, &qword_1001DBEC0);
  sub_100003EB0((uint64_t *)&unk_1001DD3C0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100186100;
  id v7 = [objc_allocWithZone((Class)NSNumber) initWithBool:1];
  *(void *)(v6 + 56) = sub_100006680(0, &qword_1001DB7E0);
  *(void *)(v6 + 64) = sub_10015E37C(&qword_1001E01B0, &qword_1001DB7E0);
  *(void *)(v6 + 32) = v7;
  uint64_t v8 = NSPredicate.init(format:_:)();
  [v5 setPredicate:v8];

  [v5 setReturnsObjectsAsFaults:1];
  uint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context);
  type metadata accessor for Logging();
  unint64_t v10 = NSManagedObjectContext.fetch<A>(_:)();
  if (v1) {
    goto LABEL_12;
  }
  unint64_t v11 = v10;
  if (!(v10 >> 62))
  {
    uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_4;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    sub_10015E1D8(v9);
LABEL_12:

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_11;
  }
LABEL_4:
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if ((v11 & 0xC000000000000001) != 0) {
        id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v14 = *(id *)(v11 + 8 * i + 32);
      }
      uint64_t v15 = v14;
      [v9 deleteObject:v14];
    }
    goto LABEL_11;
  }
  __break(1u);
}

uint64_t sub_10015D98C()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context) persistentStoreCoordinator];
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v2 = v1;
  id v3 = [v1 persistentStores];

  sub_100006680(0, &qword_1001DF5B0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = swift_bridgeObjectRelease();
  if (v5)
  {
    __chkstk_darwin(v6, v7);
    return NSManagedObjectContext.performAndWait<A>(_:)();
  }
  else
  {
LABEL_6:
    sub_100029D50(6998, 0xD000000000000018, (void *)0x800000010019E080, 0);
    return swift_willThrow();
  }
}

uint64_t sub_10015DB20()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context) persistentStoreCoordinator];
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v2 = v1;
  id v3 = [v1 persistentStores];

  sub_100006680(0, &qword_1001DF5B0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = swift_bridgeObjectRelease();
  if (v5)
  {
    __chkstk_darwin(v6, v7);
    return NSManagedObjectContext.performAndWait<A>(_:)();
  }
  else
  {
LABEL_6:
    sub_100029D50(6998, 0xD000000000000018, (void *)0x800000010019E080, 0);
    return swift_willThrow();
  }
}

id sub_10015DCE8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CoreDataWrapper();
  return [super dealloc];
}

uint64_t type metadata accessor for CoreDataWrapper()
{
  return self;
}

uint64_t sub_10015DDA0()
{
  return *(unsigned __int8 *)(*v0 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_isTransient);
}

uint64_t sub_10015DDB4(uint64_t a1, unint64_t a2)
{
  return sub_10015C968(a1, a2);
}

uint64_t sub_10015DDD8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_10015CD30(a1, a2, a3, a4);
}

uint64_t sub_10015DDFC(uint64_t a1, unint64_t a2)
{
  return sub_10015D240(a1, a2);
}

void sub_10015DE20()
{
}

void sub_10015DE44()
{
  sub_10015D71C(*(void *)(v0 + 16));
}

uint64_t sub_10015DE60()
{
  uint64_t result = (*(uint64_t (**)(void))(v0 + 16))();
  if (v1) {
    return swift_willThrow();
  }
  return result;
}

id sub_10015DE90(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v8 = &v5[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_entityName];
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  *(void *)&v5[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_manager] = a3;
  uint64_t v9 = *(void **)(a3 + 56);
  unint64_t v10 = v5;
  swift_retain();
  id v11 = [v9 newBackgroundContext];
  [v11 setStalenessInterval:0.0];
  [v11 setUndoManager:0];
  *(void *)&v10[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context] = v11;
  v10[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_isTransient] = a4;
  v10[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_willBeRemovedAfterUpdate] = a5;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CoreDataWrapper();
  return [super init];
}

void sub_10015DF78()
{
  id v1 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 initWithEntityName:v2];

  sub_100006680(0, &qword_1001DBEC0);
  sub_100003EB0((uint64_t *)&unk_1001DD3C0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100186100;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  *(void *)(v4 + 56) = sub_100006680(0, &qword_1001E01B8);
  *(void *)(v4 + 64) = sub_10015E37C(&qword_1001E01C0, &qword_1001E01B8);
  *(void *)(v4 + 32) = isa;
  uint64_t v6 = NSPredicate.init(format:_:)();
  [v3 setPredicate:v6];

  [v3 setFetchLimit:1];
  type metadata accessor for Logging();
  unint64_t v7 = NSManagedObjectContext.fetch<A>(_:)();
  if (v0) {
    goto LABEL_2;
  }
  unint64_t v8 = v7;
  if (!(v7 >> 62))
  {
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    sub_100029D50(6000, 0, 0, 0);
    swift_willThrow();
LABEL_2:

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v8 & 0xC000000000000001) != 0)
  {
    specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_8;
  }
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v9 = *(id *)(v8 + 32);
LABEL_8:

    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

void sub_10015E1D8(void *a1)
{
  if ([a1 hasChanges])
  {
    id v8 = 0;
    if ([a1 save:&v8])
    {
      id v2 = v8;
      [a1 reset];
    }
    else
    {
      id v7 = v8;
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }
  else
  {
    if (qword_1001D93F8 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100003E78(v3, (uint64_t)qword_1001E0148);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "moc has not changed", v6, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10015E35C()
{
  sub_10015D334(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10015E37C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006680(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10015E3CC()
{
  sub_10015CE98(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_10015E3F0(uint64_t *a1@<X8>)
{
  sub_10015CA6C(*(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

uint64_t destroy for InternalTransactionData(void *a1)
{
  swift_bridgeObjectRelease();
  sub_100006628(a1[3], a1[4]);
  sub_100006628(a1[5], a1[6]);
  uint64_t v2 = a1[8];
  unint64_t v3 = a1[9];

  return sub_100006628(v2, v3);
}

uint64_t initializeWithCopy for InternalTransactionData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  unint64_t v6 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_1000065D0(v5, v6);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  unint64_t v8 = *(void *)(a2 + 48);
  sub_1000065D0(v7, v8);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 64);
  unint64_t v9 = *(void *)(a2 + 72);
  sub_1000065D0(v10, v9);
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v9;
  return a1;
}

uint64_t assignWithCopy for InternalTransactionData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  unint64_t v5 = *(void *)(a2 + 32);
  sub_1000065D0(v4, v5);
  uint64_t v6 = *(void *)(a1 + 24);
  unint64_t v7 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  sub_100006628(v6, v7);
  uint64_t v8 = *(void *)(a2 + 40);
  unint64_t v9 = *(void *)(a2 + 48);
  sub_1000065D0(v8, v9);
  uint64_t v10 = *(void *)(a1 + 40);
  unint64_t v11 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  sub_100006628(v10, v11);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 64);
  unint64_t v12 = *(void *)(a2 + 72);
  sub_1000065D0(v13, v12);
  uint64_t v14 = *(void *)(a1 + 64);
  unint64_t v15 = *(void *)(a1 + 72);
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v12;
  sub_100006628(v14, v15);
  return a1;
}

uint64_t assignWithTake for InternalTransactionData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a1 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  sub_100006628(v5, v6);
  uint64_t v7 = *(void *)(a1 + 40);
  unint64_t v8 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_100006628(v7, v8);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  unint64_t v10 = *(void *)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  sub_100006628(v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalTransactionData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InternalTransactionData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalTransactionData()
{
  return &type metadata for InternalTransactionData;
}

uint64_t sub_10015E6BC()
{
  _StringGuts.grow(_:)(150);
  v1._uint64_t countAndFlagsBits = 0xD000000000000025;
  v1._object = (void *)0x800000010019E0E0;
  String.append(_:)(v1);
  if (*(unsigned char *)v0) {
    uint64_t v2 = 1702195828;
  }
  else {
    uint64_t v2 = 0x65736C6166;
  }
  if (*(unsigned char *)v0) {
    unint64_t v3 = 0xE400000000000000;
  }
  else {
    unint64_t v3 = 0xE500000000000000;
  }
  unint64_t v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease();
  v5._object = (void *)0x80000001001977B0;
  v5._uint64_t countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v5);
  uint64_t v6 = *(void *)(v0 + 8);
  uint64_t v7 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  v8._uint64_t countAndFlagsBits = v6;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._uint64_t countAndFlagsBits = 0xD000000000000015;
  v9._object = (void *)0x80000001001977F0;
  String.append(_:)(v9);
  Swift::String v10 = Data.hexString()();
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = 0x4B454B6E6970202CLL;
  v11._object = (void *)0xEE00203A68736148;
  String.append(_:)(v11);
  Swift::String v12 = Data.hexString()();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = 0xD000000000000016;
  v13._object = (void *)0x800000010019E110;
  String.append(_:)(v13);
  if (*(unsigned char *)(v0 + 56)) {
    uint64_t v14 = 1702195828;
  }
  else {
    uint64_t v14 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 56)) {
    unint64_t v15 = 0xE400000000000000;
  }
  else {
    unint64_t v15 = 0xE500000000000000;
  }
  unint64_t v16 = v15;
  String.append(_:)(*(Swift::String *)&v14);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
  v17._object = (void *)0x800000010019E130;
  String.append(_:)(v17);
  Swift::String v18 = Data.hexString()();
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._uint64_t countAndFlagsBits = 41;
  v19._object = (void *)0xE100000000000000;
  String.append(_:)(v19);
  return 0;
}

unint64_t sub_10015E8D0(char a1)
{
  unint64_t result = 0x69757165526E6970;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x746361736E617274;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x61484B454B6E6970;
      break;
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10015E9C0(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = sub_100003EB0(&qword_1001E01D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  Swift::String v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_10015F494();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v13) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v13 = *(_OWORD *)((char *)v3 + 24);
    char v12 = 2;
    sub_1000F13EC();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    long long v13 = *(_OWORD *)((char *)v3 + 40);
    char v12 = 3;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v13 = v3[4];
    char v12 = 5;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_10015EC04()
{
  return sub_10015E8D0(*v0);
}

uint64_t sub_10015EC0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10015ED20(a1, a2);
  *a3 = result;
  return result;
}

void sub_10015EC34(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10015EC40(uint64_t a1)
{
  unint64_t v2 = sub_10015F494();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015EC7C(uint64_t a1)
{
  unint64_t v2 = sub_10015F494();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10015ECB8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10015EFD4(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_10015ED04(void *a1)
{
  return sub_10015E9C0(a1);
}

uint64_t sub_10015ED20(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x69757165526E6970 && a2 == 0xEB00000000646572;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746361736E617274 && a2 == 0xED000064496E6F69 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001001973E0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x61484B454B6E6970 && a2 == 0xEA00000000006873 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000100193F20 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000010019E150)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_10015EFD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100003EB0(&qword_1001E01C8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  Swift::String v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_10015F494();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100006520((uint64_t)a1);
  }
  LOBYTE(v33) = 0;
  char v10 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v33) = 1;
  uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v13 = v12;
  uint64_t v31 = v11;
  char v36 = 2;
  unint64_t v14 = sub_1000F12F0();
  swift_bridgeObjectRetain();
  unint64_t v32 = v14;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v36 = 3;
  uint64_t v29 = v33;
  unint64_t v30 = v34;
  sub_1000065D0(v33, v34);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v15 = v33;
  LOBYTE(v33) = 4;
  unint64_t v27 = v34;
  uint64_t v28 = v15;
  sub_1000065D0(v15, v34);
  LODWORD(v26) = KeyedDecodingContainer.decode(_:forKey:)();
  char v36 = 5;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  int v35 = v10 & 1;
  LODWORD(v32) = v26 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v16 = v33;
  unint64_t v25 = v34;
  uint64_t v26 = v33;
  swift_bridgeObjectRetain();
  uint64_t v18 = v29;
  unint64_t v17 = v30;
  sub_1000065D0(v29, v30);
  unint64_t v19 = v27;
  uint64_t v20 = v28;
  sub_1000065D0(v28, v27);
  uint64_t v21 = v16;
  unint64_t v22 = v25;
  sub_1000065D0(v21, v25);
  sub_100006628(v20, v19);
  sub_100006628(v18, v17);
  swift_bridgeObjectRelease();
  sub_100006520((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_100006628(v18, v17);
  sub_100006628(v20, v19);
  uint64_t v23 = v26;
  uint64_t result = sub_100006628(v26, v22);
  *(unsigned char *)a2 = v35;
  *(void *)(a2 + 8) = v31;
  *(void *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v19;
  *(unsigned char *)(a2 + 56) = v32;
  *(void *)(a2 + 64) = v23;
  *(void *)(a2 + 72) = v22;
  return result;
}

unint64_t sub_10015F494()
{
  unint64_t result = qword_1001E01D0;
  if (!qword_1001E01D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E01D0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for InternalTransactionData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    char *result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10015F5B4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalTransactionData.CodingKeys()
{
  return &type metadata for InternalTransactionData.CodingKeys;
}

unint64_t sub_10015F5F0()
{
  unint64_t result = qword_1001E01E0;
  if (!qword_1001E01E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E01E0);
  }
  return result;
}

unint64_t sub_10015F648()
{
  unint64_t result = qword_1001E01E8;
  if (!qword_1001E01E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E01E8);
  }
  return result;
}

unint64_t sub_10015F6A0()
{
  unint64_t result = qword_1001E01F0;
  if (!qword_1001E01F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E01F0);
  }
  return result;
}

void static Settings.default.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for BackendSetting();
  uint64_t v4 = __chkstk_darwin(v2 - 8, v3);
  unsigned int v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  Swift::String v9 = (char *)&v35 - v8;
  uint64_t v10 = type metadata accessor for Settings();
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  unint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  unint64_t v17 = (char *)&v35 - v16;
  id v18 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = [v18 initWithSuiteName:v19];

  if (v20)
  {
    id v22 = [v20 dictionaryRepresentation];

    id v20 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v21.value._rawValue = v20;
  Settings.init(dictionary:)(v21);
  if (v23)
  {
    uint64_t v24 = type metadata accessor for URL();
    unint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
    v25(v9, 1, 11, v24);
    v25(v6, 1, 11, v24);
    sub_10015FCCC((uint64_t)v9, (uint64_t)v6, 0, 0, 2, 2u, 0.0, 1, (uint64_t)v17, 0, 1, 0, 1, 0.0, 1, 0.0, 1, 0, 0,
      2,
      2,
      2,
      2);
    if (qword_1001D9400 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_100003E78(v26, (uint64_t)qword_1001E01F8);
    sub_100093150((uint64_t)v17, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for Settings);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v36 = v23;
      v37[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315394;
      swift_errorRetain();
      sub_100003EB0((uint64_t *)&unk_1001DD380);
      uint64_t v31 = String.init<A>(describing:)();
      uint64_t v35 = a1;
      uint64_t v36 = sub_100005EB8(v31, v32, v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v29 + 12) = 2080;
      uint64_t v33 = Settings.description.getter();
      uint64_t v36 = sub_100005EB8(v33, v34, v37);
      a1 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_1000930A8((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for Settings);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Invalid settings: %s\nReverting to default settings: %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
      sub_1000930A8((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for Settings);
    }
    sub_100161598((uint64_t)v17, a1);
  }
}

uint64_t type metadata accessor for Settings()
{
  uint64_t result = qword_1001E0268;
  if (!qword_1001E0268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10015FC04()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001E01F8);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001E01F8);
  if (qword_1001D9258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1028);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10015FCCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unsigned __int8 a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, char a11, uint64_t a12, char a13, double a14, char a15, double a16, char a17, void *a18, void *a19, char a20,char a21,char a22,char a23)
{
  int v28 = a6;
  sub_100093150(a1, a9, (uint64_t (*)(void))type metadata accessor for BackendSetting);
  uint64_t v29 = (int *)type metadata accessor for Settings();
  uint64_t v44 = a2;
  uint64_t result = sub_100093150(a2, a9 + v29[5], (uint64_t (*)(void))type metadata accessor for BackendSetting);
  *(unsigned char *)(a9 + v29[7]) = (v28 == 2) | a6 & 1;
  uint64_t v31 = a9 + v29[6];
  *(void *)uint64_t v31 = a3;
  *(void *)(v31 + 8) = a4;
  *(unsigned char *)(v31 + 16) = a5;
  double v32 = 300.0;
  double v33 = fmin(fmax(a14, 120.0), 300.0);
  if ((a15 & 1) == 0) {
    double v32 = v33;
  }
  *(double *)(a9 + v29[11]) = v32;
  double v34 = 300.0;
  double v35 = fmin(fmax(a16, 120.0), 300.0);
  if ((a17 & 1) == 0) {
    double v34 = v35;
  }
  *(double *)(a9 + v29[12]) = v34;
  double v36 = 3600.0;
  double v37 = 3600.0;
  if (a7 <= 3600.0) {
    double v37 = a7;
  }
  if (a7 >= 5.0) {
    double v38 = v37;
  }
  else {
    double v38 = 5.0;
  }
  if ((a8 & 1) == 0) {
    double v36 = v38;
  }
  *(double *)(a9 + v29[8]) = v36;
  uint64_t v39 = 86400;
  if ((a11 & 1) == 0) {
    uint64_t v39 = a10;
  }
  *(void *)(a9 + v29[9]) = v39;
  if (a13)
  {
    uint64_t v41 = 81900;
    goto LABEL_20;
  }
  double v40 = fmin(fmax((double)a12, 12600.0), 151200.0);
  if ((~*(void *)&v40 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v40 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v40 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    return result;
  }
  uint64_t v41 = (uint64_t)v40;
LABEL_20:
  uint64_t v42 = a18;
  *(void *)(a9 + v29[10]) = v41;
  if (!a18) {
    uint64_t v42 = _swiftEmptyArrayStorage;
  }
  *(void *)(a9 + v29[13]) = v42;
  if (a19) {
    uint64_t v43 = a19;
  }
  else {
    uint64_t v43 = _swiftEmptyArrayStorage;
  }
  sub_1000930A8(v44, (uint64_t (*)(void))type metadata accessor for BackendSetting);
  uint64_t result = sub_1000930A8(a1, (uint64_t (*)(void))type metadata accessor for BackendSetting);
  *(void *)(a9 + v29[14]) = v43;
  *(unsigned char *)(a9 + v29[15]) = (a20 == 2) | a20 & 1;
  *(unsigned char *)(a9 + v29[16]) = (a21 == 2) | a21 & 1;
  *(unsigned char *)(a9 + v29[17]) = (a22 == 2) | a22 & 1;
  *(unsigned char *)(a9 + v29[18]) = (a23 == 2) | a23 & 1;
  return result;
}

uint64_t Settings.description.getter()
{
  _StringGuts.grow(_:)(333);
  v1._uint64_t countAndFlagsBits = 0xD000000000000014;
  v1._object = (void *)0x800000010019E170;
  String.append(_:)(v1);
  v2._uint64_t countAndFlagsBits = sub_100137C58();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 0xD000000000000018;
  v3._object = (void *)0x800000010019E190;
  String.append(_:)(v3);
  uint64_t v4 = (int *)type metadata accessor for Settings();
  v5._uint64_t countAndFlagsBits = sub_100137C58();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 0x6761726F7473202CLL;
  v6._object = (void *)0xEA00000000003D65;
  String.append(_:)(v6);
  uint64_t v7 = v0 + v4[6];
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  char v10 = *(unsigned char *)(v7 + 16);
  sub_100101284(*(void *)v7, v9, v10);
  v11._uint64_t countAndFlagsBits = StorageSetting.description.getter(v8, v9, v10);
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  sub_10000E260(v8, v9, v10);
  v12._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  v12._object = (void *)0x800000010019E1B0;
  String.append(_:)(v12);
  Double.write<A>(to:)();
  v13._uint64_t countAndFlagsBits = 0xD000000000000025;
  v13._object = (void *)0x800000010019E1D0;
  String.append(_:)(v13);
  v14._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  v15._object = (void *)0x800000010019E200;
  String.append(_:)(v15);
  v16._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 0xD000000000000022;
  v17._object = (void *)0x800000010019E220;
  String.append(_:)(v17);
  Double.write<A>(to:)();
  v18._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v18._object = (void *)0x800000010019E250;
  String.append(_:)(v18);
  Double.write<A>(to:)();
  v19._uint64_t countAndFlagsBits = 0xD000000000000015;
  v19._object = (void *)0x800000010019E270;
  String.append(_:)(v19);
  if (*(unsigned char *)(v0 + v4[15])) {
    uint64_t v20 = 1702195828;
  }
  else {
    uint64_t v20 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + v4[15])) {
    unint64_t v21 = 0xE400000000000000;
  }
  else {
    unint64_t v21 = 0xE500000000000000;
  }
  unint64_t v22 = v21;
  String.append(_:)(*(Swift::String *)&v20);
  swift_bridgeObjectRelease();
  v23._uint64_t countAndFlagsBits = 0xD000000000000019;
  v23._object = (void *)0x800000010019E290;
  String.append(_:)(v23);
  if (*(unsigned char *)(v0 + v4[16])) {
    uint64_t v24 = 1702195828;
  }
  else {
    uint64_t v24 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + v4[16])) {
    unint64_t v25 = 0xE400000000000000;
  }
  else {
    unint64_t v25 = 0xE500000000000000;
  }
  unint64_t v26 = v25;
  String.append(_:)(*(Swift::String *)&v24);
  swift_bridgeObjectRelease();
  v27._object = (void *)0x800000010019E2B0;
  v27._uint64_t countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v27);
  if (*(unsigned char *)(v0 + v4[17])) {
    uint64_t v28 = 1702195828;
  }
  else {
    uint64_t v28 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + v4[17])) {
    unint64_t v29 = 0xE400000000000000;
  }
  else {
    unint64_t v29 = 0xE500000000000000;
  }
  unint64_t v30 = v29;
  String.append(_:)(*(Swift::String *)&v28);
  swift_bridgeObjectRelease();
  v31._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
  v31._object = (void *)0x800000010019E2D0;
  String.append(_:)(v31);
  if (*(unsigned char *)(v0 + v4[18])) {
    uint64_t v32 = 1702195828;
  }
  else {
    uint64_t v32 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + v4[18])) {
    unint64_t v33 = 0xE400000000000000;
  }
  else {
    unint64_t v33 = 0xE500000000000000;
  }
  unint64_t v34 = v33;
  String.append(_:)(*(Swift::String *)&v32);
  swift_bridgeObjectRelease();
  v35._uint64_t countAndFlagsBits = 8200236;
  v35._object = (void *)0xE300000000000000;
  String.append(_:)(v35);
  return 0;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Settings.init(dictionary:)(Swift::OpaquePointer_optional dictionary)
{
  rawValue = dictionary.value._rawValue;
  uint64_t v4 = v1;
  uint64_t v5 = type metadata accessor for BackendSetting();
  uint64_t v7 = __chkstk_darwin(v5 - 8, v6);
  uint64_t v9 = &v98[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __chkstk_darwin(v7, v10);
  Swift::String v13 = &v98[-v12];
  uint64_t v15 = __chkstk_darwin(v11, v14);
  Swift::String v17 = &v98[-v16];
  __chkstk_darwin(v15, v18);
  uint64_t v20 = &v98[-v19];
  if (!rawValue)
  {
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100138968((uint64_t)&v120, (uint64_t)&v98[-v19]);
    if (!v2)
    {
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
LABEL_31:
      sub_100008970((uint64_t)&v116);
      goto LABEL_32;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    return;
  }
  if (rawValue[2])
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100161910(0xD000000000000017, 0x8000000100199DF0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
    if (v22)
    {
      sub_100006570(rawValue[7] + 32 * v21, (uint64_t)&v120);
    }
    else
    {
      long long v120 = 0u;
      long long v121 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  sub_100138968((uint64_t)&v120, (uint64_t)v20);
  if (v2) {
    goto LABEL_33;
  }
  if (rawValue[2])
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100161910(0xD00000000000001ALL, 0x8000000100199E10, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
    if (v24)
    {
      sub_100006570(rawValue[7] + 32 * v23, (uint64_t)&v118);
    }
    else
    {
      long long v118 = 0u;
      long long v119 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v119 + 1))
    {
      sub_100006510(&v118, &v120);
      sub_100138968((uint64_t)&v120, (uint64_t)v17);
      goto LABEL_35;
    }
  }
  else
  {
    long long v118 = 0u;
    long long v119 = 0u;
  }
  if (!rawValue[2])
  {
    long long v116 = 0u;
    long long v117 = 0u;
LABEL_25:
    if (rawValue[2])
    {
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_100161910(0xD000000000000016, 0x800000010019E2F0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
      if (v28)
      {
        sub_100006570(rawValue[7] + 32 * v27, (uint64_t)&v120);
      }
      else
      {
        long long v120 = 0u;
        long long v121 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v120 = 0u;
      long long v121 = 0u;
    }
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_100161910(0xD000000000000017, 0x8000000100199DF0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v26)
  {
    sub_100006570(rawValue[7] + 32 * v25, (uint64_t)&v116);
  }
  else
  {
    long long v116 = 0u;
    long long v117 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v117 + 1)) {
    goto LABEL_25;
  }
  sub_100006510(&v116, &v120);
LABEL_32:
  sub_100008970((uint64_t)&v118);
  sub_100138968((uint64_t)&v120, (uint64_t)v17);
  if (!rawValue) {
    goto LABEL_38;
  }
LABEL_35:
  if (!rawValue[2])
  {
LABEL_38:
    long long v120 = 0u;
    long long v121 = 0u;
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_100161910(0xD000000000000015, 0x8000000100190900, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v30)
  {
    sub_100006570(rawValue[7] + 32 * v29, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
LABEL_41:
  uint64_t v31 = sub_100148C34((uint64_t)&v120);
  int v114 = v32;
  uint64_t v115 = v33;
  uint64_t v122 = v31;
  sub_100093150((uint64_t)v20, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for BackendSetting);
  sub_100093150((uint64_t)v17, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BackendSetting);
  if (!rawValue)
  {
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    long long v120 = 0u;
    long long v121 = 0u;
    sub_100008970((uint64_t)&v120);
    uint64_t v105 = 0;
    double v109 = 0.0;
    uint64_t v36 = 0;
    double v113 = 0.0;
    uint64_t v111 = 0;
    double v107 = 0.0;
    v104 = 0;
    long long v120 = 0u;
    long long v121 = 0u;
    int v108 = 1;
    int v101 = 2;
    int v103 = 2;
    char v37 = 1;
    unsigned __int8 v38 = 2;
    int v112 = 1;
    int v110 = 1;
    int v106 = 1;
    int v102 = 2;
    goto LABEL_167;
  }
  if (!rawValue[2])
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_51:
    sub_100008970((uint64_t)&v120);
    int v40 = 2;
    goto LABEL_52;
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_100161910(0xD00000000000001ALL, 0x8000000100199C30, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v35)
  {
    sub_100006570(rawValue[7] + 32 * v34, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_51;
  }
  int v39 = swift_dynamicCast();
  int v40 = v118;
  if (!v39) {
    int v40 = 2;
  }
LABEL_52:
  int v100 = v40;
  if (!rawValue[2])
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_62:
    sub_100008970((uint64_t)&v120);
    double v44 = 0.0;
    int v45 = 1;
    goto LABEL_63;
  }
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_100161910(0xD000000000000020, 0x8000000100199C50, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v42)
  {
    sub_100006570(rawValue[7] + 32 * v41, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_62;
  }
  int v43 = swift_dynamicCast();
  if (v43) {
    double v44 = *(double *)&v118;
  }
  else {
    double v44 = 0.0;
  }
  int v45 = v43 ^ 1;
LABEL_63:
  uint64_t v46 = rawValue[2];
  double v113 = v44;
  int v112 = v45;
  if (!v46)
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_73:
    sub_100008970((uint64_t)&v120);
    uint64_t v50 = 0;
    int v51 = 1;
    goto LABEL_74;
  }
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_100161910(0xD00000000000001BLL, 0x8000000100199C80, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v48)
  {
    sub_100006570(rawValue[7] + 32 * v47, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_73;
  }
  int v49 = swift_dynamicCast();
  if (v49) {
    uint64_t v50 = v118;
  }
  else {
    uint64_t v50 = 0;
  }
  int v51 = v49 ^ 1;
LABEL_74:
  int v99 = v51;
  if (!rawValue[2])
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_84:
    sub_100008970((uint64_t)&v120);
    uint64_t v55 = 0;
    int v56 = 1;
    goto LABEL_85;
  }
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_100161910(0xD000000000000018, 0x8000000100199CA0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v53)
  {
    sub_100006570(rawValue[7] + 32 * v52, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_84;
  }
  int v54 = swift_dynamicCast();
  if (v54) {
    uint64_t v55 = v118;
  }
  else {
    uint64_t v55 = 0;
  }
  int v56 = v54 ^ 1;
LABEL_85:
  uint64_t v57 = rawValue[2];
  uint64_t v111 = v55;
  int v110 = v56;
  if (!v57)
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_95:
    sub_100008970((uint64_t)&v120);
    double v61 = 0.0;
    int v62 = 1;
    goto LABEL_96;
  }
  swift_bridgeObjectRetain();
  uint64_t v58 = sub_100161910(0xD000000000000029, 0x8000000100199CC0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v59)
  {
    sub_100006570(rawValue[7] + 32 * v58, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_95;
  }
  int v60 = swift_dynamicCast();
  if (v60) {
    double v61 = *(double *)&v118;
  }
  else {
    double v61 = 0.0;
  }
  int v62 = v60 ^ 1;
LABEL_96:
  uint64_t v63 = rawValue[2];
  double v109 = v61;
  int v108 = v62;
  if (!v63)
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_106:
    sub_100008970((uint64_t)&v120);
    double v67 = 0.0;
    int v68 = 1;
    goto LABEL_107;
  }
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_100161910(0xD000000000000025, 0x8000000100199CF0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v65)
  {
    sub_100006570(rawValue[7] + 32 * v64, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_106;
  }
  int v66 = swift_dynamicCast();
  if (v66) {
    double v67 = *(double *)&v118;
  }
  else {
    double v67 = 0.0;
  }
  int v68 = v66 ^ 1;
LABEL_107:
  uint64_t v69 = rawValue[2];
  double v107 = v67;
  int v106 = v68;
  if (!v69)
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_116:
    sub_100008970((uint64_t)&v120);
    Swift::String v72 = 0;
    goto LABEL_117;
  }
  swift_bridgeObjectRetain();
  uint64_t v70 = sub_100161910(0xD000000000000027, 0x8000000100199D20, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v71)
  {
    sub_100006570(rawValue[7] + 32 * v70, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_116;
  }
  sub_100003EB0((uint64_t *)&unk_1001DA570);
  if (swift_dynamicCast()) {
    Swift::String v72 = (void *)v118;
  }
  else {
    Swift::String v72 = 0;
  }
LABEL_117:
  uint64_t v73 = rawValue[2];
  uint64_t v105 = v72;
  if (!v73)
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_126:
    sub_100008970((uint64_t)&v120);
    Swift::String v76 = 0;
    goto LABEL_127;
  }
  swift_bridgeObjectRetain();
  uint64_t v74 = sub_100161910(0xD000000000000025, 0x8000000100199D50, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v75)
  {
    sub_100006570(rawValue[7] + 32 * v74, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_126;
  }
  sub_100003EB0((uint64_t *)&unk_1001DA570);
  if (swift_dynamicCast()) {
    Swift::String v76 = (void *)v118;
  }
  else {
    Swift::String v76 = 0;
  }
LABEL_127:
  uint64_t v77 = rawValue[2];
  v104 = v76;
  if (!v77)
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_136:
    sub_100008970((uint64_t)&v120);
    int v80 = 2;
    goto LABEL_137;
  }
  swift_bridgeObjectRetain();
  uint64_t v78 = sub_100161910(0xD00000000000001ALL, 0x8000000100199D80, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v79)
  {
    sub_100006570(rawValue[7] + 32 * v78, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_136;
  }
  if (swift_dynamicCast()) {
    int v80 = v118;
  }
  else {
    int v80 = 2;
  }
LABEL_137:
  uint64_t v81 = rawValue[2];
  int v103 = v80;
  if (!v81)
  {
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_146:
    sub_100008970((uint64_t)&v120);
    int v84 = 2;
    goto LABEL_147;
  }
  swift_bridgeObjectRetain();
  uint64_t v82 = sub_100161910(0xD000000000000013, 0x8000000100199DA0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v83)
  {
    sub_100006570(rawValue[7] + 32 * v82, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_146;
  }
  if (swift_dynamicCast()) {
    int v84 = v118;
  }
  else {
    int v84 = 2;
  }
LABEL_147:
  uint64_t v85 = rawValue[2];
  int v102 = v84;
  if (!v85)
  {
    uint64_t v88 = v50;
    long long v120 = 0u;
    long long v121 = 0u;
LABEL_156:
    sub_100008970((uint64_t)&v120);
    int v89 = 2;
    goto LABEL_157;
  }
  swift_bridgeObjectRetain();
  uint64_t v86 = sub_100161910(0x2E726F74696E6F4DLL, 0xEF64656C62616E45, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
  if (v87)
  {
    sub_100006570(rawValue[7] + 32 * v86, (uint64_t)&v120);
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  uint64_t v88 = v50;
  swift_bridgeObjectRelease();
  if (!*((void *)&v121 + 1)) {
    goto LABEL_156;
  }
  if (swift_dynamicCast()) {
    int v89 = v118;
  }
  else {
    int v89 = 2;
  }
LABEL_157:
  uint64_t v90 = rawValue[2];
  int v101 = v89;
  if (v90)
  {
    uint64_t v91 = sub_100161910(0xD00000000000002ELL, 0x8000000100199DC0, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000C5F0);
    uint64_t v36 = v88;
    char v37 = v99;
    if (v92)
    {
      sub_100006570(rawValue[7] + 32 * v91, (uint64_t)&v120);
    }
    else
    {
      long long v120 = 0u;
      long long v121 = 0u;
    }
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
    uint64_t v36 = v88;
    char v37 = v99;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v121 + 1))
  {
    int v93 = swift_dynamicCast();
    char v94 = v118;
    if (!v93) {
      char v94 = 2;
    }
    uint64_t v95 = v122;
    uint64_t v96 = v115;
    char v97 = v114;
    unsigned __int8 v38 = v100;
    goto LABEL_168;
  }
  unsigned __int8 v38 = v100;
LABEL_167:
  sub_100008970((uint64_t)&v120);
  char v94 = 2;
  uint64_t v95 = v122;
  uint64_t v96 = v115;
  char v97 = v114;
LABEL_168:
  sub_10015FCCC((uint64_t)v13, (uint64_t)v9, v95, v96, v97, v38, v113, v112, v4, v36, v37, v111, v110, v109, v108, v107, v106, v105, v104,
    v103,
    v102,
    v101,
    v94);
  sub_1000930A8((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for BackendSetting);
  sub_1000930A8((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for BackendSetting);
}

uint64_t sub_100161598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Settings();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100161604@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1000065D0(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x100161868);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      uint64_t __s1 = sub_100006628(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      Swift::String v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      uint64_t __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        uint64_t __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

unint64_t sub_10016187C(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();
  return sub_100161D50(a1, v2);
}

uint64_t sub_1001618E4(uint64_t a1, uint64_t a2)
{
  return sub_100161910(a1, a2, (void (*)(unsigned char *, uint64_t, uint64_t))&Data.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100161DEC);
}

uint64_t sub_100161910(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, Swift::Int))
{
  Hasher.init(_seed:)();
  a3(v10, a1, a2);
  Swift::Int v7 = Hasher._finalize()();

  return a4(a1, a2, v7);
}

unint64_t sub_1001619A4(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();

  return sub_100162788(a1, v2);
}

uint64_t sub_100161AE8(uint64_t a1)
{
  return sub_100161B6C(a1, (void (*)(uint64_t))sub_10004632C, (uint64_t (*)(uint64_t, Swift::Int))sub_100162A10);
}

uint64_t sub_100161B14(uint64_t a1)
{
  return sub_100161B6C(a1, (void (*)(uint64_t))sub_10002B928, (uint64_t (*)(uint64_t, Swift::Int))sub_1001630B8);
}

uint64_t sub_100161B40(uint64_t a1)
{
  return sub_100161B6C(a1, (void (*)(uint64_t))sub_100057EEC, (uint64_t (*)(uint64_t, Swift::Int))sub_100163708);
}

uint64_t sub_100161B6C(uint64_t a1, void (*a2)(uint64_t), uint64_t (*a3)(uint64_t, Swift::Int))
{
  Hasher.init(_seed:)();
  a2(a1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v5 = Hasher._finalize()();

  return a3(a1, v5);
}

unint64_t sub_100161C08(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return sub_100161D50(a1, v2);
}

unint64_t sub_100161C50(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return sub_100163DD8(a1, v2);
}

unint64_t sub_100161CE0(char a1)
{
  char v2 = a1 & 1;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  Swift::Int v3 = Hasher._finalize()();

  return sub_100163F50(v2, v3);
}

unint64_t sub_100161D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_100161DEC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v7 = v3;
    unint64_t v8 = a2;
    uint64_t v10 = ~v5;
    unint64_t v80 = HIDWORD(a1);
    size_t v86 = HIDWORD(a1) - (int)a1;
    uint64_t v87 = ~v5;
    BOOL v11 = __OFSUB__(HIDWORD(a1), a1);
    BOOL v85 = v11;
    unint64_t v88 = a2 >> 62;
    uint64_t v83 = v3 + 64;
    uint64_t v84 = (int)a1;
    uint64_t v81 = a1 >> 32;
    uint64_t v79 = (a1 >> 32) - (int)a1;
    unint64_t v89 = a2 >> 62;
    size_t __n = BYTE6(a2);
    while (1)
    {
      uint64_t v12 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v6);
      uint64_t v14 = *v12;
      unint64_t v13 = v12[1];
      uint64_t v15 = 0;
      switch(v13 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v14), v14))
          {
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
          }
          uint64_t v15 = HIDWORD(v14) - (int)v14;
LABEL_14:
          sub_1000065D0(v14, v13);
          break;
        case 2uLL:
          uint64_t v17 = *(void *)(v14 + 16);
          uint64_t v16 = *(void *)(v14 + 24);
          uint64_t v15 = v16 - v17;
          if (!__OFSUB__(v16, v17)) {
            goto LABEL_14;
          }
          goto LABEL_122;
        case 3uLL:
          break;
        default:
          uint64_t v15 = BYTE6(v13);
          break;
      }
      size_t v18 = __n;
      switch(v89)
      {
        case 1uLL:
          size_t v18 = v86;
          if (v85) {
            goto LABEL_123;
          }
          goto LABEL_19;
        case 2uLL:
          uint64_t v20 = *(void *)(a1 + 16);
          uint64_t v19 = *(void *)(a1 + 24);
          BOOL v21 = __OFSUB__(v19, v20);
          size_t v18 = v19 - v20;
          if (!v21) {
            goto LABEL_19;
          }
          goto LABEL_124;
        case 3uLL:
          if (v15) {
            goto LABEL_7;
          }
          goto LABEL_119;
        default:
LABEL_19:
          if (v15 == v18)
          {
            if (v15 < 1)
            {
LABEL_119:
              sub_100006628(v14, v13);
              return v6;
            }
            switch(v13 >> 62)
            {
              case 1uLL:
                if ((int)v14 > v14 >> 32) {
                  goto LABEL_125;
                }
                uint64_t v26 = __DataStorage._bytes.getter();
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = __DataStorage._offset.getter();
                  if (__OFSUB__((int)v14, v28)) {
                    goto LABEL_127;
                  }
                  char v29 = (const void *)(v27 + (int)v14 - v28);
                }
                else
                {
                  char v29 = 0;
                }
                __DataStorage._length.getter();
                if (!v88)
                {
                  LOWORD(__s1[0]) = a1;
                  BYTE2(__s1[0]) = BYTE2(a1);
                  BYTE3(__s1[0]) = BYTE3(a1);
                  BYTE4(__s1[0]) = v80;
                  BYTE5(__s1[0]) = BYTE5(a1);
                  BYTE6(__s1[0]) = BYTE6(a1);
                  HIBYTE(__s1[0]) = HIBYTE(a1);
                  LOWORD(__s1[1]) = v8;
                  BYTE2(__s1[1]) = BYTE2(v8);
                  BYTE3(__s1[1]) = BYTE3(v8);
                  BYTE4(__s1[1]) = BYTE4(v8);
                  BYTE5(__s1[1]) = BYTE5(v8);
                  if (!v29) {
                    goto LABEL_155;
                  }
                  int v46 = memcmp(v29, __s1, __n);
LABEL_102:
                  sub_100006628(v14, v13);
                  uint64_t v10 = v87;
                  if (!v46) {
                    return v6;
                  }
                  break;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_136;
                  }
                  swift_retain();
                  uint64_t v47 = __DataStorage._bytes.getter();
                  if (v47)
                  {
                    uint64_t v48 = __DataStorage._offset.getter();
                    if (__OFSUB__(v84, v48)) {
                      goto LABEL_143;
                    }
                    v47 += v84 - v48;
                  }
                  uint64_t v49 = __DataStorage._length.getter();
                  size_t v50 = v79;
                  if (v49 < v79) {
                    size_t v50 = v49;
                  }
                  if (!v29) {
                    goto LABEL_148;
                  }
                  if (!v47) {
                    goto LABEL_149;
                  }
                  size_t v39 = v50;
                  int v40 = v29;
                  unsigned __int8 v38 = (const void *)v47;
LABEL_71:
                  int v46 = memcmp(v40, v38, v39);
                  sub_100006628(a1, v8);
                  goto LABEL_102;
                }
                uint64_t v69 = *(void *)(a1 + 16);
                uint64_t v78 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                uint64_t v70 = __DataStorage._bytes.getter();
                if (v70)
                {
                  uint64_t v71 = v70;
                  uint64_t v72 = __DataStorage._offset.getter();
                  if (__OFSUB__(v69, v72)) {
                    goto LABEL_142;
                  }
                  uint64_t v73 = (const void *)(v71 + v69 - v72);
                }
                else
                {
                  uint64_t v73 = 0;
                }
                if (__OFSUB__(v78, v69)) {
                  goto LABEL_137;
                }
                uint64_t v74 = __DataStorage._length.getter();
                if (v74 >= v78 - v69) {
                  size_t v75 = v78 - v69;
                }
                else {
                  size_t v75 = v74;
                }
                if (!v29) {
                  goto LABEL_156;
                }
                uint64_t v4 = v83;
                if (!v73) {
                  goto LABEL_157;
                }
                int v62 = memcmp(v29, v73, v75);
LABEL_115:
                swift_release();
LABEL_116:
                swift_release();
                sub_100006628(v14, v13);
                unint64_t v8 = a2;
                uint64_t v10 = v87;
                if (!v62) {
                  return v6;
                }
                break;
              case 2uLL:
                uint64_t v30 = *(void *)(v14 + 16);
                swift_retain();
                swift_retain();
                uint64_t v31 = __DataStorage._bytes.getter();
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = __DataStorage._offset.getter();
                  if (__OFSUB__(v30, v33)) {
                    goto LABEL_126;
                  }
                  uint64_t v34 = (const void *)(v32 + v30 - v33);
                }
                else
                {
                  uint64_t v34 = 0;
                }
                __DataStorage._length.getter();
                uint64_t v4 = v83;
                if (!v88)
                {
                  LOWORD(__s1[0]) = a1;
                  BYTE2(__s1[0]) = BYTE2(a1);
                  BYTE3(__s1[0]) = BYTE3(a1);
                  BYTE4(__s1[0]) = v80;
                  BYTE5(__s1[0]) = BYTE5(a1);
                  BYTE6(__s1[0]) = BYTE6(a1);
                  HIBYTE(__s1[0]) = HIBYTE(a1);
                  LODWORD(__s1[1]) = a2;
                  WORD2(__s1[1]) = WORD2(a2);
                  if (!v34) {
                    goto LABEL_152;
                  }
                  int v62 = memcmp(v34, __s1, __n);
                  swift_release();
                  goto LABEL_116;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_130;
                  }
                  swift_retain();
                  char v42 = (char *)__DataStorage._bytes.getter();
                  if (v42)
                  {
                    uint64_t v43 = __DataStorage._offset.getter();
                    if (__OFSUB__(v84, v43)) {
                      goto LABEL_141;
                    }
                    v42 += v84 - v43;
                  }
                  uint64_t v44 = __DataStorage._length.getter();
                  size_t v45 = v79;
                  if (v44 < v79) {
                    size_t v45 = v44;
                  }
                  if (!v34) {
                    goto LABEL_146;
                  }
                  if (!v42) {
                    goto LABEL_147;
                  }
                  int v46 = memcmp(v34, v42, v45);
                  unint64_t v8 = a2;
                  sub_100006628(a1, a2);
                  swift_release();
                  swift_release();
                  goto LABEL_102;
                }
                uint64_t v63 = *(void *)(a1 + 16);
                uint64_t v77 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                uint64_t v64 = (char *)__DataStorage._bytes.getter();
                if (v64)
                {
                  uint64_t v65 = __DataStorage._offset.getter();
                  if (__OFSUB__(v63, v65)) {
                    goto LABEL_140;
                  }
                  v64 += v63 - v65;
                }
                BOOL v21 = __OFSUB__(v77, v63);
                int64_t v66 = v77 - v63;
                if (v21) {
                  goto LABEL_135;
                }
                uint64_t v67 = __DataStorage._length.getter();
                if (v67 >= v66) {
                  size_t v68 = v66;
                }
                else {
                  size_t v68 = v67;
                }
                if (!v34) {
                  goto LABEL_153;
                }
                uint64_t v4 = v83;
                if (!v64) {
                  goto LABEL_154;
                }
                int v62 = memcmp(v34, v64, v68);
                swift_release();
                swift_release();
                goto LABEL_115;
              case 3uLL:
                memset(__s1, 0, 14);
                if (!v88) {
                  goto LABEL_45;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_129;
                  }
                  sub_1000065D0(a1, v8);
                  uint64_t v35 = __DataStorage._bytes.getter();
                  if (!v35) {
                    goto LABEL_145;
                  }
                  uint64_t v23 = v35;
                  uint64_t v36 = __DataStorage._offset.getter();
                  uint64_t v25 = v84 - v36;
                  if (__OFSUB__(v84, v36)) {
                    goto LABEL_134;
                  }
LABEL_41:
                  uint64_t v37 = __DataStorage._length.getter();
                  unsigned __int8 v38 = (const void *)(v23 + v25);
                  if (v37 >= v79) {
                    size_t v39 = v79;
                  }
                  else {
                    size_t v39 = v37;
                  }
                  int v40 = __s1;
                  goto LABEL_71;
                }
                uint64_t v57 = *(void *)(a1 + 16);
                uint64_t v58 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                char v53 = (char *)__DataStorage._bytes.getter();
                if (v53)
                {
                  uint64_t v59 = __DataStorage._offset.getter();
                  if (__OFSUB__(v57, v59)) {
                    goto LABEL_139;
                  }
                  v53 += v57 - v59;
                }
                BOOL v21 = __OFSUB__(v58, v57);
                int64_t v55 = v58 - v57;
                if (v21) {
                  goto LABEL_132;
                }
                uint64_t v56 = __DataStorage._length.getter();
                if (!v53) {
                  goto LABEL_151;
                }
LABEL_83:
                if (v56 >= v55) {
                  size_t v60 = v55;
                }
                else {
                  size_t v60 = v56;
                }
                int v61 = memcmp(__s1, v53, v60);
                swift_release();
                swift_release();
                sub_100006628(v14, v13);
                uint64_t v4 = v83;
                uint64_t v10 = v87;
                if (!v61) {
                  return v6;
                }
                break;
              default:
                __s1[0] = v14;
                LOWORD(__s1[1]) = v13;
                BYTE2(__s1[1]) = BYTE2(v13);
                BYTE3(__s1[1]) = BYTE3(v13);
                BYTE4(__s1[1]) = BYTE4(v13);
                BYTE5(__s1[1]) = BYTE5(v13);
                if (!v88)
                {
LABEL_45:
                  __int16 __s2 = a1;
                  char v92 = BYTE2(a1);
                  char v93 = BYTE3(a1);
                  char v94 = v80;
                  char v95 = BYTE5(a1);
                  char v96 = BYTE6(a1);
                  char v97 = HIBYTE(a1);
                  __int16 v98 = v8;
                  char v99 = BYTE2(v8);
                  char v100 = BYTE3(v8);
                  char v101 = BYTE4(v8);
                  char v102 = BYTE5(v8);
                  int v41 = memcmp(__s1, &__s2, __n);
                  sub_100006628(v14, v13);
                  if (!v41) {
                    return v6;
                  }
                  break;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_128;
                  }
                  sub_1000065D0(a1, v8);
                  uint64_t v22 = __DataStorage._bytes.getter();
                  if (!v22)
                  {
                    __DataStorage._length.getter();
                    __break(1u);
LABEL_145:
                    __DataStorage._length.getter();
                    __break(1u);
LABEL_146:
                    __break(1u);
LABEL_147:
                    __break(1u);
LABEL_148:
                    __break(1u);
LABEL_149:
                    __break(1u);
LABEL_150:
                    __break(1u);
LABEL_151:
                    __break(1u);
LABEL_152:
                    __break(1u);
LABEL_153:
                    __break(1u);
LABEL_154:
                    __break(1u);
LABEL_155:
                    __break(1u);
LABEL_156:
                    __break(1u);
LABEL_157:
                    __break(1u);
                    JUMPOUT(0x100162758);
                  }
                  uint64_t v23 = v22;
                  uint64_t v24 = __DataStorage._offset.getter();
                  uint64_t v25 = v84 - v24;
                  if (__OFSUB__(v84, v24)) {
                    goto LABEL_133;
                  }
                  goto LABEL_41;
                }
                uint64_t v51 = *(void *)(a1 + 16);
                uint64_t v52 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                char v53 = (char *)__DataStorage._bytes.getter();
                if (v53)
                {
                  uint64_t v54 = __DataStorage._offset.getter();
                  if (__OFSUB__(v51, v54)) {
                    goto LABEL_138;
                  }
                  v53 += v51 - v54;
                }
                BOOL v21 = __OFSUB__(v52, v51);
                int64_t v55 = v52 - v51;
                if (v21) {
                  goto LABEL_131;
                }
                uint64_t v56 = __DataStorage._length.getter();
                if (!v53) {
                  goto LABEL_150;
                }
                goto LABEL_83;
            }
          }
          else
          {
LABEL_7:
            sub_100006628(v14, v13);
          }
          unint64_t v6 = (v6 + 1) & v10;
          if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
            return v6;
          }
          break;
      }
    }
  }
  return v6;
}

unint64_t sub_100162788(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE400000000000000;
      unint64_t v8 = 1701080909;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x746942746E657645;
          unint64_t v7 = 0xEB0000000070616DLL;
          break;
        case 2:
          unint64_t v7 = 0x8000000100193520;
          unint64_t v8 = 0xD000000000000011;
          break;
        case 3:
          unint64_t v8 = 0xD000000000000018;
          unint64_t v7 = 0x8000000100193540;
          break;
        case 4:
          unint64_t v8 = 0x7A69536863746142;
          goto LABEL_9;
        case 5:
          unint64_t v8 = 0x646F43726F727245;
LABEL_9:
          unint64_t v7 = 0xE900000000000065;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      unint64_t v10 = 1701080909;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xEB0000000070616DLL;
          if (v8 == 0x746942746E657645) {
            goto LABEL_21;
          }
          goto LABEL_22;
        case 2:
          unint64_t v9 = 0x8000000100193520;
          if (v8 != 0xD000000000000011) {
            goto LABEL_22;
          }
          goto LABEL_21;
        case 3:
          unint64_t v10 = 0xD000000000000018;
          unint64_t v9 = 0x8000000100193540;
          goto LABEL_16;
        case 4:
          uint64_t v11 = 0x7A69536863746142;
          goto LABEL_20;
        case 5:
          uint64_t v11 = 0x646F43726F727245;
LABEL_20:
          unint64_t v9 = 0xE900000000000065;
          if (v8 == v11) {
            goto LABEL_21;
          }
          goto LABEL_22;
        default:
LABEL_16:
          if (v8 != v10) {
            goto LABEL_22;
          }
LABEL_21:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_22:
          char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v12) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_100162A10(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xEE00657A69534D41;
      unint64_t v8 = 0x4C536C656E72654BLL;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x53656C69666F7250;
          unint64_t v7 = 0xEF657A69534D414CLL;
          break;
        case 2:
          unint64_t v8 = 0xD000000000000014;
          unint64_t v7 = 0x80000001001932E0;
          break;
        case 3:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x44496C61626F6C47;
          break;
        case 4:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x8000000100193300;
          break;
        case 5:
          unint64_t v8 = 0x655674656C707041;
          unint64_t v7 = 0xED00006E6F697372;
          break;
        case 6:
          unint64_t v8 = 0xD000000000000015;
          unint64_t v7 = 0x8000000100193320;
          break;
        case 7:
          unint64_t v8 = 0x7250646564616F4CLL;
          unint64_t v7 = 0xED0000656C69666FLL;
          break;
        case 8:
          unint64_t v8 = 0x646F43726F727245;
          unint64_t v7 = 0xE900000000000065;
          break;
        case 9:
          unint64_t v8 = 0xD000000000000010;
          unint64_t v7 = 0x8000000100193350;
          break;
        case 0xA:
          unint64_t v8 = 0x637465464D414C53;
          unint64_t v7 = 0xEF73757461745368;
          break;
        case 0xB:
          unint64_t v8 = 0x7245726576726553;
          unint64_t v7 = 0xEF65646F43726F72;
          break;
        case 0xC:
          unint64_t v8 = 0xD000000000000014;
          unint64_t v7 = 0x8000000100193390;
          break;
        case 0xD:
          unint64_t v8 = 0xD00000000000001ALL;
          unint64_t v7 = 0x80000001001933B0;
          break;
        case 0xE:
          unint64_t v8 = 0xD000000000000015;
          unint64_t v7 = 0x80000001001933D0;
          break;
        case 0xF:
          unint64_t v8 = 0x654E6C656E72654BLL;
          uint64_t v9 = 1684366437;
          goto LABEL_25;
        case 0x10:
          unint64_t v7 = 0x8000000100193400;
          goto LABEL_22;
        case 0x11:
          unint64_t v8 = 0x4E656C69666F7250;
          unint64_t v7 = 0xED00006465646565;
          break;
        case 0x12:
          unint64_t v7 = 0x8000000100193430;
LABEL_22:
          unint64_t v8 = 0xD000000000000012;
          break;
        case 0x13:
          unint64_t v8 = 0x5374736575716552;
          unint64_t v7 = 0xED00007375746174;
          break;
        case 0x14:
          unint64_t v8 = 0x726F727245464153;
          uint64_t v9 = 1701080899;
LABEL_25:
          unint64_t v7 = v9 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          break;
        default:
          break;
      }
      uint64_t v10 = 0x4C536C656E72654BLL;
      unint64_t v11 = 0xEE00657A69534D41;
      switch(v6)
      {
        case 1:
          uint64_t v12 = 0x53656C69666F7250;
          uint64_t v13 = 0x7A69534D414CLL;
          goto LABEL_41;
        case 2:
          unint64_t v14 = 0xD000000000000014;
          uint64_t v15 = "ize";
          goto LABEL_46;
        case 3:
          unint64_t v11 = 0xE800000000000000;
          if (v8 != 0x44496C61626F6C47) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 4:
          unint64_t v14 = 0xD000000000000011;
          uint64_t v15 = "GlobalConfigSLAMSize";
          goto LABEL_46;
        case 5:
          uint64_t v16 = 0x655674656C707041;
          uint64_t v17 = 0x6E6F697372;
          goto LABEL_51;
        case 6:
          unint64_t v14 = 0xD000000000000015;
          uint64_t v15 = "TerminalProfileID";
          goto LABEL_46;
        case 7:
          uint64_t v16 = 0x7250646564616F4CLL;
          uint64_t v17 = 0x656C69666FLL;
          goto LABEL_51;
        case 8:
          unint64_t v11 = 0xE900000000000065;
          if (v8 != 0x646F43726F727245) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 9:
          unint64_t v14 = 0xD000000000000010;
          uint64_t v15 = "ofile";
          goto LABEL_46;
        case 10:
          unint64_t v11 = 0xEF73757461745368;
          if (v8 != 0x637465464D414C53) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 11:
          uint64_t v12 = 0x7245726576726553;
          uint64_t v13 = 0x646F43726F72;
LABEL_41:
          unint64_t v11 = v13 & 0xFFFFFFFFFFFFLL | 0xEF65000000000000;
          if (v8 != v12) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 12:
          unint64_t v14 = 0xD000000000000014;
          uint64_t v15 = "";
          goto LABEL_46;
        case 13:
          unint64_t v14 = 0xD00000000000001ALL;
          uint64_t v15 = "KernelSLAMLoadStatus";
          goto LABEL_46;
        case 14:
          unint64_t v14 = 0xD000000000000015;
          uint64_t v15 = "GlobalConfigSLAMLoadStatus";
LABEL_46:
          unint64_t v11 = (unint64_t)v15 | 0x8000000000000000;
          if (v8 != v14) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 15:
          uint64_t v18 = 0x654E6C656E72654BLL;
          uint64_t v19 = 1684366437;
          goto LABEL_63;
        case 16:
          unint64_t v11 = 0x8000000100193400;
          goto LABEL_54;
        case 17:
          uint64_t v16 = 0x4E656C69666F7250;
          uint64_t v17 = 0x6465646565;
LABEL_51:
          unint64_t v11 = v17 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
          if (v8 != v16) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 18:
          unint64_t v11 = 0x8000000100193430;
LABEL_54:
          if (v8 != 0xD000000000000012) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 19:
          uint64_t v10 = 0x5374736575716552;
          unint64_t v11 = 0xED00007375746174;
          goto LABEL_57;
        case 20:
          uint64_t v18 = 0x726F727245464153;
          uint64_t v19 = 1701080899;
LABEL_63:
          unint64_t v11 = v19 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          if (v8 != v18) {
            goto LABEL_59;
          }
          goto LABEL_58;
        default:
LABEL_57:
          if (v8 != v10) {
            goto LABEL_59;
          }
LABEL_58:
          if (v7 == v11)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_59:
          char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v20) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_1001630B8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD000000000000015;
      unint64_t v8 = 0x8000000100192D20;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xD000000000000010;
          uint64_t v9 = "applicationIdentifier";
          goto LABEL_28;
        case 2:
          unint64_t v7 = 0xD000000000000010;
          uint64_t v9 = "applicationLabel";
          goto LABEL_28;
        case 3:
          unint64_t v8 = 0xE800000000000000;
          unint64_t v7 = 0x44496769666E6F63;
          break;
        case 4:
          unint64_t v7 = 0xD000000000000019;
          uint64_t v9 = "ciphertextLength";
          goto LABEL_28;
        case 5:
          unint64_t v7 = 0x79636E6572727563;
          unint64_t v8 = 0xEC00000065646F43;
          break;
        case 6:
          unint64_t v7 = 0x696C6C6F50766D65;
          unint64_t v8 = 0xEE0065707954676ELL;
          break;
        case 7:
          unint64_t v7 = 0x646F43726F727265;
          unint64_t v8 = 0xE900000000000065;
          break;
        case 8:
          unint64_t v7 = 0x646E49726F727265;
          unint64_t v8 = 0xEF6E6F6974616369;
          break;
        case 9:
          unint64_t v7 = 0x746361466D726F66;
          goto LABEL_26;
        case 0xA:
          unint64_t v7 = 0xD000000000000015;
          uint64_t v9 = "errorIndication";
          goto LABEL_28;
        case 0xB:
          uint64_t v10 = "issuerApplicationData";
          goto LABEL_24;
        case 0xC:
          unint64_t v8 = 0xE800000000000000;
          unint64_t v7 = 0x44496C656E72656BLL;
          break;
        case 0xD:
          unint64_t v7 = 0x664F7265626D756ELL;
          unsigned int v11 = 1918985556;
          goto LABEL_22;
        case 0xE:
          uint64_t v10 = "ter";
          goto LABEL_24;
        case 0xF:
          unint64_t v7 = 0xD000000000000016;
          uint64_t v9 = "outcomeParameterSet";
          goto LABEL_28;
        case 0x10:
          uint64_t v10 = "provisionAppletVersion";
          goto LABEL_24;
        case 0x11:
          unint64_t v7 = 0x5041527472617473;
          unint64_t v8 = 0xEC00000057535544;
          break;
        case 0x12:
          unint64_t v7 = 0x6574726F70707573;
          unsigned int v11 = 1145651556;
LABEL_22:
          unint64_t v8 = v11 | 0xED00007300000000;
          break;
        case 0x13:
          uint64_t v10 = "gth";
LABEL_24:
          unint64_t v8 = (unint64_t)v10 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000013;
          break;
        case 0x14:
          unint64_t v7 = 0x7272456B63617274;
LABEL_26:
          unint64_t v8 = 0xEA0000000000726FLL;
          break;
        case 0x15:
          unint64_t v7 = 0xD000000000000011;
          uint64_t v9 = "terminalCountryCode";
LABEL_28:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          break;
        default:
          break;
      }
      unint64_t v12 = 0xD000000000000015;
      unint64_t v13 = 0x8000000100192D20;
      switch(v6)
      {
        case 1:
          unint64_t v14 = 0xD000000000000010;
          uint64_t v15 = "applicationIdentifier";
          goto LABEL_65;
        case 2:
          unint64_t v14 = 0xD000000000000010;
          uint64_t v15 = "applicationLabel";
          goto LABEL_65;
        case 3:
          unint64_t v13 = 0xE800000000000000;
          uint64_t v16 = 0x6769666E6F63;
          goto LABEL_46;
        case 4:
          unint64_t v14 = 0xD000000000000019;
          uint64_t v15 = "ciphertextLength";
          goto LABEL_65;
        case 5:
          uint64_t v17 = 0x79636E6572727563;
          uint64_t v18 = 1701080899;
          goto LABEL_53;
        case 6:
          unint64_t v13 = 0xEE0065707954676ELL;
          if (v7 != 0x696C6C6F50766D65) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 7:
          unint64_t v13 = 0xE900000000000065;
          if (v7 != 0x646F43726F727265) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 8:
          unint64_t v13 = 0xEF6E6F6974616369;
          if (v7 != 0x646E49726F727265) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 9:
          unint64_t v13 = 0xEA0000000000726FLL;
          if (v7 != 0x746361466D726F66) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 10:
          unint64_t v14 = 0xD000000000000015;
          uint64_t v15 = "errorIndication";
          goto LABEL_65;
        case 11:
          uint64_t v19 = "issuerApplicationData";
          goto LABEL_59;
        case 12:
          unint64_t v13 = 0xE800000000000000;
          uint64_t v16 = 0x6C656E72656BLL;
LABEL_46:
          if (v7 != (v16 & 0xFFFFFFFFFFFFLL | 0x4449000000000000)) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 13:
          uint64_t v20 = 0x664F7265626D756ELL;
          unsigned int v21 = 1918985556;
          goto LABEL_56;
        case 14:
          uint64_t v19 = "ter";
          goto LABEL_59;
        case 15:
          unint64_t v14 = 0xD000000000000016;
          uint64_t v15 = "outcomeParameterSet";
          goto LABEL_65;
        case 16:
          uint64_t v19 = "provisionAppletVersion";
          goto LABEL_59;
        case 17:
          uint64_t v17 = 0x5041527472617473;
          uint64_t v18 = 1465079108;
LABEL_53:
          unint64_t v13 = v18 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          if (v7 != v17) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 18:
          uint64_t v20 = 0x6574726F70707573;
          unsigned int v21 = 1145651556;
LABEL_56:
          unint64_t v13 = v21 | 0xED00007300000000;
          if (v7 != v20) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 19:
          uint64_t v19 = "gth";
LABEL_59:
          unint64_t v13 = (unint64_t)v19 | 0x8000000000000000;
          if (v7 != 0xD000000000000013) {
            goto LABEL_67;
          }
          goto LABEL_66;
        case 20:
          unint64_t v12 = 0x7272456B63617274;
          unint64_t v13 = 0xEA0000000000726FLL;
          goto LABEL_62;
        case 21:
          unint64_t v14 = 0xD000000000000011;
          uint64_t v15 = "terminalCountryCode";
LABEL_65:
          unint64_t v13 = (unint64_t)v15 | 0x8000000000000000;
          if (v7 == v14) {
            goto LABEL_66;
          }
          goto LABEL_67;
        default:
LABEL_62:
          if (v7 != v12) {
            goto LABEL_67;
          }
LABEL_66:
          if (v8 == v13)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_67:
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v22) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_100163708(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      unint64_t v7 = 0x8000000100192E00;
      unint64_t v8 = 0xD000000000000013;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0xD000000000000011;
          uint64_t v9 = "TransactionStatus";
          goto LABEL_33;
        case 2:
          unint64_t v8 = 0x646F43726F727245;
          unint64_t v7 = 0xE900000000000065;
          break;
        case 3:
          unint64_t v8 = 0xD000000000000016;
          uint64_t v9 = "StartTransactionStatus";
          goto LABEL_33;
        case 4:
          unint64_t v8 = 0xD000000000000011;
          uint64_t v9 = "cardSupportedAIDs";
          goto LABEL_33;
        case 5:
          unint64_t v8 = 0xD000000000000014;
          uint64_t v9 = "PaymentAppletVersion";
          goto LABEL_33;
        case 6:
          unint64_t v8 = 0x6F436C61626F6C47;
          unint64_t v7 = 0xEE0044496769666ELL;
          break;
        case 7:
          unint64_t v8 = 0xD000000000000011;
          uint64_t v9 = "TerminalProfileID";
          goto LABEL_33;
        case 8:
          unint64_t v8 = 0x4E73736150534156;
          unint64_t v7 = 0xEA00000000006D75;
          break;
        case 9:
          unint64_t v8 = 0xD00000000000001DLL;
          uint64_t v9 = "PaymentApplicationTypeAndPath";
          goto LABEL_33;
        case 0xA:
          unint64_t v8 = 0xD000000000000010;
          uint64_t v9 = "ApplicationLabel";
          goto LABEL_33;
        case 0xB:
          unint64_t v8 = 0xD000000000000015;
          uint64_t v9 = "ApplicationIdentifier";
          goto LABEL_33;
        case 0xC:
          unint64_t v8 = 0x746361466D726F46;
          goto LABEL_23;
        case 0xD:
          uint64_t v9 = "TerminalCountryCode";
          goto LABEL_33;
        case 0xE:
          unint64_t v7 = 0xE300000000000000;
          unint64_t v8 = 5396052;
          break;
        case 0xF:
          unint64_t v8 = 0x646E49726F727245;
          unint64_t v7 = 0xEF6E6F6974616369;
          break;
        case 0x10:
          uint64_t v9 = "OutcomeParameterSet";
          goto LABEL_33;
        case 0x11:
          unint64_t v8 = 0xD000000000000012;
          uint64_t v9 = "TimeoutReadPayment";
          goto LABEL_33;
        case 0x12:
          unint64_t v8 = 0x5274756F656D6954;
          unint64_t v7 = 0xEE00534156646165;
          break;
        case 0x13:
          unint64_t v8 = 0x7272456B63617254;
LABEL_23:
          unint64_t v7 = 0xEA0000000000726FLL;
          break;
        case 0x14:
          unint64_t v8 = 0x43676E6972616554;
          unint64_t v7 = 0xEC000000746E756FLL;
          break;
        case 0x15:
          unint64_t v8 = 0xD00000000000001DLL;
          uint64_t v9 = "ApplicationInterchangeProfile";
          goto LABEL_33;
        case 0x16:
          unint64_t v8 = 0xD000000000000019;
          uint64_t v9 = "CardProcessingRequirement";
          goto LABEL_33;
        case 0x17:
          uint64_t v9 = "OverrideAIDSupplied";
          goto LABEL_33;
        case 0x18:
          unint64_t v8 = 0xD000000000000011;
          uint64_t v9 = "payAppPollingType";
          goto LABEL_33;
        case 0x19:
          unint64_t v8 = 0xD000000000000012;
          uint64_t v9 = "EncryptedCHDLength";
          goto LABEL_33;
        case 0x1A:
          unint64_t v8 = 0xD00000000000001BLL;
          uint64_t v9 = "TransactionResultDataLength";
          goto LABEL_33;
        case 0x1B:
          uint64_t v9 = "RemovePINDigitCount";
          goto LABEL_33;
        case 0x1C:
          unint64_t v8 = 0xD000000000000012;
          uint64_t v9 = "EnterDigitInterval";
LABEL_33:
          unint64_t v7 = (unint64_t)(v9 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      unint64_t v10 = 0x8000000100192E00;
      unint64_t v11 = 0xD000000000000013;
      switch(a1)
      {
        case 1:
          unint64_t v11 = 0xD000000000000011;
          unint64_t v12 = "TransactionStatus";
          goto LABEL_73;
        case 2:
          unint64_t v10 = 0xE900000000000065;
          if (v8 != 0x646F43726F727245) {
            goto LABEL_75;
          }
          goto LABEL_74;
        case 3:
          unint64_t v11 = 0xD000000000000016;
          unint64_t v12 = "StartTransactionStatus";
          goto LABEL_73;
        case 4:
          unint64_t v11 = 0xD000000000000011;
          unint64_t v12 = "cardSupportedAIDs";
          goto LABEL_73;
        case 5:
          unint64_t v11 = 0xD000000000000014;
          unint64_t v12 = "PaymentAppletVersion";
          goto LABEL_73;
        case 6:
          uint64_t v13 = 0x6F436C61626F6C47;
          uint64_t v14 = 0x44496769666ELL;
          goto LABEL_57;
        case 7:
          unint64_t v11 = 0xD000000000000011;
          unint64_t v12 = "TerminalProfileID";
          goto LABEL_73;
        case 8:
          unint64_t v10 = 0xEA00000000006D75;
          if (v8 != 0x4E73736150534156) {
            goto LABEL_75;
          }
          goto LABEL_74;
        case 9:
          unint64_t v11 = 0xD00000000000001DLL;
          unint64_t v12 = "PaymentApplicationTypeAndPath";
          goto LABEL_73;
        case 10:
          unint64_t v11 = 0xD000000000000010;
          unint64_t v12 = "ApplicationLabel";
          goto LABEL_73;
        case 11:
          unint64_t v11 = 0xD000000000000015;
          unint64_t v12 = "ApplicationIdentifier";
          goto LABEL_73;
        case 12:
          uint64_t v15 = 0x746361466D726F46;
          goto LABEL_60;
        case 13:
          unint64_t v12 = "TerminalCountryCode";
          goto LABEL_73;
        case 14:
          unint64_t v10 = 0xE300000000000000;
          if (v8 != 5396052) {
            goto LABEL_75;
          }
          goto LABEL_74;
        case 15:
          unint64_t v10 = 0xEF6E6F6974616369;
          if (v8 != 0x646E49726F727245) {
            goto LABEL_75;
          }
          goto LABEL_74;
        case 16:
          unint64_t v12 = "OutcomeParameterSet";
          goto LABEL_73;
        case 17:
          unint64_t v11 = 0xD000000000000012;
          unint64_t v12 = "TimeoutReadPayment";
          goto LABEL_73;
        case 18:
          uint64_t v13 = 0x5274756F656D6954;
          uint64_t v14 = 0x534156646165;
LABEL_57:
          unint64_t v10 = v14 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          if (v8 != v13) {
            goto LABEL_75;
          }
          goto LABEL_74;
        case 19:
          uint64_t v15 = 0x7272456B63617254;
LABEL_60:
          unint64_t v10 = 0xEA0000000000726FLL;
          if (v8 != v15) {
            goto LABEL_75;
          }
          goto LABEL_74;
        case 20:
          unint64_t v11 = 0x43676E6972616554;
          unint64_t v10 = 0xEC000000746E756FLL;
          goto LABEL_63;
        case 21:
          unint64_t v11 = 0xD00000000000001DLL;
          unint64_t v12 = "ApplicationInterchangeProfile";
          goto LABEL_73;
        case 22:
          unint64_t v11 = 0xD000000000000019;
          unint64_t v12 = "CardProcessingRequirement";
          goto LABEL_73;
        case 23:
          unint64_t v12 = "OverrideAIDSupplied";
          goto LABEL_73;
        case 24:
          unint64_t v11 = 0xD000000000000011;
          unint64_t v12 = "payAppPollingType";
          goto LABEL_73;
        case 25:
          unint64_t v11 = 0xD000000000000012;
          unint64_t v12 = "EncryptedCHDLength";
          goto LABEL_73;
        case 26:
          unint64_t v11 = 0xD00000000000001BLL;
          unint64_t v12 = "TransactionResultDataLength";
          goto LABEL_73;
        case 27:
          unint64_t v12 = "RemovePINDigitCount";
          goto LABEL_73;
        case 28:
          unint64_t v11 = 0xD000000000000012;
          unint64_t v12 = "EnterDigitInterval";
LABEL_73:
          unint64_t v10 = (unint64_t)(v12 - 32) | 0x8000000000000000;
          if (v8 == v11) {
            goto LABEL_74;
          }
          goto LABEL_75;
        default:
LABEL_63:
          if (v8 != v11) {
            goto LABEL_75;
          }
LABEL_74:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_75:
          char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v16) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v6;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_100163DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100163F50(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t _s9SPREngine8SettingsV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_100138F6C(a1, a2) & 1) == 0) {
    goto LABEL_46;
  }
  uint64_t v4 = (int *)type metadata accessor for Settings();
  if ((sub_100138F6C(a1 + v4[5], a2 + v4[5]) & 1) == 0) {
    goto LABEL_46;
  }
  uint64_t v5 = v4[6];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  int v8 = *(unsigned __int8 *)(a1 + v5 + 16);
  uint64_t v9 = (uint64_t *)(a2 + v5);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  int v12 = *((unsigned __int8 *)v9 + 16);
  if (v8)
  {
    if (v8 != 1)
    {
      if (v6 | v7)
      {
        if (v6 ^ 1 | v7)
        {
          if (v12 != 2) {
            goto LABEL_46;
          }
          if (v10 != 2 || v11 != 0) {
            goto LABEL_46;
          }
        }
        else
        {
          if (v12 != 2) {
            goto LABEL_46;
          }
          if (v10 != 1 || v11 != 0) {
            goto LABEL_46;
          }
        }
      }
      else if (v12 != 2 || (v11 | v10) != 0)
      {
        goto LABEL_46;
      }
LABEL_35:
      if (*(unsigned __int8 *)(a1 + v4[7]) == *(unsigned __int8 *)(a2 + v4[7])
        && *(double *)(a1 + v4[8]) == *(double *)(a2 + v4[8])
        && *(void *)(a1 + v4[9]) == *(void *)(a2 + v4[9])
        && *(void *)(a1 + v4[10]) == *(void *)(a2 + v4[10])
        && *(double *)(a1 + v4[11]) == *(double *)(a2 + v4[11])
        && *(double *)(a1 + v4[12]) == *(double *)(a2 + v4[12])
        && (sub_10014A9C0(*(void **)(a1 + v4[13]), *(void **)(a2 + v4[13])) & 1) != 0
        && (sub_10014A9C0(*(void **)(a1 + v4[14]), *(void **)(a2 + v4[14])) & 1) != 0
        && *(unsigned __int8 *)(a1 + v4[15]) == *(unsigned __int8 *)(a2 + v4[15])
        && *(unsigned __int8 *)(a1 + v4[16]) == *(unsigned __int8 *)(a2 + v4[16])
        && *(unsigned __int8 *)(a1 + v4[17]) == *(unsigned __int8 *)(a2 + v4[17]))
      {
        char v15 = *(unsigned char *)(a1 + v4[18]) ^ *(unsigned char *)(a2 + v4[18]) ^ 1;
        return v15 & 1;
      }
      goto LABEL_46;
    }
    if (v12 != 1) {
      goto LABEL_46;
    }
  }
  else if (v12)
  {
LABEL_46:
    char v15 = 0;
    return v15 & 1;
  }
  if (v6 == v10 && v7 == v11) {
    goto LABEL_35;
  }
  char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
  char v15 = 0;
  if (v14) {
    goto LABEL_35;
  }
  return v15 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for Settings(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 11, v7))
    {
      uint64_t v10 = type metadata accessor for BackendSetting();
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 11, v7);
    }
    uint64_t v12 = a3[5];
    uint64_t v13 = (char *)a1 + v12;
    char v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 11, v7))
    {
      uint64_t v15 = type metadata accessor for BackendSetting();
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0, 11, v7);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = (char *)a1 + v16;
    char v18 = (char *)a2 + v16;
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *((void *)v18 + 1);
    unsigned __int8 v21 = v18[16];
    sub_100101284(*(void *)v18, v20, v21);
    *(void *)uint64_t v17 = v19;
    *((void *)v17 + 1) = v20;
    v17[16] = v21;
    uint64_t v22 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v22) = *(uint64_t *)((char *)a2 + v22);
    uint64_t v23 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)a1 + v23) = *(uint64_t *)((char *)a2 + v23);
    uint64_t v24 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v24) = *(uint64_t *)((char *)a2 + v24);
    uint64_t v25 = a3[14];
    *(uint64_t *)((char *)a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)a1 + v25) = *(uint64_t *)((char *)a2 + v25);
    uint64_t v26 = a3[16];
    *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *((unsigned char *)a1 + v26) = *((unsigned char *)a2 + v26);
    uint64_t v27 = a3[18];
    *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    *((unsigned char *)a1 + v27) = *((unsigned char *)a2 + v27);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Settings(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 11, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  if (!v6(v7, 11, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10000E260(*(void *)(a1 + *(int *)(a2 + 24)), *(void *)(a1 + *(int *)(a2 + 24) + 8), *(unsigned char *)(a1 + *(int *)(a2 + 24) + 16));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 11, v6))
  {
    uint64_t v9 = type metadata accessor for BackendSetting();
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 11, v6))
  {
    uint64_t v13 = type metadata accessor for BackendSetting();
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 11, v6);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = *(void *)v16;
  uint64_t v18 = *((void *)v16 + 1);
  unsigned __int8 v19 = v16[16];
  sub_100101284(*(void *)v16, v18, v19);
  *(void *)uint64_t v15 = v17;
  *((void *)v15 + 1) = v18;
  v15[16] = v19;
  uint64_t v20 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  uint64_t v21 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v21] = *(void *)&a2[v21];
  uint64_t v22 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  *(void *)&a1[v22] = *(void *)&a2[v22];
  uint64_t v23 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  *(void *)&a1[v23] = *(void *)&a2[v23];
  uint64_t v24 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  a1[v24] = a2[v24];
  uint64_t v25 = a3[18];
  a1[a3[17]] = a2[a3[17]];
  a1[v25] = a2[v25];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 11, v6);
  int v10 = v8(a2, 11, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = type metadata accessor for BackendSetting();
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 11, v6);
  int v16 = v8(v14, 11, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = type metadata accessor for BackendSetting();
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 11, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  unsigned __int8 v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *((void *)v20 + 1);
  unsigned __int8 v23 = v20[16];
  sub_100101284(*(void *)v20, v22, v23);
  uint64_t v24 = *(void *)v19;
  uint64_t v25 = *((void *)v19 + 1);
  *(void *)unsigned __int8 v19 = v21;
  *((void *)v19 + 1) = v22;
  unsigned __int8 v26 = v19[16];
  v19[16] = v23;
  sub_10000E260(v24, v25, v26);
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[15]] = a2[a3[15]];
  a1[a3[16]] = a2[a3[16]];
  a1[a3[17]] = a2[a3[17]];
  a1[a3[18]] = a2[a3[18]];
  return a1;
}

char *initializeWithTake for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 11, v6))
  {
    uint64_t v9 = type metadata accessor for BackendSetting();
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 11, v6))
  {
    uint64_t v13 = type metadata accessor for BackendSetting();
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 11, v6);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = a3[7];
  int v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  *(_OWORD *)int v16 = *(_OWORD *)v17;
  v16[16] = v17[16];
  a1[v15] = a2[v15];
  uint64_t v18 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  uint64_t v19 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  uint64_t v20 = a3[13];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  uint64_t v21 = a3[15];
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  a1[v21] = a2[v21];
  uint64_t v22 = a3[17];
  a1[a3[16]] = a2[a3[16]];
  a1[v22] = a2[v22];
  a1[a3[18]] = a2[a3[18]];
  return a1;
}

char *assignWithTake for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 11, v6);
  int v10 = v8(a2, 11, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = type metadata accessor for BackendSetting();
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 11, v6);
  int v16 = v8(v14, 11, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = type metadata accessor for BackendSetting();
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 11, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  char v21 = v20[16];
  uint64_t v22 = *(void *)v19;
  uint64_t v23 = *((void *)v19 + 1);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  unsigned __int8 v24 = v19[16];
  v19[16] = v21;
  sub_10000E260(v22, v23, v24);
  uint64_t v25 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v25] = *(void *)&a2[v25];
  uint64_t v26 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v26] = *(void *)&a2[v26];
  uint64_t v27 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  *(void *)&a1[v27] = *(void *)&a2[v27];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  a1[v28] = a2[v28];
  uint64_t v29 = a3[18];
  a1[a3[17]] = a2[a3[17]];
  a1[v29] = a2[v29];
  return a1;
}

uint64_t getEnumTagSinglePayload for Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100165174);
}

uint64_t sub_100165174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for BackendSetting();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 52));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Settings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100165248);
}

uint64_t sub_100165248(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for BackendSetting();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100165304()
{
  uint64_t result = type metadata accessor for BackendSetting();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *GlobalState.shared.unsafeMutableAddressor()
{
  if (qword_1001D9410 != -1) {
    swift_once();
  }
  return &static GlobalState.shared;
}

id GlobalState.isPANPresent.setter(char a1)
{
  id result = [*(id *)(v1 + 72) lock];
  uint64_t v4 = *(void *)(v1 + 96);
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  *(void *)(v1 + 96) = v6;
  while (*(uint64_t *)(v1 + 88) > 0 || *(unsigned char *)(v1 + 80) == 1)
    id result = [*(id *)(v1 + 72) wait];
  uint64_t v7 = *(void *)(v1 + 96);
  BOOL v5 = __OFSUB__(v7, 1);
  uint64_t v8 = v7 - 1;
  if (v5) {
    goto LABEL_11;
  }
  *(void *)(v1 + 96) = v8;
  *(unsigned char *)(v1 + 80) = 1;
  [*(id *)(v1 + 72) unlock];
  *(unsigned char *)(v1 + 33) = a1 & 1;
  sub_1001661D8();
  [*(id *)(v1 + 72) lock];
  *(unsigned char *)(v1 + 80) = 0;
  [*(id *)(v1 + 72) broadcast];
  uint64_t v9 = *(void **)(v1 + 72);

  return [v9 unlock];
}

uint64_t sub_100165508()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001E02D8);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001E02D8);
  if (qword_1001D9288 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)static SPRLogger.xpcServer);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_1001655D0()
{
  _StringGuts.grow(_:)(52);
  v0._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
  v0._object = (void *)0x800000010019E3F0;
  String.append(_:)(v0);
  v1._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000010019E410;
  v2._uint64_t countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v2);
  Double.write<A>(to:)();
  v3._uint64_t countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0;
}

uint64_t sub_1001656C4(void *a1)
{
  uint64_t v3 = sub_100003EB0(&qword_1001E0410);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_100167B08();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v11 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    char v10 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_10016582C()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0x7465736552637472;
  }
}

uint64_t sub_100165878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10016784C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001658A0(uint64_t a1)
{
  unint64_t v2 = sub_100167B08();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001658DC(uint64_t a1)
{
  unint64_t v2 = sub_100167B08();

  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_100165918(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
}

BOOL sub_100165944(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 < *(_DWORD *)a2) {
    return 1;
  }
  return *(double *)(a1 + 8) < *(double *)(a2 + 8) && *(_DWORD *)a2 >= *(_DWORD *)a1;
}

BOOL sub_100165974(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 < *(_DWORD *)a1) {
    return 0;
  }
  return *(double *)(a2 + 8) >= *(double *)(a1 + 8) || *(_DWORD *)a1 < *(_DWORD *)a2;
}

BOOL sub_1001659A4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 < *(_DWORD *)a2) {
    return 0;
  }
  return *(double *)(a1 + 8) >= *(double *)(a2 + 8) || *(_DWORD *)a2 < *(_DWORD *)a1;
}

BOOL sub_1001659D4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 < *(_DWORD *)a1) {
    return 1;
  }
  return *(double *)(a2 + 8) < *(double *)(a1 + 8) && *(_DWORD *)a1 >= *(_DWORD *)a2;
}

void sub_100165A04(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100167960(a1);
  if (!v2)
  {
    *(_DWORD *)a2 = v4;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_100165A34(void *a1)
{
  return sub_1001656C4(a1);
}

uint64_t sub_100165A54()
{
  return sub_1001655D0();
}

uint64_t sub_100165A60()
{
  uint64_t v1 = 7104878;
  v31[0] = 0;
  v31[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(116);
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  v2._uint64_t countAndFlagsBits = 0xD000000000000038;
  v2._object = (void *)0x800000010019E430;
  String.append(_:)(v2);
  sub_100029CEC(v0, (uint64_t)v30, &qword_1001E03C8);
  sub_100029CEC((uint64_t)v30, (uint64_t)v31, &qword_1001E03C8);
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = 7104878;
  unint64_t v5 = 0xE300000000000000;
  if ((v32 & 1) == 0)
  {
    uint64_t v4 = sub_1001655D0();
    unint64_t v5 = v6;
  }
  unint64_t v7 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease();
  v8._object = (void *)0x800000010019E470;
  v8._uint64_t countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v8);
  sub_100029CEC(v0 + 17, (uint64_t)&v29, &qword_1001E03D0);
  sub_100029CEC((uint64_t)&v29, (uint64_t)&v33, &qword_1001E03D0);
  uint64_t v9 = 1702195828;
  if ((v33 & 1) == 0) {
    uint64_t v9 = 0x65736C6166;
  }
  unint64_t v10 = 0xE400000000000000;
  if ((v33 & 1) == 0) {
    unint64_t v10 = 0xE500000000000000;
  }
  if (v33 == 2) {
    uint64_t v11 = 7104878;
  }
  else {
    uint64_t v11 = v9;
  }
  if (v33 == 2) {
    unint64_t v12 = 0xE300000000000000;
  }
  else {
    unint64_t v12 = v10;
  }
  unint64_t v13 = v12;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease();
  v14._uint64_t countAndFlagsBits = 0xD000000000000013;
  v14._object = (void *)0x800000010019E490;
  String.append(_:)(v14);
  sub_100029CEC(v0 + 24, (uint64_t)v28, &qword_1001E03D8);
  sub_100029CEC((uint64_t)v28, (uint64_t)&v34, &qword_1001E03D8);
  uint64_t v15 = 7104878;
  if ((v35 & 1) == 0)
  {
    uint64_t v23 = v34;
    sub_100167674();
    uint64_t v15 = BinaryInteger.description.getter();
    unint64_t v3 = v16;
  }
  unint64_t v17 = v3;
  String.append(_:)(*(Swift::String *)&v15);
  swift_bridgeObjectRelease();
  v18._uint64_t countAndFlagsBits = 0xD000000000000011;
  v18._object = (void *)0x800000010019E4B0;
  String.append(_:)(v18);
  sub_100029CEC(v0 + 36, (uint64_t)v27, &qword_1001E03E0);
  sub_100029CEC((uint64_t)v27, (uint64_t)&v23, &qword_1001E03E0);
  if ((v23 & 0x100000000) != 0)
  {
    uint64_t v19 = (void *)0xE300000000000000;
  }
  else
  {
    int v24 = v23;
    sub_100167620();
    uint64_t v1 = BinaryInteger.description.getter();
    uint64_t v19 = v20;
  }
  v21._uint64_t countAndFlagsBits = v1;
  v21._object = v19;
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_100165D00(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003EB0(&qword_1001E0418);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_100167B5C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_100029CEC(v3, (uint64_t)v15, &qword_1001E03C8);
  sub_100029CEC((uint64_t)v15, (uint64_t)v14, &qword_1001E03C8);
  char v13 = 0;
  sub_10014DF78();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v2)
  {
    v14[0] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v14[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v10 = *(unsigned char *)(v3 + 40);
    v14[0] = 3;
    char v13 = v10;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_100165EFC()
{
  uint64_t result = 0x44464D7473616CLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6572504E41507369;
      break;
    case 2:
      uint64_t result = 0x664F7265626D756ELL;
      break;
    case 3:
      uint64_t result = 0x7465736552637472;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100165FAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100167BB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100165FD4(uint64_t a1)
{
  unint64_t v2 = sub_100167B5C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100166010(uint64_t a1)
{
  unint64_t v2 = sub_100167B5C();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10016604C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100167DCC(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_100166090(void *a1)
{
  return sub_100165D00(a1);
}

uint64_t sub_1001660CC()
{
  return sub_100165A60();
}

id GlobalState.isPANPresent.getter()
{
  id result = [*(id *)(v0 + 72) lock];
  while (*(uint64_t *)(v0 + 96) > 0 || *(unsigned char *)(v0 + 80) == 1)
    id result = [*(id *)(v0 + 72) wait];
  uint64_t v2 = *(void *)(v0 + 88);
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(void *)(v0 + 88) = v4;
  [*(id *)(v0 + 72) unlock];
  char v5 = *(unsigned char *)(v0 + 33);
  id result = [*(id *)(v0 + 72) lock];
  uint64_t v6 = *(void *)(v0 + 88);
  BOOL v3 = __OFSUB__(v6, 1);
  uint64_t v7 = v6 - 1;
  if (v3)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  *(void *)(v0 + 88) = v7;
  if (!v7) {
    [*(id *)(v0 + 72) broadcast];
  }
  [*(id *)(v0 + 72) unlock];
  return (id)(v5 & 1);
}

void sub_1001661D8()
{
  uint64_t v1 = type metadata accessor for JSONEncoder.OutputFormatting();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 initWithSuiteName:v6];

  if (v7)
  {
    type metadata accessor for JSONEncoder();
    char v8 = *(unsigned char *)(v0 + 32);
    char v9 = *(unsigned char *)(v0 + 33);
    uint64_t v10 = *(void *)(v0 + 40);
    char v11 = *(unsigned char *)(v0 + 48);
    int v12 = *(_DWORD *)(v0 + 52);
    char v13 = *(unsigned char *)(v0 + 56);
    long long v26 = *(_OWORD *)(v0 + 16);
    char v27 = v8;
    char v28 = v9;
    uint64_t v29 = v10;
    char v30 = v11;
    int v31 = v12;
    char v32 = v13;
    sub_100167578();
    default argument 1 of static JSONEncoder.encodeClean<A>(_:outputFormatting:)();
    static JSONEncoder.encodeClean<A>(_:outputFormatting:)((uint64_t)&v26, (uint64_t)v4);
    uint64_t v19 = v18;
    unint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    NSString v23 = String._bridgeToObjectiveC()();
    [v7 setObject:isa forKey:v23];

    sub_100006628(v19, v21);
  }
  else
  {
    if (qword_1001D9408 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100003E78(v14, (uint64_t)qword_1001E02D8);
    os_log_t v25 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v15, "Cannot access SPR user defaults", v16, 2u);
      swift_slowDealloc();
    }
    os_log_t v17 = v25;
  }
}

id (*GlobalState.isPANPresent.modify(uint64_t a1))(unsigned char *a1, char a2)
{
  *(void *)a1 = v1;
  id result = (id (*)(unsigned char *, char))[*(id *)(v1 + 72) lock];
  while (*(uint64_t *)(v1 + 96) > 0 || *(unsigned char *)(v1 + 80) == 1)
    id result = (id (*)(unsigned char *, char))[*(id *)(v1 + 72) wait];
  uint64_t v4 = *(void *)(v1 + 88);
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(void *)(v1 + 88) = v6;
  [*(id *)(v1 + 72) unlock];
  char v7 = *(unsigned char *)(v1 + 33);
  id result = (id (*)(unsigned char *, char))[*(id *)(v1 + 72) lock];
  uint64_t v8 = *(void *)(v1 + 88);
  BOOL v5 = __OFSUB__(v8, 1);
  uint64_t v9 = v8 - 1;
  if (v5)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  *(void *)(v1 + 88) = v9;
  if (!v9) {
    [*(id *)(v1 + 72) broadcast];
  }
  [*(id *)(v1 + 72) unlock];
  *(unsigned char *)(a1 + 8) = v7 & 1;
  return sub_100166790;
}

id sub_100166790(unsigned char *a1, char a2)
{
  uint64_t v3 = *(void *)a1;
  char v4 = a1[8];
  id result = [*(id *)(*(void *)a1 + 72) lock];
  uint64_t v6 = *(void *)(v3 + 96);
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  char v9 = v7;
  if (a2)
  {
    if (v9)
    {
      __break(1u);
      goto LABEL_23;
    }
    *(void *)(v3 + 96) = v8;
    while (*(uint64_t *)(v3 + 88) > 0 || *(unsigned char *)(v3 + 80) == 1)
      id result = [*(id *)(v3 + 72) wait];
    uint64_t v10 = *(void *)(v3 + 96);
    BOOL v7 = __OFSUB__(v10, 1);
    uint64_t v8 = v10 - 1;
    if (!v7) {
      goto LABEL_19;
    }
    __break(1u);
  }
  if (v9)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return result;
  }
  *(void *)(v3 + 96) = v8;
  while (*(uint64_t *)(v3 + 88) > 0 || *(unsigned char *)(v3 + 80) == 1)
    id result = [*(id *)(v3 + 72) wait];
  uint64_t v11 = *(void *)(v3 + 96);
  BOOL v7 = __OFSUB__(v11, 1);
  uint64_t v8 = v11 - 1;
  if (v7) {
    goto LABEL_24;
  }
LABEL_19:
  *(void *)(v3 + 96) = v8;
  *(unsigned char *)(v3 + 80) = 1;
  [*(id *)(v3 + 72) unlock];
  *(unsigned char *)(v3 + 33) = v4;
  sub_1001661D8();
  [*(id *)(v3 + 72) lock];
  *(unsigned char *)(v3 + 80) = 0;
  [*(id *)(v3 + 72) broadcast];
  int v12 = *(void **)(v3 + 72);

  return [v12 unlock];
}

uint64_t sub_1001668CC()
{
  uint64_t result = sub_1001668EC();
  static GlobalState.shared = result;
  return result;
}

uint64_t sub_1001668EC()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  uint64_t v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    if (qword_1001D9408 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100003E78(v8, (uint64_t)qword_1001E02D8);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v9, "Cannot access SPR user defaults", v10, 2u);
      swift_slowDealloc();
    }
    goto LABEL_8;
  }
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 dataForKey:v3];

  if (!v4)
  {
LABEL_8:

    type metadata accessor for GlobalState();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 72) = [objc_allocWithZone((Class)NSCondition) init];
    *(unsigned char *)(v11 + 80) = 0;
    *(void *)(v11 + 16) = 0;
    *(void *)(v11 + 24) = 0;
    *(void *)(v11 + 88) = 0;
    *(void *)(v11 + 96) = 0;
    *(_WORD *)(v11 + 32) = 513;
    *(void *)(v11 + 40) = 0;
    *(unsigned char *)(v11 + 48) = 1;
    *(_DWORD *)(v11 + 52) = 0;
    *(unsigned char *)(v11 + 56) = 1;
    goto LABEL_9;
  }
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  type metadata accessor for JSONDecoder();
  sub_1001675CC();
  default argument 2 of static JSONDecoder.decodeClean<A>(_:from:userInfo:)();
  static JSONDecoder.decodeClean<A>(_:from:userInfo:)();
  swift_bridgeObjectRelease();
  long long v23 = v21;
  v24[0] = v22[0];
  *(_OWORD *)((char *)v24 + 9) = *(_OWORD *)((char *)v22 + 9);
  if (qword_1001D9408 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100003E78(v13, (uint64_t)qword_1001E02D8);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v21 = swift_slowAlloc();
    *(_DWORD *)unint64_t v16 = 136315138;
    uint64_t v17 = sub_100165A60();
    sub_100005EB8(v17, v18, (uint64_t *)&v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  type metadata accessor for GlobalState();
  uint64_t v11 = swift_allocObject();
  id v19 = [objc_allocWithZone((Class)NSCondition) init];
  sub_100006628(v5, v7);

  *(void *)(v11 + 72) = v19;
  *(unsigned char *)(v11 + 80) = 0;
  *(void *)(v11 + 88) = 0;
  *(void *)(v11 + 96) = 0;
  long long v20 = v24[0];
  *(_OWORD *)(v11 + 16) = v23;
  *(_OWORD *)(v11 + 32) = v20;
  *(_OWORD *)(v11 + 41) = *(_OWORD *)((char *)v24 + 9);
LABEL_9:
  *(void *)(v11 + 64) = 0;
  return v11;
}

uint64_t static GlobalState.shared.getter()
{
  if (qword_1001D9410 != -1) {
    swift_once();
  }

  return swift_retain();
}

Swift::Void __swiftcall GlobalState.updateMFDEventTimestamp()()
{
  [*(id *)(v0 + 72) lock];
  uint64_t v1 = *(void *)(v0 + 96);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  *(void *)(v0 + 96) = v3;
  while (*(uint64_t *)(v0 + 88) > 0 || *(unsigned char *)(v0 + 80) == 1)
    [*(id *)(v0 + 72) wait];
  uint64_t v4 = *(void *)(v0 + 96);
  BOOL v2 = __OFSUB__(v4, 1);
  uint64_t v5 = v4 - 1;
  if (v2) {
    goto LABEL_14;
  }
  *(void *)(v0 + 96) = v5;
  *(unsigned char *)(v0 + 80) = 1;
  [*(id *)(v0 + 72) unlock];
  uint64_t v6 = *(unsigned int *)(v0 + 52);
  int v7 = *(unsigned __int8 *)(v0 + 56);
  TMGetKernelMonotonicClock();
  if (v7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v6;
  }
  *(void *)(v0 + 16) = v9;
  *(void *)(v0 + 24) = v8;
  *(unsigned char *)(v0 + 32) = 0;
  sub_1001661D8();
  [*(id *)(v0 + 72) lock];
  *(unsigned char *)(v0 + 80) = 0;
  [*(id *)(v0 + 72) broadcast];
  uint64_t v10 = *(void **)(v0 + 72);

  [v10 unlock];
}

Swift::Void __swiftcall GlobalState.receiveTMRTCResetNotification()()
{
  uint64_t v2 = v0;
  [*(id *)(v0 + 72) lock];
  uint64_t v3 = *(void *)(v0 + 96);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_15;
  }
  *(void *)(v0 + 96) = v5;
  while (*(uint64_t *)(v0 + 88) > 0 || *(unsigned char *)(v0 + 80) == 1)
    [*(id *)(v0 + 72) wait];
  uint64_t v6 = *(void *)(v0 + 96);
  BOOL v4 = __OFSUB__(v6, 1);
  uint64_t v7 = v6 - 1;
  if (v4) {
    goto LABEL_19;
  }
  *(void *)(v0 + 96) = v7;
  *(unsigned char *)(v0 + 80) = 1;
  p_ivar_lyt = &GlobalState.ivar_lyt;
  [*(id *)(v0 + 72) unlock];
  if (*(unsigned char *)(v0 + 56))
  {
    int v8 = 0;
LABEL_10:
    char v9 = 0;
    int v10 = v8 + 1;
    goto LABEL_11;
  }
  int v8 = *(_DWORD *)(v0 + 52);
  if (v8 != -1) {
    goto LABEL_10;
  }
  if (qword_1001D9408 != -1) {
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v13 = (void *)(v0 + 16);
  uint64_t v14 = type metadata accessor for Logger();
  sub_100003E78(v14, (uint64_t)qword_1001E02D8);
  os_log_type_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "unexpected rtc reset count, reset GlobalState info", v17, 2u);
    swift_slowDealloc();
  }

  int v10 = 0;
  void *v13 = 0;
  *(void *)(v2 + 24) = 0;
  *(_WORD *)(v2 + 32) = 513;
  *(void *)(v2 + 40) = 0;
  char v9 = 1;
  *(unsigned char *)(v2 + 48) = 1;
LABEL_11:
  *(_DWORD *)(v2 + 52) = v10;
  *(unsigned char *)(v2 + 56) = v9;
  sub_1001661D8();
  [*(id *)(v2 + 72) lock];
  *(unsigned char *)(v2 + 80) = 0;
  [*(id *)(v2 + 72) broadcast];
  uint64_t v11 = *(void **)(v2 + 72);
  int v12 = (const char *)p_ivar_lyt[308];

  [v11 v12];
}

void __swiftcall GlobalState.updateNumberOfDeletableClients()(Swift::tuple_previous_Int_optional_current_Int_optional *__return_ptr retstr)
{
  [*(id *)(v1 + 72) lock];
  uint64_t v2 = *(void *)(v1 + 96);
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
  *(void *)(v1 + 96) = v4;
  while (*(uint64_t *)(v1 + 88) > 0 || *(unsigned char *)(v1 + 80) == 1)
    [*(id *)(v1 + 72) wait];
  uint64_t v5 = *(void *)(v1 + 96);
  BOOL v3 = __OFSUB__(v5, 1);
  uint64_t v6 = v5 - 1;
  if (v3) {
    goto LABEL_25;
  }
  *(void *)(v1 + 96) = v6;
  *(unsigned char *)(v1 + 80) = 1;
  [*(id *)(v1 + 72) unlock];
  char v15 = *(unsigned char *)(v1 + 48);
  id v7 = [self enumeratorWithOptions:0];
  id v8 = [v7 nextObject];
  if (v8)
  {
    id v9 = v8;
    uint64_t v16 = 0;
    while (1)
    {
      id v11 = [v9 entitlements];
      NSString v12 = String._bridgeToObjectiveC()();
      sub_1000432DC();
      id v13 = [v11 objectForKey:v12 ofClass:swift_getObjCClassFromMetadata()];

      if (v13)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v18 = 0u;
        long long v19 = 0u;
      }
      sub_100029CEC((uint64_t)&v18, (uint64_t)v20, &qword_1001DD3F0);
      unsigned int v14 = [v9 isDeletable];

      int v10 = (long long *)v20;
      if (!v14) {
        goto LABEL_10;
      }
      sub_100029CEC((uint64_t)v20, (uint64_t)&v18, &qword_1001DD3F0);
      if (!*((void *)&v19 + 1)) {
        break;
      }
      if swift_dynamicCast() && (v17)
      {
        if (__OFADD__(v16, 1))
        {
          __break(1u);
          goto LABEL_24;
        }
        ++v16;
      }
LABEL_11:
      id v9 = [v7 nextObject];
      if (!v9) {
        goto LABEL_22;
      }
    }
    int v10 = &v18;
LABEL_10:
    sub_100008970((uint64_t)v10);
    goto LABEL_11;
  }
  uint64_t v16 = 0;
LABEL_22:
  *(void *)(v1 + 40) = v16;
  *(unsigned char *)(v1 + 48) = 0;
  sub_1001661D8();
  [*(id *)(v1 + 72) lock];
  *(unsigned char *)(v1 + 80) = 0;
  [*(id *)(v1 + 72) broadcast];
  [*(id *)(v1 + 72) unlock];

  v20[0] = v15;
  LOBYTE(v18) = 0;
}

uint64_t GlobalState.deinit()
{
  return v0;
}

uint64_t GlobalState.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GlobalState()
{
  return self;
}

unint64_t sub_100167578()
{
  unint64_t result = qword_1001E03B8;
  if (!qword_1001E03B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E03B8);
  }
  return result;
}

unint64_t sub_1001675CC()
{
  unint64_t result = qword_1001E03C0;
  if (!qword_1001E03C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E03C0);
  }
  return result;
}

unint64_t sub_100167620()
{
  unint64_t result = qword_1001E03E8;
  if (!qword_1001E03E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E03E8);
  }
  return result;
}

unint64_t sub_100167674()
{
  unint64_t result = qword_1001E03F0;
  if (!qword_1001E03F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E03F0);
  }
  return result;
}

__n128 initializeWithCopy for GlobalState.PersistedInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for GlobalState.PersistedInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 17);
  if (v3 >= 2) {
    int v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v4 = -2;
  }
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GlobalState.PersistedInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 17) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GlobalState.PersistedInfo()
{
  return &type metadata for GlobalState.PersistedInfo;
}

uint64_t getEnumTagSinglePayload for SPRTimestamp(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SPRTimestamp(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SPRTimestamp()
{
  return &type metadata for SPRTimestamp;
}

unint64_t sub_1001677F8()
{
  unint64_t result = qword_1001E03F8;
  if (!qword_1001E03F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E03F8);
  }
  return result;
}

uint64_t sub_10016784C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7465736552637472 && a2 == 0xED0000746E756F43;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000010019E4D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_100167960(void *a1)
{
  uint64_t v4 = sub_100003EB0(&qword_1001E0400);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_100167B08();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    char v13 = 0;
    KeyedDecodingContainer.decode(_:forKey:)();
    char v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    double v2 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  sub_100006520((uint64_t)a1);
  return v2;
}

unint64_t sub_100167B08()
{
  unint64_t result = qword_1001E0408;
  if (!qword_1001E0408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0408);
  }
  return result;
}

unint64_t sub_100167B5C()
{
  unint64_t result = qword_1001E0420;
  if (!qword_1001E0420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0420);
  }
  return result;
}

uint64_t sub_100167BB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x44464D7473616CLL && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572504E41507369 && a2 == 0xEC000000746E6573 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x664F7265626D756ELL && a2 == 0xEF73746E65696C43 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7465736552637472 && a2 == 0xED0000746E756F43)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100167DCC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100003EB0(&qword_1001E0428);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  double v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006788(a1, a1[3]);
  sub_100167B5C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100006520((uint64_t)a1);
  }
  char v24 = 0;
  sub_10014DF24();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v10 = v21;
  uint64_t v19 = v20;
  int v11 = v22;
  LOBYTE(v20) = 1;
  HIDWORD(v17) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v23 = v11;
  uint64_t v18 = v10;
  LOBYTE(v20) = 2;
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  LOBYTE(v10) = v13;
  LOBYTE(v20) = 3;
  uint64_t v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t result = sub_100006520((uint64_t)a1);
  uint64_t v16 = v18;
  *(void *)a2 = v19;
  *(void *)(a2 + 8) = v16;
  *(unsigned char *)(a2 + 16) = v23;
  *(unsigned char *)(a2 + 17) = BYTE4(v17);
  *(void *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 32) = v10 & 1;
  *(_DWORD *)(a2 + 36) = v14;
  *(unsigned char *)(a2 + 40) = BYTE4(v14) & 1;
  return result;
}

unsigned char *storeEnumTagSinglePayload for GlobalState.PersistedInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    char *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1001680ECLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GlobalState.PersistedInfo.CodingKeys()
{
  return &type metadata for GlobalState.PersistedInfo.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SPRTimestamp.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    char *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1001681F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SPRTimestamp.CodingKeys()
{
  return &type metadata for SPRTimestamp.CodingKeys;
}

unint64_t sub_10016822C()
{
  unint64_t result = qword_1001E0430;
  if (!qword_1001E0430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0430);
  }
  return result;
}

unint64_t sub_100168284()
{
  unint64_t result = qword_1001E0438;
  if (!qword_1001E0438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0438);
  }
  return result;
}

unint64_t sub_1001682DC()
{
  unint64_t result = qword_1001E0440;
  if (!qword_1001E0440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0440);
  }
  return result;
}

unint64_t sub_100168334()
{
  unint64_t result = qword_1001E0448;
  if (!qword_1001E0448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0448);
  }
  return result;
}

unint64_t sub_10016838C()
{
  unint64_t result = qword_1001E0450;
  if (!qword_1001E0450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0450);
  }
  return result;
}

unint64_t sub_1001683E4()
{
  unint64_t result = qword_1001E0458;
  if (!qword_1001E0458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0458);
  }
  return result;
}

uint64_t sub_100168438(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a1 == 301)
  {
    if (a2 == 0x696C61762D666173 && a3 == 0xEE006E6F69746164) {
      goto LABEL_9;
    }
  }
  else
  {
    if (a1 != 300)
    {
      if (a1 == 200
        && (a2 == 0x702D657275636573 && a3 == 0xEE0064616F6C7961
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      {
        unint64_t v8 = a2;
        unint64_t v9 = a3;
        swift_bridgeObjectRetain();
        uint64_t v5 = 0x747265632DLL;
        unint64_t v6 = 0xE500000000000000;
        goto LABEL_15;
      }
LABEL_18:
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    if (a2 == 7596553831663430000 && a3 == 0xEE006E6F69746164) {
      goto LABEL_9;
    }
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  unint64_t v8 = a2;
  unint64_t v9 = a3;
  swift_bridgeObjectRetain();
  uint64_t v5 = 0x73747265632DLL;
  unint64_t v6 = 0xE600000000000000;
LABEL_15:
  String.append(_:)(*(Swift::String *)&v5);

  return sub_100114E24(v8, v9);
}

void sub_100168628()
{
  sub_100003EB0(&qword_1001DA140);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001861D0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v1;
  uint64_t v2 = UUID.uuidString.getter();
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v3;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v4;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(unsigned char *)(inited + 96) = 1;
  unint64_t v5 = sub_100004D6C(inited);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  sub_10016997C(v5);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10016ABAC;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10016A41C;
  aBlock[3] = &unk_1001CC610;
  unint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DeviceIdentityIssueClientCertificateWithCompletion();
  _Block_release(v8);

  swift_beginAccess();
  if (*(void *)(v6 + 16))
  {
    if (qword_1001D9418 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100003E78(v9, (uint64_t)qword_1001E0460);
    swift_retain_n();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_errorRetain();
      sub_100003EB0(&qword_1001DB498);
      uint64_t v13 = String.init<A>(describing:)();
      sub_100005EB8(v13, v14, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to delete BAA key and certificate: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    swift_release();
  }
}

CFDataRef sub_10016899C()
{
  if (qword_1001D9318 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl);
  id v2 = (id)qword_1001E1150;
  sub_100004B04((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v27[0] = 0;
  id v4 = [v2 evaluateAccessControl:v1 operation:3 options:isa error:v27];

  if (v4)
  {
    id v5 = v27[0];

    CFErrorRef error = 0;
    uint64_t v6 = *(__SecKey **)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key);
    CFDataRef v7 = Data._bridgeToObjectiveC()().super.isa;
    CFDataRef v8 = SecKeyCreateSignature(v6, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v7, &error);

    if (error)
    {
      if (qword_1001D9418 != -1) {
        swift_once();
      }
      uint64_t v9 = type metadata accessor for Logger();
      sub_100003E78(v9, (uint64_t)qword_1001E0460);
      uint64_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        v27[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 136315138;
        swift_beginAccess();
        sub_100003EB0(&qword_1001E0580);
        uint64_t v13 = String.init<A>(describing:)();
        sub_100005EB8(v13, v14, (uint64_t *)v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error with BAA data signature: %s", v12, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      swift_beginAccess();
      sub_100003EB0(&qword_1001E0580);
      uint64_t v15 = String.init<A>(describing:)();
      uint64_t v17 = v16;
      uint64_t v18 = v15;
      uint64_t v19 = v17;
    }
    else
    {
      if (v8)
      {
        *(_OWORD *)char v27 = xmmword_10018A340;
        CFDataRef v21 = v8;
        static Data._conditionallyBridgeFromObjectiveC(_:result:)();

        if ((unint64_t)v27[1] >> 60 != 15)
        {
          CFDataRef v8 = (CFDataRef)v27[0];

          return v8;
        }
      }
      if (qword_1001D9418 != -1) {
        swift_once();
      }
      uint64_t v22 = type metadata accessor for Logger();
      sub_100003E78(v22, (uint64_t)qword_1001E0460);
      int v23 = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        os_log_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_t v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unexpected nil value for BAA data signature", v25, 2u);
        swift_slowDealloc();
      }

      uint64_t v19 = (void *)0x800000010019E620;
      uint64_t v18 = 0xD000000000000015;
    }
    sub_10002A180(10004, v18, v19, 0);
    swift_willThrow();
  }
  else
  {
    CFDataRef v8 = (CFDataRef)v27[0];
    uint64_t v20 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    sub_10002A180(10003, 0x617461446E676973, (void *)0xE800000000000000, v20);
    swift_errorRelease();
    swift_willThrow();
    swift_errorRelease();
  }
  return v8;
}

CFDataRef sub_100168E88()
{
  if (qword_1001D9318 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl);
  id v2 = (id)qword_1001E1150;
  sub_100004B04((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v27[0] = 0;
  id v4 = [v2 evaluateAccessControl:v1 operation:3 options:isa error:v27];

  if (v4)
  {
    id v5 = v27[0];

    CFErrorRef error = 0;
    uint64_t v6 = *(__SecKey **)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key);
    CFDataRef v7 = Data._bridgeToObjectiveC()().super.isa;
    CFDataRef v8 = SecKeyCreateSignature(v6, kSecKeyAlgorithmECDSASignatureDigestX962SHA256, v7, &error);

    if (error)
    {
      if (qword_1001D9418 != -1) {
        swift_once();
      }
      uint64_t v9 = type metadata accessor for Logger();
      sub_100003E78(v9, (uint64_t)qword_1001E0460);
      uint64_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        v27[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 136315138;
        swift_beginAccess();
        sub_100003EB0(&qword_1001E0580);
        uint64_t v13 = String.init<A>(describing:)();
        sub_100005EB8(v13, v14, (uint64_t *)v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error with BAA digest signature: %s", v12, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      swift_beginAccess();
      sub_100003EB0(&qword_1001E0580);
      uint64_t v15 = String.init<A>(describing:)();
      uint64_t v17 = v16;
      uint64_t v18 = v15;
      uint64_t v19 = v17;
    }
    else
    {
      if (v8)
      {
        *(_OWORD *)char v27 = xmmword_10018A340;
        CFDataRef v21 = v8;
        static Data._conditionallyBridgeFromObjectiveC(_:result:)();

        if ((unint64_t)v27[1] >> 60 != 15)
        {
          CFDataRef v8 = (CFDataRef)v27[0];

          return v8;
        }
      }
      if (qword_1001D9418 != -1) {
        swift_once();
      }
      uint64_t v22 = type metadata accessor for Logger();
      sub_100003E78(v22, (uint64_t)qword_1001E0460);
      int v23 = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        os_log_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_t v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unexpected nil value for BAA digest signature", v25, 2u);
        swift_slowDealloc();
      }

      uint64_t v19 = (void *)0x800000010019E600;
      uint64_t v18 = 0xD000000000000017;
    }
    sub_10002A180(10004, v18, v19, 0);
    swift_willThrow();
  }
  else
  {
    CFDataRef v8 = (CFDataRef)v27[0];
    uint64_t v20 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    sub_10002A180(10003, 0x656769446E676973, (void *)0xEA00000000007473, v20);
    swift_errorRelease();
    swift_willThrow();
    swift_errorRelease();
  }
  return v8;
}

uint64_t sub_100169378()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(89);
  v2._uint64_t countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 60;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  v4._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._uint64_t countAndFlagsBits = 0xD000000000000014;
  v5._object = (void *)0x800000010019C430;
  String.append(_:)(v5);
  type metadata accessor for SecAccessControl(0);
  _print_unlocked<A, B>(_:_:)();
  v6._uint64_t countAndFlagsBits = 0x73614879656B202CLL;
  v6._object = (void *)0xEB00000000203A68;
  String.append(_:)(v6);
  type metadata accessor for SecKey(0);
  sub_10016C62C(&qword_1001E05A0, type metadata accessor for SecKey);
  _CFObject.hashValue.getter();
  v7._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 0x203A6661656C202CLL;
  v8._object = (void *)0xE800000000000000;
  String.append(_:)(v8);
  uint64_t v9 = v0[3];
  unint64_t v10 = v1[4];
  sub_1000065D0(v1[3], v10);
  Swift::String v11 = Data.base64EncodedString(options:)(0);
  sub_100006628(v9, v10);
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._uint64_t countAndFlagsBits = 0xD000000000000011;
  v12._object = (void *)0x800000010019C450;
  String.append(_:)(v12);
  uint64_t v13 = v1[5];
  int64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    swift_bridgeObjectRetain();
    sub_10014B9C4(0, v14, 0);
    uint64_t v15 = (unint64_t *)(v13 + 40);
    do
    {
      uint64_t v16 = *(v15 - 1);
      unint64_t v17 = *v15;
      sub_1000065D0(v16, *v15);
      Swift::String v18 = Data.base64EncodedString(options:)(0);
      v19._uint64_t countAndFlagsBits = 44;
      v19._object = (void *)0xE100000000000000;
      String.append(_:)(v19);
      sub_100006628(v16, v17);
      unint64_t v21 = _swiftEmptyArrayStorage[2];
      unint64_t v20 = _swiftEmptyArrayStorage[3];
      if (v21 >= v20 >> 1) {
        sub_10014B9C4(v20 > 1, v21 + 1, 1);
      }
      v15 += 2;
      _swiftEmptyArrayStorage[2] = v21 + 1;
      *(Swift::String *)&_swiftEmptyArrayStorage[2 * v21 + 4] = v18;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  v22._uint64_t countAndFlagsBits = Array.description.getter();
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23._object = (void *)0x800000010019C470;
  v23._uint64_t countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v23);
  v24._uint64_t countAndFlagsBits = sub_1001655D0();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._uint64_t countAndFlagsBits = 32044;
  v25._object = (void *)0xE200000000000000;
  String.append(_:)(v25);
  return 0;
}

uint64_t sub_100169758()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001E0460);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001E0460);
  if (qword_1001D9268 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1058);
  Swift::String v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100169820()
{
  sub_100003EB0((uint64_t *)&unk_1001DA520);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100189E90;
  *(void *)(v0 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 88) = v4;
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 96) = result;
  *(void *)(v0 + 104) = v6;
  qword_1001E1238 = v0;
  return result;
}

void sub_1001698D0()
{
  SecAccessControlRef v0 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, 0);
  if (v0)
  {
    uint64_t v1 = v0;
    sub_100104D90((uint64_t)&off_1001C4F60);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    SecAccessControlSetConstraints();

    qword_1001E1240 = (uint64_t)v1;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10016997C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003EB0(&qword_1001D8788);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    unint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_100006570(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    uint64_t v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100006510(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100006510(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100006510(v36, v37);
    sub_100006510(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_100006510(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1000CC860();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100169D44(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = (uint64_t *)(a5 + 16);
  if (a3)
  {
    if (qword_1001D9418 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100003E78(v11, (uint64_t)qword_1001E0460);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v14 = 136315138;
      uint64_t v52 = a3;
      swift_errorRetain();
      sub_100003EB0(&qword_1001DB498);
      uint64_t v15 = String.init<A>(describing:)();
      uint64_t v52 = sub_100005EB8(v15, v16, v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error getting DeviceIdentity certificate: %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v51[0] = a3;
    swift_errorRetain();
    sub_100003EB0(&qword_1001DB498);
    uint64_t v26 = String.init<A>(describing:)();
    uint64_t v28 = sub_10002A180(10001, v26, v27, 0);
    swift_beginAccess();
    *unint64_t v9 = v28;
    goto LABEL_29;
  }
  if (a1)
  {
    if (a2)
    {
      uint64_t v18 = *(void *)(a2 + 16);
      if (v18 == 2)
      {
        uint64_t v19 = (void **)(a6 + 16);
        uint64_t v20 = (void **)(a7 + 16);
        unint64_t v21 = (void **)(a8 + 16);
        swift_beginAccess();
        unint64_t v22 = *v19;
        *uint64_t v19 = a1;
        id v23 = a1;
        swift_bridgeObjectRetain();

        sub_100006570(a2 + 32, (uint64_t)v51);
        type metadata accessor for SecCertificate(0);
        swift_dynamicCast();
        swift_beginAccess();
        unint64_t v24 = *v20;
        *uint64_t v20 = v49;

        sub_100006570(a2 + 64, (uint64_t)v51);
        swift_bridgeObjectRelease();

        swift_dynamicCast();
        swift_beginAccess();
        BOOL v25 = *v21;
        *unint64_t v21 = v50;

        OS_dispatch_semaphore.signal()();
        return spr_releaseCFObject();
      }
      uint64_t v42 = qword_1001D9418;
      id v35 = a1;
      swift_bridgeObjectRetain();
      if (v42 != -1) {
        swift_once();
      }
      uint64_t v43 = type metadata accessor for Logger();
      sub_100003E78(v43, (uint64_t)qword_1001E0460);
      swift_bridgeObjectRetain();
      uint64_t v44 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v44, v45))
      {
        int v46 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)int v46 = 134217984;
        swift_bridgeObjectRelease();
        v51[0] = v18;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "BAA returned incorrect number of certificate references. Expected: 2, received: %ld", v46, 0xCu);
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v40 = 0xD00000000000002DLL;
      int v41 = "BAA returned incorrect number of certificates";
    }
    else
    {
      uint64_t v34 = qword_1001D9418;
      id v35 = a1;
      if (v34 != -1) {
        swift_once();
      }
      uint64_t v36 = type metadata accessor for Logger();
      sub_100003E78(v36, (uint64_t)qword_1001E0460);
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v37, v38))
      {
        long long v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "Failed to create certificate references", v39, 2u);
        swift_slowDealloc();
      }

      uint64_t v40 = 0xD000000000000027;
      int v41 = "BAA returned nil certificate references";
    }
    uint64_t v47 = sub_10002A180(10002, v40, (void *)((unint64_t)(v41 - 32) | 0x8000000000000000), 0);

    swift_beginAccess();
    *unint64_t v9 = v47;
LABEL_29:
    swift_errorRelease();
    OS_dispatch_semaphore.signal()();
    return spr_releaseCFObject();
  }
  if (qword_1001D9418 != -1) {
    swift_once();
  }
  uint64_t v29 = type metadata accessor for Logger();
  sub_100003E78(v29, (uint64_t)qword_1001E0460);
  long long v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    char v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to create key reference", v32, 2u);
    swift_slowDealloc();
  }

  uint64_t v33 = sub_10002A180(10001, 0xD00000000000001ELL, (void *)0x800000010019E690, 0);
  swift_beginAccess();
  *unint64_t v9 = v33;
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  return spr_releaseCFObject();
}

uint64_t sub_10016A41C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  if (a3) {
    uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v6(a2, v7, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10016A4D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 16) = a3;
  swift_errorRetain();
  return swift_errorRelease();
}

uint64_t sub_10016A530()
{
  if (*v0) {
    return 0x73656D695479656BLL;
  }
  else {
    return 1684632949;
  }
}

uint64_t sub_10016A56C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10016BCF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10016A594(uint64_t a1)
{
  unint64_t v2 = sub_10016C538();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016A5D0(uint64_t a1)
{
  unint64_t v2 = sub_10016C538();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016A60C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003EB0(&qword_1001E0598);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  id v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100006788(a1, a1[3]);
  sub_10016C538();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v13) = 0;
  type metadata accessor for UUID();
  sub_10016C62C(&qword_1001DD7E8, (void (*)(uint64_t))&type metadata accessor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v10 = *(void *)(v3 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp + 8);
    int v13 = *(_DWORD *)(v3 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp);
    uint64_t v14 = v10;
    v12[15] = 1;
    sub_10014DF78();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

void sub_10016A7EC()
{
  sub_100006628(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_uuid;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl);
}

uint64_t sub_10016A888()
{
  sub_100006628(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_uuid;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_10016A958()
{
  return type metadata accessor for BAASigningIdentity();
}

uint64_t type metadata accessor for BAASigningIdentity()
{
  uint64_t result = qword_1001E04B0;
  if (!qword_1001E04B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10016A9AC()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10016AA6C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = sub_10016BDF0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10016AA98(void *a1)
{
  return sub_10016A60C(a1);
}

BOOL sub_10016AABC(void **a1, void **a2)
{
  return sub_10016ABCC(*a1, *a2);
}

uint64_t sub_10016AAC8(void *a1)
{
  a1[1] = sub_10016C62C(&qword_1001DFEC0, (void (*)(uint64_t))type metadata accessor for BAASigningIdentity);
  a1[2] = sub_10016C62C(&qword_1001DFEA8, (void (*)(uint64_t))type metadata accessor for BAASigningIdentity);
  uint64_t result = sub_10016C62C(&qword_1001E0578, (void (*)(uint64_t))type metadata accessor for BAASigningIdentity);
  a1[3] = result;
  return result;
}

uint64_t sub_10016AB74()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10016ABAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10016A4D0(a1, a2, a3, v3);
}

uint64_t sub_10016ABB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10016ABC4()
{
  return swift_release();
}

BOOL sub_10016ABCC(void *a1, void *a2)
{
  type metadata accessor for SecKey(0);
  sub_10016C62C(&qword_1001E05A0, type metadata accessor for SecKey);
  if ((static _CFObject.== infix(_:_:)() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = a1[3];
  unint64_t v5 = a1[4];
  uint64_t v6 = a2[3];
  unint64_t v7 = a2[4];
  sub_1000065D0(v4, v5);
  sub_1000065D0(v6, v7);
  char v8 = sub_10014C798(v4, v5, v6, v7);
  sub_100006628(v6, v7);
  sub_100006628(v4, v5);
  if ((v8 & 1) == 0) {
    return 0;
  }
  uint64_t v9 = a1[5];
  uint64_t v10 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v11 = sub_10014AB7C(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v11 & 1) != 0
      && *(_DWORD *)((char *)a1 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp) == *(_DWORD *)((char *)a2 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp)
      && *(double *)((char *)a1 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp + 8) == *(double *)((char *)a2 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp + 8);
}

void *sub_10016AD38(void *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, double a8)
{
  *(void *)((char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl) = a1;
  unint64_t v16 = (char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_uuid;
  uint64_t v17 = type metadata accessor for UUID();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a2, v17);
  *(void *)((char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key) = a3;
  v8[3] = a4;
  v8[4] = a5;
  v8[5] = a6;
  uint64_t v19 = (double *)((char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp);
  *(_DWORD *)uint64_t v19 = a7;
  v19[1] = a8;
  swift_beginAccess();
  id v20 = a1;
  id v21 = a3;
  sub_1000065D0(a4, a5);
  unint64_t v22 = atomic_fetch_add_explicit(&qword_1001E11F0, 1uLL, memory_order_relaxed) + 1;
  swift_endAccess();
  v8[2] = v22;
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, v17);
  return v8;
}

NSObject *sub_10016AEA4(uint64_t a1, int a2, void **a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, double a8)
{
  v133 = a3;
  uint64_t v134 = a5;
  uint64_t v132 = a4;
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = &v113[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = type metadata accessor for DispatchTime();
  unint64_t v130 = *(void *)(v18 - 8);
  uint64_t v131 = v18;
  uint64_t v20 = __chkstk_darwin(v18, v19);
  v128 = &v113[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v20, v22);
  v129 = &v113[-v23];
  if (qword_1001D9318 != -1) {
    swift_once();
  }
  v135[0] = 0;
  unsigned int v24 = [(id)qword_1001E1150 canEvaluatePolicy:2 error:v135];
  BOOL v25 = v135[0];
  if (v24)
  {
    unint64_t v127 = a6;
    uint64_t v124 = v13;
    id v123 = v135[0];
    char v26 = DeviceIdentityUCRTAttestationSupported();
    uint64_t v115 = v17;
    if ((v26 & 1) == 0)
    {
      if (qword_1001D9418 != -1) {
        swift_once();
      }
      uint64_t v27 = type metadata accessor for Logger();
      sub_100003E78(v27, (uint64_t)qword_1001E0460);
      uint64_t v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v28, v29))
      {
        long long v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "UCRT not supported, switching to SCRT", v30, 2u);
        swift_slowDealloc();
      }
    }
    int v114 = a2;
    uint64_t v125 = v14;
    uint64_t v31 = a7 / 60;
    sub_100003EB0(&qword_1001DA140);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10018F340;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v33;
    uint64_t v126 = a1;
    uint64_t v34 = UUID.uuidString.getter();
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v34;
    *(void *)(inited + 56) = v35;
    *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 88) = v36;
    *(void *)(inited + 120) = &type metadata for String;
    *(void *)(inited + 96) = 0xD000000000000017;
    *(void *)(inited + 104) = 0x8000000100196850;
    *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 136) = v37;
    *(void *)(inited + 168) = &type metadata for Bool;
    *(unsigned char *)(inited + 144) = 0;
    *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 184) = v38;
    *(void *)(inited + 216) = &type metadata for Double;
    *(void *)(inited + 192) = 0x401C000000000000;
    *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 232) = v39;
    *(void *)(inited + 264) = &type metadata for Int;
    *(void *)(inited + 240) = v31;
    *(void *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 280) = v40;
    *(void *)(inited + 312) = &type metadata for Bool;
    *(unsigned char *)(inited + 288) = v26 ^ 1;
    *(void *)(inited + 320) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 328) = v41;
    *(void *)(inited + 360) = &type metadata for Data;
    uint64_t v42 = v134;
    unint64_t v43 = v127;
    *(void *)(inited + 336) = v134;
    *(void *)(inited + 344) = v43;
    *(void *)(inited + 368) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 376) = v44;
    type metadata accessor for SecAccessControl(0);
    *(void *)(inited + 408) = v45;
    int v46 = v133;
    *(void *)(inited + 384) = v133;
    *(void *)(inited + 416) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 424) = v47;
    *(void *)(inited + 456) = &type metadata for Int;
    *(void *)(inited + 432) = 0;
    *(void *)(inited + 464) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 472) = v48;
    *(void *)(inited + 504) = sub_100003EB0((uint64_t *)&unk_1001DA570);
    *(void *)(inited + 480) = v132;
    sub_1000065D0(v42, v43);
    long long v120 = v46;
    unint64_t v49 = sub_100004D6C(inited);
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 16) = 0;
    long long v119 = (v50 + 16);
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = 0;
    uint64_t v118 = v51 + 16;
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = 0;
    long long v117 = (void **)(v52 + 16);
    char v53 = (void **)swift_allocObject();
    v53[2] = 0;
    long long v116 = v53 + 2;
    dispatch_semaphore_t v54 = dispatch_semaphore_create(0);
    sub_10016997C(v49);
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v56 = (void *)swift_allocObject();
    v56[2] = v54;
    v56[3] = v50;
    v56[4] = v51;
    void v56[5] = v52;
    v56[6] = v53;
    v135[4] = sub_10016C61C;
    v135[5] = v56;
    v135[0] = _NSConcreteStackBlock;
    v135[1] = (id)1107296256;
    v135[2] = sub_10016A41C;
    v135[3] = &unk_1001CC6B0;
    uint64_t v57 = _Block_copy(v135);
    uint64_t v58 = v54;
    uint64_t v121 = v50;
    swift_retain();
    uint64_t v122 = v51;
    swift_retain();
    uint64_t v132 = v52;
    swift_retain();
    v133 = v53;
    swift_retain();
    swift_release();
    DeviceIdentityIssueClientCertificateWithCompletion();
    _Block_release(v57);

    uint64_t v59 = v128;
    static DispatchTime.now()();
    size_t v60 = v129;
    + infix(_:_:)();
    uint64_t v61 = v131;
    int v62 = *(void (**)(unsigned char *, uint64_t))(v130 + 8);
    v62(v59, v131);
    OS_dispatch_semaphore.wait(timeout:)();
    v62(v60, v61);
    if (static DispatchTimeoutResult.== infix(_:_:)())
    {
      uint64_t v63 = v58;
      if (qword_1001D9418 != -1) {
        swift_once();
      }
      uint64_t v64 = type metadata accessor for Logger();
      sub_100003E78(v64, (uint64_t)qword_1001E0460);
      uint64_t v65 = Logger.logObject.getter();
      os_log_type_t v66 = static os_log_type_t.error.getter();
      BOOL v67 = os_log_type_enabled(v65, v66);
      uint64_t v68 = v126;
      unint64_t v69 = v127;
      uint64_t v70 = v124;
      if (v67)
      {
        uint64_t v71 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v71 = 0;
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "Time out requesting BAA certificate.", v71, 2u);
        swift_slowDealloc();
      }

      BOOL v25 = sub_10002A180(10002, 0xD000000000000023, (void *)0x800000010019E660, 0);
      swift_willThrow();
      sub_100006628(v134, v69);

      (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v68, v70);
      goto LABEL_44;
    }
    BOOL v25 = v119;
    swift_beginAccess();
    if (v25->isa)
    {
      swift_errorRetain();
      swift_willThrow();
      sub_100006628(v134, v127);

      (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v126, v124);
LABEL_44:

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return v25;
    }
    uint64_t v74 = (void **)v118;
    swift_beginAccess();
    size_t v75 = *v74;
    uint64_t v76 = v126;
    uint64_t v77 = v124;
    if (!v75
      || (uint64_t v78 = v117, swift_beginAccess(), (v79 = *v78) == 0)
      || (unint64_t v80 = v116, swift_beginAccess(), (v81 = *v80) == 0))
    {
      if (qword_1001D9418 != -1) {
        swift_once();
      }
      uint64_t v94 = type metadata accessor for Logger();
      sub_100003E78(v94, (uint64_t)qword_1001E0460);
      BOOL v25 = Logger.logObject.getter();
      os_log_type_t v95 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v25, v95))
      {
        char v96 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v96 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, v95, "Unexpected nil value after receiving BAA certificate", v96, 2u);
        swift_slowDealloc();
      }

      sub_10002A180(10002, 0xD000000000000014, (void *)0x800000010019E640, 0);
      swift_willThrow();
      sub_100006628(v134, v127);

      (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v76, v77);
      goto LABEL_44;
    }
    v129 = v58;
    uint64_t v82 = v81;
    uint64_t v83 = v79;
    id v84 = v75;
    CFDataRef v85 = SecCertificateCopyData(v83);
    uint64_t v131 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v87 = v86;

    CFDataRef v88 = SecCertificateCopyData(v82);
    uint64_t v89 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v91 = v90;

    unint64_t v130 = v87;
    unint64_t v92 = v87 >> 62;
    uint64_t v93 = (uint64_t)v115;
    v128 = (unsigned char *)v89;
    switch(v92)
    {
      case 1uLL:
        uint64_t v97 = (int)v131;
        uint64_t v98 = v131 >> 32;
        goto LABEL_32;
      case 2uLL:
        uint64_t v97 = *(void *)(v131 + 16);
        uint64_t v98 = *(void *)(v131 + 24);
LABEL_32:
        if (v97 != v98) {
          goto LABEL_33;
        }
        goto LABEL_39;
      case 3uLL:
        goto LABEL_39;
      default:
        if ((v130 & 0xFF000000000000) == 0)
        {
LABEL_39:
          if (qword_1001D9418 != -1) {
            swift_once();
          }
          uint64_t v109 = type metadata accessor for Logger();
          sub_100003E78(v109, (uint64_t)qword_1001E0460);
          BOOL v25 = Logger.logObject.getter();
          os_log_type_t v110 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v25, v110))
          {
            uint64_t v111 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v111 = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, v110, "Unexpected empty data after copying BAA certificate data", v111, 2u);
            swift_slowDealloc();
          }

          sub_10002A180(10002, 0xD000000000000014, (void *)0x800000010019E640, 0);
          swift_willThrow();

          sub_100006628(v134, v127);
          sub_100006628((uint64_t)v128, v91);
          sub_100006628(v131, v130);

          (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v126, v77);
          goto LABEL_44;
        }
LABEL_33:
        switch(v91 >> 62)
        {
          case 1uLL:
            uint64_t v107 = (int)v89;
            uint64_t v108 = v89 >> 32;
            goto LABEL_38;
          case 2uLL:
            uint64_t v107 = *(void *)(v89 + 16);
            uint64_t v108 = *(void *)(v89 + 24);
LABEL_38:
            if (v107 == v108) {
              goto LABEL_39;
            }
            goto LABEL_35;
          case 3uLL:
            goto LABEL_39;
          default:
            if ((v91 & 0xFF000000000000) == 0) {
              goto LABEL_39;
            }
LABEL_35:
            (*(void (**)(unsigned char *, uint64_t, uint64_t))(v125 + 16))(v115, v126, v77);
            sub_100003EB0(&qword_1001E0058);
            uint64_t v99 = swift_allocObject();
            *(_OWORD *)(v99 + 16) = xmmword_100186100;
            *(void *)(v99 + 32) = v89;
            *(void *)(v99 + 40) = v91;
            type metadata accessor for BAASigningIdentity();
            uint64_t v118 = swift_allocObject();
            sub_1000065D0(v89, v91);
            long long v119 = v91;
            char v100 = v82;
            char v101 = v83;
            char v102 = v84;
            int v103 = v120;
            uint64_t v104 = v93;
            unint64_t v105 = v130;
            uint64_t v106 = v131;
            BOOL v25 = sub_10016AD38(v120, v104, v102, v131, v130, v99, v114, a8);
            sub_100006628(v106, v105);

            sub_100006628(v134, v127);
            sub_100006628((uint64_t)v128, (unint64_t)v119);

            (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v126, v77);
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            break;
        }
        break;
    }
  }
  else
  {
    id v72 = v135[0];
    swift_bridgeObjectRelease();
    id v73 = v72;
    sub_10002A180(10003, 0xD000000000000014, (void *)0x800000010019C4B0, (uint64_t)v25);

    swift_willThrow();
    sub_100006628(v134, a6);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  }
  return v25;
}

uint64_t sub_10016BCF4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1684632949 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656D695479656BLL && a2 == 0xEC000000706D6174)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

id sub_10016BDF0(void *a1)
{
  uint64_t v56 = type metadata accessor for DecodingError();
  uint64_t v54 = *(void *)(v56 - 8);
  uint64_t v3 = __chkstk_darwin(v56, v2);
  char v53 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v5);
  int64_t v55 = (char *)&v49 - v6;
  uint64_t v7 = sub_100003EB0((uint64_t *)&unk_1001DF8D0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v52 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v51 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10, v11);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v49 - v16;
  uint64_t v18 = sub_100003EB0(&qword_1001E0588);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  uint64_t v22 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1[3];
  uint64_t v57 = a1;
  sub_100006788(a1, v23);
  sub_10016C538();
  unsigned int v24 = v58;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v24)
  {
    uint64_t v48 = (uint64_t)v55;
    size_t v60 = v24;
    swift_errorRetain();
    sub_100003EB0((uint64_t *)&unk_1001DD380);
    uint64_t v43 = v56;
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      uint64_t v45 = v53;
      uint64_t v44 = v54;
      (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v53, v48, v43);
      uint64_t v48 = swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v46, v45, v43);
      sub_10002A180(10005, 0xD000000000000010, (void *)0x800000010019C490, v48);
      swift_errorRelease();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v43);
    }
    uint64_t v47 = (uint64_t)v57;
    swift_errorRelease();
    sub_100006520(v47);
    return (id)v48;
  }
  uint64_t v50 = v14;
  uint64_t v58 = v17;
  LOBYTE(v60) = 0;
  sub_10016C62C(&qword_1001DD7D8, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v25 = (uint64_t)v52;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v26 = v51;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v25, 1, v10) == 1)
  {
    UUID.init()();
    sub_10014754C(v25);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v58, v25, v10);
  }
  char v59 = 1;
  sub_10014DF24();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v27 = v58;
  if ((v62 & 1) == 0)
  {
    double v37 = v61;
    int v33 = (int)v60;
LABEL_21:
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v50, v27, v10);
    if (qword_1001D9428 != -1) {
      swift_once();
    }
    uint64_t v38 = qword_1001D9420;
    uint64_t v39 = (void **)(id)qword_1001E1240;
    if (v38 != -1) {
      swift_once();
    }
    uint64_t v40 = qword_1001E1238;
    swift_bridgeObjectRetain();
    uint64_t v41 = static Data.randomBytes(count:)(0x10uLL);
    uint64_t v48 = (uint64_t)sub_10016AEA4((uint64_t)v50, v33, v39, v40, v41, v42, 600000, v37);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v58, v10);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    sub_100006520((uint64_t)v57);
    return (id)v48;
  }
  uint64_t v52 = (char *)v18;
  if (qword_1001D9410 != -1) {
    swift_once();
  }
  uint64_t v28 = static GlobalState.shared;
  id result = [*(id *)(static GlobalState.shared + 72) lock];
  while (*(uint64_t *)(v28 + 96) > 0 || *(unsigned char *)(v28 + 80) == 1)
    id result = [*(id *)(v28 + 72) wait];
  uint64_t v30 = *(void *)(v28 + 88);
  BOOL v31 = __OFADD__(v30, 1);
  uint64_t v32 = v30 + 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v28 + 88) = v32;
    [*(id *)(v28 + 72) unlock];
    if (*(unsigned char *)(v28 + 56)) {
      int v33 = 0;
    }
    else {
      int v33 = *(_DWORD *)(v28 + 52);
    }
    id result = [*(id *)(v28 + 72) lock];
    uint64_t v34 = *(void *)(v28 + 88);
    BOOL v31 = __OFSUB__(v34, 1);
    uint64_t v35 = v34 - 1;
    if (!v31)
    {
      *(void *)(v28 + 88) = v35;
      if (!v35) {
        [*(id *)(v28 + 72) broadcast];
      }
      [*(id *)(v28 + 72) unlock];
      TMGetKernelMonotonicClock();
      double v37 = v36;
      uint64_t v26 = v51;
      uint64_t v18 = (uint64_t)v52;
      uint64_t v27 = v58;
      goto LABEL_21;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10016C538()
{
  unint64_t result = qword_1001E0590;
  if (!qword_1001E0590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0590);
  }
  return result;
}

uint64_t sub_10016C58C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10016C5C4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10016C61C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100169D44(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_10016C62C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BAASigningIdentity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    char *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10016C740);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BAASigningIdentity.CodingKeys()
{
  return &type metadata for BAASigningIdentity.CodingKeys;
}

unint64_t sub_10016C77C()
{
  unint64_t result = qword_1001E05A8;
  if (!qword_1001E05A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E05A8);
  }
  return result;
}

unint64_t sub_10016C7D4()
{
  unint64_t result = qword_1001E05B0;
  if (!qword_1001E05B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E05B0);
  }
  return result;
}

unint64_t sub_10016C82C()
{
  unint64_t result = qword_1001E05B8;
  if (!qword_1001E05B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E05B8);
  }
  return result;
}

uint64_t *PrimaryAccountWatcher.shared.unsafeMutableAddressor()
{
  if (qword_1001D9438 != -1) {
    swift_once();
  }
  return &static PrimaryAccountWatcher.shared;
}

uint64_t sub_10016C8D8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001E05C0);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001E05C0);
  if (qword_1001D9258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1028);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10016C9A0()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 accountPropertyForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_100008908((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v4;
    }
  }
  else
  {
    sub_100008970((uint64_t)v6);
    return 0;
  }
  return result;
}

id sub_10016CA8C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for PrimaryAccountWatcher()) init];
  static PrimaryAccountWatcher.shared = (uint64_t)result;
  return result;
}

id static PrimaryAccountWatcher.shared.getter()
{
  if (qword_1001D9438 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static PrimaryAccountWatcher.shared;

  return v0;
}

void sub_10016CB18()
{
  v0[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store] = 0;
  NSString v1 = &v0[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler];
  id v2 = (objc_class *)type metadata accessor for PrimaryAccountWatcher();
  *NSString v1 = 0;
  v1[1] = 0;
  v19.receiver = v0;
  v19.super_class = v2;
  id v3 = [super init];
  sub_100003EB0((uint64_t *)&unk_1001DA520);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100186100;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v5;
  id v6 = v3;
  sub_10016D944(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  id v7 = objc_allocWithZone((Class)ACMonitoredAccountStore);
  uint64_t v8 = (char *)v6;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [v7 initWithAccountTypes:isa delegate:v8];

  uint64_t v11 = OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store;
  uint64_t v12 = *(void **)&v8[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store];
  *(void *)&v8[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store] = v10;

  uint64_t v13 = *(void **)&v8[v11];
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v8;
    v18[4] = sub_10016DB20;
    v18[5] = v14;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 1107296256;
    v18[2] = sub_10016D254;
    v18[3] = &unk_1001CC790;
    uint64_t v15 = _Block_copy(v18);
    uint64_t v16 = v8;
    id v17 = v13;
    swift_release();
    [v17 registerWithCompletion:v15];

    _Block_release(v15);
  }
  else
  {
    __break(1u);
  }
}

void sub_10016CD3C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v5 = qword_1001D9430;
    swift_bridgeObjectRetain();
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100003E78(v6, (uint64_t)qword_1001E05C0);
    swift_bridgeObjectRetain_n();
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      sub_10016DB40();
      swift_bridgeObjectRetain();
      uint64_t v10 = Array.description.getter();
      unint64_t v12 = v11;
      swift_bridgeObjectRelease();
      sub_100005EB8(v10, v12, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Monitored accounts: %s)", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_13;
      }
    }
    else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_13:
      if ((a1 & 0xC000000000000001) != 0)
      {
        id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_16;
      }
      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v18 = *(id *)(a1 + 32);
LABEL_16:
        objc_super v19 = v18;
        swift_bridgeObjectRelease();
        char v20 = sub_10016C9A0();

LABEL_27:
        *(unsigned char *)(a3 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) = v20 & 1;
        return;
      }
      __break(1u);
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    char v20 = 0;
    goto LABEL_27;
  }
  if (a2)
  {
    swift_errorRetain();
    if (qword_1001D9430 == -1)
    {
LABEL_8:
      uint64_t v13 = type metadata accessor for Logger();
      sub_100003E78(v13, (uint64_t)qword_1001E05C0);
      swift_errorRetain();
      swift_errorRetain();
      oslog = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 136315138;
        swift_errorRetain();
        sub_100003EB0((uint64_t *)&unk_1001DD380);
        uint64_t v16 = String.init<A>(describing:)();
        sub_100005EB8(v16, v17, &v26);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Could not register store: %s", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        return;
      }
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
      goto LABEL_22;
    }
LABEL_30:
    swift_once();
    goto LABEL_8;
  }
  if (qword_1001D9430 != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  sub_100003E78(v21, (uint64_t)qword_1001E05C0);
  oslog = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v22, "No monitored accounts", v23, 2u);
    swift_slowDealloc();
  }
LABEL_22:
}

uint64_t sub_10016D254(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10016DB40();
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t PrimaryAccountWatcher.activate(changeHandler:)(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
  *id v3 = a1;
  v3[1] = a2;
  swift_retain();

  return sub_100057838(v4);
}

Swift::Void __swiftcall PrimaryAccountWatcher.accountWasAdded(_:)(ACAccount a1)
{
}

Swift::Void __swiftcall PrimaryAccountWatcher.accountWasRemoved(_:)(ACAccount a1)
{
  uint64_t v2 = v1;
  if (qword_1001D9430 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100003E78(v4, (uint64_t)qword_1001E05C0);
  uint64_t v5 = a1.super.isa;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v8 = 138412290;
    uint64_t v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "accountWasRemoved(%@)", v8, 0xCu);
    sub_100003EB0((uint64_t *)&unk_1001DA540);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) == 1)
  {
    *(unsigned char *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) = 0;
    unint64_t v11 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
    if (v11)
    {
      uint64_t v12 = swift_retain();
      v11(v12);
      sub_100057838((uint64_t)v11);
    }
  }
}

Swift::Void __swiftcall PrimaryAccountWatcher.accountWasModified(_:)(ACAccount a1)
{
}

uint64_t sub_10016D634(void *a1, char *a2)
{
  uint64_t v4 = v2;
  if (qword_1001D9430 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100003E78(v6, (uint64_t)qword_1001E05C0);
  id v7 = a1;
  os_log_type_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    format = a2;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    unint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v11 = v7;

    _os_log_impl((void *)&_mh_execute_header, v8, v9, format, v10, 0xCu);
    sub_100003EB0((uint64_t *)&unk_1001DA540);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t result = sub_10016C9A0();
  if ((result & 1) != *(unsigned char *)(v4 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount))
  {
    *(unsigned char *)(v4 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) = result & 1;
    os_log_type_t v14 = *(void (**)(uint64_t))(v4 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
    if (v14)
    {
      uint64_t v15 = swift_retain();
      v14(v15);
      return sub_100057838((uint64_t)v14);
    }
  }
  return result;
}

id PrimaryAccountWatcher.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PrimaryAccountWatcher();
  return [super dealloc];
}

uint64_t type metadata accessor for PrimaryAccountWatcher()
{
  return self;
}

Swift::Int sub_10016D944(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100003EB0(&qword_1001E0698);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          objc_super v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_10016DAE8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10016DB20(unint64_t a1, uint64_t a2)
{
  sub_10016CD3C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10016DB28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10016DB38()
{
  return swift_release();
}

unint64_t sub_10016DB40()
{
  unint64_t result = qword_1001E0688;
  if (!qword_1001E0688)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1001E0688);
  }
  return result;
}

uint64_t sub_10016DB80()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E14(v0, qword_1001E06A0);
  uint64_t v1 = sub_100003E78(v0, (uint64_t)qword_1001E06A0);
  if (qword_1001D9258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003E78(v0, (uint64_t)qword_1001E1028);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10016DC48()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + 32) = 0;
  id v2 = [self sharedHardwareManager];
  unsigned int v3 = [v2 getHwSupport];

  if (v3 != 2)
  {
    if (qword_1001D9440 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100003E78(v15, (uint64_t)qword_1001E06A0);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "hw not supported at the moment. hw might recover later.", v18, 2u);
      swift_slowDealloc();
    }

    sub_10016E410();
    swift_allocError();
    *objc_super v19 = 0;
    swift_willThrow();
    goto LABEL_29;
  }
  id v35 = 0;
  id v4 = [self embeddedSecureElementWithError:&v35];
  id v5 = v35;
  if (!v4)
  {
    id v20 = v35;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_1001D9440 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100003E78(v21, (uint64_t)qword_1001E06A0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 138412290;
      swift_errorRetain();
      uint64_t v26 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v35 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v25 = v26;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Could not get Secure Element, error from embeddedSecureElementWithError(): %@", v24, 0xCu);
      sub_100003EB0((uint64_t *)&unk_1001DA540);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_10016E410();
    swift_allocError();
    unsigned char *v28 = 1;
    swift_willThrow();
    swift_errorRelease();
    goto LABEL_29;
  }
  uint64_t v6 = v4;
  *(void *)(v1 + 16) = v4;
  id v7 = v5;
  id v8 = [v6 serialNumber];
  if (!v8) {
    goto LABEL_27;
  }

  id v9 = [*(id *)(v1 + 16) info];
  if (!v9)
  {
    if (qword_1001D9440 != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    sub_100003E78(v29, (uint64_t)qword_1001E06A0);
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Could not get hardware Secure Element info.", v32, 2u);
      swift_slowDealloc();
    }

LABEL_27:
    sub_10016E410();
    swift_allocError();
    *int v33 = 2;
    swift_willThrow();
    goto LABEL_28;
  }
  uint64_t v10 = v9;
  id v11 = [v9 platformIdentifier];
  if (!v11
    || (v11, (id v12 = [v10 ecdsaCertificate]) == 0)
    || (v12,
        id v13 = [v10 sequenceCounter],
        v13,
        !v13)
    || (id v14 = [v10 expectedSequenceCounter], v14, !v14))
  {
    sub_10016E410();
    swift_allocError();
    unsigned char *v27 = 2;
    swift_willThrow();

LABEL_28:
LABEL_29:
    type metadata accessor for SecureElement();
    swift_deallocPartialClassInstance();
    return v1;
  }
  *(void *)(v1 + 24) = v10;
  return v1;
}

id sub_10016E1FC()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id result = [v1 sequenceCounter];
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  unsigned int v3 = result;
  unsigned int v4 = [result unsignedShortValue];

  id result = [v1 expectedSequenceCounter];
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  id v5 = result;
  unsigned int v6 = [result unsignedShortValue];

  if (qword_1001D9440 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100003E78(v7, (uint64_t)qword_1001E06A0);
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 33554944;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v10 + 6) = 512;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Current sequence counter: %hu, expected: %hu", (uint8_t *)v10, 0xAu);
    swift_slowDealloc();
  }

  return (id)(v4 >= v6);
}

uint64_t sub_10016E3A0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SecureElement()
{
  return self;
}

uint64_t sub_10016E404(uint64_t result)
{
  *(unsigned char *)(*(void *)v1 + 32) = result;
  return result;
}

unint64_t sub_10016E410()
{
  unint64_t result = qword_1001E07E0;
  if (!qword_1001E07E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E07E0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SecureElementError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    char *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10016E530);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SecureElementError()
{
  return &type metadata for SecureElementError;
}

unint64_t sub_10016E56C()
{
  unint64_t result = qword_1001E07E8;
  if (!qword_1001E07E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E07E8);
  }
  return result;
}

uint64_t BitString.data.getter(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t BitString.unusedBits.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t BitString.derRepresentation.getter(uint64_t a1, unint64_t a2, char a3)
{
  sub_100003EB0(&qword_1001D8778);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100186100;
  *(unsigned char *)(v6 + 32) = a3;
  uint64_t v7 = sub_10012CB58(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_1000065D0(a1, a2);
  sub_1000065D0(v7, v9);
  sub_100147328(a1, a2);
  sub_100006628(a1, a2);
  sub_100006628(v7, v9);
  return v7;
}

uint64_t sub_10016E6C4(uint64_t a1)
{
  void (*v24)(char *__return_ptr, char *);
  __int16 v25;
  uint64_t i;
  char v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  long long v37[2];
  uint64_t v38;
  long long v39;
  long long v40;
  long long v41;
  void v42[4];

  uint64_t v2 = sub_100003EB0(&qword_1001E08B8);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003EB0(&qword_1001E08C0);
  uint64_t v8 = __chkstk_darwin(v6, v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  id v13 = (char *)&v29 - v12;
  uint64_t v14 = *(void *)a1;
  unint64_t v15 = *(void *)(a1 + 8);
  uint64_t v16 = *(void *)(a1 + 24);
  int v33 = *(void *)(a1 + 16);
  LODWORD(v34) = *(unsigned __int8 *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  long long v18 = *(_OWORD *)(a1 + 16);
  uint64_t v39 = *(_OWORD *)a1;
  uint64_t v40 = v18;
  uint64_t v41 = *(_OWORD *)(a1 + 32);
  sub_100170E74(a1);
  sub_100003EB0(&qword_1001E08C8);
  sub_100003EB0(&qword_1001DEBF0);
  if (swift_dynamicCast())
  {
    sub_10001F1F0(v37, (uint64_t)v42);
    sub_100006788(v42, v42[3]);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    sub_100006628(v14, v15);
    swift_release();
    uint64_t v39 = v37[0];
    sub_100006520((uint64_t)v42);
    return v39;
  }
  uint64_t v38 = 0;
  memset(v37, 0, sizeof(v37));
  sub_10005F4F8((uint64_t)v37, &qword_1001DEBF8);
  os_log_type_t v31 = &v29;
  uint64_t v39 = xmmword_100189A30;
  uint64_t v32 = v17;
  switch(v15 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_1000065D0(v14, v15);
      break;
    default:
      break;
  }
  uint64_t v19 = *(int *)(v2 + 48);
  sub_1000065D0(v14, v15);
  swift_retain();
  sub_1000065D0(v14, v15);
  swift_retain();
  Data.Iterator.init(_:at:)();
  sub_100006628(v14, v15);
  uint64_t v30 = v14;
  sub_100006628(v14, v15);
  swift_release();
  id v20 = &v10[*(int *)(sub_100003EB0(&qword_1001E08D0) + 44)];
  *(void *)id v20 = v33;
  *((void *)v20 + 1) = v16;
  uint64_t v21 = sub_100003EB0(&qword_1001E08D8);
  v10[*(int *)(v21 + 36)] = v34;
  *(void *)&v10[*(int *)(v6 + 36)] = v32;
  sub_100029CEC((uint64_t)v10, (uint64_t)v5, &qword_1001E08C0);
  *(void *)&v5[v19] = 0;
  uint64_t v22 = *(void *)&v5[*(int *)(v2 + 48)];
  sub_100029CEC((uint64_t)v5, (uint64_t)v13, &qword_1001E08C0);
  if (v22)
  {
    if (v22 <= 0)
    {
      Data._Representation.replaceSubrange(_:with:count:)();
      goto LABEL_21;
    }
LABEL_24:
    __break(1u);
  }
  memset(v42, 0, 15);
  uint64_t v23 = *(void *)&v13[*(int *)(v6 + 36)];
  if (!v23) {
    goto LABEL_21;
  }
  uint64_t v32 = *(int *)(v6 + 36);
  int v33 = v15;
  uint64_t v34 = v16;
  uint64_t v24 = *(void (**)(char *__return_ptr, char *))&v13[*(int *)(sub_100003EB0(&qword_1001E08D0) + 44)];
  type metadata accessor for Data.Iterator();
  sub_100170E2C((unint64_t *)&qword_1001DDF10, (void (*)(uint64_t))&type metadata accessor for Data.Iterator);
  LOBYTE(v25) = 0;
  for (uint64_t i = v23 - 1; ; --i)
  {
    dispatch thunk of IteratorProtocol.next()();
    if (BYTE1(v37[0]))
    {
      uint64_t v27 = v13[*(int *)(sub_100003EB0(&qword_1001E08D8) + 36)];
    }
    else
    {
      double v36 = v37[0];
      v24(&v35, &v36);
      uint64_t v27 = v35;
    }
    *((unsigned char *)v42 + v25) = v27;
    uint64_t v25 = v25 + 1;
    if ((v25 & 0x100) != 0)
    {
      __break(1u);
      goto LABEL_24;
    }
    BYTE6(v42[1]) = v25;
    if (v25 != 14) {
      break;
    }
    *(void *)&v37[0] = v42[0];
    DWORD2(v37[0]) = v42[1];
    WORD6(v37[0]) = WORD2(v42[1]);
    Data._Representation.append(contentsOf:)();
    LOBYTE(v25) = 0;
    BYTE6(v42[1]) = 0;
    if (!i)
    {
      *(void *)&v13[v32] = 0;
      goto LABEL_20;
    }
LABEL_11:
    ;
  }
  if (i) {
    goto LABEL_11;
  }
  *(void *)&v13[v32] = 0;
  *(void *)&v37[0] = v42[0];
  DWORD2(v37[0]) = v42[1];
  WORD6(v37[0]) = WORD2(v42[1]);
  Data._Representation.append(contentsOf:)();
LABEL_20:
  unint64_t v15 = v33;
LABEL_21:
  sub_10005F4F8((uint64_t)v13, &qword_1001E08C0);
  sub_100006628(v30, v15);
  swift_release();
  return v39;
}

uint64_t sub_10016EC6C(uint64_t *a1)
{
  void (*v32)(char *__return_ptr, long long *);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  unsigned char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char v44;
  long long v45[2];
  uint64_t v46;
  long long v47;
  long long v48;
  long long v49;
  void v50[4];

  uint64_t v2 = sub_100003EB0(&qword_1001E0898);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003EB0(&qword_1001E08A0);
  uint64_t v8 = __chkstk_darwin(v6, v7);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  id v13 = (char *)&v34 - v12;
  uint64_t v15 = *a1;
  unint64_t v14 = a1[1];
  uint64_t v16 = a1[3];
  unint64_t v42 = a1[2];
  uint64_t v17 = a1[5];
  uint64_t v43 = (char *)a1[4];
  long long v18 = *((_OWORD *)a1 + 1);
  uint64_t v47 = *(_OWORD *)a1;
  uint64_t v48 = v18;
  uint64_t v49 = *((_OWORD *)a1 + 2);
  sub_100170DDC((uint64_t)a1);
  sub_100003EB0(&qword_1001E08A8);
  sub_100003EB0(&qword_1001DEBF0);
  if (swift_dynamicCast())
  {
    sub_10001F1F0(v45, (uint64_t)v50);
    sub_100006788(v50, v50[3]);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    sub_100006628(v15, v14);
    swift_release();
    swift_release();
    uint64_t v47 = v45[0];
    sub_100006520((uint64_t)v50);
  }
  else
  {
    uint64_t v46 = 0;
    memset(v45, 0, sizeof(v45));
    sub_10005F4F8((uint64_t)v45, &qword_1001DEBF8);
    double v37 = &v34;
    uint64_t v47 = xmmword_100189A30;
    uint64_t v38 = v6;
    uint64_t v39 = v13;
    uint64_t v41 = v17;
    uint64_t v40 = v16;
    switch(v14 >> 62)
    {
      case 1uLL:
      case 2uLL:
        sub_1000065D0(v15, v14);
        break;
      default:
        break;
    }
    double v36 = *(int *)(v2 + 48);
    uint64_t v19 = sub_100003EB0(&qword_1001E08B0);
    sub_1000065D0(v15, v14);
    uint64_t v20 = v40;
    swift_retain();
    unint64_t v21 = v14;
    uint64_t v22 = v41;
    swift_retain();
    Data.Iterator.init(_:at:)();
    id v35 = v15;
    unint64_t v23 = v21;
    sub_100006628(v15, v21);
    *uint64_t v10 = 0;
    uint64_t v24 = (uint64_t *)&v10[*(int *)(v19 + 40)];
    *uint64_t v24 = v42;
    v24[1] = v20;
    uint64_t v25 = v38;
    uint64_t v26 = &v10[*(int *)(v38 + 44)];
    *uint64_t v26 = v43;
    v26[1] = v22;
    sub_100029CEC((uint64_t)v10, (uint64_t)v5, &qword_1001E08A0);
    *(void *)&v5[v36] = 0;
    uint64_t v27 = *(void *)&v5[*(int *)(v2 + 48)];
    uint64_t v28 = v39;
    sub_100029CEC((uint64_t)v5, (uint64_t)v39, &qword_1001E08A0);
    if (v27)
    {
      if (v27 > 0) {
        goto LABEL_23;
      }
      Data._Representation.replaceSubrange(_:with:count:)();
    }
    else
    {
      memset(v50, 0, 15);
      if ((*v28 & 1) == 0)
      {
        unint64_t v42 = v23;
        uint64_t v29 = sub_100003EB0(&qword_1001E08B0);
        type metadata accessor for Data.Iterator();
        sub_100170E2C((unint64_t *)&qword_1001DDF10, (void (*)(uint64_t))&type metadata accessor for Data.Iterator);
        dispatch thunk of IteratorProtocol.next()();
        if (BYTE1(v45[0]))
        {
          LOBYTE(v30) = 0;
        }
        else
        {
          LOBYTE(v30) = 0;
          uint64_t v43 = (char *)v45 + 14;
          while (1)
          {
            char v31 = v45[0];
            uint64_t v44 = v45[0];
            if (((*(uint64_t (**)(char *))&v28[*(int *)(v29 + 40)])(&v44) & 1) == 0) {
              break;
            }
            uint64_t v32 = *(void (**)(char *__return_ptr, long long *))&v28[*(int *)(v25 + 44)];
            LOBYTE(v45[0]) = v31;
            v32(&v44, v45);
            *((unsigned char *)v50 + v30) = v44;
            unsigned int v30 = v30 + 1;
            if ((v30 >> 8))
            {
              __break(1u);
LABEL_23:
              __break(1u);
            }
            BYTE6(v50[1]) = v30;
            if (v30 == 14)
            {
              *(void *)&v45[0] = v50[0];
              DWORD2(v45[0]) = v50[1];
              WORD6(v45[0]) = WORD2(v50[1]);
              Data._Representation.append(contentsOf:)();
              LOBYTE(v30) = 0;
              BYTE6(v50[1]) = 0;
            }
            dispatch thunk of IteratorProtocol.next()();
            if (BYTE1(v45[0])) {
              goto LABEL_18;
            }
          }
          unsigned char *v28 = 1;
        }
LABEL_18:
        unint64_t v23 = v42;
        if ((_BYTE)v30)
        {
          *(void *)&v45[0] = v50[0];
          DWORD2(v45[0]) = v50[1];
          WORD6(v45[0]) = WORD2(v50[1]);
          Data._Representation.append(contentsOf:)();
        }
      }
    }
    sub_10005F4F8((uint64_t)v28, &qword_1001E08A0);
    sub_100006628(v35, v23);
    swift_release();
    swift_release();
  }
  return v47;
}

uint64_t sub_10016F268(uint64_t a1)
{
  *(void *)&long long v17 = a1;
  swift_bridgeObjectRetain();
  sub_100003EB0(&qword_1001E0890);
  sub_100003EB0(&qword_1001DEBF0);
  if (!swift_dynamicCast())
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
    sub_10005F4F8((uint64_t)v18, &qword_1001DEBF8);
    *(void *)&v18[0] = sub_10012CAB8(*(void *)(a1 + 16));
    *((void *)&v18[0] + 1) = v1;
    __chkstk_darwin(*(void *)&v18[0], v1);
    uint64_t v2 = sub_10016FCE4((void *(*)(uint64_t *__return_ptr, char *, char *))sub_100170D08);
    uint64_t v5 = *((void *)&v18[0] + 1) >> 62;
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    switch(*((void *)&v18[0] + 1) >> 62)
    {
      case 1:
        LODWORD(v8) = DWORD1(v18[0]) - LODWORD(v18[0]);
        if (__OFSUB__(DWORD1(v18[0]), v18[0])) {
          goto LABEL_37;
        }
        uint64_t v8 = (int)v8;
LABEL_8:
        if (v4 == v8)
        {
LABEL_14:
          memset(v20, 0, 15);
          if (!v3)
          {
LABEL_29:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return *(void *)&v18[0];
          }
          if (!__OFSUB__(v3, 1))
          {
            if (v3 - 1 < 0)
            {
LABEL_31:
              __break(1u);
            }
            else
            {
              LOBYTE(v13) = 0;
              while (1)
              {
                uint64_t v14 = v7 - 1;
                if ((unint64_t)(v7 - 1) >= *((void *)v6 + 2)) {
                  break;
                }
                *((unsigned char *)v20 + v13) = v6[v7 + 31];
                __int16 v13 = v13 + 1;
                if ((v13 & 0x100) != 0) {
                  goto LABEL_33;
                }
                if (v13 == 14)
                {
                  Data._Representation.append(contentsOf:)();
                  if (v7 == 1) {
                    goto LABEL_29;
                  }
                  LOBYTE(v13) = 0;
                }
                else if (v7 == 1)
                {
                  goto LABEL_34;
                }
                --v7;
                if (v14 < 1) {
                  goto LABEL_31;
                }
              }
            }
            __break(1u);
LABEL_33:
            __break(1u);
LABEL_34:
            Data._Representation.append(contentsOf:)();
            goto LABEL_29;
          }
        }
        else
        {
          if (v5)
          {
            if (v5 == 1) {
              uint64_t v12 = *(uint64_t *)&v18[0] >> 32;
            }
            else {
              uint64_t v12 = *(void *)(*(void *)&v18[0] + 24);
            }
          }
          else
          {
            uint64_t v12 = BYTE14(v18[0]);
          }
LABEL_27:
          if (v12 >= v4)
          {
            Data._Representation.replaceSubrange(_:with:count:)();
            goto LABEL_29;
          }
          __break(1u);
        }
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      case 2:
        uint64_t v10 = *(void *)(*(void *)&v18[0] + 16);
        uint64_t v9 = *(void *)(*(void *)&v18[0] + 24);
        BOOL v11 = __OFSUB__(v9, v10);
        uint64_t v8 = v9 - v10;
        if (!v11) {
          goto LABEL_8;
        }
        goto LABEL_38;
      case 3:
        if (!v4) {
          goto LABEL_14;
        }
        uint64_t v12 = 0;
        goto LABEL_27;
      default:
        uint64_t v8 = BYTE14(v18[0]);
        goto LABEL_8;
    }
  }
  sub_10001F1F0(v18, (uint64_t)v20);
  sub_100006788(v20, v20[3]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  swift_bridgeObjectRelease();
  v18[0] = v17;
  sub_100006520((uint64_t)v20);
  return *(void *)&v18[0];
}

BOOL sub_10016F5C0(uint64_t a1, uint64_t a2)
{
  return _s7SPRBase9BitStringV23__derived_struct_equalsySbAC_ACtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

unint64_t sub_10016F5DC(uint64_t a1)
{
  uint64_t v2 = sub_100003EB0(&qword_1001E0880);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003EB0(&qword_1001E0888);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1001709B0(v12, (uint64_t)v5);
    unint64_t result = sub_1001701C8((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for CodingUserInfoKey();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_100006510(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    _OWORD v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

uint64_t default argument 0 of IteratorProtocol<>.nextBitString(tag:)()
{
  return 3;
}

uint64_t default argument 0 of IteratorProtocol<>.nextOctetString(tag:)()
{
  return 4;
}

uint64_t default argument 0 of IteratorProtocol<>.nextOID(tag:)()
{
  return 6;
}

uint64_t static TLVTag.asn1UTF8String.getter()
{
  return 12;
}

uint64_t default argument 0 of IteratorProtocol<>.nextNull(tag:)()
{
  return 5;
}

uint64_t default argument 1 of static JSONEncoder.encodeClean<A>(_:outputFormatting:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

unint64_t default argument 2 of static JSONDecoder.decodeClean<A>(_:from:userInfo:)()
{
  return sub_10016F5DC((uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_10016F8E0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  sub_100003EB0(&qword_1001E0890);
  sub_100003EB0(&qword_1001DEBF0);
  if (swift_dynamicCast())
  {
    sub_10001F1F0(v28, (uint64_t)v30);
    uint64_t v2 = sub_100006788(v30, v30[3]);
    __chkstk_darwin(v2, v3);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    return sub_100006520((uint64_t)v30);
  }
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  sub_10005F4F8((uint64_t)v28, &qword_1001DEBF8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *v1;
  unint64_t v7 = v1[1];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  switch(v7 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v6), v6)) {
        goto LABEL_47;
      }
      uint64_t v9 = HIDWORD(v6) - (int)v6;
      uint64_t v8 = v6 >> 32;
LABEL_8:
      if (__OFADD__(v8, v5))
      {
        __break(1u);
        goto LABEL_41;
      }
      if (v8 + v5 < v8)
      {
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      if (v8 < 0)
      {
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      uint64_t v12 = Data._Representation.resetBytes(in:)();
      __chkstk_darwin(v12, v13);
      uint64_t v14 = (uint64_t)sub_10016FCE4((void *(*)(uint64_t *__return_ptr, char *, char *))sub_100170A18);
      uint64_t v18 = v14;
      if (v16 != v5)
      {
        uint64_t v17 = *v1;
        unint64_t v22 = v1[1];
        uint64_t v23 = 0;
        switch(v22 >> 62)
        {
          case 1uLL:
            uint64_t v23 = (int)v17;
            break;
          case 2uLL:
            uint64_t v23 = *(void *)(v17 + 16);
            break;
          default:
            break;
        }
        BOOL v24 = __OFADD__(v23, v9);
        uint64_t v25 = v23 + v9;
        if (!v24)
        {
          uint64_t v14 = v25 + v16;
          if (!__OFADD__(v25, v16))
          {
            uint64_t v26 = 0;
            switch(v22 >> 62)
            {
              case 1uLL:
                goto LABEL_32;
              case 2uLL:
                uint64_t v26 = *(void *)(v17 + 24);
                break;
              case 3uLL:
                goto LABEL_34;
              default:
                uint64_t v26 = BYTE6(v22);
                break;
            }
            goto LABEL_34;
          }
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
        goto LABEL_43;
      }
      uint64_t v19 = v15;
      memset(v30, 0, 15);
      if (v15)
      {
        if (!__OFSUB__(v15, 1))
        {
          if (((v15 - 1) & 0x8000000000000000) == 0)
          {
            LOBYTE(v20) = 0;
            while (1)
            {
              uint64_t v21 = v19 - 1;
              uint64_t v17 = *(void *)(v18 + 16);
              if (v19 - 1 >= (unint64_t)v17) {
                goto LABEL_31;
              }
              *((unsigned char *)v30 + v20) = *(unsigned char *)(v18 + v19 + 31);
              __int16 v20 = v20 + 1;
              if ((v20 & 0x100) != 0) {
                break;
              }
              uint64_t v17 = v20;
              if (v20 == 14)
              {
                *(void *)&v28[0] = v30[0];
                DWORD2(v28[0]) = v30[1];
                WORD6(v28[0]) = WORD2(v30[1]);
                uint64_t v14 = Data._Representation.append(contentsOf:)();
                if (v19 == 1) {
                  return swift_bridgeObjectRelease();
                }
                LOBYTE(v20) = 0;
              }
              else if (v19 == 1)
              {
                goto LABEL_39;
              }
              --v19;
              if (v21 < 1) {
                goto LABEL_30;
              }
            }
            __break(1u);
LABEL_39:
            *(void *)&v28[0] = v30[0];
            DWORD2(v28[0]) = v30[1];
            WORD6(v28[0]) = WORD2(v30[1]);
            Data._Representation.append(contentsOf:)();
            return swift_bridgeObjectRelease();
          }
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          uint64_t v26 = v17 >> 32;
LABEL_34:
          if (v26 >= v14)
          {
            Data._Representation.replaceSubrange(_:with:count:)();
            return swift_bridgeObjectRelease();
          }
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
        }
        goto LABEL_44;
      }
      return swift_bridgeObjectRelease();
    case 2uLL:
      uint64_t v11 = v6 + 16;
      uint64_t v10 = *(void *)(v6 + 16);
      uint64_t v8 = *(void *)(v11 + 8);
      uint64_t v9 = v8 - v10;
      if (!__OFSUB__(v8, v10)) {
        goto LABEL_8;
      }
      goto LABEL_48;
    case 3uLL:
      goto LABEL_8;
    default:
      uint64_t v8 = BYTE6(v7);
      uint64_t v9 = BYTE6(v7);
      goto LABEL_8;
  }
}

char *sub_10016FCE4(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_100189A30;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      unint64_t result = sub_100170054((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      unint64_t result = sub_100170054(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

void *sub_10016FFE4(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_100170054(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  unint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

unint64_t sub_100170108(unsigned __int8 a1)
{
  uint64_t v2 = static Hasher._hash(seed:bytes:count:)();

  return sub_10017022C(a1, v2);
}

unint64_t sub_100170150(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  Character.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000C5F0(a1, a2, v4);
}

unint64_t sub_1001701C8(uint64_t a1)
{
  type metadata accessor for CodingUserInfoKey();
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_1001702CC(a1, v2);
}

unint64_t sub_10017022C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1001702CC(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  __chkstk_darwin();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_100170464(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 16);
  if (!a2)
  {
    unint64_t v5 = *(void *)(a4 + 16);
    uint64_t v4 = 0;
LABEL_30:
    char *result = a4;
    result[1] = v5;
    return (void *)v4;
  }
  if (!a3)
  {
    unint64_t v5 = *(void *)(a4 + 16);
LABEL_29:
    uint64_t v4 = a3;
    goto LABEL_30;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (!v4)
    {
LABEL_31:
      unint64_t v5 = 0;
      goto LABEL_30;
    }
    unint64_t v5 = v4 - 1;
    *a2 = *(unsigned char *)(a4 + v4 - 1 + 32);
    unint64_t v6 = a3 - 1;
    if (a3 != 1)
    {
      unint64_t v7 = a3 - 2;
      if (a3 - 2 >= v5) {
        unint64_t v8 = v4 - 1;
      }
      else {
        unint64_t v8 = a3 - 2;
      }
      if (v8 >= v6) {
        unint64_t v8 = a3 - 1;
      }
      unint64_t v9 = v8 + 1;
      if (v9 <= 0x10) {
        goto LABEL_18;
      }
      uint64_t v10 = (int8x16_t *)(a2 + 1);
      if (v7 >= v5) {
        unint64_t v7 = v4 - 1;
      }
      if (v7 < v6) {
        unint64_t v6 = v7;
      }
      if ((unint64_t)v10 >= v4 + a4 + 31 || v4 - v6 + a4 + 30 >= (unint64_t)&a2[v6 + 2])
      {
        uint64_t v12 = v9 & 0xF;
        if ((v9 & 0xF) == 0) {
          uint64_t v12 = 16;
        }
        unint64_t v13 = v9 - v12;
        uint64_t v11 = v13 + 1;
        v5 -= v13;
        a2 += v13;
        uint64_t v14 = (int8x16_t *)(v4 + a4 + 15);
        do
        {
          int8x16_t v15 = *v14--;
          int8x16_t v16 = vrev64q_s8(v15);
          *v10++ = vextq_s8(v16, v16, 8uLL);
          v13 -= 16;
        }
        while (v13);
      }
      else
      {
LABEL_18:
        uint64_t v11 = 1;
      }
      char v17 = a2 + 1;
      unint64_t v18 = v5;
      while (a3 != v11)
      {
        if (!v18) {
          goto LABEL_31;
        }
        ++v11;
        unint64_t v5 = v18 - 1;
        *v17++ = *(unsigned char *)(a4 + 31 + v18--);
        if (a3 == v11) {
          goto LABEL_29;
        }
      }
      __break(1u);
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t _s7SPRBase9BitStringV17derRepresentationACSg10Foundation4DataV_tcfC_0(uint64_t a1, unint64_t a2)
{
  sub_1000065D0(a1, a2);
  __int16 v4 = sub_1000D8294(a1, a2);
  sub_100006628(a1, a2);
  if ((v4 & 0x100) != 0)
  {
    uint64_t result = a1;
    unint64_t v6 = a2;
  }
  else
  {
    sub_10017BA84(1, a1, a2, &v10);
    uint64_t result = v10;
    unint64_t v6 = v11;
    if (v4 <= 7u)
    {
      switch(v11 >> 62)
      {
        case 1uLL:
          uint64_t v7 = (int)v10;
          uint64_t v8 = v10 >> 32;
          goto LABEL_12;
        case 2uLL:
          uint64_t v7 = *(void *)(v10 + 16);
          uint64_t v8 = *(void *)(v10 + 24);
LABEL_12:
          if (v7 == v8 && v4 != 0) {
            break;
          }
          return result;
        case 3uLL:
          if ((_BYTE)v4) {
            break;
          }
          return result;
        default:
          if ((v11 & 0xFF000000000000) == 0 && (_BYTE)v4) {
            break;
          }
          return result;
      }
    }
  }
  sub_100006628(result, v6);
  return 0;
}

BOOL _s7SPRBase9BitStringV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, unint64_t a2, char a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v12 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x1001707F4);
      }
      uint64_t v12 = (int)v12;
LABEL_6:
      switch(a5 >> 62)
      {
        case 1uLL:
          LODWORD(v16) = HIDWORD(a4) - a4;
          if (__OFSUB__(HIDWORD(a4), a4)) {
            goto LABEL_19;
          }
          uint64_t v16 = (int)v16;
LABEL_11:
          if (v12 == v16 && (v12 < 1 || (sub_1000065D0(a4, a5), (sub_1001792FC(a1, a2, a4, a5) & 1) != 0))) {
            return a3 == a6;
          }
          else {
            return 0;
          }
        case 2uLL:
          uint64_t v18 = *(void *)(a4 + 16);
          uint64_t v17 = *(void *)(a4 + 24);
          BOOL v15 = __OFSUB__(v17, v18);
          uint64_t v16 = v17 - v18;
          if (!v15) {
            goto LABEL_11;
          }
          goto LABEL_20;
        case 3uLL:
          if (v12) {
            return 0;
          }
          return a3 == a6;
        default:
          uint64_t v16 = BYTE6(a5);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_100170818(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_1000065D0(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_1000065D0(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  sub_100006628(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_100006628(v4, v5);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitString(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for BitString(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitString()
{
  return &type metadata for BitString;
}

uint64_t sub_1001709B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003EB0(&qword_1001E0880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100170A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_100170C7C(a1, a2, *(void *)(v3 + 16), **(void **)(v3 + 32));
  if (!v4)
  {
    *a3 = result;
    a3[1] = v7;
    a3[2] = v8;
  }
  return result;
}

uint64_t sub_100170A54()
{
  return sub_10017EDD4();
}

unint64_t sub_100170A70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100003EB0(&qword_1001E08E8);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (uint64_t i = (char *)(a1 + 33); ; i += 2)
    {
      unsigned __int8 v5 = *(i - 1);
      char v6 = *i;
      unint64_t result = sub_100170108(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

unint64_t sub_100170B48(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100003EB0(&qword_1001E08E0);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  unint64_t result = sub_100170150(v4, v5);
  if (v9)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  BOOL v10 = a1 + 11;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v4;
    v11[1] = v5;
    uint64_t v12 = (void *)(v3[7] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v6;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      break;
    }
    v3[2] = v15;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v16 = v10 + 4;
    uint64_t v4 = *(v10 - 3);
    uint64_t v17 = *(v10 - 2);
    uint64_t v7 = *(v10 - 1);
    uint64_t v18 = *v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100170150(v4, v17);
    BOOL v10 = v16;
    uint64_t v6 = v18;
    uint64_t v5 = v17;
    if (v19) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100170C7C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!result)
  {
    uint64_t v4 = a4;
    goto LABEL_5;
  }
  if (!__OFSUB__(a2 - result, a3))
  {
    sub_100170464(&v5, (unsigned char *)(result + a3), a2 - result - a3, a4);
    uint64_t v4 = v5;
LABEL_5:
    swift_bridgeObjectRetain();
    return v4;
  }
  __break(1u);
  return result;
}

void *sub_100170D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = **(void **)(v3 + 16);
  v8[2] = &v9;
  unint64_t result = sub_10016FFE4((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100170D74, (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t sub_100170D74@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = sub_100170464(v8, a1, a2, **(void **)(v3 + 16));
  uint64_t v6 = v8[1];
  *a3 = v8[0];
  a3[1] = v6;
  a3[2] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100170DDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100170E2C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100170E74(uint64_t a1)
{
  return a1;
}

unint64_t sub_100170EB0()
{
  unint64_t result = sub_100170A70((uint64_t)&off_1001CC920);
  static Data.base64urlByteDecodeTable = result;
  return result;
}

uint64_t *Data.base64urlByteDecodeTable.unsafeMutableAddressor()
{
  if (qword_1001E07F0 != -1) {
    swift_once();
  }
  return &static Data.base64urlByteDecodeTable;
}

uint64_t static Data.base64urlByteDecodeTable.getter()
{
  return sub_100171148(&qword_1001E07F0);
}

unint64_t sub_100170F48()
{
  unint64_t result = sub_100170A70((uint64_t)&off_1001CC948);
  static Data.base64urlByteEncodeTable = result;
  return result;
}

uint64_t *Data.base64urlByteEncodeTable.unsafeMutableAddressor()
{
  if (qword_1001E07F8 != -1) {
    swift_once();
  }
  return &static Data.base64urlByteEncodeTable;
}

uint64_t static Data.base64urlByteEncodeTable.getter()
{
  return sub_100171148(&qword_1001E07F8);
}

uint64_t sub_100170FE0(uint64_t a1)
{
  return sub_100171080(a1, &off_1001CC970, (uint64_t)&unk_1001CC990, &static Data.base64urlCharacterDecodeTable);
}

unint64_t *Data.base64urlCharacterDecodeTable.unsafeMutableAddressor()
{
  if (qword_1001E0800 != -1) {
    swift_once();
  }
  return &static Data.base64urlCharacterDecodeTable;
}

uint64_t static Data.base64urlCharacterDecodeTable.getter()
{
  return sub_100171148(&qword_1001E0800);
}

uint64_t sub_100171068(uint64_t a1)
{
  return sub_100171080(a1, &off_1001CC9D0, (uint64_t)&unk_1001CC9F0, &static Data.base64urlCharacterEncodeTable);
}

uint64_t sub_100171080(uint64_t a1, void *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v5 = sub_100170B48(a2);
  sub_100003EB0(&qword_1001E0910);
  uint64_t result = swift_arrayDestroy();
  *a4 = v5;
  return result;
}

unint64_t *Data.base64urlCharacterEncodeTable.unsafeMutableAddressor()
{
  if (qword_1001E0808 != -1) {
    swift_once();
  }
  return &static Data.base64urlCharacterEncodeTable;
}

uint64_t static Data.base64urlCharacterEncodeTable.getter()
{
  return sub_100171148(&qword_1001E0808);
}

uint64_t sub_100171148(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t Data.init(base64urlEncoded:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_13;
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      BOOL v7 = __OFADD__(v4, 3);
      uint64_t v8 = v4 + 3;
      if (v7)
      {
        __break(1u);
        goto LABEL_12;
      }
      int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
      if (v9 < 0 != v7)
      {
LABEL_12:
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
        JUMPOUT(0x1001712ECLL);
      }
      v17[0] = a1;
      v17[1] = a2;
      v17[2] = sub_1001712FC;
      void v17[3] = 0;
      char v18 = 61;
      int64_t v19 = v9;
      sub_1000065D0(a1, a2);
      sub_1000065D0(a1, a2);
      uint64_t v10 = sub_10016E6C4((uint64_t)v17);
      unint64_t v12 = v11;
      uint64_t v13 = Data.init(base64Encoded:options:)();
      unint64_t v15 = v14;
      sub_100006628(a1, a2);
      sub_100038D8C(v13, v15);
      sub_100006628(a1, a2);
      sub_100006628(v10, v12);
      if (v15 >> 60 != 15) {
        sub_10000BF70(v13, v15);
      }
      return v13;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_14;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

unsigned __int8 *sub_1001712FC@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  return sub_1001714F0(a1, &qword_1001E07F0, &static Data.base64urlByteDecodeTable, a2);
}

uint64_t Data.init(base64urlEncoded:)()
{
  uint64_t result = String.count.getter();
  if (__OFADD__(result, 3))
  {
    __break(1u);
    goto LABEL_7;
  }
  if (result + 3 < 0 != __OFSUB__(result, -3))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  sub_100003EB0(&qword_1001E08F0);
  sub_100038F5C(&qword_1001E08F8, &qword_1001E08F0);
  String.init<A>(_:)();
  String.init<A>(_:)();
  uint64_t v1 = Data.init(base64Encoded:options:)();
  unint64_t v3 = v2;
  sub_100038D8C(v1, v2);
  swift_bridgeObjectRelease();
  if (v3 >> 60 != 15) {
    sub_10000BF70(v1, v3);
  }
  return v1;
}

uint64_t sub_100171444@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100171670(a1, &qword_1001E0800, (uint64_t *)&static Data.base64urlCharacterDecodeTable, a2);
}

uint64_t Data.base64urlEncodedData(options:)()
{
  v2[0] = Data.base64EncodedData(options:)();
  v2[1] = v0;
  v2[2] = (uint64_t)sub_1001714BC;
  v2[3] = 0;
  v2[4] = (uint64_t)sub_1001714CC;
  v2[5] = 0;
  return sub_10016EC6C(v2);
}

BOOL sub_1001714BC(unsigned __int8 *a1)
{
  return *a1 != 61;
}

unsigned __int8 *sub_1001714CC@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  return sub_1001714F0(a1, &qword_1001E07F8, &static Data.base64urlByteEncodeTable, a2);
}

unsigned __int8 *sub_1001714F0@<X0>(unsigned __int8 *result@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned __int8 v6 = *result;
  if (*a2 != -1) {
    uint64_t result = (unsigned __int8 *)swift_once();
  }
  uint64_t v7 = *a3;
  if (*(void *)(v7 + 16))
  {
    uint64_t result = (unsigned __int8 *)sub_100170108(v6);
    if (v8) {
      unsigned __int8 v6 = result[*(void *)(v7 + 56)];
    }
  }
  *a4 = v6;
  return result;
}

Swift::String __swiftcall Data.base64urlEncodedString(options:)(NSDataBase64EncodingOptions options)
{
  Data.base64EncodedString(options:)(options);
  sub_100003EB0(&qword_1001E0900);
  sub_100038F5C(&qword_1001E0908, &qword_1001E0900);
  uint64_t v1 = String.init<A>(_:)();
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t sub_1001715FC(void *a1)
{
  if (*a1 == 61 && a1[1] == 0xE100000000000000) {
    char v2 = 0;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)() ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_10017164C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100171670(a1, &qword_1001E0808, (uint64_t *)&static Data.base64urlCharacterEncodeTable, a2);
}

uint64_t sub_100171670@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v8 = *a3;
  if (*(void *)(v8 + 16))
  {
    unint64_t v9 = sub_100170150(v6, v7);
    if (v10)
    {
      unint64_t v11 = (uint64_t *)(*(void *)(v8 + 56) + 16 * v9);
      uint64_t v6 = *v11;
      uint64_t v7 = v11[1];
    }
  }
  *a4 = v6;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

void sub_100171700()
{
  off_1001E0918 = &off_1001CCA30;
}

Swift::String __swiftcall Data.hexString()()
{
  switch(v1 >> 62)
  {
    case 1uLL:
      LODWORD(v2) = HIDWORD(v0) - v0;
      if (__OFSUB__(HIDWORD(v0), v0)) {
        goto LABEL_9;
      }
      uint64_t v2 = (int)v2;
LABEL_6:
      if (v2 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_9:
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x1001717E8);
      }
LABEL_7:
      __chkstk_darwin();
      uint64_t v6 = String.init(unsafeUninitializedCapacity:initializingUTF8With:)();
      result._object = v7;
      result._uint64_t countAndFlagsBits = v6;
      return result;
    case 2uLL:
      uint64_t v4 = *(void *)(v0 + 16);
      uint64_t v3 = *(void *)(v0 + 24);
      BOOL v5 = __OFSUB__(v3, v4);
      uint64_t v2 = v3 - v4;
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v2 = BYTE6(v1);
      goto LABEL_6;
  }
}

uint64_t sub_1001717F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = type metadata accessor for Data.Iterator();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  char v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a4 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_1000065D0(a3, a4);
      break;
    default:
      break;
  }
  Data.Iterator.init(_:at:)();
  uint64_t v11 = 0;
  while (1)
  {
    Swift::UInt8_optional v12 = Data.Iterator.next()();
    if ((*(_WORD *)&v12 & 0x100) != 0) {
      break;
    }
    Swift::UInt8 value = v12.value;
    if (qword_1001E0810 != -1) {
      swift_once();
    }
    unint64_t v14 = value >> 4;
    unint64_t v15 = *((void *)off_1001E0918 + 2);
    if (v15 <= v14)
    {
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      JUMPOUT(0x1001719CCLL);
    }
    uint64_t v16 = (char *)off_1001E0918 + 32;
    *(unsigned char *)(a1 + v11) = *((unsigned char *)off_1001E0918 + v14 + 32);
    if (v15 <= (value & 0xFu)) {
      goto LABEL_14;
    }
    *(unsigned char *)(a1 + v11 + 1) = v16[value & 0xF];
    BOOL v17 = __OFADD__(v11, 2);
    v11 += 2;
    if (v17) {
      goto LABEL_15;
    }
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

void *Data.hexDigits.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Data.Iterator();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  switch(a2 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_1000065D0(a1, a2);
      sub_1000065D0(a1, a2);
      break;
    default:
      break;
  }
  Data.Iterator.init(_:at:)();
  sub_100006628(a1, a2);
  sub_100172244();
  dispatch thunk of IteratorProtocol.next()();
  if (v18)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
    do
    {
      unsigned int v11 = v17[14];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_10015A690(0, v9[2] + 1, 1, v9);
      }
      unint64_t v13 = v9[2];
      unint64_t v12 = v9[3];
      int64_t v14 = v12 >> 1;
      unint64_t v15 = v13 + 1;
      if (v12 >> 1 <= v13)
      {
        uint64_t v9 = sub_10015A690((void *)(v12 > 1), v13 + 1, 1, v9);
        unint64_t v12 = v9[3];
        int64_t v14 = v12 >> 1;
      }
      v9[2] = v15;
      *((unsigned char *)v9 + v13 + 32) = v11 >> 4;
      int64_t v16 = v13 + 2;
      if (v14 < v16) {
        uint64_t v9 = sub_10015A690((void *)(v12 > 1), v16, 1, v9);
      }
      v9[2] = v16;
      *((unsigned char *)v9 + v15 + 32) = v11 & 0xF;
      dispatch thunk of IteratorProtocol.next()();
    }
    while (v18 != 1);
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  return v9;
}

uint64_t Data.init(hexDigits:)(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 < 2)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0xC000000000000000;
    if (!v2) {
      goto LABEL_16;
    }
LABEL_10:
    if (v2 != 1) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  if (v2 <= 0x1D)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
LABEL_11:
    uint64_t v6 = 32;
    unint64_t v7 = v2;
    while (v6 - 31 < v7)
    {
      char v9 = *(unsigned char *)(a1 + v6 + 1) | (16 * *(unsigned char *)(a1 + v6));
      uint64_t v10 = sub_100003EB0((uint64_t *)&unk_1001DA5B0);
      v12[3] = v10;
      v12[4] = sub_100023888();
      LOBYTE(v12[0]) = v9;
      sub_100006788(v12, v10);
      Data._Representation.replaceSubrange(_:with:count:)();
      sub_100006520((uint64_t)v12);
      uint64_t v8 = v6 - 31;
      if (v6 - 30 == v2) {
        goto LABEL_16;
      }
      unint64_t v7 = *(void *)(a1 + 16);
      if (v6 - 30 >= v7) {
        goto LABEL_18;
      }
      v6 += 2;
      if (v8 + 2 == v2) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t v3 = __DataStorage.init(capacity:)();
  if (v2 > 0xFFFFFFFD)
  {
    type metadata accessor for Data.RangeReference();
    uint64_t v4 = swift_allocObject();
    unint64_t v5 = v3 | 0x8000000000000000;
    *(void *)(v4 + 16) = 0;
    *(void *)(v4 + 24) = 0;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = v3 | 0x4000000000000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v13 = v4;
  unint64_t v14 = v5;
  if (v2) {
    goto LABEL_10;
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return v13;
}

char *sub_100171E50(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_100171E5C(a1, a2, a3, a4, &qword_1001E0920);
}

char *sub_100171E5C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    sub_100003EB0(a5);
    unsigned int v11 = (char *)swift_allocObject();
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    unsigned int v11 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t _s10Foundation4DataV7SPRBaseE9hexStringACSgSS_tcfC_0(uint64_t a1, unint64_t a2)
{
  if (String.count.getter() < 1 || (String.count.getter() & 1) != 0) {
    goto LABEL_13;
  }
  uint64_t v4 = HIBYTE(a2) & 0xF;
  v22[0] = a1;
  v22[1] = a2;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  void v22[2] = 0;
  uint64_t v23 = v4;
  swift_bridgeObjectRetain();
  unint64_t v5 = (char *)_swiftEmptyArrayStorage;
  while ((unint64_t)String.Iterator.next()().value._object)
  {
    uint64_t v6 = Character.hexDigitValue.getter();
    char v8 = v7;
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v5 = sub_100171E5C(0, *((void *)v5 + 2) + 1, 1, v5, &qword_1001DFA38);
      }
      unint64_t v10 = *((void *)v5 + 2);
      unint64_t v9 = *((void *)v5 + 3);
      if (v10 >= v9 >> 1) {
        unint64_t v5 = sub_100171E5C((char *)(v9 > 1), v10 + 1, 1, v5, &qword_1001DFA38);
      }
      *((void *)v5 + 2) = v10 + 1;
      *(void *)&v5[8 * v10 + 32] = v6;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v13 = *((void *)v5 + 2);
  uint64_t v14 = String.count.getter();
  swift_bridgeObjectRelease();
  if (v13 != v14)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v15 = sub_1000EA3B4(v13 >> 1);
    uint64_t v25 = v15;
    uint64_t v26 = v16;
    if (v13)
    {
      unint64_t v17 = 0;
      do
      {
        unint64_t v19 = *((void *)v5 + 2);
        if (v17 >= v19)
        {
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
        }
        unint64_t v20 = v17 + 1;
        if (v17 + 1 >= v19) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)&v5[8 * v17 + 40] | (16 * *(void *)&v5[8 * v17 + 32]);
        if ((v21 & 0x8000000000000000) != 0) {
          goto LABEL_29;
        }
        if (v21 > 0xFF) {
          goto LABEL_30;
        }
        uint64_t v18 = sub_100003EB0((uint64_t *)&unk_1001DA5B0);
        uint64_t v23 = v18;
        unint64_t v24 = sub_100023888();
        LOBYTE(v22[0]) = v21;
        sub_100006788(v22, v18);
        Data._Representation.replaceSubrange(_:with:count:)();
        sub_100006520((uint64_t)v22);
        unint64_t v17 = v20 + 1;
      }
      while (v20 + 1 < v13);
      swift_bridgeObjectRelease();
      return v25;
    }
    else
    {
      uint64_t v11 = v15;
      swift_bridgeObjectRelease();
    }
  }
  return v11;
}

uint64_t sub_100172228(uint64_t a1, uint64_t a2)
{
  return sub_1001717F8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

unint64_t sub_100172244()
{
  unint64_t result = qword_1001DDF10;
  if (!qword_1001DDF10)
  {
    type metadata accessor for Data.Iterator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DDF10);
  }
  return result;
}

Swift::UInt8 __swiftcall Data.toUInt8()()
{
  unint64_t v2 = v1;
  uint64_t v3 = v0;
  sub_1000065D0(v0, v1);
  __int16 v4 = sub_1000D8294(v3, v2);
  sub_100006628(v3, v2);
  if ((v4 & 0x100) != 0) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t Data.toUInt16(endianness:)(char a1, uint64_t a2, unint64_t a3)
{
  sub_1000065D0(a2, a3);
  uint64_t v6 = sub_100115410(a2, a3);
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((a1 & 1) == 0)
  {
    switch(v7 >> 62)
    {
      case 1uLL:
        if ((int)v6 > v6 >> 32)
        {
          __break(1u);
LABEL_34:
          __break(1u);
        }
        else
        {
          uint64_t v10 = __DataStorage._bytes.getter();
          if (!v10) {
            goto LABEL_10;
          }
          uint64_t v11 = __DataStorage._offset.getter();
          if (!__OFSUB__((int)v8, v11))
          {
            v10 += (int)v8 - v11;
LABEL_10:
            __DataStorage._length.getter();
            int64_t v12 = (unsigned __int16 *)v10;
LABEL_17:
            uint64_t v17 = sub_10017261C(v12);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      case 2uLL:
        uint64_t v13 = *(void *)(v6 + 16);
        swift_retain();
        swift_retain();
        uint64_t v14 = (unsigned __int16 *)__DataStorage._bytes.getter();
        if (!v14) {
          goto LABEL_14;
        }
        uint64_t v15 = __DataStorage._offset.getter();
        if (__OFSUB__(v13, v15)) {
          goto LABEL_36;
        }
        uint64_t v14 = (unsigned __int16 *)((char *)v14 + v13 - v15);
LABEL_14:
        __DataStorage._length.getter();
        uint64_t v16 = sub_10017261C(v14);
        goto LABEL_27;
      case 3uLL:
        memset(v26, 0, 14);
        goto LABEL_16;
      default:
        v26[0] = v6;
        LOWORD(v26[1]) = v7;
        BYTE2(v26[1]) = BYTE2(v7);
        BYTE3(v26[1]) = BYTE3(v7);
        BYTE4(v26[1]) = BYTE4(v7);
        BYTE5(v26[1]) = BYTE5(v7);
LABEL_16:
        int64_t v12 = (unsigned __int16 *)v26;
        goto LABEL_17;
    }
  }
  switch(v7 >> 62)
  {
    case 1uLL:
      if ((int)v6 > v6 >> 32) {
        goto LABEL_34;
      }
      uint64_t v18 = __DataStorage._bytes.getter();
      if (!v18) {
        goto LABEL_22;
      }
      uint64_t v19 = __DataStorage._offset.getter();
      if (__OFSUB__((int)v8, v19)) {
        goto LABEL_37;
      }
      v18 += (int)v8 - v19;
LABEL_22:
      __DataStorage._length.getter();
      unint64_t v20 = (unsigned __int16 *)v18;
LABEL_30:
      uint64_t v17 = sub_100172624(v20);
      break;
    case 2uLL:
      uint64_t v21 = *(void *)(v6 + 16);
      swift_retain();
      swift_retain();
      uint64_t v22 = (unsigned __int16 *)__DataStorage._bytes.getter();
      if (!v22) {
        goto LABEL_26;
      }
      uint64_t v23 = __DataStorage._offset.getter();
      if (__OFSUB__(v21, v23)) {
        goto LABEL_38;
      }
      uint64_t v22 = (unsigned __int16 *)((char *)v22 + v21 - v23);
LABEL_26:
      __DataStorage._length.getter();
      uint64_t v16 = sub_100172624(v22);
LABEL_27:
      uint64_t v24 = v16;
      swift_release();
      swift_release();
      goto LABEL_32;
    case 3uLL:
      memset(v26, 0, 14);
      goto LABEL_29;
    default:
      v26[0] = v6;
      LOWORD(v26[1]) = v7;
      BYTE2(v26[1]) = BYTE2(v7);
      BYTE3(v26[1]) = BYTE3(v7);
      BYTE4(v26[1]) = BYTE4(v7);
      BYTE5(v26[1]) = BYTE5(v7);
LABEL_29:
      unint64_t v20 = (unsigned __int16 *)v26;
      goto LABEL_30;
  }
LABEL_31:
  uint64_t v24 = v17;
LABEL_32:
  sub_100006628(v8, v9);
  return v24;
}

uint64_t sub_10017261C(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t sub_100172624(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

uint64_t Data.toUInt32(endianness:)(char a1, uint64_t a2, unint64_t a3)
{
  sub_1000065D0(a2, a3);
  uint64_t v6 = sub_100115410(a2, a3);
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((a1 & 1) == 0)
  {
    switch(v7 >> 62)
    {
      case 1uLL:
        if ((int)v6 > v6 >> 32)
        {
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
        }
        else
        {
          uint64_t v10 = (unsigned int *)__DataStorage._bytes.getter();
          if (!v10)
          {
LABEL_10:
            __DataStorage._length.getter();
            uint64_t v12 = sub_10017298C(v10);
            goto LABEL_30;
          }
          uint64_t v11 = __DataStorage._offset.getter();
          if (!__OFSUB__((int)v8, v11))
          {
            uint64_t v10 = (unsigned int *)((char *)v10 + (int)v8 - v11);
            goto LABEL_10;
          }
        }
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      case 2uLL:
        uint64_t v13 = *(void *)(v6 + 16);
        swift_retain();
        swift_retain();
        uint64_t v14 = (unsigned int *)__DataStorage._bytes.getter();
        if (!v14) {
          goto LABEL_14;
        }
        uint64_t v15 = __DataStorage._offset.getter();
        if (__OFSUB__(v13, v15)) {
          goto LABEL_34;
        }
        uint64_t v14 = (unsigned int *)((char *)v14 + v13 - v15);
LABEL_14:
        __DataStorage._length.getter();
        uint64_t v16 = sub_10017298C(v14);
        goto LABEL_26;
      case 3uLL:
        memset(v26, 0, 14);
        goto LABEL_16;
      default:
        v26[0] = v6;
        LOWORD(v26[1]) = v7;
        BYTE2(v26[1]) = BYTE2(v7);
        BYTE3(v26[1]) = BYTE3(v7);
        BYTE4(v26[1]) = BYTE4(v7);
        BYTE5(v26[1]) = BYTE5(v7);
LABEL_16:
        uint64_t v12 = sub_10017298C((unsigned int *)v26);
        goto LABEL_30;
    }
  }
  switch(v7 >> 62)
  {
    case 1uLL:
      if ((int)v6 > v6 >> 32) {
        goto LABEL_33;
      }
      uint64_t v17 = __DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__((int)v8, v18)) {
        goto LABEL_37;
      }
      v17 += (int)v8 - v18;
LABEL_21:
      __DataStorage._length.getter();
      uint64_t v19 = (unsigned int *)v17;
LABEL_29:
      uint64_t v12 = sub_100172994(v19);
      break;
    case 2uLL:
      uint64_t v20 = *(void *)(v6 + 16);
      swift_retain();
      swift_retain();
      uint64_t v21 = (unsigned int *)__DataStorage._bytes.getter();
      if (!v21) {
        goto LABEL_25;
      }
      uint64_t v22 = __DataStorage._offset.getter();
      if (__OFSUB__(v20, v22)) {
        goto LABEL_35;
      }
      uint64_t v21 = (unsigned int *)((char *)v21 + v20 - v22);
LABEL_25:
      __DataStorage._length.getter();
      uint64_t v16 = sub_100172994(v21);
LABEL_26:
      uint64_t v23 = v16;
      swift_release();
      swift_release();
      sub_100006628(v8, v9);
      return v23;
    case 3uLL:
      memset(v26, 0, 14);
      goto LABEL_28;
    default:
      v26[0] = v6;
      LOWORD(v26[1]) = v7;
      BYTE2(v26[1]) = BYTE2(v7);
      BYTE3(v26[1]) = BYTE3(v7);
      BYTE4(v26[1]) = BYTE4(v7);
      BYTE5(v26[1]) = BYTE5(v7);
LABEL_28:
      uint64_t v19 = (unsigned int *)v26;
      goto LABEL_29;
  }
LABEL_30:
  uint64_t v25 = v12;
  sub_100006628(v8, v9);
  return v25;
}

uint64_t sub_10017298C(unsigned int *a1)
{
  return *a1;
}

uint64_t sub_100172994(unsigned int *a1)
{
  return bswap32(*a1);
}

unint64_t Data.toUInt64(endianness:)(char a1, uint64_t a2, unint64_t a3)
{
  sub_1000065D0(a2, a3);
  uint64_t v6 = sub_100115410(a2, a3);
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((a1 & 1) == 0)
  {
    switch(v7 >> 62)
    {
      case 1uLL:
        if ((int)v6 > v6 >> 32)
        {
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
        }
        else
        {
          uint64_t v10 = __DataStorage._bytes.getter();
          if (!v10)
          {
LABEL_10:
            __DataStorage._length.getter();
            unint64_t v12 = sub_100172CF8(v10);
            goto LABEL_30;
          }
          uint64_t v11 = __DataStorage._offset.getter();
          if (!__OFSUB__((int)v8, v11))
          {
            v10 += (int)v8 - v11;
            goto LABEL_10;
          }
        }
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      case 2uLL:
        uint64_t v13 = *(void *)(v6 + 16);
        swift_retain();
        swift_retain();
        uint64_t v14 = __DataStorage._bytes.getter();
        if (!v14) {
          goto LABEL_14;
        }
        uint64_t v15 = __DataStorage._offset.getter();
        if (__OFSUB__(v13, v15)) {
          goto LABEL_34;
        }
        v14 += v13 - v15;
LABEL_14:
        __DataStorage._length.getter();
        unint64_t v16 = sub_100172CF8(v14);
        goto LABEL_26;
      case 3uLL:
        memset(v26, 0, 14);
        goto LABEL_16;
      default:
        v26[0] = v6;
        LOWORD(v26[1]) = v7;
        BYTE2(v26[1]) = BYTE2(v7);
        BYTE3(v26[1]) = BYTE3(v7);
        BYTE4(v26[1]) = BYTE4(v7);
        BYTE5(v26[1]) = BYTE5(v7);
LABEL_16:
        unint64_t v12 = sub_100172CF8((uint64_t)v26);
        goto LABEL_30;
    }
  }
  switch(v7 >> 62)
  {
    case 1uLL:
      if ((int)v6 > v6 >> 32) {
        goto LABEL_33;
      }
      uint64_t v17 = __DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__((int)v8, v18)) {
        goto LABEL_37;
      }
      v17 += (int)v8 - v18;
LABEL_21:
      __DataStorage._length.getter();
      uint64_t v19 = (unint64_t *)v17;
LABEL_29:
      unint64_t v12 = sub_100172D00(v19);
      break;
    case 2uLL:
      uint64_t v20 = *(void *)(v6 + 16);
      swift_retain();
      swift_retain();
      uint64_t v21 = (unint64_t *)__DataStorage._bytes.getter();
      if (!v21) {
        goto LABEL_25;
      }
      uint64_t v22 = __DataStorage._offset.getter();
      if (__OFSUB__(v20, v22)) {
        goto LABEL_35;
      }
      uint64_t v21 = (unint64_t *)((char *)v21 + v20 - v22);
LABEL_25:
      __DataStorage._length.getter();
      unint64_t v16 = sub_100172D00(v21);
LABEL_26:
      unint64_t v23 = v16;
      swift_release();
      swift_release();
      sub_100006628(v8, v9);
      return v23;
    case 3uLL:
      memset(v26, 0, 14);
      goto LABEL_28;
    default:
      v26[0] = v6;
      LOWORD(v26[1]) = v7;
      BYTE2(v26[1]) = BYTE2(v7);
      BYTE3(v26[1]) = BYTE3(v7);
      BYTE4(v26[1]) = BYTE4(v7);
      BYTE5(v26[1]) = BYTE5(v7);
LABEL_28:
      uint64_t v19 = v26;
      goto LABEL_29;
  }
LABEL_30:
  unint64_t v25 = v12;
  sub_100006628(v8, v9);
  return v25;
}

uint64_t sub_100172CF8(uint64_t a1)
{
  return *(void *)a1;
}

unint64_t sub_100172D00(unint64_t *a1)
{
  return bswap64(*a1);
}

uint64_t Data.at(index:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v3 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x100172DB4);
      }
      uint64_t v4 = (int)v4;
LABEL_8:
      if (v4 <= a1) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = Data.subdata(in:)();
      }
      break;
    case 2uLL:
      uint64_t v6 = *(void *)(a2 + 16);
      uint64_t v5 = *(void *)(a2 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_8;
      }
      goto LABEL_13;
    case 3uLL:
      return v3;
    default:
      uint64_t v4 = BYTE6(a3);
      goto LABEL_8;
  }
  return v3;
}

uint64_t Data.replaceAt(index:value:)(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (result < 0) {
    return result;
  }
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  unint64_t v6 = v5 >> 62;
  switch(v5 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(v4) - v4;
      if (__OFSUB__(HIDWORD(v4), v4)) {
        goto LABEL_31;
      }
      uint64_t v7 = (int)v7;
LABEL_7:
      if (v7 <= result) {
        return result;
      }
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(v4 + 16);
      uint64_t v8 = *(void *)(v4 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_7;
      }
      goto LABEL_32;
    case 3uLL:
      return result;
    default:
      uint64_t v7 = BYTE6(v5);
      goto LABEL_7;
  }
  uint64_t v11 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v11) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2)) {
        goto LABEL_37;
      }
      uint64_t v11 = (int)v11;
LABEL_13:
      if (v6)
      {
        if (v6 == 1)
        {
          LODWORD(v14) = HIDWORD(v4) - v4;
          if (__OFSUB__(HIDWORD(v4), v4))
          {
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
          uint64_t v14 = (int)v14;
        }
        else
        {
          uint64_t v17 = v4 + 16;
          uint64_t v16 = *(void *)(v4 + 16);
          uint64_t v15 = *(void *)(v17 + 8);
          BOOL v10 = __OFSUB__(v15, v16);
          uint64_t v14 = v15 - v16;
          if (v10)
          {
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            JUMPOUT(0x100172F84);
          }
        }
      }
      else
      {
        uint64_t v14 = BYTE6(v5);
      }
      BOOL v10 = __OFSUB__(v14, result);
      uint64_t v18 = v14 - result;
      if (v10)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      if (v18 >= v11)
      {
        uint64_t v19 = 0;
        switch(a3 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(a2), a2)) {
              goto LABEL_39;
            }
            uint64_t v19 = HIDWORD(a2) - (int)a2;
LABEL_26:
            if (__OFADD__(result, v19)) {
              goto LABEL_33;
            }
            if (result + v19 < result) {
              goto LABEL_34;
            }
            unint64_t result = sub_100172FB4(a2, a3);
            break;
          case 2uLL:
            uint64_t v21 = *(void *)(a2 + 16);
            uint64_t v20 = *(void *)(a2 + 24);
            BOOL v10 = __OFSUB__(v20, v21);
            uint64_t v19 = v20 - v21;
            if (!v10) {
              goto LABEL_26;
            }
            goto LABEL_40;
          case 3uLL:
            goto LABEL_26;
          default:
            uint64_t v19 = BYTE6(a3);
            goto LABEL_26;
        }
      }
      return result;
    case 2uLL:
      uint64_t v13 = *(void *)(a2 + 16);
      uint64_t v12 = *(void *)(a2 + 24);
      BOOL v10 = __OFSUB__(v12, v13);
      uint64_t v11 = v12 - v13;
      if (!v10) {
        goto LABEL_13;
      }
      goto LABEL_38;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v11 = BYTE6(a3);
      goto LABEL_13;
  }
}

uint64_t sub_100172FB4(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      swift_retain();
      sub_100173318((int)a1, a1 >> 32);
      uint64_t result = sub_100006628(a1, a2);
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      sub_100173318(v5, v6);
      swift_release();
      uint64_t result = swift_release();
      break;
    default:
      uint64_t result = Data._Representation.replaceSubrange(_:with:count:)();
      break;
  }
  return result;
}

unint64_t sub_1001731C0()
{
  unint64_t result = qword_1001E0928;
  if (!qword_1001E0928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0928);
  }
  return result;
}

unsigned char *_s10EndiannessOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    void *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1001732E0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Data.Endianness()
{
  return &type metadata for Data.Endianness;
}

uint64_t sub_100173318(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result || (uint64_t result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      return Data._Representation.replaceSubrange(_:with:count:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t Range.include(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = __chkstk_darwin(a1, a2);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)v18 - v10;
  v18[1] = *(void *)(v12 + 24);
  char v13 = dispatch thunk of static Comparable.<= infix(_:_:)();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v11, v2, a2);
  v14(v8, a1, a2);
  if (v13) {
    char v15 = dispatch thunk of static Comparable.>= infix(_:_:)();
  }
  else {
    char v15 = 0;
  }
  uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v8, a2);
  v16(v11, a2);
  return v15 & 1;
}

uint64_t TLV.tag.getter()
{
  return *(void *)(v0 + 16);
}

void *TLV.__allocating_init(tag:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

uint64_t type metadata accessor for TLV()
{
  return self;
}

void *TLV.__allocating_init(tag:children:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = 0x2000000000000000;
  return result;
}

void TLV.__allocating_init(dataRepresentation:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone((Class)NSInputStream);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v7 = [v5 initWithData:isa];

  [v7 open];
  uint64_t v8 = sub_1001737B4();
  if (v2) {
    goto LABEL_6;
  }
  if ((v9 & 1) != 0
    || (uint64_t v10 = v8, v11 = sub_100173938(), (v12 & 1) != 0)
    || (id v13 = NSInputStream.read(exactly:)((uint64_t)v11), v15 = v14, v14 >> 60 == 15))
  {
    sub_1001738E4();
    swift_allocError();
    *uint64_t v16 = 0;
    swift_willThrow();
LABEL_6:
    sub_100006628(a1, a2);
LABEL_7:

    return;
  }
  uint64_t v17 = (uint64_t)v13;
  if ((sub_100173AB4() & 0x100) == 0)
  {
    sub_1001738E4();
    swift_allocError();
    *uint64_t v18 = 1;
    swift_willThrow();
    sub_100006628(a1, a2);
    sub_10000BF70(v17, v15);
    goto LABEL_7;
  }
  [v7 close];
  sub_100006628(a1, a2);

  type metadata accessor for TLV();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v10;
  v19[3] = v17;
  v19[4] = v15;
}

uint64_t sub_1001737B4()
{
  uint64_t result = sub_100173AB4();
  if (!v1)
  {
    if ((result & 0x100) != 0) {
      return 0;
    }
    uint64_t v3 = result;
    if ((~result & 0x1F) != 0)
    {
      return result;
    }
    else
    {
      while (1)
      {
        unsigned __int8 v6 = 0;
        id v4 = [v0 read:&v6 maxLength:1];
        if (v4 != (id)1) {
          break;
        }
        uint64_t result = v6 | (unint64_t)(v3 << 8);
        uint64_t v3 = result;
        if (((char)v6 & 0x80000000) == 0) {
          return result;
        }
      }
      if (v4 != (id)-1)
      {
        sub_1001738E4();
        swift_allocError();
        *id v5 = 0;
        return swift_willThrow();
      }
      uint64_t result = (uint64_t)[v0 streamError];
      if (result) {
        return swift_willThrow();
      }
      __break(1u);
    }
  }
  return result;
}

unint64_t sub_1001738E4()
{
  unint64_t result = qword_1001E0930;
  if (!qword_1001E0930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0930);
  }
  return result;
}

id sub_100173938()
{
  __int16 v3 = sub_100173AB4();
  if (v1) {
    return (id)v2;
  }
  if ((v3 & 0x100) != 0) {
    return 0;
  }
  unsigned int v4 = v3;
  if ((v3 & 0x80) == 0) {
    return (id)v3;
  }
  if (v3 == 128)
  {
    sub_1001738E4();
    swift_allocError();
    *unsigned __int8 v6 = 2;
LABEL_18:
    swift_willThrow();
    return (id)v2;
  }
  unint64_t v2 = 0;
  unsigned int v7 = 128;
  while (1)
  {
    if (v7 >= v4) {
      __break(1u);
    }
    unsigned __int8 v10 = 0;
    id v8 = [v0 read:&v10 maxLength:1];
    if (v8 != (id)1) {
      break;
    }
    ++v7;
    unint64_t v2 = v10 | (v2 << 8);
    if (v7 == v4) {
      return (id)v2;
    }
  }
  if (v8 != (id)-1)
  {
    sub_1001738E4();
    swift_allocError();
    *char v9 = 0;
    goto LABEL_18;
  }
  id result = [v0 streamError];
  if (result) {
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_100173AB4()
{
  unsigned __int8 v3 = 0;
  id v1 = [v0 read:&v3 maxLength:1];
  if (v1 == (id)1) {
    return v3;
  }
  if (v1 != (id)-1) {
    return 256;
  }
  uint64_t result = (uint64_t)[v0 streamError];
  if (result) {
    return swift_willThrow();
  }
  __break(1u);
  return result;
}

uint64_t TLV.length.getter()
{
  unint64_t v2 = *(void *)(v0 + 24);
  unint64_t v3 = *(void *)(v0 + 32);
  if ((v3 & 0x2000000000000000) == 0)
  {
    switch(v3 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v2), v2)) {
          goto LABEL_42;
        }
        return HIDWORD(v2) - (int)v2;
      case 2uLL:
        uint64_t v15 = *(void *)(v2 + 16);
        uint64_t v14 = *(void *)(v2 + 24);
        uint64_t v4 = v14 - v15;
        if (!__OFSUB__(v14, v15)) {
          return v4;
        }
        __break(1u);
        goto LABEL_23;
      case 3uLL:
        goto LABEL_39;
      default:
        sub_100173E78(*(void *)(v0 + 24), *(void *)(v0 + 32));
        return BYTE6(v3);
    }
  }
  if (v2 >> 62)
  {
LABEL_37:
    sub_100173E6C(v2, v3);
    swift_bridgeObjectRetain();
    uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
    if (v1) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v1 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_100173E6C(*(void *)(v0 + 24), *(void *)(v0 + 32));
    swift_bridgeObjectRetain();
    if (v1)
    {
LABEL_6:
      if (v1 < 1)
      {
        __break(1u);
LABEL_42:
        __break(1u);
        JUMPOUT(0x100173DF4);
      }
      if ((v2 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = 0;
        uint64_t v4 = 0;
        while (1)
        {
          uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          int64_t v7 = TLV.length.getter(v6);
          unint64_t v8 = *(void *)(v6 + 16);
          swift_unknownObjectRelease();
          if (v8)
          {
            unint64_t v9 = 8 - (__clz(v8) >> 3);
            if (v7 <= 127)
            {
              unint64_t v10 = 1;
              goto LABEL_14;
            }
          }
          else
          {
            unint64_t v10 = 1;
            unint64_t v9 = 1;
            if (v7 < 128) {
              goto LABEL_14;
            }
          }
          unint64_t v10 = 9 - (__clz(v7) >> 3);
LABEL_14:
          unint64_t v11 = v9 + v10;
          BOOL v12 = __OFADD__(v11, v7);
          unint64_t v13 = v11 + v7;
          if (v12)
          {
            __break(1u);
LABEL_34:
            __break(1u);
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
          BOOL v12 = __OFADD__(v4, v13);
          v4 += v13;
          if (v12) {
            goto LABEL_34;
          }
          if (v1 == ++v5) {
            goto LABEL_32;
          }
        }
      }
LABEL_23:
      uint64_t v4 = 0;
      uint64_t v16 = (uint64_t *)(v2 + 32);
      while (1)
      {
        uint64_t v17 = *v16;
        uint64_t v18 = swift_retain();
        int64_t v19 = TLV.length.getter(v18);
        unint64_t v20 = *(void *)(v17 + 16);
        swift_release();
        if (v20)
        {
          unint64_t v21 = 8 - (__clz(v20) >> 3);
          if (v19 > 127) {
            goto LABEL_28;
          }
          unint64_t v22 = 1;
        }
        else
        {
          unint64_t v22 = 1;
          unint64_t v21 = 1;
          if (v19 >= 128) {
LABEL_28:
          }
            unint64_t v22 = 9 - (__clz(v19) >> 3);
        }
        unint64_t v23 = v21 + v22;
        BOOL v12 = __OFADD__(v23, v19);
        unint64_t v24 = v23 + v19;
        if (v12) {
          goto LABEL_35;
        }
        BOOL v12 = __OFADD__(v4, v24);
        v4 += v24;
        if (v12)
        {
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        ++v16;
        if (!--v1)
        {
LABEL_32:
          sub_100173E78(v2, v3);
          sub_100173E78(v2, v3);
          return v4;
        }
      }
    }
  }
  sub_100173E78(v2, v3);
LABEL_39:
  sub_100173E78(v2, v3);
  return 0;
}

unint64_t TLV.derSize.getter()
{
  int64_t v1 = TLV.length.getter();
  unint64_t v2 = *(void *)(v0 + 16);
  if (v2)
  {
    unint64_t v3 = 8 - (__clz(v2) >> 3);
    if (v1 < 128)
    {
      unint64_t v4 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v3 = 1;
    unint64_t v4 = 1;
    if (v1 < 128) {
      goto LABEL_6;
    }
  }
  unint64_t v4 = 9 - (__clz(v1) >> 3);
LABEL_6:
  unint64_t v5 = v3 + v4;
  BOOL v6 = __OFADD__(v5, v1);
  unint64_t result = v5 + v1;
  if (v6) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100173E6C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    return swift_bridgeObjectRetain();
  }
  else {
    return sub_1000065D0(a1, a2);
  }
}

uint64_t sub_100173E78(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    return swift_bridgeObjectRelease();
  }
  else {
    return sub_100006628(a1, a2);
  }
}

uint64_t TLV.value.getter()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_1000065D0(*(void *)(v0 + 24), *(void *)(v0 + 32));
    return v1;
  }
  unint64_t v3 = self;
  swift_bridgeObjectRetain();
  id v4 = [v3 outputStreamToMemory];
  [v4 open];
  if (v1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
LABEL_5:
    uint64_t v6 = 4;
    do
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        unint64_t v8 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_15;
        }
      }
      else
      {
        unint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_15:
          __break(1u);
LABEL_16:
          swift_bridgeObjectRetain();
          uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
          sub_100173E78(v1, v2);
          if (!v5) {
            break;
          }
          goto LABEL_5;
        }
      }
      sub_100174088(v8);
      swift_release();
      ++v6;
    }
    while (v10 != v5);
  }
  sub_100173E78(v1, v2);
  [v4 close];
  if ([v4 propertyForKey:NSStreamDataWrittenToMemoryStreamKey])
  {
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
    sub_100006510(&v13, &v14);
    swift_dynamicCast();
    return v12;
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_100174088(unint64_t *a1)
{
  uint64_t result = sub_100178244(a1[2]);
  if (!v1)
  {
    uint64_t v4 = TLV.length.getter();
    sub_100178678(v4);
    unint64_t v6 = a1[3];
    unint64_t v5 = a1[4];
    if ((v5 & 0x2000000000000000) == 0)
    {
      sub_1000065D0(v6, v5);
      sub_100178B90(v6, v5);
      goto LABEL_16;
    }
    if (v6 >> 62) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = _CocoaArrayWrapper.endIndex.getter())
    {
      unint64_t v13 = v5;
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v9 = i - 4;
        if ((v6 & 0xC000000000000001) == 0) {
          break;
        }
        uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        unint64_t v5 = i - 3;
        if (__OFADD__(v9, 1)) {
          goto LABEL_14;
        }
LABEL_12:
        sub_100174088(v10);
        swift_release();
        if (v5 == v7)
        {
          uint64_t v11 = v6;
          unint64_t v12 = v13;
          return sub_100173E78(v11, v12);
        }
      }
      uint64_t v10 = *(void *)(v6 + 8 * i);
      swift_retain();
      unint64_t v5 = i - 3;
      if (!__OFADD__(v9, 1)) {
        goto LABEL_12;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    uint64_t v11 = v6;
    unint64_t v12 = v5;
    return sub_100173E78(v11, v12);
  }
  return result;
}

uint64_t sub_10017420C(unint64_t *a1)
{
  uint64_t result = sub_100178490(a1[2]);
  if (!v1)
  {
    int64_t v4 = TLV.length.getter();
    sub_100178738(v4);
    unint64_t v6 = a1[3];
    unint64_t v5 = a1[4];
    if ((v5 & 0x2000000000000000) == 0)
    {
      swift_beginAccess();
      sub_1000065D0(v6, v5);
      sub_100147328(v6, v5);
      swift_endAccess();
      goto LABEL_16;
    }
    if (v6 >> 62) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = _CocoaArrayWrapper.endIndex.getter())
    {
      unint64_t v13 = v5;
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v9 = i - 4;
        if ((v6 & 0xC000000000000001) == 0) {
          break;
        }
        uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        unint64_t v5 = i - 3;
        if (__OFADD__(v9, 1)) {
          goto LABEL_14;
        }
LABEL_12:
        sub_10017420C(v10);
        swift_release();
        if (v5 == v7)
        {
          uint64_t v11 = v6;
          unint64_t v12 = v13;
          return sub_100173E78(v11, v12);
        }
      }
      uint64_t v10 = *(void *)(v6 + 8 * i);
      swift_retain();
      unint64_t v5 = i - 3;
      if (!__OFADD__(v9, 1)) {
        goto LABEL_12;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    uint64_t v11 = v6;
    unint64_t v12 = v5;
    return sub_100173E78(v11, v12);
  }
  return result;
}

uint64_t TLV.hexStringValue.getter()
{
  uint64_t v0 = TLV.value.getter();
  uint64_t v2 = v0;
  unint64_t v3 = v1;
  uint64_t v4 = 0;
  switch(v1 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(v0) - v0;
      if (__OFSUB__(HIDWORD(v0), v0)) {
        goto LABEL_9;
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_9:
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x1001744ACLL);
      }
LABEL_7:
      __chkstk_darwin(2 * v4, v1);
      uint64_t v8 = String.init(unsafeUninitializedCapacity:initializingUTF8With:)();
      sub_100006628(v2, v3);
      return v8;
    case 2uLL:
      uint64_t v6 = *(void *)(v0 + 16);
      uint64_t v5 = *(void *)(v0 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(v1);
      goto LABEL_6;
  }
}

id TLV.children.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_100173E6C(*(void *)(v0 + 24), *(void *)(v0 + 32));
    id v3 = sub_1001795C4(v1, v2);
    sub_100173E78(v1, v2);
    uint64_t v4 = *(void *)(v0 + 24);
    unint64_t v5 = *(void *)(v0 + 32);
    *(void *)(v0 + 24) = v3;
    *(void *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_100173E78(v4, v5);
    return v3;
  }
  return (id)v1;
}

id static TLV.decode(from:)(uint64_t a1, unint64_t a2)
{
  return sub_1001795C4(a1, a2);
}

uint64_t TLV.dataRepresentation.getter()
{
  uint64_t v1 = v0;
  int64_t v2 = TLV.derSize.getter();
  type metadata accessor for DERMemoryWriter();
  uint64_t inited = swift_initStackObject();
  if (v2)
  {
    if (v2 <= 14)
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v4 = __DataStorage.init(capacity:)();
      if ((unint64_t)v2 > 0x7FFFFFFE)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t v5 = swift_allocObject();
        unint64_t v6 = v4 | 0x8000000000000000;
        *(void *)(v5 + 16) = 0;
        *(void *)(v5 + 24) = 0;
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v6 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0xC000000000000000;
  }
  *(void *)(inited + 16) = v5;
  *(void *)(inited + 24) = v6;
  sub_10017420C(v1);
  swift_beginAccess();
  return *(void *)(inited + 16);
}

id TLV.childrenIterator.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_100173E6C(*(void *)(v0 + 24), *(void *)(v0 + 32));
    id v3 = sub_1001795C4(v1, v2);
    sub_100173E78(v1, v2);
    uint64_t v4 = *(void *)(v0 + 24);
    unint64_t v5 = *(void *)(v0 + 32);
    *(void *)(v0 + 24) = v3;
    *(void *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_100173E78(v4, v5);
    return v3;
  }
  return (id)v1;
}

uint64_t TLV.hash(into:)(uint64_t a1)
{
  Hasher._combine(_:)(v1[2]);
  unint64_t v3 = v1[3];
  unint64_t v4 = v1[4];
  if ((v4 & 0x2000000000000000) != 0)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v5 = result;
      if (!result) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (!v5) {
        goto LABEL_12;
      }
    }
    if (v5 < 1)
    {
      __break(1u);
      return result;
    }
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        TLV.hash(into:)(a1);
        swift_unknownObjectRelease();
      }
    }
    else
    {
      unint64_t v8 = v3 + 32;
      do
      {
        v8 += 8;
        swift_retain();
        TLV.hash(into:)(a1);
        swift_release();
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    sub_1000065D0(v3, v4);
    Data.hash(into:)();
  }
LABEL_12:

  return sub_100173E78(v3, v4);
}

uint64_t TLV.debugDescription.getter()
{
  uint64_t v1 = v0;
  unint64_t v2 = v0[3];
  unint64_t v3 = v0[4];
  if ((v3 & 0x2000000000000000) != 0)
  {
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      if (v8) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_5:
        sub_10014B9C4(0, v8 & ~(v8 >> 63), 0);
        if (v8 < 0)
        {
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
          JUMPOUT(0x100174D74);
        }
        uint64_t v9 = 0;
        do
        {
          if ((v2 & 0xC000000000000001) != 0) {
            uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            uint64_t v10 = swift_retain();
          }
          uint64_t v11 = TLV.debugDescription.getter(v10);
          uint64_t v13 = v12;
          swift_release();
          unint64_t v15 = _swiftEmptyArrayStorage[2];
          unint64_t v14 = _swiftEmptyArrayStorage[3];
          if (v15 >= v14 >> 1) {
            sub_10014B9C4(v14 > 1, v15 + 1, 1);
          }
          ++v9;
          _swiftEmptyArrayStorage[2] = v15 + 1;
          uint64_t v16 = &_swiftEmptyArrayStorage[2 * v15];
          v16[4] = v11;
          v16[5] = v13;
        }
        while (v8 != v9);
        sub_100173E78(v2, v3);
        uint64_t v1 = v0;
LABEL_26:
        sub_100003EB0((uint64_t *)&unk_1001DA570);
        sub_10002B658();
        uint64_t v26 = BidirectionalCollection<>.joined(separator:)();
        uint64_t v28 = v27;
        swift_bridgeObjectRelease();
        _StringGuts.grow(_:)(29);
        swift_bridgeObjectRelease();
        uint64_t v29 = v1[2];
        sub_100003EB0((uint64_t *)&unk_1001DD3C0);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_100186100;
        *(void *)(v30 + 56) = &type metadata for UInt;
        *(void *)(v30 + 64) = &protocol witness table for UInt;
        *(void *)(v30 + 32) = v29;
        v31._uint64_t countAndFlagsBits = String.init(format:_:)();
        String.append(_:)(v31);
        swift_bridgeObjectRelease();
        v32._uint64_t countAndFlagsBits = 0x72646C696863202CLL;
        v32._object = (void *)0xEE00205B203A6E65;
        String.append(_:)(v32);
        v33._uint64_t countAndFlagsBits = v26;
        v33._object = v28;
        String.append(_:)(v33);
        swift_bridgeObjectRelease();
        v34._uint64_t countAndFlagsBits = 2099272992;
        v34._object = (void *)0xE400000000000000;
        String.append(_:)(v34);
        return 0x203A676174207BLL;
      }
    }
    sub_100173E78(v2, v3);
    goto LABEL_26;
  }
  sub_1000065D0(v2, v3);
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  uint64_t v4 = v0[2];
  sub_100003EB0((uint64_t *)&unk_1001DD3C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100186100;
  *(void *)(v5 + 56) = &type metadata for UInt;
  *(void *)(v5 + 64) = &protocol witness table for UInt;
  *(void *)(v5 + 32) = v4;
  v6._uint64_t countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._uint64_t countAndFlagsBits = 0x6874676E656C202CLL;
  v7._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v7);
  switch(v3 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v2), v2)) {
        break;
      }
      goto LABEL_30;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v2 + 24), *(void *)(v2 + 16))) {
        break;
      }
      goto LABEL_31;
    default:
      break;
  }
  v17._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._uint64_t countAndFlagsBits = 0x3A65756C6176202CLL;
  v18._object = (void *)0xE900000000000020;
  String.append(_:)(v18);
  uint64_t v20 = 0;
  switch(v3 >> 62)
  {
    case 0uLL:
      uint64_t v20 = BYTE6(v3);
      goto LABEL_22;
    case 1uLL:
      LODWORD(v20) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2)) {
        goto LABEL_32;
      }
      uint64_t v20 = (int)v20;
LABEL_22:
      if (v20 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
LABEL_23:
      __chkstk_darwin(2 * v20, v19);
      v24._uint64_t countAndFlagsBits = String.init(unsafeUninitializedCapacity:initializingUTF8With:)();
      String.append(_:)(v24);
      swift_bridgeObjectRelease();
      v25._uint64_t countAndFlagsBits = 32032;
      v25._object = (void *)0xE200000000000000;
      String.append(_:)(v25);
      sub_100173E78(v2, v3);
      return 0x203A676174207BLL;
    case 2uLL:
      uint64_t v22 = *(void *)(v2 + 16);
      uint64_t v21 = *(void *)(v2 + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_22;
      }
      goto LABEL_33;
    case 3uLL:
      goto LABEL_23;
    default:
      JUMPOUT(0);
  }
}

uint64_t static TLV.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v2 = TLV.value.getter();
  unint64_t v4 = v3;
  uint64_t v5 = TLV.value.getter();
  unint64_t v7 = v6;
  char v8 = sub_10014C798(v2, v4, v5, v6);
  sub_100006628(v5, v7);
  sub_100006628(v2, v4);
  return v8 & 1;
}

uint64_t TLV.firstChild(tag:)(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    if (v3 >> 62) {
      goto LABEL_17;
    }
  }
  else
  {
    sub_100173E6C(*(void *)(v1 + 24), *(void *)(v1 + 32));
    unint64_t v5 = (unint64_t)sub_1001795C4(v3, v4);
    sub_100173E78(v3, v4);
    uint64_t v11 = *(void *)(v1 + 24);
    unint64_t v12 = *(void *)(v1 + 32);
    *(void *)(v1 + 24) = v5;
    *(void *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_100173E78(v11, v12);
    unint64_t v3 = v5;
    if (v5 >> 62)
    {
LABEL_17:
      swift_bridgeObjectRetain();
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      if (!v6) {
        goto LABEL_23;
      }
      goto LABEL_5;
    }
  }
  uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_23:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_5:
  unint64_t v7 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_28;
  }
  uint64_t v8 = *(void *)(v3 + 32);
  swift_retain();
  while (*(void *)(v8 + 16) != a1)
  {
    swift_release();
    if (v6 == 1) {
      goto LABEL_23;
    }
    if (v7)
    {
      unint64_t v7 = 1;
      while (1)
      {
        uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        unint64_t v10 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          break;
        }
        uint64_t v8 = v9;
        if (*(void *)(v9 + 16) == a1) {
          goto LABEL_8;
        }
        swift_unknownObjectRelease();
        ++v7;
        if (v10 == v6) {
          goto LABEL_23;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v13 = 5;
      while (1)
      {
        uint64_t v14 = v13 - 3;
        if (__OFADD__(v13 - 4, 1)) {
          break;
        }
        uint64_t v8 = *(void *)(v3 + 8 * v13);
        if (*(void *)(v8 + 16) == a1)
        {
          swift_retain();
          goto LABEL_8;
        }
        ++v13;
        if (v14 == v6) {
          goto LABEL_23;
        }
      }
    }
    __break(1u);
LABEL_28:
    uint64_t v8 = specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
LABEL_8:
  swift_bridgeObjectRelease_n();
  return v8;
}

void *TLV.filterChildren(tag:)(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  else
  {
    sub_100173E6C(*(void *)(v1 + 24), *(void *)(v1 + 32));
    id v5 = sub_1001795C4(v3, v4);
    sub_100173E78(v3, v4);
    uint64_t v6 = *(void *)(v1 + 24);
    unint64_t v7 = *(void *)(v1 + 32);
    *(void *)(v1 + 24) = v5;
    *(void *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_100173E78(v6, v7);
    unint64_t v3 = (unint64_t)v5;
  }
  if (!(v3 >> 62))
  {
    uint64_t v9 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_6;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_18;
  }
LABEL_6:
  if (v9 >= 1)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)(specialized _ArrayBuffer._getElementSlowPath(_:)() + 16) == a1)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)(*(void *)(v3 + 8 * j + 32) + 16) == a1)
        {
          swift_retain();
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
      }
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void *TLV.__allocating_init(tag:BOOLean:)(uint64_t a1, char a2)
{
  sub_100003EB0(&qword_1001D8778);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100186100;
  *(unsigned char *)(v4 + 32) = a2;
  uint64_t v5 = sub_10012CB58(v4);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v5;
  result[4] = v7;
  return result;
}

void *TLV.__allocating_init(tag:uint16:)(uint64_t a1, unsigned int a2)
{
  __int16 v7 = bswap32(a2) >> 16;
  uint64_t v3 = sub_100115354((uint64_t)&v7, (uint64_t)&v8);
  uint64_t v5 = v4;
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

void *TLV.__allocating_init(tag:uint32:)(uint64_t a1, unsigned int a2)
{
  unsigned int v7 = bswap32(a2);
  uint64_t v3 = sub_100115354((uint64_t)&v7, (uint64_t)&v8);
  uint64_t v5 = v4;
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

void *TLV.__allocating_init(tag:uint64:)(uint64_t a1, unint64_t a2)
{
  unint64_t v7 = bswap64(a2);
  uint64_t v3 = sub_100115354((uint64_t)&v7, (uint64_t)&v8);
  uint64_t v5 = v4;
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

uint64_t TLV.uint8Value.getter()
{
  uint64_t v0 = TLV.value.getter();
  unint64_t v2 = v1;
  __int16 v3 = sub_1000D8294(v0, v1);
  sub_100006628(v0, v2);
  return v3 & 0x1FF;
}

uint64_t TLV.uint16Value.getter()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    __int16 v3 = self;
    swift_bridgeObjectRetain();
    id v4 = [v3 outputStreamToMemory];
    [v4 open];
    if (v1 >> 62) {
      goto LABEL_25;
    }
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
    {
LABEL_12:
      sub_100173E78(v1, v2);
      [v4 close];
      if (![v4 propertyForKey:NSStreamDataWrittenToMemoryStreamKey]) {
        goto LABEL_29;
      }
      _bridgeAnyObjectToAny(_:)();

      swift_unknownObjectRelease();
      sub_100006510(&v23, &v24);
      swift_dynamicCast();
      unint64_t v1 = v21;
      unint64_t v2 = v22;
      goto LABEL_14;
    }
LABEL_5:
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
          sub_100173E78(v1, v2);
          if (!v5) {
            goto LABEL_12;
          }
          goto LABEL_5;
        }
      }
      sub_100174088(v8);
      swift_release();
      ++v6;
      if (v10 == v5) {
        goto LABEL_12;
      }
    }
  }
  sub_1000065D0(*(void *)(v0 + 24), *(void *)(v0 + 32));
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_100006628(v1, v2);
      LODWORD(v11) = HIDWORD(v1) - v1;
      if (__OFSUB__(HIDWORD(v1), v1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x100175788);
      }
      uint64_t v11 = (int)v11;
LABEL_19:
      if (v11 == 2)
      {
        uint64_t v14 = TLV.value.getter();
        unint64_t v16 = v15;
        unsigned __int16 v17 = Data.toUInt16(endianness:)(1, v14, v15);
        sub_100006628(v14, v16);
        int v18 = 0;
        int v19 = v17;
      }
      else
      {
LABEL_22:
        int v19 = 0;
        int v18 = 1;
      }
      return v19 | (v18 << 16);
    case 2uLL:
      uint64_t v13 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_100006628(v1, v2);
      uint64_t v11 = v12 - v13;
      if (!__OFSUB__(v12, v13)) {
        goto LABEL_19;
      }
      goto LABEL_28;
    case 3uLL:
      sub_100006628(v1, v2);
      goto LABEL_22;
    default:
      sub_100006628(v1, v2);
      uint64_t v11 = BYTE6(v2);
      goto LABEL_19;
  }
}

unint64_t TLV.uint32Value.getter()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    __int16 v3 = self;
    swift_bridgeObjectRetain();
    id v4 = [v3 outputStreamToMemory];
    [v4 open];
    if (v1 >> 62) {
      goto LABEL_25;
    }
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
    {
LABEL_12:
      sub_100173E78(v1, v2);
      [v4 close];
      if (![v4 propertyForKey:NSStreamDataWrittenToMemoryStreamKey]) {
        goto LABEL_29;
      }
      _bridgeAnyObjectToAny(_:)();

      swift_unknownObjectRelease();
      sub_100006510(&v23, &v24);
      swift_dynamicCast();
      unint64_t v1 = v21;
      unint64_t v2 = v22;
      goto LABEL_14;
    }
LABEL_5:
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
          sub_100173E78(v1, v2);
          if (!v5) {
            goto LABEL_12;
          }
          goto LABEL_5;
        }
      }
      sub_100174088(v8);
      swift_release();
      ++v6;
      if (v10 == v5) {
        goto LABEL_12;
      }
    }
  }
  sub_1000065D0(*(void *)(v0 + 24), *(void *)(v0 + 32));
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_100006628(v1, v2);
      LODWORD(v11) = HIDWORD(v1) - v1;
      if (__OFSUB__(HIDWORD(v1), v1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x100175A74);
      }
      uint64_t v11 = (int)v11;
LABEL_19:
      if (v11 == 4)
      {
        uint64_t v14 = TLV.value.getter();
        unint64_t v16 = v15;
        unsigned int v17 = Data.toUInt32(endianness:)(1, v14, v15);
        sub_100006628(v14, v16);
        unsigned __int8 v18 = 0;
        uint64_t v19 = v17;
      }
      else
      {
LABEL_22:
        uint64_t v19 = 0;
        unsigned __int8 v18 = 1;
      }
      LOBYTE(v24) = v18;
      return v19 | ((unint64_t)v18 << 32);
    case 2uLL:
      uint64_t v13 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_100006628(v1, v2);
      uint64_t v11 = v12 - v13;
      if (!__OFSUB__(v12, v13)) {
        goto LABEL_19;
      }
      goto LABEL_28;
    case 3uLL:
      sub_100006628(v1, v2);
      goto LABEL_22;
    default:
      sub_100006628(v1, v2);
      uint64_t v11 = BYTE6(v2);
      goto LABEL_19;
  }
}

unint64_t TLV.uint64Value.getter()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    __int16 v3 = self;
    swift_bridgeObjectRetain();
    id v4 = [v3 outputStreamToMemory];
    [v4 open];
    if (v1 >> 62) {
      goto LABEL_25;
    }
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
    {
LABEL_12:
      sub_100173E78(v1, v2);
      [v4 close];
      if (![v4 propertyForKey:NSStreamDataWrittenToMemoryStreamKey]) {
        goto LABEL_29;
      }
      _bridgeAnyObjectToAny(_:)();

      swift_unknownObjectRelease();
      sub_100006510(&v21, &v22);
      swift_dynamicCast();
      unint64_t v1 = v19;
      unint64_t v2 = v20;
      goto LABEL_14;
    }
LABEL_5:
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
          sub_100173E78(v1, v2);
          if (!v5) {
            goto LABEL_12;
          }
          goto LABEL_5;
        }
      }
      sub_100174088(v8);
      swift_release();
      ++v6;
      if (v10 == v5) {
        goto LABEL_12;
      }
    }
  }
  sub_1000065D0(*(void *)(v0 + 24), *(void *)(v0 + 32));
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_100006628(v1, v2);
      LODWORD(v11) = HIDWORD(v1) - v1;
      if (__OFSUB__(HIDWORD(v1), v1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x100175D54);
      }
      uint64_t v11 = (int)v11;
LABEL_19:
      if (v11 != 8) {
        return 0;
      }
      uint64_t v14 = TLV.value.getter();
      unint64_t v16 = v15;
      unint64_t v17 = Data.toUInt64(endianness:)(1, v14, v15);
      sub_100006628(v14, v16);
      return v17;
    case 2uLL:
      uint64_t v13 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_100006628(v1, v2);
      uint64_t v11 = v12 - v13;
      if (!__OFSUB__(v12, v13)) {
        goto LABEL_19;
      }
      goto LABEL_28;
    case 3uLL:
      sub_100006628(v1, v2);
      return 0;
    default:
      sub_100006628(v1, v2);
      uint64_t v11 = BYTE6(v2);
      goto LABEL_19;
  }
}

uint64_t sub_100175D64()
{
  type metadata accessor for TLV();
  uint64_t result = swift_initStaticObject();
  static TLV.null = result;
  return result;
}

uint64_t *TLV.null.unsafeMutableAddressor()
{
  if (qword_1001E0818 != -1) {
    swift_once();
  }
  return &static TLV.null;
}

uint64_t static TLV.null.getter()
{
  type metadata accessor for TLV();

  return swift_initStaticObject();
}

void *TLV.__allocating_init<A>(tag:integer:)(uint64_t a1, char *a2, void *a3, uint64_t a4)
{
  uint64_t v80 = a1;
  unint64_t v6 = *(void *)(a4 + 8);
  uint64_t v7 = *(void (**)(void, void))(*(void *)(v6 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = __chkstk_darwin(AssociatedTypeWitness, v9);
  unint64_t v91 = (char *)&v79 - v11;
  uint64_t v84 = *(a3 - 1);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v82 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13, v15);
  CFDataRef v85 = (char *)&v79 - v17;
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v89 = (char *)&v79 - v20;
  uint64_t v22 = __chkstk_darwin(v19, v21);
  long long v24 = (char *)&v79 - v23;
  uint64_t v26 = __chkstk_darwin(v22, v25);
  uint64_t v28 = (char *)&v79 - v27;
  uint64_t v30 = __chkstk_darwin(v26, v29);
  Swift::String v32 = (char *)&v79 - v31;
  __chkstk_darwin(v30, v33);
  CFDataRef v88 = (char *)&v79 - v34;
  char v35 = dispatch thunk of static BinaryInteger.isSigned.getter();
  unint64_t v86 = v7;
  unint64_t v87 = v24;
  uint64_t v90 = AssociatedTypeWitness;
  unint64_t v92 = v32;
  if (v35)
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 64)
    {
      uint64_t v97 = 0;
      sub_100167674();
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      dispatch thunk of static Comparable.< infix(_:_:)();
      (*(void (**)(char *, void *))(v84 + 8))(v32, a3);
    }
    else
    {
      uint64_t v36 = v84;
      (*(void (**)(char *, char *, void *))(v84 + 16))(v32, a2, a3);
      dispatch thunk of BinaryInteger._lowWord.getter();
      (*(void (**)(char *, void *))(v36 + 8))(v32, a3);
    }
  }
  else
  {
    char v37 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v38 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v37)
    {
      if (v38 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
        uint64_t v41 = v92;
        dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
        char v42 = dispatch thunk of static Comparable.< infix(_:_:)();
        uint64_t v43 = v84;
        uint64_t v44 = *(void (**)(char *, void *))(v84 + 8);
        v44(v41, a3);
        (*(void (**)(char *, char *, void *))(v43 + 16))(v28, a2, a3);
        if ((v42 & 1) == 0) {
          dispatch thunk of BinaryInteger._lowWord.getter();
        }
        v44(v28, a3);
        uint64_t v7 = v86;
        long long v24 = v87;
      }
      else
      {
        uint64_t v97 = 0;
        sub_100167674();
        uint64_t v39 = v92;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        dispatch thunk of static Comparable.< infix(_:_:)();
        (*(void (**)(char *, void *))(v84 + 8))(v39, a3);
      }
    }
    else if (v38 < 64)
    {
      uint64_t v40 = v84;
      (*(void (**)(char *, char *, void *))(v84 + 16))(v92, a2, a3);
      dispatch thunk of BinaryInteger._lowWord.getter();
      (*(void (**)(char *, void *))(v40 + 8))(v92, a3);
    }
  }
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v47 = v84 + 16;
  uint64_t v46 = *(void (**)(char *, char *, void *))(v84 + 16);
  uint64_t v79 = a2;
  uint64_t v83 = v46;
  v46(v24, a2, a3);
  uint64_t v93 = (void **)(v47 - 8);
  uint64_t v84 = v47;
  uint64_t v81 = (void (**)(char *, char *, void *))(v47 + 16);
  uint64_t v48 = _swiftEmptyArrayStorage;
  uint64_t v94 = AssociatedConformanceWitness;
  do
  {
    os_log_type_t v95 = v48;
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
    uint64_t v49 = v92;
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
    uint64_t v50 = (void (*)(uint64_t, void *))v7;
    uint64_t v51 = v89;
    dispatch thunk of static BinaryInteger.& infix(_:_:)();
    char v52 = (char)v93;
    uint64_t v48 = *v93;
    ((void (*)(char *, void *))*v93)(v49, a3);
    if (dispatch thunk of static BinaryInteger.isSigned.getter())
    {
      dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
      dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
      int64_t v53 = dispatch thunk of static Comparable.>= infix(_:_:)();
      ((void (*)(char *, void *))v48)(v49, a3);
      if ((v53 & 1) == 0)
      {
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
    }
    char v96 = (void (*)(char *, void *))v48;
    if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 8)
    {
      v83(v85, v51, a3);
      LOBYTE(v97) = -1;
      char v55 = dispatch thunk of static BinaryInteger.isSigned.getter();
      uint64_t v56 = dispatch thunk of BinaryInteger.bitWidth.getter();
      if (v55)
      {
        char v52 = (char)v93;
        if (v56 <= 8)
        {
          dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
          uint64_t v57 = v92;
          dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
          uint64_t v58 = v85;
          char v59 = dispatch thunk of static Comparable.> infix(_:_:)();
          size_t v60 = a3;
          uint64_t v48 = a3;
          double v61 = v96;
          v96(v57, v60);
          unsigned int v62 = v97;
          char v63 = v52;
          uint64_t v64 = v82;
          (*v81)(v82, v58, v48);
          if (v59)
          {
            int64_t v53 = dispatch thunk of BinaryInteger._lowWord.getter();
            v61(v64, v48);
            uint64_t v51 = v89;
            char v52 = v63;
            a3 = v48;
            if (v62 < v53) {
              goto LABEL_39;
            }
          }
          else
          {
            v61(v64, v48);
            uint64_t v51 = v89;
            a3 = v48;
          }
          goto LABEL_28;
        }
LABEL_23:
        sub_100112D10();
        uint64_t v65 = v92;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        os_log_type_t v66 = v85;
        int64_t v53 = dispatch thunk of static Comparable.< infix(_:_:)();
        BOOL v67 = v65;
        uint64_t v68 = v96;
        v96(v67, a3);
        v68(v66, a3);
        if (v53) {
          goto LABEL_39;
        }
        goto LABEL_28;
      }
      char v52 = (char)v93;
      if (v56 >= 9) {
        goto LABEL_23;
      }
      unint64_t v69 = v85;
      int64_t v53 = dispatch thunk of BinaryInteger._lowWord.getter();
      v96(v69, a3);
      unint64_t v54 = v97;
      if (v97 < v53) {
        goto LABEL_39;
      }
    }
LABEL_28:
    char v70 = dispatch thunk of BinaryInteger._lowWord.getter();
    uint64_t v50 = (void (*)(uint64_t, void *))v96;
    v96(v51, a3);
    uint64_t v48 = v95;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v48 = sub_10015A690(0, v48[2] + 1, 1, v48);
    }
    unint64_t v72 = v48[2];
    unint64_t v71 = v48[3];
    if (v72 >= v71 >> 1) {
      uint64_t v48 = sub_10015A690((void *)(v71 > 1), v72 + 1, 1, v48);
    }
    v48[2] = v72 + 1;
    *((unsigned char *)v48 + v72 + 32) = v70;
    uint64_t v97 = 8;
    sub_100167674();
    char v52 = (char)v87;
    dispatch thunk of static BinaryInteger.>>= infix<A>(_:_:)();
    char v73 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v7 = v86;
  }
  while ((v73 & 1) == 0);
  int64_t v53 = (int64_t)v88;
  int v74 = dispatch thunk of BinaryInteger._lowWord.getter();
  unint64_t v6 = v48[2];
  if (!v6)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    uint64_t v48 = sub_10015A690((void *)(v54 > 1), v53, 1, v48);
    goto LABEL_36;
  }
  char v52 = v74;
  if (((*((unsigned __int8 *)v48 + v6 + 31) ^ v74) & 0x80) == 0) {
    goto LABEL_37;
  }
  unint64_t v54 = v48[3];
  int64_t v53 = v6 + 1;
  if (v6 >= v54 >> 1) {
    goto LABEL_41;
  }
LABEL_36:
  v48[2] = v53;
  *((unsigned char *)v48 + v6 + 32) = v52;
LABEL_37:
  uint64_t v75 = sub_10016F268((uint64_t)v48);
  uint64_t v77 = v76;
  v50((uint64_t)v79, a3);
  v50((uint64_t)v87, a3);
  v50((uint64_t)v88, a3);
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v80;
  result[3] = v75;
  result[4] = v77;
  return result;
}

void *TLV.__allocating_init(tag:bitString:)(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  sub_100003EB0(&qword_1001D8778);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100186100;
  *(unsigned char *)(v8 + 32) = a4;
  uint64_t v9 = sub_10012CB58(v8);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  sub_1000065D0(a2, a3);
  sub_1000065D0(v9, v11);
  sub_100147328(a2, a3);
  sub_100006628(a2, a3);
  sub_100006628(v9, v11);
  sub_100006628(a2, a3);
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v9;
  result[4] = v11;
  return result;
}

void *TLV.__allocating_init(tag:oid:)(uint64_t a1, void *a2)
{
  uint64_t v3 = OID.derRepresentation.getter(a2);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

void *TLV.__allocating_init(tag:string:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  unint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter();
  uint64_t v7 = String.data(using:allowLossyConversion:)();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t result = (void *)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  if (v9 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for TLV();
    uint64_t result = (void *)swift_allocObject();
    result[2] = a1;
    result[3] = v7;
    result[4] = v9;
  }
  return result;
}

BOOL TLV.isNull.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_1000065D0(*(void *)(v0 + 24), *(void *)(v0 + 32));
    goto LABEL_14;
  }
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  id v4 = [v3 outputStreamToMemory];
  [v4 open];
  if ((unint64_t)v1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
LABEL_5:
    uint64_t v6 = 4;
    do
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        unint64_t v8 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_20;
        }
      }
      else
      {
        unint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_20:
          __break(1u);
LABEL_21:
          swift_bridgeObjectRetain();
          uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
          sub_100173E78(v1, v2);
          if (!v5) {
            break;
          }
          goto LABEL_5;
        }
      }
      sub_100174088(v8);
      swift_release();
      ++v6;
    }
    while (v10 != v5);
  }
  sub_100173E78(v1, v2);
  [v4 close];
  if (![v4 propertyForKey:NSStreamDataWrittenToMemoryStreamKey])
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
    JUMPOUT(0x100176E08);
  }
  _bridgeAnyObjectToAny(_:)();

  swift_unknownObjectRelease();
  sub_100006510(&v16, &v17);
  swift_dynamicCast();
  uint64_t v1 = v14;
  unint64_t v2 = v15;
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_100006628(v1, v2);
      uint64_t v11 = (int)v1;
      uint64_t v12 = v1 >> 32;
      break;
    case 2uLL:
      uint64_t v11 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_100006628(v1, v2);
      break;
    case 3uLL:
      sub_100006628(v1, v2);
      uint64_t v12 = 0;
      uint64_t v11 = 0;
      break;
    default:
      sub_100006628(v1, v2);
      uint64_t v11 = 0;
      uint64_t v12 = BYTE6(v2);
      break;
  }
  return v11 == v12;
}

uint64_t TLV.BOOLeanValue.getter()
{
  uint64_t v0 = TLV.value.getter();
  unint64_t v2 = v1;
  __int16 v3 = sub_1000D8294(v0, v1);
  sub_100006628(v0, v2);
  if ((v3 & 0x100) != 0) {
    return 2;
  }
  else {
    return v3 != 0;
  }
}

uint64_t TLV.integerValue.getter()
{
  uint64_t v0 = type metadata accessor for Data.Iterator();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  id v4 = &v23[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = TLV.value.getter();
  unint64_t v7 = v6;
  __int16 v8 = sub_1000D8294(v5, v6);
  sub_100006628(v5, v7);
  if ((v8 & 0x100) != 0) {
    return 0;
  }
  unint64_t v9 = TLV.value.getter();
  int v11 = v9;
  unsigned __int8 v12 = BYTE6(v10);
  switch(v10 >> 62)
  {
    case 1uLL:
      unint64_t v14 = HIDWORD(v9);
      sub_100006628(v9, v10);
      LODWORD(v13) = v14 - v11;
      if (__OFSUB__(v14, v11))
      {
        __break(1u);
LABEL_17:
        __break(1u);
        JUMPOUT(0x100177124);
      }
      uint64_t v13 = (int)v13;
LABEL_7:
      if (v13 > 7) {
        return 0;
      }
LABEL_10:
      uint64_t v18 = TLV.value.getter();
      uint64_t v17 = (uint64_t)(__int16)(v8 << 8) >> 15;
      uint64_t v20 = v18;
      unint64_t v21 = v19;
      switch(v19 >> 62)
      {
        case 1uLL:
        case 2uLL:
          sub_1000065D0(v18, v19);
          sub_1000065D0(v20, v21);
          break;
        default:
          break;
      }
      Data.Iterator.init(_:at:)();
      sub_100006628(v20, v21);
      sub_100179968((unint64_t *)&qword_1001DDF10, 255, (void (*)(uint64_t))&type metadata accessor for Data.Iterator);
      dispatch thunk of IteratorProtocol.next()();
      if ((v24 & 1) == 0)
      {
        do
        {
          uint64_t v17 = v23[14] | (unint64_t)(v17 << 8);
          dispatch thunk of IteratorProtocol.next()();
        }
        while (v24 != 1);
      }
      (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v4, v0);
      sub_100006628(v20, v21);
      break;
    case 2uLL:
      uint64_t v16 = *(void *)(v9 + 16);
      uint64_t v15 = *(void *)(v9 + 24);
      sub_100006628(v9, v10);
      uint64_t v13 = v15 - v16;
      if (!__OFSUB__(v15, v16)) {
        goto LABEL_7;
      }
      goto LABEL_17;
    case 3uLL:
      sub_100006628(v9, v10);
      goto LABEL_10;
    default:
      sub_100006628(v9, v10);
      uint64_t v13 = v12;
      goto LABEL_7;
  }
  return v17;
}

uint64_t TLV.bitStringValue.getter()
{
  uint64_t v0 = TLV.value.getter();

  return _s7SPRBase9BitStringV17derRepresentationACSg10Foundation4DataV_tcfC_0(v0, v1);
}

uint64_t TLV.oidValue.getter()
{
  uint64_t v0 = TLV.value.getter();

  return _s7SPRBase3OIDV17derRepresentationACSg10Foundation4DataV_tcfC_0(v0, v1);
}

uint64_t TLV.stringValue.getter()
{
  uint64_t v0 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v2 = TLV.value.getter();
  unint64_t v4 = v3;
  static String.Encoding.utf8.getter();
  uint64_t v5 = String.init(data:encoding:)();
  sub_100006628(v2, v4);
  return v5;
}

uint64_t TLV.deinit()
{
  sub_100173E78(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return v0;
}

uint64_t TLV.__deallocating_deinit()
{
  sub_100173E78(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return swift_deallocClassInstance();
}

Swift::Int TLV.hashValue.getter()
{
  Hasher.init(_seed:)();
  TLV.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_1001772D8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 16) != *(void *)(*(void *)a2 + 16)) {
    return 0;
  }
  uint64_t v2 = TLV.value.getter();
  unint64_t v4 = v3;
  uint64_t v5 = TLV.value.getter();
  unint64_t v7 = v6;
  char v8 = sub_10014C798(v2, v4, v5, v6);
  sub_100006628(v5, v7);
  sub_100006628(v2, v4);
  return v8 & 1;
}

Swift::Int sub_100177374()
{
  Hasher.init(_seed:)();
  TLV.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_1001773B8(uint64_t a1)
{
  return TLV.hash(into:)(a1);
}

Swift::Int sub_1001773DC()
{
  Hasher.init(_seed:)();
  TLV.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_10017741C()
{
  return TLV.debugDescription.getter();
}

uint64_t Collection<>.dataRepresentation.getter()
{
  Sequence.reduce<A>(into:_:)();
  return v1;
}

uint64_t sub_1001774AC()
{
  uint64_t v0 = TLV.dataRepresentation.getter();
  unint64_t v2 = v1;
  Data.append(_:)();
  return sub_100006628(v0, v2);
}

uint64_t Collection<>.first(tag:)()
{
  Sequence.first(where:)();
  return v1;
}

uint64_t Collection<>.filter(tag:)(uint64_t a1, uint64_t a2)
{
  __chkstk_darwin(a1, a2);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(&v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v2, a2);
  uint64_t v9 = a1;
  return Sequence.filter(_:)();
}

uint64_t IteratorProtocol<>.next(tag:)(uint64_t a1)
{
  dispatch thunk of IteratorProtocol.next()();
  uint64_t result = v4;
  if (v4)
  {
    if (*(void *)(v4 + 16) == a1) {
      return result;
    }
    swift_release();
  }
  sub_1001738E4();
  swift_allocError();
  *unint64_t v3 = 3;
  return swift_willThrow();
}

uint64_t IteratorProtocol<>.nextValue(tag:)(uint64_t a1)
{
  uint64_t result = IteratorProtocol<>.next(tag:)(a1);
  if (!v1)
  {
    uint64_t v3 = TLV.value.getter();
    swift_release();
    return v3;
  }
  return result;
}

uint64_t IteratorProtocol<>.nextUInt8(tag:)(uint64_t a1)
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v1)
  {
    uint64_t v3 = TLV.value.getter();
    unint64_t v5 = v4;
    uint64_t v2 = sub_1000D8294(v3, v4);
    sub_100006628(v3, v5);
    swift_release();
    if ((v2 & 0x100) != 0)
    {
      sub_1001738E4();
      swift_allocError();
      *uint64_t v6 = 4;
      swift_willThrow();
    }
  }
  return v2;
}

uint64_t IteratorProtocol<>.nextUInt16(tag:)(uint64_t a1)
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v2)
  {
    uint64_t v1 = TLV.uint16Value.getter();
    swift_release();
    if ((v1 & 0x10000) != 0)
    {
      sub_1001738E4();
      swift_allocError();
      *uint64_t v3 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

unint64_t IteratorProtocol<>.nextUInt32(tag:)(uint64_t a1)
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v2)
  {
    unint64_t v1 = TLV.uint32Value.getter();
    swift_release();
    if ((v1 & 0x100000000) != 0)
    {
      sub_1001738E4();
      swift_allocError();
      *uint64_t v3 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t IteratorProtocol<>.nextUInt64(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100177B8C(a1, a2, a3, (uint64_t (*)(void))TLV.uint64Value.getter);
}

char *IteratorProtocol<>.nextString(tag:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  IteratorProtocol<>.next(tag:)(a1);
  if (!v1)
  {
    uint64_t v7 = TLV.value.getter();
    unint64_t v9 = v8;
    static String.Encoding.utf8.getter();
    uint64_t v6 = (char *)String.init(data:encoding:)();
    uint64_t v11 = v10;
    sub_100006628(v7, v9);
    swift_release();
    if (!v11)
    {
      sub_1001738E4();
      swift_allocError();
      unsigned char *v13 = 4;
      swift_willThrow();
    }
  }
  return v6;
}

uint64_t IteratorProtocol<>.nextNull(tag:)(uint64_t a1)
{
  uint64_t result = IteratorProtocol<>.next(tag:)(a1);
  if (!v1)
  {
    BOOL v3 = TLV.isNull.getter();
    uint64_t result = swift_release();
    if (!v3)
    {
      sub_1001738E4();
      swift_allocError();
      *uint64_t v4 = 4;
      return swift_willThrow();
    }
  }
  return result;
}

BOOL IteratorProtocol<>.nextBoolean(tag:)(uint64_t a1)
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v1)
  {
    uint64_t v3 = TLV.value.getter();
    unint64_t v5 = v4;
    __int16 v6 = sub_1000D8294(v3, v4);
    sub_100006628(v3, v5);
    swift_release();
    if ((v6 & 0x100) != 0)
    {
      sub_1001738E4();
      swift_allocError();
      *uint64_t v7 = 4;
      swift_willThrow();
    }
    else
    {
      return v6 != 0;
    }
  }
  return v2;
}

uint64_t IteratorProtocol<>.nextInteger(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100177B8C(a1, a2, a3, TLV.integerValue.getter);
}

uint64_t sub_100177B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v5)
  {
    uint64_t v4 = a4();
    char v8 = v7;
    swift_release();
    if (v8)
    {
      sub_1001738E4();
      swift_allocError();
      *unint64_t v9 = 4;
      swift_willThrow();
    }
  }
  return v4;
}

uint64_t IteratorProtocol<>.nextBitString(tag:)(uint64_t a1)
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v2)
  {
    uint64_t v3 = TLV.value.getter();
    uint64_t v1 = _s7SPRBase9BitStringV17derRepresentationACSg10Foundation4DataV_tcfC_0(v3, v4);
    unint64_t v6 = v5;
    swift_release();
    if (v6 >> 60 == 15)
    {
      sub_1001738E4();
      swift_allocError();
      *char v7 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t IteratorProtocol<>.nextOctetString(tag:)(uint64_t a1)
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v2)
  {
    uint64_t v1 = TLV.value.getter();
    unint64_t v4 = v3;
    swift_release();
    if (v4 >> 60 == 15)
    {
      sub_1001738E4();
      swift_allocError();
      *unint64_t v5 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t IteratorProtocol<>.nextOID(tag:)(uint64_t a1)
{
  IteratorProtocol<>.next(tag:)(a1);
  if (!v1)
  {
    uint64_t v3 = TLV.value.getter();
    uint64_t v2 = _s7SPRBase3OIDV17derRepresentationACSg10Foundation4DataV_tcfC_0(v3, v4);
    swift_release();
    if (!v2)
    {
      sub_1001738E4();
      swift_allocError();
      *unint64_t v6 = 4;
      swift_willThrow();
    }
  }
  return v2;
}

uint64_t IteratorProtocol<>.nextConstructed(tag:)(uint64_t a1)
{
  uint64_t v3 = IteratorProtocol<>.next(tag:)(a1);
  if (!v1)
  {
    uint64_t v4 = v3;
    uint64_t v2 = *(void *)(v3 + 24);
    unint64_t v5 = *(void *)(v3 + 32);
    if ((v5 & 0x2000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_1000065D0(*(void *)(v3 + 24), v5);
      id v6 = sub_1001795C4(v2, v5);
      sub_100173E78(v2, v5);
      uint64_t v7 = *(void *)(v4 + 24);
      unint64_t v8 = *(void *)(v4 + 32);
      *(void *)(v4 + 24) = v6;
      *(void *)(v4 + 32) = 0x2000000000000000;
      swift_bridgeObjectRetain();
      sub_100173E78(v7, v8);
      uint64_t v2 = (uint64_t)v6;
    }
    swift_release();
  }
  return v2;
}

uint64_t SHA256.update(tlv:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  unint64_t v1 = *(void *)(a1 + 32);
  if ((v1 & 0x2000000000000000) != 0)
  {
    if ((unint64_t)v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      if (!v3) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v3) {
        goto LABEL_15;
      }
    }
    if (v3 < 1)
    {
      __break(1u);
LABEL_22:
      __break(1u);
    }
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v5 = *(void *)(v2 + 8 * i + 32);
        swift_retain();
      }
      SHA256.update(tlv:)(v5);
      swift_release();
    }
  }
  else
  {
    switch(v1 >> 62)
    {
      case 1uLL:
        if (v2 >> 32 < (int)v2) {
          goto LABEL_22;
        }
        sub_1000065D0(*(void *)(a1 + 24), v1);
        sub_1000065D0(v2, v1);
        sub_10012B4BC((int)v2, v2 >> 32);
LABEL_14:
        sub_100173E78(v2, v1);
        break;
      case 2uLL:
        uint64_t v6 = *(void *)(v2 + 16);
        uint64_t v7 = *(void *)(v2 + 24);
        sub_100173E6C(*(void *)(a1 + 24), v1);
        sub_100173E6C(v2, v1);
        swift_retain();
        swift_retain();
        sub_10012B4BC(v6, v7);
        swift_release();
        swift_release();
        goto LABEL_14;
      default:
        type metadata accessor for SHA256();
        sub_100179968(&qword_1001DCDE8, 255, (void (*)(uint64_t))&type metadata accessor for SHA256);
        dispatch thunk of HashFunction.update(bufferPointer:)();
        sub_100173E78(v2, v1);
        return sub_100173E78(v2, v1);
    }
  }
LABEL_15:

  return sub_100173E78(v2, v1);
}

uint64_t sub_100178244(unint64_t a1)
{
  uint64_t v3 = type metadata accessor for CocoaError.Code();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v5 = type metadata accessor for CocoaError();
  uint64_t v6 = *(void *)(v5 - 8);
  double v8 = __chkstk_darwin(v5, v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    unint64_t v16 = bswap64(a1);
    uint64_t v11 = sub_10017B9F4(__clz(a1) >> 3, (uint64_t)&v16, (uint64_t)&v17);
    return (uint64_t)sub_100179004(v11, v12, v13, v14);
  }
  LOBYTE(v16) = 0;
  uint64_t result = (uint64_t)[v1 write:&v16 maxLength:1];
  if (result < 0)
  {
    uint64_t result = (uint64_t)[v1 streamError];
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (result == 1) {
      return result;
    }
    static CocoaError.Code.fileWriteOutOfSpace.getter();
    sub_1000E9D34((uint64_t)_swiftEmptyArrayStorage);
    sub_100179968((unint64_t *)&qword_1001DE298, 255, (void (*)(uint64_t))&type metadata accessor for CocoaError);
    _BridgedStoredNSError.init(_:userInfo:)();
    CocoaError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  return swift_willThrow();
}

uint64_t sub_100178490(unint64_t a1)
{
  if (a1)
  {
    unint64_t v15 = bswap64(a1);
    uint64_t v1 = sub_10017B9F4(__clz(a1) >> 3, (uint64_t)&v15, (uint64_t)v16);
    uint64_t v3 = v2;
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    swift_beginAccess();
    uint64_t v8 = sub_100003EB0(&qword_1001E0AB8);
    uint64_t v18 = (void *)v8;
    unint64_t v19 = (void *)sub_1001798EC();
    uint64_t v9 = (void *)swift_allocObject();
    v17[0] = v9;
    v9[2] = v1;
    v9[3] = v3;
    v9[4] = v5;
    v9[5] = v7;
    uint64_t v10 = sub_100006788(v17, v8);
    __chkstk_darwin(v10, v11);
    long long v13 = v12[1];
    v16[0] = *v12;
    v16[1] = v13;
    Slice<>.withUnsafeBytes<A>(_:)();
    sub_100006520((uint64_t)v17);
  }
  else
  {
    char v20 = 0;
    swift_beginAccess();
    uint64_t v18 = &type metadata for UnsafeRawBufferPointer;
    unint64_t v19 = &protocol witness table for UnsafeRawBufferPointer;
    v17[0] = &v20;
    v17[1] = v21;
    sub_100006788(v17, (uint64_t)&type metadata for UnsafeRawBufferPointer);
    Data._Representation.append(contentsOf:)();
    sub_100006520((uint64_t)v17);
  }
  return swift_endAccess();
}

char *sub_100178678(uint64_t a1)
{
  if (a1 > 127)
  {
    unint64_t v4 = __clz(a1) >> 3;
    uint64_t result = (char *)sub_100178974(-120 - v4);
    if (!v1)
    {
      unint64_t v9 = bswap64(a1);
      uint64_t v5 = sub_10017B9F4(v4, (uint64_t)&v9, (uint64_t)&v10);
      return sub_100179004(v5, v6, v7, v8);
    }
  }
  else
  {
    if (a1 < 0) {
      __break(1u);
    }
    return (char *)sub_100178974(a1);
  }
  return result;
}

uint64_t sub_100178738(int64_t a1)
{
  if (a1 > 127)
  {
    unint64_t v2 = __clz(a1) >> 3;
    LOBYTE(v18[0]) = -120 - v2;
    swift_beginAccess();
    unint64_t v21 = &type metadata for UnsafeRawBufferPointer;
    uint64_t v22 = &protocol witness table for UnsafeRawBufferPointer;
    unint64_t v19 = (char *)v18;
    char v20 = (char *)v18 + 1;
    sub_100006788(&v19, (uint64_t)&type metadata for UnsafeRawBufferPointer);
    Data._Representation.append(contentsOf:)();
    sub_100006520((uint64_t)&v19);
    unint64_t v17 = bswap64(a1);
    uint64_t v3 = sub_10017B9F4(v2, (uint64_t)&v17, (uint64_t)v18);
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v10 = sub_100003EB0(&qword_1001E0AB8);
    unint64_t v21 = (void *)v10;
    uint64_t v22 = (void *)sub_1001798EC();
    uint64_t v11 = (char *)swift_allocObject();
    unint64_t v19 = v11;
    *((void *)v11 + 2) = v3;
    *((void *)v11 + 3) = v5;
    *((void *)v11 + 4) = v7;
    *((void *)v11 + 5) = v9;
    uint64_t v12 = sub_100006788(&v19, v10);
    __chkstk_darwin(v12, v13);
    long long v15 = v14[1];
    v18[0] = *v14;
    v18[1] = v15;
    Slice<>.withUnsafeBytes<A>(_:)();
    sub_100006520((uint64_t)&v19);
  }
  else
  {
    if (a1 < 0) {
      __break(1u);
    }
    char v23 = a1;
    swift_beginAccess();
    unint64_t v21 = &type metadata for UnsafeRawBufferPointer;
    uint64_t v22 = &protocol witness table for UnsafeRawBufferPointer;
    unint64_t v19 = &v23;
    char v20 = v24;
    sub_100006788(&v19, (uint64_t)&type metadata for UnsafeRawBufferPointer);
    Data._Representation.append(contentsOf:)();
    sub_100006520((uint64_t)&v19);
  }
  return swift_endAccess();
}

uint64_t sub_100178974(char a1)
{
  uint64_t v3 = type metadata accessor for CocoaError.Code();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v5 = type metadata accessor for CocoaError();
  uint64_t v6 = *(void *)(v5 - 8);
  double v8 = __chkstk_darwin(v5, v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  HIBYTE(v12) = a1;
  uint64_t result = (uint64_t)[v1 write:((char *)&v12 + 7) maxLength:1, v8];
  if (result < 0)
  {
    uint64_t result = (uint64_t)[v1 streamError];
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (result == 1) {
      return result;
    }
    static CocoaError.Code.fileWriteOutOfSpace.getter();
    sub_1000E9D34((uint64_t)_swiftEmptyArrayStorage);
    sub_100179968((unint64_t *)&qword_1001DE298, 255, (void (*)(uint64_t))&type metadata accessor for CocoaError);
    _BridgedStoredNSError.init(_:userInfo:)();
    CocoaError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  return swift_willThrow();
}

uint64_t sub_100178B90(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = type metadata accessor for CocoaError.Code();
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for CocoaError();
  id v11 = *(id *)(v10 - 8);
  double v13 = __chkstk_darwin(v10, v12);
  long long v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v9;
  switch(a2 >> 62)
  {
    case 1uLL:
      id v28 = v11;
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
LABEL_23:
        __break(1u);
      }
      uint64_t v27 = v10;
      uint64_t v9 = v2;
      sub_1000065D0(a1, a2);
      uint64_t v26 = sub_10017952C((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (void *)v9);
      if (v3) {
        goto LABEL_26;
      }
      unint64_t v17 = (unint64_t)v26;

      uint64_t v10 = v27;
      id v11 = v28;
      if ((v17 & 0x8000000000000000) != 0)
      {
LABEL_19:
        if ([v2 streamError])
        {
          swift_willThrow();
          return sub_100006628(a1, a2);
        }
        __break(1u);
LABEL_25:
        swift_release();
        swift_release();

        __break(1u);
LABEL_26:

        __break(1u);
        JUMPOUT(0x100178FF4);
      }
      uint64_t result = sub_100006628(a1, a2);
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_23;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_17:
      if (v17 != v9)
      {
LABEL_18:
        static CocoaError.Code.fileWriteOutOfSpace.getter();
        sub_1000E9D34((uint64_t)_swiftEmptyArrayStorage);
        sub_100179968((unint64_t *)&qword_1001DE298, 255, (void (*)(uint64_t))&type metadata accessor for CocoaError);
        _BridgedStoredNSError.init(_:userInfo:)();
        CocoaError._nsError.getter();
        (*((void (**)(char *, uint64_t))v11 + 1))(v15, v10);
        return swift_willThrow();
      }
      return result;
    case 2uLL:
      uint64_t v27 = v10;
      id v28 = v11;
      uint64_t v9 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v20 = *(void *)(a1 + 16);
      uint64_t v19 = *(void *)(a1 + 24);
      id v11 = v2;
      sub_1000065D0(a1, a2);
      swift_retain();
      swift_retain();
      unint64_t v21 = sub_10017952C(v20, v19, a2 & 0x3FFFFFFFFFFFFFFFLL, v11);
      if (v3) {
        goto LABEL_25;
      }
      unint64_t v17 = (unint64_t)v21;
      swift_release();
      swift_release();

      uint64_t v10 = v27;
      id v11 = v28;
      if ((v17 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      uint64_t result = sub_100006628(a1, a2);
      uint64_t v23 = *(void *)(a1 + 16);
      uint64_t v22 = *(void *)(a1 + 24);
      uint64_t v9 = v22 - v23;
      if (!__OFSUB__(v22, v23)) {
        goto LABEL_17;
      }
      __break(1u);
LABEL_9:
      memset(v30, 0, 14);
      unint64_t v24 = (unint64_t)[v2 write:v30 maxLength:0];
      if ((v24 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      unint64_t v25 = v24;
      uint64_t result = sub_100006628(a1, a2);
      if (!v25) {
        return result;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_9;
    default:
      v30[0] = a1;
      LOWORD(v30[1]) = a2;
      BYTE2(v30[1]) = BYTE2(a2);
      BYTE3(v30[1]) = BYTE3(a2);
      BYTE4(v30[1]) = BYTE4(a2);
      uint64_t v9 = BYTE6(a2);
      BYTE5(v30[1]) = BYTE5(a2);
      unint64_t v16 = (unint64_t)[v2 write:v30 maxLength:BYTE6(a2) v13];
      if ((v16 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      unint64_t v17 = v16;
      uint64_t result = sub_100006628(a1, a2);
      goto LABEL_17;
  }
}

char *sub_100179004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for CocoaError.Code();
  __chkstk_darwin(v10 - 8, v11);
  id v28 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for CocoaError();
  uint64_t v29 = *(void *)(v13 - 8);
  uint64_t v30 = v13;
  __chkstk_darwin(v13, v14);
  uint64_t v27 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  *(void *)&long long v36 = a1;
  *((void *)&v36 + 1) = a2;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  *(void *)&long long v37 = a3;
  *((void *)&v37 + 1) = a4;
  sub_100003EB0(&qword_1001E0AB8);
  sub_1000E9CE0();
  uint64_t result = (char *)Slice<>.regions.getter();
  uint64_t v18 = *((void *)result + 2);
  char v35 = result;
  uint64_t v19 = 0;
  if (v18)
  {
    uint64_t v20 = result + 48;
    while (1)
    {
      *(double *)&long long v21 = __chkstk_darwin(result, v17);
      *(&v26 - 2) = (uint64_t)v5;
      long long v36 = v21;
      long long v37 = v22;
      uint64_t result = (char *)Slice<>.withUnsafeBytes<A>(_:)();
      if (v38 < 0) {
        break;
      }
      BOOL v23 = __OFADD__(v19, v38);
      v19 += v38;
      if (v23)
      {
        __break(1u);
        goto LABEL_12;
      }
      v20 += 32;
      if (!--v18) {
        goto LABEL_6;
      }
    }
    uint64_t result = (char *)[v5 streamError];
    if (result)
    {
      swift_willThrow();
      return (char *)swift_bridgeObjectRelease();
    }
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t result = (char *)sub_10017C5EC(v31, v32, v33, v34);
    if (v19 != result)
    {
      static CocoaError.Code.fileWriteOutOfSpace.getter();
      sub_1000E9D34((uint64_t)_swiftEmptyArrayStorage);
      sub_100179968((unint64_t *)&qword_1001DE298, 255, (void (*)(uint64_t))&type metadata accessor for CocoaError);
      unint64_t v24 = v27;
      uint64_t v25 = v30;
      _BridgedStoredNSError.init(_:userInfo:)();
      CocoaError._nsError.getter();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v25);
      return (char *)swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_1001792FC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_1000065D0(a1, a2);
      char v5 = sub_10014C6E0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_100006628(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_10014C6E0(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_100006628(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_100161604((uint64_t)__s1, a3, a4, &v14);
      sub_100006628(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

char *sub_10017952C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = (char *)__DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
    v8 += a1 - (void)result;
  }
  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (char *)__DataStorage._length.getter();
  if (!v8)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if ((uint64_t)result >= v10) {
    id v11 = (id)v10;
  }
  else {
    id v11 = result;
  }
  return (char *)[a4 write:v8 maxLength:v11];
}

id sub_1001795C4(uint64_t a1, unint64_t a2)
{
  unint64_t v22 = (unint64_t)_swiftEmptyArrayStorage;
  id v5 = objc_allocWithZone((Class)NSInputStream);
  sub_1000065D0(a1, a2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v7 = [v5 initWithData:isa];
  sub_100006628(a1, a2);

  [v7 open];
  while (1)
  {
    unsigned __int8 v21 = 0;
    id v8 = [v7 read:&v21 maxLength:1];
    if (v8 != (id)1)
    {
      if (v8 == (id)-1)
      {
        if ([v7 streamError]) {
          goto LABEL_18;
        }
        __break(1u);
      }
      [v7 close];

      return (id)v22;
    }
    unint64_t v9 = v21;
    if ((~v21 & 0x1F) == 0) {
      break;
    }
    unint64_t v11 = v21;
LABEL_8:
    id v12 = sub_100173938();
    if (v2) {
      goto LABEL_19;
    }
    if (v13) {
      goto LABEL_17;
    }
    id v14 = NSInputStream.read(exactly:)((uint64_t)v12);
    unint64_t v16 = v15;
    if (v15 >> 60 == 15) {
      goto LABEL_17;
    }
    id v17 = v14;
    type metadata accessor for TLV();
    uint64_t v18 = (void *)swift_allocObject();
    _OWORD v18[2] = v11;
    v18[3] = v17;
    v18[4] = v16;
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_release();
  }
  while (1)
  {
    unsigned __int8 v21 = 0;
    id v10 = [v7 read:&v21 maxLength:1];
    if (v10 != (id)1) {
      break;
    }
    unint64_t v11 = v21 | (v9 << 8);
    unint64_t v9 = v11;
    if (((char)v21 & 0x80000000) == 0) {
      goto LABEL_8;
    }
  }
  if (v10 != (id)-1)
  {
LABEL_17:
    sub_1001738E4();
    swift_allocError();
    *uint64_t v20 = 0;
LABEL_18:
    swift_willThrow();
LABEL_19:

    return (id)swift_bridgeObjectRelease();
  }
  id result = [v7 streamError];
  if (result) {
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

BOOL sub_10017988C(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 16) == *(void *)(v1 + 16);
}

uint64_t sub_1001798A4(uint64_t a1, uint64_t a2)
{
  return sub_100179968(&qword_1001E0938, a2, (void (*)(uint64_t))type metadata accessor for TLV);
}

unint64_t sub_1001798EC()
{
  unint64_t result = qword_1001E0AC0;
  if (!qword_1001E0AC0)
  {
    sub_100003EF4(&qword_1001E0AB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0AC0);
  }
  return result;
}

uint64_t sub_100179958()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100179968(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1001799B0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_10017E5A4(*(id *)(v3 + 16), a1, a2, a3);
}

uint64_t sub_1001799CC()
{
  return sub_100170A54();
}

BOOL sub_1001799E4(uint64_t a1)
{
  return sub_10017988C(a1);
}

uint64_t sub_100179A00(uint64_t a1, uint64_t a2)
{
  return sub_100172228(a1, a2);
}

void *DERReader.readDERTag()(uint64_t a1, uint64_t a2)
{
  void *(*v5)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v6;
  unint64_t v7;
  void *result;
  unint64_t v9;
  unsigned char *v10;
  uint64_t v11;

  id v5 = *(void *(**)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(a2 + 8);
  uint64_t v6 = sub_100179B70();
  id v7 = sub_10002C874();
  uint64_t result = v5((uint64_t *)((char *)&v11 + 2), &type metadata for UInt8, &type metadata for UInt8, v6, v7, a1, a2);
  if (!v2)
  {
    if ((v11 & 0x1000000) != 0)
    {
      return 0;
    }
    else
    {
      unint64_t v9 = BYTE2(v11);
      if ((~BYTE2(v11) & 0x1F) != 0)
      {
        return (void *)BYTE2(v11);
      }
      else
      {
        while (1)
        {
          v5(&v11, &type metadata for UInt8, &type metadata for UInt8, v6, v7, a1, a2);
          if ((v11 & 0x100) != 0) {
            break;
          }
          uint64_t result = (void *)(v11 | (v9 << 8));
          unint64_t v9 = (unint64_t)result;
          if (((char)v11 & 0x80000000) == 0) {
            return result;
          }
        }
        sub_1001738E4();
        swift_allocError();
        *id v10 = 0;
        return (void *)swift_willThrow();
      }
    }
  }
  return result;
}

unint64_t sub_100179B70()
{
  unint64_t result = qword_1001E0AC8;
  if (!qword_1001E0AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0AC8);
  }
  return result;
}

Swift::Int_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DERReader.readDERLength()()
{
  void *(*v6)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v7;
  unint64_t v8;
  void *v9;
  Swift::Bool v10;
  uint64_t v11;
  unsigned char *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned char *v15;
  void *(*v16)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v17;
  char v18;
  uint64_t v19;
  Swift::Int_optional result;

  uint64_t v4 = v1;
  uint64_t v5 = v0;
  uint64_t v6 = *(void *(**)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(v1 + 8);
  id v7 = sub_100179B70();
  id v8 = sub_10002C874();
  unint64_t v9 = v6((uint64_t *)((char *)&v19 + 2), &type metadata for UInt8, &type metadata for UInt8, v7, v8, v5, v4);
  if (v2) {
    goto LABEL_7;
  }
  uint64_t v18 = BYTE3(v19);
  if ((v19 & 0x1000000) != 0)
  {
    unint64_t v3 = 0;
LABEL_6:
    id v10 = v18;
LABEL_7:
    unint64_t v9 = (void *)v3;
    goto LABEL_18;
  }
  unint64_t v11 = BYTE2(v19);
  if ((v19 & 0x800000) == 0)
  {
    unint64_t v3 = BYTE2(v19);
    goto LABEL_6;
  }
  if (BYTE2(v19) == 128)
  {
    sub_1001738E4();
    swift_allocError();
    *id v12 = 2;
LABEL_16:
    swift_willThrow();
    goto LABEL_7;
  }
  unint64_t v16 = v6;
  id v17 = v5;
  unint64_t v3 = 0;
  char v13 = 128;
  while (v13 < v11)
  {
    id v14 = v11;
    unint64_t v9 = v16(&v19, &type metadata for UInt8, &type metadata for UInt8, v7, v8, v17, v4);
    if ((v19 & 0x100) != 0)
    {
      sub_1001738E4();
      swift_allocError();
      char *v15 = 0;
      goto LABEL_16;
    }
    ++v13;
    unint64_t v3 = v19 | (v3 << 8);
    unint64_t v11 = v14;
    if (v13 == v14) {
      goto LABEL_6;
    }
  }
  __break(1u);
LABEL_18:
  result.Swift::UInt8 value = (Swift::Int)v9;
  result.is_nil = v10;
  return result;
}

id NSInputStream.read(exactly:)(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  v10[0] = 0;
  *(void *)&long long v9 = 0;
  unsigned int v3 = [v1 getBuffer:v10 length:&v9];
  uint64_t v4 = v9;
  if (!v3) {
    uint64_t v4 = 1000000;
  }
  if (v4 < a1) {
    return 0;
  }
  *(void *)&long long v9 = sub_10012CAB8(a1);
  *((void *)&v9 + 1) = v5;
  sub_10017A804((uint64_t *)&v9, 0);
  *(_OWORD *)id v10 = v9;
  id v6 = v1;
  id v7 = sub_10017AA8C(v10, v6);

  if (v7 == (id)-1)
  {
    id result = [v6 streamError];
    if (result)
    {
      swift_willThrow();
      return (id)sub_100006628(v10[0], v10[1]);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id result = (id)v10[0];
    if (v7 != (id)a1)
    {
      sub_100006628(v10[0], v10[1]);
      return 0;
    }
  }
  return result;
}

id NSInputStream.read<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __chkstk_darwin(AssociatedTypeWitness, v5);
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v8, v9);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v18 = v2;
  sub_10017A2F4((uint64_t)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_10017AE18, (uint64_t)v17, a1, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Never, v10);
  if (v16 == -1)
  {
    id result = [v2 streamError];
    if (result)
    {
      swift_willThrow();
      return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (v7 == v16)
    {
      uint64_t v11 = v15;
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v15, (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      uint64_t v12 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      uint64_t v12 = 1;
      uint64_t v11 = v15;
    }
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, v12, 1, a1);
  }
  return result;
}

Swift::Int DERReader.readDERTLV()(uint64_t a1, uint64_t a2)
{
  v5.Swift::Int value = (Swift::Int)DERReader.readDERTag()(a1, a2);
  if (!v2)
  {
    if (v5.is_nil)
    {
      v5.Swift::Int value = 0;
    }
    else
    {
      Swift::Int value = v5.value;
      Swift::Int_optional v5 = DERReader.readDERLength()();
      if (!v7)
      {
        if (v5.is_nil
          || (uint64_t v8 = (*(uint64_t (**)(Swift::Int, uint64_t, uint64_t))(a2 + 16))(v5.value, a1, a2),
              unint64_t v10 = v9,
              v9 >> 60 == 15))
        {
          sub_1001738E4();
          swift_allocError();
          *uint64_t v11 = 0;
          v5.Swift::Int value = swift_willThrow();
        }
        else
        {
          uint64_t v12 = v8;
          type metadata accessor for TLV();
          v5.Swift::Int value = swift_allocObject();
          *(void *)(v5.value + 16) = value;
          *(void *)(v5.value + 24) = v12;
          *(void *)(v5.value + 32) = v10;
        }
      }
    }
  }
  return v5.value;
}

uint64_t NSInputStream.availableByteCount.getter()
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  if ([v0 getBuffer:&v3 length:&v2]) {
    return v2;
  }
  else {
    return 1000000;
  }
}

uint64_t sub_10017A2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = __chkstk_darwin();
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

id sub_10017A3E8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return NSInputStream.read<A>(_:)(a1, a2);
}

id sub_10017A40C(uint64_t a1)
{
  return NSInputStream.read(exactly:)(a1);
}

uint64_t NSFileHandle.read<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t result = NSFileHandle.read(upToCount:)();
  if (!v2)
  {
    unint64_t v9 = v8;
    if (v8 >> 60 != 15)
    {
      uint64_t v10 = result;
      switch(v8 >> 62)
      {
        case 1uLL:
          LODWORD(v11) = HIDWORD(result) - result;
          if (__OFSUB__(HIDWORD(result), result))
          {
            __break(1u);
LABEL_15:
            __break(1u);
            JUMPOUT(0x10017A5F4);
          }
          uint64_t v11 = (int)v11;
LABEL_8:
          if (v11 == v6)
          {
LABEL_9:
            __chkstk_darwin(result, v8);
            Data.withUnsafeBytes<A>(_:)();
            sub_10000BF70(v10, v9);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, a1);
          }
LABEL_11:
          sub_10000BF70(result, v8);
          break;
        case 2uLL:
          uint64_t v13 = *(void *)(result + 16);
          uint64_t v12 = *(void *)(result + 24);
          BOOL v14 = __OFSUB__(v12, v13);
          uint64_t v11 = v12 - v13;
          if (!v14) {
            goto LABEL_8;
          }
          goto LABEL_15;
        case 3uLL:
          if (v6) {
            goto LABEL_11;
          }
          goto LABEL_9;
        default:
          uint64_t v11 = BYTE6(v8);
          goto LABEL_8;
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, a1);
  }
  return result;
}

uint64_t sub_10017A604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)();
  dispatch thunk of FixedWidthInteger.bigEndian.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a3);
}

uint64_t NSFileHandle.read(exactly:)(uint64_t a1)
{
  uint64_t result = NSFileHandle.read(upToCount:)();
  if (!v1)
  {
    if (v4 >> 60 != 15)
    {
      switch(v4 >> 62)
      {
        case 1uLL:
          LODWORD(v5) = HIDWORD(result) - result;
          if (__OFSUB__(HIDWORD(result), result))
          {
            __break(1u);
LABEL_15:
            __break(1u);
            JUMPOUT(0x10017A7ACLL);
          }
          uint64_t v5 = (int)v5;
LABEL_8:
          if (v5 == a1) {
            return result;
          }
LABEL_11:
          sub_10000BF70(result, v4);
          break;
        case 2uLL:
          uint64_t v7 = *(void *)(result + 16);
          uint64_t v6 = *(void *)(result + 24);
          BOOL v8 = __OFSUB__(v6, v7);
          uint64_t v5 = v6 - v7;
          if (!v8) {
            goto LABEL_8;
          }
          goto LABEL_15;
        case 3uLL:
          if (a1) {
            goto LABEL_11;
          }
          return result;
        default:
          uint64_t v5 = BYTE6(v4);
          goto LABEL_8;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_10017A7BC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return NSFileHandle.read<A>(_:)(a1, a2);
}

uint64_t sub_10017A7E0(uint64_t a1)
{
  return NSFileHandle.read(exactly:)(a1);
}

void sub_10017A804(uint64_t *a1, int __c)
{
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_10017A9F8((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = __DataStorage._bytes.getter();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x10017A9E8);
      }
      uint64_t v11 = v10;
      uint64_t v12 = __DataStorage._offset.getter();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = __DataStorage._length.getter();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      memset((void *)(v11 + v13), __c, v17);
      *a1 = __b;
      a1[1] = v7 | 0x8000000000000000;
      return;
    case 3uLL:
      return;
    default:
      uint64_t __b = *a1;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *a1 = v5;
      a1[1] = v6;
      return;
  }
}

void sub_10017A9F8(int *a1, int a2)
{
  Data.InlineSlice.ensureUniqueReference()();
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = __DataStorage._bytes.getter();
  if (!v6)
  {
LABEL_12:
    __break(1u);
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = __DataStorage._offset.getter();
  uint64_t v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v10 = v5 - v4;
  uint64_t v11 = __DataStorage._length.getter();
  if (v11 >= v10) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v11;
  }

  memset((void *)(v7 + v9), a2, v12);
}

id sub_10017AA8C(uint64_t *a1, id a2)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v7 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_100189A30;
      id v8 = a2;
      uint64_t v9 = v3 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_18;
      }
      uint64_t v34 = v9 - (int)v3;
      if (v9 < (int)v3) {
        goto LABEL_29;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v3, __DataStorage._offset.getter())) {
        goto LABEL_30;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v24 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v7 = v24;
LABEL_18:
      uint64_t v25 = v9 - (int)v3;
      if (v9 < (int)v3) {
        goto LABEL_26;
      }
      id v26 = v8;
      uint64_t v27 = __DataStorage._bytes.getter();
      if (!v27) {
        goto LABEL_32;
      }
      uint64_t v28 = v27;
      uint64_t v29 = __DataStorage._offset.getter();
      uint64_t v30 = (int)v3 - v29;
      if (__OFSUB__((int)v3, v29)) {
        goto LABEL_28;
      }
      uint64_t v31 = __DataStorage._length.getter();
      if (v31 >= v25) {
        uint64_t v32 = v25;
      }
      else {
        uint64_t v32 = v31;
      }
      id v33 = [v26 read:v28 + v30 maxLength:v32];

      *a1 = v3;
      a1[1] = v7 | 0x4000000000000000;
      return v33;
    case 2uLL:
      *(void *)&long long v35 = *a1;
      *((void *)&v35 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      id v10 = a2;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v11 = *((void *)&v35 + 1);
      uint64_t v12 = *(void *)(v35 + 16);
      uint64_t v13 = *(void *)(v35 + 24);
      id v14 = v10;
      uint64_t v15 = __DataStorage._bytes.getter();
      if (!v15)
      {
        __break(1u);
LABEL_32:
        __break(1u);
        JUMPOUT(0x10017AE08);
      }
      uint64_t v16 = v15;
      uint64_t v17 = __DataStorage._offset.getter();
      uint64_t v18 = v12 - v17;
      if (__OFSUB__(v12, v17))
      {
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      BOOL v19 = __OFSUB__(v13, v12);
      uint64_t v20 = v13 - v12;
      if (v19)
      {
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = v21;
      }
      id v23 = [v14 read:v16 + v18 maxLength:v22];

      *a1 = v35;
      a1[1] = v11 | 0x8000000000000000;
      return v23;
    case 3uLL:
      *(void *)((char *)&v35 + 7) = 0;
      *(void *)&long long v35 = 0;
      return [a2 read:&v35 maxLength:0];
    default:
      *(void *)&long long v35 = *a1;
      WORD4(v35) = v2;
      BYTE10(v35) = BYTE2(v2);
      BYTE11(v35) = BYTE3(v2);
      BYTE12(v35) = BYTE4(v2);
      BYTE13(v35) = BYTE5(v2);
      BYTE14(v35) = BYTE6(v2);
      id result = [a2 read:&v35 maxLength:BYTE6(v2)];
      unint64_t v6 = DWORD2(v35) | ((unint64_t)BYTE12(v35) << 32) | ((unint64_t)BYTE13(v35) << 40) | ((unint64_t)BYTE14(v35) << 48);
      *a1 = v35;
      a1[1] = v6;
      return result;
  }
}

id sub_10017AE18@<X0>(id result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (result)
  {
    id result = [*(id *)(v3 + 16) read:result maxLength:a2 - (void)result];
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10017AE64(uint64_t a1, uint64_t a2)
{
  return sub_10017A604(a1, a2, *(void *)(v2 + 16));
}

BOOL static TLVError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void TLVError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int TLVError.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

unint64_t sub_10017AF08()
{
  unint64_t result = qword_1001E0AD0;
  if (!qword_1001E0AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0AD0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TLVError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    char *result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10017B028);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TLVError()
{
  return &type metadata for TLVError;
}

Swift::Void __swiftcall UnsignedInteger.setBit(_:)(Swift::Int a1)
{
  sub_10017B2E0(a1, v1, v2, (void (*)(void, char *, uint64_t, uint64_t))&dispatch thunk of static BinaryInteger.|= infix(_:_:));
}

Swift::Void __swiftcall UnsignedInteger.clearBit(_:)(Swift::Int a1)
{
  Swift::Int v20 = a1;
  uint64_t v2 = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = __chkstk_darwin(AssociatedTypeWitness, v4);
  uint64_t v6 = *(void *)(v2 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v8, v11);
  id v14 = (char *)&v19 - v13;
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v19 - v16;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  Swift::Int v21 = v20;
  sub_100167674();
  dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v10, v2);
  dispatch thunk of static BinaryInteger.~ prefix(_:)();
  v18(v14, v2);
  dispatch thunk of static BinaryInteger.&= infix(_:_:)();
  v18(v17, v2);
}

Swift::Void __swiftcall UnsignedInteger.toggleBit(_:)(Swift::Int a1)
{
  sub_10017B2E0(a1, v1, v2, (void (*)(void, char *, uint64_t, uint64_t))&dispatch thunk of static BinaryInteger.^= infix(_:_:));
}

uint64_t sub_10017B2E0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void, char *, uint64_t, uint64_t))
{
  Swift::Int v21 = a4;
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = __chkstk_darwin(AssociatedTypeWitness, v8);
  uint64_t v10 = *(void *)(a2 - 8);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  id v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)v20 - v16;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v22 = a1;
  sub_100167674();
  dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v14, a2);
  v21(v20[1], v17, a2, v6);
  return ((uint64_t (*)(char *, uint64_t))v18)(v17, a2);
}

Swift::Bool __swiftcall UnsignedInteger.readBit(_:)(Swift::Int a1)
{
  Swift::Int v50 = a1;
  uint64_t v3 = v1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(v2 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = __chkstk_darwin(AssociatedTypeWitness, v6);
  uint64_t v8 = *(void *)(v3 - 8);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v44 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v15 = (char *)&v43 - v14;
  uint64_t v17 = __chkstk_darwin(v13, v16);
  uint64_t v19 = (char *)&v43 - v18;
  __chkstk_darwin(v17, v20);
  uint64_t v22 = (char *)&v43 - v21;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  uint64_t v48 = v4;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  Swift::Int v52 = v50;
  unint64_t v45 = sub_100167674();
  dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)();
  uint64_t v47 = v8;
  Swift::Int v24 = v8 + 8;
  id v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v15, v3);
  dispatch thunk of static BinaryInteger.& infix(_:_:)();
  uint64_t v49 = v19;
  Swift::Int v50 = v24;
  uint64_t v51 = v23;
  v23(v19, v3);
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) == 0)
  {
    uint64_t v27 = v47;
    char v28 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v43 = v22;
    uint64_t v29 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v28)
    {
      if (v29 <= 64)
      {
        dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
        uint64_t v30 = v49;
        dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
        uint64_t v31 = v43;
        char v32 = dispatch thunk of static Comparable.>= infix(_:_:)();
        id v33 = v51;
        v51(v30, v3);
        uint64_t v34 = v44;
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v44, v31, v3);
        char v35 = (v32 & 1) != 0 && dispatch thunk of BinaryInteger._lowWord.getter() == 0;
        v33(v34, v3);
        v33(v31, v3);
        return (v35 & 1) == 0;
      }
    }
    else if (v29 < 64)
    {
      uint64_t v38 = v43;
      uint64_t v25 = dispatch thunk of BinaryInteger._lowWord.getter();
      id v26 = v38;
      goto LABEL_11;
    }
    Swift::Int v52 = 0;
    uint64_t v39 = v49;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    uint64_t v40 = v43;
    char v35 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v41 = v51;
    v51(v39, v3);
    v41(v40, v3);
    return (v35 & 1) == 0;
  }
  if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
  {
    uint64_t v25 = dispatch thunk of BinaryInteger._lowWord.getter();
    id v26 = v22;
LABEL_11:
    v51(v26, v3);
    char v35 = v25 == 0;
    return (v35 & 1) == 0;
  }
  Swift::Int v52 = 0;
  long long v36 = v49;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  char v35 = dispatch thunk of static Equatable.== infix(_:_:)();
  long long v37 = v51;
  v51(v36, v3);
  v37(v22, v3);
  return (v35 & 1) == 0;
}

uint64_t sub_10017B9F4(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v5 = a3 - a2;
  if (a2) {
    uint64_t v6 = a3 - a2;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t result = sub_10017C564(0, result, v6, a2, a3);
  if (v7)
  {
    unint64_t result = v5;
    if (!a2) {
      return 0;
    }
  }
  else if (!a2)
  {
    uint64_t v5 = 0;
  }
  if (v5 < result) {
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_10017BA84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v5 = a3 >> 62;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v10 = (int)a2;
      uint64_t v9 = a2 >> 32;
      break;
    case 2uLL:
      uint64_t v10 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v10 = 0;
      uint64_t v9 = BYTE6(a3);
      break;
  }
  uint64_t v11 = sub_1000F7928(v10, v9, a2, a3);
  if (!a1 || v11 < 0 || v11 >= a1)
  {
    uint64_t v12 = sub_1000F78AC(v10, a1, a2, a3);
    uint64_t v13 = 0;
    switch((int)v5)
    {
      case 1:
        uint64_t v13 = a2 >> 32;
        break;
      case 2:
        uint64_t v13 = *(void *)(a2 + 24);
        break;
      case 3:
        break;
      default:
        uint64_t v13 = BYTE6(a3);
        break;
    }
    if (v13 < v12)
    {
LABEL_16:
      __break(1u);
      JUMPOUT(0x10017BC04);
    }
  }
  uint64_t v14 = Data._Representation.subscript.getter();
  uint64_t v16 = v15;
  uint64_t result = sub_100006628(a2, a3);
  *a4 = v14;
  a4[1] = v16;
  return result;
}

void *SecCertificateRef.pemHeader.unsafeMutableAddressor()
{
  return &static SecCertificateRef.pemHeader;
}

unint64_t static SecCertificateRef.pemHeader.getter()
{
  return 0xD00000000000001BLL;
}

void *SecCertificateRef.pemFooter.unsafeMutableAddressor()
{
  return &static SecCertificateRef.pemFooter;
}

unint64_t static SecCertificateRef.pemFooter.getter()
{
  return 0xD000000000000019;
}

uint64_t SecCertificateRef.derRepresentation.getter()
{
  CFDataRef v1 = SecCertificateCopyData(v0);
  uint64_t v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

unint64_t SecCertificateRef.pemRepresentation.getter()
{
  CFDataRef v1 = SecCertificateCopyData(v0);
  uint64_t v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v4 = v3;

  Swift::String v5 = Data.base64EncodedString(options:)(0x21uLL);
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 10;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  v7._object = (void *)0x800000010019E840;
  v7._uint64_t countAndFlagsBits = 0xD000000000000019;
  String.append(_:)(v7);
  sub_100006628(v2, v4);
  return 0xD00000000000001CLL;
}

uint64_t SecCertificateRef.fingerprint.getter()
{
  CFDataRef v1 = SecCertificateCopyData(v0);
  uint64_t v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v4 = v3;

  uint64_t v5 = Data.sha256Digest.getter(v2, v4);
  sub_100006628(v2, v4);
  return v5;
}

SecKeyRef SecCertificateRef.publicKey.getter()
{
  return SecCertificateCopyKey(v0);
}

SecCertificateRef static SecCertificateRef.parse(derRepresentation:)()
{
  CFDataRef isa = Data._bridgeToObjectiveC()().super.isa;
  SecCertificateRef v1 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

  return v1;
}

SecCertificateRef static SecCertificateRef.parse(base64Encoded:)()
{
  uint64_t v0 = Data.init(base64Encoded:options:)();
  if (v1 >> 60 == 15) {
    return 0;
  }
  uint64_t v3 = v0;
  unint64_t v4 = v1;
  CFDataRef isa = Data._bridgeToObjectiveC()().super.isa;
  SecCertificateRef v2 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

  sub_10000BF70(v3, v4);
  return v2;
}

uint64_t static SecCertificateRef.parse(pemRepresentation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[0] = a1;
  v42[1] = a2;
  static CharacterSet.whitespacesAndNewlines.getter();
  sub_10000A87C();
  uint64_t v9 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  uint64_t v12 = String.count.getter();
  uint64_t v13 = String.count.getter();
  uint64_t result = String.count.getter();
  if (__OFADD__(v13, result))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v12 < v13 + result) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = String.count.getter();
  unint64_t v16 = sub_10017C6D0(v15);
  unint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  char v23 = sub_10017C76C(v16, v18, v20, v22, 0xD00000000000001BLL, 0x800000010019E820);
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v24 = String.count.getter();
  unint64_t v25 = sub_1000DF1A0(v24, v9, v11);
  unint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  swift_bridgeObjectRelease();
  LOBYTE(v25) = sub_10017C76C(v25, v27, v29, v31, 0xD000000000000019, 0x800000010019E840);
  swift_bridgeObjectRelease();
  if ((v25 & 1) == 0) {
    goto LABEL_11;
  }
  unint64_t v32 = String.count.getter();
  unint64_t v33 = sub_10017C620(v32, v9, v11);
  swift_bridgeObjectRelease();
  uint64_t result = String.count.getter();
  if (result < 0) {
    goto LABEL_15;
  }
  uint64_t result = Substring.index(_:offsetBy:limitedBy:)();
  if (v34) {
    unint64_t v35 = v33;
  }
  else {
    unint64_t v35 = result;
  }
  if (v35 >> 14 >= v33 >> 14)
  {
    Substring.subscript.getter();
    swift_bridgeObjectRelease();
    static String._fromSubstring(_:)();
    swift_bridgeObjectRelease();
    uint64_t v36 = Data.init(base64Encoded:options:)();
    if (v37 >> 60 != 15)
    {
      uint64_t v39 = v36;
      unint64_t v40 = v37;
      CFDataRef isa = Data._bridgeToObjectiveC()().super.isa;
      SecCertificateRef v38 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

      sub_10000BF70(v39, v40);
      goto LABEL_12;
    }
LABEL_11:
    SecCertificateRef v38 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    return (uint64_t)v38;
  }
LABEL_16:
  __break(1u);
  return result;
}

void *static SecCertificateRef.parseList(pemRepresentation:)()
{
  uint64_t v0 = type metadata accessor for CharacterSet();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_allocWithZone((Class)NSScanner);
  swift_bridgeObjectRetain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithString:v6];

  static CharacterSet.whitespacesAndNewlines.getter();
  Class isa = CharacterSet._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  [v7 setCharactersToBeSkipped:isa];

  uint64_t v9 = _swiftEmptyArrayStorage;
  unint64_t v24 = (unint64_t)_swiftEmptyArrayStorage;
  if ([v7 isAtEnd])
  {
LABEL_2:
  }
  else
  {
    while (1)
    {
      v10._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
      v10._object = (void *)0x800000010019E820;
      object = NSScanner.scanString(_:)(v10).value._object;
      swift_bridgeObjectRelease();
      if (!object) {
        goto LABEL_13;
      }
      v12._uint64_t countAndFlagsBits = 0xD000000000000019;
      v12._object = (void *)0x800000010019E840;
      if (!(unint64_t)NSScanner.scanUpToString(_:)(v12).value._object) {
        goto LABEL_13;
      }
      uint64_t v13 = Data.init(base64Encoded:options:)();
      if (v14 >> 60 == 15)
      {
        swift_bridgeObjectRelease();
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v15 = v13;
      unint64_t v16 = v14;
      CFDataRef v17 = Data._bridgeToObjectiveC()().super.isa;
      SecCertificateRef v18 = SecCertificateCreateWithData(kCFAllocatorDefault, v17);

      sub_10000BF70(v15, v16);
      swift_bridgeObjectRelease();
      if (!v18) {
        goto LABEL_13;
      }
      v19._object = (void *)0x800000010019E840;
      v19._uint64_t countAndFlagsBits = 0xD000000000000019;
      uint64_t v20 = NSScanner.scanString(_:)(v19).value._object;
      swift_bridgeObjectRelease();
      if (!v20) {
        break;
      }
      uint64_t v21 = v18;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();

      if ([v7 isAtEnd])
      {
        uint64_t v9 = (void *)v24;
        goto LABEL_2;
      }
    }

LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
  return v9;
}

uint64_t sub_10017C564(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5 - a4;
  if (!a4) {
    uint64_t v5 = 0;
  }
  if (result < 0 || v5 < result)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (a3 < 0 || v5 < a3) {
    goto LABEL_19;
  }
  uint64_t v6 = a3 - result;
  if (a2 > 0)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2) {
      goto LABEL_14;
    }
    return 0;
  }
  if (v6 <= 0 && v6 > a2) {
    return 0;
  }
LABEL_14:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result < 0 || v5 < result) {
    goto LABEL_21;
  }
  return result;
}

uint64_t sub_10017C5EC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 - a3;
  if (!a3) {
    uint64_t v4 = 0;
  }
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0 && v4 >= a2)
  {
    return a2 - result;
  }
  __break(1u);
  return result;
}

unint64_t sub_10017C620(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  uint64_t result = String.index(_:offsetBy:limitedBy:)();
  if (v6) {
    uint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }

  return String.subscript.getter();
}

uint64_t sub_10017C6D0(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    String.index(_:offsetBy:limitedBy:)();
    return String.subscript.getter();
  }
  return result;
}

uint64_t sub_10017C76C(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a6) & 0xF;
  }
  else {
    uint64_t v6 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6) {
    return 1;
  }
  else {
    return _stringCompareInternal(_:_:_:_:expecting:)() & 1;
  }
}

void *TLVTag.asn1Null.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Null;
}

void *TLVTag.asn1Boolean.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Boolean;
}

void *TLVTag.asn1Integer.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Integer;
}

void *TLVTag.asn1BitString.unsafeMutableAddressor()
{
  return &static TLVTag.asn1BitString;
}

void *TLVTag.asn1OctetString.unsafeMutableAddressor()
{
  return &static TLVTag.asn1OctetString;
}

void *TLVTag.asn1ObjectIdentifier.unsafeMutableAddressor()
{
  return &static TLVTag.asn1ObjectIdentifier;
}

void *TLVTag.asn1UTF8String.unsafeMutableAddressor()
{
  return &static TLVTag.asn1UTF8String;
}

uint64_t TLVTag.description.getter(uint64_t a1)
{
  sub_100003EB0((uint64_t *)&unk_1001DD3C0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100186100;
  *(void *)(v2 + 56) = &type metadata for UInt;
  *(void *)(v2 + 64) = &protocol witness table for UInt;
  *(void *)(v2 + 32) = a1;

  return String.init(format:_:)();
}

uint64_t TLVTag.dataRepresentation.getter(unint64_t a1)
{
  uint64_t v2 = sub_10015A690(0, 1, 1, _swiftEmptyArrayStorage);
  unint64_t v3 = v2[2];
  do
  {
    unint64_t v4 = v2[3];
    if (v3 >= v4 >> 1) {
      uint64_t v2 = sub_10015A690((void *)(v4 > 1), v3 + 1, 1, v2);
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = a1;
    BOOL v5 = a1 > 0xFF;
    a1 >>= 8;
  }
  while (v5);

  return sub_10016F268((uint64_t)v2);
}

void *TLVTag.asn1Sequence.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Sequence;
}

uint64_t static TLVTag.asn1Sequence.getter()
{
  return 48;
}

void *TLVTag.asn1Set.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Set;
}

uint64_t static TLVTag.asn1Set.getter()
{
  return 49;
}

void *TLVTag.asn1PrintableString.unsafeMutableAddressor()
{
  return &static TLVTag.asn1PrintableString;
}

uint64_t static TLVTag.asn1PrintableString.getter()
{
  return 19;
}

void *TLVTag.asn1T61String.unsafeMutableAddressor()
{
  return &static TLVTag.asn1T61String;
}

uint64_t static TLVTag.asn1T61String.getter()
{
  return 20;
}

void *TLVTag.asn1IA5String.unsafeMutableAddressor()
{
  return &static TLVTag.asn1IA5String;
}

uint64_t static TLVTag.asn1IA5String.getter()
{
  return 22;
}

void *TLVTag.asn1UTCTime.unsafeMutableAddressor()
{
  return &static TLVTag.asn1UTCTime;
}

uint64_t static TLVTag.asn1UTCTime.getter()
{
  return 23;
}

void *TLVTag.applicationIdentifier.unsafeMutableAddressor()
{
  return &static TLVTag.applicationIdentifier;
}

uint64_t static TLVTag.applicationIdentifier.getter()
{
  return 79;
}

void *TLVTag.applicationLabel.unsafeMutableAddressor()
{
  return &static TLVTag.applicationLabel;
}

uint64_t static TLVTag.applicationLabel.getter()
{
  return 80;
}

void *TLVTag.transactionCurrencyCode.unsafeMutableAddressor()
{
  return &static TLVTag.transactionCurrencyCode;
}

uint64_t static TLVTag.transactionCurrencyCode.getter()
{
  return 24362;
}

void *TLVTag.languagePreference.unsafeMutableAddressor()
{
  return &static TLVTag.languagePreference;
}

uint64_t static TLVTag.languagePreference.getter()
{
  return 24365;
}

void *TLVTag.fileControlInformationTemplate.unsafeMutableAddressor()
{
  return &static TLVTag.fileControlInformationTemplate;
}

uint64_t static TLVTag.fileControlInformationTemplate.getter()
{
  return 111;
}

void *TLVTag.applicationInterchangeProfile.unsafeMutableAddressor()
{
  return &static TLVTag.applicationInterchangeProfile;
}

uint64_t static TLVTag.applicationInterchangeProfile.getter()
{
  return 130;
}

void *TLVTag.terminalVerificationResults.unsafeMutableAddressor()
{
  return &static TLVTag.terminalVerificationResults;
}

uint64_t static TLVTag.terminalVerificationResults.getter()
{
  return 149;
}

void *TLVTag.transactionDate.unsafeMutableAddressor()
{
  return &static TLVTag.transactionDate;
}

uint64_t static TLVTag.transactionDate.getter()
{
  return 154;
}

void *TLVTag.transactionType.unsafeMutableAddressor()
{
  return &static TLVTag.transactionType;
}

uint64_t static TLVTag.transactionType.getter()
{
  return 156;
}

void *TLVTag.authorizedAmount.unsafeMutableAddressor()
{
  return &static TLVTag.authorizedAmount;
}

uint64_t static TLVTag.authorizedAmount.getter()
{
  return 40706;
}

void *TLVTag.otherAmount.unsafeMutableAddressor()
{
  return &static TLVTag.otherAmount;
}

uint64_t static TLVTag.otherAmount.getter()
{
  return 40707;
}

void *TLVTag.issuerApplicationData.unsafeMutableAddressor()
{
  return &static TLVTag.issuerApplicationData;
}

uint64_t static TLVTag.issuerApplicationData.getter()
{
  return 40720;
}

void *TLVTag.applicationPreferredName.unsafeMutableAddressor()
{
  return &static TLVTag.applicationPreferredName;
}

uint64_t static TLVTag.applicationPreferredName.getter()
{
  return 40722;
}

void *TLVTag.merchantCategoryCode.unsafeMutableAddressor()
{
  return &static TLVTag.merchantCategoryCode;
}

uint64_t static TLVTag.merchantCategoryCode.getter()
{
  return 40725;
}

void *TLVTag.terminalCountryCode.unsafeMutableAddressor()
{
  return &static TLVTag.terminalCountryCode;
}

uint64_t static TLVTag.terminalCountryCode.getter()
{
  return 40730;
}

void *TLVTag.interfaceDeviceSerialNumber.unsafeMutableAddressor()
{
  return &static TLVTag.interfaceDeviceSerialNumber;
}

uint64_t static TLVTag.interfaceDeviceSerialNumber.getter()
{
  return 40734;
}

void *TLVTag.transactionTime.unsafeMutableAddressor()
{
  return &static TLVTag.transactionTime;
}

uint64_t static TLVTag.transactionTime.getter()
{
  return 40737;
}

void *TLVTag.cryptogramInformationData.unsafeMutableAddressor()
{
  return &static TLVTag.cryptogramInformationData;
}

uint64_t static TLVTag.cryptogramInformationData.getter()
{
  return 40743;
}

void *TLVTag.cvmResults.unsafeMutableAddressor()
{
  return &static TLVTag.cvmResults;
}

uint64_t static TLVTag.cvmResults.getter()
{
  return 40756;
}

void *TLVTag.unpredictableNumber.unsafeMutableAddressor()
{
  return &static TLVTag.unpredictableNumber;
}

uint64_t static TLVTag.unpredictableNumber.getter()
{
  return 40759;
}

void *TLVTag.thirdPartyData.unsafeMutableAddressor()
{
  return &static TLVTag.thirdPartyData;
}

uint64_t static TLVTag.thirdPartyData.getter()
{
  return 40814;
}

void *TLVTag.interacCardTransactionInformation.unsafeMutableAddressor()
{
  return &static TLVTag.interacCardTransactionInformation;
}

uint64_t static TLVTag.interacCardTransactionInformation.getter()
{
  return 40803;
}

void *TLVTag.cardInterfaceCapabilities.unsafeMutableAddressor()
{
  return &static TLVTag.cardInterfaceCapabilities;
}

uint64_t static TLVTag.cardInterfaceCapabilities.getter()
{
  return 40816;
}

void *TLVTag.cardProcessingRequirement.unsafeMutableAddressor()
{
  return &static TLVTag.cardProcessingRequirement;
}

uint64_t static TLVTag.cardProcessingRequirement.getter()
{
  return 40817;
}

void *TLVTag.errorIndication.unsafeMutableAddressor()
{
  return &static TLVTag.errorIndication;
}

uint64_t static TLVTag.errorIndication.getter()
{
  return 14647573;
}

void *TLVTag.userInterfaceRequestData.unsafeMutableAddressor()
{
  return &static TLVTag.userInterfaceRequestData;
}

uint64_t static TLVTag.userInterfaceRequestData.getter()
{
  return 14647574;
}

void *TLVTag.outcomeParameterSet.unsafeMutableAddressor()
{
  return &static TLVTag.outcomeParameterSet;
}

uint64_t static TLVTag.outcomeParameterSet.getter()
{
  return 14647593;
}

void *TLVTag.overrideAID.unsafeMutableAddressor()
{
  return &static TLVTag.overrideAID;
}

void *TLVTag.kernelIdentityKey.unsafeMutableAddressor()
{
  return &static TLVTag.kernelIdentityKey;
}

uint64_t static TLVTag.kernelIdentityKey.getter()
{
  return 24352;
}

void *TLVTag.sepData.unsafeMutableAddressor()
{
  return &static TLVTag.sepData;
}

uint64_t static TLVTag.sepData.getter()
{
  return 32560;
}

void *TLVTag.cipherBlob.unsafeMutableAddressor()
{
  return &static TLVTag.cipherBlob;
}

uint64_t static TLVTag.cipherBlob.getter()
{
  return 160;
}

void *TLVTag.keyBlob.unsafeMutableAddressor()
{
  return &static TLVTag.keyBlob;
}

uint64_t static TLVTag.keyBlob.getter()
{
  return 161;
}

void *TLVTag.certificateRevocationList.unsafeMutableAddressor()
{
  return &static TLVTag.certificateRevocationList;
}

uint64_t static TLVTag.certificateRevocationList.getter()
{
  return 177;
}

void *TLVTag.readerMetadata.unsafeMutableAddressor()
{
  return &static TLVTag.readerMetadata;
}

uint64_t static TLVTag.readerMetadata.getter()
{
  return 190;
}

void *TLVTag.preferredSchemes.unsafeMutableAddressor()
{
  return &static TLVTag.preferredSchemes;
}

uint64_t static TLVTag.preferredSchemes.getter()
{
  return 48946;
}

void *TLVTag.maxNumReaderConfigurations.unsafeMutableAddressor()
{
  return &static TLVTag.maxNumReaderConfigurations;
}

uint64_t static TLVTag.provisionDataFormatVersion.getter()
{
  return 193;
}

void *TLVTag.blobInformation.unsafeMutableAddressor()
{
  return &static TLVTag.blobInformation;
}

void *TLVTag.readerConfigProfileIDs.unsafeMutableAddressor()
{
  return &static TLVTag.readerConfigProfileIDs;
}

uint64_t static TLVTag.provisionDataKeyIdentifier.getter()
{
  return 194;
}

void *TLVTag.transactionKEKHash.unsafeMutableAddressor()
{
  return &static TLVTag.transactionKEKHash;
}

uint64_t static TLVTag.provisionDataEphemeralPublicKey.getter()
{
  return 196;
}

void *TLVTag.cipheredData.unsafeMutableAddressor()
{
  return &static TLVTag.cipheredData;
}

uint64_t static TLVTag.provisionDataCipherText.getter()
{
  return 197;
}

void *TLVTag.pinKEKHash.unsafeMutableAddressor()
{
  return &static TLVTag.pinKEKHash;
}

void *TLVTag.transactionAndPINKEKHashes.unsafeMutableAddressor()
{
  return &static TLVTag.transactionAndPINKEKHashes;
}

uint64_t static TLVTag.transactionAndPINKEKHashes.getter()
{
  return 200;
}

void *TLVTag.globalConfigID.unsafeMutableAddressor()
{
  return &static TLVTag.globalConfigID;
}

uint64_t static TLVTag.provisionAppletConfigID.getter()
{
  return 201;
}

void *TLVTag.payAppletVersionString.unsafeMutableAddressor()
{
  return &static TLVTag.payAppletVersionString;
}

uint64_t static TLVTag.payAppletVersionString.getter()
{
  return 208;
}

void *TLVTag.cipherBlobIVOrSalt.unsafeMutableAddressor()
{
  return &static TLVTag.cipherBlobIVOrSalt;
}

void *TLVTag.readerMetadataTransactionID.unsafeMutableAddressor()
{
  return &static TLVTag.readerMetadataTransactionID;
}

uint64_t static TLVTag.provisionDataAuthenticationTag.getter()
{
  return 209;
}

void *TLVTag.availableKernelsMap.unsafeMutableAddressor()
{
  return &static TLVTag.availableKernelsMap;
}

void *TLVTag.blobDefinition.unsafeMutableAddressor()
{
  return &static TLVTag.blobDefinition;
}

uint64_t static TLVTag.blobDefinition.getter()
{
  return 224;
}

void *TLVTag.aidOverridePerformed.unsafeMutableAddressor()
{
  return &static TLVTag.aidOverridePerformed;
}

uint64_t static TLVTag.aidOverridePerformed.getter()
{
  return 57137;
}

void *TLVTag.cardState.unsafeMutableAddressor()
{
  return &static TLVTag.cardState;
}

uint64_t static TLVTag.cardState.getter()
{
  return 57139;
}

void *TLVTag.transactionResultData.unsafeMutableAddressor()
{
  return &static TLVTag.transactionResultData;
}

uint64_t static TLVTag.transactionResultData.getter()
{
  return 14647806;
}

void *TLVTag.trxCipherAndKeyBlobs.unsafeMutableAddressor()
{
  return &static TLVTag.trxCipherAndKeyBlobs;
}

uint64_t static TLVTag.trxCipherAndKeyBlobs.getter()
{
  return 14647807;
}

void *TLVTag.analyticsData.unsafeMutableAddressor()
{
  return &static TLVTag.analyticsData;
}

uint64_t static TLVTag.analyticsData.getter()
{
  return 14647805;
}

void *TLVTag.provisionAppletVersionInfo.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletVersionInfo;
}

void *TLVTag.provisionAppletAnalytics.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletAnalytics;
}

uint64_t static TLVTag.provisionAppletAnalytics.getter()
{
  return 195;
}

void *TLVTag.provisionAppletConfigID.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletConfigID;
}

void *TLVTag.provisionAppletDataBlob.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletDataBlob;
}

uint64_t static TLVTag.provisionAppletDataBlob.getter()
{
  return 203;
}

void *TLVTag.provisionAppletPINDataBlob.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletPINDataBlob;
}

uint64_t static TLVTag.provisionAppletPINDataBlob.getter()
{
  return 204;
}

void *TLVTag.provisionAppletTrackError.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletTrackError;
}

uint64_t static TLVTag.provisionAppletTrackError.getter()
{
  return 205;
}

void *TLVTag.provisionDataFormatVersion.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataFormatVersion;
}

void *TLVTag.provisionDataKeyIdentifier.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataKeyIdentifier;
}

void *TLVTag.provisionDataEphemeralPublicKey.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataEphemeralPublicKey;
}

void *TLVTag.provisionDataCipherText.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataCipherText;
}

void *TLVTag.provisionDataUnpredictableNumber.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataUnpredictableNumber;
}

uint64_t static TLVTag.provisionDataUnpredictableNumber.getter()
{
  return 198;
}

void *TLVTag.provisionDataAuthenticationTag.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataAuthenticationTag;
}

void *TLVTag.provisionDataCASDSignature.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataCASDSignature;
}

uint64_t static TLVTag.provisionDataCASDSignature.getter()
{
  return 210;
}

void *TLVTag.provisionDataApplicationMetaData.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataApplicationMetaData;
}

uint64_t static TLVTag.provisionDataApplicationMetaData.getter()
{
  return 239;
}

void *TLVTag.provisionDataPlatformId.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataPlatformId;
}

void *TLVTag.provisionDataConfigId.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataConfigId;
}

void *TLVTag.provisionDataTransactionId.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataTransactionId;
}

uint64_t static TLVTag.provisionDataTransactionId.getter()
{
  return 206;
}

void *TLVTag.eventStatus.unsafeMutableAddressor()
{
  return &static TLVTag.eventStatus;
}

uint64_t static TLVTag.eventStatus.getter()
{
  return 192;
}

void *TLVTag.eventOutOpsUird.unsafeMutableAddressor()
{
  return &static TLVTag.eventOutOpsUird;
}

void *TLVTag.eventTrackError.unsafeMutableAddressor()
{
  return &static TLVTag.eventTrackError;
}

void *TLVTag.eventSelectPPSEResponse.unsafeMutableAddressor()
{
  return &static TLVTag.eventSelectPPSEResponse;
}

void *TLVTag.eventOutcome.unsafeMutableAddressor()
{
  return &static TLVTag.eventOutcome;
}

void *TLVTag.eventErrorIndication.unsafeMutableAddressor()
{
  return &static TLVTag.eventErrorIndication;
}

void *TLVTag.OFFSET_BYTE_2.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_BYTE_2;
}

void *TLVTag.OFFSET_BYTE_3.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_BYTE_3;
}

void *TLVTag.MASK_LEAST_SIG_NIBBLE.unsafeMutableAddressor()
{
  return &static TLVTag.MASK_LEAST_SIG_NIBBLE;
}

uint64_t static TLVTag.CARD_STATE_EXPIRATION_MASK.getter()
{
  return 15;
}

void *TLVTag.MASK_MOST_SIG_NIBBLE.unsafeMutableAddressor()
{
  return &static TLVTag.MASK_MOST_SIG_NIBBLE;
}

uint64_t static TLVTag.CARD_STATE_EFFECTIVE_MASK.getter()
{
  return 240;
}

void *TLVTag.TAG_9F02_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F02_LENGTH;
}

uint64_t sub_10017CF94()
{
  uint64_t result = _s10Foundation4DataV7SPRBaseE9hexStringACSgSS_tcfC_0(0x3030303030303030, 0xEC00000030303030);
  if (v1 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    static TLVTag.TAG_9F03_DEFAULT = result;
    unk_1001E1290 = v1;
  }
  return result;
}

uint64_t *TLVTag.TAG_9F03_DEFAULT.unsafeMutableAddressor()
{
  if (qword_1001E0820 != -1) {
    swift_once();
  }
  return &static TLVTag.TAG_9F03_DEFAULT;
}

uint64_t static TLVTag.TAG_9F03_DEFAULT.getter()
{
  if (qword_1001E0820 != -1) {
    swift_once();
  }
  uint64_t v0 = static TLVTag.TAG_9F03_DEFAULT;
  sub_1000065D0(static TLVTag.TAG_9F03_DEFAULT, unk_1001E1290);
  return v0;
}

void *TLVTag.TAG_5F2A_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_5F2A_LENGTH;
}

void *TLVTag.TAG_9F1A_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F1A_LENGTH;
}

void *TLVTag.TAG_9F1E_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F1E_LENGTH;
}

uint64_t static TLVTag.TAG_DF8129_LENGTH.getter()
{
  return 8;
}

void *TLVTag.TAG_DF8129_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_DF8129_LENGTH;
}

void *TLVTag.OFFSET_OPS_STATUS.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_OPS_STATUS;
}

void *TLVTag.OPS_STATUS_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.OPS_STATUS_MASK;
}

void *TLVTag.OFFSET_OPS_CVM.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_OPS_CVM;
}

void *TLVTag.OPS_CVM_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.OPS_CVM_MASK;
}

void *TLVTag.TAG_9F34_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F34_LENGTH;
}

void *TLVTag.OFFSET_CVM_RESULTS_CVM_PERFORMED.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_CVM_RESULTS_CVM_PERFORMED;
}

void *TLVTag.OFFSET_CVM_RESULTS_CVM_RESULTS.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_CVM_RESULTS_CVM_RESULTS;
}

void *TLVTag.CVM_RESULTS_NO_CVM_PERFORMED.unsafeMutableAddressor()
{
  return &static TLVTag.CVM_RESULTS_NO_CVM_PERFORMED;
}

uint64_t static TLVTag.CVM_RESULTS_NO_CVM_PERFORMED.getter()
{
  return 63;
}

void *TLVTag.CVM_RESULTS_CVM_SUCCESSFUL.unsafeMutableAddressor()
{
  return &static TLVTag.CVM_RESULTS_CVM_SUCCESSFUL;
}

void *TLVTag.TAG_95_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_95_LENGTH;
}

void *TLVTag.TVR_CV_NOT_SUCCESSFUL_BIT.unsafeMutableAddressor()
{
  return &static TLVTag.TVR_CV_NOT_SUCCESSFUL_BIT;
}

uint64_t static TLVTag.TVR_CV_NOT_SUCCESSFUL_BIT.getter()
{
  return 7;
}

void *TLVTag.TAG_DF8115_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_DF8115_LENGTH;
}

void *TLVTag.OFFSET_ERROR_INDICATION_L2.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_ERROR_INDICATION_L2;
}

void *TLVTag.OFFSET_ERROR_INDICATION_SW12.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_ERROR_INDICATION_SW12;
}

uint64_t static TLVTag.OFFSET_ERROR_INDICATION_SW12.getter()
{
  return 3;
}

void *TLVTag.OFFSET_ERROR_INDICATION_MSG_ON_ERROR.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_ERROR_INDICATION_MSG_ON_ERROR;
}

uint64_t static TLVTag.OFFSET_ERROR_INDICATION_MSG_ON_ERROR.getter()
{
  return 5;
}

void *TLVTag.TAG_9F15_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F15_LENGTH;
}

void *TLVTag.TAG_9F37_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F37_LENGTH;
}

void *TLVTag.CARD_STATE_EXPIRATION_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.CARD_STATE_EXPIRATION_MASK;
}

void *TLVTag.CARD_STATE_EFFECTIVE_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.CARD_STATE_EFFECTIVE_MASK;
}

void *TLVTag.casdPublicKey.unsafeMutableAddressor()
{
  return &static TLVTag.casdPublicKey;
}

uint64_t static TLVTag.casdPublicKey.getter()
{
  return 32585;
}

void *TLVTag.casdPublicKeyData.unsafeMutableAddressor()
{
  return &static TLVTag.casdPublicKeyData;
}

uint64_t static TLVTag.casdPublicKeyData.getter()
{
  return 176;
}

uint64_t TLVTag.init(application:isConstructed:)(unint64_t a1, char a2)
{
  uint64_t v2 = 64;
  if (a2) {
    uint64_t v2 = 96;
  }
  if (a1 <= 0x1F) {
    return v2 | a1;
  }
  uint64_t v4 = v2 | 0x1F;
  if (a1 < 0x80) {
    return a1 | (v4 << 8);
  }
  do
  {
    uint64_t v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    unint64_t v5 = a1 >> 7;
    BOOL v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t TLVTag.init(contextSpecific:isConstructed:)(unint64_t a1, char a2)
{
  uint64_t v2 = 128;
  if (a2) {
    uint64_t v2 = 160;
  }
  if (a1 <= 0x1F) {
    return v2 | a1;
  }
  uint64_t v4 = v2 | 0x1F;
  if (a1 < 0x80) {
    return a1 | (v4 << 8);
  }
  do
  {
    uint64_t v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    unint64_t v5 = a1 >> 7;
    BOOL v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t TLVTag.init(private:isConstructed:)(unint64_t a1, char a2)
{
  uint64_t v2 = 192;
  if (a2) {
    uint64_t v2 = 224;
  }
  if (a1 <= 0x1F) {
    return v2 | a1;
  }
  uint64_t v4 = v2 | 0x1F;
  if (a1 < 0x80) {
    return a1 | (v4 << 8);
  }
  do
  {
    uint64_t v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    unint64_t v5 = a1 >> 7;
    BOOL v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_10017D310()
{
  uint64_t v1 = *v0;
  sub_100003EB0((uint64_t *)&unk_1001DD3C0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100186100;
  *(void *)(v2 + 56) = &type metadata for UInt;
  *(void *)(v2 + 64) = &protocol witness table for UInt;
  *(void *)(v2 + 32) = v1;

  return String.init(format:_:)();
}

ValueMetadata *type metadata accessor for TLVTag()
{
  return &type metadata for TLVTag;
}

void static JSONEncoder.encodeClean<A>(_:outputFormatting:)(uint64_t a1, uint64_t a2)
{
  sub_10017D428(a2, &v4);
}

uint64_t sub_10017D428@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v14 = a2;
  uint64_t v4 = type metadata accessor for JSONEncoder.OutputFormatting();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  BOOL v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  uint64_t v8 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  uint64_t v10 = v9;
  uint64_t result = swift_release();
  if (!v2)
  {
    Swift::String v12 = v14;
    *unint64_t v14 = v8;
    v12[1] = v10;
  }
  return result;
}

void static JSONDecoder.decodeClean<A>(_:from:userInfo:)()
{
  sub_10017D60C();
}

uint64_t sub_10017D60C()
{
  return swift_release();
}

void DERWriter.writeDER(tlv:)(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  DERWriter.writeDER(tag:)(a1[2], a2, a3);
  if (!v3)
  {
    Swift::Int v7 = TLV.length.getter();
    DERWriter.writeDER(length:)(v7);
    if (!v8)
    {
      unint64_t v10 = a1[3];
      unint64_t v9 = a1[4];
      if ((v9 & 0x2000000000000000) == 0)
      {
        v20[0] = a1[3];
        v20[1] = v9;
        unint64_t v11 = *(void (**)(void *, void *, unint64_t, uint64_t, uint64_t))(a3 + 16);
        sub_1000065D0(v10, v9);
        unint64_t v12 = sub_1000DF2B0();
        v11(v20, &type metadata for Data, v12, a2, a3);
        goto LABEL_17;
      }
      if (v10 >> 62) {
        goto LABEL_16;
      }
      uint64_t v13 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v13; uint64_t v13 = _CocoaArrayWrapper.endIndex.getter())
      {
        unint64_t v18 = v9;
        unint64_t v19 = v10;
        unint64_t v21 = v10 & 0xC000000000000001;
        unint64_t v9 = 4;
        while (1)
        {
          unint64_t v14 = v9 - 4;
          if (!v21) {
            break;
          }
          unint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          unint64_t v15 = v9 - 3;
          if (__OFADD__(v14, 1)) {
            goto LABEL_15;
          }
LABEL_13:
          DERWriter.writeDER(tlv:)(v10, a2, a3);
          swift_release();
          ++v9;
          unint64_t v10 = v19;
          if (v15 == v13)
          {
            uint64_t v16 = v19;
            unint64_t v17 = v18;
            goto LABEL_18;
          }
        }
        unint64_t v10 = *(void *)(v10 + 8 * v9);
        swift_retain();
        unint64_t v15 = v9 - 3;
        if (!__OFADD__(v14, 1)) {
          goto LABEL_13;
        }
LABEL_15:
        __break(1u);
LABEL_16:
        swift_bridgeObjectRetain();
      }
LABEL_17:
      uint64_t v16 = v10;
      unint64_t v17 = v9;
LABEL_18:
      sub_100173E78(v16, v17);
    }
  }
}

uint64_t DERMemoryWriter.__allocating_init(capacity:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  if (a1)
  {
    if (a1 <= 14)
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v3 = __DataStorage.init(capacity:)();
      if ((unint64_t)a1 > 0x7FFFFFFE)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t v4 = swift_allocObject();
        unint64_t v5 = v3 | 0x8000000000000000;
        *(void *)(v4 + 16) = 0;
        *(void *)(v4 + 24) = 0;
      }
      else
      {
        uint64_t v4 = 0;
        unint64_t v5 = v3 | 0x4000000000000000;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xC000000000000000;
  }
  *(void *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = v5;
  return v2;
}

uint64_t sub_10017D958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = __chkstk_darwin();
  unint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t DERWriter.writeDER(tag:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    unint64_t v11 = bswap64(a1);
    return sub_10017DC9C((uint64_t)&v11, (uint64_t)&v12, v3, __clz(a1) >> 3, a2, a3, &v10);
  }
  else
  {
    LOBYTE(v11) = 0;
    Swift::Int v7 = *(uint64_t (**)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    unint64_t v8 = sub_100179B70();
    unint64_t v9 = sub_10002C874();
    return v7(&v11, &type metadata for UInt8, v8, v9, a2, a3);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DERWriter.writeDER(length:)(Swift::Int length)
{
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  if (length > 127)
  {
    unint64_t v11 = __clz(length) >> 3;
    LOBYTE(v16) = -120 - v11;
    uint64_t v12 = *(void (**)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(v2 + 8);
    unint64_t v13 = sub_100179B70();
    unint64_t v14 = sub_10002C874();
    v12(&v16, &type metadata for UInt8, v13, v14, v6, v5);
    if (!v4)
    {
      unint64_t v16 = bswap64(length);
      sub_10017DC9C((uint64_t)&v16, (uint64_t)&v17, v3, v11, v6, v5, &v15);
    }
  }
  else
  {
    if (length < 0) {
      __break(1u);
    }
    LOBYTE(v16) = length;
    unint64_t v8 = *(void (**)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(v2 + 8);
    unint64_t v9 = sub_100179B70();
    unint64_t v10 = sub_10002C874();
    v8(&v16, &type metadata for UInt8, v9, v10, v6, v5);
  }
}

uint64_t sub_10017DC9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  v18[0] = sub_10017B9F4(a4, a1, a2);
  v18[1] = v11;
  _OWORD v18[2] = v12;
  v18[3] = v13;
  unint64_t v14 = *(uint64_t (**)(void *, uint64_t, unint64_t, uint64_t, uint64_t))(a6 + 16);
  uint64_t v15 = sub_100003EB0(&qword_1001E0AB8);
  unint64_t v16 = sub_10017EE00();
  uint64_t result = v14(v18, v15, v16, a5, a6);
  if (v7) {
    *a7 = v7;
  }
  return result;
}

id NSOutputStream.write<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CocoaError.Code();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v17 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CocoaError();
  uint64_t v18 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  unint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a2 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v13, v14);
  dispatch thunk of FixedWidthInteger.bigEndian.getter();
  unint64_t v21 = v2;
  sub_10017D958((uint64_t)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_10017E790, (uint64_t)v20, a2, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Never, v15);
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))((char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  if (v19 < 0)
  {
    id result = [v2 streamError];
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (v19 == v12) {
      return result;
    }
    static CocoaError.Code.fileWriteOutOfSpace.getter();
    sub_1000E9D34((uint64_t)_swiftEmptyArrayStorage);
    sub_10017ECC8();
    _BridgedStoredNSError.init(_:userInfo:)();
    CocoaError._nsError.getter();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v7);
  }
  return (id)swift_willThrow();
}

char *NSOutputStream.write<A>(contentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = a1;
  uint64_t v5 = type metadata accessor for CocoaError.Code();
  __chkstk_darwin(v5 - 8, v6);
  v37[1] = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CocoaError();
  uint64_t v38 = *(void *)(v8 - 8);
  uint64_t v39 = v8;
  __chkstk_darwin(v8, v9);
  v37[0] = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = a3;
  uint64_t v48 = a2;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v41 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v12);
  uint64_t v14 = (char *)v37 - v13;
  uint64_t v15 = type metadata accessor for Optional();
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)v37 - v17;
  uint64_t v19 = swift_checkMetadataState();
  __chkstk_darwin(v19, v20);
  uint64_t v21 = swift_getAssociatedTypeWitness();
  uint64_t v40 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v22);
  unint64_t v24 = (char *)v37 - v23;
  dispatch thunk of DataProtocol.regions.getter();
  unint64_t v45 = v24;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v46 = v21;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v25 = 0;
  unint64_t v26 = (unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
  unint64_t v27 = (uint64_t (**)(char *, char *, uint64_t))(v41 + 32);
  uint64_t v28 = (void (**)(char *, uint64_t))(v41 + 8);
  while (1)
  {
    dispatch thunk of IteratorProtocol.next()();
    if ((*v26)(v18, 1, AssociatedTypeWitness) == 1) {
      goto LABEL_7;
    }
    uint64_t v29 = (*v27)(v14, v18, AssociatedTypeWitness);
    __chkstk_darwin(v29, v30);
    v37[-2] = v43;
    swift_getAssociatedConformanceWitness();
    uint64_t v31 = v49;
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    uint64_t v49 = v31;
    uint64_t v32 = v50;
    if (v50 < 0) {
      break;
    }
    (*v28)(v14, AssociatedTypeWitness);
    BOOL v33 = __OFADD__(v25, v32);
    v25 += v32;
    if (v33)
    {
      __break(1u);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v40 + 8))(v45, v46);
      id result = (char *)dispatch thunk of Collection.count.getter();
      if (v25 != result)
      {
        static CocoaError.Code.fileWriteOutOfSpace.getter();
        sub_1000E9D34((uint64_t)_swiftEmptyArrayStorage);
        sub_10017ECC8();
        uint64_t v35 = v37[0];
        uint64_t v36 = v39;
        _BridgedStoredNSError.init(_:userInfo:)();
        CocoaError._nsError.getter();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v35, v36);
        return (char *)swift_willThrow();
      }
      return result;
    }
  }
  id result = (char *)[v43 streamError];
  if (result)
  {
    swift_willThrow();
    (*v28)(v14, AssociatedTypeWitness);
    return (char *)(*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v45, v46);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10017E5A4@<X0>(id a1@<X2>, id result@<X0>, uint64_t a3@<X1>, void *a4@<X8>)
{
  if (result)
  {
    id result = [a1 write:result maxLength:a3 - (void)result];
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10017E5F4(uint64_t a1, uint64_t a2)
{
  return NSOutputStream.write<A>(_:)(a1, a2);
}

char *sub_10017E60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NSOutputStream.write<A>(contentsOf:)(a1, a2, a3);
}

uint64_t sub_10017E624(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void *)(v4 + 24);
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  sub_1000065D0(v2, v3);
  return sub_100006628(v5, v6);
}

uint64_t DERMemoryWriter.memory.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1000065D0(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t DERMemoryWriter.init(capacity:)(uint64_t a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    unint64_t v3 = a1;
    if (a1 <= 14)
    {
      a1 = 0;
      unint64_t v5 = 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v4 = __DataStorage.init(capacity:)();
      if (v3 > 0x7FFFFFFE)
      {
        type metadata accessor for Data.RangeReference();
        a1 = swift_allocObject();
        unint64_t v5 = v4 | 0x8000000000000000;
        *(void *)(a1 + 16) = 0;
        *(void *)(a1 + 24) = 0;
      }
      else
      {
        a1 = 0;
        unint64_t v5 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    unint64_t v5 = 0xC000000000000000;
  }
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v5;
  return v2;
}

id sub_10017E790@<X0>(id result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (result)
  {
    id result = [*(id *)(v3 + 16) write:result maxLength:a2 - (void)result];
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t DERMemoryWriter.write<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  unint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of FixedWidthInteger.bigEndian.getter();
  sub_10017D958((uint64_t)v6, (uint64_t)sub_10017ED20, v2, a2, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for () + 8, (uint64_t)&protocol witness table for Never, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a2);
}

uint64_t sub_10017E92C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  v5[3] = &type metadata for UnsafeRawBufferPointer;
  v5[4] = &protocol witness table for UnsafeRawBufferPointer;
  v5[0] = a1;
  v5[1] = a2;
  sub_100006788(v5, (uint64_t)&type metadata for UnsafeRawBufferPointer);
  Data._Representation.append(contentsOf:)();
  sub_100006520((uint64_t)v5);
  return swift_endAccess();
}

uint64_t DERMemoryWriter.write<A>(contentsOf:)()
{
  return swift_endAccess();
}

uint64_t DERMemoryWriter.deinit()
{
  sub_100006628(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return v0;
}

uint64_t DERMemoryWriter.__deallocating_deinit()
{
  sub_100006628(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return swift_deallocClassInstance();
}

uint64_t sub_10017EA9C(uint64_t a1, uint64_t a2)
{
  return DERMemoryWriter.write<A>(_:)(a1, a2);
}

uint64_t sub_10017EAB4()
{
  return DERMemoryWriter.write<A>(contentsOf:)();
}

uint64_t NSFileHandle.write<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  unint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of FixedWidthInteger.bigEndian.getter();
  uint64_t v12 = v2;
  uint64_t v7 = sub_100003EB0((uint64_t *)&unk_1001DD380);
  sub_10017D958((uint64_t)v6, (uint64_t)sub_10017ED40, (uint64_t)v11, a2, v7, (uint64_t)&type metadata for () + 8, (uint64_t)&protocol self-conformance witness table for Error, (uint64_t)&v10);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a2);
}

uint64_t sub_10017EC34(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1000E9CE0();
  uint64_t result = NSFileHandle.write<A>(contentsOf:)();
  if (v4) {
    *a4 = v4;
  }
  return result;
}

uint64_t sub_10017EC98(uint64_t a1, uint64_t a2)
{
  return NSFileHandle.write<A>(_:)(a1, a2);
}

uint64_t sub_10017ECB0()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

unint64_t sub_10017ECC8()
{
  unint64_t result = qword_1001DE298;
  if (!qword_1001DE298)
  {
    type metadata accessor for CocoaError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001DE298);
  }
  return result;
}

uint64_t sub_10017ED20(uint64_t a1, uint64_t a2)
{
  return sub_10017E92C(a1, a2);
}

uint64_t sub_10017ED40(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_10017EC34(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t sub_10017ED60@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_1000065D0(v4, v5);
}

uint64_t type metadata accessor for DERMemoryWriter()
{
  return self;
}

uint64_t sub_10017EDD4()
{
  return Data._Representation.append(contentsOf:)();
}

unint64_t sub_10017EE00()
{
  unint64_t result = qword_1001E0BA8[0];
  if (!qword_1001E0BA8[0])
  {
    sub_100003EF4(&qword_1001E0AB8);
    sub_1000E9CE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001E0BA8);
  }
  return result;
}

uint64_t LazySequenceProtocol.padding(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v9);
  uint64_t v11 = (char *)&v19 - v10;
  double v14 = __chkstk_darwin(v12, v13);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v17 + 16))(v16, v3, a2, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, AssociatedTypeWitness);
  return sub_10017F540((uint64_t)v16, (uint64_t)v11, a2, a3);
}

uint64_t LazyPaddedSequence.Iterator.next()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v14 - v8;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v11 = v2 + *(int *)(a1 + 36);
    uint64_t v12 = v15;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v15, v11, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  else
  {
    uint64_t v12 = v15;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v15, v9, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_10017F228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a3, a1, AssociatedTypeWitness);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for LazyPaddedSequence.Iterator() + 36);
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);

  return v9(v7, a2, v8);
}

uint64_t LazyPaddedSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v23 = a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v8);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = *(void *)(v5 - 8);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_getAssociatedTypeWitness();
  double v18 = __chkstk_darwin(v16 - 8, v17);
  uint64_t v20 = (char *)&v22 - v19;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v11 + 16))(v15, v3, v5, v18);
  dispatch thunk of Sequence.makeIterator()();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v3 + *(int *)(a1 + 36), AssociatedTypeWitness);
  return sub_10017F228((uint64_t)v20, (uint64_t)v10, v23);
}

uint64_t sub_10017F540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t v6 = a4 + *(int *)(type metadata accessor for LazyPaddedSequence() + 36);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32);

  return v8(v6, a2, AssociatedTypeWitness);
}

uint64_t sub_10017F61C()
{
  return swift_getWitnessTable();
}

uint64_t sub_10017F63C()
{
  return swift_getWitnessTable();
}

uint64_t sub_10017F658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  LazyPaddedSequence.makeIterator()(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);

  return v4(v2, a1);
}

uint64_t sub_10017F6B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = j___ss30_copySequenceToContiguousArrayys0dE0Vy7ElementQzGxSTRzlF(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8))(v2, a1);
  return v4;
}

uint64_t sub_10017F72C()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t sub_10017F750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_10017F758()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return AssociatedTypeWitness;
}

uint64_t *sub_10017F848(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v9 + 80));
  if (v12 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || (v11 & (unint64_t)~v10) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) > 0x18)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    uint64_t v16 = AssociatedTypeWitness;
    uint64_t v17 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v17, ((unint64_t)a2 + v11) & v17, v16);
  }
  return a1;
}

uint64_t sub_10017F9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(uint64_t, void))v3)(a1, *(void *)(a2 + 16));
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = AssociatedTypeWitness;
  unint64_t v9 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v9, v8);
}

uint64_t sub_10017FA94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_10017FB68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_10017FC3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_10017FD10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_10017FDE4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(v6 + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v14 = (v13 & ~v12) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v7 >= v10)
        {
          uint64_t v23 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
          return v23(a1, v7, v5);
        }
        else
        {
          uint64_t v21 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v21(((unint64_t)a1 + v13) & ~v12);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = v14;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v11 + (v20 | v18) + 1;
}

void sub_100180078(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v24 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v8 + 64) + v14;
  size_t v16 = (v15 & ~v14) + *(void *)(v10 + 64);
  if (a3 <= v13)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v13 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v18 = ~v13 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x10018038CLL);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v12)
        {
          uint64_t v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
          v23(a1, a2, v9, v7);
        }
        else
        {
          uint64_t v22 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
          v22((unint64_t)&a1[v15] & ~v14, a2);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for LazyPaddedSequence()
{
  return sub_1001811B8();
}

uint64_t sub_1001803CC()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1001804D0(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = (*(unsigned char *)(v5 + 80) | *(unsigned char *)(v8 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || ((v6 + v9) & (unint64_t)~v9) + *(void *)(*(void *)(v7 - 8) + 64) > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    uint64_t v15 = v7;
    uint64_t v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v16, ((unint64_t)a2 + v10) & v16, v15);
  }
  return a1;
}

uint64_t sub_100180678(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v3)(a1, AssociatedTypeWitness);
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v5;
  unint64_t v9 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v9, v8);
}

uint64_t sub_10018076C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_100180864(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_10018095C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_100180A54(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_100180B4C(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  if (v9 <= v6) {
    unsigned int v10 = v6;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(v5 + 64) + v11;
  if (a2 <= v10) {
    goto LABEL_24;
  }
  uint64_t v13 = (v12 & ~v11) + *(void *)(*(void *)(v7 - 8) + 64);
  char v14 = 8 * v13;
  if (v13 <= 3)
  {
    unsigned int v16 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v16))
    {
      int v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 > 0xFF)
    {
      int v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(unsigned __int16 *)((char *)a1 + v13)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 < 2)
    {
LABEL_24:
      if (v10)
      {
        if (v6 >= v9)
        {
          uint64_t v22 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
          return v22(a1, v6, AssociatedTypeWitness);
        }
        else
        {
          unsigned int v20 = *(uint64_t (**)(unint64_t))(v8 + 48);
          return v20(((unint64_t)a1 + v12) & ~v11);
        }
      }
      return 0;
    }
  }
  int v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((unsigned char *)a1 + v13)) {
    goto LABEL_24;
  }
LABEL_14:
  int v17 = (v15 - 1) << v14;
  if (v13 > 3) {
    int v17 = 0;
  }
  if (v13)
  {
    if (v13 <= 3) {
      int v18 = v13;
    }
    else {
      int v18 = 4;
    }
    switch(v18)
    {
      case 2:
        int v19 = *a1;
        break;
      case 3:
        int v19 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v19 = *(_DWORD *)a1;
        break;
      default:
        int v19 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v19 = 0;
  }
  return v10 + (v19 | v17) + 1;
}

void sub_100180E28(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v10 = v9;
  unsigned int v11 = *(_DWORD *)(v9 + 84);
  if (v11 <= v8) {
    unsigned int v12 = v8;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = *(void *)(v7 + 64) + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(v9 + 64);
  if (a3 <= v12)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 - v12 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (v12 < a2)
  {
    unsigned int v17 = ~v12 + a2;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v15)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x100181174);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v8 >= v11)
        {
          uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
          v22(a1, a2, v8, AssociatedTypeWitness);
        }
        else
        {
          int v21 = *(void (**)(unint64_t, uint64_t))(v10 + 56);
          v21((unint64_t)&a1[v14] & ~v13, a2);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for LazyPaddedSequence.Iterator()
{
  return sub_1001811B8();
}

uint64_t sub_1001811B8()
{
  return swift_getGenericMetadata();
}

uint64_t Data.sha256Digest.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for SHA256();
  uint64_t v21 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SHA256Digest();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  unsigned int v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100181C10(&qword_1001DCDE8, (void (*)(uint64_t))&type metadata accessor for SHA256);
  dispatch thunk of HashFunction.init()();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v20 = v9;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      uint64_t v19 = 0;
      sub_1000065D0(a1, a2);
      sub_10012B4BC((int)a1, a1 >> 32);
      sub_100006628(a1, a2);
      uint64_t v9 = v20;
      goto LABEL_9;
    case 2uLL:
      uint64_t v19 = 0;
      uint64_t v20 = v9;
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      sub_1000065D0(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v15 = v14;
      uint64_t v9 = v20;
      sub_10012B4BC(v15, v13);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      memset(v23, 0, 14);
      goto LABEL_7;
    default:
      v23[0] = a1;
      LOWORD(v23[1]) = a2;
      BYTE2(v23[1]) = BYTE2(a2);
      BYTE3(v23[1]) = BYTE3(a2);
      BYTE4(v23[1]) = BYTE4(a2);
      BYTE5(v23[1]) = BYTE5(a2);
LABEL_7:
      dispatch thunk of HashFunction.update(bufferPointer:)();
LABEL_8:
      sub_100006628(a1, a2);
LABEL_9:
      dispatch thunk of HashFunction.finalize()();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v4);
      uint64_t v24 = v8;
      uint64_t v25 = sub_100181C10(&qword_1001DCDE0, (void (*)(uint64_t))&type metadata accessor for SHA256Digest);
      int v16 = sub_10008CDF4(v23);
      (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 16))(v16, v12, v8);
      sub_100006788(v23, v24);
      dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      uint64_t v17 = v22;
      sub_100006520((uint64_t)v23);
      return v17;
  }
}

uint64_t Data.xor(with:)(uint64_t result, unint64_t a2)
{
  unsigned __int8 v31 = BYTE6(a2);
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  unint64_t v5 = v4 >> 62;
  uint64_t v6 = result;
  switch(v4 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(v3) - v3;
      if (__OFSUB__(HIDWORD(v3), v3)) {
        goto LABEL_79;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (!v7) {
        return result;
      }
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(v3 + 16);
      uint64_t v8 = *(void *)(v3 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_80;
    case 3uLL:
      return result;
    default:
      uint64_t v7 = BYTE6(v4);
      goto LABEL_6;
  }
  unint64_t v11 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result)) {
        goto LABEL_82;
      }
      uint64_t v12 = (int)v12;
LABEL_12:
      if (!v12) {
        return result;
      }
      if (v5)
      {
        if (v5 == 1)
        {
          LODWORD(v15) = HIDWORD(v3) - v3;
          if (__OFSUB__(HIDWORD(v3), v3))
          {
LABEL_84:
            __break(1u);
            goto LABEL_85;
          }
          uint64_t v15 = (int)v15;
        }
        else
        {
          uint64_t v17 = *(void *)(v3 + 16);
          uint64_t v16 = *(void *)(v3 + 24);
          BOOL v10 = __OFSUB__(v16, v17);
          uint64_t v15 = v16 - v17;
          if (v10)
          {
LABEL_85:
            __break(1u);
            goto LABEL_86;
          }
        }
      }
      else
      {
        uint64_t v15 = BYTE6(v4);
      }
      if (v11)
      {
        if (v11 == 1)
        {
          LODWORD(v18) = HIDWORD(result) - result;
          if (__OFSUB__(HIDWORD(result), result))
          {
LABEL_86:
            __break(1u);
            goto LABEL_87;
          }
          uint64_t v18 = (int)v18;
        }
        else
        {
          uint64_t v20 = *(void *)(result + 16);
          uint64_t v19 = *(void *)(result + 24);
          BOOL v10 = __OFSUB__(v19, v20);
          uint64_t v18 = v19 - v20;
          if (v10)
          {
LABEL_87:
            __break(1u);
            goto LABEL_88;
          }
        }
      }
      else
      {
        uint64_t v18 = BYTE6(a2);
      }
      if (v15 != v18) {
        return result;
      }
      if (v5)
      {
        if (v5 == 1)
        {
          if (__OFSUB__(HIDWORD(v3), v3))
          {
LABEL_88:
            __break(1u);
LABEL_89:
            __break(1u);
          }
          uint64_t v21 = HIDWORD(v3) - (int)v3;
        }
        else
        {
          uint64_t v24 = v3 + 16;
          uint64_t v23 = *(void *)(v3 + 16);
          uint64_t v22 = *(void *)(v24 + 8);
          uint64_t v21 = v22 - v23;
          if (__OFSUB__(v22, v23)) {
            goto LABEL_89;
          }
        }
        if (v21 < 0) {
          goto LABEL_81;
        }
      }
      else
      {
        uint64_t v21 = BYTE6(v4);
      }
      if (!v21) {
        return result;
      }
      int64_t v25 = 0;
      int64_t v30 = (int)result;
      uint64_t v29 = result >> 32;
      break;
    case 2uLL:
      uint64_t v14 = *(void *)(result + 16);
      uint64_t v13 = *(void *)(result + 24);
      BOOL v10 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v10) {
        goto LABEL_12;
      }
      goto LABEL_83;
    case 3uLL:
      return result;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_12;
  }
  while (2)
  {
    if (v21 == v25)
    {
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    uint64_t v26 = v25;
    if (v11)
    {
      if (v11 == 1)
      {
        if (v25 < v30 || v25 >= v29) {
          goto LABEL_68;
        }
        if (!__DataStorage._bytes.getter())
        {
          __break(1u);
LABEL_91:
          __break(1u);
LABEL_92:
          __break(1u);
LABEL_93:
          __break(1u);
LABEL_94:
          __break(1u);
          JUMPOUT(0x100181B2CLL);
        }
        if (__OFSUB__(v25, __DataStorage._offset.getter())) {
          goto LABEL_71;
        }
      }
      else
      {
        if (v25 < *(void *)(v6 + 16)) {
          goto LABEL_70;
        }
        if (v25 >= *(void *)(v6 + 24)) {
          goto LABEL_72;
        }
        if (!__DataStorage._bytes.getter()) {
          goto LABEL_91;
        }
        if (__OFSUB__(v25, __DataStorage._offset.getter())) {
          goto LABEL_73;
        }
      }
    }
    else if (v25 >= (unint64_t)v31)
    {
      goto LABEL_69;
    }
    ++v25;
    uint64_t v28 = *v2;
    unint64_t v27 = v2[1];
    switch(v27 >> 62)
    {
      case 1uLL:
        if (v26 >= v28 >> 32 || v26 < (int)v28) {
          goto LABEL_75;
        }
        if (!__DataStorage._bytes.getter()) {
          goto LABEL_93;
        }
        if (!__OFSUB__(v26, __DataStorage._offset.getter())) {
          goto LABEL_35;
        }
        goto LABEL_77;
      case 2uLL:
        if (v26 < *(void *)(v28 + 16)) {
          goto LABEL_76;
        }
        if (v26 >= *(void *)(v28 + 24)) {
          goto LABEL_78;
        }
        if (!__DataStorage._bytes.getter()) {
          goto LABEL_94;
        }
        uint64_t result = __DataStorage._offset.getter();
        if (!__OFSUB__(v26, result))
        {
LABEL_35:
          uint64_t result = Data._Representation.subscript.setter();
          if (v21 == v25) {
            return result;
          }
          continue;
        }
        __break(1u);
        return result;
      case 3uLL:
        goto LABEL_92;
      default:
        if (v26 < (unint64_t)BYTE6(v27)) {
          goto LABEL_35;
        }
        goto LABEL_74;
    }
  }
}

uint64_t static Data.randomBytes(count:)(size_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    size_t v1 = a1;
    if (a1)
    {
      unint64_t v2 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      v2[2] = v1;
      bzero(v2 + 4, v1);
    }
    else
    {
      unint64_t v2 = _swiftEmptyArrayStorage;
      size_t v1 = _swiftEmptyArrayStorage[2];
    }
    if (!SecRandomCopyBytes(kSecRandomDefault, v1, v2 + 4))
    {
      uint64_t v3 = sub_10012CB58((uint64_t)v2);
      swift_bridgeObjectRelease();
      return v3;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_100181C10(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

Swift::String __swiftcall String.redactedToken()()
{
  unint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v14 = 46;
  unint64_t v15 = 0xE100000000000000;
  v13[2] = &v14;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000934A8(0x7FFFFFFFFFFFFFFFLL, 1, sub_100095158, (uint64_t)v13, v3, v2);
  if (*(void *)(v4 + 16) == 3)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = static String._fromSubstring(_:)();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    uint64_t v14 = v5;
    unint64_t v15 = v7;
    v8._uint64_t countAndFlagsBits = 46;
    v8._object = (void *)0xE100000000000000;
    String.append(_:)(v8);
    if (*(void *)(v4 + 16) < 2uLL)
    {
      __break(1u);
      goto LABEL_7;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v11._uint64_t countAndFlagsBits = static String._fromSubstring(_:)();
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = v14;
    unint64_t v2 = v15;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = v3;
  BOOL v10 = (void *)v2;
LABEL_7:
  result._object = v10;
  result._uint64_t countAndFlagsBits = v9;
  return result;
}

uint64_t OID.derRepresentation.getter(void *a1)
{
  sub_100003EB0(&qword_1001D8778);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_100186100;
  unint64_t v3 = a1[2];
  if (!v3)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v5 = a1 + 4;
  unint64_t v4 = a1[4];
  if (!is_mul_ok(v4, 0x28uLL))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v3 < 2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = 40 * v4;
  uint64_t v7 = a1[5];
  BOOL v8 = __CFADD__(v6, v7);
  unint64_t v9 = v6 + v7;
  if (v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v9 <= 0xFF)
  {
    *(unsigned char *)(result + 32) = v9;
    uint64_t v10 = sub_10012CB58(result);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v3 < 3) {
      return v10;
    }
    unint64_t v13 = 2;
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_1000065D0(v10, v12);
    while (v13 < v3)
    {
      unint64_t v14 = v5[v13];
      unint64_t v15 = sub_10015A690(0, 1, 1, _swiftEmptyArrayStorage);
      unint64_t v17 = v15[2];
      unint64_t v16 = v15[3];
      if (v17 >= v16 >> 1) {
        unint64_t v15 = sub_10015A690((void *)(v16 > 1), v17 + 1, 1, v15);
      }
      v15[2] = v17 + 1;
      *((unsigned char *)v15 + v17 + 32) = v14 & 0x7F;
      if (v14 >= 0x80)
      {
        unint64_t v18 = v17 + 33;
        do
        {
          unint64_t v19 = v15[3];
          if (v18 - 32 >= v19 >> 1) {
            unint64_t v15 = sub_10015A690((void *)(v19 > 1), v18 - 31, 1, v15);
          }
          unint64_t v20 = v14 >> 14;
          v14 >>= 7;
          v15[2] = v18 - 31;
          *((unsigned char *)v15 + v18++) = v14 | 0x80;
        }
        while (v20);
      }
      ++v13;
      sub_10016F8E0((uint64_t)v15);
      uint64_t result = swift_bridgeObjectRelease();
      if (v13 == v3)
      {
        swift_bridgeObjectRelease();
        sub_100006628(v10, v12);
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
LABEL_25:
  __break(1u);
  return result;
}

char *OID.init(dotRepresentation:)(uint64_t a1, unint64_t a2)
{
  uint64_t v23 = 46;
  uint64_t v24 = 0xE100000000000000;
  void v21[2] = &v23;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000934A8(0x7FFFFFFFFFFFFFFFLL, 0, sub_1000EC354, (uint64_t)v21, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = (unint64_t *)(v4 + 56);
    uint64_t v7 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      unint64_t v9 = *(v6 - 3);
      unint64_t v8 = *(v6 - 2);
      if ((v8 ^ v9) >= 0x4000)
      {
        unint64_t v11 = *(v6 - 1);
        unint64_t v10 = *v6;
        if ((*v6 & 0x1000000000000000) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = (uint64_t)sub_1001824E0(v9, v8, v11, v10, 10);
          char v18 = v17;
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0) {
            goto LABEL_12;
          }
        }
        else
        {
          if ((v10 & 0x2000000000000000) != 0)
          {
            uint64_t v23 = *(v6 - 1);
            uint64_t v24 = v10 & 0xFFFFFFFFFFFFFFLL;
            unint64_t v12 = &v23;
          }
          else if ((v11 & 0x1000000000000000) != 0)
          {
            unint64_t v12 = (uint64_t *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            unint64_t v12 = (uint64_t *)_StringObject.sharedUTF8.getter();
          }
          uint64_t v13 = sub_100182AC0((uint64_t)v12, v9, v8, v11, v10, 10);
          char v22 = v14 & 1;
          if ((v14 & 1) == 0)
          {
LABEL_12:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v7 = sub_100171E50(0, *((void *)v7 + 2) + 1, 1, v7);
            }
            unint64_t v16 = *((void *)v7 + 2);
            unint64_t v15 = *((void *)v7 + 3);
            if (v16 >= v15 >> 1) {
              uint64_t v7 = sub_100171E50((char *)(v15 > 1), v16 + 1, 1, v7);
            }
            *((void *)v7 + 2) = v16 + 1;
            *(void *)&v7[8 * v16 + 32] = v13;
          }
        }
      }
      v6 += 4;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v4 + 16);
        goto LABEL_21;
      }
    }
  }
  uint64_t v19 = 0;
  uint64_t v7 = (char *)_swiftEmptyArrayStorage;
LABEL_21:
  swift_bridgeObjectRelease();
  if (v19 != *((void *)v7 + 2))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v7;
}

void sub_100182208()
{
  static OID.commonName = (uint64_t)&off_1001CCA60;
}

uint64_t *OID.commonName.unsafeMutableAddressor()
{
  if (qword_1001E0828 != -1) {
    swift_once();
  }
  return &static OID.commonName;
}

uint64_t static OID.commonName.getter()
{
  return sub_100171148(&qword_1001E0828);
}

void sub_10018228C()
{
  static OID.sha256WithEcdsa = (uint64_t)&off_1001CCAA0;
}

uint64_t *OID.sha256WithEcdsa.unsafeMutableAddressor()
{
  if (qword_1001E0830 != -1) {
    swift_once();
  }
  return &static OID.sha256WithEcdsa;
}

uint64_t static OID.sha256WithEcdsa.getter()
{
  return sub_100171148(&qword_1001E0830);
}

uint64_t OID.dotRepresentation.getter(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_10014B9C4(0, v1, 0);
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v5 = v4;
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v7 >= v6 >> 1) {
        sub_10014B9C4(v6 > 1, v7 + 1, 1);
      }
      ++v2;
      _swiftEmptyArrayStorage[2] = v7 + 1;
      unint64_t v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v3;
      v8[5] = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  sub_100003EB0((uint64_t *)&unk_1001DA570);
  sub_10002B658();
  uint64_t v9 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v9;
}

BOOL sub_100182460(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = a1 + 5;
  unint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_1001824D4(void **a1, void **a2)
{
  return sub_100182460(*a1, *a2);
}

unsigned __int8 *sub_1001824E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_1000951B0();
  swift_bridgeObjectRetain();
  uint64_t v7 = String.init<A>(_:)();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_10009449C();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v13 = sub_1001825D4(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_1001825D4(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            unint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v14 = v9 * a3;
              unsigned __int8 v15 = v11 + v12;
              BOOL v16 = v14 >= v15;
              unint64_t v9 = v14 - v15;
              if (!v16) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_67;
    }
    if (a2)
    {
      unsigned __int8 v26 = a3 + 48;
      unsigned __int8 v27 = a3 + 55;
      unsigned __int8 v28 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v26 = 58;
      }
      else
      {
        unsigned __int8 v28 = 97;
        unsigned __int8 v27 = 65;
      }
      if (result)
      {
        unint64_t v29 = 0;
        do
        {
          unsigned int v30 = *result;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              uint64_t v13 = 0;
              if (v30 < 0x61 || v30 >= v28) {
                return (unsigned __int8 *)v13;
              }
              char v31 = -87;
            }
            else
            {
              char v31 = -55;
            }
          }
          else
          {
            char v31 = -48;
          }
          if (!is_mul_ok(v29, a3)) {
            return 0;
          }
          unint64_t v32 = v29 * a3;
          unsigned __int8 v33 = v30 + v31;
          BOOL v16 = __CFADD__(v32, v33);
          unint64_t v29 = v32 + v33;
          if (v16) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v29;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_67:
    __break(1u);
    return result;
  }
  uint64_t v17 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v18 = a3 + 48;
  unsigned __int8 v19 = a3 + 55;
  unsigned __int8 v20 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v18 = 58;
  }
  else
  {
    unsigned __int8 v20 = 97;
    unsigned __int8 v19 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  uint64_t v21 = result + 1;
  do
  {
    unsigned int v22 = *v21;
    if (v22 < 0x30 || v22 >= v18)
    {
      if (v22 < 0x41 || v22 >= v19)
      {
        uint64_t v13 = 0;
        if (v22 < 0x61 || v22 >= v20) {
          return (unsigned __int8 *)v13;
        }
        char v23 = -87;
      }
      else
      {
        char v23 = -55;
      }
    }
    else
    {
      char v23 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v24 = v9 * a3;
    unsigned __int8 v25 = v22 + v23;
    BOOL v16 = __CFADD__(v24, v25);
    unint64_t v9 = v24 + v25;
    if (v16) {
      return 0;
    }
    ++v21;
    --v17;
  }
  while (v17);
  return (unsigned __int8 *)v9;
}

uint64_t _s7SPRBase3OIDV17derRepresentationACSg10Foundation4DataV_tcfC_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Data.Iterator();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  unsigned __int8 v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000065D0(a1, a2);
  __int16 v9 = sub_1000D8294(a1, a2);
  sub_100006628(a1, a2);
  if ((v9 & 0x100) != 0)
  {
    sub_100006628(a1, a2);
    return 0;
  }
  sub_100003EB0(&qword_1001E0920);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1001861D0;
  *(void *)(v10 + 32) = v9 / 0x28u;
  *(void *)(v10 + 40) = v9 % 0x28u;
  sub_1000065D0(a1, a2);
  sub_10017BA84(1, a1, a2, &v19);
  uint64_t v11 = v19;
  unint64_t v12 = v20;
  switch(v20 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_1000065D0(v19, v20);
      break;
    default:
      break;
  }
  Data.Iterator.init(_:at:)();
  sub_100006628(v11, v12);
LABEL_6:
  unint64_t v13 = 0;
  while (1)
  {
    Swift::UInt8_optional v14 = Data.Iterator.next()();
    if ((*(_WORD *)&v14 & 0x100) != 0) {
      break;
    }
    unint64_t v15 = v14.value & 0x7F | (v13 << 7);
    unint64_t v13 = v15;
    if ((v14.value & 0x80) == 0)
    {
      unint64_t v17 = *(void *)(v10 + 16);
      unint64_t v16 = *(void *)(v10 + 24);
      if (v17 >= v16 >> 1) {
        uint64_t v10 = (uint64_t)sub_100171E50((char *)(v16 > 1), v17 + 1, 1, (char *)v10);
      }
      *(void *)(v10 + 16) = v17 + 1;
      *(void *)(v10 + 8 * v17 + 32) = v15;
      goto LABEL_6;
    }
  }
  sub_100006628(a1, a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (v13)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

uint64_t sub_100182AC0(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    BOOL result = sub_1000940B0(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_96;
  }
  BOOL result = String.UTF8View._foreignDistance(from:to:)();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    BOOL result = sub_1000940B0(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    BOOL result = sub_1000940B0(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    BOOL result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_92;
  }
  if (v17 < a3 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  BOOL result = String.UTF8View._foreignDistance(from:to:)();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v18 < v15)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  uint64_t v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    uint64_t v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v33 = a6 + 48;
        unsigned __int8 v34 = a6 + 55;
        unsigned __int8 v35 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v33 = 58;
        }
        else
        {
          unsigned __int8 v35 = 97;
          unsigned __int8 v34 = 65;
        }
        if (v19)
        {
          unint64_t v24 = 0;
          uint64_t v36 = v19 + 1;
          uint64_t v37 = result - 1;
          do
          {
            unsigned int v38 = *v36;
            if (v38 < 0x30 || v38 >= v33)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                uint64_t v29 = 0;
                if (v38 < 0x61 || v38 >= v35) {
                  return v29;
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            if (!is_mul_ok(v24, a6)) {
              return 0;
            }
            unint64_t v40 = v24 * a6;
            unsigned __int8 v41 = v38 + v39;
            BOOL v32 = __CFADD__(v40, v41);
            unint64_t v24 = v40 + v41;
            if (v32) {
              return 0;
            }
            ++v36;
            --v37;
          }
          while (v37);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v42 = a6 + 48;
      unsigned __int8 v43 = a6 + 55;
      unsigned __int8 v44 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v42 = 58;
      }
      else
      {
        unsigned __int8 v44 = 97;
        unsigned __int8 v43 = 65;
      }
      if (v19)
      {
        unint64_t v24 = 0;
        while (1)
        {
          unsigned int v45 = *v19;
          if (v45 < 0x30 || v45 >= v42)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              uint64_t v29 = 0;
              if (v45 < 0x61 || v45 >= v44) {
                return v29;
              }
              char v46 = -87;
            }
            else
            {
              char v46 = -55;
            }
          }
          else
          {
            char v46 = -48;
          }
          if (!is_mul_ok(v24, a6)) {
            return 0;
          }
          unint64_t v47 = v24 * a6;
          unsigned __int8 v48 = v45 + v46;
          BOOL v32 = __CFADD__(v47, v48);
          unint64_t v24 = v47 + v48;
          if (v32) {
            return 0;
          }
          ++v19;
          if (!--result) {
            return v24;
          }
        }
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 48;
      unsigned __int8 v22 = a6 + 55;
      unsigned __int8 v23 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v21 = 58;
      }
      else
      {
        unsigned __int8 v23 = 97;
        unsigned __int8 v22 = 65;
      }
      if (v19)
      {
        unint64_t v24 = 0;
        unsigned __int8 v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              uint64_t v29 = 0;
              if (v27 < 0x61 || v27 >= v23) {
                return v29;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          if (!is_mul_ok(v24, a6)) {
            return 0;
          }
          unint64_t v30 = v24 * a6;
          unsigned __int8 v31 = v27 + v28;
          BOOL v32 = v30 >= v31;
          unint64_t v24 = v30 - v31;
          if (!v32) {
            return 0;
          }
          ++v25;
          if (!--v26) {
            return v24;
          }
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for OID()
{
  return &type metadata for OID;
}

uint64_t CocoaError._nsError.getter()
{
  return CocoaError._nsError.getter();
}

uint64_t static CocoaError.fileNoSuchFile.getter()
{
  return static CocoaError.fileNoSuchFile.getter();
}

uint64_t static CocoaError.fileReadNoSuchFile.getter()
{
  return static CocoaError.fileReadNoSuchFile.getter();
}

uint64_t static CocoaError.Code.fileReadCorruptFile.getter()
{
  return static CocoaError.Code.fileReadCorruptFile.getter();
}

uint64_t static CocoaError.Code.fileWriteOutOfSpace.getter()
{
  return static CocoaError.Code.fileWriteOutOfSpace.getter();
}

uint64_t type metadata accessor for CocoaError.Code()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t type metadata accessor for CocoaError()
{
  return type metadata accessor for CocoaError();
}

uint64_t URLRequest.httpMethod.getter()
{
  return URLRequest.httpMethod.getter();
}

uint64_t URLRequest.httpMethod.setter()
{
  return URLRequest.httpMethod.setter();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t URLRequest.allHTTPHeaderFields.getter()
{
  return URLRequest.allHTTPHeaderFields.getter();
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.url.getter()
{
  return URLRequest.url.getter();
}

uint64_t URLRequest.httpBody.getter()
{
  return URLRequest.httpBody.getter();
}

uint64_t URLRequest.httpBody.setter()
{
  return URLRequest.httpBody.setter();
}

Swift::Void __swiftcall URLRequest.setValue(_:forHTTPHeaderField:)(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t dispatch thunk of JSONDecoder.userInfo.setter()
{
  return dispatch thunk of JSONDecoder.userInfo.setter();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

NSCharacterSet __swiftcall CharacterSet._bridgeToObjectiveC()()
{
  return (NSCharacterSet)CharacterSet._bridgeToObjectiveC()();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t dispatch thunk of DataProtocol.regions.getter()
{
  return dispatch thunk of DataProtocol.regions.getter();
}

uint64_t DateInterval.end.getter()
{
  return DateInterval.end.getter();
}

uint64_t DateInterval.init(start:end:)()
{
  return DateInterval.init(start:end:)();
}

uint64_t DateInterval.start.getter()
{
  return DateInterval.start.getter();
}

uint64_t DateInterval.contains(_:)()
{
  return DateInterval.contains(_:)();
}

uint64_t type metadata accessor for DateInterval()
{
  return type metadata accessor for DateInterval();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.host.setter()
{
  return URLComponents.host.setter();
}

uint64_t URLComponents.port.setter()
{
  return URLComponents.port.setter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t __DataStorage.init(capacity:)()
{
  return __DataStorage.init(capacity:)();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t URLResourceValues.isExcludedFromBackup.setter()
{
  return URLResourceValues.isExcludedFromBackup.setter();
}

uint64_t URLResourceValues.init()()
{
  return URLResourceValues.init()();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t static _ErrorCodeProtocol.~= infix(_:_:)()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t dispatch thunk of NSKeyValueObservation.invalidate()()
{
  return dispatch thunk of NSKeyValueObservation.invalidate()();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return static _BridgedStoredNSError.== infix(_:_:)();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t _BridgedStoredNSError.userInfo.getter()
{
  return _BridgedStoredNSError.userInfo.getter();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

uint64_t URL.setResourceValues(_:)()
{
  return URL.setResourceValues(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)()
{
  return URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.host.getter()
{
  return URL.host.getter();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.port.getter()
{
  return URL.port.getter();
}

uint64_t URL.query.getter()
{
  return URL.query.getter();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

void __swiftcall pow(_:_:)(NSDecimal *__return_ptr retstr, NSDecimal *a2, Swift::Int a3)
{
}

uint64_t Data.base64EncodedData(options:)()
{
  return Data.base64EncodedData(options:)();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

{
  return Data.init(base64Encoded:options:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.resetBytes(in:)()
{
  return Data._Representation.resetBytes(in:)();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t Data._Representation.subscript.getter()
{
  return Data._Representation.subscript.getter();
}

uint64_t Data._Representation.subscript.setter()
{
  return Data._Representation.subscript.setter();
}

uint64_t Data.withUnsafeBytes<A>(_:)()
{
  return Data.withUnsafeBytes<A>(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Data._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.hash(into:)()
{
  return Data.hash(into:)();
}

uint64_t Data.append<A>(contentsOf:)()
{
  return Data.append<A>(contentsOf:)();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

uint64_t Data.subdata(in:)()
{
  return Data.subdata(in:)();
}

Swift::UInt8_optional __swiftcall Data.Iterator.next()()
{
  return (Swift::UInt8_optional)Data.Iterator.next()();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return Data.Iterator.init(_:at:)();
}

uint64_t Data.subscript.getter()
{
  return Data.subscript.getter();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.+ infix(_:_:)()
{
  return static Date.+ infix(_:_:)();
}

uint64_t static Date.- infix(_:_:)()
{
  return static Date.- infix(_:_:)();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.uuid.getter()
{
  return UUID.uuid.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t type metadata accessor for URLError.Code()
{
  return type metadata accessor for URLError.Code();
}

uint64_t static URLError.timedOut.getter()
{
  return static URLError.timedOut.getter();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t OSSignpostID.init(log:object:)()
{
  return OSSignpostID.init(log:object:)();
}

uint64_t OSSignpostID.init(log:)()
{
  return OSSignpostID.init(log:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t static DispatchWorkItemFlags.enforceQoS.getter()
{
  return static DispatchWorkItemFlags.enforceQoS.getter();
}

uint64_t static DispatchWorkItemFlags.barrier.getter()
{
  return static DispatchWorkItemFlags.barrier.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return DispatchTime.uptimeNanoseconds.getter();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t DispatchTime.rawValue.getter()
{
  return DispatchTime.rawValue.getter();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t HPKE.Ciphersuite.init(kem:kdf:aead:)()
{
  return HPKE.Ciphersuite.init(kem:kdf:aead:)();
}

uint64_t type metadata accessor for HPKE.Ciphersuite()
{
  return type metadata accessor for HPKE.Ciphersuite();
}

uint64_t type metadata accessor for HPKE.KDF()
{
  return type metadata accessor for HPKE.KDF();
}

uint64_t type metadata accessor for HPKE.KEM()
{
  return type metadata accessor for HPKE.KEM();
}

uint64_t type metadata accessor for HPKE.AEAD()
{
  return type metadata accessor for HPKE.AEAD();
}

uint64_t HPKE.Sender.init<A>(recipientKey:ciphersuite:info:)()
{
  return HPKE.Sender.init<A>(recipientKey:ciphersuite:info:)();
}

uint64_t HPKE.Sender.encapsulatedKey.getter()
{
  return HPKE.Sender.encapsulatedKey.getter();
}

uint64_t HPKE.Sender.seal<A, B>(_:authenticating:)()
{
  return HPKE.Sender.seal<A, B>(_:authenticating:)();
}

uint64_t type metadata accessor for HPKE.Sender()
{
  return type metadata accessor for HPKE.Sender();
}

uint64_t P256.KeyAgreement.PublicKey.x963Representation.getter()
{
  return P256.KeyAgreement.PublicKey.x963Representation.getter();
}

uint64_t P256.KeyAgreement.PublicKey.init<A>(x963Representation:)()
{
  return P256.KeyAgreement.PublicKey.init<A>(x963Representation:)();
}

uint64_t type metadata accessor for P256.KeyAgreement.PublicKey()
{
  return type metadata accessor for P256.KeyAgreement.PublicKey();
}

uint64_t SHA256.finalize()()
{
  return SHA256.finalize()();
}

uint64_t SHA256.init()()
{
  return SHA256.init()();
}

uint64_t type metadata accessor for SHA256()
{
  return type metadata accessor for SHA256();
}

uint64_t related decl 'e' for SPRHTTPErrorCode.serverCode.getter()
{
  return related decl 'e' for SPRHTTPErrorCode.serverCode.getter();
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isClientError.getter()
{
  return related decl 'e' for SPRHTTPErrorCode.isClientError.getter();
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isServerError.getter()
{
  return related decl 'e' for SPRHTTPErrorCode.isServerError.getter();
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isTimeTokenError.getter()
{
  return related decl 'e' for SPRHTTPErrorCode.isTimeTokenError.getter();
}

uint64_t related decl 'e' for SPRHTTPErrorCode.atsBanExpirationTime.getter()
{
  return related decl 'e' for SPRHTTPErrorCode.atsBanExpirationTime.getter();
}

uint64_t related decl 'e' for SPRHTTPErrorCode.init(_:serverCode:payload:)()
{
  return related decl 'e' for SPRHTTPErrorCode.init(_:serverCode:payload:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return Dictionary.init(minimumCapacity:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t Character.hexDigitValue.getter()
{
  return Character.hexDigitValue.getter();
}

uint64_t Character.hash(into:)()
{
  return Character.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return dispatch thunk of static Comparable.> infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t static String.Encoding.ascii.getter()
{
  return static String.Encoding.ascii.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.removeSubrange(_:)()
{
  return String.removeSubrange(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.init(unsafeUninitializedCapacity:initializingUTF8With:)()
{
  return String.init(unsafeUninitializedCapacity:initializingUTF8With:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.index(_:offsetBy:)()
{
  return String.index(_:offsetBy:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

{
  String.append(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.insert(_:at:)()
{
  return String.insert(_:at:)();
}

uint64_t String.remove(at:)()
{
  return String.remove(at:)();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return Sequence._copyContents(initializing:)();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t Sequence.first(where:)()
{
  return Sequence.first(where:)();
}

uint64_t Sequence.filter(_:)()
{
  return Sequence.filter(_:)();
}

uint64_t Sequence.reduce<A>(into:_:)()
{
  return Sequence.reduce<A>(into:_:)();
}

uint64_t UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)()
{
  return UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t Array.debugDescription.getter()
{
  return Array.debugDescription.getter();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t NSFileHandle.read(upToCount:)()
{
  return NSFileHandle.read(upToCount:)();
}

uint64_t NSFileHandle.write<A>(contentsOf:)()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

Swift::UInt64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSFileHandle.offset()()
{
  return NSFileHandle.offset()();
}

uint64_t SPRReadEvent.description.getter()
{
  return SPRReadEvent.description.getter();
}

uint64_t NSFileManager.replaceItemAt(_:withItemAt:backupItemName:options:)()
{
  return NSFileManager.replaceItemAt(_:withItemAt:backupItemName:options:)();
}

uint64_t SPRReaderMode.description.getter()
{
  return SPRReaderMode.description.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.Attributes.concurrent.getter()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.sync<A>(flags:execute:)()
{
  return OS_dispatch_queue.sync<A>(flags:execute:)();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

Swift::Void __swiftcall OS_dispatch_source.suspend()()
{
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t SPRPayAppletStatus.description.getter()
{
  return SPRPayAppletStatus.description.getter();
}

uint64_t SPRTransactionType.description.getter()
{
  return SPRTransactionType.description.getter();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t SPRTransactionCVMType.description.getter()
{
  return SPRTransactionCVMType.description.getter();
}

uint64_t SPRTransactionMessage.description.getter()
{
  return SPRTransactionMessage.description.getter();
}

uint64_t NSManagedObjectContext.performAndWait<A>(_:)()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t NSManagedObjectContext.fetch<A>(_:)()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t SPRVASTerminalProtocol.description.getter()
{
  return SPRVASTerminalProtocol.description.getter();
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

uint64_t SPRPaymentApplicationType.description.getter()
{
  return SPRPaymentApplicationType.description.getter();
}

uint64_t SPRTransactionOutcomeStatus.description.getter()
{
  return SPRTransactionOutcomeStatus.description.getter();
}

uint64_t NSArray.makeIterator()()
{
  return NSArray.makeIterator()();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t NSDecimal.description.getter()
{
  return NSDecimal.description.getter();
}

uint64_t NSDecimal.isSignMinus.getter()
{
  return NSDecimal.isSignMinus.getter();
}

void __swiftcall NSDecimal.init(integerLiteral:)(NSDecimal *__return_ptr retstr, Swift::Int integerLiteral)
{
}

uint64_t static NSDecimal.< infix(_:_:)()
{
  return static NSDecimal.< infix(_:_:)();
}

uint64_t NSDecimal.exponent.getter()
{
  return NSDecimal.exponent.getter();
}

Swift::String_optional __swiftcall NSScanner.scanString(_:)(Swift::String a1)
{
  uint64_t v1 = NSScanner.scanString(_:)(a1._countAndFlagsBits, a1._object);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

Swift::String_optional __swiftcall NSScanner.scanUpToString(_:)(Swift::String a1)
{
  uint64_t v1 = NSScanner.scanUpToString(_:)(a1._countAndFlagsBits, a1._object);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.index(after:)()
{
  return Substring.index(after:)();
}

uint64_t Substring.index(_:offsetBy:limitedBy:)()
{
  return Substring.index(_:offsetBy:limitedBy:)();
}

uint64_t Substring.subscript.getter()
{
  return Substring.subscript.getter();
}

{
  return Substring.subscript.getter();
}

uint64_t Substring.init(_:)()
{
  return Substring.init(_:)();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t dispatch thunk of static BinaryInteger.& infix(_:_:)()
{
  return dispatch thunk of static BinaryInteger.& infix(_:_:)();
}

uint64_t dispatch thunk of static BinaryInteger.~ prefix(_:)()
{
  return dispatch thunk of static BinaryInteger.~ prefix(_:)();
}

uint64_t dispatch thunk of static BinaryInteger.&= infix(_:_:)()
{
  return dispatch thunk of static BinaryInteger.&= infix(_:_:)();
}

uint64_t dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)()
{
  return dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)();
}

uint64_t dispatch thunk of static BinaryInteger.>>= infix<A>(_:_:)()
{
  return dispatch thunk of static BinaryInteger.>>= infix<A>(_:_:)();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return dispatch thunk of BinaryInteger._lowWord.getter();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return dispatch thunk of BinaryInteger.bitWidth.getter();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return dispatch thunk of static BinaryInteger.isSigned.getter();
}

uint64_t BinaryInteger.description.getter()
{
  return BinaryInteger.description.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return type metadata accessor for CodingUserInfoKey();
}

uint64_t dispatch thunk of FixedWidthInteger.bigEndian.getter()
{
  return dispatch thunk of FixedWidthInteger.bigEndian.getter();
}

uint64_t static FixedWidthInteger.random<A>(in:using:)()
{
  return static FixedWidthInteger.random<A>(in:using:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t LazySequenceProtocol<>.elements.getter()
{
  return LazySequenceProtocol<>.elements.getter();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _stringCompareInternal(_:_:_:_:expecting:)()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _copySequenceToContiguousArray<A>(_:)()
{
  return _copySequenceToContiguousArray<A>(_:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Slice<>.regions.getter()
{
  return Slice<>.regions.getter();
}

uint64_t Slice<>.withUnsafeBytes<A>(_:)()
{
  return Slice<>.withUnsafeBytes<A>(_:)();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)UInt64._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t DeviceIdentityCopyCertificateProperties()
{
  return _DeviceIdentityCopyCertificateProperties();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return _DeviceIdentityIssueClientCertificateWithCompletion();
}

uint64_t DeviceIdentityUCRTAttestationSupported()
{
  return _DeviceIdentityUCRTAttestationSupported();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SESKeyAttestWithSEBAA()
{
  return _SESKeyAttestWithSEBAA();
}

uint64_t SESKeyCreate()
{
  return _SESKeyCreate();
}

uint64_t SESKeyDelete()
{
  return _SESKeyDelete();
}

uint64_t SPRHTTPStatusIsSuccess()
{
  return _SPRHTTPStatusIsSuccess();
}

uint64_t SPRIsInDeveloperMode()
{
  return _SPRIsInDeveloperMode();
}

uint64_t SecAccessControlCopyData()
{
  return _SecAccessControlCopyData();
}

uint64_t SecAccessControlCreateFromData()
{
  return _SecAccessControlCreateFromData();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

uint64_t SecAccessControlSetConstraints()
{
  return _SecAccessControlSetConstraints();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return _SecCertificateCopyKey(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

uint64_t SecCertificateGetAuthorityKeyID()
{
  return _SecCertificateGetAuthorityKeyID();
}

uint64_t SecCertificateGetSubjectKeyID()
{
  return _SecCertificateGetSubjectKeyID();
}

uint64_t SecCertificateNotValidAfter()
{
  return _SecCertificateNotValidAfter();
}

uint64_t SecCertificateNotValidBefore()
{
  return _SecCertificateNotValidBefore();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return _SecKeyIsAlgorithmSupported(key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return _SecPolicyCreateApplePinned();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return _SecPolicyCreateBasicX509();
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return _SecPolicyCreateRevocation(revocationFlags);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return _SecTrustSetAnchorCertificates(trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return _SecTrustSetAnchorCertificatesOnly(trust, anchorCertificatesOnly);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return _SecTrustSetVerifyDate(trust, verifyDate);
}

uint64_t TMGetKernelMonotonicClock()
{
  return _TMGetKernelMonotonicClock();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _exit(int a1)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void atomic_flag_clear(atomic_flag *a1)
{
}

BOOL atomic_flag_test_and_set(atomic_flag *a1)
{
  return _atomic_flag_test_and_set(a1);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_system_path_for_identifier()
{
  return _container_system_path_for_identifier();
}

void dispatch_main(void)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return _os_unfair_recursive_lock_lock_with_options();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return _os_unfair_recursive_lock_unlock();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t spr_releaseCFObject()
{
  return _spr_releaseCFObject();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}