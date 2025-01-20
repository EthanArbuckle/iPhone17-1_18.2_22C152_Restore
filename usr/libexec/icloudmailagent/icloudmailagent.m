uint64_t start()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v1 = _MCCLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "icloudmailagent is starting up...", buf, 2u);
  }

  v2 = +[MCCAgentConnectionManager sharedInstance];
  [v2 start];

  v3 = +[CategorizationManager sharedInstance];
  [v3 start];

  if (_os_feature_enabled_impl())
  {
    v4 = +[CategorizationSyncManager sharedInstance];
    [v4 start];

    v5 = +[APNSManager sharedInstance];
    [v5 start];
  }
  v6 = +[NSRunLoop mainRunLoop];
  [v6 run];

  v7 = _MCCLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "icloudmailagent is shutting down...", v9, 2u);
  }

  return 0;
}

uint64_t sub_1000059C4(void *a1)
{
  if (a1 == (void *)1) {
    return 0x4349464954524543;
  }
  if (a1 == (void *)2) {
    return 0xD000000000000013;
  }
  if (a1
    && (type metadata accessor for CFString(0),
        sub_100008F20(a1),
        sub_10000A800(&qword_100063F18, type metadata accessor for CFString),
        v3 = (id)kSecAttrKeyTypeECSECPrimeRandom,
        char v4 = static _CFObject.== infix(_:_:)(),
        v3,
        (v4 & 1) != 0))
  {
    unint64_t v5 = 0xE200000000000000;
    uint64_t v6 = 17221;
  }
  else
  {
    unint64_t v5 = 0xE300000000000000;
    uint64_t v6 = 4281170;
  }
  unint64_t v7 = v5;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x4554415649525020;
  v8._object = (void *)0xEC00000059454B20;
  String.append(_:)(v8);
  sub_100008EF8(a1);
  return 0;
}

uint64_t sub_100005B28(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  *(void *)&long long v37 = a1;
  *((void *)&v37 + 1) = a2;
  unint64_t v38 = a3;
  unint64_t v39 = a4;
  swift_bridgeObjectRetain();
  sub_100008E28(&qword_100063F30);
  if (swift_dynamicCast())
  {
    sub_100009014(v35, (uint64_t)&v30);
    sub_10000902C(&v30, v32);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v35[0] = v37;
    sub_10000A788((uint64_t)&v30);
    return *(void *)&v35[0];
  }
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  sub_10000A72C((uint64_t)v35, &qword_100063F38);
  sub_100006D50(a1, a2, a3, a4, &v30);
  unint64_t v4 = *((void *)&v30 + 1);
  uint64_t v5 = v30;
  if (*((void *)&v30 + 1) >> 60 != 15)
  {
    swift_bridgeObjectRelease();
    v35[0] = __PAIR128__(v4, v5);
    return *(void *)&v35[0];
  }
  uint64_t v6 = sub_100006A3C(a1, a2, a3, a4);
  *(void *)&v35[0] = sub_1000072B0(v6);
  *((void *)&v35[0] + 1) = v7;
  __chkstk_darwin(*(void *)&v35[0]);
  sub_100006544((void *(*)(long long *__return_ptr, char *, char *))sub_100008FE4, (uint64_t)&v30);
  unint64_t v8 = *((void *)&v30 + 1);
  uint64_t v10 = v31;
  uint64_t v9 = v32;
  unint64_t v11 = v33;
  uint64_t v12 = *((void *)&v35[0] + 1) >> 62;
  switch(*((void *)&v35[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v13) = DWORD1(v35[0]) - LODWORD(v35[0]);
      if (__OFSUB__(DWORD1(v35[0]), v35[0])) {
        goto LABEL_44;
      }
      uint64_t v13 = (int)v13;
LABEL_10:
      if (v34 == v13)
      {
LABEL_16:
        uint64_t v18 = *((void *)&v30 + 1) >> 14;
        *(void *)((char *)&v30 + 7) = 0;
        *(void *)&long long v30 = 0;
        if (v8 >> 14 == v33 >> 14) {
          goto LABEL_37;
        }
        unint64_t v24 = v4;
        LOBYTE(v4) = 0;
        uint64_t v19 = (v31 >> 59) & 1;
        if ((v32 & 0x1000000000000000) == 0) {
          LOBYTE(v19) = 1;
        }
        uint64_t v20 = 4 << v19;
        unint64_t v21 = HIBYTE(v32) & 0xF;
        if ((v32 & 0x2000000000000000) == 0) {
          unint64_t v21 = v31 & 0xFFFFFFFFFFFFLL;
        }
        unint64_t v25 = v21;
        while (1)
        {
          char v22 = Substring.UTF8View.subscript.getter();
          if ((v11 & 0xC) == v20)
          {
            unint64_t v11 = sub_10004B838(v11, v10, v9);
            if ((v9 & 0x1000000000000000) != 0)
            {
LABEL_27:
              if (v25 <= v11 >> 16) {
                goto LABEL_42;
              }
              unint64_t v11 = String.UTF8View._foreignIndex(after:)();
              goto LABEL_29;
            }
          }
          else if ((v9 & 0x1000000000000000) != 0)
          {
            goto LABEL_27;
          }
          unint64_t v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_29:
          *((unsigned char *)&v30 + v4) = v22;
          LOWORD(v4) = v4 + 1;
          if ((v4 & 0x100) != 0)
          {
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
          }
          if (v4 == 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            Data._Representation.append(contentsOf:)();
            LOBYTE(v4) = 0;
            if (v18 == v11 >> 14)
            {
              swift_bridgeObjectRelease();
              sub_100009000(v5, v24);
              goto LABEL_38;
            }
          }
          else if (v18 == v11 >> 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            Data._Representation.append(contentsOf:)();
            sub_100009000(v5, v24);
            goto LABEL_37;
          }
        }
      }
      if (v12)
      {
        if (v12 == 1) {
          uint64_t v17 = *(uint64_t *)&v35[0] >> 32;
        }
        else {
          uint64_t v17 = *(void *)(*(void *)&v35[0] + 24);
        }
      }
      else
      {
        uint64_t v17 = BYTE14(v35[0]);
      }
LABEL_35:
      if (v17 < v34) {
        goto LABEL_43;
      }
      Data._Representation.replaceSubrange(_:with:count:)();
LABEL_37:
      swift_bridgeObjectRelease();
LABEL_38:
      swift_bridgeObjectRelease();
      return *(void *)&v35[0];
    case 2:
      uint64_t v15 = *(void *)(*(void *)&v35[0] + 16);
      uint64_t v14 = *(void *)(*(void *)&v35[0] + 24);
      BOOL v16 = __OFSUB__(v14, v15);
      uint64_t v13 = v14 - v15;
      if (!v16) {
        goto LABEL_10;
      }
      goto LABEL_45;
    case 3:
      if (!v34) {
        goto LABEL_16;
      }
      uint64_t v17 = 0;
      goto LABEL_35;
    default:
      uint64_t v13 = BYTE14(v35[0]);
      goto LABEL_10;
  }
}

unsigned __int8 *sub_100005FA4@<X0>(const void *a1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, void **a4@<X4>, unsigned __int8 **a5@<X8>)
{
  LODWORD(v8) = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
LABEL_12:
        __break(1u);
LABEL_13:
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        JUMPOUT(0x100006118);
      }
      unint64_t v8 = HIDWORD(a2) - (int)a2;
LABEL_6:
      if ((v8 & 0x8000000000000000) != 0 || HIDWORD(v8)) {
        goto LABEL_13;
      }
LABEL_8:
      unint64_t v11 = *a4;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v11;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v11 = sub_100047004(0, v11[2], 0, v11);
      }
      *a4 = v11;
      result = CC_SHA1(a1, v8, (unsigned __int8 *)v11 + 32);
      *a5 = result;
      return result;
    case 2uLL:
      uint64_t v10 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      unint64_t v8 = v9 - v10;
      if (!__OFSUB__(v9, v10)) {
        goto LABEL_6;
      }
      goto LABEL_12;
    case 3uLL:
      goto LABEL_8;
    default:
      LODWORD(v8) = BYTE6(a3);
      goto LABEL_8;
  }
}

uint64_t sub_100006128(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

id sub_1000061F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithPattern:v5 options:a3 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1000062CC()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

BOOL sub_100006338(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_10000634C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100006354()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000063A0()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_1000063F8()
{
  return Hasher._finalize()();
}

void sub_100006460(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_10000646C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100006478@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (!__src) {
    goto LABEL_7;
  }
  if (!a2)
  {
    __src = 0;
LABEL_7:
    unint64_t v6 = 0xC000000000000000;
    goto LABEL_10;
  }
  if (a2 <= 14)
  {
    __src = sub_1000071EC((unsigned char *)__src, (unsigned char *)(__src + a2));
    unint64_t v6 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else
  {
    type metadata accessor for __DataStorage();
    swift_allocObject();
    uint64_t v5 = __DataStorage.init(bytes:length:)();
    if ((unint64_t)a2 >= 0x7FFFFFFF)
    {
      type metadata accessor for Data.RangeReference();
      __src = swift_allocObject();
      *(void *)(__src + 16) = 0;
      *(void *)(__src + 24) = a2;
      unint64_t v6 = v5 | 0x8000000000000000;
    }
    else
    {
      __src = a2 << 32;
      unint64_t v6 = v5 | 0x4000000000000000;
    }
  }
LABEL_10:
  *a3 = __src;
  a3[1] = v6;
  return __src;
}

char *sub_100006544@<X0>(void *(*a1)(long long *__return_ptr, char *, char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  unint64_t v5 = v2[1];
  switch(v5 >> 62)
  {
    case 1uLL:
      uint64_t v20 = a2;
      uint64_t v10 = v5 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)v2 = xmmword_10004DF20;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = v6 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_15;
      }
      if (v12 < (int)v6) {
        goto LABEL_20;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v6, __DataStorage._offset.getter())) {
        goto LABEL_21;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v19 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v10 = v19;
      uint64_t v12 = v6 >> 32;
LABEL_15:
      if (v12 < (int)v6)
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
      }
      uint64_t result = sub_100006970((int)v6, v12, a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      uint64_t *v2 = v6;
      v2[1] = v10 | 0x4000000000000000;
      a2 = v20;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 2uLL:
      *(void *)&long long v25 = *v2;
      *((void *)&v25 + 1) = v5 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      long long v13 = v25;
      uint64_t result = sub_100006970(*(void *)(v25 + 16), *(void *)(v25 + 24), a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      uint64_t *v2 = v13;
      v2[1] = *((void *)&v13 + 1) | 0x8000000000000000;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 3uLL:
      *(void *)((char *)&v25 + 7) = 0;
      *(void *)&long long v25 = 0;
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25);
      if (v3) {
        return result;
      }
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      goto LABEL_17;
    default:
      *(void *)&long long v25 = *v2;
      WORD4(v25) = v5;
      BYTE10(v25) = BYTE2(v5);
      BYTE11(v25) = BYTE3(v5);
      BYTE12(v25) = BYTE4(v5);
      BYTE13(v25) = BYTE5(v5);
      BYTE14(v25) = BYTE6(v5);
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25 + BYTE6(v5));
      if (v3)
      {
        unint64_t v9 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        uint64_t *v2 = v25;
        v2[1] = v9;
      }
      else
      {
        long long v14 = v21;
        uint64_t v15 = v22;
        uint64_t v16 = v23;
        long long v17 = v24;
        unint64_t v18 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        uint64_t *v2 = v25;
        v2[1] = v18;
LABEL_17:
        *(_OWORD *)a2 = v14;
        *(void *)(a2 + 16) = v15;
        *(void *)(a2 + 24) = v16;
        *(_OWORD *)(a2 + 32) = v17;
      }
      return result;
  }
}

unsigned char *sub_100006874@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_1000071EC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_100007350((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1000073CC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

double sub_1000068EC@<D0>(void (*a1)(long long *__return_ptr, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a2)
  {
    a1(&v10, a2, a3 - a2);
    if (v4) {
      return result;
    }
LABEL_5:
    uint64_t v7 = v11;
    uint64_t v8 = v12;
    double result = *(double *)&v10;
    long long v9 = v13;
    *(_OWORD *)a4 = v10;
    *(void *)(a4 + 16) = v7;
    *(void *)(a4 + 24) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    return result;
  }
  a1(&v10, 0, 0);
  if (!v4) {
    goto LABEL_5;
  }
  return result;
}

char *sub_100006970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *(*a3)(long long *__return_ptr, char *, char *)@<X2>, uint64_t a4@<X8>)
{
  double result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  long long v10 = result;
  double result = (char *)__DataStorage._offset.getter();
  uint64_t v11 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v14 = __DataStorage._length.getter();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  double result = (char *)a3(&v19, &v10[v11], &v10[v11 + v15]);
  if (!v4)
  {
    uint64_t v16 = v20;
    uint64_t v17 = v21;
    long long v18 = v22;
    *(_OWORD *)a4 = v19;
    *(void *)(a4 + 16) = v16;
    *(void *)(a4 + 24) = v17;
    *(_OWORD *)(a4 + 32) = v18;
  }
  return result;
}

uint64_t sub_100006A3C(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    double result = sub_10004B838(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    double result = sub_10004B838(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return String.UTF8View._foreignDistance(from:to:)();
}

unint64_t sub_100006B3C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    double result = v12;
    if (v17 == v15) {
      double result = sub_10004B838(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      double result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        double result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          double result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    double result = sub_10004B838(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100006D50@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    *(_OWORD *)a5 = xmmword_10004DF30;
  }
  else
  {
    unint64_t v9 = result;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v11[0] = a3;
      v11[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v10 = v11;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      unint64_t v10 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v10 = (void *)_StringObject.sharedUTF8.getter();
    }
    return sub_100006E0C((uint64_t)v10, v9, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_100006E0C@<X0>(uint64_t result@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, unint64_t a5@<X5>, void *a6@<X8>)
{
  unint64_t v9 = a2;
  uint64_t v10 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  unint64_t v15 = a2;
  if (v14 == 4 << v12)
  {
    double result = sub_10004B838(a2, a4, a5);
    unint64_t v15 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v16 = v15 >> 16;
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
  unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v17 = HIBYTE(a5) & 0xF;
  }
  if (v17 < v15 >> 16) {
    goto LABEL_31;
  }
  double result = String.UTF8View._foreignDistance(from:to:)();
  int64_t v16 = result;
  if (v14 == v13)
  {
LABEL_14:
    double result = sub_10004B838(v9, a4, a5);
    unint64_t v9 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    double result = sub_10004B838(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    double result = (a3 >> 16) - (v9 >> 16);
    goto LABEL_21;
  }
  unint64_t v18 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v18 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v18 < v9 >> 16) {
    goto LABEL_29;
  }
  if (v18 < a3 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  double result = String.UTF8View._foreignDistance(from:to:)();
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v19 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10) {
    uint64_t v20 = v10 + v16;
  }
  else {
    uint64_t v20 = 0;
  }
  return sub_100006478(v20, v19, a6);
}

double sub_100006FC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *((void *)a3 + 2);
  uint64_t v6 = *((void *)a3 + 3);
  long long v15 = *a3;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_1000068EC((void (*)(long long *__return_ptr, uint64_t, uint64_t))sub_100009070, a1, a2, (uint64_t)&v11);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  double result = *(double *)&v11;
  long long v10 = v14;
  *(_OWORD *)a4 = v11;
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v8;
  *(_OWORD *)(a4 + 32) = v10;
  return result;
}

uint64_t sub_100007048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = sub_100006B3C((unint64_t)v9, a1, a2, *a3, a3[1], a3[2], a3[3]);
  uint64_t v6 = v10;
  long long v7 = v9[1];
  *(_OWORD *)a4 = v9[0];
  *(_OWORD *)(a4 + 16) = v7;
  *(void *)(a4 + 32) = v6;
  *(void *)(a4 + 40) = v5;
  return swift_bridgeObjectRetain();
}

void *sub_1000070B8(void *result, Swift::String_optional *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v11 = a4;
  unint64_t v12 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v13 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *unint64_t v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      Swift::String_optional v10 = String.Iterator.next()();
      if (!v10.value._object) {
        break;
      }
      ++v9;
      *v8++ = v10;
      if (v7 == v9)
      {
        a4 = v11;
        a5 = v12;
        goto LABEL_13;
      }
    }
    a4 = v11;
    a5 = v12;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v13;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_100007174(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100008E28(&qword_100063F20);
  uint64_t v4 = (void *)swift_allocObject();
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_1000071EC(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1000072B0(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        double result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_100007350(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1000073CC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unint64_t sub_100007450(uint64_t a1, uint64_t a2, void *a3)
{
  v46[3] = a2;
  unint64_t v5 = 0xE100000000000000;
  unint64_t v6 = sub_100008F38();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(42);
  swift_bridgeObjectRelease();
  strcpy((char *)v46, ".*-----BEGIN ");
  HIWORD(v46[1]) = -4864;
  if (a3 == (void *)2)
  {
    uint64_t v7 = 0xD000000000000013;
    uint64_t v8 = (void *)0x8000000100051E10;
    v10._countAndFlagsBits = 0xD000000000000013;
    v10._object = (void *)0x8000000100051E10;
    String.append(_:)(v10);
  }
  else
  {
    if (a3 != (void *)1)
    {
      unint64_t v5 = (unint64_t)&kSecAttrKeyTypeECSECPrimeRandom;
      if (a3
        && (type metadata accessor for CFString(0),
            sub_100008F20(a3),
            sub_10000A800(&qword_100063F18, type metadata accessor for CFString),
            unint64_t v5 = (unint64_t)&kSecAttrKeyTypeECSECPrimeRandom,
            unint64_t v12 = (id)kSecAttrKeyTypeECSECPrimeRandom,
            char v13 = static _CFObject.== infix(_:_:)(),
            v12,
            (v13 & 1) != 0))
      {
        unint64_t v14 = 0xE200000000000000;
        uint64_t v15 = 17221;
      }
      else
      {
        unint64_t v14 = 0xE300000000000000;
        uint64_t v15 = 4281170;
      }
      unint64_t v16 = v14;
      String.append(_:)(*(Swift::String *)&v15);
      swift_bridgeObjectRelease();
      v17._countAndFlagsBits = 0x4554415649525020;
      v17._object = (void *)0xEC00000059454B20;
      String.append(_:)(v17);
      sub_100008EF8(a3);
      v18._countAndFlagsBits = 0;
      v18._object = (void *)0xE000000000000000;
      String.append(_:)(v18);
      swift_bridgeObjectRelease();
      v19._object = (void *)0x8000000100051E30;
      v19._countAndFlagsBits = 0xD000000000000012;
      String.append(_:)(v19);
      if (a3
        && (unint64_t v5 = (unint64_t)kSecAttrKeyTypeECSECPrimeRandom,
            type metadata accessor for CFString(0),
            sub_100008F20(a3),
            sub_10000A800(&qword_100063F18, type metadata accessor for CFString),
            uint64_t v20 = (id)kSecAttrKeyTypeECSECPrimeRandom,
            char v21 = static _CFObject.== infix(_:_:)(),
            v20,
            (v21 & 1) != 0))
      {
        unint64_t v22 = 0xE200000000000000;
        uint64_t v23 = 17221;
      }
      else
      {
        unint64_t v22 = 0xE300000000000000;
        uint64_t v23 = 4281170;
      }
      unint64_t v24 = v22;
      String.append(_:)(*(Swift::String *)&v23);
      swift_bridgeObjectRelease();
      v25._countAndFlagsBits = 0x4554415649525020;
      v25._object = (void *)0xEC00000059454B20;
      String.append(_:)(v25);
      sub_100008EF8(a3);
      uint64_t v7 = 0;
      uint64_t v8 = (void *)0xE000000000000000;
      goto LABEL_15;
    }
    uint64_t v7 = 0x4349464954524543;
    uint64_t v8 = (void *)0xEB00000000455441;
    v9._countAndFlagsBits = 0x4349464954524543;
    v9._object = (void *)0xEB00000000455441;
    String.append(_:)(v9);
  }
  swift_bridgeObjectRelease();
  v11._object = (void *)0x8000000100051E30;
  v11._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v11);
LABEL_15:
  v26._countAndFlagsBits = v7;
  v26._object = v8;
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 0x2A2E2D2D2D2D2DLL;
  v27._object = (void *)0xE700000000000000;
  String.append(_:)(v27);
  id v28 = objc_allocWithZone((Class)NSRegularExpression);
  id v29 = sub_1000061F0(v46[0], v46[1], 0);
  if (v3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v30 = v29;
    uint64_t v31 = String.count.getter();
    NSString v32 = String._bridgeToObjectiveC()();
    id v33 = [v30 firstMatchInString:v32 options:0 range:v31];

    if (v33)
    {
      if ((uint64_t)[v33 numberOfRanges] < 2
        || ([v33 rangeAtIndex:1], Range<>.init(_:in:)(), (v34 & 1) != 0))
      {
        swift_bridgeObjectRelease();

        unint64_t v5 = 0;
      }
      else
      {
        uint64_t v35 = String.subscript.getter();
        unint64_t v37 = v36;
        unint64_t v39 = v38;
        unint64_t v41 = v40;
        swift_bridgeObjectRelease();
        uint64_t v42 = sub_100005B28(v35, v37, v39, v41);
        unint64_t v44 = v43;
        unint64_t v5 = Data.init(base64Encoded:options:)();
        sub_100008F8C(v42, v44);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v5 = 0;
      id v33 = v30;
    }
  }
  return v5;
}

uint64_t sub_1000079E8(uint64_t a1, uint64_t a2, void *a3)
{
  Swift::String v4 = Data.base64EncodedString(options:)(0);
  uint64_t v5 = String.count.getter();
  v61 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (Swift::String_optional *)sub_100007174(v5, 0);
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000070B8(&v64, v7 + 2, v6, v4._countAndFlagsBits, (unint64_t)v4._object);
    uint64_t result = swift_bridgeObjectRelease();
    if (v8 != (void *)v6)
    {
LABEL_73:
      __break(1u);
      return result;
    }
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t countAndFlagsBits = v7[1].value._countAndFlagsBits;
    if (countAndFlagsBits) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = (Swift::String_optional *)_swiftEmptyArrayStorage;
    uint64_t countAndFlagsBits = _swiftEmptyArrayStorage[2];
    if (countAndFlagsBits)
    {
LABEL_4:
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          break;
        }
        BOOL v14 = __OFADD__(v12, 64);
        v12 += 64;
        if (v14) {
          uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        ++v11;
        if (v12 >= countAndFlagsBits) {
          goto LABEL_12;
        }
      }
      __break(1u);
      goto LABEL_64;
    }
  }
  uint64_t v13 = 0;
LABEL_12:
  uint64_t result = sub_10002E98C(0, v13 & ~(v13 >> 63), 0);
  if (v13 < 0) {
    goto LABEL_72;
  }
  if (v13)
  {
    uint64_t v15 = 0;
    while (v15 < (unint64_t)countAndFlagsBits)
    {
      if (v15 == 0x7FFFFFFFFFFFFFC0) {
        goto LABEL_65;
      }
      uint64_t v16 = v15 + 64;
      if (countAndFlagsBits < v15 + 64) {
        uint64_t v16 = countAndFlagsBits;
      }
      if (v16 < v15) {
        goto LABEL_66;
      }
      uint64_t v17 = v7[1].value._countAndFlagsBits;
      if (v17 < (unint64_t)v15 || v17 < v16) {
        goto LABEL_67;
      }
      uint64_t v64 = (uint64_t)v7;
      unint64_t v65 = (unint64_t)&v7[2];
      unint64_t v66 = v15;
      uint64_t v67 = (2 * v16) | 1;
      swift_retain();
      sub_100008E28(&qword_100063F08);
      sub_100008EB4(&qword_100063F10, &qword_100063F08);
      uint64_t result = String.init<A>(_:)();
      uint64_t v19 = result;
      uint64_t v21 = v20;
      unint64_t v23 = _swiftEmptyArrayStorage[2];
      unint64_t v22 = _swiftEmptyArrayStorage[3];
      if (v23 >= v22 >> 1) {
        uint64_t result = sub_10002E98C(v22 > 1, v23 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v23 + 1;
      unint64_t v24 = &_swiftEmptyArrayStorage[2 * v23];
      v24[4] = v19;
      v24[5] = v21;
      v15 += 64;
      if (!--v13)
      {
        if (v15 < countAndFlagsBits) {
          goto LABEL_31;
        }
        goto LABEL_45;
      }
    }
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
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
    goto LABEL_73;
  }
  if (countAndFlagsBits)
  {
    uint64_t v15 = 0;
LABEL_31:
    v62 = v7;
    v63 = v7 + 2;
    unint64_t v25 = v15;
    do
    {
      uint64_t v26 = v25 + 64;
      if (__OFADD__(v25, 64)) {
        goto LABEL_68;
      }
      if (countAndFlagsBits >= v26) {
        uint64_t v27 = v25 + 64;
      }
      else {
        uint64_t v27 = countAndFlagsBits;
      }
      if (v27 < (uint64_t)v25) {
        goto LABEL_69;
      }
      if (v15 < 0) {
        goto LABEL_70;
      }
      uint64_t v28 = v7[1].value._countAndFlagsBits;
      if (v28 < v25 || v28 < v27) {
        goto LABEL_71;
      }
      uint64_t v64 = (uint64_t)v7;
      unint64_t v65 = (unint64_t)v63;
      unint64_t v66 = v25;
      uint64_t v67 = (2 * v27) | 1;
      swift_retain();
      sub_100008E28(&qword_100063F08);
      sub_100008EB4(&qword_100063F10, &qword_100063F08);
      uint64_t result = String.init<A>(_:)();
      uint64_t v30 = result;
      uint64_t v32 = v31;
      unint64_t v34 = _swiftEmptyArrayStorage[2];
      unint64_t v33 = _swiftEmptyArrayStorage[3];
      if (v34 >= v33 >> 1) {
        uint64_t result = sub_10002E98C(v33 > 1, v34 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v34 + 1;
      uint64_t v35 = &_swiftEmptyArrayStorage[2 * v34];
      v35[4] = v30;
      v35[5] = v32;
      v25 += 64;
      uint64_t v7 = v62;
    }
    while (v26 < countAndFlagsBits);
  }
LABEL_45:
  swift_release();
  unint64_t v36 = (void *)0xEB00000000455441;
  uint64_t v37 = 0x4349464954524543;
  uint64_t v64 = 0;
  unint64_t v65 = 0xE000000000000000;
  _StringGuts.grow(_:)(38);
  swift_bridgeObjectRelease();
  uint64_t v64 = 0x4745422D2D2D2D2DLL;
  unint64_t v65 = 0xEB00000000204E49;
  if (v61 == (void *)1)
  {
    unint64_t v39 = 0x4349464954524543;
    unint64_t v38 = 0xEB00000000455441;
  }
  else if (v61 == (void *)2)
  {
    unint64_t v38 = 0x8000000100051E10;
    unint64_t v39 = 0xD000000000000013;
  }
  else
  {
    if (v61
      && (type metadata accessor for CFString(0),
          sub_100008F20(v61),
          sub_10000A800(&qword_100063F18, type metadata accessor for CFString),
          unint64_t v40 = (id)kSecAttrKeyTypeECSECPrimeRandom,
          char v41 = static _CFObject.== infix(_:_:)(),
          v40,
          (v41 & 1) != 0))
    {
      unint64_t v42 = 0xE200000000000000;
      uint64_t v43 = 17221;
    }
    else
    {
      unint64_t v42 = 0xE300000000000000;
      uint64_t v43 = 4281170;
    }
    unint64_t v44 = v42;
    String.append(_:)(*(Swift::String *)&v43);
    swift_bridgeObjectRelease();
    v45._uint64_t countAndFlagsBits = 0x4554415649525020;
    v45._object = (void *)0xEC00000059454B20;
    String.append(_:)(v45);
    sub_100008EF8(v61);
    unint64_t v39 = 0;
    unint64_t v38 = 0xE000000000000000;
  }
  unint64_t v46 = v38;
  String.append(_:)(*(Swift::String *)&v39);
  swift_bridgeObjectRelease();
  v47._uint64_t countAndFlagsBits = 0xA2D2D2D2D2DLL;
  v47._object = (void *)0xE600000000000000;
  String.append(_:)(v47);
  sub_100008E28(&qword_100063EF8);
  sub_100008EB4(&qword_100063F00, &qword_100063EF8);
  uint64_t v48 = BidirectionalCollection<>.joined(separator:)();
  v50 = v49;
  swift_release();
  v51._uint64_t countAndFlagsBits = v48;
  v51._object = v50;
  String.append(_:)(v51);
  swift_bridgeObjectRelease();
  v52._uint64_t countAndFlagsBits = 0x4E452D2D2D2D2D0ALL;
  v52._object = (void *)0xEA00000000002044;
  String.append(_:)(v52);
  if (v61 != (void *)1)
  {
    if (v61 == (void *)2)
    {
      unint64_t v36 = (void *)0x8000000100051E10;
      uint64_t v37 = 0xD000000000000013;
    }
    else
    {
      if (v61
        && (type metadata accessor for CFString(0),
            sub_100008F20(v61),
            sub_10000A800(&qword_100063F18, type metadata accessor for CFString),
            v53 = (id)kSecAttrKeyTypeECSECPrimeRandom,
            char v54 = static _CFObject.== infix(_:_:)(),
            v53,
            (v54 & 1) != 0))
      {
        unint64_t v55 = 0xE200000000000000;
        uint64_t v56 = 17221;
      }
      else
      {
        unint64_t v55 = 0xE300000000000000;
        uint64_t v56 = 4281170;
      }
      unint64_t v57 = v55;
      String.append(_:)(*(Swift::String *)&v56);
      swift_bridgeObjectRelease();
      v58._uint64_t countAndFlagsBits = 0x4554415649525020;
      v58._object = (void *)0xEC00000059454B20;
      String.append(_:)(v58);
      sub_100008EF8(v61);
      uint64_t v37 = 0;
      unint64_t v36 = (void *)0xE000000000000000;
    }
  }
  v59._uint64_t countAndFlagsBits = v37;
  v59._object = v36;
  String.append(_:)(v59);
  swift_bridgeObjectRelease();
  v60._uint64_t countAndFlagsBits = 0x2D2D2D2D2DLL;
  v60._object = (void *)0xE500000000000000;
  String.append(_:)(v60);
  return v64;
}

unsigned __int8 *sub_1000080F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void **a6)
{
  uint64_t result = (unsigned __int8 *)__DataStorage._bytes.getter();
  uint64_t v13 = result;
  if (result)
  {
    uint64_t result = (unsigned __int8 *)__DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v13 += a1 - (void)result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  uint64_t result = sub_100005FA4(v13, a4, a5, a6, &v14);
  if (!v6) {
    return v14;
  }
  return result;
}

uint64_t sub_1000081BC(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v4 + 16) = 20;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(_DWORD *)(v4 + 48) = 0;
  unint64_t v22 = (void *)v4;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_10000A848(a1, a2);
      sub_1000080F8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a1, a2, &v22);
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      sub_10000A848(a1, a2);
      swift_retain();
      swift_retain();
      sub_1000080F8(v5, v6, a2 & 0x3FFFFFFFFFFFFFFFLL, a1, a2, &v22);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(v21, 0, 14);
      goto LABEL_5;
    default:
      v21[0] = a1;
      LOWORD(v21[1]) = a2;
      BYTE2(v21[1]) = BYTE2(a2);
      BYTE3(v21[1]) = BYTE3(a2);
      BYTE4(v21[1]) = BYTE4(a2);
      BYTE5(v21[1]) = BYTE5(a2);
LABEL_5:
      sub_100005FA4(v21, a1, a2, &v22, &v23);
      break;
  }
  sub_100008F8C(a1, a2);
  uint64_t v7 = v22;
  int64_t v8 = v22[2];
  Swift::String v9 = _swiftEmptyArrayStorage;
  if (v8)
  {
    v21[0] = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_10002E98C(0, v8, 0);
    uint64_t v10 = 0;
    Swift::String v9 = (void *)v21[0];
    do
    {
      char v11 = *((unsigned char *)v7 + v10 + 32);
      sub_100008E28(&qword_100063EF0);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_10004DF40;
      *(void *)(v12 + 56) = &type metadata for UInt8;
      *(void *)(v12 + 64) = &protocol witness table for UInt8;
      *(unsigned char *)(v12 + 32) = v11;
      uint64_t v13 = String.init(format:_:)();
      uint64_t v15 = v14;
      v21[0] = v9;
      unint64_t v17 = v9[2];
      unint64_t v16 = v9[3];
      if (v17 >= v16 >> 1)
      {
        sub_10002E98C(v16 > 1, v17 + 1, 1);
        Swift::String v9 = (void *)v21[0];
      }
      ++v10;
      _OWORD v9[2] = v17 + 1;
      Swift::String v18 = &v9[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
    }
    while (v8 != v10);
    swift_bridgeObjectRelease();
  }
  v21[0] = v9;
  sub_100008E28(&qword_100063EF8);
  sub_100008EB4(&qword_100063F00, &qword_100063EF8);
  uint64_t v19 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

BOOL sub_100008578(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v8 = (char *)&v32 - v7;
  sub_100008E28(&qword_100063F58);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10004DF50;
  *(void *)(v9 + 32) = a1;
  SecTrustRef trust = (SecTrustRef)v9;
  specialized Array._endMutation()();
  id v10 = a1;
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  SecTrustRef trust = 0;
  type metadata accessor for SecCertificate(0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  OSStatus v13 = SecTrustCreateWithCertificates(isa, BasicX509, &trust);

  if (v13 || !trust)
  {
    Logger.init()();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 67109120;
      LODWORD(error) = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Error creating SecTrust from certificates, unable to generate public signing key: %d", v28, 8u);
      swift_slowDealloc();
      id v29 = BasicX509;
    }
    else
    {
      id v29 = v26;
      uint64_t v26 = BasicX509;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    goto LABEL_13;
  }
  CFErrorRef error = 0;
  uint64_t v14 = trust;
  BOOL v15 = SecTrustEvaluateWithError(v14, &error);
  if (error)
  {
    unint64_t v16 = error;
    Logger.init()();
    unint64_t v17 = v16;
    Swift::String v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      int v35 = v20;
      unint64_t v22 = (uint8_t *)v21;
      unint64_t v33 = (void *)swift_slowAlloc();
      unint64_t v34 = v22;
      *(_DWORD *)unint64_t v22 = 138412290;
      uint64_t v32 = v22 + 4;
      type metadata accessor for CFError(0);
      sub_10000A800((unint64_t *)&unk_100063F60, type metadata accessor for CFError);
      swift_allocError();
      *unint64_t v23 = v17;
      unint64_t v24 = v17;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v36 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v33 = v25;

      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v35, "Error evaluating certificate trust: %@", v34, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      unint64_t v17 = BasicX509;
    }
    else
    {

      unint64_t v24 = v17;
      Swift::String v18 = v17;
      uint64_t v14 = BasicX509;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
LABEL_13:

    return 0;
  }
  BOOL v30 = v15;

  return v30;
}

void *sub_1000089F0()
{
  uint64_t result = (void *)SecCertificateCopySHA256Digest();
  if (result)
  {
    CFDataRef v1 = result;
    BytePtr = CFDataGetBytePtr(v1);
    CFIndex Length = CFDataGetLength(v1);

    if (Length)
    {
      sub_10002E98C(0, Length, 0);
      do
      {
        char v4 = *BytePtr++;
        sub_100008E28(&qword_100063EF0);
        uint64_t v5 = swift_allocObject();
        *(_OWORD *)(v5 + 16) = xmmword_10004DF40;
        *(void *)(v5 + 56) = &type metadata for UInt8;
        *(void *)(v5 + 64) = &protocol witness table for UInt8;
        *(unsigned char *)(v5 + 32) = v4;
        uint64_t v6 = String.init(format:_:)();
        uint64_t v8 = v7;
        unint64_t v10 = _swiftEmptyArrayStorage[2];
        unint64_t v9 = _swiftEmptyArrayStorage[3];
        if (v10 >= v9 >> 1) {
          sub_10002E98C(v9 > 1, v10 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v10 + 1;
        char v11 = &_swiftEmptyArrayStorage[2 * v10];
        v11[4] = v6;
        v11[5] = v8;
        --Length;
      }
      while (Length);
    }
    sub_100008E28(&qword_100063EF8);
    sub_100008EB4(&qword_100063F00, &qword_100063EF8);
    uint64_t v12 = BidirectionalCollection<>.joined(separator:)();
    swift_bridgeObjectRelease();

    return (void *)v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_100008BB4(__SecIdentity *a1)
{
  noErr.getter();
  SecCertificateRef certificateRef = 0;
  OSStatus v2 = SecIdentityCopyCertificate(a1, &certificateRef);
  SecCertificateRef v3 = certificateRef;
  if (noErr.getter() == v2 && v3)
  {
    char v4 = v3;
    uint64_t v5 = sub_1000089F0();
  }
  else
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100008D9C(v6, (uint64_t)qword_1000679A0);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    uint64_t v5 = (void *)v8;
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v9 = 67109120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v5, "Error copying certificate (status %d)", v9, 8u);
      swift_slowDealloc();
    }

    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v10 = 9;
    *(_OWORD *)(v10 + 8) = 0u;
    *(_OWORD *)(v10 + 24) = 0u;
    *(unsigned char *)(v10 + 40) = 5;
    swift_willThrow();
  }
  return v5;
}

uint64_t sub_100008D9C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100008DD4()
{
  unint64_t result = qword_100063EE8;
  if (!qword_100063EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063EE8);
  }
  return result;
}

uint64_t sub_100008E28(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008E6C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008EB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008E6C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100008EF8(id a1)
{
  if ((char *)a1 - 1 >= (char *)2) {
}
  }

void type metadata accessor for CFString(uint64_t a1)
{
}

id sub_100008F20(id result)
{
  if ((char *)result - 1 >= (char *)2) {
    return result;
  }
  return result;
}

unint64_t sub_100008F38()
{
  unint64_t result = qword_100063F28;
  if (!qword_100063F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063F28);
  }
  return result;
}

uint64_t sub_100008F8C(uint64_t a1, unint64_t a2)
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

double sub_100008FE4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100006FC0(a1, a2, *(long long **)(v3 + 16), a3);
}

uint64_t sub_100009000(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008F8C(a1, a2);
  }
  return a1;
}

uint64_t sub_100009014(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000902C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100007048(a1, a2, *(unint64_t **)(v3 + 16), a3);
}

uint64_t sub_100009090(uint64_t result)
{
  if (!*(void *)(result + 16))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v1 = result;
  uint64_t result = sub_10004740C(0x312E39322E352E32, 0xEF65676173553A35);
  if ((v2 & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_10000A6C0(*(void *)(v1 + 56) + 32 * result, (uint64_t)v10);
  sub_10000A71C(v10, v11);
  uint64_t result = swift_dynamicCast();
  if (!*(void *)(v1 + 16))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t result = sub_10004740C(0xD000000000000011, 0x8000000100052040);
  if (v3)
  {
    sub_10000A6C0(*(void *)(v1 + 56) + 32 * result, (uint64_t)v10);
    sub_10000A71C(v10, v11);
    swift_dynamicCast();
    if (v8 == 0xD000000000000010 && v9 == 0x8000000100052060)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v4 & 1) == 0) {
        goto LABEL_13;
      }
    }
    char v5 = sub_100006128(v8, v9, &off_10005DA88);
    swift_arrayDestroy();
    if (v5)
    {
      uint64_t v6 = 0x74707972636E65;
      if (v8 == 0xD000000000000010 && v9 == 0x8000000100051C90)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v7 & 1) == 0) {
          return 0x676E696E676973;
        }
      }
      return v6;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_1000092D8()
{
  sub_1000089F0();
  if (SecCertificateCopyProperties())
  {
    *(void *)&long long v1 = 0;
    static Array._forceBridgeFromObjectiveC(_:result:)();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10000A6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000A71C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000A72C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008E28(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000A788(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

uint64_t sub_10000A800(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000A848(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

void type metadata accessor for SecKey(uint64_t a1)
{
}

void type metadata accessor for SecIdentity(uint64_t a1)
{
}

void type metadata accessor for CFArray(uint64_t a1)
{
}

void sub_10000A8DC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000A924()
{
  return sub_10000A800((unint64_t *)&qword_100063FA0, type metadata accessor for CFString);
}

uint64_t sub_10000A96C()
{
  return sub_10000A800(&qword_100063FA8, type metadata accessor for CFString);
}

id sub_10000A9B8()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____TtC15icloudmailagent19PDSRegistrarService_pdsRegistrar;
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent19PDSRegistrarService_pdsRegistrar] = 0;
  id v4 = objc_allocWithZone((Class)PDSRegistrar);
  char v5 = v0;
  id v6 = sub_10000B1E0();
  char v7 = *(void **)&v0[v3];
  *(void *)&v1[v3] = v6;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return [super init];
}

void sub_10000AC3C()
{
  swift_bridgeObjectRetain();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v24 = [self userWithDSID:v1];

  if (v24)
  {
    long long v2 = *(void **)(v0 + OBJC_IVAR____TtC15icloudmailagent19PDSRegistrarService_pdsRegistrar);
    if (v2)
    {
      id v25 = 0;
      id v3 = v2;
      if ([v3 removeAllRegistrationsFromUser:v24 error:&v25])
      {
        uint64_t v4 = qword_100063EA0;
        id v5 = v25;
        if (v4 != -1) {
          swift_once();
        }
        uint64_t v6 = type metadata accessor for Logger();
        sub_100008D9C(v6, (uint64_t)qword_100067A00);
        char v7 = Logger.logObject.getter();
        os_log_type_t v8 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v7, v8))
        {
          objc_super v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)objc_super v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "Removing PDS registration was successful", v9, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        id v17 = v25;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        if (qword_100063EA0 != -1) {
          swift_once();
        }
        uint64_t v18 = type metadata accessor for Logger();
        sub_100008D9C(v18, (uint64_t)qword_100067A00);
        swift_errorRetain();
        swift_errorRetain();
        os_log_type_t v19 = Logger.logObject.getter();
        os_log_type_t v20 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = (uint8_t *)swift_slowAlloc();
          id v25 = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v21 = 136315138;
          swift_getErrorValue();
          uint64_t v22 = Error.localizedDescription.getter();
          sub_10004B330(v22, v23, (uint64_t *)&v25);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Could not deregister from PDS %s", v21, 0xCu);
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
      return;
    }
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100008D9C(v13, (uint64_t)qword_100067A00);
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "PDSRegistrar is nil", v16, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100008D9C(v10, (uint64_t)qword_100067A00);
    unint64_t v24 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v11, "PDSUser is nil in removing registration", v12, 2u);
      swift_slowDealloc();
    }
  }
}

id sub_10000B174()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for PDSRegistrarService()
{
  return self;
}

id sub_10000B1E0()
{
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithClientID:v1 error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

id sub_10000B2AC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v3 = [self userWithDSID:v2];
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)ACAccountStore) init];
    id v5 = [v4 aida_accountForPrimaryiCloudAccount];

    if (v5 && (id v6 = objc_msgSend(v5, "aida_dsid")) != 0)
    {
      char v7 = v6;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      NSString v8 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v3 = [self userWithDSID:v8];
    }
    else
    {
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v9 = type metadata accessor for Logger();
      sub_100008D9C(v9, (uint64_t)qword_100067A00);
      uint64_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Account is nil, unable to get dsid", v12, 2u);
        swift_slowDealloc();
      }
      else
      {
      }
      return 0;
    }
  }
  return v3;
}

void sub_10000B4B0(uint64_t a1, uint64_t a2, char a3)
{
  id v7 = objc_allocWithZone((Class)PDSRegistration);
  NSString v8 = String._bridgeToObjectiveC()();
  id v35 = [v7 initWithTopic:v8 pushEnvironment:a3];

  id v34 = sub_10000B2AC(a1, a2);
  if (!v34)
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100008D9C(v19, (uint64_t)qword_100067A00);
    os_log_type_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "PDSUser is nil", v22, 2u);
      swift_slowDealloc();
    }

    unint64_t v23 = v35;
    goto LABEL_19;
  }
  uint64_t v9 = *(void **)(v3 + OBJC_IVAR____TtC15icloudmailagent19PDSRegistrarService_pdsRegistrar);
  if (!v9)
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_100008D9C(v24, (uint64_t)qword_100067A00);
    id v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "PDSRegistrar is nil", v27, 2u);
      swift_slowDealloc();
    }

    unint64_t v23 = v34;
LABEL_19:

    return;
  }
  id v36 = 0;
  uint64_t v10 = v9;
  if ([v10 ensureRegistrationPresent:v35 forUser:v34 error:&v36])
  {
    uint64_t v11 = qword_100063EA0;
    id v12 = v36;
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100008D9C(v13, (uint64_t)qword_100067A00);
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      id v36 = (id)swift_slowAlloc();
      *(_DWORD *)unint64_t v16 = 136315138;
      uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
      sub_10004B330(v17, v18, (uint64_t *)&v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "PDS Registration was successful. environment is: %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  else
  {
    id v28 = v36;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    sub_100008D9C(v29, (uint64_t)qword_100067A00);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      id v36 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_getErrorValue();
      uint64_t v32 = Error.localizedDescription.getter();
      sub_10004B330(v32, v33, (uint64_t *)&v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v30, "could not register to PDS error: %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
}

id sub_10000BAE8()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for APNSManager()) init];
  qword_100067990 = (uint64_t)result;
  return result;
}

id sub_10000BB74()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent11APNSManager_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection] = 0;
  uint64_t v9 = OBJC_IVAR____TtC15icloudmailagent11APNSManager_connectionQueue;
  v8[1] = sub_10000DF10();
  id v4 = v0;
  static DispatchQoS.background.getter();
  uint64_t v13 = &_swiftEmptyArrayStorage;
  sub_10000DF50((unint64_t *)&qword_100064910, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100008E28(&qword_100064100);
  sub_10000DF98(&qword_100064920, &qword_100064100);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v10);
  *(void *)&v0[v9] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v5 = OBJC_IVAR____TtC15icloudmailagent11APNSManager_pdsRegistrarService;
  *(void *)&v4[v5] = [objc_allocWithZone((Class)type metadata accessor for PDSRegistrarService()) init];
  *(void *)&v4[OBJC_IVAR____TtC15icloudmailagent11APNSManager_topics] = &off_10005DAC8;

  v12.receiver = v4;
  v12.super_class = ObjectType;
  id v6 = [super init];
  sub_10000BE60();

  return v6;
}

void sub_10000BE60()
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100008D9C(v0, (uint64_t)qword_100067A00);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Registering for account changes...", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [self sharedSubscriber];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7[4] = sub_10000DFE8;
  v7[5] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10000D5F8;
  v7[3] = &unk_10005DF20;
  id v6 = _Block_copy(v7);
  swift_release();
  [v4 registerAccountChangeEventHandler:v6];
  _Block_release(v6);
}

uint64_t sub_10000C03C()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  id v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v12 - 8);
  __chkstk_darwin();
  id v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = *(void *)(v0 + OBJC_IVAR____TtC15icloudmailagent11APNSManager_connectionQueue);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10000DEE8;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C2B8;
  aBlock[3] = &unk_10005DED0;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v13 = _swiftEmptyArrayStorage;
  sub_10000DF50((unint64_t *)&unk_100064DA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100008E28(&qword_1000640F0);
  sub_10000DF98((unint64_t *)&unk_100064DB0, &qword_1000640F0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v12);
  swift_release();
  return swift_release();
}

void sub_10000C304()
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100008D9C(v0, (uint64_t)qword_100067A00);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Starting APNS Manager 2...", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    if (*(void *)(Strong + OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection))
    {
      uint64_t v6 = Logger.logObject.getter();
      os_log_type_t v7 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "APS Connection exists", v8, 2u);
        swift_slowDealloc();

        uint64_t v5 = v6;
      }
      else
      {
      }
    }
    else
    {
      sub_10000C4AC();
    }
  }
}

void sub_10000C4AC()
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100008D9C(v0, (uint64_t)qword_100067A00);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Getting APS environment...", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [self sharedServer];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7[4] = sub_10000DF08;
  v7[5] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10000CC60;
  v7[3] = &unk_10005DEF8;
  uint64_t v6 = _Block_copy(v7);
  swift_release();
  [v4 configurationWithCompletion:v6];
  _Block_release(v6);
}

void sub_10000C6AC(void *a1)
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_100067A00);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Setting up APS connection...", v5, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    os_log_type_t v7 = Strong;
    if (a1)
    {
      id v8 = [a1 apsEnvironment];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v12 = v11;

        uint64_t v13 = HIBYTE(v12) & 0xF;
        if ((v12 & 0x2000000000000000) == 0) {
          uint64_t v13 = v10 & 0xFFFFFFFFFFFFLL;
        }
        if (v13)
        {
          uint64_t v14 = self;
          NSString v15 = String._bridgeToObjectiveC()();
          LODWORD(v14) = [v14 isValidEnvironment:v15];

          if (v14)
          {
LABEL_14:
            if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v17)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if ((v19 & 1) == 0)
              {
                os_log_type_t v20 = Logger.logObject.getter();
                os_log_type_t v21 = static os_log_type_t.default.getter();
                if (!os_log_type_enabled(v20, v21))
                {
                  char v23 = 1;
                  goto LABEL_27;
                }
                uint64_t v22 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v22 = 0;
                _os_log_impl((void *)&_mh_execute_header, v20, v21, "APS environment: Sandbox", v22, 2u);
                char v23 = 1;
                goto LABEL_24;
              }
            }
            os_log_type_t v20 = Logger.logObject.getter();
            os_log_type_t v24 = static os_log_type_t.default.getter();
            if (!os_log_type_enabled(v20, v24))
            {
              char v23 = 0;
              goto LABEL_27;
            }
            id v25 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v25 = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, v24, "APS environment: Prod", v25, 2u);
            char v23 = 0;
LABEL_24:
            swift_slowDealloc();
LABEL_27:

            uint64_t v26 = OBJC_IVAR____TtC15icloudmailagent11APNSManager_topics;
            uint64_t v27 = (*(void **)((char *)&v7->isa + OBJC_IVAR____TtC15icloudmailagent11APNSManager_topics))[2];
            if (v27)
            {
              uint64_t v28 = OBJC_IVAR____TtC15icloudmailagent11APNSManager_pdsRegistrarService;
              swift_bridgeObjectRetain();
              do
              {
                id v29 = *(id *)((char *)&v7->isa + v28);
                sub_10000B4B0(0, 0, v23);

                --v27;
              }
              while (v27);
              swift_bridgeObjectRelease();
            }
            sub_10000DF10();
            os_log_type_t v30 = (void *)static OS_dispatch_queue.main.getter();
            id v31 = objc_allocWithZone((Class)APSConnection);
            NSString v32 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            NSString v33 = String._bridgeToObjectiveC()();
            id v34 = (objc_class *)[v31 initWithEnvironmentName:v32 namedDelegatePort:v33 queue:v30];

            uint64_t v35 = OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection;
            id v36 = *(Class *)((char *)&v7->isa + OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection);
            *(Class *)((char *)&v7->isa + OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection) = v34;

            uint64_t v37 = *(Class *)((char *)&v7->isa + v35);
            if (v37)
            {
              [v37 setDelegate:v7];
              unint64_t v38 = *(Class *)((char *)&v7->isa + v35);
              if (v38)
              {
                int64_t v39 = (*(void **)((char *)&v7->isa + v26))[2];
                if (v39)
                {
                  id v40 = v38;
                  swift_bridgeObjectRetain();
                  sub_10002E98C(0, v39, 0);
                  unint64_t v41 = *((void *)&_swiftEmptyArrayStorage + 2);
                  uint64_t v42 = 16 * v41;
                  do
                  {
                    unint64_t v43 = *((void *)&_swiftEmptyArrayStorage + 3);
                    unint64_t v44 = v41 + 1;
                    if (v41 >= v43 >> 1) {
                      sub_10002E98C(v43 > 1, v41 + 1, 1);
                    }
                    *((void *)&_swiftEmptyArrayStorage + 2) = v44;
                    Swift::String v45 = (char *)&_swiftEmptyArrayStorage + v42;
                    *((void *)v45 + 4) = 0xD00000000000001ELL;
                    *((void *)v45 + 5) = 0x8000000100051CD0;
                    v42 += 16;
                    unint64_t v41 = v44;
                    --v39;
                  }
                  while (v39);
                  swift_bridgeObjectRelease();
                }
                else
                {
                  id v40 = v38;
                }
                Class isa = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease();
                [v40 _setEnabledTopics:isa];
              }
            }
            Swift::String v47 = Logger.logObject.getter();
            os_log_type_t v48 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v47, v48))
            {
              v49 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v49 = 0;
              _os_log_impl((void *)&_mh_execute_header, v47, v48, "APS Connection starting...", v49, 2u);
              swift_slowDealloc();
              v50 = v7;
            }
            else
            {
              v50 = v47;
              Swift::String v47 = v7;
            }

            return;
          }
        }
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v16;
    goto LABEL_14;
  }
}

void sub_10000CC60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10000CCEC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection);
  *(void *)(v0 + OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection) = 0;

  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_100067A00);
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "APS Connection stopped.", v4, 2u);
    swift_slowDealloc();
  }
}

id sub_10000CDE8()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  os_log_type_t v3 = *(void **)&v0[OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection];
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent11APNSManager_connection] = 0;

  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100008D9C(v4, (uint64_t)qword_100067A00);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "APS Connection stopped.", v7, 2u);
    swift_slowDealloc();
  }

  v9.receiver = v1;
  v9.super_class = ObjectType;
  return [super dealloc];
}

uint64_t type metadata accessor for APNSManager()
{
  return self;
}

void sub_10000D000(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v9 = (char *)Strong;
    if (a1 && (id v10 = [a1 apsEnvironment]) != 0)
    {
      unint64_t v11 = v10;
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v14 = v13;

      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      if (v14)
      {
        if (v12 == v15 && v14 == v16)
        {
          swift_bridgeObjectRelease_n();
          char v19 = 0;
          goto LABEL_14;
        }
        char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v19 = 0;
        if (v18)
        {
LABEL_14:
          uint64_t v20 = *(void *)(*(void *)&v9[OBJC_IVAR____TtC15icloudmailagent11APNSManager_topics] + 16);
          if (v20)
          {
            uint64_t v21 = OBJC_IVAR____TtC15icloudmailagent11APNSManager_pdsRegistrarService;
            swift_bridgeObjectRetain();
            do
            {
              id v22 = *(id *)&v9[v21];
              sub_10000B4B0(a4, a5, v19);

              --v20;
            }
            while (v20);

            swift_bridgeObjectRelease();
          }
          else
          {
          }
          return;
        }
LABEL_13:
        char v19 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
}

void sub_10000D194(void *a1, int a2)
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100008D9C(v4, (uint64_t)qword_100067A00);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "ACXPCEventSubscriber account change received", v7, 2u);
    swift_slowDealloc();
  }

  if (a2 == 3)
  {
    char v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "ACXPCEventSubscriber account deleted", v21, 2u);
      swift_slowDealloc();
    }

    if (a1)
    {
      uint64_t v22 = AAAccountClassPrimary;
      id v31 = a1;
      if (objc_msgSend(v31, "aa_isAccountClass:", v22))
      {
        id v23 = [v31 aida_dsid];
        if (v23)
        {
          os_log_type_t v24 = v23;
          static String._unconditionallyBridgeFromObjectiveC(_:)();

          swift_beginAccess();
          uint64_t Strong = swift_unknownObjectWeakLoadStrong();
          if (Strong)
          {
            uint64_t v26 = (void *)Strong;
            sub_10000AC3C();
          }
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
      }
      goto LABEL_23;
    }
  }
  else if (a2 == 1)
  {
    id v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "ACXPCEventSubscriber account added", v10, 2u);
      swift_slowDealloc();
    }

    if (a1)
    {
      uint64_t v11 = AAAccountClassPrimary;
      id v31 = a1;
      if (objc_msgSend(v31, "aa_isAccountClass:", v11))
      {
        swift_beginAccess();
        uint64_t v12 = swift_unknownObjectWeakLoadStrong();
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          id v14 = [v31 aida_dsid];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v18 = v17;
          }
          else
          {
            uint64_t v16 = 0;
            uint64_t v18 = 0;
          }
          id v27 = [self sharedServer];
          uint64_t v28 = swift_allocObject();
          swift_unknownObjectWeakInit();
          id v29 = (void *)swift_allocObject();
          v29[2] = v28;
          v29[3] = v16;
          v29[4] = v18;
          aBlock[4] = sub_10000E030;
          aBlock[5] = v29;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = sub_10000CC60;
          aBlock[3] = &unk_10005DF70;
          os_log_type_t v30 = _Block_copy(aBlock);
          swift_bridgeObjectRetain();
          swift_release();
          [v27 configurationWithCompletion:v30];
          _Block_release(v30);

          swift_bridgeObjectRelease();
          return;
        }
LABEL_25:

        return;
      }
LABEL_23:
      goto LABEL_25;
    }
  }
}

void sub_10000D5F8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  v5(a2, a3);
  swift_release();
}

void sub_10000D790(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100008D9C(v2, (uint64_t)qword_100067A00);
    oslog = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "APS Public token received with nil", v4, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100008D9C(v7, (uint64_t)qword_100067A00);
    sub_10000A848(a1, a2);
    sub_10000A848(a1, a2);
    oslog = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v9 = 136315138;
      Swift::String v10 = Data.base64EncodedString(options:)(0);
      sub_10004B330(v10._countAndFlagsBits, (unint64_t)v10._object, &v12);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100009000(a1, a2);
      sub_100009000(a1, a2);
      _os_log_impl((void *)&_mh_execute_header, oslog, v8, "APS Public token received: %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    sub_100009000(a1, a2);
    sub_100009000(a1, a2);
  }
}

void sub_10000DA4C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100008D9C(v4, (uint64_t)qword_100067A00);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  Swift::String v10 = Logger.logObject.getter();
  int v41 = static os_log_type_t.default.getter();
  p_type = &stru_100061FF0.type;
  uint64_t v12 = &stru_100061FF0.type;
  if (os_log_type_enabled(v10, (os_log_type_t)v41))
  {
    os_log_t v40 = v10;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v43 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    if (!a1)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    uint64_t v39 = v14;
    id v15 = [v9 topic];
    if (!v15)
    {
LABEL_19:

      __break(1u);
      goto LABEL_20;
    }
    uint64_t v16 = v15;
    uint64_t v35 = v5;
    uint64_t v36 = v4;
    uint64_t v37 = v2;
    unint64_t v38 = a1;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    uint64_t v42 = sub_10004B330(v17, v19, &v43);
    id v34 = &v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    id v20 = [v9 userInfo];
    if (!v20)
    {
LABEL_20:

      __break(1u);
      return;
    }
    uint64_t v21 = v20;
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = Dictionary.description.getter();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    uint64_t v42 = sub_10004B330(v22, v24, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v25 = v40;
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v41, "Receive APNS message with topic: %s, payload: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v36);
    a1 = v38;
    p_type = (char **)(&stru_100061FF0 + 16);
    uint64_t v12 = (char **)(&stru_100061FF0 + 16);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (!swift_unknownObjectWeakLoadStrong()) {
    return;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_16;
  }
  id v26 = [v9 v12[262]];
  if (!v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v27 = v26;
  uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  id v29 = [v9 p_type[263]];
  if (!v29)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  os_log_type_t v30 = v29;
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v33 = v32;

  sub_10002C5C8(v28, v31, v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

uint64_t sub_10000DEB0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DEE8()
{
}

uint64_t sub_10000DEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DF00()
{
  return swift_release();
}

void sub_10000DF08(void *a1)
{
}

unint64_t sub_10000DF10()
{
  unint64_t result = qword_1000640F8;
  if (!qword_1000640F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000640F8);
  }
  return result;
}

uint64_t sub_10000DF50(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000DF98(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008E6C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000DFE8(void *a1, int a2)
{
}

uint64_t sub_10000DFF0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000E030(void *a1, uint64_t a2)
{
  sub_10000D000(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_10000E03C(uint64_t a1)
{
  return a1;
}

char *sub_10000E07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = OBJC_IVAR___CloudKitKVSManager_keyValueStore;
  *(void *)&v3[OBJC_IVAR___CloudKitKVSManager_keyValueStore] = 0;
  uint64_t v6 = &v3[OBJC_IVAR___CloudKitKVSManager_storeIdentifier];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  id v7 = objc_allocWithZone((Class)NSUbiquitousKeyValueStore);
  uint64_t v8 = v3;
  swift_bridgeObjectRetain();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = [v7 initWithStoreIdentifier:v9 type:2];

  uint64_t v11 = *(void **)&v3[v5];
  *(void *)&v3[v5] = v10;

  *(void *)&v8[OBJC_IVAR___CloudKitKVSManager_cloudAccountManager] = a3;
  swift_unknownObjectRetain();

  v22.receiver = v8;
  v22.super_class = (Class)type metadata accessor for CloudKitKVSManager();
  id v12 = [super init];
  uint64_t v13 = self;
  uint64_t v14 = (char *)v12;
  id v15 = [v13 defaultCenter];
  uint64_t v16 = OBJC_IVAR___CloudKitKVSManager_keyValueStore;
  [v15 addObserver:v14 selector:"handleStoreDidChangeExternally:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:*(void *)&v14[OBJC_IVAR___CloudKitKVSManager_keyValueStore]];

  uint64_t result = *(char **)&v14[v16];
  if (result)
  {
    if ([result synchronize])
    {

      swift_unknownObjectRelease();
    }
    else
    {
      if (qword_100063E88 != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for Logger();
      sub_100008D9C(v18, (uint64_t)qword_1000679B8);
      unint64_t v19 = Logger.logObject.getter();
      os_log_type_t v20 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "KVS failed to synchronize", v21, 2u);
        swift_slowDealloc();
      }

      swift_unknownObjectRelease();
    }
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E3F4(void *a1, int a2, int a3, void *aBlock, void (*a5)(uint64_t, uint64_t, id, void *))
{
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a1;
  a5(v8, v10, v11, v7);
  _Block_release(v7);
  _Block_release(v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E4BC(void *a1, int a2, char a3, int a4, void *aBlock, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;
  _Block_copy(v13);
  id v17 = a1;
  sub_100010B90(a3, v14, v16, (uint64_t)v17, (uint64_t)v13, a6, a7, a8);
  _Block_release(v13);
  _Block_release(v13);

  return swift_bridgeObjectRelease();
}

void *sub_10000E5A4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___CloudKitKVSManager_keyValueStore);
  if (!v1) {
    return &_swiftEmptyDictionarySingleton;
  }
  id v2 = [v1 dictionaryRepresentation];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (qword_100063E88 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100008D9C(v4, (uint64_t)qword_1000679B8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v8 = Dictionary.description.getter();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_10004B330(v8, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "KVS store: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (void *)v3;
}

void sub_10000E7EC(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = OBJC_IVAR___CloudKitKVSManager_keyValueStore;
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR___CloudKitKVSManager_keyValueStore);
  if (!v5) {
    goto LABEL_10;
  }
  sub_10000902C(a1, a1[3]);
  id v8 = v5;
  uint64_t v9 = _bridgeAnythingToObjectiveC<A>(_:)();
  NSString v10 = String._bridgeToObjectiveC()();
  [v8 setObject:v9 forKey:v10];

  swift_unknownObjectRelease();
  id v11 = *(void **)(v3 + v4);
  if (v11)
  {
    if (([v11 synchronize] & 1) == 0)
    {
      if (qword_100063E88 != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      sub_100008D9C(v12, (uint64_t)qword_1000679B8);
      swift_bridgeObjectRetain_n();
      uint64_t v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        unint64_t v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v16 = swift_slowAlloc();
        *(_DWORD *)unint64_t v15 = 136315138;
        swift_bridgeObjectRetain();
        sub_10004B330(a2, a3, &v16);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Store failed to synchronize key %s", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
LABEL_10:
    __break(1u);
  }
}

uint64_t sub_10000EA30(uint64_t a1, unint64_t a2)
{
  os_log_t v40 = &_swiftEmptyDictionarySingleton;
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3)
  {
    if (qword_100063E88 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100008D9C(v7, (uint64_t)qword_1000679B8);
    id v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      NSString v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalid agrument. emailAddress can't be empty", v10, 2u);
      swift_slowDealloc();
    }

    sub_10000FF2C();
    swift_allocError();
    *id v11 = 5;
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
  os_log_type_t v6 = sub_10000E5A4();
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v13 = v6;
  if (!v6[2])
  {
    long long v38 = 0u;
    long long v39 = 0u;
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_10004740C(a1, a2);
  if ((v15 & 1) == 0)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  sub_10000A6C0(v13[7] + 32 * v14, (uint64_t)&v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v39 + 1))
  {
LABEL_26:
    sub_10000FECC((uint64_t)&v38);
    goto LABEL_27;
  }
  sub_100008E28((uint64_t *)&unk_100063F40);
  if (swift_dynamicCast())
  {
    if (*(void *)(v36 + 16))
    {
      unint64_t v16 = sub_10004740C(0xD000000000000014, 0x8000000100052B30);
      if (v17)
      {
        sub_10000A6C0(*(void *)(v36 + 56) + 32 * v16, (uint64_t)&v38);
        if (swift_dynamicCast())
        {
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v20 = v19;
          sub_10000A848(v36, v37);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v38 = &_swiftEmptyDictionarySingleton;
          os_log_t v40 = (void *)0x8000000000000000;
          sub_100042094(v36, v37, v18, v20, isUniquelyReferenced_nonNull_native);
          os_log_t v40 = (void *)v38;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100008F8C(v36, v37);
        }
      }
    }
    if (*(void *)(v36 + 16) && (unint64_t v22 = sub_10004740C(0xD000000000000011, 0x8000000100052B50), (v23 & 1) != 0))
    {
      sub_10000A6C0(*(void *)(v36 + 56) + 32 * v22, (uint64_t)&v38);
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v39 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v33 = v32;
        sub_10000A848(v36, v37);
        id v34 = v40;
        char v35 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v38 = v34;
        os_log_t v40 = (void *)0x8000000000000000;
        sub_100042094(v36, v37, v31, v33, v35);
        os_log_t v40 = (void *)v38;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100008F8C(v36, v37);
      }
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_27:
  if (qword_100063E88 != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  sub_100008D9C(v24, (uint64_t)qword_1000679B8);
  os_log_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    id v27 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v38 = swift_slowAlloc();
    *(_DWORD *)id v27 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v28 = Dictionary.description.getter();
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    sub_10004B330(v28, v30, (uint64_t *)&v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Found default certificates: %s", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  return (uint64_t)v40;
}

void *sub_10000F0CC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = v3;
    uint64_t result = sub_10000E5A4();
    if (!v4)
    {
      id v11 = result;
      if (result[2])
      {
        swift_bridgeObjectRetain();
        unint64_t v12 = sub_10004740C(a1, a2);
        if (v13)
        {
          sub_10000A6C0(v11[7] + 32 * v12, (uint64_t)&v49);
        }
        else
        {
          long long v49 = 0u;
          long long v50 = 0u;
        }
      }
      else
      {
        long long v49 = 0u;
        long long v50 = 0u;
        swift_bridgeObjectRetain();
      }
      sub_10000FF80((uint64_t)&v49, (uint64_t)&v47);
      if (v48)
      {
        sub_10000A71C(&v47, &v51);
      }
      else
      {
        Swift::String v52 = (void *)sub_100008E28((uint64_t *)&unk_100063F40);
        *(void *)&long long v51 = &_swiftEmptyDictionarySingleton;
        sub_10000FECC((uint64_t)&v47);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v19 = sub_100008E28((uint64_t *)&unk_100063F40);
      swift_dynamicCast();
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      if (*(void *)(a3 + 16) && (unint64_t v22 = sub_10004740C(v20, v21), (v23 & 1) != 0))
      {
        uint64_t v24 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v22);
        uint64_t v44 = v19;
        uint64_t v25 = *v24;
        unint64_t v26 = v24[1];
        sub_10000A848(*v24, v26);
        swift_bridgeObjectRelease();
        Swift::String v52 = &type metadata for Data;
        *(void *)&long long v51 = v25;
        *((void *)&v51 + 1) = v26;
        sub_10000A71C(&v51, &v49);
        sub_10000A848(v25, v26);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v47 = v46;
        sub_100041F40(&v49, 0xD000000000000014, 0x8000000100052B30, isUniquelyReferenced_nonNull_native);
        uint64_t v46 = v47;
        swift_bridgeObjectRelease();
        uint64_t v28 = v25;
        uint64_t v19 = v44;
        sub_100008F8C(v28, v26);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      if (*(void *)(a3 + 16) && (unint64_t v31 = sub_10004740C(v29, v30), (v32 & 1) != 0))
      {
        uint64_t v33 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v31);
        uint64_t v45 = v19;
        uint64_t v34 = *v33;
        unint64_t v35 = v33[1];
        sub_10000A848(*v33, v35);
        swift_bridgeObjectRelease();
        Swift::String v52 = &type metadata for Data;
        *(void *)&long long v51 = v34;
        *((void *)&v51 + 1) = v35;
        sub_10000A71C(&v51, &v49);
        sub_10000A848(v34, v35);
        char v36 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v47 = v46;
        sub_100041F40(&v49, 0xD000000000000011, 0x8000000100052B50, v36);
        uint64_t v46 = v47;
        swift_bridgeObjectRelease();
        uint64_t v37 = v34;
        uint64_t v19 = v45;
        sub_100008F8C(v37, v35);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      Swift::String v52 = (void *)v19;
      *(void *)&long long v51 = v46;
      swift_bridgeObjectRetain();
      sub_10000E7EC(&v51, a1, a2);
      sub_10000A788((uint64_t)&v51);
      long long v38 = *(void **)(v6 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
      swift_unknownObjectRetain();
      NSString v39 = String._bridgeToObjectiveC()();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      *(void *)&long long v51 = 0;
      unsigned __int8 v41 = [v38 updateCertificateDefaultsWithEmailAddress:v39 identityPersistentRefs:isa error:&v51];
      swift_unknownObjectRelease();

      if (v41)
      {
        id v42 = (id)v51;
      }
      else
      {
        id v43 = (id)v51;
        _convertNSErrorToError(_:)();

        swift_willThrow();
      }
      return (void *)swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (qword_100063E88 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100008D9C(v14, (uint64_t)qword_1000679B8);
    char v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      char v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Invalid agrument. emailAddress can't be empty", v17, 2u);
      swift_slowDealloc();
    }

    sub_10000FF2C();
    swift_allocError();
    *uint64_t v18 = 5;
    return (void *)swift_willThrow();
  }
  return result;
}

id sub_10000F6C0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    if (qword_100063E88 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_100008D9C(v16, (uint64_t)qword_1000679B8);
    char v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Invalid agrument. emailAddress can't be empty", v19, 2u);
      swift_slowDealloc();
    }

    sub_10000FF2C();
    swift_allocError();
    *uint64_t v20 = 5;
    return (id)swift_willThrow();
  }
  uint64_t v7 = v4;
  uint64_t v11 = 0xD000000000000011;
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == a3 && v12 == a4)
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = 0x8000000100052B50;
  }
  else
  {
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v14)
    {
      uint64_t v15 = 0x8000000100052B50;
    }
    else
    {
      uint64_t v11 = 0xD000000000000014;
      uint64_t v15 = 0x8000000100052B30;
    }
  }
  uint64_t v21 = sub_10000E5A4();
  if (v5) {
    return (id)swift_bridgeObjectRelease();
  }
  char v23 = v21;
  if (!v21[2])
  {
    long long v35 = 0u;
    long long v36 = 0u;
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_10004740C(a1, a2);
  if ((v25 & 1) == 0)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  sub_10000A6C0(v23[7] + 32 * v24, (uint64_t)&v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v36 + 1))
  {
LABEL_29:
    swift_bridgeObjectRelease();
    sub_10000FECC((uint64_t)&v35);
    goto LABEL_30;
  }
  uint64_t v26 = sub_100008E28((uint64_t *)&unk_100063F40);
  if (swift_dynamicCast())
  {
    if (*(void *)(v34 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v27 = sub_10004740C(v11, v15);
      if (v28)
      {
        sub_10000A6C0(*(void *)(v34 + 56) + 32 * v27, (uint64_t)&v35);
      }
      else
      {
        long long v35 = 0u;
        long long v36 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v36 + 1))
      {
        sub_10000FECC((uint64_t)&v35);
        sub_1000416F8(v11, v15, &v35);
        sub_10000FECC((uint64_t)&v35);
        swift_bridgeObjectRelease();
        *((void *)&v36 + 1) = v26;
        *(void *)&long long v35 = v34;
        sub_10000E7EC(&v35, a1, a2);
        sub_10000A788((uint64_t)&v35);
        goto LABEL_30;
      }
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000FECC((uint64_t)&v35);
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
LABEL_30:
  uint64_t v29 = *(void **)(v7 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
  swift_unknownObjectRetain();
  NSString v30 = String._bridgeToObjectiveC()();
  NSString v31 = String._bridgeToObjectiveC()();
  *(void *)&long long v35 = 0;
  unsigned int v32 = [v29 removeCertificateDefaultsWithEmailAddress:v30 certTypeKey:v31 error:&v35];
  swift_unknownObjectRelease();

  if (v32) {
    return (id)v35;
  }
  id v33 = (id)v35;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

id sub_10000FCEC()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0 name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:*(void *)&v0[OBJC_IVAR___CloudKitKVSManager_keyValueStore]];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CloudKitKVSManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CloudKitKVSManager()
{
  return self;
}

uint64_t sub_10000FECC(uint64_t a1)
{
  uint64_t v2 = sub_100008E28((uint64_t *)&unk_1000648F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000FF2C()
{
  unint64_t result = qword_100064148;
  if (!qword_100064148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064148);
  }
  return result;
}

uint64_t sub_10000FF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008E28((uint64_t *)&unk_1000648F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FFE8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = sub_10000E5A4();
  }
  else
  {
    if (qword_100063E88 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100008D9C(v10, (uint64_t)qword_1000679B8);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      char v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Invalid agrument. emailAddress can't be empty", v13, 2u);
      swift_slowDealloc();
    }

    sub_10000FF2C();
    swift_allocError();
    *char v14 = 5;
    uint64_t v15 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, void *))(a4 + 16))(a4, 0, v15);

    swift_errorRelease();
    uint64_t v6 = sub_10000E5A4();
  }
  uint64_t v7 = v6;
  if (v6[2] && (unint64_t v8 = sub_10004740C(0xD00000000000001BLL, 0x8000000100052BA0), (v9 & 1) != 0)) {
    sub_10000A6C0(v7[7] + 32 * v8, (uint64_t)v19);
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  sub_10000FF80((uint64_t)v19, (uint64_t)&v17);
  if (v18)
  {
    sub_10000A71C(&v17, &v20);
  }
  else
  {
    uint64_t v21 = &type metadata for Bool;
    LOBYTE(v20) = 0;
    sub_10000FECC((uint64_t)&v17);
  }
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, void))(a4 + 16))(a4, LOBYTE(v19[0]), 0);
}

uint64_t sub_100010284(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v10 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    if (qword_100063E88 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100008D9C(v11, (uint64_t)qword_1000679B8);
    os_log_type_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      char v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Invalid agrument. emailAddress can't be empty", v14, 2u);
      swift_slowDealloc();
    }

    sub_10000FF2C();
    swift_allocError();
    *uint64_t v15 = 5;
    uint64_t v16 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v16);

    swift_errorRelease();
  }
  long long v17 = *(void **)(a4 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
  swift_unknownObjectRetain();
  NSString v18 = String._bridgeToObjectiveC()();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  *(void *)&long long v39 = 0;
  char v20 = a1 & 1;
  unsigned int v21 = [v17 setFlagsToAccountWithEmailAddress:v18 keys:isa value:a1 & 1 error:&v39];
  swift_unknownObjectRelease();

  unint64_t v22 = (void *)v39;
  if (v21)
  {
    os_log_t v40 = &type metadata for Bool;
    LOBYTE(v39) = v20;
    id v23 = v22;
    sub_10000E7EC(&v39, 0xD00000000000001BLL, 0x8000000100052BA0);
    sub_10000A788((uint64_t)&v39);
    unint64_t v24 = sub_10000E5A4();
    if (v24[2])
    {
      swift_bridgeObjectRetain();
      unint64_t v25 = sub_10004740C(a2, a3);
      if (v26)
      {
        sub_10000A6C0(v24[7] + 32 * v25, (uint64_t)&v37);
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
      }
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      swift_bridgeObjectRetain();
    }
    sub_10000FF80((uint64_t)&v37, (uint64_t)&v35);
    if (v36)
    {
      sub_10000A71C(&v35, &v39);
    }
    else
    {
      os_log_t v40 = (void *)sub_100008E28((uint64_t *)&unk_100063F40);
      *(void *)&long long v39 = &_swiftEmptyDictionarySingleton;
      sub_10000FECC((uint64_t)&v35);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_100008E28((uint64_t *)&unk_100063F40);
    swift_dynamicCast();
    os_log_t v40 = &type metadata for Bool;
    LOBYTE(v39) = v20;
    sub_10000A71C(&v39, &v37);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = v35;
    *(void *)&long long v35 = 0x8000000000000000;
    sub_100041F40(&v37, 0xD000000000000013, 0x8000000100051D10, isUniquelyReferenced_nonNull_native);
    *(void *)&long long v35 = v33;
    swift_bridgeObjectRelease();
    os_log_t v40 = &type metadata for Bool;
    LOBYTE(v39) = v20;
    sub_10000A71C(&v39, &v37);
    char v32 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = v35;
    *(void *)&long long v35 = 0x8000000000000000;
    sub_100041F40(&v37, 0xD000000000000016, 0x8000000100051D30, v32);
    *(void *)&long long v35 = v34;
    swift_bridgeObjectRelease();
    os_log_t v40 = (void *)v30;
    *(void *)&long long v39 = v35;
    swift_bridgeObjectRetain();
    sub_10000E7EC(&v39, a2, a3);
    sub_10000A788((uint64_t)&v39);
    (*(void (**)(uint64_t, void))(a5 + 16))(a5, 0);
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v27 = (id)v39;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    char v28 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v28);

    swift_errorRelease();
    return swift_errorRelease();
  }
}

void sub_100010758(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    unint64_t v8 = sub_10000E5A4();
  }
  else
  {
    if (qword_100063E88 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_100008D9C(v16, (uint64_t)qword_1000679B8);
    long long v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Invalid agrument. emailAddress can't be empty", v19, 2u);
      swift_slowDealloc();
    }

    sub_10000FF2C();
    swift_allocError();
    *char v20 = 5;
    unsigned int v21 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, void *))(a4 + 16))(a4, 0, v21);

    swift_errorRelease();
    unint64_t v8 = sub_10000E5A4();
  }
  char v9 = v8;
  id v10 = [objc_allocWithZone((Class)MCCSigningAndEncryptionMessagesStatus) init];
  if (!v9[2])
  {
    long long v28 = 0u;
    long long v29 = 0u;
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_10004740C(a1, a2);
  if ((v12 & 1) == 0)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  sub_10000A6C0(v9[7] + 32 * v11, (uint64_t)&v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v29 + 1))
  {
LABEL_20:
    sub_10000FECC((uint64_t)&v28);
    goto LABEL_21;
  }
  sub_100008E28((uint64_t *)&unk_100063F40);
  if (swift_dynamicCast())
  {
    uint64_t v13 = v26;
    if (*(void *)(v26 + 16) && (unint64_t v14 = sub_10004740C(0xD000000000000013, 0x8000000100051D10), (v15 & 1) != 0))
    {
      sub_10000A6C0(*(void *)(v26 + 56) + 32 * v14, (uint64_t)&v26);
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
    }
    sub_10000FF80((uint64_t)&v26, (uint64_t)&v24);
    if (v25)
    {
      sub_10000A71C(&v24, &v28);
    }
    else
    {
      *((void *)&v29 + 1) = &type metadata for Bool;
      LOBYTE(v28) = 0;
      sub_10000FECC((uint64_t)&v24);
    }
    swift_dynamicCast();
    [v10 setSignMessagesIsEnabled:v26];
    if (*(void *)(v13 + 16) && (unint64_t v22 = sub_10004740C(0xD000000000000016, 0x8000000100051D30), (v23 & 1) != 0))
    {
      sub_10000A6C0(*(void *)(v13 + 56) + 32 * v22, (uint64_t)&v26);
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
    }
    sub_10000FF80((uint64_t)&v26, (uint64_t)&v24);
    if (v25)
    {
      sub_10000A71C(&v24, &v28);
    }
    else
    {
      *((void *)&v29 + 1) = &type metadata for Bool;
      LOBYTE(v28) = 0;
      sub_10000FECC((uint64_t)&v24);
    }
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    [v10 setEncryptMessagesIsEnabled:v26];
  }
LABEL_21:
  (*(void (**)(uint64_t, id, void))(a4 + 16))(a4, v10, 0);
}

uint64_t sub_100010B90(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v14 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14)
  {
    if (qword_100063E88 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100008D9C(v15, (uint64_t)qword_1000679B8);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Invalid agrument. emailAddress can't be empty", v18, 2u);
      swift_slowDealloc();
    }

    sub_10000FF2C();
    swift_allocError();
    *uint64_t v19 = 5;
    char v20 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v20);

    swift_errorRelease();
  }
  unsigned int v21 = *(void **)(a4 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
  swift_unknownObjectRetain();
  NSString v22 = String._bridgeToObjectiveC()();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  *(void *)&long long v40 = 0;
  unsigned int v24 = [v21 setFlagsToAccountWithEmailAddress:v22 keys:isa value:a1 & 1 error:&v40];
  swift_unknownObjectRelease();

  if (v24)
  {
    id v25 = (id)v40;
    long long v26 = sub_10000E5A4();
    if (v26[2])
    {
      swift_bridgeObjectRetain();
      unint64_t v27 = sub_10004740C(a2, a3);
      if (v28)
      {
        sub_10000A6C0(v26[7] + 32 * v27, (uint64_t)&v38);
      }
      else
      {
        long long v38 = 0u;
        long long v39 = 0u;
      }
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      swift_bridgeObjectRetain();
    }
    sub_10000FF80((uint64_t)&v38, (uint64_t)&v36);
    if (v37)
    {
      sub_10000A71C(&v36, &v40);
    }
    else
    {
      unsigned __int8 v41 = (void *)sub_100008E28((uint64_t *)&unk_100063F40);
      *(void *)&long long v40 = &_swiftEmptyDictionarySingleton;
      sub_10000FECC((uint64_t)&v36);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = sub_100008E28((uint64_t *)&unk_100063F40);
    swift_dynamicCast();
    unsigned __int8 v41 = &type metadata for Bool;
    LOBYTE(v40) = a1 & 1;
    sub_10000A71C(&v40, &v38);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v35 = v36;
    *(void *)&long long v36 = 0x8000000000000000;
    sub_100041F40(&v38, a7, a8, isUniquelyReferenced_nonNull_native);
    *(void *)&long long v36 = v35;
    swift_bridgeObjectRelease();
    unsigned __int8 v41 = (void *)v32;
    *(void *)&long long v40 = v36;
    swift_bridgeObjectRetain();
    sub_10000E7EC(&v40, a2, a3);
    sub_10000A788((uint64_t)&v40);
    (*(void (**)(uint64_t, void))(a5 + 16))(a5, 0);
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v29 = (id)v40;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    uint64_t v30 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v30);

    swift_errorRelease();
    return swift_errorRelease();
  }
}

void sub_100010FB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)v50 - v7;
  if (qword_100063E88 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = sub_100008D9C(v9, (uint64_t)qword_1000679B8);
  Swift::String v52 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v53 = v3 + 16;
  v52(v8, a1, v2);
  unint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v51 = a1;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    v50[1] = v10;
    v56[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    v50[0] = v6;
    sub_1000117F0();
    uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)&long long v57 = sub_10004B330(v16, v17, v56);
    uint64_t v6 = (char *)v50[0];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    os_log_type_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v8, v2);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Received NSUbiquitousKeyValueStoreDidChangeExternallyNotification {notification: %s}", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v51;
    swift_slowDealloc();
  }
  else
  {
    os_log_type_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v8, v2);
  }

  uint64_t v19 = Notification.userInfo.getter();
  if (!v19)
  {
    long long v57 = 0u;
    long long v58 = 0u;
LABEL_17:
    sub_10000FECC((uint64_t)&v57);
    goto LABEL_18;
  }
  uint64_t v20 = v19;
  uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v55 = v21;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v20 + 16) && (unint64_t v22 = sub_100047484((uint64_t)v56), (v23 & 1) != 0))
  {
    sub_10000A6C0(*(void *)(v20 + 56) + 32 * v22, (uint64_t)&v57);
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10001179C((uint64_t)v56);
  if (!*((void *)&v58 + 1)) {
    goto LABEL_17;
  }
  sub_100008E28(&qword_100063EF8);
  if (swift_dynamicCast())
  {
    if (*(void *)(v56[0] + 16))
    {
      swift_bridgeObjectRetain();
      unsigned int v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v51 = a1;
        long long v26 = (uint8_t *)swift_slowAlloc();
        v56[0] = swift_slowAlloc();
        *(_DWORD *)long long v26 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v27 = Array.description.getter();
        unint64_t v29 = v28;
        swift_bridgeObjectRelease();
        *(void *)&long long v57 = sub_10004B330(v27, v29, v56);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification changed keys: %s", v26, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v35 = Notification.userInfo.getter();
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v55 = v37;
        AnyHashable.init<A>(_:)();
        if (*(void *)(v36 + 16) && (unint64_t v38 = sub_100047484((uint64_t)v56), (v39 & 1) != 0))
        {
          sub_10000A6C0(*(void *)(v36 + 56) + 32 * v38, (uint64_t)&v57);
        }
        else
        {
          long long v57 = 0u;
          long long v58 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_10001179C((uint64_t)v56);
        if (*((void *)&v58 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v40 = v56[0];
            uint64_t v30 = Logger.logObject.getter();
            os_log_type_t v41 = static os_log_type_t.debug.getter();
            if (!os_log_type_enabled(v30, v41)) {
              goto LABEL_22;
            }
            id v42 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)id v42 = 134217984;
            v56[0] = v40;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            id v43 = "handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification change reason is %ld";
            uint64_t v44 = v30;
            os_log_type_t v45 = v41;
            uint64_t v46 = v42;
            uint32_t v47 = 12;
            goto LABEL_38;
          }
LABEL_36:
          uint64_t v30 = Logger.logObject.getter();
          os_log_type_t v48 = static os_log_type_t.error.getter();
          if (!os_log_type_enabled(v30, v48)) {
            goto LABEL_22;
          }
          long long v49 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v49 = 0;
          id v43 = "NSUbiquitousKeyValueStoreDidChangeExternallyNotification missing reason.";
          uint64_t v44 = v30;
          os_log_type_t v45 = v48;
          uint64_t v46 = v49;
          uint32_t v47 = 2;
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, v46, v47);
          goto LABEL_20;
        }
      }
      else
      {
        long long v57 = 0u;
        long long v58 = 0u;
      }
      sub_10000FECC((uint64_t)&v57);
      goto LABEL_36;
    }
    swift_bridgeObjectRelease();
  }
LABEL_18:
  v52(v6, a1, v2);
  uint64_t v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v30, v31))
  {
    v18(v6, v2);
    goto LABEL_22;
  }
  uint64_t v32 = (uint8_t *)swift_slowAlloc();
  v56[0] = swift_slowAlloc();
  uint64_t v53 = v2;
  *(_DWORD *)uint64_t v32 = 136315138;
  *(void *)&long long v57 = Notification.userInfo.getter();
  sub_100008E28(&qword_100064150);
  uint64_t v33 = String.init<A>(describing:)();
  *(void *)&long long v57 = sub_10004B330(v33, v34, v56);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  v18(v6, v53);
  _os_log_impl((void *)&_mh_execute_header, v30, v31, "Could not find changed keys on notification or changed keys was empty: %s", v32, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
LABEL_20:
  swift_slowDealloc();
LABEL_22:
}

uint64_t sub_10001179C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000117F0()
{
  unint64_t result = qword_100064158;
  if (!qword_100064158)
  {
    type metadata accessor for Notification();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064158);
  }
  return result;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

uint64_t getEnumTagSinglePayload for Constants.Topic(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for Constants.Topic(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        void *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001194CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100011974()
{
  return 0;
}

ValueMetadata *type metadata accessor for Constants.Topic()
{
  return &type metadata for Constants.Topic;
}

uint64_t sub_100011990()
{
  return 1;
}

Swift::Int sub_100011998()
{
  return Hasher._finalize()();
}

uint64_t sub_1000119F0()
{
  return String.hash(into:)();
}

Swift::Int sub_100011A0C()
{
  return Hasher._finalize()();
}

uint64_t sub_100011A60@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DC00, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_100011AB4(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ELL;
  a1[1] = 0x8000000100051CD0;
}

unint64_t sub_100011AD8()
{
  unint64_t result = qword_100064160;
  if (!qword_100064160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064160);
  }
  return result;
}

void sub_100011B2C(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
  [(objc_class *)isa mutableCopy];

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10001210C();
  if (swift_dynamicCast())
  {
    id v9 = v51;
    id v10 = [objc_allocWithZone((Class)ACAccountStore) init];
    id v11 = [v10 aa_primaryAppleAccount];
    if (v11)
    {
      os_log_type_t v12 = v11;

      id v13 = [v12 aa_personID];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v48 = a1;
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v17 = v16;

        id v18 = [v12 aa_authToken];
        if (v18)
        {
          uint64_t v19 = v18;
          id v46 = v9;
          uint64_t v47 = v1;
          uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v21 = v5;
          char v23 = v22;

          id v49 = (id)v15;
          unint64_t v50 = v17;
          v24._uint64_t countAndFlagsBits = 58;
          v24._object = (void *)0xE100000000000000;
          String.append(_:)(v24);
          v25._uint64_t countAndFlagsBits = v20;
          v25._object = v23;
          String.append(_:)(v25);
          swift_bridgeObjectRelease();
          static String.Encoding.ascii.getter();
          uint64_t v26 = String.data(using:allowLossyConversion:)();
          unint64_t v28 = v27;
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v4);
          if (v28 >> 60 == 15)
          {

            uint64_t v2 = v47;
            a1 = v48;
            p_type = (char **)(&stru_100061FF0 + 16);
            id v9 = v46;
          }
          else
          {
            sub_10000A848(v26, v28);
            Swift::String v31 = Data.base64EncodedString(options:)(0);
            sub_100009000(v26, v28);
            id v49 = 0;
            unint64_t v50 = 0xE000000000000000;
            _StringGuts.grow(_:)(23);
            swift_bridgeObjectRelease();
            id v49 = (id)0xD000000000000015;
            unint64_t v50 = 0x8000000100052C00;
            String.append(_:)(v31);
            swift_bridgeObjectRelease();
            sub_100009000(v26, v28);

            NSString v32 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            NSString v33 = String._bridgeToObjectiveC()();
            p_type = &stru_100061FF0.type;
            id v9 = v46;
            [v46 setValue:v32 forHTTPHeaderField:v33];

            uint64_t v2 = v47;
            a1 = v48;
          }
        }
        else
        {

          swift_bridgeObjectRelease();
          a1 = v48;
          p_type = (char **)(&stru_100061FF0 + 16);
        }
      }
      else
      {

        p_type = (char **)(&stru_100061FF0 + 16);
      }
      NSString v34 = String._bridgeToObjectiveC()();
      NSString v35 = String._bridgeToObjectiveC()();
      [v9 p_type[290]:v34:v35];

      [v9 ak_addDeviceUDIDHeader];
      [v9 ak_addClientInfoHeader];
      id v36 = sub_100012180();
      if (v2)
      {
      }
      else
      {
        uint64_t v37 = v36;
        id v38 = [v36 machineID];
        NSString v39 = String._bridgeToObjectiveC()();
        [v9 p_type[290]:v38:v39];

        id v40 = [v37 oneTimePassword];
        NSString v41 = String._bridgeToObjectiveC()();
        [v9 p_type[290]:v40:v41];

        id v49 = [v37 routingInfo];
        dispatch thunk of CustomStringConvertible.description.getter();
        NSString v42 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        NSString v43 = String._bridgeToObjectiveC()();
        [v9 p_type[290]:v42:v43];

        static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v44 = type metadata accessor for URLRequest();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(a1, 0, 1, v44);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v30 = type metadata accessor for URLRequest();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a1, 1, 1, v30);
  }
}

unint64_t sub_10001210C()
{
  unint64_t result = qword_100064168;
  if (!qword_100064168)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100064168);
  }
  return result;
}

id sub_10001214C()
{
  id result = [objc_allocWithZone((Class)AKAnisetteProvisioningController) init];
  qword_100067998 = (uint64_t)result;
  return result;
}

id sub_100012180()
{
  if (qword_100063E78 != -1) {
    swift_once();
  }
  id v4 = 0;
  id v0 = [(id)qword_100067998 anisetteDataWithError:&v4];
  if (v0)
  {
    id v1 = v4;
  }
  else
  {
    id v2 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v0;
}

uint64_t sub_10001226C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1414745936;
  }
  else {
    uint64_t v3 = 5522759;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1414745936;
  }
  else {
    uint64_t v5 = 5522759;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void *sub_100012398(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  BOOL v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    id v9 = _swiftEmptyArrayStorage;
    sub_10002E9AC(0, v1, 0);
    BOOL v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10002E9AC(0, v2[2] + 1, 1);
        BOOL v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10002E9AC(v5 > 1, v6 + 1, 1);
        BOOL v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_10000A71C(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

void *sub_1000124C0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  BOOL v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    id v9 = _swiftEmptyArrayStorage;
    sub_10002E9AC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    BOOL v2 = _swiftEmptyArrayStorage;
    do
    {
      swift_bridgeObjectRetain();
      sub_100008E28((uint64_t *)&unk_100063F40);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10002E9AC(0, v2[2] + 1, 1);
        BOOL v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10002E9AC(v5 > 1, v6 + 1, 1);
        BOOL v2 = v9;
      }
      v2[2] = v6 + 1;
      sub_10000A71C(&v8, &v2[4 * v6 + 4]);
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_10001265C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    v5.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    if (a2)
    {
LABEL_3:
      uint64_t v6 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    v5.super.Class isa = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

void sub_1000126F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, void *a8, uint64_t a9)
{
  uint64_t v11 = a6;
  if (!a2 && a1)
  {
    id v17 = a1;
    if (sub_100008578(v17))
    {
      swift_beginAccess();
      id v18 = v17;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((*(void *)(a3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_endAccess();
LABEL_23:

      return;
    }

    uint64_t v11 = a6;
  }
  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  sub_100008D9C(v19, (uint64_t)qword_1000679A0);
  swift_bridgeObjectRetain();
  sub_10000A848(v11, a7);
  id v20 = a8;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  sub_10000A848(v11, a7);
  id v21 = v20;
  swift_errorRetain();
  unint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.error.getter();
  uint64_t v51 = a4;
  if (os_log_type_enabled(v22, v23))
  {
    os_log_type_t v48 = v23;
    log = v22;
    uint64_t v24 = swift_slowAlloc();
    Swift::String v25 = (void *)swift_slowAlloc();
    v53[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315650;
    swift_bridgeObjectRetain();
    sub_10004B330(a4, a5, (uint64_t *)v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    sub_100008F8C(v11, a7);
    swift_bridgeObjectRelease();
    os_log_t v50 = (os_log_t)a7;
    sub_100008F8C(v11, a7);
    *(_WORD *)(v24 + 12) = 2112;
    id v26 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *Swift::String v25 = v21;

    *(_WORD *)(v24 + 22) = 2112;
    if (a2)
    {
      swift_errorRetain();
      uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v27 = 0;
    }
    v25[1] = v27;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v48, "Default certificate %s for %@ was not found or invalid. Error: %@", (uint8_t *)v24, 0x20u);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a7 = (unint64_t)v50;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100008F8C(v11, a7);
    swift_bridgeObjectRelease();
    sub_100008F8C(v11, a7);

    swift_errorRelease();
    swift_errorRelease();
  }
  unint64_t v28 = *(void **)(a9 + OBJC_IVAR___CertificateManager_cloudKVSManager);
  swift_unknownObjectRetain();
  NSString v29 = String._bridgeToObjectiveC()();
  v53[0] = 0;
  unsigned int v30 = [v28 removeCertificateSettingsWithEmailAddress:v21 certTypeKey:v29 error:v53];
  swift_unknownObjectRelease();

  id v31 = v53[0];
  if (!v30)
  {
    id v41 = v53[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRetain();
    sub_10000A848(v11, a7);
    id v42 = v21;
    swift_errorRetain();
    swift_bridgeObjectRetain();
    sub_10000A848(v11, a7);
    id v43 = v42;
    swift_errorRetain();
    id v18 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      id v46 = (void *)swift_slowAlloc();
      v53[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315650;
      swift_bridgeObjectRetain();
      sub_10004B330(v51, a5, (uint64_t *)v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      sub_100008F8C(v11, a7);
      swift_bridgeObjectRelease();
      sub_100008F8C(v11, a7);
      *(_WORD *)(v45 + 12) = 2112;
      id v47 = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v46 = v43;

      *(_WORD *)(v45 + 22) = 2112;
      swift_errorRetain();
      uint64_t v52 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v46[1] = v52;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v44, "Default certificate %s for %@ failed to remove. Error: %@", (uint8_t *)v45, 0x20u);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_bridgeObjectRelease();
    sub_100008F8C(v11, a7);
    swift_bridgeObjectRelease();
    sub_100008F8C(v11, a7);

    swift_errorRelease();
    swift_errorRelease();
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  sub_10000A848(v11, a7);
  id v32 = v21;
  swift_bridgeObjectRetain();
  sub_10000A848(v11, a7);
  id v33 = v32;
  id v34 = v31;
  NSString v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = v11;
    uint64_t v38 = swift_slowAlloc();
    NSString v39 = (void *)swift_slowAlloc();
    v53[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 136315394;
    swift_bridgeObjectRetain();
    sub_10004B330(v51, a5, (uint64_t *)v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    sub_100008F8C(v37, a7);
    swift_bridgeObjectRelease();
    sub_100008F8C(v37, a7);
    *(_WORD *)(v38 + 12) = 2112;
    id v40 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *NSString v39 = v33;

    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Default certificate %s for %@ was removed", (uint8_t *)v38, 0x16u);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100008F8C(v11, a7);
    swift_bridgeObjectRelease();
    sub_100008F8C(v11, a7);
  }
}

void sub_100013054(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  long long v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

uint64_t sub_1000130E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  NSArray v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_100009000((uint64_t)v4, v8);

  return swift_release();
}

void sub_100013194(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6)
{
  if (a3 || a2 >> 60 == 15)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100008D9C(v15, (uint64_t)qword_1000679A0);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      id v18 = (void *)swift_slowAlloc();
      *(_DWORD *)id v17 = 138412290;
      if (a3)
      {
        swift_errorRetain();
        uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v19 = 0;
      }
      *id v18 = v19;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v16, a6, v17, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
    swift_beginAccess();
    sub_10000A848(a1, a2);
    sub_10000A848(a1, a2);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *(void *)(a4 + 16);
    *(void *)(a4 + 16) = 0x8000000000000000;
    sub_100042094(a1, a2, v11, v13, isUniquelyReferenced_nonNull_native);
    *(void *)(a4 + 16) = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_100009000(a1, a2);
  }
}

uint64_t sub_10001356C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100008D9C(v7, (uint64_t)qword_1000679A0);
  swift_bridgeObjectRetain_n();
  unint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    id v47 = (id)swift_slowAlloc();
    *(_DWORD *)id v10 = 136315138;
    swift_bridgeObjectRetain();
    sub_10004B330(a3, (unint64_t)a4, (uint64_t *)&v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "RefreshCertificate getDefaultIdentity for cert type : %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = *(void **)(v5 + OBJC_IVAR___CertificateManager_cloudKVSManager);
  swift_unknownObjectRetain();
  NSString v12 = String._bridgeToObjectiveC()();
  id v47 = 0;
  id v13 = [v11 fetchCertificatesSettingsWithEmailAddress:v12 error:&v47];
  swift_unknownObjectRelease();

  id v14 = v47;
  if (!v13)
  {
    id v19 = v47;
    _convertNSErrorToError(_:)();

    swift_willThrow();
LABEL_24:
    swift_errorRetain();
    swift_errorRetain();
    id v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      id v42 = (uint8_t *)swift_slowAlloc();
      id v43 = (void *)swift_slowAlloc();
      *(_DWORD *)id v42 = 138412290;
      swift_errorRetain();
      os_log_type_t v44 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v47 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v43 = v44;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "RefreshCertificate error in getDefaultIdentity catch block : %@", v42, 0xCu);
      sub_100008E28(&qword_1000651F0);
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
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = v14;

  swift_bridgeObjectRetain();
  v17._uint64_t countAndFlagsBits = a3;
  v17._object = a4;
  Swift::Int v18 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DC38, v17);
  swift_bridgeObjectRelease();
  if (v18 == 1)
  {
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    if (v18) {
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a4 = (void *)v22;
  if (*(void *)(v15 + 16))
  {
    unint64_t v23 = sub_10004740C(v21, v22);
    if (v24) {
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_15:
  swift_bridgeObjectRetain();
  v25._uint64_t countAndFlagsBits = a3;
  v25._object = a4;
  Swift::Int v26 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DC38, v25);
  swift_bridgeObjectRelease();
  if (!v26)
  {
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_19;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v26 != 1) {
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v15 + 16))
  {
    unint64_t v23 = sub_10004740C(v28, v29);
    if (v30)
    {
LABEL_21:
      id v31 = (uint64_t *)(*(void *)(v15 + 56) + 16 * v23);
      uint64_t v32 = *v31;
      unint64_t v33 = v31[1];
      sub_10000A848(*v31, v33);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v34 = *(void **)(v5 + OBJC_IVAR___CertificateManager_keychainManager);
      swift_unknownObjectRetain();
      sub_100014948(v32, v33);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      id v47 = 0;
      id v36 = [v34 getIdentityByRef:isa error:&v47];
      swift_unknownObjectRelease();

      id v37 = v47;
      if (v36)
      {
        id v38 = v36;
        sub_100009000(v32, v33);
        sub_100009000(v32, v33);

        return (uint64_t)v36;
      }
      NSString v39 = v37;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      sub_100009000(v32, v33);
      sub_100009000(v32, v33);
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void sub_100013BD8(uint64_t a1, void (*a2)(void *, uint64_t), uint64_t a3, void *a4, void *a5)
{
  if (a1)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100008D9C(v8, (uint64_t)qword_1000679A0);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      NSString v12 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 138412290;
      swift_errorRetain();
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *NSString v12 = v17;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "RefreshCertificate error in generatePayloadAndRevoke: %@", v11, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    a2(0, a1);
  }
  else
  {
    swift_retain();
    id v15 = a5;
    id v16 = a4;
    sub_100016784(v15, v16, a2, a3, v15, v16);
    swift_release();
  }
}

void sub_100013E28(uint64_t a1, void (*a2)(void *, uint64_t), int a3, id a4)
{
  if (a1)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100008D9C(v5, (uint64_t)qword_1000679A0);
    swift_errorRetain();
    swift_errorRetain();
    id v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      swift_errorRetain();
      SecCertificateRef certificateRef = (SecCertificateRef)_swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v9 = certificateRef;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "RefreshCertificate error in generateCertificate: %@", v8, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_100008DD4();
    uint64_t v28 = swift_allocError();
    *(void *)uint64_t v29 = 6;
    *(_OWORD *)(v29 + 8) = 0u;
    *(_OWORD *)(v29 + 24) = 0u;
    *(unsigned char *)(v29 + 40) = 5;
    a2(0, v28);
    swift_errorRelease();
    return;
  }
  id v11 = [a4 commonName];
  if (v11)
  {
    NSString v12 = v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;

    id v16 = [a4 certType];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      char v20 = v19;

      uint64_t v21 = (void *)sub_10001356C(v13, v15, v18, v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v21)
      {
        SecCertificateRef certificateRef = 0;
        if (SecIdentityCopyCertificate((SecIdentityRef)v21, &certificateRef))
        {
          if (qword_100063E80 != -1) {
            swift_once();
          }
          uint64_t v22 = type metadata accessor for Logger();
          sub_100008D9C(v22, (uint64_t)qword_1000679A0);
          unint64_t v23 = Logger.logObject.getter();
          os_log_type_t v24 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v23, v24))
          {
            Swift::String v25 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)Swift::String v25 = 67109120;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl((void *)&_mh_execute_header, v23, v24, "RefreshCertificate error: Failed to copy cert from identity: %d", v25, 8u);
            swift_slowDealloc();
          }

          sub_100008DD4();
          uint64_t v26 = swift_allocError();
          *(void *)uint64_t v27 = 9;
          *(_OWORD *)(v27 + 8) = 0u;
          *(_OWORD *)(v27 + 24) = 0u;
          *(unsigned char *)(v27 + 40) = 5;
          a2(0, v26);

          swift_errorRelease();
        }
        else
        {
          SecCertificateRef v41 = certificateRef;
          sub_100008E28(&qword_100064210);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_10004DF40;
          if (!v41)
          {
            __break(1u);
            return;
          }
          uint64_t v43 = inited;
          os_log_type_t v44 = (uint64_t *)(inited + 32);
          uint64_t v45 = v41;
          uint64_t v46 = sub_1000092D8();

          *os_log_type_t v44 = v46;
          if (qword_100063E80 != -1) {
            swift_once();
          }
          uint64_t v47 = type metadata accessor for Logger();
          sub_100008D9C(v47, (uint64_t)qword_1000679A0);
          os_log_type_t v48 = Logger.logObject.getter();
          os_log_type_t v49 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v48, v49))
          {
            os_log_t v50 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)os_log_t v50 = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, v49, "RefreshCertificate: Successful results", v50, 2u);
            swift_slowDealloc();
          }

          uint64_t v51 = sub_1000124C0(v43);
          swift_setDeallocating();
          sub_100008E28((uint64_t *)&unk_100063F40);
          swift_arrayDestroy();
          a2(v51, 0);
          swift_bridgeObjectRelease();
        }
        return;
      }
      if (qword_100063E80 != -1) {
        swift_once();
      }
      uint64_t v37 = type metadata accessor for Logger();
      sub_100008D9C(v37, (uint64_t)qword_1000679A0);
      id v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v38, v39))
      {
        id v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "RefreshCertificate error: Failed to copy identity in getCertProperties", v40, 2u);
        swift_slowDealloc();
      }

      sub_100008DD4();
      uint64_t v35 = swift_allocError();
      uint64_t v36 = 14;
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v30 = type metadata accessor for Logger();
  sub_100008D9C(v30, (uint64_t)qword_1000679A0);
  id v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v31, v32))
  {
    unint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "RefreshCertificate error: Missing email id or certType from context", v33, 2u);
    swift_slowDealloc();
  }

  sub_100008DD4();
  uint64_t v35 = swift_allocError();
  uint64_t v36 = 15;
LABEL_23:
  *(void *)uint64_t v34 = v36;
  *(_OWORD *)(v34 + 8) = 0u;
  *(_OWORD *)(v34 + 24) = 0u;
  *(unsigned char *)(v34 + 40) = 5;
  a2(0, v35);

  swift_errorRelease();
}

void sub_1000145E8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100014724()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CertificateManager();
  return [super dealloc];
}

uint64_t sub_1000147FC()
{
  return type metadata accessor for CertificateManager();
}

uint64_t type metadata accessor for CertificateManager()
{
  uint64_t result = qword_1000641C8;
  if (!qword_1000641C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100014850()
{
  sub_1000148F0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000148F0()
{
  if (!qword_1000641D8)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000641D8);
    }
  }
}

uint64_t sub_100014948(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000A848(a1, a2);
  }
  return a1;
}

id sub_10001495C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v7 = v3;
  URL.init(string:)();
  URL.init(string:)();
  URL.init(string:)();
  *(void *)&v7[OBJC_IVAR___CertificateManager_keychainManager] = a1;
  *(void *)&v7[OBJC_IVAR___CertificateManager_certificateRequestManager] = a2;
  *(void *)&v7[OBJC_IVAR___CertificateManager_cloudKVSManager] = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for CertificateManager();
  return [super init];
}

void sub_100014A7C(id a1, char *a2, void (**a3)(void, void))
{
  v231 = a3;
  uint64_t v5 = type metadata accessor for Logger();
  id v229 = *(id *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v228 = (unint64_t)&v223 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008E28(&qword_1000641E0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  os_log_type_t v10 = (char *)&v223 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v227 = (uint64_t)&v223 - v11;
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v226 = (char *)&v223 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v233 = (char *)&v223 - v16;
  id v17 = [a1 keyType];
  if (v17)
  {
    uint64_t v18 = v17;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    Swift::String v19 = String.lowercased()();
    if (v19._countAndFlagsBits == 25445 && v19._object == (void *)0xE200000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_7:
      uint64_t v21 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
      goto LABEL_9;
    }
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_7;
    }
  }
  uint64_t v21 = (id *)&kSecAttrKeyTypeRSA;
LABEL_9:
  v225 = v10;
  uint64_t v234 = v13;
  id v22 = *v21;
  swift_bridgeObjectRelease();
  type metadata accessor for CFString(0);
  sub_10001A2C8(&qword_100063F18, type metadata accessor for CFString);
  if (static _CFObject.== infix(_:_:)()) {
    uint64_t v23 = 2048;
  }
  else {
    uint64_t v23 = 256;
  }
  SecKeyRef v24 = sub_100043458(v22, v23);
  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v235 = v5;
  uint64_t v25 = sub_100008D9C(v5, (uint64_t)qword_1000679A0);
  id v26 = v22;
  uint64_t v239 = v25;
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v232 = v12;
  v237 = a2;
  id v236 = v26;
  id v238 = a1;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    id v31 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 138412546;
    SecKeyRef v230 = (SecKeyRef)v23;
    uint64_t v245 = (uint64_t)v26;
    id v32 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v31 = v26;

    *(_WORD *)(v30 + 12) = 2048;
    uint64_t v245 = (uint64_t)v230;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Generated %@ key of size/curve: %ld", (uint8_t *)v30, 0x16u);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    a1 = v238;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v33 = v235;
  if (!v24)
  {
    sub_100008DD4();
    swift_allocError();
    *(_OWORD *)uint64_t v105 = xmmword_10004E290;
    *(void *)(v105 + 24) = 0;
    *(void *)(v105 + 32) = 0;
    *(void *)(v105 + 16) = 0;
    *(unsigned char *)(v105 + 40) = 0;
    v106 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))v231)[2](v231, v106);

    swift_errorRelease();
    return;
  }
  uint64_t v34 = _swiftEmptyArrayStorage;
  v242 = _swiftEmptyArrayStorage;
  SecKeyRef v230 = v24;
  id v35 = [a1 commonName];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v39 = v38;

    uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v42 = v41;
    sub_100008E28(&qword_100064200);
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_10004E280;
    *(void *)(v44 + 32) = v40;
    *(void *)(v44 + 40) = v42;
    *(void *)(v44 + 48) = v37;
    *(void *)(v44 + 56) = v39;
    *(void *)(v43 + 32) = v44;
    uint64_t v34 = sub_100047100(0, 1, 1, _swiftEmptyArrayStorage);
    unint64_t v46 = v34[2];
    unint64_t v45 = v34[3];
    if (v46 >= v45 >> 1) {
      uint64_t v34 = sub_100047100((void *)(v45 > 1), v46 + 1, 1, v34);
    }
    v34[2] = v46 + 1;
    v34[v46 + 4] = v43;
    v242 = v34;
  }
  id v47 = [a1 country];
  if (v47)
  {
    os_log_type_t v48 = v47;
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v51 = v50;

    uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v54 = v53;
    sub_100008E28(&qword_100064200);
    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_10004E280;
    *(void *)(v56 + 32) = v52;
    *(void *)(v56 + 40) = v54;
    *(void *)(v56 + 48) = v49;
    *(void *)(v56 + 56) = v51;
    *(void *)(v55 + 32) = v56;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v34 = sub_100047100(0, v34[2] + 1, 1, v34);
    }
    unint64_t v58 = v34[2];
    unint64_t v57 = v34[3];
    if (v58 >= v57 >> 1) {
      uint64_t v34 = sub_100047100((void *)(v57 > 1), v58 + 1, 1, v34);
    }
    v34[2] = v58 + 1;
    v34[v58 + 4] = v55;
    v242 = v34;
  }
  id v59 = [a1 state];
  if (v59)
  {
    Swift::String v60 = v59;
    uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v63 = v62;

    uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v66 = v65;
    sub_100008E28(&qword_100064200);
    uint64_t v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_10004E280;
    *(void *)(v68 + 32) = v64;
    *(void *)(v68 + 40) = v66;
    *(void *)(v68 + 48) = v61;
    *(void *)(v68 + 56) = v63;
    *(void *)(v67 + 32) = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v34 = sub_100047100(0, v34[2] + 1, 1, v34);
    }
    unint64_t v70 = v34[2];
    unint64_t v69 = v34[3];
    if (v70 >= v69 >> 1) {
      uint64_t v34 = sub_100047100((void *)(v69 > 1), v70 + 1, 1, v34);
    }
    v34[2] = v70 + 1;
    v34[v70 + 4] = v67;
    v242 = v34;
  }
  id v71 = [a1 organization];
  if (v71)
  {
    v72 = v71;
    uint64_t v73 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v75 = v74;

    uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v78 = v77;
    sub_100008E28(&qword_100064200);
    uint64_t v79 = swift_allocObject();
    *(_OWORD *)(v79 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v80 = swift_allocObject();
    *(_OWORD *)(v80 + 16) = xmmword_10004E280;
    *(void *)(v80 + 32) = v76;
    *(void *)(v80 + 40) = v78;
    *(void *)(v80 + 48) = v73;
    *(void *)(v80 + 56) = v75;
    *(void *)(v79 + 32) = v80;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v34 = sub_100047100(0, v34[2] + 1, 1, v34);
    }
    unint64_t v82 = v34[2];
    unint64_t v81 = v34[3];
    if (v82 >= v81 >> 1) {
      uint64_t v34 = sub_100047100((void *)(v81 > 1), v82 + 1, 1, v34);
    }
    v34[2] = v82 + 1;
    v34[v82 + 4] = v79;
    v242 = v34;
  }
  id v83 = [a1 organizationUnit];
  if (v83)
  {
    v84 = v83;
    uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v87 = v86;

    uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v90 = v89;
    sub_100008E28(&qword_100064200);
    uint64_t v91 = swift_allocObject();
    *(_OWORD *)(v91 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v92 = swift_allocObject();
    *(_OWORD *)(v92 + 16) = xmmword_10004E280;
    *(void *)(v92 + 32) = v88;
    *(void *)(v92 + 40) = v90;
    *(void *)(v92 + 48) = v85;
    *(void *)(v92 + 56) = v87;
    *(void *)(v91 + 32) = v92;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v34 = sub_100047100(0, v34[2] + 1, 1, v34);
    }
    unint64_t v94 = v34[2];
    unint64_t v93 = v34[3];
    if (v94 >= v93 >> 1) {
      uint64_t v34 = sub_100047100((void *)(v93 > 1), v94 + 1, 1, v34);
    }
    v34[2] = v94 + 1;
    v34[v94 + 4] = v91;
    v242 = v34;
  }
  char v241 = 0;
  id v95 = [a1 certType];
  v96 = v237;
  v97 = (void (**)(unint64_t, void, void))v229;
  if (v95)
  {
    v98 = v95;
    uint64_t v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v101 = v100;

    v102._uint64_t countAndFlagsBits = v99;
    v102._object = v101;
    Swift::Int v103 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DC38, v102);
    swift_bridgeObjectRelease();
    if (!v103)
    {
      char v104 = 0;
      goto LABEL_56;
    }
    if (v103 == 1)
    {
      char v104 = 1;
LABEL_56:
      char v241 = v104;
      goto LABEL_57;
    }
  }
  unint64_t v107 = v228;
  v97[2](v228, v239, v33);
  v108 = v97;
  uint64_t v109 = (uint64_t)a1;
  v110 = Logger.logObject.getter();
  os_log_type_t v111 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v110, v111))
  {
    v112 = v96;
    v113 = (uint8_t *)swift_slowAlloc();
    uint64_t v245 = swift_slowAlloc();
    *(_DWORD *)v113 = 136315138;
    id v114 = [(id)v109 certType];
    if (!v114)
    {
LABEL_117:
      _Block_release(v231);

      __break(1u);
      return;
    }
    v115 = v114;
    uint64_t v116 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v118 = v117;

    uint64_t v243 = sub_10004B330(v116, v118, &v245);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v110, v111, "Certificate type is set to default .signing. Couldn't parse from: '%s'", v113, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*((void (**)(unint64_t, uint64_t))v229 + 1))(v228, v235);
    v96 = v112;
  }
  else
  {

    ((void (*)(unint64_t, uint64_t))v108[1])(v107, v33);
  }
LABEL_57:
  uint64_t v235 = OBJC_IVAR___CertificateManager_certificateRequestManager;
  v119 = *(void **)&v96[OBJC_IVAR___CertificateManager_certificateRequestManager];
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  sub_100008E28(&qword_1000641E8);
  v120.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v121 = [v238 csrAltName];
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v122.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (v241) {
    uint64_t v109 = 0x74707972636E65;
  }
  else {
    uint64_t v109 = 0x676E696E676973;
  }
  if (v241) {
    char v123 = 1;
  }
  else {
    char v123 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  id v124 = [v119 generateCertificateRequestStringWith:v120.super.isa subjectAltName:v122.super.isa privateKey:v230 encrypt:v123 & 1];

  swift_unknownObjectRelease();
  id v125 = v238;
  if (v124)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v127 = v126;
  }
  else
  {
    unint64_t v127 = 0;
  }
  id v229 = v124;
  id v128 = v125;
  v129 = Logger.logObject.getter();
  os_log_type_t v130 = static os_log_type_t.debug.getter();
  BOOL v131 = os_log_type_enabled(v129, v130);
  id v238 = v128;
  if (v131)
  {
    uint64_t v132 = swift_slowAlloc();
    uint64_t v224 = swift_slowAlloc();
    uint64_t v245 = v224;
    *(_DWORD *)uint64_t v132 = 136315650;
    uint64_t v243 = sub_10004B330(v109, 0xE700000000000000, &v245);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    unint64_t v228 = v127;
    *(_WORD *)(v132 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v133 = Array.description.getter();
    unint64_t v135 = v134;
    swift_bridgeObjectRelease();
    id v244 = (id)sub_10004B330(v133, v135, &v245);
    uint64_t v109 = (uint64_t)&v245;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v132 + 22) = 2080;
    id v136 = [v128 csrAltName];
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v137 = Dictionary.description.getter();
    unint64_t v139 = v138;
    swift_bridgeObjectRelease();
    id v244 = (id)sub_10004B330(v137, v139, &v245);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    unint64_t v127 = v228;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v129, v130, "Generated %s CSR with subject: %s, subject alt name: %s", (uint8_t *)v132, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v140 = v236;
  uint64_t v141 = v232;
  uint64_t v142 = v234;
  v143 = v237;
  if (!v127)
  {

    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v147 = 2;
    *(_OWORD *)(v147 + 8) = 0u;
    *(_OWORD *)(v147 + 24) = 0u;
    *(unsigned char *)(v147 + 40) = 5;
    v148 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))v231)[2](v231, v148);
    SecKeyRef v149 = v230;

LABEL_106:
    swift_errorRelease();
    goto LABEL_107;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v144 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v142 + 48);
  if (v241)
  {
    uint64_t v145 = (uint64_t)v225;
    sub_10001A1F4((uint64_t)&v143[OBJC_IVAR___CertificateManager_encryptEndpoint], (uint64_t)v225);
    if ((*v144)(v145, 1, v141) != 1)
    {
      uint64_t v146 = v145;
      goto LABEL_76;
    }
    _Block_release(v231);

    __break(1u);
    goto LABEL_116;
  }
  uint64_t v150 = v227;
  sub_10001A1F4((uint64_t)&v143[OBJC_IVAR___CertificateManager_signingEndpoint], v227);
  if ((*v144)(v150, 1, v141) == 1)
  {
LABEL_116:
    _Block_release(v231);

    __break(1u);
    goto LABEL_117;
  }
  uint64_t v146 = v227;
LABEL_76:
  v151 = v233;
  (*(void (**)(char *, uint64_t, uint64_t))(v142 + 32))(v233, v146, v141);
  uint64_t v227 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v228 = v152;
  v153 = v226;
  (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v226, v151, v141);
  v154 = Logger.logObject.getter();
  os_log_type_t v155 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v154, v155))
  {
    v156 = (uint8_t *)swift_slowAlloc();
    id v244 = (id)swift_slowAlloc();
    *(_DWORD *)v156 = 136315138;
    sub_10001A2C8(&qword_1000641F8, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v157 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v240 = sub_10004B330(v157, v158, (uint64_t *)&v244);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v159 = *(char **)(v234 + 8);
    ((void (*)(char *, uint64_t))v159)(v153, v141);
    _os_log_impl((void *)&_mh_execute_header, v154, v155, "Requesting certificate from: %s", v156, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v159 = *(char **)(v142 + 8);
    ((void (*)(char *, uint64_t))v159)(v153, v141);
  }

  id v160 = [v238 commonName];
  if (v160)
  {
    v161 = v160;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v162 = *(void **)&v143[v235];
  swift_unknownObjectRetain();
  v163 = v233;
  URL._bridgeToObjectiveC()(&v246);
  v165 = v164;
  NSString v166 = String._bridgeToObjectiveC()();
  id v244 = 0;
  id v167 = v229;
  id v168 = [v162 resultFromServerFor:v229 endpoint:v165 email:v166 error:&v244];
  swift_unknownObjectRelease();

  id v169 = v244;
  if (!v168)
  {
LABEL_94:
    id v203 = v169;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v204 = v163;
    goto LABEL_101;
  }
  uint64_t v170 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v171 = v169;

  if (!*(void *)(v170 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v205 = 9;
    *(_OWORD *)(v205 + 8) = 0u;
    *(_OWORD *)(v205 + 24) = 0u;
    *(unsigned char *)(v205 + 40) = 5;
LABEL_97:
    swift_willThrow();
LABEL_100:
    v204 = v233;
LABEL_101:
    ((void (*)(char *, uint64_t))v159)(v204, v232);
LABEL_102:
    swift_errorRetain();
    swift_errorRetain();
    v209 = Logger.logObject.getter();
    os_log_type_t v210 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v209, v210))
    {
      v211 = (uint8_t *)swift_slowAlloc();
      v212 = (void *)swift_slowAlloc();
      *(_DWORD *)v211 = 138412290;
      swift_errorRetain();
      v213 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v244 = v213;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v212 = v213;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v209, v210, "Certificate request failed with error %@", v211, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    id v214 = v236;

    swift_errorRetain();
    v215 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))v231)[2](v231, v215);
    SecKeyRef v216 = v230;

    swift_errorRelease();
    goto LABEL_106;
  }
  v172 = v237;
  v173 = *(void **)&v237[v235];
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  NSString v174 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v244 = 0;
  id v175 = [v173 certificateFor:v174 error:&v244];
  swift_unknownObjectRelease();

  id v176 = v244;
  if (!v175)
  {
    id v206 = v244;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    goto LABEL_97;
  }
  uint64_t v177 = OBJC_IVAR___CertificateManager_keychainManager;
  v178 = *(void **)&v172[OBJC_IVAR___CertificateManager_keychainManager];
  id v244 = 0;
  id v179 = v176;
  id v180 = [v178 saveIdentityToKeychain:v175 privateKey:v230 error:&v244];
  id v181 = v244;
  if (!v180)
  {
    v207 = v181;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    goto LABEL_100;
  }
  id v238 = v175;
  uint64_t v182 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v184 = v183;

  v185 = *(void **)&v172[OBJC_IVAR___CertificateManager_cloudKVSManager];
  swift_unknownObjectRetain();
  uint64_t v186 = v182;
  NSString v187 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  sub_100008E28(&qword_1000641F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004DF40;
  unint64_t v189 = v228;
  *(void *)(inited + 32) = v227;
  *(void *)(inited + 40) = v189;
  *(void *)(inited + 48) = v186;
  *(void *)(inited + 56) = v184;
  sub_10000A848(v186, v184);
  sub_10003F10C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v244 = 0;
  unsigned __int8 v191 = [v185 updateCertificateSettingsWithEmailAddress:v187 identityPersistentRefs:isa error:&v244];
  swift_unknownObjectRelease();

  if ((v191 & 1) == 0)
  {
    id v208 = v244;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    sub_100008F8C(v186, v184);
    goto LABEL_100;
  }
  uint64_t v227 = v186;
  unint64_t v228 = v184;
  id v229 = v159;
  unint64_t v192 = *(void *)(v170 + 16);
  if (v192 < 2) {
    __break(1u);
  }
  id v193 = v244;
  v163 = (char *)(v170 + 56);
  unint64_t v194 = 2;
  v159 = v237;
  while (1)
  {
    v195 = *(void **)&v159[v235];
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    NSString v196 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v244 = 0;
    id v197 = [v195 certificateFor:v196 error:&v244];
    swift_unknownObjectRelease();

    id v198 = v244;
    if (!v197)
    {
      id v217 = v244;
      swift_bridgeObjectRelease();
      _convertNSErrorToError(_:)();

      swift_willThrow();
LABEL_110:
      sub_100008F8C(v227, v228);
      ((void (*)(char *, uint64_t))v229)(v233, v232);
      goto LABEL_102;
    }
    id v169 = *(id *)&v159[v177];
    id v244 = 0;
    id v199 = v198;
    unsigned __int8 v200 = [v169 saveCertificateToKeychain:v197 error:&v244];
    id v201 = v244;
    if ((v200 & 1) == 0)
    {
      v218 = v201;
      swift_bridgeObjectRelease();
      _convertNSErrorToError(_:)();

      swift_willThrow();
      goto LABEL_110;
    }

    if (v192 == v194) {
      break;
    }
    v163 += 16;
    if (v194++ >= *(void *)(v170 + 16))
    {
      __break(1u);
      goto LABEL_94;
    }
  }
  swift_bridgeObjectRelease();
  v219 = Logger.logObject.getter();
  os_log_type_t v220 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v219, v220))
  {
    v221 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v221 = 0;
    _os_log_impl((void *)&_mh_execute_header, v219, v220, "Saved to iCloud keychain", v221, 2u);
    swift_slowDealloc();
  }

  v231[2](v231, 0);
  SecKeyRef v222 = v230;

  sub_100008F8C(v227, v228);
  ((void (*)(char *, uint64_t))v229)(v233, v232);
LABEL_107:
  swift_bridgeObjectRelease();
}

void sub_100016784(void *a1, char *a2, void (*a3)(void *, uint64_t), uint64_t a4, void *a5, void *a6)
{
  id v236 = a6;
  id v237 = a5;
  uint64_t v238 = a4;
  uint64_t v235 = a3;
  v242 = a2;
  uint64_t v7 = type metadata accessor for Logger();
  id v231 = *(id *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v226 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008E28(&qword_1000641E0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v227 = (uint64_t)&v226 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v228 = (uint64_t)&v226 - v13;
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v229 = (uint64_t)&v226 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  Swift::String v19 = (char *)&v226 - v18;
  id v20 = [a1 keyType];
  if (v20)
  {
    uint64_t v21 = v20;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    Swift::String v22 = String.lowercased()();
    if (v22._countAndFlagsBits == 25445 && v22._object == (void *)0xE200000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_7:
      SecKeyRef v24 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
      goto LABEL_9;
    }
    char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_7;
    }
  }
  SecKeyRef v24 = (id *)&kSecAttrKeyTypeRSA;
LABEL_9:
  SecKeyRef v230 = v9;
  char v241 = v19;
  id v25 = *v24;
  swift_bridgeObjectRelease();
  type metadata accessor for CFString(0);
  sub_10001A2C8(&qword_100063F18, type metadata accessor for CFString);
  if (static _CFObject.== infix(_:_:)()) {
    uint64_t v26 = 2048;
  }
  else {
    uint64_t v26 = 256;
  }
  SecKeyRef v27 = sub_100043458(v25, v26);
  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v232 = v7;
  uint64_t v28 = sub_100008D9C(v7, (uint64_t)qword_1000679A0);
  id v29 = v25;
  uint64_t v243 = v28;
  uint64_t v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.debug.getter();
  BOOL v32 = os_log_type_enabled(v30, v31);
  id v244 = v29;
  uint64_t v239 = v14;
  uint64_t v240 = v15;
  if (v32)
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 138412546;
    uint64_t v250 = (uint64_t)v29;
    uint64_t v234 = v27;
    id v35 = v244;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v34 = v244;

    *(_WORD *)(v33 + 12) = 2048;
    uint64_t v250 = v26;
    SecKeyRef v27 = v234;
    id v29 = v244;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Generated %@ key of size/curve: %ld", (uint8_t *)v33, 0x16u);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (v27) {
      goto LABEL_16;
    }
LABEL_21:
    sub_100008DD4();
    uint64_t v50 = swift_allocError();
    *(_OWORD *)uint64_t v51 = xmmword_10004E290;
    *(void *)(v51 + 24) = 0;
    *(void *)(v51 + 32) = 0;
    *(void *)(v51 + 16) = 0;
    *(unsigned char *)(v51 + 40) = 0;
    sub_100013E28(v50, v235, v238, v237);
    swift_errorRelease();

    return;
  }

  if (!v27) {
    goto LABEL_21;
  }
LABEL_16:
  uint64_t v36 = _swiftEmptyArrayStorage;
  v247 = _swiftEmptyArrayStorage;
  uint64_t v234 = v27;
  id v37 = [a1 commonName];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v41 = v40;

    uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v44 = v43;
    sub_100008E28(&qword_100064200);
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_10004E280;
    *(void *)(v46 + 32) = v42;
    *(void *)(v46 + 40) = v44;
    *(void *)(v46 + 48) = v39;
    *(void *)(v46 + 56) = v41;
    *(void *)(v45 + 32) = v46;
    uint64_t v36 = sub_100047100(0, 1, 1, _swiftEmptyArrayStorage);
    unint64_t v48 = v36[2];
    unint64_t v47 = v36[3];
    unint64_t v49 = (unint64_t)v230;
    if (v48 >= v47 >> 1) {
      uint64_t v36 = sub_100047100((void *)(v47 > 1), v48 + 1, 1, v36);
    }
    v36[2] = v48 + 1;
    v36[v48 + 4] = v45;
    v247 = v36;
  }
  else
  {
    unint64_t v49 = (unint64_t)v230;
  }
  id v52 = [a1 country];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v56 = v55;

    uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v59 = v58;
    sub_100008E28(&qword_100064200);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_10004E280;
    *(void *)(v61 + 32) = v57;
    *(void *)(v61 + 40) = v59;
    *(void *)(v61 + 48) = v54;
    *(void *)(v61 + 56) = v56;
    *(void *)(v60 + 32) = v61;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v36 = sub_100047100(0, v36[2] + 1, 1, v36);
    }
    unint64_t v63 = v36[2];
    unint64_t v62 = v36[3];
    if (v63 >= v62 >> 1) {
      uint64_t v36 = sub_100047100((void *)(v62 > 1), v63 + 1, 1, v36);
    }
    v36[2] = v63 + 1;
    v36[v63 + 4] = v60;
    v247 = v36;
  }
  id v64 = [a1 state];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v68 = v67;

    uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v71 = v70;
    sub_100008E28(&qword_100064200);
    uint64_t v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v73 = swift_allocObject();
    *(_OWORD *)(v73 + 16) = xmmword_10004E280;
    *(void *)(v73 + 32) = v69;
    *(void *)(v73 + 40) = v71;
    *(void *)(v73 + 48) = v66;
    *(void *)(v73 + 56) = v68;
    *(void *)(v72 + 32) = v73;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v36 = sub_100047100(0, v36[2] + 1, 1, v36);
    }
    unint64_t v75 = v36[2];
    unint64_t v74 = v36[3];
    if (v75 >= v74 >> 1) {
      uint64_t v36 = sub_100047100((void *)(v74 > 1), v75 + 1, 1, v36);
    }
    v36[2] = v75 + 1;
    v36[v75 + 4] = v72;
    v247 = v36;
  }
  id v76 = [a1 organization];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v80 = v79;

    uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v83 = v82;
    sub_100008E28(&qword_100064200);
    uint64_t v84 = swift_allocObject();
    *(_OWORD *)(v84 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_10004E280;
    *(void *)(v85 + 32) = v81;
    *(void *)(v85 + 40) = v83;
    *(void *)(v85 + 48) = v78;
    *(void *)(v85 + 56) = v80;
    *(void *)(v84 + 32) = v85;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v36 = sub_100047100(0, v36[2] + 1, 1, v36);
    }
    unint64_t v87 = v36[2];
    unint64_t v86 = v36[3];
    if (v87 >= v86 >> 1) {
      uint64_t v36 = sub_100047100((void *)(v86 > 1), v87 + 1, 1, v36);
    }
    v36[2] = v87 + 1;
    v36[v87 + 4] = v84;
    v247 = v36;
  }
  id v88 = [a1 organizationUnit];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v92 = v91;

    uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v95 = v94;
    sub_100008E28(&qword_100064200);
    uint64_t v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_10004DF40;
    sub_100008E28(&qword_100064208);
    uint64_t v97 = swift_allocObject();
    *(_OWORD *)(v97 + 16) = xmmword_10004E280;
    *(void *)(v97 + 32) = v93;
    *(void *)(v97 + 40) = v95;
    *(void *)(v97 + 48) = v90;
    *(void *)(v97 + 56) = v92;
    *(void *)(v96 + 32) = v97;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v36 = sub_100047100(0, v36[2] + 1, 1, v36);
    }
    unint64_t v99 = v36[2];
    unint64_t v98 = v36[3];
    if (v99 >= v98 >> 1) {
      uint64_t v36 = sub_100047100((void *)(v98 > 1), v99 + 1, 1, v36);
    }
    v36[2] = v99 + 1;
    v36[v99 + 4] = v96;
    v247 = v36;
  }
  char v246 = 0;
  id v100 = [a1 certType];
  uint64_t v101 = v232;
  Swift::String v102 = (void (**)(unint64_t, void, void))v231;
  v233 = (void (*)(uint64_t, uint64_t))a1;
  if (v100)
  {
    Swift::Int v103 = v100;
    uint64_t v104 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v106 = v105;

    v107._uint64_t countAndFlagsBits = v104;
    v107._object = v106;
    Swift::Int v108 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DC38, v107);
    swift_bridgeObjectRelease();
    if (!v108)
    {
      char v109 = 0;
      goto LABEL_56;
    }
    if (v108 == 1)
    {
      char v109 = 1;
LABEL_56:
      char v246 = v109;
      goto LABEL_57;
    }
  }
  v102[2](v49, v243, v101);
  v110 = a1;
  os_log_type_t v111 = Logger.logObject.getter();
  os_log_type_t v112 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v111, v112))
  {
    v113 = (uint8_t *)swift_slowAlloc();
    uint64_t v250 = swift_slowAlloc();
    *(_DWORD *)v113 = 136315138;
    id v114 = [v110 certType];
    if (!v114)
    {
LABEL_117:

      swift_release();
      __break(1u);
      return;
    }
    v115 = v114;
    uint64_t v116 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v118 = v117;

    uint64_t v248 = sub_10004B330(v116, v118, &v250);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v111, v112, "Certificate type is set to default .signing. Couldn't parse from: '%s'", v113, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*((void (**)(char *, uint64_t))v231 + 1))(v230, v232);
  }
  else
  {

    ((void (*)(unint64_t, uint64_t))v102[1])(v49, v101);
  }
LABEL_57:
  uint64_t v232 = OBJC_IVAR___CertificateManager_certificateRequestManager;
  v119 = *(void **)&v242[OBJC_IVAR___CertificateManager_certificateRequestManager];
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  sub_100008E28(&qword_1000641E8);
  v120.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v121 = [v233 csrAltName];
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v122.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (v246) {
    uint64_t v123 = 0x74707972636E65;
  }
  else {
    uint64_t v123 = 0x676E696E676973;
  }
  if (v246) {
    char v124 = 1;
  }
  else {
    char v124 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  id v125 = [v119 generateCertificateRequestStringWith:v120.super.isa subjectAltName:v122.super.isa privateKey:v234 encrypt:v124 & 1];

  swift_unknownObjectRelease();
  unint64_t v126 = v233;
  if (v125)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v110 = v127;
  }
  else
  {
    v110 = 0;
  }
  id v231 = v125;
  id v128 = v126;
  v129 = Logger.logObject.getter();
  os_log_type_t v130 = static os_log_type_t.debug.getter();
  BOOL v131 = os_log_type_enabled(v129, v130);
  v233 = v128;
  if (v131)
  {
    uint64_t v132 = swift_slowAlloc();
    SecKeyRef v230 = v110;
    uint64_t v133 = v132;
    uint64_t v226 = swift_slowAlloc();
    uint64_t v250 = v226;
    *(_DWORD *)uint64_t v133 = 136315650;
    uint64_t v248 = sub_10004B330(v123, 0xE700000000000000, &v250);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v133 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v134 = Array.description.getter();
    unint64_t v136 = v135;
    swift_bridgeObjectRelease();
    id v249 = (id)sub_10004B330(v134, v136, &v250);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v133 + 22) = 2080;
    id v137 = [v128 csrAltName];
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v138 = Dictionary.description.getter();
    unint64_t v140 = v139;
    swift_bridgeObjectRelease();
    id v249 = (id)sub_10004B330(v138, v140, &v250);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v129, v130, "Generated %s CSR with subject: %s, subject alt name: %s", (uint8_t *)v133, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    v110 = v230;
    swift_slowDealloc();
  }
  else
  {
  }
  id v141 = v244;
  uint64_t v142 = v239;
  uint64_t v143 = v240;
  v144 = v241;
  uint64_t v145 = v229;
  if (!v110)
  {

    sub_100008DD4();
    uint64_t v148 = swift_allocError();
    *(void *)uint64_t v149 = 2;
    *(_OWORD *)(v149 + 8) = 0u;
    *(_OWORD *)(v149 + 24) = 0u;
    *(unsigned char *)(v149 + 40) = 5;
    sub_100013E28(v148, v235, v238, v237);
    uint64_t v150 = v234;

LABEL_104:
    swift_errorRelease();
    goto LABEL_105;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v146 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v143 + 48);
  if ((v246 & 1) == 0)
  {
    uint64_t v147 = v228;
    sub_10001A1F4((uint64_t)&v242[OBJC_IVAR___CertificateManager_signingEndpoint], v228);
    if ((*v146)(v147, 1, v142) != 1) {
      goto LABEL_75;
    }
    goto LABEL_116;
  }
  uint64_t v147 = v227;
  sub_10001A1F4((uint64_t)&v242[OBJC_IVAR___CertificateManager_encryptEndpoint], v227);
  if ((*v146)(v147, 1, v142) == 1)
  {

    swift_release();
    __break(1u);
LABEL_116:

    swift_release();
    __break(1u);
    goto LABEL_117;
  }
LABEL_75:
  (*(void (**)(char *, uint64_t, uint64_t))(v143 + 32))(v144, v147, v142);
  uint64_t v229 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  SecKeyRef v230 = (char *)v151;
  (*(void (**)(uint64_t, char *, uint64_t))(v143 + 16))(v145, v144, v142);
  unint64_t v152 = Logger.logObject.getter();
  os_log_type_t v153 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v152, v153))
  {
    uint64_t v154 = v145;
    os_log_type_t v155 = (uint8_t *)swift_slowAlloc();
    id v249 = (id)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v155 = 136315138;
    sub_10001A2C8(&qword_1000641F8, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v156 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v245 = sub_10004B330(v156, v157, (uint64_t *)&v249);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v158 = v154;
    v159 = *(void (**)(uint64_t, uint64_t))(v240 + 8);
    v159(v158, v142);
    _os_log_impl((void *)&_mh_execute_header, v152, v153, "Requesting certificate from: %s", v155, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v159 = *(void (**)(uint64_t, uint64_t))(v143 + 8);
    v159(v145, v142);
  }

  id v160 = [v233 commonName];
  v161 = v241;
  if (v160)
  {
    v162 = v160;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v163 = *(void **)&v242[v232];
  swift_unknownObjectRetain();
  URL._bridgeToObjectiveC()(v164);
  NSString v166 = v165;
  NSString v167 = String._bridgeToObjectiveC()();
  id v249 = 0;
  id v168 = v231;
  id v169 = [v163 resultFromServerFor:v231 endpoint:v166 email:v167 error:&v249];
  swift_unknownObjectRelease();

  id v170 = v249;
  if (!v169)
  {
LABEL_93:
    id v204 = v170;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v205 = _convertNSErrorToError(_:)();

LABEL_95:
    swift_willThrow();
    v207 = v161;
LABEL_99:
    v159((uint64_t)v207, v239);
LABEL_100:
    id v210 = v244;
    swift_errorRetain();
    swift_errorRetain();
    v211 = Logger.logObject.getter();
    os_log_type_t v212 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v211, v212))
    {
      v213 = (uint8_t *)swift_slowAlloc();
      id v214 = (void *)swift_slowAlloc();
      *(_DWORD *)v213 = 138412290;
      swift_errorRetain();
      v215 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v249 = v215;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v214 = v215;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v211, v212, "Certificate request failed with error %@", v213, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_errorRetain();
    sub_100013E28(v205, v235, v238, v237);
    SecKeyRef v216 = v234;

    swift_errorRelease();
    goto LABEL_104;
  }
  uint64_t v171 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v172 = v170;

  if (!*(void *)(v171 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100008DD4();
    uint64_t v205 = swift_allocError();
    *(void *)uint64_t v206 = 9;
    *(_OWORD *)(v206 + 8) = 0u;
    *(_OWORD *)(v206 + 24) = 0u;
    *(unsigned char *)(v206 + 40) = 5;
    goto LABEL_95;
  }
  v161 = v242;
  v173 = *(void **)&v242[v232];
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  NSString v174 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v249 = 0;
  id v175 = [v173 certificateFor:v174 error:&v249];
  swift_unknownObjectRelease();

  id v176 = v249;
  if (!v175)
  {
    id v208 = v249;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v205 = _convertNSErrorToError(_:)();

    swift_willThrow();
LABEL_98:
    v207 = v241;
    goto LABEL_99;
  }
  uint64_t v177 = OBJC_IVAR___CertificateManager_keychainManager;
  v178 = *(void **)&v161[OBJC_IVAR___CertificateManager_keychainManager];
  id v249 = 0;
  id v179 = v176;
  id v180 = [v178 saveIdentityToKeychain:v175 privateKey:v234 error:&v249];
  id v181 = v249;
  uint64_t v182 = v175;
  if (!v180)
  {
    v209 = v181;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v205 = _convertNSErrorToError(_:)();

    swift_willThrow();
    goto LABEL_98;
  }
  id v231 = v175;
  v233 = v159;
  uint64_t v183 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v185 = v184;

  uint64_t v186 = *(void **)&v161[OBJC_IVAR___CertificateManager_cloudKVSManager];
  swift_unknownObjectRetain();
  uint64_t v187 = v183;
  NSString v188 = String._bridgeToObjectiveC()();
  unint64_t v189 = v185;
  swift_bridgeObjectRelease();
  sub_100008E28(&qword_1000641F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004DF40;
  unint64_t v191 = (unint64_t)v230;
  *(void *)(inited + 32) = v229;
  *(void *)(inited + 40) = v191;
  *(void *)(inited + 48) = v183;
  *(void *)(inited + 56) = v185;
  sub_10000A848(v183, v185);
  sub_10003F10C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v249 = 0;
  LOBYTE(inited) = [v186 updateCertificateSettingsWithEmailAddress:v188 identityPersistentRefs:isa error:&v249];
  swift_unknownObjectRelease();

  if ((inited & 1) == 0)
  {
    id v217 = v249;
    swift_bridgeObjectRelease();
    uint64_t v205 = _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v218 = v187;
    unint64_t v219 = v189;
LABEL_110:
    sub_100008F8C(v218, v219);
    v233((uint64_t)v241, v239);
    goto LABEL_100;
  }
  uint64_t v229 = v187;
  SecKeyRef v230 = (char *)v185;
  v159 = *(void (**)(uint64_t, uint64_t))(v171 + 16);
  if ((unint64_t)v159 < 2) {
    __break(1u);
  }
  id v193 = v249;
  uint64_t v194 = v171 + 56;
  unint64_t v195 = 2;
  while (1)
  {
    NSString v196 = *(void **)&v161[v232];
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    NSString v197 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v249 = 0;
    id v198 = [v196 certificateFor:v197 error:&v249];
    swift_unknownObjectRelease();

    id v199 = v249;
    if (!v198)
    {
      id v220 = v249;
      swift_bridgeObjectRelease();
      uint64_t v205 = _convertNSErrorToError(_:)();

      swift_willThrow();
LABEL_109:
      uint64_t v218 = v229;
      unint64_t v219 = (unint64_t)v230;
      goto LABEL_110;
    }
    id v170 = *(id *)&v161[v177];
    id v249 = 0;
    id v200 = v199;
    unsigned __int8 v201 = [v170 saveCertificateToKeychain:v198 error:&v249];
    id v202 = v249;
    if ((v201 & 1) == 0)
    {
      v221 = v202;
      swift_bridgeObjectRelease();
      uint64_t v205 = _convertNSErrorToError(_:)();

      swift_willThrow();
      goto LABEL_109;
    }

    if (v159 == (void (*)(uint64_t, uint64_t))v195) {
      break;
    }
    v194 += 16;
    if (v195++ >= *(void *)(v171 + 16))
    {
      __break(1u);
      goto LABEL_93;
    }
  }
  swift_bridgeObjectRelease();
  SecKeyRef v222 = Logger.logObject.getter();
  os_log_type_t v223 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v222, v223))
  {
    uint64_t v224 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v224 = 0;
    _os_log_impl((void *)&_mh_execute_header, v222, v223, "Saved to iCloud keychain", v224, 2u);
    swift_slowDealloc();
  }

  sub_100013E28(0, v235, v238, v237);
  v225 = v234;

  sub_100008F8C(v229, (unint64_t)v230);
  v233((uint64_t)v241, v239);
LABEL_105:
  swift_bridgeObjectRelease();
}

void sub_1000184FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + OBJC_IVAR___CertificateManager_keychainManager);
  v45[0] = 0;
  id v4 = [v3 find:kSecClassCertificate error:v45];
  id v5 = v45[0];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = v5;

    int64_t v9 = *(void *)(v7 + 16);
    if (v9)
    {
      sub_10002E98C(0, v9, 0);
      type metadata accessor for CFString(0);
      uint64_t v10 = v7 + 32;
      while (1)
      {
        sub_10000A6C0(v10, (uint64_t)v45);
        sub_10001A2C8(&qword_100063F18, type metadata accessor for CFString);
        if (static _CFObject.== infix(_:_:)())
        {
          sub_10000A6C0((uint64_t)v45, (uint64_t)v44);
          type metadata accessor for SecKey(0);
          swift_dynamicCast();
          CFDataRef v11 = SecKeyCopyExternalRepresentation(key, 0);
          if (v11) {
            static Data._conditionallyBridgeFromObjectiveC(_:result:)();
          }

          uint64_t v12 = "<No description>";
        }
        else
        {
          if (static _CFObject.== infix(_:_:)())
          {
            sub_10000A6C0((uint64_t)v45, (uint64_t)v44);
            type metadata accessor for SecCertificate(0);
            swift_dynamicCast();
            CFStringRef v13 = SecCertificateCopySubjectSummary(key);
            if (v13)
            {
              uint64_t v14 = (__CFString *)v13;
              static String._conditionallyBridgeFromObjectiveC(_:result:)();
            }
            swift_bridgeObjectRelease();
            unint64_t v21 = 0xD000000000000010;
            unint64_t v22 = 0x8000000100052DC0;
            goto LABEL_23;
          }
          if (static _CFObject.== infix(_:_:)())
          {
            sub_10000A6C0((uint64_t)v45, (uint64_t)v44);
            type metadata accessor for SecIdentity(0);
            swift_dynamicCast();
            SecKeyRef privateKeyRef = 0;
            SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
            SecKeyRef v15 = privateKeyRef;
            SecCertificateRef certificateRef = 0;
            SecIdentityCopyCertificate(identityRef, &certificateRef);
            SecCertificateRef v16 = certificateRef;
            if (v15 && certificateRef)
            {
              uint64_t v17 = v15;
              uint64_t v18 = v16;
              _StringGuts.grow(_:)(18);
              swift_bridgeObjectRelease();
              CFStringRef v19 = SecCertificateCopySubjectSummary(v18);
              if (v19)
              {
                id v20 = (__CFString *)v19;
                key = 0;
                static String._conditionallyBridgeFromObjectiveC(_:result:)();
              }
              swift_bridgeObjectRelease();
              v23._uint64_t countAndFlagsBits = 0xD000000000000010;
              v23._object = (void *)0x8000000100052DC0;
              String.append(_:)(v23);
              swift_bridgeObjectRelease();
              v24._uint64_t countAndFlagsBits = 8236;
              v24._object = (void *)0xE200000000000000;
              String.append(_:)(v24);
              CFDataRef v25 = SecKeyCopyExternalRepresentation(v17, 0);
              if (v25)
              {
                key = 0;
                static Data._conditionallyBridgeFromObjectiveC(_:result:)();
              }

              v26._uint64_t countAndFlagsBits = 0xD000000000000015;
              v26._object = (void *)0x8000000100052DE0;
              String.append(_:)(v26);
              swift_bridgeObjectRelease();
              v27._uint64_t countAndFlagsBits = 62;
              v27._object = (void *)0xE100000000000000;
              String.append(_:)(v27);

              unint64_t v22 = 0xEB000000003C203ALL;
              unint64_t v21 = 0x797469746E656449;
            }
            else
            {

              unint64_t v21 = 0xD00000000000001ALL;
              unint64_t v22 = 0x8000000100052DA0;
            }
            goto LABEL_23;
          }
          uint64_t v12 = "tificate=}8@\"NSError\"16";
        }
        unint64_t v22 = (unint64_t)v12 | 0x8000000000000000;
        unint64_t v21 = 0xD000000000000015;
LABEL_23:
        sub_10000A788((uint64_t)v45);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10002E98C(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v29 = _swiftEmptyArrayStorage[2];
        unint64_t v28 = _swiftEmptyArrayStorage[3];
        if (v29 >= v28 >> 1) {
          sub_10002E98C(v28 > 1, v29 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v29 + 1;
        uint64_t v30 = &_swiftEmptyArrayStorage[2 * v29];
        v30[4] = v21;
        v30[5] = v22;
        v10 += 32;
        if (!--v9)
        {
          swift_bridgeObjectRelease();
          goto LABEL_34;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_34:
    sub_100012398((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, Class, void))(a2 + 16))(a2, isa, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v31 = v45[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v32 = type metadata accessor for Logger();
    sub_100008D9C(v32, (uint64_t)qword_1000679A0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v33, v34))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      *(_DWORD *)id v35 = 138412290;
      swift_errorRetain();
      id v37 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v45[0] = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v36 = v37;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "No certificate available: %@", v35, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_errorRetain();
    uint64_t v39 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, void *))(a2 + 16))(a2, 0, v39);

    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_100018D94(void *a1, char *a2, uint8_t *a3)
{
  id v5 = *(void **)&a2[OBJC_IVAR___CertificateManager_cloudKVSManager];
  aBlock[0] = 0;
  id v6 = [v5 fetchCertificatesSettingsWithEmailAddress:v4 error:v3];
  if (!v6)
  {
    uint64_t v3 = (uint64_t)a3;
    id v16 = aBlock[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100063E80 == -1)
    {
LABEL_6:
      uint64_t v17 = type metadata accessor for Logger();
      sub_100008D9C(v17, (uint64_t)qword_1000679A0);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v19))
      {
        id v20 = (uint8_t *)swift_slowAlloc();
        unint64_t v21 = (void *)swift_slowAlloc();
        *(_DWORD *)id v20 = 138412290;
        swift_errorRetain();
        unint64_t v22 = (void *)_swift_stdlib_bridgeErrorToNSError();
        aBlock[0] = v22;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *unint64_t v21 = v22;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "No certificate available: %@", v20, 0xCu);
        sub_100008E28(&qword_1000651F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      swift_errorRetain();
      uint64_t v54 = (void *)_convertErrorToNSError(_:)();
      (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v54);

      swift_errorRelease();
      swift_errorRelease();
      return;
    }
LABEL_48:
    swift_once();
    goto LABEL_6;
  }
  uint64_t v7 = v6;
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = 0;

  if (qword_100063E80 != -1) {
LABEL_44:
  }
    swift_once();
  uint64_t v10 = type metadata accessor for Logger();
  sub_100008D9C(v10, (uint64_t)qword_1000679A0);
  swift_bridgeObjectRetain_n();
  CFDataRef v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  uint64_t v56 = a3;
  if (os_log_type_enabled(v11, v12))
  {
    CFStringRef v13 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = (id)swift_slowAlloc();
    *(_DWORD *)CFStringRef v13 = 136315138;
    a3 = v13 + 4;
    swift_bridgeObjectRetain();
    uint64_t v14 = Dictionary.description.getter();
    uint64_t v3 = v15;
    swift_bridgeObjectRelease();
    sub_10004B330(v14, v3, (uint64_t *)aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Found saved identityRefs %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v23 = swift_allocObject();
  int64_t v24 = 0;
  uint64_t v63 = v23;
  uint64_t v64 = v8;
  *(void *)(v23 + 16) = _swiftEmptyArrayStorage;
  uint64_t v57 = (uint64_t *)(v23 + 16);
  uint64_t v58 = v8 + 64;
  uint64_t v25 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v26 = -1;
  if (v25 < 64) {
    uint64_t v26 = ~(-1 << v25);
  }
  unint64_t v27 = v26 & *(void *)(v8 + 64);
  int64_t v59 = (unint64_t)(v25 + 63) >> 6;
  uint64_t v60 = OBJC_IVAR___CertificateManager_keychainManager;
  uint64_t v8 = (uint64_t)a1;
  while (1)
  {
    if (v27)
    {
      uint64_t v65 = (v27 - 1) & v27;
      int64_t v66 = v24;
      unint64_t v28 = __clz(__rbit64(v27)) | (v24 << 6);
      uint64_t v29 = v64;
      goto LABEL_13;
    }
    int64_t v42 = v24 + 1;
    uint64_t v29 = v64;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v42 >= v59) {
      goto LABEL_29;
    }
    unint64_t v43 = *(void *)(v58 + 8 * v42);
    int64_t v44 = v24 + 1;
    if (!v43)
    {
      int64_t v44 = v24 + 2;
      if (v24 + 2 >= v59) {
        goto LABEL_29;
      }
      unint64_t v43 = *(void *)(v58 + 8 * v44);
      if (!v43)
      {
        int64_t v44 = v24 + 3;
        if (v24 + 3 >= v59) {
          goto LABEL_29;
        }
        unint64_t v43 = *(void *)(v58 + 8 * v44);
        if (!v43) {
          break;
        }
      }
    }
LABEL_28:
    uint64_t v65 = (v43 - 1) & v43;
    int64_t v66 = v44;
    unint64_t v28 = __clz(__rbit64(v43)) + (v44 << 6);
LABEL_13:
    uint64_t v30 = 16 * v28;
    id v31 = (uint64_t *)(*(void *)(v29 + 48) + v30);
    uint64_t v33 = *v31;
    uint64_t v32 = v31[1];
    os_log_type_t v34 = (uint64_t *)(*(void *)(v29 + 56) + v30);
    uint64_t v3 = *v34;
    unint64_t v35 = v34[1];
    uint64_t v36 = *(void **)&a2[v60];
    sub_10000A848(*v34, v35);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000A848(v3, v35);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100008F8C(v3, v35);
    uint64_t v38 = (uint8_t *)swift_allocObject();
    *((void *)v38 + 2) = v63;
    *((void *)v38 + 3) = v33;
    *((void *)v38 + 4) = v32;
    *((void *)v38 + 5) = v3;
    *((void *)v38 + 6) = v35;
    *((void *)v38 + 7) = a1;
    *((void *)v38 + 8) = a2;
    aBlock[4] = sub_10001A3F8;
    uint64_t v68 = v38;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_10000CC60;
    aBlock[3] = &unk_10005E188;
    uint64_t v39 = _Block_copy(aBlock);
    a3 = v68;
    swift_bridgeObjectRetain();
    sub_10000A848(v3, v35);
    swift_retain();
    id v40 = a1;
    uint64_t v41 = a2;
    swift_release();
    [v36 getCertificateByIdentityRef:isa completion:v39];
    _Block_release(v39);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    sub_100008F8C(v3, v35);
    unint64_t v27 = v65;
    int64_t v24 = v66;
  }
  uint64_t v45 = v24 + 4;
  if (v24 + 4 < v59)
  {
    unint64_t v43 = *(void *)(v58 + 8 * v45);
    if (!v43)
    {
      while (1)
      {
        int64_t v44 = v45 + 1;
        if (__OFADD__(v45, 1)) {
          goto LABEL_43;
        }
        if (v44 >= v59) {
          goto LABEL_29;
        }
        unint64_t v43 = *(void *)(v58 + 8 * v44);
        ++v45;
        if (v43) {
          goto LABEL_28;
        }
      }
    }
    int64_t v44 = v24 + 4;
    goto LABEL_28;
  }
LABEL_29:
  swift_release();
  swift_beginAccess();
  uint64_t v46 = *v57;
  if ((unint64_t)*v57 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = _CocoaArrayWrapper.endIndex.getter();
    if (!v47) {
      goto LABEL_46;
    }
LABEL_31:
    sub_10002E9CC(0, v47 & ~(v47 >> 63), 0);
    if ((v47 & 0x8000000000000000) == 0)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if ((v46 & 0xC000000000000001) != 0) {
          id v49 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v49 = *(id *)(v46 + 8 * i + 32);
        }
        uint64_t v50 = v49;
        uint64_t v51 = sub_1000092D8();

        unint64_t v53 = _swiftEmptyArrayStorage[2];
        unint64_t v52 = _swiftEmptyArrayStorage[3];
        if (v53 >= v52 >> 1) {
          sub_10002E9CC(v52 > 1, v53 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v53 + 1;
        _swiftEmptyArrayStorage[v53 + 4] = v51;
      }
      goto LABEL_46;
    }
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v47 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v47) {
    goto LABEL_31;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  sub_1000124C0((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  Class v55 = Array._bridgeToObjectiveC()().super.isa;
  (*((void (**)(uint8_t *, Class, void))v56 + 2))(v56, v55, 0);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_100019630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a3 + 16) || (unint64_t v11 = sub_10004740C(v9, v10), (v12 & 1) == 0))
  {
    long long aBlock = 0u;
    long long v33 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  sub_10000A6C0(*(void *)(a3 + 56) + 32 * v11, (uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  if (!*((void *)&v33 + 1))
  {
LABEL_6:
    sub_10000A72C((uint64_t)&aBlock, (uint64_t *)&unk_1000648F0);
    goto LABEL_7;
  }
  sub_10000A71C(&aBlock, v36);
  CFStringRef v13 = *(void **)(a4 + OBJC_IVAR___CertificateManager_keychainManager);
  sub_10000A6C0((uint64_t)v36, (uint64_t)&aBlock);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  os_log_type_t v34 = sub_10001A374;
  uint64_t v35 = v8;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v33 = sub_1000130E8;
  *((void *)&v33 + 1) = &unk_10005E110;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v13 findSecIdentityRefForCertId:v14 completion:v15];
  _Block_release(v15);
  swift_unknownObjectRelease();

  sub_10000A788((uint64_t)v36);
LABEL_7:
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(a3 + 16) && (unint64_t v18 = sub_10004740C(v16, v17), (v19 & 1) != 0))
  {
    sub_10000A6C0(*(void *)(a3 + 56) + 32 * v18, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v33 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v33 + 1))
  {
    sub_10000A71C(&aBlock, v36);
    id v20 = *(void **)(a4 + OBJC_IVAR___CertificateManager_keychainManager);
    sub_10000A6C0((uint64_t)v36, (uint64_t)&aBlock);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    os_log_type_t v34 = sub_10001A348;
    uint64_t v35 = v8;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v33 = sub_1000130E8;
    *((void *)&v33 + 1) = &unk_10005E0E8;
    unint64_t v22 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [v20 findSecIdentityRefForCertId:v21 completion:v22];
    _Block_release(v22);
    swift_unknownObjectRelease();

    sub_10000A788((uint64_t)v36);
  }
  else
  {
    sub_10000A72C((uint64_t)&aBlock, (uint64_t *)&unk_1000648F0);
  }
  uint64_t v23 = *(void **)(a4 + OBJC_IVAR___CertificateManager_cloudKVSManager);
  swift_unknownObjectRetain();
  NSString v24 = String._bridgeToObjectiveC()();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(void *)&v36[0] = 0;
  unsigned int v26 = [v23 updateCertificateSettingsWithEmailAddress:v24 identityPersistentRefs:isa error:v36];
  swift_unknownObjectRelease();

  if (v26)
  {
    unint64_t v27 = *(void (**)(uint64_t, void))(a5 + 16);
    id v28 = *(id *)&v36[0];
    v27(a5, 0);
  }
  else
  {
    id v29 = *(id *)&v36[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    uint64_t v30 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v30);

    swift_errorRelease();
    swift_errorRelease();
  }
  return swift_release();
}

void sub_100019B08(void *a1, uint64_t a2, char *a3, void (**a4)(void, void, void))
{
  uint64_t v51 = a1;
  uint64_t v7 = sub_100008E28(&qword_1000641E0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  unint64_t v11 = *(void **)&a3[OBJC_IVAR___CertificateManager_keychainManager];
  aBlock[0] = 0;
  _Block_copy(a4);
  char v12 = (__SecIdentity *)[v11 findSecIdentityForCertId:a2 error:aBlock];
  if (v12)
  {
    CFStringRef v13 = v12;
    SecCertificateRef certificateRef = 0;
    id v14 = aBlock[0];
    OSStatus v15 = SecIdentityCopyCertificate(v13, &certificateRef);
    SecCertificateRef v16 = certificateRef;
    if (v15) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = certificateRef == 0;
    }
    if (v17)
    {
      OSStatus v18 = v15;
      if (qword_100063E80 != -1) {
        swift_once();
      }
      uint64_t v19 = type metadata accessor for Logger();
      sub_100008D9C(v19, (uint64_t)qword_1000679A0);
      id v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        unint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v22 = 67109120;
        LODWORD(aBlock[0]) = v18;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "RefreshCertificate error: Failed to copy Signing Certificate from Signing Identity: %d", v22, 8u);
        swift_slowDealloc();
      }

      sub_100008DD4();
      swift_allocError();
      *(void *)uint64_t v23 = 9;
      *(_OWORD *)(v23 + 8) = 0u;
      *(_OWORD *)(v23 + 24) = 0u;
      *(unsigned char *)(v23 + 40) = 5;
      NSString v24 = (void *)_convertErrorToNSError(_:)();
      ((void (**)(void, void, void *))a4)[2](a4, 0, v24);

      swift_errorRelease();
      goto LABEL_16;
    }
    unsigned int v26 = *(void **)&a3[OBJC_IVAR___CertificateManager_certificateRequestManager];
    sub_10001A1F4((uint64_t)&a3[OBJC_IVAR___CertificateManager_revokeEndpoint], (uint64_t)v9);
    uint64_t v27 = type metadata accessor for URL();
    uint64_t v28 = *(void *)(v27 - 8);
    int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v9, 1, v27);
    if (v29 == 1)
    {
      _Block_release(a4);
      __break(1u);
      return;
    }
    uint64_t v30 = v16;
    swift_unknownObjectRetain();
    URL._bridgeToObjectiveC()(v31);
    long long v33 = v32;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v27);
    os_log_type_t v34 = v30;
    uint64_t v35 = (void *)swift_allocObject();
    long long v35[2] = sub_10001A1EC;
    v35[3] = v10;
    uint64_t v36 = v51;
    v35[4] = a3;
    v35[5] = v36;
    aBlock[4] = sub_10001A2A4;
    id aBlock[5] = v35;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000145E8;
    aBlock[3] = &unk_10005E098;
    id v37 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v38 = a3;
    id v39 = v36;
    swift_release();
    aBlock[0] = 0;
    LOBYTE(v36) = [v26 generatePayloadAndRevokeFor:v34 signingIdentity:v13 endpoint:v33 error:aBlock errCompletion:v37];
    _Block_release(v37);
    swift_unknownObjectRelease();

    id v40 = aBlock[0];
    if (v36)
    {

LABEL_16:
      SecCertificateRef v41 = certificateRef;
      swift_release();

      return;
    }
    int64_t v42 = v40;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  else
  {
    id v25 = aBlock[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v43 = type metadata accessor for Logger();
  sub_100008D9C(v43, (uint64_t)qword_1000679A0);
  swift_errorRetain();
  swift_errorRetain();
  int64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 138412290;
    swift_errorRetain();
    unint64_t v48 = (void *)_swift_stdlib_bridgeErrorToNSError();
    aBlock[0] = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v47 = v48;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "RefreshCertificate error in Catch block %@", v46, 0xCu);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_100008DD4();
  swift_allocError();
  *(void *)uint64_t v49 = 15;
  *(_OWORD *)(v49 + 8) = 0u;
  *(_OWORD *)(v49 + 24) = 0u;
  *(unsigned char *)(v49 + 40) = 5;
  uint64_t v50 = (void *)_convertErrorToNSError(_:)();
  ((void (**)(void, void, void *))a4)[2](a4, 0, v50);

  swift_errorRelease();
  swift_errorRelease();
  swift_release();
}

uint64_t sub_10001A1B4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001A1EC(uint64_t a1, uint64_t a2)
{
  sub_10001265C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001A1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008E28(&qword_1000641E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001A25C()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10001A2A4(uint64_t a1)
{
  sub_100013BD8(a1, *(void (**)(void *, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_10001A2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A2C0()
{
  return swift_release();
}

uint64_t sub_10001A2C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001A310()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001A348(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100013194(a1, a2, a3, v3, (uint64_t)&MCCSecretAgentSigningCertIdKey, "UpdateUserDefaults. identityPresistentRef for signing not found. error: %@");
}

void sub_10001A374(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100013194(a1, a2, a3, v3, (uint64_t)&MCCSecretAgentEncryptionCertIdKey, "UpdateUserDefaults. identityPresistentRef for encryption not found. error: %@");
}

uint64_t sub_10001A3A0()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_100008F8C(*(void *)(v0 + 40), *(void *)(v0 + 48));

  return _swift_deallocObject(v0, 72, 7);
}

void sub_10001A3F8(void *a1, uint64_t a2)
{
  sub_1000126F8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void **)(v2 + 56), *(void *)(v2 + 64));
}

uint64_t type metadata accessor for FetchSenderOverridesAPIRequest()
{
  uint64_t result = qword_100064240;
  if (!qword_100064240) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001A494()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10001A4CC()
{
  return type metadata accessor for FetchSenderOverridesAPIRequest();
}

ValueMetadata *type metadata accessor for FetchSenderOverridesAPIResponse()
{
  return &type metadata for FetchSenderOverridesAPIResponse;
}

BOOL sub_10001A4E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10001A4FC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10001A544()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001A570()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10001A5B4()
{
  if (*v0) {
    return 0x74696D696CLL;
  }
  else {
    return 0x536465676E616863;
  }
}

uint64_t sub_10001A5F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001AE18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001A61C()
{
  return 0;
}

void sub_10001A628(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10001A634(uint64_t a1)
{
  unint64_t v2 = sub_10001BD04();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001A670(uint64_t a1)
{
  unint64_t v2 = sub_10001BD04();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001A6AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[1] = a4;
  uint64_t v6 = sub_100008E28(&qword_100064398);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000902C(a1, a1[3]);
  sub_10001BD04();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v4)
  {
    char v12 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_10001A820(void *a1)
{
  uint64_t v3 = sub_100008E28(&qword_1000643A8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000902C(a1, a1[3]);
  sub_10001BCB0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001A9F8(void *a1)
{
  return sub_10001A6AC(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), *(void *)(v1 + 16));
}

Swift::Int sub_10001AA24()
{
  return Hasher._finalize()();
}

void sub_10001AA68()
{
}

Swift::Int sub_10001AA90()
{
  return Hasher._finalize()();
}

uint64_t sub_10001AAD0()
{
  return 0x656469727265766FLL;
}

uint64_t sub_10001AAEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x656469727265766FLL && a2 == 0xE900000000000073)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_10001AB90(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10001AB9C(uint64_t a1)
{
  unint64_t v2 = sub_10001B094();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001ABD8(uint64_t a1)
{
  unint64_t v2 = sub_10001B094();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001AC14@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10001AF1C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

BOOL sub_10001AC40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001AC54()
{
  uint64_t result = 0x4E79616C70736964;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6464416C69616D65;
      break;
    case 2:
      uint64_t result = 0x79726F6765746163;
      break;
    case 3:
      unsigned int v2 = 1634038371;
      goto LABEL_6;
    case 4:
      unsigned int v2 = 1633972341;
LABEL_6:
      uint64_t result = v2 | 0x6954657400000000;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001AD10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001B690(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001AD38(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10001AD44(uint64_t a1)
{
  unint64_t v2 = sub_10001BCB0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001AD80(uint64_t a1)
{
  unint64_t v2 = sub_10001BCB0();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10001ADBC@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10001B920(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_10001AE00(void *a1)
{
  return sub_10001A820(a1);
}

uint64_t sub_10001AE18(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x536465676E616863 && a2 == 0xEC00000065636E69;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74696D696CLL && a2 == 0xE500000000000000)
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

void *sub_10001AF1C(void *a1)
{
  uint64_t v3 = sub_100008E28(&qword_100064348);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = sub_10000902C(a1, a1[3]);
  sub_10001B094();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_10000A788((uint64_t)a1);
  }
  else
  {
    sub_100008E28(&qword_100064358);
    sub_10001B0E8();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    char v7 = (void *)v9[1];
    sub_10000A788((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_10001B094()
{
  unint64_t result = qword_100064350;
  if (!qword_100064350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064350);
  }
  return result;
}

unint64_t sub_10001B0E8()
{
  unint64_t result = qword_100064360;
  if (!qword_100064360)
  {
    sub_100008E6C(&qword_100064358);
    sub_10001B15C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064360);
  }
  return result;
}

unint64_t sub_10001B15C()
{
  unint64_t result = qword_100064368;
  if (!qword_100064368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064368);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for FetchSenderOverridesAPIRequestBody(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for FetchSenderOverridesAPIRequestBody(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FetchSenderOverridesAPIRequestBody(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FetchSenderOverridesAPIRequestBody()
{
  return &type metadata for FetchSenderOverridesAPIRequestBody;
}

unsigned char *storeEnumTagSinglePayload for FetchSenderOverridesAPIResponse.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        void *result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      void *result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001B2BCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FetchSenderOverridesAPIResponse.CodingKeys()
{
  return &type metadata for FetchSenderOverridesAPIResponse.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for SenderOverride(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SenderOverride()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SenderOverride(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SenderOverride(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

__n128 initializeWithTake for SenderOverride(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SenderOverride(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for SenderOverride(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SenderOverride(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SenderOverride()
{
  return &type metadata for SenderOverride;
}

unint64_t sub_10001B58C()
{
  unint64_t result = qword_100064370;
  if (!qword_100064370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064370);
  }
  return result;
}

unint64_t sub_10001B5E4()
{
  unint64_t result = qword_100064378;
  if (!qword_100064378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064378);
  }
  return result;
}

unint64_t sub_10001B63C()
{
  unint64_t result = qword_100064380;
  if (!qword_100064380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064380);
  }
  return result;
}

uint64_t sub_10001B690(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6464416C69616D65 && a2 == 0xEC00000073736572 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6954657461657263 && a2 == 0xEF706D617473656DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6954657461647075 && a2 == 0xEF706D617473656DLL)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_10001B920@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100008E28(&qword_100064388);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000902C(a1, a1[3]);
  sub_10001BCB0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000A788((uint64_t)a1);
  }
  char v33 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v27 = v9;
  char v32 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v28 = v13;
  uint64_t v24 = v12;
  char v31 = 2;
  swift_bridgeObjectRetain();
  uint64_t v26 = 0;
  uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)();
  char v30 = 3;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v25 = v15;
  uint64_t v17 = v16;
  char v29 = 4;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000A788((uint64_t)a1);
  uint64_t v20 = v25;
  swift_bridgeObjectRelease();
  uint64_t v21 = v28;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v27;
  a2[1] = v11;
  a2[2] = v24;
  a2[3] = v21;
  a2[4] = v23;
  a2[5] = v20;
  a2[6] = v17;
  a2[7] = v19;
  return result;
}

unint64_t sub_10001BCB0()
{
  unint64_t result = qword_100064390;
  if (!qword_100064390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064390);
  }
  return result;
}

unint64_t sub_10001BD04()
{
  unint64_t result = qword_1000643A0;
  if (!qword_1000643A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000643A0);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for FetchSenderOverridesAPIRequestBody.CodingKeys(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FetchSenderOverridesAPIRequestBody.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FetchSenderOverridesAPIRequestBody.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001BEC0);
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

uint64_t sub_10001BEE8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001BEF0(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FetchSenderOverridesAPIRequestBody.CodingKeys()
{
  return &type metadata for FetchSenderOverridesAPIRequestBody.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SenderOverride.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SenderOverride.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x10001C068);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_10001C090(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SenderOverride.CodingKeys()
{
  return &type metadata for SenderOverride.CodingKeys;
}

unint64_t sub_10001C0AC()
{
  unint64_t result = qword_1000643B0;
  if (!qword_1000643B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000643B0);
  }
  return result;
}

unint64_t sub_10001C104()
{
  unint64_t result = qword_1000643B8;
  if (!qword_1000643B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000643B8);
  }
  return result;
}

unint64_t sub_10001C15C()
{
  unint64_t result = qword_1000643C0;
  if (!qword_1000643C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000643C0);
  }
  return result;
}

unint64_t sub_10001C1B4()
{
  unint64_t result = qword_1000643C8;
  if (!qword_1000643C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000643C8);
  }
  return result;
}

unint64_t sub_10001C20C()
{
  unint64_t result = qword_1000643D0;
  if (!qword_1000643D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000643D0);
  }
  return result;
}

unint64_t sub_10001C264()
{
  unint64_t result = qword_1000643D8;
  if (!qword_1000643D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000643D8);
  }
  return result;
}

uint64_t sub_10001C2B8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10001C2FC(uint64_t a1, uint64_t a2, char a3)
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100008D9C(v4, (uint64_t)qword_100067A00);
  uint64_t v5 = v3;
  unsigned int v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v26 = *(void *)&v5[qword_100064F68];
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    sub_1000224D8();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    if ((_BYTE)v26) {
      uint64_t v9 = 1414745936;
    }
    else {
      uint64_t v9 = 5522759;
    }
    if ((_BYTE)v26) {
      unint64_t v10 = 0xE400000000000000;
    }
    else {
      unint64_t v10 = 0xE300000000000000;
    }
    sub_10004B330(v9, v10, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    id v11 = [v5 urlString];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;

    uint64_t v26 = sub_10004B330(v12, v14, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v15 = v5;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t aBlock = *(void *)&v15[qword_100064F68];
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    uint64_t aBlock = sub_10004B330(aBlock, v29, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "X-Apple-Request-UUID: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(unsigned char *)(v20 + 24) = a3 & 1;
  *(void *)(v20 + 32) = a1;
  *(void *)(v20 + 40) = a2;
  char v32 = sub_100022480;
  uint64_t v33 = v20;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  unint64_t v29 = 1107296256;
  char v30 = sub_100021DB8;
  char v31 = &unk_10005E628;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  unint64_t v22 = (objc_class *)sub_100008E28(&qword_1000644C0);
  v27.receiver = v15;
  v27.super_class = v22;
  [super performRequestWithHandler:v21];
  _Block_release(v21);
}

void sub_10001C918(uint64_t a1, uint64_t a2, char a3)
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100008D9C(v4, (uint64_t)qword_100067A00);
  uint64_t v5 = v3;
  unsigned int v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v26 = *(void *)&v5[qword_100064F68];
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    sub_1000224D8();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    if ((_BYTE)v26) {
      uint64_t v9 = 1414745936;
    }
    else {
      uint64_t v9 = 5522759;
    }
    if ((_BYTE)v26) {
      unint64_t v10 = 0xE400000000000000;
    }
    else {
      unint64_t v10 = 0xE300000000000000;
    }
    sub_10004B330(v9, v10, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    id v11 = [v5 urlString];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;

    uint64_t v26 = sub_10004B330(v12, v14, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v15 = v5;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t aBlock = *(void *)&v15[qword_100064F68];
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    uint64_t aBlock = sub_10004B330(aBlock, v29, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "X-Apple-Request-UUID: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(unsigned char *)(v20 + 24) = a3 & 1;
  *(void *)(v20 + 32) = a1;
  *(void *)(v20 + 40) = a2;
  char v32 = sub_100022724;
  uint64_t v33 = v20;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  unint64_t v29 = 1107296256;
  char v30 = sub_100021DB8;
  char v31 = &unk_10005E7B8;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  unint64_t v22 = (objc_class *)sub_100008E28(&qword_100064530);
  v27.receiver = v15;
  v27.super_class = v22;
  [super performRequestWithHandler:v21];
  _Block_release(v21);
}

void *sub_10001CF34()
{
  v38[1] = *v0;
  id v39 = v0;
  type metadata accessor for ModelConfiguration.CloudKitDatabase();
  __chkstk_darwin();
  int64_t v42 = (char *)v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ModelConfiguration.GroupContainer();
  __chkstk_darwin();
  SecCertificateRef v41 = (char *)v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for ModelConfiguration();
  uint64_t v45 = *(void *)(v43 - 8);
  __chkstk_darwin();
  uint64_t v46 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Schema.Version();
  __chkstk_darwin();
  id v40 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v47 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v5 = *(void *)(v47 - 8);
  __chkstk_darwin();
  os_log_type_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue_serial.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_100022940(0, &qword_100064550);
  static DispatchQoS.unspecified.getter();
  unint64_t v48 = _swiftEmptyArrayStorage;
  sub_100022840(&qword_100064558, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes);
  sub_100008E28(&qword_100064560);
  uint64_t v8 = v39;
  sub_100008EB4(&qword_100064568, &qword_100064560);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, void))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v47);
  v8[6] = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v8[7] = &_swiftEmptySetSingleton;
  sub_100008E28(&qword_100064570);
  uint64_t v9 = swift_allocObject();
  long long v47 = xmmword_10004DF40;
  *(_OWORD *)(v9 + 16) = xmmword_10004DF40;
  uint64_t v10 = type metadata accessor for APIRequestModel();
  uint64_t v11 = sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v11;
  Schema.Version.init(_:_:_:)();
  type metadata accessor for Schema();
  swift_allocObject();
  Schema.init(_:version:)();
  swift_retain();
  static ModelConfiguration.GroupContainer.none.getter();
  static ModelConfiguration.CloudKitDatabase.automatic.getter();
  uint64_t v12 = v46;
  ModelConfiguration.init(_:schema:isStoredInMemoryOnly:allowsSave:groupContainer:cloudKitDatabase:)();
  type metadata accessor for ModelContainer();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v47;
  *(void *)(v13 + 32) = v10;
  *(void *)(v13 + 40) = v11;
  uint64_t v14 = v43;
  sub_100008E28(&qword_100064578);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = v47;
  *(void *)(v15 + 56) = v14;
  *(void *)(v15 + 64) = sub_100022840(&qword_100064580, (void (*)(uint64_t))&type metadata accessor for ModelConfiguration);
  uint64_t v16 = v45;
  os_log_type_t v17 = sub_100022888((uint64_t *)(v15 + 32));
  (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 16))(v17, v12, v14);
  uint64_t v18 = v44;
  uint64_t v19 = ModelContainer.__allocating_init(for:configurations:)();
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v14);
LABEL_16:
    swift_release();

    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    return v8;
  }
  uint64_t v20 = v19;
  type metadata accessor for ModelContext();
  swift_allocObject();
  swift_retain();
  void v8[2] = ModelContext.init(_:)();
  v8[3] = v20;
  uint64_t v21 = self;
  swift_retain();
  id v22 = [v21 defaultStore];
  if (!v22)
  {
    sub_1000228EC();
    swift_allocError();
    *uint64_t v33 = 0xD000000000000023;
    v33[1] = 0x8000000100053150;
    swift_willThrow();
    swift_release();
    swift_release();
LABEL_15:
    (*(void (**)(char *, uint64_t))(v16 + 8))(v46, v14);
    swift_release();
    goto LABEL_16;
  }
  uint64_t v23 = v22;
  sub_100008E28(&qword_100064208);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = v47;
  *(void *)(v24 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v24 + 40) = v25;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v48 = 0;
  id v27 = [v23 accountsWithAccountTypeIdentifiers:isa error:&v48];

  id v28 = v48;
  if (!v27)
  {
    os_log_type_t v34 = v48;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_release();
    swift_release();

    uint64_t v16 = v45;
    goto LABEL_15;
  }
  sub_100022940(0, (unint64_t *)&unk_100064900);
  unint64_t v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v30 = v28;

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v16 = v45;
    if (v35) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  uint64_t v16 = v45;
  if (!*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:
    swift_bridgeObjectRelease();
    sub_1000228EC();
    swift_allocError();
    *uint64_t v36 = 0xD00000000000001BLL;
    v36[1] = 0x8000000100053180;
    swift_willThrow();
    swift_release();
    swift_release();

    goto LABEL_15;
  }
LABEL_7:
  if ((v29 & 0xC000000000000001) != 0)
  {
    id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v31 = *(id *)(v29 + 32);
  }
  id v32 = v31;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v46, v14);
  swift_release();
  swift_release();
  v8[4] = v23;
  v8[5] = v32;
  return v8;
}

uint64_t sub_10001D868(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  char v6 = a2;
  if (a2) {
    sub_10001E37C(a1, (uint64_t)&unk_10005E520, (uint64_t)sub_10002233C, (uint64_t)&unk_10005E538);
  }
  uint64_t v9 = *(void **)(v4 + 32);
  uint64_t v8 = *(void **)(v4 + 40);
  uint64_t v10 = (objc_class *)sub_100008E28(&qword_1000644C0);
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  uint64_t v12 = &v11[qword_100064F80];
  *(void *)uint64_t v12 = 0xD00000000000001DLL;
  *((void *)v12 + 1) = 0x8000000100053040;
  *(void *)&v11[qword_100064F88] = 0;
  *(void *)&v11[qword_100064F68] = a1;
  *(void *)&v11[qword_100064F70] = v8;
  *(void *)&v11[qword_100064F78] = v9;
  v37.receiver = v11;
  v37.super_class = v10;
  swift_retain();
  id v13 = v8;
  id v14 = v9;
  id v15 = [super init];
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v33 = a1;
  uint64_t v16 = type metadata accessor for Logger();
  sub_100008D9C(v16, (uint64_t)qword_100067A00);
  os_log_type_t v17 = (char *)v15;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    char v30 = v6;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v21 = *(void *)&v17[qword_100064F68];
    uint64_t v34 = v29;
    uint64_t v35 = v21;
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    uint64_t v35 = sub_10004B330(v21, v36, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Making request %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    char v6 = v30;
    swift_slowDealloc();
  }
  else
  {
  }
  *(void *)(swift_allocObject() + 16) = v17;
  sub_100008E28(&qword_1000644C8);
  swift_allocObject();
  id v22 = v17;
  uint64_t v35 = Future.init(_:)();
  sub_100008EB4(&qword_1000644D0, &qword_1000644C8);
  uint64_t v23 = Publisher.eraseToAnyPublisher()();
  swift_release();
  uint64_t v35 = v23;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  *(unsigned char *)(v24 + 24) = v6 & 1;
  *(void *)(v24 + 32) = v5;
  *(void *)(v24 + 40) = v33;
  *(void *)(v24 + 48) = a3;
  *(void *)(v24 + 56) = a4;
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = v22;
  v25[3] = a3;
  v25[4] = a4;
  uint64_t v26 = v22;
  swift_retain_n();
  swift_retain();
  id v27 = v26;
  swift_retain();
  sub_100008E28(&qword_1000644D8);
  sub_100008EB4(&qword_1000644E0, &qword_1000644D8);
  Publisher.sink(receiveCompletion:receiveValue:)();
  swift_release();
  swift_release();
  swift_release();
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();

  return swift_release();
}

void sub_10001DDD0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, void *a5, char a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100008D9C(v15, (uint64_t)qword_100067A00);
  uint64_t v16 = a5;
  os_log_type_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v31 = a2;
    os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v19 = 136315138;
    uint64_t v35 = v30;
    v34[0] = *(void *)&v16[qword_100064F68];
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    v34[0] = sub_10004B330(v34[0], v34[1], &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Request completed: %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v31;
    swift_slowDealloc();
  }
  else
  {
  }
  if (a4 != 0xFF)
  {
    uint64_t v20 = a9;
    uint64_t v21 = a4 & 1;
    sub_10002238C(a1, a2, a3, a4);
    sub_1000223B0();
    id v22 = Logger.logObject.getter();
    unsigned __int8 v23 = a4;
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v24))
    {
      unsigned __int8 v25 = v23;
      char v33 = a6;
      uint64_t v26 = swift_slowAlloc();
      v34[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 134218242;
      uint64_t v35 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v26 + 12) = 2080;
      sub_1000223B0();
      if (v21)
      {
        uint64_t v27 = Dictionary.description.getter();
        unint64_t v29 = v28;
        sub_100022580(a1, a2, a3, v25);
      }
      else
      {
        uint64_t v27 = a2;
        unint64_t v29 = a3;
      }
      uint64_t v35 = sub_10004B330(v27, v29, v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100022580(a1, a2, a3, v25);
      sub_100022580(a1, a2, a3, v25);
      _os_log_impl((void *)&_mh_execute_header, v22, v24, "[%ld] Request failed: %s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v20 = a9;
      uint64_t v21 = v21;
      if ((v33 & 1) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      sub_100022580(a1, a2, a3, v23);
      sub_100022580(a1, a2, a3, v23);

      if ((a6 & 1) == 0)
      {
LABEL_19:
        LOBYTE(v34[0]) = 1;
        v20(v34, a1, a2, a3, v21);
        return;
      }
    }
    if (a1 >= 200 && a1 < 500) {
      sub_10001E37C(a8, (uint64_t)&unk_10005E570, (uint64_t)sub_1000223CC, (uint64_t)&unk_10005E588);
    }
    goto LABEL_19;
  }
  if (a6) {
    sub_10001E37C(a8, (uint64_t)&unk_10005E570, (uint64_t)sub_1000223CC, (uint64_t)&unk_10005E588);
  }
}

uint64_t sub_10001E37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(void *)(v4 + 48);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = v4;
  aBlock[4] = a3;
  id aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C2B8;
  aBlock[3] = a4;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v20 = _swiftEmptyArrayStorage;
  sub_100022840((unint64_t *)&unk_100064DA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100008E28(&qword_1000640F0);
  sub_100008EB4((unint64_t *)&unk_100064DB0, &qword_1000640F0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v19);
  return swift_release();
}

uint64_t sub_10001E634(void *a1, uint64_t (*a2)(uint64_t *, void, void, void, uint64_t))
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100008D9C(v4, (uint64_t)qword_100067A00);
  uint64_t v5 = a1;
  char v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v12 = v10;
    v11[0] = *(void *)&v5[qword_100064F68];
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    v11[0] = sub_10004B330(v11[0], v11[1], &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Request successful: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  LOBYTE(v11[0]) = 0;
  return a2(v11, 0, 0, 0, 255);
}

void sub_10001E8F8()
{
  dispatch thunk of ModelContext.save()();
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100008D9C(v0, (uint64_t)qword_100067A00);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "SQL: Saved", v2, 2u);
    swift_slowDealloc();
  }
}

void sub_10001EBB8(uint64_t a1, uint64_t a2, const char *a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100008D9C(v7, (uint64_t)qword_100067A00);
  swift_retain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v15 = v11;
    swift_getKeyPath();
    sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    sub_10004B330(a1, v14, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, a3, v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v12 = type metadata accessor for APIRequestModel();
  uint64_t v13 = sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  a4(a1, v12, v13);
  sub_10001E8F8();
}

uint64_t sub_10001EEAC()
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for APIManager()
{
  return self;
}

uint64_t sub_10001EF30()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + 48);
  aBlock[4] = sub_1000225AC;
  uint64_t v13 = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C2B8;
  aBlock[3] = &unk_10005E6A0;
  os_log_type_t v9 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v11[1] = _swiftEmptyArrayStorage;
  sub_100022840((unint64_t *)&unk_100064DA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100008E28(&qword_1000640F0);
  sub_100008EB4((unint64_t *)&unk_100064DB0, &qword_1000640F0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_10001F1D4(uint64_t a1)
{
  uint64_t v2 = sub_100008E28(&qword_100064510);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = sub_100008E28(&qword_100064518);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = ((char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_100063EA0 != -1) {
    goto LABEL_20;
  }
  while (1)
  {
    uint64_t v9 = type metadata accessor for Logger();
    uint64_t v10 = sub_100008D9C(v9, (uint64_t)qword_100067A00);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Retrying pending requests...", v13, 2u);
      swift_slowDealloc();
    }

    uint64_t v14 = sub_100008E28(&qword_100064520);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
    type metadata accessor for APIRequestModel();
    uint64_t v15 = sub_100022840(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    FetchDescriptor.init(predicate:sortBy:)();
    uint64_t v4 = 0;
    unint64_t v16 = dispatch thunk of ModelContext.fetch<A>(_:)();
    os_log_type_t v17 = *(void (**)(NSObject *, unint64_t))(v6 + 8);
    v6 += 8;
    v17(v8, v5);
    if (!(v16 >> 62))
    {
      uint64_t v19 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v19) {
        break;
      }
      goto LABEL_6;
    }
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v19) {
      break;
    }
LABEL_6:
    unint64_t v5 = 0;
    unint64_t v35 = v16 & 0xC000000000000001;
    v29[0] = v16 & 0xFFFFFFFFFFFFFF8;
    *(void *)&long long v18 = 136315138;
    long long v30 = v18;
    v29[1] = (char *)&type metadata for Any + 8;
    uint64_t v31 = v15;
    uint64_t v32 = v10;
    uint64_t v33 = a1;
    uint64_t v34 = (char *)v19;
    while (v35)
    {
      uint64_t v23 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v4 = (char *)(v5 + 1);
      if (__OFADD__(v5, 1)) {
        goto LABEL_18;
      }
LABEL_15:
      swift_retain_n();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.default.getter();
      uint64_t v6 = v24;
      if (os_log_type_enabled(v8, v24))
      {
        uint64_t v25 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = v30;
        uint64_t v36 = v23;
        swift_getKeyPath();
        sub_100022840(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        swift_getKeyPath();
        PersistentModel.getValue<A>(forKey:)();
        swift_release();
        *(void *)(v25 + 4) = sub_10004B330(v36, v37, &v38);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v8, (os_log_type_t)v6, "Retrying: %s", (uint8_t *)v25, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        a1 = v33;
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      uint64_t v20 = swift_allocObject();
      swift_weakInit();
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = v20;
      *(void *)(v21 + 24) = v23;
      uint64_t v22 = swift_retain();
      sub_10001D868(v22, 0, (uint64_t)sub_100022630, v21);
      swift_release();
      swift_release();
      ++v5;
      if (v4 == v34)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    if (v5 >= *(void *)(v29[0] + 16)) {
      goto LABEL_19;
    }
    uint64_t v23 = *(void *)(v16 + 8 * v5 + 32);
    swift_retain();
    uint64_t v4 = (char *)(v5 + 1);
    if (!__OFADD__(v5, 1)) {
      goto LABEL_15;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    swift_once();
  }
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    unint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Nothing to retry, we are good 😉", v28, 2u);
    swift_slowDealloc();
  }
  swift_bridgeObjectRelease();
}

void sub_10001F958(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, uint64_t a7)
{
  if (*a1)
  {
    if (a5 != 0xFF)
    {
      sub_1000223B0();
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      sub_100008D9C(v11, (uint64_t)qword_100067A00);
      sub_1000223B0();
      oslog = Logger.logObject.getter();
      os_log_type_t v12 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        v19[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315138;
        swift_bridgeObjectRetain();
        if (a5)
        {
          uint64_t v14 = Dictionary.description.getter();
          unint64_t v16 = v15;
          sub_100022580(a2, a3, a4, a5);
        }
        else
        {
          uint64_t v14 = a3;
          unint64_t v16 = a4;
        }
        v19[3] = sub_10004B330(v14, v16, v19);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100022580(a2, a3, a4, a5);
        sub_100022580(a2, a3, a4, a5);
        _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Retry failed with error: %s", v13, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100022580(a2, a3, a4, a5);
        sub_100022580(a2, a3, a4, a5);
      }
    }
  }
  else
  {
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      sub_10001E37C(a7, (uint64_t)&unk_10005E570, (uint64_t)sub_1000223CC, (uint64_t)&unk_10005E588);
      swift_release();
    }
  }
}

uint64_t sub_10001FC64()
{
  uint64_t v1 = v0;
  type metadata accessor for Date();
  __chkstk_darwin();
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [self standardUserDefaults];
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [v8 valueForKey:v9];

  if (v10)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v32, 0, sizeof(v32));
  }
  sub_10000FF80((uint64_t)v32, (uint64_t)&v33);
  if (!v36)
  {
    sub_10000FECC((uint64_t)&v33);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    double v11 = 0.0;
    goto LABEL_9;
  }
  double v11 = v30 + 1.0;
LABEL_9:
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  uint64_t v33 = *(void *)&v11;
  char v34 = 0;
  uint64_t v35 = 100;
  sub_100022638();
  uint64_t v12 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v14 = v13;
  swift_release();
  UUID.init()();
  uint64_t v15 = UUID.uuidString.getter();
  unint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100014948(v12, v14);
  Date.init()();
  type metadata accessor for APIRequestModel();
  swift_allocObject();
  long long v18 = sub_1000354F8(v15, v17, v12, v14, 1, 0xD000000000000011, 0x8000000100053110, 1, v3);
  sub_100009000(v12, v14);
  uint64_t v20 = *(void **)(v1 + 32);
  uint64_t v19 = *(void **)(v1 + 40);
  uint64_t v21 = (char *)objc_allocWithZone((Class)type metadata accessor for FetchSenderOverridesAPIRequest());
  uint64_t v22 = &v21[qword_100064F80];
  *(void *)uint64_t v22 = 0xD00000000000001DLL;
  *((void *)v22 + 1) = 0x8000000100053040;
  *(void *)&v21[qword_100064F88] = 0;
  *(void *)&v21[qword_100064F68] = v18;
  *(void *)&v21[qword_100064F70] = v19;
  *(void *)&v21[qword_100064F78] = v20;
  swift_retain();
  id v23 = v19;
  id v24 = v20;
  uint64_t v25 = (objc_class *)sub_100008E28(&qword_100064530);
  v31.receiver = v21;
  v31.super_class = v25;
  id v26 = [super init];
  *(void *)(swift_allocObject() + 16) = v26;
  sub_100008E28(&qword_100064538);
  swift_allocObject();
  id v27 = v26;
  uint64_t v33 = Future.init(_:)();
  sub_100008EB4(&qword_100064540, &qword_100064538);
  uint64_t v28 = Publisher.eraseToAnyPublisher()();
  swift_release();

  swift_release();
  sub_100009000(v12, v14);
  return v28;
}

uint64_t sub_1000200F0(void *a1)
{
  uint64_t v2 = type metadata accessor for Date();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v52 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v51 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (id)sub_10003F234((uint64_t)_swiftEmptyArrayStorage);
  id v8 = [a1 xAppleRequestHeader];
  if (v8)
  {
    NSString v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v53 = v7;
    sub_10004221C(v10, v12, 0x5F656C7070615F78, 0xEC00000064697575, isUniquelyReferenced_nonNull_native);
    id v7 = v53;
    swift_bridgeObjectRelease();
  }
  id v14 = [a1 messageIdHeader];
  uint64_t v50 = v5;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = v17;

    char v19 = swift_isUniquelyReferenced_nonNull_native();
    id v53 = v7;
    sub_10004221C(v16, v18, 0x5F6567617373656DLL, 0xEA00000000006469, v19);
    id v7 = v53;
    swift_bridgeObjectRelease();
  }
  unint64_t v20 = 0xEB00000000646572;
  uint64_t v21 = 0x657474756C636544;
  id v22 = [a1 category];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  Swift::String v23 = String.lowercased()();
  swift_bridgeObjectRelease();
  if (v23._countAndFlagsBits == 0x746C7561666564 && v23._object == (void *)0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    id v24 = v4;
    uint64_t v25 = v50;
  }
  else
  {
    char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    id v24 = v4;
    uint64_t v25 = v50;
    if ((v26 & 1) == 0)
    {
      id v27 = [a1 category];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v20 = v28;
    }
  }
  sub_100008E28(&qword_1000644A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E760;
  *(void *)(inited + 32) = 0x736567617373656DLL;
  *(void *)(inited + 40) = 0xE800000000000000;
  sub_100008E28(&qword_1000644B0);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_10004DF40;
  *(void *)(v30 + 32) = v7;
  uint64_t v31 = sub_100008E28(&qword_1000644B8);
  *(void *)(inited + 48) = v30;
  *(void *)(inited + 72) = v31;
  *(void *)(inited + 80) = 0x79726F6765746163;
  *(void *)(inited + 88) = 0xE800000000000000;
  *(void *)(inited + 96) = v21;
  *(void *)(inited + 104) = v20;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x6D617473656D6974;
  *(void *)(inited + 136) = 0xE900000000000070;
  id v32 = [a1 categoryUpdateTime];
  [v32 doubleValue];
  double v34 = v33;

  *(void *)(inited + 168) = &type metadata for Double;
  *(double *)(inited + 144) = v34 * 1000.0;
  sub_10003ED98(inited);
  uint64_t v35 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v53 = 0;
  id v37 = [v35 dataWithJSONObject:isa options:0 error:&v53];

  id v38 = v53;
  if (v37)
  {
    uint64_t v39 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v41 = v40;
  }
  else
  {
    int64_t v42 = v38;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v39 = 0;
    unint64_t v41 = 0xF000000000000000;
  }
  uint64_t v43 = v51;
  UUID.init()();
  uint64_t v44 = UUID.uuidString.getter();
  unint64_t v46 = v45;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v43, v25);
  sub_100014948(v39, v41);
  Date.init()();
  type metadata accessor for APIRequestModel();
  swift_allocObject();
  long long v47 = sub_1000354F8(v44, v46, v39, v41, 1, 0xD000000000000017, 0x8000000100053020, 1, v24);
  sub_100009000(v39, v41);
  sub_10001D868((uint64_t)v47, 1, (uint64_t)sub_100020730, 0);
  swift_release();
  return sub_100009000(v39, v41);
}

void sub_100020730(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
}

uint64_t sub_100020744(double a1)
{
  uint64_t v2 = type metadata accessor for Date();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008E28(&qword_100064590);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004DF40;
  *(void *)(inited + 32) = 0x6D617473656D6974;
  *(void *)(inited + 40) = 0xE900000000000070;
  *(double *)(inited + 48) = a1 * 1000.0;
  sub_10003F358(inited);
  uint64_t v10 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v24 = 0;
  id v12 = [v10 dataWithJSONObject:isa options:0 error:&v24];

  id v13 = v24;
  if (v12)
  {
    uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v16 = v15;
  }
  else
  {
    uint64_t v17 = v13;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v14 = 0;
    unint64_t v16 = 0xF000000000000000;
  }
  UUID.init()();
  uint64_t v18 = UUID.uuidString.getter();
  unint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100014948(v14, v16);
  Date.init()();
  type metadata accessor for APIRequestModel();
  swift_allocObject();
  uint64_t v21 = sub_1000354F8(v18, v20, v14, v16, 1, 0xD000000000000014, 0x80000001000531A0, 1, v4);
  sub_100009000(v14, v16);
  sub_10001D868((uint64_t)v21, 1, (uint64_t)sub_100020A70, 0);
  swift_release();
  return sub_100009000(v14, v16);
}

void sub_100020A70(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
}

void sub_100020A84(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, const char *a6, const char *a7)
{
  if (a5 == 0xFF)
  {
    if (*a1) {
      return;
    }
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100008D9C(v19, (uint64_t)qword_100067A00);
    oslog = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v20, a7, v21, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    sub_1000223B0();
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100008D9C(v12, (uint64_t)qword_100067A00);
    sub_1000223B0();
    oslog = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      if (a5)
      {
        uint64_t v15 = Dictionary.description.getter();
        unint64_t v17 = v16;
        sub_100022580(a2, a3, a4, a5);
      }
      else
      {
        uint64_t v15 = a3;
        unint64_t v17 = a4;
      }
      sub_10004B330(v15, v17, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100022580(a2, a3, a4, a5);
      sub_100022580(a2, a3, a4, a5);
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, a6, v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    sub_100022580(a2, a3, a4, a5);
    sub_100022580(a2, a3, a4, a5);
  }
}

uint64_t sub_100020DDC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100008E28(&qword_100064500);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v26 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(v3 + 63) >> 6;
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
      goto LABEL_26;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    ++v8;
    if (!v14)
    {
      int64_t v8 = v13 + 1;
      if (v13 + 1 >= v27) {
        goto LABEL_35;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v8);
      if (!v14)
      {
        int64_t v8 = v13 + 2;
        if (v13 + 2 >= v27) {
          goto LABEL_35;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v8);
        if (!v14) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_26:
    unint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_10000A6C0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v39);
    *(void *)&long long v38 = v18;
    *((void *)&v38 + 1) = v17;
    _OWORD v36[2] = v38;
    v37[0] = v39[0];
    v37[1] = v39[1];
    *(void *)&v36[0] = v18;
    *((void *)&v36[0] + 1) = v17;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000A71C(v37, v31);
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_10000A71C(v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_10000A71C(v35, v36);
    sub_10000A71C(v36, &v32);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_10000A71C(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v27)
  {
LABEL_35:
    swift_release();
    swift_release();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v15);
  if (v14)
  {
    int64_t v8 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v8 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v8);
    ++v15;
    if (v14) {
      goto LABEL_25;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100021160(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100008E28(&qword_100064500);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
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
    uint64_t v17 = *(void **)(*(void *)(a1 + 48) + 8 * v12);
    sub_10000A6C0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v39 + 8);
    *(void *)&v39[0] = v17;
    v37[0] = v39[0];
    v37[1] = v39[1];
    uint64_t v38 = v40;
    *(void *)&v36[0] = v17;
    sub_100022940(0, (unint64_t *)&qword_100064E00);
    id v18 = v17;
    swift_dynamicCast();
    sub_10000A71C((_OWORD *)((char *)v37 + 8), v31);
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_10000A71C(v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_10000A71C(v35, v36);
    sub_10000A71C(v36, &v32);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_10000A71C(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1000225A4();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
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
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_100021538(void *a1, void *a2, uint64_t a3, uint64_t a4, char a5, void (*a6)(void *, void *, uint64_t), uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v17 = (char *)Strong;
    if (a2 && [a2 statusCode] == (id)401 && (a5 & 1) != 0)
    {
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for Logger();
      sub_100008D9C(v18, (uint64_t)qword_100067A00);
      id v19 = a1;
      id v20 = a2;
      unint64_t v21 = v19;
      id v22 = v20;
      unint64_t v23 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.error.getter();
      unint64_t v46 = v21;
      long long v47 = v22;
      if (os_log_type_enabled(v23, v45))
      {
        uint64_t v44 = a7;
        uint64_t v24 = swift_slowAlloc();
        uint64_t v25 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 138412546;
        if (a1)
        {
          int64_t v26 = v21;
          aBlock[0] = v21;
          uint64_t v27 = v21;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
        }
        else
        {
          aBlock[0] = 0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          int64_t v26 = v21;
        }
        *uint64_t v25 = a1;

        *(_WORD *)(v24 + 12) = 2112;
        aBlock[0] = v47;
        id v28 = v47;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v25[1] = a2;

        _os_log_impl((void *)&_mh_execute_header, v23, v45, "401 response from server for request %@ response %@", (uint8_t *)v24, 0x16u);
        sub_100008E28(&qword_1000651F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        a7 = v44;
      }
      else
      {

        unint64_t v23 = v21;
      }

      sub_100008E28(&qword_1000644A8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10004E280;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 40) = v30;
      *(void *)(inited + 72) = &type metadata for Bool;
      *(unsigned char *)(inited + 48) = 1;
      *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 88) = v31;
      sub_100008E28(&qword_100064208);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_10004DF40;
      uint64_t v33 = *(void *)&v17[qword_100064F80 + 8];
      *(void *)(v32 + 32) = *(void *)&v17[qword_100064F80];
      *(void *)(v32 + 40) = v33;
      *(void *)(inited + 120) = sub_100008E28(&qword_100063EF8);
      *(void *)(inited + 96) = v32;
      swift_bridgeObjectRetain();
      unint64_t v34 = sub_10003ED98(inited);
      uint64_t v35 = *(void **)&v17[qword_100064F70];
      id v36 = *(id *)&v17[qword_100064F78];
      id v37 = v35;
      sub_100020DDC(v34);
      swift_bridgeObjectRelease();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v39 = (void *)swift_allocObject();
      _OWORD v39[2] = a6;
      v39[3] = a7;
      v39[4] = a1;
      v39[5] = a2;
      v39[6] = v17;
      aBlock[4] = a9;
      void aBlock[5] = v39;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100021D40;
      aBlock[3] = a10;
      uint64_t v40 = _Block_copy(aBlock);
      unint64_t v41 = v46;
      id v42 = v47;
      swift_retain();
      uint64_t v43 = v17;
      swift_release();
      [v36 renewCredentialsForAccount:v37 options:isa completion:v40];
      _Block_release(v40);

      uint64_t v17 = (char *)isa;
    }
    else
    {
      a6(a1, a2, a3);
    }
  }
}

uint64_t sub_100021A28(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void, uint64_t, void))
{
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v24 = type metadata accessor for Logger();
      sub_100008D9C(v24, (uint64_t)qword_100067A00);
      unint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_22;
      }
      int64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v16 = 0;
      uint64_t v17 = "auth token renew failed. User rejected.";
    }
    else if (a1 == 2)
    {
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for Logger();
      sub_100008D9C(v13, (uint64_t)qword_100067A00);
      unint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_22;
      }
      int64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v16 = 0;
      uint64_t v17 = "auth token renew failed.";
    }
    else
    {
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v25 = type metadata accessor for Logger();
      sub_100008D9C(v25, (uint64_t)qword_100067A00);
      unint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_22;
      }
      int64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v16 = 0;
      uint64_t v17 = "auth token renew failed. @unknown result";
    }
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v17, v16, 2u);
    swift_slowDealloc();
LABEL_22:

    return a3(a5, a6, a2);
  }
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  sub_100008D9C(v19, (uint64_t)qword_100067A00);
  id v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "auth token renewed. Retrying request with server.", v22, 2u);
    swift_slowDealloc();
  }

  return a8(a3, a4, 0);
}

void sub_100021D40(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100021DB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(void *, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(a2, a3, a4);
  swift_release();
}

uint64_t sub_100021E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  swift_retain();
  a6(a5, v10, 1);

  return swift_release();
}

uint64_t sub_100021EEC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(long long *))
{
  if (a2 && (sub_100008E28(&qword_100064508), (unint64_t v5 = (void *)swift_dynamicCastClass()) != 0))
  {
    id v6 = (char *)v5 + *(void *)((swift_isaMask & *v5) + 0x60);
    if (v6[25] == 1)
    {
      uint64_t v8 = *((void *)v6 + 1);
      uint64_t v7 = *((void *)v6 + 2);
      uint64_t v9 = *(void *)v6;
      uint64_t v10 = v6[24];
      *(void *)&long long v12 = v9;
      *((void *)&v12 + 1) = v8;
      unint64_t v13 = v7;
      LOBYTE(v14) = v10 & 1;
      HIBYTE(v14) = 1;
      sub_100022548(v9, v8, v7, v10, 1);
      a4(&v12);
      return sub_100022564(v9, v8, v7, v10, 1);
    }
    long long v12 = 0uLL;
    __int16 v14 = 0;
    unint64_t v13 = 0;
  }
  else
  {
    long long v12 = xmmword_10004E770;
    unint64_t v13 = 0x80000001000530C0;
    __int16 v14 = 256;
  }
  return ((uint64_t (*)(long long *))a4)(&v12);
}

uint64_t sub_100022028(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(long long *))
{
  if (a2 && (sub_100008E28(&qword_100064548), (unint64_t v5 = (void *)swift_dynamicCastClass()) != 0))
  {
    id v6 = (char *)v5 + *(void *)((swift_isaMask & *v5) + 0x60);
    uint64_t v7 = *(void *)v6;
    uint64_t v8 = *((void *)v6 + 1);
    uint64_t v9 = *((void *)v6 + 2);
    uint64_t v10 = v6[24];
    if (v6[25])
    {
      *(void *)&long long v12 = *(void *)v6;
      *((void *)&v12 + 1) = v8;
      unint64_t v13 = v9;
      LOBYTE(v14) = v10 & 1;
      HIBYTE(v14) = 1;
      sub_100022808(v7, v8, v9, v10, 1);
      a4(&v12);
      return sub_100022824(v7, v8, v9, v10, 1);
    }
    else
    {
      unint64_t v13 = 0;
      long long v12 = (unint64_t)v7;
      __int16 v14 = 0;
      sub_100022808(v7, v8, v9, v10, 0);
      sub_100022808(v7, v8, v9, v10, 0);
      swift_bridgeObjectRetain();
      a4(&v12);
      swift_bridgeObjectRelease();
      sub_100022824(v7, v8, v9, v10, 0);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    long long v12 = xmmword_10004E770;
    unint64_t v13 = 0x80000001000530C0;
    __int16 v14 = 256;
    return ((uint64_t (*)(long long *))a4)(&v12);
  }
}

uint64_t sub_1000221CC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100022204(uint64_t a1, uint64_t a2)
{
  return sub_100021E60(a1, a2, *(void *)(v2 + 16), (uint64_t)&unk_10005E5C0, (uint64_t)sub_10002243C, (void (*)(uint64_t, uint64_t, uint64_t))sub_10001C2FC);
}

uint64_t sub_100022250()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000222A0(uint64_t a1)
{
  sub_10001DDD0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), *(void **)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 48));
}

uint64_t sub_1000222E4()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100022324()
{
  return sub_10001E634(*(void **)(v0 + 16), *(uint64_t (**)(uint64_t *, void, void, void, uint64_t))(v0 + 24));
}

void sub_10002233C()
{
  sub_10001EBB8(*(void *)(v0 + 16), *(void *)(v0 + 24), "SQL: Inserting request: %s", (void (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of ModelContext.insert<A>(_:));
}

uint64_t sub_100022374(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100022384()
{
  return swift_release();
}

uint64_t sub_10002238C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    return sub_1000223B0();
  }
  return result;
}

uint64_t sub_1000223B0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000223BC()
{
  return swift_bridgeObjectRelease();
}

void sub_1000223CC()
{
  sub_10001EBB8(*(void *)(v0 + 16), *(void *)(v0 + 24), "SQL: Deleting request for: %s", (void (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of ModelContext.delete<A>(_:));
}

uint64_t sub_100022404()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002243C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100021EEC(a1, a2, a3, *(void (**)(long long *))(v3 + 16));
}

uint64_t sub_100022444()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100022480(void *a1, void *a2, uint64_t a3)
{
  sub_100021538(a1, a2, a3, *(void *)(v3 + 16), *(unsigned char *)(v3 + 24), *(void (**)(void *, void *, uint64_t))(v3 + 32), *(void *)(v3 + 40), (uint64_t)&unk_10005E660, (uint64_t)sub_100022530, (uint64_t)&unk_10005E678);
}

unint64_t sub_1000224D8()
{
  unint64_t result = qword_1000644F8;
  if (!qword_1000644F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000644F8);
  }
  return result;
}

uint64_t sub_100022530(uint64_t a1, uint64_t a2)
{
  return sub_1000227E0(a1, a2, (uint64_t (*)(void, uint64_t, void))sub_10001C2FC);
}

uint64_t sub_100022548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return sub_1000223B0();
  }
  return result;
}

uint64_t sub_100022564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return sub_1000223BC();
  }
  return result;
}

uint64_t sub_100022580(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    return sub_1000223BC();
  }
  return result;
}

uint64_t sub_1000225A4()
{
  return swift_release();
}

void sub_1000225AC()
{
  sub_10001F1D4(v0);
}

uint64_t sub_1000225B4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000225F0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100022630(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  sub_10001F958(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24));
}

unint64_t sub_100022638()
{
  unint64_t result = qword_100064528;
  if (!qword_100064528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064528);
  }
  return result;
}

uint64_t sub_10002268C(uint64_t a1, uint64_t a2)
{
  return sub_100021E60(a1, a2, *(void *)(v2 + 16), (uint64_t)&unk_10005E750, (uint64_t)sub_1000226D8, (void (*)(uint64_t, uint64_t, uint64_t))sub_10001C918);
}

uint64_t sub_1000226D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100022028(a1, a2, a3, *(void (**)(long long *))(v3 + 16));
}

uint64_t sub_1000226E4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100022724(void *a1, void *a2, uint64_t a3)
{
  sub_100021538(a1, a2, a3, *(void *)(v3 + 16), *(unsigned char *)(v3 + 24), *(void (**)(void *, void *, uint64_t))(v3 + 32), *(void *)(v3 + 40), (uint64_t)&unk_10005E7F0, (uint64_t)sub_1000227C8, (uint64_t)&unk_10005E808);
}

uint64_t sub_100022778()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000227C8(uint64_t a1, uint64_t a2)
{
  return sub_1000227E0(a1, a2, (uint64_t (*)(void, uint64_t, void))sub_10001C918);
}

uint64_t sub_1000227E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, void))
{
  return sub_100021A28(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), a3);
}

uint64_t sub_100022808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return sub_1000223B0();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100022824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return sub_1000223BC();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100022840(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_100022888(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1000228EC()
{
  unint64_t result = qword_100064588;
  if (!qword_100064588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064588);
  }
  return result;
}

uint64_t sub_100022940(uint64_t a1, unint64_t *a2)
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

id EFFuture.isFinished.getter()
{
  return [*(id *)(v0 + 16) isFinished];
}

id EFFuture.isCancelled.getter()
{
  return [*(id *)(v0 + 16) isCancelled];
}

uint64_t EFFuture.__allocating_init<A>(_:)()
{
  uint64_t v0 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v0;
}

uint64_t EFFuture.init<A>(_:)()
{
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    *(void *)(v0 + 16) = result;
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = static EFFuture.asAnyObject(_:)(a1);
  if (result)
  {
    id v4 = [self futureWithResult:result];
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))(a1);
    uint64_t v5 = swift_allocObject();
    EFFuture.init<A>(_:)();
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static EFFuture.asAnyObject(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - v6;
  uint64_t v8 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - v6, a1, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  BOOL v9 = sub_100024A04((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = 0;
  if (!v9) {
    return _bridgeAnythingToObjectiveC<A>(_:)();
  }
  return result;
}

uint64_t EFFuture.__allocating_init(_:)()
{
  uint64_t v0 = (void *)_convertErrorToNSError(_:)();
  id v1 = [self futureWithError:v0];
  swift_errorRelease();

  uint64_t v2 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v2;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = *(void *)(v2 + 80);
  v5[3] = a1;
  v5[4] = a2;
  v11[4] = sub_100024C68;
  v11[5] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  void v11[2] = sub_100022F6C;
  v11[3] = &unk_10005E858;
  uint64_t v6 = _Block_copy(v11);
  uint64_t v7 = self;
  swift_retain();
  id v8 = [v7 futureWithBlock:v6];
  _Block_release(v6);
  swift_release();
  swift_release();
  uint64_t v9 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v9;
}

uint64_t sub_100022E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  uint64_t v6 = __chkstk_darwin(a1);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  type metadata accessor for EFFuture();
  uint64_t v10 = static EFFuture.asAnyObject(_:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v10;
}

id sub_100022F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = (void *)v3(a2);
  swift_release();

  return v4;
}

uint64_t EFFuture.result()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *((void *)*v1 + 10);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - v6;
  id v8 = [v1[2] result];
  uint64_t v9 = swift_unknownObjectRetain();
  static EFFuture.asValue(_:)(v9, v7);
  swift_unknownObjectRelease();
  uint64_t v10 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v3) == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __break(1u);
  }
  else
  {
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v7, v3);
  }
  return result;
}

uint64_t static EFFuture.asValue(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 80);
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v15 - v8;
  v15[1] = a1;
  swift_unknownObjectRetain();
  sub_100008E28(qword_100064598);
  int v10 = swift_dynamicCast();
  uint64_t v11 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  if (v10)
  {
    uint64_t v12 = *(void *)(v5 - 8);
    v11(v9, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a2, v9, v5);
    return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v11)(a2, 0, 1, v5);
  }
  else
  {
    v11(v9, 1, 1, v5);
    v15[0] = [objc_allocWithZone((Class)NSNull) init];
    int v14 = swift_dynamicCast();
    v11(a2, v14 ^ 1u, 1, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t EFFuture.result(withTimeout:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v17 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = (void *)v2[2];
  id v18 = 0;
  id v10 = [v9 resultWithTimeout:&v18 error:a2];
  id v11 = v18;
  if (v10)
  {
    uint64_t v12 = swift_unknownObjectRetain();
    static EFFuture.asValue(_:)(v12, v8);
    swift_unknownObjectRelease();
    uint64_t v13 = *(void *)(v5 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v5) == 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v6);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v8, v5);
    }
  }
  else
  {
    os_log_type_t v15 = v11;
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.result(beforeDate:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(*v1 + 80);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v16 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v15 - v5;
  uint64_t v7 = (void *)v1[2];
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v17 = 0;
  id v9 = [v7 resultBeforeDate:isa error:&v17];

  id v10 = v17;
  if (v9)
  {
    uint64_t v11 = swift_unknownObjectRetain();
    static EFFuture.asValue(_:)(v11, v6);
    swift_unknownObjectRelease();
    uint64_t v12 = *(void *)(v3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v3) == 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v6, v4);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v6, v3);
    }
  }
  else
  {
    int v14 = v10;
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.onSuccess(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)v3[2];
  id v9 = (void *)swift_allocObject();
  void v9[2] = *(void *)(v7 + 80);
  v9[3] = a2;
  v9[4] = a3;
  v12[4] = sub_100024C8C;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100023B30;
  v12[3] = &unk_10005E8A8;
  id v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v8 onScheduler:a1 addSuccessBlock:v10];
  _Block_release(v10);
  return swift_retain();
}

uint64_t sub_100023950(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v16 - v10;
  uint64_t v12 = *(void *)(a4 - 8);
  __chkstk_darwin(v9);
  int v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture();
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    a2(v14);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a4);
  }
  return result;
}

uint64_t sub_100023B30(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t EFFuture.onError(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)(v3 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  v11[4] = sub_100024C98;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  void v11[2] = sub_100023C90;
  v11[3] = &unk_10005E8F8;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  swift_release();
  [v7 onScheduler:a1 addFailureBlock:v9];
  _Block_release(v9);
  return swift_retain();
}

void sub_100023C90(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t EFFuture.always(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)(v3 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  v11[4] = sub_100024CF8;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  void v11[2] = sub_10001C2B8;
  v11[3] = &unk_10005E948;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  swift_release();
  [v7 onScheduler:a1 always:v9];
  _Block_release(v9);
  return swift_retain();
}

uint64_t EFFuture.then<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for EFFuture();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = *(void *)(v9 + 80);
  v11[3] = a4;
  v11[4] = a2;
  v11[5] = a3;
  v16[4] = sub_100024D70;
  v16[5] = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100024148;
  v16[3] = &unk_10005E998;
  uint64_t v12 = _Block_copy(v16);
  swift_retain();
  swift_release();
  id v13 = [v10 onScheduler:a1 then:v12];
  _Block_release(v12);
  uint64_t v14 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v14;
}

uint64_t sub_100023F4C(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = *(void *)(a4 - 8);
  __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture();
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    uint64_t v15 = a2(v14);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    id v16 = *(id *)(v15 + 16);
    swift_release();
    return (uint64_t)v16;
  }
  return result;
}

id sub_100024148(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();
  swift_unknownObjectRelease();

  return v3;
}

uint64_t EFFuture.recover<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for EFFuture();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = *(void *)(v9 + 80);
  v11[3] = a4;
  v11[4] = a2;
  v11[5] = a3;
  v16[4] = sub_100024D7C;
  v16[5] = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10002430C;
  v16[3] = &unk_10005E9E8;
  uint64_t v12 = _Block_copy(v16);
  swift_retain();
  swift_release();
  id v13 = [v10 onScheduler:a1 recover:v12];
  _Block_release(v12);
  uint64_t v14 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v14;
}

id sub_10002430C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t EFFuture.map<A>(on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for EFFuture();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = *(void *)(v9 + 80);
  void v11[2] = v12;
  v11[3] = a4;
  v11[4] = a2;
  v11[5] = a3;
  id v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a4;
  v13[4] = sub_100024DC0;
  v13[5] = v11;
  v18[4] = sub_100024DCC;
  v18[5] = v13;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  void v18[2] = sub_100024850;
  v18[3] = &unk_10005EA60;
  uint64_t v14 = _Block_copy(v18);
  swift_retain();
  swift_release();
  id v15 = [v10 onScheduler:a1 map:v14];
  _Block_release(v14);
  uint64_t v16 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v16;
}

uint64_t sub_100024504@<X0>(uint64_t a1@<X0>, void (*a2)(char *)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  id v20 = a2;
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v19 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture();
  static EFFuture.asValue(_:)(a1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    uint64_t v17 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, a3);
    v20(v16);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, a3);
    uint64_t v17 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(a5, v17, 1, a4);
}

uint64_t sub_100024734@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Optional();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v14 - v9;
  a2(a1);
  uint64_t v11 = *(void *)(a3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a3);
  if (result == 1)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  else
  {
    *(void *)(a4 + 24) = a3;
    id v13 = sub_100022888((uint64_t *)a4);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v11 + 32))(v13, v10, a3);
  }
  return result;
}

id sub_100024850(uint64_t a1)
{
  void (*v1)(void *__return_ptr, uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void v10[3];
  uint64_t v11;
  uint64_t vars8;

  id v1 = *(void (**)(void *__return_ptr, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v10, v2);
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v3 = v11;
  if (v11)
  {
    id v4 = sub_10000902C(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    __chkstk_darwin(v4);
    uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    uint64_t v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    sub_10000A788((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t EFPromise.deinit()
{
  return v0;
}

uint64_t EFPromise.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

BOOL sub_100024A04(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v15 - v9, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v10, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_6:
    v11(v8, a1, v4);
    goto LABEL_7;
  }
  sub_100024E24();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v12 = (void *)v15[1];
  v11(v8, a1, v4);
  if (!v12)
  {
LABEL_7:
    Optional._bridgeToObjectiveC()();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    self;
    BOOL v13 = swift_dynamicCastObjCClass() != 0;
    swift_unknownObjectRelease();
    return v13;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return 0;
}

uint64_t sub_100024C30()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100024C68(uint64_t a1)
{
  return sub_100022E4C(a1, v1[3], v1[4], v1[2]);
}

uint64_t sub_100024C74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100024C84()
{
  return swift_release();
}

uint64_t sub_100024C8C(uint64_t a1)
{
  return sub_100023950(a1, *(void (**)(char *))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 16));
}

uint64_t sub_100024C98()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100024CC0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100024CF8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for EFFuture()
{
  return sub_100024E64();
}

uint64_t sub_100024D38()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100024D70(uint64_t a1)
{
  return sub_100023F4C(a1, *(uint64_t (**)(char *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

id sub_100024D7C()
{
  id v1 = *(id *)((*(uint64_t (**)(void))(v0 + 32))() + 16);
  swift_release();
  return v1;
}

uint64_t sub_100024DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100024504(a1, *(void (**)(char *))(v2 + 32), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_100024DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100024734(a1, *(void (**)(uint64_t))(v2 + 32), *(void *)(v2 + 24), a2);
}

uint64_t sub_100024DDC()
{
  return swift_initClassMetadata2();
}

unint64_t sub_100024E24()
{
  unint64_t result = qword_100064620[0];
  if (!qword_100064620[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_100064620);
  }
  return result;
}

uint64_t sub_100024E64()
{
  return swift_getGenericMetadata();
}

uint64_t EFPromise.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)EFPromise) init];
  return v0;
}

uint64_t EFPromise.init()()
{
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)EFPromise) init];
  return v0;
}

uint64_t EFPromise.future.getter()
{
  type metadata accessor for EFFuture();
  id v1 = [*(id *)(v0 + 16) future];
  return EFFuture.__allocating_init<A>(_:)();
}

uint64_t EFPromise.finish(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t v8 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v10 - v6, a1, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(with:error:)(char *a1, void *a2)
{
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - v8;
  id v16 = (id)v2[2];
  uint64_t v10 = *(void *)(v5 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v12 = 0;
  if (v11(a1, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, a1, v6);
    uint64_t result = v11(v9, 1, v5);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    type metadata accessor for EFFuture();
    uint64_t v12 = static EFFuture.asAnyObject(_:)((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v5);
  }
  if (a2) {
    a2 = (void *)_convertErrorToNSError(_:)();
  }
  id v14 = [v16 finishWithResult:v12 error:a2];
  swift_unknownObjectRelease();

  return (uint64_t)v14;
}

uint64_t EFPromise.finish(_:)(void *a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - v6;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))((char *)&v9 - v6, 1, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, a1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(_:)(void (*a1)(uint64_t))
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - v8;
  a1(v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v9, 0, 1, v3);
  EFPromise.finish(with:error:)(v9, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

uint64_t type metadata accessor for EFPromise()
{
  return sub_100024E64();
}

uint64_t sub_100025620(uint64_t a1)
{
  return sub_100025740(a1, qword_1000679A0);
}

uint64_t sub_100025648(uint64_t a1)
{
  return sub_100025740(a1, qword_1000679B8);
}

uint64_t sub_100025660(uint64_t a1)
{
  return sub_100025740(a1, qword_1000679D0);
}

uint64_t sub_100025684(uint64_t a1)
{
  return sub_100025740(a1, qword_1000679E8);
}

uint64_t *sub_1000256A8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10002570C(uint64_t a1)
{
  return sub_100025740(a1, qword_100067A00);
}

uint64_t sub_100025724(uint64_t a1)
{
  return sub_100025740(a1, qword_100067A18);
}

uint64_t sub_100025740(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000256A8(v3, a2);
  sub_100008D9C(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000257C8(uint64_t a1, uint64_t a2)
{
  return sub_100025888(a1, a2, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_10002E268);
}

uint64_t sub_100025828(uint64_t a1, uint64_t a2)
{
  return sub_100025888(a1, a2, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_10002E008);
}

uint64_t sub_100025888(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t, uint64_t))
{
  uint64_t v8 = 0;
  uint64_t result = a3(&v8, a1, a2);
  uint64_t v4 = v8;
  if (result)
  {
    int v5 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = objc_allocWithZone((Class)NSError);
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v6 initWithDomain:v7 code:v5 userInfo:0];

    swift_willThrow();
    swift_unknownObjectRelease();
    return v4;
  }
  if (v8) {
    return v4;
  }
  __break(1u);
  return result;
}

void sub_1000259A0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

_OWORD *sub_100025A04@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = a1;
  swift_unknownObjectRetain();
  sub_100008E28(qword_100064598);
  if (swift_dynamicCast()) {
    return sub_10000A71C(v4, a2);
  }
  memset(v4, 0, sizeof(v4));
  [objc_allocWithZone((Class)NSNull) init];
  if ((swift_dynamicCast() & 1) == 0)
  {
    *a2 = 0u;
    a2[1] = 0u;
  }
  return (_OWORD *)sub_10000A72C((uint64_t)v4, (uint64_t *)&unk_1000648F0);
}

BOOL sub_100025AD8(uint64_t a1)
{
  sub_10002AA70(a1, (uint64_t)v5, (uint64_t *)&unk_1000648F0);
  if (!v6)
  {
    sub_10000A72C((uint64_t)v5, (uint64_t *)&unk_1000648F0);
    goto LABEL_6;
  }
  sub_100024E24();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    sub_10002AA70(a1, (uint64_t)v5, (uint64_t *)&unk_1000648F0);
    goto LABEL_7;
  }
  sub_10002AA70(a1, (uint64_t)v5, (uint64_t *)&unk_1000648F0);
  if (!v4)
  {
LABEL_7:
    sub_100008E28((uint64_t *)&unk_1000648F0);
    Optional._bridgeToObjectiveC()();
    sub_10000A72C((uint64_t)v5, (uint64_t *)&unk_1000648F0);
    self;
    BOOL v2 = swift_dynamicCastObjCClass() != 0;
    swift_unknownObjectRelease();
    return v2;
  }

  sub_10000A72C((uint64_t)v5, (uint64_t *)&unk_1000648F0);
  return 0;
}

uint64_t sub_100025BF4(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(v2 + 16);
  if (!*(void *)(a1 + 24))
  {
    uint64_t v7 = 0;
    if (a2)
    {
LABEL_9:
      uint64_t v8 = (void *)_convertErrorToNSError(_:)();
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v8 = 0;
LABEL_10:
    id v9 = [v4 finishWithResult:v7 error:v8];
    swift_unknownObjectRelease();

    return (uint64_t)v9;
  }
  uint64_t result = sub_10002AA70(a1, (uint64_t)v11, (uint64_t *)&unk_1000648F0);
  if (v12)
  {
    sub_10000A6C0((uint64_t)v11, (uint64_t)v10);
    BOOL v6 = sub_100025AD8((uint64_t)v10);
    sub_10000A72C((uint64_t)v10, (uint64_t *)&unk_1000648F0);
    if (v6)
    {
      uint64_t v7 = 0;
    }
    else
    {
      sub_10000A6C0((uint64_t)v11, (uint64_t)v10);
      uint64_t v7 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
    }
    sub_10000A788((uint64_t)v11);
    if (a2) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025CF8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  else
  {
    *((void *)&v7 + 1) = &type metadata for Data;
    *(void *)&long long v6 = a1;
    *((void *)&v6 + 1) = a2;
  }
  sub_100014948(a1, a2);
  sub_100025BF4((uint64_t)&v6, a4);
  return sub_10000A72C((uint64_t)&v6, (uint64_t *)&unk_1000648F0);
}

uint64_t sub_100025D6C(uint64_t a1, void *a2, void *a3, void *a4)
{
  long long v6 = a2;
  long long v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    long long v6 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_100009000((uint64_t)v6, v10);

  return swift_release();
}

void sub_100025E34()
{
  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100008D9C(v0, (uint64_t)qword_1000679A0);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Serverside error: %@", v2, 0xCu);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_1000263B8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  if (a1)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100008D9C(v4, (uint64_t)qword_1000679A0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      long long v7 = (uint8_t *)swift_slowAlloc();
      id v8 = (void *)swift_slowAlloc();
      *(_DWORD *)long long v7 = 138412290;
      swift_errorRetain();
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v8 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "RefreshCertificate error in revokeResultFromServer: %@", v7, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v13 = a1;
  }
  else
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100008D9C(v9, (uint64_t)qword_1000679A0);
    unint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "RefreshCertificate success from revokeResultFromServer", v12, 2u);
      swift_slowDealloc();
    }

    uint64_t v13 = 0;
  }
  return a2(v13);
}

void sub_100026800(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  if (a3 && (self, (uint64_t v8 = swift_dynamicCastObjCClass()) != 0))
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = qword_100063E80;
    id v11 = a3;
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100008D9C(v12, (uint64_t)qword_1000679A0);
    id v13 = v11;
    id v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v16 = 134217984;
      [v9 statusCode];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v14, v15, "RefreshCertificate Revoke API HTTPS response code: %ld", v16, 0xCu);
      swift_slowDealloc();
    }
    else
    {
    }
    if ([v9 statusCode] == (id)200) {
      ((void (*)(void))a5)(0);
    }
  }
  else
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v17 = 15;
    *(_OWORD *)(v17 + 8) = 0u;
    *(_OWORD *)(v17 + 24) = 0u;
    *(unsigned char *)(v17 + 40) = 5;
    a5();
    swift_errorRelease();
    if (a4)
    {
      swift_errorRetain();
      if (qword_100063E80 != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for Logger();
      sub_100008D9C(v18, (uint64_t)qword_1000679A0);
      swift_errorRetain();
      swift_errorRetain();
      oslog = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v19))
      {
        id v20 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v21 = (void *)swift_slowAlloc();
        *(_DWORD *)id v20 = 138412290;
        swift_errorRetain();
        uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *os_log_type_t v21 = v23;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, oslog, v19, "RefreshCertificate Revoke API Error: %@", v20, 0xCu);
        sub_100008E28(&qword_1000651F0);
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
  }
}

id sub_100026DE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CertificateRequestManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CertificateRequestManager()
{
  return self;
}

uint64_t sub_100026E3C(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

uint64_t sub_100026E6C(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_10002750C(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

unsigned __int8 *sub_100026F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    long long v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100027280();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    long long v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    long long v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = sub_100027004(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_100027004(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
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
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
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
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100027280()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_100027300(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100027300(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100006A3C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10004B7D0(v9, 0),
          unint64_t v12 = sub_100006B3C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100027458(uint64_t a1, unint64_t a2)
{
  sub_10000A848(a1, a2);
  sub_100027560(a1, a2);
  sub_100008F8C(a1, a2);
  uint64_t v4 = static String._fromUTF8Repairing(_:)();
  swift_release();
  return v4;
}

uint64_t sub_1000274D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._fromUTF8Repairing(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_10002750C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

void *sub_100027560(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Data.Iterator();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unsigned __int8 v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v8 = _swiftEmptyArrayStorage;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          sub_100008E28(&qword_1000646F8);
          unsigned __int8 v8 = (void *)swift_allocObject();
          size_t v12 = j__malloc_size(v8);
          void v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_10000A848(a1, a2);
        uint64_t v13 = Data._copyContents(initializing:)();
        sub_100008F8C(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x10002770CLL);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_10002771C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._fromUTF8Repairing(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100027754(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v96 = a3;
  uint64_t v95 = (void *)type metadata accessor for URL();
  uint64_t v9 = *(v95 - 1);
  __chkstk_darwin(v95);
  uint64_t v11 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008E28(&qword_1000646E0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = type metadata accessor for URLRequest();
  unint64_t v97 = *(void *)(v99 - 8);
  uint64_t v15 = __chkstk_darwin(v99);
  unsigned __int8 v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v94 = (char *)&v92 - v18;
  unsigned int v19 = (unsigned __int8 *)self;
  sub_100008E28(&qword_100064710);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E280;
  *(void *)(inited + 32) = 7500643;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  *(void *)(inited + 64) = 0x6C69616D65;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = a4;
  *(void *)(inited + 88) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10003F234(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(void *)&long long aBlock = 0;
  uint64_t v93 = v19;
  unsigned __int8 v22 = [v19 dataWithJSONObject:isa options:0 error:&aBlock];

  id v23 = (id)aBlock;
  if (!v22)
  {
    long long v29 = v23;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return (uint64_t)v22;
  }
  uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v26 = v25;

  unsigned __int8 v22 = (void *)type metadata accessor for CertificateManager();
  (*(void (**)(char *, void (*)(char *, uint64_t), void *))(v9 + 16))(v11, v96, v95);
  URLRequest.init(url:cachePolicy:timeoutInterval:)();
  uint64_t v27 = v98;
  sub_100011B2C((uint64_t)v14);
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v97 + 8))(v17, v99);
    uint64_t v28 = v24;
LABEL_7:
    sub_100008F8C(v28, v26);
    return (uint64_t)v22;
  }
  uint64_t v98 = v24;
  unint64_t v30 = v97;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v97 + 8);
  unsigned __int8 v22 = (void *)v99;
  v31(v17, v99);
  if ((*(unsigned int (**)(char *, uint64_t, void *))(v30 + 48))(v14, 1, v22) == 1)
  {
    sub_10000A72C((uint64_t)v14, &qword_1000646E0);
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v32 = 3;
    *(_OWORD *)(v32 + 8) = 0u;
    *(_OWORD *)(v32 + 24) = 0u;
    *(unsigned char *)(v32 + 40) = 5;
    swift_willThrow();
    uint64_t v28 = v98;
    goto LABEL_7;
  }
  uint64_t v96 = v31;
  (*(void (**)(char *, char *, void *))(v30 + 32))(v94, v14, v22);
  sub_10000A848(v98, v26);
  unint64_t v97 = v26;
  URLRequest.httpBody.setter();
  URLRequest.httpMethod.setter();
  sub_100008E28(&qword_100064718);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = [objc_allocWithZone((Class)EFPromise) init];
  id v35 = [self ephemeralSessionConfiguration];
  id v36 = [self sessionWithConfiguration:v35];

  Class v37 = URLRequest._bridgeToObjectiveC()().super.isa;
  Swift::Int v103 = sub_10002AA68;
  uint64_t v104 = v34;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v102 = sub_100025D6C;
  *((void *)&v102 + 1) = &unk_10005ED60;
  uint64_t v38 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v95 = v36;
  id v39 = [v36 dataTaskWithRequest:v37 completionHandler:v38];
  _Block_release(v38);

  [v39 resume];
  id v40 = [*(id *)(v34 + 16) future];
  id v41 = [self immediateScheduler];
  Swift::Int v103 = sub_100023C8C;
  uint64_t v104 = 0;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v102 = sub_100023C90;
  *((void *)&v102 + 1) = &unk_10005ED88;
  id v42 = _Block_copy(&aBlock);
  swift_release();
  [v40 onScheduler:v41 addFailureBlock:v42];
  _Block_release(v42);
  swift_unknownObjectRelease();
  id v43 = [v40 result];
  uint64_t v44 = swift_unknownObjectRetain();
  sub_100025A04(v44, &aBlock);
  swift_unknownObjectRelease();
  if (!*((void *)&v102 + 1)) {
    goto LABEL_94;
  }
  swift_unknownObjectRelease();
  sub_10000A71C(&aBlock, &v100);

  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v46 = 0;
    unint64_t v45 = 0xF000000000000000;
LABEL_18:
    uint64_t v54 = v99;
    unint64_t v49 = v97;
LABEL_19:

    sub_100009000(v46, v45);
    swift_release();
    sub_100008F8C(v98, v49);
    unsigned __int8 v22 = _swiftEmptyArrayStorage;
    goto LABEL_20;
  }
  unint64_t v45 = *((void *)&aBlock + 1);
  uint64_t v46 = aBlock;
  sub_10000A848(aBlock, *((unint64_t *)&aBlock + 1));
  Class v47 = Data._bridgeToObjectiveC()().super.isa;
  *(void *)&long long aBlock = 0;
  id v48 = [v93 JSONObjectWithData:v47 options:0 error:&aBlock];

  unint64_t v49 = v97;
  if (!v48)
  {
    unsigned __int8 v22 = (id)aBlock;
    _convertNSErrorToError(_:)();

LABEL_23:
    swift_willThrow();
    sub_100008F8C(v46, v45);

    sub_100008F8C(v46, v45);
    swift_release();
    uint64_t v56 = v98;
    unint64_t v57 = v49;
LABEL_24:
    sub_100008F8C(v56, v57);
    v96(v94, v99);
    return (uint64_t)v22;
  }
  id v50 = (id)aBlock;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100008E28((uint64_t *)&unk_100063F40);
  unsigned __int8 v22 = &type metadata for Any;
  if (!swift_dynamicCast())
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v55 = 7;
    *(_OWORD *)(v55 + 8) = 0u;
    *(_OWORD *)(v55 + 24) = 0u;
    *(unsigned char *)(v55 + 40) = 5;
    goto LABEL_23;
  }
  uint64_t v51 = v100;
  if (*(void *)(v100 + 16))
  {
    unint64_t v52 = sub_10004740C(0x6E69616863, 0xE500000000000000);
    if (v53)
    {
      sub_10000A6C0(*(void *)(v51 + 56) + 32 * v52, (uint64_t)&aBlock);
      sub_100008E28(&qword_100063EF8);
      if (swift_dynamicCast())
      {
        sub_100008F8C(v46, v45);
        swift_bridgeObjectRelease();

        sub_100008F8C(v46, v45);
        swift_release();
        sub_100008F8C(v98, v49);
        unsigned __int8 v22 = (void *)v100;
        uint64_t v54 = v99;
LABEL_20:
        v96(v94, v54);
        return (uint64_t)v22;
      }
    }
  }
  if (!*(void *)(v51 + 16)) {
    goto LABEL_89;
  }
  unint64_t v58 = sub_10004740C(0x646F43726F727265, 0xE900000000000065);
  if ((v59 & 1) == 0) {
    goto LABEL_89;
  }
  sub_10000A6C0(*(void *)(v51 + 56) + 32 * v58, (uint64_t)&aBlock);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_89;
  }
  uint64_t v60 = HIBYTE(*((void *)&v100 + 1)) & 0xFLL;
  uint64_t v61 = v100 & 0xFFFFFFFFFFFFLL;
  if ((*((void *)&v100 + 1) & 0x2000000000000000) != 0) {
    uint64_t v62 = HIBYTE(*((void *)&v100 + 1)) & 0xFLL;
  }
  else {
    uint64_t v62 = v100 & 0xFFFFFFFFFFFFLL;
  }
  if (!v62)
  {
    swift_bridgeObjectRelease();
    goto LABEL_89;
  }
  if ((*((void *)&v100 + 1) & 0x1000000000000000) != 0)
  {
    uint64_t v93 = sub_100026F1C(v100, *((uint64_t *)&v100 + 1), 10);
    char v65 = v91;
    goto LABEL_72;
  }
  if ((*((void *)&v100 + 1) & 0x2000000000000000) == 0)
  {
    if ((v100 & 0x1000000000000000) != 0) {
      uint64_t v63 = (unsigned __int8 *)((*((void *)&v100 + 1) & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v63 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    uint64_t v93 = sub_100027004(v63, v61, 10);
    char v65 = v64 & 1;
    goto LABEL_72;
  }
  *(void *)&long long aBlock = v100;
  *((void *)&aBlock + 1) = *((void *)&v100 + 1) & 0xFFFFFFFFFFFFFFLL;
  if (v100 == 43)
  {
    if (v60)
    {
      if (v60 != 1 && (BYTE1(v100) - 48) <= 9u)
      {
        uint64_t v66 = (BYTE1(v100) - 48);
        uint64_t v73 = v60 - 2;
        if (v73)
        {
          unint64_t v74 = (unsigned __int8 *)&aBlock + 2;
          while (1)
          {
            unsigned int v75 = *v74 - 48;
            if (v75 > 9) {
              goto LABEL_70;
            }
            uint64_t v76 = (unsigned __int128)(v66 * (__int128)10) >> 64;
            uint64_t v77 = 10 * v66;
            if (v76 != v77 >> 63 || (v72 = __OFADD__(v77, v75), uint64_t v66 = v77 + v75, v72))
            {
LABEL_87:
              uint64_t v66 = 0;
              char v65 = 1;
              unint64_t v49 = v97;
              goto LABEL_71;
            }
            char v65 = 0;
            ++v74;
            --v73;
            unint64_t v49 = v97;
            if (!v73) {
              goto LABEL_71;
            }
          }
        }
        goto LABEL_63;
      }
      goto LABEL_61;
    }
  }
  else
  {
    if (v100 != 45)
    {
      if (v60 && (v100 - 48) <= 9u)
      {
        uint64_t v66 = (v100 - 48);
        uint64_t v78 = v60 - 1;
        if (v78)
        {
          uint64_t v79 = (unsigned __int8 *)&aBlock + 1;
          while (1)
          {
            unsigned int v80 = *v79 - 48;
            if (v80 > 9) {
              break;
            }
            uint64_t v81 = (unsigned __int128)(v66 * (__int128)10) >> 64;
            uint64_t v82 = 10 * v66;
            if (v81 != v82 >> 63) {
              goto LABEL_87;
            }
            BOOL v72 = __OFADD__(v82, v80);
            uint64_t v66 = v82 + v80;
            if (v72) {
              goto LABEL_87;
            }
            char v65 = 0;
            ++v79;
            --v78;
            unint64_t v49 = v97;
            if (!v78) {
              goto LABEL_71;
            }
          }
LABEL_70:
          uint64_t v66 = 0;
          char v65 = 1;
LABEL_71:
          uint64_t v93 = (unsigned __int8 *)v66;
LABEL_72:
          swift_bridgeObjectRelease();
          if ((v65 & 1) == 0)
          {
            if (*(void *)(v51 + 16)
              && (unint64_t v83 = sub_10004740C(0x746954726F727265, 0xEA0000000000656CLL), (v84 & 1) != 0)
              && (sub_10000A6C0(*(void *)(v51 + 56) + 32 * v83, (uint64_t)&aBlock), swift_dynamicCast()))
            {
              unint64_t v85 = *((void *)&v100 + 1);
              uint64_t v86 = v100;
            }
            else
            {
              uint64_t v86 = 0;
              unint64_t v85 = 0xE000000000000000;
            }
            if (*(void *)(v51 + 16)
              && (unint64_t v87 = sub_10004740C(0x73654D726F727265, 0xEC00000065676173), (v88 & 1) != 0))
            {
              sub_10000A6C0(*(void *)(v51 + 56) + 32 * v87, (uint64_t)&aBlock);
            }
            else
            {
              long long aBlock = 0u;
              long long v102 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v102 + 1))
            {
              if (swift_dynamicCast())
              {
                unsigned __int8 v22 = (void *)*((void *)&v100 + 1);
                unint64_t v89 = v100;
                sub_100008DD4();
                swift_allocError();
                *(void *)uint64_t v90 = v93;
                *(void *)(v90 + 8) = v86;
                *(void *)(v90 + 16) = v85;
                *(_OWORD *)(v90 + 24) = __PAIR128__((unint64_t)v22, v89);
                *(unsigned char *)(v90 + 40) = 1;
                swift_willThrow();
                sub_100008F8C(v46, v45);

                sub_100008F8C(v46, v45);
                swift_release();
                uint64_t v56 = v98;
                unint64_t v57 = v97;
                goto LABEL_24;
              }
              sub_100008F8C(v46, v45);
              swift_bridgeObjectRelease();
            }
            else
            {
              sub_100008F8C(v46, v45);
              swift_bridgeObjectRelease();
              sub_10000A72C((uint64_t)&aBlock, (uint64_t *)&unk_1000648F0);
            }
            goto LABEL_18;
          }
LABEL_89:
          sub_100008F8C(v46, v45);
          swift_bridgeObjectRelease();
          uint64_t v54 = v99;
          goto LABEL_19;
        }
LABEL_63:
        uint64_t v93 = (unsigned __int8 *)v66;
        char v65 = 0;
        goto LABEL_72;
      }
LABEL_61:
      uint64_t v93 = 0;
      char v65 = 1;
      goto LABEL_72;
    }
    if (v60)
    {
      if (v60 != 1 && (BYTE1(v100) - 48) <= 9u)
      {
        uint64_t v66 = -(uint64_t)(BYTE1(v100) - 48);
        uint64_t v67 = v60 - 2;
        if (v67)
        {
          uint64_t v68 = (unsigned __int8 *)&aBlock + 2;
          while (1)
          {
            unsigned int v69 = *v68 - 48;
            if (v69 > 9) {
              goto LABEL_70;
            }
            uint64_t v70 = (unsigned __int128)(v66 * (__int128)10) >> 64;
            uint64_t v71 = 10 * v66;
            if (v70 != v71 >> 63) {
              goto LABEL_87;
            }
            BOOL v72 = __OFSUB__(v71, v69);
            uint64_t v66 = v71 - v69;
            if (v72) {
              goto LABEL_87;
            }
            char v65 = 0;
            ++v68;
            --v67;
            unint64_t v49 = v97;
            if (!v67) {
              goto LABEL_71;
            }
          }
        }
        goto LABEL_63;
      }
      goto LABEL_61;
    }
    __break(1u);
  }
  __break(1u);
LABEL_94:
  uint64_t result = sub_10000A72C((uint64_t)&aBlock, (uint64_t *)&unk_1000648F0);
  __break(1u);
  return result;
}

void *sub_100028624(int a1, uint64_t a2, SecKeyRef key, char a4)
{
  if (a4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  SecKeyRef v6 = SecKeyCopyPublicKey(key);
  sub_100008E28(&qword_100064700);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E760;
  unsigned __int8 v8 = (void *)kSecCertificateKeyUsage;
  *(void *)(inited + 32) = kSecCertificateKeyUsage;
  *(void *)(inited + 40) = v5;
  uint64_t v9 = (void *)kSecSubjectAltName;
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 72) = v9;
  *(void *)(inited + 104) = sub_100008E28(&qword_100064708);
  *(void *)(inited + 80) = a2;
  id v10 = v8;
  id v11 = v9;
  swift_bridgeObjectRetain();
  NSString v12 = String._bridgeToObjectiveC()();
  *(void *)(inited + 144) = &type metadata for String;
  *(void *)(inited + 112) = v12;
  *(void *)(inited + 120) = 0xD00000000000001DLL;
  *(void *)(inited + 128) = 0x8000000100053310;
  sub_10003EFDC(inited);
  sub_100008E28(&qword_1000641E8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  type metadata accessor for CFString(0);
  sub_10002AA20((unint64_t *)&qword_100063FA0, type metadata accessor for CFString);
  Class v14 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  CertificateRequest = (void *)SecGenerateCertificateRequest();

  if (CertificateRequest)
  {
    id v16 = CertificateRequest;
    uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    CertificateRequest = (void *)sub_1000079E8(v17, v19, (void *)2);
    sub_100008F8C(v17, v19);
  }
  else
  {
  }
  return CertificateRequest;
}

SecCertificateRef sub_100028854(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100007450(a1, a2, (void *)1);
  if (!v2)
  {
    unint64_t v6 = v5;
    if (v5 >> 60 == 15)
    {
      sub_100008DD4();
      swift_allocError();
      *(void *)uint64_t v7 = 10;
      *(_OWORD *)(v7 + 8) = 0u;
      *(_OWORD *)(v7 + 24) = 0u;
      *(unsigned char *)(v7 + 40) = 5;
      swift_willThrow();
    }
    else
    {
      uint64_t v8 = v4;
      CFDataRef isa = Data._bridgeToObjectiveC()().super.isa;
      SecCertificateRef v3 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

      if (!v3)
      {
        sub_100008DD4();
        swift_allocError();
        *(void *)uint64_t v10 = 10;
        *(_OWORD *)(v10 + 8) = 0u;
        *(_OWORD *)(v10 + 24) = 0u;
        *(unsigned char *)(v10 + 40) = 5;
        swift_willThrow();
      }
      sub_100009000(v8, v6);
    }
  }
  return v3;
}

void sub_100028984(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100008D9C(v3, (uint64_t)qword_1000679A0);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      unint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v6 = 138412290;
      swift_errorRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v7 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "RefreshCertificate error in revokeResultFromServer: %@", v6, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v13 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v13);
  }
  else
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100008D9C(v8, (uint64_t)qword_1000679A0);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "RefreshCertificate success from revokeResultFromServer", v11, 2u);
      swift_slowDealloc();
    }

    NSString v12 = *(void (**)(uint64_t, void))(a2 + 16);
    v12(a2, 0);
  }
}

void sub_100028C50(uint64_t a1, unint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v71 = a3;
  uint64_t v60 = a1;
  unint64_t v61 = a2;
  BOOL v72 = (void *)type metadata accessor for URL();
  uint64_t v5 = *(v72 - 1);
  uint64_t v6 = __chkstk_darwin(v72);
  uint64_t v62 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v58 - v8;
  uint64_t v10 = type metadata accessor for URLRequest();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  char v59 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v58 - v14;
  uint64_t v16 = sub_100008E28(&qword_1000646E0);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v64 = (uint64_t)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v58 - v20;
  __chkstk_darwin(v19);
  id v23 = (char *)&v58 - v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a4;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_10002AAD8;
  *(void *)(v25 + 24) = v24;
  uint64_t v67 = v10;
  uint64_t v68 = v25;
  uint64_t v70 = v11;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v23, 1, 1, v10);
  type metadata accessor for CertificateManager();
  uint64_t v63 = v5;
  unint64_t v26 = *(void (**)(char *, uint64_t, void *))(v5 + 16);
  v26(v9, v71, v72);
  _Block_copy(a4);
  unsigned int v69 = a4;
  _Block_copy(a4);
  uint64_t v66 = v24;
  swift_retain();
  URLRequest.init(url:cachePolicy:timeoutInterval:)();
  uint64_t v27 = v65;
  sub_100011B2C((uint64_t)v21);
  if (v27)
  {
    char v65 = v23;
    (*(void (**)(char *, uint64_t))(v70 + 8))(v15, v67);
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100008D9C(v28, (uint64_t)qword_1000679A0);
    long long v29 = v62;
    unint64_t v30 = v72;
    v26(v62, v71, v72);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      aBlock[0] = v71;
      *(_DWORD *)uint64_t v33 = 136315394;
      sub_10002AA20(&qword_1000641F8, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v74 = sub_10004B330(v34, v35, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void *))(v63 + 8))(v29, v30);
      *(_WORD *)(v33 + 12) = 2112;
      swift_errorRetain();
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v74 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(void *)uint64_t v70 = v36;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "RefreshCertificate error: Failed to add Authorization Headers for endpoint %s error: %@", (uint8_t *)v33, 0x16u);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, void *))(v63 + 8))(v29, v30);
      swift_errorRelease();
      swift_errorRelease();
    }

    Class v47 = v69;
    id v23 = v65;
    sub_100008DD4();
    uint64_t v48 = swift_allocError();
    *(void *)uint64_t v49 = 3;
    *(_OWORD *)(v49 + 8) = 0u;
    *(_OWORD *)(v49 + 24) = 0u;
    *(unsigned char *)(v49 + 40) = 5;
    _Block_copy(v47);
    sub_100028984(v48, (uint64_t)v47);
    _Block_release(v47);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v38 = v60;
    unint64_t v37 = v61;
    id v39 = v59;
    uint64_t v40 = v70;
    id v41 = *(void **)(v70 + 8);
    id v42 = v15;
    uint64_t v43 = v67;
    uint64_t v71 = v70 + 8;
    BOOL v72 = v41;
    ((void (*)(char *, uint64_t))v41)(v42, v67);
    sub_10000A72C((uint64_t)v23, &qword_1000646E0);
    sub_10002A958((uint64_t)v21, (uint64_t)v23);
    uint64_t v44 = v64;
    sub_10002AA70((uint64_t)v23, v64, &qword_1000646E0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v44, 1, v43) == 1)
    {
      sub_10000A72C(v64, &qword_1000646E0);
      sub_100008DD4();
      uint64_t v45 = swift_allocError();
      *(void *)uint64_t v46 = 3;
      *(_OWORD *)(v46 + 8) = 0u;
      *(_OWORD *)(v46 + 24) = 0u;
      *(unsigned char *)(v46 + 40) = 5;
      Class v47 = v69;
      _Block_copy(v69);
      sub_100028984(v45, (uint64_t)v47);
      _Block_release(v47);
      swift_errorRelease();
    }
    else
    {
      id v50 = v39;
      (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v39, v64, v43);
      sub_10000A848(v38, v37);
      URLRequest.httpBody.setter();
      URLRequest.httpMethod.setter();
      id v51 = [self ephemeralSessionConfiguration];
      id v52 = [self sessionWithConfiguration:v51];

      Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
      uint64_t v54 = swift_allocObject();
      uint64_t v55 = v68;
      *(void *)(v54 + 16) = sub_10002AA18;
      *(void *)(v54 + 24) = v55;
      aBlock[4] = (uint64_t)sub_10002AAD4;
      void aBlock[5] = v54;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100025D6C;
      aBlock[3] = (uint64_t)&unk_10005ED38;
      uint64_t v56 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      id v57 = [v52 dataTaskWithRequest:isa completionHandler:v56];
      _Block_release(v56);

      [v57 resume];
      ((void (*)(char *, uint64_t))v72)(v50, v43);
      Class v47 = v69;
    }
  }
  sub_10000A72C((uint64_t)v23, &qword_1000646E0);
  swift_release();
  swift_release();
  _Block_release(v47);
}

void sub_100029550(__SecCertificate *a1, __SecIdentity *a2, uint64_t a3, void *aBlock)
{
  SecKeyRef privateKeyRef = 0;
  _Block_copy(aBlock);
  OSStatus v9 = SecIdentityCopyPrivateKey(a2, &privateKeyRef);
  if (v9 || !privateKeyRef)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100008D9C(v22, (uint64_t)qword_1000679A0);
    id v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 67109120;
      LODWORD(v73) = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "RefreshCertificate error: Failed to copy Private Key from Signing Identity: %d", v25, 8u);
      swift_slowDealloc();
    }

    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v26 = 15;
    *(_OWORD *)(v26 + 8) = 0u;
    *(_OWORD *)(v26 + 24) = 0u;
    *(unsigned char *)(v26 + 40) = 5;
    uint64_t v27 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(void *, void *))aBlock + 2))(aBlock, v27);
    goto LABEL_22;
  }
  uint64_t v10 = privateKeyRef;
  CFDataRef v11 = SecCertificateCopyData(a1);
  if (!v11)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100008D9C(v28, (uint64_t)qword_1000679A0);
    long long v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "RefreshCertificate error: Failed to copy data from revoking certificate", v31, 2u);
      swift_slowDealloc();
    }

    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v32 = 10;
    *(_OWORD *)(v32 + 8) = 0u;
    *(_OWORD *)(v32 + 24) = 0u;
    *(unsigned char *)(v32 + 40) = 5;
    uint64_t v27 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(void *, void *))aBlock + 2))(aBlock, v27);

    goto LABEL_22;
  }
  CFErrorRef error = 0;
  CFDataRef v12 = v11;
  CFDataRef v13 = SecKeyCreateSignature(v10, kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512, v12, &error);
  if (!v13)
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    sub_100008D9C(v33, (uint64_t)qword_1000679A0);
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "RefreshCertificate error: Failed to sign the certificate", v36, 2u);
      swift_slowDealloc();
    }

    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v37 = 15;
    *(_OWORD *)(v37 + 8) = 0u;
    *(_OWORD *)(v37 + 24) = 0u;
    *(unsigned char *)(v37 + 40) = 5;
    uint64_t v27 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(void *, void *))aBlock + 2))(aBlock, v27);

LABEL_22:
    swift_errorRelease();
    goto LABEL_23;
  }
  CFDataRef v14 = v13;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  uint64_t v67 = v15;
  unint64_t v68 = v17;
  uint64_t v64 = a3;
  switch(v17 >> 62)
  {
    case 1uLL:
      CFDataRef v66 = v12;
      if (v15 >> 32 < (int)v15) {
        __break(1u);
      }
      unint64_t v17 = v15;
      CFDataRef v12 = (const __CFData *)v68;
      sub_10000A848(v15, v68);
      sub_10000A848(v15, v68);
      swift_retain();
      uint64_t v43 = sub_100026E6C((int)v15, v15 >> 32, v68 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10002771C);
      if (v4) {
        goto LABEL_46;
      }
      uint64_t v42 = v43;
      uint64_t v19 = v44;
      sub_100008F8C(v15, v68);
      goto LABEL_31;
    case 2uLL:
      CFDataRef v66 = v12;
      CFDataRef v12 = (const __CFData *)v17;
      v17 &= 0x3FFFFFFFFFFFFFFFuLL;
      uint64_t v38 = *(void *)(v15 + 16);
      uint64_t v39 = *(void *)(v15 + 24);
      sub_10000A848(v15, (unint64_t)v12);
      sub_10000A848(v15, (unint64_t)v12);
      swift_retain();
      swift_retain();
      uint64_t v40 = sub_100026E6C(v38, v39, v17, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10002771C);
      if (v4)
      {
        _Block_release(aBlock);
        _Block_release(aBlock);
        swift_release();
        swift_release();
        __break(1u);
LABEL_45:
        _Block_release(aBlock);
        _Block_release(aBlock);
        __break(1u);
LABEL_46:
        _Block_release(aBlock);
        _Block_release(aBlock);
        sub_100008F8C(v17, (unint64_t)v12);
        __break(1u);
        JUMPOUT(0x10002A048);
      }
      uint64_t v42 = v40;
      uint64_t v19 = v41;
      swift_release();
      swift_release();
      unint64_t v17 = v15;
LABEL_31:
      CFDataRef v12 = v66;
      if (v19)
      {
        sub_100008F8C(v17, v68);
        uint64_t v65 = v42;
        goto LABEL_40;
      }
      unint64_t v71 = v17;
      unint64_t v72 = v68;
      sub_10000A848(v17, v68);
      sub_100008E28(&qword_1000646E8);
      if (swift_dynamicCast())
      {
        sub_100009014(v69, (uint64_t)&v73);
        sub_10000902C(&v73, v75);
        if (dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter())
        {
          sub_10000902C(&v73, v75);
          dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)();
          sub_100008F8C(v15, v68);
          uint64_t v19 = *((void *)&v69[0] + 1);
          uint64_t v65 = *(void *)&v69[0];
          sub_10000A788((uint64_t)&v73);
          goto LABEL_40;
        }
        sub_10000A788((uint64_t)&v73);
        unint64_t v17 = v15;
      }
      else
      {
        uint64_t v70 = 0;
        memset(v69, 0, sizeof(v69));
        sub_10000A72C((uint64_t)v69, &qword_1000646F0);
      }
      uint64_t v65 = sub_100027458(v17, v68);
      uint64_t v19 = v45;
      uint64_t v20 = v17;
      unint64_t v21 = v68;
LABEL_39:
      sub_100008F8C(v20, v21);
LABEL_40:
      CFDataRef v46 = v12;
      uint64_t v47 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v49 = v48;

      uint64_t v50 = sub_1000079E8(v47, v49, (void *)1);
      uint64_t v52 = v51;
      sub_100008F8C(v47, v49);
      char v53 = self;
      sub_100008E28(&qword_1000644A8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10004E280;
      *(void *)(inited + 32) = 0x6369666974726563;
      *(void *)(inited + 40) = 0xEB00000000657461;
      *(void *)(inited + 48) = v50;
      *(void *)(inited + 56) = v52;
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 80) = 0x727574616E676973;
      *(void *)(inited + 88) = 0xE900000000000065;
      uint64_t v55 = swift_initStackObject();
      *(_OWORD *)(v55 + 16) = xmmword_10004E280;
      *(void *)(v55 + 32) = 0x687469726F676C61;
      *(void *)(v55 + 40) = 0xE90000000000006DLL;
      *(void *)(v55 + 48) = 0xD000000000000015;
      *(void *)(v55 + 56) = 0x80000001000532D0;
      *(void *)(v55 + 72) = &type metadata for String;
      *(void *)(v55 + 80) = 0x65756C6176;
      *(void *)(v55 + 120) = &type metadata for String;
      *(void *)(v55 + 88) = 0xE500000000000000;
      *(void *)(v55 + 96) = v65;
      *(void *)(v55 + 104) = v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v56 = sub_10003ED98(v55);
      *(void *)(inited + 120) = sub_100008E28((uint64_t *)&unk_100063F40);
      *(void *)(inited + 96) = v56;
      sub_10003ED98(inited);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v73 = 0;
      id v58 = [v53 dataWithJSONObject:isa options:0 error:&v73];

      id v59 = v73;
      if (v58)
      {
        uint64_t v60 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v62 = v61;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        _Block_copy(aBlock);
        sub_100028C50(v60, v62, v64, aBlock);
        _Block_release(aBlock);

        sub_100008F8C(v67, v68);
        sub_100008F8C(v67, v68);

        sub_100008F8C(v60, v62);
      }
      else
      {
        uint64_t v63 = v59;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        sub_100008F8C(v67, v68);
        sub_100008F8C(v67, v68);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      break;
    case 3uLL:
      *(void *)((char *)v69 + 6) = 0;
      *(void *)&v69[0] = 0;
      sub_10002771C((uint64_t *)&v73);
      if (v4) {
        goto LABEL_45;
      }
      sub_100008F8C(v15, v17);
      uint64_t v19 = v74;
      uint64_t v65 = (uint64_t)v73;
      goto LABEL_40;
    default:
      id v73 = (id)v15;
      LOWORD(v74) = v17;
      BYTE2(v74) = BYTE2(v17);
      BYTE3(v74) = BYTE3(v17);
      BYTE4(v74) = BYTE4(v17);
      BYTE5(v74) = BYTE5(v17);
      uint64_t v65 = static String._fromUTF8Repairing(_:)();
      uint64_t v19 = v18;
      uint64_t v20 = v15;
      unint64_t v21 = v17;
      goto LABEL_39;
  }
LABEL_23:

  _Block_release(aBlock);
}

uint64_t sub_10002A058(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(const void *, void *))
{
  uint64_t v66 = a3;
  unint64_t v55 = a2;
  uint64_t v58 = a1;
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v59 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v55 - v9;
  uint64_t v11 = type metadata accessor for URLRequest();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v56 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v55 - v15;
  uint64_t v17 = sub_100008E28(&qword_1000646E0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v57 = (uint64_t)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v55 - v21;
  __chkstk_darwin(v20);
  os_log_type_t v24 = (char *)&v55 - v23;
  uint64_t v64 = swift_allocObject();
  uint64_t v65 = (void *)v11;
  *(void *)(v64 + 16) = a4;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v24, 1, 1, v11);
  type metadata accessor for CertificateManager();
  uint64_t v60 = v6;
  uint64_t v61 = v5;
  uint64_t v25 = v5;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v26(v10, v66, v25);
  unint64_t v62 = a4;
  _Block_copy(a4);
  URLRequest.init(url:cachePolicy:timeoutInterval:)();
  uint64_t v27 = v63;
  sub_100011B2C((uint64_t)v22);
  if (v27)
  {
    uint64_t v63 = v24;
    (*(void (**)(char *, void *))(v12 + 8))(v16, v65);
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100008D9C(v28, (uint64_t)qword_1000679A0);
    long long v29 = v59;
    uint64_t v30 = v61;
    v26(v59, v66, v61);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v65 = (void *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      aBlock[0] = v66;
      *(_DWORD *)uint64_t v33 = 136315394;
      sub_10002AA20(&qword_1000641F8, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v68 = sub_10004B330(v34, v35, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v29, v30);
      *(_WORD *)(v33 + 12) = 2112;
      swift_errorRetain();
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v68 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v65 = v36;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "RefreshCertificate error: Failed to add Authorization Headers for endpoint %s error: %@", (uint8_t *)v33, 0x16u);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v60 + 8))(v29, v30);
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v41 = (uint64_t)v63;
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v44 = 3;
    *(_OWORD *)(v44 + 8) = 0u;
    *(_OWORD *)(v44 + 24) = 0u;
    *(unsigned char *)(v44 + 40) = 5;
    uint64_t v45 = (void *)_convertErrorToNSError(_:)();
    v62[2](v62, v45);

    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v37 = v58;
    uint64_t v38 = v56;
    uint64_t v66 = 0;
    uint64_t v39 = v65;
    uint64_t v63 = *(char **)(v12 + 8);
    ((void (*)(char *, void *))v63)(v16, v65);
    sub_10000A72C((uint64_t)v24, &qword_1000646E0);
    sub_10002A958((uint64_t)v22, (uint64_t)v24);
    uint64_t v40 = v57;
    sub_10002AA70((uint64_t)v24, v57, &qword_1000646E0);
    uint64_t v41 = (uint64_t)v24;
    if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v12 + 48))(v40, 1, v39) == 1)
    {
      sub_10000A72C(v40, &qword_1000646E0);
      sub_100008DD4();
      swift_allocError();
      *(void *)uint64_t v42 = 3;
      *(_OWORD *)(v42 + 8) = 0u;
      *(_OWORD *)(v42 + 24) = 0u;
      *(unsigned char *)(v42 + 40) = 5;
      uint64_t v43 = (void *)_convertErrorToNSError(_:)();
      v62[2](v62, v43);

      swift_errorRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t, void *))(v12 + 32))(v38, v40, v65);
      sub_10000A848(v37, v55);
      URLRequest.httpBody.setter();
      CFDataRef v46 = v38;
      URLRequest.httpMethod.setter();
      id v47 = [self ephemeralSessionConfiguration];
      id v48 = [self sessionWithConfiguration:v47];

      Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
      uint64_t v50 = swift_allocObject();
      uint64_t v51 = v64;
      *(void *)(v50 + 16) = sub_10002A950;
      *(void *)(v50 + 24) = v51;
      aBlock[4] = (uint64_t)sub_10002A9F8;
      void aBlock[5] = v50;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100025D6C;
      aBlock[3] = (uint64_t)&unk_10005EC98;
      uint64_t v52 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      id v53 = [v48 dataTaskWithRequest:isa completionHandler:v52];
      _Block_release(v52);

      [v53 resume];
      ((void (*)(char *, void *))v63)(v46, v65);
    }
  }
  sub_10000A72C(v41, &qword_1000646E0);
  return swift_release();
}

uint64_t sub_10002A918()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002A950(uint64_t a1)
{
  sub_1000259A0(a1, *(void *)(v1 + 16));
}

uint64_t sub_10002A958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008E28(&qword_1000646E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A9C0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002A9F8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_100026800(a1, a2, a3, a4, *(void (**)(void))(v4 + 16));
}

uint64_t sub_10002AA00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002AA10()
{
  return swift_release();
}

uint64_t sub_10002AA18(uint64_t a1)
{
  return sub_1000263B8(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_10002AA20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002AA68(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100025CF8(a1, a2, a3, a4);
}

uint64_t sub_10002AA70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008E28(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002AB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 - 2 < 3 || a6 == 0)
  {
    return swift_bridgeObjectRetain();
  }
  if (a6 == 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s14descr10005D781V5ErrorOwxx(uint64_t a1)
{
  return sub_10002AB8C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t sub_10002AB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 - 2 < 3 || a6 == 0)
  {
    return swift_bridgeObjectRelease();
  }
  if (a6 == 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s14descr10005D781V5ErrorOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_10002AB00(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t _s14descr10005D781V5ErrorOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_10002AB00(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  unsigned __int8 v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_10002AB8C(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 _s14descr10005D781V5ErrorOwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s14descr10005D781V5ErrorOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  unsigned __int8 v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_10002AB8C(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t _s14descr10005D781V5ErrorOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s14descr10005D781V5ErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10002AE04(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) <= 4u) {
    return *(unsigned __int8 *)(a1 + 40);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_10002AE1C(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)__n128 result = a2 - 5;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *_s14descr10005D781V5ErrorOMa()
{
  return &_s14descr10005D781V5ErrorON;
}

unint64_t sub_10002AE54()
{
  sub_10002B3DC(v0, &v25);
  uint64_t v1 = v25;
  switch(v29)
  {
    case 1:
      uint64_t v6 = *((void *)&v25 + 1);
      uint64_t v7 = (void *)v26;
      uint64_t v8 = v27;
      unint64_t v9 = v28;
      _StringGuts.grow(_:)(24);
      swift_bridgeObjectRelease();
      strcpy((char *)v24, "Server error: ");
      HIBYTE(v24[1]) = -18;
      v10._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v10);
      swift_bridgeObjectRelease();
      v11._uint64_t countAndFlagsBits = 32;
      v11._object = (void *)0xE100000000000000;
      String.append(_:)(v11);
      v12._uint64_t countAndFlagsBits = v6;
      v12._object = v7;
      String.append(_:)(v12);
      v13._uint64_t countAndFlagsBits = 2108704;
      v13._object = (void *)0xE300000000000000;
      String.append(_:)(v13);
      uint64_t v4 = v8;
      unint64_t v5 = v9;
      goto LABEL_9;
    case 2:
      unsigned __int8 v14 = (void *)*((void *)&v25 + 1);
      if ((v26 & 0x100000000) != 0)
      {
        v24[0] = 0;
        v24[1] = 0xE000000000000000;
        _StringGuts.grow(_:)(23);
        swift_bridgeObjectRelease();
        unint64_t v15 = 0xD000000000000015;
        unint64_t v16 = "Keychain error while ";
LABEL_8:
        v24[0] = v15;
        v24[1] = (unint64_t)(v16 - 32) | 0x8000000000000000;
        uint64_t v4 = v1;
        unint64_t v5 = (unint64_t)v14;
LABEL_9:
        String.append(_:)(*(Swift::String *)&v4);
      }
      else
      {
        _StringGuts.grow(_:)(27);
        swift_bridgeObjectRelease();
        v24[0] = 0xD000000000000015;
        v24[1] = 0x8000000100053470;
        v21._uint64_t countAndFlagsBits = v1;
        v21._object = v14;
        String.append(_:)(v21);
        v22._uint64_t countAndFlagsBits = 8250;
        v22._object = (void *)0xE200000000000000;
        String.append(_:)(v22);
        v23._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v23);
        swift_bridgeObjectRelease();
      }
      return v24[0];
    case 3:
      uint64_t v17 = (void *)*((void *)&v25 + 1);
      _StringGuts.grow(_:)(33);
      swift_bridgeObjectRelease();
      v24[0] = 0xD000000000000012;
      v24[1] = 0x8000000100053430;
      v18._uint64_t countAndFlagsBits = v1;
      v18._object = v17;
      String.append(_:)(v18);
      uint64_t v4 = 0x766E692073692027;
      unint64_t v5 = 0xED00002E64696C61;
      goto LABEL_9;
    case 4:
      unsigned __int8 v14 = (void *)*((void *)&v25 + 1);
      v24[0] = 0;
      v24[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(25);
      swift_bridgeObjectRelease();
      unint64_t v15 = 0xD000000000000017;
      unint64_t v16 = "Invalid user input for ";
      goto LABEL_8;
    case 5:
      unint64_t result = 0xD00000000000001ALL;
      if (!(v27 | v28 | (unint64_t)v25 | v26 | *((void *)&v25 + 1))) {
        return 0xD000000000000024;
      }
      unint64_t v20 = v27 | v28 | v26 | *((void *)&v25 + 1);
      if ((void)v25 == 1 && !v20) {
        return 0xD00000000000003FLL;
      }
      if ((void)v25 == 2 && !v20) {
        return 0xD000000000000026;
      }
      if ((void)v25 != 3 || v20)
      {
        if ((void)v25 != 4 || v20)
        {
          if ((void)v25 != 5 || v20)
          {
            if ((void)v25 != 6 || v20)
            {
              if ((void)v25 != 7 || v20)
              {
                if ((void)v25 != 8 || v20)
                {
                  if ((void)v25 != 9 || v20)
                  {
                    if ((void)v25 != 10 || v20)
                    {
                      if ((void)v25 != 11 || v20)
                      {
                        if ((void)v25 != 12 || v20)
                        {
                          if ((void)v25 != 13 || v20)
                          {
                            if ((void)v25 == 14 && v20 == 0) {
                              return 0xD000000000000032;
                            }
                            else {
                              return 0xD00000000000001CLL;
                            }
                          }
                          else
                          {
                            return 0xD000000000000029;
                          }
                        }
                        else
                        {
                          return 0xD000000000000046;
                        }
                      }
                    }
                    else
                    {
                      return 0xD000000000000013;
                    }
                  }
                  else
                  {
                    return 0xD000000000000014;
                  }
                }
              }
              else
              {
                return 0xD000000000000025;
              }
            }
            else
            {
              return 0xD00000000000001DLL;
            }
          }
          else
          {
            return 0xD000000000000017;
          }
        }
        else
        {
          return 0xD000000000000018;
        }
      }
      return result;
    default:
      uint64_t v2 = (void *)*((void *)&v25 + 1);
      _StringGuts.grow(_:)(22);
      swift_bridgeObjectRelease();
      v24[0] = 0x7420656C62616E55;
      v24[1] = 0xEF2064616572206FLL;
      v3._uint64_t countAndFlagsBits = v1;
      v3._object = v2;
      String.append(_:)(v3);
      uint64_t v4 = 0x656C696620;
      unint64_t v5 = 0xE500000000000000;
      goto LABEL_9;
  }
}

unint64_t sub_10002B388()
{
  sub_10002B3DC(v0, v2);
  return sub_10002AE54();
}

_OWORD *sub_10002B3DC(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

id sub_10002B3F4()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for MCCSecretAgentService()) init];
  qword_100067A30 = (uint64_t)result;
  return result;
}

char *sub_10002B424()
{
  uint64_t v1 = qword_100063EC0;
  long long v2 = v0;
  if (v1 != -1) {
    swift_once();
  }
  long long v3 = (void *)qword_100067A40;
  *(void *)&v2[OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager] = qword_100067A40;
  uint64_t v4 = qword_100063EB8;
  id v5 = v3;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_100067A38;
  *(void *)&v2[OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationSyncManager] = qword_100067A38;
  uint64_t v7 = qword_100063E70;
  id v8 = v6;
  if (v7 != -1) {
    swift_once();
  }
  unint64_t v9 = (void *)qword_100067990;
  *(void *)&v2[OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_apnsManager] = qword_100067990;
  id v10 = v9;

  v19.receiver = v2;
  v19.super_class = (Class)type metadata accessor for MCCSecretAgentService();
  id v11 = [super init];
  uint64_t v12 = qword_100063E90;
  Swift::String v13 = (char *)v11;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100008D9C(v14, (uint64_t)qword_1000679D0);
  unint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "MCCSecretAgentService is initialized", v17, 2u);
    swift_slowDealloc();
  }

  *(void *)(*(void *)&v13[OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_apnsManager]
            + OBJC_IVAR____TtC15icloudmailagent11APNSManager_delegate
            + 8) = &off_10005EE40;
  swift_unknownObjectWeakAssign();
  return v13;
}

void sub_10002BA74(void *a1, int a2, int a3, void *aBlock, const char *a5)
{
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = qword_100063E90;
  id v13 = a1;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100008D9C(v9, (uint64_t)qword_1000679D0);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a5, v12, 2u);
    swift_slowDealloc();
  }

  _Block_release(v7);
}

void sub_10002BBB4(void *a1, int a2, int a3, int a4, void *aBlock, const char *a6)
{
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = qword_100063E90;
  id v14 = a1;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100008D9C(v10, (uint64_t)qword_1000679D0);
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, a6, v13, 2u);
    swift_slowDealloc();
  }

  _Block_release(v8);
}

void sub_10002BFDC(void *a1, int a2, void *aBlock, const char *a4, void (*a5)(uint64_t, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a1;
  sub_10002CFE8((uint64_t)v9, v8, a4, a5);
  _Block_release(v8);
  _Block_release(v8);
}

uint64_t sub_10002C138(void *a1, int a2, int a3, void *aBlock, const char *a5, void (*a6)(uint64_t, uint64_t, uint64_t, void *))
{
  id v9 = _Block_copy(aBlock);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v9);
  id v13 = a1;
  sub_10002CE94(v10, v12, (uint64_t)v13, v9, a5, a6);
  _Block_release(v9);
  _Block_release(v9);

  return swift_bridgeObjectRelease();
}

id sub_10002C514()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCCSecretAgentService();
  return [super dealloc];
}

uint64_t type metadata accessor for MCCSecretAgentService()
{
  return self;
}

void sub_10002C5C8(uint64_t a1, uint64_t a2, void *a3)
{
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100008D9C(v6, (uint64_t)qword_100067A00);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    v30[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v31 = sub_10004B330(a2, (unint64_t)a3, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v10 = Dictionary.description.getter();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *(void *)&long long v31 = sub_10004B330(v10, v12, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MCCSecretAgentService] Did Receive push message: %s, %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v13._uint64_t countAndFlagsBits = a2;
  v13._object = a3;
  Swift::Int v14 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DAF0, v13);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    AnyHashable.init<A>(_:)();
    if (*(void *)(a1 + 16) && (unint64_t v15 = sub_100047484((uint64_t)v30), (v16 & 1) != 0))
    {
      sub_10000A6C0(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&v31);
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
    }
    sub_10001179C((uint64_t)v30);
    if (*((void *)&v32 + 1))
    {
      sub_100008E28(&qword_1000647C8);
      if (swift_dynamicCast())
      {
        uint64_t v17 = MEMORY[0x73746E657675];
        if (MEMORY[0x73746E657675])
        {
          uint64_t v18 = 0;
          do
          {
            uint64_t v19 = *(void *)(8 * v18 + 0x73746E657685);
            swift_bridgeObjectRetain();
            AnyHashable.init<A>(_:)();
            if (*(void *)(v19 + 16) && (unint64_t v20 = sub_100047484((uint64_t)v30), (v21 & 1) != 0))
            {
              sub_10000A6C0(*(void *)(v19 + 56) + 32 * v20, (uint64_t)&v31);
            }
            else
            {
              long long v31 = 0u;
              long long v32 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_10001179C((uint64_t)v30);
            if (*((void *)&v32 + 1))
            {
              if (swift_dynamicCast())
              {
                v22._uint64_t countAndFlagsBits = 1701869940;
                v22._object = (void *)0xE400000000000000;
                Swift::Int v23 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DB28, v22);
                swift_bridgeObjectRelease();
                if (v23)
                {
                  os_log_type_t v24 = Logger.logObject.getter();
                  os_log_type_t v25 = static os_log_type_t.default.getter();
                  if (os_log_type_enabled(v24, v25))
                  {
                    unint64_t v26 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)unint64_t v26 = 0;
                    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Received an unknown event type", v26, 2u);
                    swift_slowDealloc();
                  }
                }
                else
                {
                  sub_100030364();
                }
              }
            }
            else
            {
              sub_10000FECC((uint64_t)&v31);
            }
            ++v18;
          }
          while (v17 != v18);
        }
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      sub_10000FECC((uint64_t)&v31);
    }
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      char v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[MCCSecretAgentService] ignoring received push", v29, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10002CB04(uint64_t a1, unint64_t a2)
{
  if (qword_100063E90 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100008D9C(v4, (uint64_t)qword_1000679D0);
  swift_bridgeObjectRetain_n();
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_10004B330(a1, a2, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "MCCSecretAgentService listCertificatesWithEmail is called for email: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_10002CCAC(void *a1, uint64_t a2, void *aBlock)
{
  _Block_copy(aBlock);
  if (qword_100063E90 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100008D9C(v6, (uint64_t)qword_1000679D0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "predictCommerceEmail MCCSecretAgentService predictCommerceEmailWithContext called", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t v10 = *(void *)(a2 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  Swift::Int v14 = &_swiftEmptyDictionarySingleton;
  _Block_copy(aBlock);
  sub_100039A64(v10, a1, (uint64_t)&v14, (void (**)(void, void, void))aBlock);
  uint64_t v12 = swift_bridgeObjectRetain();
  sub_100021160(v12);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*((void (**)(void *, Class, void))aBlock + 2))(aBlock, isa, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  _Block_release(aBlock);
}

void sub_10002CE94(uint64_t a1, uint64_t a2, uint64_t a3, void *aBlock, const char *a5, void (*a6)(uint64_t, uint64_t, uint64_t, void *))
{
  _Block_copy(aBlock);
  if (qword_100063E90 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100008D9C(v12, (uint64_t)qword_1000679D0);
  Swift::String v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, a5, v15, 2u);
    swift_slowDealloc();
  }

  uint64_t v16 = *(void *)(a3 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  _Block_copy(aBlock);
  a6(a1, a2, v16, aBlock);
  _Block_release(aBlock);

  _Block_release(aBlock);
}

void sub_10002CFE8(uint64_t a1, void *aBlock, const char *a3, void (*a4)(uint64_t, void *))
{
  _Block_copy(aBlock);
  if (qword_100063E90 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100008D9C(v8, (uint64_t)qword_1000679D0);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a3, v11, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  _Block_copy(aBlock);
  a4(v12, aBlock);
  _Block_release(aBlock);

  _Block_release(aBlock);
}

void sub_10002D124(uint64_t a1, uint64_t a2, void *aBlock)
{
  _Block_copy(aBlock);
  if (qword_100063E90 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100008D9C(v6, (uint64_t)qword_1000679D0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "MCCSecretAgentService createWebRule is called", v9, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v10 = *(char **)(a2 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  _Block_copy(aBlock);
  sub_10003E03C(a1, v10, (uint64_t)aBlock);
  _Block_release(aBlock);

  _Block_release(aBlock);
}

uint64_t sub_10002D258(unint64_t a1)
{
  if (qword_100063E90 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_1000679D0);
  long long v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "MCCSecretAgentService syncRecategorizationRules is called", v5, 2u);
    swift_slowDealloc();
  }

  if (qword_100063EB8 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_100067A38;
  sub_10002FE38();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v7 = result;
    if (!result) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v7) {
      goto LABEL_18;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v9 = 0;
  uint64_t v10 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v11 = *(id *)(a1 + 8 * v9 + 32);
    }
    uint64_t v12 = v11;
    if (*(void *)(v6 + v10))
    {
      swift_retain();
      sub_1000200F0(v12);
      swift_release();
    }
    ++v9;
  }
  while (v7 != v9);
LABEL_18:

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002D450(uint64_t a1, uint64_t a2, double a3)
{
  if (qword_100063E90 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100008D9C(v6, (uint64_t)qword_1000679D0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "MCCSecretAgentService clearAllUserOverrides called", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t v10 = *(void *)(a1 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationSyncManager);
  sub_10002FE38();
  if (*(void *)(v10 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager))
  {
    swift_retain();
    sub_100020744(a3);
    swift_release();
  }
  id v11 = *(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 16);

  return v11(a2, 1, 0);
}

unint64_t sub_10002D5A0()
{
  unint64_t result = qword_1000647C0;
  if (!qword_1000647C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000647C0);
  }
  return result;
}

uint64_t sub_10002D5E0()
{
  uint64_t v1 = SecIdentityCreate();
  if (!v1)
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v7 = 0xD000000000000011;
    *(void *)(v7 + 8) = 0x80000001000537C0;
    *(void *)(v7 + 24) = 0;
    *(void *)(v7 + 32) = 0;
    *(void *)(v7 + 16) = &_mh_execute_header;
    *(unsigned char *)(v7 + 40) = 2;
    swift_willThrow();
    return v0;
  }
  uint64_t v2 = (void *)v1;
  CFTypeRef v9 = 0;
  type metadata accessor for SecIdentity(0);
  v8[3] = v3;
  v8[0] = v2;
  id v4 = v2;
  LODWORD(v0) = sub_10002EE94((uint64_t)v8, &v9);
  uint64_t result = sub_10000A788((uint64_t)v8);
  if (v0)
  {
    uint64_t v0 = v0;
    sub_100008DD4();
    swift_allocError();
    *(_OWORD *)uint64_t v6 = xmmword_10004E980;
    *(void *)(v6 + 24) = 0;
    *(void *)(v6 + 32) = 0;
    *(void *)(v6 + 16) = v0;
    *(unsigned char *)(v6 + 40) = 2;
    swift_willThrow();

    swift_unknownObjectRelease();
    return v0;
  }
  if (v9)
  {
    swift_unknownObjectRetain();

    swift_dynamicCast();
    uint64_t v0 = v8[0];
    swift_unknownObjectRelease();
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002D898(void *a1)
{
  type metadata accessor for SecCertificate(0);
  v7[3] = v2;
  v7[0] = a1;
  id v3 = a1;
  unsigned int v4 = sub_10002EE94((uint64_t)v7, 0);
  uint64_t result = sub_10000A788((uint64_t)v7);
  if (v4)
  {
    if (v4 != -25299)
    {
      sub_100008DD4();
      swift_allocError();
      *(void *)uint64_t v6 = 0xD000000000000023;
      *(void *)(v6 + 8) = 0x8000000100053790;
      *(void *)(v6 + 24) = 0;
      *(void *)(v6 + 32) = 0;
      *(void *)(v6 + 16) = v4;
      *(unsigned char *)(v6 + 40) = 2;
      return swift_willThrow();
    }
  }
  return result;
}

Class sub_10002DB34(void *a1, void *a2)
{
  Class result = sub_10002E47C((void *)kSecClassIdentity);
  if (!v2)
  {
    uint64_t v6 = (uint64_t)result;
    if (*((void *)result + 2))
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_10002F2A8(v6, a1, a2);
      swift_bridgeObjectRelease();
      if (*(void *)(v7 + 16))
      {
        sub_10000A6C0(v7 + 32, (uint64_t)&v16);
        swift_bridgeObjectRelease();
        if (*((void *)&v17 + 1))
        {
          sub_10000A71C(&v16, v18);
          sub_10000A71C(v18, &v16);
          type metadata accessor for SecIdentity(0);
          swift_dynamicCast();
          return (Class)v15;
        }
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
        swift_bridgeObjectRelease();
      }
      sub_10000FECC((uint64_t)&v16);
      if (qword_100063E80 != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for Logger();
      sub_100008D9C(v13, (uint64_t)qword_1000679A0);
      CFTypeRef v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v9, v10)) {
        goto LABEL_16;
      }
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      uint64_t v12 = "RefreshCertificate findSecIdentity error on filtering by certId";
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_100063E80 != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      sub_100008D9C(v8, (uint64_t)qword_1000679A0);
      CFTypeRef v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v9, v10)) {
        goto LABEL_16;
      }
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      uint64_t v12 = "RefreshCertificate No certificate available";
    }
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v12, v11, 2u);
    swift_slowDealloc();
LABEL_16:

    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v14 = 14;
    *(_OWORD *)(v14 + 8) = 0u;
    *(_OWORD *)(v14 + 24) = 0u;
    *(unsigned char *)(v14 + 40) = 5;
    return (Class)swift_willThrow();
  }
  return result;
}

void sub_10002DE9C(void *a1)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == SecIdentityGetTypeID())
  {
    id v5 = v1;
    id v6 = a1;
    sub_100025828((uint64_t)v5, (uint64_t)v6);

    if (!v2) {
      swift_dynamicCast();
    }
  }
  else
  {
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    CFGetTypeID(a1);
    v7._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v8 = 0xD00000000000002FLL;
    *(void *)(v8 + 8) = 0x8000000100053700;
    *(void *)(v8 + 24) = 0;
    *(void *)(v8 + 32) = 0;
    *(void *)(v8 + 16) = &_mh_execute_header;
    *(unsigned char *)(v8 + 40) = 2;
    swift_willThrow();
  }
}

uint64_t sub_10002E008(CFTypeRef *a1, uint64_t a2, void *a3)
{
  sub_100008E28(&qword_100064800);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10004E990;
  type metadata accessor for CFString(0);
  uint64_t v7 = v6;
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 32) = kSecUseDataProtectionKeychain;
  *(unsigned char *)(v5 + 64) = 1;
  *(void *)(v5 + 120) = v6;
  *(void *)(v5 + 88) = &type metadata for Bool;
  *(void *)(v5 + 96) = kSecAttrSynchronizable;
  *(unsigned char *)(v5 + 128) = 1;
  *(void *)(v5 + 152) = &type metadata for Bool;
  *(void *)(v5 + 160) = kSecAttrAccessGroup;
  uint64_t v8 = *(void *)(a2 + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  uint64_t v9 = *(void *)(a2 + OBJC_IVAR___KeychainManager_keychainAccessGroup + 8);
  *(void *)(v5 + 184) = v6;
  *(void *)(v5 + 192) = v8;
  *(void *)(v5 + 200) = v9;
  *(void *)(v5 + 248) = v6;
  *(void *)(v5 + 216) = &type metadata for String;
  *(void *)(v5 + 224) = kSecValueRef;
  type metadata accessor for SecIdentity(0);
  *(void *)(v5 + 256) = a3;
  *(void *)(v5 + 312) = v7;
  *(void *)(v5 + 280) = v10;
  *(void *)(v5 + 288) = kSecReturnPersistentRef;
  *(void *)(v5 + 344) = &type metadata for Bool;
  *(unsigned char *)(v5 + 320) = 1;
  sub_10002EE54();
  CFStringRef v11 = (id)kSecUseDataProtectionKeychain;
  CFStringRef v12 = (id)kSecAttrSynchronizable;
  CFStringRef v13 = (id)kSecAttrAccessGroup;
  swift_bridgeObjectRetain();
  CFStringRef v14 = (id)kSecValueRef;
  id v15 = a3;
  CFStringRef v16 = (id)kSecReturnPersistentRef;
  CFDictionaryRef v17 = (const __CFDictionary *)NSDictionary.init(dictionaryLiteral:)();
  uint64_t v18 = SecItemCopyMatching(v17, a1);

  return v18;
}

uint64_t sub_10002E268(CFTypeRef *a1, uint64_t a2, unint64_t a3)
{
  sub_100008E28(&qword_100064800);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004E280;
  type metadata accessor for CFString(0);
  *(void *)(v6 + 32) = kSecValuePersistentRef;
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = a2;
  *(void *)(v6 + 72) = a3;
  *(void *)(v6 + 120) = v7;
  *(void *)(v6 + 88) = &type metadata for Data;
  *(void *)(v6 + 96) = kSecReturnRef;
  *(void *)(v6 + 152) = &type metadata for Bool;
  *(unsigned char *)(v6 + 128) = 1;
  sub_10002EE54();
  CFStringRef v8 = (id)kSecValuePersistentRef;
  sub_10000A848(a2, a3);
  CFStringRef v9 = (id)kSecReturnRef;
  CFDictionaryRef v10 = (const __CFDictionary *)NSDictionary.init(dictionaryLiteral:)();
  uint64_t v11 = SecItemCopyMatching(v10, a1);

  return v11;
}

Class sub_10002E47C(void *a1)
{
  sub_100008E28(&qword_100064700);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E9A0;
  *(void *)(inited + 32) = kSecClass;
  type metadata accessor for CFString(0);
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 64) = v4;
  *(void *)(inited + 72) = kSecUseDataProtectionKeychain;
  *(unsigned char *)(inited + 80) = 1;
  *(void *)(inited + 104) = &type metadata for Bool;
  *(void *)(inited + 112) = kSecAttrSynchronizable;
  *(unsigned char *)(inited + 120) = 1;
  *(void *)(inited + 144) = &type metadata for Bool;
  *(void *)(inited + 152) = kSecAttrAccessGroup;
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR___KeychainManager_keychainAccessGroup + 8);
  *(void *)(inited + 160) = v5;
  *(void *)(inited + 168) = v6;
  *(void *)(inited + 184) = &type metadata for String;
  *(void *)(inited + 192) = kSecMatchLimit;
  *(void *)(inited + 200) = kSecMatchLimitAll;
  *(void *)(inited + 224) = v4;
  *(void *)(inited + 232) = kSecReturnRef;
  *(void *)(inited + 264) = &type metadata for Bool;
  *(unsigned char *)(inited + 240) = 1;
  CFStringRef v7 = (id)kSecClass;
  id v8 = a1;
  CFStringRef v9 = (id)kSecUseDataProtectionKeychain;
  CFStringRef v10 = (id)kSecAttrSynchronizable;
  CFStringRef v11 = (id)kSecAttrAccessGroup;
  swift_bridgeObjectRetain();
  CFStringRef v12 = (id)kSecMatchLimit;
  CFStringRef v13 = (id)kSecMatchLimitAll;
  CFStringRef v14 = (id)kSecReturnRef;
  sub_10003EFDC(inited);
  CFTypeRef result = 0;
  sub_10002E8D4();
  v15.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unsigned int v16 = SecItemCopyMatching(v15.super.isa, &result);

  if (v16)
  {
    sub_100008DD4();
    swift_allocError();
    *(_OWORD *)uint64_t v17 = xmmword_10004E9B0;
    *(void *)(v17 + 24) = 0;
    *(void *)(v17 + 32) = 0;
    *(void *)(v17 + 16) = v16;
    *(unsigned char *)(v17 + 40) = 2;
    swift_willThrow();
    swift_unknownObjectRelease();
  }
  else
  {
    if (result)
    {
      type metadata accessor for CFArray(0);
      swift_unknownObjectRetain();
      (id)swift_dynamicCastUnknownClassUnconditional();
      Class v18 = (Class)static Array._forceBridgeFromObjectiveC(_:result:)();
      __break(1u);
      return v18;
    }
    return (Class)_swiftEmptyArrayStorage;
  }
  return v15.super.isa;
}

id sub_10002E868()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KeychainManager();
  return [super dealloc];
}

uint64_t type metadata accessor for KeychainManager()
{
  return self;
}

unint64_t sub_10002E8D4()
{
  unint64_t result = qword_100063FA0;
  if (!qword_100063FA0)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063FA0);
  }
  return result;
}

uint64_t sub_10002E92C(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10002E964(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10002E98C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002E9EC(a1, a2, a3, *v3);
  NSObject *v3 = (char *)result;
  return result;
}

uint64_t sub_10002E9AC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002EB58(a1, a2, a3, *v3);
  NSObject *v3 = (char *)result;
  return result;
}

uint64_t sub_10002E9CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002ECC8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10002E9EC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008E28(&qword_100064208);
    CFStringRef v10 = (char *)swift_allocObject();
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
    CFStringRef v10 = (char *)&_swiftEmptyArrayStorage;
  }
  CFStringRef v13 = v10 + 32;
  CFStringRef v14 = a4 + 32;
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

uint64_t sub_10002EB58(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008E28(&qword_100064810);
    CFStringRef v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    CFStringRef v10 = (char *)_swiftEmptyArrayStorage;
  }
  CFStringRef v13 = v10 + 32;
  CFStringRef v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
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

uint64_t sub_10002ECC8(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008E28(&qword_100064210);
    CFStringRef v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    CFStringRef v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_100008E28((uint64_t *)&unk_100063F40);
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

unint64_t sub_10002EE54()
{
  unint64_t result = qword_100064808;
  if (!qword_100064808)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100064808);
  }
  return result;
}

uint64_t sub_10002EE94(uint64_t a1, CFTypeRef *a2)
{
  sub_100008E28(&qword_100064700);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E990;
  *(void *)(inited + 32) = kSecValueRef;
  sub_10000A6C0(a1, inited + 40);
  *(void *)(inited + 72) = kSecUseDataProtectionKeychain;
  *(unsigned char *)(inited + 80) = 1;
  *(void *)(inited + 104) = &type metadata for Bool;
  *(void *)(inited + 112) = kSecAttrSynchronizable;
  *(unsigned char *)(inited + 120) = 1;
  *(void *)(inited + 144) = &type metadata for Bool;
  *(void *)(inited + 152) = kSecAttrAccessGroup;
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR___KeychainManager_keychainAccessGroup + 8);
  *(void *)(inited + 160) = v6;
  *(void *)(inited + 168) = v7;
  *(void *)(inited + 184) = &type metadata for String;
  *(void *)(inited + 192) = kSecReturnPersistentRef;
  *(void *)(inited + 224) = &type metadata for Bool;
  *(unsigned char *)(inited + 200) = 1;
  CFStringRef v8 = (id)kSecValueRef;
  CFStringRef v9 = (id)kSecUseDataProtectionKeychain;
  CFStringRef v10 = (id)kSecAttrSynchronizable;
  CFStringRef v11 = (id)kSecAttrAccessGroup;
  swift_bridgeObjectRetain();
  CFStringRef v12 = (id)kSecReturnPersistentRef;
  sub_10003EFDC(inited);
  type metadata accessor for CFString(0);
  sub_10002E8D4();
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v14 = SecItemAdd(isa, a2);

  return v14;
}

void sub_10002F010(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_10000A848(a1, a2);
  sub_1000257C8(a1, a2);
  sub_100008F8C(a1, a2);
  type metadata accessor for SecIdentity(0);
  uint64_t v6 = (__SecIdentity *)swift_dynamicCastUnknownClassUnconditional();
  noErr.getter();
  SecCertificateRef certificateRef = 0;
  OSStatus v7 = SecIdentityCopyCertificate(v6, &certificateRef);
  SecCertificateRef v8 = certificateRef;
  if (noErr.getter() == v7)
  {
    CFStringRef v9 = *(void (**)(uint64_t, __SecCertificate *, void))(a3 + 16);
    CFStringRef v10 = v8;
    v9(a3, v10, 0);
  }
  else
  {
    if (qword_100063E80 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100008D9C(v11, (uint64_t)qword_1000679A0);
    CFStringRef v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 67109120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error copying certificate (status %d)", v14, 8u);
      swift_slowDealloc();
    }

    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v15 = 9;
    *(_OWORD *)(v15 + 8) = 0u;
    *(_OWORD *)(v15 + 24) = 0u;
    *(unsigned char *)(v15 + 40) = 5;
    swift_willThrow();

    swift_errorRetain();
    unsigned int v16 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, void *))(a3 + 16))(a3, 0, v16);

    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_10002F2A8(uint64_t result, void *a2, void *a3)
{
  uint64_t v4 = result;
  uint64_t v5 = _swiftEmptyArrayStorage;
  unint64_t v20 = _swiftEmptyArrayStorage;
  uint64_t v16 = *(void *)(result + 16);
  if (v16)
  {
    unint64_t v8 = 0;
    uint64_t v9 = result + 32;
    while (1)
    {
      if (v8 >= *(void *)(v4 + 16))
      {
        __break(1u);
        return result;
      }
      sub_10000A6C0(v9, (uint64_t)v19);
      sub_10000A6C0((uint64_t)v19, (uint64_t)v18);
      type metadata accessor for SecIdentity(0);
      swift_dynamicCast();
      CFStringRef v10 = sub_100008BB4(v17);
      uint64_t v5 = v11;

      if (v3)
      {
        sub_10000A788((uint64_t)v19);
        swift_bridgeObjectRelease();
        swift_release();
        return (uint64_t)v5;
      }
      if (v10 == a2 && v5 == a3) {
        break;
      }
      char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_11;
      }
      unint64_t result = sub_10000A788((uint64_t)v19);
LABEL_4:
      ++v8;
      v9 += 32;
      if (v16 == v8)
      {
        uint64_t v5 = v20;
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    sub_10000A71C(v19, v18);
    os_log_type_t v13 = v20;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10002E9AC(0, v13[2] + 1, 1);
      os_log_type_t v13 = v20;
    }
    unint64_t v15 = v13[2];
    unint64_t v14 = v13[3];
    if (v15 >= v14 >> 1)
    {
      sub_10002E9AC(v14 > 1, v15 + 1, 1);
      os_log_type_t v13 = v20;
    }
    v13[2] = v15 + 1;
    unint64_t result = (uint64_t)sub_10000A71C(v18, &v13[4 * v15 + 4]);
    goto LABEL_4;
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return (uint64_t)v5;
}

void sub_10002F4AC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  Class v10 = sub_10002DB34(a1, a2);
  sub_10002DE9C(v10);
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  sub_10000A848(v5, v7);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class, void))(a4 + 16))(a4, isa, 0);

  sub_100008F8C(v6, v8);
  sub_100008F8C(v6, v8);
}

uint64_t _s5ErrorOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s5ErrorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 5;
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
        JUMPOUT(0x10002F8A4);
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
          void *result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

unint64_t sub_10002F8E0(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000026;
      break;
    case 4:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10002F98C()
{
  return sub_10002F8E0(*v0);
}

unint64_t sub_10002F998()
{
  unint64_t result = qword_100064818;
  if (!qword_100064818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064818);
  }
  return result;
}

id sub_10002F9EC()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for CategorizationSyncManager()) init];
  qword_100067A38 = (uint64_t)result;
  return result;
}

id sub_10002FA78()
{
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timerTransaction] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_networkTransaction] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_networkMonitor] = 0;
  uint64_t v1 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_deviceLockObserver;
  type metadata accessor for DeviceLockObserver();
  swift_allocObject();
  int v2 = v0;
  *(void *)&v0[v1] = sub_100042A80();
  *(void *)&v2[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v2[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_fetchCancellable] = 0;
  *(void *)&v2[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_minuteInterval] = 1440;
  *(void *)&v2[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timer] = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CategorizationSyncManager();
  id v3 = [super init];
  sub_10002FE38();
  sub_10002FB9C();

  return v3;
}

uint64_t sub_10002FB9C()
{
  return swift_release();
}

void sub_10002FCB8(unsigned char *a1)
{
  if ((*a1 & 1) == 0)
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100008D9C(v1, (uint64_t)qword_100067A00);
    int v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      unsigned int v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Device is unlocked, retrying if any...", v4, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      unsigned int v6 = (void *)Strong;
      id v7 = [self standardUserDefaults];
      NSString v8 = String._bridgeToObjectiveC()();
      unsigned int v9 = [v7 BOOLForKey:v8];

      if (v9) {
        sub_100030364();
      }
    }
  }
}

void sub_10002FE38()
{
  uint64_t v1 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager;
  if (!*(void *)(v0 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager))
  {
    type metadata accessor for APIManager();
    swift_allocObject();
    *(void *)(v0 + v1) = sub_10001CF34();
    swift_release();
  }
}

uint64_t sub_1000300AC()
{
  uint64_t v1 = v0;
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_100067A00);
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    objc_super v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting CategorizationSyncManager...", v5, 2u);
    swift_slowDealloc();
  }

  int64_t v6 = sub_100031CF8();
  *(void *)(v1 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_minuteInterval) = v6;
  uint64_t v7 = self;
  if ((unsigned __int128)(v6 * (__int128)60) >> 64 != (60 * v6) >> 63)
  {
    __break(1u);
    goto LABEL_9;
  }
  NSString v8 = (void *)v7;
  double v9 = (double)(60 * v6);
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17[4] = sub_1000328F0;
  v17[5] = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100037BD8;
  v17[3] = &unk_10005EF30;
  uint64_t v11 = _Block_copy(v17);
  swift_release();
  id v12 = [v8 scheduledTimerWithTimeInterval:1 repeats:v11 block:v9];
  _Block_release(v11);
  os_log_type_t v13 = *(void **)(v1 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timer);
  *(void *)(v1 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timer) = v12;

  sub_1000312DC();
  if (qword_100063EC0 != -1) {
LABEL_9:
  }
    swift_once();
  uint64_t v14 = sub_10003C28C();
  uint64_t v15 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timerTransaction;
  *(void *)(v1 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timerTransaction) = v14;
  swift_unknownObjectRelease();
  *(void *)(v1 + v15) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_100030364()
{
  sub_100008E28(&qword_100064938);
  __chkstk_darwin();
  uint64_t v39 = (char *)&v31 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v1 = *(void *)(v33 - 8);
  __chkstk_darwin();
  os_log_type_t v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008E28(&qword_100064940);
  __chkstk_darwin();
  objc_super v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  double v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008E28(&qword_100064948);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  uint64_t v35 = v11;
  __chkstk_darwin();
  os_log_type_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100008E28(&qword_100064950);
  uint64_t v37 = *(void *)(v14 - 8);
  uint64_t v38 = v14;
  __chkstk_darwin();
  uint64_t v36 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  sub_100008D9C(v16, (uint64_t)qword_100067A00);
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "fetchRules called, debouncing for 5 seconds...", v19, 2u);
    swift_slowDealloc();
  }

  uint64_t v32 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_fetchCancellable;
  if (*(void *)(v40 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_fetchCancellable))
  {
    swift_retain();
    AnyCancellable.cancel()();
    swift_release();
  }
  id v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  unint64_t v20 = v13;
  Just.init(_:)();
  static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  sub_100022940(0, (unint64_t *)&qword_1000640F8);
  uint64_t v21 = v33;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for DispatchQoS.QoSClass.default(_:), v33);
  Swift::String v22 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v21);
  id v41 = v22;
  uint64_t v23 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  uint64_t v24 = (uint64_t)v39;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v39, 1, 1, v23);
  sub_100008EB4(&qword_100064958, &qword_100064948);
  sub_1000329A4();
  os_log_type_t v25 = v36;
  uint64_t v26 = v34;
  Publisher.delay<A>(for:tolerance:scheduler:options:)();
  sub_10000A72C(v24, &qword_100064938);

  sub_10000A72C((uint64_t)v5, &qword_100064940);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v20, v26);
  swift_allocObject();
  uint64_t v27 = v40;
  swift_unknownObjectWeakInit();
  sub_100008EB4(&qword_100064968, &qword_100064950);
  uint64_t v28 = v38;
  uint64_t v29 = Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v25, v28);
  *(void *)(v27 + v32) = v29;
  return swift_release();
}

void sub_100030988()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_1000309DC();
  }
}

void sub_1000309DC()
{
  uint64_t v1 = v0;
  sub_10002FE38();
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_100067A00);
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    objc_super v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching Re-Categorization rules...", v5, 2u);
    swift_slowDealloc();
  }

  if (*(void *)(v1 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager))
  {
    swift_retain();
    sub_10001FC64();
    swift_release();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_100008E28(&qword_100064928);
    sub_100008EB4(&qword_100064930, &qword_100064928);
    Publisher.sink(receiveCompletion:receiveValue:)();
    swift_release();
    swift_release();
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();
    swift_release();
  }
}

void sub_100030BD8(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 24);
  if (v1 != 255)
  {
    uint64_t v3 = *(void *)a1;
    uint64_t v2 = *(void *)(a1 + 8);
    uint64_t v4 = *(void *)(a1 + 16);
    sub_1000223B0();
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100008D9C(v5, (uint64_t)qword_100067A00);
    sub_1000223B0();
    oslog = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      if (v1)
      {
        uint64_t v8 = Dictionary.description.getter();
        unint64_t v10 = v9;
        sub_100022580(v3, v2, v4, v1);
      }
      else
      {
        uint64_t v8 = v2;
        unint64_t v10 = v4;
      }
      sub_10004B330(v8, v10, &v12);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100022580(v3, v2, v4, v1);
      sub_100022580(v3, v2, v4, v1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Failed to fetch rules: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100022580(v3, v2, v4, v1);
      sub_100022580(v3, v2, v4, v1);
    }
  }
}

void sub_100030E6C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v3 = (id)Strong;
    unint64_t v4 = *(void *)(v1 + 16);
    if (v4)
    {
      swift_retain();
      OS_dispatch_queue.sync<A>(execute:)();
      swift_release();
      if (v25 == 1)
      {
        if (qword_100063EA0 != -1) {
          swift_once();
        }
        uint64_t v5 = type metadata accessor for Logger();
        sub_100008D9C(v5, (uint64_t)qword_100067A00);
        os_log_type_t v6 = Logger.logObject.getter();
        os_log_type_t v7 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v6, v7))
        {
          uint64_t v8 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unfortunately device is locked, deferring it until it is unlocked.", v8, 2u);
          swift_slowDealloc();
        }

        id v9 = [self standardUserDefaults];
        NSString v10 = String._bridgeToObjectiveC()();
        [v9 setBool:1 forKey:v10];

        id v3 = v10;
      }
      else
      {
        id v3 = v3;
        uint64_t v11 = swift_bridgeObjectRetain();
        unint64_t v12 = (unint64_t)sub_1000321F8(v11);
        swift_bridgeObjectRelease();

        if (qword_100063EC0 != -1) {
          swift_once();
        }
        if (v12 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v14 = _bridgeCocoaArray<A>(_:)();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v13 = v12 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain();
          dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
          uint64_t v14 = v12;
          if (!swift_dynamicCastMetatype())
          {
            uint64_t v23 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
            uint64_t v14 = v12;
            if (v23)
            {
              uint64_t v24 = (void *)(v13 + 32);
              while (*v24)
              {
                ++v24;
                if (!--v23)
                {
                  uint64_t v14 = v12;
                  goto LABEL_13;
                }
              }
              uint64_t v14 = v13 | 1;
            }
          }
        }
LABEL_13:
        sub_10003B910(v14);
        swift_bridgeObjectRelease();
        uint64_t v15 = self;
        id v16 = [v15 standardUserDefaults];
        NSString v17 = String._bridgeToObjectiveC()();
        [v16 setBool:0 forKey:v17];

        if (v4 > *(void *)(v1 + 16))
        {
          __break(1u);
          return;
        }
        double v18 = *(double *)(v1 + (v4 << 6) + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v19 = [v15 standardUserDefaults];
        NSString v20 = String._bridgeToObjectiveC()();
        [v19 setDouble:v20 forKey:v18];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if (v12 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v21 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        uint64_t v22 = swift_bridgeObjectRelease();
        if (v21 == 100) {
          sub_100030364(v22);
        }
      }
    }
  }
}

void sub_1000312DC()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v13 = *(void *)(v1 - 8);
  uint64_t v14 = v1;
  __chkstk_darwin(v1);
  id v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for NWInterface.InterfaceType();
  __chkstk_darwin(v6);
  (*(void (**)(char *, void))(v8 + 104))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for NWInterface.InterfaceType.wifi(_:));
  type metadata accessor for NWPathMonitor();
  swift_allocObject();
  uint64_t v9 = NWPathMonitor.init(requiredInterfaceType:)();
  uint64_t v10 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_networkMonitor;
  *(void *)(v0 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_networkMonitor) = v9;
  swift_release();
  if (*(void *)(v0 + v10))
  {
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    swift_retain();
    sub_100032918((uint64_t)sub_100032910);
    NWPathMonitor.pathUpdateHandler.setter();
    swift_release();
    swift_release_n();
  }
  sub_100022940(0, (unint64_t *)&qword_1000640F8);
  static DispatchQoS.unspecified.getter();
  uint64_t v15 = _swiftEmptyArrayStorage;
  sub_100032928();
  sub_100008E28(&qword_100064100);
  sub_100008EB4(&qword_100064920, &qword_100064100);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v14);
  uint64_t v11 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  if (*(void *)(v0 + v10))
  {
    swift_retain();
    NWPathMonitor.start(queue:)();
    swift_release();
  }
}

uint64_t sub_100031684()
{
  uint64_t v0 = type metadata accessor for NWPath.Status();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v21 - v5;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v8 = (char *)result;
    if (qword_100063EC0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_10003C28C();
    uint64_t v10 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_networkTransaction;
    *(void *)&v8[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_networkTransaction] = v9;
    swift_unknownObjectRelease();
    NWPath.status.getter();
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for NWPath.Status.satisfied(_:), v0);
    char v11 = static NWPath.Status.== infix(_:_:)();
    uint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
    v12(v4, v0);
    v12(v6, v0);
    if (v11)
    {
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for Logger();
      sub_100008D9C(v13, (uint64_t)qword_100067A00);
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        id v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Network status changed, syncing pending rules", v16, 2u);
        swift_slowDealloc();
      }

      sub_10002FE38();
      if (*(void *)&v8[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager])
      {
        swift_retain();
        sub_10001EF30();
        swift_release();
      }
    }
    else
    {
      if (qword_100063EA0 != -1) {
        swift_once();
      }
      uint64_t v17 = type metadata accessor for Logger();
      sub_100008D9C(v17, (uint64_t)qword_100067A00);
      double v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        NSString v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Network is not reachable", v20, 2u);
        swift_slowDealloc();
      }
    }
    *(void *)&v8[v10] = 0;

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000319F0()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (char *)result;
    if (qword_100063EC0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_10003C28C();
    uint64_t v3 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timerTransaction;
    *(void *)&v1[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timerTransaction] = v2;
    swift_unknownObjectRelease();
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100008D9C(v4, (uint64_t)qword_100067A00);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Timer tickled...", v7, 2u);
      swift_slowDealloc();
    }

    sub_100030364();
    sub_10002FE38();
    if (*(void *)&v1[OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager])
    {
      swift_retain();
      sub_10001EF30();
      swift_release();
    }
    sub_100031BA0();
    *(void *)&v1[v3] = 0;

    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100031BA0()
{
  unint64_t v1 = sub_100031CF8();
  if (*(void *)(v0 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_minuteInterval) != v1)
  {
    int64_t v2 = v1;
    *(void *)(v0 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_minuteInterval) = v1;
    uint64_t v3 = self;
    if ((unsigned __int128)(v2 * (__int128)60) >> 64 == (60 * v2) >> 63)
    {
      uint64_t v4 = (void *)v3;
      double v5 = (double)(60 * v2);
      uint64_t v6 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v10[4] = sub_1000328F0;
      v10[5] = v6;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 1107296256;
      _OWORD v10[2] = sub_100037BD8;
      v10[3] = &unk_10005EF08;
      uint64_t v7 = _Block_copy(v10);
      swift_release();
      id v8 = [v4 scheduledTimerWithTimeInterval:1 repeats:v7 block:v5];
      _Block_release(v7);
      uint64_t v9 = *(void **)(v0 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timer);
      *(void *)(v0 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timer) = v8;
    }
    else
    {
      __break(1u);
    }
  }
}

unint64_t sub_100031CF8()
{
  uint64_t v1 = v0;
  id v2 = sub_100032464();
  if (!v2)
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100008D9C(v9, (uint64_t)qword_100067A00);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Unable to get Apple Account for getTimerValue", v12, 2u);
      swift_slowDealloc();
    }

    return *(void *)(v1 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_minuteInterval);
  }
  uint64_t v3 = v2;
  id v4 = [v2 propertiesForDataclass:ACAccountDataclassMail];
  if (v4)
  {
    double v5 = v4;
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    AnyHashable.init<A>(_:)();
    if (*(void *)(v6 + 16) && (unint64_t v7 = sub_100047484((uint64_t)v21), (v8 & 1) != 0))
    {
      sub_10000A6C0(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v22);
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10001179C((uint64_t)v21);
    if (*((void *)&v23 + 1))
    {
      if (swift_dynamicCast())
      {

        return 0xD000000000000024;
      }
    }
    else
    {
      sub_10000A72C((uint64_t)&v22, (uint64_t *)&unk_1000648F0);
    }
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100008D9C(v18, (uint64_t)qword_100067A00);
    os_log_type_t v15 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v15, v19)) {
      goto LABEL_25;
    }
    NSString v20 = (uint8_t *)swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)NSString v20 = 136315138;
    *(void *)&long long v22 = sub_10004B330(0xD000000000000024, 0x8000000100053A10, v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v15, v19, "Mail Account bag value missing: %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
  }
  else
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100008D9C(v14, (uint64_t)qword_100067A00);
    os_log_type_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v15, v16)) {
      goto LABEL_25;
    }
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Unable to get account properties", v17, 2u);
  }
  swift_slowDealloc();
LABEL_25:

  return *(void *)(v1 + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_minuteInterval);
}

id sub_1000320F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CategorizationSyncManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CategorizationSyncManager()
{
  return self;
}

void *sub_1000321F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    id v4 = (double *)(a1 + 80);
    do
    {
      uint64_t v13 = v2;
      double v9 = *v4;
      Swift::String v10 = String.lowercased()();
      if (v10._countAndFlagsBits == 0x657474756C636564 && v10._object == (void *)0xEB00000000646572)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0) {
          swift_bridgeObjectRetain();
        }
      }
      id v5 = objc_allocWithZone((Class)RCOverrideRule);
      NSString v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      NSString v7 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      NSString v8 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v5 initWithEmailAddress:v6 displayName:v7 category:v8 categoryUpdateTime:v9 / 1000.0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v4 += 8;
      uint64_t v2 = v13 - 1;
    }
    while (v13 != 1);
    return _swiftEmptyArrayStorage;
  }
  return result;
}

id sub_100032464()
{
  id v0 = [self defaultStore];
  if (!v0) {
    __break(1u);
  }
  uint64_t v1 = v0;
  sub_100008E28(&qword_100064208);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10004DF40;
  *(void *)(v2 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v2 + 40) = v3;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v24 = 0;
  id v5 = [v1 accountsWithAccountTypeIdentifiers:isa error:&v24];

  id v6 = v24;
  if (!v5)
  {
    id v11 = v24;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100063EA0 == -1) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
  sub_100022940(0, (unint64_t *)&unk_100064900);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v6;

  if (!(v7 >> 62))
  {
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100008D9C(v19, (uint64_t)qword_100067A00);
    NSString v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      long long v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Missing AppleAccount", v22, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_14;
  }
LABEL_5:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_8;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_23:
    swift_once();
LABEL_10:
    uint64_t v12 = type metadata accessor for Logger();
    sub_100008D9C(v12, (uint64_t)qword_100067A00);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      id v24 = (id)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v15 = 136315138;
      swift_getErrorValue();
      uint64_t v16 = Error.localizedDescription.getter();
      sub_10004B330(v16, v17, (uint64_t *)&v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Unable to get AppleAccount: %s", v15, 0xCu);
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
  id v9 = *(id *)(v7 + 32);
LABEL_8:
  id v10 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000328B8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000328F0()
{
  return sub_1000319F0();
}

uint64_t sub_1000328F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100032908()
{
  return swift_release();
}

uint64_t sub_100032910()
{
  return sub_100031684();
}

uint64_t sub_100032918(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_100032928()
{
  unint64_t result = qword_100064910;
  if (!qword_100064910)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064910);
  }
  return result;
}

void sub_100032980(uint64_t *a1)
{
}

uint64_t sub_100032988@<X0>(unsigned char *a1@<X8>)
{
  return sub_100042A74(v1, a1);
}

unint64_t sub_1000329A4()
{
  unint64_t result = qword_100064960;
  if (!qword_100064960)
  {
    sub_100022940(255, (unint64_t *)&qword_1000640F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064960);
  }
  return result;
}

void sub_100032A0C()
{
}

void sub_100032A14(unsigned char *a1)
{
}

uint64_t sub_100032A24()
{
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100032B28(char *a1, char *a2)
{
  return sub_10001226C(*a1, *a2);
}

Swift::Int sub_100032B34()
{
  return Hasher._finalize()();
}

uint64_t sub_100032BA8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100032C08()
{
  return Hasher._finalize()();
}

uint64_t sub_100032C78@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005DC88, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_100032CD8(uint64_t *a1@<X8>)
{
  uint64_t v2 = 5522759;
  if (*v1) {
    uint64_t v2 = 1414745936;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_100032D08()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100032D68()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100032DB8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100032EC4()
{
  return sub_100033680();
}

uint64_t sub_100032EE4()
{
  return swift_release();
}

uint64_t sub_100032F98()
{
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  sub_100036CEC((unint64_t *)&qword_100064B00, (void (*)(void))sub_100036D5C);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

double sub_1000330D0@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v4 = *a1;
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  sub_100036CEC((unint64_t *)&qword_100064B00, (void (*)(void))sub_100036D5C);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_100033210(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  swift_getKeyPath();
  sub_100014948(v1, v2);
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  sub_100009000(v1, v2);
  return swift_release();
}

uint64_t sub_100033300()
{
  return swift_release();
}

uint64_t sub_1000333E8()
{
  return sub_100033834((uint64_t)&unk_10004ED50, (void (*)(void))sub_1000224D8);
}

uint64_t sub_100033408@<X0>(unsigned char *a1@<X8>)
{
  return sub_10003395C((void (*)(void))sub_1000224D8, a1);
}

uint64_t sub_100033428()
{
  return sub_100033A98();
}

uint64_t sub_100033448()
{
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  sub_100036B94();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100033550@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  sub_100036B94();
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100033660()
{
  return sub_100033680();
}

uint64_t sub_100033680()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003375C()
{
  return swift_release();
}

uint64_t sub_100033814()
{
  return sub_100033834((uint64_t)&unk_10004EDA0, (void (*)(void))sub_100036ACC);
}

uint64_t sub_100033834(uint64_t a1, void (*a2)(void))
{
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  a2();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v4;
}

uint64_t sub_10003393C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10003395C((void (*)(void))sub_100036ACC, a1);
}

uint64_t sub_10003395C@<X0>(void (*a1)(void)@<X4>, unsigned char *a2@<X8>)
{
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  a1();
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

uint64_t sub_100033A78()
{
  return sub_100033A98();
}

uint64_t sub_100033A98()
{
  return swift_release();
}

uint64_t sub_100033B60(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_release();
}

uint64_t sub_100033C0C()
{
  return swift_release();
}

uint64_t sub_100033D44()
{
  return swift_release();
}

uint64_t sub_100033E7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v13 = *a2;
  uint64_t v8 = v13;
  swift_getKeyPath();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100034004()
{
  return swift_release();
}

uint64_t sub_1000340DC(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = sub_100008E28(&qword_100064B28);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100008E28(&qword_100064B30);
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008E28(&qword_100064B38);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000902C(a1, a1[3]);
  sub_10003705C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_1000370B0();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_100037104();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

uint64_t sub_10003438C(void *a1)
{
  uint64_t v3 = sub_100008E28(&qword_100064B78);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000902C(a1, a1[3]);
  sub_100037158();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v10 = 0;
  sub_1000371AC();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    char v9 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100034504()
{
  return 0;
}

uint64_t sub_100034510(uint64_t a1)
{
  unint64_t v2 = sub_100037104();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003454C(uint64_t a1)
{
  unint64_t v2 = sub_100037104();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100034588@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1000345B8(uint64_t a1)
{
  unint64_t v2 = sub_1000370B0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000345F4(uint64_t a1)
{
  unint64_t v2 = sub_1000370B0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100034638()
{
  if (*v0) {
    return 0x7475416369736162;
  }
  else {
    return 0xD000000000000016;
  }
}

uint64_t sub_10003467C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100035A20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000346A4(uint64_t a1)
{
  unint64_t v2 = sub_10003705C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000346E0(uint64_t a1)
{
  unint64_t v2 = sub_10003705C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10003471C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100035B1C(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_10003474C(void *a1)
{
  return sub_1000340DC(a1, *v1);
}

uint64_t sub_100034768()
{
  if (*v0) {
    return 7955819;
  }
  else {
    return 0x73616C4361746164;
  }
}

uint64_t sub_1000347A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100035F6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000347C8(uint64_t a1)
{
  unint64_t v2 = sub_100037158();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100034804(uint64_t a1)
{
  unint64_t v2 = sub_100037158();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100034840@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10003605C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_10003486C(void *a1)
{
  return sub_10003438C(a1);
}

uint64_t sub_100034890()
{
  return 1818845549;
}

uint64_t sub_1000348A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1818845549 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100034928(uint64_t a1)
{
  unint64_t v2 = sub_1000377BC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100034964(uint64_t a1)
{
  unint64_t v2 = sub_1000377BC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000349A0(uint64_t a1)
{
  unint64_t v2 = sub_100037810();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000349DC(uint64_t a1)
{
  unint64_t v2 = sub_100037810();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100034A18(void *a1)
{
  return sub_100036214(a1);
}

uint64_t sub_100034A30(void *a1)
{
  uint64_t v2 = sub_100008E28(&qword_100064C00);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008E28(&qword_100064C08);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000902C(a1, a1[3]);
  sub_1000377BC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_100037810();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void *sub_100034C00(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  v2[6] = sub_100008E28(&qword_100064B10);
  *(void *)&long long v6 = v4;
  *((void *)&v6 + 1) = v4;
  uint64_t v7 = sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  uint64_t v8 = v7;
  v2[7] = swift_getOpaqueTypeConformance2();
  sub_100022888(v2 + 3);
  static PersistentModel.createBackingData<A>()();
  *((unsigned char *)v2 + 16) = 1;
  ObservationRegistrar.init()();
  *((unsigned char *)v2 + 16) = 0;
  sub_100036DD0(a1, (uint64_t)&v6);
  swift_beginAccess();
  sub_10000A788((uint64_t)(v2 + 3));
  sub_100009014(&v6, (uint64_t)(v2 + 3));
  swift_endAccess();
  sub_10000A788(a1);
  return v2;
}

uint64_t sub_100034D60()
{
  sub_10000A788(v0 + 24);
  uint64_t v1 = v0 + OBJC_IVAR____TtC15icloudmailagent15APIRequestModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100034E08()
{
  return type metadata accessor for APIRequestModel();
}

uint64_t type metadata accessor for APIRequestModel()
{
  uint64_t result = qword_1000649B0;
  if (!qword_1000649B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100034E5C()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APIRequestModel._SwiftDataNoType()
{
  return &type metadata for APIRequestModel._SwiftDataNoType;
}

uint64_t sub_100034F2C(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_100034C00(a1);
  return v2;
}

uint64_t sub_100034F6C@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_100036DD0(v1 + 24, a1);
}

uint64_t sub_100034FB8(long long *a1)
{
  uint64_t v3 = v1 + 24;
  swift_beginAccess();
  sub_10000A788(v3);
  sub_100009014(a1, v3);
  return swift_endAccess();
}

void (*sub_100035014(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess();
  sub_100036DD0(v1 + 24, (uint64_t)v3);
  return sub_100035090;
}

void sub_100035090(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (long long *)(*a1 + 40);
  if (a2)
  {
    uint64_t v4 = *(void *)(v2 + 128) + 24;
    sub_100036DD0(*a1, (uint64_t)v3);
    swift_beginAccess();
    sub_10000A788(v4);
    sub_100009014(v3, v4);
    swift_endAccess();
    sub_10000A788(v2);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 128) + 24;
    swift_beginAccess();
    sub_10000A788(v5);
    sub_100009014((long long *)v2, v5);
    swift_endAccess();
  }

  free((void *)v2);
}

Swift::Int sub_100035164()
{
  return Hasher._finalize()();
}

uint64_t sub_1000351C8()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10003523C()
{
  return Hasher._finalize()();
}

uint64_t sub_10003529C()
{
  return PersistentModel.id.getter();
}

uint64_t sub_100035310(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);

  return static PersistentModel.== infix(_:_:)(v3, v4, v2, v5);
}

uint64_t sub_100035390()
{
  return sub_1000369F4(&qword_100064A78, (void (*)(uint64_t))&type metadata accessor for PersistentIdentifier);
}

uint64_t sub_1000353D8()
{
  return sub_1000369F4(&qword_100064A80, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
}

uint64_t sub_100035420()
{
  return sub_1000369F4(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
}

uint64_t sub_100035468()
{
  return sub_1000369F4(&qword_100064A88, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
}

uint64_t sub_1000354B0()
{
  return sub_1000369F4(&qword_100064A90, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
}

void *sub_1000354F8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char a5, uint64_t a6, unint64_t a7, char a8, char *a9)
{
  char v10 = v9;
  uint64_t v27 = a6;
  unint64_t v28 = a7;
  uint64_t v33 = a9;
  uint64_t v15 = *v9;
  int v26 = a5 & 1;
  int v29 = a8 & 1;
  uint64_t v16 = type metadata accessor for Date();
  uint64_t v31 = *(void *)(v16 - 8);
  uint64_t v32 = v16;
  __chkstk_darwin();
  uint64_t v30 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v10[6] = sub_100008E28(&qword_100064B10);
  uint64_t v18 = sub_1000369F4(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  v36[0] = v15;
  v36[1] = v15;
  _OWORD v36[2] = v18;
  uint64_t v37 = v18;
  v10[7] = swift_getOpaqueTypeConformance2();
  sub_100022888(v10 + 3);
  static PersistentModel.createBackingData<A>()();
  *((unsigned char *)v10 + 16) = 1;
  ObservationRegistrar.init()();
  sub_100036DD0((uint64_t)(v10 + 3), (uint64_t)v36);
  sub_10000902C(v36, v37);
  swift_getKeyPath();
  uint64_t v34 = a1;
  unint64_t v35 = a2;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000A788((uint64_t)v36);
  sub_100036DD0((uint64_t)(v10 + 3), (uint64_t)v36);
  sub_10000902C(v36, v37);
  swift_getKeyPath();
  uint64_t v34 = a3;
  unint64_t v35 = a4;
  sub_100014948(a3, a4);
  sub_100008E28(&qword_100064AF0);
  sub_100036CEC(&qword_100064AE8, (void (*)(void))sub_100036C98);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100009000(a3, a4);
  sub_10000A788((uint64_t)v36);
  *((unsigned char *)v10 + 16) = 0;
  sub_100036DD0((uint64_t)(v10 + 3), (uint64_t)v36);
  sub_10000902C(v36, v37);
  swift_getKeyPath();
  LOBYTE(v34) = v26;
  sub_100036C24();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_10000A788((uint64_t)v36);
  sub_100036DD0((uint64_t)(v10 + 3), (uint64_t)v36);
  sub_10000902C(v36, v37);
  swift_getKeyPath();
  uint64_t v34 = v27;
  unint64_t v35 = v28;
  sub_100036B40();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000A788((uint64_t)v36);
  sub_100036DD0((uint64_t)(v10 + 3), (uint64_t)v36);
  sub_10000902C(v36, v37);
  swift_getKeyPath();
  LOBYTE(v34) = v29;
  sub_100036A78();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_10000A788((uint64_t)v36);
  char v20 = v30;
  uint64_t v19 = v31;
  uint64_t v22 = v32;
  os_log_type_t v21 = v33;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v30, v33, v32);
  sub_100036DD0((uint64_t)(v10 + 3), (uint64_t)v36);
  sub_10000902C(v36, v37);
  swift_getKeyPath();
  sub_1000369F4(&qword_100064AB0, (void (*)(uint64_t))&type metadata accessor for Date);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  long long v23 = *(void (**)(char *, uint64_t))(v19 + 8);
  v23(v20, v22);
  sub_10000A788((uint64_t)v36);
  v23(v21, v22);
  return v10;
}

uint64_t sub_100035A20(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000016 && a2 == 0x8000000100053B80
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475416369736162 && a2 == 0xE900000000000068)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100035B1C(uint64_t a1)
{
  uint64_t v2 = sub_100008E28(&qword_100064B58);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  __chkstk_darwin(v2);
  char v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008E28(&qword_100064B60);
  uint64_t v25 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008E28(&qword_100064B68);
  uint64_t v24 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000902C((void *)a1, *(void *)(a1 + 24));
  sub_10003705C();
  uint64_t v12 = v26;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v18 = v17;
    sub_100008E28(&qword_100064B70);
    *uint64_t v18 = &type metadata for APIRequestModel.AuthMethod;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, enum case for DecodingError.typeMismatch(_:), v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    sub_10000A788(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_1000370B0();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_100037104();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  sub_10000A788(v26);
  return a1;
}

uint64_t sub_100035F6C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73616C4361746164 && a2 == 0xE900000000000073;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7955819 && a2 == 0xE300000000000000)
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

uint64_t sub_10003605C(void *a1)
{
  uint64_t v2 = sub_100008E28(&qword_100064B90);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000902C(a1, a1[3]);
  sub_100037158();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v8[15] = 0;
  sub_100037200();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v8[14] = 1;
  uint64_t v6 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000A788((uint64_t)a1);
  return v6;
}

uint64_t sub_100036214(void *a1)
{
  uint64_t v3 = sub_100008E28(&qword_100064C20);
  uint64_t v16 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100008E28(&qword_100064C28);
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000902C(a1, a1[3]);
  sub_1000377BC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(KeyedDecodingContainer.allKeys.getter() + 16) == 1)
    {
      sub_100037810();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v13 = v12;
      sub_100008E28(&qword_100064B70);
      *uint64_t v13 = &type metadata for APIRequestModel.ACDataClass;
      KeyedDecodingContainer.codingPath.getter();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, enum case for DecodingError.typeMismatch(_:), v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return sub_10000A788((uint64_t)a1);
}

uint64_t sub_1000364FC()
{
  sub_100008E28(&qword_100064A98);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10004E9A0;
  swift_getKeyPath();
  sub_100008E28(&qword_100064AA0);
  type metadata accessor for Schema.Attribute.Option();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10004DF40;
  static Schema.Attribute.Option.unique.getter();
  type metadata accessor for Schema.Attribute();
  swift_allocObject();
  Schema.Attribute.init(_:originalName:hashModifier:)();
  sub_1000369F4(&qword_100064AA8, (void (*)(uint64_t))&type metadata accessor for Schema.Attribute);
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_10003688C()
{
  return sub_100033680();
}

uint64_t sub_1000368C8@<X0>(unsigned char *a1@<X8>)
{
  return sub_10003395C((void (*)(void))sub_1000224D8, a1);
}

uint64_t sub_1000368FC()
{
  return sub_100033A98();
}

uint64_t sub_100036934()
{
  return sub_100033680();
}

uint64_t sub_100036968@<X0>(unsigned char *a1@<X8>)
{
  return sub_10003395C((void (*)(void))sub_100036ACC, a1);
}

uint64_t sub_10003699C()
{
  return sub_100033A98();
}

uint64_t sub_1000369D8()
{
  return sub_100034004();
}

uint64_t sub_1000369F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100036A3C()
{
  return sub_100033B60(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), (uint64_t)&unk_10004EDA0, (void (*)(void))sub_100036A78);
}

unint64_t sub_100036A78()
{
  unint64_t result = qword_100064AC0;
  if (!qword_100064AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064AC0);
  }
  return result;
}

unint64_t sub_100036ACC()
{
  unint64_t result = qword_100064AC8;
  if (!qword_100064AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064AC8);
  }
  return result;
}

uint64_t sub_100036B20()
{
  return sub_10003375C();
}

unint64_t sub_100036B40()
{
  unint64_t result = qword_100064AD0;
  if (!qword_100064AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064AD0);
  }
  return result;
}

unint64_t sub_100036B94()
{
  unint64_t result = qword_100064AD8;
  if (!qword_100064AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064AD8);
  }
  return result;
}

uint64_t sub_100036BE8()
{
  return sub_100033B60(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), (uint64_t)&unk_10004ED50, (void (*)(void))sub_100036C24);
}

unint64_t sub_100036C24()
{
  unint64_t result = qword_100064AE0;
  if (!qword_100064AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064AE0);
  }
  return result;
}

uint64_t sub_100036C78()
{
  return sub_100033300();
}

unint64_t sub_100036C98()
{
  unint64_t result = qword_100064AF8;
  if (!qword_100064AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064AF8);
  }
  return result;
}

uint64_t sub_100036CEC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008E6C(&qword_100064AF0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100036D5C()
{
  unint64_t result = qword_100064B08;
  if (!qword_100064B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B08);
  }
  return result;
}

uint64_t sub_100036DB0()
{
  return sub_100032EE4();
}

uint64_t sub_100036DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for APIRequestModel.AuthMethod()
{
  return &type metadata for APIRequestModel.AuthMethod;
}

void *initializeBufferWithCopyOfBuffer for APIRequestModel.AccountBagKey(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for APIRequestModel.AccountBagKey()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for APIRequestModel.AccountBagKey(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for APIRequestModel.AccountBagKey(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for APIRequestModel.AccountBagKey(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for APIRequestModel.AccountBagKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APIRequestModel.AccountBagKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APIRequestModel.AccountBagKey()
{
  return &type metadata for APIRequestModel.AccountBagKey;
}

ValueMetadata *type metadata accessor for HTTPMethod()
{
  return &type metadata for HTTPMethod;
}

unint64_t sub_100036FB0()
{
  unint64_t result = qword_100064B18;
  if (!qword_100064B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B18);
  }
  return result;
}

unint64_t sub_100037008()
{
  unint64_t result = qword_100064B20;
  if (!qword_100064B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B20);
  }
  return result;
}

unint64_t sub_10003705C()
{
  unint64_t result = qword_100064B40;
  if (!qword_100064B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B40);
  }
  return result;
}

unint64_t sub_1000370B0()
{
  unint64_t result = qword_100064B48;
  if (!qword_100064B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B48);
  }
  return result;
}

unint64_t sub_100037104()
{
  unint64_t result = qword_100064B50;
  if (!qword_100064B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B50);
  }
  return result;
}

unint64_t sub_100037158()
{
  unint64_t result = qword_100064B80;
  if (!qword_100064B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B80);
  }
  return result;
}

unint64_t sub_1000371AC()
{
  unint64_t result = qword_100064B88;
  if (!qword_100064B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B88);
  }
  return result;
}

unint64_t sub_100037200()
{
  unint64_t result = qword_100064B98;
  if (!qword_100064B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B98);
  }
  return result;
}

unint64_t sub_100037254()
{
  unint64_t result = qword_100064BA0;
  if (!qword_100064BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for APIRequestModel.AccountBagKey.CodingKeys()
{
  return &type metadata for APIRequestModel.AccountBagKey.CodingKeys;
}

unsigned char *_s15icloudmailagent15APIRequestModelC10AuthMethodOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100037384);
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

ValueMetadata *type metadata accessor for APIRequestModel.AuthMethod.CodingKeys()
{
  return &type metadata for APIRequestModel.AuthMethod.CodingKeys;
}

ValueMetadata *type metadata accessor for APIRequestModel.AuthMethod.AuthTokenOrBasicHeaderCodingKeys()
{
  return &type metadata for APIRequestModel.AuthMethod.AuthTokenOrBasicHeaderCodingKeys;
}

ValueMetadata *type metadata accessor for APIRequestModel.AuthMethod.BasicAuthCodingKeys()
{
  return &type metadata for APIRequestModel.AuthMethod.BasicAuthCodingKeys;
}

ValueMetadata *type metadata accessor for APIRequestModel.ACDataClass()
{
  return &type metadata for APIRequestModel.ACDataClass;
}

unint64_t sub_1000373F8()
{
  unint64_t result = qword_100064BA8;
  if (!qword_100064BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BA8);
  }
  return result;
}

unint64_t sub_100037450()
{
  unint64_t result = qword_100064BB0;
  if (!qword_100064BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BB0);
  }
  return result;
}

unint64_t sub_1000374A8()
{
  unint64_t result = qword_100064BB8;
  if (!qword_100064BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BB8);
  }
  return result;
}

unint64_t sub_100037500()
{
  unint64_t result = qword_100064BC0;
  if (!qword_100064BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BC0);
  }
  return result;
}

unint64_t sub_100037558()
{
  unint64_t result = qword_100064BC8;
  if (!qword_100064BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BC8);
  }
  return result;
}

unint64_t sub_1000375B0()
{
  unint64_t result = qword_100064BD0;
  if (!qword_100064BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BD0);
  }
  return result;
}

unint64_t sub_100037608()
{
  unint64_t result = qword_100064BD8;
  if (!qword_100064BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BD8);
  }
  return result;
}

unint64_t sub_100037660()
{
  unint64_t result = qword_100064BE0;
  if (!qword_100064BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BE0);
  }
  return result;
}

unint64_t sub_1000376B8()
{
  unint64_t result = qword_100064BE8;
  if (!qword_100064BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BE8);
  }
  return result;
}

unint64_t sub_100037710()
{
  unint64_t result = qword_100064BF0;
  if (!qword_100064BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BF0);
  }
  return result;
}

unint64_t sub_100037768()
{
  unint64_t result = qword_100064BF8;
  if (!qword_100064BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064BF8);
  }
  return result;
}

unint64_t sub_1000377BC()
{
  unint64_t result = qword_100064C10;
  if (!qword_100064C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064C10);
  }
  return result;
}

unint64_t sub_100037810()
{
  unint64_t result = qword_100064C18;
  if (!qword_100064C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064C18);
  }
  return result;
}

unsigned char *_s15icloudmailagent15APIRequestModelC11ACDataClassOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        void *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100037900);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for APIRequestModel.ACDataClass.CodingKeys()
{
  return &type metadata for APIRequestModel.ACDataClass.CodingKeys;
}

ValueMetadata *type metadata accessor for APIRequestModel.ACDataClass.MailCodingKeys()
{
  return &type metadata for APIRequestModel.ACDataClass.MailCodingKeys;
}

unint64_t sub_10003794C()
{
  unint64_t result = qword_100064C30;
  if (!qword_100064C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064C30);
  }
  return result;
}

unint64_t sub_1000379A4()
{
  unint64_t result = qword_100064C38;
  if (!qword_100064C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064C38);
  }
  return result;
}

unint64_t sub_1000379FC()
{
  unint64_t result = qword_100064C40;
  if (!qword_100064C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064C40);
  }
  return result;
}

unint64_t sub_100037A54()
{
  unint64_t result = qword_100064C48;
  if (!qword_100064C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064C48);
  }
  return result;
}

unint64_t sub_100037AAC()
{
  unint64_t result = qword_100064C50;
  if (!qword_100064C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064C50);
  }
  return result;
}

uint64_t sub_100037B1C(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_10000A71C((_OWORD *)a1, v7);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_1000423A4(v7, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v6;

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_10000A72C(a1, (uint64_t *)&unk_1000648F0);
    sub_1000418E4((uint64_t)a2, v7);

    return sub_10000A72C((uint64_t)v7, (uint64_t *)&unk_1000648F0);
  }
}

void sub_100037BD8(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100037C40()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for CategorizationManager()) init];
  qword_100067A40 = (uint64_t)result;
  return result;
}

id sub_100037CCC()
{
  id result = [objc_allocWithZone((Class)NSLock) init];
  qword_100064C78 = (uint64_t)result;
  return result;
}

uint64_t sub_100037D00()
{
  uint64_t v0 = type metadata accessor for DispatchTime();
  sub_1000256A8(v0, qword_100064C80);
  sub_100008D9C(v0, (uint64_t)qword_100064C80);
  return static DispatchTime.now()();
}

uint64_t sub_100037D4C()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  sub_100022940(0, (unint64_t *)&qword_1000640F8);
  static DispatchQoS.unspecified.getter();
  v7[1] = _swiftEmptyArrayStorage;
  sub_10003C564((unint64_t *)&qword_100064910, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100008E28(&qword_100064100);
  sub_10000DF98(&qword_100064920, &qword_100064100);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  qword_100064C98 = result;
  return result;
}

NSObject *sub_100037F9C()
{
  *(void *)&v0[OBJC_IVAR___CategorizationManager_transactionId] = 0;
  *(void *)&v0[OBJC_IVAR___CategorizationManager_clientConnections] = _swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR___CategorizationManager_pendingRules] = _swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR___CategorizationManager_pendingOverrides] = _swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR___CategorizationManager_pingTimer] = 0;
  uint64_t v1 = OBJC_IVAR___CategorizationManager_closureLock;
  id v2 = objc_allocWithZone((Class)NSLock);
  int v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  uint64_t v4 = (uint64_t (**)())&v3[OBJC_IVAR___CategorizationManager_nextNlpTimeout];
  *uint64_t v4 = sub_1000389AC;
  v4[1] = 0;

  qword_100064C60 = 0;
  swift_release();
  qword_100064C68 = 0;
  swift_unknownObjectRelease();
  v16.receiver = v3;
  v16.super_class = (Class)type metadata accessor for CategorizationManager();
  id v5 = [super init];
  uint64_t v6 = qword_100063EA8;
  id v7 = v5;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100008D9C(v8, (uint64_t)qword_100067A18);
  uint64_t v9 = v7;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    uint64_t v14 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v13 = v9;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "CategorizationManager %@ initialised", v12, 0xCu);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v10 = v9;
  }

  return v9;
}

void sub_100038238()
{
  uint64_t v1 = OBJC_IVAR___CategorizationManager_pingTimer;
  if (!*(void *)(v0 + OBJC_IVAR___CategorizationManager_pingTimer))
  {
    uint64_t v2 = v0;
    if (qword_100063EA8 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100008D9C(v3, (uint64_t)qword_100067A18);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "creating client-notification timer", v6, 2u);
      swift_slowDealloc();
    }

    id v7 = self;
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v12[4] = sub_10003C604;
    v12[5] = v8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_100037BD8;
    v12[3] = &unk_10005F408;
    uint64_t v9 = _Block_copy(v12);
    swift_release();
    id v10 = [v7 scheduledTimerWithTimeInterval:1 repeats:v9 block:300.0];
    _Block_release(v9);
    os_log_type_t v11 = *(void **)(v2 + v1);
    *(void *)(v2 + v1) = v10;
  }
}

void sub_100038418()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    uint64_t v14 = OBJC_IVAR___CategorizationManager_closureLock;
    [*(id *)(Strong + OBJC_IVAR___CategorizationManager_closureLock) lock];
    uint64_t v15 = v1;
    uint64_t v2 = &v1[OBJC_IVAR___CategorizationManager_clientConnections];
    swift_beginAccess();
    if (!(*(void *)v2 >> 62)) {
      goto LABEL_3;
    }
    while (1)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
LABEL_3:
      if (qword_100063EA8 != -1) {
        swift_once();
      }
      uint64_t v3 = type metadata accessor for Logger();
      sub_100008D9C(v3, (uint64_t)qword_100067A18);
      uint64_t v4 = Logger.logObject.getter();
      os_log_type_t v5 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v6 = 134217984;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "notify [%ld clients]", v6, 0xCu);
        swift_slowDealloc();
      }

      uint64_t v7 = *(void *)v2;
      if (*(void *)v2 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v2 = (char *)_CocoaArrayWrapper.endIndex.getter();
        if (!v2)
        {
LABEL_22:
          swift_bridgeObjectRelease_n();
          [*(id *)&v15[v14] unlock];

          return;
        }
      }
      else
      {
        uint64_t v2 = *(char **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v2) {
          goto LABEL_22;
        }
      }
      uint64_t v8 = 4;
      uint64_t v9 = 0;
      if ((v7 & 0xC000000000000001) != 0)
      {
LABEL_10:
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_12;
      }
      while (1)
      {
        id v10 = *(id *)(v7 + 8 * v8);
LABEL_12:
        os_log_type_t v11 = v10;
        uint64_t v12 = (char *)(v9 + 1);
        if (__OFADD__(v9, 1)) {
          break;
        }
        id v13 = [v10 remoteObjectProxy];
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        sub_100008E28((uint64_t *)&unk_100064D60);
        if (swift_dynamicCast())
        {
          [v16 agentIsAlive];

          swift_unknownObjectRelease();
          if (v12 == v2) {
            goto LABEL_22;
          }
        }
        else
        {

          if (v12 == v2) {
            goto LABEL_22;
          }
        }
        uint64_t v9 = ++v8 - 4;
        if ((v7 & 0xC000000000000001) != 0) {
          goto LABEL_10;
        }
      }
      __break(1u);
    }
  }
}

uint64_t sub_10003877C()
{
  if (qword_100063EC8 != -1) {
    swift_once();
  }
  [(id)qword_100064C78 lock];
  sub_100038B50();
  if (qword_100064C60)
  {
    if (qword_100063EA8 != -1) {
      swift_once();
    }
    uint64_t v0 = type metadata accessor for Logger();
    sub_100008D9C(v0, (uint64_t)qword_100067A18);
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "CategorizationManager NLP not nil, returning it", v3, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_100063EA8 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100008D9C(v4, (uint64_t)qword_100067A18);
    os_log_type_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "CategorizationManager NLP nil, creating it", v7, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for MCCNLP();
    swift_allocObject();
    qword_100064C60 = MCCNLP.init()();
    swift_release();
  }
  uint64_t v8 = qword_100064C60;
  uint64_t v9 = (void *)qword_100064C78;
  swift_retain();
  [v9 unlock];
  return v8;
}

uint64_t sub_1000389AC()
{
  uint64_t v0 = type metadata accessor for DispatchTimeInterval();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = type metadata accessor for DispatchTime();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DispatchTime.now()();
  void *v3 = 30;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, enum case for DispatchTimeInterval.seconds(_:), v0);
  DispatchTime.advanced(by:)();
  (*(void (**)(void *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_100038B50()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchTimeInterval();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v53 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v51 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v50 = (char *)v47 - v5;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  __chkstk_darwin(v6);
  unint64_t v56 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for DispatchQoS();
  uint64_t v55 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v54 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for OS_dispatch_source.TimerFlags();
  uint64_t v60 = *(void *)(v9 - 8);
  uint64_t v61 = v9;
  __chkstk_darwin(v9);
  os_log_type_t v11 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchTime();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100064C70)
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    if ((OS_dispatch_source.isCancelled.getter() & 1) == 0)
    {
      uint64_t v62 = v0;
      if (qword_100063EA8 != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      sub_100008D9C(v16, (uint64_t)qword_100067A18);
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "CategorizationManager NLP timer cancelled (old)", v19, 2u);
        swift_slowDealloc();
      }

      OS_dispatch_source.cancel()();
      uint64_t v1 = v62;
    }
    swift_unknownObjectRelease();
  }
  if (qword_100063EA8 != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  v47[1] = sub_100008D9C(v20, (uint64_t)qword_100067A18);
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "CategorizationManager NLP timer being created", v23, 2u);
    swift_slowDealloc();
  }

  if (qword_100063ED0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_100008D9C(v12, (uint64_t)qword_100064C80);
  uint64_t v25 = *(void (**)(uint64_t))(v1 + OBJC_IVAR___CategorizationManager_nextNlpTimeout);
  uint64_t v26 = swift_retain();
  v25(v26);
  swift_release();
  swift_beginAccess();
  char v27 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 40);
  unint64_t v49 = v15;
  v27(v24, v15, v12);
  swift_endAccess();
  if (!qword_100064C68)
  {
    qword_100064C68 = sub_10003C28C();
    swift_unknownObjectRelease();
  }
  uint64_t v48 = v13;
  uint64_t v62 = v12;
  sub_100022940(0, &qword_100064D80);
  if (qword_100063ED8 != -1) {
    swift_once();
  }
  char v28 = (void *)qword_100064C98;
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10003C564(&qword_100064D88, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_source.TimerFlags);
  id v29 = v28;
  sub_100008E28(&qword_100064D90);
  sub_10000DF98(&qword_100064D98, &qword_100064D90);
  uint64_t v30 = v61;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v31 = static OS_dispatch_source.makeTimerSource(flags:queue:)();

  (*(void (**)(char *, uint64_t))(v60 + 8))(v11, v30);
  qword_100064C70 = v31;
  swift_unknownObjectRelease();
  if (!qword_100064C70)
  {
    __break(1u);
    goto LABEL_26;
  }
  swift_getObjectType();
  uint64_t v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10003C5E4;
  void aBlock[5] = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C2B8;
  aBlock[3] = &unk_10005F3E0;
  uint64_t v33 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v34 = v54;
  static DispatchQoS.unspecified.getter();
  unint64_t v35 = v56;
  sub_1000395C8();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v33);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v59);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v57);
  swift_release();
  swift_release();
  if (!qword_100064C70)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  swift_getObjectType();
  uint64_t v36 = v48;
  uint64_t v37 = v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v49, v24, v62);
  uint64_t v39 = v52;
  uint64_t v38 = v53;
  uint64_t v40 = *(void (**)(char *, void, uint64_t))(v52 + 104);
  id v41 = v50;
  v40(v50, enum case for DispatchTimeInterval.never(_:), v53);
  unint64_t v42 = v51;
  *(void *)uint64_t v51 = 5;
  v40(v42, enum case for DispatchTimeInterval.seconds(_:), v38);
  swift_unknownObjectRetain();
  OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
  swift_unknownObjectRelease();
  uint64_t v43 = *(void (**)(char *, uint64_t))(v39 + 8);
  v43(v42, v38);
  v43(v41, v38);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v62);
  if (!qword_100064C70)
  {
LABEL_27:
    __break(1u);
    return;
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  OS_dispatch_source.resume()();
  swift_unknownObjectRelease();
  uint64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v44, v45))
  {
    CFDataRef v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)CFDataRef v46 = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "CategorizationManager NLP timer created", v46, 2u);
    swift_slowDealloc();
  }
}

void sub_1000394B8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    sub_100039690();
  }
  else
  {
    if (qword_100063EA8 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100008D9C(v2, (uint64_t)qword_100067A18);
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v1, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v3, "CategorizationManager NLP timer failure to create", v4, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000395C8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

id sub_100039690()
{
  uint64_t v0 = type metadata accessor for DispatchTime();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v20 - v5;
  if (qword_100063EA8 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100008D9C(v7, (uint64_t)qword_100067A18);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "CategorizationManager NLP timer triggered", v10, 2u);
    swift_slowDealloc();
  }

  if (qword_100063EC8 != -1) {
    swift_once();
  }
  [(id)qword_100064C78 lock];
  if (qword_100063ED0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100008D9C(v0, (uint64_t)qword_100064C80);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v11, v0);
  static DispatchTime.now()();
  sub_10003C564(&qword_100064D78, (void (*)(uint64_t))&type metadata accessor for DispatchTime);
  char v12 = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v4, v0);
  v13(v6, v0);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  if (v12)
  {
    if (v16)
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "CategorizationManager NLP timer extended", v17, 2u);
      swift_slowDealloc();
    }

    sub_100038B50();
  }
  else
  {
    if (v16)
    {
      os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "CategorizationManager NLP timer expired", v18, 2u);
      swift_slowDealloc();
    }

    qword_100064C60 = 0;
    swift_release();
    qword_100064C68 = 0;
    swift_unknownObjectRelease();
  }
  return [(id)qword_100064C78 unlock];
}

void sub_100039A64(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v172 = a3;
  uint64_t v7 = sub_100008E28(&qword_100064DF0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v144 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v162 = (char *)&v144 - v11;
  uint64_t v170 = type metadata accessor for BlackPearlVersion();
  uint64_t v167 = *(void *)(v170 - 8);
  __chkstk_darwin(v170);
  id v168 = (char *)&v144 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = type metadata accessor for ReasonCode();
  id v175 = *(void (**)(char *, uint64_t))(v159 - 8);
  __chkstk_darwin(v159);
  uint64_t v158 = (char *)&v144 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void (*)(char *, uint64_t, uint64_t))type metadata accessor for CategoryTS();
  uint64_t v173 = *((void *)v14 - 1);
  NSString v174 = v14;
  __chkstk_darwin(v14);
  v164 = (char *)&v144 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = type metadata accessor for Category();
  uint64_t v163 = *(void *)(v169 - 8);
  __chkstk_darwin(v169);
  uint64_t v17 = (char *)&v144 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DecisionRequest();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  NSString v166 = (char *)&v144 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DecisionResult();
  uint64_t v160 = *(void *)(v21 - 8);
  uint64_t v161 = v21;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v144 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10003877C();
  if (!v24)
  {
    id v28 = objc_allocWithZone((Class)NSError);
    NSString v29 = String._bridgeToObjectiveC()();
    id v30 = [v28 initWithDomain:v29 code:-1 userInfo:0];

    id v31 = v30;
    uint64_t v32 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v32);

    _Block_release(a4);
    return;
  }
  uint64_t v165 = v24;
  if ((dispatch thunk of MCCNLP.isModelPresetLoaded.getter() & 1) == 0) {
    dispatch thunk of MCCNLP.scheduleImmediateDownload()();
  }
  id v25 = [a2 senderName];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v157 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v156 = v27;
  }
  else
  {
    uint64_t v157 = 0;
    unint64_t v156 = 0xE000000000000000;
  }
  id v33 = [a2 senderEmail];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v155 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v154 = v35;
  }
  else
  {
    uint64_t v155 = 0;
    unint64_t v154 = 0xE000000000000000;
  }
  id v36 = [a2 emailSubject];
  uint64_t v146 = v19;
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v153 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v152 = v38;
  }
  else
  {
    uint64_t v153 = 0;
    unint64_t v152 = 0xE000000000000000;
  }
  id v39 = [a2 receiverEmail];
  uint64_t v149 = a4;
  uint64_t v145 = v10;
  uint64_t v147 = v18;
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v151 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v150 = v41;
  }
  else
  {
    uint64_t v151 = 0;
    unint64_t v150 = 0xE000000000000000;
  }
  [a2 isUnsubscribeHeaderPresent];
  [a2 isSenderVIP];
  [a2 isSenderInAddressBook];
  [a2 isSenderRecentContact];
  [a2 isSenderPrimary];
  [a2 isNonPersonalAccount];
  DecisionRequest.init(senderName:senderEmail:emailSubject:receiverEmail:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)();
  char v42 = dispatch thunk of MCCNLP.isModelPresetLoaded.getter();
  uint64_t v148 = v4;
  if (v42)
  {
    dispatch thunk of MCCNLP.predictCommerceEmail(decisionRequest:)();
  }
  else
  {
    type metadata accessor for DecisionResultBuilder();
    static DecisionResultBuilder.buildCategorizationNotReadyResult()();
  }
  uint64_t v43 = v168;
  id v44 = kDecisionCommerceKey;
  os_log_type_t v45 = [objc_allocWithZone((Class)NSNumber) initWithBool:DecisionResult.commerce.getter() & 1];
  uint64_t v46 = sub_100022940(0, &qword_100064DF8);
  uint64_t v178 = v46;
  uint64_t v177 = v45;
  sub_100037B1C((uint64_t)&v177, v44);
  id v47 = kDecisionTimeSensitiveKey;
  uint64_t v48 = [objc_allocWithZone((Class)NSNumber) initWithBool:DecisionResult.timesensitive.getter() & 1];
  uint64_t v178 = v46;
  uint64_t v177 = v48;
  sub_100037B1C((uint64_t)&v177, v47);
  id v49 = kDecisionSubCategoryKey;
  DecisionResult.subCategory.getter();
  static Category.getCategoryText(for:)();
  (*(void (**)(char *, uint64_t))(v163 + 8))(v17, v169);
  uint64_t v50 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v169 = sub_100022940(0, (unint64_t *)&qword_100064E00);
  uint64_t v178 = v169;
  uint64_t v177 = v50;
  sub_100037B1C((uint64_t)&v177, v49);
  id v51 = kDecisionSubCategoryTSKey;
  uint64_t v52 = v164;
  DecisionResult.subCategoryTS.getter();
  uint64_t v53 = CategoryTS.rawValue.getter();
  (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v173 + 8))(v52, v174);
  uint64_t v54 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v53];
  uint64_t v178 = v46;
  uint64_t v177 = v54;
  sub_100037B1C((uint64_t)&v177, v51);
  id v55 = kDecisionScoreKey;
  DecisionResult.score.getter();
  uint64_t v57 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v56];
  uint64_t v178 = v46;
  uint64_t v177 = v57;
  sub_100037B1C((uint64_t)&v177, v55);
  id v58 = kDecisionSenderScoreKey;
  DecisionResult.senderScore.getter();
  uint64_t v60 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v59];
  uint64_t v178 = v46;
  uint64_t v177 = v60;
  sub_100037B1C((uint64_t)&v177, v58);
  id v61 = kDecisionTSScoreKey;
  DecisionResult.tsScore.getter();
  uint64_t v63 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v62];
  uint64_t v178 = v46;
  uint64_t v177 = v63;
  sub_100037B1C((uint64_t)&v177, v61);
  id v64 = kDecisionTSCategoryScoreKey;
  DecisionResult.tsCategoryScore.getter();
  uint64_t v66 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v65];
  uint64_t v178 = v46;
  uint64_t v177 = v66;
  sub_100037B1C((uint64_t)&v177, v64);
  unint64_t v176 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v67 = DecisionResult.reasonCodes.getter();
  uint64_t v68 = *(void *)(v67 + 16);
  uint64_t v171 = v23;
  if (v68)
  {
    unsigned int v69 = (void (*)(char *, uint64_t, uint64_t))*((void *)v175 + 2);
    uint64_t v70 = *((unsigned __int8 *)v175 + 80);
    v164 = (char *)v67;
    uint64_t v71 = v67 + ((v70 + 32) & ~v70);
    uint64_t v173 = *((void *)v175 + 9);
    NSString v174 = v69;
    id v175 = (void (*)(char *, uint64_t))((char *)v175 + 16);
    unint64_t v72 = (void (**)(char *, uint64_t))((char *)v175 - 8);
    uint64_t v73 = v159;
    uint64_t v74 = v158;
    do
    {
      v174(v74, v71, v73);
      ReasonCode.rawValue.getter();
      String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v176 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v176 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      (*v72)(v74, v73);
      v71 += v173;
      --v68;
    }
    while (v68);
    swift_bridgeObjectRelease();
    uint64_t v75 = (void *)v176;
    uint64_t v43 = v168;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v75 = _swiftEmptyArrayStorage;
  }
  uint64_t v76 = (void *)kDecisionReasonCodesKey;
  uint64_t v178 = sub_100008E28(&qword_100064E08);
  uint64_t v177 = v75;
  id v77 = v76;
  swift_bridgeObjectRetain();
  sub_100037B1C((uint64_t)&v177, v77);
  id v78 = kDecisionBPModelVersionKey;
  DecisionResult.blackPearlVersion.getter();
  BlackPearlVersion.getBlackPearlModelVersion()();
  uint64_t v79 = v167 + 8;
  unsigned int v80 = *(void (**)(char *, uint64_t))(v167 + 8);
  uint64_t v81 = v170;
  v80(v43, v170);
  id v175 = v80;
  uint64_t v82 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v83 = v169;
  uint64_t v178 = v169;
  uint64_t v177 = v82;
  sub_100037B1C((uint64_t)&v177, v78);
  id v84 = kDecisionBPSenderModelVersionKey;
  DecisionResult.blackPearlVersion.getter();
  BlackPearlVersion.getBlackPearlSenderModelVersion()();
  v80(v43, v81);
  unint64_t v85 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v178 = v83;
  uint64_t v177 = v85;
  sub_100037B1C((uint64_t)&v177, v84);
  NSString v174 = (void (*)(char *, uint64_t, uint64_t))kDecisionBPTSModelVersionKey;
  DecisionResult.blackPearlVersion.getter();
  BlackPearlVersion.getBlackPearlTSModelVersion()();
  uint64_t v86 = v175;
  v175(v43, v81);
  unint64_t v87 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v178 = v83;
  uint64_t v177 = v87;
  sub_100037B1C((uint64_t)&v177, v174);
  NSString v174 = (void (*)(char *, uint64_t, uint64_t))kDecisionBPFinalRuleModelVersionKey;
  uint64_t v88 = v81;
  DecisionResult.blackPearlVersion.getter();
  BlackPearlVersion.getBlackPearlFinalRuleVersion()();
  v86(v43, v81);
  unint64_t v89 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v178 = v83;
  uint64_t v177 = v89;
  sub_100037B1C((uint64_t)&v177, v174);
  NSString v174 = (void (*)(char *, uint64_t, uint64_t))kDecisionBPBreakthroughModelVersionKey;
  DecisionResult.blackPearlVersion.getter();
  BlackPearlVersion.getBlackPearlBreakthroughVersion()();
  v86(v43, v81);
  uint64_t v90 = String._bridgeToObjectiveC()();
  char v91 = v86;
  swift_bridgeObjectRelease();
  uint64_t v178 = v83;
  uint64_t v177 = v90;
  sub_100037B1C((uint64_t)&v177, v174);
  DecisionResult.blackPearlVersion.getter();
  object = BlackPearlVersion.getBlackPearlExperimentId()().value._object;
  v86(v43, v88);
  swift_bridgeObjectRelease();
  uint64_t v167 = v79;
  if (object)
  {
    id v93 = kDecisionBPExperimentIdKey;
    DecisionResult.blackPearlVersion.getter();
    uint64_t v94 = BlackPearlVersion.getBlackPearlExperimentId()().value._object;
    v86(v43, v88);
    if (!v94)
    {
      _Block_release(v149);
      __break(1u);
      goto LABEL_49;
    }
    uint64_t v95 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v96 = v169;
    uint64_t v178 = v169;
    uint64_t v177 = v95;
    sub_100037B1C((uint64_t)&v177, v93);
    uint64_t v43 = v168;
    char v91 = v175;
  }
  else
  {
    id v97 = kDecisionBPExperimentIdKey;
    uint64_t v96 = v169;
    uint64_t v98 = NSString.init(stringLiteral:)();
    uint64_t v178 = v96;
    uint64_t v177 = (void *)v98;
    sub_100037B1C((uint64_t)&v177, v97);
  }
  id v99 = kDecisionBPExperimentDeploymentIdKey;
  DecisionResult.blackPearlVersion.getter();
  Swift::Int v100 = BlackPearlVersion.getBlackPearlDeploymentId()();
  uint64_t v101 = v170;
  v91(v43, v170);
  uint64_t v177 = (void *)v100;
  dispatch thunk of CustomStringConvertible.description.getter();
  long long v102 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v178 = v96;
  uint64_t v177 = v102;
  Swift::Int v103 = v175;
  sub_100037B1C((uint64_t)&v177, v99);
  DecisionResult.blackPearlVersion.getter();
  uint64_t v104 = BlackPearlVersion.getBlackPearlTreatmentId()().value._object;
  v103(v43, v101);
  swift_bridgeObjectRelease();
  if (v104)
  {
    uint64_t v105 = v103;
    id v106 = kDecisionBPTreatmentIdKey;
    DecisionResult.blackPearlVersion.getter();
    Swift::String v107 = BlackPearlVersion.getBlackPearlTreatmentId()().value._object;
    v105(v43, v101);
    if (v107)
    {
      Swift::Int v108 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v96 = v169;
      uint64_t v178 = v169;
      uint64_t v177 = v108;
      sub_100037B1C((uint64_t)&v177, v106);
      uint64_t v43 = v168;
      Swift::Int v103 = v175;
      goto LABEL_35;
    }
LABEL_49:
    _Block_release(v149);
    __break(1u);
    goto LABEL_50;
  }
  id v109 = kDecisionBPTreatmentIdKey;
  uint64_t v110 = NSString.init(stringLiteral:)();
  uint64_t v178 = v96;
  uint64_t v177 = (void *)v110;
  sub_100037B1C((uint64_t)&v177, v109);
LABEL_35:
  id v111 = kDecisionBPRolloutDeploymentIdKey;
  DecisionResult.blackPearlVersion.getter();
  Swift::Int v112 = BlackPearlVersion.getBlackPearlRolloutDeploymentId()();
  uint64_t v113 = v170;
  v103(v43, v170);
  uint64_t v177 = (void *)v112;
  dispatch thunk of CustomStringConvertible.description.getter();
  id v114 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v178 = v96;
  uint64_t v177 = v114;
  v115 = v175;
  sub_100037B1C((uint64_t)&v177, v111);
  DecisionResult.blackPearlVersion.getter();
  uint64_t v116 = BlackPearlVersion.getBlackPearlRolloutFactorPackId()().value._object;
  v115(v43, v113);
  swift_bridgeObjectRelease();
  if (v116)
  {
    unint64_t v117 = v115;
    id v118 = kDecisionBPRolloutFactorPackIdKey;
    DecisionResult.blackPearlVersion.getter();
    v119 = BlackPearlVersion.getBlackPearlRolloutFactorPackId()().value._object;
    v117(v43, v113);
    if (v119)
    {
      NSArray v120 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v178 = v169;
      uint64_t v177 = v120;
      sub_100037B1C((uint64_t)&v177, v118);
      uint64_t v43 = v168;
      v115 = v175;
      goto LABEL_39;
    }
LABEL_50:
    _Block_release(v149);
    __break(1u);
    goto LABEL_51;
  }
  id v121 = kDecisionBPRolloutFactorPackIdKey;
  uint64_t v122 = NSString.init(stringLiteral:)();
  uint64_t v178 = v96;
  uint64_t v177 = (void *)v122;
  sub_100037B1C((uint64_t)&v177, v121);
LABEL_39:
  DecisionResult.blackPearlVersion.getter();
  uint64_t v123 = BlackPearlVersion.getBlackPearlRolloutId()().value._object;
  uint64_t v124 = v170;
  v115(v43, v170);
  swift_bridgeObjectRelease();
  if (!v123)
  {
    id v129 = kDecisionBPRolloutIdKey;
    uint64_t v130 = v169;
    uint64_t v131 = NSString.init(stringLiteral:)();
    uint64_t v178 = v130;
    uint64_t v177 = (void *)v131;
    sub_100037B1C((uint64_t)&v177, v129);
    goto LABEL_43;
  }
  id v125 = v115;
  id v126 = kDecisionBPRolloutIdKey;
  DecisionResult.blackPearlVersion.getter();
  unint64_t v127 = BlackPearlVersion.getBlackPearlRolloutId()().value._object;
  v125(v43, v124);
  if (!v127)
  {
LABEL_51:
    _Block_release(v149);
    __break(1u);
    goto LABEL_52;
  }
  id v128 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v178 = v169;
  uint64_t v177 = v128;
  sub_100037B1C((uint64_t)&v177, v126);
  uint64_t v43 = v168;
  v115 = v175;
LABEL_43:
  DecisionResult.blackPearlVersion.getter();
  uint64_t v132 = (uint64_t)v162;
  BlackPearlVersion.getBlackPearlCategorizationVersion()();
  uint64_t v133 = v170;
  v115(v43, v170);
  uint64_t v134 = type metadata accessor for BlackPearlCategorizationVersion();
  uint64_t v135 = *(void *)(v134 - 8);
  unint64_t v136 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v135 + 48);
  int v137 = v136(v132, 1, v134);
  sub_10000A72C(v132, &qword_100064DF0);
  if (v137 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v138 = (void (*)(char *, uint64_t, uint64_t))kDecisionBPVersionKey;
    uint64_t v139 = v169;
    uint64_t v140 = NSString.init(stringLiteral:)();
    uint64_t v178 = v139;
    uint64_t v177 = (void *)v140;
    id v141 = v138;
LABEL_47:
    sub_100037B1C((uint64_t)&v177, v141);
    swift_release();
    (*(void (**)(char *, uint64_t))(v146 + 8))(v166, v147);
    (*(void (**)(char *, uint64_t))(v160 + 8))(v171, v161);
    _Block_release(v149);
    return;
  }
  NSString v174 = (void (*)(char *, uint64_t, uint64_t))kDecisionBPVersionKey;
  DecisionResult.blackPearlVersion.getter();
  uint64_t v142 = v145;
  BlackPearlVersion.getBlackPearlCategorizationVersion()();
  v175(v43, v133);
  if (v136((uint64_t)v142, 1, v134) != 1)
  {
    swift_bridgeObjectRelease();
    BlackPearlCategorizationVersion.getVersionString()();
    (*(void (**)(char *, uint64_t))(v135 + 8))(v142, v134);
    uint64_t v143 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v178 = v169;
    uint64_t v177 = v143;
    id v141 = v174;
    goto LABEL_47;
  }
LABEL_52:
  _Block_release(v149);
  __break(1u);
}

void sub_10003B088(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

void sub_10003B104(void *a1)
{
  if (qword_100063EA8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_100067A18);
  id v8 = a1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Callback connection %@ interrupted", v5, 0xCu);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10003B2D0(void *a1)
{
  if (qword_100063EA8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_100067A18);
  id v3 = a1;
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    id v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v7 = v3;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Callback connection %@ invalidated", v6, 0xCu);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = (void *)Strong;
    id v11 = *(id *)(Strong + OBJC_IVAR___CategorizationManager_closureLock);

    [v11 lock];
  }
  swift_beginAccess();
  uint64_t v12 = swift_unknownObjectWeakLoadStrong();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = (unint64_t *)(v12 + OBJC_IVAR___CategorizationManager_clientConnections);
    swift_beginAccess();
    unint64_t v15 = *v14;
    swift_bridgeObjectRetain();

    sub_10003B5E4((uint64_t)v3, v15);
    unint64_t v17 = v16;
    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v20 = swift_unknownObjectWeakLoadStrong();
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        swift_beginAccess();
        uint64_t v22 = (void *)sub_10003B780(v17);
        swift_endAccess();
      }
    }
  }
  swift_beginAccess();
  uint64_t v23 = swift_unknownObjectWeakLoadStrong();
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v25 = *(id *)(v23 + OBJC_IVAR___CategorizationManager_closureLock);

    [v25 unlock];
  }
}

void sub_10003B5E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      os_log_type_t v5 = v4;
      sub_100022940(0, &qword_100064DD8);
      char v6 = static NSObject.== infix(_:_:)();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = static NSObject.== infix(_:_:)();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_10003B780(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    unint64_t v3 = sub_10003C60C(v3);
    unint64_t *v1 = v3;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + 16) = v7;
      specialized Array._endMutation()();
      return v10;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10003B87C(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

id sub_10003B910(uint64_t a1)
{
  id v37 = *(id *)(v2 + OBJC_IVAR___CategorizationManager_closureLock);
  [v37 lock];
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      unint64_t v1 = a1;
    }
    else {
      unint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (!v4) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_25;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      swift_unknownObjectRetain();
      self;
      if (swift_dynamicCastObjCClass() || (self, swift_dynamicCastObjCClass()))
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    for (uint64_t j = 0; j != v4; ++j)
    {
      swift_unknownObjectRetain_n();
      self;
      if (swift_dynamicCastObjCClass() || (self, swift_dynamicCastObjCClass()))
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
    }
  }
LABEL_25:
  swift_bridgeObjectRelease();
  p_type = (char **)&unk_100064000;
  if ((unint64_t)_swiftEmptyArrayStorage >> 62) {
    goto LABEL_40;
  }
  if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    do
    {
      uint64_t v8 = (unint64_t *)&p_type[405][v38];
      swift_beginAccess();
      unint64_t v1 = *v8;
      if (v1 >> 62)
      {
LABEL_43:
        swift_bridgeObjectRetain_n();
        uint64_t v39 = _CocoaArrayWrapper.endIndex.getter();
        if (!v39)
        {
LABEL_44:
          swift_bridgeObjectRelease_n();
          p_type = (char **)&unk_100064000;
          break;
        }
      }
      else
      {
        uint64_t v39 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v39) {
          goto LABEL_44;
        }
      }
      unint64_t v9 = v1 & 0xC000000000000001;
      uint64_t v10 = 4;
      p_type = &stru_100061FF0.type;
      unint64_t v11 = (uint64_t *)&unk_100064D60;
      uint64_t v12 = 0;
      if ((v1 & 0xC000000000000001) != 0)
      {
LABEL_30:
        id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_32;
      }
      while (1)
      {
        id v13 = *(id *)(v1 + 8 * v10);
LABEL_32:
        uint64_t v14 = v13;
        if (__OFADD__(v12, 1)) {
          break;
        }
        id v15 = [v13 p_type[364]];
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        sub_100008E28(v11);
        if (swift_dynamicCast())
        {
          sub_100022940(0, &qword_100064D70);
          unint64_t v16 = v1;
          unint64_t v17 = v9;
          char v18 = v11;
          char v19 = p_type;
          swift_bridgeObjectRetain();
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v41 rulesChanged:isa];

          p_type = v19;
          unint64_t v11 = v18;
          unint64_t v9 = v17;
          unint64_t v1 = v16;
          swift_unknownObjectRelease();
        }
        else
        {
        }
        if (v12 + 1 == v39) {
          goto LABEL_44;
        }
        uint64_t v12 = ++v10 - 4;
        if (v9) {
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_40:
      swift_bridgeObjectRetain();
      uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    while (v21);
  }
  if ((unint64_t)_swiftEmptyArrayStorage >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v36) {
      goto LABEL_67;
    }
  }
  else if (!*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_67:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return [v37 unlock];
  }
  uint64_t v22 = &p_type[405][v38];
  swift_beginAccess();
  uint64_t v23 = *(void *)v22;
  if (*(void *)v22 >> 62)
  {
    swift_bridgeObjectRetain_n();
    id result = (id)_CocoaArrayWrapper.endIndex.getter();
    uint64_t v24 = (uint64_t)result;
    if (result) {
      goto LABEL_49;
    }
    goto LABEL_66;
  }
  uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id result = (id)swift_bridgeObjectRetain_n();
  if (!v24)
  {
LABEL_66:
    swift_bridgeObjectRelease_n();
    goto LABEL_67;
  }
LABEL_49:
  uint64_t v26 = v24 - 1;
  if (v24 >= 1)
  {
    uint64_t v27 = 0;
    if ((v23 & 0xC000000000000001) == 0) {
      goto LABEL_52;
    }
LABEL_51:
    for (id k = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(); ; id k = *(id *)(v23 + 8 * v27 + 32))
    {
      NSString v29 = k;
      id v30 = [k remoteObjectProxy];
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100008E28((uint64_t *)&unk_100064D60);
      if (swift_dynamicCast())
      {
        sub_100022940(0, (unint64_t *)&qword_1000647C0);
        swift_bridgeObjectRetain();
        Class v31 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v40 overrideRulesChanged:v31];

        swift_unknownObjectRelease();
        if (v26 == v27) {
          goto LABEL_66;
        }
      }
      else
      {
        if (qword_100063EA8 != -1) {
          swift_once();
        }
        uint64_t v32 = type metadata accessor for Logger();
        sub_100008D9C(v32, (uint64_t)qword_100067A18);
        id v33 = Logger.logObject.getter();
        os_log_type_t v34 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v33, v34))
        {
          unint64_t v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "Cannot call proxy object to notify of overrides", v35, 2u);
          swift_slowDealloc();
        }

        if (v26 == v27) {
          goto LABEL_66;
        }
      }
      ++v27;
      if ((v23 & 0xC000000000000001) != 0) {
        goto LABEL_51;
      }
LABEL_52:
      ;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10003C1E8(void *a1, int a2, int a3, void *aBlock, void (*a5)(uint64_t, uint64_t, id, void *))
{
  unint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a1;
  a5(v8, v10, v11, v7);
  _Block_release(v7);
  _Block_release(v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003C28C()
{
  uint64_t v2 = *(void *)&v1[OBJC_IVAR___CategorizationManager_transactionId];
  BOOL v3 = __CFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v0 = v1;
    *(void *)&v1[OBJC_IVAR___CategorizationManager_transactionId] = v4;
    if (qword_100063EA8 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v5 = type metadata accessor for Logger();
  sub_100008D9C(v5, (uint64_t)qword_100067A18);
  id v6 = v0;
  unint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "CategorizationManager transaction being created as %llu", v9, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  _StringGuts.grow(_:)(39);
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v11 = os_transaction_create();
  swift_release();
  return v11;
}

id sub_10003C47C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CategorizationManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CategorizationManager()
{
  return self;
}

uint64_t sub_10003C564(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003C5AC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003C5E4()
{
}

uint64_t sub_10003C5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003C5FC()
{
  return swift_release();
}

void sub_10003C604()
{
}

uint64_t sub_10003C60C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

void sub_10003C688(uint64_t a1, uint64_t a2)
{
  if (sub_10003877C())
  {
    char v3 = dispatch thunk of MCCNLP.isModelPresetLoaded.getter();
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, v3 & 1, 0);
    swift_release();
  }
  else
  {
    id v4 = objc_allocWithZone((Class)NSError);
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [v4 initWithDomain:v5 code:-1 userInfo:0];

    id v7 = v6;
    id v8 = (id)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, id))(a2 + 16))(a2, 0, v8);
  }
}

void sub_10003C7AC(uint64_t a1, uint64_t a2)
{
  if (sub_10003877C())
  {
    dispatch thunk of MCCNLP.scheduleImmediateDownload()();
    char v3 = dispatch thunk of MCCNLP.isModelPresetLoaded.getter();
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, v3 & 1, 0);
    swift_release();
  }
  else
  {
    id v4 = objc_allocWithZone((Class)NSError);
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [v4 initWithDomain:v5 code:-1 userInfo:0];

    id v7 = v6;
    id v8 = (id)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, id))(a2 + 16))(a2, 0, v8);
  }
}

Swift::Int sub_10003C8D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100008E28((uint64_t *)&unk_100064DE0);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      sub_10003ED24(v6 + 40 * v4, (uint64_t)v21);
      Swift::Int result = AnyHashable._rawHashValue(seed:)(*(void *)(v3 + 40));
      uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
      unint64_t v9 = result & v8;
      unint64_t v10 = (result & (unint64_t)v8) >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * v10);
      uint64_t v12 = 1 << (result & v8);
      if ((v12 & v11) != 0)
      {
        while (1)
        {
          sub_10003ED24(*(void *)(v3 + 48) + 40 * v9, (uint64_t)v20);
          char v13 = static AnyHashable.== infix(_:_:)();
          Swift::Int result = sub_10001179C((uint64_t)v20);
          if (v13) {
            break;
          }
          unint64_t v9 = (v9 + 1) & v8;
          unint64_t v10 = v9 >> 6;
          uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
          uint64_t v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0) {
            goto LABEL_8;
          }
        }
        sub_10001179C((uint64_t)v21);
      }
      else
      {
LABEL_8:
        *(void *)(v5 + 8 * v10) = v12 | v11;
        uint64_t v14 = *(void *)(v3 + 48) + 40 * v9;
        long long v15 = v21[0];
        long long v16 = v21[1];
        *(void *)(v14 + 32) = v22;
        *(_OWORD *)uint64_t v14 = v15;
        *(_OWORD *)(v14 + 16) = v16;
        uint64_t v17 = *(void *)(v3 + 16);
        BOOL v18 = __OFADD__(v17, 1);
        uint64_t v19 = v17 + 1;
        if (v18)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v19;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_10003CA3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v21 = [objc_allocWithZone((Class)NSXPCConnection) initWithListenerEndpoint:a1];
  id v3 = [self interfaceWithProtocol:&OBJC_PROTOCOL___MCCCategoryRulesClientProtocol];
  sub_100008E28(&qword_100064DC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E280;
  self;
  self;
  swift_dynamicCastObjCClassUnconditional();
  sub_100022940(0, &qword_100064DC8);
  sub_10003EC34();
  AnyHashable.init<A>(_:)();
  self;
  self;
  swift_dynamicCastObjCClassUnconditional();
  AnyHashable.init<A>(_:)();
  sub_10003C8D4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 setClasses:isa forSelector:"rulesChanged:" argumentIndex:0 ofReply:0];

  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_10004E990;
  self;
  self;
  swift_dynamicCastObjCClassUnconditional();
  AnyHashable.init<A>(_:)();
  self;
  self;
  swift_dynamicCastObjCClassUnconditional();
  AnyHashable.init<A>(_:)();
  self;
  self;
  swift_dynamicCastObjCClassUnconditional();
  AnyHashable.init<A>(_:)();
  self;
  self;
  swift_dynamicCastObjCClassUnconditional();
  AnyHashable.init<A>(_:)();
  self;
  uint64_t aBlock = swift_dynamicCastObjCClassUnconditional();
  AnyHashable.init<A>(_:)();
  sub_10003C8D4(v6);
  swift_setDeallocating();
  swift_arrayDestroy();
  Class v7 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 setClasses:v7 forSelector:"overrideRulesChanged:" argumentIndex:0 ofReply:0];

  [v21 setRemoteObjectInterface:v3];
  [v21 resume];
  id v8 = [v21 remoteObjectProxy];
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100008E28((uint64_t *)&unk_100064D60);
  uint64_t v9 = swift_dynamicCast();
  if (v9)
  {
    swift_unknownObjectRelease();
    unint64_t v10 = *(void **)(a2 + OBJC_IVAR___CategorizationManager_closureLock);
    [v10 lock];
    uint64_t v11 = (void *)(a2 + OBJC_IVAR___CategorizationManager_clientConnections);
    swift_beginAccess();
    id v12 = v21;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v27 = sub_10003ECD4;
    uint64_t v28 = v13;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v24 = 1107296256;
    id v25 = sub_10001C2B8;
    uint64_t v26 = &unk_10005F458;
    uint64_t v14 = _Block_copy(&aBlock);
    id v15 = v12;
    swift_release();
    [v15 setInterruptionHandler:v14];
    _Block_release(v14);
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v15;
    *(void *)(v17 + 24) = v16;
    uint64_t v27 = sub_10003ED1C;
    uint64_t v28 = v17;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v24 = 1107296256;
    id v25 = sub_10001C2B8;
    uint64_t v26 = &unk_10005F4A8;
    BOOL v18 = _Block_copy(&aBlock);
    id v19 = v15;
    swift_release();
    [v19 setInvalidationHandler:v18];
    _Block_release(v18);
    [v10 unlock];
  }
  (*(void (**)(uint64_t, uint64_t, void))(a3 + 16))(a3, v9, 0);
}

void sub_10003D0F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (sub_10003877C())
  {
    uint64_t v5 = dispatch thunk of MCCNLP.getIABCategoryID(domain:)();
    (*(void (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, v5, 0);
    swift_release();
  }
  else
  {
    id v6 = objc_allocWithZone((Class)NSError);
    NSString v7 = String._bridgeToObjectiveC()();
    id v8 = [v6 initWithDomain:v7 code:-1 userInfo:0];

    id v9 = v8;
    id v10 = (id)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, id))(a4 + 16))(a4, 0, v10);
  }
}

void sub_10003D228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (sub_10003877C())
  {
    char v5 = dispatch thunk of MCCNLP.isPersonalEmail(domain:)();
    (*(void (**)(uint64_t, void, void))(a4 + 16))(a4, v5 & 1, 0);
    swift_release();
  }
  else
  {
    id v6 = objc_allocWithZone((Class)NSError);
    NSString v7 = String._bridgeToObjectiveC()();
    id v8 = [v6 initWithDomain:v7 code:-1 userInfo:0];

    id v9 = v8;
    id v10 = (id)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, id))(a4 + 16))(a4, 0, v10);
  }
}

void sub_10003D35C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for BlackPearlCategorizationVersion();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10003877C())
  {
    dispatch thunk of MCCNLP.getBlackPearlCatVersion()();
    id v12 = kBPCategorizationMajorVersionKey;
    Swift::Int v13 = BlackPearlCategorizationVersion.getMajorVersion()();
    id v30 = &type metadata for Int;
    *(void *)&long long v29 = v13;
    sub_10000A71C(&v29, v28);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = &_swiftEmptyDictionarySingleton;
    sub_1000423A4(v28, v12, isUniquelyReferenced_nonNull_native);
    id v15 = v27;

    swift_bridgeObjectRelease();
    id v16 = kBPCategorizationMinorVersionKey;
    Swift::Int v17 = BlackPearlCategorizationVersion.getMinorVersion()();
    id v30 = &type metadata for Int;
    *(void *)&long long v29 = v17;
    sub_10000A71C(&v29, v28);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = v15;
    sub_1000423A4(v28, v16, v18);
    id v19 = v27;

    swift_bridgeObjectRelease();
    id v20 = kBPCategorizationPatchVersionKey;
    Swift::Int v21 = BlackPearlCategorizationVersion.getPatchVersion()();
    id v30 = &type metadata for Int;
    *(void *)&long long v29 = v21;
    sub_10000A71C(&v29, v28);
    char v22 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = v19;
    sub_1000423A4(v28, v20, v22);
    uint64_t v23 = (uint64_t)v27;

    swift_bridgeObjectRelease();
    sub_100021160(v23);
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, Class, void))(a2 + 16))(a2, isa, 0);
    swift_release();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    swift_bridgeObjectRelease();
    id v7 = objc_allocWithZone((Class)NSError);
    NSString v8 = String._bridgeToObjectiveC()();
    id v9 = [v7 initWithDomain:v8 code:-1 userInfo:0];

    id v10 = v9;
    uint64_t v26 = _convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, uint64_t))(a2 + 16))(a2, 0, v26);

    uint64_t v11 = (void *)v26;
  }
}

uint64_t sub_10003D714(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      id v10 = (uint64_t *)&a3[OBJC_IVAR___CategorizationManager_pendingOverrides];
      swift_beginAccess();
      if ((unint64_t)*v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v11 = *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v11)
      {
        if (qword_100063EA8 != -1) {
          swift_once();
        }
        uint64_t v12 = type metadata accessor for Logger();
        sub_100008D9C(v12, (uint64_t)qword_100067A18);
        Swift::Int v13 = a3;
        uint64_t v14 = Logger.logObject.getter();
        os_log_type_t v15 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v49 = a4;
          uint64_t v16 = swift_slowAlloc();
          Swift::Int v17 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v16 = 138412546;
          char v18 = v13;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *Swift::Int v17 = v13;

          *(_WORD *)(v16 + 12) = 2048;
          if ((unint64_t)*v10 >> 62)
          {
            swift_bridgeObjectRetain();
            _CocoaArrayWrapper.endIndex.getter();

            swift_bridgeObjectRelease();
          }
          else
          {
          }
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ Sending %ld override rules", (uint8_t *)v16, 0x16u);
          sub_100008E28(&qword_1000651F0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          a4 = v49;
        }
        else
        {

          uint64_t v14 = v13;
        }

        uint64_t v34 = *v10;
        if (!((unint64_t)*v10 >> 62))
        {
          uint64_t v35 = v34 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n();
          dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
          if (!swift_dynamicCastMetatype())
          {
            uint64_t v46 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v46)
            {
              id v47 = (void *)(v35 + 32);
              while (*v47)
              {
                ++v47;
                if (!--v46) {
                  goto LABEL_46;
                }
              }
LABEL_56:
              swift_bridgeObjectRelease();
              uint64_t v34 = v35 | 1;
              goto LABEL_47;
            }
          }
          goto LABEL_46;
        }
LABEL_59:
        swift_bridgeObjectRetain();
        uint64_t v48 = _bridgeCocoaArray<A>(_:)();
        swift_bridgeObjectRelease();
        uint64_t v34 = v48;
        goto LABEL_47;
      }
      if (qword_100063EA8 != -1) {
        swift_once();
      }
      uint64_t v38 = type metadata accessor for Logger();
      sub_100008D9C(v38, (uint64_t)qword_100067A18);
      uint64_t v28 = a3;
      long long v29 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v29, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        unint64_t v41 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 138412290;
        char v42 = v28;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *unint64_t v41 = v28;

        _os_log_impl((void *)&_mh_execute_header, v29, v39, "%@ No override rules to send", v40, 0xCu);
        sub_100008E28(&qword_1000651F0);
        swift_arrayDestroy();
        goto LABEL_41;
      }
      goto LABEL_42;
    }
  }
  id v10 = (uint64_t *)&a3[OBJC_IVAR___CategorizationManager_pendingRules];
  swift_beginAccess();
  if ((unint64_t)*v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v19)
  {
    if (qword_100063EA8 != -1) {
      swift_once();
    }
    uint64_t v27 = type metadata accessor for Logger();
    sub_100008D9C(v27, (uint64_t)qword_100067A18);
    uint64_t v28 = a3;
    long long v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v29, v30))
    {
      Class v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)Class v31 = 138412290;
      id v33 = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v32 = v28;

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ No rules to send", v31, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
LABEL_41:
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_48;
    }
LABEL_42:

    goto LABEL_48;
  }
  if (qword_100063EA8 != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  sub_100008D9C(v20, (uint64_t)qword_100067A18);
  Swift::Int v21 = a3;
  char v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v50 = a4;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 138412546;
    uint64_t v26 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v25 = v21;

    *(_WORD *)(v24 + 12) = 2048;
    if ((unint64_t)*v10 >> 62)
    {
      swift_bridgeObjectRetain();
      _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease();
    }
    else
    {
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Sending %ld rules", (uint8_t *)v24, 0x16u);
    sub_100008E28(&qword_1000651F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    a4 = v50;
  }
  else
  {

    char v22 = v21;
  }

  uint64_t v34 = *v10;
  if ((unint64_t)*v10 >> 62) {
    goto LABEL_59;
  }
  uint64_t v35 = v34 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n();
  dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
  if (!swift_dynamicCastMetatype())
  {
    uint64_t v36 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v36)
    {
      id v37 = (void *)(v35 + 32);
      while (*v37)
      {
        ++v37;
        if (!--v36) {
          goto LABEL_46;
        }
      }
      goto LABEL_56;
    }
  }
LABEL_46:
  swift_bridgeObjectRelease();
LABEL_47:
  sub_10003B910(v34);
  swift_bridgeObjectRelease();
  *id v10 = (uint64_t)_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
LABEL_48:
  unint64_t v43 = *v10;
  if (v43 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v44 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return (*(uint64_t (**)(uint64_t, BOOL, void))(a4 + 16))(a4, v44 == 0, 0);
}

uint64_t sub_10003E03C(uint64_t a1, char *a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = &a2[OBJC_IVAR___CategorizationManager_pendingRules];
    swift_beginAccess();
    if (*(void *)v7 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v8 = *(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_beginAccess();
    swift_unknownObjectRetain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
    if (*(void *)v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      unint64_t v10 = v8 + 1;
      if (!__OFADD__(v8, 1))
      {
LABEL_8:
        unint64_t v46 = v10;
        BOOL v11 = v9 == v10;
        unint64_t v12 = 0xD000000000000010;
        if (v11) {
          unint64_t v12 = 0x6465646E65707041;
        }
        uint64_t v45 = v12;
        if (v11) {
          unint64_t v8 = 0xE800000000000000;
        }
        else {
          unint64_t v8 = 0x8000000100053CC0;
        }
        if (qword_100063EA8 == -1) {
          goto LABEL_14;
        }
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v9 = *(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t v10 = v8 + 1;
      if (!__OFADD__(v8, 1)) {
        goto LABEL_8;
      }
    }
    __break(1u);
LABEL_50:
    swift_once();
LABEL_14:
    uint64_t v13 = type metadata accessor for Logger();
    sub_100008D9C(v13, (uint64_t)qword_100067A18);
    uint64_t v14 = a2;
    swift_unknownObjectRetain_n();
    os_log_type_t v15 = v14;
    swift_bridgeObjectRetain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      os_log_type_t v42 = v17;
      uint64_t v43 = v9;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v40 = v6;
      uint64_t v19 = (void *)swift_slowAlloc();
      v47[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138413058;
      uint64_t v20 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v19 = v15;

      *(_WORD *)(v18 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_10004B330(v45, v8, v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 22) = 2112;
      swift_unknownObjectRetain();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v19[1] = v40;
      swift_unknownObjectRelease_n();
      *(_WORD *)(v18 + 32) = 2048;
      if (*(void *)v7 >> 62)
      {
        swift_bridgeObjectRetain();
        _CocoaArrayWrapper.endIndex.getter();

        swift_bridgeObjectRelease();
      }
      else
      {
      }
      unint64_t v21 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v16, v42, "%@ %s %@ -> now %ld entries", (uint8_t *)v18, 0x2Au);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v9 = v43;
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease_n();

      unint64_t v21 = v46;
    }
    BOOL v37 = v9 == v21;
LABEL_42:
    uint64_t v39 = v37;
    (*(void (**)(uint64_t, uint64_t, void))(a3 + 16))(a3, v39, 0);
    return swift_unknownObjectRelease();
  }
  self;
  uint64_t v22 = swift_dynamicCastObjCClass();
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = &a2[OBJC_IVAR___CategorizationManager_pendingOverrides];
    swift_beginAccess();
    if (*(void *)v24 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v25 = *(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_beginAccess();
    swift_unknownObjectRetain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8)
                                                                                 + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
    if (*(void *)v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      unint64_t v27 = v25 + 1;
      if (!__OFADD__(v25, 1))
      {
LABEL_25:
        unint64_t v28 = 0xD000000000000010;
        if (v26 == v27) {
          unint64_t v28 = 0xD000000000000012;
        }
        uint64_t v45 = v28;
        unint64_t v46 = v27;
        if (v26 == v27) {
          unint64_t v25 = 0x8000000100053CE0;
        }
        else {
          unint64_t v25 = 0x8000000100053CC0;
        }
        if (qword_100063EA8 == -1) {
          goto LABEL_31;
        }
        goto LABEL_56;
      }
    }
    else
    {
      uint64_t v26 = *(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t v27 = v25 + 1;
      if (!__OFADD__(v25, 1)) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_56:
    swift_once();
LABEL_31:
    uint64_t v29 = type metadata accessor for Logger();
    sub_100008D9C(v29, (uint64_t)qword_100067A18);
    os_log_type_t v30 = a2;
    swift_unknownObjectRetain_n();
    Class v31 = v30;
    swift_bridgeObjectRetain();
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v44 = v26;
      uint64_t v34 = swift_slowAlloc();
      uint64_t v41 = v23;
      uint64_t v35 = (void *)swift_slowAlloc();
      v47[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 138413058;
      uint64_t v36 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v35 = v31;

      *(_WORD *)(v34 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_10004B330(v45, v25, v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 22) = 2112;
      swift_unknownObjectRetain();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v35[1] = v41;
      swift_unknownObjectRelease_n();
      *(_WORD *)(v34 + 32) = 2048;
      if (*(void *)v24 >> 62)
      {
        swift_bridgeObjectRetain();
        _CocoaArrayWrapper.endIndex.getter();

        swift_bridgeObjectRelease();
      }
      else
      {
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%@ %s %@ -> now %ld entries", (uint8_t *)v34, 0x2Au);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v26 = v44;
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    BOOL v37 = v26 == v46;
    goto LABEL_42;
  }

  return swift_unknownObjectRelease();
}

void sub_10003E9E4(void *a1, uint64_t a2, void *aBlock)
{
  uint64_t v9 = &_swiftEmptyDictionarySingleton;
  _Block_copy(aBlock);
  sub_100039A64(a2, a1, (uint64_t)&v9, (void (**)(void, void, void))aBlock);
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_100021160(v7);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*((void (**)(void *, objc_class *, void))aBlock + 2))(aBlock, isa, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_10003EAF0(unint64_t a1)
{
  if (qword_100063EB8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100067A38;
  sub_10002FE38();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_14;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = 0;
  uint64_t v6 = OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_apiManager;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v7 = *(id *)(a1 + 8 * v5 + 32);
    }
    unint64_t v8 = v7;
    if (*(void *)(v2 + v6))
    {
      swift_retain();
      sub_1000200F0(v8);
      swift_release();
    }
    ++v5;
  }
  while (v3 != v5);
LABEL_14:

  return swift_bridgeObjectRelease();
}

unint64_t sub_10003EC34()
{
  unint64_t result = qword_100064DD0;
  if (!qword_100064DD0)
  {
    sub_100022940(255, &qword_100064DC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064DD0);
  }
  return result;
}

uint64_t sub_10003EC9C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003ECD4()
{
  sub_10003B104(*(void **)(v0 + 16));
}

uint64_t sub_10003ECDC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10003ED1C()
{
  sub_10003B2D0(*(void **)(v0 + 16));
}

uint64_t sub_10003ED24(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_10003ED98(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008E28(&qword_100064E58);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
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
    sub_10002AA70(v6, (uint64_t)&v15, &qword_100064E60);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10004740C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000A71C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10003EED0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008E28(&qword_100064E88);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_1000474C8((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_10003EFDC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008E28(&qword_100064E70);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
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
    sub_10002AA70(v6, (uint64_t)&v13, &qword_100064E78);
    uint64_t v7 = v13;
    unint64_t result = sub_1000474C8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10000A71C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_10003F10C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008E28(&qword_100064E50);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_10000A848(v7, v8);
    unint64_t result = sub_10004740C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (uint64_t *)(v2[7] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_10003F234(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008E28(&qword_100064E68);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10004740C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_10003F358(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008E28(&qword_100064E80);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10004740C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

id sub_10003F60C(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = a1;
  uint64_t v3 = sub_100008E28(&qword_1000641E0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v72 = &_swiftEmptyDictionarySingleton;
  id v6 = [self defaultManager];
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 containerURLForSecurityApplicationGroupIdentifier:v7];

  if (v8)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
  }
  sub_10000A72C((uint64_t)v5, &qword_1000641E0);
  id v11 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithSuiteName:v12];

  if (!v13) {
    return v72;
  }
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 dictionaryForKey:v14];

  if (v15)
  {
    uint64_t v16 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v16 = &_swiftEmptyDictionarySingleton;
  }
  id v17 = [self defaultStore];
  uint64_t v18 = v17;
  if (!v17
    || (id v19 = v17,
        NSString v20 = String._bridgeToObjectiveC()(),
        id v21 = objc_msgSend(v19, "aa_appleAccountWithUsername:", v20),
        v20,
        v19,
        !v21))
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v29 = 13;
    *(_OWORD *)(v29 + 8) = 0u;
    *(_OWORD *)(v29 + 24) = 0u;
    *(unsigned char *)(v29 + 40) = 5;
    swift_willThrow();

    swift_bridgeObjectRelease();
    return (id)swift_bridgeObjectRelease();
  }

  id result = [v21 identifier];
  if (result)
  {
    uint64_t v23 = result;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v25;

    if (v16[2] && (unint64_t v27 = sub_10004740C(v24, v26), (v28 & 1) != 0))
    {
      sub_10000A6C0(v16[7] + 32 * v27, (uint64_t)&v70);
    }
    else
    {
      long long v70 = 0u;
      long long v71 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v71 + 1))
    {
      sub_100008E28((uint64_t *)&unk_100063F40);
      if (swift_dynamicCast())
      {
        uint64_t v30 = v68;
        if (*(void *)(v68 + 16))
        {
          unint64_t v31 = sub_10004740C(0xD000000000000014, 0x8000000100052B30);
          if (v32)
          {
            sub_10000A6C0(*(void *)(v30 + 56) + 32 * v31, (uint64_t)&v70);
            if (swift_dynamicCast())
            {
              uint64_t v33 = v68;
              uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v36 = (uint8_t *)v34;
              BOOL v37 = v35;
              if (*(void *)(v33 + 16))
              {
                double v65 = v35;
                uint64_t v38 = (uint8_t *)v34;
                swift_bridgeObjectRetain();
                unint64_t v39 = sub_10004740C(v66, a2);
                if (v40)
                {
                  sub_10000A6C0(*(void *)(v33 + 56) + 32 * v39, (uint64_t)&v70);
                }
                else
                {
                  long long v70 = 0u;
                  long long v71 = 0u;
                }
                swift_bridgeObjectRelease();
                uint64_t v36 = v38;
                BOOL v37 = v65;
              }
              else
              {
                long long v70 = 0u;
                long long v71 = 0u;
              }
              swift_bridgeObjectRelease();
              if (*((void *)&v71 + 1))
              {
                if (swift_dynamicCast())
                {
                  id v64 = (uint8_t *)v68;
                  double v65 = v36;
                  uint64_t v41 = v69;
                  os_log_type_t v42 = v72;
                  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  *(void *)&long long v70 = v42;
                  unint64_t v72 = (void *)0x8000000000000000;
                  sub_100042094((uint64_t)v64, v41, (uint64_t)v65, (uint64_t)v37, isUniquelyReferenced_nonNull_native);
                  unint64_t v72 = (void *)v70;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  goto LABEL_34;
                }
              }
              else
              {
                sub_10000A72C((uint64_t)&v70, (uint64_t *)&unk_1000648F0);
              }
              sub_1000417FC((uint64_t)v36, (uint64_t)v37, &v70);
              swift_bridgeObjectRelease();
              sub_100009000(v70, *((unint64_t *)&v70 + 1));
            }
          }
        }
LABEL_34:
        if (*(void *)(v30 + 16) && (unint64_t v44 = sub_10004740C(0xD000000000000011, 0x8000000100052B50), (v45 & 1) != 0))
        {
          sub_10000A6C0(*(void *)(v30 + 56) + 32 * v44, (uint64_t)&v70);
        }
        else
        {
          long long v70 = 0u;
          long long v71 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v71 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v46 = v68;
            uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v49 = v48;
            if (*(void *)(v46 + 16))
            {
              swift_bridgeObjectRetain();
              unint64_t v50 = sub_10004740C(v66, a2);
              if (v51)
              {
                sub_10000A6C0(*(void *)(v46 + 56) + 32 * v50, (uint64_t)&v70);
              }
              else
              {
                long long v70 = 0u;
                long long v71 = 0u;
              }
              swift_bridgeObjectRelease();
            }
            else
            {
              long long v70 = 0u;
              long long v71 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v71 + 1))
            {
              if (swift_dynamicCast())
              {
                uint64_t v52 = v68;
                uint64_t v53 = v69;
                uint64_t v54 = v72;
                char v55 = swift_isUniquelyReferenced_nonNull_native();
                *(void *)&long long v70 = v54;
                unint64_t v72 = (void *)0x8000000000000000;
                sub_100042094(v52, v53, v47, v49, v55);
                unint64_t v72 = (void *)v70;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_52;
              }
            }
            else
            {
              sub_10000A72C((uint64_t)&v70, (uint64_t *)&unk_1000648F0);
            }
            sub_1000417FC(v47, v49, &v70);
            swift_bridgeObjectRelease();
            sub_100009000(v70, *((unint64_t *)&v70 + 1));
          }
        }
        else
        {
          sub_10000A72C((uint64_t)&v70, (uint64_t *)&unk_1000648F0);
        }
LABEL_52:
        if (qword_100063E80 != -1) {
          swift_once();
        }
        uint64_t v56 = type metadata accessor for Logger();
        sub_100008D9C(v56, (uint64_t)qword_1000679A0);
        uint64_t v57 = Logger.logObject.getter();
        os_log_type_t v58 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v57, v58))
        {
          double v59 = (uint8_t *)swift_slowAlloc();
          uint64_t v66 = swift_slowAlloc();
          *(void *)&long long v70 = v66;
          *(_DWORD *)double v59 = 136315138;
          id v64 = v59 + 4;
          double v65 = v59;
          swift_beginAccess();
          swift_bridgeObjectRetain();
          uint64_t v60 = Dictionary.description.getter();
          unint64_t v62 = v61;
          swift_bridgeObjectRelease();
          uint64_t v67 = sub_10004B330(v60, v62, (uint64_t *)&v70);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v57, v58, "Found default certificates: %s", v65, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        swift_beginAccess();
        return v72;
      }
    }
    else
    {

      sub_10000A72C((uint64_t)&v70, (uint64_t *)&unk_1000648F0);
    }
    return v72;
  }
  __break(1u);
  return result;
}

void sub_100040034(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v90 = a3;
  unint64_t v96 = a2;
  uint64_t v91 = a1;
  uint64_t v4 = sub_100008E28(&qword_1000641E0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [self defaultManager];
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 containerURLForSecurityApplicationGroupIdentifier:v8];

  if (v9)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  }
  sub_10000A72C((uint64_t)v6, &qword_1000641E0);
  id v12 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v14 = [v12 initWithSuiteName:v13];

  if (!v14)
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v21 = 0xD00000000000001BLL;
    *(void *)(v21 + 8) = 0x8000000100053D70;
    *(void *)(v21 + 24) = 0;
    *(void *)(v21 + 32) = 0;
    *(void *)(v21 + 16) = 0;
    *(unsigned char *)(v21 + 40) = 0;
    swift_willThrow();
    return;
  }
  uint64_t v16 = *(void *)(v3 + OBJC_IVAR___CloudAccountManager_mailPropertyKey);
  uint64_t v15 = *(void *)(v3 + OBJC_IVAR___CloudAccountManager_mailPropertyKey + 8);
  id v17 = v14;
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = [v17 dictionaryForKey:v18];

  if (v19)
  {
    NSString v20 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    NSString v20 = &_swiftEmptyDictionarySingleton;
  }
  id v22 = [self defaultStore];
  uint64_t v23 = v22;
  if (!v22
    || (id v24 = v22,
        NSString v25 = String._bridgeToObjectiveC()(),
        id v26 = objc_msgSend(v24, "aa_appleAccountWithUsername:", v25),
        v25,
        v24,
        !v26))
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v38 = 13;
    *(_OWORD *)(v38 + 8) = 0u;
    *(_OWORD *)(v38 + 24) = 0u;
    *(unsigned char *)(v38 + 40) = 5;
    swift_willThrow();
    swift_bridgeObjectRelease();

    return;
  }
  uint64_t v87 = v15;

  id v27 = [v26 identifier];
  if (!v27)
  {
    __break(1u);
    return;
  }
  char v28 = v27;
  uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v30 = v29;

  if (qword_100063E80 != -1) {
    swift_once();
  }
  uint64_t v31 = type metadata accessor for Logger();
  uint64_t v32 = sub_100008D9C(v31, (uint64_t)qword_1000679A0);
  swift_bridgeObjectRetain_n();
  uint64_t v85 = v32;
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.debug.getter();
  BOOL v35 = os_log_type_enabled(v33, v34);
  id v88 = v26;
  uint64_t v86 = v16;
  if (v35)
  {
    uint64_t v36 = swift_slowAlloc();
    id v84 = v20;
    BOOL v37 = (uint8_t *)v36;
    *(void *)&long long v94 = swift_slowAlloc();
    *(_DWORD *)BOOL v37 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v93[0] = sub_10004B330(v89, v30, (uint64_t *)&v94);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Updating refs for accountId: %s", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    NSString v20 = v84;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v39 = v90;
  if (!v20[2])
  {
    long long v94 = 0u;
    long long v95 = 0u;
    id v42 = v88;
LABEL_26:
    sub_10000A72C((uint64_t)&v94, (uint64_t *)&unk_1000648F0);
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  unint64_t v40 = sub_10004740C(v89, v30);
  if (v41)
  {
    sub_10000A6C0(v20[7] + 32 * v40, (uint64_t)&v94);
  }
  else
  {
    long long v94 = 0u;
    long long v95 = 0u;
  }
  id v42 = v88;
  swift_bridgeObjectRelease();
  if (!*((void *)&v95 + 1)) {
    goto LABEL_26;
  }
  sub_100008E28((uint64_t *)&unk_100063F40);
  if (swift_dynamicCast())
  {
    uint64_t v43 = *(void **)&v93[0];
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v43 = &_swiftEmptyDictionarySingleton;
LABEL_28:
  uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v39[2] && (unint64_t v46 = sub_10004740C(v44, v45), (v47 & 1) != 0))
  {
    uint64_t v48 = (uint64_t *)(v39[7] + 16 * v46);
    id v84 = v43;
    uint64_t v90 = v17;
    uint64_t v50 = *v48;
    unint64_t v49 = v48[1];
    sub_10000A848(*v48, v49);
    swift_bridgeObjectRelease();
    sub_100008E28(&qword_1000641F0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004DF40;
    unint64_t v52 = v96;
    *(void *)(inited + 32) = v91;
    *(void *)(inited + 40) = v52;
    *(void *)(inited + 48) = v50;
    *(void *)(inited + 56) = v49;
    uint64_t v83 = v50;
    unint64_t v82 = v49;
    unint64_t v53 = v49;
    id v17 = v90;
    sub_10000A848(v50, v53);
    swift_bridgeObjectRetain();
    unint64_t v54 = sub_10003F10C(inited);
    *((void *)&v95 + 1) = sub_100008E28(&qword_100064E48);
    *(void *)&long long v94 = v54;
    sub_10000A71C(&v94, v93);
    char v55 = v84;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v92 = v55;
    sub_100041F40(v93, 0xD000000000000014, 0x8000000100052B30, isUniquelyReferenced_nonNull_native);
    uint64_t v43 = v92;
    swift_bridgeObjectRelease();
    *((void *)&v95 + 1) = sub_100008E28((uint64_t *)&unk_100063F40);
    *(void *)&long long v94 = v43;
    sub_10000A71C(&v94, v93);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v57 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v92 = v20;
    sub_100041F40(v93, v89, v30, v57);
    NSString v20 = v92;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v59 = String._bridgeToObjectiveC()();
    [v17 setObject:isa forKey:v59];

    [v17 synchronize];
    uint64_t v60 = Logger.logObject.getter();
    os_log_type_t v61 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v60, v61))
    {
      unint64_t v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v62 = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "UpdateUserDefaults. encryption certificate updated successfully", v62, 2u);
      swift_slowDealloc();

      sub_100008F8C(v83, v82);
    }
    else
    {
      sub_100008F8C(v83, v82);
    }
    id v42 = v88;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v39[2] && (unint64_t v65 = sub_10004740C(v63, v64), (v66 & 1) != 0))
  {
    uint64_t v67 = (uint64_t *)(v39[7] + 16 * v65);
    uint64_t v68 = v20;
    uint64_t v70 = *v67;
    unint64_t v69 = v67[1];
    sub_10000A848(*v67, v69);
    swift_bridgeObjectRelease();
    sub_100008E28(&qword_1000641F0);
    uint64_t v71 = swift_initStackObject();
    *(_OWORD *)(v71 + 16) = xmmword_10004DF40;
    *(void *)(v71 + 32) = v91;
    *(void *)(v71 + 40) = v96;
    *(void *)(v71 + 48) = v70;
    *(void *)(v71 + 56) = v69;
    swift_bridgeObjectRetain();
    unint64_t v96 = v69;
    sub_10000A848(v70, v69);
    unint64_t v72 = sub_10003F10C(v71);
    *((void *)&v95 + 1) = sub_100008E28(&qword_100064E48);
    *(void *)&long long v94 = v72;
    sub_10000A71C(&v94, v93);
    char v73 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v92 = v43;
    sub_100041F40(v93, 0xD000000000000011, 0x8000000100052B50, v73);
    uint64_t v74 = v92;
    swift_bridgeObjectRelease();
    *((void *)&v95 + 1) = sub_100008E28((uint64_t *)&unk_100063F40);
    *(void *)&long long v94 = v74;
    sub_10000A71C(&v94, v93);
    char v75 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v92 = v68;
    sub_100041F40(v93, v89, v30, v75);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    Class v76 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v77 = String._bridgeToObjectiveC()();
    [v17 setObject:v76 forKey:v77];

    [v17 synchronize];
    id v78 = Logger.logObject.getter();
    os_log_type_t v79 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v78, v79))
    {
      unsigned int v80 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v80 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, v79, "UpdateUserDefaults. signing certificate updated successfully", v80, 2u);
      swift_slowDealloc();

      sub_100008F8C(v70, v96);
    }
    else
    {

      sub_100008F8C(v70, v96);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

void sub_100040D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v53 = a3;
  uint64_t v54 = a1;
  uint64_t v55 = a2;
  uint64_t v6 = sub_100008E28(&qword_1000641E0);
  __chkstk_darwin(v6 - 8);
  NSString v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self defaultManager];
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 containerURLForSecurityApplicationGroupIdentifier:v10];

  if (v11)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  sub_10000A72C((uint64_t)v8, &qword_1000641E0);
  id v14 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain();
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithSuiteName:v15];

  if (!v16)
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD00000000000001BLL;
    *(void *)(v22 + 8) = 0x8000000100053D70;
    *(void *)(v22 + 24) = 0;
    *(void *)(v22 + 32) = 0;
    *(void *)(v22 + 16) = 0;
    *(unsigned char *)(v22 + 40) = 0;
    swift_willThrow();
    return;
  }
  uint64_t v17 = *(void *)(v4 + OBJC_IVAR___CloudAccountManager_mailPropertyKey + 8);
  id v18 = v16;
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = [v18 dictionaryForKey:v19];

  uint64_t v52 = v17;
  if (v20)
  {
    uint64_t v21 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v21 = &_swiftEmptyDictionarySingleton;
  }
  id v23 = [self defaultStore];
  id v24 = v23;
  if (!v23
    || (id v25 = v23,
        NSString v26 = String._bridgeToObjectiveC()(),
        id v27 = objc_msgSend(v25, "aa_appleAccountWithUsername:", v26),
        v26,
        v25,
        !v27))
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v36 = 13;
    *(_OWORD *)(v36 + 8) = 0u;
    *(_OWORD *)(v36 + 24) = 0u;
    *(unsigned char *)(v36 + 40) = 5;
    swift_willThrow();
    swift_bridgeObjectRelease();

    return;
  }

  id v28 = [v27 identifier];
  if (!v28)
  {
    __break(1u);
    goto LABEL_47;
  }
  unint64_t v29 = v28;
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = v31;

  uint64_t v33 = v21[2];
  uint64_t v50 = v30;
  uint64_t v51 = v32;
  if (!v33)
  {
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_21:
    sub_10000A72C((uint64_t)&v59, (uint64_t *)&unk_1000648F0);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  unint64_t v34 = sub_10004740C(v30, v32);
  if (v35)
  {
    sub_10000A6C0(v21[7] + 32 * v34, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_21;
  }
  sub_100008E28((uint64_t *)&unk_100063F40);
  if (!swift_dynamicCast())
  {
LABEL_22:
    BOOL v37 = &_swiftEmptyDictionarySingleton;
    goto LABEL_23;
  }
  BOOL v37 = *(void **)&v57[0];
LABEL_23:
  uint64_t v38 = 0xD000000000000011;
  os_log_type_t v61 = v37;
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v53 && v39 == a4)
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = 0x8000000100052B50;
    if (v37[2]) {
      goto LABEL_26;
    }
LABEL_32:
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_40:
    sub_10000A72C((uint64_t)&v59, (uint64_t *)&unk_1000648F0);
    goto LABEL_41;
  }
  char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v43)
  {
    uint64_t v40 = 0x8000000100052B50;
  }
  else
  {
    uint64_t v38 = 0xD000000000000014;
    uint64_t v40 = 0x8000000100052B30;
  }
  BOOL v37 = v61;
  if (!v61[2]) {
    goto LABEL_32;
  }
LABEL_26:
  swift_bridgeObjectRetain();
  unint64_t v41 = sub_10004740C(v38, v40);
  if (v42)
  {
    sub_10000A6C0(v37[7] + 32 * v41, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_40;
  }
  sub_100008E28((uint64_t *)&unk_100063F40);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_41:
    uint64_t v58 = 0;
    goto LABEL_42;
  }
  if (!v58)
  {
LABEL_42:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_43:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  sub_1000416F8(v54, v55, &v59);
  sub_10000A72C((uint64_t)&v59, (uint64_t *)&unk_1000648F0);
  uint64_t v44 = v58;
  if (v58)
  {
    if (*(void *)(v58 + 16))
    {
      *((void *)&v60 + 1) = sub_100008E28((uint64_t *)&unk_100063F40);
      *(void *)&long long v59 = v44;
      sub_10000A71C(&v59, v57);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v56 = v37;
      sub_100041F40(v57, v38, v40, isUniquelyReferenced_nonNull_native);
      unint64_t v46 = v56;
      os_log_type_t v61 = v56;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000416F8(v38, v40, &v59);
      swift_bridgeObjectRelease();
      sub_10000A72C((uint64_t)&v59, (uint64_t *)&unk_1000648F0);
      unint64_t v46 = v61;
    }
    *((void *)&v60 + 1) = sub_100008E28((uint64_t *)&unk_100063F40);
    *(void *)&long long v59 = v46;
    sub_10000A71C(&v59, v57);
    swift_bridgeObjectRetain();
    char v47 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v56 = v21;
    sub_100041F40(v57, v50, v51, v47);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v49 = String._bridgeToObjectiveC()();
    [v18 setObject:isa forKey:v49];

    [v18 synchronize];
    goto LABEL_43;
  }
LABEL_47:
  __break(1u);
}

id sub_10004161C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloudAccountManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CloudAccountManager()
{
  return self;
}

uint64_t sub_1000416C8@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

double sub_1000416F8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10004740C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000485F0();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_10000A71C((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1000419DC(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

double sub_1000417FC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10004740C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000487D8();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    *a3 = *(_OWORD *)(*(void *)(v11 + 56) + 16 * v8);
    sub_100041BB4(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = xmmword_10004DF30;
  }
  return result;
}

double sub_1000418E4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10004757C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100048B5C();
      uint64_t v9 = v11;
    }

    sub_10000A71C((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_100041D8C(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_1000419DC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v10 = Hasher._finalize()();
        double result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          id v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          id v16 = (_OWORD *)(v15 + 32 * v3);
          uint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *id v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    id v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    id v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *id v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100041BB4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        double result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          id v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_100041D8C(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v11 = *(void *)(a2 + 40);
        id v12 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v13 = NSObject._rawHashValue(seed:)(v11);

        Swift::Int v14 = v13 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v14 >= v9 && v3 >= v14)
          {
LABEL_16:
            uint64_t v17 = *(void *)(a2 + 48);
            uint64_t v18 = (void *)(v17 + 8 * v3);
            uint64_t v19 = (void *)(v17 + 8 * v6);
            if (v3 != v6 || v18 >= v19 + 1) {
              *uint64_t v18 = *v19;
            }
            uint64_t v20 = *(void *)(a2 + 56);
            BOOL v21 = (_OWORD *)(v20 + 32 * v3);
            uint64_t v22 = (_OWORD *)(v20 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v21 >= v22 + 2))
            {
              long long v10 = v22[1];
              *BOOL v21 = *v22;
              v21[1] = v10;
              int64_t v3 = v6;
            }
          }
        }
        else if (v14 >= v9 || v3 >= v14)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v24 = *v23;
    uint64_t v25 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v23 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v25 = *v23;
    uint64_t v24 = (-1 << a1) - 1;
  }
  *uint64_t v23 = v25 & v24;
  uint64_t v26 = *(void *)(a2 + 16);
  BOOL v27 = __OFSUB__(v26, 1);
  uint64_t v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
}

_OWORD *sub_100041F40(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_10004740C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1000485F0();
      goto LABEL_7;
    }
    sub_1000475C0(v15, a4 & 1);
    unint64_t v21 = sub_10004740C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10000A788((uint64_t)v19);
    return sub_10000A71C(a1, v19);
  }
LABEL_13:
  sub_1000424E8(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_100042094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10004740C(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1000487D8();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      uint64_t result = sub_100008F8C(*(void *)v21, *(void *)(v21 + 8));
      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + 8) = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000478C0(v17, a5 & 1);
  unint64_t v23 = sub_10004740C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_10004221C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10004740C(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1000489A0();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100047BD0(v17, a5 & 1);
  unint64_t v23 = sub_10004740C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_1000423A4(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_10004757C((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_100048B5C();
      goto LABEL_7;
    }
    sub_100047EF8(v12, a3 & 1);
    unint64_t v18 = sub_10004757C((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      uint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    sub_100042A34();
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    BOOL v16 = (_OWORD *)(v15[7] + 32 * v9);
    sub_10000A788((uint64_t)v16);
    return sub_10000A71C(a1, v16);
  }
LABEL_13:
  sub_100042554(v9, (uint64_t)a2, a1, v15);

  return a2;
}

_OWORD *sub_1000424E8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000A71C(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

_OWORD *sub_100042554(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_10000A71C(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void sub_1000425BC(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = self;
  [v8 reloadAccounts];
  swift_bridgeObjectRetain();
  uint64_t v26 = a1;
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = [v8 accountContainingEmailAddress:v9];

  if (v10 && (id v11 = [v10 systemAccount]) != 0)
  {
    uint64_t v12 = v11;

    uint64_t v13 = *(void *)(a3 + 16);
    if (v13)
    {
      int v27 = a4 & 1;
      swift_bridgeObjectRetain();
      uint64_t v14 = (unint64_t *)(a3 + 40);
      p_type = &stru_100061FF0.type;
      uint64_t v25 = v12;
      do
      {
        uint64_t v16 = *(v14 - 1);
        unint64_t v17 = *v14;
        swift_bridgeObjectRetain();
        Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
        NSString v19 = String._bridgeToObjectiveC()();
        [v12 p_type[397]:isa:v19];

        if (qword_100063E80 != -1) {
          swift_once();
        }
        uint64_t v20 = type metadata accessor for Logger();
        sub_100008D9C(v20, (uint64_t)qword_1000679A0);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v21 = Logger.logObject.getter();
        os_log_type_t v22 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = swift_slowAlloc();
          uint64_t v28 = swift_slowAlloc();
          *(_DWORD *)uint64_t v23 = 136315650;
          swift_bridgeObjectRetain();
          *(void *)(v23 + 4) = sub_10004B330(v16, v17, &v28);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v23 + 12) = 1024;
          *(_DWORD *)(v23 + 14) = v27;
          *(_WORD *)(v23 + 18) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v23 + 20) = sub_10004B330(v26, a2, &v28);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Set %s property to %{BOOL}d for account %s", (uint8_t *)v23, 0x1Cu);
          swift_arrayDestroy();
          uint64_t v12 = v25;
          swift_slowDealloc();
          p_type = (char **)(&stru_100061FF0 + 16);
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        v14 += 2;
        --v13;
      }
      while (v13);

      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
  else
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v24 = 13;
    *(_OWORD *)(v24 + 8) = 0u;
    *(_OWORD *)(v24 + 24) = 0u;
    *(unsigned char *)(v24 + 40) = 5;
    swift_willThrow();
  }
}

id sub_100042938(uint64_t a1, id a2)
{
  id v3 = [self defaultStore];
  uint64_t v4 = v3;
  if (v3
    && (id v5 = v3,
        NSString v6 = String._bridgeToObjectiveC()(),
        a2 = objc_msgSend(v5, "aa_appleAccountWithUsername:", v6),
        v6,
        v5,
        a2))
  {
  }
  else
  {
    sub_100008DD4();
    swift_allocError();
    *(void *)uint64_t v7 = 13;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(unsigned char *)(v7 + 40) = 5;
    swift_willThrow();
  }
  return a2;
}

unint64_t sub_100042A34()
{
  unint64_t result = qword_100064E00;
  if (!qword_100064E00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100064E00);
  }
  return result;
}

uint64_t sub_100042A74@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(result + 40);
  return result;
}

uint64_t sub_100042A80()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v9 = *(void *)(v1 - 8);
  uint64_t v10 = v1;
  __chkstk_darwin(v1);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  *(_DWORD *)(v0 + 24) = -1;
  LOBYTE(v11) = 0;
  sub_100008E28(&qword_100064F50);
  swift_allocObject();
  uint64_t v6 = CurrentValueSubject.init(_:)();
  *(void *)(v0 + 32) = v6;
  unint64_t v8 = sub_10000DF10();
  static DispatchQoS.unspecified.getter();
  id v11 = _swiftEmptyArrayStorage;
  sub_100032928();
  sub_100008E28(&qword_100064100);
  sub_100008EB4(&qword_100064920, &qword_100064100);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v10);
  *(void *)(v0 + 48) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  id v11 = (void *)v6;
  sub_100008EB4(&qword_100064F58, &qword_100064F50);
  *(void *)(v0 + 16) = Publisher.eraseToAnyPublisher()();
  *(unsigned char *)(v0 + 40) = 0;
  sub_100042D34();
  sub_100042EF0();
  return v0;
}

void sub_100042D34()
{
  uint64_t v1 = *(NSObject **)(v0 + 48);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  void v8[4] = sub_100043344;
  v8[5] = v2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  void v8[2] = sub_10004324C;
  v8[3] = &unk_10005F4F8;
  id v3 = _Block_copy(v8);
  swift_release();
  swift_beginAccess();
  LODWORD(v1) = notify_register_dispatch("com.apple.springboard.lockstate", (int *)(v0 + 24), v1, v3);
  swift_endAccess();
  _Block_release(v3);
  if (v1)
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100008D9C(v4, (uint64_t)qword_100067A00);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Could not register for lock state notifications", v7, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100042EF0()
{
  uint64_t v1 = v0;
  uint64_t state64 = 0;
  swift_beginAccess();
  if (notify_get_state(*(_DWORD *)(v0 + 24), &state64))
  {
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100008D9C(v2, (uint64_t)qword_100067A00);
    id v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Could not fetch lock state", v5, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    *(unsigned char *)(v0 + 40) = state64 != 0;
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100008D9C(v6, (uint64_t)qword_100067A00);
    swift_retain_n();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136446210;
      if (*(unsigned char *)(v1 + 40)) {
        uint64_t v10 = 0x64656B636F6CLL;
      }
      else {
        uint64_t v10 = 0x64656B636F6C6E75;
      }
      if (*(unsigned char *)(v1 + 40)) {
        unint64_t v11 = 0xE600000000000000;
      }
      else {
        unint64_t v11 = 0xE800000000000000;
      }
      sub_10004B330(v10, v11, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "UI lock state is %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v13) = *(unsigned char *)(v1 + 40);
    CurrentValueSubject.send(_:)();
  }
}

uint64_t sub_1000431F4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100042EF0();
    return swift_release();
  }
  return result;
}

uint64_t sub_10004324C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_1000432A0()
{
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for DeviceLockObserver()
{
  return self;
}

uint64_t sub_10004330C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100043344()
{
  return sub_1000431F4();
}

uint64_t sub_10004334C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004335C()
{
  return swift_release();
}

SecKeyRef sub_100043364(const __CFData *a1, void *a2)
{
  sub_100008E28(&qword_100064F60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E280;
  *(void *)(inited + 32) = kSecAttrKeyType;
  *(void *)(inited + 40) = a2;
  *(void *)(inited + 48) = kSecAttrKeyClass;
  *(void *)(inited + 56) = kSecAttrKeyClassPrivate;
  CFStringRef v5 = (id)kSecAttrKeyType;
  id v6 = a2;
  CFStringRef v7 = (id)kSecAttrKeyClass;
  CFStringRef v8 = (id)kSecAttrKeyClassPrivate;
  sub_10003EED0(inited);
  type metadata accessor for CFString(0);
  sub_10002E8D4();
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  SecKeyRef v10 = SecKeyCreateWithData(a1, isa, 0);

  return v10;
}

SecKeyRef sub_100043458(void *a1, uint64_t a2)
{
  sub_100008E28(&qword_100064700);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004E280;
  *(void *)(inited + 32) = kSecAttrKeyType;
  type metadata accessor for CFString(0);
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 72) = kSecAttrKeySizeInBits;
  *(void *)(inited + 104) = &type metadata for Int;
  *(void *)(inited + 80) = a2;
  CFStringRef v6 = (id)kSecAttrKeyType;
  id v7 = a1;
  CFStringRef v8 = (id)kSecAttrKeySizeInBits;
  sub_10003EFDC(inited);
  sub_10002E8D4();
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  RandomKey = SecKeyCreateRandomKey(isa, 0);

  if (!RandomKey) {
    return 0;
  }
  CFDataRef v11 = SecKeyCopyExternalRepresentation(RandomKey, 0);
  if (v11)
  {
    uint64_t v12 = v11;
    SecKeyRef v13 = sub_100043364(v11, v7);

    RandomKey = v12;
  }
  else
  {
    SecKeyRef v13 = 0;
  }

  return v13;
}

uint64_t sub_100043598()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100043604()
{
  uint64_t v1 = sub_100008E28(&qword_100065148);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URLComponents();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008E28(&qword_1000641E0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  CFDataRef v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  SecKeyRef v13 = (char *)&v31 - v12;
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v33 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = [*(id *)(v0 + qword_100064F70) propertiesForDataclass:ACAccountDataclassMail];
  if (!v17) {
    return 0;
  }
  unint64_t v18 = v17;
  uint64_t v32 = v5;
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v34 = 0xD00000000000001DLL;
  unint64_t v35 = 0x80000001000541B0;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v19 + 16) && (unint64_t v20 = sub_100047484((uint64_t)v36), (v21 & 1) != 0))
  {
    sub_10000A6C0(*(void *)(v19 + 56) + 32 * v20, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10001179C((uint64_t)v36);
  if (!*((void *)&v38 + 1))
  {
    uint64_t v24 = (uint64_t *)&unk_1000648F0;
    uint64_t v25 = (char *)&v37;
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  URL.init(string:)();
  swift_bridgeObjectRelease();
  uint64_t v22 = v33;
  uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
  if (v23(v13, 1, v14) == 1)
  {
    uint64_t v24 = &qword_1000641E0;
    uint64_t v25 = v13;
LABEL_11:
    sub_10000A72C((uint64_t)v25, v24);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v16, v13, v14);
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  uint64_t v28 = v22;
  uint64_t v29 = v32;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v3, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v14);
    uint64_t v24 = &qword_100065148;
    uint64_t v25 = v3;
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v7, v3, v4);
  URLComponents.path.setter();
  URLComponents.url.getter();
  if (v23(v11, 1, v14) == 1)
  {
    sub_10000A72C((uint64_t)v11, &qword_1000641E0);
    uint64_t v26 = 0;
    uint64_t v30 = v33;
  }
  else
  {
    uint64_t v26 = URL.absoluteString.getter();
    uint64_t v30 = v33;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v14);
  }
  (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v14);
  return v26;
}

id sub_100043AC4()
{
  uint64_t v1 = qword_100064F88;
  uint64_t v2 = *(void **)(v0 + qword_100064F88);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_100064F88);
  }
  else
  {
    sub_1000441D8(v0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_100043B28()
{
  uint64_t v25 = *(void *)(v0 + qword_100064F68);
  swift_getKeyPath();
  sub_10004A100(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_10004A100(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
  sub_100036B94();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  uint64_t v2 = v25;
  unint64_t v1 = v26;
  id v3 = [*(id *)(v0 + qword_100064F70) propertiesForDataclass:ACAccountDataclassMail];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v23 = v25;
    unint64_t v24 = v26;
    swift_bridgeObjectRetain();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v5 + 16) && (unint64_t v6 = sub_100047484((uint64_t)&v25), (v7 & 1) != 0))
    {
      sub_10000A6C0(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v27);
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10001179C((uint64_t)&v25);
    if (*((void *)&v28 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v8 = v2;
        if (v2 == 0xD000000000000017 && v1 == 0x8000000100053020)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v21 & 1) == 0) {
            return v8;
          }
        }
        uint64_t v25 = v23;
        unint64_t v26 = v24;
        *(void *)&long long v27 = 0x6F676E7569;
        *((void *)&v27 + 1) = 0xE500000000000000;
        sub_100008F38();
        if (StringProtocol.contains<A>(_:)()) {
          return v8;
        }
        goto LABEL_32;
      }
    }
    else
    {
      sub_10000A72C((uint64_t)&v27, (uint64_t *)&unk_1000648F0);
    }
  }
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100008D9C(v9, (uint64_t)qword_100067A00);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v27 = sub_10004B330(v2, v1, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&long long v27 = sub_10004B330(v13, v14, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Account bag has no value for key: %s in %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v2 == 0xD000000000000014 && v1 == 0x80000001000531A0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_100043604();
    unint64_t v17 = 0xD00000000000003BLL;
    unint64_t v18 = "/ecs/v1/mcc/events/iungo/recategorization/clearalloverrides";
  }
  else
  {
    if ((v2 != 0xD000000000000011 || v1 != 0x8000000100053110)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v2 != 0xD000000000000017 || v1 != 0x8000000100053020)
      {
        char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v22 & 1) == 0) {
          return 0;
        }
        goto LABEL_33;
      }
LABEL_32:
      swift_bridgeObjectRelease();
LABEL_33:
      uint64_t v15 = sub_100043604();
      unint64_t v17 = 0xD00000000000002ELL;
      unint64_t v18 = "/ecs/v1/mcc/events/iungo/recategorization/sync";
      goto LABEL_21;
    }
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_100043604();
    unint64_t v17 = 0xD000000000000021;
    unint64_t v18 = "/iungo/sender/v1/senders/category";
  }
LABEL_21:
  uint64_t v25 = v17;
  unint64_t v26 = (unint64_t)(v18 - 32) | 0x8000000000000000;
  *(void *)&long long v27 = v15;
  *((void *)&v27 + 1) = v16;
  swift_bridgeObjectRetain();
  *(void *)&long long v27 = String.init<A>(_:)();
  *((void *)&v27 + 1) = v19;
  String.append<A>(contentsOf:)();
  swift_bridgeObjectRelease();
  return v27;
}

id sub_100044170(void *a1)
{
  id v1 = a1;
  sub_100043B28();

  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

void sub_1000441D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + qword_100064F70);
  id v2 = *(id *)(a1 + qword_100064F78);
  id v3 = [v2 aida_accountForiCloudAccount:v1];
  id v4 = objc_allocWithZone((Class)AAGrandSlamSigner);
  swift_bridgeObjectRetain();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithAccountStore:v2 grandSlamAccount:v3 appTokenID:v5];

  if (!v6) {
    __break(1u);
  }
}

uint64_t sub_1000442BC()
{
  return type metadata accessor for MSAPIResponse();
}

uint64_t sub_1000442C8()
{
  swift_getObjCClassMetadata();
  uint64_t result = sub_1000442BC();
  if (result)
  {
    return _swift_getObjCClassFromMetadata();
  }
  return result;
}

Class sub_100044310(void *a1)
{
  uint64_t v2 = type metadata accessor for URLRequest();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  NSString v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = a1;
  sub_100044408();

  Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return isa;
}

void sub_100044408()
{
  uint64_t v1 = v0;
  v24.receiver = v0;
  v24.super_class = (Class)type metadata accessor for APIRequest();
  id v2 = [super urlRequest];
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 mutableCopy];

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100022940(0, (unint64_t *)&qword_100064168);
    swift_dynamicCast();
    uint64_t v4 = *(void *)&v1[qword_100064F68];
    uint64_t v25 = v4;
    swift_getKeyPath();
    sub_10004A100(&qword_1000644E8, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_10004A100(&qword_1000644F0, (void (*)(uint64_t))type metadata accessor for APIRequestModel);
    sub_100036ACC();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    if (v25)
    {
      id v5 = sub_100043AC4();
      [v5 setUseAltDSID:1];

      id v6 = sub_100043AC4();
      unsigned __int8 v7 = [v6 signURLRequest:v23 isUserInitiated:1];

      if ((v7 & 1) == 0)
      {
        if (qword_100063EA0 != -1) {
          swift_once();
        }
        uint64_t v8 = type metadata accessor for Logger();
        sub_100008D9C(v8, (uint64_t)qword_100067A00);
        uint64_t v9 = Logger.logObject.getter();
        os_log_type_t v10 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v9, v10))
        {
          os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to sign grandslam request", v11, 2u);
          swift_slowDealloc();
        }
      }
      [v23 aa_addBasicAuthorizationHeaderWithAccount:*&v1[qword_100064F70] preferUsingPassword:0];
    }
    else
    {
      [v23 aa_addAuthTokenOrBasicAuthHeaderWithAccount:v1 preferUsingPassword:0];
    }
    uint64_t v25 = v4;
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_1000224D8();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v23 setHTTPMethod:v12];

    uint64_t v25 = v4;
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_10004A158();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    unint64_t v13 = v26;
    if (v26 >> 60 == 15)
    {
      Class isa = 0;
    }
    else
    {
      uint64_t v15 = v25;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_100009000(v15, v13);
    }
    [v23 setHTTPBody:isa];

    NSString v16 = String._bridgeToObjectiveC()();
    NSString v17 = String._bridgeToObjectiveC()();
    [v23 setValue:v16 forHTTPHeaderField:v17];

    id v18 = [objc_allocWithZone((Class)AADeviceInfo) init];
    id v19 = [v18 udid];

    NSString v20 = String._bridgeToObjectiveC()();
    [v23 setValue:v19 forHTTPHeaderField:v20];

    uint64_t v25 = v4;
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v22 = String._bridgeToObjectiveC()();
    [v23 setValue:v21 forHTTPHeaderField:v22];

    static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    __break(1u);
  }
}

void sub_100044A68()
{
}

uint64_t sub_100044AAC(void *a1, uint64_t a2)
{
  return sub_100045F8C(a1, a2, (uint64_t (*)(void, void))sub_1000498FC);
}

id sub_100044AC4()
{
  return sub_100045FEC((uint64_t (*)(void, void, void))type metadata accessor for APIRequest);
}

void sub_100044ADC(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  id v2 = *(void **)(a1 + qword_100064F88);
}

uint64_t type metadata accessor for APIRequest()
{
  return sub_100024E64();
}

uint64_t sub_100044B74()
{
  uint64_t result = type metadata accessor for MSResult();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100044C08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v5 = *(ValueMetadata **)(v2 + 80);
  Description = (void (**)(void, char *, ValueMetadata *))v5[-1].Description;
  unsigned __int8 v7 = (void *)__chkstk_darwin(a1);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  p_type = &stru_100061FF0.type;
  if ((uint64_t)[v7 statusCode] < 200 || (uint64_t)objc_msgSend(a1, "statusCode") > 299)
  {
    os_log_type_t v11 = self;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    v37[0] = 0;
    id v13 = [v11 JSONObjectWithData:isa options:0 error:v37];

    if (v13)
    {
      id v14 = v37[0];
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100008E28((uint64_t *)&unk_100063F40);
      if (swift_dynamicCast())
      {
        uint64_t v15 = v36;
        if (qword_100063EA0 != -1) {
          swift_once();
        }
        uint64_t v16 = type metadata accessor for Logger();
        sub_100008D9C(v16, (uint64_t)qword_100067A00);
        id v17 = a1;
        swift_bridgeObjectRetain_n();
        id v18 = v17;
        id v19 = Logger.logObject.getter();
        os_log_type_t v20 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = swift_slowAlloc();
          unint64_t v34 = (void *)swift_slowAlloc();
          v37[0] = v34;
          *(_DWORD *)uint64_t v21 = 134218243;
          unint64_t v35 = v5;
          id v22 = [v18 statusCode];

          uint64_t v36 = (uint64_t)v22;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          *(_WORD *)(v21 + 12) = 2081;
          v33[1] = v21 + 14;
          swift_bridgeObjectRetain();
          v33[2] = (char *)&type metadata for Any + 8;
          uint64_t v23 = Dictionary.description.getter();
          unint64_t v25 = v24;
          swift_bridgeObjectRelease();
          uint64_t v36 = sub_10004B330(v23, v25, (uint64_t *)v37);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%ld] Server error: %{private}s", (uint8_t *)v21, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          p_type = (char **)(&stru_100061FF0 + 16);
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        *(void *)a2 = [v18 p_type[328]];
        *(void *)(a2 + 8) = v15;
        *(void *)(a2 + 16) = 0;
        *(unsigned char *)(a2 + 24) = 1;
LABEL_20:
        type metadata accessor for MSResult();
        return swift_storeEnumTagMultiPayload();
      }
    }
    else
    {
      id v26 = v37[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRelease();
    }
    if (qword_100063EA0 != -1) {
      swift_once();
    }
    uint64_t v27 = type metadata accessor for Logger();
    sub_100008D9C(v27, (uint64_t)qword_100067A00);
    long long v28 = a1;
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 134217984;
      v37[0] = [v28 statusCode];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%ld] Server error: empty body", v31, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      uint64_t v29 = v28;
    }

    *(void *)a2 = [v28 statusCode];
    *(_OWORD *)(a2 + 8) = xmmword_10004F710;
    *(unsigned char *)(a2 + 24) = 0;
    goto LABEL_20;
  }
  if (v5 == &type metadata for EmptyAPIResponse)
  {
    swift_dynamicCast();
    type metadata accessor for MSResult();
  }
  else
  {
    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    swift_release();
    Description[4](a2, v9, v5);
    type metadata accessor for MSResult();
  }
  return swift_storeEnumTagMultiPayload();
}

void sub_100045534(uint64_t a1)
{
  if (*(void *)(sub_10004596C(a1) + 16))
  {
    sub_100008E28(&qword_100064E58);
    unint64_t v1 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    unint64_t v1 = &_swiftEmptyDictionarySingleton;
  }
  v10[0] = (uint64_t)v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_100048D24(v2, 1, v10);
  swift_bridgeObjectRelease();
  sub_1000490E4(v10[0]);
  swift_release();
  if (qword_100063EA0 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100008D9C(v3, (uint64_t)qword_100067A00);
  swift_retain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    v10[0] = swift_slowAlloc();
    *(_DWORD *)id v6 = 136380675;
    swift_retain();
    uint64_t v7 = Dictionary.description.getter();
    unint64_t v9 = v8;
    swift_release();
    sub_10004B330(v7, v9, v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Response headers: %{private}s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_1000457A4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  sub_100049A3C(v5);
  uint64_t v11 = v10;
  sub_100008F8C(v7, v9);

  return v11;
}

uint64_t sub_100045824(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  sub_100049C18(v7, v9, v11, a5);
  uint64_t v13 = v12;
  sub_100008F8C(v9, v11);

  return v13;
}

uint64_t sub_1000458B8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;

  sub_100049E00(v7, v10, v12, v13, v15);
  uint64_t v17 = v16;
  sub_100008F8C(v10, v12);

  return v17;
}

uint64_t sub_10004596C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v33 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & v2;
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  id v9 = _swiftEmptyArrayStorage;
  if (v5) {
    goto LABEL_31;
  }
LABEL_6:
  int64_t v10 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v10 < v6)
    {
      unint64_t v11 = *(void *)(v33 + 8 * v10);
      ++v8;
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 1;
      if (v10 + 1 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 2;
      if (v10 + 2 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 3;
      if (v10 + 3 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11)
      {
LABEL_21:
        unint64_t v5 = (v11 - 1) & v11;
        for (unint64_t i = __clz(__rbit64(v11)) + (v8 << 6); ; unint64_t i = v19 | (v8 << 6))
        {
          sub_10003ED24(*(void *)(a1 + 48) + 40 * i, (uint64_t)v30);
          sub_10000A6C0(*(void *)(a1 + 56) + 32 * i, (uint64_t)v31 + 8);
          v28[0] = v31[0];
          v28[1] = v31[1];
          uint64_t v29 = v32;
          v27[0] = v30[0];
          v27[1] = v30[1];
          sub_10003ED24((uint64_t)v27, (uint64_t)&v20);
          if (swift_dynamicCast())
          {
            long long v24 = v23;
            sub_10000A6C0((uint64_t)v28 + 8, (uint64_t)&v25);
          }
          else
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
          }
          sub_10000A72C((uint64_t)v27, &qword_100065130);
          if (*((void *)&v24 + 1))
          {
            long long v20 = v24;
            long long v21 = v25;
            long long v22 = v26;
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)sub_100047210(0, v9[2] + 1, 1, v9);
              id v9 = (void *)result;
            }
            unint64_t v15 = v9[2];
            unint64_t v14 = v9[3];
            if (v15 >= v14 >> 1)
            {
              uint64_t result = (uint64_t)sub_100047210((void *)(v14 > 1), v15 + 1, 1, v9);
              id v9 = (void *)result;
            }
            void v9[2] = v15 + 1;
            uint64_t v16 = &v9[6 * v15];
            long long v17 = v20;
            long long v18 = v22;
            v16[3] = v21;
            v16[4] = v18;
            v16[2] = v17;
            if (!v5) {
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t result = sub_10000A72C((uint64_t)&v24, &qword_100065138);
            if (!v5) {
              goto LABEL_6;
            }
          }
LABEL_31:
          unint64_t v19 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      int64_t v12 = v10 + 4;
      if (v12 < v6)
      {
        unint64_t v11 = *(void *)(v33 + 8 * v12);
        if (v11)
        {
          int64_t v8 = v12;
          goto LABEL_21;
        }
        while (1)
        {
          int64_t v8 = v12 + 1;
          if (__OFADD__(v12, 1)) {
            goto LABEL_34;
          }
          if (v8 >= v6) {
            break;
          }
          unint64_t v11 = *(void *)(v33 + 8 * v8);
          ++v12;
          if (v11) {
            goto LABEL_21;
          }
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_100045C50(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  v25[0] = *a1;
  v25[1] = v2;
  sub_10000A6C0(a2, (uint64_t)v26);
  v23[0] = v25[0];
  v23[1] = v2;
  sub_10000A6C0((uint64_t)v26, (uint64_t)&v24);
  Swift::String v3 = String.lowercased()();
  Swift::String v4 = String.lowercased()();
  if (v3._countAndFlagsBits == v4._countAndFlagsBits && v3._object == v4._object)
  {
    swift_bridgeObjectRetain_n();
    goto LABEL_8;
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    Swift::String v9 = String.lowercased()();
    Swift::String v10 = String.lowercased()();
    if (v9._countAndFlagsBits != v10._countAndFlagsBits || v9._object != v10._object)
    {
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      Swift::String v12 = String.lowercased()();
      Swift::String v13 = String.lowercased()();
      if (v12._countAndFlagsBits != v13._countAndFlagsBits || v12._object != v13._object)
      {
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v14) {
          goto LABEL_6;
        }
        Swift::String v15 = String.lowercased()();
        Swift::String v16 = String.lowercased()();
        if (v15._countAndFlagsBits != v16._countAndFlagsBits || v15._object != v16._object)
        {
          char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v17) {
            goto LABEL_6;
          }
          Swift::String v18 = String.lowercased()();
          Swift::String v19 = String.lowercased()();
          if (v18._countAndFlagsBits != v19._countAndFlagsBits || v18._object != v19._object)
          {
            char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v20) {
              goto LABEL_6;
            }
            Swift::String v21 = String.lowercased()();
            Swift::String v22 = String.lowercased()();
            if (v21._countAndFlagsBits != v22._countAndFlagsBits || v21._object != v22._object)
            {
              char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
              goto LABEL_9;
            }
          }
        }
      }
    }
LABEL_8:
    char v7 = 1;
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_6:
  char v7 = 1;
LABEL_10:
  sub_10000A72C((uint64_t)v25, &qword_100065120);
  sub_10000A72C((uint64_t)v23, &qword_100065120);
  return v7 & 1;
}

uint64_t sub_100045F74(void *a1, uint64_t a2)
{
  return sub_100045F8C(a1, a2, (uint64_t (*)(void, void))sub_100049FF8);
}

uint64_t sub_100045F8C(void *a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  return a3(*(void *)((swift_isaMask & *a1) + 0x50), *(void *)((swift_isaMask & *a1) + 0x58));
}

id sub_100045FD4()
{
  return sub_100045FEC((uint64_t (*)(void, void, void))type metadata accessor for MSAPIResponse);
}

id sub_100045FEC(uint64_t (*a1)(void, void, void))
{
  uint64_t v2 = (objc_class *)a1(0, *(void *)((swift_isaMask & *v1) + 0x50), *(void *)((swift_isaMask & *v1) + 0x58));
  v4.receiver = v1;
  v4.super_class = v2;
  return [super dealloc];
}

uint64_t sub_100046068(void *a1)
{
  unint64_t v1 = (char *)a1 + *(void *)((swift_isaMask & *a1) + 0x60);
  uint64_t v2 = type metadata accessor for MSResult();
  Swift::String v3 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t type metadata accessor for MSAPIResponse()
{
  return sub_100024E64();
}

uint64_t type metadata accessor for MSResult()
{
  return sub_100024E64();
}

uint64_t sub_10004614C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_100046154()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_1000461E8(void *a1, uint64_t *a2, uint64_t a3)
{
  Swift::String v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x19uLL) {
    uint64_t v5 = 25;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *a2;
    void *v3 = *a2;
    Swift::String v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unsigned int v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2) {
      unsigned int v9 = *(_DWORD *)a2 + 2;
    }
    if (v9 == 1)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      uint64_t v11 = a2[2];
      char v12 = *((unsigned char *)a2 + 24);
      sub_1000223B0();
      v3[1] = v10;
      v3[2] = v11;
      *((unsigned char *)v3 + 24) = v12;
      *((unsigned char *)v3 + v5) = 1;
    }
    else
    {
      (*(void (**)(void *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_100046318(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x19) {
    unint64_t v2 = 25;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return sub_1000223BC();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

uint64_t sub_100046420(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x19uLL) {
    uint64_t v4 = 25;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    uint64_t v10 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    uint64_t v11 = *((void *)a2 + 2);
    unsigned __int8 v12 = a2[24];
    sub_1000223B0();
    *(void *)(a1 + 8) = v10;
    *(void *)(a1 + 16) = v11;
    char v13 = 1;
    *(unsigned char *)(a1 + 24) = v12;
  }
  else
  {
    (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v13 = 0;
  }
  *(unsigned char *)(a1 + v4) = v13;
  return a1;
}

unsigned __int8 *sub_100046588(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x19uLL) {
      uint64_t v7 = 25;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      sub_1000223BC();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      uint64_t v18 = *((void *)a2 + 1);
      uint64_t v19 = *((void *)a2 + 2);
      unsigned __int8 v20 = a2[24];
      sub_1000223B0();
      *((void *)a1 + 1) = v18;
      *((void *)a1 + 2) = v19;
      char v21 = 1;
      a1[24] = v20;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v21 = 0;
    }
    a1[v7] = v21;
  }
  return a1;
}

_OWORD *sub_1000467C4(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x19uLL) {
    uint64_t v4 = 25;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *(_OWORD *)a2;
    *(_OWORD *)((char *)a1 + 9) = *(_OWORD *)(a2 + 9);
    char v10 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_100046904(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x19uLL) {
      uint64_t v7 = 25;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      sub_1000223BC();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_100046B28(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 25;
  if (*(void *)(v3 + 64) > 0x19uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_100046C5C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x19) {
    unint64_t v5 = 25;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x100046E24);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_100046E4C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 25;
  if (*(void *)(v2 + 64) > 0x19uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_100046F04(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x19uLL) {
    size_t v4 = 25;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_100046FDC(uint64_t a1)
{
  return sub_10000A788(a1);
}

void *sub_100047004(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_100008E28(&qword_1000646F8);
      unsigned int v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      uint64_t v10[2] = v8;
      v10[3] = 2 * v11 - 64;
      int v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= (void *)((char *)a4 + v8 + 32)) {
          memmove(v12, a4 + 4, v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unsigned int v10 = _swiftEmptyArrayStorage;
      int v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000496D8(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100047100(void *result, int64_t a2, char a3, void *a4)
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
      sub_100008E28((uint64_t *)&unk_100065150);
      unsigned int v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      uint64_t v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unsigned int v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unsigned int v10 = _swiftEmptyArrayStorage;
      unsigned int v13 = &_swiftEmptyArrayStorage[4];
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
    sub_1000497C0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100047210(void *result, int64_t a2, char a3, void *a4)
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
      sub_100008E28(&qword_1000644A8);
      unsigned int v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      uint64_t v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unsigned int v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10004992C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100047338(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_1000473DC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_10004740C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000481CC(a1, a2, v4);
}

unint64_t sub_100047484(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000482B0(a1, v4);
}

unint64_t sub_1000474C8(uint64_t a1)
{
  Hasher.init(_seed:)();
  type metadata accessor for CFString(0);
  sub_10004A100(&qword_100063F18, type metadata accessor for CFString);
  _CFObject.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();

  return sub_100048378(a1, v2);
}

unint64_t sub_10004757C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000484D4(a1, v4);
}

uint64_t sub_1000475C0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008E28(&qword_100064E58);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      char v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_10000A71C(v24, v35);
      }
      else
      {
        sub_10000A6C0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_10000A71C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000478C0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008E28(&qword_100064E50);
  char v6 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_10000A848(v37, *((unint64_t *)&v37 + 1));
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      int64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *int64_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v8;
  return result;
}

uint64_t sub_100047BD0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008E28(&qword_100064E68);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    int64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    int64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *int64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100047EF8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008E28(&qword_100065140);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v33 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v15 << 6);
      }
      else
      {
        int64_t v19 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v19 >= v12) {
          goto LABEL_34;
        }
        unint64_t v20 = v9[v19];
        ++v15;
        if (!v20)
        {
          int64_t v15 = v19 + 1;
          if (v19 + 1 >= v12) {
            goto LABEL_34;
          }
          unint64_t v20 = v9[v15];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v12)
            {
LABEL_34:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v33;
                goto LABEL_41;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v32;
              }
              uint64_t v3 = v33;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v15 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_43;
                }
                if (v15 >= v12) {
                  goto LABEL_34;
                }
                unint64_t v20 = v9[v15];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v15 = v21;
          }
        }
LABEL_21:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v15 << 6);
      }
      unint64_t v22 = *(void **)(*(void *)(v5 + 48) + 8 * v18);
      int64_t v23 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if (a2)
      {
        sub_10000A71C(v23, v34);
      }
      else
      {
        sub_10000A6C0((uint64_t)v23, (uint64_t)v34);
        id v24 = v22;
      }
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v7 + 40));
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v13 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v16 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v22;
      uint64_t result = (uint64_t)sub_10000A71C(v34, (_OWORD *)(*(void *)(v7 + 56) + 32 * v16));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_1000481CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000482B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10003ED24(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10001179C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100048378(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    char v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_10004A100(&qword_100063F18, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = static _CFObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = static _CFObject.== infix(_:_:)();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1000484D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100022940(0, (unint64_t *)&qword_100064E00);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

void *sub_1000485F0()
{
  uint64_t v1 = v0;
  sub_100008E28(&qword_100064E58);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10000A6C0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_10000A71C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1000487D8()
{
  uint64_t v1 = v0;
  sub_100008E28(&qword_100064E50);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_10000A848(v24, *((unint64_t *)&v24 + 1));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000489A0()
{
  uint64_t v1 = v0;
  sub_100008E28(&qword_100064E68);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    long long v24 = (void *)(*(void *)(v4 + 56) + v16);
    *long long v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100048B5C()
{
  uint64_t v1 = v0;
  sub_100008E28(&qword_100065140);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_10000A6C0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_10000A71C(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100048D24(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_10004A090(a1 + 32, (uint64_t)&v46);
  uint64_t v7 = v46;
  uint64_t v8 = v47;
  uint64_t v44 = v46;
  uint64_t v45 = v47;
  sub_10000A71C(v48, v43);
  int64_t v9 = (void *)*a3;
  unint64_t v11 = sub_10004740C(v7, v8);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_1000485F0();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    unint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    int64_t v21 = (uint64_t *)(v20[6] + 16 * v11);
    *int64_t v21 = v7;
    v21[1] = v8;
    sub_10000A71C(v43, (_OWORD *)(v20[7] + 32 * v11));
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    uint64_t v25 = v4 - 1;
    if (!v25) {
      return swift_bridgeObjectRelease_n();
    }
    for (uint64_t i = a1 + 80; ; i += 48)
    {
      sub_10004A090(i, (uint64_t)&v46);
      uint64_t v27 = v46;
      uint64_t v28 = v47;
      uint64_t v44 = v46;
      uint64_t v45 = v47;
      sub_10000A71C(v48, v43);
      unint64_t v29 = (void *)*a3;
      unint64_t v30 = sub_10004740C(v27, v28);
      uint64_t v32 = v29[2];
      BOOL v33 = (v31 & 1) == 0;
      BOOL v23 = __OFADD__(v32, v33);
      uint64_t v34 = v32 + v33;
      if (v23) {
        break;
      }
      char v35 = v31;
      if (v29[3] < v34)
      {
        sub_1000475C0(v34, 1);
        unint64_t v30 = sub_10004740C(v27, v28);
        if ((v35 & 1) != (v36 & 1)) {
          goto LABEL_25;
        }
      }
      if (v35) {
        goto LABEL_10;
      }
      uint64_t v37 = (void *)*a3;
      *(void *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      uint64_t v38 = (uint64_t *)(v37[6] + 16 * v30);
      *uint64_t v38 = v27;
      v38[1] = v28;
      sub_10000A71C(v43, (_OWORD *)(v37[7] + 32 * v30));
      uint64_t v39 = v37[2];
      BOOL v23 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v23) {
        goto LABEL_24;
      }
      _OWORD v37[2] = v40;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1000475C0(v14, a2 & 1);
  unint64_t v16 = sub_10004740C(v7, v8);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v19 = swift_allocError();
    swift_willThrow();
    uint64_t v49 = v19;
    swift_errorRetain();
    sub_100008E28(&qword_100065128);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_10000A788((uint64_t)v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v41._object = (void *)0x8000000100053FF0;
  v41._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v41);
  _print_unlocked<A, B>(_:_:)();
  v42._uint64_t countAndFlagsBits = 39;
  v42._object = (void *)0xE100000000000000;
  String.append(_:)(v42);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t *sub_1000490E4(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = (unint64_t *)isStackAllocationSafe;
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_10004923C((unint64_t *)((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_10004923C((unint64_t *)v7, v4, (uint64_t)v2);
    swift_slowDealloc();
  }
  return v2;
}

unint64_t *sub_10004923C(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = result;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_17:
    uint64_t v17 = *(void *)(a3 + 56);
    uint64_t v18 = (void *)(*(void *)(a3 + 48) + 16 * v13);
    uint64_t v19 = v18[1];
    v23[0] = *v18;
    v23[1] = v19;
    sub_10000A6C0(v17 + 32 * v13, (uint64_t)v22);
    swift_bridgeObjectRetain();
    char v20 = sub_100045C50(v23, (uint64_t)v22);
    sub_10000A788((uint64_t)v22);
    uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
    if (v3) {
      return result;
    }
    if (v20)
    {
      *(unint64_t *)((char *)v24 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      BOOL v14 = __OFADD__(v5++, 1);
      if (v14) {
        goto LABEL_30;
      }
    }
  }
  BOOL v14 = __OFADD__(v6++, 1);
  if (v14)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v6 >= v11) {
    return (unint64_t *)sub_100049414(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_16:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_17;
  }
  int64_t v16 = v6 + 1;
  if (v6 + 1 >= v11) {
    return (unint64_t *)sub_100049414(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v6 + 2;
  if (v6 + 2 >= v11) {
    return (unint64_t *)sub_100049414(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v6 + 3;
  if (v6 + 3 >= v11) {
    return (unint64_t *)sub_100049414(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
LABEL_15:
    int64_t v6 = v16;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      return (unint64_t *)sub_100049414(v24, a2, v5, a3);
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100049414(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_100008E28(&qword_100064E58);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v30) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v30) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v30) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v30) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v30) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10000A6C0(*(void *)(v4 + 56) + 32 * v13, (uint64_t)v33);
    sub_10000A71C(v33, v32);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v19;
    v28[1] = v18;
    uint64_t result = (uint64_t)sub_10000A71C(v32, (_OWORD *)(*(void *)(v8 + 56) + 32 * v23));
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

char *sub_1000496D8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    int64_t v6 = &__dst[v4];
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

uint64_t sub_1000497C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100008E28(&qword_1000641E8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_1000498CC()
{
}

void sub_1000498FC()
{
}

uint64_t sub_10004992C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      sub_100008E28(&qword_100064E60);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100049A3C(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = *(void *)((swift_isaMask & *v1) + 0x50);
  uint64_t v3 = type metadata accessor for MSResult();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&ObjectType - v5;
  uint64_t v7 = v1;
  sub_100044C08(a1, (uint64_t)v6);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v7[*(void *)((swift_isaMask & *(void *)v7) + 0x60)], v6, v3);

  id v8 = a1;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v10 = (objc_class *)type metadata accessor for MSAPIResponse();
  v14.receiver = v7;
  v14.super_class = v10;
  id v11 = [super initWithHTTPResponse:v8 data:isa ObjectType v13];

  if (!v11) {
    __break(1u);
  }
}

void sub_100049C18(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v16 = a4;
  v15[1] = swift_getObjectType();
  void v15[2] = *(void *)((swift_isaMask & *v4) + 0x50);
  uint64_t v6 = type metadata accessor for MSResult();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)v15 - v8;
  uint64_t v10 = v4;
  sub_100044C08(a1, (uint64_t)v9);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v10[*(void *)((swift_isaMask & *(void *)v10) + 0x60)], v9, v6);

  id v11 = a1;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v13 = (objc_class *)type metadata accessor for MSAPIResponse();
  v17.receiver = v10;
  v17.super_class = v13;
  id v14 = [super initWithHTTPResponse:v11 data:isa bodyIsPlist:v16 & 1];

  if (!v14) {
    __break(1u);
  }
}

void sub_100049E00(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[2] = a4;
  v17[3] = a5;
  swift_getObjectType();
  v17[1] = *(void *)((swift_isaMask & *v5) + 0x50);
  uint64_t v7 = type metadata accessor for MSResult();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v17 - v9;
  id v11 = v5;
  sub_100044C08(a1, (uint64_t)v10);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v11[*(void *)((swift_isaMask & *(void *)v11) + 0x60)], v10, v7);

  id v12 = a1;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v15 = (objc_class *)type metadata accessor for MSAPIResponse();
  v18.receiver = v11;
  v18.super_class = v15;
  id v16 = [super initWithHTTPResponse:v12 data:isa mediaType:v14];

  if (!v16) {
    __break(1u);
  }
}

void sub_100049FF8()
{
}

unint64_t sub_10004A028()
{
  unint64_t result = qword_100065118;
  if (!qword_100065118)
  {
    sub_100022940(255, &qword_100065110);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065118);
  }
  return result;
}

uint64_t sub_10004A090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008E28(&qword_100064E60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004A100(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10004A158()
{
  unint64_t result = qword_100064B00;
  if (!qword_100064B00)
  {
    sub_100008E6C(&qword_100064AF0);
    sub_100036D5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064B00);
  }
  return result;
}

ValueMetadata *type metadata accessor for MSError()
{
  return &type metadata for MSError;
}

ValueMetadata *type metadata accessor for EmptyAPIResponse()
{
  return &type metadata for EmptyAPIResponse;
}

uint64_t destroy for APIError()
{
  return sub_1000223BC();
}

uint64_t initializeWithCopy for APIError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  sub_1000223B0();
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  return a1;
}

uint64_t assignWithCopy for APIError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  sub_1000223B0();
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  sub_1000223BC();
  return a1;
}

__n128 initializeWithTake for APIError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for APIError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_1000223BC();
  return a1;
}

uint64_t getEnumTagSinglePayload for APIError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for APIError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APIError()
{
  return &type metadata for APIError;
}

uint64_t destroy for APIError.ErrorMessage()
{
  return sub_1000223BC();
}

uint64_t _s15icloudmailagent8APIErrorV12ErrorMessageOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1000223B0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for APIError.ErrorMessage(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1000223B0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000223BC();
  return a1;
}

__n128 initializeWithTake for APIError.ErrorMessage(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for APIError.ErrorMessage(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000223BC();
  return a1;
}

uint64_t getEnumTagSinglePayload for APIError.ErrorMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for APIError.ErrorMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10004A564(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10004A56C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for APIError.ErrorMessage()
{
  return &type metadata for APIError.ErrorMessage;
}

id sub_10004A5E0()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for MCCAgentConnectionManager()) init];
  qword_100067A48 = (uint64_t)result;
  return result;
}

id sub_10004A66C()
{
  uint64_t v1 = OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener;
  *(void *)&v0[OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener] = 0;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v2 = objc_allocWithZone((Class)NSXPCListener);
  unsigned int v3 = v0;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [v2 initWithMachServiceName:v4];

  uint64_t v6 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v5;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for MCCAgentConnectionManager();
  return [super init];
}

id sub_10004A75C()
{
  uint64_t v1 = OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener];
  if (v2)
  {
    id v3 = v2;
    [v3 invalidate];
    [v3 setDelegate:0];

    NSString v4 = *(void **)&v0[v1];
    *(void *)&v0[v1] = 0;
  }
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for MCCAgentConnectionManager();
  return [super dealloc];
}

id sub_10004A8B4()
{
  uint64_t v1 = OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener;
  id result = *(id *)(v0 + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener);
  if (result)
  {
    uint64_t v3 = v0;
    id result = [result serviceName];
    if (result)
    {
      NSString v4 = result;
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v7 = v6;

      if (qword_100063E98 != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      sub_100008D9C(v8, (uint64_t)qword_1000679E8);
      swift_bridgeObjectRetain();
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        *(_DWORD *)id v11 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_10004B330(v5, v7, &v14);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Resuming XPC listener for Mach service %s...", v11, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        id v12 = *(void **)(v3 + v1);
        if (!v12) {
          return [v12 resume:v13];
        }
      }
      else
      {

        swift_bridgeObjectRelease_n();
        id v12 = *(void **)(v3 + v1);
        if (!v12) {
          return [v12 resume:v13];
        }
      }
      [v12 setDelegate:v3, v13, v14];
      id v12 = *(void **)(v3 + v1);
      return [v12 resume:v13];
    }
  }
  return result;
}

uint64_t sub_10004AAC8(void *a1, void *a2)
{
  char v5 = sub_10004BA04(a2);
  if (v5)
  {
    unint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener);
    if (v6
      && (sub_10004BB10(),
          id v7 = a1,
          id v8 = v6,
          char v9 = static NSObject.== infix(_:_:)(),
          v7,
          v8,
          (v9 & 1) != 0))
    {
      if (qword_100063EB0 != -1) {
        swift_once();
      }
      [a2 setExportedObject:qword_100067A30];
      os_log_type_t v10 = self;
      id v11 = [v10 XPCInterface];
      [a2 setExportedInterface:v11];

      id v12 = [v10 XPCInterface];
      [a2 setRemoteObjectInterface:v12];

      uint64_t v34 = sub_10004AFEC;
      uint64_t v35 = 0;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v31 = 1107296256;
      uint64_t v32 = sub_10001C2B8;
      BOOL v33 = &unk_10005F8B0;
      uint64_t v13 = _Block_copy(&aBlock);
      [a2 setInterruptionHandler:v13];
      _Block_release(v13);
      uint64_t v34 = sub_10004AFF8;
      uint64_t v35 = 0;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v31 = 1107296256;
      uint64_t v32 = sub_10001C2B8;
      BOOL v33 = &unk_10005F8D8;
      uint64_t v14 = _Block_copy(&aBlock);
      [a2 setInvalidationHandler:v14];
      _Block_release(v14);
    }
    else
    {
      if (qword_100063E98 != -1) {
        swift_once();
      }
      uint64_t v22 = type metadata accessor for Logger();
      sub_100008D9C(v22, (uint64_t)qword_1000679E8);
      unint64_t v23 = a1;
      char v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v24, v25))
      {
        BOOL v26 = (uint8_t *)swift_slowAlloc();
        unint64_t v29 = (void *)swift_slowAlloc();
        uint64_t aBlock = v23;
        *(_DWORD *)BOOL v26 = 138412290;
        uint64_t v27 = v23;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *unint64_t v29 = v23;

        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Fatal error! Unknown XPC listener: %@", v26, 0xCu);
        sub_100008E28(&qword_1000651F0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
    }
    [a2 resume];
  }
  else
  {
    if (qword_100063E98 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100008D9C(v15, (uint64_t)qword_1000679E8);
    id v16 = a2;
    objc_super v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      uint64_t aBlock = v16;
      unint64_t v21 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v20 = v16;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Invalid entitlement on connection %@", v19, 0xCu);
      sub_100008E28(&qword_1000651F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
  return v5 & 1;
}

void sub_10004AFEC()
{
}

void sub_10004AFF8()
{
}

void sub_10004B004(const char *a1)
{
  if (qword_100063E98 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008D9C(v2, (uint64_t)qword_1000679E8);
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    NSString v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, a1, v4, 2u);
    swift_slowDealloc();
  }
}

uint64_t type metadata accessor for MCCAgentConnectionManager()
{
  return self;
}

uint64_t sub_10004B17C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10004B18C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_10004B1C8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  NSString v4 = *result;
  *NSString v4 = a4;
  char *result = v4 + 1;
  return result;
}

void sub_10004B1D8(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  id v8 = *a2;
  if (*a2)
  {
    *id v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10004B290(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10004B2B8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10004B330(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10004B330(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10004B404(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000A6C0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000A6C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000A788((uint64_t)v12);
  return v7;
}

uint64_t sub_10004B404(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10004B5C0(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10004B5C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10004B658(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10004B8B4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10004B8B4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10004B658(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10004B7D0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10004B7D0(uint64_t a1, uint64_t a2)
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
  sub_100008E28(&qword_1000646F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10004B838(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10004B8B4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008E28(&qword_1000646F8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10004BA04(void *a1)
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v3 = [a1 valueForEntitlement:v2];

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000FF80((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast() & 1) != 0 && (v5) {
      return 1;
    }
  }
  else
  {
    sub_10000FECC((uint64_t)v7);
  }
  return 0;
}

unint64_t sub_10004BB10()
{
  unint64_t result = qword_1000651F8;
  if (!qword_1000651F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000651F8);
  }
  return result;
}

uint64_t sub_10004BB50(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004BB60()
{
  return swift_release();
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

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.httpBody.setter()
{
  return URLRequest.httpBody.setter();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
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

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.path.setter()
{
  return URLComponents.path.setter();
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

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
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

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
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

Swift::String __swiftcall BlackPearlCategorizationVersion.getVersionString()()
{
  uint64_t v0 = BlackPearlCategorizationVersion.getVersionString()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getMajorVersion()()
{
  return BlackPearlCategorizationVersion.getMajorVersion()();
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getMinorVersion()()
{
  return BlackPearlCategorizationVersion.getMinorVersion()();
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getPatchVersion()()
{
  return BlackPearlCategorizationVersion.getPatchVersion()();
}

uint64_t type metadata accessor for BlackPearlCategorizationVersion()
{
  return type metadata accessor for BlackPearlCategorizationVersion();
}

uint64_t CategoryTS.rawValue.getter()
{
  return CategoryTS.rawValue.getter();
}

uint64_t type metadata accessor for CategoryTS()
{
  return type metadata accessor for CategoryTS();
}

uint64_t ReasonCode.rawValue.getter()
{
  return ReasonCode.rawValue.getter();
}

uint64_t type metadata accessor for ReasonCode()
{
  return type metadata accessor for ReasonCode();
}

uint64_t DecisionResult.reasonCodes.getter()
{
  return DecisionResult.reasonCodes.getter();
}

uint64_t DecisionResult.senderScore.getter()
{
  return DecisionResult.senderScore.getter();
}

uint64_t DecisionResult.subCategory.getter()
{
  return DecisionResult.subCategory.getter();
}

uint64_t DecisionResult.subCategoryTS.getter()
{
  return DecisionResult.subCategoryTS.getter();
}

uint64_t DecisionResult.timesensitive.getter()
{
  return DecisionResult.timesensitive.getter();
}

uint64_t DecisionResult.tsCategoryScore.getter()
{
  return DecisionResult.tsCategoryScore.getter();
}

uint64_t DecisionResult.blackPearlVersion.getter()
{
  return DecisionResult.blackPearlVersion.getter();
}

uint64_t DecisionResult.score.getter()
{
  return DecisionResult.score.getter();
}

uint64_t DecisionResult.tsScore.getter()
{
  return DecisionResult.tsScore.getter();
}

uint64_t DecisionResult.commerce.getter()
{
  return DecisionResult.commerce.getter();
}

uint64_t type metadata accessor for DecisionResult()
{
  return type metadata accessor for DecisionResult();
}

uint64_t DecisionRequest.init(senderName:senderEmail:emailSubject:receiverEmail:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)()
{
  return DecisionRequest.init(senderName:senderEmail:emailSubject:receiverEmail:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)();
}

uint64_t type metadata accessor for DecisionRequest()
{
  return type metadata accessor for DecisionRequest();
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlTreatmentId()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlTreatmentId()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall BlackPearlVersion.getBlackPearlDeploymentId()()
{
  return BlackPearlVersion.getBlackPearlDeploymentId()();
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlExperimentId()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlExperimentId()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall BlackPearlVersion.getBlackPearlRolloutDeploymentId()()
{
  return BlackPearlVersion.getBlackPearlRolloutDeploymentId()();
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlRolloutFactorPackId()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlRolloutFactorPackId()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlRolloutId()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlRolloutId()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlSenderModelVersion()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlSenderModelVersion()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlBreakthroughVersion()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlBreakthroughVersion()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlModelVersion()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlModelVersion()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlTSModelVersion()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlTSModelVersion()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlFinalRuleVersion()()
{
  uint64_t v0 = BlackPearlVersion.getBlackPearlFinalRuleVersion()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t BlackPearlVersion.getBlackPearlCategorizationVersion()()
{
  return BlackPearlVersion.getBlackPearlCategorizationVersion()();
}

uint64_t type metadata accessor for BlackPearlVersion()
{
  return type metadata accessor for BlackPearlVersion();
}

uint64_t static DecisionResultBuilder.buildCategorizationNotReadyResult()()
{
  return static DecisionResultBuilder.buildCategorizationNotReadyResult()();
}

uint64_t type metadata accessor for DecisionResultBuilder()
{
  return type metadata accessor for DecisionResultBuilder();
}

uint64_t dispatch thunk of MCCNLP.isPersonalEmail(domain:)()
{
  return dispatch thunk of MCCNLP.isPersonalEmail(domain:)();
}

uint64_t dispatch thunk of MCCNLP.getIABCategoryID(domain:)()
{
  return dispatch thunk of MCCNLP.getIABCategoryID(domain:)();
}

uint64_t dispatch thunk of MCCNLP.isModelPresetLoaded.getter()
{
  return dispatch thunk of MCCNLP.isModelPresetLoaded.getter();
}

uint64_t dispatch thunk of MCCNLP.predictCommerceEmail(decisionRequest:)()
{
  return dispatch thunk of MCCNLP.predictCommerceEmail(decisionRequest:)();
}

uint64_t dispatch thunk of MCCNLP.getBlackPearlCatVersion()()
{
  return dispatch thunk of MCCNLP.getBlackPearlCatVersion()();
}

uint64_t dispatch thunk of MCCNLP.scheduleImmediateDownload()()
{
  return dispatch thunk of MCCNLP.scheduleImmediateDownload()();
}

uint64_t MCCNLP.init()()
{
  return MCCNLP.init()();
}

uint64_t type metadata accessor for MCCNLP()
{
  return type metadata accessor for MCCNLP();
}

uint64_t static Category.getCategoryText(for:)()
{
  return static Category.getCategoryText(for:)();
}

uint64_t type metadata accessor for Category()
{
  return type metadata accessor for Category();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t noErr.getter()
{
  return noErr.getter();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t CurrentValueSubject.send(_:)()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t Just.init(_:)()
{
  return Just.init(_:)();
}

uint64_t Future.init(_:)()
{
  return Future.init(_:)();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t Publisher.delay<A>(for:tolerance:scheduler:options:)()
{
  return Publisher.delay<A>(for:tolerance:scheduler:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t type metadata accessor for NWInterface.InterfaceType()
{
  return type metadata accessor for NWInterface.InterfaceType();
}

uint64_t NWPathMonitor.pathUpdateHandler.setter()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t NWPathMonitor.init(requiredInterfaceType:)()
{
  return NWPathMonitor.init(requiredInterfaceType:)();
}

uint64_t NWPathMonitor.start(queue:)()
{
  return NWPathMonitor.start(queue:)();
}

uint64_t type metadata accessor for NWPathMonitor()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t static NWPath.Status.== infix(_:_:)()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t NWPath.status.getter()
{
  return NWPath.status.getter();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
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

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t DispatchTime.advanced(by:)()
{
  return DispatchTime.advanced(by:)();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t dispatch thunk of BackingData.setValue<A>(forKey:to:)()
{
  return dispatch thunk of BackingData.setValue<A>(forKey:to:)();
}

uint64_t dispatch thunk of ModelContext.save()()
{
  return dispatch thunk of ModelContext.save()();
}

uint64_t dispatch thunk of ModelContext.fetch<A>(_:)()
{
  return dispatch thunk of ModelContext.fetch<A>(_:)();
}

uint64_t type metadata accessor for ModelContext()
{
  return type metadata accessor for ModelContext();
}

uint64_t ModelContext.init(_:)()
{
  return ModelContext.init(_:)();
}

uint64_t ModelContainer.__allocating_init(for:configurations:)()
{
  return ModelContainer.__allocating_init(for:configurations:)();
}

uint64_t type metadata accessor for ModelContainer()
{
  return type metadata accessor for ModelContainer();
}

uint64_t FetchDescriptor.init(predicate:sortBy:)()
{
  return FetchDescriptor.init(predicate:sortBy:)();
}

uint64_t static PersistentModel.createBackingData<A>()()
{
  return static PersistentModel.createBackingData<A>()();
}

uint64_t PersistentModel.id.getter()
{
  return PersistentModel.id.getter();
}

uint64_t PersistentModel.hash(into:)()
{
  return PersistentModel.hash(into:)();
}

uint64_t PersistentModel.getValue<A>(forKey:)()
{
  return PersistentModel.getValue<A>(forKey:)();
}

uint64_t PersistentModel.setValue<A>(forKey:to:)()
{
  return PersistentModel.setValue<A>(forKey:to:)();
}

uint64_t static ModelConfiguration.GroupContainer.none.getter()
{
  return static ModelConfiguration.GroupContainer.none.getter();
}

uint64_t type metadata accessor for ModelConfiguration.GroupContainer()
{
  return type metadata accessor for ModelConfiguration.GroupContainer();
}

uint64_t static ModelConfiguration.CloudKitDatabase.automatic.getter()
{
  return static ModelConfiguration.CloudKitDatabase.automatic.getter();
}

uint64_t type metadata accessor for ModelConfiguration.CloudKitDatabase()
{
  return type metadata accessor for ModelConfiguration.CloudKitDatabase();
}

uint64_t type metadata accessor for ModelConfiguration()
{
  return type metadata accessor for ModelConfiguration();
}

uint64_t ModelConfiguration.init(_:schema:isStoredInMemoryOnly:allowsSave:groupContainer:cloudKitDatabase:)()
{
  return ModelConfiguration.init(_:schema:isStoredInMemoryOnly:allowsSave:groupContainer:cloudKitDatabase:)();
}

uint64_t Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)()
{
  return Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
}

uint64_t type metadata accessor for Schema.PropertyMetadata()
{
  return type metadata accessor for Schema.PropertyMetadata();
}

uint64_t type metadata accessor for Schema.Version()
{
  return type metadata accessor for Schema.Version();
}

uint64_t Schema.Version.init(_:_:_:)()
{
  return Schema.Version.init(_:_:_:)();
}

uint64_t static Schema.Attribute.Option.unique.getter()
{
  return static Schema.Attribute.Option.unique.getter();
}

uint64_t type metadata accessor for Schema.Attribute.Option()
{
  return type metadata accessor for Schema.Attribute.Option();
}

uint64_t type metadata accessor for Schema.Attribute()
{
  return type metadata accessor for Schema.Attribute();
}

uint64_t Schema.Attribute.init(_:originalName:hashModifier:)()
{
  return Schema.Attribute.init(_:originalName:hashModifier:)();
}

uint64_t type metadata accessor for Schema()
{
  return type metadata accessor for Schema();
}

uint64_t Schema.init(_:version:)()
{
  return Schema.init(_:version:)();
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

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
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

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
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

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
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

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return static Array._forceBridgeFromObjectiveC(_:result:)();
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

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Range<>.init(_:in:)()
{
  return Range<>.init(_:in:)();
}

uint64_t NSDictionary.init(dictionaryLiteral:)()
{
  return NSDictionary.init(dictionaryLiteral:)();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
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

uint64_t OS_dispatch_source.isCancelled.getter()
{
  return OS_dispatch_source.isCancelled.getter();
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

uint64_t type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return Optional._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.UTF8View.subscript.getter()
{
  return Substring.UTF8View.subscript.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
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

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
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

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
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

uint64_t dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter()
{
  return dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
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

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
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

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecCertificateCopyProperties()
{
  return _SecCertificateCopyProperties();
}

uint64_t SecCertificateCopySHA256Digest()
{
  return _SecCertificateCopySHA256Digest();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return _SecCertificateCopySubjectSummary(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

uint64_t SecGenerateCertificateRequest()
{
  return _SecGenerateCertificateRequest();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return _SecIdentityCopyPrivateKey(identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return _SecIdentityCreate();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return _SecIdentityGetTypeID();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return _SecKeyCreateRandomKey(parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return _SecKeyCreateWithData(keyData, attributes, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return _SecPolicyCreateBasicX509();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _MCCLogSystem()
{
  return __MCCLogSystem();
}

{
}

{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return _swift_dynamicCastUnknownClassUnconditional();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}